create or replace trigger tg_colaboradores
before update or delete of cpf, id_setor on tb_colaboradores
for each row
begin
    if(:new.cpf is null or :new.id_setor is null)then
        dbms_output.put_line('Auditado delete !!!');
        insert into au_colaboradores values(sq_colaboradores.nextval, :old.nome, :old.cpf, :old.id_setor, user, sysdate, 'D'); 
    else
        dbms_output.put_line('Auditado mudanças !!!');
        insert into au_colaboradores values(sq_colaboradores.nextval, :old.nome, :old.cpf, :old.id_setor, user, sysdate, 'U');
    end if;
end;
