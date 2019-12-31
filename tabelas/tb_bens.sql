create table tb_bens
(
    id_produto int,
    objeto varchar2(50) not null,
    marca varchar2(50) not null,
    modelo varchar2(50),
    sn varchar2(50) not null,
    obs varchar2(1000),
    estado char(1) not null,
    usuario int,
    id_setor int not null,
    dt_entrada_estoque date,
    dt_vinculo date
);

comment on column tb_bens.estado is 'N: novo, B:bom, D:danificado, I:inativo';
comment on column tb_bens.dt_entrada_estoque is 'data que o produto foi entregue na empresa';
comment on column tb_bens.dt_vinculo is 'data do ultimo vinculo ao colaborador';

alter table tb_bens add constraint pk_bens primary key(id_produto);
alter table tb_bens add constraint ck_estado_tb_bens check(estado in('N','B','D','I'));
alter table tb_bens add constraint fk_usuario_tb_bens foreign key(usuario) references tb_colaboradores(id_colaborador);
alter table tb_bens add constraint fk_setor_tb_bens foreign key(id_setor) references tb_setor(id_setor);