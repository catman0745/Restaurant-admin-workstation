unit CreateCheckUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Math;

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
    CheckSummaryEdit: TEdit;
    CheckSummaryLabel: TLabel;
    TableIdDBLookupComboBox: TDBLookupComboBox;
    Label3: TLabel;
    procedure OpenCheckButtonClick(Sender: TObject);
    procedure AddDishButtonClick(Sender: TObject);
    procedure SaveCheckButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure ResetState();
    procedure LockForm();
    procedure UnlockForm();
    procedure RefreshList();
    function DishAlreadyInCheck(dishId: Integer): Boolean;
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

function IsNonNegativeInteger(num: string): Boolean;
var
  i: Integer;
begin
  for i := 1 to length(num) do
    if not (CharInSet(num[i], ['0'..'9'])) then
      begin
        IsNonNegativeInteger := false;
        exit;
      end;

  IsNonNegativeInteger := true;
end;

procedure TCreateCheckForm.RefreshList();
begin
  CreateCheckdataModule.DishInCheckQuery.Active := false;
  CreateCheckdataModule.DishInCheckQuery.Active := true;
end;

procedure TCreateCheckForm.ResetState();
begin
  OpenedCheckId := 0;
  IsCheckOpened := False;
  TableIdDBLookupComboBox.ReadOnly := False;
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

function TCreateCheckForm.DishAlreadyInCheck(dishId: Integer): Boolean;
begin
  CreateCheckDataModule.UniquenessQuery.Parameters.ParamByName('CheckId').Value := OpenedCheckId;
  CreateCheckDataModule.UniquenessQuery.Parameters.ParamByName('DishId').Value := dishId;

  CreateCheckDataModule.UniquenessQuery.Open;

  DishAlreadyInCheck := CreateCheckDataModule.UniquenessQuery.Fields.FieldByName('Количество таких блюд в чеке').AsInteger > 0;

  CreateCheckDataModule.UniquenessQuery.Close;
end;

procedure TCreateCheckForm.AddDishButtonClick(Sender: TObject);
var
  checkSummary: Real;
begin
  if DishIdDBLookupComboBox.KeyValue = null then
    begin
      ShowMessage('Блюдо не выбрано');
      Exit
    end;

  if DishAlreadyInCheck(DishIdDBLookupComboBox.KeyValue) then
    begin
      CreateCheckDataModule.UpdateCountQuery.Parameters.ParamByName('CheckId').Value := OpenedCheckId;
      CreateCheckDataModule.UpdateCountQuery.Parameters.ParamByName('DishId').Value := DishIdDBLookupComboBox.KeyValue;
      CreateCheckDataModule.UpdateCountQuery.Parameters.ParamByName('IncrementCount').Value := strToInt(CountDBEdit.Text);

      CreateCheckDataModule.UpdateCountQuery.ExecSQL;
      RefreshList();

      DishIdDBLookupComboBox.KeyValue := null;
      CountDbEdit.Text := '';
    end
  else
    begin
      CheckIdDBEdit.Text := intToStr(OpenedCheckId);
      CreateCheckDataModule.DishInCheckTable.Insert;
    end;

  RefreshList;

  // refresh check summary
  CreateCheckDataModule.CheckSummaryQuery.Parameters.ParamByName('CheckId').Value := OpenedCheckId;
  CreateCheckDataModule.CheckSummaryQuery.Open;

  CheckSummary := CreateCheckDataModule.CheckSummaryQuery.Fields.FieldByName('Стоимость').AsCurrency;
  CheckSummaryEdit.Text := FloatToStr(CheckSummary);

  CreateCheckDataModule.CheckSummaryQuery.Close;
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
  if IsCheckOpened then
    begin
      ShowMessage('Чек уже открыт');
      exit;
    end;
  if TableIdDBLookupComboBox.KeyValue = null then
    begin
      ShowMessage('Укажите номер столика');
      exit;
    end;

  CreateCheckDataModule.OpenCheckQuery.Parameters.ParamByName('TableId').Value := TableIdDBLookupComboBox.KeyValue;

  CreateCheckDataModule.OpenCheckQuery.ExecSQL;
  IsCheckOpened := True;
  TableIdDBLookupComboBox.ReadOnly := True;

  CreateCheckDataModule.OpenedCheckIdQuery.Open();
  OpenedCheckId := CreateCheckDataModule.OpenedCheckIdQuery.FieldByName('Код').AsInteger;
  CreateCheckDataModule.OpenedCheckIdQuery.Close();

  CreateCheckDataModule.DishInCheckQuery.Parameters.ParamByName('КодОткрытогоЧека').Value := OpenedCheckId;
  CreateCheckdataModule.DishInCheckQuery.Active := true;

  UnlockForm;
end;

procedure TCreateCheckForm.SaveCheckButtonClick(Sender: TObject);
begin
  ResetState;
  LockForm;
end;

end.
