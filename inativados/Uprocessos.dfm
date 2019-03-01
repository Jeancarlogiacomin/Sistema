object Fprocessos: TFprocessos
  Left = 0
  Top = 0
  Caption = 'Fprocessos'
  ClientHeight = 635
  ClientWidth = 873
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
    Left = 56
    Top = 24
    Width = 41
    Height = 13
    Caption = 'CODIGO'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 56
    Top = 64
    Width = 32
    Height = 13
    Caption = 'PLACA'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 134
    Top = 24
    Width = 42
    Height = 13
    Caption = 'DATAINI'
    FocusControl = DBEdit3
  end
  object Label4: TLabel
    Left = 246
    Top = 24
    Width = 45
    Height = 13
    Caption = 'DATAFIM'
    FocusControl = DBEdit4
  end
  object Label5: TLabel
    Left = 209
    Top = 64
    Width = 60
    Height = 13
    Caption = 'MOTORISTA'
    FocusControl = DBEdit5
  end
  object Label6: TLabel
    Left = 56
    Top = 104
    Width = 40
    Height = 13
    Caption = 'ORIGEM'
    FocusControl = DBEdit6
  end
  object Label7: TLabel
    Left = 209
    Top = 104
    Width = 41
    Height = 13
    Caption = 'CLIENTE'
    FocusControl = DBEdit7
  end
  object Label8: TLabel
    Left = 462
    Top = 64
    Width = 46
    Height = 13
    Caption = 'DATACTE'
    FocusControl = DBEdit8
  end
  object Label9: TLabel
    Left = 365
    Top = 64
    Width = 26
    Height = 13
    Caption = 'NCTE'
    FocusControl = DBEdit9
  end
  object Label10: TLabel
    Left = 565
    Top = 64
    Width = 52
    Height = 13
    Caption = 'VALORCTE'
    FocusControl = DBEdit10
  end
  object Label11: TLabel
    Left = 362
    Top = 104
    Width = 45
    Height = 13
    Caption = 'PEDAGIO'
    FocusControl = DBEdit11
  end
  object Label12: TLabel
    Left = 462
    Top = 104
    Width = 54
    Height = 13
    Caption = 'DESCARGA'
    FocusControl = DBEdit12
  end
  object Label13: TLabel
    Left = 209
    Top = 151
    Width = 49
    Height = 13
    Caption = 'PRODUTO'
    FocusControl = DBEdit13
  end
  object Label14: TLabel
    Left = 362
    Top = 151
    Width = 26
    Height = 13
    Caption = 'PESO'
    FocusControl = DBEdit14
  end
  object Label15: TLabel
    Left = 362
    Top = 21
    Width = 50
    Height = 13
    Caption = 'DIARIODB'
    FocusControl = DBEdit15
  end
  object Label16: TLabel
    Left = 56
    Top = 151
    Width = 13
    Height = 13
    Caption = 'NF'
    FocusControl = DBEdit16
  end
  object Label17: TLabel
    Left = 56
    Top = 200
    Width = 57
    Height = 13
    Caption = 'NUMTERMO'
    FocusControl = DBEdit17
  end
  object Label18: TLabel
    Left = 209
    Top = 200
    Width = 70
    Height = 13
    Caption = 'QUANTPALLET'
    FocusControl = DBEdit18
  end
  object Label19: TLabel
    Left = 462
    Top = 21
    Width = 55
    Height = 13
    Caption = 'EMBARQUE'
    FocusControl = DBEdit19
  end
  object DBEdit1: TDBEdit
    Left = 56
    Top = 40
    Width = 55
    Height = 21
    DataField = 'CODIGO'
    DataSource = DataSource1
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 56
    Top = 80
    Width = 134
    Height = 21
    DataField = 'PLACA'
    DataSource = DataSource1
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 134
    Top = 40
    Width = 74
    Height = 21
    DataField = 'DATAINI'
    DataSource = DataSource1
    TabOrder = 2
  end
  object DBEdit4: TDBEdit
    Left = 246
    Top = 40
    Width = 97
    Height = 21
    DataField = 'DATAFIM'
    DataSource = DataSource1
    TabOrder = 3
  end
  object DBEdit5: TDBEdit
    Left = 209
    Top = 80
    Width = 134
    Height = 21
    DataField = 'MOTORISTA'
    DataSource = DataSource1
    TabOrder = 4
  end
  object DBEdit6: TDBEdit
    Left = 56
    Top = 120
    Width = 134
    Height = 21
    DataField = 'ORIGEM'
    DataSource = DataSource1
    TabOrder = 5
  end
  object DBEdit7: TDBEdit
    Left = 209
    Top = 120
    Width = 134
    Height = 21
    DataField = 'CLIENTE'
    DataSource = DataSource1
    TabOrder = 6
  end
  object DBEdit8: TDBEdit
    Left = 462
    Top = 80
    Width = 81
    Height = 21
    DataField = 'DATACTE'
    DataSource = DataSource1
    TabOrder = 7
  end
  object DBEdit9: TDBEdit
    Left = 362
    Top = 80
    Width = 77
    Height = 21
    DataField = 'NCTE'
    DataSource = DataSource1
    TabOrder = 8
  end
  object DBEdit10: TDBEdit
    Left = 565
    Top = 80
    Width = 73
    Height = 21
    DataField = 'VALORCTE'
    DataSource = DataSource1
    TabOrder = 9
  end
  object DBEdit11: TDBEdit
    Left = 362
    Top = 120
    Width = 77
    Height = 21
    DataField = 'PEDAGIO'
    DataSource = DataSource1
    TabOrder = 10
  end
  object DBEdit12: TDBEdit
    Left = 462
    Top = 120
    Width = 81
    Height = 21
    DataField = 'DESCARGA'
    DataSource = DataSource1
    TabOrder = 11
  end
  object DBEdit13: TDBEdit
    Left = 209
    Top = 167
    Width = 134
    Height = 21
    DataField = 'PRODUTO'
    DataSource = DataSource1
    TabOrder = 12
  end
  object DBEdit14: TDBEdit
    Left = 362
    Top = 167
    Width = 135
    Height = 21
    DataField = 'PESO'
    DataSource = DataSource1
    TabOrder = 13
  end
  object DBEdit15: TDBEdit
    Left = 362
    Top = 37
    Width = 77
    Height = 21
    DataField = 'DIARIODB'
    DataSource = DataSource1
    TabOrder = 14
  end
  object DBEdit16: TDBEdit
    Left = 56
    Top = 167
    Width = 134
    Height = 21
    DataField = 'NF'
    DataSource = DataSource1
    TabOrder = 15
  end
  object DBEdit17: TDBEdit
    Left = 56
    Top = 216
    Width = 134
    Height = 21
    DataField = 'NUMTERMO'
    DataSource = DataSource1
    TabOrder = 16
  end
  object DBEdit18: TDBEdit
    Left = 209
    Top = 216
    Width = 134
    Height = 21
    DataField = 'QUANTPALLET'
    DataSource = DataSource1
    TabOrder = 17
  end
  object DBEdit19: TDBEdit
    Left = 462
    Top = 37
    Width = 176
    Height = 21
    DataField = 'EMBARQUE'
    DataSource = DataSource1
    TabOrder = 18
  end
  object DBGrid1: TDBGrid
    Left = 56
    Top = 272
    Width = 582
    Height = 337
    DataSource = DataSource1
    TabOrder = 19
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object FDQuery1: TFDQuery
    SQL.Strings = (
      'select *'
      'from processos')
    Left = 752
    Top = 32
  end
  object DataSource1: TDataSource
    AutoEdit = False
    DataSet = FDQuery1
    Left = 752
    Top = 80
  end
end
