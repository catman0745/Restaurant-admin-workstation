unit DishesDataModuleUnit;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TDishesDataModule = class(TDataModule)
    DisplayQuery: TADOQuery;
    DisplayDataSource: TDataSource;
    AddQuery: TADOQuery;
    UpdateQuery: TADOQuery;
    DeleteQuery: TADOQuery;
    NameAvailabilityCheckQuery: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DishesDataModule: TDishesDataModule;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses MainDataModuleUnit;

{$R *.dfm}

end.
