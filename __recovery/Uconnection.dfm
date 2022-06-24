object DataModule2: TDataModule2
  OldCreateOrder = False
  Height = 131
  Width = 190
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=C:\Syscon\Dados\DADOS.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=fB')
    Connected = True
    LoginPrompt = False
    Left = 32
    Top = 32
  end
  object FDQlogin: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select *'
      'from usuarios'
      'where nome =:nome'
      'and senha =:senha')
    Left = 112
    Top = 32
    ParamData = <
      item
        Name = 'NOME'
        DataType = ftString
        ParamType = ptInput
        Size = 10
        Value = 'TESTE'
      end
      item
        Name = 'SENHA'
        DataType = ftString
        ParamType = ptInput
        Size = 10
        Value = 'TESTE'
      end>
    object FDQloginCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQloginNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 10
    end
    object FDQloginSENHA: TStringField
      FieldName = 'SENHA'
      Origin = 'SENHA'
      Size = 10
    end
    object FDQloginNOMECOMPLETO: TStringField
      FieldName = 'NOMECOMPLETO'
      Origin = 'NOMECOMPLETO'
      Required = True
      Size = 30
    end
    object FDQloginACESSO: TSmallintField
      FieldName = 'ACESSO'
      Origin = 'ACESSO'
      Required = True
    end
    object FDQloginENTRADA: TTimeField
      FieldName = 'ENTRADA'
      Origin = 'ENTRADA'
      Required = True
    end
    object FDQloginSAIDA_ALMOCO: TTimeField
      FieldName = 'SAIDA_ALMOCO'
      Origin = 'SAIDA_ALMOCO'
      Required = True
    end
    object FDQloginENTRADA_ALMOCO: TTimeField
      FieldName = 'ENTRADA_ALMOCO'
      Origin = 'ENTRADA_ALMOCO'
      Required = True
    end
    object FDQloginSAIDA: TTimeField
      FieldName = 'SAIDA'
      Origin = 'SAIDA'
      Required = True
    end
    object FDQloginENTRADA_SABADO: TTimeField
      FieldName = 'ENTRADA_SABADO'
      Origin = 'ENTRADA_SABADO'
    end
    object FDQloginSAIDA_SABADO: TTimeField
      FieldName = 'SAIDA_SABADO'
      Origin = 'SAIDA_SABADO'
    end
  end
end
