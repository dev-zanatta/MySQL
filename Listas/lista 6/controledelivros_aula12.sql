create database controledelivros;
use controledelivros;

create table autor(
id_autor int primary key,
nome varchar(50),
idade int,
valor_hr decimal(10,2)
);

create table editora(
id_editora int primary key,
nome varchar(50),
telefone varchar(12)
);

create table estilo(
id_estilo int primary key,
nome varchar(50)
);

create table livro(
id_livro int primary key,
titulo varchar(50),
id_estilo int,
id_autor int,
id_editora int,
valor decimal(10,2),
constraint fk_livro_estilo foreign key (id_estilo) references estilo(id_estilo),
constraint fk_livro_autor foreign key (id_autor) references autor(id_autor),
constraint fk_livro_editora foreign key (id_editora) references editora(id_editora)
);

insert into editora values
(1,'Abril','12334567'),
(2,'Globo','123345'),
(3,'Saraiva','1233451212'),
(4,'BBBBB','123345'),
(5,'CCCC','12334521312'),
(6,'EEEE','12334521312'),
(7,'FFF','12334521312'),
(8,'GGGG','12334521312');

insert into autor values
(1,'Paulo Coelho',70,120.3),
(2,'Agatha Christie',50,120.3),
(3,'J K Rowling',70,120.3),
(4,'Dan Brown',35,120.3),
(5,'J R R Tolkien',70,120.3),
(6,'João Abreu',25,5.3);

insert into estilo values
(1,'Comédia'),
(2,'Drama'),
(3,'Ficção'),
(4,'Suspense'),
(5,'Romance'),
(6,'Ação'),
(7,'Terror');

insert into livro values
(1,'Livro - 123',1,1,1,1.5),
(2,'Livro - 234',2,2,2,2.5),
(3,'Livro - 333',3,3,3,5.5),
(4,'Livro - 444',4,4,4,12.5),
(5,'Livro - 555',5,1,2,15.5),
(6,'Livro - 575',5,1,2,20.5),
(7,'Livro - 585',5,1,2,10.5),
(8,'Livro - 666',5,2,3,15.5),
(9,'Livro - 777',5,4,5,20.5);

select * from estilo
order by nome;

select * from autor
order by nome desc;

select nome,telefone from editora
order by nome;

select nome from editora;

select nome from estilo
order by nome desc;

select nome,id_estilo from estilo
where id_estilo = 3;

select nome,id_autor from autor
where id_autor = 1;

select nome,id_editora from editora
where id_editora = 4;

select livro.titulo,editora.nome from livro, editora 
where livro.id_editora = editora.id_editora;

select livro.titulo,editora.nome from livro, editora
where livro.id_editora = editora.id_editora and editora.nome like 'a%';

select livro.titulo,editora.nome,estilo.nome,autor.nome from autor, editora, estilo, livro
where livro.id_editora = editora.id_editora and livro.id_autor=autor.id_autor and livro.id_estilo=estilo.id_estilo;

select livro.titulo,editora.nome from livro, editora
where editora.telefone = '12345' and livro.id_editora=editora.id_editora;

select livro.titulo, autor.nome from livro, autor
where autor.idade = 35;

select livro.titulo, autor.nome, editora.nome from livro, autor, editora
where autor.nome = 'Dan Brown' and livro.id_editora = editora.id_editora;

select livro.titulo, autor.nome, editora.nome from livro, autor, editora
where autor.nome = 'Dan Brown' and livro.id_editora = editora.id_editora and autor.idade = 35;

select livro.titulo, autor.nome, editora.nome from livro, autor, editora
where (autor.nome = 'Dan Brown' or editora.telefone = 123345) and livro.id_autor=autor.id_autor 
and livro.id_editora = editora.id_editora;

select livro.titulo,estilo.nome from livro, estilo
where estilo.nome = 'Romance' and livro.id_estilo = estilo.id_estilo;

select livro.titulo,estilo.nome, editora.nome from livro, editora, estilo
where editora.nome = 'Globo' and livro.id_editora = editora.id_editora 
and livro.id_estilo=estilo.id_estilo;

select livro.titulo, editora.nome, autor.nome from livro, editora, autor
where livro.id_editora = editora.id_editora and livro.id_autor = autor.id_autor;
