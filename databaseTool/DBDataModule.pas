unit DBDataModule;

interface

uses
  Classes, ADODB, DB;

type
  TDataModuleDB = class(TDataModule)
    ADOConnectionDB: TADOConnection;
    ADOQueryAddDB: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModuleDB: TDataModuleDB;

implementation

{$R *.dfm}

end.
