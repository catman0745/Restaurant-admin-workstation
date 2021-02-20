object DishesDataModule: TDishesDataModule
  OldCreateOrder = False
  Height = 394
  Width = 569
  object ShowDishesDataSource: TDataSource
    DataSet = ShowDishesQuery
    Left = 48
    Top = 56
  end
  object ShowDishesQuery: TADOQuery
    Active = True
    Connection = MainDataModule.SellingsConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT '#1053#1072#1079#1074#1072#1085#1080#1077', CCur('#1062#1077#1085#1072') AS '#1062#1077#1085#1072
      'FROM '#1041#1083#1102#1076#1072)
    Left = 48
    Top = 8
  end
  object DishesQuery: TADOQuery
    Connection = MainDataModule.SellingsConnection
    Parameters = <>
    Left = 272
    Top = 8
  end
  object DishesTable: TADOTable
    Active = True
    Connection = MainDataModule.SellingsConnection
    CursorType = ctStatic
    TableName = #1041#1083#1102#1076#1072
    Left = 176
    Top = 8
  end
  object DishesDataSource: TDataSource
    DataSet = DishesTable
    Left = 176
    Top = 56
  end
end
