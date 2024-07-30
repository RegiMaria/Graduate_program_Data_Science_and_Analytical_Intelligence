-- populando tabela pagamento com BLOCO PL/SQL
-- Observar a parcela é calculada separadamente
-- O status do contrato deve mudar
DECLARE
    v_parcela NUMBER := 1;
    v_valor NUMBER := 291.23; -- Troca o valor
    v_data_venc DATE := TO_DATE('2022-07-10', 'YYYY-MM-DD');
BEGIN
    FOR i IN 1..20 LOOP --Verificar a quantidade de parcelas q o cliente parcelou
        INSERT INTO pagamento (numero_parcela, valor_parcela, data_vencimento, data_pagamento, contrato_id, status_pagamento)
        VALUES (v_parcela, v_valor, v_data_venc, v_data_venc, 49, 'Pago');  --escolher o status do pagamento (Pago, Pago com atraso, Em aberto)
        v_parcela := v_parcela + 1;
        v_data_venc := ADD_MONTHS(v_data_venc, 1);
    END LOOP;
END;
/

-- Inserir contrato para o idcliente = 33
-- idcontrato = 61
INSERT INTO contrato (valor_emprestimo, numero_parcelas, taxa_juros, data_contratacao, status_contrato, cliente_id, produto_id) 
VALUES (5000, 20, 1.5, TO_DATE('2021-12-05', 'YYYY-MM-DD'), 'Encerrado', 33, 5);

-- populando tabela pagamento
DECLARE
    v_parcela NUMBER := 1;
    v_valor NUMBER := 291.23; 
    v_data_venc DATE := TO_DATE('2021-12-05', 'YYYY-MM-DD');
BEGIN
    FOR i IN 1..20 LOOP
        INSERT INTO pagamento (numero_parcela, valor_parcela, data_vencimento, data_pagamento, contrato_id, status_pagamento)
        VALUES (v_parcela, v_valor, v_data_venc, v_data_venc, 61, 'Pago');
        v_parcela := v_parcela + 1;
        v_data_venc := ADD_MONTHS(v_data_venc, 1);
    END LOOP;
END;
/

