--primeiro passo criara tablespace
CREATE TABLESPACE TS_ATV
DATAFILE 'C:\ORACLEXE\APP\ORACLE\ORADATA\XE\TS_ATIVOS.DBF'
SIZE 50M AUTOEXTEND ON NEXT 10M MAXSIZE 200M;
--segundo criar usuário
CREATE USER JAILTON 		--nomenclatura do LOGIN
IDENTIFIED BY JD1		--definição da senha de acesso
DEFAULT TABLESPACE TS_ATV	--TABLESPACE o qual deseja do acesso
;
--terceiro passo acesso a criar DB
GRANT CREATE SESSION TO JAILTON WITH ADMIN OPTION;
--quarto passo criar grant
grant create table to JAILTON with admin option;
grant create tablespace to JAILTON with admin option;
grant create sequence to jailton with admin option;
grant create procedure to jailton with admin option;
GRANT UNLIMITED TABLESPACE TO JAILTON WITH ADMIN OPTION;