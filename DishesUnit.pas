unit DishesUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls;

type
  TDishesForm = class(TForm)
    DishesGrid: TDBGrid;
    NameEdit: TEdit;
    Label1: TLabel;
    PriceEdit: TEdit;
    Label2: TLabel;
    AddButton: TButton;
    UpdateButton: TButton;
    DeleteButton: TButton;
    procedure Refresh();
    procedure FillForm();
    function ValidateName(): Boolean;
    function ValidatePrice(): Boolean;
    procedure AddButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure DishesGridCellClick(Column: TColumn);
    procedure UpdateButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DishesForm: TDishesForm;
  SelectedDishId: Integer;

implementation

{$R *.dfm}

uses DishesDataModuleUnit;

function IsFloat(input: string): Boolean;
begin
  IsFloat := true;
  try
    StrToFloat(input);
  except
    IsFloat := false;
  end;
end;

procedure TDishesForm.Refresh();
begin
  DishesDataModule.DisplayQuery.Active := false;
  DishesDataModule.DisplayQuery.Active := true;
end;

procedure TDishesForm.FillForm();
var
  name: String;
  price: Real;
begin
  SelectedDishId := DishesDataModule.DisplayDataSource.DataSet.Fields[0].AsInteger;
  name := DishesDataModule.DisplayDataSource.DataSet.Fields[1].AsString;
  price := DishesDataModule.DisplayDataSource.DataSet.Fields[2].AsCurrency;

  NameEdit.Text := name;
  PriceEdit.Text := floatToStr(price);
end;

function TDishesForm.ValidateName(): Boolean;
var
  name: String;
begin
  name := NameEdit.Text;

  if name.Length = 0 then
    begin
      ShowMessage('Введите название блюда');
      ValidateName := false;
      exit;
    end;

  ValidateName := true;
end;

function TDishesForm.ValidatePrice(): Boolean;
var
  price: Real;
begin
  if PriceEdit.GetTextLen = 0 then
    begin
      ShowMessage('Введите цену блюда');
      ValidatePrice := false;
      exit;
    end;


  if not IsFloat(PriceEdit.Text) then
    begin
      ShowMessage('Цена блюда должна быть числом');
      ValidatePrice := false;
      exit;
    end;

  price := strToFloat(PriceEdit.Text);

  if price <= 0 then
    begin
      ShowMessage('Цена блюда должна быть больше 0');
      ValidatePrice := false;
      exit;
    end;

  ValidatePrice := true;
end;

procedure TDishesForm.AddButtonClick(Sender: TObject);
var
  name: String;
  price: Real;
begin
  if not (ValidateName AND ValidatePrice) then
    exit;

  name := NameEdit.Text;
  price := strToFloat(PriceEdit.Text);

  DishesDataModule.AddQuery.Parameters.ParamByName('Name').Value := name;
  DishesDataModule.AddQuery.Parameters.ParamByName('Price').Value := price;

  DishesDataModule.AddQuery.ExecSQL;

  Refresh;
end;

procedure TDishesForm.UpdateButtonClick(Sender: TObject);
var
  name: String;
  price: Real;
begin
  if not (ValidateName AND ValidatePrice) then
    exit;

  name := NameEdit.Text;
  price := strToFloat(PriceEdit.Text);

  DishesDataModule.UpdateQuery.Parameters.ParamByName('Id').Value := SelectedDishId;
  DishesDataModule.UpdateQuery.Parameters.ParamByName('Name').Value := name;
  DishesDataModule.UpdateQuery.Parameters.ParamByName('Price').Value := price;

  DishesDataModule.UpdateQuery.ExecSQL;

  Refresh;
end;

procedure TDishesForm.DeleteButtonClick(Sender: TObject);
var
  id: Integer;
begin
  id := DishesDataModule.DisplayDataSource.DataSet.Fields[0].AsInteger;

  DishesDataModule.DeleteQuery.Parameters.ParamByName('Id').Value := id;

  DishesDataModule.DeleteQuery.ExecSQL;

  Refresh;
end;

procedure TDishesForm.DishesGridCellClick(Column: TColumn);
begin
  FillForm;
end;

end.
