object ShowChecksForm: TShowChecksForm
  Left = 0
  Top = 0
  Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1095#1077#1082#1086#1074
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
    Left = 367
    Top = 8
    Width = 87
    Height = 13
    Caption = #1059#1087#1086#1088#1103#1076#1086#1095#1080#1090#1100' '#1087#1086':'
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 353
    Height = 283
    DataSource = ShowChecksDataModule.ShowChecksDataSource
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
        FieldName = #1044#1072#1090#1072' '#1080' '#1074#1088#1077#1084#1103' '#1086#1092#1086#1088#1084#1083#1077#1085#1080#1103
        Width = 138
        Visible = True
      end
      item
        Expanded = False
        FieldName = #1054#1087#1083#1072#1095#1077#1085
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = #1057#1090#1086#1080#1084#1086#1089#1090#1100' '#1074' '#1095#1077#1082#1077
        Width = 97
        Visible = True
      end>
  end
  object OrderComboBox: TComboBox
    Left = 367
    Top = 27
    Width = 202
    Height = 21
    Style = csDropDownList
    TabOrder = 1
    OnChange = OrderComboBoxChange
    Items.Strings = (
      #1057#1085#1072#1095#1072#1083#1072' '#1085#1086#1074#1099#1077
      #1057#1085#1072#1095#1072#1083#1072' '#1089#1090#1072#1088#1099#1077
      #1057#1085#1072#1095#1072#1083#1072' '#1086#1087#1083#1072#1095#1077#1085#1085#1099#1077
      #1057#1085#1072#1095#1072#1083#1072' '#1085#1077' '#1086#1087#1083#1072#1095#1077#1085#1085#1099#1077
      #1055#1086' '#1074#1086#1079#1088#1072#1089#1090#1072#1085#1080#1102' '#1089#1090#1086#1080#1084#1086#1089#1090#1080
      #1055#1086' '#1091#1073#1099#1074#1072#1085#1080#1102' '#1089#1090#1086#1080#1084#1086#1089#1090#1080)
  end
  object PayCheckButton: TButton
    Left = 367
    Top = 235
    Width = 202
    Height = 25
    Caption = #1042#1099#1076#1077#1083#1077#1085#1085#1099#1081' '#1095#1077#1082' '#1086#1087#1083#1072#1095#1077#1085
    TabOrder = 2
    OnClick = PayCheckButtonClick
  end
  object ReportButton: TButton
    Left = 367
    Top = 266
    Width = 203
    Height = 25
    Caption = #1055#1088#1086#1089#1084#1086#1090#1088#1077#1090#1100' '#1095#1077#1082
    TabOrder = 3
    OnClick = ReportButtonClick
  end
end
