SELECT 
    c.fonte_renda_id, 
    fr.descricao AS fonte_renda,
    COUNT(*) AS quantidade_clientes
FROM 
    cliente c
JOIN 
    fonte_renda fr ON c.fonte_renda_id = fr.idfonte_renda
WHERE 
    c.idade BETWEEN 30 AND 45
GROUP BY 
    c.fonte_renda_id, fr.descricao
ORDER BY 
    quantidade_clientes DESC;


--populando dimTempo:
INSERT INTO DimTempo (DATA, ANO, TRIMESTRE, MES, DIA, DIA_SEMANA, NOME_MES)
SELECT
    p.data_vencimento AS DATA,
    EXTRACT(YEAR FROM p.data_vencimento) AS ANO,
    TO_NUMBER(TO_CHAR(p.data_vencimento, 'Q')) AS TRIMESTRE,
    EXTRACT(MONTH FROM p.data_vencimento) AS MES,
    EXTRACT(DAY FROM p.data_vencimento) AS DIA,
    TO_NUMBER(TO_CHAR(p.data_vencimento, 'D')) AS DIA_SEMANA,
    TO_CHAR(p.data_vencimento, 'Month') AS NOME_MES 
FROM (
    SELECT DISTINCT
        data_vencimento
    FROM DimPagamento
    WHERE status_pagamento = 'Pago com atraso'
) p;



SELECT 
    c.idcliente,
    c.nome,
    c.cpf,
    c.email,
    c.telefone,
    COUNT(p.idpagamento) AS total_pagamentos_atrasados
FROM 
    cliente c
JOIN 
    contrato co ON c.idcliente = co.cliente_id
JOIN 
    pagamento p ON co.idcontrato = p.contrato_id
WHERE 
    p.status_pagamento = 'Atrasado'
GROUP BY 
    c.idcliente, c.nome, c.cpf, c.email, c.telefone
ORDER BY 
    total_pagamentos_atrasados DESC;


SELECT 
    c.idcliente,
    c.nome,
    c.cpf,
    c.email,
    c.telefone,
    COUNT(p.idpagamento) AS total_pagamentos_atrasados
FROM 
    cliente c
JOIN 
    contrato co ON c.idcliente = co.cliente_id
JOIN 
    pagamento p ON co.idcontrato = p.contrato_id
WHERE 
    p.status_pagamento = 'Pago com atraso'
GROUP BY 
    c.idcliente, c.nome, c.cpf, c.email, c.telefone
HAVING 
    COUNT(p.idpagamento) > 0
ORDER BY 
    total_pagamentos_atrasados DESC;


--Pagamento atrasados por ano / m s
SELECT 
    EXTRACT(YEAR FROM p.data_vencimento) AS ano,
    EXTRACT(MONTH FROM p.data_vencimento) AS mes,
    COUNT(p.idpagamento) AS total_pagamentos_atrasados,
    SUM(p.valor_parcela) AS valor_total_atrasado
FROM 
    pagamento p
WHERE 
    p.status_pagamento = 'Pago com atraso'
GROUP BY 
    EXTRACT(YEAR FROM p.data_vencimento),
    EXTRACT(MONTH FROM p.data_vencimento)
ORDER BY 
    ano DESC, mes DESC;


--Inserindo dados na tabela de FatoPagamentosAtrasados
INSERT INTO FatoResumoPagamentosAtrasados (
    ano, 
    mes, 
    total_pagamentos_atrasados, 
    valor_total_atrasado, 
    tempo_id, 
    cliente_id, 
    contrato_id, 
    produto_id
)
SELECT 
    EXTRACT(YEAR FROM p.DATA_VENCIMENTO) AS ano,
    EXTRACT(MONTH FROM p.DATA_VENCIMENTO) AS mes,
    COUNT(p.SK_PAGAMENTO) AS total_pagamentos_atrasados,
    SUM(p.VALOR_PARCELA) AS valor_total_atrasado,
    t.SK_TEMPO AS tempo_id,
    c.SK_CLIENTE AS cliente_id,
    co.SK_CONTRATO AS contrato_id,
    pr.SK_PRODUTO AS produto_id
FROM 
    DimPagamento p
JOIN 
    DimTempo t ON EXTRACT(YEAR FROM p.DATA_VENCIMENTO) = t.ANO
                AND EXTRACT(MONTH FROM p.DATA_VENCIMENTO) = t.MES
JOIN 
    DimContrato co ON p.SK_CONTRATO = co.SK_CONTRATO
JOIN 
    DimCliente c ON co.SK_CLIENTE = c.SK_CLIENTE
JOIN 
    DimProduto pr ON co.SK_PRODUTO = pr.SK_PRODUTO
WHERE 
    p.STATUS_PAGAMENTO = 'Pago com atraso'
GROUP BY 
    EXTRACT(YEAR FROM p.DATA_VENCIMENTO),
    EXTRACT(MONTH FROM p.DATA_VENCIMENTO),
    t.SK_TEMPO,
    c.SK_CLIENTE,
    co.SK_CONTRATO,
    pr.SK_PRODUTO
ORDER BY 
    ano DESC, mes DESC;

DESC DimPagamento;
--Consulta na tabela fato:


SELECT ano, mes, total_pagamentos_atrasados, valor_total_atrasado
FROM FatoResumoPagamentosAtrasados
ORDER BY ano DESC, mes DESC;


SELECT ano, SUM(valor_total_atrasado) AS valor_total
FROM FatoResumoPagamentosAtrasados
GROUP BY ano
ORDER BY ano DESC;

SELECT mes, ano, total_pagamentos_atrasados, valor_total_atrasado
FROM FatoResumoPagamentosAtrasados
WHERE ano = 2024
ORDER BY mes DESC;


-- Calculando pra tabela fato ResumoPagamentosAtrasados

SELECT 
    EXTRACT(YEAR FROM p.data_vencimento) AS ano,
    EXTRACT(MONTH FROM p.data_vencimento) AS mes,
    COUNT(p.idpagamento) AS total_pagamentos_atrasados,
    SUM(p.valor_parcela) AS valor_total_atrasado,
    t.sk_tempo AS tempo_id
FROM 
    pagamento p
JOIN 
    DimTempo t ON EXTRACT(YEAR FROM p.data_vencimento) = t.ano
                AND EXTRACT(MONTH FROM p.data_vencimento) = t.mes
WHERE 
    p.status_pagamento = 'Pago com atraso'
GROUP BY 
    EXTRACT(YEAR FROM p.data_vencimento),
    EXTRACT(MONTH FROM p.data_vencimento),
    t.sk_tempo
ORDER BY 
    ano DESC, mes DESC;

