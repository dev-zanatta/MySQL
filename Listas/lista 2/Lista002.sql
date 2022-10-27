create database lista002;
use lista002;

create table alunos(
	codigo int,
    nome varchar(50),
    telefone varchar(50),
    cidade varchar(50)
);

desc alunos;

create table alunos2(
	codigo int,
    nome varchar(200),
    telefone varchar(50),
    cidade varchar(100)
);

create table funcionarios(
	nome varchar(50),
    endereco varchar(100),
    telefone varchar(20),
    cidade varchar(50),
    estado varchar(50),
    cep varchar(20),
    rg varchar (20),
    cpf varchar(20),
    salario int
);

create table fornecedores(
	nome varchar(50),
    endereco varchar(100),
    telefone varchar(20),
    cidade varchar(50),
    estado varchar(50),
    cep varchar(20),
    cnpj varchar (20),
    email varchar(20)
);

create table livros(
	codigo int,
    nome varchar(50),
    categoria varchar(50),
    resumo varchar(200),
    precocusto int,
    precovenda int
);

create table estoque(
	codigo int,
    nomedoproduto varchar(100),
    categoria varchar(50),
    fornecedor varchar(100),
    quantidade int
);

create table notas(
	codigo int,
    nomedoaluno varchar(50),
    bimestre int
);

create table caixa(
	codigo int,
    datacaixa varchar(50),
    descricao varchar(50),
    resumo varchar(200),
    debito int,
    credito int
);

create table contasAPagar(
	codigo int,
    data_conta varchar(50),
    descricao varchar(50),
    valor int,
    data_pagamento varchar(50)
);

create table contasAReceber(
	codigo int,
    data_conta varchar(50),
    descricao varchar(50),
    valor int,
    data_recebimento varchar(50)
);

create table filmes(
	codigo int,
    nome varchar(50),
    sinopse varchar(500),
    categoria varchar(50),
    diretor varchar(50)
);

create table CDs(
	codigo int,
    nome varchar(50),
    cantor varchar(50),
    ano varchar(10),
    quantidademusicas int
);

drop table alunos2;

desc alunos2;

drop table livros;

drop table contasAPagar;

drop table contasAReceber;

drop table filmes;

desc alunos;
desc caixa;
desc cds;
desc contasAReceber;
desc estoque;
desc fornecedores;
desc funcionarios;
desc notas;

alter table alunos rename super_alunos;
desc super_alunos;

alter table estoque rename produtos;
alter table notas rename aprovados;
alter table aprovados rename notas;

drop table notas;
alter table super_alunos rename alunos;
alter table alunos rename estudantes;
alter table estudantes rename super_estudantes;
desc super_estudantes;
drop table super_estudantes;

desc super_estudantes;
desc alunos;

alter table alunos add estado varchar(50);

drop table caixa;
create table caixa(
	codigo int,
    datacaixa varchar(50),
    descricao varchar(50),
    resumo varchar(200),
    debito int,
    credito int
);

alter table caixa add observacao varchar(100);

desc caixa;

alter table caixa add saldo int;







































