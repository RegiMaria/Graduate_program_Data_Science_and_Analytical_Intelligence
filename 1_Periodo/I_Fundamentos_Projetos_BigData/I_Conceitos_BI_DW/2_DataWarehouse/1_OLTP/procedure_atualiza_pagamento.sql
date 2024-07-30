
CREATE OR REPLACE PROCEDURE atualizar_pagamento(
    p_idpagamento IN NUMBER
) AS
    v_dias_atraso NUMBER;
    v_juros_mora NUMBER(10, 2);
    v_multa_atraso NUMBER(10, 2);
    v_valor_final NUMBER(10, 2);
    v_valor_parcela NUMBER(10, 2);
    v_taxa_juros NUMBER(5, 2);
    v_data_vencimento DATE;
    v_data_pagamento DATE;
BEGIN
    -- dados da parcela:
    SELECT p.valor_parcela, p.data_vencimento, p.data_pagamento, c.taxa_juros
    INTO v_valor_parcela, v_data_vencimento, v_data_pagamento, v_taxa_juros
    FROM pagamento p
    JOIN contrato c ON p.contrato_id = c.idcontrato
    WHERE p.idpagamento = p_idpagamento;
       
    IF v_data_pagamento IS NULL THEN
        v_data_pagamento := SYSDATE;
    END IF;

    -- número de dias de atraso
    v_dias_atraso := GREATEST(TRUNC(v_data_pagamento) - TRUNC(v_data_vencimento), 0);
    
    -- juros de mora e multa
    IF v_dias_atraso > 0 THEN
        v_juros_mora := v_dias_atraso * 0.005 * v_valor_parcela; -- 0.5% ao dia
        v_multa_atraso := v_valor_parcela * 0.02; -- 2%
    ELSE
        v_juros_mora := 0;
        v_multa_atraso := 0;
    END IF;
    
    -- Calcular:valor final
    v_valor_final := v_valor_parcela + v_juros_mora + v_multa_atraso;
    
    -- Atualizar a tabela de pagamento
    UPDATE pagamento
    SET dias_atraso = v_dias_atraso,
        juros_mora = v_juros_mora,
        multa_atraso = v_multa_atraso,
        valor_final = v_valor_final,
        data_pagamento = v_data_pagamento,
        status_pagamento = CASE
            WHEN v_data_pagamento <= v_data_vencimento THEN 'Pago'
            ELSE 'Pago com atraso'
        END
    WHERE idpagamento = p_idpagamento;
END;
/

--Obs: trigger: trg_atualizar_pagamento