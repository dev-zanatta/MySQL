CREATE DATABASE ESCOLA;
USE ESCOLA;

CREATE TABLE instrutores (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL,
  valor_hora INTEGER UNSIGNED NULL,
  certificados VARCHAR(255) NULL,
  PRIMARY KEY(id)
);
CREATE TABLE cursos (
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  requisito VARCHAR(255) NULL,
  carga_horaria SMALLINT UNSIGNED NULL,
  preco DOUBLE UNSIGNED NULL,
  PRIMARY KEY(id)
);
 
CREATE TABLE alunos (
  id INT NOT NULL AUTO_INCREMENT,
  cpf CHAR(11) NOT NULL,
  nome VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL,
  fone CHAR(14) NOT NULL,
  data_nascimento DATE NULL,
  PRIMARY KEY(id)
);
 
CREATE TABLE turmas (
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  instrutores_id INT NOT NULL,
  cursos_id INTEGER UNSIGNED NOT NULL,
  data_inicio DATE NULL,
  data_final DATE NULL,
  carga_horaria SMALLINT UNSIGNED NULL,
  PRIMARY KEY(id),
  INDEX turmas_FKIndex1(cursos_id),
  INDEX turmas_FKIndex2(instrutores_id),
  CONSTRAINT CURSO_TURMA_FK FOREIGN KEY(cursos_id)
    REFERENCES cursos(id),
  CONSTRAINT INSTRUTOR_TURMA_FK FOREIGN KEY(instrutores_id)
    REFERENCES instrutores(id)
);
 
CREATE TABLE matriculas (
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  turmas_id INTEGER UNSIGNED NOT NULL,
  alunos_id INT NOT NULL,
  data_matricula DATE NULL,
  PRIMARY KEY(id),
   CONSTRAINT ALUNO_MATRICULA_FK FOREIGN KEY(alunos_id)
    REFERENCES alunos(id),
  CONSTRAINT TURMA_MATRICULA_FK FOREIGN KEY(turmas_id)
    REFERENCES turmas(id)
);

insert into alunos
values(1, 12345678912, "Joao Alberto", "joaoalb@hotmail.com", 45998765432, "1994-11-11"),
	  (2, 12343675912, "Mario Andrade", "marioand@hotmail.com", 45991865432, "1992-12-25"),
      (3, 72345628922, "Roberto Claudio", "robertoclaud@hotmail.com", 45998147474, "1999-01-11"),
      (4, 12645678919, "Alvaro Cabral", "alvarocab@hotmail.com", 45998754371, "2000-04-27"),
      (5, 13345578911, "Leandro Nascimento", "leandronas@hotmail.com", 45998468715, "1991-03-12");

select * from alunos;

insert into cursos
values(1, "Matematica", "Nao tem" , 60 , 250 ),
	  (2, "Matematica 2", "Matematica 1" , 90 , 350 ),
      (3, "Fisica", "Nao tem" , 60 , 175 ),
      (4, "Mecanica Geral", "Fisica" , 90 , 450 ),
      (5, "Portugues", "Nao tem" , 90 , 300 );

select * from cursos;

insert into instrutores
values (1, "Jose Roberto", "joserob@hotmail.com", 25, "Matematica 1"),
	   (2, "Lucas Augusto", "lucasaug@hotmail.com", 35, "Matematica 2"),
       (3, "Rodrigo Everton", "rodrigoev@hotmail.com", 45, "Mecanica Geral"),
       (4, "Alvaro Dias", "alvarodias@hotmail.com", 25, "Portugues"),
       (5, "Gustavo Felipe", "gustavof@hotmail.com", 35, "Fisica");

select * from instrutores;	

insert into turmas
values(1, 1 , 1 , "2022-02-01" , "2022-04-28" , 60),
	  (2, 2 , 2 , "2022-02-11" , "2022-06-28" , 90),
      (3, 3 , 4 , "2022-02-01" , "2022-06-18" , 90),
      (4, 5 , 3 , "2022-02-01" , "2022-04-28" , 60),
      (5, 4 , 5 , "2022-02-01" , "2022-06-28" , 90);
      
select * from turmas;

insert into matriculas
values(1 , 2 , 1 , "2022-01-25"),
	  (2 , 1 , 3 , "2022-01-28"),
      (3 , 3 , 5 , "2022-01-15"),
      (4 , 5 , 4 , "2022-01-05"),
      (5 , 4 , 2 , "2022-01-24");

select * from matriculas;

update instrutores
set nome = "Augusto Robertsson"
where id = 5;

select * from instrutores;

update instrutores
set email = "augustorob@hotmail.com"
where nome = "Augusto Robertsson";

select * from instrutores;

update cursos
set nome = "Matematica II"
where id = 2;

select * from cursos;

update cursos
set requisito = "Matematica I"
where nome = "Matematica II";

select * from cursos;

insert into instrutores
values(6, "Valdoir Alberto", "valdoiralb@hotmail.com", 40 , "Matematica I"),
	  (7, "Mauricio Hugo", "mauriciohug@hotmail.com", 45 , "Mecanica Geral");

update turmas 
set instrutores_id = 6
where instrutores_id = 1;

select * from turmas;

update turmas 
set instrutores_id = 7
where instrutores_id = 3;

delete from matriculas
where id = 2;

delete from matriculas
where id = 4;

select * from matriculas;

delete from turmas
where id = 1;

delete from turmas
where id = 5;

select * from turmas;

delete from cursos
where id = 1;

delete from cursos
where id = 5;

select * from cursos;

delete from alunos
where id = 3;

delete from alunos
where id = 4;

select * from alunos;

delete from instrutores
where id = 1;

delete from instrutores
where id = 4;


