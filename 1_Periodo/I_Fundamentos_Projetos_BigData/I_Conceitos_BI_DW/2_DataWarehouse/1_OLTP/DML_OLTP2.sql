SELECT *
FROM pagamento
WHERE contrato_id = 45; 

UPDATE contrato
SET produto_id = 2
WHERE idcontrato = 47;

UPDATE pagamento
SET data_vencimento = TO_DATE('2024-12-15', 'YYYY-MM-DD')
WHERE idpagamento = 117;

UPDATE pagamento
SET data_pagamento = NULL
WHERE idpagamento = 123;

UPDATE pagamento
SET data_vencimento = TO_DATE('2025-07-05', 'YYYY-MM-DD')
WHERE idpagamento = 123;


UPDATE pagamento
SET status_pagamento = 'Pago com atraso'
WHERE numero_parcela = 9 AND contrato_id = 41;

/*DELETE FROM pagamento
WHERE contrato_id IN (
    SELECT idcontrato
    FROM contrato
    WHERE cliente_id = 3
);*/
DESCRIBE pagamento;