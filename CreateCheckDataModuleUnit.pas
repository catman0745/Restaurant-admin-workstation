unit CreateCheckDataModuleUnit;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TCreateCheckDataModule = class(TDataModule)
    OpenCheckQuery: TADOQuery;
    DishInCheckQuery: TADOQuery;
    DishInCheckDataSource: TDataSource;
    OpenedCheckIdQuery: TADOQuery;
    DishInCheckQueryНазвание: TWideStringField;
    DishInCheckQueryКоличество: TIntegerField;
    DishInCheckTable: TADOTable;
    DishInCheckTableБлюдо: TIntegerField;
    DishInCheckTableЧек: TIntegerField;
    DishInCheckTableКоличество: TIntegerField;
    DishesTable: TADOTable;
    DishesDataSource: TDataSource;
    DishInCheckDataSource2: TDataSource;
    CancelCheckQuery: TADOQuery;
    CheckSummaryQuery: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CreateCheckDataModule: TCreateCheckDataModule;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses MainDataModuleUnit;

{$R *.dfm}

end.
