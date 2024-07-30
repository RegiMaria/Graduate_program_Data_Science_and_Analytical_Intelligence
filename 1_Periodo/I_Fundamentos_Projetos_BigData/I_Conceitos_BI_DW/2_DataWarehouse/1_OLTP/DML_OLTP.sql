SELECT * FROM endereco;
SELECT * FROM fonte_renda;
SELECT * FROM faixa_renda;
SELECT * FROM produto;
SELECT * FROM cliente;
SELECT * FROM pagamento;

-- Populando a tabela transacional endereco
INSERT INTO endereco (cep, rua, numero, bairro, cidade, estado) VALUES ('81010-000', 'Rua Primeiro de Maio', 101, 'CIC', 'Curitiba', 'PR');
INSERT INTO endereco (cep, rua, numero, bairro, cidade, estado) VALUES ('81020-000', 'Rua Segunda', 202, 'Tatuquara', 'Curitiba', 'PR');
INSERT INTO endereco (cep, rua, numero, bairro, cidade, estado) VALUES ('81030-000', 'Rua Terceira', 303, 'Sítio Cercado', 'Curitiba', 'PR');
INSERT INTO endereco (cep, rua, numero, bairro, cidade, estado) VALUES ('81040-000', 'Rua Quarta', 404, 'Capão Raso', 'Curitiba', 'PR');
INSERT INTO endereco (cep, rua, numero, bairro, cidade, estado) VALUES ('81050-000', 'Rua Quinta', 505, 'Cachoeira', 'Curitiba', 'PR');
INSERT INTO endereco (cep, rua, numero, bairro, cidade, estado) VALUES ('81060-000', 'Rua Sexta', 606, 'Fazendinha', 'Curitiba', 'PR');
INSERT INTO endereco (cep, rua, numero, bairro, cidade, estado) VALUES ('81070-000', 'Rua Sétima', 707, 'Boqueirão', 'Curitiba', 'PR');
INSERT INTO endereco (cep, rua, numero, bairro, cidade, estado) VALUES ('81080-000', 'Rua Oitava', 808, 'Ganchinho', 'Curitiba', 'PR');
INSERT INTO endereco (cep, rua, numero, bairro, cidade, estado) VALUES ('81090-000', 'Rua Nona', 909, 'Campo de Santana', 'Curitiba', 'PR');
INSERT INTO endereco (cep, rua, numero, bairro, cidade, estado) VALUES ('81100-000', 'Rua Décima', 1010, 'Novo Mundo', 'Curitiba', 'PR');

INSERT INTO endereco (cep, rua, numero, bairro, cidade, estado) VALUES ('82010-000', 'Rua Onze', 1111, 'Água Verde', 'Curitiba', 'PR');
INSERT INTO endereco (cep, rua, numero, bairro, cidade, estado) VALUES ('82020-000', 'Rua Doze', 1212, 'Portão', 'Curitiba', 'PR');
INSERT INTO endereco (cep, rua, numero, bairro, cidade, estado) VALUES ('82030-000', 'Rua Treze', 1313, 'Alto da XV', 'Curitiba', 'PR');
INSERT INTO endereco (cep, rua, numero, bairro, cidade, estado) VALUES ('82040-000', 'Rua Quatorze', 1414, 'Batel', 'Curitiba', 'PR');
INSERT INTO endereco (cep, rua, numero, bairro, cidade, estado) VALUES ('82050-000', 'Rua Quinze', 1515, 'Bigorrilho', 'Curitiba', 'PR');
INSERT INTO endereco (cep, rua, numero, bairro, cidade, estado) VALUES ('82060-000', 'Rua Dezesseis', 1616, 'Cabral', 'Curitiba', 'PR');
INSERT INTO endereco (cep, rua, numero, bairro, cidade, estado) VALUES ('82070-000', 'Rua Dezessete', 1717, 'Jardim das Américas', 'Curitiba', 'PR');
INSERT INTO endereco (cep, rua, numero, bairro, cidade, estado) VALUES ('82080-000', 'Rua Dezoito', 1818, 'Juvevê', 'Curitiba', 'PR');
INSERT INTO endereco (cep, rua, numero, bairro, cidade, estado) VALUES ('82090-000', 'Rua Dezenove', 1919, 'Mercês', 'Curitiba', 'PR');
INSERT INTO endereco (cep, rua, numero, bairro, cidade, estado) VALUES ('82100-000', 'Rua Vinte', 2020, 'Seminário', 'Curitiba', 'PR');

-- Fonte de renda:

INSERT INTO fonte_renda (descricao) VALUES ('CLT');
INSERT INTO fonte_renda (descricao) VALUES ('autônomo');
INSERT INTO fonte_renda (descricao) VALUES ('Pensionista INSS');
INSERT INTO fonte_renda (descricao) VALUES ('Bolsa Família');
INSERT INTO fonte_renda (descricao) VALUES ('Servidor Público Municipal');
INSERT INTO fonte_renda (descricao) VALUES ('Servidor Público Estadual');

ALTER TABLE fonte_renda
ADD descricao VARCHAR2(100);
INSERT INTO fonte_renda (descricao) VALUES ('Contrato PJ'); -- Adicionando o Contrato PJ

INSERT INTO faixa_renda (descricao) VALUES ('Baixa renda: até 3 salários mínimos');
INSERT INTO faixa_renda (descricao) VALUES ('Media renda: de 3 a 6 salários mínimos');
INSERT INTO faixa_renda (descricao) VALUES ('Alta renda: a partir de 6 salários mínimos');


-- Produtos

INSERT INTO produto (nome_produto, descricao, tipo_produto, valor_minimo, valor_maximo, numero_parcelas_maximo, condicoes_especiais) VALUES 
('Crédito direto ao consumidor - Energia', 'CDCE - Débito energia', 'CDCE', 500, 2200, 24, 'Não comprova renda');

INSERT INTO produto (nome_produto, descricao, tipo_produto, valor_minimo, valor_maximo, numero_parcelas_maximo, condicoes_especiais) VALUES 
('Crédito com débito em conta', 'CDC Débito em conta', 'CDC', 500, 3000, 18, 'Comprova renda');

INSERT INTO produto (nome_produto, descricao, tipo_produto, valor_minimo, valor_maximo, numero_parcelas_maximo, condicoes_especiais) VALUES 
('Crédito pessoal com garantia - CP auto', 'CPGA', 'CPGA', 5000, 50000, 36, 'Carros de até 20 anos como garantia');

INSERT INTO produto (nome_produto, descricao, tipo_produto, valor_minimo, valor_maximo, numero_parcelas_maximo, condicoes_especiais) VALUES 
('Crédito Pessoal Energia', 'CPE', 'CPE', 400, 2200, 22, 'Não comprova renda - Parcela na fatura de energia');

INSERT INTO produto (nome_produto, descricao, tipo_produto, valor_minimo, valor_maximo, numero_parcelas_maximo, condicoes_especiais) VALUES 
('Crédito pessoal Boleto', 'CPB', 'CPB', 500, 10000, 22, 'Comprova renda');

INSERT INTO produto (nome_produto, descricao, tipo_produto, valor_minimo, valor_maximo, numero_parcelas_maximo, condicoes_especiais) VALUES 
('Crédito consignado aprovado', 'CCA -Crédito consignado aprovado', 'CCA', 300, 10000, 22, 'Ou até 30% do salário - Não comprova renda');

-- Cliente 

INSERT INTO cliente (nome, cpf, idade, data_nascimento, sexo, email, telefone, profissao, fonte_renda_id, faixa_renda_id, endereco_id) 
VALUES ('Carla Oliveira', '23456789012',34, TO_DATE('1990-02-25', 'YYYY-MM-DD'), 'F', 'carla.oliveira@example.com', '(41) 97654-3210', 'Vendedora', 1,1,1);


INSERT INTO cliente (nome, cpf, idade, data_nascimento, sexo, email, telefone, profissao, fonte_renda_id, faixa_renda_id, endereco_id) 
VALUES ('João da Silva', '12345678901',37, TO_DATE('1985-01-15', 'YYYY-MM-DD'), 'M', 'joao.silva@example.com', '(41) 98765-4321', 'Pintor', 2, 1,2);


INSERT INTO cliente (nome, cpf, idade, data_nascimento, sexo, email, telefone, profissao, fonte_renda_id, faixa_renda_id, endereco_id) 
VALUES ('Paula Santos', '34567890123',36, TO_DATE('1988-03-30', 'YYYY-MM-DD'), 'F', 'paula.santos@example.com', '(41) 96543-2109', 'Zeladora', 1,1,3);

INSERT INTO cliente (nome, cpf, idade, data_nascimento, sexo, email, telefone, profissao, fonte_renda_id, faixa_renda_id, endereco_id) 
VALUES ('Ana Costa', '45678901234',29, TO_DATE('1995-04-10', 'YYYY-MM-DD'), 'F', 'ana.costa@example.com', '(41) 95432-1098', 'Diarista',2,2,4);


INSERT INTO cliente (nome, cpf,idade,  data_nascimento, sexo, email, telefone, profissao, fonte_renda_id, faixa_renda_id, endereco_id) 
VALUES ('Suelem Magalhães', '56789012345', 45, TO_DATE('1979-05-22', 'YYYY-MM-DD'), 'F', 'su.maga@example.com', '(41) 98765-6789', 'Auxiliar de serviços gerais',1,1,5);

INSERT INTO cliente (nome, cpf,idade,  data_nascimento, sexo, email, telefone, profissao, fonte_renda_id, faixa_renda_id, endereco_id) 
VALUES ('Marcelo Fernandes', '67890123456', 41, TO_DATE('1981-06-13', 'YYYY-MM-DD'), 'M', 'marcelo.fernandes@example.com', '(41) 97654-3210','Eletricista', 2,2,6);

INSERT INTO cliente (nome, cpf, idade,  data_nascimento, sexo, email, telefone, profissao, fonte_renda_id, faixa_renda_id, endereco_id) 
VALUES ('Juliana Pereira', '78901234567', 41, TO_DATE('1983-07-08', 'YYYY-MM-DD'), 'F', 'juliana.pereira@example.com', '(41) 96543-2109', 'Vendedora',1,1,7);

INSERT INTO cliente (nome, cpf,idade,  data_nascimento, sexo, email, telefone, profissao, fonte_renda_id, faixa_renda_id, endereco_id) 
VALUES ('André Lima', '89012345678',47, TO_DATE('1977-08-30', 'YYYY-MM-DD'), 'M', 'andre.lima@example.com', '(41) 95432-1098', 'Motoboy',2,1,8);

INSERT INTO cliente (nome, cpf,idade,  data_nascimento, sexo, email, telefone, profissao, fonte_renda_id, faixa_renda_id, endereco_id) 
VALUES ('Tatiane Rocha', '90123456789',44, TO_DATE('1980-09-19', 'YYYY-MM-DD'), 'F', 'tatiane.rocha@example.com', '(41) 94321-0987','Professora Educação Infantil',1,1,9);


-- Novos clientes

INSERT INTO cliente (nome, cpf, idade, data_nascimento, sexo, email, telefone, profissao,fonte_renda_id, faixa_renda_id, endereco_id) VALUES 
('Carlos Silva', '123.456.789-01', 35, TO_DATE('1989-04-15', 'YYYY-MM-DD'), 'M', 'carlos.silva@example.com', '(11) 98765-4321', 'Contador',2,2,10);
INSERT INTO cliente (nome, cpf, idade, data_nascimento, sexo, email, telefone, profissao,fonte_renda_id, faixa_renda_id, endereco_id) VALUES
('João Pereira', '234.567.890-12', 45, TO_DATE('1979-08-10', 'YYYY-MM-DD'), 'M', 'joao.pereira@example.com', '(21) 97654-3210','Técnico de Suporte de T.I.', 1, 2,11);
INSERT INTO cliente (nome, cpf, idade, data_nascimento, sexo, email, telefone, profissao,fonte_renda_id, faixa_renda_id, endereco_id) VALUES
('Paulo Souza', '345.678.901-23', 50, TO_DATE('1974-05-25', 'YYYY-MM-DD'), 'M', 'paulo.souza@example.com', '(31) 96543-2109', 'Professor do Ensino Médio', 1,2,12);

INSERT INTO cliente (nome, cpf, idade, data_nascimento, sexo, email, telefone, profissao,fonte_renda_id, faixa_renda_id, endereco_id) VALUES
('Lucas Alves', '456.789.012-34', 38, TO_DATE('1986-11-20', 'YYYY-MM-DD'), 'M', 'lucas.alves@example.com', '(41) 95432-1098', 'Técnico Administrativo SAMU', 5,2,13);
INSERT INTO cliente (nome, cpf, idade, data_nascimento, sexo, email, telefone, profissao,fonte_renda_id, faixa_renda_id, endereco_id) VALUES
('Rafael Lima', '567.890.123-45', 42, TO_DATE('1982-02-28', 'YYYY-MM-DD'), 'M', 'rafael.lima@example.com', '(51) 94321-0987', 'Gerente de Mercado',1,2,14);
INSERT INTO cliente (nome, cpf, idade, data_nascimento, sexo, email, telefone, profissao,fonte_renda_id, faixa_renda_id, endereco_id) VALUES
('Fernando Costa', '678.901.234-56', 55, TO_DATE('1969-09-15', 'YYYY-MM-DD'), 'M', 'fernando.costa@example.com', '(61) 93210-9876', 'Professor de Ensino Médio',21,2,15);
INSERT INTO cliente (nome, cpf, idade, data_nascimento, sexo, email, telefone, profissao,fonte_renda_id, faixa_renda_id, endereco_id) VALUES
('Marcos Oliveira', '789.012.345-67', 60, TO_DATE('1964-12-05', 'YYYY-MM-DD'), 'M', 'marcos.oliveira@example.com', '(71) 92109-8765', 'Motorista de ônibus', 21, 2,16);
INSERT INTO cliente (nome, cpf, idade, data_nascimento, sexo, email, telefone, profissao,fonte_renda_id, faixa_renda_id, endereco_id) VALUES
('Ricardo Martins', '890.123.456-78', 48, TO_DATE('1976-07-18', 'YYYY-MM-DD'), 'M', 'ricardo.martins@example.com', '(81) 91098-7654', 'Técnico de Segurança do Trabalho',1,2,17);
INSERT INTO cliente (nome, cpf, idade, data_nascimento, sexo, email, telefone, profissao,fonte_renda_id, faixa_renda_id, endereco_id) VALUES
('Ana Fernandes', '901.234.567-89', 34, TO_DATE('1990-03-22', 'YYYY-MM-DD'), 'F', 'ana.fernandes@example.com', '(91) 90987-6543', 'Assistente Adminsitrativo',5,2,18);
INSERT INTO cliente (nome, cpf, idade, data_nascimento, sexo, email, telefone, profissao,fonte_renda_id, faixa_renda_id, endereco_id) VALUES
('Maria Santos', '012.345.678-90', 52, TO_DATE('1972-06-30', 'YYYY-MM-DD'), 'F', 'maria.santos@example.com', '(95) 89876-5432', 'Professora de Educação Básica',21,2,19);


-- Populando a tabela contrato:
--Cliente ID:1
INSERT INTO contrato (valor_emprestimo, numero_parcelas, taxa_juros, data_contratacao, status_contrato, cliente_id, produto_id) 
VALUES (1000,12,1.5,TO_DATE('2023-10-26', 'YYYY-MM-DD'), 'ativo', 1, 4);

--Dados de pagamento:
INSERT INTO pagamento (numero_parcela, valor_parcela, data_vencimento,data_pagamento, contrato_id, status_pagamento)
VALUES (1, 83.33, TO_DATE('2023-11-26', 'YYYY-MM-DD'),TO_DATE('2023-11-06', 'YYYY-MM-DD'), 1, 'Pago');
--
INSERT INTO pagamento (numero_parcela, valor_parcela, data_vencimento,data_pagamento, contrato_id, status_pagamento)
VALUES (2, 83.33, TO_DATE('2023-12-26', 'YYYY-MM-DD'),TO_DATE('2024-01-06', 'YYYY-MM-DD'), 1, 'Pago com atraso');

INSERT INTO pagamento (numero_parcela, valor_parcela, data_vencimento,data_pagamento, contrato_id, status_pagamento)
VALUES (3, 83.33, TO_DATE('2024-01-26', 'YYYY-MM-DD'),TO_DATE('2024-03-05', 'YYYY-MM-DD'), 1, 'Pago com atraso');

INSERT INTO pagamento (numero_parcela, valor_parcela, data_vencimento,data_pagamento, contrato_id, status_pagamento)
VALUES (4, 83.33, TO_DATE('2024-02-26', 'YYYY-MM-DD'),TO_DATE('2024-04-05', 'YYYY-MM-DD'), 1, 'Pago com atraso');

INSERT INTO pagamento (numero_parcela, valor_parcela, data_vencimento,data_pagamento, contrato_id, status_pagamento)
VALUES (5, 83.33, TO_DATE('2024-03-26', 'YYYY-MM-DD'),TO_DATE('2024-05-05', 'YYYY-MM-DD'), 1, 'Pago com atraso');

INSERT INTO pagamento (numero_parcela, valor_parcela, data_vencimento,data_pagamento, contrato_id, status_pagamento)
VALUES (6, 83.33, TO_DATE('2024-04-26', 'YYYY-MM-DD'),TO_DATE('2024-06-05', 'YYYY-MM-DD'), 1, 'Pago com atraso');

INSERT INTO pagamento (numero_parcela, valor_parcela, data_vencimento,data_pagamento, contrato_id, status_pagamento)
VALUES (7, 83.33, TO_DATE('2024-05-26', 'YYYY-MM-DD'),NULL, 1, NUll);

INSERT INTO pagamento (numero_parcela, valor_parcela, data_vencimento,data_pagamento, contrato_id, status_pagamento)
VALUES (8, 83.33, TO_DATE('2024-06-26', 'YYYY-MM-DD'),NULL, 1, NUll);

INSERT INTO pagamento (numero_parcela, valor_parcela, data_vencimento,data_pagamento, contrato_id, status_pagamento)
VALUES (9, 83.33, TO_DATE('2024-07-26', 'YYYY-MM-DD'), NULL, 1, NUll);

INSERT INTO pagamento (numero_parcela, valor_parcela, data_vencimento,data_pagamento, contrato_id, status_pagamento)
VALUES (10, 83.33, TO_DATE('2024-08-26', 'YYYY-MM-DD'), NULL, 1, NUll);

INSERT INTO pagamento (numero_parcela, valor_parcela, data_vencimento,data_pagamento, contrato_id, status_pagamento)
VALUES (11, 83.33, TO_DATE('2024-09-26', 'YYYY-MM-DD'), NULL, 1, NUll);

INSERT INTO pagamento (numero_parcela, valor_parcela, data_vencimento,data_pagamento, contrato_id, status_pagamento)
VALUES (12, 83.33, TO_DATE('2024-10-26', 'YYYY-MM-DD'),NULL, 1, NUll);

--Contrato 
--idcliente 35 / idcontrato = 66
INSERT INTO contrato (valor_emprestimo, numero_parcelas, taxa_juros, data_contratacao, status_contrato, cliente_id, produto_id) 
VALUES (2200, 12, 1.5, TO_DATE('2022-06-05', 'YYYY-MM-DD'), 'Encerrado', 35, 4);

--idcliente 36 / idcontrato =67

INSERT INTO contrato (valor_emprestimo, numero_parcelas, taxa_juros, data_contratacao, status_contrato, cliente_id, produto_id) 
VALUES (5000, 20, 1.5, TO_DATE('2021-12-05', 'YYYY-MM-DD'), 'Encerrado', 36, 5);

--idcliente 37 / idcontrato =68

INSERT INTO contrato (valor_emprestimo, numero_parcelas, taxa_juros, data_contratacao, status_contrato, cliente_id, produto_id) 
VALUES (5000, 20, 1.5, TO_DATE('2022-03-05', 'YYYY-MM-DD'), 'Encerrado', 37, 5);

-- idcliente 38 / idcontrato = 69

INSERT INTO contrato (valor_emprestimo, numero_parcelas, taxa_juros, data_contratacao, status_contrato, cliente_id, produto_id) 
VALUES (5000, 20, 1.5, TO_DATE('2020-03-05', 'YYYY-MM-DD'), 'Encerrado', 38, 5);

--idcliente 39 / idcontrato = 
INSERT INTO contrato (valor_emprestimo, numero_parcelas, taxa_juros, data_contratacao, status_contrato, cliente_id, produto_id) 
VALUES (5000, 20, 1.5, TO_DATE('2021-11-05', 'YYYY-MM-DD'), 'Encerrado', 39, 6);
 -- idcliente 40 / idcontrato = 
INSERT INTO contrato (valor_emprestimo, numero_parcelas, taxa_juros, data_contratacao, status_contrato, cliente_id, produto_id) 
VALUES (10000, 20, 1.5, TO_DATE('2020-11-15', 'YYYY-MM-DD'), 'Encerrado', 40, 6);
