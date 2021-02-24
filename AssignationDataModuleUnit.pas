unit AssignationDataModuleUnit;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TAssignationDataModule = class(TDataModule)
    ShowAssignationsQuery: TADOQuery;
    ShowAssignationsDataSource: TDataSource;
    WaitersTable: TADOTable;
    WeekdaysTable: TADOTable;
    WaitersDataSource: TDataSource;
    WeekdaysDataSource: TDataSource;
    AssignQuery: TADOQuery;
    CancelAssignationQuery: TADOQuery;
    WorkloadQuery: TADOQuery;
    AlreadyAssignedCheckQuery: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AssignationDataModule: TAssignationDataModule;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses MainDataModuleUnit;

{$R *.dfm}

end.
