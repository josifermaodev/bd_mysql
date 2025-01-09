DROP DATABASE db_generation_game_online;

-- Criação do banco de dados
CREATE DATABASE db_generation_game_online;

-- Uso do banco de dados
USE db_generation_game_online;

-- Criação da tabela tb_classes
CREATE TABLE tb_classes (
    id_classe INT AUTO_INCREMENT PRIMARY KEY,
    nome_classe VARCHAR(50) NOT NULL,
    descricao_classe TEXT NOT NULL
);

-- Inserção de registros na tabela tb_classes
INSERT INTO tb_classes (nome_classe, descricao_classe) VALUES
('Guerreiro', 'Classe especializada em combate corpo a corpo, alta resistência.'),
('Arqueiro', 'Classe ágil com ataques de longa distância.'),
('Mago', 'Classe poderosa com habilidades mágicas.'),
('Ladino', 'Especialista em furtividade e ataques rápidos.'),
('Clérigo', 'Classe de suporte, capaz de curar aliados.');

-- Criação da tabela tb_personagens
CREATE TABLE tb_personagens (
    id_personagem INT AUTO_INCREMENT PRIMARY KEY,
    nome_personagem VARCHAR(50) NOT NULL,
    poder_ataque INT NOT NULL,
    poder_defesa INT NOT NULL,
    nivel INT NOT NULL,
    id_classe INT,
    FOREIGN KEY (id_classe) REFERENCES tb_classes(id_classe)
);

-- Inserção de registros na tabela tb_personagens
INSERT INTO tb_personagens (nome_personagem, poder_ataque, poder_defesa, nivel, id_classe) VALUES
('Arthur', 2500, 1500, 10, 1),
('Robin', 1800, 1200, 8, 2),
('Merlin', 3000, 800, 12, 3),
('Luna', 2000, 1000, 9, 4),
('Healer', 500, 2000, 11, 5), 
('Drake', 2200, 1300, 10, 1), 
('Evelyn', 1900, 1400, 9, 2),  
('Cassandra', 2800, 900, 11, 3); 

-- Consultas solicitadas
SELECT * FROM tb_classes;

SELECT * FROM tb_personagens;

-- SELECT para retornar todos os personagens cujo poder de ataque seja maior que 2000
SELECT * FROM tb_personagens WHERE tb_personagens.poder_ataque > 2000;

-- SELECT para retornar todos os personagens cujo poder de defesa esteja no intervalo 1000 e 2000
SELECT * FROM tb_personagens WHERE tb_personagens.poder_defesa BETWEEN 1000 AND 2000;

-- SELECT utilizando o operador LIKE para buscar todos os personagens que possuam a letra C no atributo nome_personagem
SELECT * FROM tb_personagens WHERE tb_personagens.nome_personagem LIKE '%L%';

-- SELECT utilizando INNER JOIN para unir os dados da tabela tb_personagens com tb_classes
SELECT 
    tb_personagens.id_personagem,
    tb_personagens.nome_personagem,
    tb_personagens.poder_ataque,
    tb_personagens.poder_defesa,
    tb_personagens.nivel,
    tb_classes.nome_classe,
    tb_classes.descricao_classe
FROM tb_personagens INNER JOIN tb_classes ON tb_personagens.id_classe = tb_classes.id_classe;

-- SELECT utilizando INNER JOIN para retornar apenas os personagens que pertençam à classe "Arqueiro"
SELECT 
    tb_personagens.id_personagem,
    tb_personagens.nome_personagem,
    tb_personagens.poder_ataque,
    tb_personagens.poder_defesa,
    tb_personagens.nivel,
    tb_classes.nome_classe,
    tb_classes.descricao_classe
FROM tb_personagens INNER JOIN tb_classes 
ON tb_personagens.id_classe = tb_classes.id_classe
WHERE tb_classes.nome_classe = 'Arqueiro';



