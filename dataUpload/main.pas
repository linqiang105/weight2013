unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB, Registry, IniFiles,
  IdCoder, IdCoder3to4, IdCoderMIME, IdBaseComponent, IdHashMessageDigest,
  ZLib, ZLibEx, Menus;

type
  TUploadCloudForm = class(TForm)
    GBDatabase: TGroupBox;
    LEIP: TLabeledEdit;
    LEUsername: TLabeledEdit;
    LEPassword: TLabeledEdit;
    Label1: TLabel;
    CBDatabase: TComboBox;
    BitBtnRun: TBitBtn;
    BitBtnStop: TBitBtn;
    MemoLog: TMemo;
    TUpload: TTimer;
    ADOCLocal: TADOConnection;
    ADOCRemote: TADOConnection;
    ADOQRemote: TADOQuery;
    ADOQLocal: TADOQuery;
    LEAddr: TLabeledEdit;
    procedure BitBtnRunClick(Sender: TObject);
    procedure TUploadTimer(Sender: TObject);
    procedure BitBtnStopClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CBDatabaseEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CBDatabaseChange(Sender: TObject);
  private
    { Private declarations }
    lastRun: Boolean;
  public
    { Public declarations }
    function uploadRecord(): Boolean;
    function getLocalConnection(): Boolean;
    function saveSetting(): Boolean;
    function loadSetting(): Boolean;
    function log(str: string): Boolean;
    function getRemoteConnection(): Boolean;
  end;

var
  UploadCloudForm: TUploadCloudForm;

implementation

uses
  CommonUtil;

{$R *.dfm}

function EncodePassword(str: string): string;
var
  encode: TIdEncoderMIME;
begin
  encode := TIdEncoderMIME.Create(nil);
  try
    result := encode.EncodeString(str);
  finally
    encode.Free;
  end;
end;

function DecodePassword(str: string): string;
var
  decode: TIdDecoderMIME;
begin
  if Length(str) mod 2 <> 0 then //字符串长度是2的倍数才能解码
  begin
    result := '';
    exit;
  end;
  decode := TIdDecoderMIME.Create(nil);
  try
    result := decode.DecodeString(str);
  finally
    decode.Free;
  end;
end;

procedure TUploadCloudForm.BitBtnRunClick(Sender: TObject);
begin
  TUpload.Enabled := True;
  BitBtnRun.Enabled := False;
  BitBtnStop.Enabled := True;
end;

function TUploadCloudForm.uploadRecord: Boolean;
var uploadId: string;
  gs1, gs2, gs3, gs4, ts1, ts2, ts3, ts4: TMemoryStream;
begin
  if not getLocalConnection then
  begin
    log('远程数据库连接失败,请重新配置参数');
    Result := False;
    Exit;
  end;
  if not getRemoteConnection then
  begin
    log('远程数据库连接失败,请重新配置参数');
    Result := False;
    Exit;
  end;
  with ADOQLocal do
  begin
    Close;
    SQL.Text := 'select max(流水号) as glideNo from 称重信息 where (上传否=0) and (净重<>0)';
    Open;
    if not IsEmpty then
    begin
      uploadId := FieldByName('glideNo').AsString;
      if uploadId = '' then
      begin
        Result := False;
        Exit;
      end;
    end
    else
    begin
      Result := False;
      Exit;
    end;
    //查出记录明细
    Close;
    SQL.Text := 'select * from 称重信息 where 流水号=:glideNo';
    Parameters.ParamByName('glideNo').Value := uploadId;
    Open;
    if not IsEmpty then
    begin
      with ADOQRemote do
      begin
        Close;

        SQL.Text := 'select 序号 from 称重信息 where 流水号 = :glideNo';
        Parameters.ParamByName('glideNo').Value := LEAddr.Text + ADOQLocal.FieldByName('流水号').AsString;
        Open;
        if IsEmpty then
        begin
          SQL.Text := 'insert into 称重信息(流水号,车号,过磅类型,发货单位,收货单位,'
            + '货名,规格,毛重,皮重,净重,扣重,实重,单价,金额,折方系数,方量,过磅费,'
            + '毛重司磅员,皮重司磅员,毛重磅号,皮重磅号,'
            + '毛重时间,皮重时间,一次过磅时间,二次过磅时间,更新人,更新时间,备注,打印次数,上传否,'
            + '备用1,备用2,备用3,备用4,备用5,备用6,备用7,备用8,备用9,'
            + '备用10,备用11,备用12,备用13,备用14,备用15,备用16,备用17,备用18) '
            + 'values (:glideNo,:car,:weightType,:faHuo,:shouHuo,'
            + ':goods,:spec,:gross,:tare,:net,:bundle,:real,:price,:sum,:scale,:quanter,'
            + ':cost,:grossMan,:tareMan,:grossAddr,:tareAddr,'
            + ':grossTime,:tareTime,:firstTime,:secondTime,:updateUser,:updateTime,'
            + ':memo,:printCount,:upload,'
            + ':backup1,:backup2,:backup3,:backup4,:backup5,'
            + ':backup6,:backup7,:backup8,:backup9,:backup10,:backup11,:backup12,'
            + ':backup13,:backup14,:backup15,:backup16,:backup17,:backup18)';
        end
        else
        begin
          SQL.Text := 'update 称重信息 set 车号=:car,过磅类型=:weightType,发货单位=:faHuo,收货单位=:shouHuo,'
            + '货名=:goods,规格=:spec,毛重=:gross,皮重=:tare,净重=:net,扣重=:bundle,'
            + '实重=:real,单价=:price,金额=:sum,折方系数=:scale,方量=:quanter,过磅费=:cost,'
            + '毛重司磅员=:grossMan,皮重司磅员=:tareMan,毛重磅号=:grossAddr,皮重磅号=:tareAddr,'
            + '毛重时间=:grossTime,皮重时间=:tareTime,一次过磅时间=:firstTime,'
            + '二次过磅时间=:secondTime,更新人=:updateUser,更新时间=:updateTime,'
            + '备注=:memo,打印次数=:printCount,上传否=:upload,'
            + '备用1=:backup1,备用2=:backup2,备用3=:backup3,备用4=:backup4,备用5=:backup5,'
            + '备用6=:backup6,备用7=:backup7,备用8=:backup8,备用9=:backup9,'
            + '备用10=:backup10,备用11=:backup11,备用12=:backup12,备用13=:backup13,'
            + '备用14=:backup14,备用15=:backup15,备用16=:backup16,备用17=:backup17,备用18=:backup18 '
            + 'where 流水号=:glideNo';
        end;
        Parameters.ParamByName('glideNo').Value := LEAddr.Text + ADOQLocal.FieldByName('流水号').AsString;
        Parameters.ParamByName('car').Value := ADOQLocal.FieldByName('车号').AsString;
        Parameters.ParamByName('weightType').Value := ADOQLocal.FieldByName('过磅类型').AsString;
        Parameters.ParamByName('faHuo').Value := ADOQLocal.FieldByName('发货单位').AsString;
        Parameters.ParamByName('shouHuo').Value := ADOQLocal.FieldByName('收货单位').AsString;
        Parameters.ParamByName('goods').Value := ADOQLocal.FieldByName('货名').AsString;
        Parameters.ParamByName('spec').Value := ADOQLocal.FieldByName('规格').AsString;
        Parameters.ParamByName('gross').Value := ADOQLocal.FieldByName('毛重').AsFloat;
        Parameters.ParamByName('tare').Value := ADOQLocal.FieldByName('皮重').AsFloat;
        Parameters.ParamByName('net').Value := ADOQLocal.FieldByName('净重').AsFloat;
        Parameters.ParamByName('bundle').Value := ADOQLocal.FieldByName('扣重').AsFloat;
        Parameters.ParamByName('real').Value := ADOQLocal.FieldByName('实重').AsFloat;
        Parameters.ParamByName('price').Value := ADOQLocal.FieldByName('单价').AsFloat;
        Parameters.ParamByName('sum').Value := ADOQLocal.FieldByName('金额').AsFloat;
        Parameters.ParamByName('scale').Value := ADOQLocal.FieldByName('折方系数').AsFloat;
        Parameters.ParamByName('quanter').Value := ADOQLocal.FieldByName('方量').AsFloat;
        Parameters.ParamByName('cost').Value := ADOQLocal.FieldByName('过磅费').AsFloat;
        Parameters.ParamByName('grossMan').Value := ADOQLocal.FieldByName('毛重司磅员').AsString;
        Parameters.ParamByName('grossMan').Value := ADOQLocal.FieldByName('皮重司磅员').AsString;
        Parameters.ParamByName('grossAddr').Value := ADOQLocal.FieldByName('毛重磅号').AsString;
        Parameters.ParamByName('grossAddr').Value := ADOQLocal.FieldByName('皮重磅号').AsString;
        if ADOQLocal.FieldByName('毛重时间').IsNull then
          Parameters.ParamByName('grossTime').Value := null
        else
          Parameters.ParamByName('grossTime').Value := ADOQLocal.FieldByName('毛重时间').AsDateTime;

        if ADOQLocal.FieldByName('皮重时间').IsNull then
          Parameters.ParamByName('tareTime').Value := null
        else
          Parameters.ParamByName('tareTime').Value := ADOQLocal.FieldByName('皮重时间').AsDateTime;
        if ADOQLocal.FieldByName('一次过磅时间').IsNull then
          Parameters.ParamByName('firstTime').Value := null
        else
          Parameters.ParamByName('firstTime').Value := ADOQLocal.FieldByName('一次过磅时间').AsDateTime;

        if ADOQLocal.FieldByName('二次过磅时间').IsNull then
          Parameters.ParamByName('secondTime').Value := null
        else
          Parameters.ParamByName('secondTime').Value := ADOQLocal.FieldByName('二次过磅时间').AsDateTime;
        Parameters.ParamByName('updateUser').Value := ADOQLocal.FieldByName('更新人').AsString;
        if ADOQLocal.FieldByName('更新时间').IsNull then
          Parameters.ParamByName('updateTime').Value := null
        else
          Parameters.ParamByName('updateTime').Value := ADOQLocal.FieldByName('更新时间').AsDateTime;
        Parameters.ParamByName('memo').Value := ADOQLocal.FieldByName('备注').AsString;
        Parameters.ParamByName('printCount').Value := ADOQLocal.FieldByName('打印次数').AsInteger;
        Parameters.ParamByName('upload').Value := True;
        Parameters.ParamByName('backup1').Value := ADOQLocal.FieldByName('备用1').AsString;
        Parameters.ParamByName('backup2').Value := ADOQLocal.FieldByName('备用2').AsString;
        Parameters.ParamByName('backup3').Value := ADOQLocal.FieldByName('备用3').AsString;
        Parameters.ParamByName('backup4').Value := ADOQLocal.FieldByName('备用4').AsString;
        Parameters.ParamByName('backup5').Value := ADOQLocal.FieldByName('备用5').AsString;
        Parameters.ParamByName('backup6').Value := ADOQLocal.FieldByName('备用6').AsFloat;
        Parameters.ParamByName('backup7').Value := ADOQLocal.FieldByName('备用7').AsFloat;
        Parameters.ParamByName('backup8').Value := ADOQLocal.FieldByName('备用8').AsFloat;
        Parameters.ParamByName('backup9').Value := ADOQLocal.FieldByName('备用9').AsFloat;
        Parameters.ParamByName('backup10').Value := ADOQLocal.FieldByName('备用10').AsString;
        Parameters.ParamByName('backup11').Value := ADOQLocal.FieldByName('备用11').AsString;
        Parameters.ParamByName('backup12').Value := ADOQLocal.FieldByName('备用12').AsString;
        Parameters.ParamByName('backup13').Value := ADOQLocal.FieldByName('备用13').AsString;
        Parameters.ParamByName('backup14').Value := ADOQLocal.FieldByName('备用14').AsString;
        Parameters.ParamByName('backup15').Value := ADOQLocal.FieldByName('备用15').AsFloat;
        Parameters.ParamByName('backup16').Value := ADOQLocal.FieldByName('备用16').AsFloat;
        Parameters.ParamByName('backup17').Value := ADOQLocal.FieldByName('备用17').AsFloat;
        Parameters.ParamByName('backup18').Value := ADOQLocal.FieldByName('备用18').AsFloat;
        try
          ExecSQL;
        except on e: Exception do
          begin
            log('上传记录错误：' + e.Message);
            Result := False;
            Exit;
          end;
        end;
      end;
    end;

    //查出记录明细
    SQL.Text := 'select * from tbl_weight_img where weight_id=:glideNo';
    Parameters.ParamByName('glideNo').Value := uploadId;
    Open;
    if not IsEmpty then
    begin
      with ADOQRemote do
      begin
        Close;
        //上传照片
        SQL.Text := 'select * from tbl_weight_img where weight_id = :glideNo';
        Parameters.ParamByName('glideNo').Value := LEAddr.Text + ADOQLocal.FieldByName('weight_id').AsString;
        Open;
        if IsEmpty then
        begin
          SQL.Text := 'insert into tbl_weight_img(weight_id,gross_img1,gross_img2,'
            + 'gross_img3,gross_img4,tare_img1,tare_img2,tare_img3,tare_img4) '
            + 'values (:weight_id,:gross_img1,:gross_img2,:gross_img3,:gross_img4,'
            + ':tare_img1,:tare_img2,:tare_img3,:tare_img4)';
        end
        else
        begin
          SQL.Text := 'update tbl_weight_img set gross_img1=:gross_img1,'
            + 'gross_img2=:gross_img2,'
            + 'gross_img3=:gross_img3,'
            + 'gross_img4=:gross_img4,'
            + 'tare_img1=:tare_img1,'
            + 'tare_img2=:tare_img2,'
            + 'tare_img3=:tare_img3,'
            + 'tare_img4=:tare_img4 '
            + 'where weight_id=:weight_id';
        end;
        gs1 := TMemoryStream.Create;
        gs2 := TMemoryStream.Create;
        gs3 := TMemoryStream.Create;
        gs4 := TMemoryStream.Create;
        ts1 := TMemoryStream.Create;
        ts2 := TMemoryStream.Create;
        ts3 := TMemoryStream.Create;
        ts4 := TMemoryStream.Create;
        try
          (ADOQLocal.FieldByName('gross_img1') as TBlobField).SaveToStream(gs1);
          (ADOQLocal.FieldByName('gross_img2') as TBlobField).SaveToStream(gs2);
          (ADOQLocal.FieldByName('gross_img3') as TBlobField).SaveToStream(gs3);
          (ADOQLocal.FieldByName('gross_img4') as TBlobField).SaveToStream(gs4);
          (ADOQLocal.FieldByName('tare_img1') as TBlobField).SaveToStream(ts1);
          (ADOQLocal.FieldByName('tare_img2') as TBlobField).SaveToStream(ts2);
          (ADOQLocal.FieldByName('tare_img3') as TBlobField).SaveToStream(ts3);
          (ADOQLocal.FieldByName('tare_img4') as TBlobField).SaveToStream(ts4);
          Parameters.ParamByName('weight_id').Value := LEAddr.Text + ADOQLocal.FieldByName('weight_id').AsString;
          Parameters.ParamByName('gross_img1').LoadFromStream(gs1, ftBlob);
          Parameters.ParamByName('gross_img2').LoadFromStream(gs2, ftBlob);
          Parameters.ParamByName('gross_img3').LoadFromStream(gs3, ftBlob);
          Parameters.ParamByName('gross_img4').LoadFromStream(gs4, ftBlob);
          Parameters.ParamByName('tare_img1').LoadFromStream(ts1, ftBlob);
          Parameters.ParamByName('tare_img2').LoadFromStream(ts2, ftBlob);
          Parameters.ParamByName('tare_img3').LoadFromStream(ts3, ftBlob);
          Parameters.ParamByName('tare_img4').LoadFromStream(ts4, ftBlob);
          try
            ExecSQL;
          except on e: Exception do
            begin
              log('上传图片错误：' + e.Message);
              Result := False;
              Exit;
            end;
          end;
        finally
          gs1.Free;
          gs2.Free;
          gs3.Free;
          gs4.Free;
          ts1.Free;
          ts2.Free;
          ts3.Free;
          ts4.Free;
        end;
      end;
    end;

    SQL.Text := 'update 称重信息 set 上传否=1 where 流水号=:glideNo';
    Parameters.ParamByName('glideNo').Value := uploadId;
    try
      ExecSQL;
    except on e: Exception do
      begin
        log('设置上传标志错误：' + e.Message);
        Result := False;
        Exit;
      end;
    end;

    log('上传流水号为 ' + uploadId + ' 的称重记录成功');
  end;
  Result := True;
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

procedure TUploadCloudForm.BitBtnStopClick(Sender: TObject);
begin
  TUpload.Enabled := False;
  BitBtnRun.Enabled := True;
  BitBtnStop.Enabled := False;
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

procedure TUploadCloudForm.FormShow(Sender: TObject);
begin
  loadSetting;
  getLocalConnection;
  ADOQLocal.Connection := ADOCLocal;
  ADOQRemote.Connection := ADOCRemote;
end;

procedure TUploadCloudForm.CBDatabaseEnter(Sender: TObject);
begin
  with ADOCRemote do
  begin
    Close;
    ConnectionString := 'Provider=SQLOLEDB.1;'
      + 'User ID=' + LEUsername.Text + ';Password=' + LEPassword.Text + ';'
      + 'Persist Security Info=True;Initial Catalog=master;Data Source=' + LEIP.Text;
    try
      Open;
      with ADOQRemote do
      begin
        Close;
        SQL.Text := 'select name from master..sysdatabases order by name';
        Open;
        if not IsEmpty then
        begin
          CBDatabase.Items.Clear;
          First;
          while not Eof do
          begin
            CBDatabase.Items.Add(FieldByName('name').AsString);
            Next;
          end;
        end;
      end;
    except
      MessageBoxW(Handle, '数据库连接失败', '错误', MB_OK + MB_ICONSTOP +
        MB_DEFBUTTON2 + MB_TOPMOST);
    end;
  end;
end;

function TUploadCloudForm.saveSetting: Boolean;
var myini: TiniFile;
begin
  myini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'setup.ini');
  try
    myini.WriteString('remote', 'ip', LEIP.Text);
    myini.WriteString('remote', 'username', LEUsername.Text);
    myini.WriteString('remote', 'password', EncodePassword(ZCompressStr(LEPassword.Text)));
    myini.WriteString('remote', 'database', CBDatabase.Text);
    myini.WriteString('remote', 'address', LEAddr.Text);
    myini.WriteBool('remote', 'last_run', not BitBtnRun.Enabled);
  finally
    myini.Free;
  end;
  Result := True;
end;

function TUploadCloudForm.loadSetting: Boolean;
var myini: TiniFile;
begin
  myini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'setup.ini');
  try
    LEIP.Text := myini.ReadString('remote', 'ip', '');
    LEUsername.Text := myini.ReadString('remote', 'username', '');
    LEPassword.Text := ZDecompressStr(DecodePassword(myini.ReadString('remote', 'password', EncodePassword(ZCompressStr('')))));
    CBDatabase.Text := myini.ReadString('remote', 'database', '');
    LEAddr.Text := myini.ReadString('remote', 'address', 'A');
    lastRun := myini.ReadBool('remote', 'last_run', False);

    if lastRun then BitBtnRun.Click; 
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
var sl: TStringList;
begin
  if MemoLog.Lines.Count > 200 then
  begin
    sl := TStringList.Create;
    try
      sl.Text := MemoLog.Text;
      sl.SaveToFile(ExtractFilePath(ParamStr(0)) + FormatDateTime('yyyyMMddHHnnss', Now) + '.log');
    finally
      sl.Free;
    end;
    MemoLog.Lines.Clear;
  end;
  MemoLog.Lines.Add(str);
  Result := True;
end;

function TUploadCloudForm.getRemoteConnection: Boolean;
begin
  with ADOCRemote do //连接数据库
  try
    Close;
    ConnectionString := 'Provider=SQLOLEDB.1;' + 'User ID=' + LEUsername.Text
      + ';Password=' + LEPassword.Text + ';Persist Security Info=True;'
      + 'Initial Catalog='
      + CBDatabase.Text + ';Data Source=' + LEIP.Text;
    Open;
  except
    Result := False;
    Exit;
  end;
  Result := True;
end;

end.

