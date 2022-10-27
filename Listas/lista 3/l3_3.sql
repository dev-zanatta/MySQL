create database revendedora;
use revendedora;

create table vendedor(
	id_vendedor varchar(20) unique not null primary key,
    nome varchar(20) not null,
    sobrenome varchar(20) not null,
    telefone varchar(15) unique not null,
    salario float not null,
    data_adm date not null,
    estado varchar(20) not null,
    cidade varchar(20) not null,
    cep varchar(10) not null,
    rua varchar(20) not null,
    numero int not null,
    complemento varchar(20),
    bairro varchar(20) not null
);

create table cliente(
	id_cliente varchar(20) unique not null primary key,
    nome varchar(20) not null,
    sobrenome varchar(20) not null,
    telefone varchar(15) not null,
    estado varchar(20) not null,
    cidade varchar(30) not null,
    cep varchar(20) not null,
    rua varchar(20) not null,
    numero int not null,
    complemento varchar(30),
    bairro varchar(30) not null
);

create table venda(
	id_venda varchar(20) unique not null primary key,
    data_venda date not null,
    preco_venda int not null,
    id_cliente varchar(20) unique not null,
    id_vendedor varchar(20) unique not null,
    renavam varchar(20) unique not null,
    
    id_cliente_fk_venda varchar(20) not null,
    id_vendedor_fk_venda varchar(20) not null,

    constraint fk_venda_cliente foreign key (id_cliente_fk_venda) references cliente(id_cliente),
    constraint fk_venda_vendedor foreign key (id_vendedor_fk_venda) references vendedor(id_vendedor)
    
);

create table automovel(
	renavam varchar(20) unique not null primary key,
	combustivel varchar(20) not null,
	n_portas int not null, 
	placa varchar(8) unique not null,
	preco int not null,
	marca varchar(30) not null,
	modelo varchar(30),
	ano_fab int not null,
	ano_mod int not null,
	cor varchar(20) not null,
	motor varchar(30) unique not null,
	
	id_venda_fk_automovel varchar(20) not null,
	constraint fk_automovel_venda foreign key (id_venda_fk_automovel) references venda(id_venda)
);