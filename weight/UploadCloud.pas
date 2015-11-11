unit UploadCloud;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB, Registry, IniFiles,
  IdCoder, IdCoder3to4, IdCoderMIME, IdBaseComponent, IdHashMessageDigest,
  ZLib, ZLibEx, Menus, RzLabel, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, dxGDIPlusClasses;

type
  TUploadCloudForm = class(TForm)
    TUpload: TTimer;
    ADOCLocal: TADOConnection;
    ADOQLocal: TADOQuery;
    Image1: TImage;
    GroupBox1: TGroupBox;
    LEIP: TLabeledEdit;
    Label1: TLabel;
    CBDatabase: TEdit;
    MemoLog: TMemo;
    procedure TUploadTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CBDatabaseChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
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
  CommonUtil, Main, QueryDM, WeightRecord, superobject, superxmlparser;

{$R *.dfm}

function TUploadCloudForm.uploadRecord: Boolean;
var uploadId, strWeightInfo, strWeightImg: string;
  adoq: TADOQuery;
begin
  Result := False;
  if CBDatabase.Text = '' then
  begin
    Exit;
  end;
  //当秤上没东西的时候才上传数据
  if StrToFloatDef(MainForm.FrmWeight1.getWeight(), 0) > MainForm.systemConfig.returnZero then
  begin
    Exit;
  end;

  adoq := TADOQuery.Create(nil);
  try
    adoq.Connection := QueryDataModule.DBConnection;
    with adoq do
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
  finally
    adoq.Free;
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
    myini.WriteString('remote', 'ip', LEIP.Text);
    myini.WriteString('remote', 'database', CBDatabase.Text);
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
    LEIP.Text := myini.ReadString('remote', 'ip', '');
    CBDatabase.Text := myini.ReadString('remote', 'database', '');
    //URLLblWebSite.Caption := 'http://' + LEIP.Text + ':6060/weight' + CBDatabase.Text + '/index.jsp';
  finally
    myini.Free;
  end;
  Result := True;
end;

procedure TUploadCloudForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  saveSetting;
end;

procedure TUploadCloudForm.CBDatabaseChange(Sender: TObject);
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
  loadSetting;
  ADOQLocal.Connection := ADOCLocal;
  TUpload.Enabled := True;
end;

function TUploadCloudForm.getRecordString(glideNo: string; var strWeightInfo,
  strWeightImg: string): Boolean;
var adoq: TADOQuery;
  w: TWeightRecord;
  pic, gs1, gs2, gs3, gs4, ts1, ts2, ts3, ts4: string;
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

  gs1 := ExtractFilePath(ParamStr(0)) + 'gs1.jpg';
  gs2 := ExtractFilePath(ParamStr(0)) + 'gs2.jpg';
  gs3 := ExtractFilePath(ParamStr(0)) + 'gs3.jpg';
  gs4 := ExtractFilePath(ParamStr(0)) + 'gs4.jpg';
  ts1 := ExtractFilePath(ParamStr(0)) + 'ts1.jpg';
  ts2 := ExtractFilePath(ParamStr(0)) + 'ts2.jpg';
  ts3 := ExtractFilePath(ParamStr(0)) + 'ts3.jpg';
  ts4 := ExtractFilePath(ParamStr(0)) + 'ts4.jpg';


  adoq := TADOQuery.Create(nil);
  try
    adoq.Connection := QueryDataModule.DBConnection;
    if not MainForm.systemConfig.savePicLocal then
    begin
      //查出记录明细
      adoq.Close;
      adoq.SQL.Text := 'select * from tbl_weight_img where weight_id=:glideNo';
      adoq.Parameters.ParamByName('glideNo').Value := glideNo;
      adoq.Open;
      if not adoq.IsEmpty then
      begin
        adoq.Last;
        (adoq.FieldByName('gross_img1') as TBlobField).SaveToFile(gs1);
        (adoq.FieldByName('gross_img2') as TBlobField).SaveToFile(gs2);
        (adoq.FieldByName('gross_img3') as TBlobField).SaveToFile(gs3);
        (adoq.FieldByName('gross_img4') as TBlobField).SaveToFile(gs4);
        (adoq.FieldByName('tare_img1') as TBlobField).SaveToFile(gs1);
        (adoq.FieldByName('tare_img2') as TBlobField).SaveToFile(gs2);
        (adoq.FieldByName('tare_img3') as TBlobField).SaveToFile(gs3);
        (adoq.FieldByName('tare_img4') as TBlobField).SaveToFile(gs4);
      end;
    end
    else
    begin
      pic := MainForm.systemConfig.picPath + '\' + glideNo + '\gross_img1.jpg';
      if FileExists(pic) then
        CopyFile(PChar(pic), PChar(gs1), False);

      pic := MainForm.systemConfig.picPath + '\' + glideNo + '\gross_img2.jpg';
      if FileExists(pic) then
        CopyFile(PChar(pic), PChar(gs2), False);

      pic := MainForm.systemConfig.picPath + '\' + glideNo + '\gross_img3.jpg';
      if FileExists(pic) then
        CopyFile(PChar(pic), PChar(gs3), False);

      pic := MainForm.systemConfig.picPath + '\' + glideNo + '\gross_img4.jpg';
      if FileExists(pic) then
        CopyFile(PChar(pic), PChar(gs4), False);

      pic := MainForm.systemConfig.picPath + '\' + glideNo + '\tare_img1.jpg';
      if FileExists(pic) then
        CopyFile(PChar(pic), PChar(ts1), False);

      pic := MainForm.systemConfig.picPath + '\' + glideNo + '\tare_img2.jpg';
      if FileExists(pic) then
        CopyFile(PChar(pic), PChar(ts2), False);

      pic := MainForm.systemConfig.picPath + '\' + glideNo + '\tare_img3.jpg';
      if FileExists(pic) then
        CopyFile(PChar(pic), PChar(ts3), False);

      pic := MainForm.systemConfig.picPath + '\' + glideNo + '\tare_img4.jpg';
      if FileExists(pic) then
        CopyFile(PChar(pic), PChar(ts4), False);
    end;

    strWeightImg := '{'
      + Format('''grossImg1'':''%s'',', [TCommonUtil.JPEGToString(gs1)])
    + Format('''grossImg2'':''%s'',', [TCommonUtil.JPEGToString(gs2)])
    + Format('''grossImg3'':''%s'',', [TCommonUtil.JPEGToString(gs3)])
    + Format('''grossImg4'':''%s'',', [TCommonUtil.JPEGToString(gs4)])
    + Format('''tareImg1'':''%s'',', [TCommonUtil.JPEGToString(ts1)])
    + Format('''tareImg2'':''%s'',', [TCommonUtil.JPEGToString(ts2)])
    + Format('''tareImg3'':''%s'',', [TCommonUtil.JPEGToString(ts3)])
    + Format('''tareImg4'':''%s''', [TCommonUtil.JPEGToString(ts4)])
    + '}';

  finally
    adoq.Free;
    if FileExists(gs1) then DeleteFile(gs1);
    if FileExists(gs2) then DeleteFile(gs2);
    if FileExists(gs3) then DeleteFile(gs3);
    if FileExists(gs4) then DeleteFile(gs4);
    if FileExists(ts1) then DeleteFile(ts1);
    if FileExists(ts2) then DeleteFile(ts2);
    if FileExists(ts3) then DeleteFile(ts3);
    if FileExists(ts4) then DeleteFile(ts4);
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

    req.Request.Accept := 'text/javascript';
    req.Request.ContentEncoding := 'gbk';

    req.Response.ContentEncoding := 'gbk';

    reqBody := TStringList.Create;
    resp := TStringStream.Create('');
    try
      reqBody.Add(Format('info=%s&img=%s', [strWeightInfo, strWeightImg]));
      try
        req.Post('http://' + LEIP.Text + ':6060/weight' + CBDatabase.Text
          + '/clientSave_weightInfo.action', reqBody, resp);
        //req.Post('http://localhost:8080/ATWWeight2013/clientSave_weightInfo.action', reqBody, resp);
        strResult := Utf8ToAnsi(resp.DataString); //AnsiToUTF8
        jo := SO(strResult);
        if UpperCase(jo.S['result']) = 'TRUE' then
        begin
          log('上传成功');
          Result := True;
        end
        else
        begin
          log('上传失败' + Chr(13) + Chr(10) + Utf8ToAnsi(jo.S['detail']));
        end;
      except
        log('访问超时');
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
  CBDatabase.SetFocus;
end;

end.

