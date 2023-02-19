PL/SQL Developer Test script 3.0
138
begin
  -- Call the procedure
  SCOB_PK_COBRANZAS.scob_sp_s_multa_avanzada_aec(pi_v_area_macro => :pi_v_area_macro,
                                                 pi_v_cum_ini => :pi_v_cum_ini,
                                                 pi_v_cum_fin => :pi_v_cum_fin,
                                                 pi_v_fec_gen_cum_ini => :pi_v_fec_gen_cum_ini,
                                                 pi_v_fec_gen_cum_fin => :pi_v_fec_gen_cum_fin,
                                                 pi_v_id_sede => :pi_v_id_sede,
                                                 PI_V_ID_COD_DPTO_SEDE => :PI_V_ID_COD_DPTO_SEDE,
                                                 PI_V_ID_COD_PROV_SEDE => :PI_V_ID_COD_PROV_SEDE,
                                                 PI_V_ID_COD_DIST_SEDE => :PI_V_ID_COD_DIST_SEDE,
                                                 pi_v_id_org_resol => :pi_v_id_org_resol,
                                                 PI_V_ID_COD_DPTO_ORGR => :PI_V_ID_COD_DPTO_ORGR,
                                                 PI_V_ID_COD_PROV_ORGR => :PI_V_ID_COD_PROV_ORGR,
                                                 PI_V_ID_COD_DIST_ORGR => :PI_V_ID_COD_DIST_ORGR,
                                                 PI_V_ID_NRO_INSTANCIA => :PI_V_ID_NRO_INSTANCIA,
                                                 pi_v_id_materia => :pi_v_id_materia,
                                                 pi_v_id_sub_materia => :pi_v_id_sub_materia,
                                                 pi_v_nro_exp_unico_ini => :pi_v_nro_exp_unico_ini,
                                                 pi_v_nro_exp_unico_fin => :pi_v_nro_exp_unico_fin,
                                                 pi_v_nroExpAdm_nivel => :pi_v_nroExpAdm_nivel,
                                                 pi_v_nro_resol => :pi_v_nro_resol,
                                                 pi_v_fec_reso_or_ini => :pi_v_fec_reso_or_ini,
                                                 pi_v_fec_reso_or_fin => :pi_v_fec_reso_or_fin,
                                                 pi_v_fec_notifi_or_ini => :pi_v_fec_notifi_or_ini,
                                                 pi_v_fec_notifi_or_fin => :pi_v_fec_notifi_or_fin,
                                                 PI_V_FEC_GENERACION_SEC_INI => :PI_V_FEC_GENERACION_SEC_INI,
                                                 PI_V_FEC_GENERACION_SEC_FIN => :PI_V_FEC_GENERACION_SEC_FIN,
                                                 pi_v_fec_recepcion_aec_ini => :pi_v_fec_recepcion_aec_ini,
                                                 pi_v_fec_recepcion_aec_fin => :pi_v_fec_recepcion_aec_fin,
                                                 PI_V_ANIO_INGRESO_AEC_INI => :PI_V_ANIO_INGRESO_AEC_INI,
                                                 PI_V_ANIO_INGRESO_AEC_FIN => :PI_V_ANIO_INGRESO_AEC_FIN,
                                                 PI_V_NRO_INGRESO_AEC_INI => :PI_V_NRO_INGRESO_AEC_INI,
                                                 PI_V_NRO_INGRESO_AEC_FIN => :PI_V_NRO_INGRESO_AEC_FIN,
                                                 PI_V_ANIO_FILE_INI => :PI_V_ANIO_FILE_INI,
                                                 PI_V_ANIO_FILE_FIN => :PI_V_ANIO_FILE_FIN,
                                                 PI_V_NRO_FILE_INI => :PI_V_NRO_FILE_INI,
                                                 PI_V_NRO_FILE_FIN => :PI_V_NRO_FILE_FIN,
                                                 pi_v_fec_recepcion_file_ini => :pi_v_fec_recepcion_file_ini,
                                                 pi_v_fec_recepcion_file_fin => :pi_v_fec_recepcion_file_fin,
                                                 PI_N_VALOR_UIT_INI => :PI_N_VALOR_UIT_INI,
                                                 PI_N_VALOR_UIT_FIN => :PI_N_VALOR_UIT_FIN,
                                                 PI_N_MONTO_UIT_INI => :PI_N_MONTO_UIT_INI,
                                                 PI_N_MONTO_UIT_FIN => :PI_N_MONTO_UIT_FIN,
                                                 pi_n_saldo_ini => :pi_n_saldo_ini,
                                                 pi_n_saldo_fin => :pi_n_saldo_fin,
                                                 pi_v_id_tipo_multa => :pi_v_id_tipo_multa,
                                                 pi_v_cod_estado_multa_resol => :pi_v_cod_estado_multa_resol,
                                                 pi_v_cod_estado_pago => :pi_v_cod_estado_pago,
                                                 PI_V_FEC_ESTADO_MULTA_OR_INI => :PI_V_FEC_ESTADO_MULTA_OR_INI,
                                                 PI_V_FEC_ESTADO_MULTA_OR_FIN => :PI_V_FEC_ESTADO_MULTA_OR_FIN,
                                                 PI_V_FEC_ESTADO_MULTA_COB_INI => :PI_V_FEC_ESTADO_MULTA_COB_INI,
                                                 PI_V_FEC_ESTADO_MULTA_COB_FIN => :PI_V_FEC_ESTADO_MULTA_COB_FIN,
                                                 pi_v_cod_estado_multa_cob => :pi_v_cod_estado_multa_cob,
                                                 pi_v_cod_motivo_multa_cob => :pi_v_cod_motivo_multa_cob,
                                                 PI_V_IND_TIPO_PAGO => :PI_V_IND_TIPO_PAGO,
                                                 pi_c_flg_asocu_multa => :pi_c_flg_asocu_multa,
                                                 pi_v_cod_estado_exped_cob => :pi_v_cod_estado_exped_cob,
                                                 pi_v_anio => :pi_v_anio,
                                                 pi_v_nro_exp_cob_ini => :pi_v_nro_exp_cob_ini,
                                                 pi_v_nro_exp_cob_fin => :pi_v_nro_exp_cob_fin,
                                                 pi_v_fec_gen_exped_cob_ini => :pi_v_fec_gen_exped_cob_ini,
                                                 pi_v_fec_gen_exped_cob_fin => :pi_v_fec_gen_exped_cob_fin,
                                                 pi_v_gestor_cobranza => :pi_v_gestor_cobranza,
                                                 pi_v_fec_emi_rec_ini => :pi_v_fec_emi_rec_ini,
                                                 pi_v_fec_emi_rec_fin => :pi_v_fec_emi_rec_fin,
                                                 pi_v_fec_noti_rec_ini => :pi_v_fec_noti_rec_ini,
                                                 pi_v_fec_noti_rec_fin => :pi_v_fec_noti_rec_fin,
                                                 pi_v_cod_motivo_exped_cob => :pi_v_cod_motivo_exped_cob,
                                                 pi_v_fec_est_exped_cob_ini => :pi_v_fec_est_exped_cob_ini,
                                                 pi_v_fec_est_exped_cob_fin => :pi_v_fec_est_exped_cob_fin,
                                                 pi_v_num_env_arch_ini => :pi_v_num_env_arch_ini,
                                                 pi_v_num_env_arch_fin => :pi_v_num_env_arch_fin,
                                                 pi_v_fec_envi_arch_ini => :pi_v_fec_envi_arch_ini,
                                                 pi_v_fec_envi_arch_fin => :pi_v_fec_envi_arch_fin,
                                                 pi_v_nro_ofic_sunat_ini => :pi_v_nro_ofic_sunat_ini,
                                                 pi_v_nro_ofic_sunat_fin => :pi_v_nro_ofic_sunat_fin,
                                                 pi_n_dere_antiDump_ini => :pi_n_dere_antiDump_ini,
                                                 pi_n_dere_antiDump_fin => :pi_n_dere_antiDump_fin,
                                                 pi_v_nro_parti_ini => :pi_v_nro_parti_ini,
                                                 pi_v_nro_parti_fin => :pi_v_nro_parti_fin,
                                                 pi_v_nro_dua_ini => :pi_v_nro_dua_ini,
                                                 pi_v_nro_dua_fin => :pi_v_nro_dua_fin,
                                                 pi_v_nro_liq_cob_ini => :pi_v_nro_liq_cob_ini,
                                                 pi_v_nro_liq_cob_fin => :pi_v_nro_liq_cob_fin,
                                                 pi_v_id_intendencia => :pi_v_id_intendencia,
                                                 pi_c_flg_ind_embargo => :pi_c_flg_ind_embargo,
                                                 pi_v_fec_asig_gestor_ini => :pi_v_fec_asig_gestor_ini,
                                                 pi_v_fec_asig_gestor_fin => :pi_v_fec_asig_gestor_fin,
                                                 pi_v_fec_carta_precoactiva_ini => :pi_v_fec_carta_precoactiva_ini,
                                                 pi_v_fec_carta_precoactiva_fin => :pi_v_fec_carta_precoactiva_fin,
                                                 pi_v_id_expectativa_cobro => :pi_v_id_expectativa_cobro,
                                                 pi_v_d_codSanciona_ini => :pi_v_d_codSanciona_ini,
                                                 pi_v_d_codSanciona_fin => :pi_v_d_codSanciona_fin,
                                                 pi_i_d_tip_persona => :pi_i_d_tip_persona,
                                                 pi_v_d_razon_social => :pi_v_d_razon_social,
                                                 pi_v_d_ape_paterno => :pi_v_d_ape_paterno,
                                                 pi_v_d_ape_materno => :pi_v_d_ape_materno,
                                                 pi_v_d_ape_casada => :pi_v_d_ape_casada,
                                                 pi_v_d_pri_nombre => :pi_v_d_pri_nombre,
                                                 pi_v_d_seg_nombre => :pi_v_d_seg_nombre,
                                                 pi_i_d_tipo_doc => :pi_i_d_tipo_doc,
                                                 pi_v_d_nro_doc => :pi_v_d_nro_doc,
                                                 pi_i_d_tip_empresa => :pi_i_d_tip_empresa,
                                                 pi_n_d_id_sect_econo => :pi_n_d_id_sect_econo,
                                                 pi_c_d_flg_asocu => :pi_c_d_flg_asocu,
                                                 pi_c_d_fl_oficio => :pi_c_d_fl_oficio,
                                                 pi_v_do_codSanciona_ini => :pi_v_do_codSanciona_ini,
                                                 pi_v_do_codSanciona_fin => :pi_v_do_codSanciona_fin,
                                                 pi_i_do_tip_persona => :pi_i_do_tip_persona,
                                                 pi_v_do_razon_social => :pi_v_do_razon_social,
                                                 pi_v_do_ape_paterno => :pi_v_do_ape_paterno,
                                                 pi_v_do_ape_materno => :pi_v_do_ape_materno,
                                                 pi_v_do_ape_casada => :pi_v_do_ape_casada,
                                                 pi_v_do_pri_nombre => :pi_v_do_pri_nombre,
                                                 pi_v_do_seg_nombre => :pi_v_do_seg_nombre,
                                                 pi_i_do_tipo_doc => :pi_i_do_tipo_doc,
                                                 pi_v_do_nro_doc => :pi_v_do_nro_doc,
                                                 pi_i_do_tip_empresa => :pi_i_do_tip_empresa,
                                                 pi_n_do_id_sect_econo => :pi_n_do_id_sect_econo,
                                                 pi_c_do_flg_asocu => :pi_c_do_flg_asocu,
                                                 pi_v_s_codSanciona_ini => :pi_v_s_codSanciona_ini,
                                                 pi_v_s_codSanciona_fin => :pi_v_s_codSanciona_fin,
                                                 pi_i_s_tip_persona => :pi_i_s_tip_persona,
                                                 pi_v_s_razon_social => :pi_v_s_razon_social,
                                                 pi_v_s_ape_paterno => :pi_v_s_ape_paterno,
                                                 pi_v_s_ape_materno => :pi_v_s_ape_materno,
                                                 pi_v_s_ape_casada => :pi_v_s_ape_casada,
                                                 pi_v_s_pri_nombre => :pi_v_s_pri_nombre,
                                                 pi_v_s_seg_nombre => :pi_v_s_seg_nombre,
                                                 pi_i_s_tipo_doc => :pi_i_s_tipo_doc,
                                                 pi_v_s_nro_doc => :pi_v_s_nro_doc,
                                                 pi_i_s_tip_empresa => :pi_i_s_tip_empresa,
                                                 pi_n_s_id_sect_econo => :pi_n_s_id_sect_econo,
                                                 pi_c_s_flg_asocu => :pi_c_s_flg_asocu,
                                                 pi_c_s_flg_buscar_by_contenido => :pi_c_s_flg_buscar_by_contenido,
                                                 PO_CU_RETORNO => :PO_CU_RETORNO);
end;
135
pi_v_area_macro
0
5
pi_v_cum_ini
1
20230000002361
5
pi_v_cum_fin
1
20230000012364
5
pi_v_fec_gen_cum_ini
1
26/01/2022
5
pi_v_fec_gen_cum_fin
1
12/02/2023
5
pi_v_id_sede
0
5
PI_V_ID_COD_DPTO_SEDE
0
5
PI_V_ID_COD_PROV_SEDE
0
5
PI_V_ID_COD_DIST_SEDE
0
5
pi_v_id_org_resol
0
5
PI_V_ID_COD_DPTO_ORGR
0
5
PI_V_ID_COD_PROV_ORGR
0
5
PI_V_ID_COD_DIST_ORGR
0
5
PI_V_ID_NRO_INSTANCIA
0
5
pi_v_id_materia
0
5
pi_v_id_sub_materia
0
5
pi_v_nro_exp_unico_ini
0
5
pi_v_nro_exp_unico_fin
0
5
pi_v_nroExpAdm_nivel
0
5
pi_v_nro_resol
0
5
pi_v_fec_reso_or_ini
0
5
pi_v_fec_reso_or_fin
0
5
pi_v_fec_notifi_or_ini
0
5
pi_v_fec_notifi_or_fin
0
5
PI_V_FEC_GENERACION_SEC_INI
0
5
PI_V_FEC_GENERACION_SEC_FIN
0
5
pi_v_fec_recepcion_aec_ini
0
5
pi_v_fec_recepcion_aec_fin
0
5
PI_V_ANIO_INGRESO_AEC_INI
0
5
PI_V_ANIO_INGRESO_AEC_FIN
0
5
PI_V_NRO_INGRESO_AEC_INI
0
5
PI_V_NRO_INGRESO_AEC_FIN
0
5
PI_V_ANIO_FILE_INI
0
5
PI_V_ANIO_FILE_FIN
0
5
PI_V_NRO_FILE_INI
0
5
PI_V_NRO_FILE_FIN
0
5
pi_v_fec_recepcion_file_ini
0
5
pi_v_fec_recepcion_file_fin
0
5
PI_N_VALOR_UIT_INI
0
4
PI_N_VALOR_UIT_FIN
0
4
PI_N_MONTO_UIT_INI
0
4
PI_N_MONTO_UIT_FIN
0
4
pi_n_saldo_ini
0
4
pi_n_saldo_fin
0
4
pi_v_id_tipo_multa
0
5
pi_v_cod_estado_multa_resol
0
5
pi_v_cod_estado_pago
0
5
PI_V_FEC_ESTADO_MULTA_OR_INI
0
5
PI_V_FEC_ESTADO_MULTA_OR_FIN
0
5
PI_V_FEC_ESTADO_MULTA_COB_INI
0
5
PI_V_FEC_ESTADO_MULTA_COB_FIN
0
5
pi_v_cod_estado_multa_cob
0
5
pi_v_cod_motivo_multa_cob
0
5
PI_V_IND_TIPO_PAGO
0
5
pi_c_flg_asocu_multa
0
5
pi_v_cod_estado_exped_cob
0
5
pi_v_anio
0
5
pi_v_nro_exp_cob_ini
0
5
pi_v_nro_exp_cob_fin
0
5
pi_v_fec_gen_exped_cob_ini
0
5
pi_v_fec_gen_exped_cob_fin
0
5
pi_v_gestor_cobranza
0
5
pi_v_fec_emi_rec_ini
0
5
pi_v_fec_emi_rec_fin
0
5
pi_v_fec_noti_rec_ini
0
5
pi_v_fec_noti_rec_fin
0
5
pi_v_cod_motivo_exped_cob
0
5
pi_v_fec_est_exped_cob_ini
0
5
pi_v_fec_est_exped_cob_fin
0
5
pi_v_num_env_arch_ini
0
5
pi_v_num_env_arch_fin
0
5
pi_v_fec_envi_arch_ini
0
5
pi_v_fec_envi_arch_fin
0
5
pi_v_nro_ofic_sunat_ini
0
5
pi_v_nro_ofic_sunat_fin
0
5
pi_n_dere_antiDump_ini
0
4
pi_n_dere_antiDump_fin
0
4
pi_v_nro_parti_ini
0
5
pi_v_nro_parti_fin
0
5
pi_v_nro_dua_ini
0
5
pi_v_nro_dua_fin
0
5
pi_v_nro_liq_cob_ini
0
5
pi_v_nro_liq_cob_fin
0
5
pi_v_id_intendencia
0
5
pi_c_flg_ind_embargo
0
5
pi_v_fec_asig_gestor_ini
0
5
pi_v_fec_asig_gestor_fin
0
5
pi_v_fec_carta_precoactiva_ini
0
5
pi_v_fec_carta_precoactiva_fin
0
5
pi_v_id_expectativa_cobro
0
5
pi_v_d_codSanciona_ini
0
5
pi_v_d_codSanciona_fin
0
5
pi_i_d_tip_persona
0
4
pi_v_d_razon_social
0
5
pi_v_d_ape_paterno
0
5
pi_v_d_ape_materno
0
5
pi_v_d_ape_casada
0
5
pi_v_d_pri_nombre
0
5
pi_v_d_seg_nombre
0
5
pi_i_d_tipo_doc
0
4
pi_v_d_nro_doc
0
5
pi_i_d_tip_empresa
0
4
pi_n_d_id_sect_econo
0
4
pi_c_d_flg_asocu
0
5
pi_c_d_fl_oficio
0
5
pi_v_do_codSanciona_ini
0
5
pi_v_do_codSanciona_fin
0
5
pi_i_do_tip_persona
0
4
pi_v_do_razon_social
0
5
pi_v_do_ape_paterno
0
5
pi_v_do_ape_materno
0
5
pi_v_do_ape_casada
0
5
pi_v_do_pri_nombre
0
5
pi_v_do_seg_nombre
0
5
pi_i_do_tipo_doc
0
4
pi_v_do_nro_doc
0
5
pi_i_do_tip_empresa
0
4
pi_n_do_id_sect_econo
0
4
pi_c_do_flg_asocu
0
5
pi_v_s_codSanciona_ini
0
5
pi_v_s_codSanciona_fin
0
5
pi_i_s_tip_persona
0
4
pi_v_s_razon_social
0
5
pi_v_s_ape_paterno
0
5
pi_v_s_ape_materno
0
5
pi_v_s_ape_casada
0
5
pi_v_s_pri_nombre
0
5
pi_v_s_seg_nombre
0
5
pi_i_s_tipo_doc
0
4
pi_v_s_nro_doc
0
5
pi_i_s_tip_empresa
0
4
pi_n_s_id_sect_econo
0
4
pi_c_s_flg_asocu
0
5
pi_c_s_flg_buscar_by_contenido
0
5
PO_CU_RETORNO
1
<Cursor>
116
0
