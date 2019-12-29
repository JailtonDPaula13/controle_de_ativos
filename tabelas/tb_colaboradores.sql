create table tb_colaboradores
(
	id_colaborador int,
	nome_rs varchar2(40),
	nome varchar2(40) not null,
	sexo char(1) not null,
	cpf varchar(11) not null,
	id_setor int
);

alter table tb_colaboradores add constraint pk_colaboradores primary key(id_colaborador);
alter table tb_colaboradores add constraint ck_sexo_colaborador check(sexo in('M','F'));
alter table tb_colaboradores add constraint fk_colaboradores_setor foreign key(id_setor) references tb_setor(id_setor);
alter table tb_colaboradores add constraint uq_cpf_colaborador unique(cpf);