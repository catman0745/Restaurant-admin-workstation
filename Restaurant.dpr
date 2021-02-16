program Restaurant;

uses
  Vcl.Forms,
  MainUnit in 'MainUnit.pas' {MainForm},
  MainDataModuleUnit in 'MainDataModuleUnit.pas' {MainDataModule: TDataModule},
  CreateCheckUnit in 'CreateCheckUnit.pas' {CreateCheckForm},
  CreateCheckDataModuleUnit in 'CreateCheckDataModuleUnit.pas' {CreateCheckDataModule: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TMainDataModule, MainDataModule);
  Application.CreateForm(TCreateCheckForm, CreateCheckForm);
  Application.CreateForm(TCreateCheckDataModule, CreateCheckDataModule);
  Application.Run;
end.
