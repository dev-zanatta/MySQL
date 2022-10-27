create database eleicao;
use eleicao;

create table cargo(
	codigo_cargo int primary key unique not null,
    nome_cargo varchar(30) unique not null check(nome_cargo !='Prefeito' and nome_cargo!='Vereador'),
    salario float not null unique default '17000',
    numero_vagas int unique not null
);

create table partido(
	codigo_partido int primary key unique not null,
    sigla char(5) unique not null,
    nome varchar(40) unique not null,
    numero int unique not null
);

create table candidato(
	numero_candidato int primary key unique not null,
    nome varchar(40) unique not null,
    codigo_cargo int not null,
    codigo_partido int not null,
    
    codigo_cargo_fk_candidato int not null, 
    codigo_partido_fk_candidato int not null,
    constraint fk_candidato_cargo foreign key (codigo_cargo_fk_candidato) references cargo(codigo_cargo),
	constraint fk_candidato_partido foreign key (codigo_partido_fk_candidato) references partido(codigo_partido)
);

create table eleitor(
	titulo_eleitor varchar(30) primary key unique not null,
    zona_eleitoral char(5) not null,
    sessao_eleitoral char(5) not null,
    nome varchar(40) not null
);

create table voto(
	titulo_eleitor varchar(30) primary key unique not null,
    numero_candidato int not null,
    
    numero_candidato_fk_voto int not null,
    constraint fk_voto_candidato foreign key (numero_candidato_fk_voto) references candidato(numero_candidato)	
);
