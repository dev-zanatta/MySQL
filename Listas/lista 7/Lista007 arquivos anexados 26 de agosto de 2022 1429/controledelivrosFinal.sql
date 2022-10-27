create database controledelivrosFinal;
use controledelivrosFinal;

create table autor(
id_autor int primary key,
nome varchar(50) not null,
idade int,
valor_hr decimal(10,2) not null
);

create table editora(
id_editora int primary key,
nome varchar(50) not null,
telefone varchar(12)
);

create table estilo(
id_estilo int primary key,
nome varchar(50) not null
);

create table livro(
id_livro int primary key,
titulo varchar(50) not null,
id_editora int not null,
valor decimal(10,2),
constraint fk_livro_editora foreign key (id_editora) references editora(id_editora)
);

create table livro_autor(
	id_autor int not null,
    id_livro int not null,
    primary key(id_autor,id_livro),
    foreign key (id_autor) references autor(id_autor),
    foreign key (id_livro) references livro(id_livro)
);

create table livro_estilo(
	id_estilo int not null,
    id_livro int not null,
    primary key(id_estilo,id_livro),
    foreign key (id_livro) references livro(id_livro),
    foreign key (id_estilo) references estilo(id_estilo)
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
(6,'João Abreu',25,5.3),
(7,'Pedro Maria',35,20.3);

insert into estilo values
(1,'Comédia'),
(2,'Drama'),
(3,'Ficção'),
(4,'Suspense'),
(5,'Romance'),
(6,'Ação'),
(7,'Terror');

insert into livro values
(1,'Livro - 123',1,1.5),
(2,'Livro - 234',2,2.5),
(3,'Livro - 333',3,5.5),
(4,'Livro - 444',4,12.5),
(5,'Livro - 555',5,15.5),
(6,'Livro - 566',5,20.5),
(7,'Livro - 544',5,10.5),
(8,'Livro - 666',5,15.5),
(9,'Livro - 777',5,20.5);

insert into livro_autor values
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(2,6),
(5,7),
(5,8),
(5,9);

insert into livro_estilo values
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(5,6),
(2,7),
(2,8),
(2,9);

-- 1) Consultar titulo livro, nome editora, nome estilo e nome autor;

select livro.titulo, editora.nome, estilo.nome, autor.nome from livro
join editora on editora.id_editora = livro.id_editora
join livro_estilo on livro.id_livro = livro_estilo.id_livro
join estilo on estilo.id_estilo = livro_estilo.id_estilo
join livro_autor on livro.id_livro = livro_autor.id_livro
join autor on autor.id_autor = livro_autor.id_autor;

-- 2) Consultar titulo livro, nome editora. Onde o telefone da editora seja igual a 12345;

select livro.titulo, editora.nome from livro
join editora on livro.id_editora = editora.id_editora 
where editora.telefone = '12345';

-- 3) Consultar titulo livro, nome autor. Onde autor tenha idade igual a 35;

select livro.titulo, autor.nome from livro
join livro_autor on livro.id_livro = livro_autor.id_livro
join autor on autor.id_autor = livro_autor.id_autor 
where autor.idade = 35;

-- 4) Consultar titulo livro, nome autor e editora. Onde autor tenha o nome de Dan Brown

select livro.titulo, autor.nome, editora.nome from livro
join livro_autor on livro.id_livro = livro_autor.id_livro
join autor on autor.id_autor = livro_autor.id_autor
join editora on livro.id_editora = editora.id_editora
where autor.nome = 'Dan Brown';

-- 5) Consultar titulo livro, nome autor e editora. Onde autor tenha o nome de Dan Brown
-- e idade igual a 35

select livro.titulo, autor.nome, editora.nome from livro
join livro_autor on livro.id_livro = livro_autor.id_livro
join autor on autor.id_autor = livro_autor.id_autor
join editora on livro.id_editora = editora.id_editora
where autor.nome = 'Dan Brown' and autor.idade = 35;

-- 6) Consultar titulo livro, nome autor e editora. Onde autor tenha o nome de Dan Brown
-- e editora com o telefone igual a 123345;

select livro.titulo, autor.nome, editora.nome from livro
join livro_autor on livro.id_livro = livro_autor.id_livro
join autor on autor.id_autor = livro_autor.id_autor
join editora on livro.id_editora = editora.id_editora
where autor.nome = 'Dan Brown' and editora.telefone = '123345';

-- 7) Consulta titulo livro, nome estilo dos livros do estilo Romance;

select livro.titulo, estilo.nome from livro
join livro_estilo on livro.id_livro = livro_estilo.id_livro
join estilo on estilo.id_estilo = livro_estilo.id_estilo
where estilo.nome = 'Romance';

-- 8) Consulta titulo livro, nome estilo dos livros da editora Globo;

select livro.titulo, estilo.nome from livro
join livro_estilo on livro.id_livro = livro_estilo.id_livro
join estilo on estilo.id_estilo = livro_estilo.id_estilo
join editora on livro.id_livro = editora.id_editora
where editora.nome = 'Globo';

-- 9) Consultar o livro de maior valor;

select max(valor) from livro;

-- 10)Consultar o livro de menor valor;

select min(valor) from livro;

-- 11)Consultar a média de custo do livros;

select avg(valor) from livro;

-- 12)Consultar a média de custo dos autores;

select avg(valor_hr) from autor;

-- 13)Contar o número de livros;

select count(id_livro) from livro;

-- 14)Consultar a quantidade de livros que editora de id_editora = 2;

select count(id_livro) from livro
join editora on livro.id_editora = editora.id_editora
where editora.id_editora = 2;

-- 15)Consultar quantos livros o id_estilo = 5 possui

select count(livro.id_livro) from livro
join livro_estilo on livro.id_livro = livro_estilo.id_livro
join estilo on estilo.id_estilo = livro_estilo.id_estilo
where estilo.id_estilo = 5;

-- 16)Selecione os títulos dos livros e os respectivos nomes das editoras.

select livro.titulo, editora.nome from livro
join editora on livro.id_editora = editora.id_editora;

-- 17)Selecione os títulos do livro, os respectivos nomes das editoras que começam com a
-- letra A.

select livro.titulo, editora.nome from livro
join editora on livro.id_editora = editora.id_editora
where editora.nome like 'a%';

-- 18)Consultar apenas os autores que não possuem nenhum livro;

select autor.nome from autor
left join livro_autor on autor.id_autor=livro_autor.id_autor
where livro_autor.id_livro is null;

-- 19)Consultar apenas as editoras que não possuem nenhum livro;

select editora.nome from editora
left join livro on livro.id_editora = editora.id_editora
where livro.id_editora is null;

-- 20)Consultar apenas os estilo que não possuem nenhum livro;

select estilo.nome from estilo
left join livro_estilo on estilo.id_estilo = livro_estilo.id_estilo
where livro_estilo.id_estilo is null;

-- 21)Consultar os nomes dos autores e quantos livros cada autor possui;

select autor.nome, count(livro_autor.id_livro) from autor
join livro_autor on autor.id_autor = livro_autor.id_autor
group by autor.nome;

-- 22)Consultar os nomes das editoras e quantos livros cada editora possui;

select editora.nome, count(livro.id_livro) from editora
join livro on livro.id_editora = editora.id_editora
group by editora.nome;

-- 23)Consultar os nomes das estilo e quantos livros cada estilo possui;

select estilo.nome, count(livro.id_livro) from estilo
join livro_estilo on estilo.id_estilo = livro_estilo.id_estilo
join livro on livro.id_livro = livro_estilo.id_livro
group by estilo.nome;

-- 24)Consultar quantos livros a editora CCCC possui;

select count(livro.id_livro) from livro
join editora on livro.id_editora = editora.id_editora
where editora.nome = 'CCCC';

-- 25)Consultar quantos livros o autor J R R Tolkien possui; 

select count(livro.id_livro) from livro
join livro_autor on livro.id_livro = livro_autor.id_livro
join autor on autor.id_autor = livro_autor.id_autor
where autor.nome = 'J R R Tolkien';



