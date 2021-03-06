object CheckReportForm: TCheckReportForm
  Left = 0
  Top = 0
  Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1095#1077#1082#1072
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ReportPreview: TfrxPreview
    Left = 0
    Top = 0
    Width = 635
    Height = 299
    Align = alClient
    OutlineVisible = False
    OutlineWidth = 120
    ThumbnailVisible = False
    FindFmVisible = False
    UseReportHints = True
    HideScrolls = False
  end
  object ReportDataset: TfrxDBDataset
    UserName = 'ReportDataset'
    CloseDataSource = False
    DataSource = ShowChecksDataModule.ReportDataSource
    BCDToCurrency = False
    Left = 304
    Top = 176
  end
  object Report: TfrxReport
    Version = '6.8'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    Preview = ReportPreview
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44259.696916886600000000
    ReportOptions.LastChange = 44259.696916886600000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 456
    Top = 104
    Datasets = <
      item
        DataSet = ReportDataset
        DataSetName = 'ReportDataset'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        object Memo7: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 544.252320000000100000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          DataField = #1050#1086#1076' '#1095#1077#1082#1072
          DataSet = ReportDataset
          DataSetName = 'ReportDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Memo.UTF8W = (
            '[ReportDataset."'#1050#1086#1076' '#1095#1077#1082#1072'"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 502.677490000000000000
          Width = 42.550192580000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Memo.UTF8W = (
            #1063#1077#1082' '#8470)
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 563.149603860000000000
          Width = 18.897637800000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Memo.UTF8W = (
            #1086#1090)
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 582.047620000000100000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          DataField = #1044#1072#1090#1072' '#1080' '#1074#1088#1077#1084#1103' '#1086#1092#1086#1088#1084#1083#1077#1085#1080#1103
          DataSet = ReportDataset
          DataSetName = 'ReportDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[ReportDataset."'#1044#1072#1090#1072' '#1080' '#1074#1088#1077#1084#1103' '#1086#1092#1086#1088#1084#1083#1077#1085#1080#1103'"]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 139.842610000000000000
        Width = 740.409927000000000000
        DataSet = ReportDataset
        DataSetName = 'ReportDataset'
        RowCount = 0
        object Memo2: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Width = 502.677490000000000000
          Height = 18.897650000000000000
          DataField = #1053#1072#1079#1074#1072#1085#1080#1077' '#1073#1083#1102#1076#1072
          DataSet = ReportDataset
          DataSetName = 'ReportDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[ReportDataset."'#1053#1072#1079#1074#1072#1085#1080#1077' '#1073#1083#1102#1076#1072'"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 502.677490000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
          DataSet = ReportDataset
          DataSetName = 'ReportDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[ReportDataset."'#1050#1086#1083#1080#1095#1077#1089#1090#1074#1086'"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 661.417750000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = #1057#1090#1086#1080#1084#1086#1089#1090#1100
          DataSet = ReportDataset
          DataSetName = 'ReportDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[ReportDataset."'#1057#1090#1086#1080#1084#1086#1089#1090#1100'"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 582.047620000000100000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = #1062#1077#1085#1072' '#1073#1083#1102#1076#1072
          DataSet = ReportDataset
          DataSetName = 'ReportDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[ReportDataset."'#1062#1077#1085#1072' '#1073#1083#1102#1076#1072'"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 264.567100000000000000
        Width = 740.409927000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 664.819327000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Page#]')
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 219.212740000000000000
        Width = 740.409927000000000000
        object Memo6: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 94.488249999999990000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = #1057#1091#1084#1084#1072' '#1087#1086' '#1095#1077#1082#1091
          DataSet = ReportDataset
          DataSetName = 'ReportDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[ReportDataset."'#1057#1091#1084#1084#1072' '#1087#1086' '#1095#1077#1082#1091'"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Width = 94.488188976377960000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Memo.UTF8W = (
            #1048#1090#1086#1075#1086' '#1087#1086' '#1095#1077#1082#1091':')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 98.267780000000000000
        Width = 740.409927000000000000
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Width = 502.677165354330700000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            #1053#1072#1079#1074#1072#1085#1080#1077' '#1073#1083#1102#1076#1072)
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 502.677490000000000000
          Width = 79.370078740000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086)
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 582.047620000000100000
          Width = 79.370078740157480000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            #1062#1077#1085#1072)
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 661.417750000000000000
          Width = 79.370078740157480000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            #1057#1090#1086#1080#1084#1086#1089#1090#1100)
          ParentFont = False
        end
      end
    end
  end
end
