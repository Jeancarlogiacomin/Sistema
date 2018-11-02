object Fduvidas: TFduvidas
  Left = 0
  Top = 0
  Caption = 'Fduvidas'
  ClientHeight = 468
  ClientWidth = 557
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
    Left = 40
    Top = 40
    Width = 41
    Height = 13
    Caption = 'CODIGO'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 40
    Top = 80
    Width = 26
    Height = 13
    Caption = 'DESC'
    FocusControl = DBEdit2
  end
  object Label7: TLabel
    Left = 288
    Top = 80
    Width = 40
    Height = 13
    Caption = 'MOTIVO'
    FocusControl = DBEdit7
  end
  object DBGrid1: TDBGrid
    Left = 40
    Top = 136
    Width = 489
    Height = 313
    DataSource = DSduvidas
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_PROBLEMA'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HORA_PROBLEMA'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUARIOP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUARIO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RESOLVIDO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MOTIVO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUARIO_RESOLVEU'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUARIOR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_RESOLVIDO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HORA_RESOLVIDO'
        Visible = True
      end>
  end
  object DBEdit1: TDBEdit
    Left = 40
    Top = 56
    Width = 41
    Height = 21
    DataField = 'CODIGO'
    DataSource = DSduvidas
    TabOrder = 1
  end
  object DBEdit2: TDBEdit
    Left = 40
    Top = 96
    Width = 225
    Height = 21
    DataField = 'DESC'
    DataSource = DSduvidas
    TabOrder = 2
  end
  object DBEdit7: TDBEdit
    Left = 288
    Top = 96
    Width = 241
    Height = 21
    DataField = 'MOTIVO'
    DataSource = DSduvidas
    TabOrder = 3
  end
  object FDQduvidas: TFDQuery
    Active = True
    Connection = DataModule2.FDConnection
    SQL.Strings = (
      'select pe.CODIGO'
      '    ,  pe.DESC'
      '    ,  pe.DATA_PROBLEMA'
      '    ,  pe.HORA_PROBLEMA'
      '    ,  pe.USUARIO'
      '    ,  up.nome as usuariop'
      '    ,  pe.RESOLVIDO'
      '    ,  pe.MOTIVO'
      '    ,  pe.USUARIO_RESOLVEU'
      '    ,  ur.nome as usuarior'
      '    ,  pe.DATA_RESOLVIDO'
      '    ,  pe.HORA_RESOLVIDO'
      'from ponto_erros pe'
      'left join usuarios up on up.codigo=pe.usuario'
      'left join usuarios ur on ur.codigo=pe.usuario_resolveu')
    Left = 616
    Top = 96
    object FDQduvidasCODIGO: TLargeintField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQduvidasDESC: TStringField
      FieldName = 'DESC'
      Origin = '"DESC"'
      Required = True
      Size = 255
    end
    object FDQduvidasDATA_PROBLEMA: TDateField
      FieldName = 'DATA_PROBLEMA'
      Origin = 'DATA_PROBLEMA'
      Required = True
    end
    object FDQduvidasHORA_PROBLEMA: TTimeField
      FieldName = 'HORA_PROBLEMA'
      Origin = 'HORA_PROBLEMA'
      Required = True
    end
    object FDQduvidasUSUARIO: TSmallintField
      FieldName = 'USUARIO'
      Origin = 'USUARIO'
      Required = True
    end
    object FDQduvidasUSUARIOP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'USUARIOP'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object FDQduvidasRESOLVIDO: TSmallintField
      FieldName = 'RESOLVIDO'
      Origin = 'RESOLVIDO'
      Required = True
    end
    object FDQduvidasMOTIVO: TStringField
      FieldName = 'MOTIVO'
      Origin = 'MOTIVO'
      Size = 255
    end
    object FDQduvidasUSUARIO_RESOLVEU: TSmallintField
      FieldName = 'USUARIO_RESOLVEU'
      Origin = 'USUARIO_RESOLVEU'
    end
    object FDQduvidasUSUARIOR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'USUARIOR'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object FDQduvidasDATA_RESOLVIDO: TDateField
      FieldName = 'DATA_RESOLVIDO'
      Origin = 'DATA_RESOLVIDO'
    end
    object FDQduvidasHORA_RESOLVIDO: TTimeField
      FieldName = 'HORA_RESOLVIDO'
      Origin = 'HORA_RESOLVIDO'
    end
  end
  object DSduvidas: TDataSource
    DataSet = FDQduvidas
    Left = 616
    Top = 152
  end
end