create database DB_CDs;
use DB_CDs;

create table artista(
	pk_cod_artista int primary key auto_increment NOT NULL COMMENT 'Código do Artista',
    nome_artista varchar(100) unique NOT NULL COMMENT 'Nome do Artista');

create table gravadora(
	pk_cod_gravadora int primary key auto_increment NOT NULL COMMENT 'Código da gravadora',
    nome_gravadora varchar(100) unique NOT NULL COMMENT 'Nome da Gravadora');

create table categoria(
	pk_cod_categoria int primary key auto_increment NOT NULL COMMENT 'Código do Artista',
    nome_categoria varchar(100) unique NOT NULL COMMENT 'Nome da Categoria');

create table estado(
	sigla_est char(2) primary key auto_increment NOT NULL COMMENT 'Sigla do Estado',
    nome_est varchar(50) unique NULL COMMENT 'Nome do Estado');

create table cidade(
	cod_cidade int primary key NOT NULL COMMENT 'Código da Cidade',
    fk_sigla_est CHAR(2) NOT NULL COMMENT 'Sigla Estado',
    nome_cidade varchar(100) NOT NULL COMMENT 'Nome da Cidade');

create table cliente 