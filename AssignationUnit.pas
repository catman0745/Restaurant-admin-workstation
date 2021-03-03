unit AssignationUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.DBCtrls;

type
  TAssignationId = class
    DayOfWeek: Integer;
    Shift: Integer;
    WaiterId: Integer;
  end;

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
    ReportButton: TButton;
    function SelectedAssignationId(): TAssignationId;
    procedure FillFields();
    procedure RefreshList();
    function ValidateWeekday(): Boolean;
    function ValidateShift(): Boolean;
    function ValidateWaiterId(): Boolean;
    function AlreadyAssigned(weekday: Integer; shift: Integer; waiterId: Integer): Boolean;
    function WaiterWorkload(waiterId: Integer): Integer;
    procedure AssignButtonClick(Sender: TObject);
    procedure CancelAssigmentButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure ReportButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AssignationForm: TAssignationForm;

implementation

{$R *.dfm}

uses AssignationDataModuleUnit, AssignationResportFormUnit;

function TAssignationForm.SelectedAssignationId(): TAssignationId;
var
  assignationId: TAssignationId;
begin
  assignationId := TAssignationId.Create;

  assignationId.DayOfWeek := AssignationDataModule.ShowAssignationsDataSource.DataSet.Fields[0].AsInteger;
  assignationId.Shift := AssignationDataModule.ShowAssignationsDataSource.DataSet.Fields[2].AsInteger;
  assignationId.WaiterId := AssignationDataModule.ShowAssignationsDataSource.DataSet.Fields[3].AsInteger;

  SelectedAssignationId := assignationId;
end;

procedure TAssignationForm.FillFields();
begin
  if not AssignationDataModule.ShowAssignationsDataSource.DataSet.IsEmpty then
    begin
      WeekDayDBLookupComboBox.KeyValue := SelectedAssignationId.DayOfWeek;
      ShiftComboBox.ItemIndex := SelectedAssignationId.Shift - 1;
      WaiterDBLookupComboBox.KeyValue := SelectedAssignationId.WaiterId;
    end
  else
    begin
      WeekDayDBLookupComboBox.KeyValue := null;
      ShiftComboBox.ItemIndex := -1;
      WaiterDBLookupComboBox.KeyValue := null;
    end;
end;

procedure TAssignationForm.RefreshList();
begin
  AssignationDataModule.ShowAssignationsQuery.Active := false;
  AssignationDataModule.ShowAssignationsQuery.Active := true;
end;

procedure TAssignationForm.ReportButtonClick(Sender: TObject);
begin
  // show report
  AssignationResportForm.Show;
  AssignationResportForm.Report.ShowReport;
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
  if not (ValidateWeekday AND ValidateShift AND ValidateWaiterId) then exit;

  dayOfWeek := WeekDayDBLookupComboBox.KeyValue;
  shift := ShiftComboBox.ItemIndex + 1;
  waiterId := WaiterDBLookupComboBox.KeyValue;

  if AlreadyAssigned(dayOfWeek, shift, waiterId) then
    begin
      ShowMessage('Выбранный официант уже назначен на выбранную смену в этот день');
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
  FillFields;
end;

procedure TAssignationForm.CancelAssigmentButtonClick(Sender: TObject);
begin
  AssignationDataModule.CancelAssignationQuery.Parameters.ParamByName('Weekday').Value := SelectedAssignationId.DayOfWeek;
  AssignationDataModule.CancelAssignationQuery.Parameters.ParamByName('Shift').Value := SelectedAssignationId.Shift;
  AssignationDataModule.CancelAssignationQuery.Parameters.ParamByName('WaiterId').Value := SelectedAssignationId.WaiterId;

  AssignationDataModule.CancelAssignationQuery.ExecSQL;

  RefreshList;
  FillFields;
end;

procedure TAssignationForm.DBGrid1CellClick(Column: TColumn);
begin
  FillFields;
end;

procedure TAssignationForm.FormShow(Sender: TObject);
begin
  AssignationDataModule.WaitersTable.Active := False;
  AssignationDataModule.WaitersTable.Active := True;

  RefreshList;
  FillFields;
end;

end.
