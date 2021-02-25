object WaitersForm: TWaitersForm
  Left = 0
  Top = 0
  Caption = #1059#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1082#1072#1076#1088#1072#1084#1080' - '#1054#1092#1080#1094#1080#1072#1085#1090#1099
  ClientHeight = 299
  ClientWidth = 601
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 334
    Top = 8
    Width = 86
    Height = 13
    Caption = #1060#1048#1054' '#1086#1092#1080#1094#1080#1072#1085#1090#1072':'
  end
  object DisplayGrid: TDBGrid
    Left = 8
    Top = 8
    Width = 320
    Height = 283
    DataSource = WaitersDataModule.DisplayDataSource
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DisplayGridCellClick
  end
  object NameEdit: TEdit
    Left = 334
    Top = 27
    Width = 259
    Height = 21
    TabOrder = 1
  end
  object AddButton: TButton
    Left = 334
    Top = 204
    Width = 259
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1086#1092#1080#1094#1080#1072#1085#1090#1072
    TabOrder = 2
    OnClick = AddButtonClick
  end
  object UpdateButton: TButton
    Left = 334
    Top = 235
    Width = 259
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1074#1099#1076#1077#1083#1077#1085#1085#1086#1075#1086' '#1086#1092#1080#1094#1080#1072#1085#1090#1072
    TabOrder = 3
    OnClick = UpdateButtonClick
  end
  object DeleteButton: TButton
    Left = 334
    Top = 266
    Width = 259
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100' '#1086#1092#1080#1094#1080#1072#1085#1090#1072
    TabOrder = 4
    OnClick = DeleteButtonClick
  end
end
