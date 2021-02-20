unit DishesUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls;

type
  TDishesForm = class(TForm)
    DBGrid1: TDBGrid;
    ModeComboBox: TComboBox;
    Label1: TLabel;
    ActionButton: TButton;
    DishPriceEdit: TEdit;
    Label2: TLabel;
    DishNameEdit: TEdit;
    Label3: TLabel;
    DishIdLookupComboBox: TDBLookupComboBox;
    Label4: TLabel;
    procedure ModeComboBoxChange(Sender: TObject);
    procedure ActionButtonClick(Sender: TObject);
    procedure AddMode();
    procedure EditMode();
    procedure DeleteMode();
    procedure AddDish();
    procedure UpdateDish();
    procedure DeleteDish();
    procedure RefreshDishesList();
    function IsFloat(input: string): Boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DishesForm: TDishesForm;

implementation

{$R *.dfm}

uses DishesDataModuleUnit;

procedure TDishesForm.AddMode();
begin
  DishIdLookupComboBox.Enabled := false;
  DishIdLookupComboBox.KeyValue := null;

  DishNameEdit.Enabled := true;
  DishNameEdit.Text := '';

  DishPriceEdit.Enabled := true;
  DishPriceEdit.Text := '';

  ActionButton.Visible := true;
  ActionButton.Caption := 'Добавить блюдо';
end;

procedure TDishesForm.EditMode();
begin
  DishIdLookupComboBox.Enabled := true;
  DishIdLookupComboBox.KeyValue := null;

  DishNameEdit.Enabled := true;
  DishNameEdit.Text := '';

  DishPriceEdit.Enabled := true;
  DishPriceEdit.Text := '';

  ActionButton.Visible := true;
  ActionButton.Caption := 'Сохранить изменения';
end;

procedure TDishesForm.DeleteMode();
begin
  DishIdLookupComboBox.Enabled := true;
  DishIdLookupComboBox.KeyValue := null;

  DishNameEdit.Enabled := false;
  DishNameEdit.Text := '';

  DishPriceEdit.Enabled := false;
  DishPriceEdit.Text := '';

  ActionButton.Visible := true;
  ActionButton.Caption := 'Удалить блюдо';
end;

procedure TDishesForm.RefreshDishesList();
begin
  DishesDataModule.ShowDishesQuery.Active := false;
  DishesDataModule.ShowDishesQuery.Active := true;

  DishesDataModule.DishesTable.Active := false;
  DishesDataModule.DishesTable.Active := true;
end;

function TDishesForm.IsFloat(input: string): Boolean;
begin
  IsFloat := true;
  try
    StrToFloat(input);
  except
    IsFloat := false;
  end;
end;

procedure TDishesForm.AddDish();
begin
  if DishNameEdit.GetTextLen = 0 then
    begin
      ShowMessage('Введите название блюда');
      exit;
    end;

  if DishPriceEdit.GetTextLen = 0 then
    begin
      ShowMessage('Введите цену блюда');
      exit;
    end;
  if not IsFloat(DishPriceEdit.Text) then
    begin
      ShowMessage('Цена блюда должна быть числом');
      exit;
    end;
  if StrToFloat(DishPriceEdit.Text) < 0 then
    begin
      ShowMessage('Цена блюда не может быть отрицательной');
      exit;
    end;

  DishesDataModule.DishesQuery.SQL.Clear;

  DishesDataModule.DishesQuery.SQL.Add('INSERT INTO Блюда(Название, Цена)');
  DishesDataModule.DishesQuery.SQL.Add('VALUES(:Name, :Price)');

  DishesDataModule.DishesQuery.Parameters.ParamByName('Name').Value := DishNameEdit.Text;
  DishesDataModule.DishesQuery.Parameters.ParamByName('Price').Value := DishPriceedit.Text;

  DishesDataModule.DishesQuery.ExecSQl;

  RefreshDishesList;
end;

procedure TDishesForm.UpdateDish();
begin
  if DishIdLookupComboBox.KeyValue = null then
    begin
      ShowMessage('Выберите блюдо');
      exit;
    end;

  if DishNameEdit.GetTextLen = 0 then
    begin
      ShowMessage('Введите название блюда');
      exit;
    end;

  if DishPriceEdit.GetTextLen = 0 then
    begin
      ShowMessage('Введите цену блюда');
      exit;
    end;
  if not IsFloat(DishPriceEdit.Text) then
    begin
      ShowMessage('Цена блюда должна быть числом');
      exit;
    end;
  if StrToFloat(DishPriceEdit.Text) < 0 then
    begin
      ShowMessage('Цена блюда не может быть отрицательной');
      exit;
    end;

  DishesDataModule.DishesQuery.SQL.Clear;

  DishesDataModule.DishesQuery.SQL.Add('UPDATE Блюда');
  DishesDataModule.DishesQuery.SQL.Add('SET Название = :Name, Цена = :Price');
  DishesDataModule.DishesQuery.SQL.Add('WHERE Код = :Id');

  DishesDataModule.DishesQuery.Parameters.ParamByName('Name').Value := DishNameEdit.Text;
  DishesDataModule.DishesQuery.Parameters.ParamByName('Price').Value := DishPriceedit.Text;
  DishesDataModule.DishesQuery.Parameters.ParamByName('Id').Value := DishIdLookupComboBox.KeyValue;

  DishesDataModule.DishesQuery.ExecSQl;

  RefreshDishesList;
end;

procedure TDishesForm.DeleteDish();
begin
  if DishIdLookupComboBox.KeyValue = null then
    begin
      ShowMessage('Выберите блюдо');
      exit;
    end;

  DishesDataModule.DishesQuery.SQL.Clear;

  DishesDataModule.DishesQuery.SQL.Add('DELETE FROM Блюда');
  DishesDataModule.DishesQuery.SQL.Add('WHERE Код = :Id');

  DishesDataModule.DishesQuery.Parameters.ParamByName('Id').Value := DishIdLookupComboBox.KeyValue;

  DishesDataModule.DishesQuery.ExecSQl;

  RefreshDishesList;
end;

procedure TDishesForm.ActionButtonClick(Sender: TObject);
begin
  case ModeComboBox.ItemIndex of
    0: AddDish();
    1: UpdateDish();
    2: DeleteDish();
  end;
end;

procedure TDishesForm.ModeComboBoxChange(Sender: TObject);
begin
  case ModeComboBox.ItemIndex of
    0: AddMode();
    1: EditMode();
    2: DeleteMode();
  end;
end;

end.
