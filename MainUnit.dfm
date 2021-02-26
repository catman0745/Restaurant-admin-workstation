object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = #1040#1056#1052' '#1072#1076#1084#1080#1085#1080#1089#1090#1088#1072#1090#1086#1088#1072' '#1088#1077#1089#1090#1086#1088#1072#1085#1072
  ClientHeight = 353
  ClientWidth = 529
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RegisterNewCheckButton: TButton
    Left = 407
    Top = 8
    Width = 114
    Height = 25
    Caption = #1055#1088#1086#1074#1077#1089#1090#1080' '#1095#1077#1082
    TabOrder = 0
    OnClick = RegisterNewCheckButtonClick
  end
  object ManageDishesButton: TButton
    Left = 407
    Top = 155
    Width = 114
    Height = 25
    Caption = #1059#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1084#1077#1085#1102
    TabOrder = 2
    OnClick = ManageDishesButtonClick
  end
  object ShowCkecksButton: TButton
    Left = 407
    Top = 39
    Width = 114
    Height = 25
    Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1095#1077#1082#1086#1074
    TabOrder = 1
    OnClick = ShowCkecksButtonClick
  end
  object WaitersButton: TButton
    Left = 407
    Top = 262
    Width = 114
    Height = 25
    Caption = #1054#1092#1080#1094#1080#1072#1085#1090#1099
    TabOrder = 3
    OnClick = WaitersButtonClick
  end
  object AssignationsButton: TButton
    Left = 407
    Top = 293
    Width = 114
    Height = 25
    Caption = #1043#1088#1072#1092#1080#1082' '#1088#1072#1073#1086#1090#1099
    TabOrder = 4
    OnClick = AssignationsButtonClick
  end
  object TablesDisplayGrid: TDBGrid
    Left = 8
    Top = 8
    Width = 369
    Height = 310
    DataSource = MainDataModule.DisplayTablesDataSource
    ReadOnly = True
    TabOrder = 8
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
        Visible = True
      end
      item
        Expanded = False
        FieldName = #1057#1090#1072#1090#1091#1089
        Width = 200
        Visible = True
      end>
  end
  object ReserveTableButton: TButton
    Left = 8
    Top = 324
    Width = 145
    Height = 25
    Caption = #1047#1072#1088#1077#1079#1077#1088#1074#1080#1088#1086#1074#1072#1090#1100' '#1089#1090#1086#1083#1080#1082
    TabOrder = 5
    OnClick = ReserveTableButtonClick
  end
  object TableIsOccupiedButton: TButton
    Left = 159
    Top = 324
    Width = 90
    Height = 25
    Caption = #1057#1090#1086#1083#1080#1082' '#1079#1072#1085#1103#1090
    TabOrder = 6
    OnClick = TableIsOccupiedButtonClick
  end
  object TableIsEmptyButton: TButton
    Left = 255
    Top = 324
    Width = 122
    Height = 25
    Caption = #1057#1090#1086#1083#1080#1082' '#1086#1089#1074#1086#1073#1086#1076#1080#1083#1089#1103
    TabOrder = 7
    OnClick = TableIsEmptyButtonClick
  end
end
