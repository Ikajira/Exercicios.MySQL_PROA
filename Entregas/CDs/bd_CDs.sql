create database db_cds;
use db_cds;

create table tb_artista (
    pk_cod_art int auto_increment not null primary key comment "código do artista",
    nome_art varchar(100) not null unique comment "nome do artista ou nome da banda"
);

create table tb_gravadora (
    pk_cod_grav int auto_increment not null primary key comment "código da gravadora",
    nome_grav varchar(50) not null unique comment "nome da gravadora"
);

create table tb_categoria (
    pk_cod_cat int auto_increment not null primary key comment "código da categoria",
    nome_cat varchar(50) not null unique comment "nome da categoria"
);

create table tb_estado (
    pk_cod_est int auto_increment not null primary key comment "código do estado",
    sigla_est char(2) not null comment "sigla do estado",
    nome_est varchar(50) not null unique comment "nome do estado"
);

create table tb_cidade (
    pk_cod_cid int auto_increment not null primary key comment "código da cidade",
    fk_cod_est int not null comment "código do estado",
    nome_cid varchar(100) not null comment "nome da cidade",
    foreign key (fk_cod_est) references tb_estado(pk_cod_est)
);

create table tb_cliente (
    pk_cod_cli int auto_increment not null primary key comment "código do cliente",
    fk_cod_cid int not null comment "código da cidade",
    nome_cli varchar(100) not null comment "nome do cliente",
    end_cli varchar(200) not null comment "endereço do cliente",
    renda_cli decimal(10,2) not null default 0 comment "renda do cliente",
    sexo_cli enum("F","M") not null default "F" comment "sexo do cliente",
    foreign key (fk_cod_cid) references tb_cidade(pk_cod_cid)
);

create table tb_conjuge (
    fk_cod_cli int not null primary key comment "código do cliente",
    nome_conj varchar(100) not null comment "nome do conjuge",
    renda_conj decimal(10,2) not null default 0 comment "renda do conjuge",
    sexo_conj enum("F","M") not null default "M" comment "sexo do conjuge",
    foreign key (fk_cod_cli) references tb_cliente(pk_cod_cli)
);

create table tb_funcionario (
    pk_cod_func int auto_increment not null primary key comment "código do funcionário",
    nome_func varchar(100) not null comment "nome do funcionário",
    end_func varchar(200) not null comment "endereço do funcionário",
    sal_func decimal(10,2) not null default 0 comment "salário do funcionário",
    sexo_func enum("F","M") not null default "M" comment "sexo do funcionário"
);

create table tb_dependente (
    pk_cod_dep int auto_increment not null primary key comment "código do dependente",
    fk_cod_func int not null comment "código do funcionário",
    nome_dep varchar(100) not null comment "nome do dependente",
    sexo_dep enum("F","M") not null default "M" comment "sexo do dependente",
    foreign key (fk_cod_func) references tb_funcionario(pk_cod_func)
);

create table tb_titulo (
    pk_cod_tit int auto_increment not null primary key comment "código do título",
    fk_cod_cat int not null comment "código da categoria",
    fk_cod_grav int not null comment "código da gravadora",
    nome_cd varchar(100) not null unique comment "nome do cd",
    val_cd decimal(10,2) not null comment "valor do cd",
    qtd_estoque int not null comment "quantidade de cd de cada título em estoque",
    foreign key (fk_cod_cat) references tb_categoria(pk_cod_cat),
    foreign key (fk_cod_grav) references tb_gravadora(pk_cod_grav)
);

create table tb_pedido (
    pk_cod_ped int auto_increment not null primary key comment "código do pedido",
    num_ped int not null comment "número do pedido",
    fk_cod_func int not null comment "código do funcionário que está atendendo o pedido",
    fk_cod_cli int not null comment "código do cliente que está fazendo o pedido",
    data_ped date not null comment "data do pedido",
    val_ped decimal(10,2) not null default 0 comment "valor do cd",
    foreign key (fk_cod_func) references tb_funcionario(pk_cod_func),
    foreign key (fk_cod_cli) references tb_cliente(pk_cod_cli)
);

create table tb_titulo_pedido (
    fk_cod_ped int not null comment "código do pedido",
    fk_cod_tit int not null comment "código do título",
    qtd_cd int not null comment "quantidade de cds vendidos, de mesmo título",
    val_cd decimal(10,2) not null comment "valor do cd no momento da venda",
    foreign key (fk_cod_tit) references tb_titulo(pk_cod_tit),
    foreign key (fk_cod_ped) references tb_pedido(pk_cod_ped)
);

create table tb_titulo_artista (
    fk_cod_tit int not null comment "código do título",
    fk_cod_art int not null comment "código do artista ou banda",
    foreign key (fk_cod_tit) references tb_titulo(pk_cod_tit),
    foreign key (fk_cod_art) references tb_artista(pk_cod_art)
);
