create table tb_setor
(
    id_setor int,
    setor varchar2(30)
)tablespace TS_ATV
;

alter table tb_setor add constraint pk_tb_Setor primary key(id_setor);
alter table tb_setor add constraint uq_tb_Setor unique(setor);