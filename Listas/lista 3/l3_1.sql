create database clinica;
use clinica;

create table medicos(
	crm varchar(15) primary key unique not null,
    nome varchar(40) not null,
    idade int check(idade>23),
    especialidade char(20) not null DEFAULT 'Ortopedia',
    cpf varchar(15) unique not null,
    data_admissao date 
);

create table sala(
	numero_sala int primary key unique not null check (numero_sala>=1 and numero_sala<=50),
    andar int unique not null check (andar<12),
    crm_fk_sala varchar(15) not null,
    constraint sala_medico foreign key (crm_fk_sala) references medicos(crm)
    
);

create table pacientes(
	rg varchar(15) primary key unique not null,
    nome varchar(40) not null,
    data_nascimento date,
	cidade char(30) DEFAULT 'Itabuna',
    doenca varchar(40) not null,
	plano_saude varchar(40) not null DEFAULT 'SUS'
);

create table funcionarios(
	matricula varchar(15) primary key unique not null,
    nome varchar(40) not null,
    data_nascimento date not null,
    data_admissao date not null,
    cargo varchar(40) not null DEFAULT 'Assistente Medico',
    salario float not null DEFAULT '510'
);

create table consultas(
	codigo_consulta int primary key unique not null,
    data_horario datetime,
    crm_fk_consulta varchar(15) not null,
	rg_fk_consulta varchar(15) not null,
    constraint medico_consulta foreign key (crm_fk_consulta) references medicos(crm),
    constraint paciente_consulta foreign key (rg_fk_consulta) references pacientes(rg)
);
