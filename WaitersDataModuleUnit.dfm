object WaitersDataModule: TWaitersDataModule
  OldCreateOrder = False
  Height = 323
  Width = 382
  object WaitersTable: TADOTable
    Active = True
    Connection = MainDataModule.Connection
    CursorType = ctStatic
    TableName = #1055#1077#1088#1089#1086#1085#1072#1083
    Left = 40
    Top = 8
    object WaitersTableЛичныйномер: TAutoIncField
      FieldName = #1051#1080#1095#1085#1099#1081' '#1085#1086#1084#1077#1088
      ReadOnly = True
    end
    object WaitersTableФИО: TWideStringField
      FieldName = #1060#1048#1054
      Size = 30
    end
  end
  object WaitersDataSource: TDataSource
    DataSet = WaitersTable
    Left = 40
    Top = 56
  end
  object InsertQuery: TADOQuery
    Connection = MainDataModule.Connection
    Parameters = <
      item
        Name = 'Name'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'INSERT INTO '#1055#1077#1088#1089#1086#1085#1072#1083'('#1060#1048#1054')'
      'VALUES(:Name)')
    Left = 216
    Top = 8
  end
  object UpdateQuery: TADOQuery
    Connection = MainDataModule.Connection
    Parameters = <
      item
        Name = 'Name'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'Id'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'UPDATE '#1055#1077#1088#1089#1086#1085#1072#1083
      'SET '#1060#1048#1054' = :Name'
      'WHERE ['#1051#1080#1095#1085#1099#1081' '#1085#1086#1084#1077#1088'] = :Id')
    Left = 216
    Top = 56
  end
  object DeleteQuery: TADOQuery
    Connection = MainDataModule.Connection
    Parameters = <
      item
        Name = 'Id'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'DELETE FROM '#1055#1077#1088#1089#1086#1085#1072#1083
      'WHERE ['#1051#1080#1095#1085#1099#1081' '#1085#1086#1084#1077#1088'] = :Id')
    Left = 216
    Top = 104
  end
end
