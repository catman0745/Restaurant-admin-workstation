unit WaitersUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.DBCtrls;

type
  TWaitersForm = class(TForm)
    DisplayGrid: TDBGrid;
    NameEdit: TEdit;
    Label1: TLabel;
    AddButton: TButton;
    UpdateButton: TButton;
    DeleteButton: TButton;
    procedure RefreshList();
    function ValidateName(): Boolean;
    procedure AddButtonClick(Sender: TObject);
    procedure UpdateButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure DisplayGridCellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WaitersForm: TWaitersForm;
  SelectedWaiterId: Integer;

implementation

{$R *.dfm}

uses WaitersDataModuleUnit;

procedure TWaitersForm.RefreshList();
begin
  WaitersDataModule.WaitersTable.Active := false;
  WaitersDataModule.WaitersTable.Active := true;
end;

function TWaitersForm.ValidateName(): Boolean;
var
  name: String;
begin
  name := NameEdit.Text;

  if name.Length = 0 then
    begin
      ShowMessage('Введите ФИО официанта');
      ValidateName := false;
      exit;
    end;

  ValidateName := true;
end;

procedure TWaitersForm.AddButtonClick(Sender: TObject);
var
  name: String;
begin
  if not ValidateName then
    exit;

  name := NameEdit.Text;

  WaitersDataModule.AddQuery.Parameters.ParamByName('Name').Value := name;

  WaitersDataModule.AddQuery.ExecSQL;

  RefreshList;
end;

procedure TWaitersForm.UpdateButtonClick(Sender: TObject);
var
  name: String;
begin
  if not ValidateName then
    exit;

  name := NameEdit.Text;

  WaitersDataModule.UpdateQuery.Parameters.ParamByName('Id').Value := SelectedWaiterId;
  WaitersDataModule.UpdateQuery.Parameters.ParamByName('Name').Value := name;

  WaitersDataModule.UpdateQuery.ExecSQL;

  RefreshList;
end;

procedure TWaitersForm.DeleteButtonClick(Sender: TObject);
begin
  WaitersDataModule.DeleteQuery.Parameters.ParamByName('Id').Value := SelectedWaiterId;

  WaitersDataModule.DeleteQuery.ExecSQL;

  RefreshList;
end;

procedure TWaitersForm.DisplayGridCellClick(Column: TColumn);
var
  name: String;
begin
  SelectedWaiterId := WaitersDataModule.DisplayDataSource.DataSet.Fields[0].AsInteger;
  name := WaitersDataModule.DisplayDataSource.DataSet.Fields[1].AsString;

  NameEdit.Text := name;
end;

end.
