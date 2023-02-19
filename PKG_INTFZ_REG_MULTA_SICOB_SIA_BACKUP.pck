CREATE OR REPLACE PACKAGE PKG_INTFZ_REG_MULTA_SICOB_SIA IS

    TYPE CUR_RESULT IS REF CURSOR;
       
    PROCEDURE S_OBTENER_LISTA_DENUNCIANTE(PIN_NU_ID_MULTA  IN VARCHAR2,
                                          POUT_CUR_RESULT  OUT CUR_RESULT);

    PROCEDURE S_OBTENER_LISTA_SANCIONADOS(PIN_NU_ID_MULTA  IN VARCHAR2,
                                          POUT_CUR_RESULT  OUT CUR_RESULT);

    PROCEDURE S_REGISTRAR_MULTA_SIA(PIN_NU_ORIGEN        IN NUMBER,
                                    PIN_DT_FECHA_DESDE   IN DATE,
                                    PIN_DT_FECHA_HASTA   IN DATE,
                                    PIN_VC_CUM_INI       IN VARCHAR2,
                                    PIN_VC_CUM_FIN       IN VARCHAR2,
                                    POUT_NU_ERROR        OUT NUMBER,
                                    POUT_VC_ERROR        OUT VARCHAR2);
                                    
   -- ******************************************************************************
   -- Descripción: Procedure que registra la multa en SIA
   --
   -- Input Parameters: PIN_ID_MULTA
   --
   -- Output Parameters: POV_COD_RESULT , POV_MSG_RESULT
   --
   --
   -- Author:      Victor Bendezú
   -- Proyecto:    Migración de SICOB a SIA
   --
   -- Revisiones
   -- Fecha            Autor         Motivo del cambio    
   -- ----------------------------------------------------------------
   -- 10/12/2022     Victor Bendezú  Migración de SICOB a SIA    
   -- ***************************************************************      
   PROCEDURE SP_REGISTRO_MULTA_SICOB_A_SIA(PIN_ID_MULTA    IN VARCHAR2,
                                           POV_COD_RESULT          OUT VARCHAR2,
                                           POV_MSG_RESULT          OUT VARCHAR2
                                           ); 
                                    
END;
/
CREATE OR REPLACE PACKAGE BODY PKG_INTFZ_REG_MULTA_SICOB_SIA AS

    PROCEDURE S_OBTENER_LISTA_DENUNCIANTE(PIN_NU_ID_MULTA  IN VARCHAR2,
                                          POUT_CUR_RESULT  OUT CUR_RESULT) IS
    BEGIN
       OPEN POUT_CUR_RESULT FOR
            SELECT DISTINCT MDET.ID_MULTA,
               MDEN.ID_MULTA_DENUNCIANTE,
               DECODE(PERS.TIPO_PERSONA,
               2,
               PERS.RAZON_SOCIAL,
               PERS.APE_PATERNO || ' ' || PERS.APE_MATERNO || ' ' || PERS.PRI_NOMBRE || ' ' ||
               PERS.SEG_NOMBRE || ' ' || PERS.APE_CASADA) AS NOM_DENUNCIANTE,
               PERS.NRO_DOC AS NRO_DOC_IDENTIDAD
            FROM USR_SICOB.T_SCOB_MULTA_DETAL MDET
            INNER JOIN USR_SICOB.T_SCOB_MULTA_DENUNCIANTE MDEN ON (MDEN.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL AND MDEN.ESTADO = '1')
            INNER JOIN USR_SICOB.T_SCOB_PERSONA PERS ON (PERS.ID_PERSONA = MDEN.ID_PERSONA)
            INNER JOIN USR_SICOB.T_SCOB_MULTA MULT ON (MULT.ID_MULTA = MDET.ID_MULTA)
            WHERE MDET.FLG_ACTUAL = '1'
            AND MDET.ID_MULTA = PIN_NU_ID_MULTA;

    EXCEPTION
        WHEN OTHERS THEN
            PKG_INTFZ_MULTAS.S_UTL_RETORNA_ERROR(PIN_NU_ERROR  => SQLCODE,
                                                 PIN_VC_ERROR  => V_NU_ID_MULTA || ' ' || SQLERRM,
                                                 POUT_NU_ERROR => POUT_NU_ERROR,
                                                 POUT_VC_ERROR => POUT_VC_ERROR);

            DBMS_OUTPUT.PUT_LINE('value error .............');
            V_ERR_MSG := 'Error in procedure PROCEDUR/FUNCTION name ' || DBMS_UTILITY.FORMAT_ERROR_BACKTRACE() || ' - ' || SQLCODE || ':' ||
                         SUBSTR(SQLERRM, 1, 200);
            DBMS_OUTPUT.PUT_LINE(V_ERR_MSG);
    END;


    PROCEDURE S_OBTENER_LISTA_SANCIONADOS(PIN_NU_ID_MULTA  IN VARCHAR2,
                                          POUT_CUR_RESULT  OUT CUR_RESULT) IS
    BEGIN
       OPEN POUT_CUR_RESULT FOR
            SELECT DISTINCT MDET.ID_MULTA,
                MSAN.ID_MULTA_SANCIONADO,
                DECODE(PERS.TIPO_PERSONA,
                       2,
                       PERS.RAZON_SOCIAL,
                       PERS.APE_PATERNO || ' ' || PERS.APE_MATERNO || ' ' || PERS.PRI_NOMBRE || ' ' ||
                       PERS.SEG_NOMBRE || ' ' || PERS.APE_CASADA) AS NOM_SANCIONADO,
                TD.TXT_DESCRIPCION AS TIPO_DOC_IDENTIDAD,
                PERS.NRO_DOC AS NRO_DOC_IDENTIDAD,
                PERS.COD_SANCIONADO AS COD_INDECOPI,
                TD1.TXT_DESCRIPCION AS CALIFICACION,
                NVL(SEEC.DESCRIPCION, 'NO REGISTRA') AS NOM_SECTOR_ECONOMICO,
                NULL AS REGION_SANCIONADO
                FROM USR_SICOB.T_SCOB_MULTA_DETAL MDET
                INNER JOIN USR_SICOB.T_SCOB_MULTA_SANCIONADO MSAN
                ON MSAN.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL
                AND MSAN.ESTADO = '1'
                AND NVL(MSAN.COD_TIPO_PERSONA, '1') = '1'
                INNER JOIN USR_SICOB.T_SCOB_PERSONA PERS
                ON PERS.ID_PERSONA = MSAN.ID_PERSONA
                INNER JOIN USR_SICOB.T_SCOB_TABLA_DET TD
                ON TD.ID_TABLA = 10
                AND TD.COD_INTERNO = PERS.TIPO_DOC
                LEFT JOIN USR_SICOB.T_SCOB_TABLA_DET TD1
                ON TD1.ID_TABLA = 13
                AND TD1.COD_INTERNO = PERS.TIPO_DOC
                LEFT JOIN USR_SICOB.T_SCOB_SECTOR_ECONOMICO SEEC
                ON SEEC.ID_SECTOR_ECONOMICO = PERS.ID_SECTOR_ECONOMICO
                INNER JOIN USR_SICOB.T_SCOB_MULTA MULT
                ON (MULT.ID_MULTA = MDET.ID_MULTA)
                WHERE MDET.FLG_ACTUAL = '1'
                AND MDET.ID_MULTA = PIN_NU_ID_MULTA;

    EXCEPTION
        WHEN OTHERS THEN
            PKG_INTFZ_MULTAS.S_UTL_RETORNA_ERROR(PIN_NU_ERROR  => SQLCODE,
                                                 PIN_VC_ERROR  => V_NU_ID_MULTA || ' ' || SQLERRM,
                                                 POUT_NU_ERROR => POUT_NU_ERROR,
                                                 POUT_VC_ERROR => POUT_VC_ERROR);

            DBMS_OUTPUT.PUT_LINE('value error .............');
            V_ERR_MSG := 'Error in procedure PROCEDUR/FUNCTION name ' || DBMS_UTILITY.FORMAT_ERROR_BACKTRACE() || ' - ' || SQLCODE || ':' ||
                         SUBSTR(SQLERRM, 1, 200);
            DBMS_OUTPUT.PUT_LINE(V_ERR_MSG);
    END;


    PROCEDURE S_REGISTRAR_MULTA_SIA(PIN_NU_ORIGEN        IN NUMBER,
                                    PIN_DT_FECHA_DESDE   IN DATE,
                                    PIN_DT_FECHA_HASTA   IN DATE,
                                    PIN_VC_CUM_INI       IN VARCHAR2,
                                    PIN_VC_CUM_FIN       IN VARCHAR2,
                                    POUT_NU_ERROR        OUT NUMBER,
                                    POUT_VC_ERROR        OUT VARCHAR2) IS

        V_TAB_PARAM usr_sia_intfz.pkg_intfz_multas.TAB_PARAM_BUSCA_MULTA_AVAN;
        V_CUR_MULTA CUR_RESULT;
        V_VC_CORRELATIVO VARCHAR2(20);
        V_NUM_CONTADOR NUMBER;
        V_VC_ESTADO_MULTA VARCHAR(2);
        V_VC_ESTADO_COB VARCHAR(2);
        V_VC_ESTADO_EXP VARCHAR(2);
        V_VC_ESTADO_PAGO VARCHAR(2);
        V_NUM_SECUENCIA NUMBER;
        V_VC_DOC_SANCIONADO VARCHAR(50);
        V_NUM_PERSONA NUMBER;
        V_VC_TDOC_PERSONA VARCHAR(10);
        V_VC_NOMBRE_PERSONA VARCHAR(1000);
        V_VC_NOMBRE_DENUNCIANTE VARCHAR(1000); --
        V_VC_ES_ASOCIACION      VARCHAR2(2); --
        V_VC_DOC_DENUNCIANTE    VARCHAR2(50); --
        V_NUM_PERSONA_DENUN NUMBER; --
        V_VC_EXP_COB_ANIO VARCHAR(4);
        V_VC_EXP_COB_NRO VARCHAR(50);
        V_REC_MULTA     REC_PARAM_BUSCA_MULTA_OUT ;
        V_REC_CRONOGRAMA PKG_INTFZ_MULTAS_SIA.REC_CRONO_TOTAL;
        V_CUR_CRONOGRAMA CUR_RESULT;

        V_NU_VUELTA      number;
        V_DT_APROBACIONCUOTA date;
    ---TEMP_DBUSER DBUSER%ROWTYPE;
    BEGIN
      V_VC_CORRELATIVO := NULL;
        V_NUM_CONTADOR :=0;
        V_NUM_SECUENCIA :=0;
        V_TAB_PARAM(1).vc_area_macro     := null; --AREA MACRO
        V_TAB_PARAM(1).vc_cum_ini        := PIN_VC_CUM_INI; --'20160000008484'; --cum
          V_TAB_PARAM(1).vc_cum_fin      := PIN_VC_CUM_FIN;--'20160000008484'; --cum
          V_TAB_PARAM(1).vc_fec_gen_cum_ini      := null; --FECHA GENERACION CUM INI
          V_TAB_PARAM(1).vc_fec_gen_cum_fin      := null; --FECHA GENERACION CUM FIN
          V_TAB_PARAM(1).vc_id_sede      := null; --sede
          V_TAB_PARAM(1).vc_ID_COD_DPTO_SEDE      := null; --CODIGO DEPARTAMENTO SEDE
          V_TAB_PARAM(1).Vc_ID_COD_PROV_SEDE      := null; --CODIGO PROVINCIA SEDE
          V_TAB_PARAM(1).Vc_ID_COD_DIST_SEDE      := null; --CODIGO DISTRITO SEDE
          V_TAB_PARAM(1).vc_id_org_resol      := null; --organo resolutivo
          V_TAB_PARAM(1).vc_ID_COD_DPTO_ORGR      := null; --CODIGO DEPARTAMENTO ORGANO RESOLUTIVO
          V_TAB_PARAM(1).vc_ID_COD_PROV_ORGR      := null; --CODIGO PROVINCIA ORGANO RESOLUTIVO
          V_TAB_PARAM(1).vc_ID_COD_DIST_ORGR      := null; --CODIGO DISTRITO ORGANO RESOLUTIVO
          V_TAB_PARAM(1).vc_ID_NRO_INSTANCIA      := null; --NUMERO DE INSTANCIA
          V_TAB_PARAM(1).vc_id_materia      := null; --materia
          V_TAB_PARAM(1).vc_id_sub_materia     := null; --SUBMATERIA
          V_TAB_PARAM(1).vc_nro_exp_unico_ini      := null; --nro. expediente administrativo
          V_TAB_PARAM(1).vc_nro_exp_unico_fin      := null; --nro. expediente administrativo
          V_TAB_PARAM(1).vc_nroExpAdm_nivel      := null; --nro. expediente antiguo
          V_TAB_PARAM(1).vc_nro_resol      := null; --nro. resolucion or
          V_TAB_PARAM(1).vc_fec_reso_or_ini   := null; --FECHA RESOLUCION OR INI
          V_TAB_PARAM(1).vc_fec_reso_or_fin      := null; --FECHA RESOLUCION OR FIN
          V_TAB_PARAM(1).vc_fec_notifi_or_ini      := null; --FECHA NOTIFICACION RESOLUCION INI
          V_TAB_PARAM(1).vc_fec_notifi_or_fin      := null; --FECHA NOTIFICACION RESOLUCION FIN
          V_TAB_PARAM(1).vc_FEC_GENERACION_SEC_INI      := null; --FECHA GENERACION SEC
          V_TAB_PARAM(1).vc_FEC_GENERACION_SEC_FIN      := null; --FECHA GENERACION SEC

          V_TAB_PARAM(1).vc_fec_recepcion_aec_ini      := null; --FECHA RECEPCION AEC INICIO
          V_TAB_PARAM(1).vc_fec_recepcion_aec_fin       := null; --FECHA RECEPCION AEC FIN
          V_TAB_PARAM(1).vc_ANIO_INGRESO_AEC_INI      := null; --A?O INGRESO AL AEC INI
          V_TAB_PARAM(1).vc_ANIO_INGRESO_AEC_FIN      := null; --A?O INGRESO AL AEC FIN
          V_TAB_PARAM(1).vc_NRO_INGRESO_AEC_INI      := null; --nro. ingreso aec
          V_TAB_PARAM(1).vc_NRO_INGRESO_AEC_FIN      := null; --nro. ingreso aec

          V_TAB_PARAM(1).vc_ANIO_FILE_INI      := null; --A?O FILE INI
          V_TAB_PARAM(1).vc_ANIO_FILE_FIN      := null; --A?O FILE FIN
          V_TAB_PARAM(1).vc_NRO_FILE_INI      := null; --nro. file
          V_TAB_PARAM(1).vc_NRO_FILE_FIN      := null; --nro. file
          V_TAB_PARAM(1).vc_fec_recepcion_file_ini      := null; --FECHA RECEPCION FILE INICIO
          V_TAB_PARAM(1).vc_fec_recepcion_file_fin       := null; --FECHA RECEPCION FILE FIN

          V_TAB_PARAM(1).nu_valor_uit_ini        := null; --nro uit ini
          V_TAB_PARAM(1).nu_valor_uit_fin        := null; --nro uit fin
          V_TAB_PARAM(1).nu_monto_uit_ini        := null; --MONTO UIT INI
          V_TAB_PARAM(1).nu_monto_uit_fin        := null; --MONTO UIT FIN
          V_TAB_PARAM(1).nu_saldo_ini       := null; --SALDO UIT INI
          V_TAB_PARAM(1).nu_saldo_fin       := null; --SALDO UIT FIN
          V_TAB_PARAM(1).nu_id_tipo_multa      := null; --TIPO MULTA (SOLIDARIA/INDIVIDUAL)
          V_TAB_PARAM(1).vc_cod_estado_multa_resol      := null; --estado de la multa resolutivo
          V_TAB_PARAM(1).vc_cod_estado_pago      := null; --estado pago de la multa
          V_TAB_PARAM(1).vc_FEC_ESTADO_MULTA_OR_INI     := null; --FECHA ESTADO MULTA OR INI
          V_TAB_PARAM(1).vc_FEC_ESTADO_MULTA_OR_FIN      := null; --FECHA ESTADO MULTA OR FIN
          V_TAB_PARAM(1).vc_FEC_ESTADO_MULTA_COB_INI      := null; --FECHA ESTADO MULTA COBRANZA
          V_TAB_PARAM(1).vc_FEC_ESTADO_MULTA_COB_FIN      := null; --FECHA ESTADO MULTA COBRANZA
          V_TAB_PARAM(1).vc_cod_estado_multa_cob      := null; --estado de la multa cobranza
          V_TAB_PARAM(1).vc_cod_motivo_multa_cob      := null; --motivo multa cobranza
          V_TAB_PARAM(1).vc_IND_TIPO_PAGO       := null; --INDICADOR DE PAGO
          V_TAB_PARAM(1).ch_flg_asocu_multa          := null; --INDICADOR % ASOCU > 0

          V_TAB_PARAM(1).vc_cod_estado_exped_cob      := null; --estado expediente cobranza
          V_TAB_PARAM(1).vc_anio       := null; --a?o expediente cobranza
          V_TAB_PARAM(1).vc_nro_exp_cob_ini      := null; --nro. expediente cobranza
          V_TAB_PARAM(1).vc_nro_exp_cob_fin      := null; --nro. expediente cobranza
          V_TAB_PARAM(1).vc_fec_gen_exped_cob_ini      := null; --FECHA GENERACION EXPED COBRANZA INI
          V_TAB_PARAM(1).vc_fec_gen_exped_cob_fin     := null; --FECHA GENERACION EXPED COBRANZA FIN

          V_TAB_PARAM(1).vc_gestor_cobranza      := null; --Gestor de cobranza
          V_TAB_PARAM(1).vc_fec_emi_rec_ini       := null; --Fecha de Emision de la REC
          V_TAB_PARAM(1).vc_fec_emi_rec_fin       := null; --Fecha de Emision de la REC
          V_TAB_PARAM(1).vc_fec_noti_rec_ini      := null; --Fecha de Notificacion de la REC
          V_TAB_PARAM(1).vc_fec_noti_rec_fin       := null; --Fecha de Notificacion de la REC
          V_TAB_PARAM(1).vc_cod_motivo_exped_cob      := null; --motivo expediente cobranza:= null; --:= null; --:= null; --:= null; ---
          V_TAB_PARAM(1).vc_fec_est_exped_cob_ini      := null; --Fecha de Estado del Expediente
          V_TAB_PARAM(1).vc_fec_est_exped_cob_fin     := null; --Fecha de Estado del Expediente
          V_TAB_PARAM(1).vc_num_env_arch_ini      := null; --N? Envio a Archivo Central
          V_TAB_PARAM(1).vc_num_env_arch_fin      := null; --N? Envio a Archivo Central
          V_TAB_PARAM(1).vc_fec_envi_arch_ini      := null; --Fecha de Envio a Archivo Central
          V_TAB_PARAM(1).vc_fec_envi_arch_fin      := null; --Fecha de Envio a Archivo Central
          V_TAB_PARAM(1).vc_nro_ofic_sunat_ini      := null; --N? de Oficio de la SUNAT
          V_TAB_PARAM(1).vc_nro_ofic_sunat_fin       := null; --N? de Oficio de la SUNAT
          V_TAB_PARAM(1).nu_dere_antiDump_ini        := null; --Derechos Antidumping
          V_TAB_PARAM(1).nu_dere_antiDump_fin         := null; --Derechos Antidumping
          V_TAB_PARAM(1).vc_nro_parti_ini      := null; --Partida Arancelaria
          V_TAB_PARAM(1).vc_nro_parti_fin      := null; --Partida Arancelaria
          V_TAB_PARAM(1).vc_nro_dua_ini      := null; --N? DUA
          V_TAB_PARAM(1).vc_nro_dua_fin      := null; --N? DUA
          V_TAB_PARAM(1).vc_nro_liq_cob_ini       := null; --N? Liquidacion de Cobranza
          V_TAB_PARAM(1).vc_nro_liq_cob_fin      := null; --N? Liquidacion de Cobranza
          V_TAB_PARAM(1).vc_id_intendencia      := null; --Intendencia antidumping
          V_TAB_PARAM(1).ch_flg_ind_embargo         := null; --INDICADOR TIENE EMBARGO?
          V_TAB_PARAM(1).vc_fec_asig_gestor_ini      := null; --fecha de asignacion de gestor ini
          V_TAB_PARAM(1).vc_fec_asig_gestor_fin      := null; --fecha de asignacion de gestor fin
          V_TAB_PARAM(1).vc_fec_carta_precoactiva_ini   := null; --fecha de carta precoactiva inicio
          V_TAB_PARAM(1).vc_fec_carta_precoactiva_fin      := null; --fecha de carta precoactiva fin
          V_TAB_PARAM(1).vc_id_expectativa_cobro      := null; --cadena codigos espectativa de cobro

          V_TAB_PARAM(1).vc_d_codSanciona_ini     := null; --Codigo del INDECOPI
          V_TAB_PARAM(1).vc_d_codSanciona_fin      := null; --Codigo del INDECOPI
          V_TAB_PARAM(1).nu_d__tip_persona      := null; --Tipo de Personeria
          V_TAB_PARAM(1).vc_d_razon_social     := null; --Razon Social
          V_TAB_PARAM(1).vc_d_ape_paterno      := null; --Apellido Paterno
          V_TAB_PARAM(1).vc_d_ape_materno    := null; --Apellido Materno
          V_TAB_PARAM(1).vc_d_ape_casada    := null; --Apellido Casada
          V_TAB_PARAM(1).vc_d_pri_nombre       := null; --Primer nombre
          V_TAB_PARAM(1).vc_d_seg_nombre     := null; --Segundo nombre
          V_TAB_PARAM(1).nu_d_tipo_doc     := null; --Tipo de Documento
          V_TAB_PARAM(1).vc_d_nro_doc      := null; --N? de documento de identidad
          V_TAB_PARAM(1).nu_d_tip_empresa      := null; --Tipo de Empresa
          V_TAB_PARAM(1).nu_d_id_sect_econo         := null; --CIIU (Actividad Economica)
          V_TAB_PARAM(1).ch_d_flg_asocu           := null; --flag asocu
          V_TAB_PARAM(1).ch_d_fl_oficio           := null; --indicador denunciante de oficio=Indecopi

          V_TAB_PARAM(1).vc_do_codSanciona_ini      := null; --Codigo del INDECOPI
          V_TAB_PARAM(1).vc_do_codSanciona_fin       := null; --Codigo del INDECOPI
          V_TAB_PARAM(1).nu_do_tip_persona        := null; --Tipo de Personeria
          V_TAB_PARAM(1).vc_do_razon_social      := null; --Razon Social
          V_TAB_PARAM(1).vc_do_ape_paterno      := null; --Apellido Paterno
          V_TAB_PARAM(1).vc_do_ape_materno       := null; --Apellido Materno
          V_TAB_PARAM(1).vc_do_ape_casada      := null; --Apellido Casada
          V_TAB_PARAM(1).vc_do_pri_nombre      := null; --Primer nombre
          V_TAB_PARAM(1).vc_do_seg_nombre      := null; --Segundo nombre
          V_TAB_PARAM(1).nu_do_tipo_doc        := null; --Tipo de Documento
          V_TAB_PARAM(1).vc_do_nro_doc      := null; --N? de documento de identidad
          V_TAB_PARAM(1).nu_do_tip_empresa       := null; --Tipo de Empresa
          V_TAB_PARAM(1).nu_do_id_sect_econo    := null; --CIIU (Actividad Economica)
          V_TAB_PARAM(1).ch_do_flg_asocu        := null; --flag asocu

          V_TAB_PARAM(1).vc_codSanciona_ini      := null; --Codigo del INDECOPI
          V_TAB_PARAM(1).vc_codSanciona_fin     := null; --Codigo del INDECOPI
          V_TAB_PARAM(1).nu_s_tip_persona     := null; --Tipo de Personeria
          V_TAB_PARAM(1).vc_razon_social      := null; --Razon Social
          V_TAB_PARAM(1).vc_ape_paterno      := null; --Apellido Paterno
          V_TAB_PARAM(1).vc_ape_materno       := null; --Apellido Materno
          V_TAB_PARAM(1).vc_ape_casada       := null; --Apellido Casada
          V_TAB_PARAM(1).vc_pri_nombre      := null; --Primer nombre
          V_TAB_PARAM(1).vc_seg_nombre      := null; --Segundo nombre
          V_TAB_PARAM(1).nu_s_tipo_doc       := null; --Tipo de Documento
          V_TAB_PARAM(1).vc_nro_doc      := null; --N? de documento de identidad
          V_TAB_PARAM(1).nu_tip_empresa       := null; --Tipo de Empresa
          V_TAB_PARAM(1).nu_id_sect_econo       := null; --CIIU (Actividad Economica)
          V_TAB_PARAM(1).ch_flg_asocu         := null; --flag asocu
          V_TAB_PARAM(1).ch_flg_buscar_by_contenido            := null; --0=NO;1=SI


        PKG_INTFZ_MULTAS.S_LISTA_MULTAS_X_ESTADO (
                              PIN_NU_ORIGEN                => PIN_NU_ORIGEN,
                              PIN_NU_ANIO_EXP_COB          => NULL,
                              PIN_NU_NRO_EXP_COB           => NULL,
                              PIN_NU_NRO_EXP_ADMIN         => NULL,
                              PIN_NU_ANIO_EXP_ADMIN        => NULL,
                              PIN_VC_DESC_SIGLA_EXP_ADMIN  => NULL,
                              PIN_NU_ID_TIPO_EXP_ADMIN     => NULL,
                              PIN_NU_NRO_RESOL_1           => NULL,
                              PIN_NU_NRO_RESOL_2           => NULL,
                              PIN_NU_ANIO_RESOL_1          => NULL,
                              PIN_NU_ANIO_RESOL_2          => NULL,
                              PIN_VC_AREA_RESOL_1          => NULL,
                              PIN_VC_AREA_RESOL_2          => NULL,
                              PIN_NU_TIPO_PERSONA          => NULL,
                              PIN_VC_TIPO_DOC              => NULL,
                              PIN_VC_NRO_DOC               => NULL,
                              PIN_VC_ADMINISTRADO          => NULL,
                              PIN_DT_ING_INI               => NULL,
                              PIN_DT_ING_FIN               => NULL,
                              PIN_NU_MTO_UIT_INI           => NULL,
                              PIN_NU_MTO_UIT_FIN           => NULL,
                              PIN_NU_ANIO_MULTA            => NULL,
                              PIN_VC_NRO_MULTA             => NULL,
                              PIN_VC_ANIO_ING_COA          => NULL,
                              PIN_NU_NRO_ING_COA           => NULL,
                              PIN_TAB_PARAM                => V_TAB_PARAM,
                              POUT_CUR_RESULT              => V_CUR_MULTA,
                              POUT_NU_ERROR                => POUT_NU_ERROR,
                              POUT_VC_ERROR                => POUT_VC_ERROR) ;

      LOOP FETCH V_CUR_MULTA INTO V_REC_MULTA;
      EXIT WHEN V_CUR_MULTA%NOTFOUND;


        V_NUM_CONTADOR :=V_NUM_CONTADOR+1;
        V_VC_CORRELATIVO    :=V_REC_MULTA.VC_NRO_CUM ;
        V_VC_ESTADO_MULTA   :=V_REC_MULTA.VC_COD_EST_MULTA;
        V_VC_ESTADO_COB     :=V_REC_MULTA.VC_COD_EST_MULTA_COB;
        V_VC_ESTADO_EXP     :=V_REC_MULTA.VC_CODIGO_EST_EXP;
        V_VC_ESTADO_PAGO    :=V_REC_MULTA.VC_COD_EST_PAGO;

        -- INI  - MODIFICACION
        SELECT TRIM(DECODE(INSTR(V_REC_MULTA.VC_NRO_TIPO_DOC_SANCIONADO, '/'), 0, V_REC_MULTA.VC_NRO_TIPO_DOC_SANCIONADO, SUBSTR(V_REC_MULTA.VC_NRO_TIPO_DOC_SANCIONADO, 1, INSTR(V_REC_MULTA.VC_NRO_TIPO_DOC_SANCIONADO, '/') - 1)))
        INTO V_VC_DOC_SANCIONADO
        FROM DUAL;

        SELECT SUBSTR(TRIM(DECODE(INSTR(V_REC_MULTA.VC_NOM_TIPO_DOC_SANCIONADO, '/'), 0, V_REC_MULTA.VC_NOM_TIPO_DOC_SANCIONADO, SUBSTR(V_REC_MULTA.VC_NOM_TIPO_DOC_SANCIONADO, 1, INSTR(V_REC_MULTA.VC_NOM_TIPO_DOC_SANCIONADO, '/') - 1))),1,1)
        INTO V_VC_TDOC_PERSONA
        FROM DUAL;

        SELECT SUBSTR(TRIM(DECODE(INSTR(V_REC_MULTA.VC_NOM_SANCIONADO, '/'), 0, V_REC_MULTA.VC_NOM_SANCIONADO, SUBSTR(V_REC_MULTA.VC_NOM_SANCIONADO, 1, INSTR(V_REC_MULTA.VC_NOM_SANCIONADO, '/') - 1))),1,80)
        INTO V_VC_NOMBRE_PERSONA
        FROM DUAL;

        SELECT SUBSTR(TRIM(DECODE(INSTR(V_REC_MULTA.VC_NOM_DENUNCIANTE, '/'), 0, V_REC_MULTA.VC_NOM_DENUNCIANTE, SUBSTR(V_REC_MULTA.VC_NOM_DENUNCIANTE, 1, INSTR(V_REC_MULTA.VC_NOM_DENUNCIANTE, '/') - 1))),1,80)
        INTO V_VC_NOMBRE_DENUNCIANTE
        FROM DUAL;

        V_VC_ES_ASOCIACION      := UPPER(NVL(V_REC_MULTA.VC_IND_ASOCU, 'NO'));

        -- FIN  - MODIFICACION

        V_VC_EXP_COB_ANIO   :=SUBSTR(trim(V_REC_MULTA.VC_NRO_EXPED_COB), 1,4);
        V_VC_EXP_COB_NRO    :=SUBSTR(trim(V_REC_MULTA.VC_NRO_EXPED_COB), 5);
        V_NUM_PERSONA :=null;
        V_NUM_PERSONA_DENUN := NULL; --

        IF V_VC_TDOC_PERSONA<>'D' AND V_VC_TDOC_PERSONA<>'R' THEN
          V_VC_TDOC_PERSONA :='O';
        END IF;
        IF V_VC_DOC_SANCIONADO IS NOT NULL THEN

            -- VERIFICACION EN EMPLEADO
            SELECT MAX(PERSONA) INTO V_NUM_PERSONA FROM SGCORESYS.PERSONAMAST X
            LEFT JOIN SGCORESYS.EMPLEADOMAST Y ON (X.PERSONA = Y.EMPLEADO)
            WHERE (X.DOCUMENTO = V_VC_DOC_SANCIONADO OR X.DOCUMENTOFISCAL = V_VC_DOC_SANCIONADO OR X.DOCUMENTOIDENTIDAD = V_VC_DOC_SANCIONADO);

            IF NVL(V_NUM_PERSONA,0)=0 THEN
                -- VERIFICACION CON OTROS
                SELECT MAX(PERSONA) INTO V_NUM_PERSONA FROM SGCORESYS.PERSONAMAST X
                WHERE X.ESTADO = 'A' AND (X.DOCUMENTO = V_VC_DOC_SANCIONADO OR X.DOCUMENTOFISCAL = V_VC_DOC_SANCIONADO OR X.DOCUMENTOIDENTIDAD = V_VC_DOC_SANCIONADO);
            END IF;

             IF NVL(V_NUM_PERSONA,0)=0 THEN
                SIA_S_GENERA_PERSONA(   PIN_CH_CLIENTENOMBRE    => V_VC_NOMBRE_PERSONA,
                                        PIN_CH_TIPODOCUMENTO    => V_VC_TDOC_PERSONA,
                                        PIN_CH_CLIENTEDOCUMENTO => V_VC_DOC_SANCIONADO,
                                        PIN_CH_ULTIMOUSUARIO    => 'INTERFAZ',
                                        POUT_NU_PERSONA         => V_NUM_PERSONA);
             END IF;
         END IF ;

         IF V_VC_ES_ASOCIACION = 'SI' THEN -- : SE AGREGA LA VALIDACION SI ES ASOCIACION
           IF V_REC_MULTA.VC_NRO_DOC_DENUNCIANTE IS NOT NULL THEN
              -- INI
              SELECT TRIM(DECODE(INSTR(V_REC_MULTA.VC_NRO_DOC_DENUNCIANTE, '/'), 0, V_REC_MULTA.VC_NRO_DOC_DENUNCIANTE, SUBSTR(V_REC_MULTA.VC_NRO_DOC_DENUNCIANTE, 1, INSTR(V_REC_MULTA.VC_NRO_DOC_DENUNCIANTE, '/') - 1)))
              INTO V_VC_DOC_DENUNCIANTE
              FROM DUAL;
              -- FIN

              V_NUM_PERSONA_DENUN :=NULL;
              --VERIFICAR CON EMPLEADO
              SELECT MAX(PERSONA) INTO V_NUM_PERSONA_DENUN FROM SGCORESYS.PERSONAMAST X
                INNER JOIN SGCORESYS.EMPLEADOMAST Y ON (X.PERSONA = Y.EMPLEADO)
                WHERE (X.DOCUMENTO = V_VC_DOC_DENUNCIANTE OR X.DOCUMENTOFISCAL = V_VC_DOC_DENUNCIANTE OR X.DOCUMENTOIDENTIDAD = V_VC_DOC_DENUNCIANTE);

              IF NVL(V_NUM_PERSONA_DENUN,0)=0 THEN
                -- VERIFICACION CON OTROS
                  SELECT MAX(PERSONA) INTO V_NUM_PERSONA_DENUN FROM SGCORESYS.PERSONAMAST X
                    WHERE X.ESTADO = 'A' AND (X.DOCUMENTO = V_VC_DOC_DENUNCIANTE OR X.DOCUMENTOFISCAL = V_VC_DOC_DENUNCIANTE OR X.DOCUMENTOIDENTIDAD = V_VC_DOC_DENUNCIANTE);
              END IF;
              /* INI  - SE AGREGA LA VALIDACION PARA DETERMINAR EL TIPO DE DOCUMENTO YA QUE LA CONSULTA AVANZADA DEL SICOB NO RETORNA EL TIPO DE DOCUMENTO DEL DENUNCIANTE*/
              IF LENGTH(TRIM(V_VC_DOC_DENUNCIANTE)) = 11 THEN
                V_VC_TDOC_PERSONA :='R';
              ELSIF LENGTH(TRIM(V_VC_DOC_DENUNCIANTE)) = 8 THEN
                V_VC_TDOC_PERSONA := 'D';
              ELSE
                V_VC_TDOC_PERSONA :='O';
              END IF;
              /* FIN  */

              IF NVL(V_NUM_PERSONA_DENUN,0)=0 THEN
                 SIA_S_GENERA_PERSONA(PIN_CH_CLIENTENOMBRE  => V_VC_NOMBRE_DENUNCIANTE,
                                    PIN_CH_TIPODOCUMENTO    => V_VC_TDOC_PERSONA,
                                    PIN_CH_CLIENTEDOCUMENTO => V_VC_DOC_DENUNCIANTE,
                                    PIN_CH_ULTIMOUSUARIO    => 'INTERFAZ',
                                    POUT_NU_PERSONA         => V_NUM_PERSONA_DENUN);
              END IF;
              V_VC_DOC_DENUNCIANTE := NULL;
           END IF;
         END IF; --


     --SELECT ANIO INTO V_VC_EXP_COB_NRO FROM  CO_MULTA ;
        INSERT INTO SGCORESYS.CO_MULTA (
        IDENTIFICADOR,
        ANIO,
        ORIGEN,
        FECHAREGISTRO,
        CODTIPOPROCEDIMIENTO,
        CODAREA,
        CODSEDE,
        CODMATERIA,
        CODSUBMATERIA,
        EXPEDIENTE,
        EXPEDIENTEANTERIOR,
        ORPSRESOLNUMERO,
        ORPSRESOLFECHAREGISTRO,
        ORPSRESOLFECHAEMISION,
        ORPSRESOLFECHANOTIFICACION,
        ORPSFECHAAPELACION,
        ORPSUSUARIO,
        ORPSCANTIDADDIAS,
        COMRESOLNUMERO,
        COMRESOLFECHAREGISTRO,
        COMRESOLFECHAEMISION,
        COMRESOLFECHANOTIFICACION,
        COMFECHAREVISION,
        COMUSUARIO,
        COMCANTIDADDIAS,
        SALARESOLNUMERO,
        SALARESOLFECHAREGISTRO,
        SALARESOLFECHAEMISION,
        SALARESOLFECHANOTIFICACION,
        SALAUSUARIO,
        SALACANTIDADDIAS,
        TIPOMULTA,
        DENUNCIANTE,
        DENUNCIADO,
        DENUNCIANTENOMBRE,
        SANCIONADO,
        CODCLASIFICACION,
        CODACTIVIDAD,
        ASOCUPORCFLAG,
        ASOCUPORC,
        UITNRO,
        UITMONTOCAPITAL,
        INTERESES,
        MORA,
        GASTOS,
        AMORTIZADO,
        AMORTIZADOINTERESES,
        AMORTIZADOMORA,
        AMORTIZADOGASTOS,
        SALDO,
        SALDOINTERESES,
        SALDOMORA,
        SALDOGASTOS,
        ESTADOMULTA,
        DESCUENTOMULTA,
        SECFECHAREGISTRO,
        FILEANIO,
        FILEFECHARECEPCION,
        FILENUMERO,
        NUMEROINGRESO,
        ESTADOMULTACOBRANZA,
        CODMOTIVOMULTA,
        FECHAOBSERVACION,
        FECHAULTIMOINGRESO,
        COBEXPEDIENTENRO,
        COBEXPEDIENTEFECHA,
        COBGESTOR,
        FECHAASIGNACION,
        FECHACARTA,
        RECFECHAEMISION,
        RECFECHANOTIFICACION,
        EMBARGOFLAG,
        COBEXPEDIENTEESTADO,
        COBEXPEDIENTEMOTIVO,
        COBFECHAULTIMO,
        FECHARIESGO,
        COBROEXPECTATIVA,
        REGION,
        ENVIONUMERO,
        ENVIOFECHA,
        UBICACIONFISICA,
        CUOTA,
        FECHAVENCIMIENTO,
        ESTADOPAGO,
        TIPOFRACCIONAMIENTO,
        COMRESOLANIO,
        COMRESOLCODIGO,
        CODAREADESCRIPCION,
        CODMOTIVOMULTACOB,
        CODCENTROCOSTO
        ) SELECT
        /* IDENTIFICADOR - VARCHAR(14 ) */ V_VC_CORRELATIVO ,
        /* ANIO - VARCHAR(4 ) */ TO_CHAR(V_REC_MULTA.DT_GENERACION_CUM,'YYYY'),
        /* ORIGEN - VARCHAR(1 ) */ to_char(PIN_NU_ORIGEN),
        /* FECHAREGISTRO - DATETIME */ V_REC_MULTA.DT_GENERACION_CUM,
        /* CODTIPOPROCEDIMIENTO - VARCHAR(10 ) */ V_REC_MULTA.VC_COD_TIPOPROC,
        /* CODAREA - VARCHAR(4 ) */ V_REC_MULTA.VC_COD_OR,
        /* CODSEDE - VARCHAR(4 ) */ V_REC_MULTA.VC_COD_SEDE,
        /* CODMATERIA - VARCHAR(10 ) */ V_REC_MULTA.VC_COD_MATERIA,
        /* CODSUBMATERIA - VARCHAR(10 ) */ V_REC_MULTA.VC_COD_SUBMATERIA,
        /* EXPEDIENTE - VARCHAR(20 ) */ V_REC_MULTA.VC_NRO_EXP_ADMIN,
        /* EXPEDIENTEANTERIOR - VARCHAR(300 ) */ V_REC_MULTA.VC_NRO_EXP_NIVEL,
        /* ORPSRESOLNUMERO - VARCHAR(20 ) */ V_REC_MULTA.VC_NRO_RESOL_1,
        /* ORPSRESOLFECHAREGISTRO - DATETIME */ V_REC_MULTA.DT_REGISTRO,
        /* ORPSRESOLFECHAEMISION - DATETIME */ V_REC_MULTA.DT_RESOLUCION,
        /* ORPSRESOLFECHANOTIFICACION - DATETIME */ V_REC_MULTA.DT_NOTIF_RES,
        /* ORPSFECHAAPELACION - DATETIME */ V_REC_MULTA.DT_APELA,
        /* ORPSUSUARIO - DATETIME */ SYSDATE ORPSUSUARIO,
        /* ORPSCANTIDADDIAS - INTEGER */ V_REC_MULTA.NU_CANTIDAD_OR,
        /* COMRESOLNUMERO - VARCHAR(20 ) */ V_REC_MULTA.VC_NRO_RESOL_2,
        /* COMRESOLFECHAREGISTRO - DATETIME */ V_REC_MULTA.DT_REG_COMISION,
        /* COMRESOLFECHAEMISION - DATETIME */ V_REC_MULTA.DT_RES_COMISION,
        /* COMRESOLFECHANOTIFICACION - DATETIME */ V_REC_MULTA.DT_NOTF_RES_COMISION,
        /* COMFECHAREVISION - DATETIME */ V_REC_MULTA.DT_REVISION,
        /* COMUSUARIO - VARCHAR(30 ) */ V_REC_MULTA.VC_USU_REG_COMISION,
        /* COMCANTIDADDIAS - INTEGER */ V_REC_MULTA.NU_CANTIDAD_COMISION,
        /* SALARESOLNUMERO - VARCHAR(20 ) */ V_REC_MULTA.VC_NRO_RESOL_3,
        /* SALARESOLFECHAREGISTRO - DATETIME */ V_REC_MULTA.DT_REG_SALA,
        /* SALARESOLFECHAEMISION - DATETIME */ V_REC_MULTA.DT_RES_SALA,
        /* SALARESOLFECHANOTIFICACION - DATETIME */ V_REC_MULTA.DT_NOTF_RES_SALA,
        /* SALAUSUARIO - VARCHAR(30 ) */ V_REC_MULTA.VC_USU_REG_SALA,
        /* SALACANTIDADDIAS - INTEGER */ V_REC_MULTA.NU_CANT_DIA_SALA,
        /* TIPOMULTA - VARCHAR(1 ) */ SUBSTR(V_REC_MULTA.VC_DESC_TIP_MUL,1,1),
        /* DENUNCIANTE - INTEGER */ DECODE(V_VC_ES_ASOCIACION, 'SI', V_NUM_PERSONA_DENUN, 0) DENUNCIANTE,
        /* DENUNCIADO - INT */ V_NUM_PERSONA,
        /* DENUNCIANTENOMBRE - VARCHAR(800 ) */ V_VC_NOMBRE_DENUNCIANTE, --
        /* SANCIONADO - INT */ V_NUM_PERSONA,
        /* CODCLASIFICACION - VARCHAR(1 ) */ V_REC_MULTA.VC_CODIGO_CLASIFICACION,
        /* CODACTIVIDAD - VARCHAR(10 ) */ V_REC_MULTA.VC_CODIGO_CIIU,
        /* ASOCUPORCFLAG - VARCHAR(1 ) */ SUBSTR(V_REC_MULTA.VC_IND_ASOCU,1,1),
        /* ASOCUPORC - DECIMAL(20,4) */     V_REC_MULTA.NU_PORCENTAJE_ASOCU,
        /* UITNRO - INT */                      V_REC_MULTA.NU_VALOR_UIT,
        /* UITMONTOCAPITAL - DECIMAL(20,4) */   V_REC_MULTA.NU_MONTO_UIT,
        /* INTERESES - DECIMAL(20,4) */ V_REC_MULTA.NU_MONTO_IC,
        /* MORA - DECIMAL(20,4) */ V_REC_MULTA.NU_MONTO_IM,
        /* GASTOS - DECIMAL(20,4) */ V_REC_MULTA.NU_MONTO_COSTAS,
        /* AMORTIZADO - DECIMAL(20,4) */ V_REC_MULTA.NU_TOTAL_AMORTIZADO,
        /* AMORTIZADOINTERESES - DECIMAL(20,4) */ V_REC_MULTA.NU_TOTAL_AMORTIZADO_IM,
        /* AMORTIZADOMORA - DECIMAL(20,4) */    V_REC_MULTA.NU_TOTAL_AMORTIZADO_IC,
        /* AMORTIZADOGASTOS - DECIMAL(20,4) */  V_REC_MULTA.NU_TOTAL_AMORTIZADO_COSTAS,
        /* SALDO - DECIMAL(20,4) */             V_REC_MULTA.NU_SALDO,
        /* SALDOINTERESES - DECIMAL(20,4) */    V_REC_MULTA.NU_SALDO_IC,
        /* SALDOMORA - DECIMAL(20,4) */         V_REC_MULTA.NU_SALDO_IM,
        /* SALDOGASTOS - DECIMAL(20,4) */       V_REC_MULTA.NU_SALDO_COSTAS,
        /* ESTADOMULTA - VARCHAR(2 ) */         V_VC_ESTADO_MULTA,
        /* DESCUENTOMULTA - DECIMAL(20,4) */    V_REC_MULTA.nu_POR_DSCTO_PAGO,
        /* SECFECHAREGISTRO - DATETIME */       V_REC_MULTA.DT_GENERACION_SEC,
        /* FILEANIO - VARCHAR(4 ) */            V_REC_MULTA.CH_ANIO_FILE,
        /* FILEFECHARECEPCION - DATETIME */     V_REC_MULTA.DT_RECEPCION_FILE,
        /* FILENUMERO - VARCHAR(20 ) */         V_REC_MULTA.VC_NRO_FILE_AEC,
        /* NUMEROINGRESO - VARCHAR(4 ) */       V_REC_MULTA.VC_NRO_INGRESO_AEC,
        /* ESTADOMULTACOBRANZA - VARCHAR(2 ) */ V_VC_ESTADO_COB,--V_REC_MULTA.VC_ESTADO_MULTA_COB,
        /* CODMOTIVOMULTA - VARCHAR(10 ) */     V_REC_MULTA.VC_COD_MOTIVO_EXPED_COB,--V_REC_MULTA.VC_DESC_MOTIVO_MULTA,
        /* FECHAOBSERVACION - DATETIME */       V_REC_MULTA.DT_ULT_OBSERVACION_AEC,
        /* FECHAULTIMOINGRESO - DATETIME */     V_REC_MULTA.DT_ULT_INGRESO_AEC,
        /* COBEXPEDIENTENRO - VARCHAR(20 ) */   V_REC_MULTA.VC_NRO_EXPED_COB,
        /* COBEXPEDIENTEFECHA - DATETIME */ V_REC_MULTA.DT_GENERACION_EXPED_COB,
        /* COBGESTOR - VARCHAR(30 ) */      V_REC_MULTA.VC_USU_GESTOR_COBRANZA,
        /* FECHAASIGNACION - DATETIME */    V_REC_MULTA.DT_ASIG_GESTOR_COBRANZA,
        /* FECHACARTA - DATETIME */         V_REC_MULTA.DT_ULT_GEN_PRECOACTIVA,
        /* RECFECHAEMISION - DATETIME */        V_REC_MULTA.DT_EMISION_REC,
        /* RECFECHANOTIFICACION - DATETIME */   V_REC_MULTA.DT_NOTIF_REC,
        /* EMBARGOFLAG - VARCHAR(1 ) */         SUBSTR(V_REC_MULTA.VC_IND_EMBARGO,1,1),
        /* COBEXPEDIENTEESTADO - VARCHAR(2 ) */ V_VC_ESTADO_EXP,--V_REC_MULTA.VC_DESC_ESTADO_EXPED_COB,
        /* COBEXPEDIENTEMOTIVO - VARCHAR(10 ) */ V_REC_MULTA.VC_COD_MOTIVO_EXPED_COB COBEXPEDIENTEMOTIVO,--V_REC_MULTA.VC_DESC_MOTIVO_EXPED_COB,
        /* COBFECHAULTIMO - DATETIME */         V_REC_MULTA.DT_ULT_ESTADO_EXPED_COB,
        /* FECHARIESGO - DATETIME */ SYSDATE FECHARIESGO,
        /* COBROEXPECTATIVA - VARCHAR(1 ) */ '' COBROEXPECTATIVA,
        /* REGION - VARCHAR(20 ) */ SUBSTR(V_REC_MULTA.VC_REGION_SANCIONADO,20),
        /* ENVIONUMERO - VARCHAR(10 ) */ '' ENVIONUMERO,
        /* ENVIOFECHA - DATETIME */ V_REC_MULTA.DT_ENVIO_ARCHIVO,
        /* UBICACIONFISICA - VARCHAR(50 ) */ V_REC_MULTA.VC_UBI_FISICA_EXPED,
        /* CUOTA - INT */ 0 CUOTA,
        /* FECHAVENCIMIENTO - DATE */ NULL FECHAVENCIMIENTO,
        /* ESTADOPAGO - VARCHAR(2) */ V_VC_ESTADO_PAGO,
        /* TIPOFRACCIONAMIENTO - VARCHAR(2) */ V_REC_MULTA.VC_TIPO_MULTA,
        /* COMRESOLANIO - VARCHAR(4) */ V_VC_EXP_COB_ANIO,
        /* COMRESOLCODIGO - VARCHAR(80) */ V_VC_EXP_COB_NRO,
        /* CODAREADESCRIPCION - VARCHAR(80) */V_REC_MULTA.VC_DESC_OR,
        /* CODMOTIVOMULTACOB - VARCHAR(100) */V_REC_MULTA.VC_COD_MOTIVO_MULTA_COB,
        /* CODCENTROCOSTO - VARCHAR2(15) */V_REC_MULTA.VC_COD_CENTRO_COSTO
        FROM DUAL
        WHERE  NOT EXISTS (SELECT 1 FROM SGCORESYS.CO_MULTA X WHERE X.IDENTIFICADOR=V_VC_CORRELATIVO);
        ---ESTADOS
        SELECT MAX(SECUENCIA) INTO V_NUM_SECUENCIA FROM SGCORESYS.CO_MULTAESTADO
        WHERE IDENTIFICADOR = V_VC_CORRELATIVO;

        V_NUM_SECUENCIA := NVL(V_NUM_SECUENCIA,0) + 1;



        INSERT INTO SGCORESYS.CO_MULTAESTADO (
            Identificador,
            Secuencia,
            EstadoMulta,
            EstadoPago,
            EstadoCobranza,
            EstadoExpediente,
            CodigoMotivoExpediente,
            Fecha,
            ContabilizacionPendienteFlag,
            Periodo,
            Voucher,
            UltimoUsuario,
            UltimaFechaModif,
            CAPITAL,
            INTERESES,
            MORA,
            GASTOS,
            CAPITAL_ANT,
            INTERESES_ANT,
            MORA_ANT,
            GASTOS_ANT,
            CODAREA,
            uitnro,
            SALDOCAPITAL,
            SALDOINTERES,
            SALDOMORA,
            SALDOGASTOS
        ) SELECT
            /* Identificador - varchar(14) */ V_VC_CORRELATIVO,
            /* Secuencia - int */ V_NUM_SECUENCIA,
            /* EstadoMulta - varchar(2) */ V_VC_ESTADO_MULTA ,
            /* EstadoPago - varchar(2) */ V_VC_ESTADO_PAGO,
            /* EstadoCobranza - varchar(2) */ V_VC_ESTADO_COB,
            /* EstadoExpediente - varchar(2) */ V_VC_ESTADO_EXP,
            /* CodigoMotivoExpediente - varchar(2) */ V_REC_MULTA.VC_COD_MOTIVO_EXPED_COB,
            /* Fecha - datetime */ SYSDATE FECHA,
            /* ContabilizacionPendienteFlag - varchar(1) */ 'S' ContabilizacionPendienteFlag,
            /* Periodo - varchar(6) */ TO_CHAR(SYSDATE,'YYYYMM') Periodo,
            /* Voucher - varchar(6) */ NULL VOUCHER,
            /* UltimoUsuario - varchar(20) */ 'SIA' ULTIMOUSUARIO,
            /* UltimaFechaModif - datetime */ SYSDATE ULTIMAFECHAMODIF,
            /* CAPITAL - DECIMAL(20,4) */ V_REC_MULTA.NU_MONTO_UIT,
            /* INTERESES - DECIMAL(20,4) */ V_REC_MULTA.NU_MONTO_IC,
            /* MORA - DECIMAL(20,4) */ V_REC_MULTA.NU_MONTO_IM,
            /* GASTOS - DECIMAL(20,4) */ V_REC_MULTA.NU_MONTO_COSTAS,
            /* CAPITAL_ANT - DECIMAL(20,4) */ Y.UITMONTOCAPITAL ,
            /* INTERESES_ANT - DECIMAL(20,4) */ Y.INTERESES,
            /* MORA_ANT - DECIMAL(20,4) */ Y.MORA,
            /* GASTOS_ANT - DECIMAL(20,4) */ Y.GASTOS,
            /*CODAREA*/(case when PIN_NU_ORIGEN = 1 then
                        V_REC_MULTA.VC_COD_OR
                        -- INI MODI@20170316
                        /*(CASE WHEN V_REC_MULTA.VC_NRO_RESOL_3 IS NOT NULL THEN SUBSTR(V_REC_MULTA.VC_NRO_RESOL_3, -4)
                  WHEN V_REC_MULTA.VC_NRO_RESOL_2 IS NOT NULL THEN SUBSTR(V_REC_MULTA.VC_NRO_RESOL_2, -4)
                  WHEN V_REC_MULTA.VC_NRO_RESOL_1 IS NOT NULL THEN SUBSTR(V_REC_MULTA.VC_NRO_RESOL_1, -4)
                  ELSE NULL
                   END)*/
                   -- FIN MODI@20170316
             else null
             end
            ),
            /*UITNRO*/V_REC_MULTA.NU_VALOR_UIT,
            /* SALDOCAPITAL - DECIMAL(20,4) */      V_REC_MULTA.NU_SALDO,
            /* SALDOINTERESES - DECIMAL(20,4) */    V_REC_MULTA.NU_SALDO_IC,
            /* SALDOMORA - DECIMAL(20,4) */         V_REC_MULTA.NU_SALDO_IM,
            /* SALDOGASTOS - DECIMAL(20,4) */       V_REC_MULTA.NU_SALDO_COSTAS
          FROM SGCORESYS.CO_MULTA Y
          WHERE --(V_REC_MULTA.NU_MONTO_UIT<>0) AND
                (Y.IDENTIFICADOR=V_VC_CORRELATIVO) AND
                (V_VC_ESTADO_MULTA IS NOT NULL) AND
                ((Y.ESTADOMULTA<>V_VC_ESTADO_MULTA OR
                Y.ESTADOMULTACOBRANZA<>V_VC_ESTADO_COB OR Y.COBEXPEDIENTEESTADO<>V_VC_ESTADO_EXP /*OR Y.ESTADOPAGO<>V_VC_ESTADO_PAGO*/) OR
                 (NOT EXISTS (SELECT 1 FROM SGCORESYS.CO_MULTAESTADO X WHERE X.IDENTIFICADOR=V_VC_CORRELATIVO)));

          ---UPDATE
          UPDATE SGCORESYS.CO_MULTAESTADO
          SET CAPITAL   = V_REC_MULTA.NU_MONTO_UIT,
              INTERESES = V_REC_MULTA.NU_MONTO_IC,
              MORA      = V_REC_MULTA.NU_MONTO_IM,
              GASTOS    = V_REC_MULTA.NU_MONTO_COSTAS,
              CODAREA   = (case when PIN_NU_ORIGEN = 1 then
                                       V_REC_MULTA.VC_COD_OR
                             -- INI MODI@20170316
                             /*
                            (CASE WHEN V_REC_MULTA.VC_NRO_RESOL_3 IS NOT NULL THEN SUBSTR(V_REC_MULTA.VC_NRO_RESOL_3, -4)
                                WHEN V_REC_MULTA.VC_NRO_RESOL_2 IS NOT NULL THEN SUBSTR(V_REC_MULTA.VC_NRO_RESOL_2, -4)
                                WHEN V_REC_MULTA.VC_NRO_RESOL_1 IS NOT NULL THEN SUBSTR(V_REC_MULTA.VC_NRO_RESOL_1, -4)
                                ELSE NULL
                             END)*/
                             -- FIN MODI@20170316
                           else null
                           end),
               uitnro = V_REC_MULTA.NU_VALOR_UIT
          WHERE IDENTIFICADOR = V_VC_CORRELATIVO AND
                ESTADOMULTA   = V_VC_ESTADO_MULTA AND
                --V_REC_MULTA.NU_MONTO_UIT <> 0 AND
                CAPITAL <> V_REC_MULTA.NU_MONTO_UIT ;

           ---UPDATE
          UPDATE SGCORESYS.CO_MULTAESTADO
          SET
              CODAREA   = (case when PIN_NU_ORIGEN = 1 then
                             V_REC_MULTA.VC_COD_OR
                            -- INI MODI@20170316
                            /*
                            (CASE WHEN V_REC_MULTA.VC_NRO_RESOL_3 IS NOT NULL THEN SUBSTR(V_REC_MULTA.VC_NRO_RESOL_3, -4)
                                WHEN V_REC_MULTA.VC_NRO_RESOL_2 IS NOT NULL THEN SUBSTR(V_REC_MULTA.VC_NRO_RESOL_2, -4)
                                WHEN V_REC_MULTA.VC_NRO_RESOL_1 IS NOT NULL THEN SUBSTR(V_REC_MULTA.VC_NRO_RESOL_1, -4)
                                ELSE NULL
                             END)
                             */
                            -- FIN MODI@20170316
                           else null
                           end),
              uitnro = V_REC_MULTA.NU_VALOR_UIT
              ,
              SALDOCAPITAL      = V_REC_MULTA.NU_SALDO,
              SALDOINTERES      = V_REC_MULTA.NU_SALDO_IC,
              SALDOMORA         = V_REC_MULTA.NU_SALDO_IM,
              SALDOGASTOS       = V_REC_MULTA.NU_SALDO_COSTAS
          WHERE IDENTIFICADOR = V_VC_CORRELATIVO AND
                ESTADOMULTA   = V_VC_ESTADO_MULTA;

        ---HEADER UPDATE FINAL
        UPDATE SGCORESYS.CO_MULTA T
        SET ESTADOMULTA         =   V_VC_ESTADO_MULTA,
            ESTADOMULTACOBRANZA =   V_VC_ESTADO_COB,
            COBEXPEDIENTEESTADO =   V_VC_ESTADO_EXP,
            ESTADOPAGO          =   V_VC_ESTADO_PAGO,
            UITMONTOCAPITAL     =   V_REC_MULTA.NU_MONTO_UIT,
            INTERESES           =   V_REC_MULTA.NU_MONTO_IC,
            MORA                =   V_REC_MULTA.NU_MONTO_IM,
            GASTOS              =   V_REC_MULTA.NU_MONTO_COSTAS,
            FILEANIO            =   V_REC_MULTA.CH_ANIO_FILE,
            FILEFECHARECEPCION  =   V_REC_MULTA.DT_RECEPCION_FILE,
            FILENUMERO          =   V_REC_MULTA.VC_NRO_FILE_AEC,
            ORPSRESOLFECHAEMISION = V_REC_MULTA.DT_RESOLUCION,
            COMRESOLFECHAEMISION  = V_REC_MULTA.DT_RES_COMISION,
            COMFECHAREVISION      = V_REC_MULTA.DT_REVISION,
            COMRESOLFECHANOTIFICACION = V_REC_MULTA.DT_NOTF_RES_COMISION,
            SALARESOLFECHAEMISION = V_REC_MULTA.DT_RES_SALA,
            COBFECHAULTIMO        = V_REC_MULTA.DT_ULT_ESTADO_EXPED_COB,
            CODMOTIVOMULTACOB     = V_REC_MULTA.VC_COD_MOTIVO_MULTA_COB,
            --INI DIC2016
            AMORTIZADO            = V_REC_MULTA.NU_TOTAL_AMORTIZADO,
            AMORTIZADOINTERESES   = V_REC_MULTA.NU_TOTAL_AMORTIZADO_IC,
            AMORTIZADOMORA        = V_REC_MULTA.NU_TOTAL_AMORTIZADO_IM,
            AMORTIZADOGASTOS      = V_REC_MULTA.NU_TOTAL_AMORTIZADO_COSTAS,
            SALDO                 = V_REC_MULTA.NU_SALDO,
            SALDOINTERESES        = V_REC_MULTA.NU_SALDO_IC,
            SALDOMORA             = V_REC_MULTA.NU_SALDO_IM,
            SALDOGASTOS           = V_REC_MULTA.NU_SALDO_COSTAS,

            DENUNCIANTENOMBRE     = V_VC_NOMBRE_DENUNCIANTE,
            DENUNCIADO            = V_NUM_PERSONA,
            --FIN DIC2016
            -- INI MODI 20170316
            T.ORPSRESOLNUMERO     = V_REC_MULTA.VC_NRO_RESOL_1,
            T.COMRESOLNUMERO      = V_REC_MULTA.VC_NRO_RESOL_2,
            T.SALARESOLNUMERO     = V_REC_MULTA.VC_NRO_RESOL_3,
            T.SALARESOLFECHANOTIFICACION = V_REC_MULTA.DT_NOTF_RES_SALA,
            T.SALARESOLFECHAREGISTRO     = V_REC_MULTA.DT_REG_SALA,
            -- FIN MODI 20170316
            --27/MAR/17
            CODMOTIVOMULTA         = V_REC_MULTA.VC_COD_MOTIVO_EXPED_COB,
            COBEXPEDIENTEMOTIVO    = V_REC_MULTA.VC_COD_MOTIVO_EXPED_COB,
            SANCIONADO             = V_NUM_PERSONA -- INI TK86335
        WHERE IDENTIFICADOR=V_VC_CORRELATIVO AND V_VC_ESTADO_MULTA IS NOT NULL;

        IF V_REC_MULTA.VC_TIPO_MULTA='FR' THEN
            --INSERTAR CRONOGRAMA - CUOTAS

            USR_SIA_INTFZ.PKG_INTFZ_MULTAS.S_LISTA_CRONO_TOTAL(PIN_NU_ORIGEN => PIN_NU_ORIGEN,
                PIN_VC_ANIO_EXPCOB=> V_VC_EXP_COB_ANIO,
                PIN_VC_NRO_EXPCOB => V_VC_EXP_COB_NRO,
                PIN_DT_INI_RES_APROB => PIN_DT_FECHA_DESDE,
                PIN_DT_FIN_RES_APROB => PIN_DT_FECHA_HASTA,
                POUT_CUR_RESULT      => V_CUR_CRONOGRAMA,
                POUT_NU_ERROR        => POUT_NU_ERROR,
                POUT_VC_ERROR        => POUT_VC_ERROR);

            V_NU_VUELTA := 0;
            LOOP
            FETCH V_CUR_CRONOGRAMA INTO V_REC_CRONOGRAMA;
            EXIT WHEN V_CUR_CRONOGRAMA%NOTFOUND;


                IF V_NU_VUELTA = 0 THEN
                  BEGIN
                    SELECT DISTINCT X.FECHAAPROBACIONCUOTA
                           INTO V_DT_APROBACIONCUOTA
                     FROM SGCORESYS.CO_MULTACUOTA X
                    WHERE X.IDENTIFICADOR = V_VC_CORRELATIVO;

                    IF TRUNC(V_DT_APROBACIONCUOTA) <> TRUNC(V_REC_CRONOGRAMA.DT_EST_EXPED_COB) THEN
                       DELETE FROM SGCORESYS.CO_MULTACUOTA X
                          WHERE X.IDENTIFICADOR = V_VC_CORRELATIVO;
                    END IF;
                    V_NU_VUELTA := 1;
                  EXCEPTION
                    WHEN OTHERS THEN
                      V_NU_VUELTA := 1;
                  END;
                 END IF;

                INSERT INTO SGCORESYS.CO_MULTACUOTA (
                    IDENTIFICADOR,
                    CUOTA,
                    FECHAVENCIMIENTO,
                    CAPITAL,
                    INTERESES,
                    IMPORTE,
                    GASTOS,
                    MORA,
                    TOTAL,
                    AMORTIZADOMONTO,
                    AMORTIZADOCAPITAL,
                    SALDOCUOTA,
                    SALDOCAPITAL,
                    FechaAprobacionCuota,
                    PeriodoCuota,
                    saldointeres,
                    saldomora,
                    saldocostas,
                    amortizadointeres,
                    amortizadomora,
                    amortizadocosta,
                    COMPROBANTEINGRESO
                ) SELECT
                    /* IDENTIFICADOR - VARCHAR(14) */ V_VC_CORRELATIVO,
                    /* CUOTA - INT */ V_REC_CRONOGRAMA.NU_NRO_CUOTA,
                    /* FECHAVENCIMIENTO - DATETIME */ V_REC_CRONOGRAMA.DT_VCTO,
                    /* CAPITAL - DECIMAL(20,4) */ V_REC_CRONOGRAMA.NU_MTO_CAPITAL,
                    /* INTERESES - DECIMAL(20,4) */ V_REC_CRONOGRAMA.NU_MTO_INT_COMP,
                    /* IMPORTE - DECIMAL(20,4) */ V_REC_CRONOGRAMA.NU_MTO_TOT_PAGAR,
                    /* GASTOS - DECIMAL(20,4) */ V_REC_CRONOGRAMA.NU_MTO_COSTAS,
                    /* MORA - DECIMAL(20,4) */ V_REC_CRONOGRAMA.NU_MTO_INT_MORA,
                    /* TOTAL - DECIMAL(20,4) */ V_REC_CRONOGRAMA.NU_MTO_TOT_PAGAR,
                    /* AMORTIZADOMONTO - DECIMAL(20,4) */ V_REC_CRONOGRAMA.NU_AMORT_TOTAL AS AMORTIZADOMONTO,
                    /* AMORTIZADOCAPITAL - DECIMAL(20,4) */ V_REC_CRONOGRAMA.NU_AMORT_CAP AS AMORTIZADOCAPITAL,
                    /* SALDOCUOTA - DECIMAL(20,4) */ V_REC_CRONOGRAMA.NU_SALDO_TOTAL AS SALDOCUOTA,
                    /* SALDOCAPITAL - DECIMAL(20,4) */ V_REC_CRONOGRAMA.NU_SALDO_CAP AS SALDOCAPITAL,
                    /* FECHAAPROBACIONCUOTA - DATETIME */ V_REC_CRONOGRAMA.DT_EST_EXPED_COB, -- ANTES: DT_RES_APROBACION
                    /* PERIODOCUOTA - VARCHAR(6) */ TO_CHAR(V_REC_CRONOGRAMA.DT_EST_EXPED_COB,'YYYYMM'),
                    /* saldointeres number */ V_REC_CRONOGRAMA.NU_SALDO_IC,
                    /* saldomora  number */ V_REC_CRONOGRAMA.NU_SALDO_IM,
                    /* saldocostas  number  */ V_REC_CRONOGRAMA.NU_SALDO_CG,
                    /* amortizadointeres  number */ V_REC_CRONOGRAMA.NU_AMORT_IC,
                    /* amortizadomora number  */ V_REC_CRONOGRAMA.NU_AMORT_IM,
                    /* amortizadocosta  NUMBER */ V_REC_CRONOGRAMA.NU_AMORT_CG,
                    /* COMPROBANTEINGRESO VARCHAR2(1000)*/V_REC_CRONOGRAMA.VC_LISTA_CI
                   FROM DUAL
                   WHERE NOT EXISTS (SELECT 1 FROM SGCORESYS.CO_MULTACUOTA X
                        WHERE X.IDENTIFICADOR = V_VC_CORRELATIVO AND X.CUOTA=V_REC_CRONOGRAMA.NU_NRO_CUOTA);


                  ---UPDATE FINAL DE CUOTAS
                UPDATE SGCORESYS.CO_MULTACUOTA X
                SET X.AMORTIZADOMONTO   = V_REC_CRONOGRAMA.NU_AMORT_TOTAL,
                    X.AMORTIZADOCAPITAL = V_REC_CRONOGRAMA.NU_AMORT_CAP,
                    X.AMORTIZADOINTERES = V_REC_CRONOGRAMA.NU_AMORT_IC,
                    X.AMORTIZADOMORA    = V_REC_CRONOGRAMA.NU_AMORT_IM,
                    X.AMORTIZADOCOSTA   = V_REC_CRONOGRAMA.NU_AMORT_CG,
                    X.COMPROBANTEINGRESO= V_REC_CRONOGRAMA.VC_LISTA_CI,
                    X.SALDOCUOTA        = V_REC_CRONOGRAMA.NU_SALDO_TOTAL,
                    X.SALDOCAPITAL      = V_REC_CRONOGRAMA.NU_SALDO_CAP,
                    X.SALDOINTERES      = V_REC_CRONOGRAMA.NU_SALDO_IC,
                    X.SALDOMORA         = V_REC_CRONOGRAMA.NU_SALDO_IM,
                    X.SALDOCOSTAS       = V_REC_CRONOGRAMA.NU_SALDO_CG
                WHERE X.IDENTIFICADOR=V_VC_CORRELATIVO AND X.CUOTA=V_REC_CRONOGRAMA.NU_NRO_CUOTA;

                END LOOP;
           END IF;

      END LOOP;
      CLOSE V_CUR_MULTA;
      COMMIT;

    EXCEPTION
        WHEN OTHERS THEN
        S_UTL_RETORNA_ERROR(PIN_NU_ERROR  => SQLCODE,
        --S_UTL_RETORNA_ERROR(PIN_NU_ERROR  => V_NUM_CONTADOR,
                          PIN_VC_ERROR  => SUBSTR(SQLERRM, 1, 250),
                          --POUT_NU_ERROR => V_NUM_CONTADOR,
                          POUT_NU_ERROR => POUT_NU_ERROR,
                          POUT_VC_ERROR => POUT_VC_ERROR);

    END;
END;
/
