unit ReportUtil;

interface

uses SysUtils, Dialogs, DB, Forms, Variants, ADODB, Classes, frxClass;

type
  TReportUtil = class
  private
  public
     //打印磅单
    class function printTicket(glideNo: string; preview: Boolean = False; ticketType: Integer = 1): Boolean;
    class function printInvalidTicket(glideNo: string; preview: Boolean = False; ticketType: Integer = 1): Boolean;
    class function printExceedTicket(glideNo: string; preview: Boolean = False; ticketType: Integer = 1): Boolean;
    class function printPicTicket(glideNo: string; preview: Boolean = False; ticketType: Integer = 1): Boolean;
    //设计磅单
    class function designTicket(format: string; ticketType: Integer = 1): Boolean;
    class function designReport(format: string): Boolean;
    class function printStatReport(format: string): Boolean; //打印统计报表
    class function designStatReport(format: string): Boolean;
  end;

implementation

uses QueryDM, Main, TicketSel, CommonUtil, IdGlobal, Windows, DataQuery;

class function TReportUtil.designReport(format: string): Boolean;
begin
  if not FileExists(format) then
    Exit;
  QueryDataModule.frxReportReport.LoadFromFile(format);
  QueryDataModule.frxReportReport.DesignReport();
end;

class function TReportUtil.designStatReport(format: string): Boolean;
begin
  if not FileExists(format) then
    Exit;
  QueryDataModule.frxReport2.LoadFromFile(format);
  QueryDataModule.frxReport2.DesignReport();
end;

class function TReportUtil.designTicket(format: string; ticketType: Integer): Boolean;
begin
  if not FileExists(format) then
    Exit;
  if ticketType = 1 then
  begin
    QueryDataModule.frxReport1.LoadFromFile(format);
    QueryDataModule.frxReport1.DesignReport();
  end
  else
  begin
    QueryDataModule.RMGridReport1.LoadFromFile(format);
    QueryDataModule.RMGridReport1.DesignReport();
  end;
end;

class function TReportUtil.printExceedTicket(glideNo: string;
  preview: Boolean; ticketType: Integer): Boolean;
var format: string;
begin
  //查询数据
  if glideNo = '' then
  begin
    MessageDlg('请输入磅单流水号!', mtWarning, [mbOK], 0);
    Exit;
  end;
  with QueryDataModule.ADOQueryPrintTicket do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from 超限信息 where 流水号=:num');
    Parameters.ParamByName('num').Value := Trim(glideNo);
    Open;
    if RecordCount = 0 then
    begin
      MessageDlg('不存在这条磅单!', mtError, [mbOK], 0);
      Exit
    end
    else
    begin
      if MainForm.systemConfig.printNet then
      begin
        if FieldByName('净重').AsFloat <= 0 then
        begin
          Exit;
        end;
      end;
    end;
  end;
  //磅单格式
  if MainForm.systemConfig.selectTicketBeforePrint then
  begin
    Application.CreateForm(TTicketSelForm, TicketSelForm);
    try
      TicketSelForm.ShowModal;
      if MainForm.systemConfig.ticketType = 1 then
        format := ExtractFilePath(ParamStr(0)) + '\Ticket\'
          + TicketSelForm.LBTicket.Items[TicketSelForm.LBTicket.ItemIndex] + '.fr3'
      else if MainForm.systemConfig.ticketType = 2 then
        format := ExtractFilePath(ParamStr(0)) + '\TicketII\'
          + TicketSelForm.LBTicket.Items[TicketSelForm.LBTicket.ItemIndex] + '.rmf'
    finally
      TicketSelForm.Free;
    end;
  end
  else
  begin
    if MainForm.systemConfig.ticketType = 1 then
      format := MainForm.systemConfig.ticketFormat
    else if MainForm.systemConfig.ticketType = 2 then
      format := MainForm.systemConfig.ticketFormat2;
  end;

  if MainForm.systemConfig.ticketType = 1 then
  begin
    if FileExists(format) then
      QueryDataModule.frxReport1.LoadFromFile(format)
    else
    begin
      MessageDlg('磅单打印格式文件未找到,无法进行打印！请重新设置打印格式文件！', mtWarning, [mbOK], 0);
      Exit
    end;
    //先退纸
    TCommonUtil.printerBack(MainForm.systemConfig.printerBackRow);
    if preview then
    begin
      QueryDataModule.frxReport1.ShowReport(True)
    end
    else
    begin
      QueryDataModule.frxReport1.PrintOptions.Printer := MainForm.systemConfig.printer1;
      QueryDataModule.frxReport1.PrintOptions.ShowDialog := False;
      QueryDataModule.frxReport1.PrepareReport(True);
      QueryDataModule.frxReport1.Print;
    end;
  end
  else if MainForm.systemConfig.ticketType = 2 then
  begin
    if FileExists(format) then
      QueryDataModule.RMGridReport1.LoadFromFile(format)
    else
    begin
      MessageDlg('磅单打印格式文件未找到,无法进行打印！请重新设置打印格式文件！', mtWarning, [mbOK], 0);
      Exit
    end;
    if preview then
    begin
      QueryDataModule.RMGridReport1.ShowReport()
    end
    else
    begin
      QueryDataModule.RMGridReport1.PrinterName := MainForm.systemConfig.printer1;
      QueryDataModule.RMGridReport1.ShowPrintDialog := False;
      QueryDataModule.RMGridReport1.PrepareReport();
      QueryDataModule.RMGridReport1.PrintReport;
    end;
  end;
end;

class function TReportUtil.printInvalidTicket(glideNo: string;
  preview: Boolean; ticketType: Integer): Boolean;
var format: string;
begin
  //查询数据
  if glideNo = '' then
  begin
    MessageDlg('请输入磅单流水号!', mtWarning, [mbOK], 0);
    Exit;
  end;
  with QueryDataModule.ADOQueryPrintTicket do
  begin
    Close;
    SQL.Text := 'select t1.序号 from 称重信息 as t1,收货单位 as t2 '
      + 'where (t1.收货单位=t2.收货单位) and (t1.流水号=:glideNo)';
    Parameters.ParamByName('glideNo').Value := Trim(glideNo);
    Open;
    if isEmpty then
    begin
      SQL.Text := 'select 序号,流水号,车号,过磅类型,发货单位,收货单位,'
        + '货名,规格,毛重,皮重,净重,扣重,实重,单价,金额,折方系数,方量,过磅费,'
        + '毛重司磅员,皮重司磅员,毛重磅号,皮重磅号,毛重时间,皮重时间,'
        + '一次过磅时间,二次过磅时间,更新人,更新时间,备注,打印次数,上传否,'
        + '备用1,备用2,备用3,备用4,备用5,备用6,备用7,备用8,备用9,'
        + '备用10,备用11,备用12,备用13,备用14,备用15,备用16,备用17,备用18,'
        + '0 as 当前金额,0 as 信用额度 from 作废信息 where 流水号=:glideNo';
    end
    else
    begin
      SQL.Text := 'select t1.序号,流水号,车号,过磅类型,发货单位,t1.收货单位 as 收货单位,'
        + '货名,规格,毛重,皮重,净重,扣重,实重,单价,金额,折方系数,方量,过磅费,'
        + '毛重司磅员,皮重司磅员,毛重磅号,皮重磅号,毛重时间,皮重时间,'
        + '一次过磅时间,二次过磅时间,更新人,更新时间,备注,打印次数,上传否,'
        + '备用1,备用2,备用3,备用4,备用5,备用6,备用7,备用8,备用9,'
        + '备用10,备用11,备用12,备用13,备用14,备用15,备用16,备用17,备用18,'
        + 't2.当前金额,t2.信用额度 '
        + 'from 作废信息 as t1,收货单位 as t2 '
        + 'where (t1.流水号=:glideNo) and (t1.收货单位=t2.收货单位)';
    end;
    Parameters.ParamByName('glideNo').Value := Trim(glideNo);
    Open;
    if RecordCount = 0 then
    begin
      MessageDlg('不存在这条磅单!', mtError, [mbOK], 0);
      Exit
    end
    else
    begin
      if MainForm.systemConfig.printNet then
      begin
        if FieldByName('净重').AsFloat <= 0 then
        begin
          Exit;
        end;
      end;
    end;
  end;
  //磅单格式
  if MainForm.systemConfig.selectTicketBeforePrint then
  begin
    Application.CreateForm(TTicketSelForm, TicketSelForm);
    try
      TicketSelForm.ShowModal;
      if MainForm.systemConfig.ticketType = 1 then
        format := ExtractFilePath(ParamStr(0)) + '\Ticket\'
          + TicketSelForm.LBTicket.Items[TicketSelForm.LBTicket.ItemIndex] + '.fr3'
      else if MainForm.systemConfig.ticketType = 2 then
        format := ExtractFilePath(ParamStr(0)) + '\TicketII\'
          + TicketSelForm.LBTicket.Items[TicketSelForm.LBTicket.ItemIndex] + '.rmf'
    finally
      TicketSelForm.Free;
    end;
  end
  else
  begin
    if MainForm.systemConfig.ticketType = 1 then
      format := MainForm.systemConfig.ticketFormat
    else if MainForm.systemConfig.ticketType = 2 then
      format := MainForm.systemConfig.ticketFormat2;
  end;

  if MainForm.systemConfig.ticketType = 1 then
  begin
    if FileExists(format) then
      QueryDataModule.frxReport1.LoadFromFile(format)
    else
    begin
      MessageDlg('磅单打印格式文件未找到,无法进行打印！请重新设置打印格式文件！', mtWarning, [mbOK], 0);
      Exit
    end;
    //先退纸
    TCommonUtil.printerBack(MainForm.systemConfig.printerBackRow);
    if preview then
    begin
      QueryDataModule.frxReport1.ShowReport(True)
    end
    else
    begin
      QueryDataModule.frxReport1.PrintOptions.Printer := MainForm.systemConfig.printer1;
      QueryDataModule.frxReport1.PrintOptions.ShowDialog := False;
      QueryDataModule.frxReport1.PrepareReport(True);
      QueryDataModule.frxReport1.Print;
    end;
  end
  else if MainForm.systemConfig.ticketType = 2 then
  begin
    if FileExists(format) then
      QueryDataModule.RMGridReport1.LoadFromFile(format)
    else
    begin
      MessageDlg('磅单打印格式文件未找到,无法进行打印！请重新设置打印格式文件！', mtWarning, [mbOK], 0);
      Exit
    end;
    if preview then
    begin
      QueryDataModule.RMGridReport1.ShowReport()
    end
    else
    begin
      QueryDataModule.RMGridReport1.PrinterName :=
        MainForm.systemConfig.printer1;
      QueryDataModule.RMGridReport1.ShowPrintDialog := False;
      QueryDataModule.RMGridReport1.PrepareReport();
      QueryDataModule.RMGridReport1.PrintReport;
    end;
  end;
end;

class function TReportUtil.printPicTicket(glideNo: string;
  preview: Boolean; ticketType: Integer): Boolean;
var format: string;
  stream1, stream2, stream3, stream4, stream5, stream6, stream7, stream8: TMemoryStream;
begin
  //查询数据
  if glideNo = '' then
  begin
    MessageDlg('请输入磅单流水号!', mtWarning, [mbOK], 0);
    Exit;
  end;
  if MainForm.systemConfig.ticketType <> 1 then
  begin
    MessageDlg('不支持的磅单格式!', mtWarning, [mbOK], 0);
    Exit;
  end;
  with QueryDataModule.ADOQueryPrintTicket do
  begin
    Close;
    if not MainForm.systemConfig.savePicLocal then
      SQL.Text := 'select * from 称重信息,tbl_weight_img '
        + 'where (称重信息.流水号=:num) '
        + 'and (称重信息.流水号=tbl_weight_img.weight_id)'
    else
      SQL.Text := 'select * from 称重信息 where 流水号=:num';
    Parameters.ParamByName('num').Value := Trim(glideNo);
    Open;
    if RecordCount = 0 then
    begin
      MessageDlg('不存在这条磅单!', mtError, [mbOK], 0);
      Exit
    end
    else
    begin
      if MainForm.systemConfig.printNet then
      begin
        if FieldByName('净重').AsFloat <= 0 then
        begin
          Exit;
        end;
      end;
    end;
    //磅单格式
    if MainForm.systemConfig.selectTicketBeforePrint then
    begin
      Application.CreateForm(TTicketSelForm, TicketSelForm);
      try
        TicketSelForm.ShowModal;
        format := ExtractFilePath(ParamStr(0)) + '\Ticket\'
          + TicketSelForm.LBTicket.Items[TicketSelForm.LBTicket.ItemIndex] + '.fr3';
      finally
        TicketSelForm.Free;
      end;
    end
    else
    begin
      format := MainForm.systemConfig.ticketFormat;
    end;
    if FileExists(format) then
      QueryDataModule.frxReport1.LoadFromFile(format)
    else
    begin
      MessageDlg('磅单打印格式文件未找到,无法进行打印！请重新设置打印格式文件！', mtWarning, [mbOK], 0);
      Exit
    end;
    //生成本地图片
    if FileExists(ExtractFilePath(ParamStr(0)) + 'P0.jpg') then
      DeleteFile(PChar(ExtractFilePath(ParamStr(0)) + 'P0.jpg'));
    if FileExists(ExtractFilePath(ParamStr(0)) + 'P1.jpg') then
      DeleteFile(PChar(ExtractFilePath(ParamStr(0)) + 'P1.jpg'));
    if FileExists(ExtractFilePath(ParamStr(0)) + 'P2.jpg') then
      DeleteFile(PChar(ExtractFilePath(ParamStr(0)) + 'P2.jpg'));
    if FileExists(ExtractFilePath(ParamStr(0)) + 'P3.jpg') then
      DeleteFile(PChar(ExtractFilePath(ParamStr(0)) + 'P3.jpg'));
    if FileExists(ExtractFilePath(ParamStr(0)) + 'P4.jpg') then
      DeleteFile(PChar(ExtractFilePath(ParamStr(0)) + 'P4.jpg'));
    if FileExists(ExtractFilePath(ParamStr(0)) + 'P5.jpg') then
      DeleteFile(PChar(ExtractFilePath(ParamStr(0)) + 'P5.jpg'));
    if FileExists(ExtractFilePath(ParamStr(0)) + 'P6.jpg') then
      DeleteFile(PChar(ExtractFilePath(ParamStr(0)) + 'P6.jpg'));
    if FileExists(ExtractFilePath(ParamStr(0)) + 'P7.jpg') then
      DeleteFile(PChar(ExtractFilePath(ParamStr(0)) + 'P7.jpg'));

    stream1 := TMemoryStream.Create; stream2 := TMemoryStream.Create;
    stream3 := TMemoryStream.Create; stream4 := TMemoryStream.Create;
    stream5 := TMemoryStream.Create; stream6 := TMemoryStream.Create;
    stream7 := TMemoryStream.Create; stream8 := TMemoryStream.Create;
    try
      if not MainForm.systemConfig.savePicLocal then
      begin
        stream1.Clear; stream2.Clear;
        stream3.Clear; stream4.Clear;
        stream5.Clear; stream6.Clear;
        stream7.Clear; stream8.Clear;
        (FieldByName('gross_img1') as TBlobField).SaveToStream(stream1);
        (FieldByName('gross_img2') as TBlobField).SaveToStream(stream2);
        (FieldByName('gross_img3') as TBlobField).SaveToStream(stream3);
        (FieldByName('gross_img4') as TBlobField).SaveToStream(stream4);
        (FieldByName('tare_img1') as TBlobField).SaveToStream(stream5);
        (FieldByName('tare_img2') as TBlobField).SaveToStream(stream6);
        (FieldByName('tare_img3') as TBlobField).SaveToStream(stream7);
        (FieldByName('tare_img4') as TBlobField).SaveToStream(stream8);
        stream1.Position := 0; stream1.SaveToFile(ExtractFilePath(ParamStr(0)) + 'P0.jpg');
        stream2.Position := 0; stream2.SaveToFile(ExtractFilePath(ParamStr(0)) + 'P1.jpg');
        stream3.Position := 0; stream3.SaveToFile(ExtractFilePath(ParamStr(0)) + 'P2.jpg');
        stream4.Position := 0; stream4.SaveToFile(ExtractFilePath(ParamStr(0)) + 'P3.jpg');
        stream5.Position := 0; stream5.SaveToFile(ExtractFilePath(ParamStr(0)) + 'P4.jpg');
        stream6.Position := 0; stream6.SaveToFile(ExtractFilePath(ParamStr(0)) + 'P5.jpg');
        stream7.Position := 0; stream7.SaveToFile(ExtractFilePath(ParamStr(0)) + 'P6.jpg');
        stream8.Position := 0; stream8.SaveToFile(ExtractFilePath(ParamStr(0)) + 'P7.jpg');
      end
      else
      begin
        CopyFile(PChar(ExtractFilePath(ParamStr(0)) + '\WeightImg\' + glideNo
          + '\gross_img1.jpg'), PChar(ExtractFilePath(ParamStr(0)) + 'P0.jpg'), False);
        CopyFile(PChar(ExtractFilePath(ParamStr(0)) + '\WeightImg\' + glideNo
          + '\gross_img2.jpg'), PChar(ExtractFilePath(ParamStr(0)) + 'P1.jpg'), False);
        CopyFile(PChar(ExtractFilePath(ParamStr(0)) + '\WeightImg\' + glideNo
          + '\gross_img3.jpg'), PChar(ExtractFilePath(ParamStr(0)) + 'P2.jpg'), False);
        CopyFile(PChar(ExtractFilePath(ParamStr(0)) + '\WeightImg\' + glideNo
          + '\gross_img4.jpg'), PChar(ExtractFilePath(ParamStr(0)) + 'P3.jpg'), False);
        CopyFile(PChar(ExtractFilePath(ParamStr(0)) + '\WeightImg\' + glideNo
          + '\tare_img1.jpg'), PChar(ExtractFilePath(ParamStr(0)) + 'P4.jpg'), False);
        CopyFile(PChar(ExtractFilePath(ParamStr(0)) + '\WeightImg\' + glideNo
          + '\tare_img2.jpg'), PChar(ExtractFilePath(ParamStr(0)) + 'P5.jpg'), False);
        CopyFile(PChar(ExtractFilePath(ParamStr(0)) + '\WeightImg\' + glideNo
          + '\tare_img3.jpg'), PChar(ExtractFilePath(ParamStr(0)) + 'P6.jpg'), False);
        CopyFile(PChar(ExtractFilePath(ParamStr(0)) + '\WeightImg\' + glideNo
          + '\tare_img4.jpg'), PChar(ExtractFilePath(ParamStr(0)) + 'P7.jpg'), False);
      end;
      if QueryDataModule.frxReport1.FindObject('picture1') <> nil then
      begin
        if FileExists(ExtractFilePath(ParamStr(0)) + 'P0.jpg') then
        begin
          if FileSizeByName(ExtractFilePath(ParamStr(0)) + 'P0.jpg') = 0 then
          begin
            TfrxPictureView(QueryDataModule.frxReport1.FindObject('picture1')).Picture.CleanupInstance;
            TfrxPictureView(QueryDataModule.frxReport1.FindObject('picture1')).picture.Graphic := nil;
          end
          else
          begin
            TfrxPictureView(QueryDataModule.frxReport1.FindObject('picture1')).Picture.LoadFromFile(
              ExtractFilePath(ParamStr(0)) + 'P0.jpg');
          end;
        end;
      end;
      if QueryDataModule.frxReport1.FindObject('picture2') <> nil then
      begin
        if FileExists(ExtractFilePath(ParamStr(0)) + 'P1.jpg') then
        begin
          if FileSizeByName(ExtractFilePath(ParamStr(0)) + 'P1.jpg') = 0 then
          begin
            TfrxPictureView(QueryDataModule.frxReport1.FindObject('picture2')).Picture.CleanupInstance;
            TfrxPictureView(QueryDataModule.frxReport1.FindObject('picture2')).picture.Graphic := nil;
          end
          else
          begin
            TfrxPictureView(QueryDataModule.frxReport1.FindObject('picture2')).Picture.LoadFromFile(
              ExtractFilePath(ParamStr(0)) + 'P1.jpg');
          end;
        end;
      end;
      if QueryDataModule.frxReport1.FindObject('picture3') <> nil then
      begin
        if FileExists(ExtractFilePath(ParamStr(0)) + 'P2.jpg') then
        begin
          if FileSizeByName(ExtractFilePath(ParamStr(0)) + 'P2.jpg') = 0 then
          begin
            TfrxPictureView(QueryDataModule.frxReport1.FindObject('picture3')).Picture.CleanupInstance;
            TfrxPictureView(QueryDataModule.frxReport1.FindObject('picture3')).picture.Graphic := nil;
          end
          else
          begin
            TfrxPictureView(QueryDataModule.frxReport1.FindObject('picture3')).Picture.LoadFromFile(
              ExtractFilePath(ParamStr(0)) + 'P2.jpg');
          end;
        end;
      end;
      if QueryDataModule.frxReport1.FindObject('picture4') <> nil then
      begin
        if FileExists(ExtractFilePath(ParamStr(0)) + 'P3.jpg') then
        begin
          if FileSizeByName(ExtractFilePath(ParamStr(0)) + 'P3.jpg') = 0 then
          begin
            TfrxPictureView(QueryDataModule.frxReport1.FindObject('picture4')).Picture.CleanupInstance;
            TfrxPictureView(QueryDataModule.frxReport1.FindObject('picture4')).picture.Graphic := nil;
          end
          else
          begin
            TfrxPictureView(QueryDataModule.frxReport1.FindObject('picture4')).Picture.LoadFromFile(
              ExtractFilePath(ParamStr(0)) + 'P3.jpg');
          end;
        end;
      end;
      if QueryDataModule.frxReport1.FindObject('picture5') <> nil then
      begin
        if FileExists(ExtractFilePath(ParamStr(0)) + 'P4.jpg') then
        begin
          if FileSizeByName(ExtractFilePath(ParamStr(0)) + 'P4.jpg') = 0 then
          begin
            TfrxPictureView(QueryDataModule.frxReport1.FindObject('picture5')).Picture.CleanupInstance;
            TfrxPictureView(QueryDataModule.frxReport1.FindObject('picture5')).picture.Graphic := nil;
          end
          else
          begin
            TfrxPictureView(QueryDataModule.frxReport1.FindObject('picture5')).Picture.LoadFromFile(
              ExtractFilePath(ParamStr(0)) + 'P4.jpg');
          end;
        end;
      end;
      if QueryDataModule.frxReport1.FindObject('picture6') <> nil then
      begin
        if FileExists(ExtractFilePath(ParamStr(0)) + 'P5.jpg') then
        begin
          if FileSizeByName(ExtractFilePath(ParamStr(0)) + 'P5.jpg') = 0 then
          begin
            TfrxPictureView(QueryDataModule.frxReport1.FindObject('picture6')).Picture.CleanupInstance;
            TfrxPictureView(QueryDataModule.frxReport1.FindObject('picture6')).picture.Graphic := nil;
          end
          else
          begin
            TfrxPictureView(QueryDataModule.frxReport1.FindObject('picture6')).Picture.LoadFromFile(
              ExtractFilePath(ParamStr(0)) + 'P5.jpg');
          end;
        end;
      end;
      if QueryDataModule.frxReport1.FindObject('picture7') <> nil then
      begin
        if FileExists(ExtractFilePath(ParamStr(0)) + 'P6.jpg') then
        begin
          if FileSizeByName(ExtractFilePath(ParamStr(0)) + 'P6.jpg') = 0 then
          begin
            TfrxPictureView(QueryDataModule.frxReport1.FindObject('picture7')).Picture.CleanupInstance;
            TfrxPictureView(QueryDataModule.frxReport1.FindObject('picture7')).picture.Graphic := nil;
          end
          else
          begin
            TfrxPictureView(QueryDataModule.frxReport1.FindObject('picture7')).Picture.LoadFromFile(
              ExtractFilePath(ParamStr(0)) + 'P6.jpg');
          end;
        end;
      end;
      if QueryDataModule.frxReport1.FindObject('picture8') <> nil then
      begin
        if FileExists(ExtractFilePath(ParamStr(0)) + 'P7.jpg') then
        begin
          if FileSizeByName(ExtractFilePath(ParamStr(0)) + 'P7.jpg') = 0 then
          begin
            TfrxPictureView(QueryDataModule.frxReport1.FindObject('picture8')).Picture.CleanupInstance;
            TfrxPictureView(QueryDataModule.frxReport1.FindObject('picture8')).picture.Graphic := nil;
          end
          else
          begin
            TfrxPictureView(QueryDataModule.frxReport1.FindObject('picture8')).Picture.LoadFromFile(
              ExtractFilePath(ParamStr(0)) + 'P7.jpg');
          end;
        end;
      end;
      //先退纸
      TCommonUtil.printerBack(MainForm.systemConfig.printerBackRow);
      if preview then
      begin
        QueryDataModule.frxReport1.ShowReport(True)
      end
      else
      begin
        QueryDataModule.frxReport1.PrintOptions.Printer :=
          MainForm.systemConfig.printer2;
        QueryDataModule.frxReport1.PrintOptions.ShowDialog := False;
        QueryDataModule.frxReport1.PrepareReport(True);
        QueryDataModule.frxReport1.Print;
        with QueryDataModule.ADOQExec do
        begin
          Close;
          SQL.Text := 'update 称重信息 set 打印次数=打印次数+1 where 流水号=:glideNo';
          Parameters.ParamByName('glideNo').Value := Trim(glideNo);
          ExecSQL;
        end;
      end;
    finally
      if FileExists(ExtractFilePath(ParamStr(0)) + 'P0.jpg') then
        DeleteFile(PChar(ExtractFilePath(ParamStr(0)) + 'P0.jpg'));
      if FileExists(ExtractFilePath(ParamStr(0)) + 'P1.jpg') then
        DeleteFile(PChar(ExtractFilePath(ParamStr(0)) + 'P1.jpg'));
      if FileExists(ExtractFilePath(ParamStr(0)) + 'P2.jpg') then
        DeleteFile(PChar(ExtractFilePath(ParamStr(0)) + 'P2.jpg'));
      if FileExists(ExtractFilePath(ParamStr(0)) + 'P3.jpg') then
        DeleteFile(PChar(ExtractFilePath(ParamStr(0)) + 'P3.jpg'));
      if FileExists(ExtractFilePath(ParamStr(0)) + 'P4.jpg') then
        DeleteFile(PChar(ExtractFilePath(ParamStr(0)) + 'P4.jpg'));
      if FileExists(ExtractFilePath(ParamStr(0)) + 'P5.jpg') then
        DeleteFile(PChar(ExtractFilePath(ParamStr(0)) + 'P5.jpg'));
      if FileExists(ExtractFilePath(ParamStr(0)) + 'P6.jpg') then
        DeleteFile(PChar(ExtractFilePath(ParamStr(0)) + 'P6.jpg'));
      if FileExists(ExtractFilePath(ParamStr(0)) + 'P7.jpg') then
        DeleteFile(PChar(ExtractFilePath(ParamStr(0)) + 'P7.jpg'));
      stream1.Free;
      stream2.Free;
      stream3.Free;
      stream4.Free;
      stream5.Free;
      stream6.Free;
      stream7.Free;
      stream8.Free;
    end;
  end;
end;

class function TReportUtil.printStatReport(format: string): Boolean;
begin
  if not FileExists(format) then
    Exit;
  QueryDataModule.frxReport2.LoadFromFile(format);

  QueryDataModule.frxReport2.Variables['startDate1'] := DataQueryForm.DTPStartDate1.Date;
  QueryDataModule.frxReport2.Variables['startTime1'] := DataQueryForm.DTPStartTime1.Time;
  QueryDataModule.frxReport2.Variables['endDate1'] := DataQueryForm.DTPEndDate1.Date;
  QueryDataModule.frxReport2.Variables['endTime1'] := DataQueryForm.DTPEndTime1.Time;

  QueryDataModule.frxReport2.Variables['startDate2'] := DataQueryForm.DTPStartDate1.Date;
  QueryDataModule.frxReport2.Variables['startTime2'] := DataQueryForm.DTPStartTime1.Time;
  QueryDataModule.frxReport2.Variables['endDate2'] := DataQueryForm.DTPEndDate1.Date;
  QueryDataModule.frxReport2.Variables['endDate2'] := DataQueryForm.DTPEndTime1.Time;

  QueryDataModule.frxReport2.ShowProgress := True;
  QueryDataModule.frxReport2.PrintOptions.Printer :=
    MainForm.systemConfig.printer1;
  QueryDataModule.frxReport2.ShowReport();
end;

class function TReportUtil.printTicket(glideNo: string;
  preview: Boolean; ticketType: Integer): Boolean;
var format: string;
begin
  //查询数据
  if glideNo = '' then
  begin
    MessageDlg('请输入磅单流水号!', mtWarning, [mbOK], 0);
    Exit;
  end;
  with QueryDataModule.ADOQueryPrintTicket do
  begin
    Close;
    SQL.Text := 'select t1.序号 from 称重信息 as t1,收货单位 as t2 '
      + 'where (t1.收货单位=t2.收货单位) and (t1.流水号=:glideNo)';
    Parameters.ParamByName('glideNo').Value := Trim(glideNo);
    Open;
    if isEmpty then
    begin
      SQL.Text := 'select 序号,流水号,车号,过磅类型,发货单位,收货单位,'
        + '货名,规格,毛重,皮重,净重,扣重,实重,单价,金额,折方系数,方量,过磅费,'
        + '毛重司磅员,皮重司磅员,毛重磅号,皮重磅号,毛重时间,皮重时间,'
        + '一次过磅时间,二次过磅时间,更新人,更新时间,备注,打印次数,上传否,'
        + '备用1,备用2,备用3,备用4,备用5,备用6,备用7,备用8,备用9,'
        + '备用10,备用11,备用12,备用13,备用14,备用15,备用16,备用17,备用18,'
        + '0 as 当前金额,0 as 信用额度 from 称重信息 where 流水号=:glideNo';
    end
    else
    begin
      SQL.Text := 'select t1.序号,流水号,车号,过磅类型,发货单位,t1.收货单位 as 收货单位,'
        + '货名,规格,毛重,皮重,净重,扣重,实重,单价,金额,折方系数,方量,过磅费,'
        + '毛重司磅员,皮重司磅员,毛重磅号,皮重磅号,毛重时间,皮重时间,'
        + '一次过磅时间,二次过磅时间,更新人,更新时间,备注,打印次数,上传否,'
        + '备用1,备用2,备用3,备用4,备用5,备用6,备用7,备用8,备用9,'
        + '备用10,备用11,备用12,备用13,备用14,备用15,备用16,备用17,备用18,'
        + 't2.当前金额,t2.信用额度 '
        + 'from 称重信息 as t1,收货单位 as t2 '
        + 'where (t1.流水号=:glideNo) and (t1.收货单位=t2.收货单位)';
    end;
    Parameters.ParamByName('glideNo').Value := Trim(glideNo);
    Open;
    if RecordCount = 0 then
    begin
      MessageDlg('不存在这条磅单!', mtError, [mbOK], 0);
      Exit
    end
    else
    begin
      if MainForm.systemConfig.printNet then
      begin
        if FieldByName('净重').AsFloat <= 0 then
        begin
          Exit;
        end;
      end;
    end;
  end;
  //磅单格式
  if MainForm.systemConfig.selectTicketBeforePrint then
  begin
    Application.CreateForm(TTicketSelForm, TicketSelForm);
    try
      TicketSelForm.ShowModal;
      if MainForm.systemConfig.ticketType = 1 then
        format := ExtractFilePath(ParamStr(0)) + '\Ticket\'
          + TicketSelForm.LBTicket.Items[TicketSelForm.LBTicket.ItemIndex] + '.fr3'
      else if MainForm.systemConfig.ticketType = 2 then
        format := ExtractFilePath(ParamStr(0)) + '\TicketII\'
          + TicketSelForm.LBTicket.Items[TicketSelForm.LBTicket.ItemIndex] + '.rmf'
    finally
      TicketSelForm.Free;
    end;
  end
  else
  begin
    if MainForm.systemConfig.ticketType = 1 then
      format := MainForm.systemConfig.ticketFormat
    else if MainForm.systemConfig.ticketType = 2 then
      format := MainForm.systemConfig.ticketFormat2;
  end;

  if MainForm.systemConfig.ticketType = 1 then
  begin
    if FileExists(format) then
      QueryDataModule.frxReport1.LoadFromFile(format)
    else
    begin
      MessageDlg('磅单打印格式文件未找到,无法进行打印！请重新设置打印格式文件！', mtWarning, [mbOK], 0);
      Exit
    end;
    //先退纸
    TCommonUtil.printerBack(MainForm.systemConfig.printerBackRow);
    if preview then
    begin
      QueryDataModule.frxReport1.ShowReport(True)
    end
    else
    begin
      QueryDataModule.frxReport1.PrintOptions.Printer :=
        MainForm.systemConfig.printer1;
      QueryDataModule.frxReport1.PrintOptions.ShowDialog := False;
      QueryDataModule.frxReport1.PrepareReport(True);
      QueryDataModule.frxReport1.Print;
      with QueryDataModule.ADOQExec do
      begin
        Close;
        SQL.Text := 'update 称重信息 set 打印次数=打印次数+1 where 流水号=:glideNo';
        Parameters.ParamByName('glideNo').Value := Trim(glideNo);
        ExecSQL;
      end;
    end;
  end
  else if MainForm.systemConfig.ticketType = 2 then
  begin
    if FileExists(format) then
      QueryDataModule.RMGridReport1.LoadFromFile(format)
    else
    begin
      MessageDlg('磅单打印格式文件未找到,无法进行打印！请重新设置打印格式文件！', mtWarning, [mbOK], 0);
      Exit
    end;
    if preview then
    begin
      QueryDataModule.RMGridReport1.ShowReport()
    end
    else
    begin
      QueryDataModule.RMGridReport1.PrinterName :=
        MainForm.systemConfig.printer1;
      QueryDataModule.RMGridReport1.ShowPrintDialog := False;
      QueryDataModule.RMGridReport1.PrepareReport();
      QueryDataModule.RMGridReport1.PrintReport;
      with QueryDataModule.ADOQExec do
      begin
        Close;
        SQL.Text := 'update 称重信息 set 打印次数=打印次数+1 where 流水号=:glideNo';
        Parameters.ParamByName('glideNo').Value := Trim(glideNo);
        ExecSQL;
      end;
    end;
  end;
end;

end.

