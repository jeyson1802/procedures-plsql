CREATE OR REPLACE PACKAGE SCOB_PK_RECAUDACION_BANCOS IS

  -- ******************************************************************************
  -- Descripción: Procedure que registra la recaudación en Linea del Banco de la Nacion
  --
  -- Input Parameters: PIN_ID_MULTA
  --
  -- Output Parameters: POV_COD_RESULT , POV_MSG_RESULT
  --
  --
  -- Author:      Victor Bendezú
  -- Proyecto:    Recaudación de para el Banco de la Nación
  --
  -- Revisiones
  -- Fecha            Autor         Motivo del cambio    
  -- ----------------------------------------------------------------
  -- 29/12/2022     Victor Bendezú  Recaudación de Banco de la Nación 
  -- ***************************************************************      
  PROCEDURE SP_REGISTRO_RECAUDACION_BANCO_NACION(PIN_ID_MULTA   IN NUMBER,
                                                 PON_COD_RESULT OUT NUMBER,
                                                 POV_MSG_RESULT OUT VARCHAR2);

  -- ******************************************************************************
  -- Descripción: Procedure que registra la recaudación en Linea del Banco ASBANC
  --
  -- Input Parameters: PIN_ID_MULTA
  --
  -- Output Parameters: POV_COD_RESULT , POV_MSG_RESULT
  --
  --
  -- Author:      Victor Bendezú
  -- Proyecto:    Recaudación de para el Banco ASBANC
  --
  -- Revisiones
  -- Fecha            Autor         Motivo del cambio    
  -- ----------------------------------------------------------------
  -- 29/12/2022     Victor Bendezú  Recaudación de Banco ASBANC 
  -- ***************************************************************      
  PROCEDURE SP_REGISTRO_RECAUDACION_BANCO_ASBANC(PIN_ID_MULTA   IN NUMBER,
                                                 PON_COD_RESULT OUT NUMBER,
                                                 POV_MSG_RESULT OUT VARCHAR2);

END SCOB_PK_RECAUDACION_BANCOS;
/
CREATE OR REPLACE PACKAGE BODY SCOB_PK_RECAUDACION_BANCOS IS

  EX_CONTROLADO EXCEPTION;

  PROCEDURE SP_REGISTRO_RECAUDACION_BANCO_NACION(PIN_ID_MULTA   IN NUMBER,
                                                 PON_COD_RESULT OUT NUMBER,
                                                 POV_MSG_RESULT OUT VARCHAR2) IS
  
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
                      RPAD(USR_SICOB.FUN_SCOB_ALFANUMERICO(UPPER((SUBSTR((DECODE(PER.TIPO_PERSONA,
                                                                                 1,
                                                                                 USR_SICOB.FUN_SCOB_ALFA_CAREXT(TRIM(PER.APE_PATERNO) || ' ' ||
                                                                                                                TRIM(PER.APE_MATERNO) || ' ' ||
                                                                                                                TRIM(PER.PRI_NOMBRE)),
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
                FROM USR_SICOB.T_SCOB_MULTA MUL
               INNER JOIN USR_SICOB.T_SCOB_MULTA_DETAL MULDE
                  ON MUL.ID_MULTA = MULDE.ID_MULTA
                 AND MULDE.FLG_ACTUAL = '1'
                 AND MULDE.ESTADO = '1'
               INNER JOIN USR_SICOB.T_SCOB_MULTA_SANCIONADO MULSA
                  ON MULSA.FLG_PRINCIPAL = '1'
                 AND MULSA.ESTADO = '1'
                 AND MULDE.ID_MULTA_DETAL = MULSA.ID_MULTA_DETAL
               INNER JOIN USR_SICOB.T_SCOB_PERSONA PER
                  ON MULSA.ID_PERSONA = PER.ID_PERSONA
                 AND PER.COD_SANCIONADO IS NOT NULL
                LEFT JOIN USR_SICOB.T_SCOB_EXPEDIENTE_MULTA EXPMUL
                  ON MUL.ID_MULTA = EXPMUL.ID_MULTA
                 AND EXPMUL.ESTADO = '1'
                LEFT JOIN USR_SICOB.T_SCOB_EXPEDIENTE EXP
                  ON EXPMUL.ID_EXPEDIENTE = EXP.ID_EXPEDIENTE
                 AND EXP.ESTADO = '1'
                LEFT JOIN USR_SICOB.T_SCOB_USUARIO USU
                  ON USU.ID_USUARIO = MUL.ID_USUARIO_ASIG_COBRANZA
                LEFT JOIN USR_SICOB.T_SCOB_AREA_COBRANZA ARECO
                  ON ARECO.ID_AREA_COBRANZA = MUL.ID_AREA_COBRANZA
                LEFT JOIN USR_SICOB.T_SCOB_ENTIDAD_FINANCIERA EF
                  ON EF.ID_ENTIDAD_FINANCIERA = 1
               WHERE (MUL.SALDO + MUL.SALDO_IC + MUL.SALDO_COSTAS) > 0
                 AND MUL.ESTADO = '1'
                 AND MUL.FLG_EXCLUSION IS NULL
                 AND MUL.ID_MULTA = PIN_ID_MULTA
               ORDER BY 1, 2, 3) T;
  
    COMMIT;
  
    PON_COD_RESULT := 0;
    POV_MSG_RESULT := 'CONFORME';
  
  EXCEPTION
    WHEN EX_CONTROLADO THEN
      PON_COD_RESULT := -1;
    WHEN OTHERS THEN
      PON_COD_RESULT := -1;
      POV_MSG_RESULT := 'ERROR NO CONTROLADO : SP_REGISTRO_RECAUDACION_BANCO_NACION - ERROR : ' ||
                        SQLERRM;
    
  END SP_REGISTRO_RECAUDACION_BANCO_NACION;

  PROCEDURE SP_REGISTRO_RECAUDACION_BANCO_ASBANC(PIN_ID_MULTA   IN NUMBER,
                                                 PON_COD_RESULT OUT NUMBER,
                                                 POV_MSG_RESULT OUT VARCHAR2) IS
  
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
             DECODE(NVL(ESTADO_EXPEDIENTE, 0),
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
             'A' VC_IND_ESTADO,
             (T.MONTO_CUPON + T.MONTO_MORA) AS NU_SALDO_TEMP,
             VC_TIPO_MULTA
        FROM (
              
              SELECT DISTINCT 'PEN' COD_MONEDA,
                      MUL.ANIO || MUL.CUM AS COD_IDENTIFICACION_UNICO,
                      LPAD('0', 2, 0) AS NRO_CUOTA,
                      RPAD(USR_SICOB.FUN_SCOB_ALFANUMERICO(UPPER((SUBSTR((DECODE(PER.TIPO_PERSONA,
                                                                                 1,
                                                                                 USR_SICOB.FUN_SCOB_ALFA_CAREXT(TRIM(PER.APE_PATERNO) || ' ' ||
                                                                                                                TRIM(PER.APE_MATERNO) || ' ' ||
                                                                                                                TRIM(PER.PRI_NOMBRE)),
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
                          AND EXCRO1.ESTADO = '1') AS NU_FLAG_FRACC,
                      DECODE(EXP.ESTADO_EXPEDIENTE, 4, 'FR', 'NF') AS VC_TIPO_MULTA
                FROM USR_SICOB.T_SCOB_MULTA MUL
               INNER JOIN USR_SICOB.T_SCOB_MULTA_DETAL MULDE
                  ON MUL.ID_MULTA = MULDE.ID_MULTA
                 AND MULDE.FLG_ACTUAL = '1'
                 AND MULDE.ESTADO = '1'
               INNER JOIN USR_SICOB.T_SCOB_MULTA_SANCIONADO MULSA
                  ON MULSA.FLG_PRINCIPAL = '1'
                 AND MULSA.ESTADO = '1'
                 AND MULDE.ID_MULTA_DETAL = MULSA.ID_MULTA_DETAL
               INNER JOIN USR_SICOB.T_SCOB_PERSONA PER
                  ON MULSA.ID_PERSONA = PER.ID_PERSONA
                 AND PER.COD_SANCIONADO IS NOT NULL
                LEFT JOIN USR_SICOB.T_SCOB_EXPEDIENTE_MULTA EXPMUL
                  ON MUL.ID_MULTA = EXPMUL.ID_MULTA
                 AND EXPMUL.ESTADO = '1'
                LEFT JOIN USR_SICOB.T_SCOB_EXPEDIENTE EXP
                  ON EXPMUL.ID_EXPEDIENTE = EXP.ID_EXPEDIENTE
                 AND EXP.ESTADO = '1'
                LEFT JOIN USR_SICOB.T_SCOB_USUARIO USU
                  ON USU.ID_USUARIO = MUL.ID_USUARIO_ASIG_COBRANZA
                LEFT JOIN USR_SICOB.T_SCOB_AREA_COBRANZA ARECO
                  ON ARECO.ID_AREA_COBRANZA = MUL.ID_AREA_COBRANZA
                LEFT JOIN USR_SICOB.T_SCOB_ENTIDAD_FINANCIERA EF
                  ON EF.ID_ENTIDAD_FINANCIERA = 1
               WHERE (MUL.SALDO + MUL.SALDO_IC + MUL.SALDO_COSTAS) > 0
                 AND MUL.ESTADO = '1'
                 AND NVL(EXP.ESTADO_EXPEDIENTE, 0) <> 4
                 AND MUL.FLG_EXCLUSION IS NULL
                 AND MUL.ID_MULTA = PIN_ID_MULTA) T;
  
    COMMIT;
  
    PON_COD_RESULT := 0;
    POV_MSG_RESULT := 'CONFORME';
  
  EXCEPTION
    WHEN EX_CONTROLADO THEN
      PON_COD_RESULT := -1;
    WHEN OTHERS THEN
      PON_COD_RESULT := -1;
      POV_MSG_RESULT := 'ERROR NO CONTROLADO : SP_REGISTRO_RECAUDACION_BANCO_NACION - ERROR : ' ||
                        SQLERRM;
    
  END SP_REGISTRO_RECAUDACION_BANCO_ASBANC;

END SCOB_PK_RECAUDACION_BANCOS;
/
