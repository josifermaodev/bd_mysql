-- Criação do banco de dados
CREATE DATABASE db_farmacia_bem_estar;

-- Uso do banco de dados
USE db_farmacia_bem_estar;

-- Criação da tabela tb_categorias
CREATE TABLE tb_categorias (
    id_categoria INT AUTO_INCREMENT,
    nome_categoria VARCHAR(50) NOT NULL,
    descricao_categoria TEXT NOT NULL,
    PRIMARY KEY(id_categoria)
);

-- Inserção de registros na tabela tb_categorias
INSERT INTO tb_categorias (nome_categoria, descricao_categoria) VALUES
('Medicamentos', 'Produtos destinados ao tratamento e prevenção de doenças.'),
('Suplementos', 'Produtos para complementar a alimentação e a saúde.'),
('Cosméticos', 'Produtos para cuidados pessoais e estética.'),
('Higiene', 'Produtos destinados à higiene pessoal e do lar.'),
('Infantil', 'Produtos voltados para bebês e crianças.');

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
('Paracetamol', 'Medicamento para febre e dor.', 15.00, 100, 1), 
('Vitamina C', 'Suplemento para fortalecer a imunidade.', 25.00, 50, 2),
('Shampoo Anticaspa', 'Cosmético para tratamento do couro cabeludo.', 45.00, 30, 3),
('Sabonete Líquido', 'Produto de higiene pessoal.', 12.00, 200, 4),
('Fralda Descartável', 'Produto higiênico para bebês.', 50.00, 150, 5),
('Protetor Solar', 'Cosmético para proteção contra raios solares.', 65.00, 40, 3),
('Ômega 3', 'Suplemento alimentar para saúde do coração.', 80.00, 25, 2),
('Antialérgico', 'Medicamento para alergias.', 55.00, 60, 1);

-- Consultas solicitadas
SELECT * FROM tb_categorias;

SELECT * FROM tb_produtos;

-- SELECT para retornar todos os produtos cujo valor seja maior do que R$ 50,00
SELECT * FROM tb_produtos WHERE tb_produtos.valor > 50.00;

-- SELECT para retornar todos os produtos cujo valor esteja no intervalo entre R$ 5,00 e R$ 60,00
SELECT * FROM tb_produtos WHERE tb_produtos.valor BETWEEN 5.00 AND 60.00;

-- SELECT utilizando o operador LIKE para buscar todos os produtos que possuam a letra C no atributo nome_produto
SELECT * FROM tb_produtos WHERE tb_produtos.nome_produto LIKE '%S%';

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

-- SELECT utilizando INNER JOIN para retornar apenas os produtos que pertencem à categoria "Cosméticos"
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
WHERE tb_categorias.nome_categoria = 'Cosméticos';
