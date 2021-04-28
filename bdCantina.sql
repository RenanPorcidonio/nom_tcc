create database bdCantina
go

use bdCantina

--Criação das tabelas

create table tblCliente
(
	idCliente int identity(1,1) primary key not null,
	nomeCliente varchar not null,
	emailCliente varchar unique not null,
	senhaCliente varchar not null,
	telCliente char(11) unique not null,
	saldoCliente smallmoney

)
create table tblPedido
(
	idPedido int primary key identity(1,1) not null,
	idCliente int not null,
	dataPedido date not null,
	precoPedido smallmoney not null,
	codTipoPag int not null,
	retPedido bit not null,
)
create table tblProduto
(
	idProduto int primary key identity(1,1) not null,
	nomeProduto varchar not null,
	precoProduto smallmoney not null,
	imgProduto varchar not null,
	valProduto date not null,
	qtdEstoqueProduto int not null,
	codCategoria int not null,
)
create table tblPedidoProduto
(
	idPedidoProduto int primary key identity(1,1) not null,
	idPedido int not null,
	idProduto int not null,
	qtdProduto int not null,
	valorUnitProd smallmoney not null
)
create table tblHistoricoEstoque
(
	idHistEstoque int primary key identity(1,1) not null,
	idPedidoProduto int not null,
	idProduto int not null,
	histQtd date not null,
	natOperacao bit not null,
)
create table tblPagamento
(
	codTipoPag int primary key identity(1,1) not null,
	nomeTipoPag varchar not null
)
create table tblCategoria 
(
	codCategoria int primary key identity(1,1) not null,
	nomeCategoria varchar not null
)
-- Criação dos relacionamentos

-- pedido - cliente / pagamento
alter table tblPedido with check add constraint FK_tblPedido_tblCliente foreign key (idCliente)
references tblCliente (idCliente)
go

alter table tblPedido check constraint FK_tblPedido_tblCliente
go

alter table tblPedido with check add constraint FK_tblPedido_tblPagamento foreign key (codTipoPag)
references tblPagamento (codTipoPag)
go

alter table tblPedido check constraint FK_tblPedido_tblPagamento
go

-- pedidoProduto - pedido / produto
alter table tblPedidoProduto with check add constraint FK_tblPedidoProduto_tblPedido foreign key (idPedido)
references tblPedido (idPedido)
go

alter table tblPedidoProduto check constraint FK_tblPedidoProduto_tblPedido
go

alter table tblPedidoProduto with check add constraint FK_tblPedidoProduto_tblProduto foreign key (idProduto)
references tblProduto (idProduto)
go

alter table tblPedidoProduto check constraint FK_tblPedidoProduto_tblProduto
go

-- historicoEstoque  - pedidoProduto / produto
alter table tblHistoricoEstoque with check add constraint FK_tblHistoricoEstoque_tblPedidoProduto foreign key (idPedidoProduto)
references tblPedidoProduto (idPedidoProduto)
go

alter table tblHistoricoEstoque check constraint FK_tblHistoricoEstoque_tblPedidoProduto
go

alter table tblHistoricoEstoque with check add constraint FK_tblHistoricoEstoque_tblProduto foreign key (idProduto)
references tblProduto (idProduto)
go

alter table tblHistoricoEstoque check constraint FK_tblHistoricoEstoque_tblProduto
go

--produto - categoria
alter table tblProduto with check add constraint FK_tblProduto_tblCategoria foreign key (codCategoria)
references tblCategoria (codCategoria)
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
