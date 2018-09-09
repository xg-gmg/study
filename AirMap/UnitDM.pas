unit UnitDM;

interface

uses
  System.SysUtils, System.Classes, Data.DB, DBAccess, Uni, UniProvider,
  MySQLUniProvider, MemDS;

type
  TDataModule2 = class(TDataModule)
    MySQLUniProvider1: TMySQLUniProvider;
    UniConnection1: TUniConnection;
    UniQuery1: TUniQuery;
    UniQuery2: TUniQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule2: TDataModule2;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

end.
