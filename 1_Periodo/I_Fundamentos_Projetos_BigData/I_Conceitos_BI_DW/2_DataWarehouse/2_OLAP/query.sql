SELECT * FROM DimCliente;
SELECT * FROM DimEndereco;
SELECT * FROM DimFaixaRenda;
SELECT * FROM DimFonteRenda;

SELECT * FROM DimProduto; 
SELECT * FROM DimPagamento; 
SELECT * FROM DimTempo;
SELECT * FROM pagamento;

SELECT * FROM fatoresumopagamentosatrasados;

DELETE FROM DimEndereco
WHERE sk_endereco BETWEEN 20 AND 40;

DELETE FROM DimCliente
WHERE sk_cliente BETWEEN 1000 AND 1018;




SHOW PARAMETER db_name;
SELECT instance_name FROM v$instance;




