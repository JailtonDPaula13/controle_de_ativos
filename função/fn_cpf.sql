create or replace function fn_cpf(v_cpf int) return int
is
    v_calculo int := 0;
    v_calculod int := 0;
    v_contador int := 10;
    v_digitos int := 0;
begin
        --calculos dos noves primeiro digito
            for i in 1..9 loop
                v_calculo := substr(lpad(v_cpf,11,0),i,1)*v_contador + v_calculo;
                v_contador := v_contador - 1;
            end loop;
        --validação primeiro dígito
            
            v_calculo := mod((v_calculo * 10),11);
            if(v_calculo = 10) then
               v_calculo := 0;
            end if;
        --calculo dos 10 digitos do cpf
            v_contador := 11;
            for a in 1..10 loop
                v_calculod := substr(lpad(v_cpf,11,0),a,1)*v_contador+v_calculod;
                v_contador := v_contador - 1;
            end loop;
        --validação do segundo dígito
            
            v_calculod := mod((v_calculod * 10),11);
            if(v_calculod = 10) then
               v_calculod := 0;
            end if;
        --retorno
        v_digitos := v_calculo||v_calculod;
        if(v_digitos = substr(lpad(v_cpf,11,0),10,2))then
            return 1;
        else
            return 0;
        end if;
end;