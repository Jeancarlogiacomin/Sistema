unit Uimportamdfe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ACBrBase, ACBrDFe, ACBrNFe, Vcl.Buttons,
  Vcl.StdCtrls, Vcl.FileCtrl, Vcl.ComCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFimportamdfe = class(TForm)
    ACBrNFe1: TACBrNFe;
    SpeedButton1: TSpeedButton;
    OpenDialog1: TOpenDialog;
    SpeedButton2: TSpeedButton;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    FileListBox1: TFileListBox;
    Editcaminho: TEdit;
    SBabrir: TSpeedButton;
    SBatualizar: TSpeedButton;
    Label3: TLabel;
    ProgressBar1: TProgressBar;
    FDsyscon: TFDConnection;
    FDQinsert: TFDQuery;
    FDQcidade: TFDQuery;
    Label4: TLabel;
    Edit2: TEdit;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SBabrirClick(Sender: TObject);
    procedure SBatualizarClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fimportamdfe: TFimportamdfe;

implementation

{$R *.dfm}




procedure TFimportamdfe.SBabrirClick(Sender: TObject);
var
  vfile:string;
begin
  if OpenDialog1.Execute then
    begin
       vfile := OpenDialog1.FileName;
       Editcaminho.Text := vfile;
       FileListBox1.Directory := Editcaminho.Text;
       FileListBox1.Refresh;
    end;
end;

procedure TFimportamdfe.SBatualizarClick(Sender: TObject);
begin
  FileListBox1.Directory := Editcaminho.Text;
  FileListBox1.Refresh;
end;

procedure TFimportamdfe.SpeedButton1Click(Sender: TObject);

var
  PBtotal2,PLtotal2:Currency;
  I,I1,totalimportado,Qtotal:integer;
  vfile,vlocal,importado,
  DATA_C,
  DATA_U,
  USUARIO_ID,
  EMPRESA_ID,
  SITUACAO,
  MANIFESTO_ID,
  CHAVE_NFE,
  MODELO,
  NUMERO,
  SERIE,
  DATA_EMISSAO,
  VALOR,
  QUANTIDADE,
  PLtotal,
  PESO_LIQUIDO,
  PBtotal,
  PESO_BRUTO,
  CIDADE_ENTREGA_ID,
  DESCRICAO_OUTROS_DOC,
  XML,
  DADOS_ADICIONAIS: string;
begin
  vlocal := '';
  CIDADE_ENTREGA_ID:=Edit2.Text;
  for I := 0 to FileListBox1.Items.Count - 1 do
  begin
    ProgressBar1.Position:=ProgressBar1.Position + 1;
    vlocal := FileListBox1.Items[I]; // uma lista separada por ´;´
//    ShowMessage(''+vlocal+'');
    vfile := ''+FileListBox1.Directory+'\'+vlocal+'';
    Label1.Caption := vfile;
    ACBrNFe1.NotasFiscais.Clear;
    ACBrNFe1.NotasFiscais.LoadFromFile(vfile);

    for I1:= 0 to (ACBrNFe1.NotasFiscais.Items[0].NFe.Det.Count - 1) do
      begin
        NUMERO:=IntToStr(ACBrNFe1.NotasFiscais.Items[0].NFe.Ide.nNF); //numero da nota
        CHAVE_NFE:=StringReplace(ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID, 'NFe', '', [rfReplaceall]); // Chave de acesso
        SERIE:=IntToStr(ACBrNFe1.NotasFiscais.Items[0].NFe.Ide.serie);//numero do SERIE
        DATA_C:=StringReplace(DateToStr(ACBrNFe1.NotasFiscais.Items[0].NFe.ide.dEmi), '/', '.', [rfReplaceall]);
//        variavel14:=StringReplace(DateToStr(date), '/', '.', [rfReplaceall]);
        DATA_C:=DATA_C;
        DATA_U:=DATA_C;
        USUARIO_ID:='23';
        EMPRESA_ID:='6';
        SITUACAO:='1';
        MANIFESTO_ID:=edit1.Text;
        MODELO:='55';
        DATA_EMISSAO:=DATA_C;
        VALOR:=CurrToStr(ACBrNFe1.NotasFiscais.Items[0].NFe.Cobr.Fat.vOrig);
        Qtotal:=Qtotal+ACBrNFe1.NotasFiscais.Items[0].NFe.Transp.Vol.Items[0].qVol;
        QUANTIDADE:=IntToStr(Qtotal);
        PLtotal:=CurrToStr(ACBrNFe1.NotasFiscais.Items[0].NFe.Transp.vol.Items[0].pesoL);
        if StrToFloat(PLtotal) > 0 then
          begin
            PLtotal2:=StrToFloat(PLtotal);
            PLtotal2:=StrToCurr(FormatCurr('0.00', PLtotal2));
            PESO_LIQUIDO:=CurrToStr(PLtotal2);
          end;

        PBtotal:=CurrToStr(ACBrNFe1.NotasFiscais.Items[0].NFe.Transp.vol.Items[0].pesoB);
        if StrToFloat(PBtotal) > 0 then
          begin
            PBtotal2:=StrToFloat(PBtotal);
            PBtotal2:=StrToCurr(FormatCurr('0.00', PBtotal2));
            PESO_BRUTO:=CurrToStr(PBtotal2);
          end;

        DESCRICAO_OUTROS_DOC:='';
        XML:='';
        DADOS_ADICIONAIS:='';
//          PESO_BRUTO:=CurrToStr(PBtotal2);
//          PESO_LIQUIDO:=CurrToStr(PLtotal2);
      end;

//  ShowMessage('Numero da nota :'+a+',' +
//              '         Numero do chave de acesso  :'+b+'' +
//              '         Numero do protocolo de autenticação :'+c+''+
//              '         Unidade de medida :'+d+'');
////////////////////////////////////////////////////////////////////////////////////
          VALOR:=StringReplace(VALOR, ',', '.', [rfReplaceall]);
          PESO_LIQUIDO:=StringReplace(PESO_LIQUIDO, ',', '.', [rfReplaceall]);
          PESO_BRUTO:=StringReplace(PESO_BRUTO, ',', '.', [rfReplaceall]);
//        variavel8:=StringReplace(variavel8, ',', '.', [rfReplaceall]);

////////////////////////////////////valores////////////////////////////////////////
        importado:='data -'+        DATA_C     +''+
                    'data -'+        DATA_U     +''+
                    'usuario -'+        USUARIO_ID +''+
                    'empresa -'+        EMPRESA_ID +''+
                    'situação -'+        SITUACAO   +''+
                    'numero do manifesto -'+     MANIFESTO_ID  +''+
                    'chave de acesso -'+     CHAVE_NFE     +''+
                    'modelo -'+     MODELO        +''+
                    'numero -'+     NUMERO        +''+
                    'serie -'+     SERIE         +''+
                    'data -'+     DATA_EMISSAO  +''+
                    'valor -'+     VALOR         +''+
                    'quantidade -'+     QUANTIDADE    +''+
                    'peso liquido -'+     PESO_LIQUIDO  +''+
                    'peso bruto -'+     PESO_BRUTO    +''+
                    'cidade entrega -'+     CIDADE_ENTREGA_ID+''+
                    'descrição -'+     DESCRICAO_OUTROS_DOC+''+
                    'xml -'+     XML           +''+
                    'dados adicionais -'+     DADOS_ADICIONAIS+'';

      //  ShowMessage(''+importado+'');
        FDQinsert.sql.Clear;
        FDQinsert.SQL.Add('INSERT INTO MANIFESTO_NF_TERC (DATA_C,DATA_U,USUARIO_ID,EMPRESA_ID,SITUACAO,MANIFESTO_ID,CHAVE_NFE,MODELO,NUMERO,SERIE,DATA_EMISSAO,VALOR,QUANTIDADE,PESO_LIQUIDO,PESO_BRUTO,CIDADE_ENTREGA_ID,DESCRICAO_OUTROS_DOC,XML,DADOS_ADICIONAIS)'+
                          'VALUES ('''+''+DATA_C+''+''','''+''+DATA_U+''+''','''+USUARIO_ID+''','''+EMPRESA_ID+''','''+SITUACAO+''','''+MANIFESTO_ID+''','''+CHAVE_NFE+''','''+MODELO+''','''+NUMERO+''','''+SERIE+''','''+''+DATA_EMISSAO+''+''','''+VALOR+''','''+QUANTIDADE+''','''+PESO_LIQUIDO+''','''+PESO_BRUTO+''','''+CIDADE_ENTREGA_ID+''','''+DESCRICAO_OUTROS_DOC+''','''+XML+''','''+DADOS_ADICIONAIS+''' )');
        FDQinsert.ExecSQL;
        ShowMessage(''+FDQinsert.SQL.Text+'');

   Label1.Caption:=vfile;
   Label1.Refresh;
   totalimportado:=totalimportado+1;
  end;
  ShowMessage('No manifesto '+edit1.text+' Foram Importadas '+IntToStr(totalimportado)+' Notas !!!');
end;






procedure TFimportamdfe.SpeedButton2Click(Sender: TObject);

var
  PBtotal2,PLtotal2:Currency;
  I,I1,totalimportado,Qtotal:integer;
  vfile,vlocal,importado,
  DATA_C,
  DATA_U,
  USUARIO_ID,
  EMPRESA_ID,
  SITUACAO,
  MANIFESTO_ID,
  CHAVE_NFE,
  MODELO,
  NUMERO,
  SERIE,
  DATA_EMISSAO,
  VALOR,
  QUANTIDADE,
  PLtotal,
  PESO_LIQUIDO,
  PBtotal,
  PESO_BRUTO,
  CIDADE_ENTREGA_ID,
  DESCRICAO_OUTROS_DOC,
  XML,
  DADOS_ADICIONAIS: string;
begin
  vlocal := '';
  CIDADE_ENTREGA_ID:=Edit2.Text;
  for I := 0 to FileListBox1.Items.Count - 1 do
  begin
    ProgressBar1.Position:=ProgressBar1.Position + 1;
    vlocal := FileListBox1.Items[I]; // uma lista separada por ´;´
//    ShowMessage(''+vlocal+'');
    vfile := ''+FileListBox1.Directory+'\'+vlocal+'';
    Label1.Caption := vfile;
    ACBrNFe1.NotasFiscais.Clear;
    ACBrNFe1.NotasFiscais.LoadFromFile(vfile);

    for I1:= 0 to (ACBrNFe1.NotasFiscais.Items[0].NFe.Det.Count - 1) do
      begin
        NUMERO:=IntToStr(ACBrNFe1.NotasFiscais.Items[0].NFe.Ide.nNF); //numero da nota
        CHAVE_NFE:=StringReplace(ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID, 'NFe', '', [rfReplaceall]); // Chave de acesso
        SERIE:=IntToStr(ACBrNFe1.NotasFiscais.Items[0].NFe.Ide.serie);//numero do SERIE
        DATA_C:=StringReplace(DateToStr(ACBrNFe1.NotasFiscais.Items[0].NFe.ide.dEmi), '/', '.', [rfReplaceall]);
//        variavel14:=StringReplace(DateToStr(date), '/', '.', [rfReplaceall]);
        DATA_C:=DATA_C;
        DATA_U:=DATA_C;
        USUARIO_ID:='23';
        EMPRESA_ID:='6';
        SITUACAO:='1';
        MANIFESTO_ID:=edit1.Text;
        MODELO:='55';
        DATA_EMISSAO:=DATA_C;
        VALOR:=CurrToStr(ACBrNFe1.NotasFiscais.Items[0].NFe.Cobr.Fat.vOrig);
        Qtotal:=Qtotal+ACBrNFe1.NotasFiscais.Items[0].NFe.Transp.Vol.Items[0].qVol;
        QUANTIDADE:=IntToStr(Qtotal);
        PLtotal:=CurrToStr(ACBrNFe1.NotasFiscais.Items[0].NFe.Transp.vol.Items[0].pesoL);
        if StrToFloat(PLtotal) > 0 then
          begin
            PLtotal2:=StrToFloat(PLtotal);
            PLtotal2:=StrToCurr(FormatCurr('0.00', PLtotal2));
            PESO_LIQUIDO:=CurrToStr(PLtotal2);
          end;

        PBtotal:=CurrToStr(ACBrNFe1.NotasFiscais.Items[0].NFe.Transp.vol.Items[0].pesoB);
        if StrToFloat(PBtotal) > 0 then
          begin
            PBtotal2:=StrToFloat(PBtotal);
            PBtotal2:=StrToCurr(FormatCurr('0.00', PBtotal2));
            PESO_BRUTO:=CurrToStr(PBtotal2);
          end;

        DESCRICAO_OUTROS_DOC:='';
        XML:='';
        DADOS_ADICIONAIS:='';
//          PESO_BRUTO:=CurrToStr(PBtotal2);
//          PESO_LIQUIDO:=CurrToStr(PLtotal2);
      end;

//  ShowMessage('Numero da nota :'+a+',' +
//              '         Numero do chave de acesso  :'+b+'' +
//              '         Numero do protocolo de autenticação :'+c+''+
//              '         Unidade de medida :'+d+'');
////////////////////////////////////////////////////////////////////////////////////
          VALOR:=StringReplace(VALOR, ',', '.', [rfReplaceall]);
          PESO_LIQUIDO:=StringReplace(PESO_LIQUIDO, ',', '.', [rfReplaceall]);
          PESO_BRUTO:=StringReplace(PESO_BRUTO, ',', '.', [rfReplaceall]);
//        variavel8:=StringReplace(variavel8, ',', '.', [rfReplaceall]);

////////////////////////////////////valores////////////////////////////////////////
        importado:='data -'+        DATA_C     +''+
                    'data -'+        DATA_U     +''+
                    'usuario -'+        USUARIO_ID +''+
                    'empresa -'+        EMPRESA_ID +''+
                    'situação -'+        SITUACAO   +''+
                    'numero do manifesto -'+     MANIFESTO_ID  +''+
                    'chave de acesso -'+     CHAVE_NFE     +''+
                    'modelo -'+     MODELO        +''+
                    'numero -'+     NUMERO        +''+
                    'serie -'+     SERIE         +''+
                    'data -'+     DATA_EMISSAO  +''+
                    'valor -'+     VALOR         +''+
                    'quantidade -'+     QUANTIDADE    +''+
                    'peso liquido -'+     PESO_LIQUIDO  +''+
                    'peso bruto -'+     PESO_BRUTO    +''+
                    'cidade entrega -'+     CIDADE_ENTREGA_ID+''+
                    'descrição -'+     DESCRICAO_OUTROS_DOC+''+
                    'xml -'+     XML           +''+
                    'dados adicionais -'+     DADOS_ADICIONAIS+'';

      //  ShowMessage(''+importado+'');
        FDQinsert.sql.Clear;
        FDQinsert.SQL.Add('INSERT INTO MANIFESTO_NF_TERC (DATA_C,DATA_U,USUARIO_ID,EMPRESA_ID,SITUACAO,MANIFESTO_ID,CHAVE_NFE,MODELO,NUMERO,SERIE,DATA_EMISSAO,VALOR,QUANTIDADE,PESO_LIQUIDO,PESO_BRUTO,CIDADE_ENTREGA_ID,DESCRICAO_OUTROS_DOC,XML,DADOS_ADICIONAIS)'+
                          'VALUES ('''+''+DATA_C+''+''','''+''+DATA_U+''+''','''+USUARIO_ID+''','''+EMPRESA_ID+''','''+SITUACAO+''','''+MANIFESTO_ID+''','''+CHAVE_NFE+''','''+MODELO+''','''+NUMERO+''','''+SERIE+''','''+''+DATA_EMISSAO+''+''','''+VALOR+''','''+QUANTIDADE+''','''+PESO_LIQUIDO+''','''+PESO_BRUTO+''','''+CIDADE_ENTREGA_ID+''','''+DESCRICAO_OUTROS_DOC+''','''+XML+''','''+DADOS_ADICIONAIS+''' )');
        ShowMessage(''+FDQinsert.SQL.Text+'');

   Label1.Caption:=vfile;
   Label1.Refresh;
   totalimportado:=totalimportado+1;
  end;
  ShowMessage('No manifesto '+edit1.text+' Foram Importadas '+IntToStr(totalimportado)+' Notas !!!');
end;






end.
