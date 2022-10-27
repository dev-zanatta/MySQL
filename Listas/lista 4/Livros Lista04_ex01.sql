create database livraria;
use livraria;

create table editora(
	id_editora int unique not null primary key auto_increment,
    nome_editora varchar(100) not null
    
);

create table livro(
	id_livro int unique not null primary key auto_increment,
    nome_livro varchar(100) not null,
    fk_editora_livro int not null,
    constraint editora_livro foreign key (fk_editora_livro) references editora(id_editora)
);

create table autor(
	id_autor int unique not null primary key auto_increment,
    nome_autor varchar(100) not null
);

create table categoria(
	id_categoria int unique not null primary key auto_increment,
    nome_categoria varchar(100) not null
);

create table livro_autor(
	id_autor int not null ,
    id_livro int not null ,
    primary key (id_autor, id_livro),
    foreign key (id_autor) references autor(id_autor), 
	foreign key (id_livro) references livro(id_livro)
);

create table livro_categoria(
	id_categoria int not null ,
    id_livro int not null ,
    primary key (id_categoria, id_livro),
    foreign key (id_categoria) references categoria(id_categoria), 
	foreign key (id_livro) references livro(id_livro)
);

insert into editora (nome_editora)
values ("AA producoes");

insert into editora (nome_editora)
values ("BB fazendo livros");

insert into editora (nome_editora)
values ("Eu mesmo");

insert into autor (nome_autor)
values ("John Joao");

insert into autor (nome_autor)
values ("Jean Jean");

insert into categoria (nome_categoria)
values ("Terror");

insert into categoria (nome_categoria)
values ("Comedia");

insert into categoria (nome_categoria)
values ("Acao");

insert into livro 
values (1,"Clean Code", 1);

insert into livro (id_livro, nome_livro, fk_editora_livro)
values (2,"c++", 2);

insert into livro (id_livro, nome_livro, fk_editora_livro)
values (3, "Calculo 1", 3);

UPDATE livro
SET nome_livro = "Clean Code edicao 1"
WHERE id_livro = 1;

UPDATE livro
SET nome_livro = "c++ edicao 3"
WHERE id_livro = 2;

UPDATE categoria
SET nome_categoria = "Comedia Adulta"
WHERE id_categoria = 2;

UPDATE categoria
SET nome_categoria = "Terror pesado"
WHERE id_categoria = 1;

UPDATE autor
SET nome_autor = "Jean John Joao"
WHERE id_autor = 2;

UPDATE autor
SET nome_autor = "John Joao Johnes"
WHERE id_autor = 1;

UPDATE editora
SET nome_editora = "AAB Producoes"
WHERE id_editora = 1;

UPDATE editora
SET nome_editora = "BB Fazendo Livros Bons"
WHERE id_editora = 2;

insert into categoria (nome_categoria)
values ("Romance");

insert into autor (nome_autor)
values ("Claudia Raia");

insert into editora (nome_editora)
values ("Quem produz e nois");

insert into livro ( nome_livro, fk_editora_livro)
values ( "Calculo 27 milhoes", 3);

DELETE FROM editora
WHERE nome_editora = "Quem produz e nois";

DELETE FROM autor
WHERE nome_autor = "Claudia Raia";

DELETE FROM categoria
WHERE nome_categoria = "Romance";

DELETE FROM livro
WHERE nome_livro = "Calculo 27 milhoes";

