unit PhotoUnit;

interface

uses
  Windows, Messages, Classes, Graphics, Controls, Forms, SysUtils,
  Dialogs, ExtCtrls, Buttons, StdCtrls, RzStatus, RzPanel, RzSplit;

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
    PhotoSaveDialog: TSaveDialog;
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
    procedure CloseBtnClick(Sender: TObject);
    procedure MainPanelMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CongealFormBtnClick(Sender: TObject);
    procedure activeFormBtnClick(Sender: TObject);
    procedure GrossImage1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure setWeightInfo(const glideNo, carNo, faHuo, shouHuo, goods, spec, gross, tare, net: string);
  end;

var
  PhotoForm: TPhotoForm;

implementation

{$R *.dfm}

procedure TPhotoForm.CloseBtnClick(Sender: TObject);
begin
  close;
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

procedure TPhotoForm.GrossImage1DblClick(Sender: TObject);
begin
  PhotoSaveDialog.filename := '';
  if PhotoSaveDialog.Execute then
    (Sender as TImage).Picture.SaveToFile(PhotoSaveDialog.filename);
end;

procedure TPhotoForm.FormShow(Sender: TObject);
begin
  SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE);
end;

procedure TPhotoForm.setWeightInfo(const glideNo, carNo, faHuo, shouHuo,
  goods, spec, gross, tare, net: string);
begin
  MSWeightInfo.Caption := Format('流水号:%s,车号:%s,发货单位:%s,收货单位:%s,'
    + '货名:%s,规格:%s,毛重:%s,皮重:%s,净重:%s',
    [glideNo, carNo, faHuo, shouHuo, goods, spec, gross, tare, net]);
end;

end.
d.
