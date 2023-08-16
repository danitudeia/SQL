/*********ANALISE RECLAMOS X ALTAS*******************/

----CRUZAMENTO COMPL COM PLANTA DTH-----
DROP TABLE  XXX
SELECT 
	A.*
	,B.Dt_Instalacao
INTO XXX
FROM (SELECT * FROM XXX WHERE dataRegistroSolicitacao >='2013-05-01' AND SERVICO = 'TV POR ASSINATURA') A
LEFT JOIN XXX B
ON (A.cpfUsuario = B.CPF_CNPJ OR A.DDD+A.TERMINAL = B.Telefone_10)
	
-----RETIRA DUPLICADAS-----
DROP TABLE  XXX
SELECT
	*
	,ROW_NUMBER () OVER (PARTITION BY CODSOLICITACAO ORDER BY DT_INSTALACAO ASC)AS REPET	
INTO XXX
FROM XXX

DROP TABLE  XXX	
SELECT * INTO XXX
FROM XXX
WHERE REPET = '1'


-------CRUZAMENTO ALTAS ------
DROP TABLE  XXX
SELECT 
	A.*
	,B.[ID OS]
	,B.[DATA CRIAÇÃO]
	,B.[DATA FINALIZAÇÃO]
INTO XXX
FROM XXX A
LEFT JOIN (SELECT * FROM XXX WHERE [GRUPO PROD] = 'ALTA') B
ON (A.cpfUsuario = B.CPF OR A.cnpjUsuario = B.CPF)
	
-----RETIRA DUPLICADAS-----
DROP TABLE  XXX
SELECT
	*
	,ROW_NUMBER () OVER (PARTITION BY CODSOLICITACAO ORDER BY DT_INSTALACAO ASC)AS REPET_2	
	INTO XXX
	FROM XXX

DROP TABLE  XXX	
SELECT * INTO XXX
FROM XXX
WHERE REPET_2 = '1'


-------PRAZO ENTRE RECLAMO E ENTRADA NA PLANTA------
DROP TABLE XXX
SELECT
	ANO
	,categoria
	,codSolicitacao
	,cpfUsuario
	,dataParaConclusao
	,dataRegistroSolicitacao
	,dataResposta
	,DDD
	,modalidade
	,motivo
	,numDoc
	,SEGMENTO
	,servico
	,situacao
	,submotivo
	,TERMINAL
	,tipoAtendimento
	,Dt_Instalacao
	,[DATA CRIAÇÃO]
	,[DATA FINALIZAÇÃO]
	,CASE WHEN DATEDIFF (DAY,[DATA CRIAÇÃO], dataRegistroSolicitacao)<=30 THEN 'MENOR 30D' 
	WHEN DATEDIFF (DAY,[DATA CRIAÇÃO], dataRegistroSolicitacao)>30 AND DATEDIFF (DAY,[DATA CRIAÇÃO], dataRegistroSolicitacao)<=60 THEN 'DE 30 A 60D' 
	WHEN DATEDIFF (DAY,[DATA CRIAÇÃO], dataRegistroSolicitacao)>60 AND DATEDIFF (DAY,[DATA CRIAÇÃO], dataRegistroSolicitacao)<=90 THEN 'DE 60 A 90D'
	WHEN DATEDIFF (DAY,[DATA CRIAÇÃO], dataRegistroSolicitacao)>90 THEN 'MAIOR 90D' ELSE NULL END PRAZO
INTO XXX
FROM XXX

DROP TABLE XXX
SELECT
	ANO
	,categoria
	,codSolicitacao
	,cpfUsuario
	,dataParaConclusao
	,dataRegistroSolicitacao
	,dataResposta
	,DDD
	,modalidade
	,motivo
	,numDoc
	,SEGMENTO
	,servico
	,situacao
	,submotivo
	,TERMINAL
	,tipoAtendimento
	,Dt_Instalacao
	,[DATA CRIAÇÃO]
	,[DATA FINALIZAÇÃO]
	,CASE WHEN PRAZO IS NULL AND DATEDIFF (DAY,DT_INSTALACAO, dataRegistroSolicitacao)<=30 THEN 'MENOR 30D' 
	WHEN PRAZO IS NULL AND DATEDIFF (DAY,DT_INSTALACAO, dataRegistroSolicitacao)>30 
	AND DATEDIFF (DAY,DT_INSTALACAO, dataRegistroSolicitacao)<=60 THEN 'DE 30 A 60D' 
	WHEN PRAZO IS NULL AND DATEDIFF (DAY,DT_INSTALACAO, dataRegistroSolicitacao)>60 AND DATEDIFF (DAY,DT_INSTALACAO, dataRegistroSolicitacao)<=90 THEN 'DE 60 A 90D'
	WHEN PRAZO IS NULL AND DATEDIFF (DAY,DT_INSTALACAO, dataRegistroSolicitacao)>90 THEN 'MAIOR 90D' ELSE PRAZO END PRAZO
	,MONTH (dataRegistroSolicitacao) MÊS
INTO XXX
FROM XXX

SELECT * FROM XXX
