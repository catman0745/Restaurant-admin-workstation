﻿unit ShowChecksFormUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids;

type
  TShowChecksForm = class(TForm)
    DBGrid1: TDBGrid;
    Label1: TLabel;
    OrderComboBox: TComboBox;
    PayCheckButton: TButton;
    ReportButton: TButton;
    procedure OrderComboBoxChange(Sender: TObject);
    procedure SetDefaultState;
    procedure FormShow(Sender: TObject);
    procedure PayCheckButtonClick(Sender: TObject);
    procedure RefreshList();
    procedure SortList();
    procedure ReportButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ShowChecksForm: TShowChecksForm;

implementation

{$R *.dfm}

uses ShowChecksDataModuleUnit, CheckReportFormUnit;

procedure TShowChecksForm.RefreshList();
begin
  ShowChecksDataModule.ShowChecksQuery.Active := false;
  ShowChecksDataModule.ShowChecksQuery.Active := true;
end;

procedure TShowChecksForm.ReportButtonClick(Sender: TObject);
var
  selectedCheckId: Integer;
begin
  ShowChecksDataModule.ReportQuery.Close;
  selectedCheckId := ShowChecksDataModule.ShowChecksDataSource.DataSet.Fields[0].AsInteger;
  ShowChecksDataModule.ReportQuery.Parameters.ParamByName('CheckId').Value := selectedCheckId;
  ShowChecksDataModule.ReportQuery.Open;

  CheckReportForm.Show;
  CheckReportForm.Report.ShowReport;
end;

procedure TShowChecksForm.SortList();
begin
  case OrderComboBox.ItemIndex of
    0: ShowChecksDataModule.ShowChecksQuery.Sort := '[Дата и время оформления] DESC';
    1: ShowChecksDataModule.ShowChecksQuery.Sort := '[Дата и время оформления]';
    2: ShowChecksDataModule.ShowChecksQuery.Sort := 'Оплачен DESC';
    3: ShowChecksDataModule.ShowChecksQuery.Sort := 'Оплачен';
    4: ShowChecksDataModule.ShowChecksQuery.Sort := '[Стоимость в чеке]';
    5: ShowChecksDataModule.ShowChecksQuery.Sort := '[Стоимость в чеке] DESC';
  end;
end;

procedure TShowChecksForm.SetDefaultState();
begin
  ShowChecksDataModule.ShowChecksQuery.Sort := '[Дата и время оформления] DESC';
  OrderComboBox.ItemIndex := 0;
end;

procedure TShowChecksForm.PayCheckButtonClick(Sender: TObject);
var
  checkId: Integer;
begin
  checkId := ShowChecksDataModule.ShowChecksDataSource.DataSet.Fields[0].AsInteger;

  ShowChecksDataModule.CloseCheckQuery.Parameters.ParamByName('CheckId').Value := checkId;
  ShowChecksDataModule.CloseCheckQuery.ExecSQL;

  RefreshList;
  SortList;
end;

procedure TShowChecksForm.FormShow(Sender: TObject);
begin
  RefreshList;
  SetDefaultState;
end;

procedure TShowChecksForm.OrderComboBoxChange(Sender: TObject);
begin
  SortList;
end;

end.
