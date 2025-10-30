create database banco_livros2;
use banco_livros2;

-- 1. Primeiro criar as tabelas básicas
create table tb_autor (
    id_autor int primary key auto_increment not null,
    nome_autor varchar(100) not null,
    genero_autor varchar(50),
    data_nasc date not null,
    pais_de_origem varchar(50) not null
);

create table tb_editora (
    id_editora int primary key auto_increment not null,
    nome_editora varchar(100) not null,
    qnt_autores int not null,
    qnt_obras int not null,
    data_fundacao date not null,
    pais_de_origem varchar(50) not null,
    endereco_editora varchar(100) not null
);

create table tb_livro(
    id_livro int auto_increment not null,
    nome_livro varchar(100),
    numero_paginas int,
    genero_livro enum("Suspense","Terror","Ficção Científica","Comédia","Ação"),
    preco_livro decimal(8,2),
    capa_dura enum("Paraná","Mole","Cartão","Roller"),
    data_leitura date,
    tipo_livro enum("PDF","Ebook","Impresso","Audiobook"),
    idioma_livro enum("Português","Espanhol","Português PT","Francês","Inglês"),
    avaliacao_livro enum("Ótimo","Bom","Regular","Ruim","Péssimo"),
    status_livro enum("Lido","Não lido","Lendo"),
    edicao varchar(30),
    estado_livro enum("Novo","Usado","Seminovo"),
    id_autor int,
    id_editora int,
    constraint pk_id_livro primary key (id_livro),
    constraint fk_id_autor foreign key (id_autor) references tb_autor(id_autor),
    constraint fk_id_editora foreign key (id_editora) references tb_editora(id_editora)
);

-- 2. PRIMEIRO inserir autores e editoras (para ter IDs) - MANTENDO TODOS OS 10 REGISTROS
insert into tb_autor (nome_autor, genero_autor, data_nasc, pais_de_origem) VALUES
    ("Kaique Aleixo", "Masculino", "2006-01-31", "Brasil"),
    ("Machado de Assis", "Masculino", "1839-06-21", "Brasil"),
    ("Clarice Lispector", "Feminino", "1920-12-10", "Brasil"),
    ("Cecilia Meireles", "Feminino", "1901-11-07", "Brasil"),
    ("Jorge Amado", "Masculino", "1912-08-10", "Brasil"),
    ("Carlos Drummond de Andrade", "Masculino", "1902-10-31", "Brasil"),
    ("Monteiro Lobato", "Masculino", "1882-04-18", "Brasil"),
    ("Graciliano Ramos", "Masculino", "1892-10-27", "Brasil"),
    ("Lygia Fagundes Telles", "Feminino", "1923-04-19", "Brasil"),
    ("Rubem Alves", "Masculino", "1933-09-15", "Brasil");

insert into tb_editora(nome_editora, qnt_autores, qnt_obras, data_fundacao, pais_de_origem, endereco_editora) values
    ("Príncipes", 20, 60, "2010-01-01", "Brasil", "R. José Albino Pereira, 54 - Jardim Alvorada, Jandira - SP, 06612-001"),
    ("Aurora Editorial", 35, 120, "2005-03-15", "Brasil", "Av. Paulista, 1010 - Bela Vista, São Paulo - SP, 01310-100"),
    ("Nova Era Books", 50, 200, "1998-07-22", "Portugal", "Rua do Carmo, 85 - Lisboa, 1200-093"),
    ("Estrela do Norte", 18, 75, "2015-11-10", "Brasil", "Av. Dom Pedro II, 500 - Santo André - SP, 09080-110"),
    ("Blue Ink Press", 42, 160, "2000-09-01", "Estados Unidos", "123 Main Street - New York, NY 10001"),
    ("Editorial Horizonte", 27, 95, "1990-04-09", "Espanha", "Calle Mayor, 45 - Madrid, 28013"),
    ("Livros & Letras", 22, 88, "2012-06-20", "Brasil", "Rua das Flores, 210 - Curitiba - PR, 80010-100"),
    ("Phoenix House", 40, 140, "2008-02-12", "Inglaterra", "221B Baker Street - London NW1 6XE"),
    ("Clássica Editora", 55, 230, "1985-09-30", "Brasil", "R. dos Andradas, 742 - Centro, Porto Alegre - RS, 90020-004"),
    ("Sakura Press", 30, 110, "2018-05-25", "Japão", "1-1 Chiyoda - Tokyo 100-0001");

-- 3. DEPOIS inserir livros COM as foreign keys - MANTENDO TODOS OS 10 REGISTROS ORIGINAIS
insert into tb_livro (nome_livro, numero_paginas, genero_livro, preco_livro, capa_dura, data_leitura, tipo_livro, idioma_livro, avaliacao_livro, status_livro, edicao, estado_livro, id_autor, id_editora) values
    ("O Pequeno Príncipe", 144, "Ação", 32.90, "Mole", "2025-10-21", "Impresso", "Português", "Ótimo", "Lido", "3ª Edição", "Novo", 1, 1),
    ("O Hobbit", 310, "Ficção Científica", 45.50, "Paraná", "2025-09-12", "Impresso", "Português", "Bom", "Não lido", "5ª Edição", "Seminovo", 2, 2),
    ("The Big Bang Theory", 320, "Ficção Científica", 43.90, "Cartão", "2025-10-01", "Ebook", "Inglês", "Regular", "Lendo", "1ª Edição", "Novo", 3, 3),
    ("Five Nights at Freddy's", 244, "Terror", 39.90, "Mole", "2025-08-14", "Impresso", "Português", "Bom", "Lido", "4ª Edição", "Usado", 4, 4),
    ("Percy Jackson: O Ladrão de Raios", 377, "Ficção Científica", 59.90, "Paraná", "2025-07-28", "Impresso", "Português", "Ótimo", "Lido", "2ª Edição", "Novo", 5, 5),
    ("Sherlock Holmes: O Cão dos Baskerville", 256, "Suspense", 42.50, "Cartão", "2025-10-05", "Ebook", "Inglês", "Ótimo", "Lendo", "Edição Especial", "Seminovo", 6, 6),
    ("Diário de um Banana", 220, "Comédia", 29.90, "Mole", "2025-10-10", "PDF", "Português PT", "Bom", "Lido", "10ª Edição", "Novo", 7, 7),
    ("IT: A Coisa", 1100, "Terror", 89.90, "Roller", "2025-06-15", "Impresso", "Português", "Ótimo", "Não lido", "Edição Definitiva", "Novo", 8, 8),
    ("A Origem", 450, "Ação", 55.00, "Paraná", "2025-10-03", "Ebook", "Inglês", "Regular", "Lendo", "Edição Internacional", "Usado", 9, 9),
    ("As Aventuras de Tintim", 180, "Comédia", 25.90, "Mole", "2025-10-12", "Impresso", "Francês", "Bom", "Lido", "3ª Edição", "Seminovo", 10, 10);

-- 4. CORRIGIR os comandos ALTER/UPDATE
alter table tb_autor add column cpf char(18) not null;
update tb_autor set nome_autor = "Leandro" where id_autor = 2;
alter table tb_autor change column pais_de_origem nacionalidade_autor varchar(50) not null;
update tb_autor set nome_autor = "Jujutsu Kaizen" where id_autor = 10;
alter table tb_autor add column premiacoes int not null;

drop table tb_autor;
drop table tb_editora;
drop table tb_livro;


-- Para ver os resultados
select * from tb_autor;
select * from tb_editora;
select * from tb_livro;