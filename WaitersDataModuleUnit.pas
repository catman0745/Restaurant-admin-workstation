unit WaitersDataModuleUnit;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TWaitersDataModule = class(TDataModule)
    DisplayDataSource: TDataSource;
    AddQuery: TADOQuery;
    UpdateQuery: TADOQuery;
    DeleteQuery: TADOQuery;
    WaitersQuery: TADOQuery;
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
