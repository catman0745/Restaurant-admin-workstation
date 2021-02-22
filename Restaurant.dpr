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
  WaitersDataModuleUnit in 'WaitersDataModuleUnit.pas' {WaitersDataModule: TDataModule};

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
  Application.Run;
end.
