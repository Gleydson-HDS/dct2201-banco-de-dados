-- =====================================================
-- INSERÇÃO DE 10 NOVOS AUTORES
-- IDs esperados: 5 a 14
-- =====================================================

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

-- =====================================================
-- INSERÇÃO DE 30 LIVROS
-- Inclui autores de IDs 1 a 4 e os novos autores 5 a 14
-- =====================================================

INSERT INTO livros (titulo, ano_publicacao, preco, autor_id) VALUES
-- Autor 1
('Dom Quixote', 1605, 59.90, 1),
('O Pequeno Príncipe', 1943, 39.90, 1),
('A Revolução dos Bichos', 1945, 44.90, 1),

-- Autor 2
('Memórias Póstumas de Brás Cubas', 1881, 49.90, 2),
('Quincas Borba', 1891, 42.90, 2),
('Dom Casmurro', 1899, 45.90, 2),

-- Autor 3
('Orgulho e Preconceito', 1813, 39.90, 3),
('Razão e Sensibilidade', 1811, 37.90, 3),
('Emma', 1815, 41.90, 3),

-- Autor 4
('Cem Anos de Solidão', 1967, 59.90, 4),
('O Amor nos Tempos do Cólera', 1985, 54.90, 4),
('Crônica de uma Morte Anunciada', 1981, 42.90, 4),

-- Machado de Assis (ID 5)
('Helena', 1876, 34.90, 5),
('Quincas Borba - Edição Comentada', 1891, 49.90, 5),
('Esaú e Jacó', 1904, 39.90, 5),

-- Jane Austen (ID 6)
('Persuasão', 1817, 38.90, 6),
('A Abadia de Northanger', 1817, 36.90, 6),

-- Gabriel García Márquez (ID 7)
('O Outono do Patriarca', 1975, 48.90, 7),
('Doze Contos Peregrinos', 1992, 44.90, 7),

-- George Orwell (ID 8)
('1984', 1949, 49.90, 8),
('Na Pior em Paris e Londres', 1933, 39.90, 8),

-- Jorge Amado (ID 9)
('Capitães da Areia', 1937, 42.90, 9),
('Gabriela, Cravo e Canela', 1958, 46.90, 9),

-- Agatha Christie (ID 10)
('Assassinato no Expresso do Oriente', 1934, 44.90, 10),
('E Não Sobrou Nenhum', 1939, 42.90, 10),

-- Franz Kafka (ID 11)
('A Metamorfose', 1915, 34.90, 11),
('O Processo', 1925, 39.90, 11),

-- Mary Shelley (ID 12)
('Frankenstein', 1818, 44.90, 12),

-- Haruki Murakami (ID 13)
('Norwegian Wood', 1987, 49.90, 13),
('Kafka à Beira-Mar', 2002, 54.90, 13),

-- Chinua Achebe (ID 14)
('O Mundo se Despedaça', 1958, 42.90, 14);
