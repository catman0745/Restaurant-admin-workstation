unit DishesDataModuleUnit;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TDishesDataModule = class(TDataModule)
    ShowDishesDataSource: TDataSource;
    ShowDishesQuery: TADOQuery;
    DishesQuery: TADOQuery;
    DishesTable: TADOTable;
    DishesDataSource: TDataSource;
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
