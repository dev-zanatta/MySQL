create database escola2;
use escola2;

create table professor(
	id_professor int unique not null primary key auto_increment,
    nome varchar(40) not null,
    salario float
);

create table turma(
	id_turma int unique not null primary key auto_increment,
    n_turma int not null,
    nsala int
);

create table aluno(
	id_aluno int unique not null primary key auto_increment,
    nome varchar(40) not null,
    idade int,
    
    fk_aluno_turma int,
    constraint aluno_turma foreign key (fk_aluno_turma) references turma(id_turma)
);

create table aula(
	id_aula int unique not null primary key auto_increment,
    nome_aula varchar(20) not null,
    fk_aula_professor int,
    constraint aula_professor foreign key (fk_aula_professor) references professor(id_professor)
);

create table prof_turma(
	id_professor int, 
    id_turma int,
    
    primary key(id_professor, id_turma),
    foreign key (id_professor) references professor(id_professor),
    foreign key (id_turma) references turma(id_turma)
);

create table aula_aluno(
	id_aula int,
    id_aluno int,
    
    primary key(id_aluno, id_aula),
    foreign key (id_aula) references aula(id_aula),
    foreign key (id_aluno) references aluno(id_aluno)
);

insert into professor
values(1, "Abner", 4500),
(2, "Adan", 7600),
(3, "Vitao", 6400),
(4, "Paiva", 5000); 

insert into turma
values(1, "1", 101),
(2, "2", 102),
(3, "3", 103),
(4, "4", 202),
(5, "5", 203),
(6, "6", 204);

insert into aluno 
values(1,"Abnoia", 18, 1),
(2, "Adanzao", 25, 5),
(3, "Vitaoaoao", 17, 1),
(4, "Paivinha", 87, 5);


insert into aula
values(1, "Ciencias", 1),
(2, "Matematica", 2),
(3, "Fisica Mecanica", 3),
(4, "Portugues", 1),
(5, "Redacao", 1),
(6, "Logica", 2),
(7, "Fisica Otica", 3);

insert into aula_aluno
values(1, 1),
(2, 1),
(4, 1),
(6, 1),
(2, 2),
(4, 2),
(7, 2),
(5, 3),
(6, 3);

insert into prof_turma
values (1, 2),
(1, 3),
(2, 5),
(2, 6),
(3, 3),
(3, 4),
(3, 1);

update aluno
set nome="Adan Adao"
where nome="Adanzao";

update aula
set nome_aula="Logica Comp"
where nome_aula="logica";

update professor
set salario=8500
where id_professor = 4;

update turma
set nsala = 307
where n_turma=5;

update aula_aluno
set id_aluno=4
where id_aluno=3;

update prof_turma
set id_professor = 1
where id_professor = 2;

delete from aluno
where id_aluno=3;

insert into aula
values(8, "blabla", 4);

delete from aula
where nome_aula = "blabla";

delete from aluno
where nome="Paivinha";

insert into professor 
values (5, "Prof top", 1500);

delete from professor
where nome="Prof top";

select * from turma;

insert into turma
values(7, 7, 504);

delete from turma
where nsala=504;

delete from aula_aluno
where id_aula=2;

delete from prof_turma
where id_professor = 2;
