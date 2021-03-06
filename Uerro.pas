unit Uerro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.Buttons;

type
  TFerro = class(TForm)
    FDQincluir: TFDQuery;
    FDQincluirCODIGO: TLargeintField;
    FDQincluirDESC: TStringField;
    FDQincluirUSUARIO: TSmallintField;
    FDQincluirRESOLVIDO: TSmallintField;
    FDQincluirUSUARIO_RESOLVEU: TSmallintField;
    FDQincluirMOTIVO: TStringField;
    Label1: TLabel;
    SBgravar: TSpeedButton;
    SBcancelar: TSpeedButton;
    Edit1: TEdit;
    procedure SBcancelarClick(Sender: TObject);
    procedure SBgravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Ferro: TFerro;

implementation

{$R *.dfm}
uses
  Uconnection,Uponto;

procedure TFerro.SBcancelarClick(Sender: TObject);
begin
  Ferro.Close;
end;

procedure TFerro.SBgravarClick(Sender: TObject);
var
  texto,usuario,data1,hora1,usuario1:string;

begin
  usuario1:= IntToStr(DataModule2.FDQloginCODIGO.Value);
  data1:=Fponto.Ldata.Caption;
  hora1:=Fponto.Lhora.Caption;
  texto:= Edit1.Text;
  usuario:= IntToStr(Uconnection.DataModule2.FDQloginCODIGO.Value);
  FDQincluir.close;
  FDQincluir.SQL.Clear;
  FDQincluir.SQL.Add('INSERT INTO ponto_erros (DESC,USUARIO,RESOLVIDO,DATA_PROBLEMA,HORA_PROBLEMA) VALUES  ('''+''+texto+''+''','+usuario+',0,'''+''+data1+''+''','''+''+hora1+''+''')');
// ShowMessage(''+FDQincluir.SQL.text+'');
  FDQincluir.ExecSQL;
  Showmessage('Sua duvida foi inserida com SUCESSO'+ #13 +
              ' Aguarde o pessoal Responsavel entrar em contato');
end;

end.
