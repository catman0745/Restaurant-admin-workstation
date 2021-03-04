unit CheckReportFormUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxClass, frxPreview, frxDBSet;

type
  TCheckReportForm = class(TForm)
    ReportDataset: TfrxDBDataset;
    Report: TfrxReport;
    ReportPreview: TfrxPreview;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CheckReportForm: TCheckReportForm;

implementation

{$R *.dfm}

uses ShowChecksDataModuleUnit;

end.
