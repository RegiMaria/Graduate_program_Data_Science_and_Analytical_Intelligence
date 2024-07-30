-- Consultas:
--Cliente id= 1
--Som das Parcelas pagas com atraso R$ 578,75
SELECT SUM(valor_final) AS soma_parcelas_pagas
FROM pagamento
WHERE contrato_id = 1
AND status_pagamento IN ('Pago', 'Pago com atraso');

-- Soma das parcelas em valor original R$ 499,99

SELECT SUM(valor_parcela) AS soma_parcelas_original
FROM pagamento
WHERE contrato_id = 1
AND status_pagamento IN ('Pago', 'Pago com atraso');

-- Diferença -Quanto a cliente ID 1 pagou a mais:
SELECT
    (SELECT SUM(valor_final)
     FROM pagamento
     WHERE contrato_id = 1
       AND status_pagamento IN ('Pago', 'Pago com atraso')) -
    
    (SELECT SUM(valor_parcela)
     FROM pagamento
     WHERE contrato_id = 1
       AND status_pagamento IN ('Pago', 'Pago com atraso')) AS diferenca
FROM dual;


-- Parcelas em atraso e em aberto:
SELECT numero_parcela, valor_parcela, valor_final, status_pagamento
FROM pagamento
WHERE contrato_id = 1
AND status_pagamento IN ('Atrasado', 'Em aberto');

-- Somando os valores atrasados + valores em aberto = R$ 541,24
SELECT
    (SELECT SUM(valor_final)
     FROM pagamento
     WHERE contrato_id = 1
       AND status_pagamento IN ('Atrasado')) +
    
    (SELECT SUM(valor_parcela)
     FROM pagamento
     WHERE contrato_id = 1
       AND status_pagamento IN ('Em aberto')) AS sum
FROM dual;


-- Total das parcelas:
SELECT SUM(valor_parcela) AS total_valor_parcelas
FROM pagamento
WHERE contrato_id = 1; 

-- de todas as parcelas q já foram pagas:

SELECT SUM(valor_final) AS total_valor_parcelas_pagas
FROM pagamento
WHERE status_pagamento IN ('Pago', 'Pago com atraso')
AND contrato_id = 1; 




-- Vsualizando os dados atualizados e realizando alterações
SELECT * FROM cliente;
SELECT * FROM produto;
SELECT * FROM contrato;
SELECT * FROM pagamento;
SELECT * FROM fonte_renda;
SELECT * FROM faixa_renda;

SELECT * FROM pagamento
WHERE contrato_id = 71; 

DELETE FROM pagamento
WHERE idpagamento =
131;

DELETE FROM contrato
WHERE idcontrato IN (64, 62);

DELETE FROM pagamento
WHERE contrato_id IN (64, 62);

DELETE FROM contrato
where idcontrato = 62;

DELETE FROM pagamento
WHERE idpagamento BETWEEN 20 AND 40;

UPDATE pagamento
SET data_pagamento = NULL
WHERE idpagamento = 124;

UPDATE contrato
SET produto_id = 6
WHERE idcontrato = 62;

UPDATE contrato
SET produto_id = 6
WHERE idcontrato = 67;

UPDATE pagamento
SET data_vencimento = TO_DATE('2025-08-05', 'YYYY-MM-DD')
WHERE idpagamento = 124;

DESCRIBE pagamento;
