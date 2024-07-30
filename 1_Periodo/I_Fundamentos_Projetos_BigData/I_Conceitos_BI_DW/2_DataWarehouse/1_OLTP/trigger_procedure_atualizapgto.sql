CREATE OR REPLACE TRIGGER trg_atualizar_pagamento
BEFORE INSERT OR UPDATE ON pagamento
FOR EACH ROW
DECLARE
    v_dias_atraso NUMBER;
    v_juros_mora NUMBER(10, 2);
    v_multa_atraso NUMBER(10, 2);
    v_valor_final NUMBER(10, 2);
    v_valor_parcela NUMBER(10, 2);
    v_data_vencimento DATE;
    v_data_pagamento DATE;
BEGIN
    -- valor das colunas da nova linha
    v_valor_parcela := :NEW.valor_parcela;
    v_data_vencimento := :NEW.data_vencimento;
    v_data_pagamento := :NEW.data_pagamento;

    -- Atualizaçao:
    IF v_data_pagamento IS NULL THEN
        IF TRUNC(SYSDATE) > TRUNC(v_data_vencimento) THEN
                                                           -- Atrasado: se a data atual é maior que a data de vencimento
            :NEW.status_pagamento := 'Atrasado';
            :NEW.dias_atraso := TRUNC(SYSDATE) - TRUNC(v_data_vencimento);
            :NEW.juros_mora := :NEW.dias_atraso * 0.005 * v_valor_parcela; -- 0.5% ao dia
            :NEW.multa_atraso := v_valor_parcela * 0.02; -- 2%
            :NEW.valor_final := v_valor_parcela + :NEW.juros_mora + :NEW.multa_atraso;
        ELSE
                                                             -- Em aberto se a data atual é menor ou igual à data de vencimento
            :NEW.status_pagamento := 'Em aberto';
            :NEW.dias_atraso := NULL;
            :NEW.juros_mora := NULL;
            :NEW.multa_atraso := NULL;
            :NEW.valor_final := NULL;
        END IF;
    ELSE
        IF v_data_pagamento <= v_data_vencimento THEN
                                                             -- Pago se a data de pagamento é menor ou igual à data de vencimento
            :NEW.status_pagamento := 'Pago';
            :NEW.dias_atraso := NULL;
            :NEW.juros_mora := NULL;
            :NEW.multa_atraso := NULL;
            :NEW.valor_final := v_valor_parcela;
        ELSE
                                                            -- Pago com atraso se a data de pagamento é maior que a data de vencimento
            :NEW.status_pagamento := 'Pago com atraso';
            :NEW.dias_atraso := TRUNC(v_data_pagamento) - TRUNC(v_data_vencimento);
            :NEW.juros_mora := :NEW.dias_atraso * 0.005 * v_valor_parcela; -- 0.5% ao dia
            :NEW.multa_atraso := v_valor_parcela * 0.02; -- 2%
            :NEW.valor_final := v_valor_parcela + :NEW.juros_mora + :NEW.multa_atraso;
        END IF;
    END IF;
END;
/