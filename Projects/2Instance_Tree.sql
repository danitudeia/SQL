/**************RECLAMA��ES ANATEL DTH*****************/

DROP TABLE XXX
SELECT
	CODSOLICITACAO
	,DATAREGISTROSOLICITACAO
	,ANO
	,OBSERVACAO
	,MONTH(DATAREGISTROSOLICITACAO) AS MES
	,DATEPART (WEEK, DATAREGISTROSOLICITACAO) AS SEMANA
	,CASE WHEN motivo = 'Cobran�a' AND CATEGORIA = 'ENVIO AP�S CANCELAMENTO DO SERVI�O' THEN 'CANCELAMENTO' 
	WHEN MOTIVO = 'CANCELAMENTO' THEN 'CANCELAMENTO'
	WHEN MOTIVO = 'ATENDIMENTO' THEN 'ATENDIMENTO'
	WHEN MOTIVO LIKE 'REPARO' THEN 'REPARO'
	WHEN MOTIVO LIKE 'Programa��o' THEN 'PROGRAMA��O'
	WHEN MOTIVO IN ('Bloqueio','Inclus�o no SPC/Serasa','Servi�os Adicionais') THEN 'CONTAS'
	WHEN MOTIVO = 'Cobran�a' AND  CATEGORIA <> 'ENVIO AP�S CANCELAMENTO DO SERVI�O' THEN 'CONTAS'
	WHEN motivo IN ('Instala��o','Instala��o de Acessos Individuais','Prestadoras') THEN 'INSTALA��O' ELSE 'OUTROS' END MOTIVO
	,SUBMOTIVO
	,CASE WHEN CPFUSUARIO = '' THEN CNPJUSUARIO ELSE CPFUSUARIO END CA_DOC
	,CASE WHEN TERMINAL = '' THEN FONECONTATO1 ELSE DDD+TERMINAL END TELEFONE
	,CASE WHEN SUBSTRING(SEGMENTO,1,1) IN (5,6) THEN 'RES' ELSE 'NRES' END SEGMENTO
	,B.CN_ID_ASSINATURA
	,B.CN_ASSINANTE
	,A.CNL
	,A.TERMINAL
	,A.cpfUsuario
	,ROW_NUMBER () OVER (PARTITION BY CODSOLICITACAO ORDER BY CN_ID_ASSINATURA) AS REP
INTO XXX
FROM XXX A
LEFT JOIN DVG_PLANTA_DTH B
ON ((A.TERMINAL <> '' AND A.DDD+TERMINAL = CONVERT(VARCHAR,B.NM_DDD_RES)+CONVERT(VARCHAR,B.NM_TEL_RES)) 
OR (A.TERMINAL = '' AND A.FONECONTATO1 = CONVERT(VARCHAR,B.NM_DDD_RES)+CONVERT(VARCHAR,B.NM_TEL_RES))
OR (A.CPFUSUARIO <> '' AND A.CPFUSUARIO = B.CA_DOC) OR (A.CPFUSUARIO = '' AND A.CNPJUSUARIO = B.CA_DOC))
WHERE DATAREGISTROSOLICITACAO BETWEEN '2013-07-01' AND '2013-11-30'
AND RECLAMADO ='XXX'


/**************TRATA BASE OS***********/
--DROP TABLE XXX
--SELECT 
--	A.*
--	,B.DT_BAIXA
--	,C.DT_BAIXA AS DT_CANC
--INTO XXX
--FROM XXX A
--LEFT JOIN (select * from XXX WHERE DT_ABERT >='01/06/13') B
--ON A.NM_SEQ_OS_fiscal = B.NM_SEQ_OS_FISCAL
--LEFT JOIN (select * from XXX WHERE DT_ABERT >='01/06/13')  C
--ON A.NM_SEQ_OS_fiscal = C.NM_SEQ_OS_FISCAL
--WHERE A.DT_ABERT >='2013-06-01'


DROP TABLE XXX
SELECT 
	A.*
	,B.DT_BAIXA
	,C.DT_BAIXA AS DT_CANC
INTO XXX
FROM XXX A
LEFT JOIN XXX B
ON A.NM_SEQ_OS = B.NM_SEQ_OS
LEFT JOIN XXX  C
ON A.NM_SEQ_OS = C.NM_SEQ_OS
WHERE A.DT_ABERT >='2013-10-01'


/**************RECORTE BASE PLATAFORMA***********/
DROP TABLE XXX
SELECT *
INTO XXX
FROM XXX
WHERE S_ASSUNTOSEC = 'TV' AND D_DATA >='2013-06-01'

/*************ABERTURA REPARO**********/

DROP TABLE XXX
SELECT 
	A.*

	----------MOMENTO BD EMITIDO-----------	

		,CASE WHEN EXISTS (SELECT (1) FROM XXX B 
		WHERE B.CA_TP_OS = 'AT'
		AND	((B.DT_BAIXA IS NOT NULL AND A.DATAREGISTROSOLICITACAO BETWEEN B.DT_ABERT AND B.DT_BAIXA)
		OR (B.DT_CANC IS NOT NULL AND A.DATAREGISTROSOLICITACAO BETWEEN B.DT_ABERT AND B.DT_CANC)
		OR (A.DATAREGISTROSOLICITACAO >= B.DT_ABERT AND  B.DT_BAIXA IS NULL AND B.DT_CANC IS NULL))
		AND A.CN_ID_ASSINATURA = B.CN_ID_ASSINATURA) THEN '1' ELSE '0' END BD_ABERTO	
		
		,CASE WHEN EXISTS (SELECT (1) FROM XXX B 
		WHERE B.CA_TP_OS = 'AT' AND (B.DT_BAIXA IS NOT NULL OR B.DT_CANC IS NOT NULL) AND 
		((B.DT_BAIXA IS NOT NULL AND DATEDIFF(DAY,B.DT_BAIXA,A.DATAREGISTROSOLICITACAO) BETWEEN '1' AND '3')
		OR (B.DT_CANC IS NOT NULL AND DATEDIFF(DAY,B.DT_CANC,A.DATAREGISTROSOLICITACAO) BETWEEN '1' AND '3')) 
		AND A.CN_ID_ASSINATURA = B.CN_ID_ASSINATURA) THEN '1' ELSE '0' END BD_ENCERRADO	
		
			,CASE WHEN EXISTS (SELECT (1) FROM XXX B 
		WHERE B.CA_TP_OS = 'AT' AND(B.DT_BAIXA IS NOT NULL OR B.DT_CANC IS NOT NULL) AND 
		((B.DT_BAIXA IS NOT NULL AND DATEDIFF(DAY,B.DT_BAIXA,A.DATAREGISTROSOLICITACAO) BETWEEN '4' AND '30')
		OR (B.DT_CANC IS NOT NULL AND DATEDIFF(DAY,B.DT_CANC,A.DATAREGISTROSOLICITACAO) BETWEEN '4' AND '30')) 
		AND A.CN_ID_ASSINATURA = B.CN_ID_ASSINATURA) THEN '1' ELSE '0' END BD_ENCERRADO_30D
		
	---------CUMPRIMENTO 1� AGENDA------
		
		,CASE WHEN EXISTS (SELECT (1) FROM XXX B 
		WHERE B.CA_TP_OS = 'AT' AND
		((B.DT_BAIXA IS NOT NULL AND A.DATAREGISTROSOLICITACAO BETWEEN B.DT_ABERT AND B.DT_BAIXA)
		OR (B.DT_CANC IS NOT NULL AND A.DATAREGISTROSOLICITACAO BETWEEN B.DT_ABERT AND B.DT_CANC)
		OR (A.DATAREGISTROSOLICITACAO >= B.DT_ABERT AND  B.DT_BAIXA IS NULL AND B.DT_CANC IS NULL)) 
		AND A.CN_ID_ASSINATURA = B.CN_ID_ASSINATURA AND A.dataRegistroSolicitacao <= B.DT_PRIM_AGENDA) THEN '1' ELSE '0' END BD_ABERTO_PRIM_AG	
		
		,CASE WHEN EXISTS (SELECT (1) FROM XXX B 
		WHERE B.CA_TP_OS = 'AT' AND (B.DT_BAIXA IS NOT NULL OR B.DT_CANC IS NOT NULL) AND 
		((B.DT_BAIXA IS NOT NULL AND DATEDIFF(DAY,B.DT_BAIXA,A.DATAREGISTROSOLICITACAO) BETWEEN '1' AND '3')
		OR (B.DT_CANC IS NOT NULL AND DATEDIFF(DAY,B.DT_CANC,A.DATAREGISTROSOLICITACAO) BETWEEN '1' AND '3')) 
		AND A.CN_ID_ASSINATURA = B.CN_ID_ASSINATURA  AND B.DT_BAIXA <= B.DT_PRIM_AGENDA) THEN '1' ELSE '0' END BD_ENCERRADO_PRIM_AG	
		
		,CASE WHEN EXISTS (SELECT (1) FROM XXX B 
		WHERE B.CA_TP_OS = 'AT' AND(B.DT_BAIXA IS NOT NULL OR B.DT_CANC IS NOT NULL) AND 
		((B.DT_BAIXA IS NOT NULL AND DATEDIFF(DAY,B.DT_BAIXA,A.DATAREGISTROSOLICITACAO) BETWEEN '4' AND '30')
		OR (B.DT_CANC IS NOT NULL AND DATEDIFF(DAY,B.DT_CANC,A.DATAREGISTROSOLICITACAO) BETWEEN '4' AND '30')) 
		AND A.CN_ID_ASSINATURA = B.CN_ID_ASSINATURA  AND B.DT_BAIXA <= B.DT_PRIM_AGENDA) THEN '1' ELSE '0' END BD_ENCERRADO_30D_PRIM_AG	

	-------PRAZO 72H----------

		,CASE WHEN EXISTS (SELECT (1) FROM XXX B 
		WHERE B.CA_TP_OS = 'AT' AND
		((B.DT_BAIXA IS NOT NULL AND A.DATAREGISTROSOLICITACAO BETWEEN B.DT_ABERT AND B.DT_BAIXA)
		OR (B.DT_CANC IS NOT NULL AND A.DATAREGISTROSOLICITACAO BETWEEN B.DT_ABERT AND B.DT_CANC)
		OR (A.DATAREGISTROSOLICITACAO >= B.DT_ABERT AND  B.DT_BAIXA IS NULL AND B.DT_CANC IS NULL)) 
		AND A.CN_ID_ASSINATURA = B.CN_ID_ASSINATURA AND DATEDIFF(HOUR,B.DT_ABERT, A.DATAREGISTROSOLICITACAO) <='72') THEN '1' ELSE '0' END BD_ABERTO_PRAZO72H
		
		,CASE WHEN EXISTS (SELECT (1) FROM XXX B 
		WHERE B.CA_TP_OS = 'AT' AND (B.DT_BAIXA IS NOT NULL OR B.DT_CANC IS NOT NULL) AND 
		((B.DT_BAIXA IS NOT NULL AND DATEDIFF(DAY,B.DT_BAIXA,A.DATAREGISTROSOLICITACAO) BETWEEN '1' AND '3')
		OR (B.DT_CANC IS NOT NULL AND DATEDIFF(DAY,B.DT_CANC,A.DATAREGISTROSOLICITACAO) BETWEEN '1' AND '3')) 
		AND A.CN_ID_ASSINATURA = B.CN_ID_ASSINATURA AND ((B.DT_BAIXA IS NOT NULL AND DATEDIFF(HOUR,B.DT_ABERT,B.DT_BAIXA) <='72')
		OR (DT_CANC IS NOT NULL AND DATEDIFF(HOUR,B.DT_ABERT, B.DT_CANC) >'72'))) THEN '1' ELSE '0' END BD_ENCERRADO_PRAZO72H	
		
		,CASE WHEN EXISTS (SELECT (1) FROM XXX B 
		WHERE B.CA_TP_OS = 'AT' AND (B.DT_BAIXA IS NOT NULL OR B.DT_CANC IS NOT NULL) AND 
		((B.DT_BAIXA IS NOT NULL AND DATEDIFF(DAY,B.DT_BAIXA,A.DATAREGISTROSOLICITACAO) BETWEEN '4' AND '30')
		OR (B.DT_CANC IS NOT NULL AND DATEDIFF(DAY,B.DT_CANC,A.DATAREGISTROSOLICITACAO) BETWEEN '4' AND '30')) 
		AND A.CN_ID_ASSINATURA = B.CN_ID_ASSINATURA AND ((B.DT_BAIXA IS NOT NULL AND DATEDIFF(HOUR,B.DT_ABERT,B.DT_BAIXA) <='72')
		OR (DT_CANC IS NOT NULL AND DATEDIFF(HOUR,B.DT_ABERT, B.DT_CANC) >'72'))) THEN '1' ELSE '0' END BD_ENCERRADO_30D_PRAZO72H
		
	------REAGENDAMENTO--------	

		,CASE WHEN EXISTS (SELECT (1) FROM XXX B 
		WHERE B.CA_TP_OS = 'AT' AND
		((B.DT_BAIXA IS NOT NULL AND A.DATAREGISTROSOLICITACAO BETWEEN B.DT_ABERT AND B.DT_BAIXA)
		OR (B.DT_CANC IS NOT NULL AND A.DATAREGISTROSOLICITACAO BETWEEN B.DT_ABERT AND B.DT_CANC)
		OR (A.DATAREGISTROSOLICITACAO >= B.DT_ABERT AND  B.DT_BAIXA IS NULL AND B.DT_CANC IS NULL)) 
		AND A.CN_ID_ASSINATURA = B.CN_ID_ASSINATURA AND B.QT_AGENDAMENTOS <>'1') THEN '1' ELSE '0' END BD_ABERTO_REAGEND

		,CASE WHEN EXISTS (SELECT (1) FROM XXX B 
		WHERE B.CA_TP_OS = 'AT' AND (B.DT_BAIXA IS NOT NULL OR B.DT_CANC IS NOT NULL) AND 
		((B.DT_BAIXA IS NOT NULL AND DATEDIFF(DAY,B.DT_BAIXA,A.DATAREGISTROSOLICITACAO) BETWEEN '1' AND '3')
		OR (B.DT_CANC IS NOT NULL AND DATEDIFF(DAY,B.DT_CANC,A.DATAREGISTROSOLICITACAO) BETWEEN '1' AND '3')) 
		AND A.CN_ID_ASSINATURA = B.CN_ID_ASSINATURA AND B.QT_AGENDAMENTOS <>'1') THEN '1' ELSE '0' END BD_ENCERRADO_REAG	
		
		,CASE WHEN EXISTS (SELECT (1) FROM XXX B 
		WHERE B.CA_TP_OS = 'AT' AND (B.DT_BAIXA IS NOT NULL OR B.DT_CANC IS NOT NULL) AND 
		((B.DT_BAIXA IS NOT NULL AND DATEDIFF(DAY,B.DT_BAIXA,A.DATAREGISTROSOLICITACAO) BETWEEN '4' AND '30')
		OR (B.DT_CANC IS NOT NULL AND DATEDIFF(DAY,B.DT_CANC,A.DATAREGISTROSOLICITACAO) BETWEEN '4' AND '30')) 
		AND A.CN_ID_ASSINATURA = B.CN_ID_ASSINATURA AND B.QT_AGENDAMENTOS <>'1') THEN '1' ELSE '0' END BD_ENCERRADO_30D_REAG		
		
	-------CONTROLE REMOTO--------
		
		,CASE WHEN EXISTS (SELECT (1) FROM XXX B WHERE B.CA_FILA IN ('ATCR') AND
		((B.DT_ENCERRAMENTO IS NOT NULL AND A.DATAREGISTROSOLICITACAO BETWEEN CONVERT(DATETIME,B.DT_CRIACAO) AND CONVERT(DATETIME,B.DT_ENCERRAMENTO))
		OR (A.DATAREGISTROSOLICITACAO >= CONVERT(DATETIME,B.DT_CRIACAO) AND  B.DT_ENCERRAMENTO IS NULL )) 
		AND A.CN_ID_ASSINATURA = B.CN_ID_ASSINATURA) THEN '1' ELSE '0' END OSI_ABERTA_CONTR
		
		,CASE WHEN EXISTS (SELECT (1) FROM XXX C WHERE C.CA_FILA IN ('ATCR') AND
		C.DT_ENCERRAMENTO IS NOT NULL AND DATEDIFF (DAY,C.DT_ENCERRAMENTO, A.DATAREGISTROSOLICITACAO) BETWEEN '1' AND '7'
		AND A.CN_ID_ASSINATURA = C.CN_ID_ASSINATURA) THEN '1' ELSE '0' END OSI_7D_ANTES_CONTR
		
		,CASE WHEN EXISTS (SELECT (1) FROM XXX C WHERE C.CA_FILA IN ('ATCR') AND
		C.DT_ENCERRAMENTO IS NOT NULL AND DATEDIFF (DAY,C.DT_ENCERRAMENTO, A.DATAREGISTROSOLICITACAO) BETWEEN '8' AND '30'
		AND A.CN_ID_ASSINATURA = C.CN_ID_ASSINATURA) THEN '1' ELSE '0' END OSI_30D_ANTES_CONTR
		
		,CASE WHEN CN_ID_ASSINATURA IS NOT NULL THEN '1' ELSE '0' END ASSINATURA_VALIDA
			
	--INTO XXX
	FROM XXX A
	WHERE A.MOTIVO = 'REPARO'
	AND A.REP = '1' and MONTH(A.DATAREGISTROSOLICITACAO) = '11'
	ORDER BY CODSOLICITACAO
	
	select * from XXX

/***********ABERTURA INSTALACAO***********/

--DROP TABLE XXX
SELECT 
	A.*

	----------MOMENTO OS EMITIDA-----------	

		,CASE WHEN EXISTS (SELECT (1) FROM XXX B 
		WHERE B.CA_SERV_OS IN ('IDDG','IDHD')
		AND	((B.DT_BAIXA IS NOT NULL AND A.DATAREGISTROSOLICITACAO BETWEEN B.DT_ABERT AND B.DT_BAIXA)
		OR (B.DT_CANC IS NOT NULL AND A.DATAREGISTROSOLICITACAO BETWEEN B.DT_ABERT AND B.DT_CANC)
		OR (A.DATAREGISTROSOLICITACAO >= B.DT_ABERT AND  B.DT_BAIXA IS NULL AND B.DT_CANC IS NULL))
		AND A.CN_ID_ASSINATURA = B.CN_ID_ASSINATURA) THEN '1' ELSE '0' END OS_ABERTA	
		
		,CASE WHEN EXISTS (SELECT (1) FROM XXX B 
		WHERE B.CA_SERV_OS IN ('IDDG','IDHD') AND (B.DT_BAIXA IS NOT NULL OR B.DT_CANC IS NOT NULL) AND 
		((B.DT_BAIXA IS NOT NULL AND DATEDIFF(DAY,B.DT_BAIXA,A.DATAREGISTROSOLICITACAO) BETWEEN '1' AND '3')
		OR (B.DT_CANC IS NOT NULL AND DATEDIFF(DAY,B.DT_CANC,A.DATAREGISTROSOLICITACAO) BETWEEN '1' AND '3')) 
		AND A.CN_ID_ASSINATURA = B.CN_ID_ASSINATURA) THEN '1' ELSE '0' END OS_ENCERRADA
		
		,CASE WHEN EXISTS (SELECT (1) FROM XXX B 
		WHERE B.CA_SERV_OS IN ('IDDG','IDHD')AND(B.DT_BAIXA IS NOT NULL OR B.DT_CANC IS NOT NULL) AND 
		((B.DT_BAIXA IS NOT NULL AND DATEDIFF(DAY,B.DT_BAIXA,A.DATAREGISTROSOLICITACAO) BETWEEN '4' AND '30')
		OR (B.DT_CANC IS NOT NULL AND DATEDIFF(DAY,B.DT_CANC,A.DATAREGISTROSOLICITACAO) BETWEEN '4' AND '30')) 
		AND A.CN_ID_ASSINATURA = B.CN_ID_ASSINATURA) THEN '1' ELSE '0' END OS_ENCERRADA_30D
		
	---------CUMPRIMENTO 1� AGENDA------
		
		,CASE WHEN EXISTS (SELECT (1) FROM XXX B 
		WHERE B.CA_SERV_OS IN ('IDDG','IDHD') AND
		((B.DT_BAIXA IS NOT NULL AND A.DATAREGISTROSOLICITACAO BETWEEN B.DT_ABERT AND B.DT_BAIXA)
		OR (B.DT_CANC IS NOT NULL AND A.DATAREGISTROSOLICITACAO BETWEEN B.DT_ABERT AND B.DT_CANC)
		OR (A.DATAREGISTROSOLICITACAO >= B.DT_ABERT AND  B.DT_BAIXA IS NULL AND B.DT_CANC IS NULL)) 
		AND A.CN_ID_ASSINATURA = B.CN_ID_ASSINATURA AND A.dataRegistroSolicitacao <= B.DT_PRIM_AGENDA) THEN '1' ELSE '0' END OS_ABERTA_PRIM_AG	
		
		,CASE WHEN EXISTS (SELECT (1) FROM XXX B 
		WHERE B.CA_SERV_OS IN ('IDDG','IDHD') AND (B.DT_BAIXA IS NOT NULL OR B.DT_CANC IS NOT NULL) AND 
		((B.DT_BAIXA IS NOT NULL AND DATEDIFF(DAY,B.DT_BAIXA,A.DATAREGISTROSOLICITACAO) BETWEEN '1' AND '3')
		OR (B.DT_CANC IS NOT NULL AND DATEDIFF(DAY,B.DT_CANC,A.DATAREGISTROSOLICITACAO) BETWEEN '1' AND '3')) 
		AND A.CN_ID_ASSINATURA = B.CN_ID_ASSINATURA  AND B.DT_BAIXA <= B.DT_PRIM_AGENDA) THEN '1' ELSE '0' END OS_ENCERRADA_PRIM_AG	
		
		,CASE WHEN EXISTS (SELECT (1) FROM XXX B 
		WHERE B.CA_SERV_OS IN ('IDDG','IDHD') AND(B.DT_BAIXA IS NOT NULL OR B.DT_CANC IS NOT NULL) AND 
		((B.DT_BAIXA IS NOT NULL AND DATEDIFF(DAY,B.DT_BAIXA,A.DATAREGISTROSOLICITACAO) BETWEEN '4' AND '30')
		OR (B.DT_CANC IS NOT NULL AND DATEDIFF(DAY,B.DT_CANC,A.DATAREGISTROSOLICITACAO) BETWEEN '4' AND '30')) 
		AND A.CN_ID_ASSINATURA = B.CN_ID_ASSINATURA  AND B.DT_BAIXA <= B.DT_PRIM_AGENDA) THEN '1' ELSE '0' END OS_ENCERRADA_30D_PRIM_AG	

	-------PRAZO 72H----------

		,CASE WHEN EXISTS (SELECT (1) FROM XXX B 
		WHERE B.CA_SERV_OS IN ('IDDG','IDHD')AND
		((B.DT_BAIXA IS NOT NULL AND A.DATAREGISTROSOLICITACAO BETWEEN B.DT_ABERT AND B.DT_BAIXA)
		OR (B.DT_CANC IS NOT NULL AND A.DATAREGISTROSOLICITACAO BETWEEN B.DT_ABERT AND B.DT_CANC)
		OR (A.DATAREGISTROSOLICITACAO >= B.DT_ABERT AND  B.DT_BAIXA IS NULL AND B.DT_CANC IS NULL)) 
		AND A.CN_ID_ASSINATURA = B.CN_ID_ASSINATURA AND DATEDIFF(HOUR,B.DT_ABERT, A.DATAREGISTROSOLICITACAO) <='72') THEN '1' ELSE '0' END OS_ABERTA_PRAZO72H
		
		,CASE WHEN EXISTS (SELECT (1) FROM XXX B 
		WHERE B.CA_SERV_OS IN ('IDDG','IDHD') AND (B.DT_BAIXA IS NOT NULL OR B.DT_CANC IS NOT NULL) AND 
		((B.DT_BAIXA IS NOT NULL AND DATEDIFF(DAY,B.DT_BAIXA,A.DATAREGISTROSOLICITACAO) BETWEEN '1' AND '3')
		OR (B.DT_CANC IS NOT NULL AND DATEDIFF(DAY,B.DT_CANC,A.DATAREGISTROSOLICITACAO) BETWEEN '1' AND '3')) 
		AND A.CN_ID_ASSINATURA = B.CN_ID_ASSINATURA AND ((B.DT_BAIXA IS NOT NULL AND DATEDIFF(HOUR,B.DT_ABERT,B.DT_BAIXA) <='72')
		OR (DT_CANC IS NOT NULL AND DATEDIFF(HOUR,B.DT_ABERT, B.DT_CANC) >'72'))) THEN '1' ELSE '0' END OS_ENCERRADA_PRAZO72H	
		
		,CASE WHEN EXISTS (SELECT (1) FROM XXX B 
		WHERE B.CA_SERV_OS IN ('IDDG','IDHD') AND (B.DT_BAIXA IS NOT NULL OR B.DT_CANC IS NOT NULL) AND 
		((B.DT_BAIXA IS NOT NULL AND DATEDIFF(DAY,B.DT_BAIXA,A.DATAREGISTROSOLICITACAO) BETWEEN '4' AND '30')
		OR (B.DT_CANC IS NOT NULL AND DATEDIFF(DAY,B.DT_CANC,A.DATAREGISTROSOLICITACAO) BETWEEN '4' AND '30')) 
		AND A.CN_ID_ASSINATURA = B.CN_ID_ASSINATURA AND ((B.DT_BAIXA IS NOT NULL AND DATEDIFF(HOUR,B.DT_ABERT,B.DT_BAIXA) <='72')
		OR (DT_CANC IS NOT NULL AND DATEDIFF(HOUR,B.DT_ABERT, B.DT_CANC) >'72'))) THEN '1' ELSE '0' END OS_ENCERRADA_30D_PRAZO72H
		
	------REAGENDAMENTO--------	

		,CASE WHEN EXISTS (SELECT (1) FROM DVXXXG_DTH_OS B 
		WHERE B.CA_SERV_OS IN ('IDDG','IDHD') AND
		((B.DT_BAIXA IS NOT NULL AND A.DATAREGISTROSOLICITACAO BETWEEN B.DT_ABERT AND B.DT_BAIXA)
		OR (B.DT_CANC IS NOT NULL AND A.DATAREGISTROSOLICITACAO BETWEEN B.DT_ABERT AND B.DT_CANC)
		OR (A.DATAREGISTROSOLICITACAO >= B.DT_ABERT AND  B.DT_BAIXA IS NULL AND B.DT_CANC IS NULL)) 
		AND A.CN_ID_ASSINATURA = B.CN_ID_ASSINATURA AND B.QT_AGENDAMENTOS <>'1') THEN '1' ELSE '0' END OS_ABERTA_REAGEND

		,CASE WHEN EXISTS (SELECT (1) FROM XXX B 
		WHERE B.CA_SERV_OS IN ('IDDG','IDHD') AND (B.DT_BAIXA IS NOT NULL OR B.DT_CANC IS NOT NULL) AND 
		((B.DT_BAIXA IS NOT NULL AND DATEDIFF(DAY,B.DT_BAIXA,A.DATAREGISTROSOLICITACAO) BETWEEN '1' AND '3')
		OR (B.DT_CANC IS NOT NULL AND DATEDIFF(DAY,B.DT_CANC,A.DATAREGISTROSOLICITACAO) BETWEEN '1' AND '3')) 
		AND A.CN_ID_ASSINATURA = B.CN_ID_ASSINATURA AND B.QT_AGENDAMENTOS <>'1') THEN '1' ELSE '0' END OS_ENCERRADA_REAG	
		
		,CASE WHEN EXISTS (SELECT (1) FROM XXX B 
		WHERE B.CA_SERV_OS IN ('IDDG','IDHD') AND (B.DT_BAIXA IS NOT NULL OR B.DT_CANC IS NOT NULL) AND 
		((B.DT_BAIXA IS NOT NULL AND DATEDIFF(DAY,B.DT_BAIXA,A.DATAREGISTROSOLICITACAO) BETWEEN '4' AND '30')
		OR (B.DT_CANC IS NOT NULL AND DATEDIFF(DAY,B.DT_CANC,A.DATAREGISTROSOLICITACAO) BETWEEN '4' AND '30')) 
		AND A.CN_ID_ASSINATURA = B.CN_ID_ASSINATURA AND B.QT_AGENDAMENTOS <>'1') THEN '1' ELSE '0' END OS_ENCERRADA_30D_REAG	
		
		,CASE WHEN CN_ID_ASSINATURA IS NOT NULL THEN '1' ELSE '0' END ASSINATURA_VALIDA	
					
	--INTO XXX
	FROM XXX A
	WHERE A.MOTIVO = 'INSTALA��O' and MONTH(A.DATAREGISTROSOLICITACAO) = '11'
	AND A.REP = '1'
	ORDER BY CODSOLICITACAO
	
/************ABERTURA CANCELAMENTO**********/

DROP TABLE XXX
SELECT 
	A.*

	----------MOMENTO E CANAL CONTATO-----------	
		,CASE WHEN EXISTS (SELECT (1) FROM XXX B 
		WHERE A.TELEFONE = B.TERMINAL_INFORMADO AND B.S_ASSUNTOSEC = 'TV'
		AND  N_DIALOGO = '2'
		AND S_ASSUNTO = 'CANCELAMENTO' AND DATEDIFF (DAY, B.D_DATA, A.DATAREGISTROSOLICITACAO) BETWEEN 0 AND 7) THEN '1' ELSE '0' END CANC_CHAM_7D

		,CASE WHEN EXISTS (SELECT (1) FROM XXX B 
		WHERE A.TELEFONE = B.TERMINAL_INFORMADO AND B.S_ASSUNTOSEC = 'TV'
		AND B.S_MCDU NOT IN ('XXX') AND N_DIALOGO = '2'
		AND S_ASSUNTO = 'CANCELAMENTO' AND DATEDIFF (DAY, B.D_DATA, A.DATAREGISTROSOLICITACAO) BETWEEN 0 AND 7) THEN '1' ELSE '0' END CANC_CHAM_RETEN��O_7D
		
		,CASE WHEN CN_ID_ASSINATURA IS NOT NULL THEN '1' ELSE '0' END ASSINATURA_VALIDA
					
	INTO XXX
	FROM XXX A
	WHERE A.MOTIVO = 'CANCELAMENTO'
	AND A.REP = '1'
	ORDER BY CODSOLICITACAO
	
	
/------------ABERTURA CONTAS------------/
	
--DROP TABLE XXX
SELECT 
	A.*

	----------MOMENTO E CANAL CONTATO-----------	

		,CASE WHEN EXISTS (SELECT (1) FROM XXX B 
		WHERE A.CN_ID_ASSINATURA = B.CN_ID_ASSINATURA
		AND DATEDIFF (DAY, B.DT_ATEND, A.DATERGISTROSOLICITACAO) BETWEEN 0 AND 3) THEN '1' ELSE '0' END CONTAS_CHAM_1D
	
	------------OSI EM ABERTO/ENCERRADA------------
		
		,CASE WHEN EXISTS (SELECT (1) FROM XXX B WHERE B.CA_FILA IN ('BKO') AND
		((B.DT_ENCERRAMENTO IS NOT NULL AND A.DATAREGISTROSOLICITACAO BETWEEN CONVERT(DATETIME,B.DT_CRIACAO) AND CONVERT(DATETIME,B.DT_ENCERRAMENTO))
		OR (A.DATAREGISTROSOLICITACAO >= CONVERT(DATETIME,B.DT_CRIACAO) AND  B.DT_ENCERRAMENTO IS NULL )) 
		AND A.CN_ID_ASSINATURA = B.CN_ID_ASSINATURA) THEN '1' ELSE '0' END CONTAS_OSI_ABERTA_CONTR
		
		,CASE WHEN EXISTS (SELECT (1) FROM XXX C WHERE C.CA_FILA  IN ('BKO') AND
		C.DT_ENCERRAMENTO IS NOT NULL AND DATEDIFF (DAY,C.DT_ENCERRAMENTO, A.DATAREGISTROSOLICITACAO) BETWEEN '0' AND '7'
		AND A.CN_ID_ASSINATURA = C.CN_ID_ASSINATURA) THEN '1' ELSE '0' END CONTAS_OSI_7D_ANTES_CONTR
					
	--INTO XXX
	FROM XXX A
	WHERE A.MOTIVO = 'CONTAS'
	AND A.REP = '1'
	ORDER BY CODSOLICITACAO