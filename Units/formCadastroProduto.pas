unit formCadastroProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Mask, Vcl.DBCtrls, Data.DB;

type
  TfrmCadastroProduto = class(TForm)
    Panel1: TPanel;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    Panel2: TPanel;
    Panel3: TPanel;
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
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroProduto: TfrmCadastroProduto;

implementation

{$R *.dfm}

uses uDmProduto;

procedure TfrmCadastroProduto.btnCancelarClick(Sender: TObject);
begin
   dmProduto.qrTblProdutos.Cancel;
   Close;
end;

procedure TfrmCadastroProduto.btnGravarClick(Sender: TObject);
begin
   dmProduto.qrTblProdutos.Post;
   Close;
end;

procedure TfrmCadastroProduto.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   if (dmProduto.qrTblProdutos.State in [dsEdit, dsInsert]) then
      begin
         if (MessageDlg('Fechar a tela irá descartar as alterações!' + sLineBreak +
                        'Deseja continuar?',mtConfirmation,[mbYes,mbNo],0)=mrYes) then
            begin
               CanClose := True;
               dmProduto.qrTblProdutos.Cancel;
            end
         else
            CanClose := False;
      end;
end;

procedure TfrmCadastroProduto.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      begin
         Key := #0;
         Perform(WM_NEXTDLGCTL,0,0);
      end;
end;

end.
