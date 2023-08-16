/*********2ND INSTANCE COMPLAINS******/

----REGI�O
	DROP TABLE XXX
	SELECT
	SIGLAUF AS ESTADO
	,'NOV15' AS M�S
	,SERVICO AS PRODUTO
	,CASE WHEN MOTIVO IN ('B�nus e Promo��es','Oferta','Mudan�a de Plano') THEN 'Oferta, B�nus, Promo��es, Mensagens Publicit�rias e Mudan�a de Plano'
	WHEN MOTIVO IN ('Qualidade e Funcionamento do Servi�o ou Equipamento') THEN 'Qualidade, Funcionamento e Reparo'
	WHEN MOTIVO IN ('Dados Cadastrais') THEN 'Dados cadastrais e n�mero da linha'
	WHEN MOTIVO IN ('Dificuldade em cancelar') THEN 'Cancelamento'
	WHEN MOTIVO IN ('Documento de Cobran�a, Contrato, Relat�rio, Grava��es') THEN 'Documento de Cobran�a, Contrato, Grava��es' ELSE MOTIVO END MOTIVO
	,SUBMOTIVO
	,CASE WHEN SIGLAUF IN ('RS','PR','SC') THEN 'SUL'
	WHEN SIGLAUF IN ('SP') THEN 'S�O PAULO'
	WHEN SIGLAUF IN ('ES','RJ','MG') THEN 'SUDESTE'
	WHEN SIGLAUF IN ('GO','MS','MT','DF') THEN 'CENTRO-OESTE'
	WHEN SIGLAUF IS NULL THEN 'N�O IDENTIFICADO'
	ELSE 'NORDESTE' END REGI�O
	,COUNT (1) VOLUME
INTO XXX
FROM XXX
WHERE RECLAMADO = 'XXX'
	GROUP BY 
	SIGLAUF
	,SERVICO
	,CASE WHEN MOTIVO IN ('B�nus e Promo��es','Oferta','Mudan�a de Plano') THEN 'Oferta, B�nus, Promo��es, Mensagens Publicit�rias e Mudan�a de Plano'
	WHEN MOTIVO IN ('Qualidade e Funcionamento do Servi�o ou Equipamento') THEN 'Qualidade, Funcionamento e Reparo'
	WHEN MOTIVO IN ('Dados Cadastrais') THEN 'Dados cadastrais e n�mero da linha'
	WHEN MOTIVO IN ('Dificuldade em cancelar') THEN 'Cancelamento'
	WHEN MOTIVO IN ('Documento de Cobran�a, Contrato, Relat�rio, Grava��es') THEN 'Documento de Cobran�a, Contrato, Grava��es' ELSE MOTIVO END 
	,SUBMOTIVO
	,CASE WHEN SIGLAUF IN ('RS','PR','SC') THEN 'SUL'
	WHEN SIGLAUF IN ('SP') THEN 'S�O PAULO'
	WHEN SIGLAUF IN ('ES','RJ','MG') THEN 'SUDESTE'
	WHEN SIGLAUF IN ('GO','MS','MT','DF') THEN 'CENTRO-OESTE'
	WHEN SIGLAUF IS NULL THEN 'N�O IDENTIFICADO'
	ELSE 'NORDESTE' END 

INSERT INTO XXX
SELECT
	SIGLAUF AS ESTADO
	,'DEZ15' AS M�S
	,SERVICO AS PRODUTO
	,CASE WHEN MOTIVO IN ('B�nus e Promo��es','Oferta','Mudan�a de Plano') THEN 'Oferta, B�nus, Promo��es, Mensagens Publicit�rias e Mudan�a de Plano'
	WHEN MOTIVO IN ('Qualidade e Funcionamento do Servi�o ou Equipamento') THEN 'Qualidade, Funcionamento e Reparo'
	WHEN MOTIVO IN ('Dados Cadastrais') THEN 'Dados cadastrais e n�mero da linha'
	WHEN MOTIVO IN ('Dificuldade em cancelar') THEN 'Cancelamento'
	WHEN MOTIVO IN ('Documento de Cobran�a, Contrato, Relat�rio, Grava��es') THEN 'Documento de Cobran�a, Contrato, Grava��es' ELSE MOTIVO END MOTIVO
	,SUBMOTIVO
	,CASE WHEN SIGLAUF IN ('RS','PR','SC') THEN 'SUL'
	WHEN SIGLAUF IN ('SP') THEN 'S�O PAULO'
	WHEN SIGLAUF IN ('ES','RJ','MG') THEN 'SUDESTE'
	WHEN SIGLAUF IN ('GO','MS','MT','DF') THEN 'CENTRO-OESTE'
	WHEN SIGLAUF IS NULL THEN 'N�O IDENTIFICADO'
	ELSE 'NORDESTE' END REGI�O
	,COUNT (1) VOLUME
FROM XXX
WHERE RECLAMADO = 'XXX'
GROUP BY 
	SIGLAUF
	,SERVICO
	,CASE WHEN MOTIVO IN ('B�nus e Promo��es','Oferta','Mudan�a de Plano') THEN 'Oferta, B�nus, Promo��es, Mensagens Publicit�rias e Mudan�a de Plano'
	WHEN MOTIVO IN ('Qualidade e Funcionamento do Servi�o ou Equipamento') THEN 'Qualidade, Funcionamento e Reparo'
	WHEN MOTIVO IN ('Dados Cadastrais') THEN 'Dados cadastrais e n�mero da linha'
	WHEN MOTIVO IN ('Dificuldade em cancelar') THEN 'Cancelamento'
	WHEN MOTIVO IN ('Documento de Cobran�a, Contrato, Relat�rio, Grava��es') THEN 'Documento de Cobran�a, Contrato, Grava��es' ELSE MOTIVO END 
	,SUBMOTIVO
	,CASE WHEN SIGLAUF IN ('RS','PR','SC') THEN 'SUL'
	WHEN SIGLAUF IN ('SP') THEN 'S�O PAULO'
	WHEN SIGLAUF IN ('ES','RJ','MG') THEN 'SUDESTE'
	WHEN SIGLAUF IN ('GO','MS','MT','DF') THEN 'CENTRO-OESTE'
	WHEN SIGLAUF IS NULL THEN 'N�O IDENTIFICADO'
	ELSE 'NORDESTE' END 

INSERT INTO XXX
SELECT
	SIGLAUF AS ESTADO
	,'JAN16' AS M�S
	,SERVICO AS PRODUTO
	,CASE WHEN MOTIVO IN ('B�nus e Promo��es','Oferta','Mudan�a de Plano') THEN 'Oferta, B�nus, Promo��es, Mensagens Publicit�rias e Mudan�a de Plano'
	WHEN MOTIVO IN ('Qualidade e Funcionamento do Servi�o ou Equipamento') THEN 'Qualidade, Funcionamento e Reparo'
	WHEN MOTIVO IN ('Dados Cadastrais') THEN 'Dados cadastrais e n�mero da linha'
	WHEN MOTIVO IN ('Dificuldade em cancelar') THEN 'Cancelamento'
	WHEN MOTIVO IN ('Documento de Cobran�a, Contrato, Relat�rio, Grava��es') THEN 'Documento de Cobran�a, Contrato, Grava��es' ELSE MOTIVO END MOTIVO
	,SUBMOTIVO
	,CASE WHEN SIGLAUF IN ('RS','PR','SC') THEN 'SUL'
	WHEN SIGLAUF IN ('SP') THEN 'S�O PAULO'
	WHEN SIGLAUF IN ('ES','RJ','MG') THEN 'SUDESTE'
	WHEN SIGLAUF IN ('GO','MS','MT','DF') THEN 'CENTRO-OESTE'
	WHEN SIGLAUF IS NULL THEN 'N�O IDENTIFICADO'
	ELSE 'NORDESTE' END REGI�O
	,COUNT (1) VOLUME
FROM XXX
WHERE RECLAMADO = 'XXX'
GROUP BY 
	SIGLAUF
	,SERVICO
	,CASE WHEN MOTIVO IN ('B�nus e Promo��es','Oferta','Mudan�a de Plano') THEN 'Oferta, B�nus, Promo��es, Mensagens Publicit�rias e Mudan�a de Plano'
	WHEN MOTIVO IN ('Qualidade e Funcionamento do Servi�o ou Equipamento') THEN 'Qualidade, Funcionamento e Reparo'
	WHEN MOTIVO IN ('Dados Cadastrais') THEN 'Dados cadastrais e n�mero da linha'
	WHEN MOTIVO IN ('Dificuldade em cancelar') THEN 'Cancelamento'
	WHEN MOTIVO IN ('Documento de Cobran�a, Contrato, Relat�rio, Grava��es') THEN 'Documento de Cobran�a, Contrato, Grava��es' ELSE MOTIVO END 
	,SUBMOTIVO
	,CASE WHEN SIGLAUF IN ('RS','PR','SC') THEN 'SUL'
	WHEN SIGLAUF IN ('SP') THEN 'S�O PAULO'
	WHEN SIGLAUF IN ('ES','RJ','MG') THEN 'SUDESTE'
	WHEN SIGLAUF IN ('GO','MS','MT','DF') THEN 'CENTRO-OESTE'
	WHEN SIGLAUF IS NULL THEN 'N�O IDENTIFICADO'
	ELSE 'NORDESTE' END 

INSERT INTO XXX
	SELECT
	SIGLAUF AS ESTADO
	,'FEV16' AS M�S
	,SERVICO AS PRODUTO
	,CASE WHEN MOTIVO IN ('B�nus e Promo��es','Oferta','Mudan�a de Plano') THEN 'Oferta, B�nus, Promo��es, Mensagens Publicit�rias e Mudan�a de Plano'
	WHEN MOTIVO IN ('Qualidade e Funcionamento do Servi�o ou Equipamento') THEN 'Qualidade, Funcionamento e Reparo'
	WHEN MOTIVO IN ('Dados Cadastrais') THEN 'Dados cadastrais e n�mero da linha'
	WHEN MOTIVO IN ('Dificuldade em cancelar') THEN 'Cancelamento'
	WHEN MOTIVO IN ('Documento de Cobran�a, Contrato, Relat�rio, Grava��es') THEN 'Documento de Cobran�a, Contrato, Grava��es' ELSE MOTIVO END MOTIVO
	,SUBMOTIVO
	,CASE WHEN SIGLAUF IN ('RS','PR','SC') THEN 'SUL'
	WHEN SIGLAUF IN ('SP') THEN 'S�O PAULO'
	WHEN SIGLAUF IN ('ES','RJ','MG') THEN 'SUDESTE'
	WHEN SIGLAUF IN ('GO','MS','MT','DF') THEN 'CENTRO-OESTE'
	WHEN SIGLAUF IS NULL THEN 'N�O IDENTIFICADO'
	ELSE 'NORDESTE' END REGI�O
	,COUNT (1) VOLUME
FROM XXX
WHERE RECLAMADO = 'XXX'
GROUP BY 
	SIGLAUF
	,SERVICO
	,CASE WHEN MOTIVO IN ('B�nus e Promo��es','Oferta','Mudan�a de Plano') THEN 'Oferta, B�nus, Promo��es, Mensagens Publicit�rias e Mudan�a de Plano'
	WHEN MOTIVO IN ('Qualidade e Funcionamento do Servi�o ou Equipamento') THEN 'Qualidade, Funcionamento e Reparo'
	WHEN MOTIVO IN ('Dados Cadastrais') THEN 'Dados cadastrais e n�mero da linha'
	WHEN MOTIVO IN ('Dificuldade em cancelar') THEN 'Cancelamento'
	WHEN MOTIVO IN ('Documento de Cobran�a, Contrato, Relat�rio, Grava��es') THEN 'Documento de Cobran�a, Contrato, Grava��es' ELSE MOTIVO END 
	,SUBMOTIVO
	,CASE WHEN SIGLAUF IN ('RS','PR','SC') THEN 'SUL'
	WHEN SIGLAUF IN ('SP') THEN 'S�O PAULO'
	WHEN SIGLAUF IN ('ES','RJ','MG') THEN 'SUDESTE'
	WHEN SIGLAUF IN ('GO','MS','MT','DF') THEN 'CENTRO-OESTE'
	WHEN SIGLAUF IS NULL THEN 'N�O IDENTIFICADO'
	ELSE 'NORDESTE' END 

INSERT INTO XXX
SELECT
	SIGLAUF AS ESTADO
	,'MAR16' AS M�S
	,SERVICO AS PRODUTO
	,CASE WHEN MOTIVO IN ('B�nus e Promo��es','Oferta','Mudan�a de Plano') THEN 'Oferta, B�nus, Promo��es, Mensagens Publicit�rias e Mudan�a de Plano'
	WHEN MOTIVO IN ('Qualidade e Funcionamento do Servi�o ou Equipamento') THEN 'Qualidade, Funcionamento e Reparo'
	WHEN MOTIVO IN ('Dados Cadastrais') THEN 'Dados cadastrais e n�mero da linha'
	WHEN MOTIVO IN ('Dificuldade em cancelar') THEN 'Cancelamento'
	WHEN MOTIVO IN ('Documento de Cobran�a, Contrato, Relat�rio, Grava��es') THEN 'Documento de Cobran�a, Contrato, Grava��es' ELSE MOTIVO END MOTIVO
	,SUBMOTIVO
	,CASE WHEN SIGLAUF IN ('RS','PR','SC') THEN 'SUL'
	WHEN SIGLAUF IN ('SP') THEN 'S�O PAULO'
	WHEN SIGLAUF IN ('ES','RJ','MG') THEN 'SUDESTE'
	WHEN SIGLAUF IN ('GO','MS','MT','DF') THEN 'CENTRO-OESTE'
	WHEN SIGLAUF IS NULL THEN 'N�O IDENTIFICADO'
	ELSE 'NORDESTE' END REGI�O
	,COUNT (1) VOLUME
FROM XXX
WHERE RECLAMADO = 'XXX'
GROUP BY 
	SIGLAUF
	,SERVICO
	,CASE WHEN MOTIVO IN ('B�nus e Promo��es','Oferta','Mudan�a de Plano') THEN 'Oferta, B�nus, Promo��es, Mensagens Publicit�rias e Mudan�a de Plano'
	WHEN MOTIVO IN ('Qualidade e Funcionamento do Servi�o ou Equipamento') THEN 'Qualidade, Funcionamento e Reparo'
	WHEN MOTIVO IN ('Dados Cadastrais') THEN 'Dados cadastrais e n�mero da linha'
	WHEN MOTIVO IN ('Dificuldade em cancelar') THEN 'Cancelamento'
	WHEN MOTIVO IN ('Documento de Cobran�a, Contrato, Relat�rio, Grava��es') THEN 'Documento de Cobran�a, Contrato, Grava��es' ELSE MOTIVO END 
	,SUBMOTIVO
	,CASE WHEN SIGLAUF IN ('RS','PR','SC') THEN 'SUL'
	WHEN SIGLAUF IN ('SP') THEN 'S�O PAULO'
	WHEN SIGLAUF IN ('ES','RJ','MG') THEN 'SUDESTE'
	WHEN SIGLAUF IN ('GO','MS','MT','DF') THEN 'CENTRO-OESTE'
	WHEN SIGLAUF IS NULL THEN 'N�O IDENTIFICADO'
	ELSE 'NORDESTE' END 


SELECT 
	A.CODSOLICITACAO
	,A.MOTIVO 
	,CASE WHEN A.SIGLAUF IN ('RS','PR','SC') THEN 'SUL'
	WHEN A.SIGLAUF IN ('SP') THEN 'S�O PAULO'
	WHEN A.SIGLAUF IN ('ES','RJ','MG') THEN 'SUDESTE'
	WHEN A.SIGLAUF IN ('GO','MS','MT','DF') THEN 'CENTRO-OESTE'
	WHEN A.SIGLAUF IS NULL THEN 'N�O IDENTIFICADO'
	ELSE 'NORDESTE' END REGI�O
	,B.ARMARIO_ERB
	,B.CLIENTE_RECENTE
	,B.REINCIDENCIA_30D_TECNOLOGIA
	,B.REINCIDENCIA_30D_CLIENTE
	,B.RPON
	,B.TIPO_RECLAMACAO
	,B.PRODUTO_SIEBEL
	,B.DESC_CATEGORIA
	,B.DESC_SUBCATEGORIA
	,B.DESC_DETALHADA
	,B.TELEFONE
FROM DXXX A
LEFT JOIN XXX B
ON a.CPFUSUARIO = b.DOCUMENTO_CLIENTE
AND DATEDIFF (DAY, B.DT_CRIACAO, A.DATAREGISTROSOLICITACAO) >=0
AND DATEDIFF (DAY, B.DT_CRIACAO, A.DATAREGISTROSOLICITACAO) <=7
AND B.DT_CRIACAO <> A.DATAREGISTROSOLICITACAO
WHERE DATAREGISTROSOLICITACAO >='2016-03-01'
AND A.SERVICO ='Servi�o de Comunica��o Multim�dia'

