create or replace procedure pr_bens_entrada(
    v_objeto varchar2,
    v_marca varchar2,
    v_modelo varchar2,
    v_sn varchar2,
    v_obs varchar2,
    v_estado char,
    v_usuario int,
    v_dt_entrada_estoque date
                                           )
as
    v_serie int :=0;
    v_usuarioc int :=0;
    v_setor int :=0;
begin

    select count(*) into v_serie from tb_bens b where b.sn = upper(v_sn);
    select count(*) into v_usuarioc from tb_colaboradores c where c.id_colaborador = v_usuario;
    select id_setor into v_setor from tb_setor s where s.setor = 'ALMOXARIF';

    --objeto
    if(v_objeto is null)then
        dbms_output.put_line('Nome do objeto deve ser informado');
    elsif(length(v_objeto) > 50)then
        dbms_output.put_line('Nome do objeto deve ter no máximo 50 caracteres');
    --marca
    elsif(v_marca is null)then
        dbms_output.put_line('Nome da marca deve ser informado');
    elsif(length(v_marca) > 50)then
        dbms_output.put_line('Nome da marca deve ter no máximo 50 caracteres');
    --modelo
    elsif(length(v_modelo) > 50)then
        dbms_output.put_line('O modelo deve ter no máximo 50 caracteres');
    --série
    elsif(v_sn is null)then
        dbms_output.put_line('O número de série do objeto deve ser informado.');
    elsif(length(v_sn) > 50)then
        dbms_output.put_line('O número de série deve ter no máximo 50 caracteres');
    elsif(v_serie <> 0)then
        dbms_output.put_line('O código de série já foi cadastrado');
    --obs
    elsif(length(v_obs) > 1000)then
        dbms_output.put_line('A observação deve ter no máximo 1000 caracteres');
    --estado
    elsif(upper(v_estado) = 'I')then
        dbms_output.put_line('Intem desativados não deve entra no sistema');
    elsif(v_estado not in('N','B','D') or v_estado is null)then
        dbms_output.put_line('Os estados informados deve ser "N" pra novo, "B" para bom estado ou "D"´para danificados');
    elsif(length(v_estado) > 1)then
        dbms_output.put_line('O estado deve conter apenas uma caractere');
    --usuario
    elsif(v_usuarioc = 0)then
        dbms_output.put_line('O usuário não está cadastrado ou nulo');
    else
        insert into tb_bens values(sq_bens.nextval, upper(v_objeto), upper(v_marca), upper(v_modelo), upper(v_sn), upper(v_obs), upper(v_estado), v_usuario, v_setor, v_dt_entrada_estoque, null);
    end if;      
end;
