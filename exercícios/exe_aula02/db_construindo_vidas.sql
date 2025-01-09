-- Criação do banco de dados
CREATE DATABASE db_construindo_vidas;

-- Selecionar o banco de dados
USE db_construindo_vidas;

-- Criação da tabela tb_categorias
CREATE TABLE tb_categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL,
    descricao_categoria TEXT NOT NULL
);

-- Inserção de registros na tabela tb_categorias
INSERT INTO tb_categorias (nome_categoria, descricao_categoria) VALUES
('Elétrica', 'Produtos relacionados a instalações elétricas, como fios e cabos.'),
('Hidráulica', 'Produtos para sistemas hidráulicos, como tubos e conexões.'),
('Ferramentas', 'Ferramentas manuais e elétricas para construção.'),
('Tinta e Pintura', 'Produtos para acabamento, como tintas e pincéis.'),
('Material Básico', 'Produtos como cimento, areia e tijolos.');

-- Criação da tabela tb_produtos
CREATE TABLE tb_produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(50) NOT NULL,
    descricao_produto TEXT NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    estoque INT NOT NULL,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id_categoria)
);

-- Inserção de registros na tabela tb_produtos
INSERT INTO tb_produtos (nome_produto, descricao_produto, valor, estoque, id_categoria) VALUES
('Cabo de Energia', 'Cabo flexível de alta resistência para instalações elétricas.', 120.00, 50, 1), 
('Interruptor', 'Interruptor de luz com design moderno.', 25.00, 100, 1),
('Tubo PVC', 'Tubo de PVC de alta durabilidade.', 80.00, 200, 2),
('Torneira', 'Torneira cromada para pia de cozinha.', 150.00, 30, 2), 
('Martelo', 'Martelo de aço com cabo de madeira.', 45.00, 60, 3),
('Broca de Concreto', 'Broca de alta performance para concreto.', 70.00, 40, 3), 
('Tinta Acrílica', 'Tinta acrílica premium para paredes internas.', 140.00, 25, 4),
('Saco de Cimento', 'Cimento de alta qualidade para construção civil.', 50.00, 80, 5);

-- Consultas solicitadas
SELECT * FROM tb_categorias;

SELECT * FROM tb_produtos;

-- SELECT que retorna todos os produtos cujo valor seja maior do que R$ 100,00
SELECT * FROM tb_produtos WHERE valor > 100.00;

-- SELECT que retorna todos os produtos cujo valor esteja no intervalo R$ 70,00 e R$ 150,00
SELECT * FROM tb_produtos WHERE valor BETWEEN 70.00 AND 150.00;

-- SELECT utilizando o operador LIKE, buscando todos os produtos que possuam a letra C no atributo nome_produto
SELECT * FROM tb_produtos WHERE nome_produto LIKE '%T%';

-- SELECT utilizando INNER JOIN para unir os dados da tabela tb_produtos com tb_categorias
SELECT 
    tb_produtos.id_produto,
    tb_produtos.nome_produto,
    tb_produtos.descricao_produto,
    tb_produtos.valor,
    tb_produtos.estoque,
    tb_categorias.nome_categoria,
    tb_categorias.descricao_categoria
FROM tb_produtos INNER JOIN tb_categorias 
ON tb_produtos.id_categoria = tb_categorias.id_categoria;

-- SELECT utilizando INNER JOIN para trazer apenas os produtos que pertencem a uma categoria específica (Exemplo: Produtos da categoria "Hidráulica")
SELECT 
    tb_produtos.id_produto,
    tb_produtos.nome_produto,
    tb_produtos.descricao_produto,
    tb_produtos.valor,
    tb_produtos.estoque,
    tb_categorias.nome_categoria,
    tb_categorias.descricao_categoria
FROM tb_produtos INNER JOIN tb_categorias 
ON tb_produtos.id_categoria = tb_categorias.id_categoria
WHERE tb_categorias.nome_categoria = 'Hidráulica';
