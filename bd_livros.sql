create database banco_livros; /* Cria o banco de dados*/
use banco_livros; /*Entra no Banco de Dados*/
drop database banco_livros; /*Exclui fisicamente o banco de dados*/
create table tb_livro(
	pk_id_livro int primary key auto_increment not null,
	nome_livro varchar(100),
	numero_paginas int,
	genero_livro enum("Suspense","Terror","Ficção Ciêntifíca","Comédia","Ação"),
	preco_livro decimal(8,2),
	capa_dura enum("Paraná","Mole","Cartão","Roller"),
    data_leitura date,
    tipo_livro enum("PDF","Ebook","Impresso","Audiobook"),
    idioma_livro enum ("Português","Espanhol","Português PT","Francês","Inglês"),
    avaliacao_livro enum("Ótimo","Bom","Regular","Ruim","Péssimo"),
    status_livro enum("Lido","Não lido","Lendo"),
    edicao varchar(30),
    estado_livro enum ("Novo","Usado","Seminovo")
);

drop table tb_livro;

describe tb_livro;

select*from tb_livro;

insert into tb_livro values(
	0,"O Pequeno Principe",144,"Ação",32.90,"Mole","2025-10-21","Impresso","Português","Ótimo","Lido","Terceira edição","Novo",
	0,"O Hobbit",245,"Ficção",32.90,"Dura","2025-10-21","Impresso","Português","Regular","Não Lido","Quinta edição","Seminovo",
    0,"The Big Bang",1934,"Ficção Ciêntifíca",43.90,"Cartão","2025-10-21","Ebook","Inglês","Regular","Lendo","Sexta edição","Novo",
    0,"Five Nights At Freddys",244,"Terror",32.90,"Mole","2025-10-21","Impresso","Português","Bom","Lendo","Quarta edição","Usado",
    0,"Parcy Jackson: O Ladrão de Raios",2873,"Ficção Ciêntifíca",123.90,"Dura","0000-00-00","Impresso","Português","Ótimo","Lido","Quinta edição","Novo",
    0,"Five Nights At Freddys",244,"Terror",32.90,"Mole","2025-10-21","Impresso","Português","Bom","Lido","Sétima edição","Novo",
    0,"Five Nights At Freddys",244,"Terror",32.90,"Mole","2025-10-21","Impresso","Português","Bom","Lendo","Oitava edição","Usado",
    0,"Five Nights At Freddys",244,"Terror",32.90,"Mole","2025-10-21","Impresso","Português","Bom","Não Lido","Nona edição","Usado",
    0,"Five Nights At Freddys",244,"Terror",32.90,"Mole","2025-10-21","Impresso","Português","Bom","Lido","Sexta edição","Seminovo",
    0,"Five Nights At Freddys",244,"Terror",32.90,"Mole","2025-10-21","Impresso","Português","Bom","Lido","Oitava edição","Seminovo"
);

insert into tb_livro (nome_livro,numero_paginas,genero_livro,preco_livro,capa_dura,data_leitura,tipo_livro,idioma_livro,avaliacao_livro,status_livro,edicao,estado_livro) values(

	
);