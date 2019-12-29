create table au_colaboradores
(
    id_auditoria int,
    nome varchar2(40),
    cpf varchar2(11),
    id_setor int,
    login varchar2(50),
    data timestamp,
    tipo char(1)
);

alter table au_colaboradores add constraint pk_au_colaboradores primary key(id_auditoria);
alter table au_colaboradores add constraint fk_setor_au_colaboradores foreign key(id_setor) references tb_setor(id_setor);
alter table au_colaboradores add constraint ck_aucolaboradores_del_up check( tipo in ('D','U'));