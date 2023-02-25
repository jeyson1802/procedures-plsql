CREATE OR REPLACE PACKAGE PKG_RECAUDACION_BANCOS IS

  PROCEDURE SP_DO_VALIDAD_EXIS_BN(PIN_NU_ID_MULTA         IN NUMBER,
                                POUT_NU_COD_RESULT        OUT NUMBER,
                                POUT_VC_MSG_RESULT        OUT VARCHAR2);
  PROCEDURE SP_DO_VALIDAD_EXIS_ASBANC(PIN_NU_ID_MULTA         IN NUMBER,
                                POUT_NU_COD_RESULT        OUT NUMBER,
                                POUT_VC_MSG_RESULT        OUT VARCHAR2);
  PROCEDURE SP_I_RECAUDACION_BN(PIN_NU_ID_MULTA           IN NUMBER,
                                POUT_NU_COD_RESULT        OUT NUMBER,
                                POUT_VC_MSG_RESULT        OUT VARCHAR2);

  PROCEDURE SP_I_RECAUDACION_ASBANC(PIN_NU_ID_MULTA   IN NUMBER,
                                    POUT_NU_COD_RESULT OUT NUMBER,
                                    POUT_VC_MSG_RESULT OUT VARCHAR2);
  PROCEDURE SP_D_RECAUDACION_BN(PIN_NU_ID_MULTA         IN NUMBER,
                              POUT_NU_COD_RESULT        OUT NUMBER,
                              POUT_VC_MSG_RESULT        OUT VARCHAR2);
  PROCEDURE SP_D_RECAUDACION_ASBANC(PIN_NU_ID_MULTA         IN NUMBER,
                              POUT_NU_COD_RESULT        OUT NUMBER,
                              POUT_VC_MSG_RESULT        OUT VARCHAR2);
  PROCEDURE SP_DO_GRABAR_BN(PIN_NU_ID_MULTA         IN NUMBER,
                          POUT_NU_COD_RESULT        OUT NUMBER,
                          POUT_VC_MSG_RESULT        OUT VARCHAR2);
  PROCEDURE SP_DO_GRABAR_ASBANC(PIN_NU_ID_MULTA         IN NUMBER,
                          POUT_NU_COD_RESULT        OUT NUMBER,
                          POUT_VC_MSG_RESULT        OUT VARCHAR2);
  PROCEDURE SP_D_ASBANC_PAGO_TR(PIN_VC_NUM_CUM         IN VARCHAR2);
  PROCEDURE SP_D_BN_PAGO_TR(PIN_VC_NUM_CUM         IN VARCHAR2);
  PROCEDURE SP_DO_GRABAR_ASBANC_X_EXP(PIN_NU_ID_EXPEDIENTE         IN NUMBER,
                          POUT_NU_COD_RESULT        OUT NUMBER,
                          POUT_VC_MSG_RESULT        OUT VARCHAR2);
  PROCEDURE SP_DO_GRABAR_BN_X_EXP(PIN_NU_ID_EXPEDIENTE         IN NUMBER,
                          POUT_NU_COD_RESULT        OUT NUMBER,
                          POUT_VC_MSG_RESULT        OUT VARCHAR2); 
  PROCEDURE SP_I_ASBANC_PAGO_TR(PIN_NU_ID_MULTA        IN NUMBER,
                              PIN_VC_TIPO_MULTA      IN VARCHAR2,
                              POUT_NU_COD_RESULT     OUT NUMBER,
                              POUT_VC_MSG_RESULT     OUT VARCHAR2);                                              
END PKG_RECAUDACION_BANCOS;
/
CREATE OR REPLACE PACKAGE BODY PKG_RECAUDACION_BANCOS IS

  EX_CONTROLADO EXCEPTION;

/*****************************************************************
'* Nombre           :  SP_DO_VALIDAD_EXIS_BN
'* Parámetros       :  PIN_NU_ID_MULTA : Id de la multa
'* Propósito        :  Método que valida si exite el registro en la tabla del BN
'*                     para el cum especifico.
'* Output           :  POUT_NU_COD_RESULT: Devuelve codigo de error o validacion
'*                                         0: No existe 1: Existe  -1: error en la consulta
'*                     POUT_VC_MSG_RESULT: Devuelve mensaje del resultado o mensaje del error
'* Creado por       :  JJIMENEZ
'* Fec Creación     :  2023-02-07 17:06:00
'* Fec Actualización:  
'****************************************************************/
  PROCEDURE SP_DO_VALIDAD_EXIS_BN(PIN_NU_ID_MULTA         IN NUMBER,
                                POUT_NU_COD_RESULT        OUT NUMBER,
                                POUT_VC_MSG_RESULT        OUT VARCHAR2) IS
  
      V_VC_NUM_CUM              USR_TRANSAC_BN.BN_MULTAS_TRANSITO_MOV.NU_NRO_CUM%TYPE;
      V_NU_COUNT                NUMBER(2);
  BEGIN
      SELECT T.ANIO || T.CUM INTO V_VC_NUM_CUM FROM USR_SICOB.T_SCOB_MULTA T WHERE T.ID_MULTA=PIN_NU_ID_MULTA;
      SELECT COUNT(0) INTO V_NU_COUNT FROM USR_TRANSAC_BN.BN_MULTAS_TRANSITO_MOV T WHERE T.NU_NRO_CUM=V_VC_NUM_CUM;
      IF V_NU_COUNT>0 THEN
        POUT_NU_COD_RESULT:=1;
      ELSE
        POUT_NU_COD_RESULT:=0;
      END IF;
      POUT_VC_MSG_RESULT := 'CONFORME';
  EXCEPTION
    WHEN EX_CONTROLADO THEN
      POUT_NU_COD_RESULT := -1;
    WHEN OTHERS THEN
      POUT_NU_COD_RESULT := -1;
      POUT_VC_MSG_RESULT := 'ERROR NO CONTROLADO : SP_DO_VALIDAD_EXIS_BN - ERROR : ' ||
                        SQLERRM;
    
  END SP_DO_VALIDAD_EXIS_BN;
  
/*****************************************************************
'* Nombre           :  SP_DO_VALIDAD_EXIS_ASBANC
'* Parámetros       :  PIN_NU_ID_MULTA : Id de la multa
'* Propósito        :  Método que valida si exite el registro en la tabla de asbanc
'*                     para el cum especifico.
'* Output           :  POUT_NU_COD_RESULT: Devuelve codigo de error o validacion
'*                                         0: No existe 1: Existe  -1: error en la consulta
'*                     POUT_VC_MSG_RESULT: Devuelve mensaje del resultado o mensaje del error
'* Creado por       :  JJIMENEZ
'* Fec Creación     :  2023-02-07 17:06:00
'* Fec Actualización:  
'****************************************************************/
  PROCEDURE SP_DO_VALIDAD_EXIS_ASBANC(PIN_NU_ID_MULTA         IN NUMBER,
                                POUT_NU_COD_RESULT        OUT NUMBER,
                                POUT_VC_MSG_RESULT        OUT VARCHAR2) IS
  
      V_VC_NUM_CUM              USR_TRANSAC_BN.T_RECA_MULTA.NU_NRO_CUM%TYPE;
      V_NU_COUNT                NUMBER(2);
      V_NU_MU_FR                NUMBER(2);
  BEGIN
      DBMS_OUTPUT.PUT_LINE('SP_DO_VALIDAD_EXIS_ASBANC>>PIN_NU_ID_MULTA>>' || PIN_NU_ID_MULTA);
      -- ES UN FRACCIONADO
     SELECT COUNT(0) INTO V_NU_MU_FR
      FROM USR_SICOB.T_SCOB_MULTA MUL
              INNER JOIN USR_SICOB.T_SCOB_MULTA_DETAL MULDE ON MUL.ID_MULTA = MULDE.ID_MULTA
                      AND MULDE.ESTADO = '1' AND MULDE.FLG_ACTUAL = '1'
              INNER JOIN USR_SICOB.T_SCOB_EXPEDIENTE_MULTA EXMUL ON MUL.ID_MULTA = EXMUL.ID_MULTA AND EXMUL.ESTADO = '1'
              INNER JOIN USR_SICOB.T_SCOB_EXPEDIENTE EXP ON EXP.ID_EXPEDIENTE = EXMUL.ID_EXPEDIENTE AND EXP.ESTADO = '1'
              INNER JOIN USR_SICOB.T_SCOB_EXPED_CRONOGRAMA EXCRO ON EXP.ID_EXPEDIENTE = EXCRO.ID_EXPEDIENTE 
                      AND EXCRO.FLG_ACTUAL = '1' AND EXCRO.COD_TIPO_CRONOGRAMA = 1 AND EXCRO.ESTADO = '1' --- 1=Fraccionamiento ; 2=Pago Programado
              INNER JOIN USR_SICOB.T_SCOB_EXPED_CRONOGRAMA_DET EXCROD ON EXCRO.ID_EXPED_CRONOGRAMA_PAGO = EXCROD.ID_EXPED_CRONOGRAMA_PAGO 
                      AND (EXCROD.ESTADO_CUOTA = 1 OR EXCROD.ESTADO_CUOTA = 2) --- 1=Pendiente; 2=Pago Parcial; 3=Pago Total
      WHERE MUL.ID_MULTA = PIN_NU_ID_MULTA;
      DBMS_OUTPUT.PUT_LINE('SP_DO_VALIDAD_EXIS_ASBANC>>V_NU_MU_FR>>' || V_NU_MU_FR);
      
      IF V_NU_MU_FR>0 THEN
          SELECT MUL.ANIO || SUBSTR(MUL.CUM,3, 8) || LPAD(EXCROD.NRO_CUOTA, 2, '0') INTO V_VC_NUM_CUM
          FROM USR_SICOB.T_SCOB_MULTA MUL
              INNER JOIN USR_SICOB.T_SCOB_MULTA_DETAL MULDE ON MUL.ID_MULTA = MULDE.ID_MULTA
                      AND MULDE.ESTADO = '1' AND MULDE.FLG_ACTUAL = '1'
              INNER JOIN USR_SICOB.T_SCOB_EXPEDIENTE_MULTA EXMUL ON MUL.ID_MULTA = EXMUL.ID_MULTA AND EXMUL.ESTADO = '1'
              INNER JOIN USR_SICOB.T_SCOB_EXPEDIENTE EXP ON EXP.ID_EXPEDIENTE = EXMUL.ID_EXPEDIENTE AND EXP.ESTADO = '1'
              INNER JOIN USR_SICOB.T_SCOB_EXPED_CRONOGRAMA EXCRO ON EXP.ID_EXPEDIENTE = EXCRO.ID_EXPEDIENTE 
                      AND EXCRO.FLG_ACTUAL = '1' AND EXCRO.COD_TIPO_CRONOGRAMA = 1 AND EXCRO.ESTADO = '1' --- 1=Fraccionamiento ; 2=Pago Programado
              INNER JOIN USR_SICOB.T_SCOB_EXPED_CRONOGRAMA_DET EXCROD ON EXCRO.ID_EXPED_CRONOGRAMA_PAGO = EXCROD.ID_EXPED_CRONOGRAMA_PAGO 
                      AND (EXCROD.ESTADO_CUOTA = 1 OR EXCROD.ESTADO_CUOTA = 2) --- 1=Pendiente; 2=Pago Parcial; 3=Pago Total
          WHERE MUL.ID_MULTA = PIN_NU_ID_MULTA
          AND EXCROD.NRO_CUOTA IN (SELECT MIN(T.NRO_CUOTA) FROM USR_SICOB.T_SCOB_EXPED_CRONOGRAMA_DET T 
                                          WHERE T.ID_EXPED_CRONOGRAMA_PAGO=EXCRO.ID_EXPED_CRONOGRAMA_PAGO
                                          AND (T.ESTADO_CUOTA = 1 OR T.ESTADO_CUOTA = 2)) ;           
      ELSE
          SELECT T.ANIO || T.CUM INTO V_VC_NUM_CUM FROM USR_SICOB.T_SCOB_MULTA T WHERE T.ID_MULTA=PIN_NU_ID_MULTA;
      END IF;
      DBMS_OUTPUT.PUT_LINE('SP_DO_VALIDAD_EXIS_ASBANC>>V_VC_NUM_CUM>>' || V_VC_NUM_CUM);
      SELECT COUNT(0) INTO V_NU_COUNT FROM USR_TRANSAC_BN.T_RECA_MULTA T WHERE T.NU_NRO_CUM=V_VC_NUM_CUM;
      DBMS_OUTPUT.PUT_LINE('SP_DO_VALIDAD_EXIS_ASBANC>>V_NU_COUNT>>' || V_NU_COUNT);
      IF V_NU_COUNT>0 THEN
        POUT_NU_COD_RESULT:=1;
      ELSE
        POUT_NU_COD_RESULT:=0;
      END IF;
      POUT_VC_MSG_RESULT := 'CONFORME';
  EXCEPTION
    WHEN EX_CONTROLADO THEN
      POUT_NU_COD_RESULT := -1;
    WHEN OTHERS THEN
      POUT_NU_COD_RESULT := -1;
      POUT_VC_MSG_RESULT := 'ERROR NO CONTROLADO : SP_DO_VALIDAD_EXIS_ASBANC - ERROR : ' ||
                        SQLERRM;
    
  END SP_DO_VALIDAD_EXIS_ASBANC;
  
/*****************************************************************
'* Nombre           :  SP_I_RECAUDACION_BN
'* Parámetros       :  PIN_NU_ID_MULTA : Id de la multa
'* Propósito        :  Procedure que registra la recaudación en Linea del Banco de la Nacion
'*                     
'* Output           :  POUT_NU_COD_RESULT: Devuelve codigo de error -1: error en la consulta
'*                     POUT_VC_MSG_RESULT: Devuelve mensaje del resultado o mensaje del error
'* Creado por       :  Victor Bendezú  Recaudación de Banco de la Nación 
'* Fec Creación     :  29/12/2022 17:06:00
'* Fec Actualización:  
'****************************************************************/
  PROCEDURE SP_I_RECAUDACION_BN(PIN_NU_ID_MULTA           IN NUMBER,
                                POUT_NU_COD_RESULT        OUT NUMBER,
                                POUT_VC_MSG_RESULT        OUT VARCHAR2) IS
  
  BEGIN
  
    INSERT INTO USR_TRANSAC_BN.BN_MULTAS_TRANSITO_MOV
    
      SELECT USR_TRANSAC_BN.SEC_MULTAS_TRANSITO_MOV.NEXTVAL AS NUM_ID,
             NULL AS VC_TIPO_REFERENCIA,
             T.COD_IDENTIFICACION_UNICO AS NU_NRO_CUM,
             '1085000000' AS VC_COD_BENEF,
             NULL AS VC_TIPO_OPER,
             '0000' AS VC_COD_RETORNO,
             NULL AS VC_CANAL_ATENCION,
             '0018' AS VC_BCO_EMISOR,
             SUBSTR(T.NOM_DENUNCIADO, 1, 70) AS VC_DES_CLIENTE,
             T.COD_IDENTIFICACION_UNICO AS VC_REF_PAGO,
             T.NRO_CUOTA AS VC_NRO_CUOTA,
             T.NRO_DOCUMENTO AS VC_COD_CLIENTE,
             T.FEC_VEN_CUPOM AS DT_FEC_VCTO,
             T.COD_MONEDA AS VC_MONEDA,
             (T.MONTO_CUPON + T.MONTO_MORA) AS NU_TOTAL_COBRAR,
             DECODE(NVL(T.ESTADO_EXPEDIENTE, 0),
                    4,
                    (T.MONTO_CUPON + T.MONTO_MORA),
                    T.MONTO_MINIMO) AS NU_MONTO_MIN,
             NULL AS NU_INTERESES,
             NULL AS NU_INT_COMPENSATORIO,
             T.MONTO_MORA AS NU_INT_MORATORIOS,
             T.MONTO_CUPON AS NU_IMP_CUOTA,
             T.COD_UNICO_EXPEDIENTE AS VC_LIBRE,
             SYSDATE AS AUD_FEC_REGISTRO,
             'USR_SICOB' AS AUD_USUARIO,
             NULL AS AUD_TERMINAL,
             'A' VC_IND_ESTADO
        FROM (
              
              SELECT DISTINCT 'PEN' COD_MONEDA,
                      MUL.ANIO || MUL.CUM AS COD_IDENTIFICACION_UNICO,
                      LPAD('0', 2, 0) AS NRO_CUOTA,
                      RPAD(USR_SICOB.FUN_SCOB_ALFANUMERICO(UPPER((SUBSTR((DECODE(PER.TIPO_PERSONA,1,
                              USR_SICOB.FUN_SCOB_ALFA_CAREXT(TRIM(PER.APE_PATERNO) || ' ' || TRIM(PER.APE_MATERNO) || ' ' || TRIM(PER.PRI_NOMBRE)),
                              2,
                              USR_SICOB.FUN_SCOB_ALFA_CAREXT(PER.RAZON_SOCIAL))),
                                                                         1,
                                                                         40)))),
                           40,
                           '  ') NOM_DENUNCIADO,
                      PER.NRO_DOC NRO_DOCUMENTO,
                      NVL(EXP.ANIO, '0000') ||
                      LPAD(SUBSTR(NVL(EXP.NRO_EXPEDIENTE, '0000000'), -7),
                           7,
                           0) || LPAD(NVL(ARECO.CODIGO, '000'), 3, 0) ||
                          LPAD(SUBSTR(NVL(MUL.ANIO_FILE_AEC, '00'), -2), 2, 0) ||
                          LPAD((SUBSTR(NVL(MUL.NRO_FILE_AEC, '000000'), -6)), 6, 0) ||
                          LPAD(SUBSTR(NVL(MUL.IND_DESCUENTO, '0'), -1), 1, 0) ||
                          '000000' || 'S' AS COD_UNICO_EXPEDIENTE,
                      TO_CHAR(SYSDATE, 'YYYY-MM-DD') AS FEC_SERVIDOR,
                      (CASE
                        WHEN MUL.SALDO_IM <> 0 THEN
                         TRUNC(SYSDATE) - 1
                        WHEN MUL.SALDO_IM = 0 THEN
                         TRUNC(SYSDATE)
                      END) AS FEC_VEN_CUPOM,
                      MUL.SALDO + MUL.SALDO_IC + MUL.SALDO_COSTAS AS MONTO_CUPON,
                      NVL(MUL.MONTO_INTERES_MORATORIO, 0) AS MONTO_MORA,
                      1 AS MONTO_MINIMO,
                      RPAD('A', 48, ' ') AS REG_ACTUALIZACION,
                      '0' AS FLG_FRACC,
                      EXP.ESTADO_EXPEDIENTE AS ESTADO_EXPEDIENTE,
                      (SELECT 1
                         FROM USR_SICOB.T_SCOB_EXPED_CRONOGRAMA EXCRO1
                        WHERE EXCRO1.ID_EXPEDIENTE = EXP.ID_EXPEDIENTE
                          AND EXCRO1.FLG_ACTUAL = '1'
                          AND EXCRO1.COD_TIPO_CRONOGRAMA = 1
                          AND EXCRO1.ESTADO = '1') AS NU_FLAG_FRACC
              FROM USR_SICOB.T_SCOB_MULTA MUL  INNER JOIN USR_SICOB.T_SCOB_MULTA_DETAL MULDE ON MUL.ID_MULTA = MULDE.ID_MULTA
                          AND MULDE.FLG_ACTUAL = '1' AND MULDE.ESTADO = '1'
                   INNER JOIN USR_SICOB.T_SCOB_MULTA_SANCIONADO MULSA ON MULSA.FLG_PRINCIPAL = '1'
                         AND MULSA.ESTADO = '1' AND MULDE.ID_MULTA_DETAL = MULSA.ID_MULTA_DETAL
                   INNER JOIN USR_SICOB.T_SCOB_PERSONA PER ON MULSA.ID_PERSONA = PER.ID_PERSONA AND PER.COD_SANCIONADO IS NOT NULL
                   LEFT JOIN USR_SICOB.T_SCOB_EXPEDIENTE_MULTA EXPMUL ON MUL.ID_MULTA = EXPMUL.ID_MULTA AND EXPMUL.ESTADO = '1'
                   LEFT JOIN USR_SICOB.T_SCOB_EXPEDIENTE EXP ON EXPMUL.ID_EXPEDIENTE = EXP.ID_EXPEDIENTE AND EXP.ESTADO = '1'
                   LEFT JOIN USR_SICOB.T_SCOB_USUARIO USU ON USU.ID_USUARIO = MUL.ID_USUARIO_ASIG_COBRANZA
                   LEFT JOIN USR_SICOB.T_SCOB_AREA_COBRANZA ARECO ON ARECO.ID_AREA_COBRANZA = MUL.ID_AREA_COBRANZA
                   LEFT JOIN USR_SICOB.T_SCOB_ENTIDAD_FINANCIERA EF ON EF.ID_ENTIDAD_FINANCIERA = 1
              WHERE NVL(EXP.ESTADO_EXPEDIENTE, 0) <> 4
                 AND (MUL.SALDO + MUL.SALDO_IC + MUL.SALDO_COSTAS) > 0
                 AND MUL.ESTADO = '1'
                 AND MUL.FLG_EXCLUSION IS NULL
                 AND MUL.ID_MULTA = PIN_NU_ID_MULTA
                 
         UNION ALL
              -- CARGA MULTAS FRACCIONADAS
              SELECT 'PEN' COD_MONEDA,
                 MUL.ANIO || MUL.CUM AS COD_IDENTIFICACION_UNICO,
                 LPAD(EXCROD.NRO_CUOTA, 2, 0) AS NRO_CUOTA,
                 USR_SICOB.FUN_SCOB_ALFANUMERICO((UPPER(SUBSTR((DECODE(PER.TIPO_PERSONA,
                                                                       1,
                                                                       PER.APE_PATERNO || ' ' ||
                                                                       PER.APE_MATERNO || ' ' ||
                                                                       PER.PRI_NOMBRE || ' ' ||
                                                                       PER.SEG_NOMBRE,
                                                                       2,
                                                                       PER.RAZON_SOCIAL)),
                                                               1,
                                                               40)))) NOM_DENUNCIADO,
                 PER.NRO_DOC NRO_DOCUMENTO,
                 EXP.ANIO || LPAD(SUBSTR(EXP.NRO_EXPEDIENTE, -7), 7, 0) ||
                   LPAD(ARECO.CODIGO, 3, 0) ||
                   LPAD(SUBSTR(MUL.ANIO_FILE_AEC, -2), 2, 0) ||
                   LPAD((SUBSTR(MUL.NRO_FILE_AEC, -6)), 6, 0) || '0' || '000000' || 'S' AS COD_UNICO_EXPEDIENTE,
                 TO_CHAR(SYSDATE, 'YYYY-MM-DD') AS FEC_SERVIDOR,
                 TRUNC(EXCROD.FEC_VENCIMIENTO) AS FEC_VEN_CUPOM,
                 DECODE(EXCROD.NRO_CUOTA,1,
                        (EXCROD.SALDO + EXCROD.SALDO_IC + EXCROD.SALDO_COSTAS),
                        (EXCROD.SALDO + EXCROD.SALDO_IC)) AS MONTO_CUPON,
                 NVL(EXCROD.MONTO_INTERES_MORATORIO, 0) AS MONTO_MORA,
                 DECODE(EXCROD.NRO_CUOTA, 1,
                        (EXCROD.SALDO + EXCROD.SALDO_IC + EXCROD.SALDO_COSTAS),
                        (EXCROD.SALDO + EXCROD.SALDO_IC)) +
                        NVL(EXCROD.MONTO_INTERES_MORATORIO, 0) AS MONTO_MINIMO,
                 'A' AS REG_ACTUALIZACION,
                 '0' AS FLG_FRACC,
                 EXP.ESTADO_EXPEDIENTE AS ESTADO_EXPEDIENTE,
                 1 AS NU_FLAG_FRACC
              FROM USR_SICOB.T_SCOB_MULTA MUL
               INNER JOIN USR_SICOB.T_SCOB_MULTA_DETAL MULDE ON MUL.ID_MULTA = MULDE.ID_MULTA
                              AND MULDE.ESTADO = '1' AND MULDE.FLG_ACTUAL = '1'
               INNER JOIN USR_SICOB.T_SCOB_EXPEDIENTE_MULTA EXMUL ON MUL.ID_MULTA = EXMUL.ID_MULTA AND EXMUL.ESTADO = '1'
               INNER JOIN USR_SICOB.T_SCOB_EXPEDIENTE EXP ON EXP.ID_EXPEDIENTE = EXMUL.ID_EXPEDIENTE AND EXP.ESTADO = '1'
               INNER JOIN USR_SICOB.T_SCOB_EXPED_CRONOGRAMA EXCRO ON EXP.ID_EXPEDIENTE = EXCRO.ID_EXPEDIENTE
                              AND EXCRO.FLG_ACTUAL = '1' AND EXCRO.COD_TIPO_CRONOGRAMA = 1 AND EXCRO.ESTADO = '1'
               INNER JOIN USR_SICOB.T_SCOB_EXPED_CRONOGRAMA_DET EXCROD ON EXCRO.ID_EXPED_CRONOGRAMA_PAGO = EXCROD.ID_EXPED_CRONOGRAMA_PAGO
                              AND (EXCROD.ESTADO_CUOTA = 1 OR EXCROD.ESTADO_CUOTA = 2)  --- 1=Pendiente; 2=Cerrado
               INNER JOIN USR_SICOB.T_SCOB_MULTA_SANCIONADO MULSA ON MULDE.ID_MULTA_DETAL = MULSA.ID_MULTA_DETAL
                              AND MULSA.FLG_PRINCIPAL = '1' AND MULSA.ESTADO = '1'
               INNER JOIN USR_SICOB.T_SCOB_PERSONA PER ON MULSA.ID_PERSONA = PER.ID_PERSONA
                              AND PER.COD_SANCIONADO IS NOT NULL AND PER.ESTADO = '1'
               INNER JOIN USR_SICOB.T_SCOB_USUARIO USU ON USU.ID_USUARIO = MUL.ID_USUARIO_ASIG_COBRANZA
               INNER JOIN USR_SICOB.T_SCOB_AREA_COBRANZA ARECO ON ARECO.ID_AREA_COBRANZA = MUL.ID_AREA_COBRANZA
               WHERE EXP.ESTADO_EXPEDIENTE = 4 --- fraccionado
                 AND MUL.FLG_EXCLUSION IS NULL
                 AND ((MUL.SALDO + MUL.SALDO_IC + MUL.SALDO_COSTAS)) > 0 
                 AND MUL.ID_MULTA = PIN_NU_ID_MULTA
                 
               ORDER BY 1, 2, 3) T;
  
    COMMIT;
  
    POUT_NU_COD_RESULT := 0;
    POUT_VC_MSG_RESULT := 'CONFORME';
  
  EXCEPTION
    WHEN EX_CONTROLADO THEN
      POUT_NU_COD_RESULT := -1;
    WHEN OTHERS THEN
      POUT_NU_COD_RESULT := -1;
      POUT_VC_MSG_RESULT := 'ERROR NO CONTROLADO : SP_I_RECAUDACION_BN - ERROR : ' ||
                        SQLERRM;
    
  END SP_I_RECAUDACION_BN;

/*****************************************************************
'* Nombre           :  SP_I_RECAUDACION_ASBANC
'* Parámetros       :  PIN_NU_ID_MULTA : Id de la multa
'* Propósito        :  Procedure que registra la recaudación en Linea del Banco ASBANC
'*                     
'* Output           :  POUT_NU_COD_RESULT: Devuelve codigo de error -1: error en la consulta
'*                     POUT_VC_MSG_RESULT: Devuelve mensaje del resultado o mensaje del error
'* Creado por       :  Victor Bendezú  Recaudación de Banco de la Nación 
'* Fec Creación     :  29/12/2022 17:06:00
'* Fec Actualización:  
'****************************************************************/
  PROCEDURE SP_I_RECAUDACION_ASBANC(PIN_NU_ID_MULTA   IN NUMBER,
                                    POUT_NU_COD_RESULT OUT NUMBER,
                                    POUT_VC_MSG_RESULT OUT VARCHAR2) IS
  
  BEGIN
  
    INSERT INTO USR_TRANSAC_BN.T_RECA_MULTA
    
      SELECT USR_TRANSAC_BN.SEQ_RECA_MULTA.NEXTVAL AS NU_NUM_ID,
             NULL AS VC_TIPO_REFERENCIA,
             T.COD_IDENTIFICACION_UNICO AS NU_NRO_CUM,
             '1085000000' AS VC_COD_BENEF,
             NULL AS VC_TIPO_OPER,
             '0000' AS VC_COD_RETORNO,
             NULL AS VC_CANAL_ATENCION,
             '0018' AS VC_BCO_EMISOR,
             SUBSTR(T.NOM_DENUNCIADO, 1, 70) AS VC_DES_CLIENTE,
             T.COD_IDENTIFICACION_UNICO AS VC_REF_PAGO,
             T.NRO_CUOTA AS VC_NRO_CUOTA,
             T.NRO_DOCUMENTO AS VC_COD_CLIENTE,
             T.FEC_VEN_CUPOM AS DT_FEC_VCTO,
             T.COD_MONEDA AS VC_MONEDA,
             (T.MONTO_CUPON + T.MONTO_MORA) AS NU_TOTAL_COBRAR,
             DECODE(NVL(ESTADO_EXPEDIENTE, 0), 4, (T.MONTO_CUPON + T.MONTO_MORA), T.MONTO_MINIMO) AS NU_MONTO_MIN,
             NULL AS NU_INTERESES,
             NULL AS NU_INT_COMPENSATORIO,
             T.MONTO_MORA AS NU_INT_MORATORIOS,
             T.MONTO_CUPON AS NU_IMP_CUOTA,
             T.COD_UNICO_EXPEDIENTE AS VC_LIBRE,
             SYSDATE AS AUD_FEC_REGISTRO,
             'USR_SICOB' AS AUD_USUARIO,
             NULL AS AUD_TERMINAL,
             'A' VC_IND_ESTADO,
             (T.MONTO_CUPON + T.MONTO_MORA) AS NU_SALDO_TEMP,
             VC_TIPO_MULTA
        FROM (
              
              SELECT DISTINCT 'PEN' COD_MONEDA,
                      MUL.ANIO || MUL.CUM AS COD_IDENTIFICACION_UNICO,
                      LPAD('0', 2, 0) AS NRO_CUOTA,
                      RPAD(USR_SICOB.FUN_SCOB_ALFANUMERICO(UPPER((SUBSTR((DECODE(PER.TIPO_PERSONA,1,
                              USR_SICOB.FUN_SCOB_ALFA_CAREXT(TRIM(PER.APE_PATERNO) || ' ' ||  TRIM(PER.APE_MATERNO) || ' ' || TRIM(PER.PRI_NOMBRE)),
                              2,
                              USR_SICOB.FUN_SCOB_ALFA_CAREXT(PER.RAZON_SOCIAL))),
                                                                         1,
                                                                         40)))),
                           40,
                           '  ') NOM_DENUNCIADO,
                      PER.NRO_DOC NRO_DOCUMENTO,
                      NVL(EXP.ANIO, '0000') || LPAD(SUBSTR(NVL(EXP.NRO_EXPEDIENTE, '0000000'), -7),
                          7,
                          0) || LPAD(NVL(ARECO.CODIGO, '000'), 3, 0) ||
                          LPAD(SUBSTR(NVL(MUL.ANIO_FILE_AEC, '00'), -2), 2, 0) ||
                          LPAD((SUBSTR(NVL(MUL.NRO_FILE_AEC, '000000'), -6)), 6, 0) ||
                          LPAD(SUBSTR(NVL(MUL.IND_DESCUENTO, '0'), -1), 1, 0) ||
                          '000000' || 'S' AS COD_UNICO_EXPEDIENTE,
                      TO_CHAR(SYSDATE, 'YYYY-MM-DD') AS FEC_SERVIDOR,
                      (CASE
                        WHEN MUL.SALDO_IM <> 0 THEN
                         TRUNC(SYSDATE) - 1
                        WHEN MUL.SALDO_IM = 0 THEN
                         TRUNC(SYSDATE)
                      END) AS FEC_VEN_CUPOM,
                      MUL.SALDO + MUL.SALDO_IC + MUL.SALDO_COSTAS AS MONTO_CUPON,
                      NVL(MUL.MONTO_INTERES_MORATORIO, 0) AS MONTO_MORA,
                      1 AS MONTO_MINIMO,
                      RPAD('A', 48, ' ') AS REG_ACTUALIZACION,
                      '0' AS FLG_FRACC,
                      EXP.ESTADO_EXPEDIENTE AS ESTADO_EXPEDIENTE,
                      (SELECT 1
                         FROM USR_SICOB.T_SCOB_EXPED_CRONOGRAMA EXCRO1
                        WHERE EXCRO1.ID_EXPEDIENTE = EXP.ID_EXPEDIENTE
                          AND EXCRO1.FLG_ACTUAL = '1'
                          AND EXCRO1.COD_TIPO_CRONOGRAMA = 1
                          AND EXCRO1.ESTADO = '1') AS NU_FLAG_FRACC,
                      DECODE(EXP.ESTADO_EXPEDIENTE, 4, 'FR', 'NF') AS VC_TIPO_MULTA
              FROM USR_SICOB.T_SCOB_MULTA MUL INNER JOIN USR_SICOB.T_SCOB_MULTA_DETAL MULDE ON MUL.ID_MULTA = MULDE.ID_MULTA
                              AND MULDE.FLG_ACTUAL = '1' AND MULDE.ESTADO = '1'
                   INNER JOIN USR_SICOB.T_SCOB_MULTA_SANCIONADO MULSA ON MULSA.FLG_PRINCIPAL = '1' AND MULSA.ESTADO = '1'
                              AND MULDE.ID_MULTA_DETAL = MULSA.ID_MULTA_DETAL
                   INNER JOIN USR_SICOB.T_SCOB_PERSONA PER ON MULSA.ID_PERSONA = PER.ID_PERSONA AND PER.COD_SANCIONADO IS NOT NULL
                   LEFT JOIN USR_SICOB.T_SCOB_EXPEDIENTE_MULTA EXPMUL ON MUL.ID_MULTA = EXPMUL.ID_MULTA AND EXPMUL.ESTADO = '1'
                   LEFT JOIN USR_SICOB.T_SCOB_EXPEDIENTE EXP ON EXPMUL.ID_EXPEDIENTE = EXP.ID_EXPEDIENTE AND EXP.ESTADO = '1'
                   LEFT JOIN USR_SICOB.T_SCOB_USUARIO USU ON USU.ID_USUARIO = MUL.ID_USUARIO_ASIG_COBRANZA
                   LEFT JOIN USR_SICOB.T_SCOB_AREA_COBRANZA ARECO ON ARECO.ID_AREA_COBRANZA = MUL.ID_AREA_COBRANZA
                   LEFT JOIN USR_SICOB.T_SCOB_ENTIDAD_FINANCIERA EF ON EF.ID_ENTIDAD_FINANCIERA = 1
              WHERE (MUL.SALDO + MUL.SALDO_IC + MUL.SALDO_COSTAS) > 0
                 AND MUL.ESTADO = '1'
                 AND NVL(EXP.ESTADO_EXPEDIENTE, 0) <> 4
                 AND MUL.FLG_EXCLUSION IS NULL
                 AND MUL.ID_MULTA = PIN_NU_ID_MULTA
         UNION ALL
              -- SICOB: CARGA MULTAS FRACCIONADAS
             SELECT 'PEN' COD_MONEDA,
                      MUL.ANIO || SUBSTR(MUL.CUM,3, 8) || LPAD(EXCROD.NRO_CUOTA, 2, '0') AS COD_IDENTIFICACION_UNICO,
                      LPAD(EXCROD.NRO_CUOTA, 2, '0') AS NRO_CUOTA,
                      USR_SICOB.FUN_SCOB_ALFANUMERICO((UPPER(SUBSTR((DECODE(PER.TIPO_PERSONA,1,
                              PER.APE_PATERNO || ' ' || PER.APE_MATERNO || ' ' || PER.PRI_NOMBRE || ' ' || PER.SEG_NOMBRE,
                              2,
                              PER.RAZON_SOCIAL)),
                              1,
                              40)))) NOM_DENUNCIADO,
                      PER.NRO_DOC NRO_DOCUMENTO,
                      EXP.ANIO ||
                          LPAD(SUBSTR(EXP.NRO_EXPEDIENTE, -7), 7, 0) ||
                          LPAD(ARECO.CODIGO, 3, 0) ||
                          LPAD(SUBSTR(MUL.ANIO_FILE_AEC, -2), 2, 0) ||
                          LPAD((SUBSTR(MUL.NRO_FILE_AEC, -6)), 6, 0) || '0' ||
                          '000000' || 'S' AS COD_UNICO_EXPEDIENTE,
                      TO_CHAR(SYSDATE, 'YYYY-MM-DD') AS FEC_SERVIDOR,
                      TRUNC(EXCROD.FEC_VENCIMIENTO) AS FEC_VEN_CUPOM,
                      DECODE(EXCROD.NRO_CUOTA,1,
                                     (EXCROD.SALDO + EXCROD.SALDO_IC +
                                     EXCROD.SALDO_COSTAS),
                                     (EXCROD.SALDO + EXCROD.SALDO_IC)) AS MONTO_CUPON,
                      NVL(EXCROD.MONTO_INTERES_MORATORIO, 0) AS MONTO_MORA,
                      DECODE(EXCROD.NRO_CUOTA, 1,
                             (EXCROD.SALDO + EXCROD.SALDO_IC + EXCROD.SALDO_COSTAS),
                             (EXCROD.SALDO + EXCROD.SALDO_IC)) +
                             NVL(EXCROD.MONTO_INTERES_MORATORIO, 0) AS MONTO_MINIMO,
                      'A' AS REG_ACTUALIZACION,
                      '0' AS FLG_FRACC,
                      EXP.ESTADO_EXPEDIENTE AS ESTADO_EXPEDIENTE,
                      1 AS NU_FLAG_FRACC,
                      'FR' AS VC_TIPO_MULTA
             FROM USR_SICOB.T_SCOB_MULTA MUL
                  INNER JOIN USR_SICOB.T_SCOB_MULTA_DETAL MULDE ON MUL.ID_MULTA = MULDE.ID_MULTA
                          AND MULDE.ESTADO = '1' AND MULDE.FLG_ACTUAL = '1'
                  INNER JOIN USR_SICOB.T_SCOB_EXPEDIENTE_MULTA EXMUL ON MUL.ID_MULTA = EXMUL.ID_MULTA AND EXMUL.ESTADO = '1'
                  INNER JOIN USR_SICOB.T_SCOB_EXPEDIENTE EXP ON EXP.ID_EXPEDIENTE = EXMUL.ID_EXPEDIENTE AND EXP.ESTADO = '1'
                  INNER JOIN USR_SICOB.T_SCOB_EXPED_CRONOGRAMA EXCRO ON EXP.ID_EXPEDIENTE = EXCRO.ID_EXPEDIENTE --- 1=Fraccionamiento ; 2=Pago Programado
                          AND EXCRO.FLG_ACTUAL = '1' AND EXCRO.COD_TIPO_CRONOGRAMA = 1 AND EXCRO.ESTADO = '1'
                  INNER JOIN USR_SICOB.T_SCOB_EXPED_CRONOGRAMA_DET EXCROD ON EXCRO.ID_EXPED_CRONOGRAMA_PAGO = EXCROD.ID_EXPED_CRONOGRAMA_PAGO --- 1=Pendiente; 2=Pago Parcial; 3=Pago Total
                          AND (EXCROD.ESTADO_CUOTA = 1 OR EXCROD.ESTADO_CUOTA = 2) --- 1=Pendiente; 2=Cerrado
                  INNER JOIN USR_SICOB.T_SCOB_MULTA_SANCIONADO MULSA ON MULDE.ID_MULTA_DETAL = MULSA.ID_MULTA_DETAL
                          AND MULSA.FLG_PRINCIPAL = '1' AND MULSA.ESTADO = '1'
                  INNER JOIN USR_SICOB.T_SCOB_PERSONA PER ON MULSA.ID_PERSONA = PER.ID_PERSONA
                          AND PER.COD_SANCIONADO IS NOT NULL AND PER.ESTADO = '1'
                  INNER JOIN USR_SICOB.T_SCOB_USUARIO USU ON USU.ID_USUARIO = MUL.ID_USUARIO_ASIG_COBRANZA
                  INNER JOIN USR_SICOB.T_SCOB_AREA_COBRANZA ARECO ON ARECO.ID_AREA_COBRANZA = MUL.ID_AREA_COBRANZA
             WHERE EXP.ESTADO_EXPEDIENTE = 4 
                  AND MUL.FLG_EXCLUSION IS NULL
                  AND ((MUL.SALDO + MUL.SALDO_IC + MUL.SALDO_COSTAS)) > 0
                  AND MUL.ID_MULTA = PIN_NU_ID_MULTA
         ORDER BY 1, 2, 3   
                 ) T;
  
    COMMIT;
  
    POUT_NU_COD_RESULT := 0;
    POUT_VC_MSG_RESULT := 'CONFORME';
  
  EXCEPTION
    WHEN EX_CONTROLADO THEN
      POUT_NU_COD_RESULT := -1;
    WHEN OTHERS THEN
      POUT_NU_COD_RESULT := -1;
      POUT_VC_MSG_RESULT := 'ERROR NO CONTROLADO : SP_I_RECAUDACION_ASBANC - ERROR : ' ||
                        SQLERRM;
    
  END SP_I_RECAUDACION_ASBANC;

/*****************************************************************
'* Nombre           :  SP_D_RECAUDACION_BN
'* Parámetros       :  PIN_NU_ID_MULTA : Id de la multa
'* Propósito        :  Método que elimina el registro en la tabla del BN
'*                     para el cum especifico.
'* Output           :  POUT_NU_COD_RESULT: Devuelve codigo de error o validacion
'*                                         0: No existe 1: Existe  -1: error en la consulta
'*                     POUT_VC_MSG_RESULT: Devuelve mensaje del resultado o mensaje del error
'* Creado por       :  JJIMENEZ
'* Fec Creación     :  2023-02-07 17:06:00
'* Fec Actualización:  
'****************************************************************/
PROCEDURE SP_D_RECAUDACION_BN(PIN_NU_ID_MULTA         IN NUMBER,
                              POUT_NU_COD_RESULT        OUT NUMBER,
                              POUT_VC_MSG_RESULT        OUT VARCHAR2) IS
  
      V_VC_NUM_CUM              USR_TRANSAC_BN.BN_MULTAS_TRANSITO_MOV.NU_NRO_CUM%TYPE;
      --V_NU_NUM_ID               USR_TRANSAC_BN.BN_MULTAS_TRANSITO_MOV.NUM_ID%TYPE;
   BEGIN
      SELECT T.ANIO || T.CUM INTO V_VC_NUM_CUM FROM USR_SICOB.T_SCOB_MULTA T WHERE T.ID_MULTA=PIN_NU_ID_MULTA;
      --SELECT T.NUM_ID INTO V_NU_NUM_ID FROM USR_TRANSAC_BN.BN_MULTAS_TRANSITO_MOV T WHERE T.NU_NRO_CUM=V_VC_NUM_CUM; 
      --DELETE USR_TRANSAC_BN.BN_MULTAS_TRANSITO_MOV WHERE NUM_ID= V_NU_NUM_ID;          
      DELETE USR_TRANSAC_BN.BN_MULTAS_TRANSITO_MOV 
      WHERE NU_NRO_CUM= V_VC_NUM_CUM;
      
      COMMIT;
  
      POUT_NU_COD_RESULT := 0;
      POUT_VC_MSG_RESULT := 'CONFORME';
    
  EXCEPTION
    WHEN EX_CONTROLADO THEN
      POUT_NU_COD_RESULT := -1;
    WHEN OTHERS THEN
      POUT_NU_COD_RESULT := -1;
      POUT_VC_MSG_RESULT := 'ERROR NO CONTROLADO : SP_D_RECAUDACION_BN - ERROR : ' ||
                        SQLERRM;
    
  END SP_D_RECAUDACION_BN;

/*****************************************************************
'* Nombre           :  SP_D_RECAUDACION_ASBANC
'* Parámetros       :  PIN_NU_ID_MULTA : Id de la multa
'* Propósito        :  Método que elimina el registro en la tabla del ASBANC
'*                     para el cum especifico.
'* Output           :  POUT_NU_COD_RESULT: Devuelve codigo de error o validacion
'*                                         0: No existe 1: Existe  -1: error en la consulta
'*                     POUT_VC_MSG_RESULT: Devuelve mensaje del resultado o mensaje del error
'* Creado por       :  JJIMENEZ
'* Fec Creación     :  2023-02-07 17:06:00
'* Fec Actualización:  
'****************************************************************/
PROCEDURE SP_D_RECAUDACION_ASBANC(PIN_NU_ID_MULTA         IN NUMBER,
                              POUT_NU_COD_RESULT        OUT NUMBER,
                              POUT_VC_MSG_RESULT        OUT VARCHAR2) IS
  
      V_VC_NUM_CUM              USR_TRANSAC_BN.T_RECA_MULTA.NU_NRO_CUM%TYPE;
      V_NU_MU_FR                NUMBER(2);
   BEGIN
      -- ES UN FRACCIONADO
      SELECT COUNT(0) INTO V_NU_MU_FR
      FROM USR_SICOB.T_SCOB_MULTA MUL
              INNER JOIN USR_SICOB.T_SCOB_MULTA_DETAL MULDE ON MUL.ID_MULTA = MULDE.ID_MULTA
                      AND MULDE.ESTADO = '1' AND MULDE.FLG_ACTUAL = '1'
              INNER JOIN USR_SICOB.T_SCOB_EXPEDIENTE_MULTA EXMUL ON MUL.ID_MULTA = EXMUL.ID_MULTA AND EXMUL.ESTADO = '1'
              INNER JOIN USR_SICOB.T_SCOB_EXPEDIENTE EXP ON EXP.ID_EXPEDIENTE = EXMUL.ID_EXPEDIENTE AND EXP.ESTADO = '1'
              INNER JOIN USR_SICOB.T_SCOB_EXPED_CRONOGRAMA EXCRO ON EXP.ID_EXPEDIENTE = EXCRO.ID_EXPEDIENTE 
                      AND EXCRO.FLG_ACTUAL = '1' AND EXCRO.COD_TIPO_CRONOGRAMA = 1 AND EXCRO.ESTADO = '1' --- 1=Fraccionamiento ; 2=Pago Programado
              INNER JOIN USR_SICOB.T_SCOB_EXPED_CRONOGRAMA_DET EXCROD ON EXCRO.ID_EXPED_CRONOGRAMA_PAGO = EXCROD.ID_EXPED_CRONOGRAMA_PAGO 
                      AND (EXCROD.ESTADO_CUOTA = 1 OR EXCROD.ESTADO_CUOTA = 2) --- 1=Pendiente; 2=Pago Parcial; 3=Pago Total
      WHERE MUL.ID_MULTA = PIN_NU_ID_MULTA;
      
      IF V_NU_MU_FR>0 THEN
          SELECT MUL.ANIO || SUBSTR(MUL.CUM,3, 8) || LPAD(EXCROD.NRO_CUOTA, 2, '0') INTO V_VC_NUM_CUM
          FROM USR_SICOB.T_SCOB_MULTA MUL
              INNER JOIN USR_SICOB.T_SCOB_MULTA_DETAL MULDE ON MUL.ID_MULTA = MULDE.ID_MULTA
                      AND MULDE.ESTADO = '1' AND MULDE.FLG_ACTUAL = '1'
              INNER JOIN USR_SICOB.T_SCOB_EXPEDIENTE_MULTA EXMUL ON MUL.ID_MULTA = EXMUL.ID_MULTA AND EXMUL.ESTADO = '1'
              INNER JOIN USR_SICOB.T_SCOB_EXPEDIENTE EXP ON EXP.ID_EXPEDIENTE = EXMUL.ID_EXPEDIENTE AND EXP.ESTADO = '1'
              INNER JOIN USR_SICOB.T_SCOB_EXPED_CRONOGRAMA EXCRO ON EXP.ID_EXPEDIENTE = EXCRO.ID_EXPEDIENTE 
                      AND EXCRO.FLG_ACTUAL = '1' AND EXCRO.COD_TIPO_CRONOGRAMA = 1 AND EXCRO.ESTADO = '1' --- 1=Fraccionamiento ; 2=Pago Programado
              INNER JOIN USR_SICOB.T_SCOB_EXPED_CRONOGRAMA_DET EXCROD ON EXCRO.ID_EXPED_CRONOGRAMA_PAGO = EXCROD.ID_EXPED_CRONOGRAMA_PAGO 
                      AND (EXCROD.ESTADO_CUOTA = 1 OR EXCROD.ESTADO_CUOTA = 2) --- 1=Pendiente; 2=Pago Parcial; 3=Pago Total
          WHERE MUL.ID_MULTA = PIN_NU_ID_MULTA
          AND EXCROD.NRO_CUOTA IN (SELECT MIN(T.NRO_CUOTA) FROM USR_SICOB.T_SCOB_EXPED_CRONOGRAMA_DET T 
                                          WHERE T.ID_EXPED_CRONOGRAMA_PAGO=EXCRO.ID_EXPED_CRONOGRAMA_PAGO
                                          AND (T.ESTADO_CUOTA = 1 OR T.ESTADO_CUOTA = 2)) ;           
      ELSE
          SELECT T.ANIO || T.CUM INTO V_VC_NUM_CUM FROM USR_SICOB.T_SCOB_MULTA T WHERE T.ID_MULTA=PIN_NU_ID_MULTA;
      END IF;
      DBMS_OUTPUT.PUT_LINE('SP_D_RECAUDACION_ASBANC>>V_VC_NUM_CUM>>' || V_VC_NUM_CUM);
                       
      DELETE USR_TRANSAC_BN.T_RECA_MULTA 
      WHERE NU_NRO_CUM= V_VC_NUM_CUM;
      
      COMMIT;
  
      POUT_NU_COD_RESULT := 0;
      POUT_VC_MSG_RESULT := 'CONFORME';
    
  EXCEPTION
    WHEN EX_CONTROLADO THEN
      POUT_NU_COD_RESULT := -1;
    WHEN OTHERS THEN
      POUT_NU_COD_RESULT := -1;
      POUT_VC_MSG_RESULT := 'ERROR NO CONTROLADO : SP_D_RECAUDACION_ASBANC - ERROR : ' ||
                        SQLERRM;
    
  END SP_D_RECAUDACION_ASBANC;
 
/*****************************************************************
'* Nombre           :  SP_DO_GRABAR_BN
'* Parámetros       :  PIN_NU_ID_MULTA : Id de la multa
'* Propósito        :  Método que graba el registro en el BN
'*                     para el cum especifico.
'* Output           :  POUT_NU_COD_RESULT: Devuelve codigo de error 
'*                                         0: Ok  -1: error 
'*                     POUT_VC_MSG_RESULT: Devuelve mensaje del resultado o mensaje del error
'* Creado por       :  JJIMENEZ
'* Fec Creación     :  2023-02-07 17:06:00
'* Fec Actualización:  
'****************************************************************/
PROCEDURE SP_DO_GRABAR_BN(PIN_NU_ID_MULTA         IN NUMBER,
                          POUT_NU_COD_RESULT        OUT NUMBER,
                          POUT_VC_MSG_RESULT        OUT VARCHAR2) IS
  
    V_VC_MSG              VARCHAR2(500);
    V_NU_RETORNO          NUMBER(2);
BEGIN
    --DBMS_OUTPUT.PUT_LINE('SP_DO_GRABAR_BN>>PIN_NU_ID_MULTA>>' || PIN_NU_ID_MULTA);
    SP_DO_VALIDAD_EXIS_BN(PIN_NU_ID_MULTA,V_NU_RETORNO,V_VC_MSG);
    --DBMS_OUTPUT.PUT_LINE('SP_DO_GRABAR_BN>>V_NU_RETORNO>>' || V_NU_RETORNO);
    IF V_NU_RETORNO=1 THEN
       SP_D_RECAUDACION_BN(PIN_NU_ID_MULTA,V_NU_RETORNO,V_VC_MSG);  
       --DBMS_OUTPUT.PUT_LINE('SP_DO_GRABAR_BN>>SP_D_RECAUDACION_BN>>V_NU_RETORNO>>' || V_NU_RETORNO);
    END IF;    
    
    IF V_NU_RETORNO=-1 THEN
      POUT_NU_COD_RESULT:=-1;
      V_NU_RETORNO:=V_VC_MSG;
    ELSE
       SP_I_RECAUDACION_BN(PIN_NU_ID_MULTA,V_NU_RETORNO,V_VC_MSG);
       --DBMS_OUTPUT.PUT_LINE('SP_DO_GRABAR_BN>>SP_I_RECAUDACION_BN>>V_NU_RETORNO>>' || V_NU_RETORNO);
    END IF;
    IF V_NU_RETORNO=-1 THEN
      POUT_NU_COD_RESULT:=-1;
      POUT_VC_MSG_RESULT:=V_VC_MSG;
      ROLLBACK;
    ELSE
      POUT_NU_COD_RESULT:=0;
      POUT_VC_MSG_RESULT := 'CONFORME';
      COMMIT;
    END IF;
EXCEPTION
  WHEN EX_CONTROLADO THEN
    POUT_NU_COD_RESULT := -1;
  WHEN OTHERS THEN
    POUT_NU_COD_RESULT := -1;
    POUT_VC_MSG_RESULT := 'ERROR NO CONTROLADO : SP_DO_GRABAR_BN - ERROR : ' ||
                      SQLERRM;
    
END SP_DO_GRABAR_BN;
  
/*****************************************************************
'* Nombre           :  SP_DO_GRABAR_ASBANC
'* Parámetros       :  PIN_NU_ID_MULTA : Id de la multa
'* Propósito        :  Método que graba el registro en el ASBANC
'*                     para el cum especifico.
'* Output           :  POUT_NU_COD_RESULT: Devuelve codigo de error 
'*                                         0: Ok  -1: error 
'*                     POUT_VC_MSG_RESULT: Devuelve mensaje del resultado o mensaje del error
'* Creado por       :  JJIMENEZ
'* Fec Creación     :  2023-02-07 17:06:00
'* Fec Actualización:  
'****************************************************************/
PROCEDURE SP_DO_GRABAR_ASBANC(PIN_NU_ID_MULTA         IN NUMBER,
                          POUT_NU_COD_RESULT        OUT NUMBER,
                          POUT_VC_MSG_RESULT        OUT VARCHAR2) IS
  
    V_VC_MSG              VARCHAR2(500);
    V_NU_RETORNO          NUMBER(2);
BEGIN
    
    SP_DO_VALIDAD_EXIS_ASBANC(PIN_NU_ID_MULTA,V_NU_RETORNO,V_VC_MSG);
    IF V_NU_RETORNO=1 THEN
       SP_D_RECAUDACION_ASBANC(PIN_NU_ID_MULTA,V_NU_RETORNO,V_VC_MSG);  
    END IF;    
    
    IF V_NU_RETORNO=-1 THEN
      POUT_NU_COD_RESULT:=-1;
      V_NU_RETORNO:=V_VC_MSG;
    ELSE
       SP_I_RECAUDACION_ASBANC(PIN_NU_ID_MULTA,V_NU_RETORNO,V_VC_MSG);
    END IF;
    IF V_NU_RETORNO=-1 THEN
      POUT_NU_COD_RESULT:=-1;
      POUT_VC_MSG_RESULT:=V_VC_MSG;
      ROLLBACK;
    ELSE
      POUT_NU_COD_RESULT:=0;
      POUT_VC_MSG_RESULT := 'CONFORME';
      commit;
    END IF;
    
EXCEPTION
  WHEN EX_CONTROLADO THEN
    POUT_NU_COD_RESULT := -1;
  WHEN OTHERS THEN
    POUT_NU_COD_RESULT := -1;
    POUT_VC_MSG_RESULT := 'ERROR NO CONTROLADO : SP_DO_GRABAR_ASBANC - ERROR : ' ||
                      SQLERRM;
    
END SP_DO_GRABAR_ASBANC;

/*****************************************************************
'* Nombre           :  SP_D_ASBANC_PAGO_TR
'* Parámetros       :  PIN_VC_NUM_CUM : Número del CUM si es no fraccionado
'*                                    Número del CUM || Nro cuota si es fraccionado
'*                                    de tal forma que siempre sera de 14 caracteres.
'* Propósito        :  Método que elimina el registro cobro de pago de un CUM  
'*                     para ASBANC, se llama desde el batchero del registro del pago.
'* Output           :  --
'* Creado por       :  JJIMENEZ
'* Fec Creación     :  2023-02-09 18:06:00
'* Fec Actualización:  
'****************************************************************/
PROCEDURE SP_D_ASBANC_PAGO_TR(PIN_VC_NUM_CUM         IN VARCHAR2) IS
  
      V_VC_MSG_RESULT              VARCHAR2(500);
      V_NU_COD_RESULT              NUMBER;
   BEGIN
      DELETE USR_TRANSAC_BN.T_RECA_MULTA 
      WHERE NU_NRO_CUM= PIN_VC_NUM_CUM;
      
      COMMIT;
  
      V_VC_MSG_RESULT := 'CONFORME';
    
  EXCEPTION
    WHEN EX_CONTROLADO THEN
      V_NU_COD_RESULT := -1;
    WHEN OTHERS THEN
      V_VC_MSG_RESULT := 'ERROR NO CONTROLADO : SP_D_ASBANC_PAGO_TR - ERROR : ' ||
                        SQLERRM;
    
END SP_D_ASBANC_PAGO_TR;


/*****************************************************************
'* Nombre           :  SP_D_BN_PAGO_TR
'* Parámetros       :  PIN_VC_NUM_CUM : Número del CUM si es no fraccionado
'*                                    Número del CUM || Nro cuota si es fraccionado
'*                                    de tal forma que siempre sera de 14 caracteres.
'* Propósito        :  Método que elimina el registro cobro de pago de un CUM  
'*                     para BN, se llama desde el batchero del registro del pago.
'* Output           :  --
'* Creado por       :  JJIMENEZ
'* Fec Creación     :  2023-02-09 18:16:00
'* Fec Actualización:  
'****************************************************************/
PROCEDURE SP_D_BN_PAGO_TR(PIN_VC_NUM_CUM         IN VARCHAR2) IS
  
      V_VC_MSG_RESULT              VARCHAR2(500);
   BEGIN
      DELETE USR_TRANSAC_BN.BN_MULTAS_TRANSITO_MOV 
      WHERE NU_NRO_CUM= PIN_VC_NUM_CUM;
      
      COMMIT;
  
      V_VC_MSG_RESULT := 'CONFORME';
    
  EXCEPTION
    WHEN EX_CONTROLADO THEN
      V_VC_MSG_RESULT := '-1';
    WHEN OTHERS THEN
      V_VC_MSG_RESULT := 'ERROR NO CONTROLADO : SP_D_BN_PAGO_TR - ERROR : ' ||
                        SQLERRM;
    
END SP_D_BN_PAGO_TR;


/*****************************************************************
'* Nombre           :  SP_DO_GRABAR_ASBANC_X_EXP
'* Parámetros       :  PIN_NU_ID_EXPEDIENTE : Id del expediente coactivo
'* Propósito        :  Método que graba el registro en el ASBANC
'*                     para el expediente coactivo, incluye acumulados
'* Output           :  POUT_NU_COD_RESULT: Devuelve codigo de error 
'*                                         0: Ok  -1: error 
'*                     POUT_VC_MSG_RESULT: Devuelve mensaje del resultado o mensaje del error
'* Creado por       :  JJIMENEZ
'* Fec Creación     :  2023-02-13 17:06:00
'* Fec Actualización:  
'****************************************************************/
PROCEDURE SP_DO_GRABAR_ASBANC_X_EXP(PIN_NU_ID_EXPEDIENTE         IN NUMBER,
                          POUT_NU_COD_RESULT        OUT NUMBER,
                          POUT_VC_MSG_RESULT        OUT VARCHAR2) IS
  
    V_VC_MSG              VARCHAR2(500);
    V_NU_RETORNO          NUMBER(2);
    V_REG_T_SCOB_EXPED_MULTA USR_SICOB.T_SCOB_EXPEDIENTE_MULTA%ROWTYPE;    
    CURSOR V_CUR_T_SCOB_EXPED_MULTA IS
       SELECT EM.*
       FROM USR_SICOB.T_SCOB_EXPEDIENTE_MULTA EM
       WHERE EM.ID_EXPEDIENTE = PIN_NU_ID_EXPEDIENTE
       AND EM.ESTADO = '1';
BEGIN
    OPEN V_CUR_T_SCOB_EXPED_MULTA;
    LOOP 
        FETCH V_CUR_T_SCOB_EXPED_MULTA INTO V_REG_T_SCOB_EXPED_MULTA;
           
        EXIT WHEN V_CUR_T_SCOB_EXPED_MULTA%NOTFOUND;    
        
        SP_DO_VALIDAD_EXIS_ASBANC(V_REG_T_SCOB_EXPED_MULTA.ID_MULTA,V_NU_RETORNO,V_VC_MSG);
        IF V_NU_RETORNO=1 THEN
             SP_D_RECAUDACION_ASBANC(V_REG_T_SCOB_EXPED_MULTA.ID_MULTA,V_NU_RETORNO,V_VC_MSG);  
        END IF;
        IF V_NU_RETORNO=-1 THEN
            POUT_NU_COD_RESULT:=-1;
            V_NU_RETORNO:=V_VC_MSG;
        ELSE
            SP_I_RECAUDACION_ASBANC(V_REG_T_SCOB_EXPED_MULTA.ID_MULTA,V_NU_RETORNO,V_VC_MSG);
        END IF; 
        IF V_NU_RETORNO=-1 THEN
            POUT_NU_COD_RESULT:=-1;
            POUT_VC_MSG_RESULT:=V_VC_MSG;
            ROLLBACK; 
        END IF;
     END LOOP;
     CLOSE V_CUR_T_SCOB_EXPED_MULTA;  
     
     POUT_NU_COD_RESULT:=0;
     POUT_VC_MSG_RESULT := 'CONFORME';
     COMMIT;
    
EXCEPTION
  WHEN EX_CONTROLADO THEN
    POUT_NU_COD_RESULT := -1;
  WHEN OTHERS THEN
    POUT_NU_COD_RESULT := -1;
    POUT_VC_MSG_RESULT := 'ERROR NO CONTROLADO : SP_DO_GRABAR_ASBANC_X_EXP - ERROR : ' ||
                      SQLERRM;
END SP_DO_GRABAR_ASBANC_X_EXP;

/*****************************************************************
'* Nombre           :  SP_DO_GRABAR_BN_X_EXP
'* Parámetros       :  PIN_NU_ID_EXPEDIENTE : Id del expediente coactivo
'* Propósito        :  Método que graba el registro en el ASBANC
'*                     para el expediente coactivo, incluye acumulados.
'* Output           :  POUT_NU_COD_RESULT: Devuelve codigo de error 
'*                                         0: Ok  -1: error 
'*                     POUT_VC_MSG_RESULT: Devuelve mensaje del resultado o mensaje del error
'* Creado por       :  JJIMENEZ
'* Fec Creación     :  2023-02-13 17:06:00
'* Fec Actualización:  
'****************************************************************/
PROCEDURE SP_DO_GRABAR_BN_X_EXP(PIN_NU_ID_EXPEDIENTE         IN NUMBER,
                          POUT_NU_COD_RESULT        OUT NUMBER,
                          POUT_VC_MSG_RESULT        OUT VARCHAR2) IS
  
    V_VC_MSG              VARCHAR2(500);
    V_NU_RETORNO          NUMBER(2);
    V_REG_T_SCOB_EXPED_MULTA USR_SICOB.T_SCOB_EXPEDIENTE_MULTA%ROWTYPE;    
    CURSOR V_CUR_T_SCOB_EXPED_MULTA IS
       SELECT EM.*
       FROM USR_SICOB.T_SCOB_EXPEDIENTE_MULTA EM
       WHERE EM.ID_EXPEDIENTE = PIN_NU_ID_EXPEDIENTE
       AND EM.ESTADO = '1';
BEGIN
    OPEN V_CUR_T_SCOB_EXPED_MULTA;
    LOOP 
        FETCH V_CUR_T_SCOB_EXPED_MULTA INTO V_REG_T_SCOB_EXPED_MULTA;
           
        EXIT WHEN V_CUR_T_SCOB_EXPED_MULTA%NOTFOUND;    
        
        SP_DO_VALIDAD_EXIS_BN(V_REG_T_SCOB_EXPED_MULTA.ID_MULTA,V_NU_RETORNO,V_VC_MSG);
        IF V_NU_RETORNO=1 THEN
             SP_D_RECAUDACION_BN(V_REG_T_SCOB_EXPED_MULTA.ID_MULTA,V_NU_RETORNO,V_VC_MSG);  
        END IF;
        IF V_NU_RETORNO=-1 THEN
            POUT_NU_COD_RESULT:=-1;
            V_NU_RETORNO:=V_VC_MSG;
        ELSE
            SP_I_RECAUDACION_BN(V_REG_T_SCOB_EXPED_MULTA.ID_MULTA,V_NU_RETORNO,V_VC_MSG);
        END IF; 
        IF V_NU_RETORNO=-1 THEN
            POUT_NU_COD_RESULT:=-1;
            POUT_VC_MSG_RESULT:=V_VC_MSG;
            ROLLBACK; 
        END IF;
     END LOOP;
     CLOSE V_CUR_T_SCOB_EXPED_MULTA;  
     
     POUT_NU_COD_RESULT:=0;
     POUT_VC_MSG_RESULT := 'CONFORME';
     COMMIT;
    
EXCEPTION
  WHEN EX_CONTROLADO THEN
    POUT_NU_COD_RESULT := -1;
  WHEN OTHERS THEN
    POUT_NU_COD_RESULT := -1;
    POUT_VC_MSG_RESULT := 'ERROR NO CONTROLADO : SP_DO_GRABAR_BN_X_EXP - ERROR : ' ||
                      SQLERRM;
END SP_DO_GRABAR_BN_X_EXP;

/*****************************************************************
'* Nombre           :  SP_I_ASBANC_PAGO_TR
'* Parámetros       :  PIN_NU_ID_MULTA : Id del CUM.
'*                     PIN_VC_TIPO_MULTA: Tipo de multa FR: Fraccionada NF: No fraccionada
'* Propósito        :  Método inserta el registro cobro de pago de un CUM, si es Fraccionada
'*                     no realiza inserta, devido a que al momento de generar el cronograma de pago
'*                     se realizo la insercion de todas las cuotas de pago 
'*                     para ASBANC, se llama desde el batchero del registro del pago.
'* Output           :  --
'* Creado por       :  JJIMENEZ
'* Fec Creación     :  2023-02-23 18:06:00
'* Fec Actualización:  
'****************************************************************/
PROCEDURE SP_I_ASBANC_PAGO_TR(PIN_NU_ID_MULTA        IN NUMBER,
                              PIN_VC_TIPO_MULTA      IN VARCHAR2,
                              POUT_NU_COD_RESULT     OUT NUMBER,
                              POUT_VC_MSG_RESULT     OUT VARCHAR2) IS
  
      V_VC_MSG              VARCHAR2(500);
      V_NU_RETORNO          NUMBER(2);
   BEGIN
      IF PIN_VC_TIPO_MULTA = 'NF' THEN
           SP_I_RECAUDACION_ASBANC(PIN_NU_ID_MULTA,V_NU_RETORNO,V_VC_MSG);
      END IF;
      IF V_NU_RETORNO=-1 THEN
        POUT_NU_COD_RESULT:=-1;
        POUT_VC_MSG_RESULT:=V_VC_MSG;
      ELSE
        POUT_NU_COD_RESULT:=0;
        POUT_VC_MSG_RESULT := 'CONFORME';
      END IF;
    
  EXCEPTION
    WHEN EX_CONTROLADO THEN
      POUT_NU_COD_RESULT := -1;
    WHEN OTHERS THEN
      POUT_VC_MSG_RESULT := 'ERROR NO CONTROLADO : SP_I_ASBANC_PAGO_TR - ERROR : ' ||
                        SQLERRM;
    
END SP_I_ASBANC_PAGO_TR;

END PKG_RECAUDACION_BANCOS;
/
