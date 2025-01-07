CREATE DATABASE db_ecommerce;

USE db_ecommerce;

CREATE TABLE tb_produtos (
	id bigint auto_increment,
    nome varchar(255) not null,
    quantidade int,
    marca varchar(255) not null,
    tipo varchar(255) not null,
    preco decimal,
    primary key(id)
);

ALTER TABLE tb_produtos MODIFY preco decimal(6,2);

INSERT INTO tb_produtos (nome, quantidade, marca, tipo, preco)
VALUES ("Ferrari Black", 10, "Scuderia Ferrari", "Edp", 548.90),
	("Floratta Red", 25, "oBoticário", "Edt", 119.90),
    ("Devotion", 8, "Dolce E Gabbana", "Edp", 1297.90),
    ("212 Vip Men", 12, "Carolina Herrera", "Edt", 635.90),
    ("1 Million", 18, "Paco Rabanne", "Edt", 661.90),
    ("Scandal", 35, "Jean Paul Gaultier", "Edp", 389.90),
    ("Cuté", 28, "La Rive", "Edp", 81.90),
    ("Good Girl ", 21, "Carolina Herrera", "Edp", 448.90),
    ("Into The Night", 53, "Bath & Body Works", "Body Splash", 159.90);
    
SELECT * FROM tb_produtos;

SELECT * FROM tb_produtos WHERE preco > 500.00;

SELECT * FROM tb_produtos WHERE preco < 500.00; 

SELECT id, nome, CONCAT('R$ ', FORMAT(preco, 2, 'pt_BR')) AS Preco FROM tb_produtos;

UPDATE tb_produtos SET quantidade = 64 WHERE id = 2;
    
    
    

