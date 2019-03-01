unit Uprocessos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons, Vcl.WinXCtrls, Vcl.ComCtrls;

type
  TFprocessos = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DSProcesso: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    Label15: TLabel;
    DBEdit15: TDBEdit;
    Label16: TLabel;
    DBEdit16: TDBEdit;
    Label17: TLabel;
    DBEdit17: TDBEdit;
    Label18: TLabel;
    DBEdit18: TDBEdit;
    Label19: TLabel;
    DBEdit19: TDBEdit;
    DBGrid1: TDBGrid;
    SpeedButton6: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    GBcte: TGroupBox;
    Label20: TLabel;
    DBEdit20: TDBEdit;
    GBincluir: TGroupBox;
    ToggleSwitchCTE: TToggleSwitch;
    FDQprocesso: TFDQuery;
    FDQprocessoCODIGO: TLargeintField;
    FDQprocessoPLACA: TIntegerField;
    FDQprocessoDATAINI: TDateField;
    FDQprocessoDATAFIM: TDateField;
    FDQprocessoMOTORISTA: TIntegerField;
    FDQprocessoORIGEM: TIntegerField;
    FDQprocessoCLIENTE: TIntegerField;
    FDQprocessoDATACTE: TDateField;
    FDQprocessoNCTE: TIntegerField;
    FDQprocessoVALORCTE: TBCDField;
    FDQprocessoPEDAGIO: TBCDField;
    FDQprocessoDESCARGA: TBCDField;
    FDQprocessoPRODUTO: TIntegerField;
    FDQprocessoPESO: TBCDField;
    FDQprocessoDIARIODB: TStringField;
    FDQprocessoNF: TStringField;
    FDQprocessoDATAINICANHO: TDateField;
    FDQprocessoCANHOTO: TIntegerField;
    FDQprocessoNUMTERMO: TStringField;
    FDQprocessoQUANTPALLET: TIntegerField;
    FDQprocessoQUANTPALLETDEV: TIntegerField;
    FDQprocessoEMBARQUE: TIntegerField;
    FDQprocessoVALE: TBCDField;
    FDQprocessoVALEDEVOLUCAO: TBCDField;
    FDQprocessoSOBRAFALTA: TBCDField;
    FDQprocessoFINALIZAR: TSmallintField;
    gbpallet: TGroupBox;
    Label21: TLabel;
    DBEdit21: TDBEdit;
    ToggleSwitchpallet: TToggleSwitch;
    Label22: TLabel;
    DBEdit22: TDBEdit;
    Label23: TLabel;
    DBEdit23: TDBEdit;
    FDQcodigoatual: TFDQuery;
    FDQcodigonovo: TFDQuery;
    FDQcodigoatualGEN_ID: TLargeintField;
    DTPdatacte: TDateTimePicker;
    DTPdataINI: TDateTimePicker;
    DTPdataFIM: TDateTimePicker;
    Label24: TLabel;
    DBEdit24: TDBEdit;
    Label25: TLabel;
    DBEdit25: TDBEdit;
    DTPdatainicanho: TDateTimePicker;
    procedure ToggleSwitchCTEClick(Sender: TObject);
    procedure ToggleSwitchpalletClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure DTPdatacteChange(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
    procedure DBEdit3Change(Sender: TObject);
    procedure DBEdit4Change(Sender: TObject);
    procedure DTPdataINIChange(Sender: TObject);
    procedure DTPdataFIMChange(Sender: TObject);
    procedure DTPdatainicanhoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fprocessos: TFprocessos;

implementation

{$R *.dfm}

uses
  uconnection;


procedure TFprocessos.DBEdit1Change(Sender: TObject);

begin
    if DBEdit8.Text <> '' then
    begin
      DTPdatacte.Date := StrToDate(DBEdit8.Text);
    end
      else
    begin
      DTPdatacte.Date := Date();
    end;
end;

procedure TFprocessos.DBEdit3Change(Sender: TObject);
begin
    if DBEdit3.Text <> '' then
    begin
      DTPdataini.Date := StrToDate(DBEdit3.Text);
    end
      else
    begin
      DTPdataini.Date := Date();
    end;
end;

procedure TFprocessos.DBEdit4Change(Sender: TObject);
begin
    if DBEdit4.Text <> '' then
    begin
      DTPdataFIM.Date := StrToDate(DBEdit4.Text);
    end
      else
    begin
      DTPdataFIM.Date := Date();
    end;
end;

procedure TFprocessos.DTPdatacteChange(Sender: TObject);
begin
  DBEdit8.Text := DateToStr(DTPdatacte.Date);
end;

procedure TFprocessos.DTPdataFIMChange(Sender: TObject);
begin
  DBEdit4.Text := DateToStr(DTPdataFIM.Date);
end;

procedure TFprocessos.DTPdatainicanhoChange(Sender: TObject);
begin
  DBEdit25.Text := DateToStr(DTPdatainicanho.Date);
end;

procedure TFprocessos.DTPdataINIChange(Sender: TObject);
begin
  DBEdit3.Text := DateToStr(DTPdataini.Date);
end;

procedure TFprocessos.SpeedButton1Click(Sender: TObject);
begin
  SpeedButton1.Enabled := false;
  SpeedButton3.Enabled := false;
  SpeedButton4.Enabled := true;
  SpeedButton2.Enabled := true;
  SpeedButton5.Enabled := false;
  GBincluir.Enabled :=true;
  FDQprocesso.Insert;
  DBEdit1.Text := IntToStr(FDQcodigoatualGEN_ID.Value+1);
end;

procedure TFprocessos.SpeedButton2Click(Sender: TObject);
begin
  SpeedButton1.Enabled := true;
  SpeedButton3.Enabled := true;
  SpeedButton4.Enabled := false;
  SpeedButton2.Enabled := false;
  SpeedButton5.Enabled := true;
  GBincluir.Enabled :=false;
  FDQprocesso.post;
  if DBEdit1.Text = IntToStr(FDQcodigoatualGEN_ID.Value+1) then
    begin
      FDQcodigonovo.open;
      FDQcodigonovo.Close;
      FDQcodigoatual.Close;
      FDQcodigoatual.Open;
    end;
  FDQprocesso.close;
  FDQprocesso.Open;
end;

procedure TFprocessos.SpeedButton3Click(Sender: TObject);
begin
  SpeedButton1.Enabled := false;
  SpeedButton3.Enabled := false;
  SpeedButton4.Enabled := true;
  SpeedButton2.Enabled := true;
  SpeedButton5.Enabled := false;
  GBincluir.Enabled :=true;
  FDQprocesso.Edit;
end;

procedure TFprocessos.SpeedButton4Click(Sender: TObject);
begin
  SpeedButton1.Enabled := true;
  SpeedButton3.Enabled := true;
  SpeedButton4.Enabled := false;
  SpeedButton2.Enabled := false;
  SpeedButton5.Enabled := true;
  GBincluir.Enabled :=false;
  FDQprocesso.Cancel;
  FDQprocesso.close;
  FDQprocesso.Open;
end;

procedure TFprocessos.SpeedButton5Click(Sender: TObject);

begin

  If MessageDlg('Deseja Excluir Esse Processo Base de dados',mtConfirmation,[mbYes,mbNo],0)=mrYes then
    Begin
      FDQprocesso.Delete;
      Showmessage ('Processo Excluido com Sucesso!');
      FDQprocesso.Refresh;
     {   DBEdit2.Enabled := false;
        DBEdit3.Enabled := false;
        DBEdit4.Enabled := false;
        DBEdit5.Enabled := false;
        DBEdit10.Enabled := false;
        DBComboBox1.Enabled := false;
        DBEdit6.Enabled := false;
        }
    end;
    //SpeedButton1.Enabled := true;

end;

procedure TFprocessos.SpeedButton6Click(Sender: TObject);
begin
   Fprocessos.close; //fecha o form
end;

procedure TFprocessos.ToggleSwitchCTEClick(Sender: TObject);
begin
  if ToggleSwitchcte.state = tssOff then
    begin
      gbcte.Enabled :=False;
    end else
    begin
      gbcte.Enabled :=true;
    end;

end;

procedure TFprocessos.ToggleSwitchpalletClick(Sender: TObject);
begin
  if ToggleSwitchpallet.state = tssOff then
    begin
      gbpallet.Enabled :=False;
    end else
    begin
      gbpallet.Enabled :=true;
    end;

end;

end.
