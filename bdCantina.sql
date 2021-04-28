create database bdCantina
go

use bdCantina

--Criação das tabelas

create table tblCliente
(
id_tblCliente int identity(1,1) primary key not null,
saldo_tblCliente float,
tel_tblCliente char(11) unique not null,
senha_tblCliente varchar not null,
email_tblCliente varchar unique not null,
nome_tblCliente varchar not null
)
create table tblPedido
(
id_tblPedido int primary key identity(1,1) not null,
id_tblCliente int not null,
codTipoPag_tblPagamento int not null,
dataPedido_tblPedido date not null,
preco_tblPedido float not null,
ret_tblPedido bit not null,
)
create table tblProduto
(
id_tblProduto int primary key identity(1,1) not null,
cod_tblCategoria int not null,
nome_tblProduto varchar not null,
preco_tblProduto float not null,
imagemUrl_tblProduto varchar not null,
valiade_tblProduto date not null,
qtdEstoque_tblProduto int not null,
)
create table tblPedidoProduto
(
id_tblPedidoProduto int primary key identity(1,1) not null,
id_tblPedido int not null,
id_tblProduto int not null,
qtd_tblProduto int not null,
valorUnitProd_tblPedidoProduto float not null
)
create table tblHistoricoEstoque
(
id_tblHistoricoEstoque int primary key identity(1,1) not null,
id_tblPedidoProduto int not null,
id_tblProduto int not null,
histQtd_tblHistoricoEstoque date not null,
natOperacao_tblHistoricoEstoque bit not null,
)
create table tblPagamento
(
codTipoPag_tblPagamento int primary key identity(1,1) not null,
nomeTipoPag_tblPagamento varchar not null
)
create table tblCategoria 
(
cod_tblCategoria int primary key identity(1,1) not null,
nome_tblCategoria varchar not null
)
-- Criação dos relacionamentos

-- pedido - cliente / pagamento
alter table tblPedido with check add constraint FK_tblPedido_tblCliente foreign key (id_tblCliente)
references tblCliente (id_tblCliente)
go

alter table tblPedido check constraint FK_tblPedido_tblCliente
go

alter table tblPedido with check add constraint FK_tblPedido_tblPagamento foreign key (codTipoPag_tblPagamento)
references tblPagamento (codTipoPag_tblPagamento)
go

alter table tblPedido check constraint FK_tblPedido_tblPagamento
go

-- pedidoProduto - pedido / produto
alter table tblPedidoProduto with check add constraint FK_tblPedidoProduto_tblPedido foreign key (id_tblPedido)
references tblPedido (id_tblPedido)
go

alter table tblPedidoProduto check constraint FK_tblPedidoProduto_tblPedido
go

alter table tblPedidoProduto with check add constraint FK_tblPedidoProduto_tblProduto foreign key (id_tblProduto)
references tblProduto (id_tblProduto)
go

alter table tblPedidoProduto check constraint FK_tblPedidoProduto_tblProduto
go

-- historicoEstoque  - pedidoProduto / produto
alter table tblHistoricoEstoque with check add constraint FK_tblHistoricoEstoque_tblPedidoProduto foreign key (id_tblPedidoProduto)
references tblPedidoProduto (id_tblPedidoProduto)
go

alter table tblHistoricoEstoque check constraint FK_tblHistoricoEstoque_tblPedidoProduto
go

alter table tblHistoricoEstoque with check add constraint FK_tblHistoricoEstoque_tblProduto foreign key (id_tblProduto)
references tblProduto (id_tblProduto)
go

alter table tblHistoricoEstoque check constraint FK_tblHistoricoEstoque_tblProduto
go

--produto - categoria
alter table tblProduto with check add constraint FK_tblProduto_tblCategoria foreign key (cod_tblCategoria)
references tblCategoria (cod_tblCategoria)
go

alter table tblProduto check constraint FK_tblProduto_tblCategoria
go

-- inserindo valores exemplares na tabela produtos
/*
id_tblProduto int primary key identity(1,1) not null,
nome_tblProduto varchar not null,
preco_tblProduto float not null,
imagemUrl_tblProduto varchar not null,
valiade_tblProduto date not null,
qtdEstoque_tblProduto int not null,

insert into tblProduto values ('')
insert into tblProduto values ('')
insert into tblProduto values ('')
insert into tblProduto values ('')
insert into tblProduto values ('')
insert into tblProduto values ('')
insert into tblProduto values ('')
insert into tblProduto values ('')
insert into tblProduto values ('')
insert into tblProduto values ('')
*/
