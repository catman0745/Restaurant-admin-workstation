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
    function SelectedWaiterId(): Integer;
    procedure RefreshList();
    procedure FillFields();
    function ValidateName(): Boolean;
    procedure AddButtonClick(Sender: TObject);
    procedure UpdateButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure DisplayGridCellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WaitersForm: TWaitersForm;

implementation

{$R *.dfm}

uses WaitersDataModuleUnit;

procedure TWaitersForm.RefreshList();
begin
  WaitersDataModule.WaitersQuery.Active := false;
  WaitersDataModule.WaitersQuery.Active := true;
end;

procedure TWaitersForm.FillFields();
begin
  if not WaitersDataModule.DisplayDataSource.DataSet.IsEmpty then
    NameEdit.Text := WaitersDataModule.DisplayDataSource.DataSet.Fields[1].AsString
  else
    NameEdit.Text := '';
end;

function TWaitersForm.SelectedWaiterId(): Integer;
begin
  SelectedWaiterId := WaitersDataModule.DisplayDataSource.DataSet.Fields[0].AsInteger;
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
  FillFields;
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
  FillFields;
end;

procedure TWaitersForm.DeleteButtonClick(Sender: TObject);
begin
  WaitersDataModule.DeleteQuery.Parameters.ParamByName('Id').Value := SelectedWaiterId;

  WaitersDataModule.DeleteQuery.ExecSQL;

  RefreshList;
  FillFields;
end;

procedure TWaitersForm.DisplayGridCellClick(Column: TColumn);
begin
  FillFields;
end;

procedure TWaitersForm.FormShow(Sender: TObject);
begin
  FillFields;
end;

end.
