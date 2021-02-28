object CreateCheckForm: TCreateCheckForm
  Left = 0
  Top = 0
  Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103' '#1085#1086#1074#1086#1075#1086' '#1095#1077#1082#1072
  ClientHeight = 411
  ClientWidth = 569
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 64
    Width = 74
    Height = 13
    Caption = #1041#1083#1102#1076#1072' '#1074' '#1095#1077#1082#1077':'
  end
  object Label2: TLabel
    Left = 423
    Top = 123
    Width = 38
    Height = 13
    Caption = #1041#1083#1102#1076#1086':'
  end
  object Label4: TLabel
    Left = 423
    Top = 169
    Width = 64
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086':'
    FocusControl = CountDBEdit
  end
  object CheckSummaryLabel: TLabel
    Left = 8
    Top = 299
    Width = 100
    Height = 13
    Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100' '#1087#1086' '#1095#1077#1082#1091':'
  end
  object Label3: TLabel
    Left = 127
    Top = 13
    Width = 79
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1089#1090#1086#1083#1080#1082#1072':'
  end
  object OpenCheckButton: TButton
    Left = 8
    Top = 8
    Width = 113
    Height = 21
    Caption = #1054#1090#1082#1088#1099#1090#1100' '#1085#1086#1074#1099#1081' '#1095#1077#1082
    TabOrder = 0
    OnClick = OpenCheckButtonClick
  end
  object CheckDishesDBGrid: TDBGrid
    Left = 8
    Top = 83
    Width = 409
    Height = 207
    DataSource = CreateCheckDataModule.DishInCheckDataSource
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object SaveCheckButton: TButton
    Left = 8
    Top = 380
    Width = 81
    Height = 25
    Caption = #1055#1088#1086#1074#1077#1089#1090#1080' '#1095#1077#1082
    TabOrder = 2
    OnClick = SaveCheckButtonClick
  end
  object CheckIdDBEdit: TDBEdit
    Left = 423
    Top = 96
    Width = 134
    Height = 21
    DataField = #1063#1077#1082
    DataSource = CreateCheckDataModule.DishInCheckDataSource2
    TabOrder = 3
    Visible = False
  end
  object CountDBEdit: TDBEdit
    Left = 423
    Top = 188
    Width = 134
    Height = 21
    DataField = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
    DataSource = CreateCheckDataModule.DishInCheckDataSource2
    TabOrder = 4
  end
  object AddDishButton: TButton
    Left = 423
    Top = 215
    Width = 134
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1073#1083#1102#1076#1086' '#1074' '#1095#1077#1082
    TabOrder = 5
    OnClick = AddDishButtonClick
  end
  object DishIdDBLookupComboBox: TDBLookupComboBox
    Left = 423
    Top = 142
    Width = 134
    Height = 21
    DataField = #1041#1083#1102#1076#1086
    DataSource = CreateCheckDataModule.DishInCheckDataSource2
    KeyField = #1050#1086#1076
    ListField = #1053#1072#1079#1074#1072#1085#1080#1077
    ListSource = CreateCheckDataModule.DishesDataSource
    TabOrder = 6
  end
  object CancelButton: TButton
    Left = 95
    Top = 380
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1080#1090#1100
    TabOrder = 7
    OnClick = CancelButtonClick
  end
  object CheckSummaryEdit: TEdit
    Left = 114
    Top = 296
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 8
  end
  object TableIdDBLookupComboBox: TDBLookupComboBox
    Left = 212
    Top = 8
    Width = 53
    Height = 21
    KeyField = #1050#1086#1076
    ListField = #1053#1086#1084#1077#1088
    ListSource = CreateCheckDataModule.TablesDataSource
    TabOrder = 9
  end
end
