PL/SQL Developer Test script 3.0
138
begin
  -- Call the procedure
  PKG_CONSULTA_AVANZADA.SCOB_SP_S_MULTA_AVANZADA_AEC(PI_V_AREA_MACRO => :PI_V_AREA_MACRO,
                                                     PI_V_CUM_INI => :PI_V_CUM_INI,
                                                     PI_V_CUM_FIN => :PI_V_CUM_FIN,
                                                     PI_V_FEC_GEN_CUM_INI => :PI_V_FEC_GEN_CUM_INI,
                                                     PI_V_FEC_GEN_CUM_FIN => :PI_V_FEC_GEN_CUM_FIN,
                                                     PI_V_ID_SEDE => :PI_V_ID_SEDE,
                                                     PI_V_ID_COD_DPTO_SEDE => :PI_V_ID_COD_DPTO_SEDE,
                                                     PI_V_ID_COD_PROV_SEDE => :PI_V_ID_COD_PROV_SEDE,
                                                     PI_V_ID_COD_DIST_SEDE => :PI_V_ID_COD_DIST_SEDE,
                                                     PI_V_ID_ORG_RESOL => :PI_V_ID_ORG_RESOL,
                                                     PI_V_ID_COD_DPTO_ORGR => :PI_V_ID_COD_DPTO_ORGR,
                                                     PI_V_ID_COD_PROV_ORGR => :PI_V_ID_COD_PROV_ORGR,
                                                     PI_V_ID_COD_DIST_ORGR => :PI_V_ID_COD_DIST_ORGR,
                                                     PI_V_ID_NRO_INSTANCIA => :PI_V_ID_NRO_INSTANCIA,
                                                     PI_V_ID_MATERIA => :PI_V_ID_MATERIA,
                                                     PI_V_ID_SUB_MATERIA => :PI_V_ID_SUB_MATERIA,
                                                     PI_V_NRO_EXP_UNICO_INI => :PI_V_NRO_EXP_UNICO_INI,
                                                     PI_V_NRO_EXP_UNICO_FIN => :PI_V_NRO_EXP_UNICO_FIN,
                                                     PI_V_NROEXPADM_NIVEL => :PI_V_NROEXPADM_NIVEL,
                                                     PI_V_NRO_RESOL => :PI_V_NRO_RESOL,
                                                     PI_V_FEC_RESO_OR_INI => :PI_V_FEC_RESO_OR_INI,
                                                     PI_V_FEC_RESO_OR_FIN => :PI_V_FEC_RESO_OR_FIN,
                                                     PI_V_FEC_NOTIFI_OR_INI => :PI_V_FEC_NOTIFI_OR_INI,
                                                     PI_V_FEC_NOTIFI_OR_FIN => :PI_V_FEC_NOTIFI_OR_FIN,
                                                     PI_V_FEC_GENERACION_SEC_INI => :PI_V_FEC_GENERACION_SEC_INI,
                                                     PI_V_FEC_GENERACION_SEC_FIN => :PI_V_FEC_GENERACION_SEC_FIN,
                                                     PI_V_FEC_RECEPCION_AEC_INI => :PI_V_FEC_RECEPCION_AEC_INI,
                                                     PI_V_FEC_RECEPCION_AEC_FIN => :PI_V_FEC_RECEPCION_AEC_FIN,
                                                     PI_V_ANIO_INGRESO_AEC_INI => :PI_V_ANIO_INGRESO_AEC_INI,
                                                     PI_V_ANIO_INGRESO_AEC_FIN => :PI_V_ANIO_INGRESO_AEC_FIN,
                                                     PI_V_NRO_INGRESO_AEC_INI => :PI_V_NRO_INGRESO_AEC_INI,
                                                     PI_V_NRO_INGRESO_AEC_FIN => :PI_V_NRO_INGRESO_AEC_FIN,
                                                     PI_V_ANIO_FILE_INI => :PI_V_ANIO_FILE_INI,
                                                     PI_V_ANIO_FILE_FIN => :PI_V_ANIO_FILE_FIN,
                                                     PI_V_NRO_FILE_INI => :PI_V_NRO_FILE_INI,
                                                     PI_V_NRO_FILE_FIN => :PI_V_NRO_FILE_FIN,
                                                     PI_V_FEC_RECEPCION_FILE_INI => :PI_V_FEC_RECEPCION_FILE_INI,
                                                     PI_V_FEC_RECEPCION_FILE_FIN => :PI_V_FEC_RECEPCION_FILE_FIN,
                                                     PI_N_VALOR_UIT_INI => :PI_N_VALOR_UIT_INI,
                                                     PI_N_VALOR_UIT_FIN => :PI_N_VALOR_UIT_FIN,
                                                     PI_N_MONTO_UIT_INI => :PI_N_MONTO_UIT_INI,
                                                     PI_N_MONTO_UIT_FIN => :PI_N_MONTO_UIT_FIN,
                                                     PI_N_SALDO_INI => :PI_N_SALDO_INI,
                                                     PI_N_SALDO_FIN => :PI_N_SALDO_FIN,
                                                     PI_V_ID_TIPO_MULTA => :PI_V_ID_TIPO_MULTA,
                                                     PI_V_COD_ESTADO_MULTA_RESOL => :PI_V_COD_ESTADO_MULTA_RESOL,
                                                     PI_V_COD_ESTADO_PAGO => :PI_V_COD_ESTADO_PAGO,
                                                     PI_V_FEC_ESTADO_MULTA_OR_INI => :PI_V_FEC_ESTADO_MULTA_OR_INI,
                                                     PI_V_FEC_ESTADO_MULTA_OR_FIN => :PI_V_FEC_ESTADO_MULTA_OR_FIN,
                                                     PI_V_FEC_ESTADO_MULTA_COB_INI => :PI_V_FEC_ESTADO_MULTA_COB_INI,
                                                     PI_V_FEC_ESTADO_MULTA_COB_FIN => :PI_V_FEC_ESTADO_MULTA_COB_FIN,
                                                     PI_V_COD_ESTADO_MULTA_COB => :PI_V_COD_ESTADO_MULTA_COB,
                                                     PI_V_COD_MOTIVO_MULTA_COB => :PI_V_COD_MOTIVO_MULTA_COB,
                                                     PI_V_IND_TIPO_PAGO => :PI_V_IND_TIPO_PAGO,
                                                     PI_C_FLG_ASOCU_MULTA => :PI_C_FLG_ASOCU_MULTA,
                                                     PI_V_COD_ESTADO_EXPED_COB => :PI_V_COD_ESTADO_EXPED_COB,
                                                     PI_V_ANIO => :PI_V_ANIO,
                                                     PI_V_NRO_EXP_COB_INI => :PI_V_NRO_EXP_COB_INI,
                                                     PI_V_NRO_EXP_COB_FIN => :PI_V_NRO_EXP_COB_FIN,
                                                     PI_V_FEC_GEN_EXPED_COB_INI => :PI_V_FEC_GEN_EXPED_COB_INI,
                                                     PI_V_FEC_GEN_EXPED_COB_FIN => :PI_V_FEC_GEN_EXPED_COB_FIN,
                                                     PI_V_GESTOR_COBRANZA => :PI_V_GESTOR_COBRANZA,
                                                     PI_V_FEC_EMI_REC_INI => :PI_V_FEC_EMI_REC_INI,
                                                     PI_V_FEC_EMI_REC_FIN => :PI_V_FEC_EMI_REC_FIN,
                                                     PI_V_FEC_NOTI_REC_INI => :PI_V_FEC_NOTI_REC_INI,
                                                     PI_V_FEC_NOTI_REC_FIN => :PI_V_FEC_NOTI_REC_FIN,
                                                     PI_V_COD_MOTIVO_EXPED_COB => :PI_V_COD_MOTIVO_EXPED_COB,
                                                     PI_V_FEC_EST_EXPED_COB_INI => :PI_V_FEC_EST_EXPED_COB_INI,
                                                     PI_V_FEC_EST_EXPED_COB_FIN => :PI_V_FEC_EST_EXPED_COB_FIN,
                                                     PI_V_NUM_ENV_ARCH_INI => :PI_V_NUM_ENV_ARCH_INI,
                                                     PI_V_NUM_ENV_ARCH_FIN => :PI_V_NUM_ENV_ARCH_FIN,
                                                     PI_V_FEC_ENVI_ARCH_INI => :PI_V_FEC_ENVI_ARCH_INI,
                                                     PI_V_FEC_ENVI_ARCH_FIN => :PI_V_FEC_ENVI_ARCH_FIN,
                                                     PI_V_NRO_OFIC_SUNAT_INI => :PI_V_NRO_OFIC_SUNAT_INI,
                                                     PI_V_NRO_OFIC_SUNAT_FIN => :PI_V_NRO_OFIC_SUNAT_FIN,
                                                     PI_N_DERE_ANTIDUMP_INI => :PI_N_DERE_ANTIDUMP_INI,
                                                     PI_N_DERE_ANTIDUMP_FIN => :PI_N_DERE_ANTIDUMP_FIN,
                                                     PI_V_NRO_PARTI_INI => :PI_V_NRO_PARTI_INI,
                                                     PI_V_NRO_PARTI_FIN => :PI_V_NRO_PARTI_FIN,
                                                     PI_V_NRO_DUA_INI => :PI_V_NRO_DUA_INI,
                                                     PI_V_NRO_DUA_FIN => :PI_V_NRO_DUA_FIN,
                                                     PI_V_NRO_LIQ_COB_INI => :PI_V_NRO_LIQ_COB_INI,
                                                     PI_V_NRO_LIQ_COB_FIN => :PI_V_NRO_LIQ_COB_FIN,
                                                     PI_V_ID_INTENDENCIA => :PI_V_ID_INTENDENCIA,
                                                     PI_C_FLG_IND_EMBARGO => :PI_C_FLG_IND_EMBARGO,
                                                     PI_V_FEC_ASIG_GESTOR_INI => :PI_V_FEC_ASIG_GESTOR_INI,
                                                     PI_V_FEC_ASIG_GESTOR_FIN => :PI_V_FEC_ASIG_GESTOR_FIN,
                                                     PI_V_FEC_CARTA_PRECOACTIVA_INI => :PI_V_FEC_CARTA_PRECOACTIVA_INI,
                                                     PI_V_FEC_CARTA_PRECOACTIVA_FIN => :PI_V_FEC_CARTA_PRECOACTIVA_FIN,
                                                     PI_V_ID_EXPECTATIVA_COBRO => :PI_V_ID_EXPECTATIVA_COBRO,
                                                     PI_V_D_CODSANCIONA_INI => :PI_V_D_CODSANCIONA_INI,
                                                     PI_V_D_CODSANCIONA_FIN => :PI_V_D_CODSANCIONA_FIN,
                                                     PI_I_D_TIP_PERSONA => :PI_I_D_TIP_PERSONA,
                                                     PI_V_D_RAZON_SOCIAL => :PI_V_D_RAZON_SOCIAL,
                                                     PI_V_D_APE_PATERNO => :PI_V_D_APE_PATERNO,
                                                     PI_V_D_APE_MATERNO => :PI_V_D_APE_MATERNO,
                                                     PI_V_D_APE_CASADA => :PI_V_D_APE_CASADA,
                                                     PI_V_D_PRI_NOMBRE => :PI_V_D_PRI_NOMBRE,
                                                     PI_V_D_SEG_NOMBRE => :PI_V_D_SEG_NOMBRE,
                                                     PI_I_D_TIPO_DOC => :PI_I_D_TIPO_DOC,
                                                     PI_V_D_NRO_DOC => :PI_V_D_NRO_DOC,
                                                     PI_I_D_TIP_EMPRESA => :PI_I_D_TIP_EMPRESA,
                                                     PI_N_D_ID_SECT_ECONO => :PI_N_D_ID_SECT_ECONO,
                                                     PI_C_D_FLG_ASOCU => :PI_C_D_FLG_ASOCU,
                                                     PI_C_D_FL_OFICIO => :PI_C_D_FL_OFICIO,
                                                     PI_V_DO_CODSANCIONA_INI => :PI_V_DO_CODSANCIONA_INI,
                                                     PI_V_DO_CODSANCIONA_FIN => :PI_V_DO_CODSANCIONA_FIN,
                                                     PI_I_DO_TIP_PERSONA => :PI_I_DO_TIP_PERSONA,
                                                     PI_V_DO_RAZON_SOCIAL => :PI_V_DO_RAZON_SOCIAL,
                                                     PI_V_DO_APE_PATERNO => :PI_V_DO_APE_PATERNO,
                                                     PI_V_DO_APE_MATERNO => :PI_V_DO_APE_MATERNO,
                                                     PI_V_DO_APE_CASADA => :PI_V_DO_APE_CASADA,
                                                     PI_V_DO_PRI_NOMBRE => :PI_V_DO_PRI_NOMBRE,
                                                     PI_V_DO_SEG_NOMBRE => :PI_V_DO_SEG_NOMBRE,
                                                     PI_I_DO_TIPO_DOC => :PI_I_DO_TIPO_DOC,
                                                     PI_V_DO_NRO_DOC => :PI_V_DO_NRO_DOC,
                                                     PI_I_DO_TIP_EMPRESA => :PI_I_DO_TIP_EMPRESA,
                                                     PI_N_DO_ID_SECT_ECONO => :PI_N_DO_ID_SECT_ECONO,
                                                     PI_C_DO_FLG_ASOCU => :PI_C_DO_FLG_ASOCU,
                                                     PI_V_S_CODSANCIONA_INI => :PI_V_S_CODSANCIONA_INI,
                                                     PI_V_S_CODSANCIONA_FIN => :PI_V_S_CODSANCIONA_FIN,
                                                     PI_I_S_TIP_PERSONA => :PI_I_S_TIP_PERSONA,
                                                     PI_V_S_RAZON_SOCIAL => :PI_V_S_RAZON_SOCIAL,
                                                     PI_V_S_APE_PATERNO => :PI_V_S_APE_PATERNO,
                                                     PI_V_S_APE_MATERNO => :PI_V_S_APE_MATERNO,
                                                     PI_V_S_APE_CASADA => :PI_V_S_APE_CASADA,
                                                     PI_V_S_PRI_NOMBRE => :PI_V_S_PRI_NOMBRE,
                                                     PI_V_S_SEG_NOMBRE => :PI_V_S_SEG_NOMBRE,
                                                     PI_I_S_TIPO_DOC => :PI_I_S_TIPO_DOC,
                                                     PI_V_S_NRO_DOC => :PI_V_S_NRO_DOC,
                                                     PI_I_S_TIP_EMPRESA => :PI_I_S_TIP_EMPRESA,
                                                     PI_N_S_ID_SECT_ECONO => :PI_N_S_ID_SECT_ECONO,
                                                     PI_C_S_FLG_ASOCU => :PI_C_S_FLG_ASOCU,
                                                     PI_C_S_FLG_BUSCAR_BY_CONTENIDO => :PI_C_S_FLG_BUSCAR_BY_CONTENIDO,
                                                     PO_CU_RETORNO => :PO_CU_RETORNO);
end;
135
PI_V_AREA_MACRO
0
5
PI_V_CUM_INI
0
5
PI_V_CUM_FIN
0
5
PI_V_FEC_GEN_CUM_INI
1
01/01/2023
5
PI_V_FEC_GEN_CUM_FIN
1
22/02/2023
5
PI_V_ID_SEDE
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
PI_V_ID_ORG_RESOL
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
PI_V_ID_MATERIA
0
5
PI_V_ID_SUB_MATERIA
0
5
PI_V_NRO_EXP_UNICO_INI
0
5
PI_V_NRO_EXP_UNICO_FIN
0
5
PI_V_NROEXPADM_NIVEL
0
5
PI_V_NRO_RESOL
0
5
PI_V_FEC_RESO_OR_INI
0
5
PI_V_FEC_RESO_OR_FIN
0
5
PI_V_FEC_NOTIFI_OR_INI
0
5
PI_V_FEC_NOTIFI_OR_FIN
0
5
PI_V_FEC_GENERACION_SEC_INI
0
5
PI_V_FEC_GENERACION_SEC_FIN
0
5
PI_V_FEC_RECEPCION_AEC_INI
0
5
PI_V_FEC_RECEPCION_AEC_FIN
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
PI_V_FEC_RECEPCION_FILE_INI
0
5
PI_V_FEC_RECEPCION_FILE_FIN
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
PI_N_SALDO_INI
0
4
PI_N_SALDO_FIN
0
4
PI_V_ID_TIPO_MULTA
0
5
PI_V_COD_ESTADO_MULTA_RESOL
0
5
PI_V_COD_ESTADO_PAGO
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
PI_V_COD_ESTADO_MULTA_COB
0
5
PI_V_COD_MOTIVO_MULTA_COB
0
5
PI_V_IND_TIPO_PAGO
0
5
PI_C_FLG_ASOCU_MULTA
0
5
PI_V_COD_ESTADO_EXPED_COB
0
5
PI_V_ANIO
0
5
PI_V_NRO_EXP_COB_INI
0
5
PI_V_NRO_EXP_COB_FIN
0
5
PI_V_FEC_GEN_EXPED_COB_INI
0
5
PI_V_FEC_GEN_EXPED_COB_FIN
0
5
PI_V_GESTOR_COBRANZA
0
5
PI_V_FEC_EMI_REC_INI
0
5
PI_V_FEC_EMI_REC_FIN
0
5
PI_V_FEC_NOTI_REC_INI
0
5
PI_V_FEC_NOTI_REC_FIN
0
5
PI_V_COD_MOTIVO_EXPED_COB
0
5
PI_V_FEC_EST_EXPED_COB_INI
0
5
PI_V_FEC_EST_EXPED_COB_FIN
0
5
PI_V_NUM_ENV_ARCH_INI
0
5
PI_V_NUM_ENV_ARCH_FIN
0
5
PI_V_FEC_ENVI_ARCH_INI
0
5
PI_V_FEC_ENVI_ARCH_FIN
0
5
PI_V_NRO_OFIC_SUNAT_INI
0
5
PI_V_NRO_OFIC_SUNAT_FIN
0
5
PI_N_DERE_ANTIDUMP_INI
0
4
PI_N_DERE_ANTIDUMP_FIN
0
4
PI_V_NRO_PARTI_INI
0
5
PI_V_NRO_PARTI_FIN
0
5
PI_V_NRO_DUA_INI
0
5
PI_V_NRO_DUA_FIN
0
5
PI_V_NRO_LIQ_COB_INI
0
5
PI_V_NRO_LIQ_COB_FIN
0
5
PI_V_ID_INTENDENCIA
0
5
PI_C_FLG_IND_EMBARGO
0
5
PI_V_FEC_ASIG_GESTOR_INI
0
5
PI_V_FEC_ASIG_GESTOR_FIN
0
5
PI_V_FEC_CARTA_PRECOACTIVA_INI
0
5
PI_V_FEC_CARTA_PRECOACTIVA_FIN
0
5
PI_V_ID_EXPECTATIVA_COBRO
0
5
PI_V_D_CODSANCIONA_INI
0
5
PI_V_D_CODSANCIONA_FIN
0
5
PI_I_D_TIP_PERSONA
0
4
PI_V_D_RAZON_SOCIAL
0
5
PI_V_D_APE_PATERNO
0
5
PI_V_D_APE_MATERNO
0
5
PI_V_D_APE_CASADA
0
5
PI_V_D_PRI_NOMBRE
0
5
PI_V_D_SEG_NOMBRE
0
5
PI_I_D_TIPO_DOC
0
4
PI_V_D_NRO_DOC
0
5
PI_I_D_TIP_EMPRESA
0
4
PI_N_D_ID_SECT_ECONO
0
4
PI_C_D_FLG_ASOCU
0
5
PI_C_D_FL_OFICIO
0
5
PI_V_DO_CODSANCIONA_INI
0
5
PI_V_DO_CODSANCIONA_FIN
0
5
PI_I_DO_TIP_PERSONA
0
4
PI_V_DO_RAZON_SOCIAL
0
5
PI_V_DO_APE_PATERNO
0
5
PI_V_DO_APE_MATERNO
0
5
PI_V_DO_APE_CASADA
0
5
PI_V_DO_PRI_NOMBRE
0
5
PI_V_DO_SEG_NOMBRE
0
5
PI_I_DO_TIPO_DOC
0
4
PI_V_DO_NRO_DOC
0
5
PI_I_DO_TIP_EMPRESA
0
4
PI_N_DO_ID_SECT_ECONO
0
4
PI_C_DO_FLG_ASOCU
0
5
PI_V_S_CODSANCIONA_INI
0
5
PI_V_S_CODSANCIONA_FIN
0
5
PI_I_S_TIP_PERSONA
0
4
PI_V_S_RAZON_SOCIAL
0
5
PI_V_S_APE_PATERNO
0
5
PI_V_S_APE_MATERNO
0
5
PI_V_S_APE_CASADA
0
5
PI_V_S_PRI_NOMBRE
0
5
PI_V_S_SEG_NOMBRE
0
5
PI_I_S_TIPO_DOC
0
4
PI_V_S_NRO_DOC
0
5
PI_I_S_TIP_EMPRESA
0
4
PI_N_S_ID_SECT_ECONO
0
4
PI_C_S_FLG_ASOCU
0
5
PI_C_S_FLG_BUSCAR_BY_CONTENIDO
0
5
PO_CU_RETORNO
1
<Cursor>
116
0
