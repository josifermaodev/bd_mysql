-- Criação do banco de dados
CREATE DATABASE db_pizzaria_legal;

-- Uso do banco de dados
USE db_pizzaria_legal;

-- Criação da tabela tb_categorias
CREATE TABLE tb_categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL,
    descricao_categoria TEXT NOT NULL
);

-- Inserção de registros na tabela tb_categorias
INSERT INTO tb_categorias (nome_categoria, descricao_categoria) VALUES
('Tradicional', 'Pizzas clássicas com sabores tradicionais.'),
('Especial', 'Sabores sofisticados e ingredientes selecionados.'),
('Doce', 'Pizzas com sabores doces e sobremesas.'),
('Vegetariana', 'Pizzas sem ingredientes de origem animal.'),
('Premium', 'Pizzas de alta qualidade com ingredientes exclusivos.');

-- Criação da tabela tb_pizzas
CREATE TABLE tb_pizzas (
    id_pizza INT AUTO_INCREMENT PRIMARY KEY,
    nome_pizza VARCHAR(50) NOT NULL,
    descricao_pizza TEXT NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    tamanho VARCHAR(20) NOT NULL,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id_categoria)
);

-- Inserção de registros na tabela tb_pizzas
INSERT INTO tb_pizzas (nome_pizza, descricao_pizza, valor, tamanho, id_categoria) VALUES
('Calabresa', 'Pizza de calabresa com cebola e azeitonas.', 45.00, 'Média', 1), 
('Margherita', 'Pizza de mussarela, tomate e manjericão.', 50.00, 'Grande', 1), 
('Quatro Queijos', 'Pizza com mistura de queijos especiais.', 55.00, 'Grande', 2), 
('Brigadeiro', 'Pizza doce de chocolate e granulado.', 40.00, 'Média', 3),
('Romeu e Julieta', 'Pizza doce de goiabada e queijo.', 42.00, 'Pequena', 3),
('Vegetariana', 'Pizza de legumes, cogumelos e rúcula.', 48.00, 'Média', 4),
('Carne Seca', 'Pizza premium de carne seca com catupiry.', 60.00, 'Grande', 5),
('Camarão', 'Pizza premium de camarão com molho especial.', 80.00, 'Grande', 5);

-- Consultas solicitadas
SELECT * FROM tb_categorias;

SELECT * FROM tb_pizzas;

-- SELECT para retornar todas as pizzas cujo valor seja maior que R$ 45,00
SELECT * FROM tb_pizzas WHERE tb_pizzas.valor > 45.00;

-- SELECT para retornar todas as pizzas cujo valor esteja no intervalo entre R$ 50,00 e R$ 100,00
SELECT * FROM tb_pizzas WHERE tb_pizzas.valor BETWEEN 50.00 AND 100.00;

-- SELECT utilizando o operador LIKE para buscar todas as pizzas que possuam a letra M no atributo nome_pizza
SELECT * FROM tb_pizzas WHERE tb_pizzas.nome_pizza LIKE '%M%';

-- SELECT utilizando INNER JOIN para unir os dados da tabela tb_pizzas com tb_categorias
SELECT 
    tb_pizzas.id_pizza,
    tb_pizzas.nome_pizza,
    tb_pizzas.descricao_pizza,
    tb_pizzas.valor,
    tb_pizzas.tamanho,
    tb_categorias.nome_categoria,
    tb_categorias.descricao_categoria
FROM tb_pizzas INNER JOIN tb_categorias ON tb_pizzas.id_categoria = tb_categorias.id_categoria;

-- SELECT utilizando INNER JOIN para retornar apenas as pizzas que pertençam à categoria "Doce"
SELECT 
    tb_pizzas.id_pizza,
    tb_pizzas.nome_pizza,
    tb_pizzas.descricao_pizza,
    tb_pizzas.valor,
    tb_pizzas.tamanho,
    tb_categorias.nome_categoria,
    tb_categorias.descricao_categoria
FROM tb_pizzas INNER JOIN tb_categorias ON tb_pizzas.id_categoria = tb_categorias.id_categoria
WHERE tb_categorias.nome_categoria = 'Doce';
