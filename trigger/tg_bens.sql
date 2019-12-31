create or replace trigger tg_bens
before update or delete on tb_bens
for each row
begin
	if(:new.id_produto is null)then
		insert into au_bens values (sq_bens.nextval, :old.id_produto, :old.objeto, :old.marca, :old.modelo, :old.sn, :old.obs, :old.estado, :old.usuario, :old.id_setor, :old.dt_entrada_estoque, :old.dt_vinculo, user, sysdate(), 'D');
    else
    	insert into au_bens values (sq_bens.nextval, :old.id_produto, :old.objeto, :old.marca, :old.modelo, :old.sn, :old.obs, :old.estado, :old.usuario, :old.id_setor, :old.dt_entrada_estoque, :old.dt_vinculo, user, sysdate(), 'U');
	end if;
end;