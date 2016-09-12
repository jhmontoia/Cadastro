unit formPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls;

type
  TfrmPrincipal = class(TForm)
    pnBotoes: TPanel;
    pnCentral: TPanel;
    grdShowProdutos: TDBGrid;
    btnAdicionar: TBitBtn;
    btnSair: TBitBtn;
    btnAtualizar: TBitBtn;
    btnExcluir: TBitBtn;
    btnAlterar: TBitBtn;
    procedure btnSairClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
  private
    { Private declarations }
    procedure AbreCadastroProduto(Caption: String);
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses formCadastroProduto, uDmProduto;

procedure TfrmPrincipal.btnAdicionarClick(Sender: TObject);
begin
   dmProduto.qrTblProdutos.Append;
   try
      dmProduto.qrTblProdutosPROD_DATA_CADASTRO.AsDateTime := Now;
      AbreCadastroProduto((Sender as TBitbtn).Hint);
   except
      if dmProduto.qrTblProdutos.State in [dsEdit, dsInsert] then
         dmProduto.qrTblProdutos.Cancel;
   end;
end;

procedure TfrmPrincipal.btnSairClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmPrincipal.btnAtualizarClick(Sender: TObject);
begin
   dmProduto.qrTblProdutos.Close;
   dmProduto.qrTblProdutos.Open;
end;

procedure TfrmPrincipal.btnExcluirClick(Sender: TObject);
begin
   if (MessageDlg('Após a exclusão não será possível recuperar as informações!' + sLineBreak +
                  'Deseja continuar?',mtConfirmation,[mbYes,mbNo],0)=mrYes) then
      begin
         DmProduto.qrTblProdutos.Delete;
         if dmProduto.tranProduto.Active then
            dmProduto.tranProduto.CommitRetaining;
      end;
end;

procedure TfrmPrincipal.btnAlterarClick(Sender: TObject);
begin
   dmProduto.qrTblProdutos.Edit;
   try
      dmProduto.qrTblProdutosPROD_DATA_ALTERACAO.AsDateTime := Now;
      AbreCadastroProduto((Sender as TBitbtn).Hint);
      if dmProduto.tranProduto.Active then
         dmProduto.tranProduto.CommitRetaining;
   except
      if dmProduto.qrTblProdutos.State in [dsEdit, dsInsert] then
         dmProduto.qrTblProdutos.Cancel;
   end;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
   Application.CreateForm(TdmProduto, dmProduto);
   dmProduto.Conecta(ExtractFilePath(Application.ExeName)+'BD\PRODUTO.FDB');
end;

procedure TfrmPrincipal.AbreCadastroProduto(Caption: String);
begin
   try
      application.CreateForm(TfrmCadastroProduto, frmCadastroProduto);
      frmCadastroProduto.Caption := Caption;
      frmCadastroProduto.ShowModal;
   finally
      frmCadastroProduto.Release;
      frmCadastroProduto := nil;
   end;
end;

end.
