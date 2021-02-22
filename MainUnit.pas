unit MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TMainForm = class(TForm)
    RegisterNewCheckButton: TButton;
    ManageDishesButton: TButton;
    Button1: TButton;
    WaitersButton: TButton;
    AssignationsButton: TButton;
    procedure RegisterNewCheckButtonClick(Sender: TObject);
    procedure ManageDishesButtonClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure WaitersButtonClick(Sender: TObject);
    procedure AssignationsButtonClick(Sender: TObject);
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
  AssignationUnit;

procedure TMainForm.AssignationsButtonClick(Sender: TObject);
begin
  AssignationForm.Show;
end;

procedure TMainForm.Button1Click(Sender: TObject);
begin
  ShowChecksForm.Show;
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
