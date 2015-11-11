unit PhotoUnit;

interface

uses
  Windows, Messages, Classes, Graphics, Controls, Forms, SysUtils,
  Dialogs, ExtCtrls, Buttons, StdCtrls, RzStatus, RzPanel, RzSplit,
  RzButton;

type
  TPhotoForm = class(TForm)
    MainPanel: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    CloseBtn: TSpeedButton;
    PGrossImage1: TPanel;
    GrossImage1: TImage;
    PGrossImage2: TPanel;
    GrossImage2: TImage;
    PEmptyImage1: TPanel;
    EmptyImage1: TImage;
    PEmptyImage2: TPanel;
    EmptyImage2: TImage;
    CongealFormBtn: TSpeedButton;
    activeFormBtn: TSpeedButton;
    MSWeightInfo: TRzMarqueeStatus;
    RzSizePanel1: TRzSizePanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    PGrossImage3: TPanel;
    GrossImage3: TImage;
    PGrossImage4: TPanel;
    GrossImage4: TImage;
    PEmptyImage3: TPanel;
    EmptyImage3: TImage;
    PEmptyImage4: TPanel;
    EmptyImage4: TImage;
    BtnImportGross: TRzBitBtn;
    BtnImportTare: TRzBitBtn;
    procedure CloseBtnClick(Sender: TObject);
    procedure MainPanelMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CongealFormBtnClick(Sender: TObject);
    procedure activeFormBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GrossImage1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure GrossImage1Click(Sender: TObject);
    procedure BtnImportGrossClick(Sender: TObject);
    procedure BtnImportTareClick(Sender: TObject);
  private
    { Private declarations }
    maxForm: TForm;
    img: TImage;
    thisGlideNo: string;
  public
    { Public declarations }
    procedure setWeightInfo(const glideNo: string);
    procedure imgClick(Sender: TObject);
  end;

var
  PhotoForm: TPhotoForm;

implementation

uses
  WeightRecord, WeightUtil, CommonUtil, Main;

{$R *.dfm}

procedure TPhotoForm.CloseBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TPhotoForm.MainPanelMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if activeFormBtn.Visible then
    if Button = mbLeft then
    begin
      ReleaseCapture;
      PhotoForm.perform(WM_SysCommand, $F012, 0);
    end;
end;

procedure TPhotoForm.CongealFormBtnClick(Sender: TObject);
begin
  if CongealFormBtn.Visible then
  begin
    CongealFormBtn.Visible := False;
    activeFormBtn.Visible := True;
  end;
end;

procedure TPhotoForm.activeFormBtnClick(Sender: TObject);
begin
  if activeFormBtn.Visible then
  begin
    activeFormBtn.Visible := False;
    CongealFormBtn.Visible := True;
  end;
end;

procedure TPhotoForm.FormShow(Sender: TObject);
begin
  SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE);
end;

procedure TPhotoForm.setWeightInfo(const glideNo: string);
var w: TWeightRecord;
begin
  w := TWeightRecord.Create;
  try
    if TWeightRecordUtil.get(glideNo, w) then
    begin
      thisGlideNo := glideNo;
      MSWeightInfo.Caption := Format('流水号:%s,车号:%s,发货单位:%s,收货单位:%s,'
        + '货名:%s,规格:%s,毛重:%f,皮重:%f,净重:%f',
        [glideNo, w.carNo, w.faHuo, w.shouHuo, w.goods, w.spec, w.gross, w.tare, w.net])
        + ',毛重时间:' + FormatDateTime('yyyy-MM-dd HH:mm:ss', w.grossTime)
        + ',皮重时间:' + FormatDateTime('yyyy-MM-dd HH:mm:ss', w.tareTime);
    end;
  finally
    w.Free;
  end;
end;

procedure TPhotoForm.imgClick(Sender: TObject);
begin
  maxForm.close;
end;

procedure TPhotoForm.GrossImage1ContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
var sd: TSaveDialog;
begin
  SetWindowPos(Handle, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE);
  sd := TSaveDialog.Create(nil);
  try
    sd.Filter := 'JPEG(*.jpg)|*.jpg';
    if sd.Execute then
    begin
      (Sender as TImage).Picture.SaveToFile(sd.filename);
    end;
  finally
    sd.Free;
  end;
  SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE);
end;

procedure TPhotoForm.GrossImage1Click(Sender: TObject);
begin
  SetWindowPos(Handle, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE);

  if maxForm = nil then
    maxForm := TForm.Create(nil);
  if img = nil then
    img := TImage.Create(maxForm);

  maxForm.BorderStyle := bsNone;
  maxForm.WindowState := wsMaximized;
  img.Parent := maxForm;
  img.Align := alClient;
  img.Picture.Assign((Sender as TImage).Picture);
  img.OnClick := imgClick;

  if not maxForm.Visible then maxForm.ShowModal;

  SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE);
end;

procedure TPhotoForm.BtnImportGrossClick(Sender: TObject);
var filename: string;
begin
  filename := TCommonUtil.openFileDialog('jpg', '过磅图片|*.jpg');
  if FileExists(filename) then
  begin
    if TWeightUtil.importPhotoEx(thisGlideNo, filename, MainForm.systemConfig.savePicLocal, 'g') then
    begin
      TWeightUtil.showWeightPic(thisGlideNo);
    end;
  end;
end;

procedure TPhotoForm.BtnImportTareClick(Sender: TObject);
var filename: string;
begin
  filename := TCommonUtil.openFileDialog('jpg', '过磅图片|*.jpg');
  if FileExists(filename) then
  begin
    if TWeightUtil.importPhotoEx(thisGlideNo, filename, MainForm.systemConfig.savePicLocal,'t') then
    begin
      TWeightUtil.showWeightPic(thisGlideNo);
    end;
  end;
end;

end.
d.

