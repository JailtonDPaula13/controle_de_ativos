create or replace function fn_idade_mes(v_idade date) return varchar2
as
 v_ano int := 0;
 v_meses int := 0;
begin
    select trunc(months_between(sysdate,v_idade)/12) into v_ano from dual;
    select trunc(mod(months_between(sysdate,v_idade),12)) into v_meses from dual;
    
    return v_ano||' Anos '||v_meses||' Meses';
end;