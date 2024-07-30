
CREATE SEQUENCE seq_codigo_contrato START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER trg_generate_codigo_contrato
BEFORE INSERT ON contrato
FOR EACH ROW
DECLARE
    v_tipo_produto produto.tipo_produto%TYPE;
BEGIN
    --  tipo de produto baseado no produto_id
    SELECT tipo_produto INTO v_tipo_produto
    FROM produto
    WHERE idproduto = :NEW.produto_id;
    
    -- Gerar o código do contrato concatenando o tipo do produto com o valor da sequência
    :NEW.codigo_contrato := v_tipo_produto || '-' || LPAD(seq_codigo_contrato.NEXTVAL, 6, '0');
END;
/


 
--Trigger contrato_tipo_produto
-- Operação:
 
/* Quando um novo contrato for iserido, gera automaticamente um código de
contrato. Esse codigo_contrato é baseado no tipo_produto na tabela produto.*/
 
/* A sequência seq_codigo_contrato é usada para garantir que cada contrato 
tenha um número único.

A trigger trg_generate_codigo_contrato é executada antes de inserir um 
novo registro na tabela contrato.

Dentro da trigger, o tipo de produto é obtido da tabela produto
com base no produto_id.
O código do contrato é gerado concatenando 
o tipo de produto com o valor da sequência formatado com 6 dígitos,
preenchendo com zeros à esquerda se necessário.

*/