unit Uponto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFponto = class(TForm)
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Lnome: TLabel;
    Lhora: TLabel;
    Timer1: TTimer;
    Ldata: TLabel;
    SBhome: TSpeedButton;
    Eacesso: TEdit;
    FDQpesquisa: TFDQuery;
    FDQincluir: TFDQuery;
    FDQentradasaida: TFDQuery;
    FDQpesquisaMAX: TIntegerField;
    FDQentradasaidaCODIGO: TIntegerField;
    FDQentradasaidaDATA: TDateField;
    FDQentradasaidaHORA: TTimeField;
    FDQentradasaidaENTRADA_SAIDA: TSmallintField;
    FDQentradasaidaUSUARIO: TSmallintField;
    Label1: TLabel;
    procedure FormDestroy(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SBhomeClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fponto: TFponto;

implementation

{$R *.dfm}

uses
  ulogin,uconferencia,Uconnection,Umenu;

procedure TFponto.FormActivate(Sender: TObject);
begin
  Lnome.Caption := DataModule2.FDQloginNomecompleto.Value;

 Eacesso.Text := IntToStr(DataModule2.FDQloginACESSO.Value);

 if (Eacesso.Text = '3') then
 begin
   SBhome.Enabled := false;
   SBhome.Visible := false;

 end
   else
 begin
   SBhome.Enabled := true;
   SBhome.Visible := true;
 end;


end;

procedure TFponto.FormDestroy(Sender: TObject);
begin
  flogin.Close;
end;

procedure TFponto.SBhomeClick(Sender: TObject);
begin
  Application.CreateForm(TFmenu,Fmenu); //cria o form
  Fmenu.Showmodal; //mostra o form
  Fmenu.Free; //libera o form da mem�ria
end;

procedure TFponto.SpeedButton1Click(Sender: TObject);
var
  data1,hora1,entrada_saida1,entrada_saidatext,usuario1,codigomax,diasemana:string;
begin

  data1:=Ldata.Caption;
  hora1:=Lhora.Caption;
  usuario1:= IntToStr(DataModule2.FDQloginCODIGO.Value);
  entrada_saida1:= '1';
  FDQpesquisa.Close;
  FDQpesquisa.SQL.Clear;
  FDQpesquisa.SQL.Add('select max(codigo) from ponto where data = '''+''+data1+''+''' and usuario = '+usuario1+' order by 1');
// ShowMessage(''+FDQincluir.SQL.text+'');
  FDQpesquisa.Open;
  codigomax:=IntToStr(FDQpesquisaMAX.Value);
  if (dayofweek(date))=1 then
  begin
  diasemana:='1';
  end
  else
  begin
    if (dayofweek(date))=2 then
    begin
      diasemana:='2';
    end
    else
    begin
      if (dayofweek(date))=3 then
      begin
        diasemana:='3';
      end
      else
      begin
        if (dayofweek(date))=4 then
        begin
          diasemana:='4';
        end
        else
        begin
          if (dayofweek(Date))=5 then
          begin
            diasemana:='5';
          end
          else
          begin
            if (dayofweek(Date))=6 then
            begin
              diasemana:='6';
            end
            else
            begin
              if (dayofweek(Date))=7 then
              begin
                diasemana:='7';
              end;
            end;
          end;
        end;
      end;
    end;
  end;


  if FDQpesquisa.RecordCount = 1 then
  begin
    FDQentradasaida.Close;
    FDQentradasaida.SQL.Clear;
    FDQentradasaida.SQL.Add('select * from ponto where codigo = '+codigomax+'');
  // ShowMessage(''+FDQincluir.SQL.text+'');
    FDQentradasaida.Open;

    if ((Uconnection.DataModule2.FDQloginENTRADA.Value) > (time) - StrToTime('00:30:00')) and ((Uconnection.DataModule2.FDQloginENTRADA.Value) < (time) + StrToTime('00:30:00')) then
    begin
      entrada_saida1:= '1';
      Showmessage('Esta data cai num domingo '+Lhora.caption+'');
    end
    else
      begin
        if ((Uconnection.DataModule2.FDQloginSAIDA_ALMOCO.Value) > (time) - StrToTime('00:30:00')) and ((Uconnection.DataModule2.FDQloginSAIDA_ALMOCO.Value) < (time) + StrToTime('00:30:00')) then
        //if (Uconnection.DataModule2.FDQloginSAIDA_ALMOCO.Value) = (StrToTime(Lhora.caption)) then
        begin
          entrada_saida1:= '2';
          Showmessage('Esta data cai num segunda'+Lhora.caption+'');
        end
        else
        begin
          if ((Uconnection.DataModule2.FDQloginENTRADA_ALMOCO.Value) > (time) - StrToTime('00:30:00')) and ((Uconnection.DataModule2.FDQloginENTRADA_ALMOCO.Value) < (time) + StrToTime('00:30:00')) then
          //if (Uconnection.DataModule2.FDQloginENTRADA_ALMOCO.Value) = (StrToTime(Lhora.caption)) then
          begin
            entrada_saida1:= '3';
            Showmessage('Esta data cai numa ter�a'+Lhora.caption+'');
          end
          else
          begin
            if ((Uconnection.DataModule2.FDQloginSAIDA.Value) > (time) - StrToTime('00:30:00')) and ((Uconnection.DataModule2.FDQloginSAIDA.Value) < (time) + StrToTime('00:30:00')) then
            //if (Uconnection.DataModule2.FDQloginSAIDA.Value) = (StrToTime(Lhora.caption)) then
            begin
              entrada_saida1:= '4';
              Showmessage('Esta data cai num quarta'+Lhora.caption+'');
            end
            else
            begin
              if ((Uconnection.DataModule2.FDQloginENTRADA_SABADO.Value) > (time) - StrToTime('00:30:00')) and ((Uconnection.DataModule2.FDQloginENTRADA_SABADO.Value) < (time) + StrToTime('00:30:00')) then
              //if (Uconnection.DataModule2.FDQloginENTRADA_SABADO.Value) = (StrToTime(Lhora.caption)) then
              begin
                entrada_saida1:= '5';
                Showmessage('Esta data cai numa quinta'+Lhora.caption+'');
              end
              else
              begin
                if ((Uconnection.DataModule2.FDQloginSAIDA_SABADO.Value) > (time) - StrToTime('00:30:00')) and ((Uconnection.DataModule2.FDQloginSAIDA_SABADO.Value) < (time) + StrToTime('00:30:00')) then
                //if (Uconnection.DataModule2.FDQloginSAIDA_SABADO.Value) = (StrToTime(Lhora.caption)) then
                begin
                  entrada_saida1:= '6';
                  Showmessage('Esta data cai num sexta'+Lhora.caption+'');
                end;
              end;
            end;
          end;
        end;
      end;


   { if FDQentradasaidaENTRADA_SAIDA.Value = 1 then
      begin
        entrada_saida1:= '2';
        entrada_saidatext:='SAIDA  !!';
      end
      else
      begin
        entrada_saida1:= '1';
        entrada_saidatext:='ENTRADA  !!';
      end;   }

  end;

  FDQincluir.close;
  FDQincluir.SQL.Clear;
  FDQincluir.SQL.Add('INSERT INTO ponto (DATA,HORA,ENTRADA_SAIDA,USUARIO,DIA_SEMANA) VALUES ('''+''+data1+''+''','''+''+hora1+''+''','+entrada_saida1+','+usuario1+','+diasemana+')');
// ShowMessage(''+FDQincluir.SQL.text+'');
  FDQincluir.ExecSQL;
  Showmessage(''+entrada_saidatext+'        INSERIDO COM SUCESSO!');


end;

procedure TFponto.SpeedButton2Click(Sender: TObject);
begin

  Application.CreateForm(TFconferencia,Fconferencia); //cria o form
  Fconferencia.Showmodal; //mostra o form
  Fconferencia.Free; //libera o form da mem�ria

end;

procedure TFponto.Timer1Timer(Sender: TObject);
begin

  Lhora.caption := timetostr(time);
  //Ldata.caption := DateToStr(date);
  Ldata.caption := StringReplace(DateToStr(date), '/', '.', [rfReplaceall]);

end;


end.
