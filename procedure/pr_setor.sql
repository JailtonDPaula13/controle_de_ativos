create or replace procedure pr_setor(v_setor varchar2)
is   
  v_comparacao_setor int;
begin
    select count(*)into v_comparacao_setor from tb_setor where setor = upper(v_setor);
    if(length(v_setor) > 30) then
        dbms_output.put_line('Nome do setor deve ter apenas 30 carateres');
    elsif(v_comparacao_setor <> 0) then
        dbms_output.put_line('Setor '||v_setor||' já cadastrado !!!');
    else
        insert into tb_setor(id_setor, setor) values(sq_setor.nextval, upper(v_setor));
        dbms_output.put_line('Setor '||upper(v_setor)||' Cadastrado');
    end if;
end;