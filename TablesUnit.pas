unit TablesUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids;

type
  TTablesForm = class(TForm)
    TablesDisplayGrid: TDBGrid;
    AddButton: TButton;
    UpdateButton: TButton;
    DeleteButton: TButton;
    Label1: TLabel;
    TableNumberEdit: TEdit;
    procedure RefreshList();
    procedure TablesDisplayGridCellClick(Column: TColumn);
    procedure FillFields();
    function SelectedTableId(): Integer;
    function SelectedTableNumber(): Integer;
    function ValidateTableNumber(): Boolean;
    function IsTableNumberUnique(tableNumber: Integer; exceptionTableId: Integer): Boolean;
    procedure AddButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure UpdateButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TablesForm: TTablesForm;

implementation

{$R *.dfm}

uses TablesDataModuleUnit, MainDataModuleUnit;

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

procedure TTablesForm.RefreshList();
begin
  TablesDataModule.TablesTable.Active := False;
  TablesDataModule.TablesTable.Active := True;

  MainDataModule.DisplayTablesQuery.Active := False;
  MainDataModule.DisplayTablesQuery.Active := True;
end;

procedure TTablesForm.FillFields();
begin
  if not TablesDataModule.TablesDataSource.DataSet.IsEmpty then
    TableNumberEdit.Text := IntToStr(SelectedTableNumber)
  else
    TableNumberEdit.Text := '';
end;

function TTablesForm.IsTableNumberUnique(tableNumber: Integer; exceptionTableId: Integer): Boolean;
var
  isUnique: Boolean;
begin
  TablesDataModule.TableNumberUniquenessCheckQuery.Parameters.ParamByName('ExceptionId').Value := exceptionTableId;
  TablesDataModule.TableNumberUniquenessCheckQuery.Parameters.ParamByName('TableNumber').Value := tableNumber;
  TablesDataModule.TableNumberUniquenessCheckQuery.Open;

  isUnique := TablesDataModule.TableNumberUniquenessCheckQuery.Fields.FieldByName('Количество столиков с таким номером').AsInteger = 0;

  TablesDataModule.TableNumberUniquenessCheckQuery.Close;

  if isUnique then
    IsTableNumberUnique := True
  else
    begin
      ShowMessage('Столик с таким номером уже существует');
      IsTableNumberUnique := False;
    end;
end;

function TTablesForm.ValidateTableNumber(): Boolean;
begin
  if TableNumberEdit.GetTextLen = 0 then
    begin
      ShowMessage('Укажите номер столика');
      ValidateTableNumber := False;
      exit;
    end;

  if not ((IsNonNegativeInteger(TableNumberEdit.Text)) AND (StrToInt(TableNumberEdit.Text) > 0)) then
    begin
      ShowMessage('Номер столика должен быть положительным числом');
      ValidateTableNumber := False;
      exit;
    end;

  ValidateTableNumber := True;
end;

procedure TTablesForm.AddButtonClick(Sender: TObject);
var
  tableNumber: Integer;
begin
  if not ValidateTableNumber then exit;

  tableNumber := StrToInt(TableNumberEdit.Text);
  if not IsTableNumberUnique(tableNumber, -1) then exit;

  TablesDataModule.AddQuery.Parameters.ParamByName('TableNumber').Value := tableNumber;
  TablesDataModule.AddQuery.ExecSQL;

  RefreshList;
  FillFields;
end;

procedure TTablesForm.UpdateButtonClick(Sender: TObject);
var
  tableNumber: Integer;
begin
  if not ValidateTableNumber then exit;

  tableNumber := StrToInt(TableNumberEdit.Text);
  if not IsTableNumberUnique(tableNumber, SelectedTableId) then exit;

  TablesDataModule.UpdateQuery.Parameters.ParamByName('TableId').Value := SelectedTableId;
  TablesDataModule.UpdateQuery.Parameters.ParamByName('TableNumber').Value := tableNumber;
  TablesDataModule.UpdateQuery.ExecSQL;

  RefreshList;
  FillFields;
end;

procedure TTablesForm.DeleteButtonClick(Sender: TObject);
begin
  TablesDataModule.DeleteQuery.Parameters.ParamByName('TableId').Value := SelectedTableId;
  TablesDataModule.DeleteQuery.ExecSQL;

  RefreshList;
  FillFields;
end;

function TTablesForm.SelectedTableId(): Integer;
begin
  SelectedTableId := TablesDataModule.TablesDataSource.DataSet.Fields[0].AsInteger;
end;

function TTablesForm.SelectedTableNumber(): Integer;
begin
  SelectedTableNumber := TablesDataModule.TablesDataSource.DataSet.Fields[1].AsInteger;
end;

procedure TTablesForm.TablesDisplayGridCellClick(Column: TColumn);
begin
  FillFields;
end;

procedure TTablesForm.FormShow(Sender: TObject);
begin
  FillFields;
end;

end.
