CREATE DATABASE IF NOT EXISTS PortalDoConhecimento;
USE PortalDoConhecimento;
CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefone VARCHAR(20) NOT NULL
);
INSERT INTO clientes (nome, email, telefone) VALUES
('João Silva', 'joao.silva@email.com', '1234-5678'),
('Maria Oliveira', 'maria.oliveira@email.com', '2345-6789'),
('Carlos Souza', 'carlos.souza@email.com', '3456-7890'),
('Ana Costa', 'ana.costa@email.com', '4567-8901'),
('Paula Lima', 'paula.lima@email.com', '5678-9012'),
('Lucas Pereira', 'lucas.pereira@email.com', '6789-0123'),
('Fernanda Santos', 'fernanda.santos@email.com', '7890-1234'),
('Ricardo Almeida', 'ricardo.almeida@email.com', '8901-2345'),
('Juliana Mendes', 'juliana.mendes@email.com', '9012-3456'),
('Felipe Rocha', 'felipe.rocha@email.com', '0123-4567');
CREATE TABLE livros (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    ano_publicacao INT NOT NULL
);
INSERT INTO livros (nome, ano_publicacao) VALUES
('O Senhor dos Anéis', 1954),
('Dom Quixote', 1605),
('1984', 1949),
('A Montanha Mágica', 1924),
('Harry Potter e a Pedra Filosofal', 1997),
('Cem Anos de Solidão', 1967),
('O Pequeno Príncipe', 1943),
('O Hobbit', 1937),
('Orgulho e Preconceito', 1813),
('A Guerra dos Tronos', 1996);
CREATE TABLE autores (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);
INSERT INTO autores (nome) VALUES
('J.R.R. Tolkien'),
('Miguel de Cervantes'),
('George Orwell'),
('Thomas Mann'),
('J.K. Rowling'),
('Gabriel García Márquez'),
('Antoine de Saint-Exupéry'),
('Jane Austen'),
('George R.R. Martin'),
('Mario Vargas Llosa');
CREATE TABLE livros_autores (
    id_livro INT,
    id_autor INT,
    PRIMARY KEY (id_livro, id_autor),
    FOREIGN KEY (id_livro) REFERENCES livros(id_livro) ON DELETE CASCADE,
    FOREIGN KEY (id_autor) REFERENCES autores(id_autor) ON DELETE CASCADE
);
INSERT INTO livros_autores (id_livro, id_autor) VALUES
(1, 1),  -- O Senhor dos Anéis - J.R.R. Tolkien
(8, 1),  -- O Hobbit - J.R.R. Tolkien
(2, 2),  -- Dom Quixote - Miguel de Cervantes
(3, 3),  -- 1984 - George Orwell
(4, 4),  -- A Montanha Mágica - Thomas Mann
(5, 5),  -- Harry Potter e a Pedra Filosofal - J.K. Rowling
(6, 6),  -- Cem Anos de Solidão - Gabriel García Márquez
(7, 7),  -- O Pequeno Príncipe - Antoine de Saint-Exupéry
(9, 8),  -- Orgulho e Preconceito - Jane Austen
(10, 9), -- A Guerra dos Tronos - George R.R. Martin
(5, 5);  -- Harry Potter e a Pedra Filosofal - J.K. Rowling (para ilustrar um autor repetido)
CREATE TABLE pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    data_pedido DATE NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente) ON DELETE CASCADE
);
INSERT INTO pedidos (id_cliente, data_pedido) VALUES
(1, '2024-11-01'),
(2, '2024-11-02'),
(3, '2024-11-03'),
(4, '2024-11-04'),
(5, '2024-11-05'),
(6, '2024-11-06'),
(7, '2024-11-07'),
(8, '2024-11-08'),
(9, '2024-11-09'),
(10, '2024-11-10');
CREATE TABLE itens_pedido (
    id_pedido INT,
    id_livro INT,
    quantidade INT NOT NULL,
    PRIMARY KEY (id_pedido, id_livro),
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido) ON DELETE CASCADE,
    FOREIGN KEY (id_livro) REFERENCES livros(id_livro) ON DELETE CASCADE
);
INSERT INTO itens_pedido (id_pedido, id_livro, quantidade) VALUES
(1, 1, 2),  -- João Silva comprou 2 livros "O Senhor dos Anéis"
(2, 2, 1),  -- Maria Oliveira comprou 1 livro "Dom Quixote"
(3, 3, 1),  -- Carlos Souza comprou 1 livro "1984"
(4, 4, 3),  -- Ana Costa comprou 3 livros "A Montanha Mágica"
(5, 5, 1),  -- Paula Lima comprou 1 livro "Harry Potter e a Pedra Filosofal"
(6, 6, 2),  -- Lucas Pereira comprou 2 livros "Cem Anos de Solidão"
(7, 7, 1),  -- Fernanda Santos comprou 1 livro "O Pequeno Príncipe"
(8, 8, 2),  -- Ricardo Almeida comprou 2 livros "O Hobbit"
(9, 9, 1),  -- Juliana Mendes comprou 1 livro "Orgulho e Preconceito"
(10, 10, 1); -- Felipe Rocha comprou 1 livro "A Guerra dos Tronos"
