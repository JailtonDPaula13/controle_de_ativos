create table au_bens
(
    id_au_produto int,
    id_produto int,
    objeto varchar2(50)not null,
    marca varchar2(50),
    modelo varchar2(50),
    sn varchar2(50) not null,
    obs varchar2(1000),
    estado char(1),
    usuario int not null,
    id_setor int not null,
    dt_entrada_estoque date,
    dt_vinculo date,
    usuario_fk varchar(30) not null,
    data timestamp not null,
    tipo char(1)
);

alter table au_bens add constraint pk_au_bens primary key(id_au_produto);
alter table au_bens add constraint ck_estado_au_bens check(estado in('N','B','D','I'));
alter table au_bens add constraint ck_du_au_bens check(tipo in('D','U'));
alter table au_bens add constraint fk_usuario_au_bens foreign key(usuario) references tb_colaboradores(id_colaborador);
alter table au_bens add constraint fk_setor_au_bens foreign key(id_setor) references tb_setor(id_setor);