unit Uconferencia;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Buttons, Vcl.ComCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFconferencia = class(TForm)
    Edit1: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    Label3: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label4: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Eacesso: TEdit;
    FDQusuario: TFDQuery;
    DataSource1: TDataSource;
    FDQusuarioCODIGO: TIntegerField;
    FDQusuarioDATA: TDateField;
    FDQusuarioHORA: TTimeField;
    FDQusuarioCOD_ES: TSmallintField;
    FDQusuarioENTRADA_SAIDA: TStringField;
    FDQusuarioUSUARIO: TSmallintField;
    FDQusuarioCOD_DS: TSmallintField;
    FDQusuarioDIA_SEMANA: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fconferencia: TFconferencia;

implementation

uses
  Uconnection,Uerro;
{$R *.dfm}

procedure TFconferencia.FormCreate(Sender: TObject);
begin
 Eacesso.Text := IntToStr(DataModule2.FDQloginACESSO.Value);

 if (Eacesso.Text = '1') then
 begin
   Label2.Enabled := false;
   Label3.Enabled := false;
   Edit1.Enabled := false;
   Edit3.Enabled := false;
 end
   else
 begin
    Label2.Enabled := true;
    Label3.Enabled := true;
    Edit1.Enabled := true;
    Edit3.Enabled := true;
 end;

end;

procedure TFconferencia.SpeedButton1Click(Sender: TObject);
begin
if (dayofweek(DateTimePicker1.Date))=1 then
  Showmessage('Esta data cai num domingo')
else
  if (dayofweek(DateTimePicker1.Date))=2 then
    Showmessage('Esta data cai num segunda')
  else
    if (dayofweek(DateTimePicker1.Date))=3 then
      Showmessage('Esta data cai numa terça')
    else
      if (dayofweek(DateTimePicker1.Date))=4 then
        Showmessage('Esta data cai num quarta')
      else
        if (dayofweek(DateTimePicker1.Date))=5 then
          Showmessage('Esta data cai numa quinta')
        else
          if (dayofweek(DateTimePicker1.Date))=6 then
            Showmessage('Esta data cai num sexta')
          else
            if (dayofweek(DateTimePicker1.Date))=7 then
              Showmessage('Esta data cai numa sabado')

end;

procedure TFconferencia.SpeedButton2Click(Sender: TObject);
begin
  Application.CreateForm(TFerro,Ferro); //cria o form
  Ferro.Showmodal; //mostra o form
  Ferro.Free; //libera o form da memória
end;

end.
