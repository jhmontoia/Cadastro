create table produto
(
   prod_Id integer not null primary key,
   prod_Descricao varchar(100),
   prod_Valor_Custo numeric(14,2),
   prod_Valor_Venda numeric(14,2),
   prod_Qtde_Estoque integer
);

Create generator gen_Prod_Id;

alter sequence gen_Prod_Id restart with 0;

Commit;

