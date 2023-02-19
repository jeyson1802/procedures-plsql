CREATE OR REPLACE PACKAGE "SCOB_PK_PROCESO" is

  -- Author  : ADMIN
  -- Created : 14/05/2011 15:00:13 p.m.
  -- Purpose :

  type cu_rec_set is ref cursor;
  TYPE VARRAY_ID IS VARRAY(100) OF VARCHAR2(50);
  TYPE VARRAY_FILTRO IS VARRAY(100) OF CHAR(1);
  type po_cu_retornoC is ref cursor;
  type po_cu_retornoD is ref cursor;

----
procedure SCOB_SP_S_GEN_INFOCORP
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 05.05.2011
-- Proposito    : listar consulta de generacion infocorp
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_V_NRO_EXPEDIENTE_INI            IN VARCHAR2,
  PI_V_NRO_EXPEDIENTE_FIN            IN VARCHAR2,
  PI_V_FEC_GEN_EXPED_INI             IN VARCHAR2,
  PI_V_FEC_GEN_EXPED_FIN             IN VARCHAR2,
  PI_V_FEC_NOTIF_REG_INI             IN VARCHAR2,
  PI_V_FEC_NOTIF_REG_FIN             IN VARCHAR2,
  PI_V_FEC_EMISION_REG_INI           IN VARCHAR2,
  PI_V_FEC_EMISION_REG_FIN           IN VARCHAR2,
  PI_N_SALDO_INI                     IN T_SCOB_EXPEDIENTE.SALDO%TYPE,
  PI_N_SALDO_FIN                     IN T_SCOB_EXPEDIENTE.SALDO%TYPE,
  --PI_C_FLG_EMBARGO                   IN CHAR, --FALTA FILTRAR
  PI_V_ESTADO_EXPEDIENTE             IN VARCHAR2,
  --
  PI_I_TIPO_PERSONA                  IN T_SCOB_PERSONA.TIPO_PERSONA%TYPE,
  PI_I_TIPO_DOC                      IN T_SCOB_PERSONA.TIPO_DOC%TYPE,
  PI_V_NRO_DOC                       IN T_SCOB_PERSONA.NRO_DOC%TYPE,
  PI_V_APE_PATERNO                   IN T_SCOB_PERSONA.APE_PATERNO%TYPE,
  PI_V_APE_MATERNO                   IN T_SCOB_PERSONA.APE_MATERNO%TYPE,
  PI_V_PRI_NOMBRE                    IN T_SCOB_PERSONA.PRI_NOMBRE%TYPE,
  PI_V_SEG_NOMBRE                    IN T_SCOB_PERSONA.SEG_NOMBRE%TYPE,
  PI_V_RAZON_SOCIAL                  IN T_SCOB_PERSONA.RAZON_SOCIAL%TYPE,
  po_cu_retorno                      out cu_rec_set
);

/*procedure SCOB_SP_I_GEN_INFOCORP(
  PI_V_ID_MULTA                   IN VARCHAR2,
  PI_V_AUDUSUCREACION             IN VARCHAR2,
  po_cu_retorno                   OUT cu_rec_set,
  po_n_retorno                    out number,
  po_n_cod_error                  out number,
  po_v_msj_error                  out varchar2
);*/

procedure SCOB_SP_S_INFOCORP
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 05.05.2011
-- Proposito    : listar consulta de generacion infocorp
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  po_cu_retorno                      out cu_rec_set
);

procedure SCOB_SP_U_INFOCORP
/*
-----------------------------------------------------------
-- Autor        : JLPY
-- Creado       : 05.05.2011
-- Proposito    : listar con el flg enviar para inforcorp
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_V_ARRAY_ID                    IN VARRAY_ID,--ARRAY DE ID MULTA O ID EXPEDIENTE PARA ACTUALIZAR --OBLIGATORIO
  PI_V_ARRAY_FILTRO                IN VARRAY_FILTRO,--ARRAY --1:MULTA,2:EXPEDIENTE --OBLIGATORIO
  po_n_retorno                     out number,
  po_n_cod_error                   out number,
  po_v_msj_error                   out varchar2
);

procedure SCOB_SP_UP_INFOCORP
/*
-----------------------------------------------------------
-- Autor        : JLPY
-- Creado       : 05.05.2011
-- Proposito    : listar con el flg enviar para inforcorp
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_V_ID                          IN VARCHAR2,--OBLIGATORIO
  PI_V_FILTRO                      IN VARCHAR2,--OBLIGATORIO
  PI_N_NRO_ITEMS                   IN NUMBER,--OBLIGATORIO
  po_n_retorno                     out number,
  po_n_cod_error                   out number,
  po_v_msj_error                   out varchar2
);

procedure SCOB_SP_G_ENVIO_BANCO_F1
/*
-----------------------------------------------------------
-- Autor        : JLPY
-- Creado       : 05.05.2011
-- Proposito    : listar con el flg enviar para inforcorp
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  po_cu_retornoC                         out cu_rec_set,--out sys_refcursor,--para txt
 po_cu_retornoD                         out cu_rec_set,--out sys_refcursor,-- para txt
 po_cu_retornoC_                        out cu_rec_set,--out sys_refcursor,--para excel
 po_cu_retornoD_                        out cu_rec_set--out sys_refcursor,-- para excel
);

procedure SCOB_SP_G_ENVIO_BANCO_F2
/*
-----------------------------------------------------------
-- Autor        : JLPY
-- Creado       : 05.05.2011
-- Proposito    : listar con el flg enviar para inforcorp
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
 po_cu_retornoC                         out cu_rec_set,--out sys_refcursor,--para txt
 po_cu_retornoD                         out cu_rec_set,--out sys_refcursor,-- para txt
 po_cu_retornoC_                        out cu_rec_set,--out sys_refcursor,--para excel
 po_cu_retornoD_                        out cu_rec_set--out sys_refcursor,-- para excel
);

PROCEDURE SCOB_SP_S_TIP_ARCHIVO
/*
-----------------------------------------------------------
-- Autor        : JLPY
-- Creado       : 23.06.2011
-- Proposito    : Mostrar consulta del tipo de Archivo
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
 (
  po_cu_retorno                 out cu_rec_set
 );

procedure SCOB_SP_S_MARCAR_MULTA
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 20.09.2011
-- Proposito    : Consultar las multas para registrar la marca a archivo central.
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_V_NRO_FILE_AEC         IN T_SCOB_MULTA.NRO_FILE_AEC%TYPE,
  PI_N_ID_AREA_COBRANZA     IN T_SCOB_MULTA.ID_AREA_COBRANZA%TYPE,
  PI_V_ANIO_FILE_AEC        IN T_SCOB_MULTA.ANIO_FILE_AEC%TYPE,

  PI_V_NRO_CUM              IN VARCHAR2,
  PI_V_NRO_EXPEDIENTE       IN VARCHAR2,
  PI_V_NRO_ENVIO            IN VARCHAR2,
  PI_I_COD_ESTADO_ENVIO     IN INTEGER,
  PI_I_COD_UBICACION        IN INTEGER, --ENVIAR 1=AEC, 2=ARCHIVO CENTRAL
  po_cu_retorno             out cu_rec_set
);

procedure SCOB_SP_S_EDITAR_MARCAR_MULTA
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 20.09.2011
-- Proposito    : Editar  los datos de la multa para marcar y enviar a archivo central.
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA                     IN T_SCOB_MULTA.ID_MULTA%TYPE,
  po_cu_retorno_datos               out cu_rec_set,
  po_cu_retorno_envios              out cu_rec_set
);

procedure SCOB_SP_U_MARCAR_MULTA
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 20.09.2011
-- Proposito    : Actualizar o Insertar los datos de la marca para envio a archivo central.
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA_ARCHIVO_CENTRAL         IN T_SCOB_MULTA_ARCHIVO_CENTRAL.ID_MULTA_ARCHIVO_CENTRAL%TYPE,
  PI_N_ID_MULTA                         IN T_SCOB_MULTA.ID_MULTA%TYPE,
  PI_C_FLG_DEVUELTO                     IN T_SCOB_MULTA_ARCHIVO_CENTRAL.FLG_DEVUELTO%TYPE,
  PI_V_FEC_DEVUELTO                     IN VARCHAR2,
  PI_I_NRO_FOLIOS                       IN T_SCOB_MULTA_ARCHIVO_CENTRAL.NRO_FOLIOS%TYPE,
  PI_I_COD_TIPO_ACCESIBILIDAD           IN T_SCOB_MULTA_ARCHIVO_CENTRAL.COD_TIPO_ACCESIBILIDAD%TYPE,
  PI_I_COD_TIPO_ENVIO                   IN T_SCOB_MULTA_ARCHIVO_CENTRAL.COD_TIPO_ENVIO%TYPE,
  PI_C_FLG_CONCLUIDO                    IN T_SCOB_MULTA_ARCHIVO_CENTRAL.FLG_CONCLUIDO%TYPE,
  PI_C_FLG_FOLIADO                      IN T_SCOB_MULTA_ARCHIVO_CENTRAL.FLG_FOLIADO%TYPE,
  PI_C_FLG_ETIQUETADO                   IN T_SCOB_MULTA_ARCHIVO_CENTRAL.FLG_ETIQUETADO%TYPE,
  PI_C_FLG_RESOLUCION_COACTIVA          IN T_SCOB_MULTA_ARCHIVO_CENTRAL.FLG_RESOLUCION_COACTIVA%TYPE,
  PI_V_AUDUSUCREACION                   IN T_SCOB_MULTA_ARCHIVO_CENTRAL.AUDUSUCREACION%TYPE,
  po_n_retorno                          out number,
  po_n_cod_error                        out number,
  po_v_msj_error                        out varchar2
);

procedure SCOB_SP_S_ARCHIVO_CENTRAL
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 21.09.2011
-- Proposito    : Consulta los envios realizados y el pendiente de envio.
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_V_NRO_ENVIO              IN VARCHAR2,
  PI_V_FEC_ENVIO_INI          IN VARCHAR2,
  PI_V_FEC_ENVIO_FIN          IN VARCHAR2,
  po_cu_retorno               out cu_rec_set
);

procedure SCOB_SP_U_ARCHIVO_CENTRAL
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 21.09.2011
-- Proposito    : Actualizar los datos de la recepcion del envio en archivo central.
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_ARCHIVO_CENTRAL               IN T_SCOB_ARCHIVO_CENTRAL.ID_ARCHIVO_CENTRAL%TYPE,
  PI_V_NRO_REGISTRO_ARCH_CENT           IN T_SCOB_ARCHIVO_CENTRAL.NRO_REGISTRO_ARCHIVO_CENTRAL%TYPE,
  PI_V_FEC_REGISTRO                     IN VARCHAR2,
  PI_V_AUDUSUMODIFICACION               IN T_SCOB_ARCHIVO_CENTRAL.AUDUSUMODIFICACION%TYPE,
  po_n_retorno                          out number,
  po_n_cod_error                        out number,
  po_v_msj_error                        out varchar2
);

procedure SCOB_SP_S_PENDIENTES_ENVIO
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 21.09.2011
-- Proposito    : Consulta el detalle de las multas por enviar
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  po_cu_retorno               out cu_rec_set
);

procedure SCOB_SP_D_PENDIENTES_ENVIO
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 21.09.2011
-- Proposito    : Eliminar multas del grupo pendiente de envio a archivo central.
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_V_ID_MULTA                       IN VARCHAR2,
  PI_V_ID_ARCHIVO_CENTRAL             IN VARCHAR2,
  PI_V_AUDUSUMODIFICACION             IN T_SCOB_ARCHIVO_CENTRAL.AUDUSUMODIFICACION%TYPE,
  po_n_retorno                        out number,
  po_n_cod_error                      out number,
  po_v_msj_error                      out varchar2
);

procedure SCOB_SP_U_ENVIAR_ARCHIVO
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 21.09.2011
-- Proposito    : Realizar el envio a archivo central. Cambiar al estado "ENVIADO".
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_USUARIO                     IN T_SCOB_ARCHIVO_CENTRAL.ID_USUARIO_ENVIO%TYPE,
  PI_V_AUDUSUMODIFICACION             IN T_SCOB_ARCHIVO_CENTRAL.AUDUSUMODIFICACION%TYPE,
  po_n_retorno                        out number,
  po_n_cod_error                      out number,
  po_v_msj_error                      out varchar2
);

procedure SCOB_SP_S_GENERA_ENVIO_ARCHIVO
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 22.09.2011
-- Proposito    : Consultar los datos de las multas relacionadas a un envio de archivo central.
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_ARCHIVO_CENTRAL       IN T_SCOB_ARCHIVO_CENTRAL.ID_ARCHIVO_CENTRAL%TYPE,
  po_cu_retorno_cab             out cu_rec_set,
  po_cu_retorno_det             out cu_rec_set
);

FUNCTION SCOB_FN_DIRECCION_ADM(
  PI_N_ID_PERSONA IN T_SCOB_PERSONA.ID_PERSONA%TYPE,
  PI_N_TIPO_DIR VARCHAR2,
  PI_N_TIPO INTEGER
) RETURN  VARCHAR2
;
----
end SCOB_PK_PROCESO;
/
CREATE OR REPLACE PACKAGE BODY "SCOB_PK_PROCESO" is
----
procedure SCOB_SP_S_GEN_INFOCORP
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 05.05.2011
-- Proposito    : listar consulta de generacion infocorp
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_V_NRO_EXPEDIENTE_INI            IN VARCHAR2,
  PI_V_NRO_EXPEDIENTE_FIN            IN VARCHAR2,
  PI_V_FEC_GEN_EXPED_INI             IN VARCHAR2,
  PI_V_FEC_GEN_EXPED_FIN             IN VARCHAR2,
  PI_V_FEC_NOTIF_REG_INI             IN VARCHAR2,
  PI_V_FEC_NOTIF_REG_FIN             IN VARCHAR2,
  PI_V_FEC_EMISION_REG_INI           IN VARCHAR2,
  PI_V_FEC_EMISION_REG_FIN           IN VARCHAR2,
  PI_N_SALDO_INI                     IN T_SCOB_EXPEDIENTE.SALDO%TYPE,
  PI_N_SALDO_FIN                     IN T_SCOB_EXPEDIENTE.SALDO%TYPE,
--PI_C_FLG_EMBARGO                   IN CHAR, --FALTA FILTRAR
  PI_V_ESTADO_EXPEDIENTE             IN VARCHAR2,
  --
  PI_I_TIPO_PERSONA                  IN T_SCOB_PERSONA.TIPO_PERSONA%TYPE,
  PI_I_TIPO_DOC                      IN T_SCOB_PERSONA.TIPO_DOC%TYPE,
  PI_V_NRO_DOC                       IN T_SCOB_PERSONA.NRO_DOC%TYPE,
  PI_V_APE_PATERNO                   IN T_SCOB_PERSONA.APE_PATERNO%TYPE,
  PI_V_APE_MATERNO                   IN T_SCOB_PERSONA.APE_MATERNO%TYPE,
  PI_V_PRI_NOMBRE                    IN T_SCOB_PERSONA.PRI_NOMBRE%TYPE,
  PI_V_SEG_NOMBRE                    IN T_SCOB_PERSONA.SEG_NOMBRE%TYPE,
  PI_V_RAZON_SOCIAL                  IN T_SCOB_PERSONA.RAZON_SOCIAL%TYPE,
  po_cu_retorno                      out cu_rec_set
)
as
begin

  open  po_cu_retorno for
  SELECT
    EXPE.ID_EXPEDIENTE AS ID_EXPEDIENTE,
    DECODE(EXPE.ID_EXPEDIENTE,NULL,MDET.NRO_RESOLUCION,EXPE.ANIO || ' ' || EXPE.NRO_EXPEDIENTE) AS NRO_EXPEDIENTE,
    MULT.ID_MULTA AS ID_MULTA,
    MULT.ANIO || ' ' || MULT.CUM AS COD_MULTA,
    SANC.ID_PERSONA,
    DECODE(PERS.TIPO_PERSONA, SCOB_PK_CONSTANTES.C_TIPO_PERS_JURIDICA,  PERS.RAZON_SOCIAL,  PERS.PRI_NOMBRE || ' ' || PERS.SEG_NOMBRE || ' ' || PERS.APE_PATERNO  || ' ' || PERS.APE_MATERNO  || ' ' || PERS.APE_CASADA) AS DES_SANCIONADO,
    MDET.VALOR_UIT AS VALOR_UIT,
    MDET.MONTO_UIT AS MONTO_UIT,
    0 AS SALDO, --FALTA
    MDET.FEC_NOTIFICACION_RESOLUCION AS FEC_NOTIF_MULTA
  FROM T_SCOB_MULTA MULT
  LEFT JOIN T_SCOB_EXPEDIENTE_MULTA EXMU
        ON EXMU.ID_MULTA = MULT.ID_MULTA
        AND EXMU.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
  LEFT JOIN T_SCOB_EXPEDIENTE EXPE
       ON EXPE.ID_EXPEDIENTE = EXMU.ID_EXPEDIENTE
       AND EXPE.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
  INNER JOIN T_SCOB_MULTA_DETAL MDET
        ON MDET.ID_MULTA = MULT.ID_MULTA
        AND MDET.FLG_ACTUAL = '1'
  INNER JOIN T_SCOB_MULTA_SANCIONADO SANC
        ON SANC.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL
  INNER JOIN T_SCOB_PERSONA PERS
        ON PERS.ID_PERSONA = SANC.ID_PERSONA
  LEFT JOIN (
        SELECT DISTINCT
          EXPE.ID_EXPEDIENTE AS ID_EXPEDIENTE,
          EXDO.AUDFECCREACION AS FEC_EMISION_REC,
          EXDO.FEC_NOTIFICACION AS FEC_NOTIFICA_REC
        FROM (
        SELECT
          EXDO.ID_EXPEDIENTE AS ID_EXPEDIENTE,
          EXDO.ID_MOTIVO_PLANTILLA AS ID_MOT_PLA,
          MAX(TO_NUMBER(EXDO.NRO_VERSION)) AS VERSION
        FROM T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
        INNER JOIN T_SCOB_MOTIVO_PLANTILLA MOPL
              ON MOPL.ID_MOTIVO_PLANTILLA = EXDO.ID_MOTIVO_PLANTILLA
        WHERE
        COD_GENERADOR_DOCUMENTO IS NOT NULL
        AND EXDO.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
        AND EXDO.ID_TIPO_DOCUMENTO IN (1,5) --TIPOS DE DOCUMENTOS "RESOLUCION REC"
        GROUP BY EXDO.ID_EXPEDIENTE, EXDO.ID_MOTIVO_PLANTILLA
        ) EXPE
        INNER JOIN T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
              ON EXDO.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
              AND EXDO.ID_MOTIVO_PLANTILLA = EXPE.ID_MOT_PLA
              AND TO_NUMBER(EXDO.NRO_VERSION) = EXPE.VERSION
        INNER JOIN T_SCOB_EXPEDIENTE_MULTA EXMU
              ON EXMU.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
              AND EXMU.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
        INNER JOIN T_SCOB_MULTA MULT
              ON MULT.ID_MULTA = EXMU.ID_MULTA

  )DOC_REC
          ON DOC_REC.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE

  WHERE
  MULT.ESTADO_MULTA = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
  AND (NVL(PI_I_TIPO_PERSONA,0)=0 OR (NVL(PI_I_TIPO_PERSONA,0)<>0 AND PERS.TIPO_PERSONA = PI_I_TIPO_PERSONA))
  AND (NVL(PI_I_TIPO_DOC,0)=0 OR (NVL(PI_I_TIPO_DOC,0)<>0 AND PERS.TIPO_DOC = PI_I_TIPO_DOC))
  AND (NVL(PI_V_NRO_DOC,' ')=' ' OR (NVL(PI_V_NRO_DOC,' ')<>' ' AND TRIM(PERS.NRO_DOC) = TRIM(PI_V_NRO_DOC)))
  AND (NVL(PI_V_APE_PATERNO,' ')=' ' OR (NVL(PI_V_APE_PATERNO,' ')<>' ' AND UPPER(TRIM(PERS.APE_PATERNO)) LIKE '%' || UPPER(TRIM(PI_V_APE_PATERNO)) || '%' ))
  AND (NVL(PI_V_APE_MATERNO,' ')=' ' OR (NVL(PI_V_APE_MATERNO,' ')<>' ' AND UPPER(TRIM(PERS.APE_MATERNO)) LIKE '%' || UPPER(TRIM(PI_V_APE_MATERNO)) || '%' ))
  AND (NVL(PI_V_PRI_NOMBRE,' ')=' '  OR (NVL(PI_V_PRI_NOMBRE,' ')<>' ' AND UPPER(TRIM(PERS.PRI_NOMBRE)) LIKE '%' || UPPER(TRIM(PI_V_PRI_NOMBRE)) || '%' ))
  AND (NVL(PI_V_SEG_NOMBRE,' ')=' ' OR (NVL(PI_V_SEG_NOMBRE,' ')<>' ' AND UPPER(TRIM(PERS.SEG_NOMBRE)) LIKE '%' || UPPER(TRIM(PI_V_SEG_NOMBRE)) || '%' ))
  AND (NVL(PI_V_RAZON_SOCIAL,' ')=' ' OR (NVL(PI_V_RAZON_SOCIAL,' ')<>' ' AND UPPER(TRIM(PERS.RAZON_SOCIAL)) LIKE '%' || UPPER(TRIM(PI_V_RAZON_SOCIAL)) || '%' ))
  AND (NVL(PI_V_ESTADO_EXPEDIENTE,' ')=' ' OR (NVL(PI_V_ESTADO_EXPEDIENTE,' ')<>' ' AND INSTR(PI_V_ESTADO_EXPEDIENTE,'|' || TO_CHAR(EXPE.ESTADO_EXPEDIENTE) || '|' )>0))
  AND (
        (NVL(PI_V_NRO_EXPEDIENTE_INI,' ')=' ') OR (
        NVL(PI_V_NRO_EXPEDIENTE_INI,' ')<>' ' AND
        EXPE.ANIO || EXPE.NRO_EXPEDIENTE
          BETWEEN PI_V_NRO_EXPEDIENTE_INI AND PI_V_NRO_EXPEDIENTE_FIN)
  )
  AND (
        (NVL(PI_N_SALDO_INI,0)=0) OR (
        NVL(PI_N_SALDO_INI,0)<>0 AND
        EXPE.SALDO BETWEEN PI_N_SALDO_INI AND PI_N_SALDO_FIN)
  )
  AND (
        (NVL(PI_V_FEC_NOTIF_REG_INI,' ')=' ') OR (
        NVL(PI_V_FEC_NOTIF_REG_INI,' ')<>' ' AND
        TO_DATE(TO_CHAR(DOC_REC.FEC_NOTIFICA_REC,'DD/MM/YYYY'),'DD/MM/YYYY')
          BETWEEN TO_DATE(PI_V_FEC_NOTIF_REG_INI,'DD/MM/YYYY') AND TO_DATE(PI_V_FEC_NOTIF_REG_FIN,'DD/MM/YYYY'))
  )
  AND (
        (NVL(PI_V_FEC_EMISION_REG_INI,' ')=' ') OR (
        NVL(PI_V_FEC_EMISION_REG_INI,' ')<>' ' AND
        TO_DATE(TO_CHAR(DOC_REC.FEC_EMISION_REC,'DD/MM/YYYY'),'DD/MM/YYYY')
          BETWEEN TO_DATE(PI_V_FEC_EMISION_REG_INI,'DD/MM/YYYY') AND TO_DATE(PI_V_FEC_EMISION_REG_FIN,'DD/MM/YYYY'))
  )
  AND (
        (NVL(PI_V_FEC_GEN_EXPED_INI,' ')=' ') OR (
        NVL(PI_V_FEC_GEN_EXPED_FIN,' ')<>' ' AND
        TO_DATE(TO_CHAR(EXPE.AUDFECCREACION,'DD/MM/YYYY'),'DD/MM/YYYY')
          BETWEEN TO_DATE(PI_V_FEC_GEN_EXPED_INI,'DD/MM/YYYY') AND TO_DATE(PI_V_FEC_GEN_EXPED_FIN,'DD/MM/YYYY'))
  )
  ORDER BY EXPE.ID_EXPEDIENTE;

end;

/*procedure SCOB_SP_I_GEN_INFOCORP(
  PI_V_ID_MULTA                   IN VARCHAR2,
  PI_V_AUDUSUCREACION             IN VARCHAR2,
  po_cu_retorno                   OUT cu_rec_set,
  po_n_retorno                    out number,
  po_n_cod_error                  out number,
  po_v_msj_error                  out varchar2
)
as
  N_NRO_PROCESO_INFOCORP          NUMBER;
begin
  po_n_cod_error := -1;
  po_v_msj_error := ' ';
  po_n_retorno := -1;

  SELECT SCOB_SQ_NRO_PROCESO_INFOCORP.NEXTVAL INTO N_NRO_PROCESO_INFOCORP FROM DUAL;

  INSERT INTO T_SCOB_PROCESO_INFOCORP(
    ID_PROCESO_INFOCORP,
    NRO_PROCESO_INFOCORP,
    ID_EXPEDIENTE,
    ID_MULTA,
    COD_ENTIDAD,
    NRO_EXPEDIENTE,
    NRO_MULTA,
    COD_TIPO_DOCIDENTIDAD,
    NRO_TIPO_DOCIDENTIDAD,
    COD_TIPO_PERSONA,
    COD_TIPO_DEUDOR,
    NOM_DEUDOR,
    DIRECCION,
    COD_DISTRITO,
    NOM_DISTRITO,
    COD_DEPARTAMENTO,
    NOM_DEPARTAMENTO,
    FEC_VENCIMIENTO,
    COD_TIPO_DOCUMENTO,
    COD_TIPO_MONEDA,
    MONTO_IMPAGO,
    ESTADO,
    AUDFECCREACION,
    AUDUSUCREACION
  )
  SELECT
    SCOB_SQ_PROCESO_INFOCORP.NEXTVAL,
    N_NRO_PROCESO_INFOCORP,
    NVL(EXPE.ID_EXPEDIENTE,NULL) AS ID_EXPEDIENTE,
    MULT.ID_MULTA AS ID_MULTA,
    '008367' AS COD_ENTIDAD,
    DECODE(EXPE.ID_EXPEDIENTE,NULL,MDET.NRO_RESOL,EXPE.ANIO || ' ' || EXPE.NRO_EXPEDIENTE) AS NRO_EXPEDIENTE,
    MULT.ANIO || MULT.CUM AS NRO_MULTA,
    PERS.TIPO_DOC AS COD_TIPO_DOC_IDENTIDAD,
    PERS.NRO_DOC AS NRO_TIPO_DOC_IDENTIDAD,
    PERS.TIPO_PERSONA AS COD_TIPO_PERSONA,
    '1' AS COD_TIPO_DEUDOR,
    DECODE(PERS.TIPO_PERSONA, SCOB_PK_CONSTANTES.C_TIPO_PERS_JURIDICA,  PERS.RAZON_SOCIAL,  PERS.PRI_NOMBRE || ' ' || PERS.SEG_NOMBRE || ' ' || PERS.APE_PATERNO  || ' ' || PERS.APE_MATERNO  || ' ' || PERS.APE_CASADA) AS NOM_DEUDOR,
    DIRECCION AS DIRECCION,
    UBIG.COD_DIST AS COD_DSTO,
    UBIG.TXT_DIST AS NOM_DSTO,
    UBIG.COD_DPTO AS COD_DPTO,
    UBIG.TXT_DPTO AS NOM_DPTO,
    MDET.FECHA_NOTIF AS FEC_VENCIMIENTO,
    'OT' AS COD_TIPO_DOCUMENTO,
    '01' AS COD_TIPO_MONEDA,
    0 AS SALDO, --FALTA
    '1',
    SYSDATE,
    PI_V_AUDUSUCREACION
  FROM T_SCOB_MULTA MULT
  LEFT JOIN T_SCOB_EXPEDIENTE_MULTA EXMU
        ON EXMU.ID_MULTA = MULT.ID_MULTA
        AND EXMU.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
  LEFT JOIN T_SCOB_EXPEDIENTE EXPE
       ON EXPE.ID_EXPEDIENTE = EXMU.ID_EXPEDIENTE
       AND EXPE.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
  INNER JOIN T_SCOB_MULTA_DETAL MDET
        ON MDET.ID_MULTA = MULT.ID_MULTA
        AND MDET.FLG_ACTUAL = '1'
  INNER JOIN T_SCOB_MULTA_SANCIONADO SANC
        ON SANC.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL
  INNER JOIN T_SCOB_PERSONA PERS
        ON PERS.ID_PERSONA = SANC.ID_PERSONA
  LEFT JOIN (
      SELECT
      PDOM.ID_PERSONA AS ID_PERSONA,
      MIN(PDOM.TIPO_DOMICILIO) AS TIPO_DOMICILIO
      FROM T_SCOB_PERSONA_DOMICILIO PDOM
      WHERE PDOM.TIPO_DOMICILIO IN (4,5) --RENIEC, SUNAT
      GROUP BY PDOM.ID_PERSONA
  ) TIPO_DIRECCION
    ON TIPO_DIRECCION.ID_PERSONA = PERS.ID_PERSONA

  LEFT JOIN T_SCOB_PERSONA_DOMICILIO PDOM
    ON PDOM.ID_PERSONA = TIPO_DIRECCION.ID_PERSONA
    AND PDOM.TIPO_DOMICILIO = TIPO_DIRECCION.TIPO_DOMICILIO

  LEFT JOIN T_SCOB_UBIGEO UBIG
    ON UBIG.ID_UBIGEO = PDOM.ID_UBIGEO

  LEFT JOIN (
        SELECT DISTINCT
          EXPE.ID_EXPEDIENTE AS ID_EXPEDIENTE,
          EXDO.AUDFECCREACION AS FEC_EMISION_REC,
          EXDO.FEC_NOTIFICACION AS FEC_NOTIFICA_REC
        FROM (
              SELECT
                EXDO.ID_EXPEDIENTE AS ID_EXPEDIENTE,
                EXDO.ID_MOTIVO_PLANTILLA AS ID_MOT_PLA,
                MAX(TO_NUMBER(EXDO.NRO_VERSION)) AS VERSION
              FROM T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
              INNER JOIN T_SCOB_MOTIVO_PLANTILLA MOPL
                    ON MOPL.ID_MOTIVO_PLANTILLA = EXDO.ID_MOTIVO_PLANTILLA
              WHERE
              COD_GENERADOR_DOCUMENTO IS NOT NULL
              AND EXDO.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
              AND EXDO.ID_TIPO_DOCUMENTO IN (1,5) --TIPOS DE DOCUMENTOS "RESOLUCION REC"
              GROUP BY EXDO.ID_EXPEDIENTE, EXDO.ID_MOTIVO_PLANTILLA
        ) EXPE
        INNER JOIN T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
              ON EXDO.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
              AND EXDO.ID_MOTIVO_PLANTILLA = EXPE.ID_MOT_PLA
              AND TO_NUMBER(EXDO.NRO_VERSION) = EXPE.VERSION
        INNER JOIN T_SCOB_EXPEDIENTE_MULTA EXMU
              ON EXMU.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
              AND EXMU.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
        INNER JOIN T_SCOB_MULTA MULT
              ON MULT.ID_MULTA = EXMU.ID_MULTA

  )DOC_REC
          ON DOC_REC.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
  WHERE (NVL(PI_V_ID_MULTA,' ')=' ' OR (NVL(PI_V_ID_MULTA,' ')<>' ' AND INSTR(PI_V_ID_MULTA,'|' || TO_CHAR(MULT.ID_MULTA) || '|' )>0));

  po_n_cod_error := 0;
  po_n_retorno := N_NRO_PROCESO_INFOCORP;
  COMMIT;

  OPEN po_cu_retorno FOR
  SELECT
    COD_ENTIDAD AS COD_ENTIDAD,
    NRO_EXPEDIENTE AS NRO_EXPEDIENTE,
    NRO_MULTA AS NRO_MULTA,
    COD_TIPO_DOCIDENTIDAD AS COD_TIPO_DOCIDENTIDAD,
    NRO_TIPO_DOCIDENTIDAD AS NRO_TIPO_DOCIDENTIDAD,
    COD_TIPO_PERSONA AS COD_TIPO_PERSONA,
    COD_TIPO_DEUDOR AS COD_TIPO_DEUDOR,
    NOM_DEUDOR AS NOM_DEUDOR,
    DIRECCION AS DIRECCION,
    COD_DISTRITO AS COD_DISTRITO,
    NOM_DISTRITO AS NOM_DISTRITO,
    COD_DEPARTAMENTO AS COD_DEPARTAMENTO,
    NOM_DEPARTAMENTO AS NOM_DEPARTAMENTO,
    FEC_VENCIMIENTO AS FEC_VENCIMIENTO,
    COD_TIPO_DOCUMENTO AS COD_TIPO_DOCUMENTO,
    COD_TIPO_MONEDA AS COD_TIPO_MONEDA,
    MONTO_IMPAGO AS MONTO_IMPAGO,
    AUDFECCREACION AS FEC_REGISTRO
  FROM T_SCOB_PROCESO_INFOCORP PI
  WHERE PI.NRO_PROCESO_INFOCORP = N_NRO_PROCESO_INFOCORP;

  exception
  when others then
      po_n_retorno := -1;
      po_n_cod_error := sqlcode;
      select case when po_n_cod_error > 0 then po_n_cod_error * -1 else po_n_cod_error end
      into po_n_cod_error
      from dual;
      po_v_msj_error := substr(sqlerrm,1,250);
      rollback;
end;*/

procedure SCOB_SP_S_INFOCORP
/*
-----------------------------------------------------------
-- Autor        : JLPY
-- Creado       : 05.05.2011
-- Proposito    : listar con el flg enviar para inforcorp
-----------------------------------------------------------
-- Modificacion : se cambia join de ubigeo
-- Autor        : EDLT
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  po_cu_retorno                      out cu_rec_set
)
as
begin

  open  po_cu_retorno for
  WITH TEMP AS (
              SELECT 1 AS F,MUL.ID_MULTA ID,MDT.NRO_RESOLUCION RESOLUCION,
                     --MUL.SALDO_TOTAL_DEUDA SALDO,
                     (
                      SELECT SUM(A.SALDO_TOTAL_DEUDA)
                      FROM T_SCOB_MULTA A INNER JOIN T_SCOB_EXPEDIENTE_MULTA B ON A.ID_MULTA=B.ID_MULTA
                      WHERE ID_EXPEDIENTE=X.ID_EXPEDIENTE
					  AND B.ESTADO = '1'--2019-128793 Debe visualizar sólo los registros activos en el reporte de Infocorp
                     ) AS SALDO,
                     --- CUANDO SE MARCA POR MULTA
                     MUL.FEC_ENVIO_RIESGO FEC_ENVIO_RIESGO
                     ,MUL.FLG_ENVIO_RIESGO FLG_ENVIO_RIESGO
                     --- CUANDO SE MARCA POR EXPED.
                     ,MUL.FLG_ENVIO_RIESGO_EXP FLG_ENVIO_RIESGO_EXP
                     ,MUL.FEC_ENVIO_RIESGO_EXP FEC_ENVIO_RIESGO_EXP
              FROM T_SCOB_MULTA MUL
                   INNER JOIN T_SCOB_MULTA_DETAL MDT ON MUL.ID_MULTA = MDT.ID_MULTA
                   INNER JOIN T_SCOB_ORGANO_RESOLUTIVO ORS ON ORS.ID_ORGANO_RESOLUTIVO = MDT.ID_ORGANO_RESOLUTIVO
                   INNER JOIN T_SCOB_EXPEDIENTE_MULTA X ON MUL.ID_MULTA=X.ID_MULTA
              WHERE ORS.TIPO_INSTANCIA = MUL.TIPO_INSTANCIA_INICIA
                   AND (MUL.FLG_ENVIO_RIESGO = '1' OR  MUL.FLG_ENVIO_RIESGO_EXP = '1')-- ENVIADO A CENTRAL DE RIESGO
                   --I@002 30.12.2011
                   AND (MUL.SALDO_TOTAL_DEUDA > 0)
                   AND X.ESTADO = '1'--2019-128793 Debe visualizar sólo los registros activos en el reporte de Infocorp
                   --F@002 30.12.2011
                   AND MUL.ESTADO = '1' --I@002 26.12.2011
                   --F@002 30.12.2011*/
                   AND MUL.ID_MULTA = SCOB_PK_EXPEDIENTE.SCOB_FN_MUL_ANTIGUO(X.ID_EXPEDIENTE)
                   )--CARGA DE MULTA Y EXPEDIENTES
SELECT DISTINCT --TO_CHAR(TEMP.FEC,'DD/MM/YYYY')FECHA_REPORTE
                (CASE WHEN NVL(TEMP.FLG_ENVIO_RIESGO,'0') = '1' THEN TO_CHAR(TEMP.FEC_ENVIO_RIESGO,'DD/MM/YYYY')
                      WHEN NVL(TEMP.FLG_ENVIO_RIESGO,'0') = '1' AND NVL(TEMP.FLG_ENVIO_RIESGO_EXP,'0')='1' THEN TO_CHAR(TEMP.FEC_ENVIO_RIESGO,'DD/MM/YYYY')
                      WHEN NVL(TEMP.FLG_ENVIO_RIESGO,'0') = '0' AND NVL(TEMP.FLG_ENVIO_RIESGO_EXP,'0')='1' THEN TO_CHAR(TEMP.FEC_ENVIO_RIESGO_EXP,'DD/MM/YYYY')
                 END
                ) FECHA_REPORTE
       ,'008367'CODIGO_ENTIDAD,
       (CASE WHEN EXPMUL.ID_EXPEDIENTE IS NULL THEN MDT.NRO_RESOLUCION
             ELSE EXP.ANIO || EXP.NRO_EXPEDIENTE
             END) CODIGO_MOROSIDAD --TEMP.RESOLUCION CODIGO_MOROSIDAD,  --I@002 26.12.2011
       ,TDE_TIP_DOC.TXT_DESCRIPCION TIP_DOC_IDENTIDAD
       ,PER.NRO_DOC NUMERO_DOC_IDENTIDAD
      ,TDE_TIP_PER.TXT_DESCRIPCION TIPO_PERSONA
       ,'1' TIPO_DEUDOR,
       SUBSTR(DECODE(PER.TIPO_PERSONA,1,PER.APE_PATERNO || ' ' || PER.APE_MATERNO || ' ' || PER.PRI_NOMBRE || ' ' || PER.SEG_NOMBRE,2,PER.RAZON_SOCIAL),1,80) NOMBRE
       --I@003 26.10.2012
      ,scob_pk_proceso.SCOB_FN_DIRECCION_ADM(PER.ID_PERSONA,0,1) as DIRECCION --DIRECCION
       ,'' CODIGO_DISTRITO
       , scob_pk_proceso.SCOB_FN_DIRECCION_ADM(PER.ID_PERSONA,0,2)as NOMBRE_DISTRITO
       ,'' CODIGO_DEPARTAMENTO
       ,scob_pk_proceso.SCOB_FN_DIRECCION_ADM(PER.ID_PERSONA,0,3)as NOMBRE_DEPARTAMENTO,
       --F@003 26.10.2012
       MDT.FEC_NOTIFICACION_RESOLUCION FECHA_VENCIMIENTO,
       'OT' TIPO_DOCUMENTO,'01' TIPO_MONEDA,
       TRUNC(TEMP.SALDO,0)SALDO,'' AS CONDICION_DEUDA,F AS F, TEMP.ID ID,SYSDATE FEC_SERVIDOR
       --@I002 26.12.2011
       ,(case when PER.TIPO_DOC = 2 or PER.TIPO_DOC = 3 then  3
             when PER.TIPO_DOC = 5 then 6
             when PER.TIPO_DOC = 4 or  PER.TIPO_DOC = 6 then null
             else PER.TIPO_DOC --1 : DNI
        end) AS COD_TIPO_DOC_IDENTIDAD
       ,PER.TIPO_PERSONA AS COD_TIPO_PERSONA
       --@F002 26.12.2011
       ,PER.TIPO_DOC as TIPO_DOC  -- si el tipo doc es 4 o 6 no se debe mostrar en excel
FROM TEMP
     --@I002 26.12.2011
     LEFT JOIN T_SCOB_EXPEDIENTE_MULTA EXPMUL
          ON TEMP.ID = EXPMUL.ID_MULTA
          AND EXPMUL.ESTADO = '1'
     LEFT JOIN T_SCOB_EXPEDIENTE EXP
          ON EXPMUL.ID_EXPEDIENTE = EXP.ID_EXPEDIENTE
     --@F002 26.12.2011
     INNER JOIN T_SCOB_MULTA_DETAL MDT
           ON TEMP.ID = MDT.ID_MULTA
           AND MDT.ESTADO='1' -- I@001
           AND MDT.FLG_ACTUAL = '1' --@I002 26.12.2011
     INNER JOIN T_SCOB_MULTA_SANCIONADO MSN
           ON MDT.ID_MULTA_DETAL = MSN.ID_MULTA_DETAL
           AND MSN.ESTADO='1' -- I@001
           AND MSN.FLG_PRINCIPAL = '1' -- PRINCIPAL
     INNER JOIN T_SCOB_PERSONA PER
           ON PER.ID_PERSONA = MSN.ID_PERSONA
           AND PER.ESTADO = '1'
     LEFT JOIN T_SCOB_TABLA_DET TDE_TIP_PER ON
     (PER.TIPO_PERSONA=TDE_TIP_PER.COD_INTERNO AND TDE_TIP_PER.ID_TABLA=11)
     LEFT JOIN T_SCOB_TABLA_DET TDE_TIP_DOC ON
     (PER.TIPO_DOC=TDE_TIP_DOC.COD_INTERNO AND TDE_TIP_DOC.ID_TABLA=10)
WHERE PER.TIPO_PERSONA = 1 ---PERSONA NATURAL

UNION
SELECT DISTINCT --TO_CHAR(TEMP.FEC,'DD/MM/YYYY')FECHA_REPORTE
                (CASE WHEN NVL(TEMP.FLG_ENVIO_RIESGO,'0') = '1' THEN TO_CHAR(TEMP.FEC_ENVIO_RIESGO,'DD/MM/YYYY')
                      WHEN NVL(TEMP.FLG_ENVIO_RIESGO,'0') = '1' AND NVL(TEMP.FLG_ENVIO_RIESGO_EXP,'0')='1' THEN TO_CHAR(TEMP.FEC_ENVIO_RIESGO,'DD/MM/YYYY')
                      WHEN NVL(TEMP.FLG_ENVIO_RIESGO,'0') = '0' AND NVL(TEMP.FLG_ENVIO_RIESGO_EXP,'0')='1' THEN TO_CHAR(TEMP.FEC_ENVIO_RIESGO_EXP,'DD/MM/YYYY')
                 END
                ) FECHA_REPORTE
       ,'008367'CODIGO_ENTIDAD,
       (CASE WHEN EXPMUL.ID_EXPEDIENTE IS NULL THEN MDT.NRO_RESOLUCION
             ELSE EXP.ANIO || EXP.NRO_EXPEDIENTE
             END) CODIGO_MOROSIDAD --TEMP.RESOLUCION CODIGO_MOROSIDAD,  --I@002 26.12.2011
       ,TDE_TIP_DOC.TXT_DESCRIPCION TIP_DOC_IDENTIDAD
       ,PER.NRO_DOC NUMERO_DOC_IDENTIDAD
       ,TDE_TIP_PER.TXT_DESCRIPCION TIPO_PERSONA
       ,'1' TIPO_DEUDOR,
       SUBSTR(DECODE(PER.TIPO_PERSONA,1,PER.APE_PATERNO || ' ' || PER.APE_MATERNO || ' ' || PER.PRI_NOMBRE || ' ' || PER.SEG_NOMBRE,2,PER.RAZON_SOCIAL),1,80) NOMBRE,
       --I@003 26.10.2012
       scob_pk_proceso.SCOB_FN_DIRECCION_ADM(PER.ID_PERSONA,0,1)as DIRECCION,--DIRECCION
       '' CODIGO_DISTRITO
       ,scob_pk_proceso.SCOB_FN_DIRECCION_ADM(PER.ID_PERSONA,0,2)as NOMBRE_DISTRITO
       ,'' CODIGO_DEPARTAMENTO
       ,scob_pk_proceso.SCOB_FN_DIRECCION_ADM(PER.ID_PERSONA,0,3)as NOMBRE_DEPARTAMENTO,
       --F@003 26.10.2012
       MDT.FEC_NOTIFICACION_RESOLUCION FECHA_VENCIMIENTO,
       'OT' TIPO_DOCUMENTO,'01' TIPO_MONEDA,
       TRUNC(TEMP.SALDO,0)SALDO,'' AS CONDICION_DEUDA,F AS F, TEMP.ID ID,SYSDATE FEC_SERVIDOR
       --@I002 26.12.2011
       ,(case when PER.TIPO_DOC = 2 or PER.TIPO_DOC = 3 then  3
             when PER.TIPO_DOC = 5 then 6
             when PER.TIPO_DOC = 4 or  PER.TIPO_DOC = 6 then null
             else PER.TIPO_DOC --1 : DNI
        end) AS COD_TIPO_DOC_IDENTIDAD
       ,PER.TIPO_PERSONA AS COD_TIPO_PERSONA
       --@F002 26.12.2011
       ,PER.TIPO_DOC as TIPO_DOC -- si el tipo doc es 4 o 6 no se debe mostrar en excel
 FROM TEMP
     --@I002 26.12.2011
     LEFT JOIN T_SCOB_EXPEDIENTE_MULTA EXPMUL
          ON TEMP.ID = EXPMUL.ID_MULTA
          AND EXPMUL.ESTADO = '1'
     LEFT JOIN T_SCOB_EXPEDIENTE EXP
          ON EXPMUL.ID_EXPEDIENTE = EXP.ID_EXPEDIENTE
     --@F002 26.12.2011
     INNER JOIN T_SCOB_MULTA_DETAL MDT
           ON TEMP.ID = MDT.ID_MULTA
           AND MDT.ESTADO='1' -- I@001
           AND MDT.FLG_ACTUAL = '1' --@I002 26.12.2011
     INNER JOIN T_SCOB_MULTA_SANCIONADO MSN
           ON MDT.ID_MULTA_DETAL = MSN.ID_MULTA_DETAL
           AND MSN.ESTADO='1' -- I@001
           AND MSN.FLG_PRINCIPAL = '1' -- PRINCIPAL
     INNER JOIN T_SCOB_PERSONA PER
           ON PER.ID_PERSONA = MSN.ID_PERSONA
           AND PER.ESTADO = '1'
     LEFT JOIN T_SCOB_TABLA_DET TDE_TIP_PER ON
     (PER.TIPO_PERSONA=TDE_TIP_PER.COD_INTERNO AND TDE_TIP_PER.ID_TABLA=11)
     LEFT JOIN T_SCOB_TABLA_DET TDE_TIP_DOC ON
     (PER.TIPO_DOC=TDE_TIP_DOC.COD_INTERNO AND TDE_TIP_DOC.ID_TABLA=10)
WHERE PER.TIPO_PERSONA = 2  ---PERSONA JURIDICA
;

end;

procedure SCOB_SP_U_INFOCORP
/*
-----------------------------------------------------------
-- Autor        : JLPY
-- Creado       : 05.05.2011
-- Proposito    : listar con el flg enviar para inforcorp
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_V_ARRAY_ID                    IN VARRAY_ID,--ARRAY DE ID MULTA O ID EXPEDIENTE PARA ACTUALIZAR --OBLIGATORIO
  PI_V_ARRAY_FILTRO                IN VARRAY_FILTRO,--ARRAY --1:MULTA,2:EXPEDIENTE --OBLIGATORIO
  po_n_retorno                     out number,
  po_n_cod_error                   out number,
  po_v_msj_error                   out varchar2
)
as
begin
   po_v_msj_error :='';
   po_n_retorno := 0;
   po_n_cod_error := -1;
   FOR i IN 1..PI_V_ARRAY_ID.count
       LOOP
           IF PI_V_ARRAY_FILTRO(i)='1' THEN
              UPDATE T_SCOB_MULTA
              SET FLG_ENVIO_RIESGO = ''
                  ,FEC_ENVIO_RIESGO =''
                  ,FEC_INGRESO_ENVIO_RIESGO=SYSDATE
                  -- EXP
                  ,FLG_ENVIO_RIESGO_EXP = ''
                  ,FEC_ENVIO_RIESGO_EXP = ''
                  ,FEC_INGRESO_ENVIO_RIESGO_EXP=SYSDATE
              WHERE ID_MULTA = PI_V_ARRAY_ID(I);
           --ELSIF PI_V_ARRAY_FILTRO(i)='2' THEN
             -- UPDATE T_SCOB_EXPEDIENTE SET FLG_ENVIO_RIESGO = '',FEC_ENVIO_RIESGO='',FEC_INGRESO_ENVIO_RIESGO=SYSDATE WHERE ID_EXPEDIENTE = PI_V_ARRAY_ID(I);
           END IF;
           dbms_output.put_line( PI_V_ARRAY_ID(i));
           dbms_output.put_line( PI_V_ARRAY_FILTRO(i));
       END LOOP;
       COMMIT;
   exception
   when others then
      po_n_retorno := -1;
      po_n_cod_error := sqlcode;
      select case when po_n_cod_error > 0 then po_n_cod_error * -1 else po_n_cod_error end
      into po_n_cod_error
      from dual;
      po_v_msj_error := substr(sqlerrm,1,250);
      rollback;
end;

procedure SCOB_SP_UP_INFOCORP
/*
-----------------------------------------------------------
-- Autor        : JLPY
-- Creado       : 05.05.2011
-- Proposito    : desmarca el flag de envio a infocorp
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_V_ID                          IN VARCHAR2,--OBLIGATORIO
  PI_V_FILTRO                      IN VARCHAR2,--OBLIGATORIO
  PI_N_NRO_ITEMS                   IN NUMBER,--OBLIGATORIO
  po_n_retorno                     out number,
  po_n_cod_error                   out number,
  po_v_msj_error                   out varchar2
)
as
  N_CONT NUMBER;
  V_ID VARCHAR2(50);
  V_FILTRO VARCHAR2(1);
begin
   po_v_msj_error :='';
   po_n_retorno := 0;
   po_n_cod_error := -1;
   V_ID := '';
   V_FILTRO := '';

   N_CONT := 1;
   WHILE (N_CONT <= PI_N_NRO_ITEMS)
   LOOP
    SCOB_PK_UTILITARIO.SCOB_SP_S_SPLIT(PI_V_ID,'|', N_CONT+1, V_ID);
    SCOB_PK_UTILITARIO.SCOB_SP_S_SPLIT(PI_V_FILTRO,'|', N_CONT+1, V_FILTRO);
    N_CONT := N_CONT + 1;
    IF V_ID='#' THEN
       EXIT;
    END IF;
    IF V_FILTRO='1' THEN
       UPDATE T_SCOB_MULTA
       SET FLG_ENVIO_RIESGO = ''
           ,FEC_ENVIO_RIESGO=''
           ,FEC_INGRESO_ENVIO_RIESGO=SYSDATE
          -- EXP
           ,FLG_ENVIO_RIESGO_EXP = ''
           ,FEC_ENVIO_RIESGO_EXP = ''
           ,FEC_INGRESO_ENVIO_RIESGO_EXP=SYSDATE
       WHERE ID_MULTA = V_ID;
    /*ELSIF V_FILTRO='2' THEN
       UPDATE T_SCOB_EXPEDIENTE SET FLG_ENVIO_RIESGO = '',FEC_ENVIO_RIESGO='',FEC_INGRESO_ENVIO_RIESGO=SYSDATE
       WHERE ID_EXPEDIENTE = (
             SELECT ID_EXPEDIENTE
             FROM   T_SCOB_MULTA MUL
             INNER JOIN T_SCOB_EXPEDIENTE_MULTA EML ON MUL.ID_MULTA = EML.ID_MULTA
             INNER JOIN T_SCOB_EXPEDIENTE EXP ON EML.ID_EXPEDIENTE = EXP.ID_EXPEDIENTE
             WHERE MUL.ID_MULTA = V_ID);*/
    END IF;
   END LOOP;
   COMMIT;
   exception
   when others then
      po_n_retorno := -1;
      po_n_cod_error := sqlcode;
      select case when po_n_cod_error > 0 then po_n_cod_error * -1 else po_n_cod_error end
      into po_n_cod_error
      from dual;
      po_v_msj_error := substr(sqlerrm,1,250);
      rollback;
end;

procedure SCOB_SP_G_ENVIO_BANCO_F1
/*
-----------------------------------------------------------
-- Autor        : JLPY
-- Creado       : 21.07.2011
-- Proposito    : Envio para bancos crep3 MULTAS FRACCIONADAS
-----------------------------------------------------------
*/
(
 po_cu_retornoC                         out cu_rec_set,--out sys_refcursor,--para txt
 po_cu_retornoD                         out cu_rec_set,--out sys_refcursor,-- para txt
 po_cu_retornoC_                        out cu_rec_set,--out sys_refcursor,--para excel
 po_cu_retornoD_                        out cu_rec_set--out sys_refcursor,-- para excel
)
as
begin
    EXECUTE IMMEDIATE 'TRUNCATE TABLE T_SCOB_TMP_BANCO_CREP3_D';
    EXECUTE IMMEDIATE 'TRUNCATE TABLE T_SCOB_TMP_BANCO_CREP3_D_';

-----------------
/*CREATE GLOBAL TEMPORARY TABLE TEMP_CREP3_D (TIP_REGISTRO CHAR(2),COD_SUCURSAL CHAR(3),
       COD_MONEDA CHAR(1),NUM_EMP_AFILIADA CHAR(7),COD_IDENTIFICACION_UNICO CHAR(14),
       NOM_DENUNCIADO VARCHAR2(40),COD_UNICO_EXPEDIENTE VARCHAR2(30),FEC_SERVIDOR CHAR(8),
       FEC_VEN_CUPOM CHAR(8),MONTO_CUPON CHAR(15),MONTO_MORA CHAR(15),MONTO_MINIMO CHAR(9),
       REG_ACTUALIZACION CHAR(1)) ON COMMIT DELETE ROWS;*/ --CREACION DE LA TABLA TEMPORAL
--INSERCION DE LA TABLA TEMPORAL CON LOS CAMPOS DEL DETALLE
-----------------
--DETALLE CREP3--PARA EL ARCHIVO PLANO
-----------------
INSERT INTO T_SCOB_TMP_BANCO_CREP3_D
        SELECT /*1*/'DD' TIP_REGISTRO,
               /*2*/'193' COD_SUCURSAL,
               /*3*/'0' COD_MONEDA,
               /*4*/'1852416' NUM_EMP_AFILIADA,
               /*5--1*/MUL.ANIO || LPAD(SUBSTR(MUL.CUM,-8),8,0)
               || LPAD(EXCROD.NRO_CUOTA,2,0) AS COD_IDENTIFICACION_UNICO,--/1
               /*6--2*/USR_SICOB.FUN_SCOB_ALFANUMERICO((UPPER(RPAD((SUBSTR((
               DECODE(PER.TIPO_PERSONA,
               --1,PER.APE_PATERNO || ' ' || PER.APE_MATERNO || ' ' || PER.PRI_NOMBRE || ' ' || PER.SEG_NOMBRE,
               --2,PER.RAZON_SOCIAL)),1,40)),40,'  ')))) NOM_DENUNCIADO,--/2--
               1,USR_SICOB.FUN_SCOB_ALFA_CAREXT(PER.APE_PATERNO || ' ' || PER.APE_MATERNO || ' ' || PER.PRI_NOMBRE || ' ' || PER.SEG_NOMBRE),
               2,USR_SICOB.FUN_SCOB_ALFA_CAREXT(PER.RAZON_SOCIAL))),1,40)),40,'  ')))) NOM_DENUNCIADO,--/2--FALATA:Caracteres alfa-numericos,No simbolos, no tildes, no ? ni ?.
               ---
               /*7--3*/NVL(EXP.ANIO,'0000') || LPAD(SUBSTR(NVL(EXP.NRO_EXPEDIENTE,'0000000'),-7),7,0) || LPAD(nvl(ARECO.codigo,'000'),3,0) ||
               LPAD(SUBSTR(NVL(MUL.ANIO_FILE_AEC,'00'),-2),2,0) || LPAD((SUBSTR(NVL(MUL.NRO_FILE_AEC,'000000'),-6)),6,0) ||
               '0' || '000000' || 'S' AS COD_UNICO_EXPEDIENTE,--/3
               /*\*7--3*\EXP.ANIO || LPAD(SUBSTR(EXP.NRO_EXPEDIENTE,-7),7,0) || LPAD(SUBSTR(ARECO.CODIGO,-3),3,0) ||
               LPAD(SUBSTR(MUL.ANIO_FILE_AEC,-2),2,0) || LPAD((SUBSTR(MUL.NRO_FILE_AEC,-6)),6,0) ||
               '0' || '000000' || 'S' AS COD_UNICO_EXPEDIENTE,--/3*/
               ---
               /*8*/TO_CHAR(SYSDATE,'YYYYMMDD') AS FEC_SERVIDOR,
               /*9--4*/TO_CHAR(EXCROD.FEC_VENCIMIENTO,'YYYYMMDD') AS FEC_VEN_CUPOM,--/4
               /*10*/DECODE(EXCROD.NRO_CUOTA,
               1,LPAD((ROUND((EXCROD.SALDO+EXCROD.SALDO_IC+EXCROD.SALDO_COSTAS)*100,0)),15,0),
               LPAD((ROUND((EXCROD.SALDO+EXCROD.SALDO_IC)*100,0)),15,0)
               ) AS MONTO_CUPON,
               /*11*/LPAD((ROUND(EXCROD.MONTO_INTERES_MORATORIO*100,0)),15,0) AS MONTO_MORA,--FALTA CALCUO DEL LA MORA UN DIA ANTES DE LA IMPRESION
               /*12*/DECODE(EXCROD.NRO_CUOTA,
               1,LPAD((ROUND((EXCROD.SALDO+EXCROD.SALDO_IC+EXCROD.SALDO_COSTAS)*100,0)),9,0),
               LPAD((ROUND((EXCROD.SALDO+EXCROD.SALDO_IC)*100,0)),9,0)
               ) AS MONTO_MINIMO,
               /*13*/RPAD('A',48,' ') AS REG_ACTUALIZACION
               ,'0' AS FLG_FRACC
               ,EXP.ESTADO_EXPEDIENTE AS ESTADO_EXPEDIENTE
               --/*14*/LPAD(' ',47,' ') as FILLER -- ESPACIOS VACIOS
FROM   --1-
               T_SCOB_MULTA MUL
               INNER JOIN T_SCOB_MULTA_DETAL MULDE
                     ON MUL.ID_MULTA = MULDE.ID_MULTA
                     AND MULDE.ESTADO = '1' -- 26.12.2011
                     AND MULDE.FLG_ACTUAL = '1'
               INNER JOIN T_SCOB_EXPEDIENTE_MULTA EXMUL ON MUL.ID_MULTA = EXMUL.ID_MULTA
                     AND EXMUL.ESTADO = '1' -- 26.12.2011
               INNER JOIN T_SCOB_EXPEDIENTE EXP ON EXP.ID_EXPEDIENTE = EXMUL.ID_EXPEDIENTE
                     AND EXP.ESTADO = '1' -- 26.12.2011
               ----
               INNER JOIN T_SCOB_EXPED_CRONOGRAMA EXCRO
                     ON EXP.ID_EXPEDIENTE = EXCRO.ID_EXPEDIENTE
                     --- 1=Fraccionamiento ; 2=Pago Programado
                     AND EXCRO.FLG_ACTUAL = '1' AND EXCRO.COD_TIPO_CRONOGRAMA = 1
                     and EXCRO.Estado = '1'
               INNER JOIN T_SCOB_EXPED_CRONOGRAMA_DET EXCROD
                     ON EXCRO.ID_EXPED_CRONOGRAMA_PAGO = EXCROD.ID_EXPED_CRONOGRAMA_PAGO--1-
                     --- 1=Pendiente; 2=Pago Parcial; 3=Pago Total
                     AND (EXCROD.ESTADO_CUOTA = 1 OR EXCROD.ESTADO_CUOTA = 2)--/1-PARA FILTRAR EL NUMERO DE CUOTA
                     --- 1=Pendiente; 2=Cerrado
                     --AND (EXCRO.ESTADO_CRONOGRAMA =1) --4-
               INNER JOIN T_SCOB_MULTA_SANCIONADO MULSA
                     ON MULDE.ID_MULTA_DETAL = MULSA.ID_MULTA_DETAL
                     AND MULSA.FLG_PRINCIPAL = '1' -- 26.12.2011
                     AND MULSA.ESTADO = '1'
               INNER JOIN T_SCOB_PERSONA PER
                     ON MULSA.ID_PERSONA = PER.ID_PERSONA--2-
                     AND PER.COD_SANCIONADO IS NOT NULL
                     AND PER.ESTADO ='1'
              --3-
               INNER JOIN T_SCOB_USUARIO USU
                     ON USU.ID_USUARIO = MUL.ID_USUARIO_ASIG_COBRANZA
               INNER JOIN T_SCOB_AREA_COBRANZA ARECO
                     ON ARECO.ID_AREA_COBRANZA = MUL.ID_AREA_COBRANZA

        WHERE  EXP.ESTADO_EXPEDIENTE = 4  --- fraccionado
               --PRECONDICION-(saldo capital+ saldo ic + saldo costas > monto minimo)
               AND ((MUL.SALDO+MUL.SALDO_IC+MUL.SALDO_COSTAS) /*+ (MUL.MONTO_INTERES - MUL.TOTAL_AMORTIZADO_IC) + (MUL.TOTAL_AMORTIZADO_COSTAS - MUL.TOTAL_AMORTIZADO_COSTAS)*/)
                    >
                   (SELECT EF.SALDO_MINIMO_ENVIO_BCO
                    FROM T_SCOB_ENTIDAD_FINANCIERA EF
                    WHERE EF.ID_ENTIDAD_FINANCIERA=1)
               --- para pruebas
               --and mul.id_multa = 3443
               ---
               ;
--CARGAR CURSOR DETALLE
OPEN po_cu_retornoD FOR
SELECT * FROM T_SCOB_TMP_BANCO_CREP3_D;

--CREP3_CABECERA--
------------------
OPEN    po_cu_retornoC FOR
SELECT 'CC' TIP_REGISTRO,'193' COD_SUCURSAL,'0' COD_MONEDA,'1852416' COD_EMP_AFILIADA,'C' TIP_VALIDACION,
       RPAD('INDECOPI',40,'  ') NOM_EMP_AFILIADA,TO_CHAR(SYSDATE,'YYYYMMDD') FEC_SERVIDOR,
       LPAD(CANT_REGISTRO,9,0)NUM_REGISTROS,LPAD(SUMA_CUOTAS,15,0) SUM_CUOTAS
       ,RPAD('A',114,' ') TIP_ARCHIVO--113 ESPACIOS VACIOS
FROM   (SELECT COUNT(1) CANT_REGISTRO,SUM(MONTO_CUPON) SUMA_CUOTAS
        FROM (SELECT * FROM T_SCOB_TMP_BANCO_CREP3_D
        ));


--DETALLE CREP3--PARA EL ARCHIVO EXCEL
-----------------
INSERT INTO T_SCOB_TMP_BANCO_CREP3_D_
        SELECT /*1*/'DD' TIP_REGISTRO,
               /*2*/'193' COD_SUCURSAL,
               /*3*/'0' COD_MONEDA,
               /*4*/'1852416' NUM_EMP_AFILIADA,
               /*5--1*/MUL.ANIO || LPAD(SUBSTR(MUL.CUM,-8),8,0)
               || LPAD(EXCROD.NRO_CUOTA,2,0) AS COD_IDENTIFICACION_UNICO,--/1
               /*6--2*/USR_SICOB.FUN_SCOB_ALFANUMERICO((UPPER(SUBSTR((
               DECODE(PER.TIPO_PERSONA,
               1,PER.APE_PATERNO || ' ' || PER.APE_MATERNO || ' ' || PER.PRI_NOMBRE || ' ' || PER.SEG_NOMBRE,
               2,PER.RAZON_SOCIAL)),1,40)))) NOM_DENUNCIADO,--/2--FALATA:Caracteres alfa-numericos,No simbolos, no tildes, no ? ni ?.
               /*7--3*/EXP.ANIO || LPAD(SUBSTR(EXP.NRO_EXPEDIENTE,-7),7,0) || LPAD(SUBSTR(ARECO.CODIGO,-3),3,0) ||
               LPAD(SUBSTR(MUL.ANIO_FILE_AEC,-2),2,0) || LPAD((SUBSTR(MUL.NRO_FILE_AEC,-6)),6,0) ||
               '0' || '000000' || 'S' AS COD_UNICO_EXPEDIENTE,--/3
               /*8*/TO_CHAR(SYSDATE,'YYYYMMDD') AS FEC_SERVIDOR,
               /*9--4*/TO_CHAR(EXCROD.FEC_VENCIMIENTO,'YYYYMMDD') AS FEC_VEN_CUPOM,--/4
               /*10*/DECODE(EXCROD.NRO_CUOTA,
               1,(EXCROD.SALDO+EXCROD.SALDO_IC+EXCROD.SALDO_COSTAS),
               (EXCROD.SALDO+EXCROD.SALDO_IC)
               ) AS MONTO_CUPON,
               /*11*/EXCROD.MONTO_INTERES_MORATORIO AS MONTO_MORA,--FALTA CALCUO DEL LA MORA UN DIA ANTES DE LA IMPRESION
               /*12*/DECODE(EXCROD.NRO_CUOTA,
               1,(EXCROD.SALDO+EXCROD.SALDO_IC+EXCROD.SALDO_COSTAS),
               (EXCROD.SALDO+EXCROD.SALDO_IC)
               ) AS MONTO_MINIMO,
               /*13*/'A' AS REG_ACTUALIZACION,
               SYSDATE FECHA
               ,'0' AS FLG_FRACC
               ,EXP.ESTADO_EXPEDIENTE AS ESTADO_EXPEDIENTE
FROM   --1-
               T_SCOB_MULTA MUL
               INNER JOIN T_SCOB_MULTA_DETAL MULDE
                     ON MUL.ID_MULTA = MULDE.ID_MULTA
                     AND MULDE.ESTADO = '1' -- 26.12.2011
                     AND MULDE.FLG_ACTUAL = '1'
               INNER JOIN T_SCOB_EXPEDIENTE_MULTA EXMUL ON MUL.ID_MULTA = EXMUL.ID_MULTA
                     AND EXMUL.ESTADO = '1' -- 26.12.2011
               INNER JOIN T_SCOB_EXPEDIENTE EXP ON EXP.ID_EXPEDIENTE = EXMUL.ID_EXPEDIENTE
                     AND EXP.ESTADO = '1' -- 26.12.2011
               ----
               INNER JOIN T_SCOB_EXPED_CRONOGRAMA EXCRO
                     ON EXP.ID_EXPEDIENTE = EXCRO.ID_EXPEDIENTE
                     --- 1=Fraccionamiento ; 2=Pago Programado
                     AND EXCRO.FLG_ACTUAL = '1' AND EXCRO.COD_TIPO_CRONOGRAMA = 1
                     and EXCRO.Estado = '1'
               INNER JOIN T_SCOB_EXPED_CRONOGRAMA_DET EXCROD
                     ON EXCRO.ID_EXPED_CRONOGRAMA_PAGO = EXCROD.ID_EXPED_CRONOGRAMA_PAGO--1-
                     --- 1=Pendiente; 2=Pago Parcial; 3=Pago Total
                     AND (EXCROD.ESTADO_CUOTA = 1 OR EXCROD.ESTADO_CUOTA = 2)--/1-PARA FILTRAR EL NUMERO DE CUOTA
                     --- 1=Pendiente; 2=Cerrado
                     --AND (EXCRO.ESTADO_CRONOGRAMA =1) --4-
               INNER JOIN T_SCOB_MULTA_SANCIONADO MULSA
                     ON MULDE.ID_MULTA_DETAL = MULSA.ID_MULTA_DETAL
                     AND MULSA.FLG_PRINCIPAL = '1' -- 26.12.2011
                     AND MULSA.ESTADO = '1'
               INNER JOIN T_SCOB_PERSONA PER
                     ON MULSA.ID_PERSONA = PER.ID_PERSONA--2-
                     AND PER.COD_SANCIONADO IS NOT NULL
                     AND PER.ESTADO ='1'
              --3-
               INNER JOIN T_SCOB_USUARIO USU
                     ON USU.ID_USUARIO = MUL.ID_USUARIO_ASIG_COBRANZA
               INNER JOIN T_SCOB_AREA_COBRANZA ARECO
                     ON ARECO.ID_AREA_COBRANZA = MUL.ID_AREA_COBRANZA
        WHERE  EXP.ESTADO_EXPEDIENTE = 4  --- fraccionado
               --PRECONDICION-(saldo capital+ saldo ic + saldo costas > monto minimo)
               AND ((MUL.SALDO+MUL.SALDO_IC+MUL.SALDO_COSTAS) /*+ (MUL.MONTO_INTERES - MUL.TOTAL_AMORTIZADO_IC) + (MUL.TOTAL_AMORTIZADO_COSTAS - MUL.TOTAL_AMORTIZADO_COSTAS)*/)
                    >
                   (SELECT EF.SALDO_MINIMO_ENVIO_BCO
                    FROM T_SCOB_ENTIDAD_FINANCIERA EF
                    WHERE EF.ID_ENTIDAD_FINANCIERA=1)
               --- para pruebas
               --and mul.id_multa =3443
               ---
               ;

--CARGAR CURSOR DETALLE
OPEN po_cu_retornoD_ FOR
SELECT * FROM T_SCOB_TMP_BANCO_CREP3_D_;

--CREP3_CABECERA--
------------------
OPEN    po_cu_retornoC_ FOR
SELECT 'CC' TIP_REGISTRO,'193' COD_SUCURSAL,'0' COD_MONEDA,'1852416' COD_EMP_AFILIADA,'C' TIP_VALIDACION,
       'INDECOPI' NOM_EMP_AFILIADA,TO_CHAR(SYSDATE,'YYYYMMDD') FEC_SERVIDOR,
       CANT_REGISTRO NUM_REGISTROS,(SUMA_CUOTAS) SUM_CUOTAS
       ,RPAD('A',114,' ') TIP_ARCHIVO--113 ESPACIOS VACIOS
FROM   (SELECT COUNT(1) CANT_REGISTRO,SUM(MONTO_CUPON) SUMA_CUOTAS
        FROM (SELECT * FROM T_SCOB_TMP_BANCO_CREP3_D_));

COMMIT;
end;

procedure SCOB_SP_G_ENVIO_BANCO_F2
/*
-----------------------------------------------------------
-- Autor        : JLPY
-- Creado       : 21.07.2011
-- Proposito    : Envio para bancos crep4
-----------------------------------------------------------
*/
(
 po_cu_retornoC                         out cu_rec_set,--out sys_refcursor,--para txt
 po_cu_retornoD                         out cu_rec_set,--out sys_refcursor,-- para txt
 po_cu_retornoC_                        out cu_rec_set,--out sys_refcursor,--para excel
 po_cu_retornoD_                        out cu_rec_set--out sys_refcursor,-- para excel
)
as
--c_crepc sys_refcursor;
--c_crepd sys_refcursor;
--X NUMBER;
begin
    EXECUTE IMMEDIATE 'TRUNCATE TABLE T_SCOB_TMP_BANCO_CREP3_D';
    EXECUTE IMMEDIATE 'TRUNCATE TABLE T_SCOB_TMP_BANCO_CREP3_D_';
--DETALLE CREP4--PARA EL ARCHIVO PLANO
-----------------
INSERT INTO T_SCOB_TMP_BANCO_CREP3_D --req bancos v0.5
        SELECT /*1*/'DD' TIP_REGISTRO,
               /*2*/'193' COD_SUCURSAL,
               /*3*/'0' COD_MONEDA,
               /*4*/'1852417' NUM_EMP_AFILIADA,
               /*5--1*//*'00' ||*/ MUL.ANIO || MUL.CUM AS COD_IDENTIFICACION_UNICO,--/1
               /*6--2*/RPAD(USR_SICOB.FUN_SCOB_ALFANUMERICO(UPPER((SUBSTR((DECODE(PER.TIPO_PERSONA,
               --1,TRIM(PER.APE_PATERNO) || ' ' || TRIM(PER.APE_MATERNO) || ' ' ||TRIM(PER.PRI_NOMBRE) /*|| ' ' || TRIM(PER.SEG_NOMBRE)*/,
               --2,PER.RAZON_SOCIAL)),1,40)))),40,'  ') NOM_DENUNCIADO,--/2
               1,USR_SICOB.FUN_SCOB_ALFA_CAREXT(TRIM(PER.APE_PATERNO) || ' ' || TRIM(PER.APE_MATERNO) || ' ' || TRIM(PER.PRI_NOMBRE)) /*|| ' ' || TRIM(PER.SEG_NOMBRE)*/,
               2,USR_SICOB.FUN_SCOB_ALFA_CAREXT(PER.RAZON_SOCIAL))),1,40)))),40,'  ') NOM_DENUNCIADO,--/2
               /*7--3*/NVL(EXP.ANIO,'0000') || LPAD(SUBSTR(NVL(EXP.NRO_EXPEDIENTE,'0000000'),-7),7,0) || LPAD(nvl(ARECO.codigo,'000'),3,0) ||
               LPAD(SUBSTR(NVL(MUL.ANIO_FILE_AEC,'00'),-2),2,0) || LPAD((SUBSTR(NVL(MUL.NRO_FILE_AEC,'000000'),-6)),6,0) ||
               LPAD(SUBSTR(NVL(MUL.IND_DESCUENTO,'0'),-1),1,0) || '000000' || 'S' AS COD_UNICO_EXPEDIENTE,--/3
               /*8*/TO_CHAR(SYSDATE,'YYYYMMDD') AS FEC_SERVIDOR,
               /*9--4*/CASE
                 WHEN /*MUL.MONTO_INTERES_MORATORIO*/ mul.saldo_im <> 0 THEN TO_CHAR(SYSDATE - 1,'YYYYMMDD')
                 WHEN /*MUL.MONTO_INTERES_MORATORIO=0*/ mul.saldo_im=0 THEN TO_CHAR(SYSDATE,'YYYYMMDD') END
                 AS FEC_VEN_CUPOM, --/4
               --/*10*/LPAD(ROUND((((MUL.MONTO_UIT - MUL.TOTAL_AMORTIZADO) + (MUL.MONTO_INTERES - MUL.TOTAL_AMORTIZADO_IC)
               --+ (MUL.TOTAL_AMORTIZADO_COSTAS - MUL.TOTAL_AMORTIZADO_COSTAS))*100),0),15,0) AS MONTO_CUPON,--
               /*10*/LPAD(ROUND(((mul.saldo + mul.saldo_ic + mul.saldo_costas)*100),0),15,0) AS MONTO_CUPON,--
               /*11*/LPAD((ROUND((nvl(MUL.MONTO_INTERES_MORATORIO,0))*100,0)),15,0) AS MONTO_MORA,
               /*12*/RPAD(LPAD(EF.SALDO_MINIMO_ENVIO_BCO,7,0),9,0) AS MONTO_MINIMO,
               /*13*/RPAD('A',48,' ') AS REG_ACTUALIZACION
               ,'0' AS FLG_FRACC
               ,EXP.ESTADO_EXPEDIENTE AS ESTADO_EXPEDIENTE
        FROM T_SCOB_MULTA MUL
        INNER JOIN T_SCOB_MULTA_DETAL MULDE
             ON MUL.ID_MULTA = MULDE.ID_MULTA
             AND MULDE.FLG_ACTUAL = '1' AND MULDE.ESTADO='1'
        INNER  JOIN T_SCOB_MULTA_SANCIONADO MULSA
              ON MULSA.FLG_PRINCIPAL='1' --ACTUAL
              AND MULSA.ESTADO='1'
              AND MULDE.ID_MULTA_DETAL = MULSA.ID_MULTA_DETAL
        INNER JOIN T_SCOB_PERSONA PER
             ON MULSA.ID_PERSONA = PER.ID_PERSONA
             AND PER.COD_SANCIONADO IS NOT NULL
             AND PER.ESTADO = '1'
        LEFT JOIN T_SCOB_EXPEDIENTE_MULTA EXPMUL
             ON MUL.ID_MULTA = EXPMUL.ID_MULTA
             AND EXPMUL.ESTADO = '1'
        LEFT JOIN T_SCOB_EXPEDIENTE EXP
             ON EXPMUL.ID_EXPEDIENTE = EXP.ID_EXPEDIENTE
             AND EXP.ESTADO = '1'
             --AND EXP.ESTADO_EXPEDIENTE <> 4
        LEFT JOIN T_SCOB_USUARIO USU
             ON USU.ID_USUARIO = MUL.ID_USUARIO_ASIG_COBRANZA
        LEFT JOIN T_SCOB_AREA_COBRANZA ARECO
             ON ARECO.ID_AREA_COBRANZA = MUL.ID_AREA_COBRANZA --3-
        LEFT JOIN  T_SCOB_ENTIDAD_FINANCIERA EF
             ON EF.ID_ENTIDAD_FINANCIERA=1
        WHERE (MUL.SALDO+MUL.SALDO_IC+MUL.SALDO_COSTAS) > EF.SALDO_MINIMO_ENVIO_BCO
              AND MUL.ESTADO = '1';

--CARGAR CURSOR DETALLE
--------------------------------
UPDATE T_SCOB_TMP_BANCO_CREP3_D
SET FLG_FRACC ='1'
WHERE ESTADO_EXPEDIENTE = 4;


OPEN po_cu_retornoD FOR
SELECT * FROM T_SCOB_TMP_BANCO_CREP3_D
WHERE FLG_FRACC='0'
;

--CARGA CABECERA--PARA ARCHIVO PLANO
------------------
--OPEN    po_cu_retornoC FOR
OPEN po_cu_retornoC FOR
SELECT 'CC' TIP_REGISTRO,'193' COD_SUCURSAL,'0' COD_MONEDA,'1852417' COD_EMP_AFILIADA,'C' TIP_VALIDACION,
       RPAD('INDECOPI',40,'  ') NOM_EMP_AFILIADA,TO_CHAR(SYSDATE,'YYYYMMDD') FEC_SERVIDOR,
       LPAD(CANT_REGISTRO,9,0)NUM_REGISTROS,LPAD(SUMA_CUOTAS,15,0) SUM_CUOTAS
       ,RPAD('A',114,' ') TIP_ARCHIVO -- TIPO ARCHIVO + FILLER(113 CARACT BLANCO)
FROM   (
       SELECT COUNT(1) CANT_REGISTRO,SUM(MONTO_CUPON) SUMA_CUOTAS
       FROM
       (
        SELECT * FROM T_SCOB_TMP_BANCO_CREP3_D
        WHERE FLG_FRACC='0'
       )
       );

--DETALLE CREP4--PARA EL ARCHIVO EXCEL
-----------------
INSERT INTO T_SCOB_TMP_BANCO_CREP3_D_
        SELECT /*1*/'DD' TIP_REGISTRO,
               /*2*/'193' COD_SUCURSAL,
               /*3*/'0' COD_MONEDA,
               /*4*/'1852417' NUM_EMP_AFILIADA,
               /*5--1*/ /*'00' ||*/ MUL.ANIO || MUL.CUM AS COD_IDENTIFICACION_UNICO,--/1
               /*6--2*/(USR_SICOB.FUN_SCOB_ALFANUMERICO(UPPER(SUBSTR((DECODE(PER.TIPO_PERSONA,1,PER.APE_PATERNO || ' ' || PER.APE_MATERNO || ' ' ||
               PER.PRI_NOMBRE || ' ' || PER.SEG_NOMBRE,
               2,PER.RAZON_SOCIAL)),1,40))))NOM_DENUNCIADO,--/2
               /*7--3*/NVL(EXP.ANIO,'0000') || LPAD(SUBSTR(NVL(EXP.NRO_EXPEDIENTE,'0000000'),-7),7,0) || LPAD(nvl(ARECO.codigo,'000'),3,0) ||
               LPAD(SUBSTR(NVL(MUL.ANIO_FILE_AEC,'00'),-2),2,0) || LPAD((SUBSTR(NVL(MUL.NRO_FILE_AEC,'000000'),-6)),6,0) ||
               LPAD(SUBSTR(NVL(MUL.IND_DESCUENTO,'0'),-1),1,0) || '000000' || 'S' AS COD_UNICO_EXPEDIENTE,--/3
               /*\*7--3*\NVL(EXP.ANIO,'0000') || LPAD(SUBSTR(NVL(EXP.NRO_EXPEDIENTE,'0000000'),-7),7,0) || LPAD(nvl(ARECO.codigo,'000'),3,0) ||
               LPAD(SUBSTR(NVL(MUL.ANIO_FILE_AEC,'00'),-2),2,0) || LPAD((SUBSTR(NVL(MUL.NRO_FILE_AEC,'000000'),-6)),6,0) ||
               NVL(MUL.IND_DESCUENTO,'0') || '000000' || 'S' AS COD_UNICO_EXPEDIENTE,--/3*/
               /*8*/TO_CHAR(SYSDATE,'YYYYMMDD') AS FEC_SERVIDOR,
               /*9--4*/CASE
                 WHEN mul.saldo_im <> 0 THEN TO_CHAR(SYSDATE - 1,'YYYYMMDD')
                 WHEN mul.saldo_im=0 THEN TO_CHAR(SYSDATE,'YYYYMMDD') END
                 AS FEC_VEN_CUPOM, --/4
               /*10*/(mul.saldo + mul.saldo_ic + mul.saldo_costas) AS MONTO_CUPON,--
               /*11*/(MUL.MONTO_INTERES_MORATORIO)AS MONTO_MORA,--OBS:FALTA CALCULO DEL INTERES MORATORIO UN DIA ANTES DE LA FECHA DEL SERVIDOR
               /*12*/EF.SALDO_MINIMO_ENVIO_BCO AS MONTO_MINIMO,
               /*13*/RPAD('A',48,' ') AS REG_ACTUALIZACION, -- TIPO ARCHIVO + FILLER(47 CARACT BLANCO)
               SYSDATE AS FECHA
               ,'0' AS FLG_FRACC
               ,EXP.ESTADO_EXPEDIENTE AS ESTADO_EXPEDIENTE
        FROM T_SCOB_MULTA MUL
        INNER JOIN T_SCOB_MULTA_DETAL MULDE
             ON MUL.ID_MULTA = MULDE.ID_MULTA
             AND MULDE.FLG_ACTUAL = '1'
             AND MULDE.ESTADO='1'
        INNER  JOIN T_SCOB_MULTA_SANCIONADO MULSA
              ON MULSA.FLG_PRINCIPAL='1'
              AND MULSA.ESTADO='1'
              AND MULDE.ID_MULTA_DETAL = MULSA.ID_MULTA_DETAL
        INNER JOIN T_SCOB_PERSONA PER
             ON MULSA.ID_PERSONA = PER.ID_PERSONA
             AND PER.COD_SANCIONADO IS NOT NULL
             AND PER.ESTADO = '1'
        LEFT JOIN T_SCOB_EXPEDIENTE_MULTA EXPMUL
             ON MUL.ID_MULTA = EXPMUL.ID_MULTA
             AND EXPMUL.ESTADO = '1'
        LEFT JOIN T_SCOB_EXPEDIENTE EXP
             ON EXPMUL.ID_EXPEDIENTE = EXP.ID_EXPEDIENTE
             AND EXP.ESTADO = '1'
        LEFT JOIN T_SCOB_USUARIO USU
             ON USU.ID_USUARIO = MUL.ID_USUARIO_ASIG_COBRANZA
        LEFT JOIN T_SCOB_AREA_COBRANZA ARECO
             ON ARECO.ID_AREA_COBRANZA = MUL.ID_AREA_COBRANZA --3-
        LEFT JOIN  T_SCOB_ENTIDAD_FINANCIERA EF
             ON EF.ID_ENTIDAD_FINANCIERA=1
        WHERE (MUL.SALDO+MUL.SALDO_IC+MUL.SALDO_COSTAS) > EF.SALDO_MINIMO_ENVIO_BCO
              AND MUL.ESTADO = '1';

--CARGAR CURSOR DETALLE--PARA ARCHIVO EXCEL
UPDATE T_SCOB_TMP_BANCO_CREP3_D_
SET FLG_FRACC ='1'
WHERE ESTADO_EXPEDIENTE = 4
;
COMMIT;

OPEN po_cu_retornoD_ FOR
SELECT * FROM T_SCOB_TMP_BANCO_CREP3_D_
WHERE FLG_FRACC='0'
;

--CARGA CABECERA--PARA ARCHIVO EXCEL
------------------
--OPEN    po_cu_retornoC FOR
OPEN po_cu_retornoC_ FOR
SELECT 'CC' TIP_REGISTRO,'193' COD_SUCURSAL,'0' COD_MONEDA,'1852416' COD_EMP_AFILIADA,'C' TIP_VALIDACION,
       LPAD('INDECOPI',40,0) NOM_EMP_AFILIADA,TO_CHAR(SYSDATE,'YYYYMMDD') FEC_SERVIDOR,
       LPAD(CANT_REGISTRO,9,0)NUM_REGISTROS,LPAD(SUMA_CUOTAS,15,0) SUM_CUOTAS
       ,RPAD('A',114,' ') TIP_ARCHIVO -- TIPO ARCHIVO + FILLER(113 CARACT BLANCO)
FROM   (
       SELECT COUNT(1) CANT_REGISTRO,SUM(MONTO_CUPON) SUMA_CUOTAS
       FROM
       (
        SELECT * FROM T_SCOB_TMP_BANCO_CREP3_D_
        WHERE FLG_FRACC='0'
       )
       );
  commit;

  ----
 /* exception
  when others then
      po_n_retorno := -1;
      po_n_cod_error := sqlcode;
      select case when po_n_cod_error > 0 then po_n_cod_error * -1 else po_n_cod_error end
      into po_n_cod_error
      from dual;
      po_v_msj_error := substr(sqlerrm,1,250);
      --rollback;     */
end;

PROCEDURE SCOB_SP_S_TIP_ARCHIVO
/*
-----------------------------------------------------------
-- Autor        : JLPY
-- Creado       : 23.06.2011
-- Proposito    : Mostrar consulta del tipo de Archivo
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
 (
  po_cu_retorno                 out cu_rec_set
 )
  AS
  BEGIN
    OPEN po_cu_retorno FOR
    SELECT
     T.Cod_Interno ID,
     T.TXT_DESCRIPCION DESCRIPCION
    FROM T_SCOB_TABLA_DET T WHERE T.ID_TABLA=46;
  END;

  /*
  PROCEDURE SCOB_SP_S_MULTA_AC
  /*
  -----------------------------------------------------------
  -- AUTOR        : JLP
  -- CREADO       : 05.09.2011
  -- PROPOSITO    : LISTAR LAS MULTAS ENVIADAS A
                    ARCHIVO CENTRAL
  -----------------------------------------------------------
  */
  /*
  (
    PI_N_ID_MULTA                     IN T_SCOB_MULTA_ARCHIVO_CENTRAL.ID_MULTA%TYPE,
    PI_N_ID_MULTA_ARCHIVO_CENTRAL     IN T_SCOB_MULTA_ARCHIVO_CENTRAL.ID_MULTA_ARCHIVO_CENTRAL%TYPE,
    PI_C_CUM                          IN T_SCOB_MULTA.CUM%TYPE,
    PI_C_NUM_EXPEDIENTE               IN T_SCOB_EXPEDIENTE.NRO_EXPEDIENTE%TYPE,
    PI_C_NUM_FILE                     IN VARCHAR2,
    PI_C_NUM_ENVIO                    IN VARCHAR2,
    PI_C_UBICACION_FISICA             IN VARCHAR2,
    PO_CU_RETORNO                     OUT CU_REC_SET
  )
  AS
  BEGIN
    /*
      DROP TABLE T_SCOB_TEMP_CUM_UF;
      CREATE TABLE T_SCOB_TEMP_CUM_UF
      (ID_MULTA NUMBER,
       UBICACION_FISICA VARCHAR2(20),
       NUM_FILE VARCHAR2(40),
       NUM_ENVIO_AEC VARCHAR2(40));
    */
    /*
    EXECUTE IMMEDIATE 'TRUNCATE TABLE T_SCOB_TEMP_CUM_UF';
    INSERT INTO T_SCOB_TEMP_CUM_UF
    SELECT A.ID_MULTA,
    DECODE(NVL(B.ID_ARCHIVO_CENTRAL,0),0,'AEC','AC'),
    A.ANIO_FILE_AEC || A.ID_AREA_COBRANZA || A.NRO_FILE_AEC,
    C.ANIO || C.ID_AREA_COBRANZA || C.NRO_ORDEN
    FROM T_SCOB_MULTA A LEFT JOIN
    T_SCOB_MULTA_ARCHIVO_CENTRAL B ON A.ID_MULTA = B.ID_MULTA
    LEFT JOIN T_SCOB_ARCHIVO_CENTRAL C ON B.ID_ARCHIVO_CENTRAL = C.ID_ARCHIVO_CENTRAL;
    COMMIT;

    OPEN  PO_CU_RETORNO FOR
    SELECT
         MULT.ID_MULTA,
         MULT.ANIO AS ANIO,
         MULT.CUM AS CUM,
         DECODE(PERS.TIPO_PERSONA,2,NVL(PERS.RAZON_SOCIAL,''),
                NVL(PERS.PRI_NOMBRE,'') || ' ' || NVL(PERS.SEG_NOMBRE,'') || ' ' ||
                NVL(PERS.APE_PATERNO,'')  || ' ' || NVL(PERS.APE_MATERNO,'')  || ' ' ||
                NVL(PERS.APE_CASADA,'')
                )AS SANCIONADO,
         MULT.ESTADO_ENVIO_ARCHIVO,
         MULT.MONTO_TOTAL_DEUDA,
         MULT.SALDO_TOTAL_DEUDA,
         --
         MATE.DESCRIPCION DESC_MATERIA,
         --
         EXPE.NRO_EXPEDIENTE  ,
         --
         MULAC.ID_MULTA_ARCHIVO_CENTRAL  ,
         MULAC.ESTADO_ENVIO_ARCHIVO      ,
         MULAC.FEC_INGRESO               ,
         MULAC.FLG_DEVUELTO              ,
         MULAC.FEC_DEVUELTO              ,
         MULAC.NRO_FOLIOS                ,
         MULAC.COD_TIPO_ACCESIBILIDAD    ,
         MULAC.COD_TIPO_ENVIO            ,
         MULAC.FLG_CONCLUIDO             ,
         MULAC.FLG_FOLIADO               ,
         MULAC.FLG_ETIQUETADO            ,
         MULAC.FLG_RESOLUCION_COACTIVA   ,
         MULAC.TXT_OBSERVACION           ,
         MULAC.FLG_ACTUAL                ,
         MULAC.ESTADO                   ,
         --
         SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_TIPO_ACCESO_ARCHIVO, MULAC.COD_TIPO_ACCESIBILIDAD) AS NOM_TIPO_ACCESIBILIDAD,
         SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_TIPO_ENVIO_ARCHIVO, MULAC.COD_TIPO_ENVIO) AS NOM_TIPO_ENVIO,
         SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_TIPO_ENVIO_EXPED_ARCH, MULAC.ESTADO_ENVIO_ARCHIVO) AS NOM_ESTADO_MULTA_ARCHIVO,
         --
         ARCE.ID_ARCHIVO_CENTRAL            ,
         ARCE.ANIO                          ,
         ARCE.ID_AREA_COBRANZA              ,
         ARCE.NRO_ORDEN                     ,
         ARCE.NRO_REGISTRO_ARCHIVO_CENTRAL  ,
         ARCE.FEC_REGISTRO                  ,
         ARCE.FEC_ENVIO                     ,
         ARCE.ID_USUARIO_ENVIO              ,
         ARCE.ESTADO_ENVIO                  ,
         ARCE.ESTADO                        ,
         --
         DECODE (NVL(ARCE.ID_ARCHIVO_CENTRAL,0),0,'AEC','AC') AS UBICACION_FISICA,
         CUMUF.NUM_FILE AS NUM_FILE,
         CUMUF.NUM_ENVIO_AEC AS NRO_ENVIO_AEC
    FROM T_SCOB_MULTA MULT
         INNER JOIN T_SCOB_MULTA_ARCHIVO_CENTRAL MULAC
              ON  MULAC.ESTADO = '1'
              AND MULAC.FLG_ACTUAL = '1'
              AND MULT.ID_MULTA = MULAC.ID_MULTA
         LEFT JOIN  T_SCOB_ARCHIVO_CENTRAL ARCE
              ON  ARCE.ID_ARCHIVO_CENTRAL = MULAC.ID_ARCHIVO_CENTRAL
         INNER JOIN T_SCOB_MULTA_DETAL MDET
              ON  MDET.FLG_ACTUAL = '1'
              AND MDET.ESTADO = '1'
              AND MDET.ID_MULTA = MULT.ID_MULTA
         INNER JOIN T_SCOB_MULTA_SANCIONADO SANC
              ON  SANC.COD_TIPO_PERSONA = '1'
              AND SANC.NRO_SANCIONADO = 1
              AND SANC.ESTADO = '1'
              AND SANC.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL
         INNER JOIN T_SCOB_PERSONA PERS
              ON  PERS.ID_PERSONA = SANC.ID_PERSONA
         INNER JOIN T_SCOB_MATERIA MATE
              ON  MULT.ID_MATERIA = MATE.ID_MATERIA
         LEFT JOIN  T_SCOB_EXPEDIENTE_MULTA EXMU
              ON  EXMU.ESTADO = '1'
              AND EXMU.ID_MULTA = MULT.ID_MULTA
         LEFT JOIN  T_SCOB_EXPEDIENTE EXPE
              ON  EXPE.ESTADO = '1'
              AND EXPE.ID_EXPEDIENTE = EXMU.ID_EXPEDIENTE
         LEFT JOIN T_SCOB_TEMP_CUM_UF CUMUF
              ON  CUMUF.ID_MULTA = MULT.ID_MULTA
    WHERE
         (NVL(PI_N_ID_MULTA,0)=0 OR (NVL(PI_N_ID_MULTA,0)<>0 AND MULAC.ID_MULTA = PI_N_ID_MULTA)) AND
         (NVL(PI_N_ID_MULTA_ARCHIVO_CENTRAL,0)=0 OR (NVL(PI_N_ID_MULTA_ARCHIVO_CENTRAL,0)<>0 AND MULAC.ID_MULTA_ARCHIVO_CENTRAL = PI_N_ID_MULTA_ARCHIVO_CENTRAL)) AND
         (NVL(PI_C_CUM,' ')=' ' OR (NVL(PI_C_CUM,' ')<>' ' AND MULT.CUM = PI_C_CUM)) AND
         (NVL(PI_C_NUM_EXPEDIENTE,' ')=' ' OR (NVL(PI_C_NUM_EXPEDIENTE,' ')<>' ' AND EXPE.NRO_EXPEDIENTE = PI_C_NUM_EXPEDIENTE)) AND
         (NVL(PI_C_NUM_FILE,' ')=' ' OR (NVL(PI_C_NUM_FILE,' ')<>' ' AND CUMUF.NUM_FILE = PI_C_NUM_FILE)) AND
         (NVL(PI_C_NUM_ENVIO,' ')=' ' OR (NVL(PI_C_NUM_ENVIO,' ')<>' ' AND CUMUF.NUM_ENVIO_AEC = PI_C_NUM_ENVIO)) AND
         (NVL(PI_C_UBICACION_FISICA,' ')=' ' OR (NVL(PI_C_UBICACION_FISICA,' ')<>' ' AND CUMUF.UBICACION_FISICA LIKE '%PI_C_UBICACION_FISICA%'));

  END;


   PROCEDURE SCOB_SP_S_DETALLE_ENVIO
  /*
  -----------------------------------------------------------
  -- AUTOR        : JLP
  -- CREADO       : 05.09.2011
  -- PROPOSITO    : LISTAR EL DETALLE DE LOS ENVIOS DE UNA
                    MULTA A ARCHIVO CENTRAL
  -----------------------------------------------------------
  */
  /*
  (
  PI_N_ID_MULTA                     IN T_SCOB_MULTA_ARCHIVO_CENTRAL.ID_MULTA%TYPE,
  PO_CU_RETORNO                     OUT CU_REC_SET
  )
  AS
  BEGIN
     OPEN  PO_CU_RETORNO FOR
    SELECT
    ARCE.ANIO || ARCE.ID_AREA_COBRANZA || ARCE.NRO_ORDEN AS NUM_ENVIO_AEC,
    ARCE.FEC_ENVIO,
    ARCE.NRO_REGISTRO_ARCHIVO_CENTRAL,
    ARCE.FEC_REGISTRO,
    MUAC.FEC_DEVUELTO
    FROM T_SCOB_ARCHIVO_CENTRAL ARCE
         LEFT JOIN T_SCOB_MULTA_ARCHIVO_CENTRAL MUAC
               ON MUAC.ID_ARCHIVO_CENTRAL = ARCE.ID_ARCHIVO_CENTRAL
    WHERE MUAC.ID_MULTA = PI_N_ID_MULTA;
  END;

  PROCEDURE SCOB_SP_I_MULTA_AC
  /*
  -----------------------------------------------------------
  -- AUTOR        : JLP
  -- CREADO       : 05.09.2011
  -- PROPOSITO    : ACTUALIZA UNA MULTA CON CARACTERISTICAS
                    COMO POR ENVIAR
  -----------------------------------------------------------
  */
  /*
  (
  --PI_N_ID_MULTA_ARCHIVO_CENTRAL NUMBER,
  PI_N_ID_MULTA                 NUMBER,
  --PI_N_ID_ARCHIVO_CENTRAL       NUMBER,
  PI_N_ESTADO_ENVIO_ARCHIVO     INTEGER,
  PI_D_FEC_INGRESO              DATE,
  PI_C_FLG_DEVUELTO             CHAR,
  PI_D_FEC_DEVUELTO             DATE,
  PI_N_NRO_FOLIOS               INTEGER,
  PI_N_COD_TIPO_ACCESIBILIDAD   INTEGER,
  PI_N_COD_TIPO_ENVIO           INTEGER,
  PI_C_FLG_CONCLUIDO            CHAR,
  PI_C_FLG_FOLIADO              CHAR,
  PI_C_FLG_ETIQUETADO           CHAR,
  PI_C_FLG_RESOLUCION_COACTIVA  CHAR,
  PI_C_TXT_OBSERVACION          VARCHAR2,
  PI_C_FLG_ACTUAL               CHAR,
  PI_C_ESTADO                   CHAR,
  PI_D_AUDFECCREACION           DATE,
  PI_C_AUDUSUCREACION           VARCHAR2,
  PI_D_AUDFECMODIFICACION       DATE,
  PI_C_AUDUSUMODIFICACION       VARCHAR2,
  PO_N_RETORNO                     OUT NUMBER,
  PO_N_COD_ERROR                   OUT NUMBER,
  PO_V_MSJ_ERROR                   OUT VARCHAR2
  )
  AS
  BEGIN
   PO_V_MSJ_ERROR :='';
   PO_N_RETORNO := 0;
   PO_N_COD_ERROR := -1;

   INSERT INTO T_SCOB_MULTA_ARCHIVO_CENTRAL(
    ID_MULTA_ARCHIVO_CENTRAL ,
    ID_MULTA                  ,
    --ID_ARCHIVO_CENTRAL        ,
    ESTADO_ENVIO_ARCHIVO   ,
    FEC_INGRESO         ,
    FLG_DEVUELTO              ,
    FEC_DEVUELTO              ,
    NRO_FOLIOS                ,
    COD_TIPO_ACCESIBILIDAD    ,
    COD_TIPO_ENVIO            ,
    FLG_CONCLUIDO            ,
     FLG_FOLIADO              ,
    FLG_ETIQUETADO           ,
     FLG_RESOLUCION_COACTIVA  ,
     TXT_OBSERVACION          ,
     FLG_ACTUAL               ,
    ESTADO                   ,
    AUDFECCREACION           ,
    AUDUSUCREACION           ,
    AUDFECMODIFICACION       ,
    AUDUSUMODIFICACION
    )VALUES(
    SCOB_SQ_MULTA_ARCHIVO_CENTRAL.NEXTVAL,
    PI_N_ID_MULTA                 ,
    --PI_N_ID_ARCHIVO_CENTRAL       ,
    PI_N_ESTADO_ENVIO_ARCHIVO     ,
    PI_D_FEC_INGRESO              ,
    PI_C_FLG_DEVUELTO             ,
    PI_D_FEC_DEVUELTO             ,
    PI_N_NRO_FOLIOS               ,
    PI_N_COD_TIPO_ACCESIBILIDAD   ,
    PI_N_COD_TIPO_ENVIO           ,
    PI_C_FLG_CONCLUIDO            ,
    PI_C_FLG_FOLIADO              ,
    PI_C_FLG_ETIQUETADO           ,
    PI_C_FLG_RESOLUCION_COACTIVA  ,
    PI_C_TXT_OBSERVACION          ,
    PI_C_FLG_ACTUAL               ,
    PI_C_ESTADO                   ,
    PI_D_AUDFECCREACION           ,
    PI_C_AUDUSUCREACION           ,
    PI_D_AUDFECMODIFICACION       ,
    PI_C_AUDUSUMODIFICACION       );
    COMMIT;

      EXCEPTION
   WHEN OTHERS THEN
      PO_N_RETORNO := -1;
      PO_N_COD_ERROR := SQLCODE;
      SELECT CASE WHEN PO_N_COD_ERROR > 0 THEN PO_N_COD_ERROR * -1 ELSE PO_N_COD_ERROR END
      INTO PO_N_COD_ERROR
      FROM DUAL;
      PO_V_MSJ_ERROR := SUBSTR(SQLERRM,1,250);
      ROLLBACK;
  END;

    PROCEDURE SCOB_SP_I_ARCHIVO_CENTRAL
  /*
  -----------------------------------------------------------
  -- AUTOR        : JLP
  -- CREADO       : 05.09.2011
  -- PROPOSITO    : ACTUALIZA UNA MULTA CON CARACTERISTICAS
                    COMO POR ENVIAR A ENVIADO
  -----------------------------------------------------------
  */
  /*
  (
  PI_C_ANIO                         CHAR,
  PI_N_ID_AREA_COBRANZA            NUMBER,
  --PI_N_NRO_ORDEN                    CHAR,
  PI_N_NRO_REG_ARCHIVO_CENTRAL VARCHAR2,
  PI_N_FEC_REGISTRO                 DATE,
  PI_N_FEC_ENVIO                    DATE,
  PI_N_ID_USUARIO_ENVIO             NUMBER,
  PI_N_ESTADO_ENVIO                 INTEGER,
  PI_N_ESTADO                       CHAR,
  PI_N_AUDFECCREACION               DATE,
  PI_N_AUDFECMODIFICACION           DATE,
  PI_N_AUDUSUCREACION               VARCHAR2,
  PI_N_AUDUSUMODIFICACION           VARCHAR2,
  PO_N_RETORNO                     OUT NUMBER,
  PO_N_COD_ERROR                   OUT NUMBER,
  PO_V_MSJ_ERROR                   OUT VARCHAR2
  )
  AS
  V_NRO_ORDEN_C CHAR(4);
  V_NRO_ORDEN NUMBER;
  BEGIN
   PO_V_MSJ_ERROR :='';
   PO_N_RETORNO := 0;
   PO_N_COD_ERROR := -1;

   SELECT COUNT(1) INTO V_NRO_ORDEN
   FROM T_SCOB_ARCHIVO_CENTRAL T
   WHERE T.ANIO = PI_C_ANIO AND ID_AREA_COBRANZA = PI_N_ID_AREA_COBRANZA;
   V_NRO_ORDEN_C := TO_CHAR(V_NRO_ORDEN + 1);

   INSERT INTO T_SCOB_ARCHIVO_CENTRAL(
    ID_ARCHIVO_CENTRAL           ,
    ANIO                         ,
    ID_AREA_COBRANZA            ,
    NRO_ORDEN                    ,
    NRO_REGISTRO_ARCHIVO_CENTRAL ,
    FEC_REGISTRO                 ,
    FEC_ENVIO                    ,
    ID_USUARIO_ENVIO             ,
    ESTADO_ENVIO                 ,
    ESTADO                       ,
    AUDFECCREACION               ,
    AUDFECMODIFICACION           ,
    AUDUSUCREACION               ,
    AUDUSUMODIFICACION
    )VALUES(
    SCOB_SQ_ARCHIVO_CENTRAL.NEXTVAL,
    PI_C_ANIO                         ,
    PI_N_ID_AREA_COBRANZA          ,
    V_NRO_ORDEN_C                  ,
    PI_N_NRO_REG_ARCHIVO_CENTRAL ,
    PI_N_FEC_REGISTRO                 ,
    PI_N_FEC_ENVIO                    ,
    PI_N_ID_USUARIO_ENVIO             ,
    PI_N_ESTADO_ENVIO                 ,
    PI_N_ESTADO                       ,
    PI_N_AUDFECCREACION               ,
    PI_N_AUDFECMODIFICACION           ,
    PI_N_AUDUSUCREACION               ,
    PI_N_AUDUSUMODIFICACION           );
    COMMIT;
      EXCEPTION
   WHEN OTHERS THEN
      PO_N_RETORNO := -1;
      PO_N_COD_ERROR := SQLCODE;
      SELECT CASE WHEN PO_N_COD_ERROR > 0 THEN PO_N_COD_ERROR * -1 ELSE PO_N_COD_ERROR END
      INTO PO_N_COD_ERROR
      FROM DUAL;
      PO_V_MSJ_ERROR := SUBSTR(SQLERRM,1,250);
      ROLLBACK;
  END;

  PROCEDURE SCOB_SP_S_ARCHIVO_CENTRAL
  /*
  -----------------------------------------------------------
  -- AUTOR        : JLP
  -- CREADO       : 05.09.2011
  -- PROPOSITO    : LISTAR UN FILE DE ARCHIVO CENTRAL CON SUS
                    MULTAS ASOCIADAS Y NO ASOCIADAS
  -----------------------------------------------------------
  */
  /*
  (
    PO_CU_RETORNO1                     OUT CU_REC_SET,
    PO_CU_RETORNO                     OUT CU_REC_SET
  )
  AS
  BEGIN
         OPEN  PO_CU_RETORNO FOR
    SELECT  '' AS NUM_ENVIO_AEC,
    SYSDATE AS FEC_ENVIO,
    '' AS NRO_REGISTRO_ARCHIVO_CENTRAL,
    SYSDATE AS FEC_REGISTRO,
    COUNT(1) AS ASOCIADOS
    FROM T_SCOB_MULTA_ARCHIVO_CENTRAL MULAC
    WHERE MULAC.ESTADO_ENVIO_ARCHIVO = 1   AND
    MULAC.ESTADO = '1'
    UNION
SELECT
    ARCE.ANIO || ARCE.ID_AREA_COBRANZA || ARCE.NRO_ORDEN AS NUM_ENVIO_AEC,
    ARCE.FEC_ENVIO AS FEC_ENVIO,
    ARCE.NRO_REGISTRO_ARCHIVO_CENTRAL AS NRO_REGISTRO_ARCHIVO_CENTRAL,
    ARCE.FEC_REGISTRO AS FEC_REGISTRO,
    TEMPO.ASOCIADOS AS ASOCIADOS
    FROM T_SCOB_ARCHIVO_CENTRAL ARCE
    LEFT JOIN
    (SELECT A.ID_ARCHIVO_CENTRAL,COUNT(1) ASOCIADOS
    FROM T_SCOB_MULTA_ARCHIVO_CENTRAL A GROUP BY A.ID_ARCHIVO_CENTRAL
    )TEMPO
    ON ARCE.ID_ARCHIVO_CENTRAL = TEMPO.ID_ARCHIVO_CENTRAL;

      OPEN  PO_CU_RETORNO1 FOR
    SELECT  MULAC.ID_MULTA
    FROM T_SCOB_MULTA_ARCHIVO_CENTRAL MULAC
    WHERE MULAC.ESTADO_ENVIO_ARCHIVO = 1 AND
    MULAC.ESTADO = '1';
  END;

   PROCEDURE SCOB_SP_U_ARCHIVO_CENTRAL
  /*
  -----------------------------------------------------------
  -- AUTOR        : JLP
  -- CREADO       : 05.09.2011
  -- PROPOSITO    : ACTUALIZA UNA MULTA CON CARACTERISTICAS
                    COMO POR ENVIAR A ENVIADO
  -----------------------------------------------------------
  */
  /*
  (
  PI_N_ID_ARCHIVO_CENTRAL NUMBER,
  PI_N_NRO_REG_ARCHIVO_CENTRAL VARCHAR2,
  PI_N_FEC_REGISTRO                 DATE,
  PI_N_AUDFECMODIFICACION           DATE,
  PI_N_AUDUSUMODIFICACION           VARCHAR2,
  PO_CU_RETORNO                     OUT CU_REC_SET,
  PO_N_RETORNO                     OUT NUMBER,
  PO_N_COD_ERROR                   OUT NUMBER,
  PO_V_MSJ_ERROR                   OUT VARCHAR2
  )
  AS
  V_NRO_ORDEN_C CHAR(4);
  V_NRO_ORDEN NUMBER;
  BEGIN
   PO_V_MSJ_ERROR :='';
   PO_N_RETORNO := 0;
   PO_N_COD_ERROR := -1;

        OPEN  PO_CU_RETORNO FOR
   SELECT ID_MULTA
   FROM T_SCOB_MULTA_ARCHIVO_CENTRAL A
   INNER JOIN T_SCOB_ARCHIVO_CENTRAL B
   ON A.ID_ARCHIVO_CENTRAL = B.ID_ARCHIVO_CENTRAL
   WHERE B.ID_ARCHIVO_CENTRAL = PI_N_ID_ARCHIVO_CENTRAL;


   UPDATE T_SCOB_ARCHIVO_CENTRAL SET
    NRO_REGISTRO_ARCHIVO_CENTRAL = PI_N_NRO_REG_ARCHIVO_CENTRAL,
    FEC_REGISTRO                 = PI_N_FEC_REGISTRO,
    AUDFECMODIFICACION           = PI_N_AUDFECMODIFICACION,
    AUDUSUMODIFICACION           = PI_N_AUDUSUMODIFICACION;



      EXCEPTION
   WHEN OTHERS THEN
      PO_N_RETORNO := -1;
      PO_N_COD_ERROR := SQLCODE;
      SELECT CASE WHEN PO_N_COD_ERROR > 0 THEN PO_N_COD_ERROR * -1 ELSE PO_N_COD_ERROR END
      INTO PO_N_COD_ERROR
      FROM DUAL;
      PO_V_MSJ_ERROR := SUBSTR(SQLERRM,1,250);
      ROLLBACK;
  END;

  PROCEDURE SCOB_SP_G_REG_ENTREGA_DOC
  /*
  -----------------------------------------------------------
  -- AUTOR        : JLP
  -- CREADO       : 05.09.2011
  -- PROPOSITO    : LISTAR LAS MULTAS ENVIADAS A
                    ARCHIVO CENTRAL
  -----------------------------------------------------------
  */
  /*
  (
    PI_N_ID_ARCHIVO_CENTRAL     IN T_SCOB_MULTA_ARCHIVO_CENTRAL.ID_MULTA_ARCHIVO_CENTRAL%TYPE,
    PO_CU_RETORNO               OUT CU_REC_SET
  )
  AS
  BEGIN
         OPEN  PO_CU_RETORNO FOR
    SELECT
    ARCE.ID_AREA_COBRANZA,
    ARCE.NRO_REGISTRO_ARCHIVO_CENTRAL,
    ARCE.FEC_ENVIO,
    ARCE.FEC_REGISTRO,
    ARCE.ANIO,
    MULAC.NRO_FOLIOS,
    MULT.ANIO_FILE_AEC || MULT.ID_AREA_COBRANZA || MULT.NRO_FILE_AEC AS NUM_FILE,
    DECODE(PERS.TIPO_PERSONA,2,NVL(PERS.RAZON_SOCIAL,''),
                NVL(PERS.PRI_NOMBRE,'') || ' ' || NVL(PERS.SEG_NOMBRE,'') || ' ' ||
                NVL(PERS.APE_PATERNO,'')  || ' ' || NVL(PERS.APE_MATERNO,'')  || ' ' ||
                NVL(PERS.APE_CASADA,'')
                )AS SANCIONADO,
    MULT.ESTADO_MULTA
    FROM T_SCOB_ARCHIVO_CENTRAL ARCE
    INNER JOIN T_SCOB_MULTA_ARCHIVO_CENTRAL MULAC
    ON ARCE.ID_ARCHIVO_CENTRAL = MULAC.ID_MULTA_ARCHIVO_CENTRAL
    INNER JOIN T_SCOB_MULTA MULT
    ON MULAC.ID_MULTA = MULT.ID_MULTA
    INNER JOIN T_SCOB_MULTA_DETAL MDET
          ON  MDET.FLG_ACTUAL = '1'
          AND MDET.ESTADO = '1'
          AND MDET.ID_MULTA = MULT.ID_MULTA
    INNER JOIN T_SCOB_MULTA_SANCIONADO SANC
          ON  SANC.COD_TIPO_PERSONA = '1'
          AND SANC.NRO_SANCIONADO = 1
          AND SANC.ESTADO = '1'
          AND SANC.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL
    INNER JOIN T_SCOB_PERSONA PERS
          ON  PERS.ID_PERSONA = SANC.ID_PERSONA
    WHERE ARCE.ID_ARCHIVO_CENTRAL = PI_N_ID_ARCHIVO_CENTRAL;


  END;
 */

procedure SCOB_SP_S_MARCAR_MULTA
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 20.09.2011
-- Proposito    : Consultar las multas para registrar la marca a archivo central.
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_V_NRO_FILE_AEC         IN T_SCOB_MULTA.NRO_FILE_AEC%TYPE,
  PI_N_ID_AREA_COBRANZA     IN T_SCOB_MULTA.ID_AREA_COBRANZA%TYPE,
  PI_V_ANIO_FILE_AEC        IN T_SCOB_MULTA.ANIO_FILE_AEC%TYPE,

  PI_V_NRO_CUM              IN VARCHAR2,
  PI_V_NRO_EXPEDIENTE       IN VARCHAR2,
  PI_V_NRO_ENVIO            IN VARCHAR2,
  PI_I_COD_ESTADO_ENVIO     IN INTEGER,
  PI_I_COD_UBICACION        IN INTEGER, --ENVIAR 1=AEC, 2=ARCHIVO CENTRAL
  po_cu_retorno             out cu_rec_set
)
as
begin

  open po_cu_retorno for
  SELECT
    MULT.ID_MULTA AS ID_MULTA,
    EXPE.ID_EXPEDIENTE AS ID_EXPEDIENTE,
    MULTA_ARCH.ID_MULTA_ARCHIVO_CENTRAL AS ID_MULTA_ARCHIVO_CENTRAL,
    MULT.ANIO_FILE_AEC || AREA_COB_MULTA.CODIGO ||MULT.NRO_FILE_AEC AS NRO_FILE,
    MULT.ANIO || MULT.CUM AS NRO_CUM,
    EXPE.ANIO || EXPE.NRO_EXPEDIENTE AS NRO_EXPEDIENTE,
    SCOB_PK_EXPEDIENTE.SCOB_FN_SANCIONADOS_MULTA(MULT.ID_MULTA,0) AS NOM_SANCIONADO,
    MATE.DESCRIPCION AS NOM_MATERIA,
    DECODE(MULT.ESTADO_ENVIO_ARCHIVO, 2, 'ARCHIVO CENTRAL', 'AEC') AS UBICACION,
    MULT.ESTADO_ENVIO_ARCHIVO AS COD_ESTADO_ENVIO_ARCHIVO,
    SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(55,MULT.ESTADO_ENVIO_ARCHIVO) AS NOM_COD_ESTADO_ENVIO_ARCHIVO,
    ARCH.ANIO || AREA_COB_ARCHIVO.CODIGO || ARCH.NRO_ORDEN AS NRO_ENVIO_ARCHIVO,
    ARCH.NRO_REGISTRO_ARCHIVO_CENTRAL AS NRO_REGISTRO_ARCHIVO_CENTRAL,
    ARCH.FEC_REGISTRO AS FEC_REGISTRO_ARCHIVO_CENTRAL  ,
    MULT.MONTO_TOTAL_DEUDA AS MONTO_TOTAL_DEUDA,
    MULT.TOTAL_AMORTIZACION_DEUDA AS TOTAL_AMORTIZACION_DEUDA,
    MULT.SALDO_TOTAL_DEUDA AS SALDO_TOTAL_DEUDA,
    EST_EXPED.DESCRIPCION AS NOM_ESTADO_EXPEDIENTE
  FROM T_SCOB_MULTA MULT

  INNER JOIN T_SCOB_MATERIA MATE
        ON MATE.ID_MATERIA = MULT.ID_MATERIA

  INNER JOIN T_SCOB_MULTA_COBRANZA MCOB
        ON MCOB.ID_MULTA = MULT.ID_MULTA
        AND MCOB.FLG_ACTUAL = '1'
        AND MCOB.ESTADO = '1'

  LEFT JOIN T_SCOB_AREA_COBRANZA AREA_COB_MULTA
       ON AREA_COB_MULTA.ID_AREA_COBRANZA = MULT.ID_AREA_COBRANZA

  LEFT JOIN T_SCOB_EXPEDIENTE_MULTA EXMU
       ON EXMU.ID_MULTA = MULT.ID_MULTA
       AND EXMU.ESTADO = '1'

  LEFT JOIN T_SCOB_EXPEDIENTE EXPE
       ON EXPE.ID_EXPEDIENTE = EXMU.ID_EXPEDIENTE
       AND EXPE.ESTADO = '1'
  LEFT JOIN T_SCOB_EST_EXP_COB EST_EXPED
       ON EST_EXPED.ID_EST_EXP_COB = EXPE.ESTADO_EXPEDIENTE

  LEFT JOIN T_SCOB_MULTA_ARCHIVO_CENTRAL MULTA_ARCH
       ON MULTA_ARCH.ID_MULTA = MULT.ID_MULTA
       AND MULTA_ARCH.ESTADO = '1'
       AND MULTA_ARCH.FLG_ACTUAL = '1'

  LEFT JOIN T_SCOB_ARCHIVO_CENTRAL ARCH
       ON ARCH.ID_ARCHIVO_CENTRAL = MULTA_ARCH.ID_ARCHIVO_CENTRAL

  LEFT JOIN T_SCOB_AREA_COBRANZA AREA_COB_ARCHIVO
       ON AREA_COB_ARCHIVO.ID_AREA_COBRANZA = MULT.ID_AREA_COBRANZA

  WHERE
    MULT.ESTADO = '1'

    AND (NVL(PI_V_NRO_CUM,' ')=' ' OR (NVL(PI_V_NRO_CUM,' ')<>' ' AND MULT.ANIO || MULT.CUM = PI_V_NRO_CUM))
    AND (NVL(PI_V_NRO_EXPEDIENTE,' ')=' ' OR (NVL(PI_V_NRO_EXPEDIENTE,' ')<>' ' AND EXPE.ANIO || EXPE.NRO_EXPEDIENTE = PI_V_NRO_EXPEDIENTE))
    AND (NVL(PI_V_NRO_ENVIO,' ')=' ' OR (NVL(PI_V_NRO_ENVIO,' ')<>' ' AND ARCH.ANIO || AREA_COB_ARCHIVO.CODIGO || ARCH.NRO_ORDEN = PI_V_NRO_ENVIO))
    AND (NVL(PI_I_COD_ESTADO_ENVIO,-1)=-1 OR (NVL(PI_I_COD_ESTADO_ENVIO,-1)<>-1 AND MULT.ESTADO_ENVIO_ARCHIVO = PI_I_COD_ESTADO_ENVIO))
    AND (NVL(PI_I_COD_UBICACION,0)=0 OR (
                                  (NVL(PI_I_COD_UBICACION,0)=1 AND MULT.ESTADO_ENVIO_ARCHIVO IN (0,1)) OR
                                  (NVL(PI_I_COD_UBICACION,0)=2 AND MULT.ESTADO_ENVIO_ARCHIVO IN (2))
                                ))

    AND (NVL(PI_V_ANIO_FILE_AEC,0)=0 OR (
         NVL(PI_V_ANIO_FILE_AEC,0)<>0 AND MULT.ANIO_FILE_AEC = PI_V_ANIO_FILE_AEC))

    AND (NVL(PI_N_ID_AREA_COBRANZA,0)=0 OR (
         NVL(PI_N_ID_AREA_COBRANZA,0)<>0 AND MULT.ID_AREA_COBRANZA = PI_N_ID_AREA_COBRANZA))

    AND (NVL(PI_V_NRO_FILE_AEC,' ')=' ' OR (
         NVL(PI_V_NRO_FILE_AEC,' ')<>' ' AND
         SUBSTR(MULT.NRO_FILE_AEC,5,10) = PI_V_NRO_FILE_AEC))

  ORDER BY MCOB.ID_MULTA_COBRANZA;
end;

procedure SCOB_SP_S_EDITAR_MARCAR_MULTA
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 20.09.2011
-- Proposito    : Editar  los datos de la multa para marcar y enviar a archivo central.
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA                     IN T_SCOB_MULTA.ID_MULTA%TYPE,
  po_cu_retorno_datos               out cu_rec_set,
  po_cu_retorno_envios              out cu_rec_set
)
as
begin

  open po_cu_retorno_datos for
  SELECT
    --datos de la cabecera
    MULT.ID_MULTA AS ID_MULTA,
    EXPE.ID_EXPEDIENTE AS ID_EXPEDIENTE,
    MULTA_ARCH.ID_MULTA_ARCHIVO_CENTRAL AS ID_MULTA_ARCHIVO_CENTRAL,
    MULT.ANIO_FILE_AEC || AREA_COB_MULTA.CODIGO ||MULT.NRO_FILE_AEC AS NRO_FILE,
    MULT.ANIO || MULT.CUM AS NRO_CUM,
    EXPE.ANIO || EXPE.NRO_EXPEDIENTE AS NRO_EXPEDIENTE,
    DECODE(MULT.ESTADO_ENVIO_ARCHIVO, 2, 'ARCHIVO CENTRAL', 'AEC') AS UBICACION,
    SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(55,MULT.ESTADO_ENVIO_ARCHIVO) AS NOM_COD_ESTADO_ENVIO_ARCHIVO,
    --datos de la marca
    MULTA_ARCH.COD_TIPO_ACCESIBILIDAD AS ID_TIPO_ACCESIBILIDAD,
    MULTA_ARCH.COD_TIPO_ENVIO AS COD_TIPO_ENVIO,
    MULTA_ARCH.NRO_FOLIOS AS NRO_FOLIOS,
    NVL(EXPE.FLG_CANCELADO,'0') AS FLG_CONCLUIDO,
    MULTA_ARCH.FLG_FOLIADO AS FLG_FOLIADO,
    MULTA_ARCH.FLG_ETIQUETADO AS FLG_ETIQUETADO,
    MULTA_ARCH.FLG_RESOLUCION_COACTIVA AS FLG_RESOLUCION_COACTIVA,
    MULTA_ARCH.FEC_DEVUELTO  AS FEC_RECEPCION_DEVOLUCION

  FROM T_SCOB_MULTA MULT

  LEFT JOIN T_SCOB_AREA_COBRANZA AREA_COB_MULTA
       ON AREA_COB_MULTA.ID_AREA_COBRANZA = MULT.ID_AREA_COBRANZA

  LEFT JOIN T_SCOB_EXPEDIENTE_MULTA EXMU
       ON EXMU.ID_MULTA = MULT.ID_MULTA
       AND EXMU.ESTADO = '1'

  LEFT JOIN T_SCOB_EXPEDIENTE EXPE
       ON EXPE.ID_EXPEDIENTE = EXMU.ID_EXPEDIENTE
       AND EXPE.ESTADO = '1'

  LEFT JOIN T_SCOB_MULTA_ARCHIVO_CENTRAL MULTA_ARCH
       ON MULTA_ARCH.ID_MULTA = MULT.ID_MULTA
       AND MULTA_ARCH.ESTADO = '1'
       AND MULTA_ARCH.FLG_ACTUAL = '1'

  WHERE MULT.ID_MULTA = PI_N_ID_MULTA;


  open po_cu_retorno_envios for
  SELECT
       ARCH_CENT.ANIO || AREA_COBR_ARCHIVO.CODIGO || ARCH_CENT.NRO_ORDEN AS NRO_ENVIO_ARCHIVO,
       ARCH_CENT.FEC_ENVIO AS FEC_ENVIO,
       ARCH_CENT.NRO_REGISTRO_ARCHIVO_CENTRAL AS NRO_REGISTRO_ARCHIVO_CENTRAL,
       ARCH_CENT.FEC_REGISTRO AS FEC_REGISTRO_ARCHIVO_CENTRAL,
       MULT_ARCH.FEC_DEVUELTO AS FEC_RECEPCION_DEVOLUCION

  FROM T_SCOB_MULTA_ARCHIVO_CENTRAL MULT_ARCH
  INNER JOIN T_SCOB_ARCHIVO_CENTRAL ARCH_CENT
        ON ARCH_CENT.ESTADO = '1'
        AND ARCH_CENT.ID_ARCHIVO_CENTRAL = MULT_ARCH.ID_ARCHIVO_CENTRAL
  INNER JOIN T_SCOB_AREA_COBRANZA AREA_COBR_ARCHIVO
        ON AREA_COBR_ARCHIVO.ID_AREA_COBRANZA = ARCH_CENT.ID_AREA_COBRANZA
  WHERE MULT_ARCH.ESTADO = '1'
  AND MULT_ARCH.ID_MULTA = PI_N_ID_MULTA
  ORDER BY ARCH_CENT.ID_ARCHIVO_CENTRAL DESC ;

end;

procedure SCOB_SP_U_MARCAR_MULTA
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 20.09.2011
-- Proposito    : Actualizar o Insertar los datos de la marca para envio a archivo central.
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA_ARCHIVO_CENTRAL         IN T_SCOB_MULTA_ARCHIVO_CENTRAL.ID_MULTA_ARCHIVO_CENTRAL%TYPE,
  PI_N_ID_MULTA                         IN T_SCOB_MULTA.ID_MULTA%TYPE,
  PI_C_FLG_DEVUELTO                     IN T_SCOB_MULTA_ARCHIVO_CENTRAL.FLG_DEVUELTO%TYPE,
  PI_V_FEC_DEVUELTO                     IN VARCHAR2,
  PI_I_NRO_FOLIOS                       IN T_SCOB_MULTA_ARCHIVO_CENTRAL.NRO_FOLIOS%TYPE,
  PI_I_COD_TIPO_ACCESIBILIDAD           IN T_SCOB_MULTA_ARCHIVO_CENTRAL.COD_TIPO_ACCESIBILIDAD%TYPE,
  PI_I_COD_TIPO_ENVIO                   IN T_SCOB_MULTA_ARCHIVO_CENTRAL.COD_TIPO_ENVIO%TYPE,
  PI_C_FLG_CONCLUIDO                    IN T_SCOB_MULTA_ARCHIVO_CENTRAL.FLG_CONCLUIDO%TYPE,
  PI_C_FLG_FOLIADO                      IN T_SCOB_MULTA_ARCHIVO_CENTRAL.FLG_FOLIADO%TYPE,
  PI_C_FLG_ETIQUETADO                   IN T_SCOB_MULTA_ARCHIVO_CENTRAL.FLG_ETIQUETADO%TYPE,
  PI_C_FLG_RESOLUCION_COACTIVA          IN T_SCOB_MULTA_ARCHIVO_CENTRAL.FLG_RESOLUCION_COACTIVA%TYPE,
  PI_V_AUDUSUCREACION                   IN T_SCOB_MULTA_ARCHIVO_CENTRAL.AUDUSUCREACION%TYPE,
  po_n_retorno                          out number,
  po_n_cod_error                        out number,
  po_v_msj_error                        out varchar2
)
is
begin
  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  IF PI_N_ID_MULTA_ARCHIVO_CENTRAL <> 0 THEN
     --ACTUALIZA
     UPDATE T_SCOB_MULTA_ARCHIVO_CENTRAL MULT_ARCH
     SET
        NRO_FOLIOS = PI_I_NRO_FOLIOS,
        COD_TIPO_ACCESIBILIDAD = PI_I_COD_TIPO_ACCESIBILIDAD,
        FEC_INGRESO = DECODE(FEC_INGRESO,NULL,SYSDATE,FEC_INGRESO),
        COD_TIPO_ENVIO = PI_I_COD_TIPO_ENVIO,
        FLG_CONCLUIDO = PI_C_FLG_CONCLUIDO,
        FLG_FOLIADO = PI_C_FLG_FOLIADO,
        FLG_ETIQUETADO = PI_C_FLG_ETIQUETADO,
        FLG_RESOLUCION_COACTIVA = PI_C_FLG_RESOLUCION_COACTIVA,
        FLG_DEVUELTO = PI_C_FLG_DEVUELTO,
        FEC_DEVUELTO = DECODE(PI_C_FLG_DEVUELTO,'0',NULL,TO_DATE(PI_V_FEC_DEVUELTO,'DD/MM/YYYY')),
        AUDFECMODIFICACION = SYSDATE,
        AUDUSUMODIFICACION = PI_V_AUDUSUCREACION,
        ESTADO_ENVIO_ARCHIVO = SCOB_PK_CONSTANTES.C_EST_ARCH_CENTRAL_POR_ENVIAR
    WHERE MULT_ARCH.ID_MULTA_ARCHIVO_CENTRAL = PI_N_ID_MULTA_ARCHIVO_CENTRAL;

    --actualizar el estado de envio a la multa.
    UPDATE T_SCOB_MULTA MULT
    SET
       MULT.ESTADO_ENVIO_ARCHIVO = SCOB_PK_CONSTANTES.C_EST_ARCH_CENTRAL_POR_ENVIAR
    WHERE MULT.ID_MULTA = PI_N_ID_MULTA;

    IF PI_C_FLG_DEVUELTO = '1' THEN
        --inserta un nuevo movimiento

        --actualizar el flag actual
        UPDATE T_SCOB_MULTA_ARCHIVO_CENTRAL MULT_ARCH
        SET
           MULT_ARCH.FLG_ACTUAL = '0'
        WHERE MULT_ARCH.ID_MULTA = PI_N_ID_MULTA
        AND MULT_ARCH.FLG_ACTUAL = '1'
        AND MULT_ARCH.ESTADO = '1';

        --insertar el registro
        INSERT INTO T_SCOB_MULTA_ARCHIVO_CENTRAL(
            ID_MULTA_ARCHIVO_CENTRAL,
            ID_MULTA,
            ESTADO_ENVIO_ARCHIVO,
            FEC_INGRESO,
            FLG_DEVUELTO,
            FEC_DEVUELTO,
            NRO_FOLIOS,
            COD_TIPO_ACCESIBILIDAD,
            COD_TIPO_ENVIO,
            FLG_CONCLUIDO,
            FLG_FOLIADO,
            FLG_ETIQUETADO,
            FLG_RESOLUCION_COACTIVA,
            FLG_ACTUAL,
            ESTADO,
            AUDFECCREACION,
            AUDUSUCREACION
        )
        VALUES(
            SCOB_SQ_MULTA_ARCHIVO_CENTRAL.NEXTVAL,
            PI_N_ID_MULTA,
            SCOB_PK_CONSTANTES.C_EST_ARCH_CENTRAL_NO_ENVIADO, --ESTADO_ENVIO_ARCHIVO
            NULL, --FEC_INGRESO
            '0', --FLG_DEVUELTO
            NULL, --FEC_DEVUELTO
            NULL, --NRO_FOLIOS,
            NULL, --COD_TIPO_ACCESIBILIDAD,
            NULL, --COD_TIPO_ENVIO,
            NULL, --FLG_CONCLUIDO,
            NULL, --FLG_FOLIADO,
            NULL, --FLG_ETIQUETADO,
            NULL, --FLG_RESOLUCION_COACTIVA,
            '1', --FLG_ACTUAL
            SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO, --ESTADO
            SYSDATE,
            PI_V_AUDUSUCREACION
        );


        --actualizar el estado de envio a la multa.
        UPDATE T_SCOB_MULTA MULT
        SET
            MULT.ESTADO_ENVIO_ARCHIVO = SCOB_PK_CONSTANTES.C_EST_ARCH_CENTRAL_NO_ENVIADO
        WHERE MULT.ID_MULTA = PI_N_ID_MULTA;

    END IF;

  ELSE
    --INSERTA

    --actualizar el flag actual
    UPDATE T_SCOB_MULTA_ARCHIVO_CENTRAL MULT_ARCH
    SET
       MULT_ARCH.FLG_ACTUAL = '0'
    WHERE MULT_ARCH.ID_MULTA = PI_N_ID_MULTA
    AND MULT_ARCH.FLG_ACTUAL = '1'
    AND MULT_ARCH.ESTADO = '1';

    --insertar el registro
    INSERT INTO T_SCOB_MULTA_ARCHIVO_CENTRAL(
        ID_MULTA_ARCHIVO_CENTRAL,
        ID_MULTA,
        ESTADO_ENVIO_ARCHIVO,
        FEC_INGRESO,
        FLG_DEVUELTO,
        FEC_DEVUELTO,
        NRO_FOLIOS,
        COD_TIPO_ACCESIBILIDAD,
        COD_TIPO_ENVIO,
        FLG_CONCLUIDO,
        FLG_FOLIADO,
        FLG_ETIQUETADO,
        FLG_RESOLUCION_COACTIVA,
        FLG_ACTUAL,
        ESTADO,
        AUDFECCREACION,
        AUDUSUCREACION
    )
    VALUES(
        SCOB_SQ_MULTA_ARCHIVO_CENTRAL.NEXTVAL,
        PI_N_ID_MULTA,
        SCOB_PK_CONSTANTES.C_EST_ARCH_CENTRAL_POR_ENVIAR, --ESTADO_ENVIO_ARCHIVO
        SYSDATE, --FEC_INGRESO
        '0', --FLG_DEVUELTO
        NULL, --FEC_DEVUELTO
        PI_I_NRO_FOLIOS,
        PI_I_COD_TIPO_ACCESIBILIDAD,
        PI_I_COD_TIPO_ENVIO,
        PI_C_FLG_CONCLUIDO,
        PI_C_FLG_FOLIADO,
        PI_C_FLG_ETIQUETADO,
        PI_C_FLG_RESOLUCION_COACTIVA,
        '1', --FLG_ACTUAL
        SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO, --ESTADO
        SYSDATE,
        PI_V_AUDUSUCREACION
    );

    --actualizar el estado de envio a la multa.
    UPDATE T_SCOB_MULTA MULT
    SET
       MULT.ESTADO_ENVIO_ARCHIVO = SCOB_PK_CONSTANTES.C_EST_ARCH_CENTRAL_POR_ENVIAR
    WHERE MULT.ID_MULTA = PI_N_ID_MULTA;

  END IF;
  
  --INICIO VICTOR BENDEZU - MIGRACION SICOB A SIA
  USR_SIA_INTFZ.PKG_INTFZ_REG_MULTA_SICOB_SIA.SP_U_MARCAR_MULTA_SICOB_A_SIA(PIN_NU_ID_MULTA => PI_N_ID_MULTA,
                                                                            POUT_NU_COD_RESULT => PO_N_RETORNO,
                                                                            POUT_VC_MSG_RESULT => PO_V_MSJ_ERROR);
  
  IF PO_N_RETORNO < 0 THEN
     ROLLBACK;
     RETURN;
  END IF;
  --FIN VICTOR BENDEZU - MIGRACION SICOB A SIA
        
  po_n_cod_error := 0;
  po_n_retorno := PI_N_ID_MULTA;
  commit;
  ----
  exception
  when others then
      po_n_retorno := -1;
      po_n_cod_error := sqlcode;
      select case when po_n_cod_error > 0 then po_n_cod_error * -1 else po_n_cod_error end
      into po_n_cod_error
      from dual;
      po_v_msj_error := substr(sqlerrm,1,250);
      rollback;
end;

procedure SCOB_SP_S_ARCHIVO_CENTRAL
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 21.09.2011
-- Proposito    : Consulta los envios realizados y el pendiente de envio.
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_V_NRO_ENVIO              IN VARCHAR2,
  PI_V_FEC_ENVIO_INI          IN VARCHAR2,
  PI_V_FEC_ENVIO_FIN          IN VARCHAR2,
  po_cu_retorno               out cu_rec_set
)
as
begin

  open po_cu_retorno for

  SELECT
      NULL AS ID_ARCHIVO_CENTRAL,
      NULL AS NRO_ENVIO,
      NULL AS FEC_ENVIO,
      NULL AS NRO_REGISTRO_ARCHIVO_CENTRAL,
      NULL AS FEC_REGISTRO_ARCHIVO_CENTRAL,
      COUNT(MULT.ID_MULTA) AS NRO_REGISTROS
  FROM T_SCOB_MULTA MULT
  INNER JOIN T_SCOB_MULTA_COBRANZA MCOB
        ON MCOB.ID_MULTA = MULT.ID_MULTA
        AND MCOB.FLG_ACTUAL = '1'
        AND MCOB.ESTADO = '1'
  WHERE NVL(MULT.ESTADO,'1') = '1'
  AND MULT.ESTADO_ENVIO_ARCHIVO = SCOB_PK_CONSTANTES.C_EST_ARCH_CENTRAL_POR_ENVIAR
  HAVING COUNT(MULT.ID_MULTA) > 0

  UNION ALL

  SELECT
     ARCH_CENT.ID_ARCHIVO_CENTRAL AS ID_ARCHIVO_CENTRAL,
     ARCH_CENT.ANIO || TRIM(AREA_COBR_ARCHIVO.CODIGO) || ARCH_CENT.NRO_ORDEN AS NRO_ENVIO,
     ARCH_CENT.FEC_ENVIO AS FEC_ENVIO,
     ARCH_CENT.NRO_REGISTRO_ARCHIVO_CENTRAL AS NRO_REGISTRO_ARCHIVO_CENTRAL,
     ARCH_CENT.FEC_REGISTRO AS FEC_REGISTRO_ARCHIVO_CENTRAL,
     REGS.NRO_REGISTROS AS NRO_REGISTROS
  FROM T_SCOB_ARCHIVO_CENTRAL ARCH_CENT
  INNER JOIN T_SCOB_AREA_COBRANZA AREA_COBR_ARCHIVO
        ON AREA_COBR_ARCHIVO.ID_AREA_COBRANZA = ARCH_CENT.ID_AREA_COBRANZA
  INNER JOIN (
        SELECT ARCH_CENT.ID_ARCHIVO_CENTRAL AS ID_ARCHIVO_CENTRAL,
               COUNT(ARCH_CENT.ID_ARCHIVO_CENTRAL) AS NRO_REGISTROS
        FROM T_SCOB_ARCHIVO_CENTRAL ARCH_CENT
        INNER JOIN T_SCOB_MULTA_ARCHIVO_CENTRAL MULT_AC
              ON MULT_AC.ID_ARCHIVO_CENTRAL = ARCH_CENT.ID_ARCHIVO_CENTRAL
              AND MULT_AC.ESTADO = '1'
        WHERE ARCH_CENT.ESTADO = '1'
        GROUP BY ARCH_CENT.ID_ARCHIVO_CENTRAL
  ) REGS ON REGS.ID_ARCHIVO_CENTRAL = ARCH_CENT.ID_ARCHIVO_CENTRAL
  WHERE
    ARCH_CENT.ESTADO = '1'
    AND (NVL(PI_V_NRO_ENVIO,' ')=' ' OR (
        NVL(PI_V_NRO_ENVIO,' ')<>' ' AND
        ARCH_CENT.ANIO || TRIM(AREA_COBR_ARCHIVO.CODIGO) || ARCH_CENT.NRO_ORDEN = PI_V_NRO_ENVIO
        ))
    AND (
        NVL(PI_V_FEC_ENVIO_INI,' ')=' ' OR (NVL(PI_V_FEC_ENVIO_INI,' ')<>' ' AND
                          TO_DATE(TO_CHAR(ARCH_CENT.FEC_ENVIO,'DD/MM/YYYY'),'DD/MM/YYYY') BETWEEN
                          TO_DATE(PI_V_FEC_ENVIO_INI,'DD/MM/YYYY') AND TO_DATE(PI_V_FEC_ENVIO_FIN,'DD/MM/YYYY')
        ));
end;


procedure SCOB_SP_U_ARCHIVO_CENTRAL
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 21.09.2011
-- Proposito    : Actualizar los datos de la recepcion del envio en archivo central.
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_ARCHIVO_CENTRAL               IN T_SCOB_ARCHIVO_CENTRAL.ID_ARCHIVO_CENTRAL%TYPE,
  PI_V_NRO_REGISTRO_ARCH_CENT           IN T_SCOB_ARCHIVO_CENTRAL.NRO_REGISTRO_ARCHIVO_CENTRAL%TYPE,
  PI_V_FEC_REGISTRO                     IN VARCHAR2,
  PI_V_AUDUSUMODIFICACION               IN T_SCOB_ARCHIVO_CENTRAL.AUDUSUMODIFICACION%TYPE,
  po_n_retorno                          out number,
  po_n_cod_error                        out number,
  po_v_msj_error                        out varchar2
)
is
begin
  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  UPDATE T_SCOB_ARCHIVO_CENTRAL
  SET
    NRO_REGISTRO_ARCHIVO_CENTRAL = PI_V_NRO_REGISTRO_ARCH_CENT,
    FEC_REGISTRO = TO_DATE(PI_V_FEC_REGISTRO,'DD/MM/YYYY'),
    AUDUSUCREACION = SYSDATE,
    AUDUSUMODIFICACION = PI_V_AUDUSUMODIFICACION
  WHERE ID_ARCHIVO_CENTRAL = PI_N_ID_ARCHIVO_CENTRAL;

  po_n_cod_error := 0;
  po_n_retorno := PI_N_ID_ARCHIVO_CENTRAL;
  commit;
  ----
  exception
  when others then
      po_n_retorno := -1;
      po_n_cod_error := sqlcode;
      select case when po_n_cod_error > 0 then po_n_cod_error * -1 else po_n_cod_error end
      into po_n_cod_error
      from dual;
      po_v_msj_error := substr(sqlerrm,1,250);
      rollback;
end;

procedure SCOB_SP_S_PENDIENTES_ENVIO
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 21.09.2011
-- Proposito    : Consulta el detalle de las multas por enviar
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  po_cu_retorno               out cu_rec_set
)
as
begin

  open po_cu_retorno for

  SELECT
      MULT.ID_MULTA AS ID_MULTA,
      MULT_ARCH_CENT.ID_MULTA_ARCHIVO_CENTRAL AS ID_MULTA_ARCHIVO_CENTRAL,
      MULT.ANIO_FILE_AEC || AREA_COB_FILE.CODIGO || MULT.NRO_FILE_AEC AS NRO_FILE,
      MULT.ANIO || MULT.CUM AS NRO_CUM,
      EXPE.ANIO || EXPE.NRO_EXPEDIENTE AS NRO_EXPEDIENTE,
      SCOB_PK_EXPEDIENTE.SCOB_FN_SANCIONADOS_MULTA(MULT.ID_MULTA,0) AS NOM_SANCIONADO,
      MATE.DESCRIPCION AS NOM_MATERIA,
      MULT.MONTO_TOTAL_DEUDA AS MONTO_TOTAL_DEUDA,
      MULT.TOTAL_AMORTIZACION_DEUDA AS TOTAL_AMORTIZACION_DEUDA,
      MULT.SALDO_TOTAL_DEUDA AS SALDO_TOTAL_DEUDA

  FROM T_SCOB_MULTA MULT

  INNER JOIN T_SCOB_MULTA_COBRANZA MCOB
        ON MCOB.ID_MULTA = MULT.ID_MULTA
        AND MCOB.FLG_ACTUAL = '1'
        AND MCOB.ESTADO = '1'

  LEFT JOIN T_SCOB_AREA_COBRANZA AREA_COB_FILE
        ON AREA_COB_FILE.ID_AREA_COBRANZA = MULT.ID_AREA_COBRANZA

  INNER JOIN T_SCOB_MULTA_ARCHIVO_CENTRAL MULT_ARCH_CENT
        ON MULT_ARCH_CENT.ID_MULTA = MULT.ID_MULTA
        AND MULT_ARCH_CENT.ESTADO = '1'
        AND MULT_ARCH_CENT.FLG_ACTUAL = '1'
        AND MULT_ARCH_CENT.ESTADO_ENVIO_ARCHIVO = MULT.ESTADO_ENVIO_ARCHIVO

  LEFT JOIN T_SCOB_EXPEDIENTE_MULTA EXMU
       ON EXMU.ID_MULTA = MULT.ID_MULTA
       AND EXMU.ESTADO = '1'

  LEFT JOIN T_SCOB_EXPEDIENTE EXPE
       ON EXPE.ID_EXPEDIENTE = EXMU.ID_EXPEDIENTE

  INNER JOIN T_SCOB_MATERIA MATE
        ON MATE.ID_MATERIA = MULT.ID_MATERIA

  WHERE
    NVL(MULT.ESTADO,'1') = '1'
    AND MULT.ESTADO_ENVIO_ARCHIVO = SCOB_PK_CONSTANTES.C_EST_ARCH_CENTRAL_POR_ENVIAR;

end;

procedure SCOB_SP_D_PENDIENTES_ENVIO
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 21.09.2011
-- Proposito    : Eliminar multas del grupo pendiente de envio a archivo central.
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_V_ID_MULTA                       IN VARCHAR2,
  PI_V_ID_ARCHIVO_CENTRAL             IN VARCHAR2,
  PI_V_AUDUSUMODIFICACION             IN T_SCOB_ARCHIVO_CENTRAL.AUDUSUMODIFICACION%TYPE,
  po_n_retorno                        out number,
  po_n_cod_error                      out number,
  po_v_msj_error                      out varchar2
)
is
begin
  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  --actualizar los datos del envio
  UPDATE T_SCOB_MULTA_ARCHIVO_CENTRAL
  SET
    ESTADO_ENVIO_ARCHIVO = SCOB_PK_CONSTANTES.C_EST_ARCH_CENTRAL_NO_ENVIADO,
    FEC_INGRESO = NULL,
    FLG_DEVUELTO = '0',
    FEC_DEVUELTO = NULL,
    NRO_FOLIOS = NULL,
    COD_TIPO_ACCESIBILIDAD = NULL,
    COD_TIPO_ENVIO = NULL,
    FLG_CONCLUIDO = NULL,
    FLG_FOLIADO = NULL,
    FLG_ETIQUETADO = NULL,
    FLG_RESOLUCION_COACTIVA = NULL,
    AUDFECMODIFICACION = SYSDATE,
    AUDUSUMODIFICACION = PI_V_AUDUSUMODIFICACION
  WHERE INSTR(PI_V_ID_ARCHIVO_CENTRAL,'|' || TO_CHAR(ID_MULTA_ARCHIVO_CENTRAL) || '|' )>0;

  --actualizar el estado de al multa
  UPDATE T_SCOB_MULTA
  SET
    AUDFECMODIFICACION = SYSDATE,
    AUDUSUMODIFICACION = PI_V_AUDUSUMODIFICACION,
    ESTADO_ENVIO_ARCHIVO = SCOB_PK_CONSTANTES.C_EST_ARCH_CENTRAL_NO_ENVIADO
  WHERE INSTR(PI_V_ID_MULTA,'|' || TO_CHAR(ID_MULTA) || '|' )>0;

  po_n_cod_error := 0;
  po_n_retorno := 1;
  commit;
  ----
  exception
  when others then
      po_n_retorno := -1;
      po_n_cod_error := sqlcode;
      select case when po_n_cod_error > 0 then po_n_cod_error * -1 else po_n_cod_error end
      into po_n_cod_error
      from dual;
      po_v_msj_error := substr(sqlerrm,1,250);
      rollback;
end;

procedure SCOB_SP_U_ENVIAR_ARCHIVO
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 21.09.2011
-- Proposito    : Realizar el envio a archivo central. Cambiar al estado "ENVIADO".
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_USUARIO                     IN T_SCOB_ARCHIVO_CENTRAL.ID_USUARIO_ENVIO%TYPE,
  PI_V_AUDUSUMODIFICACION             IN T_SCOB_ARCHIVO_CENTRAL.AUDUSUMODIFICACION%TYPE,
  po_n_retorno                        out number,
  po_n_cod_error                      out number,
  po_v_msj_error                      out varchar2
)
is
  N_ID_AREA_COBRANZA                  T_SCOB_USUARIO.ID_AREA_COBRANZA%TYPE;
  N_ID_SEC_ORDEN_ARCH_CENTRAL         NUMBER;
  V_ANIO                              CHAR(4);
  
  --INICIO VICTOR BENDEZU - MIGRACION SICOB A SIA
  VN_ID_MULTA T_SCOB_MULTA.ID_MULTA%TYPE;
  --FIN VICTOR BENDEZU - MIGRACION SICOB A SIA

begin
  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  --obtener el id_area cobranza del usuario que ingresa
  BEGIN
    SELECT USUA.ID_AREA_COBRANZA
    INTO N_ID_AREA_COBRANZA
    FROM T_SCOB_USUARIO USUA
    WHERE USUA.ID_USUARIO = PI_N_ID_USUARIO;
  EXCEPTION WHEN NO_DATA_FOUND THEN
    po_n_cod_error := -10;
    po_v_msj_error :='No se pudo realizar la accion. El usuario debe ser del Area de Cobranza.';
    po_n_retorno := po_n_cod_error;
    RETURN;
  END;

  --obtener el correlativo por a?o y area.
  SELECT TO_CHAR(SYSDATE,'YYYY')
  INTO V_ANIO
  FROM DUAL;

  SELECT NVL(MAX(ARCH_CENT.NRO_ORDEN),0) + 1
  INTO N_ID_SEC_ORDEN_ARCH_CENTRAL
  FROM T_SCOB_ARCHIVO_CENTRAL ARCH_CENT
  WHERE ARCH_CENT.ANIO = V_ANIO
  AND ARCH_CENT.ID_AREA_COBRANZA = N_ID_AREA_COBRANZA;

  --generar el registro de envio a archivo central
  INSERT INTO T_SCOB_ARCHIVO_CENTRAL(
    ID_ARCHIVO_CENTRAL,
    ANIO,
    ID_AREA_COBRANZA,
    NRO_ORDEN,
    NRO_REGISTRO_ARCHIVO_CENTRAL,
    FEC_REGISTRO,
    FEC_ENVIO,
    ID_USUARIO_ENVIO,
    ESTADO_ENVIO,
    ESTADO,
    AUDFECCREACION,
    AUDUSUCREACION
  )
  VALUES(
    SCOB_SQ_ARCHIVO_CENTRAL.NEXTVAL,
    V_ANIO,
    N_ID_AREA_COBRANZA,
    LPAD(N_ID_SEC_ORDEN_ARCH_CENTRAL,4,'0000'), --NRO_ORDEN
    NULL,                        --NRO_REGISTRO_ARCHIVO_CENTRAL
    NULL,                        --FEC_REGISTRO
    SYSDATE,                     --FEC_ENVIO
    PI_N_ID_USUARIO,             --ID_USUARIO_ENVIO
    1,                         --ESTADO_ENVIO
    '1',                         --ESTADO
    SYSDATE,                     --AUDFECCREACION
    PI_V_AUDUSUMODIFICACION
  ) RETURNING ID_ARCHIVO_CENTRAL INTO po_n_retorno;

  --actualizar los datos del envio
  UPDATE T_SCOB_MULTA_ARCHIVO_CENTRAL
  SET
    ID_ARCHIVO_CENTRAL = po_n_retorno,
    ESTADO_ENVIO_ARCHIVO = SCOB_PK_CONSTANTES.C_EST_ARCH_CENTRAL_ENVIADO,
    AUDFECMODIFICACION = SYSDATE,
    AUDUSUMODIFICACION = PI_V_AUDUSUMODIFICACION
  WHERE
    ESTADO_ENVIO_ARCHIVO = SCOB_PK_CONSTANTES.C_EST_ARCH_CENTRAL_POR_ENVIAR
    AND FLG_ACTUAL = '1'
    AND ESTADO = '1';

  --actualizar el estado de la multa
  UPDATE T_SCOB_MULTA
  SET
    AUDFECMODIFICACION = SYSDATE,
    AUDUSUMODIFICACION = PI_V_AUDUSUMODIFICACION,
    ESTADO_ENVIO_ARCHIVO = SCOB_PK_CONSTANTES.C_EST_ARCH_CENTRAL_ENVIADO
  WHERE ID_MULTA IN (
        SELECT MULT_AC.ID_MULTA
        FROM T_SCOB_MULTA_ARCHIVO_CENTRAL MULT_AC
        WHERE MULT_AC.ID_ARCHIVO_CENTRAL = po_n_retorno
  );
  
  --INICIO VICTOR BENDEZU - MIGRACION SICOB A SIA
  
  SELECT MULT_AC.ID_MULTA
    INTO VN_ID_MULTA
    FROM T_SCOB_MULTA_ARCHIVO_CENTRAL MULT_AC
   WHERE MULT_AC.ID_ARCHIVO_CENTRAL = PO_N_RETORNO
     AND ROWNUM = 1;
     
  USR_SIA_INTFZ.PKG_INTFZ_REG_MULTA_SICOB_SIA.SP_I_ARCH_CENTRAL_SICOB_A_SIA(PIN_NU_ID_MULTA => VN_ID_MULTA,
                                                                            POUT_NU_COD_RESULT => PO_N_RETORNO,
                                                                            POUT_VC_MSG_RESULT => PO_V_MSJ_ERROR);
  
  IF PO_N_RETORNO < 0 THEN
     ROLLBACK;
     RETURN;
  END IF;
  --FIN VICTOR BENDEZU - MIGRACION SICOB A SIA
  
  po_n_cod_error := po_n_retorno;
  commit;
  ----
  exception
  when others then
      po_n_retorno := -1;
      po_n_cod_error := sqlcode;
      select case when po_n_cod_error > 0 then po_n_cod_error * -1 else po_n_cod_error end
      into po_n_cod_error
      from dual;
      po_v_msj_error := substr(sqlerrm,1,250);
      rollback;
end;

procedure SCOB_SP_S_GENERA_ENVIO_ARCHIVO
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 22.09.2011
-- Proposito    : Consultar los datos de las multas relacionadas a un envio de archivo central.
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_ARCHIVO_CENTRAL       IN T_SCOB_ARCHIVO_CENTRAL.ID_ARCHIVO_CENTRAL%TYPE,
  po_cu_retorno_cab             out cu_rec_set,
  po_cu_retorno_det             out cu_rec_set
)
as
begin
  open po_cu_retorno_cab for
  SELECT
       AREA_COBR_ARCH.DESCIPCION AS NOM_AREA_COBRANZA,
       ARCH_CENT.NRO_REGISTRO_ARCHIVO_CENTRAL AS NRO_REGISTRO_ARCHIVO_CENTRAL,
       ARCH_CENT.FEC_REGISTRO AS FEC_REGISTRO_ARCHIVO_CENTRAL
  FROM T_SCOB_ARCHIVO_CENTRAL ARCH_CENT
  INNER JOIN T_SCOB_AREA_COBRANZA AREA_COBR_ARCH
        ON AREA_COBR_ARCH.ID_AREA_COBRANZA = ARCH_CENT.ID_AREA_COBRANZA
  WHERE ARCH_CENT.ID_ARCHIVO_CENTRAL = PI_N_ID_ARCHIVO_CENTRAL;

  open po_cu_retorno_det for
  SELECT
    ROWNUM AS NRO_REG,
    MULT.ANIO_FILE_AEC AS ANIO_FILE,
    MULT_ARCH_CENT.NRO_FOLIOS AS NRO_FOLIOS,
    MULT.ANIO_FILE_AEC || AREA_COB_ARCHIVO.CODIGO || MULT.NRO_FILE_AEC AS NRO_EXPEDIENTE,
    SCOB_PK_EXPEDIENTE.SCOB_FN_SANCIONADOS_MULTA(MULT.ID_MULTA,0) AS NOM_SANCIONADO,
    DECODE(MULT_ARCH_CENT.COD_TIPO_ACCESIBILIDAD,SCOB_PK_CONSTANTES.C_EST_IND_PUBLICO,'1','0') AS IND_PUBLICO,
    DECODE(MULT_ARCH_CENT.COD_TIPO_ACCESIBILIDAD,SCOB_PK_CONSTANTES.C_EST_IND_USU_INTERNO,'1','0') AS IND_INTERNO,
    DECODE(MULT_ARCH_CENT.COD_TIPO_ACCESIBILIDAD,SCOB_PK_CONSTANTES.C_EST_IND_CONFIDENCIAL,'1','0') AS IND_CONFIDENCIAL,
    DECODE(MULT_ARCH_CENT.COD_TIPO_ACCESIBILIDAD,SCOB_PK_CONSTANTES.C_EST_IND_RESTRINGIDO,'1','0') AS IND_RESTRINGIDO,
    DECODE(EXPE.ID_EXPEDIENTE,NULL,
           SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(
             SCOB_PK_CONSTANTES.C_TBL_ESTADO_MULTA,MULT.ESTADO_MULTA), --ESTADO MULTA SI NO TIENE EXP.
             EST_EXPE.DESCRIPCION --ESTADO EXP. SI TIENE EXPEDIENTE.
          ) AS DET_OBSERVACION,
    MULT.ID_MULTA AS ID_MULTA
  FROM T_SCOB_MULTA_ARCHIVO_CENTRAL MULT_ARCH_CENT
  INNER JOIN T_SCOB_MULTA MULT
        ON MULT.ID_MULTA = MULT_ARCH_CENT.ID_MULTA
  LEFT JOIN T_SCOB_EXPEDIENTE_MULTA EXMU
       ON EXMU.ID_MULTA = MULT.ID_MULTA
       AND EXMU.ESTADO = '1'
  LEFT JOIN T_SCOB_EXPEDIENTE EXPE
       ON EXPE.ID_EXPEDIENTE = EXMU.ID_EXPEDIENTE
  LEFT JOIN T_SCOB_EST_EXP_COB EST_EXPE
       ON EST_EXPE.ID_EST_EXP_COB = EXPE.ESTADO_EXPEDIENTE
  LEFT JOIN T_SCOB_AREA_COBRANZA AREA_COB_ARCHIVO
       ON AREA_COB_ARCHIVO.ID_AREA_COBRANZA = MULT.ID_AREA_COBRANZA
  WHERE MULT_ARCH_CENT.ID_ARCHIVO_CENTRAL = PI_N_ID_ARCHIVO_CENTRAL
  AND MULT_ARCH_CENT.ESTADO = '1';


end;


FUNCTION SCOB_FN_DIRECCION_ADM(
  PI_N_ID_PERSONA IN T_SCOB_PERSONA.ID_PERSONA%TYPE,
  PI_N_TIPO_DIR VARCHAR2,
  PI_N_TIPO INTEGER
) RETURN  VARCHAR2
IS
V_V_RESPUESTA VARCHAR2(255);
V_C_TIPO_PERSONA CHAR(1);
V_V_TIPO_DIR VARCHAR(20);
V_I_TIPO_DOC INTEGER;
BEGIN
  ---I@001 26.10.2012
  ---Para personas naturales debe tomar la direccion del
  ---domicilio RENIEC(3) o FISCAL(6) o PROCESAL(2)

  ---Para personas juridicas o extranjeros debe tomar la
  ---direccion del domicilio FISCAL(6) o PROCESAL(2) (en ese orden)
  ---F@001 26.10.2012
  FOR REC IN (SELECT P.TIPO_PERSONA,p.tipo_doc FROM T_SCOB_PERSONA P WHERE P.ID_PERSONA=PI_N_ID_PERSONA)
  LOOP
      V_C_TIPO_PERSONA := REC.TIPO_PERSONA;
      V_I_TIPO_DOC := REC.TIPO_DOC;
  END LOOP;

  --- si la persona tiene CARNET DE EXTRANJERIA
  IF V_I_TIPO_DOC = 2 THEN
    V_V_TIPO_DIR := '|6|2|';
  ELSE
    IF V_C_TIPO_PERSONA = '1'  THEN
      V_V_TIPO_DIR := '|3|6|2|';
    ELSE
      V_V_TIPO_DIR := '|6|2|';
    END IF;
  END IF;

  IF PI_N_TIPO = 1 THEN --DIRECCION DE VIA

    FOR REC IN
               ( select * from (SELECT --MAXIMO.DESCRIPCION,
                 SUBSTR((
                 NVL(PDOM.TIPO_VIA,'') || ' ' ||
                 NVL(PDOM.NOM_VIA,'') || ' ' ||
                 NVL(PDOM.NRO_VIA,'') || ' ' ||
                 NVL(PDOM.NRO_INTERIOR,'') || ' ' ||
                 NVL(PDOM.TIPO_ZONA,'') || ' ' ||
                 NVL(PDOM.NOM_ZONA,'')
                 ),1,40)DIRECCION
                FROM T_SCOB_PERSONA_DOMICILIO PDOM
                INNER JOIN (
                            SELECT PDOM.ID_PERSONA AS ID_PERSONA,
                                   PDOM.TIPO_DOMICILIO AS TIPO_DOMICILIO,
                                   TDOM.NU_ORDEN AS NU_ORDEN,
                                   TDOM.DESCRIPCION AS DESCRIPCION
                                   ,MAX(PDOM.ID_PERSONA_DOMICILIO) AS ID_PERSONA_DOMICILIO
                            FROM T_SCOB_PERSONA_DOMICILIO PDOM
                            INNER JOIN T_SCOB_TIPO_DOMICILIO TDOM
                                  ON TDOM.ID_TIPO_DOMICILIO = PDOM.TIPO_DOMICILIO
                                  AND INSTR(V_V_TIPO_DIR,'|'||TRIM(TDOM.CODIGO)||'|')>0
                                  AND TDOM.ESTADO = '1'
                            WHERE PDOM.ID_PERSONA = PI_N_ID_PERSONA AND
                                  PDOM.ESTADO = '1'
                            GROUP BY PDOM.ID_PERSONA, PDOM.TIPO_DOMICILIO, TDOM.NU_ORDEN, TDOM.DESCRIPCION
                            ORDER BY PDOM.ID_PERSONA, TDOM.NU_ORDEN
                            ) MAXIMO ON MAXIMO.ID_PERSONA = PDOM.ID_PERSONA
                            AND MAXIMO.ID_PERSONA_DOMICILIO = PDOM.ID_PERSONA_DOMICILIO
                WHERE PDOM.ID_PERSONA = PI_N_ID_PERSONA AND PDOM.ESTADO = '1'
                  )  where rownum=1
               )
    LOOP
      V_V_RESPUESTA := REC.DIRECCION;
    END LOOP;

  ELSIF PI_N_TIPO = 2 THEN --NOMBRE DISTRITO
    FOR REC IN ( select * from (
                SELECT SUBSTR(ubi.TXT_DIST,1,30)DIRECCION
                FROM T_SCOB_PERSONA_DOMICILIO PDOM
                INNER JOIN (
                            SELECT PDOM.ID_PERSONA AS ID_PERSONA,
                                   PDOM.TIPO_DOMICILIO AS TIPO_DOMICILIO,
                                   TDOM.NU_ORDEN AS NU_ORDEN,
                                   TDOM.DESCRIPCION AS DESCRIPCION
                                   ,MAX(PDOM.ID_PERSONA_DOMICILIO) AS ID_PERSONA_DOMICILIO
                            FROM T_SCOB_PERSONA_DOMICILIO PDOM
                            INNER JOIN T_SCOB_TIPO_DOMICILIO TDOM
                                  ON TDOM.ID_TIPO_DOMICILIO = PDOM.TIPO_DOMICILIO
                                  AND INSTR(V_V_TIPO_DIR,'|'||TRIM(TDOM.CODIGO)||'|')>0
                                  AND TDOM.ESTADO = '1'
                            WHERE PDOM.ID_PERSONA = PI_N_ID_PERSONA AND
                                  PDOM.ESTADO = '1'
                            GROUP BY PDOM.ID_PERSONA, PDOM.TIPO_DOMICILIO, TDOM.NU_ORDEN, TDOM.DESCRIPCION
                            ORDER BY PDOM.ID_PERSONA, TDOM.NU_ORDEN
                            ) MAXIMO ON MAXIMO.ID_PERSONA = PDOM.ID_PERSONA
                            AND MAXIMO.ID_PERSONA_DOMICILIO = PDOM.ID_PERSONA_DOMICILIO
                LEFT JOIN T_SCOB_UBIGEO UBI ON UBI.ID_UBIGEO = PDOM.ID_UBIGEO
                WHERE PDOM.ID_PERSONA = PI_N_ID_PERSONA AND PDOM.ESTADO = '1'
                  ) where rownum=1
                )
      LOOP
        V_V_RESPUESTA := REC.DIRECCION;
      END LOOP;

  ELSIF PI_N_TIPO = 3 THEN -- NOMBRE DE DEPARTAMENTO/REGION
    FOR REC IN ( select * from (
               SELECT SUBSTR(ubi.TXT_DPTO,1,30)DIRECCION
                FROM T_SCOB_PERSONA_DOMICILIO PDOM
                INNER JOIN (
                            SELECT PDOM.ID_PERSONA AS ID_PERSONA,
                                   PDOM.TIPO_DOMICILIO AS TIPO_DOMICILIO,
                                   TDOM.NU_ORDEN AS NU_ORDEN,
                                   TDOM.DESCRIPCION AS DESCRIPCION
                                   ,MAX(PDOM.ID_PERSONA_DOMICILIO) AS ID_PERSONA_DOMICILIO
                            FROM T_SCOB_PERSONA_DOMICILIO PDOM
                            INNER JOIN T_SCOB_TIPO_DOMICILIO TDOM
                                  ON TDOM.ID_TIPO_DOMICILIO = PDOM.TIPO_DOMICILIO
                                  AND INSTR(V_V_TIPO_DIR,'|'||TRIM(TDOM.CODIGO)||'|')>0
                                  AND TDOM.ESTADO = '1'
                            WHERE PDOM.ID_PERSONA = PI_N_ID_PERSONA AND
                                  PDOM.ESTADO = '1'
                            GROUP BY PDOM.ID_PERSONA, PDOM.TIPO_DOMICILIO, TDOM.NU_ORDEN, TDOM.DESCRIPCION
                            ORDER BY PDOM.ID_PERSONA, TDOM.NU_ORDEN
                            ) MAXIMO ON MAXIMO.ID_PERSONA = PDOM.ID_PERSONA
                            AND MAXIMO.ID_PERSONA_DOMICILIO = PDOM.ID_PERSONA_DOMICILIO
                LEFT JOIN T_SCOB_UBIGEO UBI ON UBI.ID_UBIGEO = PDOM.ID_UBIGEO
                WHERE PDOM.ID_PERSONA = PI_N_ID_PERSONA AND PDOM.ESTADO = '1'
                   ) where rownum=1
                  )
      LOOP
        V_V_RESPUESTA := REC.DIRECCION;
      END LOOP;

  END IF;

  RETURN NVL(V_V_RESPUESTA,' ');
END;
----
end SCOB_PK_PROCESO;
/
