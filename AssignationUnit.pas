unit AssignationUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.DBCtrls;

type
  TAssignationForm = class(TForm)
    DBGrid1: TDBGrid;
    WeekDayDBLookupComboBox: TDBLookupComboBox;
    WaiterDBLookupComboBox: TDBLookupComboBox;
    ShiftComboBox: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    AssignButton: TButton;
    CancelAssigmentButton: TButton;
    procedure RefreshList();
    function ValidateWeekday(): Boolean;
    function ValidateShift(): Boolean;
    function ValidateWaiterId(): Boolean;
    function AlreadyAssigned(weekday: Integer; shift: Integer; waiterId: Integer): Boolean;
    function WaiterWorkload(waiterId: Integer): Integer;
    procedure AssignButtonClick(Sender: TObject);
    procedure CancelAssigmentButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AssignationForm: TAssignationForm;

implementation

{$R *.dfm}

uses AssignationDataModuleUnit;

procedure TAssignationForm.RefreshList();
begin
  AssignationDataModule.ShowAssignationsQuery.Active := false;
  AssignationDataModule.ShowAssignationsQuery.Active := true;
end;

function TAssignationForm.ValidateWeekday(): Boolean;
begin
  if WeekDayDBLookupComboBox.KeyValue = null then
    begin
      ShowMessage('Выберите день недели');
      ValidateWeekday := false;
    end
  else ValidateWeekDay := true;
end;

function TAssignationForm.ValidateShift(): Boolean;
begin
  if ShiftComboBox.ItemIndex = -1 then
    begin
      ShowMessage('Выберите смену');
      ValidateShift := false;
    end
  else ValidateShift := true;
end;

function TAssignationForm.ValidateWaiterId(): Boolean;
begin
  if WaiterDBLookupComboBox.KeyValue = null then
    begin
      ShowMessage('Выберите официанта');
      ValidateWaiterId := false;
    end
  else ValidateWaiterId := true;
end;

function TAssignationForm.AlreadyAssigned(weekday: Integer; shift: Integer; waiterId: Integer): Boolean;
begin
  AssignationDataModule.AlreadyAssignedCheckQuery.Parameters.ParamByName('Weekday').Value := weekday;
  AssignationDataModule.AlreadyAssignedCheckQuery.Parameters.ParamByName('Shift').Value := shift;
  AssignationDataModule.AlreadyAssignedCheckQuery.Parameters.ParamByName('WaiterId').Value := waiterId;
  AssignationDataModule.AlreadyAssignedCheckQuery.Open;

  AlreadyAssigned := AssignationDataModule.AlreadyAssignedCheckQuery.Fields.FieldByName('Сколько раз назначен').AsInteger = 1;

  AssignationDataModule.AlreadyAssignedCheckQuery.Close;
end;

function TAssignationForm.WaiterWorkload(waiterId: Integer): Integer;
begin
  AssignationDataModule.WorkloadQuery.Parameters.ParamByName('WaiterId').Value := waiterId;
  AssignationDataModule.WorkloadQuery.Open;

  WaiterWorkload := AssignationDataModule.WorkloadQuery.Fields.FieldByName('Количество смен').AsInteger;

  AssignationDataModule.WorkloadQuery.Close;
end;

procedure TAssignationForm.AssignButtonClick(Sender: TObject);
var
  dayOfWeek, shift, waiterId: Integer;
begin
  if ValidateWeekday AND ValidateShift AND ValidateWaiterId then
    begin
      dayOfWeek := WeekDayDBLookupComboBox.KeyValue;
      shift := ShiftComboBox.ItemIndex + 1;
      waiterId := WaiterDBLookupComboBox.KeyValue;

      if AlreadyAssigned(dayOfWeek, shift, waiterId) then
        begin
          ShowMessage('Официант уже назначен на выбранную смену в этот день');
          exit;
        end;
      if WaiterWorkload(waiterId) >= 6 then
        begin
          ShowMessage('Официант не может работать больше 48-ми часов (6 смен) в неделю');
          exit;
        end;

      AssignationDataModule.AssignQuery.Parameters.ParamByName('Weekday').Value := dayOfWeek;
      AssignationDataModule.AssignQuery.Parameters.ParamByName('Shift').Value := shift;
      AssignationDataModule.AssignQuery.Parameters.ParamByName('WaiterId').Value := waiterId;

      AssignationDataModule.AssignQuery.ExecSQL;
      RefreshList();
    end;
end;

procedure TAssignationForm.CancelAssigmentButtonClick(Sender: TObject);
var
  dayOfWeek, shift, waiterId: Integer;
begin
  dayOfWeek := AssignationDataModule.ShowAssignationsDataSource.DataSet.Fields[0].AsInteger;
  shift := AssignationDataModule.ShowAssignationsDataSource.DataSet.Fields[2].AsInteger;
  waiterId := AssignationDataModule.ShowAssignationsDataSource.DataSet.Fields[3].AsInteger;

  AssignationDataModule.CancelAssignationQuery.Parameters.ParamByName('Weekday').Value := dayOfWeek;
  AssignationDataModule.CancelAssignationQuery.Parameters.ParamByName('Shift').Value := shift;
  AssignationDataModule.CancelAssignationQuery.Parameters.ParamByName('WaiterId').Value := waiterId;

  AssignationDataModule.CancelAssignationQuery.ExecSQL;
  RefreshList;
end;

end.
