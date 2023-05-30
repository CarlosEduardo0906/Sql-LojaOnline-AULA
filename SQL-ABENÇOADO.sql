--CREATE DATABASE Dudus;
--USE Dudus;

--CREATE TABLE fornecedor (
--  cd_fornecedor INTEGER PRIMARY KEY NOT NULL,
--  cidade VARCHAR(20) NOT NULL,
--  nome VARCHAR(50) NOT NULL,
--  estado VARCHAR(30) NOT NULL,
--  UNIQUE (nome)
--);
--SELECT f.nome, f.cidade
--FROM fornecedor AS f

--CREATE TABLE produto (
--  cd_produto INTEGER PRIMARY KEY NOT NULL,
--  descricao TEXT,
--  preco MONEY NOT NULL DEFAULT 0,
--  nome VARCHAR(30) NOT NULL,
--  UNIQUE (nome)
--); 
--SELECT p.nome, p.preco
--FROM produto AS p

--CREATE TRIGGER atualizar_quantidade_produto
--ON contem
--AFTER INSERT
--AS
--BEGIN
--    UPDATE produto
--    SET quantidade = quantidade + i.quantidade
--    FROM produto
--    INNER JOIN inserted i ON produto.cd_produto = i.cd_produto;
--END;

--CREATE FUNCTION calcular_media_precos()
--RETURNS MONEY
--AS
--BEGIN
--    DECLARE @media MONEY;
--    SELECT @media = AVG(preco)
--    FROM produto;
--    RETURN @media;
--END;

--CREATE TABLE funcionario (
--  cd_funcionario INTEGER PRIMARY KEY,
--  cargo VARCHAR(20) NOT NULL,
--  nome VARCHAR(50) NOT NULL,
--  telefone CHAR(11) DEFAULT '00000000000',
--  UNIQUE (nome)
--);

--SELECT fu.cargo, fu.telefone
--FROM funcionario AS fu

--CREATE TABLE Cliente (
--  cpf CHAR(11) PRIMARY KEY,
--  endereco VARCHAR(40) NOT NULL,
--  nome VARCHAR(30) NOT NULL,
--  estado VARCHAR(20) NOT NULL,
--  UNIQUE (cpf)
--);
--SELECT c.nome, c.endereco
--FROM Cliente AS c

--CREATE TABLE pedido (
--  cd_pedido INTEGER PRIMARY KEY NOT NULL,
--  status_pedido TEXT NOT NULL,
--  data_pedido DATE NOT NULL,
--  cd_funcionario INTEGER,
--  cpf CHAR(11),
--  FOREIGN KEY (cd_funcionario) REFERENCES funcionario(cd_funcionario),
--  FOREIGN KEY (cpf) REFERENCES Cliente(cpf),
--  UNIQUE (cd_pedido)
--); 
--SELECT pe.cpf, pe.data_pedido
--FROM pedido AS pe
--SELECT pe.cpf, pe.data_pedido, f.nome AS nome_funcionario, c.nome AS nome_cliente
--FROM pedido pe
--LEFT JOIN funcionario f ON pe.cd_funcionario = f.cd_funcionario
--INNER JOIN Cliente c ON pe.cpf = c.cpf;
--SELECT pe.cpf,c.endereco
--FROM pedido pe
--INNER JOIN Cliente c ON pe.cpf = c.cpf
--INNER JOIN


--CREATE TABLE pagamento (
--  cd_pagamento INTEGER PRIMARY KEY NOT NULL,
--  boleto VARCHAR(48) DEFAULT '',
--  pix VARCHAR(50) DEFAULT '',
--  cartao CHAR(16) DEFAULT '',
--  cd_pedido INTEGER NOT NULL,
--  FOREIGN KEY (cd_pedido) REFERENCES pedido(cd_pedido),
--  UNIQUE (cd_pagamento)
--);
--SELECT pa.cd_pedido, pa.cd_pagamento
--FROM pagamento AS pa
	
--CREATE TABLE contem (
--  cd_produto INTEGER NOT NULL,
--  cd_pedido INTEGER NOT NULL,
--  quantidade INTEGER DEFAULT 0,
--  preco MONEY NOT NULL,
--  PRIMARY KEY (cd_produto, cd_pedido),
--  FOREIGN KEY (cd_produto) REFERENCES produto(cd_produto),
--  FOREIGN KEY (cd_pedido) REFERENCES pedido(cd_pedido)
--);
--SELECT co.quantidade, co.preco
--FROM contem AS co

--CREATE TRIGGER atualizar_preco_produto
--ON contem
--AFTER INSERT
--AS
--BEGIN
--    UPDATE produto
--    SET preco = (
--        SELECT SUM(c.preco)
--        FROM contem c
--        WHERE c.cd_produto = produto.cd_produto
--    )
--    FROM produto
--    INNER JOIN inserted i ON produto.cd_produto = i.cd_produto;
--END;


--CREATE TABLE fornece (
--  cd_fornecedor INTEGER NOT NULL,
--  cd_produto INTEGER NOT NULL,
--  FOREIGN KEY (cd_fornecedor) REFERENCES fornecedor(cd_fornecedor),
--  FOREIGN KEY (cd_produto) REFERENCES produto(cd_produto),
--  UNIQUE (cd_fornecedor, cd_produto)
--);
--SELECT fo.cd_fornecedor, fo.cd_produto
--FROM fornece AS fo
 


-- ----INSERÇÃO DE ITENS

-- INSERT INTO fornecedor ( cd_fornecedor, nome, cidade, estado)
-- VALUES                 ('999', 'Magazine luiza', 'Salvador', 'Bahia'),
--                        ('134', 'Kabum',          'São paulo', 'São Paulo'),
--						('876', 'Accenture',       'Recife',   'Pernambuco');


--INSERT INTO   produto 	  (cd_produto, descricao, preco, nome)
--   VALUES                 ('67908', 'Samsung galaxy S21', '1400', 'Celular');
                         						  		

--INSERT INTO   funcionario  (cd_funcionario, cargo, nome, telefone)
--VALUES                   ('156', 'Atendente de vendas', 'Carlos',  '81914567786');
                        

--INSERT INTO   cliente        (cpf, endereco, nome, estado)
--VALUES                     ('90923489723', 'Avenida Caxanga', 'Ana', 'Pernambuco');


--INSERT INTO   pedido         (cd_pedido, status_pedido, data_pedido, cd_funcionario, cpf)
--VALUES                       ('897', 'Saiu para entregue', '31/05/2023', '156', '90923489723' );


--INSERT INTO   pagamento       (cd_pagamento, boleto, pix, cartao, cd_pedido)
--VALUES                        ('2345', 'J9aG5bH3cR7fT2gY6hU4iM8jN1kL0oP6qZ3rX2sC9vB5nM4b', '7g9T5DcE2Qf6hR1jY8wX4zKl0Mv3NbVp6aSs5Fg2Ht7Uy9IqW3', '9475302816098245', '897');


--INSERT INTO contem              (cd_produto, cd_pedido, quantidade, preco)
--VALUES                          ('67908','897', '1', '1400');


--INSERT INTO fornece               (cd_fornecedor, cd_produto)
--VALUES                            ('999', '67908');
--select * from fornece

-- delete from funcionario where cd_funcionario = '190'



--SELECT pe.cpf, pe.data_pedido, SUM(co.preco) AS total_pedido
--FROM pedido AS pe
--INNER JOIN contem AS co ON pe.cd_pedido = co.cd_pedido
--GROUP BY pe.cpf, pe.data_pedido;



--SELECT AVG(co.preco) AS media_precos
--FROM contem AS co;


--SELECT pe.cpf, pe.data_pedido, COUNT(co.cd_produto) AS total_produtos
--FROM pedido AS pe
--INNER JOIN contem AS co ON pe.cd_pedido = co.cd_pedido
--GROUP BY pe.cpf, pe.data_pedido;


--SELECT pe.cpf, pe.data_pedido, MAX(co.preco) AS preco_maximo
--FROM pedido AS pe
--INNER JOIN contem AS co ON pe.cd_pedido = co.cd_pedido
--GROUP BY pe.cpf, pe.data_pedido;


--SELECT pe.cpf, pe.data_pedido, MIN(co.preco) AS preco_minimo
--FROM pedido AS pe
--INNER JOIN contem AS co ON pe.cd_pedido = co.cd_pedido
--GROUP BY pe.cpf, pe.data_pedido;


--CREATE PROCEDURE ObterInformacoesPedido
--AS
--BEGIN
--    SELECT pe.cpf, pe.data_pedido, COUNT(co.cd_produto) AS total_produtos, 
--           MAX(co.preco) AS preco_maximo, MIN(co.preco) AS preco_minimo
--    FROM pedido AS pe
--    INNER JOIN contem AS co ON pe.cd_pedido = co.cd_pedido
--    GROUP BY pe.cpf, pe.data_pedido;
--END;

--EXEC ObterInformacoesPedido;



--CREATE INDEX idx_contem_cd_produto ON contem(cd_produto);