-- UNIVERSIDADE FEDERAL DO PARÁ
-- INSTITUTO DE CIÊNCIAS EXATAS E NATURAIS
-- FACULDADE DE COMPUTAÇÃO
-- CURSO: CIÊNCIA DA COMPUTAÇÃO
-- DISCIPLINA: BANCO DE DADOS II
-- PROFESSORA: FABÍOLA P. OLIVEIRA ARAÚJO
-- PERÍODO: 2017.4

/*
a) Faça uma seleção que mostre sobrenome (last_name) dos empregados que possuem a
terceira letra sendo “a”. Nesta seleção mostre também o nome do departamento
(department_name) que o empregado trabalha, ordenando a saída de dados pelo último
nome do empregado (last_name) e ordem alfabética ascendente. Usar os operadores
LIKE e ORDER BY.
*/
select last_name, department_name 
from employees emp, departments dept
where last_name like '__a%' and emp.department_id = dept.department_id 
order by last_name;

/*
b) Construa uma query (consulta) que mostre a quantidade de empregados agrupados por
nome do departamento (department_name). Usar os operadores COUNT e GROUP BY.
*/
select count(*), department_name 
from employees emp, departments dept 
where emp.department_id = dept.department_id 
group by department_name;

/*
c) Escreva uma query (consulta) que mostre a diferença entre o maior e o menor salário
(salary) da tabela de empregados (Employee). Faça com que o resultado seja mostrado
com o label “Diferença”. Usar as funções de agregação MAX e MIN.
*/
select max(salary) - min(salary) 
as Diference
from employees;

/*
d) Mostrar a quantidade de empregados agrupados por nome da região (region_name).
Usar os operadores COUNT e DISTINCT.
*/
select region_name, count(employee_id)
from regions reg, employees emp, departments dep, locations loc, countries
where emp.department_id = dep.department_id and dep.location_id = loc.location_id and loc.country_id = countries.country_id and countries.region_id = reg.region_id
group by region_name;

/*
e) Escreva uma consulta que mostre o nome do departamento (department_name),
localização do mesmo (street_address), quantidade de funcionários e média de salários.
Agrupar o resultado por nome do departamento (department_name) e localização do
mesmo (street_address).
*/
select department_name, street_address, count(employee_id), avg(salary)
from departments dep, employees emp, locations loc
where dep.department_id = emp.department_id and dep.location_id = loc.location_id
group by department_name, street_address;

/*
g) Para cada empregado mostre o número do mesmo (employee_id), sobrenome
(last_name), salário (salary) e o salário acrescido do valor do menor salário (min_salary)
para o cargo que ele exerce. Faça com que o salário acrescido seja mostrado com o label
“Novo Salário”.
*/
select employee_id, last_name, salary, salary + min(salary) as Novo_Salario
from employees
group by employee_id, last_name, salary;

/*
h) Faça uma consulta que mostre o primeiro nome (first_name) e o último nome (last_name)
de todos os empregados que foram admitidos depois do ano de 1990.
*/
select first_name, last_name, hire_date
from employees
where hire_date like '%9_' or hire_date like '%0_';

/*
i) Construa uma query que mostre o primeiro nome do empregado (first_name) e do seu
gerente.
*/
select emp.first_name, man.first_name
from employees emp, employees man
where emp.manager_id = man.employee_id;

/*
j) Faça uma consulta que mostre o nome do departamento (department_name), o nome do
país em que ele se encontra (country_name) e o nome da região (region_name). 
*/
select department_name, country_name, region_name
from departments dep, countries cou, regions reg, locations loc
where dep.location_id = loc.location_id and loc.country_id = cou.country_id and cou.region_id = reg.region_id;
