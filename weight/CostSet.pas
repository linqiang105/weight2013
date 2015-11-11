unit CostSet;

interface

uses
  Classes, Controls, Forms, ExtCtrls, StdCtrls,
  Buttons, SysUtils, inifiles;

type
  TCostSetForm = class(TForm)
    PBack: TPanel;
    BitBtnOK: TBitBtn;
    BitBtnCancel: TBitBtn;
    GBStandard: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    EdtGrade11: TEdit;
    EdtGrade12: TEdit;
    EdtCost1: TEdit;
    Label12: TLabel;
    EdtGrade21: TEdit;
    EdtGrade22: TEdit;
    EdtCost2: TEdit;
    Label10: TLabel;
    EdtGrade31: TEdit;
    EdtGrade32: TEdit;
    EdtCost3: TEdit;
    Label11: TLabel;
    EdtGrade41: TEdit;
    EdtGrade42: TEdit;
    EdtCost4: TEdit;
    Label13: TLabel;
    EdtGrade51: TEdit;
    EdtGrade52: TEdit;
    EdtCost5: TEdit;
    Label14: TLabel;
    EdtGrade61: TEdit;
    EdtGrade62: TEdit;
    EdtCost6: TEdit;
    Label15: TLabel;
    EdtGrade71: TEdit;
    EdtGrade72: TEdit;
    EdtCost7: TEdit;
    Label16: TLabel;
    EdtGrade81: TEdit;
    EdtGrade82: TEdit;
    EdtCost8: TEdit;
    Label17: TLabel;
    EdtGrade91: TEdit;
    EdtGrade92: TEdit;
    EdtCost9: TEdit;
    Label18: TLabel;
    EdtGrade101: TEdit;
    EdtGrade102: TEdit;
    EdtCost10: TEdit;
    Label19: TLabel;
    EdtGrade111: TEdit;
    EdtGrade112: TEdit;
    EdtCost11: TEdit;
    Label20: TLabel;
    EdtGrade121: TEdit;
    EdtGrade122: TEdit;
    EdtCost12: TEdit;
    Label21: TLabel;
    EdtGrade131: TEdit;
    EdtGrade132: TEdit;
    EdtCost13: TEdit;
    Label22: TLabel;
    RBChargeType2: TRadioButton;
    CBManualInput: TCheckBox;
    LEPoint: TLabeledEdit;
    CBUseCost: TCheckBox;
    GBRange: TGroupBox;
    lblStart: TLabel;
    lblEnd: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EdtPound1: TEdit;
    EdtPound2: TEdit;
    EdtPound3: TEdit;
    EdtPound4: TEdit;
    EdtPound5: TEdit;
    EdtPound6: TEdit;
    EdtInitial: TLabeledEdit;
    EdtUnit1: TLabeledEdit;
    EdtUnit2: TLabeledEdit;
    CBCostType: TComboBox;
    RBChargeType1: TRadioButton;
    CBLadder: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure BitBtnOKClick(Sender: TObject);
    procedure BitBtnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function loadCostSet(): Boolean;
    function saveCostSet(): Boolean;
  end;

var
  CostSetForm: TCostSetForm;

implementation

uses Main;

{$R *.dfm}

{ TCostSetForm }

function TCostSetForm.loadCostSet: Boolean;
var myini: TIniFile;
begin
  myini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'setup.ini');
  try

    CBUseCost.Checked := myini.ReadBool('cost_set', 'useCost', False);
    EdtInitial.Text := myini.ReadString('cost_set', 'initCost', '5');
    EdtUnit1.Text := myini.ReadString('cost_set', 'unitCost1', '1');
    EdtUnit2.Text := myini.ReadString('cost_set', 'unitCost2', '1.5');
    CBManualInput.Checked := myini.ReadBool('cost_set', 'manualInputCost', False);
    EdtPound1.Text := myini.ReadString('cost_set', 'grade1', '0');
    EdtPound2.Text := myini.ReadString('cost_set', 'grade2', '10000');
    EdtPound3.Text := myini.ReadString('cost_set', 'grade3', '10000');
    EdtPound4.Text := myini.ReadString('cost_set', 'grade4', '100000');
    EdtPound5.Text := myini.ReadString('cost_set', 'grade5', '100000');
    EdtPound6.Text := myini.ReadString('cost_set', 'grade6', '120000');
    CBLadder.Checked := myini.ReadBool('cost_set', 'ladder', False);
    case myini.ReadInteger('cost_set', 'chargeType', 0) of
      0: RBChargeType1.Checked := True;
      1: RBChargeType2.Checked := True;
    else
      RBChargeType1.Checked := True;
    end;
    CBCostType.ItemIndex := myini.ReadInteger('cost_set', 'costType', 0);
    LEPoint.Text := myini.ReadString('cost_set', 'point', '0');

    EdtGrade11.Text := myini.ReadString('cost_set', 'grade11', '0');
    EdtGrade12.Text := myini.ReadString('cost_set', 'grade12', '10000');
    EdtGrade21.Text := myini.ReadString('cost_set', 'grade21', '10000');
    EdtGrade22.Text := myini.ReadString('cost_set', 'grade22', '23000');
    EdtGrade31.Text := myini.ReadString('cost_set', 'grade31', '23000');
    EdtGrade32.Text := myini.ReadString('cost_set', 'grade32', '30000');
    EdtGrade41.Text := myini.ReadString('cost_set', 'grade41', '30000');
    EdtGrade42.Text := myini.ReadString('cost_set', 'grade42', '40000');
    EdtGrade51.Text := myini.ReadString('cost_set', 'grade51', '40000');
    EdtGrade52.Text := myini.ReadString('cost_set', 'grade52', '50000');
    EdtGrade61.Text := myini.ReadString('cost_set', 'grade61', '50000');
    EdtGrade62.Text := myini.ReadString('cost_set', 'grade62', '60000');
    EdtGrade71.Text := myini.ReadString('cost_set', 'grade71', '60000');
    EdtGrade72.Text := myini.ReadString('cost_set', 'grade72', '70000');
    EdtGrade81.Text := myini.ReadString('cost_set', 'grade81', '70000');
    EdtGrade82.Text := myini.ReadString('cost_set', 'grade82', '80000');
    EdtGrade91.Text := myini.ReadString('cost_set', 'grade91', '80000');
    EdtGrade92.Text := myini.ReadString('cost_set', 'grade92', '90000');
    EdtGrade101.Text := myini.ReadString('cost_set', 'grade101', '90000');
    EdtGrade102.Text := myini.ReadString('cost_set', 'grade102', '100000');
    EdtGrade111.Text := myini.ReadString('cost_set', 'grade111', '100000');
    EdtGrade112.Text := myini.ReadString('cost_set', 'grade112', '110000');
    EdtGrade121.Text := myini.ReadString('cost_set', 'grade121', '110000');
    EdtGrade122.Text := myini.ReadString('cost_set', 'grade122', '120000');
    EdtGrade131.Text := myini.ReadString('cost_set', 'grade131', '120000');
    EdtGrade132.Text := myini.ReadString('cost_set', 'grade132', '200000');

    EdtCost1.Text := myini.ReadString('cost_set', 'cost1', '5');
    EdtCost2.Text := myini.ReadString('cost_set', 'cost2', '15');
    EdtCost3.Text := myini.ReadString('cost_set', 'cost3', '20');
    EdtCost4.Text := myini.ReadString('cost_set', 'cost4', '25');
    EdtCost5.Text := myini.ReadString('cost_set', 'cost5', '30');
    EdtCost6.Text := myini.ReadString('cost_set', 'cost6', '35');
    EdtCost7.Text := myini.ReadString('cost_set', 'cost7', '40');
    EdtCost8.Text := myini.ReadString('cost_set', 'cost8', '45');
    EdtCost9.Text := myini.ReadString('cost_set', 'cost9', '50');
    EdtCost10.Text := myini.ReadString('cost_set', 'cost10', '55');
    EdtCost11.Text := myini.ReadString('cost_set', 'cost11', '60');
    EdtCost12.Text := myini.ReadString('cost_set', 'cost12', '65');
    EdtCost13.Text := myini.ReadString('cost_set', 'cost13', '70');

  finally
    myini.Free;
  end;
end;

function TCostSetForm.saveCostSet: Boolean;
var myini: TIniFile;
begin
  myini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'setup.ini');
  try

    myini.WriteBool('cost_set', 'useCost', CBUseCost.Checked);
    myini.WriteString('cost_set', 'initCost', EdtInitial.Text);
    myini.WriteString('cost_set', 'unitCost1', EdtUnit1.Text);
    myini.WriteString('cost_set', 'unitCost2', EdtUnit2.Text);
    myini.WriteBool('cost_set', 'manualInputCost', CBManualInput.Checked);
    myini.WriteString('cost_set', 'grade1', EdtPound1.Text);
    myini.WriteString('cost_set', 'grade2', EdtPound2.Text);
    myini.WriteString('cost_set', 'grade3', EdtPound3.Text);
    myini.WriteString('cost_set', 'grade4', EdtPound4.Text);
    myini.WriteString('cost_set', 'grade5', EdtPound5.Text);
    myini.WriteString('cost_set', 'grade6', EdtPound6.Text);
    if RBChargeType1.Checked then
      myini.WriteInteger('cost_set', 'chargeType', 0)
    else
      myini.WriteInteger('cost_set', 'chargeType', 1);
    myini.WriteInteger('cost_set', 'costType', CBCostType.ItemIndex);
    myini.WriteInteger('cost_set', 'point', StrToInt(LEPoint.Text));
    myini.WriteBool('cost_set', 'ladder', CBLadder.Checked);

    myini.WriteFloat('cost_set', 'grade11', StrToFloatDef(EdtGrade11.Text, 0));
    myini.WriteFloat('cost_set', 'grade12', StrToFloatDef(EdtGrade12.Text, 10000));
    myini.WriteFloat('cost_set', 'grade21', StrToFloatDef(EdtGrade21.Text, 10000));
    myini.WriteFloat('cost_set', 'grade22', StrToFloatDef(EdtGrade22.Text, 23000));
    myini.WriteFloat('cost_set', 'grade31', StrToFloatDef(EdtGrade31.Text, 23000));
    myini.WriteFloat('cost_set', 'grade32', StrToFloatDef(EdtGrade32.Text, 30000));
    myini.WriteFloat('cost_set', 'grade41', StrToFloatDef(EdtGrade41.Text, 30000));
    myini.WriteFloat('cost_set', 'grade42', StrToFloatDef(EdtGrade42.Text, 40000));
    myini.WriteFloat('cost_set', 'grade51', StrToFloatDef(EdtGrade51.Text, 40000));
    myini.WriteFloat('cost_set', 'grade52', StrToFloatDef(EdtGrade52.Text, 50000));
    myini.WriteFloat('cost_set', 'grade61', StrToFloatDef(EdtGrade61.Text, 50000));
    myini.WriteFloat('cost_set', 'grade62', StrToFloatDef(EdtGrade62.Text, 60000));
    myini.WriteFloat('cost_set', 'grade71', StrToFloatDef(EdtGrade71.Text, 60000));
    myini.WriteFloat('cost_set', 'grade72', StrToFloatDef(EdtGrade72.Text, 70000));
    myini.WriteFloat('cost_set', 'grade81', StrToFloatDef(EdtGrade81.Text, 70000));
    myini.WriteFloat('cost_set', 'grade82', StrToFloatDef(EdtGrade82.Text, 80000));
    myini.WriteFloat('cost_set', 'grade91', StrToFloatDef(EdtGrade91.Text, 80000));
    myini.WriteFloat('cost_set', 'grade92', StrToFloatDef(EdtGrade92.Text, 90000));
    myini.WriteFloat('cost_set', 'grade101', StrToFloatDef(EdtGrade101.Text, 90000));
    myini.WriteFloat('cost_set', 'grade102', StrToFloatDef(EdtGrade102.Text, 100000));
    myini.WriteFloat('cost_set', 'grade111', StrToFloatDef(EdtGrade111.Text, 100000));
    myini.WriteFloat('cost_set', 'grade112', StrToFloatDef(EdtGrade112.Text, 110000));
    myini.WriteFloat('cost_set', 'grade121', StrToFloatDef(EdtGrade121.Text, 110000));
    myini.WriteFloat('cost_set', 'grade122', StrToFloatDef(EdtGrade122.Text, 120000));
    myini.WriteFloat('cost_set', 'grade131', StrToFloatDef(EdtGrade131.Text, 120000));
    myini.WriteFloat('cost_set', 'grade132', StrToFloatDef(EdtGrade132.Text, 200000));

    myini.WriteFloat('cost_set', 'cost1', StrToFloatDef(EdtCost1.Text, 5));
    myini.WriteFloat('cost_set', 'cost2', StrToFloatDef(EdtCost2.Text, 15));
    myini.WriteFloat('cost_set', 'cost3', StrToFloatDef(EdtCost3.Text, 20));
    myini.WriteFloat('cost_set', 'cost4', StrToFloatDef(EdtCost4.Text, 25));
    myini.WriteFloat('cost_set', 'cost5', StrToFloatDef(EdtCost5.Text, 30));
    myini.WriteFloat('cost_set', 'cost6', StrToFloatDef(EdtCost6.Text, 35));
    myini.WriteFloat('cost_set', 'cost7', StrToFloatDef(EdtCost7.Text, 40));
    myini.WriteFloat('cost_set', 'cost8', StrToFloatDef(EdtCost8.Text, 45));
    myini.WriteFloat('cost_set', 'cost9', StrToFloatDef(EdtCost9.Text, 50));
    myini.WriteFloat('cost_set', 'cost10', StrToFloatDef(EdtCost10.Text, 55));
    myini.WriteFloat('cost_set', 'cost11', StrToFloatDef(EdtCost11.Text, 60));
    myini.WriteFloat('cost_set', 'cost12', StrToFloatDef(EdtCost12.Text, 65));
    myini.WriteFloat('cost_set', 'cost13', StrToFloatDef(EdtCost13.Text, 70));

    MainForm.systemConfig.useCost := CBUseCost.Checked;
    MainForm.systemConfig.BasicPound := StrToFloat(EdtInitial.Text);
    MainForm.systemConfig.UnitPound1 := StrToFloat(EdtUnit1.Text);
    MainForm.systemConfig.UnitPound2 := StrToFloat(EdtUnit2.Text);
    MainForm.systemConfig.ManualInputPound := CBManualInput.Checked;
    MainForm.FrmWeight1.EdtCost.Enabled := CBManualInput.Checked;
    MainForm.systemConfig.poundGrade1 := StrToFloatDef(EdtPound1.Text, 0);
    MainForm.systemConfig.poundGrade2 := StrToFloatDef(EdtPound2.Text, 10000);
    MainForm.systemConfig.poundGrade3 := StrToFloatDef(EdtPound3.Text, 10000);
    MainForm.systemConfig.poundGrade4 := StrToFloatDef(EdtPound4.Text, 100000);
    MainForm.systemConfig.poundGrade5 := StrToFloatDef(EdtPound5.Text, 100000);
    MainForm.systemConfig.poundGrade6 := StrToFloatDef(EdtPound6.Text, 120000);
    if RBChargeType1.Checked then
      MainForm.systemConfig.chargeType := 0
    else
      MainForm.systemConfig.chargeType := 1;
    MainForm.systemConfig.costType := CBCostType.ItemIndex;
    MainForm.systemConfig.scalePoint := StrToIntDef(LEPoint.Text, 0);
    MainForm.systemConfig.ladder := CBLadder.Checked;

    MainForm.systemConfig.grade11 := StrToFloatDef(EdtGrade11.Text, 0);
    MainForm.systemConfig.grade12 := StrToFloatDef(EdtGrade12.Text, 10000);
    MainForm.systemConfig.grade21 := StrToFloatDef(EdtGrade21.Text, 10000);
    MainForm.systemConfig.grade22 := StrToFloatDef(EdtGrade22.Text, 23000);
    MainForm.systemConfig.grade31 := StrToFloatDef(EdtGrade31.Text, 23000);
    MainForm.systemConfig.grade32 := StrToFloatDef(EdtGrade32.Text, 30000);
    MainForm.systemConfig.grade41 := StrToFloatDef(EdtGrade41.Text, 30000);
    MainForm.systemConfig.grade42 := StrToFloatDef(EdtGrade42.Text, 40000);
    MainForm.systemConfig.grade51 := StrToFloatDef(EdtGrade51.Text, 40000);
    MainForm.systemConfig.grade52 := StrToFloatDef(EdtGrade52.Text, 50000);
    MainForm.systemConfig.grade61 := StrToFloatDef(EdtGrade61.Text, 50000);
    MainForm.systemConfig.grade62 := StrToFloatDef(EdtGrade62.Text, 60000);
    MainForm.systemConfig.grade71 := StrToFloatDef(EdtGrade71.Text, 60000);
    MainForm.systemConfig.grade72 := StrToFloatDef(EdtGrade72.Text, 70000);
    MainForm.systemConfig.grade81 := StrToFloatDef(EdtGrade81.Text, 70000);
    MainForm.systemConfig.grade82 := StrToFloatDef(EdtGrade82.Text, 80000);
    MainForm.systemConfig.grade91 := StrToFloatDef(EdtGrade91.Text, 80000);
    MainForm.systemConfig.grade92 := StrToFloatDef(EdtGrade92.Text, 90000);
    MainForm.systemConfig.grade101 := StrToFloatDef(EdtGrade101.Text, 90000);
    MainForm.systemConfig.grade102 := StrToFloatDef(EdtGrade102.Text, 100000);
    MainForm.systemConfig.grade111 := StrToFloatDef(EdtGrade111.Text, 100000);
    MainForm.systemConfig.grade112 := StrToFloatDef(EdtGrade112.Text, 110000);
    MainForm.systemConfig.grade121 := StrToFloatDef(EdtGrade121.Text, 110000);
    MainForm.systemConfig.grade122 := StrToFloatDef(EdtGrade122.Text, 120000);
    MainForm.systemConfig.grade131 := StrToFloatDef(EdtGrade131.Text, 120000);
    MainForm.systemConfig.grade132 := StrToFloatDef(EdtGrade132.Text, 200000);

    MainForm.systemConfig.cost1 := StrToFloatDef(EdtCost1.Text, 5);
    MainForm.systemConfig.cost2 := StrToFloatDef(EdtCost2.Text, 15);
    MainForm.systemConfig.cost3 := StrToFloatDef(EdtCost3.Text, 20);
    MainForm.systemConfig.cost4 := StrToFloatDef(EdtCost4.Text, 25);
    MainForm.systemConfig.cost5 := StrToFloatDef(EdtCost5.Text, 30);
    MainForm.systemConfig.cost6 := StrToFloatDef(EdtCost6.Text, 35);
    MainForm.systemConfig.cost7 := StrToFloatDef(EdtCost7.Text, 40);
    MainForm.systemConfig.cost8 := StrToFloatDef(EdtCost8.Text, 45);
    MainForm.systemConfig.cost9 := StrToFloatDef(EdtCost9.Text, 50);
    MainForm.systemConfig.cost10 := StrToFloatDef(EdtCost10.Text, 55);
    MainForm.systemConfig.cost11 := StrToFloatDef(EdtCost11.Text, 60);
    MainForm.systemConfig.cost12 := StrToFloatDef(EdtCost12.Text, 65);
    MainForm.systemConfig.cost13 := StrToFloatDef(EdtCost13.Text, 70);

  finally
    myini.Free;
  end;
end;

procedure TCostSetForm.FormShow(Sender: TObject);
begin
  loadCostSet;
end;

procedure TCostSetForm.BitBtnOKClick(Sender: TObject);
begin
  saveCostSet;
end;

procedure TCostSetForm.BitBtnCancelClick(Sender: TObject);
begin
  Close;
end;

end.
