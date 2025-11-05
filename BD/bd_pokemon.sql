create database db_pokemons;
use db_pokemons;

create table tb_treinador (
    id_treinador int primary key auto_increment,
    nome_treinador varchar(50) not null,
    genero_treinador enum("F", "M"),
    aparencia_treinador varchar(150) not null,
    data_nasc_treinador date not null,
    gosto_treinador varchar(150) not null,
    qnt_pokebola int not null,
    endereco_treinador varchar(255) not null
);

create table tb_pokedex (
    id_pokedex int primary key auto_increment,
    id_treinador int not null,
    id_pokemon int not null,
    qnt_pokemon int not null,
    unique key (id_treinador, id_pokemon)
);

create table tb_fazenda (
    id_fazenda int primary key auto_increment,
    id_treinador int not null,
    qnt_pokemonf int not null
);

create table tb_tipo (
    id_tipo int primary key auto_increment,
    nome_tipo varchar(50) not null
);

create table tb_pokemon (
    id_pokemon int primary key auto_increment,
    id_treinador int not null,
    id_pokedex int null,
    id_fazenda int not null,
    nome_pokemon varchar(50) not null,
    forma_pokemon varchar(50) not null,
    hp_pokemon int not null,
    atk_pokemon int not null,
    qt_pokemon int not null,
    agilidade_pokemon int not null,
    geracao_pokemon int not null
);

create table tb_classification (
    id_classificacao int primary key auto_increment,
    id_tipo int not null,
    id_pokemon int not null
);

alter table tb_pokedex
add constraint fk_pokedex_treinador
foreign key (id_treinador) references tb_treinador(id_treinador),
add constraint fk_pokedex_pokemon
foreign key (id_pokemon) references tb_pokemon(id_pokemon);

alter table tb_fazenda
add constraint fk_fazenda_treinador
foreign key (id_treinador) references tb_treinador(id_treinador);

alter table tb_pokemon
add constraint fk_pokemon_treinador
foreign key (id_treinador) references tb_treinador(id_treinador),
add constraint fk_pokemon_pokedex
foreign key (id_pokedex) references tb_pokedex(id_pokedex),
add constraint fk_pokemon_fazenda
foreign key (id_fazenda) references tb_fazenda(id_fazenda);

alter table tb_classification
add constraint fk_classification_tipo
foreign key (id_tipo) references tb_tipo(id_tipo),
add constraint fk_classification_pokemon
foreign key (id_pokemon) references tb_pokemon(id_pokemon);
