object MainForm: TMainForm
  Left = 0
  Top = 0
  ClientHeight = 326
  ClientWidth = 723
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
    Left = 544
    Top = 262
    Width = 171
    Height = 25
    Caption = #1047#1072#1088#1077#1075#1080#1089#1090#1088#1080#1088#1086#1074#1072#1090#1100' '#1085#1086#1074#1099#1081' '#1095#1077#1082
    TabOrder = 0
    OnClick = RegisterNewCheckButtonClick
  end
  object ManageDishesButton: TButton
    Left = 544
    Top = 231
    Width = 171
    Height = 25
    Caption = #1059#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1084#1077#1085#1102
    TabOrder = 1
    OnClick = ManageDishesButtonClick
  end
  object ShowCkecksButton: TButton
    Left = 544
    Top = 293
    Width = 171
    Height = 25
    Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1095#1077#1082#1086#1074
    TabOrder = 2
    OnClick = ShowCkecksButtonClick
  end
  object WaitersButton: TButton
    Left = 8
    Top = 8
    Width = 171
    Height = 25
    Caption = #1054#1092#1080#1094#1080#1072#1085#1090#1099
    TabOrder = 3
    OnClick = WaitersButtonClick
  end
  object AssignationsButton: TButton
    Left = 8
    Top = 39
    Width = 171
    Height = 25
    Caption = #1056#1072#1089#1087#1080#1089#1072#1085#1080#1077' '#1088#1072#1073#1086#1090#1099' '#1086#1092#1080#1094#1080#1072#1085#1090#1086#1074
    TabOrder = 4
    OnClick = AssignationsButtonClick
  end
end
