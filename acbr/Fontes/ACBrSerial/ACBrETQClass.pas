{******************************************************************************}
{ Projeto: Componentes ACBr                                                    }
{  Biblioteca multiplataforma de componentes Delphi para intera��o com equipa- }
{ mentos de Automa��o Comercial utilizados no Brasil                           }
{                                                                              }
{ Direitos Autorais Reservados (c) 2007 Andrews Ricardo Bejatto                }
{                                       Anderson Rogerio Bejatto               }
{                                                                              }
{ Colaboradores nesse arquivo:          Daniel Simoes de Almeida               }
{                                                                              }
{  Voc� pode obter a �ltima vers�o desse arquivo na pagina do  Projeto ACBr    }
{ Componentes localizado em      http://www.sourceforge.net/projects/acbr      }
{                                                                              }
{  Esta biblioteca � software livre; voc� pode redistribu�-la e/ou modific�-la }
{ sob os termos da Licen�a P�blica Geral Menor do GNU conforme publicada pela  }
{ Free Software Foundation; tanto a vers�o 2.1 da Licen�a, ou (a seu crit�rio) }
{ qualquer vers�o posterior.                                                   }
{                                                                              }
{  Esta biblioteca � distribu�da na expectativa de que seja �til, por�m, SEM   }
{ NENHUMA GARANTIA; nem mesmo a garantia impl�cita de COMERCIABILIDADE OU      }
{ ADEQUA��O A UMA FINALIDADE ESPEC�FICA. Consulte a Licen�a P�blica Geral Menor}
{ do GNU para mais detalhes. (Arquivo LICEN�A.TXT ou LICENSE.TXT)              }
{                                                                              }
{  Voc� deve ter recebido uma c�pia da Licen�a P�blica Geral Menor do GNU junto}
{ com esta biblioteca; se n�o, escreva para a Free Software Foundation, Inc.,  }
{ no endere�o 59 Temple Street, Suite 330, Boston, MA 02111-1307 USA.          }
{ Voc� tamb�m pode obter uma copia da licen�a em:                              }
{ http://www.opensource.org/licenses/lgpl-license.php                          }
{                                                                              }
{ Daniel Sim�es de Almeida  -  daniel@djsystem.com.br  -  www.djsystem.com.br  }
{              Pra�a Anita Costa, 34 - Tatu� - SP - 18270-410                  }
{                                                                              }
{******************************************************************************}

{$I ACBr.inc}

unit ACBrETQClass;

interface

uses
  ACBrDevice, Classes;

const
  CInchCM = 2.54;

type

{ Classe generica de ETIQUETA, nao implementa nenhum modelo especifico, apenas
  declara a Classe. NAO DEVE SER INSTANCIADA. Usada apenas como base para
  as demais Classes de Impressora como por exemplo a classe TACBrETQPpla }

{ TACBrETQClass }

TACBrETQClass = class
  private
    fUnidade: TACBrETQUnidade;
    fTemperatura: Integer;
    fVelocidade: Integer;
    fDPI: TACBrETQDPI;
    fAvanco: Integer;

    procedure ErroNaoImplementado(aNomeMetodo: String);

  protected
    fpBackFeed: TACBrETQBackFeed;
    fpLimparMemoria : Boolean;
    fpOrigem: TACBrETQOrigem;
    fpModeloStr: String;
    fpDevice: TACBrDevice;
    fpLimiteCopias: Integer;

    function ConverterUnidade(UnidadeSaida: TACBrETQUnidade; AValue: Integer): Integer; virtual;

    procedure AdicionarComandos( ACmd: AnsiString; var ACmdList: AnsiString);
    procedure VerificarLimiteCopias( const NumCopias: Integer);

  protected
    function ComandoAbertura: AnsiString; virtual;
    function ComandoBackFeed: AnsiString; virtual;
    function ComandoUnidade: AnsiString; virtual;
    function ComandoTemperatura: AnsiString; virtual;
    function ComandoResolucao: AnsiString; virtual;
    function ComandoOrigemCoordenadas: AnsiString; virtual;
    function ComandoVelocidade: AnsiString; virtual;

  public
    constructor Create(AOwner: TComponent);

    function TratarComandoAntesDeEnviar(aCmd: AnsiString): AnsiString; virtual;

    function ComandoLimparMemoria: AnsiString; virtual;
    function ComandoCopias(const NumCopias: Integer): AnsiString; virtual;
    function ComandoImprimir: AnsiString; virtual;
    function ComandoAvancarEtiqueta(const aAvancoEtq: Integer): AnsiString; virtual;

    function ComandosIniciarEtiqueta: AnsiString; virtual;
    function ComandosFinalizarEtiqueta(NumCopias: Integer = 1; aAvancoEtq: Integer = 0): AnsiString; virtual;

    function ComandoImprimirTexto(aOrientacao: TACBrETQOrientacao; aFonte: String;
      aMultHorizontal, aMultVertical, aVertical, aHorizontal: Integer; aTexto: String;
      aSubFonte: Integer = 0; aImprimirReverso: Boolean = False): AnsiString; virtual;

    function ConverterTipoBarras(TipoBarras: TACBrTipoCodBarra): String; virtual;
    function ComandoImprimirBarras(aOrientacao: TACBrETQOrientacao;
      aTipoBarras: String; aBarraLarga, aBarraFina, aVertical,
      aHorizontal: Integer; aTexto: String; aAlturaBarras: Integer;
      aExibeCodigo: TACBrETQBarraExibeCodigo = becPadrao): AnsiString; virtual;

    function ComandoImprimirLinha(aVertical, aHorizontal, aLargura,
      aAltura: Integer): AnsiString; virtual;

    function ComandoImprimirCaixa(aVertical, aHorizontal, aLargura, aAltura,
      aEspVertical, aEspHorizontal: Integer): AnsiString; virtual;

    function ComandoImprimirImagem(aMultImagem, aVertical, aHorizontal: Integer;
      aNomeImagem: String): AnsiString; virtual;

    function ComandoCarregarImagem(aStream: TStream; aNomeImagem: String;
      aFlipped: Boolean; aTipo: String): AnsiString; virtual;

    property ModeloStr:       String           read fpModeloStr;
    property Temperatura:     Integer          read fTemperatura      write fTemperatura;
    property Velocidade:      Integer          read fVelocidade       write fVelocidade;
    property BackFeed:        TACBrETQBackFeed read fpBackFeed        write fpBackFeed;
    property LimparMemoria:   Boolean          read fpLimparMemoria   write fpLimparMemoria;
    property Unidade:         TACBrETQUnidade  read fUnidade          write fUnidade;
    property Origem:          TACBrETQOrigem   read fpOrigem          write fpOrigem;
    property Avanco:          Integer          read fAvanco           write fAvanco;
    property DPI:             TACBrETQDPI      read fDPI              write fDPI;
end;

implementation

uses
  ACBrConsts, ACBrETQ, ACBrUtil, SysUtils, math;

{ TACBrBAETQClass }

constructor TACBrETQClass.Create(AOwner: TComponent);
begin
  if (not (AOwner is TACBrETQ)) then
    raise Exception.create(ACBrStr('Essa Classe deve ser instanciada por TACBrETQ'));

  fDPI            := dpi203;
  fpLimparMemoria := True;
  fAvanco         := 0;
  fTemperatura    := 10;
  fVelocidade     := -1;
  fUnidade        := etqDecimoDeMilimetros;

  fpModeloStr     := 'N�o Definida';
  fpOrigem        := ogNone;
  fpLimiteCopias  := 999;
end;

procedure TACBrETQClass.ErroNaoImplementado(aNomeMetodo: String);
begin
  raise Exception.Create(ACBrStr('Metodo: ' + aNomeMetodo + ' n�o implementada em: ' + ModeloStr));
end;

function TACBrETQClass.ConverterUnidade(UnidadeSaida: TACBrETQUnidade;
  AValue: Integer): Integer;
var
  DotsMM, DotsPI, ADouble: Double;
begin
  Result := AValue;
  if (UnidadeSaida = Unidade) then
    Exit;

  case DPI of
    dpi300: DotsPI := 300;
    dpi600: DotsPI := 600;
  else
    DotsPI := 203;
  end;

  // 1 Inch = 2.54 cm = 25.4 mm
  DotsMM := DotsPI / CInchCM / 10;
  ADouble := AValue;

  case UnidadeSaida of
    etqMilimetros:
    begin
      case Unidade of
        etqPolegadas:          ADouble := (AValue*10) * CInchCM;
        etqDots:               ADouble := AValue / DotsMM;
        etqDecimoDeMilimetros: ADouble := AValue * 10;
      end;
    end;

    etqPolegadas:
    begin
      case Unidade of
        etqMilimetros:         ADouble := ((AValue/10) / CInchCM);
        etqDots:               ADouble := AValue / DotsPI;
        etqDecimoDeMilimetros: ADouble := ((AValue/100) / CInchCM);
      end;
    end;

    etqDots:
    begin
      case Unidade of
        etqMilimetros:         ADouble := (AValue * DotsMM);
        etqPolegadas:          ADouble := (AValue * DotsPI);
        etqDecimoDeMilimetros: ADouble := ((AValue/10) * DotsMM);
      end;
    end;
  end;

  Result := trunc(RoundTo(ADouble, 0));
end;

procedure TACBrETQClass.AdicionarComandos(ACmd: AnsiString;
  var ACmdList: AnsiString);
begin
  if EstaVazio( ACmd ) then
    Exit;

  if NaoEstaVazio(ACmdList) then
    ACmdList := ACmdList + sLineBreak;

  ACmdList := ACmdList + ACmd;
end;

procedure TACBrETQClass.VerificarLimiteCopias(const NumCopias: Integer);
begin
  if (NumCopias < 1) or (NumCopias > fpLimiteCopias) then
    raise Exception.Create('NumCopias deve ser de 1 a '+IntToStr(fpLimiteCopias));
end;

function TACBrETQClass.ComandoAbertura: AnsiString;
begin
  Result := EmptyStr;
end;

function TACBrETQClass.ComandosIniciarEtiqueta: AnsiString;
var
  ListaComandos: AnsiString;
begin
  ListaComandos := '';

  AdicionarComandos( ComandoBackFeed, ListaComandos );
  AdicionarComandos( ComandoAbertura, ListaComandos );
  AdicionarComandos( ComandoUnidade, ListaComandos );
  if fpLimparMemoria then
    AdicionarComandos( ComandoLimparMemoria, ListaComandos );

  AdicionarComandos( ComandoTemperatura, ListaComandos );
  AdicionarComandos( ComandoResolucao, ListaComandos );
  AdicionarComandos( ComandoOrigemCoordenadas, ListaComandos );
  AdicionarComandos( ComandoVelocidade, ListaComandos );

  Result := ListaComandos;
end;

function TACBrETQClass.ComandosFinalizarEtiqueta(NumCopias: Integer;
  aAvancoEtq: Integer): AnsiString;
var
  ListaComandos: AnsiString;
begin
  ListaComandos := '';

  if (NumCopias <= 0) then
    NumCopias := 1;

  if (aAvancoEtq <= 0) then
    aAvancoEtq := Avanco;

  AdicionarComandos( ComandoCopias(NumCopias), ListaComandos );
  AdicionarComandos( ComandoImprimir, ListaComandos );
  AdicionarComandos( ComandoAvancarEtiqueta(aAvancoEtq), ListaComandos );

  Result := ListaComandos;
end;

function TACBrETQClass.ComandoLimparMemoria: AnsiString;
begin
  Result := EmptyStr;
end;

function TACBrETQClass.ComandoBackFeed: AnsiString;
begin
  Result := EmptyStr;
end;

function TACBrETQClass.ComandoUnidade: AnsiString;
begin
  Result := EmptyStr;
end;

function TACBrETQClass.ComandoTemperatura: AnsiString;
begin
  Result := EmptyStr;
end;

function TACBrETQClass.ComandoResolucao: AnsiString;
begin
  Result := EmptyStr;
end;

function TACBrETQClass.ComandoOrigemCoordenadas: AnsiString;
begin
  Result := EmptyStr;
end;

function TACBrETQClass.ComandoVelocidade: AnsiString;
begin
  Result := EmptyStr;
end;

function TACBrETQClass.ComandoCopias(const NumCopias: Integer): AnsiString;
begin
  VerificarLimiteCopias(NumCopias);
  Result := EmptyStr;
end;

function TACBrETQClass.ComandoImprimir: AnsiString;
begin
  Result := EmptyStr;
end;

function TACBrETQClass.ComandoAvancarEtiqueta(const aAvancoEtq: Integer
  ): AnsiString;
begin
  Result := EmptyStr;
end;

function TACBrETQClass.TratarComandoAntesDeEnviar(aCmd: AnsiString): AnsiString;
begin
  Result := ChangeLineBreak( aCmd, LF );
end;

function TACBrETQClass.ComandoImprimirTexto(aOrientacao: TACBrETQOrientacao;
  aFonte: String; aMultHorizontal, aMultVertical, aVertical,
  aHorizontal: Integer; aTexto: String; aSubFonte: Integer;
  aImprimirReverso: Boolean): AnsiString;
begin
  Result := EmptyStr;
  ErroNaoImplementado('ComandoImprimirTexto');
end;

function TACBrETQClass.ConverterTipoBarras(TipoBarras: TACBrTipoCodBarra
  ): String;
begin
  Result := IntToStr(Integer(TipoBarras));
end;

function TACBrETQClass.ComandoImprimirBarras(aOrientacao: TACBrETQOrientacao;
  aTipoBarras: String; aBarraLarga, aBarraFina, aVertical,
  aHorizontal: Integer; aTexto: String; aAlturaBarras: Integer;
  aExibeCodigo: TACBrETQBarraExibeCodigo): AnsiString;
begin
  Result := EmptyStr;
  ErroNaoImplementado('ComandoImprimirBarras');
end;

function TACBrETQClass.ComandoImprimirLinha(aVertical, aHorizontal, aLargura,
  aAltura: Integer): AnsiString;
begin
  Result := EmptyStr;
  ErroNaoImplementado('ComandoImprimirLinha');
end;

function TACBrETQClass.ComandoImprimirCaixa(aVertical, aHorizontal, aLargura,
  aAltura, aEspVertical, aEspHorizontal: Integer): AnsiString;
begin
  Result := EmptyStr;
  ErroNaoImplementado('ComandoImprimirCaixa');
end;

function TACBrETQClass.ComandoImprimirImagem(aMultImagem, aVertical,
  aHorizontal: Integer; aNomeImagem: String): AnsiString;
begin
  Result := EmptyStr;
  ErroNaoImplementado('ComandoImprimirImagem');
end;

function TACBrETQClass.ComandoCarregarImagem(aStream: TStream;
  aNomeImagem: String; aFlipped: Boolean; aTipo: String): AnsiString;
begin
  Result := EmptyStr;
  ErroNaoImplementado('ComandoCarregarImagem');
end;

end.
