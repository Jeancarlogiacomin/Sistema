object Fimportamdfe: TFimportamdfe
  Left = 0
  Top = 0
  Caption = 'GERAR MDF-E'
  ClientHeight = 317
  ClientWidth = 838
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 32
    Top = 157
    Width = 209
    Height = 25
    Caption = 'Importar'
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 32
    Top = 124
    Width = 209
    Height = 26
    Caption = 'LER XML'
    OnClick = SpeedButton2Click
  end
  object Label1: TLabel
    Left = 32
    Top = 283
    Width = 31
    Height = 13
    Caption = 'Label1'
  end
  object Label2: TLabel
    Left = 32
    Top = 24
    Width = 115
    Height = 13
    Caption = 'Insira numero do MDF-E'
  end
  object SBabrir: TSpeedButton
    Left = 32
    Top = 93
    Width = 106
    Height = 22
    Caption = 'Abrir'
    OnClick = SBabrirClick
  end
  object SBatualizar: TSpeedButton
    Left = 136
    Top = 93
    Width = 105
    Height = 22
    Caption = 'Atualizar'
    OnClick = SBatualizarClick
  end
  object Label3: TLabel
    Left = 360
    Top = 24
    Width = 55
    Height = 13
    Caption = 'CAMINHO :'
  end
  object Label4: TLabel
    Left = 32
    Top = 58
    Width = 108
    Height = 13
    Caption = 'Codigo Cidade Destino'
  end
  object Edit1: TEdit
    Left = 152
    Top = 21
    Width = 89
    Height = 21
    TabOrder = 0
  end
  object FileListBox1: TFileListBox
    Left = 360
    Top = 64
    Width = 401
    Height = 185
    ItemHeight = 13
    Mask = '*.xml*'
    TabOrder = 1
  end
  object Editcaminho: TEdit
    Left = 416
    Top = 21
    Width = 345
    Height = 21
    TabOrder = 2
  end
  object ProgressBar1: TProgressBar
    Left = 32
    Top = 260
    Width = 729
    Height = 17
    TabOrder = 3
  end
  object Edit2: TEdit
    Left = 152
    Top = 55
    Width = 89
    Height = 21
    TabOrder = 4
  end
  object ACBrNFe1: TACBrNFe
    Configuracoes.Geral.SSLLib = libNone
    Configuracoes.Geral.SSLCryptLib = cryNone
    Configuracoes.Geral.SSLHttpLib = httpNone
    Configuracoes.Geral.SSLXmlSignLib = xsNone
    Configuracoes.Geral.FormatoAlerta = 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.'
    Configuracoes.Geral.VersaoQRCode = veqr000
    Configuracoes.Arquivos.OrdenacaoPath = <>
    Configuracoes.WebServices.UF = 'SP'
    Configuracoes.WebServices.AguardarConsultaRet = 0
    Configuracoes.WebServices.QuebradeLinha = '|'
    Left = 768
    Top = 16
  end
  object OpenDialog1: TOpenDialog
    Left = 768
    Top = 64
  end
  object FDsyscon: TFDConnection
    Params.Strings = (
      'Database=d:\Syscon\Dados\DADOS.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'Protocol=TCPIP'
      'Server=GIACOMIN-SERVER'
      'DriverID=FB')
    Connected = True
    Left = 768
    Top = 113
  end
  object FDQinsert: TFDQuery
    Connection = FDsyscon
    Left = 769
    Top = 161
  end
  object FDQcidade: TFDQuery
    Connection = FDsyscon
    Left = 770
    Top = 209
  end
end
