unit DataMigrate;

interface

uses
  SysUtils, Variants, Classes, Controls, Forms, StdCtrls, ComCtrls,
  ExtCtrls, DB, ADODB, Windows;

type
  TDataMigrateForm = class(TForm)
    BtnMigrate: TButton;
    PB: TProgressBar;
    PBack: TPanel;
    LblMsg: TLabel;
    LblMsg2: TLabel;
    ADOCAccess: TADOConnection;
    ADOQAccess: TADOQuery;
    ADOCSQL: TADOConnection;
    ADOQSQL: TADOQuery;
    RBAccess2SQL: TRadioButton;
    RBSQL2Access: TRadioButton;
    procedure BtnMigrateClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function clearSQLDB(): Boolean;
    function copyBackRecord(): Boolean;
    function copyWeightImg(): Boolean;
    function copyBackup(): Boolean;
    function copyPreMaintain(): Boolean;
    function copyLog(): Boolean;
    function copyUserInfo(): Boolean;
    function copyWeightInfo(): Boolean;
  end;

var
  DataMigrateForm: TDataMigrateForm;

implementation

uses
  QueryDM, IniFiles, CommonUtil;

{$R *.dfm}

procedure TDataMigrateForm.BtnMigrateClick(Sender: TObject);
var myini: TiniFile;
  Connstr: string;
begin
  if Application.MessageBox('该程序用于将单机模式下的数据库数据迁移到网络模式下的数据库中原网络模式下的数据将会被清空，确定要继续吗？',
    '错误', MB_YESNO + MB_ICONSTOP + MB_DEFBUTTON2 + MB_TOPMOST) = IDNO then
  begin
    Exit;
  end;

  LblMsg2.Visible := False;
  if RBAccess2SQL.Checked then
  begin
    //取到Access的数据库连接
    with adocAccess do
    begin
      Close;
      ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='
        + ExtractFilePath(ParamStr(0)) + '\Database\Database.mdb'
        + ';Persist Security Info=False;'
        + 'Jet OLEDB:Database Password=' + QueryDM.DB_PASSWORD;
      Open;
    end;
    //取到SQL的数据库连接
    with adocSQL do
    begin
      Close;
      myini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'db.ini');
      try
        ConnStr := 'Provider=SQLOLEDB.1;'; //OLE DB连接程序
        if myini.ReadBool('db', 'integrated', True) then //验证方式
          ConnStr := ConnStr + 'Integrated Security=SSPI;'
        else
          ConnStr := ConnStr + 'User ID=' + myini.ReadString('db', 'user', 'sa')
            + ';Password=' + TCommonUtil.debase64(myini.ReadString('db', 'pass', '')) + ';';
        ConnStr := ConnStr + 'Persist Security Info=True;Initial Catalog='
          + myini.ReadString('db', 'DBName', 'weight20') + ';Data Source='
          + myini.ReadString('db', 'IP', '.');
        LoginPrompt := False;
        ConnectionString := ConnStr;
        Open;
      finally
        myini.Free;
      end;
    end;
  end
  else
  begin
    //取到Access的数据库连接
    with adocSQL do
    begin
      Close;
      ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='
        + ExtractFilePath(ParamStr(0)) + '\Database\Database.mdb'
        + ';Persist Security Info=False;'
        + 'Jet OLEDB:Database Password=' + QueryDM.DB_PASSWORD;
      Open;
    end;
    //取到SQL的数据库连接
    with adocAccess do
    begin
      Close;
      myini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'db.ini');
      try
        ConnStr := 'Provider=SQLOLEDB.1;'; //OLE DB连接程序
        if myini.ReadBool('db', 'integrated', True) then //验证方式
          ConnStr := ConnStr + 'Integrated Security=SSPI;'
        else
          ConnStr := ConnStr + 'User ID=' + myini.ReadString('db', 'user', 'sa')
            + ';Password=' + TCommonUtil.debase64(myini.ReadString('db', 'pass', '')) + ';';
        ConnStr := ConnStr + 'Persist Security Info=True;Initial Catalog='
          + myini.ReadString('db', 'DBName', 'weight20') + ';Data Source='
          + myini.ReadString('db', 'IP', '.');
        LoginPrompt := False;
        ConnectionString := ConnStr;
        Open;
      finally
        myini.Free;
      end;
    end;
  end;
  PB.Position := 0;
  //清空SQL的库
  clearSQLDB;
  PB.StepIt;
  //拷贝TBL_BACK_RECORD
  copyBackRecord;
  PB.StepIt;
  //拷贝TBL_WEIGHT_IMG
  copyWeightImg;
  PB.StepIt;
  //拷贝备用表
  copyBackup;
  PB.StepIt;
  //拷贝车号,发货单位,收货单位,货名,规格,套表
  copyPreMaintain;
  PB.StepIt;
  //拷贝称重信息
  copyWeightInfo;
  //拷贝日志
  copyLog;
  PB.StepIt;
  //拷贝用户信息
  copyUserInfo;
  PB.StepIt;
  PB.Position := PB.Max;
  LblMsg2.Visible := True;
end;

function TDataMigrateForm.clearSQLDB: Boolean;
begin
  with ADOQSQL do
  begin
    Close;

    if RBAccess2SQL.Checked then
    begin
      SQL.Text := 'truncate table tbl_back_record';
      ExecSQL;
      SQL.Text := 'truncate table tbl_card';
      ExecSQL;
      SQL.Text := 'truncate table tbl_pay_history';
      ExecSQL;
      SQL.Text := 'truncate table tbl_weight_img';
      ExecSQL;
      SQL.Text := 'truncate table 备用1';
      ExecSQL;
      SQL.Text := 'truncate table 备用2';
      ExecSQL;
      SQL.Text := 'truncate table 备用3';
      ExecSQL;
      SQL.Text := 'truncate table 备用4';
      ExecSQL;
      SQL.Text := 'truncate table 备用5';
      ExecSQL;
      SQL.Text := 'truncate table 备用10';
      ExecSQL;
      SQL.Text := 'truncate table 备用11';
      ExecSQL;
      SQL.Text := 'truncate table 备用12';
      ExecSQL;
      SQL.Text := 'truncate table 备用13';
      ExecSQL;
      SQL.Text := 'truncate table 备用14';
      ExecSQL;
      SQL.Text := 'truncate table 车号';
      ExecSQL;
      SQL.Text := 'truncate table 发货单位';
      ExecSQL;
      SQL.Text := 'truncate table 收货单位';
      ExecSQL;
      SQL.Text := 'truncate table 货名';
      ExecSQL;
      SQL.Text := 'truncate table 规格';
      ExecSQL;
      SQL.Text := 'truncate table 套表';
      ExecSQL;
      SQL.Text := 'truncate table 日志';
      ExecSQL;
      //SQL.Text := 'truncate table 用户信息';
      //ExecSQL;
      //SQL.Text := 'truncate table 称重信息';
      //ExecSQL;
    end
    else if RBSQL2Access.Checked then
    begin
      SQL.Text := 'delete from tbl_back_record';
      ExecSQL;
      SQL.Text := 'delete from tbl_card';
      ExecSQL;
      SQL.Text := 'delete from tbl_pay_history';
      ExecSQL;
      SQL.Text := 'delete from tbl_weight_img';
      ExecSQL;
      SQL.Text := 'delete from 备用1';
      ExecSQL;
      SQL.Text := 'delete from 备用2';
      ExecSQL;
      SQL.Text := 'delete from 备用3';
      ExecSQL;
      SQL.Text := 'delete from 备用4';
      ExecSQL;
      SQL.Text := 'delete from 备用5';
      ExecSQL;
      SQL.Text := 'delete from 备用10';
      ExecSQL;
      SQL.Text := 'delete from 备用11';
      ExecSQL;
      SQL.Text := 'delete from 备用12';
      ExecSQL;
      SQL.Text := 'delete from 备用13';
      ExecSQL;
      SQL.Text := 'delete from 备用14';
      ExecSQL;
      SQL.Text := 'delete from 车号';
      ExecSQL;
      SQL.Text := 'delete from 发货单位';
      ExecSQL;
      SQL.Text := 'delete from 收货单位';
      ExecSQL;
      SQL.Text := 'delete from 货名';
      ExecSQL;
      SQL.Text := 'delete from 规格';
      ExecSQL;
      SQL.Text := 'delete from 套表';
      ExecSQL;
      SQL.Text := 'delete from 日志';
      ExecSQL;
      //SQL.Text := 'delete from 用户信息';
      //ExecSQL;
      //SQL.Text := 'delete from 称重信息';
      //ExecSQL;
    end;
  end;
end;

function TDataMigrateForm.copyBackRecord: Boolean;
begin
  with ADOQAccess do
  begin
    Close;
    SQL.Text := 'select * from tbl_back_record';
    Open;
    if not IsEmpty then
    begin
      First;
      while not Eof do
      begin
        with ADOQSQL do
        begin
          Close;
          SQL.Text := 'insert into tbl_back_record(weight,weight_time) values (:weight,:weight_time)';
          Parameters.ParamByName('weight').Value := ADOQAccess.FieldByName('weight').AsFloat;
          Parameters.ParamByName('weight_time').Value := ADOQAccess.FieldByName('weight_time').AsDateTime;
          ExecSQL;
        end;
        Next;
      end;
    end;
  end;
end;

function TDataMigrateForm.copyBackup: Boolean;
begin
  with ADOQAccess do
  begin
    Close;
    SQL.Text := 'select * from 备用1';
    Open;
    if not IsEmpty then
    begin
      First;
      while not Eof do
      begin
        with ADOQSQL do
        begin
          Close;
          SQL.Text := 'insert into 备用1(代码,备用1) values (:code,:backup)';
          Parameters.ParamByName('code').Value := ADOQAccess.FieldByName('代码').AsString;
          Parameters.ParamByName('backup').Value := ADOQAccess.FieldByName('备用1').AsString;
          ExecSQL;
        end;
        Next;
      end;
    end;

    SQL.Text := 'select * from 备用2';
    Open;
    if not IsEmpty then
    begin
      First;
      while not Eof do
      begin
        with ADOQSQL do
        begin
          Close;
          SQL.Text := 'insert into 备用2(代码,备用2) values (:code,:backup)';
          Parameters.ParamByName('code').Value := ADOQAccess.FieldByName('代码').AsString;
          Parameters.ParamByName('backup').Value := ADOQAccess.FieldByName('备用2').AsString;
          ExecSQL;
        end;
        Next;
      end;
    end;

    SQL.Text := 'select * from 备用3';
    Open;
    if not IsEmpty then
    begin
      First;
      while not Eof do
      begin
        with ADOQSQL do
        begin
          Close;
          SQL.Text := 'insert into 备用3(代码,备用3) values (:code,:backup)';
          Parameters.ParamByName('code').Value := ADOQAccess.FieldByName('代码').AsString;
          Parameters.ParamByName('backup').Value := ADOQAccess.FieldByName('备用3').AsString;
          ExecSQL;
        end;
        Next;
      end;
    end;

    SQL.Text := 'select * from 备用4';
    Open;
    if not IsEmpty then
    begin
      First;
      while not Eof do
      begin
        with ADOQSQL do
        begin
          Close;
          SQL.Text := 'insert into 备用4(代码,备用4) values (:code,:backup)';
          Parameters.ParamByName('code').Value := ADOQAccess.FieldByName('代码').AsString;
          Parameters.ParamByName('backup').Value := ADOQAccess.FieldByName('备用4').AsString;
          ExecSQL;
        end;
        Next;
      end;
    end;

    SQL.Text := 'select * from 备用5';
    Open;
    if not IsEmpty then
    begin
      First;
      while not Eof do
      begin
        with ADOQSQL do
        begin
          Close;
          SQL.Text := 'insert into 备用5(代码,备用5) values (:code,:backup)';
          Parameters.ParamByName('code').Value := ADOQAccess.FieldByName('代码').AsString;
          Parameters.ParamByName('backup').Value := ADOQAccess.FieldByName('备用5').AsString;
          ExecSQL;
        end;
        Next;
      end;
    end;

    SQL.Text := 'select * from 备用10';
    Open;
    if not IsEmpty then
    begin
      First;
      while not Eof do
      begin
        with ADOQSQL do
        begin
          Close;
          SQL.Text := 'insert into 备用10(代码,备用10) values (:code,:backup)';
          Parameters.ParamByName('code').Value := ADOQAccess.FieldByName('代码').AsString;
          Parameters.ParamByName('backup').Value := ADOQAccess.FieldByName('备用10').AsString;
          ExecSQL;
        end;
        Next;
      end;
    end;

    SQL.Text := 'select * from 备用11';
    Open;
    if not IsEmpty then
    begin
      First;
      while not Eof do
      begin
        with ADOQSQL do
        begin
          Close;
          SQL.Text := 'insert into 备用11(代码,备用11) values (:code,:backup)';
          Parameters.ParamByName('code').Value := ADOQAccess.FieldByName('代码').AsString;
          Parameters.ParamByName('backup').Value := ADOQAccess.FieldByName('备用11').AsString;
          ExecSQL;
        end;
        Next;
      end;
    end;

    SQL.Text := 'select * from 备用12';
    Open;
    if not IsEmpty then
    begin
      First;
      while not Eof do
      begin
        with ADOQSQL do
        begin
          Close;
          SQL.Text := 'insert into 备用12(代码,备用12) values (:code,:backup)';
          Parameters.ParamByName('code').Value := ADOQAccess.FieldByName('代码').AsString;
          Parameters.ParamByName('backup').Value := ADOQAccess.FieldByName('备用12').AsString;
          ExecSQL;
        end;
        Next;
      end;
    end;

    SQL.Text := 'select * from 备用13';
    Open;
    if not IsEmpty then
    begin
      First;
      while not Eof do
      begin
        with ADOQSQL do
        begin
          Close;
          SQL.Text := 'insert into 备用13(代码,备用13) values (:code,:backup)';
          Parameters.ParamByName('code').Value := ADOQAccess.FieldByName('代码').AsString;
          Parameters.ParamByName('backup').Value := ADOQAccess.FieldByName('备用13').AsString;
          ExecSQL;
        end;
        Next;
      end;
    end;

    SQL.Text := 'select * from 备用14';
    Open;
    if not IsEmpty then
    begin
      First;
      while not Eof do
      begin
        with ADOQSQL do
        begin
          Close;
          SQL.Text := 'insert into 备用14(代码,备用14) values (:code,:backup)';
          Parameters.ParamByName('code').Value := ADOQAccess.FieldByName('代码').AsString;
          Parameters.ParamByName('backup').Value := ADOQAccess.FieldByName('备用14').AsString;
          ExecSQL;
        end;
        Next;
      end;
    end;

  end;
end;

function TDataMigrateForm.copyLog: Boolean;
begin
  with ADOQAccess do
  begin
    Close;
    SQL.Text := 'select * from 日志';
    Open;
    if not IsEmpty then
    begin
      First;
      while not Eof do
      begin
        with ADOQSQL do
        begin
          Close;
          SQL.Text := 'insert into 日志(修改人,时间,日志) values (:update_user,:update_time,:content)';
          Parameters.ParamByName('update_user').Value := ADOQAccess.FieldByName('修改人').AsString;
          Parameters.ParamByName('update_time').Value := ADOQAccess.FieldByName('时间').AsDateTime;
          Parameters.ParamByName('content').Value := ADOQAccess.FieldByName('日志').AsString;
          ExecSQL;
        end;
        Next;
      end;
    end;
  end;
end;

function TDataMigrateForm.copyPreMaintain: Boolean;
begin
  with ADOQAccess do
  begin
    Close;
    SQL.Text := 'select * from 车号';
    Open;
    if not IsEmpty then
    begin
      First;
      while not Eof do
      begin
        with ADOQSQL do
        begin
          Close;
          SQL.Text := 'insert into 车号(车号,皮重,备注) '
            + 'values (:car,:tare,:memo)';
          Parameters.ParamByName('car').Value := ADOQAccess.FieldByName('车号').AsString;
          Parameters.ParamByName('tare').Value := ADOQAccess.FieldByName('皮重').AsFloat;
          Parameters.ParamByName('memo').Value := ADOQAccess.FieldByName('备注').AsString;
          ExecSQL;
        end;
        Next;
      end;
    end;

    SQL.Text := 'select * from 发货单位';
    Open;
    if not IsEmpty then
    begin
      First;
      while not Eof do
      begin
        with ADOQSQL do
        begin
          Close;
          SQL.Text := 'insert into 发货单位(代码,发货单位) values (:code,:backup)';
          Parameters.ParamByName('code').Value := ADOQAccess.FieldByName('代码').AsString;
          Parameters.ParamByName('backup').Value := ADOQAccess.FieldByName('发货单位').AsString;
          ExecSQL;
        end;
        Next;
      end;
    end;

    SQL.Text := 'select * from 收货单位';
    Open;
    if not IsEmpty then
    begin
      First;
      while not Eof do
      begin
        with ADOQSQL do
        begin
          Close;
          SQL.Text := 'insert into 收货单位(代码,收货单位,当前金额,信用额度) values (:code,:backup,:leftSum,:credit)';
          Parameters.ParamByName('code').Value := ADOQAccess.FieldByName('代码').AsString;
          Parameters.ParamByName('backup').Value := ADOQAccess.FieldByName('收货单位').AsString;
          Parameters.ParamByName('leftSum').Value := ADOQAccess.FieldByName('当前金额').AsFloat;
          Parameters.ParamByName('credit').Value := ADOQAccess.FieldByName('信用额度').AsFloat;
          ExecSQL;
        end;
        Next;
      end;
    end;

    SQL.Text := 'select * from 货名';
    Open;
    if not IsEmpty then
    begin
      First;
      while not Eof do
      begin
        with ADOQSQL do
        begin
          Close;
          SQL.Text := 'insert into 货名(代码,货名,单价,折方系数) values (:code,:backup,:price,:scale)';
          Parameters.ParamByName('code').Value := ADOQAccess.FieldByName('代码').AsString;
          Parameters.ParamByName('backup').Value := ADOQAccess.FieldByName('货名').AsString;
          Parameters.ParamByName('price').Value := ADOQAccess.FieldByName('单价').AsFloat;
          Parameters.ParamByName('scale').Value := ADOQAccess.FieldByName('折方系数').AsFloat;
          ExecSQL;
        end;
        Next;
      end;
    end;

    SQL.Text := 'select * from 规格';
    Open;
    if not IsEmpty then
    begin
      First;
      while not Eof do
      begin
        with ADOQSQL do
        begin
          Close;
          SQL.Text := 'insert into 规格(代码,规格) values (:code,:backup)';
          Parameters.ParamByName('code').Value := ADOQAccess.FieldByName('代码').AsString;
          Parameters.ParamByName('backup').Value := ADOQAccess.FieldByName('规格').AsString;
          ExecSQL;
        end;
        Next;
      end;
    end;

    SQL.Text := 'select * from 套表';
    Open;
    if not IsEmpty then
    begin
      First;
      while not Eof do
      begin
        with ADOQSQL do
        begin
          Close;
          SQL.Text := 'insert into 套表(车号,发货单位,收货单位,货名,规格) '
            + 'values (:car,:faHuo,:shouHuo,:goods,:spec)';
          Parameters.ParamByName('car').Value := ADOQAccess.FieldByName('车号').AsString;
          Parameters.ParamByName('faHuo').Value := ADOQAccess.FieldByName('发货单位').AsString;
          Parameters.ParamByName('shouHuo').Value := ADOQAccess.FieldByName('收货单位').AsString;
          Parameters.ParamByName('goods').Value := ADOQAccess.FieldByName('货名').AsString;
          Parameters.ParamByName('spec').Value := ADOQAccess.FieldByName('规格').AsString;
          ExecSQL;
        end;
        Next;
      end;
    end;
  end;
end;

function TDataMigrateForm.copyUserInfo: Boolean;
begin
  with ADOQAccess do
  begin
    Close;
    SQL.Text := 'select * from 用户信息';
    Open;
    if not IsEmpty then
    begin
      First;
      while not Eof do
      begin
        with ADOQSQL do
        begin
          Close;
          SQL.Text := 'insert into 用户信息([用户名],[密码],'
            + '[预置维护],[卡号管理],[系统日志],[后台记录],[打印磅单],[修改磅单],'
            + '[打印报表],[用户管理],[系统设置],[界面配置],[手工重量],[数据库设置],'
            + '[数据备份],[数据导入],[数据导出],[数据清理],[数据初始化],'
            + '[仪表设置],[视频设置],[读卡器设置],[IO模块设置],[大屏幕设置],'
            + '[语音输出],[数据查询],[添加记录],[删除记录],[修改车号],'
            + '[修改发货单位],[修改收货单位],[修改货名],[修改规格],[修改毛重],'
            + '[修改皮重],[修改扣重],[修改单价],[修改折方系数],[修改过磅费],'
            + '[修改备用1],[修改备用2],[修改备用3],[修改备用4],[修改备用5],'
            + '[修改备用6],[修改备用7],[修改备用8],[修改备用9],[修改备用10],'
            + '[修改备用11],[修改备用12],[修改备用13],[修改备用14],[修改备用15],'
            + '[修改备用16],[修改备用17],[修改备用18],[管理员]) '
            + 'values (:un,:pwd,'
            + ':Premaintain,:Card,:Log,:BackRecord,:PrintTicket,:ModifyTicket,'
            + ':PrintReport,:User,:SystemSet,:FormSet,:ManualInput,:DBSet,'
            + ':DataBackup,:DataImport,:DataExport,:DataClear,:DataInit,'
            + ':MeterSet,:VideoSet,:ReaderSet,:IOSet,:ScreenSet,'
            + ':VoiceSet,:DataQuery,:AddData,:DelData,:Car,'
            + ':FaHuo,:ShouHuo,:Goods,:Spec,:Gross,'
            + ':Tare,:Bundle,:Price,:Scale,:Cost,'
            + ':Backup1,:Backup2,:Backup3,:Backup4,:Backup5,'
            + ':Backup6,:Backup7,:Backup8,:Backup9,:Backup10,'
            + ':Backup11,:Backup12,:Backup13,:Backup14,:Backup15,'
            + ':Backup16,:Backup17,:Backup18,:admin)';
          Parameters.ParamByName('un').Value := ADOQAccess.FieldByName('用户名').AsString;
          Parameters.ParamByName('pwd').Value := ADOQAccess.FieldByName('密码').AsString;
          Parameters.ParamByName('Premaintain').Value := ADOQAccess.FieldByName('预置维护').AsBoolean;
          Parameters.ParamByName('Card').Value := ADOQAccess.FieldByName('卡号管理').AsBoolean;
          Parameters.ParamByName('Log').Value := ADOQAccess.FieldByName('系统日志').AsBoolean;
          Parameters.ParamByName('BackRecord').Value := ADOQAccess.FieldByName('后台记录').AsBoolean;
          Parameters.ParamByName('PrintTicket').Value := ADOQAccess.FieldByName('打印磅单').AsBoolean;
          Parameters.ParamByName('ModifyTicket').Value := ADOQAccess.FieldByName('修改磅单').AsBoolean;
          Parameters.ParamByName('PrintReport').Value := ADOQAccess.FieldByName('打印报表').AsBoolean;
          Parameters.ParamByName('User').Value := ADOQAccess.FieldByName('用户管理').AsBoolean;
          Parameters.ParamByName('SystemSet').Value := ADOQAccess.FieldByName('系统设置').AsBoolean;
          Parameters.ParamByName('FormSet').Value := ADOQAccess.FieldByName('界面配置').AsBoolean;
          Parameters.ParamByName('ManualInput').Value := ADOQAccess.FieldByName('手工重量').AsBoolean;
          Parameters.ParamByName('DBSet').Value := ADOQAccess.FieldByName('数据库设置').AsBoolean;
          Parameters.ParamByName('DataBackup').Value := ADOQAccess.FieldByName('数据备份').AsBoolean;
          Parameters.ParamByName('DataImport').Value := ADOQAccess.FieldByName('数据导入').AsBoolean;
          Parameters.ParamByName('DataExport').Value := ADOQAccess.FieldByName('数据导出').AsBoolean;
          Parameters.ParamByName('DataClear').Value := ADOQAccess.FieldByName('数据清理').AsBoolean;
          Parameters.ParamByName('DataInit').Value := ADOQAccess.FieldByName('数据初始化').AsBoolean;
          Parameters.ParamByName('MeterSet').Value := ADOQAccess.FieldByName('仪表设置').AsBoolean;
          Parameters.ParamByName('VideoSet').Value := ADOQAccess.FieldByName('视频设置').AsBoolean;
          Parameters.ParamByName('ReaderSet').Value := ADOQAccess.FieldByName('读卡器设置').AsBoolean;
          Parameters.ParamByName('IOSet').Value := ADOQAccess.FieldByName('IO模块设置').AsBoolean;
          Parameters.ParamByName('ScreenSet').Value := ADOQAccess.FieldByName('大屏幕设置').AsBoolean;
          Parameters.ParamByName('VoiceSet').Value := ADOQAccess.FieldByName('语音输出').AsBoolean;
          Parameters.ParamByName('DataQuery').Value := ADOQAccess.FieldByName('数据查询').AsBoolean;
          Parameters.ParamByName('AddData').Value := ADOQAccess.FieldByName('添加记录').AsBoolean;
          Parameters.ParamByName('DelData').Value := ADOQAccess.FieldByName('删除记录').AsBoolean;
          Parameters.ParamByName('Car').Value := ADOQAccess.FieldByName('修改车号').AsBoolean;
          Parameters.ParamByName('FaHuo').Value := ADOQAccess.FieldByName('修改发货单位').AsBoolean;
          Parameters.ParamByName('ShouHuo').Value := ADOQAccess.FieldByName('修改收货单位').AsBoolean;
          Parameters.ParamByName('Goods').Value := ADOQAccess.FieldByName('修改货名').AsBoolean;
          Parameters.ParamByName('Spec').Value := ADOQAccess.FieldByName('修改规格').AsBoolean;
          Parameters.ParamByName('Gross').Value := ADOQAccess.FieldByName('修改毛重').AsBoolean;
          Parameters.ParamByName('Tare').Value := ADOQAccess.FieldByName('修改皮重').AsBoolean;
          Parameters.ParamByName('Bundle').Value := ADOQAccess.FieldByName('修改扣重').AsBoolean;
          Parameters.ParamByName('Price').Value := ADOQAccess.FieldByName('修改单价').AsBoolean;
          Parameters.ParamByName('Scale').Value := ADOQAccess.FieldByName('修改折方系数').AsBoolean;
          Parameters.ParamByName('Cost').Value := ADOQAccess.FieldByName('修改过磅费').AsBoolean;
          Parameters.ParamByName('Backup1').Value := ADOQAccess.FieldByName('修改备用1').AsBoolean;
          Parameters.ParamByName('Backup2').Value := ADOQAccess.FieldByName('修改备用2').AsBoolean;
          Parameters.ParamByName('Backup3').Value := ADOQAccess.FieldByName('修改备用3').AsBoolean;
          Parameters.ParamByName('Backup4').Value := ADOQAccess.FieldByName('修改备用4').AsBoolean;
          Parameters.ParamByName('Backup5').Value := ADOQAccess.FieldByName('修改备用5').AsBoolean;
          Parameters.ParamByName('Backup6').Value := ADOQAccess.FieldByName('修改备用6').AsBoolean;
          Parameters.ParamByName('Backup7').Value := ADOQAccess.FieldByName('修改备用7').AsBoolean;
          Parameters.ParamByName('Backup8').Value := ADOQAccess.FieldByName('修改备用8').AsBoolean;
          Parameters.ParamByName('Backup9').Value := ADOQAccess.FieldByName('修改备用9').AsBoolean;
          Parameters.ParamByName('Backup10').Value := ADOQAccess.FieldByName('修改备用10').AsBoolean;
          Parameters.ParamByName('Backup11').Value := ADOQAccess.FieldByName('修改备用11').AsBoolean;
          Parameters.ParamByName('Backup12').Value := ADOQAccess.FieldByName('修改备用12').AsBoolean;
          Parameters.ParamByName('Backup13').Value := ADOQAccess.FieldByName('修改备用13').AsBoolean;
          Parameters.ParamByName('Backup14').Value := ADOQAccess.FieldByName('修改备用14').AsBoolean;
          Parameters.ParamByName('Backup15').Value := ADOQAccess.FieldByName('修改备用15').AsBoolean;
          Parameters.ParamByName('Backup16').Value := ADOQAccess.FieldByName('修改备用16').AsBoolean;
          Parameters.ParamByName('Backup17').Value := ADOQAccess.FieldByName('修改备用17').AsBoolean;
          Parameters.ParamByName('Backup18').Value := ADOQAccess.FieldByName('修改备用18').AsBoolean;
          Parameters.ParamByName('admin').Value := ADOQAccess.FieldByName('管理员').AsBoolean;
          try
            ExecSQL;
          except
          end;
        end;
        Next;
      end;
    end;
  end;
end;

function TDataMigrateForm.copyWeightImg: Boolean;
begin
  with ADOQAccess do
  begin
    Close;
    SQL.Text := 'select * from TBL_WEIGHT_IMG';
    Open;
    if not IsEmpty then
    begin
      First;
      while not Eof do
      begin
        with ADOQSQL do
        begin
          Close;
          SQL.Text := 'insert into TBL_WEIGHT_IMG(WEIGHT_ID,GROSS_IMG1,GROSS_IMG2,GROSS_IMG3,GROSS_IMG4,'
            + 'TARE_IMG1,TARE_IMG2,TARE_IMG3,TARE_IMG4) values (:WEIGHT_ID,:GROSS_IMG1,:GROSS_IMG2,:GROSS_IMG3,:GROSS_IMG4,'
            + ':TARE_IMG1,:TARE_IMG2,:TARE_IMG3,:TARE_IMG4)';
          Parameters.ParamByName('WEIGHT_ID').Value := ADOQAccess.FieldByName('WEIGHT_ID').AsString;
          TBlobField(ADOQAccess.FieldByName('GROSS_IMG1')).SaveToFile(ExtractFilePath(ParamStr(0)) + 'tP0.jpg');
          TBlobField(ADOQAccess.FieldByName('GROSS_IMG2')).SaveToFile(ExtractFilePath(ParamStr(0)) + 'tP1.jpg');
          TBlobField(ADOQAccess.FieldByName('GROSS_IMG3')).SaveToFile(ExtractFilePath(ParamStr(0)) + 'tP2.jpg');
          TBlobField(ADOQAccess.FieldByName('GROSS_IMG4')).SaveToFile(ExtractFilePath(ParamStr(0)) + 'tP3.jpg');
          TBlobField(ADOQAccess.FieldByName('TARE_IMG1')).SaveToFile(ExtractFilePath(ParamStr(0)) + 'tP4.jpg');
          TBlobField(ADOQAccess.FieldByName('TARE_IMG2')).SaveToFile(ExtractFilePath(ParamStr(0)) + 'tP5.jpg');
          TBlobField(ADOQAccess.FieldByName('TARE_IMG3')).SaveToFile(ExtractFilePath(ParamStr(0)) + 'tP6.jpg');
          TBlobField(ADOQAccess.FieldByName('TARE_IMG4')).SaveToFile(ExtractFilePath(ParamStr(0)) + 'tP7.jpg');

          Parameters.ParamByName('GROSS_IMG1').LoadFromFile(ExtractFilePath(ParamStr(0)) + 'tP0.jpg', ftBlob);
          Parameters.ParamByName('GROSS_IMG2').LoadFromFile(ExtractFilePath(ParamStr(0)) + 'tP1.jpg', ftBlob);
          Parameters.ParamByName('GROSS_IMG3').LoadFromFile(ExtractFilePath(ParamStr(0)) + 'tP2.jpg', ftBlob);
          Parameters.ParamByName('GROSS_IMG4').LoadFromFile(ExtractFilePath(ParamStr(0)) + 'tP3.jpg', ftBlob);
          Parameters.ParamByName('TARE_IMG1').LoadFromFile(ExtractFilePath(ParamStr(0)) + 'tP4.jpg', ftBlob);
          Parameters.ParamByName('TARE_IMG2').LoadFromFile(ExtractFilePath(ParamStr(0)) + 'tP5.jpg', ftBlob);
          Parameters.ParamByName('TARE_IMG3').LoadFromFile(ExtractFilePath(ParamStr(0)) + 'tP6.jpg', ftBlob);
          Parameters.ParamByName('TARE_IMG4').LoadFromFile(ExtractFilePath(ParamStr(0)) + 'tP7.jpg', ftBlob);
          ExecSQL;
        end;
        Next;
      end;
    end;
  end;
end;

function TDataMigrateForm.copyWeightInfo: Boolean;
begin
  with ADOQAccess do
  begin
    Close;
    SQL.Text := 'select * from 称重信息';
    Open;
    if not IsEmpty then
    begin
      First;
      while not Eof do
      begin
        with ADOQSQL do
        begin
          Close;
          SQL.Text := 'insert into 称重信息(流水号,车号,过磅类型,发货单位,收货单位,'
            + '货名,规格,毛重,皮重,净重,'
            + '扣重,实重,单价,金额,折方系数,'
            + '方量,过磅费,毛重司磅员,皮重司磅员,毛重磅号,'
            + '皮重磅号,毛重时间,皮重时间,一次过磅时间,二次过磅时间,'
            + '更新人,更新时间,备注,打印次数,上传否,'
            + '备用1,备用2,备用3,备用4,备用5,'
            + '备用6,备用7,备用8,备用9,备用10,'
            + '备用11,备用12,备用13,备用14,备用15,'
            + '备用16,备用17,备用18) '
            + 'values (:glideNo,:car,:weightType,:faHuo,:shouHuo,'
            + ':goods,:spec,:gross,:tare,:net,'
            + ':bundle,:real,:price,:sum,:scale,'
            + ':quanter,:cost,:grossMan,:tareMan,:grossAddr,'
            + ':tareAddr,:grossTime,:tareTime,:firstTime,:secondTime,'
            + ':updateUser,:updateTime,:memo,:printCount,:upload,'
            + ':backup1,:backup2,:backup3,:backup4,:backup5,'
            + ':backup6,:backup7,:backup8,:backup9,:backup10,'
            + ':backup11,:backup12,:backup13,:backup14,'
            + ':backup15,:backup16,:backup17,:backup18)';
          Parameters.ParamByName('glideNo').Value := ADOQAccess.FieldByName('流水号').AsString;
          Parameters.ParamByName('car').Value := ADOQAccess.FieldByName('车号').AsString;
          Parameters.ParamByName('weightType').Value := ADOQAccess.FieldByName('过磅类型').AsString;
          Parameters.ParamByName('faHuo').Value := ADOQAccess.FieldByName('发货单位').AsString;
          Parameters.ParamByName('shouHuo').Value := ADOQAccess.FieldByName('收货单位').AsString;
          Parameters.ParamByName('goods').Value := ADOQAccess.FieldByName('货名').AsString;
          Parameters.ParamByName('spec').Value := ADOQAccess.FieldByName('规格').AsString;
          Parameters.ParamByName('gross').Value := ADOQAccess.FieldByName('毛重').AsFloat;
          Parameters.ParamByName('tare').Value := ADOQAccess.FieldByName('皮重').AsFloat;
          Parameters.ParamByName('net').Value := ADOQAccess.FieldByName('净重').AsFloat;
          Parameters.ParamByName('bundle').Value := ADOQAccess.FieldByName('扣重').AsFloat;
          Parameters.ParamByName('real').Value := ADOQAccess.FieldByName('实重').AsFloat;
          Parameters.ParamByName('price').Value := ADOQAccess.FieldByName('单价').AsFloat;
          Parameters.ParamByName('sum').Value := ADOQAccess.FieldByName('金额').AsFloat;
          Parameters.ParamByName('scale').Value := ADOQAccess.FieldByName('折方系数').AsFloat;
          Parameters.ParamByName('quanter').Value := ADOQAccess.FieldByName('方量').AsFloat;
          Parameters.ParamByName('cost').Value := ADOQAccess.FieldByName('过磅费').AsFloat;
          Parameters.ParamByName('grossMan').Value := ADOQAccess.FieldByName('毛重司磅员').AsString;
          Parameters.ParamByName('tareMan').Value := ADOQAccess.FieldByName('皮重司磅员').AsString;
          Parameters.ParamByName('grossAddr').Value := ADOQAccess.FieldByName('毛重磅号').AsString;
          Parameters.ParamByName('tareAddr').Value := ADOQAccess.FieldByName('皮重磅号').AsString;

          if ADOQAccess.FieldByName('毛重时间').IsNull then
            Parameters.ParamByName('grossTime').Value := null
          else
            Parameters.ParamByName('grossTime').Value := ADOQAccess.FieldByName('毛重时间').AsDateTime;
          if ADOQAccess.FieldByName('皮重时间').IsNull then
            Parameters.ParamByName('tareTime').Value := null
          else
            Parameters.ParamByName('tareTime').Value := ADOQAccess.FieldByName('皮重时间').AsDateTime;
          if ADOQAccess.FieldByName('一次过磅时间').IsNull then
            Parameters.ParamByName('firstTime').Value := null
          else
            Parameters.ParamByName('firstTime').Value := ADOQAccess.FieldByName('一次过磅时间').AsDateTime;
          if ADOQAccess.FieldByName('二次过磅时间').IsNull then
            Parameters.ParamByName('secondTime').Value := null
          else
            Parameters.ParamByName('secondTime').Value := ADOQAccess.FieldByName('二次过磅时间').AsDateTime;

          Parameters.ParamByName('updateUser').Value := ADOQAccess.FieldByName('更新人').AsString;

          if ADOQAccess.FieldByName('更新时间').IsNull then
            Parameters.ParamByName('updateTime').Value := null
          else
            Parameters.ParamByName('updateTime').Value := ADOQAccess.FieldByName('更新时间').AsDateTime;

          Parameters.ParamByName('memo').Value := ADOQAccess.FieldByName('备注').AsString;
          Parameters.ParamByName('printCount').Value := ADOQAccess.FieldByName('打印次数').AsInteger;
          Parameters.ParamByName('upload').Value := ADOQAccess.FieldByName('上传否').AsBoolean;
          Parameters.ParamByName('backup1').Value := ADOQAccess.FieldByName('备用1').AsString;
          Parameters.ParamByName('backup2').Value := ADOQAccess.FieldByName('备用2').AsString;
          Parameters.ParamByName('backup3').Value := ADOQAccess.FieldByName('备用3').AsString;
          Parameters.ParamByName('backup4').Value := ADOQAccess.FieldByName('备用4').AsString;
          Parameters.ParamByName('backup5').Value := ADOQAccess.FieldByName('备用5').AsString;
          Parameters.ParamByName('backup6').Value := ADOQAccess.FieldByName('备用6').AsFloat;
          Parameters.ParamByName('backup7').Value := ADOQAccess.FieldByName('备用7').AsFloat;
          Parameters.ParamByName('backup8').Value := ADOQAccess.FieldByName('备用8').AsFloat;
          Parameters.ParamByName('backup9').Value := ADOQAccess.FieldByName('备用9').AsFloat;
          Parameters.ParamByName('backup10').Value := ADOQAccess.FieldByName('备用10').AsString;
          Parameters.ParamByName('backup11').Value := ADOQAccess.FieldByName('备用11').AsString;
          Parameters.ParamByName('backup12').Value := ADOQAccess.FieldByName('备用12').AsString;
          Parameters.ParamByName('backup13').Value := ADOQAccess.FieldByName('备用13').AsString;
          Parameters.ParamByName('backup14').Value := ADOQAccess.FieldByName('备用14').AsString;
          Parameters.ParamByName('backup15').Value := ADOQAccess.FieldByName('备用15').AsFloat;
          Parameters.ParamByName('backup16').Value := ADOQAccess.FieldByName('备用16').AsFloat;
          Parameters.ParamByName('backup17').Value := ADOQAccess.FieldByName('备用17').AsFloat;
          Parameters.ParamByName('backup18').Value := ADOQAccess.FieldByName('备用18').AsFloat;
          try
            ExecSQL;
          except
          end;
        end;
        Next;
      end;
    end;
  end;
end;

procedure TDataMigrateForm.FormShow(Sender: TObject);
begin
  ADOQAccess.Connection := ADOCAccess;
  ADOQSQL.Connection := ADOCSQL;
end;

end.

