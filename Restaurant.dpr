program Restaurant;

uses
  Vcl.Forms,
  MainUnit in 'MainUnit.pas' {MainForm},
  MainDataModuleUnit in 'MainDataModuleUnit.pas' {MainDataModule: TDataModule},
  CreateCheckUnit in 'CreateCheckUnit.pas' {CreateCheckForm},
  CreateCheckDataModuleUnit in 'CreateCheckDataModuleUnit.pas' {CreateCheckDataModule: TDataModule},
  DishesDataModuleUnit in 'DishesDataModuleUnit.pas' {DishesDataModule: TDataModule},
  DishesUnit in 'DishesUnit.pas' {DishesForm},
  ShowChecksFormUnit in 'ShowChecksFormUnit.pas' {ShowChecksForm},
  ShowChecksDataModuleUnit in 'ShowChecksDataModuleUnit.pas' {ShowChecksDataModule: TDataModule},
  WaitersUnit in 'WaitersUnit.pas' {WaitersForm},
  WaitersDataModuleUnit in 'WaitersDataModuleUnit.pas' {WaitersDataModule: TDataModule},
  AssignationUnit in 'AssignationUnit.pas' {AssignationForm},
  AssignationDataModuleUnit in 'AssignationDataModuleUnit.pas' {AssignationDataModule: TDataModule},
  TablesUnit in 'TablesUnit.pas' {TablesForm},
  TablesDataModuleUnit in 'TablesDataModuleUnit.pas' {TablesDataModule: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TMainDataModule, MainDataModule);
  Application.CreateForm(TCreateCheckForm, CreateCheckForm);
  Application.CreateForm(TCreateCheckDataModule, CreateCheckDataModule);
  Application.CreateForm(TDishesDataModule, DishesDataModule);
  Application.CreateForm(TDishesForm, DishesForm);
  Application.CreateForm(TShowChecksForm, ShowChecksForm);
  Application.CreateForm(TShowChecksDataModule, ShowChecksDataModule);
  Application.CreateForm(TWaitersForm, WaitersForm);
  Application.CreateForm(TWaitersDataModule, WaitersDataModule);
  Application.CreateForm(TAssignationForm, AssignationForm);
  Application.CreateForm(TAssignationDataModule, AssignationDataModule);
  Application.CreateForm(TTablesForm, TablesForm);
  Application.CreateForm(TTablesDataModule, TablesDataModule);
  Application.Run;
end.
