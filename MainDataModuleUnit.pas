unit MainDataModuleUnit;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TMainDataModule = class(TDataModule)
    Connection: TADOConnection;
    DisplayTablesQuery: TADOQuery;
    DisplayTablesDataSource: TDataSource;
    ReserveTableQuery: TADOQuery;
    OccupyTableQuery: TADOQuery;
    EmptyTableQuery: TADOQuery;
    TableStatusQuery: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainDataModule: TMainDataModule;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
