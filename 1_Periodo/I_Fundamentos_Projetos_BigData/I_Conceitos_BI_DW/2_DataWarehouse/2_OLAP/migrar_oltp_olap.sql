
-- Extração e carga para a tabela DimCliente
INSERT INTO DimCliente (idcliente, nome, cpf, idade, data_nascimento, sexo, email, telefone, sk_endereco, sk_fonte_renda, sk_faixa_renda)
SELECT idcliente AS idcliente,
       nome,
       cpf,
       idade,
       data_nascimento,
       sexo,
       email,
       telefone,
       (SELECT sk_endereco FROM DimEndereco WHERE id_endereco = c.endereco_id) AS sk_endereco,
       (SELECT sk_fonte_renda FROM DimFonteRenda WHERE idfonte_renda = c.fonte_renda_id) AS sk_fonte_renda,
       (SELECT sk_faixa_renda FROM DimFaixaRenda WHERE idfaixa_renda = c.faixa_renda_id) AS sk_faixa_renda
FROM cliente c;
SELECT * 
FROM DimCliente;



INSERT INTO DimEndereco (id_endereco, rua, numero, bairro, cidade, estado, cep)
SELECT idendereco AS id_endereco,
       rua,
       numero,
       bairro,
       cidade,
       estado,
       cep
FROM endereco;


INSERT INTO DimFonteRenda (idfonte_renda, descricao)
SELECT idfonte_renda AS idfonte_renda,
       descricao
FROM fonte_renda;

INSERT INTO DimFaixaRenda (idfaixa_renda, descricao)
SELECT idfaixa_renda AS idfaixa_renda,
       descricao
FROM faixa_renda;


-- Migrando os produtos:

INSERT INTO DimProduto (
    idproduto,
    nome_produto,
    tipo_produto,
    valor_minimo,
    valor_maximo,
    numero_parcelas_maximo,
    condicoes_especiais
)
SELECT 
    idproduto,
    nome_produto,
    tipo_produto,
    valor_minimo,
    valor_maximo,
    numero_parcelas_maximo,
    condicoes_especiais
FROM 
    produto;



-- Migrar o contrato:

INSERT INTO DimContrato (
    idcontrato,
    codigo_contrato,
    valor_emprestimo,
    numero_parcelas,
    taxa_juros,
    data_contratacao,
    status_contrato,
    sk_cliente,
    sk_produto
)
SELECT 
    c.idcontrato,
    c.codigo_contrato,
    c.valor_emprestimo,
    c.numero_parcelas,
    c.taxa_juros,
    c.data_contratacao,
    c.status_contrato,
    dc.sk_cliente,
    dp.sk_produto
FROM 
    contrato c
JOIN 
    DimCliente dc ON c.cliente_id = dc.idcliente
JOIN 
    DimProduto dp ON c.produto_id = dp.idproduto;

-- Migrando os dados da Tbl pagamento:
INSERT INTO DimPagamento (
    numero_parcela,
    valor_parcela,
    data_vencimento,
    data_pagamento,
    status_pagamento,
    dias_atraso,
    juros_mora,
    multa_atraso,
    valor_final,
    sk_contrato
)
SELECT 
    p.numero_parcela,
    p.valor_parcela,
    p.data_vencimento,
    p.data_pagamento,
    p.status_pagamento,
    p.dias_atraso,
    p.juros_mora,
    p.multa_atraso,
    p.valor_final,
    dc.sk_contrato
FROM 
    pagamento p
JOIN 
    DimContrato dc ON p.contrato_id = dc.idcontrato;


