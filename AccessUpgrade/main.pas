unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ComCtrls, StdCtrls, RzButton, Mask, RzEdit, RzBtnEdt,
  ComObj;

type
  TMainForm = class(TForm)
    BtnEdt15: TRzButtonEdit;
    BtnEdt20: TRzButtonEdit;
    BtnTransform: TRzBitBtn;
    BtnClose: TRzBitBtn;
    lbl15: TLabel;
    lbl20: TLabel;
    PB: TProgressBar;
    lblTime: TLabel;
    CBCopyPic: TCheckBox;
    procedure BtnEdt15ButtonClick(Sender: TObject);
    procedure BtnEdt20ButtonClick(Sender: TObject);
    procedure BtnTransformClick(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CBCopyPicClick(Sender: TObject);
  private
    { Private declarations }
    adoc15, adoc20: TADOConnection;
    adoq15, adoq20: TADOQuery;
    function importBackRecord(): Boolean;
    function importWeightImg(): Boolean;
    function importBackupInfo(bTitle: string): Boolean;
    function importPrepareInfo(): Boolean;
    function importTao(): Boolean;
    function importLog(): Boolean;
    function importUserInfo(): Boolean;
    function importWeightInfo(): Boolean;
  public
    { Public declarations }
    function get15Connection(): Boolean;
    function get20Connection(): Boolean;
    function transform(): Boolean;
    function compactDatabase15(): Boolean;
    function compactDatabase20(): Boolean;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

{ TMainForm }

procedure TMainForm.BtnEdt15ButtonClick(Sender: TObject);
var od: TOpenDialog;
begin
  od := TOpenDialog.Create(nil);
  try
    od.InitialDir := ExtractFilePath(ParamStr(0));
    od.Filter := '数据库文件(*.mdb)|*.mdb';
    if od.Execute then
    begin
      BtnEdt15.Text := od.FileName;
    end;
  finally
    od.Free;
  end;
end;

procedure TMainForm.BtnEdt20ButtonClick(Sender: TObject);
var od: TOpenDialog;
begin
  od := TOpenDialog.Create(nil);
  try
    od.InitialDir := ExtractFilePath(ParamStr(0));
    od.Filter := '数据库文件(*.mdb)|*.mdb';
    if od.Execute then
    begin
      BtnEdt20.Text := od.FileName;
    end;
  finally
    od.Free;
  end;
end;

function TMainForm.transform: Boolean;
var adoq15, adoq20: TADOQuery;
  ret: Boolean;
begin
  if not get15Connection() then
  begin
    Application.MessageBox('连接1.5版数据库失败!', '错误', MB_OK + MB_ICONSTOP
      + MB_TOPMOST);
    Result := False;
    Exit;
  end;
  if not get20Connection() then
  begin
    Application.MessageBox('连接2.0版数据库失败!', '错误', MB_OK + MB_ICONSTOP
      + MB_TOPMOST);
    Result := False;
    Exit;
  end;

  ret := importBackRecord;
  ret := importBackupInfo('备用1');
  ret := importBackupInfo('备用2');
  ret := importBackupInfo('备用3');
  ret := importBackupInfo('备用4');
  ret := importBackupInfo('备用5');
  ret := importBackupInfo('发货单位');
  ret := importBackupInfo('收货单位');
  ret := importBackupInfo('货名');
  ret := importBackupInfo('规格');
  ret := importLog;
  ret := importPrepareInfo;
  ret := importTao;
  ret := importUserInfo;
  if CBCopyPic.Checked then
    ret := importWeightImg;
  ret := importWeightInfo;

  ret := compactDatabase20;
  Result := ret;
end;

procedure TMainForm.BtnTransformClick(Sender: TObject);
var t: LongInt;
begin
  if Application.MessageBox('升级中将删除2.0版本中的数据，是否继续？',
    '提示', MB_YESNO + MB_ICONWARNING + MB_TOPMOST) = IDNO then
  begin
    Exit;
  end;
  t := GetTickCount;
  BtnTransform.Enabled := False;
  try
    lblTime.Caption := '数据库升级中...';
    if transform then
    begin
      lblTime.Caption := Format('花费%d毫秒', [GetTickCount - t]);
      Application.MessageBox('数据库升级成功！', '提示', MB_OK +
        MB_ICONINFORMATION + MB_TOPMOST);
    end
    else
    begin
      Application.MessageBox('升级失败！', '错误', MB_OK +
        MB_ICONSTOP + MB_TOPMOST);
    end;
  finally
    PB.Position := PB.Max;
    BtnTransform.Enabled := True;
  end;
end;

function TMainForm.get15Connection(): Boolean;
begin
  with adoc15 do
  begin
    Close;
    LoginPrompt := False;
    ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;'
      + 'Data Source=' + BtnEdt15.Text
      + ';Persist Security Info=False;Jet OLEDB:Database Password='
      + 'DTL83973118';
    try
      Open;
      Result := True;
    except
      Result := False;
    end;
  end;
end;

function TMainForm.get20Connection(): Boolean;
begin
  with adoc20 do
  begin
    Close;
    LoginPrompt := False;
    ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;'
      + 'Data Source=' + BtnEdt20.Text
      + ';Persist Security Info=False;Jet OLEDB:Database Password='
      + 'www.fzatw.com';
    try
      Open;
      Result := True;
    except
      Result := False;
    end;
  end;
end;

procedure TMainForm.BtnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  adoc15 := TADOConnection.Create(nil);
  adoc20 := TADOConnection.Create(nil);
  adoq15 := TADOQuery.Create(nil);
  adoq20 := TADOQuery.Create(nil);

  adoq15.Connection := adoc15;
  adoq20.Connection := adoc20;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  adoq15.Free;
  adoq20.Free;
  adoc15.Free;
  adoc20.Free;
end;

function TMainForm.importBackRecord: Boolean;
var i: Integer;
begin
  adoq15.Close;
  adoq15.SQL.Text := 'SELECT [WEIGHT],[WEIGHT_TIME] FROM [TBL_BACK_RECORD]';
  adoq15.Open;
  if not adoq15.IsEmpty then
  begin
    adoc20.BeginTrans;
    try
      adoq20.Close;
      adoq20.SQL.Text := 'delete from TBL_BACK_RECORD';
      adoq20.ExecSQL;

      adoq20.SQL.Text := 'select top 1 [WEIGHT], [WEIGHT_TIME] from [TBL_BACK_RECORD]';
      adoq20.Open;
      adoq15.First;
      i := 0;
      while not adoq15.Eof do
      begin
        adoq20.InsertRecord([adoq15.FieldByName('WEIGHT').AsFloat,
          adoq15.FieldByName('WEIGHT_TIME').AsDateTime]);
        adoq15.Next;
        Inc(i);
        PB.StepIt;
        Application.ProcessMessages;
        if i = 2000 then
        begin
          adoq20.UpdateBatch();
        end;
      end;
      adoq20.UpdateBatch();
      adoc20.CommitTrans;
      Result := True;
    except
      adoc20.RollbackTrans;
    end;
  end;
end;

function TMainForm.importBackupInfo(bTitle: string): Boolean;
var i: Integer;
begin
  adoq15.Close;
  adoq15.SQL.Text := 'SELECT Min([代码]) as [代码],[' + bTitle + '] FROM [' + bTitle
    + '] GROUP BY [' + bTitle + ']';
  adoq15.Open;
  if not adoq15.IsEmpty then
  begin
    adoc20.BeginTrans;
    try
      adoq20.Close;
      adoq20.SQL.Text := 'delete from [' + bTitle + ']';
      adoq20.ExecSQL;

      adoq20.SQL.Text := 'select top 1 [代码], [' + bTitle + '] from [' + bTitle + ']';
      adoq20.Open;
      adoq15.First;
      i := 0;
      while not adoq15.Eof do
      begin
        adoq20.InsertRecord([adoq15.FieldByName('代码').AsString,
          adoq15.FieldByName(bTitle).AsString]);
        adoq15.Next;
        Inc(i);
        PB.StepIt;
        Application.ProcessMessages;
        if i = 2000 then
        begin
          adoq20.UpdateBatch();
        end;
      end;
      adoq20.UpdateBatch();
      adoc20.CommitTrans;
      Result := True;
    except
      adoc20.RollbackTrans;
    end;
  end;
end;

function TMainForm.importLog: Boolean;
var i: Integer;
begin
  adoq15.Close;
  adoq15.SQL.Text := 'SELECT [修改人],[时间],[日志] FROM [日志]';
  adoq15.Open;
  if not adoq15.IsEmpty then
  begin
    adoc20.BeginTrans;
    try
      adoq20.Close;
      adoq20.SQL.Text := 'delete from [日志]';
      adoq20.ExecSQL;

      adoq20.SQL.Text := 'select top 1 [修改人],[时间],[日志] FROM [日志]';
      adoq20.Open;
      adoq15.First;
      i := 0;
      while not adoq15.Eof do
      begin
        adoq20.InsertRecord([adoq15.FieldByName('修改人').AsString,
          adoq15.FieldByName('时间').AsDateTime,
            adoq15.FieldByName('日志').AsString]);
        adoq15.Next;
        Inc(i);
        PB.StepIt;
        Application.ProcessMessages;
        if i = 2000 then
        begin
          adoq20.UpdateBatch();
        end;
      end;
      adoq20.UpdateBatch();
      adoc20.CommitTrans;
      Result := True;
    except
      adoc20.RollbackTrans;
    end;
  end;
end;

function TMainForm.importPrepareInfo: Boolean;
var i: Integer;
begin
  adoq15.Close;
  adoq15.SQL.Text := 'SELECT [车号], [皮重], [备注] FROM [车号]';
  adoq15.Open;
  if not adoq15.IsEmpty then
  begin
    adoc20.BeginTrans;
    try
      adoq20.Close;
      adoq20.SQL.Text := 'delete from [车号]';
      adoq20.ExecSQL;

      adoq20.SQL.Text := 'select top 1 [车号], [皮重], [备注] from [车号]';
      adoq20.Open;
      adoq15.First;
      i := 0;
      while not adoq15.Eof do
      begin
        adoq20.InsertRecord([adoq15.FieldByName('车号').AsString,
          adoq15.FieldByName('皮重').AsFloat,
            adoq15.FieldByName('备注').AsString]);
        adoq15.Next;
        Inc(i);
        PB.StepIt;
        Application.ProcessMessages;
        if i = 2000 then
        begin
          adoq20.UpdateBatch();
        end;
      end;
      adoq20.UpdateBatch();
      adoc20.CommitTrans;
      Result := True;
    except
      adoc20.RollbackTrans;
    end;
  end;
end;

function TMainForm.importTao: Boolean;
var i: Integer;
begin
  adoq15.Close;
  adoq15.SQL.Text := 'SELECT [车号], [发货单位], [收货单位], [货名], [规格],'
    + '[备用1], [备用2], [备用3], [备用4], [备用5] FROM [套表]';
  adoq15.Open;
  if not adoq15.IsEmpty then
  begin
    adoc20.BeginTrans;
    try
      adoq20.Close;
      adoq20.SQL.Text := 'delete from [套表]';
      adoq20.ExecSQL;

      adoq20.SQL.Text := 'select top 1 [车号], [发货单位], [收货单位], [货名], [规格],'
        + '[备用1], [备用2], [备用3], [备用4], [备用5] FROM [套表]';
      adoq20.Open;
      adoq15.First;
      i := 0;
      while not adoq15.Eof do
      begin
        adoq20.InsertRecord([adoq15.FieldByName('车号').AsString,
          adoq15.FieldByName('发货单位').AsString,
            adoq15.FieldByName('收货单位').AsString,
            adoq15.FieldByName('货名').AsString,
            adoq15.FieldByName('规格').AsString,
            adoq15.FieldByName('备用1').AsString,
            adoq15.FieldByName('备用2').AsString,
            adoq15.FieldByName('备用3').AsString,
            adoq15.FieldByName('备用4').AsString,
            adoq15.FieldByName('备用5').AsString]);
        adoq15.Next;
        Inc(i);
        PB.StepIt;
        Application.ProcessMessages;
        if i = 2000 then
        begin
          adoq20.UpdateBatch();
        end;
      end;
      adoq20.UpdateBatch();
      adoc20.CommitTrans;
      Result := True;
    except
      adoc20.RollbackTrans;
    end;
  end;
end;

function TMainForm.importUserInfo: Boolean;
var i: Integer;
begin
  adoq15.Close;
  adoq15.SQL.Text := 'SELECT [用户名],[密码],'
    + '[预置维护],'
    + '[数据维护] AS [卡号管理],'
    + '[预置维护] AS [系统日志],'
    + '[预置维护] AS [后台记录],'
    + '[打印磅单],'
    + '[修改磅单],'
    + '[打印报表],'
    + '[用户管理],'
    + '[系统设置],'
    + '[系统设置] AS [界面配置],'
    + '[手工重量],'
    + '[数库设置] AS [数据库设置],'
    + '[数据备份],'
    + '[数据维护] AS [数据导入],'
    + '[数据导出],'
    + '[数据导出] AS [数据清理],'
    + '[数据维护] AS [数据初始化],'
    + '[仪表设置],'
    + '[系统设置] AS [视频设置],'
    + '[系统设置] AS [读卡器设置],'
    + '[系统设置] AS [IO模块设置],'
    + '[系统设置] AS [大屏幕设置],'
    + '[系统设置] AS [语音输出],'
    + '[预置维护] AS [数据查询], '
    + '[数据维护] AS [添加记录],'
    + '[数据维护] AS [删除记录],'
    + '[数据维护] AS [修改车号],'
    + '[数据维护] AS [修改发货单位],'
    + '[数据维护] AS [修改收货单位],'
    + '[数据维护] AS [修改货名],'
    + '[数据维护] AS [修改规格],'
    + '[数据维护] AS [修改毛重],'
    + '[数据维护] AS [修改皮重],'
    + '[数据维护] AS [修改扣重],'
    + '[数据维护] AS [修改单价],'
    + '[数据维护] AS [修改折方系数],'
    + '[数据维护] AS [修改过磅费],'
    + '[数据维护] AS [修改备用1],'
    + '[数据维护] AS [修改备用2],'
    + '[数据维护] AS [修改备用3],'
    + '[数据维护] AS [修改备用4],'
    + '[数据维护] AS [修改备用5],'
    + '[数据维护] AS [修改备用6],'
    + '[数据维护] AS [修改备用7],'
    + '[数据维护] AS [修改备用8],'
    + '[数据维护] AS [修改备用9],'
    + '[数据维护] AS [修改备用10],'
    + '[数据维护] AS [修改备用11],'
    + '[数据维护] AS [修改备用12],'
    + '[数据维护] AS [修改备用13],'
    + '[数据维护] AS [修改备用14],'
    + '[数据维护] AS [修改备用15],'
    + '[数据维护] AS [修改备用16],'
    + '[数据维护] AS [修改备用17],'
    + '[数据维护] AS [修改备用18],'
    + '[管理员] FROM 用户信息';
  adoq15.Open;
  if not adoq15.IsEmpty then
  begin
    adoc20.BeginTrans;
    try
      adoq20.Close;
      adoq20.SQL.Text := 'delete from [用户信息]';
      adoq20.ExecSQL;

      adoq20.SQL.Text := 'select top 1 [用户名],[密码],'
        + '[预置维护],'
        + '[卡号管理],'
        + '[系统日志],'
        + '[后台记录],'
        + '[打印磅单],'
        + '[修改磅单],'
        + '[打印报表],'
        + '[用户管理],'
        + '[系统设置],'
        + '[界面配置],'
        + '[手工重量],'
        + '[数据库设置],'
        + '[数据备份],'
        + '[数据导入],'
        + '[数据导出],'
        + '[数据清理],'
        + '[数据初始化],'
        + '[仪表设置],'
        + '[视频设置],'
        + '[读卡器设置],'
        + '[IO模块设置],'
        + '[大屏幕设置],'
        + '[语音输出],'
        + '[数据查询], '
        + '[添加记录],'
        + '[删除记录],'
        + '[修改车号],'
        + '[修改发货单位],'
        + '[修改收货单位],'
        + '[修改货名],'
        + '[修改规格],'
        + '[修改毛重],'
        + '[修改皮重],'
        + '[修改扣重],'
        + '[修改单价],'
        + '[修改折方系数],'
        + '[修改过磅费],'
        + '[修改备用1],'
        + '[修改备用2],'
        + '[修改备用3],'
        + '[修改备用4],'
        + '[修改备用5],'
        + '[修改备用6],'
        + '[修改备用7],'
        + '[修改备用8],'
        + '[修改备用9],'
        + '[修改备用10],'
        + '[修改备用11],'
        + '[修改备用12],'
        + '[修改备用13],'
        + '[修改备用14],'
        + '[修改备用15],'
        + '[修改备用16],'
        + '[修改备用17],'
        + '[修改备用18],'
        + '[管理员] FROM 用户信息';
      adoq20.Open;
      adoq15.First;
      i := 0;
      while not adoq15.Eof do
      begin
        adoq20.InsertRecord([adoq15.FieldByName('用户名').AsString,
          adoq15.FieldByName('密码').AsString,
            adoq15.FieldByName('预置维护').AsBoolean,
            adoq15.FieldByName('卡号管理').AsBoolean,
            adoq15.FieldByName('系统日志').AsBoolean,
            adoq15.FieldByName('后台记录').AsBoolean,
            adoq15.FieldByName('打印磅单').AsBoolean,
            adoq15.FieldByName('修改磅单').AsBoolean,
            adoq15.FieldByName('打印报表').AsBoolean,
            adoq15.FieldByName('用户管理').AsBoolean,
            adoq15.FieldByName('系统设置').AsBoolean,
            adoq15.FieldByName('界面配置').AsBoolean,
            adoq15.FieldByName('手工重量').AsBoolean,
            adoq15.FieldByName('数据库设置').AsBoolean,
            adoq15.FieldByName('数据备份').AsBoolean,
            adoq15.FieldByName('数据导入').AsBoolean,
            adoq15.FieldByName('数据导出').AsBoolean,
            adoq15.FieldByName('数据清理').AsBoolean,
            adoq15.FieldByName('数据初始化').AsBoolean,
            adoq15.FieldByName('仪表设置').AsBoolean,
            adoq15.FieldByName('视频设置').AsBoolean,
            adoq15.FieldByName('读卡器设置').AsBoolean,
            adoq15.FieldByName('IO模块设置').AsBoolean,
            adoq15.FieldByName('大屏幕设置').AsBoolean,
            adoq15.FieldByName('语音输出').AsBoolean,
            adoq15.FieldByName('数据查询').AsBoolean,
            adoq15.FieldByName('添加记录').AsBoolean,
            adoq15.FieldByName('删除记录').AsBoolean,
            adoq15.FieldByName('修改车号').AsBoolean,
            adoq15.FieldByName('修改发货单位').AsBoolean,
            adoq15.FieldByName('修改收货单位').AsBoolean,
            adoq15.FieldByName('修改货名').AsBoolean,
            adoq15.FieldByName('修改规格').AsBoolean,
            adoq15.FieldByName('修改毛重').AsBoolean,
            adoq15.FieldByName('修改皮重').AsBoolean,
            adoq15.FieldByName('修改扣重').AsBoolean,
            adoq15.FieldByName('修改单价').AsBoolean,
            adoq15.FieldByName('修改折方系数').AsBoolean,
            adoq15.FieldByName('修改过磅费').AsBoolean,
            adoq15.FieldByName('修改备用1').AsBoolean,
            adoq15.FieldByName('修改备用2').AsBoolean,
            adoq15.FieldByName('修改备用3').AsBoolean,
            adoq15.FieldByName('修改备用4').AsBoolean,
            adoq15.FieldByName('修改备用5').AsBoolean,
            adoq15.FieldByName('修改备用6').AsBoolean,
            adoq15.FieldByName('修改备用7').AsBoolean,
            adoq15.FieldByName('修改备用8').AsBoolean,
            adoq15.FieldByName('修改备用9').AsBoolean,
            adoq15.FieldByName('修改备用10').AsBoolean,
            adoq15.FieldByName('修改备用11').AsBoolean,
            adoq15.FieldByName('修改备用12').AsBoolean,
            adoq15.FieldByName('修改备用13').AsBoolean,
            adoq15.FieldByName('修改备用14').AsBoolean,
            adoq15.FieldByName('修改备用15').AsBoolean,
            adoq15.FieldByName('修改备用16').AsBoolean,
            adoq15.FieldByName('修改备用17').AsBoolean,
            adoq15.FieldByName('修改备用18').AsBoolean,
            adoq15.FieldByName('管理员').AsBoolean]);
        adoq15.Next;
        Inc(i);
        PB.StepIt;
        Application.ProcessMessages;
        if i = 2000 then
        begin
          adoq20.UpdateBatch();
        end;
      end;
      adoq20.UpdateBatch();
      adoc20.CommitTrans;
      Result := True;
    except
      adoc20.RollbackTrans;
    end;
  end;
end;

function TMainForm.importWeightImg: Boolean;
var i: Integer;
  slId: TStringList;
  gi1, gi2, ti1, ti2: TMemoryStream;
begin
  slId := TStringList.Create;
  gi1 := TMemoryStream.Create;
  gi2 := TMemoryStream.Create;
  ti1 := TMemoryStream.Create;
  ti2 := TMemoryStream.Create;
  try
    adoq15.Close;

    adoq15.SQL.Text := 'SELECT WEIGHT_ID FROM TBL_WEIGHT_IMG';
    adoq15.Open;
    if not adoq15.IsEmpty then
    begin
      adoq15.First;
      while not adoq15.Eof do
      begin
        slId.Add(adoq15.FieldByName('weight_id').AsString);
        adoq15.Next;
      end;
    end;
    adoq20.Close;
    adoq20.SQL.Text := 'DELETE FROM TBL_WEIGHT_IMG';
    adoq20.ExecSQL;

    for i := 0 to slId.Count - 1 do
    begin
      adoq15.SQL.Text := 'SELECT WEIGHT_ID, GROSS_IMG1, GROSS_IMG2,'
        + 'TARE_IMG1, TARE_IMG2 FROM [TBL_WEIGHT_IMG] where weight_id=:weight_id';
      adoq15.Parameters.ParamByName('weight_id').Value := slId.Strings[i];
      adoq15.Open;
      if not adoq15.IsEmpty then
      begin
        adoq20.SQL.Text := 'insert into tbl_weight_img(weight_id, gross_img1, gross_img2,'
          + 'tare_img1, tare_img2) values (:weight_id, :gross_img1, :gross_img2,'
          + ':tare_img1, :tare_img2)';
        adoq20.Parameters.ParamByName('weight_id').Value := adoq15.FieldByName('weight_id').AsString;
        (adoq15.FieldByName('gross_img1') as TBlobField).SaveToStream(gi1);
        adoq20.Parameters.ParamByName('gross_img1').LoadFromStream(gi1, ftBlob);
        (adoq15.FieldByName('gross_img2') as TBlobField).SaveToStream(gi2);
        adoq20.Parameters.ParamByName('gross_img2').LoadFromStream(gi2, ftBlob);
        (adoq15.FieldByName('tare_img1') as TBlobField).SaveToStream(ti1);
        adoq20.Parameters.ParamByName('tare_img1').LoadFromStream(ti1, ftBlob);
        (adoq15.FieldByName('tare_img2') as TBlobField).SaveToStream(ti2);
        adoq20.Parameters.ParamByName('tare_img2').LoadFromStream(ti2, ftBlob);
        adoq20.ExecSQL;

        pb.StepIt;
        Application.ProcessMessages;
      end;
    end;
  finally
    slId.Free;
    gi1.Free;
    gi2.Free;
    ti1.Free;
    ti2.Free;
  end;
end;

function TMainForm.importWeightInfo: Boolean;
var i: Integer;
begin
  adoq15.Close;
  adoq15.SQL.Text := 'SELECT [流水号],[车号],[发货单位],[收货单位],[货名],'
    + '[规格],[毛重],[空重],[净重],[扣重],'
    + '[实重],[单价],[金额],[过磅费],[毛重时间],'
    + '[空重时间],[备注],[上传否],[操作员],[备用1],'
    + '[备用2],[备用3],[备用4],[备用5],[备用6],'
    + '[备用7],[备用8],[备用9] FROM [称重信息]';
  adoq15.Open;
  if not adoq15.IsEmpty then
  begin
    adoc20.BeginTrans;
    try
      adoq20.Close;
      adoq20.SQL.Text := 'delete from 称重信息';
      adoq20.ExecSQL;

      adoq20.SQL.Text := 'select top 1 [流水号], [车号], [过磅类型], [发货单位], [收货单位],'
        + '[货名], [规格], [毛重], [皮重], [净重],'
        + '[扣重], [实重], [单价], [金额], [折方系数],'
        + '[方量], [过磅费], [毛重时间], [皮重时间], [备注],'
        + '[上传否], [毛重司磅员], [皮重司磅员], [毛重磅号], [皮重磅号],'
        + '[更新人], [更新时间], [打印次数], [备用1], [备用2],'
        + '[备用3], [备用4], [备用5], [备用6], [备用7],'
        + '[备用8], [备用9] from [称重信息]';
      adoq20.Open;
      adoq15.First;
      i := 0;
      while not adoq15.Eof do
      begin
        adoq20.InsertRecord([adoq15.FieldByName('流水号').AsString,
          adoq15.FieldByName('车号').AsString,
            'OO',
            adoq15.FieldByName('发货单位').AsString,
            adoq15.FieldByName('收货单位').AsString,
            adoq15.FieldByName('货名').AsString,
            adoq15.FieldByName('规格').AsString,
            adoq15.FieldByName('毛重').AsFloat,
            adoq15.FieldByName('空重').AsFloat,
            adoq15.FieldByName('净重').AsFloat,
            adoq15.FieldByName('扣重').AsFloat,
            adoq15.FieldByName('实重').AsFloat,
            adoq15.FieldByName('单价').AsFloat,
            adoq15.FieldByName('金额').AsFloat,
            1,
            adoq15.FieldByName('实重').AsFloat,
            adoq15.FieldByName('过磅费').AsFloat,
            adoq15.FieldByName('毛重时间').AsDateTime,
            adoq15.FieldByName('空重时间').AsDateTime,
            adoq15.FieldByName('备注').AsString,
            adoq15.FieldByName('上传否').AsBoolean,
            adoq15.FieldByName('操作员').AsString,
            adoq15.FieldByName('操作员').AsString,
            'A',
            'A',
            adoq15.FieldByName('操作员').AsString,
            adoq15.FieldByName('毛重时间').AsDateTime,
            1,
            adoq15.FieldByName('备用1').AsString,
            adoq15.FieldByName('备用2').AsString,
            adoq15.FieldByName('备用3').AsString,
            adoq15.FieldByName('备用4').AsString,
            adoq15.FieldByName('备用5').AsString,
            adoq15.FieldByName('备用6').AsFloat,
            adoq15.FieldByName('备用7').AsFloat,
            adoq15.FieldByName('备用8').AsFloat,
            adoq15.FieldByName('备用9').AsFloat]);
        adoq15.Next;
        Inc(i);
        PB.StepIt;
        Application.ProcessMessages;
        if i = 2000 then
        begin
          adoq20.UpdateBatch();
        end;
      end;
      adoq20.UpdateBatch();
      adoc20.CommitTrans;
      Result := True;
    except
      adoc20.RollbackTrans;
    end;
  end;
end;

function TMainForm.compactDatabase20: Boolean;
var
  fileName: string;
  DB: OleVariant;
const
  SConnectionString = 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=%s;'
    + 'Jet OLEDB:Database Password=%s;';
begin
  fileName := BtnEdt20.Text;
  if FileExists(FileName) then
  begin
    adoc20.Close;
    try
      try
        DB := CreateOleObject('JRO.JetEngine'); //建立OLE对象,函数结束OLE对象超过作用域自动释放
        OleCheck(DB.CompactDatabase(format(SConnectionString, [fileName, 'www.fzatw.com']),
          format(SConnectionString, ['C:\temp.mdb', 'www.fzatw.com']))); //压缩数据库
        Result := CopyFile('c:\temp.mdb', pchar(fileName), False);
        DeleteFile('c:\temp.mdb'); //删除临时文件
      except
        Result := False //压缩失败
      end;
    finally
      adoc20.Open;
    end;
  end
end;

function TMainForm.compactDatabase15: Boolean;
var
  fileName: string;
  DB: OleVariant;
const
  SConnectionString = 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=%s;'
    + 'Jet OLEDB:Database Password=%s;';
begin
  fileName := BtnEdt15.Text;
  if FileExists(FileName) then
  begin
    adoc15.Close;
    try
      try
        DB := CreateOleObject('JRO.JetEngine'); //建立OLE对象,函数结束OLE对象超过作用域自动释放
        OleCheck(DB.CompactDatabase(format(SConnectionString, [fileName, 'DTL83973118']),
          format(SConnectionString, ['C:\temp.mdb', 'DTL83973118']))); //压缩数据库
        Result := CopyFile('c:\temp.mdb', pchar(fileName), False);
        DeleteFile('c:\temp.mdb'); //删除临时文件
      except
        Result := False //压缩失败
      end;
    finally
      adoc15.Open;
    end;
  end
end;

procedure TMainForm.CBCopyPicClick(Sender: TObject);
begin
  if CBCopyPic.Checked and (Application.MessageBox('拷贝过磅图片是一个缓慢的过程，平均100条4分钟，不建议拷贝，是否继续？',
    '提示', MB_YESNO + MB_ICONINFORMATION + MB_TOPMOST) = IDNO) then
  begin
    CBCopyPic.Checked := False
  end;
end;

end.

