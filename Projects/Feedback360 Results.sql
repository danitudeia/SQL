

/****AGRUPAMENTO  DE NOTAS POR COLABORADOR*****/
DROP TABLE DVG_REPORT_2
SELECT 
	[Por que voc� est� respondendo ao question�rio?] as TIPO
	,[Quem voc� est� avaliando?] AS NOME
	,[Qual � o cargo de quem voc� est� avaliando?] AS CARGO
	,AVG (CONVERT(FLOAT,REPLACE([Conhecimento T�cnico],',','.'))) [Conhecimento T�cnico]
	,AVG (CONVERT(FLOAT,REPLACE([Capacidade Anal�tica],',','.'))) [Capacidade Anal�tica]
	,AVG (CONVERT(FLOAT,REPLACE([Habilidade em Organiza��o],',','.'))) [Habilidade em Organiza��o]
	,AVG (CONVERT(FLOAT,REPLACE([Habilidade de Comunica��o],',','.'))) [Habilidade de Comunica��o]
	,AVG (CONVERT(FLOAT,REPLACE([Capacidade de Autodesenvolvimento],',','.'))) [Capacidade de Autodesenvolvimento]
	,AVG (CONVERT(FLOAT,REPLACE([Equil�brio],',','.'))) [Equil�brio]
	,AVG (CONVERT(FLOAT,REPLACE([Habilidade de Relacionamento],',','.'))) [Habilidade de Relacionamento]
	,AVG (CONVERT(FLOAT,REPLACE([Iniciativa],',','.'))) [Iniciativa]
	,AVG (CONVERT(FLOAT,REPLACE([Capacidade de Concentra��o],',','.'))) [Capacidade de Concentra��o]
	,AVG (CONVERT(FLOAT,REPLACE([Flexibilidade],',','.'))) [Flexibilidade]
	,AVG (CONVERT(FLOAT,REPLACE([Capacidade de Intera��o],',','.'))) [Capacidade de Intera��o]
	,AVG (CONVERT(FLOAT,REPLACE([Poder de Influ�ncia],',','.'))) [Poder de Influ�ncia]
	,AVG (CONVERT(FLOAT,REPLACE([Habilidade em Motiva��o],',','.'))) [Habilidade em Motiva��o]
	,AVG (CONVERT(FLOAT,REPLACE([Busca por Orienta��o],',','.'))) [Busca por Orienta��o]
	,AVG (CONVERT(FLOAT,REPLACE([Foco em Supera��o],',','.'))) [Foco em Supera��o]
	,AVG (CONVERT(FLOAT,REPLACE([Interesse pela Vivo],',','.'))) [Interesse pela Vivo]
	,AVG (CONVERT(FLOAT,REPLACE([Principios DNA Vivo],',','.'))) [Principios DNA Vivo]
INTO DVG_REPORT_2
FROM DVG_REPORT
WHERE [Data do Feedback ou Autoavalia��o] > = '01/06/2021'
GROUP BY 
	[Por que voc� est� respondendo ao question�rio?] 
	,[Quem voc� est� avaliando?]
	,[Qual � o cargo de quem voc� est� avaliando?]


/****AFERI��O DAS AVALIA��ES*****/
SELECT
	NOME
	,CARGO
	,TIPO

---CONHECIMENTO T�CNICO
	,CASE 
		WHEN CARGO = 'Estagi�rio' AND [Conhecimento T�cnico] <1 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Junior' AND [Conhecimento T�cnico] <2 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Pleno' AND [Conhecimento T�cnico] <3 THEN 'ABAIXO'
		WHEN CARGO = 'Analista S�nior' AND [Conhecimento T�cnico] <3 THEN 'ABAIXO'
		WHEN CARGO = 'Consultor / Trainee' AND [Conhecimento T�cnico] <5 THEN 'ABAIXO'
		WHEN CARGO = 'Estagi�rio' AND [Conhecimento T�cnico] =1 THEN 'DENTRO'
		WHEN CARGO = 'Analista Junior' AND [Conhecimento T�cnico] =2 THEN 'DENTRO'
		WHEN CARGO = 'Analista Pleno' AND [Conhecimento T�cnico] =3 THEN 'DENTRO'
		WHEN CARGO = 'Analista S�nior' AND [Conhecimento T�cnico] =3 THEN 'DENTRO'
		WHEN CARGO = 'Consultor / Trainee' AND [Conhecimento T�cnico] =5 THEN 'DENTRO'	
		WHEN CARGO = 'Estagi�rio' AND [Conhecimento T�cnico] >1 THEN 'ACIMA'
		WHEN CARGO = 'Analista Junior' AND [Conhecimento T�cnico] >2 THEN 'ACIMA'
		WHEN CARGO = 'Analista Pleno' AND [Conhecimento T�cnico] >3 THEN 'ACIMA'
		WHEN CARGO = 'Analista S�nior' AND [Conhecimento T�cnico] >3 THEN 'ACIMA'
		WHEN CARGO = 'Consultor / Trainee' AND [Conhecimento T�cnico] >5 THEN 'ACIMA' ELSE NULL END CONHECIMENTO_TECNICO	

---CAPACIDADE ANAL�TICA
	,CASE 
		WHEN CARGO = 'Estagi�rio' AND [Capacidade Anal�tica] <2 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Junior' AND [Capacidade Anal�tica] <2 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Pleno' AND [Capacidade Anal�tica] <2 THEN 'ABAIXO'
		WHEN CARGO = 'Analista S�nior' AND [Capacidade Anal�tica] <4 THEN 'ABAIXO'
		WHEN CARGO = 'Consultor / Trainee' AND [Capacidade Anal�tica] <5 THEN 'ABAIXO'
		WHEN CARGO = 'Estagi�rio' AND [Capacidade Anal�tica] =2 THEN 'DENTRO'
		WHEN CARGO = 'Analista Junior' AND [Capacidade Anal�tica] =2 THEN 'DENTRO'
		WHEN CARGO = 'Analista Pleno' AND [Capacidade Anal�tica] =2 THEN 'DENTRO'
		WHEN CARGO = 'Analista S�nior' AND [Capacidade Anal�tica] =4 THEN 'DENTRO'
		WHEN CARGO = 'Consultor / Trainee' AND [Capacidade Anal�tica] =5 THEN 'DENTRO'	
		WHEN CARGO = 'Estagi�rio' AND [Capacidade Anal�tica] >2 THEN 'ACIMA'
		WHEN CARGO = 'Analista Junior' AND [Capacidade Anal�tica] >2 THEN 'ACIMA'
		WHEN CARGO = 'Analista Pleno' AND [Capacidade Anal�tica] >2 THEN 'ACIMA'
		WHEN CARGO = 'Analista S�nior' AND [Capacidade Anal�tica] >4 THEN 'ACIMA'
		WHEN CARGO = 'Consultor / Trainee' AND [Capacidade Anal�tica] >5 THEN 'ACIMA' ELSE NULL END CAPACIDADE_ANALITICA

---HABILIDADE ORGANIZA��O
	,CASE 
		WHEN CARGO = 'Estagi�rio' AND [Habilidade em Organiza��o] <2 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Junior' AND [Habilidade em Organiza��o] <2 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Pleno' AND [Habilidade em Organiza��o] <2 THEN 'ABAIXO'
		WHEN CARGO = 'Analista S�nior' AND [Habilidade em Organiza��o] <4 THEN 'ABAIXO'
		WHEN CARGO = 'Consultor / Trainee' AND [Habilidade em Organiza��o] <5 THEN 'ABAIXO'
		WHEN CARGO = 'Estagi�rio' AND [Habilidade em Organiza��o] =2 THEN 'DENTRO'
		WHEN CARGO = 'Analista Junior' AND [Habilidade em Organiza��o] =2 THEN 'DENTRO'
		WHEN CARGO = 'Analista Pleno' AND [Habilidade em Organiza��o] =2 THEN 'DENTRO'
		WHEN CARGO = 'Analista S�nior' AND [Habilidade em Organiza��o] =4 THEN 'DENTRO'
		WHEN CARGO = 'Consultor / Trainee' AND [Habilidade em Organiza��o] =5 THEN 'DENTRO'	
		WHEN CARGO = 'Estagi�rio' AND [Habilidade em Organiza��o] >2 THEN 'ACIMA'
		WHEN CARGO = 'Analista Junior' AND [Habilidade em Organiza��o] >2 THEN 'ACIMA'
		WHEN CARGO = 'Analista Pleno' AND [Habilidade em Organiza��o] >2 THEN 'ACIMA'
		WHEN CARGO = 'Analista S�nior' AND [Habilidade em Organiza��o] >4 THEN 'ACIMA'
		WHEN CARGO = 'Consultor / Trainee' AND [Habilidade em Organiza��o] >5 THEN 'ACIMA' ELSE NULL END HAB_ORGANIZACAO	

---HABILIDADE DE COMUNICA��O
	,CASE 
		WHEN CARGO = 'Estagi�rio' AND [Habilidade de Comunica��o] <1 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Junior' AND [Habilidade de Comunica��o] <1 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Pleno' AND [Habilidade de Comunica��o] <3 THEN 'ABAIXO'
		WHEN CARGO = 'Analista S�nior' AND [Habilidade de Comunica��o] <3 THEN 'ABAIXO'
		WHEN CARGO = 'Consultor / Trainee' AND [Habilidade de Comunica��o] <4 THEN 'ABAIXO'
		WHEN CARGO = 'Estagi�rio' AND [Habilidade de Comunica��o] =1 THEN 'DENTRO'
		WHEN CARGO = 'Analista Junior' AND [Habilidade de Comunica��o] =1 THEN 'DENTRO'
		WHEN CARGO = 'Analista Pleno' AND [Habilidade de Comunica��o] =3 THEN 'DENTRO'
		WHEN CARGO = 'Analista S�nior' AND [Habilidade de Comunica��o] =3 THEN 'DENTRO'
		WHEN CARGO = 'Consultor / Trainee' AND [Habilidade de Comunica��o] =4 THEN 'DENTRO'	
		WHEN CARGO = 'Estagi�rio' AND [Habilidade de Comunica��o] >1 THEN 'ACIMA'
		WHEN CARGO = 'Analista Junior' AND [Habilidade de Comunica��o] >1 THEN 'ACIMA'
		WHEN CARGO = 'Analista Pleno' AND [Habilidade de Comunica��o] >3 THEN 'ACIMA'
		WHEN CARGO = 'Analista S�nior' AND [Habilidade de Comunica��o] >3 THEN 'ACIMA'
		WHEN CARGO = 'Consultor / Trainee' AND [Habilidade de Comunica��o] >4 THEN 'ACIMA' ELSE NULL END HAB_COMUNICACAO	

---AUTODESENVOLVIMENTO
	,CASE 
		WHEN CARGO = 'Estagi�rio' AND [Capacidade de Autodesenvolvimento] <1 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Junior' AND [Capacidade de Autodesenvolvimento] <2 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Pleno' AND [Capacidade de Autodesenvolvimento] <3 THEN 'ABAIXO'
		WHEN CARGO = 'Analista S�nior' AND [Capacidade de Autodesenvolvimento] <3 THEN 'ABAIXO'
		WHEN CARGO = 'Consultor / Trainee' AND [Capacidade de Autodesenvolvimento] <5 THEN 'ABAIXO'
		WHEN CARGO = 'Estagi�rio' AND [Capacidade de Autodesenvolvimento] =1 THEN 'DENTRO'
		WHEN CARGO = 'Analista Junior' AND [Capacidade de Autodesenvolvimento] =2 THEN 'DENTRO'
		WHEN CARGO = 'Analista Pleno' AND [Capacidade de Autodesenvolvimento] =3 THEN 'DENTRO'
		WHEN CARGO = 'Analista S�nior' AND [Capacidade de Autodesenvolvimento] =3 THEN 'DENTRO'
		WHEN CARGO = 'Consultor / Trainee' AND [Capacidade de Autodesenvolvimento] =5 THEN 'DENTRO'	
		WHEN CARGO = 'Estagi�rio' AND [Capacidade de Autodesenvolvimento] >1 THEN 'ACIMA'
		WHEN CARGO = 'Analista Junior' AND [Capacidade de Autodesenvolvimento] >2 THEN 'ACIMA'
		WHEN CARGO = 'Analista Pleno' AND [Capacidade de Autodesenvolvimento] >3 THEN 'ACIMA'
		WHEN CARGO = 'Analista S�nior' AND [Capacidade de Autodesenvolvimento] >3 THEN 'ACIMA'
		WHEN CARGO = 'Consultor / Trainee' AND [Capacidade de Autodesenvolvimento] >5 THEN 'ACIMA' ELSE NULL END AUTODESENVOLVIMENTO	

---EQUILIBRIO
	,CASE 
		WHEN CARGO = 'Estagi�rio' AND [Equil�brio] <2 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Junior' AND [Equil�brio] <2 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Pleno' AND [Equil�brio] <2 THEN 'ABAIXO'
		WHEN CARGO = 'Analista S�nior' AND [Equil�brio] <3 THEN 'ABAIXO'
		WHEN CARGO = 'Consultor / Trainee' AND [Equil�brio] <4 THEN 'ABAIXO'
		WHEN CARGO = 'Estagi�rio' AND [Equil�brio] =2 THEN 'DENTRO'
		WHEN CARGO = 'Analista Junior' AND [Equil�brio] =2 THEN 'DENTRO'
		WHEN CARGO = 'Analista Pleno' AND [Equil�brio] =2 THEN 'DENTRO'
		WHEN CARGO = 'Analista S�nior' AND [Equil�brio] =3 THEN 'DENTRO'
		WHEN CARGO = 'Consultor / Trainee' AND [Equil�brio] =4 THEN 'DENTRO'	
		WHEN CARGO = 'Estagi�rio' AND [Equil�brio] >2 THEN 'ACIMA'
		WHEN CARGO = 'Analista Junior' AND [Equil�brio] >2 THEN 'ACIMA'
		WHEN CARGO = 'Analista Pleno' AND [Equil�brio] >2 THEN 'ACIMA'
		WHEN CARGO = 'Analista S�nior' AND [Equil�brio] >3 THEN 'ACIMA'
		WHEN CARGO = 'Consultor / Trainee' AND [Equil�brio] >4 THEN 'ACIMA' ELSE NULL END EQUILIBRIO	

---HABILIDADE RELACIONAMENTO
	,CASE 
		WHEN CARGO = 'Estagi�rio' AND [Habilidade de Relacionamento] <2 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Junior' AND [Habilidade de Relacionamento] <2 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Pleno' AND [Habilidade de Relacionamento] <3 THEN 'ABAIXO'
		WHEN CARGO = 'Analista S�nior' AND [Habilidade de Relacionamento] <4 THEN 'ABAIXO'
		WHEN CARGO = 'Consultor / Trainee' AND [Habilidade de Relacionamento] <4 THEN 'ABAIXO'
		WHEN CARGO = 'Estagi�rio' AND [Habilidade de Relacionamento] =2 THEN 'DENTRO'
		WHEN CARGO = 'Analista Junior' AND [Habilidade de Relacionamento] =2 THEN 'DENTRO'
		WHEN CARGO = 'Analista Pleno' AND [Habilidade de Relacionamento] =3 THEN 'DENTRO'
		WHEN CARGO = 'Analista S�nior' AND [Habilidade de Relacionamento] =4 THEN 'DENTRO'
		WHEN CARGO = 'Consultor / Trainee' AND [Habilidade de Relacionamento] =4 THEN 'DENTRO'	
		WHEN CARGO = 'Estagi�rio' AND [Habilidade de Relacionamento] >2 THEN 'ACIMA'
		WHEN CARGO = 'Analista Junior' AND [Habilidade de Relacionamento] >2 THEN 'ACIMA'
		WHEN CARGO = 'Analista Pleno' AND [Habilidade de Relacionamento] >3 THEN 'ACIMA'
		WHEN CARGO = 'Analista S�nior' AND [Habilidade de Relacionamento] >4 THEN 'ACIMA'
		WHEN CARGO = 'Consultor / Trainee' AND [Habilidade de Relacionamento] >4 THEN 'ACIMA' ELSE NULL END HAB_RELACIONAMENTO	

---INICIATIVA
	,CASE 
		WHEN CARGO = 'Estagi�rio' AND [Iniciativa] <2 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Junior' AND [Iniciativa] <2 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Pleno' AND [Iniciativa] <3 THEN 'ABAIXO'
		WHEN CARGO = 'Analista S�nior' AND [Iniciativa] <4 THEN 'ABAIXO'
		WHEN CARGO = 'Consultor / Trainee' AND [Iniciativa] <4 THEN 'ABAIXO'
		WHEN CARGO = 'Estagi�rio' AND [Iniciativa] =2 THEN 'DENTRO'
		WHEN CARGO = 'Analista Junior' AND [Iniciativa] =2 THEN 'DENTRO'
		WHEN CARGO = 'Analista Pleno' AND [Iniciativa] =3 THEN 'DENTRO'
		WHEN CARGO = 'Analista S�nior' AND [Iniciativa] =4 THEN 'DENTRO'
		WHEN CARGO = 'Consultor / Trainee' AND [Iniciativa] =4 THEN 'DENTRO'	
		WHEN CARGO = 'Estagi�rio' AND [Iniciativa] >2 THEN 'ACIMA'
		WHEN CARGO = 'Analista Junior' AND [Iniciativa] >2 THEN 'ACIMA'
		WHEN CARGO = 'Analista Pleno' AND [Iniciativa] >3 THEN 'ACIMA'
		WHEN CARGO = 'Analista S�nior' AND [Iniciativa] >4 THEN 'ACIMA'
		WHEN CARGO = 'Consultor / Trainee' AND [Iniciativa] >4 THEN 'ACIMA' ELSE NULL END INICIATIVA	

---CONCENTRA��O
	,CASE 
		WHEN CARGO = 'Estagi�rio' AND [Capacidade de Concentra��o] <2 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Junior' AND [Capacidade de Concentra��o] <2 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Pleno' AND [Capacidade de Concentra��o] <3 THEN 'ABAIXO'
		WHEN CARGO = 'Analista S�nior' AND [Capacidade de Concentra��o] <4 THEN 'ABAIXO'
		WHEN CARGO = 'Consultor / Trainee' AND [Capacidade de Concentra��o] <4 THEN 'ABAIXO'
		WHEN CARGO = 'Estagi�rio' AND [Capacidade de Concentra��o] =2 THEN 'DENTRO'
		WHEN CARGO = 'Analista Junior' AND [Capacidade de Concentra��o] =2 THEN 'DENTRO'
		WHEN CARGO = 'Analista Pleno' AND [Capacidade de Concentra��o] =3 THEN 'DENTRO'
		WHEN CARGO = 'Analista S�nior' AND [Capacidade de Concentra��o] =4 THEN 'DENTRO'
		WHEN CARGO = 'Consultor / Trainee' AND [Capacidade de Concentra��o] =4 THEN 'DENTRO'	
		WHEN CARGO = 'Estagi�rio' AND [Capacidade de Concentra��o] >2 THEN 'ACIMA'
		WHEN CARGO = 'Analista Junior' AND [Capacidade de Concentra��o] >2 THEN 'ACIMA'
		WHEN CARGO = 'Analista Pleno' AND [Capacidade de Concentra��o] >3 THEN 'ACIMA'
		WHEN CARGO = 'Analista S�nior' AND [Capacidade de Concentra��o] >4 THEN 'ACIMA'
		WHEN CARGO = 'Consultor / Trainee' AND [Capacidade de Concentra��o] >4 THEN 'ACIMA' ELSE NULL END CONCENTRACAO	

---FLEXIBILIDADE
	,CASE 
		WHEN CARGO = 'Estagi�rio' AND [Flexibilidade] <2 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Junior' AND [Flexibilidade] <2 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Pleno' AND [Flexibilidade] <3 THEN 'ABAIXO'
		WHEN CARGO = 'Analista S�nior' AND [Flexibilidade] <4 THEN 'ABAIXO'
		WHEN CARGO = 'Consultor / Trainee' AND [Flexibilidade] <4 THEN 'ABAIXO'
		WHEN CARGO = 'Estagi�rio' AND [Flexibilidade] =2 THEN 'DENTRO'
		WHEN CARGO = 'Analista Junior' AND [Flexibilidade] =2 THEN 'DENTRO'
		WHEN CARGO = 'Analista Pleno' AND [Flexibilidade] =3 THEN 'DENTRO'
		WHEN CARGO = 'Analista S�nior' AND [Flexibilidade] =4 THEN 'DENTRO'
		WHEN CARGO = 'Consultor / Trainee' AND [Flexibilidade] =4 THEN 'DENTRO'	
		WHEN CARGO = 'Estagi�rio' AND [Flexibilidade] >2 THEN 'ACIMA'
		WHEN CARGO = 'Analista Junior' AND [Flexibilidade] >2 THEN 'ACIMA'
		WHEN CARGO = 'Analista Pleno' AND [Flexibilidade] >3 THEN 'ACIMA'
		WHEN CARGO = 'Analista S�nior' AND [Flexibilidade] >4 THEN 'ACIMA'
		WHEN CARGO = 'Consultor / Trainee' AND [Flexibilidade] >4 THEN 'ACIMA' ELSE NULL END FLEXIBILIDADE	

---INTERA��O
	,CASE 
		WHEN CARGO = 'Estagi�rio' AND [Capacidade de Intera��o] <2 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Junior' AND [Capacidade de Intera��o] <2 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Pleno' AND [Capacidade de Intera��o] <3 THEN 'ABAIXO'
		WHEN CARGO = 'Analista S�nior' AND [Capacidade de Intera��o] <4 THEN 'ABAIXO'
		WHEN CARGO = 'Consultor / Trainee' AND [Capacidade de Intera��o] <4 THEN 'ABAIXO'
		WHEN CARGO = 'Estagi�rio' AND [Capacidade de Intera��o] =2 THEN 'DENTRO'
		WHEN CARGO = 'Analista Junior' AND [Capacidade de Intera��o] =2 THEN 'DENTRO'
		WHEN CARGO = 'Analista Pleno' AND [Capacidade de Intera��o] =3 THEN 'DENTRO'
		WHEN CARGO = 'Analista S�nior' AND [Capacidade de Intera��o] =4 THEN 'DENTRO'
		WHEN CARGO = 'Consultor / Trainee' AND [Capacidade de Intera��o] =4 THEN 'DENTRO'	
		WHEN CARGO = 'Estagi�rio' AND [Capacidade de Intera��o] >2 THEN 'ACIMA'
		WHEN CARGO = 'Analista Junior' AND [Capacidade de Intera��o] >2 THEN 'ACIMA'
		WHEN CARGO = 'Analista Pleno' AND [Capacidade de Intera��o] >3 THEN 'ACIMA'
		WHEN CARGO = 'Analista S�nior' AND [Capacidade de Intera��o] >4 THEN 'ACIMA'
		WHEN CARGO = 'Consultor / Trainee' AND [Capacidade de Intera��o] >4 THEN 'ACIMA' ELSE NULL END INTERACAO	

---PODER DE INFLU�NCIA
	,CASE 
		WHEN CARGO = 'Estagi�rio' AND [Poder de Influ�ncia] <1 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Junior' AND [Poder de Influ�ncia] <2 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Pleno' AND [Poder de Influ�ncia] <3 THEN 'ABAIXO'
		WHEN CARGO = 'Analista S�nior' AND [Poder de Influ�ncia] <3 THEN 'ABAIXO'
		WHEN CARGO = 'Consultor / Trainee' AND [Poder de Influ�ncia] <4 THEN 'ABAIXO'
		WHEN CARGO = 'Estagi�rio' AND [Poder de Influ�ncia] =1 THEN 'DENTRO'
		WHEN CARGO = 'Analista Junior' AND [Poder de Influ�ncia] =2 THEN 'DENTRO'
		WHEN CARGO = 'Analista Pleno' AND [Poder de Influ�ncia] =3 THEN 'DENTRO'
		WHEN CARGO = 'Analista S�nior' AND [Poder de Influ�ncia] =3 THEN 'DENTRO'
		WHEN CARGO = 'Consultor / Trainee' AND [Poder de Influ�ncia] =4 THEN 'DENTRO'	
		WHEN CARGO = 'Estagi�rio' AND [Poder de Influ�ncia] >1 THEN 'ACIMA'
		WHEN CARGO = 'Analista Junior' AND [Poder de Influ�ncia] >2 THEN 'ACIMA'
		WHEN CARGO = 'Analista Pleno' AND [Poder de Influ�ncia] >3 THEN 'ACIMA'
		WHEN CARGO = 'Analista S�nior' AND [Poder de Influ�ncia] >3 THEN 'ACIMA'
		WHEN CARGO = 'Consultor / Trainee' AND [Poder de Influ�ncia] >4 THEN 'ACIMA' ELSE NULL END PODER_INFLUENCIA	

---HABILIDADE EM MOTIVACAO
	,CASE 
		WHEN CARGO = 'Estagi�rio' AND [Habilidade em Motiva��o] <1 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Junior' AND [Habilidade em Motiva��o] <1 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Pleno' AND [Habilidade em Motiva��o] <2 THEN 'ABAIXO'
		WHEN CARGO = 'Analista S�nior' AND [Habilidade em Motiva��o] <3 THEN 'ABAIXO'
		WHEN CARGO = 'Consultor / Trainee' AND [Habilidade em Motiva��o] <3 THEN 'ABAIXO'
		WHEN CARGO = 'Estagi�rio' AND [Habilidade em Motiva��o] =1 THEN 'DENTRO'
		WHEN CARGO = 'Analista Junior' AND [Habilidade em Motiva��o] =1 THEN 'DENTRO'
		WHEN CARGO = 'Analista Pleno' AND [Habilidade em Motiva��o] =2 THEN 'DENTRO'
		WHEN CARGO = 'Analista S�nior' AND [Habilidade em Motiva��o] =3 THEN 'DENTRO'
		WHEN CARGO = 'Consultor / Trainee' AND [Habilidade em Motiva��o] =3 THEN 'DENTRO'	
		WHEN CARGO = 'Estagi�rio' AND [Habilidade em Motiva��o] >1 THEN 'ACIMA'
		WHEN CARGO = 'Analista Junior' AND [Habilidade em Motiva��o] >1 THEN 'ACIMA'
		WHEN CARGO = 'Analista Pleno' AND [Habilidade em Motiva��o] >2 THEN 'ACIMA'
		WHEN CARGO = 'Analista S�nior' AND [Habilidade em Motiva��o] >3 THEN 'ACIMA'
		WHEN CARGO = 'Consultor / Trainee' AND [Habilidade em Motiva��o] >3 THEN 'ACIMA' ELSE NULL END HAB_MOTIVACAO

---BUSCA POR ORIENTA��O
	,CASE 
		WHEN CARGO = 'Estagi�rio' AND [Busca por Orienta��o] <3 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Junior' AND [Busca por Orienta��o] <3 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Pleno' AND [Busca por Orienta��o] <3 THEN 'ABAIXO'
		WHEN CARGO = 'Analista S�nior' AND [Busca por Orienta��o] <5 THEN 'ABAIXO'
		WHEN CARGO = 'Consultor / Trainee' AND [Busca por Orienta��o] <5 THEN 'ABAIXO'
		WHEN CARGO = 'Estagi�rio' AND [Busca por Orienta��o] =2 THEN 'DENTRO'
		WHEN CARGO = 'Analista Junior' AND [Busca por Orienta��o] =3 THEN 'DENTRO'
		WHEN CARGO = 'Analista Pleno' AND [Busca por Orienta��o] =3 THEN 'DENTRO'
		WHEN CARGO = 'Analista S�nior' AND [Busca por Orienta��o] =5 THEN 'DENTRO'
		WHEN CARGO = 'Consultor / Trainee' AND [Busca por Orienta��o] =5 THEN 'DENTRO'	
		WHEN CARGO = 'Estagi�rio' AND [Busca por Orienta��o] >2 THEN 'ACIMA'
		WHEN CARGO = 'Analista Junior' AND [Busca por Orienta��o] >3 THEN 'ACIMA'
		WHEN CARGO = 'Analista Pleno' AND [Busca por Orienta��o] >3 THEN 'ACIMA'
		WHEN CARGO = 'Analista S�nior' AND [Busca por Orienta��o] >5 THEN 'ACIMA'
		WHEN CARGO = 'Consultor / Trainee' AND [Busca por Orienta��o] >5 THEN 'ACIMA' ELSE NULL END ORIENTACAO	
			
---FOCO EM SUPERA��O
	,CASE 
		WHEN CARGO = 'Estagi�rio' AND [Foco em Supera��o] <2 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Junior' AND [Foco em Supera��o] <3 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Pleno' AND [Foco em Supera��o] <3 THEN 'ABAIXO'
		WHEN CARGO = 'Analista S�nior' AND [Foco em Supera��o] <4 THEN 'ABAIXO'
		WHEN CARGO = 'Consultor / Trainee' AND [Foco em Supera��o] <4 THEN 'ABAIXO'
		WHEN CARGO = 'Estagi�rio' AND [Foco em Supera��o] =2 THEN 'DENTRO'
		WHEN CARGO = 'Analista Junior' AND [Foco em Supera��o] =3 THEN 'DENTRO'
		WHEN CARGO = 'Analista Pleno' AND [Foco em Supera��o] =3 THEN 'DENTRO'
		WHEN CARGO = 'Analista S�nior' AND [Foco em Supera��o] =4 THEN 'DENTRO'
		WHEN CARGO = 'Consultor / Trainee' AND [Foco em Supera��o] =4 THEN 'DENTRO'	
		WHEN CARGO = 'Estagi�rio' AND [Foco em Supera��o] >2 THEN 'ACIMA'
		WHEN CARGO = 'Analista Junior' AND [Foco em Supera��o] >3 THEN 'ACIMA'
		WHEN CARGO = 'Analista Pleno' AND [Foco em Supera��o] >3 THEN 'ACIMA'
		WHEN CARGO = 'Analista S�nior' AND [Foco em Supera��o] >4 THEN 'ACIMA'
		WHEN CARGO = 'Consultor / Trainee' AND [Foco em Supera��o] >4 THEN 'ACIMA' ELSE NULL END FOCO_SUPERACAO		
	
---INTERESSE PELA VIVO
	,CASE 
		WHEN CARGO = 'Estagi�rio' AND [Interesse pela Vivo] <2 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Junior' AND [Interesse pela Vivo] <3 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Pleno' AND [Interesse pela Vivo] <3 THEN 'ABAIXO'
		WHEN CARGO = 'Analista S�nior' AND [Interesse pela Vivo] <4 THEN 'ABAIXO'
		WHEN CARGO = 'Consultor / Trainee' AND [Interesse pela Vivo] <4 THEN 'ABAIXO'
		WHEN CARGO = 'Estagi�rio' AND [Interesse pela Vivo] =2 THEN 'DENTRO'
		WHEN CARGO = 'Analista Junior' AND [Interesse pela Vivo] =3 THEN 'DENTRO'
		WHEN CARGO = 'Analista Pleno' AND [Interesse pela Vivo] =3 THEN 'DENTRO'
		WHEN CARGO = 'Analista S�nior' AND [Interesse pela Vivo] =4 THEN 'DENTRO'
		WHEN CARGO = 'Consultor / Trainee' AND [Interesse pela Vivo] =4 THEN 'DENTRO'	
		WHEN CARGO = 'Estagi�rio' AND [Interesse pela Vivo] >2 THEN 'ACIMA'
		WHEN CARGO = 'Analista Junior' AND [Interesse pela Vivo] >3 THEN 'ACIMA'
		WHEN CARGO = 'Analista Pleno' AND [Interesse pela Vivo] >3 THEN 'ACIMA'
		WHEN CARGO = 'Analista S�nior' AND [Interesse pela Vivo] >4 THEN 'ACIMA'
		WHEN CARGO = 'Consultor / Trainee' AND [Interesse pela Vivo] >4 THEN 'ACIMA' ELSE NULL END INTERESSE_VIVO		

---PRINCIPIOS DNA
	,CASE 
		WHEN CARGO = 'Estagi�rio' AND [Principios DNA Vivo] <2 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Junior' AND [Principios DNA Vivo] <3 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Pleno' AND [Principios DNA Vivo] <4 THEN 'ABAIXO'
		WHEN CARGO = 'Analista S�nior' AND [Principios DNA Vivo] <4 THEN 'ABAIXO'
		WHEN CARGO = 'Consultor / Trainee' AND [Principios DNA Vivo] <5 THEN 'ABAIXO'
		WHEN CARGO = 'Estagi�rio' AND [Principios DNA Vivo] =2 THEN 'DENTRO'
		WHEN CARGO = 'Analista Junior' AND [Principios DNA Vivo] =3 THEN 'DENTRO'
		WHEN CARGO = 'Analista Pleno' AND [Principios DNA Vivo] =4 THEN 'DENTRO'
		WHEN CARGO = 'Analista S�nior' AND [Principios DNA Vivo] =4 THEN 'DENTRO'
		WHEN CARGO = 'Consultor / Trainee' AND [Principios DNA Vivo] =5 THEN 'DENTRO'	
		WHEN CARGO = 'Estagi�rio' AND [Principios DNA Vivo] >2 THEN 'ACIMA'
		WHEN CARGO = 'Analista Junior' AND [Principios DNA Vivo] >3 THEN 'ACIMA'
		WHEN CARGO = 'Analista Pleno' AND [Principios DNA Vivo] >4 THEN 'ACIMA'
		WHEN CARGO = 'Analista S�nior' AND [Principios DNA Vivo] >4 THEN 'ACIMA'
		WHEN CARGO = 'Consultor / Trainee' AND [Principios DNA Vivo] >5 THEN 'ACIMA' ELSE NULL END PRINCIPIOS_DNA		
FROM DVG_REPORT_2
WHERE [Data do Feedback ou Autoavalia��o] >='2021/06/01'


/****AFERI��O DAS AVALIA��ES*****/
SELECT * FROM DVG_REPORT_2 WHERE [Data do Feedback ou Autoavalia��o] >='2021/06/01'