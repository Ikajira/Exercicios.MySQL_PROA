CREATE DATABASE DB_CDS;
use db_cds;

create table tb_artista (
	pk_cod_art INT comment "Código do Artista" auto_increment NOT NULL PRIMARY KEY,
    nome_art VARCHAR(100) comment "Nome do Artista ou nome da Banda" NOT NULL UNIQUE
);

create table tb_gravadora (
	pk_cod_grav INT comment "Código da Gravadora" NOT NULL auto_increment PRIMARY KEY,
    nome_grav VARCHAR(50) comment "Nome da Gravadora" NOT NULL UNIQUE
);

create table tb_categoria(
	pk_cod_cat INT comment "Código da Categoria" NOT NULL auto_increment PRIMARY KEY,
    nome_cat VARCHAR(50) comment "Nome da Categoria" NOT NULL UNIQUE
);

create table tb_estado (
	pk_cod_est INT comment "Código do Estado" NOT NULL auto_increment PRIMARY KEY,
	sigla_est CHAR(2) comment "Sigla do Estado" NOT NULL,
    nome_est VARCHAR(50) comment "Nome do Estado" NOT NULL UNIQUE
);

create table tb_cidade(
	pk_cod_cid INT comment "Código da Cidade" NOT NULL auto_increment PRIMARY KEY,
    fk_cod_est INT comment "Código do Estado" NOT NULL,
    nome_cid VARCHAR(100) comment "Nome da cidade" NOT NULL,
    FOREIGN KEY (fk_cod_est) REFERENCES tb_estado(pk_cod_est)
);

create table tb_cliente(
	pk_cod_cli INT comment "Código do Cliente" NOT NULL auto_increment PRIMARY KEY,
    fk_cod_cid INT comment "Código da Cidade" NOT NULL,
    nome_cli VARCHAR(100) comment "Nome do Cliente" NOT NULL,
    end_cli VARCHAR(200) comment "Endereço do Cliente" NOT NULL,
    renda_cli DECIMAL(10, 2) comment "Renda do Cliente" NOT NULL DEFAULT 0,
    sexo_cli ENUM("F", "M") comment "Sexo do Cliente" NOT NULL DEFAULT "F",
    FOREIGN KEY (fk_cod_cid) REFERENCES tb_cidade(pk_cod_cid)
);

create table tb_conjuge(
	fk_cod_cli INT comment "Código do Cliente" NOT NULL PRIMARY KEY,
    nome_conj VARCHAR(100) comment "Nome do Conjunge" NOT NULL,
    renda_conj DECIMAL(10, 2) comment "Renda do Conjunge" NOT NULL DEFAULT 0,
    sexo_conj ENUM("F", "M") comment "Sexo do Conjunge" NOT NULL DEFAULT "M",
    FOREIGN KEY (fk_cod_cli) REFERENCES tb_cliente(pk_cod_cli)
);

create table tb_funcionario (
	pk_cod_func INT comment "Código do Funcionário" NOT NULL auto_increment PRIMARY KEY,
    nome_func VARCHAR(100) comment "Nome do Funcionário" NOT NULL,
    end_func VARCHAR(200) comment "Endereço do Funcionário" NOT NULL,
    sal_func DECIMAL(10, 2) comment "Salário do Funcionário" NOT NULL DEFAULT 0,
    sexo_func ENUM("F", "M") comment "Sexo do Funcionário" NOT NULL default "M"
);

create table tb_dependente(
	pk_cod_dep INT comment "Código do Dependente" NOT NULL auto_increment PRIMARY KEY,
    fk_cod_func INT comment "Código do Funcionário" NOT NULL,
    nome_dep VARCHAR(100) comment "Nome do Dependente" NOT NULL,
    sexo_dep ENUM("F", "M") comment "Sexo do Dependente" NOT NULL default "M",
    FOREIGN KEY (fk_cod_func) REFERENCES tb_funcionario(pk_cod_func)
);

create table tb_titulo (
	pk_cod_tit INT comment "Código do Título" NOT NULL auto_increment PRIMARY KEY,
    fk_cod_cat INT comment "Código da Categoria" NOT NULL,
    fk_cod_grav INT comment "Código da Gravadora" NOT NULL,
    nome_CD VARCHAR(100) comment "Nome do CD" NOT NULL UNIQUE,
    val_CD DECIMAL(10, 2) comment "Valor do CD" NOT NULL,
    qtd_estoque INT comment "Quantidade de CD de cada Titulo em Estoque" NOT NULL, 
    FOREIGN KEY (fk_cod_cat) REFERENCES tb_categoria(pk_cod_cat),
    FOREIGN KEY (fk_cod_grav) REFERENCES tb_gravadora(pk_cod_grav)
);

create table tb_pedido (
	pk_cod_ped INT comment "Código do Pedido" NOT NULL auto_increment PRIMARY KEY,
    num_ped INT comment "Numero do Pedido" NOT NULL,
    fk_cod_func INT comment "Código do Funcionário que está atendendo o pedido" NOT NULL,
	fk_cod_cli INT comment "Código do Cliente que está fazendo o pedido" NOT NULL,
    data_ped DATE comment "Data do Pedido" NOT NULL,
	val_ped DECIMAL(10, 2) comment "Valor do CD" NOT NULL DEFAULT 0,
    FOREIGN KEY (fk_cod_func) REFERENCES tb_funcionario(pk_cod_func),
	FOREIGN KEY (fk_cod_cli) REFERENCES tb_cliente(pk_cod_cli)
);

create table tb_titulo_pedido (
	fk_cod_ped INT comment "Código do pedido" NOT NULL,
    fk_cod_tit INT comment "Código do Titulo" NOT NULL, 
    qtd_CD INT comment "Quantidade de CDs Vendidos, de mesmo Título" NOT NULL,
    val_CD DECIMAL(10,2) comment "Valor do CD no momento da venda" NOT NULL,
    FOREIGN KEY (fk_cod_tit) REFERENCES tb_titulo(pk_cod_tit),
    FOREIGN KEY (fk_cod_ped) REFERENCES tb_pedido(pk_cod_ped)
);

create table tb_titulo_artista(
	fk_cod_tit INT comment "Código do Titulo" NOT NULL, 
    fk_cod_art INT comment "Código do Artista ou Banda" NOT NULL,
    FOREIGN KEY (fk_cod_tit) REFERENCES tb_titulo(pk_cod_tit),
    FOREIGN KEY (fk_cod_art) REFERENCES tb_artista(pk_cod_art)
);


drop table tb_artista;
drop table tb_estado;
drop table tb_categoria;
drop table tb_gravadora;
