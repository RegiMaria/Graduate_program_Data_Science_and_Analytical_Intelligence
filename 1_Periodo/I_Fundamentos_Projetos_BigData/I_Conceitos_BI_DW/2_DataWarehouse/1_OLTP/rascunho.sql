-Bloco PL/SQL pra inserção de pagamentos
-- Inserir contrato cliente_id = 31 / idcontrato = 49
INSERT INTO contrato (valor_emprestimo, numero_parcelas, taxa_juros, data_contratacao, status_contrato, cliente_id, produto_id) 
VALUES (5000, 20, 1.5, TO_DATE('2022-06-05', 'YYYY-MM-DD'), 'Encerrado', 31, 5);

-- Inserir pagamentos
DECLARE
    v_parcela NUMBER := 1;
    v_valor NUMBER := 291.23; -- Valor da parcela calculado separadamente
    v_data_venc DATE := TO_DATE('2022-07-10', 'YYYY-MM-DD');
BEGIN
    FOR i IN 1..20 LOOP
        INSERT INTO pagamento (numero_parcela, valor_parcela, data_vencimento, data_pagamento, contrato_id, status_pagamento)
        VALUES (v_parcela, v_valor, v_data_venc, v_data_venc, 49, 'Pago');
        v_parcela := v_parcela + 1;
        v_data_venc := ADD_MONTHS(v_data_venc, 1);
    END LOOP;
END;
/
---------------------------
 -- idcontrato = 50
 -- cliente_id = 32
 
 -- Inserir contrato cliente_id = 31 / idcontrato = 49
INSERT INTO contrato (valor_emprestimo, numero_parcelas, taxa_juros, data_contratacao, status_contrato, cliente_id, produto_id) 
VALUES (2500, 12, 1.5, TO_DATE('2022-01-05', 'YYYY-MM-DD'), 'Encerrado', 32, 5);

-- Inserir pagamentos
DECLARE
    v_parcela NUMBER := 1;
    v_valor NUMBER := 288.66; -- Valor da parcela calculado
    v_data_venc DATE := TO_DATE('2022-07-10', 'YYYY-MM-DD');
BEGIN
    FOR i IN 1..12 LOOP
        INSERT INTO pagamento (numero_parcela, valor_parcela, data_vencimento, data_pagamento, contrato_id, status_pagamento)
        VALUES (v_parcela, v_valor, v_data_venc, v_data_venc, 50, 'Pago');  --escolher o status do pagamento (Pago, Pago com atraso, Em aberto)
        v_parcela := v_parcela + 1;
        v_data_venc := ADD_MONTHS(v_data_venc, 1);
    END LOOP;
END;
/

 -- Inserir contrato cliente_id = 34 / idcontrato = 62
INSERT INTO contrato (valor_emprestimo, numero_parcelas, taxa_juros, data_contratacao, status_contrato, cliente_id, produto_id) 
VALUES (5000, 20, 1.5, TO_DATE('2022-01-05', 'YYYY-MM-DD'), 'Encerrado', 34, 5);

--Inserindo dados de pagamento:
DECLARE
    v_parcela NUMBER := 1;
    v_valor NUMBER := 581.40; 
    v_data_venc DATE := TO_DATE('2020-11-15', 'YYYY-MM-DD');
BEGIN
    FOR i IN 1..20 LOOP
        INSERT INTO pagamento (numero_parcela, valor_parcela, data_vencimento, data_pagamento, contrato_id, status_pagamento)
        VALUES (v_parcela, v_valor, v_data_venc, v_data_venc, 71, 'Pago');
        v_parcela := v_parcela + 1;
        v_data_venc := ADD_MONTHS(v_data_venc, 1);
    END LOOP;
END;
/



--Populando contrato id = 21:
 --cliente ID 2:
INSERT INTO contrato (valor_emprestimo, numero_parcelas, taxa_juros, data_contratacao, status_contrato, cliente_id, produto_id) 
VALUES (1200,12,1.5,TO_DATE('2023-01-10', 'YYYY-MM-DD'), 'encerrado', 2, 4);

--Populando tabela pagamento cliente ID 2:

INSERT INTO pagamento (numero_parcela, valor_parcela, data_vencimento,data_pagamento, contrato_id, status_pagamento)
VALUES (1, 119.56, TO_DATE('2023-02-10', 'YYYY-MM-DD'),TO_DATE('2023-03-05', 'YYYY-MM-DD'), 21, 'Pago com atraso');

INSERT INTO pagamento (numero_parcela, valor_parcela, data_vencimento,data_pagamento, contrato_id, status_pagamento)
VALUES (2, 119.56, TO_DATE('2023-03-10', 'YYYY-MM-DD'),TO_DATE('2023-04-05', 'YYYY-MM-DD'), 21, 'Pago com atraso');

INSERT INTO pagamento (numero_parcela, valor_parcela, data_vencimento,data_pagamento, contrato_id, status_pagamento)
VALUES (3, 119.56, TO_DATE('2023-04-10', 'YYYY-MM-DD'),TO_DATE('2023-05-08', 'YYYY-MM-DD'), 21, 'Pago com atraso');

INSERT INTO pagamento (numero_parcela, valor_parcela, data_vencimento,data_pagamento, contrato_id, status_pagamento)
VALUES (4, 119.56, TO_DATE('2023-05-10', 'YYYY-MM-DD'),TO_DATE('2023-06-10', 'YYYY-MM-DD'), 21, 'Pago com atraso');

INSERT INTO pagamento (numero_parcela, valor_parcela, data_vencimento,data_pagamento, contrato_id, status_pagamento)
VALUES (5, 119.56, TO_DATE('2023-06-10', 'YYYY-MM-DD'),TO_DATE('2023-07-05', 'YYYY-MM-DD'), 21, 'Pago com atraso');

INSERT INTO pagamento (numero_parcela, valor_parcela, data_vencimento,data_pagamento, contrato_id, status_pagamento)
VALUES (6, 119.56, TO_DATE('2023-07-10', 'YYYY-MM-DD'),TO_DATE('2023-07-05', 'YYYY-MM-DD'), 21, 'Pago');

INSERT INTO pagamento (numero_parcela, valor_parcela, data_vencimento,data_pagamento, contrato_id, status_pagamento)
VALUES (7, 119.56, TO_DATE('2023-08-10', 'YYYY-MM-DD'),TO_DATE('2023-08-10', 'YYYY-MM-DD'), 21, 'Pago');

INSERT INTO pagamento (numero_parcela, valor_parcela, data_vencimento,data_pagamento, contrato_id, status_pagamento)
VALUES (8, 119.56, TO_DATE('2023-09-10', 'YYYY-MM-DD'),TO_DATE('2023-09-05', 'YYYY-MM-DD'), 21, 'Pago');

INSERT INTO pagamento (numero_parcela, valor_parcela, data_vencimento,data_pagamento, contrato_id, status_pagamento)
VALUES (9, 119.56, TO_DATE('2023-10-10', 'YYYY-MM-DD'),TO_DATE('2023-10-06', 'YYYY-MM-DD'), 21, 'Pago');

INSERT INTO pagamento (numero_parcela, valor_parcela, data_vencimento,data_pagamento, contrato_id, status_pagamento)
VALUES (10, 119.56, TO_DATE('2023-11-10', 'YYYY-MM-DD'),TO_DATE('2023-11-06', 'YYYY-MM-DD'), 21, 'Pago');

INSERT INTO pagamento (numero_parcela, valor_parcela, data_vencimento,data_pagamento, contrato_id, status_pagamento)
VALUES (11, 119.56, TO_DATE('2023-12-10', 'YYYY-MM-DD'),TO_DATE('2023-12-10', 'YYYY-MM-DD'), 21, 'Pago');

INSERT INTO pagamento (numero_parcela, valor_parcela, data_vencimento,data_pagamento, contrato_id, status_pagamento)
VALUES (12, 119.56, TO_DATE('2023-01-10', 'YYYY-MM-DD'),TO_DATE('2023-02-06', 'YYYY-MM-DD'), 21, 'Pago com atraso');


--Populando tabela contrato ID = 43 cliente ID=6
INSERT INTO contrato (valor_emprestimo, numero_parcelas, taxa_juros, data_contratacao, status_contrato, cliente_id, produto_id) 
VALUES (2000,12,1.5,TO_DATE('2023-03-18', 'YYYY-MM-DD'), 'encerrado', 3, 4);

--Populando tabela pagamento cliente id=3
--
INSERT INTO pagamento (numero_parcela, valor_parcela, data_vencimento,data_pagamento, contrato_id, status_pagamento)
VALUES (1, 183.36, TO_DATE('2023-04-18', 'YYYY-MM-DD'),TO_DATE('2023-04-06', 'YYYY-MM-DD'), 41, 'Pago');

INSERT INTO pagamento (numero_parcela, valor_parcela, data_vencimento,data_pagamento, contrato_id, status_pagamento)
VALUES (2, 183.36, TO_DATE('2023-05-18', 'YYYY-MM-DD'),TO_DATE('2023-05-08', 'YYYY-MM-DD'), 41, 'Pago');

INSERT INTO pagamento (numero_parcela, valor_parcela, data_vencimento,data_pagamento, contrato_id, status_pagamento)
VALUES (3, 183.36, TO_DATE('2023-06-18', 'YYYY-MM-DD'),TO_DATE('2023-06-06', 'YYYY-MM-DD'), 41, 'Pago');

INSERT INTO pagamento (numero_parcela, valor_parcela, data_vencimento,data_pagamento, contrato_id, status_pagamento)
VALUES (4, 183.36, TO_DATE('2023-07-18', 'YYYY-MM-DD'),TO_DATE('2023-07-08', 'YYYY-MM-DD'), 41, 'Pago');

INSERT INTO pagamento (numero_parcela, valor_parcela, data_vencimento,data_pagamento, contrato_id, status_pagamento)
VALUES (5, 183.36, TO_DATE('2023-08-18', 'YYYY-MM-DD'),TO_DATE('2023-08-10', 'YYYY-MM-DD'), 41, 'Pago');

INSERT INTO pagamento (numero_parcela, valor_parcela, data_vencimento,data_pagamento, contrato_id, status_pagamento)
VALUES (6, 183.36, TO_DATE('2023-09-18', 'YYYY-MM-DD'),TO_DATE('2023-09-10', 'YYYY-MM-DD'), 41, 'Pago');

INSERT INTO pagamento (numero_parcela, valor_parcela, data_vencimento,data_pagamento, contrato_id, status_pagamento)
VALUES (7, 183.36, TO_DATE('2023-10-18', 'YYYY-MM-DD'),TO_DATE('2023-10-06', 'YYYY-MM-DD'), 41, 'Pago');

INSERT INTO pagamento (numero_parcela, valor_parcela, data_vencimento,data_pagamento, contrato_id, status_pagamento)
VALUES (8, 183.36, TO_DATE('2023-11-18', 'YYYY-MM-DD'),TO_DATE('2023-11-10', 'YYYY-MM-DD'), 41, 'Pago');

INSERT INTO pagamento (numero_parcela, valor_parcela, data_vencimento,data_pagamento, contrato_id, status_pagamento)
VALUES (9, 183.36, TO_DATE('2023-12-18', 'YYYY-MM-DD'),TO_DATE('2024-01-10', 'YYYY-MM-DD'), 41, 'Pago com atraso');

INSERT INTO pagamento (numero_parcela, valor_parcela, data_vencimento,data_pagamento, contrato_id, status_pagamento)
VALUES (10, 183.36, TO_DATE('2024-01-18', 'YYYY-MM-DD'),TO_DATE('2024-02-10', 'YYYY-MM-DD'), 41, 'Pago com atraso');

INSERT INTO pagamento (numero_parcela, valor_parcela, data_vencimento,data_pagamento, contrato_id, status_pagamento)
VALUES (11, 183.36, TO_DATE('2024-02-18', 'YYYY-MM-DD'),TO_DATE('2024-03-10', 'YYYY-MM-DD'), 41, 'Pago com atraso');

INSERT INTO pagamento (numero_parcela, valor_parcela, data_vencimento,data_pagamento, contrato_id, status_pagamento)
VALUES (12, 183.36, TO_DATE('2024-03-18', 'YYYY-MM-DD'),TO_DATE('2024-04-06', 'YYYY-MM-DD'), 41, 'Pago com atraso');


-- Populando cliente_id = 7
--Contrato id = 46

INSERT INTO contrato (valor_emprestimo, numero_parcelas, taxa_juros, data_contratacao, status_contrato, cliente_id, produto_id) 
VALUES (1400,12,1.5,TO_DATE('2023-12-05', 'YYYY-MM-DD'), 'Ativo', 7, 4);

 -- Populando tabela pagamento: 
 
INSERT INTO pagamento (numero_parcela, valor_parcela, data_vencimento,data_pagamento, contrato_id, status_pagamento)
VALUES (1, 132.72, TO_DATE('2024-01-05', 'YYYY-MM-DD'),TO_DATE('2024-01-10', 'YYYY-MM-DD'), 45, 'Pago com atraso');

INSERT INTO pagamento (numero_parcela, valor_parcela, data_vencimento,data_pagamento, contrato_id, status_pagamento)
VALUES (2, 183.36, TO_DATE('2024-02-05', 'YYYY-MM-DD'),TO_DATE('2024-02-05', 'YYYY-MM-DD'), 45, 'Pago');

INSERT INTO pagamento (numero_parcela, valor_parcela, data_vencimento,data_pagamento, contrato_id, status_pagamento)
VALUES (3, 183.36, TO_DATE('2024-03-05', 'YYYY-MM-DD'),TO_DATE('2024-03-05', 'YYYY-MM-DD'), 45, 'Pago');

INSERT INTO pagamento (numero_parcela, valor_parcela, data_vencimento,data_pagamento, contrato_id, status_pagamento)
VALUES (4, 183.36, TO_DATE('2024-04-05', 'YYYY-MM-DD'),TO_DATE('2024-04-05', 'YYYY-MM-DD'), 45, 'Pago');

INSERT INTO pagamento (numero_parcela, valor_parcela, data_vencimento,data_pagamento, contrato_id, status_pagamento)
VALUES (5, 183.36, TO_DATE('2024-05-05', 'YYYY-MM-DD'),TO_DATE('2024-06-05', 'YYYY-MM-DD'), 45, 'Pago');

INSERT INTO pagamento (numero_parcela, valor_parcela, data_vencimento,data_pagamento, contrato_id, status_pagamento)
VALUES (6, 183.36, TO_DATE('2024-06-05', 'YYYY-MM-DD'),TO_DATE('2024-07-05', 'YYYY-MM-DD'), 45, 'Pago');

INSERT INTO pagamento (numero_parcela, valor_parcela, data_vencimento,data_pagamento, contrato_id, status_pagamento)
VALUES (7, 183.36, TO_DATE('2024-07-05', 'YYYY-MM-DD'),TO_DATE('2024-07-05', 'YYYY-MM-DD'), 45, 'Pago');

INSERT INTO pagamento (numero_parcela, valor_parcela, data_vencimento,data_pagamento, contrato_id, status_pagamento)
VALUES (8, 183.36, TO_DATE('2024-08-05', 'YYYY-MM-DD'),NULL, 45, NULL);

INSERT INTO pagamento (numero_parcela, valor_parcela, data_vencimento,data_pagamento, contrato_id, status_pagamento)
VALUES (9, 183.36, TO_DATE('2024-09-05', 'YYYY-MM-DD'),NULL, 45, NULL);

INSERT INTO pagamento (numero_parcela, valor_parcela, data_vencimento,data_pagamento, contrato_id, status_pagamento)
VALUES (10, 183.36, TO_DATE('2024-10-05', 'YYYY-MM-DD'),NULL, 45, NULL);

INSERT INTO pagamento (numero_parcela, valor_parcela, data_vencimento,data_pagamento, contrato_id, status_pagamento)
VALUES (11, 183.36, TO_DATE('2024-11-05', 'YYYY-MM-DD'),NULL, 45, NULL);

INSERT INTO pagamento (numero_parcela, valor_parcela, data_vencimento,data_pagamento, contrato_id, status_pagamento)
VALUES (12, 183.36, TO_DATE('2024-12-05', 'YYYY-MM-DD'),NULL, 45, NULL);

-- Contrato idcliente = 8
--idcontrato = 46

INSERT INTO contrato (valor_emprestimo, numero_parcelas, taxa_juros, data_contratacao, status_contrato, cliente_id, produto_id) 
VALUES (2000,6,1.5,TO_DATE('2023-07-28', 'YYYY-MM-DD'), 'Encerrado', 8, 4);

--populando tabela pagamentp:
INSERT INTO pagamento (numero_parcela, valor_parcela, data_vencimento,data_pagamento, contrato_id, status_pagamento)
VALUES (1, 351.05, TO_DATE('2023-08-28', 'YYYY-MM-DD'),TO_DATE('2023-09-05', 'YYYY-MM-DD'), 46, 'Pago com atraso');

INSERT INTO pagamento (numero_parcela, valor_parcela, data_vencimento,data_pagamento, contrato_id, status_pagamento)
VALUES (2, 351.05, TO_DATE('2023-09-28', 'YYYY-MM-DD'),TO_DATE('2023-10-05', 'YYYY-MM-DD'), 46, 'Pago com atraso');

INSERT INTO pagamento (numero_parcela, valor_parcela, data_vencimento,data_pagamento, contrato_id, status_pagamento)
VALUES (3, 351.05, TO_DATE('2023-10-28', 'YYYY-MM-DD'),TO_DATE('2023-11-05', 'YYYY-MM-DD'), 46, 'Pago com atraso');

INSERT INTO pagamento (numero_parcela, valor_parcela, data_vencimento,data_pagamento, contrato_id, status_pagamento)
VALUES (4, 351.05, TO_DATE('2023-11-28', 'YYYY-MM-DD'),TO_DATE('2023-12-08', 'YYYY-MM-DD'), 46, 'Pago com atraso');

INSERT INTO pagamento (numero_parcela, valor_parcela, data_vencimento,data_pagamento, contrato_id, status_pagamento)
VALUES (5, 351.05, TO_DATE('2023-12-28', 'YYYY-MM-DD'),TO_DATE('2024-01-18', 'YYYY-MM-DD'), 46, 'Pago com atraso');

INSERT INTO pagamento (numero_parcela, valor_parcela, data_vencimento,data_pagamento, contrato_id, status_pagamento)
VALUES (6, 351.05, TO_DATE('2024-01-28', 'YYYY-MM-DD'),TO_DATE('2024-03-08', 'YYYY-MM-DD'), 46, 'Pago com atraso');


--Contrato cliente_id= 9
--Contrato_id = 47

--Tabela contrato:
INSERT INTO contrato (valor_emprestimo, numero_parcelas, taxa_juros, data_contratacao, status_contrato, cliente_id, produto_id) 
VALUES (2000,6,1.5,TO_DATE('2023-07-20', 'YYYY-MM-DD'), 'Encerrado', 9, 2);

--populando tabela pagamentp:
INSERT INTO pagamento (numero_parcela, valor_parcela, data_vencimento,data_pagamento, contrato_id, status_pagamento)
VALUES (1, 351.05, TO_DATE('2023-08-20', 'YYYY-MM-DD'),TO_DATE('2023-08-05', 'YYYY-MM-DD'), 47, 'Pago');

INSERT INTO pagamento (numero_parcela, valor_parcela, data_vencimento,data_pagamento, contrato_id, status_pagamento)
VALUES (2, 351.05, TO_DATE('2023-09-20', 'YYYY-MM-DD'),TO_DATE('2023-09-05', 'YYYY-MM-DD'), 47, 'Pago');

INSERT INTO pagamento (numero_parcela, valor_parcela, data_vencimento,data_pagamento, contrato_id, status_pagamento)
VALUES (3, 351.05, TO_DATE('2023-10-20', 'YYYY-MM-DD'),TO_DATE('2023-10-05', 'YYYY-MM-DD'), 47, 'Pago');

INSERT INTO pagamento (numero_parcela, valor_parcela, data_vencimento,data_pagamento, contrato_id, status_pagamento)
VALUES (4, 351.05, TO_DATE('2023-11-20', 'YYYY-MM-DD'),TO_DATE('2023-11-05', 'YYYY-MM-DD'), 47, 'Pago');

INSERT INTO pagamento (numero_parcela, valor_parcela, data_vencimento,data_pagamento, contrato_id, status_pagamento)
VALUES (5, 351.05, TO_DATE('2023-12-20', 'YYYY-MM-DD'),TO_DATE('2023-12-05', 'YYYY-MM-DD'), 47, 'Pago');

INSERT INTO pagamento (numero_parcela, valor_parcela, data_vencimento,data_pagamento, contrato_id, status_pagamento)
VALUES (6, 351.05, TO_DATE('2024-01-20', 'YYYY-MM-DD'),TO_DATE('2024-01-08', 'YYYY-MM-DD'), 47, 'Pago');



-












