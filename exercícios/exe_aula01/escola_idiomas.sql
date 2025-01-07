CREATE DATABASE db_escola;

USE db_escola;

CREATE TABLE tb_fichas(
	matricula bigint auto_increment,
    nome varchar(255) not null,
    idade int,
    genero varchar(255) not null,
    curso varchar(255) not null,
    nota decimal,
    primary key(matricula)
);

ALTER TABLE tb_fichas MODIFY nota decimal(4,1);

SELECT * FROM tb_fichas;

INSERT INTO tb_fichas (nome, idade, genero, curso, nota)
VALUES ("Diego", 25, "Masculino", "Ingles", 8.5),
	("Gabriel", 28, "Masculino", "Espanhol", 5.4),
    ("Ana Paula", 32, "Masculino", "Ingles", 8.3),
    ("João Henrique", 19, "Masculino", "Frances", 5.8),
    ("Emily Crustuny", 27, "Masculino", "Russo", 6.7),
    ("Fernanda Ribeiro", 26, "Masculino", "Ingles", 7.9),
    ("Victor Pestana", 18, "Masculino", "Espanhol", 9.3),
    ("Josiane Fermao", 26, "Feminino", "Frances", 4.5);
    
SELECT * FROM tb_fichas WHERE nota > 7.0;

SELECT * FROM tb_fichas WHERE nota < 7.0;

UPDATE tb_fichas set nota = 9.5 WHERE matricula = 5;


