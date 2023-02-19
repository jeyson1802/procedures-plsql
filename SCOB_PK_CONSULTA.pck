CREATE OR REPLACE PACKAGE SCOB_PK_CONSULTA is

type cu_rec_set is ref cursor;


PROCEDURE SCOB_SP_S_CONSULTA_DOCUMENTO
  /*
-----------------------------------------------------------
-- AUTOR        : RMCA
-- CREADO       : 19.09.2011
-- PROPOSITO    : Consulta de Documentos Generados de Multas y Expedientes
-----------------------------------------------------------
*/
  (
  --FILTROS MULTAS
   PI_V_ANIO_CUM              VARCHAR2 --ANIO CUM
  ,PI_V_CUM_INI               VARCHAR2 --RANGO INICIAL DE LA CUM
  ,PI_V_CUM_FIN               VARCHAR2 --RANGO FINAL DE LA CUM
  ,PI_V_FEC_GEN_CUM_INI       VARCHAR2 --RANGO INICIAL DE LA FECHA GENERACION CUM
  ,PI_V_FEC_GEN_CUM_FIN       VARCHAR2 --RANGO FINAL DE LA FECHA GENERACION CUM
  ,PI_V_EST_MULTA_COBRAN      VARCHAR2 --ESTADO DE LA MULTA COBRANZA
  ,PI_V_ANIO_FILE             VARCHAR2 --AÑO DEL FILE EXPEDIENTE DE COBRANZA
  ,PI_V_NRO_FILE_INI          VARCHAR2 --RANGO INICIAL DEL Nº DE FILE EXPEDIENTE DE COBRANZA
  ,PI_V_NRO_FILE_FIN          VARCHAR2 --RANGO FINAL DEL Nº DE FILE EXPEDIENTE DE COBRANZA
  --EXPEDIENTE COBRANZA
  ,PI_V_ANIO_EXP              VARCHAR2 --AÑO EXPEDIENTE DE COBRANZA
  ,PI_V_NRO_EXP_COB_INI       VARCHAR2 --RANGO INICIAL DEL Nº DE EXPEDIENTE DE COBRANZA
  ,PI_V_NRO_EXP_COB_FIN       VARCHAR2 --RANGO FINAL DEL Nº DE EXPEDIENTE DE COBRANZA
  ,PI_V_FECGENEXPCOB_INI      VARCHAR2 --FECHA DE GENERACION DEL EXPEDIENTE DE COBRANZA
  ,PI_V_FECGENEXPCOB_FIN      VARCHAR2 --FECHA DE GENERACION DEL EXPEDIENTE DE COBRANZA
  ,PI_V_EST_EXPE              VARCHAR2 --ESTADO DEL EXPEDIENTE COBRANZ
  ,PI_V_TIP_DOC               VARCHAR2 --TIPO DE DOCUMENTO DE EXPEDIENTE COBRANZA
  ,PI_NRO_DOC_INI             VARCHAR2 --NUMERO DE DOCUMENTO DE MULTA O EXPEDIENTE COBRANZA
  ,PI_NRO_DOC_FIN             VARCHAR2 --NUMERO DE DOCUMENTO DE MULTA O EXPEDIENTE COBRANZA
  ,PI_V_FEC_GEN_DOCEXPE_INI   VARCHAR2 --FECHA DE GENERACION DEL DOCUMENTO DE MULTA O EXPEDIENTE COBRANZA
  ,PI_V_FEC_GEN_DOCEXPE_FIN   VARCHAR2 --FECHA DE GENERACION DEL DOCUMENTO DE MULTA O EXPEDIENTE COBRANZA
  -- Req. 32 - @dcelis/begin
  ,PI_V_FEC_NOTIF_INI         VARCHAR2 -- FECHA DE NOTIFICACION DE INICIO
  ,PI_V_FEC_NOTIF_FIN         VARCHAR2 --FECHA DE NOTIFICACION DE FIN
  -- Req. 32 - @dcelis/end
  ,PI_V_GES_COBRANZA          VARCHAR2 --USUARIO DEL GESTRO DE COBRANZA
  --EXPEDIENTES PENDIENTE TRAMITE(T_SCOB_EXPED_SUSPENDE)
  ,PI_V_FEC_EXPENSUS_INI      VARCHAR2 --RANGO INICIAL DE LA FECHA DE EXPEDIENTES PENDIENTES DE TRAMITE SUSPENCION
  ,PI_V_FEC_EXPENSUS_FIN      VARCHAR2 --RANGO FINAL DE LA FECHA DE EXPEDIENTES PENDIENTES DE TRAMITE SUSPENCION
  ,PI_V_FEC_EXPENFRA_INI      VARCHAR2 --RANGO INICIAL DE LA FECHA DE EXPEDIENTES PENDIENTES DE TRAMITE FRACCIONAMIENTO
  ,PI_V_FEC_EXPENFRA_FIN      VARCHAR2 --RANGO FINAL DE LA FECHA DE EXPEDIENTES PENDIENTES DE TRAMITE FRACCIONAMIENTO
  --TIPO DE EMBARGO
  ,PI_V_TIP_EMBARGO           VARCHAR2 --TIPO DE EMBARGOS
  ,PI_V_FEC_RESOL_EMB_INI     VARCHAR2 --FECHA DE RESOLUCION DEL EMBARGO
  ,PI_V_FEC_RESOL_EMB_FIN     VARCHAR2 --FECHA DE RESOLUCION DEL EMBARGO
  ,PI_V_IND_EXP_CART_FIAN     VARCHAR2 --INDICADOR DE EXPEDIENTE CON CARTA FIANZA ASOCIADA
  --SANCIONADO
  ,PI_V_COD_INDECOPI_INI      VARCHAR2 --CÓDIGO DEL INDECOPI
  ,PI_V_COD_INDECOPI_FIN      VARCHAR2 --CÓDIGO DEL INDECOPI
  ,PI_I_TIP_PERSONA           INTEGER  --TIPO DE PERSONERÍA
  ,PI_V_RAZON_SOCIAL          VARCHAR2 --RAZÓN SOCIAL
  ,PI_V_APE_PATERNO           VARCHAR2 --APELLIDO PATERNO
  ,PI_V_APE_MATERNO           VARCHAR2 --APELLIDO MATERNO
  ,PI_V_APE_CASADA            VARCHAR2 --APELLIDO CASADA
  ,PI_V_NOMBRES               VARCHAR2 --NOMBRES
  ,PI_I_TIPO_DOC              INTEGER  --TIPO DE DOCUMENTO
  ,PI_V_NRO_DOC               VARCHAR2 --Nº DE DOCUMENTO DE IDENTIDAD
  ,PI_V_NRO_RUC               VARCHAR2 --Nº RUC
  ,PI_N_ID_SECT_ECONO         INTEGER  --CIIU (ACTIVIDAD ECONOMICA)
  ,PI_V_IND_ASOC_CONS         VARCHAR2 --INDICADOR DE ASOCIACIN DE CONSUMIDOR
  ,PO_CU_RETORNO              OUT CU_REC_SET
);

procedure scob_sp_s_multa_basica(
-----------------------------------------------------------------------------------------------
/*001*/  pi_v_fec_gen_cum_ini                   in varchar2      --FECHA GENERACION CUM INI
/*002*/  ,pi_v_fec_gen_cum_fin                   in varchar2      --FECHA GENERACION CUM FIN
/*003*/  ,pi_v_cum_ini                           in varchar2      --cum
/*004*/  ,pi_v_cum_fin                           in varchar2      --cum
/*005*/  ,pi_v_nro_exp_unico_ini                 in varchar2      --nro. expediente administrativo
/*006*/  ,pi_v_nro_exp_unico_fin                 in varchar2      --nro. expediente administrativo
/*007*/  ,pi_v_nro_resol_OR_ini                  in varchar2      --nro. resolucion or ini
/*008*/  ,pi_v_nro_resol_OR_fin                  in varchar2      --nro. resolucion or fin
/*009*/  ,pi_v_nro_resol_CO_ini                  in varchar2      --nro. resolucion comision ini
/*010*/  ,pi_v_nro_resol_CO_fin                  in varchar2      --nro. resolucion comision fin
/*011*/  ,pi_v_nro_resol_SA_ini                  in varchar2      --nro. resolucion sala ini
/*012*/  ,pi_v_nro_resol_SA_fin                  in varchar2      --nro. resolucion sala fin
/*013*/  ,pi_v_fec_reso_OR_ini                   in varchar2      --FECHA RESOLUCION OR INI
/*014*/  ,pi_v_fec_reso_OR_fin                   in varchar2      --FECHA RESOLUCION OR FIN
/*015*/  ,pi_v_fec_reso_CO_ini                   in varchar2      --FECHA RESOLUCION OR INI
/*016*/  ,pi_v_fec_reso_CO_fin                   in varchar2      --FECHA RESOLUCION OR FIN
/*017*/  ,pi_v_fec_reso_SA_ini                   in varchar2      --FECHA RESOLUCION OR INI
/*018*/  ,pi_v_fec_reso_SA_fin                   in varchar2      --FECHA RESOLUCION OR FIN
/*019*/  ,pi_v_id_sede                           in varchar2      --cadena id sede
/*020*/  ,pi_v_cod_estado_multa_or               in varchar2      --cadena estado de la multa resolutivo
/*021*/  ,pi_v_id_materia                        in varchar2      --cadena materia
/*022*/  ,pi_v_id_org_resol                      in varchar2      --cadena organo resolutivo
/*023*/  ,pi_n_valor_uit_ini                     in number        --nro uit ini
/*024*/  ,pi_n_valor_uit_fin                     in number        --nro uit fin
/*025*/  ,pi_v_cod_estado_pago                   in varchar2      --cadena estado pago de la multa
/*026*/  ,pi_c_flg_asocu_multa                   in char          --flag asocu
-----------------------------------------------------------------------------------------------
        --denunciante
/*027*/  ,pi_v_d_codSanciona_ini                 in varchar2      --Código del INDECOPI
/*028*/  ,pi_v_d_codSanciona_fin                 in varchar2      --Código del INDECOPI
/*029*/  ,pi_v_d_id_tip_persona                  in varchar2      --Tipo de Personería
/*030*/  ,pi_v_d_razon_social                    in varchar2      --Razón Social
/*031*/  ,pi_v_d_ape_paterno                     in varchar2      --Apellido Paterno
/*032*/  ,pi_v_d_ape_materno                     in varchar2      --Apellido Materno
/*033*/  ,pi_v_d_ape_casada                      in varchar2      --Apellido Casada
/*034*/  ,pi_v_d_pri_nombre                      in varchar2      --Primer nombre
/*035*/  ,pi_v_d_seg_nombre                      in varchar2      --Segundo nombre
/*036*/  ,pi_i_d_tipo_doc                        in integer       --Tipo de Documento
/*037*/  ,pi_v_d_nro_doc                         in varchar2      --Nº de documento de identidad
/*038*/  ,pi_c_d_flg_asocu                       in char          --flag asocu
        --denunciado
/*039*/  ,pi_v_do_codSanciona_ini                in varchar2      --Código del INDECOPI
/*040*/  ,pi_v_do_codSanciona_fin                in varchar2      --Código del INDECOPI
/*041*/  ,pi_v_do_id_tip_persona                 in varchar2      --Tipo de Personería
/*042*/  ,pi_v_do_razon_social                   in varchar2      --Razón Social
/*043*/  ,pi_v_do_ape_paterno                    in varchar2      --Apellido Paterno
/*044*/  ,pi_v_do_ape_materno                    in varchar2      --Apellido Materno
/*045*/  ,pi_v_do_ape_casada                     in varchar2      --Apellido Casada
/*046*/  ,pi_v_do_pri_nombre                     in varchar2      --Primer nombre
/*047*/  ,pi_v_do_seg_nombre                     in varchar2      --Segundo nombre
/*048*/  ,pi_i_do_tipo_doc                       in integer       --Tipo de Documento
/*049*/  ,pi_v_do_nro_doc                        in varchar2      --Nº de documento de identidad
/*050*/  ,pi_c_do_flg_asocu                      in char          --flag asocu
         --sancionado
/*051*/  ,pi_v_s_codSanciona_ini                 in varchar2      --Código del INDECOPI
/*052*/  ,pi_v_s_codSanciona_fin                 in varchar2      --Código del INDECOPI
/*053*/  ,pi_v_s_id_tip_persona                  in varchar2      --Tipo de Personería
/*054*/  ,pi_v_s_razon_social                    in varchar2      --Razón Social
/*055*/  ,pi_v_s_ape_paterno                     in varchar2      --Apellido Paterno
/*056*/  ,pi_v_s_ape_materno                     in varchar2      --Apellido Materno
/*057*/  ,pi_v_s_ape_casada                      in varchar2      --Apellido Casada
/*058*/  ,pi_v_s_pri_nombre                      in varchar2      --Primer nombre
/*059*/  ,pi_v_s_seg_nombre                      in varchar2      --Segundo nombre
/*060*/  ,pi_i_s_tipo_doc                        in integer       --Tipo de Documento
/*061*/  ,pi_v_s_nro_doc                         in varchar2      --Nº de documento de identidad
/*062*/  ,pi_c_s_flg_asocu                       in char           --flag asocu
--@0002:ini
/*063*/  ,pi_c_s_flg_buscar_by_contenido         in char           --0=NO; 1=SI.
--@0002:fin
-----------------------------------------------------------------------------------------------
         ,po_cu_retorno                          out cu_rec_set
);

procedure scob_sp_s_multa_avanzada_bk(
-----------------------------------------------------------------------------------------------
/*001*/   pi_v_area_macro                        in varchar2      --AREA MACRO
/*002*/  ,pi_v_cum_ini                           in varchar2      --cum
/*003*/  ,pi_v_cum_fin                           in varchar2      --cum
/*004*/  ,pi_v_fec_gen_cum_ini                   in varchar2      --FECHA GENERACION CUM INI
/*005*/  ,pi_v_fec_gen_cum_fin                   in varchar2      --FECHA GENERACION CUM FIN
/*006*/  ,pi_v_id_sede                           in varchar2      --sede
/*007*/  ,PI_V_ID_COD_DPTO_SEDE                  in VARCHAR2      --CODIGO DEPARTAMENTO SEDE
/*008*/  ,PI_V_ID_COD_PROV_SEDE                  in VARCHAR2      --CODIGO PROVINCIA SEDE
/*009*/  ,PI_V_ID_COD_DIST_SEDE                  in VARCHAR2      --CODIGO DISTRITO SEDE
/*010*/  ,pi_v_id_org_resol                      in varchar2      --organo resolutivo
/*011*/  ,PI_V_ID_COD_DPTO_ORGR                  in VARCHAR2      --CODIGO DEPARTAMENTO ORGANO RESOLUTIVO
/*012*/  ,PI_V_ID_COD_PROV_ORGR                  in VARCHAR2      --CODIGO PROVINCIA ORGANO RESOLUTIVO
/*013*/  ,PI_V_ID_COD_DIST_ORGR                  in VARCHAR2      --CODIGO DISTRITO ORGANO RESOLUTIVO
/*014*/  ,PI_V_ID_NRO_INSTANCIA                  in VARCHAR2      --NUMERO DE INSTANCIA
/*015*/  ,pi_v_id_materia                        in varchar2      --materia
/*016*/  ,pi_v_id_sub_materia                    in varchar2      --SUBMATERIA
/*017*/  ,pi_v_nro_exp_unico_ini                 in varchar2      --nro. expediente administrativo
/*018*/  ,pi_v_nro_exp_unico_fin                 in varchar2      --nro. expediente administrativo
/*019*/  ,pi_v_nroExpAdm_nivel                   in varchar2      --nro. expediente antiguo
/*020*/  ,pi_v_nro_resol                         in varchar2      --nro. resolucion or
/*021*/  ,pi_v_fec_reso_or_ini                   in varchar2      --FECHA RESOLUCION OR INI
/*022*/  ,pi_v_fec_reso_or_fin                   in varchar2      --FECHA RESOLUCION OR FIN
/*023*/  ,pi_v_fec_notifi_or_ini                 in varchar2      --FECHA NOTIFICACION RESOLUCION INI
/*024*/  ,pi_v_fec_notifi_or_fin                 in varchar2      --FECHA NOTIFICACION RESOLUCION FIN
/*025*/  ,PI_V_FEC_GENERACION_SEC_INI            in VARCHAR2      --FECHA GENERACION SEC
/*026*/  ,PI_V_FEC_GENERACION_SEC_FIN            in VARCHAR2      --FECHA GENERACION SEC
---
/*027*/  ,pi_v_fec_recepcion_aec_ini             in varchar2      --FECHA RECEPCION AEC INICIO
/*028*/  ,pi_v_fec_recepcion_aec_fin             in varchar2      --FECHA RECEPCION AEC FIN
/*029*/  ,PI_V_ANIO_INGRESO_AEC_INI              in varchar2      --AÑO INGRESO AL AEC INI
/*030*/  ,PI_V_ANIO_INGRESO_AEC_FIN              in varchar2      --AÑO INGRESO AL AEC FIN
/*031*/  ,PI_V_NRO_INGRESO_AEC_INI               in varchar2      --nro. ingreso aec
/*032*/  ,PI_V_NRO_INGRESO_AEC_FIN               in varchar2      --nro. ingreso aec
---
/*033*/  ,PI_V_ANIO_FILE_INI                     in varchar2      --AÑO FILE INI
/*034*/  ,PI_V_ANIO_FILE_FIN                     in varchar2      --AÑO FILE FIN
/*035*/  ,PI_V_NRO_FILE_INI                      in varchar2      --nro. file
/*036*/  ,PI_V_NRO_FILE_FIN                      in varchar2      --nro. file
/*037*/  ,pi_v_fec_recepcion_file_ini            in varchar2      --FECHA RECEPCION FILE INICIO
/*038*/  ,pi_v_fec_recepcion_file_fin            in varchar2      --FECHA RECEPCION FILE FIN
---
/*039*/  ,pi_n_valor_uit_ini                     in number        --nro uit ini
/*040*/  ,pi_n_valor_uit_fin                     in number        --nro uit fin
/*041*/  ,pi_n_monto_uit_ini                     in NUMBER        --MONTO UIT INI
/*042*/  ,pi_n_monto_uit_fin                     in NUMBER        --MONTO UIT FIN
/*043*/  ,pi_n_saldo_ini                         in NUMBER        --SALDO UIT INI
/*044*/  ,pi_n_saldo_fin                         in NUMBER        --SALDO UIT FIN
/*045*/  ,pi_v_id_tipo_multa                     in varchar2      --TIPO MULTA (SOLIDARIA/INDIVIDUAL)
/*046*/  ,pi_v_cod_estado_multa_resol            in varchar2      --estado de la multa resolutivo
/*047*/  ,pi_v_cod_estado_pago                   in varchar2      --estado pago de la multa
/*048*/  ,PI_V_FEC_ESTADO_MULTA_OR_INI           in VARCHAR2      --FECHA ESTADO MULTA OR INI
/*049*/  ,PI_V_FEC_ESTADO_MULTA_OR_FIN           in VARCHAR2      --FECHA ESTADO MULTA OR FIN
/*050*/  ,PI_V_FEC_ESTADO_MULTA_COB_INI          in VARCHAR2      --FECHA ESTADO MULTA COBRANZA
/*051*/  ,PI_V_FEC_ESTADO_MULTA_COB_FIN          in VARCHAR2      --FECHA ESTADO MULTA COBRANZA
/*052*/  ,pi_v_cod_estado_multa_cob              in varchar2      --estado de la multa cobranza
/*053*/  ,pi_v_cod_motivo_multa_cob              in varchar2      --motivo multa cobranza
/*054*/  ,PI_V_IND_TIPO_PAGO                     in VARCHAR2      --INDICADOR DE PAGO
/*055*/  ,pi_c_flg_asocu_multa                   IN CHAR         --INDICADOR % ASOCU > 0
-----------------------------------------------------------------------------------------------
/*056*/  ,pi_v_cod_estado_exped_cob              in varchar2      --estado expediente cobranza
/*057*/  ,pi_v_anio                              in varchar2      --año expediente cobranza
/*058*/  ,pi_v_nro_exp_cob_ini                   in varchar2      --nro. expediente cobranza
/*059*/  ,pi_v_nro_exp_cob_fin                   in varchar2      --nro. expediente cobranza
/*060*/  ,pi_v_fec_gen_exped_cob_ini             in varchar2      --FECHA GENERACION EXPED COBRANZA INI
/*061*/  ,pi_v_fec_gen_exped_cob_fin             in varchar2      --FECHA GENERACION EXPED COBRANZA FIN
-------
/*062*/  ,pi_v_gestor_cobranza                   in varchar2      --Gestor de cobranza
/*063*/  ,pi_v_fec_emi_rec_ini                   in varchar2      --Fecha de Emisión de la REC
/*064*/  ,pi_v_fec_emi_rec_fin                   in varchar2      --Fecha de Emisión de la REC
/*065*/  ,pi_v_fec_noti_rec_ini                  in varchar2      --Fecha de Notificación de la REC
/*066*/  ,pi_v_fec_noti_rec_fin                  in varchar2      --Fecha de Notificación de la REC
/*067*/  ,pi_v_cod_motivo_exped_cob              in varchar2      --motivo expediente cobranza---------
/*068*/  ,pi_v_fec_est_exped_cob_ini             in varchar2      --Fecha de Estado del Expediente
/*069*/  ,pi_v_fec_est_exped_cob_fin             in varchar2      --Fecha de Estado del Expediente
/*070*/  ,pi_v_num_env_arch_ini                  in varchar2      --Nº Envio a Archivo Central
/*071*/  ,pi_v_num_env_arch_fin                  in varchar2      --Nº Envio a Archivo Central
/*072*/  ,pi_v_fec_envi_arch_ini                 in varchar2      --Fecha de Envío a Archivo Central
/*073*/  ,pi_v_fec_envi_arch_fin                 in varchar2      --Fecha de Envío a Archivo Central
/*074*/  ,pi_v_nro_ofic_sunat_ini                in varchar2      --Nº de Oficio de la SUNAT
/*075*/  ,pi_v_nro_ofic_sunat_fin                in varchar2      --Nº de Oficio de la SUNAT
/*076*/  ,pi_n_dere_antiDump_ini                 in NUMBER        --Derechos Antidumping
/*077*/  ,pi_n_dere_antiDump_fin                 in NUMBER        --Derechos Antidumping
/*078*/  ,pi_v_nro_parti_ini                     in varchar2      --Partida Arancelaria
/*079*/  ,pi_v_nro_parti_fin                     in varchar2      --Partida Arancelaria
/*080*/  ,pi_v_nro_dua_ini                       in varchar2      --Nº DUA
/*081*/  ,pi_v_nro_dua_fin                       in varchar2      --Nº DUA
/*082*/  ,pi_v_nro_liq_cob_ini                   in varchar2      --Nº Liquidación de Cobranza
/*083*/  ,pi_v_nro_liq_cob_fin                   in varchar2      --Nº Liquidación de Cobranza
/*084*/  ,pi_v_id_intendencia                    in varchar2      --Intendencia antidumping
/*085*/  ,pi_c_flg_ind_embargo                   in char          --INDICADOR TIENE EMBARGO?
/*086*/  ,pi_v_fec_asig_gestor_ini               in varchar2      --fecha de asignacion de gestor ini
/*087*/  ,pi_v_fec_asig_gestor_fin               in varchar2      --fecha de asignacion de gestor fin
/*088*/  ,pi_v_fec_carta_precoactiva_ini         in varchar2      --fecha de carta precoactiva inicio
/*089*/  ,pi_v_fec_carta_precoactiva_fin         in varchar2      --fecha de carta precoactiva fin
/*090*/  ,pi_v_id_expectativa_cobro              in varchar2      --cadena codigos espectativa de cobro

-----------------------------------------------------------------------------------------------
        --denunciante
/*091*/  ,pi_v_d_codSanciona_ini                 in varchar2      --Código del INDECOPI
/*092*/  ,pi_v_d_codSanciona_fin                 in varchar2      --Código del INDECOPI
/*093*/  ,pi_i_d_tip_persona                     in integer       --Tipo de Personería
/*094*/  ,pi_v_d_razon_social                    in varchar2      --Razón Social
/*095*/  ,pi_v_d_ape_paterno                     in varchar2      --Apellido Paterno
/*096*/  ,pi_v_d_ape_materno                     in varchar2      --Apellido Materno
/*097*/  ,pi_v_d_ape_casada                      in varchar2      --Apellido Casada
/*098*/  ,pi_v_d_pri_nombre                      in varchar2      --Primer nombre
/*099*/  ,pi_v_d_seg_nombre                      in varchar2      --Segundo nombre
/*100*/  ,pi_i_d_tipo_doc                        in integer       --Tipo de Documento
/*101*/  ,pi_v_d_nro_doc                         in varchar2      --Nº de documento de identidad
/*102*/  ,pi_i_d_tip_empresa                     in integer       --Tipo de Empresa
/*103*/  ,pi_n_d_id_sect_econo                   in number        --CIIU (Actividad Economica)
/*104*/  ,pi_c_d_flg_asocu                       in char          --flag asocu
/*105*/  ,pi_c_d_fl_oficio                       in char          --indicador denunciante de oficio=Indecopi
        --denunciado
/*106*/  ,pi_v_do_codSanciona_ini                in varchar2      --Código del INDECOPI
/*107*/  ,pi_v_do_codSanciona_fin                in varchar2      --Código del INDECOPI
/*108*/  ,pi_i_do_tip_persona                    in integer       --Tipo de Personería
/*109*/  ,pi_v_do_razon_social                   in varchar2      --Razón Social
/*110*/  ,pi_v_do_ape_paterno                    in varchar2      --Apellido Paterno
/*111*/  ,pi_v_do_ape_materno                    in varchar2      --Apellido Materno
/*112*/  ,pi_v_do_ape_casada                     in varchar2      --Apellido Casada
/*113*/  ,pi_v_do_pri_nombre                     in varchar2      --Primer nombre
/*114*/  ,pi_v_do_seg_nombre                     in varchar2      --Segundo nombre
/*115*/  ,pi_i_do_tipo_doc                       in integer       --Tipo de Documento
/*116*/  ,pi_v_do_nro_doc                        in varchar2      --Nº de documento de identidad
/*117*/  ,pi_i_do_tip_empresa                    in integer       --Tipo de Empresa
/*118*/  ,pi_n_do_id_sect_econo                  in number        --CIIU (Actividad Economica)
/*119*/  ,pi_c_do_flg_asocu                      in char          --flag asocu
         --sancionado
/*120*/  ,pi_v_s_codSanciona_ini                 in varchar2      --Código del INDECOPI
/*121*/  ,pi_v_s_codSanciona_fin                 in varchar2      --Código del INDECOPI
/*122*/  ,pi_i_s_tip_persona                     in integer       --Tipo de Personería
/*123*/  ,pi_v_s_razon_social                    in varchar2      --Razón Social
/*124*/  ,pi_v_s_ape_paterno                     in varchar2      --Apellido Paterno
/*125*/  ,pi_v_s_ape_materno                     in varchar2      --Apellido Materno
/*126*/  ,pi_v_s_ape_casada                      in varchar2      --Apellido Casada
/*127*/  ,pi_v_s_pri_nombre                      in varchar2      --Primer nombre
/*128*/  ,pi_v_s_seg_nombre                      in varchar2      --Segundo nombre
/*129*/  ,pi_i_s_tipo_doc                        in integer       --Tipo de Documento
/*130*/  ,pi_v_s_nro_doc                         in varchar2      --Nº de documento de identidad
/*131*/  ,pi_i_s_tip_empresa                     in integer       --Tipo de Empresa
/*132*/  ,pi_n_s_id_sect_econo                   in number        --CIIU (Actividad Economica)
/*133*/  ,pi_c_s_flg_asocu                       in char           --flag asocu
--@0002:ini
/*134*/  ,pi_c_s_flg_buscar_by_contenido         in char           --0=NO;1=SI
--@0002:fin
-----------------------------------------------------------------------------------------------
         ,po_cu_retorno                          out cu_rec_set
);

procedure scob_sp_s_multa_avanzada_aec(
-----------------------------------------------------------------------------------------------
/*001*/   pi_v_area_macro                        in varchar2      --AREA MACRO
/*002*/  ,pi_v_cum_ini                           in varchar2      --cum
/*003*/  ,pi_v_cum_fin                           in varchar2      --cum
/*004*/  ,pi_v_fec_gen_cum_ini                   in varchar2      --FECHA GENERACION CUM INI
/*005*/  ,pi_v_fec_gen_cum_fin                   in varchar2      --FECHA GENERACION CUM FIN
/*006*/  ,pi_v_id_sede                           in varchar2      --sede
/*007*/  ,PI_V_ID_COD_DPTO_SEDE                  in VARCHAR2      --CODIGO DEPARTAMENTO SEDE
/*008*/  ,PI_V_ID_COD_PROV_SEDE                  in VARCHAR2      --CODIGO PROVINCIA SEDE
/*009*/  ,PI_V_ID_COD_DIST_SEDE                  in VARCHAR2      --CODIGO DISTRITO SEDE
/*010*/  ,pi_v_id_org_resol                      in varchar2      --organo resolutivo
/*011*/  ,PI_V_ID_COD_DPTO_ORGR                  in VARCHAR2      --CODIGO DEPARTAMENTO ORGANO RESOLUTIVO
/*012*/  ,PI_V_ID_COD_PROV_ORGR                  in VARCHAR2      --CODIGO PROVINCIA ORGANO RESOLUTIVO
/*013*/  ,PI_V_ID_COD_DIST_ORGR                  in VARCHAR2      --CODIGO DISTRITO ORGANO RESOLUTIVO
/*014*/  ,PI_V_ID_NRO_INSTANCIA                  in VARCHAR2      --NUMERO DE INSTANCIA
/*015*/  ,pi_v_id_materia                        in varchar2      --materia
/*016*/  ,pi_v_id_sub_materia                    in varchar2      --SUBMATERIA
/*017*/  ,pi_v_nro_exp_unico_ini                 in varchar2      --nro. expediente administrativo
/*018*/  ,pi_v_nro_exp_unico_fin                 in varchar2      --nro. expediente administrativo
/*019*/  ,pi_v_nroExpAdm_nivel                   in varchar2      --nro. expediente antiguo
/*020*/  ,pi_v_nro_resol                         in varchar2      --nro. resolucion or
/*021*/  ,pi_v_fec_reso_or_ini                   in varchar2      --FECHA RESOLUCION OR INI
/*022*/  ,pi_v_fec_reso_or_fin                   in varchar2      --FECHA RESOLUCION OR FIN
/*023*/  ,pi_v_fec_notifi_or_ini                 in varchar2      --FECHA NOTIFICACION RESOLUCION INI
/*024*/  ,pi_v_fec_notifi_or_fin                 in varchar2      --FECHA NOTIFICACION RESOLUCION FIN
/*025*/  ,PI_V_FEC_GENERACION_SEC_INI            in VARCHAR2      --FECHA GENERACION SEC
/*026*/  ,PI_V_FEC_GENERACION_SEC_FIN            in VARCHAR2      --FECHA GENERACION SEC
---
/*027*/  ,pi_v_fec_recepcion_aec_ini             in varchar2      --FECHA RECEPCION AEC INICIO
/*028*/  ,pi_v_fec_recepcion_aec_fin             in varchar2      --FECHA RECEPCION AEC FIN
/*029*/  ,PI_V_ANIO_INGRESO_AEC_INI              in varchar2      --AÑO INGRESO AL AEC INI
/*030*/  ,PI_V_ANIO_INGRESO_AEC_FIN              in varchar2      --AÑO INGRESO AL AEC FIN
/*031*/  ,PI_V_NRO_INGRESO_AEC_INI               in varchar2      --nro. ingreso aec
/*032*/  ,PI_V_NRO_INGRESO_AEC_FIN               in varchar2      --nro. ingreso aec
---
/*033*/  ,PI_V_ANIO_FILE_INI                     in varchar2      --AÑO FILE INI
/*034*/  ,PI_V_ANIO_FILE_FIN                     in varchar2      --AÑO FILE FIN
/*035*/  ,PI_V_NRO_FILE_INI                      in varchar2      --nro. file
/*036*/  ,PI_V_NRO_FILE_FIN                      in varchar2      --nro. file
/*037*/  ,pi_v_fec_recepcion_file_ini            in varchar2      --FECHA RECEPCION FILE INICIO
/*038*/  ,pi_v_fec_recepcion_file_fin            in varchar2      --FECHA RECEPCION FILE FIN
---
/*039*/  ,pi_n_valor_uit_ini                     in number        --nro uit ini
/*040*/  ,pi_n_valor_uit_fin                     in number        --nro uit fin
/*041*/  ,pi_n_monto_uit_ini                     in NUMBER        --MONTO UIT INI
/*042*/  ,pi_n_monto_uit_fin                     in NUMBER        --MONTO UIT FIN
/*043*/  ,pi_n_saldo_ini                         in NUMBER        --SALDO UIT INI
/*044*/  ,pi_n_saldo_fin                         in NUMBER        --SALDO UIT FIN
/*045*/  ,pi_v_id_tipo_multa                     in varchar2      --TIPO MULTA (SOLIDARIA/INDIVIDUAL)
/*046*/  ,pi_v_cod_estado_multa_resol            in varchar2      --estado de la multa resolutivo
/*047*/  ,pi_v_cod_estado_pago                   in varchar2      --estado pago de la multa
/*048*/  ,PI_V_FEC_ESTADO_MULTA_OR_INI           in VARCHAR2      --FECHA ESTADO MULTA OR INI
/*049*/  ,PI_V_FEC_ESTADO_MULTA_OR_FIN           in VARCHAR2      --FECHA ESTADO MULTA OR FIN
/*050*/  ,PI_V_FEC_ESTADO_MULTA_COB_INI          in VARCHAR2      --FECHA ESTADO MULTA COBRANZA
/*051*/  ,PI_V_FEC_ESTADO_MULTA_COB_FIN          in VARCHAR2      --FECHA ESTADO MULTA COBRANZA
/*052*/  ,pi_v_cod_estado_multa_cob              in varchar2      --estado de la multa cobranza
/*053*/  ,pi_v_cod_motivo_multa_cob              in varchar2      --motivo multa cobranza
/*054*/  ,PI_V_IND_TIPO_PAGO                     in VARCHAR2      --INDICADOR DE PAGO
/*055*/  ,pi_c_flg_asocu_multa                   IN CHAR         --INDICADOR % ASOCU > 0
-----------------------------------------------------------------------------------------------
/*056*/  ,pi_v_cod_estado_exped_cob              in varchar2      --estado expediente cobranza
/*057*/  ,pi_v_anio                              in varchar2      --año expediente cobranza
/*058*/  ,pi_v_nro_exp_cob_ini                   in varchar2      --nro. expediente cobranza
/*059*/  ,pi_v_nro_exp_cob_fin                   in varchar2      --nro. expediente cobranza
/*060*/  ,pi_v_fec_gen_exped_cob_ini             in varchar2      --FECHA GENERACION EXPED COBRANZA INI
/*061*/  ,pi_v_fec_gen_exped_cob_fin             in varchar2      --FECHA GENERACION EXPED COBRANZA FIN
-------
/*062*/  ,pi_v_gestor_cobranza                   in varchar2      --Gestor de cobranza
/*063*/  ,pi_v_fec_emi_rec_ini                   in varchar2      --Fecha de Emisión de la REC
/*064*/  ,pi_v_fec_emi_rec_fin                   in varchar2      --Fecha de Emisión de la REC
/*065*/  ,pi_v_fec_noti_rec_ini                  in varchar2      --Fecha de Notificación de la REC
/*066*/  ,pi_v_fec_noti_rec_fin                  in varchar2      --Fecha de Notificación de la REC
/*067*/  ,pi_v_cod_motivo_exped_cob              in varchar2      --motivo expediente cobranza---------
/*068*/  ,pi_v_fec_est_exped_cob_ini             in varchar2      --Fecha de Estado del Expediente
/*069*/  ,pi_v_fec_est_exped_cob_fin             in varchar2      --Fecha de Estado del Expediente
/*070*/  ,pi_v_num_env_arch_ini                  in varchar2      --Nº Envio a Archivo Central
/*071*/  ,pi_v_num_env_arch_fin                  in varchar2      --Nº Envio a Archivo Central
/*072*/  ,pi_v_fec_envi_arch_ini                 in varchar2      --Fecha de Envío a Archivo Central
/*073*/  ,pi_v_fec_envi_arch_fin                 in varchar2      --Fecha de Envío a Archivo Central
/*074*/  ,pi_v_nro_ofic_sunat_ini                in varchar2      --Nº de Oficio de la SUNAT
/*075*/  ,pi_v_nro_ofic_sunat_fin                in varchar2      --Nº de Oficio de la SUNAT
/*076*/  ,pi_n_dere_antiDump_ini                 in NUMBER        --Derechos Antidumping
/*077*/  ,pi_n_dere_antiDump_fin                 in NUMBER        --Derechos Antidumping
/*078*/  ,pi_v_nro_parti_ini                     in varchar2      --Partida Arancelaria
/*079*/  ,pi_v_nro_parti_fin                     in varchar2      --Partida Arancelaria
/*080*/  ,pi_v_nro_dua_ini                       in varchar2      --Nº DUA
/*081*/  ,pi_v_nro_dua_fin                       in varchar2      --Nº DUA
/*082*/  ,pi_v_nro_liq_cob_ini                   in varchar2      --Nº Liquidación de Cobranza
/*083*/  ,pi_v_nro_liq_cob_fin                   in varchar2      --Nº Liquidación de Cobranza
/*084*/  ,pi_v_id_intendencia                    in varchar2      --Intendencia antidumping
/*085*/  ,pi_c_flg_ind_embargo                   in char          --INDICADOR TIENE EMBARGO?
/*086*/  ,pi_v_fec_asig_gestor_ini               in varchar2      --fecha de asignacion de gestor ini
/*087*/  ,pi_v_fec_asig_gestor_fin               in varchar2      --fecha de asignacion de gestor fin
/*088*/  ,pi_v_fec_carta_precoactiva_ini         in varchar2      --fecha de carta precoactiva inicio
/*089*/  ,pi_v_fec_carta_precoactiva_fin         in varchar2      --fecha de carta precoactiva fin
/*090*/  ,pi_v_id_expectativa_cobro              in varchar2      --cadena codigos espectativa de cobro

-----------------------------------------------------------------------------------------------
        --denunciante
/*091*/  ,pi_v_d_codSanciona_ini                 in varchar2      --Código del INDECOPI
/*092*/  ,pi_v_d_codSanciona_fin                 in varchar2      --Código del INDECOPI
/*093*/  ,pi_i_d_tip_persona                     in integer       --Tipo de Personería
/*094*/  ,pi_v_d_razon_social                    in varchar2      --Razón Social
/*095*/  ,pi_v_d_ape_paterno                     in varchar2      --Apellido Paterno
/*096*/  ,pi_v_d_ape_materno                     in varchar2      --Apellido Materno
/*097*/  ,pi_v_d_ape_casada                      in varchar2      --Apellido Casada
/*098*/  ,pi_v_d_pri_nombre                      in varchar2      --Primer nombre
/*099*/  ,pi_v_d_seg_nombre                      in varchar2      --Segundo nombre
/*100*/  ,pi_i_d_tipo_doc                        in integer       --Tipo de Documento
/*101*/  ,pi_v_d_nro_doc                         in varchar2      --Nº de documento de identidad
/*102*/  ,pi_i_d_tip_empresa                     in integer       --Tipo de Empresa
/*103*/  ,pi_n_d_id_sect_econo                   in number        --CIIU (Actividad Economica)
/*104*/  ,pi_c_d_flg_asocu                       in char          --flag asocu
/*105*/  ,pi_c_d_fl_oficio                       in char          --indicador denunciante de oficio=Indecopi
        --denunciado
/*106*/  ,pi_v_do_codSanciona_ini                in varchar2      --Código del INDECOPI
/*107*/  ,pi_v_do_codSanciona_fin                in varchar2      --Código del INDECOPI
/*108*/  ,pi_i_do_tip_persona                    in integer       --Tipo de Personería
/*109*/  ,pi_v_do_razon_social                   in varchar2      --Razón Social
/*110*/  ,pi_v_do_ape_paterno                    in varchar2      --Apellido Paterno
/*111*/  ,pi_v_do_ape_materno                    in varchar2      --Apellido Materno
/*112*/  ,pi_v_do_ape_casada                     in varchar2      --Apellido Casada
/*113*/  ,pi_v_do_pri_nombre                     in varchar2      --Primer nombre
/*114*/  ,pi_v_do_seg_nombre                     in varchar2      --Segundo nombre
/*115*/  ,pi_i_do_tipo_doc                       in integer       --Tipo de Documento
/*116*/  ,pi_v_do_nro_doc                        in varchar2      --Nº de documento de identidad
/*117*/  ,pi_i_do_tip_empresa                    in integer       --Tipo de Empresa
/*118*/  ,pi_n_do_id_sect_econo                  in number        --CIIU (Actividad Economica)
/*119*/  ,pi_c_do_flg_asocu                      in char          --flag asocu
         --sancionado
/*120*/  ,pi_v_s_codSanciona_ini                 in varchar2      --Código del INDECOPI
/*121*/  ,pi_v_s_codSanciona_fin                 in varchar2      --Código del INDECOPI
/*122*/  ,pi_i_s_tip_persona                     in integer       --Tipo de Personería
/*123*/  ,pi_v_s_razon_social                    in varchar2      --Razón Social
/*124*/  ,pi_v_s_ape_paterno                     in varchar2      --Apellido Paterno
/*125*/  ,pi_v_s_ape_materno                     in varchar2      --Apellido Materno
/*126*/  ,pi_v_s_ape_casada                      in varchar2      --Apellido Casada
/*127*/  ,pi_v_s_pri_nombre                      in varchar2      --Primer nombre
/*128*/  ,pi_v_s_seg_nombre                      in varchar2      --Segundo nombre
/*129*/  ,pi_i_s_tipo_doc                        in integer       --Tipo de Documento
/*130*/  ,pi_v_s_nro_doc                         in varchar2      --Nº de documento de identidad
/*131*/  ,pi_i_s_tip_empresa                     in integer       --Tipo de Empresa
/*132*/  ,pi_n_s_id_sect_econo                   in number        --CIIU (Actividad Economica)
/*133*/  ,pi_c_s_flg_asocu                       in char           --flag asocu
--@0002:ini
/*134*/  ,pi_c_s_flg_buscar_by_contenido         in char           --0=NO;1=SI
--@0002:fin
-----------------------------------------------------------------------------------------------
         ,po_cu_retorno                          out cu_rec_set
);

procedure scob_sp_s_multa_avanzada_aec_b(
-----------------------------------------------------------------------------------------------
/*001*/   pi_v_area_macro                        in varchar2      --AREA MACRO
/*002*/  ,pi_v_cum_ini                           in varchar2      --cum
/*003*/  ,pi_v_cum_fin                           in varchar2      --cum
/*004*/  ,pi_v_fec_gen_cum_ini                   in varchar2      --FECHA GENERACION CUM INI
/*005*/  ,pi_v_fec_gen_cum_fin                   in varchar2      --FECHA GENERACION CUM FIN
/*006*/  ,pi_v_id_sede                           in varchar2      --sede
/*007*/  ,PI_V_ID_COD_DPTO_SEDE                  in VARCHAR2      --CODIGO DEPARTAMENTO SEDE
/*008*/  ,PI_V_ID_COD_PROV_SEDE                  in VARCHAR2      --CODIGO PROVINCIA SEDE
/*009*/  ,PI_V_ID_COD_DIST_SEDE                  in VARCHAR2      --CODIGO DISTRITO SEDE
/*010*/  ,pi_v_id_org_resol                      in varchar2      --organo resolutivo
/*011*/  ,PI_V_ID_COD_DPTO_ORGR                  in VARCHAR2      --CODIGO DEPARTAMENTO ORGANO RESOLUTIVO
/*012*/  ,PI_V_ID_COD_PROV_ORGR                  in VARCHAR2      --CODIGO PROVINCIA ORGANO RESOLUTIVO
/*013*/  ,PI_V_ID_COD_DIST_ORGR                  in VARCHAR2      --CODIGO DISTRITO ORGANO RESOLUTIVO
/*014*/  ,PI_V_ID_NRO_INSTANCIA                  in VARCHAR2      --NUMERO DE INSTANCIA
/*015*/  ,pi_v_id_materia                        in varchar2      --materia
/*016*/  ,pi_v_id_sub_materia                    in varchar2      --SUBMATERIA
/*017*/  ,pi_v_nro_exp_unico_ini                 in varchar2      --nro. expediente administrativo
/*018*/  ,pi_v_nro_exp_unico_fin                 in varchar2      --nro. expediente administrativo
/*019*/  ,pi_v_nroExpAdm_nivel                   in varchar2      --nro. expediente antiguo
/*020*/  ,pi_v_nro_resol                         in varchar2      --nro. resolucion or
/*021*/  ,pi_v_fec_reso_or_ini                   in varchar2      --FECHA RESOLUCION OR INI
/*022*/  ,pi_v_fec_reso_or_fin                   in varchar2      --FECHA RESOLUCION OR FIN
/*023*/  ,pi_v_fec_notifi_or_ini                 in varchar2      --FECHA NOTIFICACION RESOLUCION INI
/*024*/  ,pi_v_fec_notifi_or_fin                 in varchar2      --FECHA NOTIFICACION RESOLUCION FIN
/*025*/  ,PI_V_FEC_GENERACION_SEC_INI            in VARCHAR2      --FECHA GENERACION SEC
/*026*/  ,PI_V_FEC_GENERACION_SEC_FIN            in VARCHAR2      --FECHA GENERACION SEC
---
/*027*/  ,pi_v_fec_recepcion_aec_ini             in varchar2      --FECHA RECEPCION AEC INICIO
/*028*/  ,pi_v_fec_recepcion_aec_fin             in varchar2      --FECHA RECEPCION AEC FIN
/*029*/  ,PI_V_ANIO_INGRESO_AEC_INI              in varchar2      --AÑO INGRESO AL AEC INI
/*030*/  ,PI_V_ANIO_INGRESO_AEC_FIN              in varchar2      --AÑO INGRESO AL AEC FIN
/*031*/  ,PI_V_NRO_INGRESO_AEC_INI               in varchar2      --nro. ingreso aec
/*032*/  ,PI_V_NRO_INGRESO_AEC_FIN               in varchar2      --nro. ingreso aec
---
/*033*/  ,PI_V_ANIO_FILE_INI                     in varchar2      --AÑO FILE INI
/*034*/  ,PI_V_ANIO_FILE_FIN                     in varchar2      --AÑO FILE FIN
/*035*/  ,PI_V_NRO_FILE_INI                      in varchar2      --nro. file
/*036*/  ,PI_V_NRO_FILE_FIN                      in varchar2      --nro. file
/*037*/  ,pi_v_fec_recepcion_file_ini            in varchar2      --FECHA RECEPCION FILE INICIO
/*038*/  ,pi_v_fec_recepcion_file_fin            in varchar2      --FECHA RECEPCION FILE FIN
---
/*039*/  ,pi_n_valor_uit_ini                     in number        --nro uit ini
/*040*/  ,pi_n_valor_uit_fin                     in number        --nro uit fin
/*041*/  ,pi_n_monto_uit_ini                     in NUMBER        --MONTO UIT INI
/*042*/  ,pi_n_monto_uit_fin                     in NUMBER        --MONTO UIT FIN
/*043*/  ,pi_n_saldo_ini                         in NUMBER        --SALDO UIT INI
/*044*/  ,pi_n_saldo_fin                         in NUMBER        --SALDO UIT FIN
/*045*/  ,pi_v_id_tipo_multa                     in varchar2      --TIPO MULTA (SOLIDARIA/INDIVIDUAL)
/*046*/  ,pi_v_cod_estado_multa_resol            in varchar2      --estado de la multa resolutivo
/*047*/  ,pi_v_cod_estado_pago                   in varchar2      --estado pago de la multa
/*048*/  ,PI_V_FEC_ESTADO_MULTA_OR_INI           in VARCHAR2      --FECHA ESTADO MULTA OR INI
/*049*/  ,PI_V_FEC_ESTADO_MULTA_OR_FIN           in VARCHAR2      --FECHA ESTADO MULTA OR FIN
/*050*/  ,PI_V_FEC_ESTADO_MULTA_COB_INI          in VARCHAR2      --FECHA ESTADO MULTA COBRANZA
/*051*/  ,PI_V_FEC_ESTADO_MULTA_COB_FIN          in VARCHAR2      --FECHA ESTADO MULTA COBRANZA
/*052*/  ,pi_v_cod_estado_multa_cob              in varchar2      --estado de la multa cobranza
/*053*/  ,pi_v_cod_motivo_multa_cob              in varchar2      --motivo multa cobranza
/*054*/  ,PI_V_IND_TIPO_PAGO                     in VARCHAR2      --INDICADOR DE PAGO
/*055*/  ,pi_c_flg_asocu_multa                   IN CHAR         --INDICADOR % ASOCU > 0
-----------------------------------------------------------------------------------------------
/*056*/  ,pi_v_cod_estado_exped_cob              in varchar2      --estado expediente cobranza
/*057*/  ,pi_v_anio                              in varchar2      --año expediente cobranza
/*058*/  ,pi_v_nro_exp_cob_ini                   in varchar2      --nro. expediente cobranza
/*059*/  ,pi_v_nro_exp_cob_fin                   in varchar2      --nro. expediente cobranza
/*060*/  ,pi_v_fec_gen_exped_cob_ini             in varchar2      --FECHA GENERACION EXPED COBRANZA INI
/*061*/  ,pi_v_fec_gen_exped_cob_fin             in varchar2      --FECHA GENERACION EXPED COBRANZA FIN
-------
/*062*/  ,pi_v_gestor_cobranza                   in varchar2      --Gestor de cobranza
/*063*/  ,pi_v_fec_emi_rec_ini                   in varchar2      --Fecha de Emisión de la REC
/*064*/  ,pi_v_fec_emi_rec_fin                   in varchar2      --Fecha de Emisión de la REC
/*065*/  ,pi_v_fec_noti_rec_ini                  in varchar2      --Fecha de Notificación de la REC
/*066*/  ,pi_v_fec_noti_rec_fin                  in varchar2      --Fecha de Notificación de la REC
/*067*/  ,pi_v_cod_motivo_exped_cob              in varchar2      --motivo expediente cobranza---------
/*068*/  ,pi_v_fec_est_exped_cob_ini             in varchar2      --Fecha de Estado del Expediente
/*069*/  ,pi_v_fec_est_exped_cob_fin             in varchar2      --Fecha de Estado del Expediente
/*070*/  ,pi_v_num_env_arch_ini                  in varchar2      --Nº Envio a Archivo Central
/*071*/  ,pi_v_num_env_arch_fin                  in varchar2      --Nº Envio a Archivo Central
/*072*/  ,pi_v_fec_envi_arch_ini                 in varchar2      --Fecha de Envío a Archivo Central
/*073*/  ,pi_v_fec_envi_arch_fin                 in varchar2      --Fecha de Envío a Archivo Central
/*074*/  ,pi_v_nro_ofic_sunat_ini                in varchar2      --Nº de Oficio de la SUNAT
/*075*/  ,pi_v_nro_ofic_sunat_fin                in varchar2      --Nº de Oficio de la SUNAT
/*076*/  ,pi_n_dere_antiDump_ini                 in NUMBER        --Derechos Antidumping
/*077*/  ,pi_n_dere_antiDump_fin                 in NUMBER        --Derechos Antidumping
/*078*/  ,pi_v_nro_parti_ini                     in varchar2      --Partida Arancelaria
/*079*/  ,pi_v_nro_parti_fin                     in varchar2      --Partida Arancelaria
/*080*/  ,pi_v_nro_dua_ini                       in varchar2      --Nº DUA
/*081*/  ,pi_v_nro_dua_fin                       in varchar2      --Nº DUA
/*082*/  ,pi_v_nro_liq_cob_ini                   in varchar2      --Nº Liquidación de Cobranza
/*083*/  ,pi_v_nro_liq_cob_fin                   in varchar2      --Nº Liquidación de Cobranza
/*084*/  ,pi_v_id_intendencia                    in varchar2      --Intendencia antidumping
/*085*/  ,pi_c_flg_ind_embargo                   in char          --INDICADOR TIENE EMBARGO?
/*086*/  ,pi_v_fec_asig_gestor_ini               in varchar2      --fecha de asignacion de gestor ini
/*087*/  ,pi_v_fec_asig_gestor_fin               in varchar2      --fecha de asignacion de gestor fin
/*088*/  ,pi_v_fec_carta_precoactiva_ini         in varchar2      --fecha de carta precoactiva inicio
/*089*/  ,pi_v_fec_carta_precoactiva_fin         in varchar2      --fecha de carta precoactiva fin
/*090*/  ,pi_v_id_expectativa_cobro              in varchar2      --cadena codigos espectativa de cobro

-----------------------------------------------------------------------------------------------
        --denunciante
/*091*/  ,pi_v_d_codSanciona_ini                 in varchar2      --Código del INDECOPI
/*092*/  ,pi_v_d_codSanciona_fin                 in varchar2      --Código del INDECOPI
/*093*/  ,pi_i_d_tip_persona                     in integer       --Tipo de Personería
/*094*/  ,pi_v_d_razon_social                    in varchar2      --Razón Social
/*095*/  ,pi_v_d_ape_paterno                     in varchar2      --Apellido Paterno
/*096*/  ,pi_v_d_ape_materno                     in varchar2      --Apellido Materno
/*097*/  ,pi_v_d_ape_casada                      in varchar2      --Apellido Casada
/*098*/  ,pi_v_d_pri_nombre                      in varchar2      --Primer nombre
/*099*/  ,pi_v_d_seg_nombre                      in varchar2      --Segundo nombre
/*100*/  ,pi_i_d_tipo_doc                        in integer       --Tipo de Documento
/*101*/  ,pi_v_d_nro_doc                         in varchar2      --Nº de documento de identidad
/*102*/  ,pi_i_d_tip_empresa                     in integer       --Tipo de Empresa
/*103*/  ,pi_n_d_id_sect_econo                   in number        --CIIU (Actividad Economica)
/*104*/  ,pi_c_d_flg_asocu                       in char          --flag asocu
/*105*/  ,pi_c_d_fl_oficio                       in char          --indicador denunciante de oficio=Indecopi
        --denunciado
/*106*/  ,pi_v_do_codSanciona_ini                in varchar2      --Código del INDECOPI
/*107*/  ,pi_v_do_codSanciona_fin                in varchar2      --Código del INDECOPI
/*108*/  ,pi_i_do_tip_persona                    in integer       --Tipo de Personería
/*109*/  ,pi_v_do_razon_social                   in varchar2      --Razón Social
/*110*/  ,pi_v_do_ape_paterno                    in varchar2      --Apellido Paterno
/*111*/  ,pi_v_do_ape_materno                    in varchar2      --Apellido Materno
/*112*/  ,pi_v_do_ape_casada                     in varchar2      --Apellido Casada
/*113*/  ,pi_v_do_pri_nombre                     in varchar2      --Primer nombre
/*114*/  ,pi_v_do_seg_nombre                     in varchar2      --Segundo nombre
/*115*/  ,pi_i_do_tipo_doc                       in integer       --Tipo de Documento
/*116*/  ,pi_v_do_nro_doc                        in varchar2      --Nº de documento de identidad
/*117*/  ,pi_i_do_tip_empresa                    in integer       --Tipo de Empresa
/*118*/  ,pi_n_do_id_sect_econo                  in number        --CIIU (Actividad Economica)
/*119*/  ,pi_c_do_flg_asocu                      in char          --flag asocu
         --sancionado
/*120*/  ,pi_v_s_codSanciona_ini                 in varchar2      --Código del INDECOPI
/*121*/  ,pi_v_s_codSanciona_fin                 in varchar2      --Código del INDECOPI
/*122*/  ,pi_i_s_tip_persona                     in integer       --Tipo de Personería
/*123*/  ,pi_v_s_razon_social                    in varchar2      --Razón Social
/*124*/  ,pi_v_s_ape_paterno                     in varchar2      --Apellido Paterno
/*125*/  ,pi_v_s_ape_materno                     in varchar2      --Apellido Materno
/*126*/  ,pi_v_s_ape_casada                      in varchar2      --Apellido Casada
/*127*/  ,pi_v_s_pri_nombre                      in varchar2      --Primer nombre
/*128*/  ,pi_v_s_seg_nombre                      in varchar2      --Segundo nombre
/*129*/  ,pi_i_s_tipo_doc                        in integer       --Tipo de Documento
/*130*/  ,pi_v_s_nro_doc                         in varchar2      --Nº de documento de identidad
/*131*/  ,pi_i_s_tip_empresa                     in integer       --Tipo de Empresa
/*132*/  ,pi_n_s_id_sect_econo                   in number        --CIIU (Actividad Economica)
/*133*/  ,pi_c_s_flg_asocu                       in char           --flag asocu
--@0002:ini
/*134*/  ,pi_c_s_flg_buscar_by_contenido         in char           --0=NO;1=SI
--@0002:fin
-----------------------------------------------------------------------------------------------
         ,po_cu_retorno                          out cu_rec_set
);

procedure scob_sp_s_multa_avanzada2(
-----------------------------------------------------------------------------------------------
/*001*/   pi_v_area_macro                        in varchar2      --AREA MACRO
/*002*/  ,pi_v_cum_ini                           in varchar2      --cum
/*003*/  ,pi_v_cum_fin                           in varchar2      --cum
/*004*/  ,pi_v_fec_gen_cum_ini                   in varchar2      --FECHA GENERACION CUM INI
/*005*/  ,pi_v_fec_gen_cum_fin                   in varchar2      --FECHA GENERACION CUM FIN
/*006*/  ,pi_v_id_sede                           in varchar2      --sede
/*007*/  ,PI_V_ID_COD_DPTO_SEDE                  in VARCHAR2      --CODIGO DEPARTAMENTO SEDE
/*008*/  ,PI_V_ID_COD_PROV_SEDE                  in VARCHAR2      --CODIGO PROVINCIA SEDE
/*009*/  ,PI_V_ID_COD_DIST_SEDE                  in VARCHAR2      --CODIGO DISTRITO SEDE
/*010*/  ,pi_v_id_org_resol                      in varchar2      --organo resolutivo
/*011*/  ,PI_V_ID_COD_DPTO_ORGR                  in VARCHAR2      --CODIGO DEPARTAMENTO ORGANO RESOLUTIVO
/*012*/  ,PI_V_ID_COD_PROV_ORGR                  in VARCHAR2      --CODIGO PROVINCIA ORGANO RESOLUTIVO
/*013*/  ,PI_V_ID_COD_DIST_ORGR                  in VARCHAR2      --CODIGO DISTRITO ORGANO RESOLUTIVO
/*014*/  ,PI_V_ID_NRO_INSTANCIA                  in VARCHAR2      --NUMERO DE INSTANCIA
/*015*/  ,pi_v_id_materia                        in varchar2      --materia
/*016*/  ,pi_v_id_sub_materia                    in varchar2      --SUBMATERIA
/*017*/  ,pi_v_nro_exp_unico_ini                 in varchar2      --nro. expediente administrativo
/*018*/  ,pi_v_nro_exp_unico_fin                 in varchar2      --nro. expediente administrativo
/*019*/  ,pi_v_nroExpAdm_nivel                   in varchar2      --nro. expediente antiguo
/*020*/  ,pi_v_nro_resol                         in varchar2      --nro. resolucion or
/*021*/  ,pi_v_fec_reso_or_ini                   in varchar2      --FECHA RESOLUCION OR INI
/*022*/  ,pi_v_fec_reso_or_fin                   in varchar2      --FECHA RESOLUCION OR FIN
/*023*/  ,pi_v_fec_notifi_or_ini                 in varchar2      --FECHA NOTIFICACION RESOLUCION INI
/*024*/  ,pi_v_fec_notifi_or_fin                 in varchar2      --FECHA NOTIFICACION RESOLUCION FIN
/*025*/  ,PI_V_FEC_GENERACION_SEC_INI            in VARCHAR2      --FECHA GENERACION SEC
/*026*/  ,PI_V_FEC_GENERACION_SEC_FIN            in VARCHAR2      --FECHA GENERACION SEC
---
/*027*/  ,pi_v_fec_recepcion_aec_ini             in varchar2      --FECHA RECEPCION AEC INICIO
/*028*/  ,pi_v_fec_recepcion_aec_fin             in varchar2      --FECHA RECEPCION AEC FIN
/*029*/  ,PI_V_ANIO_INGRESO_AEC_INI              in varchar2      --AÑO INGRESO AL AEC INI
/*030*/  ,PI_V_ANIO_INGRESO_AEC_FIN              in varchar2      --AÑO INGRESO AL AEC FIN
/*031*/  ,PI_V_NRO_INGRESO_AEC_INI               in varchar2      --nro. ingreso aec
/*032*/  ,PI_V_NRO_INGRESO_AEC_FIN               in varchar2      --nro. ingreso aec
---
/*033*/  ,PI_V_ANIO_FILE_INI                     in varchar2      --AÑO FILE INI
/*034*/  ,PI_V_ANIO_FILE_FIN                     in varchar2      --AÑO FILE FIN
/*035*/  ,PI_V_NRO_FILE_INI                      in varchar2      --nro. file
/*036*/  ,PI_V_NRO_FILE_FIN                      in varchar2      --nro. file
/*037*/  ,pi_v_fec_recepcion_file_ini            in varchar2      --FECHA RECEPCION FILE INICIO
/*038*/  ,pi_v_fec_recepcion_file_fin            in varchar2      --FECHA RECEPCION FILE FIN
---
/*039*/  ,pi_n_valor_uit_ini                     in number        --nro uit ini
/*040*/  ,pi_n_valor_uit_fin                     in number        --nro uit fin
/*041*/  ,pi_n_monto_uit_ini                     in NUMBER        --MONTO UIT INI
/*042*/  ,pi_n_monto_uit_fin                     in NUMBER        --MONTO UIT FIN
/*043*/  ,pi_n_saldo_ini                         in NUMBER        --SALDO UIT INI
/*044*/  ,pi_n_saldo_fin                         in NUMBER        --SALDO UIT FIN
/*045*/  ,pi_v_id_tipo_multa                     in varchar2      --TIPO MULTA (SOLIDARIA/INDIVIDUAL)
/*046*/  ,pi_v_cod_estado_multa_resol            in varchar2      --estado de la multa resolutivo
/*047*/  ,pi_v_cod_estado_pago                   in varchar2      --estado pago de la multa
/*048*/  ,PI_V_FEC_ESTADO_MULTA_OR_INI           in VARCHAR2      --FECHA ESTADO MULTA OR INI
/*049*/  ,PI_V_FEC_ESTADO_MULTA_OR_FIN           in VARCHAR2      --FECHA ESTADO MULTA OR FIN
/*050*/  ,PI_V_FEC_ESTADO_MULTA_COB_INI          in VARCHAR2      --FECHA ESTADO MULTA COBRANZA
/*051*/  ,PI_V_FEC_ESTADO_MULTA_COB_FIN          in VARCHAR2      --FECHA ESTADO MULTA COBRANZA
/*052*/  ,pi_v_cod_estado_multa_cob              in varchar2      --estado de la multa cobranza
/*053*/  ,pi_v_cod_motivo_multa_cob              in varchar2      --motivo multa cobranza
/*054*/  ,PI_V_IND_TIPO_PAGO                     in VARCHAR2      --INDICADOR DE PAGO
/*055*/  ,pi_c_flg_asocu_multa                   IN CHAR         --INDICADOR % ASOCU > 0
-----------------------------------------------------------------------------------------------
/*056*/  ,pi_v_cod_estado_exped_cob              in varchar2      --estado expediente cobranza
/*057*/  ,pi_v_anio                              in varchar2      --año expediente cobranza
/*058*/  ,pi_v_nro_exp_cob_ini                   in varchar2      --nro. expediente cobranza
/*059*/  ,pi_v_nro_exp_cob_fin                   in varchar2      --nro. expediente cobranza
/*060*/  ,pi_v_fec_gen_exped_cob_ini             in varchar2      --FECHA GENERACION EXPED COBRANZA INI
/*061*/  ,pi_v_fec_gen_exped_cob_fin             in varchar2      --FECHA GENERACION EXPED COBRANZA FIN
-------
/*062*/  ,pi_v_gestor_cobranza                   in varchar2      --Gestor de cobranza
/*063*/  ,pi_v_fec_emi_rec_ini                   in varchar2      --Fecha de Emisión de la REC
/*064*/  ,pi_v_fec_emi_rec_fin                   in varchar2      --Fecha de Emisión de la REC
/*065*/  ,pi_v_fec_noti_rec_ini                  in varchar2      --Fecha de Notificación de la REC
/*066*/  ,pi_v_fec_noti_rec_fin                  in varchar2      --Fecha de Notificación de la REC
/*067*/  ,pi_v_cod_motivo_exped_cob              in varchar2      --motivo expediente cobranza---------
/*068*/  ,pi_v_fec_est_exped_cob_ini             in varchar2      --Fecha de Estado del Expediente
/*069*/  ,pi_v_fec_est_exped_cob_fin             in varchar2      --Fecha de Estado del Expediente
/*070*/  ,pi_v_num_env_arch_ini                  in varchar2      --Nº Envio a Archivo Central
/*071*/  ,pi_v_num_env_arch_fin                  in varchar2      --Nº Envio a Archivo Central
/*072*/  ,pi_v_fec_envi_arch_ini                 in varchar2      --Fecha de Envío a Archivo Central
/*073*/  ,pi_v_fec_envi_arch_fin                 in varchar2      --Fecha de Envío a Archivo Central
/*074*/  ,pi_v_nro_ofic_sunat_ini                in varchar2      --Nº de Oficio de la SUNAT
/*075*/  ,pi_v_nro_ofic_sunat_fin                in varchar2      --Nº de Oficio de la SUNAT
/*076*/  ,pi_n_dere_antiDump_ini                 in NUMBER        --Derechos Antidumping
/*077*/  ,pi_n_dere_antiDump_fin                 in NUMBER        --Derechos Antidumping
/*078*/  ,pi_v_nro_parti_ini                     in varchar2      --Partida Arancelaria
/*079*/  ,pi_v_nro_parti_fin                     in varchar2      --Partida Arancelaria
/*080*/  ,pi_v_nro_dua_ini                       in varchar2      --Nº DUA
/*081*/  ,pi_v_nro_dua_fin                       in varchar2      --Nº DUA
/*082*/  ,pi_v_nro_liq_cob_ini                   in varchar2      --Nº Liquidación de Cobranza
/*083*/  ,pi_v_nro_liq_cob_fin                   in varchar2      --Nº Liquidación de Cobranza
/*084*/  ,pi_v_id_intendencia                    in varchar2      --Intendencia antidumping
/*085*/  ,pi_c_flg_ind_embargo                   in char          --INDICADOR TIENE EMBARGO?
/*086*/  ,pi_v_fec_asig_gestor_ini               in varchar2      --fecha de asignacion de gestor ini
/*087*/  ,pi_v_fec_asig_gestor_fin               in varchar2      --fecha de asignacion de gestor fin
/*088*/  ,pi_v_fec_carta_precoactiva_ini         in varchar2      --fecha de carta precoactiva inicio
/*089*/  ,pi_v_fec_carta_precoactiva_fin         in varchar2      --fecha de carta precoactiva fin
/*090*/  ,pi_v_id_expectativa_cobro              in varchar2      --cadena codigos espectativa de cobro

-----------------------------------------------------------------------------------------------
        --denunciante
/*091*/  ,pi_v_d_codSanciona_ini                 in varchar2      --Código del INDECOPI
/*092*/  ,pi_v_d_codSanciona_fin                 in varchar2      --Código del INDECOPI
/*093*/  ,pi_i_d_tip_persona                     in integer       --Tipo de Personería
/*094*/  ,pi_v_d_razon_social                    in varchar2      --Razón Social
/*095*/  ,pi_v_d_ape_paterno                     in varchar2      --Apellido Paterno
/*096*/  ,pi_v_d_ape_materno                     in varchar2      --Apellido Materno
/*097*/  ,pi_v_d_ape_casada                      in varchar2      --Apellido Casada
/*098*/  ,pi_v_d_pri_nombre                      in varchar2      --Primer nombre
/*099*/  ,pi_v_d_seg_nombre                      in varchar2      --Segundo nombre
/*100*/  ,pi_i_d_tipo_doc                        in integer       --Tipo de Documento
/*101*/  ,pi_v_d_nro_doc                         in varchar2      --Nº de documento de identidad
/*102*/  ,pi_i_d_tip_empresa                     in integer       --Tipo de Empresa
/*103*/  ,pi_n_d_id_sect_econo                   in number        --CIIU (Actividad Economica)
/*104*/  ,pi_c_d_flg_asocu                       in char          --flag asocu
/*105*/  ,pi_c_d_fl_oficio                       in char          --indicador denunciante de oficio=Indecopi
        --denunciado
/*106*/  ,pi_v_do_codSanciona_ini                in varchar2      --Código del INDECOPI
/*107*/  ,pi_v_do_codSanciona_fin                in varchar2      --Código del INDECOPI
/*108*/  ,pi_i_do_tip_persona                    in integer       --Tipo de Personería
/*109*/  ,pi_v_do_razon_social                   in varchar2      --Razón Social
/*110*/  ,pi_v_do_ape_paterno                    in varchar2      --Apellido Paterno
/*111*/  ,pi_v_do_ape_materno                    in varchar2      --Apellido Materno
/*112*/  ,pi_v_do_ape_casada                     in varchar2      --Apellido Casada
/*113*/  ,pi_v_do_pri_nombre                     in varchar2      --Primer nombre
/*114*/  ,pi_v_do_seg_nombre                     in varchar2      --Segundo nombre
/*115*/  ,pi_i_do_tipo_doc                       in integer       --Tipo de Documento
/*116*/  ,pi_v_do_nro_doc                        in varchar2      --Nº de documento de identidad
/*117*/  ,pi_i_do_tip_empresa                    in integer       --Tipo de Empresa
/*118*/  ,pi_n_do_id_sect_econo                  in number        --CIIU (Actividad Economica)
/*119*/  ,pi_c_do_flg_asocu                      in char          --flag asocu
         --sancionado
/*120*/  ,pi_v_s_codSanciona_ini                 in varchar2      --Código del INDECOPI
/*121*/  ,pi_v_s_codSanciona_fin                 in varchar2      --Código del INDECOPI
/*122*/  ,pi_i_s_tip_persona                     in integer       --Tipo de Personería
/*123*/  ,pi_v_s_razon_social                    in varchar2      --Razón Social
/*124*/  ,pi_v_s_ape_paterno                     in varchar2      --Apellido Paterno
/*125*/  ,pi_v_s_ape_materno                     in varchar2      --Apellido Materno
/*126*/  ,pi_v_s_ape_casada                      in varchar2      --Apellido Casada
/*127*/  ,pi_v_s_pri_nombre                      in varchar2      --Primer nombre
/*128*/  ,pi_v_s_seg_nombre                      in varchar2      --Segundo nombre
/*129*/  ,pi_i_s_tipo_doc                        in integer       --Tipo de Documento
/*130*/  ,pi_v_s_nro_doc                         in varchar2      --Nº de documento de identidad
/*131*/  ,pi_i_s_tip_empresa                     in integer       --Tipo de Empresa
/*132*/  ,pi_n_s_id_sect_econo                   in number        --CIIU (Actividad Economica)
/*133*/  ,pi_c_s_flg_asocu                       in char           --flag asocu
--@0002:ini
/*134*/  ,pi_c_s_flg_buscar_by_contenido         in char           --0=NO;1=SI
--@0002:fin
-----------------------------------------------------------------------------------------------
         ,po_cu_retorno                          out cu_rec_set
);
PROCEDURE SCOB_SP_S_CONSULTA_NOTIF_SICOB
/*
-----------------------------------------------------------
-- AUTOR        : RMCA
-- CREADO       : 15.04.2013
-- PROPOSITO    : Consulta del logs de las notificaciones del SICOB
-----------------------------------------------------------
*/
(
   PI_I_NRO_CORREO             IN INTEGER,
   PI_I_COD_EST_ENVIADO        IN T_SCOB_LOG_NOTIFICACION_DET.COD_ESTADO_ENVIADO%TYPE,
   PI_V_FEC_INI_ENVIO          IN VARCHAR2,
   PI_V_FEC_FIN_ENVIO          IN VARCHAR2,
   PI_V_NRO_CUM                IN VARCHAR2,
   PI_N_ID_ORG_RESOL_USUARIO   IN T_SCOB_ORGANO_RESOLUTIVO.ID_ORGANO_RESOLUTIVO%TYPE,
   PO_CU_RETORNO               OUT CU_REC_SET
);
--


  FUNCTION fn_getReso_gaf_aprueba (in_id_expediente number) RETURN varchar ;
  FUNCTION fn_getFecReso_gaf_aprueba(in_id_expediente number) RETURN varchar ;
  FUNCTION fn_getReso_gaf_perdida(in_id_expediente number) RETURN varchar ;
  FUNCTION fn_getFecReso_gaf_perdida(in_id_expediente number) RETURN varchar;
    --Datos de Denunciante
  FUNCTION fn_getDenunciante_tipoper(in_id_multa number) RETURN varchar;
  FUNCTION fn_getDenunciante_doc(in_id_multa number)RETURN varchar;
  FUNCTION fn_getDenunciante_nomb_razon(in_id_multa number) RETURN varchar;
  FUNCTION SCOB_FN_COD_DENUNCIANTES_MULTA(PI_N_ID_MULTA IN T_SCOB_MULTA.ID_MULTA%TYPE, PI_N_NRO_PERSONAS IN INTEGER) RETURN  VARCHAR2;
  FUNCTION SCOB_FN_CENTRO_DE_COSTO(PI_N_ID_MULTA IN T_SCOB_MULTA.ID_MULTA%TYPE) RETURN  VARCHAR2;

  FUNCTION SCOB_FN_DATA_CONS_AVANZADA(
    PI_N_OP IN NUMBER,
    PI_N_ID_MULTA IN T_SCOB_MULTA.ID_MULTA%TYPE,
    PI_N_TIPO_INSTANCIA IN T_SCOB_ORGANO_RESOLUTIVO.TIPO_INSTANCIA%TYPE,
    PI_N_ID_ORGANO_RESOLUTIVO IN T_SCOB_ORGANO_RESOLUTIVO.ID_ORGANO_RESOLUTIVO%TYPE,
    PI_V_OPCION IN VARCHAR2
  ) RETURN  VARCHAR2;




procedure scob_sp_s_multa_avanzada(
-----------------------------------------------------------------------------------------------
/*001*/   pi_v_area_macro                        in varchar2      --AREA MACRO
/*002*/  ,pi_v_cum_ini                           in varchar2      --cum
/*003*/  ,pi_v_cum_fin                           in varchar2      --cum
/*004*/  ,pi_v_fec_gen_cum_ini                   in varchar2      --FECHA GENERACION CUM INI
/*005*/  ,pi_v_fec_gen_cum_fin                   in varchar2      --FECHA GENERACION CUM FIN
/*006*/  ,pi_v_id_sede                           in varchar2      --sede
/*007*/  ,PI_V_ID_COD_DPTO_SEDE                  in VARCHAR2      --CODIGO DEPARTAMENTO SEDE
/*008*/  ,PI_V_ID_COD_PROV_SEDE                  in VARCHAR2      --CODIGO PROVINCIA SEDE
/*009*/  ,PI_V_ID_COD_DIST_SEDE                  in VARCHAR2      --CODIGO DISTRITO SEDE
/*010*/  ,pi_v_id_org_resol                      in varchar2      --organo resolutivo
/*011*/  ,PI_V_ID_COD_DPTO_ORGR                  in VARCHAR2      --CODIGO DEPARTAMENTO ORGANO RESOLUTIVO
/*012*/  ,PI_V_ID_COD_PROV_ORGR                  in VARCHAR2      --CODIGO PROVINCIA ORGANO RESOLUTIVO
/*013*/  ,PI_V_ID_COD_DIST_ORGR                  in VARCHAR2      --CODIGO DISTRITO ORGANO RESOLUTIVO
/*014*/  ,PI_V_ID_NRO_INSTANCIA                  in VARCHAR2      --NUMERO DE INSTANCIA
/*015*/  ,pi_v_id_materia                        in varchar2      --materia
/*016*/  ,pi_v_id_sub_materia                    in varchar2      --SUBMATERIA
/*017*/  ,pi_v_nro_exp_unico_ini                 in varchar2      --nro. expediente administrativo
/*018*/  ,pi_v_nro_exp_unico_fin                 in varchar2      --nro. expediente administrativo
/*019*/  ,pi_v_nroExpAdm_nivel                   in varchar2      --nro. expediente antiguo
/*020*/  ,pi_v_nro_resol                         in varchar2      --nro. resolucion or
/*021*/  ,pi_v_fec_reso_or_ini                   in varchar2      --FECHA RESOLUCION OR INI
/*022*/  ,pi_v_fec_reso_or_fin                   in varchar2      --FECHA RESOLUCION OR FIN
/*023*/  ,pi_v_fec_notifi_or_ini                 in varchar2      --FECHA NOTIFICACION RESOLUCION INI
/*024*/  ,pi_v_fec_notifi_or_fin                 in varchar2      --FECHA NOTIFICACION RESOLUCION FIN
/*025*/  ,PI_V_FEC_GENERACION_SEC_INI            in VARCHAR2      --FECHA GENERACION SEC
/*026*/  ,PI_V_FEC_GENERACION_SEC_FIN            in VARCHAR2      --FECHA GENERACION SEC
---
/*027*/  ,pi_v_fec_recepcion_aec_ini             in varchar2      --FECHA RECEPCION AEC INICIO
/*028*/  ,pi_v_fec_recepcion_aec_fin             in varchar2      --FECHA RECEPCION AEC FIN
/*029*/  ,PI_V_ANIO_INGRESO_AEC_INI              in varchar2      --AÑO INGRESO AL AEC INI
/*030*/  ,PI_V_ANIO_INGRESO_AEC_FIN              in varchar2      --AÑO INGRESO AL AEC FIN
/*031*/  ,PI_V_NRO_INGRESO_AEC_INI               in varchar2      --nro. ingreso aec
/*032*/  ,PI_V_NRO_INGRESO_AEC_FIN               in varchar2      --nro. ingreso aec
---
/*033*/  ,PI_V_ANIO_FILE_INI                     in varchar2      --AÑO FILE INI
/*034*/  ,PI_V_ANIO_FILE_FIN                     in varchar2      --AÑO FILE FIN
/*035*/  ,PI_V_NRO_FILE_INI                      in varchar2      --nro. file
/*036*/  ,PI_V_NRO_FILE_FIN                      in varchar2      --nro. file
/*037*/  ,pi_v_fec_recepcion_file_ini            in varchar2      --FECHA RECEPCION FILE INICIO
/*038*/  ,pi_v_fec_recepcion_file_fin            in varchar2      --FECHA RECEPCION FILE FIN
---
/*039*/  ,pi_n_valor_uit_ini                     in number        --nro uit ini
/*040*/  ,pi_n_valor_uit_fin                     in number        --nro uit fin
/*041*/  ,pi_n_monto_uit_ini                     in NUMBER        --MONTO UIT INI
/*042*/  ,pi_n_monto_uit_fin                     in NUMBER        --MONTO UIT FIN
/*043*/  ,pi_n_saldo_ini                         in NUMBER        --SALDO UIT INI
/*044*/  ,pi_n_saldo_fin                         in NUMBER        --SALDO UIT FIN
/*045*/  ,pi_v_id_tipo_multa                     in varchar2      --TIPO MULTA (SOLIDARIA/INDIVIDUAL)
/*046*/  ,pi_v_cod_estado_multa_resol            in varchar2      --estado de la multa resolutivo
/*047*/  ,pi_v_cod_estado_pago                   in varchar2      --estado pago de la multa
/*048*/  ,PI_V_FEC_ESTADO_MULTA_OR_INI           in VARCHAR2      --FECHA ESTADO MULTA OR INI
/*049*/  ,PI_V_FEC_ESTADO_MULTA_OR_FIN           in VARCHAR2      --FECHA ESTADO MULTA OR FIN
/*050*/  ,PI_V_FEC_ESTADO_MULTA_COB_INI          in VARCHAR2      --FECHA ESTADO MULTA COBRANZA
/*051*/  ,PI_V_FEC_ESTADO_MULTA_COB_FIN          in VARCHAR2      --FECHA ESTADO MULTA COBRANZA
/*052*/  ,pi_v_cod_estado_multa_cob              in varchar2      --estado de la multa cobranza
/*053*/  ,pi_v_cod_motivo_multa_cob              in varchar2      --motivo multa cobranza
/*054*/  ,PI_V_IND_TIPO_PAGO                     in VARCHAR2      --INDICADOR DE PAGO
/*055*/  ,pi_c_flg_asocu_multa                   IN CHAR         --INDICADOR % ASOCU > 0
-----------------------------------------------------------------------------------------------
/*056*/  ,pi_v_cod_estado_exped_cob              in varchar2      --estado expediente cobranza
/*057*/  ,pi_v_anio                              in varchar2      --año expediente cobranza
/*058*/  ,pi_v_nro_exp_cob_ini                   in varchar2      --nro. expediente cobranza
/*059*/  ,pi_v_nro_exp_cob_fin                   in varchar2      --nro. expediente cobranza
/*060*/  ,pi_v_fec_gen_exped_cob_ini             in varchar2      --FECHA GENERACION EXPED COBRANZA INI
/*061*/  ,pi_v_fec_gen_exped_cob_fin             in varchar2      --FECHA GENERACION EXPED COBRANZA FIN
-------
/*062*/  ,pi_v_gestor_cobranza                   in varchar2      --Gestor de cobranza
/*063*/  ,pi_v_fec_emi_rec_ini                   in varchar2      --Fecha de Emisión de la REC
/*064*/  ,pi_v_fec_emi_rec_fin                   in varchar2      --Fecha de Emisión de la REC
/*065*/  ,pi_v_fec_noti_rec_ini                  in varchar2      --Fecha de Notificación de la REC
/*066*/  ,pi_v_fec_noti_rec_fin                  in varchar2      --Fecha de Notificación de la REC
/*067*/  ,pi_v_cod_motivo_exped_cob              in varchar2      --motivo expediente cobranza---------
/*068*/  ,pi_v_fec_est_exped_cob_ini             in varchar2      --Fecha de Estado del Expediente
/*069*/  ,pi_v_fec_est_exped_cob_fin             in varchar2      --Fecha de Estado del Expediente
/*070*/  ,pi_v_num_env_arch_ini                  in varchar2      --Nº Envio a Archivo Central
/*071*/  ,pi_v_num_env_arch_fin                  in varchar2      --Nº Envio a Archivo Central
/*072*/  ,pi_v_fec_envi_arch_ini                 in varchar2      --Fecha de Envío a Archivo Central
/*073*/  ,pi_v_fec_envi_arch_fin                 in varchar2      --Fecha de Envío a Archivo Central
/*074*/  ,pi_v_nro_ofic_sunat_ini                in varchar2      --Nº de Oficio de la SUNAT
/*075*/  ,pi_v_nro_ofic_sunat_fin                in varchar2      --Nº de Oficio de la SUNAT
/*076*/  ,pi_n_dere_antiDump_ini                 in NUMBER        --Derechos Antidumping
/*077*/  ,pi_n_dere_antiDump_fin                 in NUMBER        --Derechos Antidumping
/*078*/  ,pi_v_nro_parti_ini                     in varchar2      --Partida Arancelaria
/*079*/  ,pi_v_nro_parti_fin                     in varchar2      --Partida Arancelaria
/*080*/  ,pi_v_nro_dua_ini                       in varchar2      --Nº DUA
/*081*/  ,pi_v_nro_dua_fin                       in varchar2      --Nº DUA
/*082*/  ,pi_v_nro_liq_cob_ini                   in varchar2      --Nº Liquidación de Cobranza
/*083*/  ,pi_v_nro_liq_cob_fin                   in varchar2      --Nº Liquidación de Cobranza
/*084*/  ,pi_v_id_intendencia                    in varchar2      --Intendencia antidumping
/*085*/  ,pi_c_flg_ind_embargo                   in char          --INDICADOR TIENE EMBARGO?
/*086*/  ,pi_v_fec_asig_gestor_ini               in varchar2      --fecha de asignacion de gestor ini
/*087*/  ,pi_v_fec_asig_gestor_fin               in varchar2      --fecha de asignacion de gestor fin
/*088*/  ,pi_v_fec_carta_precoactiva_ini         in varchar2      --fecha de carta precoactiva inicio
/*089*/  ,pi_v_fec_carta_precoactiva_fin         in varchar2      --fecha de carta precoactiva fin
/*090*/  ,pi_v_id_expectativa_cobro              in varchar2      --cadena codigos espectativa de cobro

-----------------------------------------------------------------------------------------------
        --denunciante
/*091*/  ,pi_v_d_codSanciona_ini                 in varchar2      --Código del INDECOPI
/*092*/  ,pi_v_d_codSanciona_fin                 in varchar2      --Código del INDECOPI
/*093*/  ,pi_i_d_tip_persona                     in integer       --Tipo de Personería
/*094*/  ,pi_v_d_razon_social                    in varchar2      --Razón Social
/*095*/  ,pi_v_d_ape_paterno                     in varchar2      --Apellido Paterno
/*096*/  ,pi_v_d_ape_materno                     in varchar2      --Apellido Materno
/*097*/  ,pi_v_d_ape_casada                      in varchar2      --Apellido Casada
/*098*/  ,pi_v_d_pri_nombre                      in varchar2      --Primer nombre
/*099*/  ,pi_v_d_seg_nombre                      in varchar2      --Segundo nombre
/*100*/  ,pi_i_d_tipo_doc                        in integer       --Tipo de Documento
/*101*/  ,pi_v_d_nro_doc                         in varchar2      --Nº de documento de identidad
/*102*/  ,pi_i_d_tip_empresa                     in integer       --Tipo de Empresa
/*103*/  ,pi_n_d_id_sect_econo                   in number        --CIIU (Actividad Economica)
/*104*/  ,pi_c_d_flg_asocu                       in char          --flag asocu
/*105*/  ,pi_c_d_fl_oficio                       in char          --indicador denunciante de oficio=Indecopi
        --denunciado
/*106*/  ,pi_v_do_codSanciona_ini                in varchar2      --Código del INDECOPI
/*107*/  ,pi_v_do_codSanciona_fin                in varchar2      --Código del INDECOPI
/*108*/  ,pi_i_do_tip_persona                    in integer       --Tipo de Personería
/*109*/  ,pi_v_do_razon_social                   in varchar2      --Razón Social
/*110*/  ,pi_v_do_ape_paterno                    in varchar2      --Apellido Paterno
/*111*/  ,pi_v_do_ape_materno                    in varchar2      --Apellido Materno
/*112*/  ,pi_v_do_ape_casada                     in varchar2      --Apellido Casada
/*113*/  ,pi_v_do_pri_nombre                     in varchar2      --Primer nombre
/*114*/  ,pi_v_do_seg_nombre                     in varchar2      --Segundo nombre
/*115*/  ,pi_i_do_tipo_doc                       in integer       --Tipo de Documento
/*116*/  ,pi_v_do_nro_doc                        in varchar2      --Nº de documento de identidad
/*117*/  ,pi_i_do_tip_empresa                    in integer       --Tipo de Empresa
/*118*/  ,pi_n_do_id_sect_econo                  in number        --CIIU (Actividad Economica)
/*119*/  ,pi_c_do_flg_asocu                      in char          --flag asocu
         --sancionado
/*120*/  ,pi_v_s_codSanciona_ini                 in varchar2      --Código del INDECOPI
/*121*/  ,pi_v_s_codSanciona_fin                 in varchar2      --Código del INDECOPI
/*122*/  ,pi_i_s_tip_persona                     in integer       --Tipo de Personería
/*123*/  ,pi_v_s_razon_social                    in varchar2      --Razón Social
/*124*/  ,pi_v_s_ape_paterno                     in varchar2      --Apellido Paterno
/*125*/  ,pi_v_s_ape_materno                     in varchar2      --Apellido Materno
/*126*/  ,pi_v_s_ape_casada                      in varchar2      --Apellido Casada
/*127*/  ,pi_v_s_pri_nombre                      in varchar2      --Primer nombre
/*128*/  ,pi_v_s_seg_nombre                      in varchar2      --Segundo nombre
/*129*/  ,pi_i_s_tipo_doc                        in integer       --Tipo de Documento
/*130*/  ,pi_v_s_nro_doc                         in varchar2      --Nº de documento de identidad
/*131*/  ,pi_i_s_tip_empresa                     in integer       --Tipo de Empresa
/*132*/  ,pi_n_s_id_sect_econo                   in number        --CIIU (Actividad Economica)
/*133*/  ,pi_c_s_flg_asocu                       in char           --flag asocu
--@0002:ini
/*134*/  ,pi_c_s_flg_buscar_by_contenido         in char           --0=NO;1=SI
--@0002:fin
-----------------------------------------------------------------------------------------------
         ,po_cu_retorno                          out cu_rec_set
);

/*
-----------------------------------------------------------
-- AUTOR        : HCHALCO
-- CREADO       : 09.07.2021
-- PROPOSITO    : Consulta de multas pagadas sin fecha de notificaciones del SICOB
-----------------------------------------------------------
*/
procedure SCOB_SP_S_MULTA_PAGA_SIN_NOTIF(
       pi_vc_fec_gen_cum_ini                   in varchar2      --FECHA GENERACION CUM INI
      ,pi_vc_fec_gen_cum_fin                   in varchar2      --FECHA GENERACION CUM FIN
      ,pi_vc_cum_ini                           in varchar2      --cum
      ,pi_vc_cum_fin                           in varchar2      --cum
      ,pi_vc_id_usuario                        in varchar2      --idUsuario
      ,po_cu_retorno                          out cu_rec_set
);

/*
-----------------------------------------------------------
-- AUTOR        : CROJAS
-- CREADO       : 07.12.2022
-- PROPOSITO    : REPORTE 1
-----------------------------------------------------------
*/
procedure SCOB_SP_GET_MULTA_AVANZADA_FRACC(
       PIN_VC_CUM                   in varchar2      --XXXX
      ,POUT_CU_RETORNO                          out CU_REC_SET
);

/*
-----------------------------------------------------------
-- AUTOR        : CROJAS
-- CREADO       : 07.12.2022
-- PROPOSITO    : REPORTE 2
-----------------------------------------------------------
*/
procedure SCOB_SP_GET_SANCIONADOS_FRACC(
       PIN_NU_ID_MULTA                   in number      --XXXX
      ,POUT_CU_RETORNO                          out CU_REC_SET
);

  /*****************************************************************
  ‘* Nombre : F_NU_VALIDAR_PARTIDA
  '* Parámetros :
  '* Propósito : Validar si la partida registral existe en la PIDE
  '* Output :
  '* Creado por : Victor Bendezú
  '* Fec Creación : 30/10/2021
  '* Fec Actualización :  21/07/2022
  ‘* Observación : TK 263527 la variable V_VC_TRANSACCION de actualiza la longitud de 10 a 50 caracteres, debido a que partidas SARP devuelven mayor longitud
  '****************************************************************/
  FUNCTION F_NU_VALIDAR_PARTIDA(PIN_VC_REGISTRO_JURIDICO  IN VARCHAR2,
                                PIN_VC_ZONA_REGISTRAL     IN VARCHAR2,
                                PIN_VC_OFICINA_REGISTRAL  IN VARCHAR2,
                                PIN_VC_NUMERO  IN VARCHAR2) RETURN NUMBER;
                                
end;
/
CREATE OR REPLACE PACKAGE BODY SCOB_PK_CONSULTA is
--@0001 : 04.02.2013: se modifica para que el filtro: pi_v_nro_exp_unico_ini, busque solo por el correlativo y no por todo la composicion del campo.
--@0002 : 15.03.2013: se modifica para permitir la busqueda de administrados por contenido
--@0003 : 15.03.2013: se modifica para mostrar en la consulta de documento las columnas: Nombre plantilla, Usuario.
--@0004 : 09.12.2015: se modifica para mostrar en la consulta de documento las columnas: Estado del Documento UCI, Fecha de Notificacion UCI, Hora de Notificacion UCI y Fecha de Notificacion de SICOB.
PROCEDURE SCOB_SP_S_CONSULTA_DOCUMENTO
  /*
-----------------------------------------------------------
-- AUTOR        : RMCA
-- CREADO       : 19.09.2011
-- PROPOSITO    : Consulta de Documentos Generados de Multas y Expedientes
-----------------------------------------------------------
*/
  (
  --FILTROS MULTAS
   PI_V_ANIO_CUM              VARCHAR2 --ANIO CUM
  ,PI_V_CUM_INI               VARCHAR2 --RANGO INICIAL DE LA CUM
  ,PI_V_CUM_FIN               VARCHAR2 --RANGO FINAL DE LA CUM
  ,PI_V_FEC_GEN_CUM_INI       VARCHAR2 --RANGO INICIAL DE LA FECHA GENERACION CUM
  ,PI_V_FEC_GEN_CUM_FIN       VARCHAR2 --RANGO FINAL DE LA FECHA GENERACION CUM
  ,PI_V_EST_MULTA_COBRAN      VARCHAR2 --ESTADO DE LA MULTA COBRANZA
  ,PI_V_ANIO_FILE             VARCHAR2 --AÑO DEL FILE EXPEDIENTE DE COBRANZA
  ,PI_V_NRO_FILE_INI          VARCHAR2 --RANGO INICIAL DEL Nº DE FILE EXPEDIENTE DE COBRANZA
  ,PI_V_NRO_FILE_FIN          VARCHAR2 --RANGO FINAL DEL Nº DE FILE EXPEDIENTE DE COBRANZA
  --EXPEDIENTE COBRANZA
  ,PI_V_ANIO_EXP              VARCHAR2 --AÑO EXPEDIENTE DE COBRANZA
  ,PI_V_NRO_EXP_COB_INI       VARCHAR2 --RANGO INICIAL DEL Nº DE EXPEDIENTE DE COBRANZA
  ,PI_V_NRO_EXP_COB_FIN       VARCHAR2 --RANGO FINAL DEL Nº DE EXPEDIENTE DE COBRANZA
  ,PI_V_FECGENEXPCOB_INI      VARCHAR2 --FECHA DE GENERACION DEL EXPEDIENTE DE COBRANZA
  ,PI_V_FECGENEXPCOB_FIN      VARCHAR2 --FECHA DE GENERACION DEL EXPEDIENTE DE COBRANZA
  ,PI_V_EST_EXPE              VARCHAR2 --ESTADO DEL EXPEDIENTE COBRANZ
  --FILTROS DE DOCUMENTOS GENERADOS
  ,PI_V_TIP_DOC               VARCHAR2 --TIPO DE DOCUMENTO DE EXPEDIENTE COBRANZA
  ,PI_NRO_DOC_INI             VARCHAR2 --NUMERO DE DOCUMENTO DE MULTA O EXPEDIENTE COBRANZA
  ,PI_NRO_DOC_FIN             VARCHAR2 --NUMERO DE DOCUMENTO DE MULTA O EXPEDIENTE COBRANZA
  ,PI_V_FEC_GEN_DOCEXPE_INI   VARCHAR2 --FECHA DE GENERACION DEL DOCUMENTO DE MULTA O EXPEDIENTE COBRANZA
  ,PI_V_FEC_GEN_DOCEXPE_FIN   VARCHAR2 --FECHA DE GENERACION DEL DOCUMENTO DE MULTA O EXPEDIENTE COBRANZA
  -- Req. 32 - @dcelis/begin
  ,PI_V_FEC_NOTIF_INI         VARCHAR2 -- FECHA DE NOTIFICACION DE INICIO
  ,PI_V_FEC_NOTIF_FIN         VARCHAR2 --FECHA DE NOTIFICACION DE FIN
  -- Req. 32 - @dcelis/end
  ,PI_V_GES_COBRANZA          VARCHAR2 --USUARIO DEL GESTRO DE COBRANZA
  --EXPEDIENTES PENDIENTE TRAMITE(T_SCOB_EXPED_SUSPENDE)
  ,PI_V_FEC_EXPENSUS_INI      VARCHAR2 --RANGO INICIAL DE LA FECHA DE EXPEDIENTES PENDIENTES DE TRAMITE SUSPENCION
  ,PI_V_FEC_EXPENSUS_FIN      VARCHAR2 --RANGO FINAL DE LA FECHA DE EXPEDIENTES PENDIENTES DE TRAMITE SUSPENCION
  ,PI_V_FEC_EXPENFRA_INI      VARCHAR2 --RANGO INICIAL DE LA FECHA DE EXPEDIENTES PENDIENTES DE TRAMITE FRACCIONAMIENTO
  ,PI_V_FEC_EXPENFRA_FIN      VARCHAR2 --RANGO FINAL DE LA FECHA DE EXPEDIENTES PENDIENTES DE TRAMITE FRACCIONAMIENTO
  --EXPEDIENTES CON EMBARGO
  ,PI_V_TIP_EMBARGO           VARCHAR2 --TIPO DE EMBARGOS
  ,PI_V_FEC_RESOL_EMB_INI     VARCHAR2 --FECHA DE RESOLUCION DEL EMBARGO
  ,PI_V_FEC_RESOL_EMB_FIN     VARCHAR2 --FECHA DE RESOLUCION DEL EMBARGO
  ,PI_V_IND_EXP_CART_FIAN     VARCHAR2 --INDICADOR DE EXPEDIENTE CON CARTA FIANZA ASOCIADA
  --FILTROS SANCIONADO
  ,PI_V_COD_INDECOPI_INI      VARCHAR2 --CÓDIGO DEL INDECOPI
  ,PI_V_COD_INDECOPI_FIN      VARCHAR2 --CÓDIGO DEL INDECOPI
  ,PI_I_TIP_PERSONA           INTEGER  --TIPO DE PERSONERÍA
  ,PI_V_RAZON_SOCIAL          VARCHAR2 --RAZÓN SOCIAL
  ,PI_V_APE_PATERNO           VARCHAR2 --APELLIDO PATERNO
  ,PI_V_APE_MATERNO           VARCHAR2 --APELLIDO MATERNO
  ,PI_V_APE_CASADA            VARCHAR2 --APELLIDO CASADA
  ,PI_V_NOMBRES               VARCHAR2 --NOMBRES
  ,PI_I_TIPO_DOC              INTEGER  --TIPO DE DOCUMENTO
  ,PI_V_NRO_DOC               VARCHAR2 --Nº DE DOCUMENTO DE IDENTIDAD
  ,PI_V_NRO_RUC               VARCHAR2 --Nº RUC
  ,PI_N_ID_SECT_ECONO         INTEGER  --CIIU (ACTIVIDAD ECONOMICA)
  ,PI_V_IND_ASOC_CONS         VARCHAR2 --INDICADOR DE ASOCIACION DE CONSUMIDOR
  ,PO_CU_RETORNO              OUT CU_REC_SET
)
IS
  V_QUERY CLOB;
BEGIN
  --
  --INSERT INTO T_TEST(COLUMN1) VALUES('PI_V_FEC_NOTIF_INI: '||PI_V_FEC_NOTIF_INI);
  --INSERT INTO T_TEST(COLUMN1) VALUES('PI_V_FEC_NOTIF_FIN: '||PI_V_FEC_NOTIF_FIN);
  -- CAMBIAR A CONSULTA DINAMICA
  V_QUERY:='SELECT
    DOC.IND_PROVIENE, --M=MULTA; E=EXPEDIENTE
    --datos multa
    MULT.ID_MULTA AS ID_MULTA,
    MULT.ANIO AS ANIO_CUM,
    MULT.CUM AS NRO_CUM,
    --datos expediente
    EXPE.ID_EXPEDIENTE AS ID_EXPEDIENTE,
    EXPE.ANIO AS ANIO_EXPEDIENTE,
    EXPE.NRO_EXPEDIENTE AS NRO_EXPEDIENTE,
    --datos del documento
    DOC.ID_DOCUMENTO,
    DOC.COD_TIPO_DOCUMENTO,
    DOC.NOM_TIPO_DOCUMENTO,
    DOC.NRO_DOCUMENTO,
    DOC.NRO_RESOLUCION,
    DOC.FEC_GENERACION_DOC,
    DOC.COD_TIPO_EMBARGO,
    DOC.NOM_TIPO_EMBARGO,
    DOC.ID_EXPEDIENTE_EMBARGO,
    --fin datos del documento
    SCOB_PK_EXPEDIENTE.SCOB_FN_SANCIONADOS_MULTA(MULT.ID_MULTA,0) AS NOM_SANCIONADO,
    SCOB_PK_EXPEDIENTE.SCOB_FN_SANCIONADOS_CIIU(MULT.ID_MULTA,0) AS CIU_SANCIONADO,
    MULT.FEC_INGRESO AS FEC_GENERACION_CUM,
    MULT.ESTADO_MULTA AS COD_ESTADO_MULTA_COBRANZA,
    SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(5, MULT.ESTADO_MULTA) AS NOM_ESTADO_MULTA_COBRANZA,
    ---
    MULT.ANIO_FILE_AEC AS ANIO_FILE,
    ARCO.CODIGO || ''-'' || MULT.NRO_FILE_AEC AS NRO_FILE,
    EXPE.FEC_INGRESO AS FEC_GENERACION_EXPEDIENTE,
    EXPE.ESTADO_EXPEDIENTE AS COD_ESTADO_EXPEDIENTE_COBRANZA,
    EST_EXP_COB.DESCRIPCION AS NOM_ESTADO_EXPEDIENTE_COBRANZA,
    --
    DOC.ID_EXPEDIENTE_SUSPENDER AS ID_EXPEDIENTE_SUSPENDER,
    DOC.FEC_ATENCION_SUSPENSION AS FEC_ATENCION_SUSPENSION,
    DOC.ID_EXPEDIENTE_FRACCIONAR AS ID_EXPEDIENTE_FRACCIONAR,
    DOC.FEC_ATENCION_FRACCIONAR AS FEC_ATENCION_FRACCIONAR,
    DOC.IND_CARTA_FIANZA AS IND_CARTA_FIANZA,
    TD.TXT_DESCRIPCION AS TIPO_GEN_DOC,
    --@0003:ini
    PLAN.DESCRIPCION AS DES_PLANTILLA,
    USUA.USUARIO AS USU_CREA_DOC,
    --@0003:fin
    --@0004:ini
    (CASE
         WHEN DOC.ESTADO_DOC_UCI = ''T'' THEN ''En Transito''
         WHEN DOC.ESTADO_DOC_UCI = ''E'' THEN ''Entregado''
         WHEN DOC.ESTADO_DOC_UCI = ''D'' THEN ''Devuelto''
         WHEN DOC.ESTADO_DOC_UCI = ''N'' THEN ''Notificado''
         WHEN DOC.ESTADO_DOC_UCI = ''Area'' THEN ''En UCI''
         ELSE NULL
       END) AS ESTADO_DOC_UCI,
    TO_CHAR(DOC.FEC_NOTF_UCI,''DD/MM/YYYY'') AS FEC_NOTF_UCI,
    DOC.HORA_NOTF_UCI AS HORA_NOTF_UCI,
    TO_CHAR(DOC.FEC_NOTIFICACION,''DD/MM/YYYY'') AS FEC_NOTIFICACION
    --DOC.FEC_NOTIFICACION
    FROM (
      SELECT
        ''M'' AS IND_PROVIENE,
        MDOC.ID_MULTA AS ID_MULTA,
        MDOC.ID_MULTA_DOCUMENTO_GEN AS ID_DOCUMENTO,
        TO_NUMBER(SUBTIPO_DOC.COD_INTERNO) AS COD_TIPO_DOCUMENTO,
        SUBTIPO_DOC.TXT_DESCRIPCION AS NOM_TIPO_DOCUMENTO,
        MDOC.NRO_DOCUMENTO AS NRO_DOCUMENTO,
        NULL AS NRO_RESOLUCION,
        MDOC.FEC_INGRESO AS FEC_GENERACION_DOC,
        0 AS COD_TIPO_EMBARGO,
        NULL AS NOM_TIPO_EMBARGO,
        0 AS ID_EXPEDIENTE_EMBARGO,
        NULL AS ID_EXPEDIENTE_SUSPENDER,
        NULL AS FEC_ATENCION_SUSPENSION,
        NULL AS ID_EXPEDIENTE_FRACCIONAR,
        NULL AS FEC_ATENCION_FRACCIONAR,
        ''0'' AS IND_CARTA_FIANZA,
        MDOC.TIPO_DOC_ASOC AS TIPO_DOC_ASOC,
        --@0003:ini
        MDOC.ID_PLANTILLA AS ID_PLANTILLA,
        MDOC.ID_USUARIO_INGRESO AS ID_USU_CREA_DOC,
        --@0003:fin
        --@0004:ini
        CAST(NULL AS VARCHAR2(20)) AS ESTADO_DOC_UCI,
        --CAST(NULL AS VARCHAR2(20)) AS FEC_NOTF_UCI,
        CAST(NULL AS DATE) AS FEC_NOTF_UCI,
        CAST(NULL AS VARCHAR2(10)) AS HORA_NOTF_UCI,
		    CAST(NULL AS DATE) AS FEC_NOTIFICACION
        --@0004:fin
      FROM T_SCOB_MULTA_DOCUMENTO_GEN MDOC
      INNER JOIN T_SCOB_TIPO_DOCUMENTO TIPO_DOC ON TIPO_DOC.ID_TIPO_DOCUMENTO = MDOC.ID_TIPO_DOCUMENTO
      INNER JOIN T_SCOB_TABLA_DET SUBTIPO_DOC ON SUBTIPO_DOC.ID_TABLA = 23 AND SUBTIPO_DOC.COD_INTERNO = TIPO_DOC.COD_SUBTIPO_DOCUMENTO
      WHERE MDOC.ESTADO = ''1''
      UNION ALL
      SELECT
        ''E'' AS IND_PROVIENE,
        EXMU.ID_MULTA AS ID_MULTA,
        EXDO.ID_EXPEDIENTE_DOCUMENTO AS ID_DOCUMENTO,
        EXDO.COD_SUBTIPO_DOCUMENTO AS COD_TIPO_DOCUMENTO,
        SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(23, EXDO.COD_SUBTIPO_DOCUMENTO) AS NOM_TIPO_DOCUMENTO,
        DECODE(EXDO.COD_SUBTIPO_DOCUMENTO,1, EXDO.NRO_RESOLUCION, EXDO.NRO_DOCUMENTO) AS NRO_DOCUMENTO,
        DECODE(EXDO.COD_SUBTIPO_DOCUMENTO,1, NULL, EXDO.NRO_RESOLUCION) AS NRO_RESOLUCION,
        EXDO.FEC_INGRESO AS FEC_GENERACION_DOC,
        EXEM.COD_TIPO_EMBARGO AS COD_TIPO_EMBARGO,
        SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(35, EXEM.COD_TIPO_EMBARGO) AS NOM_TIPO_EMBARGO,
        EXEM.ID_EXPEDIENTE_EMBARGO AS ID_EXPEDIENTE_EMBARGO,
        EXSU.ID_EXPED_SUSPENDER AS ID_EXPEDIENTE_SUSPENDER,
        EXSU.FEC_CIERRE_TRAMITE AS FEC_ATENCION_SUSPENSION,
        EXFR.ID_EXPED_FRACCIONAR AS ID_EXPEDIENTE_FRACCIONAR,
        EXFR.FEC_CIERRE_TRAMITE AS FEC_ATENCION_FRACCIONAR,
        DECODE(FIANZA.ID_EXPEDIENTE,NULL,''0'',''1'') AS IND_CARTA_FIANZA,
        EXDO.TIPO_DOC_ASOC AS TIPO_DOC_ASOC,
        --@0003:ini
        EXDO.ID_PLANTILLA AS ID_PLANTILLA,
        EXDO.ID_USUARIO_INGRESO AS ID_USU_CREA_DOC,
        --@0003:fin
        --@0004:ini
        EXDO.VC_ESTADO_DOC_UCI AS ESTADO_DOC_UCI,
        --EXDO.VC_FEC_NOTF_UCI AS FEC_NOTF_UCI,
        TO_DATE(EXDO.VC_FEC_NOTF_UCI,''YYYY-MM-DD'') AS FEC_NOTF_UCI,
        EXDO.VC_HORA_NOTF_UCI AS HORA_NOTF_UCI,
		    EXDO.FEC_NOTIFICACION
        --@0004:fin
      FROM T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
      INNER JOIN T_SCOB_EXPEDIENTE EXPE ON EXPE.ID_EXPEDIENTE = EXDO.ID_EXPEDIENTE AND EXPE.ESTADO = ''1''
      INNER JOIN T_SCOB_EXPEDIENTE_MULTA EXMU ON EXMU.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE AND EXMU.ESTADO = ''1''
      LEFT JOIN T_SCOB_EXPED_EMBARGO_DOC EEDO ON  EEDO.ID_EXPEDIENTE_DOCUMENTO = EXDO.ID_EXPEDIENTE_DOCUMENTO AND EEDO.ESTADO = ''1''
      LEFT JOIN T_SCOB_EXPED_EMBARGO EXEM ON EXEM.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE AND EXEM.ID_EXPEDIENTE_EMBARGO = EEDO.ID_EXPEDIENTE_EMBARGO AND EXEM.ESTADO = ''1''
      LEFT JOIN T_SCOB_EXPED_SUSPENDER_DOC EDSU ON EDSU.ID_EXPEDIENTE_DOCUMENTO = EXDO.ID_EXPEDIENTE_DOCUMENTO AND EDSU.ESTADO = ''1''
      LEFT JOIN T_SCOB_EXPED_SUSPENDER EXSU ON EXSU.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE AND EXSU.ID_EXPED_SUSPENDER = EDSU.ID_EXPED_SUSPENDER AND EXSU.ESTADO = ''1'' AND EXSU.ESTADO_SOLICITUD <> ''1'' --A PENDIENTE
      LEFT JOIN T_SCOB_EXPED_FRACCIONAR_DOC EFDO ON EFDO.ID_EXPEDIENTE_DOCUMENTO = EXDO.ID_EXPEDIENTE_DOCUMENTO AND EFDO.ESTADO = ''1''
      LEFT JOIN T_SCOB_EXPED_FRACCIONAR EXFR ON EXFR.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE AND EXFR.ID_EXPED_FRACCIONAR = EFDO.ID_EXPED_FRACCIONAR AND EXFR.ESTADO = ''1'' AND EXFR.ESTADO_SOLICITUD <> ''1'' --A PENDIENTE
      LEFT JOIN (
           SELECT FIANZA.ID_EXPEDIENTE AS ID_EXPEDIENTE,COUNT(FIANZA.ID_EXPEDIENTE_GARANTIA) AS NRO_FIANZAS
           FROM T_SCOB_EXPEDIENTE_GARANTIA FIANZA
           WHERE FIANZA.ESTADO = ''1''
           AND TO_DATE(TO_CHAR(FIANZA.FEC_VENCIMIENTO,''DD/MM/YYYY''),''DD/MM/YYYY'') > TO_DATE(TO_CHAR(SYSDATE,''DD/MM/YYYY''),''DD/MM/YYYY'')
           GROUP BY FIANZA.ID_EXPEDIENTE
      )FIANZA ON FIANZA.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
      WHERE EXDO.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
      AND EXDO.ESTADO = ''1''
  ) DOC
  INNER JOIN T_SCOB_MULTA MULT ON MULT.ID_MULTA = DOC.ID_MULTA AND MULT.ESTADO = ''1''
  LEFT JOIN T_SCOB_EXPEDIENTE_MULTA EXMU ON EXMU.ID_MULTA = MULT.ID_MULTA AND EXMU.ESTADO = ''1''
  LEFT JOIN T_SCOB_EXPEDIENTE EXPE ON EXPE.ID_EXPEDIENTE = EXMU.ID_EXPEDIENTE AND EXPE.ESTADO = ''1''
  LEFT JOIN T_SCOB_AREA_COBRANZA ARCO ON ARCO.ID_AREA_COBRANZA = MULT.ID_AREA_COBRANZA
  LEFT JOIN T_SCOB_EST_EXP_COB EST_EXP_COB ON EXPE.ESTADO_EXPEDIENTE = EST_EXP_COB.ID_EST_EXP_COB
  INNER JOIN (
       SELECT MDET.ID_MULTA AS ID_MULTA,MSAN.ID_PERSONA AS ID_PERSONA
       FROM T_SCOB_MULTA_DETAL MDET
       INNER JOIN T_SCOB_MULTA_SANCIONADO MSAN
             ON MSAN.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL
             AND NVL(MSAN.COD_TIPO_PERSONA,''1'')=''1'' AND MSAN.ESTADO = ''1''
       INNER JOIN T_SCOB_PERSONA PERS ON PERS.ID_PERSONA = MSAN.ID_PERSONA
       WHERE MDET.FLG_ACTUAL = ''1''
       AND MDET.ESTADO = ''1''
       --codigo indecopi
       AND (NVL('''||PI_V_COD_INDECOPI_INI||''','' '')='' '' OR (NVL('''||PI_V_COD_INDECOPI_INI||''','' '')='' '' AND PERS.COD_SANCIONADO BETWEEN '''||PI_V_COD_INDECOPI_INI||''' AND '''||PI_V_COD_INDECOPI_FIN||''' ))
       --tipo persona
       AND (NVL('||PI_I_TIP_PERSONA||',0)=0 OR (NVL('||PI_I_TIP_PERSONA||',0)<>0 AND PERS.TIPO_PERSONA='||PI_I_TIP_PERSONA||'))
       --razon social
       AND (NVL('''||PI_V_RAZON_SOCIAL||''','' '')='' '' OR (NVL('''||PI_V_RAZON_SOCIAL||''','' '')<>'' '' AND fun_scob_nosensite(PERS.RAZON_SOCIAL) LIKE fun_scob_nosensite('''||PI_V_RAZON_SOCIAL||''')))
       --apellido paterno
       AND (NVL('''||PI_V_APE_PATERNO||''','' '')='' '' OR (NVL('''||PI_V_APE_PATERNO||''','' '')<>'' '' AND fun_scob_nosensite(PERS.APE_PATERNO) LIKE fun_scob_nosensite('''||PI_V_APE_PATERNO||''')))
       --apellido materno
       AND (NVL('''||PI_V_APE_MATERNO||''','' '')='' '' OR (NVL('''||PI_V_APE_MATERNO||''','' '')<>'' '' AND fun_scob_nosensite(PERS.APE_MATERNO) LIKE fun_scob_nosensite('''||PI_V_APE_MATERNO||''')))
       --apellido casada
       AND (NVL('''||PI_V_APE_CASADA||''','' '')='' '' OR (NVL('''||PI_V_APE_CASADA||''','' '')<>'' '' AND fun_scob_nosensite(PERS.APE_CASADA) LIKE fun_scob_nosensite('''||PI_V_APE_CASADA||''')))
       --apellido nombres
       AND (NVL('''||PI_V_NOMBRES||''','' '')='' '' OR (NVL('''||PI_V_NOMBRES||''','' '')<>'' '' AND fun_scob_nosensite(PERS.PRI_NOMBRE || '' '' || PERS.SEG_NOMBRE) LIKE fun_scob_nosensite('''||PI_V_NOMBRES||''')))
       --tipo documento
       AND (NVL('||PI_I_TIPO_DOC||',0)=0 OR (NVL('||PI_I_TIPO_DOC||',0)<>0 AND PERS.TIPO_DOC='||PI_I_TIPO_DOC||'))
       --numero de documento
       AND (NVL('''||PI_V_NRO_DOC||''','' '')='' '' OR (NVL('''||PI_V_NRO_DOC||''','' '')<>'' '' AND PERS.NRO_DOC='''||PI_V_NRO_DOC||'''))
       --numero ruc
       AND (NVL('''||PI_V_NRO_RUC||''','' '')='' '' OR (NVL('''||PI_V_NRO_RUC||''','' '')<>'' '' AND PERS.NRO_RUC='''||PI_V_NRO_RUC||'''))
       --sector economico
       AND (NVL('||PI_N_ID_SECT_ECONO||',0)=0 OR (NVL('||PI_N_ID_SECT_ECONO||',0)<>0 AND PERS.ID_SECTOR_ECONOMICO='||PI_N_ID_SECT_ECONO||'))
       --indicador ASOCU
       AND (NVL('''||PI_V_IND_ASOC_CONS||''',''0'')=''0'' OR (NVL('''||PI_V_IND_ASOC_CONS||''',''0'')<>''0'' AND PERS.FLG_ASOCU=''1''))
  ) PERS ON PERS.ID_MULTA = MULT.ID_MULTA
  INNER JOIN T_SCOB_TABLA_DET TD ON TD.ID_TABLA = 60 AND TO_NUMBER(TD.COD_INTERNO) = DOC.TIPO_DOC_ASOC
  --@0003:ini
  LEFT JOIN T_SCOB_PLANTILLA PLAN ON PLAN.ID_PLANTILLA = DOC.ID_PLANTILLA
  LEFT JOIN T_SCOB_USUARIO USUA ON USUA.ID_USUARIO = DOC.ID_USU_CREA_DOC
  --@0003:fin
  WHERE
  --AÑO CUM
  (NVL('''||PI_V_ANIO_CUM||''','' '')='' '' OR (NVL('''||PI_V_ANIO_CUM||''','' '')<>'' '' AND MULT.ANIO='''||PI_V_ANIO_CUM||'''))
  --NRO CUM
  AND (NVL('''||PI_V_CUM_INI||''','' '')='' '' OR (NVL('''||PI_V_CUM_INI||''','' '')<>'' '' AND MULT.CUM BETWEEN '''||PI_V_CUM_INI||''' AND '''||PI_V_CUM_FIN||'''))
  --FECHA GENERACION CUM
  AND (NVL('''||PI_V_FEC_GEN_CUM_INI||''','' '')='' '' OR (NVL('''||PI_V_FEC_GEN_CUM_INI||''','' '')<>'' ''
  AND TO_DATE(TO_CHAR(EXPE.FEC_INGRESO,''DD/MM/YYYY''),''DD/MM/YYYY'')
  BETWEEN TO_DATE('''||PI_V_FEC_GEN_CUM_INI||''',''DD/MM/YYYY'') AND TO_DATE('''||PI_V_FEC_GEN_CUM_FIN||''',''DD/MM/YYYY'')))
  --AÑO FILE
  AND (NVL('''||PI_V_ANIO_FILE||''','' '')='' '' OR (NVL('''||PI_V_ANIO_FILE||''','' '')<>'' '' AND MULT.ANIO_FILE_AEC='''||PI_V_ANIO_FILE||'''))
  --NRO FILE
  AND (NVL('''||PI_V_NRO_FILE_INI||''','' '')='' '' OR (NVL('''||PI_V_NRO_FILE_INI||''','' '')<>'' '' AND ARCO.CODIGO || ''-'' || MULT.NRO_FILE_AEC BETWEEN '''||PI_V_NRO_FILE_INI||''' AND '''||PI_V_NRO_FILE_FIN||'''))
  --ESTADO MULTA COBRANZA
  AND (NVL('''||PI_V_EST_MULTA_COBRAN||''','' '')='' '' OR (NVL('''||PI_V_EST_MULTA_COBRAN||''','' '')<>'' '' AND INSTR('''||PI_V_EST_MULTA_COBRAN||''',''|'' || TO_CHAR(MULT.ESTADO_MULTA) || ''|'' )>0))
  --AÑO EXPEDIENTE COBRANZA
  AND (NVL('''||PI_V_ANIO_EXP||''','' '')='' '' OR (NVL('''||PI_V_ANIO_EXP||''','' '')<>'' '' AND EXPE.ANIO='''||PI_V_ANIO_EXP||'''))
  --NRO EXPEDIENTE COBRANZA
  AND (NVL('''||PI_V_NRO_EXP_COB_INI||''','' '')='' '' OR (NVL('''||PI_V_NRO_EXP_COB_INI||''','' '')<>'' '' AND EXPE.NRO_EXPEDIENTE BETWEEN '''||PI_V_NRO_EXP_COB_INI||''' AND '''||PI_V_NRO_EXP_COB_FIN||'''))
  --FECHA DE GENERACION DE EXPEDIENTE COBRANZA
  AND (NVL('''||PI_V_FECGENEXPCOB_INI||''','' '')='' '' OR (NVL('''||PI_V_FECGENEXPCOB_INI||''','' '')<>'' ''
  AND TO_DATE(TO_CHAR(EXPE.FEC_INGRESO,''DD/MM/YYYY''),''DD/MM/YYYY'')
  BETWEEN TO_DATE('''||PI_V_FECGENEXPCOB_INI||''',''DD/MM/YYYY'') AND TO_DATE('''||PI_V_FECGENEXPCOB_FIN||''',''DD/MM/YYYY'')))
  --ESTADO EXPEDIENTE COBRANZA
  AND (NVL('''||PI_V_EST_EXPE||''','' '')='' '' OR (NVL('''||PI_V_EST_EXPE||''','' '')<>'' '' AND INSTR('''||PI_V_EST_EXPE||''',''|'' || TO_CHAR(EXPE.ESTADO_EXPEDIENTE) || ''|'' )>0))
  --TIPO DE DOCUMENTO
  AND (NVL('''||PI_V_TIP_DOC||''','' '')='' '' OR (NVL('''||PI_V_TIP_DOC||''','' '')<>'' '' AND INSTR('''||PI_V_TIP_DOC||''',''|'' || TO_CHAR(DOC.COD_TIPO_DOCUMENTO) || ''|'' )>0))
  --NRO DE DOCUMENTO
  AND (NVL('''||PI_NRO_DOC_INI||''','' '')='' '' OR (NVL('''||PI_NRO_DOC_INI||''','' '')<>'' ''
  AND DOC.NRO_DOCUMENTO
  BETWEEN '''||PI_NRO_DOC_INI||''' AND '''||PI_NRO_DOC_FIN||'''))
  --FECHA GENERACION DE DOCUMENTO
  AND (NVL('''||PI_V_FEC_GEN_DOCEXPE_INI||''','' '')='' '' OR (NVL('''||PI_V_FEC_GEN_DOCEXPE_INI||''','' '')<>'' ''
  AND TO_DATE(TO_CHAR(DOC.FEC_GENERACION_DOC,''DD/MM/YYYY''),''DD/MM/YYYY'')
  BETWEEN TO_DATE('''||PI_V_FEC_GEN_DOCEXPE_INI||''',''DD/MM/YYYY'') AND TO_DATE('''||PI_V_FEC_GEN_DOCEXPE_FIN||''',''DD/MM/YYYY'')))';
  IF PI_V_FEC_NOTIF_INI IS NOT NULL AND PI_V_FEC_NOTIF_FIN IS NOT NULL THEN
    V_QUERY:=V_QUERY||'
    --FECHA DE NOTIFICACION : PRUEBAS
    AND (
      (TO_DATE(TO_CHAR(DOC.FEC_NOTIFICACION,''DD/MM/YYYY''),''DD/MM/YYYY'') BETWEEN TO_DATE('''||PI_V_FEC_NOTIF_INI||''',''DD/MM/YYYY'') AND TO_DATE('''||PI_V_FEC_NOTIF_FIN||''',''DD/MM/YYYY''))
      OR
      (TO_DATE(TO_CHAR(DOC.FEC_NOTF_UCI,''DD/MM/YYYY''),''DD/MM/YYYY'') BETWEEN TO_DATE('''||PI_V_FEC_NOTIF_INI||''',''DD/MM/YYYY'') AND TO_DATE('''||PI_V_FEC_NOTIF_FIN||''',''DD/MM/YYYY''))
    )';
  END IF;
  --GESTOR DE COBRANZA
  V_QUERY:=V_QUERY||'
  AND (NVL('''||PI_V_GES_COBRANZA||''','' '')='' '' OR (NVL('''||PI_V_GES_COBRANZA||''','' '')<>'' '' AND INSTR('''||PI_V_GES_COBRANZA||''',''|'' || TO_CHAR(MULT.ID_USUARIO_ASIG_COBRANZA) || ''|'' )>0))
  --FECHA DE SOLICITUD DE SUSPENSION ATENDIDAS
  AND (NVL('''||PI_V_FEC_EXPENSUS_INI||''','' '')='' '' OR (NVL('''||PI_V_FEC_EXPENSUS_INI||''','' '')<>'' '' AND DOC.ID_EXPEDIENTE_SUSPENDER IS NOT NULL --SOLO LAS SOLICITUDES DE SUSPENSION ATENDIDAS
  AND TO_DATE(TO_CHAR(DOC.FEC_ATENCION_SUSPENSION,''DD/MM/YYYY''),''DD/MM/YYYY'')
  BETWEEN TO_DATE('''||PI_V_FEC_EXPENSUS_INI||''',''DD/MM/YYYY'') AND TO_DATE('''||PI_V_FEC_EXPENSUS_FIN||''',''DD/MM/YYYY'')))
  --FECHA DE SOLICITUD DE FRACCIONAMIENTO ATENDIDAS
  AND (NVL('''||PI_V_FEC_EXPENFRA_INI||''','' '')='' '' OR (NVL('''||PI_V_FEC_EXPENFRA_INI||''','' '')<>'' '' AND DOC.ID_EXPEDIENTE_FRACCIONAR IS NOT NULL --SOLO LAS SOLICITUDES DE SUSPENSION ATENDIDAS
  AND TO_DATE(TO_CHAR(DOC.FEC_ATENCION_FRACCIONAR,''DD/MM/YYYY''),''DD/MM/YYYY'')
  BETWEEN TO_DATE('''||PI_V_FEC_EXPENFRA_INI||''',''DD/MM/YYYY'') AND TO_DATE('''||PI_V_FEC_EXPENFRA_FIN||''',''DD/MM/YYYY'')))
  --TIPO DE EMBARGO
  AND (NVL('''||PI_V_TIP_EMBARGO||''','' '')='' '' OR (NVL('''||PI_V_TIP_EMBARGO||''','' '')<>'' '' AND INSTR('''||PI_V_TIP_EMBARGO||''',''|'' || TO_CHAR(DOC.COD_TIPO_EMBARGO) || ''|'' )>0))
  --FECHA RESOLUCION
  AND (NVL('''||PI_V_FEC_RESOL_EMB_INI||''','' '')='' '' OR (NVL('''||PI_V_FEC_RESOL_EMB_INI||''','' '')<>'' '' AND DOC.NRO_RESOLUCION IS NOT NULL --SOLO LOS DOCUMENTOS DE RESOLUCION
  AND TO_DATE(TO_CHAR(DOC.FEC_GENERACION_DOC,''DD/MM/YYYY''),''DD/MM/YYYY'')
  BETWEEN TO_DATE('''||PI_V_FEC_RESOL_EMB_INI||''',''DD/MM/YYYY'') AND TO_DATE('''||PI_V_FEC_RESOL_EMB_FIN||''',''DD/MM/YYYY'')))
  --INDICADOR DE EXPEDIENTES CON CARTA FIANZA
  AND (NVL('''||PI_V_IND_EXP_CART_FIAN||''',''0'')=''0'' OR (NVL('''||PI_V_IND_EXP_CART_FIAN||''',''0'')<>''0'' AND DOC.IND_CARTA_FIANZA='''||PI_V_IND_EXP_CART_FIAN||'''))
  ORDER BY DOC.ID_MULTA, DOC.ID_DOCUMENTO';

  DBMS_OUTPUT.PUT_LINE('V_QUERY: '||V_QUERY);
  --INSERT INTO T_TEST(OTHER) VALUES(V_QUERY);
  --COMMIT;
  OPEN PO_CU_RETORNO FOR V_QUERY;
  --
  /*OPEN  PO_CU_RETORNO FOR
  SELECT
    DOC.IND_PROVIENE, --M=MULTA; E=EXPEDIENTE
    --datos multa
    MULT.ID_MULTA AS ID_MULTA,
    MULT.ANIO AS ANIO_CUM,
    MULT.CUM AS NRO_CUM,
    --datos expediente
    EXPE.ID_EXPEDIENTE AS ID_EXPEDIENTE,
    EXPE.ANIO AS ANIO_EXPEDIENTE,
    EXPE.NRO_EXPEDIENTE AS NRO_EXPEDIENTE,
    --datos del documento
    DOC.ID_DOCUMENTO,
    DOC.COD_TIPO_DOCUMENTO,
    DOC.NOM_TIPO_DOCUMENTO,
    DOC.NRO_DOCUMENTO,
    DOC.NRO_RESOLUCION,
    DOC.FEC_GENERACION_DOC,
    DOC.COD_TIPO_EMBARGO,
    DOC.NOM_TIPO_EMBARGO,
    DOC.ID_EXPEDIENTE_EMBARGO,
    --fin datos del documento
    SCOB_PK_EXPEDIENTE.SCOB_FN_SANCIONADOS_MULTA(MULT.ID_MULTA,0) AS NOM_SANCIONADO,
    SCOB_PK_EXPEDIENTE.SCOB_FN_SANCIONADOS_CIIU(MULT.ID_MULTA,0) AS CIU_SANCIONADO,
    MULT.FEC_INGRESO AS FEC_GENERACION_CUM,
    MULT.ESTADO_MULTA AS COD_ESTADO_MULTA_COBRANZA,
    SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(5, MULT.ESTADO_MULTA) AS NOM_ESTADO_MULTA_COBRANZA,
    ---
    MULT.ANIO_FILE_AEC AS ANIO_FILE,
    ARCO.CODIGO || '-' || MULT.NRO_FILE_AEC AS NRO_FILE,
    EXPE.FEC_INGRESO AS FEC_GENERACION_EXPEDIENTE,
    EXPE.ESTADO_EXPEDIENTE AS COD_ESTADO_EXPEDIENTE_COBRANZA,
    EST_EXP_COB.DESCRIPCION AS NOM_ESTADO_EXPEDIENTE_COBRANZA,
    --
    DOC.ID_EXPEDIENTE_SUSPENDER AS ID_EXPEDIENTE_SUSPENDER,
    DOC.FEC_ATENCION_SUSPENSION AS FEC_ATENCION_SUSPENSION,
    DOC.ID_EXPEDIENTE_FRACCIONAR AS ID_EXPEDIENTE_FRACCIONAR,
    DOC.FEC_ATENCION_FRACCIONAR AS FEC_ATENCION_FRACCIONAR,
    DOC.IND_CARTA_FIANZA AS IND_CARTA_FIANZA,
    TD.TXT_DESCRIPCION AS TIPO_GEN_DOC,
    --@0003:ini
    PLAN.DESCRIPCION AS DES_PLANTILLA,
    USUA.USUARIO AS USU_CREA_DOC,
    --@0003:fin
    --@0004:ini
    (CASE
         WHEN DOC.ESTADO_DOC_UCI = 'T' THEN 'En Transito'
         WHEN DOC.ESTADO_DOC_UCI = 'E' THEN 'Entregado'
         WHEN DOC.ESTADO_DOC_UCI = 'D' THEN 'Devuelto'
         WHEN DOC.ESTADO_DOC_UCI = 'N' THEN 'Notificado'
         WHEN DOC.ESTADO_DOC_UCI = 'Area' THEN 'En UCI'
         ELSE NULL
       END) AS ESTADO_DOC_UCI,
    DOC.FEC_NOTF_UCI AS FEC_NOTF_UCI,
    DOC.HORA_NOTF_UCI AS HORA_NOTF_UCI,
	  DOC.FEC_NOTIFICACION
    --@0004:fin
  FROM (
      SELECT
        'M' AS IND_PROVIENE,
        MDOC.ID_MULTA AS ID_MULTA,
        MDOC.ID_MULTA_DOCUMENTO_GEN AS ID_DOCUMENTO,
        TO_NUMBER(SUBTIPO_DOC.COD_INTERNO) AS COD_TIPO_DOCUMENTO,
        SUBTIPO_DOC.TXT_DESCRIPCION AS NOM_TIPO_DOCUMENTO,
        MDOC.NRO_DOCUMENTO AS NRO_DOCUMENTO,
        NULL AS NRO_RESOLUCION,
        MDOC.FEC_INGRESO AS FEC_GENERACION_DOC,
        0 AS COD_TIPO_EMBARGO,
        NULL AS NOM_TIPO_EMBARGO,
        0 AS ID_EXPEDIENTE_EMBARGO,
        NULL AS ID_EXPEDIENTE_SUSPENDER,
        NULL AS FEC_ATENCION_SUSPENSION,
        NULL AS ID_EXPEDIENTE_FRACCIONAR,
        NULL AS FEC_ATENCION_FRACCIONAR,
        '0' AS IND_CARTA_FIANZA,
        MDOC.TIPO_DOC_ASOC AS TIPO_DOC_ASOC,
        --@0003:ini
        MDOC.ID_PLANTILLA AS ID_PLANTILLA,
        MDOC.ID_USUARIO_INGRESO AS ID_USU_CREA_DOC,
        --@0003:fin

        --@0004:ini
        CAST(NULL AS VARCHAR2(20)) AS ESTADO_DOC_UCI,
        CAST(NULL AS VARCHAR2(10)) AS FEC_NOTF_UCI,
        CAST(NULL AS VARCHAR2(10)) AS HORA_NOTF_UCI,
		    CAST(NULL AS DATE) AS FEC_NOTIFICACION
        --@0004:fin
      FROM T_SCOB_MULTA_DOCUMENTO_GEN MDOC
      INNER JOIN T_SCOB_TIPO_DOCUMENTO TIPO_DOC
            ON TIPO_DOC.ID_TIPO_DOCUMENTO = MDOC.ID_TIPO_DOCUMENTO
      INNER JOIN T_SCOB_TABLA_DET SUBTIPO_DOC
                 ON SUBTIPO_DOC.ID_TABLA = 23
                 AND SUBTIPO_DOC.COD_INTERNO = TIPO_DOC.COD_SUBTIPO_DOCUMENTO
      WHERE MDOC.ESTADO = '1'
      UNION ALL
      SELECT
        'E' AS IND_PROVIENE,
        EXMU.ID_MULTA AS ID_MULTA,
        EXDO.ID_EXPEDIENTE_DOCUMENTO AS ID_DOCUMENTO,
        EXDO.COD_SUBTIPO_DOCUMENTO AS COD_TIPO_DOCUMENTO,
        SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(23, EXDO.COD_SUBTIPO_DOCUMENTO) AS NOM_TIPO_DOCUMENTO,
        DECODE(EXDO.COD_SUBTIPO_DOCUMENTO,1, EXDO.NRO_RESOLUCION, EXDO.NRO_DOCUMENTO) AS NRO_DOCUMENTO,
        DECODE(EXDO.COD_SUBTIPO_DOCUMENTO,1, NULL, EXDO.NRO_RESOLUCION) AS NRO_RESOLUCION,
        EXDO.FEC_INGRESO AS FEC_GENERACION_DOC,
        EXEM.COD_TIPO_EMBARGO AS COD_TIPO_EMBARGO,
        SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(35, EXEM.COD_TIPO_EMBARGO) AS NOM_TIPO_EMBARGO,
        EXEM.ID_EXPEDIENTE_EMBARGO AS ID_EXPEDIENTE_EMBARGO,
        EXSU.ID_EXPED_SUSPENDER AS ID_EXPEDIENTE_SUSPENDER,
        EXSU.FEC_CIERRE_TRAMITE AS FEC_ATENCION_SUSPENSION,
        EXFR.ID_EXPED_FRACCIONAR AS ID_EXPEDIENTE_FRACCIONAR,
        EXFR.FEC_CIERRE_TRAMITE AS FEC_ATENCION_FRACCIONAR,
        DECODE(FIANZA.ID_EXPEDIENTE,NULL,'0','1') AS IND_CARTA_FIANZA,
        EXDO.TIPO_DOC_ASOC AS TIPO_DOC_ASOC,
        --@0003:ini
        EXDO.ID_PLANTILLA AS ID_PLANTILLA,
        EXDO.ID_USUARIO_INGRESO AS ID_USU_CREA_DOC,
        --@0003:fin

        --@0004:ini
        EXDO.VC_ESTADO_DOC_UCI AS ESTADO_DOC_UCI,
        EXDO.VC_FEC_NOTF_UCI AS FEC_NOTF_UCI,
        EXDO.VC_HORA_NOTF_UCI AS HORA_NOTF_UCI,
		    EXDO.FEC_NOTIFICACION
        --@0004:fin
      FROM T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
      INNER JOIN T_SCOB_EXPEDIENTE EXPE
            ON EXPE.ID_EXPEDIENTE = EXDO.ID_EXPEDIENTE
            AND EXPE.ESTADO = '1'
      INNER JOIN T_SCOB_EXPEDIENTE_MULTA EXMU
            ON EXMU.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
            AND EXMU.ESTADO = '1'
      LEFT JOIN T_SCOB_EXPED_EMBARGO_DOC EEDO
           ON  EEDO.ID_EXPEDIENTE_DOCUMENTO = EXDO.ID_EXPEDIENTE_DOCUMENTO
           AND EEDO.ESTADO = '1'
      LEFT JOIN T_SCOB_EXPED_EMBARGO EXEM
           ON EXEM.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
           AND EXEM.ID_EXPEDIENTE_EMBARGO = EEDO.ID_EXPEDIENTE_EMBARGO
           AND EXEM.ESTADO = '1'
      LEFT JOIN T_SCOB_EXPED_SUSPENDER_DOC EDSU
           ON EDSU.ID_EXPEDIENTE_DOCUMENTO = EXDO.ID_EXPEDIENTE_DOCUMENTO
           AND EDSU.ESTADO = '1'
      LEFT JOIN T_SCOB_EXPED_SUSPENDER EXSU
           ON EXSU.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
           AND EXSU.ID_EXPED_SUSPENDER = EDSU.ID_EXPED_SUSPENDER
           AND EXSU.ESTADO = '1'
           AND EXSU.ESTADO_SOLICITUD <> '1' --A PENDIENTE
      LEFT JOIN T_SCOB_EXPED_FRACCIONAR_DOC EFDO
           ON EFDO.ID_EXPEDIENTE_DOCUMENTO = EXDO.ID_EXPEDIENTE_DOCUMENTO
           AND EFDO.ESTADO = '1'
      LEFT JOIN T_SCOB_EXPED_FRACCIONAR EXFR
           ON EXFR.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
           AND EXFR.ID_EXPED_FRACCIONAR = EFDO.ID_EXPED_FRACCIONAR
           AND EXFR.ESTADO = '1'
           AND EXFR.ESTADO_SOLICITUD <> '1' --A PENDIENTE
      LEFT JOIN (

           SELECT FIANZA.ID_EXPEDIENTE AS ID_EXPEDIENTE,
                  COUNT(FIANZA.ID_EXPEDIENTE_GARANTIA) AS NRO_FIANZAS
           FROM T_SCOB_EXPEDIENTE_GARANTIA FIANZA
           WHERE FIANZA.ESTADO = '1'
           AND TO_DATE(TO_CHAR(FIANZA.FEC_VENCIMIENTO,'DD/MM/YYYY'),'DD/MM/YYYY') >
               TO_DATE(TO_CHAR(SYSDATE,'DD/MM/YYYY'),'DD/MM/YYYY')

           GROUP BY FIANZA.ID_EXPEDIENTE

      )FIANZA ON FIANZA.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE

      WHERE EXDO.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
      AND EXDO.ESTADO = '1'
  ) DOC

  INNER JOIN T_SCOB_MULTA MULT
       ON MULT.ID_MULTA = DOC.ID_MULTA
       AND MULT.ESTADO = '1'

  LEFT JOIN T_SCOB_EXPEDIENTE_MULTA EXMU
       ON EXMU.ID_MULTA = MULT.ID_MULTA
       AND EXMU.ESTADO = '1'

  LEFT JOIN T_SCOB_EXPEDIENTE EXPE
       ON EXPE.ID_EXPEDIENTE = EXMU.ID_EXPEDIENTE
       AND EXPE.ESTADO = '1'

  LEFT JOIN T_SCOB_AREA_COBRANZA ARCO
       ON ARCO.ID_AREA_COBRANZA = MULT.ID_AREA_COBRANZA

  LEFT JOIN T_SCOB_EST_EXP_COB EST_EXP_COB
       ON EXPE.ESTADO_EXPEDIENTE = EST_EXP_COB.ID_EST_EXP_COB

  INNER JOIN (
       SELECT MDET.ID_MULTA AS ID_MULTA,
              MSAN.ID_PERSONA AS ID_PERSONA
       FROM T_SCOB_MULTA_DETAL MDET
       INNER JOIN T_SCOB_MULTA_SANCIONADO MSAN
             ON MSAN.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL
             AND NVL(MSAN.COD_TIPO_PERSONA,'1')='1'
             AND MSAN.ESTADO = '1'
       INNER JOIN T_SCOB_PERSONA PERS
             ON PERS.ID_PERSONA = MSAN.ID_PERSONA
       WHERE MDET.FLG_ACTUAL = '1'
       AND MDET.ESTADO = '1'
       --codigo indecopi
       AND (NVL(PI_V_COD_INDECOPI_INI,' ')=' ' OR (NVL(PI_V_COD_INDECOPI_INI,' ')=' ' AND
                                             PERS.COD_SANCIONADO BETWEEN PI_V_COD_INDECOPI_INI
                                             AND PI_V_COD_INDECOPI_FIN ))
       --tipo persona
       AND (NVL(PI_I_TIP_PERSONA,0)=0 OR (NVL(PI_I_TIP_PERSONA,0)<>0 AND PERS.TIPO_PERSONA=PI_I_TIP_PERSONA))
       --razon social
       AND (NVL(PI_V_RAZON_SOCIAL,' ')=' ' OR (NVL(PI_V_RAZON_SOCIAL,' ')<>' ' AND fun_scob_nosensite(PERS.RAZON_SOCIAL) LIKE fun_scob_nosensite(PI_V_RAZON_SOCIAL)))
       --apellido paterno
       AND (NVL(PI_V_APE_PATERNO,' ')=' ' OR (NVL(PI_V_APE_PATERNO,' ')<>' ' AND fun_scob_nosensite(PERS.APE_PATERNO) LIKE fun_scob_nosensite(PI_V_APE_PATERNO)))
       --apellido materno
       AND (NVL(PI_V_APE_MATERNO,' ')=' ' OR (NVL(PI_V_APE_MATERNO,' ')<>' ' AND fun_scob_nosensite(PERS.APE_MATERNO) LIKE fun_scob_nosensite(PI_V_APE_MATERNO)))
       --apellido casada
       AND (NVL(PI_V_APE_CASADA,' ')=' ' OR (NVL(PI_V_APE_CASADA,' ')<>' ' AND fun_scob_nosensite(PERS.APE_CASADA) LIKE fun_scob_nosensite(PI_V_APE_CASADA)))
       --apellido nombres
       AND (NVL(PI_V_NOMBRES,' ')=' ' OR (NVL(PI_V_NOMBRES,' ')<>' ' AND fun_scob_nosensite(PERS.PRI_NOMBRE || ' ' || PERS.SEG_NOMBRE) LIKE fun_scob_nosensite(PI_V_NOMBRES)))
       --tipo documento
       AND (NVL(PI_I_TIPO_DOC,0)=0 OR (NVL(PI_I_TIPO_DOC,0)<>0 AND PERS.TIPO_DOC=PI_I_TIPO_DOC))
       --numero de documento
       AND (NVL(PI_V_NRO_DOC,' ')=' ' OR (NVL(PI_V_NRO_DOC,' ')<>' ' AND PERS.NRO_DOC=PI_V_NRO_DOC))
       --numero ruc
       AND (NVL(PI_V_NRO_RUC,' ')=' ' OR (NVL(PI_V_NRO_RUC,' ')<>' ' AND PERS.NRO_RUC=PI_V_NRO_RUC))
       --sector economico
       AND (NVL(PI_N_ID_SECT_ECONO,0)=0 OR (NVL(PI_N_ID_SECT_ECONO,0)<>0 AND PERS.ID_SECTOR_ECONOMICO=PI_N_ID_SECT_ECONO))
       --indicador ASOCU
       AND (NVL(PI_V_IND_ASOC_CONS,'0')='0' OR (NVL(PI_V_IND_ASOC_CONS,'0')<>'0' AND PERS.FLG_ASOCU='1'))

  ) PERS ON PERS.ID_MULTA = MULT.ID_MULTA

  INNER JOIN T_SCOB_TABLA_DET TD
        ON TD.ID_TABLA = 60
        AND TO_NUMBER(TD.COD_INTERNO) = DOC.TIPO_DOC_ASOC
  --@0003:ini
  LEFT JOIN T_SCOB_PLANTILLA PLAN
        ON PLAN.ID_PLANTILLA = DOC.ID_PLANTILLA
  LEFT JOIN T_SCOB_USUARIO USUA
        ON USUA.ID_USUARIO = DOC.ID_USU_CREA_DOC
  --@0003:fin
  WHERE
  --AÑO CUM
  (NVL(PI_V_ANIO_CUM,' ')=' ' OR (NVL(PI_V_ANIO_CUM,' ')<>' ' AND MULT.ANIO=PI_V_ANIO_CUM))

  --NRO CUM
  AND (NVL(PI_V_CUM_INI,' ')=' ' OR (NVL(PI_V_CUM_INI,' ')<>' ' AND MULT.CUM BETWEEN PI_V_CUM_INI AND PI_V_CUM_FIN))

  --FECHA GENERACION CUM
  AND (NVL(PI_V_FEC_GEN_CUM_INI,' ')=' ' OR (NVL(PI_V_FEC_GEN_CUM_INI,' ')<>' '
                                  AND TO_DATE(TO_CHAR(EXPE.FEC_INGRESO,'DD/MM/YYYY'),'DD/MM/YYYY')
                                  BETWEEN TO_DATE(PI_V_FEC_GEN_CUM_INI,'DD/MM/YYYY') AND TO_DATE(PI_V_FEC_GEN_CUM_FIN,'DD/MM/YYYY')
                           ))
  --AÑO FILE
  AND (NVL(PI_V_ANIO_FILE,' ')=' ' OR (NVL(PI_V_ANIO_FILE,' ')<>' ' AND MULT.ANIO_FILE_AEC=PI_V_ANIO_FILE))

  --NRO FILE
  AND (NVL(PI_V_NRO_FILE_INI,' ')=' ' OR (NVL(PI_V_NRO_FILE_INI,' ')<>' ' AND ARCO.CODIGO || '-' || MULT.NRO_FILE_AEC BETWEEN PI_V_NRO_FILE_INI AND PI_V_NRO_FILE_FIN))

  --ESTADO MULTA COBRANZA
  AND (NVL(PI_V_EST_MULTA_COBRAN,' ')=' ' OR (NVL(PI_V_EST_MULTA_COBRAN,' ')<>' ' AND INSTR(PI_V_EST_MULTA_COBRAN,'|' || TO_CHAR(MULT.ESTADO_MULTA) || '|' )>0))

  --AÑO EXPEDIENTE COBRANZA
  AND (NVL(PI_V_ANIO_EXP,' ')=' ' OR (NVL(PI_V_ANIO_EXP,' ')<>' ' AND EXPE.ANIO=PI_V_ANIO_EXP))

  --NRO EXPEDIENTE COBRANZA
  AND (NVL(PI_V_NRO_EXP_COB_INI,' ')=' ' OR (NVL(PI_V_NRO_EXP_COB_INI,' ')<>' ' AND EXPE.NRO_EXPEDIENTE BETWEEN PI_V_NRO_EXP_COB_INI AND PI_V_NRO_EXP_COB_FIN))

  --FECHA DE GENERACION DE EXPEDIENTE COBRANZA
  AND (NVL(PI_V_FECGENEXPCOB_INI,' ')=' ' OR (NVL(PI_V_FECGENEXPCOB_INI,' ')<>' '
                                  AND TO_DATE(TO_CHAR(EXPE.FEC_INGRESO,'DD/MM/YYYY'),'DD/MM/YYYY')
                                  BETWEEN TO_DATE(PI_V_FECGENEXPCOB_INI,'DD/MM/YYYY') AND TO_DATE(PI_V_FECGENEXPCOB_FIN,'DD/MM/YYYY')
                           ))
  --ESTADO EXPEDIENTE COBRANZA
  AND (NVL(PI_V_EST_EXPE,' ')=' ' OR (NVL(PI_V_EST_EXPE,' ')<>' ' AND INSTR(PI_V_EST_EXPE,'|' || TO_CHAR(EXPE.ESTADO_EXPEDIENTE) || '|' )>0))

  --TIPO DE DOCUMENTO
  AND (NVL(PI_V_TIP_DOC,' ')=' ' OR (NVL(PI_V_TIP_DOC,' ')<>' ' AND INSTR(PI_V_TIP_DOC,'|' || TO_CHAR(DOC.COD_TIPO_DOCUMENTO) || '|' )>0))

  --NRO DE DOCUMENTO
  AND (NVL(PI_NRO_DOC_INI,' ')=' ' OR (NVL(PI_NRO_DOC_INI,' ')<>' '
                                  AND DOC.NRO_DOCUMENTO
                                  BETWEEN PI_NRO_DOC_INI AND PI_NRO_DOC_FIN
                           ))

  --FECHA GENERACION DE DOCUMENTO
  AND (NVL(PI_V_FEC_GEN_DOCEXPE_INI,' ')=' ' OR (NVL(PI_V_FEC_GEN_DOCEXPE_INI,' ')<>' '
                                  AND TO_DATE(TO_CHAR(DOC.FEC_GENERACION_DOC,'DD/MM/YYYY'),'DD/MM/YYYY')
                                  BETWEEN TO_DATE(PI_V_FEC_GEN_DOCEXPE_INI,'DD/MM/YYYY') AND TO_DATE(PI_V_FEC_GEN_DOCEXPE_FIN,'DD/MM/YYYY')
                           ))

  --FECHA DE NOTIFICACION : PRUEBAS
  AND (NVL(PI_V_FEC_NOTIF_INI,' ')=' '
    OR (NVL(PI_V_FEC_NOTIF_INI,' ')<>' '
    AND (
      TO_DATE(TO_CHAR(DOC.FEC_NOTIFICACION,'DD/MM/YYYY'),'DD/MM/YYYY')
      BETWEEN TO_DATE(PI_V_FEC_NOTIF_INI,'DD/MM/YYYY') AND TO_DATE(PI_V_FEC_NOTIF_FIN,'DD/MM/YYYY')
      OR
      TO_DATE(TO_CHAR(DOC.FEC_NOTF_UCI,'DD/MM/YYYY'),'DD/MM/YYYY')
      BETWEEN TO_DATE(PI_V_FEC_NOTIF_INI,'DD/MM/YYYY') AND TO_DATE(PI_V_FEC_NOTIF_FIN,'DD/MM/YYYY')
    )
    )
  )

  --GESTOR DE COBRANZA
  AND (NVL(PI_V_GES_COBRANZA,' ')=' ' OR (NVL(PI_V_GES_COBRANZA,' ')<>' ' AND INSTR(PI_V_GES_COBRANZA,'|' || TO_CHAR(MULT.ID_USUARIO_ASIG_COBRANZA) || '|' )>0))

  --FECHA DE SOLICITUD DE SUSPENSION ATENDIDAS
  AND (NVL(PI_V_FEC_EXPENSUS_INI,' ')=' ' OR (NVL(PI_V_FEC_EXPENSUS_INI,' ')<>' ' AND DOC.ID_EXPEDIENTE_SUSPENDER IS NOT NULL --SOLO LAS SOLICITUDES DE SUSPENSION ATENDIDAS
                                  AND TO_DATE(TO_CHAR(DOC.FEC_ATENCION_SUSPENSION,'DD/MM/YYYY'),'DD/MM/YYYY')
                                  BETWEEN TO_DATE(PI_V_FEC_EXPENSUS_INI,'DD/MM/YYYY') AND TO_DATE(PI_V_FEC_EXPENSUS_FIN,'DD/MM/YYYY')
                           ))
  --FECHA DE SOLICITUD DE FRACCIONAMIENTO ATENDIDAS
  AND (NVL(PI_V_FEC_EXPENFRA_INI,' ')=' ' OR (NVL(PI_V_FEC_EXPENFRA_INI,' ')<>' ' AND DOC.ID_EXPEDIENTE_FRACCIONAR IS NOT NULL --SOLO LAS SOLICITUDES DE SUSPENSION ATENDIDAS
                                  AND TO_DATE(TO_CHAR(DOC.FEC_ATENCION_FRACCIONAR,'DD/MM/YYYY'),'DD/MM/YYYY')
                                  BETWEEN TO_DATE(PI_V_FEC_EXPENFRA_INI,'DD/MM/YYYY') AND TO_DATE(PI_V_FEC_EXPENFRA_FIN,'DD/MM/YYYY')
                           ))

  --TIPO DE EMBARGO
  AND (NVL(PI_V_TIP_EMBARGO,' ')=' ' OR (NVL(PI_V_TIP_EMBARGO,' ')<>' ' AND INSTR(PI_V_TIP_EMBARGO,'|' || TO_CHAR(DOC.COD_TIPO_EMBARGO) || '|' )>0))

  --FECHA RESOLUCION
  AND (NVL(PI_V_FEC_RESOL_EMB_INI,' ')=' ' OR (NVL(PI_V_FEC_RESOL_EMB_INI,' ')<>' ' AND DOC.NRO_RESOLUCION IS NOT NULL --SOLO LOS DOCUMENTOS DE RESOLUCION
                                  AND TO_DATE(TO_CHAR(DOC.FEC_GENERACION_DOC,'DD/MM/YYYY'),'DD/MM/YYYY')
                                  BETWEEN TO_DATE(PI_V_FEC_RESOL_EMB_INI,'DD/MM/YYYY') AND TO_DATE(PI_V_FEC_RESOL_EMB_FIN,'DD/MM/YYYY')
                           ))

  --INDICADOR DE EXPEDIENTES CON CARTA FIANZA
  AND (NVL(PI_V_IND_EXP_CART_FIAN,'0')='0' OR (NVL(PI_V_IND_EXP_CART_FIAN,'0')<>'0' AND DOC.IND_CARTA_FIANZA=PI_V_IND_EXP_CART_FIAN))
  ORDER BY DOC.ID_MULTA, DOC.ID_DOCUMENTO;*/

END;

procedure scob_sp_s_multa_basica(
-----------------------------------------------------------------------------------------------
/*001*/  pi_v_fec_gen_cum_ini                   in varchar2      --FECHA GENERACION CUM INI
/*002*/  ,pi_v_fec_gen_cum_fin                   in varchar2      --FECHA GENERACION CUM FIN
/*003*/  ,pi_v_cum_ini                           in varchar2      --cum
/*004*/  ,pi_v_cum_fin                           in varchar2      --cum
/*005*/  ,pi_v_nro_exp_unico_ini                 in varchar2      --nro. expediente administrativo
/*006*/  ,pi_v_nro_exp_unico_fin                 in varchar2      --nro. expediente administrativo
/*007*/  ,pi_v_nro_resol_OR_ini                  in varchar2      --nro. resolucion or ini
/*008*/  ,pi_v_nro_resol_OR_fin                  in varchar2      --nro. resolucion or fin
/*009*/  ,pi_v_nro_resol_CO_ini                  in varchar2      --nro. resolucion comision ini
/*010*/  ,pi_v_nro_resol_CO_fin                  in varchar2      --nro. resolucion comision fin
/*011*/  ,pi_v_nro_resol_SA_ini                  in varchar2      --nro. resolucion sala ini
/*012*/  ,pi_v_nro_resol_SA_fin                  in varchar2      --nro. resolucion sala fin
/*013*/  ,pi_v_fec_reso_OR_ini                   in varchar2      --FECHA RESOLUCION OR INI
/*014*/  ,pi_v_fec_reso_OR_fin                   in varchar2      --FECHA RESOLUCION OR FIN
/*015*/  ,pi_v_fec_reso_CO_ini                   in varchar2      --FECHA RESOLUCION OR INI
/*016*/  ,pi_v_fec_reso_CO_fin                   in varchar2      --FECHA RESOLUCION OR FIN
/*017*/  ,pi_v_fec_reso_SA_ini                   in varchar2      --FECHA RESOLUCION OR INI
/*018*/  ,pi_v_fec_reso_SA_fin                   in varchar2      --FECHA RESOLUCION OR FIN
/*019*/  ,pi_v_id_sede                           in varchar2      --cadena id sede
/*020*/  ,pi_v_cod_estado_multa_or               in varchar2      --cadena estado de la multa resolutivo
/*021*/  ,pi_v_id_materia                        in varchar2      --cadena materia
/*022*/  ,pi_v_id_org_resol                      in varchar2      --cadena organo resolutivo
/*023*/  ,pi_n_valor_uit_ini                     in number        --nro uit ini
/*024*/  ,pi_n_valor_uit_fin                     in number        --nro uit fin
/*025*/  ,pi_v_cod_estado_pago                   in varchar2      --cadena estado pago de la multa
/*026*/  ,pi_c_flg_asocu_multa                   in char          --flag asocu
-----------------------------------------------------------------------------------------------
        --denunciante
/*027*/  ,pi_v_d_codSanciona_ini                 in varchar2      --Código del INDECOPI
/*028*/  ,pi_v_d_codSanciona_fin                 in varchar2      --Código del INDECOPI
/*029*/  ,pi_v_d_id_tip_persona                  in varchar2      --Tipo de Personería
/*030*/  ,pi_v_d_razon_social                    in varchar2      --Razón Social
/*031*/  ,pi_v_d_ape_paterno                     in varchar2      --Apellido Paterno
/*032*/  ,pi_v_d_ape_materno                     in varchar2      --Apellido Materno
/*033*/  ,pi_v_d_ape_casada                      in varchar2      --Apellido Casada
/*034*/  ,pi_v_d_pri_nombre                      in varchar2      --Primer nombre
/*035*/  ,pi_v_d_seg_nombre                      in varchar2      --Segundo nombre
/*036*/  ,pi_i_d_tipo_doc                        in integer       --Tipo de Documento
/*037*/  ,pi_v_d_nro_doc                         in varchar2      --Nº de documento de identidad
/*038*/  ,pi_c_d_flg_asocu                       in char          --flag asocu
        --denunciado
/*039*/  ,pi_v_do_codSanciona_ini                in varchar2      --Código del INDECOPI
/*040*/  ,pi_v_do_codSanciona_fin                in varchar2      --Código del INDECOPI
/*041*/  ,pi_v_do_id_tip_persona                 in varchar2      --Tipo de Personería
/*042*/  ,pi_v_do_razon_social                   in varchar2      --Razón Social
/*043*/  ,pi_v_do_ape_paterno                    in varchar2      --Apellido Paterno
/*044*/  ,pi_v_do_ape_materno                    in varchar2      --Apellido Materno
/*045*/  ,pi_v_do_ape_casada                     in varchar2      --Apellido Casada
/*046*/  ,pi_v_do_pri_nombre                     in varchar2      --Primer nombre
/*047*/  ,pi_v_do_seg_nombre                     in varchar2      --Segundo nombre
/*048*/  ,pi_i_do_tipo_doc                       in integer       --Tipo de Documento
/*049*/  ,pi_v_do_nro_doc                        in varchar2      --Nº de documento de identidad
/*050*/  ,pi_c_do_flg_asocu                      in char          --flag asocu
         --sancionado
/*051*/  ,pi_v_s_codSanciona_ini                 in varchar2      --Código del INDECOPI
/*052*/  ,pi_v_s_codSanciona_fin                 in varchar2      --Código del INDECOPI
/*053*/  ,pi_v_s_id_tip_persona                  in varchar2      --Tipo de Personería
/*054*/  ,pi_v_s_razon_social                    in varchar2      --Razón Social
/*055*/  ,pi_v_s_ape_paterno                     in varchar2      --Apellido Paterno
/*056*/  ,pi_v_s_ape_materno                     in varchar2      --Apellido Materno
/*057*/  ,pi_v_s_ape_casada                      in varchar2      --Apellido Casada
/*058*/  ,pi_v_s_pri_nombre                      in varchar2      --Primer nombre
/*059*/  ,pi_v_s_seg_nombre                      in varchar2      --Segundo nombre
/*060*/  ,pi_i_s_tipo_doc                        in integer       --Tipo de Documento
/*061*/  ,pi_v_s_nro_doc                         in varchar2      --Nº de documento de identidad
/*062*/  ,pi_c_s_flg_asocu                       in char           --flag asocu
--@0002:ini
/*063*/  ,pi_c_s_flg_buscar_by_contenido         in char           --0=NO; 1=SI.
--@0002:fin

-----------------------------------------------------------------------------------------------
         ,po_cu_retorno                          out cu_rec_set
)is
  c_flg_administrado                           char(1);
  c_flg_sancionado                             char(1);
  c_flg_denunciado                             char(1);
  c_flg_denunciante                            char(1);

  v_sql_admin_select                           varchar2(8000);
  v_sql_admin_where_d                          varchar2(8000);
  v_sql_admin_where_do                         varchar2(8000);
  v_sql_admin_where_s                          varchar2(8000);

  v_sql_select_1                               varchar2(8000);
  v_sql_select_2                               varchar2(8000);
  v_sql_select_3                               varchar2(8000);
  v_sql_join_1                                 varchar2(8000);
  v_sql_join_2                                 varchar2(8000);
  v_sql_where_1                                varchar2(8000);
  v_sql_where_2                                varchar2(8000);
  v_sql_where_3                                varchar2(8000);
  v_sql_where_4                                varchar2(8000);
  v_sql_where_5                                varchar2(8000);
  c_car_porcentaje                             varchar(1);
begin
  --@0002:ini
  c_car_porcentaje := '';
  if pi_c_s_flg_buscar_by_contenido = '1' then c_car_porcentaje := '%'; end if;
  --@0002:fin

  --control del filtro sancionado
  c_flg_administrado := '0';
  c_flg_sancionado := '0';
  c_flg_denunciado := '0';
  c_flg_denunciante := '0';

  v_sql_where_1 := '';
  v_sql_where_2 := '';
  v_sql_where_3 := '';
  v_sql_where_4 := '';
  v_sql_where_5 := '';

  IF  pi_v_s_codSanciona_ini is not null or
      pi_v_s_codSanciona_fin is not null or
      pi_v_s_id_tip_persona is not null or
      pi_v_s_razon_social is not null or
      pi_v_s_ape_paterno is not null or
      pi_v_s_ape_materno is not null or
      pi_v_s_ape_casada is not null or
      pi_v_s_pri_nombre is not null or
      pi_v_s_seg_nombre is not null or
      pi_i_s_tipo_doc <> 0 or
      pi_v_s_nro_doc is not null or
      --pi_i_s_tip_empresa <> 0 or
      --pi_n_s_id_sect_econo <> 0 or
      pi_c_s_flg_asocu<>'0'
  THEN
      c_flg_sancionado := '1';
      if c_flg_administrado = '0' then c_flg_administrado := '1'; end if;
  END IF;

  IF (
      pi_v_do_codSanciona_ini is not null or
      pi_v_do_codSanciona_fin is not null or
      pi_v_do_id_tip_persona is not null or
      pi_v_do_razon_social is not null or
      pi_v_do_ape_paterno is not null or
      pi_v_do_ape_materno is not null or
      pi_v_do_ape_casada is not null or
      pi_v_do_pri_nombre is not null or
      pi_v_do_seg_nombre is not null or
      pi_i_do_tipo_doc <> 0 or
      pi_v_do_nro_doc is not null or
      --pi_i_do_tip_empresa <> 0 or
      --pi_n_do_id_sect_econo <> 0 or
      pi_c_do_flg_asocu<>'0'
      )
  THEN
      c_flg_denunciado := '1';
      if c_flg_administrado = '0' then c_flg_administrado := '1'; end if;
  END IF;

  IF  (
      pi_v_d_codSanciona_ini is not null or
      pi_v_d_codSanciona_fin is not null or
      pi_v_d_id_tip_persona is not null or
      pi_v_d_razon_social is not null or
      pi_v_d_ape_paterno is not null or
      pi_v_d_ape_materno is not null or
      pi_v_d_ape_casada is not null or
      pi_v_d_pri_nombre is not null or
      pi_v_d_seg_nombre is not null or
      pi_i_d_tipo_doc <> 0 or
      pi_v_d_nro_doc is not null or
      --pi_i_d_tip_empresa <> 0 or
      --pi_n_d_id_sect_econo <> 0 or
      pi_c_d_flg_asocu<>'0'
      )
  THEN
      c_flg_denunciante := '1';
      if c_flg_administrado = '0' then c_flg_administrado := '1'; end if;
  END IF;

  --obtener los datos de las intancias de una multa
  EXECUTE IMMEDIATE 'TRUNCATE TABLE T_SCOB_TMP_INSTANCIAS_MULTA';
  INSERT INTO T_SCOB_TMP_INSTANCIAS_MULTA(
      ID_MULTA,
      NRO_NIVEL,
      NRO_RESOLUCION,
      FEC_RESOLUCION,
      FEC_NOTIFICACION_RESOLUCION,
      FEC_ESTADO_SGTE_INSTANCIA,
      FEC_REGISTRO,
      LOGIN_USUARIO_REGISTRO
  )(
        SELECT
          MDET.ID_MULTA,
          ORGR.TIPO_INSTANCIA,
          --Req. 30 - @dcelis/begin
          --MDET.NRO_RESOLUCION_ID,
          MDET.NRO_RESOLUCION,
          --Req. 30 - @dcelis/end
          MDET.FEC_RESOLUCION,
          MDET.FEC_NOTIFICACION_RESOLUCION,
          MDET.FEC_ESTADO_SGTE_INSTANCIA,
          TO_DATE(TO_CHAR(MDET.AUDFECCREACION,'DD/MM/YYYY'),'DD/MM/YYYY'),
          MDET.AUDUSUCREACION
        FROM T_SCOB_MULTA_DETAL MDET
        INNER JOIN T_SCOB_ORGANO_RESOLUTIVO ORGR
              ON ORGR.ID_ORGANO_RESOLUTIVO = MDET.ID_ORGANO_RESOLUTIVO
        WHERE MDET.ESTADO = '1'
  );

  -----------------------------------------------------------------------------------
  --obtener los administrados
  -----------------------------------------------------------------------------------
  --3=DENUNCIANTE
  -----------------------------------------------------------------------------------
  /*
  Dbms_Output.put_line('c_flg_administrado--->' || c_flg_administrado);
  Dbms_Output.put_line('c_flg_denunciante--->' || c_flg_denunciante);
  Dbms_Output.put_line('c_flg_sancionado--->' || c_flg_sancionado);
  Dbms_Output.put_line('c_flg_denunciado--->' || c_flg_denunciado);
  */

  EXECUTE IMMEDIATE 'TRUNCATE TABLE T_SCOB_TMP_ADMINISTRADO';
  --obtener a todos los administrados
  if c_flg_administrado = '1' then

      v_sql_admin_select := '
      INSERT INTO T_SCOB_TMP_ADMINISTRADO(
          ID_MULTA, TIPO_ADMINISTRADO, ID_PERSONA
      )
      SELECT
          ADMINISTRADO.ID_MULTA,ADMINISTRADO.TIPO_ADMINISTRADO,PERS.ID_PERSONA
      FROM (
          SELECT MDET.ID_MULTA AS ID_MULTA, ''3'' AS TIPO_ADMINISTRADO, --DENUNCIANTE
                 MDEN.ID_PERSONA  AS ID_PERSONA
          FROM T_SCOB_MULTA_DETAL MDET
          INNER JOIN T_SCOB_MULTA_DENUNCIANTE MDEN
                ON MDEN.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL
                AND MDEN.ESTADO = ''1''
          WHERE MDET.FLG_ACTUAL = ''1'' AND MDET.ESTADO = ''1''
          UNION ALL
          SELECT MDET.ID_MULTA AS ID_MULTA, MSAN.COD_TIPO_PERSONA AS TIPO_ADMINISTRADO, --SANCIONADO Y DENUNCIADO
                 MSAN.ID_PERSONA AS ID_PERSONA
          FROM T_SCOB_MULTA_DETAL MDET
          INNER JOIN T_SCOB_MULTA_SANCIONADO MSAN
                ON MSAN.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL
                AND MSAN.ESTADO = ''1''
          WHERE MDET.FLG_ACTUAL = ''1'' AND MDET.ESTADO = ''1''
      )ADMINISTRADO
      INNER JOIN T_SCOB_PERSONA PERS ON PERS.ID_PERSONA = ADMINISTRADO.ID_PERSONA
      ';

      v_sql_admin_where_d := '
      WHERE ADMINISTRADO.ID_MULTA IS NOT NULL ';

      IF c_flg_denunciante = '1' THEN

      v_sql_admin_where_d := v_sql_admin_where_d ||
      '
      AND (ADMINISTRADO.TIPO_ADMINISTRADO = ''3'' --denunciante
      ';

          --CODIGO INDECOPI
          if pi_v_d_codSanciona_ini is not null then
             v_sql_admin_where_d := v_sql_admin_where_d ||
             '
             AND TO_NUMBER(PERS.COD_SANCIONADO) BETWEEN TO_NUMBER('||pi_v_d_codSanciona_ini||') AND TO_NUMBER('||pi_v_d_codSanciona_fin||')'
             ;

          end if;

          --TIPO PERSONERIA
          if pi_v_d_id_tip_persona is not null then
             v_sql_admin_where_d := v_sql_admin_where_d ||
             --AND INSTR('''||pi_v_d_id_tip_persona||''',''|'' || TO_CHAR(PERS.TIPO_PERSONA) || ''|'' )>0';
             '
             AND PERS.TIPO_PERSONA = ' || pi_v_d_id_tip_persona;
          end if;

          --TIPO DOCUMENTO
          if pi_i_d_tipo_doc<>0 then
             v_sql_admin_where_d := v_sql_admin_where_d ||
             '
             AND PERS.TIPO_DOC='||pi_i_d_tipo_doc
             ;
          end if;

          --NRO DOCUMENTO
          if pi_v_d_nro_doc is not null then
             v_sql_admin_where_d := v_sql_admin_where_d ||
             '
             AND PERS.NRO_DOC='''||pi_v_d_nro_doc||''''
             ;
          end if;

          --APELLIDOS Y NOMBRES
          if pi_v_d_ape_paterno is not null then
             v_sql_admin_where_d := v_sql_admin_where_d ||
             '
             AND PERS.APE_PATERNO LIKE '''||c_car_porcentaje||pi_v_d_ape_paterno||'%'''

             ;
          end if;

          if pi_v_d_ape_materno is not null then
             v_sql_admin_where_d := v_sql_admin_where_d ||
             '
             AND PERS.APE_MATERNO LIKE '''||c_car_porcentaje||pi_v_d_ape_materno||'%'''
             ;
          end if;

          if pi_v_d_ape_casada is not null then
             v_sql_admin_where_d := v_sql_admin_where_d ||
             '
             AND PERS.APE_CASADA LIKE '''||c_car_porcentaje||pi_v_d_ape_casada||'%'''
             ;
          end if;

          if pi_v_d_pri_nombre is not null then
             v_sql_admin_where_d := v_sql_admin_where_d ||
             '
             AND PERS.PRI_NOMBRE LIKE '''||c_car_porcentaje||pi_v_d_pri_nombre||'%'''
             ;
          end if;

          if pi_v_d_seg_nombre is not null then
             v_sql_admin_where_d := v_sql_admin_where_d ||
             '
             AND PERS.SEG_NOMBRE LIKE '''||c_car_porcentaje||pi_v_d_seg_nombre||'%'''
             ;
          end if;

          --DENOMINACION O RAZON SOCIAL
          if pi_v_d_razon_social is not null then
             v_sql_admin_where_d := v_sql_admin_where_d ||
             '
             AND PERS.RAZON_SOCIAL LIKE '''||c_car_porcentaje||pi_v_d_razon_social ||'%'''
             ;
          end if;
          /*
          --TIPO DE EMPRESA
          if pi_i_d_tip_empresa<>0 then
             v_sql_admin_where_d := v_sql_admin_where_d ||
             '
             AND PERS.TIP_EMPRESA=' ||pi_i_d_tip_empresa
             ;
          end if;

          --SECTOR ECONOMICO
          if pi_n_d_id_sect_econo<>0 then
             v_sql_admin_where_d := v_sql_admin_where_d ||
             '
             AND PERS.ID_SECTOR_ECONOMICO='||pi_n_d_id_sect_econo
             ;
          end if;
          */
          if pi_c_d_flg_asocu='1' then
             v_sql_admin_where_d := v_sql_admin_where_d ||
             '
             AND PERS.FLG_ASOCU='''||pi_c_d_flg_asocu||''''
             ;
          end if;

      v_sql_admin_where_d := v_sql_admin_where_d || '
      )';

      END IF;

      IF c_flg_denunciado = '1' THEN
          if  c_flg_denunciante = '1' then
              v_sql_admin_where_do :=
              '
              OR(ADMINISTRADO.TIPO_ADMINISTRADO = ''2'' --denunciado';
          else
              v_sql_admin_where_do :=
              '
              AND(ADMINISTRADO.TIPO_ADMINISTRADO = ''2'' --denunciado';
          end if;

          --CODIGO INDECOPI
          if pi_v_d_codSanciona_ini is not null then
             v_sql_admin_where_do := v_sql_admin_where_do ||
             '
             AND TO_NUMBER(PERS.COD_SANCIONADO) BETWEEN TO_NUMBER('||pi_v_do_codSanciona_ini||') AND TO_NUMBER('||pi_v_do_codSanciona_fin||')'
             ;
          end if;

          --TIPO PERSONERIA
          if pi_v_do_id_tip_persona is not null then
             v_sql_admin_where_do := v_sql_admin_where_do ||
             --AND INSTR('''||pi_v_do_id_tip_persona||''',''|'' || TO_CHAR(PERS.TIPO_PERSONA) || ''|'' )>0';
             '
             AND PERS.TIPO_PERSONA = ' || pi_v_do_id_tip_persona;
          end if;

          --TIPO DOCUMENTO
          if pi_i_do_tipo_doc<>0 then
             v_sql_admin_where_do := v_sql_admin_where_do ||
             '
             AND PERS.TIPO_DOC='||pi_i_do_tipo_doc
             ;
          end if;

          --NRO DOCUMENTO
          if pi_v_do_nro_doc is not null then
             v_sql_admin_where_do := v_sql_admin_where_do ||
             '
             AND PERS.NRO_DOC='''||pi_v_do_nro_doc||''''
             ;
          end if;

          --APELLIDOS Y NOMBRES
          if pi_v_do_ape_paterno is not null then
             v_sql_admin_where_do := v_sql_admin_where_do ||
             '
             AND PERS.APE_PATERNO LIKE '''||c_car_porcentaje||pi_v_do_ape_paterno||'%'''
             ;
          end if;

          if pi_v_do_ape_materno is not null then
             v_sql_admin_where_do := v_sql_admin_where_do ||
             '
             AND PERS.APE_MATERNO LIKE '''||c_car_porcentaje||pi_v_do_ape_materno||'%'''
             ;
          end if;

          if pi_v_do_ape_casada is not null then
             v_sql_admin_where_do := v_sql_admin_where_do ||
             '
             AND PERS.APE_CASADA LIKE '''||c_car_porcentaje||pi_v_do_ape_casada||'%'''
             ;
          end if;

          if pi_v_do_pri_nombre is not null then
             v_sql_admin_where_do := v_sql_admin_where_do ||
             '
             AND PERS.PRI_NOMBRE LIKE '''||c_car_porcentaje||pi_v_do_pri_nombre||'%'''
             ;
          end if;

          if pi_v_do_seg_nombre is not null then
             v_sql_admin_where_do := v_sql_admin_where_do ||
             '
             AND PERS.SEG_NOMBRE LIKE '''||c_car_porcentaje||pi_v_do_seg_nombre||'%'''
             ;
          end if;

          --DENOMINACION O RAZON SOCIAL
          if pi_v_do_razon_social is not null then
             v_sql_admin_where_do := v_sql_admin_where_do ||
             '
             AND PERS.RAZON_SOCIAL LIKE '''||c_car_porcentaje||pi_v_do_razon_social ||'%'''
             ;
          end if;
          /*
          --TIPO DE EMPRESA
          if pi_i_do_tip_empresa<>0 then
             v_sql_admin_where_do := v_sql_admin_where_do ||
             '
             AND PERS.TIP_EMPRESA=' ||pi_i_do_tip_empresa
             ;
          end if;

          --SECTOR ECONOMICO
          if pi_n_do_id_sect_econo<>0 then
             v_sql_admin_where_do := v_sql_admin_where_do ||
             '
             AND PERS.ID_SECTOR_ECONOMICO='||pi_n_do_id_sect_econo
             ;
          end if;
          */
          if pi_c_do_flg_asocu='1' then
             v_sql_admin_where_do := v_sql_admin_where_do ||
             '
             AND PERS.FLG_ASOCU='''||pi_c_do_flg_asocu||''''
             ;
          end if;

          v_sql_admin_where_do := v_sql_admin_where_do ||'
          )';
      END IF;

      IF c_flg_sancionado = '1' THEN
          if  c_flg_denunciado = '1' or c_flg_denunciante = '1' then
              v_sql_admin_where_s :=
              '
              OR(ADMINISTRADO.TIPO_ADMINISTRADO = ''1'' --sancionado';
          else
              v_sql_admin_where_s :=
              '
              AND(ADMINISTRADO.TIPO_ADMINISTRADO = ''1'' --sancionado';
          end if;

          --CODIGO INDECOPI
          if pi_v_s_codSanciona_ini is not null then
             v_sql_admin_where_s := v_sql_admin_where_s ||
             '
             AND TO_NUMBER(PERS.COD_SANCIONADO) BETWEEN TO_NUMBER('||pi_v_s_codSanciona_ini||') AND TO_NUMBER('||pi_v_s_codSanciona_fin||')'
             ;
          end if;

          --TIPO PERSONERIA
          if pi_v_s_id_tip_persona is not null then
             v_sql_admin_where_s := v_sql_admin_where_s ||
             --AND INSTR('''||pi_v_s_id_tip_persona||''',''|'' || TO_CHAR(PERS.TIPO_PERSONA) || ''|'' )>0';
             '
             AND PERS.TIPO_PERSONA = ' || pi_v_s_id_tip_persona;
          end if;


          --TIPO DOCUMENTO
          if pi_i_s_tipo_doc<>0 then
             v_sql_admin_where_s := v_sql_admin_where_s ||
             '
             AND PERS.TIPO_DOC='||pi_i_s_tipo_doc
             ;
          end if;

          --NRO DOCUMENTO
          if pi_v_s_nro_doc is not null then
             v_sql_admin_where_s := v_sql_admin_where_s ||
             '
             AND PERS.NRO_DOC='''||pi_v_s_nro_doc||''''
             ;
          end if;

          --APELLIDOS Y NOMBRES
          if pi_v_s_ape_paterno is not null then
             v_sql_admin_where_s := v_sql_admin_where_s ||
             '
             AND PERS.APE_PATERNO LIKE '''||c_car_porcentaje||pi_v_s_ape_paterno||'%'''
             ;
          end if;

          if pi_v_s_ape_materno is not null then
             v_sql_admin_where_s := v_sql_admin_where_s ||
             '
             AND PERS.APE_MATERNO LIKE '''||c_car_porcentaje||pi_v_s_ape_materno||'%'''
             ;
          end if;

          if pi_v_s_ape_casada is not null then
             v_sql_admin_where_s := v_sql_admin_where_s ||
             '
             AND PERS.APE_CASADA LIKE '''||c_car_porcentaje||pi_v_s_ape_casada||'%'''
             ;
          end if;

          if pi_v_s_pri_nombre is not null then
             v_sql_admin_where_s := v_sql_admin_where_s ||
             '
             AND PERS.PRI_NOMBRE LIKE '''||c_car_porcentaje||pi_v_s_pri_nombre||'%'''
             ;
          end if;

          if pi_v_s_seg_nombre is not null then
             v_sql_admin_where_s := v_sql_admin_where_s ||
             '
             AND PERS.SEG_NOMBRE LIKE '''||c_car_porcentaje||pi_v_s_seg_nombre||'%'''
             ;
          end if;

          --DENOMINACION O RAZON SOCIAL
          if pi_v_s_razon_social is not null then
             v_sql_admin_where_s := v_sql_admin_where_s ||
             '
             AND PERS.RAZON_SOCIAL LIKE '''||c_car_porcentaje||pi_v_s_razon_social ||'%'''
             ;
          end if;
          /*
          --TIPO DE EMPRESA
          if pi_i_s_tip_empresa<>0 then
             v_sql_admin_where_s := v_sql_admin_where_s ||
             '
             AND PERS.TIP_EMPRESA=' ||pi_i_s_tip_empresa
             ;
          end if;

          --SECTOR ECONOMICO
          if pi_n_s_id_sect_econo<>0 then
             v_sql_admin_where_s := v_sql_admin_where_s ||
             '
             AND PERS.ID_SECTOR_ECONOMICO='||pi_n_s_id_sect_econo
             ;
          end if;
          */
          if pi_c_s_flg_asocu='1' then
             v_sql_admin_where_s := v_sql_admin_where_s ||
             '
             AND PERS.FLG_ASOCU='''||pi_c_s_flg_asocu||''''
             ;
          end if;

          v_sql_admin_where_s := v_sql_admin_where_s ||'
          )';
      END IF;
      /*
      DBMS_OUTPUT.put_line(v_sql_admin_select);
      DBMS_OUTPUT.put_line(v_sql_admin_where_d);
      DBMS_OUTPUT.put_line(v_sql_admin_where_do);
      DBMS_OUTPUT.put_line(v_sql_admin_where_s);
      */
      EXECUTE IMMEDIATE v_sql_admin_select || v_sql_admin_where_d || v_sql_admin_where_do || v_sql_admin_where_s;

  end if;

  IF c_flg_administrado = '0' THEN
      INSERT INTO T_SCOB_TMP_ADMINISTRADO(ID_MULTA)
      VALUES('0');
  END IF;

  --mostrar los datos de la consulta
  v_sql_select_1 :=
  'SELECT
    MULT.ID_MULTA AS ID_MULTA,
    ---
    ROWNUM AS NRO_REG,
    scob_pk_expediente.SCOB_FN_SANCIONADOS_COD_INDEC(MULT.ID_MULTA,0) AS COD_INDECOPI,
    MULT.ANIO || MULT.CUM AS CUM,
    ORGR.CODIGO AS COD_ORGANO_RESOLUTIVO,
    ORGR.DESCRIPCION AS NOM_ORGANO_RESOLUTIVO,
    TIPO_PROC.DESCRIPCION AS NOM_TIPO_PROCEDEMIENTO, --AREA MACRO
    SEDE.CODIGO AS COD_SEDE,
    SEDE.DESCRIPCION AS NOM_SEDE,
    MATE.DESCRIPCION AS NOM_MATERIA,
    MULT.NRO_EXP_ADMINISTRATIVO AS NRO_EXPEDIENTE_UNICO,
    MDET.NRO_EXP_NIVEL AS NRO_EXPEDIENTE_ADMINISTRATIVO,
    scob_pk_expediente.SCOB_FN_DENUNCIANTES_MULTA(mdet.id_multa,0) AS NOM_DENUNCIANTE, --denunciante
    scob_pk_expediente.SCOB_FN_DENUNCIADOS_MULTA(mdet.id_multa,0) AS NOM_DENUNCIADO, --denunciado
    scob_pk_expediente.SCOB_FN_SANCIONADOS_MULTA(mdet.id_multa,0) AS NOM_SANCIONADO, --sancionado
    scob_pk_expediente.SCOB_FN_SANCIONADOS_CIIU(mdet.id_multa,0) AS NOM_CIUU, --ciiu
    MDET.POR_ASOCU AS POR_ASOCU,
    --PRIMERA INSTANCIA
    NIVEL1.NRO_RESOLUCION AS NRO_RESOLUCION_OR, --num_resolu
    NIVEL1.FEC_REGISTRO AS FEC_REGISTRO_OR,
    NIVEL1.FEC_RESOLUCION AS FEC_EMISION_RESOLUCION_OR, --fec_emision
    NIVEL1.FEC_NOTIFICACION_RESOLUCION AS FEC_NOTIFICACION_RESOLUCION_OR, --fec_notifica
    NIVEL1.FEC_ESTADO_SGTE_INSTANCIA AS FEC_APELACION,
    NIVEL1.LOGIN_USUARIO_REGISTRO AS USU_REGISTRO_OR,
    --scob_pk_utilitario.scob_fn_dias_laborables_neg(to_char(NIVEL1.FEC_RESOLUCION,''DD/MM/YYYY''),to_char(NIVEL1.FEC_REGISTRO,''DD/MM/YYYY'')) AS CANTIDAD_OR,
    scob_pk_utilitario.SCOB_FN_DIAS_LAB_NEG_BY_OR(to_char(NIVEL1.FEC_RESOLUCION,''DD/MM/YYYY''),to_char(NIVEL1.FEC_REGISTRO,''DD/MM/YYYY''),MDET.ID_ORGANO_RESOLUTIVO,'||SCOB_PK_CONSTANTES.C_NU_X_OR||') AS CANTIDAD_OR,
    --SEGUNDA INSTANCIA
    ';
  v_sql_select_2 :=
    'NIVEL2.NRO_RESOLUCION AS NRO_RESOLUCION_2DA,
    NIVEL2.FEC_REGISTRO AS FEC_REGISTRO_COMISION,
    NIVEL2.FEC_RESOLUCION AS FEC_RESOLUCION_2DA,
    NIVEL2.FEC_NOTIFICACION_RESOLUCION AS FEC_NOTIF_RESOLUCION_2DA,
    NIVEL2.FEC_ESTADO_SGTE_INSTANCIA AS FEC_REVISION,
    NIVEL2.LOGIN_USUARIO_REGISTRO AS USU_REGISTRO_COMISION,
    --scob_pk_utilitario.scob_fn_dias_laborables_neg(to_char(NIVEL2.FEC_RESOLUCION,''DD/MM/YYYY''),to_char(NIVEL2.FEC_REGISTRO,''DD/MM/YYYY'')) AS CANTIDAD_COMISION,
    scob_pk_utilitario.SCOB_FN_DIAS_LAB_NEG_BY_OR(to_char(NIVEL2.FEC_RESOLUCION,''DD/MM/YYYY''),to_char(NIVEL2.FEC_REGISTRO,''DD/MM/YYYY''),MDET.ID_ORGANO_RESOLUTIVO,'||SCOB_PK_CONSTANTES.C_NU_X_OR||') AS CANTIDAD_COMISION,
    --TERCERA INSTANCIA
    NIVEL3.NRO_RESOLUCION AS NRO_RESOLUCION_3ERA,
    NIVEL3.FEC_REGISTRO AS FEC_REGISTRO_SALA,
    NIVEL3.FEC_RESOLUCION  AS FEC_RESOLUCION_3ERA,
    NIVEL3.FEC_NOTIFICACION_RESOLUCION AS FEC_NOTIF_RESOLUCION_3ERA,
    NIVEL3.LOGIN_USUARIO_REGISTRO AS USU_REGISTRO_SALA,
    scob_pk_utilitario.SCOB_FN_DIAS_LAB_NEG_BY_OR(to_char(NIVEL3.FEC_RESOLUCION,''DD/MM/YYYY''),to_char(NIVEL3.FEC_REGISTRO,''DD/MM/YYYY''),MDET.ID_ORGANO_RESOLUTIVO,'||SCOB_PK_CONSTANTES.C_NU_X_OR||') AS CANTIDAD_SALA,
    ------------------------------------------------------
    NVL(MDET.VALOR_UIT,0) AS VALOR_UIT,
    MULT.MONTO_UIT AS MONTO_UIT,
    MULT.TOTAL_AMORTIZADO AS AMORTIZADO_CAPITAL,';
  v_sql_select_3 :=
    'MULT.SALDO AS SALDO_CAPITAL,
    EST_MULTA_OR.TXT_DESCRIPCION AS NOM_ESTADO_MULTA_OR, --est_multa_resolu
    TIPO_MULTA.TXT_DESCRIPCION AS DES_RESPONSABILIDAD,
    ------------------------------------------------------
    MULT.FEC_INGRESO AS FEC_GENERACION_CUM,
    DECODE(MULT.COD_ESTADO_PAGO,''4'',MULT.PORCENTAJE_DESCUENTO,NULL) AS POR_DSCTO_PAGO, --porcen_dscto_pago
    MULT.FEC_GENERACION_SEC AS FEC_GENERACION_SEC, --fec_gene_sec
    MULT.ANIO_FILE_AEC AS ANIO_FILE_AEC, --anio_file
    ARCO.CODIGO || MULT.NRO_FILE_AEC AS NRO_FILE_AEC, --nro_file
    EST_MULTA_COB.TXT_DESCRIPCION AS NOM_ESTADO_MULTA_COB,
    MULT.FEC_EMISION_REC AS FEC_EMISION_REC, --fec_emision_REC
    MULT.FEC_NOTIF_REC AS FEC_NOTIF_REC, --fec_notifi_REC
    USUA.USUARIO AS USU_GESTOR_COBRANZA, --gestor_cobranza
    EST_DEUDA.TXT_DESCRIPCION AS NOM_ESTADO_PAGO, --est_pago_multa
    MUAN.MONTO_ANTIDUMPING AS DERECHO_ANTIDUMPING
  ';

  --JOINS
  v_sql_join_1 := '
  FROM T_SCOB_MULTA MULT
  INNER JOIN T_SCOB_MULTA_DETAL MDET
       ON MDET.ID_MULTA = MULT.ID_MULTA
       AND MDET.FLG_ACTUAL = ''1''
       AND MDET.ESTADO = ''1''
  INNER JOIN (
    SELECT DISTINCT ID_MULTA AS ID_MULTA
    FROM T_SCOB_TMP_ADMINISTRADO
  ) ADMINISTRADO
  ON (
     ('||c_flg_administrado||' = ''0'' AND ''0''=ADMINISTRADO.ID_MULTA)OR
     ('||c_flg_administrado||' <> ''0'' AND ADMINISTRADO.ID_MULTA = MULT.ID_MULTA)
  )
  INNER JOIN T_SCOB_MATERIA MATE
       ON MATE.ID_MATERIA = MULT.ID_MATERIA
  INNER JOIN T_SCOB_TIPO_PROCEDIMIENTO TIPO_PROC
       ON TIPO_PROC.ID_TIPO_PROCEDIMIENTO = MATE.ID_TIPO_PROCEDIMIENTO
  INNER JOIN T_SCOB_ORGANO_RESOLUTIVO ORGR
       ON ORGR.ID_ORGANO_RESOLUTIVO = MDET.ID_ORGANO_RESOLUTIVO
  INNER JOIN T_SCOB_SEDE SEDE
       ON SEDE.ID_SEDE = MULT.ID_SEDE
  INNER JOIN T_SCOB_TABLA_DET TIPO_MULTA
        ON TIPO_MULTA.ID_TABLA = 45 --TIPO MULTA
        AND TO_NUMBER(TIPO_MULTA.COD_INTERNO) = TO_NUMBER(MULT.FLG_TIPO_MULTA)
  INNER JOIN T_SCOB_TABLA_DET EST_DEUDA
        ON EST_DEUDA.ID_TABLA = 34 --ESTADO DEUDA PAGO
        AND TO_NUMBER(EST_DEUDA.COD_INTERNO) = MULT.COD_ESTADO_PAGO';
  v_sql_join_2 := '
  LEFT JOIN T_SCOB_TABLA_DET EST_MULTA_OR
        ON EST_MULTA_OR.ID_TABLA = 5 --ESTADO MULTA OR
        AND TO_NUMBER(EST_MULTA_OR.COD_INTERNO) = MDET.ESTADO_MULTA
        AND TO_NUMBER(EST_MULTA_OR.TXT_VALOR1) = 1
  LEFT JOIN T_SCOB_TABLA_DET EST_MULTA_COB
       ON EST_MULTA_COB.ID_TABLA = 5 --ESTADO MULTA COBRANZA
       AND TO_NUMBER(EST_MULTA_COB.COD_INTERNO) = MULT.ESTADO_MULTA
       AND TO_NUMBER(EST_MULTA_COB.TXT_VALOR1) = 2
  LEFT JOIN T_SCOB_AREA_COBRANZA ARCO
       ON ARCO.ID_AREA_COBRANZA = MULT.ID_AREA_COBRANZA
  LEFT JOIN T_SCOB_USUARIO USUA
       ON USUA.ID_USUARIO = MULT.ID_USUARIO_ASIG_COBRANZA
  ------------------------------------------------------------------------------
  ---INSTANCIAS
  LEFT JOIN T_SCOB_TMP_INSTANCIAS_MULTA NIVEL1
       ON NIVEL1.NRO_NIVEL = '||SCOB_PK_CONSTANTES.C_TBL_TIPO_INSTANCIA_AUTO||'
       AND NIVEL1.ID_MULTA = MULT.ID_MULTA
  LEFT JOIN T_SCOB_TMP_INSTANCIAS_MULTA NIVEL2
       ON NIVEL2.NRO_NIVEL = '||SCOB_PK_CONSTANTES.C_TBL_TIPO_INSTANCIA_COMI||'
       AND NIVEL2.ID_MULTA = MULT.ID_MULTA
  LEFT JOIN T_SCOB_TMP_INSTANCIAS_MULTA NIVEL3
       ON NIVEL3.NRO_NIVEL = '||SCOB_PK_CONSTANTES.C_TBL_TIPO_INSTANCIA_SALA||'
       AND NIVEL3.ID_MULTA = MULT.ID_MULTA
  ------------------------------------------------------------------------------
  --LEFT JOIN T_SCOB_MULTA_COBRANZA MCOB
  --     ON MCOB.ID_MULTA = MULT.ID_MULTA
  --     AND MCOB.FLG_ACTUAL = ''1''
  --     AND MCOB.ESTADO = ''1''
  LEFT JOIN T_SCOB_MULTA_ANTIDUMPING MUAN
       ON MUAN.ID_MULTA = MULT.ID_MULTA
       AND MUAN.ESTADO = ''1''
  ';

  v_sql_where_1 := v_sql_where_1 || '
  WHERE MULT.ESTADO = ''1''';

  --01.FECHA GENERACION MULTA
  if pi_v_fec_gen_cum_ini is not null then
     v_sql_where_1 := v_sql_where_1 || '
     AND TO_DATE(TO_CHAR(MULT.FEC_INGRESO,''DD/MM/YYYY''),''DD/MM/YYYY'')
     BETWEEN TO_DATE('''||pi_v_fec_gen_cum_ini||''',''DD/MM/YYYY'') AND TO_DATE('''||pi_v_fec_gen_cum_fin||''',''DD/MM/YYYY'')
     ';
  end if;

  --03.CODIGO MULTA
  if pi_v_cum_ini is not null then
     v_sql_where_1 := v_sql_where_1 || '
     AND MULT.ANIO||MULT.CUM BETWEEN '''||pi_v_cum_ini||''' AND '''||pi_v_cum_fin|| '''';
  end if;

  --04.NUMERO EXPEDIENTE UNICO
  if pi_v_nro_exp_unico_ini is not null then
     v_sql_where_1 := v_sql_where_1 || '
     AND TO_NUMBER(MULT.NRO_EXPED_UNICO) --@0001
        BETWEEN '''||pi_v_nro_exp_unico_ini||''' and '''||pi_v_nro_exp_unico_fin||'''';
  end if;

  --05.NRO. RESOLUCION OR
  if pi_v_nro_resol_OR_ini is not null then
     v_sql_where_2 := v_sql_where_2 || '
     AND NIVEL1.NRO_RESOLUCION
        BETWEEN '''||pi_v_nro_resol_OR_ini||''' and '''||pi_v_nro_resol_OR_fin||'''';
  end if;

  --NRO. RESOLUCION COMISION
  if pi_v_nro_resol_CO_ini is not null then
     v_sql_where_2 := v_sql_where_2 || '
     AND NIVEL2.NRO_RESOLUCION
        BETWEEN '''||pi_v_nro_resol_CO_ini||''' and '''||pi_v_nro_resol_CO_fin||'''';
  end if;

  --NRO. RESOLUCION SALA
  if pi_v_nro_resol_SA_ini is not null then
     v_sql_where_2 := v_sql_where_2 || '
     AND NIVEL3.NRO_RESOLUCION
        BETWEEN '''||pi_v_nro_resol_SA_ini||''' and '''||pi_v_nro_resol_SA_fin||'''';
  end if;

  --06.FECHA RESOLUCION OR
  if pi_v_fec_reso_OR_ini is not null then
     v_sql_where_2 := v_sql_where_2 || '
     AND TO_DATE(TO_CHAR(NIVEL1.FEC_RESOLUCION,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE('''||pi_v_fec_reso_OR_ini||''',''DD/MM/YYYY'') AND TO_DATE('''||pi_v_fec_reso_OR_fin||''',''DD/MM/YYYY'')';
  end if;

  --FECHA RESOLUCION COMISION
  if pi_v_fec_reso_CO_ini is not null then
     v_sql_where_3 := v_sql_where_3 || '
     AND TO_DATE(TO_CHAR(NIVEL2.FEC_RESOLUCION,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE('''||pi_v_fec_reso_CO_ini||''',''DD/MM/YYYY'') AND TO_DATE('''||pi_v_fec_reso_CO_fin||''',''DD/MM/YYYY'')';
  end if;

  --FECHA RESOLUCION SALA
  if pi_v_fec_reso_SA_ini is not null then
     v_sql_where_3 := v_sql_where_3 || '
     AND TO_DATE(TO_CHAR(NIVEL3.FEC_RESOLUCION,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE('''||pi_v_fec_reso_SA_ini||''',''DD/MM/YYYY'') AND TO_DATE('''||pi_v_fec_reso_SA_fin||''',''DD/MM/YYYY'')';
  end if;

  --07.SEDE OR
  if pi_v_id_sede is not null then
     v_sql_where_3 := v_sql_where_3 || '
     AND INSTR('''||pi_v_id_sede||''',''|'' || TO_CHAR(MULT.ID_SEDE) || ''|'' )>0';
  end if;

  --08.ESTADO MULTA OR
  if pi_v_cod_estado_multa_or is not null then
     v_sql_where_3 := v_sql_where_3 || '
     AND INSTR('''||pi_v_cod_estado_multa_or||''',''|'' || TO_CHAR(MDET.ESTADO_MULTA) || ''|'' )>0';
  end if;

  --09.MATERIA
  if pi_v_id_materia is not null then
     v_sql_where_4 := v_sql_where_4 || '
     AND INSTR('''||pi_v_id_materia||''',''|'' || TO_CHAR(MULT.ID_MATERIA) || ''|'' )>0';
  end if;

  --10.ORGANO RESOLUTIVO
  if pi_v_id_org_resol is not null then
     v_sql_where_4 := v_sql_where_4 || '
     AND INSTR('''||pi_v_id_org_resol||''',''|'' || TO_CHAR(MDET.ID_ORGANO_RESOLUTIVO) || ''|'' )>0';
  end if;

  --11.VALOR UIT
  if pi_n_valor_uit_ini>0 then
     v_sql_where_4 := v_sql_where_4 || '
     AND MDET.VALOR_UIT
         BETWEEN '||pi_n_valor_uit_ini||' AND '||pi_n_valor_uit_fin;
  end if;

  --12.ESTADO PAGO MULTA
  if pi_v_cod_estado_pago is not null then
     v_sql_where_5 := v_sql_where_5 || '
     AND INSTR('''||pi_v_cod_estado_pago||''',''|'' || TO_CHAR(MULT.COD_ESTADO_PAGO) || ''|'' )>0';
  end if;

  if pi_c_flg_asocu_multa<>'0' then
     v_sql_where_5 := v_sql_where_5 || '
     AND NVL(MDET.POR_ASOCU,0) > 0';
  end if;
  -----------------------------------------

  v_sql_where_5 := v_sql_where_5 || '
  ORDER BY CUM DESC';
  /*
  DBMS_OUTPUT.put_line(v_sql_select_1);
  DBMS_OUTPUT.put_line(v_sql_select_2);
  DBMS_OUTPUT.put_line(v_sql_select_3);
  DBMS_OUTPUT.put_line(v_sql_join_1);
  DBMS_OUTPUT.put_line(v_sql_join_2);
  DBMS_OUTPUT.put_line(v_sql_where_1);
  DBMS_OUTPUT.put_line(v_sql_where_2);
  DBMS_OUTPUT.put_line(v_sql_where_3);
  DBMS_OUTPUT.put_line(v_sql_where_4);
  DBMS_OUTPUT.put_line(v_sql_where_5);
  */
  open po_cu_retorno for
  --select sysdate from dual;
                     v_sql_select_1 ||
                     v_sql_select_2 ||
                     v_sql_select_3 ||
                     v_sql_join_1 ||
                     v_sql_join_2 ||
                     v_sql_where_1 ||
                     v_sql_where_2||
                     v_sql_where_3 ||
                     v_sql_where_4 ||
                     v_sql_where_5
                     ;
  COMMIT;
end;

procedure scob_sp_s_multa_avanzada2(
-----------------------------------------------------------------------------------------------
/*001*/   pi_v_area_macro                        in varchar2      --AREA MACRO
/*002*/  ,pi_v_cum_ini                           in varchar2      --cum
/*003*/  ,pi_v_cum_fin                           in varchar2      --cum
/*004*/  ,pi_v_fec_gen_cum_ini                   in varchar2      --FECHA GENERACION CUM INI
/*005*/  ,pi_v_fec_gen_cum_fin                   in varchar2      --FECHA GENERACION CUM FIN
/*006*/  ,pi_v_id_sede                           in varchar2      --sede
/*007*/  ,PI_V_ID_COD_DPTO_SEDE                  in VARCHAR2      --CODIGO DEPARTAMENTO SEDE
/*008*/  ,PI_V_ID_COD_PROV_SEDE                  in VARCHAR2      --CODIGO PROVINCIA SEDE
/*009*/  ,PI_V_ID_COD_DIST_SEDE                  in VARCHAR2      --CODIGO DISTRITO SEDE
/*010*/  ,pi_v_id_org_resol                      in varchar2      --organo resolutivo
/*011*/  ,PI_V_ID_COD_DPTO_ORGR                  in VARCHAR2      --CODIGO DEPARTAMENTO ORGANO RESOLUTIVO
/*012*/  ,PI_V_ID_COD_PROV_ORGR                  in VARCHAR2      --CODIGO PROVINCIA ORGANO RESOLUTIVO
/*013*/  ,PI_V_ID_COD_DIST_ORGR                  in VARCHAR2      --CODIGO DISTRITO ORGANO RESOLUTIVO
/*014*/  ,PI_V_ID_NRO_INSTANCIA                  in VARCHAR2      --NUMERO DE INSTANCIA
/*015*/  ,pi_v_id_materia                        in varchar2      --materia
/*016*/  ,pi_v_id_sub_materia                    in varchar2      --SUBMATERIA
/*017*/  ,pi_v_nro_exp_unico_ini                 in varchar2      --nro. expediente administrativo
/*018*/  ,pi_v_nro_exp_unico_fin                 in varchar2      --nro. expediente administrativo
/*019*/  ,pi_v_nroExpAdm_nivel                   in varchar2      --nro. expediente antiguo
/*020*/  ,pi_v_nro_resol                         in varchar2      --nro. resolucion or
/*021*/  ,pi_v_fec_reso_or_ini                   in varchar2      --FECHA RESOLUCION OR INI
/*022*/  ,pi_v_fec_reso_or_fin                   in varchar2      --FECHA RESOLUCION OR FIN
/*023*/  ,pi_v_fec_notifi_or_ini                 in varchar2      --FECHA NOTIFICACION RESOLUCION INI
/*024*/  ,pi_v_fec_notifi_or_fin                 in varchar2      --FECHA NOTIFICACION RESOLUCION FIN
/*025*/  ,PI_V_FEC_GENERACION_SEC_INI            in VARCHAR2      --FECHA GENERACION SEC
/*026*/  ,PI_V_FEC_GENERACION_SEC_FIN            in VARCHAR2      --FECHA GENERACION SEC
---
/*027*/  ,pi_v_fec_recepcion_aec_ini             in varchar2      --FECHA RECEPCION AEC INICIO
/*028*/  ,pi_v_fec_recepcion_aec_fin             in varchar2      --FECHA RECEPCION AEC FIN
/*029*/  ,PI_V_ANIO_INGRESO_AEC_INI              in varchar2      --AÑO INGRESO AL AEC INI
/*030*/  ,PI_V_ANIO_INGRESO_AEC_FIN              in varchar2      --AÑO INGRESO AL AEC FIN
/*031*/  ,PI_V_NRO_INGRESO_AEC_INI               in varchar2      --nro. ingreso aec
/*032*/  ,PI_V_NRO_INGRESO_AEC_FIN               in varchar2      --nro. ingreso aec
---
/*033*/  ,PI_V_ANIO_FILE_INI                     in varchar2      --AÑO FILE INI
/*034*/  ,PI_V_ANIO_FILE_FIN                     in varchar2      --AÑO FILE FIN
/*035*/  ,PI_V_NRO_FILE_INI                      in varchar2      --nro. file
/*036*/  ,PI_V_NRO_FILE_FIN                      in varchar2      --nro. file
/*037*/  ,pi_v_fec_recepcion_file_ini            in varchar2      --FECHA RECEPCION FILE INICIO
/*038*/  ,pi_v_fec_recepcion_file_fin            in varchar2      --FECHA RECEPCION FILE FIN
---
/*039*/  ,pi_n_valor_uit_ini                     in number        --nro uit ini
/*040*/  ,pi_n_valor_uit_fin                     in number        --nro uit fin
/*041*/  ,pi_n_monto_uit_ini                     in NUMBER        --MONTO UIT INI
/*042*/  ,pi_n_monto_uit_fin                     in NUMBER        --MONTO UIT FIN
/*043*/  ,pi_n_saldo_ini                         in NUMBER        --SALDO UIT INI
/*044*/  ,pi_n_saldo_fin                         in NUMBER        --SALDO UIT FIN
/*045*/  ,pi_v_id_tipo_multa                     in varchar2      --TIPO MULTA (SOLIDARIA/INDIVIDUAL)
/*046*/  ,pi_v_cod_estado_multa_resol            in varchar2      --estado de la multa resolutivo
/*047*/  ,pi_v_cod_estado_pago                   in varchar2      --estado pago de la multa
/*048*/  ,PI_V_FEC_ESTADO_MULTA_OR_INI           in VARCHAR2      --FECHA ESTADO MULTA OR INI
/*049*/  ,PI_V_FEC_ESTADO_MULTA_OR_FIN           in VARCHAR2      --FECHA ESTADO MULTA OR FIN
/*050*/  ,PI_V_FEC_ESTADO_MULTA_COB_INI          in VARCHAR2      --FECHA ESTADO MULTA COBRANZA
/*051*/  ,PI_V_FEC_ESTADO_MULTA_COB_FIN          in VARCHAR2      --FECHA ESTADO MULTA COBRANZA
/*052*/  ,pi_v_cod_estado_multa_cob              in varchar2      --estado de la multa cobranza
/*053*/  ,pi_v_cod_motivo_multa_cob              in varchar2      --motivo multa cobranza
/*054*/  ,PI_V_IND_TIPO_PAGO                     in VARCHAR2      --INDICADOR DE PAGO
/*055*/  ,pi_c_flg_asocu_multa                   IN CHAR         --INDICADOR % ASOCU > 0
-----------------------------------------------------------------------------------------------
/*056*/  ,pi_v_cod_estado_exped_cob              in varchar2      --estado expediente cobranza
/*057*/  ,pi_v_anio                              in varchar2      --año expediente cobranza
/*058*/  ,pi_v_nro_exp_cob_ini                   in varchar2      --nro. expediente cobranza
/*059*/  ,pi_v_nro_exp_cob_fin                   in varchar2      --nro. expediente cobranza
/*060*/  ,pi_v_fec_gen_exped_cob_ini             in varchar2      --FECHA GENERACION EXPED COBRANZA INI
/*061*/  ,pi_v_fec_gen_exped_cob_fin             in varchar2      --FECHA GENERACION EXPED COBRANZA FIN
-------
/*062*/  ,pi_v_gestor_cobranza                   in varchar2      --Gestor de cobranza
/*063*/  ,pi_v_fec_emi_rec_ini                   in varchar2      --Fecha de Emisión de la REC
/*064*/  ,pi_v_fec_emi_rec_fin                   in varchar2      --Fecha de Emisión de la REC
/*065*/  ,pi_v_fec_noti_rec_ini                  in varchar2      --Fecha de Notificación de la REC
/*066*/  ,pi_v_fec_noti_rec_fin                  in varchar2      --Fecha de Notificación de la REC
/*067*/  ,pi_v_cod_motivo_exped_cob              in varchar2      --motivo expediente cobranza---------
/*068*/  ,pi_v_fec_est_exped_cob_ini             in varchar2      --Fecha de Estado del Expediente
/*069*/  ,pi_v_fec_est_exped_cob_fin             in varchar2      --Fecha de Estado del Expediente
/*070*/  ,pi_v_num_env_arch_ini                  in varchar2      --Nº Envio a Archivo Central
/*071*/  ,pi_v_num_env_arch_fin                  in varchar2      --Nº Envio a Archivo Central
/*072*/  ,pi_v_fec_envi_arch_ini                 in varchar2      --Fecha de Envío a Archivo Central
/*073*/  ,pi_v_fec_envi_arch_fin                 in varchar2      --Fecha de Envío a Archivo Central
/*074*/  ,pi_v_nro_ofic_sunat_ini                in varchar2      --Nº de Oficio de la SUNAT
/*075*/  ,pi_v_nro_ofic_sunat_fin                in varchar2      --Nº de Oficio de la SUNAT
/*076*/  ,pi_n_dere_antiDump_ini                 in NUMBER        --Derechos Antidumping
/*077*/  ,pi_n_dere_antiDump_fin                 in NUMBER        --Derechos Antidumping
/*078*/  ,pi_v_nro_parti_ini                     in varchar2      --Partida Arancelaria
/*079*/  ,pi_v_nro_parti_fin                     in varchar2      --Partida Arancelaria
/*080*/  ,pi_v_nro_dua_ini                       in varchar2      --Nº DUA
/*081*/  ,pi_v_nro_dua_fin                       in varchar2      --Nº DUA
/*082*/  ,pi_v_nro_liq_cob_ini                   in varchar2      --Nº Liquidación de Cobranza
/*083*/  ,pi_v_nro_liq_cob_fin                   in varchar2      --Nº Liquidación de Cobranza
/*084*/  ,pi_v_id_intendencia                    in varchar2      --Intendencia antidumping
/*085*/  ,pi_c_flg_ind_embargo                   in char          --INDICADOR TIENE EMBARGO?
/*086*/  ,pi_v_fec_asig_gestor_ini               in varchar2      --fecha de asignacion de gestor ini
/*087*/  ,pi_v_fec_asig_gestor_fin               in varchar2      --fecha de asignacion de gestor fin
/*088*/  ,pi_v_fec_carta_precoactiva_ini         in varchar2      --fecha de carta precoactiva inicio
/*089*/  ,pi_v_fec_carta_precoactiva_fin         in varchar2      --fecha de carta precoactiva fin
/*090*/  ,pi_v_id_expectativa_cobro              in varchar2      --cadena codigos espectativa de cobro

-----------------------------------------------------------------------------------------------
        --denunciante
/*091*/  ,pi_v_d_codSanciona_ini                 in varchar2      --Código del INDECOPI
/*092*/  ,pi_v_d_codSanciona_fin                 in varchar2      --Código del INDECOPI
/*093*/  ,pi_i_d_tip_persona                     in integer       --Tipo de Personería
/*094*/  ,pi_v_d_razon_social                    in varchar2      --Razón Social
/*095*/  ,pi_v_d_ape_paterno                     in varchar2      --Apellido Paterno
/*096*/  ,pi_v_d_ape_materno                     in varchar2      --Apellido Materno
/*097*/  ,pi_v_d_ape_casada                      in varchar2      --Apellido Casada
/*098*/  ,pi_v_d_pri_nombre                      in varchar2      --Primer nombre
/*099*/  ,pi_v_d_seg_nombre                      in varchar2      --Segundo nombre
/*100*/  ,pi_i_d_tipo_doc                        in integer       --Tipo de Documento
/*101*/  ,pi_v_d_nro_doc                         in varchar2      --Nº de documento de identidad
/*102*/  ,pi_i_d_tip_empresa                     in integer       --Tipo de Empresa
/*103*/  ,pi_n_d_id_sect_econo                   in number        --CIIU (Actividad Economica)
/*104*/  ,pi_c_d_flg_asocu                       in char          --flag asocu
/*105*/  ,pi_c_d_fl_oficio                       in char          --indicador denunciante de oficio=Indecopi
        --denunciado
/*106*/  ,pi_v_do_codSanciona_ini                in varchar2      --Código del INDECOPI
/*107*/  ,pi_v_do_codSanciona_fin                in varchar2      --Código del INDECOPI
/*108*/  ,pi_i_do_tip_persona                    in integer       --Tipo de Personería
/*109*/  ,pi_v_do_razon_social                   in varchar2      --Razón Social
/*110*/  ,pi_v_do_ape_paterno                    in varchar2      --Apellido Paterno
/*111*/  ,pi_v_do_ape_materno                    in varchar2      --Apellido Materno
/*112*/  ,pi_v_do_ape_casada                     in varchar2      --Apellido Casada
/*113*/  ,pi_v_do_pri_nombre                     in varchar2      --Primer nombre
/*114*/  ,pi_v_do_seg_nombre                     in varchar2      --Segundo nombre
/*115*/  ,pi_i_do_tipo_doc                       in integer       --Tipo de Documento
/*116*/  ,pi_v_do_nro_doc                        in varchar2      --Nº de documento de identidad
/*117*/  ,pi_i_do_tip_empresa                    in integer       --Tipo de Empresa
/*118*/  ,pi_n_do_id_sect_econo                  in number        --CIIU (Actividad Economica)
/*119*/  ,pi_c_do_flg_asocu                      in char          --flag asocu
         --sancionado
/*120*/  ,pi_v_s_codSanciona_ini                 in varchar2      --Código del INDECOPI
/*121*/  ,pi_v_s_codSanciona_fin                 in varchar2      --Código del INDECOPI
/*122*/  ,pi_i_s_tip_persona                     in integer       --Tipo de Personería
/*123*/  ,pi_v_s_razon_social                    in varchar2      --Razón Social
/*124*/  ,pi_v_s_ape_paterno                     in varchar2      --Apellido Paterno
/*125*/  ,pi_v_s_ape_materno                     in varchar2      --Apellido Materno
/*126*/  ,pi_v_s_ape_casada                      in varchar2      --Apellido Casada
/*127*/  ,pi_v_s_pri_nombre                      in varchar2      --Primer nombre
/*128*/  ,pi_v_s_seg_nombre                      in varchar2      --Segundo nombre
/*129*/  ,pi_i_s_tipo_doc                        in integer       --Tipo de Documento
/*130*/  ,pi_v_s_nro_doc                         in varchar2      --Nº de documento de identidad
/*131*/  ,pi_i_s_tip_empresa                     in integer       --Tipo de Empresa
/*132*/  ,pi_n_s_id_sect_econo                   in number        --CIIU (Actividad Economica)
/*133*/  ,pi_c_s_flg_asocu                       in char           --flag asocu
--@0002:ini
/*134*/  ,pi_c_s_flg_buscar_by_contenido         in char           --0=NO;1=SI
--@0002:fin
-----------------------------------------------------------------------------------------------
         ,po_cu_retorno                          out cu_rec_set
)is

  c_flg_administrado                           char(1);
  c_flg_sancionado                             char(1);
  c_flg_denunciado                             char(1);
  c_flg_denunciante                            char(1);

  v_sql_admin_select                           varchar2(8000);
  v_sql_admin_where_d                          varchar2(8000);
  v_sql_admin_where_do                         varchar2(8000);
  v_sql_admin_where_s                          varchar2(8000);

  v_sql_select_1                               varchar2(8000);
  v_sql_select_2                               varchar2(8000);
  v_sql_select_3                               varchar2(8000);
  v_sql_select_4                               varchar2(8000);
  v_sql_select_5                               varchar2(8000);
  v_sql_join_1                                 varchar2(8000);
  v_sql_join_2                                 varchar2(8000);
  v_sql_join_3                                 varchar2(8000);
  v_sql_join_4                                 varchar2(8000);
  v_sql_join_5                                 varchar2(8000);
  v_sql_where_1                                varchar2(8000);
  v_sql_where_2                                varchar2(8000);
  v_sql_where_3                                varchar2(8000);
  v_sql_where_4                                varchar2(8000);
  v_sql_where_5                                varchar2(8000);
  v_sql_where_6                                varchar2(8000);
  v_sql_where_7                                varchar2(8000);
  v_sql_where_8                                varchar2(8000);
  v_sql_where_9                                varchar2(8000);
  v_sql_where_10                               varchar2(8000);
  v_sql_where_11                               varchar2(8000);
  v_sql_where_12                               varchar2(8000);
  c_car_porcentaje                             varchar(1);
begin
  --@0002:ini
  c_car_porcentaje := '';
  if pi_c_s_flg_buscar_by_contenido = '1' then c_car_porcentaje := '%'; end if;
  --@0002:fin

  --control del filtro sancionado
  c_flg_administrado := '0';
  c_flg_sancionado := '0';
  c_flg_denunciado := '0';
  c_flg_denunciante := '0';

  v_sql_where_1 := '';
  v_sql_where_2 := '';
  v_sql_where_3 := '';
  v_sql_where_4 := '';
  v_sql_where_5 := '';
  v_sql_where_6 := '';
  v_sql_where_7 := '';
  v_sql_where_8 := '';
  v_sql_where_9 := '';
  v_sql_where_10 := '';
  v_sql_where_11 := '';
  v_sql_where_12 := '';

  IF  pi_v_s_codSanciona_ini is not null or
      pi_v_s_codSanciona_fin is not null or
      pi_i_s_tip_persona <> 0 or
      pi_v_s_razon_social is not null or
      pi_v_s_ape_paterno is not null or
      pi_v_s_ape_materno is not null or
      pi_v_s_ape_casada is not null or
      pi_v_s_pri_nombre is not null or
      pi_v_s_seg_nombre is not null or
      pi_i_s_tipo_doc <> 0 or
      pi_v_s_nro_doc is not null or
      pi_i_s_tip_empresa <> 0 or
      pi_n_s_id_sect_econo <> 0 or
      pi_c_s_flg_asocu<>'0'
  THEN
      c_flg_sancionado := '1';
      if c_flg_administrado = '0' then c_flg_administrado := '1'; end if;
  END IF;

  IF (
      pi_v_do_codSanciona_ini is not null or
      pi_v_do_codSanciona_fin is not null or
      pi_i_do_tip_persona <> 0 or
      pi_v_do_razon_social is not null or
      pi_v_do_ape_paterno is not null or
      pi_v_do_ape_materno is not null or
      pi_v_do_ape_casada is not null or
      pi_v_do_pri_nombre is not null or
      pi_v_do_seg_nombre is not null or
      pi_i_do_tipo_doc <> 0 or
      pi_v_do_nro_doc is not null or
      pi_i_do_tip_empresa <> 0 or
      pi_n_do_id_sect_econo <> 0 or
      pi_c_do_flg_asocu<>'0'
      )
  THEN
      c_flg_denunciado := '1';
      if c_flg_administrado = '0' then c_flg_administrado := '1'; end if;
  END IF;

  IF  (
      pi_v_d_codSanciona_ini is not null or
      pi_v_d_codSanciona_fin is not null or
      pi_i_d_tip_persona <> 0 or
      pi_v_d_razon_social is not null or
      pi_v_d_ape_paterno is not null or
      pi_v_d_ape_materno is not null or
      pi_v_d_ape_casada is not null or
      pi_v_d_pri_nombre is not null or
      pi_v_d_seg_nombre is not null or
      pi_i_d_tipo_doc <> 0 or
      pi_v_d_nro_doc is not null or
      pi_i_d_tip_empresa <> 0 or
      pi_n_d_id_sect_econo <> 0 or
      pi_c_d_flg_asocu<>'0' or
      pi_c_d_fl_oficio<>'0'
      )
  THEN
      c_flg_denunciante := '1';
      if c_flg_administrado = '0' then c_flg_administrado := '1'; end if;
  END IF;

  --obtener los datos de las intancias de una multa
  EXECUTE IMMEDIATE 'TRUNCATE TABLE T_SCOB_TMP_INSTANCIAS_MULTA';
  INSERT INTO T_SCOB_TMP_INSTANCIAS_MULTA(
      ID_MULTA,
      NRO_NIVEL,
      NRO_RESOLUCION,
      FEC_RESOLUCION,
      FEC_NOTIFICACION_RESOLUCION,
      FEC_ESTADO_SGTE_INSTANCIA,
      FEC_REGISTRO,
      LOGIN_USUARIO_REGISTRO
  )(
        SELECT
          MDET.ID_MULTA,
          ORGR.TIPO_INSTANCIA,
          MDET.NRO_RESOLUCION_ID,
          MDET.FEC_RESOLUCION,
          MDET.FEC_NOTIFICACION_RESOLUCION,
          MDET.FEC_ESTADO_SGTE_INSTANCIA,
          TO_DATE(TO_CHAR(MDET.AUDFECCREACION,'DD/MM/YYYY'),'DD/MM/YYYY'),
          MDET.AUDUSUCREACION
        FROM T_SCOB_MULTA_DETAL MDET
        INNER JOIN T_SCOB_ORGANO_RESOLUTIVO ORGR
              ON ORGR.ID_ORGANO_RESOLUTIVO = MDET.ID_ORGANO_RESOLUTIVO
        WHERE MDET.ESTADO = '1'
  );

  --obtener la situacion de pago de las multas
  EXECUTE IMMEDIATE 'TRUNCATE TABLE T_SCOB_TMP_SITUACION_MULTA';
  INSERT INTO T_SCOB_TMP_SITUACION_MULTA(
     ID_MULTA,
     COD_SITUACION_MULTA
  )
  SELECT
    MULT.ID_MULTA,
    CASE
       WHEN EXPE.ESTADO_EXPEDIENTE = 4 THEN 3 --'FR'
       WHEN EXPE.ESTADO_EXPEDIENTE = 5 THEN 4 --'PP'
       WHEN MULT.NRO_FILE_AEC IS NULL THEN 1 --PAGO VOLUNTARIO
       ELSE 2 --PAGO COACTIVO
       --WHEN MULT.IND_DESCUENTO = 1 AND MULT.COD_ESTADO_PAGO IN (4) THEN 1 --'DS'
       --WHEN MULT.NRO_FILE_AEC IS NULL THEN 2 --'MU'--NO TIENE DESCUENTO Y NO HA INGRESADO A COBRANZA
       --ELSE 2--'CO'
    END AS COD_SITUACION_MULTA
  FROM T_SCOB_MULTA MULT
  LEFT JOIN T_SCOB_EXPEDIENTE_MULTA EXMU
       ON EXMU.ID_MULTA = MULT.ID_MULTA
       AND EXMU.ESTADO = '1'
  LEFT JOIN T_SCOB_EXPEDIENTE EXPE
       ON EXPE.ID_EXPEDIENTE = EXMU.ID_EXPEDIENTE
  WHERE MULT.ESTADO = '1';

  -----------------------------------------------------------------------------------
  --obtener los administrados
  -----------------------------------------------------------------------------------
  --3=DENUNCIANTE
  -----------------------------------------------------------------------------------
  /*
  Dbms_Output.put_line('c_flg_administrado--->' || c_flg_administrado);
  Dbms_Output.put_line('c_flg_denunciante--->' || c_flg_denunciante);
  Dbms_Output.put_line('c_flg_sancionado--->' || c_flg_sancionado);
  Dbms_Output.put_line('c_flg_denunciado--->' || c_flg_denunciado);
  */

  EXECUTE IMMEDIATE 'TRUNCATE TABLE T_SCOB_TMP_ADMINISTRADO';
  --obtener a todos los administrados
  if c_flg_administrado = '1' then

      v_sql_admin_select := '
      INSERT INTO T_SCOB_TMP_ADMINISTRADO(
          ID_MULTA, TIPO_ADMINISTRADO, ID_PERSONA
      )
      SELECT
          ADMINISTRADO.ID_MULTA,ADMINISTRADO.TIPO_ADMINISTRADO,PERS.ID_PERSONA
      FROM (
          SELECT MDET.ID_MULTA AS ID_MULTA, ''3'' AS TIPO_ADMINISTRADO, --DENUNCIANTE
                 MDEN.ID_PERSONA  AS ID_PERSONA
          FROM T_SCOB_MULTA_DETAL MDET
          INNER JOIN T_SCOB_MULTA_DENUNCIANTE MDEN
                ON MDEN.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL
                AND MDEN.ESTADO = ''1''
          WHERE MDET.FLG_ACTUAL = ''1'' AND MDET.ESTADO = ''1''
          UNION ALL
          SELECT MDET.ID_MULTA AS ID_MULTA, MSAN.COD_TIPO_PERSONA AS TIPO_ADMINISTRADO, --SANCIONADO Y DENUNCIADO
                 MSAN.ID_PERSONA AS ID_PERSONA
          FROM T_SCOB_MULTA_DETAL MDET
          INNER JOIN T_SCOB_MULTA_SANCIONADO MSAN
                ON MSAN.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL
                AND MSAN.ESTADO = ''1''
          WHERE MDET.FLG_ACTUAL = ''1'' AND MDET.ESTADO = ''1''
      )ADMINISTRADO
      INNER JOIN T_SCOB_PERSONA PERS ON PERS.ID_PERSONA = ADMINISTRADO.ID_PERSONA
      ';

      v_sql_admin_where_d := '
      WHERE ADMINISTRADO.ID_MULTA IS NOT NULL ';

      IF c_flg_denunciante = '1' THEN

      v_sql_admin_where_d := v_sql_admin_where_d ||
      '
      AND (ADMINISTRADO.TIPO_ADMINISTRADO = ''3'' --denunciante
      ';

          --CODIGO INDECOPI
          if pi_v_d_codSanciona_ini is not null then
             v_sql_admin_where_d := v_sql_admin_where_d ||
             '
             AND TO_NUMBER(PERS.COD_SANCIONADO) BETWEEN TO_NUMBER('||pi_v_d_codSanciona_ini||') AND TO_NUMBER('||pi_v_d_codSanciona_fin||')'
             ;

          end if;

          --TIPO PERSONERIA
          if pi_i_d_tip_persona<>0 then
             v_sql_admin_where_d := v_sql_admin_where_d ||
             '
             AND PERS.TIPO_PERSONA='||pi_i_d_tip_persona
             ;
          end if;

          --TIPO DOCUMENTO
          if pi_i_d_tipo_doc<>0 then
             v_sql_admin_where_d := v_sql_admin_where_d ||
             '
             AND PERS.TIPO_DOC='||pi_i_d_tipo_doc
             ;
          end if;

          --NRO DOCUMENTO
          if pi_v_d_nro_doc is not null then
             v_sql_admin_where_d := v_sql_admin_where_d ||
             '
             AND PERS.NRO_DOC='''||pi_v_d_nro_doc||''''
             ;
          end if;

          --APELLIDOS Y NOMBRES
          if pi_v_d_ape_paterno is not null then
             v_sql_admin_where_d := v_sql_admin_where_d ||
             '
             AND PERS.APE_PATERNO LIKE '''||c_car_porcentaje||pi_v_d_ape_paterno||'%'''
             ;
          end if;

          if pi_v_d_ape_materno is not null then
             v_sql_admin_where_d := v_sql_admin_where_d ||
             '
             AND PERS.APE_MATERNO LIKE '''||c_car_porcentaje||pi_v_d_ape_materno||'%'''
             ;
          end if;

          if pi_v_d_ape_casada is not null then
             v_sql_admin_where_d := v_sql_admin_where_d ||
             '
             AND PERS.APE_CASADA LIKE '''||c_car_porcentaje||pi_v_d_ape_casada||'%'''
             ;
          end if;

          if pi_v_d_pri_nombre is not null then
             v_sql_admin_where_d := v_sql_admin_where_d ||
             '
             AND PERS.PRI_NOMBRE LIKE '''||c_car_porcentaje||pi_v_d_pri_nombre||'%'''
             ;
          end if;

          if pi_v_d_seg_nombre is not null then
             v_sql_admin_where_d := v_sql_admin_where_d ||
             '
             AND PERS.SEG_NOMBRE LIKE '''||c_car_porcentaje||pi_v_d_seg_nombre||'%'''
             ;
          end if;

          --DENOMINACION O RAZON SOCIAL
          if pi_v_d_razon_social is not null then
             v_sql_admin_where_d := v_sql_admin_where_d ||
             '
             AND PERS.RAZON_SOCIAL LIKE '''||c_car_porcentaje||pi_v_d_razon_social ||'%'''
             ;
          end if;

          --TIPO DE EMPRESA
          if pi_i_d_tip_empresa<>0 then
             v_sql_admin_where_d := v_sql_admin_where_d ||
             '
             AND PERS.TIP_EMPRESA=' ||pi_i_d_tip_empresa
             ;
          end if;

          --SECTOR ECONOMICO
          if pi_n_d_id_sect_econo<>0 then
             v_sql_admin_where_d := v_sql_admin_where_d ||
             '
             AND PERS.ID_SECTOR_ECONOMICO='||pi_n_d_id_sect_econo
             ;
          end if;

          --INDICADOR DENUNCIANTE DE OFICIO = INDECOPI
          if pi_c_d_fl_oficio='1' then
             v_sql_admin_where_d := v_sql_admin_where_d ||
             '
             AND PERS.ID_PERSONA='||SCOB_PK_CONSTANTES.C_ID_ADMINISTRADO_INDECOPI;
          end if;




      v_sql_admin_where_d := v_sql_admin_where_d || '
      )';

      END IF;

      IF c_flg_denunciado = '1' THEN
          if  c_flg_denunciante = '1' then
              v_sql_admin_where_do :=
              '
              OR(ADMINISTRADO.TIPO_ADMINISTRADO = ''2'' --denunciado';
          else
              v_sql_admin_where_do :=
              '
              AND(ADMINISTRADO.TIPO_ADMINISTRADO = ''2'' --denunciado';
          end if;

          --CODIGO INDECOPI
          if pi_v_d_codSanciona_ini is not null then
             v_sql_admin_where_do := v_sql_admin_where_do ||
             '
             AND TO_NUMBER(PERS.COD_SANCIONADO) BETWEEN TO_NUMBER('||pi_v_do_codSanciona_ini||') AND TO_NUMBER('||pi_v_do_codSanciona_fin||')'
             ;
          end if;

          --TIPO PERSONERIA
          if pi_i_do_tip_persona<>0 then
             v_sql_admin_where_do := v_sql_admin_where_do ||
             '
             AND PERS.TIPO_PERSONA='||pi_i_do_tip_persona
             ;
          end if;

          --TIPO DOCUMENTO
          if pi_i_do_tipo_doc<>0 then
             v_sql_admin_where_do := v_sql_admin_where_do ||
             '
             AND PERS.TIPO_DOC='||pi_i_do_tipo_doc
             ;
          end if;

          --NRO DOCUMENTO
          if pi_v_do_nro_doc is not null then
             v_sql_admin_where_do := v_sql_admin_where_do ||
             '
             AND PERS.NRO_DOC='''||pi_v_do_nro_doc||''''
             ;
          end if;

          --APELLIDOS Y NOMBRES
          if pi_v_do_ape_paterno is not null then
             v_sql_admin_where_do := v_sql_admin_where_do ||
             '
             AND PERS.APE_PATERNO LIKE '''||c_car_porcentaje||pi_v_do_ape_paterno||'%'''
             ;
          end if;

          if pi_v_do_ape_materno is not null then
             v_sql_admin_where_do := v_sql_admin_where_do ||
             '
             AND PERS.APE_MATERNO LIKE '''||c_car_porcentaje||pi_v_do_ape_materno||'%'''
             ;
          end if;

          if pi_v_do_ape_casada is not null then
             v_sql_admin_where_do := v_sql_admin_where_do ||
             '
             AND PERS.APE_CASADA LIKE '''||c_car_porcentaje||pi_v_do_ape_casada||'%'''
             ;
          end if;

          if pi_v_do_pri_nombre is not null then
             v_sql_admin_where_do := v_sql_admin_where_do ||
             '
             AND PERS.PRI_NOMBRE LIKE '''||c_car_porcentaje||pi_v_do_pri_nombre||'%'''
             ;
          end if;

          if pi_v_do_seg_nombre is not null then
             v_sql_admin_where_do := v_sql_admin_where_do ||
             '
             AND PERS.SEG_NOMBRE LIKE '''||c_car_porcentaje||pi_v_do_seg_nombre||'%'''
             ;
          end if;

          --DENOMINACION O RAZON SOCIAL
          if pi_v_do_razon_social is not null then
             v_sql_admin_where_do := v_sql_admin_where_do ||
             '
             AND PERS.RAZON_SOCIAL LIKE '''||c_car_porcentaje||pi_v_do_razon_social ||'%'''
             ;
          end if;

          --TIPO DE EMPRESA
          if pi_i_do_tip_empresa<>0 then
             v_sql_admin_where_do := v_sql_admin_where_do ||
             '
             AND PERS.TIP_EMPRESA=' ||pi_i_do_tip_empresa
             ;
          end if;

          --SECTOR ECONOMICO
          if pi_n_do_id_sect_econo<>0 then
             v_sql_admin_where_do := v_sql_admin_where_do ||
             '
             AND PERS.ID_SECTOR_ECONOMICO='||pi_n_do_id_sect_econo
             ;
          end if;

          if pi_c_do_flg_asocu='1' then
             v_sql_admin_where_do := v_sql_admin_where_do ||
             '
             AND PERS.FLG_ASOCU='''||pi_c_do_flg_asocu||''''
             ;
          end if;

          v_sql_admin_where_do := v_sql_admin_where_do ||'
          )';
      END IF;

      IF c_flg_sancionado = '1' THEN
          if  c_flg_denunciado = '1' or c_flg_denunciante = '1' then
              v_sql_admin_where_s :=
              '
              OR(ADMINISTRADO.TIPO_ADMINISTRADO = ''1'' --sancionado';
          else
              v_sql_admin_where_s :=
              '
              AND(ADMINISTRADO.TIPO_ADMINISTRADO = ''1'' --sancionado';
          end if;

          --CODIGO INDECOPI
          if pi_v_s_codSanciona_ini is not null then
             v_sql_admin_where_s := v_sql_admin_where_s ||
             '
             AND TO_NUMBER(PERS.COD_SANCIONADO) BETWEEN TO_NUMBER('||pi_v_s_codSanciona_ini||') AND TO_NUMBER('||pi_v_s_codSanciona_fin||')'
             ;
          end if;

          --TIPO PERSONERIA
          if pi_i_s_tip_persona<>0 then
             v_sql_admin_where_s := v_sql_admin_where_s ||
             '
             AND PERS.TIPO_PERSONA='||pi_i_s_tip_persona
             ;
          end if;

          --TIPO DOCUMENTO
          if pi_i_s_tipo_doc<>0 then
             v_sql_admin_where_s := v_sql_admin_where_s ||
             '
             AND PERS.TIPO_DOC='||pi_i_s_tipo_doc
             ;
          end if;

          --NRO DOCUMENTO
          if pi_v_s_nro_doc is not null then
             v_sql_admin_where_s := v_sql_admin_where_s ||
             '
             AND PERS.NRO_DOC='''||pi_v_s_nro_doc||''''
             ;
          end if;

          --APELLIDOS Y NOMBRES
          if pi_v_s_ape_paterno is not null then
             v_sql_admin_where_s := v_sql_admin_where_s ||
             '
             AND PERS.APE_PATERNO LIKE '''||c_car_porcentaje||pi_v_s_ape_paterno||'%'''
             ;
          end if;

          if pi_v_s_ape_materno is not null then
             v_sql_admin_where_s := v_sql_admin_where_s ||
             '
             AND PERS.APE_MATERNO LIKE '''||c_car_porcentaje||pi_v_s_ape_materno||'%'''
             ;
          end if;

          if pi_v_s_ape_casada is not null then
             v_sql_admin_where_s := v_sql_admin_where_s ||
             '
             AND PERS.APE_CASADA LIKE '''||c_car_porcentaje||pi_v_s_ape_casada||'%'''
             ;
          end if;

          if pi_v_s_pri_nombre is not null then
             v_sql_admin_where_s := v_sql_admin_where_s ||
             '
             AND PERS.PRI_NOMBRE LIKE '''||c_car_porcentaje||pi_v_s_pri_nombre||'%'''
             ;
          end if;

          if pi_v_s_seg_nombre is not null then
             v_sql_admin_where_s := v_sql_admin_where_s ||
             '
             AND PERS.SEG_NOMBRE LIKE '''||c_car_porcentaje||pi_v_s_seg_nombre||'%'''
             ;
          end if;

          --DENOMINACION O RAZON SOCIAL
          if pi_v_s_razon_social is not null then
             v_sql_admin_where_s := v_sql_admin_where_s ||
             '
             AND PERS.RAZON_SOCIAL LIKE '''||c_car_porcentaje||pi_v_s_razon_social ||'%'''
             ;
          end if;

          --TIPO DE EMPRESA
          if pi_i_s_tip_empresa<>0 then
             v_sql_admin_where_s := v_sql_admin_where_s ||
             '
             AND PERS.TIP_EMPRESA=' ||pi_i_s_tip_empresa
             ;
          end if;

          --SECTOR ECONOMICO
          if pi_n_s_id_sect_econo<>0 then
             v_sql_admin_where_s := v_sql_admin_where_s ||
             '
             AND PERS.ID_SECTOR_ECONOMICO='||pi_n_s_id_sect_econo
             ;
          end if;

          if pi_c_s_flg_asocu='1' then
             v_sql_admin_where_s := v_sql_admin_where_s ||
             '
             AND PERS.FLG_ASOCU='''||pi_c_s_flg_asocu||''''
             ;
          end if;

          v_sql_admin_where_s := v_sql_admin_where_s ||'
          )';
      END IF;

      DBMS_OUTPUT.put_line(v_sql_admin_select);
      DBMS_OUTPUT.put_line(v_sql_admin_where_d);
      DBMS_OUTPUT.put_line(v_sql_admin_where_do);
      DBMS_OUTPUT.put_line(v_sql_admin_where_s);

      EXECUTE IMMEDIATE v_sql_admin_select || v_sql_admin_where_d || v_sql_admin_where_do || v_sql_admin_where_s;

  end if;

  IF c_flg_administrado = '0' THEN
      INSERT INTO T_SCOB_TMP_ADMINISTRADO(ID_MULTA)
      VALUES('0');
  END IF;


  --mostrar los datos de la consulta
  v_sql_select_1 := '
  SELECT A.*,B.NRO_CUMS FROM(
  SELECT
    ROWNUM AS NRO_REG,
    MULT.ID_MULTA AS ID_MULTA,
    MULT.ANIO || MULT.CUM AS CUM,
    MULT.FEC_INGRESO AS FEC_GENERACION_CUM,
    TIPO_PROC.DESCRIPCION AS NOM_TIPO_PROCEDEMIENTO,
    ORGR.CODIGO AS COD_ORGANO_RESOLUTIVO,
    ORGR.DESCRIPCION AS NOM_ORGANO_RESOLUTIVO,
    SEDE.CODIGO AS COD_SEDE,
    SEDE.DESCRIPCION AS NOM_SEDE,
    MATE.DESCRIPCION AS NOM_MATERIA,
    SUBM.DESCRIPCION AS NOM_SUB_MATERIA,
    MULT.NRO_EXP_ADMINISTRATIVO AS NRO_EXPEDIENTE_UNICO,
    MDET.NRO_EXP_NIVEL AS NRO_EXPEDIENTE_ADMINISTRATIVO,
    --PRIMERA INSTANCIA
    NIVEL1.NRO_RESOLUCION AS NRO_RESOL_OR, --num_resolu
    NIVEL1.FEC_REGISTRO AS FEC_REG_OR,
    NIVEL1.FEC_RESOLUCION AS FEC_EMI_RESOL_OR, --fec_emision
    NIVEL1.FEC_NOTIFICACION_RESOLUCION AS FEC_NOTIF_RESOL_OR, --fec_notifica
    NIVEL1.FEC_ESTADO_SGTE_INSTANCIA AS FEC_APELACION,
    NIVEL1.LOGIN_USUARIO_REGISTRO AS USU_REG_OR,
    scob_pk_utilitario.scob_fn_dias_laborables_neg(to_char(NIVEL1.FEC_RESOLUCION,''DD/MM/YYYY''),to_char(NIVEL1.FEC_REGISTRO,''DD/MM/YYYY'')) AS CANTIDAD_OR,';
  v_sql_select_2 :=
    '--SEGUNDA INSTANCIA
    NIVEL2.NRO_RESOLUCION AS NRO_RESOL_COMISION,
    NIVEL2.FEC_REGISTRO AS FEC_REG_COMISION,
    NIVEL2.FEC_RESOLUCION AS FEC_RESOL_COMISION,
    NIVEL2.FEC_NOTIFICACION_RESOLUCION AS FEC_NOTIF_RESOL_COMISION,
    NIVEL2.FEC_ESTADO_SGTE_INSTANCIA AS FEC_REVISION,
    NIVEL2.LOGIN_USUARIO_REGISTRO AS USU_REG_COMISION,
    scob_pk_utilitario.scob_fn_dias_laborables_neg(to_char(NIVEL2.FEC_RESOLUCION,''DD/MM/YYYY''),to_char(NIVEL2.FEC_REGISTRO,''DD/MM/YYYY'')) AS CANTIDAD_COMISION,
    --TERCERA INSTANCIA
    NIVEL3.NRO_RESOLUCION AS NRO_RESOL_SALA,
    NIVEL3.FEC_REGISTRO AS FEC_REG_SALA,
    NIVEL3.FEC_RESOLUCION  AS FEC_RESOL_SALA,
    NIVEL3.FEC_NOTIFICACION_RESOLUCION AS FEC_NOTIF_RESOL_SALA,
    NIVEL3.LOGIN_USUARIO_REGISTRO AS USU_REG_SALA,
    scob_pk_utilitario.scob_fn_dias_laborables_neg(to_char(NIVEL3.FEC_RESOLUCION,''DD/MM/YYYY''),to_char(NIVEL3.FEC_REGISTRO,''DD/MM/YYYY'')) AS CANTIDAD_SALA,
    ------------------------------------------------------
    ';
  v_sql_select_3 :=
    'TIPO_MULTA.TXT_DESCRIPCION AS NOM_TIPO_MULTA, --tipo_multa
    scob_pk_expediente.SCOB_FN_DENUNCIANTES_MULTA(mdet.id_multa,0) AS NOM_DENUNCIANTE, --denunciante
    scob_pk_expediente.SCOB_FN_DENUNCIADOS_MULTA(mdet.id_multa,0) AS NOM_DENUNCIADO, --denunciado
    scob_pk_expediente.SCOB_FN_SANCIONADOS_MULTA(mdet.id_multa,0) AS NOM_SANCIONADO, --sancionado
    scob_pk_expediente.SCOB_FN_SANCIONADOS_TIPO_DOC(mdet.id_multa,0) AS NOM_TIPO_DOC_SANCIONADO,
    scob_pk_expediente.SCOB_FN_SANCIONADOS_NRO_DOC(mdet.id_multa,0) AS NRO_TIPO_DOC_SANCIONADO,
    scob_pk_expediente.SCOB_FN_SANCIONADOS_COD_INDEC(mdet.id_multa,0) AS COD_INDECOPI_SANCIONADO,
    scob_pk_expediente.SCOB_FN_SANCIONADOS_CLAS_INDEC(mdet.id_multa,0) AS CLASIF_SANCIONADO,
    scob_pk_expediente.SCOB_FN_SANCIONADOS_CIIU(mult.id_multa,0) CIIU_SANCIONADO, --act_economica
    DECODE(NVL(MDET.POR_ASOCU,''0''),''0'',''No'',''Si'') AS IND_ASOCU,
    NVL(MDET.POR_ASOCU,0) AS PORCENTAJE_ASOCU,
    --CAMPOS ANTIDUMPING
    MUAN.TIPO_CAMBIO AS TIPO_CAMBIO_DA,
    MUAN.MONTO_ANTIDUMPING AS DERECHO_ANTIDUMPING,
    MUAN.MONTO_INTERES AS MONTO_DA_IC,
    MUAN.MONTO_INTERES_MORATORIO AS MONTO_DA_IM,
    --
    MUAN.NRO_OFICIO_SUNAT_CODIGO || MUAN.NRO_OFICIO_SUNAT_ANIO || MUAN.NRO_OFICIO_SUNAT_PREFIJO || MUAN.NRO_OFICIO_SUNAT_CORRELATIVO AS NRO_OFICIO_SUNAT,
    NRO_LIQUIDACION_CODIGO ||NRO_LIQUIDACION_ANIO || NRO_LIQUIDACION_CORRELATIVO AS NRO_LIQUIDACION_COBRANZA,
    PART.CODIGO AS COD_PARTIDA,
    PART.DESCRIPCION AS NOM_PARTIDA,
    --NO EXISTE EL CAMPO MEMO EN LA INTERFAZ DE ANTIDUMPING
    NRO_DUA_CODIGO || NRO_DUA_ANIO || NRO_DUA_CORRELATIVO AS NRO_DUA,
    MUAN.ID_INTENDENCIA AS COD_INTENDENCIA,
    INTE.DESCRIPCION AS NOM_INTENDENCIA,
    --FIN CAMPOS ANTIDUMPING
    -----------------------------------
  ';
  v_sql_select_4 :=
   'NVL(MDET.VALOR_UIT,0) AS VALOR_UIT,
    MULT.MONTO_UIT AS MONTO_UIT,
    MULT.MONTO_INTERES AS MONTO_IC,
    MULT.MONTO_INTERES_MORATORIO AS MONTO_INTERES_IM,
    MULT.MONTO_COSTAS AS MONTO_COSTAS,
    --
    MULT.TOTAL_AMORTIZADO AS TOTAL_AMORTIZADO,
    MULT.TOTAL_AMORTIZADO_IC AS TOTAL_AMORTIZADO_IC,
    MULT.TOTAL_AMORTIZADO_IM AS TOTAL_AMORTIZADO_IM,
    MULT.TOTAL_AMORTIZADO_COSTAS AS TOTAL_AMORTIZADO_COSTAS,
    --
    MULT.SALDO AS SALDO, --saldo_capital
    MULT.SALDO_IC AS SALDO_IC,
    MULT.SALDO_IM AS SALDO_IM,
    MULT.SALDO_COSTAS AS SALDO_COSTAS,
    EST_MULTA_OR.TXT_DESCRIPCION AS NOM_ESTADO_MULTA_OR, --est_multa_resolu
    EST_DEUDA.TXT_DESCRIPCION AS NOM_ESTADO_PAGO, --est_pago_multa
    DECODE(MULT.COD_ESTADO_PAGO,''4'',MULT.PORCENTAJE_DESCUENTO,NULL) AS POR_DSCTO_PAGO, --porcen_dscto_pago
    MULT.FEC_GENERACION_SEC AS FEC_GENERACION_SEC, --fec_gene_sec
    MULT.ANIO_FILE_AEC AS ANIO_FILE_AEC, --anio_file
    MULT.FEC_INGRESO_AEC AS FEC_RECEPCION_FILE,
    ARCO.CODIGO || MULT.NRO_FILE_AEC AS NRO_FILE_AEC, --nro_file
    MCOB.NRO_INGRESO AS NRO_INGRESO_AEC,
    EST_MULTA_COB.TXT_DESCRIPCION AS NOM_ESTADO_MULTA_COB,
    DECODE(MOTIVO_MULT.ID_MOTIVO,0,NULL,MOTIVO_MULT.DESCRIPCION) AS NOM_MOTIVO_MULTA, --moti_multacobra
    MULT.FEC_ULT_IMPROCEDENCIA AS FEC_ULT_OBSERVACION_AEC,
  ';
  v_sql_select_5 :=
    'MULT.FEC_INGRESO_FILE  AS FEC_ULT_INGRESO_AEC,
    EXPE.ANIO||EXPE.NRO_EXPEDIENTE AS NRO_EXPED_COB, --nro_expe_cobranza
    EXPE.FEC_INGRESO AS FEC_GENERACION_EXPED_COB, --fec_gen_exp_cobran
    USUA.USUARIO AS USU_GESTOR_COBRANZA, --gestor_cobranza
    MULT.FECHA_ASIG_COBRANZA AS FEC_ASIG_GESTOR_COBRANZA,
    MULT.FEC_ULT_GEN_PRECOACTIVA AS FEC_ULT_GEN_PRECOACTIVA,
    MULT.FEC_EMISION_REC AS FEC_EMISION_REC, --fec_emision_REC
    MULT.FEC_NOTIF_REC AS FEC_NOTIF_REC, --fec_notifi_REC
    DECODE(NVL(EXPE.FLG_EMBARGO,''0''),''0'',''No'', ''Si'') AS IND_EMBARGO,
    EST_EXP.DESCRIPCION AS NOM_ESTADO_EXPED_COB, --est_exp_cobranza
    MOTIVO_EXPE.DESCRIPCION AS NOM_MOTIVO_EXPED_COB, --moti_exp_cobranza
    EXPE.FEC_ESTADO_EXPEDIENTE AS FEC_ULT_ESTADO_EXPED_COB, --fec_est_exp_cobran
    SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES('||SCOB_PK_CONSTANTES.C_TBL_ESPECTATIVA_COBRO_EXPCOB||',EXPE.COD_EXPECTATIVA_COBRO) AS NOM_EXPECTATIVA_COBRO,
    scob_pk_expediente.SCOB_FN_SANCIONADOS_REGION(mdet.id_multa,0) AS REGION_SANCIONADO,

    DECODE(EXPE.ID_EXPEDIENTE,NULL,MULT.FEC_ENVIO_RIESGO,MULT.FEC_ENVIO_RIESGO_EXP) AS FEC_MARCA_ENVIO_INFOCORP, --(FECHA EN QUE "MARCA" PARA ENVIAR A INFOCORP)
    ARCH_CEN.NRO_ORDEN AS NRO_ENVIO_ARCHIVO, --nro_envarch_central
    ARCH_CEN.FEC_ENVIO AS FEC_ENVIO_ARCHIVO, --fec_envarch_central
    (CASE
      WHEN MULT.ESTADO_ENVIO_ARCHIVO = 2 THEN ''ARCHIVO CENTRAL''
      WHEN MULT.ESTADO_MULTA IN (9,10,11,12,13) THEN ''AEC''
      ELSE '' '' END) AS UBI_FISICA_EXPEDIENTE,
    SIT_MULTA.COD_SITUACION_MULTA AS COD_SITUACION_MULTA,

    TIPO_PROC.Codigo   AS vc_cod_tipoproc,
    MATE.CODIGO        AS VC_COD_MATERIA,
    SUBM.CODIGO        AS VC_COD_SUBMATERIA,
    EST_MULTA_OR.COD_INTERNO  AS VC_COD_EST_MULTA,
    EST_DEUDA.COD_INTERNO     AS VC_COD_EST_PAGO,
    EST_MULTA_COB.COD_INTERNO AS VC_COD_EST_MULTA_COB,
    EST_EXP.CODIGO            AS VC_CODIGO_EST_EXP,
    MOTIVO_EXPE.CODIGO        AS VC_COD_MOTIVO_EXPED_COB,
    NULL               AS VC_CODIGO_CLASIFICACION,
    NULL               AS VC_CODIGO_CIIU,
    (CASE WHEN EXPE.ESTADO_EXPEDIENTE = 4 THEN
     ''FR'' ELSE ''NF'' END) AS VC_TIPO_MULTA,
    scob_pk_consulta.fn_getReso_gaf_aprueba(EXPE.id_expediente) AS vc_reso_gaf_APRUEBA,
    scob_pk_consulta.fn_getFecReso_gaf_aprueba(EXPE.id_expediente) AS vc_FEC_reso_gaf_APRUEBA,
    scob_pk_consulta.fn_getReso_gaf_perdida(EXPE.id_expediente) AS vc_reso_gaf_PERDIDA,
    scob_pk_consulta.fn_getFecReso_gaf_perdida(EXPE.id_expediente) AS vc_FEC_reso_gaf_PERDIDA,
    scob_pk_consulta.SCOB_FN_COD_DENUNCIANTES_MULTA(mdet.id_multa,0) AS VC_NRO_DOC_DENUNCIANTE,
    DECODE(MULT.COD_MOTIVO, 0, NULL, MULT.COD_MOTIVO) AS VC_COD_MOTIVO_MULTA_COB,
    scob_pk_consulta.SCOB_FN_CENTRO_DE_COSTO(MULT.ID_MULTA) AS VC_COD_CENTRO_COSTO';

  --JOINS
  v_sql_join_1 := '
  FROM T_SCOB_MULTA MULT
  INNER JOIN T_SCOB_MULTA_DETAL MDET
       ON MDET.ID_MULTA = MULT.ID_MULTA
       AND MDET.FLG_ACTUAL = ''1''
       AND MDET.ESTADO = ''1''
  INNER JOIN (
    SELECT DISTINCT ID_MULTA AS ID_MULTA
    FROM T_SCOB_TMP_ADMINISTRADO
  ) ADMINISTRADO
  ON (
     ('||c_flg_administrado||' = ''0'' AND ''0''=ADMINISTRADO.ID_MULTA)OR
     ('||c_flg_administrado||' <> ''0'' AND ADMINISTRADO.ID_MULTA = MULT.ID_MULTA)
  )
  INNER JOIN T_SCOB_TMP_SITUACION_MULTA SIT_MULTA
        ON SIT_MULTA.ID_MULTA = MULT.ID_MULTA
  INNER JOIN T_SCOB_MATERIA MATE
       ON MATE.ID_MATERIA = MULT.ID_MATERIA
  INNER JOIN T_SCOB_TIPO_PROCEDIMIENTO TIPO_PROC
       ON TIPO_PROC.ID_TIPO_PROCEDIMIENTO = MATE.ID_TIPO_PROCEDIMIENTO
  INNER JOIN T_SCOB_SUBMATERIA SUBM
       ON SUBM.ID_SUBMATERIA = MULT.ID_SUB_MATERIA
  INNER JOIN T_SCOB_ORGANO_RESOLUTIVO ORGR
       ON ORGR.ID_ORGANO_RESOLUTIVO = MDET.ID_ORGANO_RESOLUTIVO
  INNER JOIN T_SCOB_UBIGEO UBIG_ORGR
       ON UBIG_ORGR.COD_DPTO = ORGR.COD_DPTO
       AND UBIG_ORGR.COD_PROV = ORGR.COD_PROV
       AND UBIG_ORGR.COD_DIST = ORGR.COD_DIST
  INNER JOIN T_SCOB_SEDE SEDE
       ON SEDE.ID_SEDE = MULT.ID_SEDE
  INNER JOIN T_SCOB_UBIGEO UBIG_SEDE
       ON UBIG_SEDE.COD_DPTO = SEDE.COD_DPTO
       AND UBIG_SEDE.COD_PROV = SEDE.COD_PROV
       AND UBIG_SEDE.COD_DIST = SEDE.COD_DIST
  INNER JOIN T_SCOB_TABLA_DET TIPO_MULTA
        ON TIPO_MULTA.ID_TABLA = 45 --TIPO MULTA
        AND TO_NUMBER(TIPO_MULTA.COD_INTERNO) = TO_NUMBER(MULT.FLG_TIPO_MULTA)
  INNER JOIN T_SCOB_TABLA_DET EST_DEUDA
        ON EST_DEUDA.ID_TABLA = 34 --ESTADO DEUDA PAGO
        AND TO_NUMBER(EST_DEUDA.COD_INTERNO) = MULT.COD_ESTADO_PAGO';

  v_sql_join_2 := '
  LEFT JOIN T_SCOB_TABLA_DET EST_MULTA_OR
        ON EST_MULTA_OR.ID_TABLA = 5 --ESTADO MULTA OR
        AND TO_NUMBER(EST_MULTA_OR.COD_INTERNO) = MDET.ESTADO_MULTA
        AND TO_NUMBER(EST_MULTA_OR.TXT_VALOR1) = 1
  LEFT JOIN T_SCOB_TABLA_DET EST_MULTA_COB
       ON EST_MULTA_COB.ID_TABLA = 5 --ESTADO MULTA COBRANZA
       AND TO_NUMBER(EST_MULTA_COB.COD_INTERNO) = MULT.ESTADO_MULTA
       AND TO_NUMBER(EST_MULTA_COB.TXT_VALOR1) = 2
  LEFT JOIN T_SCOB_AREA_COBRANZA ARCO
       ON ARCO.ID_AREA_COBRANZA = MULT.ID_AREA_COBRANZA
  LEFT JOIN T_SCOB_USUARIO USUA
       ON USUA.ID_USUARIO = MULT.ID_USUARIO_ASIG_COBRANZA
  ------------------------------------------------------------------------------
  ---INSTANCIAS
  LEFT JOIN T_SCOB_TMP_INSTANCIAS_MULTA NIVEL1
       ON NIVEL1.NRO_NIVEL = '||SCOB_PK_CONSTANTES.C_TBL_TIPO_INSTANCIA_AUTO||'
       AND NIVEL1.ID_MULTA = MULT.ID_MULTA
  LEFT JOIN T_SCOB_TMP_INSTANCIAS_MULTA NIVEL2
       ON NIVEL2.NRO_NIVEL = '||SCOB_PK_CONSTANTES.C_TBL_TIPO_INSTANCIA_COMI||'
       AND NIVEL2.ID_MULTA = MULT.ID_MULTA
  LEFT JOIN T_SCOB_TMP_INSTANCIAS_MULTA NIVEL3
       ON NIVEL3.NRO_NIVEL = '||SCOB_PK_CONSTANTES.C_TBL_TIPO_INSTANCIA_SALA||'
       AND NIVEL3.ID_MULTA = MULT.ID_MULTA
  ------------------------------------------------------------------------------
  LEFT JOIN T_SCOB_MULTA_COBRANZA MCOB
       ON MCOB.ID_MULTA = MULT.ID_MULTA
       AND MCOB.FLG_ACTUAL = ''1''
       AND MCOB.ESTADO = ''1''';

  v_sql_join_3 := '
  LEFT JOIN T_SCOB_EST_MUL_COB_MOTIVO MOTIVO_MULT --motivo multa cobranza
       ON MOTIVO_MULT.ID_MOTIVO = MULT.COD_MOTIVO
  LEFT JOIN T_SCOB_EXPEDIENTE_MULTA EXMU
       ON EXMU.ID_MULTA = MULT.ID_MULTA
       AND EXMU.ESTADO = ''1''
  LEFT JOIN T_SCOB_EXPEDIENTE EXPE
       ON EXPE.ID_EXPEDIENTE = EXMU.ID_EXPEDIENTE
       AND EXPE.ESTADO = ''1''
  LEFT JOIN T_SCOB_EST_EXP_COB EST_EXP
       ON EST_EXP.ID_EST_EXP_COB = EXPE.ESTADO_EXPEDIENTE
  LEFT JOIN T_SCOB_EST_EXP_COB_MOTIVO MOTIVO_EXPE --motivo estado expediente
       ON MOTIVO_EXPE.ID_MOTIVO = EXPE.ID_MOTIVO
  LEFT JOIN T_SCOB_MULTA_ANTIDUMPING MUAN
       ON MUAN.ID_MULTA = MULT.ID_MULTA
       AND MUAN.ESTADO = ''1''
  LEFT JOIN T_SCOB_INTENDENCIA INTE
       ON INTE.ID_INTENDENCIA = MUAN.ID_INTENDENCIA
  LEFT JOIN T_SCOB_PARTIDA PART
       ON PART.ID_PARTIDA = MUAN.ID_PARTIDA';

  v_sql_join_4 := '
  LEFT JOIN T_SCOB_MULTA_ARCHIVO_CENTRAL EXPED_ARCH_CEN
       ON EXPED_ARCH_CEN.ID_MULTA = MULT.ID_MULTA
       AND EXPED_ARCH_CEN.FLG_ACTUAL = ''1''
       AND EXPED_ARCH_CEN.ESTADO = ''1''
  LEFT JOIN T_SCOB_ARCHIVO_CENTRAL ARCH_CEN
       ON ARCH_CEN.ID_ARCHIVO_CENTRAL = EXPED_ARCH_CEN.ID_MULTA_ARCHIVO_CENTRAL
       AND ARCH_CEN.ESTADO = ''1''';

  v_sql_where_1 := v_sql_where_1 || '
  WHERE EXMU.FLG_INACTIVO IS NULL AND MULT.ESTADO = ''1''';

  ---------------------------------------------------------------------------
  -- FILTROS MULTA
  ---------------------------------------------------------------------------
  --AREA MACRO
  if pi_v_area_macro is not null then
     v_sql_where_1 := v_sql_where_1 || '
     AND INSTR('''||pi_v_area_macro||''',''|'' || TO_CHAR(TIPO_PROC.ID_TIPO_PROCEDIMIENTO) || ''|'' )>0';
  end if;

  --CODIGO MULTA
  if pi_v_cum_ini is not null then
     v_sql_where_1 := v_sql_where_1 || '
     AND MULT.ANIO||MULT.CUM BETWEEN '''||pi_v_cum_ini||''' AND '''||pi_v_cum_fin|| '''';
  end if;

  --FECHA GENERACION MULTA
  if pi_v_fec_gen_cum_ini is not null then
     v_sql_where_1 := v_sql_where_1 || '
     AND TO_DATE(TO_CHAR(MULT.FEC_INGRESO,''DD/MM/YYYY''),''DD/MM/YYYY'')
     BETWEEN TO_DATE('''||pi_v_fec_gen_cum_ini||''',''DD/MM/YYYY'') AND TO_DATE('''||pi_v_fec_gen_cum_fin||''',''DD/MM/YYYY'')
     ';
  end if;

  --SEDE
  if pi_v_id_sede is not null then
     v_sql_where_1 := v_sql_where_1 || '
     AND INSTR('''||pi_v_id_sede||''',''|'' || TO_CHAR(MULT.ID_SEDE) || ''|'' )>0';
  end if;

  --UBIGEO SEDE
  if PI_V_ID_COD_DPTO_SEDE is not null then
     v_sql_where_1 := v_sql_where_1 || '
     AND SEDE.COD_DPTO='''||PI_V_ID_COD_DPTO_SEDE||'''';
  end if;

  if PI_V_ID_COD_PROV_SEDE is not null then
     v_sql_where_2 := v_sql_where_2 || '
     AND SEDE.COD_PROV='''||PI_V_ID_COD_PROV_SEDE||'''';
  end if;

  if PI_V_ID_COD_DIST_SEDE is not null then
     v_sql_where_2 := v_sql_where_2 || '
     AND SEDE.COD_DIST='''||PI_V_ID_COD_DIST_SEDE||'''';
  end if;

  --ORGANO RESOLUTIVO
  if pi_v_id_org_resol is not null then
     v_sql_where_2 := v_sql_where_2 || '
     AND INSTR('''||pi_v_id_org_resol||''',''|'' || TO_CHAR(MDET.ID_ORGANO_RESOLUTIVO) || ''|'' )>0';
  end if;

  --UBIGEO ORGANO RESOLUTIVO
  if PI_V_ID_COD_DPTO_ORGR is not null then
     v_sql_where_2 := v_sql_where_2 || '
     AND ORGR.COD_DPTO='''||PI_V_ID_COD_DPTO_ORGR||'''';
  end if;

  if PI_V_ID_COD_PROV_ORGR is not null then
     v_sql_where_2 := v_sql_where_2 || '
     AND ORGR.COD_PROV='''||PI_V_ID_COD_PROV_ORGR||'''';
  end if;
  if PI_V_ID_COD_DIST_ORGR is not null then
     v_sql_where_3 := v_sql_where_3 || '
     AND ORGR.COD_DIST='''||PI_V_ID_COD_DIST_ORGR||'''';
  end if;

  --TIPO INSTANCIA
  if PI_V_ID_NRO_INSTANCIA is not null then
     v_sql_where_3 := v_sql_where_3 || '
     AND INSTR('''||PI_V_ID_NRO_INSTANCIA||''',''|'' || TO_CHAR(ORGR.TIPO_INSTANCIA) || ''|'' )>0';
  end if;

  --MATERIA
  if pi_v_id_materia is not null then
     v_sql_where_3 := v_sql_where_3 || '
     AND INSTR('''||pi_v_id_materia||''',''|'' || TO_CHAR(MULT.ID_MATERIA) || ''|'' )>0';
  end if;

  --SUBMATERIA
  if pi_v_id_sub_materia is not null then
     v_sql_where_3 := v_sql_where_3 || '
     AND INSTR('''||pi_v_id_sub_materia||''',''|'' || TO_CHAR(MULT.ID_SUB_MATERIA) || ''|'' )>0';
  end if;

  --NUMERO EXPEDIENTE UNICO
  if pi_v_nro_exp_unico_ini is not null then
     v_sql_where_3 := v_sql_where_3 || '
     AND TO_NUMBER(MULT.NRO_EXPED_UNICO) --@0001
        BETWEEN '''||pi_v_nro_exp_unico_ini||''' and '''||pi_v_nro_exp_unico_fin||'''';
  end if;

  --NUMERO EXPEDIENTE ADMINISTRATIVO
  if pi_v_nroExpAdm_nivel is not null then
     v_sql_where_3 := v_sql_where_3 || '
     AND MDET.NRO_EXP_NIVEL LIKE '''|| pi_v_nroExpAdm_nivel ||'%''';
  end if;

  --NRO RESOLUCION OR
  if pi_v_nro_resol is not null then
     v_sql_where_3 := v_sql_where_3 || '
     AND NIVEL1.NRO_RESOLUCION LIKE '''|| pi_v_nro_resol || '%''';
  end if;

  --FECHA RESOLUCION OR
  if pi_v_fec_reso_or_ini is not null then
     v_sql_where_3 := v_sql_where_3 || '
     AND TO_DATE(TO_CHAR(MDET.FEC_RESOLUCION,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE('''||pi_v_fec_reso_or_ini||''',''DD/MM/YYYY'') AND TO_DATE('''||pi_v_fec_reso_or_fin||''',''DD/MM/YYYY'')';
  end if;

  --FECHA NOTIFICACION RESOLUCION OR
  if pi_v_fec_notifi_or_ini is not null then
     v_sql_where_4 := v_sql_where_4 || '
     AND TO_DATE(TO_CHAR(MDET.FEC_NOTIFICACION_RESOLUCION,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE('''||pi_v_fec_notifi_or_ini||''',''DD/MM/YYYY'') AND TO_DATE('''||pi_v_fec_notifi_or_fin||''',''DD/MM/YYYY'')';
  end if;

  --FECHA GENERACION DE LA SEC
  if PI_V_FEC_GENERACION_SEC_INI is not null then
     v_sql_where_4 := v_sql_where_4 || '
     AND TO_DATE(TO_CHAR(MULT.FEC_GENERACION_SEC,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE('''||PI_V_FEC_GENERACION_SEC_INI||''',''DD/MM/YYYY'') AND TO_DATE('''||PI_V_FEC_GENERACION_SEC_FIN||''',''DD/MM/YYYY'')';
  end if;

  --FECHA INGRESO AL AEC
  if pi_v_fec_recepcion_aec_ini is not null then
     v_sql_where_4 := v_sql_where_4 || '
     AND TO_DATE(TO_CHAR(MULT.FEC_INGRESO_FILE,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE('''||pi_v_fec_recepcion_aec_ini||''',''DD/MM/YYYY'') AND TO_DATE('''||pi_v_fec_recepcion_aec_fin||''',''DD/MM/YYYY'')';
  end if;

  --AÑO INGRESO AL AEC
  if PI_V_ANIO_INGRESO_AEC_INI is not null then
     v_sql_where_4 := v_sql_where_4 || '
     AND MCOB.ANIO
         BETWEEN '''||PI_V_ANIO_INGRESO_AEC_INI||''' AND '''||PI_V_ANIO_INGRESO_AEC_FIN||'''';
  end if;

  --NRO INGRESO AL AEC
  if PI_V_NRO_INGRESO_AEC_INI is not null then
     v_sql_where_4 := v_sql_where_4 || '
     AND MCOB.NRO_INGRESO
         BETWEEN '''||LPAD(PI_V_NRO_INGRESO_AEC_INI,4,'0000')||''' AND '''||LPAD(PI_V_NRO_INGRESO_AEC_FIN,4,'0000')||'''';
  end if;

  --AÑO FILE
  if PI_V_ANIO_FILE_INI is not null then
     v_sql_where_4 := v_sql_where_4 || '
     AND MULT.ANIO_FILE_AEC BETWEEN '''||PI_V_ANIO_FILE_INI||''' AND '''||PI_V_ANIO_FILE_FIN||'''';
  end if;

  --NRO FILE
  if PI_V_NRO_FILE_INI is not null then
     v_sql_where_4 := v_sql_where_4 || '
     AND MULT.NRO_FILE_AEC
         BETWEEN '''||LPAD(PI_V_NRO_FILE_INI,10,'0000000000')||''' AND '''||LPAD(PI_V_NRO_FILE_FIN,10,'0000000000')||'''';
  end if;

  --VALOR UIT
  if pi_n_valor_uit_ini>0 then
     v_sql_where_5 := v_sql_where_5 || '
     AND MDET.VALOR_UIT
         BETWEEN '||pi_n_valor_uit_ini||' AND '||pi_n_valor_uit_fin;
  end if;

  --MONTO UIT
  if pi_n_monto_uit_ini>0 then
     v_sql_where_5 := v_sql_where_5 || '
     AND MULT.MONTO_UIT
         BETWEEN '||pi_n_monto_uit_ini||' AND '||pi_n_monto_uit_fin;
  end if;

  --SALDO UIT
  if pi_n_saldo_ini>0 then
     v_sql_where_5 := v_sql_where_5 || '
     AND MULT.SALDO
         BETWEEN '||pi_n_saldo_ini||' AND '||pi_n_saldo_fin;
  end if;

  --TIPO MULTA
  if pi_v_id_tipo_multa is not null then
     v_sql_where_5 := v_sql_where_5 || '
     AND INSTR('''||pi_v_id_tipo_multa||''',''|'' || MULT.FLG_TIPO_MULTA || ''|'' )>0';
  end if;

  --ESTADO MULTA OR
  if pi_v_cod_estado_multa_resol is not null then
     v_sql_where_5 := v_sql_where_5 || '
     AND INSTR('''||pi_v_cod_estado_multa_resol||''',''|'' || TO_CHAR(MDET.ESTADO_MULTA) || ''|'' )>0';
  end if;

  --ESTADO PAGO MULTA
  if pi_v_cod_estado_pago is not null then
     v_sql_where_5 := v_sql_where_5 || '
     AND INSTR('''||pi_v_cod_estado_pago||''',''|'' || TO_CHAR(MULT.COD_ESTADO_PAGO) || ''|'' )>0';
  end if;

  --FECHA ESTADO MULTA OR
  if PI_V_FEC_ESTADO_MULTA_OR_INI is not null then
     v_sql_where_6 := v_sql_where_6 || '
     AND TO_DATE(TO_CHAR(MDET.FEC_ESTADO_MULTA,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE('''||PI_V_FEC_ESTADO_MULTA_OR_INI||''',''DD/MM/YYYY'') AND TO_DATE('''||PI_V_FEC_ESTADO_MULTA_OR_FIN||''',''DD/MM/YYYY'')';
  end if;

  --FECHA ESTADO MULTA COB
  if PI_V_FEC_ESTADO_MULTA_COB_INI is not null then
     v_sql_where_6 := v_sql_where_6 || '
     AND TO_DATE(TO_CHAR(MULT.FEC_ESTADO_MULTA,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE('''||PI_V_FEC_ESTADO_MULTA_COB_INI||''',''DD/MM/YYYY'') AND TO_DATE('''||PI_V_FEC_ESTADO_MULTA_COB_FIN||''',''DD/MM/YYYY'')';
  end if;

  --ESTADO MULTA COBRANZA
  if pi_v_cod_estado_multa_cob is not null then
     v_sql_where_6 := v_sql_where_6 || '
     AND INSTR('''||pi_v_cod_estado_multa_cob||''',''|'' || TO_CHAR(MULT.ESTADO_MULTA) || ''|'' )>0';
  end if;

  --MOTIVO MULTA COBRANZA
  if pi_v_cod_motivo_multa_cob is not null then
     v_sql_where_6 := v_sql_where_6 || '
     AND INSTR('''||pi_v_cod_motivo_multa_cob||''',''|'' || MULT.COD_MOTIVO || ''|'' )>0';
  end if;

  --INDICADOR DE PAGO
  if PI_V_IND_TIPO_PAGO is not null then
     v_sql_where_6 := v_sql_where_6 || '
     AND INSTR('''||PI_V_IND_TIPO_PAGO||''',''|'' || TO_CHAR(SIT_MULTA.COD_SITUACION_MULTA) || ''|'' )>0';
  end if;

  --INDICADOR PORCENTAJE ASOCU MULTA
  if pi_c_flg_asocu_multa<>'0' then
     v_sql_where_6 := v_sql_where_6 || '
     AND NVL(MDET.POR_ASOCU,0) > 0';
  end if;

  --EXPECTATIVA DE COBRO
  if pi_v_id_expectativa_cobro is not null then
     v_sql_where_7 := v_sql_where_7 || '
     AND INSTR('''||pi_v_id_expectativa_cobro||''',''|'' || TO_CHAR(EXPE.COD_EXPECTATIVA_COBRO) || ''|'' )>0';
  end if;

  --INDICADOR EMBARGO
  if pi_c_flg_ind_embargo<>'0' then
     v_sql_where_7 := v_sql_where_7 || '
     AND NVL(EXPE.FLG_EMBARGO,''0'') = ''1''';
  end if;

  --FECHA ULTIMA GENERACION PRECOACTIVO
  if pi_v_fec_carta_precoactiva_ini is not null then
     v_sql_where_7 := v_sql_where_7 || '
     AND TO_DATE(TO_CHAR(MULT.FEC_ULT_GEN_PRECOACTIVA,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE('''||pi_v_fec_carta_precoactiva_ini||''',''DD/MM/YYYY'') AND TO_DATE('''||pi_v_fec_carta_precoactiva_fin||''',''DD/MM/YYYY'')';
  end if;

 --FECHA RECEPCION FILE
  if pi_v_fec_recepcion_file_ini is not null then
     v_sql_where_7 := v_sql_where_7 || '
     AND TO_DATE(TO_CHAR(MULT.FEC_INGRESO_AEC,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE('''||pi_v_fec_recepcion_file_ini||''',''DD/MM/YYYY'') AND TO_DATE('''||pi_v_fec_recepcion_file_fin||''',''DD/MM/YYYY'')';
  end if;

  ---------------------------------------------------------------------------
  -- FILTROS EXPEDIENTE
  ---------------------------------------------------------------------------
  --ESTADO EXPEDIENTE COBRANZA
  if pi_v_cod_estado_exped_cob is not null then
     v_sql_where_7 := v_sql_where_7 || '
     AND INSTR('''||pi_v_cod_estado_exped_cob||''',''|'' || TO_CHAR(EXPE.ESTADO_EXPEDIENTE) || ''|'' )>0';
  end if;

  --AÑO EXPEDIENTE COBRANZA
  if pi_v_anio is not null then
     v_sql_where_7 := v_sql_where_7 || '
     AND EXPE.ANIO='''||pi_v_anio||'''';
  end if;

  --NRO EXPEDIENTE COBRANZA
  if pi_v_nro_exp_cob_ini>0 then
     v_sql_where_7 := v_sql_where_7 || '
     AND EXPE.NRO_EXPEDIENTE
         BETWEEN lpad('''||pi_v_nro_exp_cob_ini||''',10,''0000000000'') AND lpad('''||pi_v_nro_exp_cob_fin||''',10,''0000000000'')';
  end if;

  --FECHA GENERACION EXPEDIENTE COBRANZA
  if pi_v_fec_gen_exped_cob_ini is not null then
     v_sql_where_8 := v_sql_where_8 || '
     AND TO_DATE(TO_CHAR(EXPE.FEC_INGRESO,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE('''||pi_v_fec_gen_exped_cob_ini||''',''DD/MM/YYYY'') AND TO_DATE('''||pi_v_fec_gen_exped_cob_fin||''',''DD/MM/YYYY'')';
  end if;

  --GESTOR COBRANZA
  if pi_v_gestor_cobranza is not null then
     v_sql_where_8 := v_sql_where_8 || '
     AND INSTR('''||pi_v_gestor_cobranza||''',''|'' || TO_CHAR(MULT.ID_USUARIO_ASIG_COBRANZA) || ''|'' )>0';
  end if;

  --FECHA EMISION DE LA REC
  if pi_v_fec_emi_rec_ini is not null then
     v_sql_where_8 := v_sql_where_8 || '
     AND TO_DATE(TO_CHAR(MULT.FEC_EMISION_REC,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE('''||pi_v_fec_emi_rec_ini||''',''DD/MM/YYYY'') AND TO_DATE('''||nvl(pi_v_fec_emi_rec_fin,pi_v_fec_emi_rec_ini)||''',''DD/MM/YYYY'')';
  end if;

  --FECHA NOTIFICACION DE LA REC
  if pi_v_fec_noti_rec_ini is not null then
     v_sql_where_8 := v_sql_where_8 || '
     AND TO_DATE(TO_CHAR(MULT.FEC_NOTIF_REC,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE('''||pi_v_fec_noti_rec_ini||''',''DD/MM/YYYY'') AND TO_DATE('''||pi_v_fec_noti_rec_fin||''',''DD/MM/YYYY'')';
  end if;

  --MOTIVO EXPEDIENTE COBRANZA
  if pi_v_cod_motivo_exped_cob is not null then
     v_sql_where_8 := v_sql_where_8 || '
     AND INSTR('''||pi_v_cod_motivo_exped_cob||''',''|'' || TO_CHAR(EXPE.ID_MOTIVO) || ''|'' )>0';
  end if;

  --FECHA ULTIMO ESTADO EXPEDIENTE
  if pi_v_fec_est_exped_cob_ini is not null then
     v_sql_where_9 := v_sql_where_9 || '
     AND TO_DATE(TO_CHAR(EXPE.FEC_ESTADO_EXPEDIENTE,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE('''||pi_v_fec_est_exped_cob_ini||''',''DD/MM/YYYY'') AND TO_DATE('''||pi_v_fec_est_exped_cob_fin||''',''DD/MM/YYYY'')';
  end if;

  --NUMERO DE ENVIO A ARCHIVO CENTRAL
  if pi_v_num_env_arch_ini is not null then
     v_sql_where_9 := v_sql_where_9 || '
     AND ARCH_CEN.NRO_ORDEN
         BETWEEN LPAD('''||pi_v_num_env_arch_ini||''',4,''0000'') AND LPAD('''||pi_v_num_env_arch_fin||''',4,''0000'')';
  end if;

  --FECHA ENVIO ARCHIVO CENTRAL
  if pi_v_fec_envi_arch_ini is not null then
     v_sql_where_9 := v_sql_where_9 || '
     AND TO_DATE(TO_CHAR(ARCH_CEN.FEC_ENVIO,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE('''||pi_v_fec_envi_arch_ini||''',''DD/MM/YYYY'') AND TO_DATE('''||pi_v_fec_envi_arch_fin||''',''DD/MM/YYYY'')';
  end if;

  --NRO OFICIO SUNAT
  if pi_v_nro_ofic_sunat_ini is not null then
     v_sql_where_9 := v_sql_where_9 || '
     AND (MUAN.NRO_OFICIO_SUNAT_CODIGO || MUAN.NRO_OFICIO_SUNAT_ANIO ||
     MUAN.NRO_OFICIO_SUNAT_PREFIJO || MUAN.NRO_OFICIO_SUNAT_CORRELATIVO)
     BETWEEN '''||pi_v_nro_ofic_sunat_ini||''' AND '''||pi_v_nro_ofic_sunat_fin||'''';
  end if;

  --DERECHO ANTIDUMOPING
  if pi_n_dere_antiDump_ini>0 then
     v_sql_where_9 := v_sql_where_9 || '
     AND MUAN.MONTO_ANTIDUMPING
         BETWEEN '||pi_n_dere_antiDump_ini||' AND '||pi_n_dere_antiDump_fin;
  end if;

  --PARTIDA ARANCELARIA
  if pi_v_nro_parti_ini is not null then
  v_sql_where_10 := v_sql_where_10 || '
      AND PART.CODIGO
      BETWEEN lpad('''||pi_v_nro_parti_ini||''',10,''0000000000'') AND lpad('''||pi_v_nro_parti_fin||''',10,''0000000000'')';
  end if;

  --MEMO ANTIDUMPING --FALTA EL CAMPO NO EXISTE EN LA INTERFAZ
  --NRO DUA
  if pi_v_nro_dua_ini is not null then
     v_sql_where_10 := v_sql_where_10 || '
     AND (MUAN.NRO_DUA_CODIGO || MUAN.NRO_DUA_ANIO || MUAN.NRO_DUA_CORRELATIVO)
         BETWEEN '''||pi_v_nro_dua_ini||''' AND '''||pi_v_nro_dua_fin||'''';
  end if;

  --NRO LIQUIDACION COBRANZA
  if pi_v_nro_liq_cob_ini is not null then
     v_sql_where_10 := v_sql_where_10 || '
     AND (MUAN.NRO_LIQUIDACION_CODIGO || MUAN.NRO_LIQUIDACION_ANIO || MUAN.NRO_LIQUIDACION_CORRELATIVO)
         BETWEEN '''||pi_v_nro_liq_cob_ini||''' AND '''||pi_v_nro_liq_cob_fin||'''';
  end if;

  --INTENDENCIA
  if pi_v_id_intendencia is not null then
     v_sql_where_10 := v_sql_where_10 || '
     AND INSTR('''||pi_v_id_intendencia||''',''|'' || TO_CHAR(MUAN.ID_INTENDENCIA) || ''|'' )>0';
  end if;

 --FECHA ASIGNACION GESTOR COBRANZA
  if pi_v_fec_asig_gestor_ini is not null then
     v_sql_where_11 := v_sql_where_11 || '
     AND TO_DATE(TO_CHAR(MULT.FECHA_ASIG_COBRANZA,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE('''||pi_v_fec_asig_gestor_ini||''',''DD/MM/YYYY'') AND TO_DATE('''||pi_v_fec_asig_gestor_fin||''',''DD/MM/YYYY'')';
  end if;

  v_sql_where_12 := v_sql_where_12 || '
  AND ROWNUM = 1
  ORDER BY CUM DESC
  )A
  INNER JOIN (
    SELECT MUL.ID_MULTA,EX.NRO_CUMS FROM T_SCOB_EXPEDIENTE EX
    INNER JOIN T_SCOB_EXPEDIENTE_MULTA EM
    ON EX.ID_EXPEDIENTE = EM.ID_EXPEDIENTE
    INNER JOIN T_SCOB_MULTA MUL
    ON MUL.ID_MULTA = EM.ID_MULTA
    WHERE
    EM.FLG_INACTIVO IS NULL
    )B
  ON A.ID_MULTA = B.ID_MULTA
  ';


  DBMS_OUTPUT.put_line(v_sql_select_1);
  DBMS_OUTPUT.put_line(v_sql_select_2);
  DBMS_OUTPUT.put_line(v_sql_select_3);
  DBMS_OUTPUT.put_line(v_sql_select_4);
  DBMS_OUTPUT.put_line(v_sql_select_5);
  ---
  DBMS_OUTPUT.put_line(v_sql_join_1);
  DBMS_OUTPUT.put_line(v_sql_join_2);
  DBMS_OUTPUT.put_line(v_sql_join_3);
  DBMS_OUTPUT.put_line(v_sql_join_4);
  DBMS_OUTPUT.put_line(v_sql_join_5);
  ---
  DBMS_OUTPUT.put_line(v_sql_where_1);
  DBMS_OUTPUT.put_line(v_sql_where_2);
  DBMS_OUTPUT.put_line(v_sql_where_3);
  DBMS_OUTPUT.put_line(v_sql_where_4);
  DBMS_OUTPUT.put_line(v_sql_where_5);
  ---
  DBMS_OUTPUT.put_line(v_sql_where_6);
  DBMS_OUTPUT.put_line(v_sql_where_7);
  DBMS_OUTPUT.put_line(v_sql_where_8);
  DBMS_OUTPUT.put_line(v_sql_where_9);
  DBMS_OUTPUT.put_line(v_sql_where_10);
  DBMS_OUTPUT.put_line(v_sql_where_11);
  DBMS_OUTPUT.put_line(v_sql_where_12);

  open po_cu_retorno for
  --select sysdate from dual;

                     v_sql_select_1 ||
                     v_sql_select_2 ||
                     v_sql_select_3 ||
                     v_sql_select_4 ||
                     v_sql_select_5 ||
                     v_sql_join_1 ||
                     v_sql_join_2 ||
                     v_sql_join_3 ||
                     v_sql_join_4 ||
                     v_sql_join_5 ||
                     v_sql_where_1 ||
                     v_sql_where_2||
                     v_sql_where_3 ||
                     v_sql_where_4 ||
                     v_sql_where_5 ||
                     v_sql_where_6 ||
                     v_sql_where_7 ||
                     v_sql_where_8 ||
                     v_sql_where_9 ||
                     v_sql_where_10 ||
                     v_sql_where_11 ||
                     v_sql_where_12
                     ;

  COMMIT;

end;

procedure scob_sp_s_multa_avanzada_BK(
-----------------------------------------------------------------------------------------------
/*001*/   pi_v_area_macro                        in varchar2      --AREA MACRO
/*002*/  ,pi_v_cum_ini                           in varchar2      --cum
/*003*/  ,pi_v_cum_fin                           in varchar2      --cum
/*004*/  ,pi_v_fec_gen_cum_ini                   in varchar2      --FECHA GENERACION CUM INI
/*005*/  ,pi_v_fec_gen_cum_fin                   in varchar2      --FECHA GENERACION CUM FIN
/*006*/  ,pi_v_id_sede                           in varchar2      --sede
/*007*/  ,PI_V_ID_COD_DPTO_SEDE                  in VARCHAR2      --CODIGO DEPARTAMENTO SEDE
/*008*/  ,PI_V_ID_COD_PROV_SEDE                  in VARCHAR2      --CODIGO PROVINCIA SEDE
/*009*/  ,PI_V_ID_COD_DIST_SEDE                  in VARCHAR2      --CODIGO DISTRITO SEDE
/*010*/  ,pi_v_id_org_resol                      in varchar2      --organo resolutivo
/*011*/  ,PI_V_ID_COD_DPTO_ORGR                  in VARCHAR2      --CODIGO DEPARTAMENTO ORGANO RESOLUTIVO
/*012*/  ,PI_V_ID_COD_PROV_ORGR                  in VARCHAR2      --CODIGO PROVINCIA ORGANO RESOLUTIVO
/*013*/  ,PI_V_ID_COD_DIST_ORGR                  in VARCHAR2      --CODIGO DISTRITO ORGANO RESOLUTIVO
/*014*/  ,PI_V_ID_NRO_INSTANCIA                  in VARCHAR2      --NUMERO DE INSTANCIA
/*015*/  ,pi_v_id_materia                        in varchar2      --materia
/*016*/  ,pi_v_id_sub_materia                    in varchar2      --SUBMATERIA
/*017*/  ,pi_v_nro_exp_unico_ini                 in varchar2      --nro. expediente administrativo
/*018*/  ,pi_v_nro_exp_unico_fin                 in varchar2      --nro. expediente administrativo
/*019*/  ,pi_v_nroExpAdm_nivel                   in varchar2      --nro. expediente antiguo
/*020*/  ,pi_v_nro_resol                         in varchar2      --nro. resolucion or
/*021*/  ,pi_v_fec_reso_or_ini                   in varchar2      --FECHA RESOLUCION OR INI
/*022*/  ,pi_v_fec_reso_or_fin                   in varchar2      --FECHA RESOLUCION OR FIN
/*023*/  ,pi_v_fec_notifi_or_ini                 in varchar2      --FECHA NOTIFICACION RESOLUCION INI
/*024*/  ,pi_v_fec_notifi_or_fin                 in varchar2      --FECHA NOTIFICACION RESOLUCION FIN
/*025*/  ,PI_V_FEC_GENERACION_SEC_INI            in VARCHAR2      --FECHA GENERACION SEC
/*026*/  ,PI_V_FEC_GENERACION_SEC_FIN            in VARCHAR2      --FECHA GENERACION SEC
---
/*027*/  ,pi_v_fec_recepcion_aec_ini             in varchar2      --FECHA RECEPCION AEC INICIO
/*028*/  ,pi_v_fec_recepcion_aec_fin             in varchar2      --FECHA RECEPCION AEC FIN
/*029*/  ,PI_V_ANIO_INGRESO_AEC_INI              in varchar2      --AÑO INGRESO AL AEC INI
/*030*/  ,PI_V_ANIO_INGRESO_AEC_FIN              in varchar2      --AÑO INGRESO AL AEC FIN
/*031*/  ,PI_V_NRO_INGRESO_AEC_INI               in varchar2      --nro. ingreso aec
/*032*/  ,PI_V_NRO_INGRESO_AEC_FIN               in varchar2      --nro. ingreso aec
---
/*033*/  ,PI_V_ANIO_FILE_INI                     in varchar2      --AÑO FILE INI
/*034*/  ,PI_V_ANIO_FILE_FIN                     in varchar2      --AÑO FILE FIN
/*035*/  ,PI_V_NRO_FILE_INI                      in varchar2      --nro. file
/*036*/  ,PI_V_NRO_FILE_FIN                      in varchar2      --nro. file
/*037*/  ,pi_v_fec_recepcion_file_ini            in varchar2      --FECHA RECEPCION FILE INICIO
/*038*/  ,pi_v_fec_recepcion_file_fin            in varchar2      --FECHA RECEPCION FILE FIN
---
/*039*/  ,pi_n_valor_uit_ini                     in number        --nro uit ini
/*040*/  ,pi_n_valor_uit_fin                     in number        --nro uit fin
/*041*/  ,pi_n_monto_uit_ini                     in NUMBER        --MONTO UIT INI
/*042*/  ,pi_n_monto_uit_fin                     in NUMBER        --MONTO UIT FIN
/*043*/  ,pi_n_saldo_ini                         in NUMBER        --SALDO UIT INI
/*044*/  ,pi_n_saldo_fin                         in NUMBER        --SALDO UIT FIN
/*045*/  ,pi_v_id_tipo_multa                     in varchar2      --TIPO MULTA (SOLIDARIA/INDIVIDUAL)
/*046*/  ,pi_v_cod_estado_multa_resol            in varchar2      --estado de la multa resolutivo
/*047*/  ,pi_v_cod_estado_pago                   in varchar2      --estado pago de la multa
/*048*/  ,PI_V_FEC_ESTADO_MULTA_OR_INI           in VARCHAR2      --FECHA ESTADO MULTA OR INI
/*049*/  ,PI_V_FEC_ESTADO_MULTA_OR_FIN           in VARCHAR2      --FECHA ESTADO MULTA OR FIN
/*050*/  ,PI_V_FEC_ESTADO_MULTA_COB_INI          in VARCHAR2      --FECHA ESTADO MULTA COBRANZA
/*051*/  ,PI_V_FEC_ESTADO_MULTA_COB_FIN          in VARCHAR2      --FECHA ESTADO MULTA COBRANZA
/*052*/  ,pi_v_cod_estado_multa_cob              in varchar2      --estado de la multa cobranza
/*053*/  ,pi_v_cod_motivo_multa_cob              in varchar2      --motivo multa cobranza
/*054*/  ,PI_V_IND_TIPO_PAGO                     in VARCHAR2      --INDICADOR DE PAGO
/*055*/  ,pi_c_flg_asocu_multa                   IN CHAR         --INDICADOR % ASOCU > 0
-----------------------------------------------------------------------------------------------
/*056*/  ,pi_v_cod_estado_exped_cob              in varchar2      --estado expediente cobranza
/*057*/  ,pi_v_anio                              in varchar2      --año expediente cobranza
/*058*/  ,pi_v_nro_exp_cob_ini                   in varchar2      --nro. expediente cobranza
/*059*/  ,pi_v_nro_exp_cob_fin                   in varchar2      --nro. expediente cobranza
/*060*/  ,pi_v_fec_gen_exped_cob_ini             in varchar2      --FECHA GENERACION EXPED COBRANZA INI
/*061*/  ,pi_v_fec_gen_exped_cob_fin             in varchar2      --FECHA GENERACION EXPED COBRANZA FIN
-------
/*062*/  ,pi_v_gestor_cobranza                   in varchar2      --Gestor de cobranza
/*063*/  ,pi_v_fec_emi_rec_ini                   in varchar2      --Fecha de Emisión de la REC
/*064*/  ,pi_v_fec_emi_rec_fin                   in varchar2      --Fecha de Emisión de la REC
/*065*/  ,pi_v_fec_noti_rec_ini                  in varchar2      --Fecha de Notificación de la REC
/*066*/  ,pi_v_fec_noti_rec_fin                  in varchar2      --Fecha de Notificación de la REC
/*067*/  ,pi_v_cod_motivo_exped_cob              in varchar2      --motivo expediente cobranza---------
/*068*/  ,pi_v_fec_est_exped_cob_ini             in varchar2      --Fecha de Estado del Expediente
/*069*/  ,pi_v_fec_est_exped_cob_fin             in varchar2      --Fecha de Estado del Expediente
/*070*/  ,pi_v_num_env_arch_ini                  in varchar2      --Nº Envio a Archivo Central
/*071*/  ,pi_v_num_env_arch_fin                  in varchar2      --Nº Envio a Archivo Central
/*072*/  ,pi_v_fec_envi_arch_ini                 in varchar2      --Fecha de Envío a Archivo Central
/*073*/  ,pi_v_fec_envi_arch_fin                 in varchar2      --Fecha de Envío a Archivo Central
/*074*/  ,pi_v_nro_ofic_sunat_ini                in varchar2      --Nº de Oficio de la SUNAT
/*075*/  ,pi_v_nro_ofic_sunat_fin                in varchar2      --Nº de Oficio de la SUNAT
/*076*/  ,pi_n_dere_antiDump_ini                 in NUMBER        --Derechos Antidumping
/*077*/  ,pi_n_dere_antiDump_fin                 in NUMBER        --Derechos Antidumping
/*078*/  ,pi_v_nro_parti_ini                     in varchar2      --Partida Arancelaria
/*079*/  ,pi_v_nro_parti_fin                     in varchar2      --Partida Arancelaria
/*080*/  ,pi_v_nro_dua_ini                       in varchar2      --Nº DUA
/*081*/  ,pi_v_nro_dua_fin                       in varchar2      --Nº DUA
/*082*/  ,pi_v_nro_liq_cob_ini                   in varchar2      --Nº Liquidación de Cobranza
/*083*/  ,pi_v_nro_liq_cob_fin                   in varchar2      --Nº Liquidación de Cobranza
/*084*/  ,pi_v_id_intendencia                    in varchar2      --Intendencia antidumping
/*085*/  ,pi_c_flg_ind_embargo                   in char          --INDICADOR TIENE EMBARGO?
/*086*/  ,pi_v_fec_asig_gestor_ini               in varchar2      --fecha de asignacion de gestor ini
/*087*/  ,pi_v_fec_asig_gestor_fin               in varchar2      --fecha de asignacion de gestor fin
/*088*/  ,pi_v_fec_carta_precoactiva_ini         in varchar2      --fecha de carta precoactiva inicio
/*089*/  ,pi_v_fec_carta_precoactiva_fin         in varchar2      --fecha de carta precoactiva fin
/*090*/  ,pi_v_id_expectativa_cobro              in varchar2      --cadena codigos espectativa de cobro

-----------------------------------------------------------------------------------------------
        --denunciante
/*091*/  ,pi_v_d_codSanciona_ini                 in varchar2      --Código del INDECOPI
/*092*/  ,pi_v_d_codSanciona_fin                 in varchar2      --Código del INDECOPI
/*093*/  ,pi_i_d_tip_persona                     in integer       --Tipo de Personería
/*094*/  ,pi_v_d_razon_social                    in varchar2      --Razón Social
/*095*/  ,pi_v_d_ape_paterno                     in varchar2      --Apellido Paterno
/*096*/  ,pi_v_d_ape_materno                     in varchar2      --Apellido Materno
/*097*/  ,pi_v_d_ape_casada                      in varchar2      --Apellido Casada
/*098*/  ,pi_v_d_pri_nombre                      in varchar2      --Primer nombre
/*099*/  ,pi_v_d_seg_nombre                      in varchar2      --Segundo nombre
/*100*/  ,pi_i_d_tipo_doc                        in integer       --Tipo de Documento
/*101*/  ,pi_v_d_nro_doc                         in varchar2      --Nº de documento de identidad
/*102*/  ,pi_i_d_tip_empresa                     in integer       --Tipo de Empresa
/*103*/  ,pi_n_d_id_sect_econo                   in number        --CIIU (Actividad Economica)
/*104*/  ,pi_c_d_flg_asocu                       in char          --flag asocu
/*105*/  ,pi_c_d_fl_oficio                       in char          --indicador denunciante de oficio=Indecopi
        --denunciado
/*106*/  ,pi_v_do_codSanciona_ini                in varchar2      --Código del INDECOPI
/*107*/  ,pi_v_do_codSanciona_fin                in varchar2      --Código del INDECOPI
/*108*/  ,pi_i_do_tip_persona                    in integer       --Tipo de Personería
/*109*/  ,pi_v_do_razon_social                   in varchar2      --Razón Social
/*110*/  ,pi_v_do_ape_paterno                    in varchar2      --Apellido Paterno
/*111*/  ,pi_v_do_ape_materno                    in varchar2      --Apellido Materno
/*112*/  ,pi_v_do_ape_casada                     in varchar2      --Apellido Casada
/*113*/  ,pi_v_do_pri_nombre                     in varchar2      --Primer nombre
/*114*/  ,pi_v_do_seg_nombre                     in varchar2      --Segundo nombre
/*115*/  ,pi_i_do_tipo_doc                       in integer       --Tipo de Documento
/*116*/  ,pi_v_do_nro_doc                        in varchar2      --Nº de documento de identidad
/*117*/  ,pi_i_do_tip_empresa                    in integer       --Tipo de Empresa
/*118*/  ,pi_n_do_id_sect_econo                  in number        --CIIU (Actividad Economica)
/*119*/  ,pi_c_do_flg_asocu                      in char          --flag asocu
         --sancionado
/*120*/  ,pi_v_s_codSanciona_ini                 in varchar2      --Código del INDECOPI
/*121*/  ,pi_v_s_codSanciona_fin                 in varchar2      --Código del INDECOPI
/*122*/  ,pi_i_s_tip_persona                     in integer       --Tipo de Personería
/*123*/  ,pi_v_s_razon_social                    in varchar2      --Razón Social
/*124*/  ,pi_v_s_ape_paterno                     in varchar2      --Apellido Paterno
/*125*/  ,pi_v_s_ape_materno                     in varchar2      --Apellido Materno
/*126*/  ,pi_v_s_ape_casada                      in varchar2      --Apellido Casada
/*127*/  ,pi_v_s_pri_nombre                      in varchar2      --Primer nombre
/*128*/  ,pi_v_s_seg_nombre                      in varchar2      --Segundo nombre
/*129*/  ,pi_i_s_tipo_doc                        in integer       --Tipo de Documento
/*130*/  ,pi_v_s_nro_doc                         in varchar2      --Nº de documento de identidad
/*131*/  ,pi_i_s_tip_empresa                     in integer       --Tipo de Empresa
/*132*/  ,pi_n_s_id_sect_econo                   in number        --CIIU (Actividad Economica)
/*133*/  ,pi_c_s_flg_asocu                       in char           --flag asocu
--@0002:ini
/*134*/  ,pi_c_s_flg_buscar_by_contenido         in char           --0=NO;1=SI
--@0002:fin
-----------------------------------------------------------------------------------------------
         ,po_cu_retorno                          out cu_rec_set
)is

  c_flg_administrado                           char(1);
  c_flg_sancionado                             char(1);
  c_flg_denunciado                             char(1);
  c_flg_denunciante                            char(1);

  v_sql_admin_select                           varchar2(8000);
  v_sql_admin_where_d                          varchar2(8000);
  v_sql_admin_where_do                         varchar2(8000);
  v_sql_admin_where_s                          varchar2(8000);

  v_sql_select_1                               varchar2(8000);
  v_sql_select_2                               varchar2(8000);
  v_sql_select_3                               varchar2(8000);
  v_sql_select_4                               varchar2(8000);
  v_sql_select_5                               varchar2(8000);
  v_sql_join_1                                 varchar2(8000);
  v_sql_join_2                                 varchar2(8000);
  v_sql_join_3                                 varchar2(8000);
  v_sql_join_4                                 varchar2(8000);
  v_sql_join_5                                 varchar2(8000);
  v_sql_where_1                                varchar2(8000);
  v_sql_where_2                                varchar2(8000);
  v_sql_where_3                                varchar2(8000);
  v_sql_where_4                                varchar2(8000);
  v_sql_where_5                                varchar2(8000);
  v_sql_where_6                                varchar2(8000);
  v_sql_where_7                                varchar2(8000);
  v_sql_where_8                                varchar2(8000);
  v_sql_where_9                                varchar2(8000);
  v_sql_where_10                               varchar2(8000);
  v_sql_where_11                               varchar2(8000);
  v_sql_where_12                               varchar2(8000);
  c_car_porcentaje                             varchar(1);
begin
  --@0002:ini
  c_car_porcentaje := '';
  if pi_c_s_flg_buscar_by_contenido = '1' then c_car_porcentaje := '%'; end if;
  --@0002:fin

  --control del filtro sancionado
  c_flg_administrado := '0';
  c_flg_sancionado := '0';
  c_flg_denunciado := '0';
  c_flg_denunciante := '0';

  v_sql_where_1 := '';
  v_sql_where_2 := '';
  v_sql_where_3 := '';
  v_sql_where_4 := '';
  v_sql_where_5 := '';
  v_sql_where_6 := '';
  v_sql_where_7 := '';
  v_sql_where_8 := '';
  v_sql_where_9 := '';
  v_sql_where_10 := '';
  v_sql_where_11 := '';
  v_sql_where_12 := '';

  IF  pi_v_s_codSanciona_ini is not null or
      pi_v_s_codSanciona_fin is not null or
      pi_i_s_tip_persona <> 0 or
      pi_v_s_razon_social is not null or
      pi_v_s_ape_paterno is not null or
      pi_v_s_ape_materno is not null or
      pi_v_s_ape_casada is not null or
      pi_v_s_pri_nombre is not null or
      pi_v_s_seg_nombre is not null or
      pi_i_s_tipo_doc <> 0 or
      pi_v_s_nro_doc is not null or
      pi_i_s_tip_empresa <> 0 or
      pi_n_s_id_sect_econo <> 0 or
      pi_c_s_flg_asocu<>'0'
  THEN
      c_flg_sancionado := '1';
      if c_flg_administrado = '0' then c_flg_administrado := '1'; end if;
  END IF;

  IF (
      pi_v_do_codSanciona_ini is not null or
      pi_v_do_codSanciona_fin is not null or
      pi_i_do_tip_persona <> 0 or
      pi_v_do_razon_social is not null or
      pi_v_do_ape_paterno is not null or
      pi_v_do_ape_materno is not null or
      pi_v_do_ape_casada is not null or
      pi_v_do_pri_nombre is not null or
      pi_v_do_seg_nombre is not null or
      pi_i_do_tipo_doc <> 0 or
      pi_v_do_nro_doc is not null or
      pi_i_do_tip_empresa <> 0 or
      pi_n_do_id_sect_econo <> 0 or
      pi_c_do_flg_asocu<>'0'
      )
  THEN
      c_flg_denunciado := '1';
      if c_flg_administrado = '0' then c_flg_administrado := '1'; end if;
  END IF;

  IF  (
      pi_v_d_codSanciona_ini is not null or
      pi_v_d_codSanciona_fin is not null or
      pi_i_d_tip_persona <> 0 or
      pi_v_d_razon_social is not null or
      pi_v_d_ape_paterno is not null or
      pi_v_d_ape_materno is not null or
      pi_v_d_ape_casada is not null or
      pi_v_d_pri_nombre is not null or
      pi_v_d_seg_nombre is not null or
      pi_i_d_tipo_doc <> 0 or
      pi_v_d_nro_doc is not null or
      pi_i_d_tip_empresa <> 0 or
      pi_n_d_id_sect_econo <> 0 or
      pi_c_d_flg_asocu<>'0' or
      pi_c_d_fl_oficio<>'0'
      )
  THEN
      c_flg_denunciante := '1';
      if c_flg_administrado = '0' then c_flg_administrado := '1'; end if;
  END IF;

  --obtener los datos de las intancias de una multa
  EXECUTE IMMEDIATE 'TRUNCATE TABLE T_SCOB_TMP_INSTANCIAS_MULTA';
  INSERT INTO T_SCOB_TMP_INSTANCIAS_MULTA(
      ID_MULTA,
      NRO_NIVEL,
      NRO_RESOLUCION,
      FEC_RESOLUCION,
      FEC_NOTIFICACION_RESOLUCION,
      FEC_ESTADO_SGTE_INSTANCIA,
      FEC_REGISTRO,
      LOGIN_USUARIO_REGISTRO
  )(
        SELECT
          MDET.ID_MULTA,
          ORGR.TIPO_INSTANCIA,
          --Req. 30 - @dcelis/begin
          --MDET.NRO_RESOLUCION_ID,
          MDET.NRO_RESOLUCION,
          --Req. 30 - @dcelis/end
          MDET.FEC_RESOLUCION,
          MDET.FEC_NOTIFICACION_RESOLUCION,
          MDET.FEC_ESTADO_SGTE_INSTANCIA,
          TO_DATE(TO_CHAR(MDET.AUDFECCREACION,'DD/MM/YYYY'),'DD/MM/YYYY'),
          MDET.AUDUSUCREACION
        FROM T_SCOB_MULTA_DETAL MDET
        INNER JOIN T_SCOB_ORGANO_RESOLUTIVO ORGR
              ON ORGR.ID_ORGANO_RESOLUTIVO = MDET.ID_ORGANO_RESOLUTIVO
        WHERE MDET.ESTADO = '1'
  );

  --obtener la situacion de pago de las multas
  EXECUTE IMMEDIATE 'TRUNCATE TABLE T_SCOB_TMP_SITUACION_MULTA';
  INSERT INTO T_SCOB_TMP_SITUACION_MULTA(
     ID_MULTA,
     COD_SITUACION_MULTA
  )
  SELECT
    MULT.ID_MULTA,
    CASE
       WHEN EXPE.ESTADO_EXPEDIENTE = 4 THEN 3 --'FR'
       WHEN EXPE.ESTADO_EXPEDIENTE = 5 THEN 4 --'PP'
       WHEN MULT.NRO_FILE_AEC IS NULL THEN 1 --PAGO VOLUNTARIO
       ELSE 2 --PAGO COACTIVO
       --WHEN MULT.IND_DESCUENTO = 1 AND MULT.COD_ESTADO_PAGO IN (4) THEN 1 --'DS'
       --WHEN MULT.NRO_FILE_AEC IS NULL THEN 2 --'MU'--NO TIENE DESCUENTO Y NO HA INGRESADO A COBRANZA
       --ELSE 2--'CO'
    END AS COD_SITUACION_MULTA
  FROM T_SCOB_MULTA MULT
  LEFT JOIN T_SCOB_EXPEDIENTE_MULTA EXMU
       ON EXMU.ID_MULTA = MULT.ID_MULTA
       AND EXMU.ESTADO = '1'
  LEFT JOIN T_SCOB_EXPEDIENTE EXPE
       ON EXPE.ID_EXPEDIENTE = EXMU.ID_EXPEDIENTE
  WHERE MULT.ESTADO = '1';

  -----------------------------------------------------------------------------------
  --obtener los administrados
  -----------------------------------------------------------------------------------
  --3=DENUNCIANTE
  -----------------------------------------------------------------------------------
  /*
  Dbms_Output.put_line('c_flg_administrado--->' || c_flg_administrado);
  Dbms_Output.put_line('c_flg_denunciante--->' || c_flg_denunciante);
  Dbms_Output.put_line('c_flg_sancionado--->' || c_flg_sancionado);
  Dbms_Output.put_line('c_flg_denunciado--->' || c_flg_denunciado);
  */

  EXECUTE IMMEDIATE 'TRUNCATE TABLE T_SCOB_TMP_ADMINISTRADO';
  --obtener a todos los administrados
  if c_flg_administrado = '1' then

      v_sql_admin_select := '
      INSERT INTO T_SCOB_TMP_ADMINISTRADO(
          ID_MULTA, TIPO_ADMINISTRADO, ID_PERSONA
      )
      SELECT
          ADMINISTRADO.ID_MULTA,ADMINISTRADO.TIPO_ADMINISTRADO,PERS.ID_PERSONA
      FROM (
          SELECT MDET.ID_MULTA AS ID_MULTA, ''3'' AS TIPO_ADMINISTRADO, --DENUNCIANTE
                 MDEN.ID_PERSONA  AS ID_PERSONA
          FROM T_SCOB_MULTA_DETAL MDET
          INNER JOIN T_SCOB_MULTA_DENUNCIANTE MDEN
                ON MDEN.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL
                AND MDEN.ESTADO = ''1''
          WHERE MDET.FLG_ACTUAL = ''1'' AND MDET.ESTADO = ''1''
          UNION ALL
          SELECT MDET.ID_MULTA AS ID_MULTA, MSAN.COD_TIPO_PERSONA AS TIPO_ADMINISTRADO, --SANCIONADO Y DENUNCIADO
                 MSAN.ID_PERSONA AS ID_PERSONA
          FROM T_SCOB_MULTA_DETAL MDET
          INNER JOIN T_SCOB_MULTA_SANCIONADO MSAN
                ON MSAN.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL
                AND MSAN.ESTADO = ''1''
          WHERE MDET.FLG_ACTUAL = ''1'' AND MDET.ESTADO = ''1''
      )ADMINISTRADO
      INNER JOIN T_SCOB_PERSONA PERS ON PERS.ID_PERSONA = ADMINISTRADO.ID_PERSONA
      ';

      v_sql_admin_where_d := '
      WHERE ADMINISTRADO.ID_MULTA IS NOT NULL ';

      IF c_flg_denunciante = '1' THEN

      v_sql_admin_where_d := v_sql_admin_where_d ||
      '
      AND (ADMINISTRADO.TIPO_ADMINISTRADO = ''3'' --denunciante
      ';

          --CODIGO INDECOPI
          if pi_v_d_codSanciona_ini is not null then
             v_sql_admin_where_d := v_sql_admin_where_d ||
             '
             AND TO_NUMBER(PERS.COD_SANCIONADO) BETWEEN TO_NUMBER('||pi_v_d_codSanciona_ini||') AND TO_NUMBER('||pi_v_d_codSanciona_fin||')'
             ;

          end if;

          --TIPO PERSONERIA
          if pi_i_d_tip_persona<>0 then
             v_sql_admin_where_d := v_sql_admin_where_d ||
             '
             AND PERS.TIPO_PERSONA='||pi_i_d_tip_persona
             ;
          end if;

          --TIPO DOCUMENTO
          if pi_i_d_tipo_doc<>0 then
             v_sql_admin_where_d := v_sql_admin_where_d ||
             '
             AND PERS.TIPO_DOC='||pi_i_d_tipo_doc
             ;
          end if;

          --NRO DOCUMENTO
          if pi_v_d_nro_doc is not null then
             v_sql_admin_where_d := v_sql_admin_where_d ||
             '
             AND PERS.NRO_DOC='''||pi_v_d_nro_doc||''''
             ;
          end if;

          --APELLIDOS Y NOMBRES
          if pi_v_d_ape_paterno is not null then
             v_sql_admin_where_d := v_sql_admin_where_d ||
             '
             AND PERS.APE_PATERNO LIKE '''||c_car_porcentaje||pi_v_d_ape_paterno||'%'''
             ;
          end if;

          if pi_v_d_ape_materno is not null then
             v_sql_admin_where_d := v_sql_admin_where_d ||
             '
             AND PERS.APE_MATERNO LIKE '''||c_car_porcentaje||pi_v_d_ape_materno||'%'''
             ;
          end if;

          if pi_v_d_ape_casada is not null then
             v_sql_admin_where_d := v_sql_admin_where_d ||
             '
             AND PERS.APE_CASADA LIKE '''||c_car_porcentaje||pi_v_d_ape_casada||'%'''
             ;
          end if;

          if pi_v_d_pri_nombre is not null then
             v_sql_admin_where_d := v_sql_admin_where_d ||
             '
             AND PERS.PRI_NOMBRE LIKE '''||c_car_porcentaje||pi_v_d_pri_nombre||'%'''
             ;
          end if;

          if pi_v_d_seg_nombre is not null then
             v_sql_admin_where_d := v_sql_admin_where_d ||
             '
             AND PERS.SEG_NOMBRE LIKE '''||c_car_porcentaje||pi_v_d_seg_nombre||'%'''
             ;
          end if;

          --DENOMINACION O RAZON SOCIAL
          if pi_v_d_razon_social is not null then
             v_sql_admin_where_d := v_sql_admin_where_d ||
             '
             AND PERS.RAZON_SOCIAL LIKE '''||c_car_porcentaje||pi_v_d_razon_social ||'%'''
             ;
          end if;

          --TIPO DE EMPRESA
          if pi_i_d_tip_empresa<>0 then
             v_sql_admin_where_d := v_sql_admin_where_d ||
             '
             AND PERS.TIP_EMPRESA=' ||pi_i_d_tip_empresa
             ;
          end if;

          --SECTOR ECONOMICO
          if pi_n_d_id_sect_econo<>0 then
             v_sql_admin_where_d := v_sql_admin_where_d ||
             '
             AND PERS.ID_SECTOR_ECONOMICO='||pi_n_d_id_sect_econo
             ;
          end if;

          --INDICADOR DENUNCIANTE DE OFICIO = INDECOPI
          if pi_c_d_fl_oficio='1' then
             v_sql_admin_where_d := v_sql_admin_where_d ||
             '
             AND PERS.ID_PERSONA='||SCOB_PK_CONSTANTES.C_ID_ADMINISTRADO_INDECOPI;
          end if;




      v_sql_admin_where_d := v_sql_admin_where_d || '
      )';

      END IF;

      IF c_flg_denunciado = '1' THEN
          if  c_flg_denunciante = '1' then
              v_sql_admin_where_do :=
              '
              OR(ADMINISTRADO.TIPO_ADMINISTRADO = ''2'' --denunciado';
          else
              v_sql_admin_where_do :=
              '
              AND(ADMINISTRADO.TIPO_ADMINISTRADO = ''2'' --denunciado';
          end if;

          --CODIGO INDECOPI
          if pi_v_d_codSanciona_ini is not null then
             v_sql_admin_where_do := v_sql_admin_where_do ||
             '
             AND TO_NUMBER(PERS.COD_SANCIONADO) BETWEEN TO_NUMBER('||pi_v_do_codSanciona_ini||') AND TO_NUMBER('||pi_v_do_codSanciona_fin||')'
             ;
          end if;

          --TIPO PERSONERIA
          if pi_i_do_tip_persona<>0 then
             v_sql_admin_where_do := v_sql_admin_where_do ||
             '
             AND PERS.TIPO_PERSONA='||pi_i_do_tip_persona
             ;
          end if;

          --TIPO DOCUMENTO
          if pi_i_do_tipo_doc<>0 then
             v_sql_admin_where_do := v_sql_admin_where_do ||
             '
             AND PERS.TIPO_DOC='||pi_i_do_tipo_doc
             ;
          end if;

          --NRO DOCUMENTO
          if pi_v_do_nro_doc is not null then
             v_sql_admin_where_do := v_sql_admin_where_do ||
             '
             AND PERS.NRO_DOC='''||pi_v_do_nro_doc||''''
             ;
          end if;

          --APELLIDOS Y NOMBRES
          if pi_v_do_ape_paterno is not null then
             v_sql_admin_where_do := v_sql_admin_where_do ||
             '
             AND PERS.APE_PATERNO LIKE '''||c_car_porcentaje||pi_v_do_ape_paterno||'%'''
             ;
          end if;

          if pi_v_do_ape_materno is not null then
             v_sql_admin_where_do := v_sql_admin_where_do ||
             '
             AND PERS.APE_MATERNO LIKE '''||c_car_porcentaje||pi_v_do_ape_materno||'%'''
             ;
          end if;

          if pi_v_do_ape_casada is not null then
             v_sql_admin_where_do := v_sql_admin_where_do ||
             '
             AND PERS.APE_CASADA LIKE '''||c_car_porcentaje||pi_v_do_ape_casada||'%'''
             ;
          end if;

          if pi_v_do_pri_nombre is not null then
             v_sql_admin_where_do := v_sql_admin_where_do ||
             '
             AND PERS.PRI_NOMBRE LIKE '''||c_car_porcentaje||pi_v_do_pri_nombre||'%'''
             ;
          end if;

          if pi_v_do_seg_nombre is not null then
             v_sql_admin_where_do := v_sql_admin_where_do ||
             '
             AND PERS.SEG_NOMBRE LIKE '''||c_car_porcentaje||pi_v_do_seg_nombre||'%'''
             ;
          end if;

          --DENOMINACION O RAZON SOCIAL
          if pi_v_do_razon_social is not null then
             v_sql_admin_where_do := v_sql_admin_where_do ||
             '
             AND PERS.RAZON_SOCIAL LIKE '''||c_car_porcentaje||pi_v_do_razon_social ||'%'''
             ;
          end if;

          --TIPO DE EMPRESA
          if pi_i_do_tip_empresa<>0 then
             v_sql_admin_where_do := v_sql_admin_where_do ||
             '
             AND PERS.TIP_EMPRESA=' ||pi_i_do_tip_empresa
             ;
          end if;

          --SECTOR ECONOMICO
          if pi_n_do_id_sect_econo<>0 then
             v_sql_admin_where_do := v_sql_admin_where_do ||
             '
             AND PERS.ID_SECTOR_ECONOMICO='||pi_n_do_id_sect_econo
             ;
          end if;

          if pi_c_do_flg_asocu='1' then
             v_sql_admin_where_do := v_sql_admin_where_do ||
             '
             AND PERS.FLG_ASOCU='''||pi_c_do_flg_asocu||''''
             ;
          end if;

          v_sql_admin_where_do := v_sql_admin_where_do ||'
          )';
      END IF;

      IF c_flg_sancionado = '1' THEN
          if  c_flg_denunciado = '1' or c_flg_denunciante = '1' then
              v_sql_admin_where_s :=
              '
              OR(ADMINISTRADO.TIPO_ADMINISTRADO = ''1'' --sancionado';
          else
              v_sql_admin_where_s :=
              '
              AND(ADMINISTRADO.TIPO_ADMINISTRADO = ''1'' --sancionado';
          end if;

          --CODIGO INDECOPI
          if pi_v_s_codSanciona_ini is not null then
             v_sql_admin_where_s := v_sql_admin_where_s ||
             '
             AND TO_NUMBER(PERS.COD_SANCIONADO) BETWEEN TO_NUMBER('||pi_v_s_codSanciona_ini||') AND TO_NUMBER('||pi_v_s_codSanciona_fin||')'
             ;
          end if;

          --TIPO PERSONERIA
          if pi_i_s_tip_persona<>0 then
             v_sql_admin_where_s := v_sql_admin_where_s ||
             '
             AND PERS.TIPO_PERSONA='||pi_i_s_tip_persona
             ;
          end if;

          --TIPO DOCUMENTO
          if pi_i_s_tipo_doc<>0 then
             v_sql_admin_where_s := v_sql_admin_where_s ||
             '
             AND PERS.TIPO_DOC='||pi_i_s_tipo_doc
             ;
          end if;

          --NRO DOCUMENTO
          if pi_v_s_nro_doc is not null then
             v_sql_admin_where_s := v_sql_admin_where_s ||
             '
             AND PERS.NRO_DOC='''||pi_v_s_nro_doc||''''
             ;
          end if;

          --APELLIDOS Y NOMBRES
          if pi_v_s_ape_paterno is not null then
             v_sql_admin_where_s := v_sql_admin_where_s ||
             '
             AND PERS.APE_PATERNO LIKE '''||c_car_porcentaje||pi_v_s_ape_paterno||'%'''
             ;
          end if;

          if pi_v_s_ape_materno is not null then
             v_sql_admin_where_s := v_sql_admin_where_s ||
             '
             AND PERS.APE_MATERNO LIKE '''||c_car_porcentaje||pi_v_s_ape_materno||'%'''
             ;
          end if;

          if pi_v_s_ape_casada is not null then
             v_sql_admin_where_s := v_sql_admin_where_s ||
             '
             AND PERS.APE_CASADA LIKE '''||c_car_porcentaje||pi_v_s_ape_casada||'%'''
             ;
          end if;

          if pi_v_s_pri_nombre is not null then
             v_sql_admin_where_s := v_sql_admin_where_s ||
             '
             AND PERS.PRI_NOMBRE LIKE '''||c_car_porcentaje||pi_v_s_pri_nombre||'%'''
             ;
          end if;

          if pi_v_s_seg_nombre is not null then
             v_sql_admin_where_s := v_sql_admin_where_s ||
             '
             AND PERS.SEG_NOMBRE LIKE '''||c_car_porcentaje||pi_v_s_seg_nombre||'%'''
             ;
          end if;

          --DENOMINACION O RAZON SOCIAL
          if pi_v_s_razon_social is not null then
             v_sql_admin_where_s := v_sql_admin_where_s ||
             '
             AND PERS.RAZON_SOCIAL LIKE '''||c_car_porcentaje||pi_v_s_razon_social ||'%'''
             ;
          end if;

          --TIPO DE EMPRESA
          if pi_i_s_tip_empresa<>0 then
             v_sql_admin_where_s := v_sql_admin_where_s ||
             '
             AND PERS.TIP_EMPRESA=' ||pi_i_s_tip_empresa
             ;
          end if;

          --SECTOR ECONOMICO
          if pi_n_s_id_sect_econo<>0 then
             v_sql_admin_where_s := v_sql_admin_where_s ||
             '
             AND PERS.ID_SECTOR_ECONOMICO='||pi_n_s_id_sect_econo
             ;
          end if;

          if pi_c_s_flg_asocu='1' then
             v_sql_admin_where_s := v_sql_admin_where_s ||
             '
             AND PERS.FLG_ASOCU='''||pi_c_s_flg_asocu||''''
             ;
          end if;

          v_sql_admin_where_s := v_sql_admin_where_s ||'
          )';
      END IF;

      DBMS_OUTPUT.put_line(v_sql_admin_select);
      DBMS_OUTPUT.put_line(v_sql_admin_where_d);
      DBMS_OUTPUT.put_line(v_sql_admin_where_do);
      DBMS_OUTPUT.put_line(v_sql_admin_where_s);

      EXECUTE IMMEDIATE v_sql_admin_select || v_sql_admin_where_d || v_sql_admin_where_do || v_sql_admin_where_s;

  end if;

  IF c_flg_administrado = '0' THEN
      INSERT INTO T_SCOB_TMP_ADMINISTRADO(ID_MULTA)
      VALUES('0');
  END IF;


  --mostrar los datos de la consulta
  v_sql_select_1 := '
  SELECT
    ROWNUM AS NRO_REG,
    MULT.ID_MULTA AS ID_MULTA,
    MULT.ANIO || MULT.CUM AS CUM,
    --DECODE(SCOB_PK_EXPEDIENTE.SCOB_FN_ES_ACUM(EXPE.ID_EXPEDIENTE),NULL,'''',SCOB_PK_EXPEDIENTE.SCOB_FN_CUM_ALFA(EXPE.ID_EXPEDIENTE)) AS V_ACUM,
    SCOB_PK_EXPEDIENTE.SCOB_FN_ES_CUM_ALFA(MULT.ID_MULTA) AS V_ACUM,
    SCOB_PK_EXPEDIENTE.SCOB_FN_ES_ACUM(EXPE.ID_EXPEDIENTE) AS ES_ACUM,
    EXPE.ID_EXPEDIENTE AS ID_EXPEDIENTE,
    MULT.FEC_INGRESO AS FEC_GENERACION_CUM,
    TIPO_PROC.DESCRIPCION AS NOM_TIPO_PROCEDEMIENTO,
    ORGR.CODIGO AS COD_ORGANO_RESOLUTIVO,
    ORGR.DESCRIPCION AS NOM_ORGANO_RESOLUTIVO,
    SEDE.CODIGO AS COD_SEDE,
    SEDE.DESCRIPCION AS NOM_SEDE,
    MATE.DESCRIPCION AS NOM_MATERIA,
    SUBM.DESCRIPCION AS NOM_SUB_MATERIA,
    MULT.NRO_EXP_ADMINISTRATIVO AS NRO_EXPEDIENTE_UNICO,
    MDET.NRO_EXP_NIVEL AS NRO_EXPEDIENTE_ADMINISTRATIVO,
    --PRIMERA INSTANCIA
    NIVEL1.NRO_RESOLUCION AS NRO_RESOL_OR, --num_resolu
    NIVEL1.FEC_REGISTRO AS FEC_REG_OR,
    NIVEL1.FEC_RESOLUCION AS FEC_EMI_RESOL_OR, --fec_emision
    NIVEL1.FEC_NOTIFICACION_RESOLUCION AS FEC_NOTIF_RESOL_OR, --fec_notifica
    NIVEL1.FEC_ESTADO_SGTE_INSTANCIA AS FEC_APELACION,
    NIVEL1.LOGIN_USUARIO_REGISTRO AS USU_REG_OR,
    SCOB_PK_CONSULTA.SCOB_FN_DATA_CONS_AVANZADA(1,MULT.ID_MULTA,1,NULL,''VALOR_UIT'') AS UIT_NIVEL1,
    SCOB_PK_CONSULTA.SCOB_FN_DATA_CONS_AVANZADA(1,MULT.ID_MULTA,1,NULL,''FEC_DECLARACION'') AS FEC_DECLARACION_NIVEL1,
    SCOB_PK_CONSULTA.SCOB_FN_DATA_CONS_AVANZADA(2,MULT.ID_MULTA,1,NIVEL1.NRO_NIVEL,''AUDFECCREACION'') AS F_REGISTRO_NIVEL1,
    --scob_pk_utilitario.scob_fn_dias_laborables_neg(to_char(NIVEL1.FEC_RESOLUCION,''DD/MM/YYYY''),to_char(NIVEL1.FEC_REGISTRO,''DD/MM/YYYY'')) AS CANTIDAD_OR,
    scob_pk_utilitario.SCOB_FN_DIAS_LAB_NEG_BY_OR(to_char(NIVEL1.FEC_RESOLUCION,''DD/MM/YYYY''),to_char(NIVEL1.FEC_REGISTRO,''DD/MM/YYYY''),MDET.ID_ORGANO_RESOLUTIVO,'||SCOB_PK_CONSTANTES.C_NU_X_OR||') AS CANTIDAD_OR,';
  v_sql_select_2 :=
    '--SEGUNDA INSTANCIA
    NIVEL2.NRO_RESOLUCION AS NRO_RESOL_COMISION,
    NIVEL2.FEC_REGISTRO AS FEC_REG_COMISION,
    NIVEL2.FEC_RESOLUCION AS FEC_RESOL_COMISION,
    NIVEL2.FEC_NOTIFICACION_RESOLUCION AS FEC_NOTIF_RESOL_COMISION,
    NIVEL2.FEC_ESTADO_SGTE_INSTANCIA AS FEC_REVISION,
    NIVEL2.LOGIN_USUARIO_REGISTRO AS USU_REG_COMISION,
    SCOB_PK_CONSULTA.SCOB_FN_DATA_CONS_AVANZADA(1,MULT.ID_MULTA,2,NULL,''VALOR_UIT'') AS UIT_NIVEL2,
    SCOB_PK_CONSULTA.SCOB_FN_DATA_CONS_AVANZADA(1,MULT.ID_MULTA,2,NULL,''FEC_DECLARACION'') AS FEC_DECLARACION_NIVEL2,
    SCOB_PK_CONSULTA.SCOB_FN_DATA_CONS_AVANZADA(2,MULT.ID_MULTA,2,NIVEL2.NRO_NIVEL,''AUDFECCREACION'') AS F_REGISTRO_NIVEL2,
    --scob_pk_utilitario.scob_fn_dias_laborables_neg(to_char(NIVEL2.FEC_RESOLUCION,''DD/MM/YYYY''),to_char(NIVEL2.FEC_REGISTRO,''DD/MM/YYYY'')) AS CANTIDAD_COMISION,
    scob_pk_utilitario.SCOB_FN_DIAS_LAB_NEG_BY_OR(to_char(NIVEL2.FEC_RESOLUCION,''DD/MM/YYYY''),to_char(NIVEL2.FEC_REGISTRO,''DD/MM/YYYY''),MDET.ID_ORGANO_RESOLUTIVO,'||SCOB_PK_CONSTANTES.C_NU_X_OR||') AS CANTIDAD_COMISION,
    --TERCERA INSTANCIA
    NIVEL3.NRO_RESOLUCION AS NRO_RESOL_SALA,
    NIVEL3.FEC_REGISTRO AS FEC_REG_SALA,
    NIVEL3.FEC_RESOLUCION  AS FEC_RESOL_SALA,
    NIVEL3.FEC_NOTIFICACION_RESOLUCION AS FEC_NOTIF_RESOL_SALA,
    NIVEL3.LOGIN_USUARIO_REGISTRO AS USU_REG_SALA,
    SCOB_PK_CONSULTA.SCOB_FN_DATA_CONS_AVANZADA(1,MULT.ID_MULTA,3,NULL,''VALOR_UIT'') AS UIT_NIVEL3,
    SCOB_PK_CONSULTA.SCOB_FN_DATA_CONS_AVANZADA(2,MULT.ID_MULTA,3,NIVEL3.NRO_NIVEL,''AUDFECCREACION'') AS F_REGISTRO_NIVEL3,
    --scob_pk_utilitario.scob_fn_dias_laborables_neg(to_char(NIVEL3.FEC_RESOLUCION,''DD/MM/YYYY''),to_char(NIVEL3.FEC_REGISTRO,''DD/MM/YYYY'')) AS CANTIDAD_SALA,
    scob_pk_utilitario.SCOB_FN_DIAS_LAB_NEG_BY_OR(to_char(NIVEL3.FEC_RESOLUCION,''DD/MM/YYYY''),to_char(NIVEL3.FEC_REGISTRO,''DD/MM/YYYY''),MDET.ID_ORGANO_RESOLUTIVO,'||SCOB_PK_CONSTANTES.C_NU_X_OR||') AS CANTIDAD_SALA,
    ------------------------------------------------------
    ';
  v_sql_select_3 :=
    'TIPO_MULTA.TXT_DESCRIPCION AS NOM_TIPO_MULTA, --tipo_multa
    scob_pk_expediente.SCOB_FN_DENUNCIANTES_MULTA(mdet.id_multa,0) AS NOM_DENUNCIANTE, --denunciante
    scob_pk_expediente.SCOB_FN_DENUNCIADOS_MULTA(mdet.id_multa,0) AS NOM_DENUNCIADO, --denunciado
    scob_pk_expediente.SCOB_FN_SANCIONADOS_MULTA(mdet.id_multa,0) AS NOM_SANCIONADO, --sancionado
    scob_pk_expediente.SCOB_FN_SANCIONADOS_TIPO_DOC(mdet.id_multa,0) AS NOM_TIPO_DOC_SANCIONADO,
    scob_pk_expediente.SCOB_FN_SANCIONADOS_NRO_DOC(mdet.id_multa,0) AS NRO_TIPO_DOC_SANCIONADO,
    scob_pk_expediente.SCOB_FN_SANCIONADOS_COD_INDEC(mdet.id_multa,0) AS COD_INDECOPI_SANCIONADO,
    scob_pk_expediente.SCOB_FN_SANCIONADOS_CLAS_INDEC(mdet.id_multa,0) AS CLASIF_SANCIONADO,
    scob_pk_expediente.SCOB_FN_SANCIONADOS_CIIU(mult.id_multa,0) CIIU_SANCIONADO, --act_economica
    DECODE(NVL(MDET.POR_ASOCU,''0''),''0'',''No'',''Si'') AS IND_ASOCU,
    NVL(MDET.POR_ASOCU,0) AS PORCENTAJE_ASOCU,
    --CAMPOS ANTIDUMPING
    MUAN.TIPO_CAMBIO AS TIPO_CAMBIO_DA,
    MUAN.MONTO_ANTIDUMPING AS DERECHO_ANTIDUMPING,
    MUAN.MONTO_INTERES AS MONTO_DA_IC,
    MUAN.MONTO_INTERES_MORATORIO AS MONTO_DA_IM,
    --
    MUAN.NRO_OFICIO_SUNAT_CODIGO || MUAN.NRO_OFICIO_SUNAT_ANIO || MUAN.NRO_OFICIO_SUNAT_PREFIJO || MUAN.NRO_OFICIO_SUNAT_CORRELATIVO AS NRO_OFICIO_SUNAT,
    NRO_LIQUIDACION_CODIGO ||NRO_LIQUIDACION_ANIO || NRO_LIQUIDACION_CORRELATIVO AS NRO_LIQUIDACION_COBRANZA,
    PART.CODIGO AS COD_PARTIDA,
    PART.DESCRIPCION AS NOM_PARTIDA,
    --NO EXISTE EL CAMPO MEMO EN LA INTERFAZ DE ANTIDUMPING
    NRO_DUA_CODIGO || NRO_DUA_ANIO || NRO_DUA_CORRELATIVO AS NRO_DUA,
    MUAN.ID_INTENDENCIA AS COD_INTENDENCIA,
    INTE.DESCRIPCION AS NOM_INTENDENCIA,

    --DECODE(MUAN.NRO_LIQUIDACION_CODIGO,NULL,'''',MUAN.NRO_LIQUIDACION_CODIGO ||''-''|| MUAN.NRO_LIQUIDACION_ANIO ||''/''|| MUAN.NRO_LIQUIDACION_CORRELATIVO) AS NRO_LIQUIDACION_COBRANZA2,
    DECODE(MATE.CODIGO,11,DECODE(SUBM.CODIGO,21,MUAN.NRO_LIQUIDACION_CODIGO ||''-''|| MUAN.NRO_LIQUIDACION_ANIO ||''/''|| MUAN.NRO_LIQUIDACION_CORRELATIVO,''''),'''') AS NRO_LIQUIDACION_COBRANZA2,
    DECODE(MATE.CODIGO,11,DECODE(SUBM.CODIGO,21,TO_CHAR(NIVEL2.FEC_NOTIFICACION_RESOLUCION,''DD/MM/YYYY''),''''),'''') AS FECH_NOT_SUNAT,
    --'''' AS FECH_NOT_SUNAT,
    --MUAN.MONTO_ANTIDUMPING AS MONTO_ANTIDUMPING,
    DECODE(MATE.CODIGO,11,DECODE(SUBM.CODIGO,21,MUAN.NRO_DUA_CODIGO ||''-''|| MUAN.NRO_DUA_ANIO ||''-''|| MUAN.NRO_DUA_CORRELATIVO,''''),'''') AS NRO_DUA2,
    --DECODE(MUAN.NRO_DUA_CODIGO,NULL,'''',MUAN.NRO_DUA_CODIGO ||''-''|| MUAN.NRO_DUA_ANIO ||''-''|| MUAN.NRO_DUA_CORRELATIVO) AS NRO_DUA2,
    DECODE(MATE.CODIGO,11,DECODE(SUBM.CODIGO,21,PART.CODIGO||''-''||PART.DESCRIPCION,''''),'''') AS NOM_PARTIDA2,
    --PART.CODIGO||''-''||PART.DESCRIPCION AS NOM_PARTIDA2,
    --INTE.DESCRIPCION AS DESC_INTENDENCIA,
    --FIN CAMPOS ANTIDUMPING
    -----------------------------------
  ';
  v_sql_select_4 :=
   'NVL(MDET.VALOR_UIT,0) AS VALOR_UIT,
    MULT.MONTO_UIT AS MONTO_UIT,
    MULT.MONTO_INTERES AS MONTO_IC,
    MULT.MONTO_INTERES_MORATORIO AS MONTO_INTERES_IM,
    MULT.MONTO_COSTAS AS MONTO_COSTAS,
    --
    MULT.TOTAL_AMORTIZADO AS TOTAL_AMORTIZADO,
    MULT.TOTAL_AMORTIZADO_IC AS TOTAL_AMORTIZADO_IC,
    MULT.TOTAL_AMORTIZADO_IM AS TOTAL_AMORTIZADO_IM,
    MULT.TOTAL_AMORTIZADO_COSTAS AS TOTAL_AMORTIZADO_COSTAS,
    --
    MULT.SALDO AS SALDO, --saldo_capital
    MULT.SALDO_IC AS SALDO_IC,
    MULT.SALDO_IM AS SALDO_IM,
    MULT.SALDO_COSTAS AS SALDO_COSTAS,
    EST_MULTA_OR.TXT_DESCRIPCION AS NOM_ESTADO_MULTA_OR, --est_multa_resolu
    EST_DEUDA.TXT_DESCRIPCION AS NOM_ESTADO_PAGO, --est_pago_multa
    DECODE(MULT.COD_ESTADO_PAGO,''4'',MULT.PORCENTAJE_DESCUENTO,NULL) AS POR_DSCTO_PAGO, --porcen_dscto_pago
    MULT.FEC_GENERACION_SEC AS FEC_GENERACION_SEC, --fec_gene_sec
    MULT.ANIO_FILE_AEC AS ANIO_FILE_AEC, --anio_file
    MULT.FEC_INGRESO_AEC AS FEC_RECEPCION_FILE,
    ARCO.CODIGO || MULT.NRO_FILE_AEC AS NRO_FILE_AEC, --nro_file
    CASE
      WHEN EXPE.ID_EXPEDIENTE IS NOT NULL
      THEN SCOB_PK_EXPEDIENTE.SCOB_FN_NRO_FILE_CUM_ALFA(EXPE.ID_EXPEDIENTE,1)
      ELSE SCOB_PK_EXPEDIENTE.SCOB_FN_NRO_FILE_CUM_ALFA(MULT.ID_MULTA,2)
    END AS NRO_FILE_CUM_ALFA,
    MCOB.NRO_INGRESO AS NRO_INGRESO_AEC,
    EST_MULTA_COB.TXT_DESCRIPCION AS NOM_ESTADO_MULTA_COB,
    DECODE(MOTIVO_MULT.ID_MOTIVO,0,NULL,MOTIVO_MULT.DESCRIPCION) AS NOM_MOTIVO_MULTA, --moti_multacobra
    MULT.FEC_ULT_IMPROCEDENCIA AS FEC_ULT_OBSERVACION_AEC,
  ';
  v_sql_select_5 :=
    'MULT.FEC_INGRESO_FILE  AS FEC_ULT_INGRESO_AEC,
    EXPE.ANIO||EXPE.NRO_EXPEDIENTE AS NRO_EXPED_COB, --nro_expe_cobranza
    EXPE.FEC_INGRESO AS FEC_GENERACION_EXPED_COB, --fec_gen_exp_cobran
    USUA.USUARIO AS USU_GESTOR_COBRANZA, --gestor_cobranza
    MULT.FECHA_ASIG_COBRANZA AS FEC_ASIG_GESTOR_COBRANZA,
    MULT.FEC_ULT_GEN_PRECOACTIVA AS FEC_ULT_GEN_PRECOACTIVA,
    MULT.FEC_EMISION_REC AS FEC_EMISION_REC, --fec_emision_REC
    MULT.FEC_NOTIF_REC AS FEC_NOTIF_REC, --fec_notifi_REC
    DECODE(NVL(EXPE.FLG_EMBARGO,''0''),''0'',''No'', ''Si'') AS IND_EMBARGO,
    EST_EXP.DESCRIPCION AS NOM_ESTADO_EXPED_COB, --est_exp_cobranza
    MOTIVO_EXPE.DESCRIPCION AS NOM_MOTIVO_EXPED_COB, --moti_exp_cobranza
    EXPE.FEC_ESTADO_EXPEDIENTE AS FEC_ULT_ESTADO_EXPED_COB, --fec_est_exp_cobran
    SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES('||SCOB_PK_CONSTANTES.C_TBL_ESPECTATIVA_COBRO_EXPCOB||',EXPE.COD_EXPECTATIVA_COBRO) AS NOM_EXPECTATIVA_COBRO,
    scob_pk_expediente.SCOB_FN_SANCIONADOS_REGION(mdet.id_multa,0) AS REGION_SANCIONADO,

    DECODE(EXPE.ID_EXPEDIENTE,NULL,MULT.FEC_ENVIO_RIESGO,MULT.FEC_ENVIO_RIESGO_EXP) AS FEC_MARCA_ENVIO_INFOCORP, --(FECHA EN QUE "MARCA" PARA ENVIAR A INFOCORP)
    ARCH_CEN.NRO_ORDEN AS NRO_ENVIO_ARCHIVO, --nro_envarch_central
    ARCH_CEN.FEC_ENVIO AS FEC_ENVIO_ARCHIVO, --fec_envarch_central
    (CASE
      WHEN MULT.ESTADO_ENVIO_ARCHIVO = 2 THEN ''ARCHIVO CENTRAL''
      WHEN MULT.ESTADO_MULTA IN (9,10,11,12,13) THEN ''AEC''
      ELSE '' '' END) AS UBI_FISICA_EXPEDIENTE,
    SIT_MULTA.COD_SITUACION_MULTA AS COD_SITUACION_MULTA,

    TIPO_PROC.Codigo   AS vc_cod_tipoproc,
    MATE.CODIGO        AS VC_COD_MATERIA,
    SUBM.CODIGO        AS VC_COD_SUBMATERIA,
    EST_MULTA_OR.COD_INTERNO  AS VC_COD_EST_MULTA,
    EST_DEUDA.COD_INTERNO     AS VC_COD_EST_PAGO,
    EST_MULTA_COB.COD_INTERNO AS VC_COD_EST_MULTA_COB,
    EST_EXP.CODIGO            AS VC_CODIGO_EST_EXP,
    MOTIVO_EXPE.CODIGO        AS VC_COD_MOTIVO_EXPED_COB,
    NULL               AS VC_CODIGO_CLASIFICACION,
    NULL               AS VC_CODIGO_CIIU,
    (CASE WHEN EXPE.ESTADO_EXPEDIENTE = 4 THEN
     ''FR'' ELSE ''NF'' END) AS VC_TIPO_MULTA,
    scob_pk_consulta.fn_getReso_gaf_aprueba(EXPE.id_expediente) AS vc_reso_gaf_APRUEBA,
    scob_pk_consulta.fn_getFecReso_gaf_aprueba(EXPE.id_expediente) AS vc_FEC_reso_gaf_APRUEBA,
    scob_pk_consulta.fn_getReso_gaf_perdida(EXPE.id_expediente) AS vc_reso_gaf_PERDIDA,
    scob_pk_consulta.fn_getFecReso_gaf_perdida(EXPE.id_expediente) AS vc_FEC_reso_gaf_PERDIDA,
    scob_pk_consulta.SCOB_FN_COD_DENUNCIANTES_MULTA(mdet.id_multa,0) AS VC_NRO_DOC_DENUNCIANTE,
    DECODE(MULT.COD_MOTIVO, 0, NULL, MULT.COD_MOTIVO) AS VC_COD_MOTIVO_MULTA_COB,
    scob_pk_consulta.SCOB_FN_CENTRO_DE_COSTO(MULT.ID_MULTA) AS VC_COD_CENTRO_COSTO ';


  --JOINS
  v_sql_join_1 := '
  FROM T_SCOB_MULTA MULT
  INNER JOIN T_SCOB_MULTA_DETAL MDET
       ON MDET.ID_MULTA = MULT.ID_MULTA
       AND MDET.FLG_ACTUAL = ''1''
       AND MDET.ESTADO = ''1''
  INNER JOIN (
    SELECT DISTINCT ID_MULTA AS ID_MULTA
    FROM T_SCOB_TMP_ADMINISTRADO
  ) ADMINISTRADO
  ON (
     ('||c_flg_administrado||' = ''0'' AND ''0''=ADMINISTRADO.ID_MULTA)OR
     ('||c_flg_administrado||' <> ''0'' AND ADMINISTRADO.ID_MULTA = MULT.ID_MULTA)
  )
  INNER JOIN T_SCOB_TMP_SITUACION_MULTA SIT_MULTA
        ON SIT_MULTA.ID_MULTA = MULT.ID_MULTA
  INNER JOIN T_SCOB_MATERIA MATE
       ON MATE.ID_MATERIA = MULT.ID_MATERIA
  INNER JOIN T_SCOB_TIPO_PROCEDIMIENTO TIPO_PROC
       ON TIPO_PROC.ID_TIPO_PROCEDIMIENTO = MATE.ID_TIPO_PROCEDIMIENTO
  INNER JOIN T_SCOB_SUBMATERIA SUBM
       ON SUBM.ID_SUBMATERIA = MULT.ID_SUB_MATERIA
  INNER JOIN T_SCOB_ORGANO_RESOLUTIVO ORGR
       ON ORGR.ID_ORGANO_RESOLUTIVO = MDET.ID_ORGANO_RESOLUTIVO
  INNER JOIN T_SCOB_UBIGEO UBIG_ORGR
       ON UBIG_ORGR.COD_DPTO = ORGR.COD_DPTO
       AND UBIG_ORGR.COD_PROV = ORGR.COD_PROV
       AND UBIG_ORGR.COD_DIST = ORGR.COD_DIST
  INNER JOIN T_SCOB_SEDE SEDE
       ON SEDE.ID_SEDE = MULT.ID_SEDE
  INNER JOIN T_SCOB_UBIGEO UBIG_SEDE
       ON UBIG_SEDE.COD_DPTO = SEDE.COD_DPTO
       AND UBIG_SEDE.COD_PROV = SEDE.COD_PROV
       AND UBIG_SEDE.COD_DIST = SEDE.COD_DIST
  INNER JOIN T_SCOB_TABLA_DET TIPO_MULTA
        ON TIPO_MULTA.ID_TABLA = 45 --TIPO MULTA
        AND TO_NUMBER(TIPO_MULTA.COD_INTERNO) = TO_NUMBER(MULT.FLG_TIPO_MULTA)
  INNER JOIN T_SCOB_TABLA_DET EST_DEUDA
        ON EST_DEUDA.ID_TABLA = 34 --ESTADO DEUDA PAGO
        AND TO_NUMBER(EST_DEUDA.COD_INTERNO) = MULT.COD_ESTADO_PAGO';

  v_sql_join_2 := '
  LEFT JOIN T_SCOB_TABLA_DET EST_MULTA_OR
        ON EST_MULTA_OR.ID_TABLA = 5 --ESTADO MULTA OR
        AND TO_NUMBER(EST_MULTA_OR.COD_INTERNO) = MDET.ESTADO_MULTA
        AND TO_NUMBER(EST_MULTA_OR.TXT_VALOR1) = 1
  LEFT JOIN T_SCOB_TABLA_DET EST_MULTA_COB
       ON EST_MULTA_COB.ID_TABLA = 5 --ESTADO MULTA COBRANZA
       AND TO_NUMBER(EST_MULTA_COB.COD_INTERNO) = MULT.ESTADO_MULTA
       AND TO_NUMBER(EST_MULTA_COB.TXT_VALOR1) = 2
  LEFT JOIN T_SCOB_AREA_COBRANZA ARCO
       ON ARCO.ID_AREA_COBRANZA = MULT.ID_AREA_COBRANZA
  LEFT JOIN T_SCOB_USUARIO USUA
       ON USUA.ID_USUARIO = MULT.ID_USUARIO_ASIG_COBRANZA
  ------------------------------------------------------------------------------
  ---INSTANCIAS
  LEFT JOIN T_SCOB_TMP_INSTANCIAS_MULTA NIVEL1
       ON NIVEL1.NRO_NIVEL = '||SCOB_PK_CONSTANTES.C_TBL_TIPO_INSTANCIA_AUTO||'
       AND NIVEL1.ID_MULTA = MULT.ID_MULTA
  LEFT JOIN T_SCOB_TMP_INSTANCIAS_MULTA NIVEL2
       ON NIVEL2.NRO_NIVEL = '||SCOB_PK_CONSTANTES.C_TBL_TIPO_INSTANCIA_COMI||'
       AND NIVEL2.ID_MULTA = MULT.ID_MULTA
  LEFT JOIN T_SCOB_TMP_INSTANCIAS_MULTA NIVEL3
       ON NIVEL3.NRO_NIVEL = '||SCOB_PK_CONSTANTES.C_TBL_TIPO_INSTANCIA_SALA||'
       AND NIVEL3.ID_MULTA = MULT.ID_MULTA
  ------------------------------------------------------------------------------
  LEFT JOIN T_SCOB_MULTA_COBRANZA MCOB
       ON MCOB.ID_MULTA = MULT.ID_MULTA
       AND MCOB.FLG_ACTUAL = ''1''
       AND MCOB.ESTADO = ''1''';

  v_sql_join_3 := '
  LEFT JOIN T_SCOB_EST_MUL_COB_MOTIVO MOTIVO_MULT --motivo multa cobranza
       ON MOTIVO_MULT.ID_MOTIVO = MULT.COD_MOTIVO
  LEFT JOIN T_SCOB_EXPEDIENTE_MULTA EXMU
       ON EXMU.ID_MULTA = MULT.ID_MULTA
       AND EXMU.ESTADO = ''1''
  LEFT JOIN T_SCOB_EXPEDIENTE EXPE
       ON EXPE.ID_EXPEDIENTE = EXMU.ID_EXPEDIENTE
       AND EXPE.ESTADO = ''1''
  LEFT JOIN T_SCOB_EST_EXP_COB EST_EXP
       ON EST_EXP.ID_EST_EXP_COB = EXPE.ESTADO_EXPEDIENTE
  LEFT JOIN T_SCOB_EST_EXP_COB_MOTIVO MOTIVO_EXPE --motivo estado expediente
       ON MOTIVO_EXPE.ID_MOTIVO = EXPE.ID_MOTIVO
  LEFT JOIN T_SCOB_MULTA_ANTIDUMPING MUAN
       ON MUAN.ID_MULTA = MULT.ID_MULTA
       AND MUAN.ESTADO = ''1''
  LEFT JOIN T_SCOB_INTENDENCIA INTE
       ON INTE.ID_INTENDENCIA = MUAN.ID_INTENDENCIA
  LEFT JOIN T_SCOB_PARTIDA PART
       ON PART.ID_PARTIDA = MUAN.ID_PARTIDA';

  v_sql_join_4 := '
  LEFT JOIN T_SCOB_MULTA_ARCHIVO_CENTRAL EXPED_ARCH_CEN
       ON EXPED_ARCH_CEN.ID_MULTA = MULT.ID_MULTA
       AND EXPED_ARCH_CEN.FLG_ACTUAL = ''1''
       AND EXPED_ARCH_CEN.ESTADO = ''1''
  LEFT JOIN T_SCOB_ARCHIVO_CENTRAL ARCH_CEN
       ON ARCH_CEN.ID_ARCHIVO_CENTRAL = EXPED_ARCH_CEN.ID_MULTA_ARCHIVO_CENTRAL
       AND ARCH_CEN.ESTADO = ''1''';

  v_sql_where_1 := v_sql_where_1 || '
  WHERE MULT.ESTADO = ''1''';

  ---------------------------------------------------------------------------
  -- FILTROS MULTA
  ---------------------------------------------------------------------------
  --AREA MACRO
  if pi_v_area_macro is not null then
     v_sql_where_1 := v_sql_where_1 || '
     AND INSTR('''||pi_v_area_macro||''',''|'' || TO_CHAR(TIPO_PROC.ID_TIPO_PROCEDIMIENTO) || ''|'' )>0';
  end if;

  --CODIGO MULTA
  if pi_v_cum_ini is not null then
     v_sql_where_1 := v_sql_where_1 || '
     AND MULT.ANIO||MULT.CUM BETWEEN '''||pi_v_cum_ini||''' AND '''||pi_v_cum_fin|| '''';
  end if;

  --FECHA GENERACION MULTA
  if pi_v_fec_gen_cum_ini is not null then
     v_sql_where_1 := v_sql_where_1 || '
     AND TO_DATE(TO_CHAR(MULT.FEC_INGRESO,''DD/MM/YYYY''),''DD/MM/YYYY'')
     BETWEEN TO_DATE('''||pi_v_fec_gen_cum_ini||''',''DD/MM/YYYY'') AND TO_DATE('''||pi_v_fec_gen_cum_fin||''',''DD/MM/YYYY'')
     ';
  end if;

  --SEDE
  if pi_v_id_sede is not null then
     v_sql_where_1 := v_sql_where_1 || '
     AND INSTR('''||pi_v_id_sede||''',''|'' || TO_CHAR(MULT.ID_SEDE) || ''|'' )>0';
  end if;

  --UBIGEO SEDE
  if PI_V_ID_COD_DPTO_SEDE is not null then
     v_sql_where_1 := v_sql_where_1 || '
     AND SEDE.COD_DPTO='''||PI_V_ID_COD_DPTO_SEDE||'''';
  end if;

  if PI_V_ID_COD_PROV_SEDE is not null then
     v_sql_where_2 := v_sql_where_2 || '
     AND SEDE.COD_PROV='''||PI_V_ID_COD_PROV_SEDE||'''';
  end if;

  if PI_V_ID_COD_DIST_SEDE is not null then
     v_sql_where_2 := v_sql_where_2 || '
     AND SEDE.COD_DIST='''||PI_V_ID_COD_DIST_SEDE||'''';
  end if;

  --ORGANO RESOLUTIVO
  if pi_v_id_org_resol is not null then
     v_sql_where_2 := v_sql_where_2 || '
     AND INSTR('''||pi_v_id_org_resol||''',''|'' || TO_CHAR(MDET.ID_ORGANO_RESOLUTIVO) || ''|'' )>0';
  end if;

  --UBIGEO ORGANO RESOLUTIVO
  if PI_V_ID_COD_DPTO_ORGR is not null then
     v_sql_where_2 := v_sql_where_2 || '
     AND ORGR.COD_DPTO='''||PI_V_ID_COD_DPTO_ORGR||'''';
  end if;

  if PI_V_ID_COD_PROV_ORGR is not null then
     v_sql_where_2 := v_sql_where_2 || '
     AND ORGR.COD_PROV='''||PI_V_ID_COD_PROV_ORGR||'''';
  end if;
  if PI_V_ID_COD_DIST_ORGR is not null then
     v_sql_where_3 := v_sql_where_3 || '
     AND ORGR.COD_DIST='''||PI_V_ID_COD_DIST_ORGR||'''';
  end if;

  --TIPO INSTANCIA
  if PI_V_ID_NRO_INSTANCIA is not null then
     v_sql_where_3 := v_sql_where_3 || '
     AND INSTR('''||PI_V_ID_NRO_INSTANCIA||''',''|'' || TO_CHAR(ORGR.TIPO_INSTANCIA) || ''|'' )>0';
  end if;

  --MATERIA
  if pi_v_id_materia is not null then
     v_sql_where_3 := v_sql_where_3 || '
     AND INSTR('''||pi_v_id_materia||''',''|'' || TO_CHAR(MULT.ID_MATERIA) || ''|'' )>0';
  end if;

  --SUBMATERIA
  if pi_v_id_sub_materia is not null then
     v_sql_where_3 := v_sql_where_3 || '
     AND INSTR('''||pi_v_id_sub_materia||''',''|'' || TO_CHAR(MULT.ID_SUB_MATERIA) || ''|'' )>0';
  end if;

  --NUMERO EXPEDIENTE UNICO
  if pi_v_nro_exp_unico_ini is not null then
     v_sql_where_3 := v_sql_where_3 || '
     AND TO_NUMBER(MULT.NRO_EXPED_UNICO) --@0001
        BETWEEN '''||pi_v_nro_exp_unico_ini||''' and '''||pi_v_nro_exp_unico_fin||'''';
  end if;

  --NUMERO EXPEDIENTE ADMINISTRATIVO
  if pi_v_nroExpAdm_nivel is not null then
     v_sql_where_3 := v_sql_where_3 || '
     AND MDET.NRO_EXP_NIVEL LIKE '''|| pi_v_nroExpAdm_nivel ||'%''';
  end if;

  --NRO RESOLUCION OR
  if pi_v_nro_resol is not null then
     v_sql_where_3 := v_sql_where_3 || '
     AND NIVEL1.NRO_RESOLUCION LIKE '''|| pi_v_nro_resol || '%''';
  end if;

  --FECHA RESOLUCION OR
  if pi_v_fec_reso_or_ini is not null then
     v_sql_where_3 := v_sql_where_3 || '
     AND TO_DATE(TO_CHAR(MDET.FEC_RESOLUCION,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE('''||pi_v_fec_reso_or_ini||''',''DD/MM/YYYY'') AND TO_DATE('''||pi_v_fec_reso_or_fin||''',''DD/MM/YYYY'')';
  end if;

  --FECHA NOTIFICACION RESOLUCION OR
  if pi_v_fec_notifi_or_ini is not null then
     v_sql_where_4 := v_sql_where_4 || '
     AND TO_DATE(TO_CHAR(MDET.FEC_NOTIFICACION_RESOLUCION,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE('''||pi_v_fec_notifi_or_ini||''',''DD/MM/YYYY'') AND TO_DATE('''||pi_v_fec_notifi_or_fin||''',''DD/MM/YYYY'')';
  end if;

  --FECHA GENERACION DE LA SEC
  if PI_V_FEC_GENERACION_SEC_INI is not null then
     v_sql_where_4 := v_sql_where_4 || '
     AND TO_DATE(TO_CHAR(MULT.FEC_GENERACION_SEC,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE('''||PI_V_FEC_GENERACION_SEC_INI||''',''DD/MM/YYYY'') AND TO_DATE('''||PI_V_FEC_GENERACION_SEC_FIN||''',''DD/MM/YYYY'')';
  end if;

  --FECHA INGRESO AL AEC
  if pi_v_fec_recepcion_aec_ini is not null then
     v_sql_where_4 := v_sql_where_4 || '
     AND TO_DATE(TO_CHAR(MULT.FEC_INGRESO_FILE,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE('''||pi_v_fec_recepcion_aec_ini||''',''DD/MM/YYYY'') AND TO_DATE('''||pi_v_fec_recepcion_aec_fin||''',''DD/MM/YYYY'')';
  end if;

  --AÑO INGRESO AL AEC
  if PI_V_ANIO_INGRESO_AEC_INI is not null then
     v_sql_where_4 := v_sql_where_4 || '
     AND MCOB.ANIO
         BETWEEN '''||PI_V_ANIO_INGRESO_AEC_INI||''' AND '''||PI_V_ANIO_INGRESO_AEC_FIN||'''';
  end if;

  --NRO INGRESO AL AEC
  if PI_V_NRO_INGRESO_AEC_INI is not null then
     v_sql_where_4 := v_sql_where_4 || '
     AND MCOB.NRO_INGRESO
         BETWEEN '''||LPAD(PI_V_NRO_INGRESO_AEC_INI,4,'0000')||''' AND '''||LPAD(PI_V_NRO_INGRESO_AEC_FIN,4,'0000')||'''';
  end if;

  --AÑO FILE
  if PI_V_ANIO_FILE_INI is not null then
     v_sql_where_4 := v_sql_where_4 || '
     AND MULT.ANIO_FILE_AEC BETWEEN '''||PI_V_ANIO_FILE_INI||''' AND '''||PI_V_ANIO_FILE_FIN||'''';
  end if;

  --NRO FILE
  if PI_V_NRO_FILE_INI is not null then
     v_sql_where_4 := v_sql_where_4 || '
     AND MULT.NRO_FILE_AEC
         BETWEEN '''||LPAD(PI_V_NRO_FILE_INI,10,'0000000000')||''' AND '''||LPAD(PI_V_NRO_FILE_FIN,10,'0000000000')||'''';
  end if;

  --VALOR UIT
  if pi_n_valor_uit_ini>0 then
     v_sql_where_5 := v_sql_where_5 || '
     AND MDET.VALOR_UIT
         BETWEEN '||pi_n_valor_uit_ini||' AND '||pi_n_valor_uit_fin;
  end if;

  --MONTO UIT
  if pi_n_monto_uit_ini>0 then
     v_sql_where_5 := v_sql_where_5 || '
     AND MULT.MONTO_UIT
         BETWEEN '||pi_n_monto_uit_ini||' AND '||pi_n_monto_uit_fin;
  end if;

  --SALDO UIT
  if pi_n_saldo_ini>0 then
     v_sql_where_5 := v_sql_where_5 || '
     AND MULT.SALDO
         BETWEEN '||pi_n_saldo_ini||' AND '||pi_n_saldo_fin;
  end if;

  --TIPO MULTA
  if pi_v_id_tipo_multa is not null then
     v_sql_where_5 := v_sql_where_5 || '
     AND INSTR('''||pi_v_id_tipo_multa||''',''|'' || MULT.FLG_TIPO_MULTA || ''|'' )>0';
  end if;

  --ESTADO MULTA OR
  if pi_v_cod_estado_multa_resol is not null then
     v_sql_where_5 := v_sql_where_5 || '
     AND INSTR('''||pi_v_cod_estado_multa_resol||''',''|'' || TO_CHAR(MDET.ESTADO_MULTA) || ''|'' )>0';
  end if;

  --ESTADO PAGO MULTA
  if pi_v_cod_estado_pago is not null then
     v_sql_where_5 := v_sql_where_5 || '
     AND INSTR('''||pi_v_cod_estado_pago||''',''|'' || TO_CHAR(MULT.COD_ESTADO_PAGO) || ''|'' )>0';
  end if;

  --FECHA ESTADO MULTA OR
  if PI_V_FEC_ESTADO_MULTA_OR_INI is not null then
     v_sql_where_6 := v_sql_where_6 || '
     AND TO_DATE(TO_CHAR(MDET.FEC_ESTADO_MULTA,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE('''||PI_V_FEC_ESTADO_MULTA_OR_INI||''',''DD/MM/YYYY'') AND TO_DATE('''||PI_V_FEC_ESTADO_MULTA_OR_FIN||''',''DD/MM/YYYY'')';
  end if;

  --FECHA ESTADO MULTA COB
  if PI_V_FEC_ESTADO_MULTA_COB_INI is not null then
     v_sql_where_6 := v_sql_where_6 || '
     AND TO_DATE(TO_CHAR(MULT.FEC_ESTADO_MULTA,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE('''||PI_V_FEC_ESTADO_MULTA_COB_INI||''',''DD/MM/YYYY'') AND TO_DATE('''||PI_V_FEC_ESTADO_MULTA_COB_FIN||''',''DD/MM/YYYY'')';
  end if;

  --ESTADO MULTA COBRANZA
  if pi_v_cod_estado_multa_cob is not null then
     v_sql_where_6 := v_sql_where_6 || '
     AND INSTR('''||pi_v_cod_estado_multa_cob||''',''|'' || TO_CHAR(MULT.ESTADO_MULTA) || ''|'' )>0';
  end if;

  --MOTIVO MULTA COBRANZA
  if pi_v_cod_motivo_multa_cob is not null then
     v_sql_where_6 := v_sql_where_6 || '
     AND INSTR('''||pi_v_cod_motivo_multa_cob||''',''|'' || MULT.COD_MOTIVO || ''|'' )>0';
  end if;

  --INDICADOR DE PAGO
  if PI_V_IND_TIPO_PAGO is not null then
     v_sql_where_6 := v_sql_where_6 || '
     AND INSTR('''||PI_V_IND_TIPO_PAGO||''',''|'' || TO_CHAR(SIT_MULTA.COD_SITUACION_MULTA) || ''|'' )>0';
  end if;

  --INDICADOR PORCENTAJE ASOCU MULTA
  if pi_c_flg_asocu_multa<>'0' then
     v_sql_where_6 := v_sql_where_6 || '
     AND NVL(MDET.POR_ASOCU,0) > 0';
  end if;

  --EXPECTATIVA DE COBRO
  if pi_v_id_expectativa_cobro is not null then
     v_sql_where_7 := v_sql_where_7 || '
     AND INSTR('''||pi_v_id_expectativa_cobro||''',''|'' || TO_CHAR(EXPE.COD_EXPECTATIVA_COBRO) || ''|'' )>0';
  end if;

  --INDICADOR EMBARGO
  if pi_c_flg_ind_embargo<>'0' then
     v_sql_where_7 := v_sql_where_7 || '
     AND NVL(EXPE.FLG_EMBARGO,''0'') = ''1''';
  end if;

  --FECHA ULTIMA GENERACION PRECOACTIVO
  if pi_v_fec_carta_precoactiva_ini is not null then
     v_sql_where_7 := v_sql_where_7 || '
     AND TO_DATE(TO_CHAR(MULT.FEC_ULT_GEN_PRECOACTIVA,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE('''||pi_v_fec_carta_precoactiva_ini||''',''DD/MM/YYYY'') AND TO_DATE('''||pi_v_fec_carta_precoactiva_fin||''',''DD/MM/YYYY'')';
  end if;

 --FECHA RECEPCION FILE
  if pi_v_fec_recepcion_file_ini is not null then
     v_sql_where_7 := v_sql_where_7 || '
     AND TO_DATE(TO_CHAR(MULT.FEC_INGRESO_AEC,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE('''||pi_v_fec_recepcion_file_ini||''',''DD/MM/YYYY'') AND TO_DATE('''||pi_v_fec_recepcion_file_fin||''',''DD/MM/YYYY'')';
  end if;

  ---------------------------------------------------------------------------
  -- FILTROS EXPEDIENTE
  ---------------------------------------------------------------------------
  --ESTADO EXPEDIENTE COBRANZA
  if pi_v_cod_estado_exped_cob is not null then
     v_sql_where_7 := v_sql_where_7 || '
     AND INSTR('''||pi_v_cod_estado_exped_cob||''',''|'' || TO_CHAR(EXPE.ESTADO_EXPEDIENTE) || ''|'' )>0';
  end if;

  --AÑO EXPEDIENTE COBRANZA
  if pi_v_anio is not null then
     v_sql_where_7 := v_sql_where_7 || '
     AND EXPE.ANIO='''||pi_v_anio||'''';
  end if;

  --NRO EXPEDIENTE COBRANZA
  if pi_v_nro_exp_cob_ini>0 then
     v_sql_where_7 := v_sql_where_7 || '
     AND EXPE.NRO_EXPEDIENTE
         BETWEEN lpad('''||pi_v_nro_exp_cob_ini||''',10,''0000000000'') AND lpad('''||pi_v_nro_exp_cob_fin||''',10,''0000000000'')';
  end if;

  --FECHA GENERACION EXPEDIENTE COBRANZA
  if pi_v_fec_gen_exped_cob_ini is not null then
     v_sql_where_8 := v_sql_where_8 || '
     AND TO_DATE(TO_CHAR(EXPE.FEC_INGRESO,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE('''||pi_v_fec_gen_exped_cob_ini||''',''DD/MM/YYYY'') AND TO_DATE('''||pi_v_fec_gen_exped_cob_fin||''',''DD/MM/YYYY'')';
  end if;

  --GESTOR COBRANZA
  if pi_v_gestor_cobranza is not null then
     v_sql_where_8 := v_sql_where_8 || '
     AND INSTR('''||pi_v_gestor_cobranza||''',''|'' || TO_CHAR(MULT.ID_USUARIO_ASIG_COBRANZA) || ''|'' )>0';
  end if;

  --FECHA EMISION DE LA REC
  if pi_v_fec_emi_rec_ini is not null then
     v_sql_where_8 := v_sql_where_8 || '
     AND TO_DATE(TO_CHAR(MULT.FEC_EMISION_REC,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE('''||pi_v_fec_emi_rec_ini||''',''DD/MM/YYYY'') AND TO_DATE('''||nvl(pi_v_fec_emi_rec_fin,pi_v_fec_emi_rec_ini)||''',''DD/MM/YYYY'')';
  end if;

  --FECHA NOTIFICACION DE LA REC
  if pi_v_fec_noti_rec_ini is not null then
     v_sql_where_8 := v_sql_where_8 || '
     AND TO_DATE(TO_CHAR(MULT.FEC_NOTIF_REC,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE('''||pi_v_fec_noti_rec_ini||''',''DD/MM/YYYY'') AND TO_DATE('''||pi_v_fec_noti_rec_fin||''',''DD/MM/YYYY'')';
  end if;

  --MOTIVO EXPEDIENTE COBRANZA
  if pi_v_cod_motivo_exped_cob is not null then
     v_sql_where_8 := v_sql_where_8 || '
     AND INSTR('''||pi_v_cod_motivo_exped_cob||''',''|'' || TO_CHAR(EXPE.ID_MOTIVO) || ''|'' )>0';
  end if;

  --FECHA ULTIMO ESTADO EXPEDIENTE
  if pi_v_fec_est_exped_cob_ini is not null then
     v_sql_where_9 := v_sql_where_9 || '
     AND TO_DATE(TO_CHAR(EXPE.FEC_ESTADO_EXPEDIENTE,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE('''||pi_v_fec_est_exped_cob_ini||''',''DD/MM/YYYY'') AND TO_DATE('''||pi_v_fec_est_exped_cob_fin||''',''DD/MM/YYYY'')';
  end if;

  --NUMERO DE ENVIO A ARCHIVO CENTRAL
  if pi_v_num_env_arch_ini is not null then
     v_sql_where_9 := v_sql_where_9 || '
     AND ARCH_CEN.NRO_ORDEN
         BETWEEN LPAD('''||pi_v_num_env_arch_ini||''',4,''0000'') AND LPAD('''||pi_v_num_env_arch_fin||''',4,''0000'')';
  end if;

  --FECHA ENVIO ARCHIVO CENTRAL
  if pi_v_fec_envi_arch_ini is not null then
     v_sql_where_9 := v_sql_where_9 || '
     AND TO_DATE(TO_CHAR(ARCH_CEN.FEC_ENVIO,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE('''||pi_v_fec_envi_arch_ini||''',''DD/MM/YYYY'') AND TO_DATE('''||pi_v_fec_envi_arch_fin||''',''DD/MM/YYYY'')';
  end if;

  --NRO OFICIO SUNAT
  if pi_v_nro_ofic_sunat_ini is not null then
     v_sql_where_9 := v_sql_where_9 || '
     AND (MUAN.NRO_OFICIO_SUNAT_CODIGO || MUAN.NRO_OFICIO_SUNAT_ANIO ||
     MUAN.NRO_OFICIO_SUNAT_PREFIJO || MUAN.NRO_OFICIO_SUNAT_CORRELATIVO)
     BETWEEN '''||pi_v_nro_ofic_sunat_ini||''' AND '''||pi_v_nro_ofic_sunat_fin||'''';
  end if;

  --DERECHO ANTIDUMOPING
  if pi_n_dere_antiDump_ini>0 then
     v_sql_where_9 := v_sql_where_9 || '
     AND MUAN.MONTO_ANTIDUMPING
         BETWEEN '||pi_n_dere_antiDump_ini||' AND '||pi_n_dere_antiDump_fin;
  end if;

  --PARTIDA ARANCELARIA
  if pi_v_nro_parti_ini is not null then
  v_sql_where_10 := v_sql_where_10 || '
      AND PART.CODIGO
      BETWEEN lpad('''||pi_v_nro_parti_ini||''',10,''0000000000'') AND lpad('''||pi_v_nro_parti_fin||''',10,''0000000000'')';
  end if;

  --MEMO ANTIDUMPING --FALTA EL CAMPO NO EXISTE EN LA INTERFAZ
  --NRO DUA
  if pi_v_nro_dua_ini is not null then
     v_sql_where_10 := v_sql_where_10 || '
     AND (MUAN.NRO_DUA_CODIGO || MUAN.NRO_DUA_ANIO || MUAN.NRO_DUA_CORRELATIVO)
         BETWEEN '''||pi_v_nro_dua_ini||''' AND '''||pi_v_nro_dua_fin||'''';
  end if;

  --NRO LIQUIDACION COBRANZA
  if pi_v_nro_liq_cob_ini is not null then
     v_sql_where_10 := v_sql_where_10 || '
     AND (MUAN.NRO_LIQUIDACION_CODIGO || MUAN.NRO_LIQUIDACION_ANIO || MUAN.NRO_LIQUIDACION_CORRELATIVO)
         BETWEEN '''||pi_v_nro_liq_cob_ini||''' AND '''||pi_v_nro_liq_cob_fin||'''';
  end if;

  --INTENDENCIA
  if pi_v_id_intendencia is not null then
     v_sql_where_10 := v_sql_where_10 || '
     AND INSTR('''||pi_v_id_intendencia||''',''|'' || TO_CHAR(MUAN.ID_INTENDENCIA) || ''|'' )>0';
  end if;

 --FECHA ASIGNACION GESTOR COBRANZA
  if pi_v_fec_asig_gestor_ini is not null then
     v_sql_where_11 := v_sql_where_11 || '
     AND TO_DATE(TO_CHAR(MULT.FECHA_ASIG_COBRANZA,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE('''||pi_v_fec_asig_gestor_ini||''',''DD/MM/YYYY'') AND TO_DATE('''||pi_v_fec_asig_gestor_fin||''',''DD/MM/YYYY'')';
  end if;

  v_sql_where_12 := v_sql_where_12 || '
  ORDER BY CUM DESC';


  DBMS_OUTPUT.put_line(v_sql_select_1);
  DBMS_OUTPUT.put_line(v_sql_select_2);
  DBMS_OUTPUT.put_line(v_sql_select_3);
  DBMS_OUTPUT.put_line(v_sql_select_4);
  DBMS_OUTPUT.put_line(v_sql_select_5);
  ---
  DBMS_OUTPUT.put_line(v_sql_join_1);
  DBMS_OUTPUT.put_line(v_sql_join_2);
  DBMS_OUTPUT.put_line(v_sql_join_3);
  DBMS_OUTPUT.put_line(v_sql_join_4);
  DBMS_OUTPUT.put_line(v_sql_join_5);
  ---
  DBMS_OUTPUT.put_line(v_sql_where_1);
  DBMS_OUTPUT.put_line(v_sql_where_2);
  DBMS_OUTPUT.put_line(v_sql_where_3);
  DBMS_OUTPUT.put_line(v_sql_where_4);
  DBMS_OUTPUT.put_line(v_sql_where_5);
  ---
  DBMS_OUTPUT.put_line(v_sql_where_6);
  DBMS_OUTPUT.put_line(v_sql_where_7);
  DBMS_OUTPUT.put_line(v_sql_where_8);
  DBMS_OUTPUT.put_line(v_sql_where_9);
  DBMS_OUTPUT.put_line(v_sql_where_10);
  DBMS_OUTPUT.put_line(v_sql_where_11);
  DBMS_OUTPUT.put_line(v_sql_where_12);

  open po_cu_retorno for
  --select sysdate from dual;

                     v_sql_select_1 ||
                     v_sql_select_2 ||
                     v_sql_select_3 ||
                     v_sql_select_4 ||
                     v_sql_select_5 ||
                     v_sql_join_1 ||
                     v_sql_join_2 ||
                     v_sql_join_3 ||
                     v_sql_join_4 ||
                     v_sql_join_5 ||
                     v_sql_where_1 ||
                     v_sql_where_2||
                     v_sql_where_3 ||
                     v_sql_where_4 ||
                     v_sql_where_5 ||
                     v_sql_where_6 ||
                     v_sql_where_7 ||
                     v_sql_where_8 ||
                     v_sql_where_9 ||
                     v_sql_where_10 ||
                     v_sql_where_11 ||
                     v_sql_where_12
                     ;
  COMMIT;

end;
procedure scob_sp_s_multa_avanzada_aec(
-----------------------------------------------------------------------------------------------
/*001*/   pi_v_area_macro                        in varchar2      --AREA MACRO
/*002*/  ,pi_v_cum_ini                           in varchar2      --cum
/*003*/  ,pi_v_cum_fin                           in varchar2      --cum
/*004*/  ,pi_v_fec_gen_cum_ini                   in varchar2      --FECHA GENERACION CUM INI
/*005*/  ,pi_v_fec_gen_cum_fin                   in varchar2      --FECHA GENERACION CUM FIN
/*006*/  ,pi_v_id_sede                           in varchar2      --sede
/*007*/  ,PI_V_ID_COD_DPTO_SEDE                  in VARCHAR2      --CODIGO DEPARTAMENTO SEDE
/*008*/  ,PI_V_ID_COD_PROV_SEDE                  in VARCHAR2      --CODIGO PROVINCIA SEDE
/*009*/  ,PI_V_ID_COD_DIST_SEDE                  in VARCHAR2      --CODIGO DISTRITO SEDE
/*010*/  ,pi_v_id_org_resol                      in varchar2      --organo resolutivo
/*011*/  ,PI_V_ID_COD_DPTO_ORGR                  in VARCHAR2      --CODIGO DEPARTAMENTO ORGANO RESOLUTIVO
/*012*/  ,PI_V_ID_COD_PROV_ORGR                  in VARCHAR2      --CODIGO PROVINCIA ORGANO RESOLUTIVO
/*013*/  ,PI_V_ID_COD_DIST_ORGR                  in VARCHAR2      --CODIGO DISTRITO ORGANO RESOLUTIVO
/*014*/  ,PI_V_ID_NRO_INSTANCIA                  in VARCHAR2      --NUMERO DE INSTANCIA
/*015*/  ,pi_v_id_materia                        in varchar2      --materia
/*016*/  ,pi_v_id_sub_materia                    in varchar2      --SUBMATERIA
/*017*/  ,pi_v_nro_exp_unico_ini                 in varchar2      --nro. expediente administrativo
/*018*/  ,pi_v_nro_exp_unico_fin                 in varchar2      --nro. expediente administrativo
/*019*/  ,pi_v_nroExpAdm_nivel                   in varchar2      --nro. expediente antiguo
/*020*/  ,pi_v_nro_resol                         in varchar2      --nro. resolucion or
/*021*/  ,pi_v_fec_reso_or_ini                   in varchar2      --FECHA RESOLUCION OR INI
/*022*/  ,pi_v_fec_reso_or_fin                   in varchar2      --FECHA RESOLUCION OR FIN
/*023*/  ,pi_v_fec_notifi_or_ini                 in varchar2      --FECHA NOTIFICACION RESOLUCION INI
/*024*/  ,pi_v_fec_notifi_or_fin                 in varchar2      --FECHA NOTIFICACION RESOLUCION FIN
/*025*/  ,PI_V_FEC_GENERACION_SEC_INI            in VARCHAR2      --FECHA GENERACION SEC
/*026*/  ,PI_V_FEC_GENERACION_SEC_FIN            in VARCHAR2      --FECHA GENERACION SEC
---
/*027*/  ,pi_v_fec_recepcion_aec_ini             in varchar2      --FECHA RECEPCION AEC INICIO
/*028*/  ,pi_v_fec_recepcion_aec_fin             in varchar2      --FECHA RECEPCION AEC FIN
/*029*/  ,PI_V_ANIO_INGRESO_AEC_INI              in varchar2      --AÑO INGRESO AL AEC INI
/*030*/  ,PI_V_ANIO_INGRESO_AEC_FIN              in varchar2      --AÑO INGRESO AL AEC FIN
/*031*/  ,PI_V_NRO_INGRESO_AEC_INI               in varchar2      --nro. ingreso aec
/*032*/  ,PI_V_NRO_INGRESO_AEC_FIN               in varchar2      --nro. ingreso aec
---
/*033*/  ,PI_V_ANIO_FILE_INI                     in varchar2      --AÑO FILE INI
/*034*/  ,PI_V_ANIO_FILE_FIN                     in varchar2      --AÑO FILE FIN
/*035*/  ,PI_V_NRO_FILE_INI                      in varchar2      --nro. file
/*036*/  ,PI_V_NRO_FILE_FIN                      in varchar2      --nro. file
/*037*/  ,pi_v_fec_recepcion_file_ini            in varchar2      --FECHA RECEPCION FILE INICIO
/*038*/  ,pi_v_fec_recepcion_file_fin            in varchar2      --FECHA RECEPCION FILE FIN
---
/*039*/  ,pi_n_valor_uit_ini                     in number        --nro uit ini
/*040*/  ,pi_n_valor_uit_fin                     in number        --nro uit fin
/*041*/  ,pi_n_monto_uit_ini                     in NUMBER        --MONTO UIT INI
/*042*/  ,pi_n_monto_uit_fin                     in NUMBER        --MONTO UIT FIN
/*043*/  ,pi_n_saldo_ini                         in NUMBER        --SALDO UIT INI
/*044*/  ,pi_n_saldo_fin                         in NUMBER        --SALDO UIT FIN
/*045*/  ,pi_v_id_tipo_multa                     in varchar2      --TIPO MULTA (SOLIDARIA/INDIVIDUAL)
/*046*/  ,pi_v_cod_estado_multa_resol            in varchar2      --estado de la multa resolutivo
/*047*/  ,pi_v_cod_estado_pago                   in varchar2      --estado pago de la multa
/*048*/  ,PI_V_FEC_ESTADO_MULTA_OR_INI           in VARCHAR2      --FECHA ESTADO MULTA OR INI
/*049*/  ,PI_V_FEC_ESTADO_MULTA_OR_FIN           in VARCHAR2      --FECHA ESTADO MULTA OR FIN
/*050*/  ,PI_V_FEC_ESTADO_MULTA_COB_INI          in VARCHAR2      --FECHA ESTADO MULTA COBRANZA
/*051*/  ,PI_V_FEC_ESTADO_MULTA_COB_FIN          in VARCHAR2      --FECHA ESTADO MULTA COBRANZA
/*052*/  ,pi_v_cod_estado_multa_cob              in varchar2      --estado de la multa cobranza
/*053*/  ,pi_v_cod_motivo_multa_cob              in varchar2      --motivo multa cobranza
/*054*/  ,PI_V_IND_TIPO_PAGO                     in VARCHAR2      --INDICADOR DE PAGO
/*055*/  ,pi_c_flg_asocu_multa                   IN CHAR         --INDICADOR % ASOCU > 0
-----------------------------------------------------------------------------------------------
/*056*/  ,pi_v_cod_estado_exped_cob              in varchar2      --estado expediente cobranza
/*057*/  ,pi_v_anio                              in varchar2      --año expediente cobranza
/*058*/  ,pi_v_nro_exp_cob_ini                   in varchar2      --nro. expediente cobranza
/*059*/  ,pi_v_nro_exp_cob_fin                   in varchar2      --nro. expediente cobranza
/*060*/  ,pi_v_fec_gen_exped_cob_ini             in varchar2      --FECHA GENERACION EXPED COBRANZA INI
/*061*/  ,pi_v_fec_gen_exped_cob_fin             in varchar2      --FECHA GENERACION EXPED COBRANZA FIN
-------
/*062*/  ,pi_v_gestor_cobranza                   in varchar2      --Gestor de cobranza
/*063*/  ,pi_v_fec_emi_rec_ini                   in varchar2      --Fecha de Emisión de la REC
/*064*/  ,pi_v_fec_emi_rec_fin                   in varchar2      --Fecha de Emisión de la REC
/*065*/  ,pi_v_fec_noti_rec_ini                  in varchar2      --Fecha de Notificación de la REC
/*066*/  ,pi_v_fec_noti_rec_fin                  in varchar2      --Fecha de Notificación de la REC
/*067*/  ,pi_v_cod_motivo_exped_cob              in varchar2      --motivo expediente cobranza---------
/*068*/  ,pi_v_fec_est_exped_cob_ini             in varchar2      --Fecha de Estado del Expediente
/*069*/  ,pi_v_fec_est_exped_cob_fin             in varchar2      --Fecha de Estado del Expediente
/*070*/  ,pi_v_num_env_arch_ini                  in varchar2      --Nº Envio a Archivo Central
/*071*/  ,pi_v_num_env_arch_fin                  in varchar2      --Nº Envio a Archivo Central
/*072*/  ,pi_v_fec_envi_arch_ini                 in varchar2      --Fecha de Envío a Archivo Central
/*073*/  ,pi_v_fec_envi_arch_fin                 in varchar2      --Fecha de Envío a Archivo Central
/*074*/  ,pi_v_nro_ofic_sunat_ini                in varchar2      --Nº de Oficio de la SUNAT
/*075*/  ,pi_v_nro_ofic_sunat_fin                in varchar2      --Nº de Oficio de la SUNAT
/*076*/  ,pi_n_dere_antiDump_ini                 in NUMBER        --Derechos Antidumping
/*077*/  ,pi_n_dere_antiDump_fin                 in NUMBER        --Derechos Antidumping
/*078*/  ,pi_v_nro_parti_ini                     in varchar2      --Partida Arancelaria
/*079*/  ,pi_v_nro_parti_fin                     in varchar2      --Partida Arancelaria
/*080*/  ,pi_v_nro_dua_ini                       in varchar2      --Nº DUA
/*081*/  ,pi_v_nro_dua_fin                       in varchar2      --Nº DUA
/*082*/  ,pi_v_nro_liq_cob_ini                   in varchar2      --Nº Liquidación de Cobranza
/*083*/  ,pi_v_nro_liq_cob_fin                   in varchar2      --Nº Liquidación de Cobranza
/*084*/  ,pi_v_id_intendencia                    in varchar2      --Intendencia antidumping
/*085*/  ,pi_c_flg_ind_embargo                   in char          --INDICADOR TIENE EMBARGO?
/*086*/  ,pi_v_fec_asig_gestor_ini               in varchar2      --fecha de asignacion de gestor ini
/*087*/  ,pi_v_fec_asig_gestor_fin               in varchar2      --fecha de asignacion de gestor fin
/*088*/  ,pi_v_fec_carta_precoactiva_ini         in varchar2      --fecha de carta precoactiva inicio
/*089*/  ,pi_v_fec_carta_precoactiva_fin         in varchar2      --fecha de carta precoactiva fin
/*090*/  ,pi_v_id_expectativa_cobro              in varchar2      --cadena codigos espectativa de cobro

-----------------------------------------------------------------------------------------------
        --denunciante
/*091*/  ,pi_v_d_codSanciona_ini                 in varchar2      --Código del INDECOPI
/*092*/  ,pi_v_d_codSanciona_fin                 in varchar2      --Código del INDECOPI
/*093*/  ,pi_i_d_tip_persona                     in integer       --Tipo de Personería
/*094*/  ,pi_v_d_razon_social                    in varchar2      --Razón Social
/*095*/  ,pi_v_d_ape_paterno                     in varchar2      --Apellido Paterno
/*096*/  ,pi_v_d_ape_materno                     in varchar2      --Apellido Materno
/*097*/  ,pi_v_d_ape_casada                      in varchar2      --Apellido Casada
/*098*/  ,pi_v_d_pri_nombre                      in varchar2      --Primer nombre
/*099*/  ,pi_v_d_seg_nombre                      in varchar2      --Segundo nombre
/*100*/  ,pi_i_d_tipo_doc                        in integer       --Tipo de Documento
/*101*/  ,pi_v_d_nro_doc                         in varchar2      --Nº de documento de identidad
/*102*/  ,pi_i_d_tip_empresa                     in integer       --Tipo de Empresa
/*103*/  ,pi_n_d_id_sect_econo                   in number        --CIIU (Actividad Economica)
/*104*/  ,pi_c_d_flg_asocu                       in char          --flag asocu
/*105*/  ,pi_c_d_fl_oficio                       in char          --indicador denunciante de oficio=Indecopi
        --denunciado
/*106*/  ,pi_v_do_codSanciona_ini                in varchar2      --Código del INDECOPI
/*107*/  ,pi_v_do_codSanciona_fin                in varchar2      --Código del INDECOPI
/*108*/  ,pi_i_do_tip_persona                    in integer       --Tipo de Personería
/*109*/  ,pi_v_do_razon_social                   in varchar2      --Razón Social
/*110*/  ,pi_v_do_ape_paterno                    in varchar2      --Apellido Paterno
/*111*/  ,pi_v_do_ape_materno                    in varchar2      --Apellido Materno
/*112*/  ,pi_v_do_ape_casada                     in varchar2      --Apellido Casada
/*113*/  ,pi_v_do_pri_nombre                     in varchar2      --Primer nombre
/*114*/  ,pi_v_do_seg_nombre                     in varchar2      --Segundo nombre
/*115*/  ,pi_i_do_tipo_doc                       in integer       --Tipo de Documento
/*116*/  ,pi_v_do_nro_doc                        in varchar2      --Nº de documento de identidad
/*117*/  ,pi_i_do_tip_empresa                    in integer       --Tipo de Empresa
/*118*/  ,pi_n_do_id_sect_econo                  in number        --CIIU (Actividad Economica)
/*119*/  ,pi_c_do_flg_asocu                      in char          --flag asocu
         --sancionado
/*120*/  ,pi_v_s_codSanciona_ini                 in varchar2      --Código del INDECOPI
/*121*/  ,pi_v_s_codSanciona_fin                 in varchar2      --Código del INDECOPI
/*122*/  ,pi_i_s_tip_persona                     in integer       --Tipo de Personería
/*123*/  ,pi_v_s_razon_social                    in varchar2      --Razón Social
/*124*/  ,pi_v_s_ape_paterno                     in varchar2      --Apellido Paterno
/*125*/  ,pi_v_s_ape_materno                     in varchar2      --Apellido Materno
/*126*/  ,pi_v_s_ape_casada                      in varchar2      --Apellido Casada
/*127*/  ,pi_v_s_pri_nombre                      in varchar2      --Primer nombre
/*128*/  ,pi_v_s_seg_nombre                      in varchar2      --Segundo nombre
/*129*/  ,pi_i_s_tipo_doc                        in integer       --Tipo de Documento
/*130*/  ,pi_v_s_nro_doc                         in varchar2      --Nº de documento de identidad
/*131*/  ,pi_i_s_tip_empresa                     in integer       --Tipo de Empresa
/*132*/  ,pi_n_s_id_sect_econo                   in number        --CIIU (Actividad Economica)
/*133*/  ,pi_c_s_flg_asocu                       in char           --flag asocu
--@0002:ini
/*134*/  ,pi_c_s_flg_buscar_by_contenido         in char           --0=NO;1=SI
--@0002:fin
-----------------------------------------------------------------------------------------------
         ,po_cu_retorno                          out cu_rec_set
)is

  c_flg_administrado                           char(1);
  c_flg_sancionado                             char(1);
  c_flg_denunciado                             char(1);
  c_flg_denunciante                            char(1);

  v_sql_admin_select                           varchar2(8000);
  v_sql_admin_where_d                          varchar2(8000);
  v_sql_admin_where_do                         varchar2(8000);
  v_sql_admin_where_s                          varchar2(8000);

  v_sql_select_1                               varchar2(8000);
  v_sql_select_2                               varchar2(8000);
  v_sql_select_3                               varchar2(8000);
  v_sql_select_4                               varchar2(8000);
  v_sql_select_5                               varchar2(8000);
  v_sql_join_1                                 varchar2(8000);
  v_sql_join_2                                 varchar2(8000);
  v_sql_join_3                                 varchar2(8000);
  v_sql_join_4                                 varchar2(8000);
  v_sql_join_5                                 varchar2(8000);
  v_sql_where_1                                varchar2(8000);
  v_sql_where_2                                varchar2(8000);
  v_sql_where_3                                varchar2(8000);
  v_sql_where_4                                varchar2(8000);
  v_sql_where_5                                varchar2(8000);
  v_sql_where_6                                varchar2(8000);
  v_sql_where_7                                varchar2(8000);
  v_sql_where_8                                varchar2(8000);
  v_sql_where_9                                varchar2(8000);
  v_sql_where_10                               varchar2(8000);
  v_sql_where_11                               varchar2(8000);
  v_sql_where_12                               varchar2(8000);
  c_car_porcentaje                             varchar(1);
begin
  --@0002:ini
  c_car_porcentaje := '';
  if pi_c_s_flg_buscar_by_contenido = '1' then c_car_porcentaje := '%'; end if;
  --@0002:fin

  --control del filtro sancionado
  c_flg_administrado := '0';
  c_flg_sancionado := '0';
  c_flg_denunciado := '0';
  c_flg_denunciante := '0';

  v_sql_where_1 := '';
  v_sql_where_2 := '';
  v_sql_where_3 := '';
  v_sql_where_4 := '';
  v_sql_where_5 := '';
  v_sql_where_6 := '';
  v_sql_where_7 := '';
  v_sql_where_8 := '';
  v_sql_where_9 := '';
  v_sql_where_10 := '';
  v_sql_where_11 := '';
  v_sql_where_12 := '';

  IF  pi_v_s_codSanciona_ini is not null or
      pi_v_s_codSanciona_fin is not null or
      pi_i_s_tip_persona <> 0 or
      pi_v_s_razon_social is not null or
      pi_v_s_ape_paterno is not null or
      pi_v_s_ape_materno is not null or
      pi_v_s_ape_casada is not null or
      pi_v_s_pri_nombre is not null or
      pi_v_s_seg_nombre is not null or
      pi_i_s_tipo_doc <> 0 or
      pi_v_s_nro_doc is not null or
      pi_i_s_tip_empresa <> 0 or
      pi_n_s_id_sect_econo <> 0 or
      pi_c_s_flg_asocu<>'0'
  THEN
      c_flg_sancionado := '1';
      if c_flg_administrado = '0' then c_flg_administrado := '1'; end if;
  END IF;

  IF (
      pi_v_do_codSanciona_ini is not null or
      pi_v_do_codSanciona_fin is not null or
      pi_i_do_tip_persona <> 0 or
      pi_v_do_razon_social is not null or
      pi_v_do_ape_paterno is not null or
      pi_v_do_ape_materno is not null or
      pi_v_do_ape_casada is not null or
      pi_v_do_pri_nombre is not null or
      pi_v_do_seg_nombre is not null or
      pi_i_do_tipo_doc <> 0 or
      pi_v_do_nro_doc is not null or
      pi_i_do_tip_empresa <> 0 or
      pi_n_do_id_sect_econo <> 0 or
      pi_c_do_flg_asocu<>'0'
      )
  THEN
      c_flg_denunciado := '1';
      if c_flg_administrado = '0' then c_flg_administrado := '1'; end if;
  END IF;

  IF  (
      pi_v_d_codSanciona_ini is not null or
      pi_v_d_codSanciona_fin is not null or
      pi_i_d_tip_persona <> 0 or
      pi_v_d_razon_social is not null or
      pi_v_d_ape_paterno is not null or
      pi_v_d_ape_materno is not null or
      pi_v_d_ape_casada is not null or
      pi_v_d_pri_nombre is not null or
      pi_v_d_seg_nombre is not null or
      pi_i_d_tipo_doc <> 0 or
      pi_v_d_nro_doc is not null or
      pi_i_d_tip_empresa <> 0 or
      pi_n_d_id_sect_econo <> 0 or
      pi_c_d_flg_asocu<>'0' or
      pi_c_d_fl_oficio<>'0'
      )
  THEN
      c_flg_denunciante := '1';
      if c_flg_administrado = '0' then c_flg_administrado := '1'; end if;
  END IF;

  --obtener los datos de las intancias de una multa
  EXECUTE IMMEDIATE 'TRUNCATE TABLE T_SCOB_TMP_INSTANCIAS_MULTA1';
  INSERT INTO USR_SICOB.T_SCOB_TMP_INSTANCIAS_MULTA1(
      ID_MULTA,
      NRO_NIVEL,
      NRO_RESOLUCION,
      FEC_RESOLUCION,
      FEC_NOTIFICACION_RESOLUCION,
      FEC_ESTADO_SGTE_INSTANCIA,
      FEC_REGISTRO,
      LOGIN_USUARIO_REGISTRO,
      NRO_RESOLUCION_DECLARACION,
      FEC_CONS_FIRME,
      FEC_NOTF_CONS_FIRME
      )(
        SELECT
          MDET.ID_MULTA,
          ORGR.TIPO_INSTANCIA,
          --MDET.NRO_RESOLUCION_ID,
          MDET.NRO_RESOLUCION,
          MDET.FEC_RESOLUCION,
          MDET.FEC_NOTIFICACION_RESOLUCION,
          MDET.FEC_ESTADO_SGTE_INSTANCIA,
          TO_DATE(TO_CHAR(MDET.AUDFECCREACION,'DD/MM/YYYY'),'DD/MM/YYYY'),
          MDET.AUDUSUCREACION,
          MDET.NRO_RESOLUCION_DECLARACION,
          MDET.FEC_DECLARACION AS FEC_CONS_FIRME,
          MDET.FEC_NOTIFICACION_DECLARACION AS FEC_NOTF_CONS_FIRME
        FROM T_SCOB_MULTA_DETAL MDET
        INNER JOIN T_SCOB_ORGANO_RESOLUTIVO ORGR
              ON ORGR.ID_ORGANO_RESOLUTIVO = MDET.ID_ORGANO_RESOLUTIVO
        WHERE MDET.ESTADO = '1'
  );
  /*EXECUTE IMMEDIATE 'TRUNCATE TABLE T_SCOB_TMP_INSTANCIAS_MULTA';
  INSERT INTO T_SCOB_TMP_INSTANCIAS_MULTA(
      ID_MULTA,
      NRO_NIVEL,
      NRO_RESOLUCION,
      FEC_RESOLUCION,
      FEC_NOTIFICACION_RESOLUCION,
      FEC_ESTADO_SGTE_INSTANCIA,
      FEC_REGISTRO,
      LOGIN_USUARIO_REGISTRO
  )(
        SELECT
          MDET.ID_MULTA,
          ORGR.TIPO_INSTANCIA,
          --Req. 30 - @dcelis/begin
          --MDET.NRO_RESOLUCION_ID,
          MDET.NRO_RESOLUCION,
          --Req. 30 - @dcelis/end
          MDET.FEC_RESOLUCION,
          MDET.FEC_NOTIFICACION_RESOLUCION,
          MDET.FEC_ESTADO_SGTE_INSTANCIA,
          TO_DATE(TO_CHAR(MDET.AUDFECCREACION,'DD/MM/YYYY'),'DD/MM/YYYY'),
          MDET.AUDUSUCREACION
        FROM T_SCOB_MULTA_DETAL MDET
        INNER JOIN T_SCOB_ORGANO_RESOLUTIVO ORGR
              ON ORGR.ID_ORGANO_RESOLUTIVO = MDET.ID_ORGANO_RESOLUTIVO
        WHERE MDET.ESTADO = '1'

  );*/

  --obtener la situacion de pago de las multas
  EXECUTE IMMEDIATE 'TRUNCATE TABLE T_SCOB_TMP_SITUACION_MULTA';
  INSERT INTO T_SCOB_TMP_SITUACION_MULTA(
     ID_MULTA,
     COD_SITUACION_MULTA
  )
  SELECT
    MULT.ID_MULTA,
    CASE
       WHEN EXPE.ESTADO_EXPEDIENTE = 4 THEN 3 --'FR'
       WHEN EXPE.ESTADO_EXPEDIENTE = 5 THEN 4 --'PP'
       WHEN MULT.NRO_FILE_AEC IS NULL THEN 1 --PAGO VOLUNTARIO
       ELSE 2 --PAGO COACTIVO
       --WHEN MULT.IND_DESCUENTO = 1 AND MULT.COD_ESTADO_PAGO IN (4) THEN 1 --'DS'
       --WHEN MULT.NRO_FILE_AEC IS NULL THEN 2 --'MU'--NO TIENE DESCUENTO Y NO HA INGRESADO A COBRANZA
       --ELSE 2--'CO'
    END AS COD_SITUACION_MULTA
  FROM T_SCOB_MULTA MULT
  LEFT JOIN T_SCOB_EXPEDIENTE_MULTA EXMU
       ON EXMU.ID_MULTA = MULT.ID_MULTA
       AND EXMU.ESTADO = '1'
  LEFT JOIN T_SCOB_EXPEDIENTE EXPE
       ON EXPE.ID_EXPEDIENTE = EXMU.ID_EXPEDIENTE
  WHERE MULT.ESTADO = '1';

  -----------------------------------------------------------------------------------
  --obtener los administrados
  -----------------------------------------------------------------------------------
  --3=DENUNCIANTE
  -----------------------------------------------------------------------------------
  /*
  Dbms_Output.put_line('c_flg_administrado--->' || c_flg_administrado);
  Dbms_Output.put_line('c_flg_denunciante--->' || c_flg_denunciante);
  Dbms_Output.put_line('c_flg_sancionado--->' || c_flg_sancionado);
  Dbms_Output.put_line('c_flg_denunciado--->' || c_flg_denunciado);
  */

  EXECUTE IMMEDIATE 'TRUNCATE TABLE T_SCOB_TMP_ADMINISTRADO';
  --obtener a todos los administrados
  if c_flg_administrado = '1' then

      v_sql_admin_select := '
      INSERT INTO T_SCOB_TMP_ADMINISTRADO(
          ID_MULTA, TIPO_ADMINISTRADO, ID_PERSONA
      )
      SELECT
          ADMINISTRADO.ID_MULTA,ADMINISTRADO.TIPO_ADMINISTRADO,PERS.ID_PERSONA
      FROM (
          SELECT MDET.ID_MULTA AS ID_MULTA, ''3'' AS TIPO_ADMINISTRADO, --DENUNCIANTE
                 MDEN.ID_PERSONA  AS ID_PERSONA
          FROM T_SCOB_MULTA_DETAL MDET
          INNER JOIN T_SCOB_MULTA_DENUNCIANTE MDEN
                ON MDEN.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL
                AND MDEN.ESTADO = ''1''
          WHERE MDET.FLG_ACTUAL = ''1'' AND MDET.ESTADO = ''1''
          UNION ALL
          SELECT MDET.ID_MULTA AS ID_MULTA, MSAN.COD_TIPO_PERSONA AS TIPO_ADMINISTRADO, --SANCIONADO Y DENUNCIADO
                 MSAN.ID_PERSONA AS ID_PERSONA
          FROM T_SCOB_MULTA_DETAL MDET
          INNER JOIN T_SCOB_MULTA_SANCIONADO MSAN
                ON MSAN.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL
                AND MSAN.ESTADO = ''1''
          WHERE MDET.FLG_ACTUAL = ''1'' AND MDET.ESTADO = ''1''
      )ADMINISTRADO
      INNER JOIN T_SCOB_PERSONA PERS ON PERS.ID_PERSONA = ADMINISTRADO.ID_PERSONA
      ';

      v_sql_admin_where_d := '
      WHERE ADMINISTRADO.ID_MULTA IS NOT NULL ';

      IF c_flg_denunciante = '1' THEN

      v_sql_admin_where_d := v_sql_admin_where_d ||
      '
      AND (ADMINISTRADO.TIPO_ADMINISTRADO = ''3'' --denunciante
      ';

          --CODIGO INDECOPI
          if pi_v_d_codSanciona_ini is not null then
             v_sql_admin_where_d := v_sql_admin_where_d ||
             '
             AND TO_NUMBER(PERS.COD_SANCIONADO) BETWEEN TO_NUMBER('||pi_v_d_codSanciona_ini||') AND TO_NUMBER('||pi_v_d_codSanciona_fin||')'
             ;

          end if;

          --TIPO PERSONERIA
          if pi_i_d_tip_persona<>0 then
             v_sql_admin_where_d := v_sql_admin_where_d ||
             '
             AND PERS.TIPO_PERSONA='||pi_i_d_tip_persona
             ;
          end if;

          --TIPO DOCUMENTO
          if pi_i_d_tipo_doc<>0 then
             v_sql_admin_where_d := v_sql_admin_where_d ||
             '
             AND PERS.TIPO_DOC='||pi_i_d_tipo_doc
             ;
          end if;

          --NRO DOCUMENTO
          if pi_v_d_nro_doc is not null then
             v_sql_admin_where_d := v_sql_admin_where_d ||
             '
             AND PERS.NRO_DOC='''||pi_v_d_nro_doc||''''
             ;
          end if;

          --APELLIDOS Y NOMBRES
          if pi_v_d_ape_paterno is not null then
             v_sql_admin_where_d := v_sql_admin_where_d ||
             '
             AND PERS.APE_PATERNO LIKE '''||c_car_porcentaje||pi_v_d_ape_paterno||'%'''
             ;
          end if;

          if pi_v_d_ape_materno is not null then
             v_sql_admin_where_d := v_sql_admin_where_d ||
             '
             AND PERS.APE_MATERNO LIKE '''||c_car_porcentaje||pi_v_d_ape_materno||'%'''
             ;
          end if;

          if pi_v_d_ape_casada is not null then
             v_sql_admin_where_d := v_sql_admin_where_d ||
             '
             AND PERS.APE_CASADA LIKE '''||c_car_porcentaje||pi_v_d_ape_casada||'%'''
             ;
          end if;

          if pi_v_d_pri_nombre is not null then
             v_sql_admin_where_d := v_sql_admin_where_d ||
             '
             AND PERS.PRI_NOMBRE LIKE '''||c_car_porcentaje||pi_v_d_pri_nombre||'%'''
             ;
          end if;

          if pi_v_d_seg_nombre is not null then
             v_sql_admin_where_d := v_sql_admin_where_d ||
             '
             AND PERS.SEG_NOMBRE LIKE '''||c_car_porcentaje||pi_v_d_seg_nombre||'%'''
             ;
          end if;

          --DENOMINACION O RAZON SOCIAL
          if pi_v_d_razon_social is not null then
             v_sql_admin_where_d := v_sql_admin_where_d ||
             '
             AND PERS.RAZON_SOCIAL LIKE '''||c_car_porcentaje||pi_v_d_razon_social ||'%'''
             ;
          end if;

          --TIPO DE EMPRESA
          if pi_i_d_tip_empresa<>0 then
             v_sql_admin_where_d := v_sql_admin_where_d ||
             '
             AND PERS.TIP_EMPRESA=' ||pi_i_d_tip_empresa
             ;
          end if;

          --SECTOR ECONOMICO
          if pi_n_d_id_sect_econo<>0 then
             v_sql_admin_where_d := v_sql_admin_where_d ||
             '
             AND PERS.ID_SECTOR_ECONOMICO='||pi_n_d_id_sect_econo
             ;
          end if;

          --INDICADOR DENUNCIANTE DE OFICIO = INDECOPI
          if pi_c_d_fl_oficio='1' then
             v_sql_admin_where_d := v_sql_admin_where_d ||
             '
             AND PERS.ID_PERSONA='||SCOB_PK_CONSTANTES.C_ID_ADMINISTRADO_INDECOPI;
          end if;




      v_sql_admin_where_d := v_sql_admin_where_d || '
      )';

      END IF;

      IF c_flg_denunciado = '1' THEN
          if  c_flg_denunciante = '1' then
              v_sql_admin_where_do :=
              '
              OR(ADMINISTRADO.TIPO_ADMINISTRADO = ''2'' --denunciado';
          else
              v_sql_admin_where_do :=
              '
              AND(ADMINISTRADO.TIPO_ADMINISTRADO = ''2'' --denunciado';
          end if;

          --CODIGO INDECOPI
          if pi_v_d_codSanciona_ini is not null then
             v_sql_admin_where_do := v_sql_admin_where_do ||
             '
             AND TO_NUMBER(PERS.COD_SANCIONADO) BETWEEN TO_NUMBER('||pi_v_do_codSanciona_ini||') AND TO_NUMBER('||pi_v_do_codSanciona_fin||')'
             ;
          end if;

          --TIPO PERSONERIA
          if pi_i_do_tip_persona<>0 then
             v_sql_admin_where_do := v_sql_admin_where_do ||
             '
             AND PERS.TIPO_PERSONA='||pi_i_do_tip_persona
             ;
          end if;

          --TIPO DOCUMENTO
          if pi_i_do_tipo_doc<>0 then
             v_sql_admin_where_do := v_sql_admin_where_do ||
             '
             AND PERS.TIPO_DOC='||pi_i_do_tipo_doc
             ;
          end if;

          --NRO DOCUMENTO
          if pi_v_do_nro_doc is not null then
             v_sql_admin_where_do := v_sql_admin_where_do ||
             '
             AND PERS.NRO_DOC='''||pi_v_do_nro_doc||''''
             ;
          end if;

          --APELLIDOS Y NOMBRES
          if pi_v_do_ape_paterno is not null then
             v_sql_admin_where_do := v_sql_admin_where_do ||
             '
             AND PERS.APE_PATERNO LIKE '''||c_car_porcentaje||pi_v_do_ape_paterno||'%'''
             ;
          end if;

          if pi_v_do_ape_materno is not null then
             v_sql_admin_where_do := v_sql_admin_where_do ||
             '
             AND PERS.APE_MATERNO LIKE '''||c_car_porcentaje||pi_v_do_ape_materno||'%'''
             ;
          end if;

          if pi_v_do_ape_casada is not null then
             v_sql_admin_where_do := v_sql_admin_where_do ||
             '
             AND PERS.APE_CASADA LIKE '''||c_car_porcentaje||pi_v_do_ape_casada||'%'''
             ;
          end if;

          if pi_v_do_pri_nombre is not null then
             v_sql_admin_where_do := v_sql_admin_where_do ||
             '
             AND PERS.PRI_NOMBRE LIKE '''||c_car_porcentaje||pi_v_do_pri_nombre||'%'''
             ;
          end if;

          if pi_v_do_seg_nombre is not null then
             v_sql_admin_where_do := v_sql_admin_where_do ||
             '
             AND PERS.SEG_NOMBRE LIKE '''||c_car_porcentaje||pi_v_do_seg_nombre||'%'''
             ;
          end if;

          --DENOMINACION O RAZON SOCIAL
          if pi_v_do_razon_social is not null then
             v_sql_admin_where_do := v_sql_admin_where_do ||
             '
             AND PERS.RAZON_SOCIAL LIKE '''||c_car_porcentaje||pi_v_do_razon_social ||'%'''
             ;
          end if;

          --TIPO DE EMPRESA
          if pi_i_do_tip_empresa<>0 then
             v_sql_admin_where_do := v_sql_admin_where_do ||
             '
             AND PERS.TIP_EMPRESA=' ||pi_i_do_tip_empresa
             ;
          end if;

          --SECTOR ECONOMICO
          if pi_n_do_id_sect_econo<>0 then
             v_sql_admin_where_do := v_sql_admin_where_do ||
             '
             AND PERS.ID_SECTOR_ECONOMICO='||pi_n_do_id_sect_econo
             ;
          end if;

          if pi_c_do_flg_asocu='1' then
             v_sql_admin_where_do := v_sql_admin_where_do ||
             '
             AND PERS.FLG_ASOCU='''||pi_c_do_flg_asocu||''''
             ;
          end if;

          v_sql_admin_where_do := v_sql_admin_where_do ||'
          )';
      END IF;

      IF c_flg_sancionado = '1' THEN
          if  c_flg_denunciado = '1' or c_flg_denunciante = '1' then
              v_sql_admin_where_s :=
              '
              OR(ADMINISTRADO.TIPO_ADMINISTRADO = ''1'' --sancionado';
          else
              v_sql_admin_where_s :=
              '
              AND(ADMINISTRADO.TIPO_ADMINISTRADO = ''1'' --sancionado';
          end if;

          --CODIGO INDECOPI
          if pi_v_s_codSanciona_ini is not null then
             v_sql_admin_where_s := v_sql_admin_where_s ||
             '
             AND TO_NUMBER(PERS.COD_SANCIONADO) BETWEEN TO_NUMBER('||pi_v_s_codSanciona_ini||') AND TO_NUMBER('||pi_v_s_codSanciona_fin||')'
             ;
          end if;

          --TIPO PERSONERIA
          if pi_i_s_tip_persona<>0 then
             v_sql_admin_where_s := v_sql_admin_where_s ||
             '
             AND PERS.TIPO_PERSONA='||pi_i_s_tip_persona
             ;
          end if;

          --TIPO DOCUMENTO
          if pi_i_s_tipo_doc<>0 then
             v_sql_admin_where_s := v_sql_admin_where_s ||
             '
             AND PERS.TIPO_DOC='||pi_i_s_tipo_doc
             ;
          end if;

          --NRO DOCUMENTO
          if pi_v_s_nro_doc is not null then
             v_sql_admin_where_s := v_sql_admin_where_s ||
             '
             AND PERS.NRO_DOC='''||pi_v_s_nro_doc||''''
             ;
          end if;

          --APELLIDOS Y NOMBRES
          if pi_v_s_ape_paterno is not null then
             v_sql_admin_where_s := v_sql_admin_where_s ||
             '
             AND PERS.APE_PATERNO LIKE '''||c_car_porcentaje||pi_v_s_ape_paterno||'%'''
             ;
          end if;

          if pi_v_s_ape_materno is not null then
             v_sql_admin_where_s := v_sql_admin_where_s ||
             '
             AND PERS.APE_MATERNO LIKE '''||c_car_porcentaje||pi_v_s_ape_materno||'%'''
             ;
          end if;

          if pi_v_s_ape_casada is not null then
             v_sql_admin_where_s := v_sql_admin_where_s ||
             '
             AND PERS.APE_CASADA LIKE '''||c_car_porcentaje||pi_v_s_ape_casada||'%'''
             ;
          end if;

          if pi_v_s_pri_nombre is not null then
             v_sql_admin_where_s := v_sql_admin_where_s ||
             '
             AND PERS.PRI_NOMBRE LIKE '''||c_car_porcentaje||pi_v_s_pri_nombre||'%'''
             ;
          end if;

          if pi_v_s_seg_nombre is not null then
             v_sql_admin_where_s := v_sql_admin_where_s ||
             '
             AND PERS.SEG_NOMBRE LIKE '''||c_car_porcentaje||pi_v_s_seg_nombre||'%'''
             ;
          end if;

          --DENOMINACION O RAZON SOCIAL
          if pi_v_s_razon_social is not null then
             v_sql_admin_where_s := v_sql_admin_where_s ||
             '
             AND PERS.RAZON_SOCIAL LIKE '''||c_car_porcentaje||pi_v_s_razon_social ||'%'''
             ;
          end if;

          --TIPO DE EMPRESA
          if pi_i_s_tip_empresa<>0 then
             v_sql_admin_where_s := v_sql_admin_where_s ||
             '
             AND PERS.TIP_EMPRESA=' ||pi_i_s_tip_empresa
             ;
          end if;

          --SECTOR ECONOMICO
          if pi_n_s_id_sect_econo<>0 then
             v_sql_admin_where_s := v_sql_admin_where_s ||
             '
             AND PERS.ID_SECTOR_ECONOMICO='||pi_n_s_id_sect_econo
             ;
          end if;

          if pi_c_s_flg_asocu='1' then
             v_sql_admin_where_s := v_sql_admin_where_s ||
             '
             AND PERS.FLG_ASOCU='''||pi_c_s_flg_asocu||''''
             ;
          end if;

          v_sql_admin_where_s := v_sql_admin_where_s ||'
          )';
      END IF;

      DBMS_OUTPUT.put_line(v_sql_admin_select);
      DBMS_OUTPUT.put_line(v_sql_admin_where_d);
      DBMS_OUTPUT.put_line(v_sql_admin_where_do);
      DBMS_OUTPUT.put_line(v_sql_admin_where_s);

      EXECUTE IMMEDIATE v_sql_admin_select || v_sql_admin_where_d || v_sql_admin_where_do || v_sql_admin_where_s;

  end if;

  IF c_flg_administrado = '0' THEN
      INSERT INTO T_SCOB_TMP_ADMINISTRADO(ID_MULTA)
      VALUES('0');
  END IF;


  --mostrar los datos de la consulta
  v_sql_select_1 := '
  SELECT
    ROWNUM AS NRO_REG,
    MULT.ID_MULTA AS ID_MULTA,
    MULT.ANIO || MULT.CUM AS CUM,

  
  

    MULT.FEC_INGRESO AS FEC_GENERACION_CUM,
    TIPO_PROC.DESCRIPCION AS NOM_TIPO_PROCEDEMIENTO,
    ORGR.CODIGO AS COD_ORGANO_RESOLUTIVO,
    ORGR.DESCRIPCION AS NOM_ORGANO_RESOLUTIVO,
    SEDE.CODIGO AS COD_SEDE,
    SEDE.DESCRIPCION AS NOM_SEDE,
    MATE.DESCRIPCION AS NOM_MATERIA,
    SUBM.DESCRIPCION AS NOM_SUB_MATERIA,
    MULT.NRO_EXP_ADMINISTRATIVO AS NRO_EXPEDIENTE_UNICO,
    MDET.NRO_EXP_NIVEL AS NRO_EXPEDIENTE_ADMINISTRATIVO,
    --PRIMERA INSTANCIA
    NIVEL1.NRO_RESOLUCION AS NRO_RESOL_OR, --num_resolu
    NIVEL1.FEC_REGISTRO AS FEC_REG_OR,
    NIVEL1.FEC_RESOLUCION AS FEC_EMI_RESOL_OR, --fec_emision
    NIVEL1.FEC_NOTIFICACION_RESOLUCION AS FEC_NOTIF_RESOL_OR, --fec_notifica
    NIVEL1.FEC_ESTADO_SGTE_INSTANCIA AS FEC_APELACION,
    NIVEL1.LOGIN_USUARIO_REGISTRO AS USU_REG_OR,

  
  
    scob_pk_utilitario.scob_fn_dias_laborables_neg(to_char(NIVEL1.FEC_RESOLUCION,''DD/MM/YYYY''),to_char(NIVEL1.FEC_REGISTRO,''DD/MM/YYYY'')) AS CANTIDAD_OR,';
  v_sql_select_2 :=
    '--SEGUNDA INSTANCIA
    NIVEL2.NRO_RESOLUCION AS NRO_RESOL_COMISION,
    NIVEL2.FEC_REGISTRO AS FEC_REG_COMISION,
    NIVEL2.FEC_RESOLUCION AS FEC_RESOL_COMISION,
    NIVEL2.FEC_NOTIFICACION_RESOLUCION AS FEC_NOTIF_RESOL_COMISION,
    NIVEL2.FEC_ESTADO_SGTE_INSTANCIA AS FEC_REVISION,
    NIVEL2.LOGIN_USUARIO_REGISTRO AS USU_REG_COMISION,

  
  
    scob_pk_utilitario.scob_fn_dias_laborables_neg(to_char(NIVEL2.FEC_RESOLUCION,''DD/MM/YYYY''),to_char(NIVEL2.FEC_REGISTRO,''DD/MM/YYYY'')) AS CANTIDAD_COMISION,
    --TERCERA INSTANCIA
    NIVEL3.NRO_RESOLUCION AS NRO_RESOL_SALA,
    NIVEL3.FEC_REGISTRO AS FEC_REG_SALA,
    NIVEL3.FEC_RESOLUCION  AS FEC_RESOL_SALA,
    NIVEL3.FEC_NOTIFICACION_RESOLUCION AS FEC_NOTIF_RESOL_SALA,
    NIVEL3.LOGIN_USUARIO_REGISTRO AS USU_REG_SALA,

  
    scob_pk_utilitario.scob_fn_dias_laborables_neg(to_char(NIVEL3.FEC_RESOLUCION,''DD/MM/YYYY''),to_char(NIVEL3.FEC_REGISTRO,''DD/MM/YYYY'')) AS CANTIDAD_SALA,
    ------------------------------------------------------
    ';
  v_sql_select_3 :=
    'TIPO_MULTA.TXT_DESCRIPCION AS NOM_TIPO_MULTA, --tipo_multa
    scob_pk_expediente.SCOB_FN_DENUNCIANTES_MULTA(mdet.id_multa,0) AS NOM_DENUNCIANTE, --denunciante
    scob_pk_expediente.SCOB_FN_DENUNCIADOS_MULTA(mdet.id_multa,0) AS NOM_DENUNCIADO, --denunciado
    scob_pk_expediente.SCOB_FN_SANCIONADOS_MULTA(mdet.id_multa,0) AS NOM_SANCIONADO, --sancionado
    scob_pk_expediente.SCOB_FN_SANCIONADOS_TIPO_DOC(mdet.id_multa,0) AS NOM_TIPO_DOC_SANCIONADO,
    scob_pk_expediente.SCOB_FN_SANCIONADOS_NRO_DOC(mdet.id_multa,0) AS NRO_TIPO_DOC_SANCIONADO,
    scob_pk_expediente.SCOB_FN_SANCIONADOS_COD_INDEC(mdet.id_multa,0) AS COD_INDECOPI_SANCIONADO,
    scob_pk_expediente.SCOB_FN_SANCIONADOS_CLAS_INDEC(mdet.id_multa,0) AS CLASIF_SANCIONADO,
    scob_pk_expediente.SCOB_FN_SANCIONADOS_CIIU(mult.id_multa,0) CIIU_SANCIONADO, --act_economica
    DECODE(NVL(MDET.POR_ASOCU,''0''),''0'',''No'',''Si'') AS IND_ASOCU,
    NVL(MDET.POR_ASOCU,0) AS PORCENTAJE_ASOCU,
    --CAMPOS ANTIDUMPING
    MUAN.TIPO_CAMBIO AS TIPO_CAMBIO_DA,
    MUAN.MONTO_ANTIDUMPING AS DERECHO_ANTIDUMPING,
    MUAN.MONTO_INTERES AS MONTO_DA_IC,
    MUAN.MONTO_INTERES_MORATORIO AS MONTO_DA_IM,
    --
    MUAN.NRO_OFICIO_SUNAT_CODIGO || MUAN.NRO_OFICIO_SUNAT_ANIO || MUAN.NRO_OFICIO_SUNAT_PREFIJO || MUAN.NRO_OFICIO_SUNAT_CORRELATIVO AS NRO_OFICIO_SUNAT,
    NRO_LIQUIDACION_CODIGO ||NRO_LIQUIDACION_ANIO || NRO_LIQUIDACION_CORRELATIVO AS NRO_LIQUIDACION_COBRANZA,
    PART.CODIGO AS COD_PARTIDA,
    PART.DESCRIPCION AS NOM_PARTIDA,
    --NO EXISTE EL CAMPO MEMO EN LA INTERFAZ DE ANTIDUMPING
    NRO_DUA_CODIGO || NRO_DUA_ANIO || NRO_DUA_CORRELATIVO AS NRO_DUA,
    MUAN.ID_INTENDENCIA AS COD_INTENDENCIA,
    INTE.DESCRIPCION AS NOM_INTENDENCIA,

    --DECODE(MUAN.NRO_LIQUIDACION_CODIGO,NULL,'''',MUAN.NRO_LIQUIDACION_CODIGO ||''-''|| MUAN.NRO_LIQUIDACION_ANIO ||''/''|| MUAN.NRO_LIQUIDACION_CORRELATIVO) AS NRO_LIQUIDACION_COBRANZA2,
    DECODE(MATE.CODIGO,11,DECODE(SUBM.CODIGO,21,MUAN.NRO_LIQUIDACION_CODIGO ||''-''|| MUAN.NRO_LIQUIDACION_ANIO ||''/''|| MUAN.NRO_LIQUIDACION_CORRELATIVO,''''),'''') AS NRO_LIQUIDACION_COBRANZA2,
    DECODE(MATE.CODIGO,11,DECODE(SUBM.CODIGO,21,TO_CHAR(NIVEL2.FEC_NOTIFICACION_RESOLUCION,''DD/MM/YYYY''),''''),'''') AS FECH_NOT_SUNAT,
    --'''' AS FECH_NOT_SUNAT,
    --MUAN.MONTO_ANTIDUMPING AS MONTO_ANTIDUMPING,
    DECODE(MATE.CODIGO,11,DECODE(SUBM.CODIGO,21,MUAN.NRO_DUA_CODIGO ||''-''|| MUAN.NRO_DUA_ANIO ||''-''|| MUAN.NRO_DUA_CORRELATIVO,''''),'''') AS NRO_DUA2,
    --DECODE(MUAN.NRO_DUA_CODIGO,NULL,'''',MUAN.NRO_DUA_CODIGO ||''-''|| MUAN.NRO_DUA_ANIO ||''-''|| MUAN.NRO_DUA_CORRELATIVO) AS NRO_DUA2,
    DECODE(MATE.CODIGO,11,DECODE(SUBM.CODIGO,21,PART.CODIGO||''-''||PART.DESCRIPCION,''''),'''') AS NOM_PARTIDA2,
    --PART.CODIGO||''-''||PART.DESCRIPCION AS NOM_PARTIDA2,
    --INTE.DESCRIPCION AS DESC_INTENDENCIA,
    --FIN CAMPOS ANTIDUMPING
    -----------------------------------
  ';
  v_sql_select_4 :=
   'NVL(MDET.VALOR_UIT,0) AS VALOR_UIT,
    MULT.MONTO_UIT AS MONTO_UIT,
    MULT.MONTO_INTERES AS MONTO_IC,
    MULT.MONTO_INTERES_MORATORIO AS MONTO_INTERES_IM,
    MULT.MONTO_COSTAS AS MONTO_COSTAS,
    --
    MULT.TOTAL_AMORTIZADO AS TOTAL_AMORTIZADO,
    MULT.TOTAL_AMORTIZADO_IC AS TOTAL_AMORTIZADO_IC,
    MULT.TOTAL_AMORTIZADO_IM AS TOTAL_AMORTIZADO_IM,
    MULT.TOTAL_AMORTIZADO_COSTAS AS TOTAL_AMORTIZADO_COSTAS,
    --
    MULT.SALDO AS SALDO, --saldo_capital
    MULT.SALDO_IC AS SALDO_IC,
    MULT.SALDO_IM AS SALDO_IM,
    MULT.SALDO_COSTAS AS SALDO_COSTAS,
    EST_MULTA_OR.TXT_DESCRIPCION AS NOM_ESTADO_MULTA_OR, --est_multa_resolu
    EST_DEUDA.TXT_DESCRIPCION AS NOM_ESTADO_PAGO, --est_pago_multa
    DECODE(MULT.COD_ESTADO_PAGO,''4'',MULT.PORCENTAJE_DESCUENTO,NULL) AS POR_DSCTO_PAGO, --porcen_dscto_pago
    MULT.FEC_GENERACION_SEC AS FEC_GENERACION_SEC, --fec_gene_sec
    MULT.ANIO_FILE_AEC AS ANIO_FILE_AEC, --anio_file
    MULT.FEC_INGRESO_AEC AS FEC_RECEPCION_FILE,
    ARCO.CODIGO || MULT.NRO_FILE_AEC AS NRO_FILE_AEC, --nro_file

  
  
  

    MCOB.NRO_INGRESO AS NRO_INGRESO_AEC,
    EST_MULTA_COB.TXT_DESCRIPCION AS NOM_ESTADO_MULTA_COB,
    DECODE(MOTIVO_MULT.ID_MOTIVO,0,NULL,MOTIVO_MULT.DESCRIPCION) AS NOM_MOTIVO_MULTA, --moti_multacobra
    MULT.FEC_ULT_IMPROCEDENCIA AS FEC_ULT_OBSERVACION_AEC,
  ';
  v_sql_select_5 :=
    'MULT.FEC_INGRESO_FILE  AS FEC_ULT_INGRESO_AEC,
    EXPE.ANIO||EXPE.NRO_EXPEDIENTE AS NRO_EXPED_COB, --nro_expe_cobranza
    EXPE.FEC_INGRESO AS FEC_GENERACION_EXPED_COB, --fec_gen_exp_cobran
    USUA.USUARIO AS USU_GESTOR_COBRANZA, --gestor_cobranza
    MULT.FECHA_ASIG_COBRANZA AS FEC_ASIG_GESTOR_COBRANZA,
    MULT.FEC_ULT_GEN_PRECOACTIVA AS FEC_ULT_GEN_PRECOACTIVA,
    MULT.FEC_EMISION_REC AS FEC_EMISION_REC, --fec_emision_REC
    MULT.FEC_NOTIF_REC AS FEC_NOTIF_REC, --fec_notifi_REC
    DECODE(NVL(EXPE.FLG_EMBARGO,''0''),''0'',''No'', ''Si'') AS IND_EMBARGO,
    EST_EXP.DESCRIPCION AS NOM_ESTADO_EXPED_COB, --est_exp_cobranza
    MOTIVO_EXPE.DESCRIPCION AS NOM_MOTIVO_EXPED_COB, --moti_exp_cobranza
    EXPE.FEC_ESTADO_EXPEDIENTE AS FEC_ULT_ESTADO_EXPED_COB, --fec_est_exp_cobran
    SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES('||SCOB_PK_CONSTANTES.C_TBL_ESPECTATIVA_COBRO_EXPCOB||',EXPE.COD_EXPECTATIVA_COBRO) AS NOM_EXPECTATIVA_COBRO,
    scob_pk_expediente.SCOB_FN_SANCIONADOS_REGION(mdet.id_multa,0) AS REGION_SANCIONADO,

    DECODE(EXPE.ID_EXPEDIENTE,NULL,MULT.FEC_ENVIO_RIESGO,MULT.FEC_ENVIO_RIESGO_EXP) AS FEC_MARCA_ENVIO_INFOCORP, --(FECHA EN QUE "MARCA" PARA ENVIAR A INFOCORP)
    ARCH_CEN.NRO_ORDEN AS NRO_ENVIO_ARCHIVO, --nro_envarch_central
    ARCH_CEN.FEC_ENVIO AS FEC_ENVIO_ARCHIVO, --fec_envarch_central
    (CASE
      WHEN MULT.ESTADO_ENVIO_ARCHIVO = 2 THEN ''ARCHIVO CENTRAL''
      WHEN MULT.ESTADO_MULTA IN (9,10,11,12,13) THEN ''AEC''
      ELSE '' '' END) AS UBI_FISICA_EXPEDIENTE,
    SIT_MULTA.COD_SITUACION_MULTA AS COD_SITUACION_MULTA,

    TIPO_PROC.Codigo   AS vc_cod_tipoproc,
    MATE.CODIGO        AS VC_COD_MATERIA,
    SUBM.CODIGO        AS VC_COD_SUBMATERIA,
    EST_MULTA_OR.COD_INTERNO  AS VC_COD_EST_MULTA,
    EST_DEUDA.COD_INTERNO     AS VC_COD_EST_PAGO,
    EST_MULTA_COB.COD_INTERNO AS VC_COD_EST_MULTA_COB,
    EST_EXP.CODIGO            AS VC_CODIGO_EST_EXP,
    MOTIVO_EXPE.CODIGO        AS VC_COD_MOTIVO_EXPED_COB,
    NULL               AS VC_CODIGO_CLASIFICACION,
    NULL               AS VC_CODIGO_CIIU,
    (CASE WHEN EXPE.ESTADO_EXPEDIENTE = 4 THEN
     ''FR'' ELSE ''NF'' END) AS VC_TIPO_MULTA,
    scob_pk_consulta.fn_getReso_gaf_aprueba(EXPE.id_expediente) AS vc_reso_gaf_APRUEBA,
    scob_pk_consulta.fn_getFecReso_gaf_aprueba(EXPE.id_expediente) AS vc_FEC_reso_gaf_APRUEBA,
    scob_pk_consulta.fn_getReso_gaf_perdida(EXPE.id_expediente) AS vc_reso_gaf_PERDIDA,
    scob_pk_consulta.fn_getFecReso_gaf_perdida(EXPE.id_expediente) AS vc_FEC_reso_gaf_PERDIDA,
    scob_pk_consulta.SCOB_FN_COD_DENUNCIANTES_MULTA(mdet.id_multa,0) AS VC_NRO_DOC_DENUNCIANTE,
    DECODE(MULT.COD_MOTIVO, 0, NULL, MULT.COD_MOTIVO) AS VC_COD_MOTIVO_MULTA_COB,
    scob_pk_consulta.SCOB_FN_CENTRO_DE_COSTO(MULT.ID_MULTA) AS VC_COD_CENTRO_COSTO, 

    NULL AS VC_NRO_REC_DECLA_01,
    NULL AS DT_RES_CONS_FIRME_01,
    NULL AS DT_NOTF_CONS_FIRME_01,
    NULL AS VC_NRO_REC_DECLA_02,
    NULL AS DT_RES_CONS_FIRME_02,
    NULL AS DT_NOTF_CONS_FIRME_02,
    NULL AS VC_NRO_REC_DECLA_03,
    NULL AS DT_RES_CONS_FIRME_03,
    NULL AS DT_NOTF_CONS_FIRME_03,

  
    NULL AS V_ACUM, 
    NULL AS ES_ACUM,
    NULL AS ID_EXPEDIENTE,
    NULL AS UIT_NIVEL1,
    NULL AS FEC_DECLARACION_NIVEL1,
    NULL AS F_REGISTRO_NIVEL1,
    NULL AS UIT_NIVEL2,
    NULL AS FEC_DECLARACION_NIVEL2,
    NULL AS F_REGISTRO_NIVEL2,
    NULL AS UIT_NIVEL3,
    NULL AS F_REGISTRO_NIVEL3,
  NULL AS NRO_FILE_CUM_ALFA ';
  --JOINS
  v_sql_join_1 := '
  FROM T_SCOB_MULTA MULT
  INNER JOIN T_SCOB_MULTA_DETAL MDET
       ON MDET.ID_MULTA = MULT.ID_MULTA
       AND MDET.FLG_ACTUAL = ''1''
       AND MDET.ESTADO = ''1''
  INNER JOIN (
    SELECT DISTINCT ID_MULTA AS ID_MULTA
    FROM T_SCOB_TMP_ADMINISTRADO
  ) ADMINISTRADO
  ON (
     ('||c_flg_administrado||' = ''0'' AND ''0''=ADMINISTRADO.ID_MULTA)OR
     ('||c_flg_administrado||' <> ''0'' AND ADMINISTRADO.ID_MULTA = MULT.ID_MULTA)
  )
  INNER JOIN T_SCOB_TMP_SITUACION_MULTA SIT_MULTA
        ON SIT_MULTA.ID_MULTA = MULT.ID_MULTA
  INNER JOIN T_SCOB_MATERIA MATE
       ON MATE.ID_MATERIA = MULT.ID_MATERIA
  INNER JOIN T_SCOB_TIPO_PROCEDIMIENTO TIPO_PROC
       ON TIPO_PROC.ID_TIPO_PROCEDIMIENTO = MATE.ID_TIPO_PROCEDIMIENTO
  INNER JOIN T_SCOB_SUBMATERIA SUBM
       ON SUBM.ID_SUBMATERIA = MULT.ID_SUB_MATERIA
  INNER JOIN T_SCOB_ORGANO_RESOLUTIVO ORGR
       ON ORGR.ID_ORGANO_RESOLUTIVO = MDET.ID_ORGANO_RESOLUTIVO
  INNER JOIN T_SCOB_UBIGEO UBIG_ORGR
       ON UBIG_ORGR.COD_DPTO = ORGR.COD_DPTO
       AND UBIG_ORGR.COD_PROV = ORGR.COD_PROV
       AND UBIG_ORGR.COD_DIST = ORGR.COD_DIST
  INNER JOIN T_SCOB_SEDE SEDE
       ON SEDE.ID_SEDE = MULT.ID_SEDE
  INNER JOIN T_SCOB_UBIGEO UBIG_SEDE
       ON UBIG_SEDE.COD_DPTO = SEDE.COD_DPTO
       AND UBIG_SEDE.COD_PROV = SEDE.COD_PROV
       AND UBIG_SEDE.COD_DIST = SEDE.COD_DIST
  INNER JOIN T_SCOB_TABLA_DET TIPO_MULTA
        ON TIPO_MULTA.ID_TABLA = 45 --TIPO MULTA
        AND TO_NUMBER(TIPO_MULTA.COD_INTERNO) = TO_NUMBER(MULT.FLG_TIPO_MULTA)
  INNER JOIN T_SCOB_TABLA_DET EST_DEUDA
        ON EST_DEUDA.ID_TABLA = 34 --ESTADO DEUDA PAGO
        AND TO_NUMBER(EST_DEUDA.COD_INTERNO) = MULT.COD_ESTADO_PAGO';

  v_sql_join_2 := '
  LEFT JOIN T_SCOB_TABLA_DET EST_MULTA_OR
        ON EST_MULTA_OR.ID_TABLA = 5 --ESTADO MULTA OR
        AND TO_NUMBER(EST_MULTA_OR.COD_INTERNO) = MDET.ESTADO_MULTA
        AND TO_NUMBER(EST_MULTA_OR.TXT_VALOR1) = 1
  LEFT JOIN T_SCOB_TABLA_DET EST_MULTA_COB
       ON EST_MULTA_COB.ID_TABLA = 5 --ESTADO MULTA COBRANZA
       AND TO_NUMBER(EST_MULTA_COB.COD_INTERNO) = MULT.ESTADO_MULTA
       AND TO_NUMBER(EST_MULTA_COB.TXT_VALOR1) = 2
  LEFT JOIN T_SCOB_AREA_COBRANZA ARCO
       ON ARCO.ID_AREA_COBRANZA = MULT.ID_AREA_COBRANZA
  LEFT JOIN T_SCOB_USUARIO USUA
       ON USUA.ID_USUARIO = MULT.ID_USUARIO_ASIG_COBRANZA
  ------------------------------------------------------------------------------
  ---INSTANCIAS
  LEFT JOIN T_SCOB_TMP_INSTANCIAS_MULTA1 NIVEL1
       ON NIVEL1.NRO_NIVEL = '||SCOB_PK_CONSTANTES.C_TBL_TIPO_INSTANCIA_AUTO||'
       AND NIVEL1.ID_MULTA = MULT.ID_MULTA
  LEFT JOIN T_SCOB_TMP_INSTANCIAS_MULTA1 NIVEL2
       ON NIVEL2.NRO_NIVEL = '||SCOB_PK_CONSTANTES.C_TBL_TIPO_INSTANCIA_COMI||'
       AND NIVEL2.ID_MULTA = MULT.ID_MULTA
  LEFT JOIN T_SCOB_TMP_INSTANCIAS_MULTA1 NIVEL3
       ON NIVEL3.NRO_NIVEL = '||SCOB_PK_CONSTANTES.C_TBL_TIPO_INSTANCIA_SALA||'
       AND NIVEL3.ID_MULTA = MULT.ID_MULTA
  ------------------------------------------------------------------------------
  LEFT JOIN T_SCOB_MULTA_COBRANZA MCOB
       ON MCOB.ID_MULTA = MULT.ID_MULTA
       AND MCOB.FLG_ACTUAL = ''1''
       AND MCOB.ESTADO = ''1''';

  v_sql_join_3 := '
  LEFT JOIN T_SCOB_EST_MUL_COB_MOTIVO MOTIVO_MULT --motivo multa cobranza
       ON MOTIVO_MULT.ID_MOTIVO = MULT.COD_MOTIVO
  LEFT JOIN T_SCOB_EXPEDIENTE_MULTA EXMU
       ON EXMU.ID_MULTA = MULT.ID_MULTA
       AND EXMU.ESTADO = ''1''
  LEFT JOIN T_SCOB_EXPEDIENTE EXPE
       ON EXPE.ID_EXPEDIENTE = EXMU.ID_EXPEDIENTE
       AND EXPE.ESTADO = ''1''
  LEFT JOIN T_SCOB_EST_EXP_COB EST_EXP
       ON EST_EXP.ID_EST_EXP_COB = EXPE.ESTADO_EXPEDIENTE
  LEFT JOIN T_SCOB_EST_EXP_COB_MOTIVO MOTIVO_EXPE --motivo estado expediente
       ON MOTIVO_EXPE.ID_MOTIVO = EXPE.ID_MOTIVO
  LEFT JOIN T_SCOB_MULTA_ANTIDUMPING MUAN
       ON MUAN.ID_MULTA = MULT.ID_MULTA
       AND MUAN.ESTADO = ''1''
  LEFT JOIN T_SCOB_INTENDENCIA INTE
       ON INTE.ID_INTENDENCIA = MUAN.ID_INTENDENCIA
  LEFT JOIN T_SCOB_PARTIDA PART
       ON PART.ID_PARTIDA = MUAN.ID_PARTIDA';

  v_sql_join_4 := '
  LEFT JOIN T_SCOB_MULTA_ARCHIVO_CENTRAL EXPED_ARCH_CEN
       ON EXPED_ARCH_CEN.ID_MULTA = MULT.ID_MULTA
       AND EXPED_ARCH_CEN.FLG_ACTUAL = ''1''
       AND EXPED_ARCH_CEN.ESTADO = ''1''
  LEFT JOIN T_SCOB_ARCHIVO_CENTRAL ARCH_CEN
       ON ARCH_CEN.ID_ARCHIVO_CENTRAL = EXPED_ARCH_CEN.ID_MULTA_ARCHIVO_CENTRAL
       AND ARCH_CEN.ESTADO = ''1''';

  v_sql_where_1 := v_sql_where_1 || '
  WHERE MULT.ESTADO = ''1''';

  ---------------------------------------------------------------------------
  -- FILTROS MULTA
  ---------------------------------------------------------------------------
  --AREA MACRO
  if pi_v_area_macro is not null then
     v_sql_where_1 := v_sql_where_1 || '
     AND INSTR('''||pi_v_area_macro||''',''|'' || TO_CHAR(TIPO_PROC.ID_TIPO_PROCEDIMIENTO) || ''|'' )>0';
  end if;

  --CODIGO MULTA
  if pi_v_cum_ini is not null then
     v_sql_where_1 := v_sql_where_1 || '
     AND MULT.ANIO||MULT.CUM BETWEEN '''||pi_v_cum_ini||''' AND '''||pi_v_cum_fin|| '''';
  end if;

  --FECHA GENERACION MULTA
  if pi_v_fec_gen_cum_ini is not null then
     v_sql_where_1 := v_sql_where_1 || '
     AND TO_DATE(TO_CHAR(MULT.FEC_INGRESO,''DD/MM/YYYY''),''DD/MM/YYYY'')
     BETWEEN TO_DATE('''||pi_v_fec_gen_cum_ini||''',''DD/MM/YYYY'') AND TO_DATE('''||pi_v_fec_gen_cum_fin||''',''DD/MM/YYYY'')
     ';
  end if;

  --SEDE
  if pi_v_id_sede is not null then
     v_sql_where_1 := v_sql_where_1 || '
     AND INSTR('''||pi_v_id_sede||''',''|'' || TO_CHAR(MULT.ID_SEDE) || ''|'' )>0';
  end if;

  --UBIGEO SEDE
  if PI_V_ID_COD_DPTO_SEDE is not null then
     v_sql_where_1 := v_sql_where_1 || '
     AND SEDE.COD_DPTO='''||PI_V_ID_COD_DPTO_SEDE||'''';
  end if;

  if PI_V_ID_COD_PROV_SEDE is not null then
     v_sql_where_2 := v_sql_where_2 || '
     AND SEDE.COD_PROV='''||PI_V_ID_COD_PROV_SEDE||'''';
  end if;

  if PI_V_ID_COD_DIST_SEDE is not null then
     v_sql_where_2 := v_sql_where_2 || '
     AND SEDE.COD_DIST='''||PI_V_ID_COD_DIST_SEDE||'''';
  end if;

  --ORGANO RESOLUTIVO
  if pi_v_id_org_resol is not null then
     v_sql_where_2 := v_sql_where_2 || '
     AND INSTR('''||pi_v_id_org_resol||''',''|'' || TO_CHAR(MDET.ID_ORGANO_RESOLUTIVO) || ''|'' )>0';
  end if;

  --UBIGEO ORGANO RESOLUTIVO
  if PI_V_ID_COD_DPTO_ORGR is not null then
     v_sql_where_2 := v_sql_where_2 || '
     AND ORGR.COD_DPTO='''||PI_V_ID_COD_DPTO_ORGR||'''';
  end if;

  if PI_V_ID_COD_PROV_ORGR is not null then
     v_sql_where_2 := v_sql_where_2 || '
     AND ORGR.COD_PROV='''||PI_V_ID_COD_PROV_ORGR||'''';
  end if;
  if PI_V_ID_COD_DIST_ORGR is not null then
     v_sql_where_3 := v_sql_where_3 || '
     AND ORGR.COD_DIST='''||PI_V_ID_COD_DIST_ORGR||'''';
  end if;

  --TIPO INSTANCIA
  if PI_V_ID_NRO_INSTANCIA is not null then
     v_sql_where_3 := v_sql_where_3 || '
     AND INSTR('''||PI_V_ID_NRO_INSTANCIA||''',''|'' || TO_CHAR(ORGR.TIPO_INSTANCIA) || ''|'' )>0';
  end if;

  --MATERIA
  if pi_v_id_materia is not null then
     v_sql_where_3 := v_sql_where_3 || '
     AND INSTR('''||pi_v_id_materia||''',''|'' || TO_CHAR(MULT.ID_MATERIA) || ''|'' )>0';
  end if;

  --SUBMATERIA
  if pi_v_id_sub_materia is not null then
     v_sql_where_3 := v_sql_where_3 || '
     AND INSTR('''||pi_v_id_sub_materia||''',''|'' || TO_CHAR(MULT.ID_SUB_MATERIA) || ''|'' )>0';
  end if;

  --NUMERO EXPEDIENTE UNICO
  if pi_v_nro_exp_unico_ini is not null then
     v_sql_where_3 := v_sql_where_3 || '
     AND TO_NUMBER(MULT.NRO_EXPED_UNICO) --@0001
        BETWEEN '''||pi_v_nro_exp_unico_ini||''' and '''||pi_v_nro_exp_unico_fin||'''';
  end if;

  --NUMERO EXPEDIENTE ADMINISTRATIVO
  if pi_v_nroExpAdm_nivel is not null then
     v_sql_where_3 := v_sql_where_3 || '
     AND MDET.NRO_EXP_NIVEL LIKE '''|| pi_v_nroExpAdm_nivel ||'%''';
  end if;

  --NRO RESOLUCION OR
  if pi_v_nro_resol is not null then
     v_sql_where_3 := v_sql_where_3 || '
     AND NIVEL1.NRO_RESOLUCION LIKE '''|| pi_v_nro_resol || '%''';
  end if;

  --FECHA RESOLUCION OR
  if pi_v_fec_reso_or_ini is not null then
     v_sql_where_3 := v_sql_where_3 || '
     AND TO_DATE(TO_CHAR(MDET.FEC_RESOLUCION,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE('''||pi_v_fec_reso_or_ini||''',''DD/MM/YYYY'') AND TO_DATE('''||pi_v_fec_reso_or_fin||''',''DD/MM/YYYY'')';
  end if;

  --FECHA NOTIFICACION RESOLUCION OR
  if pi_v_fec_notifi_or_ini is not null then
     v_sql_where_4 := v_sql_where_4 || '
     AND TO_DATE(TO_CHAR(MDET.FEC_NOTIFICACION_RESOLUCION,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE('''||pi_v_fec_notifi_or_ini||''',''DD/MM/YYYY'') AND TO_DATE('''||pi_v_fec_notifi_or_fin||''',''DD/MM/YYYY'')';
  end if;

  --FECHA GENERACION DE LA SEC
  if PI_V_FEC_GENERACION_SEC_INI is not null then
     v_sql_where_4 := v_sql_where_4 || '
     AND TO_DATE(TO_CHAR(MULT.FEC_GENERACION_SEC,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE('''||PI_V_FEC_GENERACION_SEC_INI||''',''DD/MM/YYYY'') AND TO_DATE('''||PI_V_FEC_GENERACION_SEC_FIN||''',''DD/MM/YYYY'')';
  end if;

  --FECHA INGRESO AL AEC
  if pi_v_fec_recepcion_aec_ini is not null then
     v_sql_where_4 := v_sql_where_4 || '
     AND TO_DATE(TO_CHAR(MULT.FEC_INGRESO_FILE,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE('''||pi_v_fec_recepcion_aec_ini||''',''DD/MM/YYYY'') AND TO_DATE('''||pi_v_fec_recepcion_aec_fin||''',''DD/MM/YYYY'')';
  end if;

  --AÑO INGRESO AL AEC
  if PI_V_ANIO_INGRESO_AEC_INI is not null then
     v_sql_where_4 := v_sql_where_4 || '
     AND MCOB.ANIO
         BETWEEN '''||PI_V_ANIO_INGRESO_AEC_INI||''' AND '''||PI_V_ANIO_INGRESO_AEC_FIN||'''';
  end if;

  --NRO INGRESO AL AEC
  if PI_V_NRO_INGRESO_AEC_INI is not null then
     v_sql_where_4 := v_sql_where_4 || '
     AND MCOB.NRO_INGRESO
         BETWEEN '''||LPAD(PI_V_NRO_INGRESO_AEC_INI,4,'0000')||''' AND '''||LPAD(PI_V_NRO_INGRESO_AEC_FIN,4,'0000')||'''';
  end if;

  --AÑO FILE
  if PI_V_ANIO_FILE_INI is not null then
     v_sql_where_4 := v_sql_where_4 || '
     AND MULT.ANIO_FILE_AEC BETWEEN '''||PI_V_ANIO_FILE_INI||''' AND '''||PI_V_ANIO_FILE_FIN||'''';
  end if;

  --NRO FILE
  if PI_V_NRO_FILE_INI is not null then
     v_sql_where_4 := v_sql_where_4 || '
     AND MULT.NRO_FILE_AEC
         BETWEEN '''||LPAD(PI_V_NRO_FILE_INI,10,'0000000000')||''' AND '''||LPAD(PI_V_NRO_FILE_FIN,10,'0000000000')||'''';
  end if;

  --VALOR UIT
  if pi_n_valor_uit_ini>0 then
     v_sql_where_5 := v_sql_where_5 || '
     AND MDET.VALOR_UIT
         BETWEEN '||pi_n_valor_uit_ini||' AND '||pi_n_valor_uit_fin;
  end if;

  --MONTO UIT
  if pi_n_monto_uit_ini>0 then
     v_sql_where_5 := v_sql_where_5 || '
     AND MULT.MONTO_UIT
         BETWEEN '||pi_n_monto_uit_ini||' AND '||pi_n_monto_uit_fin;
  end if;

  --SALDO UIT
  if pi_n_saldo_ini>0 then
     v_sql_where_5 := v_sql_where_5 || '
     AND MULT.SALDO
         BETWEEN '||pi_n_saldo_ini||' AND '||pi_n_saldo_fin;
  end if;

  --TIPO MULTA
  if pi_v_id_tipo_multa is not null then
     v_sql_where_5 := v_sql_where_5 || '
     AND INSTR('''||pi_v_id_tipo_multa||''',''|'' || MULT.FLG_TIPO_MULTA || ''|'' )>0';
  end if;

  --ESTADO MULTA OR
  if pi_v_cod_estado_multa_resol is not null then
     v_sql_where_5 := v_sql_where_5 || '
     AND INSTR('''||pi_v_cod_estado_multa_resol||''',''|'' || TO_CHAR(MDET.ESTADO_MULTA) || ''|'' )>0';
  end if;

  --ESTADO PAGO MULTA
  if pi_v_cod_estado_pago is not null then
     v_sql_where_5 := v_sql_where_5 || '
     AND INSTR('''||pi_v_cod_estado_pago||''',''|'' || TO_CHAR(MULT.COD_ESTADO_PAGO) || ''|'' )>0';
  end if;

  --FECHA ESTADO MULTA OR
  if PI_V_FEC_ESTADO_MULTA_OR_INI is not null then
     v_sql_where_6 := v_sql_where_6 || '
     AND TO_DATE(TO_CHAR(MDET.FEC_ESTADO_MULTA,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE('''||PI_V_FEC_ESTADO_MULTA_OR_INI||''',''DD/MM/YYYY'') AND TO_DATE('''||PI_V_FEC_ESTADO_MULTA_OR_FIN||''',''DD/MM/YYYY'')';
  end if;

  --FECHA ESTADO MULTA COB
  if PI_V_FEC_ESTADO_MULTA_COB_INI is not null then
     v_sql_where_6 := v_sql_where_6 || '
     AND TO_DATE(TO_CHAR(MULT.FEC_ESTADO_MULTA,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE('''||PI_V_FEC_ESTADO_MULTA_COB_INI||''',''DD/MM/YYYY'') AND TO_DATE('''||PI_V_FEC_ESTADO_MULTA_COB_FIN||''',''DD/MM/YYYY'')';
  end if;

  --ESTADO MULTA COBRANZA
  if pi_v_cod_estado_multa_cob is not null then
     v_sql_where_6 := v_sql_where_6 || '
     AND INSTR('''||pi_v_cod_estado_multa_cob||''',''|'' || TO_CHAR(MULT.ESTADO_MULTA) || ''|'' )>0';
  end if;

  --MOTIVO MULTA COBRANZA
  if pi_v_cod_motivo_multa_cob is not null then
     v_sql_where_6 := v_sql_where_6 || '
     AND INSTR('''||pi_v_cod_motivo_multa_cob||''',''|'' || MULT.COD_MOTIVO || ''|'' )>0';
  end if;

  --INDICADOR DE PAGO
  if PI_V_IND_TIPO_PAGO is not null then
     v_sql_where_6 := v_sql_where_6 || '
     AND INSTR('''||PI_V_IND_TIPO_PAGO||''',''|'' || TO_CHAR(SIT_MULTA.COD_SITUACION_MULTA) || ''|'' )>0';
  end if;

  --INDICADOR PORCENTAJE ASOCU MULTA
  if pi_c_flg_asocu_multa<>'0' then
     v_sql_where_6 := v_sql_where_6 || '
     AND NVL(MDET.POR_ASOCU,0) > 0';
  end if;

  --EXPECTATIVA DE COBRO
  if pi_v_id_expectativa_cobro is not null then
     v_sql_where_7 := v_sql_where_7 || '
     AND INSTR('''||pi_v_id_expectativa_cobro||''',''|'' || TO_CHAR(EXPE.COD_EXPECTATIVA_COBRO) || ''|'' )>0';
  end if;

  --INDICADOR EMBARGO
  if pi_c_flg_ind_embargo<>'0' then
     v_sql_where_7 := v_sql_where_7 || '
     AND NVL(EXPE.FLG_EMBARGO,''0'') = ''1''';
  end if;

  --FECHA ULTIMA GENERACION PRECOACTIVO
  if pi_v_fec_carta_precoactiva_ini is not null then
     v_sql_where_7 := v_sql_where_7 || '
     AND TO_DATE(TO_CHAR(MULT.FEC_ULT_GEN_PRECOACTIVA,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE('''||pi_v_fec_carta_precoactiva_ini||''',''DD/MM/YYYY'') AND TO_DATE('''||pi_v_fec_carta_precoactiva_fin||''',''DD/MM/YYYY'')';
  end if;

 --FECHA RECEPCION FILE
  if pi_v_fec_recepcion_file_ini is not null then
     v_sql_where_7 := v_sql_where_7 || '
     AND TO_DATE(TO_CHAR(MULT.FEC_INGRESO_AEC,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE('''||pi_v_fec_recepcion_file_ini||''',''DD/MM/YYYY'') AND TO_DATE('''||pi_v_fec_recepcion_file_fin||''',''DD/MM/YYYY'')';
  end if;

  ---------------------------------------------------------------------------
  -- FILTROS EXPEDIENTE
  ---------------------------------------------------------------------------
  --ESTADO EXPEDIENTE COBRANZA
  if pi_v_cod_estado_exped_cob is not null then
     v_sql_where_7 := v_sql_where_7 || '
     AND INSTR('''||pi_v_cod_estado_exped_cob||''',''|'' || TO_CHAR(EXPE.ESTADO_EXPEDIENTE) || ''|'' )>0';
  end if;

  --AÑO EXPEDIENTE COBRANZA
  if pi_v_anio is not null then
     v_sql_where_7 := v_sql_where_7 || '
     AND EXPE.ANIO='''||pi_v_anio||'''';
  end if;

  --NRO EXPEDIENTE COBRANZA
  if pi_v_nro_exp_cob_ini>0 then
     v_sql_where_7 := v_sql_where_7 || '
     AND EXPE.NRO_EXPEDIENTE
         BETWEEN lpad('''||pi_v_nro_exp_cob_ini||''',10,''0000000000'') AND lpad('''||pi_v_nro_exp_cob_fin||''',10,''0000000000'')';
  end if;

  --FECHA GENERACION EXPEDIENTE COBRANZA
  if pi_v_fec_gen_exped_cob_ini is not null then
     v_sql_where_8 := v_sql_where_8 || '
     AND TO_DATE(TO_CHAR(EXPE.FEC_INGRESO,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE('''||pi_v_fec_gen_exped_cob_ini||''',''DD/MM/YYYY'') AND TO_DATE('''||pi_v_fec_gen_exped_cob_fin||''',''DD/MM/YYYY'')';
  end if;

  --GESTOR COBRANZA
  if pi_v_gestor_cobranza is not null then
     v_sql_where_8 := v_sql_where_8 || '
     AND INSTR('''||pi_v_gestor_cobranza||''',''|'' || TO_CHAR(MULT.ID_USUARIO_ASIG_COBRANZA) || ''|'' )>0';
  end if;

  --FECHA EMISION DE LA REC
  if pi_v_fec_emi_rec_ini is not null then
     v_sql_where_8 := v_sql_where_8 || '
     AND TO_DATE(TO_CHAR(MULT.FEC_EMISION_REC,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE('''||pi_v_fec_emi_rec_ini||''',''DD/MM/YYYY'') AND TO_DATE('''||nvl(pi_v_fec_emi_rec_fin,pi_v_fec_emi_rec_ini)||''',''DD/MM/YYYY'')';
  end if;

  --FECHA NOTIFICACION DE LA REC
  if pi_v_fec_noti_rec_ini is not null then
     v_sql_where_8 := v_sql_where_8 || '
     AND TO_DATE(TO_CHAR(MULT.FEC_NOTIF_REC,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE('''||pi_v_fec_noti_rec_ini||''',''DD/MM/YYYY'') AND TO_DATE('''||pi_v_fec_noti_rec_fin||''',''DD/MM/YYYY'')';
  end if;

  --MOTIVO EXPEDIENTE COBRANZA
  if pi_v_cod_motivo_exped_cob is not null then
     v_sql_where_8 := v_sql_where_8 || '
     AND INSTR('''||pi_v_cod_motivo_exped_cob||''',''|'' || TO_CHAR(EXPE.ID_MOTIVO) || ''|'' )>0';
  end if;

  --FECHA ULTIMO ESTADO EXPEDIENTE
  if pi_v_fec_est_exped_cob_ini is not null then
     v_sql_where_9 := v_sql_where_9 || '
     AND TO_DATE(TO_CHAR(EXPE.FEC_ESTADO_EXPEDIENTE,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE('''||pi_v_fec_est_exped_cob_ini||''',''DD/MM/YYYY'') AND TO_DATE('''||pi_v_fec_est_exped_cob_fin||''',''DD/MM/YYYY'')';
  end if;

  --NUMERO DE ENVIO A ARCHIVO CENTRAL
  if pi_v_num_env_arch_ini is not null then
     v_sql_where_9 := v_sql_where_9 || '
     AND ARCH_CEN.NRO_ORDEN
         BETWEEN LPAD('''||pi_v_num_env_arch_ini||''',4,''0000'') AND LPAD('''||pi_v_num_env_arch_fin||''',4,''0000'')';
  end if;

  --FECHA ENVIO ARCHIVO CENTRAL
  if pi_v_fec_envi_arch_ini is not null then
     v_sql_where_9 := v_sql_where_9 || '
     AND TO_DATE(TO_CHAR(ARCH_CEN.FEC_ENVIO,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE('''||pi_v_fec_envi_arch_ini||''',''DD/MM/YYYY'') AND TO_DATE('''||pi_v_fec_envi_arch_fin||''',''DD/MM/YYYY'')';
  end if;

  --NRO OFICIO SUNAT
  if pi_v_nro_ofic_sunat_ini is not null then
     v_sql_where_9 := v_sql_where_9 || '
     AND (MUAN.NRO_OFICIO_SUNAT_CODIGO || MUAN.NRO_OFICIO_SUNAT_ANIO ||
     MUAN.NRO_OFICIO_SUNAT_PREFIJO || MUAN.NRO_OFICIO_SUNAT_CORRELATIVO)
     BETWEEN '''||pi_v_nro_ofic_sunat_ini||''' AND '''||pi_v_nro_ofic_sunat_fin||'''';
  end if;

  --DERECHO ANTIDUMOPING
  if pi_n_dere_antiDump_ini>0 then
     v_sql_where_9 := v_sql_where_9 || '
     AND MUAN.MONTO_ANTIDUMPING
         BETWEEN '||pi_n_dere_antiDump_ini||' AND '||pi_n_dere_antiDump_fin;
  end if;

  --PARTIDA ARANCELARIA
  if pi_v_nro_parti_ini is not null then
  v_sql_where_10 := v_sql_where_10 || '
      AND PART.CODIGO
      BETWEEN lpad('''||pi_v_nro_parti_ini||''',10,''0000000000'') AND lpad('''||pi_v_nro_parti_fin||''',10,''0000000000'')';
  end if;

  --MEMO ANTIDUMPING --FALTA EL CAMPO NO EXISTE EN LA INTERFAZ
  --NRO DUA
  if pi_v_nro_dua_ini is not null then
     v_sql_where_10 := v_sql_where_10 || '
     AND (MUAN.NRO_DUA_CODIGO || MUAN.NRO_DUA_ANIO || MUAN.NRO_DUA_CORRELATIVO)
         BETWEEN '''||pi_v_nro_dua_ini||''' AND '''||pi_v_nro_dua_fin||'''';
  end if;

  --NRO LIQUIDACION COBRANZA
  if pi_v_nro_liq_cob_ini is not null then
     v_sql_where_10 := v_sql_where_10 || '
     AND (MUAN.NRO_LIQUIDACION_CODIGO || MUAN.NRO_LIQUIDACION_ANIO || MUAN.NRO_LIQUIDACION_CORRELATIVO)
         BETWEEN '''||pi_v_nro_liq_cob_ini||''' AND '''||pi_v_nro_liq_cob_fin||'''';
  end if;

  --INTENDENCIA
  if pi_v_id_intendencia is not null then
     v_sql_where_10 := v_sql_where_10 || '
     AND INSTR('''||pi_v_id_intendencia||''',''|'' || TO_CHAR(MUAN.ID_INTENDENCIA) || ''|'' )>0';
  end if;

 --FECHA ASIGNACION GESTOR COBRANZA
  if pi_v_fec_asig_gestor_ini is not null then
     v_sql_where_11 := v_sql_where_11 || '
     AND TO_DATE(TO_CHAR(MULT.FECHA_ASIG_COBRANZA,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE('''||pi_v_fec_asig_gestor_ini||''',''DD/MM/YYYY'') AND TO_DATE('''||pi_v_fec_asig_gestor_fin||''',''DD/MM/YYYY'')';
  end if;

  v_sql_where_12 := v_sql_where_12 || '
  ORDER BY CUM DESC';


  DBMS_OUTPUT.put_line(v_sql_select_1);
  DBMS_OUTPUT.put_line(v_sql_select_2);
  DBMS_OUTPUT.put_line(v_sql_select_3);
  DBMS_OUTPUT.put_line(v_sql_select_4);
  DBMS_OUTPUT.put_line(v_sql_select_5);
  ---
  DBMS_OUTPUT.put_line(v_sql_join_1);
  DBMS_OUTPUT.put_line(v_sql_join_2);
  DBMS_OUTPUT.put_line(v_sql_join_3);
  DBMS_OUTPUT.put_line(v_sql_join_4);
  DBMS_OUTPUT.put_line(v_sql_join_5);
  ---
  DBMS_OUTPUT.put_line(v_sql_where_1);
  DBMS_OUTPUT.put_line(v_sql_where_2);
  DBMS_OUTPUT.put_line(v_sql_where_3);
  DBMS_OUTPUT.put_line(v_sql_where_4);
  DBMS_OUTPUT.put_line(v_sql_where_5);
  ---
  DBMS_OUTPUT.put_line(v_sql_where_6);
  DBMS_OUTPUT.put_line(v_sql_where_7);
  DBMS_OUTPUT.put_line(v_sql_where_8);
  DBMS_OUTPUT.put_line(v_sql_where_9);
  DBMS_OUTPUT.put_line(v_sql_where_10);
  DBMS_OUTPUT.put_line(v_sql_where_11);
  DBMS_OUTPUT.put_line(v_sql_where_12);

  open po_cu_retorno for
  --select sysdate from dual;

                     v_sql_select_1 ||
                     v_sql_select_2 ||
                     v_sql_select_3 ||
                     v_sql_select_4 ||
                     v_sql_select_5 ||
                     v_sql_join_1 ||
                     v_sql_join_2 ||
                     v_sql_join_3 ||
                     v_sql_join_4 ||
                     v_sql_join_5 ||
                     v_sql_where_1 ||
                     v_sql_where_2||
                     v_sql_where_3 ||
                     v_sql_where_4 ||
                     v_sql_where_5 ||
                     v_sql_where_6 ||
                     v_sql_where_7 ||
                     v_sql_where_8 ||
                     v_sql_where_9 ||
                     v_sql_where_10 ||
                     v_sql_where_11 ||
                     v_sql_where_12
                     ;

  COMMIT;

end;

--backup del store consulta de dcelis revertido el 2017-08-09
--por sobre carga en la base de datos
procedure scob_sp_s_multa_avanzada_aec_b(
-----------------------------------------------------------------------------------------------
/*001*/   pi_v_area_macro                        in varchar2      --AREA MACRO
/*002*/  ,pi_v_cum_ini                           in varchar2      --cum
/*003*/  ,pi_v_cum_fin                           in varchar2      --cum
/*004*/  ,pi_v_fec_gen_cum_ini                   in varchar2      --FECHA GENERACION CUM INI
/*005*/  ,pi_v_fec_gen_cum_fin                   in varchar2      --FECHA GENERACION CUM FIN
/*006*/  ,pi_v_id_sede                           in varchar2      --sede
/*007*/  ,PI_V_ID_COD_DPTO_SEDE                  in VARCHAR2      --CODIGO DEPARTAMENTO SEDE
/*008*/  ,PI_V_ID_COD_PROV_SEDE                  in VARCHAR2      --CODIGO PROVINCIA SEDE
/*009*/  ,PI_V_ID_COD_DIST_SEDE                  in VARCHAR2      --CODIGO DISTRITO SEDE
/*010*/  ,pi_v_id_org_resol                      in varchar2      --organo resolutivo
/*011*/  ,PI_V_ID_COD_DPTO_ORGR                  in VARCHAR2      --CODIGO DEPARTAMENTO ORGANO RESOLUTIVO
/*012*/  ,PI_V_ID_COD_PROV_ORGR                  in VARCHAR2      --CODIGO PROVINCIA ORGANO RESOLUTIVO
/*013*/  ,PI_V_ID_COD_DIST_ORGR                  in VARCHAR2      --CODIGO DISTRITO ORGANO RESOLUTIVO
/*014*/  ,PI_V_ID_NRO_INSTANCIA                  in VARCHAR2      --NUMERO DE INSTANCIA
/*015*/  ,pi_v_id_materia                        in varchar2      --materia
/*016*/  ,pi_v_id_sub_materia                    in varchar2      --SUBMATERIA
/*017*/  ,pi_v_nro_exp_unico_ini                 in varchar2      --nro. expediente administrativo
/*018*/  ,pi_v_nro_exp_unico_fin                 in varchar2      --nro. expediente administrativo
/*019*/  ,pi_v_nroExpAdm_nivel                   in varchar2      --nro. expediente antiguo
/*020*/  ,pi_v_nro_resol                         in varchar2      --nro. resolucion or
/*021*/  ,pi_v_fec_reso_or_ini                   in varchar2      --FECHA RESOLUCION OR INI
/*022*/  ,pi_v_fec_reso_or_fin                   in varchar2      --FECHA RESOLUCION OR FIN
/*023*/  ,pi_v_fec_notifi_or_ini                 in varchar2      --FECHA NOTIFICACION RESOLUCION INI
/*024*/  ,pi_v_fec_notifi_or_fin                 in varchar2      --FECHA NOTIFICACION RESOLUCION FIN
/*025*/  ,PI_V_FEC_GENERACION_SEC_INI            in VARCHAR2      --FECHA GENERACION SEC
/*026*/  ,PI_V_FEC_GENERACION_SEC_FIN            in VARCHAR2      --FECHA GENERACION SEC
---
/*027*/  ,pi_v_fec_recepcion_aec_ini             in varchar2      --FECHA RECEPCION AEC INICIO
/*028*/  ,pi_v_fec_recepcion_aec_fin             in varchar2      --FECHA RECEPCION AEC FIN
/*029*/  ,PI_V_ANIO_INGRESO_AEC_INI              in varchar2      --AÑO INGRESO AL AEC INI
/*030*/  ,PI_V_ANIO_INGRESO_AEC_FIN              in varchar2      --AÑO INGRESO AL AEC FIN
/*031*/  ,PI_V_NRO_INGRESO_AEC_INI               in varchar2      --nro. ingreso aec
/*032*/  ,PI_V_NRO_INGRESO_AEC_FIN               in varchar2      --nro. ingreso aec
---
/*033*/  ,PI_V_ANIO_FILE_INI                     in varchar2      --AÑO FILE INI
/*034*/  ,PI_V_ANIO_FILE_FIN                     in varchar2      --AÑO FILE FIN
/*035*/  ,PI_V_NRO_FILE_INI                      in varchar2      --nro. file
/*036*/  ,PI_V_NRO_FILE_FIN                      in varchar2      --nro. file
/*037*/  ,pi_v_fec_recepcion_file_ini            in varchar2      --FECHA RECEPCION FILE INICIO
/*038*/  ,pi_v_fec_recepcion_file_fin            in varchar2      --FECHA RECEPCION FILE FIN
---
/*039*/  ,pi_n_valor_uit_ini                     in number        --nro uit ini
/*040*/  ,pi_n_valor_uit_fin                     in number        --nro uit fin
/*041*/  ,pi_n_monto_uit_ini                     in NUMBER        --MONTO UIT INI
/*042*/  ,pi_n_monto_uit_fin                     in NUMBER        --MONTO UIT FIN
/*043*/  ,pi_n_saldo_ini                         in NUMBER        --SALDO UIT INI
/*044*/  ,pi_n_saldo_fin                         in NUMBER        --SALDO UIT FIN
/*045*/  ,pi_v_id_tipo_multa                     in varchar2      --TIPO MULTA (SOLIDARIA/INDIVIDUAL)
/*046*/  ,pi_v_cod_estado_multa_resol            in varchar2      --estado de la multa resolutivo
/*047*/  ,pi_v_cod_estado_pago                   in varchar2      --estado pago de la multa
/*048*/  ,PI_V_FEC_ESTADO_MULTA_OR_INI           in VARCHAR2      --FECHA ESTADO MULTA OR INI
/*049*/  ,PI_V_FEC_ESTADO_MULTA_OR_FIN           in VARCHAR2      --FECHA ESTADO MULTA OR FIN
/*050*/  ,PI_V_FEC_ESTADO_MULTA_COB_INI          in VARCHAR2      --FECHA ESTADO MULTA COBRANZA
/*051*/  ,PI_V_FEC_ESTADO_MULTA_COB_FIN          in VARCHAR2      --FECHA ESTADO MULTA COBRANZA
/*052*/  ,pi_v_cod_estado_multa_cob              in varchar2      --estado de la multa cobranza
/*053*/  ,pi_v_cod_motivo_multa_cob              in varchar2      --motivo multa cobranza
/*054*/  ,PI_V_IND_TIPO_PAGO                     in VARCHAR2      --INDICADOR DE PAGO
/*055*/  ,pi_c_flg_asocu_multa                   IN CHAR         --INDICADOR % ASOCU > 0
-----------------------------------------------------------------------------------------------
/*056*/  ,pi_v_cod_estado_exped_cob              in varchar2      --estado expediente cobranza
/*057*/  ,pi_v_anio                              in varchar2      --año expediente cobranza
/*058*/  ,pi_v_nro_exp_cob_ini                   in varchar2      --nro. expediente cobranza
/*059*/  ,pi_v_nro_exp_cob_fin                   in varchar2      --nro. expediente cobranza
/*060*/  ,pi_v_fec_gen_exped_cob_ini             in varchar2      --FECHA GENERACION EXPED COBRANZA INI
/*061*/  ,pi_v_fec_gen_exped_cob_fin             in varchar2      --FECHA GENERACION EXPED COBRANZA FIN
-------
/*062*/  ,pi_v_gestor_cobranza                   in varchar2      --Gestor de cobranza
/*063*/  ,pi_v_fec_emi_rec_ini                   in varchar2      --Fecha de Emisión de la REC
/*064*/  ,pi_v_fec_emi_rec_fin                   in varchar2      --Fecha de Emisión de la REC
/*065*/  ,pi_v_fec_noti_rec_ini                  in varchar2      --Fecha de Notificación de la REC
/*066*/  ,pi_v_fec_noti_rec_fin                  in varchar2      --Fecha de Notificación de la REC
/*067*/  ,pi_v_cod_motivo_exped_cob              in varchar2      --motivo expediente cobranza---------
/*068*/  ,pi_v_fec_est_exped_cob_ini             in varchar2      --Fecha de Estado del Expediente
/*069*/  ,pi_v_fec_est_exped_cob_fin             in varchar2      --Fecha de Estado del Expediente
/*070*/  ,pi_v_num_env_arch_ini                  in varchar2      --Nº Envio a Archivo Central
/*071*/  ,pi_v_num_env_arch_fin                  in varchar2      --Nº Envio a Archivo Central
/*072*/  ,pi_v_fec_envi_arch_ini                 in varchar2      --Fecha de Envío a Archivo Central
/*073*/  ,pi_v_fec_envi_arch_fin                 in varchar2      --Fecha de Envío a Archivo Central
/*074*/  ,pi_v_nro_ofic_sunat_ini                in varchar2      --Nº de Oficio de la SUNAT
/*075*/  ,pi_v_nro_ofic_sunat_fin                in varchar2      --Nº de Oficio de la SUNAT
/*076*/  ,pi_n_dere_antiDump_ini                 in NUMBER        --Derechos Antidumping
/*077*/  ,pi_n_dere_antiDump_fin                 in NUMBER        --Derechos Antidumping
/*078*/  ,pi_v_nro_parti_ini                     in varchar2      --Partida Arancelaria
/*079*/  ,pi_v_nro_parti_fin                     in varchar2      --Partida Arancelaria
/*080*/  ,pi_v_nro_dua_ini                       in varchar2      --Nº DUA
/*081*/  ,pi_v_nro_dua_fin                       in varchar2      --Nº DUA
/*082*/  ,pi_v_nro_liq_cob_ini                   in varchar2      --Nº Liquidación de Cobranza
/*083*/  ,pi_v_nro_liq_cob_fin                   in varchar2      --Nº Liquidación de Cobranza
/*084*/  ,pi_v_id_intendencia                    in varchar2      --Intendencia antidumping
/*085*/  ,pi_c_flg_ind_embargo                   in char          --INDICADOR TIENE EMBARGO?
/*086*/  ,pi_v_fec_asig_gestor_ini               in varchar2      --fecha de asignacion de gestor ini
/*087*/  ,pi_v_fec_asig_gestor_fin               in varchar2      --fecha de asignacion de gestor fin
/*088*/  ,pi_v_fec_carta_precoactiva_ini         in varchar2      --fecha de carta precoactiva inicio
/*089*/  ,pi_v_fec_carta_precoactiva_fin         in varchar2      --fecha de carta precoactiva fin
/*090*/  ,pi_v_id_expectativa_cobro              in varchar2      --cadena codigos espectativa de cobro

-----------------------------------------------------------------------------------------------
        --denunciante
/*091*/  ,pi_v_d_codSanciona_ini                 in varchar2      --Código del INDECOPI
/*092*/  ,pi_v_d_codSanciona_fin                 in varchar2      --Código del INDECOPI
/*093*/  ,pi_i_d_tip_persona                     in integer       --Tipo de Personería
/*094*/  ,pi_v_d_razon_social                    in varchar2      --Razón Social
/*095*/  ,pi_v_d_ape_paterno                     in varchar2      --Apellido Paterno
/*096*/  ,pi_v_d_ape_materno                     in varchar2      --Apellido Materno
/*097*/  ,pi_v_d_ape_casada                      in varchar2      --Apellido Casada
/*098*/  ,pi_v_d_pri_nombre                      in varchar2      --Primer nombre
/*099*/  ,pi_v_d_seg_nombre                      in varchar2      --Segundo nombre
/*100*/  ,pi_i_d_tipo_doc                        in integer       --Tipo de Documento
/*101*/  ,pi_v_d_nro_doc                         in varchar2      --Nº de documento de identidad
/*102*/  ,pi_i_d_tip_empresa                     in integer       --Tipo de Empresa
/*103*/  ,pi_n_d_id_sect_econo                   in number        --CIIU (Actividad Economica)
/*104*/  ,pi_c_d_flg_asocu                       in char          --flag asocu
/*105*/  ,pi_c_d_fl_oficio                       in char          --indicador denunciante de oficio=Indecopi
        --denunciado
/*106*/  ,pi_v_do_codSanciona_ini                in varchar2      --Código del INDECOPI
/*107*/  ,pi_v_do_codSanciona_fin                in varchar2      --Código del INDECOPI
/*108*/  ,pi_i_do_tip_persona                    in integer       --Tipo de Personería
/*109*/  ,pi_v_do_razon_social                   in varchar2      --Razón Social
/*110*/  ,pi_v_do_ape_paterno                    in varchar2      --Apellido Paterno
/*111*/  ,pi_v_do_ape_materno                    in varchar2      --Apellido Materno
/*112*/  ,pi_v_do_ape_casada                     in varchar2      --Apellido Casada
/*113*/  ,pi_v_do_pri_nombre                     in varchar2      --Primer nombre
/*114*/  ,pi_v_do_seg_nombre                     in varchar2      --Segundo nombre
/*115*/  ,pi_i_do_tipo_doc                       in integer       --Tipo de Documento
/*116*/  ,pi_v_do_nro_doc                        in varchar2      --Nº de documento de identidad
/*117*/  ,pi_i_do_tip_empresa                    in integer       --Tipo de Empresa
/*118*/  ,pi_n_do_id_sect_econo                  in number        --CIIU (Actividad Economica)
/*119*/  ,pi_c_do_flg_asocu                      in char          --flag asocu
         --sancionado
/*120*/  ,pi_v_s_codSanciona_ini                 in varchar2      --Código del INDECOPI
/*121*/  ,pi_v_s_codSanciona_fin                 in varchar2      --Código del INDECOPI
/*122*/  ,pi_i_s_tip_persona                     in integer       --Tipo de Personería
/*123*/  ,pi_v_s_razon_social                    in varchar2      --Razón Social
/*124*/  ,pi_v_s_ape_paterno                     in varchar2      --Apellido Paterno
/*125*/  ,pi_v_s_ape_materno                     in varchar2      --Apellido Materno
/*126*/  ,pi_v_s_ape_casada                      in varchar2      --Apellido Casada
/*127*/  ,pi_v_s_pri_nombre                      in varchar2      --Primer nombre
/*128*/  ,pi_v_s_seg_nombre                      in varchar2      --Segundo nombre
/*129*/  ,pi_i_s_tipo_doc                        in integer       --Tipo de Documento
/*130*/  ,pi_v_s_nro_doc                         in varchar2      --Nº de documento de identidad
/*131*/  ,pi_i_s_tip_empresa                     in integer       --Tipo de Empresa
/*132*/  ,pi_n_s_id_sect_econo                   in number        --CIIU (Actividad Economica)
/*133*/  ,pi_c_s_flg_asocu                       in char           --flag asocu
--@0002:ini
/*134*/  ,pi_c_s_flg_buscar_by_contenido         in char           --0=NO;1=SI
--@0002:fin
-----------------------------------------------------------------------------------------------
         ,po_cu_retorno                          out cu_rec_set
)is

  c_flg_administrado                           char(1);
  c_flg_sancionado                             char(1);
  c_flg_denunciado                             char(1);
  c_flg_denunciante                            char(1);

  v_sql_admin_select                           varchar2(8000);
  v_sql_admin_where_d                          varchar2(8000);
  v_sql_admin_where_do                         varchar2(8000);
  v_sql_admin_where_s                          varchar2(8000);

  v_sql_select_1                               varchar2(8000);
  v_sql_select_2                               varchar2(8000);
  v_sql_select_3                               varchar2(8000);
  v_sql_select_4                               varchar2(8000);
  v_sql_select_5                               varchar2(8000);
  v_sql_join_1                                 varchar2(8000);
  v_sql_join_2                                 varchar2(8000);
  v_sql_join_3                                 varchar2(8000);
  v_sql_join_4                                 varchar2(8000);
  v_sql_join_5                                 varchar2(8000);
  v_sql_where_1                                varchar2(8000);
  v_sql_where_2                                varchar2(8000);
  v_sql_where_3                                varchar2(8000);
  v_sql_where_4                                varchar2(8000);
  v_sql_where_5                                varchar2(8000);
  v_sql_where_6                                varchar2(8000);
  v_sql_where_7                                varchar2(8000);
  v_sql_where_8                                varchar2(8000);
  v_sql_where_9                                varchar2(8000);
  v_sql_where_10                               varchar2(8000);
  v_sql_where_11                               varchar2(8000);
  v_sql_where_12                               varchar2(8000);
  c_car_porcentaje                             varchar(1);
begin
  --@0002:ini
  c_car_porcentaje := '';
  if pi_c_s_flg_buscar_by_contenido = '1' then c_car_porcentaje := '%'; end if;
  --@0002:fin

  --control del filtro sancionado
  c_flg_administrado := '0';
  c_flg_sancionado := '0';
  c_flg_denunciado := '0';
  c_flg_denunciante := '0';

  v_sql_where_1 := '';
  v_sql_where_2 := '';
  v_sql_where_3 := '';
  v_sql_where_4 := '';
  v_sql_where_5 := '';
  v_sql_where_6 := '';
  v_sql_where_7 := '';
  v_sql_where_8 := '';
  v_sql_where_9 := '';
  v_sql_where_10 := '';
  v_sql_where_11 := '';
  v_sql_where_12 := '';

  IF  pi_v_s_codSanciona_ini is not null or
      pi_v_s_codSanciona_fin is not null or
      pi_i_s_tip_persona <> 0 or
      pi_v_s_razon_social is not null or
      pi_v_s_ape_paterno is not null or
      pi_v_s_ape_materno is not null or
      pi_v_s_ape_casada is not null or
      pi_v_s_pri_nombre is not null or
      pi_v_s_seg_nombre is not null or
      pi_i_s_tipo_doc <> 0 or
      pi_v_s_nro_doc is not null or
      pi_i_s_tip_empresa <> 0 or
      pi_n_s_id_sect_econo <> 0 or
      pi_c_s_flg_asocu<>'0'
  THEN
      c_flg_sancionado := '1';
      if c_flg_administrado = '0' then c_flg_administrado := '1'; end if;
  END IF;

  IF (
      pi_v_do_codSanciona_ini is not null or
      pi_v_do_codSanciona_fin is not null or
      pi_i_do_tip_persona <> 0 or
      pi_v_do_razon_social is not null or
      pi_v_do_ape_paterno is not null or
      pi_v_do_ape_materno is not null or
      pi_v_do_ape_casada is not null or
      pi_v_do_pri_nombre is not null or
      pi_v_do_seg_nombre is not null or
      pi_i_do_tipo_doc <> 0 or
      pi_v_do_nro_doc is not null or
      pi_i_do_tip_empresa <> 0 or
      pi_n_do_id_sect_econo <> 0 or
      pi_c_do_flg_asocu<>'0'
      )
  THEN
      c_flg_denunciado := '1';
      if c_flg_administrado = '0' then c_flg_administrado := '1'; end if;
  END IF;

  IF  (
      pi_v_d_codSanciona_ini is not null or
      pi_v_d_codSanciona_fin is not null or
      pi_i_d_tip_persona <> 0 or
      pi_v_d_razon_social is not null or
      pi_v_d_ape_paterno is not null or
      pi_v_d_ape_materno is not null or
      pi_v_d_ape_casada is not null or
      pi_v_d_pri_nombre is not null or
      pi_v_d_seg_nombre is not null or
      pi_i_d_tipo_doc <> 0 or
      pi_v_d_nro_doc is not null or
      pi_i_d_tip_empresa <> 0 or
      pi_n_d_id_sect_econo <> 0 or
      pi_c_d_flg_asocu<>'0' or
      pi_c_d_fl_oficio<>'0'
      )
  THEN
      c_flg_denunciante := '1';
      if c_flg_administrado = '0' then c_flg_administrado := '1'; end if;
  END IF;

  --obtener los datos de las intancias de una multa
  EXECUTE IMMEDIATE 'TRUNCATE TABLE T_SCOB_TMP_INSTANCIAS_MULTA1';
  INSERT INTO USR_SICOB.T_SCOB_TMP_INSTANCIAS_MULTA1(
      ID_MULTA,
      NRO_NIVEL,
      NRO_RESOLUCION,
      FEC_RESOLUCION,
      FEC_NOTIFICACION_RESOLUCION,
      FEC_ESTADO_SGTE_INSTANCIA,
      FEC_REGISTRO,
      LOGIN_USUARIO_REGISTRO,
      NRO_RESOLUCION_DECLARACION,
      FEC_CONS_FIRME,
      FEC_NOTF_CONS_FIRME
      )(
        SELECT
          MDET.ID_MULTA,
          ORGR.TIPO_INSTANCIA,
          --MDET.NRO_RESOLUCION_ID,
          MDET.NRO_RESOLUCION,
          MDET.FEC_RESOLUCION,
          MDET.FEC_NOTIFICACION_RESOLUCION,
          MDET.FEC_ESTADO_SGTE_INSTANCIA,
          TO_DATE(TO_CHAR(MDET.AUDFECCREACION,'DD/MM/YYYY'),'DD/MM/YYYY'),
          MDET.AUDUSUCREACION,
          MDET.NRO_RESOLUCION_DECLARACION,
          MDET.FEC_DECLARACION AS FEC_CONS_FIRME,
          MDET.FEC_NOTIFICACION_DECLARACION AS FEC_NOTF_CONS_FIRME
        FROM T_SCOB_MULTA_DETAL MDET
        INNER JOIN T_SCOB_ORGANO_RESOLUTIVO ORGR
              ON ORGR.ID_ORGANO_RESOLUTIVO = MDET.ID_ORGANO_RESOLUTIVO
        WHERE MDET.ESTADO = '1'
  );
  /*EXECUTE IMMEDIATE 'TRUNCATE TABLE T_SCOB_TMP_INSTANCIAS_MULTA';
  INSERT INTO T_SCOB_TMP_INSTANCIAS_MULTA(
      ID_MULTA,
      NRO_NIVEL,
      NRO_RESOLUCION,
      FEC_RESOLUCION,
      FEC_NOTIFICACION_RESOLUCION,
      FEC_ESTADO_SGTE_INSTANCIA,
      FEC_REGISTRO,
      LOGIN_USUARIO_REGISTRO
  )(
        SELECT
          MDET.ID_MULTA,
          ORGR.TIPO_INSTANCIA,
          --Req. 30 - @dcelis/begin
          --MDET.NRO_RESOLUCION_ID,
          MDET.NRO_RESOLUCION,
          --Req. 30 - @dcelis/end
          MDET.FEC_RESOLUCION,
          MDET.FEC_NOTIFICACION_RESOLUCION,
          MDET.FEC_ESTADO_SGTE_INSTANCIA,
          TO_DATE(TO_CHAR(MDET.AUDFECCREACION,'DD/MM/YYYY'),'DD/MM/YYYY'),
          MDET.AUDUSUCREACION
        FROM T_SCOB_MULTA_DETAL MDET
        INNER JOIN T_SCOB_ORGANO_RESOLUTIVO ORGR
              ON ORGR.ID_ORGANO_RESOLUTIVO = MDET.ID_ORGANO_RESOLUTIVO
        WHERE MDET.ESTADO = '1'
  );*/

  --obtener la situacion de pago de las multas
  EXECUTE IMMEDIATE 'TRUNCATE TABLE T_SCOB_TMP_SITUACION_MULTA';
  INSERT INTO T_SCOB_TMP_SITUACION_MULTA(
     ID_MULTA,
     COD_SITUACION_MULTA
  )
  SELECT
    MULT.ID_MULTA,
    CASE
       WHEN EXPE.ESTADO_EXPEDIENTE = 4 THEN 3 --'FR'
       WHEN EXPE.ESTADO_EXPEDIENTE = 5 THEN 4 --'PP'
       WHEN MULT.NRO_FILE_AEC IS NULL THEN 1 --PAGO VOLUNTARIO
       ELSE 2 --PAGO COACTIVO
       --WHEN MULT.IND_DESCUENTO = 1 AND MULT.COD_ESTADO_PAGO IN (4) THEN 1 --'DS'
       --WHEN MULT.NRO_FILE_AEC IS NULL THEN 2 --'MU'--NO TIENE DESCUENTO Y NO HA INGRESADO A COBRANZA
       --ELSE 2--'CO'
    END AS COD_SITUACION_MULTA
  FROM T_SCOB_MULTA MULT
  LEFT JOIN T_SCOB_EXPEDIENTE_MULTA EXMU
       ON EXMU.ID_MULTA = MULT.ID_MULTA
       AND EXMU.ESTADO = '1'
  LEFT JOIN T_SCOB_EXPEDIENTE EXPE
       ON EXPE.ID_EXPEDIENTE = EXMU.ID_EXPEDIENTE
  WHERE MULT.ESTADO = '1';

  -----------------------------------------------------------------------------------
  --obtener los administrados
  -----------------------------------------------------------------------------------
  --3=DENUNCIANTE
  -----------------------------------------------------------------------------------
  /*
  Dbms_Output.put_line('c_flg_administrado--->' || c_flg_administrado);
  Dbms_Output.put_line('c_flg_denunciante--->' || c_flg_denunciante);
  Dbms_Output.put_line('c_flg_sancionado--->' || c_flg_sancionado);
  Dbms_Output.put_line('c_flg_denunciado--->' || c_flg_denunciado);
  */

  EXECUTE IMMEDIATE 'TRUNCATE TABLE T_SCOB_TMP_ADMINISTRADO';
  --obtener a todos los administrados
  if c_flg_administrado = '1' then

      v_sql_admin_select := '
      INSERT INTO T_SCOB_TMP_ADMINISTRADO(
          ID_MULTA, TIPO_ADMINISTRADO, ID_PERSONA
      )
      SELECT
          ADMINISTRADO.ID_MULTA,ADMINISTRADO.TIPO_ADMINISTRADO,PERS.ID_PERSONA
      FROM (
          SELECT MDET.ID_MULTA AS ID_MULTA, ''3'' AS TIPO_ADMINISTRADO, --DENUNCIANTE
                 MDEN.ID_PERSONA  AS ID_PERSONA
          FROM T_SCOB_MULTA_DETAL MDET
          INNER JOIN T_SCOB_MULTA_DENUNCIANTE MDEN
                ON MDEN.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL
                AND MDEN.ESTADO = ''1''
          WHERE MDET.FLG_ACTUAL = ''1'' AND MDET.ESTADO = ''1''
          UNION ALL
          SELECT MDET.ID_MULTA AS ID_MULTA, MSAN.COD_TIPO_PERSONA AS TIPO_ADMINISTRADO, --SANCIONADO Y DENUNCIADO
                 MSAN.ID_PERSONA AS ID_PERSONA
          FROM T_SCOB_MULTA_DETAL MDET
          INNER JOIN T_SCOB_MULTA_SANCIONADO MSAN
                ON MSAN.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL
                AND MSAN.ESTADO = ''1''
          WHERE MDET.FLG_ACTUAL = ''1'' AND MDET.ESTADO = ''1''
      )ADMINISTRADO
      INNER JOIN T_SCOB_PERSONA PERS ON PERS.ID_PERSONA = ADMINISTRADO.ID_PERSONA
      ';

      v_sql_admin_where_d := '
      WHERE ADMINISTRADO.ID_MULTA IS NOT NULL ';

      IF c_flg_denunciante = '1' THEN

      v_sql_admin_where_d := v_sql_admin_where_d ||
      '
      AND (ADMINISTRADO.TIPO_ADMINISTRADO = ''3'' --denunciante
      ';

          --CODIGO INDECOPI
          if pi_v_d_codSanciona_ini is not null then
             v_sql_admin_where_d := v_sql_admin_where_d ||
             '
             AND TO_NUMBER(PERS.COD_SANCIONADO) BETWEEN TO_NUMBER('||pi_v_d_codSanciona_ini||') AND TO_NUMBER('||pi_v_d_codSanciona_fin||')'
             ;

          end if;

          --TIPO PERSONERIA
          if pi_i_d_tip_persona<>0 then
             v_sql_admin_where_d := v_sql_admin_where_d ||
             '
             AND PERS.TIPO_PERSONA='||pi_i_d_tip_persona
             ;
          end if;

          --TIPO DOCUMENTO
          if pi_i_d_tipo_doc<>0 then
             v_sql_admin_where_d := v_sql_admin_where_d ||
             '
             AND PERS.TIPO_DOC='||pi_i_d_tipo_doc
             ;
          end if;

          --NRO DOCUMENTO
          if pi_v_d_nro_doc is not null then
             v_sql_admin_where_d := v_sql_admin_where_d ||
             '
             AND PERS.NRO_DOC='''||pi_v_d_nro_doc||''''
             ;
          end if;

          --APELLIDOS Y NOMBRES
          if pi_v_d_ape_paterno is not null then
             v_sql_admin_where_d := v_sql_admin_where_d ||
             '
             AND PERS.APE_PATERNO LIKE '''||c_car_porcentaje||pi_v_d_ape_paterno||'%'''
             ;
          end if;

          if pi_v_d_ape_materno is not null then
             v_sql_admin_where_d := v_sql_admin_where_d ||
             '
             AND PERS.APE_MATERNO LIKE '''||c_car_porcentaje||pi_v_d_ape_materno||'%'''
             ;
          end if;

          if pi_v_d_ape_casada is not null then
             v_sql_admin_where_d := v_sql_admin_where_d ||
             '
             AND PERS.APE_CASADA LIKE '''||c_car_porcentaje||pi_v_d_ape_casada||'%'''
             ;
          end if;

          if pi_v_d_pri_nombre is not null then
             v_sql_admin_where_d := v_sql_admin_where_d ||
             '
             AND PERS.PRI_NOMBRE LIKE '''||c_car_porcentaje||pi_v_d_pri_nombre||'%'''
             ;
          end if;

          if pi_v_d_seg_nombre is not null then
             v_sql_admin_where_d := v_sql_admin_where_d ||
             '
             AND PERS.SEG_NOMBRE LIKE '''||c_car_porcentaje||pi_v_d_seg_nombre||'%'''
             ;
          end if;

          --DENOMINACION O RAZON SOCIAL
          if pi_v_d_razon_social is not null then
             v_sql_admin_where_d := v_sql_admin_where_d ||
             '
             AND PERS.RAZON_SOCIAL LIKE '''||c_car_porcentaje||pi_v_d_razon_social ||'%'''
             ;
          end if;

          --TIPO DE EMPRESA
          if pi_i_d_tip_empresa<>0 then
             v_sql_admin_where_d := v_sql_admin_where_d ||
             '
             AND PERS.TIP_EMPRESA=' ||pi_i_d_tip_empresa
             ;
          end if;

          --SECTOR ECONOMICO
          if pi_n_d_id_sect_econo<>0 then
             v_sql_admin_where_d := v_sql_admin_where_d ||
             '
             AND PERS.ID_SECTOR_ECONOMICO='||pi_n_d_id_sect_econo
             ;
          end if;

          --INDICADOR DENUNCIANTE DE OFICIO = INDECOPI
          if pi_c_d_fl_oficio='1' then
             v_sql_admin_where_d := v_sql_admin_where_d ||
             '
             AND PERS.ID_PERSONA='||SCOB_PK_CONSTANTES.C_ID_ADMINISTRADO_INDECOPI;
          end if;




      v_sql_admin_where_d := v_sql_admin_where_d || '
      )';

      END IF;

      IF c_flg_denunciado = '1' THEN
          if  c_flg_denunciante = '1' then
              v_sql_admin_where_do :=
              '
              OR(ADMINISTRADO.TIPO_ADMINISTRADO = ''2'' --denunciado';
          else
              v_sql_admin_where_do :=
              '
              AND(ADMINISTRADO.TIPO_ADMINISTRADO = ''2'' --denunciado';
          end if;

          --CODIGO INDECOPI
          if pi_v_d_codSanciona_ini is not null then
             v_sql_admin_where_do := v_sql_admin_where_do ||
             '
             AND TO_NUMBER(PERS.COD_SANCIONADO) BETWEEN TO_NUMBER('||pi_v_do_codSanciona_ini||') AND TO_NUMBER('||pi_v_do_codSanciona_fin||')'
             ;
          end if;

          --TIPO PERSONERIA
          if pi_i_do_tip_persona<>0 then
             v_sql_admin_where_do := v_sql_admin_where_do ||
             '
             AND PERS.TIPO_PERSONA='||pi_i_do_tip_persona
             ;
          end if;

          --TIPO DOCUMENTO
          if pi_i_do_tipo_doc<>0 then
             v_sql_admin_where_do := v_sql_admin_where_do ||
             '
             AND PERS.TIPO_DOC='||pi_i_do_tipo_doc
             ;
          end if;

          --NRO DOCUMENTO
          if pi_v_do_nro_doc is not null then
             v_sql_admin_where_do := v_sql_admin_where_do ||
             '
             AND PERS.NRO_DOC='''||pi_v_do_nro_doc||''''
             ;
          end if;

          --APELLIDOS Y NOMBRES
          if pi_v_do_ape_paterno is not null then
             v_sql_admin_where_do := v_sql_admin_where_do ||
             '
             AND PERS.APE_PATERNO LIKE '''||c_car_porcentaje||pi_v_do_ape_paterno||'%'''
             ;
          end if;

          if pi_v_do_ape_materno is not null then
             v_sql_admin_where_do := v_sql_admin_where_do ||
             '
             AND PERS.APE_MATERNO LIKE '''||c_car_porcentaje||pi_v_do_ape_materno||'%'''
             ;
          end if;

          if pi_v_do_ape_casada is not null then
             v_sql_admin_where_do := v_sql_admin_where_do ||
             '
             AND PERS.APE_CASADA LIKE '''||c_car_porcentaje||pi_v_do_ape_casada||'%'''
             ;
          end if;

          if pi_v_do_pri_nombre is not null then
             v_sql_admin_where_do := v_sql_admin_where_do ||
             '
             AND PERS.PRI_NOMBRE LIKE '''||c_car_porcentaje||pi_v_do_pri_nombre||'%'''
             ;
          end if;

          if pi_v_do_seg_nombre is not null then
             v_sql_admin_where_do := v_sql_admin_where_do ||
             '
             AND PERS.SEG_NOMBRE LIKE '''||c_car_porcentaje||pi_v_do_seg_nombre||'%'''
             ;
          end if;

          --DENOMINACION O RAZON SOCIAL
          if pi_v_do_razon_social is not null then
             v_sql_admin_where_do := v_sql_admin_where_do ||
             '
             AND PERS.RAZON_SOCIAL LIKE '''||c_car_porcentaje||pi_v_do_razon_social ||'%'''
             ;
          end if;

          --TIPO DE EMPRESA
          if pi_i_do_tip_empresa<>0 then
             v_sql_admin_where_do := v_sql_admin_where_do ||
             '
             AND PERS.TIP_EMPRESA=' ||pi_i_do_tip_empresa
             ;
          end if;

          --SECTOR ECONOMICO
          if pi_n_do_id_sect_econo<>0 then
             v_sql_admin_where_do := v_sql_admin_where_do ||
             '
             AND PERS.ID_SECTOR_ECONOMICO='||pi_n_do_id_sect_econo
             ;
          end if;

          if pi_c_do_flg_asocu='1' then
             v_sql_admin_where_do := v_sql_admin_where_do ||
             '
             AND PERS.FLG_ASOCU='''||pi_c_do_flg_asocu||''''
             ;
          end if;

          v_sql_admin_where_do := v_sql_admin_where_do ||'
          )';
      END IF;

      IF c_flg_sancionado = '1' THEN
          if  c_flg_denunciado = '1' or c_flg_denunciante = '1' then
              v_sql_admin_where_s :=
              '
              OR(ADMINISTRADO.TIPO_ADMINISTRADO = ''1'' --sancionado';
          else
              v_sql_admin_where_s :=
              '
              AND(ADMINISTRADO.TIPO_ADMINISTRADO = ''1'' --sancionado';
          end if;

          --CODIGO INDECOPI
          if pi_v_s_codSanciona_ini is not null then
             v_sql_admin_where_s := v_sql_admin_where_s ||
             '
             AND TO_NUMBER(PERS.COD_SANCIONADO) BETWEEN TO_NUMBER('||pi_v_s_codSanciona_ini||') AND TO_NUMBER('||pi_v_s_codSanciona_fin||')'
             ;
          end if;

          --TIPO PERSONERIA
          if pi_i_s_tip_persona<>0 then
             v_sql_admin_where_s := v_sql_admin_where_s ||
             '
             AND PERS.TIPO_PERSONA='||pi_i_s_tip_persona
             ;
          end if;

          --TIPO DOCUMENTO
          if pi_i_s_tipo_doc<>0 then
             v_sql_admin_where_s := v_sql_admin_where_s ||
             '
             AND PERS.TIPO_DOC='||pi_i_s_tipo_doc
             ;
          end if;

          --NRO DOCUMENTO
          if pi_v_s_nro_doc is not null then
             v_sql_admin_where_s := v_sql_admin_where_s ||
             '
             AND PERS.NRO_DOC='''||pi_v_s_nro_doc||''''
             ;
          end if;

          --APELLIDOS Y NOMBRES
          if pi_v_s_ape_paterno is not null then
             v_sql_admin_where_s := v_sql_admin_where_s ||
             '
             AND PERS.APE_PATERNO LIKE '''||c_car_porcentaje||pi_v_s_ape_paterno||'%'''
             ;
          end if;

          if pi_v_s_ape_materno is not null then
             v_sql_admin_where_s := v_sql_admin_where_s ||
             '
             AND PERS.APE_MATERNO LIKE '''||c_car_porcentaje||pi_v_s_ape_materno||'%'''
             ;
          end if;

          if pi_v_s_ape_casada is not null then
             v_sql_admin_where_s := v_sql_admin_where_s ||
             '
             AND PERS.APE_CASADA LIKE '''||c_car_porcentaje||pi_v_s_ape_casada||'%'''
             ;
          end if;

          if pi_v_s_pri_nombre is not null then
             v_sql_admin_where_s := v_sql_admin_where_s ||
             '
             AND PERS.PRI_NOMBRE LIKE '''||c_car_porcentaje||pi_v_s_pri_nombre||'%'''
             ;
          end if;

          if pi_v_s_seg_nombre is not null then
             v_sql_admin_where_s := v_sql_admin_where_s ||
             '
             AND PERS.SEG_NOMBRE LIKE '''||c_car_porcentaje||pi_v_s_seg_nombre||'%'''
             ;
          end if;

          --DENOMINACION O RAZON SOCIAL
          if pi_v_s_razon_social is not null then
             v_sql_admin_where_s := v_sql_admin_where_s ||
             '
             AND PERS.RAZON_SOCIAL LIKE '''||c_car_porcentaje||pi_v_s_razon_social ||'%'''
             ;
          end if;

          --TIPO DE EMPRESA
          if pi_i_s_tip_empresa<>0 then
             v_sql_admin_where_s := v_sql_admin_where_s ||
             '
             AND PERS.TIP_EMPRESA=' ||pi_i_s_tip_empresa
             ;
          end if;

          --SECTOR ECONOMICO
          if pi_n_s_id_sect_econo<>0 then
             v_sql_admin_where_s := v_sql_admin_where_s ||
             '
             AND PERS.ID_SECTOR_ECONOMICO='||pi_n_s_id_sect_econo
             ;
          end if;

          if pi_c_s_flg_asocu='1' then
             v_sql_admin_where_s := v_sql_admin_where_s ||
             '
             AND PERS.FLG_ASOCU='''||pi_c_s_flg_asocu||''''
             ;
          end if;

          v_sql_admin_where_s := v_sql_admin_where_s ||'
          )';
      END IF;

      DBMS_OUTPUT.put_line(v_sql_admin_select);
      DBMS_OUTPUT.put_line(v_sql_admin_where_d);
      DBMS_OUTPUT.put_line(v_sql_admin_where_do);
      DBMS_OUTPUT.put_line(v_sql_admin_where_s);

      EXECUTE IMMEDIATE v_sql_admin_select || v_sql_admin_where_d || v_sql_admin_where_do || v_sql_admin_where_s;

  end if;

  IF c_flg_administrado = '0' THEN
      INSERT INTO T_SCOB_TMP_ADMINISTRADO(ID_MULTA)
      VALUES('0');
  END IF;


  --mostrar los datos de la consulta
  v_sql_select_1 := '
  SELECT
    ROWNUM AS NRO_REG,
    MULT.ID_MULTA AS ID_MULTA,
    MULT.ANIO || MULT.CUM AS CUM,
    --DECODE(SCOB_PK_EXPEDIENTE.SCOB_FN_ES_ACUM(EXPE.ID_EXPEDIENTE),NULL,'''',SCOB_PK_EXPEDIENTE.SCOB_FN_CUM_ALFA(EXPE.ID_EXPEDIENTE)) AS V_ACUM,
    SCOB_PK_EXPEDIENTE.SCOB_FN_ES_CUM_ALFA(MULT.ID_MULTA) AS V_ACUM,
    SCOB_PK_EXPEDIENTE.SCOB_FN_ES_ACUM(EXPE.ID_EXPEDIENTE) AS ES_ACUM,
    EXPE.ID_EXPEDIENTE AS ID_EXPEDIENTE,
    MULT.FEC_INGRESO AS FEC_GENERACION_CUM,
    TIPO_PROC.DESCRIPCION AS NOM_TIPO_PROCEDEMIENTO,
    ORGR.CODIGO AS COD_ORGANO_RESOLUTIVO,
    ORGR.DESCRIPCION AS NOM_ORGANO_RESOLUTIVO,
    SEDE.CODIGO AS COD_SEDE,
    SEDE.DESCRIPCION AS NOM_SEDE,
    MATE.DESCRIPCION AS NOM_MATERIA,
    SUBM.DESCRIPCION AS NOM_SUB_MATERIA,
    MULT.NRO_EXP_ADMINISTRATIVO AS NRO_EXPEDIENTE_UNICO,
    MDET.NRO_EXP_NIVEL AS NRO_EXPEDIENTE_ADMINISTRATIVO,
    --PRIMERA INSTANCIA
    NIVEL1.NRO_RESOLUCION AS NRO_RESOL_OR, --num_resolu
    NIVEL1.FEC_REGISTRO AS FEC_REG_OR,
    NIVEL1.FEC_RESOLUCION AS FEC_EMI_RESOL_OR, --fec_emision
    NIVEL1.FEC_NOTIFICACION_RESOLUCION AS FEC_NOTIF_RESOL_OR, --fec_notifica
    NIVEL1.FEC_ESTADO_SGTE_INSTANCIA AS FEC_APELACION,
    NIVEL1.LOGIN_USUARIO_REGISTRO AS USU_REG_OR,
    NULL AS UIT_NIVEL1,
    NULL AS FEC_DECLARACION_NIVEL1,
    NULL AS F_REGISTRO_NIVEL1,
    scob_pk_utilitario.scob_fn_dias_laborables_neg(to_char(NIVEL1.FEC_RESOLUCION,''DD/MM/YYYY''),to_char(NIVEL1.FEC_REGISTRO,''DD/MM/YYYY'')) AS CANTIDAD_OR,';
  v_sql_select_2 :=
    '--SEGUNDA INSTANCIA
    NIVEL2.NRO_RESOLUCION AS NRO_RESOL_COMISION,
    NIVEL2.FEC_REGISTRO AS FEC_REG_COMISION,
    NIVEL2.FEC_RESOLUCION AS FEC_RESOL_COMISION,
    NIVEL2.FEC_NOTIFICACION_RESOLUCION AS FEC_NOTIF_RESOL_COMISION,
    NIVEL2.FEC_ESTADO_SGTE_INSTANCIA AS FEC_REVISION,
    NIVEL2.LOGIN_USUARIO_REGISTRO AS USU_REG_COMISION,
    NULL AS UIT_NIVEL2,
    NULL AS FEC_DECLARACION_NIVEL2,
    NULL AS F_REGISTRO_NIVEL2,
    scob_pk_utilitario.scob_fn_dias_laborables_neg(to_char(NIVEL2.FEC_RESOLUCION,''DD/MM/YYYY''),to_char(NIVEL2.FEC_REGISTRO,''DD/MM/YYYY'')) AS CANTIDAD_COMISION,
    --TERCERA INSTANCIA
    NIVEL3.NRO_RESOLUCION AS NRO_RESOL_SALA,
    NIVEL3.FEC_REGISTRO AS FEC_REG_SALA,
    NIVEL3.FEC_RESOLUCION  AS FEC_RESOL_SALA,
    NIVEL3.FEC_NOTIFICACION_RESOLUCION AS FEC_NOTIF_RESOL_SALA,
    NIVEL3.LOGIN_USUARIO_REGISTRO AS USU_REG_SALA,
    NULL AS UIT_NIVEL3,
    NULL AS F_REGISTRO_NIVEL3,
    scob_pk_utilitario.scob_fn_dias_laborables_neg(to_char(NIVEL3.FEC_RESOLUCION,''DD/MM/YYYY''),to_char(NIVEL3.FEC_REGISTRO,''DD/MM/YYYY'')) AS CANTIDAD_SALA,
    ------------------------------------------------------
    ';
  v_sql_select_3 :=
    'TIPO_MULTA.TXT_DESCRIPCION AS NOM_TIPO_MULTA, --tipo_multa
    scob_pk_expediente.SCOB_FN_DENUNCIANTES_MULTA(mdet.id_multa,0) AS NOM_DENUNCIANTE, --denunciante
    scob_pk_expediente.SCOB_FN_DENUNCIADOS_MULTA(mdet.id_multa,0) AS NOM_DENUNCIADO, --denunciado
    scob_pk_expediente.SCOB_FN_SANCIONADOS_MULTA(mdet.id_multa,0) AS NOM_SANCIONADO, --sancionado
    scob_pk_expediente.SCOB_FN_SANCIONADOS_TIPO_DOC(mdet.id_multa,0) AS NOM_TIPO_DOC_SANCIONADO,
    scob_pk_expediente.SCOB_FN_SANCIONADOS_NRO_DOC(mdet.id_multa,0) AS NRO_TIPO_DOC_SANCIONADO,
    scob_pk_expediente.SCOB_FN_SANCIONADOS_COD_INDEC(mdet.id_multa,0) AS COD_INDECOPI_SANCIONADO,
    scob_pk_expediente.SCOB_FN_SANCIONADOS_CLAS_INDEC(mdet.id_multa,0) AS CLASIF_SANCIONADO,
    scob_pk_expediente.SCOB_FN_SANCIONADOS_CIIU(mult.id_multa,0) CIIU_SANCIONADO, --act_economica
    DECODE(NVL(MDET.POR_ASOCU,''0''),''0'',''No'',''Si'') AS IND_ASOCU,
    NVL(MDET.POR_ASOCU,0) AS PORCENTAJE_ASOCU,
    --CAMPOS ANTIDUMPING
    MUAN.TIPO_CAMBIO AS TIPO_CAMBIO_DA,
    MUAN.MONTO_ANTIDUMPING AS DERECHO_ANTIDUMPING,
    MUAN.MONTO_INTERES AS MONTO_DA_IC,
    MUAN.MONTO_INTERES_MORATORIO AS MONTO_DA_IM,
    --
    MUAN.NRO_OFICIO_SUNAT_CODIGO || MUAN.NRO_OFICIO_SUNAT_ANIO || MUAN.NRO_OFICIO_SUNAT_PREFIJO || MUAN.NRO_OFICIO_SUNAT_CORRELATIVO AS NRO_OFICIO_SUNAT,
    NRO_LIQUIDACION_CODIGO ||NRO_LIQUIDACION_ANIO || NRO_LIQUIDACION_CORRELATIVO AS NRO_LIQUIDACION_COBRANZA,
    PART.CODIGO AS COD_PARTIDA,
    PART.DESCRIPCION AS NOM_PARTIDA,
    --NO EXISTE EL CAMPO MEMO EN LA INTERFAZ DE ANTIDUMPING
    NRO_DUA_CODIGO || NRO_DUA_ANIO || NRO_DUA_CORRELATIVO AS NRO_DUA,
    MUAN.ID_INTENDENCIA AS COD_INTENDENCIA,
    INTE.DESCRIPCION AS NOM_INTENDENCIA,

    --DECODE(MUAN.NRO_LIQUIDACION_CODIGO,NULL,'''',MUAN.NRO_LIQUIDACION_CODIGO ||''-''|| MUAN.NRO_LIQUIDACION_ANIO ||''/''|| MUAN.NRO_LIQUIDACION_CORRELATIVO) AS NRO_LIQUIDACION_COBRANZA2,
    DECODE(MATE.CODIGO,11,DECODE(SUBM.CODIGO,21,MUAN.NRO_LIQUIDACION_CODIGO ||''-''|| MUAN.NRO_LIQUIDACION_ANIO ||''/''|| MUAN.NRO_LIQUIDACION_CORRELATIVO,''''),'''') AS NRO_LIQUIDACION_COBRANZA2,
    DECODE(MATE.CODIGO,11,DECODE(SUBM.CODIGO,21,TO_CHAR(NIVEL2.FEC_NOTIFICACION_RESOLUCION,''DD/MM/YYYY''),''''),'''') AS FECH_NOT_SUNAT,
    --'''' AS FECH_NOT_SUNAT,
    --MUAN.MONTO_ANTIDUMPING AS MONTO_ANTIDUMPING,
    DECODE(MATE.CODIGO,11,DECODE(SUBM.CODIGO,21,MUAN.NRO_DUA_CODIGO ||''-''|| MUAN.NRO_DUA_ANIO ||''-''|| MUAN.NRO_DUA_CORRELATIVO,''''),'''') AS NRO_DUA2,
    --DECODE(MUAN.NRO_DUA_CODIGO,NULL,'''',MUAN.NRO_DUA_CODIGO ||''-''|| MUAN.NRO_DUA_ANIO ||''-''|| MUAN.NRO_DUA_CORRELATIVO) AS NRO_DUA2,
    DECODE(MATE.CODIGO,11,DECODE(SUBM.CODIGO,21,PART.CODIGO||''-''||PART.DESCRIPCION,''''),'''') AS NOM_PARTIDA2,
    --PART.CODIGO||''-''||PART.DESCRIPCION AS NOM_PARTIDA2,
    --INTE.DESCRIPCION AS DESC_INTENDENCIA,
    --FIN CAMPOS ANTIDUMPING
    -----------------------------------
  ';
  v_sql_select_4 :=
   'NVL(MDET.VALOR_UIT,0) AS VALOR_UIT,
    MULT.MONTO_UIT AS MONTO_UIT,
    MULT.MONTO_INTERES AS MONTO_IC,
    MULT.MONTO_INTERES_MORATORIO AS MONTO_INTERES_IM,
    MULT.MONTO_COSTAS AS MONTO_COSTAS,
    --
    MULT.TOTAL_AMORTIZADO AS TOTAL_AMORTIZADO,
    MULT.TOTAL_AMORTIZADO_IC AS TOTAL_AMORTIZADO_IC,
    MULT.TOTAL_AMORTIZADO_IM AS TOTAL_AMORTIZADO_IM,
    MULT.TOTAL_AMORTIZADO_COSTAS AS TOTAL_AMORTIZADO_COSTAS,
    --
    MULT.SALDO AS SALDO, --saldo_capital
    MULT.SALDO_IC AS SALDO_IC,
    MULT.SALDO_IM AS SALDO_IM,
    MULT.SALDO_COSTAS AS SALDO_COSTAS,
    EST_MULTA_OR.TXT_DESCRIPCION AS NOM_ESTADO_MULTA_OR, --est_multa_resolu
    EST_DEUDA.TXT_DESCRIPCION AS NOM_ESTADO_PAGO, --est_pago_multa
    DECODE(MULT.COD_ESTADO_PAGO,''4'',MULT.PORCENTAJE_DESCUENTO,NULL) AS POR_DSCTO_PAGO, --porcen_dscto_pago
    MULT.FEC_GENERACION_SEC AS FEC_GENERACION_SEC, --fec_gene_sec
    MULT.ANIO_FILE_AEC AS ANIO_FILE_AEC, --anio_file
    MULT.FEC_INGRESO_AEC AS FEC_RECEPCION_FILE,
    ARCO.CODIGO || MULT.NRO_FILE_AEC AS NRO_FILE_AEC, --nro_file
    CASE
      WHEN EXPE.ID_EXPEDIENTE IS NOT NULL
      THEN SCOB_PK_EXPEDIENTE.SCOB_FN_NRO_FILE_CUM_ALFA(EXPE.ID_EXPEDIENTE,1)
      ELSE SCOB_PK_EXPEDIENTE.SCOB_FN_NRO_FILE_CUM_ALFA(MULT.ID_MULTA,2)
    END AS NRO_FILE_CUM_ALFA,
    MCOB.NRO_INGRESO AS NRO_INGRESO_AEC,
    EST_MULTA_COB.TXT_DESCRIPCION AS NOM_ESTADO_MULTA_COB,
    DECODE(MOTIVO_MULT.ID_MOTIVO,0,NULL,MOTIVO_MULT.DESCRIPCION) AS NOM_MOTIVO_MULTA, --moti_multacobra
    MULT.FEC_ULT_IMPROCEDENCIA AS FEC_ULT_OBSERVACION_AEC,
  ';
  v_sql_select_5 :=
    'MULT.FEC_INGRESO_FILE  AS FEC_ULT_INGRESO_AEC,
    EXPE.ANIO||EXPE.NRO_EXPEDIENTE AS NRO_EXPED_COB, --nro_expe_cobranza
    EXPE.FEC_INGRESO AS FEC_GENERACION_EXPED_COB, --fec_gen_exp_cobran
    USUA.USUARIO AS USU_GESTOR_COBRANZA, --gestor_cobranza
    MULT.FECHA_ASIG_COBRANZA AS FEC_ASIG_GESTOR_COBRANZA,
    MULT.FEC_ULT_GEN_PRECOACTIVA AS FEC_ULT_GEN_PRECOACTIVA,
    MULT.FEC_EMISION_REC AS FEC_EMISION_REC, --fec_emision_REC
    MULT.FEC_NOTIF_REC AS FEC_NOTIF_REC, --fec_notifi_REC
    DECODE(NVL(EXPE.FLG_EMBARGO,''0''),''0'',''No'', ''Si'') AS IND_EMBARGO,
    EST_EXP.DESCRIPCION AS NOM_ESTADO_EXPED_COB, --est_exp_cobranza
    MOTIVO_EXPE.DESCRIPCION AS NOM_MOTIVO_EXPED_COB, --moti_exp_cobranza
    EXPE.FEC_ESTADO_EXPEDIENTE AS FEC_ULT_ESTADO_EXPED_COB, --fec_est_exp_cobran
    SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES('||SCOB_PK_CONSTANTES.C_TBL_ESPECTATIVA_COBRO_EXPCOB||',EXPE.COD_EXPECTATIVA_COBRO) AS NOM_EXPECTATIVA_COBRO,
    scob_pk_expediente.SCOB_FN_SANCIONADOS_REGION(mdet.id_multa,0) AS REGION_SANCIONADO,

    DECODE(EXPE.ID_EXPEDIENTE,NULL,MULT.FEC_ENVIO_RIESGO,MULT.FEC_ENVIO_RIESGO_EXP) AS FEC_MARCA_ENVIO_INFOCORP, --(FECHA EN QUE "MARCA" PARA ENVIAR A INFOCORP)
    ARCH_CEN.NRO_ORDEN AS NRO_ENVIO_ARCHIVO, --nro_envarch_central
    ARCH_CEN.FEC_ENVIO AS FEC_ENVIO_ARCHIVO, --fec_envarch_central
    (CASE
      WHEN MULT.ESTADO_ENVIO_ARCHIVO = 2 THEN ''ARCHIVO CENTRAL''
      WHEN MULT.ESTADO_MULTA IN (9,10,11,12,13) THEN ''AEC''
      ELSE '' '' END) AS UBI_FISICA_EXPEDIENTE,
    SIT_MULTA.COD_SITUACION_MULTA AS COD_SITUACION_MULTA,

    TIPO_PROC.Codigo   AS vc_cod_tipoproc,
    MATE.CODIGO        AS VC_COD_MATERIA,
    SUBM.CODIGO        AS VC_COD_SUBMATERIA,
    EST_MULTA_OR.COD_INTERNO  AS VC_COD_EST_MULTA,
    EST_DEUDA.COD_INTERNO     AS VC_COD_EST_PAGO,
    EST_MULTA_COB.COD_INTERNO AS VC_COD_EST_MULTA_COB,
    EST_EXP.CODIGO            AS VC_CODIGO_EST_EXP,
    MOTIVO_EXPE.CODIGO        AS VC_COD_MOTIVO_EXPED_COB,
    NULL               AS VC_CODIGO_CLASIFICACION,
    NULL               AS VC_CODIGO_CIIU,
    (CASE WHEN EXPE.ESTADO_EXPEDIENTE = 4 THEN
     ''FR'' ELSE ''NF'' END) AS VC_TIPO_MULTA,
    scob_pk_consulta.fn_getReso_gaf_aprueba(EXPE.id_expediente) AS vc_reso_gaf_APRUEBA,
    scob_pk_consulta.fn_getFecReso_gaf_aprueba(EXPE.id_expediente) AS vc_FEC_reso_gaf_APRUEBA,
    scob_pk_consulta.fn_getReso_gaf_perdida(EXPE.id_expediente) AS vc_reso_gaf_PERDIDA,
    scob_pk_consulta.fn_getFecReso_gaf_perdida(EXPE.id_expediente) AS vc_FEC_reso_gaf_PERDIDA,
    scob_pk_consulta.SCOB_FN_COD_DENUNCIANTES_MULTA(mdet.id_multa,0) AS VC_NRO_DOC_DENUNCIANTE,
    DECODE(MULT.COD_MOTIVO, 0, NULL, MULT.COD_MOTIVO) AS VC_COD_MOTIVO_MULTA_COB,
    scob_pk_consulta.SCOB_FN_CENTRO_DE_COSTO(MULT.ID_MULTA) AS VC_COD_CENTRO_COSTO,

    NULL AS VC_NRO_REC_DECLA_01,
    NULL AS DT_RES_CONS_FIRME_01,
    NULL AS DT_NOTF_CONS_FIRME_01,
    NULL AS VC_NRO_REC_DECLA_02,
    NULL AS DT_RES_CONS_FIRME_02,
    NULL AS DT_NOTF_CONS_FIRME_02,
    NULL AS VC_NRO_REC_DECLA_03,
    NULL AS DT_RES_CONS_FIRME_03,
    NULL AS DT_NOTF_CONS_FIRME_03 ';

  --JOINS
  v_sql_join_1 := '
  FROM T_SCOB_MULTA MULT
  INNER JOIN T_SCOB_MULTA_DETAL MDET
       ON MDET.ID_MULTA = MULT.ID_MULTA
       AND MDET.FLG_ACTUAL = ''1''
       AND MDET.ESTADO = ''1''
  INNER JOIN (
    SELECT DISTINCT ID_MULTA AS ID_MULTA
    FROM T_SCOB_TMP_ADMINISTRADO
  ) ADMINISTRADO
  ON (
     ('||c_flg_administrado||' = ''0'' AND ''0''=ADMINISTRADO.ID_MULTA)OR
     ('||c_flg_administrado||' <> ''0'' AND ADMINISTRADO.ID_MULTA = MULT.ID_MULTA)
  )
  INNER JOIN T_SCOB_TMP_SITUACION_MULTA SIT_MULTA
        ON SIT_MULTA.ID_MULTA = MULT.ID_MULTA
  INNER JOIN T_SCOB_MATERIA MATE
       ON MATE.ID_MATERIA = MULT.ID_MATERIA
  INNER JOIN T_SCOB_TIPO_PROCEDIMIENTO TIPO_PROC
       ON TIPO_PROC.ID_TIPO_PROCEDIMIENTO = MATE.ID_TIPO_PROCEDIMIENTO
  INNER JOIN T_SCOB_SUBMATERIA SUBM
       ON SUBM.ID_SUBMATERIA = MULT.ID_SUB_MATERIA
  INNER JOIN T_SCOB_ORGANO_RESOLUTIVO ORGR
       ON ORGR.ID_ORGANO_RESOLUTIVO = MDET.ID_ORGANO_RESOLUTIVO
  INNER JOIN T_SCOB_UBIGEO UBIG_ORGR
       ON UBIG_ORGR.COD_DPTO = ORGR.COD_DPTO
       AND UBIG_ORGR.COD_PROV = ORGR.COD_PROV
       AND UBIG_ORGR.COD_DIST = ORGR.COD_DIST
  INNER JOIN T_SCOB_SEDE SEDE
       ON SEDE.ID_SEDE = MULT.ID_SEDE
  INNER JOIN T_SCOB_UBIGEO UBIG_SEDE
       ON UBIG_SEDE.COD_DPTO = SEDE.COD_DPTO
       AND UBIG_SEDE.COD_PROV = SEDE.COD_PROV
       AND UBIG_SEDE.COD_DIST = SEDE.COD_DIST
  INNER JOIN T_SCOB_TABLA_DET TIPO_MULTA
        ON TIPO_MULTA.ID_TABLA = 45 --TIPO MULTA
        AND TO_NUMBER(TIPO_MULTA.COD_INTERNO) = TO_NUMBER(MULT.FLG_TIPO_MULTA)
  INNER JOIN T_SCOB_TABLA_DET EST_DEUDA
        ON EST_DEUDA.ID_TABLA = 34 --ESTADO DEUDA PAGO
        AND TO_NUMBER(EST_DEUDA.COD_INTERNO) = MULT.COD_ESTADO_PAGO';

  v_sql_join_2 := '
  LEFT JOIN T_SCOB_TABLA_DET EST_MULTA_OR
        ON EST_MULTA_OR.ID_TABLA = 5 --ESTADO MULTA OR
        AND TO_NUMBER(EST_MULTA_OR.COD_INTERNO) = MDET.ESTADO_MULTA
        AND TO_NUMBER(EST_MULTA_OR.TXT_VALOR1) = 1
  LEFT JOIN T_SCOB_TABLA_DET EST_MULTA_COB
       ON EST_MULTA_COB.ID_TABLA = 5 --ESTADO MULTA COBRANZA
       AND TO_NUMBER(EST_MULTA_COB.COD_INTERNO) = MULT.ESTADO_MULTA
       AND TO_NUMBER(EST_MULTA_COB.TXT_VALOR1) = 2
  LEFT JOIN T_SCOB_AREA_COBRANZA ARCO
       ON ARCO.ID_AREA_COBRANZA = MULT.ID_AREA_COBRANZA
  LEFT JOIN T_SCOB_USUARIO USUA
       ON USUA.ID_USUARIO = MULT.ID_USUARIO_ASIG_COBRANZA
  ------------------------------------------------------------------------------
  ---INSTANCIAS
  LEFT JOIN T_SCOB_TMP_INSTANCIAS_MULTA1 NIVEL1
       ON NIVEL1.NRO_NIVEL = '||SCOB_PK_CONSTANTES.C_TBL_TIPO_INSTANCIA_AUTO||'
       AND NIVEL1.ID_MULTA = MULT.ID_MULTA
  LEFT JOIN T_SCOB_TMP_INSTANCIAS_MULTA1 NIVEL2
       ON NIVEL2.NRO_NIVEL = '||SCOB_PK_CONSTANTES.C_TBL_TIPO_INSTANCIA_COMI||'
       AND NIVEL2.ID_MULTA = MULT.ID_MULTA
  LEFT JOIN T_SCOB_TMP_INSTANCIAS_MULTA1 NIVEL3
       ON NIVEL3.NRO_NIVEL = '||SCOB_PK_CONSTANTES.C_TBL_TIPO_INSTANCIA_SALA||'
       AND NIVEL3.ID_MULTA = MULT.ID_MULTA
  ------------------------------------------------------------------------------
  LEFT JOIN T_SCOB_MULTA_COBRANZA MCOB
       ON MCOB.ID_MULTA = MULT.ID_MULTA
       AND MCOB.FLG_ACTUAL = ''1''
       AND MCOB.ESTADO = ''1''';

  v_sql_join_3 := '
  LEFT JOIN T_SCOB_EST_MUL_COB_MOTIVO MOTIVO_MULT --motivo multa cobranza
       ON MOTIVO_MULT.ID_MOTIVO = MULT.COD_MOTIVO
  LEFT JOIN T_SCOB_EXPEDIENTE_MULTA EXMU
       ON EXMU.ID_MULTA = MULT.ID_MULTA
       AND EXMU.ESTADO = ''1''
  LEFT JOIN T_SCOB_EXPEDIENTE EXPE
       ON EXPE.ID_EXPEDIENTE = EXMU.ID_EXPEDIENTE
       AND EXPE.ESTADO = ''1''
  LEFT JOIN T_SCOB_EST_EXP_COB EST_EXP
       ON EST_EXP.ID_EST_EXP_COB = EXPE.ESTADO_EXPEDIENTE
  LEFT JOIN T_SCOB_EST_EXP_COB_MOTIVO MOTIVO_EXPE --motivo estado expediente
       ON MOTIVO_EXPE.ID_MOTIVO = EXPE.ID_MOTIVO
  LEFT JOIN T_SCOB_MULTA_ANTIDUMPING MUAN
       ON MUAN.ID_MULTA = MULT.ID_MULTA
       AND MUAN.ESTADO = ''1''
  LEFT JOIN T_SCOB_INTENDENCIA INTE
       ON INTE.ID_INTENDENCIA = MUAN.ID_INTENDENCIA
  LEFT JOIN T_SCOB_PARTIDA PART
       ON PART.ID_PARTIDA = MUAN.ID_PARTIDA';

  v_sql_join_4 := '
  LEFT JOIN T_SCOB_MULTA_ARCHIVO_CENTRAL EXPED_ARCH_CEN
       ON EXPED_ARCH_CEN.ID_MULTA = MULT.ID_MULTA
       AND EXPED_ARCH_CEN.FLG_ACTUAL = ''1''
       AND EXPED_ARCH_CEN.ESTADO = ''1''
  LEFT JOIN T_SCOB_ARCHIVO_CENTRAL ARCH_CEN
       ON ARCH_CEN.ID_ARCHIVO_CENTRAL = EXPED_ARCH_CEN.ID_MULTA_ARCHIVO_CENTRAL
       AND ARCH_CEN.ESTADO = ''1''';

  v_sql_where_1 := v_sql_where_1 || '
  WHERE MULT.ESTADO = ''1''';

  ---------------------------------------------------------------------------
  -- FILTROS MULTA
  ---------------------------------------------------------------------------
  --AREA MACRO
  if pi_v_area_macro is not null then
     v_sql_where_1 := v_sql_where_1 || '
     AND INSTR('''||pi_v_area_macro||''',''|'' || TO_CHAR(TIPO_PROC.ID_TIPO_PROCEDIMIENTO) || ''|'' )>0';
  end if;

  --CODIGO MULTA
  if pi_v_cum_ini is not null then
     v_sql_where_1 := v_sql_where_1 || '
     AND MULT.ANIO||MULT.CUM BETWEEN '''||pi_v_cum_ini||''' AND '''||pi_v_cum_fin|| '''';
  end if;

  --FECHA GENERACION MULTA
  if pi_v_fec_gen_cum_ini is not null then
     v_sql_where_1 := v_sql_where_1 || '
     AND TO_DATE(TO_CHAR(MULT.FEC_INGRESO,''DD/MM/YYYY''),''DD/MM/YYYY'')
     BETWEEN TO_DATE('''||pi_v_fec_gen_cum_ini||''',''DD/MM/YYYY'') AND TO_DATE('''||pi_v_fec_gen_cum_fin||''',''DD/MM/YYYY'')
     ';
  end if;

  --SEDE
  if pi_v_id_sede is not null then
     v_sql_where_1 := v_sql_where_1 || '
     AND INSTR('''||pi_v_id_sede||''',''|'' || TO_CHAR(MULT.ID_SEDE) || ''|'' )>0';
  end if;

  --UBIGEO SEDE
  if PI_V_ID_COD_DPTO_SEDE is not null then
     v_sql_where_1 := v_sql_where_1 || '
     AND SEDE.COD_DPTO='''||PI_V_ID_COD_DPTO_SEDE||'''';
  end if;

  if PI_V_ID_COD_PROV_SEDE is not null then
     v_sql_where_2 := v_sql_where_2 || '
     AND SEDE.COD_PROV='''||PI_V_ID_COD_PROV_SEDE||'''';
  end if;

  if PI_V_ID_COD_DIST_SEDE is not null then
     v_sql_where_2 := v_sql_where_2 || '
     AND SEDE.COD_DIST='''||PI_V_ID_COD_DIST_SEDE||'''';
  end if;

  --ORGANO RESOLUTIVO
  if pi_v_id_org_resol is not null then
     v_sql_where_2 := v_sql_where_2 || '
     AND INSTR('''||pi_v_id_org_resol||''',''|'' || TO_CHAR(MDET.ID_ORGANO_RESOLUTIVO) || ''|'' )>0';
  end if;

  --UBIGEO ORGANO RESOLUTIVO
  if PI_V_ID_COD_DPTO_ORGR is not null then
     v_sql_where_2 := v_sql_where_2 || '
     AND ORGR.COD_DPTO='''||PI_V_ID_COD_DPTO_ORGR||'''';
  end if;

  if PI_V_ID_COD_PROV_ORGR is not null then
     v_sql_where_2 := v_sql_where_2 || '
     AND ORGR.COD_PROV='''||PI_V_ID_COD_PROV_ORGR||'''';
  end if;
  if PI_V_ID_COD_DIST_ORGR is not null then
     v_sql_where_3 := v_sql_where_3 || '
     AND ORGR.COD_DIST='''||PI_V_ID_COD_DIST_ORGR||'''';
  end if;

  --TIPO INSTANCIA
  if PI_V_ID_NRO_INSTANCIA is not null then
     v_sql_where_3 := v_sql_where_3 || '
     AND INSTR('''||PI_V_ID_NRO_INSTANCIA||''',''|'' || TO_CHAR(ORGR.TIPO_INSTANCIA) || ''|'' )>0';
  end if;

  --MATERIA
  if pi_v_id_materia is not null then
     v_sql_where_3 := v_sql_where_3 || '
     AND INSTR('''||pi_v_id_materia||''',''|'' || TO_CHAR(MULT.ID_MATERIA) || ''|'' )>0';
  end if;

  --SUBMATERIA
  if pi_v_id_sub_materia is not null then
     v_sql_where_3 := v_sql_where_3 || '
     AND INSTR('''||pi_v_id_sub_materia||''',''|'' || TO_CHAR(MULT.ID_SUB_MATERIA) || ''|'' )>0';
  end if;

  --NUMERO EXPEDIENTE UNICO
  if pi_v_nro_exp_unico_ini is not null then
     v_sql_where_3 := v_sql_where_3 || '
     AND TO_NUMBER(MULT.NRO_EXPED_UNICO) --@0001
        BETWEEN '''||pi_v_nro_exp_unico_ini||''' and '''||pi_v_nro_exp_unico_fin||'''';
  end if;

  --NUMERO EXPEDIENTE ADMINISTRATIVO
  if pi_v_nroExpAdm_nivel is not null then
     v_sql_where_3 := v_sql_where_3 || '
     AND MDET.NRO_EXP_NIVEL LIKE '''|| pi_v_nroExpAdm_nivel ||'%''';
  end if;

  --NRO RESOLUCION OR
  if pi_v_nro_resol is not null then
     v_sql_where_3 := v_sql_where_3 || '
     AND NIVEL1.NRO_RESOLUCION LIKE '''|| pi_v_nro_resol || '%''';
  end if;

  --FECHA RESOLUCION OR
  if pi_v_fec_reso_or_ini is not null then
     v_sql_where_3 := v_sql_where_3 || '
     AND TO_DATE(TO_CHAR(MDET.FEC_RESOLUCION,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE('''||pi_v_fec_reso_or_ini||''',''DD/MM/YYYY'') AND TO_DATE('''||pi_v_fec_reso_or_fin||''',''DD/MM/YYYY'')';
  end if;

  --FECHA NOTIFICACION RESOLUCION OR
  if pi_v_fec_notifi_or_ini is not null then
     v_sql_where_4 := v_sql_where_4 || '
     AND TO_DATE(TO_CHAR(MDET.FEC_NOTIFICACION_RESOLUCION,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE('''||pi_v_fec_notifi_or_ini||''',''DD/MM/YYYY'') AND TO_DATE('''||pi_v_fec_notifi_or_fin||''',''DD/MM/YYYY'')';
  end if;

  --FECHA GENERACION DE LA SEC
  if PI_V_FEC_GENERACION_SEC_INI is not null then
     v_sql_where_4 := v_sql_where_4 || '
     AND TO_DATE(TO_CHAR(MULT.FEC_GENERACION_SEC,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE('''||PI_V_FEC_GENERACION_SEC_INI||''',''DD/MM/YYYY'') AND TO_DATE('''||PI_V_FEC_GENERACION_SEC_FIN||''',''DD/MM/YYYY'')';
  end if;

  --FECHA INGRESO AL AEC
  if pi_v_fec_recepcion_aec_ini is not null then
     v_sql_where_4 := v_sql_where_4 || '
     AND TO_DATE(TO_CHAR(MULT.FEC_INGRESO_FILE,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE('''||pi_v_fec_recepcion_aec_ini||''',''DD/MM/YYYY'') AND TO_DATE('''||pi_v_fec_recepcion_aec_fin||''',''DD/MM/YYYY'')';
  end if;

  --AÑO INGRESO AL AEC
  if PI_V_ANIO_INGRESO_AEC_INI is not null then
     v_sql_where_4 := v_sql_where_4 || '
     AND MCOB.ANIO
         BETWEEN '''||PI_V_ANIO_INGRESO_AEC_INI||''' AND '''||PI_V_ANIO_INGRESO_AEC_FIN||'''';
  end if;

  --NRO INGRESO AL AEC
  if PI_V_NRO_INGRESO_AEC_INI is not null then
     v_sql_where_4 := v_sql_where_4 || '
     AND MCOB.NRO_INGRESO
         BETWEEN '''||LPAD(PI_V_NRO_INGRESO_AEC_INI,4,'0000')||''' AND '''||LPAD(PI_V_NRO_INGRESO_AEC_FIN,4,'0000')||'''';
  end if;

  --AÑO FILE
  if PI_V_ANIO_FILE_INI is not null then
     v_sql_where_4 := v_sql_where_4 || '
     AND MULT.ANIO_FILE_AEC BETWEEN '''||PI_V_ANIO_FILE_INI||''' AND '''||PI_V_ANIO_FILE_FIN||'''';
  end if;

  --NRO FILE
  if PI_V_NRO_FILE_INI is not null then
     v_sql_where_4 := v_sql_where_4 || '
     AND MULT.NRO_FILE_AEC
         BETWEEN '''||LPAD(PI_V_NRO_FILE_INI,10,'0000000000')||''' AND '''||LPAD(PI_V_NRO_FILE_FIN,10,'0000000000')||'''';
  end if;

  --VALOR UIT
  if pi_n_valor_uit_ini>0 then
     v_sql_where_5 := v_sql_where_5 || '
     AND MDET.VALOR_UIT
         BETWEEN '||pi_n_valor_uit_ini||' AND '||pi_n_valor_uit_fin;
  end if;

  --MONTO UIT
  if pi_n_monto_uit_ini>0 then
     v_sql_where_5 := v_sql_where_5 || '
     AND MULT.MONTO_UIT
         BETWEEN '||pi_n_monto_uit_ini||' AND '||pi_n_monto_uit_fin;
  end if;

  --SALDO UIT
  if pi_n_saldo_ini>0 then
     v_sql_where_5 := v_sql_where_5 || '
     AND MULT.SALDO
         BETWEEN '||pi_n_saldo_ini||' AND '||pi_n_saldo_fin;
  end if;

  --TIPO MULTA
  if pi_v_id_tipo_multa is not null then
     v_sql_where_5 := v_sql_where_5 || '
     AND INSTR('''||pi_v_id_tipo_multa||''',''|'' || MULT.FLG_TIPO_MULTA || ''|'' )>0';
  end if;

  --ESTADO MULTA OR
  if pi_v_cod_estado_multa_resol is not null then
     v_sql_where_5 := v_sql_where_5 || '
     AND INSTR('''||pi_v_cod_estado_multa_resol||''',''|'' || TO_CHAR(MDET.ESTADO_MULTA) || ''|'' )>0';
  end if;

  --ESTADO PAGO MULTA
  if pi_v_cod_estado_pago is not null then
     v_sql_where_5 := v_sql_where_5 || '
     AND INSTR('''||pi_v_cod_estado_pago||''',''|'' || TO_CHAR(MULT.COD_ESTADO_PAGO) || ''|'' )>0';
  end if;

  --FECHA ESTADO MULTA OR
  if PI_V_FEC_ESTADO_MULTA_OR_INI is not null then
     v_sql_where_6 := v_sql_where_6 || '
     AND TO_DATE(TO_CHAR(MDET.FEC_ESTADO_MULTA,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE('''||PI_V_FEC_ESTADO_MULTA_OR_INI||''',''DD/MM/YYYY'') AND TO_DATE('''||PI_V_FEC_ESTADO_MULTA_OR_FIN||''',''DD/MM/YYYY'')';
  end if;

  --FECHA ESTADO MULTA COB
  if PI_V_FEC_ESTADO_MULTA_COB_INI is not null then
     v_sql_where_6 := v_sql_where_6 || '
     AND TO_DATE(TO_CHAR(MULT.FEC_ESTADO_MULTA,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE('''||PI_V_FEC_ESTADO_MULTA_COB_INI||''',''DD/MM/YYYY'') AND TO_DATE('''||PI_V_FEC_ESTADO_MULTA_COB_FIN||''',''DD/MM/YYYY'')';
  end if;

  --ESTADO MULTA COBRANZA
  if pi_v_cod_estado_multa_cob is not null then
     v_sql_where_6 := v_sql_where_6 || '
     AND INSTR('''||pi_v_cod_estado_multa_cob||''',''|'' || TO_CHAR(MULT.ESTADO_MULTA) || ''|'' )>0';
  end if;

  --MOTIVO MULTA COBRANZA
  if pi_v_cod_motivo_multa_cob is not null then
     v_sql_where_6 := v_sql_where_6 || '
     AND INSTR('''||pi_v_cod_motivo_multa_cob||''',''|'' || MULT.COD_MOTIVO || ''|'' )>0';
  end if;

  --INDICADOR DE PAGO
  if PI_V_IND_TIPO_PAGO is not null then
     v_sql_where_6 := v_sql_where_6 || '
     AND INSTR('''||PI_V_IND_TIPO_PAGO||''',''|'' || TO_CHAR(SIT_MULTA.COD_SITUACION_MULTA) || ''|'' )>0';
  end if;

  --INDICADOR PORCENTAJE ASOCU MULTA
  if pi_c_flg_asocu_multa<>'0' then
     v_sql_where_6 := v_sql_where_6 || '
     AND NVL(MDET.POR_ASOCU,0) > 0';
  end if;

  --EXPECTATIVA DE COBRO
  if pi_v_id_expectativa_cobro is not null then
     v_sql_where_7 := v_sql_where_7 || '
     AND INSTR('''||pi_v_id_expectativa_cobro||''',''|'' || TO_CHAR(EXPE.COD_EXPECTATIVA_COBRO) || ''|'' )>0';
  end if;

  --INDICADOR EMBARGO
  if pi_c_flg_ind_embargo<>'0' then
     v_sql_where_7 := v_sql_where_7 || '
     AND NVL(EXPE.FLG_EMBARGO,''0'') = ''1''';
  end if;

  --FECHA ULTIMA GENERACION PRECOACTIVO
  if pi_v_fec_carta_precoactiva_ini is not null then
     v_sql_where_7 := v_sql_where_7 || '
     AND TO_DATE(TO_CHAR(MULT.FEC_ULT_GEN_PRECOACTIVA,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE('''||pi_v_fec_carta_precoactiva_ini||''',''DD/MM/YYYY'') AND TO_DATE('''||pi_v_fec_carta_precoactiva_fin||''',''DD/MM/YYYY'')';
  end if;

 --FECHA RECEPCION FILE
  if pi_v_fec_recepcion_file_ini is not null then
     v_sql_where_7 := v_sql_where_7 || '
     AND TO_DATE(TO_CHAR(MULT.FEC_INGRESO_AEC,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE('''||pi_v_fec_recepcion_file_ini||''',''DD/MM/YYYY'') AND TO_DATE('''||pi_v_fec_recepcion_file_fin||''',''DD/MM/YYYY'')';
  end if;

  ---------------------------------------------------------------------------
  -- FILTROS EXPEDIENTE
  ---------------------------------------------------------------------------
  --ESTADO EXPEDIENTE COBRANZA
  if pi_v_cod_estado_exped_cob is not null then
     v_sql_where_7 := v_sql_where_7 || '
     AND INSTR('''||pi_v_cod_estado_exped_cob||''',''|'' || TO_CHAR(EXPE.ESTADO_EXPEDIENTE) || ''|'' )>0';
  end if;

  --AÑO EXPEDIENTE COBRANZA
  if pi_v_anio is not null then
     v_sql_where_7 := v_sql_where_7 || '
     AND EXPE.ANIO='''||pi_v_anio||'''';
  end if;

  --NRO EXPEDIENTE COBRANZA
  if pi_v_nro_exp_cob_ini>0 then
     v_sql_where_7 := v_sql_where_7 || '
     AND EXPE.NRO_EXPEDIENTE
         BETWEEN lpad('''||pi_v_nro_exp_cob_ini||''',10,''0000000000'') AND lpad('''||pi_v_nro_exp_cob_fin||''',10,''0000000000'')';
  end if;

  --FECHA GENERACION EXPEDIENTE COBRANZA
  if pi_v_fec_gen_exped_cob_ini is not null then
     v_sql_where_8 := v_sql_where_8 || '
     AND TO_DATE(TO_CHAR(EXPE.FEC_INGRESO,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE('''||pi_v_fec_gen_exped_cob_ini||''',''DD/MM/YYYY'') AND TO_DATE('''||pi_v_fec_gen_exped_cob_fin||''',''DD/MM/YYYY'')';
  end if;

  --GESTOR COBRANZA
  if pi_v_gestor_cobranza is not null then
     v_sql_where_8 := v_sql_where_8 || '
     AND INSTR('''||pi_v_gestor_cobranza||''',''|'' || TO_CHAR(MULT.ID_USUARIO_ASIG_COBRANZA) || ''|'' )>0';
  end if;

  --FECHA EMISION DE LA REC
  if pi_v_fec_emi_rec_ini is not null then
     v_sql_where_8 := v_sql_where_8 || '
     AND TO_DATE(TO_CHAR(MULT.FEC_EMISION_REC,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE('''||pi_v_fec_emi_rec_ini||''',''DD/MM/YYYY'') AND TO_DATE('''||nvl(pi_v_fec_emi_rec_fin,pi_v_fec_emi_rec_ini)||''',''DD/MM/YYYY'')';
  end if;

  --FECHA NOTIFICACION DE LA REC
  if pi_v_fec_noti_rec_ini is not null then
     v_sql_where_8 := v_sql_where_8 || '
     AND TO_DATE(TO_CHAR(MULT.FEC_NOTIF_REC,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE('''||pi_v_fec_noti_rec_ini||''',''DD/MM/YYYY'') AND TO_DATE('''||pi_v_fec_noti_rec_fin||''',''DD/MM/YYYY'')';
  end if;

  --MOTIVO EXPEDIENTE COBRANZA
  if pi_v_cod_motivo_exped_cob is not null then
     v_sql_where_8 := v_sql_where_8 || '
     AND INSTR('''||pi_v_cod_motivo_exped_cob||''',''|'' || TO_CHAR(EXPE.ID_MOTIVO) || ''|'' )>0';
  end if;

  --FECHA ULTIMO ESTADO EXPEDIENTE
  if pi_v_fec_est_exped_cob_ini is not null then
     v_sql_where_9 := v_sql_where_9 || '
     AND TO_DATE(TO_CHAR(EXPE.FEC_ESTADO_EXPEDIENTE,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE('''||pi_v_fec_est_exped_cob_ini||''',''DD/MM/YYYY'') AND TO_DATE('''||pi_v_fec_est_exped_cob_fin||''',''DD/MM/YYYY'')';
  end if;

  --NUMERO DE ENVIO A ARCHIVO CENTRAL
  if pi_v_num_env_arch_ini is not null then
     v_sql_where_9 := v_sql_where_9 || '
     AND ARCH_CEN.NRO_ORDEN
         BETWEEN LPAD('''||pi_v_num_env_arch_ini||''',4,''0000'') AND LPAD('''||pi_v_num_env_arch_fin||''',4,''0000'')';
  end if;

  --FECHA ENVIO ARCHIVO CENTRAL
  if pi_v_fec_envi_arch_ini is not null then
     v_sql_where_9 := v_sql_where_9 || '
     AND TO_DATE(TO_CHAR(ARCH_CEN.FEC_ENVIO,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE('''||pi_v_fec_envi_arch_ini||''',''DD/MM/YYYY'') AND TO_DATE('''||pi_v_fec_envi_arch_fin||''',''DD/MM/YYYY'')';
  end if;

  --NRO OFICIO SUNAT
  if pi_v_nro_ofic_sunat_ini is not null then
     v_sql_where_9 := v_sql_where_9 || '
     AND (MUAN.NRO_OFICIO_SUNAT_CODIGO || MUAN.NRO_OFICIO_SUNAT_ANIO ||
     MUAN.NRO_OFICIO_SUNAT_PREFIJO || MUAN.NRO_OFICIO_SUNAT_CORRELATIVO)
     BETWEEN '''||pi_v_nro_ofic_sunat_ini||''' AND '''||pi_v_nro_ofic_sunat_fin||'''';
  end if;

  --DERECHO ANTIDUMOPING
  if pi_n_dere_antiDump_ini>0 then
     v_sql_where_9 := v_sql_where_9 || '
     AND MUAN.MONTO_ANTIDUMPING
         BETWEEN '||pi_n_dere_antiDump_ini||' AND '||pi_n_dere_antiDump_fin;
  end if;

  --PARTIDA ARANCELARIA
  if pi_v_nro_parti_ini is not null then
  v_sql_where_10 := v_sql_where_10 || '
      AND PART.CODIGO
      BETWEEN lpad('''||pi_v_nro_parti_ini||''',10,''0000000000'') AND lpad('''||pi_v_nro_parti_fin||''',10,''0000000000'')';
  end if;

  --MEMO ANTIDUMPING --FALTA EL CAMPO NO EXISTE EN LA INTERFAZ
  --NRO DUA
  if pi_v_nro_dua_ini is not null then
     v_sql_where_10 := v_sql_where_10 || '
     AND (MUAN.NRO_DUA_CODIGO || MUAN.NRO_DUA_ANIO || MUAN.NRO_DUA_CORRELATIVO)
         BETWEEN '''||pi_v_nro_dua_ini||''' AND '''||pi_v_nro_dua_fin||'''';
  end if;

  --NRO LIQUIDACION COBRANZA
  if pi_v_nro_liq_cob_ini is not null then
     v_sql_where_10 := v_sql_where_10 || '
     AND (MUAN.NRO_LIQUIDACION_CODIGO || MUAN.NRO_LIQUIDACION_ANIO || MUAN.NRO_LIQUIDACION_CORRELATIVO)
         BETWEEN '''||pi_v_nro_liq_cob_ini||''' AND '''||pi_v_nro_liq_cob_fin||'''';
  end if;

  --INTENDENCIA
  if pi_v_id_intendencia is not null then
     v_sql_where_10 := v_sql_where_10 || '
     AND INSTR('''||pi_v_id_intendencia||''',''|'' || TO_CHAR(MUAN.ID_INTENDENCIA) || ''|'' )>0';
  end if;

 --FECHA ASIGNACION GESTOR COBRANZA
  if pi_v_fec_asig_gestor_ini is not null then
     v_sql_where_11 := v_sql_where_11 || '
     AND TO_DATE(TO_CHAR(MULT.FECHA_ASIG_COBRANZA,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE('''||pi_v_fec_asig_gestor_ini||''',''DD/MM/YYYY'') AND TO_DATE('''||pi_v_fec_asig_gestor_fin||''',''DD/MM/YYYY'')';
  end if;

  v_sql_where_12 := v_sql_where_12 || '
  ORDER BY CUM DESC';


  DBMS_OUTPUT.put_line(v_sql_select_1);
  DBMS_OUTPUT.put_line(v_sql_select_2);
  DBMS_OUTPUT.put_line(v_sql_select_3);
  DBMS_OUTPUT.put_line(v_sql_select_4);
  DBMS_OUTPUT.put_line(v_sql_select_5);
  ---
  DBMS_OUTPUT.put_line(v_sql_join_1);
  DBMS_OUTPUT.put_line(v_sql_join_2);
  DBMS_OUTPUT.put_line(v_sql_join_3);
  DBMS_OUTPUT.put_line(v_sql_join_4);
  DBMS_OUTPUT.put_line(v_sql_join_5);
  ---
  DBMS_OUTPUT.put_line(v_sql_where_1);
  DBMS_OUTPUT.put_line(v_sql_where_2);
  DBMS_OUTPUT.put_line(v_sql_where_3);
  DBMS_OUTPUT.put_line(v_sql_where_4);
  DBMS_OUTPUT.put_line(v_sql_where_5);
  ---
  DBMS_OUTPUT.put_line(v_sql_where_6);
  DBMS_OUTPUT.put_line(v_sql_where_7);
  DBMS_OUTPUT.put_line(v_sql_where_8);
  DBMS_OUTPUT.put_line(v_sql_where_9);
  DBMS_OUTPUT.put_line(v_sql_where_10);
  DBMS_OUTPUT.put_line(v_sql_where_11);
  DBMS_OUTPUT.put_line(v_sql_where_12);

  open po_cu_retorno for
  --select sysdate from dual;

                     v_sql_select_1 ||
                     v_sql_select_2 ||
                     v_sql_select_3 ||
                     v_sql_select_4 ||
                     v_sql_select_5 ||
                     v_sql_join_1 ||
                     v_sql_join_2 ||
                     v_sql_join_3 ||
                     v_sql_join_4 ||
                     v_sql_join_5 ||
                     v_sql_where_1 ||
                     v_sql_where_2||
                     v_sql_where_3 ||
                     v_sql_where_4 ||
                     v_sql_where_5 ||
                     v_sql_where_6 ||
                     v_sql_where_7 ||
                     v_sql_where_8 ||
                     v_sql_where_9 ||
                     v_sql_where_10 ||
                     v_sql_where_11 ||
                     v_sql_where_12
                     ;
  COMMIT;

end scob_sp_s_multa_avanzada_aec_b;
--
PROCEDURE SCOB_SP_S_CONSULTA_NOTIF_SICOB
/*
-----------------------------------------------------------
-- AUTOR        : RMCA
-- CREADO       : 15.04.2013
-- PROPOSITO    : Consulta del logs de las notificaciones del SICOB
-----------------------------------------------------------
*/
(
   PI_I_NRO_CORREO             IN INTEGER,
   PI_I_COD_EST_ENVIADO        IN T_SCOB_LOG_NOTIFICACION_DET.COD_ESTADO_ENVIADO%TYPE,
   PI_V_FEC_INI_ENVIO          IN VARCHAR2,
   PI_V_FEC_FIN_ENVIO          IN VARCHAR2,
   PI_V_NRO_CUM                IN VARCHAR2,
   PI_N_ID_ORG_RESOL_USUARIO   IN T_SCOB_ORGANO_RESOLUTIVO.ID_ORGANO_RESOLUTIVO%TYPE,
   PO_CU_RETORNO               OUT CU_REC_SET
)
IS
BEGIN

  OPEN PO_CU_RETORNO FOR
  SELECT
       USUA.PRI_NOMBRE || ' ' || USUA.SEG_NOMBRE || ' ' || USUA.APE_PATERNO || ' ' || USUA.APE_MATERNO AS NOM_USUARIO,
       ORGR.DESCRIPCION  AS NOM_ORGANO_RESOLUTIVO,
       NOTIC.NRO_NOTIFICACION AS NRO_CORREO,

       LPAD(TO_CHAR(NOTIC.NRO_NOTIFICACION),2,'00')||' - '||
       NOTIC.DES_NOTIFICACION || ' ' || TO_CHAR(NOTIC.CAN_DIAS_ENVIO) || ' ' ||
       REPLACE(REPLACE(NOTIC.DES_NOTIFICACION_DET,'[IND_DIA]',DECODE(NOTIC.IND_DIAS_HABILES_ENVIO,'1','HÁBIL','CALENDARIO')),'<br>',' ') AS DES_NOM_CORREO,

       COUNT(NOTI.CANT_ENVIOS) AS TOTAL_ENVIOS,
       MULT.ANIO||MULT.CUM AS CUM,
       MAX(TO_CHAR(NDET.FEC_ENVIO,'DD/MM/YYYY HH24:MI:SS')) AS FEC_ULT_ENVIO,
       EST.TXT_DESCRIPCION AS COD_EST_ENVIO_CORREO
  FROM T_SCOB_LOG_NOTIFICACION_DET NDET
  INNER JOIN T_SCOB_LOG_NOTIFICACION NOTI
      ON NOTI.ID_LOG_NOTIFICACION = NDET.ID_LOG_NOTIFICACION
  INNER JOIN T_SCOB_MULTA MULT
      ON MULT.ID_MULTA = NOTI.ID_MULTA
  LEFT JOIN T_SCOB_USUARIO USUA
      ON USUA.ID_USUARIO = NDET.ID_USUARIO
  INNER JOIN T_SCOB_ORGANO_RESOLUTIVO ORGR
        ON ORGR.ID_ORGANO_RESOLUTIVO = NDET.ID_ORGANO_RESOLUTIVO
  INNER JOIN T_SCOB_NOTIFICACION NOTIC
        ON NOTIC.ID_NOTIFICACION = NOTI.ID_NOTIFICACION
  LEFT JOIN T_SCOB_TABLA_DET EST
        ON EST.ID_TABLA = 72
        AND TO_NUMBER(EST.COD_INTERNO) = NDET.COD_ESTADO_ENVIADO
  WHERE NDET.ESTADO = '1'
  AND NOTI.ESTADO = '1'
  AND (PI_I_NRO_CORREO = 0 OR (PI_I_NRO_CORREO<>0 AND NOTI.ID_NOTIFICACION = PI_I_NRO_CORREO))
  AND (TO_DATE(TO_CHAR(NDET.FEC_ENVIO,'DD/MM/YYYY'),'DD/MM/YYYY') BETWEEN TO_DATE(PI_V_FEC_INI_ENVIO,'DD/MM/YYYY') AND TO_DATE(PI_V_FEC_FIN_ENVIO,'DD/MM/YYYY'))
  AND (PI_V_NRO_CUM IS NULL OR (PI_V_NRO_CUM IS NOT NULL AND MULT.ANIO||MULT.CUM = PI_V_NRO_CUM))
  AND (PI_N_ID_ORG_RESOL_USUARIO = 0 OR (PI_N_ID_ORG_RESOL_USUARIO <> 0 AND NDET.ID_ORGANO_RESOLUTIVO = PI_N_ID_ORG_RESOL_USUARIO))
  AND (PI_I_COD_EST_ENVIADO=0 OR (PI_I_COD_EST_ENVIADO<>0 AND NDET.COD_ESTADO_ENVIADO = PI_I_COD_EST_ENVIADO))

  GROUP BY
       USUA.APE_PATERNO,USUA.APE_MATERNO,USUA.PRI_NOMBRE,USUA.SEG_NOMBRE,
       ORGR.DESCRIPCION,
       NOTIC.NRO_NOTIFICACION,
       NOTIC.DES_NOTIFICACION,
       NOTIC.CAN_DIAS_ENVIO,
       NOTIC.DES_NOTIFICACION_DET,
       NOTIC.IND_DIAS_HABILES_ENVIO,
       MULT.ANIO||MULT.CUM,
       EST.TXT_DESCRIPCION

  ORDER BY NOM_USUARIO, NOM_ORGANO_RESOLUTIVO, DES_NOM_CORREO, CUM, FEC_ULT_ENVIO
  ;

END;


  FUNCTION fn_getReso_gaf_aprueba (in_id_expediente number) RETURN varchar IS

    V_RESO VARCHAR2(500):='';
   -- var_odi VARCHAR2(100);
  BEGIN

 select t.nro_resolucion_gaf
   into V_RESO
   from t_Scob_Expediente_Documento t
  where t.id_expediente = in_id_expediente
    and t.nro_resolucion_gaf is not null
    and t.fec_resolucion_gaf is not null
    and t.id_tipo_documento = 12 -- aprueba fraccionamiento
    and t.estado = '1'
    and ROWNUM = 1
  order by t.fec_resolucion_gaf desc;


    RETURN(V_RESO);
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      return 0;
  END;

    FUNCTION fn_getFecReso_gaf_aprueba(in_id_expediente number) RETURN varchar IS

     V_FECRESO VARCHAR2(500):='';
   -- var_odi VARCHAR2(100);
  BEGIN

  select t.fec_resolucion_gaf
    into V_FECRESO
    from t_Scob_Expediente_Documento t
   where t.id_expediente = in_id_expediente
     and t.nro_resolucion_gaf is not null
     and t.fec_resolucion_gaf is not null
     and t.id_tipo_documento = 12 -- aprueba fraccionamiento
     and t.estado = '1'
     and ROWNUM = 1
   order by t.fec_resolucion_gaf desc;


    RETURN(V_FECRESO);
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      return 0;
  END;

    FUNCTION fn_getReso_gaf_perdida(in_id_expediente number) RETURN varchar IS

    V_RESO VARCHAR2(500):='';
   -- var_odi VARCHAR2(100);
  BEGIN

   select t.nro_resolucion_gaf
     into V_RESO
     from t_Scob_Expediente_Documento t
    where t.id_expediente = in_id_expediente
      and t.nro_resolucion_gaf is not null
      and t.fec_resolucion_gaf is not null
      and t.id_tipo_documento = 35 -- pérdida fraccionamiento
      and t.estado = '1'
      and ROWNUM = 1
    order by t.fec_resolucion_gaf desc;

    RETURN(V_RESO);
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      return 0;
  END;

    FUNCTION fn_getFecReso_gaf_perdida(in_id_expediente number) RETURN varchar IS

    V_FECRESO VARCHAR2(500):='';
   -- var_odi VARCHAR2(100);
  BEGIN

   select t.fec_resolucion_gaf
     into V_FECRESO
     from t_Scob_Expediente_Documento t
    where t.id_expediente = in_id_expediente
      and t.nro_resolucion_gaf is not null
      and t.fec_resolucion_gaf is not null
      and t.id_tipo_documento = 35 -- pérdida fraccionamiento
      and t.estado = '1'
      and ROWNUM = 1
    order by t.fec_resolucion_gaf desc;

    RETURN(V_FECRESO);
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      return 0;
  END;

FUNCTION fn_getDenunciante_tipoper(in_id_multa number)
    RETURN varchar IS

    V_TIPO_PERSONA VARCHAR2(500) := 'NO ENCONTRADO';
    V_NU_FILAS NUMBER;
  BEGIN


    SELECT COUNT(PE.TIPO_PERSONA)
      INTO V_NU_FILAS
      FROM USR_SICOB.T_SCOB_MULTA_DETAL MDET
     INNER JOIN USR_SICOB.T_SCOB_MULTA_DENUNCIANTE DENU
        ON (MDET.ID_MULTA_DETAL = DENU.ID_MULTA_DETAL)
     INNER JOIN USR_SICOB.T_SCOB_PERSONA PE
        ON (PE.ID_PERSONA = DENU.ID_PERSONA)
     WHERE MDET.FLG_ACTUAL = 1
       AND MDET.ID_MULTA = in_id_multa;

   IF V_NU_FILAS=1 THEN

   SELECT DECODE(PE.TIPO_PERSONA, 1, 'NATURAL', 2, 'JURÍDICO')
     INTO V_TIPO_PERSONA
     FROM USR_SICOB.T_SCOB_MULTA_DETAL MDET
    INNER JOIN USR_SICOB.T_SCOB_MULTA_DENUNCIANTE DENU
       ON (MDET.ID_MULTA_DETAL = DENU.ID_MULTA_DETAL)
    INNER JOIN USR_SICOB.T_SCOB_PERSONA PE
       ON (PE.ID_PERSONA = DENU.ID_PERSONA)
    WHERE MDET.FLG_ACTUAL = 1
      AND MDET.ID_MULTA = in_id_multa;

    END IF;

    RETURN(V_TIPO_PERSONA);
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      return 0;
  END;

  FUNCTION fn_getDenunciante_doc(in_id_multa number)
    RETURN varchar IS

    V_DOCUMENTO VARCHAR2(500) := 'NO ENCONTRADO';
    V_NU_FILAS NUMBER;
  BEGIN


    SELECT COUNT(PE.TIPO_PERSONA)
      INTO V_NU_FILAS
      FROM USR_SICOB.T_SCOB_MULTA_DETAL MDET
     INNER JOIN USR_SICOB.T_SCOB_MULTA_DENUNCIANTE DENU
        ON (MDET.ID_MULTA_DETAL = DENU.ID_MULTA_DETAL)
     INNER JOIN USR_SICOB.T_SCOB_PERSONA PE
        ON (PE.ID_PERSONA = DENU.ID_PERSONA)
     WHERE MDET.FLG_ACTUAL = 1
       AND MDET.ID_MULTA = in_id_multa;

   IF V_NU_FILAS=1 THEN

   SELECT DECODE(PE.TIPO_DOC,
              1,
              pe.nro_doc,
              2,
              pe.nro_doc,
              3,
              pe.nro_doc,
              4,
              pe.nro_doc,
              5,
              pe.nro_DOc,
              6,
              pe.nro_doc)
     INTO V_DOCUMENTO
     FROM USR_SICOB.T_SCOB_MULTA_DETAL MDET
    INNER JOIN USR_SICOB.T_SCOB_MULTA_DENUNCIANTE DENU
       ON (MDET.ID_MULTA_DETAL = DENU.ID_MULTA_DETAL)
    INNER JOIN USR_SICOB.T_SCOB_PERSONA PE
       ON (PE.ID_PERSONA = DENU.ID_PERSONA)
    WHERE MDET.FLG_ACTUAL = 1
      AND MDET.ID_MULTA = in_id_multa;

    END IF ;

    RETURN(V_DOCUMENTO);
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      return 0;
  END;

  FUNCTION fn_getDenunciante_nomb_razon(in_id_multa number)
    RETURN varchar IS

    V_NOMB_RAZON VARCHAR2(500) := 'NO ENCONTRADO';
    V_NU_FILAS NUMBER;
  BEGIN


    SELECT COUNT(PE.TIPO_PERSONA)
      INTO V_NU_FILAS
      FROM USR_SICOB.T_SCOB_MULTA_DETAL MDET
     INNER JOIN USR_SICOB.T_SCOB_MULTA_DENUNCIANTE DENU
        ON (MDET.ID_MULTA_DETAL = DENU.ID_MULTA_DETAL)
     INNER JOIN USR_SICOB.T_SCOB_PERSONA PE
        ON (PE.ID_PERSONA = DENU.ID_PERSONA)
     WHERE MDET.FLG_ACTUAL = 1
       AND MDET.ID_MULTA = in_id_multa;

   IF V_NU_FILAS = 1 THEN

   SELECT DECODE(PE.TIPO_PERSONA,
                 1,
                 PE.PRI_NOMBRE || ' ' || PE.SEG_NOMBRE || ' ' ||
                 PE.APE_PATERNO || ' ' || PE.APE_MATERNO,
                 2,
                 PE.RAZON_SOCIAL) NOMBRE_RAZON
     INTO V_NOMB_RAZON
     FROM USR_SICOB.T_SCOB_MULTA_DETAL MDET
    INNER JOIN USR_SICOB.T_SCOB_MULTA_DENUNCIANTE DENU
       ON (MDET.ID_MULTA_DETAL = DENU.ID_MULTA_DETAL)
    INNER JOIN USR_SICOB.T_SCOB_PERSONA PE
       ON (PE.ID_PERSONA = DENU.ID_PERSONA)
    WHERE MDET.FLG_ACTUAL = 1
      AND MDET.ID_MULTA = in_id_multa;

    END IF ;

    RETURN(V_NOMB_RAZON);
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      return 0;
  END;
---
FUNCTION SCOB_FN_COD_DENUNCIANTES_MULTA(
  PI_N_ID_MULTA IN T_SCOB_MULTA.ID_MULTA%TYPE,
  PI_N_NRO_PERSONAS IN INTEGER
) RETURN  VARCHAR2
IS
  V_RESPUESTA   VARCHAR2 (4000);
  V_NRO_DOC     VARCHAR2 (200);
  V_ID          NUMBER;
  CUR_SANC      cu_rec_set;
  I_CONT        INTEGER;
BEGIN

  OPEN CUR_SANC FOR
  SELECT DISTINCT
    MDEN.ID_MULTA_DENUNCIANTE,
    PERS.NRO_DOC
    --DECODE(PERS.TIPO_PERSONA,SCOB_PK_CONSTANTES.C_TIPO_PERS_JURIDICA, PERS.NRO_DOC .RAZON_SOCIAL,  PERS.APE_PATERNO  || ' ' || PERS.APE_MATERNO  || ' ' || PERS.PRI_NOMBRE || ' ' || PERS.SEG_NOMBRE || ' ' || PERS.APE_CASADA) AS NOM_SANCIONADO
  FROM T_SCOB_MULTA_DETAL MDET
  INNER JOIN T_SCOB_MULTA_DENUNCIANTE MDEN
        ON MDEN.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL
        AND MDEN.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
  INNER JOIN T_SCOB_PERSONA PERS
        ON PERS.ID_PERSONA = MDEN.ID_PERSONA
  WHERE
  MDET.ID_MULTA = PI_N_ID_MULTA
  AND MDET.FLG_ACTUAL = '1'
  ORDER BY MDEN.ID_MULTA_DENUNCIANTE;

  I_CONT := 0;

  LOOP
  FETCH CUR_SANC INTO V_ID, V_NRO_DOC;
  EXIT WHEN CUR_SANC%NOTFOUND;
    I_CONT := I_CONT + 1;
    IF I_CONT > PI_N_NRO_PERSONAS AND PI_N_NRO_PERSONAS <> 0 THEN
    BEGIN
       V_RESPUESTA := V_RESPUESTA || '. . . y otros.';
       EXIT;
    END;
    END IF;

    V_RESPUESTA := V_RESPUESTA || '/ '  || V_NRO_DOC;
  END LOOP;
  CLOSE CUR_SANC;
  V_RESPUESTA := SUBSTR(V_RESPUESTA,2,LENGTH(V_RESPUESTA));
  RETURN NVL(TRIM(V_RESPUESTA), ' ');
END;

FUNCTION SCOB_FN_CENTRO_DE_COSTO(
  PI_N_ID_MULTA IN T_SCOB_MULTA.ID_MULTA%TYPE
) RETURN  VARCHAR2
    IS
  V_CC   VARCHAR2 (4000);
  V_NU_ID_MDET NUMBER;

BEGIN

/*SELECT MD.ID_MULTA_DETAL
  INTO V_NU_ID_MDET
  FROM USR_SICOB.T_SCOB_MULTA_DETAL MD
 WHERE ROWNUM = 1
   AND MD.ID_MULTA = PI_N_ID_MULTA;

SELECT OXM.VC_SIA_CC_COD
  INTO V_CC
  FROM USR_SICOB.T_SCOB_MULTA_DETAL MDET
 INNER JOIN USR_SICOB.T_SCOB_ORG_RESOL_MATERIA OXM
    ON (MDET.ID_ORGANO_RESOLUTIVO = OXM.ID_ORGANO_RESOLUTIVO)
 INNER JOIN USR_SICOB.T_SCOB_MULTA MU
    ON (MU.ID_MATERIA = OXM.ID_MATERIA AND MDET.ID_MULTA = MU.ID_MULTA)
 WHERE OXM.ESTADO = 1
   AND MDET.ESTADO = 1
   AND MU.ESTADO = 1
   AND MDET.ID_MULTA_DETAL = V_NU_ID_MDET;*/


SELECT OXM.VC_SIA_CC_COD INTO V_CC
  FROM USR_SICOB.T_SCOB_MULTA_DETAL MDET
 INNER JOIN USR_SICOB.T_SCOB_ORG_RESOL_MATERIA OXM
    ON (MDET.ID_ORGANO_RESOLUTIVO = OXM.ID_ORGANO_RESOLUTIVO)
 INNER JOIN USR_SICOB.T_SCOB_MULTA MU
    ON (MU.ID_MATERIA = OXM.ID_MATERIA AND MDET.ID_MULTA = MU.ID_MULTA)
 WHERE OXM.ESTADO = 1
   AND MDET.ESTADO = 1
   AND MU.ESTADO = 1
   AND MDET.ID_MULTA_DETAL IN (select x.ID_MULTA_DETAL
                                 from (SELECT MD.ID_MULTA_DETAL
                                         FROM USR_SICOB.T_SCOB_MULTA_DETAL MD
                                        WHERE MD.ID_MULTA = PI_N_ID_MULTA
                                        order by md.id_multa_detal) x
                                where ROWNUM = 1);

  RETURN V_CC;

END;
--
FUNCTION SCOB_FN_DATA_CONS_AVANZADA
(
  PI_N_OP IN NUMBER,
  PI_N_ID_MULTA IN T_SCOB_MULTA.ID_MULTA%TYPE,
  PI_N_TIPO_INSTANCIA IN T_SCOB_ORGANO_RESOLUTIVO.TIPO_INSTANCIA%TYPE,
  PI_N_ID_ORGANO_RESOLUTIVO IN T_SCOB_ORGANO_RESOLUTIVO.ID_ORGANO_RESOLUTIVO%TYPE,
  PI_V_OPCION IN VARCHAR2
) RETURN  VARCHAR2
IS
  V_QUERY CLOB;
  V_RPTA VARCHAR2(150);
  A1 cu_rec_set;
  V_VALOR_UIT NUMBER;
  V_FEC_DECLARACION VARCHAR2(150);
  V_AUDFECCREACION VARCHAR2(150);
  V_TIPO_INSTANCIA_CREA T_SCOB_ORGANO_RESOLUTIVO.TIPO_INSTANCIA%TYPE;
BEGIN
  NULL;
  V_QUERY:='';
  V_RPTA:='';
  -- OBTENEMOS LA INSTANCIA EN LA QUE SE CREO EL CUM
  SELECT MIN(B.TIPO_INSTANCIA) INTO V_TIPO_INSTANCIA_CREA
  FROM T_SCOB_MULTA_DETAL A
  INNER JOIN T_SCOB_ORGANO_RESOLUTIVO B ON A.ID_ORGANO_RESOLUTIVO=B.ID_ORGANO_RESOLUTIVO
  WHERE ID_MULTA=PI_N_ID_MULTA;
  --
  IF PI_N_OP = 1 THEN -- UIT_NIVEL, FEC_DECLARACION_NIVEL
    V_QUERY:='SELECT B.VALOR_UIT, TO_CHAR(B.FEC_DECLARACION,''DD/MM/YYYY'')
      FROM T_SCOB_MULTA A
      INNER JOIN T_SCOB_MULTA_DETAL B ON A.ID_MULTA = B.ID_MULTA
      INNER JOIN T_SCOB_ORGANO_RESOLUTIVO C ON B.ID_ORGANO_RESOLUTIVO = C.ID_ORGANO_RESOLUTIVO
      WHERE A.ID_MULTA = '||PI_N_ID_MULTA||'
      AND A.ESTADO = '||SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO||'
      AND C.TIPO_INSTANCIA = '||PI_N_TIPO_INSTANCIA;
    --
    OPEN A1 FOR V_QUERY;
    FETCH A1 INTO V_VALOR_UIT, V_FEC_DECLARACION;
    CLOSE A1;
    --
  ELSIF PI_N_OP = 2 THEN
    V_QUERY:='SELECT TO_CHAR(D.AUDFECCREACION,''DD/MM/YYYY'')
    FROM T_SCOB_MULTA A
    INNER JOIN T_SCOB_MULTA_DETAL B ON A.ID_MULTA = B.ID_MULTA
    INNER JOIN T_SCOB_ORGANO_RESOLUTIVO C ON B.ID_ORGANO_RESOLUTIVO = C.ID_ORGANO_RESOLUTIVO
    INNER JOIN T_SCOB_MULTA_ESTADO D ON D.ID_MULTA = B.ID_MULTA
    AND D.ID_MULTA_DETAL = B.ID_MULTA_DETAL
    AND D.ESTADO         = '||SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO||'
    WHERE A.ID_MULTA     = '||PI_N_ID_MULTA||'
    AND A.ESTADO         = '||SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO||'
    AND C.TIPO_INSTANCIA = '||PI_N_TIPO_INSTANCIA;
    --AND B.ID_ORGANO_RESOLUTIVO = '||PI_N_ID_ORGANO_RESOLUTIVO*/;
    --
    IF PI_N_TIPO_INSTANCIA = 1 THEN
      V_QUERY:=V_QUERY||' AND D.ESTADO_MULTA = 3';
    END IF;
    --
    IF PI_N_TIPO_INSTANCIA = 2 THEN
      IF V_TIPO_INSTANCIA_CREA = 1 THEN
        V_QUERY:=V_QUERY||' AND D.ESTADO_MULTA = 6';
      ELSIF V_TIPO_INSTANCIA_CREA = 2 THEN
        V_QUERY:=V_QUERY||' AND D.ESTADO_MULTA = 3';
      END IF;
    END IF;
    --
    IF PI_N_TIPO_INSTANCIA = 3 THEN
      IF V_TIPO_INSTANCIA_CREA = 1 THEN
        V_QUERY:=V_QUERY||' AND D.ESTADO_MULTA = 8';
      ELSIF V_TIPO_INSTANCIA_CREA = 2 THEN
        V_QUERY:=V_QUERY||' AND D.ESTADO_MULTA = 6';
      END IF;
    END IF;
    --
    DBMS_OUTPUT.PUT_LINE('V_QUERY2: '||V_QUERY);
    OPEN A1 FOR V_QUERY;
    FETCH A1 INTO V_AUDFECCREACION;
    CLOSE A1;
    --
  END IF;
  -- OPCIONES
  IF PI_V_OPCION = 'VALOR_UIT' THEN
    V_RPTA:=V_VALOR_UIT;
  ELSIF PI_V_OPCION = 'FEC_DECLARACION' THEN
    V_RPTA:=V_FEC_DECLARACION;
  ELSIF PI_V_OPCION = 'AUDFECCREACION' THEN
    V_RPTA:=V_AUDFECCREACION;
  END IF;
  DBMS_OUTPUT.PUT_LINE('PI_V_OPCION: '||PI_V_OPCION);
  DBMS_OUTPUT.PUT_LINE('V_AUDFECCREACION: '||V_AUDFECCREACION);
  DBMS_OUTPUT.PUT_LINE('V_RPTA: '||V_RPTA);
  --
  RETURN TRIM(V_RPTA);
  --
END SCOB_FN_DATA_CONS_AVANZADA;
--


PROCEDURE SCOB_SP_S_MULTA_AVANZADA(
      -----------------------------------------------------------------------------------------------
    /*001*/   pi_v_area_macro                        in varchar2      --AREA MACRO
    /*002*/  ,pi_v_cum_ini                           in varchar2      --cum
    /*003*/  ,pi_v_cum_fin                           in varchar2      --cum
    /*004*/  ,pi_v_fec_gen_cum_ini                   in varchar2      --FECHA GENERACION CUM INI
    /*005*/  ,pi_v_fec_gen_cum_fin                   in varchar2      --FECHA GENERACION CUM FIN
    /*006*/  ,pi_v_id_sede                           in varchar2      --sede
    /*007*/  ,PI_V_ID_COD_DPTO_SEDE                  in VARCHAR2      --CODIGO DEPARTAMENTO SEDE
    /*008*/  ,PI_V_ID_COD_PROV_SEDE                  in VARCHAR2      --CODIGO PROVINCIA SEDE
    /*009*/  ,PI_V_ID_COD_DIST_SEDE                  in VARCHAR2      --CODIGO DISTRITO SEDE
    /*010*/  ,pi_v_id_org_resol                      in varchar2      --organo resolutivo
    /*011*/  ,PI_V_ID_COD_DPTO_ORGR                  in VARCHAR2      --CODIGO DEPARTAMENTO ORGANO RESOLUTIVO
    /*012*/  ,PI_V_ID_COD_PROV_ORGR                  in VARCHAR2      --CODIGO PROVINCIA ORGANO RESOLUTIVO
    /*013*/  ,PI_V_ID_COD_DIST_ORGR                  in VARCHAR2      --CODIGO DISTRITO ORGANO RESOLUTIVO
    /*014*/  ,PI_V_ID_NRO_INSTANCIA                  in VARCHAR2      --NUMERO DE INSTANCIA
    /*015*/  ,pi_v_id_materia                        in varchar2      --materia
    /*016*/  ,pi_v_id_sub_materia                    in varchar2      --SUBMATERIA
    /*017*/  ,pi_v_nro_exp_unico_ini                 in varchar2      --nro. expediente administrativo
    /*018*/  ,pi_v_nro_exp_unico_fin                 in varchar2      --nro. expediente administrativo
    /*019*/  ,pi_v_nroExpAdm_nivel                   in varchar2      --nro. expediente antiguo
    /*020*/  ,pi_v_nro_resol                         in varchar2      --nro. resolucion or
    /*021*/  ,pi_v_fec_reso_or_ini                   in varchar2      --FECHA RESOLUCION OR INI
    /*022*/  ,pi_v_fec_reso_or_fin                   in varchar2      --FECHA RESOLUCION OR FIN
    /*023*/  ,pi_v_fec_notifi_or_ini                 in varchar2      --FECHA NOTIFICACION RESOLUCION INI
    /*024*/  ,pi_v_fec_notifi_or_fin                 in varchar2      --FECHA NOTIFICACION RESOLUCION FIN
    /*025*/  ,PI_V_FEC_GENERACION_SEC_INI            in VARCHAR2      --FECHA GENERACION SEC
    /*026*/  ,PI_V_FEC_GENERACION_SEC_FIN            in VARCHAR2      --FECHA GENERACION SEC
    ---
    /*027*/  ,pi_v_fec_recepcion_aec_ini             in varchar2      --FECHA RECEPCION AEC INICIO
    /*028*/  ,pi_v_fec_recepcion_aec_fin             in varchar2      --FECHA RECEPCION AEC FIN
    /*029*/  ,PI_V_ANIO_INGRESO_AEC_INI              in varchar2      --AÑO INGRESO AL AEC INI
    /*030*/  ,PI_V_ANIO_INGRESO_AEC_FIN              in varchar2      --AÑO INGRESO AL AEC FIN
    /*031*/  ,PI_V_NRO_INGRESO_AEC_INI               in varchar2      --nro. ingreso aec
    /*032*/  ,PI_V_NRO_INGRESO_AEC_FIN               in varchar2      --nro. ingreso aec
    ---
    /*033*/  ,PI_V_ANIO_FILE_INI                     in varchar2      --AÑO FILE INI
    /*034*/  ,PI_V_ANIO_FILE_FIN                     in varchar2      --AÑO FILE FIN
    /*035*/  ,PI_V_NRO_FILE_INI                      in varchar2      --nro. file
    /*036*/  ,PI_V_NRO_FILE_FIN                      in varchar2      --nro. file
    /*037*/  ,pi_v_fec_recepcion_file_ini            in varchar2      --FECHA RECEPCION FILE INICIO
    /*038*/  ,pi_v_fec_recepcion_file_fin            in varchar2      --FECHA RECEPCION FILE FIN
    ---
    /*039*/  ,pi_n_valor_uit_ini                     in number        --nro uit ini
    /*040*/  ,pi_n_valor_uit_fin                     in number        --nro uit fin
    /*041*/  ,pi_n_monto_uit_ini                     in NUMBER        --MONTO UIT INI
    /*042*/  ,pi_n_monto_uit_fin                     in NUMBER        --MONTO UIT FIN
    /*043*/  ,pi_n_saldo_ini                         in NUMBER        --SALDO UIT INI
    /*044*/  ,pi_n_saldo_fin                         in NUMBER        --SALDO UIT FIN
    /*045*/  ,pi_v_id_tipo_multa                     in varchar2      --TIPO MULTA (SOLIDARIA/INDIVIDUAL)
    /*046*/  ,pi_v_cod_estado_multa_resol            in varchar2      --estado de la multa resolutivo
    /*047*/  ,pi_v_cod_estado_pago                   in varchar2      --estado pago de la multa
    /*048*/  ,PI_V_FEC_ESTADO_MULTA_OR_INI           in VARCHAR2      --FECHA ESTADO MULTA OR INI
    /*049*/  ,PI_V_FEC_ESTADO_MULTA_OR_FIN           in VARCHAR2      --FECHA ESTADO MULTA OR FIN
    /*050*/  ,PI_V_FEC_ESTADO_MULTA_COB_INI          in VARCHAR2      --FECHA ESTADO MULTA COBRANZA
    /*051*/  ,PI_V_FEC_ESTADO_MULTA_COB_FIN          in VARCHAR2      --FECHA ESTADO MULTA COBRANZA
    /*052*/  ,pi_v_cod_estado_multa_cob              in varchar2      --estado de la multa cobranza
    /*053*/  ,pi_v_cod_motivo_multa_cob              in varchar2      --motivo multa cobranza
    /*054*/  ,PI_V_IND_TIPO_PAGO                     in VARCHAR2      --INDICADOR DE PAGO
    /*055*/  ,pi_c_flg_asocu_multa                   IN CHAR         --INDICADOR % ASOCU > 0
    -----------------------------------------------------------------------------------------------
    /*056*/  ,pi_v_cod_estado_exped_cob              in varchar2      --estado expediente cobranza
    /*057*/  ,pi_v_anio                              in varchar2      --año expediente cobranza
    /*058*/  ,pi_v_nro_exp_cob_ini                   in varchar2      --nro. expediente cobranza
    /*059*/  ,pi_v_nro_exp_cob_fin                   in varchar2      --nro. expediente cobranza
    /*060*/  ,pi_v_fec_gen_exped_cob_ini             in varchar2      --FECHA GENERACION EXPED COBRANZA INI
    /*061*/  ,pi_v_fec_gen_exped_cob_fin             in varchar2      --FECHA GENERACION EXPED COBRANZA FIN
    -------
    /*062*/  ,pi_v_gestor_cobranza                   in varchar2      --Gestor de cobranza
    /*063*/  ,pi_v_fec_emi_rec_ini                   in varchar2      --Fecha de Emisión de la REC
    /*064*/  ,pi_v_fec_emi_rec_fin                   in varchar2      --Fecha de Emisión de la REC
    /*065*/  ,pi_v_fec_noti_rec_ini                  in varchar2      --Fecha de Notificación de la REC
    /*066*/  ,pi_v_fec_noti_rec_fin                  in varchar2      --Fecha de Notificación de la REC
    /*067*/  ,pi_v_cod_motivo_exped_cob              in varchar2      --motivo expediente cobranza---------
    /*068*/  ,pi_v_fec_est_exped_cob_ini             in varchar2      --Fecha de Estado del Expediente
    /*069*/  ,pi_v_fec_est_exped_cob_fin             in varchar2      --Fecha de Estado del Expediente
    /*070*/  ,pi_v_num_env_arch_ini                  in varchar2      --Nº Envio a Archivo Central
    /*071*/  ,pi_v_num_env_arch_fin                  in varchar2      --Nº Envio a Archivo Central
    /*072*/  ,pi_v_fec_envi_arch_ini                 in varchar2      --Fecha de Envío a Archivo Central
    /*073*/  ,pi_v_fec_envi_arch_fin                 in varchar2      --Fecha de Envío a Archivo Central
    /*074*/  ,pi_v_nro_ofic_sunat_ini                in varchar2      --Nº de Oficio de la SUNAT
    /*075*/  ,pi_v_nro_ofic_sunat_fin                in varchar2      --Nº de Oficio de la SUNAT
    /*076*/  ,pi_n_dere_antiDump_ini                 in NUMBER        --Derechos Antidumping
    /*077*/  ,pi_n_dere_antiDump_fin                 in NUMBER        --Derechos Antidumping
    /*078*/  ,pi_v_nro_parti_ini                     in varchar2      --Partida Arancelaria
    /*079*/  ,pi_v_nro_parti_fin                     in varchar2      --Partida Arancelaria
    /*080*/  ,pi_v_nro_dua_ini                       in varchar2      --Nº DUA
    /*081*/  ,pi_v_nro_dua_fin                       in varchar2      --Nº DUA
    /*082*/  ,pi_v_nro_liq_cob_ini                   in varchar2      --Nº Liquidación de Cobranza
    /*083*/  ,pi_v_nro_liq_cob_fin                   in varchar2      --Nº Liquidación de Cobranza
    /*084*/  ,pi_v_id_intendencia                    in varchar2      --Intendencia antidumping
    /*085*/  ,pi_c_flg_ind_embargo                   in char          --INDICADOR TIENE EMBARGO?
    /*086*/  ,pi_v_fec_asig_gestor_ini               in varchar2      --fecha de asignacion de gestor ini
    /*087*/  ,pi_v_fec_asig_gestor_fin               in varchar2      --fecha de asignacion de gestor fin
    /*088*/  ,pi_v_fec_carta_precoactiva_ini         in varchar2      --fecha de carta precoactiva inicio
    /*089*/  ,pi_v_fec_carta_precoactiva_fin         in varchar2      --fecha de carta precoactiva fin
    /*090*/  ,pi_v_id_expectativa_cobro              in varchar2      --cadena codigos espectativa de cobro

    -----------------------------------------------------------------------------------------------
            --denunciante
    /*091*/  ,pi_v_d_codSanciona_ini                 in varchar2      --Código del INDECOPI
    /*092*/  ,pi_v_d_codSanciona_fin                 in varchar2      --Código del INDECOPI
    /*093*/  ,pi_i_d_tip_persona                     in integer       --Tipo de Personería
    /*094*/  ,pi_v_d_razon_social                    in varchar2      --Razón Social
    /*095*/  ,pi_v_d_ape_paterno                     in varchar2      --Apellido Paterno
    /*096*/  ,pi_v_d_ape_materno                     in varchar2      --Apellido Materno
    /*097*/  ,pi_v_d_ape_casada                      in varchar2      --Apellido Casada
    /*098*/  ,pi_v_d_pri_nombre                      in varchar2      --Primer nombre
    /*099*/  ,pi_v_d_seg_nombre                      in varchar2      --Segundo nombre
    /*100*/  ,pi_i_d_tipo_doc                        in integer       --Tipo de Documento
    /*101*/  ,pi_v_d_nro_doc                         in varchar2      --Nº de documento de identidad
    /*102*/  ,pi_i_d_tip_empresa                     in integer       --Tipo de Empresa
    /*103*/  ,pi_n_d_id_sect_econo                   in number        --CIIU (Actividad Economica)
    /*104*/  ,pi_c_d_flg_asocu                       in char          --flag asocu
    /*105*/  ,pi_c_d_fl_oficio                       in char          --indicador denunciante de oficio=Indecopi
            --denunciado
    /*106*/  ,pi_v_do_codSanciona_ini                in varchar2      --Código del INDECOPI
    /*107*/  ,pi_v_do_codSanciona_fin                in varchar2      --Código del INDECOPI
    /*108*/  ,pi_i_do_tip_persona                    in integer       --Tipo de Personería
    /*109*/  ,pi_v_do_razon_social                   in varchar2      --Razón Social
    /*110*/  ,pi_v_do_ape_paterno                    in varchar2      --Apellido Paterno
    /*111*/  ,pi_v_do_ape_materno                    in varchar2      --Apellido Materno
    /*112*/  ,pi_v_do_ape_casada                     in varchar2      --Apellido Casada
    /*113*/  ,pi_v_do_pri_nombre                     in varchar2      --Primer nombre
    /*114*/  ,pi_v_do_seg_nombre                     in varchar2      --Segundo nombre
    /*115*/  ,pi_i_do_tipo_doc                       in integer       --Tipo de Documento
    /*116*/  ,pi_v_do_nro_doc                        in varchar2      --Nº de documento de identidad
    /*117*/  ,pi_i_do_tip_empresa                    in integer       --Tipo de Empresa
    /*118*/  ,pi_n_do_id_sect_econo                  in number        --CIIU (Actividad Economica)
    /*119*/  ,pi_c_do_flg_asocu                      in char          --flag asocu
             --sancionado
    /*120*/  ,pi_v_s_codSanciona_ini                 in varchar2      --Código del INDECOPI
    /*121*/  ,pi_v_s_codSanciona_fin                 in varchar2      --Código del INDECOPI
    /*122*/  ,pi_i_s_tip_persona                     in integer       --Tipo de Personería
    /*123*/  ,pi_v_s_razon_social                    in varchar2      --Razón Social
    /*124*/  ,pi_v_s_ape_paterno                     in varchar2      --Apellido Paterno
    /*125*/  ,pi_v_s_ape_materno                     in varchar2      --Apellido Materno
    /*126*/  ,pi_v_s_ape_casada                      in varchar2      --Apellido Casada
    /*127*/  ,pi_v_s_pri_nombre                      in varchar2      --Primer nombre
    /*128*/  ,pi_v_s_seg_nombre                      in varchar2      --Segundo nombre
    /*129*/  ,pi_i_s_tipo_doc                        in integer       --Tipo de Documento
    /*130*/  ,pi_v_s_nro_doc                         in varchar2      --Nº de documento de identidad
    /*131*/  ,pi_i_s_tip_empresa                     in integer       --Tipo de Empresa
    /*132*/  ,pi_n_s_id_sect_econo                   in number        --CIIU (Actividad Economica)
    /*133*/  ,pi_c_s_flg_asocu                       in char           --flag asocu
    --@0002:ini
    /*134*/  ,pi_c_s_flg_buscar_by_contenido         in char           --0=NO;1=SI
    --@0002:fin
    -----------------------------------------------------------------------------------------------
             ,po_cu_retorno                          out cu_rec_set) IS
    
        C_FLG_ADMINISTRADO CHAR(1);
        C_FLG_SANCIONADO   CHAR(1);
        C_FLG_DENUNCIADO   CHAR(1);
        C_FLG_DENUNCIANTE  CHAR(1);
    
        V_SQL_ADMIN_SELECT   VARCHAR2(8000);
        V_SQL_ADMIN_WHERE_D  VARCHAR2(8000);
        V_SQL_ADMIN_WHERE_DO VARCHAR2(8000);
        V_SQL_ADMIN_WHERE_S  VARCHAR2(8000);
    
        V_SQL_SELECT_1   CLOB;
        V_SQL_SELECT_2   CLOB;
        V_SQL_JOIN_1     CLOB;
        V_SQL_JOIN_2     CLOB;
        V_SQL_WHERE_1    clob;
        C_CAR_PORCENTAJE VARCHAR(1);
        V_TAB_MULT_BUS_A       USR_SICOB.OBJ_TAB_CONS_MULTA_AVAN :=  USR_SICOB.OBJ_TAB_CONS_MULTA_AVAN(); --USR_SIA_INTFZ.Obj_Tab_Mult_Busc_Avan := USR_SIA_INTFZ.Obj_Tab_Mult_Busc_Avan();
        V_NU_TOTAL             NUMBER := 0;
        
        V_SQL_TMP_QUERY_1   CLOB;
        V_SQL_TMP_QUERY_2   CLOB;
        V_SQL_TMP_QUERY_3   CLOB;
        
        v_total             number := 0;
        
    BEGIN
        --@0002:ini
        C_CAR_PORCENTAJE := '';
        IF PI_C_S_FLG_BUSCAR_BY_CONTENIDO = '1' THEN
            C_CAR_PORCENTAJE := '%';
        END IF;
        --@0002:fin
    
        --control del filtro sancionado
        C_FLG_ADMINISTRADO := '0';
        C_FLG_SANCIONADO   := '0';
        C_FLG_DENUNCIADO   := '0';
        C_FLG_DENUNCIANTE  := '0';
        
        IF PI_V_S_CODSANCIONA_INI IS NOT NULL OR
           PI_V_S_CODSANCIONA_FIN IS NOT NULL OR
           PI_I_S_TIP_PERSONA <> 0 OR
           PI_V_S_RAZON_SOCIAL IS NOT NULL OR
           PI_V_S_APE_PATERNO IS NOT NULL OR
           PI_V_S_APE_MATERNO IS NOT NULL OR
           PI_V_S_APE_CASADA IS NOT NULL OR
           PI_V_S_PRI_NOMBRE IS NOT NULL OR
           PI_V_S_SEG_NOMBRE IS NOT NULL OR
           PI_I_S_TIPO_DOC <> 0 OR
           PI_V_S_NRO_DOC IS NOT NULL OR
           PI_I_S_TIP_EMPRESA <> 0 OR
           PI_N_S_ID_SECT_ECONO <> 0 OR
           PI_C_S_FLG_ASOCU <> '0' THEN
            C_FLG_SANCIONADO := '1';
            IF C_FLG_ADMINISTRADO = '0' THEN
                C_FLG_ADMINISTRADO := '1';
            END IF;
        END IF;
    
        IF (PI_V_DO_CODSANCIONA_INI IS NOT NULL OR PI_V_DO_CODSANCIONA_FIN IS NOT NULL OR PI_I_DO_TIP_PERSONA <> 0 OR
           PI_V_DO_RAZON_SOCIAL IS NOT NULL OR PI_V_DO_APE_PATERNO IS NOT NULL OR PI_V_DO_APE_MATERNO IS NOT NULL OR PI_V_DO_APE_CASADA IS NOT NULL OR
           PI_V_DO_PRI_NOMBRE IS NOT NULL OR PI_V_DO_SEG_NOMBRE IS NOT NULL OR PI_I_DO_TIPO_DOC <> 0 OR PI_V_DO_NRO_DOC IS NOT NULL OR
           PI_I_DO_TIP_EMPRESA <> 0 OR PI_N_DO_ID_SECT_ECONO <> 0 OR PI_C_DO_FLG_ASOCU <> '0') THEN
            C_FLG_DENUNCIADO := '1';
            IF C_FLG_ADMINISTRADO = '0' THEN
                C_FLG_ADMINISTRADO := '1';
            END IF;
        END IF;
    
        IF (PI_V_D_CODSANCIONA_INI IS NOT NULL OR PI_V_D_CODSANCIONA_FIN IS NOT NULL OR PI_I_D_TIP_PERSONA <> 0 OR PI_V_D_RAZON_SOCIAL IS NOT NULL OR
           PI_V_D_APE_PATERNO IS NOT NULL OR PI_V_D_APE_MATERNO IS NOT NULL OR PI_V_D_APE_CASADA IS NOT NULL OR PI_V_D_PRI_NOMBRE IS NOT NULL OR
           PI_V_D_SEG_NOMBRE IS NOT NULL OR PI_I_D_TIPO_DOC <> 0 OR PI_V_D_NRO_DOC IS NOT NULL OR PI_I_D_TIP_EMPRESA <> 0 OR
           PI_N_D_ID_SECT_ECONO <> 0 OR PI_C_D_FLG_ASOCU <> '0' OR PI_C_D_FL_OFICIO <> '0') THEN
            C_FLG_DENUNCIANTE := '1';
            IF C_FLG_ADMINISTRADO = '0' THEN
                C_FLG_ADMINISTRADO := '1';
            END IF;
        END IF;
    
        --obtener los datos de las intancias de una multa
        EXECUTE IMMEDIATE 'TRUNCATE TABLE USR_SICOB.T_SCOB_TMP_INSTANCIAS_MULTA2';
        V_SQL_TMP_QUERY_1 := 'INSERT INTO T_SCOB_TMP_INSTANCIAS_MULTA2 ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || '(ID_MULTA, NRO_NIVEL, NRO_RESOLUCION, FEC_RESOLUCION, FEC_NOTIFICACION_RESOLUCION, FEC_ESTADO_SGTE_INSTANCIA, FEC_REGISTRO, ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'LOGIN_USUARIO_REGISTRO, nro_resolucion_declaracion, fec_cons_firme, fec_notf_cons_firme, NU_CANTIDAD_DIAS) ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || '(SELECT MDET.ID_MULTA, ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'ORGR.TIPO_INSTANCIA AS NRO_NIVEL, ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'MDET.NRO_RESOLUCION AS NRO_RESOLUCION, ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'MDET.FEC_RESOLUCION, ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'MDET.FEC_NOTIFICACION_RESOLUCION, ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'MDET.FEC_ESTADO_SGTE_INSTANCIA, ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'TRUNC(MDET.AUDFECCREACION) AS FEC_REGISTRO, ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'MDET.AUDUSUCREACION, ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'MDET.NRO_RESOLUCION_DECLARACION, ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'MDET.FEC_DECLARACION AS FEC_CONS_FIRME, ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'MDET.FEC_NOTIFICACION_DECLARACION AS FEC_NOTF_CONS_FIRME, ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'MDET.NU_CANTIDAD_DIAS ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'FROM T_SCOB_MULTA_DETAL MDET ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'INNER JOIN T_SCOB_ORGANO_RESOLUTIVO ORGR ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'ON ORGR.ID_ORGANO_RESOLUTIVO = MDET.ID_ORGANO_RESOLUTIVO ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'INNER JOIN USR_SICOB.T_SCOB_MULTA MULT ON (MULT.ID_MULTA = MDET.ID_MULTA) ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'WHERE MDET.ESTADO = ''1'' ';
        
        IF PI_V_CUM_INI IS NOT NULL AND PI_V_CUM_FIN IS NOT NULL THEN
            V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'AND MULT.ANIO||MULT.CUM BETWEEN ''' || PI_V_CUM_INI || ''' AND ''' || PI_V_CUM_FIN || ''' ';
        END IF;
        
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || ') ';
        
        EXECUTE IMMEDIATE V_SQL_TMP_QUERY_1;

        EXECUTE IMMEDIATE 'TRUNCATE TABLE T_SCOB_TMP_SANCIONADOS';
        V_SQL_TMP_QUERY_1 := 'INSERT INTO T_SCOB_TMP_SANCIONADOS ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'SELECT X.ID_MULTA, ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'RTRIM(LISTAGG(TRIM(X.NOM_SANCIONADO), ''/ '') WITHIN GROUP(ORDER BY X.ID_MULTA_SANCIONADO) OVER(PARTITION BY X.ID_MULTA), ''/ '') AS NOM_SANCIONADO, ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'RTRIM(LISTAGG(TRIM(X.TIPO_DOC_IDENTIDAD) || ''/ '') WITHIN GROUP(ORDER BY X.ID_MULTA_SANCIONADO) OVER(PARTITION BY X.ID_MULTA), ''/ '') AS TIPO_DOC_IDENTIDAD, ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'RTRIM(LISTAGG(TRIM(X.NRO_DOC_IDENTIDAD) || ''/ '')  WITHIN GROUP(ORDER BY X.ID_MULTA_SANCIONADO) OVER(PARTITION BY X.ID_MULTA), ''/ '') AS NRO_DOC_IDENTIDAD, ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'RTRIM(LISTAGG(TRIM(X.COD_INDECOPI) || ''/ '')  WITHIN GROUP(ORDER BY X.ID_MULTA_SANCIONADO) OVER(PARTITION BY X.ID_MULTA), ''/ '') AS COD_INDECOPI, ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'RTRIM(LISTAGG(TRIM(X.CALIFICACION) || ''/ '')  WITHIN GROUP(ORDER BY X.ID_MULTA_SANCIONADO) OVER(PARTITION BY X.ID_MULTA), ''/ '') AS CLASIF_SANCIONADO, ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'RTRIM(LISTAGG(TRIM(X.NOM_SECTOR_ECONOMICO) || ''/ '')  WITHIN GROUP(ORDER BY X.ID_MULTA_SANCIONADO) OVER(PARTITION BY X.ID_MULTA), ''/ '')  AS CIIU_SANCIONADO, ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'X.REGION_SANCIONADO ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'FROM (SELECT DISTINCT MDET.ID_MULTA, ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'MSAN.ID_MULTA_SANCIONADO, ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'DECODE(PERS.TIPO_PERSONA, 2, PERS.RAZON_SOCIAL, PERS.APE_PATERNO || '' '' || PERS.APE_MATERNO || '' '' || PERS.PRI_NOMBRE || '' '' || PERS.SEG_NOMBRE || '' '' || PERS.APE_CASADA) AS NOM_SANCIONADO, '; 
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'TD.TXT_DESCRIPCION AS TIPO_DOC_IDENTIDAD, ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'PERS.NRO_DOC AS NRO_DOC_IDENTIDAD, ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'PERS.COD_SANCIONADO AS COD_INDECOPI, ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'TD1.TXT_DESCRIPCION AS CALIFICACION, ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'NVL(SEEC.DESCRIPCION, ''NO REGISTRA'') AS NOM_SECTOR_ECONOMICO, ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'NULL AS REGION_SANCIONADO ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'FROM T_SCOB_MULTA_DETAL MDET ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'INNER JOIN T_SCOB_MULTA_SANCIONADO MSAN ON MSAN.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'AND MSAN.ESTADO = ''1'' ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'AND NVL(MSAN.COD_TIPO_PERSONA, ''1'') = ''1'' ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'INNER JOIN T_SCOB_PERSONA PERS ON PERS.ID_PERSONA = MSAN.ID_PERSONA ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'INNER JOIN T_SCOB_TABLA_DET TD ON TD.ID_TABLA = 10 AND TD.COD_INTERNO = PERS.TIPO_DOC ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'LEFT JOIN T_SCOB_TABLA_DET TD1 ON TD1.ID_TABLA = 13 AND TD1.COD_INTERNO = PERS.TIPO_DOC ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'LEFT JOIN T_SCOB_SECTOR_ECONOMICO SEEC ON SEEC.ID_SECTOR_ECONOMICO = PERS.ID_SECTOR_ECONOMICO ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'INNER JOIN USR_SICOB.T_SCOB_MULTA MULT ON (MULT.ID_MULTA = MDET.ID_MULTA) ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'WHERE MDET.FLG_ACTUAL = ''1'' ';
        
        IF PI_V_CUM_INI IS NOT NULL AND PI_V_CUM_FIN IS NOT NULL THEN
            V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'AND MULT.ANIO||MULT.CUM BETWEEN ''' || PI_V_CUM_INI || ''' AND ''' || PI_V_CUM_FIN || ''' ';
        END IF;
                
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'ORDER BY MSAN.ID_MULTA_SANCIONADO) X ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'GROUP BY X.ID_MULTA, X.ID_MULTA_SANCIONADO, X.NOM_SANCIONADO, X.TIPO_DOC_IDENTIDAD, X.NRO_DOC_IDENTIDAD, X.COD_INDECOPI, X.CALIFICACION, X.NOM_SECTOR_ECONOMICO, X.REGION_SANCIONADO';
        
        EXECUTE IMMEDIATE V_SQL_TMP_QUERY_1;
        
        EXECUTE IMMEDIATE 'TRUNCATE TABLE T_SCOB_TMP_DENUNCIANTE';
        V_SQL_TMP_QUERY_1 := 'INSERT INTO T_SCOB_TMP_DENUNCIANTE ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'SELECT X.ID_MULTA, ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'RTRIM(LISTAGG(TRIM(NOM_DENUNCIANTE) || ''/ '') WITHIN GROUP(ORDER BY X.ID_MULTA_DENUNCIANTE) OVER(PARTITION BY X.ID_MULTA), ''/ '') AS NOM_DENUNCIANTE, ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'RTRIM(LISTAGG(TRIM(NRO_DOC) || ''/ '') WITHIN GROUP(ORDER BY X.ID_MULTA_DENUNCIANTE) OVER(PARTITION BY X.ID_MULTA), ''/ '') AS NRO_DOC_DENUNCIANTE ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'FROM (SELECT DISTINCT MDET.ID_MULTA, ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'MDEN.ID_MULTA_DENUNCIANTE, ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'DECODE(PERS.TIPO_PERSONA, 2, PERS.RAZON_SOCIAL, PERS.APE_PATERNO || '' '' || PERS.APE_MATERNO || '' '' || PERS.PRI_NOMBRE || '' '' || PERS.SEG_NOMBRE || '' '' || PERS.APE_CASADA) AS NOM_DENUNCIANTE, ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'PERS.NRO_DOC ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'FROM USR_SICOB.T_SCOB_MULTA_DETAL MDET ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'INNER JOIN USR_SICOB.T_SCOB_MULTA_DENUNCIANTE MDEN ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'ON (MDEN.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'AND MDEN.ESTADO = ''1'') ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'INNER JOIN USR_SICOB.T_SCOB_PERSONA PERS ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'ON (PERS.ID_PERSONA = MDEN.ID_PERSONA) ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'INNER JOIN USR_SICOB.T_SCOB_MULTA MULT ON (MULT.ID_MULTA = MDET.ID_MULTA) ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'WHERE MDET.FLG_ACTUAL = ''1'' ';
        
        IF PI_V_CUM_INI IS NOT NULL AND PI_V_CUM_FIN IS NOT NULL THEN
            V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'AND MULT.ANIO||MULT.CUM BETWEEN ''' || PI_V_CUM_INI || ''' AND ''' || PI_V_CUM_FIN || ''' ';
        END IF;
        
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'ORDER BY MDEN.ID_MULTA_DENUNCIANTE) X ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'GROUP BY X.ID_MULTA, X.ID_MULTA_DENUNCIANTE, X.NOM_DENUNCIANTE, X.NRO_DOC';
    
        EXECUTE IMMEDIATE V_SQL_TMP_QUERY_1;
        
        EXECUTE IMMEDIATE 'TRUNCATE TABLE T_SCOB_TMP_DENUNCIADO';
        V_SQL_TMP_QUERY_1 := 'INSERT INTO T_SCOB_TMP_DENUNCIADO ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'SELECT X.ID_MULTA, ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'RTRIM(LISTAGG(TRIM(X.NOM_DENUNCIADO), ''/ '') WITHIN GROUP(ORDER BY X.ID_MULTA_SANCIONADO) OVER(PARTITION BY X.ID_MULTA), ''/ '') AS NOM_DENUNCIADO ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'FROM (SELECT DISTINCT MDET.ID_MULTA, ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'MSAN.ID_MULTA_SANCIONADO, ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'DECODE(PERS.TIPO_PERSONA, 2,  PERS.RAZON_SOCIAL, PERS.APE_PATERNO || '' '' || PERS.APE_MATERNO || '' '' || PERS.PRI_NOMBRE || '' '' || PERS.SEG_NOMBRE || '' '' || PERS.APE_CASADA) AS NOM_DENUNCIADO ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'FROM T_SCOB_MULTA_DETAL MDET ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'INNER JOIN T_SCOB_MULTA_SANCIONADO MSAN ON (MSAN.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'AND MSAN.ESTADO = ''1'' ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'AND NVL(MSAN.COD_TIPO_PERSONA, ''1'') = ''2'') ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'INNER JOIN T_SCOB_PERSONA PERS ON PERS.ID_PERSONA = MSAN.ID_PERSONA ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'INNER JOIN USR_SICOB.T_SCOB_MULTA MULT ON (MULT.ID_MULTA = MDET.ID_MULTA) ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'WHERE MDET.FLG_ACTUAL = ''1'' ';
       
        IF PI_V_CUM_INI IS NOT NULL AND PI_V_CUM_FIN IS NOT NULL THEN
            V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'AND MULT.ANIO||MULT.CUM BETWEEN ''' || PI_V_CUM_INI || ''' AND ''' || PI_V_CUM_FIN || ''' ';
        END IF;
        
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'ORDER BY MSAN.ID_MULTA_SANCIONADO) X ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'GROUP BY X.ID_MULTA, X.ID_MULTA_SANCIONADO, X.NOM_DENUNCIADO';
        
        EXECUTE IMMEDIATE V_SQL_TMP_QUERY_1;
        
        --obtener la situacion de pago de las multas
        EXECUTE IMMEDIATE 'TRUNCATE TABLE T_SCOB_TMP_SITUACION_MULTA';
        V_SQL_TMP_QUERY_1 := 'INSERT INTO T_SCOB_TMP_SITUACION_MULTA (ID_MULTA, COD_SITUACION_MULTA) ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'SELECT MULT.ID_MULTA, ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || '(CASE WHEN EXPE.ESTADO_EXPEDIENTE = 4 THEN 3 '; --'FR'
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'WHEN EXPE.ESTADO_EXPEDIENTE = 5 THEN 4 '; --'PP'
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'WHEN MULT.NRO_FILE_AEC IS NULL THEN 1 ';--PAGO VOLUNTARIO
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'ELSE 2 '; --PAGO COACTIVO
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'END) AS COD_SITUACION_MULTA ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'FROM T_SCOB_MULTA MULT ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'LEFT JOIN T_SCOB_EXPEDIENTE_MULTA EXMU ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'ON EXMU.ID_MULTA = MULT.ID_MULTA ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'AND EXMU.ESTADO = ''1'' ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'LEFT JOIN T_SCOB_EXPEDIENTE EXPE ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'ON EXPE.ID_EXPEDIENTE = EXMU.ID_EXPEDIENTE ';
        V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'WHERE MULT.ESTADO = ''1'' ';
        
        IF PI_V_CUM_INI IS NOT NULL AND PI_V_CUM_FIN IS NOT NULL THEN
            V_SQL_TMP_QUERY_1 := V_SQL_TMP_QUERY_1 || 'AND MULT.ANIO||MULT.CUM BETWEEN ''' || PI_V_CUM_INI || ''' AND ''' || PI_V_CUM_FIN || ''' ';
        END IF;
        
        EXECUTE IMMEDIATE V_SQL_TMP_QUERY_1;
    
        -----------------------------------------------------------------------------------
        --obtener los administrados
        -----------------------------------------------------------------------------------
        --3=DENUNCIANTE
        -----------------------------------------------------------------------------------
        /*
        Dbms_Output.put_line('c_flg_administrado--->' || c_flg_administrado);
        Dbms_Output.put_line('c_flg_denunciante--->' || c_flg_denunciante);
        Dbms_Output.put_line('c_flg_sancionado--->' || c_flg_sancionado);
        Dbms_Output.put_line('c_flg_denunciado--->' || c_flg_denunciado);
        */
    
        EXECUTE IMMEDIATE 'TRUNCATE TABLE T_SCOB_TMP_ADMINISTRADO';
        --obtener a todos los administrados
        IF C_FLG_ADMINISTRADO = '1' THEN
            V_SQL_ADMIN_SELECT := 'INSERT INTO T_SCOB_TMP_ADMINISTRADO(ID_MULTA, TIPO_ADMINISTRADO, ID_PERSONA) ';
            V_SQL_ADMIN_SELECT := V_SQL_ADMIN_SELECT || 'SELECT ADMINISTRADO.ID_MULTA,ADMINISTRADO.TIPO_ADMINISTRADO,PERS.ID_PERSONA ';
            V_SQL_ADMIN_SELECT := V_SQL_ADMIN_SELECT || 'FROM ';
            V_SQL_ADMIN_SELECT := V_SQL_ADMIN_SELECT || '(SELECT MDET.ID_MULTA AS ID_MULTA, ';
            V_SQL_ADMIN_SELECT := V_SQL_ADMIN_SELECT || '''3'' AS TIPO_ADMINISTRADO, '; --DENUNCIANTE
            V_SQL_ADMIN_SELECT := V_SQL_ADMIN_SELECT || 'MDEN.ID_PERSONA  AS ID_PERSONA ';
            V_SQL_ADMIN_SELECT := V_SQL_ADMIN_SELECT || 'FROM T_SCOB_MULTA_DETAL MDET ';
            V_SQL_ADMIN_SELECT := V_SQL_ADMIN_SELECT || 'INNER JOIN T_SCOB_MULTA_DENUNCIANTE MDEN ON MDEN.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL AND MDEN.ESTADO = ''1'' ';
            V_SQL_ADMIN_SELECT := V_SQL_ADMIN_SELECT || 'WHERE MDET.FLG_ACTUAL = ''1'' AND MDET.ESTADO = ''1'' ';
            V_SQL_ADMIN_SELECT := V_SQL_ADMIN_SELECT || 'UNION ALL ';
            V_SQL_ADMIN_SELECT := V_SQL_ADMIN_SELECT || 'SELECT MDET.ID_MULTA AS ID_MULTA, ';
            V_SQL_ADMIN_SELECT := V_SQL_ADMIN_SELECT || 'MSAN.COD_TIPO_PERSONA AS TIPO_ADMINISTRADO, '; --SANCIONADO Y DENUNCIADO
            V_SQL_ADMIN_SELECT := V_SQL_ADMIN_SELECT || 'MSAN.ID_PERSONA AS ID_PERSONA ';
            V_SQL_ADMIN_SELECT := V_SQL_ADMIN_SELECT || 'FROM T_SCOB_MULTA_DETAL MDET ';
            V_SQL_ADMIN_SELECT := V_SQL_ADMIN_SELECT || 'INNER JOIN T_SCOB_MULTA_SANCIONADO MSAN ON MSAN.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL AND MSAN.ESTADO = ''1'' ';
            V_SQL_ADMIN_SELECT := V_SQL_ADMIN_SELECT || 'WHERE MDET.FLG_ACTUAL = ''1'' AND MDET.ESTADO = ''1'' ';
            V_SQL_ADMIN_SELECT := V_SQL_ADMIN_SELECT || ')ADMINISTRADO ';
            V_SQL_ADMIN_SELECT := V_SQL_ADMIN_SELECT || 'INNER JOIN T_SCOB_PERSONA PERS ON PERS.ID_PERSONA = ADMINISTRADO.ID_PERSONA ';
        
            V_SQL_ADMIN_WHERE_D := 'WHERE ADMINISTRADO.ID_MULTA IS NOT NULL ';
        
            IF C_FLG_DENUNCIANTE = '1' THEN
              V_SQL_ADMIN_WHERE_D := V_SQL_ADMIN_WHERE_D || 'AND (ADMINISTRADO.TIPO_ADMINISTRADO = ''3'' '; --denunciante
            
                --CODIGO INDECOPI
                IF PI_V_D_CODSANCIONA_INI IS NOT NULL THEN
                    V_SQL_ADMIN_WHERE_D := V_SQL_ADMIN_WHERE_D || 'AND TO_NUMBER(PERS.COD_SANCIONADO) BETWEEN TO_NUMBER(' || PI_V_D_CODSANCIONA_INI || ') AND TO_NUMBER(' || PI_V_D_CODSANCIONA_FIN || ') ';
                END IF;
            
                --TIPO PERSONERIA
                IF PI_I_D_TIP_PERSONA <> 0 THEN
                    V_SQL_ADMIN_WHERE_D := V_SQL_ADMIN_WHERE_D || 'AND PERS.TIPO_PERSONA=' || PI_I_D_TIP_PERSONA || ' ';
                END IF;
            
                --TIPO DOCUMENTO
                IF PI_I_D_TIPO_DOC <> 0 THEN
                    V_SQL_ADMIN_WHERE_D := V_SQL_ADMIN_WHERE_D || 'AND PERS.TIPO_DOC=' || PI_I_D_TIPO_DOC || ' ';
                END IF;
            
                --NRO DOCUMENTO
                IF PI_V_D_NRO_DOC IS NOT NULL THEN
                    V_SQL_ADMIN_WHERE_D := V_SQL_ADMIN_WHERE_D || 'AND PERS.NRO_DOC=''' || PI_V_D_NRO_DOC || ''' ';
                END IF;
            
                --APELLIDOS Y NOMBRES
                IF PI_V_D_APE_PATERNO IS NOT NULL THEN
                    V_SQL_ADMIN_WHERE_D := V_SQL_ADMIN_WHERE_D || 'AND PERS.APE_PATERNO LIKE ''' || C_CAR_PORCENTAJE || PI_V_D_APE_PATERNO || '%'' ';
                END IF;
            
                IF PI_V_D_APE_MATERNO IS NOT NULL THEN
                    V_SQL_ADMIN_WHERE_D := V_SQL_ADMIN_WHERE_D || 'AND PERS.APE_MATERNO LIKE ''' || C_CAR_PORCENTAJE || PI_V_D_APE_MATERNO || '%'' ';
                END IF;
            
                IF PI_V_D_APE_CASADA IS NOT NULL THEN
                    V_SQL_ADMIN_WHERE_D := V_SQL_ADMIN_WHERE_D || 'AND PERS.APE_CASADA LIKE ''' || C_CAR_PORCENTAJE || PI_V_D_APE_CASADA || '%'' ';
                END IF;
            
                IF PI_V_D_PRI_NOMBRE IS NOT NULL THEN
                    V_SQL_ADMIN_WHERE_D := V_SQL_ADMIN_WHERE_D || 'AND PERS.PRI_NOMBRE LIKE ''' || C_CAR_PORCENTAJE || PI_V_D_PRI_NOMBRE || '%'' ';
                END IF;
            
                IF PI_V_D_SEG_NOMBRE IS NOT NULL THEN
                    V_SQL_ADMIN_WHERE_D := V_SQL_ADMIN_WHERE_D || 'AND PERS.SEG_NOMBRE LIKE ''' || C_CAR_PORCENTAJE || PI_V_D_SEG_NOMBRE || '%'' ';
                END IF;
            
                --DENOMINACION O RAZON SOCIAL
                IF PI_V_D_RAZON_SOCIAL IS NOT NULL THEN
                    V_SQL_ADMIN_WHERE_D := V_SQL_ADMIN_WHERE_D || 'AND PERS.RAZON_SOCIAL LIKE ''' || C_CAR_PORCENTAJE || PI_V_D_RAZON_SOCIAL || '%'' ';
                END IF;
            
                --TIPO DE EMPRESA
                IF PI_I_D_TIP_EMPRESA <> 0 THEN
                    V_SQL_ADMIN_WHERE_D := V_SQL_ADMIN_WHERE_D || 'AND PERS.TIP_EMPRESA=' || PI_I_D_TIP_EMPRESA || ' ';
                END IF;
            
                --SECTOR ECONOMICO
                IF PI_N_D_ID_SECT_ECONO <> 0 THEN
                    V_SQL_ADMIN_WHERE_D := V_SQL_ADMIN_WHERE_D || 'AND PERS.ID_SECTOR_ECONOMICO=' || PI_N_D_ID_SECT_ECONO || ' ';
                END IF;
            
                --INDICADOR DENUNCIANTE DE OFICIO = INDECOPI
                IF PI_C_D_FL_OFICIO = '1' THEN
                    V_SQL_ADMIN_WHERE_D := V_SQL_ADMIN_WHERE_D || 'AND PERS.ID_PERSONA=' || SCOB_PK_CONSTANTES.C_ID_ADMINISTRADO_INDECOPI || ' ';
                END IF;
            
                V_SQL_ADMIN_WHERE_D := V_SQL_ADMIN_WHERE_D || ')';            
            END IF;
        
            IF C_FLG_DENUNCIADO = '1' THEN
                IF C_FLG_DENUNCIANTE = '1' THEN
                    V_SQL_ADMIN_WHERE_DO := 'OR(ADMINISTRADO.TIPO_ADMINISTRADO = ''2'' '; --denunciado'
                ELSE
                    V_SQL_ADMIN_WHERE_DO := 'AND(ADMINISTRADO.TIPO_ADMINISTRADO = ''2'' ';--denunciado'
                END IF;
            
                --CODIGO INDECOPI
                IF PI_V_D_CODSANCIONA_INI IS NOT NULL THEN
                    V_SQL_ADMIN_WHERE_DO := V_SQL_ADMIN_WHERE_DO || 'AND TO_NUMBER(PERS.COD_SANCIONADO) BETWEEN TO_NUMBER(' || PI_V_DO_CODSANCIONA_INI ||') AND TO_NUMBER(' || PI_V_DO_CODSANCIONA_FIN || ') ';
                END IF;
            
                --TIPO PERSONERIA
                IF PI_I_DO_TIP_PERSONA <> 0 THEN
                    V_SQL_ADMIN_WHERE_DO := V_SQL_ADMIN_WHERE_DO || 'AND PERS.TIPO_PERSONA=' || PI_I_DO_TIP_PERSONA || ' ';
                END IF;
            
                --TIPO DOCUMENTO
                IF PI_I_DO_TIPO_DOC <> 0 THEN
                    V_SQL_ADMIN_WHERE_DO := V_SQL_ADMIN_WHERE_DO || 'AND PERS.TIPO_DOC=' || PI_I_DO_TIPO_DOC || ' ';
                END IF;
            
                --NRO DOCUMENTO
                IF PI_V_DO_NRO_DOC IS NOT NULL THEN
                    V_SQL_ADMIN_WHERE_DO := V_SQL_ADMIN_WHERE_DO || '
             AND PERS.NRO_DOC=''' || PI_V_DO_NRO_DOC || '''';
                END IF;
            
                --APELLIDOS Y NOMBRES
                IF PI_V_DO_APE_PATERNO IS NOT NULL THEN
                    V_SQL_ADMIN_WHERE_DO := V_SQL_ADMIN_WHERE_DO || '
             AND PERS.APE_PATERNO LIKE ''' || C_CAR_PORCENTAJE || PI_V_DO_APE_PATERNO || '%''';
                END IF;
            
                IF PI_V_DO_APE_MATERNO IS NOT NULL THEN
                    V_SQL_ADMIN_WHERE_DO := V_SQL_ADMIN_WHERE_DO || '
             AND PERS.APE_MATERNO LIKE ''' || C_CAR_PORCENTAJE || PI_V_DO_APE_MATERNO || '%''';
                END IF;
            
                IF PI_V_DO_APE_CASADA IS NOT NULL THEN
                    V_SQL_ADMIN_WHERE_DO := V_SQL_ADMIN_WHERE_DO || '
             AND PERS.APE_CASADA LIKE ''' || C_CAR_PORCENTAJE || PI_V_DO_APE_CASADA || '%''';
                END IF;
            
                IF PI_V_DO_PRI_NOMBRE IS NOT NULL THEN
                    V_SQL_ADMIN_WHERE_DO := V_SQL_ADMIN_WHERE_DO || '
             AND PERS.PRI_NOMBRE LIKE ''' || C_CAR_PORCENTAJE || PI_V_DO_PRI_NOMBRE || '%''';
                END IF;
            
                IF PI_V_DO_SEG_NOMBRE IS NOT NULL THEN
                    V_SQL_ADMIN_WHERE_DO := V_SQL_ADMIN_WHERE_DO || '
             AND PERS.SEG_NOMBRE LIKE ''' || C_CAR_PORCENTAJE || PI_V_DO_SEG_NOMBRE || '%''';
                END IF;
            
                --DENOMINACION O RAZON SOCIAL
                IF PI_V_DO_RAZON_SOCIAL IS NOT NULL THEN
                    V_SQL_ADMIN_WHERE_DO := V_SQL_ADMIN_WHERE_DO || '
             AND PERS.RAZON_SOCIAL LIKE ''' || C_CAR_PORCENTAJE || PI_V_DO_RAZON_SOCIAL || '%''';
                END IF;
            
                --TIPO DE EMPRESA
                IF PI_I_DO_TIP_EMPRESA <> 0 THEN
                    V_SQL_ADMIN_WHERE_DO := V_SQL_ADMIN_WHERE_DO || '
             AND PERS.TIP_EMPRESA=' || PI_I_DO_TIP_EMPRESA;
                END IF;
            
                --SECTOR ECONOMICO
                IF PI_N_DO_ID_SECT_ECONO <> 0 THEN
                    V_SQL_ADMIN_WHERE_DO := V_SQL_ADMIN_WHERE_DO || '
             AND PERS.ID_SECTOR_ECONOMICO=' || PI_N_DO_ID_SECT_ECONO;
                END IF;
            
                IF PI_C_DO_FLG_ASOCU = '1' THEN
                    V_SQL_ADMIN_WHERE_DO := V_SQL_ADMIN_WHERE_DO || '
             AND PERS.FLG_ASOCU=''' || PI_C_DO_FLG_ASOCU || '''';
                END IF;
            
                V_SQL_ADMIN_WHERE_DO := V_SQL_ADMIN_WHERE_DO || '
          )';
            END IF;
        
            IF C_FLG_SANCIONADO = '1' THEN
                IF C_FLG_DENUNCIADO = '1' OR
                   C_FLG_DENUNCIANTE = '1' THEN
                    V_SQL_ADMIN_WHERE_S := '
              OR(ADMINISTRADO.TIPO_ADMINISTRADO = ''1'' --sancionado';
                ELSE
                    V_SQL_ADMIN_WHERE_S := '
              AND(ADMINISTRADO.TIPO_ADMINISTRADO = ''1'' --sancionado';
                END IF;
            
                --CODIGO INDECOPI
                IF PI_V_S_CODSANCIONA_INI IS NOT NULL THEN
                    V_SQL_ADMIN_WHERE_S := V_SQL_ADMIN_WHERE_S || '
             AND TO_NUMBER(PERS.COD_SANCIONADO) BETWEEN TO_NUMBER(' || PI_V_S_CODSANCIONA_INI ||
                                           ') AND TO_NUMBER(' || PI_V_S_CODSANCIONA_FIN || ')';
                END IF;
            
                --TIPO PERSONERIA
                IF PI_I_S_TIP_PERSONA <> 0 THEN
                    V_SQL_ADMIN_WHERE_S := V_SQL_ADMIN_WHERE_S || '
             AND PERS.TIPO_PERSONA=' || PI_I_S_TIP_PERSONA;
                END IF;
            
                --TIPO DOCUMENTO
                IF PI_I_S_TIPO_DOC <> 0 THEN
                    V_SQL_ADMIN_WHERE_S := V_SQL_ADMIN_WHERE_S || '
             AND PERS.TIPO_DOC=' || PI_I_S_TIPO_DOC;
                END IF;
            
                --NRO DOCUMENTO
                IF PI_V_S_NRO_DOC IS NOT NULL THEN
                    V_SQL_ADMIN_WHERE_S := V_SQL_ADMIN_WHERE_S || '
             AND PERS.NRO_DOC=''' || PI_V_S_NRO_DOC || '''';
                END IF;
            
                --APELLIDOS Y NOMBRES
                IF PI_V_S_APE_PATERNO IS NOT NULL THEN
                    V_SQL_ADMIN_WHERE_S := V_SQL_ADMIN_WHERE_S || '
             AND PERS.APE_PATERNO LIKE ''' || C_CAR_PORCENTAJE || PI_V_S_APE_PATERNO || '%''';
                END IF;
            
                IF PI_V_S_APE_MATERNO IS NOT NULL THEN
                    V_SQL_ADMIN_WHERE_S := V_SQL_ADMIN_WHERE_S || '
             AND PERS.APE_MATERNO LIKE ''' || C_CAR_PORCENTAJE || PI_V_S_APE_MATERNO || '%''';
                END IF;
            
                IF PI_V_S_APE_CASADA IS NOT NULL THEN
                    V_SQL_ADMIN_WHERE_S := V_SQL_ADMIN_WHERE_S || '
             AND PERS.APE_CASADA LIKE ''' || C_CAR_PORCENTAJE || PI_V_S_APE_CASADA || '%''';
                END IF;
            
                IF PI_V_S_PRI_NOMBRE IS NOT NULL THEN
                    V_SQL_ADMIN_WHERE_S := V_SQL_ADMIN_WHERE_S || '
             AND PERS.PRI_NOMBRE LIKE ''' || C_CAR_PORCENTAJE || PI_V_S_PRI_NOMBRE || '%''';
                END IF;
            
                IF PI_V_S_SEG_NOMBRE IS NOT NULL THEN
                    V_SQL_ADMIN_WHERE_S := V_SQL_ADMIN_WHERE_S || '
             AND PERS.SEG_NOMBRE LIKE ''' || C_CAR_PORCENTAJE || PI_V_S_SEG_NOMBRE || '%''';
                END IF;
            
                --DENOMINACION O RAZON SOCIAL
                IF PI_V_S_RAZON_SOCIAL IS NOT NULL THEN
                    V_SQL_ADMIN_WHERE_S := V_SQL_ADMIN_WHERE_S || '
             AND PERS.RAZON_SOCIAL LIKE ''' || C_CAR_PORCENTAJE || PI_V_S_RAZON_SOCIAL || '%''';
                END IF;
            
                --TIPO DE EMPRESA
                IF PI_I_S_TIP_EMPRESA <> 0 THEN
                    V_SQL_ADMIN_WHERE_S := V_SQL_ADMIN_WHERE_S || '
             AND PERS.TIP_EMPRESA=' || PI_I_S_TIP_EMPRESA;
                END IF;
            
                --SECTOR ECONOMICO
                IF PI_N_S_ID_SECT_ECONO <> 0 THEN
                    V_SQL_ADMIN_WHERE_S := V_SQL_ADMIN_WHERE_S || '
             AND PERS.ID_SECTOR_ECONOMICO=' || PI_N_S_ID_SECT_ECONO;
                END IF;
            
                IF PI_C_S_FLG_ASOCU = '1' THEN
                    V_SQL_ADMIN_WHERE_S := V_SQL_ADMIN_WHERE_S || '
             AND PERS.FLG_ASOCU=''' || PI_C_S_FLG_ASOCU || '''';
                END IF;
            
                V_SQL_ADMIN_WHERE_S := V_SQL_ADMIN_WHERE_S || '
          )';
            END IF;
        /*
            DBMS_OUTPUT.PUT_LINE(V_SQL_ADMIN_SELECT);
            DBMS_OUTPUT.PUT_LINE(V_SQL_ADMIN_WHERE_D);
            DBMS_OUTPUT.PUT_LINE(V_SQL_ADMIN_WHERE_DO);
            DBMS_OUTPUT.PUT_LINE(V_SQL_ADMIN_WHERE_S);
        */
            EXECUTE IMMEDIATE V_SQL_ADMIN_SELECT || V_SQL_ADMIN_WHERE_D || V_SQL_ADMIN_WHERE_DO || V_SQL_ADMIN_WHERE_S;
        
        END IF;
    
        IF C_FLG_ADMINISTRADO = '0' THEN
            INSERT INTO T_SCOB_TMP_ADMINISTRADO (ID_MULTA) VALUES ('0');
        END IF;
    
        --mostrar los datos de la consulta
        V_SQL_SELECT_1 := 'SELECT ROWNUM AS NRO_REG, '; 
        V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'MULT.ID_MULTA AS ID_MULTA, ';
        V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'MULT.ANIO || MULT.CUM AS CUM, ';
        V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'MULT.FEC_INGRESO AS FEC_GENERACION_CUM, ';
        V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'TIPO_PROC.DESCRIPCION AS NOM_TIPO_PROCEDEMIENTO, ';
        V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'ORGR.CODIGO AS COD_ORGANO_RESOLUTIVO, ';
        V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'ORGR.DESCRIPCION AS NOM_ORGANO_RESOLUTIVO, ';
        V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'SEDE.CODIGO AS COD_SEDE, ';
        V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'SEDE.DESCRIPCION AS NOM_SEDE, ';
        V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'MATE.DESCRIPCION AS NOM_MATERIA, ';
        V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'SUBM.DESCRIPCION AS NOM_SUB_MATERIA, ';
        V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'MULT.NRO_EXP_ADMINISTRATIVO AS NRO_EXPEDIENTE_UNICO, ';
        V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'MDET.NRO_EXP_NIVEL AS NRO_EXPEDIENTE_ADMINISTRATIVO, ';
       --PRIMERA INSTANCIA
        V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'NIVEL1.NRO_RESOLUCION AS NRO_RESOL_OR, ';
        V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'NIVEL1.FEC_REGISTRO AS FEC_REG_OR, ';
        V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'NIVEL1.FEC_RESOLUCION AS FEC_EMI_RESOL_OR, ';
        V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'NIVEL1.FEC_NOTIFICACION_RESOLUCION AS FEC_NOTIF_RESOL_OR, ';
        V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'NIVEL1.FEC_ESTADO_SGTE_INSTANCIA AS FEC_APELACION, ';
        V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'NIVEL1.LOGIN_USUARIO_REGISTRO AS USU_REG_OR, ';
        V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'NIVEL1.NU_CANTIDAD_DIAS AS CANTIDAD_OR, ';
       
       --SEGUNDA INSTANCIA
        V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'NIVEL2.NRO_RESOLUCION AS NRO_RESOL_COMISION, ';
        V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'NIVEL2.FEC_REGISTRO AS FEC_REG_COMISION, ';
        V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'NIVEL2.FEC_RESOLUCION AS FEC_RESOL_COMISION, ';
        V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'NIVEL2.FEC_NOTIFICACION_RESOLUCION AS FEC_NOTIF_RESOL_COMISION, ';
        V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'NIVEL2.FEC_ESTADO_SGTE_INSTANCIA AS FEC_REVISION, ';
        V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'NIVEL2.LOGIN_USUARIO_REGISTRO AS USU_REG_COMISION, ';
        V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'NIVEL2.NU_CANTIDAD_DIAS AS CANTIDAD_COMISION, ';
        
       --TERCERA INSTANCIA
        V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'NIVEL3.NRO_RESOLUCION AS NRO_RESOL_SALA, ';
        V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'NIVEL3.FEC_REGISTRO AS FEC_REG_SALA, ';
        V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'NIVEL3.FEC_RESOLUCION AS FEC_RESOL_SALA, ';
        V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'NIVEL3.FEC_NOTIFICACION_RESOLUCION AS FEC_NOTIF_RESOL_SALA, ';
        V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'NIVEL3.LOGIN_USUARIO_REGISTRO AS USU_REG_SALA, ';
        V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'NIVEL3.NU_CANTIDAD_DIAS AS CANTIDAD_SALA, ';

       
        V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'TIPO_MULTA.TXT_DESCRIPCION AS NOM_TIPO_MULTA, '; --tipo_multa

        V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'DTE.NOM_DENUNCIANTE, ';
        V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'DDO.NOM_DENUNCIADO, ';
        V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'SANC.NOM_SANCIONADO, ';
        V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'SANC.TIPO_DOC_IDENTIDAD AS NOM_TIPO_DOC_SANCIONADO, ';
        V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'SANC.NRO_DOC_IDENTIDAD AS NRO_TIPO_DOC_SANCIONADO, ';
        V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'SANC.COD_INDECOPI AS COD_INDECOPI_SANCIONADO, ';
        V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'SANC.CLASIF_SANCIONADO, ';
        V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'SANC.CIIU_SANCIONADO, ';
        
        
        V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'DECODE(NVL(MDET.POR_ASOCU, ''0''), ''0'', ''No'', ''Si'') AS IND_ASOCU, ';
        V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'NVL(MDET.POR_ASOCU, 0) AS PORCENTAJE_ASOCU, ';
       
       --CAMPOS ANTIDUMPING
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'MUAN.TIPO_CAMBIO AS TIPO_CAMBIO_DA, ';
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'MUAN.MONTO_ANTIDUMPING AS DERECHO_ANTIDUMPING, ';
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'MUAN.MONTO_INTERES AS MONTO_DA_IC, ';
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'MUAN.MONTO_INTERES_MORATORIO AS MONTO_DA_IM, ';
       --
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'MUAN.NRO_OFICIO_SUNAT_CODIGO || MUAN.NRO_OFICIO_SUNAT_ANIO || MUAN.NRO_OFICIO_SUNAT_PREFIJO || MUAN.NRO_OFICIO_SUNAT_CORRELATIVO AS NRO_OFICIO_SUNAT, ';
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'NRO_LIQUIDACION_CODIGO || NRO_LIQUIDACION_ANIO || NRO_LIQUIDACION_CORRELATIVO AS NRO_LIQUIDACION_COBRANZA, ';
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'PART.CODIGO AS COD_PARTIDA, ';
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'PART.DESCRIPCION AS NOM_PARTIDA, ';
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'NRO_DUA_CODIGO || NRO_DUA_ANIO || NRO_DUA_CORRELATIVO AS NRO_DUA, ';
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'MUAN.ID_INTENDENCIA AS COD_INTENDENCIA, ';
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'INTE.DESCRIPCION AS NOM_INTENDENCIA, ';

       --FIN CAMPOS ANTIDUMPING
       -----------------------------------
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'NVL(MDET.VALOR_UIT, 0) AS VALOR_UIT, ';
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'MULT.MONTO_UIT AS MONTO_UIT, ';
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'MULT.MONTO_INTERES AS MONTO_IC, ';
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'MULT.MONTO_INTERES_MORATORIO AS MONTO_INTERES_IM, ';
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'MULT.MONTO_COSTAS AS MONTO_COSTAS, ';
       --
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'MULT.TOTAL_AMORTIZADO AS TOTAL_AMORTIZADO, ';
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'MULT.TOTAL_AMORTIZADO_IC AS TOTAL_AMORTIZADO_IC, ';
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'MULT.TOTAL_AMORTIZADO_IM AS TOTAL_AMORTIZADO_IM, ';
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'MULT.TOTAL_AMORTIZADO_COSTAS AS TOTAL_AMORTIZADO_COSTAS, ';
       --
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'MULT.SALDO AS SALDO, ';--saldo_capital
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'MULT.SALDO_IC AS SALDO_IC, ';
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'MULT.SALDO_IM AS SALDO_IM, ';
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'MULT.SALDO_COSTAS AS SALDO_COSTAS, ';
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'EST_MULTA_OR.TXT_DESCRIPCION AS NOM_ESTADO_MULTA_OR, '; --est_multa_resolu
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'EST_DEUDA.TXT_DESCRIPCION AS NOM_ESTADO_PAGO, '; --est_pago_multa
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'DECODE(MULT.COD_ESTADO_PAGO, ''4'', MULT.PORCENTAJE_DESCUENTO, NULL) AS POR_DSCTO_PAGO, '; --porcen_dscto_pago
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'MULT.FEC_GENERACION_SEC AS FEC_GENERACION_SEC, '; --fec_gene_sec
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'MULT.ANIO_FILE_AEC AS ANIO_FILE_AEC, '; --anio_file
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'MULT.FEC_INGRESO_AEC AS FEC_RECEPCION_FILE, ';
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'ARCO.CODIGO || MULT.NRO_FILE_AEC AS NRO_FILE_AEC, '; --nro_file
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'MCOB.NRO_INGRESO AS NRO_INGRESO_AEC, ';
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'EST_MULTA_COB.TXT_DESCRIPCION AS NOM_ESTADO_MULTA_COB, ';
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'DECODE(MOTIVO_MULT.ID_MOTIVO, 0, NULL, MOTIVO_MULT.DESCRIPCION) AS NOM_MOTIVO_MULTA, '; --moti_multacobra
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'MULT.FEC_ULT_IMPROCEDENCIA AS FEC_ULT_OBSERVACION_AEC, ';
       
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'MULT.FEC_INGRESO_FILE AS FEC_ULT_INGRESO_AEC, ';
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'EXPE.ANIO || EXPE.NRO_EXPEDIENTE AS NRO_EXPED_COB, '; --nro_expe_cobranza
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'EXPE.FEC_INGRESO AS FEC_GENERACION_EXPED_COB, '; --fec_gen_exp_cobran
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'USUA.USUARIO AS USU_GESTOR_COBRANZA, '; --gestor_cobranza
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'MULT.FECHA_ASIG_COBRANZA AS FEC_ASIG_GESTOR_COBRANZA, ';
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'MULT.FEC_ULT_GEN_PRECOACTIVA AS FEC_ULT_GEN_PRECOACTIVA, ';
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'MULT.FEC_EMISION_REC AS FEC_EMISION_REC, '; --fec_emision_REC
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'MULT.FEC_NOTIF_REC AS FEC_NOTIF_REC, '; --fec_notifi_REC
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'DECODE(NVL(EXPE.FLG_EMBARGO, ''0''), ''0'', ''No'', ''Si'') AS IND_EMBARGO, ';
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'EST_EXP.DESCRIPCION AS NOM_ESTADO_EXPED_COB, ';--est_exp_cobranza
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'MOTIVO_EXPE.DESCRIPCION AS NOM_MOTIVO_EXPED_COB, ';--moti_exp_cobranza
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'EXPE.FEC_ESTADO_EXPEDIENTE AS FEC_ULT_ESTADO_EXPED_COB, '; --fec_est_exp_cobran
       
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'EXPECTATIVA.TXT_DESCRIPCION AS NOM_EXPECTATIVA_COBRO, ';
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'SANC.REGION_SANCIONADO, ';    
       
       
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'DECODE(EXPE.ID_EXPEDIENTE, NULL, MULT.FEC_ENVIO_RIESGO, MULT.FEC_ENVIO_RIESGO_EXP) AS FEC_MARCA_ENVIO_INFOCORP, '; --(FECHA EN QUE "MARCA" PARA ENVIAR A INFOCORP)
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'ARCH_CEN.NRO_ORDEN AS NRO_ENVIO_ARCHIVO, '; --nro_envarch_central
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'ARCH_CEN.FEC_ENVIO AS FEC_ENVIO_ARCHIVO, '; --fec_envarch_central
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || '(CASE WHEN MULT.ESTADO_ENVIO_ARCHIVO = 2 THEN ''ARCHIVO CENTRAL'' WHEN MULT.ESTADO_MULTA IN (9, 10, 11, 12, 13) THEN ''AEC'' ELSE '' '' END) AS UBI_FISICA_EXPEDIENTE, ';
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'SIT_MULTA.COD_SITUACION_MULTA AS COD_SITUACION_MULTA, ';
       
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'TIPO_PROC.CODIGO AS VC_COD_TIPOPROC, ';
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'MATE.CODIGO AS VC_COD_MATERIA, ';
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'SUBM.CODIGO AS VC_COD_SUBMATERIA, ';
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'EST_MULTA_OR.COD_INTERNO AS VC_COD_EST_MULTA, ';
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'EST_DEUDA.COD_INTERNO AS VC_COD_EST_PAGO, ';
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'EST_MULTA_COB.COD_INTERNO AS VC_COD_EST_MULTA_COB, ';
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'EST_EXP.CODIGO AS VC_CODIGO_EST_EXP, ';
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'MOTIVO_EXPE.CODIGO AS VC_COD_MOTIVO_EXPED_COB, ';
       
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'NULL AS VC_CODIGO_CLASIFICACION, ';
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'NULL AS VC_CODIGO_CIIU, ';
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || '(CASE WHEN EXPE.ESTADO_EXPEDIENTE = 4 THEN ''FR'' ELSE ''NF'' END) AS VC_TIPO_MULTA, ';
              
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'RES_GAF_APRUEBA.NRO_RESOLUCION_GAF AS VC_RESO_GAF_APRUEBA, ';
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'RES_GAF_APRUEBA.FEC_RESOLUCION_GAF AS VC_FEC_RESO_gaf_APRUEBA, ';
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'RES_GAF_PERDIDA.NRO_RESOLUCION_GAF vc_reso_gaf_PERDIDA, ';
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'RES_GAF_PERDIDA.FEC_RESOLUCION_GAF AS vc_FEC_reso_gaf_PERDIDA, ';
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'DTE.NRO_DOC_DENUNCIANTE AS VC_NRO_DOC_DENUNCIANTE, ';
       
       
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'DECODE(MULT.COD_MOTIVO, 0, NULL, MULT.COD_MOTIVO) AS VC_COD_MOTIVO_MULTA_COB, ';
       
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'OXM.VC_SIA_CC_COD AS VC_COD_CENTRO_COSTO, ';
       
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'NIVEL1.NRO_RESOLUCION_DECLARACION AS VC_NRO_REC_DECLA_01, ';
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'NIVEL1.FEC_CONS_FIRME AS DT_RES_CONS_FIRME_01, ';
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'NIVEL1.FEC_NOTF_CONS_FIRME AS DT_NOTF_CONS_FIRME_01, ';
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'NIVEL2.NRO_RESOLUCION_DECLARACION AS VC_NRO_REC_DECLA_02, ';
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'NIVEL2.FEC_CONS_FIRME AS DT_RES_CONS_FIRME_02, ';
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'NIVEL2.FEC_NOTF_CONS_FIRME AS DT_NOTF_CONS_FIRME_02, ';
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'NIVEL3.NRO_RESOLUCION_DECLARACION AS VC_NRO_REC_DECLA_03, ';
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'NIVEL3.FEC_CONS_FIRME AS DT_RES_CONS_FIRME_03, ';
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'NIVEL3.FEC_NOTF_CONS_FIRME AS DT_NOTF_CONS_FIRME_03, ';
       V_SQL_SELECT_1 := V_SQL_SELECT_1 || 'MDET.ID_ORGANO_RESOLUTIVO ';
        --JOINS
       V_SQL_JOIN_1 := 'FROM T_SCOB_MULTA MULT ';
       V_SQL_JOIN_1 := V_SQL_JOIN_1 || 'INNER JOIN T_SCOB_MULTA_DETAL MDET ON MDET.ID_MULTA = MULT.ID_MULTA AND MDET.FLG_ACTUAL = ''1'' AND MDET.ESTADO = ''1'' ';
       V_SQL_JOIN_1 := V_SQL_JOIN_1 || 'INNER JOIN ( ';
       V_SQL_JOIN_1 := V_SQL_JOIN_1 || 'SELECT DISTINCT ID_MULTA AS ID_MULTA FROM T_SCOB_TMP_ADMINISTRADO) ADMINISTRADO ON (';
       V_SQL_JOIN_1 := V_SQL_JOIN_1 || '(' || C_FLG_ADMINISTRADO || ' = ''0'' AND ''0''=ADMINISTRADO.ID_MULTA) OR ';
       V_SQL_JOIN_1 := V_SQL_JOIN_1 || '(' || C_FLG_ADMINISTRADO || ' <> ''0'' AND ADMINISTRADO.ID_MULTA = MULT.ID_MULTA)) ';
       V_SQL_JOIN_1 := V_SQL_JOIN_1 || 'INNER JOIN T_SCOB_TMP_SITUACION_MULTA SIT_MULTA ON SIT_MULTA.ID_MULTA = MULT.ID_MULTA ';
       V_SQL_JOIN_1 := V_SQL_JOIN_1 || 'INNER JOIN T_SCOB_MATERIA MATE ON MATE.ID_MATERIA = MULT.ID_MATERIA ';
       V_SQL_JOIN_1 := V_SQL_JOIN_1 || 'INNER JOIN T_SCOB_TIPO_PROCEDIMIENTO TIPO_PROC ON TIPO_PROC.ID_TIPO_PROCEDIMIENTO = MATE.ID_TIPO_PROCEDIMIENTO ';
       V_SQL_JOIN_1 := V_SQL_JOIN_1 || 'INNER JOIN T_SCOB_SUBMATERIA SUBM ON SUBM.ID_SUBMATERIA = MULT.ID_SUB_MATERIA ';
       V_SQL_JOIN_1 := V_SQL_JOIN_1 || 'INNER JOIN T_SCOB_ORGANO_RESOLUTIVO ORGR ON ORGR.ID_ORGANO_RESOLUTIVO = MDET.ID_ORGANO_RESOLUTIVO ';
       V_SQL_JOIN_1 := V_SQL_JOIN_1 || 'INNER JOIN T_SCOB_UBIGEO UBIG_ORGR ON UBIG_ORGR.COD_DPTO = ORGR.COD_DPTO AND UBIG_ORGR.COD_PROV = ORGR.COD_PROV AND UBIG_ORGR.COD_DIST = ORGR.COD_DIST ';
       V_SQL_JOIN_1 := V_SQL_JOIN_1 || 'INNER JOIN T_SCOB_SEDE SEDE ON SEDE.ID_SEDE = MULT.ID_SEDE ';
       V_SQL_JOIN_1 := V_SQL_JOIN_1 || 'INNER JOIN T_SCOB_UBIGEO UBIG_SEDE ON UBIG_SEDE.COD_DPTO = SEDE.COD_DPTO AND UBIG_SEDE.COD_PROV = SEDE.COD_PROV AND UBIG_SEDE.COD_DIST = SEDE.COD_DIST ';
       V_SQL_JOIN_1 := V_SQL_JOIN_1 || 'INNER JOIN T_SCOB_TABLA_DET TIPO_MULTA ON TIPO_MULTA.ID_TABLA = 45  AND TO_NUMBER(TIPO_MULTA.COD_INTERNO) = TO_NUMBER(MULT.FLG_TIPO_MULTA) ';--TIPO MULTA
       V_SQL_JOIN_1 := V_SQL_JOIN_1 || 'INNER JOIN T_SCOB_TABLA_DET EST_DEUDA ON EST_DEUDA.ID_TABLA = 34 AND TO_NUMBER(EST_DEUDA.COD_INTERNO) = MULT.COD_ESTADO_PAGO '; --ESTADO DEUDA PAGO
    
       V_SQL_JOIN_1 := V_SQL_JOIN_1 || 'LEFT JOIN T_SCOB_TABLA_DET EST_MULTA_OR ON EST_MULTA_OR.ID_TABLA = 5 AND TO_NUMBER(EST_MULTA_OR.COD_INTERNO) = MDET.ESTADO_MULTA AND TO_NUMBER(EST_MULTA_OR.TXT_VALOR1) = 1 '; --ESTADO MULTA OR
       V_SQL_JOIN_1 := V_SQL_JOIN_1 || 'LEFT JOIN T_SCOB_TABLA_DET EST_MULTA_COB  ON EST_MULTA_COB.ID_TABLA = 5 AND TO_NUMBER(EST_MULTA_COB.COD_INTERNO) = MULT.ESTADO_MULTA AND TO_NUMBER(EST_MULTA_COB.TXT_VALOR1) = 2 '; --ESTADO MULTA COBRANZA
       V_SQL_JOIN_1 := V_SQL_JOIN_1 || 'LEFT JOIN T_SCOB_AREA_COBRANZA ARCO ON ARCO.ID_AREA_COBRANZA = MULT.ID_AREA_COBRANZA ';
       V_SQL_JOIN_1 := V_SQL_JOIN_1 || 'LEFT JOIN T_SCOB_USUARIO USUA ON USUA.ID_USUARIO = MULT.ID_USUARIO_ASIG_COBRANZA ';
       -- INSTANCIAS
       V_SQL_JOIN_1 := V_SQL_JOIN_1 || 'LEFT JOIN T_SCOB_TMP_INSTANCIAS_MULTA2 NIVEL1 ON NIVEL1.NRO_NIVEL = ' || SCOB_PK_CONSTANTES.C_TBL_TIPO_INSTANCIA_AUTO || ' AND NIVEL1.ID_MULTA = MULT.ID_MULTA ';
       V_SQL_JOIN_1 := V_SQL_JOIN_1 || 'LEFT JOIN T_SCOB_TMP_INSTANCIAS_MULTA2 NIVEL2 ON NIVEL2.NRO_NIVEL = ' || SCOB_PK_CONSTANTES.C_TBL_TIPO_INSTANCIA_COMI || ' AND NIVEL2.ID_MULTA = MULT.ID_MULTA ';
       V_SQL_JOIN_1 := V_SQL_JOIN_1 || 'LEFT JOIN T_SCOB_TMP_INSTANCIAS_MULTA2 NIVEL3 ON NIVEL3.NRO_NIVEL = ' || SCOB_PK_CONSTANTES.C_TBL_TIPO_INSTANCIA_SALA || ' AND NIVEL3.ID_MULTA = MULT.ID_MULTA ';
       V_SQL_JOIN_1 := V_SQL_JOIN_1 || 'LEFT JOIN T_SCOB_MULTA_COBRANZA MCOB ON MCOB.ID_MULTA = MULT.ID_MULTA AND MCOB.FLG_ACTUAL = ''1'' AND MCOB.ESTADO = ''1'' ';
    
       V_SQL_JOIN_1 := V_SQL_JOIN_1 || 'LEFT JOIN T_SCOB_EST_MUL_COB_MOTIVO MOTIVO_MULT ON MOTIVO_MULT.ID_MOTIVO = MULT.COD_MOTIVO ';  --motivo multa cobranza
       V_SQL_JOIN_1 := V_SQL_JOIN_1 || 'LEFT JOIN T_SCOB_EXPEDIENTE_MULTA EXMU ON EXMU.ID_MULTA = MULT.ID_MULTA AND EXMU.ESTADO = ''1'' ';
       V_SQL_JOIN_1 := V_SQL_JOIN_1 || 'LEFT JOIN T_SCOB_EXPEDIENTE EXPE ON EXPE.ID_EXPEDIENTE = EXMU.ID_EXPEDIENTE AND EXPE.ESTADO = ''1'' ';
       V_SQL_JOIN_1 := V_SQL_JOIN_1 || 'LEFT JOIN T_SCOB_EST_EXP_COB EST_EXP ON EST_EXP.ID_EST_EXP_COB = EXPE.ESTADO_EXPEDIENTE ';
       V_SQL_JOIN_1 := V_SQL_JOIN_1 || 'LEFT JOIN T_SCOB_EST_EXP_COB_MOTIVO MOTIVO_EXPE ON MOTIVO_EXPE.ID_MOTIVO = EXPE.ID_MOTIVO ';--motivo estado expediente
       
       V_SQL_JOIN_1 := V_SQL_JOIN_1 || 'LEFT JOIN T_SCOB_MULTA_ANTIDUMPING MUAN ON MUAN.ID_MULTA = MULT.ID_MULTA AND MUAN.ESTADO = ''1'' ';
       V_SQL_JOIN_1 := V_SQL_JOIN_1 || 'LEFT JOIN T_SCOB_INTENDENCIA INTE ON INTE.ID_INTENDENCIA = MUAN.ID_INTENDENCIA ';
       V_SQL_JOIN_1 := V_SQL_JOIN_1 || 'LEFT JOIN T_SCOB_PARTIDA PART ON PART.ID_PARTIDA = MUAN.ID_PARTIDA ';
    
       V_SQL_JOIN_1 := V_SQL_JOIN_1 || 'LEFT JOIN T_SCOB_MULTA_ARCHIVO_CENTRAL EXPED_ARCH_CEN ON EXPED_ARCH_CEN.ID_MULTA = MULT.ID_MULTA AND EXPED_ARCH_CEN.FLG_ACTUAL = ''1'' AND EXPED_ARCH_CEN.ESTADO = ''1'' ';
       V_SQL_JOIN_1 := V_SQL_JOIN_1 || 'LEFT JOIN T_SCOB_ARCHIVO_CENTRAL ARCH_CEN ON ARCH_CEN.ID_ARCHIVO_CENTRAL = EXPED_ARCH_CEN.ID_MULTA_ARCHIVO_CENTRAL AND ARCH_CEN.ESTADO = ''1'' ';
       
       V_SQL_JOIN_1 := V_SQL_JOIN_1 || 'LEFT JOIN T_SCOB_TMP_SANCIONADOS SANC ON SANC.ID_MULTA = MULT.ID_MULTA ';
       V_SQL_JOIN_1 := V_SQL_JOIN_1 || 'LEFT JOIN T_SCOB_TMP_DENUNCIANTE DTE ON DTE.ID_MULTA = MULT.ID_MULTA ';
       V_SQL_JOIN_1 := V_SQL_JOIN_1 || 'LEFT JOIN T_SCOB_TMP_DENUNCIADO DDO ON DDO.ID_MULTA = MULT.ID_MULTA ';       
       V_SQL_JOIN_1 := V_SQL_JOIN_1 || 'LEFT JOIN T_SCOB_TABLA_DET EXPECTATIVA ON EXPECTATIVA.ID_TABLA = 22 AND EXPECTATIVA.COD_INTERNO = EXPE.COD_EXPECTATIVA_COBRO AND EXPECTATIVA.ESTADO = ''1'' ';
       
       V_SQL_JOIN_1 := V_SQL_JOIN_1 || 'LEFT JOIN T_SCOB_EXPEDIENTE_DOCUMENTO RES_GAF_APRUEBA ' ;
       V_SQL_JOIN_1 := V_SQL_JOIN_1 ||          'ON (RES_GAF_APRUEBA.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE AND RES_GAF_APRUEBA.NRO_RESOLUCION_GAF IS NOT NULL AND ';
       V_SQL_JOIN_1 := V_SQL_JOIN_1 ||          'RES_GAF_APRUEBA.FEC_RESOLUCION_GAF IS NOT NULL AND RES_GAF_APRUEBA.ID_TIPO_DOCUMENTO = 12 AND ';
       V_SQL_JOIN_1 := V_SQL_JOIN_1 ||          'RES_GAF_APRUEBA.ESTADO = ''1'' AND ROWNUM = 1) '; -- aprueba fraccionamiento
       
       V_SQL_JOIN_1 := V_SQL_JOIN_1 || 'LEFT JOIN T_SCOB_EXPEDIENTE_DOCUMENTO RES_GAF_PERDIDA ' ;
       V_SQL_JOIN_1 := V_SQL_JOIN_1 ||          'ON (RES_GAF_PERDIDA.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE AND RES_GAF_PERDIDA.NRO_RESOLUCION_GAF IS NOT NULL AND ';
       V_SQL_JOIN_1 := V_SQL_JOIN_1 ||          'RES_GAF_PERDIDA.FEC_RESOLUCION_GAF IS NOT NULL AND RES_GAF_PERDIDA.ID_TIPO_DOCUMENTO = 35 AND ';
       V_SQL_JOIN_1 := V_SQL_JOIN_1 ||          'RES_GAF_PERDIDA.ESTADO = ''1'' AND ROWNUM = 1) '; -- pérdida fraccionamiento
       
       V_SQL_JOIN_1 := V_SQL_JOIN_1 || 'INNER JOIN USR_SICOB.T_SCOB_ORG_RESOL_MATERIA OXM ON (OXM.ID_ORGANO_RESOLUTIVO = MDET.ID_ORGANO_RESOLUTIVO AND OXM.ID_MATERIA = MULT.ID_MATERIA AND OXM.ESTADO = ''1'') ';
       
       V_SQL_WHERE_1 := 'WHERE MULT.ESTADO = ''1'' ';
        --AREA MACRO
        IF PI_V_AREA_MACRO IS NOT NULL THEN
            V_SQL_WHERE_1 := V_SQL_WHERE_1 || 'AND INSTR(''' || PI_V_AREA_MACRO || ''',''|'' || TO_CHAR(TIPO_PROC.ID_TIPO_PROCEDIMIENTO) || ''|'' )>0 ';
        END IF;
    
        --CODIGO MULTA
        IF PI_V_CUM_INI IS NOT NULL THEN
            V_SQL_WHERE_1 := V_SQL_WHERE_1 || 'AND MULT.ANIO||MULT.CUM BETWEEN ''' || PI_V_CUM_INI || ''' AND ''' || PI_V_CUM_FIN || ''' ';
        END IF;
    
        --FECHA GENERACION MULTA
        IF PI_V_FEC_GEN_CUM_INI IS NOT NULL THEN
            V_SQL_WHERE_1 := V_SQL_WHERE_1 || 'AND TO_DATE(TO_CHAR(MULT.FEC_INGRESO,''DD/MM/YYYY''),''DD/MM/YYYY'') BETWEEN TO_DATE(''' || PI_V_FEC_GEN_CUM_INI || ''',''DD/MM/YYYY'') AND TO_DATE(''' || PI_V_FEC_GEN_CUM_FIN || ''',''DD/MM/YYYY'') ';
        END IF;
    
        --SEDE
        IF PI_V_ID_SEDE IS NOT NULL THEN
            V_SQL_WHERE_1 := V_SQL_WHERE_1 || ' AND INSTR(''' || PI_V_ID_SEDE || ''',''|'' || TO_CHAR(MULT.ID_SEDE) || ''|'' )>0 ';
        END IF;
    
        --UBIGEO SEDE
        IF PI_V_ID_COD_DPTO_SEDE IS NOT NULL THEN
            V_SQL_WHERE_1 := V_SQL_WHERE_1 || 'AND SEDE.COD_DPTO=''' || PI_V_ID_COD_DPTO_SEDE || ''' ';
        END IF;
    
        IF PI_V_ID_COD_PROV_SEDE IS NOT NULL THEN
            V_SQL_WHERE_1 := V_SQL_WHERE_1 || 'AND SEDE.COD_PROV=''' || PI_V_ID_COD_PROV_SEDE || ''' ';
        END IF;
    
        IF PI_V_ID_COD_DIST_SEDE IS NOT NULL THEN
            V_SQL_WHERE_1 := V_SQL_WHERE_1 || 'AND SEDE.COD_DIST=''' || PI_V_ID_COD_DIST_SEDE || ''' ';
        END IF;
    
        --ORGANO RESOLUTIVO
        IF PI_V_ID_ORG_RESOL IS NOT NULL THEN
            V_SQL_WHERE_1 := V_SQL_WHERE_1 || 'AND INSTR(''' || PI_V_ID_ORG_RESOL || ''',''|'' || TO_CHAR(MDET.ID_ORGANO_RESOLUTIVO) || ''|'' )>0 ';
        END IF;
    
        --UBIGEO ORGANO RESOLUTIVO
        IF PI_V_ID_COD_DPTO_ORGR IS NOT NULL THEN
            V_SQL_WHERE_1 := V_SQL_WHERE_1 || 'AND ORGR.COD_DPTO=''' || PI_V_ID_COD_DPTO_ORGR || ''' ';
        END IF;
    
        IF PI_V_ID_COD_PROV_ORGR IS NOT NULL THEN
            V_SQL_WHERE_1 := V_SQL_WHERE_1 || 'AND ORGR.COD_PROV=''' || PI_V_ID_COD_PROV_ORGR || ''' ';
        END IF;
        IF PI_V_ID_COD_DIST_ORGR IS NOT NULL THEN
            V_SQL_WHERE_1 := V_SQL_WHERE_1 || 'AND ORGR.COD_DIST=''' || PI_V_ID_COD_DIST_ORGR || ''' ';
        END IF;
    
        --TIPO INSTANCIA
        IF PI_V_ID_NRO_INSTANCIA IS NOT NULL THEN
            V_SQL_WHERE_1 := V_SQL_WHERE_1 || 'AND INSTR(''' || PI_V_ID_NRO_INSTANCIA || ''',''|'' || TO_CHAR(ORGR.TIPO_INSTANCIA) || ''|'' )>0 ';
        END IF;
    
        --MATERIA
        IF PI_V_ID_MATERIA IS NOT NULL THEN
            V_SQL_WHERE_1 := V_SQL_WHERE_1 || 'AND INSTR(''' || PI_V_ID_MATERIA || ''',''|'' || TO_CHAR(MULT.ID_MATERIA) || ''|'' )>0 ';
        END IF;
    
        --SUBMATERIA
        IF PI_V_ID_SUB_MATERIA IS NOT NULL THEN
            V_SQL_WHERE_1 := V_SQL_WHERE_1 || 'AND INSTR(''' || PI_V_ID_SUB_MATERIA || ''',''|'' || TO_CHAR(MULT.ID_SUB_MATERIA) || ''|'' )>0 ';
        END IF;
    
        --NUMERO EXPEDIENTE UNICO
        IF PI_V_NRO_EXP_UNICO_INI IS NOT NULL THEN
            V_SQL_WHERE_1 := V_SQL_WHERE_1 || 'AND TO_NUMBER(MULT.NRO_EXPED_UNICO) BETWEEN ''' || PI_V_NRO_EXP_UNICO_INI || ''' and ''' || PI_V_NRO_EXP_UNICO_FIN || ''' '; --@0001
        END IF;
    
        --NUMERO EXPEDIENTE ADMINISTRATIVO
        IF PI_V_NROEXPADM_NIVEL IS NOT NULL THEN
            V_SQL_WHERE_1 := V_SQL_WHERE_1 || 'AND MDET.NRO_EXP_NIVEL LIKE ''' || PI_V_NROEXPADM_NIVEL || '%'' ';
        END IF;
    
        --NRO RESOLUCION OR
        IF PI_V_NRO_RESOL IS NOT NULL THEN
            V_SQL_WHERE_1 := V_SQL_WHERE_1 || 'AND NIVEL1.NRO_RESOLUCION LIKE ''' || PI_V_NRO_RESOL || '%'' ';
        END IF;
    
        --FECHA RESOLUCION OR
        IF PI_V_FEC_RESO_OR_INI IS NOT NULL THEN
            V_SQL_WHERE_1 := V_SQL_WHERE_1 || 'AND TO_DATE(TO_CHAR(MDET.FEC_RESOLUCION,''DD/MM/YYYY''),''DD/MM/YYYY'') BETWEEN TO_DATE(''' || PI_V_FEC_RESO_OR_INI || ''',''DD/MM/YYYY'') AND TO_DATE(''' || PI_V_FEC_RESO_OR_FIN || ''',''DD/MM/YYYY'') ';
        END IF;
    
        --FECHA NOTIFICACION RESOLUCION OR
        IF PI_V_FEC_NOTIFI_OR_INI IS NOT NULL THEN
            V_SQL_WHERE_1 := V_SQL_WHERE_1 || 'AND TO_DATE(TO_CHAR(MDET.FEC_NOTIFICACION_RESOLUCION,''DD/MM/YYYY''),''DD/MM/YYYY'')  BETWEEN TO_DATE(''' || PI_V_FEC_NOTIFI_OR_INI || ''',''DD/MM/YYYY'') AND TO_DATE(''' || PI_V_FEC_NOTIFI_OR_FIN || ''',''DD/MM/YYYY'') ';
        END IF;
    
        --FECHA GENERACION DE LA SEC
        IF PI_V_FEC_GENERACION_SEC_INI IS NOT NULL THEN
            V_SQL_WHERE_1 := V_SQL_WHERE_1 || 'AND TO_DATE(TO_CHAR(MULT.FEC_GENERACION_SEC,''DD/MM/YYYY''),''DD/MM/YYYY'') BETWEEN TO_DATE(''' || PI_V_FEC_GENERACION_SEC_INI || ''',''DD/MM/YYYY'') AND TO_DATE(''' || PI_V_FEC_GENERACION_SEC_FIN || ''',''DD/MM/YYYY'') ';
        END IF;
    
        --FECHA INGRESO AL AEC
        IF PI_V_FEC_RECEPCION_AEC_INI IS NOT NULL THEN
            V_SQL_WHERE_1 := V_SQL_WHERE_1 || 'AND TO_DATE(TO_CHAR(MULT.FEC_INGRESO_FILE,''DD/MM/YYYY''),''DD/MM/YYYY'') BETWEEN TO_DATE(''' || PI_V_FEC_RECEPCION_AEC_INI || ''',''DD/MM/YYYY'') AND TO_DATE(''' || PI_V_FEC_RECEPCION_AEC_FIN || ''',''DD/MM/YYYY'') ';
        END IF;
    
        --AÑO INGRESO AL AEC
        IF PI_V_ANIO_INGRESO_AEC_INI IS NOT NULL THEN
            V_SQL_WHERE_1 := V_SQL_WHERE_1 || 'AND MCOB.ANIO BETWEEN ''' || PI_V_ANIO_INGRESO_AEC_INI || ''' AND ''' || PI_V_ANIO_INGRESO_AEC_FIN || ''' ';
        END IF;
    
        --NRO INGRESO AL AEC
        IF PI_V_NRO_INGRESO_AEC_INI IS NOT NULL THEN
            V_SQL_WHERE_1 := V_SQL_WHERE_1 || 'AND MCOB.NRO_INGRESO BETWEEN ''' || LPAD(PI_V_NRO_INGRESO_AEC_INI, 4, '0000') || ''' AND ''' || LPAD(PI_V_NRO_INGRESO_AEC_FIN, 4, '0000') || ''' ';
        END IF;
    
        --AÑO FILE
        IF PI_V_ANIO_FILE_INI IS NOT NULL THEN
            V_SQL_WHERE_1 := V_SQL_WHERE_1 || 'AND MULT.ANIO_FILE_AEC BETWEEN ''' || PI_V_ANIO_FILE_INI || ''' AND ''' || PI_V_ANIO_FILE_FIN || ''' ';
        END IF;
    
        --NRO FILE
        IF PI_V_NRO_FILE_INI IS NOT NULL THEN
            V_SQL_WHERE_1 := V_SQL_WHERE_1 || 'AND MULT.NRO_FILE_AEC BETWEEN ''' || LPAD(PI_V_NRO_FILE_INI, 10, '0000000000') || ''' AND ''' || LPAD(PI_V_NRO_FILE_FIN, 10, '0000000000') || ''' ';
        END IF;
    
        --VALOR UIT
        IF PI_N_VALOR_UIT_INI > 0 THEN
            V_SQL_WHERE_1 := V_SQL_WHERE_1 || 'AND MDET.VALOR_UIT BETWEEN ' || PI_N_VALOR_UIT_INI || ' AND ' || PI_N_VALOR_UIT_FIN || ' ';
        END IF;
    
        --MONTO UIT
        IF PI_N_MONTO_UIT_INI > 0 THEN
            V_SQL_WHERE_1 := V_SQL_WHERE_1 || 'AND MULT.MONTO_UIT BETWEEN ' || PI_N_MONTO_UIT_INI || ' AND ' || PI_N_MONTO_UIT_FIN  || ' ';
        END IF;
    
        --SALDO UIT
        IF PI_N_SALDO_INI > 0 THEN
            V_SQL_WHERE_1 := V_SQL_WHERE_1 || 'AND MULT.SALDO BETWEEN ' || PI_N_SALDO_INI || ' AND ' || PI_N_SALDO_FIN || ' ';
        END IF;
    
        --TIPO MULTA
        IF PI_V_ID_TIPO_MULTA IS NOT NULL THEN
            V_SQL_WHERE_1 := V_SQL_WHERE_1 || 'AND INSTR(''' || PI_V_ID_TIPO_MULTA || ''',''|'' || MULT.FLG_TIPO_MULTA || ''|'' )>0 ';
        END IF;
    
        --ESTADO MULTA OR
        IF PI_V_COD_ESTADO_MULTA_RESOL IS NOT NULL THEN
            V_SQL_WHERE_1 := V_SQL_WHERE_1 || 'AND INSTR(''' || PI_V_COD_ESTADO_MULTA_RESOL || ''',''|'' || TO_CHAR(MDET.ESTADO_MULTA) || ''|'' )>0 ';
        END IF;
    
        --ESTADO PAGO MULTA
        IF PI_V_COD_ESTADO_PAGO IS NOT NULL THEN
            V_SQL_WHERE_1 := V_SQL_WHERE_1 || 'AND INSTR(''' || PI_V_COD_ESTADO_PAGO || ''',''|'' || TO_CHAR(MULT.COD_ESTADO_PAGO) || ''|'' )>0 ';
        END IF;
    
        --FECHA ESTADO MULTA OR
        IF PI_V_FEC_ESTADO_MULTA_OR_INI IS NOT NULL THEN
            V_SQL_WHERE_1 := V_SQL_WHERE_1 || 'AND TO_DATE(TO_CHAR(MDET.FEC_ESTADO_MULTA,''DD/MM/YYYY''),''DD/MM/YYYY'') BETWEEN TO_DATE(''' || PI_V_FEC_ESTADO_MULTA_OR_INI || ''',''DD/MM/YYYY'') AND TO_DATE(''' || PI_V_FEC_ESTADO_MULTA_OR_FIN || ''',''DD/MM/YYYY'') ';
        END IF;
    
        --FECHA ESTADO MULTA COB
        IF PI_V_FEC_ESTADO_MULTA_COB_INI IS NOT NULL THEN
            V_SQL_WHERE_1 := V_SQL_WHERE_1 || 'AND TO_DATE(TO_CHAR(MULT.FEC_ESTADO_MULTA,''DD/MM/YYYY''),''DD/MM/YYYY'') BETWEEN TO_DATE(''' || PI_V_FEC_ESTADO_MULTA_COB_INI || ''',''DD/MM/YYYY'') AND TO_DATE(''' || PI_V_FEC_ESTADO_MULTA_COB_FIN || ''',''DD/MM/YYYY'') ';
        END IF;
    
        --ESTADO MULTA COBRANZA
        IF PI_V_COD_ESTADO_MULTA_COB IS NOT NULL THEN
            V_SQL_WHERE_1 := V_SQL_WHERE_1 || 'AND INSTR(''' || PI_V_COD_ESTADO_MULTA_COB || ''',''|'' || TO_CHAR(MULT.ESTADO_MULTA) || ''|'' )>0 ';
        END IF;
    
        --MOTIVO MULTA COBRANZA
        IF PI_V_COD_MOTIVO_MULTA_COB IS NOT NULL THEN
            V_SQL_WHERE_1 := V_SQL_WHERE_1 || 'AND INSTR(''' || PI_V_COD_MOTIVO_MULTA_COB || ''',''|'' || MULT.COD_MOTIVO || ''|'' )>0 ';
        END IF;
    
        --INDICADOR DE PAGO
        IF PI_V_IND_TIPO_PAGO IS NOT NULL THEN
            V_SQL_WHERE_1 := V_SQL_WHERE_1 || 'AND INSTR(''' || PI_V_IND_TIPO_PAGO || ''',''|'' || TO_CHAR(SIT_MULTA.COD_SITUACION_MULTA) || ''|'' )>0 ';
        END IF;
    
        --INDICADOR PORCENTAJE ASOCU MULTA
        IF PI_C_FLG_ASOCU_MULTA <> '0' THEN
            V_SQL_WHERE_1 := V_SQL_WHERE_1 || 'AND NVL(MDET.POR_ASOCU,0) > 0 ';
        END IF;
    
        --EXPECTATIVA DE COBRO
        IF PI_V_ID_EXPECTATIVA_COBRO IS NOT NULL THEN
            V_SQL_WHERE_1 := V_SQL_WHERE_1 || 'AND INSTR(''' || PI_V_ID_EXPECTATIVA_COBRO || ''',''|'' || TO_CHAR(EXPE.COD_EXPECTATIVA_COBRO) || ''|'' )>0 ';
        END IF;
    
        --INDICADOR EMBARGO
        IF PI_C_FLG_IND_EMBARGO <> '0' THEN
            V_SQL_WHERE_1 := V_SQL_WHERE_1 || 'AND NVL(EXPE.FLG_EMBARGO,''0'') = ''1'' ';
        END IF;
    
        --FECHA ULTIMA GENERACION PRECOACTIVO
        IF PI_V_FEC_CARTA_PRECOACTIVA_INI IS NOT NULL THEN
            V_SQL_WHERE_1 := V_SQL_WHERE_1 || 'AND TO_DATE(TO_CHAR(MULT.FEC_ULT_GEN_PRECOACTIVA,''DD/MM/YYYY''),''DD/MM/YYYY'') BETWEEN TO_DATE(''' || PI_V_FEC_CARTA_PRECOACTIVA_INI || ''',''DD/MM/YYYY'') AND TO_DATE(''' || PI_V_FEC_CARTA_PRECOACTIVA_FIN || ''',''DD/MM/YYYY'') ';
        END IF;
    
        --FECHA RECEPCION FILE
        IF PI_V_FEC_RECEPCION_FILE_INI IS NOT NULL THEN
            V_SQL_WHERE_1 := V_SQL_WHERE_1 || 'AND TO_DATE(TO_CHAR(MULT.FEC_INGRESO_AEC,''DD/MM/YYYY''),''DD/MM/YYYY'') BETWEEN TO_DATE(''' || PI_V_FEC_RECEPCION_FILE_INI || ''',''DD/MM/YYYY'') AND TO_DATE(''' || PI_V_FEC_RECEPCION_FILE_FIN || ''',''DD/MM/YYYY'') ';
        END IF;
    
        ---------------------------------------------------------------------------
        -- FILTROS EXPEDIENTE
        ---------------------------------------------------------------------------
        --ESTADO EXPEDIENTE COBRANZA
        IF PI_V_COD_ESTADO_EXPED_COB IS NOT NULL THEN
            V_SQL_WHERE_1 := V_SQL_WHERE_1 || 'AND INSTR(''' || PI_V_COD_ESTADO_EXPED_COB || ''',''|'' || TO_CHAR(EXPE.ESTADO_EXPEDIENTE) || ''|'' )>0 ';
        END IF;
    
        --AÑO EXPEDIENTE COBRANZA
        IF PI_V_ANIO IS NOT NULL THEN
            V_SQL_WHERE_1 := V_SQL_WHERE_1 || 'AND EXPE.ANIO=''' || PI_V_ANIO || ''' ';
        END IF;
    
        --NRO EXPEDIENTE COBRANZA
        IF PI_V_NRO_EXP_COB_INI > 0 THEN
            V_SQL_WHERE_1 := V_SQL_WHERE_1 || 'AND EXPE.NRO_EXPEDIENTE BETWEEN lpad(''' || PI_V_NRO_EXP_COB_INI || ''',10,''0000000000'') AND lpad(''' || PI_V_NRO_EXP_COB_FIN || ''',10,''0000000000'') ';
        END IF;
    
        --FECHA GENERACION EXPEDIENTE COBRANZA
        IF PI_V_FEC_GEN_EXPED_COB_INI IS NOT NULL THEN
            V_SQL_WHERE_1 := V_SQL_WHERE_1 || 'AND TO_DATE(TO_CHAR(EXPE.FEC_INGRESO,''DD/MM/YYYY''),''DD/MM/YYYY'') BETWEEN TO_DATE(''' || PI_V_FEC_GEN_EXPED_COB_INI || ''',''DD/MM/YYYY'') AND TO_DATE(''' || PI_V_FEC_GEN_EXPED_COB_FIN || ''',''DD/MM/YYYY'') ';
        END IF;
    
        --GESTOR COBRANZA
        IF PI_V_GESTOR_COBRANZA IS NOT NULL THEN
            V_SQL_WHERE_1 := V_SQL_WHERE_1 || 'AND INSTR(''' || PI_V_GESTOR_COBRANZA || ''',''|'' || TO_CHAR(MULT.ID_USUARIO_ASIG_COBRANZA) || ''|'' )>0 ';
        END IF;
    
        --FECHA EMISION DE LA REC
        IF PI_V_FEC_EMI_REC_INI IS NOT NULL THEN
            V_SQL_WHERE_1 := V_SQL_WHERE_1 || 'AND TO_DATE(TO_CHAR(MULT.FEC_EMISION_REC,''DD/MM/YYYY''),''DD/MM/YYYY'') BETWEEN TO_DATE(''' || PI_V_FEC_EMI_REC_INI || ''',''DD/MM/YYYY'') AND TO_DATE(''' || NVL(PI_V_FEC_EMI_REC_FIN, PI_V_FEC_EMI_REC_INI) || ''',''DD/MM/YYYY'') ';
        END IF;
    
        --FECHA NOTIFICACION DE LA REC
        IF PI_V_FEC_NOTI_REC_INI IS NOT NULL THEN
            V_SQL_WHERE_1 := V_SQL_WHERE_1 || 'AND TO_DATE(TO_CHAR(MULT.FEC_NOTIF_REC,''DD/MM/YYYY''),''DD/MM/YYYY'') BETWEEN TO_DATE(''' || PI_V_FEC_NOTI_REC_INI || ''',''DD/MM/YYYY'') AND TO_DATE(''' || PI_V_FEC_NOTI_REC_FIN || ''',''DD/MM/YYYY'') ';
        END IF;
    
        --MOTIVO EXPEDIENTE COBRANZA
        IF PI_V_COD_MOTIVO_EXPED_COB IS NOT NULL THEN
            V_SQL_WHERE_1 := V_SQL_WHERE_1 || 'AND INSTR(''' || PI_V_COD_MOTIVO_EXPED_COB || ''',''|'' || TO_CHAR(EXPE.ID_MOTIVO) || ''|'' )>0 ';
        END IF;
    
        --FECHA ULTIMO ESTADO EXPEDIENTE
        IF PI_V_FEC_EST_EXPED_COB_INI IS NOT NULL THEN
            V_SQL_WHERE_1 := V_SQL_WHERE_1 || 'AND TO_DATE(TO_CHAR(EXPE.FEC_ESTADO_EXPEDIENTE,''DD/MM/YYYY''),''DD/MM/YYYY'') BETWEEN TO_DATE(''' || PI_V_FEC_EST_EXPED_COB_INI || ''',''DD/MM/YYYY'') AND TO_DATE(''' || PI_V_FEC_EST_EXPED_COB_FIN || ''',''DD/MM/YYYY'') ';
        END IF;
    
        --NUMERO DE ENVIO A ARCHIVO CENTRAL
        IF PI_V_NUM_ENV_ARCH_INI IS NOT NULL THEN
            V_SQL_WHERE_1 := V_SQL_WHERE_1 || 'AND ARCH_CEN.NRO_ORDEN BETWEEN LPAD(''' || PI_V_NUM_ENV_ARCH_INI || ''',4,''0000'') AND LPAD(''' || PI_V_NUM_ENV_ARCH_FIN || ''',4,''0000'') ';
        END IF;
    
        --FECHA ENVIO ARCHIVO CENTRAL
        IF PI_V_FEC_ENVI_ARCH_INI IS NOT NULL THEN
            V_SQL_WHERE_1 := V_SQL_WHERE_1 || 'AND TO_DATE(TO_CHAR(ARCH_CEN.FEC_ENVIO,''DD/MM/YYYY''),''DD/MM/YYYY'') BETWEEN TO_DATE(''' || PI_V_FEC_ENVI_ARCH_INI || ''',''DD/MM/YYYY'') AND TO_DATE(''' || PI_V_FEC_ENVI_ARCH_FIN || ''',''DD/MM/YYYY'') ';
        END IF;
    
        --NRO OFICIO SUNAT
        IF PI_V_NRO_OFIC_SUNAT_INI IS NOT NULL THEN
            V_SQL_WHERE_1 := V_SQL_WHERE_1 || 'AND (MUAN.NRO_OFICIO_SUNAT_CODIGO || MUAN.NRO_OFICIO_SUNAT_ANIO || MUAN.NRO_OFICIO_SUNAT_PREFIJO || MUAN.NRO_OFICIO_SUNAT_CORRELATIVO) BETWEEN ''' || PI_V_NRO_OFIC_SUNAT_INI || ''' AND ''' || PI_V_NRO_OFIC_SUNAT_FIN || ''' ';
        END IF;
    
        --DERECHO ANTIDUMOPING
        IF PI_N_DERE_ANTIDUMP_INI > 0 THEN
            V_SQL_WHERE_1 := V_SQL_WHERE_1 || 'AND MUAN.MONTO_ANTIDUMPING BETWEEN ' || PI_N_DERE_ANTIDUMP_INI || ' AND ' || PI_N_DERE_ANTIDUMP_FIN || ' '; 
        END IF;
    
        --PARTIDA ARANCELARIA
        IF PI_V_NRO_PARTI_INI IS NOT NULL THEN
            V_SQL_WHERE_1 := V_SQL_WHERE_1 || 'AND PART.CODIGO BETWEEN lpad(''' || PI_V_NRO_PARTI_INI || ''',10,''0000000000'') AND lpad(''' || PI_V_NRO_PARTI_FIN || ''',10,''0000000000'')';
        END IF;
    
        --MEMO ANTIDUMPING --FALTA EL CAMPO NO EXISTE EN LA INTERFAZ
        --NRO DUA
        IF PI_V_NRO_DUA_INI IS NOT NULL THEN
            V_SQL_WHERE_1 := V_SQL_WHERE_1 || 'AND (MUAN.NRO_DUA_CODIGO || MUAN.NRO_DUA_ANIO || MUAN.NRO_DUA_CORRELATIVO) BETWEEN ''' || PI_V_NRO_DUA_INI || ''' AND ''' || PI_V_NRO_DUA_FIN || '''';
        END IF;
    
        --NRO LIQUIDACION COBRANZA
        IF PI_V_NRO_LIQ_COB_INI IS NOT NULL THEN
            V_SQL_WHERE_1 := V_SQL_WHERE_1 || 'AND (MUAN.NRO_LIQUIDACION_CODIGO || MUAN.NRO_LIQUIDACION_ANIO || MUAN.NRO_LIQUIDACION_CORRELATIVO) BETWEEN ''' || PI_V_NRO_LIQ_COB_INI || ''' AND ''' || PI_V_NRO_LIQ_COB_FIN || '''';
        END IF;
    
        --INTENDENCIA
        IF PI_V_ID_INTENDENCIA IS NOT NULL THEN
            V_SQL_WHERE_1 := V_SQL_WHERE_1 || 'AND INSTR(''' || PI_V_ID_INTENDENCIA || ''',''|'' || TO_CHAR(MUAN.ID_INTENDENCIA) || ''|'' )>0 ';
        END IF;
    
        --FECHA ASIGNACION GESTOR COBRANZA
        IF PI_V_FEC_ASIG_GESTOR_INI IS NOT NULL THEN
            V_SQL_WHERE_1 := V_SQL_WHERE_1 || 'AND TO_DATE(TO_CHAR(MULT.FECHA_ASIG_COBRANZA,''DD/MM/YYYY''),''DD/MM/YYYY'') BETWEEN TO_DATE(''' || PI_V_FEC_ASIG_GESTOR_INI || ''',''DD/MM/YYYY'') AND TO_DATE(''' || PI_V_FEC_ASIG_GESTOR_FIN || ''',''DD/MM/YYYY'')';
        END IF;
    
        V_SQL_WHERE_1 := V_SQL_WHERE_1 || 'ORDER BY CUM DESC'; 
        
        V_SQL_SELECT_2 := 'SELECT OBJ_REC_CONS_MULTA_AVAN( ';
        V_SQL_SELECT_2 := V_SQL_SELECT_2 || 'NRO_REG, ID_MULTA, CUM, FEC_GENERACION_CUM, NOM_TIPO_PROCEDEMIENTO, COD_ORGANO_RESOLUTIVO, ';
        V_SQL_SELECT_2 := V_SQL_SELECT_2 || 'NOM_ORGANO_RESOLUTIVO, COD_SEDE, NOM_SEDE, NOM_MATERIA, NOM_SUB_MATERIA, ';
        V_SQL_SELECT_2 := V_SQL_SELECT_2 || 'NRO_EXPEDIENTE_UNICO, NRO_EXPEDIENTE_ADMINISTRATIVO, NRO_RESOL_OR, ';
        V_SQL_SELECT_2 := V_SQL_SELECT_2 || 'FEC_REG_OR, FEC_EMI_RESOL_OR, FEC_NOTIF_RESOL_OR, FEC_APELACION, USU_REG_OR, CANTIDAD_OR, ';
        V_SQL_SELECT_2 := V_SQL_SELECT_2 || 'NRO_RESOL_COMISION, FEC_REG_COMISION, FEC_RESOL_COMISION, FEC_NOTIF_RESOL_COMISION, FEC_REVISION, USU_REG_COMISION, CANTIDAD_COMISION, ';
        V_SQL_SELECT_2 := V_SQL_SELECT_2 || 'NRO_RESOL_SALA, FEC_REG_SALA, FEC_RESOL_SALA, FEC_NOTIF_RESOL_SALA, USU_REG_SALA, CANTIDAD_SALA, ';
        V_SQL_SELECT_2 := V_SQL_SELECT_2 || 'NOM_TIPO_MULTA, NOM_DENUNCIANTE, NOM_DENUNCIADO, NOM_SANCIONADO, NOM_TIPO_DOC_SANCIONADO, NRO_TIPO_DOC_SANCIONADO, ';
        V_SQL_SELECT_2 := V_SQL_SELECT_2 || 'COD_INDECOPI_SANCIONADO, CLASIF_SANCIONADO, CIIU_SANCIONADO, IND_ASOCU, PORCENTAJE_ASOCU, ';
        V_SQL_SELECT_2 := V_SQL_SELECT_2 || 'TIPO_CAMBIO_DA, DERECHO_ANTIDUMPING, MONTO_DA_IC, MONTO_DA_IM, NRO_OFICIO_SUNAT, NRO_LIQUIDACION_COBRANZA, ';
        V_SQL_SELECT_2 := V_SQL_SELECT_2 || 'COD_PARTIDA, NOM_PARTIDA, NRO_DUA, COD_INTENDENCIA, NOM_INTENDENCIA, ';
        V_SQL_SELECT_2 := V_SQL_SELECT_2 || 'VALOR_UIT, MONTO_UIT, MONTO_IC, MONTO_INTERES_IM, MONTO_COSTAS, ';
        V_SQL_SELECT_2 := V_SQL_SELECT_2 || 'TOTAL_AMORTIZADO, TOTAL_AMORTIZADO_IC, TOTAL_AMORTIZADO_IM, TOTAL_AMORTIZADO_COSTAS, ';
        V_SQL_SELECT_2 := V_SQL_SELECT_2 || 'SALDO, SALDO_IC, SALDO_IM, SALDO_COSTAS, ';
        V_SQL_SELECT_2 := V_SQL_SELECT_2 || 'NOM_ESTADO_MULTA_OR, NOM_ESTADO_PAGO, POR_DSCTO_PAGO, ';
        V_SQL_SELECT_2 := V_SQL_SELECT_2 || 'FEC_GENERACION_SEC, ANIO_FILE_AEC, FEC_RECEPCION_FILE, NRO_FILE_AEC, NRO_INGRESO_AEC, NOM_ESTADO_MULTA_COB, NOM_MOTIVO_MULTA, ';
        V_SQL_SELECT_2 := V_SQL_SELECT_2 || 'FEC_ULT_OBSERVACION_AEC, FEC_ULT_INGRESO_AEC, NRO_EXPED_COB, FEC_GENERACION_EXPED_COB, ';
        V_SQL_SELECT_2 := V_SQL_SELECT_2 || 'USU_GESTOR_COBRANZA, FEC_ASIG_GESTOR_COBRANZA, FEC_ULT_GEN_PRECOACTIVA, FEC_EMISION_REC, FEC_NOTIF_REC, IND_EMBARGO, ';
        V_SQL_SELECT_2 := V_SQL_SELECT_2 || 'NOM_ESTADO_EXPED_COB, NOM_MOTIVO_EXPED_COB, FEC_ULT_ESTADO_EXPED_COB, NOM_EXPECTATIVA_COBRO, REGION_SANCIONADO, ';
        V_SQL_SELECT_2 := V_SQL_SELECT_2 || 'FEC_MARCA_ENVIO_INFOCORP, NRO_ENVIO_ARCHIVO, FEC_ENVIO_ARCHIVO, UBI_FISICA_EXPEDIENTE, COD_SITUACION_MULTA, ';
        V_SQL_SELECT_2 := V_SQL_SELECT_2 || 'VC_COD_TIPOPROC, VC_COD_MATERIA, VC_COD_SUBMATERIA, VC_COD_EST_MULTA, VC_COD_EST_PAGO, VC_COD_EST_MULTA_COB, VC_CODIGO_EST_EXP, ';
        V_SQL_SELECT_2 := V_SQL_SELECT_2 || 'VC_COD_MOTIVO_EXPED_COB, VC_CODIGO_CLASIFICACION, VC_CODIGO_CIIU, VC_TIPO_MULTA, ';
        V_SQL_SELECT_2 := V_SQL_SELECT_2 || 'VC_RESO_GAF_APRUEBA, VC_FEC_RESO_GAF_APRUEBA, VC_RESO_GAF_PERDIDA, VC_FEC_RESO_GAF_PERDIDA, VC_NRO_DOC_DENUNCIANTE, ';
        V_SQL_SELECT_2 := V_SQL_SELECT_2 || 'VC_COD_MOTIVO_MULTA_COB, VC_COD_CENTRO_COSTO, ';
        V_SQL_SELECT_2 := V_SQL_SELECT_2 || 'VC_NRO_REC_DECLA_01, DT_RES_CONS_FIRME_01, DT_NOTF_CONS_FIRME_01, ';
        V_SQL_SELECT_2 := V_SQL_SELECT_2 || 'VC_NRO_REC_DECLA_02, DT_RES_CONS_FIRME_02, DT_NOTF_CONS_FIRME_02, ';
        V_SQL_SELECT_2 := V_SQL_SELECT_2 || 'VC_NRO_REC_DECLA_03, DT_RES_CONS_FIRME_03, DT_NOTF_CONS_FIRME_03, ';
        V_SQL_SELECT_2 := V_SQL_SELECT_2 || 'ID_ORGANO_RESOLUTIVO ';
        V_SQL_SELECT_2 := V_SQL_SELECT_2 || ') ';

        V_SQL_JOIN_2 := 'FROM (' || V_SQL_SELECT_1 || V_SQL_JOIN_1 || V_SQL_WHERE_1 || ')' ;
        
        --DBMS_OUTPUT.PUT_LINE(V_SQL_SELECT_2 || V_SQL_JOIN_2);
        
        --DBMS_OUTPUT.PUT_LINE(V_SQL_SELECT_1 || V_SQL_JOIN_1 || V_SQL_WHERE_1);
        
        EXECUTE IMMEDIATE V_SQL_SELECT_2  || V_SQL_JOIN_2 BULK COLLECT INTO V_TAB_MULT_BUS_A;
        OPEN PO_CU_RETORNO FOR 
        SELECT * 
        FROM TABLE(CAST(V_TAB_MULT_BUS_A AS
                                    USR_SICOB.OBJ_TAB_CONS_MULTA_AVAN)) X;
        COMMIT;
    END;

/*
-----------------------------------------------------------
-- AUTOR        : HCHALCO
-- CREADO       : 09.07.2021
-- PROPOSITO    : Consulta de multas pagadas sin fecha de notificaciones del SICOB
-----------------------------------------------------------
*/
procedure SCOB_SP_S_MULTA_PAGA_SIN_NOTIF(
       pi_vc_fec_gen_cum_ini                   in varchar2      --FECHA GENERACION CUM INI
      ,pi_vc_fec_gen_cum_fin                   in varchar2      --FECHA GENERACION CUM FIN
      ,pi_vc_cum_ini                           in varchar2      --cum
      ,pi_vc_cum_fin                           in varchar2      --cum
      ,pi_vc_id_usuario                        in varchar2      --idUsuario
      ,po_cu_retorno                          out cu_rec_set
)is
BEGIN
      OPEN PO_CU_RETORNO FOR
      SELECT ROWNUM AS NUMROW,
             MULT.ID_MULTA AS ID_MULTA,
             MULT.ANIO || MULT.CUM AS CUM,
             ORGR.DESCRIPCION AS DESC_OR,
             TIPO_PROC.DESCRIPCION AS DESC_AREA,
             MATE.DESCRIPCION AS DESC_MATERIA,
             MDET.NRO_EXPED_ANTIGUO,
             MDET.NRO_RESOLUCION AS NRO_RESOL,
             
             NVL(MDET.VALOR_UIT,0) AS VALOR_UIT,
             MULT.MONTO_UIT AS MONTO_UIT,
    
             MDET.ID_USUARIO_INGRESO AS ID_USU_INGRESO,
             USU.USUARIO AS LOGIN_USU_INGRESO,
             USU.PRI_NOMBRE || ' ' || USU.SEG_NOMBRE || ' ' || USU.APE_PATERNO || ' ' ||USU.APE_MATERNO AS NOM_USU_INGRESO,
             USU.AREA AS ID_AREA_USUARIO,
             MDET.ID_ORGANO_RESOLUTIVO AS ID_ORGR_USU_INGRESO,
             MDET.ID_USUARIO_SECRETARIO AS ID_USU_SECRETARIO,
             MULT.ESTADO_MULTA AS ID_ESTADO_MULTA,
             EST_MULT.TXT_DESCRIPCION AS DESC_ESTADO_MULTA,

             TO_CHAR(MULT.FEC_INGRESO,'DD/MM/YYYY') AS FEC_GEN_MULTA,
             TO_CHAR(MDET.FEC_RESOLUCION,'DD/MM/YYYY') AS FEC_RESOL,
             TO_CHAR(MDET.FEC_NOTIFICACION_RESOLUCION,'DD/MM/YYYY') AS FEC_NOTIF_RESOL,
             TO_CHAR(MDET.FEC_INI_PLAZO,'DD/MM/YYYY') AS FEC_INI_PLAZO,
             TO_CHAR(MDET.FEC_FIN_PLAZO,'DD/MM/YYYY') AS FEC_FIN_PLAZO,
             TO_CHAR(MDET.FEC_ESTADO_INSTANCIA,'DD/MM/YYYY') AS FEC_ESTADO_INSTANCIA,
             TO_CHAR(MDET.FEC_ESTADO_SGTE_INSTANCIA,'DD/MM/YYYY') AS FEC_ESTADO_SGTE_INSTANCIA,
             TO_CHAR(MDET.FEC_DECLARACION,'DD/MM/YYYY') AS FEC_DECLA,
             TO_CHAR(MDET.FEC_NOTIFICACION_DECLARACION,'DD/MM/YYYY') AS FEC_NOTIF_DECLA,
             TO_CHAR(MDET.AUDFECCREACION,'DD/MM/YYYY') AS FEC_GEN_INSTANCIA,
             MULT.NRO_EXP_ADMINISTRATIVO AS NRO_EXPED_ADMIN,
             MDET.NRO_EXP_NIVEL AS NRO_EXPED_ANTIGUO,
             MULT.ID_MATERIA AS ID_MATERIA
        FROM T_SCOB_MULTA MULT
       INNER JOIN T_SCOB_MULTA_DETAL MDET
          ON MDET.ID_MULTA = MULT.ID_MULTA
         AND MDET.FLG_ACTUAL = '1'
         AND MDET.ESTADO = '1'
       INNER JOIN T_SCOB_ORGANO_RESOLUTIVO ORGR
          ON ORGR.ID_ORGANO_RESOLUTIVO = MDET.ID_ORGANO_RESOLUTIVO
       INNER JOIN T_SCOB_TABLA_DET EST_MULT
          ON EST_MULT.ID_TABLA = 5
         AND EST_MULT.COD_INTERNO = MDET.ESTADO_MULTA
       INNER JOIN T_SCOB_USUARIO USU
          ON USU.ID_USUARIO = MDET.ID_USUARIO_INGRESO
       INNER JOIN T_SCOB_USUARIO_OR USOR
          ON USOR.ID_USUARIO = USU.ID_USUARIO
          AND USOR.Estado = 1
       
       INNER JOIN t_scob_materia MATE
          ON MATE.ID_MATERIA = MULT.ID_MATERIA
       INNER JOIN T_SCOB_TIPO_PROCEDIMIENTO TIPO_PROC
          ON TIPO_PROC.ID_TIPO_PROCEDIMIENTO = MATE.ID_TIPO_PROCEDIMIENTO
          
       LEFT JOIN t_scob_are_cob_org_resol AREA
          ON AREA.ID_ORGANO_RESOLUTIVO = USOR.ID_ORGANO_RESOLUTIVO
       WHERE MULT.ESTADO = '1'
         AND (
               (ORGR.TIPO_INSTANCIA <> 3 --MULTAS QUE ESTEN EN OR/COMISION Y...
                AND 
                MDET.FEC_NOTIFICACION_DECLARACION IS NULL --NO TIENEN FECHA NOTIFICACION DECLARACION COMPLETA.
               )
               OR 
               (ORGR.TIPO_INSTANCIA = 3 --MULTAS QUE ESTEN EN SALA Y...
                 AND MDET.FEC_NOTIFICACION_RESOLUCION IS NULL --NO TIENEN FECHA DE NOTIFICACION COMPLETA.
               ) 
               OR 
               (MULT.NRO_FILE_AEC IS NULL --MULTAS QUE NO TIENEN FILE Y...
               --AND MULT.COD_ESTADO_PAGO IN (1,2)--CON PAGO: PENDIENTE O PARCIAL
                 AND MULT.SALDO > 0 --CON SALDO CAPITAL MAYOR A CERO. 19.04.2013
               ) 
               OR MULT.ESTADO_MULTA IN (4, 7) --MULTAS CON ESTADO APELADA Y EN REVISION.
             )
         AND (MULT.ID_MATERIA <> 11 AND MULT.ID_SUB_MATERIA <> 21)--EXCLUIR MULTAS ANTIDUMPING
         ---
         AND MDET.FEC_NOTIFICACION_RESOLUCION IS NULL
         
         AND (pi_vc_id_usuario IS NULL OR USU.Id_Usuario = pi_vc_id_usuario)
         
         AND (pi_vc_cum_ini IS NULL OR TO_NUMBER(MULT.ANIO || MULT.CUM) >= TO_NUMBER(pi_vc_cum_ini))
         AND (pi_vc_cum_fin IS NULL OR TO_NUMBER(MULT.ANIO || MULT.CUM) <= TO_NUMBER(pi_vc_cum_fin))
         
         AND (pi_vc_fec_gen_cum_ini IS NULL OR TO_DATE(TO_CHAR(MDET.FEC_RESOLUCION,'DD/MM/YYYY'),'DD/MM/YYYY') >= pi_vc_fec_gen_cum_ini)
         AND (pi_vc_fec_gen_cum_fin IS NULL OR TO_DATE(TO_CHAR(MDET.FEC_RESOLUCION,'DD/MM/YYYY'),'DD/MM/YYYY') <= pi_vc_fec_gen_cum_fin);
                                  
END;

PROCEDURE SCOB_SP_GET_MULTA_AVANZADA_FRACC
/*
-----------------------------------------------------------
-- AUTOR        : CROJAS
-- CREADO       : 07.12.20722
-- PROPOSITO    : REPORTE 1
-----------------------------------------------------------
*/
(
   PIN_VC_CUM          IN VARCHAR2,
   POUT_CU_RETORNO               OUT CU_REC_SET
)
IS
BEGIN

  OPEN POUT_CU_RETORNO FOR
  SELECT MULT.ID_MULTA,
         MULT.ANIO || MULT.CUM AS CUM,
         NVL(MDET.VALOR_UIT, 0) AS VALOR_UIT,
         MULT.MONTO_UIT AS MONTO_UIT,
         MDET.NRO_EXP_NIVEL AS NRO_EXPEDIENTE_ADMINISTRATIVO,
         MDET.NRO_RESOLUCION,
         MDET.FEC_RESOLUCION,
         EXPE.ANIO || EXPE.NRO_EXPEDIENTE AS NRO_EXPED_COB
    FROM T_SCOB_MULTA MULT
   INNER JOIN T_SCOB_MULTA_DETAL MDET
      ON MDET.ID_MULTA = MULT.ID_MULTA
     AND MDET.FLG_ACTUAL = '1'
     AND MDET.ESTADO = '1'

    LEFT JOIN T_SCOB_EXPEDIENTE_MULTA EXMU
      ON EXMU.ID_MULTA = MULT.ID_MULTA
     AND EXMU.ESTADO = '1'

    LEFT JOIN T_SCOB_EXPEDIENTE EXPE
      ON EXPE.ID_EXPEDIENTE = EXMU.ID_EXPEDIENTE
     AND EXPE.ESTADO = '1'

   WHERE MULT.ANIO || MULT.CUM = PIN_VC_CUM;

END;

PROCEDURE SCOB_SP_GET_SANCIONADOS_FRACC
/*
-----------------------------------------------------------
-- AUTOR        : CROJAS
-- CREADO       : 07.12.20722
-- PROPOSITO    : REPORTE 2
-----------------------------------------------------------
*/
(
   PIN_NU_ID_MULTA          IN NUMBER,
   POUT_CU_RETORNO               OUT CU_REC_SET
)
IS
BEGIN

  OPEN POUT_CU_RETORNO FOR
  SELECT MULT.ID_MULTA,
         MDET.ID_MULTA_DETAL,
         MSAN.ID_MULTA_SANCIONADO,
         MSAN.ID_PERSONA,
         RTRIM(TRIM(DECODE(PERS.TIPO_PERSONA,
                           2,
                           PERS.RAZON_SOCIAL,
                           PERS.APE_PATERNO || ' ' || PERS.APE_MATERNO || ' ' ||
                           PERS.PRI_NOMBRE || ' ' || PERS.SEG_NOMBRE || ' ' ||
                           PERS.APE_CASADA))) AS NOM_SANCIONADO,
         PERS.TIPO_DOC,
         TD.TXT_DESCRIPCION AS TIPO_DOC_IDENTIDAD,
         --DECODE(PERS.TIPO_PERSONA, 2, DECODE(PERS.NRO_RUC,NULL,PERS.NRO_DOC),PERS.NRO_DOC) AS NRO_DOC_IDENTIDAD,
         DECODE(PERS.TIPO_PERSONA, 2, PERS.NRO_RUC, PERS.NRO_DOC) AS NRO_DOC_IDENTIDAD,
         --DECODE(PERS.TIPO_PERSONA, 2, DECODE(PERS.NRO_RUC,NULL,PERS.NRO_DOC,PERS.NRO_RUC),PERS.NRO_DOC) AS NRO_DOC_IDENTIDAD,
         PERS.TIPO_PERSONA AS TIPO_PERSONA 
    FROM T_SCOB_MULTA_DETAL MDET
   INNER JOIN T_SCOB_MULTA_SANCIONADO MSAN
      ON MSAN.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL
     AND MSAN.ESTADO = '1'
     AND NVL(MSAN.COD_TIPO_PERSONA, '') = '1'
   INNER JOIN T_SCOB_PERSONA PERS
      ON PERS.ID_PERSONA = MSAN.ID_PERSONA
   INNER JOIN T_SCOB_TABLA_DET TD
      ON TD.ID_TABLA = 10
     AND TD.COD_INTERNO = PERS.TIPO_DOC --TIPO DOCUMENTO DE IDENTIDAD
    LEFT JOIN T_SCOB_TABLA_DET TD1
      ON TD1.ID_TABLA = 11
     AND TD1.COD_INTERNO = PERS.TIPO_PERSONA --TIPO_PERSONA
   INNER JOIN USR_SICOB.T_SCOB_MULTA MULT
      ON (MULT.ID_MULTA = MDET.ID_MULTA)
   WHERE MDET.FLG_ACTUAL = '1'
     AND MULT.ID_MULTA = PIN_NU_ID_MULTA;

END;

  FUNCTION F_NU_VALIDAR_PARTIDA(PIN_VC_REGISTRO_JURIDICO  IN VARCHAR2,
                                PIN_VC_ZONA_REGISTRAL     IN VARCHAR2,
                                PIN_VC_OFICINA_REGISTRAL  IN VARCHAR2,
                                PIN_VC_NUMERO  IN VARCHAR2) RETURN NUMBER IS
    V_NU_FLAG_RESULTADO      NUMBER;
    V_CUR_ASIENTOS           SYS_REFCURSOR;
    V_VC_TRANSACCION         VARCHAR2(50);
    V_NU_TOTAL_PAG           NUMBER;
  BEGIN
    BEGIN
       V_NU_TOTAL_PAG := 0;
       USR_PIDE.PKG_CONSULTA.SP_CONSULTA_SUNARP_ASIENTOS(PIN_VC_ZONA_REGISTRAL, PIN_VC_OFICINA_REGISTRAL, PIN_VC_NUMERO, PIN_VC_REGISTRO_JURIDICO, V_VC_TRANSACCION, V_NU_TOTAL_PAG, V_CUR_ASIENTOS);
       V_NU_FLAG_RESULTADO := 0;
       
       ----V_NU_FLAG_RESULTADO := 1;--BORRAR

       IF (V_NU_TOTAL_PAG > 0) THEN
          DBMS_OUTPUT.put_line(V_NU_TOTAL_PAG);
          V_NU_FLAG_RESULTADO := 1;
       END IF;
    EXCEPTION
        WHEN OTHERS THEN
            V_NU_FLAG_RESULTADO:=-1;
    END;

    RETURN V_NU_FLAG_RESULTADO;
  END F_NU_VALIDAR_PARTIDA;
  
end SCOB_PK_CONSULTA;
/
