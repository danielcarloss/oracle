CREATE OR REPLACE FUNCTION F_GET_TORRE_PCT_SLA(p_id_enti_clie in number,
                                               p_id_serv      in number,
                                               p_id_docu      in number,
                                               p_id_moob      in number,
                                               p_data_ini     in date,
                                               p_data_fim     in date)

 return number is

  cursor c_mov is
    select id_estr_hier, id_equi_gest
      from tsp_mdoc_destinatarios
     where id_enti_clie = p_id_enti_clie
       and id_serv = p_id_serv
       and id_docu = p_id_docu
       and id_moob = p_id_moob;

  cursor c_count is
    select count(*)
      from tsp_movimento_documento
     where id_enti_clie = p_id_enti_clie
       and id_serv = p_id_serv
       and id_docu = p_id_docu
       and id_moob = p_id_moob;

  Result number;

  v_count   NUMBER;
  v_id_tmpd number;
  v_id_item number;
  v_id_gest number;

  v_id_estr_hier  number(10);
  v_id_equi_gest  number(10);
  v_tempo_prev    varchar2(100);
  v_tempo_corrido number;

BEGIN
   --test
   SELECT id_equi_gest
     into v_id_gest
     from tsp_mdoc_destinatarios
    where id_moob = p_id_moob;

  IF p_id_docu in (1140, 2, 1196, 1197, 3, 301, 2002, 2003, 14, 303, 27) THEN
    -- 1140       = 04 OS Execução (Negócio / TI)
    --   2        = 83 OS NEGOCIAÇÃO ESTABELECIMENTO (OSNE)
    -- 1196       = 80 DOCUMENTOS PRIVADOS
    -- 1197       = 82 DOCUMENTOS CONFIDENCIAIS
    --   3        = 84 OS INSTALAÇÃODE EQUIPAMENTO
    --  301       = 85 OS DE LOGÍSTICA (OSLO)
    --  2002      = 86 OS RECOLHA DE EQUIPAMENTO (OSRE)
    --  2003      = 87 OS FILHAS RECOLHA DE EQUIP.(OSFR)
    --  14        = 88 OS DE EMISSÃO DE NOTA FICAL (OSNF)
    --  303       = 90 OS ENVIO DE EQUIPAMENTO
    --  27        = 01 SOLICITAÇÃO DE PRIVILÉGIO
    v_id_tmpd := 4996; --ACI 36
    v_id_item := 18398; --ID Id item do SLA
  
    v_tempo_prev := to_number(nvl(ksp_api.f_Get_Item(p_id_enti_clie,
                                                     p_id_serv,
                                                     p_id_docu,
                                                     p_id_moob,
                                                     v_id_tmpd,
                                                     v_id_item),
                                  0));
  
  END IF;
  IF p_id_docu in (1150) THEN
    --  1150   = 22 OS DE CREDENCIAMENTO
    v_id_tmpd := 7190; --OSPL 005
    v_id_item := 29417; --ID Id item do SLA
  
    v_tempo_prev := ksp_api.f_tempo_util(p_id_enti_clie,
                                         p_id_serv,
                                         p_id_docu,
                                         to_date(substr(nvl(KSP_API.F_GET_ITEM(p_id_enti_clie,
                                                                               p_id_serv,
                                                                               p_id_docu,
                                                                               p_id_moob,
                                                                               v_id_tmpd,
                                                                               v_id_item),
                                                            '01/01/1900'),
                                                        1,
                                                        10),
                                                 'DD/MM/YYYY'),
                                         to_date(substr(nvl(KSP_API.F_GET_ITEM(p_id_enti_clie,
                                                                               p_id_serv,
                                                                               p_id_docu,
                                                                               p_id_moob,
                                                                               v_id_tmpd,
                                                                               v_id_item),
                                                            '01/01/1900'),
                                                        1,
                                                        10),
                                                 'DD/MM/YYYY'),
                                         1,
                                         v_id_gest);
  END IF;
  IF p_id_docu in (1181) THEN
    --  1181   = 41 OS PLANO DE AÇÃO
    v_id_tmpd := 7469; --OSPP 016
    v_id_item := 31121; --ID Id item do SLA
  
    v_tempo_prev := ksp_api.f_tempo_util(p_id_enti_clie,
                                         p_id_serv,
                                         p_id_docu,
                                         to_date(substr(nvl(KSP_API.F_GET_ITEM(p_id_enti_clie,
                                                                               p_id_serv,
                                                                               p_id_docu,
                                                                               p_id_moob,
                                                                               v_id_tmpd,
                                                                               v_id_item),
                                                            '01/01/1900'),
                                                        1,
                                                        10),
                                                 'DD/MM/YYYY'),
                                         to_date(substr(nvl(KSP_API.F_GET_ITEM(p_id_enti_clie,
                                                                               p_id_serv,
                                                                               p_id_docu,
                                                                               p_id_moob,
                                                                               v_id_tmpd,
                                                                               v_id_item),
                                                            '01/01/1900'),
                                                        1,
                                                        10),
                                                 'DD/MM/YYYY'),
                                         1,
                                         v_id_gest);
  END IF;
  IF p_id_docu in (1184) THEN
    --  1184   = 60 OS LOGISTICA DE CARTÕES
    v_id_tmpd := 7476; --003 OSLOGISTICA
    v_id_item := 31149; --ID Id item do SLA
  
    v_tempo_prev := ksp_api.f_tempo_util(p_id_enti_clie,
                                         p_id_serv,
                                         p_id_docu,
                                         to_date(substr(nvl(KSP_API.F_GET_ITEM(p_id_enti_clie,
                                                                               p_id_serv,
                                                                               p_id_docu,
                                                                               p_id_moob,
                                                                               v_id_tmpd,
                                                                               v_id_item),
                                                            '01/01/1900'),
                                                        1,
                                                        10),
                                                 'DD/MM/YYYY'),
                                         to_date(substr(nvl(KSP_API.F_GET_ITEM(p_id_enti_clie,
                                                                               p_id_serv,
                                                                               p_id_docu,
                                                                               p_id_moob,
                                                                               v_id_tmpd,
                                                                               v_id_item),
                                                            '01/01/1900'),
                                                        1,
                                                        10),
                                                 'DD/MM/YYYY'),
                                         1,
                                         v_id_gest);
  END IF;
  IF p_id_docu in (6) THEN
    -- 27     = RI.022 Registro de Acidentes
    v_id_tmpd := 2618; --RI.022
    v_id_item := 18538; --ID Id item do SLA
  
    v_tempo_prev := to_number(nvl(ksp_api.f_Get_Item(p_id_enti_clie,
                                                     p_id_serv,
                                                     p_id_docu,
                                                     p_id_moob,
                                                     v_id_tmpd,
                                                     v_id_item),
                                  0));
  END IF;
    IF p_id_docu in (800000000) THEN
    -- 800000000  = 65 OS CANCELAMENTO DE NF 
    v_id_tmpd := 4996; --ACI 36
    v_id_item := 29146; --ID Id item do SLA
  
    v_tempo_prev := ksp_api.f_tempo_util(p_id_enti_clie,
                                         p_id_serv,
                                         p_id_docu,
                                         to_date(substr(nvl(KSP_API.F_GET_ITEM(p_id_enti_clie,
                                                                               p_id_serv,
                                                                               p_id_docu,
                                                                               p_id_moob,
                                                                               v_id_tmpd,
                                                                               v_id_item),
                                                            '01/01/1900'),
                                                        1,
                                                        10),
                                                 'DD/MM/YYYY'),
                                         to_date(substr(nvl(KSP_API.F_GET_ITEM(p_id_enti_clie,
                                                                               p_id_serv,
                                                                               p_id_docu,
                                                                               p_id_moob,
                                                                               v_id_tmpd,
                                                                               v_id_item),
                                                            '01/01/1900'),
                                                        1,
                                                        10),
                                                 'DD/MM/YYYY'),
                                         1,
                                         v_id_gest);
  
  END IF;

  ----2618 --18538                                   

  --  Exception when others then
  --    v_tempo_prev := 0;

  ---------------------------------    
  if v_tempo_prev = 0 then
  
    v_tempo_prev := 528;
  
  end if;

  if nvl(v_tempo_prev, 0) = 0 then
    if v_tempo_prev is null then
      result := 10;
    else
      result := 200;
    end if;
  else
    open c_mov;
    fetch c_mov
      into v_id_estr_hier, v_id_equi_gest;
    close c_mov;
  
    if v_id_equi_gest is not null then
      v_tempo_corrido := ksp_api.f_tempo_util(p_id_enti_clie,
                                              p_id_serv,
                                              p_id_docu,
                                              p_data_ini,
                                              p_data_fim,
                                              v_id_estr_hier,
                                              v_id_equi_gest);
    else
      v_tempo_corrido := ksp_api.f_tempo_util(p_id_enti_clie,
                                              p_id_serv,
                                              p_id_docu,
                                              p_data_ini,
                                              p_data_fim);
    end if;
  
    result := ceil(v_tempo_corrido * 100 / v_tempo_prev);
  
  end if;

  return(Result);

EXCEPTION
  WHEN OTHERS THEN
    result := 1000;
    return(Result);
  
end F_GET_TORRE_PCT_SLA;
/
