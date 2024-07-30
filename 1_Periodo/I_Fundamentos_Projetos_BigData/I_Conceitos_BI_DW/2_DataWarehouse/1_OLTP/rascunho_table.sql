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
