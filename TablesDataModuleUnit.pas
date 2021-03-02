unit TablesDataModuleUnit;

interface

uses
  System.SysUtils, System.Classes, Data.Win.ADODB, Data.DB;

type
  TTablesDataModule = class(TDataModule)
    TablesDataSource: TDataSource;
    AddQuery: TADOQuery;
    UpdateQuery: TADOQuery;
    DeleteQuery: TADOQuery;
    TableNumberUniquenessCheckQuery: TADOQuery;
    TablesQuery: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TablesDataModule: TTablesDataModule;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses MainDataModuleUnit;

{$R *.dfm}

end.
