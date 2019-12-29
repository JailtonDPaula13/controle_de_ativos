create or replace procedure pr_colaboradores(v_nome_rs varchar2,
											  v_nome varchar2,
											  v_sexo char,
											  v_cpf int,
                                              v_nascido date,
											  v_id_setor int)
is
	v_setor int := 0;
    v_cpfc int := 0;
    v_tempo date := sysdate;
begin

	select count(*) into v_setor from tb_setor where id_setor = v_id_setor;
    select count(*) into v_cpfc from tb_colaboradores where cpf = v_cpf;

	if(length(v_nome_rs) > 40) then
		dbms_output.put_line('Limete máximo de caracteres para o nome razão social é 40');
	elsif(length(v_nome) > 40) then
		dbms_output.put_line('Limete máximo de caracteres para o nome é 40');
	elsif(v_nome is null) then
		dbms_output.put_line('Nome deve ser informado');
	elsif(upper(v_sexo) not in('M','F'))then
		dbms_output.put_line('Sexo informado deve ser M ou F');
	elsif(fn_cpf(v_cpf) = 0)then
		dbms_output.put_line('CPF invalido');
    elsif(v_cpfc = 1)then
        dbms_output.put_line('CPF já cadastrado');
    elsif(v_nascido > v_tempo) then
        dbms_output.put_line('Idade não compatível');
	elsif(v_setor <> 1)then
		dbms_output.put_line('Setor não existe');
    else
        dbms_output.put_line('Cadastrado');
        insert into tb_colaboradores values (sq_colaboradores.nextval, upper(v_nome_rs), upper(v_nome), upper(v_sexo), v_cpf, v_nascido, v_id_setor);
	end if; 
end;