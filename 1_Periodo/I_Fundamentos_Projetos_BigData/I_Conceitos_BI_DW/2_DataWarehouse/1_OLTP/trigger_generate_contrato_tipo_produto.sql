
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
    
    -- Gerar o c�digo do contrato concatenando o tipo do produto com o valor da sequ�ncia
    :NEW.codigo_contrato := v_tipo_produto || '-' || LPAD(seq_codigo_contrato.NEXTVAL, 6, '0');
END;
/


 
--Trigger contrato_tipo_produto
-- Opera��o:
 
/* Quando um novo contrato for iserido, gera automaticamente um c�digo de
contrato. Esse codigo_contrato � baseado no tipo_produto na tabela produto.*/
 
/* A sequ�ncia seq_codigo_contrato � usada para garantir que cada contrato 
tenha um n�mero �nico.

A trigger trg_generate_codigo_contrato � executada antes de inserir um 
novo registro na tabela contrato.

Dentro da trigger, o tipo de produto � obtido da tabela produto
com base no produto_id.
O c�digo do contrato � gerado concatenando 
o tipo de produto com o valor da sequ�ncia formatado com 6 d�gitos,
preenchendo com zeros � esquerda se necess�rio.

*/