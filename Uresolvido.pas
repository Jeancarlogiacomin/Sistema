unit Uresolvido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons;

type
  TFresolvido = class(TForm)
    Label1: TLabel;
    SBgravar: TSpeedButton;
    SBcancelar: TSpeedButton;
    Edit1: TEdit;
    FDQajustar: TFDQuery;
    FDQajustarCODIGO: TLargeintField;
    FDQajustarDESC: TStringField;
    FDQajustarUSUARIO: TSmallintField;
    FDQajustarDATA_PROBLEMA: TDateField;
    FDQajustarHORA_PROBLEMA: TTimeField;
    FDQajustarRESOLVIDO: TSmallintField;
    FDQajustarMOTIVO: TStringField;
    FDQajustarUSUARIO_RESOLVEU: TSmallintField;
    FDQajustarDATA_RESOLVIDO: TDateField;
    FDQajustarHORA_RESOLVIDO: TTimeField;
    procedure SBgravarClick(Sender: TObject);
    procedure SBcancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fresolvido: TFresolvido;

implementation

{$R *.dfm}


uses
  Uconnection,Uponto;

procedure TFresolvido.SBcancelarClick(Sender: TObject);
begin
  Fresolvido.Close;
end;

procedure TFresolvido.SBgravarClick(Sender: TObject);
var
  texto,usuario,data1,hora1,usuario1:string;

begin
  usuario1:= IntToStr(DataModule2.FDQloginCODIGO.Value);
  data1:=Fponto.Ldata.Caption;
  hora1:=Fponto.Lhora.Caption;
  texto:= Edit1.Text;
  usuario:= IntToStr(Uconnection.DataModule2.FDQloginCODIGO.Value);
  FDQajustar.close;
  FDQajustar.SQL.Clear;
  FDQajustar.SQL.Add('INSERT INTO ponto_erros (DESC,USUARIO,RESOLVIDO,DATA_PROBLEMA,HORA_PROBLEMA) VALUES  ('''+''+texto+''+''','+usuario+',0,'''+''+data1+''+''','''+''+hora1+''+''')');
// ShowMessage(''+FDQincluir.SQL.text+'');
  FDQajustar.ExecSQL;
  Showmessage('Sua duvida foi inserida com SUCESSO'+ #13 +
              'Aguarde o Responsavel entrar em contato');
end;

end.