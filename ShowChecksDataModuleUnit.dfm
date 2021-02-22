object ShowChecksDataModule: TShowChecksDataModule
  OldCreateOrder = False
  Height = 472
  Width = 892
  object ShowChecksQuery: TADOQuery
    Active = True
    Connection = MainDataModule.SellingsConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT'
      '  '#1063#1077#1082#1080'.'#1050#1086#1076','
      '  '#1063#1077#1082#1080'.['#1044#1072#1090#1072' '#1080' '#1074#1088#1077#1084#1103' '#1086#1092#1086#1088#1084#1083#1077#1085#1080#1103'],'
      '  '#1063#1077#1082#1080'.'#1054#1087#1083#1072#1095#1077#1085','
      
        '  CCur(Sum('#1041#1083#1102#1076#1072'.'#1062#1077#1085#1072'*['#1041#1083#1102#1076#1086' '#1074' '#1095#1077#1082#1077'].'#1050#1086#1083#1080#1095#1077#1089#1090#1074#1086')) AS ['#1057#1090#1086#1080#1084#1086#1089#1090#1100' ' +
        #1074' '#1095#1077#1082#1077']'
      
        'FROM '#1063#1077#1082#1080' INNER JOIN ('#1041#1083#1102#1076#1072' INNER JOIN ['#1041#1083#1102#1076#1086' '#1074' '#1095#1077#1082#1077'] ON '#1041#1083#1102#1076#1072'.'#1050 +
        #1086#1076' = ['#1041#1083#1102#1076#1086' '#1074' '#1095#1077#1082#1077'].'#1041#1083#1102#1076#1086') ON '#1063#1077#1082#1080'.'#1050#1086#1076' = ['#1041#1083#1102#1076#1086' '#1074' '#1095#1077#1082#1077'].'#1063#1077#1082
      'GROUP BY '#1063#1077#1082#1080'.'#1050#1086#1076', '#1063#1077#1082#1080'.['#1044#1072#1090#1072' '#1080' '#1074#1088#1077#1084#1103' '#1086#1092#1086#1088#1084#1083#1077#1085#1080#1103'], '#1063#1077#1082#1080'.'#1054#1087#1083#1072#1095#1077#1085';')
    Left = 56
    Top = 8
  end
  object ShowChecksDataSource: TDataSource
    DataSet = ShowChecksQuery
    Left = 56
    Top = 56
  end
  object CloseCheckQuery: TADOQuery
    Connection = MainDataModule.SellingsConnection
    Parameters = <
      item
        Name = 'CheckId'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'UPDATE '#1063#1077#1082#1080
      'SET '#1054#1087#1083#1072#1095#1077#1085' = True'
      'WHERE '#1050#1086#1076' = :CheckId;')
    Left = 224
    Top = 8
  end
end
