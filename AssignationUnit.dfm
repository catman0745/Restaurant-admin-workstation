object AssignationForm: TAssignationForm
  Left = 0
  Top = 0
  Caption = #1056#1072#1089#1087#1080#1089#1072#1085#1080#1077' '#1088#1072#1073#1086#1090#1099' '#1086#1092#1080#1094#1080#1072#1085#1090#1086#1074
  ClientHeight = 299
  ClientWidth = 596
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
    Left = 399
    Top = 64
    Width = 69
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1089#1084#1077#1085#1099':'
  end
  object Label2: TLabel
    Left = 399
    Top = 8
    Width = 70
    Height = 13
    Caption = #1044#1077#1085#1100' '#1085#1077#1076#1077#1083#1080':'
  end
  object Label3: TLabel
    Left = 399
    Top = 118
    Width = 52
    Height = 13
    Caption = #1054#1092#1080#1094#1080#1072#1085#1090
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 385
    Height = 283
    DataSource = AssignationDataModule.ShowAssignationsDataSource
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = #1044#1077#1085#1100'  '#1085#1077#1076#1077#1083#1080
        Visible = True
      end
      item
        Expanded = False
        FieldName = #1053#1086#1084#1077#1088' '#1089#1084#1077#1085#1099
        Visible = True
      end
      item
        Expanded = False
        FieldName = #1054#1092#1080#1094#1080#1072#1085#1090
        Visible = True
      end>
  end
  object WeekDayDBLookupComboBox: TDBLookupComboBox
    Left = 399
    Top = 27
    Width = 187
    Height = 21
    KeyField = #1053#1086#1084#1077#1088' '#1087#1086' '#1087#1086#1088#1103#1076#1082#1091
    ListField = #1053#1072#1079#1074#1072#1085#1080#1077
    ListSource = AssignationDataModule.WeekdaysDataSource
    TabOrder = 1
  end
  object WaiterDBLookupComboBox: TDBLookupComboBox
    Left = 399
    Top = 137
    Width = 187
    Height = 21
    KeyField = #1051#1080#1095#1085#1099#1081' '#1085#1086#1084#1077#1088
    ListField = #1060#1048#1054
    ListSource = AssignationDataModule.WaitersDataSource
    TabOrder = 2
  end
  object ShiftComboBox: TComboBox
    Left = 399
    Top = 83
    Width = 187
    Height = 21
    Style = csDropDownList
    TabOrder = 3
    Items.Strings = (
      '1 ('#1044#1085#1077#1074#1085#1072#1103' '#1089#1084#1077#1085#1072')'
      '2 ('#1053#1086#1095#1085#1072#1103' '#1089#1084#1077#1085#1072')')
  end
  object AssignButton: TButton
    Left = 399
    Top = 176
    Width = 187
    Height = 25
    Caption = #1053#1072#1079#1085#1072#1095#1080#1090#1100' '#1086#1092#1080#1094#1080#1072#1085#1090#1072
    TabOrder = 4
    OnClick = AssignButtonClick
  end
  object CancelAssigmentButton: TButton
    Left = 399
    Top = 266
    Width = 187
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1080#1090#1100' '#1074#1099#1073#1088#1072#1085#1085#1086#1077' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1077
    TabOrder = 5
    OnClick = CancelAssigmentButtonClick
  end
end
