unit WaitersDataModuleUnit;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TWaitersDataModule = class(TDataModule)
    WaitersTable: TADOTable;
    WaitersDataSource: TDataSource;
    WaitersTableЛичныйномер: TAutoIncField;
    WaitersTableФИО: TWideStringField;
    InsertQuery: TADOQuery;
    UpdateQuery: TADOQuery;
    DeleteQuery: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WaitersDataModule: TWaitersDataModule;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses MainUnit, MainDataModuleUnit;

{$R *.dfm}

end.
