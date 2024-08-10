CREATE SCHEMA IF NOT EXISTS hopefonte;

CREATE  TABLE hopefonte.tb_coordenadas ( 
	id_coord             integer  NOT NULL  ,
	latitude             char(5)    ,
	longitude            char(5)    ,
	CONSTRAINT pk_tb_coordenad_id_coord PRIMARY KEY ( id_coord )
 );

CREATE  TABLE hopefonte.tb_extended_tweets ( 
	id_ext_tweet         integer  NOT NULL  ,
	texto_completo       varchar(300)    ,
	CONSTRAINT pk_tb_extended__id_ext_tweet PRIMARY KEY ( id_ext_tweet )
 );

CREATE  TABLE hopefonte.tb_hashtags ( 
	id_hash              integer  NOT NULL  ,
	hashtag              varchar(300)    ,
	CONSTRAINT pk_tb_hashtags_id_hash PRIMARY KEY ( id_hash )
 );

CREATE  TABLE hopefonte.tb_localidade ( 
	id_localidade        integer  NOT NULL  ,
	cod_pais             integer    ,
	nome_pais            varchar(50)    ,
	id_coord             integer    ,
	CONSTRAINT pk_tb_localidad_id_localidad PRIMARY KEY ( id_localidade )
 );

CREATE  TABLE hopefonte.tb_user_quoted ( 
	id_user_quoted       integer  NOT NULL  ,
	data_cadastro        timestamp    ,
	num_seguidores       integer    ,
	CONSTRAINT pk_tb_user_quot_id_user_quot PRIMARY KEY ( id_user_quoted )
 );

CREATE  TABLE hopefonte.tb_user_retweet ( 
	id_user_retweet      integer  NOT NULL  ,
	data_cadastro        timestamp    ,
	num_seguidores       integer    ,
	CONSTRAINT pk_tb_user_retweet PRIMARY KEY ( id_user_retweet )
 );

CREATE  TABLE hopefonte.tb_user_tweet ( 
	id_user_tweet        integer  NOT NULL  ,
	data_cadastro        timestamp    ,
	num_seguidores       integer    ,
	CONSTRAINT pk_tb_user_tweet PRIMARY KEY ( id_user_tweet )
 );

CREATE  TABLE hopefonte.tb_tweet ( 
	id_tweet             integer  NOT NULL  ,
	data_tweet           timestamp    ,
	idioma_tweet         varchar(50)    ,
	texto_tweet          varchar(300)    ,
	num_retweets         integer    ,
	status_retweet       char(1)    ,
	id_user_tweet        integer  NOT NULL  ,
	id_hash              integer    ,
	id_localidade        integer  NOT NULL  ,
	CONSTRAINT pk_tb_tweet_id_tweet PRIMARY KEY ( id_tweet )
 );

CREATE  TABLE hopefonte.tb_retweet ( 
	id_retweet           integer  NOT NULL  ,
	texto_retweet        varchar(300)    ,
	id_hash              integer    ,
	id_tweet             integer  NOT NULL  ,
	id_user_retweet      integer  NOT NULL  ,
	CONSTRAINT pk_tb_retweet_id_retweet PRIMARY KEY ( id_retweet )
 );

CREATE  TABLE hopefonte.tb_user_mentions ( 
	id_user_mentions     integer  NOT NULL  ,
	nome_user            varchar(100)    ,
	id_tweet             integer    ,
	id_retweet           integer    ,
	id_ext_tweet         integer    ,
	CONSTRAINT pk_tb_user_ment_id_user_ment PRIMARY KEY ( id_user_mentions )
 );

CREATE  TABLE hopefonte.tb_quoted_tweets ( 
	id_quoted            integer  NOT NULL  ,
	texto_quoted         varchar(300)    ,
	id_hash              integer    ,
	id_tweet             integer    ,
	id_retweet           integer    ,
	id_user_quoted       integer  NOT NULL  ,
	CONSTRAINT pk_tb_quoted_tw_id_quoted PRIMARY KEY ( id_quoted )
 );

ALTER TABLE hopefonte.tb_localidade ADD CONSTRAINT fk_tb_localidade_tb_coordenadas FOREIGN KEY ( id_coord ) REFERENCES hopefonte.tb_coordenadas( id_coord );

ALTER TABLE hopefonte.tb_quoted_tweets ADD CONSTRAINT fk_tb_quoted_tweets_tb_tweet FOREIGN KEY ( id_tweet ) REFERENCES hopefonte.tb_tweet( id_tweet );

ALTER TABLE hopefonte.tb_quoted_tweets ADD CONSTRAINT fk_tb_quoted_tweets_tb_user_quoted FOREIGN KEY ( id_user_quoted ) REFERENCES hopefonte.tb_user_quoted( id_user_quoted );

ALTER TABLE hopefonte.tb_quoted_tweets ADD CONSTRAINT fk_tb_quoted_tweets_tb_retweet FOREIGN KEY ( id_retweet ) REFERENCES hopefonte.tb_retweet( id_retweet );

ALTER TABLE hopefonte.tb_quoted_tweets ADD CONSTRAINT fk_tb_quoted_tweets_tb_hashtags FOREIGN KEY ( id_hash ) REFERENCES hopefonte.tb_hashtags( id_hash );

ALTER TABLE hopefonte.tb_retweet ADD CONSTRAINT fk_tb_retweet_tb_tweet FOREIGN KEY ( id_tweet ) REFERENCES hopefonte.tb_tweet( id_tweet );

ALTER TABLE hopefonte.tb_retweet ADD CONSTRAINT fk_tb_retweet_tb_hashtags FOREIGN KEY ( id_hash ) REFERENCES hopefonte.tb_hashtags( id_hash );

ALTER TABLE hopefonte.tb_retweet ADD CONSTRAINT fk_tb_retweet_tb_user_retweet FOREIGN KEY ( id_user_retweet ) REFERENCES hopefonte.tb_user_retweet( id_user_retweet );

ALTER TABLE hopefonte.tb_tweet ADD CONSTRAINT fk_tb_tweet_tb_user_tweet FOREIGN KEY ( id_user_tweet ) REFERENCES hopefonte.tb_user_tweet( id_user_tweet );

ALTER TABLE hopefonte.tb_tweet ADD CONSTRAINT fk_tb_tweet_tb_hashtags FOREIGN KEY ( id_hash ) REFERENCES hopefonte.tb_hashtags( id_hash );

ALTER TABLE hopefonte.tb_tweet ADD CONSTRAINT fk_tb_tweet_tb_localidade FOREIGN KEY ( id_localidade ) REFERENCES hopefonte.tb_localidade( id_localidade );

ALTER TABLE hopefonte.tb_user_mentions ADD CONSTRAINT fk_tb_user_mentions_tb_tweet FOREIGN KEY ( id_tweet ) REFERENCES hopefonte.tb_tweet( id_tweet );

ALTER TABLE hopefonte.tb_user_mentions ADD CONSTRAINT fk_tb_user_mentions_tb_extended_tweets FOREIGN KEY ( id_ext_tweet ) REFERENCES hopefonte.tb_extended_tweets( id_ext_tweet );

ALTER TABLE hopefonte.tb_user_mentions ADD CONSTRAINT fk_tb_user_mentions_tb_retweet FOREIGN KEY ( id_retweet ) REFERENCES hopefonte.tb_retweet( id_retweet );

INSERT INTO hopefonte.tb_coordenadas( id_coord, latitude, longitude ) VALUES ( 198, '47.90', '52.87');
INSERT INTO hopefonte.tb_extended_tweets( id_ext_tweet, texto_completo ) VALUES ( 4001, 'Tweet estendido como exemplo');
INSERT INTO hopefonte.tb_hashtags( id_hash, hashtag ) VALUES ( 1, '#vieiradatalab');
INSERT INTO hopefonte.tb_hashtags( id_hash, hashtag ) VALUES ( 2, '#vieiradatalab');
INSERT INTO hopefonte.tb_localidade( id_localidade, cod_pais, nome_pais, id_coord ) VALUES ( 101, 2, 'Brasil', null);
INSERT INTO hopefonte.tb_localidade( id_localidade, cod_pais, nome_pais, id_coord ) VALUES ( 102, 3, 'Argentina', 198);
INSERT INTO hopefonte.tb_user_quoted( id_user_quoted, data_cadastro, num_seguidores ) VALUES ( 3001, '0001-09-13 10:10:10 PM', 789);
INSERT INTO hopefonte.tb_user_quoted( id_user_quoted, data_cadastro, num_seguidores ) VALUES ( 3002, '0001-09-14 10:10:10 PM', 887);
INSERT INTO hopefonte.tb_user_retweet( id_user_retweet, data_cadastro, num_seguidores ) VALUES ( 20001, '0001-09-11 10:10:10 PM', 8700);
INSERT INTO hopefonte.tb_user_retweet( id_user_retweet, data_cadastro, num_seguidores ) VALUES ( 20002, '0001-09-12 10:10:10 PM', 329);
INSERT INTO hopefonte.tb_user_tweet( id_user_tweet, data_cadastro, num_seguidores ) VALUES ( 1001, '0001-09-10 10:10:10 PM', 90);
INSERT INTO hopefonte.tb_user_tweet( id_user_tweet, data_cadastro, num_seguidores ) VALUES ( 1002, '0001-09-11 10:10:11 PM', 4320);
INSERT INTO hopefonte.tb_tweet( id_tweet, data_tweet, idioma_tweet, texto_tweet, num_retweets, status_retweet, id_user_tweet, id_hash, id_localidade ) VALUES ( 1, '0001-09-11 10:10:10 PM', 'pt-br', 'Primeiro tweet do modelo de banco de dados', 0, '1', 1001, null, 101);
INSERT INTO hopefonte.tb_tweet( id_tweet, data_tweet, idioma_tweet, texto_tweet, num_retweets, status_retweet, id_user_tweet, id_hash, id_localidade ) VALUES ( 2, '0001-09-11 10:10:10 PM', 'pt-br', 'Segundo tweet do modelo de banco de dados', 4, '1', 1002, null, 101);
INSERT INTO hopefonte.tb_retweet( id_retweet, texto_retweet, id_hash, id_tweet, id_user_retweet ) VALUES ( 9001, 'Primeiro tweet do modelo de banco de dados', null, 1, 20001);
INSERT INTO hopefonte.tb_retweet( id_retweet, texto_retweet, id_hash, id_tweet, id_user_retweet ) VALUES ( 9002, 'Primeiro tweet do modelo de banco de dados', null, 1, 20002);
INSERT INTO hopefonte.tb_user_mentions( id_user_mentions, nome_user, id_tweet, id_retweet, id_ext_tweet ) VALUES ( 5001, '@bob', null, null, null);
INSERT INTO hopefonte.tb_user_mentions( id_user_mentions, nome_user, id_tweet, id_retweet, id_ext_tweet ) VALUES ( 5002, '@mary', null, null, null);