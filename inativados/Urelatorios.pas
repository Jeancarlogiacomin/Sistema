unit Urelatorios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.FileCtrl,
  Vcl.Buttons, frxServerClient, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, frxClass, frxDesgn, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, frxDBSet,
  frxBarcode, frxDCtrl;

type
  TFrelatorios = class(TForm)
    Label3: TLabel;
    FileListBox1: TFileListBox;
    Editcaminho: TEdit;
    ProgressBar1: TProgressBar;
    SBabrir: TSpeedButton;
    SBatualizar: TSpeedButton;
    OpenDialog1: TOpenDialog;
    frxReport1: TfrxReport;
    SBEditar: TSpeedButton;
    SBImprimir: TSpeedButton;
    Editnome: TEdit;
    Label1: TLabel;
    SBnovo: TSpeedButton;
    FDQusuario: TFDQuery;
    FDQusuarioCODIGO: TIntegerField;
    FDQusuarioDATA: TDateField;
    FDQusuarioHORA: TTimeField;
    FDQusuarioCOD_ES: TSmallintField;
    FDQusuarioENTRADA_SAIDA: TStringField;
    FDQusuarioUSUARIO: TSmallintField;
    FDQusuarioCOD_DS: TSmallintField;
    FDQusuarioDIA_SEMANA: TStringField;
    frxDBDataset1: TfrxDBDataset;
    frxDialogControls1: TfrxDialogControls;
    frxBarCodeObject1: TfrxBarCodeObject;
    frxDesigner1: TfrxDesigner;
    procedure SBabrirClick(Sender: TObject);
    procedure SBatualizarClick(Sender: TObject);
    procedure SBEditarClick(Sender: TObject);
    procedure SBImprimirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure EditcaminhoChange(Sender: TObject);
    procedure SBnovoClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frelatorios: TFrelatorios;
  caminho:string;

implementation

uses
  Uconnection;
{$R *.dfm}

procedure TFrelatorios.EditcaminhoChange(Sender: TObject);
begin
  FileListBox1.Directory := Editcaminho.Text;
  FileListBox1.Refresh;
end;

procedure TFrelatorios.FormActivate(Sender: TObject);
begin
  FileListBox1.Directory := Editcaminho.Text;
  FileListBox1.Refresh;
end;



procedure TFrelatorios.SBabrirClick(Sender: TObject);
var
  vfile:string;
begin
  if OpenDialog1.Execute then
    begin
       vfile := OpenDialog1.FileName;
       Editcaminho.Text := vfile;
       FileListBox1.Directory := Editcaminho.Text;
       FileListBox1.Refresh;
       caminho:=Editcaminho.Text;
    end;
end;

procedure TFrelatorios.SBatualizarClick(Sender: TObject);
begin
  FileListBox1.Directory := Editcaminho.Text;
  FileListBox1.Refresh;
  caminho:='';
  Editcaminho.Text:='\\GIACOMIN-SERVER\Controle Gerais\2018\JEAN\Sistema\relatorios';
end;
procedure TFrelatorios.SBEditarClick(Sender: TObject);
  var
    rel:string;
begin
  if caminho = '' then
  begin
    rel:= FileListBox1.FileName ;
    ShowMessage(''+rel+'');
    frxReport1.LoadFromFile(''+rel+'');
//    frxReport1.PrepareReport(True);
//    frxReport1.ShowReport;
    frxReport1.DesignReport;

  end else
  begin
    rel:= caminho;
    frxReport1.LoadFromFile(''+rel+'');
    frxReport1.PrepareReport(True);
  //  frxReport1.ShowReport;
    frxReport1.DesignReport;
  end;

end;

procedure TFrelatorios.SBImprimirClick(Sender: TObject);
  var
    rel:string;
begin
  if caminho = '' then
    begin
      rel:=FileListBox1.FileName ;
      ShowMessage(''+rel+'');
      frxReport1.LoadFromFile(''+rel+'');
//      frxReport1.PrepareReport(True);
      frxReport1.ShowReport;
    //  frxReport1.Report;

     // frxReport1;
    end else

    begin
      rel:= caminho;
      frxReport1.LoadFromFile(''+rel+'');
//      frxReport1.PrepareReport(True);
      frxReport1.ShowReport;
      //frxReport1.Report;
    end;
end;



procedure TFrelatorios.SBnovoClick(Sender: TObject);
begin
    frxReport1.LoadFromFile('');
//    frxReport1.PrepareReport(True);
    frxReport1.DesignReport;
end;

end.
