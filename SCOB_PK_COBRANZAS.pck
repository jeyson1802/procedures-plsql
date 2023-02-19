CREATE OR REPLACE PACKAGE SCOB_PK_COBRANZAS IS

    -- Author  : ADMIN
    -- Created : 17/03/2011 15:00:13 p.m.
    -- Purpose :

    TYPE CU_REC_SET IS REF CURSOR;
    ----

    PROCEDURE SCOB_SP_S_MULTA
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 17.03.2011
        -- Proposito    : Consulta las multas
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_C_EVENTO            IN CHAR, --1=RECEPCION;2=VALIDAR;3=OBSERVAR;4=ASIGNAR
     PI_V_CUM               IN VARCHAR2,
     PI_C_ANIO              IN T_SCOB_MULTA.ANIO%TYPE,
     PI_N_NRO_INGRESO       IN T_SCOB_MULTA_COBRANZA.NRO_INGRESO%TYPE,
     PI_N_NRO_IMPROCEDENCIA IN T_SCOB_MULTA_IMPROCEDENCIA.NRO_IMPROCEDENCIA%TYPE,
     PI_I_TIPO_PERSONA      IN T_SCOB_PERSONA.TIPO_PERSONA%TYPE,
     PI_I_TIPO_DOC          IN T_SCOB_PERSONA.TIPO_DOC%TYPE,
     PI_V_NRO_DOC           IN T_SCOB_PERSONA.NRO_DOC%TYPE,
     PI_V_APE_PATERNO       IN T_SCOB_PERSONA.APE_PATERNO%TYPE,
     PI_V_APE_MATERNO       IN T_SCOB_PERSONA.APE_MATERNO%TYPE,
     PI_V_PRI_NOMBRE        IN T_SCOB_PERSONA.PRI_NOMBRE%TYPE,
     PI_V_SEG_NOMBRE        IN T_SCOB_PERSONA.SEG_NOMBRE%TYPE,
     PI_V_RAZON_SOCIAL      IN T_SCOB_PERSONA.RAZON_SOCIAL%TYPE,
     PI_N_ID_USUARIO        IN T_SCOB_USUARIO.ID_USUARIO%TYPE,
     PI_C_FEC_INGRESO_INI   IN CHAR,
     PI_C_FEC_INGRESO_FIN   IN CHAR,
     PI_C_COD_DPTO          IN T_SCOB_UBIGEO.COD_DPTO%TYPE,
     PI_C_COD_PROV          IN T_SCOB_UBIGEO.COD_PROV%TYPE,
     PI_C_COD_DSTO          IN T_SCOB_UBIGEO.COD_DIST%TYPE,
     PI_N_VALOR_UIT_INI     IN T_SCOB_MULTA_DETAL.VALOR_UIT%TYPE,
     PI_N_VALOR_UIT_FIN     IN T_SCOB_MULTA_DETAL.VALOR_UIT%TYPE,
     PI_N_MONTO_UIT_INI     IN T_SCOB_MULTA_DETAL.MONTO_UIT%TYPE,
     PI_N_MONTO_UIT_FIN     IN T_SCOB_MULTA_DETAL.MONTO_UIT%TYPE,
     PI_N_COD_MATERIA       IN T_SCOB_MULTA.ID_MATERIA%TYPE,
     PI_N_COD_ORGANO_RESOL  IN T_SCOB_MULTA_DETAL.ID_ORGANO_RESOLUTIVO%TYPE,
     --PI_I_COD_TIPO_DOMICILIO  IN T_SCOB_PERSONA_DOMICILIO.TIPO_DOMICILIO%TYPE,
     --PI_V_DIRECCION           IN T_SCOB_PERSONA_DOMICILIO.DIRECCION%TYPE,
     PI_V_ASIG        IN VARCHAR2,
     PI_C_FEC_NOT_INI IN CHAR, --falta..
     PI_C_FEC_NOT_FIN IN CHAR, --falta..
     PI_C_FEC_RES_INI IN CHAR, --falta..
     PI_C_FEC_RES_FIN IN CHAR, --falta..
     PI_N_SEDE        IN T_SCOB_SEDE.ID_SEDE%TYPE, --falta..
     PO_CU_RETORNO    OUT CU_REC_SET
     
     );

    PROCEDURE SCOB_SP_S_DATOS_MULTA_COBRANZA
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 17.03.2011
        -- Proposito    : Consulta los datos de la cabecera de una multa en cobranza
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_N_ID_MULTA IN T_SCOB_MULTA.ID_MULTA%TYPE,
     PO_CU_RETORNO OUT CU_REC_SET);

    PROCEDURE SCOB_SP_S_MULTA_COBRANZA
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 18.03.2011
        -- Proposito    : Consulta las multa para verificar su ingreso a AEC
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_V_CUM          IN T_SCOB_MULTA.CUM%TYPE,
     PO_N_RETORNO      OUT NUMBER,
     PO_N_RETORNO_DET  OUT NUMBER,
     PO_N_RETORNO_DET2 OUT NUMBER,
     PO_C_RETORNO_DET3 OUT CHAR, --
     PO_N_COD_ERROR    OUT NUMBER,
     PO_V_MSJ_ERROR    OUT VARCHAR2);

    PROCEDURE SCOB_SP_I_MULTA_COBRANZA
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 18.03.2011
        -- Proposito    : Inserta la multa a AEC
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_N_ID_MULTA       IN T_SCOB_MULTA_COBRANZA.ID_MULTA%TYPE,
     PI_N_ID_MULTA_DETAL IN T_SCOB_MULTA_DETAL.ID_MULTA_DETAL%TYPE,
     PI_C_FECHA_INGRESO  CHAR,
     PI_ID_AREA_COBRANZA IN T_SCOB_AREA_COBRANZA.ID_AREA_COBRANZA%TYPE,
     PI_V_AUDUSUCREACION IN T_SCOB_MULTA_DETAL.AUDUSUCREACION%TYPE,
     
     PO_N_RETORNO   OUT NUMBER,
     PO_N_COD_ERROR OUT NUMBER,
     PO_V_MSJ_ERROR OUT VARCHAR2);

    PROCEDURE SCOB_SP_S_CARGA_ASIGNADA
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 22.03.2011
        -- Proposito    : Consulta la carga de multas asignadas a los usuarios.
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PO_CU_RETORNO     OUT CU_REC_SET,
     PO_CU_RETORNO_DET OUT CU_REC_SET);

    PROCEDURE SCOB_SP_S_CARGA_ASIGNADA_DET
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 25.08.2011
        -- Proposito    : Consulta el detalle de la carga asignada  a los usuarios.
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PO_CU_RETORNO OUT CU_REC_SET);

    PROCEDURE SCOB_SP_U_CARGA_ASIGNADA
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 22.03.2011
        -- Proposito    : insertar las multas asignadas a un usuario.
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_C_EVENTO         IN CHAR,
     PI_N_ID_USUARIO     IN T_SCOB_MULTA.ID_USUARIO_ASIG_COBRANZA%TYPE,
     PI_V_ID_MULTA       IN VARCHAR2,
     PI_N_NRO_ITEMS      IN NUMBER,
     PI_V_AUDUSUCREACION IN T_SCOB_MULTA_CHECK.AUDUSUCREACION%TYPE,
     PO_N_RETORNO        OUT NUMBER,
     PO_N_COD_ERROR      OUT NUMBER,
     PO_V_MSJ_ERROR      OUT VARCHAR2);

    PROCEDURE SCOB_SP_S_MULTA_IMPROCEDENCIA
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 01.03.2011
        -- Proposito    : consulta las improcedencias registradas para una multa.
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_N_ID_MULTA IN T_SCOB_MULTA.ID_MULTA%TYPE,
     PI_C_IND_PEND IN CHAR, --1=muestra solo la pendiente;0=muestra todas
     PO_CU_RETORNO OUT CU_REC_SET);

    PROCEDURE SCOB_SP_I_MULTA_IMPROCEDENCIA
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 01.03.2011
        -- Proposito    : actualiza la respuesta a las improcedencias
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_N_ID_MULTA          IN T_SCOB_MULTA.ID_MULTA%TYPE,
     PI_N_ID_MULTA_DETAL    IN T_SCOB_MULTA_DETAL.ID_MULTA_DETAL%TYPE,
     PI_N_ID_MULTA_COBRANZA IN T_SCOB_MULTA_COBRANZA.ID_MULTA_COBRANZA%TYPE,
     PI_I_COD_ESTADO        IN T_SCOB_MULTA.ESTADO_MULTA%TYPE,
     PI_I_COD_MOTIVO        IN T_SCOB_MULTA_IMPROCEDENCIA.COD_MOTIVO%TYPE,
     PI_V_DES_MOTIVO        IN T_SCOB_MULTA_IMPROCEDENCIA.DES_MOTIVO%TYPE,
     PI_N_ID_PLANTILLA      IN T_SCOB_MULTA_IMPROCEDENCIA.ID_PLANTILLA%TYPE,
     PI_N_MOTIVO_PLANTILLA  IN T_SCOB_MULTA_DOCUMENTO_GEN.ID_MOTIVO_PLANTILLA%TYPE,
     --
     PI_N_ID_SERVICIO      IN NUMBER, --falta rmca
     PI_N_ID_TIPO_SERVICIO IN NUMBER, --falta rmca
     PI_C_FLG_UCI          IN CHAR, --falta rmca
     PI_C_FEC_GENERACION   IN CHAR, --falta rmca
     --
     PI_V_AUDUSUCREACION        IN T_SCOB_MULTA_IMPROCEDENCIA.AUDUSUCREACION%TYPE,
     PI_N_ID_USUARIO_INGRESO    IN T_SCOB_MULTA.ID_USUARIO_INGRESO%TYPE,
     PO_CU_RETORNO_ETIQUETA     OUT CU_REC_SET,
     PO_CU_RETORNO_VAL_ETIQUETA OUT CU_REC_SET,
     PO_N_RETORNO               OUT NUMBER,
     PO_N_COD_ERROR             OUT NUMBER,
     PO_V_MSJ_ERROR             OUT VARCHAR2);

    PROCEDURE SCOB_SP_U_MULTA_IMPROCEDENCIA
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 23.03.2011
        -- Proposito    : inserta improcedencias
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_N_ID_MULTA               IN T_SCOB_MULTA.ID_MULTA%TYPE,
     PI_N_ID_MULTA_DETAL         IN T_SCOB_MULTA_DETAL.ID_MULTA_DETAL%TYPE,
     PI_N_ID_MULTA_IMPROCEDENCIA IN T_SCOB_MULTA_IMPROCEDENCIA.ID_MULTA_IMPROCEDENCIA%TYPE,
     PI_V_DES_RESPUESTA          IN T_SCOB_MULTA_IMPROCEDENCIA.DES_RESPUESTA%TYPE,
     PI_N_ID_USUARIO_RPTA        IN T_SCOB_USUARIO.ID_USUARIO%TYPE,
     PI_V_AUDUSUMODIFICACION     IN T_SCOB_MULTA_IMPROCEDENCIA.AUDUSUMODIFICACION%TYPE,
     
     PO_N_RETORNO   OUT NUMBER,
     PO_N_COD_ERROR OUT NUMBER,
     PO_V_MSJ_ERROR OUT VARCHAR2);

    PROCEDURE SCOB_SP_U_MULTA_CENTRAL_RIESGO
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 14.07.2011
        -- Proposito    : ACTUALIZAR ENVIO A CENTRAL DE RIESGOS
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_N_ID_MULTA           IN T_SCOB_MULTA.ID_MULTA%TYPE,
     PI_C_FLG_ENVIO_RIESGO   IN T_SCOB_MULTA.FLG_ENVIO_RIESGO%TYPE,
     PI_V_AUDUSUMODIFICACION IN T_SCOB_MULTA.AUDUSUMODIFICACION%TYPE,
     PO_N_RETORNO            OUT NUMBER,
     PO_N_COD_ERROR          OUT NUMBER,
     PO_V_MSJ_ERROR          OUT VARCHAR2);

    PROCEDURE SCOB_SP_S_MULTA_BY_ID(PI_N_ID_MULTA IN NUMBER,
                                    PO_CU_RETORNO OUT CU_REC_SET);

    PROCEDURE SCOB_SP_U_ASIGNAR_MASIVO
    /*
        -----------------------------------------------------------
        -- Autor        : MGALARZA
        -- Creado       : 12.12.2016
        -- Proposito    : ASIGNACIÓN MASIVA DE FILES
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (IN_AR_VC_CUM         IN STR_ARRAY,
     IN_ID_USUARIO_AEC    IN VARCHAR2,
     IN_VC_AUDUSUMODIFICA IN VARCHAR2,
     PO_N_RETORNO         OUT NUMBER,
     PO_V_MSJ_ERROR       OUT VARCHAR2);
    ----
    PROCEDURE SCOB_SP_S_COMBOS_MULTA_CERO
    /*
    -----------------------------------------------------------
    -- Autor        : HCHALCO
    -- Creado       : 05.08.2021
    -- Proposito    : Listar tipo multas de exp para la págiana multa cero
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    : 
    -----------------------------------------------------------
    */
    (
      PI_VC_NOM_COMBO         VARCHAR2,
      PI_NU_ID_ESTADO_MULTA   NUMBER,
      PO_CU_RETORNO            out CU_REC_SET
    );
    
    PROCEDURE SCOB_SP_I_MULTA_CERO
    /*
    -----------------------------------------------------------
    -- Autor        : HCHALCO
    -- Creado       : 05.08.2021
    -- Proposito    : Generar multa cero
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    : 
    -----------------------------------------------------------
    */
    (
      PI_VC_CUM   IN VARCHAR2,
      PI_NU_TIPO_MULTA         IN NUMBER,
      PI_NU_ESTADO_MULTA         IN NUMBER,
      PI_NU_MOTIVO_MULTA         IN NUMBER,
      PI_DT_FECHA_ESTADO       IN VARCHAR2,
      PI_VC_USUARIO_LOGIN      IN VARCHAR2,
      
      PO_NU_RETORNO            OUT NUMBER,
      PO_NU_COD_ERROR          OUT NUMBER,
      PO_VC_MSJ_ERROR          OUT VARCHAR2
    );
    
    PROCEDURE SCOB_SP_S_MULTA_CERO
    /*
        -----------------------------------------------------------
        -- Autor        : HCHALCO
        -- Creado       : 10.08.2021
        -- Proposito    : Consulta para Multa CERO
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_V_CUM               IN VARCHAR2,
     PO_CU_RETORNO          OUT CU_REC_SET
     
     );
    
END SCOB_PK_COBRANZAS;
/
CREATE OR REPLACE PACKAGE BODY SCOB_PK_COBRANZAS IS
    ----
    PROCEDURE SCOB_SP_S_MULTA
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 17.03.2011
        -- Proposito    : Consulta las multas
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_C_EVENTO            IN CHAR, --1=RECEPCION;2=VALIDAR;3=OBSERVAR;4=ASIGNAR
     PI_V_CUM               IN VARCHAR2,
     PI_C_ANIO              IN T_SCOB_MULTA.ANIO%TYPE,
     PI_N_NRO_INGRESO       IN T_SCOB_MULTA_COBRANZA.NRO_INGRESO%TYPE,
     PI_N_NRO_IMPROCEDENCIA IN T_SCOB_MULTA_IMPROCEDENCIA.NRO_IMPROCEDENCIA%TYPE,
     PI_I_TIPO_PERSONA      IN T_SCOB_PERSONA.TIPO_PERSONA%TYPE,
     PI_I_TIPO_DOC          IN T_SCOB_PERSONA.TIPO_DOC%TYPE,
     PI_V_NRO_DOC           IN T_SCOB_PERSONA.NRO_DOC%TYPE,
     PI_V_APE_PATERNO       IN T_SCOB_PERSONA.APE_PATERNO%TYPE,
     PI_V_APE_MATERNO       IN T_SCOB_PERSONA.APE_MATERNO%TYPE,
     PI_V_PRI_NOMBRE        IN T_SCOB_PERSONA.PRI_NOMBRE%TYPE,
     PI_V_SEG_NOMBRE        IN T_SCOB_PERSONA.SEG_NOMBRE%TYPE,
     PI_V_RAZON_SOCIAL      IN T_SCOB_PERSONA.RAZON_SOCIAL%TYPE,
     PI_N_ID_USUARIO        IN T_SCOB_USUARIO.ID_USUARIO%TYPE,
     PI_C_FEC_INGRESO_INI   IN CHAR,
     PI_C_FEC_INGRESO_FIN   IN CHAR,
     PI_C_COD_DPTO          IN T_SCOB_UBIGEO.COD_DPTO%TYPE,
     PI_C_COD_PROV          IN T_SCOB_UBIGEO.COD_PROV%TYPE,
     PI_C_COD_DSTO          IN T_SCOB_UBIGEO.COD_DIST%TYPE,
     PI_N_VALOR_UIT_INI     IN T_SCOB_MULTA_DETAL.VALOR_UIT%TYPE,
     PI_N_VALOR_UIT_FIN     IN T_SCOB_MULTA_DETAL.VALOR_UIT%TYPE,
     PI_N_MONTO_UIT_INI     IN T_SCOB_MULTA_DETAL.MONTO_UIT%TYPE,
     PI_N_MONTO_UIT_FIN     IN T_SCOB_MULTA_DETAL.MONTO_UIT%TYPE,
     PI_N_COD_MATERIA       IN T_SCOB_MULTA.ID_MATERIA%TYPE,
     PI_N_COD_ORGANO_RESOL  IN T_SCOB_MULTA_DETAL.ID_ORGANO_RESOLUTIVO%TYPE,
     PI_V_ASIG              IN VARCHAR2,
     PI_C_FEC_NOT_INI       IN CHAR,
     PI_C_FEC_NOT_FIN       IN CHAR,
     PI_C_FEC_RES_INI       IN CHAR,
     PI_C_FEC_RES_FIN       IN CHAR,
     PI_N_SEDE              IN T_SCOB_SEDE.ID_SEDE%TYPE,
     PO_CU_RETORNO          OUT CU_REC_SET
     
     ) AS
        I_ALTO  INTEGER;
        I_MEDIO INTEGER;
        I_BAJO  INTEGER;
    
    BEGIN
    
        SELECT NVL(TD.TXT_VALOR3, 0),
               NVL(TD.TXT_VALOR2, 0),
               NVL(TD.TXT_VALOR1, 0)
          INTO I_BAJO,
               I_MEDIO,
               I_ALTO
          FROM T_SCOB_TABLA_DET TD
         WHERE TD.ID_TABLA = 16 --PARAMETROS GENERALES
           AND TD.COD_INTERNO = 18; --PARAMETRO DE COBRANZA PARA SEMAFORO ASIGNAR MULTA
    
        OPEN PO_CU_RETORNO FOR
            SELECT DISTINCT CASE
                                WHEN PI_C_EVENTO = '4' AND
                                     MULT.FEC_INGRESO_AEC IS NOT NULL AND
                                     MULT.ID_USUARIO_ASIG_COBRANZA IS NULL
                                
                                 THEN
                                --ESTADO EN TRAMITE DE COBRANZA, LISTO PARA SER ASIGNADO.
                                
                                 CASE
                                     WHEN (TO_DATE(TO_CHAR(SYSDATE, 'DD/MM/YYYY'), 'DD/MM/YYYY') BETWEEN
                                          TO_DATE(TO_CHAR(MULT.FEC_INGRESO_AEC + I_BAJO, 'DD/MM/YYYY'), 'DD/MM/YYYY') AND
                                          TO_DATE(TO_CHAR(MULT.FEC_INGRESO_AEC + I_MEDIO, 'DD/MM/YYYY'), 'DD/MM/YYYY'))
                                     
                                      THEN
                                      '1' --VERDE
                                 
                                     WHEN
                                     
                                      (TO_DATE(TO_CHAR(SYSDATE, 'DD/MM/YYYY'), 'DD/MM/YYYY') BETWEEN
                                      TO_DATE(TO_CHAR(MULT.FEC_INGRESO_AEC + I_MEDIO, 'DD/MM/YYYY'), 'DD/MM/YYYY') AND
                                      TO_DATE(TO_CHAR(MULT.FEC_INGRESO_AEC + I_ALTO, 'DD/MM/YYYY'), 'DD/MM/YYYY'))
                                     
                                      THEN
                                      '2' --AMARILLO
                                 
                                     WHEN
                                     
                                      TO_DATE(TO_CHAR(SYSDATE, 'DD/MM/YYYY'), 'DD/MM/YYYY') >=
                                      TO_DATE(TO_CHAR(MULT.FEC_INGRESO_AEC + I_ALTO, 'DD/MM/YYYY'), 'DD/MM/YYYY') THEN
                                      '3' --ROJO
                                 
                                     ELSE
                                      '0'
                                 
                                 END
                            
                                ELSE
                                 '0'
                            END AS SEM_ASIG_MULTA,
                            MULT.FEC_ESTADO_MULTA AS FEC_ULT_ESTADO_MULTA,
                            MULT.ID_MULTA AS ID_MULTA,
                            MDET.ID_MULTA_DETAL AS ID_MULTA_DETAL,
                            NVL(MCOB.ID_MULTA_COBRANZA, 0) AS ID_MULTA_COBRANZA,
                            NVL(MULT.FLG_MULTA_COBRANZA, '0') AS IND_COBRANZA,
                            NVL(MULT.FLG_MULTA_IMPROCEDENCIA, '0') AS IND_IMPROCEDENCIA,
                            ---
                            ORGR.TIPO_INSTANCIA AS TIPO_INSTANCIA_ACTUAL,
                            MULT.ANIO || MULT.CUM AS COD_MULTA,
                            MDET.ID_ORGANO_RESOLUTIVO AS COD_ORG_RESOLUTIVO,
                            ORGR.DESCRIPCION AS NOM_ORG_RESOLUTIVO,
                            MCOB.FECHA_VALIDACION AS FEC_VALIDACION,
                            MULT.NRO_ULT_IMPROCEDENCIA AS NRO_IMPROCEDENCIA,
                            DECODE(NVL(MULT.NRO_ULT_IMPROCEDENCIA, '0'), '0', 'NO', 'SI') AS NOM_IND_IMPROCEDENCIA,
                            --MULT.FEC_ULT_IMPROCEDENCIA AS FEC_IMPROCEDENCIA,
                            trunc(mimp.audfeccreacion) as FEC_IMPROCEDENCIA,
                            MCOB.NRO_INGRESO AS NRO_INGRESO_AEC, --COLUMNA: NºINGRESO
                            MCOB.FECHA_INGRESO AS FEC_INGRESO_AEC, --COLUMNA: FEC.INGRESO
                            MULT.ID_MATERIA AS COD_MATERIA,
                            MATE.DESCRIPCION AS NOM_MATERIA,
                            MDET.NRO_RESOLUCION AS NRO_RESOLUCION,
                            MDET.FEC_RESOLUCION AS FEC_RESOLUCION,
                            DECODE(MULT.FLG_TIPO_MULTA, SCOB_PK_CONSTANTES.C_FLG_TIPO_MULTA_SOLID, ' ', PERS.COD_SANCIONADO) AS COD_SANCIONADO,
                            DECODE(MULT.FLG_TIPO_MULTA,
                                   SCOB_PK_CONSTANTES.C_FLG_TIPO_MULTA_SOLID,
                                   SCOB_PK_EXPEDIENTE.SCOB_FN_SANCIONADOS_MULTA(MULT.ID_MULTA, 0),
                                   DECODE(PERS.TIPO_PERSONA,
                                          SCOB_PK_CONSTANTES.C_TIPO_PERS_JURIDICA,
                                          PERS.RAZON_SOCIAL,
                                          PERS.APE_PATERNO || ' ' || PERS.APE_MATERNO || ' ' || PERS.PRI_NOMBRE || ' ' || PERS.SEG_NOMBRE || ' ' ||
                                          PERS.APE_CASADA)) AS DES_SANCIONADO,
                            
                            --DATOS ANTIDUMPING
                            DECODE(NVL(MUAN.NRO_LIQUIDACION_CODIGO, ' '),
                                   ' ',
                                   NULL,
                                   MUAN.NRO_LIQUIDACION_CODIGO || '-' || MUAN.NRO_LIQUIDACION_ANIO || '/' || MUAN.NRO_LIQUIDACION_CORRELATIVO) AS NRO_LIQUIDACION,
                            
                            --------------------------------------------------------------------------------------
                            --montos deuda antidumping
                            MUAN.TIPO_CAMBIO       AS TIPO_CAMBIO,
                            MUAN.MONTO_ANTIDUMPING AS MONTO_ANTIDUMPING,
                            --1=Multa OR 0=Multa Antidumping
                            DECODE(MULT.FLG_MULTA_RESOLUTIVO, '1', NULL, MUAN.MONTO_INTERES) AS MONTO_DA_INTERES_COMPENSATORIO, --MUAN.MONTO_INTERES AS MONTO_DA_INTERES_COMPENSATORIO,
                            DECODE(MULT.FLG_MULTA_RESOLUTIVO, '1', NULL, MUAN.MONTO_INTERES_MORATORIO) AS MONTO_DA_INTERES_MORATORIO, --MUAN.MONTO_INTERES_MORATORIO AS MONTO_DA_INTERES_MORATORIO,
                            MUAN.MONTO_TOTAL AS MONTO_TOTAL_DEUDA_DA,
                            
                            --montos deuda uit
                            MDET.VALOR_UIT               AS UIT,
                            MULT.MONTO_UIT               AS MONTO_UIT,
                            MULT.MONTO_INTERES           AS MONTO_IC,
                            MULT.MONTO_INTERES_MORATORIO AS MONTO_IM,
                            MULT.MONTO_COSTAS            AS MONTO_COSTAS,
                            MULT.MONTO_TOTAL_DEUDA       AS MONTO_TOTAL_DEUDA,
                            
                            --montos amortizado
                            CASE
                                WHEN MULT.COD_ESTADO_PAGO = SCOB_PK_CONSTANTES.C_EST_PAGO_DSCTO THEN
                                 0.00
                                ELSE
                                 MULT.TOTAL_AMORTIZADO
                            END AS MONTO_AMORTIZACION, --amortizado_uit
                            CASE
                                WHEN MULT.COD_ESTADO_PAGO = SCOB_PK_CONSTANTES.C_EST_PAGO_DSCTO THEN
                                 DECODE(MULT.IND_DESCUENTO, '1', MULT.MONTO_PORCENTAJE_DSCTO, 0.00)
                                ELSE
                                 0.00
                            END AS MONTO_AMORTIZADO_DSCTO,
                            MULT.TOTAL_AMORTIZADO_IC AS MONTO_AMORTIZADO_IC,
                            MULT.TOTAL_AMORTIZADO_IM AS MONTO_AMORTIZADO_IM,
                            MULT.TOTAL_AMORTIZADO_COSTAS AS MONTO_AMORTIZADO_COSTAS,
                            MULT.TOTAL_AMORTIZACION_DEUDA AS MONTO_TOTAL_AMORTIZADO,
                            
                            --montos saldo
                            MULT.SALDO             AS MONTO_SALDO, --uit
                            MULT.SALDO_IC          AS SALDO_IC,
                            MULT.SALDO_IM          AS SALDO_IM,
                            MULT.SALDO_COSTAS      AS SALDO_COSTAS,
                            MULT.SALDO_TOTAL_DEUDA AS SALDO_TOTAL,
                            --------------------------------------------------------------------------------------
                            
                            VALI.USUARIO             AS NOM_VALIDADO_POR,
                            ASIG.USUARIO             AS NOM_ASIGNADO_A,
                            MULT.FECHA_ASIG_COBRANZA AS FEC_ASIGNADO_A,
                            MULT.ESTADO_MULTA        AS COD_ESTADO,
                            -- INI TK76845@JCARRION
                            --SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_ESTADO_MULTA, MULT.ESTADO_MULTA) AS DES_ESTADO,
                            SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_ESTADO_MULTA, MIMP.ESTADO_MULTA) AS DES_ESTADO,
                            -- FIN TK76845@JCARRION
                            
                            LTRIM(RTRIM(MULT.FLG_TIPO_MULTA)) AS IND_RESPONSABILIDAD,
                            MRES.TXT_DESCRIPCION AS DES_RESPONSABILIDAD,
                            MDET.FEC_NOTIFICACION_RESOLUCION AS FEC_NOTIF,
                            MIMP.COD_MOTIVO AS COD_MOTIVO,
                            MOTI.DESCRIPCION AS NOM_MOTIVO,
                            MIMP.AUDUSUCREACION AS NOM_OBSERVADO_POR,
                            MULT.COD_ESTADO_PAGO AS COD_ESTADO_PAGO,
                            SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_EST_PAGOS, MULT.COD_ESTADO_PAGO) AS NOM_ESTADO_PAGO,
                            ' ' AS VER_MEMO,
                            MULT.FLG_ENVIO_RIESGO AS FLG_ENVIO_RIESGO,
                            MULT.FEC_ENVIO_RIESGO AS FEC_ENVIO_RIESGO,
                            MULT.FLG_MULTA_RESOLUTIVO AS IND_TIPO_MULTA, --1=MULTA OR;0=ANTIDUMPING
                            MULT.FEC_GENERACION_SEC AS FEC_GENERACION_SEC,
                            -------------NRO FILE-----------------------------------------------------
                            MULT.ANIO_FILE_AEC    AS ANIO_FILE, --ANIO
                            ACOB.CODIGO           AS COD_AREA_COB, --COD AREA
                            MULT.NRO_FILE_AEC     AS NRO_FILE, --CORRELATIVO  --COLUMNA: NºFILE (LOS 3 CAMPOS)
                            MULT.FEC_INGRESO_FILE AS FEC_INGRESO_FILE, --COLUMNA: FEC. INGRESO FILE
                            ---------------------------------------------------------------------------
                            EXPE.ID_EXPEDIENTE AS ID_EXPEDIENTE,
                            CASE
                                WHEN EXPE.ID_EXPEDIENTE IS NOT NULL THEN
                                 EST_EXP.DESCRIPCION
                                ELSE
                                  -- INI TK76845@JCARRION
                                  --SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_ESTADO_MULTA, MULT.ESTADO_MULTA)
                                 SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_ESTADO_MULTA, MIMP.ESTADO_MULTA)
                                 -- FIN TK76845@JCARRION
                            END AS ESTADO_MULTA_EXPEDIENTE,
                            
                            CASE
                                WHEN MULT.COD_ESTADO_PAGO = 3 OR
                                     MULT.COD_ESTADO_PAGO = 4 THEN --TOTAL O DESCUENTO
                                 '0' -- VALOR ANTERIOR: 1 cambio JCARRION@20161025
                                WHEN (MULT.ESTADO_MULTA <> SCOB_PK_CONSTANTES.C_TBL_EST_MUL_NO_INICIADO) AND
                                     (MULT.ESTADO_MULTA <> SCOB_PK_CONSTANTES.C_TBL_EST_COB_TRAMITE_COB) THEN
                                 '2'
                                ELSE
                                 '0'
                            END AS IND_HABILITA,
                            MULT.TIPO_INSTANCIA_INICIA AS TIPO_INSTANCIA_INICIA
              FROM T_SCOB_MULTA MULT
            
             INNER JOIN T_SCOB_MULTA_DETAL MDET
                ON MDET.ID_MULTA = MULT.ID_MULTA
               AND MDET.FLG_ACTUAL = '1'
            
              LEFT JOIN T_SCOB_MULTA_ANTIDUMPING MUAN
                ON MUAN.ID_MULTA = MULT.ID_MULTA
            
             INNER JOIN T_SCOB_MULTA_COBRANZA MCOB
                ON MCOB.ID_MULTA = MULT.ID_MULTA
               AND MCOB.FLG_ACTUAL = '1'
               AND MCOB.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
            
              LEFT JOIN usr_sicob.T_SCOB_MULTA_IMPROCEDENCIA MIMP
                ON MIMP.ID_MULTA_COBRANZA = MCOB.ID_MULTA_COBRANZA
            
              LEFT JOIN T_SCOB_EST_MUL_COB_MOTIVO MOTI
                ON MOTI.ID_MOTIVO = MIMP.COD_MOTIVO
            
             INNER JOIN T_SCOB_ORGANO_RESOLUTIVO ORGR
                ON ORGR.ID_ORGANO_RESOLUTIVO = MDET.ID_ORGANO_RESOLUTIVO
            
             INNER JOIN T_SCOB_MATERIA MATE
                ON MATE.ID_MATERIA = MULT.ID_MATERIA
            
             INNER JOIN T_SCOB_MULTA_SANCIONADO SANC
                ON SANC.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL
               AND SANC.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
               AND NVL(SANC.COD_TIPO_PERSONA, '1') = '1'
            
             INNER JOIN T_SCOB_PERSONA PERS
                ON PERS.ID_PERSONA = SANC.ID_PERSONA
               AND PERS.COD_SANCIONADO IS NOT NULL
            
              LEFT JOIN T_SCOB_PERSONA_DOMICILIO PDOM
                ON PDOM.ID_PERSONA = PERS.ID_PERSONA
               AND PDOM.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
            
              LEFT JOIN T_SCOB_MULTA_SANCIONADO_DIREC SDIR
                ON SDIR.ID_MULTA_SANCIONADO = SANC.ID_MULTA_SANCIONADO
               AND SDIR.ID_PERSONA_DOMICILIO = PDOM.ID_PERSONA_DOMICILIO
               AND SDIR.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
            
             INNER JOIN T_SCOB_TABLA_DET MRES --TIPO DE MULTA (SOLIDARIA?).
                ON MRES.ID_TABLA = SCOB_PK_CONSTANTES.C_TBL_TIPO_RESP_MULTA_OR
               AND LTRIM(RTRIM(MRES.COD_INTERNO)) = LTRIM(RTRIM(MULT.FLG_TIPO_MULTA))
            
              LEFT JOIN T_SCOB_UBIGEO UBIG
                ON UBIG.ID_UBIGEO = PDOM.ID_UBIGEO
            
              LEFT JOIN T_SCOB_USUARIO ASIG
                ON ASIG.ID_USUARIO = MULT.ID_USUARIO_ASIG_COBRANZA
            
              LEFT JOIN T_SCOB_USUARIO VALI
                ON VALI.ID_USUARIO = MCOB.ID_USUARIO_VALIDACION
            
              LEFT JOIN T_SCOB_EXPEDIENTE_MULTA EXMU
                ON EXMU.ID_MULTA = MULT.ID_MULTA
               AND EXMU.ESTADO = '1'
            
              LEFT JOIN T_SCOB_EXPEDIENTE EXPE
                ON EXPE.ID_EXPEDIENTE = EXMU.ID_EXPEDIENTE
            
              LEFT JOIN T_SCOB_EST_EXP_COB EST_EXP
                ON EST_EXP.ID_EST_EXP_COB = EXPE.ESTADO_EXPEDIENTE
              LEFT JOIN T_SCOB_AREA_COBRANZA ACOB
                ON ACOB.ID_AREA_COBRANZA = MULT.ID_AREA_COBRANZA
             WHERE MULT.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
               AND (NVL(PI_V_CUM, ' ') = ' ' OR (NVL(PI_V_CUM, ' ') <> ' ' AND MULT.ANIO || TRIM(MULT.CUM) LIKE '%' || TRIM(PI_V_CUM) || '%'))
              /*
               AND (NVL(PI_C_ANIO, ' ') = ' ' OR (NVL(PI_C_ANIO, ' ') <> ' ' AND MULT.ANIO = PI_C_ANIO))
               AND (NVL(PI_I_TIPO_PERSONA, 0) = 0 OR (NVL(PI_I_TIPO_PERSONA, 0) <> 0 AND PERS.TIPO_PERSONA = PI_I_TIPO_PERSONA))
               AND (NVL(PI_I_TIPO_DOC, 0) = 0 OR (NVL(PI_I_TIPO_DOC, 0) <> 0 AND PERS.TIPO_DOC = PI_I_TIPO_DOC))
               AND (NVL(PI_V_NRO_DOC, ' ') = ' ' OR (NVL(PI_V_NRO_DOC, ' ') <> ' ' AND TRIM(PERS.NRO_DOC) = TRIM(PI_V_NRO_DOC)))
               AND (NVL(PI_V_APE_PATERNO, ' ') = ' ' OR
                   (NVL(PI_V_APE_PATERNO, ' ') <> ' ' AND
                   FUN_SCOB_NOSENSITE(TRIM(PERS.APE_PATERNO)) LIKE '%' || FUN_SCOB_NOSENSITE(TRIM(PI_V_APE_PATERNO)) || '%'))
               AND (NVL(PI_V_APE_MATERNO, ' ') = ' ' OR
                   (NVL(PI_V_APE_MATERNO, ' ') <> ' ' AND
                   FUN_SCOB_NOSENSITE(TRIM(PERS.APE_MATERNO)) LIKE '%' || FUN_SCOB_NOSENSITE(TRIM(PI_V_APE_MATERNO)) || '%'))
               AND (NVL(PI_V_PRI_NOMBRE, ' ') = ' ' OR (NVL(PI_V_PRI_NOMBRE, ' ') <> ' ' AND FUN_SCOB_NOSENSITE(TRIM(PERS.PRI_NOMBRE)) LIKE
                   '%' || FUN_SCOB_NOSENSITE(TRIM(PI_V_PRI_NOMBRE)) || '%'))
               AND (NVL(PI_V_SEG_NOMBRE, ' ') = ' ' OR (NVL(PI_V_SEG_NOMBRE, ' ') <> ' ' AND FUN_SCOB_NOSENSITE(TRIM(PERS.SEG_NOMBRE)) LIKE
                   '%' || FUN_SCOB_NOSENSITE(TRIM(PI_V_SEG_NOMBRE)) || '%'))
               AND (NVL(PI_V_RAZON_SOCIAL, ' ') = ' ' OR
                   (NVL(PI_V_RAZON_SOCIAL, ' ') <> ' ' AND
                   FUN_SCOB_NOSENSITE(TRIM(PERS.RAZON_SOCIAL)) LIKE '%' || FUN_SCOB_NOSENSITE(TRIM(PI_V_RAZON_SOCIAL)) || '%'))
               AND (NVL(PI_N_NRO_INGRESO, 0) = 0 OR (NVL(PI_N_NRO_INGRESO, ' ') <> ' ' AND FUN_SCOB_NOSENSITE(TRIM(MCOB.NRO_INGRESO)) LIKE
                   '%' || FUN_SCOB_NOSENSITE(TRIM(PI_N_NRO_INGRESO)) || '%'))
               AND (NVL(PI_N_NRO_IMPROCEDENCIA, 0) = 0 OR
                   (NVL(PI_N_NRO_IMPROCEDENCIA, ' ') <> ' ' AND
                   FUN_SCOB_NOSENSITE(TRIM(MIMP.NRO_IMPROCEDENCIA)) LIKE '%' || FUN_SCOB_NOSENSITE(TRIM(PI_N_NRO_IMPROCEDENCIA)) || '%'))
               AND (NVL(PI_N_COD_MATERIA, 0) = 0 OR (NVL(PI_N_COD_MATERIA, 0) <> 0 AND MULT.ID_MATERIA = PI_N_COD_MATERIA))
               AND (NVL(PI_N_COD_ORGANO_RESOL, 0) = 0 OR (NVL(PI_N_COD_ORGANO_RESOL, 0) <> 0 AND ORGR.ID_ORGANO_RESOLUTIVO = PI_N_COD_ORGANO_RESOL))
                  
                  --NUEVO
               AND (NVL(PI_V_ASIG, ' ') = ' ' OR
                   (NVL(PI_V_ASIG, ' ') <> ' ' AND ((PI_V_ASIG = '1' AND ASIG.USUARIO IS NOT NULL) OR (PI_V_ASIG = '0' AND ASIG.USUARIO IS NULL))))
                  
               AND (NVL(PI_C_FEC_INGRESO_INI, ' ') = ' ' OR
                   (NVL(PI_C_FEC_INGRESO_INI, ' ') <> ' ' AND
                   (
                   
                    (PI_C_EVENTO = '1' AND
                    TO_DATE(TO_CHAR(MCOB.FECHA_INGRESO, 'DD/MM/YYYY'), 'DD/MM/YYYY') BETWEEN TO_DATE(PI_C_FEC_INGRESO_INI, 'DD/MM/YYYY') AND
                    TO_DATE(PI_C_FEC_INGRESO_FIN, 'DD/MM/YYYY')) OR
                    (PI_C_EVENTO = '2' AND
                    TO_DATE(TO_CHAR(MCOB.FECHA_VALIDACION, 'DD/MM/YYYY'), 'DD/MM/YYYY') BETWEEN TO_DATE(PI_C_FEC_INGRESO_INI, 'DD/MM/YYYY') AND
                    TO_DATE(PI_C_FEC_INGRESO_FIN, 'DD/MM/YYYY')) OR
                    (PI_C_EVENTO = '3' AND
                    TO_DATE(TO_CHAR(MIMP.AUDFECCREACION, 'DD/MM/YYYY'), 'DD/MM/YYYY') BETWEEN TO_DATE(PI_C_FEC_INGRESO_INI, 'DD/MM/YYYY') AND
                    TO_DATE(PI_C_FEC_INGRESO_FIN, 'DD/MM/YYYY')) OR
                    (PI_C_EVENTO = '4' AND
                    TO_DATE(TO_CHAR(MULT.FECHA_ASIG_COBRANZA, 'DD/MM/YYYY'), 'DD/MM/YYYY') BETWEEN TO_DATE(PI_C_FEC_INGRESO_INI, 'DD/MM/YYYY') AND
                    TO_DATE(PI_C_FEC_INGRESO_FIN, 'DD/MM/YYYY')))))
                  
               AND (NVL(PI_N_VALOR_UIT_INI, 0) = 0 OR
                   (NVL(PI_N_VALOR_UIT_INI, 0) <> 0 AND MDET.VALOR_UIT BETWEEN PI_N_VALOR_UIT_INI AND PI_N_VALOR_UIT_FIN))
               AND (NVL(PI_N_MONTO_UIT_INI, 0) = 0 OR
                   (NVL(PI_N_MONTO_UIT_INI, 0) <> 0 AND MDET.MONTO_UIT BETWEEN PI_N_MONTO_UIT_INI AND PI_N_MONTO_UIT_FIN))
               AND (NVL(PI_C_COD_DPTO, ' ') = ' ' OR (NVL(PI_C_COD_DPTO, ' ') <> ' ' AND TRIM(UBIG.COD_DPTO) = TRIM(PI_C_COD_DPTO)))
               AND (NVL(PI_C_COD_PROV, ' ') = ' ' OR (NVL(PI_C_COD_PROV, ' ') <> ' ' AND TRIM(UBIG.COD_PROV) = TRIM(PI_C_COD_PROV)))
               AND (NVL(PI_C_COD_DSTO, ' ') = ' ' OR (NVL(PI_C_COD_DSTO, ' ') <> ' ' AND TRIM(UBIG.COD_DIST) = TRIM(PI_C_COD_DSTO)))
                  
                  -------------------
               AND ((NVL(PI_C_FEC_NOT_INI, ' ') = ' ') OR (NVL(PI_C_FEC_NOT_INI, ' ') <> ' ' AND
                   TO_DATE(TO_CHAR(MDET.FEC_NOTIFICACION_RESOLUCION, 'DD/MM/YYYY'), 'DD/MM/YYYY') BETWEEN
                   TO_DATE(PI_C_FEC_NOT_INI, 'DD/MM/YYYY') AND TO_DATE(PI_C_FEC_NOT_FIN, 'DD/MM/YYYY')))
                  
               AND ((NVL(PI_C_FEC_RES_INI, ' ') = ' ') OR (NVL(PI_C_FEC_RES_INI, ' ') <> ' ' AND
                   TO_DATE(TO_CHAR(MDET.FEC_RESOLUCION, 'DD/MM/YYYY'), 'DD/MM/YYYY') BETWEEN
                   TO_DATE(PI_C_FEC_RES_INI, 'DD/MM/YYYY') AND TO_DATE(PI_C_FEC_RES_FIN, 'DD/MM/YYYY')))
                  
               AND (NVL(PI_N_SEDE, 0) = 0 OR (NVL(PI_N_SEDE, 0) <> 0 AND MULT.ID_SEDE = PI_N_SEDE))
                  -------------------
                  -----------------------------------------------
                  --EN LA BANDEJA DE POR ASIGNAR,
                  -----------------------------------------------
                  --SOLO SE VEN LAS MULTAS EN AEC QUE ESTAN COMO "NO INICIADAS"
               AND ((NVL(PI_C_EVENTO, ' ') = ' ')
                   
                   --OR ((PI_C_EVENTO=4) AND NVL(MCOB.ID_USUARIO_VALIDACION,0)<>0)
                   OR (PI_C_EVENTO = 4 AND NVL(MULT.FLG_MULTA_COBRANZA, '0') = '1' --SE ENCUENTRA EN EL AREA DE COBRANZA.
                   AND (MULT.ESTADO_MULTA = SCOB_PK_CONSTANTES.C_TBL_EST_MUL_NO_INICIADO OR
                   MULT.ESTADO_MULTA = SCOB_PK_CONSTANTES.C_TBL_EST_COB_TRAMITE_COB) AND
                   NOT (MULT.COD_ESTADO_PAGO IN (SCOB_PK_CONSTANTES.C_EST_PAGO_TOTAL, SCOB_PK_CONSTANTES.C_EST_PAGO_DSCTO) AND
                    MULT.ESTADO_ENVIO_ARCHIVO = SCOB_PK_CONSTANTES.C_EST_ARCH_CENTRAL_ENVIADO))
                   -----------------------------------------------
                   --EN LA BANDEJA DE OBSERVADOS,
                   -----------------------------------------------
                   --SOLO SE VEN LAS MULTAS EN AEC QUE HAN SIDO VALIDADAS.
                   OR ((PI_C_EVENTO = 3) AND (NVL(MCOB.ID_USUARIO_VALIDACION, 0) <> 0 AND
                   (NVL(MULT.FLG_MULTA_COBRANZA, '0') = '1' OR MULT.ESTADO_MULTA IN (9, 10, 11, 12, 13)) AND
                   (MULT.ID_MATERIA NOT IN (SCOB_PK_CONSTANTES.C_COD_MATERIA_ANTIDUMPING) AND
                   MULT.ID_SUB_MATERIA NOT IN (SCOB_PK_CONSTANTES.C_COD_SUBMATERIA_ANTIDUMPING))))
                   -----------------------------------------------
                   --EN LA BANDEJA DE VALIDAR,
                   -----------------------------------------------
                   --SOLO SE VEN LAS MULTAS EN AEC QUE HAN SIDO INGRESADAS
                   --QUE NO HAN SIDO VALIDADAS.
                   --QUE NO HAN SIDO OBSERVADOS CON IMPROCEDENCIA.
                   OR ((PI_C_EVENTO = 2) AND (MULT.ESTADO_MULTA = SCOB_PK_CONSTANTES.C_TBL_EST_MUL_NO_INICIADO OR
                   NVL(MCOB.ID_USUARIO_VALIDACION, 0) = 0 AND NVL(MULT.FLG_MULTA_COBRANZA, '0') = '1'))
                   -----------------------------------------------
                   --EN LA BANDEJA DE RECEPCIONAR,
                   -----------------------------------------------
                   --SOLO SE VEN LAS MULTAS EN AEC QUE HAN SIDO INGRESADAS
                   --QUE ESTAN CON ESTADO NO_INICIADO.
                   OR ((PI_C_EVENTO = 1) AND
                   (MULT.ESTADO_MULTA = SCOB_PK_CONSTANTES.C_TBL_EST_MUL_NO_INICIADO AND NVL(MULT.FLG_MULTA_COBRANZA, '0') = '1')))
                   */
            ;
    
    END;

    PROCEDURE SCOB_SP_S_DATOS_MULTA_COBRANZA
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 17.03.2011
        -- Proposito    : Consulta los datos de la cabecera de una multa en cobranza
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_N_ID_MULTA IN T_SCOB_MULTA.ID_MULTA%TYPE,
     PO_CU_RETORNO OUT CU_REC_SET) AS
    BEGIN
    
        OPEN PO_CU_RETORNO FOR
        
            SELECT MCOB.ID_MULTA_COBRANZA AS ID_MULTA_COBRANZA,
                   MULT.ANIO || MULT.CUM AS COD_MULTA_AEC,
                   MCOB.NRO_INGRESO AS NRO_INGRESO,
                   MCOB.FECHA_INGRESO AS FEC_INGRESO,
                   MIMP.NRO_IMPROCEDENCIA AS NRO_IMPROCEDENCIA,
                   MIMP.COD_MOTIVO AS COD_MOTIVO_IMPROCEDENCIA,
                   MOTI.DESCRIPCION AS NOM_MOTIVO_IMPROCEDENCIA,
                   MIMP.DES_MOTIVO AS DES_IMPROCEDENCIA,
                   MIMP.AUDFECCREACION AS FEC_IMPROCEDENCIA,
                   MIMP.FECHA_RESPUESTA AS FEC_RPTA_OR,
                   MIMP.DES_RESPUESTA AS DES_RPTA_OR,
                   MULT.NRO_ULT_IMPROCEDENCIA AS NRO_ULT_IMPROCEDENCIA
            
              FROM T_SCOB_MULTA MULT
             INNER JOIN T_SCOB_MULTA_DETAL MDET
                ON MDET.ID_MULTA = MULT.ID_MULTA
               AND MDET.FLG_ACTUAL = '1'
               AND MDET.ESTADO = '1'
              LEFT JOIN T_SCOB_MULTA_COBRANZA MCOB
                ON MCOB.ID_MULTA = MULT.ID_MULTA
               AND MCOB.FLG_ACTUAL = '1'
              LEFT JOIN T_SCOB_MULTA_IMPROCEDENCIA MIMP
                ON MIMP.ID_MULTA_COBRANZA = MCOB.ID_MULTA_COBRANZA
               AND MIMP.ESTADO = '1'
              LEFT JOIN T_SCOB_EST_MUL_COB_MOTIVO MOTI
                ON MOTI.ID_MOTIVO = MIMP.COD_MOTIVO
             WHERE MULT.ID_MULTA = PI_N_ID_MULTA;
    
    END;

    PROCEDURE SCOB_SP_S_MULTA_COBRANZA
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 18.03.2011
        -- Proposito    : Consulta las multa para verificar su ingreso a AEC
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_V_CUM          IN T_SCOB_MULTA.CUM%TYPE,
     PO_N_RETORNO      OUT NUMBER,
     PO_N_RETORNO_DET  OUT NUMBER,
     PO_N_RETORNO_DET2 OUT NUMBER,
     PO_C_RETORNO_DET3 OUT CHAR, --
     PO_N_COD_ERROR    OUT NUMBER,
     PO_V_MSJ_ERROR    OUT VARCHAR2) AS
        N_ID_MULTA                     T_SCOB_MULTA_COBRANZA.ID_MULTA%TYPE;
        N_ID_MULTA_DET                 T_SCOB_MULTA_DETAL.ID_MULTA_DETAL%TYPE;
        V_COD_MULTA                    VARCHAR(50);
        V_NRO_INGRESO                  VARCHAR(50);
        V_NRO_IMPROCEDENCIA            T_SCOB_MULTA_IMPROCEDENCIA.NRO_IMPROCEDENCIA%TYPE;
        I_EXISTE                       INTEGER;
        I_INSTANCIA_ACTUAL             INTEGER;
        C_FLG_MULTA_COBRANZA           CHAR(1);
        C_FLG_MULTA_IMPROCEDENCIA      CHAR(1);
        C_FLG_MULTA_IMPROCEDENCIA_RPTA CHAR(1);
        C_FLG_MULTA_OR                 CHAR(1);
        D_FEC_GENERACION_SEC           DATE;
    
    BEGIN
    
        BEGIN
        
            SELECT MULT.ID_MULTA,
                   MDET.ID_MULTA_DETAL,
                   MULT.ANIO || MULT.CUM,
                   MCOB.NRO_INGRESO,
                   MIMP.NRO_IMPROCEDENCIA,
                   ORGR.TIPO_INSTANCIA,
                   NVL(MULT.FLG_MULTA_COBRANZA, '0'),
                   NVL(MULT.FLG_MULTA_IMPROCEDENCIA, '0'),
                   DECODE(NVL(MIMP.ID_USUARIO_RPTA_IMPROCEDENCIA, '0'), '0', '0', '1'),
                   NVL(MULT.FLG_MULTA_RESOLUTIVO, '0'),
                   MULT.FEC_GENERACION_SEC
              INTO N_ID_MULTA,
                   N_ID_MULTA_DET,
                   V_COD_MULTA,
                   V_NRO_INGRESO,
                   V_NRO_IMPROCEDENCIA,
                   I_INSTANCIA_ACTUAL,
                   C_FLG_MULTA_COBRANZA,
                   C_FLG_MULTA_IMPROCEDENCIA,
                   C_FLG_MULTA_IMPROCEDENCIA_RPTA,
                   C_FLG_MULTA_OR,
                   D_FEC_GENERACION_SEC
              FROM T_SCOB_MULTA MULT
             INNER JOIN T_SCOB_MULTA_DETAL MDET
                ON MDET.ID_MULTA = MULT.ID_MULTA
               AND MDET.FLG_ACTUAL = '1'
             INNER JOIN T_SCOB_ORGANO_RESOLUTIVO ORGR
                ON ORGR.ID_ORGANO_RESOLUTIVO = MDET.ID_ORGANO_RESOLUTIVO
              LEFT JOIN T_SCOB_MULTA_COBRANZA MCOB
                ON MCOB.ID_MULTA = MULT.ID_MULTA
               AND MCOB.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
               AND MCOB.FLG_ACTUAL = '1'
              LEFT JOIN T_SCOB_MULTA_IMPROCEDENCIA MIMP
                ON MIMP.ID_MULTA_COBRANZA = MCOB.ID_MULTA_COBRANZA
             WHERE MULT.ANIO || MULT.CUM = UPPER(TRIM(PI_V_CUM))
               AND MULT.ESTADO_MULTA IN (SELECT ESMU.COD_INTERNO
                                           FROM T_SCOB_TABLA_DET ESMU
                                          WHERE ESMU.ID_TABLA = SCOB_PK_CONSTANTES.C_TBL_ESTADO_MULTA
                                            AND TRIM(ESMU.TXT_VALOR2) = 'COB' --area de cobranza
                                         )
               AND MULT.SALDO > 0 --agregado por OBS 181. 31.08.2011
            /*AND (NVL(MIMP.NRO_IMPROCEDENCIA,'0')='0' OR (
             NVL(MIMP.NRO_IMPROCEDENCIA,'0')<>'0' AND MIMP.FECHA_RESPUESTA IS NOT NULL)
            )*/
            ;
        
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                I_EXISTE := -1;
        END;
    
        PO_N_RETORNO      := N_ID_MULTA;
        PO_N_RETORNO_DET  := N_ID_MULTA_DET;
        PO_N_RETORNO_DET2 := I_INSTANCIA_ACTUAL;
        PO_C_RETORNO_DET3 := C_FLG_MULTA_OR;
        IF I_EXISTE = -1 THEN
            PO_N_COD_ERROR := -10;
            PO_V_MSJ_ERROR := 'No se puede realizar la acción. La multa no existe o antes ha sido recepcionada.';
            RETURN;
        END IF;
    
        IF TO_CHAR(D_FEC_GENERACION_SEC, 'DD/MM/YYYY') IS NULL THEN
            PO_N_COD_ERROR := -13;
            PO_V_MSJ_ERROR := 'No se puede realizar la acción. No se ha generado la SEC para la multa.';
            RETURN;
        END IF;
    
        IF C_FLG_MULTA_COBRANZA = '1' THEN
            PO_N_COD_ERROR := -11;
            PO_V_MSJ_ERROR := 'No se puede realizar la acción. ';
            PO_V_MSJ_ERROR := PO_V_MSJ_ERROR || 'La multa ' || PI_V_CUM || ' antes ha sido ingresada a cobranza.';
            RETURN;
        ELSIF C_FLG_MULTA_IMPROCEDENCIA = '1' AND
              C_FLG_MULTA_IMPROCEDENCIA_RPTA = '0' THEN
            PO_N_COD_ERROR := -12;
            PO_V_MSJ_ERROR := 'No se puede realizar la acción. La multa tiene una improcedencia no resuelta.';
            RETURN;
        END IF;
    
        IF NVL(V_NRO_INGRESO, ' ') = ' ' THEN
            PO_N_COD_ERROR := 1;
            PO_V_MSJ_ERROR := '¿Desea iniciar el proceso de recepción de la Multa (CUM) ' || PI_V_CUM || '?';
        ELSIF C_FLG_MULTA_IMPROCEDENCIA_RPTA = '1' THEN
            PO_N_COD_ERROR := 2;
            PO_V_MSJ_ERROR := 'La multa con CUM ' || PI_V_CUM || ' existe, ¿Desea ingresar respuesta a la improcedencia Nro:' || V_NRO_IMPROCEDENCIA || '?.';
        END IF;
    
    END;

    PROCEDURE SCOB_SP_I_MULTA_COBRANZA
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 18.03.2011
        -- Proposito    : Inserta la multa a AEC
        -----------------------------------------------------------
        -- Modificaciones:
        --@0001:28.12.2012:Cambio para identificar el valor NULL en el campo ESTADO_MULTA
        -----------------------------------------------------------
        */
    (PI_N_ID_MULTA       IN T_SCOB_MULTA_COBRANZA.ID_MULTA%TYPE,
     PI_N_ID_MULTA_DETAL IN T_SCOB_MULTA_DETAL.ID_MULTA_DETAL%TYPE,
     PI_C_FECHA_INGRESO  CHAR,
     PI_ID_AREA_COBRANZA IN T_SCOB_AREA_COBRANZA.ID_AREA_COBRANZA%TYPE,
     PI_V_AUDUSUCREACION IN T_SCOB_MULTA_DETAL.AUDUSUCREACION%TYPE,
     PO_N_RETORNO        OUT NUMBER,
     PO_N_COD_ERROR      OUT NUMBER,
     PO_V_MSJ_ERROR      OUT VARCHAR2) AS
        N_ID_MULTA_COBRANZA  T_SCOB_MULTA_COBRANZA.ID_MULTA_COBRANZA%TYPE;
        N_ID_USUARIO_INGRESO T_SCOB_MULTA_DETAL.ID_USUARIO_ULT_ESTADO%TYPE;
        I_EXISTE             INTEGER;
        N_CORRELATIVO        NUMBER;
        -----
    BEGIN
    
        PO_N_RETORNO   := 0;
        PO_N_COD_ERROR := 0;
        PO_V_MSJ_ERROR := ' ';
    
        --actualizar el registro actual de otros ingresos de la multa a AEC
        UPDATE T_SCOB_MULTA_COBRANZA MCOB
           SET MCOB.FLG_ACTUAL         = '0',
               MCOB.AUDFECMODIFICACION = SYSDATE,
               MCOB.AUDUSUMODIFICACION = PI_V_AUDUSUCREACION
         WHERE MCOB.ID_MULTA = PI_N_ID_MULTA
           AND MCOB.FLG_ACTUAL = '1';
    
        --inserta el ingreso a AEC
        --genera el codigo secuencial de la multa cobranza - tabla
        SELECT SCOB_SQ_MULTA_COBRANZA.NEXTVAL INTO N_ID_MULTA_COBRANZA FROM DUAL;
    
        -----------------------------------
        --SI ES LA PRIMERA VEZ QUE INGRESA A COBRANZA
        --SE GENERA EL CORRELATIVO
        SELECT COUNT(MULT.ID_MULTA)
          INTO I_EXISTE
          FROM T_SCOB_MULTA MULT
         WHERE MULT.FEC_INGRESO_FILE IS NOT NULL
           AND MULT.ID_MULTA = PI_N_ID_MULTA;
    
        IF I_EXISTE = 0 THEN
            --GENERANDO CORRELATIVO DEL AREA POR AÑO.
            SELECT NVL(MAX(TO_NUMBER(MULT.NRO_FILE_AEC)), 0) + 1
              INTO N_CORRELATIVO
              FROM T_SCOB_MULTA MULT
             WHERE MULT.ANIO_FILE_AEC = TO_CHAR(SYSDATE, 'YYYY')
               AND MULT.ID_AREA_COBRANZA = PI_ID_AREA_COBRANZA;
        
            UPDATE T_SCOB_MULTA MULT
               SET MULT.ANIO_FILE_AEC    = TO_CHAR(SYSDATE, 'YYYY'),
                   MULT.NRO_FILE_AEC     = LPAD(TO_CHAR(N_CORRELATIVO), 10, '0000000000'),
                   MULT.FEC_INGRESO_AEC  = SYSDATE, --UNICO POR FILE
                   MULT.FEC_INGRESO_FILE = SYSDATE, --ULTIMO POR FILE ("n" VECES AL AREA)
                   ID_AREA_COBRANZA      = PI_ID_AREA_COBRANZA
             WHERE MULT.ID_MULTA = PI_N_ID_MULTA;
        END IF;
        --------------------------------------
        ----------------------------------------
        N_CORRELATIVO := 0;
        --GENERANDO CORRELATIVO DE INGRESOS DE LA MULTA POR FILE GENERADO
        SELECT NVL(MAX(TO_NUMBER(MCOB.NRO_INGRESO)), 0) + 1
          INTO N_CORRELATIVO
          FROM T_SCOB_MULTA_COBRANZA MCOB
         WHERE MCOB.ID_MULTA = PI_N_ID_MULTA
           AND MCOB.ESTADO = '1';
        ----------------------------------------
    
        INSERT INTO T_SCOB_MULTA_COBRANZA
            (ID_MULTA_COBRANZA, ID_MULTA, NRO_INGRESO, ANIO, FECHA_INGRESO, AUDFECCREACION, AUDUSUCREACION, ESTADO, FLG_ACTUAL)
        VALUES
            (N_ID_MULTA_COBRANZA, PI_N_ID_MULTA, LPAD(TO_CHAR(N_CORRELATIVO), 4, '0000'), TO_CHAR(SYSDATE, 'YYYY'),
             TO_DATE(DECODE(NVL(PI_C_FECHA_INGRESO, ' '), ' ', TO_CHAR(SYSDATE, 'DD/MM/YYYY'), PI_C_FECHA_INGRESO), 'DD/MM/YYYY'), SYSDATE,
             PI_V_AUDUSUCREACION, SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO, '1');
    
        --actualiza los datos de la multa
        UPDATE T_SCOB_MULTA MULT
           SET MULT.FLG_MULTA_IMPROCEDENCIA = '0',
               MULT.FLG_MULTA_COBRANZA      = '1', --INGRESO A COBRANZA, ES UN PENDIENTE.
               MULT.AUDFECMODIFICACION      = SYSDATE,
               MULT.AUDUSUMODIFICACION      = PI_V_AUDUSUCREACION,
               MULT.FEC_INGRESO_FILE        = SYSDATE
         WHERE MULT.ID_MULTA = PI_N_ID_MULTA;
    
        --actualiza el estado de la multa
        --OBTENER EL ID DEL USUARIO QUE INGRESA LA INFORMACION
        SELECT USUARIO.ID_USUARIO
          INTO N_ID_USUARIO_INGRESO
          FROM T_SCOB_USUARIO USUARIO
         WHERE UPPER(TRIM(USUARIO.USUARIO)) = UPPER(TRIM(PI_V_AUDUSUCREACION))
           AND USUARIO.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO;
        SCOB_PK_MULTAS.SCOB_SP_I_MULTA_ESTADO(PI_N_ID_MULTA          => PI_N_ID_MULTA,
                                              PI_N_ID_MULTA_DETAL    => PI_N_ID_MULTA_DETAL,
                                              PI_I_ESTADO_MULTA      => SCOB_PK_CONSTANTES.C_TBL_EST_MUL_NO_INICIADO,
                                              PI_I_COD_MOTIVO        => 0,
                                              PI_C_FEC_ESTADO_MULTA  => TO_CHAR(SYSDATE, 'DD/MM/YYYY'),
                                              PI_V_AUDUSUCREACION    => PI_V_AUDUSUCREACION,
                                              PI_N_USU_ULT_ESTADO    => N_ID_USUARIO_INGRESO,
                                              PI_N_ID_MULTA_COBRANZA => 1,
                                              PO_N_RETORNO           => PO_N_RETORNO,
                                              PO_N_COD_ERROR         => PO_N_COD_ERROR,
                                              PO_V_MSJ_ERROR         => PO_V_MSJ_ERROR);
        --@0001:INI
        IF PO_N_RETORNO < 0 THEN
            ROLLBACK;
            RETURN;
        END IF;
        --@0001:FIN
        
        --INICIO VICTOR BENDEZU - MIGRACION SICOB A SIA
        USR_SIA_INTFZ.PKG_INTFZ_REG_MULTA_SICOB_SIA.SP_I_RECEP_MULTA_SICOB_A_SIA(PIN_NU_ID_MULTA => PI_N_ID_MULTA,
                                                                                 POUT_NU_COD_RESULT => PO_N_RETORNO,
                                                                                 POUT_VC_MSG_RESULT => PO_V_MSJ_ERROR);
        
        IF PO_N_RETORNO < 0 THEN
           ROLLBACK;
           RETURN;
        END IF;
        --FIN VICTOR BENDEZU - MIGRACION SICOB A SIA
  
        PO_N_RETORNO := N_ID_MULTA_COBRANZA;
        COMMIT;
    
    EXCEPTION
        WHEN OTHERS THEN
            PO_N_RETORNO   := -1;
            PO_N_COD_ERROR := SQLCODE;
            SELECT CASE
                       WHEN PO_N_COD_ERROR > 0 THEN
                        PO_N_COD_ERROR * -1
                       ELSE
                        PO_N_COD_ERROR
                   END
              INTO PO_N_COD_ERROR
              FROM DUAL;
            PO_V_MSJ_ERROR := SUBSTR(SQLERRM, 1, 250);
            ROLLBACK;
    END;

    PROCEDURE SCOB_SP_S_CARGA_ASIGNADA
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 22.03.2011
        -- Proposito    : Consulta la carga de multas asignadas a los usuarios.
                          25.08.2011
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PO_CU_RETORNO     OUT CU_REC_SET,
     PO_CU_RETORNO_DET OUT CU_REC_SET) AS
        N_REG NUMBER;
    BEGIN
    
        SELECT COUNT(MULT.ID_MULTA)
          INTO N_REG
          FROM T_SCOB_MULTA MULT
         WHERE MULT.ID_USUARIO_ASIG_COBRANZA IS NOT NULL
           AND MULT.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO;
    
        OPEN PO_CU_RETORNO FOR
            SELECT MULT.ID_USUARIO_ASIG_COBRANZA AS COD_USUARIO,
                   USUA.USUARIO AS LGN_USUARIO,
                   ((COUNT(MULT.ID_MULTA) * 100) / N_REG) POR_ASIGNADO,
                   COUNT(MULT.ID_MULTA) AS NRO_CUMS,
                   SUM(NVL(MDET.VALOR_UIT, 0)) AS NRO_UIT,
                   SUM(NVL(MDET.MONTO_UIT, 0)) AS MON_UIT,
                   SUM(MULT.TOTAL_AMORTIZADO) AS MON_AMORTIZACION,
                   SUM(MULT.SALDO) AS SALDO,
                   SUM(NVL(MUAN.MONTO_ANTIDUMPING, 0)) AS MON_UIT_DOL
              FROM T_SCOB_MULTA MULT
             INNER JOIN T_SCOB_MULTA_DETAL MDET
                ON MDET.ID_MULTA = MULT.ID_MULTA
               AND MDET.FLG_ACTUAL = '1'
             INNER JOIN T_SCOB_USUARIO USUA
                ON USUA.ID_USUARIO = MULT.ID_USUARIO_ASIG_COBRANZA
              LEFT JOIN T_SCOB_MULTA_ANTIDUMPING MUAN
                ON MUAN.ID_MULTA = MULT.ID_MULTA
             WHERE MULT.ID_USUARIO_ASIG_COBRANZA IS NOT NULL
               AND MULT.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
             GROUP BY MULT.ID_USUARIO_ASIG_COBRANZA,
                      USUA.USUARIO
             ORDER BY 3 DESC;
    
        OPEN PO_CU_RETORNO_DET FOR
            SELECT COD_USUARIO,
                   LGN_USUARIO,
                   IND_REG,
                   COD_ESTADO,
                   DECODE(IND_REG,
                          '1',
                          SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_ESTADO_MULTA, COD_ESTADO),
                          EST_EXP.DESCRIPCION) AS NOM_ESTADO,
                   COUNT(COD_ESTADO) AS NRO_CUM_BY_ESTADO
              FROM (SELECT MULT.ID_USUARIO_ASIG_COBRANZA AS COD_USUARIO,
                           USUA.USUARIO AS LGN_USUARIO,
                           DECODE(EXPE.ID_EXPEDIENTE, NULL, '1', '2') AS IND_REG, --1=MULTA; 2=EXPEDIENTE
                           DECODE(EXPE.ID_EXPEDIENTE, NULL, MULT.ESTADO_MULTA, EXPE.ESTADO_EXPEDIENTE) AS COD_ESTADO
                      FROM T_SCOB_MULTA MULT
                     INNER JOIN T_SCOB_MULTA_DETAL MDET
                        ON MDET.ID_MULTA = MULT.ID_MULTA
                       AND MDET.FLG_ACTUAL = '1'
                     INNER JOIN T_SCOB_USUARIO USUA
                        ON USUA.ID_USUARIO = MULT.ID_USUARIO_ASIG_COBRANZA
                      LEFT JOIN T_SCOB_EXPEDIENTE_MULTA EXMU
                        ON EXMU.ID_MULTA = MULT.ID_MULTA
                       AND EXMU.ESTADO = '1'
                      LEFT JOIN T_SCOB_EXPEDIENTE EXPE
                        ON EXPE.ID_EXPEDIENTE = EXMU.ID_EXPEDIENTE
                     WHERE MULT.ID_USUARIO_ASIG_COBRANZA IS NOT NULL
                       AND MULT.ESTADO = '1') CARGA_ASIG
              LEFT JOIN T_SCOB_EST_EXP_COB EST_EXP
                ON CARGA_ASIG.IND_REG = 2 --ESTADOS DEL EXPEDIENTE
               AND EST_EXP.ID_EST_EXP_COB = CARGA_ASIG.COD_ESTADO
             GROUP BY COD_USUARIO,
                      LGN_USUARIO,
                      IND_REG,
                      COD_ESTADO,
                      EST_EXP.DESCRIPCION
             ORDER BY COD_USUARIO,
                      IND_REG,
                      COD_ESTADO;
    
    END;

    PROCEDURE SCOB_SP_S_CARGA_ASIGNADA_DET
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 25.08.2011
        -- Proposito    : Consulta el detalle de la carga asignada  a los usuarios.
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PO_CU_RETORNO OUT CU_REC_SET) AS
    BEGIN
    
        OPEN PO_CU_RETORNO FOR
        
            SELECT COD_USUARIO,
                   LGN_USUARIO,
                   IND_REG,
                   COD_ESTADO,
                   DECODE(IND_REG,
                          '1',
                          SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_ESTADO_MULTA, COD_ESTADO), --5
                          EST_EXP.DESCRIPCION) AS NOM_ESTADO,
                   COUNT(COD_ESTADO) AS NRO_CUM_BY_ESTADO,
                   SUM(MONTO_UIT_DA) AS MONTO_UIT_DA, --MONTO DOLARES POR DERECHO ANTIDUMPING
                   SUM(NRO_UIT) AS NRO_UIT,
                   SUM(MONTO_UIT) AS MONTO_UIT,
                   SUM(TOTAL_AMORTIZADO_UIT) AS TOTAL_AMORTIZADO_UIT,
                   SUM(SALDO_UIT) AS SALDO_UIT
            
              FROM (SELECT MULT.ID_USUARIO_ASIG_COBRANZA AS COD_USUARIO,
                           USUA.USUARIO AS LGN_USUARIO,
                           DECODE(EXPE.ID_EXPEDIENTE, NULL, '1', '2') AS IND_REG, --1=MULTA; 2=EXPEDIENTE
                           DECODE(EXPE.ID_EXPEDIENTE, NULL, MULT.ESTADO_MULTA, EXPE.ESTADO_EXPEDIENTE) AS COD_ESTADO,
                           MUAN.MONTO_ANTIDUMPING AS MONTO_UIT_DA,
                           MDET.VALOR_UIT AS NRO_UIT,
                           MULT.MONTO_UIT AS MONTO_UIT,
                           MULT.TOTAL_AMORTIZADO AS TOTAL_AMORTIZADO_UIT,
                           MULT.SALDO AS SALDO_UIT
                    
                      FROM T_SCOB_MULTA MULT
                     INNER JOIN T_SCOB_MULTA_DETAL MDET
                        ON MDET.ID_MULTA = MULT.ID_MULTA
                       AND MDET.FLG_ACTUAL = '1'
                     INNER JOIN T_SCOB_USUARIO USUA
                        ON USUA.ID_USUARIO = MULT.ID_USUARIO_ASIG_COBRANZA
                      LEFT JOIN T_SCOB_EXPEDIENTE_MULTA EXMU
                        ON EXMU.ID_MULTA = MULT.ID_MULTA
                       AND EXMU.ESTADO = '1'
                      LEFT JOIN T_SCOB_EXPEDIENTE EXPE
                        ON EXPE.ID_EXPEDIENTE = EXMU.ID_EXPEDIENTE
                      LEFT JOIN T_SCOB_MULTA_ANTIDUMPING MUAN
                        ON MUAN.ID_MULTA = MULT.ID_MULTA
                     WHERE MULT.ID_USUARIO_ASIG_COBRANZA IS NOT NULL
                       AND MULT.ESTADO = '1') CARGA_ASIG
              LEFT JOIN T_SCOB_EST_EXP_COB EST_EXP
                ON CARGA_ASIG.IND_REG = 2
               AND EST_EXP.ID_EST_EXP_COB = CARGA_ASIG.COD_ESTADO
             GROUP BY COD_USUARIO,
                      LGN_USUARIO,
                      IND_REG,
                      COD_ESTADO,
                      EST_EXP.DESCRIPCION
             ORDER BY COD_USUARIO,
                      IND_REG,
                      COD_ESTADO;
    
    END;

    PROCEDURE SCOB_SP_U_CARGA_ASIGNADA
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 22.03.2011
        -- Proposito    : insertar las multas asignadas a un usuario.
        -----------------------------------------------------------
        -- Modificaciones:
        --@0001:28.12.2012:Cambio para identificar el valor NULL en el campo ESTADO_MULTA
        -----------------------------------------------------------
        */
    (PI_C_EVENTO IN CHAR,
     --1=ASIGNAR CARGA A USUARIO
     --2=VALIDAR MULTA
     PI_N_ID_USUARIO     IN T_SCOB_MULTA.ID_USUARIO_ASIG_COBRANZA%TYPE,
     PI_V_ID_MULTA       IN VARCHAR2,
     PI_N_NRO_ITEMS      IN NUMBER,
     PI_V_AUDUSUCREACION IN T_SCOB_MULTA_CHECK.AUDUSUCREACION%TYPE,
     PO_N_RETORNO        OUT NUMBER,
     PO_N_COD_ERROR      OUT NUMBER,
     PO_V_MSJ_ERROR      OUT VARCHAR2) IS
        N_ID_MULTA_ESTADO         INTEGER;
        N_ID_MULTA_NIVEL          T_SCOB_MULTA_DETAL.ID_MULTA_DETAL%TYPE;
        V_ID_MULTA                VARCHAR2(50);
        N_CONT                    INTEGER;
        N_ID_USUARIO_INGRESO      T_SCOB_MULTA_DETAL.ID_USUARIO_INGRESO%TYPE;
        N_COD_ESTADO_MULTA_ACTUAL INTEGER;
    BEGIN
        PO_V_MSJ_ERROR := '';
        PO_N_RETORNO   := 0;
        PO_N_COD_ERROR := -1;
    
        IF PI_C_EVENTO = '1' THEN
            --ASIGNAR CARGA A USUARIOS
        
            UPDATE T_SCOB_MULTA MULT
               SET MULT.ID_USUARIO_ASIG_COBRANZA = DECODE(PI_N_ID_USUARIO, 0, NULL, PI_N_ID_USUARIO),
                   MULT.FECHA_ASIG_COBRANZA      = DECODE(PI_N_ID_USUARIO, 0, NULL, SYSDATE),
                   MULT.AUDUSUMODIFICACION       = PI_V_AUDUSUCREACION,
                   MULT.AUDFECMODIFICACION       = SYSDATE
             WHERE INSTR(PI_V_ID_MULTA, '|' || TO_CHAR(ID_MULTA) || '|') > 0;
        
            --cambiar el estado de la multa.
            --obtener el ultimo nivel de detalle de la multa
            N_CONT := 1;
            WHILE (N_CONT <= PI_N_NRO_ITEMS)
            LOOP
            
                SCOB_PK_UTILITARIO.SCOB_SP_S_SPLIT(PI_V_ID_MULTA, '|', N_CONT + 1, V_ID_MULTA);
            
                IF V_ID_MULTA = '#' THEN
                    EXIT;
                END IF;
            
                SELECT MDET.ID_MULTA_DETAL,
                       MULT.ESTADO_MULTA
                  INTO N_ID_MULTA_NIVEL,
                       N_COD_ESTADO_MULTA_ACTUAL
                  FROM T_SCOB_MULTA_DETAL MDET
                 INNER JOIN T_SCOB_MULTA MULT
                    ON MULT.ID_MULTA = MDET.ID_MULTA
                 WHERE MDET.ID_MULTA = TO_NUMBER(V_ID_MULTA)
                   AND MDET.FLG_ACTUAL = '1';
            
                  
                IF NVL(PI_N_ID_USUARIO, 0) = 0 THEN
                    --DEBE OBTENER EL ESTADO ANTERIOR DE LA MULTA
                    N_ID_MULTA_ESTADO := SCOB_PK_CONSTANTES.C_TBL_EST_MUL_NO_INICIADO;
                ELSE
                    N_ID_MULTA_ESTADO := SCOB_PK_CONSTANTES.C_TBL_EST_COB_TRAMITE_COB;
                END IF;
            
                IF N_ID_MULTA_ESTADO <> N_COD_ESTADO_MULTA_ACTUAL THEN
                    --2012.05.09
                    --VALIDA EL CAMBIO DE ESTADO:03.11.2011
                    SCOB_PK_VALIDA_ESTADO.SCOB_SP_S_VAL_ESTADO_MULTA(TO_NUMBER(V_ID_MULTA),
                                                                     N_ID_MULTA_ESTADO, --NUEVO ESTADO
                                                                     0, --NUEVO MOTIVO
                                                                     PO_N_COD_ERROR,
                                                                     PO_V_MSJ_ERROR);
                    IF PO_N_COD_ERROR < 0 THEN
                        PO_N_RETORNO := PO_N_COD_ERROR;
                        ROLLBACK;
                        RETURN;
                    END IF;
                END IF;
            
                --OBTENER EL ID DEL USUARIO QUE ACTUALIZA LA INFORMACION
                SELECT USUARIO.ID_USUARIO
                  INTO N_ID_USUARIO_INGRESO
                  FROM T_SCOB_USUARIO USUARIO
                 WHERE UPPER(TRIM(USUARIO.USUARIO)) = UPPER(TRIM(PI_V_AUDUSUCREACION))
                   AND USUARIO.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO;
            
            SCOB_PK_MULTAS.SCOB_SP_I_MULTA_ESTADO(TO_NUMBER(V_ID_MULTA),
                                                      N_ID_MULTA_NIVEL,
                                                      N_ID_MULTA_ESTADO,
                                                      0,
                                                      TO_CHAR(SYSDATE, 'DD/MM/YYYY'),
                                                      PI_V_AUDUSUCREACION,
                                                      N_ID_USUARIO_INGRESO,
                                                      1,
                                                      N_ID_MULTA_ESTADO,
                                                      PO_N_COD_ERROR,
                                                      PO_V_MSJ_ERROR);
            
                --@0001:INI
                IF PO_N_COD_ERROR < 0 THEN
                    ROLLBACK;
                    RETURN;
                END IF;
                --@0001:FIN
            
                N_CONT := N_CONT + 1;
                
            --INICIO VICTOR BENDEZU - MIGRACION SICOB A SIA
            USR_SIA_INTFZ.PKG_INTFZ_REG_MULTA_SICOB_SIA.SP_I_ASIGNAR_MULTA_SICOB_A_SIA(PIN_NU_ID_MULTA => TO_NUMBER(V_ID_MULTA),
                                                                                       POUT_NU_COD_RESULT => PO_N_RETORNO,
                                                                                       POUT_VC_MSG_RESULT => PO_V_MSJ_ERROR);
            
            IF PO_N_RETORNO < 0 THEN              
               PO_N_COD_ERROR := PO_N_RETORNO;
               ROLLBACK;
               RETURN;   
            END IF;
            --FIN VICTOR BENDEZU - MIGRACION SICOB A SIA
        
            END LOOP;
        
        ELSIF PI_C_EVENTO = '2' THEN
            --VALIDAR MULTA
            UPDATE T_SCOB_MULTA_COBRANZA MCOB
               SET MCOB.ID_USUARIO_VALIDACION = NVL(PI_N_ID_USUARIO, NULL),
                   MCOB.FECHA_VALIDACION      = SYSDATE,
                   MCOB.AUDUSUMODIFICACION    = PI_V_AUDUSUCREACION,
                   MCOB.AUDFECMODIFICACION    = SYSDATE
             WHERE INSTR(PI_V_ID_MULTA, '|' || TO_CHAR(MCOB.ID_MULTA) || '|') > 0
               AND MCOB.FLG_ACTUAL = '1';
        END IF;
        PO_N_COD_ERROR := 0;
        PO_N_RETORNO   := PI_N_ID_USUARIO;
        COMMIT;
        ----
    EXCEPTION
        WHEN OTHERS THEN
            PO_N_RETORNO   := -1;
            PO_N_COD_ERROR := SQLCODE;
            SELECT CASE
                       WHEN PO_N_COD_ERROR > 0 THEN
                        PO_N_COD_ERROR * -1
                       ELSE
                        PO_N_COD_ERROR
                   END
              INTO PO_N_COD_ERROR
              FROM DUAL;
            PO_V_MSJ_ERROR := SUBSTR(SQLERRM, 1, 250);
            ROLLBACK;
    END;

    PROCEDURE SCOB_SP_S_MULTA_IMPROCEDENCIA
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 01.03.2011
        -- Proposito    : consulta las improcedencias registradas para una multa.
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_N_ID_MULTA IN T_SCOB_MULTA.ID_MULTA%TYPE,
     PI_C_IND_PEND IN CHAR, --1=muestra solo la pendiente;0=muestra todas
     PO_CU_RETORNO OUT CU_REC_SET) AS
    BEGIN
        OPEN PO_CU_RETORNO FOR
        
            SELECT MIMP.ID_MULTA_IMPROCEDENCIA AS COD_MULTA_IMPROCEDENCIA,
                   MULT.ANIO || MULT.CUM AS COD_UNICO_MULTA,
                   --
                   MCOB.NRO_INGRESO AS NRO_INGRESO,
                   MCOB.FECHA_INGRESO AS FE_INGRESO,
                   SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_ESTADO_MULTA, MULT.ESTADO_MULTA) AS NOM_ESTADO_AEC,
                   --
                   MIMP.NRO_IMPROCEDENCIA AS NRO_IMPROCEDENCIA,
                   MIMP.AUDFECCREACION    AS FEC_IMPROCEDENCIA,
                   MIMP.COD_MOTIVO        AS COD_MOTIVO,
                   MOTI.DESCRIPCION       AS NOM_MOTIVO,
                   MIMP.DES_MOTIVO        AS DES_MOTIVO, --COLUMNA: NOTA
                   MIMP.AUDUSUCREACION    AS USU_OBSERVA,
                   MDGE.NOMBRE            AS NOM_FORMATO,
                   ---
                   MIMP.FECHA_RESPUESTA AS FEC_RPTA,
                   MIMP.DES_RESPUESTA   AS DES_RPTA,
                   
                   SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_ESTADO_MULTA, MULT.ESTADO_MULTA) AS NOM_ESTADO_MULTA_COB            
              FROM T_SCOB_MULTA_COBRANZA MCOB
            
              LEFT JOIN T_SCOB_MULTA MULT
                ON MULT.ID_MULTA = MCOB.ID_MULTA
            
              LEFT JOIN T_SCOB_MULTA_IMPROCEDENCIA MIMP
                ON MIMP.ID_MULTA_COBRANZA = MCOB.ID_MULTA_COBRANZA
            
              LEFT JOIN T_SCOB_EST_MUL_COB_MOTIVO MOTI
                ON MOTI.ID_MOTIVO = MIMP.COD_MOTIVO
            
              LEFT JOIN T_SCOB_MULTA_DOCUMENTO_GEN MDGE
                ON MDGE.ID_MULTA_IMPROCEDENCIA = MIMP.ID_MULTA_IMPROCEDENCIA
               AND MDGE.ID_MULTA = MULT.ID_MULTA
            /*
            AND MDGE.TIPO_DOC_ASOC IN (
                 SCOB_PK_CONSTANTES.C_TIPO_DOC_ASOC_SISTEMA,
                 SCOB_PK_CONSTANTES.C_TIPO_DOC_ASOC_SISTEMA_ACT
            )
            */
             WHERE MULT.ID_MULTA = PI_N_ID_MULTA
               AND ((NVL(PI_C_IND_PEND, '0') = '0') OR (NVL(PI_C_IND_PEND, '0') <> '0' AND MIMP.FECHA_RESPUESTA IS NULL))
               AND MIMP.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
            
             ORDER BY MIMP.ID_MULTA_IMPROCEDENCIA DESC;
    
    END;

    PROCEDURE SCOB_SP_I_MULTA_IMPROCEDENCIA
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 01.03.2011
        -- Proposito    : inserta improcedencias
        -----------------------------------------------------------
        -- Modificaciones:
        --@0001:28.12.2012:Cambio para identificar el valor NULL en el campo ESTADO_MULTA
        -----------------------------------------------------------
        */
    (PI_N_ID_MULTA          IN T_SCOB_MULTA.ID_MULTA%TYPE,
     PI_N_ID_MULTA_DETAL    IN T_SCOB_MULTA_DETAL.ID_MULTA_DETAL%TYPE,
     PI_N_ID_MULTA_COBRANZA IN T_SCOB_MULTA_COBRANZA.ID_MULTA_COBRANZA%TYPE,
     PI_I_COD_ESTADO        IN T_SCOB_MULTA.ESTADO_MULTA%TYPE,
     PI_I_COD_MOTIVO        IN T_SCOB_MULTA_IMPROCEDENCIA.COD_MOTIVO%TYPE,
     PI_V_DES_MOTIVO        IN T_SCOB_MULTA_IMPROCEDENCIA.DES_MOTIVO%TYPE,
     PI_N_ID_PLANTILLA      IN T_SCOB_MULTA_IMPROCEDENCIA.ID_PLANTILLA%TYPE,
     PI_N_MOTIVO_PLANTILLA  IN T_SCOB_MULTA_DOCUMENTO_GEN.ID_MOTIVO_PLANTILLA%TYPE,
     --
     PI_N_ID_SERVICIO      IN NUMBER,
     PI_N_ID_TIPO_SERVICIO IN NUMBER,
     PI_C_FLG_UCI          IN CHAR,
     PI_C_FEC_GENERACION   IN CHAR,
     --
     PI_V_AUDUSUCREACION        IN T_SCOB_MULTA_IMPROCEDENCIA.AUDUSUCREACION%TYPE,
     PI_N_ID_USUARIO_INGRESO    IN T_SCOB_MULTA.ID_USUARIO_INGRESO%TYPE,
     PO_CU_RETORNO_ETIQUETA     OUT CU_REC_SET,
     PO_CU_RETORNO_VAL_ETIQUETA OUT CU_REC_SET,
     PO_N_RETORNO               OUT NUMBER,
     PO_N_COD_ERROR             OUT NUMBER,
     PO_V_MSJ_ERROR             OUT VARCHAR2) IS
        N_ID_MULTA_IMPROCEDENCIA  T_SCOB_MULTA_IMPROCEDENCIA.ID_MULTA_IMPROCEDENCIA%TYPE;
        V_NRO_IMPROCEDENCIA       T_SCOB_MULTA_IMPROCEDENCIA.NRO_IMPROCEDENCIA%TYPE;
        N_ID_MULTA_ESTADO         T_SCOB_MULTA.ESTADO_MULTA%TYPE;
        I_EXISTE                  INTEGER := 0;
        N_COD_GENERADOR_DOCUMENTO T_SCOB_MULTA_DOCUMENTO_GEN.COD_GENERADOR_DOCUMENTO%TYPE;
        V_MSJ_ERROR               VARCHAR(100);
    
        NU_VALIDA NUMBER := 0;
    BEGIN
        PO_N_RETORNO   := PI_N_ID_MULTA;
        PO_N_COD_ERROR := -1;
        PO_V_MSJ_ERROR := '';
        V_MSJ_ERROR    := NULL;
        
        -- INI TK76845@JCARRION
        SELECT COUNT(1)
          INTO NU_VALIDA
          FROM USR_SICOB.T_SCOB_TABLA_DET T
         WHERE T.ID_TABLA_DET = 1787
           AND T.ESTADO = '1'
           AND INSTR(T.TXT_VALOR1, '|' || PI_I_COD_ESTADO || '¬' || PI_I_COD_MOTIVO || '|') > 0;
        -- FIN TK76845@JCARRION
        
        IF NU_VALIDA = 0 THEN -- TK76845@JCARRION
            --verifica si existe alguna improcedencia sin responder        
            SELECT COUNT(MULT.ID_MULTA)
              INTO I_EXISTE
              FROM T_SCOB_MULTA MULT
             WHERE MULT.ID_MULTA = PI_N_ID_MULTA
               AND NVL(MULT.FLG_MULTA_IMPROCEDENCIA, '0') = '1';
        
            IF I_EXISTE > 0 THEN
                RAISE_APPLICATION_ERROR(-20002, 'No se puede realizar la acción. Actualmente, la multa presenta una improcedencia sin resolver.');
            END IF;
        END IF; -- TK76845@JCARRION
        
        
        /*COMENTADO 03.11.2011
        --verifica si en su registro actual tiene improcedencia insubsanable o infructuoso.
        SELECT COUNT(MCOB.ID_MULTA_COBRANZA)
        INTO I_EXISTE
        FROM T_SCOB_MULTA_COBRANZA MCOB
        INNER JOIN T_SCOB_MULTA MULT
              ON MULT.ID_MULTA = MCOB.ID_MULTA
        INNER JOIN T_SCOB_MULTA_IMPROCEDENCIA MIMP
              ON MIMP.ID_MULTA_COBRANZA = MCOB.ID_MULTA_COBRANZA
              AND MULT.ESTADO_MULTA IN (
                  SCOB_PK_CONSTANTES.C_TBL_EST_COB_INSUBSANABLE,
                  SCOB_PK_CONSTANTES.C_TBL_EST_COB_INFRUCTUOSO) --IMPROCEDENTE INSUBSABLE O INFRUCTUOSO
        WHERE MCOB.ID_MULTA = PI_N_ID_MULTA
        AND MCOB.FLG_ACTUAL = '1';
        
        IF I_EXISTE > 0 THEN
           raise_application_error (-20002,'No se puede realizar la acción. La multa se encuentra con estado INFRUCTUOSO o INSUBSANABLE.');
        END IF;
        */
    
        --VALIDA EL CAMBIO DE ESTADO:03.11.2011
        USR_SICOB.SCOB_PK_VALIDA_ESTADO.SCOB_SP_S_VAL_ESTADO_MULTA(PI_N_ID_MULTA,
                                                                   PI_I_COD_ESTADO, --NUEVO ESTADO
                                                                   PI_I_COD_MOTIVO, --NUEVO MOTIVO
                                                                   PO_N_COD_ERROR,
                                                                   PO_V_MSJ_ERROR);
        IF PO_N_COD_ERROR < 0 THEN
            PO_N_RETORNO := PO_N_COD_ERROR;
            RAISE_APPLICATION_ERROR(-20002, PO_V_MSJ_ERROR);
        END IF;
    
        --verificar si el usuario tiene otras multas con estado infrutuoso
        /*
        SELECT COUNT(MULT.ID_MULTA)
        INTO I_EXISTE
        FROM T_SCOB_MULTA MULT
        INNER JOIN T_SCOB_MULTA_DETAL MDET
              ON MDET.ID_MULTA = MULT.ID_MULTA
              AND MDET.FLG_ACTUAL = '1'
              AND MDET.ESTADO = '1'
        INNER JOIN T_SCOB_MULTA_SANCIONADO MSAN
              ON MSAN.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL
              AND NVL(MSAN.COD_TIPO_PERSONA,'1')='1'
              AND MSAN.ESTADO = '1'
              AND MSAN.ID_PERSONA IN (
                                    SELECT MSAN.ID_PERSONA
                                    FROM T_SCOB_MULTA MULT
                                    INNER JOIN T_SCOB_MULTA_DETAL MDET
                                          ON MDET.ID_MULTA = MULT.ID_MULTA
                                          AND MDET.FLG_ACTUAL = '1'
                                          AND MDET.ESTADO = '1'
                                    INNER JOIN T_SCOB_MULTA_SANCIONADO MSAN
                                          ON MSAN.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL
                                          AND NVL(MSAN.COD_TIPO_PERSONA,'1')='1'
                                          AND MSAN.ESTADO = '1'
                                    WHERE MULT.ID_MULTA = PI_N_ID_MULTA
              )
        WHERE MULT.ESTADO_MULTA IN (SCOB_PK_CONSTANTES.C_TBL_EST_COB_INFRUCTUOSO) --INFRUCTUOSO
        AND MULT.ESTADO = '1';
        
        IF I_EXISTE > 0 THEN
           v_msj_error := 'Se detectó que el o los sancionados de la multa presentan multas catalogadas como INFRUCTUOSAS.';
        END IF;
        */
    
        --genera el codigo secuencial de la improcedencia.
        SELECT SCOB_SQ_MULTA_IMPROCEDENCIA.NEXTVAL INTO N_ID_MULTA_IMPROCEDENCIA FROM DUAL;
    
        --generar el secuencial de improcedencia.
        V_NRO_IMPROCEDENCIA := '000'; --PARA INFRUCTUOSO O INSUBSANABLE
    
        IF PI_I_COD_ESTADO = SCOB_PK_CONSTANTES.C_TBL_EST_COB_SUBSANABLE THEN
            SELECT LPAD(NVL(MAX(MIMP.NRO_IMPROCEDENCIA), 0) + 1, 3, '000')
              INTO V_NRO_IMPROCEDENCIA
              FROM T_SCOB_MULTA_IMPROCEDENCIA MIMP
             INNER JOIN T_SCOB_MULTA_COBRANZA MCOB
                ON MCOB.ID_MULTA_COBRANZA = MIMP.ID_MULTA_COBRANZA
               AND MCOB.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
             WHERE MIMP.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
               AND MCOB.ID_MULTA = PI_N_ID_MULTA;
        END IF;
    
        --inserta el registro
        INSERT INTO T_SCOB_MULTA_IMPROCEDENCIA
            (ID_MULTA_IMPROCEDENCIA, NRO_IMPROCEDENCIA, COD_MOTIVO, DES_MOTIVO, ID_PLANTILLA, ESTADO, AUDFECCREACION, AUDUSUCREACION,
             ID_MULTA_COBRANZA, ESTADO_MULTA)
        VALUES
            (N_ID_MULTA_IMPROCEDENCIA, V_NRO_IMPROCEDENCIA, PI_I_COD_MOTIVO, PI_V_DES_MOTIVO, PI_N_ID_PLANTILLA, SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO,
             SYSDATE, PI_V_AUDUSUCREACION, PI_N_ID_MULTA_COBRANZA, PI_I_COD_ESTADO);
    
        --actualiza la fecha de la ultima improcedencia registrada
        UPDATE T_SCOB_MULTA MULT
           SET MULT.FEC_ULT_IMPROCEDENCIA = SYSDATE,
               MULT.NRO_ULT_IMPROCEDENCIA = V_NRO_IMPROCEDENCIA
         WHERE MULT.ID_MULTA = PI_N_ID_MULTA;
    
        --actualiza el estado actual de la multa.
        IF PI_I_COD_ESTADO = SCOB_PK_CONSTANTES.C_TBL_EST_COB_SUBSANABLE THEN
            BEGIN
                UPDATE T_SCOB_MULTA MULT
                   SET MULT.FLG_MULTA_COBRANZA      = '0',
                       MULT.FLG_MULTA_IMPROCEDENCIA = '1',
                       MULT.AUDUSUMODIFICACION      = PI_V_AUDUSUCREACION,
                       MULT.AUDFECMODIFICACION      = SYSDATE
                 WHERE MULT.ID_MULTA = PI_N_ID_MULTA;
            END;
        END IF;
    
        /*
        IF PI_I_COD_ESTADO = SCOB_PK_CONSTANTES.C_TBL_EST_COB_SUBSANABLE THEN
          BEGIN
            UPDATE T_SCOB_MULTA MULT
            SET
              MULT.FLG_ENVIO_RIESGO = PI_C_FLG_ENVIO_RIESGO,
              MULT.FEC_ENVIO_RIESGO = PI_V_FEC_ENVIO_RIESGO,
              MULT.FEC_INGRESO_ENVIO_RIESGO = SYSDATE,
              MULT.AUDUSUMODIFICACION = PI_V_AUDUSUCREACION,
              MULT.AUDFECMODIFICACION = SYSDATE
            WHERE MULT.ID_MULTA = PI_N_ID_MULTA;
          END;
        END IF;
        */
    
        --insertar logs de estados
        SCOB_PK_MULTAS.SCOB_SP_I_MULTA_ESTADO(PI_N_ID_MULTA,
                                              PI_N_ID_MULTA_DETAL,
                                              PI_I_COD_ESTADO,
                                              PI_I_COD_MOTIVO,
                                              TO_CHAR(SYSDATE, 'DD/MM/YYYY'),
                                              PI_V_AUDUSUCREACION,
                                              PI_N_ID_USUARIO_INGRESO,
                                              1,
                                              N_ID_MULTA_ESTADO,
                                              PO_N_COD_ERROR,
                                              PO_V_MSJ_ERROR);
    
        --@0001:INI
        IF PO_N_COD_ERROR < 0 THEN
            ROLLBACK;
            RETURN;
        END IF;
        --@0001:FIN
    
        --GENERACION DEL DOC
        SCOB_PK_GENERAR_DOCUMENTO.SCOB_SP_I_GENERA_DOC_MULTA(PI_N_ID_MULTA,
                                                             PI_N_ID_MULTA_DETAL,
                                                             N_ID_MULTA_IMPROCEDENCIA,
                                                             '|' || TO_CHAR(PI_N_ID_PLANTILLA) || '|',
                                                             '|' || TO_CHAR(PI_N_MOTIVO_PLANTILLA) || '|',
                                                             1, --PI_N_NRO_ITEMSP
                                                             PI_I_COD_ESTADO,
                                                             SCOB_PK_CONSTANTES.C_TIPO_DOC_ASOC_SISTEMA, --COD_TIPO_ASOC
                                                             PI_N_ID_SERVICIO,
                                                             PI_N_ID_TIPO_SERVICIO,
                                                             PI_C_FLG_UCI,
                                                             PI_C_FEC_GENERACION,
                                                             PI_V_AUDUSUCREACION,
                                                             PI_N_ID_USUARIO_INGRESO,
                                                             '0', --no commit
                                                             N_COD_GENERADOR_DOCUMENTO,
                                                             PO_N_COD_ERROR,
                                                             PO_V_MSJ_ERROR);
    
        --GENERACION DE DATOS PARA LAS ETIQUETAS
        SCOB_PK_GENERAR_DOCUMENTO.SCOB_SP_S_GEN_DOC_ETIQ_MULTA(N_COD_GENERADOR_DOCUMENTO, PO_CU_RETORNO_ETIQUETA, PO_CU_RETORNO_VAL_ETIQUETA);
    
        IF V_MSJ_ERROR IS NOT NULL THEN
            PO_V_MSJ_ERROR := V_MSJ_ERROR;
        END IF;
    
        PO_N_COD_ERROR := 0;
        PO_N_RETORNO   := N_COD_GENERADOR_DOCUMENTO;
    
        COMMIT;
        --rollback;
    
    EXCEPTION
        WHEN OTHERS THEN
        
            IF SQLCODE = -20002 THEN
                IF PO_V_MSJ_ERROR IS NULL THEN
                    PO_V_MSJ_ERROR := SUBSTR(SQLERRM, 11, 400); --14.12.2011
                END IF;
            
                PO_N_RETORNO := -1;
            
                OPEN PO_CU_RETORNO_ETIQUETA FOR
                    SELECT NULL AS NRO_ETIQUETA,
                           NULL AS NOM_ETIQUETA
                      FROM DUAL;
            
                OPEN PO_CU_RETORNO_VAL_ETIQUETA FOR
                    SELECT NULL AS NOM_ARCH_PLANTILLA,
                           NULL AS NOM_ARCH_A_GENERAR,
                           NULL AS FEC_GENERACION_DOC,
                           NULL AS NRO_DOCUMENTO,
                           NULL AS SIGLA_AEC,
                           NULL AS IMPORTE_UIT,
                           NULL AS NOM_SANCIONADO_TODOS,
                           NULL AS NOM_CARGO_JEFE_AEC,
                           NULL AS NOM_SECRETARIO_TEC,
                           NULL AS NOM_CARGO_SECRETARIO_TEC,
                           NULL AS NOM_OR_MULTA,
                           NULL AS NOM_JEFE_AEC,
                           NULL AS NRO_FILE,
                           NULL AS SIGLA_NOM_JEFE_AEC,
                           NULL AS NRO_CUM,
                           NULL AS NRO_SEC,
                           NULL AS NRO_RESOLUCION_OR,
                           NULL AS NRO_EXPED_ADMIN_MULTA,
                           NULL AS SIGLA_NOM_USUARIO_GEN_DOC,
                           NULL AS AEC_ANEXO_TELEFONO,
                           NULL AS AEC_NOMBRE,
                           NULL AS AEC_TELEFONO,
                           NULL AS NRO_EXPED_ANTIGUO_MULTA,
                           NULL AS VALOR_UIT,
                           NULL AS NRO_EXPED_INFRUCTUOSO
                      FROM DUAL;
                RETURN;
            END IF;
        
            PO_N_RETORNO   := -1;
            PO_N_COD_ERROR := SQLCODE;
            SELECT CASE
                       WHEN PO_N_COD_ERROR > 0 THEN
                        PO_N_COD_ERROR * -1
                       ELSE
                        PO_N_COD_ERROR
                   END
              INTO PO_N_COD_ERROR
              FROM DUAL;
            --po_v_msj_error := substr(sqlerrm,1,250);
        
            IF PO_V_MSJ_ERROR IS NULL THEN
                PO_V_MSJ_ERROR := SUBSTR(SQLERRM, 11, 400); --14.12.2011
            END IF;
        
            ROLLBACK;
    END;

    PROCEDURE SCOB_SP_U_MULTA_IMPROCEDENCIA
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 23.03.2011
        -- Proposito    : actualiza improcedencias
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_N_ID_MULTA               IN T_SCOB_MULTA.ID_MULTA%TYPE,
     PI_N_ID_MULTA_DETAL         IN T_SCOB_MULTA_DETAL.ID_MULTA_DETAL%TYPE,
     PI_N_ID_MULTA_IMPROCEDENCIA IN T_SCOB_MULTA_IMPROCEDENCIA.ID_MULTA_IMPROCEDENCIA%TYPE,
     PI_V_DES_RESPUESTA          IN T_SCOB_MULTA_IMPROCEDENCIA.DES_RESPUESTA%TYPE,
     PI_N_ID_USUARIO_RPTA        IN T_SCOB_USUARIO.ID_USUARIO%TYPE,
     PI_V_AUDUSUMODIFICACION     IN T_SCOB_MULTA_IMPROCEDENCIA.AUDUSUMODIFICACION%TYPE,
     
     PO_N_RETORNO   OUT NUMBER,
     PO_N_COD_ERROR OUT NUMBER,
     PO_V_MSJ_ERROR OUT VARCHAR2) IS
        --  N_ID_MULTA_ESTADO                      NUMBER;
        --  N_ID_USUARIO_INGRESO                   T_SCOB_MULTA_DETAL.ID_USUARIO_ULT_ESTADO%TYPE;
    
    BEGIN
        PO_N_RETORNO   := 0;
        PO_N_COD_ERROR := -1;
        PO_V_MSJ_ERROR := '';
    
        UPDATE T_SCOB_MULTA_IMPROCEDENCIA
           SET DES_RESPUESTA                 = PI_V_DES_RESPUESTA,
               FECHA_RESPUESTA               = SYSDATE,
               AUDFECMODIFICACION            = SYSDATE,
               AUDUSUMODIFICACION            = PI_V_AUDUSUMODIFICACION,
               ID_USUARIO_RPTA_IMPROCEDENCIA = PI_N_ID_USUARIO_RPTA
         WHERE ID_MULTA_IMPROCEDENCIA = PI_N_ID_MULTA_IMPROCEDENCIA;
    
        --actualiza el estado de la multa a NO INICIADO, del area de COBRANZA.
        /*
        UPDATE T_SCOB_MULTA
        SET
          --FLG_MULTA_IMPROCEDENCIA = '0',
          --FLG_MULTA_COBRANZA = '1',
          AUDUSUMODIFICACION = PI_V_AUDUSUMODIFICACION,
          AUDFECMODIFICACION = SYSDATE
        WHERE T_SCOB_MULTA.ID_MULTA = PI_N_ID_MULTA;
        
        
        --insertar logs de estados
        --OBTENER EL ID DEL USUARIO QUE ACTUALIZA LA INFORMACION
        SELECT USUARIO.ID_USUARIO
        INTO N_ID_USUARIO_INGRESO
        FROM T_SCOB_USUARIO USUARIO
        WHERE UPPER(TRIM(USUARIO.USUARIO)) = UPPER(TRIM(PI_V_AUDUSUMODIFICACION))
        AND USUARIO.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO;
        
        SCOB_PK_MULTAS.SCOB_SP_I_MULTA_ESTADO(
          PI_N_ID_MULTA,
          PI_N_ID_MULTA_DETAL,
          SCOB_PK_CONSTANTES.C_TBL_EST_MUL_NO_INICIADO,
          0,
          TO_CHAR(SYSDATE,'DD/MM/YYYY'),
          PI_V_AUDUSUMODIFICACION,
          N_ID_USUARIO_INGRESO,
          1,
          N_ID_MULTA_ESTADO,
          PO_N_COD_ERROR,
          PO_V_MSJ_ERROR);
        
        */
    
        PO_N_COD_ERROR := 0;
        PO_N_RETORNO   := PI_N_ID_MULTA;
        COMMIT;
        ----
    EXCEPTION
        WHEN OTHERS THEN
            PO_N_RETORNO   := -1;
            PO_N_COD_ERROR := SQLCODE;
            SELECT CASE
                       WHEN PO_N_COD_ERROR > 0 THEN
                        PO_N_COD_ERROR * -1
                       ELSE
                        PO_N_COD_ERROR
                   END
              INTO PO_N_COD_ERROR
              FROM DUAL;
            PO_V_MSJ_ERROR := SUBSTR(SQLERRM, 1, 250);
            ROLLBACK;
    END;

    PROCEDURE SCOB_SP_U_MULTA_CENTRAL_RIESGO
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 14.07.2011
        -- Proposito    : ACTUALIZAR ENVIO A CENTRAL DE RIESGOS
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_N_ID_MULTA           IN T_SCOB_MULTA.ID_MULTA%TYPE,
     PI_C_FLG_ENVIO_RIESGO   IN T_SCOB_MULTA.FLG_ENVIO_RIESGO%TYPE,
     PI_V_AUDUSUMODIFICACION IN T_SCOB_MULTA.AUDUSUMODIFICACION%TYPE,
     PO_N_RETORNO            OUT NUMBER,
     PO_N_COD_ERROR          OUT NUMBER,
     PO_V_MSJ_ERROR          OUT VARCHAR2) IS
    BEGIN
        PO_N_RETORNO   := 0;
        PO_N_COD_ERROR := 0;
        PO_V_MSJ_ERROR := '';
    
        UPDATE T_SCOB_MULTA
           SET FLG_ENVIO_RIESGO         = PI_C_FLG_ENVIO_RIESGO,
               FEC_ENVIO_RIESGO         = SYSDATE,
               FEC_INGRESO_ENVIO_RIESGO = SYSDATE,
               AUDFECMODIFICACION       = SYSDATE,
               AUDUSUMODIFICACION       = PI_V_AUDUSUMODIFICACION
         WHERE ID_MULTA = PI_N_ID_MULTA;
    
        PO_N_RETORNO := PI_N_ID_MULTA;
        COMMIT;
        ----
    EXCEPTION
        WHEN OTHERS THEN
            PO_N_RETORNO   := -1;
            PO_N_COD_ERROR := SQLCODE;
            SELECT CASE
                       WHEN PO_N_COD_ERROR > 0 THEN
                        PO_N_COD_ERROR * -1
                       ELSE
                        PO_N_COD_ERROR
                   END
              INTO PO_N_COD_ERROR
              FROM DUAL;
            PO_V_MSJ_ERROR := SUBSTR(SQLERRM, 1, 250);
            ROLLBACK;
    END;

    PROCEDURE SCOB_SP_S_MULTA_BY_ID(PI_N_ID_MULTA IN NUMBER,
                                    PO_CU_RETORNO OUT CU_REC_SET
                                    
                                    ) AS
    BEGIN
        OPEN PO_CU_RETORNO FOR
        
            SELECT DISTINCT MULT.ID_MULTA AS ID_MULTA,
                            MDET.ID_MULTA_DETAL AS ID_MULTA_DETAL,
                            NVL(MCOB.ID_MULTA_COBRANZA, 0) AS ID_MULTA_COBRANZA,
                            NVL(MULT.FLG_MULTA_COBRANZA, '0') AS IND_COBRANZA,
                            NVL(MULT.FLG_MULTA_IMPROCEDENCIA, '0') AS IND_IMPROCEDENCIA,
                            ---
                            ORGR.TIPO_INSTANCIA AS TIPO_INSTANCIA_ACTUAL,
                            MULT.ANIO || MULT.CUM AS COD_MULTA,
                            MDET.ID_ORGANO_RESOLUTIVO AS COD_ORG_RESOLUTIVO,
                            ORGR.DESCRIPCION AS NOM_ORG_RESOLUTIVO,
                            MCOB.FECHA_VALIDACION AS FEC_VALIDACION,
                            IMPRO.NRO_IMPROCEDENCIA AS NRO_IMPROCEDENCIA,
                            DECODE(NVL(IMPRO.NRO_IMPROCEDENCIA, '0'), '0', 'NO', 'SI') AS NOM_IND_IMPROCEDENCIA,
                            MCOB.NRO_INGRESO AS NRO_INGRESO_AEC,
                            MCOB.FECHA_INGRESO AS FEC_INGRESO_AEC,
                            MULT.ID_MATERIA AS COD_MATERIA,
                            MATE.DESCRIPCION AS NOM_MATERIA,
                            MDET.NRO_RESOLUCION AS NRO_RESOLUCION,
                            MDET.FEC_RESOLUCION AS FEC_RESOLUCION,
                            DECODE(MULT.FLG_TIPO_MULTA, SCOB_PK_CONSTANTES.C_FLG_TIPO_MULTA_SOLID, ' ', PERS.COD_SANCIONADO) AS COD_SANCIONADO,
                            DECODE(MULT.FLG_TIPO_MULTA,
                                   SCOB_PK_CONSTANTES.C_FLG_TIPO_MULTA_SOLID,
                                   SCOB_PK_EXPEDIENTE.SCOB_FN_SANCIONADOS_MULTA(MULT.ID_MULTA, 0),
                                   DECODE(PERS.TIPO_PERSONA,
                                          SCOB_PK_CONSTANTES.C_TIPO_PERS_JURIDICA,
                                          PERS.RAZON_SOCIAL,
                                          PERS.APE_PATERNO || ' ' || PERS.APE_MATERNO || ' ' || PERS.PRI_NOMBRE || ' ' || PERS.SEG_NOMBRE || ' ' ||
                                          PERS.APE_CASADA)) AS DES_SANCIONADO,
                            
                            --DATOS ANTIDUMPING
                            DECODE(NVL(MUAN.NRO_LIQUIDACION_CODIGO, ' '),
                                   ' ',
                                   NULL,
                                   MUAN.NRO_LIQUIDACION_CODIGO || '-' || MUAN.NRO_LIQUIDACION_ANIO || '/' || MUAN.NRO_LIQUIDACION_CORRELATIVO) AS NRO_LIQUIDACION,
                            MUAN.TIPO_CAMBIO AS TIPO_CAMBIO,
                            MUAN.MONTO_ANTIDUMPING AS MONTO_ANTIDUMPING,
                            MUAN.MONTO_INTERES AS MONTO_DA_INTERES_COMPENSATORIO,
                            MUAN.MONTO_INTERES_MORATORIO AS MONTO_DA_INTERES_MORATORIO,
                            --FIN DATOS ANTIDUMPING
                            
                            MDET.VALOR_UIT        AS UIT,
                            MULT.MONTO_UIT        AS MONTO_UIT,
                            MULT.TOTAL_AMORTIZADO AS MONTO_AMORTIZACION,
                            MULT.SALDO            AS MONTO_SALDO,
                            
                            VALI.USUARIO AS NOM_VALIDADO_POR,
                            ASIG.USUARIO AS NOM_ASIGNADO_A,
                            MULT.FECHA_ASIG_COBRANZA AS FEC_ASIGNADO_A,
                            MULT.ESTADO_MULTA AS COD_ESTADO,
                            SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_ESTADO_MULTA, MULT.ESTADO_MULTA) AS DES_ESTADO,
                            LTRIM(RTRIM(MULT.FLG_TIPO_MULTA)) AS IND_RESPONSABILIDAD,
                            MRES.TXT_DESCRIPCION AS DES_RESPONSABILIDAD,
                            MDET.FEC_NOTIFICACION_RESOLUCION AS FEC_NOTIF,
                            MIMP.COD_MOTIVO AS COD_MOTIVO,
                            MOTI.DESCRIPCION AS NOM_MOTIVO,
                            MIMP.AUDUSUCREACION AS NOM_OBSERVADO_POR,
                            MULT.COD_ESTADO_PAGO AS COD_ESTADO_PAGO,
                            SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_EST_PAGOS, MULT.COD_ESTADO_PAGO) AS NOM_ESTADO_PAGO,
                            ' ' AS VER_MEMO, --FALTA VER PAGOS!!! NO MEMO. 31.05.2011
                            MULT.FLG_ENVIO_RIESGO AS FLG_ENVIO_RIESGO,
                            MULT.FEC_ENVIO_RIESGO AS FEC_ENVIO_RIESGO,
                            MULT.FLG_MULTA_RESOLUTIVO AS IND_TIPO_MULTA, --1=MULTA OR;0=ANTIDUMPING
                            MULT.FEC_GENERACION_SEC AS FEC_GENERACION_SEC, --NVO
                            MULT.NRO_FILE_AEC AS NRO_FILE,
                            MULT.ANIO_FILE_AEC AS ANIO_FILE
            
              FROM T_SCOB_MULTA MULT
            
              LEFT JOIN (SELECT IMPRO.ID_MULTA AS ID_MULTA,
                                LPAD(MAX(TO_NUMBER(IMPRO.NRO_IMPROCEDENCIA)), 3, '000') AS NRO_IMPROCEDENCIA
                           FROM (SELECT MCOB.ID_MULTA          AS,
                                        MIMP.NRO_IMPROCEDENCIA AS NRO_IMPROCEDENCIA
                                   FROM T_SCOB_MULTA_IMPROCEDENCIA MIMP
                                  INNER JOIN T_SCOB_MULTA_COBRANZA MCOB
                                     ON MCOB.ID_MULTA_COBRANZA = MIMP.ID_MULTA_COBRANZA) IMPRO
                          GROUP BY IMPRO.ID_MULTA) IMPRO
                ON IMPRO.ID_MULTA = MULT.ID_MULTA
            
             INNER JOIN T_SCOB_MULTA_DETAL MDET
                ON MDET.ID_MULTA = MULT.ID_MULTA
               AND MDET.FLG_ACTUAL = '1'
            
              LEFT JOIN T_SCOB_MULTA_ANTIDUMPING MUAN
                ON MUAN.ID_MULTA = MULT.ID_MULTA
            
              LEFT JOIN T_SCOB_MULTA_COBRANZA MCOB
                ON MCOB.ID_MULTA = MULT.ID_MULTA
               AND MCOB.FLG_ACTUAL = '1'
               AND MCOB.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
            
              LEFT JOIN T_SCOB_MULTA_IMPROCEDENCIA MIMP
                ON MIMP.ID_MULTA_COBRANZA = MCOB.ID_MULTA_COBRANZA
            
              LEFT JOIN T_SCOB_EST_MUL_COB_MOTIVO MOTI
                ON MOTI.ID_MOTIVO = MIMP.COD_MOTIVO
            
             INNER JOIN T_SCOB_ORGANO_RESOLUTIVO ORGR
                ON ORGR.ID_ORGANO_RESOLUTIVO = MDET.ID_ORGANO_RESOLUTIVO
            
             INNER JOIN T_SCOB_MATERIA MATE
                ON MATE.ID_MATERIA = MULT.ID_MATERIA
            
             INNER JOIN T_SCOB_MULTA_SANCIONADO SANC
                ON SANC.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL
               AND SANC.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
               AND NVL(SANC.COD_TIPO_PERSONA, '1') = '1'
            
             INNER JOIN T_SCOB_PERSONA PERS
                ON PERS.ID_PERSONA = SANC.ID_PERSONA
               AND PERS.COD_SANCIONADO IS NOT NULL
            
              LEFT JOIN T_SCOB_PERSONA_DOMICILIO PDOM
                ON PDOM.ID_PERSONA = PERS.ID_PERSONA
               AND PDOM.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
            
              LEFT JOIN T_SCOB_MULTA_SANCIONADO_DIREC SDIR
                ON SDIR.ID_MULTA_SANCIONADO = SANC.ID_MULTA_SANCIONADO
               AND SDIR.ID_PERSONA_DOMICILIO = PDOM.ID_PERSONA_DOMICILIO
               AND SDIR.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
            
             INNER JOIN T_SCOB_TABLA_DET MRES --TIPO DE MULTA (SOLIDARIA?).
                ON MRES.ID_TABLA = SCOB_PK_CONSTANTES.C_TBL_TIPO_RESP_MULTA_OR
               AND LTRIM(RTRIM(MRES.COD_INTERNO)) = LTRIM(RTRIM(MULT.FLG_TIPO_MULTA))
            
              LEFT JOIN T_SCOB_UBIGEO UBIG
                ON UBIG.ID_UBIGEO = PDOM.ID_UBIGEO
            
              LEFT JOIN T_SCOB_USUARIO ASIG
                ON ASIG.ID_USUARIO = MULT.ID_USUARIO_ASIG_COBRANZA
            
              LEFT JOIN T_SCOB_USUARIO VALI
                ON VALI.ID_USUARIO = MCOB.ID_USUARIO_VALIDACION
            
             WHERE MULT.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
               AND MULT.ID_MULTA = PI_N_ID_MULTA
            
            ;
    END;
    ----

    PROCEDURE SCOB_SP_U_ASIGNAR_MASIVO(IN_AR_VC_CUM         IN STR_ARRAY,
                                       IN_ID_USUARIO_AEC    IN VARCHAR2,
                                       IN_VC_AUDUSUMODIFICA IN VARCHAR2,
                                       PO_N_RETORNO         OUT NUMBER,
                                       PO_V_MSJ_ERROR       OUT VARCHAR2) IS
    BEGIN
    
        FOR I IN 1 .. IN_AR_VC_CUM.COUNT
        LOOP
        
            UPDATE USR_SICOB.T_SCOB_MULTA T
               SET T.ID_USUARIO_ASIG_COBRANZA = IN_ID_USUARIO_AEC,
                   T.ESTADO_MULTA             = SCOB_PK_CONSTANTES.C_TBL_EST_COB_TRAMITE_COB
             WHERE T.ANIO || T.CUM IN (IN_AR_VC_CUM(I));
        
        END LOOP;
    
        COMMIT;
        PO_N_RETORNO   := 0;
        PO_V_MSJ_ERROR := '';
    
    EXCEPTION
        WHEN OTHERS THEN
            PO_N_RETORNO := SQLCODE;
            SELECT CASE
                       WHEN PO_N_RETORNO > 0 THEN
                        PO_N_RETORNO * -1
                       ELSE
                        PO_N_RETORNO
                   END
              INTO PO_N_RETORNO
              FROM DUAL;
        
            ROLLBACK;
            PO_N_RETORNO   := SQLCODE;
            PO_V_MSJ_ERROR := SQLERRM;
    END SCOB_SP_U_ASIGNAR_MASIVO;
    
    PROCEDURE SCOB_SP_S_COMBOS_MULTA_CERO
    /*
    -----------------------------------------------------------
    -- Autor        : HCHALCO
    -- Creado       : 05.08.2021
    -- Proposito    : Listar tipo multas de exp para la págiana multa cero
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    : 
    -----------------------------------------------------------
    */
    (
      PI_VC_NOM_COMBO         VARCHAR2,
      PI_NU_ID_ESTADO_MULTA   NUMBER,
      PO_CU_RETORNO            out CU_REC_SET
    )
    AS
    BEGIN
      IF PI_VC_NOM_COMBO = 'tipoMulta' THEN 
        OPEN  PO_CU_RETORNO for
        SELECT T.COD_INTERNO AS ID, T.TXT_DESCRIPCION AS DESCRIPCION
          FROM USR_SICOB.T_SCOB_TABLA_DET T
         WHERE T.ID_TABLA = 85
           AND T.ESTADO = 1;
        
      ELSIF PI_VC_NOM_COMBO = 'estadoMulta' THEN
          OPEN  PO_CU_RETORNO for
          SELECT T.COD_INTERNO AS ID, T.TXT_DESCRIPCION AS  DESCRIPCION
          FROM USR_SICOB.T_SCOB_TABLA_DET T 
          WHERE ID_TABLA=5 AND T.COD_INTERNO IN (11,12,13); 
          
      ELSIF PI_VC_NOM_COMBO = 'motivoMulta' THEN
          OPEN  PO_CU_RETORNO for
          SELECT t.id_motivo AS ID, t.descripcion AS DESCRIPCION 
          FROM USR_SICOB.T_SCOB_EST_MUL_COB_MOTIVO T 
          WHERE T.ID_EST_MUL_COB=PI_NU_ID_ESTADO_MULTA AND T.ESTADO=1;
          
      END IF;
      

  END;
  
/*****************************************************************
'* Nombre           :  SCOB_SP_I_MULTA_CERO
'* Parámetros       :  PI_VC_CUM: Numero CUM  de la multa
'*                     PI_NU_TIPO_MULTA: Id del tipo de Multa
'*                     PI_NU_ESTADO_MULTA: Id del estado de la multa a crear
'*                     PI_NU_MOTIVO_MULTA: Id del motivo de la multa a crear
'*                     PI_DT_FECHA_ESTADO: Fecha del estado de la multa
                       PI_VC_USUARIO_LOGIN: Usuario que realiza la multa cero
'* Propósito        :  Generar multa cero
'* Output           :  PO_NU_RETORNO: 1: Ok
'*                     PO_NU_COD_ERROR : Codigo 0: Grabo OK
'*                     PO_VC_MSJ_ERROR : Mensaje
'* Creado por       :  HCHALCO
'* Fec Creación     :  2021-08-05 17:06:00
'* Fec Actualización:  2023-02-03 18:56:00 se agrega llamada para ejecucion de proceso en linea para el SIA
'****************************************************************/
  PROCEDURE SCOB_SP_I_MULTA_CERO   
    (
      PI_VC_CUM   IN VARCHAR2,
      PI_NU_TIPO_MULTA         IN NUMBER,
      PI_NU_ESTADO_MULTA         IN NUMBER,
      PI_NU_MOTIVO_MULTA         IN NUMBER,
      PI_DT_FECHA_ESTADO       IN VARCHAR2,
      PI_VC_USUARIO_LOGIN      IN VARCHAR2,
      
      PO_NU_RETORNO            OUT NUMBER,
      PO_NU_COD_ERROR          OUT NUMBER,
      PO_VC_MSJ_ERROR          OUT VARCHAR2
    )
    AS
      V_NU_ID_MULTA NUMBER;
      V_NU_ID_MULTA_DETAL NUMBER;
      V_NU_EXISTE  NUMBER;
      V_COD_INTERNO VARCHAR2(20);
    BEGIN
      DBMS_OUTPUT.PUT_LINE('SCOB_SP_I_MULTA_CERO>>');
      -- MULTA CERO PARA EXPEDIENTE - PODER JUDICIAL
      SELECT MU.ID_MULTA INTO V_NU_ID_MULTA
      FROM USR_SICOB.T_SCOB_MULTA MU
      WHERE MU.ANIO || MU.CUM = PI_VC_CUM
      AND MU.Estado = 1;
      DBMS_OUTPUT.PUT_LINE('SCOB_SP_I_MULTA_CERO>>PI_VC_CUM>>' || PI_VC_CUM);
      SELECT COUNT(MU.ID_MULTA) INTO V_NU_EXISTE
        FROM USR_SICOB.T_SCOB_MULTA MU
       INNER JOIN USR_SICOB.T_SCOB_MULTA_ESTADO ME
          ON (MU.ID_MULTA = ME.ID_MULTA)
       WHERE MU.ID_MULTA = V_NU_ID_MULTA
         AND ME.ESTADO = 1
         AND ME.NU_ID_TIPO_MULTAC IN (1, 2);
      DBMS_OUTPUT.PUT_LINE('SCOB_SP_I_MULTA_CERO>>V_NU_EXISTE>>' || V_NU_EXISTE);   
     --Evaluamos si la multa ya tiene  registrado Multa Cero
     IF V_NU_EXISTE>0 THEN
          PO_NU_COD_ERROR := 0;
          PO_NU_RETORNO   := 2;
          PO_VC_MSJ_ERROR := 'Esta multa ya tiene registrado una Multa Cero';
     ELSE
       BEGIN
         -- UPDATE DE MONTOS MULTA CERO
         -- INSERTS
         UPDATE USR_SICOB.T_SCOB_MULTA
            SET MONTO_UIT                = 0,
                MONTO_COSTAS             = 0,
                MONTO_TOTAL_DEUDA        = 0,
                TOTAL_AMORTIZADO         = 0,
                TOTAL_AMORTIZADO_COSTAS  = 0,
                TOTAL_AMORTIZACION_DEUDA = 0,
                SALDO                    = 0,
                SALDO_COSTAS             = 0,
                SALDO_TOTAL_DEUDA        = 0,
                COD_ESTADO_PAGO          = 3,
                AUDUSUMODIFICACION       = PI_VC_USUARIO_LOGIN,
                AUDFECMODIFICACION       = SYSDATE
          WHERE ID_MULTA = V_NU_ID_MULTA;
          DBMS_OUTPUT.PUT_LINE('SCOB_SP_I_MULTA_CERO>>U T_SCOB_MULTA');   
         UPDATE USR_SICOB.T_SCOB_MULTA_DETAL
            SET VALOR_UIT          = 0,
                MONTO_UIT          = 0,
                AUDUSUMODIFICACION = PI_VC_USUARIO_LOGIN,
                AUDFECMODIFICACION = SYSDATE
          WHERE ESTADO = 1
            AND FLG_ACTUAL = 1
            AND ID_MULTA = V_NU_ID_MULTA;
         DBMS_OUTPUT.PUT_LINE('SCOB_SP_I_MULTA_CERO>>U T_SCOB_MULTA_DETAL'); 
         SELECT MD.ID_MULTA_DETAL INTO V_NU_ID_MULTA_DETAL
           FROM USR_SICOB.T_SCOB_MULTA_DETAL MD
          WHERE MD.ID_MULTA = V_NU_ID_MULTA
            AND MD.ESTADO = 1
            AND MD.FLG_ACTUAL = 1;
        DBMS_OUTPUT.PUT_LINE('SCOB_SP_I_MULTA_CERO>>V_NU_ID_MULTA_DETAL>>' || V_NU_ID_MULTA_DETAL); 
        
         -- INSERT ESTADO DE MULTA COBRANZA
         /*DBMS_OUTPUT.PUT_LINE('SCOB_SP_I_MULTA_CERO>>V_NU_ID_MULTA>>' || V_NU_ID_MULTA); 
         DBMS_OUTPUT.PUT_LINE('SCOB_SP_I_MULTA_CERO>>V_NU_ID_MULTA_DETAL>>' || V_NU_ID_MULTA_DETAL); 
         DBMS_OUTPUT.PUT_LINE('SCOB_SP_I_MULTA_CERO>>PI_NU_ESTADO_MULTA>>' || PI_NU_ESTADO_MULTA); 
         DBMS_OUTPUT.PUT_LINE('SCOB_SP_I_MULTA_CERO>>PI_VC_USUARIO_LOGIN>>' || PI_VC_USUARIO_LOGIN); 
         DBMS_OUTPUT.PUT_LINE('SCOB_SP_I_MULTA_CERO>>PI_DT_FECHA_ESTADO>>' || PI_DT_FECHA_ESTADO); 
         DBMS_OUTPUT.PUT_LINE('SCOB_SP_I_MULTA_CERO>>PI_NU_MOTIVO_MULTA>>' || PI_NU_MOTIVO_MULTA); 
         DBMS_OUTPUT.PUT_LINE('SCOB_SP_I_MULTA_CERO>>PI_NU_TIPO_MULTA>>' || PI_NU_TIPO_MULTA); */
         INSERT INTO USR_SICOB.T_SCOB_MULTA_ESTADO
           (ID_MULTA_ESTADO,
            ID_MULTA,
            ID_MULTA_DETAL,
            ESTADO_MULTA,
            ESTADO,
            AUDFECCREACION,
            AUDUSUCREACION,
            FEC_ESTADO_MULTA,
            COD_MOTIVO,
            NU_ID_TIPO_MULTAC)
         VALUES
           (USR_SICOB.SCOB_SQ_MULTA_ESTADO.NEXTVAL,
            V_NU_ID_MULTA,
            V_NU_ID_MULTA_DETAL,
            PI_NU_ESTADO_MULTA,
            '1',
            SYSDATE,
            PI_VC_USUARIO_LOGIN,
            TO_DATE(PI_DT_FECHA_ESTADO, 'DD/MM/YYYY'),
            PI_NU_MOTIVO_MULTA,
            PI_NU_TIPO_MULTA
            );
            --DBMS_OUTPUT.PUT_LINE('SCOB_SP_I_MULTA_CERO>>PI_NU_ESTADO_MULTA>>' || PI_NU_ESTADO_MULTA); 
          UPDATE USR_SICOB.T_SCOB_MULTA MULT
             SET MULT.ESTADO_MULTA     = PI_NU_ESTADO_MULTA,
                 MULT.FEC_ESTADO_MULTA = TO_DATE(PI_DT_FECHA_ESTADO,'DD/MM/YYYY'),
                 COD_MOTIVO            = PI_NU_MOTIVO_MULTA
           WHERE MULT.ID_MULTA = V_NU_ID_MULTA;
        
         --DBMS_OUTPUT.PUT_LINE('SCOB_SP_I_MULTA_CERO>>V_NU_ID_MULTA>>' || V_NU_ID_MULTA);
         
         --INICIO VICTOR BENDEZU - MIGRACION SICOB A SIA
          USR_SIA_INTFZ.PKG_INTFZ_REG_MULTA_SICOB_SIA.SP_U_MULTA_SICOB_A_SIA(PIN_NU_ID_MULTA => V_NU_ID_MULTA,
                                                                             POUT_NU_COD_RESULT => PO_NU_RETORNO,
                                                                             POUT_VC_MSG_RESULT => PO_VC_MSJ_ERROR);
                  
          IF PO_NU_RETORNO < 0 THEN
             ROLLBACK;
             RETURN;
          END IF;
          --FIN VICTOR BENDEZU - MIGRACION SICOB A SIA
            
          PO_NU_COD_ERROR := 0;
          PO_NU_RETORNO   := 1;
       END;
     END IF;
     
   EXCEPTION
    WHEN OTHERS THEN
      PO_NU_RETORNO   := -1;
      PO_NU_COD_ERROR := SQLCODE;
      SELECT CASE
               WHEN PO_NU_COD_ERROR > 0 THEN
                PO_NU_COD_ERROR * -1
               ELSE
                PO_NU_COD_ERROR
             END
        INTO PO_NU_COD_ERROR
        FROM DUAL;
      PO_VC_MSJ_ERROR := SUBSTR(SQLERRM, 1, 250);
      ROLLBACK;
   END;
   
   PROCEDURE SCOB_SP_S_MULTA_CERO
    /*
        -----------------------------------------------------------
        -- Autor        : HCHALCO
        -- Creado       : 10.08.2021
        -- Proposito    : Consulta para Multa CERO
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_V_CUM               IN VARCHAR2,
     PO_CU_RETORNO          OUT CU_REC_SET
     
     ) AS
    BEGIN 
       
        OPEN PO_CU_RETORNO FOR
            SELECT DISTINCT '0' AS SEM_ASIG_MULTA,
                            MULT.FEC_ESTADO_MULTA AS FEC_ULT_ESTADO_MULTA,
                            MULT.ID_MULTA AS ID_MULTA,
                            MDET.ID_MULTA_DETAL AS ID_MULTA_DETAL,
                            NVL(MCOB.ID_MULTA_COBRANZA, 0) AS ID_MULTA_COBRANZA,
                            NVL(MULT.FLG_MULTA_COBRANZA, '0') AS IND_COBRANZA,
                            NVL(MULT.FLG_MULTA_IMPROCEDENCIA, '0') AS IND_IMPROCEDENCIA,
                            ---
                            ORGR.TIPO_INSTANCIA AS TIPO_INSTANCIA_ACTUAL,
                            MULT.ANIO || MULT.CUM AS COD_MULTA,
                            MDET.ID_ORGANO_RESOLUTIVO AS COD_ORG_RESOLUTIVO,
                            ORGR.DESCRIPCION AS NOM_ORG_RESOLUTIVO,
                            MCOB.FECHA_VALIDACION AS FEC_VALIDACION,
                            MULT.NRO_ULT_IMPROCEDENCIA AS NRO_IMPROCEDENCIA,
                            DECODE(NVL(MULT.NRO_ULT_IMPROCEDENCIA, '0'), '0', 'NO', 'SI') AS NOM_IND_IMPROCEDENCIA,

                            trunc(mimp.audfeccreacion) as FEC_IMPROCEDENCIA,
                            MCOB.NRO_INGRESO AS NRO_INGRESO_AEC, --COLUMNA: NºINGRESO
                            MCOB.FECHA_INGRESO AS FEC_INGRESO_AEC, --COLUMNA: FEC.INGRESO
                            MULT.ID_MATERIA AS COD_MATERIA,
                            MATE.DESCRIPCION AS NOM_MATERIA,
                            MDET.NRO_RESOLUCION AS NRO_RESOLUCION,
                            MDET.FEC_RESOLUCION AS FEC_RESOLUCION,
                            DECODE(MULT.FLG_TIPO_MULTA, SCOB_PK_CONSTANTES.C_FLG_TIPO_MULTA_SOLID, ' ', PERS.COD_SANCIONADO) AS COD_SANCIONADO,
                            DECODE(MULT.FLG_TIPO_MULTA,
                                   SCOB_PK_CONSTANTES.C_FLG_TIPO_MULTA_SOLID,
                                   SCOB_PK_EXPEDIENTE.SCOB_FN_SANCIONADOS_MULTA(MULT.ID_MULTA, 0),
                                   DECODE(PERS.TIPO_PERSONA,
                                          SCOB_PK_CONSTANTES.C_TIPO_PERS_JURIDICA,
                                          PERS.RAZON_SOCIAL,
                                          PERS.APE_PATERNO || ' ' || PERS.APE_MATERNO || ' ' || PERS.PRI_NOMBRE || ' ' || PERS.SEG_NOMBRE || ' ' ||
                                          PERS.APE_CASADA)) AS DES_SANCIONADO,
                            
                            --DATOS ANTIDUMPING
                            DECODE(NVL(MUAN.NRO_LIQUIDACION_CODIGO, ' '),
                                   ' ',
                                   NULL,
                                   MUAN.NRO_LIQUIDACION_CODIGO || '-' || MUAN.NRO_LIQUIDACION_ANIO || '/' || MUAN.NRO_LIQUIDACION_CORRELATIVO) AS NRO_LIQUIDACION,
                            
                            --------------------------------------------------------------------------------------
                            --montos deuda antidumping
                            MUAN.TIPO_CAMBIO       AS TIPO_CAMBIO,
                            MUAN.MONTO_ANTIDUMPING AS MONTO_ANTIDUMPING,
                            --1=Multa OR 0=Multa Antidumping
                            DECODE(MULT.FLG_MULTA_RESOLUTIVO, '1', NULL, MUAN.MONTO_INTERES) AS MONTO_DA_INTERES_COMPENSATORIO, --MUAN.MONTO_INTERES AS MONTO_DA_INTERES_COMPENSATORIO,
                            DECODE(MULT.FLG_MULTA_RESOLUTIVO, '1', NULL, MUAN.MONTO_INTERES_MORATORIO) AS MONTO_DA_INTERES_MORATORIO, --MUAN.MONTO_INTERES_MORATORIO AS MONTO_DA_INTERES_MORATORIO,
                            MUAN.MONTO_TOTAL AS MONTO_TOTAL_DEUDA_DA,
                            
                            --montos deuda uit
                            MDET.VALOR_UIT               AS UIT,
                            MULT.MONTO_UIT               AS MONTO_UIT,
                            MULT.MONTO_INTERES           AS MONTO_IC,
                            MULT.MONTO_INTERES_MORATORIO AS MONTO_IM,
                            MULT.MONTO_COSTAS            AS MONTO_COSTAS,
                            MULT.MONTO_TOTAL_DEUDA       AS MONTO_TOTAL_DEUDA,
                            
                            --montos amortizado
                            CASE
                                WHEN MULT.COD_ESTADO_PAGO = SCOB_PK_CONSTANTES.C_EST_PAGO_DSCTO THEN
                                 0.00
                                ELSE
                                 MULT.TOTAL_AMORTIZADO
                            END AS MONTO_AMORTIZACION, --amortizado_uit
                            CASE
                                WHEN MULT.COD_ESTADO_PAGO = SCOB_PK_CONSTANTES.C_EST_PAGO_DSCTO THEN
                                 DECODE(MULT.IND_DESCUENTO, '1', MULT.MONTO_PORCENTAJE_DSCTO, 0.00)
                                ELSE
                                 0.00
                            END AS MONTO_AMORTIZADO_DSCTO,
                            MULT.TOTAL_AMORTIZADO_IC AS MONTO_AMORTIZADO_IC,
                            MULT.TOTAL_AMORTIZADO_IM AS MONTO_AMORTIZADO_IM,
                            MULT.TOTAL_AMORTIZADO_COSTAS AS MONTO_AMORTIZADO_COSTAS,
                            MULT.TOTAL_AMORTIZACION_DEUDA AS MONTO_TOTAL_AMORTIZADO,
                            
                            --montos saldo
                            MULT.SALDO             AS MONTO_SALDO, --uit
                            MULT.SALDO_IC          AS SALDO_IC,
                            MULT.SALDO_IM          AS SALDO_IM,
                            MULT.SALDO_COSTAS      AS SALDO_COSTAS,
                            MULT.SALDO_TOTAL_DEUDA AS SALDO_TOTAL,
                            --------------------------------------------------------------------------------------
                            
                            VALI.USUARIO             AS NOM_VALIDADO_POR,
                            ASIG.USUARIO             AS NOM_ASIGNADO_A,
                            MULT.FECHA_ASIG_COBRANZA AS FEC_ASIGNADO_A,
                            MULT.ESTADO_MULTA        AS COD_ESTADO,

                            SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_ESTADO_MULTA, MIMP.ESTADO_MULTA) AS DES_ESTADO,
                            
                            LTRIM(RTRIM(MULT.FLG_TIPO_MULTA)) AS IND_RESPONSABILIDAD,
                            MRES.TXT_DESCRIPCION AS DES_RESPONSABILIDAD,
                            MDET.FEC_NOTIFICACION_RESOLUCION AS FEC_NOTIF,
                            MIMP.COD_MOTIVO AS COD_MOTIVO,
                            MOTI.DESCRIPCION AS NOM_MOTIVO,
                            MIMP.AUDUSUCREACION AS NOM_OBSERVADO_POR,
                            MULT.COD_ESTADO_PAGO AS COD_ESTADO_PAGO,
                            SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_EST_PAGOS, MULT.COD_ESTADO_PAGO) AS NOM_ESTADO_PAGO,
                            ' ' AS VER_MEMO,
                            MULT.FLG_ENVIO_RIESGO AS FLG_ENVIO_RIESGO,
                            MULT.FEC_ENVIO_RIESGO AS FEC_ENVIO_RIESGO,
                            MULT.FLG_MULTA_RESOLUTIVO AS IND_TIPO_MULTA, --1=MULTA OR;0=ANTIDUMPING
                            MULT.FEC_GENERACION_SEC AS FEC_GENERACION_SEC,
                            -------------NRO FILE-----------------------------------------------------
                            MULT.ANIO_FILE_AEC    AS ANIO_FILE, --ANIO
                            ACOB.CODIGO           AS COD_AREA_COB, --COD AREA
                            MULT.NRO_FILE_AEC     AS NRO_FILE, --CORRELATIVO  --COLUMNA: NºFILE (LOS 3 CAMPOS)
                            MULT.FEC_INGRESO_FILE AS FEC_INGRESO_FILE, --COLUMNA: FEC. INGRESO FILE
                            ---------------------------------------------------------------------------
                            EXPE.ID_EXPEDIENTE AS ID_EXPEDIENTE,
                            CASE
                                WHEN EXPE.ID_EXPEDIENTE IS NOT NULL THEN
                                 EST_EXP.DESCRIPCION
                                ELSE
                                  -- INI TK76845@JCARRION
                                  --SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_ESTADO_MULTA, MULT.ESTADO_MULTA)
                                 SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_ESTADO_MULTA, MIMP.ESTADO_MULTA)
                                 -- FIN TK76845@JCARRION
                            END AS ESTADO_MULTA_EXPEDIENTE,
                            
                            CASE
                                WHEN MULT.COD_ESTADO_PAGO = 3 OR
                                     MULT.COD_ESTADO_PAGO = 4 THEN --TOTAL O DESCUENTO
                                 '0' -- VALOR ANTERIOR: 1 cambio JCARRION@20161025
                                WHEN (MULT.ESTADO_MULTA <> SCOB_PK_CONSTANTES.C_TBL_EST_MUL_NO_INICIADO) AND
                                     (MULT.ESTADO_MULTA <> SCOB_PK_CONSTANTES.C_TBL_EST_COB_TRAMITE_COB) THEN
                                 '2'
                                ELSE
                                 '0'
                            END AS IND_HABILITA,
                            MULT.TIPO_INSTANCIA_INICIA AS TIPO_INSTANCIA_INICIA
              FROM T_SCOB_MULTA MULT
            
             INNER JOIN T_SCOB_MULTA_DETAL MDET
                ON MDET.ID_MULTA = MULT.ID_MULTA
               AND MDET.FLG_ACTUAL = '1'
            
              LEFT JOIN T_SCOB_MULTA_ANTIDUMPING MUAN
                ON MUAN.ID_MULTA = MULT.ID_MULTA
            
             INNER JOIN T_SCOB_MULTA_COBRANZA MCOB
                ON MCOB.ID_MULTA = MULT.ID_MULTA
               AND MCOB.FLG_ACTUAL = '1'
               AND MCOB.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
            
              LEFT JOIN usr_sicob.T_SCOB_MULTA_IMPROCEDENCIA MIMP
                ON MIMP.ID_MULTA_COBRANZA = MCOB.ID_MULTA_COBRANZA
            
              LEFT JOIN T_SCOB_EST_MUL_COB_MOTIVO MOTI
                ON MOTI.ID_MOTIVO = MIMP.COD_MOTIVO
            
             INNER JOIN T_SCOB_ORGANO_RESOLUTIVO ORGR
                ON ORGR.ID_ORGANO_RESOLUTIVO = MDET.ID_ORGANO_RESOLUTIVO
            
             INNER JOIN T_SCOB_MATERIA MATE
                ON MATE.ID_MATERIA = MULT.ID_MATERIA
            
             INNER JOIN T_SCOB_MULTA_SANCIONADO SANC
                ON SANC.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL
               AND SANC.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
               AND NVL(SANC.COD_TIPO_PERSONA, '1') = '1'
            
             INNER JOIN T_SCOB_PERSONA PERS
                ON PERS.ID_PERSONA = SANC.ID_PERSONA
               AND PERS.COD_SANCIONADO IS NOT NULL
            
              LEFT JOIN T_SCOB_PERSONA_DOMICILIO PDOM
                ON PDOM.ID_PERSONA = PERS.ID_PERSONA
               AND PDOM.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
            
              LEFT JOIN T_SCOB_MULTA_SANCIONADO_DIREC SDIR
                ON SDIR.ID_MULTA_SANCIONADO = SANC.ID_MULTA_SANCIONADO
               AND SDIR.ID_PERSONA_DOMICILIO = PDOM.ID_PERSONA_DOMICILIO
               AND SDIR.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
            
             INNER JOIN T_SCOB_TABLA_DET MRES --TIPO DE MULTA (SOLIDARIA?).
                ON MRES.ID_TABLA = SCOB_PK_CONSTANTES.C_TBL_TIPO_RESP_MULTA_OR
               AND LTRIM(RTRIM(MRES.COD_INTERNO)) = LTRIM(RTRIM(MULT.FLG_TIPO_MULTA))
            
              LEFT JOIN T_SCOB_UBIGEO UBIG
                ON UBIG.ID_UBIGEO = PDOM.ID_UBIGEO
            
              LEFT JOIN T_SCOB_USUARIO ASIG
                ON ASIG.ID_USUARIO = MULT.ID_USUARIO_ASIG_COBRANZA
            
              LEFT JOIN T_SCOB_USUARIO VALI
                ON VALI.ID_USUARIO = MCOB.ID_USUARIO_VALIDACION
            
              LEFT JOIN T_SCOB_EXPEDIENTE_MULTA EXMU
                ON EXMU.ID_MULTA = MULT.ID_MULTA
               AND EXMU.ESTADO = '1'
            
              LEFT JOIN T_SCOB_EXPEDIENTE EXPE
                ON EXPE.ID_EXPEDIENTE = EXMU.ID_EXPEDIENTE
            
              LEFT JOIN T_SCOB_EST_EXP_COB EST_EXP
                ON EST_EXP.ID_EST_EXP_COB = EXPE.ESTADO_EXPEDIENTE
              LEFT JOIN T_SCOB_AREA_COBRANZA ACOB
                ON ACOB.ID_AREA_COBRANZA = MULT.ID_AREA_COBRANZA
             WHERE MULT.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
               AND (NVL(PI_V_CUM, ' ') = ' ' OR (NVL(PI_V_CUM, ' ') <> ' ' AND MULT.ANIO || TRIM(MULT.CUM) LIKE '%' || TRIM(PI_V_CUM) || '%'))
               AND MULT.ESTADO = 1
            ;
    
    END;
    
END SCOB_PK_COBRANZAS;
/
