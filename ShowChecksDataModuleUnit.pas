unit ShowChecksDataModuleUnit;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TShowChecksDataModule = class(TDataModule)
    ShowChecksQuery: TADOQuery;
    ShowChecksDataSource: TDataSource;
    CloseCheckQuery: TADOQuery;
    ReportQuery: TADOQuery;
    ReportDataSource: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ShowChecksDataModule: TShowChecksDataModule;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses MainDataModuleUnit;

{$R *.dfm}

end.
