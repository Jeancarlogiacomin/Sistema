unit Ulogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.StdCtrls;

type
  TFlogin = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Flogin: TFlogin;

implementation

{$R *.dfm}

uses
  uponto,uconnection;

procedure TFlogin.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
   edit2.SetFocus;

end;

procedure TFlogin.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
   SpeedButton1.Click;
end;

procedure TFlogin.FormActivate(Sender: TObject);
begin
   uconnection.DataModule2.FDConnection.Connected:=true;
   uconnection.DataModule2.FDQlogin.Active:=true;
end;

procedure TFlogin.FormCreate(Sender: TObject);
begin
  If getkeystate(vk_CAPITAL) = 1 then
    begin
      ShowMessage('FAVOR DESLIGAR O CAPSLOCK!!!!!');
    end; // Caps lock está ON
end;

procedure TFlogin.SpeedButton1Click(Sender: TObject);

begin
  DataModule2.FDQlogin.Close;
  DataModule2.FDQlogin.SQL.Clear;
  DataModule2.FDQlogin.SQL.Add('select * from usuarios where nome =:nome and senha =:senha');
  DataModule2.FDQlogin.ParamByName('nome').AsString := edit1.Text;
  DataModule2.FDQlogin.ParamByName('senha').AsString := edit2.Text;
  DataModule2.FDQlogin.Open;
 // ShowMessage(DataModule2.FDQlogin.SQL.Text);
    if (DataModule2.FDQlogin.RecordCount = 1)then
      begin
        Flogin.Visible := false;
        Application.CreateForm(TFponto,Fponto); //cria o form
        Fponto.Showmodal; //mostra o form
        Fponto.Free; //libera o form da memória
      end
        else
      Begin
        If getkeystate(vk_CAPITAL) = 1 then
          begin
            ShowMessage('FAVOR DESLIGAR O CAPSLOCK!!!!!');
          end; // Caps lock está ON
        ShowMessage('SENHA ERRADA !!!');
          {begin
             If MessageDlg('Deseja Excluir o Pedido da Base de dados',mtConfirmation,[mbYes,mbNo],0)=mrYes then
          end;}
      {  FDQuery1.Delete;
        Showmessage ('Pedido Excluido com Sucesso!');

        SpeedButton1.Enabled := true;
       }
      end;

end;

procedure TFlogin.SpeedButton2Click(Sender: TObject);
begin
  Flogin.Close;
end;

procedure TFlogin.SpeedButton3Click(Sender: TObject);
begin

  //ShowMessage(''+LongDayNames[dayofweek(myDate)]+'');
end;

end.
