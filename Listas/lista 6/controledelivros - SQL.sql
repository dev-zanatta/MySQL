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
