-- UNIVERSIDADE FEDERAL DO PARÁ
-- INSTITUTO DE CIÊNCIAS EXATAS E NATURAIS
-- FACULDADE DE COMPUTAÇÃO
-- CURSO: CIÊNCIA DA COMPUTAÇÃO
-- DISCIPLINA: BANCO DE DADOS II
-- PROFESSORA: FABÍOLA P. OLIVEIRA ARAÚJO
-- PERÍODO: 2017.4
-- ALUNO: ALAN T. SOUZA VELOSO
-- MATRICULA: 201504940009

-- a. Obter os códigos e nomes dos diferentes departamentos que tem turmas no AnoSem
-- 0416.
select distinct coddepto, nomedepto
from departamento, professor, professor_has_turma
where coddepto = departamento_coddepto and codprof = professor_codprof and turma_anosem = 0416;

-- b. Obter os códigos e nome dos professores que são do departamento de Letras ou que
-- ministraram turmas em AnoSem 0217.
select distinct codprof, nomeprof
from professor, departamento, professor_has_turma
where departamento_coddepto = coddepto and nomedepto = 'Letras' or professor_codprof = codprof and turma_anosem = 0417;

-- c. Obter os códigos dos professores não ministraram aulas no AnoSem 0417.
select codprof
from professor, professor_has_turma
where codprof = professor_codprof and turma_anosem != 0417;

-- d. Listar o nome dos departamentos que tem pelo menos 03 turmas de qualquer
-- disciplina.
select nomedepto, count(siglatur)
from departamento, disciplina, turma
where coddepto = departamento_coddepto and numdisc = disciplina_numdisc and departamento_coddepto = disc_depto_coddepto
group by nomedepto
having count(*) >= 3;

-- e. Selecionar o nome do professor, nome do departamento e o nome da disciplina que ele
-- leciona.

select nomeprof, nomedepto, nomedisc
from professor prof, departamento dep, disciplina disc
where dep.coddepto = prof.departamento_coddepto and dep.coddepto = disc.departamento_coddepto;

-- f. Selecionar a quantidade de turmas de cada professor. Agrupar o resultado pelo nome
-- do professor.
select nomeprof, count(turma_siglatur) as qntd_turma
from professor, professor_has_turma
where codprof = professor_codprof
group by (nomeprof);

-- g. Selecionar o nome dos professores que não tenham turmas.
select nomeprof
from professor
where codprof not in (
	select professor_codprof
	from professor_has_turma
);

-- h. Selecionar o AnoSem e a SiglaTur que não tem professor.
select turma_anosem, turma_siglatur
from professor_has_turma
where professor_codprof is null

-- i. Selecionar a(s) disciplina(s) que possuem a maior quantidade de alunos matriculados.
select distinct nomedisc
from disciplina, turma
where numdisc = disciplina_numdisc and qtde_alunos = (select max(qtde_alunos) from turma);

-- j. Selecionar a média de alunos das disciplinas “Pratica de Laboratorio e Biologia”.
select avg(qtde_alunos)
from turma, disciplina
where numdisc = disciplina_numdisc and departamento_coddepto = disc_depto_coddepto and nomedisc like 'Pratica de Laboratorio' or nomedisc like 'Biologia';

-- k. Mostrar o nome de todos os professores que possuem a letra a em qualquer posição do
-- nome.
select nomeprof
from professor
where nomeprof like '%a%';

-- l. Mostrar o nome de todos os departamentos que oferecem disciplinas que possuem
-- valores de créditos 1, 2 ou 3. 
select distinct nomedepto
from departamento, disciplina
where coddepto = departamento_coddepto and creditosdisc in (1,2,3);
