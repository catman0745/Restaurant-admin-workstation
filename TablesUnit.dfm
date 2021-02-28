object TablesForm: TTablesForm
  Left = 0
  Top = 0
  Caption = #1057#1090#1086#1083#1080#1082#1080
  ClientHeight = 299
  ClientWidth = 226
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 135
    Top = 8
    Width = 79
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1089#1090#1086#1083#1080#1082#1072':'
  end
  object TablesDisplayGrid: TDBGrid
    Left = 8
    Top = 8
    Width = 113
    Height = 283
    DataSource = TablesDataModule.TablesDataSource
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = TablesDisplayGridCellClick
    Columns = <
      item
        Expanded = False
        FieldName = #1053#1086#1084#1077#1088
        Width = 38
        Visible = True
      end>
  end
  object AddButton: TButton
    Left = 135
    Top = 204
    Width = 79
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 1
    OnClick = AddButtonClick
  end
  object UpdateButton: TButton
    Left = 135
    Top = 235
    Width = 79
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 2
    OnClick = UpdateButtonClick
  end
  object DeleteButton: TButton
    Left = 135
    Top = 266
    Width = 79
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 3
    OnClick = DeleteButtonClick
  end
  object TableNumberEdit: TEdit
    Left = 135
    Top = 27
    Width = 79
    Height = 21
    TabOrder = 4
  end
end
