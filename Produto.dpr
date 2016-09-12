program Produto;

uses
  Vcl.Forms,
  formPrincipal in 'Units\formPrincipal.pas' {frmPrincipal},
  uDmProduto in 'DataModule\uDmProduto.pas' {dmProduto: TDataModule},
  formCadastroProduto in 'Units\formCadastroProduto.pas' {frmCadastroProduto};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);

  Application.Run;
end.
