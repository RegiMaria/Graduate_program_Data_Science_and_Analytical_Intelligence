-- Calcular taxa de inadimplência
--Base nome, idade, fonte de renda.
SELECT 
    c.idcliente,
    c.nome,
    c.idade,
    c.fonte_renda_id,
    COUNT(CASE WHEN p.status_pagamento = 'Atrasado' THEN 1 END) AS total_atrasado,
    COUNT(CASE WHEN p.status_pagamento = 'Pago com atraso' THEN 1 END) AS total_pago_com_atraso,
    COUNT(CASE WHEN p.status_pagamento = 'Pago' THEN 1 END) AS total_pago_em_dia,
    (COUNT(CASE WHEN p.status_pagamento = 'Atrasado' THEN 1 END) * 100.0 / COUNT(p.idpagamento)) AS taxa_inadimplencia
FROM 
    cliente c
JOIN 
    contrato con ON c.idcliente = con.cliente_id
JOIN 
    pagamento p ON con.idcontrato = p.contrato_id
GROUP BY 
    c.idcliente, c.nome, c.idade, c.fonte_renda_id
ORDER BY 
    taxa_inadimplencia DESC;

--Cálculo:
--Total pago / total atrasado = taxa de inadimplencia e multiplica por 100

