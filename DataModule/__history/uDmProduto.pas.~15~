unit uDmProduto;

interface

uses
  System.SysUtils, System.Classes, IBX.IBCustomDataSet, IBX.IBUpdateSQL,
  IBX.IBDatabase, Data.DB, IBX.IBQuery, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.SqlExpr, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TdmProduto = class(TDataModule)
    cnProduto: TFDConnection;
    tranProduto: TFDTransaction;
    qrTblProdutos: TFDQuery;
    qrTblProdutosPROD_ID: TIntegerField;
    qrTblProdutosPROD_DESCRICAO: TStringField;
    qrTblProdutosPROD_VALOR_CUSTO: TBCDField;
    qrTblProdutosPROD_VALOR_VENDA: TBCDField;
    qrTblProdutosPROD_QTDE_ESTOQUE: TIntegerField;
    dsqrTblProdutos: TDataSource;
    qrTblProdutosPROD_DATA_CADASTRO: TSQLTimeStampField;
    qrTblProdutosPROD_DATA_ALTERACAO: TSQLTimeStampField;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Conecta(Banco: String);
  end;

var
  dmProduto: TdmProduto;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmProduto }

procedure TdmProduto.Conecta(Banco: String);
begin
   cnProduto.Connected := False;
   //cnProduto.Params.
   with cnProduto.Params do
      begin
         DriverID := 'FB';
         Database := Banco;
         UserName := 'sysdba';
         Password := 'masterkey';
         add('CharacterSet=win1251');
      end;

   cnProduto.Open;
   qrTblProdutos.Open;
end;

end.
