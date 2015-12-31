unit UploadCloud;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB, Registry, IniFiles,
  IdCoder, IdCoder3to4, IdCoderMIME, IdBaseComponent, IdHashMessageDigest,
  ZLib, ZLibEx, Menus, RzLabel, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP;

type
  TUploadCloudForm = class(TForm)
    TUpload: TTimer;
    ADOCLocal: TADOConnection;
    ADOQLocal: TADOQuery;
    GBSet: TGroupBox;
    MemoLog: TMemo;
    LEAccount: TLabeledEdit;
    procedure TUploadTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LETokenChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function getLocalConnection(): Boolean;

    function uploadRecord(): Boolean;

    function saveSetting(): Boolean;
    function loadSetting(): Boolean;
    function log(str: string): Boolean;

    function getRecordString(glideNo: string; var strWeightInfo: string; var strWeightImg: string): Boolean;
    function uploadString(strWeightInfo: string; strWeightImg: string): Boolean;
  end;

var
  UploadCloudForm: TUploadCloudForm;

implementation

uses
  CommonUtil, WeightRecord, superobject, superxmlparser;

{$R *.dfm}

function TUploadCloudForm.uploadRecord: Boolean;
var uploadId, strWeightInfo, strWeightImg: string;
begin
  Result := False;
  if LEAccount.Text = '' then
  begin
    Exit;
  end;

  getLocalConnection();
  ADOQLocal.Connection := ADOCLocal;

  with ADOQLocal do
  begin
    Close;
    SQL.Text := 'select max(流水号) as glideNo from 称重信息 where (上传否=0) and (净重<>0)';
    Open;
    if not IsEmpty then
    begin
      uploadId := FieldByName('glideNo').AsString;
      if uploadId = '' then Exit;
    end
    else
    begin
      Result := False;
      Exit;
    end;

    log('开始上传流水号为 ' + uploadId + ' 的称重记录');

    if getRecordString(uploadId, strWeightInfo, strWeightImg) then
    begin
      if uploadString(strWeightInfo, strWeightImg) then
      begin
        SQL.Text := 'update 称重信息 set 上传否=1 where 流水号=:glideNo';
        Parameters.ParamByName('glideNo').Value := uploadId;
        try
          ExecSQL;
        except
          log('更新本地标志失败');
          Exit;
        end;
        log('上传流水号为 ' + uploadId + ' 的称重记录成功');

        Result := True;
      end;
    end;

  end;
end;

procedure TUploadCloudForm.TUploadTimer(Sender: TObject);
begin
  (Sender as TTimer).Enabled := False;
  try
    uploadRecord;
  finally
    (Sender as TTimer).Enabled := True;
  end;
end;

function TUploadCloudForm.saveSetting: Boolean;
var myini: TiniFile;
begin
  myini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'remote.ini');
  try
    myini.WriteString('remote', 'account', LEAccount.Text);
  finally
    myini.Free;
  end;
  Result := True;
end;

function TUploadCloudForm.loadSetting: Boolean;
var myini: TiniFile;
begin
  myini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'remote.ini');
  try
    LEAccount.Text := myini.ReadString('remote', 'account', '');
  finally
    myini.Free;
  end;
  Result := True;
end;

procedure TUploadCloudForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  saveSetting;
end;

procedure TUploadCloudForm.LETokenChange(Sender: TObject);
begin
  saveSetting;
end;

function TUploadCloudForm.log(str: string): Boolean;
begin
  if MemoLog.Lines.Count > 100 then
    MemoLog.Lines.Clear;
  MemoLog.Lines.Add(str);
  Result := True;
end;

procedure TUploadCloudForm.FormCreate(Sender: TObject);
begin
  Application.Title := '称重数据上传手机端';
  loadSetting;
  ADOQLocal.Connection := ADOCLocal;
  TUpload.Enabled := True;
end;

function TUploadCloudForm.getRecordString(glideNo: string; var strWeightInfo,
  strWeightImg: string): Boolean;
var adoq: TADOQuery;
  w: TWeightRecord;
begin
  w := TWeightRecord.Create;
  try
    if TWeightRecordUtil.get(glideNo, w) then
    begin
      strWeightInfo := w.toEncodeJsonString;
    end;
  finally
    w.Free;
  end;
  Result := True;
end;

function TUploadCloudForm.uploadString(strWeightInfo,
  strWeightImg: string): Boolean;
var req: TIdHTTP;
  reqBody: TStringList;
  resp: TStringStream;
  strResult: string;
  jo: ISuperObject;
begin
  Result := False;
  req := TIdHTTP.Create(nil);
  try
    req.ReadTimeout := 5000;

    reqBody := TStringList.Create;
    resp := TStringStream.Create('');
    try
      reqBody.Add(Format('weightInfo=%s', [strWeightInfo]));
      reqBody.Add(Format('userToken=%s', [LEAccount.Text]));
      try
        req.Post('http://192.168.1.10:8080/ATWHttpServer/weight/saveWeightInfo.do', reqBody, resp);
        strResult := Utf8ToAnsi(resp.DataString); //AnsiToUTF8
        jo := SO(strResult);
        if jo.I['status'] = 0 then
        begin
          log('上传成功');
          Result := True;
        end
        else
        begin
          log('上传失败：' + Utf8ToAnsi(jo.S['message']));
        end;
      except on e: Exception do
          log(e.Message);
      end;
    finally
      reqBody.Free;
      resp.Free;
    end;
  finally
    req.Free;
  end;
end;

procedure TUploadCloudForm.FormShow(Sender: TObject);
begin
  LEAccount.SetFocus;
end;

function TUploadCloudForm.getLocalConnection: Boolean;
var fileName: string;
  ConnectedIP, Database, user, pass: string;
  ConnStr: string;
  myini: TIniFile;
begin
  myini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'db.ini');
  try
    //如果是用Access数据库
    if myini.ReadInteger('db', 'type', 0) = 0 then
    begin
      FileName := myini.ReadString('db', 'addr',
        ExtractFilePath(ParamStr(0)) + '\Database\Database.mdb');
      if FileExists(FileName) then
      begin
        with ADOCLocal do
        begin
          Close;
          ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='
            + FileName + ';Persist Security Info=False;Jet OLEDB:Database Password=www.fzatw.com';
          Open
        end;
      end
      else
      begin
        MessageBoxW(Handle, '请将本程序放在数据库所在位置的上一级', '错误', MB_OK
          + MB_ICONSTOP + MB_DEFBUTTON2 + MB_TOPMOST);
        //Application.Terminate;
      end;
    end
    else //是用SQL连接
    begin
      ConnectedIP := myini.ReadString('db', 'ip', '.');
      Database := myini.ReadString('db', 'dbname', 'weight20');
      user := myini.ReadString('db', 'user', 'sa');
      pass := TCommonUtil.deBase64(myini.ReadString('db', 'pass', 'MTIz'));
      ConnStr := 'Provider=SQLOLEDB.1;'; //OLE连接
      if myini.ReadInteger('db', 'integrated', 0) = 0 then //使用的登录模式是SA还是NT验证
        ConnStr := ConnStr + 'Integrated Security=SSPI;'
      else
        ConnStr := ConnStr + 'User ID=' + user + ';Password=' + pass + ';';
      ConnStr := ConnStr + 'Persist Security Info=True;'
        + 'Initial Catalog='
        + Database + ';Data Source=' + ConnectedIP;

      with ADOCLocal do //连接数据库
      try
        Close;
        ConnectionString := ConnStr;
        Open;
      except
        on E: Exception do
        begin
          MessageDlg(pchar(E.Message), mtError, [mbOK], 0);
        end;
      end
    end;
  finally
    myini.Free;
  end;
  Result := True;
end;

end.

