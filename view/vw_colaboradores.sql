create or replace view vw_colaboradores
as
select
    id_colaborador as "matricula",
    nome_rs,
    nome,
    case sexo
        when 'M' then 'Masculino'
        else 'Femenino'
        end as "sexo",
    substr(cpf,1,3)||'.'||substr(cpf,4,3)||'.'||substr(cpf,7,3)||'-'||substr(cpf,10) as "CPF",
    fn_idade_mes(nascido) as "idade",
    s.setor as "setor alocado"
from
    tb_colaboradores c
inner join
    tb_setor s on c.id_setor = s.id_setor
;