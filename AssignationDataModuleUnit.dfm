object AssignationDataModule: TAssignationDataModule
  OldCreateOrder = False
  Height = 463
  Width = 758
  object ShowAssignationsQuery: TADOQuery
    Active = True
    Connection = MainDataModule.PersonnelConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT '#1040#1089#1089#1072#1081#1085#1099'.['#1044#1077#1085#1100' '#1085#1077#1076#1077#1083#1080'], ['#1044#1085#1080' '#1085#1077#1076#1077#1083#1080'].'#1053#1072#1079#1074#1072#1085#1080#1077' AS ['#1044#1077#1085#1100'  '#1085#1077 +
        #1076#1077#1083#1080'], '#1040#1089#1089#1072#1081#1085#1099'.['#1053#1086#1084#1077#1088' '#1089#1084#1077#1085#1099'], '#1040#1089#1089#1072#1081#1085#1099'.'#1056#1072#1073#1086#1090#1085#1080#1082', '#1055#1077#1088#1089#1086#1085#1072#1083'.'#1060#1048#1054' AS ' +
        '['#1054#1092#1080#1094#1080#1072#1085#1090']'
      
        'FROM '#1055#1077#1088#1089#1086#1085#1072#1083' INNER JOIN (['#1044#1085#1080' '#1085#1077#1076#1077#1083#1080'] INNER JOIN '#1040#1089#1089#1072#1081#1085#1099' ON ['#1044#1085 +
        #1080' '#1085#1077#1076#1077#1083#1080'].['#1053#1086#1084#1077#1088' '#1087#1086' '#1087#1086#1088#1103#1076#1082#1091'] = '#1040#1089#1089#1072#1081#1085#1099'.['#1044#1077#1085#1100' '#1085#1077#1076#1077#1083#1080']) ON '#1055#1077#1088#1089#1086#1085#1072 +
        #1083'.['#1051#1080#1095#1085#1099#1081' '#1085#1086#1084#1077#1088'] = '#1040#1089#1089#1072#1081#1085#1099'.'#1056#1072#1073#1086#1090#1085#1080#1082
      'ORDER BY '#1040#1089#1089#1072#1081#1085#1099'.['#1044#1077#1085#1100' '#1085#1077#1076#1077#1083#1080'], '#1040#1089#1089#1072#1081#1085#1099'.['#1053#1086#1084#1077#1088' '#1089#1084#1077#1085#1099']')
    Left = 80
    Top = 8
  end
  object ShowAssignationsDataSource: TDataSource
    DataSet = ShowAssignationsQuery
    Left = 80
    Top = 56
  end
  object WaitersTable: TADOTable
    Active = True
    Connection = MainDataModule.PersonnelConnection
    CursorType = ctStatic
    TableName = #1055#1077#1088#1089#1086#1085#1072#1083
    Left = 296
    Top = 8
  end
  object WeekdaysTable: TADOTable
    Active = True
    Connection = MainDataModule.PersonnelConnection
    CursorType = ctStatic
    TableName = #1044#1085#1080' '#1085#1077#1076#1077#1083#1080
    Left = 408
    Top = 8
  end
  object WaitersDataSource: TDataSource
    DataSet = WaitersTable
    Left = 296
    Top = 56
  end
  object WeekdaysDataSource: TDataSource
    DataSet = WeekdaysTable
    Left = 408
    Top = 56
  end
  object AssignQuery: TADOQuery
    Connection = MainDataModule.PersonnelConnection
    Parameters = <
      item
        Name = 'Weekday'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'Shift'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'WaiterId'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'INSERT INTO '#1040#1089#1089#1072#1081#1085#1099'(['#1044#1077#1085#1100' '#1085#1077#1076#1077#1083#1080'], ['#1053#1086#1084#1077#1088' '#1089#1084#1077#1085#1099'], '#1056#1072#1073#1086#1090#1085#1080#1082')'
      'VALUES(:Weekday, :Shift, :WaiterId)')
    Left = 560
    Top = 8
  end
  object CancelAssignationQuery: TADOQuery
    Connection = MainDataModule.PersonnelConnection
    Parameters = <
      item
        Name = 'Weekday'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'Shift'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'WaiterId'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'DELETE FROM '#1040#1089#1089#1072#1081#1085#1099
      'WHERE ['#1044#1077#1085#1100' '#1085#1077#1076#1077#1083#1080'] = :Weekday'
      '     AND ['#1053#1086#1084#1077#1088' '#1089#1084#1077#1085#1099'] = :Shift'
      '     AND ['#1056#1072#1073#1086#1090#1085#1080#1082'] = :WaiterId')
    Left = 664
    Top = 8
  end
  object WorkloadQuery: TADOQuery
    Connection = MainDataModule.PersonnelConnection
    Parameters = <
      item
        Name = 'WaiterId'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'SELECT Count(*) AS ['#1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1089#1084#1077#1085']'
      'FROM '#1040#1089#1089#1072#1081#1085#1099
      'WHERE '#1056#1072#1073#1086#1090#1085#1080#1082' = :WaiterId')
    Left = 560
    Top = 56
  end
end
