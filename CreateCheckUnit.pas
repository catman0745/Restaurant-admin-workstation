unit CreateCheckUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TCreateCheckForm = class(TForm)
    OpenCheckButton: TButton;
    Label1: TLabel;
    CheckDishesDBGrid: TDBGrid;
    SaveCheckButton: TButton;
    Label2: TLabel;
    CheckIdDBEdit: TDBEdit;
    Label4: TLabel;
    CountDBEdit: TDBEdit;
    AddDishButton: TButton;
    DishIdDBLookupComboBox: TDBLookupComboBox;
    CancelButton: TButton;
    procedure OpenCheckButtonClick(Sender: TObject);
    procedure AddDishButtonClick(Sender: TObject);
    procedure SaveCheckButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure ResetState();
    procedure LockForm();
    procedure UnlockForm();
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CreateCheckForm: TCreateCheckForm;
  IsCheckOpened: Boolean;
  OpenedCheckId: Integer;

implementation

{$R *.dfm}

uses CreateCheckDataModuleUnit;

procedure TCreateCheckForm.ResetState();
begin
  OpenedCheckId := 0;
  IsCheckOpened := False;
  CreateCheckdataModule.DishInCheckQuery.Active := false;
  DishIdDBLookupComboBox.KeyValue := null;
  CountDBEdit.Text := '';
end;

procedure TCreateCheckForm.LockForm();
begin
  SaveCheckButton.Enabled := false;
  CancelButton.Enabled := false;
  DishIdDBLookupComboBox.Enabled := false;
  CountDBEdit.Enabled := false;
  AddDishButton.Enabled := false;
end;

procedure TCreateCheckForm.UnlockForm();
begin
  SaveCheckButton.Enabled := true;
  CancelButton.Enabled := true;
  DishIdDBLookupComboBox.Enabled := true;
  CountDBEdit.Enabled := true;
  AddDishButton.Enabled := true;
end;

procedure TCreateCheckForm.AddDishButtonClick(Sender: TObject);
begin
  if DishIdDBLookupComboBox.KeyValue = null then
    begin
      ShowMessage('Блюдо не выбрано');
      Exit
    end;


  CheckIdDBEdit.Text := intToStr(OpenedCheckId);
  CreateCheckDataModule.DishInCheckTable.Insert;

  CreateCheckdataModule.DishInCheckQuery.Active := false;
  CreateCheckdataModule.DishInCheckQuery.Active := true;
end;

procedure TCreateCheckForm.CancelButtonClick(Sender: TObject);
begin
  CreateCheckDataModule.CancelCheckQuery.Parameters.ParamByName('КодОткрытогоЧека').Value := OpenedCheckId;
  CreateCheckDataModule.CancelCheckQuery.ExecSQL;

  ResetState;
  LockForm;
end;

procedure TCreateCheckForm.FormShow(Sender: TObject);
begin
  ResetState;
  LockForm;
end;

procedure TCreateCheckForm.OpenCheckButtonClick(Sender: TObject);
begin
  if (not IsCheckOpened) then
    begin
      CreateCheckDataModule.OpenCheckQuery.ExecSQL;
      IsCheckOpened := True;

      CreateCheckDataModule.OpenedCheckIdQuery.Open();
      OpenedCheckId := CreateCheckDataModule.OpenedCheckIdQuery.FieldByName('Код').AsInteger;
      CreateCheckDataModule.OpenedCheckIdQuery.Close();

      CreateCheckDataModule.DishInCheckQuery.Parameters.ParamByName('КодОткрытогоЧека').Value := OpenedCheckId;
      CreateCheckdataModule.DishInCheckQuery.Active := true;

      UnlockForm;
    end
  else
    ShowMessage('Чек уже открыт');
end;

procedure TCreateCheckForm.SaveCheckButtonClick(Sender: TObject);
begin
  ResetState;
  LockForm;
end;

end.
