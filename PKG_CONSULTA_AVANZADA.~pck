CREATE OR REPLACE PACKAGE PKG_CONSULTA_AVANZADA IS

  TYPE CU_REC_SET IS REF CURSOR;

  -- ******************************************************************************
  -- DESCRIPCIÓN: PROCEDURE QUE REALIZA LA CONSULTA AVANZADA DE MULTAS
  --
  -- INPUT PARAMETERS: PIN_NU_ID_MULTA
  --
  -- OUTPUT PARAMETERS: POV_COD_RESULT , POUT_VC_MSG_RESULT
  --
  --
  -- AUTHOR:      VICTOR BENDEZÚ
  -- PROYECTO:    MIGRACIÓN DE SICOB A SIA
  --
  -- REVISIONES
  -- FECHA            AUTOR         MOTIVO DEL CAMBIO    
  -- ----------------------------------------------------------------
  -- 10/12/2022     VICTOR BENDEZÚ  MIGRACIÓN DE SICOB A SIA    
  -- ***************************************************************    

  PROCEDURE SCOB_SP_S_MULTA_AVANZADA_NUEVO(
                                         -----------------------------------------------------------------------------------------------
                                         /*001*/PI_V_AREA_MACRO IN VARCHAR2 --AREA MACRO
                                         /*002*/,
                                         PI_V_CUM_INI IN VARCHAR2 --CUM
                                         /*003*/,
                                         PI_V_CUM_FIN IN VARCHAR2 --CUM
                                         /*004*/,
                                         PI_V_FEC_GEN_CUM_INI IN VARCHAR2 --FECHA GENERACION CUM INI
                                         /*005*/,
                                         PI_V_FEC_GEN_CUM_FIN IN VARCHAR2 --FECHA GENERACION CUM FIN
                                         /*006*/,
                                         PI_V_ID_SEDE IN VARCHAR2 --SEDE
                                         /*007*/,
                                         PI_V_ID_COD_DPTO_SEDE IN VARCHAR2 --CODIGO DEPARTAMENTO SEDE
                                         /*008*/,
                                         PI_V_ID_COD_PROV_SEDE IN VARCHAR2 --CODIGO PROVINCIA SEDE
                                         /*009*/,
                                         PI_V_ID_COD_DIST_SEDE IN VARCHAR2 --CODIGO DISTRITO SEDE
                                         /*010*/,
                                         PI_V_ID_ORG_RESOL IN VARCHAR2 --ORGANO RESOLUTIVO
                                         /*011*/,
                                         PI_V_ID_COD_DPTO_ORGR IN VARCHAR2 --CODIGO DEPARTAMENTO ORGANO RESOLUTIVO
                                         /*012*/,
                                         PI_V_ID_COD_PROV_ORGR IN VARCHAR2 --CODIGO PROVINCIA ORGANO RESOLUTIVO
                                         /*013*/,
                                         PI_V_ID_COD_DIST_ORGR IN VARCHAR2 --CODIGO DISTRITO ORGANO RESOLUTIVO
                                         /*014*/,
                                         PI_V_ID_NRO_INSTANCIA IN VARCHAR2 --NUMERO DE INSTANCIA
                                         /*015*/,
                                         PI_V_ID_MATERIA IN VARCHAR2 --MATERIA
                                         /*016*/,
                                         PI_V_ID_SUB_MATERIA IN VARCHAR2 --SUBMATERIA
                                         /*017*/,
                                         PI_V_NRO_EXP_UNICO_INI IN VARCHAR2 --NRO. EXPEDIENTE ADMINISTRATIVO
                                         /*018*/,
                                         PI_V_NRO_EXP_UNICO_FIN IN VARCHAR2 --NRO. EXPEDIENTE ADMINISTRATIVO
                                         /*019*/,
                                         PI_V_NROEXPADM_NIVEL IN VARCHAR2 --NRO. EXPEDIENTE ANTIGUO
                                         /*020*/,
                                         PI_V_NRO_RESOL IN VARCHAR2 --NRO. RESOLUCION OR
                                         /*021*/,
                                         PI_V_FEC_RESO_OR_INI IN VARCHAR2 --FECHA RESOLUCION OR INI
                                         /*022*/,
                                         PI_V_FEC_RESO_OR_FIN IN VARCHAR2 --FECHA RESOLUCION OR FIN
                                         /*023*/,
                                         PI_V_FEC_NOTIFI_OR_INI IN VARCHAR2 --FECHA NOTIFICACION RESOLUCION INI
                                         /*024*/,
                                         PI_V_FEC_NOTIFI_OR_FIN IN VARCHAR2 --FECHA NOTIFICACION RESOLUCION FIN
                                         /*025*/,
                                         PI_V_FEC_GENERACION_SEC_INI IN VARCHAR2 --FECHA GENERACION SEC
                                         /*026*/,
                                         PI_V_FEC_GENERACION_SEC_FIN IN VARCHAR2 --FECHA GENERACION SEC
                                         ---
                                         /*027*/,
                                         PI_V_FEC_RECEPCION_AEC_INI IN VARCHAR2 --FECHA RECEPCION AEC INICIO
                                         /*028*/,
                                         PI_V_FEC_RECEPCION_AEC_FIN IN VARCHAR2 --FECHA RECEPCION AEC FIN
                                         /*029*/,
                                         PI_V_ANIO_INGRESO_AEC_INI IN VARCHAR2 --AÑO INGRESO AL AEC INI
                                         /*030*/,
                                         PI_V_ANIO_INGRESO_AEC_FIN IN VARCHAR2 --AÑO INGRESO AL AEC FIN
                                         /*031*/,
                                         PI_V_NRO_INGRESO_AEC_INI IN VARCHAR2 --NRO. INGRESO AEC
                                         /*032*/,
                                         PI_V_NRO_INGRESO_AEC_FIN IN VARCHAR2 --NRO. INGRESO AEC
                                         ---
                                         /*033*/,
                                         PI_V_ANIO_FILE_INI IN VARCHAR2 --AÑO FILE INI
                                         /*034*/,
                                         PI_V_ANIO_FILE_FIN IN VARCHAR2 --AÑO FILE FIN
                                         /*035*/,
                                         PI_V_NRO_FILE_INI IN VARCHAR2 --NRO. FILE
                                         /*036*/,
                                         PI_V_NRO_FILE_FIN IN VARCHAR2 --NRO. FILE
                                         /*037*/,
                                         PI_V_FEC_RECEPCION_FILE_INI IN VARCHAR2 --FECHA RECEPCION FILE INICIO
                                         /*038*/,
                                         PI_V_FEC_RECEPCION_FILE_FIN IN VARCHAR2 --FECHA RECEPCION FILE FIN
                                         ---
                                         /*039*/,
                                         PI_N_VALOR_UIT_INI IN NUMBER --NRO UIT INI
                                         /*040*/,
                                         PI_N_VALOR_UIT_FIN IN NUMBER --NRO UIT FIN
                                         /*041*/,
                                         PI_N_MONTO_UIT_INI IN NUMBER --MONTO UIT INI
                                         /*042*/,
                                         PI_N_MONTO_UIT_FIN IN NUMBER --MONTO UIT FIN
                                         /*043*/,
                                         PI_N_SALDO_INI IN NUMBER --SALDO UIT INI
                                         /*044*/,
                                         PI_N_SALDO_FIN IN NUMBER --SALDO UIT FIN
                                         /*045*/,
                                         PI_V_ID_TIPO_MULTA IN VARCHAR2 --TIPO MULTA (SOLIDARIA/INDIVIDUAL)
                                         /*046*/,
                                         PI_V_COD_ESTADO_MULTA_RESOL IN VARCHAR2 --ESTADO DE LA MULTA RESOLUTIVO
                                         /*047*/,
                                         PI_V_COD_ESTADO_PAGO IN VARCHAR2 --ESTADO PAGO DE LA MULTA
                                         /*048*/,
                                         PI_V_FEC_ESTADO_MULTA_OR_INI IN VARCHAR2 --FECHA ESTADO MULTA OR INI
                                         /*049*/,
                                         PI_V_FEC_ESTADO_MULTA_OR_FIN IN VARCHAR2 --FECHA ESTADO MULTA OR FIN
                                         /*050*/,
                                         PI_V_FEC_ESTADO_MULTA_COB_INI IN VARCHAR2 --FECHA ESTADO MULTA COBRANZA
                                         /*051*/,
                                         PI_V_FEC_ESTADO_MULTA_COB_FIN IN VARCHAR2 --FECHA ESTADO MULTA COBRANZA
                                         /*052*/,
                                         PI_V_COD_ESTADO_MULTA_COB IN VARCHAR2 --ESTADO DE LA MULTA COBRANZA
                                         /*053*/,
                                         PI_V_COD_MOTIVO_MULTA_COB IN VARCHAR2 --MOTIVO MULTA COBRANZA
                                         /*054*/,
                                         PI_V_IND_TIPO_PAGO IN VARCHAR2 --INDICADOR DE PAGO
                                         /*055*/,
                                         PI_C_FLG_ASOCU_MULTA IN CHAR --INDICADOR % ASOCU > 0
                                         -----------------------------------------------------------------------------------------------
                                         /*056*/,
                                         PI_V_COD_ESTADO_EXPED_COB IN VARCHAR2 --ESTADO EXPEDIENTE COBRANZA
                                         /*057*/,
                                         PI_V_ANIO IN VARCHAR2 --AÑO EXPEDIENTE COBRANZA
                                         /*058*/,
                                         PI_V_NRO_EXP_COB_INI IN VARCHAR2 --NRO. EXPEDIENTE COBRANZA
                                         /*059*/,
                                         PI_V_NRO_EXP_COB_FIN IN VARCHAR2 --NRO. EXPEDIENTE COBRANZA
                                         /*060*/,
                                         PI_V_FEC_GEN_EXPED_COB_INI IN VARCHAR2 --FECHA GENERACION EXPED COBRANZA INI
                                         /*061*/,
                                         PI_V_FEC_GEN_EXPED_COB_FIN IN VARCHAR2 --FECHA GENERACION EXPED COBRANZA FIN
                                         -------
                                         /*062*/,
                                         PI_V_GESTOR_COBRANZA IN VARCHAR2 --GESTOR DE COBRANZA
                                         /*063*/,
                                         PI_V_FEC_EMI_REC_INI IN VARCHAR2 --FECHA DE EMISIÓN DE LA REC
                                         /*064*/,
                                         PI_V_FEC_EMI_REC_FIN IN VARCHAR2 --FECHA DE EMISIÓN DE LA REC
                                         /*065*/,
                                         PI_V_FEC_NOTI_REC_INI IN VARCHAR2 --FECHA DE NOTIFICACIÓN DE LA REC
                                         /*066*/,
                                         PI_V_FEC_NOTI_REC_FIN IN VARCHAR2 --FECHA DE NOTIFICACIÓN DE LA REC
                                         /*067*/,
                                         PI_V_COD_MOTIVO_EXPED_COB IN VARCHAR2 --MOTIVO EXPEDIENTE COBRANZA---------
                                         /*068*/,
                                         PI_V_FEC_EST_EXPED_COB_INI IN VARCHAR2 --FECHA DE ESTADO DEL EXPEDIENTE
                                         /*069*/,
                                         PI_V_FEC_EST_EXPED_COB_FIN IN VARCHAR2 --FECHA DE ESTADO DEL EXPEDIENTE
                                         /*070*/,
                                         PI_V_NUM_ENV_ARCH_INI IN VARCHAR2 --Nº ENVIO A ARCHIVO CENTRAL
                                         /*071*/,
                                         PI_V_NUM_ENV_ARCH_FIN IN VARCHAR2 --Nº ENVIO A ARCHIVO CENTRAL
                                         /*072*/,
                                         PI_V_FEC_ENVI_ARCH_INI IN VARCHAR2 --FECHA DE ENVÍO A ARCHIVO CENTRAL
                                         /*073*/,
                                         PI_V_FEC_ENVI_ARCH_FIN IN VARCHAR2 --FECHA DE ENVÍO A ARCHIVO CENTRAL
                                         /*074*/,
                                         PI_V_NRO_OFIC_SUNAT_INI IN VARCHAR2 --Nº DE OFICIO DE LA SUNAT
                                         /*075*/,
                                         PI_V_NRO_OFIC_SUNAT_FIN IN VARCHAR2 --Nº DE OFICIO DE LA SUNAT
                                         /*076*/,
                                         PI_N_DERE_ANTIDUMP_INI IN NUMBER --DERECHOS ANTIDUMPING
                                         /*077*/,
                                         PI_N_DERE_ANTIDUMP_FIN IN NUMBER --DERECHOS ANTIDUMPING
                                         /*078*/,
                                         PI_V_NRO_PARTI_INI IN VARCHAR2 --PARTIDA ARANCELARIA
                                         /*079*/,
                                         PI_V_NRO_PARTI_FIN IN VARCHAR2 --PARTIDA ARANCELARIA
                                         /*080*/,
                                         PI_V_NRO_DUA_INI IN VARCHAR2 --Nº DUA
                                         /*081*/,
                                         PI_V_NRO_DUA_FIN IN VARCHAR2 --Nº DUA
                                         /*082*/,
                                         PI_V_NRO_LIQ_COB_INI IN VARCHAR2 --Nº LIQUIDACIÓN DE COBRANZA
                                         /*083*/,
                                         PI_V_NRO_LIQ_COB_FIN IN VARCHAR2 --Nº LIQUIDACIÓN DE COBRANZA
                                         /*084*/,
                                         PI_V_ID_INTENDENCIA IN VARCHAR2 --INTENDENCIA ANTIDUMPING
                                         /*085*/,
                                         PI_C_FLG_IND_EMBARGO IN CHAR --INDICADOR TIENE EMBARGO?
                                         /*086*/,
                                         PI_V_FEC_ASIG_GESTOR_INI IN VARCHAR2 --FECHA DE ASIGNACION DE GESTOR INI
                                         /*087*/,
                                         PI_V_FEC_ASIG_GESTOR_FIN IN VARCHAR2 --FECHA DE ASIGNACION DE GESTOR FIN
                                         /*088*/,
                                         PI_V_FEC_CARTA_PRECOACTIVA_INI IN VARCHAR2 --FECHA DE CARTA PRECOACTIVA INICIO
                                         /*089*/,
                                         PI_V_FEC_CARTA_PRECOACTIVA_FIN IN VARCHAR2 --FECHA DE CARTA PRECOACTIVA FIN
                                         /*090*/,
                                         PI_V_ID_EXPECTATIVA_COBRO IN VARCHAR2 --CADENA CODIGOS ESPECTATIVA DE COBRO
                                         
                                         -----------------------------------------------------------------------------------------------
                                         --DENUNCIANTE
                                         /*091*/,
                                         PI_V_D_CODSANCIONA_INI IN VARCHAR2 --CÓDIGO DEL INDECOPI
                                         /*092*/,
                                         PI_V_D_CODSANCIONA_FIN IN VARCHAR2 --CÓDIGO DEL INDECOPI
                                         /*093*/,
                                         PI_I_D_TIP_PERSONA IN INTEGER --TIPO DE PERSONERÍA
                                         /*094*/,
                                         PI_V_D_RAZON_SOCIAL IN VARCHAR2 --RAZÓN SOCIAL
                                         /*095*/,
                                         PI_V_D_APE_PATERNO IN VARCHAR2 --APELLIDO PATERNO
                                         /*096*/,
                                         PI_V_D_APE_MATERNO IN VARCHAR2 --APELLIDO MATERNO
                                         /*097*/,
                                         PI_V_D_APE_CASADA IN VARCHAR2 --APELLIDO CASADA
                                         /*098*/,
                                         PI_V_D_PRI_NOMBRE IN VARCHAR2 --PRIMER NOMBRE
                                         /*099*/,
                                         PI_V_D_SEG_NOMBRE IN VARCHAR2 --SEGUNDO NOMBRE
                                         /*100*/,
                                         PI_I_D_TIPO_DOC IN INTEGER --TIPO DE DOCUMENTO
                                         /*101*/,
                                         PI_V_D_NRO_DOC IN VARCHAR2 --Nº DE DOCUMENTO DE IDENTIDAD
                                         /*102*/,
                                         PI_I_D_TIP_EMPRESA IN INTEGER --TIPO DE EMPRESA
                                         /*103*/,
                                         PI_N_D_ID_SECT_ECONO IN NUMBER --CIIU (ACTIVIDAD ECONOMICA)
                                         /*104*/,
                                         PI_C_D_FLG_ASOCU IN CHAR --FLAG ASOCU
                                         /*105*/,
                                         PI_C_D_FL_OFICIO IN CHAR --INDICADOR DENUNCIANTE DE OFICIO=INDECOPI
                                         --DENUNCIADO
                                         /*106*/,
                                         PI_V_DO_CODSANCIONA_INI IN VARCHAR2 --CÓDIGO DEL INDECOPI
                                         /*107*/,
                                         PI_V_DO_CODSANCIONA_FIN IN VARCHAR2 --CÓDIGO DEL INDECOPI
                                         /*108*/,
                                         PI_I_DO_TIP_PERSONA IN INTEGER --TIPO DE PERSONERÍA
                                         /*109*/,
                                         PI_V_DO_RAZON_SOCIAL IN VARCHAR2 --RAZÓN SOCIAL
                                         /*110*/,
                                         PI_V_DO_APE_PATERNO IN VARCHAR2 --APELLIDO PATERNO
                                         /*111*/,
                                         PI_V_DO_APE_MATERNO IN VARCHAR2 --APELLIDO MATERNO
                                         /*112*/,
                                         PI_V_DO_APE_CASADA IN VARCHAR2 --APELLIDO CASADA
                                         /*113*/,
                                         PI_V_DO_PRI_NOMBRE IN VARCHAR2 --PRIMER NOMBRE
                                         /*114*/,
                                         PI_V_DO_SEG_NOMBRE IN VARCHAR2 --SEGUNDO NOMBRE
                                         /*115*/,
                                         PI_I_DO_TIPO_DOC IN INTEGER --TIPO DE DOCUMENTO
                                         /*116*/,
                                         PI_V_DO_NRO_DOC IN VARCHAR2 --Nº DE DOCUMENTO DE IDENTIDAD
                                         /*117*/,
                                         PI_I_DO_TIP_EMPRESA IN INTEGER --TIPO DE EMPRESA
                                         /*118*/,
                                         PI_N_DO_ID_SECT_ECONO IN NUMBER --CIIU (ACTIVIDAD ECONOMICA)
                                         /*119*/,
                                         PI_C_DO_FLG_ASOCU IN CHAR --FLAG ASOCU
                                         --SANCIONADO
                                         /*120*/,
                                         PI_V_S_CODSANCIONA_INI IN VARCHAR2 --CÓDIGO DEL INDECOPI
                                         /*121*/,
                                         PI_V_S_CODSANCIONA_FIN IN VARCHAR2 --CÓDIGO DEL INDECOPI
                                         /*122*/,
                                         PI_I_S_TIP_PERSONA IN INTEGER --TIPO DE PERSONERÍA
                                         /*123*/,
                                         PI_V_S_RAZON_SOCIAL IN VARCHAR2 --RAZÓN SOCIAL
                                         /*124*/,
                                         PI_V_S_APE_PATERNO IN VARCHAR2 --APELLIDO PATERNO
                                         /*125*/,
                                         PI_V_S_APE_MATERNO IN VARCHAR2 --APELLIDO MATERNO
                                         /*126*/,
                                         PI_V_S_APE_CASADA IN VARCHAR2 --APELLIDO CASADA
                                         /*127*/,
                                         PI_V_S_PRI_NOMBRE IN VARCHAR2 --PRIMER NOMBRE
                                         /*128*/,
                                         PI_V_S_SEG_NOMBRE IN VARCHAR2 --SEGUNDO NOMBRE
                                         /*129*/,
                                         PI_I_S_TIPO_DOC IN INTEGER --TIPO DE DOCUMENTO
                                         /*130*/,
                                         PI_V_S_NRO_DOC IN VARCHAR2 --Nº DE DOCUMENTO DE IDENTIDAD
                                         /*131*/,
                                         PI_I_S_TIP_EMPRESA IN INTEGER --TIPO DE EMPRESA
                                         /*132*/,
                                         PI_N_S_ID_SECT_ECONO IN NUMBER --CIIU (ACTIVIDAD ECONOMICA)
                                         /*133*/,
                                         PI_C_S_FLG_ASOCU IN CHAR --FLAG ASOCU
                                         --@0002:INI
                                         /*134*/,
                                         PI_C_S_FLG_BUSCAR_BY_CONTENIDO IN CHAR --0=NO;1=SI
                                         --@0002:FIN
                                         -----------------------------------------------------------------------------------------------
                                        ,
                                         PO_CU_RETORNO OUT CU_REC_SET);
                                         

END PKG_CONSULTA_AVANZADA;
/
CREATE OR REPLACE PACKAGE BODY PKG_CONSULTA_AVANZADA IS

   
  PROCEDURE SCOB_SP_S_MULTA_AVANZADA_NUEVO(
                                         -----------------------------------------------------------------------------------------------
                                         /*001*/PI_V_AREA_MACRO IN VARCHAR2 --AREA MACRO
                                         /*002*/,
                                         PI_V_CUM_INI IN VARCHAR2 --CUM
                                         /*003*/,
                                         PI_V_CUM_FIN IN VARCHAR2 --CUM
                                         /*004*/,
                                         PI_V_FEC_GEN_CUM_INI IN VARCHAR2 --FECHA GENERACION CUM INI
                                         /*005*/,
                                         PI_V_FEC_GEN_CUM_FIN IN VARCHAR2 --FECHA GENERACION CUM FIN
                                         /*006*/,
                                         PI_V_ID_SEDE IN VARCHAR2 --SEDE
                                         /*007*/,
                                         PI_V_ID_COD_DPTO_SEDE IN VARCHAR2 --CODIGO DEPARTAMENTO SEDE
                                         /*008*/,
                                         PI_V_ID_COD_PROV_SEDE IN VARCHAR2 --CODIGO PROVINCIA SEDE
                                         /*009*/,
                                         PI_V_ID_COD_DIST_SEDE IN VARCHAR2 --CODIGO DISTRITO SEDE
                                         /*010*/,
                                         PI_V_ID_ORG_RESOL IN VARCHAR2 --ORGANO RESOLUTIVO
                                         /*011*/,
                                         PI_V_ID_COD_DPTO_ORGR IN VARCHAR2 --CODIGO DEPARTAMENTO ORGANO RESOLUTIVO
                                         /*012*/,
                                         PI_V_ID_COD_PROV_ORGR IN VARCHAR2 --CODIGO PROVINCIA ORGANO RESOLUTIVO
                                         /*013*/,
                                         PI_V_ID_COD_DIST_ORGR IN VARCHAR2 --CODIGO DISTRITO ORGANO RESOLUTIVO
                                         /*014*/,
                                         PI_V_ID_NRO_INSTANCIA IN VARCHAR2 --NUMERO DE INSTANCIA
                                         /*015*/,
                                         PI_V_ID_MATERIA IN VARCHAR2 --MATERIA
                                         /*016*/,
                                         PI_V_ID_SUB_MATERIA IN VARCHAR2 --SUBMATERIA
                                         /*017*/,
                                         PI_V_NRO_EXP_UNICO_INI IN VARCHAR2 --NRO. EXPEDIENTE ADMINISTRATIVO
                                         /*018*/,
                                         PI_V_NRO_EXP_UNICO_FIN IN VARCHAR2 --NRO. EXPEDIENTE ADMINISTRATIVO
                                         /*019*/,
                                         PI_V_NROEXPADM_NIVEL IN VARCHAR2 --NRO. EXPEDIENTE ANTIGUO
                                         /*020*/,
                                         PI_V_NRO_RESOL IN VARCHAR2 --NRO. RESOLUCION OR
                                         /*021*/,
                                         PI_V_FEC_RESO_OR_INI IN VARCHAR2 --FECHA RESOLUCION OR INI
                                         /*022*/,
                                         PI_V_FEC_RESO_OR_FIN IN VARCHAR2 --FECHA RESOLUCION OR FIN
                                         /*023*/,
                                         PI_V_FEC_NOTIFI_OR_INI IN VARCHAR2 --FECHA NOTIFICACION RESOLUCION INI
                                         /*024*/,
                                         PI_V_FEC_NOTIFI_OR_FIN IN VARCHAR2 --FECHA NOTIFICACION RESOLUCION FIN
                                         /*025*/,
                                         PI_V_FEC_GENERACION_SEC_INI IN VARCHAR2 --FECHA GENERACION SEC
                                         /*026*/,
                                         PI_V_FEC_GENERACION_SEC_FIN IN VARCHAR2 --FECHA GENERACION SEC
                                         ---
                                         /*027*/,
                                         PI_V_FEC_RECEPCION_AEC_INI IN VARCHAR2 --FECHA RECEPCION AEC INICIO
                                         /*028*/,
                                         PI_V_FEC_RECEPCION_AEC_FIN IN VARCHAR2 --FECHA RECEPCION AEC FIN
                                         /*029*/,
                                         PI_V_ANIO_INGRESO_AEC_INI IN VARCHAR2 --AÑO INGRESO AL AEC INI
                                         /*030*/,
                                         PI_V_ANIO_INGRESO_AEC_FIN IN VARCHAR2 --AÑO INGRESO AL AEC FIN
                                         /*031*/,
                                         PI_V_NRO_INGRESO_AEC_INI IN VARCHAR2 --NRO. INGRESO AEC
                                         /*032*/,
                                         PI_V_NRO_INGRESO_AEC_FIN IN VARCHAR2 --NRO. INGRESO AEC
                                         ---
                                         /*033*/,
                                         PI_V_ANIO_FILE_INI IN VARCHAR2 --AÑO FILE INI
                                         /*034*/,
                                         PI_V_ANIO_FILE_FIN IN VARCHAR2 --AÑO FILE FIN
                                         /*035*/,
                                         PI_V_NRO_FILE_INI IN VARCHAR2 --NRO. FILE
                                         /*036*/,
                                         PI_V_NRO_FILE_FIN IN VARCHAR2 --NRO. FILE
                                         /*037*/,
                                         PI_V_FEC_RECEPCION_FILE_INI IN VARCHAR2 --FECHA RECEPCION FILE INICIO
                                         /*038*/,
                                         PI_V_FEC_RECEPCION_FILE_FIN IN VARCHAR2 --FECHA RECEPCION FILE FIN
                                         ---
                                         /*039*/,
                                         PI_N_VALOR_UIT_INI IN NUMBER --NRO UIT INI
                                         /*040*/,
                                         PI_N_VALOR_UIT_FIN IN NUMBER --NRO UIT FIN
                                         /*041*/,
                                         PI_N_MONTO_UIT_INI IN NUMBER --MONTO UIT INI
                                         /*042*/,
                                         PI_N_MONTO_UIT_FIN IN NUMBER --MONTO UIT FIN
                                         /*043*/,
                                         PI_N_SALDO_INI IN NUMBER --SALDO UIT INI
                                         /*044*/,
                                         PI_N_SALDO_FIN IN NUMBER --SALDO UIT FIN
                                         /*045*/,
                                         PI_V_ID_TIPO_MULTA IN VARCHAR2 --TIPO MULTA (SOLIDARIA/INDIVIDUAL)
                                         /*046*/,
                                         PI_V_COD_ESTADO_MULTA_RESOL IN VARCHAR2 --ESTADO DE LA MULTA RESOLUTIVO
                                         /*047*/,
                                         PI_V_COD_ESTADO_PAGO IN VARCHAR2 --ESTADO PAGO DE LA MULTA
                                         /*048*/,
                                         PI_V_FEC_ESTADO_MULTA_OR_INI IN VARCHAR2 --FECHA ESTADO MULTA OR INI
                                         /*049*/,
                                         PI_V_FEC_ESTADO_MULTA_OR_FIN IN VARCHAR2 --FECHA ESTADO MULTA OR FIN
                                         /*050*/,
                                         PI_V_FEC_ESTADO_MULTA_COB_INI IN VARCHAR2 --FECHA ESTADO MULTA COBRANZA
                                         /*051*/,
                                         PI_V_FEC_ESTADO_MULTA_COB_FIN IN VARCHAR2 --FECHA ESTADO MULTA COBRANZA
                                         /*052*/,
                                         PI_V_COD_ESTADO_MULTA_COB IN VARCHAR2 --ESTADO DE LA MULTA COBRANZA
                                         /*053*/,
                                         PI_V_COD_MOTIVO_MULTA_COB IN VARCHAR2 --MOTIVO MULTA COBRANZA
                                         /*054*/,
                                         PI_V_IND_TIPO_PAGO IN VARCHAR2 --INDICADOR DE PAGO
                                         /*055*/,
                                         PI_C_FLG_ASOCU_MULTA IN CHAR --INDICADOR % ASOCU > 0
                                         -----------------------------------------------------------------------------------------------
                                         /*056*/,
                                         PI_V_COD_ESTADO_EXPED_COB IN VARCHAR2 --ESTADO EXPEDIENTE COBRANZA
                                         /*057*/,
                                         PI_V_ANIO IN VARCHAR2 --AÑO EXPEDIENTE COBRANZA
                                         /*058*/,
                                         PI_V_NRO_EXP_COB_INI IN VARCHAR2 --NRO. EXPEDIENTE COBRANZA
                                         /*059*/,
                                         PI_V_NRO_EXP_COB_FIN IN VARCHAR2 --NRO. EXPEDIENTE COBRANZA
                                         /*060*/,
                                         PI_V_FEC_GEN_EXPED_COB_INI IN VARCHAR2 --FECHA GENERACION EXPED COBRANZA INI
                                         /*061*/,
                                         PI_V_FEC_GEN_EXPED_COB_FIN IN VARCHAR2 --FECHA GENERACION EXPED COBRANZA FIN
                                         -------
                                         /*062*/,
                                         PI_V_GESTOR_COBRANZA IN VARCHAR2 --GESTOR DE COBRANZA
                                         /*063*/,
                                         PI_V_FEC_EMI_REC_INI IN VARCHAR2 --FECHA DE EMISIÓN DE LA REC
                                         /*064*/,
                                         PI_V_FEC_EMI_REC_FIN IN VARCHAR2 --FECHA DE EMISIÓN DE LA REC
                                         /*065*/,
                                         PI_V_FEC_NOTI_REC_INI IN VARCHAR2 --FECHA DE NOTIFICACIÓN DE LA REC
                                         /*066*/,
                                         PI_V_FEC_NOTI_REC_FIN IN VARCHAR2 --FECHA DE NOTIFICACIÓN DE LA REC
                                         /*067*/,
                                         PI_V_COD_MOTIVO_EXPED_COB IN VARCHAR2 --MOTIVO EXPEDIENTE COBRANZA---------
                                         /*068*/,
                                         PI_V_FEC_EST_EXPED_COB_INI IN VARCHAR2 --FECHA DE ESTADO DEL EXPEDIENTE
                                         /*069*/,
                                         PI_V_FEC_EST_EXPED_COB_FIN IN VARCHAR2 --FECHA DE ESTADO DEL EXPEDIENTE
                                         /*070*/,
                                         PI_V_NUM_ENV_ARCH_INI IN VARCHAR2 --Nº ENVIO A ARCHIVO CENTRAL
                                         /*071*/,
                                         PI_V_NUM_ENV_ARCH_FIN IN VARCHAR2 --Nº ENVIO A ARCHIVO CENTRAL
                                         /*072*/,
                                         PI_V_FEC_ENVI_ARCH_INI IN VARCHAR2 --FECHA DE ENVÍO A ARCHIVO CENTRAL
                                         /*073*/,
                                         PI_V_FEC_ENVI_ARCH_FIN IN VARCHAR2 --FECHA DE ENVÍO A ARCHIVO CENTRAL
                                         /*074*/,
                                         PI_V_NRO_OFIC_SUNAT_INI IN VARCHAR2 --Nº DE OFICIO DE LA SUNAT
                                         /*075*/,
                                         PI_V_NRO_OFIC_SUNAT_FIN IN VARCHAR2 --Nº DE OFICIO DE LA SUNAT
                                         /*076*/,
                                         PI_N_DERE_ANTIDUMP_INI IN NUMBER --DERECHOS ANTIDUMPING
                                         /*077*/,
                                         PI_N_DERE_ANTIDUMP_FIN IN NUMBER --DERECHOS ANTIDUMPING
                                         /*078*/,
                                         PI_V_NRO_PARTI_INI IN VARCHAR2 --PARTIDA ARANCELARIA
                                         /*079*/,
                                         PI_V_NRO_PARTI_FIN IN VARCHAR2 --PARTIDA ARANCELARIA
                                         /*080*/,
                                         PI_V_NRO_DUA_INI IN VARCHAR2 --Nº DUA
                                         /*081*/,
                                         PI_V_NRO_DUA_FIN IN VARCHAR2 --Nº DUA
                                         /*082*/,
                                         PI_V_NRO_LIQ_COB_INI IN VARCHAR2 --Nº LIQUIDACIÓN DE COBRANZA
                                         /*083*/,
                                         PI_V_NRO_LIQ_COB_FIN IN VARCHAR2 --Nº LIQUIDACIÓN DE COBRANZA
                                         /*084*/,
                                         PI_V_ID_INTENDENCIA IN VARCHAR2 --INTENDENCIA ANTIDUMPING
                                         /*085*/,
                                         PI_C_FLG_IND_EMBARGO IN CHAR --INDICADOR TIENE EMBARGO?
                                         /*086*/,
                                         PI_V_FEC_ASIG_GESTOR_INI IN VARCHAR2 --FECHA DE ASIGNACION DE GESTOR INI
                                         /*087*/,
                                         PI_V_FEC_ASIG_GESTOR_FIN IN VARCHAR2 --FECHA DE ASIGNACION DE GESTOR FIN
                                         /*088*/,
                                         PI_V_FEC_CARTA_PRECOACTIVA_INI IN VARCHAR2 --FECHA DE CARTA PRECOACTIVA INICIO
                                         /*089*/,
                                         PI_V_FEC_CARTA_PRECOACTIVA_FIN IN VARCHAR2 --FECHA DE CARTA PRECOACTIVA FIN
                                         /*090*/,
                                         PI_V_ID_EXPECTATIVA_COBRO IN VARCHAR2 --CADENA CODIGOS ESPECTATIVA DE COBRO
                                         
                                         -----------------------------------------------------------------------------------------------
                                         --DENUNCIANTE
                                         /*091*/,
                                         PI_V_D_CODSANCIONA_INI IN VARCHAR2 --CÓDIGO DEL INDECOPI
                                         /*092*/,
                                         PI_V_D_CODSANCIONA_FIN IN VARCHAR2 --CÓDIGO DEL INDECOPI
                                         /*093*/,
                                         PI_I_D_TIP_PERSONA IN INTEGER --TIPO DE PERSONERÍA
                                         /*094*/,
                                         PI_V_D_RAZON_SOCIAL IN VARCHAR2 --RAZÓN SOCIAL
                                         /*095*/,
                                         PI_V_D_APE_PATERNO IN VARCHAR2 --APELLIDO PATERNO
                                         /*096*/,
                                         PI_V_D_APE_MATERNO IN VARCHAR2 --APELLIDO MATERNO
                                         /*097*/,
                                         PI_V_D_APE_CASADA IN VARCHAR2 --APELLIDO CASADA
                                         /*098*/,
                                         PI_V_D_PRI_NOMBRE IN VARCHAR2 --PRIMER NOMBRE
                                         /*099*/,
                                         PI_V_D_SEG_NOMBRE IN VARCHAR2 --SEGUNDO NOMBRE
                                         /*100*/,
                                         PI_I_D_TIPO_DOC IN INTEGER --TIPO DE DOCUMENTO
                                         /*101*/,
                                         PI_V_D_NRO_DOC IN VARCHAR2 --Nº DE DOCUMENTO DE IDENTIDAD
                                         /*102*/,
                                         PI_I_D_TIP_EMPRESA IN INTEGER --TIPO DE EMPRESA
                                         /*103*/,
                                         PI_N_D_ID_SECT_ECONO IN NUMBER --CIIU (ACTIVIDAD ECONOMICA)
                                         /*104*/,
                                         PI_C_D_FLG_ASOCU IN CHAR --FLAG ASOCU
                                         /*105*/,
                                         PI_C_D_FL_OFICIO IN CHAR --INDICADOR DENUNCIANTE DE OFICIO=INDECOPI
                                         --DENUNCIADO
                                         /*106*/,
                                         PI_V_DO_CODSANCIONA_INI IN VARCHAR2 --CÓDIGO DEL INDECOPI
                                         /*107*/,
                                         PI_V_DO_CODSANCIONA_FIN IN VARCHAR2 --CÓDIGO DEL INDECOPI
                                         /*108*/,
                                         PI_I_DO_TIP_PERSONA IN INTEGER --TIPO DE PERSONERÍA
                                         /*109*/,
                                         PI_V_DO_RAZON_SOCIAL IN VARCHAR2 --RAZÓN SOCIAL
                                         /*110*/,
                                         PI_V_DO_APE_PATERNO IN VARCHAR2 --APELLIDO PATERNO
                                         /*111*/,
                                         PI_V_DO_APE_MATERNO IN VARCHAR2 --APELLIDO MATERNO
                                         /*112*/,
                                         PI_V_DO_APE_CASADA IN VARCHAR2 --APELLIDO CASADA
                                         /*113*/,
                                         PI_V_DO_PRI_NOMBRE IN VARCHAR2 --PRIMER NOMBRE
                                         /*114*/,
                                         PI_V_DO_SEG_NOMBRE IN VARCHAR2 --SEGUNDO NOMBRE
                                         /*115*/,
                                         PI_I_DO_TIPO_DOC IN INTEGER --TIPO DE DOCUMENTO
                                         /*116*/,
                                         PI_V_DO_NRO_DOC IN VARCHAR2 --Nº DE DOCUMENTO DE IDENTIDAD
                                         /*117*/,
                                         PI_I_DO_TIP_EMPRESA IN INTEGER --TIPO DE EMPRESA
                                         /*118*/,
                                         PI_N_DO_ID_SECT_ECONO IN NUMBER --CIIU (ACTIVIDAD ECONOMICA)
                                         /*119*/,
                                         PI_C_DO_FLG_ASOCU IN CHAR --FLAG ASOCU
                                         --SANCIONADO
                                         /*120*/,
                                         PI_V_S_CODSANCIONA_INI IN VARCHAR2 --CÓDIGO DEL INDECOPI
                                         /*121*/,
                                         PI_V_S_CODSANCIONA_FIN IN VARCHAR2 --CÓDIGO DEL INDECOPI
                                         /*122*/,
                                         PI_I_S_TIP_PERSONA IN INTEGER --TIPO DE PERSONERÍA
                                         /*123*/,
                                         PI_V_S_RAZON_SOCIAL IN VARCHAR2 --RAZÓN SOCIAL
                                         /*124*/,
                                         PI_V_S_APE_PATERNO IN VARCHAR2 --APELLIDO PATERNO
                                         /*125*/,
                                         PI_V_S_APE_MATERNO IN VARCHAR2 --APELLIDO MATERNO
                                         /*126*/,
                                         PI_V_S_APE_CASADA IN VARCHAR2 --APELLIDO CASADA
                                         /*127*/,
                                         PI_V_S_PRI_NOMBRE IN VARCHAR2 --PRIMER NOMBRE
                                         /*128*/,
                                         PI_V_S_SEG_NOMBRE IN VARCHAR2 --SEGUNDO NOMBRE
                                         /*129*/,
                                         PI_I_S_TIPO_DOC IN INTEGER --TIPO DE DOCUMENTO
                                         /*130*/,
                                         PI_V_S_NRO_DOC IN VARCHAR2 --Nº DE DOCUMENTO DE IDENTIDAD
                                         /*131*/,
                                         PI_I_S_TIP_EMPRESA IN INTEGER --TIPO DE EMPRESA
                                         /*132*/,
                                         PI_N_S_ID_SECT_ECONO IN NUMBER --CIIU (ACTIVIDAD ECONOMICA)
                                         /*133*/,
                                         PI_C_S_FLG_ASOCU IN CHAR --FLAG ASOCU
                                         --@0002:INI
                                         /*134*/,
                                         PI_C_S_FLG_BUSCAR_BY_CONTENIDO IN CHAR --0=NO;1=SI
                                         --@0002:FIN
                                         -----------------------------------------------------------------------------------------------
                                        ,
                                         PO_CU_RETORNO OUT CU_REC_SET) IS
  
    C_FLG_ADMINISTRADO CHAR(1);
    C_FLG_SANCIONADO   CHAR(1);
    C_FLG_DENUNCIADO   CHAR(1);
    C_FLG_DENUNCIANTE  CHAR(1);
  
    V_SQL_ADMIN_SELECT   VARCHAR2(8000);
    V_SQL_ADMIN_WHERE_D  VARCHAR2(8000);
    V_SQL_ADMIN_WHERE_DO VARCHAR2(8000);
    V_SQL_ADMIN_WHERE_S  VARCHAR2(8000);
  
    V_SQL_SELECT_1   VARCHAR2(8000);
    V_SQL_SELECT_2   VARCHAR2(8000);
    V_SQL_SELECT_3   VARCHAR2(8000);
    V_SQL_SELECT_4   VARCHAR2(8000);
    V_SQL_SELECT_5   VARCHAR2(8000);
    V_SQL_JOIN_1     VARCHAR2(8000);
    V_SQL_JOIN_2     VARCHAR2(8000);
    V_SQL_JOIN_3     VARCHAR2(8000);
    V_SQL_JOIN_4     VARCHAR2(8000);
    V_SQL_JOIN_5     VARCHAR2(8000);
    V_SQL_WHERE_1    VARCHAR2(8000);
    V_SQL_WHERE_2    VARCHAR2(8000);
    V_SQL_WHERE_3    VARCHAR2(8000);
    V_SQL_WHERE_4    VARCHAR2(8000);
    V_SQL_WHERE_5    VARCHAR2(8000);
    V_SQL_WHERE_6    VARCHAR2(8000);
    V_SQL_WHERE_7    VARCHAR2(8000);
    V_SQL_WHERE_8    VARCHAR2(8000);
    V_SQL_WHERE_9    VARCHAR2(8000);
    V_SQL_WHERE_10   VARCHAR2(8000);
    V_SQL_WHERE_11   VARCHAR2(8000);
    V_SQL_WHERE_12   VARCHAR2(8000);
    C_CAR_PORCENTAJE VARCHAR(1);
  BEGIN
    --@0002:INI
    C_CAR_PORCENTAJE := '';
    IF PI_C_S_FLG_BUSCAR_BY_CONTENIDO = '1' THEN
      C_CAR_PORCENTAJE := '%';
    END IF;
    --@0002:FIN
  
    --CONTROL DEL FILTRO SANCIONADO
    C_FLG_ADMINISTRADO := '0';
    C_FLG_SANCIONADO   := '0';
    C_FLG_DENUNCIADO   := '0';
    C_FLG_DENUNCIANTE  := '0';
  
    V_SQL_WHERE_1  := '';
    V_SQL_WHERE_2  := '';
    V_SQL_WHERE_3  := '';
    V_SQL_WHERE_4  := '';
    V_SQL_WHERE_5  := '';
    V_SQL_WHERE_6  := '';
    V_SQL_WHERE_7  := '';
    V_SQL_WHERE_8  := '';
    V_SQL_WHERE_9  := '';
    V_SQL_WHERE_10 := '';
    V_SQL_WHERE_11 := '';
    V_SQL_WHERE_12 := '';
  
    IF PI_V_S_CODSANCIONA_INI IS NOT NULL OR
       PI_V_S_CODSANCIONA_FIN IS NOT NULL OR PI_I_S_TIP_PERSONA <> 0 OR
       PI_V_S_RAZON_SOCIAL IS NOT NULL OR PI_V_S_APE_PATERNO IS NOT NULL OR
       PI_V_S_APE_MATERNO IS NOT NULL OR PI_V_S_APE_CASADA IS NOT NULL OR
       PI_V_S_PRI_NOMBRE IS NOT NULL OR PI_V_S_SEG_NOMBRE IS NOT NULL OR
       PI_I_S_TIPO_DOC <> 0 OR PI_V_S_NRO_DOC IS NOT NULL OR
       PI_I_S_TIP_EMPRESA <> 0 OR PI_N_S_ID_SECT_ECONO <> 0 OR
       PI_C_S_FLG_ASOCU <> '0' THEN
      C_FLG_SANCIONADO := '1';
      IF C_FLG_ADMINISTRADO = '0' THEN
        C_FLG_ADMINISTRADO := '1';
      END IF;
    END IF;
  
    IF (PI_V_DO_CODSANCIONA_INI IS NOT NULL OR
       PI_V_DO_CODSANCIONA_FIN IS NOT NULL OR PI_I_DO_TIP_PERSONA <> 0 OR
       PI_V_DO_RAZON_SOCIAL IS NOT NULL OR PI_V_DO_APE_PATERNO IS NOT NULL OR
       PI_V_DO_APE_MATERNO IS NOT NULL OR PI_V_DO_APE_CASADA IS NOT NULL OR
       PI_V_DO_PRI_NOMBRE IS NOT NULL OR PI_V_DO_SEG_NOMBRE IS NOT NULL OR
       PI_I_DO_TIPO_DOC <> 0 OR PI_V_DO_NRO_DOC IS NOT NULL OR
       PI_I_DO_TIP_EMPRESA <> 0 OR PI_N_DO_ID_SECT_ECONO <> 0 OR
       PI_C_DO_FLG_ASOCU <> '0') THEN
      C_FLG_DENUNCIADO := '1';
      IF C_FLG_ADMINISTRADO = '0' THEN
        C_FLG_ADMINISTRADO := '1';
      END IF;
    END IF;
  
    IF (PI_V_D_CODSANCIONA_INI IS NOT NULL OR
       PI_V_D_CODSANCIONA_FIN IS NOT NULL OR PI_I_D_TIP_PERSONA <> 0 OR
       PI_V_D_RAZON_SOCIAL IS NOT NULL OR PI_V_D_APE_PATERNO IS NOT NULL OR
       PI_V_D_APE_MATERNO IS NOT NULL OR PI_V_D_APE_CASADA IS NOT NULL OR
       PI_V_D_PRI_NOMBRE IS NOT NULL OR PI_V_D_SEG_NOMBRE IS NOT NULL OR
       PI_I_D_TIPO_DOC <> 0 OR PI_V_D_NRO_DOC IS NOT NULL OR
       PI_I_D_TIP_EMPRESA <> 0 OR PI_N_D_ID_SECT_ECONO <> 0 OR
       PI_C_D_FLG_ASOCU <> '0' OR PI_C_D_FL_OFICIO <> '0') THEN
      C_FLG_DENUNCIANTE := '1';
      IF C_FLG_ADMINISTRADO = '0' THEN
        C_FLG_ADMINISTRADO := '1';
      END IF;
    END IF;
  
    EXECUTE IMMEDIATE 'TRUNCATE TABLE T_SCOB_TMP_ADMINISTRADO';
    --OBTENER A TODOS LOS ADMINISTRADOS
    IF C_FLG_ADMINISTRADO = '1' THEN
    
      V_SQL_ADMIN_SELECT := '
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
    
      V_SQL_ADMIN_WHERE_D := '
      WHERE ADMINISTRADO.ID_MULTA IS NOT NULL ';
    
      IF C_FLG_DENUNCIANTE = '1' THEN
      
        V_SQL_ADMIN_WHERE_D := V_SQL_ADMIN_WHERE_D || '
      AND (ADMINISTRADO.TIPO_ADMINISTRADO = ''3'' --denunciante
      ';
      
        --CODIGO INDECOPI
        IF PI_V_D_CODSANCIONA_INI IS NOT NULL THEN
          V_SQL_ADMIN_WHERE_D := V_SQL_ADMIN_WHERE_D || '
             AND TO_NUMBER(PERS.COD_SANCIONADO) BETWEEN TO_NUMBER(' ||
                                 PI_V_D_CODSANCIONA_INI ||
                                 ') AND TO_NUMBER(' ||
                                 PI_V_D_CODSANCIONA_FIN || ')';
        
        END IF;
      
        --TIPO PERSONERIA
        IF PI_I_D_TIP_PERSONA <> 0 THEN
          V_SQL_ADMIN_WHERE_D := V_SQL_ADMIN_WHERE_D || '
             AND PERS.TIPO_PERSONA=' ||
                                 PI_I_D_TIP_PERSONA;
        END IF;
      
        --TIPO DOCUMENTO
        IF PI_I_D_TIPO_DOC <> 0 THEN
          V_SQL_ADMIN_WHERE_D := V_SQL_ADMIN_WHERE_D || '
             AND PERS.TIPO_DOC=' ||
                                 PI_I_D_TIPO_DOC;
        END IF;
      
        --NRO DOCUMENTO
        IF PI_V_D_NRO_DOC IS NOT NULL THEN
          V_SQL_ADMIN_WHERE_D := V_SQL_ADMIN_WHERE_D || '
             AND PERS.NRO_DOC=''' ||
                                 PI_V_D_NRO_DOC || '''';
        END IF;
      
        --APELLIDOS Y NOMBRES
        IF PI_V_D_APE_PATERNO IS NOT NULL THEN
          V_SQL_ADMIN_WHERE_D := V_SQL_ADMIN_WHERE_D || '
             AND PERS.APE_PATERNO LIKE ''' ||
                                 C_CAR_PORCENTAJE || PI_V_D_APE_PATERNO ||
                                 '%''';
        END IF;
      
        IF PI_V_D_APE_MATERNO IS NOT NULL THEN
          V_SQL_ADMIN_WHERE_D := V_SQL_ADMIN_WHERE_D || '
             AND PERS.APE_MATERNO LIKE ''' ||
                                 C_CAR_PORCENTAJE || PI_V_D_APE_MATERNO ||
                                 '%''';
        END IF;
      
        IF PI_V_D_APE_CASADA IS NOT NULL THEN
          V_SQL_ADMIN_WHERE_D := V_SQL_ADMIN_WHERE_D || '
             AND PERS.APE_CASADA LIKE ''' ||
                                 C_CAR_PORCENTAJE || PI_V_D_APE_CASADA ||
                                 '%''';
        END IF;
      
        IF PI_V_D_PRI_NOMBRE IS NOT NULL THEN
          V_SQL_ADMIN_WHERE_D := V_SQL_ADMIN_WHERE_D || '
             AND PERS.PRI_NOMBRE LIKE ''' ||
                                 C_CAR_PORCENTAJE || PI_V_D_PRI_NOMBRE ||
                                 '%''';
        END IF;
      
        IF PI_V_D_SEG_NOMBRE IS NOT NULL THEN
          V_SQL_ADMIN_WHERE_D := V_SQL_ADMIN_WHERE_D || '
             AND PERS.SEG_NOMBRE LIKE ''' ||
                                 C_CAR_PORCENTAJE || PI_V_D_SEG_NOMBRE ||
                                 '%''';
        END IF;
      
        --DENOMINACION O RAZON SOCIAL
        IF PI_V_D_RAZON_SOCIAL IS NOT NULL THEN
          V_SQL_ADMIN_WHERE_D := V_SQL_ADMIN_WHERE_D || '
             AND PERS.RAZON_SOCIAL LIKE ''' ||
                                 C_CAR_PORCENTAJE || PI_V_D_RAZON_SOCIAL ||
                                 '%''';
        END IF;
      
        --TIPO DE EMPRESA
        IF PI_I_D_TIP_EMPRESA <> 0 THEN
          V_SQL_ADMIN_WHERE_D := V_SQL_ADMIN_WHERE_D || '
             AND PERS.TIP_EMPRESA=' ||
                                 PI_I_D_TIP_EMPRESA;
        END IF;
      
        --SECTOR ECONOMICO
        IF PI_N_D_ID_SECT_ECONO <> 0 THEN
          V_SQL_ADMIN_WHERE_D := V_SQL_ADMIN_WHERE_D || '
             AND PERS.ID_SECTOR_ECONOMICO=' ||
                                 PI_N_D_ID_SECT_ECONO;
        END IF;
      
        --INDICADOR DENUNCIANTE DE OFICIO = INDECOPI
        IF PI_C_D_FL_OFICIO = '1' THEN
          V_SQL_ADMIN_WHERE_D := V_SQL_ADMIN_WHERE_D || '
             AND PERS.ID_PERSONA=' ||
                                 SCOB_PK_CONSTANTES.C_ID_ADMINISTRADO_INDECOPI;
        END IF;
      
        V_SQL_ADMIN_WHERE_D := V_SQL_ADMIN_WHERE_D || '
      )';
      
      END IF;
    
      IF C_FLG_DENUNCIADO = '1' THEN
        IF C_FLG_DENUNCIANTE = '1' THEN
          V_SQL_ADMIN_WHERE_DO := '
              OR(ADMINISTRADO.TIPO_ADMINISTRADO = ''2'' --denunciado';
        ELSE
          V_SQL_ADMIN_WHERE_DO := '
              AND(ADMINISTRADO.TIPO_ADMINISTRADO = ''2'' --denunciado';
        END IF;
      
        --CODIGO INDECOPI
        IF PI_V_D_CODSANCIONA_INI IS NOT NULL THEN
          V_SQL_ADMIN_WHERE_DO := V_SQL_ADMIN_WHERE_DO || '
             AND TO_NUMBER(PERS.COD_SANCIONADO) BETWEEN TO_NUMBER(' ||
                                  PI_V_DO_CODSANCIONA_INI ||
                                  ') AND TO_NUMBER(' ||
                                  PI_V_DO_CODSANCIONA_FIN || ')';
        END IF;
      
        --TIPO PERSONERIA
        IF PI_I_DO_TIP_PERSONA <> 0 THEN
          V_SQL_ADMIN_WHERE_DO := V_SQL_ADMIN_WHERE_DO || '
             AND PERS.TIPO_PERSONA=' ||
                                  PI_I_DO_TIP_PERSONA;
        END IF;
      
        --TIPO DOCUMENTO
        IF PI_I_DO_TIPO_DOC <> 0 THEN
          V_SQL_ADMIN_WHERE_DO := V_SQL_ADMIN_WHERE_DO || '
             AND PERS.TIPO_DOC=' ||
                                  PI_I_DO_TIPO_DOC;
        END IF;
      
        --NRO DOCUMENTO
        IF PI_V_DO_NRO_DOC IS NOT NULL THEN
          V_SQL_ADMIN_WHERE_DO := V_SQL_ADMIN_WHERE_DO || '
             AND PERS.NRO_DOC=''' ||
                                  PI_V_DO_NRO_DOC || '''';
        END IF;
      
        --APELLIDOS Y NOMBRES
        IF PI_V_DO_APE_PATERNO IS NOT NULL THEN
          V_SQL_ADMIN_WHERE_DO := V_SQL_ADMIN_WHERE_DO || '
             AND PERS.APE_PATERNO LIKE ''' ||
                                  C_CAR_PORCENTAJE || PI_V_DO_APE_PATERNO ||
                                  '%''';
        END IF;
      
        IF PI_V_DO_APE_MATERNO IS NOT NULL THEN
          V_SQL_ADMIN_WHERE_DO := V_SQL_ADMIN_WHERE_DO || '
             AND PERS.APE_MATERNO LIKE ''' ||
                                  C_CAR_PORCENTAJE || PI_V_DO_APE_MATERNO ||
                                  '%''';
        END IF;
      
        IF PI_V_DO_APE_CASADA IS NOT NULL THEN
          V_SQL_ADMIN_WHERE_DO := V_SQL_ADMIN_WHERE_DO || '
             AND PERS.APE_CASADA LIKE ''' ||
                                  C_CAR_PORCENTAJE || PI_V_DO_APE_CASADA ||
                                  '%''';
        END IF;
      
        IF PI_V_DO_PRI_NOMBRE IS NOT NULL THEN
          V_SQL_ADMIN_WHERE_DO := V_SQL_ADMIN_WHERE_DO || '
             AND PERS.PRI_NOMBRE LIKE ''' ||
                                  C_CAR_PORCENTAJE || PI_V_DO_PRI_NOMBRE ||
                                  '%''';
        END IF;
      
        IF PI_V_DO_SEG_NOMBRE IS NOT NULL THEN
          V_SQL_ADMIN_WHERE_DO := V_SQL_ADMIN_WHERE_DO || '
             AND PERS.SEG_NOMBRE LIKE ''' ||
                                  C_CAR_PORCENTAJE || PI_V_DO_SEG_NOMBRE ||
                                  '%''';
        END IF;
      
        --DENOMINACION O RAZON SOCIAL
        IF PI_V_DO_RAZON_SOCIAL IS NOT NULL THEN
          V_SQL_ADMIN_WHERE_DO := V_SQL_ADMIN_WHERE_DO || '
             AND PERS.RAZON_SOCIAL LIKE ''' ||
                                  C_CAR_PORCENTAJE || PI_V_DO_RAZON_SOCIAL ||
                                  '%''';
        END IF;
      
        --TIPO DE EMPRESA
        IF PI_I_DO_TIP_EMPRESA <> 0 THEN
          V_SQL_ADMIN_WHERE_DO := V_SQL_ADMIN_WHERE_DO || '
             AND PERS.TIP_EMPRESA=' ||
                                  PI_I_DO_TIP_EMPRESA;
        END IF;
      
        --SECTOR ECONOMICO
        IF PI_N_DO_ID_SECT_ECONO <> 0 THEN
          V_SQL_ADMIN_WHERE_DO := V_SQL_ADMIN_WHERE_DO || '
             AND PERS.ID_SECTOR_ECONOMICO=' ||
                                  PI_N_DO_ID_SECT_ECONO;
        END IF;
      
        IF PI_C_DO_FLG_ASOCU = '1' THEN
          V_SQL_ADMIN_WHERE_DO := V_SQL_ADMIN_WHERE_DO || '
             AND PERS.FLG_ASOCU=''' ||
                                  PI_C_DO_FLG_ASOCU || '''';
        END IF;
      
        V_SQL_ADMIN_WHERE_DO := V_SQL_ADMIN_WHERE_DO || '
          )';
      END IF;
    
      IF C_FLG_SANCIONADO = '1' THEN
        IF C_FLG_DENUNCIADO = '1' OR C_FLG_DENUNCIANTE = '1' THEN
          V_SQL_ADMIN_WHERE_S := '
              OR(ADMINISTRADO.TIPO_ADMINISTRADO = ''1'' --sancionado';
        ELSE
          V_SQL_ADMIN_WHERE_S := '
              AND(ADMINISTRADO.TIPO_ADMINISTRADO = ''1'' --sancionado';
        END IF;
      
        --CODIGO INDECOPI
        IF PI_V_S_CODSANCIONA_INI IS NOT NULL THEN
          V_SQL_ADMIN_WHERE_S := V_SQL_ADMIN_WHERE_S || '
             AND TO_NUMBER(PERS.COD_SANCIONADO) BETWEEN TO_NUMBER(' ||
                                 PI_V_S_CODSANCIONA_INI ||
                                 ') AND TO_NUMBER(' ||
                                 PI_V_S_CODSANCIONA_FIN || ')';
        END IF;
      
        --TIPO PERSONERIA
        IF PI_I_S_TIP_PERSONA <> 0 THEN
          V_SQL_ADMIN_WHERE_S := V_SQL_ADMIN_WHERE_S || '
             AND PERS.TIPO_PERSONA=' ||
                                 PI_I_S_TIP_PERSONA;
        END IF;
      
        --TIPO DOCUMENTO
        IF PI_I_S_TIPO_DOC <> 0 THEN
          V_SQL_ADMIN_WHERE_S := V_SQL_ADMIN_WHERE_S || '
             AND PERS.TIPO_DOC=' ||
                                 PI_I_S_TIPO_DOC;
        END IF;
      
        --NRO DOCUMENTO
        IF PI_V_S_NRO_DOC IS NOT NULL THEN
          V_SQL_ADMIN_WHERE_S := V_SQL_ADMIN_WHERE_S || '
             AND PERS.NRO_DOC=''' ||
                                 PI_V_S_NRO_DOC || '''';
        END IF;
      
        --APELLIDOS Y NOMBRES
        IF PI_V_S_APE_PATERNO IS NOT NULL THEN
          V_SQL_ADMIN_WHERE_S := V_SQL_ADMIN_WHERE_S || '
             AND PERS.APE_PATERNO LIKE ''' ||
                                 C_CAR_PORCENTAJE || PI_V_S_APE_PATERNO ||
                                 '%''';
        END IF;
      
        IF PI_V_S_APE_MATERNO IS NOT NULL THEN
          V_SQL_ADMIN_WHERE_S := V_SQL_ADMIN_WHERE_S || '
             AND PERS.APE_MATERNO LIKE ''' ||
                                 C_CAR_PORCENTAJE || PI_V_S_APE_MATERNO ||
                                 '%''';
        END IF;
      
        IF PI_V_S_APE_CASADA IS NOT NULL THEN
          V_SQL_ADMIN_WHERE_S := V_SQL_ADMIN_WHERE_S || '
             AND PERS.APE_CASADA LIKE ''' ||
                                 C_CAR_PORCENTAJE || PI_V_S_APE_CASADA ||
                                 '%''';
        END IF;
      
        IF PI_V_S_PRI_NOMBRE IS NOT NULL THEN
          V_SQL_ADMIN_WHERE_S := V_SQL_ADMIN_WHERE_S || '
             AND PERS.PRI_NOMBRE LIKE ''' ||
                                 C_CAR_PORCENTAJE || PI_V_S_PRI_NOMBRE ||
                                 '%''';
        END IF;
      
        IF PI_V_S_SEG_NOMBRE IS NOT NULL THEN
          V_SQL_ADMIN_WHERE_S := V_SQL_ADMIN_WHERE_S || '
             AND PERS.SEG_NOMBRE LIKE ''' ||
                                 C_CAR_PORCENTAJE || PI_V_S_SEG_NOMBRE ||
                                 '%''';
        END IF;
      
        --DENOMINACION O RAZON SOCIAL
        IF PI_V_S_RAZON_SOCIAL IS NOT NULL THEN
          V_SQL_ADMIN_WHERE_S := V_SQL_ADMIN_WHERE_S || '
             AND PERS.RAZON_SOCIAL LIKE ''' ||
                                 C_CAR_PORCENTAJE || PI_V_S_RAZON_SOCIAL ||
                                 '%''';
        END IF;
      
        --TIPO DE EMPRESA
        IF PI_I_S_TIP_EMPRESA <> 0 THEN
          V_SQL_ADMIN_WHERE_S := V_SQL_ADMIN_WHERE_S || '
             AND PERS.TIP_EMPRESA=' ||
                                 PI_I_S_TIP_EMPRESA;
        END IF;
      
        --SECTOR ECONOMICO
        IF PI_N_S_ID_SECT_ECONO <> 0 THEN
          V_SQL_ADMIN_WHERE_S := V_SQL_ADMIN_WHERE_S || '
             AND PERS.ID_SECTOR_ECONOMICO=' ||
                                 PI_N_S_ID_SECT_ECONO;
        END IF;
      
        IF PI_C_S_FLG_ASOCU = '1' THEN
          V_SQL_ADMIN_WHERE_S := V_SQL_ADMIN_WHERE_S || '
             AND PERS.FLG_ASOCU=''' ||
                                 PI_C_S_FLG_ASOCU || '''';
        END IF;
      
        V_SQL_ADMIN_WHERE_S := V_SQL_ADMIN_WHERE_S || '
          )';
      END IF;
    
      DBMS_OUTPUT.PUT_LINE(V_SQL_ADMIN_SELECT);
      DBMS_OUTPUT.PUT_LINE(V_SQL_ADMIN_WHERE_D);
      DBMS_OUTPUT.PUT_LINE(V_SQL_ADMIN_WHERE_DO);
      DBMS_OUTPUT.PUT_LINE(V_SQL_ADMIN_WHERE_S);
    
      EXECUTE IMMEDIATE V_SQL_ADMIN_SELECT || V_SQL_ADMIN_WHERE_D ||
                        V_SQL_ADMIN_WHERE_DO || V_SQL_ADMIN_WHERE_S;
    
    END IF;
  
    IF C_FLG_ADMINISTRADO = '0' THEN
      INSERT INTO T_SCOB_TMP_ADMINISTRADO (ID_MULTA) VALUES ('0');
    END IF;
  
    --MOSTRAR LOS DATOS DE LA CONSULTA
    V_SQL_SELECT_1 := '
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
    V_SQL_SELECT_3 := 'TIPO_MULTA.TXT_DESCRIPCION AS NOM_TIPO_MULTA, --tipo_multa
    scob_pk_expediente.SCOB_FN_DENUNCIANTES_MULTA(mdet.id_multa,0) AS NOM_DENUNCIANTE, --denunciante
    scob_pk_expediente.SCOB_FN_DENUNCIADOS_MULTA(mdet.id_multa,0) AS NOM_DENUNCIADO, --denunciado
    scob_pk_expediente.SCOB_FN_SANCIONADOS_MULTA(mdet.id_multa,0) AS NOM_SANCIONADO, --sancionado
    NULL AS NOM_TIPO_DOC_SANCIONADO,
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
    V_SQL_SELECT_4 := 'NVL(MDET.VALOR_UIT,0) AS VALOR_UIT,
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
    V_SQL_SELECT_5 := 'MULT.FEC_INGRESO_FILE  AS FEC_ULT_INGRESO_AEC,
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
    SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(' ||
                      SCOB_PK_CONSTANTES.C_TBL_ESPECTATIVA_COBRO_EXPCOB ||
                      ',EXPE.COD_EXPECTATIVA_COBRO) AS NOM_EXPECTATIVA_COBRO,
    scob_pk_expediente.SCOB_FN_SANCIONADOS_REGION(mdet.id_multa,0) AS REGION_SANCIONADO,

    DECODE(EXPE.ID_EXPEDIENTE,NULL,MULT.FEC_ENVIO_RIESGO,MULT.FEC_ENVIO_RIESGO_EXP) AS FEC_MARCA_ENVIO_INFOCORP, --(FECHA EN QUE "MARCA" PARA ENVIAR A INFOCORP)
    ARCH_CEN.NRO_ORDEN AS NRO_ENVIO_ARCHIVO, --nro_envarch_central
    ARCH_CEN.FEC_ENVIO AS FEC_ENVIO_ARCHIVO, --fec_envarch_central
    (CASE
      WHEN MULT.ESTADO_ENVIO_ARCHIVO = 2 THEN ''ARCHIVO CENTRAL''
      WHEN MULT.ESTADO_MULTA IN (9,10,11,12,13) THEN ''AEC''
      ELSE '' '' END) AS UBI_FISICA_EXPEDIENTE,
    NULL AS COD_SITUACION_MULTA,
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
    V_SQL_JOIN_1 := '
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
     (' || C_FLG_ADMINISTRADO || ' = ''0'' AND ''0''=ADMINISTRADO.ID_MULTA)OR
     (' || C_FLG_ADMINISTRADO ||
                    ' <> ''0'' AND ADMINISTRADO.ID_MULTA = MULT.ID_MULTA)
  )
  LEFT JOIN (SELECT DET.ID_MULTA,
                    ORGA.TIPO_INSTANCIA AS NRO_NIVEL,
                    DET.NRO_RESOLUCION,
                    DET.FEC_RESOLUCION,
                    DET.FEC_NOTIFICACION_RESOLUCION,
                    DET.FEC_ESTADO_SGTE_INSTANCIA,
                    TO_DATE(TO_CHAR(DET.AUDFECCREACION,''DD/MM/YYYY''),''DD/MM/YYYY'') AS FEC_REGISTRO,
                    DET.AUDUSUCREACION AS LOGIN_USUARIO_REGISTRO,
                    DET.NRO_RESOLUCION_DECLARACION,
                    DET.FEC_DECLARACION AS FEC_CONS_FIRME,
                    DET.FEC_NOTIFICACION_DECLARACION AS FEC_NOTF_CONS_FIRME
          FROM T_SCOB_MULTA_DETAL DET
         INNER JOIN T_SCOB_ORGANO_RESOLUTIVO ORGA
            ON ORGA.ID_ORGANO_RESOLUTIVO = DET.ID_ORGANO_RESOLUTIVO
         WHERE DET.ESTADO = ''1''
           AND ORGA.TIPO_INSTANCIA = 1) NIVEL1
        ON NIVEL1.ID_MULTA = MULT.ID_MULTA
  LEFT JOIN (SELECT DET.ID_MULTA,
                    ORGA.TIPO_INSTANCIA,
                    DET.NRO_RESOLUCION,
                    DET.FEC_RESOLUCION,
                    DET.FEC_NOTIFICACION_RESOLUCION,
                    DET.FEC_ESTADO_SGTE_INSTANCIA,
                    TO_DATE(TO_CHAR(DET.AUDFECCREACION,''DD/MM/YYYY''),''DD/MM/YYYY'') AS FEC_REGISTRO,
                    DET.AUDUSUCREACION AS LOGIN_USUARIO_REGISTRO,
                    DET.NRO_RESOLUCION_DECLARACION,
                    DET.FEC_DECLARACION AS FEC_CONS_FIRME,
                    DET.FEC_NOTIFICACION_DECLARACION AS FEC_NOTF_CONS_FIRME
          FROM T_SCOB_MULTA_DETAL DET
         INNER JOIN T_SCOB_ORGANO_RESOLUTIVO ORGA
            ON ORGA.ID_ORGANO_RESOLUTIVO = DET.ID_ORGANO_RESOLUTIVO
         WHERE DET.ESTADO = ''1''
           AND ORGA.TIPO_INSTANCIA = 2) NIVEL2
        ON NIVEL2.ID_MULTA = MULT.ID_MULTA
  LEFT JOIN (SELECT DET.ID_MULTA,
                    ORGA.TIPO_INSTANCIA,
                    DET.NRO_RESOLUCION,
                    DET.FEC_RESOLUCION,
                    DET.FEC_NOTIFICACION_RESOLUCION,
                    DET.FEC_ESTADO_SGTE_INSTANCIA,
                    TO_DATE(TO_CHAR(DET.AUDFECCREACION,''DD/MM/YYYY''),''DD/MM/YYYY'') AS FEC_REGISTRO,
                    DET.AUDUSUCREACION AS LOGIN_USUARIO_REGISTRO,
                    DET.NRO_RESOLUCION_DECLARACION,
                    DET.FEC_DECLARACION AS FEC_CONS_FIRME,
                    DET.FEC_NOTIFICACION_DECLARACION AS FEC_NOTF_CONS_FIRME
          FROM T_SCOB_MULTA_DETAL DET
         INNER JOIN T_SCOB_ORGANO_RESOLUTIVO ORGA
            ON ORGA.ID_ORGANO_RESOLUTIVO = DET.ID_ORGANO_RESOLUTIVO
         WHERE DET.ESTADO = ''1''
           AND ORGA.TIPO_INSTANCIA = 3) NIVEL3
        ON NIVEL3.ID_MULTA = MULT.ID_MULTA
  INNER JOIN T_SCOB_MATERIA MATE
       ON MATE.ID_MATERIA = MULT.ID_MATERIA
  INNER JOIN T_SCOB_TIPO_PROCEDIMIENTO TIPO_PROC
       ON TIPO_PROC.ID_TIPO_PROCEDIMIENTO = MATE.ID_TIPO_PROCEDIMIENTO
  INNER JOIN T_SCOB_SUBMATERIA SUBM
       ON SUBM.ID_SUBMATERIA = MULT.ID_SUB_MATERIA
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
  
    V_SQL_JOIN_2 := '
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
  LEFT JOIN T_SCOB_MULTA_COBRANZA MCOB
       ON MCOB.ID_MULTA = MULT.ID_MULTA
       AND MCOB.FLG_ACTUAL = ''1''
       AND MCOB.ESTADO = ''1''';
  
    V_SQL_JOIN_3 := '
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
  
    V_SQL_JOIN_4 := '
  LEFT JOIN T_SCOB_MULTA_ARCHIVO_CENTRAL EXPED_ARCH_CEN
       ON EXPED_ARCH_CEN.ID_MULTA = MULT.ID_MULTA
       AND EXPED_ARCH_CEN.FLG_ACTUAL = ''1''
       AND EXPED_ARCH_CEN.ESTADO = ''1''
  LEFT JOIN T_SCOB_ARCHIVO_CENTRAL ARCH_CEN
       ON ARCH_CEN.ID_ARCHIVO_CENTRAL = EXPED_ARCH_CEN.ID_MULTA_ARCHIVO_CENTRAL
       AND ARCH_CEN.ESTADO = ''1''';
  
    V_SQL_WHERE_1 := V_SQL_WHERE_1 || '
  WHERE MULT.ESTADO = ''1''';
  
    ---------------------------------------------------------------------------
    -- FILTROS MULTA
    ---------------------------------------------------------------------------
    --AREA MACRO
    IF PI_V_AREA_MACRO IS NOT NULL THEN
      V_SQL_WHERE_1 := V_SQL_WHERE_1 || '
     AND INSTR(''' || PI_V_AREA_MACRO ||
                       ''',''|'' || TO_CHAR(TIPO_PROC.ID_TIPO_PROCEDIMIENTO) || ''|'' )>0';
    END IF;
  
    --CODIGO MULTA
    IF PI_V_CUM_INI IS NOT NULL THEN
      V_SQL_WHERE_1 := V_SQL_WHERE_1 || '
     AND MULT.ANIO||MULT.CUM BETWEEN ''' ||
                       PI_V_CUM_INI || ''' AND ''' || PI_V_CUM_FIN || '''';
    END IF;
  
    --FECHA GENERACION MULTA
    IF PI_V_FEC_GEN_CUM_INI IS NOT NULL THEN
      V_SQL_WHERE_1 := V_SQL_WHERE_1 || '
     AND TO_DATE(TO_CHAR(MULT.FEC_INGRESO,''DD/MM/YYYY''),''DD/MM/YYYY'')
     BETWEEN TO_DATE(''' || PI_V_FEC_GEN_CUM_INI ||
                       ''',''DD/MM/YYYY'') AND TO_DATE(''' ||
                       PI_V_FEC_GEN_CUM_FIN || ''',''DD/MM/YYYY'')
     ';
    END IF;
  
    --SEDE
    IF PI_V_ID_SEDE IS NOT NULL THEN
      V_SQL_WHERE_1 := V_SQL_WHERE_1 || '
     AND INSTR(''' || PI_V_ID_SEDE ||
                       ''',''|'' || TO_CHAR(MULT.ID_SEDE) || ''|'' )>0';
    END IF;
  
    --UBIGEO SEDE
    IF PI_V_ID_COD_DPTO_SEDE IS NOT NULL THEN
      V_SQL_WHERE_1 := V_SQL_WHERE_1 || '
     AND SEDE.COD_DPTO=''' || PI_V_ID_COD_DPTO_SEDE || '''';
    END IF;
  
    IF PI_V_ID_COD_PROV_SEDE IS NOT NULL THEN
      V_SQL_WHERE_2 := V_SQL_WHERE_2 || '
     AND SEDE.COD_PROV=''' || PI_V_ID_COD_PROV_SEDE || '''';
    END IF;
  
    IF PI_V_ID_COD_DIST_SEDE IS NOT NULL THEN
      V_SQL_WHERE_2 := V_SQL_WHERE_2 || '
     AND SEDE.COD_DIST=''' || PI_V_ID_COD_DIST_SEDE || '''';
    END IF;
  
    --ORGANO RESOLUTIVO
    IF PI_V_ID_ORG_RESOL IS NOT NULL THEN
      V_SQL_WHERE_2 := V_SQL_WHERE_2 || '
     AND INSTR(''' || PI_V_ID_ORG_RESOL ||
                       ''',''|'' || TO_CHAR(MDET.ID_ORGANO_RESOLUTIVO) || ''|'' )>0';
    END IF;
  
    --UBIGEO ORGANO RESOLUTIVO
    IF PI_V_ID_COD_DPTO_ORGR IS NOT NULL THEN
      V_SQL_WHERE_2 := V_SQL_WHERE_2 || '
     AND ORGR.COD_DPTO=''' || PI_V_ID_COD_DPTO_ORGR || '''';
    END IF;
  
    IF PI_V_ID_COD_PROV_ORGR IS NOT NULL THEN
      V_SQL_WHERE_2 := V_SQL_WHERE_2 || '
     AND ORGR.COD_PROV=''' || PI_V_ID_COD_PROV_ORGR || '''';
    END IF;
    IF PI_V_ID_COD_DIST_ORGR IS NOT NULL THEN
      V_SQL_WHERE_3 := V_SQL_WHERE_3 || '
     AND ORGR.COD_DIST=''' || PI_V_ID_COD_DIST_ORGR || '''';
    END IF;
  
    --TIPO INSTANCIA
    IF PI_V_ID_NRO_INSTANCIA IS NOT NULL THEN
      V_SQL_WHERE_3 := V_SQL_WHERE_3 || '
     AND INSTR(''' || PI_V_ID_NRO_INSTANCIA ||
                       ''',''|'' || TO_CHAR(ORGR.TIPO_INSTANCIA) || ''|'' )>0';
    END IF;
  
    --MATERIA
    IF PI_V_ID_MATERIA IS NOT NULL THEN
      V_SQL_WHERE_3 := V_SQL_WHERE_3 || '
     AND INSTR(''' || PI_V_ID_MATERIA ||
                       ''',''|'' || TO_CHAR(MULT.ID_MATERIA) || ''|'' )>0';
    END IF;
  
    --SUBMATERIA
    IF PI_V_ID_SUB_MATERIA IS NOT NULL THEN
      V_SQL_WHERE_3 := V_SQL_WHERE_3 || '
     AND INSTR(''' || PI_V_ID_SUB_MATERIA ||
                       ''',''|'' || TO_CHAR(MULT.ID_SUB_MATERIA) || ''|'' )>0';
    END IF;
  
    --NUMERO EXPEDIENTE UNICO
    IF PI_V_NRO_EXP_UNICO_INI IS NOT NULL THEN
      V_SQL_WHERE_3 := V_SQL_WHERE_3 || '
     AND TO_NUMBER(MULT.NRO_EXPED_UNICO) --@0001
        BETWEEN ''' || PI_V_NRO_EXP_UNICO_INI ||
                       ''' and ''' || PI_V_NRO_EXP_UNICO_FIN || '''';
    END IF;
  
    --NUMERO EXPEDIENTE ADMINISTRATIVO
    IF PI_V_NROEXPADM_NIVEL IS NOT NULL THEN
      V_SQL_WHERE_3 := V_SQL_WHERE_3 || '
     AND MDET.NRO_EXP_NIVEL LIKE ''' ||
                       PI_V_NROEXPADM_NIVEL || '%''';
    END IF;
  
    --NRO RESOLUCION OR
    IF PI_V_NRO_RESOL IS NOT NULL THEN
      V_SQL_WHERE_3 := V_SQL_WHERE_3 || '
     AND NIVEL1.NRO_RESOLUCION LIKE ''' ||
                       PI_V_NRO_RESOL || '%''';
    END IF;
  
    --FECHA RESOLUCION OR
    IF PI_V_FEC_RESO_OR_INI IS NOT NULL THEN
      V_SQL_WHERE_3 := V_SQL_WHERE_3 || '
     AND TO_DATE(TO_CHAR(MDET.FEC_RESOLUCION,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE(''' || PI_V_FEC_RESO_OR_INI ||
                       ''',''DD/MM/YYYY'') AND TO_DATE(''' ||
                       PI_V_FEC_RESO_OR_FIN || ''',''DD/MM/YYYY'')';
    END IF;
  
    --FECHA NOTIFICACION RESOLUCION OR
    IF PI_V_FEC_NOTIFI_OR_INI IS NOT NULL THEN
      V_SQL_WHERE_4 := V_SQL_WHERE_4 || '
     AND TO_DATE(TO_CHAR(MDET.FEC_NOTIFICACION_RESOLUCION,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE(''' ||
                       PI_V_FEC_NOTIFI_OR_INI ||
                       ''',''DD/MM/YYYY'') AND TO_DATE(''' ||
                       PI_V_FEC_NOTIFI_OR_FIN || ''',''DD/MM/YYYY'')';
    END IF;
  
    --FECHA GENERACION DE LA SEC
    IF PI_V_FEC_GENERACION_SEC_INI IS NOT NULL THEN
      V_SQL_WHERE_4 := V_SQL_WHERE_4 || '
     AND TO_DATE(TO_CHAR(MULT.FEC_GENERACION_SEC,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE(''' ||
                       PI_V_FEC_GENERACION_SEC_INI ||
                       ''',''DD/MM/YYYY'') AND TO_DATE(''' ||
                       PI_V_FEC_GENERACION_SEC_FIN || ''',''DD/MM/YYYY'')';
    END IF;
  
    --FECHA INGRESO AL AEC
    IF PI_V_FEC_RECEPCION_AEC_INI IS NOT NULL THEN
      V_SQL_WHERE_4 := V_SQL_WHERE_4 || '
     AND TO_DATE(TO_CHAR(MULT.FEC_INGRESO_FILE,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE(''' ||
                       PI_V_FEC_RECEPCION_AEC_INI ||
                       ''',''DD/MM/YYYY'') AND TO_DATE(''' ||
                       PI_V_FEC_RECEPCION_AEC_FIN || ''',''DD/MM/YYYY'')';
    END IF;
  
    --AÑO INGRESO AL AEC
    IF PI_V_ANIO_INGRESO_AEC_INI IS NOT NULL THEN
      V_SQL_WHERE_4 := V_SQL_WHERE_4 || '
     AND MCOB.ANIO
         BETWEEN ''' || PI_V_ANIO_INGRESO_AEC_INI ||
                       ''' AND ''' || PI_V_ANIO_INGRESO_AEC_FIN || '''';
    END IF;
  
    --NRO INGRESO AL AEC
    IF PI_V_NRO_INGRESO_AEC_INI IS NOT NULL THEN
      V_SQL_WHERE_4 := V_SQL_WHERE_4 || '
     AND MCOB.NRO_INGRESO
         BETWEEN ''' ||
                       LPAD(PI_V_NRO_INGRESO_AEC_INI, 4, '0000') ||
                       ''' AND ''' ||
                       LPAD(PI_V_NRO_INGRESO_AEC_FIN, 4, '0000') || '''';
    END IF;
  
    --AÑO FILE
    IF PI_V_ANIO_FILE_INI IS NOT NULL THEN
      V_SQL_WHERE_4 := V_SQL_WHERE_4 || '
     AND MULT.ANIO_FILE_AEC BETWEEN ''' ||
                       PI_V_ANIO_FILE_INI || ''' AND ''' ||
                       PI_V_ANIO_FILE_FIN || '''';
    END IF;
  
    --NRO FILE
    IF PI_V_NRO_FILE_INI IS NOT NULL THEN
      V_SQL_WHERE_4 := V_SQL_WHERE_4 || '
     AND MULT.NRO_FILE_AEC
         BETWEEN ''' ||
                       LPAD(PI_V_NRO_FILE_INI, 10, '0000000000') ||
                       ''' AND ''' ||
                       LPAD(PI_V_NRO_FILE_FIN, 10, '0000000000') || '''';
    END IF;
  
    --VALOR UIT
    IF PI_N_VALOR_UIT_INI > 0 THEN
      V_SQL_WHERE_5 := V_SQL_WHERE_5 || '
     AND MDET.VALOR_UIT
         BETWEEN ' || PI_N_VALOR_UIT_INI || ' AND ' ||
                       PI_N_VALOR_UIT_FIN;
    END IF;
  
    --MONTO UIT
    IF PI_N_MONTO_UIT_INI > 0 THEN
      V_SQL_WHERE_5 := V_SQL_WHERE_5 || '
     AND MULT.MONTO_UIT
         BETWEEN ' || PI_N_MONTO_UIT_INI || ' AND ' ||
                       PI_N_MONTO_UIT_FIN;
    END IF;
  
    --SALDO UIT
    IF PI_N_SALDO_INI > 0 THEN
      V_SQL_WHERE_5 := V_SQL_WHERE_5 || '
     AND MULT.SALDO
         BETWEEN ' || PI_N_SALDO_INI || ' AND ' ||
                       PI_N_SALDO_FIN;
    END IF;
  
    --TIPO MULTA
    IF PI_V_ID_TIPO_MULTA IS NOT NULL THEN
      V_SQL_WHERE_5 := V_SQL_WHERE_5 || '
     AND INSTR(''' || PI_V_ID_TIPO_MULTA ||
                       ''',''|'' || MULT.FLG_TIPO_MULTA || ''|'' )>0';
    END IF;
  
    --ESTADO MULTA OR
    IF PI_V_COD_ESTADO_MULTA_RESOL IS NOT NULL THEN
      V_SQL_WHERE_5 := V_SQL_WHERE_5 || '
     AND INSTR(''' || PI_V_COD_ESTADO_MULTA_RESOL ||
                       ''',''|'' || TO_CHAR(MDET.ESTADO_MULTA) || ''|'' )>0';
    END IF;
  
    --ESTADO PAGO MULTA
    IF PI_V_COD_ESTADO_PAGO IS NOT NULL THEN
      V_SQL_WHERE_5 := V_SQL_WHERE_5 || '
     AND INSTR(''' || PI_V_COD_ESTADO_PAGO ||
                       ''',''|'' || TO_CHAR(MULT.COD_ESTADO_PAGO) || ''|'' )>0';
    END IF;
  
    --FECHA ESTADO MULTA OR
    IF PI_V_FEC_ESTADO_MULTA_OR_INI IS NOT NULL THEN
      V_SQL_WHERE_6 := V_SQL_WHERE_6 || '
     AND TO_DATE(TO_CHAR(MDET.FEC_ESTADO_MULTA,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE(''' ||
                       PI_V_FEC_ESTADO_MULTA_OR_INI ||
                       ''',''DD/MM/YYYY'') AND TO_DATE(''' ||
                       PI_V_FEC_ESTADO_MULTA_OR_FIN || ''',''DD/MM/YYYY'')';
    END IF;
  
    --FECHA ESTADO MULTA COB
    IF PI_V_FEC_ESTADO_MULTA_COB_INI IS NOT NULL THEN
      V_SQL_WHERE_6 := V_SQL_WHERE_6 || '
     AND TO_DATE(TO_CHAR(MULT.FEC_ESTADO_MULTA,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE(''' ||
                       PI_V_FEC_ESTADO_MULTA_COB_INI ||
                       ''',''DD/MM/YYYY'') AND TO_DATE(''' ||
                       PI_V_FEC_ESTADO_MULTA_COB_FIN ||
                       ''',''DD/MM/YYYY'')';
    END IF;
  
    --ESTADO MULTA COBRANZA
    IF PI_V_COD_ESTADO_MULTA_COB IS NOT NULL THEN
      V_SQL_WHERE_6 := V_SQL_WHERE_6 || '
     AND INSTR(''' || PI_V_COD_ESTADO_MULTA_COB ||
                       ''',''|'' || TO_CHAR(MULT.ESTADO_MULTA) || ''|'' )>0';
    END IF;
  
    --MOTIVO MULTA COBRANZA
    IF PI_V_COD_MOTIVO_MULTA_COB IS NOT NULL THEN
      V_SQL_WHERE_6 := V_SQL_WHERE_6 || '
     AND INSTR(''' || PI_V_COD_MOTIVO_MULTA_COB ||
                       ''',''|'' || MULT.COD_MOTIVO || ''|'' )>0';
    END IF;
  
    --INDICADOR DE PAGO
    IF PI_V_IND_TIPO_PAGO IS NOT NULL THEN
      V_SQL_WHERE_6 := V_SQL_WHERE_6 || '
     AND INSTR(''' || PI_V_IND_TIPO_PAGO ||
                       ''',''|'' || TO_CHAR(SIT_MULTA.COD_SITUACION_MULTA) || ''|'' )>0';
    END IF;
  
    --INDICADOR PORCENTAJE ASOCU MULTA
    IF PI_C_FLG_ASOCU_MULTA <> '0' THEN
      V_SQL_WHERE_6 := V_SQL_WHERE_6 || '
     AND NVL(MDET.POR_ASOCU,0) > 0';
    END IF;
  
    --EXPECTATIVA DE COBRO
    IF PI_V_ID_EXPECTATIVA_COBRO IS NOT NULL THEN
      V_SQL_WHERE_7 := V_SQL_WHERE_7 || '
     AND INSTR(''' || PI_V_ID_EXPECTATIVA_COBRO ||
                       ''',''|'' || TO_CHAR(EXPE.COD_EXPECTATIVA_COBRO) || ''|'' )>0';
    END IF;
  
    --INDICADOR EMBARGO
    IF PI_C_FLG_IND_EMBARGO <> '0' THEN
      V_SQL_WHERE_7 := V_SQL_WHERE_7 || '
     AND NVL(EXPE.FLG_EMBARGO,''0'') = ''1''';
    END IF;
  
    --FECHA ULTIMA GENERACION PRECOACTIVO
    IF PI_V_FEC_CARTA_PRECOACTIVA_INI IS NOT NULL THEN
      V_SQL_WHERE_7 := V_SQL_WHERE_7 || '
     AND TO_DATE(TO_CHAR(MULT.FEC_ULT_GEN_PRECOACTIVA,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE(''' ||
                       PI_V_FEC_CARTA_PRECOACTIVA_INI ||
                       ''',''DD/MM/YYYY'') AND TO_DATE(''' ||
                       PI_V_FEC_CARTA_PRECOACTIVA_FIN ||
                       ''',''DD/MM/YYYY'')';
    END IF;
  
    --FECHA RECEPCION FILE
    IF PI_V_FEC_RECEPCION_FILE_INI IS NOT NULL THEN
      V_SQL_WHERE_7 := V_SQL_WHERE_7 || '
     AND TO_DATE(TO_CHAR(MULT.FEC_INGRESO_AEC,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE(''' ||
                       PI_V_FEC_RECEPCION_FILE_INI ||
                       ''',''DD/MM/YYYY'') AND TO_DATE(''' ||
                       PI_V_FEC_RECEPCION_FILE_FIN || ''',''DD/MM/YYYY'')';
    END IF;
  
    ---------------------------------------------------------------------------
    -- FILTROS EXPEDIENTE
    ---------------------------------------------------------------------------
    --ESTADO EXPEDIENTE COBRANZA
    IF PI_V_COD_ESTADO_EXPED_COB IS NOT NULL THEN
      V_SQL_WHERE_7 := V_SQL_WHERE_7 || '
     AND INSTR(''' || PI_V_COD_ESTADO_EXPED_COB ||
                       ''',''|'' || TO_CHAR(EXPE.ESTADO_EXPEDIENTE) || ''|'' )>0';
    END IF;
  
    --AÑO EXPEDIENTE COBRANZA
    IF PI_V_ANIO IS NOT NULL THEN
      V_SQL_WHERE_7 := V_SQL_WHERE_7 || '
     AND EXPE.ANIO=''' || PI_V_ANIO || '''';
    END IF;
  
    --NRO EXPEDIENTE COBRANZA
    IF PI_V_NRO_EXP_COB_INI > 0 THEN
      V_SQL_WHERE_7 := V_SQL_WHERE_7 || '
     AND EXPE.NRO_EXPEDIENTE
         BETWEEN lpad(''' || PI_V_NRO_EXP_COB_INI ||
                       ''',10,''0000000000'') AND lpad(''' ||
                       PI_V_NRO_EXP_COB_FIN || ''',10,''0000000000'')';
    END IF;
  
    --FECHA GENERACION EXPEDIENTE COBRANZA
    IF PI_V_FEC_GEN_EXPED_COB_INI IS NOT NULL THEN
      V_SQL_WHERE_8 := V_SQL_WHERE_8 || '
     AND TO_DATE(TO_CHAR(EXPE.FEC_INGRESO,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE(''' ||
                       PI_V_FEC_GEN_EXPED_COB_INI ||
                       ''',''DD/MM/YYYY'') AND TO_DATE(''' ||
                       PI_V_FEC_GEN_EXPED_COB_FIN || ''',''DD/MM/YYYY'')';
    END IF;
  
    --GESTOR COBRANZA
    IF PI_V_GESTOR_COBRANZA IS NOT NULL THEN
      V_SQL_WHERE_8 := V_SQL_WHERE_8 || '
     AND INSTR(''' || PI_V_GESTOR_COBRANZA ||
                       ''',''|'' || TO_CHAR(MULT.ID_USUARIO_ASIG_COBRANZA) || ''|'' )>0';
    END IF;
  
    --FECHA EMISION DE LA REC
    IF PI_V_FEC_EMI_REC_INI IS NOT NULL THEN
      V_SQL_WHERE_8 := V_SQL_WHERE_8 || '
     AND TO_DATE(TO_CHAR(MULT.FEC_EMISION_REC,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE(''' || PI_V_FEC_EMI_REC_INI ||
                       ''',''DD/MM/YYYY'') AND TO_DATE(''' ||
                       NVL(PI_V_FEC_EMI_REC_FIN, PI_V_FEC_EMI_REC_INI) ||
                       ''',''DD/MM/YYYY'')';
    END IF;
  
    --FECHA NOTIFICACION DE LA REC
    IF PI_V_FEC_NOTI_REC_INI IS NOT NULL THEN
      V_SQL_WHERE_8 := V_SQL_WHERE_8 || '
     AND TO_DATE(TO_CHAR(MULT.FEC_NOTIF_REC,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE(''' || PI_V_FEC_NOTI_REC_INI ||
                       ''',''DD/MM/YYYY'') AND TO_DATE(''' ||
                       PI_V_FEC_NOTI_REC_FIN || ''',''DD/MM/YYYY'')';
    END IF;
  
    --MOTIVO EXPEDIENTE COBRANZA
    IF PI_V_COD_MOTIVO_EXPED_COB IS NOT NULL THEN
      V_SQL_WHERE_8 := V_SQL_WHERE_8 || '
     AND INSTR(''' || PI_V_COD_MOTIVO_EXPED_COB ||
                       ''',''|'' || TO_CHAR(EXPE.ID_MOTIVO) || ''|'' )>0';
    END IF;
  
    --FECHA ULTIMO ESTADO EXPEDIENTE
    IF PI_V_FEC_EST_EXPED_COB_INI IS NOT NULL THEN
      V_SQL_WHERE_9 := V_SQL_WHERE_9 || '
     AND TO_DATE(TO_CHAR(EXPE.FEC_ESTADO_EXPEDIENTE,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE(''' ||
                       PI_V_FEC_EST_EXPED_COB_INI ||
                       ''',''DD/MM/YYYY'') AND TO_DATE(''' ||
                       PI_V_FEC_EST_EXPED_COB_FIN || ''',''DD/MM/YYYY'')';
    END IF;
  
    --NUMERO DE ENVIO A ARCHIVO CENTRAL
    IF PI_V_NUM_ENV_ARCH_INI IS NOT NULL THEN
      V_SQL_WHERE_9 := V_SQL_WHERE_9 || '
     AND ARCH_CEN.NRO_ORDEN
         BETWEEN LPAD(''' || PI_V_NUM_ENV_ARCH_INI ||
                       ''',4,''0000'') AND LPAD(''' ||
                       PI_V_NUM_ENV_ARCH_FIN || ''',4,''0000'')';
    END IF;
  
    --FECHA ENVIO ARCHIVO CENTRAL
    IF PI_V_FEC_ENVI_ARCH_INI IS NOT NULL THEN
      V_SQL_WHERE_9 := V_SQL_WHERE_9 || '
     AND TO_DATE(TO_CHAR(ARCH_CEN.FEC_ENVIO,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE(''' ||
                       PI_V_FEC_ENVI_ARCH_INI ||
                       ''',''DD/MM/YYYY'') AND TO_DATE(''' ||
                       PI_V_FEC_ENVI_ARCH_FIN || ''',''DD/MM/YYYY'')';
    END IF;
  
    --NRO OFICIO SUNAT
    IF PI_V_NRO_OFIC_SUNAT_INI IS NOT NULL THEN
      V_SQL_WHERE_9 := V_SQL_WHERE_9 || '
     AND (MUAN.NRO_OFICIO_SUNAT_CODIGO || MUAN.NRO_OFICIO_SUNAT_ANIO ||
     MUAN.NRO_OFICIO_SUNAT_PREFIJO || MUAN.NRO_OFICIO_SUNAT_CORRELATIVO)
     BETWEEN ''' || PI_V_NRO_OFIC_SUNAT_INI ||
                       ''' AND ''' || PI_V_NRO_OFIC_SUNAT_FIN || '''';
    END IF;
  
    --DERECHO ANTIDUMOPING
    IF PI_N_DERE_ANTIDUMP_INI > 0 THEN
      V_SQL_WHERE_9 := V_SQL_WHERE_9 || '
     AND MUAN.MONTO_ANTIDUMPING
         BETWEEN ' || PI_N_DERE_ANTIDUMP_INI ||
                       ' AND ' || PI_N_DERE_ANTIDUMP_FIN;
    END IF;
  
    --PARTIDA ARANCELARIA
    IF PI_V_NRO_PARTI_INI IS NOT NULL THEN
      V_SQL_WHERE_10 := V_SQL_WHERE_10 || '
      AND PART.CODIGO
      BETWEEN lpad(''' || PI_V_NRO_PARTI_INI ||
                        ''',10,''0000000000'') AND lpad(''' ||
                        PI_V_NRO_PARTI_FIN || ''',10,''0000000000'')';
    END IF;
  
    --MEMO ANTIDUMPING --FALTA EL CAMPO NO EXISTE EN LA INTERFAZ
    --NRO DUA
    IF PI_V_NRO_DUA_INI IS NOT NULL THEN
      V_SQL_WHERE_10 := V_SQL_WHERE_10 || '
     AND (MUAN.NRO_DUA_CODIGO || MUAN.NRO_DUA_ANIO || MUAN.NRO_DUA_CORRELATIVO)
         BETWEEN ''' || PI_V_NRO_DUA_INI ||
                        ''' AND ''' || PI_V_NRO_DUA_FIN || '''';
    END IF;
  
    --NRO LIQUIDACION COBRANZA
    IF PI_V_NRO_LIQ_COB_INI IS NOT NULL THEN
      V_SQL_WHERE_10 := V_SQL_WHERE_10 || '
     AND (MUAN.NRO_LIQUIDACION_CODIGO || MUAN.NRO_LIQUIDACION_ANIO || MUAN.NRO_LIQUIDACION_CORRELATIVO)
         BETWEEN ''' || PI_V_NRO_LIQ_COB_INI ||
                        ''' AND ''' || PI_V_NRO_LIQ_COB_FIN || '''';
    END IF;
  
    --INTENDENCIA
    IF PI_V_ID_INTENDENCIA IS NOT NULL THEN
      V_SQL_WHERE_10 := V_SQL_WHERE_10 || '
     AND INSTR(''' || PI_V_ID_INTENDENCIA ||
                        ''',''|'' || TO_CHAR(MUAN.ID_INTENDENCIA) || ''|'' )>0';
    END IF;
  
    --FECHA ASIGNACION GESTOR COBRANZA
    IF PI_V_FEC_ASIG_GESTOR_INI IS NOT NULL THEN
      V_SQL_WHERE_11 := V_SQL_WHERE_11 || '
     AND TO_DATE(TO_CHAR(MULT.FECHA_ASIG_COBRANZA,''DD/MM/YYYY''),''DD/MM/YYYY'')
         BETWEEN TO_DATE(''' ||
                        PI_V_FEC_ASIG_GESTOR_INI ||
                        ''',''DD/MM/YYYY'') AND TO_DATE(''' ||
                        PI_V_FEC_ASIG_GESTOR_FIN || ''',''DD/MM/YYYY'')';
    END IF;
  
    --V_SQL_WHERE_12 := V_SQL_WHERE_12 || ' ORDER BY CUM DESC';
  
    DBMS_OUTPUT.PUT_LINE(V_SQL_SELECT_1);
    DBMS_OUTPUT.PUT_LINE(V_SQL_SELECT_2);
    DBMS_OUTPUT.PUT_LINE(V_SQL_SELECT_3);
    DBMS_OUTPUT.PUT_LINE(V_SQL_SELECT_4);
    DBMS_OUTPUT.PUT_LINE(V_SQL_SELECT_5);
    ---
    DBMS_OUTPUT.PUT_LINE(V_SQL_JOIN_1);
    DBMS_OUTPUT.PUT_LINE(V_SQL_JOIN_2);
    DBMS_OUTPUT.PUT_LINE(V_SQL_JOIN_3);
    DBMS_OUTPUT.PUT_LINE(V_SQL_JOIN_4);
    DBMS_OUTPUT.PUT_LINE(V_SQL_JOIN_5);
    ---
    DBMS_OUTPUT.PUT_LINE(V_SQL_WHERE_1);
    DBMS_OUTPUT.PUT_LINE(V_SQL_WHERE_2);
    DBMS_OUTPUT.PUT_LINE(V_SQL_WHERE_3);
    DBMS_OUTPUT.PUT_LINE(V_SQL_WHERE_4);
    DBMS_OUTPUT.PUT_LINE(V_SQL_WHERE_5);
    ---
    DBMS_OUTPUT.PUT_LINE(V_SQL_WHERE_6);
    DBMS_OUTPUT.PUT_LINE(V_SQL_WHERE_7);
    DBMS_OUTPUT.PUT_LINE(V_SQL_WHERE_8);
    DBMS_OUTPUT.PUT_LINE(V_SQL_WHERE_9);
    DBMS_OUTPUT.PUT_LINE(V_SQL_WHERE_10);
    DBMS_OUTPUT.PUT_LINE(V_SQL_WHERE_11);
    DBMS_OUTPUT.PUT_LINE(V_SQL_WHERE_12);
  
    OPEN PO_CU_RETORNO FOR
    --SELECT SYSDATE FROM DUAL;
    
    V_SQL_SELECT_1 || V_SQL_SELECT_2 || V_SQL_SELECT_3 || V_SQL_SELECT_4 || V_SQL_SELECT_5 || V_SQL_JOIN_1 || V_SQL_JOIN_2 || V_SQL_JOIN_3 || V_SQL_JOIN_4 || V_SQL_JOIN_5 || V_SQL_WHERE_1 || V_SQL_WHERE_2 || V_SQL_WHERE_3 || V_SQL_WHERE_4 || V_SQL_WHERE_5 || V_SQL_WHERE_6 || V_SQL_WHERE_7 || V_SQL_WHERE_8 || V_SQL_WHERE_9 || V_SQL_WHERE_10 || V_SQL_WHERE_11 || V_SQL_WHERE_12;
  
    COMMIT;
  
  END;

END PKG_CONSULTA_AVANZADA;
/
