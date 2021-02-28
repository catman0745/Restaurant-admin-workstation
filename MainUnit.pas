unit MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids;

type
  TMainForm = class(TForm)
    RegisterNewCheckButton: TButton;
    ManageDishesButton: TButton;
    ShowCkecksButton: TButton;
    WaitersButton: TButton;
    AssignationsButton: TButton;
    TablesDisplayGrid: TDBGrid;
    ReserveTableButton: TButton;
    TableIsOccupiedButton: TButton;
    TableIsEmptyButton: TButton;
    Button1: TButton;
    procedure RefreshTablesList();
    function SelectedTableId(): Integer;
    function SelectedTableNumber(): Integer;
    function TableStatus(tableId: Integer): String;
    procedure RegisterNewCheckButtonClick(Sender: TObject);
    procedure ManageDishesButtonClick(Sender: TObject);
    procedure ShowCkecksButtonClick(Sender: TObject);
    procedure WaitersButtonClick(Sender: TObject);
    procedure AssignationsButtonClick(Sender: TObject);
    procedure ReserveTableButtonClick(Sender: TObject);
    procedure TableIsOccupiedButtonClick(Sender: TObject);
    procedure TableIsEmptyButtonClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses CreateCheckUnit, DishesUnit, ShowChecksFormUnit, WaitersUnit,
  AssignationUnit, MainDataModuleUnit, TablesUnit;

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

function ValidateTime(time: String): Boolean;
var
  hoursString, minutesString: String;
  hours, minutes: Integer;
  invalidFormatMessage: String;
begin
  invalidFormatMessage := 'Время должно быть в формате "Часы:Минуты", например 01:59 или 23:05';

  if (time.Length <> 5) OR (pos(time, ':') < 0) then
    begin
      ShowMessage(invalidFormatMessage);
      ValidateTime := false;
      exit;
    end;

  hoursString := copy(time, 1, 2);
  minutesString := copy(time, 4, 2);

  if not (IsNonNegativeInteger(hoursString) AND IsNonNegativeInteger(minutesString)) then
    begin
      ShowMessage(invalidFormatMessage);
      ValidateTime := false;
      exit;
    end;

  hours := strToInt(hoursString);
  minutes := strToInt(minutesString);

  if not ((hours < 24) AND (minutes < 60)) then
    begin
      ShowMessage(invalidFormatMessage);
      ValidateTime := false;
      exit;
    end;

  ValidateTime := true;
end;

procedure TMainForm.RefreshTablesList();
begin
  MainDataModule.DisplayTablesQuery.Active := false;
  MainDataModule.DisplayTablesQuery.Active := true;
end;

function TMainForm.SelectedTableId(): Integer;
begin
  SelectedTableId := MainDataModule.DisplayTablesDataSource.DataSet.Fields[0].AsInteger;
end;

function TMainForm.SelectedTableNumber(): Integer;
begin
  SelectedTableNumber := MainDataModule.DisplayTablesDataSource.DataSet.Fields[1].AsInteger;
end;

function TMainForm.TableStatus(tableId: Integer): String;
begin
  MainDataModule.TableStatusQuery.Parameters.ParamByName('Id').Value := tableId;
  MainDataModule.TableStatusQuery.Open;

  TableStatus := MainDataModule.TableStatusQuery.Fields.FieldByName('Статус').AsString;

  MainDataModule.TableStatusQuery.Close;
end;

procedure TMainForm.ReserveTableButtonClick(Sender: TObject);
var
  status, time: String;
  confirmed: Boolean;
begin
  status := TableStatus(SelectedTableId);
  if status = 'Зарезервирован' then
    begin
      ShowMessage('Столик №' + intToStr(SelectedTableNumber) + ' уже зарезервирован');
      exit;
    end
  else if status = 'Занят' then
    begin
      ShowMessage('Столик №' + intToStr(SelectedTableNumber) + ' уже занят');
      exit;
    end;

  confirmed := InputQuery('Резервация столика', 'Время:', time);

  if not (confirmed AND ValidateTime(time)) then
    exit;

  MainDataModule.ReserveTableQuery.Parameters.ParamByName('Id').Value := SelectedTableId;
  MainDataModule.ReserveTableQuery.Parameters.ParamByName('Time').Value := time;

  MainDataModule.ReserveTableQuery.ExecSQL;
  RefreshTablesList;

  ShowMessage('Столик №' + intToStr(SelectedTableNumber) + ' зарезервирован на ' + time);
end;

procedure TMainForm.TableIsOccupiedButtonClick(Sender: TObject);
begin
  if TableStatus(SelectedTableId) = 'Занят' then
    begin
      ShowMessage('Столик №' + intToStr(SelectedTableNumber) + ' уже занят');
      exit;
    end;

  MainDataModule.OccupyTableQuery.Parameters.ParamByName('Id').Value := SelectedTableId;

  MainDataModule.OccupyTableQuery.ExecSQL;
  RefreshTablesList;
end;

procedure TMainForm.TableIsEmptyButtonClick(Sender: TObject);
begin
  MainDataModule.EmptyTableQuery.Parameters.ParamByName('Id').Value := SelectedTableId;

  MainDataModule.EmptyTableQuery.ExecSQL;
  RefreshTablesList;
end;

procedure TMainForm.AssignationsButtonClick(Sender: TObject);
begin
  AssignationForm.Show;
end;

procedure TMainForm.ShowCkecksButtonClick(Sender: TObject);
begin
  ShowChecksForm.Show;
end;

procedure TMainForm.Button1Click(Sender: TObject);
begin
  TablesForm.Show;
end;

procedure TMainForm.ManageDishesButtonClick(Sender: TObject);
begin
  DishesForm.Show
end;

procedure TMainForm.RegisterNewCheckButtonClick(Sender: TObject);
begin
  CreateCheckForm.Show
end;

procedure TMainForm.WaitersButtonClick(Sender: TObject);
begin
  WaitersForm.Show;
end;

end.
