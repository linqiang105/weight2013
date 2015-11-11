unit UserPurview;

interface

uses
  Classes, Controls, Forms, StdCtrls, Windows,
  ExtCtrls, DBGridEh, Dialogs, GridsEh, ToolCtrlsEh,
  DBGridEhToolCtrls, DBAxisGridsEh, DBGridEhGrouping;

type
  TUserPurviewForm = class(TForm)
    DBGridEhUser: TDBGridEh;
    PTop: TPanel;
    PUser: TPanel;
    PAttrib: TPanel;
    GBLegal: TGroupBox;
    Label2: TLabel;
    EdtUser: TEdit;
    GBWeightData: TGroupBox;
    CBAddData: TCheckBox;
    CBModData: TCheckBox;
    CBDelData: TCheckBox;
    GBModify: TGroupBox;
    CBCar: TCheckBox;
    CBTare: TCheckBox;
    CBFaHuo: TCheckBox;
    CBBundle: TCheckBox;
    CBShouHuo: TCheckBox;
    CBPrice: TCheckBox;
    CBGoods: TCheckBox;
    CBScale: TCheckBox;
    CBSpec: TCheckBox;
    CBGross: TCheckBox;
    CBCost: TCheckBox;
    CBBackup6: TCheckBox;
    CBBackup1: TCheckBox;
    CBBackup7: TCheckBox;
    CBBackup2: TCheckBox;
    CBBackup8: TCheckBox;
    CBBackup3: TCheckBox;
    CBBackup9: TCheckBox;
    CBBackup4: TCheckBox;
    CBBackup5: TCheckBox;
    CBBackup15: TCheckBox;
    CBBackup10: TCheckBox;
    CBBackup16: TCheckBox;
    CBBackup11: TCheckBox;
    CBBackup17: TCheckBox;
    CBBackup12: TCheckBox;
    CBBackup18: TCheckBox;
    CBBackup13: TCheckBox;
    CBBackup14: TCheckBox;
    CBDataQuery: TCheckBox;
    GBEqua: TGroupBox;
    CBMeterSet: TCheckBox;
    CBVideoSet: TCheckBox;
    CBReaderSet: TCheckBox;
    CBIOSet: TCheckBox;
    CBScreenSet: TCheckBox;
    CBVoiceSet: TCheckBox;
    GBDatabase: TGroupBox;
    CBDataExport: TCheckBox;
    CBDataBackup: TCheckBox;
    CBDBSet: TCheckBox;
    CBDataClear: TCheckBox;
    CBDataInit: TCheckBox;
    GBSystem: TGroupBox;
    CBUser: TCheckBox;
    CBManualInput: TCheckBox;
    CBSystemSet: TCheckBox;
    CBFormSet: TCheckBox;
    GBData: TGroupBox;
    CBPrintReport: TCheckBox;
    CBModifyTicket: TCheckBox;
    CBPremaintain: TCheckBox;
    CBPrintTicket: TCheckBox;
    CBCard: TCheckBox;
    CBLog: TCheckBox;
    CBBackRecord: TCheckBox;
    CBDataImport: TCheckBox;
    BtnMod: TButton;
    BtnAdd: TButton;
    BtnCancel: TButton;
    BtnDel: TButton;
    BtnRefresh: TButton;
    BtnSave: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridEhUserCellClick(Column: TColumnEh);
    procedure BtnAddClick(Sender: TObject);
    procedure BtnModClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure BtnDelClick(Sender: TObject);
    procedure BtnRefreshClick(Sender: TObject);
    procedure CBModDataClick(Sender: TObject);
  private
    { Private declarations }
    User: string; //所点击的用户
    InsertOrModify: boolean; //为0时代表插入,为1时代表修改
    Admin: boolean; //是管理员
  public
    { Public declarations }
    //flag为0,则为初始未插入或修改状态时的各按钮状态;
    //为1则为点击插入或修改状态后的各个按钮的状态
    procedure SetBtnStatus(Flag: boolean);
    function getModCheck(): Boolean;
  end;

var
  UserPurviewForm: TUserPurviewForm;

implementation

uses QueryDM, Main, CommonUtil;
{$R *.dfm}

procedure TUserPurviewForm.SetBtnStatus(Flag: boolean);
begin
  BtnAdd.Enabled := not Flag;
  BtnMod.Enabled := not Flag;
  BtnSave.Enabled := Flag;
  BtnCancel.Enabled := Flag;
  EdtUser.Enabled := Flag;
  GBLegal.Enabled := Flag;
  DBGridEhUser.Enabled := not Flag;
end;

procedure TUserPurviewForm.FormShow(Sender: TObject);
begin
  with QueryDataModule.ADOQUser do
  begin
    Close;
    SQL.Text := 'select * from 用户信息';
    Open;
    RecordSet.Properties.Get_Item('Update Criteria').Value := 0
  end;
  DBGridEhUser.DataSource := QueryDataModule.DSUser;
end;

procedure TUserPurviewForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DBGridEhUser.DataSource := nil;
end;

procedure TUserPurviewForm.DBGridEhUserCellClick(Column: TColumnEh);
begin
  with QueryDataModule.ADOQUser do
  begin
    User := FieldByName('用户名').AsString;
    EdtUser.Text := User;

    CBPremaintain.Checked := FieldByName('预置维护').AsBoolean;
    CBCard.Checked := FieldByName('卡号管理').AsBoolean;
    CBLog.Checked := FieldByName('系统日志').AsBoolean;
    CBBackRecord.Checked := FieldByName('后台记录').AsBoolean;
    CBPrintTicket.Checked := FieldByName('打印磅单').AsBoolean;
    CBModifyTicket.Checked := FieldByName('修改磅单').AsBoolean;
    CBPrintReport.Checked := FieldByName('打印报表').AsBoolean;

    CBUser.Checked := FieldByName('用户管理').AsBoolean;
    CBSystemSet.Checked := FieldByName('系统设置').AsBoolean;
    CBFormSet.Checked := FieldByName('界面配置').AsBoolean;
    CBManualInput.Checked := FieldByName('手工重量').AsBoolean;

    CBDBSet.Checked := FieldByName('数据库设置').AsBoolean;
    CBDataBackup.Checked := FieldByName('数据备份').AsBoolean;
    CBDataImport.Checked := FieldByName('数据导入').AsBoolean;
    CBDataExport.Checked := FieldByName('数据导出').AsBoolean;
    CBDataClear.Checked := FieldByName('数据清理').AsBoolean;
    CBDataInit.Checked := FieldByName('数据初始化').AsBoolean;

    CBMeterSet.Checked := FieldByName('仪表设置').AsBoolean;
    CBVideoSet.Checked := FieldByName('视频设置').AsBoolean;
    CBReaderSet.Checked := FieldByName('读卡器设置').AsBoolean;
    CBIOSet.Checked := FieldByName('IO模块设置').AsBoolean;
    CBScreenSet.Checked := FieldByName('大屏幕设置').AsBoolean;
    CBVoiceSet.Checked := FieldByName('语音输出').AsBoolean;

    CBDataQuery.Checked := FieldByName('数据查询').AsBoolean;
    CBAddData.Checked := FieldByName('添加记录').AsBoolean;
    CBDelData.Checked := FieldByName('删除记录').AsBoolean;

    CBCar.Checked := FieldByName('修改车号').AsBoolean;
    CBFaHuo.Checked := FieldByName('修改发货单位').AsBoolean;
    CBShouHuo.Checked := FieldByName('修改收货单位').AsBoolean;
    CBGoods.Checked := FieldByName('修改货名').AsBoolean;
    CBSpec.Checked := FieldByName('修改规格').AsBoolean;
    CBGross.Checked := FieldByName('修改毛重').AsBoolean;
    CBTare.Checked := FieldByName('修改皮重').AsBoolean;
    CBBundle.Checked := FieldByName('修改扣重').AsBoolean;
    CBPrice.Checked := FieldByName('修改单价').AsBoolean;
    CBScale.Checked := FieldByName('修改折方系数').AsBoolean;
    CBCost.Checked := FieldByName('修改过磅费').AsBoolean;
    CBBackup1.Checked := FieldByName('修改备用1').AsBoolean;
    CBBackup2.Checked := FieldByName('修改备用2').AsBoolean;
    CBBackup3.Checked := FieldByName('修改备用3').AsBoolean;
    CBBackup4.Checked := FieldByName('修改备用4').AsBoolean;
    CBBackup5.Checked := FieldByName('修改备用5').AsBoolean;
    CBBackup6.Checked := FieldByName('修改备用6').AsBoolean;
    CBBackup7.Checked := FieldByName('修改备用7').AsBoolean;
    CBBackup8.Checked := FieldByName('修改备用8').AsBoolean;
    CBBackup9.Checked := FieldByName('修改备用9').AsBoolean;
    CBBackup10.Checked := FieldByName('修改备用10').AsBoolean;
    CBBackup11.Checked := FieldByName('修改备用11').AsBoolean;
    CBBackup12.Checked := FieldByName('修改备用12').AsBoolean;
    CBBackup13.Checked := FieldByName('修改备用13').AsBoolean;
    CBBackup14.Checked := FieldByName('修改备用14').AsBoolean;
    CBBackup15.Checked := FieldByName('修改备用15').AsBoolean;
    CBBackup16.Checked := FieldByName('修改备用16').AsBoolean;
    CBBackup17.Checked := FieldByName('修改备用17').AsBoolean;
    CBBackup18.Checked := FieldByName('修改备用18').AsBoolean;

    //CBModData.Checked := getModCheck;

    Admin := FieldByName('管理员').AsBoolean
  end
end;

procedure TUserPurviewForm.BtnAddClick(Sender: TObject);
var i: Integer;
begin
  SetBtnStatus(True);

  EdtUser.Clear; //可以填用户名和密码

  //权限全变为无
  for i := 0 to GBData.ControlCount - 1 do
  begin
    if (GBData.Controls[i] is TCheckBox) then
      (GBData.Controls[i] as TCheckBox).Checked := False;
  end;
  for i := 0 to GBSystem.ControlCount - 1 do
  begin
    if (GBSystem.Controls[i] is TCheckBox) then
      (GBSystem.Controls[i] as TCheckBox).Checked := False;
  end;
  for i := 0 to GBDatabase.ControlCount - 1 do
  begin
    if (GBDatabase.Controls[i] is TCheckBox) then
      (GBDatabase.Controls[i] as TCheckBox).Checked := False;
  end;
  for i := 0 to GBEqua.ControlCount - 1 do
  begin
    if (GBEqua.Controls[i] is TCheckBox) then
      (GBEqua.Controls[i] as TCheckBox).Checked := False;
  end;
  for i := 0 to GBWeightData.ControlCount - 1 do
  begin
    if (GBWeightData.Controls[i] is TCheckBox) then
      (GBWeightData.Controls[i] as TCheckBox).Checked := False;
  end;
  for i := 0 to GBModify.ControlCount - 1 do
  begin
    if (GBModify.Controls[i] is TCheckBox) then
      (GBModify.Controls[i] as TCheckBox).Checked := False;
  end;

  EdtUser.SetFocus;
  InsertOrModify := False; //插入状态
end;

procedure TUserPurviewForm.BtnModClick(Sender: TObject);
begin
  if EdtUser.Text = '' then
    Exit;
  SetBtnStatus(True);
  EdtUser.SetFocus;
  InsertOrModify := True; //修改状态
end;

procedure TUserPurviewForm.BtnCancelClick(Sender: TObject);
begin
  SetBtnStatus(False);
end;

procedure TUserPurviewForm.BtnSaveClick(Sender: TObject);
begin
  //进行数据库的修改
  if EdtUser.Text = '' then
    Exit;
  with QueryDataModule.ADOQUser do
  begin
    if InsertOrModify then //修改状态
    begin
      Edit;
      FieldByName('用户名').AsString := EdtUser.Text;
      FieldByName('管理员').AsBoolean := Admin;
    end
    else
    begin
      //插入状态
      Insert;
      FieldByName('用户名').AsString := EdtUser.Text;
      FieldByName('密码').AsString := TCommonUtil.Md5('123');
      FieldByName('管理员').AsBoolean := False;
    end;
    FieldByName('预置维护').AsBoolean := CBPremaintain.Checked;
    FieldByName('卡号管理').AsBoolean := CBCard.Checked;
    FieldByName('系统日志').AsBoolean := CBLog.Checked;
    FieldByName('后台记录').AsBoolean := CBBackRecord.Checked;
    FieldByName('打印磅单').AsBoolean := CBPrintTicket.Checked;
    FieldByName('修改磅单').AsBoolean := CBModifyTicket.Checked;
    FieldByName('打印报表').AsBoolean := CBPrintReport.Checked;

    FieldByName('用户管理').AsBoolean := CBUser.Checked;
    FieldByName('系统设置').AsBoolean := CBSystemSet.Checked;
    FieldByName('界面配置').AsBoolean := CBFormSet.Checked;
    FieldByName('手工重量').AsBoolean := CBManualInput.Checked;

    FieldByName('数据库设置').AsBoolean := CBDBSet.Checked;
    FieldByName('数据备份').AsBoolean := CBDataBackup.Checked;
    FieldByName('数据导入').AsBoolean := CBDataImport.Checked;
    FieldByName('数据导出').AsBoolean := CBDataExport.Checked;
    FieldByName('数据清理').AsBoolean := CBDataClear.Checked;
    FieldByName('数据初始化').AsBoolean := CBDataInit.Checked;

    FieldByName('仪表设置').AsBoolean := CBMeterSet.Checked;
    FieldByName('视频设置').AsBoolean := CBVideoSet.Checked;
    FieldByName('读卡器设置').AsBoolean := CBReaderSet.Checked;
    FieldByName('IO模块设置').AsBoolean := CBIOSet.Checked;
    FieldByName('大屏幕设置').AsBoolean := CBScreenSet.Checked;
    FieldByName('语音输出').AsBoolean := CBVoiceSet.Checked;

    FieldByName('数据查询').AsBoolean := CBDataQuery.Checked;
    FieldByName('添加记录').AsBoolean := CBAddData.Checked;
    FieldByName('删除记录').AsBoolean := CBDelData.Checked;

    FieldByName('修改车号').AsBoolean := CBCar.Checked;
    FieldByName('修改发货单位').AsBoolean := CBFaHuo.Checked;
    FieldByName('修改收货单位').AsBoolean := CBShouHuo.Checked;
    FieldByName('修改货名').AsBoolean := CBGoods.Checked;
    FieldByName('修改规格').AsBoolean := CBSpec.Checked;
    FieldByName('修改毛重').AsBoolean := CBGross.Checked;
    FieldByName('修改皮重').AsBoolean := CBTare.Checked;
    FieldByName('修改扣重').AsBoolean := CBBundle.Checked;
    FieldByName('修改单价').AsBoolean := CBPrice.Checked;
    FieldByName('修改折方系数').AsBoolean := CBScale.Checked;
    FieldByName('修改过磅费').AsBoolean := CBCost.Checked;
    FieldByName('修改备用1').AsBoolean := CBBackup1.Checked;
    FieldByName('修改备用2').AsBoolean := CBBackup2.Checked;
    FieldByName('修改备用3').AsBoolean := CBBackup3.Checked;
    FieldByName('修改备用4').AsBoolean := CBBackup4.Checked;
    FieldByName('修改备用5').AsBoolean := CBBackup5.Checked;
    FieldByName('修改备用6').AsBoolean := CBBackup6.Checked;
    FieldByName('修改备用7').AsBoolean := CBBackup7.Checked;
    FieldByName('修改备用8').AsBoolean := CBBackup8.Checked;
    FieldByName('修改备用9').AsBoolean := CBBackup9.Checked;
    FieldByName('修改备用10').AsBoolean := CBBackup10.Checked;
    FieldByName('修改备用11').AsBoolean := CBBackup11.Checked;
    FieldByName('修改备用12').AsBoolean := CBBackup12.Checked;
    FieldByName('修改备用13').AsBoolean := CBBackup13.Checked;
    FieldByName('修改备用14').AsBoolean := CBBackup14.Checked;
    FieldByName('修改备用15').AsBoolean := CBBackup15.Checked;
    FieldByName('修改备用16').AsBoolean := CBBackup16.Checked;
    FieldByName('修改备用17').AsBoolean := CBBackup17.Checked;
    FieldByName('修改备用18').AsBoolean := CBBackup18.Checked;
    if InsertOrModify then
    begin
      if Admin then //是管理员的话,则用户管理权限为真
        FieldByName('用户管理').AsBoolean := True;
    end;
    Post;
    if InsertOrModify then
    begin
      if User = MainForm.CurrentUser then //修改的用户是当前的用户,则主界面上的用户名也要更改
        MainForm.CurrentUser := EdtUser.Text;
    end
    else
    begin
      MessageBox(0, '新增用户成功！默认密码为123', '提示', MB_OK +
        MB_ICONINFORMATION + MB_TOPMOST);
    end;
  end;
  SetBtnStatus(False);
end;

procedure TUserPurviewForm.BtnDelClick(Sender: TObject);
begin
  if (EdtUser.Text = '') or Admin then //是管理员则不能删除
    Exit;
  if MessageDlg('你确定要删除这条记录 ?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk then
    DBGridEhUser.DataSource.DataSet.Delete;
end;

procedure TUserPurviewForm.BtnRefreshClick(Sender: TObject);
begin
  DBGridEhUser.DataSource.DataSet.Refresh;
end;

procedure TUserPurviewForm.CBModDataClick(Sender: TObject);
var i: Integer;
begin
  for i := 0 to GBModify.ControlCount - 1 do
  begin
    if (GBModify.Controls[i] is TCheckBox) then
      (GBModify.Controls[i] as TCheckBox).Checked := CBModData.Checked;
  end;
end;

function TUserPurviewForm.getModCheck: Boolean;
var i: Integer;
  r: Boolean;
begin
  r := True;
  for i := 0 to GBModify.ControlCount - 1 do
  begin
    if (GBModify.Controls[i] is TCheckBox) then
      r := r and (GBModify.Controls[i] as TCheckBox).Checked;
  end;
  Result := r;
end;

end.
d.

