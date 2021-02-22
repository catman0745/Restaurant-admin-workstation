unit WaitersUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.DBCtrls;

type
  TWaitersForm = class(TForm)
    DBGrid1: TDBGrid;
    NameEdit: TEdit;
    Label1: TLabel;
    ModeComboBox: TComboBox;
    Label2: TLabel;
    ActionButton: TButton;
    Label3: TLabel;
    IdDBLookupComboBox: TDBLookupComboBox;
    procedure SetDefaultState();
    procedure AddMode();
    procedure EditMode();
    procedure DeleteMode();
    procedure RefreshList();
    function ValidateWaiterId(): Boolean;
    function ValidateWaiterName(): Boolean;
    procedure ModeComboBoxChange(Sender: TObject);
    procedure ActionButtonClick(Sender: TObject);
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

procedure TWaitersForm.SetDefaultState();
begin
  IdDBLookupComboBox.KeyValue := null;
  IdDBLookupComboBox.Enabled := false;

  NameEdit.Enabled := false;

  ActionButton.Visible := false;
end;

procedure TWaitersForm.AddMode();
begin
  IdDBLookupComboBox.KeyValue := null;
  IdDBLookupComboBox.Enabled := false;

  NameEdit.Text := '';
  NameEdit.Enabled := true;

  ActionButton.Caption := 'Зарегистрировать';
  ActionButton.Visible := true;
end;

procedure TWaitersForm.EditMode();
begin
  IdDBLookupComboBox.KeyValue := null;
  IdDBLookupComboBox.Enabled := true;

  NameEdit.Text := '';
  NameEdit.Enabled := true;

  ActionButton.Caption := 'Сохранить изменения';
  ActionButton.Visible := true;
end;

procedure TWaitersForm.DeleteMode();
begin
  IdDBLookupComboBox.KeyValue := null;
  IdDBLookupComboBox.Enabled := true;

  NameEdit.Text := '';
  NameEdit.Enabled := false;

  ActionButton.Caption := 'Уволить';
  ActionButton.Visible := true;
end;

function TWaitersForm.ValidateWaiterId(): Boolean;
begin
  if IdDBLookupComboBox.KeyValue = null then
    begin
      ShowMessage('Выберите официанта');
      ValidateWaiterId := false;
    end
  else
    ValidatewaiterId := true;
end;

function TWaitersForm.ValidateWaiterName(): Boolean;
begin
  if NameEdit.GetTextLen = 0 then
    begin
      ShowMessage('Введите имя официанта');
      ValidateWaiterName := false;
    end
  else
    ValidateWaiterName := true;
end;

procedure TWaitersForm.RefreshList();
begin
  WaitersDataModule.WaitersTable.Active := false;
  WaitersDataModule.WaitersTable.Active := true;
end;

procedure TWaitersForm.FormShow(Sender: TObject);
begin
  SetDefaultState();
end;

procedure TWaitersForm.ModeComboBoxChange(Sender: TObject);
begin
  case ModeComboBox.ItemIndex of
    0: AddMode();
    1: EditMode();
    2: DeleteMode();
  end;
end;

procedure TWaitersForm.ActionButtonClick(Sender: TObject);
begin
  case ModeComboBox.ItemIndex of
    0:
      begin
        if ValidateWaiterName then
          begin
            WaitersDataModule.InsertQuery.Parameters.ParamByName('Name').Value := NameEdit.Text;
            WaitersDataModule.InsertQuery.ExecSQL;
          end;
      end;
    1:
      begin
        if ValidateWaiterId AND ValidateWaiterName then
          begin
            WaitersDataModule.UpdateQuery.Parameters.ParamByName('Id').Value := IdDBLookupComboBox.KeyValue;
            WaitersDataModule.UpdateQuery.Parameters.ParamByName('Name').Value := NameEdit.Text;
            WaitersDataModule.UpdateQuery.ExecSQL;
          end;
      end;
    2:
      begin
        if ValidateWaiterId then
          begin
            WaitersDataModule.DeleteQuery.Parameters.ParamByName('Id').Value := IdDBLookupComboBox.KeyValue;
            WaitersDataModule.DeleteQuery.ExecSQL;
          end;
      end;
  end;

  RefreshList;
end;

end.
