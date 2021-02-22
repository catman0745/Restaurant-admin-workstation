object WaitersForm: TWaitersForm
  Left = 0
  Top = 0
  Caption = #1059#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1082#1072#1076#1088#1072#1084#1080' - '#1054#1092#1080#1094#1080#1072#1085#1090#1099
  ClientHeight = 299
  ClientWidth = 578
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
    Left = 334
    Top = 157
    Width = 92
    Height = 13
    Caption = #1060#1048#1054' '#1057#1086#1090#1088#1091#1076#1085#1080#1082#1072':'
  end
  object Label2: TLabel
    Left = 334
    Top = 8
    Width = 77
    Height = 13
    Caption = #1056#1077#1078#1080#1084' '#1088#1072#1073#1086#1090#1099':'
  end
  object Label3: TLabel
    Left = 334
    Top = 101
    Width = 56
    Height = 13
    Caption = #1054#1092#1080#1094#1080#1072#1085#1090':'
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 320
    Height = 283
    DataSource = WaitersDataModule.WaitersDataSource
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object NameEdit: TEdit
    Left = 334
    Top = 176
    Width = 235
    Height = 21
    TabOrder = 1
  end
  object ModeComboBox: TComboBox
    Left = 334
    Top = 27
    Width = 235
    Height = 21
    Style = csDropDownList
    TabOrder = 2
    OnChange = ModeComboBoxChange
    Items.Strings = (
      #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103' '#1085#1086#1074#1086#1075#1086' '#1086#1092#1080#1094#1080#1072#1085#1090#1072
      #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080' '#1086#1092#1080#1094#1080#1072#1085#1090#1072
      #1059#1074#1086#1083#1100#1085#1077#1085#1080#1077' '#1086#1092#1080#1094#1080#1072#1085#1090#1072)
  end
  object ActionButton: TButton
    Left = 334
    Top = 266
    Width = 235
    Height = 25
    TabOrder = 3
    OnClick = ActionButtonClick
  end
  object IdDBLookupComboBox: TDBLookupComboBox
    Left = 334
    Top = 120
    Width = 235
    Height = 21
    KeyField = #1051#1080#1095#1085#1099#1081' '#1085#1086#1084#1077#1088
    ListField = #1060#1048#1054
    ListSource = WaitersDataModule.WaitersDataSource
    TabOrder = 4
  end
end
