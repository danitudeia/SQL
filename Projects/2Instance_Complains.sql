/*********2ND INSTANCE COMPLAINS******/

----REGIÃO
	DROP TABLE XXX
	SELECT
	SIGLAUF AS ESTADO
	,'NOV15' AS MÊS
	,SERVICO AS PRODUTO
	,CASE WHEN MOTIVO IN ('Bônus e Promoções','Oferta','Mudança de Plano') THEN 'Oferta, Bônus, Promoções, Mensagens Publicitárias e Mudança de Plano'
	WHEN MOTIVO IN ('Qualidade e Funcionamento do Serviço ou Equipamento') THEN 'Qualidade, Funcionamento e Reparo'
	WHEN MOTIVO IN ('Dados Cadastrais') THEN 'Dados cadastrais e número da linha'
	WHEN MOTIVO IN ('Dificuldade em cancelar') THEN 'Cancelamento'
	WHEN MOTIVO IN ('Documento de Cobrança, Contrato, Relatório, Gravações') THEN 'Documento de Cobrança, Contrato, Gravações' ELSE MOTIVO END MOTIVO
	,SUBMOTIVO
	,CASE WHEN SIGLAUF IN ('RS','PR','SC') THEN 'SUL'
	WHEN SIGLAUF IN ('SP') THEN 'SÃO PAULO'
	WHEN SIGLAUF IN ('ES','RJ','MG') THEN 'SUDESTE'
	WHEN SIGLAUF IN ('GO','MS','MT','DF') THEN 'CENTRO-OESTE'
	WHEN SIGLAUF IS NULL THEN 'NÃO IDENTIFICADO'
	ELSE 'NORDESTE' END REGIÃO
	,COUNT (1) VOLUME
INTO XXX
FROM XXX
WHERE RECLAMADO = 'XXX'
	GROUP BY 
	SIGLAUF
	,SERVICO
	,CASE WHEN MOTIVO IN ('Bônus e Promoções','Oferta','Mudança de Plano') THEN 'Oferta, Bônus, Promoções, Mensagens Publicitárias e Mudança de Plano'
	WHEN MOTIVO IN ('Qualidade e Funcionamento do Serviço ou Equipamento') THEN 'Qualidade, Funcionamento e Reparo'
	WHEN MOTIVO IN ('Dados Cadastrais') THEN 'Dados cadastrais e número da linha'
	WHEN MOTIVO IN ('Dificuldade em cancelar') THEN 'Cancelamento'
	WHEN MOTIVO IN ('Documento de Cobrança, Contrato, Relatório, Gravações') THEN 'Documento de Cobrança, Contrato, Gravações' ELSE MOTIVO END 
	,SUBMOTIVO
	,CASE WHEN SIGLAUF IN ('RS','PR','SC') THEN 'SUL'
	WHEN SIGLAUF IN ('SP') THEN 'SÃO PAULO'
	WHEN SIGLAUF IN ('ES','RJ','MG') THEN 'SUDESTE'
	WHEN SIGLAUF IN ('GO','MS','MT','DF') THEN 'CENTRO-OESTE'
	WHEN SIGLAUF IS NULL THEN 'NÃO IDENTIFICADO'
	ELSE 'NORDESTE' END 

INSERT INTO XXX
SELECT
	SIGLAUF AS ESTADO
	,'DEZ15' AS MÊS
	,SERVICO AS PRODUTO
	,CASE WHEN MOTIVO IN ('Bônus e Promoções','Oferta','Mudança de Plano') THEN 'Oferta, Bônus, Promoções, Mensagens Publicitárias e Mudança de Plano'
	WHEN MOTIVO IN ('Qualidade e Funcionamento do Serviço ou Equipamento') THEN 'Qualidade, Funcionamento e Reparo'
	WHEN MOTIVO IN ('Dados Cadastrais') THEN 'Dados cadastrais e número da linha'
	WHEN MOTIVO IN ('Dificuldade em cancelar') THEN 'Cancelamento'
	WHEN MOTIVO IN ('Documento de Cobrança, Contrato, Relatório, Gravações') THEN 'Documento de Cobrança, Contrato, Gravações' ELSE MOTIVO END MOTIVO
	,SUBMOTIVO
	,CASE WHEN SIGLAUF IN ('RS','PR','SC') THEN 'SUL'
	WHEN SIGLAUF IN ('SP') THEN 'SÃO PAULO'
	WHEN SIGLAUF IN ('ES','RJ','MG') THEN 'SUDESTE'
	WHEN SIGLAUF IN ('GO','MS','MT','DF') THEN 'CENTRO-OESTE'
	WHEN SIGLAUF IS NULL THEN 'NÃO IDENTIFICADO'
	ELSE 'NORDESTE' END REGIÃO
	,COUNT (1) VOLUME
FROM XXX
WHERE RECLAMADO = 'XXX'
GROUP BY 
	SIGLAUF
	,SERVICO
	,CASE WHEN MOTIVO IN ('Bônus e Promoções','Oferta','Mudança de Plano') THEN 'Oferta, Bônus, Promoções, Mensagens Publicitárias e Mudança de Plano'
	WHEN MOTIVO IN ('Qualidade e Funcionamento do Serviço ou Equipamento') THEN 'Qualidade, Funcionamento e Reparo'
	WHEN MOTIVO IN ('Dados Cadastrais') THEN 'Dados cadastrais e número da linha'
	WHEN MOTIVO IN ('Dificuldade em cancelar') THEN 'Cancelamento'
	WHEN MOTIVO IN ('Documento de Cobrança, Contrato, Relatório, Gravações') THEN 'Documento de Cobrança, Contrato, Gravações' ELSE MOTIVO END 
	,SUBMOTIVO
	,CASE WHEN SIGLAUF IN ('RS','PR','SC') THEN 'SUL'
	WHEN SIGLAUF IN ('SP') THEN 'SÃO PAULO'
	WHEN SIGLAUF IN ('ES','RJ','MG') THEN 'SUDESTE'
	WHEN SIGLAUF IN ('GO','MS','MT','DF') THEN 'CENTRO-OESTE'
	WHEN SIGLAUF IS NULL THEN 'NÃO IDENTIFICADO'
	ELSE 'NORDESTE' END 

INSERT INTO XXX
SELECT
	SIGLAUF AS ESTADO
	,'JAN16' AS MÊS
	,SERVICO AS PRODUTO
	,CASE WHEN MOTIVO IN ('Bônus e Promoções','Oferta','Mudança de Plano') THEN 'Oferta, Bônus, Promoções, Mensagens Publicitárias e Mudança de Plano'
	WHEN MOTIVO IN ('Qualidade e Funcionamento do Serviço ou Equipamento') THEN 'Qualidade, Funcionamento e Reparo'
	WHEN MOTIVO IN ('Dados Cadastrais') THEN 'Dados cadastrais e número da linha'
	WHEN MOTIVO IN ('Dificuldade em cancelar') THEN 'Cancelamento'
	WHEN MOTIVO IN ('Documento de Cobrança, Contrato, Relatório, Gravações') THEN 'Documento de Cobrança, Contrato, Gravações' ELSE MOTIVO END MOTIVO
	,SUBMOTIVO
	,CASE WHEN SIGLAUF IN ('RS','PR','SC') THEN 'SUL'
	WHEN SIGLAUF IN ('SP') THEN 'SÃO PAULO'
	WHEN SIGLAUF IN ('ES','RJ','MG') THEN 'SUDESTE'
	WHEN SIGLAUF IN ('GO','MS','MT','DF') THEN 'CENTRO-OESTE'
	WHEN SIGLAUF IS NULL THEN 'NÃO IDENTIFICADO'
	ELSE 'NORDESTE' END REGIÃO
	,COUNT (1) VOLUME
FROM XXX
WHERE RECLAMADO = 'XXX'
GROUP BY 
	SIGLAUF
	,SERVICO
	,CASE WHEN MOTIVO IN ('Bônus e Promoções','Oferta','Mudança de Plano') THEN 'Oferta, Bônus, Promoções, Mensagens Publicitárias e Mudança de Plano'
	WHEN MOTIVO IN ('Qualidade e Funcionamento do Serviço ou Equipamento') THEN 'Qualidade, Funcionamento e Reparo'
	WHEN MOTIVO IN ('Dados Cadastrais') THEN 'Dados cadastrais e número da linha'
	WHEN MOTIVO IN ('Dificuldade em cancelar') THEN 'Cancelamento'
	WHEN MOTIVO IN ('Documento de Cobrança, Contrato, Relatório, Gravações') THEN 'Documento de Cobrança, Contrato, Gravações' ELSE MOTIVO END 
	,SUBMOTIVO
	,CASE WHEN SIGLAUF IN ('RS','PR','SC') THEN 'SUL'
	WHEN SIGLAUF IN ('SP') THEN 'SÃO PAULO'
	WHEN SIGLAUF IN ('ES','RJ','MG') THEN 'SUDESTE'
	WHEN SIGLAUF IN ('GO','MS','MT','DF') THEN 'CENTRO-OESTE'
	WHEN SIGLAUF IS NULL THEN 'NÃO IDENTIFICADO'
	ELSE 'NORDESTE' END 

INSERT INTO XXX
	SELECT
	SIGLAUF AS ESTADO
	,'FEV16' AS MÊS
	,SERVICO AS PRODUTO
	,CASE WHEN MOTIVO IN ('Bônus e Promoções','Oferta','Mudança de Plano') THEN 'Oferta, Bônus, Promoções, Mensagens Publicitárias e Mudança de Plano'
	WHEN MOTIVO IN ('Qualidade e Funcionamento do Serviço ou Equipamento') THEN 'Qualidade, Funcionamento e Reparo'
	WHEN MOTIVO IN ('Dados Cadastrais') THEN 'Dados cadastrais e número da linha'
	WHEN MOTIVO IN ('Dificuldade em cancelar') THEN 'Cancelamento'
	WHEN MOTIVO IN ('Documento de Cobrança, Contrato, Relatório, Gravações') THEN 'Documento de Cobrança, Contrato, Gravações' ELSE MOTIVO END MOTIVO
	,SUBMOTIVO
	,CASE WHEN SIGLAUF IN ('RS','PR','SC') THEN 'SUL'
	WHEN SIGLAUF IN ('SP') THEN 'SÃO PAULO'
	WHEN SIGLAUF IN ('ES','RJ','MG') THEN 'SUDESTE'
	WHEN SIGLAUF IN ('GO','MS','MT','DF') THEN 'CENTRO-OESTE'
	WHEN SIGLAUF IS NULL THEN 'NÃO IDENTIFICADO'
	ELSE 'NORDESTE' END REGIÃO
	,COUNT (1) VOLUME
FROM XXX
WHERE RECLAMADO = 'XXX'
GROUP BY 
	SIGLAUF
	,SERVICO
	,CASE WHEN MOTIVO IN ('Bônus e Promoções','Oferta','Mudança de Plano') THEN 'Oferta, Bônus, Promoções, Mensagens Publicitárias e Mudança de Plano'
	WHEN MOTIVO IN ('Qualidade e Funcionamento do Serviço ou Equipamento') THEN 'Qualidade, Funcionamento e Reparo'
	WHEN MOTIVO IN ('Dados Cadastrais') THEN 'Dados cadastrais e número da linha'
	WHEN MOTIVO IN ('Dificuldade em cancelar') THEN 'Cancelamento'
	WHEN MOTIVO IN ('Documento de Cobrança, Contrato, Relatório, Gravações') THEN 'Documento de Cobrança, Contrato, Gravações' ELSE MOTIVO END 
	,SUBMOTIVO
	,CASE WHEN SIGLAUF IN ('RS','PR','SC') THEN 'SUL'
	WHEN SIGLAUF IN ('SP') THEN 'SÃO PAULO'
	WHEN SIGLAUF IN ('ES','RJ','MG') THEN 'SUDESTE'
	WHEN SIGLAUF IN ('GO','MS','MT','DF') THEN 'CENTRO-OESTE'
	WHEN SIGLAUF IS NULL THEN 'NÃO IDENTIFICADO'
	ELSE 'NORDESTE' END 

INSERT INTO XXX
SELECT
	SIGLAUF AS ESTADO
	,'MAR16' AS MÊS
	,SERVICO AS PRODUTO
	,CASE WHEN MOTIVO IN ('Bônus e Promoções','Oferta','Mudança de Plano') THEN 'Oferta, Bônus, Promoções, Mensagens Publicitárias e Mudança de Plano'
	WHEN MOTIVO IN ('Qualidade e Funcionamento do Serviço ou Equipamento') THEN 'Qualidade, Funcionamento e Reparo'
	WHEN MOTIVO IN ('Dados Cadastrais') THEN 'Dados cadastrais e número da linha'
	WHEN MOTIVO IN ('Dificuldade em cancelar') THEN 'Cancelamento'
	WHEN MOTIVO IN ('Documento de Cobrança, Contrato, Relatório, Gravações') THEN 'Documento de Cobrança, Contrato, Gravações' ELSE MOTIVO END MOTIVO
	,SUBMOTIVO
	,CASE WHEN SIGLAUF IN ('RS','PR','SC') THEN 'SUL'
	WHEN SIGLAUF IN ('SP') THEN 'SÃO PAULO'
	WHEN SIGLAUF IN ('ES','RJ','MG') THEN 'SUDESTE'
	WHEN SIGLAUF IN ('GO','MS','MT','DF') THEN 'CENTRO-OESTE'
	WHEN SIGLAUF IS NULL THEN 'NÃO IDENTIFICADO'
	ELSE 'NORDESTE' END REGIÃO
	,COUNT (1) VOLUME
FROM XXX
WHERE RECLAMADO = 'XXX'
GROUP BY 
	SIGLAUF
	,SERVICO
	,CASE WHEN MOTIVO IN ('Bônus e Promoções','Oferta','Mudança de Plano') THEN 'Oferta, Bônus, Promoções, Mensagens Publicitárias e Mudança de Plano'
	WHEN MOTIVO IN ('Qualidade e Funcionamento do Serviço ou Equipamento') THEN 'Qualidade, Funcionamento e Reparo'
	WHEN MOTIVO IN ('Dados Cadastrais') THEN 'Dados cadastrais e número da linha'
	WHEN MOTIVO IN ('Dificuldade em cancelar') THEN 'Cancelamento'
	WHEN MOTIVO IN ('Documento de Cobrança, Contrato, Relatório, Gravações') THEN 'Documento de Cobrança, Contrato, Gravações' ELSE MOTIVO END 
	,SUBMOTIVO
	,CASE WHEN SIGLAUF IN ('RS','PR','SC') THEN 'SUL'
	WHEN SIGLAUF IN ('SP') THEN 'SÃO PAULO'
	WHEN SIGLAUF IN ('ES','RJ','MG') THEN 'SUDESTE'
	WHEN SIGLAUF IN ('GO','MS','MT','DF') THEN 'CENTRO-OESTE'
	WHEN SIGLAUF IS NULL THEN 'NÃO IDENTIFICADO'
	ELSE 'NORDESTE' END 


SELECT 
	A.CODSOLICITACAO
	,A.MOTIVO 
	,CASE WHEN A.SIGLAUF IN ('RS','PR','SC') THEN 'SUL'
	WHEN A.SIGLAUF IN ('SP') THEN 'SÃO PAULO'
	WHEN A.SIGLAUF IN ('ES','RJ','MG') THEN 'SUDESTE'
	WHEN A.SIGLAUF IN ('GO','MS','MT','DF') THEN 'CENTRO-OESTE'
	WHEN A.SIGLAUF IS NULL THEN 'NÃO IDENTIFICADO'
	ELSE 'NORDESTE' END REGIÃO
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
AND A.SERVICO ='Serviço de Comunicação Multimídia'

