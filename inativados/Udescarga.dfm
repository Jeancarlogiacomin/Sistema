object Fdescarga: TFdescarga
  Left = 0
  Top = 0
  Caption = 'Descargas'
  ClientHeight = 530
  ClientWidth = 824
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
    Left = 48
    Top = 16
    Width = 41
    Height = 13
    Caption = 'CODIGO'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 48
    Top = 56
    Width = 48
    Height = 13
    Caption = 'DATA_INI'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 217
    Top = 56
    Width = 32
    Height = 13
    Caption = 'PLACA'
    FocusControl = DBEdit3
  end
  object Label4: TLabel
    Left = 48
    Top = 152
    Width = 91
    Height = 13
    Caption = 'VALOR_ENTREGUE'
    FocusControl = DBEdit4
  end
  object Label5: TLabel
    Left = 48
    Top = 104
    Width = 41
    Height = 13
    Caption = 'CLIENTE'
    FocusControl = DBEdit5
  end
  object Label6: TLabel
    Left = 204
    Top = 152
    Width = 54
    Height = 13
    Caption = 'DESCARGA'
    FocusControl = DBEdit6
  end
  object Label7: TLabel
    Left = 48
    Top = 200
    Width = 45
    Height = 13
    Caption = 'PEDAGIO'
    FocusControl = DBEdit7
  end
  object Label8: TLabel
    Left = 204
    Top = 200
    Width = 24
    Height = 13
    Caption = 'VALE'
    FocusControl = DBEdit8
  end
  object Label9: TLabel
    Left = 48
    Top = 244
    Width = 50
    Height = 13
    Caption = 'PERNOITE'
    FocusControl = DBEdit9
  end
  object Label10: TLabel
    Left = 204
    Top = 244
    Width = 63
    Height = 13
    Caption = 'DESP_EXTRA'
    FocusControl = DBEdit10
  end
  object Label11: TLabel
    Left = 48
    Top = 296
    Width = 57
    Height = 13
    Caption = 'DEVOLVIDO'
    FocusControl = DBEdit11
  end
  object Label12: TLabel
    Left = 204
    Top = 296
    Width = 68
    Height = 13
    Caption = 'REMBOLSADO'
    FocusControl = DBEdit12
  end
  object Label13: TLabel
    Left = 48
    Top = 352
    Width = 68
    Height = 13
    Caption = 'OBSERVACAO'
    FocusControl = DBEdit13
  end
  object Label14: TLabel
    Left = 48
    Top = 536
    Width = 60
    Height = 13
    Caption = 'MOTORISTA'
    FocusControl = DBEdit14
  end
  object DBGrid1: TDBGrid
    Left = 360
    Top = 32
    Width = 401
    Height = 433
    DataSource = DSgrid
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBEdit1: TDBEdit
    Left = 48
    Top = 29
    Width = 50
    Height = 21
    DataField = 'CODIGO'
    DataSource = DSgrid
    TabOrder = 1
  end
  object DBEdit2: TDBEdit
    Left = 48
    Top = 72
    Width = 134
    Height = 21
    DataField = 'DATA_INI'
    DataSource = DSgrid
    TabOrder = 2
  end
  object DBEdit3: TDBEdit
    Left = 217
    Top = 72
    Width = 95
    Height = 21
    DataField = 'PLACA'
    DataSource = DSgrid
    TabOrder = 3
  end
  object DBEdit4: TDBEdit
    Left = 48
    Top = 168
    Width = 121
    Height = 21
    DataField = 'VALOR_ENTREGUE'
    DataSource = DSgrid
    TabOrder = 4
  end
  object DBEdit5: TDBEdit
    Left = 48
    Top = 120
    Width = 264
    Height = 21
    DataField = 'CLIENTE'
    DataSource = DSgrid
    TabOrder = 5
  end
  object DBEdit6: TDBEdit
    Left = 204
    Top = 168
    Width = 108
    Height = 21
    DataField = 'DESCARGA'
    DataSource = DSgrid
    TabOrder = 6
  end
  object DBEdit7: TDBEdit
    Left = 48
    Top = 216
    Width = 121
    Height = 21
    DataField = 'PEDAGIO'
    DataSource = DSgrid
    TabOrder = 7
  end
  object DBEdit8: TDBEdit
    Left = 204
    Top = 216
    Width = 108
    Height = 21
    DataField = 'VALE'
    DataSource = DSgrid
    TabOrder = 8
  end
  object DBEdit9: TDBEdit
    Left = 48
    Top = 260
    Width = 121
    Height = 21
    DataField = 'PERNOITE'
    DataSource = DSgrid
    TabOrder = 9
  end
  object DBEdit10: TDBEdit
    Left = 204
    Top = 260
    Width = 108
    Height = 21
    DataField = 'DESP_EXTRA'
    DataSource = DSgrid
    TabOrder = 10
  end
  object DBEdit11: TDBEdit
    Left = 48
    Top = 312
    Width = 121
    Height = 21
    DataField = 'DEVOLVIDO'
    DataSource = DSgrid
    TabOrder = 11
  end
  object DBEdit12: TDBEdit
    Left = 204
    Top = 312
    Width = 108
    Height = 21
    DataField = 'REMBOLSADO'
    DataSource = DSgrid
    TabOrder = 12
  end
  object DBEdit13: TDBEdit
    Left = 48
    Top = 368
    Width = 264
    Height = 21
    DataField = 'OBSERVACAO'
    DataSource = DSgrid
    TabOrder = 13
  end
  object DBEdit14: TDBEdit
    Left = 48
    Top = 552
    Width = 134
    Height = 21
    DataField = 'MOTORISTA'
    DataSource = DSgrid
    TabOrder = 14
  end
  object FDQgrid: TFDQuery
    Active = True
    Connection = DataModule2.FDConnection
    SQL.Strings = (
      'select *'
      'from descarga')
    Left = 424
    Top = 448
    object FDQgridCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'MOTORISTA'
      Required = True
    end
    object FDQgridDATA_INI: TDateField
      FieldName = 'DATA_INI'
      Origin = 'DATA_INI'
      Required = True
    end
    object FDQgridPLACA: TStringField
      FieldName = 'PLACA'
      Origin = 'PLACA'
      Required = True
      FixedChar = True
      Size = 7
    end
    object FDQgridVALOR_ENTREGUE: TBCDField
      FieldName = 'VALOR_ENTREGUE'
      Origin = 'VALOR_ENTREGUE'
      Required = True
      Precision = 18
      Size = 2
    end
    object FDQgridCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Origin = 'CLIENTE'
      FixedChar = True
    end
    object FDQgridDESCARGA: TBCDField
      FieldName = 'DESCARGA'
      Origin = 'DESCARGA'
      Precision = 18
      Size = 2
    end
    object FDQgridPEDAGIO: TBCDField
      FieldName = 'PEDAGIO'
      Origin = 'PEDAGIO'
      Precision = 18
      Size = 2
    end
    object FDQgridVALE: TBCDField
      FieldName = 'VALE'
      Origin = 'VALE'
      Precision = 18
      Size = 2
    end
    object FDQgridPERNOITE: TBCDField
      FieldName = 'PERNOITE'
      Origin = 'PERNOITE'
      Precision = 18
      Size = 2
    end
    object FDQgridDESP_EXTRA: TBCDField
      FieldName = 'DESP_EXTRA'
      Origin = 'DESP_EXTRA'
      Precision = 18
      Size = 2
    end
    object FDQgridDEVOLVIDO: TBCDField
      FieldName = 'DEVOLVIDO'
      Origin = 'DEVOLVIDO'
      Precision = 18
      Size = 2
    end
    object FDQgridREMBOLSADO: TBCDField
      FieldName = 'REMBOLSADO'
      Origin = 'REMBOLSADO'
      Precision = 18
      Size = 2
    end
    object FDQgridOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Origin = 'OBSERVACAO'
      FixedChar = True
      Size = 60
    end
    object FDQgridMOTORISTA: TIntegerField
      FieldName = 'MOTORISTA'
      Origin = 'MOTORISTA'
    end
  end
  object DSgrid: TDataSource
    DataSet = FDQgrid
    Left = 472
    Top = 448
  end
end
