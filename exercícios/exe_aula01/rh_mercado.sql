CREATE DATABASE db_rh;

USE db_rh;

CREATE TABLE tb_servicos (
	matricula bigint auto_increment,
    nome varchar(255) not null,
    turno varchar (255) not null,
	cargo varchar (255) not null,
    salario decimal,
    data_admissao date,
    tipo_contrato varchar(255),
    primary key(matricula)
);

ALTER TABLE tb_servicos MODIFY salario decimal(8,2);

INSERT INTO tb_servicos (nome, turno, cargo, salario , data_admissao, tipo_contrato)
VALUES ("Felipe Campos", "Manhã", "Açougueiro", 1687.57, "2024-08-10", "Clt"),
	("Mariana Lima", "Tarde", "Frente de Caixa", 1568.00, "2024-05-01", "Clt"),
    ("Enzo Silva", "Noite", "Repositor", 1750.90, "2024-03-17", "PJ"),
    ("Caio Castro", "Manhã", "Padeiro", 1849.89, "2024-07-23", "Clt"),
    ("Yasmin Neves", "Tarde", "Auxiliar Administrativo", 1150.00, "2025-01-05", "Estágio");
    
SELECT * FROM tb_servicos;

SELECT * FROM tb_servicos WHERE salario > 2000.00;

SELECT * FROM tb_servicos WHERE salario < 2000.00;

UPDATE tb_servicos SET salario = 3550.00 WHERE matricula = 1;
UPDATE tb_servicos SET salario = 2850.00 WHERE matricula = 4;


