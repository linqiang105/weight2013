unit WeightUtil;

interface

uses SysUtils, Dialogs, Windows, XMLIntf, XMLDoc, DB, StrUtils, Controls, Forms, DateUtils,
  Graphics, Classes, ComObj, Variants, Jpeg, ADODB, RzPrgres;

type
  TWeightUtil = class
  private
  public
    class procedure XMLExport0(); //将所有称重记录导出成XML文件
    class procedure XMLExport1();
    class function getXmlData(glideNo: string): string; //输出XML
    //统计记录数，今日记录及今日净重及实重
    class function getStaticInfo(var count: Integer; var todayCount: integer; var todayNet: Double; var todayReal: Double): boolean;
    //显示本月记录
    class function showToMonthRecord(): boolean; overload;
    class function showToMonthRecord(types: Integer): Boolean; overload;
    //显示本日记录
    class function showTodayRecord(): Boolean; overload;
    class function showTodayRecord(types: Integer): Boolean; overload;
    //显示本周记录
    class function showToWeekRecord(types: Integer): Boolean;
    //显示本季记录
    class function showToSeasonRecord(types: Integer): Boolean;
    //显示本年记录
    class function showToYearRecord(types: Integer): Boolean;
    //显示历史记录 , 0为显示所有历史记录，1为显示历史毛重，2为显示历史皮重
    class function showHistoryRecord(t: Integer = 0): Boolean;
    //删除今天之外的历史记录
    class procedure DelHistory;
    //过空车时查找是否有过往皮重
    class function hasLastTare(car: string; var tareGlideNo: string): Boolean;
    //如果选是,就更新该皮重
    class procedure updateLastTare(tareGlideNo: string; Tare: string);
    //过重车时查找是否有过往毛重
    class function hasLastGross(car: string; var grossGlideNo: string): Boolean;
    //如果选是,就更新该毛重
    class procedure updateLastGross(grossGlideNo: string; Gross: string);
    //预览磅单的时候,先查询第一台记录
    class procedure getFirstRecord();
    //保存过磅照片
    class procedure saveWeightImg(weight_type, weight_id, weight_field: string;
      weightType: Char);
    //如果SaveType为True,那么就存储在本地磁盘上
    class procedure saveWeightImgEx(weight_type, weight_id, weight_field: string;
      saveType: Boolean; weightType: Char);
    //删除照片
    class function deletePhoto(glideNo: string): Boolean;
    //清空称重信息表,称重照片表,后台记录表,日志表
    class function clearWeightInfo(): Boolean;
    class function clearUserInfo(): Boolean;
    class function clearCar(): Boolean;
    class function clearFaHuo(): Boolean;
    class function clearShouHuo(): Boolean;
    class function clearGoods(): Boolean;
    class function clearSpec(): Boolean;
    class function clearBackup1(): Boolean;
    class function clearBackup2(): Boolean;
    class function clearBackup3(): Boolean;
    class function clearBackup4(): Boolean;
    class function clearBackup5(): Boolean;
    class function clearBackup10(): Boolean;
    class function clearBackup11(): Boolean;
    class function clearBackup12(): Boolean;
    class function clearBackup13(): Boolean;
    class function clearBackup14(): Boolean;
    class function clearBackRecord(): Boolean;
    class function clearLog(): Boolean;
    class function clearTao(): Boolean;
    class function exportPhoto(): Boolean; //导出照片
    class function getMaxGlideNo(): string; //取最大流水号
    class function TableExists(tn: string): boolean; //是否存在表
    class function ImportExcel(f: string; pb: TRzProgressBar): Boolean;
    class function showPhoto(no: string): Boolean; //显示照片
    class function showPhotoEx(no: string; saveType: Boolean): Boolean;
    class function saveBackRecord(w: string): Boolean; //保存后台记录
    class function updateTimeOut(carNo: string): Boolean; //两次过磅是否超时
    class function getDatabaseSpace(databaseInUse: Boolean = True): Double; //取数据库文件大小
    class function genMailReport(reportType: Integer): Boolean; //生成今日记录
    class function updateLastBackRecord(): Boolean; //把最后一条后台记录变为已过磅标志

    class function getInvalidMaxGlideNo(): string;
    class function getExceedMaxGlideNo(): string;

    class function moveExceedRecord(): Boolean; //移走超限记录
    class function moveDeletedRecord(glideNo: string): Boolean; //作废记录
    class function backMoveDeletedRecord(glideNo: string): Boolean; //还原作废记录

    class function getStaticValue(rule1, rule2, group: Integer;
      carNo, faHuo, shouHuo, goods, spec, backup1, backup2, backup3, backup4, backup5,
      backup10, backup11, backup12, backup13, backup14: string;
      gross, tare, net, reald, sum, quanter, backup6, backup7, backup8, backup9,
      backup15, backup16, backup17, backup18: string): Double;

    class function checkPicCount(picCount: Integer): Boolean;

    class function getShouHuoTodayStatic(var sl: TStringList): Boolean;
  end;

implementation

uses QueryDM, Main, WeightRecord, PhotoUnit, CommonUtil,
  OtherUtil, PrepareUtil;

class procedure TWeightUtil.DelHistory;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'delete from 称重信息 where '
      + '(((毛重=0) and (净重=0)) or ((皮重=0) and (净重=0))) '
      + 'and ((毛重时间<:today1) or (皮重时间<:today2))';
    Parameters.ParamByName('today1').Value := Date();
    Parameters.ParamByName('today2').Value := Date();
    ExecSQL;
  end;
end;

class function TWeightUtil.deletePhoto(glideNo: string): Boolean;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'delete from tbl_weight_img where weight_id = :id';
    Parameters.ParamByName('id').Value := glideNo;
    ExecSQL;
  end;
end;

class function TWeightUtil.exportPhoto: Boolean;
var rec_id, glide_no, bk_path: string;
  del_photo: Boolean;
begin
  if QueryDataModule.WeightMaintainQuery.IsEmpty then
  begin
    Result := False;
    Exit;
  end;
  bk_path := TCommonUtil.SelectFolder(Application.Handle, '请选择目录!');
  if bk_path = '' then
  begin
    Result := False;
    Exit;
  end;
  del_photo := MessageDlg('是否同时删除这些照片?', mtConfirmation, [mbOK, mbCancel], 0) = mrOK;

  with QueryDataModule.WeightMaintainQuery do
  begin
    First;
    while not Eof do
    begin
      rec_id := FieldByName('序号').AsString;
      glide_no := FieldByName('流水号').AsString;
      //查看是否存在這條記錄，有的話就先導出到指定文件夾，然後從數據庫中刪除
      with QueryDataModule.ADOQExec do
      begin
        Close;
        SQL.Text := 'select * from tbl_weight_img where weight_id = :weight_id';
        Parameters.ParamByName('weight_id').Value := glide_no;
        Open;
        if not isEmpty then
        begin
          if not DirectoryExists(bk_path + '\' + glide_no) then
            CreateDir(bk_path + '\' + glide_no);
          //導出這6張照片
          if not FieldByName('gross_img1').IsNull then
            TBlobField(FieldByName('gross_img1') as TBlobField).SaveToFile(
              bk_path + '\' + glide_no + '\P1.jpg');
          if not FieldByName('gross_img2').IsNull then
            TBlobField(FieldByName('gross_img2') as TBlobField).SaveToFile(
              bk_path + '\' + glide_no + '\P2.jpg');

          if not FieldByName('tare_img1').IsNull then
            TBlobField(FieldByName('tare_img1') as TBlobField).SaveToFile(
              bk_path + '\' + glide_no + '\P3.jpg');
          if not FieldByName('tare_img2').IsNull then
            TBlobField(FieldByName('tare_img2') as TBlobField).SaveToFile(
              bk_path + '\' + glide_no + '\P4.jpg');

          //刪除這條記錄
          if del_photo then
          begin
            Close;
            SQL.Text := 'delete from tbl_weight_img where weight_id = :weight_id';
            Parameters.ParamByName('weight_id').Value := glide_no;
            ExecSQL;
          end;
        end;
      end;
      Application.ProcessMessages;
      Next;
    end;
  end;

  Result := True;
end;

class procedure TWeightUtil.getFirstRecord;
begin
  with QueryDataModule.ADOQueryPrintTicket do
  begin
    Close;
    SQL.Text := 'select top 1 序号,流水号,车号,过磅类型,发货单位,收货单位,'
      + '货名,规格,毛重,皮重,净重,扣重,实重,单价,金额,折方系数,方量,过磅费,'
      + '毛重司磅员,皮重司磅员,毛重磅号,皮重磅号,毛重时间,皮重时间,'
      + '一次过磅时间,二次过磅时间,更新人,更新时间,备注,打印次数,上传否,'
      + '备用1,备用2,备用3,备用4,备用5,备用6,备用7,备用8,备用9,'
      + '备用10,备用11,备用12,备用13,备用14,备用15,备用16,备用17,备用18,'
      + '0 as 当前金额,0 as 信用额度 from 称重信息';
    Open;
  end;
end;

class function TWeightUtil.getStaticInfo(var count, todayCount: integer;
  var todayNet, todayReal: Double): boolean;
begin
  with QueryDataModule.ADOQExec do
  begin
    count := 0;
    todayCount := 0;
    todayNet := 0;
    todayReal := 0;

    Close;
    SQL.Clear;
    SQL.Add('select count(序号) as count1 from 称重信息');
    Open;
    if not IsEmpty then
      count := FieldByName('count1').AsInteger;

    SQL.Clear;
    SQL.Add('Select count(序号) as 记录数,sum(净重) as 总净重,'
      + 'sum(实重) as 总实重 From 称重信息 Where (毛重时间 between :grossDate1 and :grossDate2) '
      + 'Or (皮重时间 between :tareDate1 and :tareDate2)');
    Parameters.ParamByName('grossDate1').Value := FormatDateTime('yyyy-mm-dd 00:00:00', Date);
    Parameters.ParamByName('grossDate2').Value := FormatDateTime('yyyy-mm-dd 23:59:59', Date);
    Parameters.ParamByName('tareDate1').Value := FormatDateTime('yyyy-mm-dd 00:00:00', Date);
    Parameters.ParamByName('tareDate2').Value := FormatDateTime('yyyy-mm-dd 23:59:59', Date);
    Open;
    if FieldByName('记录数').AsInteger <> 0 then
      todayCount := FieldByName('记录数').AsInteger;
    if FieldByName('总净重').AsFloat <> 0 then
      todayNet := FieldByName('总净重').AsFloat;
    if FieldByName('总实重').AsFloat <> 0 then
      todayReal := FieldByName('总实重').AsFloat;
  end;
  Result := True;
end;


class function TWeightUtil.hasLastGross(car: string;
  var grossGlideNo: string): Boolean;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'select 流水号 from 称重信息 where (车号=:car) and (毛重<>0) and (皮重=0) and (净重=0)';
    Parameters.ParamByName('car').Value := car;
    Open;
    if not IsEmpty then
    begin
      grossGlideNo := FieldByName('流水号').AsString;
      result := True;
    end
    else
      result := False;
  end;
end;

class function TWeightUtil.hasLastTare(car: string;
  var tareGlideNo: string): Boolean;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'select 流水号 from 称重信息 where (车号=:car) and (毛重=0) and (皮重<>0) and (净重=0)';
    Parameters.ParamByName('car').Value := car;
    Open;
    if not IsEmpty then
    begin
      tareGlideNo := FieldByName('流水号').AsString;
      result := True;
    end
    else
      result := False;
  end;
end;

class procedure TWeightUtil.saveWeightImg(weight_type, weight_id, weight_field: string; weightType: Char);
var p1, p2, p3, p4: string;
begin
  {if not (FileExists(ExtractFilePath(ParamStr(0)) + 'P0.jpg') and FileExists(ExtractFilePath(ParamStr(0)) + 'P0.jpg')) then
    Exit; }
  if weightType = 'A' then
  begin
    p1 := ExtractFilePath(ParamStr(0)) + 'P0.jpg';
    p2 := ExtractFilePath(ParamStr(0)) + 'P1.jpg';
    p3 := ExtractFilePath(ParamStr(0)) + 'P2.jpg';
    p4 := ExtractFilePath(ParamStr(0)) + 'P3.jpg';
  end
  else
  begin
    p3 := ExtractFilePath(ParamStr(0)) + 'P0.jpg';
    p4 := ExtractFilePath(ParamStr(0)) + 'P1.jpg';
    p1 := ExtractFilePath(ParamStr(0)) + 'P2.jpg';
    p2 := ExtractFilePath(ParamStr(0)) + 'P3.jpg';
  end;
  with QueryDataModule.ADOQExec do
  begin
    Close;
    if weight_type = 'A' then
    begin
      if weight_field = 'G' then
      begin
        SQL.Text := 'insert into tbl_weight_img(weight_id,gross_img1,gross_img2,gross_img3,gross_img4) '
          + 'values (:weight_id,:gross_img1,:gross_img2,:gross_img3,:gross_img4)';
        Parameters.ParamByName('weight_id').Value := weight_id;
        if FileExists(p1) then
          Parameters.ParamByName('gross_img1').LoadFromFile(p1, ftBlob)
        else
          Parameters.ParamByName('gross_img1').Value := '';
        if FileExists(p2) then
          Parameters.ParamByName('gross_img2').LoadFromFile(p2, ftBlob)
        else
          Parameters.ParamByName('gross_img2').Value := '';
        if FileExists(p3) then
          Parameters.ParamByName('gross_img3').LoadFromFile(p3, ftBlob)
        else
          Parameters.ParamByName('gross_img3').Value := '';
        if FileExists(p4) then
          Parameters.ParamByName('gross_img4').LoadFromFile(p4, ftBlob)
        else
          Parameters.ParamByName('gross_img4').Value := '';
      end
      else if weight_field = 'T' then
      begin
        SQL.Text := 'insert into tbl_weight_img(weight_id,'
          + 'tare_img1,tare_img2,tare_img3,tare_img4) values (:weight_id,'
          + ':tare_img1,:tare_img2,:tare_img3,:tare_img4)';
        Parameters.ParamByName('weight_id').Value := weight_id;
        if FileExists(p1) then
          Parameters.ParamByName('tare_img1').LoadFromFile(p1, ftBlob)
        else
          Parameters.ParamByName('tare_img1').Value := '';
        if FileExists(p2) then
          Parameters.ParamByName('tare_img2').LoadFromFile(p2, ftBlob)
        else
          Parameters.ParamByName('tare_img2').Value := '';
        if FileExists(p3) then
          Parameters.ParamByName('tare_img3').LoadFromFile(p3, ftBlob)
        else
          Parameters.ParamByName('tare_img3').Value := '';
        if FileExists(p4) then
          Parameters.ParamByName('tare_img4').LoadFromFile(p4, ftBlob)
        else
          Parameters.ParamByName('tare_img4').Value := '';
      end
      else if weight_field = 'A' then
      begin
        SQL.Text := 'insert into tbl_weight_img(weight_id,gross_img1,gross_img2,'
          + 'gross_img3,gross_img4,tare_img1,tare_img2,tare_img3,tare_img4) '
          + 'values (:weight_id,:gross_img1,:gross_img2,:gross_img3,:gross_img4,'
          + ':tare_img1,:tare_img2,:tare_img3,:tare_img4)';
        Parameters.ParamByName('weight_id').Value := weight_id;
        if FileExists(p1) then
          Parameters.ParamByName('gross_img1').LoadFromFile(p1, ftBlob)
        else
          Parameters.ParamByName('gross_img1').Value := '';
        if FileExists(p2) then
          Parameters.ParamByName('gross_img2').LoadFromFile(p2, ftBlob)
        else
          Parameters.ParamByName('gross_img2').Value := '';
        if FileExists(p3) then
          Parameters.ParamByName('gross_img3').LoadFromFile(p3, ftBlob)
        else
          Parameters.ParamByName('gross_img3').Value := '';
        if FileExists(p4) then
          Parameters.ParamByName('gross_img4').LoadFromFile(p4, ftBlob)
        else
          Parameters.ParamByName('gross_img4').Value := '';
        if FileExists(p1) then
          Parameters.ParamByName('tare_img1').LoadFromFile(p1, ftBlob)
        else
          Parameters.ParamByName('tare_img1').Value := '';
        if FileExists(p2) then
          Parameters.ParamByName('tare_img2').LoadFromFile(p2, ftBlob)
        else
          Parameters.ParamByName('tare_img2').Value := '';
        if FileExists(p3) then
          Parameters.ParamByName('tare_img3').LoadFromFile(p3, ftBlob)
        else
          Parameters.ParamByName('tare_img3').Value := '';
        if FileExists(p4) then
          Parameters.ParamByName('tare_img4').LoadFromFile(p4, ftBlob)
        else
          Parameters.ParamByName('tare_img4').Value := '';
      end;
    end
    else if weight_type = 'U' then
    begin
      if weight_field = 'G' then
      begin
        SQL.Text := 'update tbl_weight_img set gross_img1=:gross_img1,'
          + 'gross_img2=:gross_img2,gross_img3=:gross_img3,gross_img4=:gross_img4 '
          + ' where weight_id = :weight_id';
        if FileExists(p1) then
          Parameters.ParamByName('gross_img1').LoadFromFile(p1, ftBlob)
        else
          Parameters.ParamByName('gross_img1').Value := '';
        if FileExists(p2) then
          Parameters.ParamByName('gross_img2').LoadFromFile(p2, ftBlob)
        else
          Parameters.ParamByName('gross_img2').Value := '';
        if FileExists(p3) then
          Parameters.ParamByName('gross_img3').LoadFromFile(p3, ftBlob)
        else
          Parameters.ParamByName('gross_img3').Value := '';
        if FileExists(p4) then
          Parameters.ParamByName('gross_img4').LoadFromFile(p4, ftBlob)
        else
          Parameters.ParamByName('gross_img4').Value := '';
        Parameters.ParamByName('weight_id').Value := weight_id;
      end
      else if weight_field = 'T' then
      begin
        SQL.Text := 'update tbl_weight_img set tare_img1=:tare_img1,'
          + 'tare_img2=:tare_img2,tare_img3=:tare_img3,tare_img4=:tare_img4 '
          + ' where weight_id = :weight_id';
        if FileExists(p1) then
          Parameters.ParamByName('tare_img1').LoadFromFile(p1, ftBlob)
        else
          Parameters.ParamByName('tare_img1').Value := '';
        if FileExists(p2) then
          Parameters.ParamByName('tare_img2').LoadFromFile(p2, ftBlob)
        else
          Parameters.ParamByName('tare_img2').Value := '';
        if FileExists(p3) then
          Parameters.ParamByName('tare_img3').LoadFromFile(p3, ftBlob)
        else
          Parameters.ParamByName('tare_img3').Value := '';
        if FileExists(p4) then
          Parameters.ParamByName('tare_img4').LoadFromFile(p4, ftBlob)
        else
          Parameters.ParamByName('tare_img4').Value := '';
        Parameters.ParamByName('weight_id').Value := weight_id;
      end;
    end;
    ExecSQL;
  end;
  if FileExists(p1) then DeleteFile(PAnsiChar(p1));
  if FileExists(p2) then DeleteFile(PAnsiChar(p2));
  if FileExists(p3) then DeleteFile(PAnsiChar(p3));
  if FileExists(p4) then DeleteFile(PAnsiChar(p4));

end;

class function TWeightUtil.showHistoryRecord(t: Integer): Boolean;
begin
  with QueryDataModule.WeightMaintainQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * From 称重信息 where (1=1)');
    if MainForm.systemConfig.readLocal then
    begin
      SQL.Add(' and (毛重磅号=:addr)');
      Parameters.ParamByName('addr').Value := MainForm.systemConfig.addr;
    end;
    if t = 0 then
      SQL.Add(' and (净重=0)')
    else if t = 1 then
      SQL.Add(' and (净重<>0)');
    SQL.Add(' order by 流水号 desc');
    Open;
  end;
  Result := True;
end;

class function TWeightUtil.showTodayRecord: Boolean;
begin
  with QueryDataModule.WeightMaintainQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * From 称重信息 where (毛重时间 between :grossDate1 and :grossDate2) '
      + 'Or (皮重时间 between :tareDate1 and :tareDate2) Order by 流水号 desc');
    if MainForm.systemConfig.readLocal then
    begin
      SQL.Add(' and (毛重磅号=:addr)');
      Parameters.ParamByName('addr').Value := MainForm.systemConfig.addr;
    end;
    Parameters.ParamByName('grossDate1').Value := FormatDateTime('yyyy-mm-dd 00:00:00', Date);
    Parameters.ParamByName('grossDate2').Value := FormatDateTime('yyyy-mm-dd 23:59:59', Date);
    Parameters.ParamByName('tareDate1').Value := FormatDateTime('yyyy-mm-dd 00:00:00', Date);
    Parameters.ParamByName('tareDate2').Value := FormatDateTime('yyyy-mm-dd 23:59:59', Date);
    Open;
  end;
  Result := True;
end;

class function TWeightUtil.showToMonthRecord: boolean;
begin
  with QueryDataModule.WeightMaintainQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * From 称重信息 where ( 毛重时间 >= :grossdate) or '
      + '(皮重时间>=:taredate)');
    if MainForm.systemConfig.readLocal then
    begin
      SQL.Add(' and (毛重磅号=:addr)');
      Parameters.ParamByName('addr').Value := MainForm.systemConfig.addr;
    end;
    Parameters.ParamByName('grossdate').Value := FormatDateTime('yyyy-mm-01 00:00:00',
      Date);
    Parameters.ParamByName('taredate').Value := FormatDateTime('yyyy-mm-01 00:00:00',
      Date);
    Open;
  end;
  Result := True;
end;


class function TWeightUtil.showToMonthRecord(types: Integer): Boolean;
begin
  with QueryDataModule.WeightMaintainQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * From 称重信息');
    SQL.Add(' where ((毛重时间 between :grossStartDate and :grossEndDate)');
    SQL.Add(' or (皮重时间 between :tareStartDate and :tareEndDate))');
    if MainForm.systemConfig.readLocal then
    begin
      SQL.Add(' and (毛重磅号=:addr)');
      Parameters.ParamByName('addr').Value := MainForm.systemConfig.addr;
    end;
    if types = 0 then
      SQL.Add(' and (净重=0)')
    else if types = 1 then
      SQL.Add(' and (净重<>0)');
    SQL.Add(' order by 流水号 desc');
    Parameters.ParamByName('grossStartDate').Value := StartOfTheMonth(Date);
    Parameters.ParamByName('grossEndDate').Value := EndOfTheMonth(Date);
    Parameters.ParamByName('tareStartDate').Value := StartOfTheMonth(Date);
    Parameters.ParamByName('tareEndDate').Value := EndOfTheMonth(Date);
    Open;
  end;
  Result := True;
end;

class function TWeightUtil.showToSeasonRecord(types: Integer): Boolean;
var
  y, m: Word;
  T1, T2: TDateTime;
begin
  y := YearOf(Now);
  m := MonthOf(Now);
  Dec(m, (m - 1) mod 3);
  T1 := DateOf(StartOfAMonth(y, m));
  T2 := DateOf(EndOfAMonth(y, m + 2));

  with QueryDataModule.WeightMaintainQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * From 称重信息');
    SQL.Add(' where ((毛重时间 between :grossStartDate and :grossEndDate)');
    SQL.Add(' or (皮重时间 between :tareStartDate and :tareEndDate))');
    if MainForm.systemConfig.readLocal then
    begin
      SQL.Add(' and (毛重磅号=:addr)');
      Parameters.ParamByName('addr').Value := MainForm.systemConfig.addr;
    end;
    if types = 0 then
      SQL.Add(' and (净重=0)')
    else if types = 1 then
      SQL.Add(' and (净重<>0)');
    SQL.Add(' order by 流水号 desc');
    Parameters.ParamByName('grossStartDate').Value := T1;
    Parameters.ParamByName('grossEndDate').Value := T2;
    Parameters.ParamByName('tareStartDate').Value := T1;
    Parameters.ParamByName('tareEndDate').Value := T2;
    Open;
  end;
  Result := True;
end;

class function TWeightUtil.showToWeekRecord(types: Integer): Boolean;
begin
  with QueryDataModule.WeightMaintainQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * From 称重信息');
    SQL.Add(' where ((毛重时间  between :grossStartDate and :grossEndDate)');
    SQL.Add(' or (皮重时间 between :tareStartDate and :tareEndDate))');
    if MainForm.systemConfig.readLocal then
    begin
      SQL.Add(' and (毛重磅号=:addr)');
      Parameters.ParamByName('addr').Value := MainForm.systemConfig.addr;
    end;
    if types = 0 then
      SQL.Add(' and (净重=0)')
    else if types = 1 then
      SQL.Add(' and (净重<>0)');
    SQL.Add(' order by 流水号 desc');
    Parameters.ParamByName('grossStartDate').Value := StartOfTheWeek(Date);
    Parameters.ParamByName('grossEndDate').Value := EndOfTheWeek(Date);
    Parameters.ParamByName('tareStartDate').Value := StartOfTheWeek(Date);
    Parameters.ParamByName('tareEndDate').Value := EndOfTheWeek(Date);
    Open;
  end;
  Result := True;
end;

class function TWeightUtil.showToYearRecord(types: Integer): Boolean;
begin
  with QueryDataModule.WeightMaintainQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * From 称重信息');
    SQL.Add(' where ((毛重时间 between :grossStartDate and :grossEndDate)');
    SQL.Add(' or (皮重时间 between :tareStartDate and :tareEndDate))');
    if MainForm.systemConfig.readLocal then
    begin
      SQL.Add(' and (毛重磅号=:addr)');
      Parameters.ParamByName('addr').Value := MainForm.systemConfig.addr;
    end;
    if types = 0 then
      SQL.Add(' and (净重=0)')
    else if types = 1 then
      SQL.Add(' and (净重<>0)');
    SQL.Add(' order by 流水号 desc');
    Parameters.ParamByName('grossStartDate').Value := StartOfTheYear(Date);
    Parameters.ParamByName('grossEndDate').Value := EndOfTheYear(Date);
    Parameters.ParamByName('tareStartDate').Value := StartOfTheYear(Date);
    Parameters.ParamByName('tareEndDate').Value := EndOfTheYear(Date);
    Open;
  end;
  Result := True;
end;

class procedure TWeightUtil.updateLastGross(grossGlideNo: string; Gross: string);
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'update 称重信息 set 毛重=:gross,'
      + '毛重时间=:gross_time where 流水号=:glideNo';
    Parameters.ParamByName('gross').Value := StrToFloatDef(Gross, 0);
    Parameters.ParamByName('gross_time').Value := Now;
    Parameters.ParamByName('glideNo').Value := grossGlideNo;
    ExecSQL;
  end;
end;

class procedure TWeightUtil.updateLastTare(tareGlideNo: string; Tare: string);
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'update 称重信息 set 皮重=:tare,'
      + '皮重时间=:tare_time where 流水号=:glideNo';
    Parameters.ParamByName('tare').Value := StrToFloatDef(Tare, 0);
    Parameters.ParamByName('tare_time').Value := Now;
    Parameters.ParamByName('glideNo').Value := tareGlideNo;
    ExecSQL;
  end;
end;

class function TWeightUtil.showTodayRecord(types: Integer): Boolean;
begin
  with QueryDataModule.WeightMaintainQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * From 称重信息');
    SQL.Add(' where ((毛重时间 between :grossDate1 and :grossDate2)');
    SQL.Add(' or (皮重时间 between :tareDate1 and :tareDate2))');
    if MainForm.systemConfig.readLocal then
    begin
      SQL.Add(' and (毛重磅号=:addr)');
      Parameters.ParamByName('addr').Value := MainForm.systemConfig.addr;
    end;
    if types = 0 then
      SQL.Add(' and (净重=0)')
    else if types = 1 then
      SQL.Add(' and (净重<>0)');
    SQL.Add(' order by 流水号 desc');
    Parameters.ParamByName('grossDate1').Value := FormatDateTime('yyyy-mm-dd 00:00:00', Date);
    Parameters.ParamByName('grossDate2').Value := FormatDateTime('yyyy-mm-dd 23:59:59', Date);
    Parameters.ParamByName('tareDate1').Value := FormatDateTime('yyyy-mm-dd 00:00:00', Date);
    Parameters.ParamByName('tareDate2').Value := FormatDateTime('yyyy-mm-dd 23:59:59', Date);
    Open;
  end;
  Result := True;
end;

class function TWeightUtil.getMaxGlideNo(): string;
var c: Integer; //当前总数
  c1, c2, gl: Integer; //流水号前缀和长度
  goodsCode, shouHuoCode: string;
  filter: string;
begin

  c1 := MainForm.systemConfig.glideCode1;
  c2 := MainForm.systemConfig.glideCode2;
  gl := MainForm.systemConfig.glideLength;

  //不启用，过磅地点，货名，收货单位
  //不启用，年月日，年月

  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select Max(流水号) As c from 称重信息 ');

    case c1 of
      0: begin
          case c2 of
            0: begin
                SQL.Add(' where Len(流水号)=' + IntToStr(gl));
              end;
            1: begin
                SQL.Add(' where 流水号 like :glideNo');
                Parameters.ParamByName('glideNo').Value :=
                  FormatDateTime('yyyyMMdd', Date) + '%';
              end;
            2: begin
                SQL.Add(' where 流水号 like :glideNo');
                Parameters.ParamByName('glideNo').Value :=
                  FormatDateTime('yyyyMM', Date) + '%';
              end;
          else
            begin
              SQL.Add(' where Len(流水号)=' + IntToStr(gl));
            end;
          end;
        end;
      1: begin
          case c2 of
            0: begin
                SQL.Add(' where 流水号 like :glideNo');
                Parameters.ParamByName('glideNo').Value := MainForm.systemConfig.addr + '%';
              end;
            1: begin
                SQL.Add(' where 流水号 like :glideNo');
                Parameters.ParamByName('glideNo').Value := MainForm.systemConfig.addr
                  + FormatDateTime('yyyyMMdd', Date) + '%';
              end;
            2: begin
                SQL.Add(' where 流水号 like :glideNo');
                Parameters.ParamByName('glideNo').Value := MainForm.systemConfig.addr
                  + FormatDateTime('yyyyMM', Date) + '%';
              end;
          else
            begin
              SQL.Add(' where 流水号 like :glideNo');
              Parameters.ParamByName('glideNo').Value := MainForm.systemConfig.addr + '%';
            end;
          end;
        end;
      2: begin

        end;
      3: begin
          
        end;
    else
      begin
        case c2 of
          0: begin
              SQL.Add(' where Len(流水号)=' + IntToStr(gl));
            end;
          1: begin
              SQL.Add(' where 流水号 like :glideNo');
              Parameters.ParamByName('glideNo').Value :=
                FormatDateTime('yyyyMMdd', Date) + '%';
            end;
          2: begin
              SQL.Add(' where 流水号 like :glideNo');
              Parameters.ParamByName('glideNo').Value :=
                FormatDateTime('yyyyMM', Date) + '%';
            end;
        else
          begin
            SQL.Add(' where Len(流水号)=' + IntToStr(gl));
          end;
        end;
      end;
    end;

    Open;
    if not IsEmpty then
    begin
      c := StrToIntDef(RightStr(FieldByName('c').AsString, gl), 0);
      case c1 of
        0: begin
            case c2 of
              0: begin
                  Result := TCommonUtil.TransferGlideNo(c + 1, gl);
                end;
              1: begin
                  Result := FormatDateTime('yyyyMMdd', Date)
                    + TCommonUtil.TransferGlideNo(c + 1, gl);
                end;
              2: begin
                  Result := FormatDateTime('yyyyMM', Date)
                    + TCommonUtil.TransferGlideNo(c + 1, gl);
                end;
            else
              begin
                Result := TCommonUtil.TransferGlideNo(c + 1, gl);
              end;
            end;
          end;
        1: begin
            case c2 of
              0: begin
                  Result := MainForm.systemConfig.addr
                    + TCommonUtil.TransferGlideNo(c + 1, gl);
                end;
              1: begin
                  Result := MainForm.systemConfig.addr + FormatDateTime('yyyyMMdd', Date)
                    + TCommonUtil.TransferGlideNo(c + 1, gl);
                end;
              2: begin
                  Result := MainForm.systemConfig.addr + FormatDateTime('yyyyMM', Date)
                    + TCommonUtil.TransferGlideNo(c + 1, gl);
                end;
            else
              begin
                Result := MainForm.systemConfig.addr
                  + TCommonUtil.TransferGlideNo(c + 1, gl);
              end;
            end;
          end;
        2: begin
            case c2 of
              0: begin
                  Result := goodsCode + TCommonUtil.TransferGlideNo(c + 1, gl);
                end;
              1: begin
                  Result := goodsCode + FormatDateTime('yyyyMMdd', Date)
                    + TCommonUtil.TransferGlideNo(c + 1, gl);
                end;
              2: begin
                  Result := goodsCode + FormatDateTime('yyyyMM', Date)
                    + TCommonUtil.TransferGlideNo(c + 1, gl);
                end;
            else
              begin
                Result := goodsCode + TCommonUtil.TransferGlideNo(c + 1, gl);
              end;
            end;
          end;
        3: begin
            case c2 of
              0: begin
                  Result := shouHuoCode + TCommonUtil.TransferGlideNo(c + 1, gl);
                end;
              1: begin
                  Result := shouHuoCode + FormatDateTime('yyyyMMdd', Date)
                    + TCommonUtil.TransferGlideNo(c + 1, gl);
                end;
              2: begin
                  Result := shouHuoCode + FormatDateTime('yyyyMM', Date)
                    + TCommonUtil.TransferGlideNo(c + 1, gl);
                end;
            else
              begin
                Result := shouHuoCode + TCommonUtil.TransferGlideNo(c + 1, gl);
              end;
            end;
          end;
      else
        begin
          case c2 of
            0: begin
                Result := TCommonUtil.TransferGlideNo(c + 1, gl);
              end;
            1: begin
                Result := FormatDateTime('yyyyMMdd', Date)
                  + TCommonUtil.TransferGlideNo(c + 1, gl);
              end;
            2: begin
                Result := FormatDateTime('yyyyMM', Date)
                  + TCommonUtil.TransferGlideNo(c + 1, gl);
              end;
          else
            begin
              Result := TCommonUtil.TransferGlideNo(c + 1, gl);
            end;
          end;
        end;
      end;
    end;
  end;
end;

class function TWeightUtil.clearBackRecord: Boolean;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'delete from tbl_back_record';
    try
      ExecSQL;
      Result := True;
    except
      Result := False;
    end;
  end;
end;

class function TWeightUtil.clearBackup1: Boolean;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'delete from 备用1';
    try
      ExecSQL;
      Result := True;
    except
      Result := False;
    end;
  end;
end;

class function TWeightUtil.clearBackup2: Boolean;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'delete from 备用2';
    try
      ExecSQL;
      Result := True;
    except
      Result := False;
    end;
  end;
end;

class function TWeightUtil.clearBackup3: Boolean;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'delete from 备用3';
    try
      ExecSQL;
      Result := True;
    except
      Result := False;
    end;
  end;
end;

class function TWeightUtil.clearBackup4: Boolean;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'delete from 备用4';
    try
      ExecSQL;
      Result := True;
    except
      Result := False;
    end;
  end;
end;

class function TWeightUtil.clearBackup5: Boolean;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'delete from 备用5';
    try
      ExecSQL;
      Result := True;
    except
      Result := False;
    end;
  end;
end;

class function TWeightUtil.clearCar: Boolean;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'delete from 车号';
    try
      ExecSQL;
      Result := True;
    except
      Result := False;
    end;
  end;
end;

class function TWeightUtil.clearFaHuo: Boolean;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'delete from 发货单位';
    try
      ExecSQL;
      Result := True;
    except
      Result := False;
    end;
  end;
end;

class function TWeightUtil.clearGoods: Boolean;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'delete from 货名';
    try
      ExecSQL;
      Result := True;
    except
      Result := False;
    end;
  end;
end;

class function TWeightUtil.clearLog: Boolean;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'delete from 日志';
    try
      ExecSQL;
      Result := True;
    except
      Result := False;
    end;
  end;
end;

class function TWeightUtil.clearShouHuo: Boolean;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'delete from 收货单位';
    try
      ExecSQL;
      Result := True;
    except
      Result := False;
    end;
  end;
end;

class function TWeightUtil.clearSpec: Boolean;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'delete from 规格';
    try
      ExecSQL;
      Result := True;
    except
      Result := False;
    end;
  end;
end;

class function TWeightUtil.clearTao: Boolean;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'delete from 套表';
    try
      ExecSQL;
      Result := True;
    except
      Result := False;
    end;
  end;
end;

class function TWeightUtil.clearUserInfo: Boolean;
begin
  with QueryDataModule.DBConnection do
  begin
    BeginTrans;
    try
      with QueryDataModule.ADOQExec do
      begin
        Close;
        SQL.Text := 'delete from 用户信息';
        ExecSQL;

        SQL.Text := 'INSERT INTO [用户信息] ([用户名], [密码], [预置维护], [卡号管理],'
          + '[系统日志], [后台记录], [打印磅单], [修改磅单],'
          + '[打印报表], [用户管理], [系统设置], [界面配置],'
          + '[手工重量], [数据库设置], [数据备份], [数据导入],'
          + '[数据导出], [数据清理], [数据初始化], [仪表设置],'
          + '[视频设置], [读卡器设置], [IO模块设置], [大屏幕设置],'
          + '[语音输出], [数据查询], [添加记录], [删除记录],'
          + '[修改车号], [修改发货单位], [修改收货单位], [修改货名],'
          + '[修改规格],[修改毛重], [修改皮重], [修改扣重],'
          + '[修改单价], [修改折方系数], [修改过磅费], [修改备用1],'
          + '[修改备用2], [修改备用3], [修改备用4], [修改备用5],'
          + '[修改备用6], [修改备用7], [修改备用8], [修改备用9],'
          + '[修改备用10], [修改备用11], [修改备用12], [修改备用13],'
          + '[修改备用14], [修改备用15], [修改备用16], [修改备用17],'
          + '[修改备用18], [管理员]) '
          + 'VALUES (:un,:pass,:premaintain,:card,'
          + ':log,:backRecord,:printTicket,:modifyTicket,'
          + ':printReport,:user,:systemSet,:formSet,'
          + ':manualInput,:dbSet,:dataBackup,:dataImport,'
          + ':dataExport,:dataClear,:dataInit,:meterSet,'
          + ':videoSet,:readerSet,:ioSet,:screenSet,'
          + ':voiceSet,:dataQuery,:addData,:delData,'
          + ':car,:faHuo,:shouHuo,:goods,'
          + ':spec,:gross,:tare,:bundle,'
          + ':price,:scale,:cost,:backup1,'
          + ':backup2,:backup3,:backup4,:backup5,'
          + ':backup6,:backup7,:backup8,:backup9,'
          + ':backup10,:backup11,:backup12,:backup13,'
          + ':backup14,:backup15,:backup16,:backup17,'
          + ':backup18,:admin)';

        Parameters.ParamByName('un').Value := '管理员';
        Parameters.ParamByName('pass').Value := '202cb962ac59075b964b07152d234b70';
        Parameters.ParamByName('premaintain').Value := True;
        Parameters.ParamByName('card').Value := True;
        Parameters.ParamByName('log').Value := True;
        Parameters.ParamByName('backRecord').Value := True;
        Parameters.ParamByName('printTicket').Value := True;
        Parameters.ParamByName('modifyTicket').Value := True;
        Parameters.ParamByName('printReport').Value := True;
        Parameters.ParamByName('user').Value := True;
        Parameters.ParamByName('systemSet').Value := True;
        Parameters.ParamByName('formSet').Value := True;
        Parameters.ParamByName('manualInput').Value := True;
        Parameters.ParamByName('dbSet').Value := True;
        Parameters.ParamByName('dataBackup').Value := True;
        Parameters.ParamByName('dataImport').Value := True;
        Parameters.ParamByName('dataExport').Value := True;
        Parameters.ParamByName('dataClear').Value := True;
        Parameters.ParamByName('dataInit').Value := True;
        Parameters.ParamByName('meterSet').Value := True;
        Parameters.ParamByName('videoSet').Value := True;
        Parameters.ParamByName('readerSet').Value := True;
        Parameters.ParamByName('ioSet').Value := True;
        Parameters.ParamByName('screenSet').Value := True;
        Parameters.ParamByName('voiceSet').Value := True;
        Parameters.ParamByName('dataQuery').Value := True;
        Parameters.ParamByName('addData').Value := True;
        Parameters.ParamByName('delData').Value := True;
        Parameters.ParamByName('car').Value := True;
        Parameters.ParamByName('faHuo').Value := True;
        Parameters.ParamByName('shouHuo').Value := True;
        Parameters.ParamByName('goods').Value := True;
        Parameters.ParamByName('spec').Value := True;
        Parameters.ParamByName('gross').Value := True;
        Parameters.ParamByName('tare').Value := True;
        Parameters.ParamByName('bundle').Value := True;
        Parameters.ParamByName('price').Value := True;
        Parameters.ParamByName('scale').Value := True;
        Parameters.ParamByName('cost').Value := True;
        Parameters.ParamByName('backup1').Value := True;
        Parameters.ParamByName('backup2').Value := True;
        Parameters.ParamByName('backup3').Value := True;
        Parameters.ParamByName('backup4').Value := True;
        Parameters.ParamByName('backup5').Value := True;
        Parameters.ParamByName('backup6').Value := True;
        Parameters.ParamByName('backup7').Value := True;
        Parameters.ParamByName('backup8').Value := True;
        Parameters.ParamByName('backup9').Value := True;
        Parameters.ParamByName('backup10').Value := True;
        Parameters.ParamByName('backup11').Value := True;
        Parameters.ParamByName('backup12').Value := True;
        Parameters.ParamByName('backup13').Value := True;
        Parameters.ParamByName('backup14').Value := True;
        Parameters.ParamByName('backup15').Value := True;
        Parameters.ParamByName('backup16').Value := True;
        Parameters.ParamByName('backup17').Value := True;
        Parameters.ParamByName('backup18').Value := True;
        Parameters.ParamByName('admin').Value := True;
        ExecSQL;

        SQL.Text := 'INSERT INTO [用户信息] ([用户名], [密码], [预置维护], [卡号管理],'
          + '[系统日志], [后台记录], [打印磅单], [修改磅单], [打印报表], [用户管理],'
          + '[系统设置], [界面配置], [手工重量], [数据库设置], [数据备份], [数据导入],'
          + '[数据导出], [数据清理], [数据初始化], [仪表设置], [视频设置], [读卡器设置],'
          + '[IO模块设置], [大屏幕设置], [语音输出], [数据查询], [添加记录], [删除记录],'
          + '[修改车号], [修改发货单位], [修改收货单位], [修改货名], [修改规格],[修改毛重],'
          + '[修改皮重], [修改扣重], [修改单价], [修改折方系数], [修改过磅费], [修改备用1],'
          + '[修改备用2], [修改备用3], [修改备用4], [修改备用5], [修改备用6], [修改备用7],'
          + '[修改备用8], [修改备用9], [修改备用10], [修改备用11], [修改备用12], [修改备用13],'
          + '[修改备用14], [修改备用15], [修改备用16], [修改备用17], [修改备用18], [管理员]) '
          + 'VALUES (:un,:pass,:premaintain,:card,'
          + ':log,:backRecord,:printTicket,:modifyTicket,'
          + ':printReport,:user,:systemSet,:formSet,'
          + ':manualInput,:dbSet,:dataBackup,:dataImport,'
          + ':dataExport,:dataClear,:dataInit,:meterSet,'
          + ':videoSet,:readerSet,:ioSet,:screenSet,'
          + ':voiceSet,:dataQuery,:addData,:delData,'
          + ':car,:faHuo,:shouHuo,:goods,'
          + ':spec,:gross,:tare,:bundle,'
          + ':price,:scale,:cost,:backup1,'
          + ':backup2,:backup3,:backup4,:backup5,'
          + ':backup6,:backup7,:backup8,:backup9,'
          + ':backup10,:backup11,:backup12,:backup13,'
          + ':backup14,:backup15,:backup16,:backup17,'
          + ':backup18,:admin)';

        Parameters.ParamByName('un').Value := '过磅员';
        Parameters.ParamByName('pass').Value := '202cb962ac59075b964b07152d234b70';
        Parameters.ParamByName('premaintain').Value := False;
        Parameters.ParamByName('card').Value := False;
        Parameters.ParamByName('log').Value := False;
        Parameters.ParamByName('backRecord').Value := False;
        Parameters.ParamByName('printTicket').Value := True;
        Parameters.ParamByName('modifyTicket').Value := False;
        Parameters.ParamByName('printReport').Value := True;
        Parameters.ParamByName('user').Value := False;
        Parameters.ParamByName('systemSet').Value := False;
        Parameters.ParamByName('formSet').Value := False;
        Parameters.ParamByName('manualInput').Value := False;
        Parameters.ParamByName('dbSet').Value := False;
        Parameters.ParamByName('dataBackup').Value := False;
        Parameters.ParamByName('dataImport').Value := False;
        Parameters.ParamByName('dataExport').Value := False;
        Parameters.ParamByName('dataClear').Value := False;
        Parameters.ParamByName('dataInit').Value := False;
        Parameters.ParamByName('meterSet').Value := False;
        Parameters.ParamByName('videoSet').Value := False;
        Parameters.ParamByName('readerSet').Value := False;
        Parameters.ParamByName('ioSet').Value := False;
        Parameters.ParamByName('screenSet').Value := False;
        Parameters.ParamByName('voiceSet').Value := False;
        Parameters.ParamByName('dataQuery').Value := True;
        Parameters.ParamByName('addData').Value := False;
        Parameters.ParamByName('delData').Value := False;
        Parameters.ParamByName('car').Value := False;
        Parameters.ParamByName('faHuo').Value := False;
        Parameters.ParamByName('shouHuo').Value := False;
        Parameters.ParamByName('goods').Value := False;
        Parameters.ParamByName('spec').Value := False;
        Parameters.ParamByName('gross').Value := False;
        Parameters.ParamByName('tare').Value := False;
        Parameters.ParamByName('bundle').Value := False;
        Parameters.ParamByName('price').Value := False;
        Parameters.ParamByName('scale').Value := False;
        Parameters.ParamByName('cost').Value := False;
        Parameters.ParamByName('backup1').Value := False;
        Parameters.ParamByName('backup2').Value := False;
        Parameters.ParamByName('backup3').Value := False;
        Parameters.ParamByName('backup4').Value := False;
        Parameters.ParamByName('backup5').Value := False;
        Parameters.ParamByName('backup6').Value := False;
        Parameters.ParamByName('backup7').Value := False;
        Parameters.ParamByName('backup8').Value := False;
        Parameters.ParamByName('backup9').Value := False;
        Parameters.ParamByName('backup10').Value := False;
        Parameters.ParamByName('backup11').Value := False;
        Parameters.ParamByName('backup12').Value := False;
        Parameters.ParamByName('backup13').Value := False;
        Parameters.ParamByName('backup14').Value := False;
        Parameters.ParamByName('backup15').Value := False;
        Parameters.ParamByName('backup16').Value := False;
        Parameters.ParamByName('backup17').Value := False;
        Parameters.ParamByName('backup18').Value := False;
        Parameters.ParamByName('admin').Value := False;
        ExecSQL;

      end;
      CommitTrans;
      Result := True;
    except
      RollbackTrans;
      Result := False;
    end;
  end;
end;

class function TWeightUtil.clearWeightInfo: Boolean;
begin
  with QueryDataModule.DBConnection do
  begin
    BeginTrans;
    try
      with QueryDataModule.ADOQExec do
      begin
        Close;
        SQL.Text := 'delete from 称重信息 where 流水号<>''''';
        ExecSQL;

        SQL.Text := 'delete from tbl_weight_img';
        ExecSQL;
      end;
      CommitTrans;
      Result := True;
    except
      RollbackTrans;
      Result := False;
    end;
  end;
end;

class function TWeightUtil.TableExists(tn: string): boolean;
var
  i: Integer;
  TableNames: TStringList;
begin
  TableNames := TStringList.Create;
  try
    result := False;
    with QueryDataModule do
    begin
      DBConnection.GetTableNames(TableNames);
      for i := 0 to TableNames.count - 1 do
        if TableNames.Strings[i] = tn then
        begin
          result := True;
          break;
        end;
    end;
  finally
    TableNames.Free;
  end;
end;

class function TWeightUtil.ImportExcel(f: string; pb: TRzProgressBar): Boolean;
var excelApp: Variant;
  i, j, rowCount: Integer;
  w: TWeightRecord;
  tmp: string;
begin
  excelApp := CreateOleObject('Excel.Application');
  w := TWeightRecord.Create;
  try
    excelApp.Visible := False;
    excelApp.WorkBooks.Open(f);
    excelApp.WorkSheets[1].Activate;
    rowCount := excelApp.WorkSheets[1].UsedRange.Rows.Count;
    if excelApp.WorkSheets[1].UsedRange.Columns.Count < 29 then
    begin
      Application.MessageBox('Excel表列数不足,无法导入!', '错误', MB_OK +
        MB_ICONSTOP + MB_DEFBUTTON2 + MB_TOPMOST);
      Result := False;
      Exit;
    end;

    QueryDataModule.DBConnection.BeginTrans;
    try
      QueryDataModule.ADOQExec.Close;
      QueryDataModule.ADOQExec.SQL.Text := 'SELECT TOP 1 [流水号],[车号],[过磅类型],'
        + '[发货单位],[收货单位],[货名],[规格],[毛重],'
        + '[皮重],[净重],[扣重],[实重],[单价],'
        + '[金额],[折方系数],[方量],[过磅费],[毛重时间],'
        + '[皮重时间],[毛重司磅员],[皮重司磅员],[毛重磅号],[皮重磅号],'
        + '[一次过磅时间],[二次过磅时间],[更新人],[更新时间],[备注],'
        + '[打印次数],[上传否],[备用1],[备用2],[备用3],'
        + '[备用4],[备用5],[备用6],[备用7],[备用8],'
        + '[备用9],[备用10],[备用11],[备用12],[备用13],'
        + '[备用14],[备用15],[备用16],[备用17],[备用18] FROM [称重信息]';
      QueryDataModule.ADOQExec.Open;
      pb.TotalParts := rowCount - 1;
      j := 0;
      for i := 2 to rowCount do
      begin
        w.glideNo := VarToStr(excelApp.Cells[i, 1].Value);
        w.carNo := VarToStr(excelApp.Cells[i, 2].Value);
        w.weightType := VarToStr(excelApp.Cells[i, 3].Value);
        w.faHuo := VarToStr(excelApp.Cells[i, 4].Value);
        w.shouHuo := VarToStr(excelApp.Cells[i, 5].Value);
        w.goods := VarToStr(excelApp.Cells[i, 6].Value);
        w.spec := VarToStr(excelApp.Cells[i, 7].Value);
        w.gross := StrToFloatDef(excelApp.Cells[i, 8].Value, 0);
        w.tare := StrToFloatDef(excelApp.Cells[i, 9].Value, 0);
        w.net := StrToFloatDef(excelApp.Cells[i, 10].Value, 0);
        w.bundle := StrToFloatDef(excelApp.Cells[i, 11].Value, 0);
        w.real := StrToFloatDef(excelApp.Cells[i, 12].Value, 0);
        w.price := StrToFloatDef(excelApp.Cells[i, 13].Value, 0);
        w.sum := StrToFloatDef(excelApp.Cells[i, 14].Value, 0);
        w.scale := StrToFloatDef(excelApp.Cells[i, 15].Value, 0);
        w.quanter := StrToFloatDef(excelApp.Cells[i, 16].Value, 0);
        w.cost := StrToFloatDef(excelApp.Cells[i, 17].Value, 0);
        w.grossMan := VarToStr(excelApp.Cells[i, 18].Value);
        w.tareMan := VarToStr(excelApp.Cells[i, 19].Value);
        w.grossAddr := VarToStr(excelApp.Cells[i, 20].Value);
        w.tareAddr := VarToStr(excelApp.Cells[i, 21].Value);

        tmp := VarToStr(excelApp.Cells[i, 22].Value);
        if tmp <> '' then w.grossTime := StrToDateTime(tmp);
        tmp := VarToStr(excelApp.Cells[i, 23].Value);
        if tmp <> '' then w.tareTime := StrToDateTime(tmp);
        tmp := VarToStr(excelApp.Cells[i, 24].Value);
        if tmp <> '' then w.firstTime := StrToDateTime(tmp);
        tmp := VarToStr(excelApp.Cells[i, 25].Value);
        if tmp <> '' then w.secondTime := StrToDateTime(tmp);
        w.updateUser := VarToStr(excelApp.Cells[i, 26].Value);
        tmp := VarToStr(excelApp.Cells[i, 27].Value);
        if tmp <> '' then w.updateTime := StrToDateTime(tmp);
        w.memo := VarToStr(excelApp.Cells[i, 28].Value);
        w.printCount := StrToIntDef(excelApp.Cells[i, 29].Value, 0);
        w.upload := excelApp.Cells[i, 30].Value;
        w.backup1 := VarToStr(excelApp.Cells[i, 31].Value);
        w.backup2 := VarToStr(excelApp.Cells[i, 32].Value);
        w.backup3 := VarToStr(excelApp.Cells[i, 33].Value);
        w.backup4 := VarToStr(excelApp.Cells[i, 34].Value);
        w.backup5 := VarToStr(excelApp.Cells[i, 35].Value);
        w.backup6 := StrToFloatDef(excelApp.Cells[i, 36].Value, 0);
        w.backup7 := StrToFloatDef(excelApp.Cells[i, 37].Value, 0);
        w.backup8 := StrToFloatDef(excelApp.Cells[i, 38].Value, 0);
        w.backup9 := StrToFloatDef(excelApp.Cells[i, 39].Value, 0);
        w.backup10 := VarToStr(excelApp.Cells[i, 40].Value);
        w.backup11 := VarToStr(excelApp.Cells[i, 41].Value);
        w.backup12 := VarToStr(excelApp.Cells[i, 42].Value);
        w.backup13 := VarToStr(excelApp.Cells[i, 43].Value);
        w.backup14 := VarToStr(excelApp.Cells[i, 44].Value);
        w.backup15 := StrToFloatDef(excelApp.Cells[i, 46].Value, 0);
        w.backup16 := StrToFloatDef(excelApp.Cells[i, 46].Value, 0);
        w.backup17 := StrToFloatDef(excelApp.Cells[i, 47].Value, 0);
        w.backup18 := StrToFloatDef(excelApp.Cells[i, 48].Value, 0);
        QueryDataModule.ADOQExec.InsertRecord([
          w.glideNo, w.carNo, w.weightType,
            w.faHuo, w.shouHuo, w.goods, w.spec, w.gross,
            w.tare, w.net, w.bundle, w.real, w.price,
            w.sum, w.scale, w.quanter, w.cost, w.grossTime,
            w.tareTime, w.grossMan, w.tareMan, w.grossAddr, w.tareAddr,
            w.firstTime, w.secondTime, w.updateUser, w.updateTime, w.memo,
            w.printCount, w.upload, w.backup1, w.backup2, w.backup3,
            w.backup4, w.backup5, w.backup6, w.backup7, w.backup8,
            w.backup9, w.backup10, w.backup11, w.backup12, w.backup13,
            w.backup14, w.backup15, w.backup16, w.backup17, w.backup18]);
        pb.IncPartsByOne;
        Inc(j);
        if j = 2000 then
        begin
          QueryDataModule.ADOQExec.UpdateBatch();
          j := 0;
        end;
        Application.ProcessMessages;
      end;
      QueryDataModule.ADOQExec.UpdateBatch();
      QueryDataModule.DBConnection.CommitTrans;
    except
      QueryDataModule.DBConnection.RollbackTrans;
    end;
    Result := True;
  finally
    w.Free;
    ExcelApp.WorkBooks.Close; //关闭工作簿
    ExcelApp.Quit; //退出 Excel
    ExcelApp := Unassigned; //释放excel进程
  end;
end;

class function TWeightUtil.showPhoto(no: string): Boolean;
var Stream: TMemoryStream;
begin
  PhotoForm.GrossImage1.Picture.Graphic := nil;
  PhotoForm.GrossImage2.Picture.Graphic := nil;
  PhotoForm.GrossImage3.Picture.Graphic := nil;
  PhotoForm.GrossImage4.Picture.Graphic := nil;
  PhotoForm.EmptyImage1.Picture.Graphic := nil;
  PhotoForm.EmptyImage2.Picture.Graphic := nil;
  PhotoForm.EmptyImage3.Picture.Graphic := nil;
  PhotoForm.EmptyImage4.Picture.Graphic := nil;
  try
    with QueryDataModule.ADOQExec do
    begin
      Close;
      SQL.Text := 'select * from tbl_weight_img where weight_id = :glide_no';
      Parameters.ParamByName('glide_no').Value := no;
      Open;
      if not IsEmpty then
      begin
        First;
        Stream := TMemoryStream.Create;
        try
          if (not FieldByName('gross_img1').IsNull) and (FieldByName('gross_img1').AsString <> '') then
          begin
            Stream.Clear;
            (FieldByName('gross_img1') as TBlobField).SaveToStream(Stream);
            Stream.Position := 0;
            PhotoForm.GrossImage1.Picture.Graphic := TJpegImage.Create;
            PhotoForm.GrossImage1.Picture.Graphic.LoadFromStream(Stream);
          end;
          if (not FieldByName('gross_img2').IsNull) and (FieldByName('gross_img2').AsString <> '') then
          begin
            Stream.Clear;
            (FieldByName('gross_img2') as TBlobField).SaveToStream(Stream);
            Stream.Position := 0;
            PhotoForm.GrossImage2.Picture.Graphic := TJpegImage.Create;
            PhotoForm.GrossImage2.Picture.Graphic.LoadFromStream(Stream);
          end;
          if (not FieldByName('gross_img3').IsNull) and (FieldByName('gross_img3').AsString <> '') then
          begin
            Stream.Clear;
            (FieldByName('gross_img3') as TBlobField).SaveToStream(Stream);
            Stream.Position := 0;
            PhotoForm.GrossImage3.Picture.Graphic := TJpegImage.Create;
            PhotoForm.GrossImage3.Picture.Graphic.LoadFromStream(Stream);
          end;
          if (not FieldByName('gross_img4').IsNull) and (FieldByName('gross_img4').AsString <> '') then
          begin
            Stream.Clear;
            (FieldByName('gross_img4') as TBlobField).SaveToStream(Stream);
            Stream.Position := 0;
            PhotoForm.GrossImage4.Picture.Graphic := TJpegImage.Create;
            PhotoForm.GrossImage4.Picture.Graphic.LoadFromStream(Stream);
          end;
          if (not FieldByName('tare_img1').IsNull) and (FieldByName('tare_img1').AsString <> '') then
          begin
            Stream.Clear;
            (FieldByName('tare_img1') as TBlobField).SaveToStream(Stream);
            Stream.Position := 0;
            PhotoForm.EmptyImage1.Picture.Graphic := TJpegImage.Create;
            PhotoForm.EmptyImage1.Picture.Graphic.LoadFromStream(Stream);
          end;
          if (not FieldByName('tare_img2').IsNull) and (FieldByName('tare_img2').AsString <> '') then
          begin
            Stream.Clear;
            (FieldByName('tare_img2') as TBlobField).SaveToStream(Stream);
            Stream.Position := 0;
            PhotoForm.EmptyImage2.Picture.Graphic := TJpegImage.Create;
            PhotoForm.EmptyImage2.Picture.Graphic.LoadFromStream(Stream);
          end;
          if (not FieldByName('tare_img3').IsNull) and (FieldByName('tare_img3').AsString <> '') then
          begin
            Stream.Clear;
            (FieldByName('tare_img3') as TBlobField).SaveToStream(Stream);
            Stream.Position := 0;
            PhotoForm.EmptyImage3.Picture.Graphic := TJpegImage.Create;
            PhotoForm.EmptyImage3.Picture.Graphic.LoadFromStream(Stream);
          end;
          if (not FieldByName('tare_img4').IsNull) and (FieldByName('tare_img4').AsString <> '') then
          begin
            Stream.Clear;
            (FieldByName('tare_img4') as TBlobField).SaveToStream(Stream);
            Stream.Position := 0;
            PhotoForm.EmptyImage4.Picture.Graphic := TJpegImage.Create;
            PhotoForm.EmptyImage4.Picture.Graphic.LoadFromStream(Stream);
          end;
        finally
          Stream.Free;
        end;
      end;
    end;
  except
  end;
end;

class function TWeightUtil.saveBackRecord(w: string): Boolean;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'insert into tbl_back_record(weight,weight_time) values(:weight,:weight_time)';
    Parameters.ParamByName('weight').Value := StrToFloatDef(w, 1000);
    Parameters.ParamByName('weight_time').Value := Now;
    ExecSQL;
    Result := True;
  end;
end;


class function TWeightUtil.clearBackup10: Boolean;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'delete from 备用10';
    ExecSQL;
  end;
end;

class function TWeightUtil.clearBackup11: Boolean;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'delete from 备用11';
    ExecSQL;
  end;
end;

class function TWeightUtil.clearBackup12: Boolean;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'delete from 备用12';
    ExecSQL;
  end;
end;

class function TWeightUtil.clearBackup13: Boolean;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'delete from 备用13';
    ExecSQL;
  end;
end;

class function TWeightUtil.clearBackup14: Boolean;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'delete from 备用14';
    ExecSQL;
  end;
end;


class function TWeightUtil.updateTimeOut(carNo: string): Boolean;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'select 一次过磅时间 from 称重信息 where (车号=:car) and (净重=0) '
      + 'and (一次过磅时间 is not null) and (二次过磅时间 is null) order By 流水号';
    Parameters.ParamByName('car').Value := carNo;
    Open;
    if not IsEmpty then
    begin
      if MinuteSpan(Now, FieldByName('一次过磅时间').AsDateTime) > MainForm.systemConfig.updateTimeOut then
      begin
        if Application.MessageBox('两次过磅间隔时间过长,是否继续过磅?',
          '提示', MB_YESNO + MB_ICONQUESTION + MB_TOPMOST) = IDYES then
        begin
          if not TUserUtil.HasAuthority('系统设置') then
          begin
            Application.MessageBox('对不起,你权限不够', '提示', MB_OK +
              MB_ICONSTOP + MB_TOPMOST);
            Result := True;
            Exit;
          end;
        end
        else
        begin
          Result := True;
          Exit;
        end;
      end;
    end;
  end;
  Result := False;
end;

class procedure TWeightUtil.saveWeightImgEx(weight_type, weight_id,
  weight_field: string; saveType: Boolean; weightType: Char);
var p1, p2, p3, p4: string;
begin
  if saveType then
  begin
    if weightType = 'A' then
    begin
      p1 := ExtractFilePath(ParamStr(0)) + 'P0.jpg';
      p2 := ExtractFilePath(ParamStr(0)) + 'P1.jpg';
      p3 := ExtractFilePath(ParamStr(0)) + 'P2.jpg';
      p4 := ExtractFilePath(ParamStr(0)) + 'P3.jpg';
    end
    else
    begin
      p3 := ExtractFilePath(ParamStr(0)) + 'P0.jpg';
      p4 := ExtractFilePath(ParamStr(0)) + 'P1.jpg';
      p1 := ExtractFilePath(ParamStr(0)) + 'P2.jpg';
      p2 := ExtractFilePath(ParamStr(0)) + 'P3.jpg';
    end;
    if not DirectoryExists(ExtractFilePath(ParamStr(0)) + '\WeightImg\' + weight_id) then
      ForceDirectories(ExtractFilePath(ParamStr(0)) + '\WeightImg\' + weight_id);
    if weight_type = 'A' then
    begin
      if weight_field = 'G' then
      begin
        if FileExists(p1) then
          CopyFile(PChar(p1), PChar(ExtractFilePath(ParamStr(0)) + '\WeightImg\' + weight_id
            + '\gross_img1.jpg'), False);
        if FileExists(p2) then
          CopyFile(PChar(p2), PChar(ExtractFilePath(ParamStr(0)) + '\WeightImg\' + weight_id
            + '\gross_img2.jpg'), False);
        if FileExists(p3) then
          CopyFile(PChar(p3), PChar(ExtractFilePath(ParamStr(0)) + '\WeightImg\' + weight_id
            + '\gross_img3.jpg'), False);
        if FileExists(p4) then
          CopyFile(PChar(p4), PChar(ExtractFilePath(ParamStr(0)) + '\WeightImg\' + weight_id
            + '\gross_img4.jpg'), False);
      end
      else if weight_field = 'T' then
      begin
        if FileExists(p1) then
          CopyFile(PChar(p1), PChar(ExtractFilePath(ParamStr(0)) + '\WeightImg\' + weight_id
            + '\tare_img1.jpg'), False);
        if FileExists(p2) then
          CopyFile(PChar(p2), PChar(ExtractFilePath(ParamStr(0)) + '\WeightImg\' + weight_id
            + '\tare_img2.jpg'), False);
        if FileExists(p3) then
          CopyFile(PChar(p3), PChar(ExtractFilePath(ParamStr(0)) + '\WeightImg\' + weight_id
            + '\tare_img3.jpg'), False);
        if FileExists(p4) then
          CopyFile(PChar(p4), PChar(ExtractFilePath(ParamStr(0)) + '\WeightImg\' + weight_id
            + '\tare_img4.jpg'), False);
      end
      else if weight_field = 'A' then
      begin
        if FileExists(p1) then
          CopyFile(PChar(p1), PChar(ExtractFilePath(ParamStr(0)) + '\WeightImg\' + weight_id
            + '\gross_img1.jpg'), False);
        if FileExists(p2) then
          CopyFile(PChar(p2), PChar(ExtractFilePath(ParamStr(0)) + '\WeightImg\' + weight_id
            + '\gross_img2.jpg'), False);
        if FileExists(p3) then
          CopyFile(PChar(p3), PChar(ExtractFilePath(ParamStr(0)) + '\WeightImg\' + weight_id
            + '\gross_img3.jpg'), False);
        if FileExists(p4) then
          CopyFile(PChar(p4), PChar(ExtractFilePath(ParamStr(0)) + '\WeightImg\' + weight_id
            + '\gross_img4.jpg'), False);
        if FileExists(p1) then
          CopyFile(PChar(p1), PChar(ExtractFilePath(ParamStr(0)) + '\WeightImg\' + weight_id
            + '\tare_img1.jpg'), False);
        if FileExists(p2) then
          CopyFile(PChar(p2), PChar(ExtractFilePath(ParamStr(0)) + '\WeightImg\' + weight_id
            + '\tare_img2.jpg'), False);
        if FileExists(p3) then
          CopyFile(PChar(p3), PChar(ExtractFilePath(ParamStr(0)) + '\WeightImg\' + weight_id
            + '\tare_img3.jpg'), False);
        if FileExists(p4) then
          CopyFile(PChar(p4), PChar(ExtractFilePath(ParamStr(0)) + '\WeightImg\' + weight_id
            + '\tare_img4.jpg'), False);
      end;
    end
    else if weight_type = 'U' then
    begin
      if weight_field = 'G' then
      begin
        if FileExists(p1) then
          CopyFile(PChar(p1), PChar(ExtractFilePath(ParamStr(0)) + '\WeightImg\' + weight_id
            + '\gross_img1.jpg'), False);
        if FileExists(p2) then
          CopyFile(PChar(p2), PChar(ExtractFilePath(ParamStr(0)) + '\WeightImg\' + weight_id
            + '\gross_img2.jpg'), False);
        if FileExists(p3) then
          CopyFile(PChar(p3), PChar(ExtractFilePath(ParamStr(0)) + '\WeightImg\' + weight_id
            + '\gross_img3.jpg'), False);
        if FileExists(p4) then
          CopyFile(PChar(p4), PChar(ExtractFilePath(ParamStr(0)) + '\WeightImg\' + weight_id
            + '\gross_img4.jpg'), False);
      end
      else if weight_field = 'T' then
      begin
        if FileExists(p1) then
          CopyFile(PChar(p1), PChar(ExtractFilePath(ParamStr(0)) + '\WeightImg\' + weight_id
            + '\tare_img1.jpg'), False);
        if FileExists(p2) then
          CopyFile(PChar(p2), PChar(ExtractFilePath(ParamStr(0)) + '\WeightImg\' + weight_id
            + '\tare_img2.jpg'), False);
        if FileExists(p3) then
          CopyFile(PChar(p3), PChar(ExtractFilePath(ParamStr(0)) + '\WeightImg\' + weight_id
            + '\tare_img3.jpg'), False);
        if FileExists(p4) then
          CopyFile(PChar(p4), PChar(ExtractFilePath(ParamStr(0)) + '\WeightImg\' + weight_id
            + '\tare_img4.jpg'), False);
      end
    end
  end
  else
  begin
    saveWeightImg(weight_type, weight_id, weight_field, weightType);
  end;

  if FileExists(p1) then
    DeleteFile(PAnsiChar(p1));
  if FileExists(p2) then
    DeleteFile(PAnsiChar(p2));
  if FileExists(p3) then
    DeleteFile(PAnsiChar(p3));
  if FileExists(p4) then
    DeleteFile(PAnsiChar(p4));
end;

class function TWeightUtil.showPhotoEx(no: string;
  saveType: Boolean): Boolean;
var p1, p2, p3, p4, p5, p6, p7, p8: string;
  pic: TJPEGImage;
begin
  if saveType then
  begin
    PhotoForm.GrossImage1.Picture.Graphic := nil;
    PhotoForm.GrossImage2.Picture.Graphic := nil;
    PhotoForm.GrossImage3.Picture.Graphic := nil;
    PhotoForm.GrossImage4.Picture.Graphic := nil;
    PhotoForm.EmptyImage1.Picture.Graphic := nil;
    PhotoForm.EmptyImage2.Picture.Graphic := nil;
    PhotoForm.EmptyImage3.Picture.Graphic := nil;
    PhotoForm.EmptyImage4.Picture.Graphic := nil;

    p1 := ExtractFilePath(ParamStr(0)) + '\WeightImg\' + no + '\gross_img1.jpg';
    p2 := ExtractFilePath(ParamStr(0)) + '\WeightImg\' + no + '\gross_img2.jpg';
    p3 := ExtractFilePath(ParamStr(0)) + '\WeightImg\' + no + '\gross_img3.jpg';
    p4 := ExtractFilePath(ParamStr(0)) + '\WeightImg\' + no + '\gross_img4.jpg';
    p5 := ExtractFilePath(ParamStr(0)) + '\WeightImg\' + no + '\tare_img1.jpg';
    p6 := ExtractFilePath(ParamStr(0)) + '\WeightImg\' + no + '\tare_img2.jpg';
    p7 := ExtractFilePath(ParamStr(0)) + '\WeightImg\' + no + '\tare_img3.jpg';
    p8 := ExtractFilePath(ParamStr(0)) + '\WeightImg\' + no + '\tare_img4.jpg';

    pic := TJPEGImage.Create;
    try
      if FileExists(p1) then
      begin
        pic.LoadFromFile(p1);
        PhotoForm.GrossImage1.Picture.Bitmap.Assign(pic);
      end;
      if FileExists(p2) then
      begin
        pic.LoadFromFile(p2);
        PhotoForm.GrossImage2.Picture.Bitmap.Assign(pic);
      end;
      if FileExists(p3) then
      begin
        pic.LoadFromFile(p3);
        PhotoForm.GrossImage3.Picture.Bitmap.Assign(pic);
      end;
      if FileExists(p4) then
      begin
        pic.LoadFromFile(p4);
        PhotoForm.GrossImage4.Picture.Bitmap.Assign(pic);
      end;
      if FileExists(p5) then
      begin
        pic.LoadFromFile(p5);
        PhotoForm.EmptyImage1.Picture.Bitmap.Assign(pic);
      end;
      if FileExists(p6) then
      begin
        pic.LoadFromFile(p6);
        PhotoForm.EmptyImage2.Picture.Bitmap.Assign(pic);
      end;
      if FileExists(p7) then
      begin
        pic.LoadFromFile(p7);
        PhotoForm.EmptyImage3.Picture.Bitmap.Assign(pic);
      end;
      if FileExists(p8) then
      begin
        pic.LoadFromFile(p8);
        PhotoForm.EmptyImage4.Picture.Bitmap.Assign(pic);
      end;
    finally
      pic.Free;
    end;
  end
  else
  begin
    showPhoto(no);
  end;
end;


class function TWeightUtil.getDatabaseSpace(databaseInUse: Boolean): Double;
var i: Integer;
  tmp1, tmp2: string;
begin
  if databaseInUse then //查看Access文件大小
  begin
    Result := GetFileSize(FileOpen(ExtractFilePath(ParamStr(0)) + 'Database\database.mdb', 0), nil) / 1024 / 1024 / 1024;
  end
  else //查看SQL文件大小
  begin
    with QueryDataModule.ADOQExec do
    begin
      Close;
      SQL.Text := 'exec sp_spaceused';
      Open;
      if not IsEmpty then
      begin
        tmp1 := FieldByName('database_size').AsString;
        tmp2 := '';
        for i := 1 to Length(tmp1) do
        begin
          if tmp1[i] in ['0'..'9', '.'] then
            tmp2 := tmp2 + tmp1[i];
        end;
        Result := StrToFloatDef(tmp2, 0);
      end;
    end;
  end;
end;

class procedure TWeightUtil.XMLExport0;
var
  strXML: string;
  XMLDoc: TXMLDocument;
  node: IXMLNode;
begin
  strXML := ExtractFilePath(ParamStr(0)) + '\export.xml';
  if FileExists(strXML) then //如果已经存在导出的文件就删除
    DeleteFile(PChar(strXML));
  //重新创建该文件
  XMLDoc := TXMLDocument.Create(Application);
  try
    XMLDoc.Active := True;
    XMLDoc.Version := '1.0';
    XMLDoc.Encoding := 'UTF-8';
    XMLDoc.AddChild('ATW');
    XMLDoc.SaveToFile(strXML);
  finally
    XMLDoc.Free
  end;
  //增加节点
  XMLDoc := TXMLDocument.Create(Application);
  try
    XMLDoc.FileName := strXML;
    XMLDoc.Active := True;
    with QueryDataModule.ADOQExec do
    begin //查询所有的记录后导出
      Close;
      SQL.Clear;
      SQL.Add('select * from 称重信息 where (毛重时间 between :start and :end)');
      Parameters.ParamByName('start').Value := StartOfTheDay(Now);
      Parameters.ParamByName('end').Value := EndofTheDay(Now);
      Open;
      if not IsEmpty then //不为空记录就导出XML
      begin
        first;
        while not Eof do
        begin
          node := XMLDoc.CreateNode('WeightData');
          node.AttributeNodes.Add(XMLDoc.CreateNode('id', ntAttribute));
          node.SetAttribute('id', FieldByName('流水号').AsString);
          node.AttributeNodes.Add(XMLDoc.CreateNode('car', ntAttribute));
          node.SetAttribute('car', FieldByName('车号').AsString);
          node.AttributeNodes.Add(XMLDoc.CreateNode('FaHuo', ntAttribute));
          node.SetAttribute('FaHuo', FieldByName('发货单位').AsString);
          node.AttributeNodes.Add(XMLDoc.CreateNode('ShouHuo', ntAttribute));
          node.SetAttribute('ShouHuo', FieldByName('收货单位').AsString);
          node.AttributeNodes.Add(XMLDoc.CreateNode('Goods', ntAttribute));
          node.SetAttribute('Goods', FieldByName('货名').AsString);
          node.AttributeNodes.Add(XMLDoc.CreateNode('Spec', ntAttribute));
          node.SetAttribute('Spec', FieldByName('规格').AsString);
          node.AttributeNodes.Add(XMLDoc.CreateNode('Gross', ntAttribute));
          node.SetAttribute('Gross', FieldByName('毛重').AsString);
          node.AttributeNodes.Add(XMLDoc.CreateNode('Tare', ntAttribute));
          node.SetAttribute('Tare', FieldByName('皮重').AsString);
          node.AttributeNodes.Add(XMLDoc.CreateNode('Net', ntAttribute));
          node.SetAttribute('Net', FieldByName('净重').AsString);
          node.AttributeNodes.Add(XMLDoc.CreateNode('Bundle', ntAttribute));
          node.SetAttribute('Bundle', FieldByName('扣重').AsString);
          node.AttributeNodes.Add(XMLDoc.CreateNode('Real', ntAttribute));
          node.SetAttribute('Real', FieldByName('实重').AsString);
          node.AttributeNodes.Add(XMLDoc.CreateNode('price', ntAttribute));
          node.SetAttribute('price', FieldByName('单价').AsString);
          node.AttributeNodes.Add(XMLDoc.CreateNode('sum', ntAttribute));
          node.SetAttribute('sum', FieldByName('金额').AsString);
          node.AttributeNodes.Add(XMLDoc.CreateNode('grossman', ntAttribute));
          node.SetAttribute('grossman', FieldByName('毛重司磅员').AsString);
          node.AttributeNodes.Add(XMLDoc.CreateNode('tareman', ntAttribute));
          node.SetAttribute('tareman', FieldByName('皮重司磅员').AsString);
          node.AttributeNodes.Add(XMLDoc.CreateNode('GrossTime', ntAttribute));
          node.SetAttribute('GrossTime', FieldByName('毛重时间').AsString);
          node.AttributeNodes.Add(XMLDoc.CreateNode('EmptyTime', ntAttribute));
          node.SetAttribute('EmptyTime', FieldByName('皮重时间').AsString);
          node.AttributeNodes.Add(XMLDoc.CreateNode('Remark', ntAttribute));
          node.SetAttribute('Remark', FieldByName('备注').AsString);
          XMLDoc.DocumentElement.ChildNodes.Add(node);
          XMLDoc.SaveToFile(strXML);
          Next;
        end
      end
    end;
  finally
    XMLDoc.Free;
  end;
end;

class procedure TWeightUtil.XMLExport1;
var
  strXML: string;
  XMLDoc: TXMLDocument;
  node, node2: IXMLNode;
begin
  strXML := ExtractFilePath(ParamStr(0)) + '\export.xml';
  if FileExists(strXML) then //如果已经存在导出的文件就删除
    DeleteFile(PChar(strXML));
  //重新创建该文件
  XMLDoc := TXMLDocument.Create(Application);
  try
    XMLDoc.Active := True;
    XMLDoc.Version := '1.0';
    XMLDoc.Encoding := 'UTF-8';
    XMLDoc.AddChild('ATW');
    XMLDoc.SaveToFile(strXML);
  finally
    XMLDoc.Free
  end;

  XMLDoc := TXMLDocument.Create(Application);
  try
    XMLDoc.FileName := strXML;
    XMLDoc.Active := True;
    with QueryDataModule.ADOQExec do
    begin //查询所有的记录后导出
      Close;
      SQL.Clear;
      SQL.Add('select * from 称重信息 where (毛重时间 between :start and :end)');
      Parameters.ParamByName('start').Value := StartOfTheDay(Now);
      Parameters.ParamByName('end').Value := EndofTheDay(Now);
      Open;
      if not IsEmpty then //不为空记录就导出XML
      begin
        first;
        while not Eof do
        begin
          node := XMLDoc.CreateNode('WeightData');
          node2 := node.AddChild('id');
          node2.Text := FieldByName('流水号').AsString;
          node2 := node.AddChild('car');
          node2.Text := FieldByName('车号').AsString;
          node2 := node.AddChild('FaHuo');
          node2.Text := FieldByName('发货单位').AsString;
          node2 := node.AddChild('ShouHuo');
          node2.Text := FieldByName('收货单位').AsString;
          node2 := node.AddChild('Goods');
          node2.Text := FieldByName('货名').AsString;
          node2 := node.AddChild('Spec');
          node2.Text := FieldByName('规格').AsString;
          node2 := node.AddChild('Gross');
          node2.Text := FieldByName('毛重').AsString;
          node2 := node.AddChild('Tare');
          node2.Text := FieldByName('皮重').AsString;
          node2 := node.AddChild('Net');
          node2.Text := FieldByName('净重').AsString;
          node2 := node.AddChild('Bundle');
          node2.Text := FieldByName('扣重').AsString;
          node2 := node.AddChild('Real');
          node2.Text := FieldByName('实重').AsString;
          node2 := node.AddChild('price');
          node2.Text := FieldByName('单价').AsString;
          node2 := node.AddChild('sum');
          node2.Text := FieldByName('金额').AsString;
          node2 := node.AddChild('grossman');
          node2.Text := FieldByName('毛重司磅员').AsString;
          node2 := node.AddChild('tareman');
          node2.Text := FieldByName('皮重司磅员').AsString;
          node2 := node.AddChild('GrossTime');
          node2.Text := FieldByName('毛重时间').AsString;
          node2 := node.AddChild('EmptyTime');
          node2.Text := FieldByName('皮重时间').AsString;
          node2 := node.AddChild('Remark');
          node2.Text := FieldByName('备注').AsString;
          XMLDoc.DocumentElement.ChildNodes.Add(node);
          XMLDoc.SaveToFile(strXML);
          Next;
        end
      end
    end;
  finally
    XMLDoc.Free;
  end;
end;

class function TWeightUtil.getXmlData(glideNo: string): string;
var XMLDoc: TXMLDocument;
  node: IXMLNode;
  i: integer;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'select * from 称重信息 where 流水号=:glideNo';
    Parameters.ParamByName('glideNo').Value := glideNo;
    Open;
    if not IsEmpty then
    begin
      XMLDoc := TXMLDocument.Create(Application);
      try
        XMLDoc.Active := True;
        XMLDoc.Version := '1.0';
        XMLDoc.Encoding := 'GBK';
        XMLDoc.AddChild('ATW');

        node := XMLDoc.CreateNode('WeightData');
        node.AttributeNodes.Add(XMLDoc.CreateNode('id', ntAttribute));
        node.SetAttribute('id', FieldByName('流水号').AsString);
        node.AttributeNodes.Add(XMLDoc.CreateNode('car', ntAttribute));
        node.SetAttribute('car', FieldByName('车号').AsString);
        node.AttributeNodes.Add(XMLDoc.CreateNode('FaHuo', ntAttribute));
        node.SetAttribute('faHuo', FieldByName('发货单位').AsString);
        node.AttributeNodes.Add(XMLDoc.CreateNode('ShouHuo', ntAttribute));
        node.SetAttribute('shouHuo', FieldByName('收货单位').AsString);
        node.AttributeNodes.Add(XMLDoc.CreateNode('Goods', ntAttribute));
        node.SetAttribute('goods', FieldByName('货名').AsString);
        node.AttributeNodes.Add(XMLDoc.CreateNode('Spec', ntAttribute));
        node.SetAttribute('spec', FieldByName('规格').AsString);
        node.AttributeNodes.Add(XMLDoc.CreateNode('Gross', ntAttribute));
        node.SetAttribute('gross', FieldByName('毛重').AsString);
        node.AttributeNodes.Add(XMLDoc.CreateNode('Tare', ntAttribute));
        node.SetAttribute('tare', FieldByName('皮重').AsString);
        node.AttributeNodes.Add(XMLDoc.CreateNode('Net', ntAttribute));
        node.SetAttribute('net', FieldByName('净重').AsString);
        node.AttributeNodes.Add(XMLDoc.CreateNode('Bundle', ntAttribute));
        node.SetAttribute('bundle', FieldByName('扣重').AsString);
        node.AttributeNodes.Add(XMLDoc.CreateNode('Real', ntAttribute));
        node.SetAttribute('real', FieldByName('实重').AsString);
        node.AttributeNodes.Add(XMLDoc.CreateNode('price', ntAttribute));
        node.SetAttribute('price', FieldByName('单价').AsString);
        node.AttributeNodes.Add(XMLDoc.CreateNode('sum', ntAttribute));
        node.SetAttribute('sum', FieldByName('金额').AsString);
        node.AttributeNodes.Add(XMLDoc.CreateNode('grossman', ntAttribute));
        node.SetAttribute('grossman', FieldByName('毛重司磅员').AsString);
        node.AttributeNodes.Add(XMLDoc.CreateNode('tareman', ntAttribute));
        node.SetAttribute('tareman', FieldByName('皮重司磅员').AsString);
        node.AttributeNodes.Add(XMLDoc.CreateNode('GrossTime', ntAttribute));
        node.SetAttribute('grossTime', FieldByName('毛重时间').AsString);
        node.AttributeNodes.Add(XMLDoc.CreateNode('EmptyTime', ntAttribute));
        node.SetAttribute('tareTime', FieldByName('皮重时间').AsString);
        node.AttributeNodes.Add(XMLDoc.CreateNode('Remark', ntAttribute));
        node.SetAttribute('remark', FieldByName('备注').AsString);
        node.AttributeNodes.Add(XMLDoc.CreateNode('backup1', ntAttribute));
        node.SetAttribute('backup1', FieldByName('备用1').AsString);
        node.AttributeNodes.Add(XMLDoc.CreateNode('backup2', ntAttribute));
        node.SetAttribute('backup2', FieldByName('备用2').AsString);
        node.AttributeNodes.Add(XMLDoc.CreateNode('backup3', ntAttribute));
        node.SetAttribute('backup3', FieldByName('备用3').AsString);
        node.AttributeNodes.Add(XMLDoc.CreateNode('backup4', ntAttribute));
        node.SetAttribute('backup4', FieldByName('备用4').AsString);
        node.AttributeNodes.Add(XMLDoc.CreateNode('backup5', ntAttribute));
        node.SetAttribute('backup5', FieldByName('备用5').AsString);
        node.AttributeNodes.Add(XMLDoc.CreateNode('backup6', ntAttribute));
        node.SetAttribute('backup6', FieldByName('备用6').AsString);
        node.AttributeNodes.Add(XMLDoc.CreateNode('backup7', ntAttribute));
        node.SetAttribute('backup7', FieldByName('备用7').AsString);
        node.AttributeNodes.Add(XMLDoc.CreateNode('backup8', ntAttribute));
        node.SetAttribute('backup8', FieldByName('备用8').AsString);
        node.AttributeNodes.Add(XMLDoc.CreateNode('backup9', ntAttribute));
        node.SetAttribute('backup9', FieldByName('备用9').AsString);
        XMLDoc.DocumentElement.ChildNodes.Add(node);
        for i := 0 to XMLDoc.XML.Count - 1 do
        begin
          Result := Result + XMLDoc.XML.Strings[i];
        end;
      finally
        //XMLDoc.Free;
      end;
    end;
  end;
end;

class function TWeightUtil.genMailReport(reportType: Integer): Boolean;
var eclApp, WorkBook: Variant;
  i, j: Integer;
  t: TStringList;
begin
  try
    eclApp := CreateOleObject('Excel.Application');
    WorkBook := CreateOleobject('Excel.Sheet');
  except
    Result := False;
    Exit;
  end;

  try
    workBook := eclApp.workBooks.Add;
    t := TStringList.Create;

    with QueryDataModule.ADOQExec do
    begin
      Close;
      SQL.Text := 'select * from 称重信息 where 更新时间 between :start and :end';
      case reportType of
        0: begin
            Parameters.ParamByName('start').Value := StartOfTheDay(Now);
            Parameters.ParamByName('end').Value := EndOfTheDay(Now);
          end;
        1: begin
            Parameters.ParamByName('start').Value := StartOfTheWeek(Now);
            Parameters.ParamByName('end').Value := EndOfTheWeek(Now);
          end;
        2: begin
            Parameters.ParamByName('start').Value := StartOfTheMonth(Now);
            Parameters.ParamByName('end').Value := EndOfTheMonth(Now);
          end;
        3: begin
            Parameters.ParamByName('start').Value := StartOfTheYear(Now);
            Parameters.ParamByName('end').Value := EndOfTheYear(Now);
          end;
      end;
      Open;
      if not IsEmpty then
      begin
        GetFieldNames(t);
        for i := 0 to t.Count - 1 do
          eclApp.worksheets[1].Cells[1, i + 1].Value := t.Strings[i];

        First;
        i := 2;
        while not Eof do
        begin
          eclApp.worksheets[1].Cells[i, 1].Value := FieldByName('序号').AsString;
          eclApp.worksheets[1].Cells[i, 2].Value := FieldByName('流水号').AsString;
          eclApp.worksheets[1].Cells[i, 3].Value := FieldByName('车号').AsString;
          eclApp.worksheets[1].Cells[i, 4].Value := FieldByName('过磅类型').AsString;
          eclApp.worksheets[1].Cells[i, 5].Value := FieldByName('发货单位').AsString;
          eclApp.worksheets[1].Cells[i, 6].Value := FieldByName('收货单位').AsString;
          eclApp.worksheets[1].Cells[i, 7].Value := FieldByName('货名').AsString;
          eclApp.worksheets[1].Cells[i, 8].Value := FieldByName('规格').AsString;
          eclApp.worksheets[1].Cells[i, 9].Value := FieldByName('毛重').AsFloat;
          eclApp.worksheets[1].Cells[i, 10].Value := FieldByName('皮重').AsFloat;
          eclApp.worksheets[1].Cells[i, 11].Value := FieldByName('净重').AsFloat;
          eclApp.worksheets[1].Cells[i, 12].Value := FieldByName('扣重').AsFloat;
          eclApp.worksheets[1].Cells[i, 13].Value := FieldByName('实重').AsFloat;
          eclApp.worksheets[1].Cells[i, 14].Value := FieldByName('单价').AsFloat;
          eclApp.worksheets[1].Cells[i, 15].Value := FieldByName('金额').AsFloat;
          eclApp.worksheets[1].Cells[i, 16].Value := FieldByName('折方系数').AsFloat;
          eclApp.worksheets[1].Cells[i, 17].Value := FieldByName('方量').AsFloat;
          eclApp.worksheets[1].Cells[i, 18].Value := FieldByName('过磅费').AsFloat;
          eclApp.worksheets[1].Cells[i, 19].Value := FieldByName('毛重司磅员').AsString;
          eclApp.worksheets[1].Cells[i, 20].Value := FieldByName('皮重司磅员').AsString;
          eclApp.worksheets[1].Cells[i, 21].Value := FieldByName('毛重磅号').AsString;
          eclApp.worksheets[1].Cells[i, 22].Value := FieldByName('皮重磅号').AsString;
          eclApp.worksheets[1].Cells[i, 23].Value := FieldByName('毛重时间').AsDateTime;
          eclApp.worksheets[1].Cells[i, 24].Value := FieldByName('皮重时间').AsDateTime;
          eclApp.worksheets[1].Cells[i, 25].Value := FieldByName('一次过磅时间').AsDateTime;
          eclApp.worksheets[1].Cells[i, 26].Value := FieldByName('二次过磅时间').AsDateTime;
          eclApp.worksheets[1].Cells[i, 27].Value := FieldByName('更新人').AsString;
          eclApp.worksheets[1].Cells[i, 28].Value := FieldByName('更新时间').AsDateTime;
          eclApp.worksheets[1].Cells[i, 29].Value := FieldByName('备注').AsString;
          eclApp.worksheets[1].Cells[i, 30].Value := FieldByName('打印次数').AsString;
          eclApp.worksheets[1].Cells[i, 31].Value := FieldByName('上传否').AsString;
          eclApp.worksheets[1].Cells[i, 32].Value := FieldByName('备用1').AsString;
          eclApp.worksheets[1].Cells[i, 33].Value := FieldByName('备用2').AsString;
          eclApp.worksheets[1].Cells[i, 34].Value := FieldByName('备用3').AsString;
          eclApp.worksheets[1].Cells[i, 35].Value := FieldByName('备用4').AsString;
          eclApp.worksheets[1].Cells[i, 36].Value := FieldByName('备用5').AsString;
          eclApp.worksheets[1].Cells[i, 37].Value := FieldByName('备用6').AsString;
          eclApp.worksheets[1].Cells[i, 38].Value := FieldByName('备用7').AsString;
          eclApp.worksheets[1].Cells[i, 39].Value := FieldByName('备用8').AsString;
          eclApp.worksheets[1].Cells[i, 40].Value := FieldByName('备用9').AsString;
          eclApp.worksheets[1].Cells[i, 41].Value := FieldByName('备用10').AsString;
          eclApp.worksheets[1].Cells[i, 42].Value := FieldByName('备用11').AsString;
          eclApp.worksheets[1].Cells[i, 43].Value := FieldByName('备用12').AsString;
          eclApp.worksheets[1].Cells[i, 44].Value := FieldByName('备用13').AsString;
          eclApp.worksheets[1].Cells[i, 45].Value := FieldByName('备用14').AsString;
          eclApp.worksheets[1].Cells[i, 46].Value := FieldByName('备用15').AsString;
          eclApp.worksheets[1].Cells[i, 47].Value := FieldByName('备用16').AsString;
          eclApp.worksheets[1].Cells[i, 48].Value := FieldByName('备用17').AsString;
          eclApp.worksheets[1].Cells[i, 49].Value := FieldByName('备用18').AsString;
          inc(i);
          Next;
        end;
      end;
    end;
    if FileExists(ExtractFilePath(ParamStr(0)) + 'export.xls') then
      DeleteFile(PAnsiChar(ExtractFilePath(ParamStr(0)) + 'export.xls'));
    WorkBook.saveas(ExtractFilePath(ParamStr(0)) + 'export.xls');
    WorkBook.Close;
    eclApp.Quit;
    eclApp := Unassigned;
    t.Free;
    Result := True;
  except
    Result := False;
    WorkBook.close;
    eclApp.Quit;
    eclApp := Unassigned;
  end;
end;

class function TWeightUtil.updateLastBackRecord: Boolean;
var id: Integer;
begin
  if MainForm.systemConfig.useBackRecord then
  begin
    with QueryDataModule.ADOQExec do
    begin
      Close;
      SQL.Text := 'select top 1 id from tbl_back_record where (weight_time>=:grossTime) '
        + ' order by id desc';
      Parameters.ParamByName('grossTime').Value := StartOfTheDay(Now);
      Open;
      if not IsEmpty then
      begin
        id := FieldByName('id').AsInteger;
        SQL.Text := 'update tbl_back_record set flag=:flag where id=:id';
        Parameters.ParamByName('flag').Value := True;
        Parameters.ParamByName('id').Value := id;
        try
          ExecSQL;
        except
        end;
      end;
    end;
  end;
end;

class function TWeightUtil.moveDeletedRecord(glideNo: string): Boolean;
var w: TWeightRecord;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'select * from 称重信息 where (流水号=:glideNo)';
    Parameters.ParamByName('glideNo').Value := glideNo;
    Open;
    if not IsEmpty then
    begin
      w := TWeightRecord.Create;
      try
        w.glideNo := FieldByName('流水号').AsString;
        w.carNo := FieldByName('车号').AsString;
        w.weightType := FieldByName('过磅类型').AsString;
        w.fahuo := FieldByName('发货单位').AsString;
        w.shouhuo := FieldByName('收货单位').AsString;
        w.goods := FieldByName('货名').AsString;
        w.spec := FieldByName('规格').AsString;
        w.gross := FieldByName('毛重').AsFloat;
        w.tare := FieldByName('皮重').AsFloat;
        w.net := FieldByName('净重').AsFloat;
        w.bundle := FieldByName('扣重').AsFloat;
        w.real := FieldByName('实重').AsFloat;
        w.price := FieldByName('单价').AsFloat;
        w.sum := FieldByName('金额').AsFloat;
        w.scale := FieldByName('折方系数').AsFloat;
        w.quanter := FieldByName('方量').AsFloat;
        w.cost := FieldByName('过磅费').AsFloat;
        w.grossMan := FieldByName('毛重司磅员').AsString;
        w.tareMan := FieldByName('皮重司磅员').AsString;
        w.grossAddr := FieldByName('毛重磅号').AsString;
        w.tareAddr := FieldByName('皮重磅号').AsString;
        w.grosstime := FieldByName('毛重时间').AsDateTime;
        w.taretime := FieldByName('皮重时间').AsDateTime;
        w.firstTime := FieldByName('一次过磅时间').AsDateTime;
        w.secondTime := FieldByName('二次过磅时间').AsDateTime;
        w.updateUser := FieldByName('更新人').AsString;
        w.updateTime := FieldByName('更新时间').AsDateTime;
        w.memo := FieldByName('备注').AsString;
        w.printCount := FieldByName('打印次数').AsInteger;
        w.upload := FieldByName('上传否').AsBoolean;
        w.backup1 := FieldByName('备用1').AsString;
        w.backup2 := FieldByName('备用2').AsString;
        w.backup3 := FieldByName('备用3').AsString;
        w.backup4 := FieldByName('备用4').AsString;
        w.backup5 := FieldByName('备用5').AsString;
        w.backup6 := FieldByName('备用6').AsFloat;
        w.backup7 := FieldByName('备用7').AsFloat;
        w.backup8 := FieldByName('备用8').AsFloat;
        w.backup9 := FieldByName('备用9').AsFloat;
        w.backup10 := FieldByName('备用10').AsString;
        w.backup11 := FieldByName('备用11').AsString;
        w.backup12 := FieldByName('备用12').AsString;
        w.backup13 := FieldByName('备用13').AsString;
        w.backup14 := FieldByName('备用14').AsString;
        w.backup15 := FieldByName('备用15').AsFloat;
        w.backup16 := FieldByName('备用16').AsFloat;
        w.backup17 := FieldByName('备用17').AsFloat;
        w.backup18 := FieldByName('备用18').AsFloat;
        with QueryDataModule.ADOQExec2 do
        begin
          Close;
          SQL.Text := 'insert into 作废信息(流水号,车号,过磅类型,发货单位,收货单位,'
            + '货名,规格,毛重,皮重,净重,扣重,实重,单价,金额,折方系数,方量,过磅费,'
            + '毛重司磅员,皮重司磅员,毛重磅号,皮重磅号,毛重时间,皮重时间,一次过磅时间,'
            + '二次过磅时间,更新人,更新时间,备注,打印次数,上传否,备用1,备用2,备用3,'
            + '备用4,备用5,备用6,备用7,备用8,备用9,备用10,备用11,备用12,备用13,'
            + '备用14,备用15,备用16,备用17,备用18) values(:glideNo,:car,:weightType,:fahuo,:shouhuo,:goods,'
            + ':spec,:gross,:tare,:net,:bundle,:real,:price,:sum,:scale,:quanter,:cost,'
            + ':grossMan,:tareMan,:grossAddr,:tareAddr,:grosstime,:taretime,:firstTime,:secondTime,'
            + ':updateUser,:updateTime,:memo,:printCount,:upload,:backup1,:backup2,:backup3,'
            + ':backup4,:backup5,:backup6,:backup7,:backup8,:backup9,:backup10,:backup11,:backup12,'
            + ':backup13,:backup14,:backup15,:backup16,:backup17,:backup18)';
          Parameters.ParamByName('glideNo').Value := TWeightUtil.getInvalidMaxGlideNo;
          Parameters.ParamByName('car').Value := w.carNo;
          Parameters.ParamByName('weightType').Value := w.weightType;
          Parameters.ParamByName('fahuo').Value := w.fahuo;
          Parameters.ParamByName('shouhuo').Value := w.shouhuo;
          Parameters.ParamByName('goods').Value := w.goods;
          Parameters.ParamByName('spec').Value := w.spec;
          Parameters.ParamByName('gross').Value := w.gross;
          Parameters.ParamByName('tare').Value := w.tare;
          Parameters.ParamByName('net').Value := w.net;
          Parameters.ParamByName('bundle').Value := w.bundle;
          Parameters.ParamByName('real').Value := w.real;
          Parameters.ParamByName('price').Value := w.price;
          Parameters.ParamByName('sum').Value := w.sum;
          Parameters.ParamByName('scale').Value := w.scale;
          Parameters.ParamByName('quanter').Value := w.quanter;
          Parameters.ParamByName('cost').Value := w.cost;
          Parameters.ParamByName('grossMan').Value := w.grossMan;
          Parameters.ParamByName('tareMan').Value := w.tareMan;
          Parameters.ParamByName('grossAddr').Value := w.grossAddr;
          Parameters.ParamByName('tareAddr').Value := w.tareAddr;
          Parameters.ParamByName('grosstime').Value := w.grosstime;
          Parameters.ParamByName('taretime').Value := w.taretime;
          Parameters.ParamByName('firstTime').Value := w.firstTime;
          Parameters.ParamByName('secondTime').Value := w.secondTime;
          Parameters.ParamByName('updateUser').Value := w.updateUser;
          Parameters.ParamByName('updateTime').Value := w.updateTime;
          Parameters.ParamByName('memo').Value := w.memo;
          Parameters.ParamByName('printCount').Value := w.printCount;
          Parameters.ParamByName('upload').Value := w.upload;
          Parameters.ParamByName('backup1').Value := w.backup1;
          Parameters.ParamByName('backup2').Value := w.backup2;
          Parameters.ParamByName('backup3').Value := w.backup3;
          Parameters.ParamByName('backup4').Value := w.backup4;
          Parameters.ParamByName('backup5').Value := w.backup5;
          Parameters.ParamByName('backup6').Value := w.backup6;
          Parameters.ParamByName('backup7').Value := w.backup7;
          Parameters.ParamByName('backup8').Value := w.backup8;
          Parameters.ParamByName('backup9').Value := w.backup9;
          Parameters.ParamByName('backup10').Value := w.backup10;
          Parameters.ParamByName('backup11').Value := w.backup11;
          Parameters.ParamByName('backup12').Value := w.backup12;
          Parameters.ParamByName('backup13').Value := w.backup13;
          Parameters.ParamByName('backup14').Value := w.backup14;
          Parameters.ParamByName('backup15').Value := w.backup15;
          Parameters.ParamByName('backup16').Value := w.backup16;
          Parameters.ParamByName('backup17').Value := w.backup17;
          Parameters.ParamByName('backup18').Value := w.backup18;
          try
            ExecSQL;
            Result := True;
          except
            Result := False;
          end;
        end;
      finally
        w.Free;
      end;
    end;
  end;
end;

class function TWeightUtil.moveExceedRecord: Boolean;
var w: TWeightRecord;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'select * from 称重信息 where (毛重>:gross) and (净重<>0)';
    Parameters.ParamByName('gross').Value := MainForm.systemConfig.exceedStart;
    Open;
    if not IsEmpty then
    begin
      First;
      w := TWeightRecord.Create;
      try
        while not Eof do
        begin
          w.glideNo := FieldByName('流水号').AsString;
          w.carNo := FieldByName('车号').AsString;
          w.weightType := FieldByName('过磅类型').AsString;
          w.fahuo := FieldByName('发货单位').AsString;
          w.shouhuo := FieldByName('收货单位').AsString;
          w.goods := FieldByName('货名').AsString;
          w.spec := FieldByName('规格').AsString;
          w.gross := FieldByName('毛重').AsFloat;
          w.tare := FieldByName('皮重').AsFloat;
          w.net := FieldByName('净重').AsFloat;
          w.bundle := FieldByName('扣重').AsFloat;
          w.real := FieldByName('实重').AsFloat;
          w.price := FieldByName('单价').AsFloat;
          w.sum := FieldByName('金额').AsFloat;
          w.scale := FieldByName('折方系数').AsFloat;
          w.quanter := FieldByName('方量').AsFloat;
          w.cost := FieldByName('过磅费').AsFloat;
          w.grossMan := FieldByName('毛重司磅员').AsString;
          w.tareMan := FieldByName('皮重司磅员').AsString;
          w.grossAddr := FieldByName('毛重磅号').AsString;
          w.tareAddr := FieldByName('皮重磅号').AsString;
          w.grosstime := FieldByName('毛重时间').AsDateTime;
          w.taretime := FieldByName('皮重时间').AsDateTime;
          w.firstTime := FieldByName('一次过磅时间').AsDateTime;
          w.secondTime := FieldByName('二次过磅时间').AsDateTime;
          w.updateUser := FieldByName('更新人').AsString;
          w.updateTime := FieldByName('更新时间').AsDateTime;
          w.memo := FieldByName('备注').AsString;
          w.printCount := FieldByName('打印次数').AsInteger;
          w.upload := FieldByName('上传否').AsBoolean;
          w.backup1 := FieldByName('备用1').AsString;
          w.backup2 := FieldByName('备用2').AsString;
          w.backup3 := FieldByName('备用3').AsString;
          w.backup4 := FieldByName('备用4').AsString;
          w.backup5 := FieldByName('备用5').AsString;
          w.backup6 := FieldByName('备用6').AsFloat;
          w.backup7 := FieldByName('备用7').AsFloat;
          w.backup8 := FieldByName('备用8').AsFloat;
          w.backup9 := FieldByName('备用9').AsFloat;
          w.backup10 := FieldByName('备用10').AsString;
          w.backup11 := FieldByName('备用11').AsString;
          w.backup12 := FieldByName('备用12').AsString;
          w.backup13 := FieldByName('备用13').AsString;
          w.backup14 := FieldByName('备用14').AsString;
          w.backup15 := FieldByName('备用15').AsFloat;
          w.backup16 := FieldByName('备用16').AsFloat;
          w.backup17 := FieldByName('备用17').AsFloat;
          w.backup18 := FieldByName('备用18').AsFloat;
          with QueryDataModule.ADOQExec2 do
          begin
            Close;
            SQL.Text := 'insert into 超限信息(流水号,车号,过磅类型,发货单位,收货单位,'
              + '货名,规格,毛重,皮重,净重,扣重,实重,单价,金额,折方系数,方量,过磅费,'
              + '毛重司磅员,皮重司磅员,毛重磅号,皮重磅号,毛重时间,皮重时间,一次过磅时间,'
              + '二次过磅时间,更新人,更新时间,备注,打印次数,上传否,备用1,备用2,备用3,'
              + '备用4,备用5,备用6,备用7,备用8,备用9,备用10,备用11,备用12,备用13,'
              + '备用14,备用15,备用16,备用17,备用18) values(:glideNo,:car,:weightType,:fahuo,:shouhuo,:goods,'
              + ':spec,:gross,:tare,:net,:bundle,:real,:price,:sum,:scale,:quanter,:cost,'
              + ':grossMan,:tareMan,:grossAddr,:tareAddr,:grosstime,:taretime,:firstTime,:secondTime,'
              + ':updateUser,:updateTime,:memo,:printCount,:upload,:backup1,:backup2,:backup3,'
              + ':backup4,:backup5,:backup6,:backup7,:backup8,:backup9,:backup10,:backup11,:backup12,'
              + ':backup13,:backup14,:backup15,:backup16,:backup17,:backup18)';
            Parameters.ParamByName('glideNo').Value := TWeightUtil.getExceedMaxGlideNo;
            Parameters.ParamByName('car').Value := w.carNo;
            Parameters.ParamByName('weightType').Value := w.weightType;
            Parameters.ParamByName('fahuo').Value := w.fahuo;
            Parameters.ParamByName('shouhuo').Value := w.shouhuo;
            Parameters.ParamByName('goods').Value := w.goods;
            Parameters.ParamByName('spec').Value := w.spec;
            Parameters.ParamByName('gross').Value := w.gross;
            Parameters.ParamByName('tare').Value := w.tare;
            Parameters.ParamByName('net').Value := w.net;
            Parameters.ParamByName('bundle').Value := w.bundle;
            Parameters.ParamByName('real').Value := w.real;
            Parameters.ParamByName('price').Value := w.price;
            Parameters.ParamByName('sum').Value := w.sum;
            Parameters.ParamByName('scale').Value := w.scale;
            Parameters.ParamByName('quanter').Value := w.quanter;
            Parameters.ParamByName('cost').Value := w.cost;
            Parameters.ParamByName('grossMan').Value := w.grossMan;
            Parameters.ParamByName('tareMan').Value := w.tareMan;
            Parameters.ParamByName('grossAddr').Value := w.grossAddr;
            Parameters.ParamByName('tareAddr').Value := w.tareAddr;
            Parameters.ParamByName('grosstime').Value := w.grosstime;
            Parameters.ParamByName('taretime').Value := w.taretime;
            Parameters.ParamByName('firstTime').Value := w.firstTime;
            Parameters.ParamByName('secondTime').Value := w.secondTime;
            Parameters.ParamByName('updateUser').Value := w.updateUser;
            Parameters.ParamByName('updateTime').Value := w.updateTime;
            Parameters.ParamByName('memo').Value := w.memo;
            Parameters.ParamByName('printCount').Value := w.printCount;
            Parameters.ParamByName('upload').Value := w.upload;
            Parameters.ParamByName('backup1').Value := w.backup1;
            Parameters.ParamByName('backup2').Value := w.backup2;
            Parameters.ParamByName('backup3').Value := w.backup3;
            Parameters.ParamByName('backup4').Value := w.backup4;
            Parameters.ParamByName('backup5').Value := w.backup5;
            Parameters.ParamByName('backup6').Value := w.backup6;
            Parameters.ParamByName('backup7').Value := w.backup7;
            Parameters.ParamByName('backup8').Value := w.backup8;
            Parameters.ParamByName('backup9').Value := w.backup9;
            Parameters.ParamByName('backup10').Value := w.backup10;
            Parameters.ParamByName('backup11').Value := w.backup11;
            Parameters.ParamByName('backup12').Value := w.backup12;
            Parameters.ParamByName('backup13').Value := w.backup13;
            Parameters.ParamByName('backup14').Value := w.backup14;
            Parameters.ParamByName('backup15').Value := w.backup15;
            Parameters.ParamByName('backup16').Value := w.backup16;
            Parameters.ParamByName('backup17').Value := w.backup17;
            Parameters.ParamByName('backup18').Value := w.backup18;

            ExecSQL;
          end;
          Delete;
        end;
        Result := True;
      finally
        w.Free;
      end;
    end;
  end;
end;

class function TWeightUtil.getExceedMaxGlideNo: string;
var temp, tmp: string;
  c1, gl: Integer; //流水号前缀和长度
begin

  c1 := MainForm.systemConfig.glideCode1;
  gl := MainForm.systemConfig.glideLength;

  //不启用,过磅地点,年月日,年月,过磅地点+年月日,过磅地点+年月

  with QueryDataModule.ADOQExec3 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select Max(流水号) As maxGlideNo from 超限信息 ');

    case c1 of
      0: begin
          SQL.Add(' where Len(流水号)=' + IntToStr(gl));
        end;
      1: begin
          SQL.Add(' where 流水号 like :glideNo');
          Parameters.ParamByName('glideNo').Value := MainForm.systemConfig.addr + '%';
        end;
      2: begin
          SQL.Add(' where 流水号 like :glideNo');
          Parameters.ParamByName('glideNo').Value := FormatDateTime('yyyyMMdd', Date) + '%';
        end;
      3: begin
          SQL.Add(' where 流水号 like :glideNo');
          Parameters.ParamByName('glideNo').Value := FormatDateTime('yyyyMM', Date) + '%';
        end;
      4: begin
          SQL.Add(' where 流水号 like :glideNo');
          Parameters.ParamByName('glideNo').Value := MainForm.systemConfig.addr
            + FormatDateTime('yyyyMMdd', Date) + '%';
        end;
      5: begin
          SQL.Add(' where 流水号 like :glideNo');
          Parameters.ParamByName('glideNo').Value := MainForm.systemConfig.addr
            + FormatDateTime('yyyyMM', Date) + '%';
        end;
    else
      begin
        SQL.Add(' where Len(流水号)=' + IntToStr(gl));
      end;
    end;

    Open;
    if not IsEmpty then
    begin
      temp := FieldByName('maxGlideNo').AsString;
      case MainForm.systemConfig.glideCode1 of
        0: begin
            if temp = '' then
              Result := TCommonUtil.TransferGlideNo(1, gl)
            else
              Result := TCommonUtil.TransferGlideNo(StrToIntDef(temp, 0) + 1, gl);
          end;
        1: begin
            if temp = '' then
              Result := MainForm.systemConfig.addr
                + TCommonUtil.TransferGlideNo(1, gl)
            else
              Result := MainForm.systemConfig.addr
                + TCommonUtil.TransferGlideNo(StrToIntDef(temp, 0) + 1, gl);
          end;
        2: begin
            if temp = '' then
              Result := FormatDateTime('yyyyMMdd', Date) + TCommonUtil.TransferGlideNo(1, gl)
            else
            begin
              tmp := RightStr(temp, gl);
              Result := FormatDateTime('yyyyMMdd', Date)
                + TCommonUtil.TransferGlideNo(StrToIntDef(tmp, 0) + 1, gl);
            end;
          end;
        3: begin
            if temp = '' then
              Result := FormatDateTime('yyyyMM', Date) + TCommonUtil.TransferGlideNo(1, gl)
            else
            begin
              tmp := RightStr(temp, gl);
              Result := FormatDateTime('yyyyMM', Date)
                + TCommonUtil.TransferGlideNo(StrToIntDef(tmp, 0) + 1, gl);
            end;
          end;
        4: begin
            if temp = '' then
              Result := MainForm.systemConfig.addr
                + FormatDateTime('yyyyMMdd', Date) + TCommonUtil.TransferGlideNo(1, gl)
            else
            begin
              tmp := RightStr(temp, gl);
              Result := MainForm.systemConfig.addr
                + FormatDateTime('yyyyMMdd', Date)
                + TCommonUtil.TransferGlideNo(StrToIntDef(tmp, 0) + 1, gl);
            end;
          end;
        5: begin
            if temp = '' then
              Result := MainForm.systemConfig.addr
                + FormatDateTime('yyyyMM', Date) + TCommonUtil.TransferGlideNo(1, gl)
            else
            begin
              tmp := RightStr(temp, gl);
              Result := MainForm.systemConfig.addr
                + FormatDateTime('yyyyMM', Date)
                + TCommonUtil.TransferGlideNo(StrToIntDef(tmp, 0) + 1, gl);
            end;
          end;
      else
        begin
          if temp = '' then
            Result := TCommonUtil.TransferGlideNo(1, gl)
          else
            Result := TCommonUtil.TransferGlideNo(StrToIntDef(temp, 0) + 1, gl);
        end;
      end;
    end;
  end;
end;

class function TWeightUtil.getInvalidMaxGlideNo: string;
var temp, tmp: string;
  c1, gl: Integer; //流水号前缀和长度
begin

  c1 := MainForm.systemConfig.glideCode1;
  gl := MainForm.systemConfig.glideLength;

  //不启用,过磅地点,年月日,年月,过磅地点+年月日,过磅地点+年月

  with QueryDataModule.ADOQExec3 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select Max(流水号) As maxGlideNo from 作废信息 ');

    case c1 of
      0: begin
          SQL.Add(' where Len(流水号)=' + IntToStr(gl));
        end;
      1: begin
          SQL.Add(' where 流水号 like :glideNo');
          Parameters.ParamByName('glideNo').Value := MainForm.systemConfig.addr + '%';
        end;
      2: begin
          SQL.Add(' where 流水号 like :glideNo');
          Parameters.ParamByName('glideNo').Value := FormatDateTime('yyyyMMdd', Date) + '%';
        end;
      3: begin
          SQL.Add(' where 流水号 like :glideNo');
          Parameters.ParamByName('glideNo').Value := FormatDateTime('yyyyMM', Date) + '%';
        end;
      4: begin
          SQL.Add(' where 流水号 like :glideNo');
          Parameters.ParamByName('glideNo').Value := MainForm.systemConfig.addr
            + FormatDateTime('yyyyMMdd', Date) + '%';
        end;
      5: begin
          SQL.Add(' where 流水号 like :glideNo');
          Parameters.ParamByName('glideNo').Value := MainForm.systemConfig.addr
            + FormatDateTime('yyyyMM', Date) + '%';
        end;
    else
      begin
        SQL.Add(' where Len(流水号)=' + IntToStr(gl));
      end;
    end;

    Open;
    if not IsEmpty then
    begin
      temp := FieldByName('maxGlideNo').AsString;
      case MainForm.systemConfig.glideCode1 of
        0: begin
            if temp = '' then
              Result := TCommonUtil.TransferGlideNo(1, gl)
            else
              Result := TCommonUtil.TransferGlideNo(StrToIntDef(temp, 0) + 1, gl);
          end;
        1: begin
            if temp = '' then
              Result := MainForm.systemConfig.addr
                + TCommonUtil.TransferGlideNo(1, gl)
            else
              Result := MainForm.systemConfig.addr
                + TCommonUtil.TransferGlideNo(StrToIntDef(temp, 0) + 1, gl);
          end;
        2: begin
            if temp = '' then
              Result := FormatDateTime('yyyyMMdd', Date) + TCommonUtil.TransferGlideNo(1, gl)
            else
            begin
              tmp := RightStr(temp, gl);
              Result := FormatDateTime('yyyyMMdd', Date)
                + TCommonUtil.TransferGlideNo(StrToIntDef(tmp, 0) + 1, gl);
            end;
          end;
        3: begin
            if temp = '' then
              Result := FormatDateTime('yyyyMM', Date) + TCommonUtil.TransferGlideNo(1, gl)
            else
            begin
              tmp := RightStr(temp, gl);
              Result := FormatDateTime('yyyyMM', Date)
                + TCommonUtil.TransferGlideNo(StrToIntDef(tmp, 0) + 1, gl);
            end;
          end;
        4: begin
            if temp = '' then
              Result := MainForm.systemConfig.addr
                + FormatDateTime('yyyyMMdd', Date) + TCommonUtil.TransferGlideNo(1, gl)
            else
            begin
              tmp := RightStr(temp, gl);
              Result := MainForm.systemConfig.addr
                + FormatDateTime('yyyyMMdd', Date)
                + TCommonUtil.TransferGlideNo(StrToIntDef(tmp, 0) + 1, gl);
            end;
          end;
        5: begin
            if temp = '' then
              Result := MainForm.systemConfig.addr
                + FormatDateTime('yyyyMM', Date) + TCommonUtil.TransferGlideNo(1, gl)
            else
            begin
              tmp := RightStr(temp, gl);
              Result := MainForm.systemConfig.addr
                + FormatDateTime('yyyyMM', Date)
                + TCommonUtil.TransferGlideNo(StrToIntDef(tmp, 0) + 1, gl);
            end;
          end;
      else
        begin
          if temp = '' then
            Result := TCommonUtil.TransferGlideNo(1, gl)
          else
            Result := TCommonUtil.TransferGlideNo(StrToIntDef(temp, 0) + 1, gl);
        end;
      end;
    end;
  end;
end;

class function TWeightUtil.backMoveDeletedRecord(glideNo: string): Boolean;
var w: TWeightRecord;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'select * from 作废信息 where (流水号=:glideNo)';
    Parameters.ParamByName('glideNo').Value := glideNo;
    Open;
    if not IsEmpty then
    begin
      w := TWeightRecord.Create;
      try
        w.glideNo := FieldByName('流水号').AsString;
        w.carNo := FieldByName('车号').AsString;
        w.weightType := FieldByName('过磅类型').AsString;
        w.fahuo := FieldByName('发货单位').AsString;
        w.shouhuo := FieldByName('收货单位').AsString;
        w.goods := FieldByName('货名').AsString;
        w.spec := FieldByName('规格').AsString;
        w.gross := FieldByName('毛重').AsFloat;
        w.tare := FieldByName('皮重').AsFloat;
        w.net := FieldByName('净重').AsFloat;
        w.bundle := FieldByName('扣重').AsFloat;
        w.real := FieldByName('实重').AsFloat;
        w.price := FieldByName('单价').AsFloat;
        w.sum := FieldByName('金额').AsFloat;
        w.scale := FieldByName('折方系数').AsFloat;
        w.quanter := FieldByName('方量').AsFloat;
        w.cost := FieldByName('过磅费').AsFloat;
        w.grossMan := FieldByName('毛重司磅员').AsString;
        w.tareMan := FieldByName('皮重司磅员').AsString;
        w.grossAddr := FieldByName('毛重磅号').AsString;
        w.tareAddr := FieldByName('皮重磅号').AsString;
        w.grosstime := FieldByName('毛重时间').AsDateTime;
        w.taretime := FieldByName('皮重时间').AsDateTime;
        w.firstTime := FieldByName('一次过磅时间').AsDateTime;
        w.secondTime := FieldByName('二次过磅时间').AsDateTime;
        w.updateUser := FieldByName('更新人').AsString;
        w.updateTime := FieldByName('更新时间').AsDateTime;
        w.memo := FieldByName('备注').AsString;
        w.printCount := FieldByName('打印次数').AsInteger;
        w.upload := FieldByName('上传否').AsBoolean;
        w.backup1 := FieldByName('备用1').AsString;
        w.backup2 := FieldByName('备用2').AsString;
        w.backup3 := FieldByName('备用3').AsString;
        w.backup4 := FieldByName('备用4').AsString;
        w.backup5 := FieldByName('备用5').AsString;
        w.backup6 := FieldByName('备用6').AsFloat;
        w.backup7 := FieldByName('备用7').AsFloat;
        w.backup8 := FieldByName('备用8').AsFloat;
        w.backup9 := FieldByName('备用9').AsFloat;
        w.backup10 := FieldByName('备用10').AsString;
        w.backup11 := FieldByName('备用11').AsString;
        w.backup12 := FieldByName('备用12').AsString;
        w.backup13 := FieldByName('备用13').AsString;
        w.backup14 := FieldByName('备用14').AsString;
        w.backup15 := FieldByName('备用15').AsFloat;
        w.backup16 := FieldByName('备用16').AsFloat;
        w.backup17 := FieldByName('备用17').AsFloat;
        w.backup18 := FieldByName('备用18').AsFloat;
        with QueryDataModule.ADOQExec2 do
        begin
          Close;
          SQL.Text := 'insert into 称重信息(流水号,车号,过磅类型,发货单位,收货单位,'
            + '货名,规格,毛重,皮重,净重,扣重,实重,单价,金额,折方系数,方量,过磅费,'
            + '毛重司磅员,皮重司磅员,毛重磅号,皮重磅号,毛重时间,皮重时间,一次过磅时间,'
            + '二次过磅时间,更新人,更新时间,备注,打印次数,上传否,备用1,备用2,备用3,'
            + '备用4,备用5,备用6,备用7,备用8,备用9,备用10,备用11,备用12,备用13,'
            + '备用14,备用15,备用16,备用17,备用18) values(:glideNo,:car,:weightType,:fahuo,:shouhuo,:goods,'
            + ':spec,:gross,:tare,:net,:bundle,:real,:price,:sum,:scale,:quanter,:cost,'
            + ':grossMan,:tareMan,:grossAddr,:tareAddr,:grosstime,:taretime,:firstTime,:secondTime,'
            + ':updateUser,:updateTime,:memo,:printCount,:upload,:backup1,:backup2,:backup3,'
            + ':backup4,:backup5,:backup6,:backup7,:backup8,:backup9,:backup10,:backup11,:backup12,'
            + ':backup13,:backup14,:backup15,:backup16,:backup17,:backup18)';
          Parameters.ParamByName('glideNo').Value := w.glideNo;
          Parameters.ParamByName('car').Value := w.carNo;
          Parameters.ParamByName('weightType').Value := w.weightType;
          Parameters.ParamByName('fahuo').Value := w.fahuo;
          Parameters.ParamByName('shouhuo').Value := w.shouhuo;
          Parameters.ParamByName('goods').Value := w.goods;
          Parameters.ParamByName('spec').Value := w.spec;
          Parameters.ParamByName('gross').Value := w.gross;
          Parameters.ParamByName('tare').Value := w.tare;
          Parameters.ParamByName('net').Value := w.net;
          Parameters.ParamByName('bundle').Value := w.bundle;
          Parameters.ParamByName('real').Value := w.real;
          Parameters.ParamByName('price').Value := w.price;
          Parameters.ParamByName('sum').Value := w.sum;
          Parameters.ParamByName('scale').Value := w.scale;
          Parameters.ParamByName('quanter').Value := w.quanter;
          Parameters.ParamByName('cost').Value := w.cost;
          Parameters.ParamByName('grossMan').Value := w.grossMan;
          Parameters.ParamByName('tareMan').Value := w.tareMan;
          Parameters.ParamByName('grossAddr').Value := w.grossAddr;
          Parameters.ParamByName('tareAddr').Value := w.tareAddr;
          Parameters.ParamByName('grosstime').Value := w.grosstime;
          Parameters.ParamByName('taretime').Value := w.taretime;
          Parameters.ParamByName('firstTime').Value := w.firstTime;
          Parameters.ParamByName('secondTime').Value := w.secondTime;
          Parameters.ParamByName('updateUser').Value := w.updateUser;
          Parameters.ParamByName('updateTime').Value := w.updateTime;
          Parameters.ParamByName('memo').Value := w.memo;
          Parameters.ParamByName('printCount').Value := w.printCount;
          Parameters.ParamByName('upload').Value := w.upload;
          Parameters.ParamByName('backup1').Value := w.backup1;
          Parameters.ParamByName('backup2').Value := w.backup2;
          Parameters.ParamByName('backup3').Value := w.backup3;
          Parameters.ParamByName('backup4').Value := w.backup4;
          Parameters.ParamByName('backup5').Value := w.backup5;
          Parameters.ParamByName('backup6').Value := w.backup6;
          Parameters.ParamByName('backup7').Value := w.backup7;
          Parameters.ParamByName('backup8').Value := w.backup8;
          Parameters.ParamByName('backup9').Value := w.backup9;
          Parameters.ParamByName('backup10').Value := w.backup10;
          Parameters.ParamByName('backup11').Value := w.backup11;
          Parameters.ParamByName('backup12').Value := w.backup12;
          Parameters.ParamByName('backup13').Value := w.backup13;
          Parameters.ParamByName('backup14').Value := w.backup14;
          Parameters.ParamByName('backup15').Value := w.backup15;
          Parameters.ParamByName('backup16').Value := w.backup16;
          Parameters.ParamByName('backup17').Value := w.backup17;
          Parameters.ParamByName('backup18').Value := w.backup18;
          try
            ExecSQL;
            Result := True;
          except
            Result := False;
          end;
        end;
      finally
        w.Free;
      end;
    end;
  end;
end;

class function TWeightUtil.getStaticValue(rule1, rule2, group: Integer;
  carNo, faHuo, shouHuo, goods, spec, backup1, backup2, backup3, backup4, backup5,
  backup10, backup11, backup12, backup13, backup14: string;
  gross, tare, net, reald, sum, quanter, backup6, backup7, backup8, backup9,
  backup15, backup16, backup17, backup18: string): Double;
var sqlStr: string;
  initC: Double;
begin
  case group of
    1: begin
        sqlStr := 'select count(流水号) as c from 称重信息';
        initC := 0;
      end;
    2: begin
        sqlStr := 'select sum(毛重) as c from 称重信息';
        initC := StrToFloatDef(gross, 0);
      end;
    3: begin
        sqlStr := 'select sum(皮重) as c from 称重信息';
        initC := StrToFloatDef(tare, 0);
      end;
    4: begin
        sqlStr := 'select sum(净重) as c from 称重信息';
        initC := StrToFloatDef(net, 0);
      end;
    5: begin
        sqlStr := 'select sum(实重) as c from 称重信息';
        initC := StrToFloatDef(reald, 0);
      end;
    6: begin
        sqlStr := 'select sum(金额) as c from 称重信息';
        initC := StrToFloatDef(sum, 0);
      end;
    7: begin
        sqlstr := 'select sum(方量) as c from 称重信息';
        initC := StrToFloatDef(quanter, 0);
      end;
    8: begin
        sqlStr := 'select sum(备用6) as c from 称重信息';
        initC := StrToFloatDef(backup6, 0);
      end;
    9: begin
        sqlStr := 'select sum(备用7) as c from 称重信息';
        initC := StrToFloatDef(backup7, 0);
      end;
    10: begin
        sqlStr := 'select sum(备用8) as c from 称重信息';
        initC := StrToFloatDef(backup8, 0);
      end;
    11: begin
        sqlStr := 'select sum(备用9) as c from 称重信息';
        initC := StrToFloatDef(backup9, 0);
      end;
    12: begin
        sqlStr := 'select sum(备用15) as c from 称重信息';
        initC := StrToFloatDef(backup15, 0);
      end;
    13: begin
        sqlStr := 'select sum(备用16) as c from 称重信息';
        initC := StrToFloatDef(backup16, 0);
      end;
    14: begin
        sqlStr := 'select sum(备用17) as c from 称重信息';
        initC := StrToFloatDef(backup17, 0);
      end;
    15: begin
        sqlStr := 'select sum(备用18) as c from 称重信息';
        initC := StrToFloatDef(backup18, 0);
      end;
  end;

  case rule1 * 100 + rule2 of
    1: sqlStr := sqlStr + ' where 车号=:rule2';
    2: sqlStr := sqlStr + ' where 发货单位=:rule2';
    3: sqlStr := sqlStr + ' where 收货单位=:rule2';
    4: sqlStr := sqlStr + ' where 货名=:rule2';
    5: sqlStr := sqlStr + ' where 规格=:rule2';
    6: sqlStr := sqlStr + ' where 备用1=:rule2';
    7: sqlStr := sqlStr + ' where 备用2=:rule2';
    8: sqlStr := sqlStr + ' where 备用3=:rule2';
    9: sqlStr := sqlStr + ' where 备用4=:rule2';
    10: sqlStr := sqlStr + ' where 备用5=:rule2';
    11: sqlStr := sqlStr + ' where 备用10=:rule2';
    12: sqlStr := sqlStr + ' where 备用11=:rule2';
    13: sqlStr := sqlStr + ' where 备用12=:rule2';
    14: sqlStr := sqlStr + ' where 备用13=:rule2';
    15: sqlStr := sqlStr + ' where 备用14=:rule2';

    100: sqlStr := sqlStr + ' where 车号=:rule1';
    101: sqlStr := sqlStr + ' where (车号=:rule1) and (车号=:rule2)';
    102: sqlStr := sqlStr + ' where (车号=:rule1) and (发货单位=:rule2)';
    103: sqlStr := sqlStr + ' where (车号=:rule1) and (收货单位=:rule2)';
    104: sqlStr := sqlStr + ' where (车号=:rule1) and (货名=:rule2)';
    105: sqlStr := sqlStr + ' where (车号=:rule1) and (规格=:rule2)';
    106: sqlStr := sqlStr + ' where (车号=:rule1) and (备用1=:rule2)';
    107: sqlStr := sqlStr + ' where (车号=:rule1) and (备用2=:rule2)';
    108: sqlStr := sqlStr + ' where (车号=:rule1) and (备用3=:rule2)';
    109: sqlStr := sqlStr + ' where (车号=:rule1) and (备用4=:rule2)';
    110: sqlStr := sqlStr + ' where (车号=:rule1) and (备用5=:rule2)';
    111: sqlStr := sqlStr + ' where (车号=:rule1) and (备用10=:rule2)';
    112: sqlStr := sqlStr + ' where (车号=:rule1) and (备用11=:rule2)';
    113: sqlStr := sqlStr + ' where (车号=:rule1) and (备用12=:rule2)';
    114: sqlStr := sqlStr + ' where (车号=:rule1) and (备用13=:rule2)';
    115: sqlStr := sqlStr + ' where (车号=:rule1) and (备用14=:rule2)';

    200: sqlStr := sqlStr + ' where 发货单位=:rule1';
    201: sqlStr := sqlStr + ' where (发货单位=:rule1) and (车号=:rule2)';
    202: sqlStr := sqlStr + ' where (发货单位=:rule1) and (发货单位=:rule2)';
    203: sqlStr := sqlStr + ' where (发货单位=:rule1) and (收货单位=:rule2)';
    204: sqlStr := sqlStr + ' where (发货单位=:rule1) and (货名=:rule2)';
    205: sqlStr := sqlStr + ' where (发货单位=:rule1) and (规格=:rule2)';
    206: sqlStr := sqlStr + ' where (发货单位=:rule1) and (备用1=:rule2)';
    207: sqlStr := sqlStr + ' where (发货单位=:rule1) and (备用2=:rule2)';
    208: sqlStr := sqlStr + ' where (发货单位=:rule1) and (备用3=:rule2)';
    209: sqlStr := sqlStr + ' where (发货单位=:rule1) and (备用4=:rule2)';
    210: sqlStr := sqlStr + ' where (发货单位=:rule1) and (备用5=:rule2)';
    211: sqlStr := sqlStr + ' where (发货单位=:rule1) and (备用10=:rule2)';
    212: sqlStr := sqlStr + ' where (发货单位=:rule1) and (备用11=:rule2)';
    213: sqlStr := sqlStr + ' where (发货单位=:rule1) and (备用12=:rule2)';
    214: sqlStr := sqlStr + ' where (发货单位=:rule1) and (备用13=:rule2)';
    215: sqlStr := sqlStr + ' where (发货单位=:rule1) and (备用14=:rule2)';

    300: sqlStr := sqlStr + ' where 收货单位=:rule1';
    301: sqlStr := sqlStr + ' where (收货单位=:rule1) and (车号=:rule2)';
    302: sqlStr := sqlStr + ' where (收货单位=:rule1) and (发货单位=:rule2)';
    303: sqlStr := sqlStr + ' where (收货单位=:rule1) and (收货单位=:rule2)';
    304: sqlStr := sqlStr + ' where (收货单位=:rule1) and (货名=:rule2)';
    305: sqlStr := sqlStr + ' where (收货单位=:rule1) and (规格=:rule2)';
    306: sqlStr := sqlStr + ' where (收货单位=:rule1) and (备用1=:rule2)';
    307: sqlStr := sqlStr + ' where (收货单位=:rule1) and (备用2=:rule2)';
    308: sqlStr := sqlStr + ' where (收货单位=:rule1) and (备用3=:rule2)';
    309: sqlStr := sqlStr + ' where (收货单位=:rule1) and (备用4=:rule2)';
    310: sqlStr := sqlStr + ' where (收货单位=:rule1) and (备用5=:rule2)';
    311: sqlStr := sqlStr + ' where (收货单位=:rule1) and (备用10=:rule2)';
    312: sqlStr := sqlStr + ' where (收货单位=:rule1) and (备用11=:rule2)';
    313: sqlStr := sqlStr + ' where (收货单位=:rule1) and (备用12=:rule2)';
    314: sqlStr := sqlStr + ' where (收货单位=:rule1) and (备用13=:rule2)';
    315: sqlStr := sqlStr + ' where (收货单位=:rule1) and (备用14=:rule2)';

    400: sqlStr := sqlStr + ' where 货名=:rule1';
    401: sqlStr := sqlStr + ' where (货名=:rule1) and (车号=:rule2)';
    402: sqlStr := sqlStr + ' where (货名=:rule1) and (发货单位=:rule2)';
    403: sqlStr := sqlStr + ' where (货名=:rule1) and (收货单位=:rule2)';
    404: sqlStr := sqlStr + ' where (货名=:rule1) and (货名=:rule2)';
    405: sqlStr := sqlStr + ' where (货名=:rule1) and (规格=:rule2)';
    406: sqlStr := sqlStr + ' where (货名=:rule1) and (备用1=:rule2)';
    407: sqlStr := sqlStr + ' where (货名=:rule1) and (备用2=:rule2)';
    408: sqlStr := sqlStr + ' where (货名=:rule1) and (备用3=:rule2)';
    409: sqlStr := sqlStr + ' where (货名=:rule1) and (备用4=:rule2)';
    410: sqlStr := sqlStr + ' where (货名=:rule1) and (备用5=:rule2)';
    411: sqlStr := sqlStr + ' where (货名=:rule1) and (备用10=:rule2)';
    412: sqlStr := sqlStr + ' where (货名=:rule1) and (备用11=:rule2)';
    413: sqlStr := sqlStr + ' where (货名=:rule1) and (备用12=:rule2)';
    414: sqlStr := sqlStr + ' where (货名=:rule1) and (备用13=:rule2)';
    415: sqlStr := sqlStr + ' where (货名=:rule1) and (备用14=:rule2)';

    500: sqlStr := sqlStr + ' where 规格=:rule1';
    501: sqlStr := sqlStr + ' where (规格=:rule1) and (车号=:rule2)';
    502: sqlStr := sqlStr + ' where (规格=:rule1) and (发货单位=:rule2)';
    503: sqlStr := sqlStr + ' where (规格=:rule1) and (收货单位=:rule2)';
    504: sqlStr := sqlStr + ' where (规格=:rule1) and (货名=:rule2)';
    505: sqlStr := sqlStr + ' where (规格=:rule1) and (规格=:rule2)';
    506: sqlStr := sqlStr + ' where (规格=:rule1) and (备用1=:rule2)';
    507: sqlStr := sqlStr + ' where (规格=:rule1) and (备用2=:rule2)';
    508: sqlStr := sqlStr + ' where (规格=:rule1) and (备用3=:rule2)';
    509: sqlStr := sqlStr + ' where (规格=:rule1) and (备用4=:rule2)';
    510: sqlStr := sqlStr + ' where (规格=:rule1) and (备用5=:rule2)';
    511: sqlStr := sqlStr + ' where (规格=:rule1) and (备用10=:rule2)';
    512: sqlStr := sqlStr + ' where (规格=:rule1) and (备用11=:rule2)';
    513: sqlStr := sqlStr + ' where (规格=:rule1) and (备用12=:rule2)';
    514: sqlStr := sqlStr + ' where (规格=:rule1) and (备用13=:rule2)';
    515: sqlStr := sqlStr + ' where (规格=:rule1) and (备用14=:rule2)';

    600: sqlStr := sqlStr + ' where 备用1=:rule1';
    601: sqlStr := sqlStr + ' where (备用1=:rule1) and (车号=:rule2)';
    602: sqlStr := sqlStr + ' where (备用1=:rule1) and (发货单位=:rule2)';
    603: sqlStr := sqlStr + ' where (备用1=:rule1) and (收货单位=:rule2)';
    604: sqlStr := sqlStr + ' where (备用1=:rule1) and (货名=:rule2)';
    605: sqlStr := sqlStr + ' where (备用1=:rule1) and (规格=:rule2)';
    606: sqlStr := sqlStr + ' where (备用1=:rule1) and (备用1=:rule2)';
    607: sqlStr := sqlStr + ' where (备用1=:rule1) and (备用2=:rule2)';
    608: sqlStr := sqlStr + ' where (备用1=:rule1) and (备用3=:rule2)';
    609: sqlStr := sqlStr + ' where (备用1=:rule1) and (备用4=:rule2)';
    610: sqlStr := sqlStr + ' where (备用1=:rule1) and (备用5=:rule2)';
    611: sqlStr := sqlStr + ' where (备用1=:rule1) and (备用10=:rule2)';
    612: sqlStr := sqlStr + ' where (备用1=:rule1) and (备用11=:rule2)';
    613: sqlStr := sqlStr + ' where (备用1=:rule1) and (备用12=:rule2)';
    614: sqlStr := sqlStr + ' where (备用1=:rule1) and (备用13=:rule2)';
    615: sqlStr := sqlStr + ' where (备用1=:rule1) and (备用14=:rule2)';

    700: sqlStr := sqlStr + ' where 备用2=:rule1';
    701: sqlStr := sqlStr + ' where (备用2=:rule1) and (车号=:rule2)';
    702: sqlStr := sqlStr + ' where (备用2=:rule1) and (发货单位=:rule2)';
    703: sqlStr := sqlStr + ' where (备用2=:rule1) and (收货单位=:rule2)';
    704: sqlStr := sqlStr + ' where (备用2=:rule1) and (货名=:rule2)';
    705: sqlStr := sqlStr + ' where (备用2=:rule1) and (规格=:rule2)';
    706: sqlStr := sqlStr + ' where (备用2=:rule1) and (备用1=:rule2)';
    707: sqlStr := sqlStr + ' where (备用2=:rule1) and (备用2=:rule2)';
    708: sqlStr := sqlStr + ' where (备用2=:rule1) and (备用3=:rule2)';
    709: sqlStr := sqlStr + ' where (备用2=:rule1) and (备用4=:rule2)';
    710: sqlStr := sqlStr + ' where (备用2=:rule1) and (备用5=:rule2)';
    711: sqlStr := sqlStr + ' where (备用2=:rule1) and (备用10=:rule2)';
    712: sqlStr := sqlStr + ' where (备用2=:rule1) and (备用11=:rule2)';
    713: sqlStr := sqlStr + ' where (备用2=:rule1) and (备用12=:rule2)';
    714: sqlStr := sqlStr + ' where (备用2=:rule1) and (备用13=:rule2)';
    715: sqlStr := sqlStr + ' where (备用2=:rule1) and (备用14=:rule2)';

    800: sqlStr := sqlStr + ' where 备用3=:rule1';
    801: sqlStr := sqlStr + ' where (备用3=:rule1) and (车号=:rule2)';
    802: sqlStr := sqlStr + ' where (备用3=:rule1) and (发货单位=:rule2)';
    803: sqlStr := sqlStr + ' where (备用3=:rule1) and (收货单位=:rule2)';
    804: sqlStr := sqlStr + ' where (备用3=:rule1) and (货名=:rule2)';
    805: sqlStr := sqlStr + ' where (备用3=:rule1) and (规格=:rule2)';
    806: sqlStr := sqlStr + ' where (备用3=:rule1) and (备用1=:rule2)';
    807: sqlStr := sqlStr + ' where (备用3=:rule1) and (备用2=:rule2)';
    808: sqlStr := sqlStr + ' where (备用3=:rule1) and (备用3=:rule2)';
    809: sqlStr := sqlStr + ' where (备用3=:rule1) and (备用4=:rule2)';
    810: sqlStr := sqlStr + ' where (备用3=:rule1) and (备用5=:rule2)';
    811: sqlStr := sqlStr + ' where (备用3=:rule1) and (备用10=:rule2)';
    812: sqlStr := sqlStr + ' where (备用3=:rule1) and (备用11=:rule2)';
    813: sqlStr := sqlStr + ' where (备用3=:rule1) and (备用12=:rule2)';
    814: sqlStr := sqlStr + ' where (备用3=:rule1) and (备用13=:rule2)';
    815: sqlStr := sqlStr + ' where (备用3=:rule1) and (备用14=:rule2)';

    900: sqlStr := sqlStr + ' where 备用4=:rule1';
    901: sqlStr := sqlStr + ' where (备用4=:rule1) and (车号=:rule2)';
    902: sqlStr := sqlStr + ' where (备用4=:rule1) and (发货单位=:rule2)';
    903: sqlStr := sqlStr + ' where (备用4=:rule1) and (收货单位=:rule2)';
    904: sqlStr := sqlStr + ' where (备用4=:rule1) and (货名=:rule2)';
    905: sqlStr := sqlStr + ' where (备用4=:rule1) and (规格=:rule2)';
    906: sqlStr := sqlStr + ' where (备用4=:rule1) and (备用1=:rule2)';
    907: sqlStr := sqlStr + ' where (备用4=:rule1) and (备用2=:rule2)';
    908: sqlStr := sqlStr + ' where (备用4=:rule1) and (备用3=:rule2)';
    909: sqlStr := sqlStr + ' where (备用4=:rule1) and (备用4=:rule2)';
    910: sqlStr := sqlStr + ' where (备用4=:rule1) and (备用5=:rule2)';
    911: sqlStr := sqlStr + ' where (备用4=:rule1) and (备用10=:rule2)';
    912: sqlStr := sqlStr + ' where (备用4=:rule1) and (备用11=:rule2)';
    913: sqlStr := sqlStr + ' where (备用4=:rule1) and (备用12=:rule2)';
    914: sqlStr := sqlStr + ' where (备用4=:rule1) and (备用13=:rule2)';
    915: sqlStr := sqlStr + ' where (备用4=:rule1) and (备用14=:rule2)';

    1000: sqlStr := sqlStr + ' where 备用5=:rule1';
    1001: sqlStr := sqlStr + ' where (备用5=:rule1) and (车号=:rule2)';
    1002: sqlStr := sqlStr + ' where (备用5=:rule1) and (发货单位=:rule2)';
    1003: sqlStr := sqlStr + ' where (备用5=:rule1) and (收货单位=:rule2)';
    1004: sqlStr := sqlStr + ' where (备用5=:rule1) and (货名=:rule2)';
    1005: sqlStr := sqlStr + ' where (备用5=:rule1) and (规格=:rule2)';
    1006: sqlStr := sqlStr + ' where (备用5=:rule1) and (备用1=:rule2)';
    1007: sqlStr := sqlStr + ' where (备用5=:rule1) and (备用2=:rule2)';
    1008: sqlStr := sqlStr + ' where (备用5=:rule1) and (备用3=:rule2)';
    1009: sqlStr := sqlStr + ' where (备用5=:rule1) and (备用4=:rule2)';
    1010: sqlStr := sqlStr + ' where (备用5=:rule1) and (备用5=:rule2)';
    1011: sqlStr := sqlStr + ' where (备用5=:rule1) and (备用10=:rule2)';
    1012: sqlStr := sqlStr + ' where (备用5=:rule1) and (备用11=:rule2)';
    1013: sqlStr := sqlStr + ' where (备用5=:rule1) and (备用12=:rule2)';
    1014: sqlStr := sqlStr + ' where (备用5=:rule1) and (备用13=:rule2)';
    1015: sqlStr := sqlStr + ' where (备用5=:rule1) and (备用14=:rule2)';

    1100: sqlStr := sqlStr + ' where 备用10=:rule1';
    1101: sqlStr := sqlStr + ' where (备用10=:rule1) and (车号=:rule2)';
    1102: sqlStr := sqlStr + ' where (备用10=:rule1) and (发货单位=:rule2)';
    1103: sqlStr := sqlStr + ' where (备用10=:rule1) and (收货单位=:rule2)';
    1104: sqlStr := sqlStr + ' where (备用10=:rule1) and (货名=:rule2)';
    1105: sqlStr := sqlStr + ' where (备用10=:rule1) and (规格=:rule2)';
    1106: sqlStr := sqlStr + ' where (备用10=:rule1) and (备用1=:rule2)';
    1107: sqlStr := sqlStr + ' where (备用10=:rule1) and (备用2=:rule2)';
    1108: sqlStr := sqlStr + ' where (备用10=:rule1) and (备用3=:rule2)';
    1109: sqlStr := sqlStr + ' where (备用10=:rule1) and (备用4=:rule2)';
    1110: sqlStr := sqlStr + ' where (备用10=:rule1) and (备用5=:rule2)';
    1111: sqlStr := sqlStr + ' where (备用10=:rule1) and (备用10=:rule2)';
    1112: sqlStr := sqlStr + ' where (备用10=:rule1) and (备用11=:rule2)';
    1113: sqlStr := sqlStr + ' where (备用10=:rule1) and (备用12=:rule2)';
    1114: sqlStr := sqlStr + ' where (备用10=:rule1) and (备用13=:rule2)';
    1115: sqlStr := sqlStr + ' where (备用10=:rule1) and (备用14=:rule2)';

    1200: sqlStr := sqlStr + ' where 备用11=:rule1';
    1201: sqlStr := sqlStr + ' where (备用11=:rule1) and (车号=:rule2)';
    1202: sqlStr := sqlStr + ' where (备用11=:rule1) and (发货单位=:rule2)';
    1203: sqlStr := sqlStr + ' where (备用11=:rule1) and (收货单位=:rule2)';
    1204: sqlStr := sqlStr + ' where (备用11=:rule1) and (货名=:rule2)';
    1205: sqlStr := sqlStr + ' where (备用11=:rule1) and (规格=:rule2)';
    1206: sqlStr := sqlStr + ' where (备用11=:rule1) and (备用1=:rule2)';
    1207: sqlStr := sqlStr + ' where (备用11=:rule1) and (备用2=:rule2)';
    1208: sqlStr := sqlStr + ' where (备用11=:rule1) and (备用3=:rule2)';
    1209: sqlStr := sqlStr + ' where (备用11=:rule1) and (备用4=:rule2)';
    1210: sqlStr := sqlStr + ' where (备用11=:rule1) and (备用5=:rule2)';
    1211: sqlStr := sqlStr + ' where (备用11=:rule1) and (备用10=:rule2)';
    1212: sqlStr := sqlStr + ' where (备用11=:rule1) and (备用11=:rule2)';
    1213: sqlStr := sqlStr + ' where (备用11=:rule1) and (备用12=:rule2)';
    1214: sqlStr := sqlStr + ' where (备用11=:rule1) and (备用13=:rule2)';
    1215: sqlStr := sqlStr + ' where (备用11=:rule1) and (备用14=:rule2)';

    1300: sqlStr := sqlStr + ' where 备用12=:rule1';
    1301: sqlStr := sqlStr + ' where (备用12=:rule1) and (车号=:rule2)';
    1302: sqlStr := sqlStr + ' where (备用12=:rule1) and (发货单位=:rule2)';
    1303: sqlStr := sqlStr + ' where (备用12=:rule1) and (收货单位=:rule2)';
    1304: sqlStr := sqlStr + ' where (备用12=:rule1) and (货名=:rule2)';
    1305: sqlStr := sqlStr + ' where (备用12=:rule1) and (规格=:rule2)';
    1306: sqlStr := sqlStr + ' where (备用12=:rule1) and (备用1=:rule2)';
    1307: sqlStr := sqlStr + ' where (备用12=:rule1) and (备用2=:rule2)';
    1308: sqlStr := sqlStr + ' where (备用12=:rule1) and (备用3=:rule2)';
    1309: sqlStr := sqlStr + ' where (备用12=:rule1) and (备用4=:rule2)';
    1310: sqlStr := sqlStr + ' where (备用12=:rule1) and (备用5=:rule2)';
    1311: sqlStr := sqlStr + ' where (备用12=:rule1) and (备用10=:rule2)';
    1312: sqlStr := sqlStr + ' where (备用12=:rule1) and (备用11=:rule2)';
    1313: sqlStr := sqlStr + ' where (备用12=:rule1) and (备用12=:rule2)';
    1314: sqlStr := sqlStr + ' where (备用12=:rule1) and (备用13=:rule2)';
    1315: sqlStr := sqlStr + ' where (备用12=:rule1) and (备用14=:rule2)';

    1400: sqlStr := sqlStr + ' where 备用13=:rule1';
    1401: sqlStr := sqlStr + ' where (备用13=:rule1) and (车号=:rule2)';
    1402: sqlStr := sqlStr + ' where (备用13=:rule1) and (发货单位=:rule2)';
    1403: sqlStr := sqlStr + ' where (备用13=:rule1) and (收货单位=:rule2)';
    1404: sqlStr := sqlStr + ' where (备用13=:rule1) and (货名=:rule2)';
    1405: sqlStr := sqlStr + ' where (备用13=:rule1) and (规格=:rule2)';
    1406: sqlStr := sqlStr + ' where (备用13=:rule1) and (备用1=:rule2)';
    1407: sqlStr := sqlStr + ' where (备用13=:rule1) and (备用2=:rule2)';
    1408: sqlStr := sqlStr + ' where (备用13=:rule1) and (备用3=:rule2)';
    1409: sqlStr := sqlStr + ' where (备用13=:rule1) and (备用4=:rule2)';
    1410: sqlStr := sqlStr + ' where (备用13=:rule1) and (备用5=:rule2)';
    1411: sqlStr := sqlStr + ' where (备用13=:rule1) and (备用10=:rule2)';
    1412: sqlStr := sqlStr + ' where (备用13=:rule1) and (备用11=:rule2)';
    1413: sqlStr := sqlStr + ' where (备用13=:rule1) and (备用12=:rule2)';
    1414: sqlStr := sqlStr + ' where (备用13=:rule1) and (备用13=:rule2)';
    1415: sqlStr := sqlStr + ' where (备用13=:rule1) and (备用14=:rule2)';

    1500: sqlStr := sqlStr + ' where 备用14=:rule1';
    1501: sqlStr := sqlStr + ' where (备用14=:rule1) and (车号=:rule2)';
    1502: sqlStr := sqlStr + ' where (备用14=:rule1) and (发货单位=:rule2)';
    1503: sqlStr := sqlStr + ' where (备用14=:rule1) and (收货单位=:rule2)';
    1504: sqlStr := sqlStr + ' where (备用14=:rule1) and (货名=:rule2)';
    1505: sqlStr := sqlStr + ' where (备用14=:rule1) and (规格=:rule2)';
    1506: sqlStr := sqlStr + ' where (备用14=:rule1) and (备用1=:rule2)';
    1507: sqlStr := sqlStr + ' where (备用14=:rule1) and (备用2=:rule2)';
    1508: sqlStr := sqlStr + ' where (备用14=:rule1) and (备用3=:rule2)';
    1509: sqlStr := sqlStr + ' where (备用14=:rule1) and (备用4=:rule2)';
    1510: sqlStr := sqlStr + ' where (备用14=:rule1) and (备用5=:rule2)';
    1511: sqlStr := sqlStr + ' where (备用14=:rule1) and (备用10=:rule2)';
    1512: sqlStr := sqlStr + ' where (备用14=:rule1) and (备用11=:rule2)';
    1513: sqlStr := sqlStr + ' where (备用14=:rule1) and (备用12=:rule2)';
    1514: sqlStr := sqlStr + ' where (备用14=:rule1) and (备用13=:rule2)';
    1515: sqlStr := sqlStr + ' where (备用14=:rule1) and (备用14=:rule2)';
  end;

  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := sqlStr;
    case rule1 * 100 + rule2 of
      1: Parameters.ParamByName('rule2').Value := carNo;
      2: Parameters.ParamByName('rule2').Value := faHuo;
      3: Parameters.ParamByName('rule2').Value := shouHuo;
      4: Parameters.ParamByName('rule2').Value := goods;
      5: Parameters.ParamByName('rule2').Value := spec;
      6: Parameters.ParamByName('rule2').Value := backup1;
      7: Parameters.ParamByName('rule2').Value := backup2;
      8: Parameters.ParamByName('rule2').Value := backup3;
      9: Parameters.ParamByName('rule2').Value := backup4;
      10: Parameters.ParamByName('rule2').Value := backup5;
      11: Parameters.ParamByName('rule2').Value := backup10;
      12: Parameters.ParamByName('rule2').Value := backup11;
      13: Parameters.ParamByName('rule2').Value := backup12;
      14: Parameters.ParamByName('rule2').Value := backup13;
      15: Parameters.ParamByName('rule2').Value := backup14;

      100: Parameters.ParamByName('rule1').Value := carNo;
      101: begin
          Parameters.ParamByName('rule1').Value := carNo;
          Parameters.ParamByName('rule2').Value := carNo;
        end;
      102: begin
          Parameters.ParamByName('rule1').Value := carNo;
          Parameters.ParamByName('rule2').Value := faHuo;
        end;
      103: begin
          Parameters.ParamByName('rule1').Value := carNo;
          Parameters.ParamByName('rule2').Value := shouHuo;
        end;
      104: begin
          Parameters.ParamByName('rule1').Value := carNo;
          Parameters.ParamByName('rule2').Value := goods;
        end;
      105: begin
          Parameters.ParamByName('rule1').Value := carNo;
          Parameters.ParamByName('rule2').Value := spec;
        end;
      106: begin
          Parameters.ParamByName('rule1').Value := carNo;
          Parameters.ParamByName('rule2').Value := backup1;
        end;
      107: begin
          Parameters.ParamByName('rule1').Value := carNo;
          Parameters.ParamByName('rule2').Value := backup2;
        end;
      108: begin
          Parameters.ParamByName('rule1').Value := carNo;
          Parameters.ParamByName('rule2').Value := backup3;
        end;
      109: begin
          Parameters.ParamByName('rule1').Value := carNo;
          Parameters.ParamByName('rule2').Value := backup4;
        end;
      110: begin
          Parameters.ParamByName('rule1').Value := carNo;
          Parameters.ParamByName('rule2').Value := backup5;
        end;
      111: begin
          Parameters.ParamByName('rule1').Value := carNo;
          Parameters.ParamByName('rule2').Value := backup10;
        end;
      112: begin
          Parameters.ParamByName('rule1').Value := carNo;
          Parameters.ParamByName('rule2').Value := backup11;
        end;
      113: begin
          Parameters.ParamByName('rule1').Value := carNo;
          Parameters.ParamByName('rule2').Value := backup12;
        end;
      114: begin
          Parameters.ParamByName('rule1').Value := carNo;
          Parameters.ParamByName('rule2').Value := backup13;
        end;
      115: begin
          Parameters.ParamByName('rule1').Value := carNo;
          Parameters.ParamByName('rule2').Value := backup14;
        end;

      200: Parameters.ParamByName('rule1').Value := faHuo;
      201: begin
          Parameters.ParamByName('rule1').Value := faHuo;
          Parameters.ParamByName('rule2').Value := carNo;
        end;
      202: begin
          Parameters.ParamByName('rule1').Value := faHuo;
          Parameters.ParamByName('rule2').Value := faHuo;
        end;
      203: begin
          Parameters.ParamByName('rule1').Value := faHuo;
          Parameters.ParamByName('rule2').Value := shouHuo;
        end;
      204: begin
          Parameters.ParamByName('rule1').Value := faHuo;
          Parameters.ParamByName('rule2').Value := goods;
        end;
      205: begin
          Parameters.ParamByName('rule1').Value := faHuo;
          Parameters.ParamByName('rule2').Value := spec;
        end;
      206: begin
          Parameters.ParamByName('rule1').Value := faHuo;
          Parameters.ParamByName('rule2').Value := backup1;
        end;
      207: begin
          Parameters.ParamByName('rule1').Value := faHuo;
          Parameters.ParamByName('rule2').Value := backup2;
        end;
      208: begin
          Parameters.ParamByName('rule1').Value := faHuo;
          Parameters.ParamByName('rule2').Value := backup3;
        end;
      209: begin
          Parameters.ParamByName('rule1').Value := faHuo;
          Parameters.ParamByName('rule2').Value := backup4;
        end;
      210: begin
          Parameters.ParamByName('rule1').Value := faHuo;
          Parameters.ParamByName('rule2').Value := backup5;
        end;
      211: begin
          Parameters.ParamByName('rule1').Value := faHuo;
          Parameters.ParamByName('rule2').Value := backup10;
        end;
      212: begin
          Parameters.ParamByName('rule1').Value := faHuo;
          Parameters.ParamByName('rule2').Value := backup11;
        end;
      213: begin
          Parameters.ParamByName('rule1').Value := faHuo;
          Parameters.ParamByName('rule2').Value := backup12;
        end;
      214: begin
          Parameters.ParamByName('rule1').Value := faHuo;
          Parameters.ParamByName('rule2').Value := backup13;
        end;
      215: begin
          Parameters.ParamByName('rule1').Value := faHuo;
          Parameters.ParamByName('rule2').Value := backup14;
        end;

      300: Parameters.ParamByName('rule1').Value := shouHuo;
      301: begin
          Parameters.ParamByName('rule1').Value := shouHuo;
          Parameters.ParamByName('rule2').Value := carNo;
        end;
      302: begin
          Parameters.ParamByName('rule1').Value := shouHuo;
          Parameters.ParamByName('rule2').Value := faHuo;
        end;
      303: begin
          Parameters.ParamByName('rule1').Value := shouHuo;
          Parameters.ParamByName('rule2').Value := shouHuo;
        end;
      304: begin
          Parameters.ParamByName('rule1').Value := shouHuo;
          Parameters.ParamByName('rule2').Value := goods;
        end;
      305: begin
          Parameters.ParamByName('rule1').Value := shouHuo;
          Parameters.ParamByName('rule2').Value := spec;
        end;
      306: begin
          Parameters.ParamByName('rule1').Value := shouHuo;
          Parameters.ParamByName('rule2').Value := backup1;
        end;
      307: begin
          Parameters.ParamByName('rule1').Value := shouHuo;
          Parameters.ParamByName('rule2').Value := backup2;
        end;
      308: begin
          Parameters.ParamByName('rule1').Value := shouHuo;
          Parameters.ParamByName('rule2').Value := backup3;
        end;
      309: begin
          Parameters.ParamByName('rule1').Value := shouHuo;
          Parameters.ParamByName('rule2').Value := backup4;
        end;
      310: begin
          Parameters.ParamByName('rule1').Value := shouHuo;
          Parameters.ParamByName('rule2').Value := backup5;
        end;
      311: begin
          Parameters.ParamByName('rule1').Value := shouHuo;
          Parameters.ParamByName('rule2').Value := backup10;
        end;
      312: begin
          Parameters.ParamByName('rule1').Value := shouHuo;
          Parameters.ParamByName('rule2').Value := backup11;
        end;
      313: begin
          Parameters.ParamByName('rule1').Value := shouHuo;
          Parameters.ParamByName('rule2').Value := backup12;
        end;
      314: begin
          Parameters.ParamByName('rule1').Value := shouHuo;
          Parameters.ParamByName('rule2').Value := backup13;
        end;
      315: begin
          Parameters.ParamByName('rule1').Value := shouHuo;
          Parameters.ParamByName('rule2').Value := backup14;
        end;

      400: Parameters.ParamByName('rule1').Value := goods;
      401: begin
          Parameters.ParamByName('rule1').Value := goods;
          Parameters.ParamByName('rule2').Value := carNo;
        end;
      402: begin
          Parameters.ParamByName('rule1').Value := goods;
          Parameters.ParamByName('rule2').Value := faHuo;
        end;
      403: begin
          Parameters.ParamByName('rule1').Value := goods;
          Parameters.ParamByName('rule2').Value := shouHuo;
        end;
      404: begin
          Parameters.ParamByName('rule1').Value := goods;
          Parameters.ParamByName('rule2').Value := goods;
        end;
      405: begin
          Parameters.ParamByName('rule1').Value := goods;
          Parameters.ParamByName('rule2').Value := spec;
        end;
      406: begin
          Parameters.ParamByName('rule1').Value := goods;
          Parameters.ParamByName('rule2').Value := backup1;
        end;
      407: begin
          Parameters.ParamByName('rule1').Value := goods;
          Parameters.ParamByName('rule2').Value := backup2;
        end;
      408: begin
          Parameters.ParamByName('rule1').Value := goods;
          Parameters.ParamByName('rule2').Value := backup3;
        end;
      409: begin
          Parameters.ParamByName('rule1').Value := goods;
          Parameters.ParamByName('rule2').Value := backup4;
        end;
      410: begin
          Parameters.ParamByName('rule1').Value := goods;
          Parameters.ParamByName('rule2').Value := backup5;
        end;
      411: begin
          Parameters.ParamByName('rule1').Value := goods;
          Parameters.ParamByName('rule2').Value := backup10;
        end;
      412: begin
          Parameters.ParamByName('rule1').Value := goods;
          Parameters.ParamByName('rule2').Value := backup11;
        end;
      413: begin
          Parameters.ParamByName('rule1').Value := goods;
          Parameters.ParamByName('rule2').Value := backup12;
        end;
      414: begin
          Parameters.ParamByName('rule1').Value := goods;
          Parameters.ParamByName('rule2').Value := backup13;
        end;
      415: begin
          Parameters.ParamByName('rule1').Value := goods;
          Parameters.ParamByName('rule2').Value := backup14;
        end;

      500: Parameters.ParamByName('rule1').Value := spec;
      501: begin
          Parameters.ParamByName('rule1').Value := spec;
          Parameters.ParamByName('rule2').Value := carNo;
        end;
      502: begin
          Parameters.ParamByName('rule1').Value := spec;
          Parameters.ParamByName('rule2').Value := faHuo;
        end;
      503: begin
          Parameters.ParamByName('rule1').Value := spec;
          Parameters.ParamByName('rule2').Value := shouHuo;
        end;
      504: begin
          Parameters.ParamByName('rule1').Value := spec;
          Parameters.ParamByName('rule2').Value := goods;
        end;
      505: begin
          Parameters.ParamByName('rule1').Value := spec;
          Parameters.ParamByName('rule2').Value := spec;
        end;
      506: begin
          Parameters.ParamByName('rule1').Value := spec;
          Parameters.ParamByName('rule2').Value := backup1;
        end;
      507: begin
          Parameters.ParamByName('rule1').Value := spec;
          Parameters.ParamByName('rule2').Value := backup2;
        end;
      508: begin
          Parameters.ParamByName('rule1').Value := spec;
          Parameters.ParamByName('rule2').Value := backup3;
        end;
      509: begin
          Parameters.ParamByName('rule1').Value := spec;
          Parameters.ParamByName('rule2').Value := backup4;
        end;
      510: begin
          Parameters.ParamByName('rule1').Value := spec;
          Parameters.ParamByName('rule2').Value := backup5;
        end;
      511: begin
          Parameters.ParamByName('rule1').Value := spec;
          Parameters.ParamByName('rule2').Value := backup10;
        end;
      512: begin
          Parameters.ParamByName('rule1').Value := spec;
          Parameters.ParamByName('rule2').Value := backup11;
        end;
      513: begin
          Parameters.ParamByName('rule1').Value := spec;
          Parameters.ParamByName('rule2').Value := backup12;
        end;
      514: begin
          Parameters.ParamByName('rule1').Value := spec;
          Parameters.ParamByName('rule2').Value := backup13;
        end;
      515: begin
          Parameters.ParamByName('rule1').Value := spec;
          Parameters.ParamByName('rule2').Value := backup14;
        end;

      600: Parameters.ParamByName('rule1').Value := backup1;
      601: begin
          Parameters.ParamByName('rule1').Value := backup1;
          Parameters.ParamByName('rule2').Value := carNo;
        end;
      602: begin
          Parameters.ParamByName('rule1').Value := backup1;
          Parameters.ParamByName('rule2').Value := faHuo;
        end;
      603: begin
          Parameters.ParamByName('rule1').Value := backup1;
          Parameters.ParamByName('rule2').Value := shouHuo;
        end;
      604: begin
          Parameters.ParamByName('rule1').Value := backup1;
          Parameters.ParamByName('rule2').Value := goods;
        end;
      605: begin
          Parameters.ParamByName('rule1').Value := backup1;
          Parameters.ParamByName('rule2').Value := spec;
        end;
      606: begin
          Parameters.ParamByName('rule1').Value := backup1;
          Parameters.ParamByName('rule2').Value := backup1;
        end;
      607: begin
          Parameters.ParamByName('rule1').Value := backup1;
          Parameters.ParamByName('rule2').Value := backup2;
        end;
      608: begin
          Parameters.ParamByName('rule1').Value := backup1;
          Parameters.ParamByName('rule2').Value := backup3;
        end;
      609: begin
          Parameters.ParamByName('rule1').Value := backup1;
          Parameters.ParamByName('rule2').Value := backup4;
        end;
      610: begin
          Parameters.ParamByName('rule1').Value := backup1;
          Parameters.ParamByName('rule2').Value := backup5;
        end;
      611: begin
          Parameters.ParamByName('rule1').Value := backup1;
          Parameters.ParamByName('rule2').Value := backup10;
        end;
      612: begin
          Parameters.ParamByName('rule1').Value := backup1;
          Parameters.ParamByName('rule2').Value := backup11;
        end;
      613: begin
          Parameters.ParamByName('rule1').Value := backup1;
          Parameters.ParamByName('rule2').Value := backup12;
        end;
      614: begin
          Parameters.ParamByName('rule1').Value := backup1;
          Parameters.ParamByName('rule2').Value := backup13;
        end;
      615: begin
          Parameters.ParamByName('rule1').Value := backup1;
          Parameters.ParamByName('rule2').Value := backup14;
        end;

      700: Parameters.ParamByName('rule1').Value := backup2;
      701: begin
          Parameters.ParamByName('rule1').Value := backup2;
          Parameters.ParamByName('rule2').Value := carNo;
        end;
      702: begin
          Parameters.ParamByName('rule1').Value := backup2;
          Parameters.ParamByName('rule2').Value := faHuo;
        end;
      703: begin
          Parameters.ParamByName('rule1').Value := backup2;
          Parameters.ParamByName('rule2').Value := shouHuo;
        end;
      704: begin
          Parameters.ParamByName('rule1').Value := backup2;
          Parameters.ParamByName('rule2').Value := goods;
        end;
      705: begin
          Parameters.ParamByName('rule1').Value := backup2;
          Parameters.ParamByName('rule2').Value := spec;
        end;
      706: begin
          Parameters.ParamByName('rule1').Value := backup2;
          Parameters.ParamByName('rule2').Value := backup1;
        end;
      707: begin
          Parameters.ParamByName('rule1').Value := backup2;
          Parameters.ParamByName('rule2').Value := backup2;
        end;
      708: begin
          Parameters.ParamByName('rule1').Value := backup2;
          Parameters.ParamByName('rule2').Value := backup3;
        end;
      709: begin
          Parameters.ParamByName('rule1').Value := backup2;
          Parameters.ParamByName('rule2').Value := backup4;
        end;
      710: begin
          Parameters.ParamByName('rule1').Value := backup2;
          Parameters.ParamByName('rule2').Value := backup5;
        end;
      711: begin
          Parameters.ParamByName('rule1').Value := backup2;
          Parameters.ParamByName('rule2').Value := backup10;
        end;
      712: begin
          Parameters.ParamByName('rule1').Value := backup2;
          Parameters.ParamByName('rule2').Value := backup11;
        end;
      713: begin
          Parameters.ParamByName('rule1').Value := backup2;
          Parameters.ParamByName('rule2').Value := backup12;
        end;
      714: begin
          Parameters.ParamByName('rule1').Value := backup2;
          Parameters.ParamByName('rule2').Value := backup13;
        end;
      715: begin
          Parameters.ParamByName('rule1').Value := backup2;
          Parameters.ParamByName('rule2').Value := backup14;
        end;

      800: Parameters.ParamByName('rule1').Value := backup3;
      801: begin
          Parameters.ParamByName('rule1').Value := backup3;
          Parameters.ParamByName('rule2').Value := carNo;
        end;
      802: begin
          Parameters.ParamByName('rule1').Value := backup3;
          Parameters.ParamByName('rule2').Value := faHuo;
        end;
      803: begin
          Parameters.ParamByName('rule1').Value := backup3;
          Parameters.ParamByName('rule2').Value := shouHuo;
        end;
      804: begin
          Parameters.ParamByName('rule1').Value := backup3;
          Parameters.ParamByName('rule2').Value := goods;
        end;
      805: begin
          Parameters.ParamByName('rule1').Value := backup3;
          Parameters.ParamByName('rule2').Value := spec;
        end;
      806: begin
          Parameters.ParamByName('rule1').Value := backup3;
          Parameters.ParamByName('rule2').Value := backup1;
        end;
      807: begin
          Parameters.ParamByName('rule1').Value := backup3;
          Parameters.ParamByName('rule2').Value := backup2;
        end;
      808: begin
          Parameters.ParamByName('rule1').Value := backup3;
          Parameters.ParamByName('rule2').Value := backup3;
        end;
      809: begin
          Parameters.ParamByName('rule1').Value := backup3;
          Parameters.ParamByName('rule2').Value := backup4;
        end;
      810: begin
          Parameters.ParamByName('rule1').Value := backup3;
          Parameters.ParamByName('rule2').Value := backup5;
        end;
      811: begin
          Parameters.ParamByName('rule1').Value := backup3;
          Parameters.ParamByName('rule2').Value := backup10;
        end;
      812: begin
          Parameters.ParamByName('rule1').Value := backup3;
          Parameters.ParamByName('rule2').Value := backup11;
        end;
      813: begin
          Parameters.ParamByName('rule1').Value := backup3;
          Parameters.ParamByName('rule2').Value := backup12;
        end;
      814: begin
          Parameters.ParamByName('rule1').Value := backup3;
          Parameters.ParamByName('rule2').Value := backup13;
        end;
      815: begin
          Parameters.ParamByName('rule1').Value := backup3;
          Parameters.ParamByName('rule2').Value := backup14;
        end;

      900: Parameters.ParamByName('rule1').Value := backup4;
      901: begin
          Parameters.ParamByName('rule1').Value := backup4;
          Parameters.ParamByName('rule2').Value := carNo;
        end;
      902: begin
          Parameters.ParamByName('rule1').Value := backup4;
          Parameters.ParamByName('rule2').Value := faHuo;
        end;
      903: begin
          Parameters.ParamByName('rule1').Value := backup4;
          Parameters.ParamByName('rule2').Value := shouHuo;
        end;
      904: begin
          Parameters.ParamByName('rule1').Value := backup4;
          Parameters.ParamByName('rule2').Value := goods;
        end;
      905: begin
          Parameters.ParamByName('rule1').Value := backup4;
          Parameters.ParamByName('rule2').Value := spec;
        end;
      906: begin
          Parameters.ParamByName('rule1').Value := backup4;
          Parameters.ParamByName('rule2').Value := backup1;
        end;
      907: begin
          Parameters.ParamByName('rule1').Value := backup4;
          Parameters.ParamByName('rule2').Value := backup2;
        end;
      908: begin
          Parameters.ParamByName('rule1').Value := backup4;
          Parameters.ParamByName('rule2').Value := backup3;
        end;
      909: begin
          Parameters.ParamByName('rule1').Value := backup4;
          Parameters.ParamByName('rule2').Value := backup4;
        end;
      910: begin
          Parameters.ParamByName('rule1').Value := backup4;
          Parameters.ParamByName('rule2').Value := backup5;
        end;
      911: begin
          Parameters.ParamByName('rule1').Value := backup4;
          Parameters.ParamByName('rule2').Value := backup10;
        end;
      912: begin
          Parameters.ParamByName('rule1').Value := backup4;
          Parameters.ParamByName('rule2').Value := backup11;
        end;
      913: begin
          Parameters.ParamByName('rule1').Value := backup4;
          Parameters.ParamByName('rule2').Value := backup12;
        end;
      914: begin
          Parameters.ParamByName('rule1').Value := backup4;
          Parameters.ParamByName('rule2').Value := backup13;
        end;
      915: begin
          Parameters.ParamByName('rule1').Value := backup4;
          Parameters.ParamByName('rule2').Value := backup14;
        end;

      1000: Parameters.ParamByName('rule1').Value := backup5;
      1001: begin
          Parameters.ParamByName('rule1').Value := backup5;
          Parameters.ParamByName('rule2').Value := carNo;
        end;
      1002: begin
          Parameters.ParamByName('rule1').Value := backup5;
          Parameters.ParamByName('rule2').Value := faHuo;
        end;
      1003: begin
          Parameters.ParamByName('rule1').Value := backup5;
          Parameters.ParamByName('rule2').Value := shouHuo;
        end;
      1004: begin
          Parameters.ParamByName('rule1').Value := backup5;
          Parameters.ParamByName('rule2').Value := goods;
        end;
      1005: begin
          Parameters.ParamByName('rule1').Value := backup5;
          Parameters.ParamByName('rule2').Value := spec;
        end;
      1006: begin
          Parameters.ParamByName('rule1').Value := backup5;
          Parameters.ParamByName('rule2').Value := backup1;
        end;
      1007: begin
          Parameters.ParamByName('rule1').Value := backup5;
          Parameters.ParamByName('rule2').Value := backup2;
        end;
      1008: begin
          Parameters.ParamByName('rule1').Value := backup5;
          Parameters.ParamByName('rule2').Value := backup3;
        end;
      1009: begin
          Parameters.ParamByName('rule1').Value := backup5;
          Parameters.ParamByName('rule2').Value := backup4;
        end;
      1010: begin
          Parameters.ParamByName('rule1').Value := backup5;
          Parameters.ParamByName('rule2').Value := backup5;
        end;
      1011: begin
          Parameters.ParamByName('rule1').Value := backup5;
          Parameters.ParamByName('rule2').Value := backup10;
        end;
      1012: begin
          Parameters.ParamByName('rule1').Value := backup5;
          Parameters.ParamByName('rule2').Value := backup11;
        end;
      1013: begin
          Parameters.ParamByName('rule1').Value := backup5;
          Parameters.ParamByName('rule2').Value := backup12;
        end;
      1014: begin
          Parameters.ParamByName('rule1').Value := backup5;
          Parameters.ParamByName('rule2').Value := backup13;
        end;
      1015: begin
          Parameters.ParamByName('rule1').Value := backup5;
          Parameters.ParamByName('rule2').Value := backup14;
        end;

      1100: Parameters.ParamByName('rule1').Value := backup10;
      1101: begin
          Parameters.ParamByName('rule1').Value := backup10;
          Parameters.ParamByName('rule2').Value := carNo;
        end;
      1102: begin
          Parameters.ParamByName('rule1').Value := backup10;
          Parameters.ParamByName('rule2').Value := faHuo;
        end;
      1103: begin
          Parameters.ParamByName('rule1').Value := backup10;
          Parameters.ParamByName('rule2').Value := shouHuo;
        end;
      1104: begin
          Parameters.ParamByName('rule1').Value := backup10;
          Parameters.ParamByName('rule2').Value := goods;
        end;
      1105: begin
          Parameters.ParamByName('rule1').Value := backup10;
          Parameters.ParamByName('rule2').Value := spec;
        end;
      1106: begin
          Parameters.ParamByName('rule1').Value := backup10;
          Parameters.ParamByName('rule2').Value := backup1;
        end;
      1107: begin
          Parameters.ParamByName('rule1').Value := backup10;
          Parameters.ParamByName('rule2').Value := backup2;
        end;
      1108: begin
          Parameters.ParamByName('rule1').Value := backup10;
          Parameters.ParamByName('rule2').Value := backup3;
        end;
      1109: begin
          Parameters.ParamByName('rule1').Value := backup10;
          Parameters.ParamByName('rule2').Value := backup4;
        end;
      1110: begin
          Parameters.ParamByName('rule1').Value := backup10;
          Parameters.ParamByName('rule2').Value := backup5;
        end;
      1111: begin
          Parameters.ParamByName('rule1').Value := backup10;
          Parameters.ParamByName('rule2').Value := backup10;
        end;
      1112: begin
          Parameters.ParamByName('rule1').Value := backup10;
          Parameters.ParamByName('rule2').Value := backup11;
        end;
      1113: begin
          Parameters.ParamByName('rule1').Value := backup10;
          Parameters.ParamByName('rule2').Value := backup12;
        end;
      1114: begin
          Parameters.ParamByName('rule1').Value := backup10;
          Parameters.ParamByName('rule2').Value := backup13;
        end;
      1115: begin
          Parameters.ParamByName('rule1').Value := backup10;
          Parameters.ParamByName('rule2').Value := backup14;
        end;

      1200: Parameters.ParamByName('rule1').Value := backup11;
      1201: begin
          Parameters.ParamByName('rule1').Value := backup11;
          Parameters.ParamByName('rule2').Value := carNo;
        end;
      1202: begin
          Parameters.ParamByName('rule1').Value := backup11;
          Parameters.ParamByName('rule2').Value := faHuo;
        end;
      1203: begin
          Parameters.ParamByName('rule1').Value := backup11;
          Parameters.ParamByName('rule2').Value := shouHuo;
        end;
      1204: begin
          Parameters.ParamByName('rule1').Value := backup11;
          Parameters.ParamByName('rule2').Value := goods;
        end;
      1205: begin
          Parameters.ParamByName('rule1').Value := backup11;
          Parameters.ParamByName('rule2').Value := spec;
        end;
      1206: begin
          Parameters.ParamByName('rule1').Value := backup11;
          Parameters.ParamByName('rule2').Value := backup1;
        end;
      1207: begin
          Parameters.ParamByName('rule1').Value := backup11;
          Parameters.ParamByName('rule2').Value := backup2;
        end;
      1208: begin
          Parameters.ParamByName('rule1').Value := backup11;
          Parameters.ParamByName('rule2').Value := backup3;
        end;
      1209: begin
          Parameters.ParamByName('rule1').Value := backup11;
          Parameters.ParamByName('rule2').Value := backup4;
        end;
      1210: begin
          Parameters.ParamByName('rule1').Value := backup11;
          Parameters.ParamByName('rule2').Value := backup5;
        end;
      1211: begin
          Parameters.ParamByName('rule1').Value := backup11;
          Parameters.ParamByName('rule2').Value := backup10;
        end;
      1212: begin
          Parameters.ParamByName('rule1').Value := backup11;
          Parameters.ParamByName('rule2').Value := backup11;
        end;
      1213: begin
          Parameters.ParamByName('rule1').Value := backup11;
          Parameters.ParamByName('rule2').Value := backup12;
        end;
      1214: begin
          Parameters.ParamByName('rule1').Value := backup11;
          Parameters.ParamByName('rule2').Value := backup13;
        end;
      1215: begin
          Parameters.ParamByName('rule1').Value := backup11;
          Parameters.ParamByName('rule2').Value := backup14;
        end;

      1300: Parameters.ParamByName('rule1').Value := backup12;
      1301: begin
          Parameters.ParamByName('rule1').Value := backup12;
          Parameters.ParamByName('rule2').Value := carNo;
        end;
      1302: begin
          Parameters.ParamByName('rule1').Value := backup12;
          Parameters.ParamByName('rule2').Value := faHuo;
        end;
      1303: begin
          Parameters.ParamByName('rule1').Value := backup12;
          Parameters.ParamByName('rule2').Value := shouHuo;
        end;
      1304: begin
          Parameters.ParamByName('rule1').Value := backup12;
          Parameters.ParamByName('rule2').Value := goods;
        end;
      1305: begin
          Parameters.ParamByName('rule1').Value := backup12;
          Parameters.ParamByName('rule2').Value := spec;
        end;
      1306: begin
          Parameters.ParamByName('rule1').Value := backup12;
          Parameters.ParamByName('rule2').Value := backup1;
        end;
      1307: begin
          Parameters.ParamByName('rule1').Value := backup12;
          Parameters.ParamByName('rule2').Value := backup2;
        end;
      1308: begin
          Parameters.ParamByName('rule1').Value := backup12;
          Parameters.ParamByName('rule2').Value := backup3;
        end;
      1309: begin
          Parameters.ParamByName('rule1').Value := backup12;
          Parameters.ParamByName('rule2').Value := backup4;
        end;
      1310: begin
          Parameters.ParamByName('rule1').Value := backup12;
          Parameters.ParamByName('rule2').Value := backup5;
        end;
      1311: begin
          Parameters.ParamByName('rule1').Value := backup12;
          Parameters.ParamByName('rule2').Value := backup10;
        end;
      1312: begin
          Parameters.ParamByName('rule1').Value := backup12;
          Parameters.ParamByName('rule2').Value := backup11;
        end;
      1313: begin
          Parameters.ParamByName('rule1').Value := backup12;
          Parameters.ParamByName('rule2').Value := backup12;
        end;
      1314: begin
          Parameters.ParamByName('rule1').Value := backup12;
          Parameters.ParamByName('rule2').Value := backup13;
        end;
      1315: begin
          Parameters.ParamByName('rule1').Value := backup12;
          Parameters.ParamByName('rule2').Value := backup14;
        end;

      1400: Parameters.ParamByName('rule1').Value := backup13;
      1401: begin
          Parameters.ParamByName('rule1').Value := backup13;
          Parameters.ParamByName('rule2').Value := carNo;
        end;
      1402: begin
          Parameters.ParamByName('rule1').Value := backup13;
          Parameters.ParamByName('rule2').Value := faHuo;
        end;
      1403: begin
          Parameters.ParamByName('rule1').Value := backup13;
          Parameters.ParamByName('rule2').Value := shouHuo;
        end;
      1404: begin
          Parameters.ParamByName('rule1').Value := backup13;
          Parameters.ParamByName('rule2').Value := goods;
        end;
      1405: begin
          Parameters.ParamByName('rule1').Value := backup13;
          Parameters.ParamByName('rule2').Value := spec;
        end;
      1406: begin
          Parameters.ParamByName('rule1').Value := backup13;
          Parameters.ParamByName('rule2').Value := backup1;
        end;
      1407: begin
          Parameters.ParamByName('rule1').Value := backup13;
          Parameters.ParamByName('rule2').Value := backup2;
        end;
      1408: begin
          Parameters.ParamByName('rule1').Value := backup13;
          Parameters.ParamByName('rule2').Value := backup3;
        end;
      1409: begin
          Parameters.ParamByName('rule1').Value := backup13;
          Parameters.ParamByName('rule2').Value := backup4;
        end;
      1410: begin
          Parameters.ParamByName('rule1').Value := backup13;
          Parameters.ParamByName('rule2').Value := backup5;
        end;
      1411: begin
          Parameters.ParamByName('rule1').Value := backup13;
          Parameters.ParamByName('rule2').Value := backup10;
        end;
      1412: begin
          Parameters.ParamByName('rule1').Value := backup13;
          Parameters.ParamByName('rule2').Value := backup11;
        end;
      1413: begin
          Parameters.ParamByName('rule1').Value := backup13;
          Parameters.ParamByName('rule2').Value := backup12;
        end;
      1414: begin
          Parameters.ParamByName('rule1').Value := backup13;
          Parameters.ParamByName('rule2').Value := backup13;
        end;
      1415: begin
          Parameters.ParamByName('rule1').Value := backup13;
          Parameters.ParamByName('rule2').Value := backup14;
        end;

      1500: Parameters.ParamByName('rule1').Value := backup14;
      1501: begin
          Parameters.ParamByName('rule1').Value := backup14;
          Parameters.ParamByName('rule2').Value := carNo;
        end;
      1502: begin
          Parameters.ParamByName('rule1').Value := backup14;
          Parameters.ParamByName('rule2').Value := faHuo;
        end;
      1503: begin
          Parameters.ParamByName('rule1').Value := backup14;
          Parameters.ParamByName('rule2').Value := shouHuo;
        end;
      1504: begin
          Parameters.ParamByName('rule1').Value := backup14;
          Parameters.ParamByName('rule2').Value := goods;
        end;
      1505: begin
          Parameters.ParamByName('rule1').Value := backup14;
          Parameters.ParamByName('rule2').Value := spec;
        end;
      1506: begin
          Parameters.ParamByName('rule1').Value := backup14;
          Parameters.ParamByName('rule2').Value := backup1;
        end;
      1507: begin
          Parameters.ParamByName('rule1').Value := backup14;
          Parameters.ParamByName('rule2').Value := backup2;
        end;
      1508: begin
          Parameters.ParamByName('rule1').Value := backup14;
          Parameters.ParamByName('rule2').Value := backup3;
        end;
      1509: begin
          Parameters.ParamByName('rule1').Value := backup14;
          Parameters.ParamByName('rule2').Value := backup4;
        end;
      1510: begin
          Parameters.ParamByName('rule1').Value := backup14;
          Parameters.ParamByName('rule2').Value := backup5;
        end;
      1511: begin
          Parameters.ParamByName('rule1').Value := backup14;
          Parameters.ParamByName('rule2').Value := backup10;
        end;
      1512: begin
          Parameters.ParamByName('rule1').Value := backup14;
          Parameters.ParamByName('rule2').Value := backup11;
        end;
      1513: begin
          Parameters.ParamByName('rule1').Value := backup14;
          Parameters.ParamByName('rule2').Value := backup12;
        end;
      1514: begin
          Parameters.ParamByName('rule1').Value := backup14;
          Parameters.ParamByName('rule2').Value := backup13;
        end;
      1515: begin
          Parameters.ParamByName('rule1').Value := backup14;
          Parameters.ParamByName('rule2').Value := backup14;
        end;
    end;
    Open;
    if not IsEmpty then
      Result := FieldByName('c').AsFloat + initC
    else
      Result := initC;
  end;
end;

class function TWeightUtil.checkPicCount(picCount: Integer): Boolean;
var id: Integer;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'select top ' + IntToStr(picCount)
      + ' id from tbl_weight_img order by id';
    Open;
    if not IsEmpty then
    begin
      if RecordCount > picCount then
      begin
        Last;
        id := FieldByName('id').AsInteger;
        SQL.Text := 'delete from tbl_weight_img where id < :id';
        Parameters.ParamByName('id').Value := id;
        ExecSQL;
        Application.MessageBox('数据库已经过大,请压缩数据库！', '提示', MB_OK
          + MB_ICONWARNING + MB_TOPMOST);
      end;
    end;
  end;
end;

class function TWeightUtil.getShouHuoTodayStatic(var sl: TStringList): Boolean;
begin
  with QueryDataModule.ADOQExec3 do
  begin
    Close;
    SQL.Text := 'SELECT	T1.收货单位,T1.车次,T1.净重,当前金额 FROM 收货单位 '
      + 'JOIN (SELECT	收货单位.收货单位,COUNT(流水号) AS 车次,'
      + 'SUM(净重) AS 净重 FROM	称重信息,收货单位 '
      + 'WHERE (称重信息.收货单位 = 收货单位.收货单位) '
      + 'AND (更新时间 BETWEEN :START and :END) '
      + 'GROUP BY 收货单位.收货单位) AS T1 '
      + 'ON T1.收货单位 = 收货单位.收货单位';
    Parameters.ParamByName('START').Value := StartOfTheDay(Now);
    Parameters.ParamByName('END').Value := EndOfTheDay(Now);
    Open;
    if not IsEmpty then
    begin
      First;
      while not Eof do
      begin
        sl.Add(FormatDateTime('yyyy-MM-dd', Date) + Chr(13) + Chr(10)
          + FieldByName('收货单位').AsString + ' --- 总车次: '
          + FieldByName('车次').AsString + ' , 总重量: '
          + FieldByName('净重').AsString + ' , 今日余额: '
          + FieldByName('当前金额').AsString + ' ; ');
        Next;
      end;
      Result := True;
    end;
  end;
end;

end.

