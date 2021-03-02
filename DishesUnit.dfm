object DishesForm: TDishesForm
  Left = 0
  Top = 0
  Caption = #1052#1077#1085#1102
  ClientHeight = 265
  ClientWidth = 737
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
    Left = 493
    Top = 5
    Width = 52
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077':'
  end
  object Label2: TLabel
    Left = 493
    Top = 51
    Width = 30
    Height = 13
    Caption = #1062#1077#1085#1072':'
  end
  object DishesGrid: TDBGrid
    Left = 8
    Top = 8
    Width = 479
    Height = 248
    DataSource = DishesDataModule.DisplayDataSource
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DishesGridCellClick
    Columns = <
      item
        Expanded = False
        FieldName = #1053#1072#1079#1074#1072#1085#1080#1077
        Width = 281
        Visible = True
      end
      item
        Expanded = False
        FieldName = #1062#1077#1085#1072
        Width = 68
        Visible = True
      end>
  end
  object NameEdit: TEdit
    Left = 493
    Top = 24
    Width = 236
    Height = 21
    TabOrder = 1
  end
  object PriceEdit: TEdit
    Left = 493
    Top = 70
    Width = 236
    Height = 21
    TabOrder = 2
  end
  object AddButton: TButton
    Left = 493
    Top = 169
    Width = 236
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1073#1083#1102#1076#1086' '#1074' '#1084#1077#1085#1102
    TabOrder = 3
    OnClick = AddButtonClick
  end
  object UpdateButton: TButton
    Left = 493
    Top = 200
    Width = 236
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1074#1099#1076#1077#1083#1077#1085#1085#1086#1075#1086' '#1073#1083#1102#1076#1072
    TabOrder = 4
    OnClick = UpdateButtonClick
  end
  object DeleteButton: TButton
    Left = 493
    Top = 231
    Width = 236
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1085#1086#1077' '#1073#1083#1102#1076#1086
    TabOrder = 5
    OnClick = DeleteButtonClick
  end
end
