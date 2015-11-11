unit QueryDM;

interface

uses
  SysUtils, Classes, ADODB, DB, Dialogs, IniFiles,
  frxDesgn, frxClass, frxDBSet, frxBarcode, StrUtils, frxChart, frxCross,
  frxExportImage, frxExportXLS, Math, RM_DsgGridReport,
  RM_e_Jpeg, RM_e_Xls, RM_e_bmp, RM_DBChart,
  RM_Chart, RM_Cross, RM_BarCode, RM_AsBarView, RM_ChineseMoneyMemo,
  RM_Dataset, RM_GridReport, RM_Class, RM_Common, RM_e_Graphic, RM_System,
  frx2DBarcode;

type
  TQueryDataModule = class(TDataModule)
    DBConnection: TADOConnection;
    WeightMaintainDS: TDataSource;
    DSUser: TDataSource;
    ADOQUser: TADOQuery;
    PrepareMaintainQuery: TADOQuery;
    PrepareMaintainDS: TDataSource;
    ADOQExec: TADOQuery;
    WeightMaintainQuery: TADOQuery;
    ADOQueryPrintTicket: TADOQuery;
    StatisticsDS: TDataSource;
    StatisticsQuery: TADOQuery;
    ADOQLog: TADOQuery;
    ADOQMultiGross: TADOQuery;
    DSMultiGross: TDataSource;
    DSLog: TDataSource;
    ADOQBackRecord: TADOQuery;
    DSBackRecord: TDataSource;
    frxDBDataset1: TfrxDBDataset;
    frxReport1: TfrxReport;
    frxDBDatasetReport: TfrxDBDataset;
    frxReportReport: TfrxReport;
    ADOQCard: TADOQuery;
    DSCard: TDataSource;
    DSTao: TDataSource;
    ADOQTao: TADOQuery;
    frxDBDataset2: TfrxDBDataset;
    frxReport2: TfrxReport;
    DSPayHistory: TDataSource;
    ADOQPay: TADOQuery;
    DSPay: TDataSource;
    ADOQPayHistory: TADOQuery;
    ADOQStaticChart: TADOQuery;
    RMGridReport1: TRMGridReport;
    RMDBDataSet1: TRMDBDataSet;
    ADOQChart: TADOQuery;
    DSChart: TDataSource;
    ADOQStorage: TADOQuery;
    DSStorage: TDataSource;
    ADOQExec2: TADOQuery;
    ADOQExec3: TADOQuery;
    ADOQPriceShouHuo: TADOQuery;
    ADOQPrice: TADOQuery;
    DSPriceShouHuo: TDataSource;
    DSPrice: TDataSource;
    ADOQExceed: TADOQuery;
    ADOQInvalid: TADOQuery;
    DSExceed: TDataSource;
    DSInvalid: TDataSource;
    ADOQExport: TADOQuery;
    ADOQMail: TADOQuery;
    DSMail: TDataSource;
    ADOQCarFilter: TADOQuery;
    DSCarFilter: TDataSource;
    procedure ADOQUserBeforePost(DataSet: TDataSet);
    procedure ADOQUserAfterPost(DataSet: TDataSet);
    procedure ADOQUserAfterEdit(DataSet: TDataSet);
    procedure ADOQUserBeforeDelete(DataSet: TDataSet);
    procedure WeightMaintainQueryBeforePost(DataSet: TDataSet);
    procedure WeightMaintainQueryBeforeEdit(DataSet: TDataSet);
    procedure WeightMaintainQueryAfterPost(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    function frxReport1UserFunction(const MethodName: string;
      var Params: Variant): Variant;
    function frxReportReportUserFunction(const MethodName: string;
      var Params: Variant): Variant;
    procedure WeightMaintainQueryBeforeDelete(DataSet: TDataSet);
  private
    ChangeName: boolean;
    XuHao: string;
    Car, FaHuo, ShouHuo, Goods, Spec, Mao, Kong, Jing, Kou, Shi, Dangjia, Jinger: string;
    { Private declarations }
  public
    { Public declarations }
    ConnectFlag: Boolean;
    procedure ConnectDatabase; //连接数据库
  end;

var
  QueryDataModule: TQueryDataModule;

const DB_PASSWORD = 'www.fzatw.com';

implementation

uses Main, CommonUtil, OtherUtil;

{$R *.dfm}

function MoneyToCn(sourcemoney: Double): string;
var
  strsourcemoney, strobjectmoney: string;
  thiswei, thispos: string[2];
  //thiswei为当前位的大写，thispos为当前位的人民币单位
  iwei, pospoint: Integer;
  //iwei为当前位置，pospoint为小数点的位置
begin
  strsourcemoney := formatfloat('0.00', sourcemoney);
  //将浮点数转换成指定格式字符串
  if Length(strsourcemoney) > 15 then //超过千亿元
  begin
    ShowMessage('请输入正确的数字，不要超过千亿（15位整数）');
    Exit;
  end;
  pospoint := Pos('.', strsourcemoney); //小数点位置
  for iwei := Length(strsourcemoney) downto 1 do //例如：500.8 = 5 X=4
  begin
    case pospoint - iwei of //小数点位置 - 总长度 ＝ 最后一位单位
      -3: thispos := '厘';
      -2: thispos := '分';
      -1: thispos := '角';
      1: if (pospoint > 2) or (strsourcemoney[iwei] <> '0') then //小数点位置大于零
          thispos := '元';
      2: thispos := '拾';
      3: thispos := '佰';
      4: thispos := '仟';
      5: thispos := '万';
      6: thispos := '拾';
      7: thispos := '佰';
      8: thispos := '仟';
      9: thispos := '亿';
      10: thispos := '十';
      11: thispos := '佰';
      12: thispos := '仟';
    end;
    case strsourcemoney[iwei] of //当前数字转换成人民币汉字
      '.': Continue;
      '1': thiswei := '壹';
      '2': thiswei := '贰';
      '3': thiswei := '叁';
      '4': thiswei := '肆';
      '5': thiswei := '伍';
      '6': thiswei := '陆';
      '7': thiswei := '柒';
      '8': thiswei := '捌';
      '9': thiswei := '玖';
      '0':
        begin
          thiswei := '';
          if iwei < Length(strsourcemoney) then //不是第一位的时候
            if (strsourcemoney[iwei + 1] <> '0') and (strsourcemoney[iwei + 1] <> '.') then
              //当前一位数不是零，即5005 为五千零五。并且 前一位不是. ，即 5.05 为五元五分
              thiswei := '零';
          if (thispos <> '亿') and (thispos <> '万') and (thispos <> '元') then
            thispos := '' //单位是十，百、仟   的，为0，则不显示单位。
          else
            thiswei := ''; //若单位为亿、万、元，则前一位0，不显示'零'
        end;
    end;
    strobjectmoney := thiswei + thispos + strobjectmoney; //组合成大写金额
  end;
  strobjectmoney := ansireplacetext(strobjectmoney, '亿万', '亿'); //去掉'亿万'中的'万'
  if ansicontainsstr(strobjectmoney, '分') then
    Result := strobjectmoney
  else
  begin
    Result := strobjectmoney;
  end;
end;


function Num2CNum(dblArabic: double): string;
const
  _ChineseNumeric = '零壹贰叁肆伍陆柒捌玖';
var
  sArabic: string;
  sIntArabic: string;
  iPosOfDecimalPoint: integer;
  i: integer;
  iDigit: integer;
  iSection: integer;
  sSectionArabic: string;
  sSection: string;
  bInZero: boolean;
  bMinus: boolean;
  (* 将字串反向, 例如: 传入 '1234', 传回 '4321' *)
  function ConvertStr(const sBeConvert: string): string;
  var
    x: integer;
  begin
    Result := '';
    for x := Length(sBeConvert) downto 1 do
      Result := Result + sBeConvert[x];
  end;
  { of ConvertStr }
begin
  Result := '';
  bInZero := True;
  sArabic := FloatToStr(dblArabic); (* 将数字转成阿拉伯数字字串 *)
  if sArabic[1] = '-' then
  begin
    bMinus := True;
    sArabic := Copy(sArabic, 2, 254);
  end
  else
    bMinus := False;
  iPosOfDecimalPoint := Pos('.', sArabic); (* 取得小数点的位置 *)

  (* 先处理整数的部分 *)
  if iPosOfDecimalPoint = 0 then
    sIntArabic := ConvertStr(sArabic)
  else
    sIntArabic := ConvertStr(Copy(sArabic, 1, iPosOfDecimalPoint - 1));
  (* 从个位数起以每四位数为一小节 *)
  for iSection := 0 to ((Length(sIntArabic) - 1) div 4) do
  begin
    sSectionArabic := Copy(sIntArabic, iSection * 4 + 1, 4);
    sSection := '';
      (* 以下的 i 控制: 个十百千位四个位数 *)
    for i := 1 to Length(sSectionArabic) do
    begin
      iDigit := Ord(sSectionArabic[i]) - 48;
      if iDigit = 0 then
      begin
              (* 1. 避免 '零' 的重覆出现 *)
              (* 2. 个位数的 0 不必转成 '零' *)
        if (not bInZero) and (i <> 1) then sSection := '零' + sSection;
        bInZero := True;
      end
      else
      begin
        case i of
          2: sSection := '拾' + sSection;
          3: sSection := '佰' + sSection;
          4: sSection := '仟' + sSection;
        end;
        sSection := Copy(_ChineseNumeric, 2 * iDigit + 1, 2) +
          sSection;
        bInZero := False;
      end;
    end;

      (* 加上该小节的位数 *)
    if Length(sSection) = 0 then
    begin
      if (Length(Result) > 0) and (Copy(Result, 1, 2) <> '零') then
        Result := '零' + Result;
    end
    else
    begin
      case iSection of
        0: Result := sSection;
        1: Result := sSection + '万' + Result;
        2: Result := sSection + '亿' + Result;
        3: Result := sSection + '兆' + Result;
      end;
    end;
  end;

  (* 处理小数点右边的部分 *)
  if iPosOfDecimalPoint > 0 then
  begin
    Result := Result + '点';
    //AppendStr(Result, '点');
    for i := iPosOfDecimalPoint + 1 to Length(sArabic) do
    begin
      iDigit := Ord(sArabic[i]) - 48;
      //AppendStr(Result, Copy(_ChineseNumeric, 2 * iDigit + 1, 2));
      Result := Result + Copy(_ChineseNumeric, 2 * iDigit + 1, 2);
    end;
  end;
  (* 其他例外状况的处理 *)
  if Length(Result) = 0 then Result := '零';
  if Copy(Result, 1, 4) = '一十' then Result := Copy(Result, 3, 254);
  if Copy(Result, 1, 2) = '点' then Result := '零' + Result;

  (* 是否为负数 *)
  if bMinus then Result := '负' + Result;
end;

procedure TQueryDataModule.ADOQUserBeforePost(DataSet: TDataSet);
begin
  if DataSet.FieldByName('管理员').AsBoolean then
  begin
    DataSet.Edit;
    DataSet['用户管理'] := True;
  end;
end;

procedure TQueryDataModule.ADOQUserAfterPost(DataSet: TDataSet);
begin
  if ChangeName then
  begin
    MainForm.CurrentUser := DataSet.FieldByName('用户名').AsString;
  end;
end;

procedure TQueryDataModule.ADOQUserAfterEdit(DataSet: TDataSet);
begin
  if (MainForm.CurrentUser = DataSet.FieldByName('用户名').AsString) then
    ChangeName := True
  else
    ChangeName := False;
end;

procedure TQueryDataModule.ADOQUserBeforeDelete(DataSet: TDataSet);
begin
  if DataSet.FieldByName('管理员').AsBoolean then
  begin
    MessageDlg('不能删除管理员!', mtWarning, [mbOK, mbCancel], 0);
    Abort;
  end;
end;

procedure TQueryDataModule.WeightMaintainQueryBeforePost(
  DataSet: TDataSet);
var gross, tare, buckle, price: Double;
  net, actual, sum: Double;
  scale, quanter: Double;
begin

  gross := DataSet.FieldByName('毛重').AsFloat;
  tare := DataSet.FieldByName('皮重').AsFloat;
  buckle := DataSet.FieldByName('扣重').AsFloat;
  price := DataSet.FieldByName('单价').AsFloat;
  scale := DataSet.FieldByName('折方系数').AsFloat;

  DataSet.Edit;
  if gross - tare > 0 then
  begin
    if (gross = 0) or (tare = 0) then
      DataSet['净重'] := 0
    else
      DataSet['净重'] := gross - tare;
    if not MainForm.systemConfig.useBundleRate then
    begin
      DataSet['实重'] := gross - tare - buckle;
      DataSet['金额'] := (gross - tare - buckle) * price;
    end
    else
    begin
      DataSet['实重'] := RoundTo((gross - tare) * (1 - buckle / 100), -3);
      DataSet['金额'] := RoundTo((gross - tare) * (1 - buckle / 100), -3) * price;
    end;
    if scale > 0 then
      DataSet['方量'] := RoundTo(net / scale, -2);

    net := DataSet['净重'];
    actual := DataSet['实重'];
    sum := DataSet['金额'];
    quanter := DataSet['方量'];

  end
end;

procedure TQueryDataModule.WeightMaintainQueryBeforeEdit(
  DataSet: TDataSet);
begin
  XuHao := DataSet.FieldByName('流水号').AsString;
  Car := DataSet.FieldByName('车号').AsString;
  FaHuo := DataSet.FieldByName('发货单位').AsString;
  ShouHuo := DataSet.FieldByName('收货单位').AsString;
  Goods := DataSet.FieldByName('货名').AsString;
  Spec := DataSet.FieldByName('规格').AsString;
  Mao := DataSet.FieldByName('毛重').AsString;
  Kong := DataSet.FieldByName('皮重').AsString;
  Jing := DataSet.FieldByName('净重').AsString;
  Kou := DataSet.FieldByName('扣重').AsString;
  Shi := DataSet.FieldByName('实重').AsString;
  Dangjia := DataSet.FieldByName('单价').AsString;
  Jinger := DataSet.FieldByName('金额').AsString;
end;

procedure TQueryDataModule.WeightMaintainQueryAfterPost(DataSet: TDataSet);
var Log: string;
begin
  Log := '流水号为' + XuHao + '的记录:';
  if Car <> DataSet.FieldByName('车号').AsString then
    Log := Log + '车号由 ' + Car + ' 修改为 '
      + DataSet.FieldByName('车号').AsString + ',';
  if FaHuo <> DataSet.FieldByName('发货单位').AsString then
    Log := Log + '发货单位由 ' + FaHuo + ' 修改为 '
      + DataSet.FieldByName('发货单位').AsString + ',';
  if ShouHuo <> DataSet.FieldByName('收货单位').AsString then
    Log := Log + '收货单位由 ' + ShouHuo + ' 修改为 '
      + DataSet.FieldByName('收货单位').AsString + ',';
  if Goods <> DataSet.FieldByName('货名').AsString then
    Log := Log + '货名由 ' + Goods + ' 修改为 '
      + DataSet.FieldByName('货名').AsString + ',';
  if Spec <> DataSet.FieldByName('规格').AsString then
    Log := Log + '规格由 ' + Spec + ' 修改为 '
      + DataSet.FieldByName('规格').AsString + ',';
  if Mao <> DataSet.FieldByName('毛重').AsString then
    Log := Log + '毛重由 ' + Mao + ' 修改为 '
      + DataSet.FieldByName('毛重').AsString + ',';
  if Kong <> DataSet.FieldByName('皮重').AsString then
    Log := Log + '皮重由 ' + Kong + ' 修改为 '
      + DataSet.FieldByName('皮重').AsString + ',';
  if Jing <> DataSet.FieldByName('净重').AsString then
    Log := Log + '净重由 ' + Jing + ' 修改为 '
      + DataSet.FieldByName('净重').AsString + ',';
  if Kou <> DataSet.FieldByName('扣重').AsString then
    Log := Log + '扣重由 ' + Kou + ' 修改为 '
      + DataSet.FieldByName('扣重').AsString + ',';
  if Shi <> DataSet.FieldByName('实重').AsString then
    Log := Log + '实重由 ' + Shi + ' 修改为 '
      + DataSet.FieldByName('实重').AsString + ',';
  if Dangjia <> DataSet.FieldByName('单价').AsString then
    Log := Log + '单价由 ' + Dangjia + ' 修改为 '
      + DataSet.FieldByName('单价').AsString + ',';
  if Jinger <> DataSet.FieldByName('金额').AsString then
    Log := Log + '金额由 ' + Jinger + ' 修改为 '
      + DataSet.FieldByName('金额').AsString;

  with ADOQLog do
  begin
    Close;
    SQL.Clear;
    SQL.Add('insert into 日志(修改人,时间,日志) values(:user,:time,:content)');
    Parameters.ParamByName('user').Value := MainForm.CurrentUser;
    Parameters.ParamByName('time').Value := FormatDateTime('yyyy-mm-dd hh:nn:ss', Now);
    Parameters.ParamByName('content').Value := Log;
    ExecSQL
  end;
end;

procedure TQueryDataModule.ConnectDatabase; //连接数据库
var ConnectedIP, Database, user, pass: string;
  myini: TIniFile;
  ConnStr: string;
begin
  ConnectFlag := False;
  myini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'db.ini');
  try
    ConnectedIP := myini.ReadString('db', 'IP', '.');
    Database := myini.ReadString('db', 'DBName', 'weight20');
    user := myini.ReadString('db', 'User', 'sa');
    pass := TCommonUtil.deBase64(myini.ReadString('db', 'Pass', 'MTIz'));
    ConnStr := 'Provider=SQLOLEDB.1;'; //OLE连接
    if myini.ReadBool('db', 'Integrated', True) then //使用的登录模式是SA还是NT验证
      ConnStr := ConnStr + 'Integrated Security=SSPI;'
    else
      ConnStr := ConnStr + 'User ID=' + user + ';Password=' + pass + ';';
    ConnStr := ConnStr + 'Persist Security Info=True;'
      + 'Initial Catalog=' + Database + ';Data Source=' + ConnectedIP;

    with QueryDataModule.DBConnection do //连接数据库
    try
      Close;
      LoginPrompt := False;
      ConnectionTimeout := 10;
      ConnectionString := ConnStr;
      Open;
      ConnectFlag := True;
    except
      on E: Exception do
      begin
        //MessageDlg(pchar(E.Message), mtError, [mbOK], 0);
        MessageDlg('数据库连接失败,请重新设置', mtError, [mbOK], 0);
        ConnectFlag := False;
      end;
    end
  finally
    myini.Free;
  end;
end;

procedure TQueryDataModule.DataModuleCreate(Sender: TObject);
var FileName: string;
  myini: TiniFile;
begin
  myini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'db.ini');
  try
    //如果是用Access数据库
    if myini.ReadInteger('db', 'type', 0) = 0 then
    begin
      FileName := myini.ReadString('db', 'addr',
        ExtractFilePath(ParamStr(0)) + '\Database\Database.mdb');
      ConnectFlag := True;
      if not FileExists(FileName) then
      begin
        FileName := ExtractFilePath(ParamStr(0)) + '\Database\Database.mdb';
        myini.WriteString('db', 'addr', FileName)
      end;
      if FileExists(FileName) then
      try
        with QueryDataModule.DBConnection do
        begin
          Close;
          ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='
            + FileName + ';Persist Security Info=False;Jet OLEDB:Database Password=' + DB_PASSWORD;
          Open
        end;
      except
        ConnectFlag := False;
      end
      else
        ConnectFlag := False;
    end
    else //是用SQL连接
    begin
      ConnectDatabase;
    end;
  finally
    myini.Free;
  end;
  frxReport1.AddFunction('function MoneyToCn(ANumberic: Double): String;', 'Myfunction', '人民币大写金额转换函数');
  frxReport1.AddFunction('function Num2CNum(dblArabic: Double): String;', 'Myfunction', '阿拉伯大写金额转换函数');
  frxReportReport.AddFunction('function MoneyToCn(ANumberic: Double): String;', 'Myfunction', '人民币大写金额转换函数');
  frxReportReport.AddFunction('function Num2CNum(dblArabic: Double): String;', 'Myfunction', '阿拉伯大写金额转换函数');
end;

function TQueryDataModule.frxReport1UserFunction(const MethodName: string;
  var Params: Variant): Variant;
begin
  if UpperCase(MethodName) = UpperCase('MoneyToCn') then
    Result := MoneyToCn(Params[0]);
  if UpperCase(MethodName) = UpperCase('Num2CNum') then
    Result := Num2CNum(Params[0]);
end;

function TQueryDataModule.frxReportReportUserFunction(
  const MethodName: string; var Params: Variant): Variant;
begin
  if UpperCase(MethodName) = UpperCase('MoneyToCn') then
    Result := MoneyToCn(Params[0]);
  if UpperCase(MethodName) = UpperCase('Num2CNum') then
    Result := Num2CNum(Params[0]);
end;

procedure TQueryDataModule.WeightMaintainQueryBeforeDelete(
  DataSet: TDataSet);
begin
  TLogUtil.AddLog('流水号为' + DataSet.FieldByName('流水号').AsString + '的记录被删除');
end;

end.

