CREATE OR REPLACE PACKAGE "SCOB_PK_EXPE_FRACCIONAR" IS

    -- Author  : ADMIN
    -- Created : 17/03/2011 15:00:13 p.m.
    -- Purpose :

    TYPE CU_REC_SET IS REF CURSOR;
    ----

    FUNCTION SCOB_FN_SUMA_ACUM_SALDO_CRONO(PI_N_ID_EXPED_CRONOGRAMA_PAGO IN T_SCOB_EXPED_CRONOGRAMA_DET.ID_EXPED_CRONOGRAMA_PAGO%TYPE,
                                           PI_N_NRO_CUOTA                IN T_SCOB_EXPED_CRONOGRAMA_DET.NRO_CUOTA%TYPE) RETURN NUMBER;

    PROCEDURE SCOB_SP_S_SOLIC_FRACCIONAR
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 16.05.2011
        -- Proposito    : listar las solicitudes de fraccionamiento.
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_N_ID_EXPEDIENTE       IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
     PI_N_ID_EXPED_FRACCIONAR IN T_SCOB_EXPED_FRACCIONAR.ID_EXPED_FRACCIONAR%TYPE,
     PO_CU_RETORNO            OUT CU_REC_SET);

    PROCEDURE SCOB_SP_U_SOLIC_FRACCIONAR
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 16.05.2011
        -- Proposito    : actualizar los datos de la solicitud de fraccionamiento
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_N_ID_EXPED_FRACCIONAR     IN T_SCOB_EXPED_FRACCIONAR.ID_EXPED_FRACCIONAR%TYPE,
     PI_V_NRO_SOLICITUD           IN T_SCOB_EXPED_FRACCIONAR.NRO_SOLICITUD%TYPE,
     PI_V_NRO_DOCUMENTO_TRAMITE   IN T_SCOB_EXPED_FRACCIONAR.NRO_DOCUMENTO_TRAMITE%TYPE,
     PI_N_ID_EXPEDIENTE_DOCUMENTO IN T_SCOB_EXPED_FRACCIONAR.ID_EXPEDIENTE_DOCUMENTO%TYPE,
     PI_I_NRO_CUOTAS              IN T_SCOB_EXPED_FRACCIONAR.NRO_CUOTAS%TYPE,
     PI_N_MONTO_FRACCIONAR        IN T_SCOB_EXPED_FRACCIONAR.MONTO_FRACCIONAR%TYPE,
     PI_V_AUDUSUMODIFICACION      IN T_SCOB_EXPED_FRACCIONAR.AUDUSUMODIFICACION%TYPE,
     --  PI_N_MONTO_INTERES_TIEL           IN T_SCOB_EXPED_FRACCIONAR.MONTO_INTERES_TIEL%TYPE,
     PO_N_RETORNO   OUT NUMBER,
     PO_N_COD_ERROR OUT NUMBER,
     PO_V_MSJ_ERROR OUT VARCHAR2);

    PROCEDURE SCOB_SP_S_SOLIC_FRACCIONAR_DOC
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 18.05.2010
        -- Proposito    : listar los documentos generados por fraccionamiento.
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_N_ID_EXPED_FRACCIONAR IN T_SCOB_EXPED_FRACCIONAR.ID_EXPED_FRACCIONAR%TYPE,
     PI_I_COD_TIPO_ASOCIACION IN T_SCOB_EXPED_FRACCIONAR_DOC.COD_TIPO_ASOCIACION%TYPE,
     PO_CU_RETORNO            OUT CU_REC_SET);

    PROCEDURE SCOB_SP_I_CRONO_FRACCIONAR
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 17.05.2011
        -- Proposito    : inserta un cronograma de pago al expediente.
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_N_ID_EXPEDIENTE       IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
     PI_N_ID_EXPED_FRACCIONAR IN T_SCOB_EXPED_FRACCIONAR.ID_EXPED_FRACCIONAR %TYPE,
     PI_I_ESTADO_SOLICITUD    IN T_SCOB_EXPED_FRACCIONAR.ESTADO_SOLICITUD%TYPE,
     PI_N_MONTO_FRACCCIONAR   IN T_SCOB_EXPED_FRACCIONAR.MONTO_FRACCIONAR%TYPE,
     PI_N_TASA_TIEL           IN T_SCOB_EXPED_FRACCIONAR.MONTO_INTERES_TIEL%TYPE,
     PI_C_FEC_PERIODO_GRACIA  IN CHAR,
     PI_C_FEC_FRACCIONAMIENTO IN CHAR, --FECHA DE RECEPCION DE LA SOLICITUD O FEC DEL DIA.
     PI_I_NRO_DIA_PAGO        IN T_SCOB_EXPED_FRACCIONAR.NRO_DIA_PAGO%TYPE,
     PI_I_NRO_CUOTA           IN T_SCOB_EXPED_FRACCIONAR.NRO_CUOTAS%TYPE,
     PI_V_AUDUSUCREACION      IN T_SCOB_EXPED_FRACCIONAR.AUDUSUCREACION%TYPE,
     PO_N_RETORNO             OUT NUMBER,
     PO_N_COD_ERROR           OUT NUMBER,
     PO_V_MSJ_ERROR           OUT VARCHAR2);

    PROCEDURE SCOB_SP_S_CRONO_FRACCIONAR
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 19.05.2011
        -- Proposito    : listar el cronograma generado
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_N_ID_EXPEDIENTE       IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
     PI_N_ID_EXPED_FRACCIONAR IN T_SCOB_EXPED_FRACCIONAR.ID_EXPED_FRACCIONAR%TYPE,
     PO_CU_RETORNO            OUT CU_REC_SET);

    PROCEDURE SCOB_SP_D_CRONO_FRACCIONAR
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 18.05.2011
        -- Proposito    : eliminar el cronograma generado.
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_N_ID_EXPEDIENTE       IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
     PI_N_ID_EXPED_FRACCIONAR IN T_SCOB_EXPED_FRACCIONAR.ID_EXPED_FRACCIONAR%TYPE,
     PI_V_AUDUSUCREACION      IN T_SCOB_EXPED_FRACCIONAR.AUDUSUCREACION%TYPE,
     PO_N_RETORNO             OUT NUMBER,
     PO_N_COD_ERROR           OUT NUMBER,
     PO_V_MSJ_ERROR           OUT VARCHAR2);

    PROCEDURE SCOB_SP_S_SIMULAR_CRONOGRAMA
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 17.05.2011
        -- Proposito    : genera el cronograma
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_N_ID_EXPEDIENTE       IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
     PI_N_MONTO_FRACCCIONAR   IN T_SCOB_EXPED_FRACCIONAR.MONTO_FRACCIONAR %TYPE,
     PI_N_TASA_TIEL           IN T_SCOB_EXPED_FRACCIONAR.MONTO_INTERES_TIEL%TYPE,
     PI_C_FEC_PERIODO_GRACIA  IN CHAR,
     PI_C_FEC_FRACCIONAMIENTO IN CHAR,
     PI_I_NRO_DIA_PAGO        IN T_SCOB_EXPED_FRACCIONAR.NRO_DIA_PAGO%TYPE,
     PI_I_NRO_CUOTA           IN T_SCOB_EXPED_FRACCIONAR.NRO_CUOTAS%TYPE,
     PI_C_ELIMINA             IN CHAR,
     PO_CU_RETORNO            OUT CU_REC_SET,
     PO_V_RETORNO             OUT VARCHAR2,
     PO_V_MSJ_ERROR           OUT VARCHAR2);

    PROCEDURE SCOB_SP_I_SIMULAR_CRONOGRAMA
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 17.05.2011
        -- Proposito    : insertar la simulacion del cronograma
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_V_ID_SIMULACION            IN T_SCOB_TMP_SIMULAR_CRONOGRAMA.ID_SIMULACION%TYPE,
     PI_N_ID_EXPEDIENTE            IN T_SCOB_TMP_SIMULAR_CRONOGRAMA.ID_EXPEDIENTE%TYPE,
     PI_I_NRO_CUOTA                IN T_SCOB_TMP_SIMULAR_CRONOGRAMA.NRO_CUOTA%TYPE,
     PI_C_FEC_VENCIMIENTO          IN CHAR,
     PI_N_MONTO_CUOTA              IN T_SCOB_TMP_SIMULAR_CRONOGRAMA.MONTO_CUOTA%TYPE,
     PI_N_MONTO_COSTAS             IN T_SCOB_TMP_SIMULAR_CRONOGRAMA.MONTO_COSTAS%TYPE,
     PI_N_MONTO_INTERES            IN T_SCOB_TMP_SIMULAR_CRONOGRAMA.MONTO_INTERES%TYPE,
     PI_N_SALDO                    IN T_SCOB_TMP_SIMULAR_CRONOGRAMA.SALDO%TYPE,
     PI_N_MONTO_DEUDA_AMORTIZACION IN T_SCOB_TMP_SIMULAR_CRONOGRAMA.MONTO_DEUDA_AMORTIZACION%TYPE,
     PI_N_MONTO_AMORTIZACION       IN T_SCOB_TMP_SIMULAR_CRONOGRAMA.MONTO_AMORTIZACION%TYPE,
     PI_N_NRO_DIAS_TRANSCURRIDOS   IN INTEGER,
     PO_N_RETORNO                  OUT NUMBER,
     PO_N_COD_ERROR                OUT NUMBER,
     PO_V_MSJ_ERROR                OUT VARCHAR2);

    PROCEDURE SCOB_SP_S_SOLIC_FRACCIONAR_GEN
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 17.06.2011
        -- Proposito    : muestra los datos de la aprobacion de la solucitud por fraccinamiento
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_N_ID_EXPEDIENTE       IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
     PI_N_ID_EXPED_FRACCIONAR IN T_SCOB_EXPED_FRACCIONAR.ID_EXPED_FRACCIONAR%TYPE,
     PO_CU_RETORNO            OUT CU_REC_SET);

    PROCEDURE SCOB_SP_I_RECALCULAR_CRONO
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 04.01.2012
        -- Proposito    : regenera el cronograma en base a los ultimos saldos generados para el expediente.
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_N_ID_EXPEDIENTE       IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
     PI_N_ID_EXPED_FRACCIONAR IN T_SCOB_EXPED_FRACCIONAR.ID_EXPED_FRACCIONAR%TYPE,
     PI_V_AUDUSUMODIFICACION  IN T_SCOB_EXPED_FRACCIONAR.AUDUSUMODIFICACION%TYPE,
     PO_N_RETORNO             OUT NUMBER,
     PO_N_COD_ERROR           OUT NUMBER,
     PO_V_MSJ_ERROR           OUT VARCHAR2);

    PROCEDURE SCOB_SP_S_SIMULAR_CRONO_ANT
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 17.05.2011
        -- Proposito    : genera el cronograma
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_N_ID_EXPEDIENTE       IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
     PI_N_MONTO_FRACCCIONAR   IN T_SCOB_EXPED_FRACCIONAR.MONTO_FRACCIONAR %TYPE,
     PI_N_TASA_TIEL           IN T_SCOB_EXPED_FRACCIONAR.MONTO_INTERES_TIEL%TYPE,
     PI_C_FEC_PERIODO_GRACIA  IN CHAR,
     PI_C_FEC_FRACCIONAMIENTO IN CHAR,
     PI_I_NRO_DIA_PAGO        IN T_SCOB_EXPED_FRACCIONAR.NRO_DIA_PAGO%TYPE,
     --  PI_I_COD_TIPO_PERIODO_PAGO             IN T_SCOB_EXPED_FRACCIONAR.COD_TIPO_PERIODO_PAGO%TYPE,
     PI_I_NRO_CUOTA IN T_SCOB_EXPED_FRACCIONAR.NRO_CUOTAS%TYPE,
     PI_C_ELIMINA   IN CHAR,
     PO_CU_RETORNO  OUT CU_REC_SET,
     PO_V_RETORNO   OUT VARCHAR2,
     PO_V_MSJ_ERROR OUT VARCHAR2);
     
     procedure SCOB_SP_S_EXP_PARA_VINC
    /*
    -----------------------------------------------------------
    -- Autor        : HCHALCO
    -- Creado       : 29.07.2021
    -- Proposito    : Consulta de exp. para vincular por numero correlativo
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    : 
    -----------------------------------------------------------
    */
    (
      po_cu_retorno            out cu_rec_set,
      PI_VC_EXP             IN VARCHAR2,
      PI_VC_ANIO                 IN VARCHAR2
    );
    
    procedure SCOB_SP_I_VINCULAR_EXP
    /*
    -----------------------------------------------------------
    -- Autor        : HCHALCO
    -- Creado       : 29.07.2021
    -- Proposito    : Vincular multas con los exp
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    : 
    -----------------------------------------------------------
    */
    (
      PI_VC_NRO_SOLICITUD      IN VARCHAR2,
      PI_VC_FEC_DETALLE        IN VARCHAR2,
      PI_VC_NRO_EXP_COBRANZA   IN VARCHAR2,
      PI_NU_ANN_EXP            IN VARCHAR2,
      PI_VC_USUARIO_LOGIN      IN VARCHAR2,
      PO_VC_RETORNO            OUT VARCHAR2
    );

----
END SCOB_PK_EXPE_FRACCIONAR;
/
CREATE OR REPLACE PACKAGE BODY "SCOB_PK_EXPE_FRACCIONAR" IS
    ----
    FUNCTION SCOB_FN_SUMA_ACUM_SALDO_CRONO(PI_N_ID_EXPED_CRONOGRAMA_PAGO IN T_SCOB_EXPED_CRONOGRAMA_DET.ID_EXPED_CRONOGRAMA_PAGO%TYPE,
                                           PI_N_NRO_CUOTA                IN T_SCOB_EXPED_CRONOGRAMA_DET.NRO_CUOTA%TYPE) RETURN NUMBER IS
        V_TOTAL_ACUMULADO T_SCOB_EXPED_CRONOGRAMA_DET.MONTO_CUOTA%TYPE;
    BEGIN
        V_TOTAL_ACUMULADO := 0;
    
        SELECT NVL(SUM(SUMA.SUMA), 0)
          INTO V_TOTAL_ACUMULADO
          FROM (SELECT (CASE
                           WHEN (EXCROD.FEC_VENCIMIENTO <= TO_DATE(TO_CHAR(SYSDATE, 'DD/MM/YYYY'), 'DD/MM/YYYY')) OR
                                (TO_NUMBER(TO_CHAR(EXCROD.FEC_VENCIMIENTO, 'YYYYMM')) <= TO_NUMBER(TO_CHAR(SYSDATE, 'YYYYMM'))) THEN
                            (EXCROD.SALDO + EXCROD.SALDO_IC + EXCROD.SALDO_IM + EXCROD.SALDO_COSTAS)
                           ELSE
                            DECODE(EXCROD.ESTADO_CUOTA,
                                   2, --PAGO PARCIAL
                                   (EXCROD.SALDO + EXCROD.SALDO_IC + EXCROD.SALDO_IM + EXCROD.SALDO_COSTAS), --PAGA TODO
                                   
                                   (EXCROD.SALDO + EXCROD.SALDO_COSTAS) --SINO SOLO CAPITAL
                                   )
                       END) AS SUMA
                  FROM T_SCOB_EXPED_CRONOGRAMA_DET EXCROD
                 WHERE EXCROD.ID_EXPED_CRONOGRAMA_PAGO = PI_N_ID_EXPED_CRONOGRAMA_PAGO
                   AND EXCROD.NRO_CUOTA >= PI_N_NRO_CUOTA
                   AND EXCROD.ESTADO = '1') SUMA;
    
        RETURN V_TOTAL_ACUMULADO;
    
    END;

    PROCEDURE SCOB_SP_S_SOLIC_FRACCIONAR
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 16.05.2011
        -- Proposito    : listar las solicitudes de fraccionamiento.
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_N_ID_EXPEDIENTE       IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
     PI_N_ID_EXPED_FRACCIONAR IN T_SCOB_EXPED_FRACCIONAR.ID_EXPED_FRACCIONAR%TYPE,
     PO_CU_RETORNO            OUT CU_REC_SET) AS
    BEGIN
    
        OPEN PO_CU_RETORNO FOR
        
            SELECT EXFR.ID_EXPED_FRACCIONAR AS ID_EXPED_FRACCIONAR,
                   EXFR.NRO_SOLICITUD AS NRO_SOLICITUD,
                   EXFR.FEC_RECEPCION_TRAMITE AS FEC_RECEPCION,
                   TO_CHAR(EXFR.FEC_RECEPCION_TRAMITE, 'HH:MM:SS') AS HOR_RECEPCION,
                   EXFR.NRO_DOCUMENTO_TRAMITE AS NRO_DOCUMENTO_TRAMITE,
                   EXFR.NRO_RESOLUCION_REF_AEC AS NRO_RESOLUCION_REF_AEC,
                   EXFR.ID_EXPEDIENTE_DOCUMENTO AS ID_EXPEDIENTE_DOCUMENTO,
                   EXFR.ESTADO_SOLICITUD AS COD_ESTADO_SOLICITUD,
                   SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_EST_SOLIC_FRACCIONAR, EXFR.ESTADO_SOLICITUD) AS NOM_ESTADO_SOLIC,
                   EXFR.ID_USUARIO_INGRESO AS ID_USUARIO_GENERACION,
                   USUA.USUARIO AS COD_USUARIO_GENERACION,
                   EXFR.NRO_CUOTAS AS NRO_CUOTAS,
                   DECODE(EXFR.MONTO_FRACCIONAR, NULL, 0, EXFR.MONTO_FRACCIONAR) AS MONTO_FRACCIONAR,
                   EXFR.COD_TIPO_PERIODO_PAGO AS COD_TIPO_PERIODO_PAGO,
                   EXFR.MONTO_INTERES_TIEL AS MONTO_TIEL,
                   EXFR.FEC_PERIODO_GRACIA AS FEC_PERIODO_GRACIA,
                   EXFR.FEC_INICIO_CUOTA AS FEC_INICIO_CUOTA,
                   EXFR.FEC_CIERRE_TRAMITE AS FEC_CIERRE_TRAMITE,
                   EXPE.ESTADO_EXPEDIENTE AS COD_ESTADO_EXPEDIENTE,
                   ESEX.DESCRIPCION AS NOM_ESTADO_EXPEDIENTE,
                   NVL(EXFR.FLG_APERDIDA, '0') AS FLG_APERDIDA,
                   EXFR.FEC_INGRESO_TRAMITE AS FEC_GENERACION,
                   EXFR.NRO_DIA_PAGO AS NRO_DIA_PAGO
              FROM T_SCOB_EXPED_FRACCIONAR EXFR
              LEFT JOIN T_SCOB_USUARIO USUA
                ON USUA.ID_USUARIO = EXFR.ID_USUARIO_INGRESO
             INNER JOIN T_SCOB_EXPEDIENTE EXPE
                ON EXPE.ID_EXPEDIENTE = EXFR.ID_EXPEDIENTE
             INNER JOIN T_SCOB_EST_EXP_COB ESEX
                ON ESEX.ID_EST_EXP_COB = EXPE.ESTADO_EXPEDIENTE
             WHERE EXFR.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
               AND EXFR.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
               AND (NVL(PI_N_ID_EXPED_FRACCIONAR, 0) = 0 OR
                   (NVL(PI_N_ID_EXPED_FRACCIONAR, 0) <> 0 AND EXFR.ID_EXPED_FRACCIONAR = PI_N_ID_EXPED_FRACCIONAR))
             ORDER BY EXFR.ID_EXPED_FRACCIONAR;
    
    END;

    PROCEDURE SCOB_SP_U_SOLIC_FRACCIONAR
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 16.05.2011
        -- Proposito    : actualizar los datos de la solicitud de fraccionamiento
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_N_ID_EXPED_FRACCIONAR     IN T_SCOB_EXPED_FRACCIONAR.ID_EXPED_FRACCIONAR%TYPE,
     PI_V_NRO_SOLICITUD           IN T_SCOB_EXPED_FRACCIONAR.NRO_SOLICITUD%TYPE,
     PI_V_NRO_DOCUMENTO_TRAMITE   IN T_SCOB_EXPED_FRACCIONAR.NRO_DOCUMENTO_TRAMITE%TYPE,
     PI_N_ID_EXPEDIENTE_DOCUMENTO IN T_SCOB_EXPED_FRACCIONAR.ID_EXPEDIENTE_DOCUMENTO%TYPE,
     PI_I_NRO_CUOTAS              IN T_SCOB_EXPED_FRACCIONAR.NRO_CUOTAS%TYPE,
     PI_N_MONTO_FRACCIONAR        IN T_SCOB_EXPED_FRACCIONAR.MONTO_FRACCIONAR%TYPE,
     PI_V_AUDUSUMODIFICACION      IN T_SCOB_EXPED_FRACCIONAR.AUDUSUMODIFICACION%TYPE,
     PO_N_RETORNO                 OUT NUMBER,
     PO_N_COD_ERROR               OUT NUMBER,
     PO_V_MSJ_ERROR               OUT VARCHAR2) IS
        --  V_NRO_RESOLUCION                 T_SCOB_EXPEDIENTE_DOCUMENTO.NRO_RESOLUCION%TYPE;
        I_EXISTE INTEGER;
    
    BEGIN
        PO_V_MSJ_ERROR := '';
        PO_N_RETORNO   := 0;
        PO_N_COD_ERROR := -1;
    
        --verificar si la solitud esta pendiente.
        SELECT COUNT(EXFR.ID_EXPED_FRACCIONAR)
          INTO I_EXISTE
          FROM T_SCOB_EXPED_FRACCIONAR EXFR
         WHERE EXFR.ID_EXPED_FRACCIONAR = PI_N_ID_EXPED_FRACCIONAR
           AND EXFR.ESTADO_SOLICITUD = SCOB_PK_CONSTANTES.C_COD_EST_SOL_FRACC_REGISTRADO;
    
        IF I_EXISTE = 0 THEN
            BEGIN
                PO_V_MSJ_ERROR := 'No se puede realizar la accion. El estado de la solicitud debe ser registrada.';
                PO_N_COD_ERROR := -10;
                RETURN;
            END;
        END IF;
    
        --actualizar el registro
        UPDATE T_SCOB_EXPED_FRACCIONAR EXFR
           SET EXFR.NRO_SOLICITUD           = PI_V_NRO_SOLICITUD,
               EXFR.NRO_DOCUMENTO_TRAMITE   = PI_V_NRO_DOCUMENTO_TRAMITE,
               EXFR.ID_EXPEDIENTE_DOCUMENTO = PI_N_ID_EXPEDIENTE_DOCUMENTO,
               EXFR.AUDFECMODIFICACION      = SYSDATE,
               EXFR.AUDUSUMODIFICACION      = PI_V_AUDUSUMODIFICACION,
               EXFR.NRO_CUOTAS              = PI_I_NRO_CUOTAS,
               EXFR.MONTO_FRACCIONAR        = PI_N_MONTO_FRACCIONAR
         WHERE EXFR.ID_EXPED_FRACCIONAR = PI_N_ID_EXPED_FRACCIONAR;
    
        PO_N_COD_ERROR := 0;
        PO_N_RETORNO   := PI_N_ID_EXPED_FRACCIONAR;
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

    PROCEDURE SCOB_SP_S_SOLIC_FRACCIONAR_DOC
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 18.05.2010
        -- Proposito    : listar los documentos generados por fraccionamiento.
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_N_ID_EXPED_FRACCIONAR IN T_SCOB_EXPED_FRACCIONAR.ID_EXPED_FRACCIONAR%TYPE,
     PI_I_COD_TIPO_ASOCIACION IN T_SCOB_EXPED_FRACCIONAR_DOC.COD_TIPO_ASOCIACION%TYPE,
     PO_CU_RETORNO            OUT CU_REC_SET) AS
    BEGIN
    
        OPEN PO_CU_RETORNO FOR
            SELECT EXDO.ID_EXPEDIENTE_DOCUMENTO AS ID_DOCUMENTO,
                   EXDO.ID_EXPEDIENTE           AS ID_EXPEDIENTE,
                   EXPE.NRO_EXPEDIENTE          AS NRO_EXPEDIENTE,
                   EXDO.NOMBRE                  AS NOM_ARCHIVO,
                   EXDO.NRO_RESOLUCION          AS NRO_RESOLUCION,
                   EXDO.NRO_DOCUMENTO           AS NRO_DOCUMENTO,
                   EXDO.NRO_VERSION             AS NRO_VERSION,
                   EXDO.FEC_INGRESO             AS FEC_GENERADO_POR,
                   EXDO.AUDUSUCREACION          AS USU_GENERADO_POR,
                   EXDO.MONTO_COSTA             AS MONTO_COSTA,
                   EXDO.NRO_RESOLUCION_GAF      AS NRO_RESOLUCION_GAF,
                   EXDO.FEC_RESOLUCION_GAF      AS FEC_RESOLUCION_GAF
              FROM T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
             INNER JOIN T_SCOB_EXPEDIENTE EXPE
                ON EXPE.ID_EXPEDIENTE = EXDO.ID_EXPEDIENTE
             INNER JOIN T_SCOB_EXPED_FRACCIONAR_DOC FRDO
                ON FRDO.ID_EXPEDIENTE_DOCUMENTO = EXDO.ID_EXPEDIENTE_DOCUMENTO
               AND FRDO.ESTADO = '1'
             WHERE EXDO.ESTADO = '1'
               AND FRDO.ID_EXPED_FRACCIONAR = PI_N_ID_EXPED_FRACCIONAR
               AND FRDO.COD_TIPO_ASOCIACION = PI_I_COD_TIPO_ASOCIACION
            /*
            AND EXDO.TIPO_DOC_ASOC IN (
                SCOB_PK_CONSTANTES.C_TIPO_DOC_ASOC_SISTEMA,
                SCOB_PK_CONSTANTES.C_TIPO_DOC_ASOC_SISTEMA_ACT
                )
            */
             ORDER BY EXDO.ID_EXPEDIENTE_DOCUMENTO;
    
    END;

    PROCEDURE SCOB_SP_I_CRONO_FRACCIONAR
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 17.05.2011
        -- Proposito    : inserta un cronograma de pago al expediente.
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_N_ID_EXPEDIENTE       IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
     PI_N_ID_EXPED_FRACCIONAR IN T_SCOB_EXPED_FRACCIONAR.ID_EXPED_FRACCIONAR%TYPE,
     PI_I_ESTADO_SOLICITUD    IN T_SCOB_EXPED_FRACCIONAR.ESTADO_SOLICITUD%TYPE,
     PI_N_MONTO_FRACCCIONAR   IN T_SCOB_EXPED_FRACCIONAR.MONTO_FRACCIONAR%TYPE,
     PI_N_TASA_TIEL           IN T_SCOB_EXPED_FRACCIONAR.MONTO_INTERES_TIEL%TYPE,
     PI_C_FEC_PERIODO_GRACIA  IN CHAR,
     PI_C_FEC_FRACCIONAMIENTO IN CHAR, --FECHA DE RECEPCION DE LA SOLICITUD O FEC DEL DIA.
     PI_I_NRO_DIA_PAGO        IN T_SCOB_EXPED_FRACCIONAR.NRO_DIA_PAGO%TYPE,
     PI_I_NRO_CUOTA           IN T_SCOB_EXPED_FRACCIONAR.NRO_CUOTAS%TYPE,
     PI_V_AUDUSUCREACION      IN T_SCOB_EXPED_FRACCIONAR.AUDUSUCREACION%TYPE,
     PO_N_RETORNO             OUT NUMBER,
     PO_N_COD_ERROR           OUT NUMBER,
     PO_V_MSJ_ERROR           OUT VARCHAR2) IS
        N_ID_EXPED_CRONOGRAMA_PAGO T_SCOB_EXPED_CRONOGRAMA.ID_EXPED_CRONOGRAMA_PAGO%TYPE;
        PO_CU_RETORNO              CU_REC_SET;
        PO_V_RETORNO               VARCHAR2(50);
        I_ESTADO_SOLICITUD         INTEGER;
        I_EXISTE                   INTEGER;
    
        N_TOTAL_AMORTIZADO         T_SCOB_MULTA.MONTO_UIT%TYPE;
        N_TOTAL_AMORT_UIT_Y_COSTAS T_SCOB_MULTA.MONTO_UIT%TYPE;
        N_MONTO_CAPITAL            T_SCOB_MULTA.MONTO_UIT%TYPE;
        N_MONTO_CAPITAL_Y_COSTAS   T_SCOB_MULTA.MONTO_UIT%TYPE;
        N_SALDO_EXPEDIENTE         T_SCOB_EXPEDIENTE.SALDO%TYPE;
    
        N_ID_MULTA                T_SCOB_MULTA.ID_MULTA%TYPE;
        N_POR_MONTO_FRACC_DESP    T_SCOB_EXPED_FRACCIONAR.MONTO_INTERES_TIEL%TYPE;
        N_NRO_DIAS_FRACC_DESP     NUMBER;
        N_POR_MONTO_FRACC_ANTES   T_SCOB_EXPED_FRACCIONAR.MONTO_INTERES_TIEL%TYPE;
        N_NRO_DIAS_FRACC_ANTES    NUMBER;
        D_FEC_SOLICITUD_FRAC      T_SCOB_EXPED_FRACCIONAR.FEC_RECEPCION_TRAMITE%TYPE;
        N_FEC_EVALUADA            T_SCOB_EXPED_FRACCIONAR.FEC_RESOLUCION_GAF%TYPE;
        D_FEC_NOTIF_REC           T_SCOB_MULTA.FEC_NOTIF_REC%TYPE;
        I_ESTADO_EXPEDIENTE       INTEGER;
        C_IND_PORCENTAJE_VALIDADO CHAR(1);
        N_PORCENTAJE_VALIDADO     NUMBER(18, 6);
        N_MONTO_INICIAL_CANCELADO NUMBER(18, 6);
    BEGIN
        PO_V_MSJ_ERROR := '';
        PO_N_RETORNO   := 0;
        PO_N_COD_ERROR := -1;
    
        --validar que no exista ninguna solicitud con estado: aprobada, atendida, a perdida
        SELECT COUNT(EXFR.ID_EXPED_FRACCIONAR)
          INTO I_EXISTE
          FROM T_SCOB_EXPED_FRACCIONAR EXFR
         WHERE EXFR.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
           AND EXFR.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
           AND EXFR.ESTADO_SOLICITUD IN (SCOB_PK_CONSTANTES.C_COD_EST_SOL_FRACC_ATENDIDA,
                                         SCOB_PK_CONSTANTES.C_COD_EST_SOL_FRACC_APROBADA,
                                         SCOB_PK_CONSTANTES.C_COD_EST_SOL_FRACC_APERDIDA); --3,4,7;
    
        IF I_EXISTE > 0 THEN
            --no se encuentra registrada o abierta
            PO_V_MSJ_ERROR := 'No se puede realizar la accion. Existe una solicitud en tramite.';
            PO_N_COD_ERROR := -10;
            RETURN;
        END IF;
    
        --valida que la solicitud se encuentre con estado registrado o abierto
        SELECT EXFR.ESTADO_SOLICITUD
          INTO I_ESTADO_SOLICITUD
          FROM T_SCOB_EXPED_FRACCIONAR EXFR
         WHERE EXFR.ID_EXPED_FRACCIONAR = PI_N_ID_EXPED_FRACCIONAR;
    
        IF I_ESTADO_SOLICITUD <> SCOB_PK_CONSTANTES.C_COD_EST_SOL_FRACC_REGISTRADO THEN
            --no se encuentra registrada o abierta
            PO_V_MSJ_ERROR := 'No se puede realizar la accion. El estado de la solicitud debe ser Registrada.';
            PO_N_COD_ERROR := -11;
            RETURN;
        END IF;
    
        /*********************/
        --agregado 21.03.2012
        /*********************/
        --OBTENER EL ID DE LA MULTA ASOCIADA AL EXPEDIENTE
        SELECT EXMU.ID_MULTA,
               EXPE.ESTADO_EXPEDIENTE
          INTO N_ID_MULTA,
               I_ESTADO_EXPEDIENTE
          FROM T_SCOB_EXPEDIENTE_MULTA EXMU
         INNER JOIN T_SCOB_EXPEDIENTE EXPE
            ON EXPE.ID_EXPEDIENTE = EXMU.ID_EXPEDIENTE
         WHERE EXMU.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
           AND EXMU.ESTADO = '1'
              -- @dcelis - prueba
           AND ROWNUM = 1;
    
        --OBTENER LOS TOTALES A VALIDAR.
        --obtener los saldos de la multa
        SELECT MULT.TOTAL_AMORTIZADO, --, MDET.VALOR_UIT,
               MULT.TOTAL_AMORTIZADO + MULT.TOTAL_AMORTIZADO_COSTAS, --para validacion parametros fraccionamiento
               MULT.MONTO_UIT,
               MULT.MONTO_UIT + MULT.MONTO_COSTAS, --para validaciones parametros fraccionamiento
               MULT.SALDO
          INTO N_TOTAL_AMORTIZADO, --, N_VALOR_UIT,
               N_TOTAL_AMORT_UIT_Y_COSTAS,
               N_MONTO_CAPITAL,
               N_MONTO_CAPITAL_Y_COSTAS,
               N_SALDO_EXPEDIENTE --SALDO CAPITAL
          FROM T_SCOB_MULTA MULT
         INNER JOIN T_SCOB_MULTA_DETAL MDET
            ON MDET.ID_MULTA = MULT.ID_MULTA
           AND MDET.FLG_ACTUAL = '1'
         WHERE MULT.ID_MULTA = N_ID_MULTA;
    
        --VALIDACIONES:si la fecha gaf es menor a X dias y se cancelo Y % del capital
        C_IND_PORCENTAJE_VALIDADO := '0'; --NINGUNA VALIDACION DE PARAMETROS (PRECOACTIVA)
        N_PORCENTAJE_VALIDADO     := 0;
        N_MONTO_INICIAL_CANCELADO := 0;
    
        IF I_ESTADO_EXPEDIENTE <> 1 THEN
            --VALIDAR CUMPLIMIENTO DE LOS PARAMETROS DE FRACCIONAMIENTO:27.01.2012
            --1:obtener los valores de los parametros...
            SELECT SCOB_PK_UTILITARIO.SCOB_FN_TEXTO_A_NUMERO(TD.TXT_VALOR1),
                   SCOB_PK_UTILITARIO.SCOB_FN_TEXTO_A_NUMERO(TD.TXT_VALOR2)
              INTO N_POR_MONTO_FRACC_ANTES,
                   N_NRO_DIAS_FRACC_ANTES
              FROM T_SCOB_TABLA_DET TD
             WHERE TD.ID_TABLA = SCOB_PK_CONSTANTES.C_TBL_PARAMETRO_SISTEMA
               AND TO_NUMBER(TD.COD_INTERNO) = (4);
            SELECT SCOB_PK_UTILITARIO.SCOB_FN_TEXTO_A_NUMERO(TD.TXT_VALOR1),
                   SCOB_PK_UTILITARIO.SCOB_FN_TEXTO_A_NUMERO(TD.TXT_VALOR2)
              INTO N_POR_MONTO_FRACC_DESP,
                   N_NRO_DIAS_FRACC_DESP
              FROM T_SCOB_TABLA_DET TD
             WHERE TD.ID_TABLA = SCOB_PK_CONSTANTES.C_TBL_PARAMETRO_SISTEMA
               AND TO_NUMBER(TD.COD_INTERNO) = (5);
        
            --2:obtener la fecha de resolucion gaf (se cambio por fecha de la solicitud)
            SELECT EF.FEC_RECEPCION_TRAMITE
              INTO D_FEC_SOLICITUD_FRAC
              FROM T_SCOB_EXPED_FRACCIONAR EF
             WHERE EF.ID_EXPED_FRACCIONAR = PI_N_ID_EXPED_FRACCIONAR;
        
            --3:obtener la fecha de notificacion de la rec
            SELECT FEC_NOTIF_REC INTO D_FEC_NOTIF_REC FROM T_SCOB_MULTA MULT WHERE MULT.ID_MULTA = N_ID_MULTA;
        
            IF D_FEC_NOTIF_REC IS NOT NULL THEN
                N_FEC_EVALUADA := SCOB_PK_UTILITARIO.SCOB_FN_DIAS_VALIDOS(D_FEC_NOTIF_REC, N_NRO_DIAS_FRACC_ANTES, 0);
            
                ---
                IF D_FEC_SOLICITUD_FRAC <= N_FEC_EVALUADA THEN
                    C_IND_PORCENTAJE_VALIDADO := '1'; --PRIMERO=30%
                    N_PORCENTAJE_VALIDADO     := N_POR_MONTO_FRACC_ANTES;
                    N_MONTO_INICIAL_CANCELADO := N_TOTAL_AMORTIZADO;
                
                    IF N_TOTAL_AMORTIZADO < (N_MONTO_CAPITAL * (N_POR_MONTO_FRACC_ANTES / 100)) THEN
                        --VALIDA EL IMPORTE DE PAGO
                        PO_V_MSJ_ERROR := 'No se puede realizar la accion. ' || 'Antes, se debe cancelar el ' || TO_CHAR(N_POR_MONTO_FRACC_ANTES) || '%' ||
                                          ' de la multa. (' || TO_CHAR((N_MONTO_CAPITAL * (N_POR_MONTO_FRACC_ANTES / 100))) || ')'
                        --'FEC.SOL:' || TO_CHAR(D_FEC_SOLICITUD_FRAC,'DD/MM/YYYY') || ' ... ' ||
                        --'FEC.REC(Dias Validos Antes'|| TO_CHAR(N_NRO_DIAS_FRACC_ANTES) || '):' || TO_CHAR(N_FEC_EVALUADA,'DD/MM/YYYY')
                         ;
                        PO_N_COD_ERROR := -13;
                        RETURN;
                    END IF;
                ELSE
                
                    N_FEC_EVALUADA := SCOB_PK_UTILITARIO.SCOB_FN_DIAS_VALIDOS(D_FEC_NOTIF_REC, N_NRO_DIAS_FRACC_DESP, 0);
                
                    IF D_FEC_SOLICITUD_FRAC >= N_FEC_EVALUADA THEN
                        C_IND_PORCENTAJE_VALIDADO := '3'; --SEGUNDO=40%
                        N_PORCENTAJE_VALIDADO     := N_POR_MONTO_FRACC_DESP;
                        N_MONTO_INICIAL_CANCELADO := N_TOTAL_AMORT_UIT_Y_COSTAS;
                    
                        IF N_TOTAL_AMORT_UIT_Y_COSTAS < (N_MONTO_CAPITAL_Y_COSTAS * (N_POR_MONTO_FRACC_DESP / 100)) THEN
                            --VALIDA EL IMPORTE DE PAGO
                            PO_V_MSJ_ERROR := 'No se puede realizar la accion. ' || 'Antes, se debe cancelar el ' || TO_CHAR(N_POR_MONTO_FRACC_DESP) || '%' ||
                                              ' de la multa mas costas y gastos. (' ||
                                              TO_CHAR((N_MONTO_CAPITAL_Y_COSTAS * (N_POR_MONTO_FRACC_DESP / 100))) || ')'
                            --'FEC.SOL:' || TO_CHAR(D_FEC_SOLICITUD_FRAC,'DD/MM/YYYY') || ' ... ' ||
                            --'FEC.REC(Dias Validos Desp.'|| TO_CHAR(N_NRO_DIAS_FRACC_DESP) || '):' || TO_CHAR(N_FEC_EVALUADA,'DD/MM/YYYY')
                             ;
                            PO_N_COD_ERROR := -14;
                            RETURN;
                        END IF;
                    END IF;
                END IF;
            END IF;
            --fin agregado 21.03.2012
        END IF;
    
        UPDATE T_SCOB_EXPED_FRACCIONAR EXFR
           SET MONTO_FRACCIONAR          = PI_N_MONTO_FRACCCIONAR,
               FEC_PERIODO_GRACIA        = TO_DATE(PI_C_FEC_PERIODO_GRACIA, 'DD/MM/YYYY'),
               NRO_DIA_PAGO              = PI_I_NRO_DIA_PAGO,
               NRO_CUOTAS                = PI_I_NRO_CUOTA,
               ESTADO_SOLICITUD          = PI_I_ESTADO_SOLICITUD, --atendida
               AUDFECMODIFICACION        = SYSDATE,
               AUDUSUMODIFICACION        = PI_V_AUDUSUCREACION,
               MONTO_INTERES_TIEL        = PI_N_TASA_TIEL,
               IND_PORCENTAJE_VALIDADO   = C_IND_PORCENTAJE_VALIDADO,
               MONTO_PORCENTAJE_VALIDADO = N_PORCENTAJE_VALIDADO,
               MONTO_INICIAL_CANCELADO   = N_MONTO_INICIAL_CANCELADO
         WHERE EXFR.ID_EXPED_FRACCIONAR = PI_N_ID_EXPED_FRACCIONAR;
    
        --actualiza los datos del cronograma
        UPDATE T_SCOB_EXPED_CRONOGRAMA CRPA
           SET CRPA.FLG_ACTUAL = '0'
         WHERE CRPA.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
           AND CRPA.COD_TIPO_CRONOGRAMA = SCOB_PK_CONSTANTES.C_COD_TIPO_CRONO_FRACCIONAR
           AND CRPA.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO;
    
        SELECT SCOB_SQ_EXPED_CRONOGRAMA.NEXTVAL INTO N_ID_EXPED_CRONOGRAMA_PAGO FROM DUAL;
        INSERT INTO T_SCOB_EXPED_CRONOGRAMA
            (ID_EXPED_CRONOGRAMA_PAGO, ID_EXPEDIENTE, COD_TIPO_CRONOGRAMA, ID_COD_TIPO_CRONOGRAMA, FLG_ACTUAL, ESTADO_CRONOGRAMA, ESTADO,
             AUDFECCREACION, AUDUSUCREACION)
        VALUES
            (N_ID_EXPED_CRONOGRAMA_PAGO, PI_N_ID_EXPEDIENTE, SCOB_PK_CONSTANTES.C_COD_TIPO_CRONO_FRACCIONAR,
              --COD_TIPO_CRONOGRAMA: DEL TIPO FRACCIONAMIENTO
             PI_N_ID_EXPED_FRACCIONAR,
              --ID_COD_TIPO_CRONOGRAMA: ID SOLITUD DE FRACCIONAMIENTO
             '1',
              --FLG_ACTUAL
             SCOB_PK_CONSTANTES.C_COD_EST_CRONO_PAGO_PENDIENTE,
              --ESTADO_CRONOGRAMA: 1=PENDIENTE;2=CERRADO
             SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO, SYSDATE, PI_V_AUDUSUCREACION);
    
        --genera el cronograma de pago
        SCOB_SP_S_SIMULAR_CRONOGRAMA(PI_N_ID_EXPEDIENTE,
                                     PI_N_MONTO_FRACCCIONAR,
                                     PI_N_TASA_TIEL,
                                     PI_C_FEC_PERIODO_GRACIA,
                                     PI_C_FEC_FRACCIONAMIENTO,
                                     PI_I_NRO_DIA_PAGO,
                                     PI_I_NRO_CUOTA,
                                     '0',
                                     PO_CU_RETORNO,
                                     PO_V_RETORNO,
                                     PO_V_MSJ_ERROR);
    
        IF PO_V_RETORNO < 0 THEN
            PO_N_RETORNO := PO_V_RETORNO;
            RETURN;
        END IF;
    
        INSERT INTO T_SCOB_EXPED_CRONOGRAMA_DET
            (ID_EXPED_CRONOGRAMA_PAGO_DET, ID_EXPED_CRONOGRAMA_PAGO, NRO_CUOTA, FEC_VENCIMIENTO,
             --
             SALDO_CRONO,
              --SALDO CRONOGRAMA
             MONTO_DEUDA_AMORTIZA_CRONO,
              --DEUDA AMORTIZADA CRONOGRAMA
             MONTO_AMORTIZA_CRONO,
              --CAPITAL AMORTIZADO CRONOGRAMA = CAPITAL!!!
             --
             MONTO_CUOTA, MONTO_INTERES, MONTO_INTERES_MORATORIO, MONTO_COSTAS, MONTO_TOTAL_DEUDA,
             ---
             SALDO,
              --SALDO CAPITAL
             SALDO_IC, SALDO_IM, SALDO_COSTAS, SALDO_TOTAL_DEUDA,
             --
             TOTAL_AMORTIZADO, TOTAL_AMORTIZADO_IC, TOTAL_AMORTIZADO_IM, TOTAL_AMORTIZADO_COSTAS,
             --
             ESTADO_CUOTA, ESTADO, AUDFECCREACION, AUDUSUCREACION)
            SELECT SCOB_SQ_EXPED_CRONOGRAMA_DET.NEXTVAL,
                   N_ID_EXPED_CRONOGRAMA_PAGO,
                   CRONO.NRO_CUOTA                      AS NRO_CUOTA,
                   CRONO.FEC_VENCIMIENTO                AS FEC_VENCIMIENTO,
                   CRONO.SALDO                          AS SALDO, --SALDO DEL CRONOGRAMA
                   CRONO.MONTO_CUOTA                    AS MONTO_DEUDA_AMORTIZACION, --DEUDA_AMORTIZADA DEL CRONOGRAMA
                   
                   --MONTO_AMORTIDADO DEL CRONOGRAMA=CAPITAL !!!!
                   TRUNC(ROUND(CRONO.MONTO_CUOTA, 2), SCOB_PK_CONSTANTES.C_NRO_DECIMAL_TRUNC) AS MONTO_AMORTIZACION,
                   
                   (TRUNC(ROUND(CRONO.MONTO_CUOTA, 2), SCOB_PK_CONSTANTES.C_NRO_DECIMAL_TRUNC) +
                   TRUNC(CRONO.MONTO_INTERES, SCOB_PK_CONSTANTES.C_NRO_DECIMAL_TRUNC)) AS MONTO_CUOTA,
                   --
                   TRUNC(CRONO.MONTO_INTERES, SCOB_PK_CONSTANTES.C_NRO_DECIMAL_TRUNC) AS MONTO_INTERES,
                   0.00, --MONTO_INTERES_MORATORIO
                   CRONO.MONTO_COSTAS AS MONTO_COSTAS,
                   
                   (TRUNC(ROUND(CRONO.MONTO_CUOTA, 2), SCOB_PK_CONSTANTES.C_NRO_DECIMAL_TRUNC) +
                   TRUNC(CRONO.MONTO_INTERES, SCOB_PK_CONSTANTES.C_NRO_DECIMAL_TRUNC) + CRONO.MONTO_COSTAS) AS MONTO_TOTAL_DEUDA,
                   --
                   TRUNC(ROUND(CRONO.MONTO_CUOTA, 2), SCOB_PK_CONSTANTES.C_NRO_DECIMAL_TRUNC) AS SALDO_CUOTA,
                   
                   TRUNC(CRONO.MONTO_INTERES, SCOB_PK_CONSTANTES.C_NRO_DECIMAL_TRUNC), --SALDO_IC,
                   0.00, --SALDO_IM,
                   CRONO.MONTO_COSTAS, --SALDO_COSTAS,
                   
                   (TRUNC(ROUND(CRONO.MONTO_CUOTA, 2), SCOB_PK_CONSTANTES.C_NRO_DECIMAL_TRUNC) +
                   TRUNC(CRONO.MONTO_INTERES, SCOB_PK_CONSTANTES.C_NRO_DECIMAL_TRUNC) + CRONO.MONTO_COSTAS) AS SALDO_TOTAL_DEUDA,
                   --
                   0.00, --TOTAL_AMORTIZADO,
                   0.00, --TOTAL_AMORTIZADO_IC,
                   0.00, --TOTAL_AMORTIZADO_IM,
                   0.00, --TOTAL_AMORTIZADO_COSTAS,
                   --
                   SCOB_PK_CONSTANTES.C_EST_PAGO_PENDIENTE, --Pago pendiente
                   SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO,
                   SYSDATE,
                   PI_V_AUDUSUCREACION
              FROM T_SCOB_TMP_SIMULAR_CRONOGRAMA CRONO
             WHERE CRONO.ID_SIMULACION = PO_V_RETORNO;
    
        DELETE FROM T_SCOB_TMP_SIMULAR_CRONOGRAMA CRONO WHERE CRONO.ID_SIMULACION = PO_V_RETORNO;
        
        --INICIO VICTOR BENDEZU - MIGRACION SICOB A SIA           
        USR_SIA_INTFZ.PKG_INTFZ_REG_MULTA_SICOB_SIA.SP_I_CRONOGRAMA_SICOB_A_SIA(PIN_NU_ID_MULTA => N_ID_MULTA,
                                                                                POUT_NU_COD_RESULT => PO_N_RETORNO,
                                                                                POUT_VC_MSG_RESULT => PO_V_MSJ_ERROR);
        
        IF PO_N_RETORNO < 0 THEN
           ROLLBACK;
           RETURN;
        END IF;
        --FIN VICTOR BENDEZU - MIGRACION SICOB A SIA
        
        
        PO_N_COD_ERROR := 1;
        PO_N_RETORNO   := PI_N_ID_EXPED_FRACCIONAR;
    
        COMMIT;
        --rollback;
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

    PROCEDURE SCOB_SP_S_CRONO_FRACCIONAR
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 19.05.2011
        -- Proposito    : listar el cronograma generado
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_N_ID_EXPEDIENTE       IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
     PI_N_ID_EXPED_FRACCIONAR IN T_SCOB_EXPED_FRACCIONAR.ID_EXPED_FRACCIONAR%TYPE,
     PO_CU_RETORNO            OUT CU_REC_SET) AS
        V_CUM             VARCHAR2(14);
        V_NU_ES_ACUMULADO NUMBER;
    BEGIN
        -- @dcelis Req.44 - ya no se usa.
        /*SELECT MULT.ANIO || SUBSTR(MULT.CUM,3,10)
        INTO V_CUM
        FROM T_SCOB_EXPEDIENTE_MULTA EXMU
        INNER JOIN T_SCOB_MULTA MULT
              ON MULT.ID_MULTA = EXMU.ID_MULTA
        WHERE EXMU.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
        AND EXMU.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO;*/
        -- @dcelis Req.44 - ya no se usa.
    
        SELECT COUNT(1)
          INTO V_NU_ES_ACUMULADO
          FROM T_SCOB_EXPEDIENTE_MULTA EXMU
         INNER JOIN T_SCOB_MULTA MULT
            ON MULT.ID_MULTA = EXMU.ID_MULTA
         WHERE EXMU.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
           AND EXMU.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO;
        -- SI HAY UNA SOLA MULTA, NO ES ACUMULADO
        IF V_NU_ES_ACUMULADO = 1 THEN
        
            SELECT MULT.ANIO || SUBSTR(MULT.CUM, 3, 10)
              INTO V_CUM
              FROM T_SCOB_EXPEDIENTE_MULTA EXMU
             INNER JOIN T_SCOB_MULTA MULT
                ON MULT.ID_MULTA = EXMU.ID_MULTA
             WHERE EXMU.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
               AND EXMU.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO;
        
            OPEN PO_CU_RETORNO FOR
                SELECT CDET.NRO_CUOTA       AS NRO_CUOTA,
                       CDET.FEC_VENCIMIENTO AS FEC_VENCIMIENTO,
                       --
                       CDET.MONTO_AMORTIZA_CRONO    AS MONTO_CAPITAL,
                       CDET.MONTO_INTERES           AS MONTO_INTERES,
                       CDET.MONTO_INTERES_MORATORIO AS MONTO_INTERES_MORATORIO,
                       --
                       CDET.TOTAL_AMORTIZADO_DEUDA AS TOTAL_AMORTIZADO,
                       --
                       CDET.MONTO_CUOTA       AS TOTAL_CUOTA,
                       CDET.MONTO_COSTAS      AS MONTO_COSTAS,
                       CDET.SALDO_TOTAL_DEUDA AS SALDO_CUOTA,
                       --
                       CDET.ESTADO_CUOTA  AS COD_ESTADO,
                       TD.TXT_DESCRIPCION AS NOM_ESTADO,
                       /*INI: TK2017-69874*/
                       V_CUM || TO_CHAR(LPAD(CDET.NRO_CUOTA, 2, '00')) AS COD_BANCO,
                       -- @dcelis Req.44
                       --EXPE.ANIO||EXPE.NRO_EXPEDIENTE||TO_CHAR(LPAD(CDET.NRO_CUOTA,2,'00')) AS COD_BANCO,
                       -- @dcelis Req.44
                       /*FIN: TK2017-69874*/
                       CASE
                           WHEN (CDET.ESTADO_CUOTA = 1 OR CDET.ESTADO_CUOTA = 2) THEN --PENDIENTE DE PAGO(IMPAGO O PARCIAL)
                            SCOB_PK_EXPE_FRACCIONAR.SCOB_FN_SUMA_ACUM_SALDO_CRONO(CDET.ID_EXPED_CRONOGRAMA_PAGO, CDET.NRO_CUOTA)
                           ELSE
                            0
                       END AS ACUMULADO
                  FROM T_SCOB_EXPED_CRONOGRAMA CRONO
                 INNER JOIN T_SCOB_EXPED_CRONOGRAMA_DET CDET
                    ON CDET.ID_EXPED_CRONOGRAMA_PAGO = CRONO.ID_EXPED_CRONOGRAMA_PAGO
                   AND CDET.ESTADO = '1'
                 INNER JOIN T_SCOB_TABLA_DET TD
                    ON TD.ID_TABLA = SCOB_PK_CONSTANTES.C_TBL_EST_PAGOS
                   AND TD.COD_INTERNO = CDET.ESTADO_CUOTA
                 INNER JOIN T_SCOB_EXPEDIENTE EXPE
                    ON CRONO.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
                 WHERE CRONO.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
                   AND CRONO.COD_TIPO_CRONOGRAMA = SCOB_PK_CONSTANTES.C_COD_TIPO_CRONO_FRACCIONAR --TIPO FRACCIONAMIENTO
                   AND CRONO.ID_COD_TIPO_CRONOGRAMA = PI_N_ID_EXPED_FRACCIONAR
                      --AND CRONO.FLG_ACTUAL = '1' --NO SE VISUALIZA EL ACTUAL PORQUE DEBE MOSTRAR EL CRONOGRAMA
                      --SEGUN SOLICITUD Y ESTE PODRIA NO SER EL ULTIMO GENERADO.
                   AND CRONO.ESTADO = '1'
                 ORDER BY CDET.NRO_CUOTA;
        ELSE
        OPEN PO_CU_RETORNO FOR
            SELECT 0 AS NRO_CUOTA,
                   CAST(NULL AS DATE) AS FEC_VENCIMIENTO,
                   --
                   0 AS MONTO_CAPITAL,
                   0 AS MONTO_INTERES,
                   0 AS MONTO_INTERES_MORATORIO,
                   --
                   0 AS TOTAL_AMORTIZADO,
                   --
                   0 AS TOTAL_CUOTA,
                   0 AS MONTO_COSTAS,
                   0 AS SALDO_CUOTA,
                   --
                   0 AS COD_ESTADO,
                   'ACUMULADO' AS NOM_ESTADO,
                   'EXPEDIENTE ACUMULADO' AS COD_BANCO,
                   0 AS ACUMULADO
              FROM DUAL;
        END IF;
    END;

    PROCEDURE SCOB_SP_D_CRONO_FRACCIONAR
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 18.05.2011
        -- Proposito    : eliminar el cronograma generado.
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_N_ID_EXPEDIENTE       IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
     PI_N_ID_EXPED_FRACCIONAR IN T_SCOB_EXPED_FRACCIONAR.ID_EXPED_FRACCIONAR%TYPE,
     PI_V_AUDUSUCREACION      IN T_SCOB_EXPED_FRACCIONAR.AUDUSUCREACION%TYPE,
     PO_N_RETORNO             OUT NUMBER,
     PO_N_COD_ERROR           OUT NUMBER,
     PO_V_MSJ_ERROR           OUT VARCHAR2) IS
        --  I_ESTADO_SOLICITUD                     INTEGER;
        I_EXISTE              INTEGER;
        I_COD_TIPO_CRONOGRAMA T_SCOB_EXPED_CRONOGRAMA.COD_TIPO_CRONOGRAMA%TYPE;
    BEGIN
        PO_V_MSJ_ERROR := '';
        PO_N_RETORNO   := 0;
        PO_N_COD_ERROR := -1;
    
        I_COD_TIPO_CRONOGRAMA := SCOB_PK_CONSTANTES.C_COD_TIPO_CRONO_FRACCIONAR;
    
        --obtener el estado actual de la solicitud.
        BEGIN
        
            SELECT COUNT(EXFR.ID_EXPED_FRACCIONAR)
              INTO I_EXISTE
              FROM T_SCOB_EXPED_FRACCIONAR EXFR
             INNER JOIN T_SCOB_EXPEDIENTE EXPE
                ON EXPE.ID_EXPEDIENTE = EXFR.ID_EXPEDIENTE
             WHERE EXFR.ID_EXPED_FRACCIONAR = PI_N_ID_EXPED_FRACCIONAR
               AND EXFR.ESTADO_SOLICITUD NOT IN (SCOB_PK_CONSTANTES.C_COD_EST_SOL_FRACC_REGISTRADO, SCOB_PK_CONSTANTES.C_COD_EST_SOL_FRACC_ATENDIDA)
            --AND EXPE.ESTADO_EXPEDIENTE = 4 --FRACCIONADO
            ;
        
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                I_EXISTE := 0;
        END;
    
        IF I_EXISTE > 0 THEN
            PO_V_MSJ_ERROR := 'No se puede realizar la accion. El cronograma no puede ser eliminado.';
            PO_N_COD_ERROR := -10;
            RETURN;
        END IF;
    
        --actualiza el estado de la solicitud.
        UPDATE T_SCOB_EXPED_FRACCIONAR EXFR
           SET ESTADO_SOLICITUD      = SCOB_PK_CONSTANTES.C_COD_EST_SOL_FRACC_REGISTRADO, --ESTADO REGISTRADO DE LA SOLICITUD DE FRACCIONAMIENTO
               NRO_DIA_PAGO          = NULL,
               NRO_CUOTAS            = NULL,
               MONTO_FRACCIONAR      = NULL,
               FEC_PERIODO_GRACIA    = NULL,
               MONTO_INTERES_TIEL    = NULL,
               FEC_INICIO_CUOTA      = NULL,
               COD_TIPO_PERIODO_PAGO = NULL,
               AUDFECMODIFICACION    = SYSDATE,
               AUDUSUMODIFICACION    = PI_V_AUDUSUCREACION
         WHERE EXFR.ID_EXPED_FRACCIONAR = PI_N_ID_EXPED_FRACCIONAR;
    
        --actualiza los datos del cronograma detalle
        UPDATE T_SCOB_EXPED_CRONOGRAMA_DET
           SET ESTADO             = SCOB_PK_CONSTANTES.C_ESTADO_INACTIVO,
               AUDFECMODIFICACION = SYSDATE,
               AUDUSUMODIFICACION = PI_V_AUDUSUCREACION
         WHERE ID_EXPED_CRONOGRAMA_PAGO IN (SELECT CRPA.ID_EXPED_CRONOGRAMA_PAGO
                                              FROM T_SCOB_EXPED_CRONOGRAMA CRPA
                                             WHERE CRPA.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
                                               AND CRPA.COD_TIPO_CRONOGRAMA = I_COD_TIPO_CRONOGRAMA --CRONOGRAMA POR FRACCIONAMIENTO
                                               AND CRPA.ID_COD_TIPO_CRONOGRAMA = PI_N_ID_EXPED_FRACCIONAR);
    
        --actualiza los datos del cronograma
        UPDATE T_SCOB_EXPED_CRONOGRAMA CRPA
           SET FLG_ACTUAL         = '0',
               ESTADO             = SCOB_PK_CONSTANTES.C_ESTADO_INACTIVO,
               AUDFECMODIFICACION = SYSDATE,
               AUDUSUMODIFICACION = PI_V_AUDUSUCREACION
         WHERE CRPA.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
           AND CRPA.COD_TIPO_CRONOGRAMA = I_COD_TIPO_CRONOGRAMA --CRONOGRAMA POR FRACCIONAMIENTO
           AND CRPA.ID_COD_TIPO_CRONOGRAMA = PI_N_ID_EXPED_FRACCIONAR;
    
        --eliminar los documentos generados.
        UPDATE T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
           SET EXDO.ESTADO             = SCOB_PK_CONSTANTES.C_ESTADO_INACTIVO,
               EXDO.AUDFECMODIFICACION = SYSDATE,
               EXDO.AUDUSUMODIFICACION = PI_V_AUDUSUCREACION
         WHERE EXDO.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
           AND EXDO.ID_EXPEDIENTE_DOCUMENTO IN (SELECT EFDOC.ID_EXPEDIENTE_DOCUMENTO
                                                  FROM T_SCOB_EXPED_FRACCIONAR_DOC EFDOC
                                                 WHERE EFDOC.ID_EXPED_FRACCIONAR = PI_N_ID_EXPED_FRACCIONAR
                                                   AND EFDOC.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO);
    
        UPDATE T_SCOB_EXPED_FRACCIONAR_DOC EFDOC
           SET EFDOC.ESTADO             = SCOB_PK_CONSTANTES.C_ESTADO_INACTIVO,
               EFDOC.AUDFECMODIFICACION = SYSDATE,
               EFDOC.AUDUSUMODIFICACION = PI_V_AUDUSUCREACION
         WHERE EFDOC.ID_EXPED_FRACCIONAR = PI_N_ID_EXPED_FRACCIONAR
           AND EFDOC.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO;
    
        --actualizar el estado de las garantias asociadas.
        UPDATE T_SCOB_EXPEDIENTE_GARANTIA GARA
           SET GARA.ESTADO        = SCOB_PK_CONSTANTES.C_ESTADO_INACTIVO,
               AUDFECMODIFICACION = SYSDATE,
               AUDUSUMODIFICACION = PI_V_AUDUSUCREACION
         WHERE GARA.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
           AND GARA.COD_TIPO_ENTIDAD = SCOB_PK_CONSTANTES.C_TIPO_GARANTIA_FRACCIONAR --'2'=FRACCIONAMIENTO
           AND GARA.ID_ENTIDAD = PI_N_ID_EXPED_FRACCIONAR
           AND GARA.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO;
    
        PO_N_COD_ERROR := 0;
        PO_N_RETORNO   := PI_N_ID_EXPED_FRACCIONAR;
    
        IF PI_V_AUDUSUCREACION <> SCOB_PK_CONSTANTES.C_COD_USUARIO_SISTEMA THEN
            COMMIT;
            --ROLLBACK;
        END IF;
    
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

    PROCEDURE SCOB_SP_S_SIMULAR_CRONOGRAMA
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 17.05.2011
        -- Proposito    : genera el cronograma
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_N_ID_EXPEDIENTE       IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
     PI_N_MONTO_FRACCCIONAR   IN T_SCOB_EXPED_FRACCIONAR.MONTO_FRACCIONAR%TYPE,
     PI_N_TASA_TIEL           IN T_SCOB_EXPED_FRACCIONAR.MONTO_INTERES_TIEL%TYPE,
     PI_C_FEC_PERIODO_GRACIA  IN CHAR,
     PI_C_FEC_FRACCIONAMIENTO IN CHAR, --envia la Fecha Recepcion Tramite Doc.
     PI_I_NRO_DIA_PAGO        IN T_SCOB_EXPED_FRACCIONAR.NRO_DIA_PAGO%TYPE,
     PI_I_NRO_CUOTA           IN T_SCOB_EXPED_FRACCIONAR.NRO_CUOTAS%TYPE,
     PI_C_ELIMINA             IN CHAR,
     PO_CU_RETORNO            OUT CU_REC_SET,
     PO_V_RETORNO             OUT VARCHAR2,
     PO_V_MSJ_ERROR           OUT VARCHAR2) AS
        N_TS_INT_EFEC_ANUAL   T_SCOB_EXPED_FRACCIONAR.MONTO_INTERES_TIEL%TYPE;
        N_TS_INT_EFEC_MENSUAL T_SCOB_EXPED_FRACCIONAR.MONTO_INTERES_TIEL%TYPE;
        N_TS_INT_EFEC_DIARIO  T_SCOB_EXPED_FRACCIONAR.MONTO_INTERES_TIEL%TYPE;
    
        N_NRO_DIAS      INTEGER;
        N_NRO_DIAS_ACUM INTEGER;
        ---
        N_MONTO_CUOTA T_SCOB_MULTA.MONTO_UIT%TYPE;
        N_FACTOR      T_SCOB_MULTA.MONTO_UIT%TYPE;
        N_FACTOR_ACUM T_SCOB_MULTA.MONTO_UIT%TYPE;
        N_INTERES     T_SCOB_MULTA.MONTO_UIT%TYPE;
        N_SALDO       T_SCOB_MULTA.MONTO_UIT%TYPE;
        N_SALDO_ANT   T_SCOB_MULTA.MONTO_UIT%TYPE;
        --  N_DEUDA                                 T_SCOB_MULTA.MONTO_UIT%TYPE;
        --  N_AMORTIZA                              T_SCOB_MULTA.MONTO_UIT%TYPE;
    
        N_CONT INTEGER;
        V_PK   T_SCOB_TMP_SIMULAR_CRONOGRAMA.ID_SIMULACION%TYPE;
    
        F_FECHA         DATE;
        F_FECHA_ANT     DATE;
        F_FECHA_AUX     DATE;
        F_FECHA_ANT_AUX DATE;
    
        PO_N_COD_ERROR NUMBER;
        PO_N_RETORNO   NUMBER;
    
        N_VALOR_UIT_CUOTA_MINIMA T_SCOB_MULTA_DETAL.VALOR_UIT%TYPE;
        N_VALOR_UIT_CUOTA        T_SCOB_MULTA_DETAL.VALOR_UIT%TYPE;
        --  N_VALOR_UIT_GARANTIA                    T_SCOB_MULTA_DETAL.VALOR_UIT%TYPE;
        N_NRO_CUOTA_MINIMO INTEGER;
        N_NRO_CUOTA_MAXIMO INTEGER;
    
        N_MONTO_UIT              T_SCOB_MULTA.MONTO_UIT%TYPE;
        N_SALDO_EXPEDIENTE       T_SCOB_MULTA.MONTO_UIT%TYPE;
        N_MONTO_CUOTA_MINIMA     T_SCOB_MULTA.MONTO_UIT%TYPE;
        N_MONTO_COSTAS           T_SCOB_MULTA.MONTO_UIT%TYPE;
        N_INTERES_PERIODO_GRACIA T_SCOB_MULTA.MONTO_UIT%TYPE;
    
        C_FLG_CUOTA_OK    BOOLEAN;
        I_CONTADOR        INTEGER;
        N_MONTO_CUOTA_TMP T_SCOB_MULTA.MONTO_UIT%TYPE;
        N_CAPITAL         T_SCOB_MULTA.MONTO_UIT%TYPE;
        N_SUM_CAPITAL     T_SCOB_MULTA.MONTO_UIT%TYPE;
        N_SUM_MONTO_CUOTA T_SCOB_MULTA.MONTO_UIT%TYPE;
        INT_FLG_INF       INTEGER;
        INT_FLG_SUP       INTEGER;
        C_NRO_DIA_PAGO    CHAR(2);
        N_NRO_DIAS_CUOTA  INTEGER;
    BEGIN
        PO_N_RETORNO := 0;
    
        N_TS_INT_EFEC_ANUAL   := PI_N_TASA_TIEL / 100;
        N_TS_INT_EFEC_MENSUAL := (POWER((1 + N_TS_INT_EFEC_ANUAL), (1 / 12)) - 1);
        N_TS_INT_EFEC_DIARIO  := (POWER((1 + N_TS_INT_EFEC_ANUAL), (1 / 360)) - 1);
    
        SELECT LPAD(TO_CHAR(PI_I_NRO_DIA_PAGO), 2, '00') INTO C_NRO_DIA_PAGO FROM DUAL;
    
        ----------------------------------------------------------------
        /*OBTENER LOS PARAMETROS DEL SISTEMA*/
        --obtener el monto por uit a la fecha de solicitud del fraccionamiento
        N_MONTO_UIT := NULL;
        BEGIN
            SELECT UIT.MONTO_UIT
              INTO N_MONTO_UIT
              FROM T_SCOB_UIT UIT
             WHERE TO_DATE(PI_C_FEC_FRACCIONAMIENTO, 'DD/MM/YYYY') BETWEEN UIT.FECHA_INICIO AND UIT.FECHA_FIN
               AND UIT.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                PO_V_RETORNO   := -9;
                PO_V_MSJ_ERROR := 'No se puede realizar la accion. No existe valor UIT registrado para la fecha de solicitud del fraccionamiento:  ' ||
                                  PI_C_FEC_FRACCIONAMIENTO;
                RAISE_APPLICATION_ERROR(-20021, PO_V_MSJ_ERROR);
        END;
    
        --A.obtener el valor uit para el calculo del monto minimo de cuota mensual
        SELECT SCOB_PK_UTILITARIO.SCOB_FN_TEXTO_A_NUMERO(TD.TXT_VALOR1)
          INTO N_VALOR_UIT_CUOTA_MINIMA
          FROM T_SCOB_TABLA_DET TD
         WHERE TD.ID_TABLA = SCOB_PK_CONSTANTES.C_TBL_PARAMETRO_SISTEMA
           AND TO_NUMBER(TD.COD_INTERNO) = (6);
        --B.obtener el valor uit minimo para aplicar numero maximo de cuotas
        SELECT SCOB_PK_UTILITARIO.SCOB_FN_TEXTO_A_NUMERO(TD.TXT_VALOR1),
               TO_NUMBER(TD.TXT_VALOR2),
               TO_NUMBER(TD.TXT_VALOR3)
          INTO N_VALOR_UIT_CUOTA,
               N_NRO_CUOTA_MINIMO,
               N_NRO_CUOTA_MAXIMO
          FROM T_SCOB_TABLA_DET TD
         WHERE TD.ID_TABLA = SCOB_PK_CONSTANTES.C_TBL_PARAMETRO_SISTEMA
           AND TO_NUMBER(TD.COD_INTERNO) = (7);
        ----------------------------------------------------------------
        /*VALIDACIONES DE APLICACION DEL FRACCIONAMIENTO (B)*/
        --2.Si saldo CAPITAL del expediente es menor a XX UIT
        --  las cuotas no deben ser mayores a....
        IF N_SALDO_EXPEDIENTE <= (NVL(N_MONTO_UIT, 1) * NVL(N_VALOR_UIT_CUOTA, 1)) THEN
            IF PI_I_NRO_CUOTA > N_NRO_CUOTA_MINIMO THEN
                PO_V_RETORNO   := -10;
                PO_V_MSJ_ERROR := 'No se puede realizar la accion. El nro de cuotas no puede ser mayor a ' || TO_CHAR(N_NRO_CUOTA_MINIMO);
                RAISE_APPLICATION_ERROR(-20021, PO_V_MSJ_ERROR);
            END IF;
        ELSE
            --3.Si saldo CAPITAL del expediente es mayor a XX UIT
            --  las cuotas no deben ser mayores a....
            IF PI_I_NRO_CUOTA > N_NRO_CUOTA_MAXIMO THEN
                PO_V_RETORNO   := -11;
                PO_V_MSJ_ERROR := 'No se puede realizar la accion. El nro de cuotas no puede ser mayor a ' || TO_CHAR(N_NRO_CUOTA_MAXIMO);
                RAISE_APPLICATION_ERROR(-20021, PO_V_MSJ_ERROR);
            END IF;
        END IF;
    
        /*obtener las costas del expediente*/
        SELECT
        -- MULT.SALDO_COSTAS
         SUM(MULT.SALDO_COSTAS)
          INTO N_MONTO_COSTAS
          FROM T_SCOB_MULTA MULT
         INNER JOIN T_SCOB_EXPEDIENTE_MULTA EXMU
            ON EXMU.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
           AND EXMU.ID_MULTA = MULT.ID_MULTA
           AND EXMU.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO;
        --------------------------------------------------------------------------------
        /*CALCULO DEL CRONOGRAMA*/
        --------------------------------------------------------------------------------
        SELECT TO_DATE(PI_C_FEC_FRACCIONAMIENTO, 'DD/MM/YYYY') INTO F_FECHA_ANT FROM DUAL; --fec.solic.
        SELECT TO_DATE(PI_C_FEC_FRACCIONAMIENTO, 'DD/MM/YYYY') INTO F_FECHA FROM DUAL; --fec.solic.
    
        IF PI_C_FEC_PERIODO_GRACIA IS NOT NULL THEN
            SELECT TO_DATE(PI_C_FEC_PERIODO_GRACIA, 'DD/MM/YYYY') INTO F_FECHA FROM DUAL;
            SELECT SUBSTR(PI_C_FEC_PERIODO_GRACIA, 1, 2) INTO C_NRO_DIA_PAGO FROM DUAL;
            SELECT TO_DATE(C_NRO_DIA_PAGO || '/' || TO_CHAR(F_FECHA, 'MM') || '/' || TO_CHAR(F_FECHA, 'YYYY'), 'DD/MM/YYYY') INTO F_FECHA FROM DUAL;
        
        ELSE
            SELECT ADD_MONTHS(TO_DATE((C_NRO_DIA_PAGO || '/' || TO_CHAR(F_FECHA, 'MM') || '/' || TO_CHAR(F_FECHA, 'YYYY')), 'DD/MM/YYYY'), 1)
              INTO F_FECHA
              FROM DUAL;
        END IF;
    
        --------------------------------------------------------------------------------
        --------------------------------------------------------------------------------
        N_SALDO_EXPEDIENTE := ROUND(PI_N_MONTO_FRACCCIONAR, SCOB_PK_CONSTANTES.C_NRO_DECIMAL_TRUNC);
        N_SALDO_ANT        := N_SALDO_EXPEDIENTE;
        SELECT TO_CHAR(PI_N_ID_EXPEDIENTE) + TO_CHAR(SYSDATE, 'DDMMYYHHMMSS') INTO V_PK FROM DUAL;
        --------------------------------------------------------------------------------
        --CALCULO INTERES POR PERIODO DE GRACIA
        N_INTERES_PERIODO_GRACIA := 0;
        IF PI_C_FEC_PERIODO_GRACIA IS NOT NULL THEN
            IF F_FECHA - F_FECHA_ANT > 30 THEN
                --Int_dias_transcurridos = Dat_fecha_venc_actual - Dat_fecha_venc_anterior - 30
                --Dbl_InteresPeriodoGracia = Round(Dbl_SaldoMulta * ((1 + Dbl_TeD) ^ Int_dias_transcurridos - 1), 2)
            
                N_NRO_DIAS               := (F_FECHA - F_FECHA_ANT) - 30;
                N_INTERES_PERIODO_GRACIA := ROUND(N_SALDO_ANT * (POWER((1 + N_TS_INT_EFEC_DIARIO), N_NRO_DIAS) - 1), 2);
            END IF;
        END IF;
    
        F_FECHA_AUX     := F_FECHA;
        F_FECHA_ANT_AUX := F_FECHA_ANT;
    
        --CALCULO DE LA CUOTA DEL MES
        N_MONTO_CUOTA := ((N_SALDO_ANT + N_INTERES_PERIODO_GRACIA) * (N_TS_INT_EFEC_MENSUAL) * POWER((1 + (N_TS_INT_EFEC_MENSUAL)), PI_I_NRO_CUOTA)) /
                         (POWER((1 + (N_TS_INT_EFEC_MENSUAL)), PI_I_NRO_CUOTA) - 1);
        N_MONTO_CUOTA := ROUND(N_MONTO_CUOTA, SCOB_PK_CONSTANTES.C_NRO_DECIMAL_TRUNC);
    
        /*VALIDACIONES DE APLICACION DEL FRACCIONAMIENTO*/
        --1.monto cuota es mayor que X uit
        N_MONTO_CUOTA_MINIMA := (NVL(N_MONTO_UIT, 1) * NVL(N_VALOR_UIT_CUOTA_MINIMA, 1));
        IF N_MONTO_CUOTA < N_MONTO_CUOTA_MINIMA THEN
            PO_V_RETORNO   := -12;
            PO_V_MSJ_ERROR := 'No se puede realizar la accion. El monto de la cuota no debe ser menor a ' || TO_CHAR(N_MONTO_CUOTA_MINIMA);
            RAISE_APPLICATION_ERROR(-20021, PO_V_MSJ_ERROR);
        END IF;
        /*
        DBMS_OUTPUT.put_line ('C_NRO_DIA_PAGO--->' || C_NRO_DIA_PAGO);
        DBMS_OUTPUT.put_line ('F_FECHA_ANT--->' || TO_CHAR(F_FECHA_ANT,'DD/MM/YYYY'));
        DBMS_OUTPUT.put_line ('F_FECHA--->' || TO_CHAR(F_FECHA,'DD/MM/YYYY'));
        DBMS_OUTPUT.put_line ('N_TS_INT_EFEC_ANUAL--->' || TO_CHAR(N_TS_INT_EFEC_ANUAL));
        DBMS_OUTPUT.put_line ('N_TS_INT_EFEC_MENSUAL--->' || TO_CHAR(N_TS_INT_EFEC_MENSUAL));
        DBMS_OUTPUT.put_line ('N_TS_INT_EFEC_DIARIO--->' || TO_CHAR(N_TS_INT_EFEC_DIARIO));
        DBMS_OUTPUT.put_line ('PI_I_NRO_CUOTA--->' || TO_CHAR(PI_I_NRO_CUOTA));
        DBMS_OUTPUT.put_line ('N_SALDO_ANT--->' || TO_CHAR(N_SALDO_ANT));
        DBMS_OUTPUT.put_line ('N_MONTO_CUOTA--->' || TO_CHAR(N_MONTO_CUOTA));
        DBMS_OUTPUT.put_line ('N_INTERES_PERIODO_GRACIA--->' || TO_CHAR(N_INTERES_PERIODO_GRACIA));
        */
    
        I_CONTADOR     := 1;
        C_FLG_CUOTA_OK := FALSE;
        N_SALDO        := N_SALDO_ANT;
        N_INTERES      := ROUND(N_SALDO * (N_TS_INT_EFEC_MENSUAL), SCOB_PK_CONSTANTES.C_NRO_DECIMAL_TRUNC);
        --    N_NRO_DIAS_ACUM := 0;
        N_FACTOR_ACUM     := 0;
        N_SUM_CAPITAL     := 0;
        N_SUM_MONTO_CUOTA := 0;
    
        WHILE (NOT C_FLG_CUOTA_OK) AND
              I_CONTADOR < 3
        LOOP
            --elimina el cronograma generado anteriormente.
            DELETE FROM T_SCOB_TMP_SIMULAR_CRONOGRAMA SCRO WHERE SCRO.ID_SIMULACION = V_PK;
        
            --generacion del cronograma.
            N_MONTO_CUOTA_TMP := ROUND(N_MONTO_CUOTA, SCOB_PK_CONSTANTES.C_NRO_DECIMAL_TRUNC);
            N_CONT            := 1;
            LOOP
                IF N_CONT > PI_I_NRO_CUOTA THEN
                    EXIT;
                END IF;
            
                N_MONTO_CUOTA := ROUND(N_MONTO_CUOTA, 2);
            
                --CALCULO INTERES CUOTA
                SCOB_PK_UTILITARIO.SCOB_SP_S_RETORNA_DIA_UTIL(F_FECHA, F_FECHA);
                N_NRO_DIAS       := F_FECHA - F_FECHA_ANT;
                N_NRO_DIAS_CUOTA := N_NRO_DIAS;
                N_INTERES        := ROUND(N_SALDO_ANT * (POWER((1 + N_TS_INT_EFEC_DIARIO), N_NRO_DIAS) - 1), 2);
                ---
                N_NRO_DIAS    := F_FECHA - TO_DATE(PI_C_FEC_FRACCIONAMIENTO, 'DD/MM/YYYY');
                N_FACTOR      := POWER((1 + N_TS_INT_EFEC_ANUAL), - (N_NRO_DIAS / 360));
                N_FACTOR_ACUM := N_FACTOR_ACUM + N_FACTOR;
            
                IF N_INTERES > N_MONTO_CUOTA THEN
                    N_SALDO_ANT := N_SALDO_ANT + (N_INTERES - N_MONTO_CUOTA);
                    N_INTERES   := N_MONTO_CUOTA;
                END IF;
            
                N_INTERES := ROUND(N_INTERES, 2);
                N_CAPITAL := N_MONTO_CUOTA - N_INTERES;
            
                IF N_CONT = PI_I_NRO_CUOTA THEN
                    N_CAPITAL     := N_SALDO_EXPEDIENTE - N_SUM_CAPITAL;
                    N_MONTO_CUOTA := N_CAPITAL + N_INTERES;
                END IF;
            
                --DBMS_OUTPUT.put_line ('CUOTA---> ' || TO_CHAR(N_CONT)  || ' -- ' ||  TO_CHAR(F_FECHA,'DD/MM/YYYY'));
                --DBMS_OUTPUT.put_line ('--' || TO_CHAR(N_CAPITAL) || ' -- ' || TO_CHAR(N_INTERES) || ' -- ' || TO_CHAR(N_MONTO_CUOTA));
                --inserta el cronograma
                SCOB_SP_I_SIMULAR_CRONOGRAMA(V_PK,
                                             PI_N_ID_EXPEDIENTE,
                                             N_CONT,
                                             TO_CHAR(F_FECHA, 'DD/MM/YYYY'),
                                             N_CAPITAL,
                                             0.00, --N_MONTO_COSTAS,
                                             N_INTERES,
                                             0.00, --N_SALDO,
                                             0.00, --N_DEUDA,
                                             0.00, --N_AMORTIZA,
                                             N_NRO_DIAS_CUOTA,
                                             PO_N_RETORNO,
                                             PO_N_COD_ERROR,
                                             PO_V_MSJ_ERROR);
            
                N_SUM_MONTO_CUOTA := N_SUM_MONTO_CUOTA + N_MONTO_CUOTA;
                N_SUM_CAPITAL     := N_SUM_CAPITAL + N_CAPITAL;
                N_SALDO_ANT       := N_SALDO_ANT - N_CAPITAL;
            
                --
                F_FECHA_ANT := F_FECHA;
                --SETEA EL DIA DE PAGO
                SELECT ADD_MONTHS(TO_DATE((C_NRO_DIA_PAGO || '/' || TO_CHAR(F_FECHA, 'MM') || '/' || TO_CHAR(F_FECHA, 'YYYY')), 'DD/MM/YYYY'), 1)
                  INTO F_FECHA
                  FROM DUAL;
                --SELECT ADD_MONTHS(F_FECHA,1) INTO F_FECHA FROM DUAL;
            
                N_CONT := N_CONT + 1;
            END LOOP;
        
            IF N_MONTO_CUOTA_TMP - N_MONTO_CUOTA <> 0 THEN
                IF I_CONTADOR = 1 THEN
                    N_MONTO_CUOTA := N_SALDO_EXPEDIENTE / N_FACTOR_ACUM;
                ELSE
                    IF N_MONTO_CUOTA_TMP < N_MONTO_CUOTA THEN
                        N_MONTO_CUOTA := N_MONTO_CUOTA_TMP + ROUND(CASE
                                                                       WHEN I_CONTADOR = 1 THEN
                                                                        POWER(ABS(N_MONTO_CUOTA_TMP - N_MONTO_CUOTA), (1 / 2))
                                                                       ELSE
                                                                        POWER(ABS(N_MONTO_CUOTA_TMP - N_MONTO_CUOTA), (1 / PI_I_NRO_CUOTA))
                                                                   END,
                                                                   2);
                        INT_FLG_SUP   := 1;
                    ELSE
                        IF INT_FLG_INF = 1 THEN
                            N_MONTO_CUOTA := N_MONTO_CUOTA_TMP - CASE
                                                 WHEN I_CONTADOR > 15 THEN
                                                  0.11
                                                 ELSE
                                                  ABS(N_MONTO_CUOTA_TMP - N_MONTO_CUOTA) / PI_I_NRO_CUOTA
                                             END;
                        ELSE
                            N_MONTO_CUOTA := N_MONTO_CUOTA_TMP - ROUND(
                                                                       
                                                                       CASE
                                                                           WHEN I_CONTADOR = 1 THEN
                                                                            POWER(ABS(N_MONTO_CUOTA_TMP - N_MONTO_CUOTA), (1 / 2))
                                                                           ELSE
                                                                            POWER(ABS(N_MONTO_CUOTA_TMP - N_MONTO_CUOTA), (1 / PI_I_NRO_CUOTA))
                                                                       END,
                                                                       2);
                        END IF;
                        INT_FLG_INF := 1;
                    END IF;
                END IF;
                C_FLG_CUOTA_OK := FALSE;
            ELSE
                C_FLG_CUOTA_OK := TRUE;
            END IF;
        
            N_SUM_CAPITAL     := 0;
            N_SUM_MONTO_CUOTA := 0;
            N_SALDO_ANT       := N_SALDO_EXPEDIENTE;
            F_FECHA_ANT       := F_FECHA_ANT_AUX;
            F_FECHA           := F_FECHA_AUX;
            N_MONTO_CUOTA     := ROUND(N_MONTO_CUOTA, 2);
            I_CONTADOR        := I_CONTADOR + 1;
            N_NRO_DIAS_ACUM   := 0;
            N_FACTOR_ACUM     := 0;
        END LOOP;
    
        --A LA PRIMERA CUOTA LE AGREGA LAS COSTAS
        UPDATE T_SCOB_TMP_SIMULAR_CRONOGRAMA CRONO
           SET MONTO_COSTAS = N_MONTO_COSTAS
         WHERE CRONO.ID_SIMULACION = V_PK
           AND CRONO.NRO_CUOTA = 1;
    
        --
        OPEN PO_CU_RETORNO FOR
            SELECT CRONO.NRO_CUOTA AS NRO_CUOTA,
                   CRONO.FEC_VENCIMIENTO AS FEC_VENCIMIENTO,
                   CRONO.SALDO AS SALDO,
                   CRONO.MONTO_DEUDA_AMORTIZACION AS MONTO_DEUDA_AMORTIZACION,
                   TRUNC(ROUND(CRONO.MONTO_CUOTA, 2), SCOB_PK_CONSTANTES.C_NRO_DECIMAL_TRUNC) AS MONTO_AMORTIZACION,
                   CRONO.MONTO_INTERES AS MONTO_INTERES,
                   TRUNC(ROUND(CRONO.MONTO_CUOTA, 2), SCOB_PK_CONSTANTES.C_NRO_DECIMAL_TRUNC) +
                   TRUNC(ROUND(CRONO.MONTO_INTERES, 2), SCOB_PK_CONSTANTES.C_NRO_DECIMAL_TRUNC) AS MONTO_CUOTA
              FROM T_SCOB_TMP_SIMULAR_CRONOGRAMA CRONO
             WHERE CRONO.ID_SIMULACION = V_PK
             ORDER BY CRONO.NRO_CUOTA;
    
        IF PI_C_ELIMINA = '1' THEN
            DELETE FROM T_SCOB_TMP_SIMULAR_CRONOGRAMA CRONO WHERE CRONO.ID_SIMULACION = V_PK;
        END IF;
    
        COMMIT;
    
        PO_V_RETORNO := V_PK;
    EXCEPTION
        WHEN OTHERS THEN
            PO_N_COD_ERROR := SQLCODE;
        
            IF PO_N_COD_ERROR = -20021 THEN
                --raise_error
                PO_N_COD_ERROR := PO_V_RETORNO;
                OPEN PO_CU_RETORNO FOR
                    SELECT 0       AS NRO_CUOTA,
                           SYSDATE AS FEC_VENCIMIENTO,
                           0       AS SALDO,
                           0       AS MONTO_DEUDA_AMORTIZACION,
                           0       AS MONTO_AMORTIZACION,
                           0       AS MONTO_INTERES,
                           0       AS MONTO_CUOTA
                      FROM T_SCOB_TMP_SIMULAR_CRONOGRAMA CRONO
                     WHERE CRONO.ID_SIMULACION = -1;
            
                ROLLBACK;
                RETURN;
            END IF;
        
            PO_V_RETORNO := -1;
        
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

    PROCEDURE SCOB_SP_I_SIMULAR_CRONOGRAMA
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 17.05.2011
        -- Proposito    : insertar la simulacion del cronograma
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_V_ID_SIMULACION            IN T_SCOB_TMP_SIMULAR_CRONOGRAMA.ID_SIMULACION%TYPE,
     PI_N_ID_EXPEDIENTE            IN T_SCOB_TMP_SIMULAR_CRONOGRAMA.ID_EXPEDIENTE%TYPE,
     PI_I_NRO_CUOTA                IN T_SCOB_TMP_SIMULAR_CRONOGRAMA.NRO_CUOTA%TYPE,
     PI_C_FEC_VENCIMIENTO          IN CHAR,
     PI_N_MONTO_CUOTA              IN T_SCOB_TMP_SIMULAR_CRONOGRAMA.MONTO_CUOTA%TYPE,
     PI_N_MONTO_COSTAS             IN T_SCOB_TMP_SIMULAR_CRONOGRAMA.MONTO_COSTAS%TYPE,
     PI_N_MONTO_INTERES            IN T_SCOB_TMP_SIMULAR_CRONOGRAMA.MONTO_INTERES%TYPE,
     PI_N_SALDO                    IN T_SCOB_TMP_SIMULAR_CRONOGRAMA.SALDO%TYPE,
     PI_N_MONTO_DEUDA_AMORTIZACION IN T_SCOB_TMP_SIMULAR_CRONOGRAMA.MONTO_DEUDA_AMORTIZACION%TYPE,
     PI_N_MONTO_AMORTIZACION       IN T_SCOB_TMP_SIMULAR_CRONOGRAMA.MONTO_AMORTIZACION%TYPE,
     PI_N_NRO_DIAS_TRANSCURRIDOS   IN INTEGER,
     PO_N_RETORNO                  OUT NUMBER,
     PO_N_COD_ERROR                OUT NUMBER,
     PO_V_MSJ_ERROR                OUT VARCHAR2) IS
    BEGIN
        PO_V_MSJ_ERROR := '';
        PO_N_RETORNO   := 0;
        PO_N_COD_ERROR := -1;
    
        INSERT INTO T_SCOB_TMP_SIMULAR_CRONOGRAMA
            (ID_SIMULACION, ID_EXPEDIENTE, NRO_CUOTA, FEC_VENCIMIENTO, MONTO_CUOTA, MONTO_COSTAS, MONTO_INTERES, SALDO, MONTO_DEUDA_AMORTIZACION,
             MONTO_AMORTIZACION, NRO_DIAS)
        VALUES
            (PI_V_ID_SIMULACION, PI_N_ID_EXPEDIENTE, PI_I_NRO_CUOTA, TO_DATE(PI_C_FEC_VENCIMIENTO, 'DD/MM/YYYY'),
             --
             /*
                 TRUNC(PI_N_MONTO_INTERES,SCOB_PK_CONSTANTES.C_NRO_DECIMAL_TRUNC) +
                 TRUNC(PI_N_MONTO_AMORTIZACION,SCOB_PK_CONSTANTES.C_NRO_DECIMAL_TRUNC),
                 */ PI_N_MONTO_CUOTA,
              --,SCOB_PK_CONSTANTES.C_NRO_DECIMAL_TRUNC),
             --
             PI_N_MONTO_COSTAS,
              --,SCOB_PK_CONSTANTES.C_NRO_DECIMAL_TRUNC),
             PI_N_MONTO_INTERES,
              --,SCOB_PK_CONSTANTES.C_NRO_DECIMAL_TRUNC),
             PI_N_SALDO,
              --,SCOB_PK_CONSTANTES.C_NRO_DECIMAL_TRUNC),
             PI_N_MONTO_DEUDA_AMORTIZACION,
              --,SCOB_PK_CONSTANTES.C_NRO_DECIMAL_TRUNC),
             PI_N_MONTO_AMORTIZACION,
              --,SCOB_PK_CONSTANTES.C_NRO_DECIMAL_TRUNC)
             PI_N_NRO_DIAS_TRANSCURRIDOS);
    
        PO_N_COD_ERROR := 0;
        PO_N_RETORNO   := 1;
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

    PROCEDURE SCOB_SP_S_SOLIC_FRACCIONAR_GEN
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 17.06.2011
        -- Proposito    : muestra los datos de la aprobacion de la solucitud por fraccinamiento
        -----------------------------------------------------------
        -- Modificacion :
        --@0001: 05.02.2013: Mostrar el saldo del capital y no total de la multa.
        -----------------------------------------------------------
        */
    (PI_N_ID_EXPEDIENTE       IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
     PI_N_ID_EXPED_FRACCIONAR IN T_SCOB_EXPED_FRACCIONAR.ID_EXPED_FRACCIONAR%TYPE,
     PO_CU_RETORNO            OUT CU_REC_SET) AS
        N_ID_MULTA T_SCOB_MULTA.ID_MULTA%TYPE;
    BEGIN
    
        SELECT EXMU.ID_MULTA
          INTO N_ID_MULTA
          FROM T_SCOB_EXPEDIENTE_MULTA EXMU
         WHERE EXMU.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
           AND EXMU.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
              -- @dcelis Req.44
           AND ROWNUM = 1;
        -- @dcelis Req.44
    
        OPEN PO_CU_RETORNO FOR
            SELECT NRO_SOLICITUD         AS NRO_SOLICITUD,
                   FEC_INGRESO_TRAMITE   AS FEC_SOLIC_FRACCIONAMIENTO,
                   FEC_PERIODO_GRACIA    AS FEC_PERIODO_GRACIA,
                   MONTO_INTERES_TIEL    AS MONTO_PORC_INTERES,
                   NRO_DIA_PAGO          AS DIA_PAGO,
                   NRO_CUOTAS            AS NRO_CUOTAS,
                   EXFR.MONTO_FRACCIONAR AS MONTO_FRACCIONAR, --CAPITAL FRACCIONADO
                   --EXPE.SALDO AS SALDO, --@0001: MUESTRA EL SALDO DEL CAPITAL
                   -- @dcelis Req.44
                   (SELECT SUM(B.SALDO)
                      FROM T_SCOB_EXPEDIENTE_MULTA A
                     INNER JOIN T_SCOB_MULTA B
                        ON A.ID_MULTA = B.ID_MULTA
                     WHERE A.ID_EXPEDIENTE = EXFR.ID_EXPEDIENTE
                       AND B.ESTADO = '1') AS SALDO,
                   -- @dcelis Req.44
                   EXDO.NRO_RESOLUCION AS NRO_RESOLUCION,
                   
                   (SELECT EXCRD.MONTO_COSTAS
                      FROM T_SCOB_EXPED_CRONOGRAMA EXCR
                     INNER JOIN T_SCOB_EXPED_CRONOGRAMA_DET EXCRD
                        ON EXCRD.ID_EXPED_CRONOGRAMA_PAGO = EXCR.ID_EXPED_CRONOGRAMA_PAGO
                       AND EXCRD.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
                       AND EXCRD.NRO_CUOTA = 1
                     WHERE EXCR.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
                       AND EXCR.COD_TIPO_CRONOGRAMA = 1
                       AND EXCR.ID_COD_TIPO_CRONOGRAMA = PI_N_ID_EXPED_FRACCIONAR
                       AND EXCR.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
                       AND EXCR.FLG_ACTUAL = '1') AS MONTO_COSTAS,
                   
                   NVL(EXFR.NRO_RESOLUCION_GAF, ' ') AS NRO_RESOL_GAF,
                   SCOB_PK_EXPEDIENTE.SCOB_FN_SANCIONADOS_MULTA(N_ID_MULTA, 0) AS NOM_SANCIONADO
            
              FROM T_SCOB_EXPED_FRACCIONAR EXFR
            
              LEFT JOIN T_SCOB_EXPED_FRACCIONAR_DOC EFDD
                ON EFDD.ID_EXPED_FRACCIONAR = EXFR.ID_EXPED_FRACCIONAR
               AND EFDD.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
               AND EFDD.COD_TIPO_ASOCIACION = 3 --RESOLUCION DE APROBACION FRACCIONAMIENTO
            
              LEFT JOIN T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
                ON EXDO.ID_EXPEDIENTE_DOCUMENTO = EFDD.ID_EXPEDIENTE_DOCUMENTO
            
              LEFT JOIN T_SCOB_EXPEDIENTE EXPE
                ON EXPE.ID_EXPEDIENTE = EXFR.ID_EXPEDIENTE --@0001: SE CAMBIO EL CAMPO ID_EXPEDIENTE
            
             WHERE EXFR.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
               AND EXFR.ID_EXPED_FRACCIONAR = PI_N_ID_EXPED_FRACCIONAR;
    
    END;

    PROCEDURE SCOB_SP_I_RECALCULAR_CRONO
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 04.01.2012
        -- Proposito    : regenera el cronograma en base a los ultimos saldos generados para el expediente.
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_N_ID_EXPEDIENTE       IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
     PI_N_ID_EXPED_FRACCIONAR IN T_SCOB_EXPED_FRACCIONAR.ID_EXPED_FRACCIONAR%TYPE,
     PI_V_AUDUSUMODIFICACION  IN T_SCOB_EXPED_FRACCIONAR.AUDUSUMODIFICACION%TYPE,
     PO_N_RETORNO             OUT NUMBER,
     PO_N_COD_ERROR           OUT NUMBER,
     PO_V_MSJ_ERROR           OUT VARCHAR2) IS
        N_ID_EXPED_CRONOGRAMA_PAGO T_SCOB_EXPED_CRONOGRAMA.ID_EXPED_CRONOGRAMA_PAGO%TYPE;
        PO_CU_RETORNO              CU_REC_SET;
        PO_V_RETORNO               VARCHAR2(50);
        --  I_ESTADO_SOLICITUD                     INTEGER;
        --  I_EXISTE                               INTEGER;
    
        PI_N_MONTO_FRACCCIONAR   T_SCOB_EXPED_FRACCIONAR.MONTO_FRACCIONAR%TYPE;
        PI_C_FEC_PERIODO_GRACIA  VARCHAR2(10);
        PI_C_FEC_FRACCIONAMIENTO VARCHAR2(10);
        PI_I_NRO_DIA_PAGO        T_SCOB_EXPED_FRACCIONAR.NRO_DIA_PAGO%TYPE;
        PI_I_NRO_CUOTA           T_SCOB_EXPED_FRACCIONAR.NRO_CUOTAS%TYPE;
        PI_N_TASA_TIEL           T_SCOB_EXPED_FRACCIONAR.MONTO_INTERES_TIEL%TYPE;
    BEGIN
        PO_V_MSJ_ERROR := '';
        PO_N_RETORNO   := 0;
        PO_N_COD_ERROR := -1;
    
        --eliminar cronograma actual generado
        UPDATE T_SCOB_EXPED_CRONOGRAMA_DET ECROD
           SET ECROD.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_INACTIVO
         WHERE ECROD.ID_EXPED_CRONOGRAMA_PAGO IN
               (SELECT ECRO.ID_EXPED_CRONOGRAMA_PAGO
                  FROM T_SCOB_EXPED_CRONOGRAMA ECRO
                 WHERE ECRO.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
                   AND ECRO.ID_COD_TIPO_CRONOGRAMA = PI_N_ID_EXPED_FRACCIONAR
                   AND ECRO.COD_TIPO_CRONOGRAMA = SCOB_PK_CONSTANTES.C_COD_TIPO_CRONO_FRACCIONAR)
           AND ECROD.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO;
    
        UPDATE T_SCOB_EXPED_CRONOGRAMA ECRO
           SET ECRO.ESTADO     = SCOB_PK_CONSTANTES.C_ESTADO_INACTIVO,
               ECRO.FLG_ACTUAL = '0'
         WHERE ECRO.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
           AND ECRO.ID_COD_TIPO_CRONOGRAMA = PI_N_ID_EXPED_FRACCIONAR
           AND ECRO.COD_TIPO_CRONOGRAMA = SCOB_PK_CONSTANTES.C_COD_TIPO_CRONO_FRACCIONAR;
    
        --obtener el saldo del expediente
        SELECT EXPE.SALDO INTO PI_N_MONTO_FRACCCIONAR FROM T_SCOB_EXPEDIENTE EXPE WHERE EXPE.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE;
    
        SELECT TO_CHAR(FEC_PERIODO_GRACIA, 'DD/MM/YYYY'),
               TO_CHAR(FEC_RECEPCION_TRAMITE, 'DD/MM/YYYY'),
               NRO_DIA_PAGO,
               NRO_CUOTAS,
               MONTO_INTERES_TIEL
          INTO PI_C_FEC_PERIODO_GRACIA,
               PI_C_FEC_FRACCIONAMIENTO,
               PI_I_NRO_DIA_PAGO,
               PI_I_NRO_CUOTA,
               PI_N_TASA_TIEL
          FROM T_SCOB_EXPED_FRACCIONAR EXFR
         WHERE EXFR.ID_EXPED_FRACCIONAR = PI_N_ID_EXPED_FRACCIONAR;
    
        UPDATE T_SCOB_EXPED_FRACCIONAR SET MONTO_FRACCIONAR = PI_N_MONTO_FRACCCIONAR WHERE ID_EXPED_FRACCIONAR = PI_N_ID_EXPED_FRACCIONAR;
    
        --actualiza los datos del cronograma
        UPDATE T_SCOB_EXPED_CRONOGRAMA CRPA
           SET CRPA.FLG_ACTUAL = '0'
         WHERE CRPA.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
           AND CRPA.COD_TIPO_CRONOGRAMA = '1'
           AND CRPA.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO;
    
        SELECT SCOB_SQ_EXPED_CRONOGRAMA.NEXTVAL INTO N_ID_EXPED_CRONOGRAMA_PAGO FROM DUAL;
        INSERT INTO T_SCOB_EXPED_CRONOGRAMA
            (ID_EXPED_CRONOGRAMA_PAGO, ID_EXPEDIENTE, COD_TIPO_CRONOGRAMA, ID_COD_TIPO_CRONOGRAMA, FLG_ACTUAL, ESTADO_CRONOGRAMA, ESTADO,
             AUDFECCREACION, AUDUSUCREACION)
        VALUES
            (N_ID_EXPED_CRONOGRAMA_PAGO, PI_N_ID_EXPEDIENTE, SCOB_PK_CONSTANTES.C_COD_TIPO_CRONO_FRACCIONAR,
              --COD_TIPO_CRONOGRAMA: DEL TIPO FRACCIONAMIENTO
             PI_N_ID_EXPED_FRACCIONAR,
              --ID_COD_TIPO_CRONOGRAMA: ID SOLITUD DE FRACCIONAMIENTO
             '1',
              --FLG_ACTUAL
             SCOB_PK_CONSTANTES.C_COD_EST_CRONO_PAGO_PENDIENTE,
              --ESTADO_CRONOGRAMA: 1=PENDIENTE;2=CERRADO
             SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO, SYSDATE, PI_V_AUDUSUMODIFICACION);
    
        --genera el cronograma de pago
        SCOB_SP_S_SIMULAR_CRONOGRAMA(PI_N_ID_EXPEDIENTE,
                                     PI_N_MONTO_FRACCCIONAR,
                                     PI_N_TASA_TIEL,
                                     PI_C_FEC_PERIODO_GRACIA,
                                     PI_C_FEC_FRACCIONAMIENTO,
                                     PI_I_NRO_DIA_PAGO,
                                     PI_I_NRO_CUOTA,
                                     '0',
                                     PO_CU_RETORNO,
                                     PO_V_RETORNO,
                                     PO_V_MSJ_ERROR);
    
        IF PO_V_RETORNO < 0 THEN
            PO_N_RETORNO := PO_V_RETORNO;
            RETURN;
        END IF;
    
        INSERT INTO T_SCOB_EXPED_CRONOGRAMA_DET
            (ID_EXPED_CRONOGRAMA_PAGO_DET, ID_EXPED_CRONOGRAMA_PAGO, NRO_CUOTA, FEC_VENCIMIENTO,
             --
             SALDO_CRONO,
              --SALDO CRONOGRAMA
             MONTO_DEUDA_AMORTIZA_CRONO,
              --DEUDA AMORTIZADA CRONOGRAMA
             MONTO_AMORTIZA_CRONO,
              --CAPITAL AMORTIZADO CRONOGRAMA = CAPITAL!!!
             --
             MONTO_CUOTA, MONTO_INTERES, MONTO_INTERES_MORATORIO, MONTO_COSTAS, MONTO_TOTAL_DEUDA,
             ---
             SALDO,
              --SALDO CAPITAL
             SALDO_IC, SALDO_IM, SALDO_COSTAS, SALDO_TOTAL_DEUDA,
             --
             TOTAL_AMORTIZADO, TOTAL_AMORTIZADO_IC, TOTAL_AMORTIZADO_IM, TOTAL_AMORTIZADO_COSTAS,
             --
             ESTADO_CUOTA, ESTADO, AUDFECCREACION, AUDUSUCREACION)
            SELECT SCOB_SQ_EXPED_CRONOGRAMA_DET.NEXTVAL,
                   N_ID_EXPED_CRONOGRAMA_PAGO,
                   CRONO.NRO_CUOTA                      AS NRO_CUOTA,
                   CRONO.FEC_VENCIMIENTO                AS FEC_VENCIMIENTO,
                   CRONO.SALDO                          AS SALDO, --SALDO DEL CRONOGRAMA
                   CRONO.MONTO_CUOTA                    AS MONTO_DEUDA_AMORTIZACION, --DEUDA_AMORTIZADA DEL CRONOGRAMA
                   
                   --MONTO_AMORTIDADO DEL CRONOGRAMA=CAPITAL !!!!
                   TRUNC(ROUND(CRONO.MONTO_CUOTA, 2), SCOB_PK_CONSTANTES.C_NRO_DECIMAL_TRUNC) AS MONTO_AMORTIZACION,
                   
                   (TRUNC(ROUND(CRONO.MONTO_CUOTA, 2), SCOB_PK_CONSTANTES.C_NRO_DECIMAL_TRUNC) +
                   TRUNC(CRONO.MONTO_INTERES, SCOB_PK_CONSTANTES.C_NRO_DECIMAL_TRUNC)) AS MONTO_CUOTA,
                   --
                   TRUNC(CRONO.MONTO_INTERES, SCOB_PK_CONSTANTES.C_NRO_DECIMAL_TRUNC) AS MONTO_INTERES,
                   0.00, --MONTO_INTERES_MORATORIO
                   CRONO.MONTO_COSTAS AS MONTO_COSTAS,
                   
                   (TRUNC(ROUND(CRONO.MONTO_CUOTA, 2), SCOB_PK_CONSTANTES.C_NRO_DECIMAL_TRUNC) +
                   TRUNC(CRONO.MONTO_INTERES, SCOB_PK_CONSTANTES.C_NRO_DECIMAL_TRUNC) + CRONO.MONTO_COSTAS) AS MONTO_TOTAL_DEUDA,
                   --
                   TRUNC(ROUND(CRONO.MONTO_CUOTA, 2), SCOB_PK_CONSTANTES.C_NRO_DECIMAL_TRUNC) AS SALDO_CUOTA,
                   
                   TRUNC(CRONO.MONTO_INTERES, SCOB_PK_CONSTANTES.C_NRO_DECIMAL_TRUNC), --SALDO_IC,
                   0.00, --SALDO_IM,
                   CRONO.MONTO_COSTAS, --SALDO_COSTAS,
                   
                   (TRUNC(ROUND(CRONO.MONTO_CUOTA, 2), SCOB_PK_CONSTANTES.C_NRO_DECIMAL_TRUNC) +
                   TRUNC(CRONO.MONTO_INTERES, SCOB_PK_CONSTANTES.C_NRO_DECIMAL_TRUNC) + CRONO.MONTO_COSTAS) AS SALDO_TOTAL_DEUDA,
                   --
                   0.00, --TOTAL_AMORTIZADO,
                   0.00, --TOTAL_AMORTIZADO_IC,
                   0.00, --TOTAL_AMORTIZADO_IM,
                   0.00, --TOTAL_AMORTIZADO_COSTAS,
                   --
                   SCOB_PK_CONSTANTES.C_COD_EST_CRONO_PAGO_PENDIENTE, --Pendiente
                   SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO,
                   SYSDATE,
                   PI_V_AUDUSUMODIFICACION
              FROM T_SCOB_TMP_SIMULAR_CRONOGRAMA CRONO
             WHERE CRONO.ID_SIMULACION = PO_V_RETORNO;
    
        DELETE FROM T_SCOB_TMP_SIMULAR_CRONOGRAMA CRONO WHERE CRONO.ID_SIMULACION = PO_V_RETORNO;
    
        PO_N_COD_ERROR := 1;
        PO_N_RETORNO   := PI_N_ID_EXPED_FRACCIONAR;
    
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

    PROCEDURE SCOB_SP_S_SIMULAR_CRONO_ANT
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 17.05.2011
        -- Proposito    : genera el cronograma
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_N_ID_EXPEDIENTE       IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
     PI_N_MONTO_FRACCCIONAR   IN T_SCOB_EXPED_FRACCIONAR.MONTO_FRACCIONAR%TYPE,
     PI_N_TASA_TIEL           IN T_SCOB_EXPED_FRACCIONAR.MONTO_INTERES_TIEL%TYPE,
     PI_C_FEC_PERIODO_GRACIA  IN CHAR,
     PI_C_FEC_FRACCIONAMIENTO IN CHAR, --envia la Fecha Recepcion Tramite Doc.
     PI_I_NRO_DIA_PAGO        IN T_SCOB_EXPED_FRACCIONAR.NRO_DIA_PAGO%TYPE,
     PI_I_NRO_CUOTA           IN T_SCOB_EXPED_FRACCIONAR.NRO_CUOTAS%TYPE,
     PI_C_ELIMINA             IN CHAR,
     PO_CU_RETORNO            OUT CU_REC_SET,
     PO_V_RETORNO             OUT VARCHAR2,
     PO_V_MSJ_ERROR           OUT VARCHAR2) AS
        N_TS_INT_EFEC_ANUAL T_SCOB_EXPED_FRACCIONAR.MONTO_INTERES_TIEL%TYPE;
        N_TS_INT_SEGU_DGVM  T_SCOB_EXPED_FRACCIONAR.MONTO_INTERES_TIEL%TYPE;
        N_POR_COMISION      T_SCOB_MULTA.MONTO_UIT%TYPE;
        N_GASTOS_SEGURO     T_SCOB_MULTA.MONTO_UIT%TYPE;
        N_GASTOS_ADMIN      T_SCOB_MULTA.MONTO_UIT%TYPE;
        N_NRO_DIAS          INTEGER;
        N_NRO_DIAS_ACUM     INTEGER;
        ---
        N_MONTO_CUOTA NUMBER(25, 9); --T_SCOB_MULTA.MONTO_UIT%TYPE;
        N_FACTOR      NUMBER(25, 9);
        N_FACTOR_ACUM NUMBER(25, 9);
        N_INTERES     NUMBER(25, 9);
        N_SALDO       NUMBER(25, 9);
        N_SALDO_ANT   NUMBER(25, 9);
        N_DEUDA       NUMBER(25, 9);
        N_AMORTIZA    NUMBER(25, 9);
    
        N_CONT INTEGER;
        V_PK   T_SCOB_TMP_SIMULAR_CRONOGRAMA.ID_SIMULACION%TYPE;
    
        F_FECHA     DATE;
        F_FECHA_ANT DATE;
    
        PO_N_COD_ERROR NUMBER;
        PO_N_RETORNO   NUMBER;
    
        N_VALOR_UIT_CUOTA_MINIMA T_SCOB_MULTA_DETAL.VALOR_UIT%TYPE;
        N_VALOR_UIT_CUOTA        T_SCOB_MULTA_DETAL.VALOR_UIT%TYPE;
        --  N_VALOR_UIT_GARANTIA                    T_SCOB_MULTA_DETAL.VALOR_UIT%TYPE;
        N_NRO_CUOTA_MINIMO INTEGER;
        N_NRO_CUOTA_MAXIMO INTEGER;
    
        N_MONTO_UIT          NUMBER(25, 9);
        N_SALDO_EXPEDIENTE   NUMBER(25, 9);
        N_MONTO_CUOTA_MINIMA NUMBER(25, 9);
        N_MONTO_COSTAS       NUMBER(25, 9);
    
    BEGIN
    
        PO_N_RETORNO        := 0;
        N_TS_INT_EFEC_ANUAL := PI_N_TASA_TIEL / 100; --lo retorna el aplicativo.
        N_TS_INT_SEGU_DGVM  := 0 / 100; --falta debe ser un porcetaje manejado como parametro
        N_POR_COMISION      := 0 / 100; --falta debe ser un porcetaje manejado como parametro
    
        ----------------------------------------------------------------
        /*OBTENER LOS PARAMETROS DEL SISTEMA*/
        --obtener el monto por uit a la fecha de solicitud del fraccionamiento
        N_MONTO_UIT := NULL;
        SELECT UIT.MONTO_UIT
          INTO N_MONTO_UIT
          FROM T_SCOB_UIT UIT
         WHERE TO_DATE(PI_C_FEC_FRACCIONAMIENTO, 'DD/MM/YYYY') BETWEEN UIT.FECHA_INICIO AND UIT.FECHA_FIN
           AND UIT.ESTADO = '1';
    
        --saldo del expediente
        N_SALDO_EXPEDIENTE := PI_N_MONTO_FRACCCIONAR;
    
        --A.obtener el valor uit para el calculo del monto minimo de cuota mensual
        SELECT SCOB_PK_UTILITARIO.SCOB_FN_TEXTO_A_NUMERO(TD.TXT_VALOR1)
          INTO N_VALOR_UIT_CUOTA_MINIMA
          FROM T_SCOB_TABLA_DET TD
         WHERE TD.ID_TABLA = SCOB_PK_CONSTANTES.C_TBL_PARAMETRO_SISTEMA
           AND TO_NUMBER(TD.COD_INTERNO) = (6);
    
        --B.obtener el valor uit minimo para aplicar numero maximo de cuotas
        SELECT SCOB_PK_UTILITARIO.SCOB_FN_TEXTO_A_NUMERO(TD.TXT_VALOR1),
               TO_NUMBER(TD.TXT_VALOR2),
               TO_NUMBER(TD.TXT_VALOR3)
          INTO N_VALOR_UIT_CUOTA,
               N_NRO_CUOTA_MINIMO,
               N_NRO_CUOTA_MAXIMO
          FROM T_SCOB_TABLA_DET TD
         WHERE TD.ID_TABLA = SCOB_PK_CONSTANTES.C_TBL_PARAMETRO_SISTEMA
           AND TO_NUMBER(TD.COD_INTERNO) = (7);
        ----------------------------------------------------------------
    
        /*VALIDACIONES DE APLICACION DEL FRACCIONAMIENTO (B)*/
        --2.Si saldo CAPITAL del expediente es menor a XX UIT
        --  las cuotas no deben ser mayores a....
        IF N_SALDO_EXPEDIENTE <= (NVL(N_MONTO_UIT, 1) * NVL(N_VALOR_UIT_CUOTA, 1)) THEN
            IF PI_I_NRO_CUOTA > N_NRO_CUOTA_MINIMO THEN
                PO_V_RETORNO   := -10;
                PO_V_MSJ_ERROR := 'No se puede realizar la accion. El nro de cuotas no puede ser mayor a ' || TO_CHAR(N_NRO_CUOTA_MINIMO);
                RAISE_APPLICATION_ERROR(-20021, PO_V_MSJ_ERROR);
            END IF;
        ELSE
            --3.Si saldo CAPITAL del expediente es mayor a XX UIT
            --  las cuotas no deben ser mayores a....
            IF PI_I_NRO_CUOTA > N_NRO_CUOTA_MAXIMO THEN
                PO_V_RETORNO   := -11;
                PO_V_MSJ_ERROR := 'No se puede realizar la accion. El nro de cuotas no puede ser mayor a ' || TO_CHAR(N_NRO_CUOTA_MAXIMO);
                RAISE_APPLICATION_ERROR(-20021, PO_V_MSJ_ERROR);
            END IF;
        END IF;
    
        /*obtener las costas del expediente*/
        SELECT MULT.SALDO_COSTAS
          INTO N_MONTO_COSTAS
          FROM T_SCOB_MULTA MULT
         INNER JOIN T_SCOB_EXPEDIENTE_MULTA EXMU
            ON EXMU.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
           AND EXMU.ID_MULTA = MULT.ID_MULTA
           AND EXMU.ESTADO = '1';
    
        /*CALCULO DEL CRONOGRAMA*/
        N_GASTOS_SEGURO := PI_N_MONTO_FRACCCIONAR * N_TS_INT_SEGU_DGVM;
        N_GASTOS_ADMIN  := PI_N_MONTO_FRACCCIONAR * N_POR_COMISION;
        N_SALDO_ANT     := PI_N_MONTO_FRACCCIONAR;
    
        SELECT TO_CHAR(PI_N_ID_EXPEDIENTE) + TO_CHAR(SYSDATE, 'DDMMYYYYHHMMSS') INTO V_PK FROM DUAL;
        --------------------------------------------------------------------------------
    
        --aqui reemplazar si es periodo de gracia
        IF PI_C_FEC_PERIODO_GRACIA IS NULL THEN
            SELECT TO_DATE(PI_C_FEC_FRACCIONAMIENTO, 'DD/MM/YYYY') INTO F_FECHA_ANT FROM DUAL;
            SELECT TO_DATE(PI_C_FEC_FRACCIONAMIENTO, 'DD/MM/YYYY') INTO F_FECHA FROM DUAL;
        ELSE
            SELECT TO_DATE(PI_C_FEC_PERIODO_GRACIA, 'DD/MM/YYYY') INTO F_FECHA_ANT FROM DUAL;
            SELECT TO_DATE(PI_C_FEC_PERIODO_GRACIA, 'DD/MM/YYYY') INTO F_FECHA FROM DUAL;
        END IF;
    
        SELECT ADD_MONTHS(TO_DATE((LPAD(TO_CHAR(PI_I_NRO_DIA_PAGO), 2, '00') || '/' || TO_CHAR(F_FECHA, 'MM') || '/' || TO_CHAR(F_FECHA, 'YYYY')),
                                  'DD/MM/YYYY'),
                          1)
          INTO F_FECHA
          FROM DUAL;
    
        --DBMS_OUTPUT.put_line ('---' || TO_CHAR(F_FECHA_ANT,'DD/MM/YYYY'));
        --DBMS_OUTPUT.put_line ('---' || TO_CHAR(F_FECHA,'DD/MM/YYYY'));
    
        --------------------------------------------------------------------------------
        --HALLAR EL FACTOR PARA EL CALCULO DE LA CUOTA
        --------------------------------------------------------------------------------
        N_NRO_DIAS_ACUM := 0;
        N_FACTOR_ACUM   := 0;
        N_CONT          := 1;
        LOOP
            IF N_CONT > PI_I_NRO_CUOTA THEN
                EXIT;
            END IF;
        
            N_NRO_DIAS      := F_FECHA - F_FECHA_ANT;
            N_NRO_DIAS_ACUM := N_NRO_DIAS_ACUM + N_NRO_DIAS;
            N_FACTOR        := POWER((1 + N_TS_INT_EFEC_ANUAL), (-N_NRO_DIAS_ACUM / 360));
            N_FACTOR_ACUM   := N_FACTOR_ACUM + N_FACTOR;
        
            /*
            DBMS_OUTPUT.put_line (lpad(TO_CHAR(N_CONT),2,'00'));
            DBMS_OUTPUT.put_line ('---' || TO_CHAR(F_FECHA_ANT,'DD/MM/YYYY'));
            DBMS_OUTPUT.put_line ('---' || TO_CHAR(F_FECHA,'DD/MM/YYYY'));
            DBMS_OUTPUT.put_line ('---' || TO_CHAR(N_NRO_DIAS));
            DBMS_OUTPUT.put_line ('---' || TO_CHAR(N_NRO_DIAS_ACUM));
            DBMS_OUTPUT.put_line ('---' || TO_CHAR(ROUND(N_FACTOR,2)));
            */
        
            F_FECHA_ANT := F_FECHA;
            SELECT ADD_MONTHS(F_FECHA, 1) INTO F_FECHA FROM DUAL;
            N_CONT := N_CONT + 1;
        END LOOP;
        -------------------------
        --CALCULO DE LA CUOTA
        N_MONTO_CUOTA := PI_N_MONTO_FRACCCIONAR / N_FACTOR_ACUM;
        N_MONTO_CUOTA := N_MONTO_CUOTA + N_GASTOS_SEGURO + N_GASTOS_ADMIN;
    
        /*VALIDACIONES DE APLICACION DEL FRACCIONAMIENTO*/
        --1.monto cuota es mayor que X uit
        N_MONTO_CUOTA_MINIMA := (NVL(N_MONTO_UIT, 1) * NVL(N_VALOR_UIT_CUOTA_MINIMA, 1));
    
        IF N_MONTO_CUOTA < N_MONTO_CUOTA_MINIMA THEN
            PO_V_RETORNO   := -12;
            PO_V_MSJ_ERROR := 'No se puede realizar la accion. El monto de la cuota no debe ser menor a ' || TO_CHAR(N_MONTO_CUOTA_MINIMA);
            RAISE_APPLICATION_ERROR(-20021, PO_V_MSJ_ERROR);
        END IF;
    
        --------------------------------------------------------------------------------
        --CALCULO DEL RESTO DEL CRONOGRAMA
        --------------------------------------------------------------------------------
    
        --aqui reemplazar si es periodo de gracia
        IF PI_C_FEC_PERIODO_GRACIA IS NULL THEN
            SELECT TO_DATE(PI_C_FEC_FRACCIONAMIENTO, 'DD/MM/YYYY') INTO F_FECHA FROM DUAL;
            SELECT TO_DATE(PI_C_FEC_FRACCIONAMIENTO, 'DD/MM/YYYY') INTO F_FECHA_ANT FROM DUAL;
        ELSE
            SELECT TO_DATE(PI_C_FEC_PERIODO_GRACIA, 'DD/MM/YYYY') INTO F_FECHA FROM DUAL;
            SELECT TO_DATE(PI_C_FEC_PERIODO_GRACIA, 'DD/MM/YYYY') INTO F_FECHA_ANT FROM DUAL;
        END IF;
        SELECT ADD_MONTHS(TO_DATE((LPAD(TO_CHAR(PI_I_NRO_DIA_PAGO), 2, '00') || '/' || TO_CHAR(F_FECHA, 'MM') || '/' || TO_CHAR(F_FECHA, 'YYYY')),
                                  'DD/MM/YYYY'),
                          1)
          INTO F_FECHA
          FROM DUAL;
        --------------------------------------------------------------------------------
        N_DEUDA         := 0;
        N_NRO_DIAS_ACUM := 0;
        N_FACTOR_ACUM   := 0;
        N_CONT          := 1;
        LOOP
            IF N_CONT > PI_I_NRO_CUOTA THEN
                EXIT;
            END IF;
        
            N_NRO_DIAS      := F_FECHA - F_FECHA_ANT;
            N_NRO_DIAS_ACUM := N_NRO_DIAS_ACUM + N_NRO_DIAS;
            N_FACTOR        := POWER((1 + N_TS_INT_EFEC_ANUAL), (-N_NRO_DIAS_ACUM / 360));
            N_FACTOR_ACUM   := N_FACTOR_ACUM + N_FACTOR;
        
            N_INTERES  := N_SALDO_ANT * (POWER((1 + N_TS_INT_EFEC_ANUAL), (N_NRO_DIAS / 360)) - 1);
            N_INTERES  := NVL(N_INTERES, 0);
            N_AMORTIZA := N_MONTO_CUOTA - N_GASTOS_SEGURO - N_GASTOS_ADMIN - N_INTERES;
            N_DEUDA    := N_DEUDA + N_AMORTIZA;
            N_SALDO    := N_SALDO_ANT - N_AMORTIZA;
        
            SCOB_SP_I_SIMULAR_CRONOGRAMA(V_PK,
                                         PI_N_ID_EXPEDIENTE,
                                         N_CONT,
                                         TO_CHAR(F_FECHA, 'DD/MM/YYYY'),
                                         N_MONTO_CUOTA,
                                         0.00, --N_MONTO_COSTAS,
                                         N_INTERES,
                                         N_SALDO,
                                         N_DEUDA,
                                         N_AMORTIZA,
                                         N_NRO_DIAS,
                                         PO_N_RETORNO,
                                         PO_N_COD_ERROR,
                                         PO_V_MSJ_ERROR);
        
            /*
            DBMS_OUTPUT.put_line (lpad(TO_CHAR(N_CONT),2,'00'));
            DBMS_OUTPUT.put_line ('---' || TO_CHAR(F_FECHA_ANT,'DD/MM/YYYY'));
            DBMS_OUTPUT.put_line ('---' || TO_CHAR(F_FECHA,'DD/MM/YYYY'));
            DBMS_OUTPUT.put_line ('---' || TO_CHAR(N_NRO_DIAS));
            DBMS_OUTPUT.put_line ('---' || TO_CHAR(N_NRO_DIAS_ACUM));
            DBMS_OUTPUT.put_line ('---' || TO_CHAR(ROUND(N_FACTOR,2)));
            DBMS_OUTPUT.put_line ('---' || TO_CHAR(ROUND(N_SALDO,2)));
            DBMS_OUTPUT.put_line ('---' || TO_CHAR(ROUND(N_DEUDA,2)));
            DBMS_OUTPUT.put_line ('---' || TO_CHAR(ROUND(N_AMORTIZA,2)));
            DBMS_OUTPUT.put_line ('---' || TO_CHAR(ROUND(N_INTERES,2)));
            */
        
            F_FECHA_ANT := F_FECHA;
            N_SALDO_ANT := N_SALDO;
            SELECT ADD_MONTHS(F_FECHA, 1) INTO F_FECHA FROM DUAL;
            N_CONT := N_CONT + 1;
        
        END LOOP;
    
        --A LA PRIMERA CUOTA LE AGREGA LAS COSTAS
        UPDATE T_SCOB_TMP_SIMULAR_CRONOGRAMA CRONO
           SET MONTO_COSTAS = N_MONTO_COSTAS
         WHERE CRONO.ID_SIMULACION = V_PK
           AND CRONO.NRO_CUOTA = 1;
    
        --
        OPEN PO_CU_RETORNO FOR
            SELECT CRONO.NRO_CUOTA                AS NRO_CUOTA,
                   CRONO.FEC_VENCIMIENTO          AS FEC_VENCIMIENTO,
                   CRONO.SALDO                    AS SALDO,
                   CRONO.MONTO_DEUDA_AMORTIZACION AS MONTO_DEUDA_AMORTIZACION,
                   CRONO.MONTO_AMORTIZACION       AS MONTO_AMORTIZACION,
                   CRONO.MONTO_INTERES            AS MONTO_INTERES,
                   CRONO.MONTO_CUOTA              AS MONTO_CUOTA
              FROM T_SCOB_TMP_SIMULAR_CRONOGRAMA CRONO
             WHERE CRONO.ID_SIMULACION = V_PK
             ORDER BY CRONO.NRO_CUOTA;
    
        IF PI_C_ELIMINA = '1' THEN
            DELETE FROM T_SCOB_TMP_SIMULAR_CRONOGRAMA CRONO WHERE CRONO.ID_SIMULACION = V_PK;
        END IF;
    
        --commit;
    
        PO_V_RETORNO := V_PK;
    EXCEPTION
        WHEN OTHERS THEN
            PO_N_COD_ERROR := SQLCODE;
        
            IF PO_N_COD_ERROR = -20021 THEN
                --raise_error
            
                PO_N_COD_ERROR := PO_V_RETORNO;
                OPEN PO_CU_RETORNO FOR
                    SELECT NULL AS NRO_CUOTA,
                           NULL AS FEC_VENCIMIENTO,
                           NULL AS SALDO,
                           NULL AS MONTO_DEUDA_AMORTIZACION,
                           NULL AS MONTO_AMORTIZACION,
                           NULL AS MONTO_INTERES,
                           NULL AS MONTO_CUOTA
                      FROM DUAL;
            
                ROLLBACK;
                RETURN;
            END IF;
        
            PO_V_RETORNO := -1;
        
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

----

  /*****************************************************************
  ‘* Nombre : SCOB_SP_S_EXP_PARA_VINC
  '* Parámetros : PI_VC_EXP : 
  '*		  PI_VC_ANIO :	
  '* Propósito : Consulta de exp. para vincular por numero correlativo
  '* Output : po_cu_retorno :
  '* Creado por : Heraud Chalco
  '* Fec Creación : 29/07/2021
  '* Fec Actualización : 2022-06-23
  ‘* Observación : Se agrego dblink por la migracion del SGD
  '****************************************************************/
    procedure SCOB_SP_S_EXP_PARA_VINC
    (
      po_cu_retorno            out cu_rec_set,
      PI_VC_EXP             IN VARCHAR2,
      PI_VC_ANIO                 IN VARCHAR2
    )
    AS
    begin
      
      open  po_cu_retorno for
        SELECT EX.NU_ANN_EXP,
             EX.NU_SEC_EXP,
             EX.NU_EXPEDIENTE,
             EX.FE_EXP, --FECHA DETALLE
             EX.NU_CORR_EXP
        FROM IDOSGD.TDTC_EXPEDIENTE@DB_USR_SGDINTFZ.SIS EX
       WHERE EX.NU_ANN_EXP = PI_VC_ANIO
         AND EX.NU_EXPEDIENTE=PI_VC_EXP --NRO_SOLICITUD
      ORDER BY EX.NU_CORR_EXP DESC;

    end;
    
  /*****************************************************************
  ‘* Nombre : SCOB_SP_I_VINCULAR_EXP
  '* Parámetros : PI_VC_NRO_SOLICITUD :
  '*   		  PI_VC_FEC_DETALLE :
  '*   		  PI_VC_NRO_EXP_COBRANZA :
  '*   		  PI_NU_ANN_EXP :
  '*		  PI_VC_USUARIO_LOGIN :
  '*		  PI_VC_ANIO :	
  '* Propósito : Vincular multas con los exp
  '* Output : PO_VC_RETORNO:
  '* Creado por : Heraud Chalco
  '* Fec Creación : 29/07/2021
  '* Fec Actualización : 2022-06-23
  ‘* Observación : Se agrego dblink por la migracion del SGD
  '****************************************************************/
    procedure SCOB_SP_I_VINCULAR_EXP
     (
      PI_VC_NRO_SOLICITUD      IN VARCHAR2,
      PI_VC_FEC_DETALLE        IN VARCHAR2,
      PI_VC_NRO_EXP_COBRANZA   IN VARCHAR2,
      PI_NU_ANN_EXP            IN VARCHAR2,
      PI_VC_USUARIO_LOGIN      IN VARCHAR2,
      PO_VC_RETORNO            OUT VARCHAR2
    )
    AS
      V_NU_ID_EXPEDIENTE NUMBER;
      V_VC_DE_CORTA_DEPEN VARCHAR2(5);
      V_NU_CORR_EXP       VARCHAR2(7);
    BEGIN
      
      SELECT EXPE.ID_EXPEDIENTE INTO V_NU_ID_EXPEDIENTE
      FROM USR_SICOB.T_SCOB_EXPEDIENTE EXPE
      WHERE EXPE.ANIO||EXPE.NRO_EXPEDIENTE = PI_VC_NRO_EXP_COBRANZA
      AND EXPE.Estado = 1;
      
      
      SELECT T.DE_CORTA_DEPEN, EX.NU_CORR_EXP INTO V_VC_DE_CORTA_DEPEN, V_NU_CORR_EXP 
        FROM IDOSGD.TDTC_EXPEDIENTE@DB_USR_SGDINTFZ.SIS EX
       INNER JOIN IDOSGD.RHTM_DEPENDENCIA@DB_USR_SGDINTFZ.SIS T
          ON (EX.CO_DEP_EXP = T.CO_DEPENDENCIA)
      WHERE EX.NU_EXPEDIENTE = PI_VC_NRO_SOLICITUD;
      
      INSERT INTO USR_SICOB.T_SCOB_EXPED_FRACCIONAR
        (ID_EXPED_FRACCIONAR,
         ID_EXPEDIENTE,
         NRO_SOLICITUD,
         FEC_RECEPCION_TRAMITE,
         FEC_INGRESO_TRAMITE,
         ID_USUARIO_INGRESO,
         ESTADO_SOLICITUD,
         ESTADO,
         AUDFECCREACION,
         AUDUSUCREACION,
         VC_ANIO,
         VC_AREA,
         NU_TRAMITE,
         NRO_DOCUMENTO_TRAMITE)
      VALUES
        (USR_SICOB.SCOB_SQ_EXPED_FRACCIONAR.NEXTVAL,
         V_NU_ID_EXPEDIENTE, --Interno
         PI_VC_NRO_SOLICITUD, --PAram PI_VC_NRO_SOLICITUD
         TO_DATE(PI_VC_FEC_DETALLE, 'DD-MM-YYYY'),--FE_EXP
         SYSDATE,
         PI_VC_USUARIO_LOGIN,
         1,
         '1',
         SYSDATE,
         'SGD',
         PI_NU_ANN_EXP,
         V_VC_DE_CORTA_DEPEN,
         V_NU_CORR_EXP,
         PI_VC_NRO_SOLICITUD
         );
      
         PO_VC_RETORNO:='1';--OPERACION EXITOSA
    end;
END SCOB_PK_EXPE_FRACCIONAR;
/
