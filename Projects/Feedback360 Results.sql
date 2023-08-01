

/****AGRUPAMENTO  DE NOTAS POR COLABORADOR*****/
DROP TABLE DVG_REPORT_2
SELECT 
	[Por que você está respondendo ao questionário?] as TIPO
	,[Quem você está avaliando?] AS NOME
	,[Qual é o cargo de quem você está avaliando?] AS CARGO
	,AVG (CONVERT(FLOAT,REPLACE([Conhecimento Técnico],',','.'))) [Conhecimento Técnico]
	,AVG (CONVERT(FLOAT,REPLACE([Capacidade Analítica],',','.'))) [Capacidade Analítica]
	,AVG (CONVERT(FLOAT,REPLACE([Habilidade em Organização],',','.'))) [Habilidade em Organização]
	,AVG (CONVERT(FLOAT,REPLACE([Habilidade de Comunicação],',','.'))) [Habilidade de Comunicação]
	,AVG (CONVERT(FLOAT,REPLACE([Capacidade de Autodesenvolvimento],',','.'))) [Capacidade de Autodesenvolvimento]
	,AVG (CONVERT(FLOAT,REPLACE([Equilíbrio],',','.'))) [Equilíbrio]
	,AVG (CONVERT(FLOAT,REPLACE([Habilidade de Relacionamento],',','.'))) [Habilidade de Relacionamento]
	,AVG (CONVERT(FLOAT,REPLACE([Iniciativa],',','.'))) [Iniciativa]
	,AVG (CONVERT(FLOAT,REPLACE([Capacidade de Concentração],',','.'))) [Capacidade de Concentração]
	,AVG (CONVERT(FLOAT,REPLACE([Flexibilidade],',','.'))) [Flexibilidade]
	,AVG (CONVERT(FLOAT,REPLACE([Capacidade de Interação],',','.'))) [Capacidade de Interação]
	,AVG (CONVERT(FLOAT,REPLACE([Poder de Influência],',','.'))) [Poder de Influência]
	,AVG (CONVERT(FLOAT,REPLACE([Habilidade em Motivação],',','.'))) [Habilidade em Motivação]
	,AVG (CONVERT(FLOAT,REPLACE([Busca por Orientação],',','.'))) [Busca por Orientação]
	,AVG (CONVERT(FLOAT,REPLACE([Foco em Superação],',','.'))) [Foco em Superação]
	,AVG (CONVERT(FLOAT,REPLACE([Interesse pela Vivo],',','.'))) [Interesse pela Vivo]
	,AVG (CONVERT(FLOAT,REPLACE([Principios DNA Vivo],',','.'))) [Principios DNA Vivo]
INTO DVG_REPORT_2
FROM DVG_REPORT
WHERE [Data do Feedback ou Autoavaliação] > = '01/06/2021'
GROUP BY 
	[Por que você está respondendo ao questionário?] 
	,[Quem você está avaliando?]
	,[Qual é o cargo de quem você está avaliando?]


/****AFERIÇÃO DAS AVALIAÇÕES*****/
SELECT
	NOME
	,CARGO
	,TIPO

---CONHECIMENTO TÉCNICO
	,CASE 
		WHEN CARGO = 'Estagiário' AND [Conhecimento Técnico] <1 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Junior' AND [Conhecimento Técnico] <2 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Pleno' AND [Conhecimento Técnico] <3 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Sênior' AND [Conhecimento Técnico] <3 THEN 'ABAIXO'
		WHEN CARGO = 'Consultor / Trainee' AND [Conhecimento Técnico] <5 THEN 'ABAIXO'
		WHEN CARGO = 'Estagiário' AND [Conhecimento Técnico] =1 THEN 'DENTRO'
		WHEN CARGO = 'Analista Junior' AND [Conhecimento Técnico] =2 THEN 'DENTRO'
		WHEN CARGO = 'Analista Pleno' AND [Conhecimento Técnico] =3 THEN 'DENTRO'
		WHEN CARGO = 'Analista Sênior' AND [Conhecimento Técnico] =3 THEN 'DENTRO'
		WHEN CARGO = 'Consultor / Trainee' AND [Conhecimento Técnico] =5 THEN 'DENTRO'	
		WHEN CARGO = 'Estagiário' AND [Conhecimento Técnico] >1 THEN 'ACIMA'
		WHEN CARGO = 'Analista Junior' AND [Conhecimento Técnico] >2 THEN 'ACIMA'
		WHEN CARGO = 'Analista Pleno' AND [Conhecimento Técnico] >3 THEN 'ACIMA'
		WHEN CARGO = 'Analista Sênior' AND [Conhecimento Técnico] >3 THEN 'ACIMA'
		WHEN CARGO = 'Consultor / Trainee' AND [Conhecimento Técnico] >5 THEN 'ACIMA' ELSE NULL END CONHECIMENTO_TECNICO	

---CAPACIDADE ANALÍTICA
	,CASE 
		WHEN CARGO = 'Estagiário' AND [Capacidade Analítica] <2 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Junior' AND [Capacidade Analítica] <2 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Pleno' AND [Capacidade Analítica] <2 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Sênior' AND [Capacidade Analítica] <4 THEN 'ABAIXO'
		WHEN CARGO = 'Consultor / Trainee' AND [Capacidade Analítica] <5 THEN 'ABAIXO'
		WHEN CARGO = 'Estagiário' AND [Capacidade Analítica] =2 THEN 'DENTRO'
		WHEN CARGO = 'Analista Junior' AND [Capacidade Analítica] =2 THEN 'DENTRO'
		WHEN CARGO = 'Analista Pleno' AND [Capacidade Analítica] =2 THEN 'DENTRO'
		WHEN CARGO = 'Analista Sênior' AND [Capacidade Analítica] =4 THEN 'DENTRO'
		WHEN CARGO = 'Consultor / Trainee' AND [Capacidade Analítica] =5 THEN 'DENTRO'	
		WHEN CARGO = 'Estagiário' AND [Capacidade Analítica] >2 THEN 'ACIMA'
		WHEN CARGO = 'Analista Junior' AND [Capacidade Analítica] >2 THEN 'ACIMA'
		WHEN CARGO = 'Analista Pleno' AND [Capacidade Analítica] >2 THEN 'ACIMA'
		WHEN CARGO = 'Analista Sênior' AND [Capacidade Analítica] >4 THEN 'ACIMA'
		WHEN CARGO = 'Consultor / Trainee' AND [Capacidade Analítica] >5 THEN 'ACIMA' ELSE NULL END CAPACIDADE_ANALITICA

---HABILIDADE ORGANIZAÇÃO
	,CASE 
		WHEN CARGO = 'Estagiário' AND [Habilidade em Organização] <2 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Junior' AND [Habilidade em Organização] <2 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Pleno' AND [Habilidade em Organização] <2 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Sênior' AND [Habilidade em Organização] <4 THEN 'ABAIXO'
		WHEN CARGO = 'Consultor / Trainee' AND [Habilidade em Organização] <5 THEN 'ABAIXO'
		WHEN CARGO = 'Estagiário' AND [Habilidade em Organização] =2 THEN 'DENTRO'
		WHEN CARGO = 'Analista Junior' AND [Habilidade em Organização] =2 THEN 'DENTRO'
		WHEN CARGO = 'Analista Pleno' AND [Habilidade em Organização] =2 THEN 'DENTRO'
		WHEN CARGO = 'Analista Sênior' AND [Habilidade em Organização] =4 THEN 'DENTRO'
		WHEN CARGO = 'Consultor / Trainee' AND [Habilidade em Organização] =5 THEN 'DENTRO'	
		WHEN CARGO = 'Estagiário' AND [Habilidade em Organização] >2 THEN 'ACIMA'
		WHEN CARGO = 'Analista Junior' AND [Habilidade em Organização] >2 THEN 'ACIMA'
		WHEN CARGO = 'Analista Pleno' AND [Habilidade em Organização] >2 THEN 'ACIMA'
		WHEN CARGO = 'Analista Sênior' AND [Habilidade em Organização] >4 THEN 'ACIMA'
		WHEN CARGO = 'Consultor / Trainee' AND [Habilidade em Organização] >5 THEN 'ACIMA' ELSE NULL END HAB_ORGANIZACAO	

---HABILIDADE DE COMUNICAÇÃO
	,CASE 
		WHEN CARGO = 'Estagiário' AND [Habilidade de Comunicação] <1 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Junior' AND [Habilidade de Comunicação] <1 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Pleno' AND [Habilidade de Comunicação] <3 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Sênior' AND [Habilidade de Comunicação] <3 THEN 'ABAIXO'
		WHEN CARGO = 'Consultor / Trainee' AND [Habilidade de Comunicação] <4 THEN 'ABAIXO'
		WHEN CARGO = 'Estagiário' AND [Habilidade de Comunicação] =1 THEN 'DENTRO'
		WHEN CARGO = 'Analista Junior' AND [Habilidade de Comunicação] =1 THEN 'DENTRO'
		WHEN CARGO = 'Analista Pleno' AND [Habilidade de Comunicação] =3 THEN 'DENTRO'
		WHEN CARGO = 'Analista Sênior' AND [Habilidade de Comunicação] =3 THEN 'DENTRO'
		WHEN CARGO = 'Consultor / Trainee' AND [Habilidade de Comunicação] =4 THEN 'DENTRO'	
		WHEN CARGO = 'Estagiário' AND [Habilidade de Comunicação] >1 THEN 'ACIMA'
		WHEN CARGO = 'Analista Junior' AND [Habilidade de Comunicação] >1 THEN 'ACIMA'
		WHEN CARGO = 'Analista Pleno' AND [Habilidade de Comunicação] >3 THEN 'ACIMA'
		WHEN CARGO = 'Analista Sênior' AND [Habilidade de Comunicação] >3 THEN 'ACIMA'
		WHEN CARGO = 'Consultor / Trainee' AND [Habilidade de Comunicação] >4 THEN 'ACIMA' ELSE NULL END HAB_COMUNICACAO	

---AUTODESENVOLVIMENTO
	,CASE 
		WHEN CARGO = 'Estagiário' AND [Capacidade de Autodesenvolvimento] <1 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Junior' AND [Capacidade de Autodesenvolvimento] <2 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Pleno' AND [Capacidade de Autodesenvolvimento] <3 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Sênior' AND [Capacidade de Autodesenvolvimento] <3 THEN 'ABAIXO'
		WHEN CARGO = 'Consultor / Trainee' AND [Capacidade de Autodesenvolvimento] <5 THEN 'ABAIXO'
		WHEN CARGO = 'Estagiário' AND [Capacidade de Autodesenvolvimento] =1 THEN 'DENTRO'
		WHEN CARGO = 'Analista Junior' AND [Capacidade de Autodesenvolvimento] =2 THEN 'DENTRO'
		WHEN CARGO = 'Analista Pleno' AND [Capacidade de Autodesenvolvimento] =3 THEN 'DENTRO'
		WHEN CARGO = 'Analista Sênior' AND [Capacidade de Autodesenvolvimento] =3 THEN 'DENTRO'
		WHEN CARGO = 'Consultor / Trainee' AND [Capacidade de Autodesenvolvimento] =5 THEN 'DENTRO'	
		WHEN CARGO = 'Estagiário' AND [Capacidade de Autodesenvolvimento] >1 THEN 'ACIMA'
		WHEN CARGO = 'Analista Junior' AND [Capacidade de Autodesenvolvimento] >2 THEN 'ACIMA'
		WHEN CARGO = 'Analista Pleno' AND [Capacidade de Autodesenvolvimento] >3 THEN 'ACIMA'
		WHEN CARGO = 'Analista Sênior' AND [Capacidade de Autodesenvolvimento] >3 THEN 'ACIMA'
		WHEN CARGO = 'Consultor / Trainee' AND [Capacidade de Autodesenvolvimento] >5 THEN 'ACIMA' ELSE NULL END AUTODESENVOLVIMENTO	

---EQUILIBRIO
	,CASE 
		WHEN CARGO = 'Estagiário' AND [Equilíbrio] <2 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Junior' AND [Equilíbrio] <2 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Pleno' AND [Equilíbrio] <2 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Sênior' AND [Equilíbrio] <3 THEN 'ABAIXO'
		WHEN CARGO = 'Consultor / Trainee' AND [Equilíbrio] <4 THEN 'ABAIXO'
		WHEN CARGO = 'Estagiário' AND [Equilíbrio] =2 THEN 'DENTRO'
		WHEN CARGO = 'Analista Junior' AND [Equilíbrio] =2 THEN 'DENTRO'
		WHEN CARGO = 'Analista Pleno' AND [Equilíbrio] =2 THEN 'DENTRO'
		WHEN CARGO = 'Analista Sênior' AND [Equilíbrio] =3 THEN 'DENTRO'
		WHEN CARGO = 'Consultor / Trainee' AND [Equilíbrio] =4 THEN 'DENTRO'	
		WHEN CARGO = 'Estagiário' AND [Equilíbrio] >2 THEN 'ACIMA'
		WHEN CARGO = 'Analista Junior' AND [Equilíbrio] >2 THEN 'ACIMA'
		WHEN CARGO = 'Analista Pleno' AND [Equilíbrio] >2 THEN 'ACIMA'
		WHEN CARGO = 'Analista Sênior' AND [Equilíbrio] >3 THEN 'ACIMA'
		WHEN CARGO = 'Consultor / Trainee' AND [Equilíbrio] >4 THEN 'ACIMA' ELSE NULL END EQUILIBRIO	

---HABILIDADE RELACIONAMENTO
	,CASE 
		WHEN CARGO = 'Estagiário' AND [Habilidade de Relacionamento] <2 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Junior' AND [Habilidade de Relacionamento] <2 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Pleno' AND [Habilidade de Relacionamento] <3 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Sênior' AND [Habilidade de Relacionamento] <4 THEN 'ABAIXO'
		WHEN CARGO = 'Consultor / Trainee' AND [Habilidade de Relacionamento] <4 THEN 'ABAIXO'
		WHEN CARGO = 'Estagiário' AND [Habilidade de Relacionamento] =2 THEN 'DENTRO'
		WHEN CARGO = 'Analista Junior' AND [Habilidade de Relacionamento] =2 THEN 'DENTRO'
		WHEN CARGO = 'Analista Pleno' AND [Habilidade de Relacionamento] =3 THEN 'DENTRO'
		WHEN CARGO = 'Analista Sênior' AND [Habilidade de Relacionamento] =4 THEN 'DENTRO'
		WHEN CARGO = 'Consultor / Trainee' AND [Habilidade de Relacionamento] =4 THEN 'DENTRO'	
		WHEN CARGO = 'Estagiário' AND [Habilidade de Relacionamento] >2 THEN 'ACIMA'
		WHEN CARGO = 'Analista Junior' AND [Habilidade de Relacionamento] >2 THEN 'ACIMA'
		WHEN CARGO = 'Analista Pleno' AND [Habilidade de Relacionamento] >3 THEN 'ACIMA'
		WHEN CARGO = 'Analista Sênior' AND [Habilidade de Relacionamento] >4 THEN 'ACIMA'
		WHEN CARGO = 'Consultor / Trainee' AND [Habilidade de Relacionamento] >4 THEN 'ACIMA' ELSE NULL END HAB_RELACIONAMENTO	

---INICIATIVA
	,CASE 
		WHEN CARGO = 'Estagiário' AND [Iniciativa] <2 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Junior' AND [Iniciativa] <2 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Pleno' AND [Iniciativa] <3 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Sênior' AND [Iniciativa] <4 THEN 'ABAIXO'
		WHEN CARGO = 'Consultor / Trainee' AND [Iniciativa] <4 THEN 'ABAIXO'
		WHEN CARGO = 'Estagiário' AND [Iniciativa] =2 THEN 'DENTRO'
		WHEN CARGO = 'Analista Junior' AND [Iniciativa] =2 THEN 'DENTRO'
		WHEN CARGO = 'Analista Pleno' AND [Iniciativa] =3 THEN 'DENTRO'
		WHEN CARGO = 'Analista Sênior' AND [Iniciativa] =4 THEN 'DENTRO'
		WHEN CARGO = 'Consultor / Trainee' AND [Iniciativa] =4 THEN 'DENTRO'	
		WHEN CARGO = 'Estagiário' AND [Iniciativa] >2 THEN 'ACIMA'
		WHEN CARGO = 'Analista Junior' AND [Iniciativa] >2 THEN 'ACIMA'
		WHEN CARGO = 'Analista Pleno' AND [Iniciativa] >3 THEN 'ACIMA'
		WHEN CARGO = 'Analista Sênior' AND [Iniciativa] >4 THEN 'ACIMA'
		WHEN CARGO = 'Consultor / Trainee' AND [Iniciativa] >4 THEN 'ACIMA' ELSE NULL END INICIATIVA	

---CONCENTRAÇÃO
	,CASE 
		WHEN CARGO = 'Estagiário' AND [Capacidade de Concentração] <2 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Junior' AND [Capacidade de Concentração] <2 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Pleno' AND [Capacidade de Concentração] <3 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Sênior' AND [Capacidade de Concentração] <4 THEN 'ABAIXO'
		WHEN CARGO = 'Consultor / Trainee' AND [Capacidade de Concentração] <4 THEN 'ABAIXO'
		WHEN CARGO = 'Estagiário' AND [Capacidade de Concentração] =2 THEN 'DENTRO'
		WHEN CARGO = 'Analista Junior' AND [Capacidade de Concentração] =2 THEN 'DENTRO'
		WHEN CARGO = 'Analista Pleno' AND [Capacidade de Concentração] =3 THEN 'DENTRO'
		WHEN CARGO = 'Analista Sênior' AND [Capacidade de Concentração] =4 THEN 'DENTRO'
		WHEN CARGO = 'Consultor / Trainee' AND [Capacidade de Concentração] =4 THEN 'DENTRO'	
		WHEN CARGO = 'Estagiário' AND [Capacidade de Concentração] >2 THEN 'ACIMA'
		WHEN CARGO = 'Analista Junior' AND [Capacidade de Concentração] >2 THEN 'ACIMA'
		WHEN CARGO = 'Analista Pleno' AND [Capacidade de Concentração] >3 THEN 'ACIMA'
		WHEN CARGO = 'Analista Sênior' AND [Capacidade de Concentração] >4 THEN 'ACIMA'
		WHEN CARGO = 'Consultor / Trainee' AND [Capacidade de Concentração] >4 THEN 'ACIMA' ELSE NULL END CONCENTRACAO	

---FLEXIBILIDADE
	,CASE 
		WHEN CARGO = 'Estagiário' AND [Flexibilidade] <2 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Junior' AND [Flexibilidade] <2 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Pleno' AND [Flexibilidade] <3 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Sênior' AND [Flexibilidade] <4 THEN 'ABAIXO'
		WHEN CARGO = 'Consultor / Trainee' AND [Flexibilidade] <4 THEN 'ABAIXO'
		WHEN CARGO = 'Estagiário' AND [Flexibilidade] =2 THEN 'DENTRO'
		WHEN CARGO = 'Analista Junior' AND [Flexibilidade] =2 THEN 'DENTRO'
		WHEN CARGO = 'Analista Pleno' AND [Flexibilidade] =3 THEN 'DENTRO'
		WHEN CARGO = 'Analista Sênior' AND [Flexibilidade] =4 THEN 'DENTRO'
		WHEN CARGO = 'Consultor / Trainee' AND [Flexibilidade] =4 THEN 'DENTRO'	
		WHEN CARGO = 'Estagiário' AND [Flexibilidade] >2 THEN 'ACIMA'
		WHEN CARGO = 'Analista Junior' AND [Flexibilidade] >2 THEN 'ACIMA'
		WHEN CARGO = 'Analista Pleno' AND [Flexibilidade] >3 THEN 'ACIMA'
		WHEN CARGO = 'Analista Sênior' AND [Flexibilidade] >4 THEN 'ACIMA'
		WHEN CARGO = 'Consultor / Trainee' AND [Flexibilidade] >4 THEN 'ACIMA' ELSE NULL END FLEXIBILIDADE	

---INTERAÇÃO
	,CASE 
		WHEN CARGO = 'Estagiário' AND [Capacidade de Interação] <2 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Junior' AND [Capacidade de Interação] <2 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Pleno' AND [Capacidade de Interação] <3 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Sênior' AND [Capacidade de Interação] <4 THEN 'ABAIXO'
		WHEN CARGO = 'Consultor / Trainee' AND [Capacidade de Interação] <4 THEN 'ABAIXO'
		WHEN CARGO = 'Estagiário' AND [Capacidade de Interação] =2 THEN 'DENTRO'
		WHEN CARGO = 'Analista Junior' AND [Capacidade de Interação] =2 THEN 'DENTRO'
		WHEN CARGO = 'Analista Pleno' AND [Capacidade de Interação] =3 THEN 'DENTRO'
		WHEN CARGO = 'Analista Sênior' AND [Capacidade de Interação] =4 THEN 'DENTRO'
		WHEN CARGO = 'Consultor / Trainee' AND [Capacidade de Interação] =4 THEN 'DENTRO'	
		WHEN CARGO = 'Estagiário' AND [Capacidade de Interação] >2 THEN 'ACIMA'
		WHEN CARGO = 'Analista Junior' AND [Capacidade de Interação] >2 THEN 'ACIMA'
		WHEN CARGO = 'Analista Pleno' AND [Capacidade de Interação] >3 THEN 'ACIMA'
		WHEN CARGO = 'Analista Sênior' AND [Capacidade de Interação] >4 THEN 'ACIMA'
		WHEN CARGO = 'Consultor / Trainee' AND [Capacidade de Interação] >4 THEN 'ACIMA' ELSE NULL END INTERACAO	

---PODER DE INFLUÊNCIA
	,CASE 
		WHEN CARGO = 'Estagiário' AND [Poder de Influência] <1 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Junior' AND [Poder de Influência] <2 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Pleno' AND [Poder de Influência] <3 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Sênior' AND [Poder de Influência] <3 THEN 'ABAIXO'
		WHEN CARGO = 'Consultor / Trainee' AND [Poder de Influência] <4 THEN 'ABAIXO'
		WHEN CARGO = 'Estagiário' AND [Poder de Influência] =1 THEN 'DENTRO'
		WHEN CARGO = 'Analista Junior' AND [Poder de Influência] =2 THEN 'DENTRO'
		WHEN CARGO = 'Analista Pleno' AND [Poder de Influência] =3 THEN 'DENTRO'
		WHEN CARGO = 'Analista Sênior' AND [Poder de Influência] =3 THEN 'DENTRO'
		WHEN CARGO = 'Consultor / Trainee' AND [Poder de Influência] =4 THEN 'DENTRO'	
		WHEN CARGO = 'Estagiário' AND [Poder de Influência] >1 THEN 'ACIMA'
		WHEN CARGO = 'Analista Junior' AND [Poder de Influência] >2 THEN 'ACIMA'
		WHEN CARGO = 'Analista Pleno' AND [Poder de Influência] >3 THEN 'ACIMA'
		WHEN CARGO = 'Analista Sênior' AND [Poder de Influência] >3 THEN 'ACIMA'
		WHEN CARGO = 'Consultor / Trainee' AND [Poder de Influência] >4 THEN 'ACIMA' ELSE NULL END PODER_INFLUENCIA	

---HABILIDADE EM MOTIVACAO
	,CASE 
		WHEN CARGO = 'Estagiário' AND [Habilidade em Motivação] <1 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Junior' AND [Habilidade em Motivação] <1 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Pleno' AND [Habilidade em Motivação] <2 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Sênior' AND [Habilidade em Motivação] <3 THEN 'ABAIXO'
		WHEN CARGO = 'Consultor / Trainee' AND [Habilidade em Motivação] <3 THEN 'ABAIXO'
		WHEN CARGO = 'Estagiário' AND [Habilidade em Motivação] =1 THEN 'DENTRO'
		WHEN CARGO = 'Analista Junior' AND [Habilidade em Motivação] =1 THEN 'DENTRO'
		WHEN CARGO = 'Analista Pleno' AND [Habilidade em Motivação] =2 THEN 'DENTRO'
		WHEN CARGO = 'Analista Sênior' AND [Habilidade em Motivação] =3 THEN 'DENTRO'
		WHEN CARGO = 'Consultor / Trainee' AND [Habilidade em Motivação] =3 THEN 'DENTRO'	
		WHEN CARGO = 'Estagiário' AND [Habilidade em Motivação] >1 THEN 'ACIMA'
		WHEN CARGO = 'Analista Junior' AND [Habilidade em Motivação] >1 THEN 'ACIMA'
		WHEN CARGO = 'Analista Pleno' AND [Habilidade em Motivação] >2 THEN 'ACIMA'
		WHEN CARGO = 'Analista Sênior' AND [Habilidade em Motivação] >3 THEN 'ACIMA'
		WHEN CARGO = 'Consultor / Trainee' AND [Habilidade em Motivação] >3 THEN 'ACIMA' ELSE NULL END HAB_MOTIVACAO

---BUSCA POR ORIENTAÇÃO
	,CASE 
		WHEN CARGO = 'Estagiário' AND [Busca por Orientação] <3 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Junior' AND [Busca por Orientação] <3 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Pleno' AND [Busca por Orientação] <3 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Sênior' AND [Busca por Orientação] <5 THEN 'ABAIXO'
		WHEN CARGO = 'Consultor / Trainee' AND [Busca por Orientação] <5 THEN 'ABAIXO'
		WHEN CARGO = 'Estagiário' AND [Busca por Orientação] =2 THEN 'DENTRO'
		WHEN CARGO = 'Analista Junior' AND [Busca por Orientação] =3 THEN 'DENTRO'
		WHEN CARGO = 'Analista Pleno' AND [Busca por Orientação] =3 THEN 'DENTRO'
		WHEN CARGO = 'Analista Sênior' AND [Busca por Orientação] =5 THEN 'DENTRO'
		WHEN CARGO = 'Consultor / Trainee' AND [Busca por Orientação] =5 THEN 'DENTRO'	
		WHEN CARGO = 'Estagiário' AND [Busca por Orientação] >2 THEN 'ACIMA'
		WHEN CARGO = 'Analista Junior' AND [Busca por Orientação] >3 THEN 'ACIMA'
		WHEN CARGO = 'Analista Pleno' AND [Busca por Orientação] >3 THEN 'ACIMA'
		WHEN CARGO = 'Analista Sênior' AND [Busca por Orientação] >5 THEN 'ACIMA'
		WHEN CARGO = 'Consultor / Trainee' AND [Busca por Orientação] >5 THEN 'ACIMA' ELSE NULL END ORIENTACAO	
			
---FOCO EM SUPERAÇÃO
	,CASE 
		WHEN CARGO = 'Estagiário' AND [Foco em Superação] <2 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Junior' AND [Foco em Superação] <3 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Pleno' AND [Foco em Superação] <3 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Sênior' AND [Foco em Superação] <4 THEN 'ABAIXO'
		WHEN CARGO = 'Consultor / Trainee' AND [Foco em Superação] <4 THEN 'ABAIXO'
		WHEN CARGO = 'Estagiário' AND [Foco em Superação] =2 THEN 'DENTRO'
		WHEN CARGO = 'Analista Junior' AND [Foco em Superação] =3 THEN 'DENTRO'
		WHEN CARGO = 'Analista Pleno' AND [Foco em Superação] =3 THEN 'DENTRO'
		WHEN CARGO = 'Analista Sênior' AND [Foco em Superação] =4 THEN 'DENTRO'
		WHEN CARGO = 'Consultor / Trainee' AND [Foco em Superação] =4 THEN 'DENTRO'	
		WHEN CARGO = 'Estagiário' AND [Foco em Superação] >2 THEN 'ACIMA'
		WHEN CARGO = 'Analista Junior' AND [Foco em Superação] >3 THEN 'ACIMA'
		WHEN CARGO = 'Analista Pleno' AND [Foco em Superação] >3 THEN 'ACIMA'
		WHEN CARGO = 'Analista Sênior' AND [Foco em Superação] >4 THEN 'ACIMA'
		WHEN CARGO = 'Consultor / Trainee' AND [Foco em Superação] >4 THEN 'ACIMA' ELSE NULL END FOCO_SUPERACAO		
	
---INTERESSE PELA VIVO
	,CASE 
		WHEN CARGO = 'Estagiário' AND [Interesse pela Vivo] <2 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Junior' AND [Interesse pela Vivo] <3 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Pleno' AND [Interesse pela Vivo] <3 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Sênior' AND [Interesse pela Vivo] <4 THEN 'ABAIXO'
		WHEN CARGO = 'Consultor / Trainee' AND [Interesse pela Vivo] <4 THEN 'ABAIXO'
		WHEN CARGO = 'Estagiário' AND [Interesse pela Vivo] =2 THEN 'DENTRO'
		WHEN CARGO = 'Analista Junior' AND [Interesse pela Vivo] =3 THEN 'DENTRO'
		WHEN CARGO = 'Analista Pleno' AND [Interesse pela Vivo] =3 THEN 'DENTRO'
		WHEN CARGO = 'Analista Sênior' AND [Interesse pela Vivo] =4 THEN 'DENTRO'
		WHEN CARGO = 'Consultor / Trainee' AND [Interesse pela Vivo] =4 THEN 'DENTRO'	
		WHEN CARGO = 'Estagiário' AND [Interesse pela Vivo] >2 THEN 'ACIMA'
		WHEN CARGO = 'Analista Junior' AND [Interesse pela Vivo] >3 THEN 'ACIMA'
		WHEN CARGO = 'Analista Pleno' AND [Interesse pela Vivo] >3 THEN 'ACIMA'
		WHEN CARGO = 'Analista Sênior' AND [Interesse pela Vivo] >4 THEN 'ACIMA'
		WHEN CARGO = 'Consultor / Trainee' AND [Interesse pela Vivo] >4 THEN 'ACIMA' ELSE NULL END INTERESSE_VIVO		

---PRINCIPIOS DNA
	,CASE 
		WHEN CARGO = 'Estagiário' AND [Principios DNA Vivo] <2 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Junior' AND [Principios DNA Vivo] <3 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Pleno' AND [Principios DNA Vivo] <4 THEN 'ABAIXO'
		WHEN CARGO = 'Analista Sênior' AND [Principios DNA Vivo] <4 THEN 'ABAIXO'
		WHEN CARGO = 'Consultor / Trainee' AND [Principios DNA Vivo] <5 THEN 'ABAIXO'
		WHEN CARGO = 'Estagiário' AND [Principios DNA Vivo] =2 THEN 'DENTRO'
		WHEN CARGO = 'Analista Junior' AND [Principios DNA Vivo] =3 THEN 'DENTRO'
		WHEN CARGO = 'Analista Pleno' AND [Principios DNA Vivo] =4 THEN 'DENTRO'
		WHEN CARGO = 'Analista Sênior' AND [Principios DNA Vivo] =4 THEN 'DENTRO'
		WHEN CARGO = 'Consultor / Trainee' AND [Principios DNA Vivo] =5 THEN 'DENTRO'	
		WHEN CARGO = 'Estagiário' AND [Principios DNA Vivo] >2 THEN 'ACIMA'
		WHEN CARGO = 'Analista Junior' AND [Principios DNA Vivo] >3 THEN 'ACIMA'
		WHEN CARGO = 'Analista Pleno' AND [Principios DNA Vivo] >4 THEN 'ACIMA'
		WHEN CARGO = 'Analista Sênior' AND [Principios DNA Vivo] >4 THEN 'ACIMA'
		WHEN CARGO = 'Consultor / Trainee' AND [Principios DNA Vivo] >5 THEN 'ACIMA' ELSE NULL END PRINCIPIOS_DNA		
FROM DVG_REPORT_2
WHERE [Data do Feedback ou Autoavaliação] >='2021/06/01'


/****AFERIÇÃO DAS AVALIAÇÕES*****/
SELECT * FROM DVG_REPORT_2 WHERE [Data do Feedback ou Autoavaliação] >='2021/06/01'