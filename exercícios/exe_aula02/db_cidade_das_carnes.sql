-- Escolha o banco de dados entre db_cidade_das_carnes (para açougue) ou db_cidade_dos_vegetais (para hortifruti)
CREATE DATABASE db_cidade_das_carnes;

-- Uso do banco de dados
USE db_cidade_das_carnes; 

-- Criação da tabela tb_categorias
CREATE TABLE tb_categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL,
    descricao_categoria TEXT NOT NULL
);

-- Inserção de registros na tabela tb_categorias
INSERT INTO tb_categorias (nome_categoria, descricao_categoria) VALUES
('Carnes Bovinas', 'Produtos derivados de carne bovina.'),
('Carnes Suínas', 'Produtos derivados de carne suína.'),
('Aves', 'Produtos derivados de carne de frango e outras aves.'),
('Peixes e Frutos do Mar', 'Produtos derivados de peixes e frutos do mar.'),
('Processados', 'Produtos como embutidos e industrializados.');

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
('Picanha', 'Carne bovina de alta qualidade.', 120.00, 20, 1), 
('Alcatra', 'Corte macio e suculento de carne bovina.', 70.00, 30, 1), 
('Costelinha Suína', 'Carne suína ideal para churrascos.', 45.00, 25, 2), 
('Linguiça Toscana', 'Linguiça suína para grelhados.', 35.00, 50, 2), 
('Filé de Frango', 'Corte magro e versátil de frango.', 25.00, 40, 3), 
('Peito de Peru', 'Produto processado de carne de peru.', 60.00, 15, 5), 
('Salmão', 'Peixe de carne nobre.', 150.00, 10, 4), 
('Camarão', 'Frutos do mar de alta qualidade.', 130.00, 8, 4); 

-- Consultas solicitadas
SELECT * FROM tb_categorias;

SELECT * FROM tb_produtos;

-- SELECT para retornar todos os produtos cujo valor seja maior do que R$ 50,00
SELECT * FROM tb_produtos WHERE tb_produtos.valor > 50.00;

-- SELECT para retornar todos os produtos cujo valor esteja no intervalo entre R$ 50,00 e R$ 150,00
SELECT * FROM tb_produtos WHERE tb_produtos.valor BETWEEN 50.00 AND 150.00;

-- SELECT utilizando o operador LIKE para buscar todos os produtos que possuam a letra C no atributo nome_produto
SELECT * FROM tb_produtos WHERE tb_produtos.nome_produto LIKE '%C%';

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

-- SELECT utilizando INNER JOIN para retornar apenas os produtos que pertencem a uma categoria específica (Exemplo: "Aves" ou "Peixes e Frutos do Mar")
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
WHERE tb_categorias.nome_categoria IN ('Aves', 'Peixes e Frutos do Mar');
