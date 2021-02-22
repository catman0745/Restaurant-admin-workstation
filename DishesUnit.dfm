object DishesForm: TDishesForm
  Left = 0
  Top = 0
  Caption = #1052#1077#1085#1102
  ClientHeight = 299
  ClientWidth = 759
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
    Left = 493
    Top = 8
    Width = 148
    Height = 13
    Caption = #1056#1077#1078#1080#1084' '#1091#1087#1088#1072#1074#1083#1077#1085#1080#1103' '#1073#1083#1102#1076#1072#1084#1080':'
  end
  object Label2: TLabel
    Left = 493
    Top = 173
    Width = 58
    Height = 13
    Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100':'
  end
  object Label3: TLabel
    Left = 493
    Top = 119
    Width = 52
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077':'
  end
  object Label4: TLabel
    Left = 493
    Top = 65
    Width = 36
    Height = 13
    Caption = #1042#1099#1073#1086#1088':'
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 479
    Height = 248
    DataSource = DishesDataModule.ShowDishesDataSource
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = #1053#1072#1079#1074#1072#1085#1080#1077
        Visible = True
      end
      item
        Expanded = False
        FieldName = #1062#1077#1085#1072
        Visible = True
      end>
  end
  object ModeComboBox: TComboBox
    Left = 493
    Top = 27
    Width = 145
    Height = 21
    Style = csDropDownList
    TabOrder = 1
    OnChange = ModeComboBoxChange
    Items.Strings = (
      #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077
      #1048#1079#1084#1077#1085#1077#1085#1080#1077
      #1059#1076#1072#1083#1077#1085#1080#1077)
  end
  object ActionButton: TButton
    Left = 493
    Top = 231
    Width = 145
    Height = 25
    TabOrder = 2
    Visible = False
    OnClick = ActionButtonClick
  end
  object DishPriceEdit: TEdit
    Left = 493
    Top = 192
    Width = 145
    Height = 21
    BiDiMode = bdLeftToRight
    Enabled = False
    ParentBiDiMode = False
    TabOrder = 3
  end
  object DishNameEdit: TEdit
    Left = 493
    Top = 138
    Width = 145
    Height = 21
    Enabled = False
    TabOrder = 4
  end
  object DishIdLookupComboBox: TDBLookupComboBox
    Left = 493
    Top = 84
    Width = 145
    Height = 21
    Enabled = False
    KeyField = #1050#1086#1076
    ListField = #1053#1072#1079#1074#1072#1085#1080#1077
    ListSource = DishesDataModule.DishesDataSource
    TabOrder = 5
  end
end
