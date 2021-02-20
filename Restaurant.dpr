program Restaurant;

uses
  Vcl.Forms,
  MainUnit in 'MainUnit.pas' {MainForm},
  MainDataModuleUnit in 'MainDataModuleUnit.pas' {MainDataModule: TDataModule},
  CreateCheckUnit in 'CreateCheckUnit.pas' {CreateCheckForm},
  CreateCheckDataModuleUnit in 'CreateCheckDataModuleUnit.pas' {CreateCheckDataModule: TDataModule},
  DishesDataModuleUnit in 'DishesDataModuleUnit.pas' {DishesDataModule: TDataModule},
  DishesUnit in 'DishesUnit.pas' {DishesForm};

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
  Application.Run;
end.
