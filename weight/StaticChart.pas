unit StaticChart;

interface

uses
  Classes, Controls, Forms, TeeProcs, TeEngine, DBChart, ExtCtrls,
  StdCtrls, ComCtrls, Series, IniFiles, SysUtils, DateUtils,
  RzButton, TeeDonut, Chart;

type
  TStaticChartForm = class(TForm)
    PTop: TPanel;
    DBChartAnalys: TDBChart;
    lblTimeRange: TLabel;
    DTPStart: TDateTimePicker;
    DTPEnd: TDateTimePicker;
    lblTimeRange2: TLabel;
    lblStaticBy: TLabel;
    CBProject: TComboBox;
    LETopCount: TLabeledEdit;
    CBCaculateType: TComboBox;
    BitBtnStatic: TRzBitBtn;
    CBQueue: TComboBox;
    BtnExport: TRzBitBtn;
    CBChartType: TComboBox;
    lblCaculateType: TLabel;
    SeriesStaticBar: TBarSeries;
    SeriesStaticPie: TDonutSeries;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtnStaticClick(Sender: TObject);
    procedure BtnExportClick(Sender: TObject);
    procedure CBChartTypeChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure addStaticProj();
    procedure loadConfig();
    procedure saveConfig();
  end;

var
  StaticChartForm: TStaticChartForm;

implementation

uses
  QueryDM, CommonUtil, Main;

{$R *.dfm}

{ TStaticChartForm }

procedure TStaticChartForm.addStaticProj;
begin
  CBProject.Items.Clear;
  CBProject.Items.Add('车号');
  CBProject.Items.Add('发货单位');
  CBProject.Items.Add('收货单位');
  CBProject.Items.Add('货名');
  CBProject.Items.Add('规格');
  CBProject.Items.Add('月份');
end;

procedure TStaticChartForm.loadConfig;
var myini: TIniFile;
begin
  myini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'setup.ini');
  try
    CBProject.ItemIndex := myini.ReadInteger('static', 'project', 0);
    LETopCount.Text := myini.ReadString('static', 'topCount', '10');
    CBCaculateType.ItemIndex := myini.ReadInteger('static', 'sum', 1);
    CBQueue.ItemIndex := myini.ReadInteger('static', 'queue', 1);
    CBChartType.ItemIndex := myini.ReadInteger('static', 'chartType', 0);
  finally
    myini.Free;
  end;
end;

procedure TStaticChartForm.saveConfig;
var myini: TIniFile;
begin
  myini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'setup.ini');
  try
    myini.WriteInteger('static', 'project', CBProject.ItemIndex);
    myini.WriteInteger('static', 'topCount', StrToIntDef(LETopCount.Text, 10));
    myini.WriteInteger('static', 'sum', CBCaculateType.ItemIndex);
    myini.WriteInteger('static', 'queue', CBQueue.ItemIndex);
    myini.WriteInteger('static', 'chartType', CBChartType.ItemIndex);
  finally
    myini.Free;
  end;
end;

procedure TStaticChartForm.FormCreate(Sender: TObject);
begin
  addStaticProj;
  DTPStart.DateTime := StartOfTheMonth(Now);
  DTPEnd.DateTime := EndOfTheMonth(Now);
end;

procedure TStaticChartForm.FormShow(Sender: TObject);
begin
  loadConfig;
  if CBChartType.ItemIndex = 0 then
  begin
    SeriesStaticBar.Active := True;
    SeriesStaticPie.Active := False;
  end
  else if CBChartType.ItemIndex = 1 then
  begin
    SeriesStaticBar.Active := False;
    SeriesStaticPie.Active := True;
  end;
end;

procedure TStaticChartForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  saveConfig;
end;

procedure TStaticChartForm.BitBtnStaticClick(Sender: TObject);
var s: string;
begin
  SeriesStaticBar.DataSource := QueryDataModule.ADOQStaticChart;
  SeriesStaticBar.XLabelsSource := 'x';
  SeriesStaticBar.YValues.ValueSource := 'y';

  SeriesStaticPie.DataSource := QueryDataModule.ADOQStaticChart;
  SeriesStaticPie.XLabelsSource := 'x';
  SeriesStaticPie.YValues.ValueSource := 'y';

  s := 'select top ' + LETopCount.Text + ' x,y from (';
  if CBProject.ItemIndex = CBProject.Items.Count - 1 then
  begin
    if MainForm.systemConfig.databaseInUse then
      s := s + 'select format(毛重时间,''yyyy-mm'') as x,'
    else
      s := s + 'select left(convert(nvarchar(20),毛重时间,23),7) as x,'
  end
  else
    s := s + 'select [' + CBProject.Text + '] as x,';

  if CBCaculateType.ItemIndex = 0 then
    s := s + 'count(流水号) as y '
  else if CBCaculateType.ItemIndex = 1 then
    s := s + 'sum(实重) as y ';

  s := s + 'from 称重信息 where (毛重时间 between :start and :end) ';

  if CBProject.ItemIndex = CBProject.Items.Count - 1 then
  begin
    if MainForm.systemConfig.databaseInUse then
      s := s + 'group by format(毛重时间,''yyyy-mm'')) t '
    else
      s := s + 'group by left(convert(nvarchar(20),毛重时间,23),7)) t '
  end
  else
    s := s + 'group by [' + CBProject.Text + ']) t ';

  if CBQueue.ItemIndex = 0 then
    s := s + 'order by y asc'
  else if CBQueue.ItemIndex = 1 then
    s := s + 'order by y desc';

  with QueryDataModule.ADOQStaticChart do
  begin
    Close;
    SQL.Text := s;
    Parameters.ParamByName('start').Value := FormatDateTime('yyyy-MM-dd 00:00:00', DTPStart.DateTime);
    Parameters.ParamByName('end').Value := FormatDateTime('yyyy-MM-dd 23:59:59', DTPEnd.DateTime);
    Open;
  end;
end;

procedure TStaticChartForm.BtnExportClick(Sender: TObject);
var s: string;
begin
  s := TCommonUtil.saveFileDialog('bmp', '*.bmp', ExtractFilePath(ParamStr(0)));
  if s <> '' then
    DBChartAnalys.SaveToBitmapFile(s);
end;

procedure TStaticChartForm.CBChartTypeChange(Sender: TObject);
begin
  if CBChartType.ItemIndex = 0 then
  begin
    SeriesStaticBar.Active := True;
    SeriesStaticPie.Active := False;
  end
  else if CBChartType.ItemIndex = 1 then
  begin
    SeriesStaticBar.Active := False;
    SeriesStaticPie.Active := True;
  end;
end;

end.

