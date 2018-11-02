unit Udescarga;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, Vcl.StdCtrls,
  Vcl.Mask, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFdescarga = class(TForm)
    FDQgrid: TFDQuery;
    DSgrid: TDataSource;
    DBGrid1: TDBGrid;
    FDQgridCODIGO: TIntegerField;
    FDQgridDATA_INI: TDateField;
    FDQgridPLACA: TStringField;
    FDQgridVALOR_ENTREGUE: TBCDField;
    FDQgridCLIENTE: TStringField;
    FDQgridDESCARGA: TBCDField;
    FDQgridPEDAGIO: TBCDField;
    FDQgridVALE: TBCDField;
    FDQgridPERNOITE: TBCDField;
    FDQgridDESP_EXTRA: TBCDField;
    FDQgridDEVOLVIDO: TBCDField;
    FDQgridREMBOLSADO: TBCDField;
    FDQgridOBSERVACAO: TStringField;
    FDQgridMOTORISTA: TIntegerField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fdescarga: TFdescarga;

implementation

uses
  Uconnection;
{$R *.dfm}

end.
