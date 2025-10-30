create database banco_livros; /* Cria o banco de dados*/
use banco_livros; /*Entra no Banco de Dados*/
drop database banco_livros; /*Exclui fisicamente o banco de dados*/

create table tb_livro(
	id_livro int auto_increment not null,
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
    estado_livro enum ("Novo","Usado","Seminovo"),
    id_autor int,
    id_editora int,
    constraint pk_id_livro primary key (id_livro),
    constraint fk_id_autor foreign key (id_autor) references tb_editora (id_autor),
	constraint fk_id_editora foreign key (id_editora) references tb_editora (id_editora));
    
	drop table tb_livro;
	describe tb_livro;
	select*from tb_livro;
    
	insert into tb_livro (nome_livro,numero_paginas,genero_livro,preco_livro,capa_dura,data_leitura,tipo_livro,idioma_livro,avaliacao_livro,status_livro,edicao,estado_livro) values
		("O Pequeno Príncipe",144,"Ação",32.90,"Mole","2025-10-21","Impresso","Português","Ótimo","Lido","3ª Edição","Novo"),
		("O Hobbit",310,"Ficção Ciêntifíca",45.50,"Paraná","2025-09-12","Impresso","Português","Bom","Não lido","5ª Edição","Seminovo"),
		("The Big Bang Theory",320,"Ficção Ciêntifíca",43.90,"Cartão","2025-10-01","Ebook","Inglês","Regular","Lendo","1ª Edição","Novo"),
		("Five Nights at Freddy’s",244,"Terror",39.90,"Mole","2025-08-14","Impresso","Português","Bom","Lido","4ª Edição","Usado"),
		("Percy Jackson: O Ladrão de Raios",377,"Ficção Ciêntifíca",59.90,"Paraná","2025-07-28","Impresso","Português","Ótimo","Lido","2ª Edição","Novo"),
		("Sherlock Holmes: O Cão dos Baskerville",256,"Suspense",42.50,"Cartão","2025-10-05","Ebook","Inglês","Ótimo","Lendo","Edição Especial","Seminovo"),
		("Diário de um Banana",220,"Comédia",29.90,"Mole","2025-10-10","PDF","Português PT","Bom","Lido","10ª Edição","Novo"),
		("IT: A Coisa",1100,"Terror",89.90,"Roller","2025-06-15","Impresso","Português","Ótimo","Não lido","Edição Definitiva","Novo"),
		("A Origem",450,"Ação",55.00,"Paraná","2025-10-03","Ebook","Inglês","Regular","Lendo","Edição Internacional","Usado"),
		("As Aventuras de Tintim",180,"Comédia",25.90,"Mole","2025-10-12","Impresso","Francês","Bom","Lido","3ª Edição","Seminovo");

create table tb_editora(
	id_editora int primary key auto_increment not null,
    nome_editora varchar(100) not null,
    qnt_autores int not null,
    qnt_obras int not null,
    data_fundacao date not null,
    pais_de_origem varchar (50) not null,
    endereco_editora varchar (100) not null,
    id_autor int,
    id_livro int);

	insert into tb_editora(nome_editora, qnt_autores,qnt_obras,data_fundacao,pais_de_origem,endereco_editora) values
		("Príncipes", 20,60,"2010-01-01","Brasil","R. José Albino Pereira, 54 - Jardim Alvorada, Jandira - SP, 06612-001"),
		("Aurora Editorial", 35, 120, "2005-03-15", "Brasil", "Av. Paulista, 1010 - Bela Vista, São Paulo - SP, 01310-100"),
		("Nova Era Books", 50, 200, "1998-07-22", "Portugal", "Rua do Carmo, 85 - Lisboa, 1200-093"),
		("Estrela do Norte", 18, 75, "2015-11-10", "Brasil", "Av. Dom Pedro II, 500 - Santo André - SP, 09080-110"),
		("Blue Ink Press", 42, 160, "2000-09-01", "Estados Unidos", "123 Main Street - New York, NY 10001"),
		("Editorial Horizonte", 27, 95, "1990-04-09", "Espanha", "Calle Mayor, 45 - Madrid, 28013"),
		("Livros & Letras", 22, 88, "2012-06-20", "Brasil", "Rua das Flores, 210 - Curitiba - PR, 80010-100"),
		("Phoenix House", 40, 140, "2008-02-12", "Inglaterra", "221B Baker Street - London NW1 6XE"),
		("Clássica Editora", 55, 230, "1985-09-30", "Brasil", "R. dos Andradas, 742 - Centro, Porto Alegre - RS, 90020-004"),
		("Sakura Press", 30, 110, "2018-05-25", "Japão", "1-1 Chiyoda - Tokyo 100-0001");
        
    describe tb_editora;
	select * from tb_livro;

	delete from tb_livro where pk_id_livro = 5;
	delete from tb_livro where genero_livro = "Suspense";
	
	
start transaction; /*habilita comandos de retorno*/
rollback; /* CTRL Z no comando*/
commit; /*confirma a execução do delete*/

	update tb_livro set nome_livro = "A Origem dos deuses" where pk_id_livro = 9;
	/*o update atualiza o valor do campo com a condição WHERE = onde*/
	update tb_livro set numero_paginas = "1289" where pk_id_livro = 3;

select*from tb_livro;

	alter table tb_editora add column cnpj char(18) not null;/*adiciona fisicamente um campo na tabela*/

describe tb_editora;
select*from tb_editora;

	update tb_editora set cnpj = "56.887.449/0001-65" where pk_id_editora = 8;
	alter table tb_editora drop column cnpj; /*Apaga fisicamente um campo da tabela*/
	alter table tb_editora modify column cnpj char(18) not null; /*modifica a estrutura do campo na tabela*/

	create table tb_autor (
	id_autor int primary key auto_increment not null,
    nome_autor varchar(100) not null,
    gereno_autor varchar (50),
    qnt_obras int not null,
    data_nasc date not null,
    pais_de_origem varchar (50) not null,
    id_livro int,
    id_editora int);

describe tb_autor;
select*from tb_autor;

	insert into tb_autor (nome_autor, gereno_autor, qnt_obras, data_nasc, pais_de_origem) VALUES
	("Kaique Aleixo", "Masculino", 7, "2006-01-31", "Brasil"),
	("Machado de Assis", "Masculino", 25, "1839-06-21", "Brasil"),
	("Clarice Lispector", "Feminino", 15, "1920-12-10", "Brasil"),
	("Cecilia Meireles", "Feminino", 30, "1901-11-07", "Brasil"),
	("Jorge Amado", "Masculino", 32, "1912-08-10", "Brasil"),
	("Carlos Drummond de Andrade", "Masculino", 40, "1902-10-31", "Brasil"),
	("Monteiro Lobato", "Masculino", 25, "1882-04-18", "Brasil"),
	("Graciliano Ramos", "Masculino", 12, "1892-10-27", "Brasil"),
	("Lygia Fagundes Telles", "Feminino", 22, "1923-04-19", "Brasil"),
	("Rubem Alves", "Masculino", 18, "1933-09-15", "Brasil");
    
    start transaction; /*habilita comandos de retorno*/
	rollback; /* CTRL Z no comando*/
	commit; /*confirma a execução do delete*/
    
    alter table tb_autor add column cpf char(18) not null;
    update tb_autor set nome_autor = "Leandro" where pk_id_autor = 2;
    alter table tb_autor change column pais_de_origem nascionalidade_autor varchar (50) not null;
    alter table tb_autor drop column qnt_obras;
    update tb_autor set nome_autor = "Jujutsu Kaizen" where pk_id_autor = 10;
    alter table tb_autor add column premiacoes int not null;
    
    delete from tb_autor;
    describe tb_autor;
    select*from tb_autor;
    
    drop table tb_autor;
    drop table tb_editora;
    drop table tb_livro;
    
