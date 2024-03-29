unit Uimportaexcel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, uImportExcel,
  Vcl.Buttons, Vcl.DBGrids, Vcl.ComCtrls, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Datasnap.DBClient ;

type
  TFimportaexcel = class(TForm)
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    StringGrid1: TStringGrid;
    OpenDialog1: TOpenDialog;
    ProgressBar1: TProgressBar;
    FDsyscon: TFDConnection;
    SpeedButton2: TSpeedButton;
    FDQcte: TFDQuery;
    FDQupdate: TFDQuery;
    FDQcteID: TIntegerField;
    FDQcteDATA_C: TSQLTimeStampField;
    FDQcteDATA_U: TSQLTimeStampField;
    FDQcteUSUARIO_ID: TIntegerField;
    FDQcteEMPRESA_ID: TIntegerField;
    FDQcteSITUACAO: TSmallintField;
    FDQcteTIPO_SITUACAO: TSmallintField;
    FDQcteNUMERO: TIntegerField;
    FDQcteSERIE: TStringField;
    FDQcteCTRC_REDESPACHO: TIntegerField;
    FDQcteCOMPLEMENTO_ID: TIntegerField;
    FDQcteMANIFESTO_ID: TIntegerField;
    FDQcteFINANCEIRO_ID: TIntegerField;
    FDQcteREMETENTE_ID: TIntegerField;
    FDQcteENDERECO_REMETENTE_ID: TIntegerField;
    FDQcteDESTINATARIO_ID: TIntegerField;
    FDQcteENDERECO_DESTINATARIO_ID: TIntegerField;
    FDQcteCONSIGNATARIO_ID: TIntegerField;
    FDQcteENDERECO_CONSIGNATARIO_ID: TIntegerField;
    FDQcteREDESPACHO_ID: TIntegerField;
    FDQcteENDERECO_REDESPACHO_ID: TIntegerField;
    FDQcteEMITIDO_POR_ID: TIntegerField;
    FDQcteDATA_EMISSAO: TDateField;
    FDQcteDATA_IMPRESSO: TSQLTimeStampField;
    FDQcteCFOP_NUMERO: TIntegerField;
    FDQcteTIPO_FRETE: TSmallintField;
    FDQcteTIPO_FRETE_REDESPACHO: TSmallintField;
    FDQcteLOCAL_COLETA_ID: TIntegerField;
    FDQcteLOCAL_ENTREGA_ID: TIntegerField;
    FDQcteCOBRADO_ATE_ID: TIntegerField;
    FDQctePAGO_POR_ID: TSmallintField;
    FDQctePAGO_POR: TIntegerField;
    FDQcteTRANSPORTE_ID: TIntegerField;
    FDQcteTARA: TBCDField;
    FDQcteTOTAL_QUANTIDADE: TBCDField;
    FDQcteTOTAL_PESOLIQUIDO: TBCDField;
    FDQcteTOTAL_PESOBRUTO: TBCDField;
    FDQcteTOTAL_MERCADORIA: TBCDField;
    FDQctePESO_VOLUME: TFMTBCDField;
    FDQcteSEGURO: TBCDField;
    FDQcteFRETE_VALOR: TBCDField;
    FDQcteSEC_CAT: TBCDField;
    FDQcteDESPACHO: TBCDField;
    FDQctePEDAGIO: TBCDField;
    FDQcteOUTROS: TBCDField;
    FDQcteTOTAL_PRESTACAO: TBCDField;
    FDQcteICMS_BASE: TBCDField;
    FDQcteICMS_ALIQUOTA: TBCDField;
    FDQcteICMS_VALOR: TBCDField;
    FDQcteOBS_ICMS: TMemoField;
    FDQcteOBS_FRETE: TMemoField;
    FDQcteOBS: TMemoField;
    FDQctePRE_CTRC: TIntegerField;
    FDQcteCIA_NF: TIntegerField;
    FDQcteDATA_CARGA: TDateField;
    FDQcteHORA_CARGA: TTimeField;
    FDQcteDATA_INICIO: TDateField;
    FDQcteHORA_INICIO: TTimeField;
    FDQcteDATA_FIM: TDateField;
    FDQcteHORA_FIM: TTimeField;
    FDQcteDATA_DESCARGA: TDateField;
    FDQcteHORA_DESCARGA: TTimeField;
    FDQcteDATA_COMPROVANTE: TDateField;
    FDQcteMOTIVO_CANCEL: TMemoField;
    FDQcteCONTRATO_FRETE_ID: TIntegerField;
    FDQcteNSU_ITENS_ID: TIntegerField;
    FDQcteFORMULA_CALCULO_ID: TIntegerField;
    FDQcteTRANSPORTE_ORIGEM_ID: TIntegerField;
    FDQcteSEGURO_ALIQUOTA: TBCDField;
    FDQcteICMS_SITUACAO: TSmallintField;
    FDQcteICMS_ISENTO: TSmallintField;
    FDQcteICMS_SOBRE_BASE: TBCDField;
    FDQcteROTAS_ID: TIntegerField;
    FDQcteMIC_ID: TIntegerField;
    FDQcteHORA_EMISSAO: TTimeField;
    FDQcteCONTINGENCIA: TSmallintField;
    FDQcteHOMOLOGACAO: TSmallintField;
    FDQcteTIPO_CTE: TSmallintField;
    FDQcteTIPO_SERVICO: TSmallintField;
    FDQcteRETIRA_DESC: TStringField;
    FDQcteCHAVE_CTE: TStringField;
    FDQcteCARGA_FRACIONADA: TSmallintField;
    FDQcteICMS_CST: TStringField;
    FDQcteEH_CTE: TSmallintField;
    FDQcteCCT: TStringField;
    FDQcteARQUIVO_CTE: TMemoField;
    FDQcteSUB_SERIE: TStringField;
    FDQcteCHAVE_CTE_REF: TStringField;
    FDQcteINF_ADICIONAL_ID: TIntegerField;
    FDQcteSTATUS_DOC_ELETRONICO: TSmallintField;
    FDQctePROTOCOLO_SEFAZ: TStringField;
    FDQctePROTOCOLO_CANCEL_SEFAZ: TStringField;
    FDQcteTOTAL_PESOCUBADO: TBCDField;
    FDQcteTARIFA: TFMTBCDField;
    FDQctePEDIDO_FRETE_ID: TIntegerField;
    FDQcteDESCONTO: TBCDField;
    FDQcteTABELA_PRECO_ID: TIntegerField;
    FDQcteICMS_VALOR_CRED_OUT_PRES: TBCDField;
    FDQctePREVISAO_DESCARGA: TSmallintField;
    FDQcteDATA_DESCARGA_FIM: TDateField;
    FDQcteHORA_DESCARGA_FIM: TTimeField;
    FDQcteTIPO_HORA_DESCARGA: TSmallintField;
    FDQcteTIPO_DATA_DESCARGA: TSmallintField;
    FDQcteCIOT: TStringField;
    FDQcteOUTRO_TOMADOR_SERV_ID: TIntegerField;
    FDQcteENDERECO_OUTRO_TOMADOR_SERV_ID: TIntegerField;
    FDQcteVALOR_RECEBER: TBCDField;
    FDQcteTOTAL_TRIBUTOS: TBCDField;
    FDQcteSEC_CAT_DESC: TStringField;
    FDQcteDESPACHO_DESC: TStringField;
    FDQcteOUTROS_DESC: TStringField;
    FDQcteDESCONTO_DESC: TStringField;
    FDQcteCTE_TIPO_EMISSAO: TSmallintField;
    FDQcteSUBCONTRATACAO_ID: TIntegerField;
    FDQcteNATUREZA_CARGA_ID: TIntegerField;
    FDQcteOUTRAS_CARACTERISTICAS: TStringField;
    FDQctePARCEIRO_NEGOCIO_COLETA_ID: TIntegerField;
    FDQctePARCEIRO_NEGOCIO_ENTREGA_ID: TIntegerField;
    FDQcteCARACTERISTICA_ADICIONAL: TStringField;
    FDQcteCARACTERISTICA_SERVICO: TStringField;
    FDQcteE_MAIL_ENVIADO: TSmallintField;
    FDQcteDATA_PREV_ENTREGA: TDateField;
    FDQcteVERSAO_CTE: TSmallintField;
    FDQcteNF_DEVOLUCAO_ID: TIntegerField;
    FDQcteICMS_BASE_UF_FIM: TBCDField;
    FDQcteICMS_ALIQUOTA_UF_FIM: TBCDField;
    FDQcteICMS_ALIQUOTA_INTER: TBCDField;
    FDQcteICMS_ALIQUOTA_PARTILHA: TSmallintField;
    FDQcteICMS_VALOR_UF_INI: TBCDField;
    FDQcteICMS_VALOR_UF_FIM: TBCDField;
    FDQcteICMS_ALIQUOTA_FCP_UF_DEST: TBCDField;
    FDQcteICMS_VALOR_FCP_UF_DEST: TBCDField;
    FDQcteCONSUMIDOR_FINAL: TSmallintField;
    FDQcteCONTEINER_ARMADOR: TStringField;
    FDQcteCONTEINER_NUMERO: TStringField;
    FDQcteCONTEINER_NAVIO: TStringField;
    FDQcteCONTEINER_BOOKING: TStringField;
    FDQcteCONTEINER_DEADLINE: TDateField;
    FDQcteCONTEINER_VALOR: TBCDField;
    FDQcteQUANTIDADE_CARGA_OS: TBCDField;
    FDQcteMODELO: TSmallintField;
    FDQctePARCEIRO_NEGOCIO_IE_ST_ID: TIntegerField;
    FDQcteGLOBALIZADO: TSmallintField;
    FDQcteOBS_GLOBALIZADO: TStringField;
    FDQctePIS_VALOR: TBCDField;
    FDQcteCOFINS_VALOR: TBCDField;
    FDQcteIR_VALOR: TBCDField;
    FDQcteINSS_VALOR: TBCDField;
    FDQcteCSLL_VALOR: TBCDField;
    FDQcteVALOR_CARGA_AVERBADA: TBCDField;
    SBexportar: TSpeedButton;
    DataSource1: TDataSource;
    CDSimportar: TClientDataSet;
    CDSimportarViagem: TStringField;
    CDSimportarData: TStringField;
    CDSimportarNrplaca: TStringField;
    CDSimportarAl�quota: TStringField;
    CDSimportarValorICMS: TStringField;
    CDSimportarTotaldaPresta��o: TStringField;
    CDSimportarNFs: TStringField;
    CDSimportarCTE: TStringField;
    CDSimportarData2: TStringField;
    CDSimportarN�protocolo: TStringField;
    DBGrid1: TDBGrid;
    CDSimportarValordeFrete: TStringField;
    CDSimportarBasedec�lculo: TStringField;
    CDSimportarChavedeacesso: TStringField;
    FDQchave: TFDQuery;
    FDQchaveID: TIntegerField;
    FDQchaveCHAVE_CTE: TStringField;
    FDQchaveNUMERO: TIntegerField;
    FDQchaveDATA_EMISSAO: TDateField;
    FDQchaveTIPO_SITUACAO: TSmallintField;
    FDQchaveSERIE: TStringField;
    FDQchaveEMPRESA_ID: TIntegerField;
    FDQchavePROTOCOLO: TMemoField;
    FDQveic: TFDQuery;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SBexportarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fimportaexcel: TFimportaexcel;

implementation

{$R *.dfm}
uses
  uconnection,Uresolvido,Umenu;




procedure TFimportaexcel.FormActivate(Sender: TObject);
begin
   FDsyscon.Connected:= True;
end;

procedure TFimportaexcel.FormCreate(Sender: TObject);
begin
   CDSimportar.CreateDataSet;
end;

procedure TFimportaexcel.SBexportarClick(Sender: TObject);
begin
   //ImportExcel1.ExportarParaExcel(CDSimportar, 'teste');
end;

procedure TFimportaexcel.SpeedButton1Click(Sender: TObject);
var
   vfile: string;
begin
  if OpenDialog1.Execute then
    begin
      vfile := OpenDialog1.FileName;
      //ImportExcel1.ExcelFile:= vfile;
      //ImportExcel1.ExcelParaStringGrid(StringGrid1, ProgressBar1);

    end;

end;



procedure TFimportaexcel.SpeedButton2Click(Sender: TObject);
var X:integer;
  sql,variavel1, variavel2,variavel3,
  variavel4,variavel5,variavel6,
  variavel7,variavel8,variavel9,
  variavel10,variavel11,variavel12,
  variavel13,variavel14:string;
begin
  ProgressBar1.Max:=StringGrid1.RowCount;
  ProgressBar1.Position := 0;
  for X:= 1 to StringGrid1.RowCount -1 do
  begin
      Application.ProcessMessages;
      ProgressBar1.Position:=ProgressBar1.Position + 1;

      variavel1:=StringGrid1.Cells[0,X];
      variavel2:=StringGrid1.Cells[1,X];
      variavel3:=StringGrid1.Cells[2,X];
      variavel4:=StringGrid1.Cells[3,X];
      variavel5:=StringGrid1.Cells[4,X];
      variavel6:=StringGrid1.Cells[5,X];
      variavel7:=StringGrid1.Cells[6,X];
      variavel8:=StringGrid1.Cells[7,X];
      variavel9:=StringGrid1.Cells[8,X];
      variavel10:=StringGrid1.Cells[9,X];
      variavel11:=StringGrid1.Cells[10,X];
      variavel12:=StringGrid1.Cells[11,X];
      variavel13:=StringGrid1.Cells[12,X];
      variavel14:=StringReplace(DateToStr(date), '/', '.', [rfReplaceall]);

      if variavel1 = '' then

      begin

      end
       else
      begin
          begin
            variavel1:=StringGrid1.Cells[0,X];
            variavel2:=StringGrid1.Cells[1,X];
            variavel3:=StringGrid1.Cells[2,X];
            variavel4:=StringGrid1.Cells[3,X];
            variavel4:=StringReplace(variavel4, ',', '.', [rfReplaceall]);
            variavel5:=StringGrid1.Cells[4,X];
            variavel5:=StringReplace(variavel5, ',', '.', [rfReplaceall]);
            variavel6:=StringGrid1.Cells[5,X];
            variavel6:=StringReplace(variavel6, '0,', '', [rfReplaceall]);
            variavel6:=StringReplace(variavel6, '2', '20', [rfReplaceall]);
            variavel7:=StringGrid1.Cells[6,X];
            variavel7:=StringReplace(variavel7, ',', '.', [rfReplaceall]);
            variavel8:=StringGrid1.Cells[7,X];
            variavel8:=StringReplace(variavel8, ',', '.', [rfReplaceall]);
            variavel9:=StringGrid1.Cells[8,X];
            variavel10:=StringGrid1.Cells[9,X];
            variavel11:=StringGrid1.Cells[10,X];
            variavel12:=StringGrid1.Cells[11,X];
            variavel13:=StringGrid1.Cells[12,X];
         //   FieldByName('IDPEDIDO').AsInteger := StrToInt(ecodigo.Text);



            FDQcte.Close;
            FDQcte.SQL.Text:= ' select c.*  '+
                              ' from ctrc c '+
                              ' left join ctrc_nf nf on nf.ctrc_id=c.id '+
                              ' where c.tipo_situacao = 0 '+
                              ' and nf.numero ='+variavel9+' ';

          //  sql:=FDQcte.SQL.Text;
          //  ShowMessage(''+sql+'');
            FDQcte.Open;
            if FDQcte.RecordCount > 0 then
              begin

                FDQupdate.close;
                FDQupdate.SQL.Clear;
               // FDQincluir.SQL.Add('INSERT INTO ponto (DATA,HORA,ENTRADA_SAIDA,USUARIO,DIA_SEMANA) VALUES ('''+''+data1+''+''','''+''+hora1+''+''','+entrada_saida1+','+usuario1+','+diasemana+')');
                  // ShowMessage(''+FDQincluir.SQL.text+'');
                FDQupdate.SQL.Add('update ctrc    '+
                                  'set '+
                                  ' frete_valor = '+variavel4+' ,'+
                                  ' icms_base='+variavel5+'  ,'+
                                  ' icms_aliquota='+variavel6+'  ,'+
                                  ' icms_valor='+variavel7+'  ,'+
                                  ' icms_cst= '''+'000'+'''   ,'+
                                  ' data_prev_entrega= '''+''+variavel14+''+'''  ,'+
                                  ' total_prestacao= '+variavel8+' ,'+
                                  ' valor_receber= '+variavel8+' ,'+
                                  ' obs_frete=  '+''''+''+variavel1+' '+variavel2+''+''''+' '+
                                  ' where ctrc.id = '+FDQcteID.Text+'');
                //ShowMessage(''+FDQupdate.SQL.text+'');
                FDQupdate.ExecSQL;

                variavel10:=FDQcteNUMERO.Text;
                variavel11:=FDQcteDATA_U.Text;


////////////////////////// VERIFICAR SE TEM CHAVE E PROTOCOLO //////////////////////////


                FDQchave.sql.clear;
                FDQchave.close;
                FDQchave.sql.text:=' select ctrc.id,'+
                                    ' ctrc.chave_cte,'+
                                    ' ctrc.numero,'+
                                    ' ctrc.data_emissao,'+
                                    ' ctrc.tipo_situacao,'+
                                    ' ctrc.serie,'+
                                    ' ctrc.empresa_id,'+

                                    ' (select substring(ctrc_xml.xml from (position('+''''+'<nProt>'+''''+',ctrc_xml.xml)+7) for (position('+''''+'</nProt>'+''''+',ctrc_xml.xml) - (position('+''''+'<nProt>'+''''+',ctrc_xml.xml)+7)))'+
                                    ' from ctrc_xml where (ctrc_xml.ctrc_id = ctrc.id) and (position('+''''+'<nProt>'+''''+',ctrc_xml.xml) > 0)) protocolo'+
                                    ' from ctrc'+
                                    ' where ctrc.id = '+FDQcteID.Text+ ' '+
                                    ' and ( ctrc.tipo_situacao in(0,2))';
                FDQchave.open;
             //   ShowMessage(''+FDQchave.SQL.text+'');

                variavel12:=FDQchavechave_cte.Text;
                variavel13:=FDQchaveprotocolo.Text;


//////////////////////////IMPORTAR NA TABELA PARA DEPOIS EXPORTAR//////////////////////////

                CDSimportar.Insert;

                CDSimportarViagem.AsAnsiString:=variavel1;
                CDSimportarData.AsAnsiString:=variavel2;
                CDSimportarNrplaca.AsAnsiString:=variavel3;
                CDSimportarValordeFrete.AsAnsiString:=variavel4;
                CDSimportarBasedec�lculo.AsAnsiString:=variavel5;
                CDSimportarAl�quota.AsAnsiString:=variavel6;
                CDSimportarValorICMS.AsAnsiString:=variavel7;
                CDSimportarTotaldaPresta��o.AsAnsiString:=variavel8;
                CDSimportarNFs.AsAnsiString:=variavel9;
                CDSimportarCTE.AsAnsiString:=variavel10;
                CDSimportarData2.AsAnsiString:=variavel11;
                CDSimportarChavedeacesso.AsString:=variavel12;
                CDSimportarN�protocolo.AsAnsiString:=variavel13;

                CDSimportar.Post;

///////////////////////////////////////////////////////////////////////////////////////////

                //ShowMessage('VIAGEM NUMERO '+variavel1+' IMPORTADO COM SUCESSO!!!');

              end
                else
              begin
                //ShowMessage('A VIAGEM NUMERO '+variavel1+' NAO TEM CT-E EMITIDO!!!');
              end;


          end;
      end;
  end;
  ShowMessage('CONFERENCIA FINALIZADA!!!');
  ProgressBar1.Position := 0;
end;

procedure TFimportaexcel.SpeedButton3Click(Sender: TObject);
var X:integer;
  variavel1, variavel2,variavel3,
  variavel4,variavel5,variavel6,
  variavel7,variavel8,variavel9,
  variavel10,variavel11,variavel12,
  variavel13,texto:string;
begin
  ProgressBar1.Position := 0;
  for X:= 1 to StringGrid1.RowCount -1 do
  begin
      Application.ProcessMessages;
      ProgressBar1.Position:=ProgressBar1.Position + 1;

      variavel1:=StringGrid1.Cells[0,X];
      variavel2:=StringGrid1.Cells[1,X];
      variavel3:=StringGrid1.Cells[2,X];
      variavel4:=StringGrid1.Cells[3,X];
      variavel5:=StringGrid1.Cells[4,X];
      variavel6:=StringGrid1.Cells[5,X];
      variavel7:=StringGrid1.Cells[6,X];
      variavel8:=StringGrid1.Cells[7,X];
      variavel9:=StringGrid1.Cells[8,X];
      variavel10:=StringGrid1.Cells[9,X];
      variavel11:=StringGrid1.Cells[10,X];
      variavel12:=StringGrid1.Cells[11,X];
      variavel13:=StringGrid1.Cells[12,X];


      if variavel1 = '' then

      begin

      end
       else
      begin
{          begin
            variavel1:=StringGrid1.Cells[0,X];
            variavel2:=StringGrid1.Cells[1,X];
            variavel3:=StringGrid1.Cells[2,X];
            variavel4:=StringGrid1.Cells[3,X];
            variavel4:=StringReplace(variavel4, ',', '.', [rfReplaceall]);
            variavel5:=StringGrid1.Cells[4,X];
            variavel5:=StringReplace(variavel5, ',', '.', [rfReplaceall]);
            variavel6:=StringGrid1.Cells[5,X];
            variavel6:=StringReplace(variavel6, '0,', '', [rfReplaceall]);
            variavel6:=StringReplace(variavel6, '2', '20', [rfReplaceall]);
            variavel7:=StringGrid1.Cells[6,X];
            variavel7:=StringReplace(variavel7, ',', '.', [rfReplaceall]);
            variavel8:=StringGrid1.Cells[7,X];
            variavel8:=StringReplace(variavel8, ',', '.', [rfReplaceall]);
            variavel9:=StringGrid1.Cells[8,X];
            variavel10:=StringGrid1.Cells[9,X];
            variavel11:=StringGrid1.Cells[10,X];
            variavel12:=StringGrid1.Cells[11,X];
            variavel13:=StringGrid1.Cells[12,X];
         //   FieldByName('IDPEDIDO').AsInteger := StrToInt(ecodigo.Text);



            FDQcte.Close;
            FDQcte.SQL.Text:= ' select c.*  '+
                              ' from ctrc c '+
                              ' left join ctrc_nf nf on nf.ctrc_id=c.id '+
                              ' where c.tipo_situacao = 0 '+
                              ' and nf.numero ='+variavel9+' ';

          //  sql:=FDQcte.SQL.Text;
          //  ShowMessage(''+sql+'');
            FDQcte.Open;

//////////////////////////CHECAR RESULTADOS//////////////////////////

//            FDQcte.Close;
//            FDQcte.SQL.Text:= ' select veiculo.cap_carga '+
                              ' from veiculo    '+
//                              ' where veiculo.id = '+FDQcte+' ';

          //  sql:=FDQcte.SQL.Text;
          //  ShowMessage(''+sql+'');
//            FDQcte.Open;


          end;  }
      end;
  end;


end;

end.
