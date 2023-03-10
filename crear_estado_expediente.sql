SELECT EXMU.ID_MULTA AS ID_MULTA,
       EXDO.ID_EXPEDIENTE AS ID_EXPEDIENTE,
       EXDO.ESTADO_EXPEDIENTE AS ID_ESTADO,
       EST_EXP.DESCRIPCION AS ESTADO,
       EXDO.ID_MOTIVO_PLANTILLA,
       MOT_EXP.ID_MOTIVO,
       MOT_EXP.DESCRIPCION AS MOTIVO,
       EXDO.COD_SUBTIPO_DOCUMENTO,
       SUBTIP_DOC.TXT_DESCRIPCION AS SUB_TIPO_DOCUMENTO,
       TIP_DOC.NOM_TIPO_DOCUMENTO AS TIPO_DOCUMENTO,
       DECODE(EXDO.COD_SUBTIPO_DOCUMENTO,
              1,
              EXDO.NRO_RESOLUCION,
              EXDO.NRO_DOCUMENTO) AS NUMERO_DOCUMENTO,
       EXDO.NOMBRE AS ARCHIVO,
       EXDO.FEC_INGRESO AS FECHA_GENERACION,
       EXDO.FEC_NOTIFICACION AS FEC_NOTIFICACION,
       DECODE(EXDO.VC_ESTADO_DOC_UCI,
              'T',
              'En Transito',
              'E',
              'Entregado',
              'D',
              'Devuelto',
              'N',
              'Notificado',
              'Area',
              'En UCI',
              NULL) AS ESTADO_TRAMITE,
       EXDO.VC_FEC_NOTF_UCI AS FECHA_TRAMITE,
       EXDO.VC_HORA_NOTF_UCI AS HORA_TRAMITE,
       EXDO.AUDUSUCREACION AS DGENERADO_POR,
       TIPO_GEN_DOC.TXT_DESCRIPCION AS NOM_TIPO_GENERACION_DOC,
       EXDO.ID_EXPEDIENTE_DOCUMENTO AS ID_DOCUMENTO

  FROM USR_SICOB.T_SCOB_EXPEDIENTE EX
 INNER JOIN USR_SICOB.T_SCOB_EXPEDIENTE_MULTA EXMU
    ON (EX.ID_EXPEDIENTE = EXMU.ID_EXPEDIENTE AND EXMU.ESTADO = '1')
 INNER JOIN USR_SICOB.T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
    ON (EXMU.ID_EXPEDIENTE = EXDO.ID_EXPEDIENTE AND EXMU.ESTADO = '1')
 INNER JOIN USR_SICOB.T_SCOB_EST_EXP_COB EST_EXP
    ON (EXDO.ESTADO_EXPEDIENTE = EST_EXP.ID_EST_EXP_COB)
 INNER JOIN USR_SICOB.T_SCOB_TIPO_DOCUMENTO TIP_DOC
    ON (EXDO.ID_TIPO_DOCUMENTO = TIP_DOC.ID_TIPO_DOCUMENTO)
 INNER JOIN USR_SICOB.T_SCOB_TABLA_DET SUBTIP_DOC
    ON (EXDO.COD_SUBTIPO_DOCUMENTO = SUBTIP_DOC.COD_INTERNO AND
       SUBTIP_DOC.ID_TABLA = 23)
 INNER JOIN USR_SICOB.T_SCOB_TABLA_DET TIPO_GEN_DOC
    ON (EXDO.TIPO_DOC_ASOC = TIPO_GEN_DOC.COD_INTERNO AND
       TIPO_GEN_DOC.ID_TABLA = 60)
 INNER JOIN USR_SICOB.T_SCOB_TABLA_DET FASE
    ON (FASE.ID_TABLA = 59 AND FASE.COD_INTERNO = 3) --EXPEDIENTE
  LEFT JOIN USR_SICOB.T_SCOB_EST_EXP_COB_MOTIVO MOT_EXP
    ON (EST_EXP.ID_EST_EXP_COB = MOT_EXP.ID_EST_EXP_COB AND
       EXDO.ID_MOTIVO = MOT_EXP.ID_MOTIVO)

 WHERE EXDO.ESTADO = '1'
   AND EX.ANIO || EX.NRO_EXPEDIENTE = '20140000004203'
 ORDER BY ID_DOCUMENTO DESC;

SELECT T.ID_EST_EXP_COB, T.CODIGO, T.DESCRIPCION, T.ESTADO
  FROM USR_SICOB.T_SCOB_EST_EXP_COB T
 WHERE T.ESTADO = '1';

SELECT T.ID_MOTIVO, T.CODIGO, T.DESCRIPCION, T.ESTADO
  FROM USR_SICOB.T_SCOB_EST_EXP_COB_MOTIVO T
 WHERE T.ID_EST_EXP_COB = 1
   AND T.ESTADO = '1';


SELECT * FROM T_SCOB_EXPEDIENTE_ESTADO WHERE ID_EXPEDIENTE = 21876 order by 1 desc for update;   
SELECT * FROM T_SCOB_EXPEDIENTE WHERE ID_EXPEDIENTE = 21876 for update;     
SELECT FLG_EMBARGO FROM T_SCOB_EXPEDIENTE WHERE ID_EXPEDIENTE = 19929 

select REGI.AUDFECCREACION
  from (SELECT EXES.*
          FROM T_SCOB_EXPEDIENTE_ESTADO EXES
         where EXES.ID_EXPEDIENTE = 58335
         order by 1 desc) REGI
 where ROWNUM = 1
 
 SELECT TO_DATE('02/02/2023','DD/MM/YYYY') FROM DUAL

SELECT * FROM  usr_sicob.t_scob_tabla_det 
WHERE ID_TABLA=5 AND ESTADO='1';

select * from t_scob_multa_estado where id_multa = 13458 and estado_multa > 9

select TO_DATE('04/01/2020','DD/MM/YYYY') from dual;

SELECT TO_CHAR(sysdate, 'mmyyyy') FROM DUAL;

SELECT EXPE.FEC_ESTADO_EXPEDIENTE
      INTO REG_T_SCOB_EXPEDIENTE
      FROM USR_SICOB.T_SCOB_EXPEDIENTE EXPE
     WHERE EXPE.ID_EXPEDIENTE = 58335

SELECT * FROM T_AUD_SCOB_EXPEDIENTE_MULTA;
SELECT * FROM T_AUD_SCOB_EXPEDIENTE_DOCUMENTO;

SELECT * FROM T_SCOB_EXPEDIENTE_COSTA WHERE ID_EXPEDIENTE = 19926 ORDER BY 1 DESC;

SELECT * FROM T_SCOB_AUDITORIA ORDER BY 1 DESC;

SELECT EM.*
     FROM USR_SICOB.T_SCOB_EXPEDIENTE_MULTA EM
    WHERE EM.ID_EXPEDIENTE = 21597
    AND EM.ESTADO='1';

SELECT *
  FROM (SELECT EX.ANIO || EX.NRO_EXPEDIENTE || ' - ' || MU.ANIO || MU.CUM AS EXP_ACUM,
               MU.ID_MULTA,
               EX.ID_EXPEDIENTE
          FROM USR_SICOB.T_SCOB_SOLIC_DESACUM SA
         INNER JOIN USR_SICOB.T_SCOB_MULTA MU
            ON (SA.ID_MULTA = MU.ID_MULTA)
         INNER JOIN USR_SICOB.T_SCOB_EXPEDIENTE EX
            ON (SA.ID_EXP_ORIGEN = EX.ID_EXPEDIENTE)
         WHERE SA.ID_EXP_DESTINO = 26701
        UNION ALL
        SELECT EX.ANIO || EX.NRO_EXPEDIENTE || ' - ' || 'CUM ACUM.' AS EXP_ACUM,
               0,
               EX.ID_EXPEDIENTE
          FROM USR_SICOB.T_SCOB_EXPEDIENTE EX
         WHERE EX.ID_EXPEDIENTE = 26701)
 ORDER BY 1 ASC;
 
 
 SELECT EXMU.ID_MULTA, EXPE.ID_EXPEDIENTE, MULT.SALDO +
           (DECODE(MULT.FLG_TIPO_MULTA, '0', 0, NVL(MULT.SALDO_IC, 0)))
      FROM T_SCOB_MULTA MULT
     INNER JOIN T_SCOB_EXPEDIENTE_MULTA EXMU
        ON EXMU.ID_MULTA = MULT.ID_MULTA
       AND EXMU.ESTADO = '1'
    --@JPHR
     INNER JOIN T_SCOB_EXPEDIENTE EXPE
        ON EXMU.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
    --AND EXPE.NRO_CUMS = '1'
    --AND EXMU.FLG_INACTIVO IS NULL
     WHERE EXMU.ID_EXPEDIENTE = 26701
          -- @dcelis Req.44
       AND MULT.ID_MULTA =
           SCOB_PK_EXPEDIENTE.SCOB_FN_MUL_ANTIGUO(EXMU.ID_EXPEDIENTE)
     UNION ALL      
    SELECT EXMU.ID_MULTA,  EXPE.ID_EXPEDIENTE, MULT.SALDO +
           (DECODE(MULT.FLG_TIPO_MULTA, '0', 0, NVL(MULT.SALDO_IC, 0)))
      FROM T_SCOB_MULTA MULT
     INNER JOIN T_SCOB_EXPEDIENTE_MULTA EXMU
        ON EXMU.ID_MULTA = MULT.ID_MULTA
     INNER JOIN T_SCOB_EXPEDIENTE EXPE
        ON EXMU.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
       AND EXPE.NRO_CUMS > 1
    --AND EXMU.FLG_ACUMULADOR = '1'
    --AND EXMU.FLG_INACTIVO IS NULL
     WHERE EXMU.ID_EXPEDIENTE = 26701
          -- @dcelis Req.44
       AND MULT.ID_MULTA =
           SCOB_PK_EXPEDIENTE.SCOB_FN_MUL_ANTIGUO(EXMU.ID_EXPEDIENTE);
           

0	22309  -- 50854
46099	25065
46090	25066
50854	25066
46097	25067
60356	29633

0	26701
62475	27084
97778	44160


SELECT EXPE.Id_Expediente, MULT.ID_MULTA, EXPE.MONTO_COSTAS AS TOTAL_MONTO_COSTAS,
             EXPE.TOTAL_AMORTIZADO_COSTAS AS TOTAL_AMORTIZADO_COSTAS,
             EXPE.SALDO_COSTAS AS SALDO_COSTAS,
             SUBSTR(USUARIO.PRI_NOMBRE, 1, 1) ||
             SUBSTR(USUARIO.APE_PATERNO, 1, 1) ||
             SUBSTR(USUARIO.APE_MATERNO, 1, 1) AS SIGLAS_GESTOR
        FROM T_SCOB_EXPEDIENTE EXPE
       INNER JOIN T_SCOB_EXPEDIENTE_MULTA EXMU
          ON EXMU.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
         AND EXMU.ESTADO = '1'
       INNER JOIN T_SCOB_MULTA MULT
          ON MULT.ID_MULTA = EXMU.ID_MULTA
       INNER JOIN T_SCOB_USUARIO USUARIO
          ON USUARIO.ID_USUARIO = MULT.ID_USUARIO_ASIG_COBRANZA
       WHERE EXPE.ID_EXPEDIENTE = 22309;
       
SELECT
      --datos grabados de costas
       CSTA.ID_COSTA AS ID_COSTAS,
       CSTA.CODIGO AS COD_COSTAS,
       CSTA.DESCRIPCION AS NOM_COSTAS,
       SUM(ECOS.CNT_COSTA) AS CANT_COSTA,
       NVL(SUM(ECOS.MONTO_COSTA), 0) AS MONTO_COSTAS, --SUBTOTAL COSTAS ACUMULADA!!.
       
       DECODE(NVL(CSTA.FLG_GASTO, '0'),
              '1',
              1,
              DECODE(NVL(CSTA.FLG_UIT_MAX, '0'),
                     '0',
                     CSTA.PORCENTAJE_UIT,
                     CSTA.PORCENTAJE_UIT_MAX)) AS PORCENTAJE_UIT,
       
       NVL(CSTA.FLG_GASTO, '0') AS FLG_GASTO,
       NVL(FLG_UIT_MAX, '0') AS FLG_UIT_MAX
        FROM T_SCOB_COSTA CSTA
        LEFT JOIN T_SCOB_EXPEDIENTE_COSTA ECOS
          ON ECOS.ID_COSTA = CSTA.ID_COSTA
         AND ECOS.ID_EXPEDIENTE = 44160
         AND ECOS.ESTADO = '1'
       WHERE CSTA.ESTADO = '1'
       GROUP BY CSTA.ID_COSTA,
                CSTA.CODIGO,
                CSTA.DESCRIPCION,
                CSTA.FLG_UIT_MAX,
                CSTA.PORCENTAJE_UIT,
                CSTA.PORCENTAJE_UIT_MAX,
                --@0002:Ini
                --ECOS.PORCENTAJE_UIT,
                --@0002:Fin
                CSTA.FLG_GASTO
       ORDER BY TO_NUMBER(NVL(CSTA.CODIGO, 0)) ASC,
                NVL(CSTA.FLG_GASTO, 0) DESC;
                
                SELECT * FROM T_SCOB_EXPEDIENTE_COSTA;
                SELECT * FROM T_SCOB_SOLIC_DESACUM;
                                SELECT * FROM T_SCOB_COSTA;
