-- Criação do banco de dados
CREATE DATABASE db_curso_da_minha_vida;

-- Selecionar o banco de dados
USE db_curso_da_minha_vida;

-- Criação da tabela tb_categorias
CREATE TABLE tb_categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL,
    descricao_categoria TEXT NOT NULL
);

-- Inserção de registros na tabela tb_categorias
INSERT INTO tb_categorias (nome_categoria, descricao_categoria) VALUES
('Programação', 'Cursos relacionados ao aprendizado de linguagens de programação.'),
('Design', 'Cursos sobre design gráfico, UX/UI e ferramentas de criação.'),
('Negócios', 'Cursos de empreendedorismo, gestão e administração.'),
('Marketing Digital', 'Cursos de SEO, mídias sociais e marketing online.'),
('Idiomas', 'Cursos para aprender novos idiomas e culturas.');

-- Criação da tabela tb_cursos
CREATE TABLE tb_cursos (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nome_curso VARCHAR(50) NOT NULL,
    descricao_curso TEXT NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    carga_horaria INT NOT NULL,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id_categoria)
);

-- Inserção de registros na tabela tb_cursos
INSERT INTO tb_cursos (nome_curso, descricao_curso, valor, carga_horaria, id_categoria) VALUES
('Java para Iniciantes', 'Aprenda os fundamentos da linguagem Java.', 750.00, 40, 1),
('Python Avançado', 'Torne-se um expert em Python com projetos práticos.', 900.00, 60, 1),
('Introdução ao Photoshop', 'Curso básico de edição de imagens no Photoshop.', 400.00, 30, 2),
('UX/UI Design', 'Curso completo de experiência do usuário e interfaces.', 1000.00, 50, 2),
('Gestão Financeira', 'Aprenda a gerenciar suas finanças pessoais e empresariais.', 650.00, 45, 3),
('SEO Avançado', 'Domine as técnicas de otimização para motores de busca.', 550.00, 35, 4),
('Inglês Básico', 'Curso de inglês para iniciantes.', 300.00, 25, 5),
('Espanhol Intermediário', 'Aprimore suas habilidades em espanhol.', 700.00, 40, 5);

-- Consultas solicitadas
SELECT * FROM tb_categorias;

SELECT * FROM tb_cursos;

-- SELECT que retorna todos os cursos cujo valor seja maior do que R$ 500,00
SELECT * FROM tb_cursos WHERE valor > 500.00;

-- SELECT que retorna todos os cursos cujo valor esteja no intervalo R$ 600,00 e R$ 1000,00
SELECT * FROM tb_cursos WHERE valor BETWEEN 600.00 AND 1000.00;

-- SELECT utilizando o operador LIKE, buscando todos os cursos que possuam a letra J no atributo nome_curso
SELECT * FROM tb_cursos WHERE nome_curso LIKE '%I%';

-- SELECT utilizando INNER JOIN para unir os dados da tabela tb_cursos com tb_categorias
SELECT 
    tb_cursos.id_curso,
    tb_cursos.nome_curso,
    tb_cursos.descricao_curso,
    tb_cursos.valor,
    tb_cursos.carga_horaria,
    tb_categorias.nome_categoria,
    tb_categorias.descricao_categoria
FROM tb_cursos INNER JOIN tb_categorias
ON tb_cursos.id_categoria = tb_categorias.id_categoria;

-- SELECT utilizando INNER JOIN para trazer apenas os cursos que pertencem a uma categoria específica (Exemplo: Programação)
SELECT 
    tb_cursos.id_curso,
    tb_cursos.nome_curso,
    tb_cursos.descricao_curso,
    tb_cursos.valor,
    tb_cursos.carga_horaria,
    tb_categorias.nome_categoria,
    tb_categorias.descricao_categoria
FROM tb_cursos INNER JOIN tb_categorias
ON tb_cursos.id_categoria = tb_categorias.id_categoria
WHERE tb_categorias.nome_categoria = 'Programação';
