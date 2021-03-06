unit Uduvidas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, Vcl.StdCtrls,
  Vcl.Mask, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFduvidas = class(TForm)
    FDQduvidas: TFDQuery;
    DSduvidas: TDataSource;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    FDQduvidasCODIGO: TLargeintField;
    FDQduvidasDESC: TStringField;
    FDQduvidasDATA_PROBLEMA: TDateField;
    FDQduvidasHORA_PROBLEMA: TTimeField;
    FDQduvidasUSUARIO: TSmallintField;
    FDQduvidasUSUARIOP: TStringField;
    FDQduvidasRESOLVIDO: TSmallintField;
    FDQduvidasMOTIVO: TStringField;
    FDQduvidasUSUARIO_RESOLVEU: TSmallintField;
    FDQduvidasUSUARIOR: TStringField;
    FDQduvidasDATA_RESOLVIDO: TDateField;
    FDQduvidasHORA_RESOLVIDO: TTimeField;
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fduvidas: TFduvidas;

implementation

{$R *.dfm}
uses
  uconnection,Uresolvido;

procedure TFduvidas.DBGrid1DblClick(Sender: TObject);

begin
  Application.CreateForm(TFresolvido,Fresolvido); //cria o form
  Fresolvido.Showmodal; //mostra o form
  Fresolvido.Free; //libera o form da mem�ria
end;

end.
