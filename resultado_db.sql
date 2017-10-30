create database resultado_db;

use resultado_db;

create table clube (id_clube bigint primary key auto_increment , nome varchar (30), sigla varchar (3), escudo varchar (255));

create table placar (id_placar bigint primary key auto_increment, dt_jogo timestamp, gol_mandante int, gol_visitante int);

create table estadio (id_estadio bigint primary key auto_increment, nome varchar (100));

create table rodada (id_rodada bigint primary key auto_increment, descricao varchar (100));

alter table placar add fk_mandante_id bigint;

alter table placar add constraint fk_mandante_id

foreign key (fk_mandante_id) references clube (id_clube);

alter table placar add fk_visitante_id bigint;

alter table placar add constraint fk_visitante_id

foreign key (fk_visitante_id) references clube (id_clube);

alter table placar add fk_estadio_id bigint;

alter table placar add constraint fk_estadio_id

foreign key (fk_estadio_id) references estadio (id_estadio);

alter table placar add fk_rodada_id bigint;

alter table placar add constraint fk_rodada_id

foreign key (fk_rodada_id) references rodada (id_rodada);

alter table placar add constraint fk_mandante_id_res

            foreign key(fk_mandante_id) references clube(id_clube)

                    on delete no action

                    on update no action;

alter table placar add constraint fk_visitante_id_res

            foreign key(fk_visitante_id) references clube(id_clube)

                    on delete no action

                    on update no action;

alter table placar add constraint fk_estadio_id_res

            foreign key(fk_estadio_id) references estadio(id_estadio)

                    on delete no action

                    on update no action;

alter table placar add constraint fk_rodada_id_res

            foreign key(fk_rodada_id) references rodada(id_rodada)

                    on delete no action

                    on update no action;

alter table clube modify nome varchar (30) not null;

alter table clube modify sigla varchar (3) not null unique;

alter table placar modify dt_jogo timestamp not null;

alter table placar modify gol_mandante int not null;

alter table placar modify gol_visitante int not null;

alter table estadio modify nome varchar (100) not null;

alter table rodada modify descricao varchar (100) not null;

insert into clube (id_clube, nome, sigla, escudo)

                values (1,'Fluminense','FLU','globoesporte.com/clubes/escudos/flu.svg'),

                   (2,'Palmeiras','PAL','globoesporte.com/clubes/escudos/pal.svg');

insert into estadio (id_estadio, nome)

                values  (1,'Maracanã');

insert into rodada (id_rodada, descricao)

                                               values (1,'Rodada 25');

insert into placar (id_placar, dt_jogo, gol_mandante, gol_visitante, fk_mandante_id, fk_visitante_id, fk_estadio_id, fk_rodada_id)

                values (1,'2017-09-24 16:00:00',0,1,1,2,1,1);