unit AssignationResportFormUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxClass, frxPreview, frxDBSet;

type
  TAssignationResportForm = class(TForm)
    ReportDBDataset: TfrxDBDataset;
    ReportPreview: TfrxPreview;
    Report: TfrxReport;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AssignationResportForm: TAssignationResportForm;

implementation

{$R *.dfm}

uses AssignationDataModuleUnit;

end.
