-- ============================================================
-- setup.sql - Recriacao automatizada do banco biblioteca
-- MariaDB 11.x
-- ATENCAO: este script apaga o banco biblioteca e recria tudo.
-- ============================================================

SET NAMES utf8mb4;

-- 1. Recriar o banco do zero
DROP DATABASE IF EXISTS biblioteca;
CREATE DATABASE biblioteca
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci;

USE biblioteca;

-- 2. Criar as tabelas e suas restricoes
CREATE TABLE autores (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  pais VARCHAR(50),
  ano_nascimento INT
) ENGINE=InnoDB;

CREATE TABLE livros (
  id INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(150) NOT NULL,
  ano_publicacao INT,
  preco DECIMAL(10,2),
  autor_id INT,
  CONSTRAINT fk_livros_autores
    FOREIGN KEY (autor_id) REFERENCES autores(id)
) ENGINE=InnoDB;

CREATE TABLE emprestimos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  livro_id INT,
  data_emprestimo DATE,
  devolvido BOOLEAN,
  CONSTRAINT fk_emprestimos_livros
    FOREIGN KEY (livro_id) REFERENCES livros(id)
) ENGINE=InnoDB;

-- 3. Carga inicial: quatro autores
INSERT INTO autores (nome, pais, ano_nascimento) VALUES
('Machado de Assis', 'Brasil', 1839),
('Clarice Lispector', 'Brasil', 1920),
('Gabriel García Márquez', 'Colômbia', 1927),
('Jane Austen', 'Inglaterra', 1775);

-- 4. Carga inicial: cinco livros
INSERT INTO livros (titulo, ano_publicacao, preco, autor_id) VALUES
('Dom Casmurro', 1899, 39.90, 1),
('Memórias Póstumas de Brás Cubas', 1881, 45.00, 1),
('A Hora da Estrela', 1977, 32.50, 2),
('Cem Anos de Solidão', 1967, 59.90, 3),
('Orgulho e Preconceito', 1813, 29.90, 4);

-- 5. Carga expandida: dez autores adicionais
-- Mantidos os registros exatamente conforme os dados fornecidos.
INSERT INTO autores (nome, pais, ano_nascimento) VALUES
('Machado de Assis', 'Brasil', 1839),
('Jane Austen', 'Inglaterra', 1775),
('Gabriel García Márquez', 'Colômbia', 1927),
('George Orwell', 'Inglaterra', 1903),
('Jorge Amado', 'Brasil', 1912),
('Agatha Christie', 'Inglaterra', 1890),
('Franz Kafka', 'Império Austro-Húngaro', 1883),
('Mary Shelley', 'Inglaterra', 1797),
('Haruki Murakami', 'Japão', 1949),
('Chinua Achebe', 'Nigéria', 1930);

-- 6. Carga expandida: trinta e um livros
-- Os autor_id seguem a sequencia de IDs indicada no codigo fornecido.
INSERT INTO livros (titulo, ano_publicacao, preco, autor_id) VALUES
('Dom Quixote', 1605, 59.90, 1),
('O Pequeno Príncipe', 1943, 39.90, 1),
('A Revolução dos Bichos', 1945, 44.90, 1),
('Memórias Póstumas de Brás Cubas', 1881, 49.90, 2),
('Quincas Borba', 1891, 42.90, 2),
('Dom Casmurro', 1899, 45.90, 2),
('Orgulho e Preconceito', 1813, 39.90, 3),
('Razão e Sensibilidade', 1811, 37.90, 3),
('Emma', 1815, 41.90, 3),
('Cem Anos de Solidão', 1967, 59.90, 4),
('O Amor nos Tempos do Cólera', 1985, 54.90, 4),
('Crônica de uma Morte Anunciada', 1981, 42.90, 4),
('Helena', 1876, 34.90, 5),
('Quincas Borba - Edição Comentada', 1891, 49.90, 5),
('Esaú e Jacó', 1904, 39.90, 5),
('Persuasão', 1817, 38.90, 6),
('A Abadia de Northanger', 1817, 36.90, 6),
('O Outono do Patriarca', 1975, 48.90, 7),
('Doze Contos Peregrinos', 1992, 44.90, 7),
('1984', 1949, 49.90, 8),
('Na Pior em Paris e Londres', 1933, 39.90, 8),
('Capitães da Areia', 1937, 42.90, 9),
('Gabriela, Cravo e Canela', 1958, 46.90, 9),
('Assassinato no Expresso do Oriente', 1934, 44.90, 10),
('E Não Sobrou Nenhum', 1939, 42.90, 10),
('A Metamorfose', 1915, 34.90, 11),
('O Processo', 1925, 39.90, 11),
('Frankenstein', 1818, 44.90, 12),
('Norwegian Wood', 1987, 49.90, 13),
('Kafka à Beira-Mar', 2002, 54.90, 13),
('O Mundo se Despedaça', 1958, 42.90, 14);

-- 7. Carga de exemplo da tabela emprestimos
-- Os livros de IDs 1, 2 e 3 existem na carga acima.
INSERT INTO emprestimos (livro_id, data_emprestimo, devolvido) VALUES
(1, '2026-10-20', FALSE),
(2, '2026-10-22', FALSE),
(3, '2026-10-25', TRUE);

-- 8. Recriar os usuarios e conceder privilegios
-- As contas sao recriadas para que o script sempre aplique as senhas e grants definidos.
DROP USER IF EXISTS 'app_biblioteca'@'%';
DROP USER IF EXISTS 'consulta'@'%';

CREATE USER 'app_biblioteca'@'%' IDENTIFIED BY 'AppBib2026!';
GRANT SELECT, INSERT, UPDATE, DELETE
  ON biblioteca.* TO 'app_biblioteca'@'%';

CREATE USER 'consulta'@'%' IDENTIFIED BY 'Consulta2026!';
GRANT SELECT ON biblioteca.* TO 'consulta'@'%';

FLUSH PRIVILEGES;

-- 9. Verificacoes finais (resultados aparecem ao executar o script)
SELECT 'autores' AS tabela, COUNT(*) AS total FROM biblioteca.autores
UNION ALL
SELECT 'livros', COUNT(*) FROM biblioteca.livros
UNION ALL
SELECT 'emprestimos', COUNT(*) FROM biblioteca.emprestimos;

SHOW GRANTS FOR 'app_biblioteca'@'%';
SHOW GRANTS FOR 'consulta'@'%';
