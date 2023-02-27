CREATE OR REPLACE PACKAGE SCOB_PK_EXPEDIENTE IS

  -- Author  : ADMIN
  -- Created : 17/03/2011 15:00:13 p.m.
  -- Purpose :

  TYPE CU_REC_SET IS REF CURSOR;
  ----
  PROCEDURE SCOB_SP_S_EXPEDIENTE
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 04.04.2011
    -- Proposito    : Consulta las expedientes generados.
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_C_EVENTO             IN CHAR, --1=GENERAR EXPED; 2=COB.PRE-COACTIVA y COACTIVA;
   PI_V_NRO_EXPEDIENTE_INI IN VARCHAR2,
   PI_V_NRO_EXPEDIENTE_FIN IN VARCHAR2,
   PI_C_FEC_ASI_INI        IN CHAR, --falta..
   PI_C_FEC_ASI_FIN        IN CHAR, --falta..
   PI_C_FEC_INI            IN CHAR,
   PI_C_FEC_FIN            IN CHAR,
   PI_V_ESTADO_EXPEDIENTE  IN VARCHAR,
   PI_N_COD_ORGANO_RESOL   IN T_SCOB_MULTA_DETAL.ID_ORGANO_RESOLUTIVO%TYPE,
   PI_N_SALDO_INI          IN T_SCOB_EXPEDIENTE.MONTO_UIT%TYPE,
   PI_N_SALDO_FIN          IN T_SCOB_EXPEDIENTE.MONTO_UIT%TYPE,
   PI_C_DPTO               IN T_SCOB_UBIGEO.COD_DPTO%TYPE,
   PI_C_PROV               IN T_SCOB_UBIGEO.COD_PROV%TYPE,
   PI_C_DSTO               IN T_SCOB_UBIGEO.COD_DIST%TYPE,
   PI_N_COD_MATERIA        IN T_SCOB_MULTA.ID_MATERIA%TYPE,
   --
   PI_I_TIPO_PERSONA     IN T_SCOB_PERSONA.TIPO_PERSONA%TYPE,
   PI_I_TIPO_DOC         IN T_SCOB_PERSONA.TIPO_DOC%TYPE,
   PI_V_NRO_DOC          IN T_SCOB_PERSONA.NRO_DOC%TYPE,
   PI_V_APE_PATERNO      IN T_SCOB_PERSONA.APE_PATERNO%TYPE,
   PI_V_APE_MATERNO      IN T_SCOB_PERSONA.APE_MATERNO%TYPE,
   PI_V_PRI_NOMBRE       IN T_SCOB_PERSONA.PRI_NOMBRE%TYPE,
   PI_V_SEG_NOMBRE       IN T_SCOB_PERSONA.SEG_NOMBRE%TYPE,
   PI_V_RAZON_SOCIAL     IN T_SCOB_PERSONA.RAZON_SOCIAL%TYPE,
   PI_V_NOMBRE_COMERCIAL IN T_SCOB_PERSONA.NOMBRE_COMERCIAL%TYPE,
   PI_C_ESTADO           IN T_SCOB_EXPEDIENTE.ESTADO%TYPE,
   --
   PI_N_ID_USUARIO IN T_SCOB_USUARIO.ID_USUARIO%TYPE,
   PO_CU_RETORNO   OUT CU_REC_SET);

  ----

  PROCEDURE SCOB_SP_S_MULTA
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 04.04.2011
    -- Proposito    : Consulta las multas asignadas a un usuario y posibles para asociar a un expediente.
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_N_ID_EXPEDIENTE    IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
   PI_V_CUM_INI          IN VARCHAR2,
   PI_V_CUM_FIN          IN VARCHAR2,
   PI_N_COD_MATERIA      IN T_SCOB_MULTA.ID_MATERIA%TYPE,
   PI_N_COD_ORGANO_RESOL IN T_SCOB_MULTA_DETAL.ID_ORGANO_RESOLUTIVO%TYPE,
   --
   PI_I_TIPO_PERSONA IN T_SCOB_PERSONA.TIPO_PERSONA%TYPE,
   PI_I_TIPO_DOC     IN T_SCOB_PERSONA.TIPO_DOC%TYPE,
   PI_V_NRO_DOC      IN T_SCOB_PERSONA.NRO_DOC%TYPE,
   PI_V_APE_PATERNO  IN T_SCOB_PERSONA.APE_PATERNO%TYPE,
   PI_V_APE_MATERNO  IN T_SCOB_PERSONA.APE_MATERNO%TYPE,
   PI_V_PRI_NOMBRE   IN T_SCOB_PERSONA.PRI_NOMBRE%TYPE,
   PI_V_SEG_NOMBRE   IN T_SCOB_PERSONA.SEG_NOMBRE%TYPE,
   PI_V_RAZON_SOCIAL IN T_SCOB_PERSONA.RAZON_SOCIAL%TYPE,
   PI_N_ID_USUARIO   IN T_SCOB_USUARIO.ID_USUARIO%TYPE,
   PO_CU_RETORNO     OUT CU_REC_SET);

  PROCEDURE SCOB_SP_S_MULTA_EXPEDIENTE
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 04.04.2011
    -- Proposito    : Consulta las multas relacionadas a un expediente.
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_N_ID_EXPEDIENTE IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
   PO_CU_RETORNO      OUT CU_REC_SET);

  PROCEDURE SCOB_SP_S_DATOS_EXPEDIENTE
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 04.04.2011
    -- Proposito    : Consulta los datos de la cabecera de un expediente
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_N_ID_EXPEDIENTE IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
   PO_CU_RETORNO      OUT CU_REC_SET);

  PROCEDURE SCOB_SP_U_DATOS_EXPEDIENTE
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 26.04.2011
    -- Proposito    : actualiza datos del expediente.
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_N_ID_EXPEDIENTE         IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
   PI_I_COD_EXPECTATIVA_COBRO IN T_SCOB_EXPEDIENTE.COD_EXPECTATIVA_COBRO%TYPE,
   PI_C_FLG_SENSIBLE          IN T_SCOB_EXPEDIENTE.FLG_SENSIBLE%TYPE,
   PI_C_FLG_ENVIO_RIESGO      IN T_SCOB_MULTA.FLG_ENVIO_RIESGO_EXP%TYPE,
   PI_V_FEC_ENVIO_RIESGO      IN VARCHAR2,
   PI_N_ID_NUEVO_ESTADO_EXPED IN T_SCOB_EXPEDIENTE_ESTADO.ESTADO_EXPEDIENTE%TYPE,
   PI_V_AUDUSUCREACION        IN T_SCOB_EXPEDIENTE.AUDUSUCREACION%TYPE,
   PO_N_RETORNO               OUT NUMBER,
   PO_N_COD_ERROR             OUT NUMBER,
   PO_V_MSJ_ERROR             OUT VARCHAR2);

  PROCEDURE SCOB_SP_S_SANC_EXPEDIENTE
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 26.04.2011
    -- Proposito    : Consulta a los sancionados de un expediente
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_N_ID_EXPEDIENTE IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
   PO_CU_RETORNO      OUT CU_REC_SET);

  PROCEDURE SCOB_SP_I_EXPEDIENTE_ESTADO
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 07.04.2011
    -- Proposito    : inserta el log de estados de los expedientes
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_N_ID_EXPEDIENTE     IN T_SCOB_EXPEDIENTE_ESTADO.ID_EXPEDIENTE_ESTADO%TYPE,
   PI_N_ID_MOTIVO         IN T_SCOB_EXPEDIENTE_ESTADO.ID_MOTIVO%TYPE,
   PI_N_ESTADO_EXPEDIENTE IN T_SCOB_EXPEDIENTE.ESTADO_EXPEDIENTE%TYPE,
   PI_V_AUDUSUCREACION    IN T_SCOB_EXPEDIENTE.AUDUSUCREACION%TYPE,
   PO_N_COD_ERROR         OUT NUMBER,
   PO_V_MSJ_ERROR         OUT VARCHAR2);

  PROCEDURE SCOB_SP_I_EXPEDIENTE
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 04.04.2011
    -- Proposito    : genera un expediente y asocia las multas relacionadas.
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_N_ID_EXPEDIENTE      IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
   PI_V_NRO_EXPEDIENTE     IN VARCHAR2,
   PI_V_ID_MULTA           IN VARCHAR2,
   PI_N_NRO_ITEMS          IN INTEGER,
   PI_V_AUDUSUCREACION     IN T_SCOB_MULTA_DETAL.AUDUSUCREACION%TYPE,
   PI_N_ID_USUARIO_INGRESO IN T_SCOB_EXPEDIENTE.ID_USUARIO_INGRESO%TYPE,
   PO_N_RETORNO            OUT NUMBER,
   PO_N_COD_ERROR          OUT NUMBER,
   PO_V_MSJ_ERROR          OUT VARCHAR2);

  PROCEDURE SCOB_SP_S_EXPED_DOC_GEN
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 13.05.2011
    -- Proposito    : Lista todos los documentos generados de un expediente
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_N_ID_EXPEDIENTE IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
   PO_CU_RETORNO      OUT CU_REC_SET);

  PROCEDURE SCOB_SP_S_EXPED_DOC_GEN_DET
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 13.05.2011
    -- Proposito    : Lista todos los documentos generados de un expediente
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_N_ID_EXPEDIENTE           IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
   PI_N_ID_EXPEDIENTE_DOCUMENTO IN T_SCOB_EXPEDIENTE_DOCUMENTO.ID_EXPEDIENTE_DOCUMENTO%TYPE,
   PO_CU_RETORNO                OUT CU_REC_SET);

  PROCEDURE SCOB_SP_D_EXPEDIENTE
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 04.04.2011
    -- Proposito    : eliminar un expediente y su relacion con las multas.
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_V_ID_EXPEDIENTE  IN VARCHAR2,
   PI_I_NRO_REG        IN INTEGER,
   PI_V_AUDUSUCREACION IN T_SCOB_MULTA_CHECK.AUDUSUCREACION%TYPE,
   PO_N_RETORNO        OUT NUMBER,
   PO_N_COD_ERROR      OUT NUMBER,
   PO_V_MSJ_ERROR      OUT VARCHAR2);

  PROCEDURE SCOB_SP_D_EXPEDIENTE_MULTA
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 07.04.2011
    -- Proposito    : eliminar las multas de un expediente.
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_N_ID_EXPEDIENTE       IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
   PI_V_ID_EXPEDIENTE_MULTA IN VARCHAR2,
   PI_V_AUDUSUMODIFICACION  IN T_SCOB_EXPEDIENTE.AUDUSUMODIFICACION%TYPE,
   PO_N_RETORNO             OUT NUMBER,
   PO_N_COD_ERROR           OUT NUMBER,
   PO_V_MSJ_ERROR           OUT VARCHAR2);

  PROCEDURE SCOB_SP_I_EXPEDIENTE_ADJUNTO
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 07/04/2011
    -- Proposito    : insertar los documentos adjuntos
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_N_ID_EXPEDIENTE  IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
   PI_V_TITULO         IN T_SCOB_EXPEDIENTE_DOCUMENTO.TITULO%TYPE,
   PI_V_NOMBRE         IN T_SCOB_EXPEDIENTE_DOCUMENTO.NOMBRE%TYPE,
   PI_N_TAMANIO        IN T_SCOB_EXPEDIENTE_DOCUMENTO.TAMANIO%TYPE,
   PI_V_AUDUSUCREACION IN T_SCOB_EXPEDIENTE_DOCUMENTO.AUDUSUCREACION%TYPE,
   PO_N_RETORNO        OUT NUMBER,
   PO_N_COD_ERROR      OUT NUMBER,
   PO_V_MSJ_ERROR      OUT VARCHAR2);

  PROCEDURE SCOB_SP_D_EXPEDIENTE_ADJUNTO
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 07.04.2011
    -- Proposito    : actualiza al estado eliminado los documentos adjuntos seleccionados
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_V_ID_EXPEDIENTE_DOCUMENTO IN VARCHAR2,
   PI_V_AUDUSUCREACION          IN T_SCOB_EXPEDIENTE_DOCUMENTO.AUDUSUCREACION%TYPE,
   PO_N_RETORNO                 OUT NUMBER,
   PO_N_COD_ERROR               OUT NUMBER,
   PO_V_MSJ_ERROR               OUT VARCHAR2);

  PROCEDURE SCOB_SP_S_EXPEDIENTE_ADJUNTO
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 07.04.2011
    -- Proposito    : consulta los documentos adjuntos asociados a un expediente.
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_N_ID_EXPEDIENTE IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
   PI_I_TIPO_DOC_ASOC IN T_SCOB_EXPEDIENTE_DOCUMENTO.TIPO_DOC_ASOC%TYPE,
   PO_CU_RETORNO      OUT CU_REC_SET);

  PROCEDURE SCOB_SP_S_T_SCOB_COSTA
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 11.04.2011
    -- Proposito    : lista las costas
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_N_ID_EXPEDIENTE           IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
   PI_N_ID_EXPEDIENTE_DOCUMENTO IN T_SCOB_EXPEDIENTE_DOCUMENTO.ID_EXPEDIENTE_DOCUMENTO%TYPE,
   PO_CU_RETORNO                OUT CU_REC_SET);

  PROCEDURE SCOB_SP_I_AGREGAR_COSTA_EXPED
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 10.09.2011
    -- Proposito    : agregar costas a un expediente, sin documento generado.
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_N_ID_EXPEDIENTE       IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
   PI_N_ID_CUM_EXPEDIENTE   IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
   PI_V_ID_COSTAS           IN VARCHAR2,
   PI_V_POR_COSTAS          IN VARCHAR2,
   PI_V_VAL_COSTAS          IN VARCHAR2,
   PI_V_CNT_COSTAS          IN VARCHAR2,
   PI_V_SUB_TOTAL_COSTAS    IN VARCHAR2,
   PI_N_TOTAL_COSTAS        IN T_SCOB_EXPEDIENTE.MONTO_COSTAS%TYPE,
   PI_N_NRO_ITEMS           IN INTEGER,
   PI_V_AUDUSUCREACION      IN T_SCOB_EXPEDIENTE_DOCUMENTO.AUDUSUCREACION%TYPE,
   PI_C_FLG_AGREGAR         IN CHAR, --AGREGAR=1;DISMINUIR=0
   PO_N_RETORNO             OUT NUMBER,
   PO_N_COD_ERROR           OUT NUMBER,
   PO_V_MSJ_ERROR           OUT VARCHAR2);

  PROCEDURE SCOB_SP_S_AGREGAR_COSTA_EXPED
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 10.09.2011
    -- Proposito    : lista las costas del expediente, sin considerar documento.
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_N_ID_EXPEDIENTE IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
   V_CUMS             OUT CLOB,
   PO_CU_RETORNO_CAB  OUT CU_REC_SET,
   PO_CU_RETORNO      OUT CU_REC_SET);

  PROCEDURE SCOB_SP_I_T_SCOB_EXPED_COSTA
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 20.04.2011
    -- Proposito    : actualizar las costas asociadas a un documento
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_N_ID_EXPEDIENTE           IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
   PI_N_ID_EXPEDIENTE_DOCUMENTO IN T_SCOB_EXPEDIENTE_DOCUMENTO.ID_EXPEDIENTE_DOCUMENTO%TYPE,
   PI_V_ID_COSTAS               IN VARCHAR2,
   PI_V_POR_COSTAS              IN VARCHAR2,
   PI_V_VAL_COSTAS              IN VARCHAR2,
   PI_V_CNT_COSTAS              IN VARCHAR2,
   PI_V_SUB_TOTAL_COSTAS        IN VARCHAR2,
   PI_N_TOTAL_COSTAS            IN T_SCOB_EXPEDIENTE.MONTO_COSTAS%TYPE,
   PI_N_NRO_ITEMS               IN INTEGER,
   PI_V_AUDUSUCREACION          IN T_SCOB_EXPEDIENTE_DOCUMENTO.AUDUSUCREACION%TYPE,
   PI_C_FLG_AGREGAR             IN CHAR, --AGREGAR=1;DISMINUIR=0
   PO_N_COD_ERROR               OUT NUMBER,
   PO_V_MSJ_ERROR               OUT VARCHAR2);  

  FUNCTION SCOB_FN_SANCIONADOS_EXPED(PI_N_ID_EXPEDIENTE IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE)
    RETURN VARCHAR2;
  --
  FUNCTION SCOB_FN_SANCIONADOS_EXP_MULTA(PI_N_ID_MULTA IN T_SCOB_MULTA.ID_MULTA%TYPE)
    RETURN VARCHAR2;
  --
  FUNCTION SCOB_FN_NRO_DOC_SANC(PI_N_ID_MULTA IN T_SCOB_MULTA.ID_MULTA%TYPE)
    RETURN VARCHAR2;

  FUNCTION SCOB_FN_SANCIONADOS_MULTA(PI_N_ID_MULTA     IN T_SCOB_MULTA.ID_MULTA%TYPE,
                                     PI_N_NRO_PERSONAS IN INTEGER)
    RETURN VARCHAR2;

  FUNCTION SCOB_FN_SANCIONADO_MULTA_PRINC(PI_N_ID_MULTA IN T_SCOB_MULTA.ID_MULTA%TYPE)
    RETURN VARCHAR2;

  FUNCTION SCOB_FN_SANCIONADOS_CIIU(PI_N_ID_MULTA     IN T_SCOB_MULTA.ID_MULTA%TYPE,
                                    PI_N_NRO_PERSONAS IN INTEGER)
    RETURN VARCHAR2;

  PROCEDURE SCOB_SP_S_LISTA_SANC_EXPED
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 28.04.2011
    -- Proposito    : listar los sancionados.
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_N_ID_EXPEDIENTE IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
   PO_CU_RETORNO      OUT CU_REC_SET);

  PROCEDURE SCOB_SP_S_LISTA_DIR_SANC_EXPED
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 28.04.2011
    -- Proposito    : listar los sancionados.
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_N_ID_EXPEDIENTE IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
   PI_C_FLG_GRABADOS  IN CHAR,
   PO_CU_RETORNO      OUT CU_REC_SET);

  PROCEDURE SCOB_SP_I_DIR_SANC_EXPED
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 28.04.2011
    -- Proposito    : insertar las direcciones de los sancionados del expediente
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_N_ID_EXPEDIENTE        IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
   PI_V_ID_PERSONA           IN VARCHAR2,
   PI_V_ID_PERSONA_DOMICILIO IN VARCHAR2,
   PI_N_NRO_ITEMS            IN NUMBER,
   PI_V_AUDUSUCREACION       IN T_SCOB_MULTA_SANCIONADO_DIREC.AUDUSUCREACION%TYPE,
   
   PO_N_RETORNO   OUT NUMBER,
   PO_N_COD_ERROR OUT NUMBER,
   PO_V_MSJ_ERROR OUT VARCHAR2);

  PROCEDURE SCOB_SP_S_SOBRESEER
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 29.04.2011
    -- Proposito    : listar los registros de sobreseer
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_N_ID_EXPEDIENTE IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
   PO_CU_RETORNO      OUT CU_REC_SET);

  PROCEDURE SCOB_SP_I_SOBRESEER
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 28.04.2011
    -- Proposito    : insertar estado sobreseer del expediente
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_N_ID_EXPEDIENTE            IN T_SCOB_EXPEDIENTE_ESTADO.ID_EXPEDIENTE_ESTADO%TYPE,
   PI_N_ID_MOTIVO                IN T_SCOB_EXPEDIENTE_ESTADO.ID_MOTIVO%TYPE,
   PI_N_ESTADO_EXPEDIENTE        IN T_SCOB_EXPEDIENTE.ESTADO_EXPEDIENTE%TYPE,
   PI_C_FLG_PROCED_INFRUCTUOSO   IN T_SCOB_EXPEDIENTE_SOBRESEER.FLG_PROCED_INFRUCTUOSO_ANT%TYPE,
   PI_C_NRO_EXPEDIENTE_INFRUC    IN T_SCOB_EXPEDIENTE_SOBRESEER.NRO_EXPEDIENTE_INFRUCTUOSO%TYPE,
   PI_C_FLG_ORDEN_CAPTURA_VEHI   IN T_SCOB_EXPEDIENTE_SOBRESEER.FLG_ORDEN_CAPTURA_VEHICULAR%TYPE,
   PI_V_DES_EMBARGO_OTRO         IN T_SCOB_EXPEDIENTE_SOBRESEER.DES_EMBARGO_OTRO%TYPE,
   PI_C_FLG_INFORMACION_VERIF    IN T_SCOB_EXPEDIENTE_SOBRESEER.FLG_INFORMACION_VERIFICADA%TYPE,
   PI_C_FLG_MARCA_BIEN           IN T_SCOB_EXPEDIENTE_SOBRESEER.FLG_MARCA_BIEN%TYPE,
   PI_C_FLG_MARCA_BIEN_GRAVADO   IN T_SCOB_EXPEDIENTE_SOBRESEER.FLG_MARCA_BIEN_GRAVADO%TYPE,
   PI_C_FLG_MARCA_BIEN_PROPIEDAD IN T_SCOB_EXPEDIENTE_SOBRESEER.FLG_MARCA_BIEN_PROPIEDAD%TYPE,
   PI_C_FLG_MARCA_BIEN_EJECUCION IN T_SCOB_EXPEDIENTE_SOBRESEER.FLG_MARCA_BIEN_EJECUCION%TYPE,
   PI_C_FLG_SUNAT_BAJA_OFICIO    IN T_SCOB_EXPEDIENTE_SOBRESEER.FLG_SUNAT_BAJA_OFICIO%TYPE,
   PI_C_FLG_SUNAT_OMISO          IN T_SCOB_EXPEDIENTE_SOBRESEER.FLG_SUNAT_OMISO%TYPE,
   PI_C_FLG_SUNAT_SUSPEN_TEMP    IN T_SCOB_EXPEDIENTE_SOBRESEER.FLG_SUNAT_SUSPEN_TEMP%TYPE,
   PI_V_DES_SUNAT_OTRO           IN T_SCOB_EXPEDIENTE_SOBRESEER.DES_SUNAT_OTRO%TYPE,
   PI_C_FLG_INFORCORP            IN T_SCOB_EXPEDIENTE_SOBRESEER.FLG_INFORCORP%TYPE,
   PI_C_FLG_CERTICOM             IN T_SCOB_EXPEDIENTE_SOBRESEER.FLG_CERTICOM%TYPE,
   PI_V_DES_SOBRESEER            IN T_SCOB_EXPEDIENTE_SOBRESEER.DES_SOBRESEER%TYPE,
   PI_V_AUDUSUCREACION           IN T_SCOB_EXPEDIENTE_SOBRESEER.AUDUSUCREACION%TYPE,
   
   PO_N_RETORNO   OUT NUMBER,
   PO_N_COD_ERROR OUT NUMBER,
   PO_V_MSJ_ERROR OUT VARCHAR2);

  PROCEDURE SCOB_SP_U_CONFIR_DATOS_GAF
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 13.05.2011
    -- Proposito    : confirmar los datos de las resoluciones de gaf
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_V_ID_EXPEDIENTE_DOCUMENTO IN VARCHAR2,
   PI_C_FEC_RESOLUCION_GAF      IN VARCHAR2, --T_SCOB_EXPEDIENTE_DOCUMENTO.FEC_RESOLUCION_GAF%TYPE,
   PI_V_NRO_RESOLUCION_GAF      IN T_SCOB_EXPEDIENTE_DOCUMENTO.NRO_RESOLUCION_GAF%TYPE,
   PI_C_TIPO_SOLICITUD          IN CHAR, --1=SUSPENSION;2=FRACCIONAMIENTO
   PI_I_TIPO_ASOCIACION         IN INTEGER,
   PI_N_ID_TIPO_SOLICITUD       IN NUMBER,
   PI_V_AUDUSUMODIFICACION      IN T_SCOB_EXPEDIENTE_DOCUMENTO.AUDUSUMODIFICACION%TYPE,
   PO_N_RETORNO                 OUT NUMBER,
   PO_N_COD_ERROR               OUT NUMBER,
   PO_V_MSJ_ERROR               OUT VARCHAR2);

  PROCEDURE SCOB_SP_S_LISTAR_GARANTIA
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 13.05.2011
    -- Proposito    : listar las garantias registradas por la interfaz
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_N_ID_EXPEDIENTE   IN NUMBER,
   PI_N_NU_ANIO_EXP_COB IN VW_MULTA_CF_CABECERA.NU_ANIO_EXP_COB%TYPE,
   PI_N_NU_NRO_EXP_COB  IN VW_MULTA_CF_CABECERA.NU_NRO_EXP_COB%TYPE,
   PO_CU_RETORNO        OUT CU_REC_SET);

  PROCEDURE SCOB_SP_S_SOLIC_SUSPENDER
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 12.05.2011
    -- Proposito    : listar las solicitudes de suspension
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_N_ID_EXPEDIENTE      IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
   PI_N_ID_EXPED_SUSPENDER IN T_SCOB_EXPED_SUSPENDER.ID_EXPED_SUSPENDER%TYPE,
   PO_CU_RETORNO           OUT CU_REC_SET);

  PROCEDURE SCOB_SP_U_SOLIC_SUSPENDER
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 12/05/2011
    -- Proposito    : actualizar los datos de la solicitud de suspension
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_N_ID_EXPED_SUSPENDER      IN T_SCOB_EXPED_SUSPENDER.ID_EXPED_SUSPENDER%TYPE,
   PI_V_NRO_SOLICITUD           IN T_SCOB_EXPED_SUSPENDER.NRO_SOLICITUD%TYPE,
   PI_V_NRO_DOCUMENTO_TRAMITE   IN T_SCOB_EXPED_SUSPENDER.NRO_DOCUMENTO_TRAMITE%TYPE,
   PI_N_ID_EXPEDIENTE_DOCUMENTO IN T_SCOB_EXPED_SUSPENDER.ID_EXPEDIENTE_DOCUMENTO%TYPE,
   PI_V_AUDUSUMODIFICACION      IN T_SCOB_EXPED_SUSPENDER.AUDUSUMODIFICACION%TYPE,
   PO_N_RETORNO                 OUT NUMBER,
   PO_N_COD_ERROR               OUT NUMBER,
   PO_V_MSJ_ERROR               OUT VARCHAR2);

  PROCEDURE SCOB_SP_S_SOLIC_SUSPENDER_DOCS
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 13.05.2011
    -- Proposito    : lista los documentos asociados de una solicitud de suspension
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_N_ID_EXPED_SUSPENDER  IN T_SCOB_EXPED_SUSPENDER.ID_EXPED_SUSPENDER%TYPE,
   PI_I_COD_TIPO_ASOCIACION IN T_SCOB_EXPED_SUSPENDER_DOC.COD_TIPO_ASOCIACION%TYPE,
   PO_CU_RETORNO            OUT CU_REC_SET);

  PROCEDURE SCOB_SP_S_ENTIDAD_ESTATAL
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 23.05.2011
    -- Proposito    : listar las entidades estatales
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_I_COD_TIPO_ENTIDAD IN T_SCOB_ENTIDAD_ESTATAL.COD_TIPO_ENTIDAD%TYPE,
   PI_C_COD_DPTO         IN T_SCOB_UBIGEO.COD_DPTO%TYPE,
   PI_C_COD_PROV         IN T_SCOB_UBIGEO.COD_PROV%TYPE,
   PI_C_COD_DSTO         IN T_SCOB_UBIGEO.COD_DIST%TYPE,
   PO_CU_RETORNO         OUT CU_REC_SET);

  /*
  procedure SCOB_SP_S_EXPED_ARCH_CENTRAL
  /*
  -----------------------------------------------------------
  -- Autor        : RMCA
  -- Creado       : 23.05.2011
  -- Proposito    : listar los envios registrado o enviados a archivo central
  -----------------------------------------------------------
  -- Modificacion :
  -- Autor        :
  -- Modificado   :
  -- Proposito    :
  -----------------------------------------------------------
  */
  /*
  (
    PI_N_ID_EXPEDIENTE                IN T_SCOB_EXPED_ARCHIVO_CENTRAL.ID_EXPEDIENTE%TYPE,
    PI_N_ID_EXPED_ARCHIVO_CENTRAL     IN T_SCOB_EXPED_ARCHIVO_CENTRAL.ID_EXPED_ARCHIVO_CENTRAL%TYPE,
    po_cu_retorno                     out cu_rec_set
  );
  
  procedure SCOB_SP_U_GENERAR_ENVIO_ARCH
  /*
  -----------------------------------------------------------
  -- Autor        : RMCA
  -- Creado       : 23.05.2011
  -- Proposito    : envia a archivo central los expedientes seleccionados.
  -----------------------------------------------------------
  -- Modificacion :
  -- Autor        :
  -- Modificado   :
  -- Proposito    :
  -----------------------------------------------------------
  */
  /*
  (
    PI_V_ID_EXPEDIENTE            IN VARCHAR2,
    PI_I_NRO_REG                  IN INTEGER,
    PI_V_AUDUSUCREACION           IN T_SCOB_ARCHIVO_CENTRAL.AUDUSUCREACION%TYPE,
    PI_N_ID_USUARIO               IN T_SCOB_ARCHIVO_CENTRAL.ID_USUARIO_ENVIO%TYPE,
    po_n_retorno                  out number,
    po_n_cod_error                out number,
    po_v_msj_error                out varchar2
  );
  
  /*
  procedure SCOB_SP_I_ENVIAR_ARCH_CENTRAL
  /*
  -----------------------------------------------------------
  -- Autor        : RMCA
  -- Creado       : 23.05.2011
  -- Proposito    : insertar un registro solicitando el envio a archivo central
  -----------------------------------------------------------
  -- Modificacion :
  -- Autor        :
  -- Modificado   :
  -- Proposito    :
  -----------------------------------------------------------
  */
  /*
  (
    PI_N_ID_EXPEDIENTE                   IN T_SCOB_EXPED_ARCHIVO_CENTRAL.ID_EXPEDIENTE%TYPE,
    PI_I_NRO_FOLIOS                      IN T_SCOB_EXPED_ARCHIVO_CENTRAL.NRO_FOLIOS%TYPE,
    PI_I_COD_TIPO_ACCESIBILIDAD          IN T_SCOB_EXPED_ARCHIVO_CENTRAL.COD_TIPO_ACCESIBILIDAD%TYPE,
    PI_I_COD_TIPO_ENVIO                  IN T_SCOB_EXPED_ARCHIVO_CENTRAL.COD_TIPO_ENVIO%TYPE,
    PI_C_FLG_CONCLUIDO                   IN T_SCOB_EXPED_ARCHIVO_CENTRAL.FLG_CONCLUIDO%TYPE,
    PI_C_FLG_FOLIADO                     IN T_SCOB_EXPED_ARCHIVO_CENTRAL.FLG_FOLIADO%TYPE,
    PI_C_FLG_ETIQUETADO                  IN T_SCOB_EXPED_ARCHIVO_CENTRAL.FLG_ETIQUETADO%TYPE,
    PI_C_FLG_RESOLUCION_COACTIVA         IN T_SCOB_EXPED_ARCHIVO_CENTRAL.FLG_RESOLUCION_COACTIVA%TYPE,
    PI_V_TXT_OBSERVACION                 IN T_SCOB_EXPED_ARCHIVO_CENTRAL.TXT_OBSERVACION%TYPE,
    PI_N_ID_USUARIO                      IN T_SCOB_EXPED_ARCHIVO_CENTRAL.ID_USUARIO_INGRESO%TYPE,
    PI_V_AUDUSUCREACION                  IN T_SCOB_EXPED_ARCHIVO_CENTRAL.AUDUSUCREACION%TYPE,
  
    po_n_retorno                         out number,
    po_n_cod_error                       out number,
    po_v_msj_error                       out varchar2
  );
  
  */
  /*
  procedure SCOB_SP_U_ENVIAR_ARCH_CENTRAL
  /*
  -----------------------------------------------------------
  -- Autor        : RMCA
  -- Creado       : 23.05.2011
  -- Proposito    : actualizar el registro de solicitud de envio a archivo central
  -----------------------------------------------------------
  -- Modificacion :
  -- Autor        :
  -- Modificado   :
  -- Proposito    :
  -----------------------------------------------------------
  */
  /*
  (
    PI_N_ID_EXPED_ARCHIVO_CENTRAL        IN T_SCOB_EXPED_ARCHIVO_CENTRAL.ID_EXPED_ARCHIVO_CENTRAL%TYPE,
    PI_I_NRO_FOLIOS                      IN T_SCOB_EXPED_ARCHIVO_CENTRAL.NRO_FOLIOS%TYPE,
    PI_I_COD_TIPO_ACCESIBILIDAD          IN T_SCOB_EXPED_ARCHIVO_CENTRAL.COD_TIPO_ACCESIBILIDAD%TYPE,
    PI_I_COD_TIPO_ENVIO                  IN T_SCOB_EXPED_ARCHIVO_CENTRAL.COD_TIPO_ENVIO%TYPE,
    PI_C_FLG_CONCLUIDO                   IN T_SCOB_EXPED_ARCHIVO_CENTRAL.FLG_CONCLUIDO%TYPE,
    PI_C_FLG_FOLIADO                     IN T_SCOB_EXPED_ARCHIVO_CENTRAL.FLG_FOLIADO%TYPE,
    PI_C_FLG_ETIQUETADO                  IN T_SCOB_EXPED_ARCHIVO_CENTRAL.FLG_ETIQUETADO%TYPE,
    PI_C_FLG_RESOLUCION_COACTIVA         IN T_SCOB_EXPED_ARCHIVO_CENTRAL.FLG_RESOLUCION_COACTIVA%TYPE,
    PI_V_TXT_OBSERVACION                 IN T_SCOB_EXPED_ARCHIVO_CENTRAL.TXT_OBSERVACION%TYPE,
    PI_V_AUDUSUCREACION                  IN T_SCOB_EXPED_ARCHIVO_CENTRAL.AUDUSUCREACION%TYPE,
    po_n_retorno                         out number,
    po_n_cod_error                       out number,
    po_v_msj_error                       out varchar2
  );
  
  procedure SCOB_SP_D_ENVIAR_ARCH_CENTRAL
  /*
  -----------------------------------------------------------
  -- Autor        : RMCA
  -- Creado       : 23.05.2011
  -- Proposito    : elimina el registro de solicitud de envio a archivo central
  -----------------------------------------------------------
  -- Modificacion :
  -- Autor        :
  -- Modificado   :
  -- Proposito    :
  -----------------------------------------------------------
  */
  /*
  (
    PI_N_ID_EXPED_ARCHIVO_CENTRAL        IN T_SCOB_EXPED_ARCHIVO_CENTRAL.ID_EXPED_ARCHIVO_CENTRAL%TYPE,
    PI_V_AUDUSUCREACION                  IN T_SCOB_EXPED_ARCHIVO_CENTRAL.AUDUSUCREACION%TYPE,
    po_n_retorno                         out number,
    po_n_cod_error                       out number,
    po_v_msj_error                       out varchar2
  );
  
  procedure SCOB_SP_S_GENERAR_ENVIO_ARCH
  /*
  -----------------------------------------------------------
  -- Autor        : RMCA
  -- Creado       : 23.05.2011
  -- Proposito    : listar los expedientes a enviar a archivo central.
  -----------------------------------------------------------
  -- Modificacion :
  -- Autor        :
  -- Modificado   :
  -- Proposito    :
  -----------------------------------------------------------
  */
  /*
  (
    PI_N_ID_ARCHIVO_CENTRAL           IN T_SCOB_ARCHIVO_CENTRAL.ID_ARCHIVO_CENTRAL%TYPE,
    po_cu_retorno                     out cu_rec_set
  );
  */

  PROCEDURE SCOB_SP_S_LISTAR_EXPED_PERSONA
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 24.05.2011
    -- Proposito    : listar las personas asociadas a un expediente ó
                      listar las personas asociadas a un embargo de inscripcion.
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_N_ID_EXPEDIENTE         IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
   PI_N_ID_EXPEDIENTE_EMBARGO IN T_SCOB_EXPED_EMBARGO.ID_EXPEDIENTE_EMBARGO%TYPE,
   PI_I_COD_TIPO_ENTIDAD      IN T_SCOB_EXPEDIENTE_PERSONA.COD_TIPO_ENTIDAD%TYPE,
   PO_CU_RETORNO              OUT CU_REC_SET);

  PROCEDURE SCOB_SP_S_LIQUIDAR_COSTA
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 21.06.2011
    -- Proposito    : lista la liquidacion de costas a la fecha.
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_N_ID_EXPEDIENTE IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
   PO_CU_RETORNO_CAB  OUT CU_REC_SET,
   PO_CU_RETORNO      OUT CU_REC_SET);

  PROCEDURE SCOB_SP_S_LIQUID_ANTIDUMPING
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 26.07.2011
    -- Proposito    : Permite consultar la liquidacion antidumping
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_N_ID_MULTA     IN T_SCOB_MULTA.ID_MULTA%TYPE,
   PO_CU_RETORNO     OUT CU_REC_SET,
   PO_CU_RETORNO_DET OUT CU_REC_SET);

  PROCEDURE SCOB_SP_S_EXPEDIENTE_ANOTACION
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 05.09.2011
    -- Proposito    : consultas las anotaciones de un expediente
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_N_ID_EXPEDIENTE           IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
   PI_N_ID_EXPEDIENTE_ANOTACION IN T_SCOB_EXPEDIENTE_ANOTACION.ID_EXPEDIENTE_ANOTACION%TYPE,
   PO_CU_RETORNO                OUT CU_REC_SET);

  PROCEDURE SCOB_SP_I_EXPEDIENTE_ANOTACION
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 05.09.2011
    -- Proposito    : inserta las anotaciones de un expediente
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_N_ID_EXPEDIENTE       IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
   PI_V_DES_ANOTACION       IN T_SCOB_EXPEDIENTE_ANOTACION.DES_ANOTACION%TYPE,
   PI_N_ID_USUARIO_REGISTRO IN T_SCOB_EXPEDIENTE_ANOTACION.ID_USUARIO_REGISTRO%TYPE,
   PI_V_AUDUSUCREACION      IN T_SCOB_EXPEDIENTE_ANOTACION.AUDUSUCREACION%TYPE,
   PO_N_RETORNO             OUT NUMBER,
   PO_N_COD_ERROR           OUT NUMBER,
   PO_V_MSJ_ERROR           OUT VARCHAR2);

  PROCEDURE SCOB_SP_U_EXPEDIENTE_ANOTACION
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 05.09.2011
    -- Proposito    : actualiza las anotaciones de un expediente
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_N_ID_EXPEDIENTE_ANOTACION IN T_SCOB_EXPEDIENTE_ANOTACION.ID_EXPEDIENTE_ANOTACION%TYPE,
   PI_V_DES_ANOTACION           IN T_SCOB_EXPEDIENTE_ANOTACION.DES_ANOTACION%TYPE,
   PI_V_AUDUSUMODIFICACION      IN T_SCOB_EXPEDIENTE_ANOTACION.AUDUSUMODIFICACION%TYPE,
   PO_N_RETORNO                 OUT NUMBER,
   PO_N_COD_ERROR               OUT NUMBER,
   PO_V_MSJ_ERROR               OUT VARCHAR2);

  PROCEDURE SCOB_SP_D_EXPEDIENTE_ANOTACION
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 05.09.2011
    -- Proposito    : actualiza al estado eliminado las anotaciones de los expedientes
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_V_ID_EXPEDIENTE_ANOTACION IN VARCHAR2,
   PI_V_AUDUSUMODIFICACION      IN T_SCOB_EXPEDIENTE_ANOTACION.AUDUSUMODIFICACION%TYPE,
   PO_N_RETORNO                 OUT NUMBER,
   PO_N_COD_ERROR               OUT NUMBER,
   PO_V_MSJ_ERROR               OUT VARCHAR2);

  PROCEDURE SCOB_SP_S_DIREC_BY_SANC
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 01.03.2011
    -- Proposito    : consulta los domicilios del sancionado de una multa
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_N_ID_EXPEDIENTE       IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
   PI_N_ID_MULTA_SANCIONADO IN T_SCOB_MULTA_SANCIONADO.ID_MULTA_SANCIONADO%TYPE,
   PO_CU_RETORNO            OUT CU_REC_SET);

  PROCEDURE SCOB_SP_I_SOLIC_DESACUM
  /*
    -----------------------------------------------------------
    -- Autor        : @dcelis
    -- Creado       : 04.05.2017
    -- Proposito    : inserta las solicitudes de desacumulación de multas
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_V_ID_MULTA       IN VARCHAR2,
   PI_V_TIPO_DESTINO   IN VARCHAR2,
   PI_V_ID_EXP_DESTINO IN VARCHAR2,
   PI_N_ID_USUARIO     IN VARCHAR2,
   PO_N_RETORNO        OUT NUMBER,
   PO_N_COD_ERROR      OUT NUMBER,
   PO_V_MSJ_ERROR      OUT VARCHAR2);
  --
  PROCEDURE SCOB_SP_I_SOLIC_ACUM
  /*
    -----------------------------------------------------------
    -- Autor        : @dcelis
    -- Creado       : 04.05.2017
    -- Proposito    : inserta las solicitudes de desacumulación de multas
    -----------------------------------------------------------
    */
  (PI_V_ID_EXP_DESTINO IN VARCHAR2,
   PI_V_ID_EXP_ORIGEN  IN VARCHAR2,
   PI_N_ID_USUARIO     IN VARCHAR2,
   PO_N_RETORNO        OUT NUMBER,
   PO_N_COD_ERROR      OUT NUMBER,
   PO_V_MSJ_ERROR      OUT VARCHAR2);
  --
  PROCEDURE SCOB_SP_S_SOLIC_DESACUM
  /*
    -----------------------------------------------------------
    -- Autor        : @dcelis
    -- Creado       : 04.05.2017
    -- Proposito    : lista de las solicitudes de desacumulación por expediente
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_V_ID_EXPEDIENTE IN NUMBER,
   PI_V_ACCION        OUT VARCHAR2,
   PO_CU_RETORNO      OUT CU_REC_SET);
  --
  PROCEDURE SCOB_SP_S_MANT_SOLIC_DESACUM
  /*
    -----------------------------------------------------------
    -- Autor        : @dcelis
    -- Creado       : 08.05.2017
    -- Proposito    : lista de las solicitudes de desacumulación
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PO_CU_RETORNO OUT CU_REC_SET);
  --
  PROCEDURE SCOB_SP_S_REP_SOLIC_DESACUM
  /*
    -----------------------------------------------------------
    -- Autor        : @dcelis
    -- Creado       : 08.05.2017
    -- Proposito    : lista de las solicitudes de desacumulación
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_V_CUM          VARCHAR2,
   PI_V_EXP_ORIGEN   VARCHAR2,
   PI_V_EXP_DESTINO  VARCHAR2,
   PI_V_NRO_FILE     VARCHAR2,
   PI_N_TIPO_DESTINO NUMBER,
   PI_N_ESTADO_SOLIC NUMBER,
   PI_V_FECHA_INICIO VARCHAR2,
   PI_V_FECHA_FIN    VARCHAR2,
   PO_CU_RETORNO     OUT CU_REC_SET);
  --
  PROCEDURE SCOB_SP_SOLIC_DESACUM
  /*
    -----------------------------------------------------------
    -- Autor        : @dcelis
    -- Creado       : 08.05.2017
    -- Proposito    : lista de las solicitudes de desacumulación
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_V_CUM          VARCHAR2,
   PI_V_EXP_ORIGEN   VARCHAR2,
   PI_V_EXP_DESTINO  VARCHAR2,
   PI_V_NRO_FILE     VARCHAR2,
   PI_N_TIPO_DESTINO NUMBER,
   PI_N_ESTADO_SOLIC NUMBER,
   PI_V_FECHA_INICIO VARCHAR2,
   PI_V_FECHA_FIN    VARCHAR2,
   PO_CU_RETORNO     OUT CU_REC_SET);
  --
  PROCEDURE SCOB_SP_RPTA_SOLIC_DESACUM
  /*
    -----------------------------------------------------------
    -- Autor        : @dcelis
    -- Creado       : 08.05.2017
    -- Proposito    : Actualizar las solicitudes de desacumulación
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_V_ID_SOLIC     IN VARCHAR2,
   PI_V_MOTIVO       IN VARCHAR2,
   PI_N_ID_USUARIO   IN VARCHAR2,
   PI_V_ESTADO_SOLIC IN NUMBER,
   PO_N_RETORNO      OUT NUMBER,
   PO_N_COD_ERROR    OUT NUMBER,
   PO_V_MSJ_ERROR    OUT VARCHAR2);
  --
  PROCEDURE SCOB_SP_PROCESAR_DESACUM
  /*
    -----------------------------------------------------------
    -- Autor        : @dcelis
    -- Creado       : 08.05.2017
    -- Proposito    : Actualizar las solicitudes de desacumulación
    -----------------------------------------------------------*/
  (PI_N_ID_EXP_ORIGEN IN NUMBER,
   -- GENERAR DOCUMENTO
   PI_I_COD_TIPO_ASOCIACION IN T_SCOB_EXPED_COACTIVO_DOC.COD_TIPO_ASOCIACION%TYPE,
   PI_C_IND_TIPO_GENERACION T_SCOB_EXPED_COACTIVO_DOC.IND_TIPO_GENERACION%TYPE,
   PI_V_ID_EXPEDIENTE       IN VARCHAR2, --CADENA DE EXPEDIENTES
   PI_N_NRO_ITEMS           IN NUMBER,
   --
   PI_N_ID_MOTIVO        IN T_SCOB_EXPEDIENTE_ESTADO.ID_MOTIVO%TYPE,
   PI_V_ID_PLANTILLA     IN VARCHAR2, --CADENA DE PLANTILLAS (EL PRIMERO SIEMPRE DEBE SER LA RESOLUCION, SI ES EL CASO)
   PI_V_MOTIVO_PLANTILLA IN VARCHAR2, --CADENA DE MOTIVOS PLANTILLAS (EL PRIMERO SIEMPRE DEBE SER LA RESOLUCION, SI ES EL CASO)
   PI_N_NRO_ITEMSP       IN NUMBER, --SI SE ENVIAN DOS DOCUMENTO, SIEMPRE DEBE ESTAR LA REC PRIMERO.
   --
   PI_I_ESTADO_EXPEDIENTE IN T_SCOB_EXPEDIENTE_DOCUMENTO.ESTADO_EXPEDIENTE%TYPE,
   PI_N_ID_EXP_DOC_ORIGEN IN T_SCOB_EXPEDIENTE_DOCUMENTO.ID_EXPEDIENTE_DOCUMENTO_ORIGEN%TYPE,
   ---
   PI_V_TIPO_ENTIDAD    IN VARCHAR, --0=NINGUNO;1=PERSONA;2=BANCO;3=DIREC PERSONAS;4=SUNAT;5=PNP;6=SAT;7=CAJA METROPOLITANA
   PI_V_ID_TIPO_ENTIDAD IN VARCHAR, --entidades a quienes va dirigido
   PI_V_NRO_ITEMSTE     IN VARCHAR, --cadena con los numero de entidades a quienes ira dirigido
   --
   PI_N_ID_SERVICIO      IN NUMBER,
   PI_V_ID_TIPO_SERVICIO IN VARCHAR2,
   PI_C_FLG_UCI          IN CHAR,
   --
   PI_V_AUDUSUCREACION     IN T_SCOB_EXPEDIENTE_DOCUMENTO.AUDUSUCREACION%TYPE,
   PI_N_ID_USUARIO_INGRESO IN T_SCOB_USUARIO.ID_USUARIO%TYPE,
   PI_V_FEC_GENERACION_DOC IN VARCHAR,
   -- GENERAR DOCUMENTO
   PO_N_RETORNO   OUT NUMBER,
   PO_N_COD_ERROR OUT NUMBER,
   PO_V_MSJ_ERROR OUT VARCHAR2);
  --
  PROCEDURE SCOB_SP_U_ACTUALIZA_SOLIC
  /*
    -----------------------------------------------------------
    -- Autor        : @dcelis
    -- Creado       : 08.05.2017
    -- Proposito    : Actualizar los estados de impresion de las solicitudes de desacumulacion
    -----------------------------------------------------------
    */
  (PI_N_ID_EXP_ORIGEN IN VARCHAR2,
   PO_N_RETORNO       OUT NUMBER,
   PO_N_COD_ERROR     OUT NUMBER,
   PO_V_MSJ_ERROR     OUT VARCHAR2);
  --
  PROCEDURE SCOB_SP_S_VISTA_DOC_EXP
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 28.10.2011
    -- Proposito    : Consulta los documentos de la multa
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    -- Modificaciones:
    --@0001:JPHR:09.12.2016:Añade 3 campos nuevos: estado, fecha y
                          hora de tramite.
    --@0002:JPHR:17.02.2017:Añade campo de Fecha de Recepcion de
                            documentos UCI en AEC ya sea en
                            Multa-Documento-Gen o en Expediente-Documento
    -----------------------------------------------------------
    */
  (PI_N_ID_EXPEDIENTE IN VARCHAR2, PO_CU_RETORNO OUT CU_REC_SET);
  --
  FUNCTION SCOB_FN_SANCIONADOS_COD_INDEC(PI_N_ID_MULTA     IN T_SCOB_MULTA.ID_MULTA%TYPE,
                                         PI_N_NRO_PERSONAS IN INTEGER)
    RETURN VARCHAR2;

  FUNCTION SCOB_FN_DENUNCIADOS_MULTA(PI_N_ID_MULTA     IN T_SCOB_MULTA.ID_MULTA%TYPE,
                                     PI_N_NRO_PERSONAS IN INTEGER)
    RETURN VARCHAR2;

  FUNCTION SCOB_FN_DENUNCIANTES_MULTA(PI_N_ID_MULTA     IN T_SCOB_MULTA.ID_MULTA%TYPE,
                                      PI_N_NRO_PERSONAS IN INTEGER)
    RETURN VARCHAR2;

  FUNCTION SCOB_FN_SANCIONADOS_NRO_DOC(PI_N_ID_MULTA     IN T_SCOB_MULTA.ID_MULTA%TYPE,
                                       PI_N_NRO_PERSONAS IN INTEGER)
    RETURN VARCHAR2;

  FUNCTION SCOB_FN_SANCIONADOS_TIPO_DOC(PI_N_ID_MULTA     IN T_SCOB_MULTA.ID_MULTA%TYPE,
                                        PI_N_NRO_PERSONAS IN INTEGER)
    RETURN VARCHAR2;

  FUNCTION SCOB_FN_SANCIONADOS_REGION(PI_N_ID_MULTA     IN T_SCOB_MULTA.ID_MULTA%TYPE,
                                      PI_N_NRO_PERSONAS IN INTEGER)
    RETURN VARCHAR2;

  FUNCTION SCOB_FN_SANCIONADOS_CLAS_INDEC(PI_N_ID_MULTA     IN T_SCOB_MULTA.ID_MULTA%TYPE,
                                          PI_N_NRO_PERSONAS IN INTEGER)
    RETURN VARCHAR2;
  ----
  FUNCTION SCOB_FN_MUL_ANTIGUO(P_IN_ID_EXPEDIENTE IN NUMBER) RETURN NUMBER;
  ----
  FUNCTION SCOB_FN_ES_ACUM(P_IN_ID_EXPEDIENTE IN NUMBER) RETURN VARCHAR2;
  ----
  FUNCTION SCOB_FN_PAGOS(P_IN_ID_EXPEDIENTE IN NUMBER, P_IN_OP IN NUMBER)
    RETURN VARCHAR2;
  ----
  FUNCTION SCOB_FN_CUMS_EXP(P_IN_ID_EXPEDIENTE IN NUMBER) RETURN VARCHAR2;
  ----
  FUNCTION SCOB_FN_NRO_FILE_CUM_ALFA(P_IN_ID IN NUMBER, V_OP NUMBER)
    RETURN VARCHAR2;
  ----
  FUNCTION SCOB_FN_ES_CUM_ALFA(P_IN_ID IN NUMBER) RETURN VARCHAR2;
  ----
  FUNCTION SCOB_FN_COD_ESTADO_PAGO_EXP(P_IN_ID IN NUMBER) RETURN VARCHAR2;
  ----
  FUNCTION SCOB_FN_CUM_SOLIC_DESACUM(P_IN_ID IN NUMBER) RETURN VARCHAR2;
  ----
  PROCEDURE SCOB_SP_S_COMBO_MUL_CERO_EXP
    /*
    -----------------------------------------------------------
    -- Autor        : HCHALCO
    -- Creado       : 05.08.2021
    -- Proposito    : Cargar los combos para el formulario Multa Cero
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    : 
    -----------------------------------------------------------
    */
    (
      PI_VC_NOM_COMBO          IN VARCHAR2,
      PI_NU_ID_ESTADO_MULTA    IN NUMBER,
      PO_CU_RETORNO            OUT CU_REC_SET
    );
  ----
  PROCEDURE SCOB_SP_S_PER_MULTA_CERO
    /*
    -----------------------------------------------------------
    -- Autor        : HCHALCO
    -- Creado       : 05.08.2021
    -- Proposito    : Seleccionar usuarios que tienen para ejecutar página de Multa Cero
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    : 
    -----------------------------------------------------------
    */
    (
      PI_VC_USUARIO            IN VARCHAR2,
      PO_CU_RETORNO            OUT CU_REC_sET
    );
  ----
  PROCEDURE SCOB_SP_I_MULTA_CERO_EXP
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
      PI_VC_NRO_EXP_COBRANZA   IN VARCHAR2,
      PI_NU_TIPO_MULTA         IN NUMBER,
      PI_NU_ESTADO_EXP         IN NUMBER,
      PI_NU_MOTIVO_EXP         IN NUMBER,
      PI_DT_FECHA_ESTADO       IN VARCHAR2,
      PI_VC_USUARIO_LOGIN      IN VARCHAR2,
      PO_NU_RETORNO            OUT NUMBER,
      PO_NU_COD_ERROR     OUT NUMBER,
      PO_VC_MSJ_ERROR     OUT VARCHAR2
    );
    
    PROCEDURE SCOB_SP_S_EXP_MULTA_CERO
  /*
    -----------------------------------------------------------
    -- Autor        : HCHALCO
    -- Creado       : 10.08.2021
    -- Proposito    : Consulta de EXP para Multa cero.
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_V_NRO_EXPEDIENTE_INI IN VARCHAR2,
   PO_CU_RETORNO   OUT CU_REC_SET);
   
  -- ******************************************************************************
  -- Descripción: Procedure que retorna la lista estados de un expediente
  --
  --
  -- Output Parameters: PO_CU_RETORNO, PO_N_COD_ERROR , PO_V_MSJ_ERROR
  --
  --
  -- Author:      Victor Bendezú
  -- Proyecto:    Incidencias SICOB
  --
  -- Revisiones
  -- Fecha            Autor         Motivo del cambio    
  -- ----------------------------------------------------------------
  -- 30/12/2022     Victor Bendezú  Incidencias SICOB   
  -- ***************************************************************      
  PROCEDURE SCOB_SP_S_ESTADOS_EXPEDIENTE(PIN_VC_NRO_EXPEDIENTE IN VARCHAR2,
                                         POUT_CUR_RETORNO       OUT CU_REC_SET,
                                         POUT_NU_COD_ERROR      OUT NUMBER,
                                         POUT_VC_MSJ_ERROR      OUT VARCHAR2);
                                         
  -- ******************************************************************************
  -- Descripción: Procedure que retorna la lista estados de expediente
  --
  --
  -- Output Parameters: PO_CU_RETORNO, PO_N_COD_ERROR , PO_V_MSJ_ERROR
  --
  --
  -- Author:      Victor Bendezú
  -- Proyecto:    Incidencias SICOB
  --
  -- Revisiones
  -- Fecha            Autor         Motivo del cambio    
  -- ----------------------------------------------------------------
  -- 30/12/2022     Victor Bendezú  Incidencias SICOB   
  -- ***************************************************************      
  PROCEDURE SCOB_SP_S_ESTADO_EXPEDIENTE(POUT_CUR_RETORNO       OUT CU_REC_SET,
                                        POUT_NU_COD_ERROR      OUT NUMBER,
                                        POUT_VC_MSJ_ERROR      OUT VARCHAR2);
                                        
  -- ******************************************************************************
  -- Descripción: Procedure que retorna la lista motivos de expediente
  --
  --
  -- Output Parameters: PO_CU_RETORNO, PO_N_COD_ERROR , PO_V_MSJ_ERROR
  --
  --
  -- Author:      Victor Bendezú
  -- Proyecto:    Incidencias SICOB
  --
  -- Revisiones
  -- Fecha            Autor         Motivo del cambio    
  -- ----------------------------------------------------------------
  -- 30/12/2022     Victor Bendezú  Incidencias SICOB   
  -- ***************************************************************      
  PROCEDURE SCOB_SP_S_MOTIVO_EXPEDIENTE(PIN_NU_ID_ESTADO_EXPEDIENTE IN NUMBER,
                                        POUT_CUR_RETORNO             OUT CU_REC_SET,
                                        POUT_NU_COD_ERROR            OUT NUMBER,
                                        POUT_VC_MSJ_ERROR            OUT VARCHAR2);
                                        
  -- ******************************************************************************
  -- Descripción: Procedure que registra un nuevo estado al expediente
  --
  --
  -- Output Parameters: PO_N_COD_ERROR , PO_V_MSJ_ERROR
  --
  --
  -- Author:      Victor Bendezú
  -- Proyecto:    Incidencias SICOB
  --
  -- Revisiones
  -- Fecha            Autor         Motivo del cambio    
  -- ----------------------------------------------------------------
  -- 30/12/2022     Victor Bendezú  Incidencias SICOB   
  -- ***************************************************************      
  PROCEDURE SCOB_SP_I_ESTADOS_EXPEDIENTE(PIN_NU_ID_ESTADO_EXP  IN NUMBER,
                                         PIN_NU_ID_MOTIVO      IN NUMBER,
                                         PIN_NU_ID_EXPEDIENTE  IN NUMBER,
                                         PIN_NU_ID_MULTA       IN NUMBER,
                                         PIN_VC_FECHA_REGISTRO IN VARCHAR,
                                         PIN_VC_USUARIO        IN VARCHAR,
                                         POUT_NU_COD_ERROR      OUT NUMBER,
                                         POUT_VC_MSJ_ERROR      OUT VARCHAR2);
                                         
  -- ******************************************************************************
  -- Descripción: Procedure que revierte un expediente a no iniciado
  --
  --
  -- Output Parameters: PO_N_COD_ERROR , PO_V_MSJ_ERROR
  --
  --
  -- Author:      Victor Bendezú
  -- Proyecto:    Incidencias SICOB
  --
  -- Revisiones
  -- Fecha            Autor         Motivo del cambio    
  -- ----------------------------------------------------------------
  -- 30/12/2022     Victor Bendezú  Incidencias SICOB   
  -- ***************************************************************      
  PROCEDURE SCOB_SP_U_REVERTIR_EXPEDIENTE(PIN_NU_ID_EXPEDIENTE IN NUMBER,
                                          PIN_VC_USUARIO       IN VARCHAR,
                                          POUT_NU_COD_ERROR     OUT NUMBER,
                                          POUT_VC_MSJ_ERROR     OUT VARCHAR2);
                                          
  -- ******************************************************************************
  -- Descripción: Procedure que cambia estado de embargo a un expediente
  --
  --
  -- Output Parameters: PO_N_COD_ERROR , PO_V_MSJ_ERROR
  --
  --
  -- Author:      Victor Bendezú
  -- Proyecto:    Incidencias SICOB
  --
  -- Revisiones
  -- Fecha            Autor         Motivo del cambio    
  -- ----------------------------------------------------------------
  -- 30/12/2022     Victor Bendezú  Incidencias SICOB   
  -- ***************************************************************      
  PROCEDURE SCOB_SP_U_EMBARGO_EXPEDIENTE(PIN_NU_ID_EXPEDIENTE IN NUMBER,
                                         PIN_VC_FLG_EMBARGO   IN VARCHAR,
                                         PIN_VC_USUARIO       IN VARCHAR,
                                         POUT_NU_COD_ERROR     OUT NUMBER,
                                         POUT_VC_MSJ_ERROR     OUT VARCHAR2);

  -- ******************************************************************************
  -- Descripción: Procedure que genera asiento contable
  --
  --
  -- Output Parameters: PO_N_COD_ERROR , PO_V_MSJ_ERROR
  --
  --
  -- Author:      Victor Bendezú
  -- Proyecto:    Incidencias SICOB
  --
  -- Revisiones
  -- Fecha            Autor         Motivo del cambio    
  -- ----------------------------------------------------------------
  -- 30/12/2022     Victor Bendezú  Incidencias SICOB   
  -- ***************************************************************      
  PROCEDURE SCOB_SP_I_ASIENTO_CONTABLE(PIN_VC_CUM                     VARCHAR2,
                                       PIN_NU_TIPO_CAMBIO             NUMBER,
                                       PIN_VC_ANIO_NC                 VARCHAR2,
                                       PIN_VC_NRO_NC                  VARCHAR2,
                                       PIN_VC_DESC_TIPO_PAGO          VARCHAR2,
                                       PIN_VC_COD_ESTADO_PAGO         VARCHAR2,
                                       PIN_VC_DESC_CAJA               VARCHAR2,
                                       PIN_NU_MTO_CAPITAL             NUMBER,
                                       PIN_NU_MTO_IC                  NUMBER,
                                       PIN_NU_MTO_IM                  NUMBER,
                                       PIN_NU_MTO_CG                  NUMBER,
                                       PIN_NU_MTO_EXCESO              NUMBER,
                                       PIN_VC_GLOSA                   VARCHAR2,
                                       PIN_VC_DESC_TIPO_SUBCONTA      VARCHAR2,
                                       PIN_DT_GENERACION_CI           DATE,
                                       PIN_VC_USUARIO                 VARCHAR2,
                                       PIN_NU_TIPO_SUBCONTAB_COMP_REF NUMBER,
                                       PIN_VC_ANIO_COMP_REF           VARCHAR2,
                                       PIN_VC_NRO_COMP_REF            VARCHAR2,
                                       PIN_VC_TIPO_CONTABILIDAD       VARCHAR2,
                                       PIN_NU_MTO_AMORTIZADO          NUMBER,
                                       PIN_VC_DESC_BANCO              VARCHAR2,
                                       PIN_NU_ID_MONEDA               NUMBER,
                                       PIN_VC_DESC_MONEDA             VARCHAR2,
                                       PIN_NU_IMPORTE_SOLES           NUMBER,
                                       PIN_NU_IMPORTE_DOLARES         NUMBER,
                                       PIN_DT_PROCESO                 DATE,
                                       PIN_VC_NRO_DOC_BANCO           VARCHAR2,
                                       PO_N_COD_ERROR                 OUT NUMBER,
                                       PO_V_MSJ_ERROR                 OUT VARCHAR2);
                                       
  -- ******************************************************************************
  -- Descripción: Procedure que retorna la lista cums de un expediente acumulador
  --
  --
  -- Output Parameters: PO_CU_RETORNO, PO_N_COD_ERROR , PO_V_MSJ_ERROR
  --
  --
  -- Author:      Victor Bendezú
  -- Proyecto:    Incidencias SICOB
  --
  -- Revisiones
  -- Fecha            Autor         Motivo del cambio    
  -- ----------------------------------------------------------------
  -- 30/12/2022     Victor Bendezú  Incidencias SICOB   
  -- ***************************************************************      
  PROCEDURE SCOB_SP_S_CUMS_EXPEDIENTE(PIN_NU_ID_EXPEDIENTE IN NUMBER,
                                      POUT_CUR_RETORNO    OUT CU_REC_SET,
                                      POUT_NU_COD_ERROR   OUT NUMBER,
                                      POUT_VC_MSJ_ERROR   OUT VARCHAR2);
                                      
  -- ******************************************************************************
  -- Descripción: Procedure que retorna la lista ccstas de un cums de un expediente
  --
  --
  -- Output Parameters: PO_CU_RETORNO, PO_N_COD_ERROR , PO_V_MSJ_ERROR
  --
  --
  -- Author:      Victor Bendezú
  -- Proyecto:    Incidencias SICOB
  --
  -- Revisiones
  -- Fecha            Autor         Motivo del cambio    
  -- ----------------------------------------------------------------
  -- 30/12/2022     Victor Bendezú  Incidencias SICOB   
  -- ***************************************************************      
  PROCEDURE SCOB_SP_S_COSTAS_CUM_EXPEDIENT(PIN_NUID_EXPEDIENTE     IN NUMBER,
                                            PIN_NUCUM_ID_EXPEDIENTE IN NUMBER,
                                            POUT_CUR_RETORNO        OUT CU_REC_SET,
                                            POUT_NU_COD_ERROR       OUT NUMBER,
                                            POUT_VC_MSJ_ERROR       OUT VARCHAR2);

  -- ******************************************************************************
  -- Descripción: Procedure que registra una costa en un cum expediente acumulado
  --
  --
  -- Output Parameters: PO_CU_RETORNO, PO_N_COD_ERROR , PO_V_MSJ_ERROR
  --
  --
  -- Author:      Victor Bendezú
  -- Proyecto:    Incidencias SICOB
  --
  -- Revisiones
  -- Fecha            Autor         Motivo del cambio    
  -- ----------------------------------------------------------------
  -- 30/12/2022     Victor Bendezú  Incidencias SICOB   
  -- ***************************************************************                                 
PROCEDURE SCOB_SP_I_SCOB_CUM_EXPED_COSTA(PIN_NU_ID_EXPEDIENTE           IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
                                           PIN_NU_ID_CUM_EXPEDIENTE       IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
                                           PIN_NU_ID_EXPEDIENTE_DOCUMENTO IN T_SCOB_EXPEDIENTE_DOCUMENTO.ID_EXPEDIENTE_DOCUMENTO%TYPE,
                                           PIN_VC_ID_COSTAS               IN VARCHAR2,
                                           PIN_VC_POR_COSTAS              IN VARCHAR2,
                                           PIN_VC_VAL_COSTAS              IN VARCHAR2,
                                           PIN_VC_CNT_COSTAS              IN VARCHAR2,
                                           PIN_VC_SUB_TOTAL_COSTAS        IN VARCHAR2,
                                           PIN_NU_TOTAL_COSTAS            IN T_SCOB_EXPEDIENTE.MONTO_COSTAS%TYPE,
                                           PIN_NU_NRO_ITEMS               IN INTEGER,
                                           PIN_VC_AUDUSUCREACION          IN T_SCOB_EXPEDIENTE_DOCUMENTO.AUDUSUCREACION%TYPE,
                                           PIN_CH_FLG_AGREGAR             IN CHAR,
                                           POUT_NU_COD_ERROR              OUT NUMBER,
                                           POUT_VC_MSJ_ERROR              OUT VARCHAR2);
                                   
END SCOB_PK_EXPEDIENTE;
/
CREATE OR REPLACE PACKAGE BODY SCOB_PK_EXPEDIENTE IS
  --@0001:2013.06.12:OBS.NRO.44:Se corrigi? para no permitir actualizar costas con valores negativos.
  --@0002:2013.09.23:OBS.NRO.62:Se corrigi? para que no muestre las oostas duplicadas.
  ----
  -- Author:      Victor Bendezú
  -- Proyecto:    Incidencias SICOB
  EX_CONTROLADO EXCEPTION;
  
  PROCEDURE SCOB_SP_S_EXPEDIENTE
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 04.04.2011
    -- Proposito    : Consulta las expedientes generados.
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_C_EVENTO             IN CHAR, --1=GENERAR EXPED; 2=COB.PRE-COACTIVA y COACTIVA;
   PI_V_NRO_EXPEDIENTE_INI IN VARCHAR2,
   PI_V_NRO_EXPEDIENTE_FIN IN VARCHAR2,
   PI_C_FEC_ASI_INI        IN CHAR,
   PI_C_FEC_ASI_FIN        IN CHAR,
   PI_C_FEC_INI            IN CHAR,
   PI_C_FEC_FIN            IN CHAR,
   PI_V_ESTADO_EXPEDIENTE  IN VARCHAR,
   PI_N_COD_ORGANO_RESOL   IN T_SCOB_MULTA_DETAL.ID_ORGANO_RESOLUTIVO%TYPE,
   PI_N_SALDO_INI          IN T_SCOB_EXPEDIENTE.MONTO_UIT%TYPE,
   PI_N_SALDO_FIN          IN T_SCOB_EXPEDIENTE.MONTO_UIT%TYPE,
   PI_C_DPTO               IN T_SCOB_UBIGEO.COD_DPTO%TYPE,
   PI_C_PROV               IN T_SCOB_UBIGEO.COD_PROV%TYPE,
   PI_C_DSTO               IN T_SCOB_UBIGEO.COD_DIST%TYPE,
   PI_N_COD_MATERIA        IN T_SCOB_MULTA.ID_MATERIA%TYPE,
   --
   PI_I_TIPO_PERSONA     IN T_SCOB_PERSONA.TIPO_PERSONA%TYPE,
   PI_I_TIPO_DOC         IN T_SCOB_PERSONA.TIPO_DOC%TYPE,
   PI_V_NRO_DOC          IN T_SCOB_PERSONA.NRO_DOC%TYPE,
   PI_V_APE_PATERNO      IN T_SCOB_PERSONA.APE_PATERNO%TYPE,
   PI_V_APE_MATERNO      IN T_SCOB_PERSONA.APE_MATERNO%TYPE,
   PI_V_PRI_NOMBRE       IN T_SCOB_PERSONA.PRI_NOMBRE%TYPE,
   PI_V_SEG_NOMBRE       IN T_SCOB_PERSONA.SEG_NOMBRE%TYPE,
   PI_V_RAZON_SOCIAL     IN T_SCOB_PERSONA.RAZON_SOCIAL%TYPE,
   PI_V_NOMBRE_COMERCIAL IN T_SCOB_PERSONA.NOMBRE_COMERCIAL%TYPE,
   PI_C_ESTADO           IN T_SCOB_EXPEDIENTE.ESTADO%TYPE,
   --
   PI_N_ID_USUARIO IN T_SCOB_USUARIO.ID_USUARIO%TYPE,
   PO_CU_RETORNO   OUT CU_REC_SET) AS
    C_ESTADO CHAR(1);
    --
    V_SELECT CLOB;
    V_A1     CLOB;
    V_A2     CLOB;
    V_QUERY  CLOB;
    --
  BEGIN
    --
    SELECT DECODE(PI_C_ESTADO, '', '*', PI_C_ESTADO)
      INTO C_ESTADO
      FROM DUAL;
  
    SELECT DECODE(PI_C_ESTADO, '', '*', PI_C_ESTADO)
      INTO C_ESTADO
      FROM DUAL;
  
    OPEN PO_CU_RETORNO FOR
      SELECT *
        FROM (SELECT EXPE.ID_EXPEDIENTE AS COD_EXPEDIENTE,
                      EXPE.NRO_EXPEDIENTE AS NRO_EXPEDIENTE,
                      EXPE.ANIO AS ANIO_EXPEDIENTE,
                      EXPE.ANIO || EXPE.NRO_EXPEDIENTE AS NRO_EXPED, --AÑO+NRO
                      --
                      EXPE.ESTADO_EXPEDIENTE AS COD_ESTADO_EXPEDIENTE,
                      ESEC.DESCRIPCION       AS NOM_ESTADO_EXPEDIENTE,
                      EXPE.ID_MOTIVO         AS COD_MOTIVO,
                      MOTI.DESCRIPCION       AS NOM_MOTIVO,
                      --
                      EXPE.AUDUSUCREACION AS GENERADO_POR,
                      EXPE.AUDFECCREACION AS FEC_GENERADO_POR,
                      --
                      MRES.TXT_DESCRIPCION AS TIPO_EXPEDIENTE,
                      DECODE(EXPE.FLG_TIPO_EXPEDIENTE,
                             '1',
                             PERS.COD_SANCIONADO,
                             '0') AS COD_SANCIONADO,
                      DECODE(EXPE.FLG_TIPO_EXPEDIENTE,
                             '1',
                             DECODE(PERS.TIPO_PERSONA,
                                    SCOB_PK_CONSTANTES.C_TIPO_PERS_JURIDICA,
                                    PERS.RAZON_SOCIAL,
                                    PERS.APE_PATERNO || ' ' || PERS.APE_MATERNO || ' ' ||
                                    PERS.PRI_NOMBRE || ' ' || PERS.SEG_NOMBRE || ' ' ||
                                    PERS.APE_CASADA),
                             SCOB_FN_SANCIONADOS_EXPED(EXPE.ID_EXPEDIENTE)) AS NOM_SANCIONADO,
                      --
                      EXPE.NRO_CUMS AS NRO_CUMS,
                      MULT.ANIO || MULT.CUM AS NUM_CUM,
                      MULT.NRO_FILE_AEC AS NRO_FILE_AEC,
                      
                      --DATOS ANTIDUMPING --NUEVOS
                      DECODE(NVL(MUAN.NRO_LIQUIDACION_CODIGO, ' '),
                             ' ',
                             NULL,
                             MUAN.NRO_LIQUIDACION_CODIGO || '-' ||
                             MUAN.NRO_LIQUIDACION_ANIO || '/' ||
                             MUAN.NRO_LIQUIDACION_CORRELATIVO) AS NRO_LIQUIDACION,
                      
                      /* INI: JCARRION@20170810
                      --montos deuda antidumping
                      MUAN.TIPO_CAMBIO AS TIPO_CAMBIO,
                      MUAN.MONTO_ANTIDUMPING AS MONTO_ANTIDUMPING,
                      MUAN.MONTO_INTERES AS MONTO_DA_INTERES,
                      MUAN.MONTO_INTERES_MORATORIO AS MONTO_DA_INTERES_MORATORIO,
                      MUAN.MONTO_TOTAL AS MONTO_TOTAL_DEUDA_DA,
                      */
                      --montos deuda antidumping
                      MUAN.TIPO_CAMBIO AS TIPO_CAMBIO,
                      SUM(MUAN.MONTO_ANTIDUMPING) OVER(PARTITION BY EXPE.ID_EXPEDIENTE) AS MONTO_ANTIDUMPING,
                      SUM(MUAN.MONTO_INTERES) OVER(PARTITION BY EXPE.ID_EXPEDIENTE) AS MONTO_DA_INTERES,
                      SUM(MUAN.MONTO_INTERES_MORATORIO) OVER(PARTITION BY EXPE.ID_EXPEDIENTE) AS MONTO_DA_INTERES_MORATORIO,
                      SUM(MUAN.MONTO_TOTAL) OVER(PARTITION BY EXPE.ID_EXPEDIENTE) AS MONTO_TOTAL_DEUDA_DA,
                      
                      /* INI: JCARRION@20170810
                      --montos deuda uit
                      MDET.VALOR_UIT AS UIT_VALOR,
                      MULT.MONTO_UIT AS UIT_MONTO,
                      MULT.MONTO_INTERES AS MONTO_IC,
                      MULT.MONTO_INTERES_MORATORIO AS MONTO_IM,
                      MULT.MONTO_COSTAS AS MONTO_COSTAS,
                      MULT.MONTO_TOTAL_DEUDA AS MONTO_TOTAL_DEUDA,
                      */
                      --montos deuda uit
                      SUM(MDET.VALOR_UIT) OVER(PARTITION BY EXPE.ID_EXPEDIENTE) AS UIT_VALOR,
                      SUM(MULT.MONTO_UIT) OVER(PARTITION BY EXPE.ID_EXPEDIENTE) AS UIT_MONTO,
                      SUM(MULT.MONTO_INTERES) OVER(PARTITION BY EXPE.ID_EXPEDIENTE) AS MONTO_IC,
                      SUM(MULT.MONTO_INTERES_MORATORIO) OVER(PARTITION BY EXPE.ID_EXPEDIENTE) AS MONTO_IM,
                      SUM(MULT.MONTO_COSTAS) OVER(PARTITION BY EXPE.ID_EXPEDIENTE) AS MONTO_COSTAS,
                      SUM(MULT.MONTO_TOTAL_DEUDA) OVER(PARTITION BY EXPE.ID_EXPEDIENTE) AS MONTO_TOTAL_DEUDA,
                      
                      /* INI: JCARRION@20170810
                      --montos amortizado
                      MULT.TOTAL_AMORTIZADO AS TOTAL_AMORTIZADO_UIT,
                      MULT.TOTAL_AMORTIZADO_IC AS MONTO_AMORTIZADO_IC,
                      MULT.TOTAL_AMORTIZADO_IM AS MONTO_AMORTIZADO_IM,
                      MULT.TOTAL_AMORTIZADO_COSTAS AS MONTO_AMORTIZADO_COSTAS,
                      MULT.TOTAL_AMORTIZACION_DEUDA AS MONTO_TOTAL_AMORTIZADO,
                      */
                      --montos amortizado
                      SUM(MULT.TOTAL_AMORTIZADO) OVER(PARTITION BY EXPE.ID_EXPEDIENTE) AS TOTAL_AMORTIZADO_UIT,
                      SUM(MULT.TOTAL_AMORTIZADO_IC) OVER(PARTITION BY EXPE.ID_EXPEDIENTE) AS MONTO_AMORTIZADO_IC,
                      SUM(MULT.TOTAL_AMORTIZADO_IM) OVER(PARTITION BY EXPE.ID_EXPEDIENTE) AS MONTO_AMORTIZADO_IM,
                      SUM(MULT.TOTAL_AMORTIZADO_COSTAS) OVER(PARTITION BY EXPE.ID_EXPEDIENTE) AS MONTO_AMORTIZADO_COSTAS,
                      SUM(MULT.TOTAL_AMORTIZACION_DEUDA) OVER(PARTITION BY EXPE.ID_EXPEDIENTE) AS MONTO_TOTAL_AMORTIZADO,
                      
                      /* INI: JCARRION@20170810 
                      --montos_saldo
                      EXPE.SALDO AS SALDO_UIT,
                      EXPE.SALDO_IC AS SALDO_INTERES_COMPENSATORIO,
                      EXPE.SALDO_IM AS SALDO_INTERES_MORATORIO,
                      EXPE.SALDO_COSTAS AS SALDO_COSTAS,
                      EXPE.SALDO_TOTAL_DEUDA AS SALDO_TOTAL,
                      */
                      SUM(EXPE.SALDO) OVER(PARTITION BY EXPE.ID_EXPEDIENTE) AS SALDO_UIT,
                      SUM(EXPE.SALDO_IC) OVER(PARTITION BY EXPE.ID_EXPEDIENTE) AS SALDO_INTERES_COMPENSATORIO,
                      SUM(EXPE.SALDO_IM) OVER(PARTITION BY EXPE.ID_EXPEDIENTE) AS SALDO_INTERES_MORATORIO,
                      SUM(EXPE.SALDO_COSTAS) OVER(PARTITION BY EXPE.ID_EXPEDIENTE) AS SALDO_COSTAS,
                      SUM(EXPE.SALDO_TOTAL_DEUDA) OVER(PARTITION BY EXPE.ID_EXPEDIENTE) AS SALDO_TOTAL,
                      
                      --------------------------------------------------------------------------------
                      
                      NVL(DOCS.NRO_DOCS, 0) AS NRO_DOCS,
                      NVL(EXPE_EMB.NRO_EMBARGOS, 0) AS NRO_EMBARGOS,
                      ARCH_CEN.FEC_ENVIO AS FEC_ARCHIVO_CENTRAL,
                      DECODE(NVL(DIREC.FLG_DIR, 0), 0, '0', '1') AS FLG_DOMICILIO,
                      NVL(EXPE.FLG_CANCELADO, '0') AS IND_CANCELADO,
                      MULT.FLG_MULTA_RESOLUTIVO AS FLG_TIPO_MULTA_OR,
                      EXPE.ESTADO AS ESTADO_REGISTRO,
                      SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_ESTADO_REGISTRO,
                                                               EXPE.ESTADO) AS DES_ESTADO_REGISTRO,
                      ORGA.DESCRIPCION AS DES_ORGA_RESOL,
                      MULT.NRO_FILE_AEC AS NRO_FILE,
                      MULT.ANIO_FILE_AEC AS ANIO_FILE,
                      ACOB.CODIGO AS COD_AREA_COB,
                      DECODE(MUAN.ID_MULTA_ANTIDUMPING, NULL, '0', '1') AS IND_ANTIDUMPING,
                      MDET.ID_MULTA_DETAL AS ID_MULTA_DETAL,
                      MULT.COD_ESTADO_PAGO AS COD_ESTADO_DEUDA, --3=Pago Total
                      --3 AS COD_ESTADO_DEUDA --3=Pago Total
                      USU.PRI_NOMBRE || ' ' || USU.APE_PATERNO || ' ' ||
                      USU.APE_MATERNO AS EXPED_ASIGNADO_A, --EJECUTOR COACTIVO RESPONSABLE 2013.02.12
                      
                      -- INI DCELIS/JCARRION@20170810
                      USR_SICOB.SCOB_PK_EXPEDIENTE.SCOB_FN_ES_ACUM(EXPE.ID_EXPEDIENTE) AS ES_ACUM,
                      USR_SICOB.SCOB_PK_MULTAS.SCOB_FN_HAS_ADJ_ANOT(EXPE.ID_EXPEDIENTE,
                                                                    1) AS HAS_ADJ_ANOT,
                      ROW_NUMBER() OVER(PARTITION BY EXPE.ID_EXPEDIENTE ORDER BY EXMU.ID_EXPEDIENTE_MULTA) AS NRO_ORDEN_CUM,
                      -- Victor Bendezu - Se agrega flag de embargo
                      EXPE.FLG_EMBARGO AS FLG_EMBARGO
               -- FIN
               
                 FROM T_SCOB_EXPEDIENTE EXPE
               
                INNER JOIN T_SCOB_EXPEDIENTE_MULTA EXMU
                   ON (EXMU.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE AND
                      EXMU.ESTADO =
                      DECODE(C_ESTADO, '*', EXMU.ESTADO, PI_C_ESTADO))
               
                INNER JOIN T_SCOB_MULTA MULT
                   ON (MULT.ID_MULTA = EXMU.ID_MULTA)
               
                 LEFT JOIN T_SCOB_USUARIO USU
                   ON (USU.ID_USUARIO = MULT.ID_USUARIO_ASIG_COBRANZA)
               
               --SANCIONADO
                INNER JOIN (SELECT MDET.ID_MULTA AS ID_MULTA,
                                  COUNT(MDET.ID_MULTA) AS NRO_MULTAS
                             FROM T_SCOB_MULTA_DETAL MDET
                            INNER JOIN T_SCOB_MULTA_SANCIONADO SANC
                               ON (SANC.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL AND
                                  NVL(SANC.COD_TIPO_PERSONA, '1') = '1' AND
                                  SANC.ESTADO = '1')
                            INNER JOIN T_SCOB_PERSONA PERS
                               ON (PERS.ID_PERSONA = SANC.ID_PERSONA)
                            WHERE MDET.FLG_ACTUAL = '1'
                              AND MDET.ESTADO = '1'
                              AND (NVL(PI_I_TIPO_PERSONA, 0) = 0 OR
                                  (NVL(PI_I_TIPO_PERSONA, 0) <> 0 AND
                                  PERS.TIPO_PERSONA = PI_I_TIPO_PERSONA))
                              AND (NVL(PI_I_TIPO_DOC, 0) = 0 OR
                                  (NVL(PI_I_TIPO_DOC, 0) <> 0 AND
                                  PERS.TIPO_DOC = PI_I_TIPO_DOC))
                              AND (NVL(PI_V_NRO_DOC, ' ') = ' ' OR
                                  (NVL(PI_V_NRO_DOC, ' ') <> ' ' AND
                                  TRIM(PERS.NRO_DOC) = TRIM(PI_V_NRO_DOC)))
                              AND (NVL(PI_V_APE_PATERNO, ' ') = ' ' OR
                                  (NVL(PI_V_APE_PATERNO, ' ') <> ' ' AND
                                  FUN_SCOB_NOSENSITE(TRIM(PERS.APE_PATERNO)) LIKE
                                  '%' ||
                                  FUN_SCOB_NOSENSITE(TRIM(PI_V_APE_PATERNO)) || '%'))
                              AND (NVL(PI_V_APE_MATERNO, ' ') = ' ' OR
                                  (NVL(PI_V_APE_MATERNO, ' ') <> ' ' AND
                                  FUN_SCOB_NOSENSITE(TRIM(PERS.APE_MATERNO)) LIKE
                                  '%' ||
                                  FUN_SCOB_NOSENSITE(TRIM(PI_V_APE_MATERNO)) || '%'))
                              AND (NVL(PI_V_PRI_NOMBRE, ' ') = ' ' OR
                                  (NVL(PI_V_PRI_NOMBRE, ' ') <> ' ' AND
                                  FUN_SCOB_NOSENSITE(TRIM(PERS.PRI_NOMBRE)) LIKE
                                  '%' ||
                                  FUN_SCOB_NOSENSITE(TRIM(PI_V_PRI_NOMBRE)) || '%'))
                              AND (NVL(PI_V_SEG_NOMBRE, ' ') = ' ' OR
                                  (NVL(PI_V_SEG_NOMBRE, ' ') <> ' ' AND
                                  FUN_SCOB_NOSENSITE(TRIM(PERS.SEG_NOMBRE)) LIKE
                                  '%' ||
                                  FUN_SCOB_NOSENSITE(TRIM(PI_V_SEG_NOMBRE)) || '%'))
                              AND (NVL(PI_V_RAZON_SOCIAL, ' ') = ' ' OR
                                  (NVL(PI_V_RAZON_SOCIAL, ' ') <> ' ' AND
                                  FUN_SCOB_NOSENSITE(TRIM(PERS.RAZON_SOCIAL)) LIKE
                                  '%' ||
                                  FUN_SCOB_NOSENSITE(TRIM(PI_V_RAZON_SOCIAL)) || '%'))
                              AND (NVL(PI_V_NOMBRE_COMERCIAL, ' ') = ' ' OR
                                  (NVL(PI_V_NOMBRE_COMERCIAL, ' ') <> ' ' AND
                                  FUN_SCOB_NOSENSITE(TRIM(PERS.NOMBRE_COMERCIAL)) LIKE
                                  '%' ||
                                  FUN_SCOB_NOSENSITE(TRIM(PI_V_NOMBRE_COMERCIAL)) || '%'))
                            GROUP BY MDET.ID_MULTA) MULTA_SANC
                   ON (MULTA_SANC.ID_MULTA = MULT.ID_MULTA)
               
                INNER JOIN T_SCOB_MULTA_DETAL MDET
                   ON (MDET.ID_MULTA = MULTA_SANC.ID_MULTA AND
                      MDET.FLG_ACTUAL = '1')
               
                INNER JOIN T_SCOB_MULTA_SANCIONADO MSAN
                   ON (MSAN.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL AND
                      MSAN.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO AND
                      MSAN.FLG_PRINCIPAL = '1' AND
                      NVL(MSAN.COD_TIPO_PERSONA, '1') = '1')
               
                INNER JOIN T_SCOB_PERSONA PERS
                   ON (PERS.ID_PERSONA = MSAN.ID_PERSONA)
               
                INNER JOIN T_SCOB_ORGANO_RESOLUTIVO ORGA
                   ON (ORGA.ID_ORGANO_RESOLUTIVO = MDET.ID_ORGANO_RESOLUTIVO)
               
                INNER JOIN T_SCOB_EST_EXP_COB ESEC
                   ON (TO_NUMBER(ESEC.CODIGO) = EXPE.ESTADO_EXPEDIENTE)
               
                INNER JOIN T_SCOB_EST_EXP_COB_MOTIVO MOTI
                   ON (MOTI.ID_EST_EXP_COB = EXPE.ESTADO_EXPEDIENTE AND
                      MOTI.ID_MOTIVO = EXPE.ID_MOTIVO)
               
                 LEFT JOIN T_SCOB_MULTA_ANTIDUMPING MUAN
                   ON (MUAN.ID_MULTA = MDET.ID_MULTA)
               
                 LEFT JOIN T_SCOB_TABLA_DET MRES
                   ON (MRES.ID_TABLA =
                      SCOB_PK_CONSTANTES.C_TBL_TIPO_RESP_MULTA_OR AND
                      LTRIM(RTRIM(MRES.COD_INTERNO)) =
                      LTRIM(RTRIM(MULT.FLG_TIPO_MULTA)))
               
                 LEFT JOIN (SELECT EXDO.ID_EXPEDIENTE AS ID_EXPEDIENTE,
                                  COUNT(EXDO.ID_EXPEDIENTE_DOCUMENTO) AS NRO_DOCS
                             FROM T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
                            WHERE (COD_GENERADOR_DOCUMENTO IS NOT NULL AND
                                  EXDO.ESTADO = '1')
                           /*
                           AND EXDO.TIPO_DOC_ASOC IN (
                             SCOB_PK_CONSTANTES.C_TIPO_DOC_ASOC_SISTEMA,
                             SCOB_PK_CONSTANTES.C_TIPO_DOC_ASOC_SISTEMA_ACT
                           )
                           */
                            GROUP BY EXDO.ID_EXPEDIENTE
                           
                           ) DOCS
                   ON (DOCS.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE)
               
                 LEFT JOIN (SELECT EXDI.ID_EXPEDIENTE AS ID_EXPEDIENTE,
                                  COUNT(EXDI.ID_EXPEDIENTE_PERSONA) AS FLG_DIR
                             FROM T_SCOB_EXPEDIENTE_PERSONA EXDI
                            WHERE EXDI.ESTADO =
                                  SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
                              AND EXDI.COD_TIPO_ENTIDAD =
                                  SCOB_PK_CONSTANTES.C_COD_ENTIDAD_PERSONA --PERSONAS
                            GROUP BY EXDI.ID_EXPEDIENTE
                           HAVING COUNT(EXDI.ID_EXPEDIENTE_PERSONA) > 0) DIREC
                   ON (DIREC.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE)
               
                 LEFT JOIN T_SCOB_MULTA_ARCHIVO_CENTRAL MULTA_ARCH
                   ON (MULTA_ARCH.ID_MULTA = MDET.ID_MULTA AND
                      MULTA_ARCH.FLG_ACTUAL = '1')
               
                 LEFT JOIN T_SCOB_ARCHIVO_CENTRAL ARCH_CEN
                   ON (ARCH_CEN.ID_ARCHIVO_CENTRAL =
                      MULTA_ARCH.ID_ARCHIVO_CENTRAL)
               
                 LEFT JOIN (SELECT EMB.ID_EXPEDIENTE,
                                  COUNT(EMB.ID_EXPEDIENTE_EMBARGO) AS NRO_EMBARGOS
                             FROM T_SCOB_EXPED_EMBARGO EMB
                            WHERE EMB.ESTADO =
                                  SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
                              AND EMB.COD_ESTADO_EMBARGO =
                                  SCOB_PK_CONSTANTES.C_EST_SOLIC_EMB_PENDIENTE --EMBARGOS PENDIENTES.
                            GROUP BY EMB.ID_EXPEDIENTE) EXPE_EMB
                   ON EXPE_EMB.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
               
                 LEFT JOIN T_SCOB_AREA_COBRANZA ACOB
                   ON (ACOB.ID_AREA_COBRANZA = MULT.ID_AREA_COBRANZA)
               
                WHERE
               ----------
                (NVL(PI_C_DPTO, ' ') = ' ' OR
                (NVL(PI_C_DPTO, ' ') <> ' ' AND
                TRIM(ORGA.COD_DPTO) = TRIM(PI_C_DPTO)))
             AND (NVL(PI_C_PROV, ' ') = ' ' OR
                (NVL(PI_C_PROV, ' ') <> ' ' AND
                TRIM(ORGA.COD_PROV) = TRIM(PI_C_PROV)))
             AND (NVL(PI_C_DSTO, ' ') = ' ' OR
                (NVL(PI_C_DSTO, ' ') <> ' ' AND
                TRIM(ORGA.COD_DIST) = TRIM(PI_C_DSTO)))
               
             AND (NVL(PI_N_COD_MATERIA, 0) = 0 OR
                (NVL(PI_N_COD_MATERIA, 0) <> 0 AND
                MULT.ID_MATERIA = PI_N_COD_MATERIA))
               ----------
               
             AND (NVL(PI_V_ESTADO_EXPEDIENTE, ' ') = ' ' OR
                (NVL(PI_V_ESTADO_EXPEDIENTE, ' ') <> ' ' AND
                TRIM(EXPE.ESTADO_EXPEDIENTE) = TRIM(PI_V_ESTADO_EXPEDIENTE)))
             AND (NVL(PI_N_COD_ORGANO_RESOL, 0) = 0 OR
                (NVL(PI_N_COD_ORGANO_RESOL, 0) <> 0 AND
                ORGA.ID_ORGANO_RESOLUTIVO = PI_N_COD_ORGANO_RESOL))
             AND ((NVL(PI_V_NRO_EXPEDIENTE_INI, ' ') = ' ') OR 
                (NVL(PI_V_NRO_EXPEDIENTE_INI, ' ') <> ' ' AND
                TO_NUMBER(EXPE.ANIO || TRIM(EXPE.NRO_EXPEDIENTE)) BETWEEN
                TO_NUMBER(TRIM(PI_V_NRO_EXPEDIENTE_INI)) AND
                TO_NUMBER(TRIM(NVL(PI_V_NRO_EXPEDIENTE_FIN,
                                     PI_V_NRO_EXPEDIENTE_INI)))))
             AND ((NVL(PI_C_FEC_INI, ' ') = ' ') OR
                (NVL(PI_C_FEC_INI, ' ') <> ' ' AND
                TO_DATE(TO_CHAR(EXPE.AUDFECCREACION, 'DD/MM/YYYY'),
                          'DD/MM/YYYY') BETWEEN
                TO_DATE(PI_C_FEC_INI, 'DD/MM/YYYY') AND
                TO_DATE(PI_C_FEC_FIN, 'DD/MM/YYYY')))
               ---NVO FECHA ASIGNACION
             AND ((NVL(PI_C_FEC_ASI_INI, ' ') = ' ') OR
                (NVL(PI_C_FEC_ASI_INI, ' ') <> ' ' AND
                TO_DATE(TO_CHAR(MULT.FECHA_ASIG_COBRANZA, 'DD/MM/YYYY'),
                          'DD/MM/YYYY') BETWEEN
                TO_DATE(PI_C_FEC_ASI_INI, 'DD/MM/YYYY') AND
                TO_DATE(PI_C_FEC_ASI_FIN, 'DD/MM/YYYY')))
               -------------------
             AND ((NVL(PI_N_SALDO_INI, 0) = 0) OR
                (NVL(PI_N_SALDO_INI, 0) <> 0 AND
                EXPE.SALDO BETWEEN PI_N_SALDO_INI AND PI_N_SALDO_FIN))
             AND (NVL(PI_N_ID_USUARIO, 0) = 0 OR
                NVL(PI_N_ID_USUARIO, 0) <> 0 AND
                --EXPE.ID_USUARIO_INGRESO = PI_N_ID_USUARIO) --COMENTADO POR OBS 202 - 13.02.2012
                MULT.ID_USUARIO_ASIG_COBRANZA = PI_N_ID_USUARIO)
               
               -----------------------------------------------
               --EN LA BANDEJAS,
               -----------------------------------------------
             AND (
                
                 (NVL(PI_C_EVENTO, ' ') = ' ')
                --OPCION: GENERAR EXPEDIENTES
                 OR (PI_C_EVENTO = 1 AND
                 EXPE.ESTADO_EXPEDIENTE =
                 SCOB_PK_CONSTANTES.C_TBL_EST_EXP_PRECOACTIVO)
                
                 OR (PI_C_EVENTO = 2 AND (EXPE.ID_EXPEDIENTE IS NOT NULL)))
             AND (C_ESTADO = '*' OR
                (C_ESTADO <> '*' AND EXPE.ESTADO = C_ESTADO))
                ) X
       WHERE X.NRO_ORDEN_CUM = 1;
  END;

  ----

  PROCEDURE SCOB_SP_S_MULTA
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 04.04.2011
    -- Proposito    : Consulta las multas asignadas a un usuario y posibles para asociar a un expediente.
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_N_ID_EXPEDIENTE    IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
   PI_V_CUM_INI          IN VARCHAR2,
   PI_V_CUM_FIN          IN VARCHAR2,
   PI_N_COD_MATERIA      IN T_SCOB_MULTA.ID_MATERIA%TYPE,
   PI_N_COD_ORGANO_RESOL IN T_SCOB_MULTA_DETAL.ID_ORGANO_RESOLUTIVO%TYPE,
   --
   PI_I_TIPO_PERSONA IN T_SCOB_PERSONA.TIPO_PERSONA%TYPE,
   PI_I_TIPO_DOC     IN T_SCOB_PERSONA.TIPO_DOC%TYPE,
   PI_V_NRO_DOC      IN T_SCOB_PERSONA.NRO_DOC%TYPE,
   PI_V_APE_PATERNO  IN T_SCOB_PERSONA.APE_PATERNO%TYPE,
   PI_V_APE_MATERNO  IN T_SCOB_PERSONA.APE_MATERNO%TYPE,
   PI_V_PRI_NOMBRE   IN T_SCOB_PERSONA.PRI_NOMBRE%TYPE,
   PI_V_SEG_NOMBRE   IN T_SCOB_PERSONA.SEG_NOMBRE%TYPE,
   PI_V_RAZON_SOCIAL IN T_SCOB_PERSONA.RAZON_SOCIAL%TYPE,
   PI_N_ID_USUARIO   IN T_SCOB_USUARIO.ID_USUARIO%TYPE,
   PO_CU_RETORNO     OUT CU_REC_SET) AS
    V_QUERY        CLOB;
    V_QUERY_SELECT CLOB;
    V_QUERY_FROM   CLOB;
    V_QUERY_WHERE  CLOB;
  BEGIN
    --
    SELECT 'SELECT ' || PI_N_ID_EXPEDIENTE || ',
    MULT.ID_MULTA AS ID_MULTA,
    MDET.ID_MULTA_DETAL AS ID_MULTA_DETAL,
    ORGR.TIPO_INSTANCIA AS TIPO_INSTANCIA_ACTUAL,
    NVL(MCOB.ID_MULTA_COBRANZA, 0) AS ID_MULTA_COBRANZA,
    NVL(MULT.FLG_MULTA_COBRANZA, ''0'') AS IND_COBRANZA,
    NVL(MULT.FLG_MULTA_IMPROCEDENCIA, ''0'') AS IND_IMPROCEDENCIA,
    MULT.ANIO || MULT.CUM AS COD_MULTA,
    IMPRO.NRO_IMPROCEDENCIA AS NRO_IMPROCEDENCIA,
    MULT.NRO_FILE_AEC AS NRO_INGRESO_AEC,
    MULT.FEC_INGRESO_AEC AS FEC_INGRESO_AEC,
    DECODE(MULT.FLG_TIPO_MULTA,' ||
           SCOB_PK_CONSTANTES.C_FLG_TIPO_MULTA_INDIV ||
           ',PERS.COD_SANCIONADO,''0'') AS COD_SANCIONADO,
    DECODE(MULT.FLG_TIPO_MULTA,' ||
           SCOB_PK_CONSTANTES.C_FLG_TIPO_MULTA_INDIV ||
           ',DECODE(PERS.TIPO_PERSONA,' ||
           SCOB_PK_CONSTANTES.C_TIPO_PERS_JURIDICA || ',
      PERS.RAZON_SOCIAL,PERS.APE_PATERNO || '' '' || PERS.APE_MATERNO || '' '' ||PERS.PRI_NOMBRE || '' '' || PERS.SEG_NOMBRE || '' '' ||PERS.APE_CASADA),
    SCOB_PK_EXPEDIENTE.SCOB_FN_SANCIONADOS_MULTA(MULT.ID_MULTA, 2)) AS DES_SANCIONADO,
    MULT.ID_MATERIA AS COD_MATERIA,
    MATE.DESCRIPCION AS NOM_MATERIA,
    MDET.ID_ORGANO_RESOLUTIVO AS COD_ORG_RESOLUTIVO,
    ORGR.DESCRIPCION AS NOM_ORG_RESOLUTIVO,
    MUAN.NRO_OFICIO_SUNAT_CODIGO || MUAN.NRO_OFICIO_SUNAT_ANIO ||MUAN.NRO_OFICIO_SUNAT_PREFIJO ||MUAN.NRO_OFICIO_SUNAT_CORRELATIVO AS NRO_OFICIO_SUNAT,
    DECODE(NVL(MUAN.NRO_LIQUIDACION_CODIGO, '' ''),'' '',NULL,MUAN.NRO_LIQUIDACION_CODIGO || ''-'' ||MUAN.NRO_LIQUIDACION_ANIO || ''/'' ||
      MUAN.NRO_LIQUIDACION_CORRELATIVO) AS NRO_LIQUIDACION,
    --montos deuda antidumping
    MUAN.TIPO_CAMBIO AS TIPO_CAMBIO,
    MUAN.MONTO_ANTIDUMPING AS DERECHO_ANTIDUPING,
    MUAN.MONTO_INTERES AS MONTO_DA_INTERES,
    MUAN.MONTO_INTERES_MORATORIO AS MONTO_DA_INTERES_MORATORIO,
    MUAN.MONTO_TOTAL AS MONTO_TOTAL_DEUDA_DA,
    --montos deuda uit
    MDET.VALOR_UIT AS UIT_VALOR,
    MULT.MONTO_UIT AS UIT_MONTO,
    MULT.MONTO_INTERES AS MONTO_IC,
    MULT.MONTO_INTERES_MORATORIO AS MONTO_IM,
    MULT.MONTO_COSTAS AS MONTO_COSTAS,
    MULT.MONTO_TOTAL_DEUDA AS MONTO_TOTAL_DEUDA,
    --montos amortizado
    MULT.TOTAL_AMORTIZADO AS TOTAL_AMORTIZACION,
    MULT.TOTAL_AMORTIZADO_IC AS AMORTIZADO_IC,
    MULT.TOTAL_AMORTIZADO_IM AS AMORTIZADO_IM,
    MULT.TOTAL_AMORTIZADO_COSTAS  AS AMORTIZADO_COSTAS,
    MULT.TOTAL_AMORTIZACION_DEUDA AS MONTO_TOTAL_AMORTIZADO,
    --montos saldo
    MULT.SALDO AS TOTAL_SALDO,
    MULT.SALDO_IC AS SALDO_IC,
    MULT.SALDO_IM AS SALDO_IM,
    MULT.SALDO_COSTAS AS SALDO_COSTAS,
    MULT.SALDO_TOTAL_DEUDA AS SALDO_TOTAL,
    -----------------------------------------------------------------------------------------------
    MULT.COD_ESTADO_PAGO AS COD_ESTADO_PAGO,
    SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(' ||
           SCOB_PK_CONSTANTES.C_TBL_EST_PAGOS ||
           ',MULT.COD_ESTADO_PAGO) AS NOM_ESTADO_PAGO,
    MDET.NRO_RESOLUCION AS NRO_RESOL_ULT_INSTANCIA '
      INTO V_QUERY_SELECT
      FROM DUAL;
    --
    SELECT 'FROM T_SCOB_MULTA MULT
    LEFT JOIN
    (SELECT IMPRO.ID_MULTA AS ID_MULTA,
      LPAD(MAX(TO_NUMBER(IMPRO.NRO_IMPROCEDENCIA)),3,''000'') AS NRO_IMPROCEDENCIA
      FROM
      (SELECT
          MCOB.ID_MULTA AS,
          MIMP.NRO_IMPROCEDENCIA AS NRO_IMPROCEDENCIA
        FROM T_SCOB_MULTA_IMPROCEDENCIA MIMP
          INNER JOIN T_SCOB_MULTA_COBRANZA MCOB ON MCOB.ID_MULTA_COBRANZA = MIMP.ID_MULTA_COBRANZA
      ) IMPRO
      GROUP BY IMPRO.ID_MULTA
    ) IMPRO ON IMPRO.ID_MULTA = MULT.ID_MULTA
    LEFT JOIN T_SCOB_MULTA_ANTIDUMPING MUAN ON MUAN.ID_MULTA = MULT.ID_MULTA
    INNER JOIN T_SCOB_MULTA_DETAL MDET ON MDET.ID_MULTA = MULT.ID_MULTA AND MDET.FLG_ACTUAL = ''1''
    INNER JOIN T_SCOB_MULTA_COBRANZA MCOB ON MCOB.ID_MULTA = MULT.ID_MULTA
    AND MCOB.FLG_ACTUAL = ''1''
    AND MCOB.ESTADO = ' || SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO || '
    LEFT JOIN T_SCOB_MULTA_IMPROCEDENCIA MIMP ON MIMP.ID_MULTA_COBRANZA = MCOB.ID_MULTA_COBRANZA
    INNER JOIN T_SCOB_ORGANO_RESOLUTIVO ORGR ON ORGR.ID_ORGANO_RESOLUTIVO = MDET.ID_ORGANO_RESOLUTIVO
    INNER JOIN T_SCOB_MATERIA MATE ON MATE.ID_MATERIA = MULT.ID_MATERIA
    INNER JOIN T_SCOB_MULTA_SANCIONADO SANC ON SANC.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL
    AND NVL(SANC.COD_TIPO_PERSONA,''1'') = ''1''
    AND SANC.ESTADO = ' || SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO || '
    AND SANC.FLG_PRINCIPAL = ''1''
    INNER JOIN T_SCOB_PERSONA PERS ON PERS.ID_PERSONA = SANC.ID_PERSONA AND PERS.COD_SANCIONADO IS NOT NULL
    INNER JOIN T_SCOB_USUARIO USUA ON USUA.ID_USUARIO = MULT.ID_USUARIO_ASIG_COBRANZA '
      INTO V_QUERY_FROM
      FROM DUAL;
    --
    SELECT 'WHERE MULT.ESTADO = ' || SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO || CASE
             WHEN PI_V_CUM_INI IS NOT NULL THEN
              ' AND (NVL(''' || PI_V_CUM_INI || ''', '' '') = '' ''
      OR (NVL(''' || PI_V_CUM_INI ||
              ''', '' '') <> '' '')
      AND TRIM(MULT.ANIO) || TRIM(MULT.CUM) BETWEEN TRIM(''' ||
              PI_V_CUM_INI || ''')
      AND TRIM(''' || PI_V_CUM_FIN || ''')) '
           END || CASE
             WHEN PI_I_TIPO_PERSONA <> 0 THEN
              ' AND (NVL(' || PI_I_TIPO_PERSONA || ', 0) = 0
      OR (NVL(' || PI_I_TIPO_PERSONA ||
              ', 0) <> 0
      AND PERS.TIPO_PERSONA = ' || PI_I_TIPO_PERSONA || '))'
           END || CASE
             WHEN PI_I_TIPO_DOC <> 0 THEN
              ' AND (NVL(' || PI_I_TIPO_DOC || ', 0) = 0
      OR (NVL(' || PI_I_TIPO_DOC || ', 0) <> 0
      AND PERS.TIPO_DOC = ' || PI_I_TIPO_DOC || '))'
           END || CASE
             WHEN PI_V_NRO_DOC IS NOT NULL THEN
              ' AND (NVL(''' || PI_V_NRO_DOC || ''', '' '') = '' ''
      OR (NVL(''' || PI_V_NRO_DOC ||
              ''', '' '') <> '' ''
      AND TRIM(PERS.NRO_DOC) = TRIM(''' || PI_V_NRO_DOC ||
              ''')))'
           END || CASE
             WHEN PI_V_APE_PATERNO IS NOT NULL THEN
              ' AND (NVL(''' || PI_V_APE_PATERNO || ''', '' '') = '' ''
      OR (NVL(''' || PI_V_APE_PATERNO ||
              ''', '' '') <> '' ''
      AND fun_scob_nosensite(TRIM(PERS.APE_PATERNO)) LIKE ''%'' || fun_scob_nosensite(TRIM(''' ||
              PI_V_APE_PATERNO || ''')) || ''%''))'
           END || CASE
             WHEN PI_V_APE_MATERNO IS NOT NULL THEN
              ' AND (NVL(''' || PI_V_APE_MATERNO || ''', '' '') = '' ''
      OR (NVL(''' || PI_V_APE_MATERNO ||
              ''', '' '') <> '' ''
      AND fun_scob_nosensite(TRIM(PERS.APE_MATERNO)) LIKE ''%'' || fun_scob_nosensite(TRIM(''' ||
              PI_V_APE_MATERNO || ''')) || ''%''))'
           END || CASE
             WHEN PI_V_PRI_NOMBRE IS NOT NULL THEN
              ' AND (NVL(''' || PI_V_PRI_NOMBRE || ''', '' '') = '' ''
      OR (NVL(''' || PI_V_PRI_NOMBRE ||
              ''', '' '') <> '' ''
      AND fun_scob_nosensite(TRIM(PERS.PRI_NOMBRE)) LIKE ''%'' || fun_scob_nosensite(TRIM(''' ||
              PI_V_PRI_NOMBRE || ''')) || ''%''))'
           END || CASE
             WHEN PI_V_SEG_NOMBRE IS NOT NULL THEN
              ' AND (NVL(''' || PI_V_SEG_NOMBRE || ''', '' '') = '' ''
      OR (NVL(''' || PI_V_SEG_NOMBRE ||
              ''', '' '') <> '' ''
      AND fun_scob_nosensite(TRIM(PERS.SEG_NOMBRE)) LIKE ''%'' || fun_scob_nosensite(TRIM(''' ||
              PI_V_SEG_NOMBRE || ''')) || ''%''))'
           END || CASE
             WHEN PI_V_RAZON_SOCIAL IS NOT NULL THEN
              ' AND (NVL(''' || PI_V_RAZON_SOCIAL || ''', '' '') = '' ''
      OR (NVL(''' || PI_V_RAZON_SOCIAL ||
              ''', '' '') <> '' ''
      AND fun_scob_nosensite(TRIM(PERS.RAZON_SOCIAL)) LIKE ''%'' || fun_scob_nosensite(TRIM(''' ||
              PI_V_RAZON_SOCIAL || ''')) || ''%''))'
           END || CASE
             WHEN PI_N_COD_MATERIA <> 0 THEN
              ' AND (NVL(' || PI_N_COD_MATERIA || ', 0) = 0
      OR (NVL(' || PI_N_COD_MATERIA ||
              ', 0) <> 0
      AND MULT.ID_MATERIA = ' || PI_N_COD_MATERIA || '))'
           END || CASE
             WHEN PI_N_COD_ORGANO_RESOL IS NOT NULL THEN
              ' AND (NVL(' || PI_N_COD_ORGANO_RESOL || ', 0) = 0
      OR (NVL(' || PI_N_COD_ORGANO_RESOL || ', 0) <> 0))'
           END || ' AND MULT.ESTADO_MULTA = ' ||
           SCOB_PK_CONSTANTES.C_TBL_EST_COB_TRAMITE_COB || '
    AND MULT.ID_MULTA NOT IN
    (SELECT EXPM.ID_MULTA
      FROM T_SCOB_EXPEDIENTE_MULTA EXPM
      INNER JOIN T_SCOB_MULTA MULT ON MULT.ID_MULTA = EXPM.ID_MULTA
      AND MULT.ID_USUARIO_ASIG_COBRANZA = ' || PI_N_ID_USUARIO || '
      WHERE EXPM.ESTADO = ' || SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO || ')
    AND MULT.ID_USUARIO_ASIG_COBRANZA = ' || PI_N_ID_USUARIO
      INTO V_QUERY_WHERE
      FROM DUAL;
    --
    SELECT V_QUERY_SELECT || V_QUERY_FROM || V_QUERY_WHERE
      INTO V_QUERY
      FROM DUAL;
    --
    DBMS_OUTPUT.PUT_LINE(V_QUERY);
    OPEN PO_CU_RETORNO FOR V_QUERY;
  
    /*open po_cu_retorno for
    
    SELECT PI_N_ID_EXPEDIENTE,
           MULT.ID_MULTA AS ID_MULTA,
           MDET.ID_MULTA_DETAL AS ID_MULTA_DETAL,
           ORGR.TIPO_INSTANCIA AS TIPO_INSTANCIA_ACTUAL,
           NVL(MCOB.ID_MULTA_COBRANZA, 0) AS ID_MULTA_COBRANZA,
           NVL(MULT.FLG_MULTA_COBRANZA, '0') AS IND_COBRANZA,
           NVL(MULT.FLG_MULTA_IMPROCEDENCIA, '0') AS IND_IMPROCEDENCIA,
           ---
           MULT.ANIO || MULT.CUM AS COD_MULTA,
           IMPRO.NRO_IMPROCEDENCIA AS NRO_IMPROCEDENCIA,
           MULT.NRO_FILE_AEC AS NRO_INGRESO_AEC,
           MULT.FEC_INGRESO_AEC AS FEC_INGRESO_AEC,
    
           DECODE(MULT.FLG_TIPO_MULTA,
                  SCOB_PK_CONSTANTES.C_FLG_TIPO_MULTA_INDIV,
                  PERS.COD_SANCIONADO,
                  '0') AS COD_SANCIONADO,
           DECODE(MULT.FLG_TIPO_MULTA,
                  SCOB_PK_CONSTANTES.C_FLG_TIPO_MULTA_INDIV,
                  DECODE(PERS.TIPO_PERSONA,
                         SCOB_PK_CONSTANTES.C_TIPO_PERS_JURIDICA,
                         PERS.RAZON_SOCIAL,
                         PERS.APE_PATERNO || ' ' || PERS.APE_MATERNO || ' ' ||
                         PERS.PRI_NOMBRE || ' ' || PERS.SEG_NOMBRE || ' ' ||
                         PERS.APE_CASADA),
                  SCOB_FN_SANCIONADOS_MULTA(MULT.ID_MULTA, 2)) AS DES_SANCIONADO,
    
           ---
           MULT.ID_MATERIA           AS COD_MATERIA,
           MATE.DESCRIPCION          AS NOM_MATERIA,
           MDET.ID_ORGANO_RESOLUTIVO AS COD_ORG_RESOLUTIVO,
           ORGR.DESCRIPCION          AS NOM_ORG_RESOLUTIVO,
           ---
           MUAN.NRO_OFICIO_SUNAT_CODIGO || MUAN.NRO_OFICIO_SUNAT_ANIO ||
           MUAN.NRO_OFICIO_SUNAT_PREFIJO ||
           MUAN.NRO_OFICIO_SUNAT_CORRELATIVO AS NRO_OFICIO_SUNAT,
    
           DECODE(NVL(MUAN.NRO_LIQUIDACION_CODIGO, ' '),
                  ' ',
                  NULL,
                  MUAN.NRO_LIQUIDACION_CODIGO || '-' ||
                  MUAN.NRO_LIQUIDACION_ANIO || '/' ||
                  MUAN.NRO_LIQUIDACION_CORRELATIVO) AS NRO_LIQUIDACION,
           -----------------------------------------------------------------------------------------------
           --montos deuda antidumping
           MUAN.TIPO_CAMBIO             AS TIPO_CAMBIO,
           MUAN.MONTO_ANTIDUMPING       AS DERECHO_ANTIDUPING,
           MUAN.MONTO_INTERES           AS MONTO_DA_INTERES,
           MUAN.MONTO_INTERES_MORATORIO AS MONTO_DA_INTERES_MORATORIO,
           MUAN.MONTO_TOTAL             AS MONTO_TOTAL_DEUDA_DA,
    
           --montos deuda uit
           MDET.VALOR_UIT               AS UIT_VALOR,
           MULT.MONTO_UIT               AS UIT_MONTO,
           MULT.MONTO_INTERES           AS MONTO_IC,
           MULT.MONTO_INTERES_MORATORIO AS MONTO_IM,
           MULT.MONTO_COSTAS            AS MONTO_COSTAS,
           MULT.MONTO_TOTAL_DEUDA       AS MONTO_TOTAL_DEUDA,
    
           --montos amortizado
           MULT.TOTAL_AMORTIZADO         AS TOTAL_AMORTIZACION,
           MULT.TOTAL_AMORTIZADO_IC      AS AMORTIZADO_IC,
           MULT.TOTAL_AMORTIZADO_IM      AS AMORTIZADO_IM,
           MULT.TOTAL_AMORTIZADO_COSTAS  AS AMORTIZADO_COSTAS,
           MULT.TOTAL_AMORTIZACION_DEUDA AS MONTO_TOTAL_AMORTIZADO,
    
           --montos saldo
           MULT.SALDO             AS TOTAL_SALDO,
           MULT.SALDO_IC          AS SALDO_IC,
           MULT.SALDO_IM          AS SALDO_IM,
           MULT.SALDO_COSTAS      AS SALDO_COSTAS,
           MULT.SALDO_TOTAL_DEUDA AS SALDO_TOTAL,
           -----------------------------------------------------------------------------------------------
    
           MULT.COD_ESTADO_PAGO AS COD_ESTADO_PAGO,
           SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_EST_PAGOS,
                                                    MULT.COD_ESTADO_PAGO) AS NOM_ESTADO_PAGO,
           MDET.NRO_RESOLUCION AS NRO_RESOL_ULT_INSTANCIA
      FROM T_SCOB_MULTA MULT
    
      LEFT JOIN (SELECT IMPRO.ID_MULTA AS ID_MULTA,
                        LPAD(MAX(TO_NUMBER(IMPRO.NRO_IMPROCEDENCIA)),
                             3,
                             '000') AS NRO_IMPROCEDENCIA
                   FROM (SELECT MCOB.ID_MULTA          AS,
                                MIMP.NRO_IMPROCEDENCIA AS NRO_IMPROCEDENCIA
                           FROM T_SCOB_MULTA_IMPROCEDENCIA MIMP
                          INNER JOIN T_SCOB_MULTA_COBRANZA MCOB ON MCOB.ID_MULTA_COBRANZA =
                                                                   MIMP.ID_MULTA_COBRANZA) IMPRO
                  GROUP BY IMPRO.ID_MULTA) IMPRO ON IMPRO.ID_MULTA =
                                                    MULT.ID_MULTA
    
      LEFT JOIN T_SCOB_MULTA_ANTIDUMPING MUAN ON MUAN.ID_MULTA =
                                                 MULT.ID_MULTA
    
     INNER JOIN T_SCOB_MULTA_DETAL MDET ON MDET.ID_MULTA = MULT.ID_MULTA
                                       AND MDET.FLG_ACTUAL = '1'
    
     INNER JOIN T_SCOB_MULTA_COBRANZA MCOB ON MCOB.ID_MULTA =
                                              MULT.ID_MULTA
                                          AND MCOB.FLG_ACTUAL = '1'
                                          AND MCOB.ESTADO =
                                              SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
    
      LEFT JOIN T_SCOB_MULTA_IMPROCEDENCIA MIMP ON MIMP.ID_MULTA_COBRANZA =
                                                   MCOB.ID_MULTA_COBRANZA
    
     INNER JOIN T_SCOB_ORGANO_RESOLUTIVO ORGR ON ORGR.ID_ORGANO_RESOLUTIVO =
                                                 MDET.ID_ORGANO_RESOLUTIVO
    
     INNER JOIN T_SCOB_MATERIA MATE ON MATE.ID_MATERIA = MULT.ID_MATERIA
    
     INNER JOIN T_SCOB_MULTA_SANCIONADO SANC ON SANC.ID_MULTA_DETAL =
                                                MDET.ID_MULTA_DETAL
                                            AND NVL(SANC.COD_TIPO_PERSONA,
                                                    '1') = '1'
                                            AND SANC.ESTADO =
                                                SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
                                            AND SANC.FLG_PRINCIPAL = '1'
    
     INNER JOIN T_SCOB_PERSONA PERS ON PERS.ID_PERSONA = SANC.ID_PERSONA
                                   AND PERS.COD_SANCIONADO IS NOT NULL
    
     INNER JOIN T_SCOB_USUARIO USUA ON USUA.ID_USUARIO =
                                       MULT.ID_USUARIO_ASIG_COBRANZA
    
     WHERE MULT.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
       AND (NVL(PI_V_CUM_INI, ' ') = ' ' OR
           (NVL(PI_V_CUM_INI, ' ') <> ' ') AND
           TRIM(MULT.ANIO) || TRIM(MULT.CUM) BETWEEN TRIM(PI_V_CUM_INI) AND
           TRIM(PI_V_CUM_FIN))
       AND (NVL(PI_I_TIPO_PERSONA, 0) = 0 OR
           (NVL(PI_I_TIPO_PERSONA, 0) <> 0 AND
           PERS.TIPO_PERSONA = PI_I_TIPO_PERSONA))
       AND (NVL(PI_I_TIPO_DOC, 0) = 0 OR
           (NVL(PI_I_TIPO_DOC, 0) <> 0 AND PERS.TIPO_DOC = PI_I_TIPO_DOC))
       AND (NVL(PI_V_NRO_DOC, ' ') = ' ' OR
           (NVL(PI_V_NRO_DOC, ' ') <> ' ' AND
           TRIM(PERS.NRO_DOC) = TRIM(PI_V_NRO_DOC)))
       AND (NVL(PI_V_APE_PATERNO, ' ') = ' ' OR
           (NVL(PI_V_APE_PATERNO, ' ') <> ' ' AND
           fun_scob_nosensite(TRIM(PERS.APE_PATERNO)) LIKE
           '%' || fun_scob_nosensite(TRIM(PI_V_APE_PATERNO)) || '%'))
       AND (NVL(PI_V_APE_MATERNO, ' ') = ' ' OR
           (NVL(PI_V_APE_MATERNO, ' ') <> ' ' AND
           fun_scob_nosensite(TRIM(PERS.APE_MATERNO)) LIKE
           '%' || fun_scob_nosensite(TRIM(PI_V_APE_MATERNO)) || '%'))
       AND (NVL(PI_V_PRI_NOMBRE, ' ') = ' ' OR
           (NVL(PI_V_PRI_NOMBRE, ' ') <> ' ' AND
           fun_scob_nosensite(TRIM(PERS.PRI_NOMBRE)) LIKE
           '%' || fun_scob_nosensite(TRIM(PI_V_PRI_NOMBRE)) || '%'))
       AND (NVL(PI_V_SEG_NOMBRE, ' ') = ' ' OR
           (NVL(PI_V_SEG_NOMBRE, ' ') <> ' ' AND
           fun_scob_nosensite(TRIM(PERS.SEG_NOMBRE)) LIKE
           '%' || fun_scob_nosensite(TRIM(PI_V_SEG_NOMBRE)) || '%'))
       AND (NVL(PI_V_RAZON_SOCIAL, ' ') = ' ' OR
           (NVL(PI_V_RAZON_SOCIAL, ' ') <> ' ' AND
           fun_scob_nosensite(TRIM(PERS.RAZON_SOCIAL)) LIKE
           '%' || fun_scob_nosensite(TRIM(PI_V_RAZON_SOCIAL)) || '%'))
       AND (NVL(PI_N_COD_MATERIA, 0) = 0 OR
           (NVL(PI_N_COD_MATERIA, 0) <> 0 AND
           MULT.ID_MATERIA = PI_N_COD_MATERIA))
       AND (NVL(PI_N_COD_ORGANO_RESOL, 0) = 0 OR
           (NVL(PI_N_COD_ORGANO_RESOL, 0) <> 0))
       AND MULT.ESTADO_MULTA =
           SCOB_PK_CONSTANTES.C_TBL_EST_COB_TRAMITE_COB
       AND MULT.ID_MULTA NOT IN
           (SELECT EXPM.ID_MULTA
              FROM T_SCOB_EXPEDIENTE_MULTA EXPM
             INNER JOIN T_SCOB_MULTA MULT ON MULT.ID_MULTA = EXPM.ID_MULTA
                                         AND MULT.ID_USUARIO_ASIG_COBRANZA =
                                             PI_N_ID_USUARIO
             WHERE EXPM.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO)
       AND MULT.ID_USUARIO_ASIG_COBRANZA = PI_N_ID_USUARIO;*/
  END;

  PROCEDURE SCOB_SP_S_MULTA_EXPEDIENTE
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 04.04.2011
    -- Proposito    : Consulta las multas relacionadas a un expediente.
    -----------------------------------------------------------
    -- Modificacion : 04.04.2017
    -- Autor        : @dcelis Req.44
    -- Modificado   : Se agreg? TASA_IC, TASA_IM y la referencia a T_SCOB_TABLA_DET
    -- Proposito    : Para convertir la vista de pagos de una solo CUM a una vista de pagos de m?ltiples CUM's
    -----------------------------------------------------------
    */
  (PI_N_ID_EXPEDIENTE IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
   PO_CU_RETORNO      OUT CU_REC_SET) AS
    --
  BEGIN
    --
    OPEN PO_CU_RETORNO FOR
    
      SELECT DISTINCT MULT.ID_MULTA AS ID_MULTA,
                      MEXP.ID_EXPEDIENTE_MULTA AS ID_EXPEDIENTE_MULTA,
                      MULT.ANIO || MULT.CUM AS NRO_CUM,
                      -- @dcelis Req.44
                      EXPE.ANIO || EXPE.NRO_EXPEDIENTE NRO_EXPEDIENTE,
                      --
                      --DECODE(PERS.TIPO_PERSONA,SCOB_PK_CONSTANTES.C_TIPO_PERS_JURIDICA,  PERS.RAZON_SOCIAL, PERS.APE_PATERNO  || ' ' || PERS.APE_MATERNO  || ' ' ||  PERS.PRI_NOMBRE || ' ' || PERS.SEG_NOMBRE || ' ' || PERS.APE_CASADA) AS DES_SANCIONADO,
                      DECODE(EXPE.FLG_TIPO_EXPEDIENTE,
                             '1',
                             DECODE(PERS.TIPO_PERSONA,
                                    SCOB_PK_CONSTANTES.C_TIPO_PERS_JURIDICA,
                                    PERS.RAZON_SOCIAL,
                                    PERS.APE_PATERNO || ' ' ||
                                    PERS.APE_MATERNO || ' ' ||
                                    PERS.PRI_NOMBRE || ' ' || PERS.SEG_NOMBRE || ' ' ||
                                    PERS.APE_CASADA),
                             SCOB_FN_SANCIONADOS_EXPED(EXPE.ID_EXPEDIENTE)) AS DES_SANCIONADO,
                      -- @dcelis Req.44
                      DECODE(MULT.FLG_TIPO_MULTA, '2', ' ', PERS.NRO_DOC) AS NRO_DOCUMENTO,
                      --
                      ORGR.DESCRIPCION AS NOM_ORGANO_RESOLUTIVO,
                      MDET.VALOR_UIT AS TOTAL_VALOR_UIT,
                      MULT.MONTO_UIT AS TOTAL_MONTO_UIT,
                      MULT.TOTAL_AMORTIZADO AS TOTAL_AMORTIZACION,
                      MULT.SALDO AS TOTAL_SALDO,
                      SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_EST_PAGOS,
                                                               MULT.COD_ESTADO_PAGO) AS NOM_ESTADO_PAGO,
                      MCOB.NRO_INGRESO AS NRO_INGRESO_AEC,
                      MDET.NRO_RESOLUCION AS NRO_RESOL_ULT_INSTANCIA,
                      MUAN.MONTO_ANTIDUMPING AS DERECHO_ANTIDUPING,
                      DECODE(NVL(MUAN.NRO_LIQUIDACION_CODIGO, ' '),
                             ' ',
                             NULL,
                             MUAN.NRO_LIQUIDACION_CODIGO || '-' ||
                             MUAN.NRO_LIQUIDACION_ANIO || '/' ||
                             MUAN.NRO_LIQUIDACION_CORRELATIVO) AS NRO_LIQUIDACION,
                      
                      -----------------------------------------------------------------------------------------------
                      --montos deuda antidumping
                      MUAN.TIPO_CAMBIO             AS TIPO_CAMBIO,
                      MUAN.MONTO_ANTIDUMPING       AS DERECHO_ANTIDUPING,
                      MUAN.MONTO_INTERES           AS MONTO_DA_INTERES,
                      MUAN.MONTO_INTERES_MORATORIO AS MONTO_DA_INTERES_MORATORIO,
                      MUAN.MONTO_TOTAL             AS MONTO_TOTAL_DEUDA_DA,
                      
                      --montos deuda uit
                      MDET.VALOR_UIT               AS UIT_VALOR,
                      MULT.MONTO_UIT               AS UIT_MONTO,
                      MULT.MONTO_INTERES           AS MONTO_IC,
                      MULT.MONTO_INTERES_MORATORIO AS MONTO_IM,
                      MULT.MONTO_COSTAS            AS MONTO_COSTAS,
                      MULT.MONTO_TOTAL_DEUDA       AS MONTO_TOTAL_DEUDA,
                      
                      --montos amortizado
                      MULT.TOTAL_AMORTIZADO         AS TOTAL_AMORTIZACION,
                      MULT.TOTAL_AMORTIZADO_IC      AS AMORTIZADO_IC,
                      MULT.TOTAL_AMORTIZADO_IM      AS AMORTIZADO_IM,
                      MULT.TOTAL_AMORTIZADO_COSTAS  AS AMORTIZADO_COSTAS,
                      MULT.TOTAL_AMORTIZACION_DEUDA AS MONTO_TOTAL_AMORTIZADO,
                      
                      --montos saldo
                      MULT.SALDO             AS TOTAL_SALDO,
                      MULT.SALDO_IC          AS SALDO_IC,
                      MULT.SALDO_IM          AS SALDO_IM,
                      MULT.SALDO_COSTAS      AS SALDO_COSTAS,
                      MULT.SALDO_TOTAL_DEUDA AS SALDO_TOTAL,
                      -----------------------------------------------------------------------------------------------
                      -- @dcelis Req.44
                      (INTERES.TXT_VALOR1) TASA_IC,
                      (INTERES.TXT_VALOR2) TASA_IM,
                      SCOB_PK_EXPEDIENTE.SCOB_FN_CUM_SOLIC_DESACUM(MULT.ID_MULTA) AS ES_SOLIC_DESACUM,
                      SCOB_PK_MULTAS.SCOB_FN_HAS_ADJ_ANOT(MULT.ID_MULTA, 2) AS HAS_ADJ_ANOT
      ---
      
        FROM T_SCOB_EXPEDIENTE_MULTA MEXP
      
       INNER JOIN T_SCOB_MULTA MULT
          ON MULT.ID_MULTA = MEXP.ID_MULTA
      
       INNER JOIN T_SCOB_EXPEDIENTE EXPE
          ON EXPE.ID_EXPEDIENTE = MEXP.ID_EXPEDIENTE
      
       INNER JOIN T_SCOB_MULTA_DETAL MDET
          ON MDET.ID_MULTA = MULT.ID_MULTA
         AND MDET.FLG_ACTUAL = '1'
         AND MDET.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
      
        LEFT JOIN T_SCOB_MULTA_ANTIDUMPING MUAN
          ON MUAN.ID_MULTA = MULT.ID_MULTA
      
        LEFT JOIN T_SCOB_MULTA_SANCIONADO MSAN
          ON MSAN.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL
         AND NVL(MSAN.COD_TIPO_PERSONA, '1') = '1'
         AND MSAN.FLG_PRINCIPAL = '1'
         AND MSAN.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
      
        LEFT JOIN T_SCOB_PERSONA PERS
          ON PERS.ID_PERSONA = MSAN.ID_PERSONA
      
        LEFT JOIN T_SCOB_ORGANO_RESOLUTIVO ORGR
          ON ORGR.ID_ORGANO_RESOLUTIVO = MDET.ID_ORGANO_RESOLUTIVO
      
        LEFT JOIN T_SCOB_MULTA_COBRANZA MCOB
          ON MCOB.ID_MULTA = MULT.ID_MULTA
         AND MCOB.FLG_ACTUAL = '1'
      
        LEFT JOIN T_SCOB_TABLA_DET MRES
          ON MRES.ID_TABLA = SCOB_PK_CONSTANTES.C_TBL_TIPO_RESP_MULTA_OR
         AND LTRIM(RTRIM(MRES.COD_INTERNO)) =
             LTRIM(RTRIM(MULT.FLG_TIPO_MULTA))
      -- @dcelis Req.44
        LEFT JOIN T_SCOB_TABLA_DET INTERES
          ON INTERES.ID_TABLA = 16
         AND TO_NUMBER(INTERES.COD_INTERNO) = 9
      --
       WHERE MEXP.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
         AND MEXP.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO;
  END;

  PROCEDURE SCOB_SP_S_DATOS_EXPEDIENTE
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 04.04.2011
    -- Proposito    : Consulta los datos de la cabecera de un expediente
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_N_ID_EXPEDIENTE IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
   PO_CU_RETORNO      OUT CU_REC_SET) AS
  BEGIN
  
    OPEN PO_CU_RETORNO FOR
    
      SELECT EXPE.ANIO           AS ANIO_EXPEDIENTE,
             EXPE.ID_EXPEDIENTE  AS COD_EXPEDIENTE,
             EXPE.NRO_EXPEDIENTE AS NRO_EXPEDIENTE,
             EXPE.NRO_CUMS       AS NRO_CUMS,
             --SCOB_PK_EXPEDIENTE.SCOB_FN_CUMS_EXP(EXPE.ID_EXPEDIENTE) AS NRO_CUMS,
             --
             EXPE.VALOR_UIT AS TOTAL_UIT,
             --EXPE.MONTO_UIT   AS TOTAL_MONTO_UIT,
             NVL(EXPE.MONTO_UIT, 0) AS TOTAL_MONTO_UIT,
             EXPE.POR_ASOCU AS TOTAL_POR_ASOCU,
             EXPE.MONTO_ASOCU AS TOTAL_MONTO_ASOCU,
             
             --EXPE.TOTAL_AMORTIZADO AS TOTAL_AMORTIZADO,
             NVL(EXPE.TOTAL_AMORTIZADO, 0) AS TOTAL_AMORTIZADO,
             --NVL(EXPE.MONTO_COSTAS, 0) AS TOTAL_COSTAS,
             NVL(EXPE.MONTO_COSTAS, 0) AS TOTAL_COSTAS,
             --EXPE.MONTO_UIT AS TOTAL_CAPITAL,
             NVL(EXPE.MONTO_UIT, 0) AS TOTAL_CAPITAL,
             --EXPE.SALDO_TOTAL_DEUDA AS TOTAL_SALDO,
             NVL(EXPE.SALDO_TOTAL_DEUDA, 0) AS TOTAL_SALDO,
             SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_EST_PAGOS,
                                                      EXPE.COD_ESTADO_PAGO) AS NOM_ESTADO_PAGO,
             --
             EXPE.COD_EXPECTATIVA_COBRO AS COD_EXPECTATIVA_COBRO,
             SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_ESPECTATIVA_COBRO_EXPCOB,
                                                      EXPE.COD_EXPECTATIVA_COBRO) AS NOM_EXPECTATIVA_COBRO,
             EXPE.ESTADO_EXPEDIENTE AS COD_ESTADO_EXPED,
             ESEC.DESCRIPCION AS NOM_ESTADO_EXPED,
             EXPE.ID_MOTIVO AS COD_MOTIVO,
             MEXP.DESCRIPCION AS NOM_MOTIVO,
             
             EXPE.FLG_TIPO_EXPEDIENTE AS TIPO_EXPEDIENTE, --1=INDIVIDUAL; 2=SOLIDARIA
             MRES.TXT_DESCRIPCION     AS NOM_TIPO_EXPEDIENTE,
             --I@04.01.2012
             --EXPE.FLG_ENVIO_RIESGO AS FLG_ENVIO_RIESGO,
             MULT.FLG_ENVIO_RIESGO_EXP AS FLG_ENVIO_RIESGO,
             MULT.FEC_ENVIO_RIESGO_EXP AS FEC_ENVIO_RIESGO,
             --F@04.01.2012
             --
             NVL(EMBG.NRO_EMBARGOS, 0) AS NRO_EMBARGOS,
             ' ' AS NRO_RESOL_EMBARGO, --FALTA, DE CUAL DE TODOS LOS EMBARGOS? --SE RETIRO CAMPO.
             SYSDATE AS FEC_RESOL_EMBARGO, --FALTA, DE CUAL DE TODOS LOS EMBARGOS? --SE RETIRO CAMPO.
             NVL(DOCS.NRO_DOCS, 0) AS NRO_DOCS,
             NVL(EXPE.FLG_SENSIBLE, '0') AS PI_C_FLG_SENSIBLE,
             NVL(EXPE.FLG_EMBARGO, '0') AS IND_EMBARGO,
             
             DECODE(MDET.ESTADO_MULTA,
                    SCOB_PK_CONSTANTES.C_EST_MULT_CONSENTIDA,
                    '1',
                    '0') AS IND_ESTADO_FIRME,
             DECODE(MDET.ESTADO_MULTA,
                    SCOB_PK_CONSTANTES.C_EST_MULT_FIRME,
                    '1',
                    '0') AS IND_ESTADO_CONSENTIDA,
             
             ORGR.CODIGO AS COD_ORGANO_RESOLUTIVA,
             ORGR.DESCRIPCION AS DES_OBSERVACION_CALIDAD,
             MULT.NRO_EXP_ADMINISTRATIVO AS NRO_EXPED_ADMIN_OR,
             MDET.NRO_RESOLUCION AS NRO_RESOLUCION_OR,
             MDET.FEC_RESOLUCION AS FEC_RESOLUCION_OR,
             CARGO.DESCRIPCION AS NOM_CARGO_GESTOR_ASIG,
             USUA.PRI_NOMBRE || ' ' || USUA.SEG_NOMBRE || ' ' ||
             USUA.APE_PATERNO || ' ' || USUA.APE_MATERNO || ' ' ||
             USUA.APE_CASADA AS NOM_GESTOR_ASIG,
             MULT.ANIO_FILE_AEC || AREA_COB.CODIGO || NRO_FILE_AEC AS NRO_INGRESO_AEC,
             MULT.FEC_INGRESO_AEC AS FEC_INGRESO_AEC,
             EXDO.COD_GENERADOR_DOCUMENTO AS COD_GEN_DOC_REC,
             EXPE.ESTADO AS ESTADO_REGISTRO,
             --MULT.ANIO || MULT.CUM AS NRO_CUM,
             SCOB_PK_EXPEDIENTE.SCOB_FN_CUMS_EXP(EXPE.ID_EXPEDIENTE) AS NRO_CUM,
             AREA_COB.DESCIPCION || '-' || AREA_COB.SIGLAS AS NOM_AREA_DES_SIGLA,
             MULT.FLG_MULTA_RESOLUTIVO AS FLG_MULTA_RESOLUTIVO
      
        FROM T_SCOB_EXPEDIENTE EXPE
      
       INNER JOIN T_SCOB_EXPEDIENTE_MULTA EXMU
          ON EXMU.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
         AND EXMU.ESTADO = '1'
      
        LEFT JOIN T_SCOB_EST_EXP_COB_MOTIVO MEXP
          ON MEXP.ID_MOTIVO = EXPE.ID_MOTIVO
      
       INNER JOIN T_SCOB_MULTA MULT
          ON MULT.ID_MULTA = EXMU.ID_MULTA
      
       INNER JOIN T_SCOB_MULTA_DETAL MDET
          ON MDET.ID_MULTA = EXMU.ID_MULTA
         AND MDET.FLG_ACTUAL = '1'
         AND MDET.ESTADO = '1'
      
        LEFT JOIN T_SCOB_AREA_COBRANZA AREA_COB
          ON AREA_COB.ID_AREA_COBRANZA = MULT.ID_AREA_COBRANZA
      
        LEFT JOIN T_SCOB_USUARIO USUA
          ON USUA.ID_USUARIO = MULT.ID_USUARIO_ASIG_COBRANZA
      
        LEFT JOIN T_SCOB_CARGO CARGO
          ON CARGO.ID_CARGO = USUA.CARGO
      
       INNER JOIN T_SCOB_ORGANO_RESOLUTIVO ORGR
          ON ORGR.ID_ORGANO_RESOLUTIVO = MDET.ID_ORGANO_RESOLUTIVO
      
       INNER JOIN T_SCOB_EST_EXP_COB ESEC
          ON ESEC.CODIGO = EXPE.ESTADO_EXPEDIENTE
      
        LEFT JOIN (SELECT GRUPO.ID_EXPEDIENTE AS ID_EXPEDIENTE,
                          COUNT(GRUPO.VERSION) AS NRO_DOCS
                     FROM (SELECT EXDO.ID_EXPEDIENTE AS ID_EXPEDIENTE,
                                  EXDO.TITULO AS TITULO,
                                  MAX(TO_NUMBER(EXDO.NRO_VERSION)) AS VERSION
                             FROM T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
                            WHERE COD_GENERADOR_DOCUMENTO IS NOT NULL
                              AND EXDO.ESTADO = '1'
                            GROUP BY EXDO.ID_EXPEDIENTE, EXDO.TITULO) GRUPO
                    GROUP BY GRUPO.ID_EXPEDIENTE) DOCS
          ON DOCS.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
      
        LEFT JOIN T_SCOB_TABLA_DET MRES
          ON MRES.ID_TABLA = SCOB_PK_CONSTANTES.C_TBL_TIPO_RESP_MULTA_OR
         AND LTRIM(RTRIM(MRES.COD_INTERNO)) =
             LTRIM(RTRIM(EXPE.FLG_TIPO_EXPEDIENTE))
      
        LEFT JOIN (SELECT EXPE_EMB.ID_EXPEDIENTE AS ID_EXPEDIENTE,
                          COUNT(EXPE_EMB.ID_EXPEDIENTE_EMBARGO) AS NRO_EMBARGOS
                     FROM T_SCOB_EXPED_EMBARGO EXPE_EMB
                    WHERE EXPE_EMB.COD_ESTADO_EMBARGO <>
                          SCOB_PK_CONSTANTES.C_EST_SOLIC_EMB_LEVANTADO
                      AND EXPE_EMB.ESTADO =
                          SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
                    GROUP BY EXPE_EMB.ID_EXPEDIENTE) EMBG
          ON EMBG.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
      
        LEFT JOIN T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
          ON EXDO.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
         AND NVL(EXDO.FLG_DOCUMENTO_REC, '0') = '1'
         AND EXDO.COD_SUBTIPO_DOCUMENTO =
             SCOB_PK_CONSTANTES.C_EMB_RETEN_SOLIC_RESOL
      
       WHERE EXPE.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
         AND EXPE.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
         AND ROWNUM = 1;
  
  END;

  PROCEDURE SCOB_SP_U_DATOS_EXPEDIENTE
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 26.04.2011
    -- Proposito    : actualiza datos del expediente.
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_N_ID_EXPEDIENTE         IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
   PI_I_COD_EXPECTATIVA_COBRO IN T_SCOB_EXPEDIENTE.COD_EXPECTATIVA_COBRO%TYPE,
   PI_C_FLG_SENSIBLE          IN T_SCOB_EXPEDIENTE.FLG_SENSIBLE%TYPE,
   PI_C_FLG_ENVIO_RIESGO      IN T_SCOB_MULTA.FLG_ENVIO_RIESGO_EXP%TYPE,
   PI_V_FEC_ENVIO_RIESGO      IN VARCHAR2,
   PI_N_ID_NUEVO_ESTADO_EXPED IN T_SCOB_EXPEDIENTE_ESTADO.ESTADO_EXPEDIENTE%TYPE,
   PI_V_AUDUSUCREACION        IN T_SCOB_EXPEDIENTE.AUDUSUCREACION%TYPE,
   PO_N_RETORNO               OUT NUMBER,
   PO_N_COD_ERROR             OUT NUMBER,
   PO_V_MSJ_ERROR             OUT VARCHAR2) IS
    V_I_MULTA_ID         INTEGER;
    V_C_FLG_ENVIO_RIESGO CHAR(1);
  BEGIN
    PO_V_MSJ_ERROR := '';
    PO_N_RETORNO   := 0;
    PO_N_COD_ERROR := -1;
  
    --VALIDA EL CAMBIO DE ESTADO:20.10.2011
    IF PI_N_ID_NUEVO_ESTADO_EXPED <> 0 THEN
      SCOB_PK_VALIDA_ESTADO.SCOB_SP_S_VAL_ESTADO_EXPED_EDI(PI_N_ID_EXPEDIENTE,
                                                           PI_N_ID_NUEVO_ESTADO_EXPED,
                                                           0,
                                                           PO_N_COD_ERROR,
                                                           PO_V_MSJ_ERROR);
      IF PO_N_COD_ERROR < 0 THEN
        PO_N_RETORNO := PO_N_COD_ERROR;
        RETURN;
      END IF;
      ------- actualizar el estado del expediente -----------
      SCOB_SP_I_EXPEDIENTE_ESTADO(PI_N_ID_EXPEDIENTE     => PI_N_ID_EXPEDIENTE,
                                  PI_N_ID_MOTIVO         => 0,
                                  PI_N_ESTADO_EXPEDIENTE => PI_N_ID_NUEVO_ESTADO_EXPED,
                                  PI_V_AUDUSUCREACION    => PI_V_AUDUSUCREACION,
                                  PO_N_COD_ERROR         => PO_N_COD_ERROR,
                                  PO_V_MSJ_ERROR         => PO_V_MSJ_ERROR);
    
      IF PO_N_COD_ERROR < 0 THEN
        ROLLBACK;
        RETURN;
      END IF;
      -------------------------------------------------------
    END IF;
  
    --ACTUALIZANDO EL FLG ENVIO A RIESGO(INFOCORP)
    FOR REC IN (SELECT EXPMUL.ID_MULTA      AS ID_MULTA,
                       MUL.FLG_ENVIO_RIESGO AS FLG_ENVIO_RIESGO
                  FROM T_SCOB_EXPEDIENTE_MULTA EXPMUL
                 INNER JOIN T_SCOB_MULTA MUL
                    ON EXPMUL.ID_MULTA = MUL.ID_MULTA
                 WHERE EXPMUL.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE) LOOP
      V_I_MULTA_ID         := REC.ID_MULTA;
      V_C_FLG_ENVIO_RIESGO := REC.FLG_ENVIO_RIESGO;
    
      -- ACTUALIZANDO LA MULTA RELACIONADA AL EXPEDIENTE
      UPDATE T_SCOB_MULTA
         SET --FLG_ENVIO_RIESGO = PI_C_FLG_ENVIO_RIESGO,
             --FEC_ENVIO_RIESGO = TO_DATE(PI_V_FEC_ENVIO_RIESGO,'DD/MM/YYYY'),
             --FEC_INGRESO_ENVIO_RIESGO = SYSDATE,
                      FLG_ENVIO_RIESGO_EXP = PI_C_FLG_ENVIO_RIESGO,
             FEC_ENVIO_RIESGO_EXP         = TO_DATE(PI_V_FEC_ENVIO_RIESGO,
                                                    'DD/MM/YYYY'),
             FEC_INGRESO_ENVIO_RIESGO_EXP = SYSDATE,
             AUDUSUMODIFICACION           = PI_V_AUDUSUCREACION,
             AUDFECMODIFICACION           = SYSDATE
       WHERE ID_MULTA = REC.ID_MULTA;
      -- SI SE DESMARCA POR EXPEDIENTE SE DESMARCA TAMBIEN EL FLG EN MULTA
      IF NVL(PI_C_FLG_ENVIO_RIESGO, '0') = '0' THEN
        UPDATE T_SCOB_MULTA
           SET FLG_ENVIO_RIESGO = PI_C_FLG_ENVIO_RIESGO,
               FEC_ENVIO_RIESGO = TO_DATE(PI_V_FEC_ENVIO_RIESGO,
                                          'DD/MM/YYYY'),
               --FEC_INGRESO_ENVIO_RIESGO = SYSDATE,
               AUDUSUMODIFICACION = PI_V_AUDUSUCREACION,
               AUDFECMODIFICACION = SYSDATE
         WHERE ID_MULTA = REC.ID_MULTA;
      END IF;
      --
    END LOOP;
  
    -- ACTUALIZANDO EXPEDIENTE
    UPDATE T_SCOB_EXPEDIENTE EXPE
       SET EXPE.COD_EXPECTATIVA_COBRO = PI_I_COD_EXPECTATIVA_COBRO,
           EXPE.FLG_SENSIBLE          = PI_C_FLG_SENSIBLE,
           -- FLG_ENVIO_RIESGO = PI_C_FLG_ENVIO_RIESGO,
           --FEC_ENVIO_RIESGO = TO_DATE(PI_V_FEC_ENVIO_RIESGO,'DD/MM/YYYY'),
           --FEC_INGRESO_ENVIO_RIESGO = SYSDATE,
           AUDUSUMODIFICACION = PI_V_AUDUSUCREACION,
           AUDFECMODIFICACION = SYSDATE
     WHERE EXPE.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE;
  
    /*-- ACTUALIZANDO LA MULTA RELACIONADA AL EXPEDIENTE
    UPDATE T_SCOB_MULTA
       SET --FLG_ENVIO_RIESGO = PI_C_FLG_ENVIO_RIESGO,
           --FEC_ENVIO_RIESGO = TO_DATE(PI_V_FEC_ENVIO_RIESGO,'DD/MM/YYYY'),
           --FEC_INGRESO_ENVIO_RIESGO = SYSDATE,
                    FLG_ENVIO_RIESGO_EXP = PI_C_FLG_ENVIO_RIESGO,
           FEC_ENVIO_RIESGO_EXP         = TO_DATE(PI_V_FEC_ENVIO_RIESGO,
                                                  'DD/MM/YYYY'),
           FEC_INGRESO_ENVIO_RIESGO_EXP = SYSDATE,
           AUDUSUMODIFICACION           = PI_V_AUDUSUCREACION,
           AUDFECMODIFICACION           = SYSDATE
     WHERE ID_MULTA = V_I_MULTA_ID;
    -- SI SE DESMARCA POR EXPEDIENTE SE DESMARCA TAMBIEN EL FLG EN MULTA
    IF NVL(PI_C_FLG_ENVIO_RIESGO, '0') = '0' THEN
      UPDATE T_SCOB_MULTA
         SET FLG_ENVIO_RIESGO = PI_C_FLG_ENVIO_RIESGO,
             FEC_ENVIO_RIESGO = TO_DATE(PI_V_FEC_ENVIO_RIESGO, 'DD/MM/YYYY'),
             --FEC_INGRESO_ENVIO_RIESGO = SYSDATE,
             AUDUSUMODIFICACION = PI_V_AUDUSUCREACION,
             AUDFECMODIFICACION = SYSDATE
       WHERE ID_MULTA = V_I_MULTA_ID;
    END IF;*/
  
    ---
    PO_N_COD_ERROR := 0;
    PO_N_RETORNO   := PI_N_ID_EXPEDIENTE;
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

  PROCEDURE SCOB_SP_S_SANC_EXPEDIENTE
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 26.04.2011
    -- Proposito    : Consulta a los sancionados de un expediente
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_N_ID_EXPEDIENTE IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
   PO_CU_RETORNO      OUT CU_REC_SET) AS
  BEGIN
  
    OPEN PO_CU_RETORNO FOR
      SELECT DISTINCT MSAN.ID_PERSONA AS ID_PERSONA,
                      PERS.TIPO_PERSONA AS COD_TIPO_PERSONA,
                      SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_TIPO_PERSONA,
                                                               PERS.TIPO_PERSONA) AS NOM_TIPO_PERSONA,
                      PERS.TIPO_DOC AS COD_TIPO_DOC,
                      SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_TIPO_DOC_IDENT,
                                                               PERS.TIPO_DOC) AS NOM_TIPO_DOC,
                      PERS.NRO_DOC AS NRO_TIPO_DOC,
                      PERS.NOMBRE_COMERCIAL AS NOMBRE_COMERCIAL,
                      --DECODE(PERS.TIPO_PERSONA,SCOB_PK_CONSTANTES.C_TIPO_PERS_JURIDICA, PERS.RAZON_SOCIAL,  PERS.PRI_NOMBRE || ' ' || PERS.SEG_NOMBRE || ' ' || PERS.APE_PATERNO  || ' ' || PERS.APE_MATERNO  || ' ' || PERS.APE_CASADA) AS NOM_SANCIONADO,
                      DECODE(PERS.TIPO_PERSONA,
                             SCOB_PK_CONSTANTES.C_TIPO_PERS_JURIDICA,
                             PERS.RAZON_SOCIAL,
                             PERS.APE_PATERNO || ' ' || PERS.APE_MATERNO || ' ' ||
                             PERS.PRI_NOMBRE || ' ' || PERS.SEG_NOMBRE || ' ' ||
                             PERS.APE_CASADA) AS NOM_SANCIONADO,
                      PERS.COD_SANCIONADO AS COD_SANC,
                      PERS.SIGLAS AS SIGLAS
        FROM T_SCOB_EXPEDIENTE EXPE
      
       INNER JOIN T_SCOB_EXPEDIENTE_MULTA EXMU
          ON EXMU.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
         AND EXMU.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
      
       INNER JOIN T_SCOB_MULTA_DETAL MDET
          ON MDET.ID_MULTA = EXMU.ID_MULTA
         AND MDET.FLG_ACTUAL = '1'
      
       INNER JOIN T_SCOB_MULTA_SANCIONADO MSAN
          ON MSAN.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL
         AND NVL(MSAN.COD_TIPO_PERSONA, '1') = '1'
         AND MSAN.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
      
       INNER JOIN T_SCOB_PERSONA PERS
          ON PERS.ID_PERSONA = MSAN.ID_PERSONA
      
        LEFT JOIN T_SCOB_SECTOR_ECONOMICO SECO
          ON SECO.ID_SECTOR_ECONOMICO = PERS.ID_SECTOR_ECONOMICO
      
       WHERE EXPE.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE;
  
  END;

  PROCEDURE SCOB_SP_I_EXPEDIENTE_ESTADO
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 07.04.2011
    -- Proposito    : inserta el log de estados de los expedientes
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_N_ID_EXPEDIENTE     IN T_SCOB_EXPEDIENTE_ESTADO.ID_EXPEDIENTE_ESTADO%TYPE,
   PI_N_ID_MOTIVO         IN T_SCOB_EXPEDIENTE_ESTADO.ID_MOTIVO%TYPE,
   PI_N_ESTADO_EXPEDIENTE IN T_SCOB_EXPEDIENTE.ESTADO_EXPEDIENTE%TYPE,
   PI_V_AUDUSUCREACION    IN T_SCOB_EXPEDIENTE.AUDUSUCREACION%TYPE,
   PO_N_COD_ERROR         OUT NUMBER,
   PO_V_MSJ_ERROR         OUT VARCHAR2) IS
    N_ID_EXPEDIENTE_ESTADO     T_SCOB_EXPEDIENTE_ESTADO.ID_EXPEDIENTE_ESTADO%TYPE;
    N_ESTADO_EXPEDIENTE_ACTUAL T_SCOB_EXPEDIENTE.ESTADO_EXPEDIENTE%TYPE;
    C_FLG_CANCELADO            T_SCOB_EXPEDIENTE.FLG_CANCELADO%TYPE;
    --C_FLG_SUSPENDIDO                 T_SCOB_EXPEDIENTE.FLG_SUSPENDIDO%TYPE;
    I_ID_MOTIVO_ACTUAL INTEGER;
    I_ID_MOTIVO_NUEVO  INTEGER;
  
  BEGIN
    PO_V_MSJ_ERROR := '';
    PO_N_COD_ERROR := -1;
  
    IF PI_N_ESTADO_EXPEDIENTE IN (1, 3, 4, 5, 6) THEN
      --SETEA LOS MOTIVOS POR DEFECTO
      CASE PI_N_ESTADO_EXPEDIENTE
        WHEN 1 THEN
          I_ID_MOTIVO_NUEVO := 1;
        WHEN 3 THEN
          I_ID_MOTIVO_NUEVO := 2;
        WHEN 4 THEN
          I_ID_MOTIVO_NUEVO := 3;
        WHEN 5 THEN
          I_ID_MOTIVO_NUEVO := 4;
        WHEN 6 THEN
          I_ID_MOTIVO_NUEVO := 5;
        ELSE
          NULL;
      END CASE;
    ELSE
      I_ID_MOTIVO_NUEVO := PI_N_ID_MOTIVO;
    END IF;
  
    --obtener los datos del estado actual del expediente
    SELECT NVL(EXPE.ESTADO_EXPEDIENTE, '9999'), EXPE.ID_MOTIVO
      INTO N_ESTADO_EXPEDIENTE_ACTUAL, I_ID_MOTIVO_ACTUAL
      FROM T_SCOB_EXPEDIENTE EXPE
     WHERE EXPE.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE;
  
    IF (TRIM(N_ESTADO_EXPEDIENTE_ACTUAL) <> TRIM(PI_N_ESTADO_EXPEDIENTE)) OR
       (TRIM(I_ID_MOTIVO_ACTUAL) <> TRIM(I_ID_MOTIVO_NUEVO)) THEN
      BEGIN
      
        SELECT SCOB_SQ_EXPEDIENTE_ESTADO.NEXTVAL
          INTO N_ID_EXPEDIENTE_ESTADO
          FROM DUAL;
      
        INSERT INTO T_SCOB_EXPEDIENTE_ESTADO
          (ID_EXPEDIENTE_ESTADO,
           ID_EXPEDIENTE,
           ESTADO_EXPEDIENTE,
           ESTADO,
           AUDFECCREACION,
           AUDUSUCREACION,
           ID_MOTIVO)
        VALUES
          (N_ID_EXPEDIENTE_ESTADO,
           PI_N_ID_EXPEDIENTE,
           PI_N_ESTADO_EXPEDIENTE,
           SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO,
           SYSDATE,
           PI_V_AUDUSUCREACION,
           I_ID_MOTIVO_NUEVO);
      
        C_FLG_CANCELADO := '0';
        CASE
          WHEN PI_N_ESTADO_EXPEDIENTE =
               SCOB_PK_CONSTANTES.C_TBL_EST_EXP_CONCLUIDO AND
               I_ID_MOTIVO_NUEVO =
               SCOB_PK_CONSTANTES.C_TBL_MOTIVO_CONCL_CANCELADO THEN
            C_FLG_CANCELADO := '1';
          ELSE
            NULL;
        END CASE;
      
        --actualizar el estado del expediente
        UPDATE T_SCOB_EXPEDIENTE EXPE
           SET EXPE.ESTADO_EXPEDIENTE     = PI_N_ESTADO_EXPEDIENTE,
               EXPE.ID_MOTIVO             = I_ID_MOTIVO_NUEVO,
               EXPE.FEC_ESTADO_EXPEDIENTE = SYSDATE,
               EXPE.AUDUSUMODIFICACION    = PI_V_AUDUSUCREACION,
               EXPE.AUDFECMODIFICACION    = SYSDATE,
               FLG_CANCELADO              = DECODE(C_FLG_CANCELADO,
                                                   '0',
                                                   NULL,
                                                   C_FLG_CANCELADO)
         WHERE EXPE.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE;
      
        --actualizar el tipo de pago de la multa
        /*
        UPDATE T_SCOB_MULTA MULT
        SET MULT.IND_TIPO_PAGO = CASE
                                   WHEN PI_N_ESTADO_EXPEDIENTE = 4 THEN SCOB_PK_CONSTANTES.C_IND_TIPO_PAGO_FRACCIONADO
                                   WHEN PI_N_ESTADO_EXPEDIENTE = 5 THEN SCOB_PK_CONSTANTES.C_IND_TIPO_PAGO_PROGRAMADO
                                   ELSE SCOB_PK_CONSTANTES.C_IND_TIPO_PAGO_COACTIVO
                                 END
        WHERE MULT.ID_MULTA IN (
              SELECT EXMU.ID_MULTA
              FROM T_SCOB_EXPEDIENTE_MULTA EXMU
              WHERE EXMU.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
              AND EXMU.ESTADO = '1'
        );
        */
      END;
    END IF;
  
    PO_N_COD_ERROR := 0;
    ----
  EXCEPTION
    WHEN OTHERS THEN
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

  PROCEDURE SCOB_SP_I_EXPEDIENTE
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 04.04.2011
    -- Proposito    : genera un expediente y asocia las multas relacionadas.
    -----------------------------------------------------------
    -- Modificacion : 31.03.2017
    -- Autor        : @dcelis
    -- Modificado   : Se agreg? opciones de acumulaci?n.
    -- Proposito    : Cubrir el Req. 44: Acumulaci?n y Desacumulaci?n de CUM's a un Expediente de Cobranza.
    -----------------------------------------------------------
    */
  (PI_N_ID_EXPEDIENTE      IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
   PI_V_NRO_EXPEDIENTE     IN VARCHAR2,
   PI_V_ID_MULTA           IN VARCHAR2,
   PI_N_NRO_ITEMS          IN INTEGER,
   PI_V_AUDUSUCREACION     IN T_SCOB_MULTA_DETAL.AUDUSUCREACION%TYPE,
   PI_N_ID_USUARIO_INGRESO IN T_SCOB_EXPEDIENTE.ID_USUARIO_INGRESO%TYPE,
   PO_N_RETORNO            OUT NUMBER,
   PO_N_COD_ERROR          OUT NUMBER,
   PO_V_MSJ_ERROR          OUT VARCHAR2) AS
    N_ID_EXPEDIENTE         T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE;
    N_NRO_EXPEDIENTE        T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE;
    N_NRO_CUMS              INTEGER;
    N_VALOR_UIT             T_SCOB_MULTA_DETAL.VALOR_UIT%TYPE;
    N_VALOR_POR_ASOCU       T_SCOB_MULTA_DETAL.POR_ASOCU%TYPE;
    N_VALOR_MONTO_POR_ASOCU T_SCOB_MULTA_DETAL.MONTO_ASOCU%TYPE;
    N_MONTO_UIT             T_SCOB_MULTA.MONTO_UIT%TYPE;
    
    --INICIO VICTOR BENDEZU - INCIDENCIA UFC SALDO NULO
    N_MONTO_COSTAS            T_SCOB_MULTA.MONTO_COSTAS%TYPE;    
    N_MONTO_TOTAL_DEUDA       T_SCOB_MULTA.MONTO_TOTAL_DEUDA%TYPE;
    N_TOTAL_AMORTIZADO        T_SCOB_MULTA.TOTAL_AMORTIZADO%TYPE;
    N_TOTAL_AMORTIZADO_COSTAS T_SCOB_MULTA.TOTAL_AMORTIZADO_COSTAS%TYPE;
    N_TOTAL_AMORTIZADO_DEUDA  T_SCOB_MULTA.TOTAL_AMORTIZACION_DEUDA%TYPE;
    N_SALDO                   T_SCOB_MULTA.SALDO%TYPE;
    N_SALDO_COSTAS            T_SCOB_MULTA.SALDO_COSTAS%TYPE;
    N_MONTO_INTERES           T_SCOB_MULTA.MONTO_INTERES%TYPE;
    N_MONTO_INTERES_MORATORIO T_SCOB_MULTA.MONTO_INTERES_MORATORIO%TYPE;
    N_SALDO_IC                T_SCOB_MULTA.SALDO_IC%TYPE;
    N_SALDO_IM                T_SCOB_MULTA.SALDO_IM%TYPE;
    N_TOTAL_AMORTIZADO_IC    T_SCOB_MULTA.TOTAL_AMORTIZADO_IC%TYPE;
    N_TOTAL_AMORTIZADO_IM     T_SCOB_MULTA.TOTAL_AMORTIZADO_IM%TYPE;
    --FIN VICTOR BENDEZU - INCIDENCIA UFC SALDO NULO
    
    N_SALDO_TOTAL_DEUDA     T_SCOB_MULTA.SALDO_TOTAL_DEUDA%TYPE;
    C_FLG_TIPO_MULTA        CHAR(1);
    N_ID_AREA_COBRANZA      T_SCOB_USUARIO.ID_AREA_COBRANZA%TYPE;
    --C_ANIO_EXPEDIENTE                  T_SCOB_EXPEDIENTE.ANIO%TYPE;
    --I_EXISTE                           INTEGER;
    C_FLG_ENVIO_RIESGO         CHAR(1);
    D_FEC_ENVIO_RIESGO         DATE;
    D_FEC_INGRESO_ENVIO_RIESGO DATE;
    --
    /*
      ESTADO DEL FILTRO DE ACUMULACI?N:
      1: OK; 2:ERROR;
    */
    V_STATUS NUMBER;
    V_MSG    CLOB;
    --
    
    --INICIO VICTOR BENDEZU - MIGRACION SICOB A SIA
    VN_ID_MULTA T_SCOB_MULTA.ID_MULTA%TYPE;
    --FIN VICTOR BENDEZU - MIGRACION SICOB A SIA
    
  BEGIN
  
    PO_N_RETORNO   := 0;
    PO_N_COD_ERROR := 0;
    PO_V_MSJ_ERROR := ' ';
  
    -- @dcelis Req. 44
    SCOB_PK_ACUMULACION.SP_REG_ACUM(PI_V_ID_MULTA, V_STATUS, V_MSG);
    IF V_STATUS = 0 THEN
      PO_N_COD_ERROR := -99;
      PO_V_MSJ_ERROR := V_MSG;
      RETURN;
    END IF;
    -- @dcelis Req. 44
  
    --OBTENER EL AREA DE COBRANZA DEL USUARIO QUE INGRESA
    BEGIN
      SELECT USUA.ID_AREA_COBRANZA
        INTO N_ID_AREA_COBRANZA
        FROM T_SCOB_USUARIO USUA
       WHERE USUA.ID_USUARIO = PI_N_ID_USUARIO_INGRESO;
    
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        PO_N_COD_ERROR := -10;
        PO_V_MSJ_ERROR := 'No se pudo realizar la acci?n. El usuario logeado no corresponde a ninguna de las ?reas de cobranza.';
        PO_N_RETORNO   := PO_N_COD_ERROR;
        RETURN;
    END;
  
    --inserta el ingreso a EXPEDIENTE
    IF NVL(PI_N_ID_EXPEDIENTE, 0) = 0 THEN
      --genera el codigo secuencial del expediente
      SELECT SCOB_SQ_EXPEDIENTE.NEXTVAL INTO N_ID_EXPEDIENTE FROM DUAL;
    
      --genera el numero secuencia del expediente por a?o y area --20.08.2011
    
      SELECT NVL(MAX(EXPE.NRO_EXPEDIENTE), 0) + 1
        INTO N_NRO_EXPEDIENTE
        FROM T_SCOB_EXPEDIENTE EXPE
       WHERE EXPE.ESTADO = '1'
         AND EXPE.ANIO = TO_CHAR(SYSDATE, 'YYYY')
         AND NVL(EXPE.ID_AREA_COBRANZA, '0') = N_ID_AREA_COBRANZA;
    
      /*
      --VALIDACION DEL NRO DE EXPEDIENTE (A?O + CORRELATIVO)
      IF LENGTH(PI_V_NRO_EXPEDIENTE)<=4 THEN
        po_n_cod_error := -8;
        po_v_msj_error :='No se pudo realizar la acci?n. El Nro.Expediente debe tener como m?nimo 5 d?gitos.';
        po_n_retorno := po_n_cod_error;
        RETURN;
      END IF;
      
      C_ANIO_EXPEDIENTE := SUBSTR(PI_V_NRO_EXPEDIENTE,1,4);
      N_NRO_EXPEDIENTE := SUBSTR(PI_V_NRO_EXPEDIENTE,5,LENGTH(PI_V_NRO_EXPEDIENTE)); --TEMPORAL:15.06.2011
      
      --VALIDACION DEL INGRESO DEL A?O
      IF TO_NUMBER(C_ANIO_EXPEDIENTE) < 1900 OR
         TO_NUMBER(C_ANIO_EXPEDIENTE) > TO_NUMBER(TO_CHAR(SYSDATE,'YYYY')) THEN
          po_n_cod_error := -9;
          po_v_msj_error :='No se pudo realizar la acci?n. Los primeros 4 d?gitos del expediente debe corresponder al a?o del mismo, debe ingresar un a?o valido.';
          po_n_retorno := po_n_cod_error;
          RETURN;
      END IF;
      
      --VALIDACION DE LA DUPLICIDAD DEL NRO DE EXPEDIENTE.
      SELECT COUNT(EXPE.ID_EXPEDIENTE)
      INTO I_EXISTE
      FROM T_SCOB_EXPEDIENTE EXPE
      WHERE EXPE.ANIO = C_ANIO_EXPEDIENTE
      AND TO_NUMBER(EXPE.NRO_EXPEDIENTE) = TO_NUMBER(N_NRO_EXPEDIENTE)
      AND EXPE.ESTADO = '1';
      
      IF I_EXISTE > 0 THEN
        po_n_cod_error := -8;
        po_v_msj_error :='No se pudo realizar la acci?n. El Nro.Expediente antes ha sido registrado.';
        po_n_retorno := po_n_cod_error;
        RETURN;
      END IF;
      */
    ELSE
      N_ID_EXPEDIENTE := PI_N_ID_EXPEDIENTE;
    END IF;
    
    --actualiza los montos de la multa
    SELECT MULT.FLG_TIPO_MULTA,
           COUNT(MULT.ID_MULTA),
           SUM(MDET.VALOR_UIT),
           SUM(MDET.POR_ASOCU),
           SUM(MDET.MONTO_ASOCU),
           SUM(MULT.MONTO_UIT),
           --INICIO VICTOR BENDEZU - INCIDENCIA UFC SALDO NULO
           SUM(MULT.MONTO_COSTAS),
           SUM(MULT.MONTO_TOTAL_DEUDA),
           SUM(MULT.TOTAL_AMORTIZADO),
           SUM(MULT.TOTAL_AMORTIZADO_COSTAS),                                            
           SUM(MULT.TOTAL_AMORTIZACION_DEUDA),
           SUM(MULT.SALDO),
           SUM(MULT.SALDO_COSTAS),     
           SUM(MULT.MONTO_INTERES),
           SUM(MULT.MONTO_INTERES_MORATORIO),
           SUM(MULT.SALDO_IC),
           SUM(MULT.SALDO_IM),
           SUM(MULT.TOTAL_AMORTIZADO_IC),
           SUM(MULT.TOTAL_AMORTIZADO_IM),
           --FIN VICTOR BENDEZU - INCIDENCIA UFC SALDO NULO                            
           SUM(MULT.SALDO_TOTAL_DEUDA)
      INTO C_FLG_TIPO_MULTA,
           N_NRO_CUMS,
           N_VALOR_UIT,
           N_VALOR_POR_ASOCU,
           N_VALOR_MONTO_POR_ASOCU,
           N_MONTO_UIT,
           --INICIO VICTOR BENDEZU - INCIDENCIA UFC SALDO NULO
           N_MONTO_COSTAS,
           N_MONTO_TOTAL_DEUDA,
           N_TOTAL_AMORTIZADO,
           N_TOTAL_AMORTIZADO_COSTAS,
           N_TOTAL_AMORTIZADO_DEUDA,
           N_SALDO,
           N_SALDO_COSTAS,
           N_MONTO_INTERES,
           N_MONTO_INTERES_MORATORIO,
           N_SALDO_IC,
           N_SALDO_IM,
           N_TOTAL_AMORTIZADO_IC,
           N_TOTAL_AMORTIZADO_IM,
           --FIN VICTOR BENDEZU - INCIDENCIA UFC SALDO NULO 
           N_SALDO_TOTAL_DEUDA
      FROM T_SCOB_MULTA MULT
     INNER JOIN T_SCOB_MULTA_DETAL MDET
        ON MDET.ID_MULTA = MULT.ID_MULTA
       AND MDET.FLG_ACTUAL = '1'
     WHERE INSTR(PI_V_ID_MULTA, '|' || TO_CHAR(MULT.ID_MULTA) || '|') > 0
     GROUP BY MULT.FLG_TIPO_MULTA;
  
    FOR REC IN (SELECT MULT.FLG_ENVIO_RIESGO         AS FLG_ENVIO_RIESGO,
                       MULT.FEC_ENVIO_RIESGO         AS FEC_ENVIO_RIESGO,
                       MULT.FEC_INGRESO_ENVIO_RIESGO AS FEC_INGRESO_ENVIO_RIESGO
                  FROM T_SCOB_MULTA MULT
                 WHERE INSTR(PI_V_ID_MULTA,
                             '|' || TO_CHAR(MULT.ID_MULTA) || '|') > 0) LOOP
      --- EXP --06.01.2012
      C_FLG_ENVIO_RIESGO         := REC.FLG_ENVIO_RIESGO;
      D_FEC_ENVIO_RIESGO         := REC.FEC_ENVIO_RIESGO;
      D_FEC_INGRESO_ENVIO_RIESGO := REC.FEC_INGRESO_ENVIO_RIESGO;
    END LOOP;
  
    --inserta el expediente
    IF NVL(PI_N_ID_EXPEDIENTE, 0) = 0 THEN
    
      INSERT INTO T_SCOB_EXPEDIENTE
        (ID_EXPEDIENTE,
         NRO_EXPEDIENTE,
         ANIO,
         NRO_CUMS,
         VALOR_UIT,
         MONTO_UIT,
         --INICIO VICTOR BENDEZU - INCIDENCIA UFC SALDO NULO  
         MONTO_COSTAS,
         MONTO_TOTAL_DEUDA,
         TOTAL_AMORTIZADO,
         TOTAL_AMORTIZADO_COSTAS,
         TOTAL_AMORTIZADO_DEUDA,
         SALDO,
         SALDO_COSTAS,
         MONTO_INTERES,
         MONTO_INTERES_MORATORIO,
         SALDO_IC,
         SALDO_IM,
         TOTAL_AMORTIZADO_IC,
         TOTAL_AMORTIZADO_IM,
         --FIN VICTOR BENDEZU - INCIDENCIA UFC SALDO NULO
         SALDO_TOTAL_DEUDA,
         POR_ASOCU,
         MONTO_ASOCU,
         ESTADO,
         AUDFECCREACION,
         AUDUSUCREACION,
         FLG_TIPO_EXPEDIENTE,
         FEC_INGRESO,
         ID_USUARIO_INGRESO,
         COD_ESTADO_PAGO,
         ID_AREA_COBRANZA,
         FLG_EMBARGO,
         FLG_CANCELADO)
      VALUES
        (N_ID_EXPEDIENTE,
         LPAD(TO_CHAR(N_NRO_EXPEDIENTE), 10, '0000000000'),
         TO_CHAR(SYSDATE, 'YYYY'),
         --C_ANIO_EXPEDIENTE
         N_NRO_CUMS,
         N_VALOR_UIT,
         N_MONTO_UIT,
         --INICIO VICTOR BENDEZU - INCIDENCIA UFC SALDO NULO  
         N_MONTO_COSTAS,
         N_MONTO_TOTAL_DEUDA,
         N_TOTAL_AMORTIZADO,
         N_TOTAL_AMORTIZADO_COSTAS,
         N_TOTAL_AMORTIZADO_DEUDA,
         N_SALDO,
         N_SALDO_COSTAS,
         N_MONTO_INTERES,
         N_MONTO_INTERES_MORATORIO,
         N_SALDO_IC,
         N_SALDO_IM,
         N_TOTAL_AMORTIZADO_IC,
         N_TOTAL_AMORTIZADO_IM,
         --FIN VICTOR BENDEZU - INCIDENCIA UFC SALDO NULO  
         N_SALDO_TOTAL_DEUDA,
         N_VALOR_POR_ASOCU,
         N_VALOR_MONTO_POR_ASOCU,
         SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO,
         SYSDATE,
         PI_V_AUDUSUCREACION,
         C_FLG_TIPO_MULTA,
         SYSDATE,
         PI_N_ID_USUARIO_INGRESO,
         SCOB_PK_CONSTANTES.C_EST_PAGO_PENDIENTE,
         N_ID_AREA_COBRANZA,
         '0',
         --FLG_EMBARGO
         '0'
         --FLG_CANCELADO
         );
    
    ELSE
      UPDATE T_SCOB_EXPEDIENTE EXPE
         SET NRO_CUMS           = NVL(EXPE.NRO_CUMS, 0) + N_NRO_CUMS,
             VALOR_UIT          = NVL(EXPE.VALOR_UIT, 0) + N_VALOR_UIT,
             MONTO_UIT          = NVL(EXPE.MONTO_UIT, 0) + N_MONTO_UIT,
             --INICIO VICTOR BENDEZU - INCIDENCIA UFC SALDO NULO  
             MONTO_COSTAS     = NVL(EXPE.MONTO_COSTAS, 0) + N_MONTO_COSTAS,
             MONTO_TOTAL_DEUDA       = NVL(EXPE.MONTO_TOTAL_DEUDA, 0) + N_MONTO_TOTAL_DEUDA,
             TOTAL_AMORTIZADO        = NVL(EXPE.TOTAL_AMORTIZADO, 0) + N_TOTAL_AMORTIZADO,
             TOTAL_AMORTIZADO_COSTAS = NVL(EXPE.TOTAL_AMORTIZADO_COSTAS, 0) + N_TOTAL_AMORTIZADO_COSTAS,
             TOTAL_AMORTIZADO_DEUDA  = NVL(EXPE.TOTAL_AMORTIZADO_DEUDA, 0) + N_TOTAL_AMORTIZADO_DEUDA,
             SALDO                   = NVL(EXPE.SALDO, 0) + N_SALDO,
             SALDO_COSTAS            = NVL(EXPE.SALDO_COSTAS, 0) + N_SALDO_COSTAS,
             MONTO_INTERES = NVL(EXPE.MONTO_INTERES,0) + N_MONTO_INTERES,
             MONTO_INTERES_MORATORIO = NVL(EXPE.MONTO_INTERES_MORATORIO,0) + N_MONTO_INTERES_MORATORIO,
             SALDO_IC = NVL(EXPE.SALDO_IC,0) + N_SALDO_IC,
             SALDO_IM = NVL(EXPE.SALDO_IM,0) + N_SALDO_IM,
             TOTAL_AMORTIZADO_IC = NVL(EXPE.TOTAL_AMORTIZADO_IC,0) + N_TOTAL_AMORTIZADO_IC,
             TOTAL_AMORTIZADO_IM = NVL(EXPE.TOTAL_AMORTIZADO_IM,0) + N_TOTAL_AMORTIZADO_IM,
             --FIN VICTOR BENDEZU - INCIDENCIA UFC SALDO NULO  
             SALDO_TOTAL_DEUDA         = NVL(EXPE.SALDO_TOTAL_DEUDA, 0) +
                                  N_SALDO_TOTAL_DEUDA,
             AUDUSUMODIFICACION   = PI_V_AUDUSUCREACION,
             AUDFECMODIFICACION   = SYSDATE
       WHERE ID_EXPEDIENTE = N_ID_EXPEDIENTE;
    
    END IF;
  
    --inserta el detalle del expediente
    /*
      MODIFICADO POR: @dcelis
      INSERTAR VARIAS MULTAS AL EXPEDIENTE
    */
    -- INI: JCARRION@20170810 - EVITA QUE SE REGISTRE DOS VECES LA MISMA MULTA
    /* 
        
        INSERT INTO T_SCOB_EXPEDIENTE_MULTA
          (ID_EXPEDIENTE_MULTA,
           ID_MULTA,
           ID_EXPEDIENTE,
           ESTADO,
           AUDFECCREACION,
           AUDUSUCREACION)
          (SELECT SCOB_SQ_EXPEDIENTE_MULTA.NEXTVAL,
                  MULT.ID_MULTA,
                  N_ID_EXPEDIENTE,
                  SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO,
                  SYSDATE,
                  PI_V_AUDUSUCREACION
             FROM T_SCOB_MULTA MULT
            WHERE INSTR(PI_V_ID_MULTA, '|' || TO_CHAR(ID_MULTA) || '|') > 0);
    */
  
    INSERT INTO T_SCOB_EXPEDIENTE_MULTA
      (ID_EXPEDIENTE_MULTA,
       ID_MULTA,
       ID_EXPEDIENTE,
       ESTADO,
       AUDFECCREACION,
       AUDUSUCREACION)
      (SELECT SCOB_SQ_EXPEDIENTE_MULTA.NEXTVAL,
              MULT.ID_MULTA,
              N_ID_EXPEDIENTE,
              SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO,
              SYSDATE,
              PI_V_AUDUSUCREACION
         FROM T_SCOB_MULTA MULT
         LEFT JOIN T_SCOB_EXPEDIENTE_MULTA EXMU
           ON (EXMU.ID_MULTA = MULT.ID_MULTA AND EXMU.ESTADO = '1')
        WHERE EXMU.ID_MULTA IS NULL
          AND MULT.ID_MULTA IN
              (SELECT REGEXP_SUBSTR(PI_V_ID_MULTA, '[^|]+', 1, LEVEL) AS VC_TEXTO
                 FROM DUAL
               CONNECT BY REGEXP_SUBSTR(PI_V_ID_MULTA, '[^|]+', 1, LEVEL) IS NOT NULL));
  
    -- FIN: JCARRION@20170810 - EVITA QUE SE REGISTRE DOS VECES LA MISMA MULTA
  
    --ACTUALIZA IMPORTES DEL EXPEDIENTE 2011.12.21
    --@JPHR:ini
    --SCOB_PK_MULTAS.SCOB_SP_U_SALDO_EXP_COBRANZA(N_ID_EXPEDIENTE);
    --@JPHR:fin
  
    --actualizar el flag de multa coactiva:04.06.2011
    /*
    UPDATE T_SCOB_MULTA MULT
    SET
      MULT.IND_TIPO_PAGO = SCOB_PK_CONSTANTES.C_FLG_PAGO_COACTIVO --considerado como pago coactivo, asociado a un expediente.
    WHERE
      INSTR(PI_V_ID_MULTA,'|' || TO_CHAR(ID_MULTA) || '|' )>0;
    */
  
    --SI LA MULTA TIENE ACTIVO EL FLG DE ENVIO A RIESGO
    --EL EXPEDIENTE DEBE MOSTRAR COMO ACTIVO
    UPDATE T_SCOB_MULTA
       SET FLG_ENVIO_RIESGO_EXP         = C_FLG_ENVIO_RIESGO,
           FEC_ENVIO_RIESGO_EXP         = D_FEC_ENVIO_RIESGO,
           FEC_INGRESO_ENVIO_RIESGO_EXP = D_FEC_INGRESO_ENVIO_RIESGO
     WHERE INSTR(PI_V_ID_MULTA, '|' || TO_CHAR(ID_MULTA) || '|') > 0;
    --@JPHR INICIALIZA A NULL SI ES QUE TUVIERA ACUMULADOR
    --UPDATE T_SCOB_MULTA
    --  SET FLG_ACUMULADOR = NULL
    --WHERE INSTR(PI_V_ID_MULTA, '|' || TO_CHAR(ID_MULTA) || '|') > 0;
    --@JPHR SI SON VARIOS CUMS, SE AGREGA EL CAMPO ACUMULADOR AL PRIMERO
    /*IF N_NRO_CUMS > 1 THEN
      UPDATE T_SCOB_MULTA
         SET FLG_ACUMULADOR = 1 --AL PRIMERO
       WHERE ID_MULTA =
             SUBSTR(SUBSTR(PI_V_ID_MULTA, 2),
                    0,
                    INSTR(SUBSTR(PI_V_ID_MULTA, 2), '|') - 1);
    END IF;*/
    --insertar logs de estados
    SCOB_SP_I_EXPEDIENTE_ESTADO(N_ID_EXPEDIENTE,
                                0,
                                SCOB_PK_CONSTANTES.C_TBL_EST_EXP_PRECOACTIVO,
                                PI_V_AUDUSUCREACION,
                                PO_N_COD_ERROR,
                                PO_V_MSJ_ERROR);
    IF PO_N_COD_ERROR < 0 THEN
      RETURN;
    END IF;
    
    
    --INICIO VICTOR BENDEZU - MIGRACION SICOB A SIA    
    SELECT EXMU.ID_MULTA
        INTO VN_ID_MULTA
        FROM USR_SICOB.T_SCOB_EXPEDIENTE_MULTA EXMU
       WHERE EXMU.ID_EXPEDIENTE = N_ID_EXPEDIENTE
       AND EXMU.ESTADO = '1';
    
    USR_SIA_INTFZ.PKG_INTFZ_REG_MULTA_SICOB_SIA.SP_I_EXPEDIENTE_SICOB_A_SIA(PIN_NU_ID_MULTA => VN_ID_MULTA,
                                                                            POUT_NU_COD_RESULT => PO_N_RETORNO,
                                                                            POUT_VC_MSG_RESULT => PO_V_MSJ_ERROR);
    
    IF PO_N_RETORNO < 0 THEN
       ROLLBACK;
       RETURN;
    END IF;
    --FIN VICTOR BENDEZU - MIGRACION SICOB A SIA
        
    PO_N_RETORNO := N_ID_EXPEDIENTE;
    --ROLLBACK;
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

  PROCEDURE SCOB_SP_S_EXPED_DOC_GEN
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 13.05.2011
    -- Proposito    : Lista el detalle de los documentos generados por resoluciones
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_N_ID_EXPEDIENTE IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
   PO_CU_RETORNO      OUT CU_REC_SET) AS
  BEGIN
  
    OPEN PO_CU_RETORNO FOR
      SELECT EXDO.ID_EXPEDIENTE_DOCUMENTO AS ID_EXPEDIENTE_DOCUMENTO,
             EXDO.ESTADO_EXPEDIENTE AS COD_ESTADO,
             ESEX.DESCRIPCION AS NOM_ESTADO,
             MOPL.ID_MOTIVO AS COD_MOTIVO,
             EXMO.DESCRIPCION AS NOM_MOTIVO,
             TIDO.COD_SUBTIPO_DOCUMENTO AS COD_SUBTIPO_DOC,
             SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_SUB_TIPO_DOCUMENTO,
                                                      TIDO.COD_SUBTIPO_DOCUMENTO) AS NOM_SUBTIPO_DOC,
             EXDO.NOMBRE AS NOM_ARCHIVO,
             EXDO.NRO_DOCUMENTO AS NRO_DOCUMENTO,
             EXDO.NRO_RESOLUCION AS NRO_RESOLUCION,
             EXDO.FEC_INGRESO AS FEC_GENERACION,
             EXDO.AUDUSUCREACION AS COD_USUARIO_GENERACION,
             PLAN.ID_PLANTILLA AS COD_PLANTILLA,
             PLAN.DESCRIPCION AS NOM_PLANTILLA,
             DECODE(TIDO.COD_SUBTIPO_DOCUMENTO, '1', '1', '0') AS IND_RESOLUCION
        FROM T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
       INNER JOIN T_SCOB_TIPO_DOCUMENTO TIDO
          ON TIDO.ID_TIPO_DOCUMENTO = EXDO.ID_TIPO_DOCUMENTO
         AND TIDO.COD_SUBTIPO_DOCUMENTO NOT IN
             (SCOB_PK_CONSTANTES.C_COD_SUBTIPODOC_OFICIO,
              SCOB_PK_CONSTANTES.C_COD_SUBTIPODOC_CEDULA) --DISTINTO A OFICIOS Y CEDULAS
        LEFT JOIN T_SCOB_EST_EXP_COB ESEX
          ON ESEX.ID_EST_EXP_COB = EXDO.ESTADO_EXPEDIENTE
        LEFT JOIN T_SCOB_MOTIVO_PLANTILLA MOPL
          ON MOPL.ID_MOTIVO_PLANTILLA = EXDO.ID_MOTIVO_PLANTILLA
        LEFT JOIN T_SCOB_PLANTILLA PLAN
          ON PLAN.ID_PLANTILLA = MOPL.ID_PLANTILLA
        LEFT JOIN T_SCOB_EST_EXP_COB_MOTIVO EXMO
          ON EXMO.ID_MOTIVO = MOPL.ID_MOTIVO
         AND EXMO.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
       WHERE EXDO.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
            /*
            AND EXDO.COD_SUBTIPO_DOCUMENTO IN (
                SCOB_PK_CONSTANTES.C_TIPO_DOC_ASOC_SISTEMA,
                SCOB_PK_CONSTANTES.C_TIPO_DOC_ASOC_SISTEMA_ACT
                )
            */
         AND EXDO.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO;
  
  END;

  PROCEDURE SCOB_SP_S_EXPED_DOC_GEN_DET
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 13.05.2011
    -- Proposito    : Lista todos los documentos generados de un expediente
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_N_ID_EXPEDIENTE           IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
   PI_N_ID_EXPEDIENTE_DOCUMENTO IN T_SCOB_EXPEDIENTE_DOCUMENTO.ID_EXPEDIENTE_DOCUMENTO%TYPE,
   PO_CU_RETORNO                OUT CU_REC_SET) AS
  BEGIN
  
    OPEN PO_CU_RETORNO FOR
      SELECT EXDO.ID_EXPEDIENTE_DOCUMENTO AS ID_EXPEDIENTE_DOCUMENTO,
             EXDO.ESTADO_EXPEDIENTE AS COD_ESTADO,
             ESEX.DESCRIPCION AS NOM_ESTADO,
             MOPL.ID_MOTIVO AS COD_MOTIVO,
             EXMO.DESCRIPCION AS NOM_MOTIVO,
             TIDO.COD_SUBTIPO_DOCUMENTO AS COD_SUBTIPO_DOC,
             SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_SUB_TIPO_DOCUMENTO,
                                                      TIDO.COD_SUBTIPO_DOCUMENTO) AS NOM_SUBTIPO_DOC,
             EXDO.NOMBRE AS NOM_ARCHIVO,
             EXDO.NRO_DOCUMENTO AS NRO_DOCUMENTO,
             EXDO.NRO_RESOLUCION AS NRO_RESOLUCION,
             EXDO.FEC_INGRESO AS FEC_GENERACION,
             EXDO.AUDUSUCREACION AS COD_USUARIO_GENERACION,
             PLAN.ID_PLANTILLA AS COD_PLANTILLA,
             PLAN.DESCRIPCION AS NOM_PLANTILLA,
             DECODE(TIDO.COD_SUBTIPO_DOCUMENTO,
                    SCOB_PK_CONSTANTES.C_COD_SUBTIPODOC_RESOLUCION,
                    '1',
                    '0') AS IND_RESOLUCION
        FROM T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
       INNER JOIN T_SCOB_TIPO_DOCUMENTO TIDO
          ON TIDO.ID_TIPO_DOCUMENTO = EXDO.ID_TIPO_DOCUMENTO
        LEFT JOIN T_SCOB_EST_EXP_COB ESEX
          ON ESEX.ID_EST_EXP_COB = EXDO.ESTADO_EXPEDIENTE
        LEFT JOIN T_SCOB_MOTIVO_PLANTILLA MOPL
          ON MOPL.ID_MOTIVO_PLANTILLA = EXDO.ID_MOTIVO_PLANTILLA
        LEFT JOIN T_SCOB_PLANTILLA PLAN
          ON PLAN.ID_PLANTILLA = MOPL.ID_PLANTILLA
        LEFT JOIN T_SCOB_EST_EXP_COB_MOTIVO EXMO
          ON EXMO.ID_MOTIVO = MOPL.ID_MOTIVO
         AND EXMO.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
       WHERE EXDO.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
         AND EXDO.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
            /*
            AND EXDO.COD_SUBTIPO_DOCUMENTO IN (
                SCOB_PK_CONSTANTES.C_TIPO_DOC_ASOC_SISTEMA,
                SCOB_PK_CONSTANTES.C_TIPO_DOC_ASOC_SISTEMA_ACT
                )
            */
         AND EXDO.ID_EXPEDIENTE_DOCUMENTO_ORIGEN =
             PI_N_ID_EXPEDIENTE_DOCUMENTO;
  
  END;

  PROCEDURE SCOB_SP_D_EXPEDIENTE
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 04.04.2011
    -- Proposito    : eliminar un expediente y su relacion con las multas.
                      solo aplicable a expedientes con estado pre-coactivo
                      sin ninguna accion distinta a generaciones de expediente.
    -----------------------------------------------------------
    -- Modificacion : 15.06.2011
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_V_ID_EXPEDIENTE  IN VARCHAR2,
   PI_I_NRO_REG        IN INTEGER,
   PI_V_AUDUSUCREACION IN T_SCOB_MULTA_CHECK.AUDUSUCREACION%TYPE,
   PO_N_RETORNO        OUT NUMBER,
   PO_N_COD_ERROR      OUT NUMBER,
   PO_V_MSJ_ERROR      OUT VARCHAR2) IS
  BEGIN
    PO_N_RETORNO   := 0;
    PO_V_MSJ_ERROR := '';
    PO_N_COD_ERROR := -1;
  
    /*
      SELECT COUNT(EXPE.ID_EXPEDIENTE)
      INTO I_NRO_REG
      FROM T_SCOB_EXPEDIENTE EXPE
      LEFT JOIN (
        SELECT
          GRUPO.ID_EXPEDIENTE AS ID_EXPEDIENTE,
          COUNT(GRUPO.VERSION) AS NRO_DOCS
        FROM (
          SELECT
            EXDO.ID_EXPEDIENTE AS ID_EXPEDIENTE,
            EXDO.TITULO AS TITULO,
            MAX(TO_NUMBER(EXDO.NRO_VERSION)) AS VERSION
          FROM T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
          WHERE
          COD_GENERADOR_DOCUMENTO IS NOT NULL
          AND EXDO.ESTADO = '1'
          GROUP BY
          EXDO.ID_EXPEDIENTE, EXDO.TITULO
        ) GRUPO
        GROUP BY GRUPO.ID_EXPEDIENTE
    ) DOCS ON DOCS.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
      WHERE
        INSTR(PI_V_ID_EXPEDIENTE,'|' || TO_CHAR(EXPE.ID_EXPEDIENTE) || '|' )>0
        AND NVL(DOCS.NRO_DOCS,0) = 0
        AND EXPE.ESTADO_EXPEDIENTE = SCOB_PK_CONSTANTES.C_TBL_EST_EXP_PRECOACTIVO;
    
      IF I_NRO_REG = 0 THEN
        po_n_cod_error := -10;
        po_v_msj_error :='No se puede realizar la acci?n. El estado del expediente no debe tener documentos generados.';
        return;
      END IF;
      */
  
    UPDATE T_SCOB_EXPEDIENTE_MULTA EXMU
       SET EXMU.ESTADO             = SCOB_PK_CONSTANTES.C_ESTADO_INACTIVO,
           EXMU.AUDUSUMODIFICACION = PI_V_AUDUSUCREACION,
           EXMU.AUDFECMODIFICACION = SYSDATE
     WHERE INSTR(PI_V_ID_EXPEDIENTE,
                 '|' || TO_CHAR(EXMU.ID_EXPEDIENTE) || '|') > 0;
  
    UPDATE T_SCOB_EXPEDIENTE_PERSONA EXPP
       SET EXPP.ESTADO             = SCOB_PK_CONSTANTES.C_ESTADO_INACTIVO,
           EXPP.AUDUSUMODIFICACION = PI_V_AUDUSUCREACION,
           EXPP.AUDFECMODIFICACION = SYSDATE
     WHERE INSTR(PI_V_ID_EXPEDIENTE,
                 '|' || TO_CHAR(EXPP.ID_EXPEDIENTE) || '|') > 0;
  
    UPDATE T_SCOB_EXPEDIENTE_ESTADO EXES
       SET EXES.ESTADO             = SCOB_PK_CONSTANTES.C_ESTADO_INACTIVO,
           EXES.AUDUSUMODIFICACION = PI_V_AUDUSUCREACION,
           EXES.AUDFECMODIFICACION = SYSDATE
     WHERE INSTR(PI_V_ID_EXPEDIENTE,
                 '|' || TO_CHAR(EXES.ID_EXPEDIENTE) || '|') > 0;
  
    UPDATE T_SCOB_EXPEDIENTE EXPE
       SET EXPE.ESTADO             = SCOB_PK_CONSTANTES.C_ESTADO_INACTIVO,
           EXPE.AUDUSUMODIFICACION = PI_V_AUDUSUCREACION,
           EXPE.AUDFECMODIFICACION = SYSDATE
     WHERE INSTR(PI_V_ID_EXPEDIENTE,
                 '|' || TO_CHAR(EXPE.ID_EXPEDIENTE) || '|') > 0;
  
    /*
    UPDATE T_SCOB_MULTA MULT
    SET
      MULT.IND_TIPO_PAGO = SCOB_PK_CONSTANTES.C_FLG_PAGO_VOLUNTARIO
    WHERE MULT.ID_MULTA IN (
      SELECT MDET.ID_MULTA
      FROM T_SCOB_EXPEDIENTE_MULTA EXMU
      INNER JOIN T_SCOB_MULTA_DETAL MDET
            ON MDET.ID_MULTA = EXMU.ID_MULTA
      WHERE
           INSTR(PI_V_ID_EXPEDIENTE,'|' || TO_CHAR(EXMU.ID_EXPEDIENTE) || '|' )>0
    );
    */
  
    PO_N_COD_ERROR := 0;
    PO_N_RETORNO   := 1;
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

  PROCEDURE SCOB_SP_D_EXPEDIENTE_MULTA
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 07.04.2011
    -- Proposito    : eliminar las multas de un expediente.
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_N_ID_EXPEDIENTE       IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
   PI_V_ID_EXPEDIENTE_MULTA IN VARCHAR2,
   PI_V_AUDUSUMODIFICACION  IN T_SCOB_EXPEDIENTE.AUDUSUMODIFICACION%TYPE,
   PO_N_RETORNO             OUT NUMBER,
   PO_N_COD_ERROR           OUT NUMBER,
   PO_V_MSJ_ERROR           OUT VARCHAR2) IS
    I_NRO_REG INTEGER;
  BEGIN
    PO_V_MSJ_ERROR := '';
    PO_N_RETORNO   := 0;
    PO_N_COD_ERROR := -1;
  
    SELECT COUNT(EXPE.ID_EXPEDIENTE)
      INTO I_NRO_REG
      FROM T_SCOB_EXPEDIENTE EXPE
      LEFT JOIN (SELECT GRUPO.ID_EXPEDIENTE AS ID_EXPEDIENTE,
                        COUNT(GRUPO.VERSION) AS NRO_DOCS
                   FROM (SELECT EXDO.ID_EXPEDIENTE AS ID_EXPEDIENTE,
                                EXDO.TITULO AS TITULO,
                                MAX(TO_NUMBER(EXDO.NRO_VERSION)) AS VERSION
                           FROM T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
                          WHERE COD_GENERADOR_DOCUMENTO IS NOT NULL
                            AND EXDO.ESTADO = '1'
                          GROUP BY EXDO.ID_EXPEDIENTE, EXDO.TITULO) GRUPO
                  GROUP BY GRUPO.ID_EXPEDIENTE) DOCS
        ON DOCS.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
     WHERE EXPE.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
       AND NVL(DOCS.NRO_DOCS, 0) = 0
       AND EXPE.ESTADO_EXPEDIENTE =
           SCOB_PK_CONSTANTES.C_TBL_EST_EXP_PRECOACTIVO;
  
    IF I_NRO_REG = 0 THEN
      PO_N_COD_ERROR := -10;
      PO_V_MSJ_ERROR := 'No se puede realizar la acci?n. El estado del expediente no debe tener documentos generados.';
      RETURN;
    END IF;
  
    --elimina la multa del expediente
    UPDATE T_SCOB_EXPEDIENTE_MULTA EXMU
       SET EXMU.ESTADO             = SCOB_PK_CONSTANTES.C_ESTADO_INACTIVO,
           EXMU.AUDUSUMODIFICACION = PI_V_AUDUSUMODIFICACION,
           EXMU.AUDFECMODIFICACION = SYSDATE
     WHERE INSTR(PI_V_ID_EXPEDIENTE_MULTA,
                 '|' || TO_CHAR(EXMU.ID_EXPEDIENTE_MULTA) || '|') > 0;
  
    --actualizar el flag de multa coactiva:04.06.2011
    /*
    UPDATE T_SCOB_MULTA MULT
    SET
      MULT.IND_TIPO_PAGO = SCOB_PK_CONSTANTES.C_FLG_PAGO_VOLUNTARIO --considerado como pago coactivo, asociado a un expediente.
    WHERE MULT.ID_MULTA IN (
      SELECT MDET.ID_MULTA
      FROM T_SCOB_EXPEDIENTE_MULTA EXMU
      INNER JOIN T_SCOB_MULTA_DETAL MDET
            ON MDET.ID_MULTA = EXMU.ID_MULTA
      WHERE
           INSTR(PI_V_ID_EXPEDIENTE_MULTA,'|' || TO_CHAR(EXMU.ID_EXPEDIENTE_MULTA) || '|' )>0);
    */
    PO_N_COD_ERROR := 0;
    PO_N_RETORNO   := PI_N_ID_EXPEDIENTE;
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

  PROCEDURE SCOB_SP_I_EXPEDIENTE_ADJUNTO
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 07/04/2011
    -- Proposito    : insertar los documentos adjuntos
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_N_ID_EXPEDIENTE  IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
   PI_V_TITULO         IN T_SCOB_EXPEDIENTE_DOCUMENTO.TITULO%TYPE,
   PI_V_NOMBRE         IN T_SCOB_EXPEDIENTE_DOCUMENTO.NOMBRE%TYPE,
   PI_N_TAMANIO        IN T_SCOB_EXPEDIENTE_DOCUMENTO.TAMANIO%TYPE,
   PI_V_AUDUSUCREACION IN T_SCOB_EXPEDIENTE_DOCUMENTO.AUDUSUCREACION%TYPE,
   PO_N_RETORNO        OUT NUMBER,
   PO_N_COD_ERROR      OUT NUMBER,
   PO_V_MSJ_ERROR      OUT VARCHAR2) IS
    N_ID_EXPEDIENTE_DOCUMENTO T_SCOB_EXPEDIENTE_DOCUMENTO.ID_EXPEDIENTE_DOCUMENTO%TYPE;
    V_ESTADO_EXPEDIENTE       T_SCOB_EXPEDIENTE_DOCUMENTO.ESTADO_EXPEDIENTE%TYPE;
  BEGIN
    PO_V_MSJ_ERROR := '';
    PO_N_RETORNO   := 0;
    PO_N_COD_ERROR := -1;
  
    --obtener el estado actual del expediente
    SELECT EXPE.ESTADO_EXPEDIENTE
      INTO V_ESTADO_EXPEDIENTE
      FROM T_SCOB_EXPEDIENTE EXPE
     WHERE EXPE.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE;
  
    SELECT SCOB_SQ_EXPEDIENTE_DOCUMENTO.NEXTVAL
      INTO N_ID_EXPEDIENTE_DOCUMENTO
      FROM DUAL;
    INSERT INTO T_SCOB_EXPEDIENTE_DOCUMENTO
      (ID_EXPEDIENTE_DOCUMENTO,
       ID_EXPEDIENTE,
       TITULO,
       NOMBRE,
       TAMANIO,
       TIPO_DOC_ASOC,
       ESTADO_EXPEDIENTE,
       ESTADO,
       AUDFECCREACION,
       AUDUSUCREACION)
    VALUES
      (N_ID_EXPEDIENTE_DOCUMENTO,
       PI_N_ID_EXPEDIENTE,
       PI_V_TITULO,
       PI_V_NOMBRE,
       PI_N_TAMANIO,
       SCOB_PK_CONSTANTES.C_TIPO_DOC_ASOC_ADJUNTO,
       --TIPO_DOC_ASOC
       V_ESTADO_EXPEDIENTE,
       SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO,
       SYSDATE,
       PI_V_AUDUSUCREACION);
  
    PO_N_COD_ERROR := 0;
    PO_N_RETORNO   := PI_N_ID_EXPEDIENTE;
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

  PROCEDURE SCOB_SP_D_EXPEDIENTE_ADJUNTO
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 07.04.2011
    -- Proposito    : actualiza al estado eliminado los documentos adjuntos seleccionados
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_V_ID_EXPEDIENTE_DOCUMENTO IN VARCHAR2,
   PI_V_AUDUSUCREACION          IN T_SCOB_EXPEDIENTE_DOCUMENTO.AUDUSUCREACION%TYPE,
   PO_N_RETORNO                 OUT NUMBER,
   PO_N_COD_ERROR               OUT NUMBER,
   PO_V_MSJ_ERROR               OUT VARCHAR2) IS
  BEGIN
    PO_V_MSJ_ERROR := '';
    PO_N_RETORNO   := 0;
    PO_N_COD_ERROR := -1;
  
    UPDATE T_SCOB_EXPEDIENTE_DOCUMENTO
       SET AUDUSUMODIFICACION = PI_V_AUDUSUCREACION,
           AUDFECMODIFICACION = SYSDATE,
           ESTADO             = SCOB_PK_CONSTANTES.C_ESTADO_INACTIVO
     WHERE INSTR(PI_V_ID_EXPEDIENTE_DOCUMENTO,
                 '|' || TO_CHAR(ID_EXPEDIENTE_DOCUMENTO) || '|') > 0;
  
    PO_N_COD_ERROR := 0;
    PO_N_RETORNO   := 0;
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

  PROCEDURE SCOB_SP_S_EXPEDIENTE_ADJUNTO
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 07.04.2011
    -- Proposito    : consulta los documentos adjuntos asociados a un expediente.
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_N_ID_EXPEDIENTE IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
   PI_I_TIPO_DOC_ASOC IN T_SCOB_EXPEDIENTE_DOCUMENTO.TIPO_DOC_ASOC%TYPE,
   PO_CU_RETORNO      OUT CU_REC_SET) AS
  BEGIN
    OPEN PO_CU_RETORNO FOR
    
      SELECT EXDO.ID_EXPEDIENTE_DOCUMENTO AS ID_DOCUMENTO,
             EXDO.TITULO                  AS TIT_DOCUMENTO,
             EXDO.NOMBRE                  AS NOM_DOCUMENTO,
             EXDO.TAMANIO                 AS TMN_DOCUMENTO,
             EXDO.AUDUSUCREACION          AS USU_GENERADO_POR,
             EXDO.AUDFECCREACION          AS FEC_GENERADO_POR
        FROM T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
       INNER JOIN T_SCOB_EXPEDIENTE EXPE
          ON EXPE.ID_EXPEDIENTE = EXDO.ID_EXPEDIENTE
        LEFT JOIN T_SCOB_EST_EXP_COB_MOTIVO MOTI
          ON MOTI.ID_MOTIVO = EXDO.ID_MOTIVO_PLANTILLA
       WHERE (NVL(PI_I_TIPO_DOC_ASOC, 0) = 0 OR
             (NVL(PI_I_TIPO_DOC_ASOC, 0) <> 0 AND
             EXDO.TIPO_DOC_ASOC = PI_I_TIPO_DOC_ASOC))
         AND EXDO.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
         AND EXDO.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
       ORDER BY EXDO.TITULO;
  
  END;

  PROCEDURE SCOB_SP_S_T_SCOB_COSTA
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 11.04.2011
    -- Proposito    : lista las costas
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_N_ID_EXPEDIENTE           IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
   PI_N_ID_EXPEDIENTE_DOCUMENTO IN T_SCOB_EXPEDIENTE_DOCUMENTO.ID_EXPEDIENTE_DOCUMENTO%TYPE,
   PO_CU_RETORNO                OUT CU_REC_SET) AS
    N_SALDO_CAPITAL T_SCOB_EXPEDIENTE.SALDO%TYPE;
    N_MONTO_UIT     T_SCOB_UIT.MONTO_UIT%TYPE;
  BEGIN
  
    --obtener el valor UIT a la fecha actual
    N_MONTO_UIT := NULL;
    SELECT UIT.MONTO_UIT
      INTO N_MONTO_UIT
      FROM T_SCOB_UIT UIT
     WHERE TO_DATE(TO_CHAR(SYSDATE, 'DD/MM/YYYY'), 'DD/MM/YYYY') BETWEEN
           UIT.FECHA_INICIO AND UIT.FECHA_FIN
       AND UIT.ESTADO = '1'
       AND ROWNUM = 1;
  
    --obtener el saldo capital del expediente
    SELECT SUM(MULT.SALDO +
               (DECODE(MULT.FLG_TIPO_MULTA, '0', 0, NVL(MULT.SALDO_IC, 0))))
      INTO N_SALDO_CAPITAL
      FROM T_SCOB_MULTA MULT
     INNER JOIN T_SCOB_EXPEDIENTE_MULTA EXMU
        ON EXMU.ID_MULTA = MULT.ID_MULTA
       AND EXMU.ESTADO = '1'
       AND EXMU.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE;
  
    OPEN PO_CU_RETORNO FOR
    
      SELECT CSTA.ID_COSTA AS ID_COSTAS,
             CSTA.CODIGO AS COD_COSTAS,
             CSTA.DESCRIPCION AS NOM_COSTAS,
             SUM(ECOS.CNT_COSTA) AS CNT_COSTAS, --ASOCIADAS AL EXPEDIENTE
             
             --@0002:Ini
             /*
             DECODE(NVL(CSTA.FLG_GASTO,'0'),'1',1,DECODE(NVL(ECOS.ID_COSTA,0),0,
                              DECODE(NVL(FLG_UIT_MAX,'0'),'0',CSTA.PORCENTAJE_UIT,CSTA.PORCENTAJE_UIT_MAX),
                              ECOS.PORCENTAJE_UIT)) AS PORCENTAJE_UIT,
             */
             DECODE(NVL(CSTA.FLG_GASTO, '0'),
                    '1',
                    1,
                    DECODE(NVL(CSTA.FLG_UIT_MAX, '0'),
                           '0',
                           CSTA.PORCENTAJE_UIT,
                           CSTA.PORCENTAJE_UIT_MAX)) AS PORCENTAJE_UIT,
             --@0002:Fin
             
             --@0002:Ini
             /*
             DECODE(NVL(CSTA.FLG_GASTO,'0'),'1',1,DECODE(NVL(ECOS.ID_COSTA,0),0,
                              DECODE(NVL(FLG_UIT_MAX,'0'),'0',
                                       N_MONTO_UIT*(CSTA.PORCENTAJE_UIT/100),
                                       CASE
                                           WHEN N_SALDO_CAPITAL*(CSTA.PORCENTAJE_UIT/100)>
                                                N_MONTO_UIT*(CSTA.PORCENTAJE_UIT_MAX/100) THEN
                                                N_MONTO_UIT*(CSTA.PORCENTAJE_UIT_MAX/100)
                                           ELSE N_SALDO_CAPITAL*(CSTA.PORCENTAJE_UIT/100)
                                       END
                                     ),
                              SUM(ECOS.VALOR_SOLES))) AS VALOR_SOLES,
             */
             DECODE(NVL(CSTA.FLG_GASTO, '0'),
                    '1',
                    1,
                    DECODE(NVL(CSTA.FLG_UIT_MAX, '0'),
                           '0',
                           N_MONTO_UIT * (CSTA.PORCENTAJE_UIT / 100),
                           CASE
                             WHEN N_SALDO_CAPITAL * (CSTA.PORCENTAJE_UIT / 100) >
                                  N_MONTO_UIT * (CSTA.PORCENTAJE_UIT_MAX / 100) THEN
                              N_MONTO_UIT * (CSTA.PORCENTAJE_UIT_MAX / 100)
                             ELSE
                              N_SALDO_CAPITAL * (CSTA.PORCENTAJE_UIT / 100)
                           END)) AS VALOR_SOLES,
             --@0002:Fin
             
             NULL AS CNT_COSTAS_DOC, --ASOCIADAS AL DOCUMENTO
             SUM(ECOS.MONTO_COSTA) AS MONTO_COSTAS, --SUBTOTAL
             NVL(CSTA.FLG_GASTO, '0') AS FLG_GASTO
      
        FROM T_SCOB_COSTA CSTA
        LEFT JOIN T_SCOB_EXPEDIENTE_COSTA ECOS
          ON (PI_N_ID_EXPEDIENTE_DOCUMENTO = 0 OR
             (PI_N_ID_EXPEDIENTE_DOCUMENTO <> 0 AND
             ECOS.ID_EXPEDIENTE_DOCUMENTO = PI_N_ID_EXPEDIENTE_DOCUMENTO))
         AND ECOS.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
         AND ECOS.ID_COSTA = CSTA.ID_COSTA
         AND ECOS.ESTADO = '1'
       WHERE CSTA.ESTADO = '1'
      
       GROUP BY CSTA.ID_COSTA,
                CSTA.CODIGO,
                CSTA.DESCRIPCION,
                --@0002:Ini
                --ECOS.ID_COSTA,
                --@0002:Fin
                CSTA.FLG_UIT_MAX,
                CSTA.PORCENTAJE_UIT,
                CSTA.PORCENTAJE_UIT_MAX,
                --@0002:Ini
                --ECOS.PORCENTAJE_UIT,
                --@0002:Fin
                CSTA.FLG_GASTO
      
       ORDER BY TO_NUMBER(NVL(CSTA.CODIGO, 0)) ASC,
                NVL(CSTA.FLG_GASTO, 0) DESC;
  
  END;

  PROCEDURE SCOB_SP_I_AGREGAR_COSTA_EXPED
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 10.09.2011
    -- Proposito    : agregar costas a un expediente, sin documento generado.
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_N_ID_EXPEDIENTE     IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
   PI_N_ID_CUM_EXPEDIENTE IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
   PI_V_ID_COSTAS         IN VARCHAR2,
   PI_V_POR_COSTAS        IN VARCHAR2,
   PI_V_VAL_COSTAS        IN VARCHAR2,
   PI_V_CNT_COSTAS        IN VARCHAR2,
   PI_V_SUB_TOTAL_COSTAS  IN VARCHAR2,
   PI_N_TOTAL_COSTAS      IN T_SCOB_EXPEDIENTE.MONTO_COSTAS%TYPE,
   PI_N_NRO_ITEMS         IN INTEGER,
   PI_V_AUDUSUCREACION    IN T_SCOB_EXPEDIENTE_DOCUMENTO.AUDUSUCREACION%TYPE,
   PI_C_FLG_AGREGAR       IN CHAR, --AGREGAR=1;DISMINUIR=0
   PO_N_RETORNO           OUT NUMBER,
   PO_N_COD_ERROR         OUT NUMBER,
   PO_V_MSJ_ERROR         OUT VARCHAR2) IS
   
  N_MONTO_COSTA             T_SCOB_EXPEDIENTE_COSTA.MONTO_COSTA%TYPE;
  N_TOTAL_AMORTIZADO_COSTAS T_SCOB_EXPEDIENTE.TOTAL_AMORTIZADO_COSTAS%TYPE;
  
  BEGIN
    PO_V_MSJ_ERROR := '';
    PO_N_COD_ERROR := -1;
    
    DBMS_OUTPUT.put_line('SCOB_SP_I_AGREGAR_COSTA_EXPED>>PI_N_ID_EXPEDIENTE>>' || PI_N_ID_EXPEDIENTE);
    --VERIFICA SI ES UN CUM QUE VIENE DE UN EXPEDIENTE ACUMULADOR
    IF PI_N_ID_CUM_EXPEDIENTE = 0 THEN 
      
      SCOB_SP_I_T_SCOB_EXPED_COSTA(PI_N_ID_EXPEDIENTE,
                                   0, --PI_N_ID_EXPEDIENTE_DOCUMENTO,
                                   PI_V_ID_COSTAS,
                                   PI_V_POR_COSTAS,
                                   PI_V_VAL_COSTAS,
                                   PI_V_CNT_COSTAS,
                                   PI_V_SUB_TOTAL_COSTAS,
                                   PI_N_TOTAL_COSTAS,
                                   PI_N_NRO_ITEMS,
                                   PI_V_AUDUSUCREACION,
                                   PI_C_FLG_AGREGAR,
                                   PO_N_COD_ERROR,
                                   PO_V_MSJ_ERROR);
                                 
                                    
    ELSE 
                                   
      SCOB_SP_I_SCOB_CUM_EXPED_COSTA(PI_N_ID_EXPEDIENTE,
                                     PI_N_ID_CUM_EXPEDIENTE,
                                     0, --PI_N_ID_EXPEDIENTE_DOCUMENTO,
                                     PI_V_ID_COSTAS,
                                     PI_V_POR_COSTAS,
                                     PI_V_VAL_COSTAS,
                                     PI_V_CNT_COSTAS,
                                     PI_V_SUB_TOTAL_COSTAS,
                                     PI_N_TOTAL_COSTAS,
                                     PI_N_NRO_ITEMS,
                                     PI_V_AUDUSUCREACION,
                                     PI_C_FLG_AGREGAR,
                                     PO_N_COD_ERROR,
                                     PO_V_MSJ_ERROR);
                                     
    END IF;  
                                 
    IF PO_N_COD_ERROR < 0 THEN
      IF PO_N_COD_ERROR = -9 THEN
        NULL;
      ELSE
        PO_V_MSJ_ERROR := 'No se puede realizar la acci?n. Problemas al intentar actualizar las costas.';
        PO_N_COD_ERROR := -10;
      END IF;
      ROLLBACK;
      RETURN;
    END IF;
  
    --validar el valor a disminuir respecto al total amortizado
    SELECT NVL(SUM(EXCO.MONTO_COSTA), 0)
      INTO N_MONTO_COSTA
      FROM T_SCOB_EXPEDIENTE_COSTA EXCO
     WHERE EXCO.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE;
    SELECT EXPE.TOTAL_AMORTIZADO_COSTAS
      INTO N_TOTAL_AMORTIZADO_COSTAS
      FROM T_SCOB_EXPEDIENTE EXPE
     WHERE EXPE.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE;
    IF N_TOTAL_AMORTIZADO_COSTAS > N_MONTO_COSTA THEN
      PO_V_MSJ_ERROR := 'No se puede realizar la acci?n. El total de las costas no puede ser menor al total amortizado.';
      PO_N_COD_ERROR := -9;
      ROLLBACK;
      RETURN;
    END IF;
  
    PO_N_RETORNO := 0;
    COMMIT;
    ----
  EXCEPTION
    WHEN OTHERS THEN
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

  PROCEDURE SCOB_SP_S_AGREGAR_COSTA_EXPED
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 10.09.2011
    -- Proposito    : lista las costas del expediente, sin considerar documento.
                      se muestra desde la bandeja principal de expedientes
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_N_ID_EXPEDIENTE IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
   V_CUMS             OUT CLOB,
   PO_CU_RETORNO_CAB  OUT CU_REC_SET,
   PO_CU_RETORNO      OUT CU_REC_SET) AS
    N_SALDO_CAPITAL T_SCOB_EXPEDIENTE.SALDO%TYPE;
    N_MONTO_UIT     T_SCOB_UIT.MONTO_UIT%TYPE;
  BEGIN
    --obtener el valor UIT a la fecha actual
    N_MONTO_UIT := NULL;
    SELECT UIT.MONTO_UIT
      INTO N_MONTO_UIT
      FROM T_SCOB_UIT UIT
     WHERE TO_DATE(TO_CHAR(SYSDATE, 'DD/MM/YYYY'), 'DD/MM/YYYY') BETWEEN
           UIT.FECHA_INICIO AND UIT.FECHA_FIN
       AND UIT.ESTADO = '1';
  
    --obtener el saldo capital del expediente
    SELECT MULT.SALDO +
           (DECODE(MULT.FLG_TIPO_MULTA, '0', 0, NVL(MULT.SALDO_IC, 0)))
      INTO N_SALDO_CAPITAL
      FROM T_SCOB_MULTA MULT
     INNER JOIN T_SCOB_EXPEDIENTE_MULTA EXMU
        ON EXMU.ID_MULTA = MULT.ID_MULTA
       AND EXMU.ESTADO = '1'
    --@JPHR
     INNER JOIN T_SCOB_EXPEDIENTE EXPE
        ON EXMU.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
    --AND EXPE.NRO_CUMS = '1'
    --AND EXMU.FLG_INACTIVO IS NULL
     WHERE EXMU.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
          -- @dcelis Req.44
       AND MULT.ID_MULTA =
           SCOB_PK_EXPEDIENTE.SCOB_FN_MUL_ANTIGUO(EXMU.ID_EXPEDIENTE)
    -- @dcelis Req.44
    UNION
    SELECT MULT.SALDO +
           (DECODE(MULT.FLG_TIPO_MULTA, '0', 0, NVL(MULT.SALDO_IC, 0)))
      FROM T_SCOB_MULTA MULT
     INNER JOIN T_SCOB_EXPEDIENTE_MULTA EXMU
        ON EXMU.ID_MULTA = MULT.ID_MULTA
     INNER JOIN T_SCOB_EXPEDIENTE EXPE
        ON EXMU.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
       AND EXPE.NRO_CUMS > 1
    --AND EXMU.FLG_ACUMULADOR = '1'
    --AND EXMU.FLG_INACTIVO IS NULL
     WHERE EXMU.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
          -- @dcelis Req.44
       AND MULT.ID_MULTA =
           SCOB_PK_EXPEDIENTE.SCOB_FN_MUL_ANTIGUO(EXMU.ID_EXPEDIENTE);
    -- @dcelis Req.44
  
    OPEN PO_CU_RETORNO_CAB FOR
      SELECT EXPE.MONTO_COSTAS AS TOTAL_MONTO_COSTAS,
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
       WHERE EXPE.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE;
  
    OPEN PO_CU_RETORNO FOR
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
       
       DECODE(NVL(CSTA.FLG_GASTO, '0'),
              '1',
              1,
              DECODE(NVL(CSTA.FLG_UIT_MAX, '0'),
                     '0',
                     N_MONTO_UIT * (CSTA.PORCENTAJE_UIT / 100),
                     CASE
                       WHEN N_SALDO_CAPITAL * (CSTA.PORCENTAJE_UIT / 100) >
                            N_MONTO_UIT * (CSTA.PORCENTAJE_UIT_MAX / 100) THEN
                        N_MONTO_UIT * (CSTA.PORCENTAJE_UIT_MAX / 100)
                       ELSE
                        N_SALDO_CAPITAL * (CSTA.PORCENTAJE_UIT / 100)
                     END)) AS VALOR_SOLES,
       
       NVL(CSTA.FLG_GASTO, '0') AS FLG_GASTO,
       N_SALDO_CAPITAL AS SALDO_CAPITAL,
       NVL(FLG_UIT_MAX, '0') AS FLG_UIT_MAX
        FROM T_SCOB_COSTA CSTA
        LEFT JOIN T_SCOB_EXPEDIENTE_COSTA ECOS
          ON ECOS.ID_COSTA = CSTA.ID_COSTA
         AND ECOS.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
         AND ECOS.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
       WHERE CSTA.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
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
    --
    SELECT SCOB_PK_EXPEDIENTE.SCOB_FN_CUMS_EXP(PI_N_ID_EXPEDIENTE)
      INTO V_CUMS
      FROM DUAL;
    --
  END;

  PROCEDURE SCOB_SP_I_T_SCOB_EXPED_COSTA
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 20.04.2011
    -- Proposito    : actualizar las costas asociadas a un documento
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   : 2023-02-19
    -- Proposito    : Procesos en linea
    -----------------------------------------------------------
    */
  (PI_N_ID_EXPEDIENTE           IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
   PI_N_ID_EXPEDIENTE_DOCUMENTO IN T_SCOB_EXPEDIENTE_DOCUMENTO.ID_EXPEDIENTE_DOCUMENTO%TYPE,
   PI_V_ID_COSTAS               IN VARCHAR2,
   PI_V_POR_COSTAS              IN VARCHAR2,
   PI_V_VAL_COSTAS              IN VARCHAR2,
   PI_V_CNT_COSTAS              IN VARCHAR2,
   PI_V_SUB_TOTAL_COSTAS        IN VARCHAR2,
   PI_N_TOTAL_COSTAS            IN T_SCOB_EXPEDIENTE.MONTO_COSTAS%TYPE,
   PI_N_NRO_ITEMS               IN INTEGER,
   PI_V_AUDUSUCREACION          IN T_SCOB_EXPEDIENTE_DOCUMENTO.AUDUSUCREACION%TYPE,
   PI_C_FLG_AGREGAR             IN CHAR, --AGREGAR=1;DISMINUIR=0
   PO_N_COD_ERROR               OUT NUMBER,
   PO_V_MSJ_ERROR               OUT VARCHAR2) IS
    N_ID_EXPEDIENTE_COSTA T_SCOB_EXPEDIENTE_COSTA.ID_EXPEDIENTE_COSTA%TYPE;
  
    V_ID_COSTAS        VARCHAR2(20);
    V_POR_COSTAS       VARCHAR2(20);
    V_VAL_COSTAS       VARCHAR2(20);
    V_CNT_COSTAS       VARCHAR2(20);
    V_SUB_TOTAL_COSTAS VARCHAR2(20);
  
    N_POR_COSTAS       T_SCOB_EXPEDIENTE_COSTA.PORCENTAJE_UIT%TYPE;
    N_VAL_COSTAS       T_SCOB_EXPEDIENTE_COSTA.VALOR_SOLES%TYPE;
    N_CNT_COSTAS       T_SCOB_EXPEDIENTE_COSTA.CNT_COSTA%TYPE;
    N_SUB_TOTAL_COSTAS T_SCOB_EXPEDIENTE_COSTA.MONTO_COSTA%TYPE;
    N_VAL_CNT_COSTA    T_SCOB_EXPEDIENTE_COSTA.CNT_COSTA%TYPE;
    N_VAL_MTO_COSTA    T_SCOB_EXPEDIENTE_COSTA.MONTO_COSTA%TYPE;
  
    N_CONT INTEGER;
    
    -- Victor Bendezu - EXPEDIENTE A EVALUAR
    REG_T_SCOB_EXPEDIENTE       T_SCOB_EXPEDIENTE%ROWTYPE;        
    V_NU_ID_MULTA               USR_SICOB.T_SCOB_MULTA.ID_MULTA%TYPE;    
 
  BEGIN
    
    PO_V_MSJ_ERROR := '';
    PO_N_COD_ERROR := -1;
    DBMS_OUTPUT.put_line('SCOB_SP_I_T_SCOB_EXPED_COSTA>>PI_N_ID_EXPEDIENTE>>' || PI_N_ID_EXPEDIENTE);
    -- Victor Bendezu - SE OBTIENE EL EXPEDIENTE A EVALUAR
    SELECT EXPE.*
      INTO REG_T_SCOB_EXPEDIENTE
      FROM USR_SICOB.T_SCOB_EXPEDIENTE EXPE
     WHERE EXPE.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE;
     
    --insertar las costas seleccionadas
    N_CONT := 1;
    DBMS_OUTPUT.put_line('SCOB_SP_I_T_SCOB_EXPED_COSTA>>PI_N_NRO_ITEMS>>' || PI_N_NRO_ITEMS);
    WHILE (N_CONT <= PI_N_NRO_ITEMS) LOOP
    
      SCOB_PK_UTILITARIO.SCOB_SP_S_SPLIT(PI_V_ID_COSTAS,
                                         '|',
                                         N_CONT + 1,
                                         V_ID_COSTAS);
      SCOB_PK_UTILITARIO.SCOB_SP_S_SPLIT(PI_V_POR_COSTAS,
                                         '|',
                                         N_CONT + 1,
                                         V_POR_COSTAS);
      SCOB_PK_UTILITARIO.SCOB_SP_S_SPLIT(PI_V_VAL_COSTAS,
                                         '|',
                                         N_CONT + 1,
                                         V_VAL_COSTAS);
      SCOB_PK_UTILITARIO.SCOB_SP_S_SPLIT(PI_V_CNT_COSTAS,
                                         '|',
                                         N_CONT + 1,
                                         V_CNT_COSTAS);
      SCOB_PK_UTILITARIO.SCOB_SP_S_SPLIT(PI_V_SUB_TOTAL_COSTAS,
                                         '|',
                                         N_CONT + 1,
                                         V_SUB_TOTAL_COSTAS);
    
      N_POR_COSTAS       := SCOB_PK_UTILITARIO.SCOB_FN_TEXTO_A_NUMERO(V_POR_COSTAS);
      N_VAL_COSTAS       := SCOB_PK_UTILITARIO.SCOB_FN_TEXTO_A_NUMERO(V_VAL_COSTAS);
      N_CNT_COSTAS       := SCOB_PK_UTILITARIO.SCOB_FN_TEXTO_A_NUMERO(V_CNT_COSTAS);
      N_SUB_TOTAL_COSTAS := SCOB_PK_UTILITARIO.SCOB_FN_TEXTO_A_NUMERO(V_SUB_TOTAL_COSTAS);
    
      --disminucion de costas
    
      IF PI_C_FLG_AGREGAR IN ('0', '1') THEN
        DBMS_OUTPUT.put_line('SCOB_SP_I_T_SCOB_EXPED_COSTA>>FLAG>>1');
        SELECT DECODE(PI_C_FLG_AGREGAR,
                      '0',
                      -N_SUB_TOTAL_COSTAS,
                      N_SUB_TOTAL_COSTAS)
          INTO N_SUB_TOTAL_COSTAS
          FROM DUAL;
      
        SELECT DECODE(PI_C_FLG_AGREGAR, '0', -N_CNT_COSTAS, N_CNT_COSTAS)
          INTO N_CNT_COSTAS
          FROM DUAL;
      
        --@0001:Ini:
        --Evaluo la disminucion de la cantidad UIT y monto.
        IF PI_C_FLG_AGREGAR = 0 THEN
          SELECT SUM(EC.CNT_COSTA) + N_CNT_COSTAS AS VAL_CNT_COSTA,
                 SUM(EC.MONTO_COSTA) + N_SUB_TOTAL_COSTAS AS VAL_MTO_COSTA
            INTO N_VAL_CNT_COSTA, N_VAL_MTO_COSTA
            FROM T_SCOB_EXPEDIENTE_COSTA EC
           WHERE EC.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
             AND EC.ID_COSTA = TO_NUMBER(V_ID_COSTAS)
             AND EC.ESTADO = 1;
        
          IF N_VAL_CNT_COSTA < 0 THEN
            PO_N_COD_ERROR := -9;
            PO_V_MSJ_ERROR := 'No se puede realizar la acci?n. Los valores actualizados generar?n cantidad de costas negativos...';
            EXIT;
          END IF;
        
          IF N_VAL_MTO_COSTA < 0 THEN
            PO_N_COD_ERROR := -9;
            PO_V_MSJ_ERROR := 'No se puede realizar la acci?n. Los valores actualizados generar?n subtotal de costas negativos...';
            EXIT;
          END IF;
        END IF;
        --@0001:Fin
      
        IF V_ID_COSTAS = '#' THEN
          EXIT;
        END IF;
      
        SELECT SCOB_SQ_EXPEDIENTE_COSTA.NEXTVAL
          INTO N_ID_EXPEDIENTE_COSTA
          FROM DUAL;
        INSERT INTO T_SCOB_EXPEDIENTE_COSTA
          (ID_EXPEDIENTE_COSTA,
           ID_COSTA,
           PORCENTAJE_UIT,
           VALOR_SOLES,
           CNT_COSTA,
           MONTO_COSTA,
           ESTADO,
           AUDFECCREACION,
           AUDUSUCREACION,
           ID_EXPEDIENTE_DOCUMENTO,
           ID_EXPEDIENTE)
        VALUES
          (N_ID_EXPEDIENTE_COSTA,
           TO_NUMBER(V_ID_COSTAS),
           N_POR_COSTAS,
           TRUNC(N_VAL_COSTAS, SCOB_PK_CONSTANTES.C_NRO_DECIMAL_TRUNC),
           N_CNT_COSTAS,
           TRUNC(N_SUB_TOTAL_COSTAS, SCOB_PK_CONSTANTES.C_NRO_DECIMAL_TRUNC),
           SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO,
           SYSDATE,
           PI_V_AUDUSUCREACION,
           DECODE(NVL(PI_N_ID_EXPEDIENTE_DOCUMENTO, 0),
                  0,
                  NULL,
                  PI_N_ID_EXPEDIENTE_DOCUMENTO),
           PI_N_ID_EXPEDIENTE);
           DBMS_OUTPUT.put_line('SCOB_SP_I_T_SCOB_EXPED_COSTA>>N_ID_EXPEDIENTE_COSTA>>' || N_ID_EXPEDIENTE_COSTA);
      ELSIF PI_C_FLG_AGREGAR = '2' THEN
        DBMS_OUTPUT.put_line('SCOB_SP_I_T_SCOB_EXPED_COSTA>>FLAG>>2');
        IF V_ID_COSTAS = '#' THEN
          EXIT;
        END IF;
      
        UPDATE T_SCOB_EXPEDIENTE_COSTA T
           SET T.ESTADO = '0'
         WHERE T.ID_COSTA = TO_NUMBER(V_ID_COSTAS)
           AND T.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE;
        --AND T.ID_EXPEDIENTE_DOCUMENTO = DECODE(NVL(PI_N_ID_EXPEDIENTE_DOCUMENTO,0),0,NULL,PI_N_ID_EXPEDIENTE_DOCUMENTO);
        DBMS_OUTPUT.put_line('SCOB_SP_I_T_SCOB_EXPED_COSTA>>V_ID_COSTAS>>' || V_ID_COSTAS);
      END IF;
    
      N_CONT := N_CONT + 1;
      
      -- Victor Bendezu - se agrega auditoria solicitada
    INSERT INTO USR_SICOB.T_SCOB_AUDITORIA
            (NU_ID_AUDITORIA,
             NU_ID_TIPO_AUDITORIA,
             NU_ID_MULTA,
             NU_ID_EXPEDIENTE,
             VC_TABLA,
             VC_NOMBRE_LLAVE1,
             VC_NOMBRE_LLAVE2,
             NU_ID_LLAVE1,
             NU_ID_LLAVE2,
             VC_DML,
             VC_DESCRIPCION,
             VC_USUARIO_REGISTRO,
             DT_FECHA_REGISTRO,
             NU_ESTADO)
          VALUES
            (USR_SICOB.SEQ_T_AUDITORIA_ID.NEXTVAL,
             5,
             NULL,
             PI_N_ID_EXPEDIENTE,
             'T_SCOB_EXPEDIENTE_COSTA',
             'ID_EXPEDIENTE_COSTA',
             NULL,
             N_ID_EXPEDIENTE_COSTA,
             NULL,
             'I',
             'SE AGREGO COSTA DEL TIPO : ' ||
                 PI_C_FLG_AGREGAR 
              || '  DEL EXPEDIENTE : ' 
              || REG_T_SCOB_EXPEDIENTE.ANIO || REG_T_SCOB_EXPEDIENTE.NRO_EXPEDIENTE,
             PI_V_AUDUSUCREACION,
             SYSDATE,
             '1');
             
    END LOOP;
  
    IF PO_N_COD_ERROR = -9 THEN
      RETURN;
    END IF;
  
    SELECT DECODE(PI_C_FLG_AGREGAR,
                  '0',
                  -PI_N_TOTAL_COSTAS,
                  PI_N_TOTAL_COSTAS)
      INTO N_SUB_TOTAL_COSTAS
      FROM DUAL;
      
    DBMS_OUTPUT.put_line('SCOB_SP_I_T_SCOB_EXPED_COSTA>>PI_C_FLG_AGREGAR>>' || PI_C_FLG_AGREGAR);
    --actualizacion de monto
    IF PI_C_FLG_AGREGAR IN ('0', '1') THEN
      UPDATE T_SCOB_MULTA MULT
         SET MULT.MONTO_COSTAS      = MULT.MONTO_COSTAS + N_SUB_TOTAL_COSTAS,
             MULT.MONTO_TOTAL_DEUDA = MULT.MONTO_TOTAL_DEUDA +
                                      N_SUB_TOTAL_COSTAS,
             MULT.SALDO_COSTAS      = MULT.SALDO_COSTAS + N_SUB_TOTAL_COSTAS,
             MULT.SALDO_TOTAL_DEUDA = MULT.SALDO_TOTAL_DEUDA +
                                      N_SUB_TOTAL_COSTAS,
             
             MULT.AUDUSUMODIFICACION = PI_V_AUDUSUCREACION,
             MULT.AUDFECMODIFICACION = SYSDATE
       WHERE MULT.ID_MULTA IN
             (SELECT EXMU.ID_MULTA
                FROM T_SCOB_EXPEDIENTE_MULTA EXMU
               WHERE EXMU.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
                 AND EXMU.ESTADO = '1'
                 AND EXMU.ID_MULTA =
                     SCOB_PK_EXPEDIENTE.SCOB_FN_MUL_ANTIGUO(EXMU.ID_EXPEDIENTE));
    ELSIF PI_C_FLG_AGREGAR = '2' THEN
      BEGIN
        SELECT SUM(EC.CNT_COSTA) AS VAL_CNT_COSTA,
               SUM(EC.MONTO_COSTA) AS VAL_MTO_COSTA
          INTO N_VAL_CNT_COSTA, N_VAL_MTO_COSTA
          FROM T_SCOB_EXPEDIENTE_COSTA EC
         WHERE EC.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
           AND EC.ESTADO = 1;
      EXCEPTION
        WHEN NO_DATA_FOUND THEN
          N_VAL_CNT_COSTA := 0;
          N_VAL_MTO_COSTA := 0;
      END;
      UPDATE T_SCOB_MULTA MULT
         SET MULT.MONTO_COSTAS       = NVL(N_VAL_MTO_COSTA, 0),
             MULT.MONTO_TOTAL_DEUDA  = MULT.MONTO_UIT + MULT.MONTO_INTERES +
                                       MULT.MONTO_INTERES_MORATORIO +
                                       NVL(N_VAL_MTO_COSTA, 0),
             MULT.SALDO_COSTAS       = NVL(N_VAL_MTO_COSTA, 0) -
                                       MULT.TOTAL_AMORTIZADO_COSTAS,
             MULT.SALDO_TOTAL_DEUDA =
             (MULT.MONTO_UIT + MULT.MONTO_INTERES +
             MULT.MONTO_INTERES_MORATORIO + NVL(N_VAL_MTO_COSTA, 0)) -
             (MULT.TOTAL_AMORTIZADO + MULT.TOTAL_AMORTIZADO_IC +
             MULT.TOTAL_AMORTIZADO_IM + MULT.TOTAL_AMORTIZADO_COSTAS),
             MULT.AUDUSUMODIFICACION = PI_V_AUDUSUCREACION,
             MULT.AUDFECMODIFICACION = SYSDATE
      
       WHERE MULT.ID_MULTA IN
             (SELECT EXMU.ID_MULTA
                FROM T_SCOB_EXPEDIENTE_MULTA EXMU
               WHERE EXMU.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
                 AND EXMU.ESTADO = '1'
                 AND EXMU.ID_MULTA =
                     SCOB_PK_EXPEDIENTE.SCOB_FN_MUL_ANTIGUO(EXMU.ID_EXPEDIENTE));
    END IF;
    SCOB_PK_MULTAS.SCOB_SP_U_ACT_IMPORTES_EXPED(0, PI_N_ID_EXPEDIENTE);        
     
    
    --INICIO VICTOR BENDEZU - MIGRACION SICOB A SIA    
    V_NU_ID_MULTA:= SCOB_PK_EXPEDIENTE.SCOB_FN_MUL_ANTIGUO(PI_N_ID_EXPEDIENTE); -- SI ES EXP ACUMULADO APLICA SOLO AL CUM MAS ANTIGUO
    DBMS_OUTPUT.put_line('SCOB_SP_I_T_SCOB_EXPED_COSTA>>V_NU_ID_MULTA>>' || V_NU_ID_MULTA);
    USR_SIA_INTFZ.PKG_INTFZ_REG_MULTA_SICOB_SIA.SP_U_EXPEDIENTE_CERO_A_SIA(PIN_NU_ID_MULTA => V_NU_ID_MULTA,
                                                                      POUT_NU_COD_RESULT => PO_N_COD_ERROR,
                                                                      POUT_VC_MSG_RESULT => PO_V_MSJ_ERROR);
    DBMS_OUTPUT.put_line('SCOB_SP_I_T_SCOB_EXPED_COSTA>>PO_N_COD_ERROR1>>' || PO_N_COD_ERROR);
    IF PO_N_COD_ERROR < 0 THEN
       ROLLBACK;
       RETURN;
    END IF;
    USR_SICOB.PKG_RECAUDACION_BANCOS.SP_DO_GRABAR_BN_X_EXP(PIN_NU_ID_EXPEDIENTE => PI_N_ID_EXPEDIENTE,
                                     POUT_NU_COD_RESULT => PO_N_COD_ERROR,
                                     POUT_VC_MSG_RESULT => PO_V_MSJ_ERROR);
    DBMS_OUTPUT.put_line('SCOB_SP_I_T_SCOB_EXPED_COSTA>>PO_N_COD_ERROR2>>' || PO_N_COD_ERROR);
    IF PO_N_COD_ERROR < 0 THEN
       ROLLBACK;
       RETURN;
    END IF;
    USR_SICOB.PKG_RECAUDACION_BANCOS.SP_DO_GRABAR_ASBANC_X_EXP(PIN_NU_ID_EXPEDIENTE => PI_N_ID_EXPEDIENTE,
                                     POUT_NU_COD_RESULT => PO_N_COD_ERROR,
                                     POUT_VC_MSG_RESULT => PO_V_MSJ_ERROR);
    DBMS_OUTPUT.put_line('SCOB_SP_I_T_SCOB_EXPED_COSTA>>PO_N_COD_ERROR3>>' || PO_N_COD_ERROR);
    IF PO_N_COD_ERROR < 0 THEN
       ROLLBACK;
       RETURN;
    END IF;    
    --FIN VICTOR BENDEZU - MIGRACION SICOB A SIA
            
    PO_N_COD_ERROR := 0;
    --commit;
    ----
  EXCEPTION
    WHEN OTHERS THEN
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

  FUNCTION SCOB_FN_SANCIONADOS_EXPED(PI_N_ID_EXPEDIENTE IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE)
    RETURN VARCHAR2 IS
    V_RESPUESTA VARCHAR2(4000);
    V_NOM_SAN   VARCHAR2(200);
    V_ID        NUMBER;
    CUR_SANC    CU_REC_SET;
    I_CONT      INTEGER;
  BEGIN
  
    OPEN CUR_SANC FOR
      SELECT DISTINCT MSAN.ID_MULTA_SANCIONADO,
                      DECODE(PERS.TIPO_PERSONA,
                             SCOB_PK_CONSTANTES.C_TIPO_PERS_JURIDICA,
                             PERS.RAZON_SOCIAL,
                             PERS.APE_PATERNO || ' ' || PERS.APE_MATERNO || ' ' ||
                             PERS.PRI_NOMBRE || ' ' || PERS.SEG_NOMBRE || ' ' ||
                             PERS.APE_CASADA) AS NOM_SANCIONADO
        FROM T_SCOB_EXPEDIENTE EXPE
       INNER JOIN T_SCOB_EXPEDIENTE_MULTA EXMU
          ON EXMU.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
         AND EXMU.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
       INNER JOIN T_SCOB_MULTA_DETAL MDET
          ON MDET.ID_MULTA = EXMU.ID_MULTA
         AND MDET.FLG_ACTUAL = '1'
       INNER JOIN T_SCOB_MULTA_SANCIONADO MSAN
          ON MSAN.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL
         AND NVL(MSAN.COD_TIPO_PERSONA, '1') = '1'
         AND MSAN.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
       INNER JOIN T_SCOB_PERSONA PERS
          ON PERS.ID_PERSONA = MSAN.ID_PERSONA
       WHERE EXPE.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
       ORDER BY MSAN.ID_MULTA_SANCIONADO;
  
    I_CONT := 0;
  
    LOOP
      FETCH CUR_SANC
        INTO V_ID, V_NOM_SAN;
      EXIT WHEN CUR_SANC%NOTFOUND;
      I_CONT := I_CONT + 1;
      IF I_CONT > 2 THEN
        BEGIN
          V_RESPUESTA := V_RESPUESTA || '. . . y otros.';
          EXIT;
        END;
      END IF;
      V_RESPUESTA := V_RESPUESTA || '/ ' || V_NOM_SAN;
    END LOOP;
    CLOSE CUR_SANC;
  
    V_RESPUESTA := SUBSTR(V_RESPUESTA, 2, LENGTH(V_RESPUESTA));
    RETURN NVL(TRIM(V_RESPUESTA), ' ');
  END;

  FUNCTION SCOB_FN_SANCIONADOS_EXP_MULTA(PI_N_ID_MULTA IN T_SCOB_MULTA.ID_MULTA%TYPE)
    RETURN VARCHAR2 IS
    V_RESPUESTA VARCHAR2(4000);
    V_NOM_SAN   VARCHAR2(200);
    V_ID        NUMBER;
    CUR_SANC    CU_REC_SET;
    I_CONT      INTEGER;
    --
    V_ID_EXPEDIENTE NUMBER;
    V_OP            NUMBER;
  BEGIN
    --
    /* OBTENEMOS EN ID_EXPEDIENTE
      -- 1: SELECCIONAR POR ID_EXPEDIENTE
      -- 2: SELECCIONAR POR ID_MULTA
    */
    V_OP := 1;
    BEGIN
      SELECT ID_EXPEDIENTE
        INTO V_ID_EXPEDIENTE
        FROM T_SCOB_EXPEDIENTE_MULTA
       WHERE ID_MULTA = PI_N_ID_MULTA
         AND ESTADO = 1 /*AND FLG_INACTIVO IS NULL*/
      ;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        V_OP := 2;
    END;
  
    DBMS_OUTPUT.PUT_LINE('V_ID_EXPEDIENTE: ' || V_ID_EXPEDIENTE);
    --
    IF V_OP = 1 THEN
      OPEN CUR_SANC FOR
        SELECT DISTINCT MSAN.ID_MULTA_SANCIONADO,
                        DECODE(PERS.TIPO_PERSONA,
                               SCOB_PK_CONSTANTES.C_TIPO_PERS_JURIDICA,
                               PERS.RAZON_SOCIAL,
                               PERS.APE_PATERNO || ' ' || PERS.APE_MATERNO || ' ' ||
                               PERS.PRI_NOMBRE || ' ' || PERS.SEG_NOMBRE || ' ' ||
                               PERS.APE_CASADA) AS NOM_SANCIONADO
          FROM T_SCOB_EXPEDIENTE EXPE
         INNER JOIN T_SCOB_EXPEDIENTE_MULTA EXMU
            ON EXMU.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
           AND EXMU.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
         INNER JOIN T_SCOB_MULTA_DETAL MDET
            ON MDET.ID_MULTA = EXMU.ID_MULTA
           AND MDET.FLG_ACTUAL = '1'
         INNER JOIN T_SCOB_MULTA_SANCIONADO MSAN
            ON MSAN.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL
           AND NVL(MSAN.COD_TIPO_PERSONA, '1') = '1'
           AND MSAN.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
         INNER JOIN T_SCOB_PERSONA PERS
            ON PERS.ID_PERSONA = MSAN.ID_PERSONA
         WHERE EXPE.ID_EXPEDIENTE = V_ID_EXPEDIENTE
         ORDER BY MSAN.ID_MULTA_SANCIONADO;
    
      I_CONT := 0;
    
      LOOP
        FETCH CUR_SANC
          INTO V_ID, V_NOM_SAN;
        EXIT WHEN CUR_SANC%NOTFOUND;
        I_CONT := I_CONT + 1;
        IF I_CONT > 2 THEN
          BEGIN
            V_RESPUESTA := V_RESPUESTA || '. . . y otros.';
            EXIT;
          END;
        END IF;
        V_RESPUESTA := V_RESPUESTA || '/ ' || V_NOM_SAN;
      END LOOP;
      CLOSE CUR_SANC;
      V_RESPUESTA := SUBSTR(V_RESPUESTA, 2, LENGTH(V_RESPUESTA));
    ELSIF V_OP = 2 THEN
      -- INI TK73576
      /* SELECT DISTINCT DECODE(PERS.TIPO_PERSONA, SCOB_PK_CONSTANTES.C_TIPO_PERS_JURIDICA, PERS.RAZON_SOCIAL, PERS.APE_PATERNO
        || ' '
        || PERS.APE_MATERNO
        || ' '
        || PERS.PRI_NOMBRE
        || ' '
        || PERS.SEG_NOMBRE
        || ' '
        || PERS.APE_CASADA) AS NOM_SANCIONADO INTO V_RESPUESTA
      FROM T_SCOB_MULTA MULT
      INNER JOIN T_SCOB_MULTA_DETAL MDET
      ON MDET.ID_MULTA    = MULT.ID_MULTA
      AND MDET.FLG_ACTUAL = '1'
      INNER JOIN T_SCOB_MULTA_SANCIONADO MSAN
      ON MSAN.ID_MULTA_DETAL              = MDET.ID_MULTA_DETAL
      AND NVL(MSAN.COD_TIPO_PERSONA, '1') = '1'
      AND MSAN.ESTADO                     = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
      INNER JOIN T_SCOB_PERSONA PERS
      ON PERS.ID_PERSONA       = MSAN.ID_PERSONA
      WHERE MULT.ID_MULTA = PI_N_ID_MULTA;
      END IF;
      
      RETURN NVL(TRIM(V_RESPUESTA), ' ');*/
    
      OPEN CUR_SANC FOR
        SELECT DISTINCT MSAN.ID_MULTA_SANCIONADO,
                        DECODE(PERS.TIPO_PERSONA,
                               SCOB_PK_CONSTANTES.C_TIPO_PERS_JURIDICA,
                               PERS.RAZON_SOCIAL,
                               PERS.APE_PATERNO || ' ' || PERS.APE_MATERNO || ' ' ||
                               PERS.PRI_NOMBRE || ' ' || PERS.SEG_NOMBRE || ' ' ||
                               PERS.APE_CASADA) AS NOM_SANCIONADO
          FROM T_SCOB_MULTA_DETAL MDET
         INNER JOIN T_SCOB_MULTA_SANCIONADO MSAN
            ON MSAN.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL
           AND MSAN.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
           AND NVL(MSAN.COD_TIPO_PERSONA, '1') = '1'
         INNER JOIN T_SCOB_PERSONA PERS
            ON PERS.ID_PERSONA = MSAN.ID_PERSONA
         WHERE MDET.ID_MULTA = PI_N_ID_MULTA
           AND MDET.FLG_ACTUAL = '1'
         ORDER BY MSAN.ID_MULTA_SANCIONADO;
    
      I_CONT := 0;
    
      LOOP
        FETCH CUR_SANC
          INTO V_ID, V_NOM_SAN;
        EXIT WHEN CUR_SANC%NOTFOUND;
        I_CONT := I_CONT + 1;
        IF I_CONT > 2 AND 2 <> 0 THEN
          BEGIN
            V_RESPUESTA := V_RESPUESTA || '. . . y otros.';
            EXIT;
          END;
        END IF;
      
        V_RESPUESTA := V_RESPUESTA || '/ ' || V_NOM_SAN;
      END LOOP;
      CLOSE CUR_SANC;
      V_RESPUESTA := SUBSTR(V_RESPUESTA, 2, LENGTH(V_RESPUESTA));
      -- FIN TK73576
    
    END IF;
  
    RETURN NVL(TRIM(V_RESPUESTA), ' ');
  
  END;

  FUNCTION SCOB_FN_NRO_DOC_SANC(PI_N_ID_MULTA IN T_SCOB_MULTA.ID_MULTA%TYPE)
    RETURN VARCHAR2 IS
    V_RESPUESTA     VARCHAR2(4000);
    V_NRO_DOC       VARCHAR2(200);
    CUR_SANC        CU_REC_SET;
    I_CONT          INTEGER;
    V_AUX           VARCHAR2(10);
    V_ID_EXPEDIENTE NUMBER;
    V_OP            NUMBER;
    V_ID            NUMBER;
  BEGIN
    -- OBTENEMOS EN ID_EXPEDIENTE
    /*
      -- 1: SELECCIONAR POR ID_EXPEDIENTE
      -- 2: SELECCIONAR POR ID_MULTA
    */
    V_OP := 1;
    BEGIN
      SELECT ID_EXPEDIENTE
        INTO V_ID_EXPEDIENTE
        FROM T_SCOB_EXPEDIENTE_MULTA
       WHERE ID_MULTA = PI_N_ID_MULTA
         AND ESTADO = 1 /*AND FLG_INACTIVO IS NULL*/
      ;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        V_OP := 2;
    END;
  
    DBMS_OUTPUT.PUT_LINE('V_ID_EXPEDIENTE: ' || V_ID_EXPEDIENTE);
    /*IF V_ID_EXPEDIENTE IS NULL THEN
      V_OP:=1;
    ELSE
      V_OP:=2;
    END IF;*/
    --
    IF V_OP = 1 THEN
      OPEN CUR_SANC FOR
        SELECT DISTINCT NVL(PERS.NRO_DOC, PERS.NRO_RUC) NRO_DOC
          FROM T_SCOB_EXPEDIENTE EXPE
         INNER JOIN T_SCOB_EXPEDIENTE_MULTA EXMU
            ON EXMU.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
           AND EXMU.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
         INNER JOIN T_SCOB_MULTA_DETAL MDET
            ON MDET.ID_MULTA = EXMU.ID_MULTA
           AND MDET.FLG_ACTUAL = '1'
         INNER JOIN T_SCOB_MULTA_SANCIONADO MSAN
            ON MSAN.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL
           AND NVL(MSAN.COD_TIPO_PERSONA, '1') = '1'
           AND MSAN.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
         INNER JOIN T_SCOB_PERSONA PERS
            ON PERS.ID_PERSONA = MSAN.ID_PERSONA
         WHERE EXPE.ID_EXPEDIENTE = V_ID_EXPEDIENTE;
      I_CONT := 0;
      LOOP
        FETCH CUR_SANC
          INTO V_NRO_DOC;
        EXIT WHEN CUR_SANC%NOTFOUND;
        I_CONT := I_CONT + 1;
        IF I_CONT > 1 THEN
          /*BEGIN
            V_RESPUESTA := V_RESPUESTA || '. . . y otros.';
            EXIT;
          END;*/
          V_AUX := ' / ';
        ELSE
          V_AUX := '';
        END IF;
        V_RESPUESTA := V_RESPUESTA || V_AUX || V_NRO_DOC;
      END LOOP;
      CLOSE CUR_SANC;
    ELSIF V_OP = 2 THEN
      -- INI TK73576
      /* SELECT NVL(PERS.NRO_DOC,PERS.NRO_RUC) NRO_DOC INTO V_RESPUESTA
      FROM T_SCOB_MULTA MULT
      INNER JOIN T_SCOB_MULTA_DETAL MDET
      ON MDET.ID_MULTA    = MULT.ID_MULTA
      AND MDET.FLG_ACTUAL = '1'
      INNER JOIN T_SCOB_MULTA_SANCIONADO MSAN
      ON MSAN.ID_MULTA_DETAL              = MDET.ID_MULTA_DETAL
      AND NVL(MSAN.COD_TIPO_PERSONA, '1') = '1'
      AND MSAN.ESTADO                     = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
      INNER JOIN T_SCOB_PERSONA PERS
      ON PERS.ID_PERSONA  = MSAN.ID_PERSONA
      WHERE MULT.ID_MULTA = PI_N_ID_MULTA;*/
    
      OPEN CUR_SANC FOR
        SELECT DISTINCT MSAN.ID_MULTA_SANCIONADO,
                        PERS.NRO_DOC AS NRO_DOC_IDENTIDAD
          FROM T_SCOB_MULTA_DETAL MDET
         INNER JOIN T_SCOB_MULTA_SANCIONADO MSAN
            ON MSAN.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL
           AND MSAN.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
           AND NVL(MSAN.COD_TIPO_PERSONA, '1') = '1'
         INNER JOIN T_SCOB_PERSONA PERS
            ON PERS.ID_PERSONA = MSAN.ID_PERSONA
         WHERE MDET.ID_MULTA = PI_N_ID_MULTA
           AND MDET.FLG_ACTUAL = '1'
         ORDER BY MSAN.ID_MULTA_SANCIONADO;
    
      I_CONT := 0;
    
      LOOP
        FETCH CUR_SANC
          INTO V_ID, V_NRO_DOC;
        EXIT WHEN CUR_SANC%NOTFOUND;
        I_CONT := I_CONT + 1;
        IF I_CONT > 2 AND 2 <> 0 THEN
          BEGIN
            V_RESPUESTA := V_RESPUESTA || '. . . y otros.';
            EXIT;
          END;
        END IF;
      
        V_RESPUESTA := V_RESPUESTA || '/ ' || V_NRO_DOC;
      END LOOP;
      CLOSE CUR_SANC;
      V_RESPUESTA := SUBSTR(V_RESPUESTA, 2, LENGTH(V_RESPUESTA));
    END IF;
    -- INI TK73576
    --V_RESPUESTA := SUBSTR(V_RESPUESTA, 2, LENGTH(V_RESPUESTA));
    RETURN NVL(TRIM(V_RESPUESTA), ' ');
  END;

  FUNCTION SCOB_FN_SANCIONADOS_MULTA(PI_N_ID_MULTA     IN T_SCOB_MULTA.ID_MULTA%TYPE,
                                     PI_N_NRO_PERSONAS IN INTEGER)
    RETURN VARCHAR2 IS
    V_RESPUESTA VARCHAR2(4000);
    V_NOM_SAN   VARCHAR2(200);
    V_ID        NUMBER;
    CUR_SANC    CU_REC_SET;
    I_CONT      INTEGER;
  BEGIN
  
    OPEN CUR_SANC FOR
      SELECT DISTINCT MSAN.ID_MULTA_SANCIONADO,
                      DECODE(PERS.TIPO_PERSONA,
                             SCOB_PK_CONSTANTES.C_TIPO_PERS_JURIDICA,
                             PERS.RAZON_SOCIAL,
                             PERS.APE_PATERNO || ' ' || PERS.APE_MATERNO || ' ' ||
                             PERS.PRI_NOMBRE || ' ' || PERS.SEG_NOMBRE || ' ' ||
                             PERS.APE_CASADA) AS NOM_SANCIONADO
        FROM T_SCOB_MULTA_DETAL MDET
       INNER JOIN T_SCOB_MULTA_SANCIONADO MSAN
          ON MSAN.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL
         AND MSAN.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
         AND NVL(MSAN.COD_TIPO_PERSONA, '1') = '1'
       INNER JOIN T_SCOB_PERSONA PERS
          ON PERS.ID_PERSONA = MSAN.ID_PERSONA
       WHERE MDET.ID_MULTA = PI_N_ID_MULTA
         AND MDET.FLG_ACTUAL = '1'
       ORDER BY MSAN.ID_MULTA_SANCIONADO;
  
    I_CONT := 0;
  
    LOOP
      FETCH CUR_SANC
        INTO V_ID, V_NOM_SAN;
      EXIT WHEN CUR_SANC%NOTFOUND;
      I_CONT := I_CONT + 1;
      IF I_CONT > PI_N_NRO_PERSONAS AND PI_N_NRO_PERSONAS <> 0 THEN
        BEGIN
          V_RESPUESTA := V_RESPUESTA || '. . . y otros.';
          EXIT;
        END;
      END IF;
    
      V_RESPUESTA := V_RESPUESTA || '/ ' || V_NOM_SAN;
    END LOOP;
    CLOSE CUR_SANC;
    V_RESPUESTA := SUBSTR(V_RESPUESTA, 2, LENGTH(V_RESPUESTA));
    RETURN NVL(TRIM(V_RESPUESTA), ' ');
  
  END;

  FUNCTION SCOB_FN_SANCIONADO_MULTA_PRINC(PI_N_ID_MULTA IN T_SCOB_MULTA.ID_MULTA%TYPE)
    RETURN VARCHAR2 IS
    V_RESPUESTA VARCHAR2(400);
  BEGIN
  
    SELECT DISTINCT DECODE(PERS.TIPO_PERSONA,
                           SCOB_PK_CONSTANTES.C_TIPO_PERS_JURIDICA,
                           PERS.RAZON_SOCIAL,
                           PERS.APE_PATERNO || ' ' || PERS.APE_MATERNO || ' ' ||
                           PERS.PRI_NOMBRE || ' ' || PERS.SEG_NOMBRE || ' ' ||
                           PERS.APE_CASADA) AS NOM_SANCIONADO
      INTO V_RESPUESTA
      FROM T_SCOB_MULTA_DETAL MDET
     INNER JOIN T_SCOB_MULTA_SANCIONADO MSAN
        ON MSAN.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL
       AND MSAN.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
       AND NVL(MSAN.COD_TIPO_PERSONA, '1') = '1'
       AND MSAN.FLG_PRINCIPAL = '1'
     INNER JOIN T_SCOB_PERSONA PERS
        ON PERS.ID_PERSONA = MSAN.ID_PERSONA
     WHERE MDET.ID_MULTA = PI_N_ID_MULTA
       AND MDET.FLG_ACTUAL = '1';
  
    RETURN V_RESPUESTA;
  
  END;

  FUNCTION SCOB_FN_SANCIONADOS_CIIU(PI_N_ID_MULTA     IN T_SCOB_MULTA.ID_MULTA%TYPE,
                                    PI_N_NRO_PERSONAS IN INTEGER)
    RETURN VARCHAR2 IS
    V_RESPUESTA  VARCHAR2(4000);
    V_NOM_SAN    VARCHAR2(200);
    V_ID         NUMBER;
    V_NOM_SECTOR VARCHAR2(200);
    CUR_SANC     CU_REC_SET;
    I_CONT       INTEGER;
  
  BEGIN
  
    OPEN CUR_SANC FOR
      SELECT DISTINCT MSAN.ID_MULTA_SANCIONADO,
                      DECODE(PERS.TIPO_PERSONA,
                             SCOB_PK_CONSTANTES.C_TIPO_PERS_JURIDICA,
                             PERS.RAZON_SOCIAL,
                             PERS.APE_PATERNO || ' ' || PERS.APE_MATERNO || ' ' ||
                             PERS.PRI_NOMBRE || ' ' || PERS.SEG_NOMBRE || ' ' ||
                             PERS.APE_CASADA) AS NOM_SANCIONADO,
                      SEEC.DESCRIPCION AS NOM_SECTOR_ECONOMICO
        FROM T_SCOB_MULTA_DETAL MDET
       INNER JOIN T_SCOB_MULTA_SANCIONADO MSAN
          ON MSAN.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL
         AND MSAN.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
         AND NVL(MSAN.COD_TIPO_PERSONA, '1') = '1'
       INNER JOIN T_SCOB_PERSONA PERS
          ON PERS.ID_PERSONA = MSAN.ID_PERSONA
        LEFT JOIN T_SCOB_SECTOR_ECONOMICO SEEC
          ON SEEC.ID_SECTOR_ECONOMICO = PERS.ID_SECTOR_ECONOMICO
       WHERE MDET.ID_MULTA = PI_N_ID_MULTA
         AND MDET.FLG_ACTUAL = '1'
       ORDER BY MSAN.ID_MULTA_SANCIONADO;
  
    I_CONT := 0;
  
    LOOP
      FETCH CUR_SANC
        INTO V_ID, V_NOM_SAN, V_NOM_SECTOR;
      EXIT WHEN CUR_SANC%NOTFOUND;
      I_CONT := I_CONT + 1;
      IF I_CONT > PI_N_NRO_PERSONAS AND PI_N_NRO_PERSONAS <> 0 THEN
        BEGIN
          V_RESPUESTA := V_RESPUESTA || '. . . y otros.';
          EXIT;
        END;
      END IF;
    
      V_RESPUESTA := V_RESPUESTA || '/ ' || V_NOM_SECTOR;
    END LOOP;
    CLOSE CUR_SANC;
    V_RESPUESTA := SUBSTR(V_RESPUESTA, 2, LENGTH(V_RESPUESTA));
    RETURN NVL(TRIM(V_RESPUESTA), ' ');
  
  END;

  PROCEDURE SCOB_SP_S_LISTA_SANC_EXPED
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 28.04.2011
    -- Proposito    : listar los sancionados.
    -----------------------------------------------------------
    -- @001: EDLT se agrega campo id_multa_detal para mostrar
             todas las direcciones del sancionado y reutilizar
             el sp PK_MULTAS.SCOB_SP_S_SANC_DIREC_MULTA
    -----------------------------------------------------------
    -- Modificacion : Se coment? la columna "MDET.ID_MULTA_DETAL"
    -- Autor        : @dcelis
    -- Modificado   : 03.04.2017
    -- Proposito    : Req.44 - Para que devuelva un solo registro en caso de ser el mismo sancionado
    -----------------------------------------------------------
    */
  (PI_N_ID_EXPEDIENTE IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
   PO_CU_RETORNO      OUT CU_REC_SET) AS
  BEGIN
    OPEN PO_CU_RETORNO FOR
      SELECT DISTINCT PERS.ID_PERSONA AS ID_PERSONA,
                      DECODE(PERS.TIPO_PERSONA,
                             SCOB_PK_CONSTANTES.C_TIPO_PERS_JURIDICA,
                             PERS.RAZON_SOCIAL,
                             PERS.APE_PATERNO || ' ' || PERS.APE_MATERNO || ' ' ||
                             PERS.PRI_NOMBRE || ' ' || PERS.SEG_NOMBRE || ' ' ||
                             PERS.APE_CASADA) AS NOM_PERSONA
      --DECODE(PERS.TIPO_PERSONA,SCOB_PK_CONSTANTES.C_TIPO_PERS_JURIDICA, PERS.RAZON_SOCIAL,  PERS.PRI_NOMBRE || ' ' || PERS.SEG_NOMBRE || ' ' || PERS.APE_PATERNO  || ' ' || PERS.APE_MATERNO  || ' ' || PERS.APE_CASADA) AS NOM_PERSONA
      /*,
      MDET.ID_MULTA_DETAL as ID_MULTA_DETAL --I@001*/
        FROM T_SCOB_EXPEDIENTE EXPE
       INNER JOIN T_SCOB_EXPEDIENTE_MULTA EXMU
          ON EXMU.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
         AND EXMU.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
       INNER JOIN T_SCOB_MULTA_DETAL MDET
          ON MDET.ID_MULTA = EXMU.ID_MULTA
         AND MDET.FLG_ACTUAL = '1'
       INNER JOIN T_SCOB_MULTA_SANCIONADO MSAN
          ON MSAN.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL
         AND NVL(MSAN.COD_TIPO_PERSONA, '1') = '1'
         AND MSAN.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
       INNER JOIN T_SCOB_PERSONA PERS
          ON PERS.ID_PERSONA = MSAN.ID_PERSONA
       WHERE EXPE.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
       ORDER BY NOM_PERSONA;
  END;

  PROCEDURE SCOB_SP_S_LISTA_DIR_SANC_EXPED
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 28.04.2011
    -- Proposito    : listar los sancionados.
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_N_ID_EXPEDIENTE IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
   PI_C_FLG_GRABADOS  IN CHAR,
   PO_CU_RETORNO      OUT CU_REC_SET) AS
  BEGIN
    OPEN PO_CU_RETORNO FOR
      SELECT DISTINCT PERS.ID_PERSONA           AS ID_PERSONA,
                      MSDI.ID_PERSONA_DOMICILIO AS ID_PERSONA_DOMICILIO,
                      --DECODE(PERS.TIPO_PERSONA,SCOB_PK_CONSTANTES.C_TIPO_PERS_JURIDICA, PERS.RAZON_SOCIAL,  PERS.PRI_NOMBRE || ' ' || PERS.SEG_NOMBRE || ' ' || PERS.APE_PATERNO  || ' ' || PERS.APE_MATERNO  || ' ' || PERS.APE_CASADA) AS NOM_PERSONA,
                      DECODE(PERS.TIPO_PERSONA,
                             SCOB_PK_CONSTANTES.C_TIPO_PERS_JURIDICA,
                             PERS.RAZON_SOCIAL,
                             PERS.APE_PATERNO || ' ' || PERS.APE_MATERNO || ' ' ||
                             PERS.PRI_NOMBRE || ' ' || PERS.SEG_NOMBRE || ' ' ||
                             PERS.APE_CASADA) AS NOM_PERSONA,
                      PDOM.TIPO_DOMICILIO AS COD_TIPO_DOMICILIO,
                      TTDOM.DESCRIPCION AS NOM_TIPO_DOMICILIO,
                      --PDOM.DIRECCION AS DIRECCION, --eliminado
                      PDOM.TIPO_VIA         AS ID_TIPO_VIA, --nuevo
                      TVIA.TXT_DESCRIPCION  AS DES_TIPO_VIA, --nuevo
                      PDOM.NOM_VIA          AS NOM_VIA, --nuevo
                      PDOM.NRO_VIA          AS NRO_VIA, --nuevo
                      PDOM.NRO_INTERIOR     AS NRO_INTERIOR, --nuevo
                      PDOM.TIPO_ZONA        AS ID_TIPO_ZONA, --nuevo
                      TZONA.TXT_DESCRIPCION AS DES_TIPO_ZONA, --nuevo
                      PDOM.NOM_ZONA         AS NOM_ZONA, --nuevo
                      
                      UBIG.TXT_DPTO AS NOM_DPTO,
                      UBIG.TXT_PROV AS NOM_PROV,
                      UBIG.TXT_DIST AS NOM_DIST,
                      DECODE(NVL(EXDI.ID_EXPEDIENTE_PERSONA, '0'),
                             '0',
                             '0',
                             '1') AS FLG_GRABADO
        FROM T_SCOB_EXPEDIENTE EXPE
       INNER JOIN T_SCOB_EXPEDIENTE_MULTA EXMU
          ON EXMU.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
         AND EXMU.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
       INNER JOIN T_SCOB_MULTA_DETAL MDET
          ON MDET.ID_MULTA = EXMU.ID_MULTA
         AND MDET.FLG_ACTUAL = '1'
       INNER JOIN T_SCOB_MULTA_SANCIONADO MSAN
          ON MSAN.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL
         AND NVL(MSAN.COD_TIPO_PERSONA, '1') = '1'
         AND MSAN.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
       INNER JOIN T_SCOB_PERSONA PERS
          ON PERS.ID_PERSONA = MSAN.ID_PERSONA
       INNER JOIN T_SCOB_MULTA_SANCIONADO_DIREC MSDI
          ON MSDI.ID_MULTA_SANCIONADO = MSAN.ID_MULTA_SANCIONADO
         AND MSDI.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
       INNER JOIN T_SCOB_PERSONA_DOMICILIO PDOM
          ON PDOM.ID_PERSONA_DOMICILIO = MSDI.ID_PERSONA_DOMICILIO
        LEFT JOIN T_SCOB_TIPO_DOMICILIO TTDOM
          ON TTDOM.ID_TIPO_DOMICILIO = PDOM.TIPO_DOMICILIO
        LEFT JOIN T_SCOB_UBIGEO UBIG
          ON UBIG.ID_UBIGEO = PDOM.ID_UBIGEO
      
        LEFT JOIN T_SCOB_EXPEDIENTE_PERSONA EXDI
          ON EXDI.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
         AND EXDI.COD_TIPO_ENTIDAD = 1 --TIPO PERSONA
         AND EXDI.ID_PERSONA = PDOM.ID_PERSONA
         AND EXDI.ID_PERSONA_DOMICILIO = PDOM.ID_PERSONA_DOMICILIO
         AND EXDI.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
      
        LEFT JOIN T_SCOB_TABLA_DET TVIA
          ON TVIA.ID_TABLA = SCOB_PK_CONSTANTES.C_TBL_DIRECCION_TIPO_VIA
         AND TVIA.COD_INTERNO = PDOM.TIPO_VIA
      
        LEFT JOIN T_SCOB_TABLA_DET TZONA
          ON TZONA.ID_TABLA = SCOB_PK_CONSTANTES.C_TBL_DIRECCION_TIPO_ZONA
         AND TZONA.COD_INTERNO = PDOM.TIPO_ZONA
      
       WHERE EXPE.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
         AND NVL(PI_C_FLG_GRABADOS, '0') = 0
          OR (NVL(PI_C_FLG_GRABADOS, '0') <> 0);
  END;

  PROCEDURE SCOB_SP_I_DIR_SANC_EXPED
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 28.04.2011
    -- Proposito    : insertar las direcciones de los sancionados del expediente
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_N_ID_EXPEDIENTE        IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
   PI_V_ID_PERSONA           IN VARCHAR2,
   PI_V_ID_PERSONA_DOMICILIO IN VARCHAR2,
   PI_N_NRO_ITEMS            IN NUMBER,
   PI_V_AUDUSUCREACION       IN T_SCOB_MULTA_SANCIONADO_DIREC.AUDUSUCREACION%TYPE,
   
   PO_N_RETORNO   OUT NUMBER,
   PO_N_COD_ERROR OUT NUMBER,
   PO_V_MSJ_ERROR OUT VARCHAR2) IS
    N_ID_EXPEDIENTE_DIRECCION T_SCOB_EXPEDIENTE_PERSONA.ID_EXPEDIENTE_PERSONA%TYPE;
    N_CONT                    NUMBER;
    V_ID_PERSONA_DOMICILIO    VARCHAR(50);
    I_EXISTE                  INTEGER;
  BEGIN
  
    PO_V_MSJ_ERROR := '';
    PO_N_RETORNO   := 0;
    PO_N_COD_ERROR := -1;
  
    --actualiza a eliminado las direcciones no seleccionadas
    UPDATE T_SCOB_EXPEDIENTE_PERSONA EXDI
       SET EXDI.AUDUSUMODIFICACION = PI_V_AUDUSUCREACION,
           EXDI.AUDFECMODIFICACION = SYSDATE,
           EXDI.ESTADO             = SCOB_PK_CONSTANTES.C_ESTADO_INACTIVO
     WHERE EXDI.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
       AND EXDI.COD_TIPO_ENTIDAD = '1' --DE PERSONA
       AND EXDI.ID_PERSONA = PI_V_ID_PERSONA
       AND INSTR(PI_V_ID_PERSONA_DOMICILIO,
                 '|' || TO_CHAR(EXDI.ID_PERSONA_DOMICILIO) || '|') = 0
       AND ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO;
  
    --insertar los direcciones seleccionados
    N_CONT := 1;
    WHILE (N_CONT <= PI_N_NRO_ITEMS) LOOP
    
      SCOB_PK_UTILITARIO.SCOB_SP_S_SPLIT(PI_V_ID_PERSONA_DOMICILIO,
                                         '|',
                                         N_CONT + 1,
                                         V_ID_PERSONA_DOMICILIO);
    
      IF V_ID_PERSONA_DOMICILIO = '#' THEN
        EXIT;
      END IF;
    
      --verifica si existe el registro
      I_EXISTE := 0;
      SELECT COUNT(EXDI.ID_EXPEDIENTE_PERSONA)
        INTO I_EXISTE
        FROM T_SCOB_EXPEDIENTE_PERSONA EXDI
       WHERE EXDI.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
         AND EXDI.COD_TIPO_ENTIDAD = '1' --DE PERSONA
         AND EXDI.ID_PERSONA = PI_V_ID_PERSONA
         AND EXDI.ID_PERSONA_DOMICILIO = TO_NUMBER(V_ID_PERSONA_DOMICILIO);
    
      IF I_EXISTE > 0 THEN
        --EXISTE
        UPDATE T_SCOB_EXPEDIENTE_PERSONA EXDI
           SET EXDI.AUDUSUMODIFICACION = PI_V_AUDUSUCREACION,
               EXDI.AUDFECMODIFICACION = SYSDATE,
               EXDI.ESTADO             = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
         WHERE EXDI.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
           AND EXDI.COD_TIPO_ENTIDAD = '1' --DE PERSONA
           AND EXDI.ID_PERSONA = PI_V_ID_PERSONA
           AND EXDI.ID_PERSONA_DOMICILIO =
               TO_NUMBER(V_ID_PERSONA_DOMICILIO);
      
      ELSE
        --NO EXISTE
        SELECT SCOB_SQ_EXPEDIENTE_PERSONA.NEXTVAL
          INTO N_ID_EXPEDIENTE_DIRECCION
          FROM DUAL;
        INSERT INTO T_SCOB_EXPEDIENTE_PERSONA
          (ID_EXPEDIENTE_PERSONA,
           ID_EXPEDIENTE,
           COD_TIPO_ENTIDAD,
           ID_PERSONA,
           ID_PERSONA_DOMICILIO,
           ESTADO,
           AUDFECCREACION,
           AUDUSUCREACION)
        VALUES
          (N_ID_EXPEDIENTE_DIRECCION,
           PI_N_ID_EXPEDIENTE,
           '1',
           --DE PERSONA
           TO_NUMBER(PI_V_ID_PERSONA),
           TO_NUMBER(V_ID_PERSONA_DOMICILIO),
           SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO,
           SYSDATE,
           PI_V_AUDUSUCREACION);
      END IF;
      N_CONT := N_CONT + 1;
    
    END LOOP;
  
    PO_N_COD_ERROR := 0;
    PO_N_RETORNO   := PI_N_ID_EXPEDIENTE;
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

  PROCEDURE SCOB_SP_S_SOBRESEER
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 29.04.2011
    -- Proposito    : listar los registros de sobreseer
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_N_ID_EXPEDIENTE IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
   PO_CU_RETORNO      OUT CU_REC_SET) AS
  BEGIN
  
    OPEN PO_CU_RETORNO FOR
    
      SELECT EXPE.NRO_EXPEDIENTE AS NRO_EXPED_COBRANZA,
             SCOB_PK_EXPEDIENTE.SCOB_FN_SANCIONADOS_EXPED(EXPE.NRO_EXPEDIENTE) AS NOM_SANCIONADO,
             NVL(EXSO.FLG_PROCED_INFRUCTUOSO_ANT, '-1') AS IND_INFRUCTUOSO, --XQ ES SI, NO O NINGUNO(-1)
             NVL(EXSO.NRO_EXPEDIENTE_INFRUCTUOSO, ' ') AS NRO_EXPED_INFRUCTUOSO,
             DECODE(NVL(RES.NRO_DOCS, 0), 0, '0', '1') AS IND_RESOL_EMITIDAS, --RESOL
             DECODE(NVL(REC.NRO_DOCS, 0), 0, '0', '1') AS IND_RESOL_COACTIVA, --RESOL REC
             DECODE(EMB_RET.COD_TIPO_EMBARGO, 1, '1', '0') AS IND_EMBARGO_RETENCION,
             DECODE(EMB_INS.COD_TIPO_EMBARGO, 2, '1', '0') AS IND_EMBARGO_INSCRIPCION,
             DECODE(EMB_SEC.COD_TIPO_EMBARGO, 3, '1', '0') AS IND_EMBARGO_SECUESTRO,
             DECODE(EMB_INT.COD_TIPO_EMBARGO, 4, '1', '0') AS IND_EMBARGO_DEPOSITO,
             '0' AS IND_EMBARGO_CAPTURA_VEHI, --FALTA
             EXSO.DES_EMBARGO_OTRO AS DES_EMBARGO_OTROS,
             NVL(EXSO.FLG_INFORMACION_VERIFICADA, '0') AS IND_INFO_VERIFICADA,
             NVL(EXSO.FLG_MARCA_BIEN, '0') AS IND_MARCA_BIEN,
             NVL(EXSO.FLG_MARCA_BIEN_GRAVADO, '0') AS IND_MARCA_BIEN_GRAVADOS,
             NVL(EXSO.FLG_MARCA_BIEN_PROPIEDAD, '0') AS IND_MARCA_BIEN_PROPIEDAD,
             NVL(EXSO.FLG_MARCA_BIEN_EJECUCION, '0') AS IND_MARCA_EJECUCION,
             NVL(EXSO.FLG_SUNAT_BAJA_OFICIO, '0') AS IND_SUNAT_BAJA_OFICIO,
             NVL(EXSO.FLG_SUNAT_OMISO, '0') AS IND_SUNAT_OMISO,
             NVL(EXSO.FLG_SUNAT_SUSPEN_TEMP, '0') AS IND_SUNAT_SUSPEN_TEMP,
             NVL(EXSO.DES_SUNAT_OTRO, ' ') AS DES_SUNAT_OTROS,
             NVL(EXSO.FLG_INFORCORP, '0') AS IND_INFOCORP,
             NVL(EXSO.FLG_CERTICOM, '0') AS IND_CERTICOM,
             NVL(EXSO.DES_SOBRESEER, ' ') AS DES_SOBRESEER,
             EXPE.ID_MOTIVO AS ID_MOTIVO
      
        FROM T_SCOB_EXPEDIENTE EXPE
        LEFT JOIN T_SCOB_EXPEDIENTE_SOBRESEER EXSO
          ON EXSO.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
         AND EXSO.FLG_ACTUAL = '1'
      
        LEFT JOIN (SELECT GRUPO.ID_EXPEDIENTE AS ID_EXPEDIENTE,
                          COUNT(GRUPO.VERSION) AS NRO_DOCS
                     FROM (SELECT EXDO.ID_EXPEDIENTE AS ID_EXPEDIENTE,
                                  EXDO.TITULO AS TITULO,
                                  MAX(TO_NUMBER(EXDO.NRO_VERSION)) AS VERSION
                             FROM T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
                            WHERE COD_GENERADOR_DOCUMENTO IS NOT NULL
                              AND EXDO.ESTADO = '1'
                              AND EXDO.ID_TIPO_DOCUMENTO IN
                                  (SCOB_PK_CONSTANTES.C_COD_SUBTIPODOC_RESOLUCION) --DOCUMENTOS DEL TIPO REC
                            GROUP BY EXDO.ID_EXPEDIENTE, EXDO.TITULO --, PLAT.TIP_DOCUMENTO
                           ) GRUPO
                    GROUP BY GRUPO.ID_EXPEDIENTE
                   HAVING COUNT(GRUPO.VERSION) > 0) REC
          ON REC.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
        LEFT JOIN (SELECT GRUPO.ID_EXPEDIENTE AS ID_EXPEDIENTE,
                          COUNT(GRUPO.VERSION) AS NRO_DOCS
                     FROM (SELECT EXDO.ID_EXPEDIENTE AS ID_EXPEDIENTE,
                                  EXDO.TITULO AS TITULO,
                                  EXDO.ID_TIPO_DOCUMENTO,
                                  MAX(TO_NUMBER(EXDO.NRO_VERSION)) AS VERSION
                             FROM T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
                            INNER JOIN T_SCOB_TIPO_DOCUMENTO SUBT
                               ON EXDO.ID_TIPO_DOCUMENTO =
                                  SUBT.ID_TIPO_DOCUMENTO
                              AND SUBT.COD_SUBTIPO_DOCUMENTO IN (1, 3) --SUBTIPOS DE DOCUMENTOS DEL TIPO RESOL Y CELU-RESOL
                            WHERE COD_GENERADOR_DOCUMENTO IS NOT NULL
                              AND EXDO.ESTADO = '1'
                              AND EXDO.ID_TIPO_DOCUMENTO NOT IN (1, 5) --DOCUMENTOS DEL TIPO REC
                            GROUP BY EXDO.ID_EXPEDIENTE,
                                     EXDO.TITULO,
                                     EXDO.ID_TIPO_DOCUMENTO) GRUPO
                    GROUP BY GRUPO.ID_EXPEDIENTE
                   HAVING COUNT(GRUPO.VERSION) > 0) RES
          ON RES.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
      --DATOS DE EMBARGOS
        LEFT JOIN (SELECT EXEM.ID_EXPEDIENTE    AS ID_EXPEDIENTE,
                          EXEM.COD_TIPO_EMBARGO AS COD_TIPO_EMBARGO
                     FROM T_SCOB_EXPED_EMBARGO EXEM
                    WHERE EXEM.ESTADO = '1'
                      AND EXEM.COD_ESTADO_EMBARGO = '1'
                      AND EXEM.COD_TIPO_EMBARGO = 1) EMB_RET
          ON EMB_RET.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
      
        LEFT JOIN (SELECT EXEM.ID_EXPEDIENTE    AS ID_EXPEDIENTE,
                          EXEM.COD_TIPO_EMBARGO AS COD_TIPO_EMBARGO
                     FROM T_SCOB_EXPED_EMBARGO EXEM
                    WHERE EXEM.ESTADO = '1'
                      AND EXEM.COD_ESTADO_EMBARGO = '1'
                      AND EXEM.COD_TIPO_EMBARGO = 2) EMB_INS
          ON EMB_INS.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
      
        LEFT JOIN (SELECT EXEM.ID_EXPEDIENTE    AS ID_EXPEDIENTE,
                          EXEM.COD_TIPO_EMBARGO AS COD_TIPO_EMBARGO
                     FROM T_SCOB_EXPED_EMBARGO EXEM
                    WHERE EXEM.ESTADO = '1'
                      AND EXEM.COD_ESTADO_EMBARGO = '1'
                      AND EXEM.COD_TIPO_EMBARGO = 3) EMB_SEC
          ON EMB_SEC.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
      
        LEFT JOIN (SELECT EXEM.ID_EXPEDIENTE    AS ID_EXPEDIENTE,
                          EXEM.COD_TIPO_EMBARGO AS COD_TIPO_EMBARGO
                     FROM T_SCOB_EXPED_EMBARGO EXEM
                    WHERE EXEM.ESTADO = '1'
                      AND EXEM.COD_ESTADO_EMBARGO = '1'
                      AND EXEM.COD_TIPO_EMBARGO = 4) EMB_INT
          ON EMB_INT.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
      ---
      
       WHERE EXPE.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE;
  
  END;

  PROCEDURE SCOB_SP_I_SOBRESEER
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 28.04.2011
    -- Proposito    : insertar estado sobreseer del expediente
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_N_ID_EXPEDIENTE            IN T_SCOB_EXPEDIENTE_ESTADO.ID_EXPEDIENTE_ESTADO%TYPE,
   PI_N_ID_MOTIVO                IN T_SCOB_EXPEDIENTE_ESTADO.ID_MOTIVO%TYPE,
   PI_N_ESTADO_EXPEDIENTE        IN T_SCOB_EXPEDIENTE.ESTADO_EXPEDIENTE%TYPE,
   PI_C_FLG_PROCED_INFRUCTUOSO   IN T_SCOB_EXPEDIENTE_SOBRESEER.FLG_PROCED_INFRUCTUOSO_ANT%TYPE,
   PI_C_NRO_EXPEDIENTE_INFRUC    IN T_SCOB_EXPEDIENTE_SOBRESEER.NRO_EXPEDIENTE_INFRUCTUOSO%TYPE,
   PI_C_FLG_ORDEN_CAPTURA_VEHI   IN T_SCOB_EXPEDIENTE_SOBRESEER.FLG_ORDEN_CAPTURA_VEHICULAR%TYPE,
   PI_V_DES_EMBARGO_OTRO         IN T_SCOB_EXPEDIENTE_SOBRESEER.DES_EMBARGO_OTRO%TYPE,
   PI_C_FLG_INFORMACION_VERIF    IN T_SCOB_EXPEDIENTE_SOBRESEER.FLG_INFORMACION_VERIFICADA%TYPE,
   PI_C_FLG_MARCA_BIEN           IN T_SCOB_EXPEDIENTE_SOBRESEER.FLG_MARCA_BIEN%TYPE,
   PI_C_FLG_MARCA_BIEN_GRAVADO   IN T_SCOB_EXPEDIENTE_SOBRESEER.FLG_MARCA_BIEN_GRAVADO%TYPE,
   PI_C_FLG_MARCA_BIEN_PROPIEDAD IN T_SCOB_EXPEDIENTE_SOBRESEER.FLG_MARCA_BIEN_PROPIEDAD%TYPE,
   PI_C_FLG_MARCA_BIEN_EJECUCION IN T_SCOB_EXPEDIENTE_SOBRESEER.FLG_MARCA_BIEN_EJECUCION%TYPE,
   PI_C_FLG_SUNAT_BAJA_OFICIO    IN T_SCOB_EXPEDIENTE_SOBRESEER.FLG_SUNAT_BAJA_OFICIO%TYPE,
   PI_C_FLG_SUNAT_OMISO          IN T_SCOB_EXPEDIENTE_SOBRESEER.FLG_SUNAT_OMISO%TYPE,
   PI_C_FLG_SUNAT_SUSPEN_TEMP    IN T_SCOB_EXPEDIENTE_SOBRESEER.FLG_SUNAT_SUSPEN_TEMP%TYPE,
   PI_V_DES_SUNAT_OTRO           IN T_SCOB_EXPEDIENTE_SOBRESEER.DES_SUNAT_OTRO%TYPE,
   PI_C_FLG_INFORCORP            IN T_SCOB_EXPEDIENTE_SOBRESEER.FLG_INFORCORP%TYPE,
   PI_C_FLG_CERTICOM             IN T_SCOB_EXPEDIENTE_SOBRESEER.FLG_CERTICOM%TYPE,
   PI_V_DES_SOBRESEER            IN T_SCOB_EXPEDIENTE_SOBRESEER.DES_SOBRESEER%TYPE,
   PI_V_AUDUSUCREACION           IN T_SCOB_EXPEDIENTE_SOBRESEER.AUDUSUCREACION%TYPE,
   
   PO_N_RETORNO   OUT NUMBER,
   PO_N_COD_ERROR OUT NUMBER,
   PO_V_MSJ_ERROR OUT VARCHAR2) IS
    N_ID_EXPED_SOBRESEER T_SCOB_EXPEDIENTE_SOBRESEER.ID_EXPED_SOBRESEER%TYPE;
  BEGIN
    PO_V_MSJ_ERROR := '';
    PO_N_RETORNO   := 0;
    PO_N_COD_ERROR := -1;
  
    --VALIDA EL CAMBIO DE ESTADO:21.11.2011
    SCOB_PK_VALIDA_ESTADO.SCOB_SP_S_VAL_ESTADO_EXPED(PI_N_ID_EXPEDIENTE,
                                                     PI_N_ESTADO_EXPEDIENTE, --NUEVO ESTADO
                                                     PI_N_ID_MOTIVO, --NUEVO MOTIVO
                                                     PO_N_COD_ERROR,
                                                     PO_V_MSJ_ERROR);
    IF PO_N_COD_ERROR < 0 THEN
      PO_N_RETORNO := PO_N_COD_ERROR;
      RETURN;
    END IF;
  
    --ACTUALIZAR EL INDICADOR "ACTUAL" AL REGISTRO
    UPDATE T_SCOB_EXPEDIENTE_SOBRESEER EXSS
       SET EXSS.FLG_ACTUAL         = '0',
           EXSS.AUDFECMODIFICAION  = SYSDATE,
           EXSS.AUDUSUMODIFICACION = PI_V_AUDUSUCREACION
     WHERE EXSS.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
       AND EXSS.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO;
  
    SELECT SCOB_SQ_EXPEDIENTE_SOBRESEER.NEXTVAL
      INTO N_ID_EXPED_SOBRESEER
      FROM DUAL;
    INSERT INTO T_SCOB_EXPEDIENTE_SOBRESEER
      (ID_EXPED_SOBRESEER,
       ID_EXPEDIENTE,
       FLG_PROCED_INFRUCTUOSO_ANT,
       NRO_EXPEDIENTE_INFRUCTUOSO,
       FLG_ORDEN_CAPTURA_VEHICULAR,
       DES_EMBARGO_OTRO,
       FLG_INFORMACION_VERIFICADA,
       FLG_MARCA_BIEN,
       FLG_MARCA_BIEN_GRAVADO,
       FLG_MARCA_BIEN_PROPIEDAD,
       FLG_MARCA_BIEN_EJECUCION,
       FLG_SUNAT_BAJA_OFICIO,
       FLG_SUNAT_OMISO,
       FLG_SUNAT_SUSPEN_TEMP,
       DES_SUNAT_OTRO,
       FLG_INFORCORP,
       FLG_CERTICOM,
       DES_SOBRESEER,
       ESTADO,
       AUDFECCREACION,
       AUDUSUCREACION,
       FLG_ACTUAL)
    VALUES
      (N_ID_EXPED_SOBRESEER,
       PI_N_ID_EXPEDIENTE,
       PI_C_FLG_PROCED_INFRUCTUOSO,
       PI_C_NRO_EXPEDIENTE_INFRUC,
       PI_C_FLG_ORDEN_CAPTURA_VEHI,
       PI_V_DES_EMBARGO_OTRO,
       PI_C_FLG_INFORMACION_VERIF,
       PI_C_FLG_MARCA_BIEN,
       PI_C_FLG_MARCA_BIEN_GRAVADO,
       PI_C_FLG_MARCA_BIEN_PROPIEDAD,
       PI_C_FLG_MARCA_BIEN_EJECUCION,
       PI_C_FLG_SUNAT_BAJA_OFICIO,
       PI_C_FLG_SUNAT_OMISO,
       PI_C_FLG_SUNAT_SUSPEN_TEMP,
       PI_V_DES_SUNAT_OTRO,
       PI_C_FLG_INFORCORP,
       PI_C_FLG_CERTICOM,
       PI_V_DES_SOBRESEER,
       SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO,
       SYSDATE,
       PI_V_AUDUSUCREACION,
       '1');
  
    --insertar logs de estados
    SCOB_SP_I_EXPEDIENTE_ESTADO(PI_N_ID_EXPEDIENTE,
                                PI_N_ID_MOTIVO,
                                PI_N_ESTADO_EXPEDIENTE,
                                PI_V_AUDUSUCREACION,
                                PO_N_COD_ERROR,
                                PO_V_MSJ_ERROR);
    IF PO_N_COD_ERROR < 0 THEN
      RETURN;
    END IF;
  
    PO_N_COD_ERROR := 0;
    PO_N_RETORNO   := N_ID_EXPED_SOBRESEER;
    COMMIT;
    --ROLLBACK;
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

  PROCEDURE SCOB_SP_S_LISTAR_GARANTIA
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 13.05.2011
    -- Proposito    : listar las garantias registradas por la interfaz
    -----------------------------------------------------------
    -- Modificacion : 23.11.2011
    -- Autor        : RMCA
    -- Modificado   :
    -- Proposito    : integracion con el sistema de tramite documentario
    -----------------------------------------------------------
    */
  (PI_N_ID_EXPEDIENTE   IN NUMBER,
   PI_N_NU_ANIO_EXP_COB IN VW_MULTA_CF_CABECERA.NU_ANIO_EXP_COB%TYPE,
   PI_N_NU_NRO_EXP_COB  IN VW_MULTA_CF_CABECERA.NU_NRO_EXP_COB%TYPE,
   PO_CU_RETORNO        OUT CU_REC_SET) AS
  BEGIN
  
    OPEN PO_CU_RETORNO FOR
      SELECT GARA.NU_ID_EMPRESA      AS ID_EMPRESA,
             GARA.VC_ANIO_CARTA      AS ID_ANIO_CARTA,
             GARA.NU_ID_CARTA_FIANZA AS ID_CARTA_FIANZA,
             --
             GARA.VC_CARTA_FIANZA AS NRO_GARANTIA,
             GARA.VC_DATOS_REFERENCIA AS DES_GARANTIA,
             1 AS COD_TIPO,
             SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_TIPO_GARANTIA,
                                                      1) AS NOM_TIPO,
             0 AS COD_SUBTIPO, --GARA.COD_SUBTIPOCARTA AS COD_SUBTIPO,
             GARA.VC_TIPO_CARTA_FIANZA AS DES_SUBTIPO, --SUGA.TXT_DESCRIPCION AS DES_SUBTIPO,
             VC_RZ_BANCO AS NOM_BANCO,
             GARA.VC_NRO_DOC_CARTA_FIANZA AS NRO_DOC_BCO,
             0 AS COD_MONEDA,
             GARA.VC_NOMBRE_MONEDA AS NOM_MONEDA,
             GARA.NU_IMPORTE_SOLES AS MONTO_GARANTIA,
             GARA.DT_EMISION AS FEC_EMISION,
             GARA.DT_VENCIMIENTO AS FEC_VENCIMIENTO,
             --DECODE(EXGA.ID_EXPEDIENTE_GARANTIA, NULL, 1, 2) AS COD_ESTADO_GARANTIA --1=PENDIENTE;2=ASOCIADO
             0 AS COD_ESTADO_GARANTIA
        FROM VW_MULTA_CF_CABECERA GARA
      
       WHERE NU_ANIO_EXP_COB = PI_N_NU_ANIO_EXP_COB
         AND NU_NRO_EXP_COB = PI_N_NU_NRO_EXP_COB
         AND VC_VIGENTE = 'SI'
         AND TO_CHAR(GARA.NU_ID_EMPRESA) || GARA.VC_ANIO_CARTA ||
             TO_CHAR(GARA.NU_ID_CARTA_FIANZA) NOT IN
             (SELECT TO_CHAR(NU_ID_EMPRESA) || VC_ANIO_CARTA ||
                     TO_CHAR(NU_ID_CARTA_FIANZA)
                FROM T_SCOB_EXPEDIENTE_GARANTIA EXGA
               WHERE EXGA.ESTADO = '1'
                 AND EXGA.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE);
  
  END;

  PROCEDURE SCOB_SP_U_CONFIR_DATOS_GAF
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 13.05.2011
    -- Proposito    : confirmar los datos de las resoluciones de gaf
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_V_ID_EXPEDIENTE_DOCUMENTO IN VARCHAR2,
   PI_C_FEC_RESOLUCION_GAF      IN VARCHAR2, --T_SCOB_EXPEDIENTE_DOCUMENTO.FEC_RESOLUCION_GAF%TYPE,
   PI_V_NRO_RESOLUCION_GAF      IN T_SCOB_EXPEDIENTE_DOCUMENTO.NRO_RESOLUCION_GAF%TYPE,
   PI_C_TIPO_SOLICITUD          IN CHAR, --2=FRACCIONAMIENTO
   PI_I_TIPO_ASOCIACION         IN INTEGER,
   PI_N_ID_TIPO_SOLICITUD       IN NUMBER,
   PI_V_AUDUSUMODIFICACION      IN T_SCOB_EXPEDIENTE_DOCUMENTO.AUDUSUMODIFICACION%TYPE,
   PO_N_RETORNO                 OUT NUMBER,
   PO_N_COD_ERROR               OUT NUMBER,
   PO_V_MSJ_ERROR               OUT VARCHAR2) IS
  BEGIN
    PO_V_MSJ_ERROR := '';
    PO_N_RETORNO   := 0;
    PO_N_COD_ERROR := -1;
  
    UPDATE T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
       SET EXDO.FEC_RESOLUCION_GAF = TO_DATE(PI_C_FEC_RESOLUCION_GAF,
                                             'DD/MM/YYYY'),
           EXDO.NRO_RESOLUCION_GAF = PI_V_NRO_RESOLUCION_GAF,
           AUDUSUMODIFICACION      = PI_V_AUDUSUMODIFICACION,
           AUDFECMODIFICACION      = SYSDATE
     WHERE INSTR(PI_V_ID_EXPEDIENTE_DOCUMENTO,
                 '|' || TO_CHAR(EXDO.ID_EXPEDIENTE_DOCUMENTO) || '|') > 0;
  
    CASE PI_C_TIPO_SOLICITUD
      WHEN SCOB_PK_CONSTANTES.C_TIPO_GARANTIA_FRACCIONAR THEN
        IF PI_I_TIPO_ASOCIACION =
           SCOB_PK_CONSTANTES.C_TIPO_ASOC_APROBAR_RESOLUCION THEN
          --ACTUALIZA LA FECHA DE RESOLUCION GAF FRACCIONAR
          UPDATE T_SCOB_EXPED_FRACCIONAR EF
             SET EF.FEC_RESOLUCION_GAF = TO_DATE(PI_C_FEC_RESOLUCION_GAF,
                                                 'DD/MM/YYYY'),
                 EF.NRO_RESOLUCION_GAF = PI_V_NRO_RESOLUCION_GAF
           WHERE EF.ID_EXPED_FRACCIONAR = PI_N_ID_TIPO_SOLICITUD;
        END IF;
        /*
        WHEN SCOB_PK_CONSTANTES.C_TIPO_GARANTIA_SUSPENSION THEN
             IF PI_I_TIPO_ASOCIACION = SCOB_PK_CONSTANTES.C_TIP_ASOC_SUSPENDER THEN
                --ACTUALIZA LA FECHA DE RESOLUCION GAF SUSPENDER
                UPDATE T_SCOB_EXPED_SUSPENDER ES
                SET ES.FEC_RESOLUCION_GAF = TO_DATE(PI_C_FEC_RESOLUCION_GAF,'DD/MM/YYYY')
                WHERE ES.ID_EXPED_SUSPENDER = PI_N_ID_TIPO_SOLICITUD;
             END IF;
        */
      ELSE
        NULL;
    END CASE;
  
    PO_N_COD_ERROR := 0;
    PO_N_RETORNO   := 1;
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

  PROCEDURE SCOB_SP_S_SOLIC_SUSPENDER
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 12.05.2011
    -- Proposito    : listar las solicitudes de suspension
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_N_ID_EXPEDIENTE      IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
   PI_N_ID_EXPED_SUSPENDER IN T_SCOB_EXPED_SUSPENDER.ID_EXPED_SUSPENDER%TYPE,
   PO_CU_RETORNO           OUT CU_REC_SET) AS
  BEGIN
  
    OPEN PO_CU_RETORNO FOR
    
      SELECT EXSS.ID_EXPED_SUSPENDER AS ID_SOLIC_SUSPENDER,
             EXSS.NRO_SOLICITUD AS NRO_SOLICITUD,
             EXSS.FEC_RECEPCION_TRAMITE AS FEC_RECEPCION,
             TO_CHAR(EXSS.FEC_RECEPCION_TRAMITE, 'HH:MM:SS') AS HOR_RECEPCION,
             EXSS.NRO_DOCUMENTO_TRAMITE AS NRO_TRAMITE_DOC, --
             EXSS.NRO_RESOLUCION_REF_AEC AS NRO_RESOL_REF_AEC,
             EXSS.ESTADO_SOLICITUD AS COD_ESTADO_SOLIC,
             SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_EST_SOLIC_SUSPENDER,
                                                      EXSS.ESTADO_SOLICITUD) AS NOM_ESTADO_SOLIC,
             EXSS.FEC_CIERRE_TRAMITE AS FEC_CIERRE,
             EXSS.FEC_INGRESO_TRAMITE AS FEC_GENERACION,
             EXSS.ID_USUARIO_INGRESO AS ID_USUARIO_GENERACION,
             DECODE(NVL(EXSS.ID_USUARIO_INGRESO, 0),
                    0,
                    EXSS.AUDUSUCREACION,
                    USUA.USUARIO) AS COD_USUARIO_GENERACION,
             EXSS.FLG_OFICIO AS IND_OFICIO,
             EXPE.ESTADO_EXPEDIENTE AS COD_ESTADO_EXPEDIENTE,
             ESEX.DESCRIPCION AS NOM_ESTADO_EXPEDIENTE,
             DECODE(NVL(EXSS.FLG_LEVANTE, '0'), '1', 'S?', 'No') AS LEVANTE
        FROM T_SCOB_EXPED_SUSPENDER EXSS
        LEFT JOIN T_SCOB_USUARIO USUA
          ON USUA.ID_USUARIO = EXSS.ID_USUARIO_INGRESO
       INNER JOIN T_SCOB_EXPEDIENTE EXPE
          ON EXPE.ID_EXPEDIENTE = EXSS.ID_EXPEDIENTE
       INNER JOIN T_SCOB_EST_EXP_COB ESEX
          ON ESEX.ID_EST_EXP_COB = EXPE.ESTADO_EXPEDIENTE
       WHERE EXSS.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
         AND EXSS.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
         AND (NVL(PI_N_ID_EXPED_SUSPENDER, 0) = 0 OR
             (NVL(PI_N_ID_EXPED_SUSPENDER, 0) <> 0 AND
             EXSS.ID_EXPED_SUSPENDER = PI_N_ID_EXPED_SUSPENDER))
       ORDER BY EXSS.NRO_SOLICITUD DESC
      
      ;
  
  END;

  PROCEDURE SCOB_SP_U_SOLIC_SUSPENDER
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 12/05/2011
    -- Proposito    : actualizar los datos de la solicitud de suspension
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_N_ID_EXPED_SUSPENDER      IN T_SCOB_EXPED_SUSPENDER.ID_EXPED_SUSPENDER%TYPE,
   PI_V_NRO_SOLICITUD           IN T_SCOB_EXPED_SUSPENDER.NRO_SOLICITUD%TYPE,
   PI_V_NRO_DOCUMENTO_TRAMITE   IN T_SCOB_EXPED_SUSPENDER.NRO_DOCUMENTO_TRAMITE%TYPE,
   PI_N_ID_EXPEDIENTE_DOCUMENTO IN T_SCOB_EXPED_SUSPENDER.ID_EXPEDIENTE_DOCUMENTO%TYPE,
   PI_V_AUDUSUMODIFICACION      IN T_SCOB_EXPED_SUSPENDER.AUDUSUMODIFICACION%TYPE,
   PO_N_RETORNO                 OUT NUMBER,
   PO_N_COD_ERROR               OUT NUMBER,
   PO_V_MSJ_ERROR               OUT VARCHAR2) IS
    V_NRO_RESOLUCION T_SCOB_EXPEDIENTE_DOCUMENTO.NRO_RESOLUCION%TYPE;
  BEGIN
    PO_V_MSJ_ERROR := '';
    PO_N_RETORNO   := 0;
    PO_N_COD_ERROR := -1;
  
    --obtener el numero de resolucion del documento seleccionado
    SELECT EXDO.NRO_RESOLUCION
      INTO V_NRO_RESOLUCION
      FROM T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
     WHERE EXDO.ID_EXPEDIENTE_DOCUMENTO = PI_N_ID_EXPEDIENTE_DOCUMENTO;
  
    --actualizar el registro
    UPDATE T_SCOB_EXPED_SUSPENDER EXSS
       SET NRO_SOLICITUD               = PI_V_NRO_SOLICITUD,
           NRO_DOCUMENTO_TRAMITE       = PI_V_NRO_DOCUMENTO_TRAMITE,
           EXSS.NRO_RESOLUCION_REF_AEC = V_NRO_RESOLUCION,
           ID_EXPEDIENTE_DOCUMENTO     = PI_N_ID_EXPEDIENTE_DOCUMENTO,
           AUDUSUMODIFICACION          = PI_V_AUDUSUMODIFICACION,
           AUDFECMODIFICACION          = SYSDATE
     WHERE EXSS.ID_EXPED_SUSPENDER = PI_N_ID_EXPED_SUSPENDER;
  
    PO_N_COD_ERROR := 0;
    PO_N_RETORNO   := PI_N_ID_EXPED_SUSPENDER;
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

  PROCEDURE SCOB_SP_S_SOLIC_SUSPENDER_DOCS
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 13.05.2011
    -- Proposito    : lista los documentos asociados de una solicitud de suspension
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_N_ID_EXPED_SUSPENDER  IN T_SCOB_EXPED_SUSPENDER.ID_EXPED_SUSPENDER%TYPE,
   PI_I_COD_TIPO_ASOCIACION IN T_SCOB_EXPED_SUSPENDER_DOC.COD_TIPO_ASOCIACION%TYPE,
   PO_CU_RETORNO            OUT CU_REC_SET) AS
  BEGIN
  
    OPEN PO_CU_RETORNO FOR
      SELECT EXDO.ID_EXPEDIENTE_DOCUMENTO AS ID_DOCUMENTO,
             EXDO.ID_EXPEDIENTE AS ID_EXPEDIENTE,
             EXPE.ANIO || EXPE.NRO_EXPEDIENTE AS NRO_EXPEDIENTE,
             EXDO.NOMBRE AS NOM_ARCHIVO,
             EXDO.NRO_RESOLUCION AS NRO_RESOLUCION,
             EXDO.NRO_DOCUMENTO AS NRO_DOCUMENTO,
             EXDO.NRO_VERSION AS NRO_VERSION,
             EXDO.FEC_INGRESO AS FEC_GENERADO_POR,
             EXDO.AUDUSUCREACION AS USU_GENERADO_POR,
             EXDO.MONTO_COSTA AS MONTO_COSTA,
             EXDO.NRO_RESOLUCION_GAF AS NRO_RESOLUCION_GAF,
             EXDO.FEC_RESOLUCION_GAF AS FEC_RESOLUCION_GAF,
             --ESDO.COD_ESTADO_DOCUMENTO AS COD_ESTADO_DOC_SUSPENDER, --SE ELIMINO
             --SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_EST_DOCS_SUSPENDIDOS,ESDO.COD_ESTADO_DOCUMENTO) AS NOM_ESTADO_DOC_SUSPENDER, --SE ELIMINO
             TDOC.COD_SUBTIPO_DOCUMENTO AS COD_SUBTIPO_DOCUMENTO
        FROM T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
       INNER JOIN T_SCOB_TIPO_DOCUMENTO TDOC
          ON TDOC.ID_TIPO_DOCUMENTO = EXDO.ID_TIPO_DOCUMENTO
       INNER JOIN T_SCOB_EXPEDIENTE EXPE
          ON EXPE.ID_EXPEDIENTE = EXDO.ID_EXPEDIENTE
       INNER JOIN T_SCOB_EXPED_SUSPENDER_DOC ESDO
          ON ESDO.ID_EXPEDIENTE_DOCUMENTO = EXDO.ID_EXPEDIENTE_DOCUMENTO
       WHERE ESDO.ID_EXPED_SUSPENDER = PI_N_ID_EXPED_SUSPENDER
         AND NVL(ESDO.COD_TIPO_ASOCIACION, '0') =
             NVL(PI_I_COD_TIPO_ASOCIACION, '0')
      /*
      AND EXDO.Tipo_Doc_Asoc IN (
          SCOB_PK_CONSTANTES.C_TIPO_DOC_ASOC_SISTEMA,
          SCOB_PK_CONSTANTES.C_TIPO_DOC_ASOC_SISTEMA_ACT
          )
      */
       ORDER BY EXDO.ID_EXPEDIENTE_DOCUMENTO;
  END;

  PROCEDURE SCOB_SP_S_ENTIDAD_ESTATAL
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 23.05.2011
    -- Proposito    : listar las entidades estatales
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_I_COD_TIPO_ENTIDAD IN T_SCOB_ENTIDAD_ESTATAL.COD_TIPO_ENTIDAD%TYPE,
   PI_C_COD_DPTO         IN T_SCOB_UBIGEO.COD_DPTO%TYPE,
   PI_C_COD_PROV         IN T_SCOB_UBIGEO.COD_PROV%TYPE,
   PI_C_COD_DSTO         IN T_SCOB_UBIGEO.COD_DIST%TYPE,
   PO_CU_RETORNO         OUT CU_REC_SET) AS
  BEGIN
  
    OPEN PO_CU_RETORNO FOR
    
      SELECT ENES.ID_ENTIDAD_ESTATAL AS ID_ENTIDAD_ESTATAL,
             ENES.NOM_ENTIDAD        AS NOM_ENTIDAD,
             ENES.ID_UBIGEO          AS ID_UBIGEO,
             UBIG.TXT_DPTO           AS TXT_DPTO,
             UBIG.TXT_PROV           AS TXT_PROV,
             UBIG.TXT_DIST           AS TXT_DIST,
             ENES.NOM_DIRECCION      AS NOM_DIRECCION,
             ENES.COD_TIPO_ENTIDAD   AS COD_TIPO_ENTIDAD
        FROM T_SCOB_ENTIDAD_ESTATAL ENES
        LEFT JOIN T_SCOB_UBIGEO UBIG
          ON UBIG.ID_UBIGEO = ENES.ID_UBIGEO
       WHERE (PI_I_COD_TIPO_ENTIDAD = 0 OR
             ENES.COD_TIPO_ENTIDAD = PI_I_COD_TIPO_ENTIDAD)
         AND (NVL(PI_C_COD_DPTO, ' ') = ' ' OR
             (NVL(PI_C_COD_DPTO, ' ') <> ' ' AND
             TRIM(UBIG.COD_DPTO) = TRIM(PI_C_COD_DPTO)))
         AND (NVL(PI_C_COD_PROV, ' ') = ' ' OR
             (NVL(PI_C_COD_PROV, ' ') <> ' ' AND
             TRIM(UBIG.COD_PROV) = TRIM(PI_C_COD_PROV)))
         AND (NVL(PI_C_COD_DSTO, ' ') = ' ' OR
             (NVL(PI_C_COD_DSTO, ' ') <> ' ' AND
             TRIM(UBIG.COD_DIST) = TRIM(PI_C_COD_DSTO)))
         AND ENES.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
       ORDER BY ENES.NOM_ENTIDAD;
  
  END;

  /*
  procedure SCOB_SP_S_EXPED_ARCH_CENTRAL
  /*
  -----------------------------------------------------------
  -- Autor        : RMCA
  -- Creado       : 23.05.2011
  -- Proposito    : listar los envios registrado o enviados a archivo central
  -----------------------------------------------------------
  -- Modificacion :
  -- Autor        :
  -- Modificado   :
  -- Proposito    :
  -----------------------------------------------------------
  */
  /*
  (
    PI_N_ID_EXPEDIENTE                IN T_SCOB_EXPED_ARCHIVO_CENTRAL.ID_EXPEDIENTE%TYPE,
    PI_N_ID_EXPED_ARCHIVO_CENTRAL     IN T_SCOB_EXPED_ARCHIVO_CENTRAL.ID_EXPED_ARCHIVO_CENTRAL%TYPE,
    po_cu_retorno                     out cu_rec_set
  )
  as
  begin
  
    open  po_cu_retorno for
    SELECT
      EXAC.ID_EXPED_ARCHIVO_CENTRAL AS ID_EXPED_ARCHIVO_CENTRAL,
      EXPE.ID_EXPEDIENTE AS ID_EXPEDIENTE,
      EXPE.ANIO AS ANIO_EXPEDIENTE,
      EXPE.NRO_EXPEDIENTE AS NRO_EXPEDIENTE,
      ARCE.NRO_ORDEN AS NRO_ORDEN,
      ARCE.FEC_ENVIO AS FEC_ENVIO_ORDEN,
  
      EXAC.COD_TIPO_ACCESIBILIDAD AS COD_TIPO_ACCESIBILIDAD,
      SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_TIPO_ACCESO_ARCHIVO, EXAC.COD_TIPO_ACCESIBILIDAD) AS NOM_TIPO_ACCESIBILIDAD,
  
      EXAC.COD_TIPO_ENVIO AS COD_TIPO_ENVIO,
      SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_TIPO_ENVIO_ARCHIVO, EXAC.COD_TIPO_ENVIO) AS NOM_TIPO_ENVIO,
  
      EXAC.ESTADO_ARCHIVO AS COD_ESTADO_EXPEDIENTE_ARCHIVO,
      SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_TIPO_ENVIO_EXPED_ARCH, EXAC.ESTADO_ARCHIVO) AS NOM_ESTADO_EXPEDIENTE_ARCHIVO,
  
      EXAC.FLG_CONCLUIDO AS FLG_CONCLUIDO,
      EXAC.FLG_FOLIADO AS FLG_FOLIADO,
      EXAC.FLG_ETIQUETADO AS FLG_ETIQUETADO,
      EXAC.FLG_RESOLUCION_COACTIVA AS FLG_RESOLUCION_COACTIVA,
      EXAC.FLG_ACTUAL AS FLG_ACTUAL,
      EXAC.NRO_FOLIOS AS NRO_FOLIOS,
      EXAC.TXT_OBSERVACION as TXT_OBSERVACION
  
    FROM T_SCOB_EXPEDIENTE EXPE
    LEFT JOIN T_SCOB_EXPED_ARCHIVO_CENTRAL EXAC
         ON EXAC.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
    LEFT JOIN T_SCOB_ARCHIVO_CENTRAL ARCE
         ON ARCE.ID_ARCHIVO_CENTRAL = EXAC.ID_ARCHIVO_CENTRAL
    WHERE EXPE.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
         AND (PI_N_ID_EXPED_ARCHIVO_CENTRAL=0 OR (PI_N_ID_EXPED_ARCHIVO_CENTRAL<>0 AND EXAC.ID_EXPED_ARCHIVO_CENTRAL = PI_N_ID_EXPED_ARCHIVO_CENTRAL))
         AND EXAC.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
    ORDER BY EXAC.ID_EXPED_ARCHIVO_CENTRAL ASC;
  
  end;
  
  */

  /*
  procedure SCOB_SP_U_GENERAR_ENVIO_ARCH
  /*
  -----------------------------------------------------------
  -- Autor        : RMCA
  -- Creado       : 23.05.2011
  -- Proposito    : envia a archivo central los expedientes seleccionados.
  -----------------------------------------------------------
  -- Modificacion :
  -- Autor        :
  -- Modificado   :
  -- Proposito    :
  -----------------------------------------------------------
  */
  /*
  (
    PI_V_ID_EXPEDIENTE            IN VARCHAR2,
    PI_I_NRO_REG                  IN INTEGER,
    PI_V_AUDUSUCREACION           IN T_SCOB_ARCHIVO_CENTRAL.AUDUSUCREACION%TYPE,
    PI_N_ID_USUARIO               IN T_SCOB_ARCHIVO_CENTRAL.ID_USUARIO_ENVIO%TYPE,
    po_n_retorno                  out number,
    po_n_cod_error                out number,
    po_v_msj_error                out varchar2
  )
  is
    I_NRO_REG                     INTEGER;
    N_ID_ARCHIVO_CENTRAL          T_SCOB_ARCHIVO_CENTRAL.ID_ARCHIVO_CENTRAL%TYPE;
  
  begin
    po_n_retorno := 0;
    po_v_msj_error :='';
    po_n_cod_error := -1;
  
    --valida el estado de los expedientes seleccionados
    SELECT COUNT(DISTINCT EXPE.ID_EXPEDIENTE)
    INTO I_NRO_REG
    FROM T_SCOB_EXPEDIENTE EXPE
    WHERE
    INSTR(PI_V_ID_EXPEDIENTE,'|' || TO_CHAR(EXPE.ID_EXPEDIENTE) || '|' )>0
    AND (
        EXPE.ESTADO_EXPEDIENTE = SCOB_PK_CONSTANTES.C_TBL_EST_EXP_PRECOACTIVO
        OR EXPE.ESTADO_EXPEDIENTE = SCOB_PK_CONSTANTES.C_TBL_EST_EXP_EN_GIRO
        OR EXPE.ESTADO_EXPEDIENTE = SCOB_PK_CONSTANTES.C_TBL_EST_EXP_CONCLUIDO
        OR EXPE.ESTADO_EXPEDIENTE = SCOB_PK_CONSTANTES.C_TBL_EST_EXP_PEF);
  
    IF I_NRO_REG < PI_I_NRO_REG THEN
        po_v_msj_error :='No se puede realizar la acci?n. El estado del expediente debe ser: Precoactivo, PEF, Concluido o Suspendido.';
        po_n_cod_error := -10;
        return;
    END IF;
  
    --valida que los expedientes no tengan envio generado.
    SELECT COUNT(DISTINCT ARCE.ID_EXPEDIENTE)
    INTO I_NRO_REG
    FROM T_SCOB_EXPED_ARCHIVO_CENTRAL ARCE
    WHERE
      ARCE.FLG_ACTUAL = '1'
      AND ARCE.ID_ARCHIVO_CENTRAL IS NULL
      AND ARCE.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
      AND INSTR(PI_V_ID_EXPEDIENTE,'|' || TO_CHAR(ARCE.ID_EXPEDIENTE) || '|' )>0;
  
    IF I_NRO_REG <> PI_I_NRO_REG THEN
        po_v_msj_error :='No se puede realizar la acci?n. Algunos de los expedientes antes han sido enviados a Archivo Central o a?n no tienen solicitud de envio registrado.';
        po_n_cod_error := -11;
        return;
    END IF;
  
    --genera el envio
    SELECT SCOB_SQ_ARCHIVO_CENTRAL.NEXTVAL INTO N_ID_ARCHIVO_CENTRAL FROM DUAL;
    INSERT INTO T_SCOB_ARCHIVO_CENTRAL(
      ID_ARCHIVO_CENTRAL,
      NRO_ORDEN,
      FEC_ENVIO,
      ID_USUARIO_ENVIO,
      ESTADO,
      AUDFECCREACION,
      AUDUSUCREACION
    )
    VALUES(
      N_ID_ARCHIVO_CENTRAL,
      LPAD(SCOB_SQ_NRO_ARCHIVO_CENTRAL.NEXTVAL,3,'000'), --falta debe generarse por a?o
      SYSDATE,
      PI_N_ID_USUARIO,
      SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO,
      SYSDATE,
      PI_V_AUDUSUCREACION
    );
  
    UPDATE T_SCOB_EXPED_ARCHIVO_CENTRAL EXAC
    SET
      ID_ARCHIVO_CENTRAL = N_ID_ARCHIVO_CENTRAL,
      ESTADO_ARCHIVO = '2', --ENVIADO A ARCHIVO CENTRAL
      AUDFECMODIFICACION = SYSDATE,
      AUDUSUMODIFICACION = PI_V_AUDUSUCREACION
    WHERE
      INSTR(PI_V_ID_EXPEDIENTE,'|' || TO_CHAR(EXAC.ID_EXPEDIENTE) || '|' )>0
      AND EXAC.FLG_ACTUAL = '1'
      AND EXAC.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO;
  
    po_n_retorno := N_ID_ARCHIVO_CENTRAL;
    po_n_cod_error := 0;
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
  */

  /*
  procedure SCOB_SP_I_ENVIAR_ARCH_CENTRAL
  /*
  -----------------------------------------------------------
  -- Autor        : RMCA
  -- Creado       : 23.05.2011
  -- Proposito    : insertar un registro solicitando el envio a archivo central
  -----------------------------------------------------------
  -- Modificacion :
  -- Autor        :
  -- Modificado   :
  -- Proposito    :
  -----------------------------------------------------------
  */
  /*
  (
    PI_N_ID_EXPEDIENTE                   IN T_SCOB_EXPED_ARCHIVO_CENTRAL.ID_EXPEDIENTE%TYPE,
    PI_I_NRO_FOLIOS                      IN T_SCOB_EXPED_ARCHIVO_CENTRAL.NRO_FOLIOS%TYPE,
    PI_I_COD_TIPO_ACCESIBILIDAD          IN T_SCOB_EXPED_ARCHIVO_CENTRAL.COD_TIPO_ACCESIBILIDAD%TYPE,
    PI_I_COD_TIPO_ENVIO                  IN T_SCOB_EXPED_ARCHIVO_CENTRAL.COD_TIPO_ENVIO%TYPE,
    PI_C_FLG_CONCLUIDO                   IN T_SCOB_EXPED_ARCHIVO_CENTRAL.FLG_CONCLUIDO%TYPE,
    PI_C_FLG_FOLIADO                     IN T_SCOB_EXPED_ARCHIVO_CENTRAL.FLG_FOLIADO%TYPE,
    PI_C_FLG_ETIQUETADO                  IN T_SCOB_EXPED_ARCHIVO_CENTRAL.FLG_ETIQUETADO%TYPE,
    PI_C_FLG_RESOLUCION_COACTIVA         IN T_SCOB_EXPED_ARCHIVO_CENTRAL.FLG_RESOLUCION_COACTIVA%TYPE,
    PI_V_TXT_OBSERVACION                 IN T_SCOB_EXPED_ARCHIVO_CENTRAL.TXT_OBSERVACION%TYPE,
    PI_N_ID_USUARIO                      IN T_SCOB_EXPED_ARCHIVO_CENTRAL.ID_USUARIO_INGRESO%TYPE,
    PI_V_AUDUSUCREACION                  IN T_SCOB_EXPED_ARCHIVO_CENTRAL.AUDUSUCREACION%TYPE,
  
    po_n_retorno                         out number,
    po_n_cod_error                       out number,
    po_v_msj_error                       out varchar2
  )
  is
    I_NRO_REG                            INTEGER;
  
  begin
    po_n_retorno := 0;
    po_v_msj_error :='';
    po_n_cod_error := -1;
  
    --validar que el ultimo registro para envio a archivo central se encuentre realizado.
    SELECT COUNT(EXAC.ID_EXPED_ARCHIVO_CENTRAL)
    INTO I_NRO_REG
    FROM T_SCOB_EXPED_ARCHIVO_CENTRAL EXAC
    WHERE EXAC.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
    AND EXAC.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
    AND EXAC.FLG_ACTUAL = '1'
    AND EXAC.ESTADO_ARCHIVO = 1; --PENDIENTE DE ENVIO A ARCHIVO CENTRAL
  
    IF I_NRO_REG > 0 THEN --ESTA PENDIENTE DE ENVIO
      po_v_msj_error :='No se puede realizar la acci?n. El expediente cuenta con un registro de envio pendiente a archivo central.';
      po_n_cod_error := -10;
      return;
    END IF;
  
    --cambiar el estado flg_actual al registro.
    UPDATE T_SCOB_EXPED_ARCHIVO_CENTRAL ARCE
    SET
      FLG_ACTUAL = '0',
      AUDFECMODIFICACION = SYSDATE,
      AUDUSUMODIFICACION = PI_V_AUDUSUCREACION
    WHERE
      ARCE.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
      AND ARCE.FLG_ACTUAL = '1'
      AND ARCE.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO;
  
    --insertar el registro
    INSERT INTO T_SCOB_EXPED_ARCHIVO_CENTRAL(
      ID_EXPED_ARCHIVO_CENTRAL,
      ID_EXPEDIENTE,
      NRO_FOLIOS,
      COD_TIPO_ACCESIBILIDAD,
      COD_TIPO_ENVIO,
      ESTADO_ARCHIVO,
      FLG_CONCLUIDO,
      FLG_FOLIADO,
      FLG_ETIQUETADO,
      FLG_RESOLUCION_COACTIVA,
      FEC_INGRESO,
      ID_USUARIO_INGRESO,
      ESTADO,
      AUDFECCREACION,
      AUDUSUCREACION,
      FLG_ACTUAL,
      TXT_OBSERVACION
  
    )
    VALUES(
      SCOB_SQ_EXPED_ARCHIVO_CENTRAL.NEXTVAL,
      PI_N_ID_EXPEDIENTE,
      PI_I_NRO_FOLIOS,
      PI_I_COD_TIPO_ACCESIBILIDAD,
      PI_I_COD_TIPO_ENVIO,
      '1', --ESTADO_ARCHIVO --ESTADO PENDIENTE DE ENVIO
      PI_C_FLG_CONCLUIDO,
      PI_C_FLG_FOLIADO,
      PI_C_FLG_ETIQUETADO,
      PI_C_FLG_RESOLUCION_COACTIVA,
      SYSDATE,
      PI_N_ID_USUARIO,
      SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO,
      SYSDATE,
      PI_V_AUDUSUCREACION,
      '1',  --FLG_ACTUAL
      PI_V_TXT_OBSERVACION
    );
  
    po_n_retorno := PI_N_ID_EXPEDIENTE;
    po_n_cod_error := 0;
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
  */

  /*
  procedure SCOB_SP_U_ENVIAR_ARCH_CENTRAL
  /*
  -----------------------------------------------------------
  -- Autor        : RMCA
  -- Creado       : 23.05.2011
  -- Proposito    : actualizar el registro de solicitud de envio a archivo central
  -----------------------------------------------------------
  -- Modificacion :
  -- Autor        :
  -- Modificado   :
  -- Proposito    :
  -----------------------------------------------------------
  */
  /*
  (
    PI_N_ID_EXPED_ARCHIVO_CENTRAL        IN T_SCOB_EXPED_ARCHIVO_CENTRAL.ID_EXPED_ARCHIVO_CENTRAL%TYPE,
    PI_I_NRO_FOLIOS                      IN T_SCOB_EXPED_ARCHIVO_CENTRAL.NRO_FOLIOS%TYPE,
    PI_I_COD_TIPO_ACCESIBILIDAD          IN T_SCOB_EXPED_ARCHIVO_CENTRAL.COD_TIPO_ACCESIBILIDAD%TYPE,
    PI_I_COD_TIPO_ENVIO                  IN T_SCOB_EXPED_ARCHIVO_CENTRAL.COD_TIPO_ENVIO%TYPE,
    PI_C_FLG_CONCLUIDO                   IN T_SCOB_EXPED_ARCHIVO_CENTRAL.FLG_CONCLUIDO%TYPE,
    PI_C_FLG_FOLIADO                     IN T_SCOB_EXPED_ARCHIVO_CENTRAL.FLG_FOLIADO%TYPE,
    PI_C_FLG_ETIQUETADO                  IN T_SCOB_EXPED_ARCHIVO_CENTRAL.FLG_ETIQUETADO%TYPE,
    PI_C_FLG_RESOLUCION_COACTIVA         IN T_SCOB_EXPED_ARCHIVO_CENTRAL.FLG_RESOLUCION_COACTIVA%TYPE,
    PI_V_TXT_OBSERVACION                 IN T_SCOB_EXPED_ARCHIVO_CENTRAL.TXT_OBSERVACION%TYPE,
    PI_V_AUDUSUCREACION                  IN T_SCOB_EXPED_ARCHIVO_CENTRAL.AUDUSUCREACION%TYPE,
    po_n_retorno                         out number,
    po_n_cod_error                       out number,
    po_v_msj_error                       out varchar2
  )
  is
    I_NRO_REG                            INTEGER;
  
  begin
    po_n_retorno := 0;
    po_v_msj_error :='';
    po_n_cod_error := -1;
  
    --verifica que el registro no haya sido enviado
    SELECT COUNT(EXAC.ID_EXPED_ARCHIVO_CENTRAL)
    INTO I_NRO_REG
    FROM T_SCOB_EXPED_ARCHIVO_CENTRAL EXAC
    WHERE EXAC.ID_EXPED_ARCHIVO_CENTRAL = PI_N_ID_EXPED_ARCHIVO_CENTRAL
    AND ESTADO_ARCHIVO = 2; --ENVIADO A ARCHIVO CENTRAL;
  
    IF I_NRO_REG > 0 THEN
      po_v_msj_error :='No se puede realizar la acci?n. El registro antes ha sido enviado a archivo central.';
      po_n_cod_error := -10;
      return;
    END IF;
  
    --actualiza el registro
    UPDATE T_SCOB_EXPED_ARCHIVO_CENTRAL ARCE
    SET
      NRO_FOLIOS = PI_I_NRO_FOLIOS,
      COD_TIPO_ACCESIBILIDAD = PI_I_COD_TIPO_ACCESIBILIDAD,
      COD_TIPO_ENVIO = PI_I_COD_TIPO_ENVIO,
      FLG_CONCLUIDO = PI_C_FLG_CONCLUIDO,
      FLG_FOLIADO = PI_C_FLG_FOLIADO,
      FLG_ETIQUETADO = PI_C_FLG_ETIQUETADO,
      FLG_RESOLUCION_COACTIVA = PI_C_FLG_RESOLUCION_COACTIVA,
      AUDUSUMODIFICACION = PI_V_AUDUSUCREACION,
      AUDFECMODIFICACION = SYSDATE,
      TXT_OBSERVACION = PI_V_TXT_OBSERVACION
    WHERE ARCE.ID_EXPED_ARCHIVO_CENTRAL = PI_N_ID_EXPED_ARCHIVO_CENTRAL;
  
    po_n_retorno := PI_N_ID_EXPED_ARCHIVO_CENTRAL;
    po_n_cod_error := 0;
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
  */

  /*
  procedure SCOB_SP_D_ENVIAR_ARCH_CENTRAL
  /*
  -----------------------------------------------------------
  -- Autor        : RMCA
  -- Creado       : 23.05.2011
  -- Proposito    : elimina el registro de solicitud de envio a archivo central
  -----------------------------------------------------------
  -- Modificacion :
  -- Autor        :
  -- Modificado   :
  -- Proposito    :
  -----------------------------------------------------------
  */
  /*
  (
    PI_N_ID_EXPED_ARCHIVO_CENTRAL        IN T_SCOB_EXPED_ARCHIVO_CENTRAL.ID_EXPED_ARCHIVO_CENTRAL%TYPE,
    PI_V_AUDUSUCREACION                  IN T_SCOB_EXPED_ARCHIVO_CENTRAL.AUDUSUCREACION%TYPE,
    po_n_retorno                         out number,
    po_n_cod_error                       out number,
    po_v_msj_error                       out varchar2
  )
  is
    I_NRO_REG                            INTEGER;
  begin
    po_n_retorno := 0;
    po_v_msj_error :='';
    po_n_cod_error := -1;
  
    --verifica que el registro no haya sido enviado
    SELECT COUNT(EXAC.ID_EXPED_ARCHIVO_CENTRAL)
    INTO I_NRO_REG
    FROM T_SCOB_EXPED_ARCHIVO_CENTRAL EXAC
    WHERE EXAC.ID_EXPED_ARCHIVO_CENTRAL = PI_N_ID_EXPED_ARCHIVO_CENTRAL
    AND ESTADO_ARCHIVO = 2; --ENVIADO A ARCHIVO CENTRAL.
  
    IF I_NRO_REG > 0 THEN
      po_v_msj_error :='No se puede realizar la acci?n. El registro antes ha sido enviado a archivo central.';
      po_n_cod_error := -10;
      return;
    END IF;
  
    --actualiza el registro
    UPDATE T_SCOB_EXPED_ARCHIVO_CENTRAL ARCE
    SET
      ARCE.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_INACTIVO,
      AUDUSUMODIFICACION = PI_V_AUDUSUCREACION,
      AUDFECMODIFICACION = SYSDATE
    WHERE ARCE.ID_EXPED_ARCHIVO_CENTRAL = PI_N_ID_EXPED_ARCHIVO_CENTRAL;
  
    po_n_retorno := PI_N_ID_EXPED_ARCHIVO_CENTRAL;
    po_n_cod_error := 0;
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
  */

  /*
  procedure SCOB_SP_S_GENERAR_ENVIO_ARCH
  /*
  -----------------------------------------------------------
  -- Autor        : RMCA
  -- Creado       : 23.05.2011
  -- Proposito    : listar los expedientes a enviar a archivo central.
  -----------------------------------------------------------
  -- Modificacion :
  -- Autor        :
  -- Modificado   :
  -- Proposito    :
  -----------------------------------------------------------
  */
  /*
  (
    PI_N_ID_ARCHIVO_CENTRAL           IN T_SCOB_ARCHIVO_CENTRAL.ID_ARCHIVO_CENTRAL%TYPE,
    po_cu_retorno                     out cu_rec_set
  )
  as
  begin
  
    open  po_cu_retorno for
    SELECT DISTINCT
      EXPE.ANIO AS ANIO_EXPEDIENTE,
      EXAC.NRO_FOLIOS AS NRO_FOLIOS,
      EXPE.NRO_EXPEDIENTE AS NRO_EXPEDIENTE,
      DECODE(EXPE.FLG_TIPO_EXPEDIENTE,'1',PERS.COD_SANCIONADO,'0') AS COD_SANCIONADO,
      --DECODE(EXPE.FLG_TIPO_EXPEDIENTE,'1',DECODE(PERS.TIPO_PERSONA,SCOB_PK_CONSTANTES.C_TIPO_PERS_JURIDICA,  PERS.RAZON_SOCIAL,  PERS.PRI_NOMBRE || ' ' || PERS.SEG_NOMBRE || ' ' || PERS.APE_PATERNO  || ' ' || PERS.APE_MATERNO  || ' ' || PERS.APE_CASADA), SCOB_PK_EXPEDIENTE.SCOB_FN_SANCIONADOS_EXPED(EXPE.ID_EXPEDIENTE)) AS NOM_SANCIONADO,
      DECODE(EXPE.FLG_TIPO_EXPEDIENTE,'1',DECODE(PERS.TIPO_PERSONA,SCOB_PK_CONSTANTES.C_TIPO_PERS_JURIDICA,  PERS.RAZON_SOCIAL,  PERS.APE_PATERNO  || ' ' || PERS.APE_MATERNO  || ' ' || PERS.PRI_NOMBRE || ' ' || PERS.SEG_NOMBRE || ' ' || PERS.APE_CASADA), SCOB_PK_EXPEDIENTE.SCOB_FN_SANCIONADOS_EXPED(EXPE.ID_EXPEDIENTE)) AS NOM_SANCIONADO,
      DECODE(EXAC.COD_TIPO_ACCESIBILIDAD,1,'1','0') AS FLG_ACCCESIBILIDAD_P,
      DECODE(EXAC.COD_TIPO_ACCESIBILIDAD,2,'1','0') AS FLG_ACCCESIBILIDAD_I,
      DECODE(EXAC.COD_TIPO_ACCESIBILIDAD,3,'1','0') AS FLG_ACCCESIBILIDAD_C,
      DECODE(EXAC.COD_TIPO_ACCESIBILIDAD,4,'1','0') AS FLG_ACCCESIBILIDAD_R,
      EXPE.ESTADO_EXPEDIENTE AS COD_ESTADO_EXPEDIENTE,
      ESEC.DESCRIPCION AS NOM_ESTADO_EXPEDIENTE,
      EXAC.TXT_OBSERVACION AS OBSERVACION
    FROM T_SCOB_ARCHIVO_CENTRAL ARCE
    INNER JOIN T_SCOB_EXPED_ARCHIVO_CENTRAL EXAC
          ON EXAC.ID_ARCHIVO_CENTRAL = ARCE.ID_ARCHIVO_CENTRAL
          AND EXAC.ESTADO = '1'
    INNER JOIN T_SCOB_EXPEDIENTE EXPE
          ON EXPE.ID_EXPEDIENTE = EXAC.ID_EXPEDIENTE
    INNER JOIN T_SCOB_EST_EXP_COB ESEC
          ON ESEC.CODIGO = EXPE.ESTADO_EXPEDIENTE
    INNER JOIN T_SCOB_EXPEDIENTE_MULTA EXMU
          ON EXMU.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
          AND EXMU.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
    INNER JOIN T_SCOB_MULTA MULT
          ON MULT.ID_MULTA = EXMU.ID_MULTA
    INNER JOIN T_SCOB_MULTA_DETAL MDET
          ON MDET.ID_MULTA = EXMU.ID_MULTA
          AND MDET.FLG_ACTUAL = '1'
    INNER JOIN T_SCOB_MULTA_SANCIONADO MSAN
          ON MSAN.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL
          AND MSAN.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
    INNER JOIN T_SCOB_PERSONA PERS
          ON PERS.ID_PERSONA = MSAN.ID_PERSONA
    WHERE ARCE.ID_ARCHIVO_CENTRAL = PI_N_ID_ARCHIVO_CENTRAL;
  
  end;
  */

  PROCEDURE SCOB_SP_S_LISTAR_EXPED_PERSONA
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 24.05.2011
    -- Proposito    : listar las personas asociadas a un expediente ?
                      listar las personas asociadas a un embargo de inscripcion.
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_N_ID_EXPEDIENTE         IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
   PI_N_ID_EXPEDIENTE_EMBARGO IN T_SCOB_EXPED_EMBARGO.ID_EXPEDIENTE_EMBARGO%TYPE,
   PI_I_COD_TIPO_ENTIDAD      IN T_SCOB_EXPEDIENTE_PERSONA.COD_TIPO_ENTIDAD%TYPE,
   /*
                                                             0=TODOS:PERSONAS+TASADORES
                                                             1=PERSONAS
                                                             8=TASADORES
                                                             */
   PO_CU_RETORNO OUT CU_REC_SET) AS
  BEGIN
  
    OPEN PO_CU_RETORNO FOR
      SELECT DISTINCT EXPP.ID_PERSONA,
                      EXPP.COD_TIPO_ENTIDAD,
                      PERS.TIPO_PERSONA AS COD_TIPO_PERSONA,
                      SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_TIPO_PERSONA,
                                                               PERS.TIPO_PERSONA) AS NOM_TIPO_PERSONA,
                      PERS.TIPO_DOC AS COD_TIPO_DOCUMENTO,
                      SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_TIPO_DOC_IDENT,
                                                               PERS.TIPO_DOC) AS NOM_TIPO_DOCUMENTO,
                      PERS.NRO_DOC AS NRO_DOCUMENTO,
                      --DECODE(PERS.TIPO_PERSONA,SCOB_PK_CONSTANTES.C_TIPO_PERS_JURIDICA,  PERS.RAZON_SOCIAL,  PERS.PRI_NOMBRE || ' ' || PERS.SEG_NOMBRE || ' ' || PERS.APE_PATERNO  || ' ' || PERS.APE_MATERNO  || ' ' || PERS.APE_CASADA) AS NOM_PERSONA,
                      DECODE(PERS.TIPO_PERSONA,
                             SCOB_PK_CONSTANTES.C_TIPO_PERS_JURIDICA,
                             PERS.RAZON_SOCIAL,
                             PERS.APE_PATERNO || ' ' || PERS.APE_MATERNO || ' ' ||
                             PERS.PRI_NOMBRE || ' ' || PERS.SEG_NOMBRE || ' ' ||
                             PERS.APE_CASADA) AS NOM_PERSONA,
                      EXPP.ID_EXPEDIENTE_EMBARGO
        FROM T_SCOB_EXPEDIENTE_PERSONA EXPP
       INNER JOIN T_SCOB_PERSONA PERS
          ON PERS.ID_PERSONA = EXPP.ID_PERSONA
       WHERE EXPP.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
         AND EXPP.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
         AND ((PI_I_COD_TIPO_ENTIDAD = 0 AND
             EXPP.COD_TIPO_ENTIDAD IN (1, 8)) OR
             (PI_I_COD_TIPO_ENTIDAD <> 0 AND
             EXPP.COD_TIPO_ENTIDAD = PI_I_COD_TIPO_ENTIDAD))
      
      UNION
      SELECT DISTINCT EXPP.ID_PERSONA,
                      EXPP.COD_TIPO_ENTIDAD,
                      PERS.TIPO_PERSONA AS COD_TIPO_PERSONA,
                      SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_TIPO_PERSONA,
                                                               PERS.TIPO_PERSONA) AS NOM_TIPO_PERSONA,
                      PERS.TIPO_DOC AS COD_TIPO_DOCUMENTO,
                      SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_TIPO_DOC_IDENT,
                                                               PERS.TIPO_DOC) AS NOM_TIPO_DOCUMENTO,
                      PERS.NRO_DOC AS NRO_DOCUMENTO,
                      --DECODE(PERS.TIPO_PERSONA,SCOB_PK_CONSTANTES.C_TIPO_PERS_JURIDICA,  PERS.RAZON_SOCIAL,  PERS.PRI_NOMBRE || ' ' || PERS.SEG_NOMBRE || ' ' || PERS.APE_PATERNO  || ' ' || PERS.APE_MATERNO  || ' ' || PERS.APE_CASADA) AS NOM_PERSONA,
                      DECODE(PERS.TIPO_PERSONA,
                             SCOB_PK_CONSTANTES.C_TIPO_PERS_JURIDICA,
                             PERS.RAZON_SOCIAL,
                             PERS.APE_PATERNO || ' ' || PERS.APE_MATERNO || ' ' ||
                             PERS.PRI_NOMBRE || ' ' || PERS.SEG_NOMBRE || ' ' ||
                             PERS.APE_CASADA) AS NOM_PERSONA,
                      EXPP.ID_EXPEDIENTE_EMBARGO
        FROM T_SCOB_EXPEDIENTE_PERSONA EXPP
       INNER JOIN T_SCOB_PERSONA PERS
          ON PERS.ID_PERSONA = EXPP.ID_PERSONA
       WHERE EXPP.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
         AND EXPP.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
         AND PI_I_COD_TIPO_ENTIDAD = 0
         AND (PI_N_ID_EXPEDIENTE_EMBARGO = 0 OR
             (PI_N_ID_EXPEDIENTE_EMBARGO <> 0 AND
             EXPP.ID_EXPEDIENTE_EMBARGO = PI_N_ID_EXPEDIENTE_EMBARGO));
  
  END;

  PROCEDURE SCOB_SP_S_LIQUIDAR_COSTA
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 21.06.2011
    -- Proposito    : lista la liquidacion de costas a la fecha.
    
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_N_ID_EXPEDIENTE IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
   PO_CU_RETORNO_CAB  OUT CU_REC_SET,
   PO_CU_RETORNO      OUT CU_REC_SET) AS
  BEGIN
  
    OPEN PO_CU_RETORNO_CAB FOR
      SELECT EXPE.NRO_EXPEDIENTE AS NRO_EXPEDIENTE,
             SCOB_FN_SANCIONADOS_EXPED(PI_N_ID_EXPEDIENTE) AS NOM_SANCIONADO,
             SYSDATE AS FECHA
        FROM T_SCOB_EXPEDIENTE EXPE
       WHERE EXPE.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE;
  
    OPEN PO_CU_RETORNO FOR
      SELECT EXCO.ID_COSTA AS ID_COSTA,
             COSTA.DESCRIPCION AS NOM_COSTA,
             EXCO.PORCENTAJE_UIT AS PORCENTAJE_UIT,
             SUM(EXCO.VALOR_SOLES) AS VALOR_SOLES,
             SUM(EXCO.CNT_COSTA) AS CNT_COSTA,
             SUM(EXCO.MONTO_COSTA) AS MONTO_COSTA
        FROM T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
       INNER JOIN T_SCOB_EXPEDIENTE_COSTA EXCO
          ON EXCO.ID_EXPEDIENTE_DOCUMENTO = EXDO.ID_EXPEDIENTE_DOCUMENTO
         AND EXCO.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
       INNER JOIN T_SCOB_TIPO_DOCUMENTO TDOC
          ON TDOC.ID_TIPO_DOCUMENTO = EXDO.ID_TIPO_DOCUMENTO
         AND TDOC.COD_SUBTIPO_DOCUMENTO =
             SCOB_PK_CONSTANTES.C_COD_SUBTIPODOC_RESOLUCION
       INNER JOIN T_SCOB_COSTA COSTA
          ON COSTA.ID_COSTA = EXCO.ID_COSTA
       WHERE EXDO.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
         AND EXCO.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
       GROUP BY EXCO.ID_COSTA, COSTA.DESCRIPCION, EXCO.PORCENTAJE_UIT
       ORDER BY EXCO.ID_COSTA;
  
  END;

  PROCEDURE SCOB_SP_S_LIQUID_ANTIDUMPING
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 26.07.2011
    -- Proposito    : Permite consultar la liquidacion antidumping
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_N_ID_MULTA     IN T_SCOB_MULTA.ID_MULTA%TYPE,
   PO_CU_RETORNO     OUT CU_REC_SET,
   PO_CU_RETORNO_DET OUT CU_REC_SET) AS
  BEGIN
  
    OPEN PO_CU_RETORNO FOR
      SELECT EXPE.ANIO || EXPE.NRO_EXPEDIENTE AS NUM_EXPEDIENTE,
             MULT.ANIO || MULT.CUM AS NUM_CUM,
             MUAN.TIPO_CAMBIO AS TIPO_CAMBIO,
             MUAN.POR_FACTOR_DIARIO AS TASA_FACTOR_DIARIO,
             TO_CHAR(MDET.FEC_NOTIFICACION_RESOLUCION + 1, 'DD/MM/YYYY') AS FEC_INICIO,
             TO_CHAR(MULT.FEC_EMISION_REC, 'DD/MM/YYYY') AS FEC_FINAL,
             
             DECODE(NVL(MUAN.NRO_LIQUIDACION_CODIGO, ' '),
                    ' ',
                    NULL,
                    MUAN.NRO_LIQUIDACION_CODIGO || '-' ||
                    MUAN.NRO_LIQUIDACION_ANIO || '/' ||
                    MUAN.NRO_LIQUIDACION_CORRELATIVO) AS NRO_LIQUIDACION_COBRANZA,
             
             MUAN.MONTO_ANTIDUMPING AS MONTO_CAPITAL,
             MUAN.NRO_DIAS_INTERES AS NRO_DIAS_TRANSCURRIDOS,
             MUAN.MONTO_INTERES AS MONTO_INTERES,
             MUAN.MONTO_ANTIDUMPING + MUAN.MONTO_INTERES AS MONTO_TOTAL_DEUDA
        FROM T_SCOB_MULTA MULT
        LEFT JOIN T_SCOB_MULTA_DETAL MDET
          ON MDET.ID_MULTA = MULT.ID_MULTA
         AND MDET.FLG_ACTUAL = '1'
        LEFT JOIN T_SCOB_MULTA_ANTIDUMPING MUAN
          ON MUAN.ID_MULTA = MULT.ID_MULTA
        LEFT JOIN T_SCOB_EXPEDIENTE_MULTA EXMU
          ON EXMU.ID_MULTA = MULT.ID_MULTA
        LEFT JOIN T_SCOB_EXPEDIENTE EXPE
          ON EXPE.ID_EXPEDIENTE = EXMU.ID_EXPEDIENTE
       WHERE MULT.ID_MULTA = PI_N_ID_MULTA;
  
    OPEN PO_CU_RETORNO_DET FOR
      SELECT MADE.ANIO AS ANNIO,
             MADE.NRO_DIAS AS NRO_DIAS,
             MADE.MONTO_INTERES AS MONTO_ME,
             MADE.MONTO_INTERES * MUAN.TIPO_CAMBIO AS MONTO_MN
        FROM T_SCOB_MULTA_ANTIDUMPING_DET MADE
       INNER JOIN T_SCOB_MULTA_ANTIDUMPING MUAN
          ON MUAN.ID_MULTA_ANTIDUMPING = MADE.ID_MULTA_ANTIDUMPING
       WHERE MUAN.ID_MULTA = PI_N_ID_MULTA
         AND MADE.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
         AND MADE.NRO_DIAS <> 0;
  
  END;

  PROCEDURE SCOB_SP_S_MULTA_BY_ANTIDUMPING
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 22.07.2011
    -- Proposito    : consulta los los datos de la multa por antidumping.
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_N_ID_MULTA IN T_SCOB_MULTA_ANTIDUMPING.ID_MULTA%TYPE,
   PO_CU_RETORNO OUT CU_REC_SET) AS
  BEGIN
    OPEN PO_CU_RETORNO FOR
      SELECT ID_MULTA_ANTIDUMPING         AS ID_MULTA_ANTIDUMPING,
             NRO_OFICIO_SUNAT_CODIGO      AS NRO_OFICIO_SUNAT_CODIGO,
             NRO_OFICIO_SUNAT_ANIO        AS NRO_OFICIO_SUNAT_ANIO,
             NRO_OFICIO_SUNAT_PREFIJO     AS NRO_OFICIO_SUNAT_PREFIJO,
             NRO_OFICIO_SUNAT_CORRELATIVO AS NRO_OFICIO_SUNAT_CORRELATIVO,
             NRO_LIQUIDACION_CODIGO       AS NRO_LIQUIDACION_CODIGO,
             NRO_LIQUIDACION_ANIO         AS NRO_LIQUIDACION_ANIO,
             NRO_LIQUIDACION_CORRELATIVO  AS NRO_LIQUIDACION_CORRELATIVO,
             NRO_DUA_CODIGO               AS NRO_DUA_CODIGO,
             NRO_DUA_ANIO                 AS NRO_DUA_ANIO,
             NRO_DUA_CORRELATIVO          AS NRO_DUA_CORRELATIVO,
             TIPO_CAMBIO                  AS TIPO_CAMBIO,
             MONTO_ANTIDUMPING            AS MONTO_ANTIDUMPING,
             ID_INTENDENCIA               AS ID_INTENDENCIA,
             ID_PARTIDA                   AS ID_PARTIDA
        FROM T_SCOB_MULTA_ANTIDUMPING MUAN
       WHERE MUAN.ID_MULTA = PI_N_ID_MULTA
         AND MUAN.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO;
  
  END;

  PROCEDURE SCOB_SP_S_EXPEDIENTE_ANOTACION
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 05.09.2011
    -- Proposito    : consultas las anotaciones de un expediente
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_N_ID_EXPEDIENTE           IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
   PI_N_ID_EXPEDIENTE_ANOTACION IN T_SCOB_EXPEDIENTE_ANOTACION.ID_EXPEDIENTE_ANOTACION%TYPE,
   PO_CU_RETORNO                OUT CU_REC_SET) AS
  BEGIN
    OPEN PO_CU_RETORNO FOR
      SELECT NOTA.ID_EXPEDIENTE_ANOTACION AS ID_EXPEDIENTE_ANOTACION,
             NOTA.DES_ANOTACION AS DES_ANOTACION,
             NOTA.FEC_REGISTRO AS FEC_REGISTRO,
             NOTA.ID_USUARIO_REGISTRO AS ID_USUARIO_REGISTRO,
             USUA.USUARIO AS USUARIO,
             USUA.PRI_NOMBRE || ' ' || USUA.SEG_NOMBRE || ' ' ||
             USUA.APE_PATERNO || ' ' || USUA.APE_MATERNO AS NOM_USUARIO
      
        FROM T_SCOB_EXPEDIENTE_ANOTACION NOTA
       INNER JOIN T_SCOB_USUARIO USUA
          ON USUA.ID_USUARIO = NOTA.ID_USUARIO_REGISTRO
       WHERE NOTA.ESTADO = '1'
         AND NOTA.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
         AND (NVL(PI_N_ID_EXPEDIENTE_ANOTACION, 0) = 0 OR
             (NVL(PI_N_ID_EXPEDIENTE_ANOTACION, 0) <> 0 AND
             NOTA.ID_EXPEDIENTE_ANOTACION = PI_N_ID_EXPEDIENTE_ANOTACION));
  
  END;

  PROCEDURE SCOB_SP_I_EXPEDIENTE_ANOTACION
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 05.09.2011
    -- Proposito    : inserta las anotaciones de un expediente
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_N_ID_EXPEDIENTE       IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
   PI_V_DES_ANOTACION       IN T_SCOB_EXPEDIENTE_ANOTACION.DES_ANOTACION%TYPE,
   PI_N_ID_USUARIO_REGISTRO IN T_SCOB_EXPEDIENTE_ANOTACION.ID_USUARIO_REGISTRO%TYPE,
   PI_V_AUDUSUCREACION      IN T_SCOB_EXPEDIENTE_ANOTACION.AUDUSUCREACION%TYPE,
   PO_N_RETORNO             OUT NUMBER,
   PO_N_COD_ERROR           OUT NUMBER,
   PO_V_MSJ_ERROR           OUT VARCHAR2) IS
  BEGIN
    PO_V_MSJ_ERROR := '';
    PO_N_COD_ERROR := -1;
  
    INSERT INTO T_SCOB_EXPEDIENTE_ANOTACION
      (ID_EXPEDIENTE_ANOTACION,
       ID_EXPEDIENTE,
       FEC_REGISTRO,
       ID_USUARIO_REGISTRO,
       DES_ANOTACION,
       ESTADO,
       AUDFECCREACION,
       AUDUSUCREACION)
    VALUES
      (SCOB_SQ_EXPEDIENTE_ANOTACION.NEXTVAL,
       PI_N_ID_EXPEDIENTE,
       SYSDATE,
       PI_N_ID_USUARIO_REGISTRO,
       PI_V_DES_ANOTACION,
       '1',
       SYSDATE,
       PI_V_AUDUSUCREACION)
    RETURNING ID_EXPEDIENTE_ANOTACION INTO PO_N_RETORNO;
  
    PO_N_COD_ERROR := 0;
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

  PROCEDURE SCOB_SP_U_EXPEDIENTE_ANOTACION
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 05.09.2011
    -- Proposito    : actualiza las anotaciones de un expediente
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_N_ID_EXPEDIENTE_ANOTACION IN T_SCOB_EXPEDIENTE_ANOTACION.ID_EXPEDIENTE_ANOTACION%TYPE,
   PI_V_DES_ANOTACION           IN T_SCOB_EXPEDIENTE_ANOTACION.DES_ANOTACION%TYPE,
   PI_V_AUDUSUMODIFICACION      IN T_SCOB_EXPEDIENTE_ANOTACION.AUDUSUMODIFICACION%TYPE,
   PO_N_RETORNO                 OUT NUMBER,
   PO_N_COD_ERROR               OUT NUMBER,
   PO_V_MSJ_ERROR               OUT VARCHAR2) IS
  BEGIN
    PO_V_MSJ_ERROR := '';
    PO_N_COD_ERROR := -1;
  
    UPDATE T_SCOB_EXPEDIENTE_ANOTACION
       SET DES_ANOTACION      = PI_V_DES_ANOTACION,
           AUDFECMODIFICACION = SYSDATE,
           AUDUSUMODIFICACION = PI_V_AUDUSUMODIFICACION
     WHERE ID_EXPEDIENTE_ANOTACION = PI_N_ID_EXPEDIENTE_ANOTACION;
  
    PO_N_COD_ERROR := 0;
    PO_N_RETORNO   := PI_N_ID_EXPEDIENTE_ANOTACION;
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

  PROCEDURE SCOB_SP_D_EXPEDIENTE_ANOTACION
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 05.09.2011
    -- Proposito    : actualiza al estado eliminado las anotaciones de los expedientes
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_V_ID_EXPEDIENTE_ANOTACION IN VARCHAR2,
   PI_V_AUDUSUMODIFICACION      IN T_SCOB_EXPEDIENTE_ANOTACION.AUDUSUMODIFICACION%TYPE,
   PO_N_RETORNO                 OUT NUMBER,
   PO_N_COD_ERROR               OUT NUMBER,
   PO_V_MSJ_ERROR               OUT VARCHAR2) IS
  BEGIN
    PO_V_MSJ_ERROR := '';
    PO_N_RETORNO   := 0;
    PO_N_COD_ERROR := -1;
  
    UPDATE T_SCOB_EXPEDIENTE_ANOTACION
       SET AUDUSUMODIFICACION = PI_V_AUDUSUMODIFICACION,
           AUDFECMODIFICACION = SYSDATE,
           ESTADO             = SCOB_PK_CONSTANTES.C_ESTADO_INACTIVO
     WHERE INSTR(PI_V_ID_EXPEDIENTE_ANOTACION,
                 '|' || TO_CHAR(ID_EXPEDIENTE_ANOTACION) || '|') > 0;
  
    PO_N_COD_ERROR := 0;
    PO_N_RETORNO   := 0;
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

  PROCEDURE SCOB_SP_S_DIREC_BY_SANC
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 01.03.2011
    -- Proposito    : consulta los domicilios del sancionado posibles a asignar a la multa.
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_N_ID_EXPEDIENTE       IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
   PI_N_ID_MULTA_SANCIONADO IN T_SCOB_MULTA_SANCIONADO.ID_MULTA_SANCIONADO%TYPE,
   PO_CU_RETORNO            OUT CU_REC_SET) AS
  BEGIN
    OPEN PO_CU_RETORNO FOR
      SELECT DISTINCT MSAN.ID_PERSONA AS ID_PERSONA,
                      PDOM.ID_PERSONA_DOMICILIO AS COD_DIRECCION_SANCIONADO,
                      DECODE(PERS.TIPO_PERSONA,
                             SCOB_PK_CONSTANTES.C_TIPO_PERS_JURIDICA,
                             PERS.RAZON_SOCIAL,
                             PERS.APE_PATERNO || ' ' || PERS.APE_MATERNO || ' ' ||
                             PERS.PRI_NOMBRE || ' ' || PERS.SEG_NOMBRE || ' ' ||
                             PERS.APE_CASADA) AS NOM_SANCIONADO,
                      PDOM.TIPO_VIA AS ID_TIPO_VIA,
                      TVIA.TXT_DESCRIPCION AS DES_TIPO_VIA,
                      PDOM.NOM_VIA AS NOM_VIA,
                      PDOM.NRO_VIA AS NRO_VIA,
                      PDOM.NRO_INTERIOR AS NRO_INTERIOR,
                      PDOM.TIPO_ZONA AS ID_TIPO_ZONA,
                      TZONA.TXT_DESCRIPCION AS DES_TIPO_ZONA,
                      PDOM.NOM_ZONA AS NOM_ZONA,
                      PDOM.ID_UBIGEO AS COD_UBIGEO,
                      UBIG.TXT_DPTO AS NOM_DPTO,
                      UBIG.TXT_PROV AS NOM_PROV,
                      UBIG.TXT_DIST AS NOM_DSTO,
                      CASE
                        WHEN (EXP_PERS.ESTADO IS NULL) OR
                             EXP_PERS.ESTADO = '0' THEN
                         '0'
                        ELSE
                         '1'
                      END AS IND_DIRECCION,
                      PDOM.TIPO_DOMICILIO AS TIPO_DOMICILIO,
                      TTDOM.DESCRIPCION AS NOM_TIPO_DOMICILIO
      
        FROM T_SCOB_MULTA_SANCIONADO MSAN
      
       INNER JOIN T_SCOB_MULTA_DETAL MDET
          ON MDET.ID_MULTA_DETAL = MSAN.ID_MULTA_DETAL
         AND MDET.FLG_ACTUAL = '1'
         AND MDET.ESTADO = '1'
      
       INNER JOIN T_SCOB_EXPEDIENTE_MULTA EXMU
          ON EXMU.ID_MULTA = MDET.ID_MULTA
         AND EXMU.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
         AND EXMU.ESTADO = '1'
      
       INNER JOIN T_SCOB_PERSONA PERS
          ON PERS.ID_PERSONA = MSAN.ID_PERSONA
      
        LEFT JOIN T_SCOB_PERSONA_DOMICILIO PDOM
          ON PDOM.ID_PERSONA = PERS.ID_PERSONA
         AND PDOM.ESTADO = '1'
      
        LEFT JOIN T_SCOB_TIPO_DOMICILIO TTDOM
          ON TTDOM.ID_TIPO_DOMICILIO = PDOM.TIPO_DOMICILIO
        LEFT JOIN T_SCOB_UBIGEO UBIG
          ON UBIG.ID_UBIGEO = PDOM.ID_UBIGEO
        LEFT JOIN T_SCOB_TABLA_DET TVIA
          ON TVIA.ID_TABLA = SCOB_PK_CONSTANTES.C_TBL_DIRECCION_TIPO_VIA
         AND TVIA.COD_INTERNO = PDOM.TIPO_VIA
        LEFT JOIN T_SCOB_TABLA_DET TZONA
          ON TZONA.ID_TABLA = SCOB_PK_CONSTANTES.C_TBL_DIRECCION_TIPO_ZONA
         AND TZONA.COD_INTERNO = PDOM.TIPO_ZONA
      
        LEFT JOIN T_SCOB_EXPEDIENTE_PERSONA EXP_PERS
          ON EXMU.ID_EXPEDIENTE = EXP_PERS.ID_EXPEDIENTE
         AND EXP_PERS.ID_PERSONA = PERS.ID_PERSONA
         AND EXP_PERS.ID_PERSONA_DOMICILIO = PDOM.ID_PERSONA_DOMICILIO
         AND EXP_PERS.ESTADO = '1'
       WHERE MSAN.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
         AND MSAN.ID_PERSONA = PI_N_ID_MULTA_SANCIONADO
         AND PDOM.ID_PERSONA_DOMICILIO IS NOT NULL
       ORDER BY PDOM.TIPO_DOMICILIO;
  END;

  --
  PROCEDURE SCOB_SP_I_SOLIC_DESACUM
  /*
    -----------------------------------------------------------
    -- Autor        : @dcelis
    -- Creado       : 04.05.2017
    -- Proposito    : Inserta las solicitudes de Acumulaci?n/Desacumulaci?n
    */
  (PI_V_ID_MULTA       IN VARCHAR2,
   PI_V_TIPO_DESTINO   IN VARCHAR2,
   PI_V_ID_EXP_DESTINO IN VARCHAR2,
   PI_N_ID_USUARIO     IN VARCHAR2,
   PO_N_RETORNO        OUT NUMBER,
   PO_N_COD_ERROR      OUT NUMBER,
   PO_V_MSJ_ERROR      OUT VARCHAR2) AS
    --
    --TYPE TB1 IS TABLE OF INTEGER INDEX BY BINARY_INTEGER; --VARCHAR2(50);
    --V1     TB1;
    --V2     TB1;
    --V3     TB1;
    --V_CONT NUMBER;
    --
  BEGIN
    --
    PO_V_MSJ_ERROR := '';
    PO_N_RETORNO   := 0;
    PO_N_COD_ERROR := -1;
    --
    /*
    -- ARRAY: PI_V_ID_MULTA
    V_CONT:=1;
    FOR item in (
      SELECT * FROM TABLE(SCOB_PK_ACUMULACION.SCOB_FN_SPLIT(REPLACE(SUBSTR(PI_V_ID_MULTA,2,LENGTH(PI_V_ID_MULTA)-2),'|',','),','))
    )
    LOOP
      V1(V_CONT) := item.COLUMN_VALUE;
      V_CONT:=V_CONT+1;
    END LOOP;
    -- ARRAY: PI_V_TIPO_DESTINO
    V_CONT:=1;
    FOR item in (
      SELECT * FROM TABLE(SCOB_PK_ACUMULACION.SCOB_FN_SPLIT(REPLACE(SUBSTR(PI_V_TIPO_DESTINO,2,LENGTH(PI_V_TIPO_DESTINO)-2),'|',','),','))
    )
    LOOP
      V2(V_CONT) := item.COLUMN_VALUE;
      V_CONT:=V_CONT+1;
    END LOOP;
    -- ARRAY: V_ID_EXP_DEST
    V_CONT:=1;
    FOR item in (
      SELECT * FROM TABLE(SCOB_PK_ACUMULACION.SCOB_FN_SPLIT(REPLACE(SUBSTR(PI_V_ID_EXP_DESTINO,2,LENGTH(PI_V_ID_EXP_DESTINO)-2),'|',','),','))
    )
    LOOP
      V3(V_CONT) := item.COLUMN_VALUE;
      V_CONT:=V_CONT+1;
    END LOOP;
    -- RECORRIENDO LOS ARRAY PARA INSERTAR
    FOR i IN V1.FIRST..V1.LAST
    LOOP
      DBMS_OUTPUT.PUT_LINE('ID_MULTA: '||V1(i));
      DBMS_OUTPUT.PUT_LINE('V_TIPO_DEST: '||V2(i));
      DBMS_OUTPUT.PUT_LINE('V_ID_EXP_DEST: '||V3(i));
      INSERT
      INTO T_SCOB_SOLIC_DESACUM
        (
          ID_SOLIC,
          ID_MULTA,
          ID_TIPO_DESTINO,
          ID_EXP_DESTINO,
          ID_USUARIO_SOLIC,
          ID_EXP_ORIGEN,
          NU_TIPO_SOLIC,
          NU_ID_EXP_SOLIC
        )
        VALUES
        (
          SCOB_SQ_SOLIC_DESACUM.NEXTVAL,
          V1(i),
          V2(i),
          V3(i),
          PI_N_ID_USUARIO,
          (
            SELECT ID_EXPEDIENTE FROM T_SCOB_EXPEDIENTE_MULTA
            WHERE ID_MULTA=V1(i) AND ESTADO=1 \*AND FLG_INACTIVO IS NULL*\
          ),
          1,
          (
            SELECT ID_EXPEDIENTE FROM T_SCOB_EXPEDIENTE_MULTA
            WHERE ID_MULTA=V1(i) AND ESTADO=1 \*AND FLG_INACTIVO IS NULL*\
          )
        );
    END LOOP;*/
  
    INSERT INTO T_SCOB_SOLIC_DESACUM
      (ID_SOLIC,
       ID_MULTA,
       ID_TIPO_DESTINO,
       ID_EXP_DESTINO,
       ID_USUARIO_SOLIC,
       ID_EXP_ORIGEN,
       NU_TIPO_SOLIC,
       NU_ID_EXP_SOLIC)
    
      SELECT SCOB_SQ_SOLIC_DESACUM.NEXTVAL AS NU_ID_SOLIC,
             P.C_VC_ID_MULTA,
             P.C_VC_TIPO_DESTINO,
             P.C_VC_ID_EXP_DEST,
             P.NU_ID_USUARIO,
             X.ID_EXPEDIENTE,
             P.NU_TIPO_SOLIC,
             X.ID_EXPEDIENTE
        FROM (SELECT REGEXP_SUBSTR(PI_V_ID_MULTA, '[^|]+', 1, LEVEL) AS C_VC_ID_MULTA,
                     REGEXP_SUBSTR(PI_V_TIPO_DESTINO, '[^|]+', 1, LEVEL) AS C_VC_TIPO_DESTINO,
                     REGEXP_SUBSTR(PI_V_ID_EXP_DESTINO, '[^|]+', 1, LEVEL) AS C_VC_ID_EXP_DEST,
                     PI_N_ID_USUARIO AS NU_ID_USUARIO,
                     1 AS NU_TIPO_SOLIC
                FROM DUAL
              CONNECT BY REGEXP_SUBSTR(PI_V_ID_MULTA, '[^|]+', 1, LEVEL) IS NOT NULL) P
       INNER JOIN T_SCOB_EXPEDIENTE_MULTA X
          ON X.ID_MULTA = P.C_VC_ID_MULTA;
    --
    PO_N_COD_ERROR := 0;
    PO_N_RETORNO   := 1;
    COMMIT;
    --
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
      --
  END SCOB_SP_I_SOLIC_DESACUM;
  --
  PROCEDURE SCOB_SP_I_SOLIC_ACUM
  /*
    -----------------------------------------------------------
    -- Autor        : @dcelis
    -- Creado       : 04.05.2017
    -- Proposito    : inserta las solicitudes de desacumulaci?n de multas
    -----------------------------------------------------------
    */
  (PI_V_ID_EXP_DESTINO IN VARCHAR2,
   PI_V_ID_EXP_ORIGEN  IN VARCHAR2,
   PI_N_ID_USUARIO     IN VARCHAR2,
   PO_N_RETORNO        OUT NUMBER,
   PO_N_COD_ERROR      OUT NUMBER,
   PO_V_MSJ_ERROR      OUT VARCHAR2) AS
    --
    --TYPE TB1 IS TABLE OF INTEGER INDEX BY BINARY_INTEGER; --  VARCHAR2(50);
    --V1     TB1;
    --V_CONT NUMBER;
    --
  BEGIN
    --
    PO_V_MSJ_ERROR := '';
    PO_N_RETORNO   := 0;
    PO_N_COD_ERROR := -1;
    -- ARRAY: PI_V_ID_EXP_ORIGEN
    /*V_CONT := 1;
    FOR ITEM IN (SELECT *
                   FROM TABLE(SCOB_PK_ACUMULACION.SCOB_FN_SPLIT(REPLACE(SUBSTR(PI_V_ID_EXP_ORIGEN, 2, LENGTH(PI_V_ID_EXP_ORIGEN) - 2), '|', ','),
                                                                ',')))
    LOOP
        V1(V_CONT) := ITEM.COLUMN_VALUE;
        V_CONT := V_CONT + 1;
        DBMS_OUTPUT.PUT_LINE('item.COLUMN_VALUE:=' || ITEM.COLUMN_VALUE);
        DBMS_OUTPUT.PUT_LINE('V_CONT:=' || V_CONT);
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('ULTIMO VALOR:=' || V_CONT);
    -- RECORRIENDO LOS ARRAY PARA INSERTAR
    
    DBMS_OUTPUT.PUT_LINE('V1.FIRST = ' ||  V1.FIRST );
    DBMS_OUTPUT.PUT_LINE('V1.LAST = ' ||  V1.LAST);
    FOR I IN V1.FIRST .. V1.LAST
    LOOP
        DBMS_OUTPUT.PUT_LINE('I = ' || I);
        
        DBMS_OUTPUT.PUT_LINE('PI_V_ID_EXP_ORIGEN: ' || V1(I));
        -- TODAS MULTAS DEL EXPEDIENTE
        FOR ITEM2 IN (SELECT * FROM T_SCOB_EXPEDIENTE_MULTA WHERE ID_EXPEDIENTE = V1(I))
        LOOP
            DBMS_OUTPUT.PUT_LINE('DATA: ' || ITEM2.ID_MULTA);
            INSERT INTO T_SCOB_SOLIC_DESACUM
                (ID_SOLIC, ID_MULTA, ID_TIPO_DESTINO, ID_EXP_DESTINO, ID_USUARIO_SOLIC, ID_EXP_ORIGEN, NU_TIPO_SOLIC, NU_ID_EXP_SOLIC)
            VALUES
                (SCOB_SQ_SOLIC_DESACUM.NEXTVAL, ITEM2.ID_MULTA, SCOB_PK_CONSTANTES.C_ID_TIPO_DESTINO_EXISTENTE,
                  -- 2:EXISTENTE
                 PI_V_ID_EXP_DESTINO, PI_N_ID_USUARIO, V1(I), 2, PI_V_ID_EXP_DESTINO);
        END LOOP;
        --
    END LOOP;*/
    --
  
    INSERT INTO T_SCOB_SOLIC_DESACUM
      (ID_SOLIC,
       ID_MULTA,
       ID_TIPO_DESTINO,
       ID_EXP_DESTINO,
       ID_USUARIO_SOLIC,
       ID_EXP_ORIGEN,
       NU_TIPO_SOLIC,
       NU_ID_EXP_SOLIC)
      SELECT SCOB_SQ_SOLIC_DESACUM.NEXTVAL,
             T.ID_MULTA,
             SCOB_PK_CONSTANTES.C_ID_TIPO_DESTINO_EXISTENTE,
             PI_V_ID_EXP_DESTINO,
             PI_N_ID_USUARIO,
             T.ID_EXPEDIENTE,
             2,
             PI_V_ID_EXP_DESTINO
        FROM T_SCOB_EXPEDIENTE_MULTA T
       WHERE INSTR(PI_V_ID_EXP_ORIGEN, '|' || T.ID_EXPEDIENTE || '|', 1) > 0;
  
    PO_N_COD_ERROR := 0;
    PO_N_RETORNO   := 1;
    COMMIT;
    --
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
      --
  END SCOB_SP_I_SOLIC_ACUM;
  --
  PROCEDURE SCOB_SP_S_SOLIC_DESACUM
  /*
    -----------------------------------------------------------
    -- Autor        : @dcelis
    -- Creado       : 04.05.2017
    -- Proposito    : lista de las solicitudes de desacumulaci?n por expediente
    -----------------------------------------------------------
    */
  (PI_V_ID_EXPEDIENTE IN NUMBER,
   PI_V_ACCION        OUT VARCHAR2,
   PO_CU_RETORNO      OUT CU_REC_SET) AS
    V_AUX     NUMBER;
    V_CANT_C1 NUMBER;
    V_CANT_C2 NUMBER;
    V_QUERY   CLOB;
    V_QUERY2  CLOB;
    A1        CU_REC_SET;
  BEGIN
    --
    V_QUERY := 'SELECT
    A.ID_SOLIC AS ID_SOLIC,
    (B.ANIO||B.CUM) AS V_CUM,
    --DECODE(A.ID_TIPO_DESTINO,1,''NUEVO'',2,''EXISTENTE'') AS V_TIPO_DESTINO,
    SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(' ||
               SCOB_PK_CONSTANTES.C_TBL_TIPO_DESTINO_DESACUM ||
               ',A.ID_TIPO_DESTINO) AS V_TIPO_DESTINO,
    (F.ANIO||F.NRO_EXPEDIENTE) AS V_NRO_EXPEDIENTE_ORIGEN,
    (C.ANIO||C.NRO_EXPEDIENTE) AS V_NRO_EXPEDIENTE_DESTINO,
    D.USUARIO AS V_USUARIO_SOLIC,
    TO_CHAR(A.DT_FSOLICITUD,''DD/MM/YYYY - hh12:mi:ss AM'') AS V_FSOLICITUD,
    E.USUARIO AS V_USUARIO_RPTA,
    TO_CHAR(A.DT_FRESPUESTA,''DD/MM/YYYY - hh12:mi:ss AM'') AS V_FRESPUESTA,
    --DECODE(A.NU_ESTADO_SOLIC,1,''SOLICITADO'',2,''APROBADO'',0,''RECHAZADO'',3,''PROCESADO'') AS V_ESTADO_SOLIC,
    SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(' ||
               SCOB_PK_CONSTANTES.C_TBL_ESTADO_SOLIC_DESACUM ||
               ',A.NU_ESTADO_SOLIC) AS V_ESTADO_SOLIC,
    A.ID_EXP_DESTINO AS V_ID_EXP_DESTINO,
    --DECODE(A.NU_TIPO_SOLIC,1,''DESACUMULACION'',2,''ACUMULACION'') AS V_TIPO_SOLIC
    SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(' ||
               SCOB_PK_CONSTANTES.C_TBL_TIPO_SOLIC_DESACUM ||
               ',A.NU_TIPO_SOLIC) AS V_TIPO_SOLIC
    FROM T_SCOB_SOLIC_DESACUM A
    INNER JOIN T_SCOB_MULTA B ON A.ID_MULTA =B.ID_MULTA
    LEFT JOIN T_SCOB_EXPEDIENTE C ON A.ID_EXP_DESTINO  =C.ID_EXPEDIENTE
    LEFT JOIN T_SCOB_USUARIO D ON A.ID_USUARIO_SOLIC=D.ID_USUARIO
    LEFT JOIN T_SCOB_USUARIO E ON A.ID_USUARIO_RPTA=E.ID_USUARIO
    LEFT JOIN T_SCOB_EXPEDIENTE F ON A.ID_EXP_ORIGEN=F.ID_EXPEDIENTE
    WHERE A.NU_ESTADO=' ||
               SCOB_PK_CONSTANTES.C_NU_ESTADO_SOLIC_ACTIVO || '
    AND A.NU_ID_EXP_SOLIC=' || PI_V_ID_EXPEDIENTE;
  
    V_QUERY := V_QUERY || ' ORDER BY 1 DESC';
    --
    DBMS_OUTPUT.PUT_LINE('V_QUERY: ' || V_QUERY);
    OPEN PO_CU_RETORNO FOR V_QUERY;
  
    -- MOSTRAR CONTROLES DE ACCION
    SELECT DECODE(COUNT(1), 0, 0, 1)
      INTO PI_V_ACCION
      FROM T_SCOB_SOLIC_DESACUM A
     WHERE A.NU_ESTADO_SOLIC = SCOB_PK_CONSTANTES.C_NU_ESTADO_APROBADO
       AND A.NU_ID_EXP_SOLIC = PI_V_ID_EXPEDIENTE;
    --
  END SCOB_SP_S_SOLIC_DESACUM;
  --
  PROCEDURE SCOB_SP_S_MANT_SOLIC_DESACUM
  /*
    -----------------------------------------------------------
    -- Autor        : @dcelis
    -- Creado       : 04.05.2017
    -- Proposito    : lista de las solicitudes de desacumulaci?n para mantenimiento
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PO_CU_RETORNO OUT CU_REC_SET) AS
    --
    PI_V_CUM          VARCHAR2(150);
    PI_V_EXP_ORIGEN   VARCHAR2(150);
    PI_V_EXP_DESTINO  VARCHAR2(150);
    PI_V_NRO_FILE     VARCHAR2(150);
    PI_N_TIPO_DESTINO NUMBER;
    PI_N_ESTADO_SOLIC NUMBER;
    PI_V_FECHA_INICIO VARCHAR2(150);
    PI_V_FECHA_FIN    VARCHAR2(150);
    --
  BEGIN
    --
    PI_V_CUM          := NULL;
    PI_V_EXP_ORIGEN   := NULL;
    PI_V_EXP_DESTINO  := NULL;
    PI_V_NRO_FILE     := NULL;
    PI_N_TIPO_DESTINO := NULL;
    PI_N_ESTADO_SOLIC := 1;
    PI_V_FECHA_INICIO := NULL;
    PI_V_FECHA_FIN    := NULL;
    --
    SCOB_PK_EXPEDIENTE.SCOB_SP_SOLIC_DESACUM(PI_V_CUM,
                                             PI_V_EXP_ORIGEN,
                                             PI_V_EXP_DESTINO,
                                             PI_V_NRO_FILE,
                                             PI_N_TIPO_DESTINO,
                                             PI_N_ESTADO_SOLIC,
                                             PI_V_FECHA_INICIO,
                                             PI_V_FECHA_FIN,
                                             PO_CU_RETORNO);
    --
  END SCOB_SP_S_MANT_SOLIC_DESACUM;
  --
  PROCEDURE SCOB_SP_S_REP_SOLIC_DESACUM
  /*
    -----------------------------------------------------------
    -- Autor        : @dcelis
    -- Creado       : 04.05.2017
    -- Proposito    : lista de las solicitudes de desacumulaci?n para vista de reporte
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_V_CUM          VARCHAR2,
   PI_V_EXP_ORIGEN   VARCHAR2,
   PI_V_EXP_DESTINO  VARCHAR2,
   PI_V_NRO_FILE     VARCHAR2,
   PI_N_TIPO_DESTINO NUMBER,
   PI_N_ESTADO_SOLIC NUMBER,
   PI_V_FECHA_INICIO VARCHAR2,
   PI_V_FECHA_FIN    VARCHAR2,
   PO_CU_RETORNO     OUT CU_REC_SET) AS
    --
  BEGIN
    --
    SCOB_PK_EXPEDIENTE.SCOB_SP_SOLIC_DESACUM(PI_V_CUM,
                                             PI_V_EXP_ORIGEN,
                                             PI_V_EXP_DESTINO,
                                             PI_V_NRO_FILE,
                                             PI_N_TIPO_DESTINO,
                                             PI_N_ESTADO_SOLIC,
                                             PI_V_FECHA_INICIO,
                                             PI_V_FECHA_FIN,
                                             PO_CU_RETORNO);
    --
  END SCOB_SP_S_REP_SOLIC_DESACUM;
  --
  PROCEDURE SCOB_SP_SOLIC_DESACUM
  /*
    -----------------------------------------------------------
    -- Autor        : @dcelis
    -- Creado       : 08.05.2017
    -- Proposito    : proc. reautilizable de lista de solic. de desacumulacion
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_V_CUM          VARCHAR2,
   PI_V_EXP_ORIGEN   VARCHAR2,
   PI_V_EXP_DESTINO  VARCHAR2,
   PI_V_NRO_FILE     VARCHAR2,
   PI_N_TIPO_DESTINO NUMBER,
   PI_N_ESTADO_SOLIC NUMBER,
   PI_V_FECHA_INICIO VARCHAR2,
   PI_V_FECHA_FIN    VARCHAR2,
   PO_CU_RETORNO     OUT CU_REC_SET) AS
    V_QUERY CLOB;
  BEGIN
    --
    V_QUERY := 'SELECT
    A.ID_SOLIC AS ID_SOLIC,
    (B.ANIO||B.CUM) AS V_CUM,
    A.ID_EXP_ORIGEN AS V_ID_EXP_ORIGEN,
    (C.ANIO||C.NRO_EXPEDIENTE) AS V_NRO_EXPEDIENTE_ORIGEN,
    (B.ANIO_FILE_AEC||B.NRO_FILE_AEC) AS V_NRO_FILE,
    E.VALOR_UIT AS V_NRO_UIT,
    H.USUARIO AS V_USUARIO_SOLIC,
    TO_CHAR(A.DT_FSOLICITUD,''DD/MM/YYYY - hh12:mi:ss AM'') AS V_FSOLICITUD,
    --DECODE(A.ID_TIPO_DESTINO,1,''NUEVO'',2,''EXISTENTE'')   AS V_TIPO_DESTINO,
    SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(' ||
               SCOB_PK_CONSTANTES.C_TBL_TIPO_DESTINO_DESACUM ||
               ',A.ID_TIPO_DESTINO) AS V_TIPO_DESTINO,
    A.ID_EXP_DESTINO AS V_ID_EXP_DESTINO,
    (D.ANIO||D.NRO_EXPEDIENTE) AS V_NRO_EXPEDIENTE_DESTINO,
    DECODE(B.FLG_TIPO_MULTA,' ||
               SCOB_PK_CONSTANTES.C_FLG_TIPO_MULTA_INDIV ||
               ',DECODE(G.TIPO_PERSONA,' ||
               SCOB_PK_CONSTANTES.C_TIPO_PERS_JURIDICA ||
               ', G.RAZON_SOCIAL,G.APE_PATERNO
    || '' ''
    || G.APE_MATERNO
    || '' ''
    ||G.PRI_NOMBRE
    || '' ''
    || G.SEG_NOMBRE
    || '' ''
    ||G.APE_CASADA), SCOB_PK_EXPEDIENTE.SCOB_FN_SANCIONADOS_MULTA(E.ID_MULTA, 2)) AS DES_SANCIONADO,
    I.USUARIO AS V_USUARIO_RPTA,
    TO_CHAR(A.DT_FRESPUESTA,''DD/MM/YYYY - hh12:mi:ss AM'') AS V_FRESPUESTA,
    A.NU_ESTADO_SOLIC AS NU_ESTADO_SOLIC,
    --DECODE(A.NU_ESTADO_SOLIC,0,''RECHAZADO'', 1, ''SOLICITADO'', 2, ''APROBADO'', 3,''PROCESADO'') AS V_ESTADO_SOLIC,
    SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(' ||
               SCOB_PK_CONSTANTES.C_TBL_ESTADO_SOLIC_DESACUM ||
               ',A.NU_ESTADO_SOLIC) AS V_ESTADO_SOLIC,
    A.NU_ID_EXP_SOLIC,
    A.NU_TIPO_SOLIC,
    --DECODE(A.NU_TIPO_SOLIC,1,''DESACUMULACION'',2,''ACUMULACION'') AS V_TIPO_SOLIC
    SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(' ||
               SCOB_PK_CONSTANTES.C_TBL_TIPO_SOLIC_DESACUM ||
               ',A.NU_TIPO_SOLIC) AS V_TIPO_SOLIC
    FROM T_SCOB_SOLIC_DESACUM A
    INNER JOIN T_SCOB_MULTA B ON A.ID_MULTA =B.ID_MULTA
    INNER JOIN T_SCOB_EXPEDIENTE C ON A.ID_EXP_ORIGEN =C.ID_EXPEDIENTE
    LEFT JOIN T_SCOB_EXPEDIENTE D ON A.ID_EXP_DESTINO =D.ID_EXPEDIENTE
    INNER JOIN T_SCOB_MULTA_DETAL E ON E.ID_MULTA = B.ID_MULTA
      AND E.FLG_ACTUAL = ''1''
    INNER JOIN T_SCOB_MULTA_SANCIONADO F ON F.ID_MULTA_DETAL = E.ID_MULTA_DETAL
      AND NVL(F.COD_TIPO_PERSONA,''1'') = ''1''
      AND F.ESTADO = ' || SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO || '
      AND F.FLG_PRINCIPAL = ''1''
    INNER JOIN T_SCOB_PERSONA G ON G.ID_PERSONA = F.ID_PERSONA
      AND G.COD_SANCIONADO IS NOT NULL
    LEFT JOIN T_SCOB_USUARIO H ON A.ID_USUARIO_SOLIC=H.ID_USUARIO
    LEFT JOIN T_SCOB_USUARIO I ON A.ID_USUARIO_RPTA=I.ID_USUARIO
    WHERE A.NU_ESTADO = 1';
    IF PI_V_CUM IS NOT NULL THEN
      V_QUERY := V_QUERY || ' AND (B.ANIO||B.CUM)=' || PI_V_CUM;
    END IF;
    IF PI_V_EXP_ORIGEN IS NOT NULL THEN
      V_QUERY := V_QUERY || ' AND (C.ANIO||C.NRO_EXPEDIENTE)=' ||
                 PI_V_EXP_ORIGEN;
    END IF;
    IF PI_V_EXP_DESTINO IS NOT NULL THEN
      V_QUERY := V_QUERY || ' AND (D.ANIO||D.NRO_EXPEDIENTE)=' ||
                 PI_V_EXP_DESTINO;
    END IF;
    IF PI_V_NRO_FILE IS NOT NULL THEN
      V_QUERY := V_QUERY || ' AND (B.ANIO_FILE_AEC||B.NRO_FILE_AEC)=' ||
                 PI_V_NRO_FILE;
    END IF;
    IF PI_N_TIPO_DESTINO IS NOT NULL THEN
      V_QUERY := V_QUERY || ' AND A.ID_TIPO_DESTINO=' || PI_N_TIPO_DESTINO;
    END IF;
    IF PI_N_ESTADO_SOLIC IS NOT NULL THEN
      V_QUERY := V_QUERY || ' AND A.NU_ESTADO_SOLIC=' || PI_N_ESTADO_SOLIC;
    END IF;
    IF PI_V_FECHA_INICIO IS NOT NULL AND PI_V_FECHA_FIN IS NOT NULL THEN
      V_QUERY := V_QUERY ||
                 ' AND TO_DATE(TO_CHAR(TRUNC(A.DT_FSOLICITUD),''DD/MM/YYYY''),''DD/MM/YYYY'') BETWEEN TO_DATE(''' ||
                 PI_V_FECHA_INICIO || ''',''DD/MM/YYYY'') AND TO_DATE(''' ||
                 PI_V_FECHA_FIN || ''',''DD/MM/YYYY'')';
      --V_QUERY:=V_QUERY||' AND TO_CHAR(A.DT_FSOLICITUD,''DD/MM/YYYY'')>=TO_DATE('''||PI_V_FECHA_INICIO||''',''DD/MM/YYYY'')';
      --V_QUERY:=V_QUERY||' AND TO_CHAR(A.DT_FSOLICITUD,''DD/MM/YYYY'')<=TO_DATE('''||PI_V_FECHA_INICIO||''',''DD/MM/YYYY'')';
    END IF;
    --V_QUERY:=V_QUERY||' ORDER BY 1 ASC';
    --
    --INSERT INTO T_TEST(NAME,OTHER) VALUES(TO_CHAR(SYSDATE,'YYYY-MM-DD HH:MI'),'V_QUERY: '||V_QUERY);
    DBMS_OUTPUT.PUT_LINE('QUERY: ' || V_QUERY);
    OPEN PO_CU_RETORNO FOR V_QUERY;
    --
  END SCOB_SP_SOLIC_DESACUM;
  --
  PROCEDURE SCOB_SP_RPTA_SOLIC_DESACUM
  /*
    -----------------------------------------------------------
    -- Autor        : @dcelis
    -- Creado       : 08.05.2017
    -- Proposito    : Actualizar las solicitudes de Acumulaci?n/Desacumulaci?n
    */
  (PI_V_ID_SOLIC     IN VARCHAR2,
   PI_V_MOTIVO       IN VARCHAR2,
   PI_N_ID_USUARIO   IN VARCHAR2,
   PI_V_ESTADO_SOLIC IN NUMBER,
   PO_N_RETORNO      OUT NUMBER,
   PO_N_COD_ERROR    OUT NUMBER,
   PO_V_MSJ_ERROR    OUT VARCHAR2) AS
    TYPE TB1 IS TABLE OF INTEGER INDEX BY VARCHAR2(50);
    V1     TB1;
    V_CONT NUMBER;
  BEGIN
    --
    PO_V_MSJ_ERROR := '';
    PO_N_RETORNO   := 0;
    PO_N_COD_ERROR := -1;
    -- ARRAY: PI_V_ID_SOLIC
    V_CONT := 1;
    FOR ITEM IN (SELECT *
                   FROM TABLE(SCOB_PK_ACUMULACION.SCOB_FN_SPLIT(REPLACE(SUBSTR(PI_V_ID_SOLIC,
                                                                               2,
                                                                               LENGTH(PI_V_ID_SOLIC) - 2),
                                                                        '|',
                                                                        ','),
                                                                ','))) LOOP
      V1(V_CONT) := ITEM.COLUMN_VALUE;
      V_CONT := V_CONT + 1;
    END LOOP;
    -- RECORRIENDO LOS ARRAY PARA ACTUALIZAR ESTADOS DE SOLICITUDES
    FOR I IN V1.FIRST .. V1.LAST LOOP
      UPDATE T_SCOB_SOLIC_DESACUM
         SET NU_ESTADO_SOLIC = PI_V_ESTADO_SOLIC,
             DT_FRESPUESTA   = SYSDATE,
             ID_USUARIO_RPTA = PI_N_ID_USUARIO,
             VC_MOTIVO       = PI_V_MOTIVO
       WHERE ID_SOLIC = V1(I);
    END LOOP;
    --
    PO_N_COD_ERROR := 0;
    PO_N_RETORNO   := 1;
    COMMIT;
    --
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
      --
  END SCOB_SP_RPTA_SOLIC_DESACUM;
  --
  PROCEDURE SCOB_SP_PROCESAR_DESACUM
  /*
    -----------------------------------------------------------
    -- Autor        : @dcelis
    -- Creado       : 08.05.2017
    -- Proposito    : Actualizar las solicitudes de Acumulaci?n/Desacumulaci?n y generaci?n de documento*/
  (PI_N_ID_EXP_ORIGEN IN NUMBER,
   -- GENERAR DOCUMENTO
   PI_I_COD_TIPO_ASOCIACION IN T_SCOB_EXPED_COACTIVO_DOC.COD_TIPO_ASOCIACION%TYPE,
   PI_C_IND_TIPO_GENERACION T_SCOB_EXPED_COACTIVO_DOC.IND_TIPO_GENERACION%TYPE,
   PI_V_ID_EXPEDIENTE       IN VARCHAR2, -- CADENA DE EXPEDIENTES DE ORIGEN (CASO 2)
   PI_N_NRO_ITEMS           IN NUMBER,
   --
   PI_N_ID_MOTIVO        IN T_SCOB_EXPEDIENTE_ESTADO.ID_MOTIVO%TYPE,
   PI_V_ID_PLANTILLA     IN VARCHAR2, --CADENA DE PLANTILLAS (EL PRIMERO SIEMPRE DEBE SER LA RESOLUCION, SI ES EL CASO)
   PI_V_MOTIVO_PLANTILLA IN VARCHAR2, --CADENA DE MOTIVOS PLANTILLAS (EL PRIMERO SIEMPRE DEBE SER LA RESOLUCION, SI ES EL CASO)
   PI_N_NRO_ITEMSP       IN NUMBER, --SI SE ENVIAN DOS DOCUMENTO, SIEMPRE DEBE ESTAR LA REC PRIMERO.
   --
   PI_I_ESTADO_EXPEDIENTE IN T_SCOB_EXPEDIENTE_DOCUMENTO.ESTADO_EXPEDIENTE%TYPE,
   PI_N_ID_EXP_DOC_ORIGEN IN T_SCOB_EXPEDIENTE_DOCUMENTO.ID_EXPEDIENTE_DOCUMENTO_ORIGEN%TYPE,
   ---
   PI_V_TIPO_ENTIDAD    IN VARCHAR, --0=NINGUNO;1=PERSONA;2=BANCO;3=DIREC PERSONAS;4=SUNAT;5=PNP;6=SAT;7=CAJA METROPOLITANA
   PI_V_ID_TIPO_ENTIDAD IN VARCHAR, --entidades a quienes va dirigido
   PI_V_NRO_ITEMSTE     IN VARCHAR, --cadena con los numero de entidades a quienes ira dirigido
   --
   PI_N_ID_SERVICIO      IN NUMBER,
   PI_V_ID_TIPO_SERVICIO IN VARCHAR2,
   PI_C_FLG_UCI          IN CHAR,
   --
   PI_V_AUDUSUCREACION     IN T_SCOB_EXPEDIENTE_DOCUMENTO.AUDUSUCREACION%TYPE,
   PI_N_ID_USUARIO_INGRESO IN T_SCOB_USUARIO.ID_USUARIO%TYPE,
   PI_V_FEC_GENERACION_DOC IN VARCHAR,
   -- GENERAR DOCUMENTO
   PO_N_RETORNO   OUT NUMBER,
   PO_N_COD_ERROR OUT NUMBER,
   PO_V_MSJ_ERROR OUT VARCHAR2) AS
    --
    V_AUDUSUCREACION        T_SCOB_MULTA_DETAL.AUDUSUCREACION%TYPE;
    N_ID_AREA_COBRANZA      T_SCOB_USUARIO.ID_AREA_COBRANZA%TYPE;
    N_NRO_EXPEDIENTE        T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE;
    N_VALOR_UIT             T_SCOB_MULTA_DETAL.VALOR_UIT%TYPE;
    N_VALOR_POR_ASOCU       T_SCOB_MULTA_DETAL.POR_ASOCU%TYPE;
    N_VALOR_MONTO_POR_ASOCU T_SCOB_MULTA_DETAL.MONTO_ASOCU%TYPE;
    N_MONTO_UIT             T_SCOB_MULTA.MONTO_UIT%TYPE;
    N_SALDO_TOTAL_DEUDA     T_SCOB_MULTA.SALDO_TOTAL_DEUDA%TYPE;
    C_FLG_TIPO_MULTA        CHAR(1);
    V_ESTADO_EXPEDIENTE     T_SCOB_EXPEDIENTE.ESTADO_EXPEDIENTE%TYPE;
    V_ID_MOTIVO             T_SCOB_EXPEDIENTE.ID_MOTIVO%TYPE;
    N_ID_EXPEDIENTE         T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE;
    V_FEC_ESTADO_EXPEDIENTE T_SCOB_EXPEDIENTE.FEC_ESTADO_EXPEDIENTE%TYPE;
    --
  BEGIN
    --
    DBMS_OUTPUT.PUT_LINE('***SCOB_SP_PROCESAR_DESACUM***');
    PO_V_MSJ_ERROR := '';
    PO_N_RETORNO   := 0;
    PO_N_COD_ERROR := -1;
    -- OBTENER EL NOMBRE DE USUARIO
    SELECT USUARIO
      INTO V_AUDUSUCREACION
      FROM T_SCOB_USUARIO
     WHERE ID_USUARIO = PI_N_ID_USUARIO_INGRESO;
    --OBTENER EL AREA DE COBRANZA DEL USUARIO QUE INGRESA
    SELECT USUA.ID_AREA_COBRANZA
      INTO N_ID_AREA_COBRANZA
      FROM T_SCOB_USUARIO USUA
     WHERE USUA.ID_USUARIO = PI_N_ID_USUARIO_INGRESO;
    -- INI DCELIS@20170821
    /*   -- OBTENER EL NRO DE EXPEDIENTE EN BASE AL AREA DE COBRANZA
    SELECT NVL(MAX(EXPE.NRO_EXPEDIENTE), 0) + 1
      INTO N_NRO_EXPEDIENTE
    FROM T_SCOB_EXPEDIENTE EXPE
    WHERE EXPE.ESTADO = '1'
      AND EXPE.ANIO = TO_CHAR(SYSDATE, 'YYYY')
      AND NVL(EXPE.ID_AREA_COBRANZA, '0') = N_ID_AREA_COBRANZA;*/
    -- FIN DCELIS@20170821
  
    -- INICIO CASO 1: DESACUMULACION DE CUM'S AL EXPEDIENTE DE DESTINO
    FOR A1 IN (SELECT *
                 FROM T_SCOB_SOLIC_DESACUM
                WHERE NU_ESTADO_SOLIC =
                      SCOB_PK_CONSTANTES.C_NU_ESTADO_APROBADO
                  AND NU_ID_EXP_SOLIC = PI_N_ID_EXP_ORIGEN
                  AND NU_ESTADO =
                      SCOB_PK_CONSTANTES.C_NU_ESTADO_SOLIC_ACTIVO -- ACTIVO
                  AND NU_IMPRESO =
                      SCOB_PK_CONSTANTES.C_NU_ESTADO_SOLIC_NO_IMPRESO -- NO IMPRESO
                  AND NU_TIPO_SOLIC = 1) LOOP
      --
      IF A1.ID_TIPO_DESTINO = SCOB_PK_CONSTANTES.C_ID_TIPO_DESTINO_NUEVO THEN
        -- NUEVO EXPEDIENTE
        DBMS_OUTPUT.PUT_LINE('NUEVO');
        -- OBTENER INFO DEL EXPEDIENTE DE ORIGEN
        SELECT ESTADO_EXPEDIENTE, ID_MOTIVO, FEC_ESTADO_EXPEDIENTE
          INTO V_ESTADO_EXPEDIENTE, V_ID_MOTIVO, V_FEC_ESTADO_EXPEDIENTE
          FROM T_SCOB_EXPEDIENTE
         WHERE ID_EXPEDIENTE = PI_N_ID_EXP_ORIGEN;
      
        -- OBTENER DATOS DE LA MULTA COMO RESUMEN DEL EXPEDIENTE
        SELECT MULT.FLG_TIPO_MULTA,
               MDET.VALOR_UIT,
               MDET.POR_ASOCU,
               MDET.MONTO_ASOCU,
               MULT.MONTO_UIT,
               MULT.SALDO_TOTAL_DEUDA
          INTO C_FLG_TIPO_MULTA,
               N_VALOR_UIT,
               N_VALOR_POR_ASOCU,
               N_VALOR_MONTO_POR_ASOCU,
               N_MONTO_UIT,
               N_SALDO_TOTAL_DEUDA
          FROM T_SCOB_MULTA MULT
         INNER JOIN T_SCOB_MULTA_DETAL MDET
            ON MDET.ID_MULTA = MULT.ID_MULTA
           AND MDET.FLG_ACTUAL = '1'
         WHERE MULT.ID_MULTA = A1.ID_MULTA;
      
        -- INI DCELIS@20170821
        -- OBTENER EL NRO DE EXPEDIENTE EN BASE AL AREA DE COBRANZA
        SELECT NVL(MAX(EXPE.NRO_EXPEDIENTE), 0) + 1
          INTO N_NRO_EXPEDIENTE
          FROM T_SCOB_EXPEDIENTE EXPE
         WHERE EXPE.ESTADO = '1'
           AND EXPE.ANIO = TO_CHAR(SYSDATE, 'YYYY')
           AND NVL(EXPE.ID_AREA_COBRANZA, '0') = N_ID_AREA_COBRANZA;
        -- FIN DCELIS@20170821
      
        -- INSERTAR EL EXPEDIENTE NUEVO
        INSERT INTO T_SCOB_EXPEDIENTE
          (ID_EXPEDIENTE,
           NRO_EXPEDIENTE,
           ANIO,
           NRO_CUMS,
           VALOR_UIT,
           MONTO_UIT,
           SALDO_TOTAL_DEUDA,
           POR_ASOCU,
           MONTO_ASOCU,
           ESTADO,
           AUDFECCREACION,
           AUDUSUCREACION,
           FLG_TIPO_EXPEDIENTE,
           FEC_INGRESO,
           ID_USUARIO_INGRESO,
           COD_ESTADO_PAGO,
           ID_AREA_COBRANZA,
           FLG_EMBARGO,
           FLG_CANCELADO,
           ESTADO_EXPEDIENTE,
           ID_MOTIVO,
           FEC_ESTADO_EXPEDIENTE)
        VALUES
          (SCOB_SQ_EXPEDIENTE.NEXTVAL,
           LPAD(TO_CHAR(N_NRO_EXPEDIENTE), 10, '0000000000'),
           TO_CHAR(SYSDATE, 'YYYY'),
           --C_ANIO_EXPEDIENTE
           1,
           -- N_NRO_CUMS: 1 PORQUE SE CREA UN NUEVO EXPEDIENTE
           N_VALOR_UIT,
           N_MONTO_UIT,
           N_SALDO_TOTAL_DEUDA,
           N_VALOR_POR_ASOCU,
           N_VALOR_MONTO_POR_ASOCU,
           SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO,
           SYSDATE,
           V_AUDUSUCREACION,
           C_FLG_TIPO_MULTA,
           SYSDATE,
           PI_N_ID_USUARIO_INGRESO,
           SCOB_PK_CONSTANTES.C_EST_PAGO_PENDIENTE,
           N_ID_AREA_COBRANZA,
           '0',
           --FLG_EMBARGO
           '0',
           --FLG_CANCELADO
           V_ESTADO_EXPEDIENTE,
           -- ESTADO DEL EXPEDIENTE DE ORIGEN
           V_ID_MOTIVO,
           -- MOTIVO DEL EXPEDIENTE DE ORIGEN
           V_FEC_ESTADO_EXPEDIENTE
           -- FECHA DEL ESTADO DEL EXPEDIENTE
           )
        RETURNING ID_EXPEDIENTE INTO N_ID_EXPEDIENTE;
      
        -- ACTUALIZAR EXP_DESTINO EN T_SCOB_SOLIC_DESACUM
        UPDATE T_SCOB_SOLIC_DESACUM
           SET ID_EXP_DESTINO = N_ID_EXPEDIENTE
         WHERE ID_SOLIC = A1.ID_SOLIC;
        -- POSIBLEMENTE FALTE ACTUALIZAR ESTADOS
      
      ELSIF A1.ID_TIPO_DESTINO =
            SCOB_PK_CONSTANTES.C_ID_TIPO_DESTINO_EXISTENTE THEN
        -- EXPEDIENTE EXISTENTE
        DBMS_OUTPUT.PUT_LINE('EXISTENTE'); /*
                                UPDATE T_SCOB_EXPEDIENTE SET
                                WHERE ID_EXPEDIENTE=;*/
        --
      END IF;
    
      -- ACTUALIZAR EL ESTADO DE LA SOLICITUD DE DESACUMULACION
      UPDATE T_SCOB_SOLIC_DESACUM
         SET NU_ESTADO_SOLIC = SCOB_PK_CONSTANTES.C_NU_ESTADO_PROCESADO
       WHERE ID_SOLIC = A1.ID_SOLIC;
      --
    END LOOP;
    -- FIN CASO 1: DESACUMULACION DE CUM'S AL EXPEDIENTE DE DESTINO
    -- *** ***
  
    UPDATE T_SCOB_EXPEDIENTE T
       SET (T.VALOR_UIT,
            T.MONTO_UIT,
            T.MONTO_COSTAS,
            T.MONTO_INTERES,
            T.MONTO_INTERES_MORATORIO,
            T.MONTO_TOTAL_DEUDA,
            T.TOTAL_AMORTIZADO,
            T.TOTAL_AMORTIZADO_IC,
            T.TOTAL_AMORTIZADO_IM,
            T.TOTAL_AMORTIZADO_COSTAS,
            T.TOTAL_AMORTIZADO_DEUDA,
            T.SALDO,
            T.SALDO_IC,
            T.SALDO_IM,
            T.SALDO_COSTAS,
            T.SALDO_TOTAL_DEUDA) =
           (SELECT SUM(MDET.VALOR_UIT),
                   SUM(MULT.MONTO_UIT),
                   SUM(MULT.MONTO_COSTAS),
                   SUM(MULT.MONTO_INTERES),
                   SUM(MULT.MONTO_INTERES_MORATORIO),
                   SUM(MULT.MONTO_TOTAL_DEUDA),
                   SUM(MULT.TOTAL_AMORTIZADO),
                   SUM(MULT.TOTAL_AMORTIZADO_IC),
                   SUM(MULT.TOTAL_AMORTIZADO_IM),
                   SUM(MULT.TOTAL_AMORTIZADO_COSTAS),
                   SUM(MULT.TOTAL_AMORTIZACION_DEUDA),
                   SUM(MULT.SALDO),
                   SUM(MULT.SALDO_IC),
                   SUM(MULT.SALDO_IM),
                   SUM(MULT.SALDO_COSTAS),
                   SUM(MULT.SALDO_TOTAL_DEUDA)
              FROM T_SCOB_EXPEDIENTE_MULTA EXMU
             INNER JOIN T_SCOB_MULTA MULT
                ON (MULT.ID_MULTA = EXMU.ID_MULTA AND EXMU.ESTADO = '1')
             INNER JOIN T_SCOB_MULTA_DETAL MDET
                ON (MDET.ID_MULTA = MULT.ID_MULTA AND MDET.FLG_ACTUAL = '1' AND
                   MDET.ESTADO = '1')
             WHERE EXMU.ID_EXPEDIENTE = T.ID_EXPEDIENTE)
     WHERE T.ID_EXPEDIENTE IN
           (SELECT DISTINCT X.ID_EXP_DESTINO
              FROM T_SCOB_SOLIC_DESACUM X
             WHERE X.NU_ESTADO_SOLIC =
                   SCOB_PK_CONSTANTES.C_NU_ESTADO_APROBADO
               AND X.NU_ID_EXP_SOLIC = PI_N_ID_EXP_ORIGEN -- EXPEDIENTE DESDE DONDE SE PROCESA LAS SOLIC.
               AND X.NU_ESTADO = SCOB_PK_CONSTANTES.C_NU_ESTADO_SOLIC_ACTIVO -- ACTIVO
               AND X.NU_IMPRESO =
                   SCOB_PK_CONSTANTES.C_NU_ESTADO_SOLIC_NO_IMPRESO -- NO IMPRESO
               AND X.NU_TIPO_SOLIC = 2);
  
    -- INICIO CAS2 2: ACUMULACION DE CUM'S AL EXPEDIENTE SOLICITANTE
    FOR A1 IN (SELECT *
                 FROM T_SCOB_SOLIC_DESACUM
                WHERE NU_ESTADO_SOLIC =
                      SCOB_PK_CONSTANTES.C_NU_ESTADO_APROBADO
                  AND NU_ID_EXP_SOLIC = PI_N_ID_EXP_ORIGEN -- EXPEDIENTE DESDE DONDE SE PROCESA LAS SOLIC.
                  AND NU_ESTADO =
                      SCOB_PK_CONSTANTES.C_NU_ESTADO_SOLIC_ACTIVO -- ACTIVO
                  AND NU_IMPRESO =
                      SCOB_PK_CONSTANTES.C_NU_ESTADO_SOLIC_NO_IMPRESO -- NO IMPRESO
                  AND NU_TIPO_SOLIC = 2) LOOP
      -- ACTUALIZAR EL ESTADO DE LA SOLICITUD DE ACUMULACION
      UPDATE T_SCOB_SOLIC_DESACUM
         SET NU_ESTADO_SOLIC = SCOB_PK_CONSTANTES.C_NU_ESTADO_PROCESADO
       WHERE ID_SOLIC = A1.ID_SOLIC;
      --
    END LOOP;
    -- FIN CAS2 2: ACUMULACION DE CUM'S AL EXPEDIENTE SOLICITANTE
    --
    -- GENERAR DOCUMENTO PARA CUALQUIERA DE LOS DOS CASOS
    SCOB_PK_GENERAR_DOCUMENTO.SCOB_SP_I_SOLIC_DESACUM_DOC(PI_I_COD_TIPO_ASOCIACION,
                                                          PI_C_IND_TIPO_GENERACION,
                                                          '|' ||
                                                          PI_N_ID_EXP_ORIGEN || '|', --PI_V_ID_EXPEDIENTE,
                                                          PI_N_NRO_ITEMS,
                                                          --
                                                          PI_N_ID_MOTIVO,
                                                          PI_V_ID_PLANTILLA,
                                                          PI_V_MOTIVO_PLANTILLA,
                                                          PI_N_NRO_ITEMSP,
                                                          --
                                                          PI_I_ESTADO_EXPEDIENTE,
                                                          PI_N_ID_EXP_DOC_ORIGEN,
                                                          ---
                                                          PI_V_TIPO_ENTIDAD,
                                                          PI_V_ID_TIPO_ENTIDAD,
                                                          PI_V_NRO_ITEMSTE,
                                                          --
                                                          PI_N_ID_SERVICIO,
                                                          PI_V_ID_TIPO_SERVICIO,
                                                          PI_C_FLG_UCI,
                                                          --
                                                          PI_V_AUDUSUCREACION,
                                                          PI_N_ID_USUARIO_INGRESO,
                                                          PI_V_FEC_GENERACION_DOC,
                                                          PO_N_RETORNO,
                                                          PO_N_COD_ERROR,
                                                          PO_V_MSJ_ERROR);
    --
    DBMS_OUTPUT.PUT_LINE('***SCOB_SP_PROCESAR_DESACUM END***');
  
    PO_N_COD_ERROR := 0;
  
    COMMIT;
    --
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
      --
  END SCOB_SP_PROCESAR_DESACUM;
  --
  PROCEDURE SCOB_SP_U_ACTUALIZA_SOLIC
  /*
    -----------------------------------------------------------
    -- Autor        : @dcelis
    -- Creado       : 08.05.2017
    -- Proposito    : Actualizar los estados de impresion de las solicitudes de desacumulacion
    -----------------------------------------------------------
    */
  (PI_N_ID_EXP_ORIGEN IN VARCHAR2,
   PO_N_RETORNO       OUT NUMBER,
   PO_N_COD_ERROR     OUT NUMBER,
   PO_V_MSJ_ERROR     OUT VARCHAR2) AS
    --
    V_CANT_C1 NUMBER;
    V_CANT_C2 NUMBER;
    V_QUERY   CLOB;
    V_CONT    NUMBER;
    A1        CU_REC_SET;
    --
    V_ID_EXP_DESTINO VARCHAR2(100);
    V_ID_MULTA       VARCHAR2(100);
    V_ID_SOLIC       VARCHAR2(100);
    --
  BEGIN
    --
    PO_V_MSJ_ERROR := '';
    PO_N_RETORNO   := 0;
    PO_N_COD_ERROR := -1;
    --
    --INSERT INTO T_TEST(COLUMN1) VALUES('PASO-1');
    FOR A1 IN (SELECT *
                 FROM T_SCOB_SOLIC_DESACUM
                WHERE NU_ESTADO_SOLIC =
                      SCOB_PK_CONSTANTES.C_NU_ESTADO_PROCESADO
                  AND NU_ID_EXP_SOLIC = PI_N_ID_EXP_ORIGEN
                  AND NU_ESTADO =
                      SCOB_PK_CONSTANTES.C_NU_ESTADO_SOLIC_ACTIVO
                  AND NU_IMPRESO =
                      SCOB_PK_CONSTANTES.C_NU_ESTADO_SOLIC_NO_IMPRESO) LOOP
      --
      --INSERT INTO T_TEST(COLUMN1) VALUES('LOOP-1');
      UPDATE T_SCOB_EXPEDIENTE_MULTA
         SET ID_EXPEDIENTE = A1.ID_EXP_DESTINO
       WHERE ID_MULTA = A1.ID_MULTA;
      --INSERT INTO T_TEST(COLUMN1) VALUES('LOOP-2');
      --
      UPDATE T_SCOB_SOLIC_DESACUM
         SET NU_IMPRESO = SCOB_PK_CONSTANTES.C_NU_ESTADO_SOLIC_IMPRESO
       WHERE ID_SOLIC = A1.ID_SOLIC;
      --INSERT INTO T_TEST(COLUMN1) VALUES('LOOP-3');
    --
    END LOOP;
    --
    --INSERT INTO T_TEST(COLUMN1) VALUES('PASO-2');
    PO_N_COD_ERROR := 0;
    PO_N_RETORNO   := 1;
    COMMIT;
    --INSERT INTO T_TEST(COLUMN1) VALUES('PASO-COMMIT');
    --
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
      --INSERT INTO T_TEST(OTHER) VALUES('PASO-ERROR: '||PO_N_COD_ERROR||' - '||PO_V_MSJ_ERROR);
      ROLLBACK;
      --
  END SCOB_SP_U_ACTUALIZA_SOLIC;
  --
  PROCEDURE SCOB_SP_S_VISTA_DOC_EXP
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 28.10.2011
    -- Proposito    : Consulta los documentos del expediente
    -----------------------------------------------------------
    */
  (PI_N_ID_EXPEDIENTE IN VARCHAR2, PO_CU_RETORNO OUT CU_REC_SET) AS
  BEGIN
    OPEN PO_CU_RETORNO FOR
      SELECT SCOB_PK_CONSTANTES.C_COD_FASE_EXPEDIENTE AS COD_FASE,
             FASE.TXT_DESCRIPCION AS NOM_FASE,
             EXMU.ID_MULTA AS ID_MULTA,
             EXDO.ID_EXPEDIENTE AS ID_EXPEDIENTE,
             EXDO.ESTADO_EXPEDIENTE AS COD_ESTADO,
             EST_EXP.DESCRIPCION AS NOM_ESTADO,
             EXDO.ID_MOTIVO_PLANTILLA AS ID_MOTIVO_PLANTILLA,
             MOT_EXP.ID_MOTIVO AS COD_MOTIVO,
             MOT_EXP.DESCRIPCION AS NOM_MOTIVO,
             EXDO.COD_SUBTIPO_DOCUMENTO AS COD_TIPO_DOCUMENTO,
             SUBTIP_DOC.TXT_DESCRIPCION AS NOM_SUB_TIPO_DOCUMENTO,
             EXDO.NRO_RESOLUCION AS NRO_RESOLUCION,
             CASE EXDO.COD_SUBTIPO_DOCUMENTO
               WHEN 1 THEN
                EXDO.NRO_RESOLUCION
               ELSE
                EXDO.NRO_DOCUMENTO
             END AS NRO_DOCUMENTO,
             EXDO.NOMBRE AS NOM_ARCHIVO,
             EXDO.NRO_VERSION AS NRO_VERSION,
             EXDO.FEC_INGRESO AS FEC_GENERACION,
             EXDO.AUDUSUCREACION AS LOG_USUARIO_GENERACION,
             EXDO.TIPO_DOC_ASOC AS COD_TIPO_GENERACION_DOC,
             TIPO_GEN_DOC.TXT_DESCRIPCION AS NOM_TIPO_GENERACION_DOC,
             EXDO.COD_GENERADOR_DOCUMENTO AS COD_GENERADOR_DOCUMENTO,
             EXDO.ID_EXPEDIENTE_DOCUMENTO AS ID_DOCUMENTO,
             TIP_DOC.NOM_TIPO_DOCUMENTO AS NOM_TIPO_DOCUMENTO,
             EXDO.FEC_NOTIFICACION AS FEC_NOTIFICACION,
             --@0001:INI
             (CASE
               WHEN EXDO.VC_ESTADO_DOC_UCI = 'T' THEN
                'En Transito'
               WHEN EXDO.VC_ESTADO_DOC_UCI = 'E' THEN
                'Entregado'
               WHEN EXDO.VC_ESTADO_DOC_UCI = 'D' THEN
                'Devuelto'
               WHEN EXDO.VC_ESTADO_DOC_UCI = 'N' THEN
                'Notificado'
               WHEN EXDO.VC_ESTADO_DOC_UCI = 'Area' THEN
                'En UCI'
               ELSE
                NULL
             END) AS ESTADO_DOC_UCI,
             EXDO.VC_FEC_NOTF_UCI AS FEC_NOTF_UCI,
             EXDO.VC_HORA_NOTF_UCI AS HORA_NOTF_UCI,
             --@0001:FIN
             EXDO.FEC_NOTI_UCI_AEC AS FEC_NOTI_UCI_AEC --@0002
        FROM T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
       INNER JOIN T_SCOB_EST_EXP_COB EST_EXP
          ON EST_EXP.ID_EST_EXP_COB = EXDO.ESTADO_EXPEDIENTE
        LEFT JOIN T_SCOB_EST_EXP_COB_MOTIVO MOT_EXP
          ON MOT_EXP.ID_EST_EXP_COB = EST_EXP.ID_EST_EXP_COB
         AND MOT_EXP.ID_MOTIVO = EXDO.ID_MOTIVO
       INNER JOIN T_SCOB_TIPO_DOCUMENTO TIP_DOC
          ON TIP_DOC.ID_TIPO_DOCUMENTO = EXDO.ID_TIPO_DOCUMENTO
       INNER JOIN T_SCOB_TABLA_DET SUBTIP_DOC
          ON SUBTIP_DOC.ID_TABLA = 23
         AND SUBTIP_DOC.COD_INTERNO = EXDO.COD_SUBTIPO_DOCUMENTO
       INNER JOIN T_SCOB_TABLA_DET TIPO_GEN_DOC
          ON TIPO_GEN_DOC.ID_TABLA = 60
         AND TIPO_GEN_DOC.COD_INTERNO = EXDO.TIPO_DOC_ASOC
       INNER JOIN T_SCOB_TABLA_DET FASE
          ON FASE.ID_TABLA = 59
         AND FASE.COD_INTERNO = SCOB_PK_CONSTANTES.C_COD_FASE_EXPEDIENTE
       INNER JOIN T_SCOB_EXPEDIENTE_MULTA EXMU
          ON EXMU.ID_EXPEDIENTE = EXDO.ID_EXPEDIENTE
         AND EXMU.ESTADO = '1'
       WHERE EXDO.ESTADO = 1
         AND EXMU.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
       ORDER BY COD_FASE DESC, ID_DOCUMENTO DESC;
    --
  END SCOB_SP_S_VISTA_DOC_EXP;
  --
  FUNCTION SCOB_FN_SANCIONADOS_COD_INDEC(PI_N_ID_MULTA     IN T_SCOB_MULTA.ID_MULTA%TYPE,
                                         PI_N_NRO_PERSONAS IN INTEGER)
    RETURN VARCHAR2 IS
    V_RESPUESTA VARCHAR2(4000);
    V_CODIGO    VARCHAR2(200);
    V_ID        NUMBER;
    CUR_SANC    CU_REC_SET;
    I_CONT      INTEGER;
  BEGIN
  
    OPEN CUR_SANC FOR
      SELECT DISTINCT MSAN.ID_MULTA_SANCIONADO,
                      PERS.COD_SANCIONADO AS COD_INDECOPI
        FROM T_SCOB_MULTA_DETAL MDET
       INNER JOIN T_SCOB_MULTA_SANCIONADO MSAN
          ON MSAN.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL
         AND MSAN.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
         AND NVL(MSAN.COD_TIPO_PERSONA, '1') = '1'
       INNER JOIN T_SCOB_PERSONA PERS
          ON PERS.ID_PERSONA = MSAN.ID_PERSONA
       WHERE MDET.ID_MULTA = PI_N_ID_MULTA
         AND MDET.FLG_ACTUAL = '1'
       ORDER BY MSAN.ID_MULTA_SANCIONADO;
  
    I_CONT := 0;
  
    LOOP
      FETCH CUR_SANC
        INTO V_ID, V_CODIGO;
      EXIT WHEN CUR_SANC%NOTFOUND;
      I_CONT := I_CONT + 1;
      IF I_CONT > PI_N_NRO_PERSONAS AND PI_N_NRO_PERSONAS <> 0 THEN
        BEGIN
          V_RESPUESTA := V_RESPUESTA || '. . . y otros.';
          EXIT;
        END;
      END IF;
    
      V_RESPUESTA := V_RESPUESTA || '/ ' || V_CODIGO;
    END LOOP;
    CLOSE CUR_SANC;
    V_RESPUESTA := SUBSTR(V_RESPUESTA, 2, LENGTH(V_RESPUESTA));
    RETURN NVL(TRIM(V_RESPUESTA), ' ');
  END;

  FUNCTION SCOB_FN_DENUNCIADOS_MULTA(PI_N_ID_MULTA     IN T_SCOB_MULTA.ID_MULTA%TYPE,
                                     PI_N_NRO_PERSONAS IN INTEGER)
    RETURN VARCHAR2 IS
    V_RESPUESTA VARCHAR2(4000);
    V_NOM_SAN   VARCHAR2(200);
    V_ID        NUMBER;
    CUR_SANC    CU_REC_SET;
    I_CONT      INTEGER;
  BEGIN
  
    OPEN CUR_SANC FOR
      SELECT DISTINCT MSAN.ID_MULTA_SANCIONADO,
                      DECODE(PERS.TIPO_PERSONA,
                             SCOB_PK_CONSTANTES.C_TIPO_PERS_JURIDICA,
                             PERS.RAZON_SOCIAL,
                             PERS.APE_PATERNO || ' ' || PERS.APE_MATERNO || ' ' ||
                             PERS.PRI_NOMBRE || ' ' || PERS.SEG_NOMBRE || ' ' ||
                             PERS.APE_CASADA) AS NOM_SANCIONADO
        FROM T_SCOB_MULTA_DETAL MDET
       INNER JOIN T_SCOB_MULTA_SANCIONADO MSAN
          ON MSAN.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL
         AND MSAN.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
         AND NVL(MSAN.COD_TIPO_PERSONA, '1') = '2'
       INNER JOIN T_SCOB_PERSONA PERS
          ON PERS.ID_PERSONA = MSAN.ID_PERSONA
       WHERE MDET.ID_MULTA = PI_N_ID_MULTA
         AND MDET.FLG_ACTUAL = '1'
       ORDER BY MSAN.ID_MULTA_SANCIONADO;
  
    I_CONT := 0;
  
    LOOP
      FETCH CUR_SANC
        INTO V_ID, V_NOM_SAN;
      EXIT WHEN CUR_SANC%NOTFOUND;
      I_CONT := I_CONT + 1;
      IF I_CONT > PI_N_NRO_PERSONAS AND PI_N_NRO_PERSONAS <> 0 THEN
        BEGIN
          V_RESPUESTA := V_RESPUESTA || '. . . y otros.';
          EXIT;
        END;
      END IF;
    
      V_RESPUESTA := V_RESPUESTA || '/ ' || V_NOM_SAN;
    END LOOP;
    CLOSE CUR_SANC;
    V_RESPUESTA := SUBSTR(V_RESPUESTA, 2, LENGTH(V_RESPUESTA));
    RETURN NVL(TRIM(V_RESPUESTA), ' ');
  END;

  FUNCTION SCOB_FN_DENUNCIANTES_MULTA(PI_N_ID_MULTA     IN T_SCOB_MULTA.ID_MULTA%TYPE,
                                      PI_N_NRO_PERSONAS IN INTEGER)
    RETURN VARCHAR2 IS
    V_RESPUESTA VARCHAR2(4000);
    V_NOM_SAN   VARCHAR2(200);
    V_ID        NUMBER;
    CUR_SANC    CU_REC_SET;
    I_CONT      INTEGER;
  BEGIN
  
    OPEN CUR_SANC FOR
      SELECT DISTINCT MDEN.ID_MULTA_DENUNCIANTE,
                      DECODE(PERS.TIPO_PERSONA,
                             SCOB_PK_CONSTANTES.C_TIPO_PERS_JURIDICA,
                             PERS.RAZON_SOCIAL,
                             PERS.APE_PATERNO || ' ' || PERS.APE_MATERNO || ' ' ||
                             PERS.PRI_NOMBRE || ' ' || PERS.SEG_NOMBRE || ' ' ||
                             PERS.APE_CASADA) AS NOM_SANCIONADO
        FROM T_SCOB_MULTA_DETAL MDET
       INNER JOIN T_SCOB_MULTA_DENUNCIANTE MDEN
          ON MDEN.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL
         AND MDEN.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
       INNER JOIN T_SCOB_PERSONA PERS
          ON PERS.ID_PERSONA = MDEN.ID_PERSONA
       WHERE MDET.ID_MULTA = PI_N_ID_MULTA
         AND MDET.FLG_ACTUAL = '1'
       ORDER BY MDEN.ID_MULTA_DENUNCIANTE;
  
    I_CONT := 0;
  
    LOOP
      FETCH CUR_SANC
        INTO V_ID, V_NOM_SAN;
      EXIT WHEN CUR_SANC%NOTFOUND;
      I_CONT := I_CONT + 1;
      IF I_CONT > PI_N_NRO_PERSONAS AND PI_N_NRO_PERSONAS <> 0 THEN
        BEGIN
          V_RESPUESTA := V_RESPUESTA || '. . . y otros.';
          EXIT;
        END;
      END IF;
    
      V_RESPUESTA := V_RESPUESTA || '/ ' || V_NOM_SAN;
    END LOOP;
    CLOSE CUR_SANC;
    V_RESPUESTA := SUBSTR(V_RESPUESTA, 2, LENGTH(V_RESPUESTA));
    RETURN NVL(TRIM(V_RESPUESTA), ' ');
  END;

  FUNCTION SCOB_FN_SANCIONADOS_NRO_DOC(PI_N_ID_MULTA     IN T_SCOB_MULTA.ID_MULTA%TYPE,
                                       PI_N_NRO_PERSONAS IN INTEGER)
    RETURN VARCHAR2 IS
    V_RESPUESTA VARCHAR2(4000);
    V_NRO_DOC   VARCHAR2(100);
    V_ID        NUMBER;
    CUR_SANC    CU_REC_SET;
    I_CONT      INTEGER;
  BEGIN
  
    OPEN CUR_SANC FOR
      SELECT DISTINCT MSAN.ID_MULTA_SANCIONADO,
                      PERS.NRO_DOC AS NRO_DOC_IDENTIDAD
        FROM T_SCOB_MULTA_DETAL MDET
       INNER JOIN T_SCOB_MULTA_SANCIONADO MSAN
          ON MSAN.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL
         AND MSAN.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
         AND NVL(MSAN.COD_TIPO_PERSONA, '1') = '1'
       INNER JOIN T_SCOB_PERSONA PERS
          ON PERS.ID_PERSONA = MSAN.ID_PERSONA
       WHERE MDET.ID_MULTA = PI_N_ID_MULTA
         AND MDET.FLG_ACTUAL = '1'
       ORDER BY MSAN.ID_MULTA_SANCIONADO;
  
    I_CONT := 0;
  
    LOOP
      FETCH CUR_SANC
        INTO V_ID, V_NRO_DOC;
      EXIT WHEN CUR_SANC%NOTFOUND;
      I_CONT := I_CONT + 1;
      IF I_CONT > PI_N_NRO_PERSONAS AND PI_N_NRO_PERSONAS <> 0 THEN
        BEGIN
          V_RESPUESTA := V_RESPUESTA || '. . . y otros.';
          EXIT;
        END;
      END IF;
    
      V_RESPUESTA := V_RESPUESTA || '/ ' || V_NRO_DOC;
    END LOOP;
    CLOSE CUR_SANC;
    V_RESPUESTA := SUBSTR(V_RESPUESTA, 2, LENGTH(V_RESPUESTA));
    RETURN NVL(TRIM(V_RESPUESTA), ' ');
  END;

  FUNCTION SCOB_FN_SANCIONADOS_TIPO_DOC(PI_N_ID_MULTA     IN T_SCOB_MULTA.ID_MULTA%TYPE,
                                        PI_N_NRO_PERSONAS IN INTEGER)
    RETURN VARCHAR2 IS
    V_RESPUESTA VARCHAR2(4000);
    V_TIPO_DOC  VARCHAR2(100);
    V_ID        NUMBER;
    CUR_SANC    CU_REC_SET;
    I_CONT      INTEGER;
  BEGIN
  
    OPEN CUR_SANC FOR
      SELECT DISTINCT MSAN.ID_MULTA_SANCIONADO,
                      TD.TXT_DESCRIPCION AS TIPO_DOC_IDENTIDAD
        FROM T_SCOB_MULTA_DETAL MDET
       INNER JOIN T_SCOB_MULTA_SANCIONADO MSAN
          ON MSAN.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL
         AND MSAN.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
         AND NVL(MSAN.COD_TIPO_PERSONA, '1') = '1'
       INNER JOIN T_SCOB_PERSONA PERS
          ON PERS.ID_PERSONA = MSAN.ID_PERSONA
       INNER JOIN T_SCOB_TABLA_DET TD
          ON TD.ID_TABLA = 10
         AND TD.COD_INTERNO = PERS.TIPO_DOC
       WHERE MDET.ID_MULTA = PI_N_ID_MULTA
         AND MDET.FLG_ACTUAL = '1'
       ORDER BY MSAN.ID_MULTA_SANCIONADO;
  
    I_CONT := 0;
  
    LOOP
      FETCH CUR_SANC
        INTO V_ID, V_TIPO_DOC;
      EXIT WHEN CUR_SANC%NOTFOUND;
      I_CONT := I_CONT + 1;
      IF I_CONT > PI_N_NRO_PERSONAS AND PI_N_NRO_PERSONAS <> 0 THEN
        BEGIN
          V_RESPUESTA := V_RESPUESTA || '. . . y otros.';
          EXIT;
        END;
      END IF;
    
      V_RESPUESTA := V_RESPUESTA || '/ ' || V_TIPO_DOC;
    END LOOP;
    CLOSE CUR_SANC;
    V_RESPUESTA := SUBSTR(V_RESPUESTA, 2, LENGTH(V_RESPUESTA));
    RETURN NVL(TRIM(V_RESPUESTA), ' ');
  END;

  FUNCTION SCOB_FN_SANCIONADOS_REGION(PI_N_ID_MULTA     IN T_SCOB_MULTA.ID_MULTA%TYPE,
                                      PI_N_NRO_PERSONAS IN INTEGER)
    RETURN VARCHAR2 IS
    V_RESPUESTA               VARCHAR2(4000);
    N_ID_MULTA_SANCIONADO_AUX NUMBER;
    N_ID_MULTA_SANCIONADO     NUMBER;
    N_TIPO_DOMICILIO          NUMBER;
    N_ID_PERSONA_DOMICILIO    NUMBER;
    V_NOM_REGION              VARCHAR2(60);
  
    CUR_SANC CU_REC_SET;
    I_CONT   INTEGER;
  BEGIN
  
    OPEN CUR_SANC FOR
      SELECT DISTINCT MSAN.ID_MULTA_SANCIONADO,
                      TDOM.CODIGO               AS TIPO_DOMICILIO,
                      PDOM.ID_PERSONA_DOMICILIO,
                      UBIGEO.TXT_DPTO           AS NOM_REGION
        FROM T_SCOB_MULTA_DETAL MDET
       INNER JOIN T_SCOB_MULTA_SANCIONADO MSAN
          ON MSAN.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL
         AND MSAN.ESTADO = '1'
         AND NVL(MSAN.COD_TIPO_PERSONA, '1') = '1'
       INNER JOIN T_SCOB_PERSONA PERS
          ON PERS.ID_PERSONA = MSAN.ID_PERSONA
       INNER JOIN T_SCOB_PERSONA_DOMICILIO PDOM
          ON PDOM.ID_PERSONA = PERS.ID_PERSONA
         AND PDOM.ESTADO = '1'
       INNER JOIN T_SCOB_TIPO_DOMICILIO TDOM
          ON TDOM.CODIGO IN
             ( --1,6
              SCOB_PK_CONSTANTES.C_COD_TIPO_DOMICILIO_REAL,
              SCOB_PK_CONSTANTES.C_COD_TIPO_DOMICILIO_FISCAL)
         AND TDOM.ID_TIPO_DOMICILIO = PDOM.TIPO_DOMICILIO
       INNER JOIN T_SCOB_UBIGEO UBIGEO
          ON UBIGEO.ID_UBIGEO = PDOM.ID_UBIGEO
       WHERE MDET.ID_MULTA = PI_N_ID_MULTA
         AND MDET.FLG_ACTUAL = '1'
       ORDER BY MSAN.ID_MULTA_SANCIONADO,
                TDOM.CODIGO,
                PDOM.ID_PERSONA_DOMICILIO DESC;
  
    I_CONT                    := 0;
    N_ID_MULTA_SANCIONADO_AUX := 0;
    LOOP
      FETCH CUR_SANC
        INTO N_ID_MULTA_SANCIONADO,
             N_TIPO_DOMICILIO,
             N_ID_PERSONA_DOMICILIO,
             V_NOM_REGION;
      EXIT WHEN CUR_SANC%NOTFOUND;
      I_CONT := I_CONT + 1;
    
      IF I_CONT > PI_N_NRO_PERSONAS AND PI_N_NRO_PERSONAS <> 0 THEN
        BEGIN
          V_RESPUESTA := V_RESPUESTA || '. . . y otros.';
          EXIT;
        END;
      END IF;
    
      IF N_ID_MULTA_SANCIONADO_AUX <> N_ID_MULTA_SANCIONADO THEN
        V_RESPUESTA               := V_RESPUESTA || '/ ' || V_NOM_REGION;
        N_ID_MULTA_SANCIONADO_AUX := N_ID_MULTA_SANCIONADO;
      END IF;
    
    END LOOP;
    CLOSE CUR_SANC;
    V_RESPUESTA := SUBSTR(V_RESPUESTA, 2, LENGTH(V_RESPUESTA));
    -- RETURN NVL(TRIM(V_RESPUESTA), ' ');
    RETURN NVL(TRIM(V_RESPUESTA), '');
  END;

  FUNCTION SCOB_FN_SANCIONADOS_CLAS_INDEC(PI_N_ID_MULTA     IN T_SCOB_MULTA.ID_MULTA%TYPE,
                                          PI_N_NRO_PERSONAS IN INTEGER)
    RETURN VARCHAR2 IS
    V_RESPUESTA     VARCHAR2(4000);
    V_CLASIFICACION VARCHAR2(100);
    V_ID            NUMBER;
    CUR_SANC        CU_REC_SET;
    I_CONT          INTEGER;
  BEGIN
  
    OPEN CUR_SANC FOR
      SELECT DISTINCT MSAN.ID_MULTA_SANCIONADO,
                      TD.TXT_DESCRIPCION AS CALIFICACION
        FROM T_SCOB_MULTA_DETAL MDET
       INNER JOIN T_SCOB_MULTA_SANCIONADO MSAN
          ON MSAN.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL
         AND MSAN.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
         AND NVL(MSAN.COD_TIPO_PERSONA, '1') = '1'
       INNER JOIN T_SCOB_PERSONA PERS
          ON PERS.ID_PERSONA = MSAN.ID_PERSONA
       INNER JOIN T_SCOB_TABLA_DET TD
          ON TD.ID_TABLA = 13
         AND TD.COD_INTERNO = PERS.TIPO_DOC
       WHERE MDET.ID_MULTA = PI_N_ID_MULTA
         AND MDET.FLG_ACTUAL = '1'
       ORDER BY MSAN.ID_MULTA_SANCIONADO;
  
    I_CONT := 0;
  
    LOOP
      FETCH CUR_SANC
        INTO V_ID, V_CLASIFICACION;
      EXIT WHEN CUR_SANC%NOTFOUND;
      I_CONT := I_CONT + 1;
      IF I_CONT > PI_N_NRO_PERSONAS AND PI_N_NRO_PERSONAS <> 0 THEN
        BEGIN
          V_RESPUESTA := V_RESPUESTA || '. . . y otros.';
          EXIT;
        END;
      END IF;
    
      V_RESPUESTA := V_RESPUESTA || '/ ' || V_CLASIFICACION;
    END LOOP;
    CLOSE CUR_SANC;
    V_RESPUESTA := SUBSTR(V_RESPUESTA, 2, LENGTH(V_RESPUESTA));
    RETURN NVL(TRIM(V_RESPUESTA), ' ');
  END;
  ----
  FUNCTION SCOB_FN_MUL_ANTIGUO(P_IN_ID_EXPEDIENTE IN NUMBER) RETURN NUMBER IS
    V_RPTA NUMBER;
  BEGIN
    --
    SELECT B.ID_MULTA
      INTO V_RPTA
      FROM T_SCOB_EXPEDIENTE A
     INNER JOIN T_SCOB_EXPEDIENTE_MULTA B
        ON A.ID_EXPEDIENTE = B.ID_EXPEDIENTE
     WHERE A.ID_EXPEDIENTE = P_IN_ID_EXPEDIENTE
       AND ROWNUM = 1
     ORDER BY B.ID_MULTA ASC;
  
    RETURN V_RPTA;
    --
  END;
  ----
  FUNCTION SCOB_FN_ES_ACUM(P_IN_ID_EXPEDIENTE IN NUMBER) RETURN VARCHAR2 IS
    V_RPTA    VARCHAR2(25);
    COUNT_EXP NUMBER;
  BEGIN
    --
    SELECT COUNT(1)
      INTO V_RPTA
      FROM T_SCOB_EXPEDIENTE A
     INNER JOIN T_SCOB_EXPEDIENTE_MULTA B
        ON A.ID_EXPEDIENTE = B.ID_EXPEDIENTE
     WHERE A.ID_EXPEDIENTE = P_IN_ID_EXPEDIENTE
       AND B.ESTADO = 1;
  
    IF V_RPTA > 1 THEN
      V_RPTA := 'yellow';
    ELSE
      V_RPTA := '';
    END IF;
  
    RETURN V_RPTA;
    --
  END;
  ----
  FUNCTION SCOB_FN_PAGOS(P_IN_ID_EXPEDIENTE IN NUMBER, P_IN_OP IN NUMBER)
    RETURN VARCHAR2 IS
    V_RPTA    VARCHAR2(25);
    VALOR_UIT NUMBER;
    MONTO_UIT NUMBER;
  BEGIN
    --
    SELECT SUM(B.VALOR_UIT), SUM(B.MONTO_UIT)
      INTO VALOR_UIT, MONTO_UIT
      FROM T_SCOB_EXPEDIENTE_MULTA A
     INNER JOIN T_SCOB_MULTA_DETAL B
        ON A.ID_MULTA = B.ID_MULTA
     WHERE A.ID_EXPEDIENTE = P_IN_ID_EXPEDIENTE
       AND B.FLG_ACTUAL = 1;
    --
    CASE
      WHEN P_IN_OP = 1 THEN
        -- VALOR UIT DE LOS CUM'S DEL EXPEDIENTE
        V_RPTA := VALOR_UIT;
      WHEN P_IN_OP = 2 THEN
        -- MONTO_UIT DE LOS CUM'S DEL EXPEDIENTE
        V_RPTA := MONTO_UIT;
    END CASE;
    RETURN V_RPTA;
    --
  END;
  ----
  FUNCTION SCOB_FN_CUMS_EXP(P_IN_ID_EXPEDIENTE IN NUMBER) RETURN VARCHAR2 IS
    V_RPTA CLOB;
    V_AUX  VARCHAR2(25);
    V_CONT NUMBER;
    V_CUM  VARCHAR2(25);
  BEGIN
    --
    V_CONT := 0;
    FOR A1 IN (SELECT (B.ANIO || B.CUM) AS CUM
                 FROM T_SCOB_EXPEDIENTE_MULTA A
                INNER JOIN T_SCOB_MULTA B
                   ON A.ID_MULTA = B.ID_MULTA
                WHERE A.ID_EXPEDIENTE = P_IN_ID_EXPEDIENTE
                  AND A.ESTADO = 1
                ORDER BY A.ID_EXPEDIENTE ASC) LOOP
      IF V_CONT > 0 THEN
        V_AUX := ' / ';
      ELSE
        V_AUX := '';
      END IF;
      V_CONT := V_CONT + 1;
      V_RPTA := V_RPTA || V_AUX || A1.CUM;
    END LOOP;
    --
    --V_RPTA:=TRIM(V_CUM);
    --
    RETURN TRIM(V_RPTA);
    --
  END SCOB_FN_CUMS_EXP;
  ----
  FUNCTION SCOB_FN_NRO_FILE_CUM_ALFA(P_IN_ID IN NUMBER, V_OP NUMBER)
    RETURN VARCHAR2 IS
    V_RPTA          CLOB;
    V_AUX           VARCHAR2(25);
    V_CUM           VARCHAR2(25);
    V_ID_EXPEDIENTE NUMBER;
    A1              CU_REC_SET;
  BEGIN
    --
    IF V_OP = 1 THEN
      SELECT (A.ANIO_FILE_AEC || B.CODIGO || A.NRO_FILE_AEC) AS NRO_FILE
        INTO V_RPTA
        FROM T_SCOB_MULTA A
        LEFT JOIN T_SCOB_AREA_COBRANZA B
          ON A.ID_AREA_COBRANZA = B.ID_AREA_COBRANZA
       INNER JOIN T_SCOB_EXPEDIENTE_MULTA C
          ON A.ID_MULTA = C.ID_MULTA
         AND C.ESTADO = '1'
       WHERE C.ID_EXPEDIENTE = P_IN_ID
         AND ROWNUM = 1
       ORDER BY A.ID_MULTA ASC;
    ELSIF V_OP = 2 THEN
      SELECT (A.ANIO_FILE_AEC || B.CODIGO || A.NRO_FILE_AEC) AS NRO_FILE
        INTO V_RPTA
        FROM T_SCOB_MULTA A
        LEFT JOIN T_SCOB_AREA_COBRANZA B
          ON A.ID_AREA_COBRANZA = B.ID_AREA_COBRANZA
      /*INNER JOIN T_SCOB_EXPEDIENTE_MULTA C
      ON A.ID_MULTA=C.ID_MULTA
      AND C.ESTADO  = '1'*/
       WHERE A.ID_MULTA = P_IN_ID
         AND ROWNUM = 1
       ORDER BY A.ID_MULTA ASC;
    END IF;
    --
    RETURN TRIM(V_RPTA);
    --
  END SCOB_FN_NRO_FILE_CUM_ALFA;
  ----
  FUNCTION SCOB_FN_ES_CUM_ALFA(P_IN_ID IN NUMBER) RETURN VARCHAR2 IS
    V_RPTA          CLOB;
    V_ID_EXPEDIENTE NUMBER;
    V_ID_MULTA      NUMBER;
  
    CURSOR A1 IS
      SELECT A.ID_MULTA
        FROM T_SCOB_EXPEDIENTE_MULTA A
       INNER JOIN T_SCOB_MULTA B
          ON A.ID_MULTA = B.ID_MULTA
       WHERE A.ID_EXPEDIENTE = V_ID_EXPEDIENTE
         AND A.ESTADO = '1'
         AND ROWNUM = 1
       ORDER BY A.ID_MULTA ASC;
  BEGIN
    -- INI JCARRION@20170810
    --SELECT ID_EXPEDIENTE INTO V_ID_EXPEDIENTE FROM T_SCOB_EXPEDIENTE_MULTA WHERE ID_MULTA=P_IN_ID AND ESTADO='1' /*AND FLG_INACTIVO IS NULL*/;
    SELECT DISTINCT ID_EXPEDIENTE
      INTO V_ID_EXPEDIENTE
      FROM T_SCOB_EXPEDIENTE_MULTA
     WHERE ID_MULTA = P_IN_ID
       AND ESTADO = '1' /*AND FLG_INACTIVO IS NULL*/
    ;
    --
    V_RPTA := '';
    --
    OPEN A1;
    FETCH A1
      INTO V_ID_MULTA;
    IF A1%NOTFOUND THEN
      V_RPTA := '';
    ELSIF P_IN_ID = V_ID_MULTA THEN
      V_RPTA := 'A';
    END IF;
    CLOSE A1;
    --
    RETURN TRIM(V_RPTA);
    --
  END SCOB_FN_ES_CUM_ALFA;
  ----
  ----
  FUNCTION SCOB_FN_COD_ESTADO_PAGO_EXP(P_IN_ID IN NUMBER) RETURN VARCHAR2 IS
    V_RPTA NUMBER;
  
    CURSOR A1 IS
      SELECT CASE
               WHEN COUNT(1) > 0 THEN
                1
               ELSE
                3
             END AS COD_ESTADO_PAGO
        FROM T_SCOB_EXPEDIENTE_MULTA A
       INNER JOIN T_SCOB_MULTA B
          ON A.ID_MULTA = B.ID_MULTA
       WHERE A.ID_EXPEDIENTE = P_IN_ID
         AND B.COD_ESTADO_PAGO <> 3;
  BEGIN
    --
    OPEN A1;
    FETCH A1
      INTO V_RPTA;
    CLOSE A1;
    --
    RETURN TRIM(V_RPTA);
    --
  END SCOB_FN_COD_ESTADO_PAGO_EXP;
  ----
  FUNCTION SCOB_FN_CUM_SOLIC_DESACUM(P_IN_ID IN NUMBER) RETURN VARCHAR2 IS
    V_RPTA NUMBER;
  
    CURSOR A1 IS
      SELECT COUNT(1)
        FROM T_SCOB_SOLIC_DESACUM
       WHERE ID_MULTA = P_IN_ID
         AND NU_ESTADO = SCOB_PK_CONSTANTES.C_NU_ESTADO_SOLIC_ACTIVO
         AND NU_ESTADO_SOLIC NOT IN (3, 0);
    --AND NU_ESTADO_SOLIC<>SCOB_PK_CONSTANTES.C_NU_ESTADO_PROCESADO;
  BEGIN
    --
    OPEN A1;
    FETCH A1
      INTO V_RPTA;
    IF V_RPTA = '0' THEN
      V_RPTA := V_RPTA;
    ELSE
      V_RPTA := '1';
    END IF;
    CLOSE A1;
    --
    RETURN TRIM(V_RPTA);
    --
  END SCOB_FN_CUM_SOLIC_DESACUM;
  ----

  PROCEDURE SCOB_SP_S_EXPEDIENTE_BK
  /*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 04.04.2011
    -- Proposito    : Consulta las expedientes generados.
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_C_EVENTO             IN CHAR, --1=GENERAR EXPED; 2=COB.PRE-COACTIVA y COACTIVA;
   PI_V_NRO_EXPEDIENTE_INI IN VARCHAR2,
   PI_V_NRO_EXPEDIENTE_FIN IN VARCHAR2,
   PI_C_FEC_ASI_INI        IN CHAR,
   PI_C_FEC_ASI_FIN        IN CHAR,
   PI_C_FEC_INI            IN CHAR,
   PI_C_FEC_FIN            IN CHAR,
   PI_V_ESTADO_EXPEDIENTE  IN VARCHAR,
   PI_N_COD_ORGANO_RESOL   IN T_SCOB_MULTA_DETAL.ID_ORGANO_RESOLUTIVO%TYPE,
   PI_N_SALDO_INI          IN T_SCOB_EXPEDIENTE.MONTO_UIT%TYPE,
   PI_N_SALDO_FIN          IN T_SCOB_EXPEDIENTE.MONTO_UIT%TYPE,
   PI_C_DPTO               IN T_SCOB_UBIGEO.COD_DPTO%TYPE,
   PI_C_PROV               IN T_SCOB_UBIGEO.COD_PROV%TYPE,
   PI_C_DSTO               IN T_SCOB_UBIGEO.COD_DIST%TYPE,
   PI_N_COD_MATERIA        IN T_SCOB_MULTA.ID_MATERIA%TYPE,
   --
   PI_I_TIPO_PERSONA     IN T_SCOB_PERSONA.TIPO_PERSONA%TYPE,
   PI_I_TIPO_DOC         IN T_SCOB_PERSONA.TIPO_DOC%TYPE,
   PI_V_NRO_DOC          IN T_SCOB_PERSONA.NRO_DOC%TYPE,
   PI_V_APE_PATERNO      IN T_SCOB_PERSONA.APE_PATERNO%TYPE,
   PI_V_APE_MATERNO      IN T_SCOB_PERSONA.APE_MATERNO%TYPE,
   PI_V_PRI_NOMBRE       IN T_SCOB_PERSONA.PRI_NOMBRE%TYPE,
   PI_V_SEG_NOMBRE       IN T_SCOB_PERSONA.SEG_NOMBRE%TYPE,
   PI_V_RAZON_SOCIAL     IN T_SCOB_PERSONA.RAZON_SOCIAL%TYPE,
   PI_V_NOMBRE_COMERCIAL IN T_SCOB_PERSONA.NOMBRE_COMERCIAL%TYPE,
   PI_C_ESTADO           IN T_SCOB_EXPEDIENTE.ESTADO%TYPE,
   --
   PI_N_ID_USUARIO IN T_SCOB_USUARIO.ID_USUARIO%TYPE,
   PO_CU_RETORNO   OUT CU_REC_SET) AS
    C_ESTADO CHAR(1);
    --
    V_SELECT CLOB;
    V_A1     CLOB;
    V_A2     CLOB;
    V_QUERY  CLOB;
    --
  BEGIN
    --
    SELECT DECODE(PI_C_ESTADO, '', '*', PI_C_ESTADO)
      INTO C_ESTADO
      FROM DUAL;
    --
    V_SELECT := 'SELECT A1.ID_EXPEDIENTE,
      A1.COD_EXPEDIENTE,
      A1.NRO_EXPEDIENTE,
      A1.ANIO_EXPEDIENTE,
      A1.NRO_EXPED,
      A1.NRO_FILE_AEC,
      A1.TIPO_EXPEDIENTE,
      A1.NOM_SANCIONADO,
      A1.NUM_CUM,
      A1.NRO_LIQUIDACION,
      A1.GENERADO_POR ,
      A1.FEC_GENERADO_POR,
      A1.FEC_GENERADO_POR,
      A1.COD_ESTADO_EXPEDIENTE,
      A1.NOM_ESTADO_EXPEDIENTE,
      A1.COD_MOTIVO,
      A1.NOM_MOTIVO,
      A1.NRO_DOCS,
      A1.NRO_EMBARGOS,
      A1.FEC_ARCHIVO_CENTRAL,
      A1.FLG_DOMICILIO,
      A1.IND_CANCELADO ,
      A1.FLG_TIPO_MULTA_OR,
      A1.ESTADO_REGISTRO,
      A1.DES_ESTADO_REGISTRO,
      A1.DES_ORGA_RESOL,
      A1.NRO_FILE,
      A1.ANIO_FILE,
      A1.COD_AREA_COB,
      A1.IND_ANTIDUMPING,
      A1.ID_MULTA_DETAL,
      A1.COD_ESTADO_DEUDA,
      A1.EXPED_ASIGNADO_A,
      A1.COD_SANCIONADO,
      A1.NRO_CUMS,
      A1.ES_ACUM,
      A1.HAS_ADJ_ANOT,
      A2.TIPO_CAMBIO,
      A2.MONTO_ANTIDUMPING,
      A2.MONTO_DA_INTERES,
      A2.MONTO_DA_INTERES_MORATORIO,
      A2.MONTO_TOTAL_DEUDA_DA,
      A2.UIT_VALOR,
      A2.UIT_MONTO,
      A2.MONTO_IC,
      A2.MONTO_IM,
      A2.MONTO_COSTAS,
      A2.MONTO_TOTAL_DEUDA,
      A2.TOTAL_AMORTIZADO_UIT,
      A2.MONTO_AMORTIZADO_IC,
      A2.MONTO_AMORTIZADO_IM,
      A2.MONTO_AMORTIZADO_COSTAS,
      A2.MONTO_TOTAL_AMORTIZADO,
      A2.SALDO_UIT,
      A2.SALDO_INTERES_COMPENSATORIO,
      A2.SALDO_INTERES_MORATORIO,
      A2.SALDO_COSTAS,
      A2.SALDO_TOTAL';
    --
    V_A1 := ' FROM
  (SELECT EXPE.ID_EXPEDIENTE,
    EXPE.ID_EXPEDIENTE  AS COD_EXPEDIENTE,
    EXPE.NRO_EXPEDIENTE AS NRO_EXPEDIENTE,
    EXPE.ANIO           AS ANIO_EXPEDIENTE,
    -- CUM ALFA
    EXPE.ANIO
    || EXPE.NRO_EXPEDIENTE AS NRO_EXPED,
    MULT.NRO_FILE_AEC      AS NRO_FILE_AEC,
    MRES.TXT_DESCRIPCION   AS TIPO_EXPEDIENTE,
    DECODE(EXPE.FLG_TIPO_EXPEDIENTE, ''1'', DECODE(PERS.TIPO_PERSONA, ' ||
            SCOB_PK_CONSTANTES.C_TIPO_PERS_JURIDICA ||
            ', PERS.RAZON_SOCIAL, PERS.APE_PATERNO
    || '' ''
    || PERS.APE_MATERNO
    || '' ''
    || PERS.PRI_NOMBRE
    || '' ''
    || PERS.SEG_NOMBRE
    || '' ''
    || PERS.APE_CASADA), SCOB_PK_EXPEDIENTE.SCOB_FN_SANCIONADOS_EXPED(EXPE.ID_EXPEDIENTE)) AS NOM_SANCIONADO,
    MULT.ANIO
    || MULT.CUM AS NUM_CUM,
    DECODE(NVL(MUAN.NRO_LIQUIDACION_CODIGO, '' ''), '' '', NULL, MUAN.NRO_LIQUIDACION_CODIGO
    || ''-''
    || MUAN.NRO_LIQUIDACION_ANIO
    || ''/''
    || MUAN.NRO_LIQUIDACION_CORRELATIVO) AS NRO_LIQUIDACION,
    -- DATOS DEL EXPEDIENTE
    EXPE.AUDUSUCREACION    AS GENERADO_POR,
    EXPE.AUDFECCREACION    AS FEC_GENERADO_POR,
    EXPE.ESTADO_EXPEDIENTE AS COD_ESTADO_EXPEDIENTE,
    ESEC.DESCRIPCION       AS NOM_ESTADO_EXPEDIENTE,
    EXPE.ID_MOTIVO         AS COD_MOTIVO,
    MOTI.DESCRIPCION       AS NOM_MOTIVO,
    --------------------------------------------------------------------------------
    NVL(DOCS.NRO_DOCS, 0)                                                                           AS NRO_DOCS,
    NVL(EXPE_EMB.NRO_EMBARGOS, 0)                                                                   AS NRO_EMBARGOS,
    ARCH_CEN.FEC_ENVIO                                                                              AS FEC_ARCHIVO_CENTRAL,
    DECODE(NVL(DIREC.FLG_DIR, 0), 0, ''0'', ''1'')                                                  AS FLG_DOMICILIO,
    NVL(EXPE.FLG_CANCELADO, ''0'')                                                                  AS IND_CANCELADO,
    MULT.Flg_Multa_Resolutivo                                                                       AS FLG_TIPO_MULTA_OR,
    EXPE.ESTADO                                                                                     AS ESTADO_REGISTRO,
    SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(' ||
            SCOB_PK_CONSTANTES.C_TBL_ESTADO_REGISTRO ||
            ', EXPE.ESTADO) AS DES_ESTADO_REGISTRO,
    ORGA.DESCRIPCION                                                                                AS DES_ORGA_RESOL,
    MULT.NRO_FILE_AEC                                                                               AS NRO_FILE,
    MULT.ANIO_FILE_AEC                                                                              AS ANIO_FILE,
    ACOB.CODIGO                                                                                     AS COD_AREA_COB,
    DECODE(MUAN.ID_MULTA_ANTIDUMPING, NULL, ''0'', ''1'')                                           AS IND_ANTIDUMPING,
    MDET.ID_MULTA_DETAL                                                                             AS ID_MULTA_DETAL,
    --MULT.COD_ESTADO_PAGO                                                                            AS COD_ESTADO_DEUDA, --3=Pago Total
    SCOB_PK_EXPEDIENTE.SCOB_FN_COD_ESTADO_PAGO_EXP(EXPE.ID_EXPEDIENTE) AS COD_ESTADO_DEUDA,
    --3 AS COD_ESTADO_DEUDA --3=Pago Total

    USU.PRI_NOMBRE
    || '' ''
    || USU.APE_PATERNO
    || '' ''
    || USU.APE_MATERNO AS EXPED_ASIGNADO_A, --EJECUTOR COACTIVO RESPONSABLE 2013.02.12
    --
    DECODE(EXPE.FLG_TIPO_EXPEDIENTE, ''1'', PERS.COD_SANCIONADO, ''0'') AS COD_SANCIONADO,
    --
    EXPE.NRO_CUMS AS NRO_CUMS,
    --
    SCOB_PK_EXPEDIENTE.SCOB_FN_ES_ACUM(EXPE.ID_EXPEDIENTE) AS ES_ACUM,
    SCOB_PK_MULTAS.SCOB_FN_HAS_ADJ_ANOT(EXPE.ID_EXPEDIENTE,1) AS HAS_ADJ_ANOT
  FROM T_SCOB_EXPEDIENTE EXPE
  INNER JOIN T_SCOB_EXPEDIENTE_MULTA EXMU
  ON EXMU.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
  AND EXMU.ESTADO = DECODE(''' || C_ESTADO ||
            ''', ''*'', EXMU.ESTADO, ' || PI_C_ESTADO || ')
  INNER JOIN T_SCOB_MULTA MULT
  ON MULT.ID_MULTA = EXMU.ID_MULTA
  LEFT JOIN T_SCOB_USUARIO USU
  ON USU.ID_USUARIO = MULT.ID_USUARIO_ASIG_COBRANZA
    --SANCIONADO
  INNER JOIN
    (SELECT MDET.ID_MULTA  AS ID_MULTA,
      COUNT(MDET.ID_MULTA) AS NRO_MULTAS
    FROM T_SCOB_MULTA_DETAL MDET
    INNER JOIN T_SCOB_MULTA_SANCIONADO SANC
    ON SANC.ID_MULTA_DETAL              = MDET.ID_MULTA_DETAL
    AND NVL(SANC.COD_TIPO_PERSONA, ''1'') = ''1''
    AND SANC.ESTADO = ''1''
    INNER JOIN T_SCOB_PERSONA PERS
    ON PERS.ID_PERSONA     = SANC.ID_PERSONA
    WHERE MDET.FLG_ACTUAL  = ''1''
    AND MDET.ESTADO        = ''1''';
    IF PI_I_TIPO_PERSONA <> 0 THEN
      V_A1 := V_A1 || ' AND (NVL(' || PI_I_TIPO_PERSONA ||
              ', 0) = 0 OR (NVL(' || PI_I_TIPO_PERSONA ||
              ', 0) <> 0 AND PERS.TIPO_PERSONA  = ' || PI_I_TIPO_PERSONA || '))';
    END IF;
    IF PI_I_TIPO_DOC <> 0 THEN
      V_A1 := V_A1 || ' AND (NVL(' || PI_I_TIPO_DOC || ', 0) = 0 OR (NVL(' ||
              PI_I_TIPO_DOC || ', 0) <> 0 AND PERS.TIPO_DOC = ' ||
              PI_I_TIPO_DOC || '))';
    END IF;
    IF PI_V_NRO_DOC IS NOT NULL THEN
      V_A1 := V_A1 || ' AND (NVL(''' || PI_V_NRO_DOC ||
              ''', '' '') = '' '' OR (NVL(''' || PI_V_NRO_DOC ||
              ''', '' '') <> '' '' AND TRIM(PERS.NRO_DOC) = TRIM(''' ||
              PI_V_NRO_DOC || ''')))';
    END IF;
    IF PI_V_APE_PATERNO IS NOT NULL THEN
      V_A1 := V_A1 || ' AND (NVL(''' || PI_V_APE_PATERNO ||
              ''', '' '') = '' '' OR (NVL(''' || PI_V_APE_PATERNO ||
              ''', '' '') <> '' '' AND fun_scob_nosensite(TRIM(PERS.APE_PATERNO)) LIKE ''%'' || fun_scob_nosensite(TRIM(''' ||
              PI_V_APE_PATERNO || ''')) || ''%''))';
    END IF;
    IF PI_V_APE_MATERNO IS NOT NULL THEN
      V_A1 := V_A1 || ' AND (NVL(''' || PI_V_APE_MATERNO ||
              ''', '' '') = '' '' OR (NVL(''' || PI_V_APE_MATERNO ||
              ''', '' '') <> '' '' AND fun_scob_nosensite(TRIM(PERS.APE_MATERNO)) LIKE ''%'' || fun_scob_nosensite(TRIM(''' ||
              PI_V_APE_MATERNO || ''')) || ''%''))';
    END IF;
    IF PI_V_PRI_NOMBRE IS NOT NULL THEN
      V_A1 := V_A1 || ' AND (NVL(''' || PI_V_PRI_NOMBRE ||
              ''', '' '') = '' '' OR (NVL(''' || PI_V_PRI_NOMBRE ||
              ''', '' '') <> '' '' AND fun_scob_nosensite(TRIM(PERS.PRI_NOMBRE)) LIKE ''%'' || fun_scob_nosensite(TRIM(''' ||
              PI_V_PRI_NOMBRE || ''')) || ''%''))';
    END IF;
    IF PI_V_SEG_NOMBRE IS NOT NULL THEN
      V_A1 := V_A1 || ' AND (NVL(''' || PI_V_SEG_NOMBRE ||
              ''', '' '') = '' '' OR (NVL(''' || PI_V_SEG_NOMBRE ||
              ''', '' '') <> '' '' AND fun_scob_nosensite(TRIM(PERS.SEG_NOMBRE)) LIKE ''%'' || fun_scob_nosensite(TRIM(''' ||
              PI_V_SEG_NOMBRE || ''')) || ''%''))';
    END IF;
    IF PI_V_RAZON_SOCIAL IS NOT NULL THEN
      V_A1 := V_A1 || ' AND (NVL(''' || PI_V_RAZON_SOCIAL ||
              ''', '' '') = '' '' OR (NVL(''' || PI_V_RAZON_SOCIAL ||
              ''', '' '') <> '' '' AND fun_scob_nosensite(TRIM(PERS.RAZON_SOCIAL)) LIKE ''%'' || fun_scob_nosensite(TRIM(''' ||
              PI_V_RAZON_SOCIAL || ''')) || ''%''))';
    END IF;
    IF PI_V_NOMBRE_COMERCIAL IS NOT NULL THEN
      V_A1 := V_A1 || ' AND (NVL(''' || PI_V_NOMBRE_COMERCIAL ||
              ''', '' '') = '' '' OR (NVL(''' || PI_V_NOMBRE_COMERCIAL ||
              ''', '' '') <> '' '' AND fun_scob_nosensite(TRIM(PERS.NOMBRE_COMERCIAL)) LIKE ''%'' || fun_scob_nosensite(TRIM(''' ||
              PI_V_NOMBRE_COMERCIAL || ''')) || ''%''))';
    END IF;
    V_A1 := V_A1 || ' GROUP BY MDET.ID_MULTA
    ) MULTA_SANC ON MULTA_SANC.ID_MULTA = MULT.ID_MULTA
  INNER JOIN T_SCOB_MULTA_DETAL MDET
  ON MDET.ID_MULTA    = MULTA_SANC.ID_MULTA
  AND MDET.FLG_ACTUAL = ''1''
  INNER JOIN T_SCOB_MULTA_SANCIONADO MSAN
  ON MSAN.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL
  AND MSAN.ESTADO = ' || SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO || '
  AND MSAN.FLG_PRINCIPAL = ''1''
  AND NVL(MSAN.COD_TIPO_PERSONA, ''1'') = ''1''
  INNER JOIN T_SCOB_PERSONA PERS
  ON PERS.ID_PERSONA = MSAN.ID_PERSONA
  INNER JOIN T_SCOB_ORGANO_RESOLUTIVO ORGA
  ON ORGA.ID_ORGANO_RESOLUTIVO = MDET.ID_ORGANO_RESOLUTIVO
  INNER JOIN T_SCOB_EST_EXP_COB ESEC
  ON ESEC.CODIGO = EXPE.ESTADO_EXPEDIENTE
  INNER JOIN t_Scob_Est_Exp_Cob_Motivo MOTI
  ON MOTI.ID_EST_EXP_COB = EXPE.ESTADO_EXPEDIENTE
  AND MOTI.ID_MOTIVO     = EXPE.ID_MOTIVO
  LEFT JOIN T_SCOB_MULTA_ANTIDUMPING MUAN
  ON MUAN.ID_MULTA = MDET.ID_MULTA
  LEFT JOIN T_SCOB_TABLA_DET MRES
  ON MRES.ID_TABLA = ' ||
            SCOB_PK_CONSTANTES.C_TBL_TIPO_RESP_MULTA_OR || '
  AND LTRIM(RTRIM(MRES.COD_INTERNO)) = LTRIM(RTRIM(MULT.FLG_TIPO_MULTA))
  LEFT JOIN
    (SELECT EXDO.ID_EXPEDIENTE AS ID_EXPEDIENTE,
      COUNT(EXDO.ID_EXPEDIENTE_DOCUMENTO) AS NRO_DOCS
    FROM T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
    WHERE COD_GENERADOR_DOCUMENTO IS NOT NULL
    AND EXDO.ESTADO = ''1''
    GROUP BY EXDO.ID_EXPEDIENTE
    ) DOCS
  ON DOCS.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
  LEFT JOIN
    (SELECT EXDI.ID_EXPEDIENTE AS ID_EXPEDIENTE,
      COUNT(EXDI.ID_EXPEDIENTE_PERSONA) AS FLG_DIR
    FROM T_SCOB_EXPEDIENTE_PERSONA EXDI
    WHERE EXDI.ESTADO = ' || SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO || '
    AND EXDI.COD_TIPO_ENTIDAD = ' ||
            SCOB_PK_CONSTANTES.C_COD_ENTIDAD_PERSONA ||
            ' --PERSONAS
    GROUP BY EXDI.ID_EXPEDIENTE
    HAVING COUNT(EXDI.ID_EXPEDIENTE_PERSONA) > 0
    ) DIREC
  ON DIREC.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
  LEFT JOIN T_SCOB_MULTA_ARCHIVO_CENTRAL MULTA_ARCH
  ON MULTA_ARCH.ID_MULTA = MDET.ID_MULTA
  AND MULTA_ARCH.FLG_ACTUAL = ''1''
  LEFT JOIN T_SCOB_ARCHIVO_CENTRAL ARCH_CEN
  ON ARCH_CEN.ID_ARCHIVO_CENTRAL = MULTA_ARCH.ID_ARCHIVO_CENTRAL
  LEFT JOIN
    (SELECT EMB.ID_EXPEDIENTE,
      COUNT(EMB.ID_EXPEDIENTE_EMBARGO) AS NRO_EMBARGOS
    FROM T_SCOB_EXPED_EMBARGO EMB
    WHERE EMB.ESTADO = ' || SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO || '
    AND EMB.COD_ESTADO_EMBARGO = ' ||
            SCOB_PK_CONSTANTES.C_EST_SOLIC_EMB_PENDIENTE || ' --EMBARGOS PENDIENTES.
    GROUP BY EMB.ID_EXPEDIENTE
    ) EXPE_EMB
  ON EXPE_EMB.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
  LEFT JOIN T_SCOB_AREA_COBRANZA ACOB
  ON ACOB.ID_AREA_COBRANZA = MULT.ID_AREA_COBRANZA
  WHERE 1=1 ';
    IF PI_C_DPTO IS NOT NULL THEN
      V_A1 := V_A1 || ' AND (NVL(''' || PI_C_DPTO ||
              ''', '' '') = '' '' OR (NVL(''' || PI_C_DPTO ||
              ''', '' '') <> '' '' AND TRIM(ORGA.COD_DPTO) = TRIM(''' ||
              PI_C_DPTO || ''')))';
    END IF;
    IF PI_C_PROV IS NOT NULL THEN
      V_A1 := V_A1 || ' AND (NVL(''' || PI_C_PROV ||
              ''', '' '') = '' '' OR (NVL(''' || PI_C_PROV ||
              ''', '' '') <> '' '' AND TRIM(ORGA.COD_PROV) = TRIM(''' ||
              PI_C_PROV || ''')))';
    END IF;
    IF PI_C_DSTO IS NOT NULL THEN
      V_A1 := V_A1 || ' AND (NVL(''' || PI_C_DSTO ||
              ''', '' '') = '' '' OR (NVL(''' || PI_C_DSTO ||
              ''', '' '') <> '' '' AND TRIM(ORGA.COD_DIST) = TRIM(''' ||
              PI_C_DSTO || ''')))';
    END IF;
    IF PI_C_DSTO <> 0 THEN
      V_A1 := V_A1 || ' AND (NVL(' || PI_N_COD_MATERIA ||
              ', 0) = 0 OR (NVL(' || PI_N_COD_MATERIA ||
              ', 0) <> 0 AND MULT.ID_MATERIA = ' || PI_N_COD_MATERIA || '))';
    END IF;
    IF PI_V_ESTADO_EXPEDIENTE IS NOT NULL THEN
      V_A1 := V_A1 || ' AND (NVL(''' || PI_V_ESTADO_EXPEDIENTE ||
              ''', '' '')   = '' '' OR (NVL(''' || PI_V_ESTADO_EXPEDIENTE ||
              ''', '' '')   <> '' '' AND TRIM(EXPE.ESTADO_EXPEDIENTE) = TRIM(''' ||
              PI_V_ESTADO_EXPEDIENTE || ''')))';
    END IF;
    IF PI_N_COD_ORGANO_RESOL <> 0 THEN
      V_A1 := V_A1 || ' AND (NVL(' || PI_N_COD_ORGANO_RESOL ||
              ', 0) = 0 OR (NVL(' || PI_N_COD_ORGANO_RESOL ||
              ', 0) <> 0 AND ORGA.ID_ORGANO_RESOLUTIVO = ' ||
              PI_N_COD_ORGANO_RESOL || '))';
    END IF;
    IF PI_V_ESTADO_EXPEDIENTE IS NOT NULL THEN
      V_A1 := V_A1 || ' AND (NVL(''' || PI_V_ESTADO_EXPEDIENTE ||
              ''', '' '')   = '' '' OR (NVL(''' || PI_V_ESTADO_EXPEDIENTE ||
              ''', '' '')   <> '' '' AND TRIM(EXPE.ESTADO_EXPEDIENTE) = TRIM(''' ||
              PI_V_ESTADO_EXPEDIENTE || ''')))';
    END IF;
    IF PI_V_NRO_EXPEDIENTE_INI IS NOT NULL THEN
      V_A1 := V_A1 || ' AND ((NVL(''' || PI_V_NRO_EXPEDIENTE_INI ||
              ''', '' '') = '' '') OR (NVL(''' || PI_V_NRO_EXPEDIENTE_INI ||
              ''', '' '')  <> '' ''
      AND TO_NUMBER(EXPE.ANIO || TRIM(EXPE.NRO_EXPEDIENTE)) BETWEEN TO_NUMBER(TRIM(''' ||
              PI_V_NRO_EXPEDIENTE_INI || ''')) AND TO_NUMBER(TRIM(NVL(''' ||
              PI_V_NRO_EXPEDIENTE_FIN || ''', ''' ||
              PI_V_NRO_EXPEDIENTE_INI || ''')))))';
    END IF;
    IF PI_C_FEC_INI IS NOT NULL THEN
      V_A1 := V_A1 || ' AND ((NVL(''' || PI_C_FEC_INI ||
              ''', '' '') = '' '') OR (NVL(''' || PI_C_FEC_INI ||
              ''', '' '')  <> '' '' AND TO_DATE(TO_CHAR(EXPE.AUDFECCREACION, ''DD/MM/YYYY''), ''DD/MM/YYYY'') BETWEEN TO_DATE(''' ||
              PI_C_FEC_INI || ''', ''DD/MM/YYYY'') AND TO_DATE(''' ||
              PI_C_FEC_FIN || ''', ''DD/MM/YYYY'')))';
    END IF;
    IF PI_C_FEC_ASI_INI IS NOT NULL THEN
      ---NVO FECHA ASIGNACION
      V_A1 := V_A1 || ' AND ((NVL(''' || PI_C_FEC_ASI_INI ||
              ''', '' '') = '' '') OR (NVL(''' || PI_C_FEC_ASI_INI ||
              ''', '' '')  <> '' '' AND TO_DATE(TO_CHAR(MULT.FECHA_ASIG_COBRANZA, ''DD/MM/YYYY''), ''DD/MM/YYYY'') BETWEEN TO_DATE(''' ||
              PI_C_FEC_ASI_INI || ''', ''DD/MM/YYYY'') AND TO_DATE(''' ||
              PI_C_FEC_ASI_FIN || ''', ''DD/MM/YYYY'')))';
    END IF;
    IF PI_N_SALDO_INI <> 0 THEN
      V_A1 := V_A1 || ' AND ((NVL(' || PI_N_SALDO_INI ||
              ', 0) = 0) OR (NVL(' || PI_N_SALDO_INI ||
              ', 0)  <> 0 AND EXPE.SALDO BETWEEN ' || PI_N_SALDO_INI ||
              ' AND ' || PI_N_SALDO_FIN || '))';
    END IF;
    IF PI_N_ID_USUARIO <> 0 THEN
      --EXPE.ID_USUARIO_INGRESO = '||PI_N_ID_USUARIO||') --COMENTADO POR OBS 202 - 13.02.2012
      V_A1 := V_A1 || ' AND (NVL(' || PI_N_ID_USUARIO || ', 0) = 0 OR NVL(' ||
              PI_N_ID_USUARIO ||
              ', 0)  <> 0 AND MULT.ID_USUARIO_ASIG_COBRANZA = ' ||
              PI_N_ID_USUARIO || ')';
    END IF;
    V_A1 := V_A1 || ' AND ((NVL(''' || PI_C_EVENTO ||
            ''', '' '') = '' '') OR (''' || PI_C_EVENTO ||
            ''' = 1
    AND EXPE.ESTADO_EXPEDIENTE = ' ||
            SCOB_PK_CONSTANTES.C_TBL_EST_EXP_PRECOACTIVO || ')
    OR (''' || PI_C_EVENTO || ''' = 2
    AND (EXPE.ID_EXPEDIENTE   IS NOT NULL)))
    AND (''' || C_ESTADO || ''' = ''*''
    OR ( ''' || C_ESTADO || ''' <> ''*''
    AND EXPE.ESTADO = ''' || C_ESTADO || '''))
    AND MULT.ID_MULTA = SCOB_PK_EXPEDIENTE.SCOB_FN_MUL_ANTIGUO(EXPE.ID_EXPEDIENTE)
  ) A1';
    --
    V_A2 := ' JOIN
  (SELECT EXPE.ID_EXPEDIENTE,
    --montos deuda antidumping
    SUM(MUAN.TIPO_CAMBIO)             AS TIPO_CAMBIO,
    SUM(MUAN.MONTO_ANTIDUMPING)       AS MONTO_ANTIDUMPING,
    SUM(MUAN.MONTO_INTERES)           AS MONTO_DA_INTERES,
    SUM(MUAN.MONTO_INTERES_MORATORIO) AS MONTO_DA_INTERES_MORATORIO,
    SUM(MUAN.MONTO_TOTAL)             AS MONTO_TOTAL_DEUDA_DA,
    --montos deuda uit
    SUM(MDET.VALOR_UIT)               AS UIT_VALOR,
    SUM(MULT.MONTO_UIT)               AS UIT_MONTO,
    SUM(MULT.MONTO_INTERES)           AS MONTO_IC,
    SUM(MULT.MONTO_INTERES_MORATORIO) AS MONTO_IM,
    SUM(MULT.MONTO_COSTAS)            AS MONTO_COSTAS,
    SUM(MULT.MONTO_TOTAL_DEUDA)       AS MONTO_TOTAL_DEUDA,
    --montos amortizado
    SUM(MULT.TOTAL_AMORTIZADO)         AS TOTAL_AMORTIZADO_UIT,
    SUM(MULT.TOTAL_AMORTIZADO_IC)      AS MONTO_AMORTIZADO_IC,
    SUM(MULT.TOTAL_AMORTIZADO_IM)      AS MONTO_AMORTIZADO_IM,
    SUM(MULT.TOTAL_AMORTIZADO_COSTAS)  AS MONTO_AMORTIZADO_COSTAS,
    SUM(MULT.TOTAL_AMORTIZACION_DEUDA) AS MONTO_TOTAL_AMORTIZADO,
    --montos_saldo
    SUM(MULT.SALDO)             AS SALDO_UIT,
    SUM(MULT.SALDO_IC)          AS SALDO_INTERES_COMPENSATORIO,
    SUM(MULT.SALDO_IM)          AS SALDO_INTERES_MORATORIO,
    SUM(MULT.SALDO_COSTAS)      AS SALDO_COSTAS,
    SUM(MULT.SALDO_TOTAL_DEUDA) AS SALDO_TOTAL
  FROM T_SCOB_EXPEDIENTE EXPE
  INNER JOIN T_SCOB_EXPEDIENTE_MULTA EXMU
  ON EXMU.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
  AND EXMU.ESTADO       = DECODE(''' || C_ESTADO ||
            ''', ''*'', EXMU.ESTADO, ' || PI_C_ESTADO || ')
  INNER JOIN T_SCOB_MULTA MULT
  ON MULT.ID_MULTA = EXMU.ID_MULTA
  LEFT JOIN T_SCOB_USUARIO USU
  ON USU.ID_USUARIO = MULT.ID_USUARIO_ASIG_COBRANZA
    --SANCIONADO
  INNER JOIN
    (SELECT MDET.ID_MULTA  AS ID_MULTA,
      COUNT(MDET.ID_MULTA) AS NRO_MULTAS
    FROM T_SCOB_MULTA_DETAL MDET
    INNER JOIN T_SCOB_MULTA_SANCIONADO SANC
    ON SANC.ID_MULTA_DETAL              = MDET.ID_MULTA_DETAL
    AND NVL(SANC.COD_TIPO_PERSONA, ''1'') = ''1''
    AND SANC.ESTADO                     = ''1''
    INNER JOIN T_SCOB_PERSONA PERS
    ON PERS.ID_PERSONA              = SANC.ID_PERSONA
    WHERE MDET.FLG_ACTUAL           = ''1''
    AND MDET.ESTADO                 = ''1''';
    IF PI_I_TIPO_PERSONA <> 0 THEN
      V_A2 := V_A2 || ' AND (NVL(' || PI_I_TIPO_PERSONA ||
              ', 0) = 0 OR (NVL(' || PI_I_TIPO_PERSONA ||
              ', 0) <> 0 AND PERS.TIPO_PERSONA  = ' || PI_I_TIPO_PERSONA || '))';
    END IF;
    IF PI_I_TIPO_DOC <> 0 THEN
      V_A2 := V_A2 || ' AND (NVL(' || PI_I_TIPO_DOC || ', 0) = 0 OR (NVL(' ||
              PI_I_TIPO_DOC || ', 0) <> 0 AND PERS.TIPO_DOC = ' ||
              PI_I_TIPO_DOC || '))';
    END IF;
    IF PI_V_NRO_DOC IS NOT NULL THEN
      V_A2 := V_A2 || ' AND (NVL(''' || PI_V_NRO_DOC ||
              ''', '' '') = '' '' OR (NVL(''' || PI_V_NRO_DOC ||
              ''', '' '') <> '' '' AND TRIM(PERS.NRO_DOC) = TRIM(''' ||
              PI_V_NRO_DOC || ''')))';
    END IF;
    IF PI_V_APE_PATERNO IS NOT NULL THEN
      V_A2 := V_A2 || ' AND (NVL(''' || PI_V_APE_PATERNO ||
              ''', '' '') = '' '' OR (NVL(''' || PI_V_APE_PATERNO ||
              ''', '' '') <> '' '' AND fun_scob_nosensite(TRIM(PERS.APE_PATERNO)) LIKE ''%'' || fun_scob_nosensite(TRIM(''' ||
              PI_V_APE_PATERNO || ''')) || ''%''))';
    END IF;
    IF PI_V_APE_MATERNO IS NOT NULL THEN
      V_A2 := V_A2 || ' AND (NVL(''' || PI_V_APE_MATERNO ||
              ''', '' '') = '' '' OR (NVL(''' || PI_V_APE_MATERNO ||
              ''', '' '') <> '' '' AND fun_scob_nosensite(TRIM(PERS.APE_MATERNO)) LIKE ''%'' || fun_scob_nosensite(TRIM(''' ||
              PI_V_APE_MATERNO || ''')) || ''%''))';
    END IF;
    IF PI_V_PRI_NOMBRE IS NOT NULL THEN
      V_A2 := V_A2 || ' AND (NVL(''' || PI_V_PRI_NOMBRE ||
              ''', '' '') = '' '' OR (NVL(''' || PI_V_PRI_NOMBRE ||
              ''', '' '') <> '' '' AND fun_scob_nosensite(TRIM(PERS.PRI_NOMBRE)) LIKE ''%'' || fun_scob_nosensite(TRIM(''' ||
              PI_V_PRI_NOMBRE || ''')) || ''%''))';
    END IF;
    IF PI_V_SEG_NOMBRE IS NOT NULL THEN
      V_A2 := V_A2 || ' AND (NVL(''' || PI_V_SEG_NOMBRE ||
              ''', '' '') = '' '' OR (NVL(''' || PI_V_SEG_NOMBRE ||
              ''', '' '') <> '' '' AND fun_scob_nosensite(TRIM(PERS.SEG_NOMBRE)) LIKE ''%'' || fun_scob_nosensite(TRIM(''' ||
              PI_V_SEG_NOMBRE || ''')) || ''%''))';
    END IF;
    IF PI_V_RAZON_SOCIAL IS NOT NULL THEN
      V_A2 := V_A2 || ' AND (NVL(''' || PI_V_RAZON_SOCIAL ||
              ''', '' '') = '' '' OR (NVL(''' || PI_V_RAZON_SOCIAL ||
              ''', '' '') <> '' '' AND fun_scob_nosensite(TRIM(PERS.RAZON_SOCIAL)) LIKE ''%'' || fun_scob_nosensite(TRIM(''' ||
              PI_V_RAZON_SOCIAL || ''')) || ''%''))';
    END IF;
    IF PI_V_NOMBRE_COMERCIAL IS NOT NULL THEN
      V_A2 := V_A2 || ' AND (NVL(''' || PI_V_NOMBRE_COMERCIAL ||
              ''', '' '') = '' '' OR (NVL(''' || PI_V_NOMBRE_COMERCIAL ||
              ''', '' '') <> '' '' AND fun_scob_nosensite(TRIM(PERS.NOMBRE_COMERCIAL)) LIKE ''%'' || fun_scob_nosensite(TRIM(''' ||
              PI_V_NOMBRE_COMERCIAL || ''')) || ''%''))';
    END IF;
    V_A2 := V_A2 || ' GROUP BY MDET.ID_MULTA
    ) MULTA_SANC ON MULTA_SANC.ID_MULTA = MULT.ID_MULTA
  INNER JOIN T_SCOB_MULTA_DETAL MDET
  ON MDET.ID_MULTA    = MULTA_SANC.ID_MULTA
  AND MDET.FLG_ACTUAL = ''1''
  INNER JOIN T_SCOB_MULTA_SANCIONADO MSAN
  ON MSAN.ID_MULTA_DETAL              = MDET.ID_MULTA_DETAL
  AND MSAN.ESTADO                     = ' ||
            SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO || '
  AND MSAN.FLG_PRINCIPAL              = ''1''
  AND NVL(MSAN.COD_TIPO_PERSONA, ''1'') = ''1''
  INNER JOIN T_SCOB_PERSONA PERS
  ON PERS.ID_PERSONA = MSAN.ID_PERSONA
  INNER JOIN T_SCOB_ORGANO_RESOLUTIVO ORGA
  ON ORGA.ID_ORGANO_RESOLUTIVO = MDET.ID_ORGANO_RESOLUTIVO
  INNER JOIN T_SCOB_EST_EXP_COB ESEC
  ON ESEC.CODIGO = EXPE.ESTADO_EXPEDIENTE
  INNER JOIN t_Scob_Est_Exp_Cob_Motivo MOTI
  ON MOTI.ID_EST_EXP_COB = EXPE.ESTADO_EXPEDIENTE
  AND MOTI.ID_MOTIVO     = EXPE.ID_MOTIVO
  LEFT JOIN T_SCOB_MULTA_ANTIDUMPING MUAN
  ON MUAN.ID_MULTA = MDET.ID_MULTA
  LEFT JOIN T_SCOB_TABLA_DET MRES
  ON MRES.ID_TABLA                   = ' ||
            SCOB_PK_CONSTANTES.C_TBL_TIPO_RESP_MULTA_OR || '
  AND LTRIM(RTRIM(MRES.COD_INTERNO)) = LTRIM(RTRIM(MULT.FLG_TIPO_MULTA))
  LEFT JOIN
    (SELECT EXDO.ID_EXPEDIENTE            AS ID_EXPEDIENTE,
      COUNT(EXDO.ID_EXPEDIENTE_DOCUMENTO) AS NRO_DOCS
    FROM T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
    WHERE COD_GENERADOR_DOCUMENTO IS NOT NULL
    AND EXDO.ESTADO                = ''1''
      /*
      AND EXDO.TIPO_DOC_ASOC IN (
      SCOB_PK_CONSTANTES.C_TIPO_DOC_ASOC_SISTEMA,
      SCOB_PK_CONSTANTES.C_TIPO_DOC_ASOC_SISTEMA_ACT
      )
      */
    GROUP BY EXDO.ID_EXPEDIENTE
    ) DOCS
  ON DOCS.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
  LEFT JOIN
    (SELECT EXDI.ID_EXPEDIENTE          AS ID_EXPEDIENTE,
      COUNT(EXDI.ID_EXPEDIENTE_PERSONA) AS FLG_DIR
    FROM T_SCOB_EXPEDIENTE_PERSONA EXDI
    WHERE EXDI.ESTADO         = ' ||
            SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO || '
    AND EXDI.COD_TIPO_ENTIDAD = ' ||
            SCOB_PK_CONSTANTES.C_COD_ENTIDAD_PERSONA ||
            ' --PERSONAS
    GROUP BY EXDI.ID_EXPEDIENTE
    HAVING COUNT(EXDI.ID_EXPEDIENTE_PERSONA) > 0
    ) DIREC
  ON DIREC.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
  LEFT JOIN T_SCOB_MULTA_ARCHIVO_CENTRAL MULTA_ARCH
  ON MULTA_ARCH.ID_MULTA    = MDET.ID_MULTA
  AND MULTA_ARCH.FLG_ACTUAL = ''1''
  LEFT JOIN T_SCOB_ARCHIVO_CENTRAL ARCH_CEN
  ON ARCH_CEN.ID_ARCHIVO_CENTRAL = MULTA_ARCH.ID_ARCHIVO_CENTRAL
  LEFT JOIN
    (SELECT EMB.ID_EXPEDIENTE,
      COUNT(EMB.ID_EXPEDIENTE_EMBARGO) AS NRO_EMBARGOS
    FROM T_SCOB_EXPED_EMBARGO EMB
    WHERE EMB.ESTADO           = ' ||
            SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO || '
    AND EMB.COD_ESTADO_EMBARGO = ' ||
            SCOB_PK_CONSTANTES.C_EST_SOLIC_EMB_PENDIENTE || ' --EMBARGOS PENDIENTES.
    GROUP BY EMB.ID_EXPEDIENTE
    ) EXPE_EMB
  ON EXPE_EMB.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
  LEFT JOIN T_SCOB_AREA_COBRANZA ACOB
  ON ACOB.ID_AREA_COBRANZA = MULT.ID_AREA_COBRANZA
  WHERE 1=1 ';
    IF PI_C_DPTO IS NOT NULL THEN
      V_A2 := V_A2 || ' AND (NVL(''' || PI_C_DPTO ||
              ''', '' '') = '' '' OR (NVL(''' || PI_C_DPTO ||
              ''', '' '') <> '' '' AND TRIM(ORGA.COD_DPTO) = TRIM(''' ||
              PI_C_DPTO || ''')))';
    END IF;
    IF PI_C_PROV IS NOT NULL THEN
      V_A2 := V_A2 || ' AND (NVL(''' || PI_C_PROV ||
              ''', '' '') = '' '' OR (NVL(''' || PI_C_PROV ||
              ''', '' '') <> '' '' AND TRIM(ORGA.COD_PROV) = TRIM(''' ||
              PI_C_PROV || ''')))';
    END IF;
    IF PI_C_DSTO IS NOT NULL THEN
      V_A2 := V_A2 || ' AND (NVL(''' || PI_C_DSTO ||
              ''', '' '') = '' '' OR (NVL(''' || PI_C_DSTO ||
              ''', '' '') <> '' '' AND TRIM(ORGA.COD_DIST) = TRIM(''' ||
              PI_C_DSTO || ''')))';
    END IF;
    IF PI_C_DSTO <> 0 THEN
      V_A2 := V_A2 || ' AND (NVL(' || PI_N_COD_MATERIA ||
              ', 0) = 0 OR (NVL(' || PI_N_COD_MATERIA ||
              ', 0) <> 0 AND MULT.ID_MATERIA = ' || PI_N_COD_MATERIA || '))';
    END IF;
    IF PI_V_ESTADO_EXPEDIENTE IS NOT NULL THEN
      V_A2 := V_A2 || ' AND (NVL(''' || PI_V_ESTADO_EXPEDIENTE ||
              ''', '' '')   = '' '' OR (NVL(''' || PI_V_ESTADO_EXPEDIENTE ||
              ''', '' '')   <> '' '' AND TRIM(EXPE.ESTADO_EXPEDIENTE) = TRIM(''' ||
              PI_V_ESTADO_EXPEDIENTE || ''')))';
    END IF;
    IF PI_N_COD_ORGANO_RESOL <> 0 THEN
      V_A2 := V_A2 || ' AND (NVL(' || PI_N_COD_ORGANO_RESOL ||
              ', 0) = 0 OR (NVL(' || PI_N_COD_ORGANO_RESOL ||
              ', 0) <> 0 AND ORGA.ID_ORGANO_RESOLUTIVO = ' ||
              PI_N_COD_ORGANO_RESOL || '))';
    END IF;
    IF PI_V_ESTADO_EXPEDIENTE IS NOT NULL THEN
      V_A2 := V_A2 || ' AND (NVL(''' || PI_V_ESTADO_EXPEDIENTE ||
              ''', '' '')   = '' '' OR (NVL(''' || PI_V_ESTADO_EXPEDIENTE ||
              ''', '' '')   <> '' '' AND TRIM(EXPE.ESTADO_EXPEDIENTE) = TRIM(''' ||
              PI_V_ESTADO_EXPEDIENTE || ''')))';
    END IF;
    IF PI_V_NRO_EXPEDIENTE_INI IS NOT NULL THEN
      V_A2 := V_A2 || ' AND ((NVL(''' || PI_V_NRO_EXPEDIENTE_INI ||
              ''', '' '') = '' '') OR (NVL(''' || PI_V_NRO_EXPEDIENTE_INI ||
              ''', '' '')  <> '' ''
      AND TO_NUMBER(EXPE.ANIO || TRIM(EXPE.NRO_EXPEDIENTE)) BETWEEN TO_NUMBER(TRIM(''' ||
              PI_V_NRO_EXPEDIENTE_INI || ''')) AND TO_NUMBER(TRIM(NVL(''' ||
              PI_V_NRO_EXPEDIENTE_FIN || ''', ''' ||
              PI_V_NRO_EXPEDIENTE_INI || ''')))))';
    END IF;
    IF PI_C_FEC_INI IS NOT NULL THEN
      V_A2 := V_A2 || ' AND ((NVL(''' || PI_C_FEC_INI ||
              ''', '' '') = '' '') OR (NVL(''' || PI_C_FEC_INI ||
              ''', '' '')  <> '' '' AND TO_DATE(TO_CHAR(EXPE.AUDFECCREACION, ''DD/MM/YYYY''), ''DD/MM/YYYY'') BETWEEN TO_DATE(''' ||
              PI_C_FEC_INI || ''', ''DD/MM/YYYY'') AND TO_DATE(''' ||
              PI_C_FEC_FIN || ''', ''DD/MM/YYYY'')))';
    END IF;
    IF PI_C_FEC_ASI_INI IS NOT NULL THEN
      ---NVO FECHA ASIGNACION
      V_A2 := V_A2 || ' AND ((NVL(''' || PI_C_FEC_ASI_INI ||
              ''', '' '') = '' '') OR (NVL(''' || PI_C_FEC_ASI_INI ||
              ''', '' '')  <> '' '' AND TO_DATE(TO_CHAR(MULT.FECHA_ASIG_COBRANZA, ''DD/MM/YYYY''), ''DD/MM/YYYY'') BETWEEN TO_DATE(''' ||
              PI_C_FEC_ASI_INI || ''', ''DD/MM/YYYY'') AND TO_DATE(''' ||
              PI_C_FEC_ASI_FIN || ''', ''DD/MM/YYYY'')))';
    END IF;
    IF PI_N_SALDO_INI <> 0 THEN
      V_A2 := V_A2 || ' AND ((NVL(' || PI_N_SALDO_INI ||
              ', 0) = 0) OR (NVL(' || PI_N_SALDO_INI ||
              ', 0)  <> 0 AND EXPE.SALDO BETWEEN ' || PI_N_SALDO_INI ||
              ' AND ' || PI_N_SALDO_FIN || '))';
    END IF;
    IF PI_N_ID_USUARIO <> 0 THEN
      --EXPE.ID_USUARIO_INGRESO = '||PI_N_ID_USUARIO||') --COMENTADO POR OBS 202 - 13.02.2012
      V_A2 := V_A2 || ' AND (NVL(' || PI_N_ID_USUARIO || ', 0) = 0 OR NVL(' ||
              PI_N_ID_USUARIO ||
              ', 0)  <> 0 AND MULT.ID_USUARIO_ASIG_COBRANZA = ' ||
              PI_N_ID_USUARIO || ')';
    END IF;
    V_A2 := V_A2 || ' AND ((NVL(''' || PI_C_EVENTO ||
            ''', '' '') = '' '') OR (''' || PI_C_EVENTO ||
            ''' = 1
  AND EXPE.ESTADO_EXPEDIENTE = ' ||
            SCOB_PK_CONSTANTES.C_TBL_EST_EXP_PRECOACTIVO || ')
  OR (''' || PI_C_EVENTO || ''' = 2
  AND (EXPE.ID_EXPEDIENTE   IS NOT NULL)))
  AND (''' || C_ESTADO || ''' = ''*''
  OR ( ''' || C_ESTADO || ''' <> ''*''
  AND EXPE.ESTADO = ''' || C_ESTADO ||
            '''))
  GROUP BY EXPE.ID_EXPEDIENTE
  ) A2 ON A1.ID_EXPEDIENTE=A2.ID_EXPEDIENTE';
    --
    SELECT (V_SELECT || V_A1 || V_A2) INTO V_QUERY FROM DUAL;
    --
    -- DBMS_OUTPUT.ENABLE (buffer_size => NULL);
    -- DBMS_OUTPUT.PUT_LINE('DATA:'|| V_QUERY);
  
    /*DBMS_OUTPUT.PUT_LINE('PI_C_DPTO:'|| PI_C_DPTO);
    DBMS_OUTPUT.PUT_LINE('PI_C_PROV:'|| PI_C_PROV);
    DBMS_OUTPUT.PUT_LINE('PI_C_DSTO:'|| PI_C_DSTO);
    DBMS_OUTPUT.PUT_LINE('PI_N_COD_MATERIA:'|| PI_N_COD_MATERIA);
    DBMS_OUTPUT.PUT_LINE('PI_V_ESTADO_EXPEDIENTE:'|| PI_V_ESTADO_EXPEDIENTE);
    DBMS_OUTPUT.PUT_LINE('PI_N_COD_ORGANO_RESOL:'|| PI_N_COD_ORGANO_RESOL);
    DBMS_OUTPUT.PUT_LINE('PI_V_NRO_EXPEDIENTE_INI:'|| PI_V_NRO_EXPEDIENTE_INI);
    DBMS_OUTPUT.PUT_LINE('PI_V_NRO_EXPEDIENTE_FIN:'|| PI_V_NRO_EXPEDIENTE_FIN);
    DBMS_OUTPUT.PUT_LINE('PI_C_FEC_INI:'|| PI_C_FEC_INI);
    DBMS_OUTPUT.PUT_LINE('PI_C_FEC_FIN:'|| PI_C_FEC_FIN);
    DBMS_OUTPUT.PUT_LINE('PI_C_FEC_INI:'|| PI_C_FEC_INI);
    DBMS_OUTPUT.PUT_LINE('PI_C_FEC_ASI_INI:'|| PI_C_FEC_ASI_INI);
    DBMS_OUTPUT.PUT_LINE('PI_C_FEC_ASI_FIN:'|| PI_C_FEC_ASI_FIN);
    DBMS_OUTPUT.PUT_LINE('PI_N_SALDO_INI:'|| PI_N_SALDO_INI);
    DBMS_OUTPUT.PUT_LINE('PI_N_SALDO_FIN:'|| PI_N_SALDO_FIN);
    DBMS_OUTPUT.PUT_LINE('PI_N_ID_USUARIO:'|| PI_N_ID_USUARIO);*/
  
    OPEN PO_CU_RETORNO FOR V_QUERY;
    --
    /*open po_cu_retorno for
           SELECT A1.ID_EXPEDIENTE,
      A1.COD_EXPEDIENTE,
      A1.NRO_EXPEDIENTE,
      A1.ANIO_EXPEDIENTE,
      A1.NRO_EXPED,
      A1.NRO_FILE_AEC,
      A1.TIPO_EXPEDIENTE,
      A1.NOM_SANCIONADO,
      A1.NUM_CUM,
      A1.NRO_LIQUIDACION,
      A1.GENERADO_POR ,
      A1.FEC_GENERADO_POR,
      A1.FEC_GENERADO_POR,
      A1.COD_ESTADO_EXPEDIENTE,
      A1.NOM_ESTADO_EXPEDIENTE,
      A1.COD_MOTIVO,
      A1.NOM_MOTIVO,
      A1.NRO_DOCS,
      A1.NRO_EMBARGOS,
      A1.FEC_ARCHIVO_CENTRAL,
      A1.FLG_DOMICILIO,
      A1.IND_CANCELADO ,
      A1.FLG_TIPO_MULTA_OR,
      A1.ESTADO_REGISTRO,
      A1.DES_ESTADO_REGISTRO,
      A1.DES_ORGA_RESOL,
      A1.NRO_FILE,
      A1.ANIO_FILE,
      A1.COD_AREA_COB,
      A1.IND_ANTIDUMPING,
      A1.ID_MULTA_DETAL,
      A1.COD_ESTADO_DEUDA,
      A1.EXPED_ASIGNADO_A,
      A1.COD_SANCIONADO,
      A1.NRO_CUMS,
      A1.ES_ACUM,
      A2.TIPO_CAMBIO,
      A2.MONTO_ANTIDUMPING,
      A2.MONTO_DA_INTERES,
      A2.MONTO_DA_INTERES_MORATORIO,
      A2.MONTO_TOTAL_DEUDA_DA,
      A2.UIT_VALOR,
      A2.UIT_MONTO,
      A2.MONTO_IC,
      A2.MONTO_IM,
      A2.MONTO_COSTAS,
      A2.MONTO_TOTAL_DEUDA,
      A2.TOTAL_AMORTIZADO_UIT,
      A2.MONTO_AMORTIZADO_IC,
      A2.MONTO_AMORTIZADO_IM,
      A2.MONTO_AMORTIZADO_COSTAS,
      A2.MONTO_TOTAL_AMORTIZADO,
      A2.SALDO_UIT,
      A2.SALDO_INTERES_COMPENSATORIO,
      A2.SALDO_INTERES_MORATORIO,
      A2.SALDO_COSTAS,
      A2.SALDO_TOTAL
    FROM
      (SELECT EXPE.ID_EXPEDIENTE,
        EXPE.ID_EXPEDIENTE  AS COD_EXPEDIENTE,
        EXPE.NRO_EXPEDIENTE AS NRO_EXPEDIENTE,
        EXPE.ANIO           AS ANIO_EXPEDIENTE,
        -- CUM ALFA
        EXPE.ANIO
        || EXPE.NRO_EXPEDIENTE AS NRO_EXPED,
        MULT.NRO_FILE_AEC      AS NRO_FILE_AEC,
        MRES.TXT_DESCRIPCION   AS TIPO_EXPEDIENTE,
        DECODE(EXPE.FLG_TIPO_EXPEDIENTE, '1', DECODE(PERS.TIPO_PERSONA, 2, PERS.RAZON_SOCIAL, PERS.APE_PATERNO
        || ' '
        || PERS.APE_MATERNO
        || ' '
        || PERS.PRI_NOMBRE
        || ' '
        || PERS.SEG_NOMBRE
        || ' '
        || PERS.APE_CASADA), SCOB_PK_EXPEDIENTE.SCOB_FN_SANCIONADOS_EXPED(EXPE.ID_EXPEDIENTE)) AS NOM_SANCIONADO,
        MULT.ANIO
        || MULT.CUM AS NUM_CUM,
        DECODE(NVL(MUAN.NRO_LIQUIDACION_CODIGO, ' '), ' ', NULL, MUAN.NRO_LIQUIDACION_CODIGO
        || '-'
        || MUAN.NRO_LIQUIDACION_ANIO
        || '/'
        || MUAN.NRO_LIQUIDACION_CORRELATIVO) AS NRO_LIQUIDACION,
        -- DATOS DEL EXPEDIENTE
        EXPE.AUDUSUCREACION    AS GENERADO_POR,
        EXPE.AUDFECCREACION    AS FEC_GENERADO_POR,
        EXPE.ESTADO_EXPEDIENTE AS COD_ESTADO_EXPEDIENTE,
        ESEC.DESCRIPCION       AS NOM_ESTADO_EXPEDIENTE,
        EXPE.ID_MOTIVO         AS COD_MOTIVO,
        MOTI.DESCRIPCION       AS NOM_MOTIVO,
        --------------------------------------------------------------------------------
        NVL(DOCS.NRO_DOCS, 0)                                     AS NRO_DOCS,
        NVL(EXPE_EMB.NRO_EMBARGOS, 0)                             AS NRO_EMBARGOS,
        ARCH_CEN.FEC_ENVIO                                        AS FEC_ARCHIVO_CENTRAL,
        DECODE(NVL(DIREC.FLG_DIR, 0), 0, '0', '1')                AS FLG_DOMICILIO,
        NVL(EXPE.FLG_CANCELADO, '0')                              AS IND_CANCELADO,
        MULT.Flg_Multa_Resolutivo                                 AS FLG_TIPO_MULTA_OR,
        EXPE.ESTADO                                               AS ESTADO_REGISTRO,
        SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(19, EXPE.ESTADO) AS DES_ESTADO_REGISTRO,
        ORGA.DESCRIPCION                                          AS DES_ORGA_RESOL,
        MULT.NRO_FILE_AEC                                         AS NRO_FILE,
        MULT.ANIO_FILE_AEC                                        AS ANIO_FILE,
        ACOB.CODIGO                                               AS COD_AREA_COB,
        DECODE(MUAN.ID_MULTA_ANTIDUMPING, NULL, '0', '1')         AS IND_ANTIDUMPING,
        MDET.ID_MULTA_DETAL                                       AS ID_MULTA_DETAL,
        MULT.COD_ESTADO_PAGO                                      AS COD_ESTADO_DEUDA, --3=Pago Total
        --3 AS COD_ESTADO_DEUDA --3=Pago Total
        USU.PRI_NOMBRE
        || ' '
        || USU.APE_PATERNO
        || ' '
        || USU.APE_MATERNO AS EXPED_ASIGNADO_A, --EJECUTOR COACTIVO RESPONSABLE 2013.02.12
        --
        DECODE(EXPE.FLG_TIPO_EXPEDIENTE, '1', PERS.COD_SANCIONADO, '0') AS COD_SANCIONADO,
        --
        EXPE.NRO_CUMS AS NRO_CUMS,
        --
        SCOB_PK_EXPEDIENTE.SCOB_FN_ES_ACUM(EXPE.ID_EXPEDIENTE) AS ES_ACUM
      FROM T_SCOB_EXPEDIENTE EXPE
      INNER JOIN T_SCOB_EXPEDIENTE_MULTA EXMU
      ON EXMU.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
      AND EXMU.ESTADO       = DECODE(1, '*', EXMU.ESTADO, 1)
      INNER JOIN T_SCOB_MULTA MULT
      ON MULT.ID_MULTA = EXMU.ID_MULTA
      LEFT JOIN T_SCOB_USUARIO USU
      ON USU.ID_USUARIO = MULT.ID_USUARIO_ASIG_COBRANZA
        --SANCIONADO
      INNER JOIN
        (SELECT MDET.ID_MULTA  AS ID_MULTA,
          COUNT(MDET.ID_MULTA) AS NRO_MULTAS
        FROM T_SCOB_MULTA_DETAL MDET
        INNER JOIN T_SCOB_MULTA_SANCIONADO SANC
        ON SANC.ID_MULTA_DETAL              = MDET.ID_MULTA_DETAL
        AND NVL(SANC.COD_TIPO_PERSONA, '1') = '1'
        AND SANC.ESTADO                     = '1'
        INNER JOIN T_SCOB_PERSONA PERS
        ON PERS.ID_PERSONA    = SANC.ID_PERSONA
        WHERE MDET.FLG_ACTUAL = '1'
        AND MDET.ESTADO       = '1'
          AND (NVL(0, 0) = 0 OR (NVL(0, 0) <> 0 AND PERS.TIPO_PERSONA  = 0))
          AND (NVL(0, 0) = 0 OR (NVL(0, 0) <> 0 AND PERS.TIPO_DOC      = 0))
          AND (NVL('', ' ') = ' ' OR (NVL('', ' ') <> ' ' AND TRIM(PERS.NRO_DOC) = TRIM('')))
          AND (NVL('', ' ') = ' ' OR (NVL('', ' ') <> ' ' AND fun_scob_nosensite(TRIM(PERS.APE_PATERNO)) LIKE '%' || fun_scob_nosensite(TRIM('')) || '%'))
          AND (NVL('', ' ') = ' ' OR (NVL('', ' ') <> ' ' AND fun_scob_nosensite(TRIM(PERS.APE_MATERNO)) LIKE '%' || fun_scob_nosensite(TRIM('')) || '%'))
          AND (NVL('', ' ') = ' ' OR (NVL('', ' ') <> ' ' AND fun_scob_nosensite(TRIM(PERS.PRI_NOMBRE)) LIKE '%' || fun_scob_nosensite(TRIM('')) || '%'))
          AND (NVL('', ' ') = ' ' OR (NVL('', ' ') <> ' ' AND fun_scob_nosensite(TRIM(PERS.SEG_NOMBRE)) LIKE '%' || fun_scob_nosensite(TRIM('')) || '%'))
          AND (NVL('', ' ') = ' ' OR (NVL('', ' ') <> ' ' AND fun_scob_nosensite(TRIM(PERS.RAZON_SOCIAL)) LIKE '%' || fun_scob_nosensite(TRIM('')) || '%'))
          AND (NVL('', ' ') = ' ' OR (NVL('', ' ') <> ' ' AND fun_scob_nosensite(TRIM(PERS.NOMBRE_COMERCIAL)) LIKE '%' || fun_scob_nosensite(TRIM('')) || '%'))
        GROUP BY MDET.ID_MULTA
        ) MULTA_SANC ON MULTA_SANC.ID_MULTA = MULT.ID_MULTA
      INNER JOIN T_SCOB_MULTA_DETAL MDET
      ON MDET.ID_MULTA    = MULTA_SANC.ID_MULTA
      AND MDET.FLG_ACTUAL = '1'
      INNER JOIN T_SCOB_MULTA_SANCIONADO MSAN
      ON MSAN.ID_MULTA_DETAL              = MDET.ID_MULTA_DETAL
      AND MSAN.ESTADO                     = 1
      AND MSAN.FLG_PRINCIPAL              = '1'
      AND NVL(MSAN.COD_TIPO_PERSONA, '1') = '1'
      INNER JOIN T_SCOB_PERSONA PERS
      ON PERS.ID_PERSONA = MSAN.ID_PERSONA
      INNER JOIN T_SCOB_ORGANO_RESOLUTIVO ORGA
      ON ORGA.ID_ORGANO_RESOLUTIVO = MDET.ID_ORGANO_RESOLUTIVO
      INNER JOIN T_SCOB_EST_EXP_COB ESEC
      ON ESEC.CODIGO = EXPE.ESTADO_EXPEDIENTE
      INNER JOIN t_Scob_Est_Exp_Cob_Motivo MOTI
      ON MOTI.ID_EST_EXP_COB = EXPE.ESTADO_EXPEDIENTE
      AND MOTI.ID_MOTIVO     = EXPE.ID_MOTIVO
      LEFT JOIN T_SCOB_MULTA_ANTIDUMPING MUAN
      ON MUAN.ID_MULTA = MDET.ID_MULTA
      LEFT JOIN T_SCOB_TABLA_DET MRES
      ON MRES.ID_TABLA                   = 15
      AND LTRIM(RTRIM(MRES.COD_INTERNO)) = LTRIM(RTRIM(MULT.FLG_TIPO_MULTA))
      LEFT JOIN
        (SELECT EXDO.ID_EXPEDIENTE            AS ID_EXPEDIENTE,
          COUNT(EXDO.ID_EXPEDIENTE_DOCUMENTO) AS NRO_DOCS
        FROM T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
        WHERE COD_GENERADOR_DOCUMENTO IS NOT NULL
        AND EXDO.ESTADO                = '1'
    
        GROUP BY EXDO.ID_EXPEDIENTE
        ) DOCS
      ON DOCS.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
      LEFT JOIN
        (SELECT EXDI.ID_EXPEDIENTE          AS ID_EXPEDIENTE,
          COUNT(EXDI.ID_EXPEDIENTE_PERSONA) AS FLG_DIR
        FROM T_SCOB_EXPEDIENTE_PERSONA EXDI
        WHERE EXDI.ESTADO         = 1
        AND EXDI.COD_TIPO_ENTIDAD = 1 --PERSONAS
        GROUP BY EXDI.ID_EXPEDIENTE
        HAVING COUNT(EXDI.ID_EXPEDIENTE_PERSONA) > 0
        ) DIREC
      ON DIREC.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
      LEFT JOIN T_SCOB_MULTA_ARCHIVO_CENTRAL MULTA_ARCH
      ON MULTA_ARCH.ID_MULTA    = MDET.ID_MULTA
      AND MULTA_ARCH.FLG_ACTUAL = '1'
      LEFT JOIN T_SCOB_ARCHIVO_CENTRAL ARCH_CEN
      ON ARCH_CEN.ID_ARCHIVO_CENTRAL = MULTA_ARCH.ID_ARCHIVO_CENTRAL
      LEFT JOIN
        (SELECT EMB.ID_EXPEDIENTE,
          COUNT(EMB.ID_EXPEDIENTE_EMBARGO) AS NRO_EMBARGOS
        FROM T_SCOB_EXPED_EMBARGO EMB
        WHERE EMB.ESTADO           = 1
        AND EMB.COD_ESTADO_EMBARGO = 1 --EMBARGOS PENDIENTES.
        GROUP BY EMB.ID_EXPEDIENTE
        ) EXPE_EMB
      ON EXPE_EMB.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
      LEFT JOIN T_SCOB_AREA_COBRANZA ACOB
      ON ACOB.ID_AREA_COBRANZA = MULT.ID_AREA_COBRANZA
      WHERE
        ----------
        (NVL('', ' ') = ' ' OR (NVL('', ' ') <> ' ' AND TRIM(ORGA.COD_DPTO) = TRIM('')))
        AND (NVL('', ' ') = ' ' OR (NVL('', ' ') <> ' ' AND TRIM(ORGA.COD_PROV) = TRIM('')))
        AND (NVL('', ' ') = ' ' OR (NVL('', ' ') <> ' ' AND TRIM(ORGA.COD_DIST) = TRIM('')))
        AND (NVL(0, 0) = 0 OR (NVL(0, 0) <> 0 AND MULT.ID_MATERIA     = 0))
        ----------
        AND (NVL('', ' ') = ' ' OR (NVL('', ' ') <> ' ' AND TRIM(EXPE.ESTADO_EXPEDIENTE) = TRIM('')))
        AND (NVL(0, 0) = 0 OR (NVL(0, 0) <> 0 AND ORGA.ID_ORGANO_RESOLUTIVO    = 0))
        AND ((NVL('', ' ') = ' ') OR (NVL('', ' ') <> ' ' AND TO_NUMBER(EXPE.ANIO || TRIM(EXPE.NRO_EXPEDIENTE)) BETWEEN TO_NUMBER(TRIM('')) AND TO_NUMBER(TRIM(NVL('', '')))))
        AND ((NVL('', ' ') = ' ') OR (NVL('', ' ')  <> ' ' AND TO_DATE(TO_CHAR(EXPE.AUDFECCREACION, 'DD/MM/YYYY'), 'DD/MM/YYYY') BETWEEN TO_DATE('', 'DD/MM/YYYY') AND TO_DATE('', 'DD/MM/YYYY')))
        ---NVO FECHA ASIGNACION
        AND ((NVL('', ' ') = ' ') OR (NVL('', ' ')  <> ' ' AND TO_DATE(TO_CHAR(MULT.FECHA_ASIG_COBRANZA, 'DD/MM/YYYY'), 'DD/MM/YYYY') BETWEEN TO_DATE('', 'DD/MM/YYYY') AND TO_DATE('', 'DD/MM/YYYY')))
        -------------------
        AND ((NVL(0, 0) = 0) OR (NVL(0, 0)  <> 0 AND EXPE.SALDO BETWEEN 0 AND 0))
        AND
        (NVL(46, 0)  = 0
      OR NVL(46, 0) <> 0
      AND
        --EXPE.ID_USUARIO_INGRESO = 46) --COMENTADO POR OBS 202 - 13.02.2012
        MULT.ID_USUARIO_ASIG_COBRANZA = 46)
        -----------------------------------------------
        --EN LA BANDEJAS,
        -----------------------------------------------
      AND ((NVL(2, ' ') = ' ')
        --OPCION: GENERAR EXPEDIENTES
      OR (2                      = 1
      AND EXPE.ESTADO_EXPEDIENTE = SCOB_PK_CONSTANTES.C_TBL_EST_EXP_PRECOACTIVO)
      OR (2                      = 2
      AND (EXPE.ID_EXPEDIENTE   IS NOT NULL)))
      AND ('1'                   = '*'
      OR ( '1'                  <> '*'
      AND EXPE.ESTADO            = '1'))
      AND MULT.ID_MULTA          = SCOB_PK_EXPEDIENTE.SCOB_FN_MUL_ANTIGUO(EXPE.ID_EXPEDIENTE)
      ) A1
    LEFT JOIN
      (SELECT EXPE.ID_EXPEDIENTE,
        --montos deuda antidumping
        SUM(MUAN.TIPO_CAMBIO)             AS TIPO_CAMBIO,
        SUM(MUAN.MONTO_ANTIDUMPING)       AS MONTO_ANTIDUMPING,
        SUM(MUAN.MONTO_INTERES)           AS MONTO_DA_INTERES,
        SUM(MUAN.MONTO_INTERES_MORATORIO) AS MONTO_DA_INTERES_MORATORIO,
        SUM(MUAN.MONTO_TOTAL)             AS MONTO_TOTAL_DEUDA_DA,
        --montos deuda uit
        SUM(MDET.VALOR_UIT)               AS UIT_VALOR,
        SUM(MULT.MONTO_UIT)               AS UIT_MONTO,
        SUM(MULT.MONTO_INTERES)           AS MONTO_IC,
        SUM(MULT.MONTO_INTERES_MORATORIO) AS MONTO_IM,
        SUM(MULT.MONTO_COSTAS)            AS MONTO_COSTAS,
        SUM(MULT.MONTO_TOTAL_DEUDA)       AS MONTO_TOTAL_DEUDA,
        --montos amortizado
        SUM(MULT.TOTAL_AMORTIZADO)         AS TOTAL_AMORTIZADO_UIT,
        SUM(MULT.TOTAL_AMORTIZADO_IC)      AS MONTO_AMORTIZADO_IC,
        SUM(MULT.TOTAL_AMORTIZADO_IM)      AS MONTO_AMORTIZADO_IM,
        SUM(MULT.TOTAL_AMORTIZADO_COSTAS)  AS MONTO_AMORTIZADO_COSTAS,
        SUM(MULT.TOTAL_AMORTIZACION_DEUDA) AS MONTO_TOTAL_AMORTIZADO,
        --montos_saldo
        SUM(EXPE.SALDO)             AS SALDO_UIT,
        SUM(EXPE.SALDO_IC)          AS SALDO_INTERES_COMPENSATORIO,
        SUM(EXPE.SALDO_IM)          AS SALDO_INTERES_MORATORIO,
        SUM(EXPE.SALDO_COSTAS)      AS SALDO_COSTAS,
        SUM(EXPE.SALDO_TOTAL_DEUDA) AS SALDO_TOTAL
      FROM T_SCOB_EXPEDIENTE EXPE
      INNER JOIN T_SCOB_EXPEDIENTE_MULTA EXMU
      ON EXMU.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
      AND EXMU.ESTADO       = DECODE(1, '*', EXMU.ESTADO, 1)
      INNER JOIN T_SCOB_MULTA MULT
      ON MULT.ID_MULTA = EXMU.ID_MULTA
      LEFT JOIN T_SCOB_USUARIO USU
      ON USU.ID_USUARIO = MULT.ID_USUARIO_ASIG_COBRANZA
        --SANCIONADO
      INNER JOIN
        (SELECT MDET.ID_MULTA  AS ID_MULTA,
          COUNT(MDET.ID_MULTA) AS NRO_MULTAS
        FROM T_SCOB_MULTA_DETAL MDET
        INNER JOIN T_SCOB_MULTA_SANCIONADO SANC
        ON SANC.ID_MULTA_DETAL              = MDET.ID_MULTA_DETAL
        AND NVL(SANC.COD_TIPO_PERSONA, '1') = '1'
        AND SANC.ESTADO                     = '1'
        INNER JOIN T_SCOB_PERSONA PERS
        ON PERS.ID_PERSONA    = SANC.ID_PERSONA
        WHERE MDET.FLG_ACTUAL = '1'
        AND MDET.ESTADO       = '1'
          AND (NVL(0, 0)         = 0 OR (NVL(0, 0)         <> 0 AND PERS.TIPO_PERSONA  = 0))
          AND (NVL(0, 0)         = 0 OR (NVL(0, 0)         <> 0 AND PERS.TIPO_DOC      = 0))
          AND (NVL('', ' ')      = ' ' OR (NVL('', ' ')      <> ' ' AND TRIM(PERS.NRO_DOC) = TRIM('')))
          AND (NVL('', ' ')      = ' ' OR (NVL('', ' ')      <> ' ' AND fun_scob_nosensite(TRIM(PERS.APE_PATERNO)) LIKE '%' || fun_scob_nosensite(TRIM('')) || '%'))
          AND (NVL('', ' ') = ' ' OR (NVL('', ' ') <> ' ' AND fun_scob_nosensite(TRIM(PERS.APE_MATERNO)) LIKE '%' || fun_scob_nosensite(TRIM('')) || '%'))
          AND (NVL('', ' ') = ' ' OR (NVL('', ' ') <> ' ' AND fun_scob_nosensite(TRIM(PERS.PRI_NOMBRE)) LIKE '%' || fun_scob_nosensite(TRIM('')) || '%'))
          AND (NVL('', ' ') = ' ' OR (NVL('', ' ') <> ' ' AND fun_scob_nosensite(TRIM(PERS.SEG_NOMBRE)) LIKE '%' || fun_scob_nosensite(TRIM('')) || '%'))
          AND (NVL('', ' ') = ' ' OR (NVL('', ' ') <> ' ' AND fun_scob_nosensite(TRIM(PERS.RAZON_SOCIAL)) LIKE '%' || fun_scob_nosensite(TRIM('')) || '%'))
          AND (NVL('', ' ') = ' ' OR (NVL('', ' ') <> ' ' AND fun_scob_nosensite(TRIM(PERS.NOMBRE_COMERCIAL)) LIKE '%' || fun_scob_nosensite(TRIM('')) || '%'))
        GROUP BY MDET.ID_MULTA
        ) MULTA_SANC ON MULTA_SANC.ID_MULTA = MULT.ID_MULTA
      INNER JOIN T_SCOB_MULTA_DETAL MDET
      ON MDET.ID_MULTA    = MULTA_SANC.ID_MULTA
      AND MDET.FLG_ACTUAL = '1'
      INNER JOIN T_SCOB_MULTA_SANCIONADO MSAN
      ON MSAN.ID_MULTA_DETAL              = MDET.ID_MULTA_DETAL
      AND MSAN.ESTADO                     = 1
      AND MSAN.FLG_PRINCIPAL              = '1'
      AND NVL(MSAN.COD_TIPO_PERSONA, '1') = '1'
      INNER JOIN T_SCOB_PERSONA PERS
      ON PERS.ID_PERSONA = MSAN.ID_PERSONA
      INNER JOIN T_SCOB_ORGANO_RESOLUTIVO ORGA
      ON ORGA.ID_ORGANO_RESOLUTIVO = MDET.ID_ORGANO_RESOLUTIVO
      INNER JOIN T_SCOB_EST_EXP_COB ESEC
      ON ESEC.CODIGO = EXPE.ESTADO_EXPEDIENTE
      INNER JOIN t_Scob_Est_Exp_Cob_Motivo MOTI
      ON MOTI.ID_EST_EXP_COB = EXPE.ESTADO_EXPEDIENTE
      AND MOTI.ID_MOTIVO     = EXPE.ID_MOTIVO
      LEFT JOIN T_SCOB_MULTA_ANTIDUMPING MUAN
      ON MUAN.ID_MULTA = MDET.ID_MULTA
      LEFT JOIN T_SCOB_TABLA_DET MRES
      ON MRES.ID_TABLA                   = 15
      AND LTRIM(RTRIM(MRES.COD_INTERNO)) = LTRIM(RTRIM(MULT.FLG_TIPO_MULTA))
      LEFT JOIN
        (SELECT EXDO.ID_EXPEDIENTE            AS ID_EXPEDIENTE,
          COUNT(EXDO.ID_EXPEDIENTE_DOCUMENTO) AS NRO_DOCS
        FROM T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
        WHERE COD_GENERADOR_DOCUMENTO IS NOT NULL
        AND EXDO.ESTADO                = '1'
    
        GROUP BY EXDO.ID_EXPEDIENTE
        ) DOCS
      ON DOCS.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
      LEFT JOIN
        (SELECT EXDI.ID_EXPEDIENTE          AS ID_EXPEDIENTE,
          COUNT(EXDI.ID_EXPEDIENTE_PERSONA) AS FLG_DIR
        FROM T_SCOB_EXPEDIENTE_PERSONA EXDI
        WHERE EXDI.ESTADO         = 1
        AND EXDI.COD_TIPO_ENTIDAD = 1 --PERSONAS
        GROUP BY EXDI.ID_EXPEDIENTE
        HAVING COUNT(EXDI.ID_EXPEDIENTE_PERSONA) > 0
        ) DIREC
      ON DIREC.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
      LEFT JOIN T_SCOB_MULTA_ARCHIVO_CENTRAL MULTA_ARCH
      ON MULTA_ARCH.ID_MULTA    = MDET.ID_MULTA
      AND MULTA_ARCH.FLG_ACTUAL = '1'
      LEFT JOIN T_SCOB_ARCHIVO_CENTRAL ARCH_CEN
      ON ARCH_CEN.ID_ARCHIVO_CENTRAL = MULTA_ARCH.ID_ARCHIVO_CENTRAL
      LEFT JOIN
        (SELECT EMB.ID_EXPEDIENTE,
          COUNT(EMB.ID_EXPEDIENTE_EMBARGO) AS NRO_EMBARGOS
        FROM T_SCOB_EXPED_EMBARGO EMB
        WHERE EMB.ESTADO           = 1
        AND EMB.COD_ESTADO_EMBARGO = 1 --EMBARGOS PENDIENTES.
        GROUP BY EMB.ID_EXPEDIENTE
        ) EXPE_EMB
      ON EXPE_EMB.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
      LEFT JOIN T_SCOB_AREA_COBRANZA ACOB
      ON ACOB.ID_AREA_COBRANZA = MULT.ID_AREA_COBRANZA
      WHERE
        ----------
        (NVL('', ' ')         = ' ' OR (NVL('', ' ')       <> ' ' AND TRIM(ORGA.COD_DPTO) = TRIM('')))
        AND (NVL('', ' ')       = ' ' OR (NVL('', ' ')       <> ' ' AND TRIM(ORGA.COD_PROV) = TRIM('')))
        AND (NVL('', ' ')       = ' ' OR (NVL('', ' ')       <> ' ' AND TRIM(ORGA.COD_DIST) = TRIM('')))
        AND (NVL(0, 0)          = 0 OR (NVL(0, 0)          <> 0 AND MULT.ID_MATERIA     = 0))
        ----------
        AND (NVL('', ' ')                = ' ' OR (NVL('', ' ')                <> ' ' AND TRIM(EXPE.ESTADO_EXPEDIENTE) = TRIM('')))
        AND (NVL(0, 0)                   = 0 OR (NVL(0, 0)                   <> 0 AND ORGA.ID_ORGANO_RESOLUTIVO    = 0))
        AND ((NVL('', ' ')               = ' ') OR (NVL('', ' ')                <> ' ' AND TO_NUMBER(EXPE.ANIO || TRIM(EXPE.NRO_EXPEDIENTE)) BETWEEN TO_NUMBER(TRIM('')) AND TO_NUMBER(TRIM(NVL('', '')))))
        AND ((NVL('', ' ') = ' ') OR (NVL('', ' ')  <> ' ' AND TO_DATE(TO_CHAR(EXPE.AUDFECCREACION, 'DD/MM/YYYY'), 'DD/MM/YYYY') BETWEEN TO_DATE('', 'DD/MM/YYYY') AND TO_DATE('', 'DD/MM/YYYY')))
        ---NVO FECHA ASIGNACION
        AND ((NVL('', ' ') = ' ') OR (NVL('', ' ')  <> ' ' AND TO_DATE(TO_CHAR(MULT.FECHA_ASIG_COBRANZA, 'DD/MM/YYYY'), 'DD/MM/YYYY') BETWEEN TO_DATE('', 'DD/MM/YYYY') AND TO_DATE('', 'DD/MM/YYYY')))
        -------------------
        AND ((NVL(0, 0) = 0) OR (NVL(0, 0)  <> 0 AND EXPE.SALDO BETWEEN 0 AND 0))
        AND
        (NVL(46, 0)  = 0
      OR NVL(46, 0) <> 0
      AND
        --EXPE.ID_USUARIO_INGRESO = 46) --COMENTADO POR OBS 202 - 13.02.2012
        MULT.ID_USUARIO_ASIG_COBRANZA = 46)
        -----------------------------------------------
        --EN LA BANDEJAS,
        -----------------------------------------------
      AND ((NVL(2, ' ') = ' ')
        --OPCION: GENERAR EXPEDIENTES
      OR (2                      = 1
      AND EXPE.ESTADO_EXPEDIENTE = SCOB_PK_CONSTANTES.C_TBL_EST_EXP_PRECOACTIVO)
      OR (2                      = 2
      AND (EXPE.ID_EXPEDIENTE   IS NOT NULL)))
      AND ('1'                   = '*'
      OR ( '1'                  <> '*'
      AND EXPE.ESTADO            = '1'))
        --AND MULT.ID_MULTA          =SCOB_PK_EXPEDIENTE.SCOB_FN_MUL_ANTIGUO(EXPE.ID_EXPEDIENTE)
      GROUP BY EXPE.ID_EXPEDIENTE
      ) A2 ON A1.ID_EXPEDIENTE=A2.ID_EXPEDIENTE;*/
    --
    /*SELECT EXPE.ID_EXPEDIENTE AS COD_EXPEDIENTE,
           EXPE.NRO_EXPEDIENTE AS NRO_EXPEDIENTE,
           EXPE.ANIO AS ANIO_EXPEDIENTE,
           EXPE.ANIO || EXPE.NRO_EXPEDIENTE AS NRO_EXPED, --A?O+NRO
           --
           EXPE.ESTADO_EXPEDIENTE AS COD_ESTADO_EXPEDIENTE,
           ESEC.DESCRIPCION       AS NOM_ESTADO_EXPEDIENTE,
           EXPE.ID_MOTIVO         AS COD_MOTIVO,
           MOTI.DESCRIPCION       AS NOM_MOTIVO,
           --
           EXPE.AUDUSUCREACION AS GENERADO_POR,
           EXPE.AUDFECCREACION AS FEC_GENERADO_POR,
           --
           MRES.TXT_DESCRIPCION AS TIPO_EXPEDIENTE,
           DECODE(EXPE.FLG_TIPO_EXPEDIENTE, '1', PERS.COD_SANCIONADO, '0') AS COD_SANCIONADO,
           DECODE(EXPE.FLG_TIPO_EXPEDIENTE,
                  '1',
                  DECODE(PERS.TIPO_PERSONA,
                         SCOB_PK_CONSTANTES.C_TIPO_PERS_JURIDICA,
                         PERS.RAZON_SOCIAL,
                         PERS.APE_PATERNO || ' ' || PERS.APE_MATERNO || ' ' ||
                         PERS.PRI_NOMBRE || ' ' || PERS.SEG_NOMBRE || ' ' ||
                         PERS.APE_CASADA),
                  SCOB_FN_SANCIONADOS_EXPED(EXPE.ID_EXPEDIENTE)) AS NOM_SANCIONADO,
           --
           EXPE.NRO_CUMS AS NRO_CUMS,
           MULT.ANIO || MULT.CUM AS NUM_CUM,
           MULT.NRO_FILE_AEC AS NRO_FILE_AEC,
    
           --DATOS ANTIDUMPING --NUEVOS
           DECODE(NVL(MUAN.NRO_LIQUIDACION_CODIGO, ' '),
                  ' ',
                  NULL,
                  MUAN.NRO_LIQUIDACION_CODIGO || '-' ||
                  MUAN.NRO_LIQUIDACION_ANIO || '/' ||
                  MUAN.NRO_LIQUIDACION_CORRELATIVO) AS NRO_LIQUIDACION,
    
           --montos deuda antidumping
           MUAN.TIPO_CAMBIO             AS TIPO_CAMBIO,
           MUAN.MONTO_ANTIDUMPING       AS MONTO_ANTIDUMPING,
           MUAN.MONTO_INTERES           AS MONTO_DA_INTERES,
           MUAN.MONTO_INTERES_MORATORIO AS MONTO_DA_INTERES_MORATORIO,
           MUAN.MONTO_TOTAL             AS MONTO_TOTAL_DEUDA_DA,
    
           --montos deuda uit
           MDET.VALOR_UIT               AS UIT_VALOR,
           MULT.MONTO_UIT               AS UIT_MONTO,
           MULT.MONTO_INTERES           AS MONTO_IC,
           MULT.MONTO_INTERES_MORATORIO AS MONTO_IM,
           MULT.MONTO_COSTAS            AS MONTO_COSTAS,
           MULT.MONTO_TOTAL_DEUDA       AS MONTO_TOTAL_DEUDA,
    
           --montos amortizado
           MULT.TOTAL_AMORTIZADO         AS TOTAL_AMORTIZADO_UIT,
           MULT.TOTAL_AMORTIZADO_IC      AS MONTO_AMORTIZADO_IC,
           MULT.TOTAL_AMORTIZADO_IM      AS MONTO_AMORTIZADO_IM,
           MULT.TOTAL_AMORTIZADO_COSTAS  AS MONTO_AMORTIZADO_COSTAS,
           MULT.TOTAL_AMORTIZACION_DEUDA AS MONTO_TOTAL_AMORTIZADO,
    
           --montos_saldo
           EXPE.SALDO             AS SALDO_UIT,
           EXPE.SALDO_IC          AS SALDO_INTERES_COMPENSATORIO,
           EXPE.SALDO_IM          AS SALDO_INTERES_MORATORIO,
           EXPE.SALDO_COSTAS      AS SALDO_COSTAS,
           EXPE.SALDO_TOTAL_DEUDA AS SALDO_TOTAL,
           --------------------------------------------------------------------------------
    
           NVL(DOCS.NRO_DOCS, 0) AS NRO_DOCS,
           NVL(EXPE_EMB.NRO_EMBARGOS, 0) AS NRO_EMBARGOS,
           ARCH_CEN.FEC_ENVIO AS FEC_ARCHIVO_CENTRAL,
           DECODE(NVL(DIREC.FLG_DIR, 0), 0, '0', '1') AS FLG_DOMICILIO,
           NVL(EXPE.FLG_CANCELADO, '0') AS IND_CANCELADO,
           MULT.Flg_Multa_Resolutivo AS FLG_TIPO_MULTA_OR,
           EXPE.ESTADO as ESTADO_REGISTRO,
           SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_ESTADO_REGISTRO,
                                                    EXPE.ESTADO) as DES_ESTADO_REGISTRO,
           ORGA.DESCRIPCION AS DES_ORGA_RESOL,
           MULT.NRO_FILE_AEC AS NRO_FILE,
           MULT.ANIO_FILE_AEC AS ANIO_FILE,
           ACOB.CODIGO AS COD_AREA_COB,
           DECODE(MUAN.ID_MULTA_ANTIDUMPING, NULL, '0', '1') AS IND_ANTIDUMPING,
           MDET.ID_MULTA_DETAL AS ID_MULTA_DETAL,
           MULT.COD_ESTADO_PAGO AS COD_ESTADO_DEUDA, --3=Pago Total
           --3 AS COD_ESTADO_DEUDA --3=Pago Total
           USU.PRI_NOMBRE || ' ' || USU.APE_PATERNO || ' ' ||
           USU.APE_MATERNO AS EXPED_ASIGNADO_A, --EJECUTOR COACTIVO RESPONSABLE 2013.02.12
           SCOB_PK_EXPEDIENTE.SCOB_FN_ES_ACUM(EXPE.ID_EXPEDIENTE) ES_ACUM
      FROM T_SCOB_EXPEDIENTE EXPE
    
     INNER JOIN T_SCOB_EXPEDIENTE_MULTA EXMU ON EXMU.ID_EXPEDIENTE =
                                                EXPE.ID_EXPEDIENTE
                                            AND EXMU.ESTADO =
                                                DECODE(C_ESTADO,
                                                       '*',
                                                       EXMU.ESTADO,
                                                       PI_C_ESTADO)
    
     INNER JOIN T_SCOB_MULTA MULT ON MULT.ID_MULTA = EXMU.ID_MULTA
    
      LEFT JOIN T_SCOB_USUARIO USU ON USU.ID_USUARIO =
                                      MULT.ID_USUARIO_ASIG_COBRANZA
    
    --SANCIONADO
     INNER JOIN (SELECT MDET.ID_MULTA AS ID_MULTA,
                        COUNT(MDET.ID_MULTA) AS NRO_MULTAS
                   FROM T_SCOB_MULTA_DETAL MDET
                  INNER JOIN T_SCOB_MULTA_SANCIONADO SANC ON SANC.ID_MULTA_DETAL =
                                                             MDET.ID_MULTA_DETAL
                                                         AND NVL(SANC.COD_TIPO_PERSONA,
                                                                 '1') = '1'
                                                         AND SANC.ESTADO = '1'
                  INNER JOIN T_SCOB_PERSONA PERS ON PERS.ID_PERSONA =
                                                    SANC.ID_PERSONA
                  WHERE MDET.FLG_ACTUAL = '1'
                    AND MDET.ESTADO = '1'
                    AND (NVL(PI_I_TIPO_PERSONA, 0) = 0 OR
                        (NVL(PI_I_TIPO_PERSONA, 0) <> 0 AND
                        PERS.TIPO_PERSONA = PI_I_TIPO_PERSONA))
                    AND (NVL(PI_I_TIPO_DOC, 0) = 0 OR
                        (NVL(PI_I_TIPO_DOC, 0) <> 0 AND
                        PERS.TIPO_DOC = PI_I_TIPO_DOC))
                    AND (NVL(PI_V_NRO_DOC, ' ') = ' ' OR
                        (NVL(PI_V_NRO_DOC, ' ') <> ' ' AND
                        TRIM(PERS.NRO_DOC) = TRIM(PI_V_NRO_DOC)))
                    AND (NVL(PI_V_APE_PATERNO, ' ') = ' ' OR
                        (NVL(PI_V_APE_PATERNO, ' ') <> ' ' AND
                        fun_scob_nosensite(TRIM(PERS.APE_PATERNO)) LIKE
                        '%' ||
                        fun_scob_nosensite(TRIM(PI_V_APE_PATERNO)) || '%'))
                    AND (NVL(PI_V_APE_MATERNO, ' ') = ' ' OR
                        (NVL(PI_V_APE_MATERNO, ' ') <> ' ' AND
                        fun_scob_nosensite(TRIM(PERS.APE_MATERNO)) LIKE
                        '%' ||
                        fun_scob_nosensite(TRIM(PI_V_APE_MATERNO)) || '%'))
                    AND (NVL(PI_V_PRI_NOMBRE, ' ') = ' ' OR
                        (NVL(PI_V_PRI_NOMBRE, ' ') <> ' ' AND
                        fun_scob_nosensite(TRIM(PERS.PRI_NOMBRE)) LIKE
                        '%' || fun_scob_nosensite(TRIM(PI_V_PRI_NOMBRE)) || '%'))
                    AND (NVL(PI_V_SEG_NOMBRE, ' ') = ' ' OR
                        (NVL(PI_V_SEG_NOMBRE, ' ') <> ' ' AND
                        fun_scob_nosensite(TRIM(PERS.SEG_NOMBRE)) LIKE
                        '%' || fun_scob_nosensite(TRIM(PI_V_SEG_NOMBRE)) || '%'))
                    AND (NVL(PI_V_RAZON_SOCIAL, ' ') = ' ' OR
                        (NVL(PI_V_RAZON_SOCIAL, ' ') <> ' ' AND
                        fun_scob_nosensite(TRIM(PERS.RAZON_SOCIAL)) LIKE
                        '%' ||
                        fun_scob_nosensite(TRIM(PI_V_RAZON_SOCIAL)) || '%'))
                    AND (NVL(PI_V_NOMBRE_COMERCIAL, ' ') = ' ' OR
                        (NVL(PI_V_NOMBRE_COMERCIAL, ' ') <> ' ' AND
                        fun_scob_nosensite(TRIM(PERS.NOMBRE_COMERCIAL)) LIKE
                        '%' ||
                        fun_scob_nosensite(TRIM(PI_V_NOMBRE_COMERCIAL)) || '%'))
                  GROUP BY MDET.ID_MULTA) MULTA_SANC ON MULTA_SANC.ID_MULTA =
                                                        MULT.ID_MULTA
    
     INNER JOIN T_SCOB_MULTA_DETAL MDET ON MDET.ID_MULTA =
                                           MULTA_SANC.ID_MULTA
                                       AND MDET.FLG_ACTUAL = '1'
    
     INNER JOIN T_SCOB_MULTA_SANCIONADO MSAN ON MSAN.ID_MULTA_DETAL =
                                                MDET.ID_MULTA_DETAL
                                            AND MSAN.ESTADO =
                                                SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
                                            AND MSAN.FLG_PRINCIPAL = '1'
                                            AND NVL(MSAN.COD_TIPO_PERSONA,
                                                    '1') = '1'
    
     INNER JOIN T_SCOB_PERSONA PERS ON PERS.ID_PERSONA = MSAN.ID_PERSONA
    
     INNER JOIN T_SCOB_ORGANO_RESOLUTIVO ORGA ON ORGA.ID_ORGANO_RESOLUTIVO =
                                                 MDET.ID_ORGANO_RESOLUTIVO
    
     INNER JOIN T_SCOB_EST_EXP_COB ESEC ON ESEC.CODIGO =
                                           EXPE.ESTADO_EXPEDIENTE
    
     INNER JOIN t_Scob_Est_Exp_Cob_Motivo MOTI ON MOTI.ID_EST_EXP_COB =
                                                  EXPE.ESTADO_EXPEDIENTE
                                              AND MOTI.ID_MOTIVO =
                                                  EXPE.ID_MOTIVO
    
      LEFT JOIN T_SCOB_MULTA_ANTIDUMPING MUAN ON MUAN.ID_MULTA =
                                                 MDET.ID_MULTA
    
      LEFT JOIN T_SCOB_TABLA_DET MRES ON MRES.ID_TABLA =
                                         SCOB_PK_CONSTANTES.C_TBL_TIPO_RESP_MULTA_OR
                                     AND LTRIM(RTRIM(MRES.COD_INTERNO)) =
                                         LTRIM(RTRIM(MULT.FLG_TIPO_MULTA))
    
      LEFT JOIN (SELECT EXDO.ID_EXPEDIENTE AS ID_EXPEDIENTE,
                        COUNT(EXDO.ID_EXPEDIENTE_DOCUMENTO) AS NRO_DOCS
                   FROM T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
                  WHERE COD_GENERADOR_DOCUMENTO IS NOT NULL
                    AND EXDO.ESTADO = '1'
                 --
                  --                                           AND EXDO.TIPO_DOC_ASOC IN (
                 --                                              SCOB_PK_CONSTANTES.C_TIPO_DOC_ASOC_SISTEMA,
                   --                                            SCOB_PK_CONSTANTES.C_TIPO_DOC_ASOC_SISTEMA_ACT
                    --                                         )
    
                  GROUP BY EXDO.ID_EXPEDIENTE
    
                 ) DOCS ON DOCS.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
    
      LEFT JOIN (SELECT EXDI.ID_EXPEDIENTE AS ID_EXPEDIENTE,
                        COUNT(EXDI.ID_EXPEDIENTE_PERSONA) AS FLG_DIR
                   FROM T_SCOB_EXPEDIENTE_PERSONA EXDI
                  WHERE EXDI.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
                    AND EXDI.COD_TIPO_ENTIDAD =
                        SCOB_PK_CONSTANTES.C_COD_ENTIDAD_PERSONA --PERSONAS
                  GROUP BY EXDI.ID_EXPEDIENTE
                 HAVING COUNT(EXDI.ID_EXPEDIENTE_PERSONA) > 0) DIREC ON DIREC.ID_EXPEDIENTE =
                                                                        EXPE.ID_EXPEDIENTE
    
      LEFT JOIN T_SCOB_MULTA_ARCHIVO_CENTRAL MULTA_ARCH ON MULTA_ARCH.ID_MULTA =
                                                           MDET.ID_MULTA
                                                       AND MULTA_ARCH.FLG_ACTUAL = '1'
    
      LEFT JOIN T_SCOB_ARCHIVO_CENTRAL ARCH_CEN ON ARCH_CEN.ID_ARCHIVO_CENTRAL =
                                                   MULTA_ARCH.ID_ARCHIVO_CENTRAL
    
      LEFT JOIN (SELECT EMB.ID_EXPEDIENTE,
                        COUNT(EMB.ID_EXPEDIENTE_EMBARGO) AS NRO_EMBARGOS
                   FROM T_SCOB_EXPED_EMBARGO EMB
                  WHERE EMB.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
                    AND EMB.COD_ESTADO_EMBARGO =
                        SCOB_PK_CONSTANTES.C_EST_SOLIC_EMB_PENDIENTE --EMBARGOS PENDIENTES.
                  GROUP BY EMB.ID_EXPEDIENTE) EXPE_EMB ON EXPE_EMB.ID_EXPEDIENTE =
                                                          EXPE.ID_EXPEDIENTE
    
      LEFT JOIN T_SCOB_AREA_COBRANZA ACOB ON ACOB.ID_AREA_COBRANZA =
                                             MULT.ID_AREA_COBRANZA
    
     WHERE
    ----------
     (NVL(PI_C_DPTO, ' ') = ' ' OR (NVL(PI_C_DPTO, ' ') <> ' ' AND
     TRIM(ORGA.COD_DPTO) = TRIM(PI_C_DPTO)))
     AND (NVL(PI_C_PROV, ' ') = ' ' OR (NVL(PI_C_PROV, ' ') <> ' ' AND
     TRIM(ORGA.COD_PROV) = TRIM(PI_C_PROV)))
     AND (NVL(PI_C_DSTO, ' ') = ' ' OR (NVL(PI_C_DSTO, ' ') <> ' ' AND
     TRIM(ORGA.COD_DIST) = TRIM(PI_C_DSTO)))
    
     AND (NVL(PI_N_COD_MATERIA, 0) = 0 OR (NVL(PI_N_COD_MATERIA, 0) <> 0 AND
     MULT.ID_MATERIA = PI_N_COD_MATERIA))
    ----------
    
     AND (NVL(PI_V_ESTADO_EXPEDIENTE, ' ') = ' ' OR
     (NVL(PI_V_ESTADO_EXPEDIENTE, ' ') <> ' ' AND
     TRIM(EXPE.ESTADO_EXPEDIENTE) = TRIM(PI_V_ESTADO_EXPEDIENTE)))
     AND (NVL(PI_N_COD_ORGANO_RESOL, 0) = 0 OR
     (NVL(PI_N_COD_ORGANO_RESOL, 0) <> 0 AND
     ORGA.ID_ORGANO_RESOLUTIVO = PI_N_COD_ORGANO_RESOL))
     AND ((NVL(PI_V_NRO_EXPEDIENTE_INI, ' ') = ' ') OR
     (NVL(PI_V_NRO_EXPEDIENTE_INI, ' ') <> ' ' AND
     TO_NUMBER(EXPE.ANIO || TRIM(EXPE.NRO_EXPEDIENTE)) BETWEEN
     TO_NUMBER(TRIM(PI_V_NRO_EXPEDIENTE_INI)) AND
     TO_NUMBER(TRIM(NVL(PI_V_NRO_EXPEDIENTE_FIN,
                          PI_V_NRO_EXPEDIENTE_INI)))))
     AND ((NVL(PI_C_FEC_INI, ' ') = ' ') OR
     (NVL(PI_C_FEC_INI, ' ') <> ' ' AND
     TO_DATE(TO_CHAR(EXPE.AUDFECCREACION, 'DD/MM/YYYY'), 'DD/MM/YYYY') BETWEEN
     TO_DATE(PI_C_FEC_INI, 'DD/MM/YYYY') AND
     TO_DATE(PI_C_FEC_FIN, 'DD/MM/YYYY')))
    ---NVO FECHA ASIGNACION
     AND ((NVL(PI_C_FEC_ASI_INI, ' ') = ' ') OR
     (NVL(PI_C_FEC_ASI_INI, ' ') <> ' ' AND
     TO_DATE(TO_CHAR(MULT.FECHA_ASIG_COBRANZA, 'DD/MM/YYYY'),
               'DD/MM/YYYY') BETWEEN
     TO_DATE(PI_C_FEC_ASI_INI, 'DD/MM/YYYY') AND
     TO_DATE(PI_C_FEC_ASI_FIN, 'DD/MM/YYYY')))
    -------------------
     AND ((NVL(PI_N_SALDO_INI, 0) = 0) OR
     (NVL(PI_N_SALDO_INI, 0) <> 0 AND EXPE.SALDO BETWEEN PI_N_SALDO_INI AND
     PI_N_SALDO_FIN))
     AND (NVL(PI_N_ID_USUARIO, 0) = 0 OR
     NVL(PI_N_ID_USUARIO, 0) <> 0 AND
     --EXPE.ID_USUARIO_INGRESO = PI_N_ID_USUARIO) --COMENTADO POR OBS 202 - 13.02.2012
     MULT.ID_USUARIO_ASIG_COBRANZA = PI_N_ID_USUARIO)
    -----------------------------------------------
    --EN LA BANDEJAS,
    -----------------------------------------------
     AND (
    
      (NVL(PI_C_EVENTO, ' ') = ' ')
     --OPCION: GENERAR EXPEDIENTES
      OR (PI_C_EVENTO = 1 AND EXPE.ESTADO_EXPEDIENTE =
      SCOB_PK_CONSTANTES.C_TBL_EST_EXP_PRECOACTIVO)
    
      OR (PI_C_EVENTO = 2 AND (EXPE.ID_EXPEDIENTE IS NOT NULL)))
     AND (C_ESTADO = '*' OR (C_ESTADO <> '*' AND EXPE.ESTADO = C_ESTADO))
     AND MULT.ID_MULTA=SCOB_PK_EXPEDIENTE.SCOB_FN_MUL_ANTIGUO(EXPE.ID_EXPEDIENTE);*/
    --
  END;
  
  PROCEDURE SCOB_SP_S_COMBO_MUL_CERO_EXP
    /*
    -----------------------------------------------------------
    -- Autor        : HCHALCO
    -- Creado       : 05.08.2021
    -- Proposito    : Cargar los combos para el formulario Multa Cero
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    : 
    -----------------------------------------------------------
    */
    (
      PI_VC_NOM_COMBO          IN VARCHAR2,
      PI_NU_ID_ESTADO_MULTA    IN NUMBER,
      PO_CU_RETORNO            OUT CU_REC_SET
    )
    AS
    BEGIN
      IF PI_VC_NOM_COMBO = 'tipoMulta' THEN 
        OPEN  PO_CU_RETORNO for
        SELECT T.COD_INTERNO AS ID,
               T.TXT_DESCRIPCION AS DESCRIPCION
          FROM USR_SICOB.T_SCOB_TABLA_DET T
         WHERE T.ID_TABLA = 82
           AND T.ESTADO = 1;
        
      ELSIF PI_VC_NOM_COMBO = 'estadoExp' THEN
          OPEN  PO_CU_RETORNO for
          SELECT T.ID_EST_EXP_COB AS ID, 
               T.DESCRIPCION AS DESCRIPCION
          FROM USR_SICOB.T_SCOB_EST_EXP_COB T
         WHERE T.ID_EST_EXP_COB = 2;
          
      ELSIF PI_VC_NOM_COMBO = 'motivoExp' THEN
          OPEN  PO_CU_RETORNO for
          SELECT T.ID_MOTIVO AS ID, T.DESCRIPCION
          FROM USR_SICOB.T_SCOB_EST_EXP_COB_MOTIVO T
         WHERE T.ID_EST_EXP_COB = 2
           AND T.ID_MOTIVO IN (17, 21);
          
      END IF;
      

  END;
  
  PROCEDURE SCOB_SP_S_PER_MULTA_CERO
    /*
    -----------------------------------------------------------
    -- Autor        : HCHALCO
    -- Creado       : 05.08.2021
    -- Proposito    : Seleccionar usuarios que tienen para ejecutar página de Multa Cero
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    : 
    -----------------------------------------------------------
    */
    (
      PI_VC_USUARIO            IN VARCHAR2,
      PO_CU_RETORNO            OUT CU_REC_sET
    )
    AS
    BEGIN
      OPEN  PO_CU_RETORNO FOR
        SELECT US.ID_USUARIO AS idusuario, usuario AS usuario
        FROM USR_SICOB.T_SCOB_USUARIO US 
        WHERE ID_USUARIO IN (72,70,366,485,505,64,65,487,46,71)
        AND US.Usuario = PI_VC_USUARIO;

  END;
  
  PROCEDURE SCOB_SP_I_MULTA_CERO_EXP
    /*
    -----------------------------------------------------------
    -- Autor        : HCHALCO
    -- Creado       : 05.08.2021
    -- Proposito    : Generar multa cero
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    : Procesos en linea
    -----------------------------------------------------------
    */
    (
      PI_VC_NRO_EXP_COBRANZA   IN VARCHAR2,
      PI_NU_TIPO_MULTA         IN NUMBER,
      PI_NU_ESTADO_EXP         IN NUMBER,
      PI_NU_MOTIVO_EXP         IN NUMBER,
      PI_DT_FECHA_ESTADO       IN VARCHAR2,
      PI_VC_USUARIO_LOGIN      IN VARCHAR2,
      PO_NU_RETORNO            OUT NUMBER,
      PO_NU_COD_ERROR          OUT NUMBER,
      PO_VC_MSJ_ERROR          OUT VARCHAR2
    )
    AS
      V_NU_ID_EXPEDIENTE NUMBER;
      V_NU_EXISTE NUMBER;
      V_NU_ID_MULTA               USR_SICOB.T_SCOB_MULTA.ID_MULTA%TYPE;    
    BEGIN
      
      -- MULTA CERO PARA EXPEDIENTE - PODER JUDICIAL
      SELECT EXPE.ID_EXPEDIENTE INTO V_NU_ID_EXPEDIENTE
      FROM USR_SICOB.T_SCOB_EXPEDIENTE EXPE
      WHERE EXPE.ANIO||EXPE.NRO_EXPEDIENTE = PI_VC_NRO_EXP_COBRANZA
      AND EXPE.Estado = 1;
      
     --Validar si el EXP ya tiene Multa Cero
      SELECT COUNT(EX.ID_EXPEDIENTE) INTO V_NU_EXISTE
        FROM USR_SICOB.T_SCOB_EXPEDIENTE EX
       INNER JOIN USR_SICOB.T_SCOB_EXPEDIENTE_ESTADO EE
          ON (EX.ID_EXPEDIENTE = EE.ID_EXPEDIENTE)
      WHERE EX.ID_EXPEDIENTE = V_NU_ID_EXPEDIENTE
        AND EE.ESTADO = 1
        AND EE.NU_ID_TIPO_MULTAC IN (1, 2);
      
      IF V_NU_EXISTE>0 THEN
          PO_NU_COD_ERROR := 0;
          PO_NU_RETORNO   := 2;
          PO_VC_MSJ_ERROR := 'Este expedient ya tiene registrado Multa Cero';
     ELSE
       BEGIN
         -- UPDATE DE MONTOS MULTA CERO
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
          WHERE ID_MULTA IN
                (SELECT M.ID_MULTA
                   FROM USR_SICOB.T_SCOB_MULTA M
                  INNER JOIN USR_SICOB.T_SCOB_EXPEDIENTE_MULTA EM
                     ON (M.ID_MULTA = EM.ID_MULTA)
                  WHERE EM.ESTADO = 1
                    AND EM.ID_EXPEDIENTE = V_NU_ID_EXPEDIENTE);
           
         UPDATE USR_SICOB.T_SCOB_MULTA_DETAL
            SET VALOR_UIT          = 0,
                MONTO_UIT          = 0,
                AUDUSUMODIFICACION = PI_VC_USUARIO_LOGIN,
                AUDFECMODIFICACION = SYSDATE
          WHERE ID_MULTA_DETAL IN
                (SELECT MD.ID_MULTA_DETAL
                   FROM USR_SICOB.T_SCOB_MULTA_DETAL MD
                  INNER JOIN USR_SICOB.T_SCOB_MULTA MU
                     ON (MD.ID_MULTA = MU.ID_MULTA)
                  INNER JOIN USR_SICOB.T_SCOB_EXPEDIENTE_MULTA EM
                     ON (MU.ID_MULTA = EM.ID_MULTA)
                  WHERE MD.ESTADO = 1
                    AND MD.FLG_ACTUAL = 1
                    AND EM.ESTADO = 1
                    AND EM.ID_EXPEDIENTE = V_NU_ID_EXPEDIENTE);

         UPDATE USR_SICOB.T_SCOB_EXPEDIENTE
            SET VALOR_UIT               = 0,
                MONTO_UIT               = 0,
                MONTO_COSTAS            = 0,
                MONTO_INTERES           = 0,
                MONTO_INTERES_MORATORIO = 0,
                MONTO_TOTAL_DEUDA       = 0,
                TOTAL_AMORTIZADO        = 0,
                TOTAL_AMORTIZADO_IC     = 0,
                TOTAL_AMORTIZADO_IM     = 0,
                TOTAL_AMORTIZADO_COSTAS = 0,
                TOTAL_AMORTIZADO_DEUDA  = 0,
                SALDO                   = 0,
                SALDO_IC                = 0,
                SALDO_IM                = 0,
                SALDO_COSTAS            = 0,
                SALDO_TOTAL_DEUDA       = 0,
                COD_ESTADO_PAGO         = 3,
                AUDUSUMODIFICACION      = PI_VC_USUARIO_LOGIN,
                AUDFECMODIFICACION      = SYSDATE
          WHERE ID_EXPEDIENTE = V_NU_ID_EXPEDIENTE;
            
         -- INSERT ESTADO DE EXPEDIENTE
         INSERT INTO USR_SICOB.T_SCOB_EXPEDIENTE_ESTADO
           (ID_EXPEDIENTE_ESTADO,
            ESTADO_EXPEDIENTE,
            ESTADO,
            AUDFECCREACION,
            AUDUSUCREACION,
            ID_EXPEDIENTE,
            ID_MOTIVO,
            NU_ID_TIPO_MULTAC)
         VALUES
           (USR_SICOB.SCOB_SQ_EXPEDIENTE_ESTADO.NEXTVAL,
            PI_NU_ESTADO_EXP,
            '1',
            TO_DATE(PI_DT_FECHA_ESTADO, 'DD-MM-YYYY'),
            PI_VC_USUARIO_LOGIN,
            V_NU_ID_EXPEDIENTE,
            PI_NU_MOTIVO_EXP,
            PI_NU_TIPO_MULTA);
            
         UPDATE USR_SICOB.T_SCOB_EXPEDIENTE
            SET ID_MOTIVO             = PI_NU_MOTIVO_EXP,
                ESTADO_EXPEDIENTE     = PI_NU_ESTADO_EXP,
                FEC_ESTADO_EXPEDIENTE = TO_DATE(PI_DT_FECHA_ESTADO, 'DD-MM-YYYY'),
                AUDFECMODIFICACION    = SYSDATE,
                AUDUSUMODIFICACION    = PI_VC_USUARIO_LOGIN
          WHERE ID_EXPEDIENTE = V_NU_ID_EXPEDIENTE;
               
          --INICIO VICTOR BENDEZU - MIGRACION SICOB A SIA    
          V_NU_ID_MULTA:= SCOB_PK_EXPEDIENTE.SCOB_FN_MUL_ANTIGUO(V_NU_ID_EXPEDIENTE); -- SI ES EXP ACUMULADO APLICA SOLO AL CUM MAS ANTIGUO
          USR_SIA_INTFZ.PKG_INTFZ_REG_MULTA_SICOB_SIA.SP_U_EXPEDIENTE_CERO_A_SIA(PIN_NU_ID_MULTA => V_NU_ID_MULTA,
                                                                            POUT_NU_COD_RESULT => PO_NU_RETORNO,
                                                                            POUT_VC_MSG_RESULT => PO_VC_MSJ_ERROR);
          IF PO_NU_RETORNO < 0 THEN
             ROLLBACK;
             RETURN;
          END IF;
          USR_SICOB.PKG_RECAUDACION_BANCOS.SP_DO_GRABAR_BN_X_EXP(PIN_NU_ID_EXPEDIENTE => V_NU_ID_EXPEDIENTE,
                                           POUT_NU_COD_RESULT => PO_NU_RETORNO,
                                           POUT_VC_MSG_RESULT => PO_VC_MSJ_ERROR);
          IF PO_NU_RETORNO < 0 THEN
             ROLLBACK;
             RETURN;
          END IF;
          USR_SICOB.PKG_RECAUDACION_BANCOS.SP_DO_GRABAR_ASBANC_X_EXP(PIN_NU_ID_EXPEDIENTE => V_NU_ID_EXPEDIENTE,
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
   
   PROCEDURE SCOB_SP_S_EXP_MULTA_CERO
  /*
    -----------------------------------------------------------
    -- Autor        : HCHALCO
    -- Creado       : 10.08.2021
    -- Proposito    : Consulta de EXP para Multa cero.
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
  (PI_V_NRO_EXPEDIENTE_INI IN VARCHAR2,
   PO_CU_RETORNO   OUT CU_REC_SET) AS
    C_ESTADO CHAR(1);
    --
    V_SELECT CLOB;
    V_A1     CLOB;
    V_A2     CLOB;
    V_QUERY  CLOB;
    --
  BEGIN
    
    OPEN PO_CU_RETORNO FOR
      SELECT *
        FROM (SELECT EXPE.ID_EXPEDIENTE AS COD_EXPEDIENTE,
                      EXPE.NRO_EXPEDIENTE AS NRO_EXPEDIENTE,
                      EXPE.ANIO AS ANIO_EXPEDIENTE,
                      EXPE.ANIO || EXPE.NRO_EXPEDIENTE AS NRO_EXPED, --AÑO+NRO
                      --
                      EXPE.ESTADO_EXPEDIENTE AS COD_ESTADO_EXPEDIENTE,
                      ESEC.DESCRIPCION       AS NOM_ESTADO_EXPEDIENTE,
                      EXPE.ID_MOTIVO         AS COD_MOTIVO,
                      MOTI.DESCRIPCION       AS NOM_MOTIVO,
                      --
                      EXPE.AUDUSUCREACION AS GENERADO_POR,
                      EXPE.AUDFECCREACION AS FEC_GENERADO_POR,
                      --
                      MRES.TXT_DESCRIPCION AS TIPO_EXPEDIENTE,
                      DECODE(EXPE.FLG_TIPO_EXPEDIENTE,
                             '1',
                             PERS.COD_SANCIONADO,
                             '0') AS COD_SANCIONADO,
                      DECODE(EXPE.FLG_TIPO_EXPEDIENTE,
                             '1',
                             DECODE(PERS.TIPO_PERSONA,
                                    SCOB_PK_CONSTANTES.C_TIPO_PERS_JURIDICA,
                                    PERS.RAZON_SOCIAL,
                                    PERS.APE_PATERNO || ' ' || PERS.APE_MATERNO || ' ' ||
                                    PERS.PRI_NOMBRE || ' ' || PERS.SEG_NOMBRE || ' ' ||
                                    PERS.APE_CASADA),
                             SCOB_FN_SANCIONADOS_EXPED(EXPE.ID_EXPEDIENTE)) AS NOM_SANCIONADO,
                      --
                      EXPE.NRO_CUMS AS NRO_CUMS,
                      MULT.ANIO || MULT.CUM AS NUM_CUM,
                      MULT.NRO_FILE_AEC AS NRO_FILE_AEC,
                      
                      --DATOS ANTIDUMPING --NUEVOS
                      DECODE(NVL(MUAN.NRO_LIQUIDACION_CODIGO, ' '),
                             ' ',
                             NULL,
                             MUAN.NRO_LIQUIDACION_CODIGO || '-' ||
                             MUAN.NRO_LIQUIDACION_ANIO || '/' ||
                             MUAN.NRO_LIQUIDACION_CORRELATIVO) AS NRO_LIQUIDACION,
                      
                      --montos deuda antidumping
                      MUAN.TIPO_CAMBIO AS TIPO_CAMBIO,
                      SUM(MUAN.MONTO_ANTIDUMPING) OVER(PARTITION BY EXPE.ID_EXPEDIENTE) AS MONTO_ANTIDUMPING,
                      SUM(MUAN.MONTO_INTERES) OVER(PARTITION BY EXPE.ID_EXPEDIENTE) AS MONTO_DA_INTERES,
                      SUM(MUAN.MONTO_INTERES_MORATORIO) OVER(PARTITION BY EXPE.ID_EXPEDIENTE) AS MONTO_DA_INTERES_MORATORIO,
                      SUM(MUAN.MONTO_TOTAL) OVER(PARTITION BY EXPE.ID_EXPEDIENTE) AS MONTO_TOTAL_DEUDA_DA,
                      
                      --montos deuda uit
                      SUM(MDET.VALOR_UIT) OVER(PARTITION BY EXPE.ID_EXPEDIENTE) AS UIT_VALOR,
                      SUM(MULT.MONTO_UIT) OVER(PARTITION BY EXPE.ID_EXPEDIENTE) AS UIT_MONTO,
                      SUM(MULT.MONTO_INTERES) OVER(PARTITION BY EXPE.ID_EXPEDIENTE) AS MONTO_IC,
                      SUM(MULT.MONTO_INTERES_MORATORIO) OVER(PARTITION BY EXPE.ID_EXPEDIENTE) AS MONTO_IM,
                      SUM(MULT.MONTO_COSTAS) OVER(PARTITION BY EXPE.ID_EXPEDIENTE) AS MONTO_COSTAS,
                      SUM(MULT.MONTO_TOTAL_DEUDA) OVER(PARTITION BY EXPE.ID_EXPEDIENTE) AS MONTO_TOTAL_DEUDA,
                      
                      --montos amortizado
                      SUM(MULT.TOTAL_AMORTIZADO) OVER(PARTITION BY EXPE.ID_EXPEDIENTE) AS TOTAL_AMORTIZADO_UIT,
                      SUM(MULT.TOTAL_AMORTIZADO_IC) OVER(PARTITION BY EXPE.ID_EXPEDIENTE) AS MONTO_AMORTIZADO_IC,
                      SUM(MULT.TOTAL_AMORTIZADO_IM) OVER(PARTITION BY EXPE.ID_EXPEDIENTE) AS MONTO_AMORTIZADO_IM,
                      SUM(MULT.TOTAL_AMORTIZADO_COSTAS) OVER(PARTITION BY EXPE.ID_EXPEDIENTE) AS MONTO_AMORTIZADO_COSTAS,
                      SUM(MULT.TOTAL_AMORTIZACION_DEUDA) OVER(PARTITION BY EXPE.ID_EXPEDIENTE) AS MONTO_TOTAL_AMORTIZADO,
                      
                      SUM(EXPE.SALDO) OVER(PARTITION BY EXPE.ID_EXPEDIENTE) AS SALDO_UIT,
                      SUM(EXPE.SALDO_IC) OVER(PARTITION BY EXPE.ID_EXPEDIENTE) AS SALDO_INTERES_COMPENSATORIO,
                      SUM(EXPE.SALDO_IM) OVER(PARTITION BY EXPE.ID_EXPEDIENTE) AS SALDO_INTERES_MORATORIO,
                      SUM(EXPE.SALDO_COSTAS) OVER(PARTITION BY EXPE.ID_EXPEDIENTE) AS SALDO_COSTAS,
                      SUM(EXPE.SALDO_TOTAL_DEUDA) OVER(PARTITION BY EXPE.ID_EXPEDIENTE) AS SALDO_TOTAL,
                      
                      --------------------------------------------------------------------------------
                      
                      NVL(DOCS.NRO_DOCS, 0) AS NRO_DOCS,
                      NVL(EXPE_EMB.NRO_EMBARGOS, 0) AS NRO_EMBARGOS,
                      ARCH_CEN.FEC_ENVIO AS FEC_ARCHIVO_CENTRAL,
                      DECODE(NVL(DIREC.FLG_DIR, 0), 0, '0', '1') AS FLG_DOMICILIO,
                      NVL(EXPE.FLG_CANCELADO, '0') AS IND_CANCELADO,
                      MULT.FLG_MULTA_RESOLUTIVO AS FLG_TIPO_MULTA_OR,
                      EXPE.ESTADO AS ESTADO_REGISTRO,
                      SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_ESTADO_REGISTRO,
                                                               EXPE.ESTADO) AS DES_ESTADO_REGISTRO,
                      --'HOLA DESC' AS DES_ESTADO_REGISTRO,                                       
                      ORGA.DESCRIPCION AS DES_ORGA_RESOL,
                      MULT.NRO_FILE_AEC AS NRO_FILE,
                      MULT.ANIO_FILE_AEC AS ANIO_FILE,
                      ACOB.CODIGO AS COD_AREA_COB,
                      DECODE(MUAN.ID_MULTA_ANTIDUMPING, NULL, '0', '1') AS IND_ANTIDUMPING,
                      MDET.ID_MULTA_DETAL AS ID_MULTA_DETAL,
                      MULT.COD_ESTADO_PAGO AS COD_ESTADO_DEUDA, --3=Pago Total

                      USU.PRI_NOMBRE || ' ' || USU.APE_PATERNO || ' ' ||
                      USU.APE_MATERNO AS EXPED_ASIGNADO_A, 
                      
                      USR_SICOB.SCOB_PK_EXPEDIENTE.SCOB_FN_ES_ACUM(EXPE.ID_EXPEDIENTE) AS ES_ACUM,
                      USR_SICOB.SCOB_PK_MULTAS.SCOB_FN_HAS_ADJ_ANOT(EXPE.ID_EXPEDIENTE,
                                                                    1) AS HAS_ADJ_ANOT,
                      ROW_NUMBER() OVER(PARTITION BY EXPE.ID_EXPEDIENTE ORDER BY EXMU.ID_EXPEDIENTE_MULTA) AS NRO_ORDEN_CUM
               -- FIN
               
                 FROM T_SCOB_EXPEDIENTE EXPE
               
                INNER JOIN T_SCOB_EXPEDIENTE_MULTA EXMU
                   ON (EXMU.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE AND
                      EXMU.ESTADO =1)
               
                INNER JOIN T_SCOB_MULTA MULT
                   ON (MULT.ID_MULTA = EXMU.ID_MULTA)
               
                 LEFT JOIN T_SCOB_USUARIO USU
                   ON (USU.ID_USUARIO = MULT.ID_USUARIO_ASIG_COBRANZA)
               
               --SANCIONADO
                INNER JOIN (SELECT MDET.ID_MULTA AS ID_MULTA,
                                  COUNT(MDET.ID_MULTA) AS NRO_MULTAS
                             FROM T_SCOB_MULTA_DETAL MDET
                            INNER JOIN T_SCOB_MULTA_SANCIONADO SANC
                               ON (SANC.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL AND
                                  NVL(SANC.COD_TIPO_PERSONA, '1') = '1' AND
                                  SANC.ESTADO = '1')
                            INNER JOIN T_SCOB_PERSONA PERS
                               ON (PERS.ID_PERSONA = SANC.ID_PERSONA)
                            WHERE MDET.FLG_ACTUAL = '1'
                              AND MDET.ESTADO = '1'
                              
                            GROUP BY MDET.ID_MULTA) MULTA_SANC
                   ON (MULTA_SANC.ID_MULTA = MULT.ID_MULTA)
               
                INNER JOIN T_SCOB_MULTA_DETAL MDET
                   ON (MDET.ID_MULTA = MULTA_SANC.ID_MULTA AND
                      MDET.FLG_ACTUAL = '1')
               
                INNER JOIN T_SCOB_MULTA_SANCIONADO MSAN
                   ON (MSAN.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL AND
                      MSAN.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO AND
                      MSAN.FLG_PRINCIPAL = '1' AND
                      NVL(MSAN.COD_TIPO_PERSONA, '1') = '1')
               
                INNER JOIN T_SCOB_PERSONA PERS
                   ON (PERS.ID_PERSONA = MSAN.ID_PERSONA)
               
                INNER JOIN T_SCOB_ORGANO_RESOLUTIVO ORGA
                   ON (ORGA.ID_ORGANO_RESOLUTIVO = MDET.ID_ORGANO_RESOLUTIVO)
               
                INNER JOIN T_SCOB_EST_EXP_COB ESEC
                   ON (TO_NUMBER(ESEC.CODIGO) = EXPE.ESTADO_EXPEDIENTE)
               
                INNER JOIN T_SCOB_EST_EXP_COB_MOTIVO MOTI
                   ON (MOTI.ID_EST_EXP_COB = EXPE.ESTADO_EXPEDIENTE AND
                      MOTI.ID_MOTIVO = EXPE.ID_MOTIVO)
               
                 LEFT JOIN T_SCOB_MULTA_ANTIDUMPING MUAN
                   ON (MUAN.ID_MULTA = MDET.ID_MULTA)
               
                 LEFT JOIN T_SCOB_TABLA_DET MRES
                   ON (MRES.ID_TABLA =
                      SCOB_PK_CONSTANTES.C_TBL_TIPO_RESP_MULTA_OR AND
                      LTRIM(RTRIM(MRES.COD_INTERNO)) =
                      LTRIM(RTRIM(MULT.FLG_TIPO_MULTA)))
               
                 LEFT JOIN (SELECT EXDO.ID_EXPEDIENTE AS ID_EXPEDIENTE,
                                  COUNT(EXDO.ID_EXPEDIENTE_DOCUMENTO) AS NRO_DOCS
                             FROM T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
                            WHERE (COD_GENERADOR_DOCUMENTO IS NOT NULL AND
                                  EXDO.ESTADO = '1')
                           
                            GROUP BY EXDO.ID_EXPEDIENTE
                           
                           ) DOCS
                   ON (DOCS.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE)
               
                 LEFT JOIN (SELECT EXDI.ID_EXPEDIENTE AS ID_EXPEDIENTE,
                                  COUNT(EXDI.ID_EXPEDIENTE_PERSONA) AS FLG_DIR
                             FROM T_SCOB_EXPEDIENTE_PERSONA EXDI
                            WHERE EXDI.ESTADO =
                                  SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
                              AND EXDI.COD_TIPO_ENTIDAD =
                                  SCOB_PK_CONSTANTES.C_COD_ENTIDAD_PERSONA --PERSONAS
                            GROUP BY EXDI.ID_EXPEDIENTE
                           HAVING COUNT(EXDI.ID_EXPEDIENTE_PERSONA) > 0) DIREC
                   ON (DIREC.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE)
               
                 LEFT JOIN T_SCOB_MULTA_ARCHIVO_CENTRAL MULTA_ARCH
                   ON (MULTA_ARCH.ID_MULTA = MDET.ID_MULTA AND
                      MULTA_ARCH.FLG_ACTUAL = '1')
               
                 LEFT JOIN T_SCOB_ARCHIVO_CENTRAL ARCH_CEN
                   ON (ARCH_CEN.ID_ARCHIVO_CENTRAL =
                      MULTA_ARCH.ID_ARCHIVO_CENTRAL)
               
                 LEFT JOIN (SELECT EMB.ID_EXPEDIENTE,
                                  COUNT(EMB.ID_EXPEDIENTE_EMBARGO) AS NRO_EMBARGOS
                             FROM T_SCOB_EXPED_EMBARGO EMB
                            WHERE EMB.ESTADO =
                                  SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
                              AND EMB.COD_ESTADO_EMBARGO =
                                  SCOB_PK_CONSTANTES.C_EST_SOLIC_EMB_PENDIENTE --EMBARGOS PENDIENTES.
                            GROUP BY EMB.ID_EXPEDIENTE) EXPE_EMB
                   ON EXPE_EMB.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
               
                 LEFT JOIN T_SCOB_AREA_COBRANZA ACOB
                   ON (ACOB.ID_AREA_COBRANZA = MULT.ID_AREA_COBRANZA)
               
                WHERE
                  EXPE.ESTADO = 1
                  AND 
                  (NVL(PI_V_NRO_EXPEDIENTE_INI, ' ') = ' ') 
                  OR 
                  ( NVL(PI_V_NRO_EXPEDIENTE_INI, ' ') <> ' ' 
                    AND
                    TO_NUMBER(EXPE.ANIO || TRIM(EXPE.NRO_EXPEDIENTE)) = TO_NUMBER(TRIM(PI_V_NRO_EXPEDIENTE_INI)) 
                  )
             
                ) X
       WHERE X.NRO_ORDEN_CUM = 1;
  END;

  -- ******************************************************************************
  -- Descripción: Procedure que retorna la lista estados de un expediente
  --
  --
  -- Output Parameters: POUT_CUR_RETORNO, POUT_NU_COD_ERROR , POUT_VC_MSJ_ERROR
  --
  --
  -- Author:      Victor Bendezú
  -- Proyecto:    Incidencias SICOB
  --
  -- Revisiones
  -- Fecha            Autor         Motivo del cambio    
  -- ----------------------------------------------------------------
  -- 30/12/2022     Victor Bendezú  Incidencias SICOB   
  -- ***************************************************************      
  PROCEDURE SCOB_SP_S_ESTADOS_EXPEDIENTE(PIN_VC_NRO_EXPEDIENTE IN VARCHAR2,
                                         POUT_CUR_RETORNO       OUT CU_REC_SET,
                                         POUT_NU_COD_ERROR      OUT NUMBER,
                                         POUT_VC_MSJ_ERROR      OUT VARCHAR2) AS
  BEGIN

    POUT_NU_COD_ERROR := -1;
    POUT_VC_MSJ_ERROR := '';

    OPEN POUT_CUR_RETORNO FOR 
         
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
          ON (FASE.ID_TABLA = 59 AND FASE.COD_INTERNO = 3)
        LEFT JOIN USR_SICOB.T_SCOB_EST_EXP_COB_MOTIVO MOT_EXP
          ON (EST_EXP.ID_EST_EXP_COB = MOT_EXP.ID_EST_EXP_COB AND
             EXDO.ID_MOTIVO = MOT_EXP.ID_MOTIVO)
       WHERE EXDO.ESTADO = '1'
         AND EX.ANIO || EX.NRO_EXPEDIENTE = PIN_VC_NRO_EXPEDIENTE
       ORDER BY ID_DOCUMENTO DESC;
    
  EXCEPTION
    WHEN OTHERS THEN
      
      POUT_NU_COD_ERROR := SQLCODE;
      SELECT CASE WHEN POUT_NU_COD_ERROR > 0 THEN POUT_NU_COD_ERROR * -1 ELSE POUT_NU_COD_ERROR END
        INTO POUT_NU_COD_ERROR
        FROM DUAL;
      POUT_VC_MSJ_ERROR := SUBSTR(SQLERRM, 1, 250);
    
  END;  
  
  -- ******************************************************************************
  -- Descripción: Procedure que retorna la lista estados de expediente
  --
  --
  -- Output Parameters: POUT_CUR_RETORNO, POUT_NU_COD_ERROR , POUT_VC_MSJ_ERROR
  --
  --
  -- Author:      Victor Bendezú
  -- Proyecto:    Incidencias SICOB
  --
  -- Revisiones
  -- Fecha            Autor         Motivo del cambio    
  -- ----------------------------------------------------------------
  -- 30/12/2022     Victor Bendezú  Incidencias SICOB   
  -- ***************************************************************      
  PROCEDURE SCOB_SP_S_ESTADO_EXPEDIENTE(POUT_CUR_RETORNO       OUT CU_REC_SET,
                                        POUT_NU_COD_ERROR      OUT NUMBER,
                                        POUT_VC_MSJ_ERROR      OUT VARCHAR2) AS
  BEGIN

    POUT_NU_COD_ERROR := -1;
    POUT_VC_MSJ_ERROR := '';

    OPEN POUT_CUR_RETORNO FOR 
         
      SELECT T.ID_EST_EXP_COB, T.CODIGO, T.DESCRIPCION, T.ESTADO
        FROM USR_SICOB.T_SCOB_EST_EXP_COB T
       WHERE T.ESTADO = '1';
    
  EXCEPTION
    WHEN OTHERS THEN
      
      POUT_NU_COD_ERROR := SQLCODE;
      SELECT CASE WHEN POUT_NU_COD_ERROR > 0 THEN POUT_NU_COD_ERROR * -1 ELSE POUT_NU_COD_ERROR END
        INTO POUT_NU_COD_ERROR
        FROM DUAL;
      POUT_VC_MSJ_ERROR := SUBSTR(SQLERRM, 1, 250);
    
  END;  
  
  -- ******************************************************************************
  -- Descripción: Procedure que retorna la lista motivos de expediente
  --
  --
  -- Output Parameters: POUT_CUR_RETORNO, POUT_NU_COD_ERROR , POUT_VC_MSJ_ERROR
  --
  --
  -- Author:      Victor Bendezú
  -- Proyecto:    Incidencias SICOB
  --
  -- Revisiones
  -- Fecha            Autor         Motivo del cambio    
  -- ----------------------------------------------------------------
  -- 30/12/2022     Victor Bendezú  Incidencias SICOB   
  -- ***************************************************************      
  PROCEDURE SCOB_SP_S_MOTIVO_EXPEDIENTE(PIN_NU_ID_ESTADO_EXPEDIENTE IN NUMBER,
                                        POUT_CUR_RETORNO             OUT CU_REC_SET,
                                        POUT_NU_COD_ERROR            OUT NUMBER,
                                        POUT_VC_MSJ_ERROR            OUT VARCHAR2) AS
  BEGIN

    POUT_NU_COD_ERROR := -1;
    POUT_VC_MSJ_ERROR := '';

    OPEN POUT_CUR_RETORNO FOR 
         
      SELECT T.ID_MOTIVO, T.CODIGO, T.DESCRIPCION, T.ESTADO
        FROM USR_SICOB.T_SCOB_EST_EXP_COB_MOTIVO T
       WHERE T.ID_EST_EXP_COB = PIN_NU_ID_ESTADO_EXPEDIENTE
         AND T.ESTADO = '1';
    
  EXCEPTION
    WHEN OTHERS THEN
      
      POUT_NU_COD_ERROR := SQLCODE;
      SELECT CASE WHEN POUT_NU_COD_ERROR > 0 THEN POUT_NU_COD_ERROR * -1 ELSE POUT_NU_COD_ERROR END
        INTO POUT_NU_COD_ERROR
        FROM DUAL;
      POUT_VC_MSJ_ERROR := SUBSTR(SQLERRM, 1, 250);
    
  END;  
  
  -- ******************************************************************************
  -- Descripción: Procedure que registra un nuevo estado al expediente
  --
  --
  -- Output Parameters: POUT_NU_COD_ERROR , POUT_VC_MSJ_ERROR
  --
  --
  -- Author:      Victor Bendezú
  -- Proyecto:    Incidencias SICOB
  --
  -- Revisiones
  -- Fecha            Autor         Motivo del cambio    
  -- ----------------------------------------------------------------
  -- 30/12/2022     Victor Bendezú  Incidencias SICOB   
  -- ***************************************************************      
  PROCEDURE SCOB_SP_I_ESTADOS_EXPEDIENTE(PIN_NU_ID_ESTADO_EXP  IN NUMBER,
                                         PIN_NU_ID_MOTIVO      IN NUMBER,
                                         PIN_NU_ID_EXPEDIENTE  IN NUMBER,
                                         PIN_NU_ID_MULTA       IN NUMBER,
                                         PIN_VC_FECHA_REGISTRO IN VARCHAR,
                                         PIN_VC_USUARIO        IN VARCHAR,
                                         POUT_NU_COD_ERROR      OUT NUMBER,
                                         POUT_VC_MSJ_ERROR      OUT VARCHAR2) AS 
                                         
  V_NU_ID_EXPEDIENTE_ESTADO T_SCOB_EXPEDIENTE_ESTADO.ID_EXPEDIENTE_ESTADO%TYPE;
  V_DT_AUDFECCREACION       T_SCOB_EXPEDIENTE_ESTADO.AUDFECCREACION%TYPE;                                              
                                                
  BEGIN
    
     BEGIN
    
      SELECT REGI.AUDFECCREACION INTO V_DT_AUDFECCREACION
        FROM (SELECT EXES.*
                FROM T_SCOB_EXPEDIENTE_ESTADO EXES
               WHERE EXES.ID_EXPEDIENTE = PIN_NU_ID_EXPEDIENTE
               ORDER BY 1 DESC) REGI
       WHERE ROWNUM = 1;
       
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        POUT_VC_MSJ_ERROR := 'NO CONFORME : NO HAY DATOS DE T_SCOB_EXPEDIENTE_ESTADO CON : ID_EXPEDIENTE => ' ||
                          PIN_NU_ID_EXPEDIENTE;
        RAISE EX_CONTROLADO;
      WHEN OTHERS THEN
        POUT_VC_MSJ_ERROR := 'NO CONFORME : SCOB_SP_I_ESTADOS_EXPEDIENTE - CONSULTA T_SCOB_EXPEDIENTE_ESTADO - ERROR : ' ||
                          SQLERRM;
        RAISE EX_CONTROLADO;
    END;  
    
    IF TO_DATE(PIN_VC_FECHA_REGISTRO,'DD/MM/YYYY') > TO_DATE(SYSDATE,'DD/MM/YY') THEN
      POUT_VC_MSJ_ERROR := 'LA FECHA NO PUEDE SER MAYOR A LA DE HOY';
      RAISE EX_CONTROLADO;
    END IF;
    
    IF V_DT_AUDFECCREACION > TO_DATE(PIN_VC_FECHA_REGISTRO,'DD/MM/YYYY') THEN
      POUT_VC_MSJ_ERROR := 'LA FECHA NO PUEDE SER MENOR A LA ULTIMA FECHA REGISTRADA POR LOS ESTADOS DEL EXPEDIENTE';
      RAISE EX_CONTROLADO;
    END IF;
  
    V_NU_ID_EXPEDIENTE_ESTADO := USR_SICOB.SCOB_SQ_EXPEDIENTE_ESTADO.NEXTVAL;
    
    INSERT INTO USR_SICOB.T_SCOB_EXPEDIENTE_ESTADO
      (ID_EXPEDIENTE_ESTADO,
       ESTADO_EXPEDIENTE,
       ESTADO,
       AUDFECCREACION,
       AUDUSUCREACION,
       ID_EXPEDIENTE,
       ID_MOTIVO)
    VALUES
      (V_NU_ID_EXPEDIENTE_ESTADO,
       PIN_NU_ID_ESTADO_EXP,
       SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO,
       TO_DATE(PIN_VC_FECHA_REGISTRO,'DD/MM/YYYY'),
       PIN_VC_USUARIO,
       PIN_NU_ID_EXPEDIENTE,
       PIN_NU_ID_MOTIVO);
     
    UPDATE USR_SICOB.T_SCOB_EXPEDIENTE
       SET ID_MOTIVO             = PIN_NU_ID_MOTIVO,
           ESTADO_EXPEDIENTE     = PIN_NU_ID_ESTADO_EXP,
           FEC_ESTADO_EXPEDIENTE = TO_DATE(PIN_VC_FECHA_REGISTRO,'DD/MM/YYYY'),
           AUDFECMODIFICACION    = SYSDATE,
           AUDUSUMODIFICACION    = PIN_VC_USUARIO
     WHERE ID_EXPEDIENTE = PIN_NU_ID_EXPEDIENTE;
     
    INSERT INTO USR_SICOB.T_SCOB_AUDITORIA
            (NU_ID_AUDITORIA,
             NU_ID_TIPO_AUDITORIA,
             NU_ID_MULTA,
             NU_ID_EXPEDIENTE,
             VC_TABLA,
             VC_NOMBRE_LLAVE1,
             VC_NOMBRE_LLAVE2,
             NU_ID_LLAVE1,
             NU_ID_LLAVE2,
             VC_DML,
             VC_DESCRIPCION,
             VC_USUARIO_REGISTRO,
             DT_FECHA_REGISTRO,
             NU_ESTADO)
          VALUES
            (USR_SICOB.SEQ_T_AUDITORIA_ID.NEXTVAL,
             4,
             PIN_NU_ID_MULTA,
             PIN_NU_ID_EXPEDIENTE,
             'T_SCOB_EXPEDIENTE_ESTADO',
             'ID_EXPEDIENTE_ESTADO',
             NULL,
             V_NU_ID_EXPEDIENTE_ESTADO,
             NULL,
             'I',
             'AGREGO ESTADO DEL EXPEDIENTE ID_ESTADO = ' 
             || V_NU_ID_EXPEDIENTE_ESTADO,
             PIN_VC_USUARIO,
             SYSDATE,
             '1');
             
    COMMIT;
    
    POUT_NU_COD_ERROR := 0;
    POUT_VC_MSJ_ERROR := 'CONFORME';
                     
  EXCEPTION
    
    WHEN EX_CONTROLADO THEN
      POUT_NU_COD_ERROR := -1;
      
    WHEN OTHERS THEN
      
      POUT_NU_COD_ERROR := SQLCODE;
      SELECT CASE WHEN POUT_NU_COD_ERROR > 0 THEN POUT_NU_COD_ERROR * -1 ELSE POUT_NU_COD_ERROR END
        INTO POUT_NU_COD_ERROR
        FROM DUAL;
      POUT_VC_MSJ_ERROR := SUBSTR(SQLERRM, 1, 250);
      ROLLBACK;
      
   END;
 

  -- ******************************************************************************
  -- Descripción: Procedure que revierte un expediente a no iniciado
  --
  --
  -- Output Parameters: PO_N_COD_ERROR , PO_V_MSJ_ERROR
  --
  --
  -- Author:      Victor Bendezú
  -- Proyecto:    Incidencias SICOB
  --
  -- Revisiones
  -- Fecha            Autor         Motivo del cambio    
  -- ----------------------------------------------------------------
  -- 30/12/2022     Victor Bendezú  Incidencias SICOB   
  -- ***************************************************************      
  PROCEDURE SCOB_SP_U_REVERTIR_EXPEDIENTE(PIN_NU_ID_EXPEDIENTE IN NUMBER,
                                          PIN_VC_USUARIO       IN VARCHAR,
                                          POUT_NU_COD_ERROR     OUT NUMBER,
                                          POUT_VC_MSJ_ERROR     OUT VARCHAR2) AS
                                          
  REG_T_SCOB_EXPEDIENTE_MULTA T_SCOB_EXPEDIENTE_MULTA%ROWTYPE;                                      
  REG_T_SCOB_EXPEDIENTE       T_SCOB_EXPEDIENTE%ROWTYPE;
  
  V_NU_ID_EXPEDIENTE_ESTADO      T_SCOB_EXPEDIENTE_ESTADO.ID_EXPEDIENTE_ESTADO%TYPE;
  
  CURSOR CURSOR_T_SCOB_EXPEDIENTE_MULTA IS
   SELECT EM.*
     FROM USR_SICOB.T_SCOB_EXPEDIENTE_MULTA EM
    WHERE EM.ID_EXPEDIENTE = PIN_NU_ID_EXPEDIENTE
    AND EM.ESTADO = '1';

  BEGIN
    
    -- SE OBTIENE EL EXPEDIENTE A EVALUAR
    SELECT EXPE.*
      INTO REG_T_SCOB_EXPEDIENTE
      FROM USR_SICOB.T_SCOB_EXPEDIENTE EXPE
     WHERE EXPE.ID_EXPEDIENTE = PIN_NU_ID_EXPEDIENTE;
     
    -- VALIDAMOS LOS ESTADOS DEL EXPEDIENTE
    IF REG_T_SCOB_EXPEDIENTE.ESTADO_EXPEDIENTE <> 1 AND REG_T_SCOB_EXPEDIENTE.ESTADO_EXPEDIENTE <> 3 THEN
      POUT_VC_MSJ_ERROR := 'ESTADO DEL EXPEDIENTE DEBE SER PRE-COACTIVO O EN EJECUCION COACTIVA';
      RAISE EX_CONTROLADO;
    END IF;
    
    -- VALIDAMOS EL MES DE LA REVERSION RESPECTO A LA FECHA DE EXPEDIENTE
    IF TO_CHAR(REG_T_SCOB_EXPEDIENTE.FEC_INGRESO, 'mmyyyy') <> TO_CHAR(SYSDATE, 'mmyyyy')  THEN
      POUT_VC_MSJ_ERROR := 'SOLO PUEDE REVERTIR EN EL MISMO MES DE LA GENERACION DEL EXPEDIENTE';
      RAISE EX_CONTROLADO;
    END IF;
    
    -- SE OBTIENE EL ULTIMO ESTADO EXPEDIENTE ACTIVO
    SELECT REGI.ID_EXPEDIENTE_ESTADO INTO V_NU_ID_EXPEDIENTE_ESTADO
        FROM (SELECT EXES.*
                FROM T_SCOB_EXPEDIENTE_ESTADO EXES
               WHERE EXES.ID_EXPEDIENTE = PIN_NU_ID_EXPEDIENTE
               AND EXES.ESTADO = '1'
               ORDER BY 1 DESC) REGI
       WHERE ROWNUM = 1;
       
    -- SE ACTUALIZA EL ULTIMO ESTADO EXPEDIENTE ACTIVO
    UPDATE USR_SICOB.T_SCOB_EXPEDIENTE_ESTADO EXES
       SET EXES.CH_TIPO_ELIMINACION = '01'
     WHERE EXES.ID_EXPEDIENTE_ESTADO = V_NU_ID_EXPEDIENTE_ESTADO;

    -- ANULACION DEL DOCUMENTO DEL EXPEDIENTE
    UPDATE USR_SICOB.T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
       SET EXDO.ESTADO           = '0',
           EXDO.AUDFECMODIFICACION = SYSDATE,
           EXDO.AUDUSUMODIFICACION = PIN_VC_USUARIO 
     WHERE EXDO.ID_EXPEDIENTE = PIN_NU_ID_EXPEDIENTE;

    -- ANULACION DE LOS ESTADO DEL EXPEDIENTE
    UPDATE USR_SICOB.T_SCOB_EXPEDIENTE_ESTADO EXES
       SET EXES.ESTADO             = '0',
           EXES.AUDFECMODIFICACION = SYSDATE,
           EXES.AUDUSUMODIFICACION = PIN_VC_USUARIO
     WHERE EXES.ID_EXPEDIENTE = PIN_NU_ID_EXPEDIENTE;    
    
    -- ANULACION DEL EXPEDIENTE
    UPDATE USR_SICOB.T_SCOB_EXPEDIENTE EXPE
       SET EXPE.ESTADO             = '0',
           EXPE.AUDFECMODIFICACION = SYSDATE,
           EXPE.AUDUSUMODIFICACION = PIN_VC_USUARIO
     WHERE EXPE.ID_EXPEDIENTE = PIN_NU_ID_EXPEDIENTE;
     
    -- ANULACION DEL EXPEDIENTE PERSONA
    UPDATE USR_SICOB.T_SCOB_EXPEDIENTE_PERSONA EXPE
       SET EXPE.ESTADO             = '0',
           EXPE.AUDFECMODIFICACION = SYSDATE,
           EXPE.AUDUSUMODIFICACION = PIN_VC_USUARIO
     WHERE EXPE.ID_EXPEDIENTE = PIN_NU_ID_EXPEDIENTE;
     
    -- ANULACION DEL EXPEDIENTE DOCUMENTO COACTIVO
    UPDATE USR_SICOB.T_SCOB_EXPED_COACTIVO_DOC EXCO
       SET EXCO.ESTADO             = '0',
           EXCO.AUDFECMODIFICACION = SYSDATE,
           EXCO.AUDUSUMODIFICACION = PIN_VC_USUARIO
     WHERE EXCO.ID_EXPEDIENTE = PIN_NU_ID_EXPEDIENTE;
    
    -- ANULACION DEL EXPEDIENTE DOCUMENTO DIRECCION
    UPDATE USR_SICOB.T_SCOB_EXPED_DOCUMENTO_DIREC EXDD
       SET EXDD.ESTADO             = '0',
           EXDD.AUDFECMODIFICACION = SYSDATE,
           EXDD.AUDUSUMODIFICACION = PIN_VC_USUARIO
     WHERE EXDD.ID_EXPEDIENTE = PIN_NU_ID_EXPEDIENTE;

    -- SI TIENE COSTAS ANULACION DE COSTAS DEL EXPEDIENTE
    IF REG_T_SCOB_EXPEDIENTE.MONTO_COSTAS > 0 THEN
      
      UPDATE USR_SICOB.T_SCOB_EXPEDIENTE_COSTA EXCO
         SET EXCO.ESTADO             = '0',
             EXCO.AUDFECMODIFICACION = SYSDATE,
             EXCO.AUDUSUMODIFICACION = PIN_VC_USUARIO
       WHERE EXCO.ID_EXPEDIENTE = PIN_NU_ID_EXPEDIENTE;

    END IF;
    
    OPEN CURSOR_T_SCOB_EXPEDIENTE_MULTA;
    
      LOOP 
          
        FETCH CURSOR_T_SCOB_EXPEDIENTE_MULTA INTO REG_T_SCOB_EXPEDIENTE_MULTA;
           
        EXIT WHEN CURSOR_T_SCOB_EXPEDIENTE_MULTA%NOTFOUND;    
        
        -- ACTUALIZAR LOS MONTOS DE LA MULTA DESCONTANDO LAS COSTAS
        IF REG_T_SCOB_EXPEDIENTE.MONTO_COSTAS > 0 THEN
          UPDATE USR_SICOB.T_SCOB_MULTA MULT
             SET MULT.MONTO_COSTAS      = 0,
                 MULT.MONTO_TOTAL_DEUDA = MULT.MONTO_UIT + MULT.MONTO_INTERES + MULT.MONTO_INTERES_MORATORIO,
                 MULT.SALDO_COSTAS      = 0,
                 MULT.SALDO_TOTAL_DEUDA = MULT.SALDO + MULT.SALDO_IC + MULT.SALDO_IM
           WHERE MULT.ID_MULTA = REG_T_SCOB_EXPEDIENTE_MULTA.ID_MULTA;
         END IF;

        -- INACTIVAR LOS ESTADOS POSTERIORES A NO INICIADO DE LAS MULTAS
        UPDATE USR_SICOB.T_SCOB_MULTA_ESTADO MUES
           SET MUES.ESTADO             = '0',
               MUES.AUDFECMODIFICACION = SYSDATE,
               MUES.AUDUSUMODIFICACION = PIN_VC_USUARIO
         WHERE MUES.ID_MULTA = REG_T_SCOB_EXPEDIENTE_MULTA.ID_MULTA
           AND MUES.ESTADO_MULTA > 9;
        
        -- ACTUALIZAR EL ESTADO DE LA MULTA A NO INICIADO CON EL MOTIVO Y EL RECALCULO DEL SALDO
        UPDATE USR_SICOB.T_SCOB_MULTA MULT
           SET MULT.ESTADO_MULTA     = 9,
               MULT.COD_MOTIVO       = 1,
               MULT.FEC_ESTADO_MULTA = SYSDATE,
               MULT.SALDO = MULT.MONTO_UIT - (MULT.TOTAL_AMORTIZADO_IM + MULT.TOTAL_AMORTIZADO + MULT.TOTAL_AMORTIZADO_IC)
         WHERE MULT.ID_MULTA = REG_T_SCOB_EXPEDIENTE_MULTA.ID_MULTA;
       
         INSERT INTO USR_SICOB.T_SCOB_AUDITORIA
            (NU_ID_AUDITORIA,
             NU_ID_TIPO_AUDITORIA,
             NU_ID_MULTA,
             NU_ID_EXPEDIENTE,
             VC_TABLA,
             VC_NOMBRE_LLAVE1,
             VC_NOMBRE_LLAVE2,
             NU_ID_LLAVE1,
             NU_ID_LLAVE2,
             VC_DML,
             VC_DESCRIPCION,
             VC_USUARIO_REGISTRO,
             DT_FECHA_REGISTRO,
             NU_ESTADO)
          VALUES
            (USR_SICOB.SEQ_T_AUDITORIA_ID.NEXTVAL,
             6,
             REG_T_SCOB_EXPEDIENTE_MULTA.ID_MULTA,
             REG_T_SCOB_EXPEDIENTE_MULTA.ID_EXPEDIENTE,
             'T_SCOB_EXPEDIENTE_ESTADO',
             'ID_EXPEDIENTE_ESTADO',
             NULL,
             V_NU_ID_EXPEDIENTE_ESTADO,
             NULL,
             'D',
             'ELIMINACION DEL EXPEDIENTE : ' 
              || REG_T_SCOB_EXPEDIENTE.ANIO || REG_T_SCOB_EXPEDIENTE.NRO_EXPEDIENTE,
             PIN_VC_USUARIO,
             SYSDATE,
             '1');
           
          --INICIO VICTOR BENDEZU - MIGRACION SICOB A SIA    
            USR_SIA_INTFZ.PKG_INTFZ_REG_MULTA_SICOB_SIA.SP_U_MULTA_SICOB_A_SIA(PIN_NU_ID_MULTA => REG_T_SCOB_EXPEDIENTE_MULTA.ID_MULTA,
                                                                      POUT_NU_COD_RESULT => POUT_NU_COD_ERROR,
                                                                      POUT_VC_MSG_RESULT => POUT_VC_MSJ_ERROR);
            IF POUT_NU_COD_ERROR < 0 THEN
              ROLLBACK;
              RETURN;
            END IF;
            USR_SICOB.PKG_RECAUDACION_BANCOS.SP_DO_GRABAR_BN(PIN_NU_ID_MULTA => REG_T_SCOB_EXPEDIENTE_MULTA.ID_MULTA,
                                                                 POUT_NU_COD_RESULT => POUT_NU_COD_ERROR,
                                                                 POUT_VC_MSG_RESULT => POUT_VC_MSJ_ERROR);
            IF POUT_NU_COD_ERROR < 0 THEN
              ROLLBACK;
              RETURN;
            END IF;
            USR_SICOB.PKG_RECAUDACION_BANCOS.SP_DO_GRABAR_ASBANC(PIN_NU_ID_MULTA => REG_T_SCOB_EXPEDIENTE_MULTA.ID_MULTA,
                                                                     POUT_NU_COD_RESULT => POUT_NU_COD_ERROR,
                                                                     POUT_VC_MSG_RESULT => POUT_VC_MSJ_ERROR);
            IF POUT_NU_COD_ERROR < 0 THEN
              ROLLBACK;
              RETURN;
            END IF;    
            --FIN VICTOR BENDEZU - MIGRACION SICOB A SIA--INICIO VICTOR BENDEZU - MIGRACION SICOB A SIA   
  
      END LOOP;
        
    CLOSE CURSOR_T_SCOB_EXPEDIENTE_MULTA;    
    
    -- ANULACION DE LAS MULTAS POR EXPEDIENTE
    UPDATE USR_SICOB.T_SCOB_EXPEDIENTE_MULTA EXMU
       SET EXMU.ESTADO             = '0',
           EXMU.AUDFECMODIFICACION = SYSDATE,
           EXMU.AUDUSUMODIFICACION = PIN_VC_USUARIO
     WHERE EXMU.ID_EXPEDIENTE = PIN_NU_ID_EXPEDIENTE;
     
     
     
    COMMIT;
    
    POUT_NU_COD_ERROR := 0;
    POUT_VC_MSJ_ERROR := 'CONFORME';
                     
  EXCEPTION
    
    WHEN EX_CONTROLADO THEN
      POUT_NU_COD_ERROR := -1;
      ROLLBACK;
      
    WHEN OTHERS THEN
      
      POUT_NU_COD_ERROR := SQLCODE;
      SELECT CASE WHEN POUT_NU_COD_ERROR > 0 THEN POUT_NU_COD_ERROR * -1 ELSE POUT_NU_COD_ERROR END
        INTO POUT_NU_COD_ERROR
        FROM DUAL;
      POUT_VC_MSJ_ERROR := SUBSTR(SQLERRM, 1, 250);
      ROLLBACK;
      
 END;
 
   -- ******************************************************************************
  -- Descripción: Procedure que cambia estado de embargo a un expediente
  --
  --
  -- Output Parameters: PO_N_COD_ERROR , PO_V_MSJ_ERROR
  --
  --
  -- Author:      Victor Bendezú
  -- Proyecto:    Incidencias SICOB
  --
  -- Revisiones
  -- Fecha            Autor         Motivo del cambio    
  -- ----------------------------------------------------------------
  -- 30/12/2022     Victor Bendezú  Incidencias SICOB   
  -- ***************************************************************      
  PROCEDURE SCOB_SP_U_EMBARGO_EXPEDIENTE(PIN_NU_ID_EXPEDIENTE IN NUMBER,
                                         PIN_VC_FLG_EMBARGO   IN VARCHAR,
                                         PIN_VC_USUARIO       IN VARCHAR,
                                         POUT_NU_COD_ERROR     OUT NUMBER,
                                         POUT_VC_MSJ_ERROR     OUT VARCHAR2) AS
  BEGIN

    POUT_NU_COD_ERROR := -1;
    POUT_VC_MSJ_ERROR := '';

    UPDATE USR_SICOB.T_SCOB_EXPEDIENTE EX
       SET EX.FLG_EMBARGO = PIN_VC_FLG_EMBARGO,
           EX.AUDFECMODIFICACION = SYSDATE,
           EX.AUDUSUMODIFICACION = PIN_VC_USUARIO
     WHERE EX.ID_EXPEDIENTE = PIN_NU_ID_EXPEDIENTE;

    POUT_NU_COD_ERROR := 0;
    POUT_VC_MSJ_ERROR := 'CONFORME';

    COMMIT;
    
  EXCEPTION
    WHEN OTHERS THEN
      
      POUT_NU_COD_ERROR := SQLCODE;
      SELECT CASE WHEN POUT_NU_COD_ERROR > 0 THEN POUT_NU_COD_ERROR * -1 ELSE POUT_NU_COD_ERROR END
        INTO POUT_NU_COD_ERROR
        FROM DUAL;
      POUT_VC_MSJ_ERROR := SUBSTR(SQLERRM, 1, 250) || ' - ' || TO_CHAR(PIN_NU_ID_EXPEDIENTE);
      ROLLBACK;
    
  END;
  
 -- ******************************************************************************
  -- Descripción: Procedure que genera asiento contable
  --
  --
  -- Output Parameters: PO_N_COD_ERROR , PO_V_MSJ_ERROR
  --
  --
  -- Author:      Victor Bendezú
  -- Proyecto:    Incidencias SICOB
  --
  -- Revisiones
  -- Fecha            Autor         Motivo del cambio    
  -- ----------------------------------------------------------------
  -- 30/12/2022     Victor Bendezú  Incidencias SICOB   
  -- ***************************************************************      
  PROCEDURE SCOB_SP_I_ASIENTO_CONTABLE(PIN_VC_CUM                     VARCHAR2,
                                       PIN_NU_TIPO_CAMBIO             NUMBER,
                                       PIN_VC_ANIO_NC                 VARCHAR2,
                                       PIN_VC_NRO_NC                  VARCHAR2,
                                       PIN_VC_DESC_TIPO_PAGO          VARCHAR2,
                                       PIN_VC_COD_ESTADO_PAGO         VARCHAR2,
                                       PIN_VC_DESC_CAJA               VARCHAR2,
                                       PIN_NU_MTO_CAPITAL             NUMBER,
                                       PIN_NU_MTO_IC                  NUMBER,
                                       PIN_NU_MTO_IM                  NUMBER,
                                       PIN_NU_MTO_CG                  NUMBER,
                                       PIN_NU_MTO_EXCESO              NUMBER,
                                       PIN_VC_GLOSA                   VARCHAR2,
                                       PIN_VC_DESC_TIPO_SUBCONTA      VARCHAR2,
                                       PIN_DT_GENERACION_CI           DATE,
                                       PIN_VC_USUARIO                 VARCHAR2,
                                       PIN_NU_TIPO_SUBCONTAB_COMP_REF NUMBER,
                                       PIN_VC_ANIO_COMP_REF           VARCHAR2,
                                       PIN_VC_NRO_COMP_REF            VARCHAR2,
                                       PIN_VC_TIPO_CONTABILIDAD       VARCHAR2,
                                       PIN_NU_MTO_AMORTIZADO          NUMBER,
                                       PIN_VC_DESC_BANCO              VARCHAR2,
                                       PIN_NU_ID_MONEDA               NUMBER,
                                       PIN_VC_DESC_MONEDA             VARCHAR2,
                                       PIN_NU_IMPORTE_SOLES           NUMBER,
                                       PIN_NU_IMPORTE_DOLARES         NUMBER,
                                       PIN_DT_PROCESO                 DATE,
                                       PIN_VC_NRO_DOC_BANCO           VARCHAR2,
                                       PO_N_COD_ERROR                 OUT NUMBER,
                                       PO_V_MSJ_ERROR                 OUT VARCHAR2) AS

  REG_T_SCOB_EXPEDIENTE_MULTA      T_SCOB_EXPEDIENTE_MULTA%ROWTYPE;
  
  V_NU_ID_COMPROBANTE_INGRESO NUMBER;
  V_NU_MONTO_TOTAL            NUMBER; 
                                       
  BEGIN

    PO_N_COD_ERROR := -1;
    PO_V_MSJ_ERROR := '';
    
    -- OBTENEMOS EL EXPEDIENTE
    SELECT EM.*
      INTO REG_T_SCOB_EXPEDIENTE_MULTA
      FROM USR_SICOB.T_SCOB_MULTA M, USR_SICOB.T_SCOB_EXPEDIENTE_MULTA EM
     WHERE M.ID_MULTA = EM.ID_MULTA
       AND M.ANIO || M.CUM = PIN_VC_CUM
       AND ROWNUM = 1;
                             
    -- OBTENEMOS EL CORRELATIVO DE LA TABLA T_SCOB_COMPROBANTE_INGRESO
    SELECT USR_SICOB.SCOB_SQ_COMPROBANTE_INGRESO.NEXTVAL
      INTO V_NU_ID_COMPROBANTE_INGRESO
      FROM DUAL;
    
    -- CALCULO SUMA TOTAL
    V_NU_MONTO_TOTAL := PIN_NU_MTO_CAPITAL + PIN_NU_MTO_IC + PIN_NU_MTO_IM + PIN_NU_MTO_CG + PIN_NU_MTO_EXCESO;
    
    -- REGISTRAMOS EL ASIENTO
    INSERT INTO USR_SICOB.T_SCOB_COMPROBANTE_INGRESO
        (ID_COMPROBANTE_INGRESO,
         ID_MULTA,
         ID_EXPEDIENTE,
         TIPO_CAMBIO,
         NRO_CI,
         DESC_TIPO_PAGO,
         COD_TIPO_SUBCONTABILIZACION,
         DESC_TIPO_SUBCONTA,
         DESC_CAJA,
         FEC_GENERACION_CI,
         MONTO,
         MONTO_IC,
         MONTO_IM,
         MONTO_CG,
         MONTO_EXCESO,
         MONTO_TOTAL,
         DESC_GLOSA,
         FEC_REGISTRO,
         AUDUSUCREACION,
         AUDFECCREACION,
         ESTADO,
         NRO_TRANSACCION,
         ID_EXPED_CRONOGRAMA_PAGO,
         NU_ID_EMPRESA,
         CH_ANIO,
         NU_ID_CI,
         COD_ESTADO_PAGO,
         NU_ID_TIPO_SUBCONTABILIZACION,
         NU_MUL_CUM_CUOTA_INI,
         NU_MUL_CUM_CUOTA_FIN)
      VALUES
        (V_NU_ID_COMPROBANTE_INGRESO ,
         REG_T_SCOB_EXPEDIENTE_MULTA.ID_MULTA,
         REG_T_SCOB_EXPEDIENTE_MULTA.ID_EXPEDIENTE ,
         PIN_NU_TIPO_CAMBIO ,
         PIN_VC_NRO_NC, 
         PIN_VC_DESC_TIPO_PAGO , 
         PIN_NU_TIPO_SUBCONTAB_COMP_REF , 
         PIN_VC_DESC_TIPO_SUBCONTA,
         PIN_VC_DESC_CAJA, 
         PIN_DT_GENERACION_CI,
         PIN_NU_MTO_CAPITAL, 
         PIN_NU_MTO_IC,
         PIN_NU_MTO_IM, 
         PIN_NU_MTO_CG, 
         PIN_NU_MTO_EXCESO, 
         V_NU_MONTO_TOTAL,
         PIN_VC_GLOSA, 
         PIN_DT_GENERACION_CI,
         PIN_VC_USUARIO , 
         PIN_DT_GENERACION_CI,
         '1', 
         0, 
         NULL, 
         1, 
         PIN_VC_ANIO_NC, 
         NULL, 
         PIN_VC_COD_ESTADO_PAGO, 
         99,
         0, 
         0 
         );
         
    -- DETALLE DEL ASIENTO CONTABLE
         
    -- SI ES CAPITAL
    IF PIN_VC_TIPO_CONTABILIDAD = '1' THEN
      INSERT INTO USR_SICOB.T_SCOB_COMPROBANTE_INGRESO_DET
        (ID_COMPROBANTE_INGRESO_DET,
         ID_COMPROBANTE_INGRESO,
         VC_COD_CONCEPTO,
         VC_DESC_CONCEPTO,
         COD_CONCEPTO,
         MONTO_AMORTIZADO,
         ESTADO_PAGO,
         ESTADO)
      VALUES
        (USR_SICOB.SCOB_SQ_COMPROBANTE_INGRESODET.NEXTVAL,
         V_NU_ID_COMPROBANTE_INGRESO,
         'MU0000001 ',
         'CAPITAL MULTAS',
         NULL,
         PIN_NU_MTO_AMORTIZADO,
         NULL,
         '1');
    END IF;
    
    -- SI ES COSTA Y GASTOS
    IF PIN_VC_TIPO_CONTABILIDAD = '2' THEN
      INSERT INTO USR_SICOB.T_SCOB_COMPROBANTE_INGRESO_DET
        (ID_COMPROBANTE_INGRESO_DET,
         ID_COMPROBANTE_INGRESO,
         VC_COD_CONCEPTO,
         VC_DESC_CONCEPTO,
         COD_CONCEPTO,
         MONTO_AMORTIZADO,
         ESTADO_PAGO,
         ESTADO)
      VALUES
        (USR_SICOB.SCOB_SQ_COMPROBANTE_INGRESODET.NEXTVAL,
         V_NU_ID_COMPROBANTE_INGRESO,
         'MU0000002 ',
         'COSTAS Y GASTO - MULTAS',
         NULL,
         PIN_NU_MTO_AMORTIZADO,
         NULL,
         '1');
    END IF;
    
    -- SI ES INTERES MULTA
    IF PIN_VC_TIPO_CONTABILIDAD = '3' THEN
      INSERT INTO USR_SICOB.T_SCOB_COMPROBANTE_INGRESO_DET
        (ID_COMPROBANTE_INGRESO_DET,
         ID_COMPROBANTE_INGRESO,
         VC_COD_CONCEPTO,
         VC_DESC_CONCEPTO,
         COD_CONCEPTO,
         MONTO_AMORTIZADO,
         ESTADO_PAGO,
         ESTADO)
      VALUES
        (USR_SICOB.SCOB_SQ_COMPROBANTE_INGRESODET.NEXTVAL,
         V_NU_ID_COMPROBANTE_INGRESO,
         'MU0000003 ',
         'INTERES- MULTAS',
         NULL,
         PIN_NU_MTO_AMORTIZADO,
         NULL,
         '1');
    END IF;
    
    -- SI ES EXCESO
    IF PIN_VC_TIPO_CONTABILIDAD = '4' THEN
      INSERT INTO USR_SICOB.T_SCOB_COMPROBANTE_INGRESO_DET
        (ID_COMPROBANTE_INGRESO_DET,
         ID_COMPROBANTE_INGRESO,
         VC_COD_CONCEPTO,
         VC_DESC_CONCEPTO,
         COD_CONCEPTO,
         MONTO_AMORTIZADO,
         ESTADO_PAGO,
         ESTADO)
      VALUES
        (USR_SICOB.SCOB_SQ_COMPROBANTE_INGRESODET.NEXTVAL,
         V_NU_ID_COMPROBANTE_INGRESO,
         'MU0000005 ',
         'EXCESO- MULTAS',
         NULL,
         PIN_NU_MTO_AMORTIZADO,
         NULL,
         '1');
    END IF;
    
    -- FORMA DE PAGO
    INSERT INTO USR_SICOB.T_SCOB_COMPROBANTE_FORMA_PAGO
      (ID_COMPROBANTE_INGRESO_PAGO,
       ID_COMPROBANTE_INGRESO,
       NU_ID_TIPO_PAGO,
       DESC_TIPO_PAGO,
       NU_ID_BANCO,
       DESC_BANCO,
       NU_ID_MONEDA,
       DESC_MONEDA,
       NU_IMPORTE_SOLES,
       NU_IMPORTE_DOLARES,
       DT_PROCESO,
       ESTADO,
       VC_NRO_DOC_BANCO)
    VALUES
      (USR_SICOB.SCOB_SQ_COMPROBANTE_INGRESOFPA.NEXTVAL,
       V_NU_ID_COMPROBANTE_INGRESO,
       NULL,
       'RECAUDACION EXTERNA',
       NULL,
       PIN_VC_DESC_BANCO,
       PIN_NU_ID_MONEDA,
       PIN_VC_DESC_MONEDA,
       PIN_NU_IMPORTE_SOLES,
       PIN_NU_IMPORTE_DOLARES,
       PIN_DT_PROCESO,
       '1',
       PIN_VC_NRO_DOC_BANCO);

    PO_N_COD_ERROR := 0;
    PO_V_MSJ_ERROR := 'CONFORME';

    COMMIT;
    
  EXCEPTION
    WHEN OTHERS THEN
      
      PO_N_COD_ERROR := SQLCODE;
      SELECT CASE WHEN PO_N_COD_ERROR > 0 THEN PO_N_COD_ERROR * -1 ELSE PO_N_COD_ERROR END
        INTO PO_N_COD_ERROR
        FROM DUAL;
      PO_V_MSJ_ERROR := SUBSTR(SQLERRM, 1, 250) || ' - ' || TO_CHAR(PIN_VC_CUM);
      ROLLBACK;
    
  END;
  
    -- ******************************************************************************
  -- Descripción: Procedure que retorna la lista cums de un expediente acumulador
  --
  --
  -- Output Parameters: PO_CU_RETORNO, PO_N_COD_ERROR , PO_V_MSJ_ERROR
  --
  --
  -- Author:      Victor Bendezú
  -- Proyecto:    Incidencias SICOB
  --
  -- Revisiones
  -- Fecha            Autor         Motivo del cambio    
  -- ----------------------------------------------------------------
  -- 30/12/2022     Victor Bendezú  Incidencias SICOB   
  -- ***************************************************************      
  PROCEDURE SCOB_SP_S_CUMS_EXPEDIENTE(PIN_NU_ID_EXPEDIENTE IN NUMBER,
                                      POUT_CUR_RETORNO    OUT CU_REC_SET,
                                      POUT_NU_COD_ERROR   OUT NUMBER,
                                      POUT_VC_MSJ_ERROR   OUT VARCHAR2) AS
  BEGIN

    POUT_NU_COD_ERROR := -1;
    POUT_VC_MSJ_ERROR := '';

    OPEN POUT_CUR_RETORNO FOR 
         
     SELECT *
       FROM (SELECT EX.ANIO || EX.NRO_EXPEDIENTE || ' - ' || MU.ANIO || MU.CUM AS EXP_ACUM,
                    MU.ID_MULTA,
                    EX.ID_EXPEDIENTE
               FROM USR_SICOB.T_SCOB_SOLIC_DESACUM SA
              INNER JOIN USR_SICOB.T_SCOB_MULTA MU
                 ON (SA.ID_MULTA = MU.ID_MULTA)
              INNER JOIN USR_SICOB.T_SCOB_EXPEDIENTE EX
                 ON (SA.ID_EXP_ORIGEN = EX.ID_EXPEDIENTE)
              WHERE SA.ID_EXP_DESTINO = PIN_NU_ID_EXPEDIENTE
             UNION ALL
             SELECT EX.ANIO || EX.NRO_EXPEDIENTE || ' - ' || 'CUM ACUM.' AS EXP_ACUM,
                    0,
                    EX.ID_EXPEDIENTE
               FROM USR_SICOB.T_SCOB_EXPEDIENTE EX
              WHERE EX.ID_EXPEDIENTE = PIN_NU_ID_EXPEDIENTE)
      ORDER BY 1 ASC;
    
    POUT_NU_COD_ERROR := 0;
    POUT_VC_MSJ_ERROR := 'CONFORME';
    
  EXCEPTION
    WHEN OTHERS THEN
      
      POUT_NU_COD_ERROR := SQLCODE;
      SELECT CASE WHEN POUT_NU_COD_ERROR > 0 THEN POUT_NU_COD_ERROR * -1 ELSE POUT_NU_COD_ERROR END
        INTO POUT_NU_COD_ERROR
        FROM DUAL;
      POUT_VC_MSJ_ERROR := SUBSTR(SQLERRM, 1, 250);
    
  END;  
  
    -- ******************************************************************************
  -- Descripción: Procedure que retorna la lista ccstas de un cums de un expediente
  --
  --
  -- Output Parameters: PO_CU_RETORNO, PO_N_COD_ERROR , PO_V_MSJ_ERROR
  --
  --
  -- Author:      Victor Bendezú
  -- Proyecto:    Incidencias SICOB
  --
  -- Revisiones
  -- Fecha            Autor         Motivo del cambio    
  -- ----------------------------------------------------------------
  -- 30/12/2022     Victor Bendezú  Incidencias SICOB   
  -- ***************************************************************      
  PROCEDURE SCOB_SP_S_COSTAS_CUM_EXPEDIENT(PIN_NUID_EXPEDIENTE     IN NUMBER,
                                            PIN_NUCUM_ID_EXPEDIENTE IN NUMBER,
                                            POUT_CUR_RETORNO        OUT CU_REC_SET,
                                            POUT_NU_COD_ERROR       OUT NUMBER,
                                            POUT_VC_MSJ_ERROR       OUT VARCHAR2) AS
                                            
  V_NU_SALDO_CAPITAL T_SCOB_EXPEDIENTE.SALDO%TYPE;
  V_NU_MONTO_UIT     T_SCOB_UIT.MONTO_UIT%TYPE;
  
  BEGIN

    POUT_NU_COD_ERROR := -1;
    POUT_VC_MSJ_ERROR := '';

    V_NU_MONTO_UIT := NULL;
    SELECT UIT.MONTO_UIT
      INTO V_NU_MONTO_UIT
      FROM T_SCOB_UIT UIT
     WHERE TO_DATE(TO_CHAR(SYSDATE, 'DD/MM/YYYY'), 'DD/MM/YYYY') BETWEEN
           UIT.FECHA_INICIO AND UIT.FECHA_FIN
       AND UIT.ESTADO = '1';
  
    SELECT MULT.SALDO +
           (DECODE(MULT.FLG_TIPO_MULTA, '0', 0, NVL(MULT.SALDO_IC, 0)))
      INTO V_NU_SALDO_CAPITAL
      FROM T_SCOB_MULTA MULT
     INNER JOIN T_SCOB_EXPEDIENTE_MULTA EXMU
        ON EXMU.ID_MULTA = MULT.ID_MULTA
       AND EXMU.ESTADO = '1'
     INNER JOIN T_SCOB_EXPEDIENTE EXPE
        ON EXMU.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
     WHERE EXMU.ID_EXPEDIENTE = PIN_NUID_EXPEDIENTE
       AND MULT.ID_MULTA =
           SCOB_PK_EXPEDIENTE.SCOB_FN_MUL_ANTIGUO(EXMU.ID_EXPEDIENTE)
    UNION
    SELECT MULT.SALDO +
           (DECODE(MULT.FLG_TIPO_MULTA, '0', 0, NVL(MULT.SALDO_IC, 0)))
      FROM T_SCOB_MULTA MULT
     INNER JOIN T_SCOB_EXPEDIENTE_MULTA EXMU
        ON EXMU.ID_MULTA = MULT.ID_MULTA
     INNER JOIN T_SCOB_EXPEDIENTE EXPE
        ON EXMU.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
       AND EXPE.NRO_CUMS > 1
     WHERE EXMU.ID_EXPEDIENTE = PIN_NUID_EXPEDIENTE
       AND MULT.ID_MULTA =
           SCOB_PK_EXPEDIENTE.SCOB_FN_MUL_ANTIGUO(EXMU.ID_EXPEDIENTE);
    
    OPEN POUT_CUR_RETORNO FOR
      SELECT
       CSTA.ID_COSTA AS ID_COSTAS,
       CSTA.CODIGO AS COD_COSTAS,
       CSTA.DESCRIPCION AS NOM_COSTAS,
       SUM(ECOS.CNT_COSTA) AS CANT_COSTA,
       NVL(SUM(ECOS.MONTO_COSTA), 0) AS MONTO_COSTAS,
       
       DECODE(NVL(CSTA.FLG_GASTO, '0'),
              '1',
              1,
              DECODE(NVL(CSTA.FLG_UIT_MAX, '0'),
                     '0',
                     CSTA.PORCENTAJE_UIT,
                     CSTA.PORCENTAJE_UIT_MAX)) AS PORCENTAJE_UIT,
       
       DECODE(NVL(CSTA.FLG_GASTO, '0'),
              '1',
              1,
              DECODE(NVL(CSTA.FLG_UIT_MAX, '0'),
                     '0',
                     V_NU_MONTO_UIT * (CSTA.PORCENTAJE_UIT / 100),
                     CASE
                       WHEN V_NU_SALDO_CAPITAL * (CSTA.PORCENTAJE_UIT / 100) >
                            V_NU_MONTO_UIT * (CSTA.PORCENTAJE_UIT_MAX / 100) THEN
                        V_NU_MONTO_UIT * (CSTA.PORCENTAJE_UIT_MAX / 100)
                       ELSE
                        V_NU_SALDO_CAPITAL * (CSTA.PORCENTAJE_UIT / 100)
                     END)) AS VALOR_SOLES,
       
       NVL(CSTA.FLG_GASTO, '0') AS FLG_GASTO,
       V_NU_SALDO_CAPITAL AS SALDO_CAPITAL,
       NVL(FLG_UIT_MAX, '0') AS FLG_UIT_MAX
        FROM T_SCOB_COSTA CSTA
        LEFT JOIN T_SCOB_EXPEDIENTE_COSTA ECOS
          ON ECOS.ID_COSTA = CSTA.ID_COSTA
         AND ECOS.ID_EXPEDIENTE = PIN_NUCUM_ID_EXPEDIENTE
         AND ECOS.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
       WHERE CSTA.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
       GROUP BY CSTA.ID_COSTA,
                CSTA.CODIGO,
                CSTA.DESCRIPCION,
                CSTA.FLG_UIT_MAX,
                CSTA.PORCENTAJE_UIT,
                CSTA.PORCENTAJE_UIT_MAX,
                CSTA.FLG_GASTO
       ORDER BY TO_NUMBER(NVL(CSTA.CODIGO, 0)) ASC,
                NVL(CSTA.FLG_GASTO, 0) DESC;
               
    POUT_NU_COD_ERROR := 0;
    POUT_VC_MSJ_ERROR := 'CONFORME';
    
  EXCEPTION
    WHEN OTHERS THEN
      
      POUT_NU_COD_ERROR := SQLCODE;
      SELECT CASE WHEN POUT_NU_COD_ERROR > 0 THEN POUT_NU_COD_ERROR * -1 ELSE POUT_NU_COD_ERROR END
        INTO POUT_NU_COD_ERROR
        FROM DUAL;
      POUT_VC_MSJ_ERROR := SUBSTR(SQLERRM, 1, 250);
    
  END;  
  
  -- ******************************************************************************
  -- Descripción: Procedure que registra una costa en un cum expediente acumulado
  --
  --
  -- Output Parameters: PO_CU_RETORNO, PO_N_COD_ERROR , PO_V_MSJ_ERROR
  --
  --
  -- Author:      Victor Bendezú
  -- Proyecto:    Incidencias SICOB
  --
  -- Revisiones
  -- Fecha            Autor         Motivo del cambio    
  -- ----------------------------------------------------------------
  -- 30/12/2022     Victor Bendezú  Incidencias SICOB   
  -- ***************************************************************   
  PROCEDURE SCOB_SP_I_SCOB_CUM_EXPED_COSTA(PIN_NU_ID_EXPEDIENTE           IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
                                           PIN_NU_ID_CUM_EXPEDIENTE       IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
                                           PIN_NU_ID_EXPEDIENTE_DOCUMENTO IN T_SCOB_EXPEDIENTE_DOCUMENTO.ID_EXPEDIENTE_DOCUMENTO%TYPE,
                                           PIN_VC_ID_COSTAS               IN VARCHAR2,
                                           PIN_VC_POR_COSTAS              IN VARCHAR2,
                                           PIN_VC_VAL_COSTAS              IN VARCHAR2,
                                           PIN_VC_CNT_COSTAS              IN VARCHAR2,
                                           PIN_VC_SUB_TOTAL_COSTAS        IN VARCHAR2,
                                           PIN_NU_TOTAL_COSTAS            IN T_SCOB_EXPEDIENTE.MONTO_COSTAS%TYPE,
                                           PIN_NU_NRO_ITEMS               IN INTEGER,
                                           PIN_VC_AUDUSUCREACION          IN T_SCOB_EXPEDIENTE_DOCUMENTO.AUDUSUCREACION%TYPE,
                                           PIN_CH_FLG_AGREGAR             IN CHAR,
                                           POUT_NU_COD_ERROR              OUT NUMBER,
                                           POUT_VC_MSJ_ERROR              OUT VARCHAR2) IS
                                           
    V_NU_ID_EXPEDIENTE_COSTA T_SCOB_EXPEDIENTE_COSTA.ID_EXPEDIENTE_COSTA%TYPE;
  
    V_VC_ID_COSTAS        VARCHAR2(20);
    V_VC_POR_COSTAS       VARCHAR2(20);
    V_VC_VAL_COSTAS       VARCHAR2(20);
    V_VC_CNT_COSTAS       VARCHAR2(20);
    V_VC_SUB_TOTAL_COSTAS VARCHAR2(20);
  
    V_NU_POR_COSTAS       T_SCOB_EXPEDIENTE_COSTA.PORCENTAJE_UIT%TYPE;
    V_NU_VAL_COSTAS       T_SCOB_EXPEDIENTE_COSTA.VALOR_SOLES%TYPE;
    V_NU_CNT_COSTAS       T_SCOB_EXPEDIENTE_COSTA.CNT_COSTA%TYPE;
    V_NU_SUB_TOTAL_COSTAS T_SCOB_EXPEDIENTE_COSTA.MONTO_COSTA%TYPE;
    V_NU_VAL_CNT_COSTA    T_SCOB_EXPEDIENTE_COSTA.CNT_COSTA%TYPE;
    V_NU_VAL_MTO_COSTA    T_SCOB_EXPEDIENTE_COSTA.MONTO_COSTA%TYPE;
  
    V_NU_CONT INTEGER;
    
    REG_T_SCOB_EXPEDIENTE       T_SCOB_EXPEDIENTE%ROWTYPE;        
    V_NU_ID_MULTA            USR_SICOB.T_SCOB_MULTA.ID_MULTA%TYPE;    
 
  BEGIN
    
    POUT_VC_MSJ_ERROR := '';
    POUT_NU_COD_ERROR := -1;
    DBMS_OUTPUT.put_line('SCOB_SP_I_T_SCOB_EXPED_COSTA>>PIN_NU_ID_EXPEDIENTE>>' || PIN_NU_ID_EXPEDIENTE);


    SELECT EXPE.*
      INTO REG_T_SCOB_EXPEDIENTE
      FROM USR_SICOB.T_SCOB_EXPEDIENTE EXPE
     WHERE EXPE.ID_EXPEDIENTE = PIN_NU_ID_EXPEDIENTE;
     

    V_NU_CONT := 1;
    DBMS_OUTPUT.put_line('SCOB_SP_I_T_SCOB_EXPED_COSTA>>PIN_NU_NRO_ITEMS>>' || PIN_NU_NRO_ITEMS);
    WHILE (V_NU_CONT <= PIN_NU_NRO_ITEMS) LOOP
    
      SCOB_PK_UTILITARIO.SCOB_SP_S_SPLIT(PIN_VC_ID_COSTAS,
                                         '|',
                                         V_NU_CONT + 1,
                                         V_VC_ID_COSTAS);
      SCOB_PK_UTILITARIO.SCOB_SP_S_SPLIT(PIN_VC_POR_COSTAS,
                                         '|',
                                         V_NU_CONT + 1,
                                         V_VC_POR_COSTAS);
      SCOB_PK_UTILITARIO.SCOB_SP_S_SPLIT(PIN_VC_VAL_COSTAS,
                                         '|',
                                         V_NU_CONT + 1,
                                         V_VC_VAL_COSTAS);
      SCOB_PK_UTILITARIO.SCOB_SP_S_SPLIT(PIN_VC_CNT_COSTAS,
                                         '|',
                                         V_NU_CONT + 1,
                                         V_VC_CNT_COSTAS);
      SCOB_PK_UTILITARIO.SCOB_SP_S_SPLIT(PIN_VC_SUB_TOTAL_COSTAS,
                                         '|',
                                         V_NU_CONT + 1,
                                         V_VC_SUB_TOTAL_COSTAS);
    
      V_NU_POR_COSTAS       := SCOB_PK_UTILITARIO.SCOB_FN_TEXTO_A_NUMERO(V_VC_POR_COSTAS);
      V_NU_VAL_COSTAS       := SCOB_PK_UTILITARIO.SCOB_FN_TEXTO_A_NUMERO(V_VC_VAL_COSTAS);
      V_NU_CNT_COSTAS       := SCOB_PK_UTILITARIO.SCOB_FN_TEXTO_A_NUMERO(V_VC_CNT_COSTAS);
      V_NU_SUB_TOTAL_COSTAS := SCOB_PK_UTILITARIO.SCOB_FN_TEXTO_A_NUMERO(V_VC_SUB_TOTAL_COSTAS);
    
      IF PIN_CH_FLG_AGREGAR IN ('0', '1') THEN
        DBMS_OUTPUT.put_line('SCOB_SP_I_T_SCOB_EXPED_COSTA>>FLAG>>1');
        SELECT DECODE(PIN_CH_FLG_AGREGAR,
                      '0',
                      -V_NU_SUB_TOTAL_COSTAS,
                      V_NU_SUB_TOTAL_COSTAS)
          INTO V_NU_SUB_TOTAL_COSTAS
          FROM DUAL;
      
        SELECT DECODE(PIN_CH_FLG_AGREGAR, '0', -V_NU_CNT_COSTAS, V_NU_CNT_COSTAS)
          INTO V_NU_CNT_COSTAS
          FROM DUAL;
      
        IF PIN_CH_FLG_AGREGAR = 0 THEN
          SELECT SUM(EC.CNT_COSTA) + V_NU_CNT_COSTAS AS VAL_CNT_COSTA,
                 SUM(EC.MONTO_COSTA) + V_NU_SUB_TOTAL_COSTAS AS VAL_MTO_COSTA
            INTO V_NU_VAL_CNT_COSTA, V_NU_VAL_MTO_COSTA
            FROM T_SCOB_EXPEDIENTE_COSTA EC
           WHERE EC.ID_EXPEDIENTE = PIN_NU_ID_CUM_EXPEDIENTE
             AND EC.ID_COSTA = TO_NUMBER(V_VC_ID_COSTAS)
             AND EC.ESTADO = 1;
        
          IF V_NU_VAL_CNT_COSTA < 0 THEN
            POUT_NU_COD_ERROR := -9;
            POUT_VC_MSJ_ERROR := 'No se puede realizar la acci?n. Los valores actualizados generar?n cantidad de costas negativos...';
            EXIT;
          END IF;
        
          IF V_NU_VAL_MTO_COSTA < 0 THEN
            POUT_NU_COD_ERROR := -9;
            POUT_VC_MSJ_ERROR := 'No se puede realizar la acci?n. Los valores actualizados generar?n subtotal de costas negativos...';
            EXIT;
          END IF;
        END IF;
      
        IF V_VC_ID_COSTAS = '#' THEN
          EXIT;
        END IF;
      
        SELECT SCOB_SQ_EXPEDIENTE_COSTA.NEXTVAL
          INTO V_NU_ID_EXPEDIENTE_COSTA
          FROM DUAL;
        INSERT INTO T_SCOB_EXPEDIENTE_COSTA
          (ID_EXPEDIENTE_COSTA,
           ID_COSTA,
           PORCENTAJE_UIT,
           VALOR_SOLES,
           CNT_COSTA,
           MONTO_COSTA,
           ESTADO,
           AUDFECCREACION,
           AUDUSUCREACION,
           ID_EXPEDIENTE_DOCUMENTO,
           ID_EXPEDIENTE)
        VALUES
          (V_NU_ID_EXPEDIENTE_COSTA,
           TO_NUMBER(V_VC_ID_COSTAS),
           V_NU_POR_COSTAS,
           TRUNC(V_NU_VAL_COSTAS, SCOB_PK_CONSTANTES.C_NRO_DECIMAL_TRUNC),
           V_NU_CNT_COSTAS,
           TRUNC(V_NU_SUB_TOTAL_COSTAS, SCOB_PK_CONSTANTES.C_NRO_DECIMAL_TRUNC),
           SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO,
           SYSDATE,
           PIN_VC_AUDUSUCREACION,
           DECODE(NVL(PIN_NU_ID_EXPEDIENTE_DOCUMENTO, 0),
                  0,
                  NULL,
                  PIN_NU_ID_EXPEDIENTE_DOCUMENTO),
           PIN_NU_ID_CUM_EXPEDIENTE);
           DBMS_OUTPUT.put_line('SCOB_SP_I_T_SCOB_EXPED_COSTA>>V_NU_ID_EXPEDIENTE_COSTA>>' || V_NU_ID_EXPEDIENTE_COSTA);
      ELSIF PIN_CH_FLG_AGREGAR = '2' THEN
        DBMS_OUTPUT.put_line('SCOB_SP_I_T_SCOB_EXPED_COSTA>>FLAG>>2');
        IF V_VC_ID_COSTAS = '#' THEN
          EXIT;
        END IF;
      
        UPDATE T_SCOB_EXPEDIENTE_COSTA T
           SET T.ESTADO = '0'
         WHERE T.ID_COSTA = TO_NUMBER(V_VC_ID_COSTAS)
           AND T.ID_EXPEDIENTE = PIN_NU_ID_CUM_EXPEDIENTE;

        DBMS_OUTPUT.put_line('SCOB_SP_I_T_SCOB_EXPED_COSTA>>V_VC_ID_COSTAS>>' || V_VC_ID_COSTAS);

      END IF;
    
      V_NU_CONT := V_NU_CONT + 1;
      
    INSERT INTO USR_SICOB.T_SCOB_AUDITORIA
            (NU_ID_AUDITORIA,
             NU_ID_TIPO_AUDITORIA,
             NU_ID_MULTA,
             NU_ID_EXPEDIENTE,
             VC_TABLA,
             VC_NOMBRE_LLAVE1,
             VC_NOMBRE_LLAVE2,
             NU_ID_LLAVE1,
             NU_ID_LLAVE2,
             VC_DML,
             VC_DESCRIPCION,
             VC_USUARIO_REGISTRO,
             DT_FECHA_REGISTRO,
             NU_ESTADO)
          VALUES
            (USR_SICOB.SEQ_T_AUDITORIA_ID.NEXTVAL,
             5,
             NULL,
             PIN_NU_ID_CUM_EXPEDIENTE,
             'T_SCOB_EXPEDIENTE_COSTA',
             'ID_EXPEDIENTE_COSTA',
             NULL,
             V_NU_ID_EXPEDIENTE_COSTA,
             NULL,
             'I',
             'SE AGREGO COSTA DEL TIPO : ' ||
                 PIN_CH_FLG_AGREGAR 
              || '  DEL EXPEDIENTE : ' 
              || REG_T_SCOB_EXPEDIENTE.ANIO || REG_T_SCOB_EXPEDIENTE.NRO_EXPEDIENTE,
             PIN_VC_AUDUSUCREACION,
             SYSDATE,
             '1');
             
    END LOOP;
  
    IF POUT_NU_COD_ERROR = -9 THEN
      RETURN;
    END IF;
  
    SELECT DECODE(PIN_CH_FLG_AGREGAR,
                  '0',
                  -PIN_NU_TOTAL_COSTAS,
                  PIN_NU_TOTAL_COSTAS)
      INTO V_NU_SUB_TOTAL_COSTAS
      FROM DUAL;
      
    DBMS_OUTPUT.put_line('SCOB_SP_I_T_SCOB_EXPED_COSTA>>PIN_CH_FLG_AGREGAR>>' || PIN_CH_FLG_AGREGAR);

    IF PIN_CH_FLG_AGREGAR IN ('0', '1') THEN
      UPDATE T_SCOB_MULTA MULT
         SET MULT.MONTO_COSTAS      = MULT.MONTO_COSTAS + V_NU_SUB_TOTAL_COSTAS,
             MULT.MONTO_TOTAL_DEUDA = MULT.MONTO_TOTAL_DEUDA +
                                      V_NU_SUB_TOTAL_COSTAS,
             MULT.SALDO_COSTAS      = MULT.SALDO_COSTAS + V_NU_SUB_TOTAL_COSTAS,
             MULT.SALDO_TOTAL_DEUDA = MULT.SALDO_TOTAL_DEUDA +
                                      V_NU_SUB_TOTAL_COSTAS,
             
             MULT.AUDUSUMODIFICACION = PIN_VC_AUDUSUCREACION,
             MULT.AUDFECMODIFICACION = SYSDATE
       WHERE MULT.ID_MULTA IN
             (SELECT EXMU.ID_MULTA
                FROM T_SCOB_EXPEDIENTE_MULTA EXMU
               WHERE EXMU.ID_EXPEDIENTE = PIN_NU_ID_EXPEDIENTE
                 AND EXMU.ESTADO = '1'
                 AND EXMU.ID_MULTA =
                     SCOB_PK_EXPEDIENTE.SCOB_FN_MUL_ANTIGUO(EXMU.ID_EXPEDIENTE));
    ELSIF PIN_CH_FLG_AGREGAR = '2' THEN
      BEGIN
        SELECT SUM(EC.CNT_COSTA) AS VAL_CNT_COSTA,
               SUM(EC.MONTO_COSTA) AS VAL_MTO_COSTA
          INTO V_NU_VAL_CNT_COSTA, V_NU_VAL_MTO_COSTA
          FROM T_SCOB_EXPEDIENTE_COSTA EC
         WHERE EC.ID_EXPEDIENTE = PIN_NU_ID_EXPEDIENTE
           AND EC.ESTADO = 1;
      EXCEPTION
        WHEN NO_DATA_FOUND THEN
          V_NU_VAL_CNT_COSTA := 0;
          V_NU_VAL_MTO_COSTA := 0;
      END;
      UPDATE T_SCOB_MULTA MULT
         SET MULT.MONTO_COSTAS       = NVL(V_NU_VAL_MTO_COSTA, 0),
             MULT.MONTO_TOTAL_DEUDA  = MULT.MONTO_UIT + MULT.MONTO_INTERES +
                                       MULT.MONTO_INTERES_MORATORIO +
                                       NVL(V_NU_VAL_MTO_COSTA, 0),
             MULT.SALDO_COSTAS       = NVL(V_NU_VAL_MTO_COSTA, 0) -
                                       MULT.TOTAL_AMORTIZADO_COSTAS,
             MULT.SALDO_TOTAL_DEUDA =
             (MULT.MONTO_UIT + MULT.MONTO_INTERES +
             MULT.MONTO_INTERES_MORATORIO + NVL(V_NU_VAL_MTO_COSTA, 0)) -
             (MULT.TOTAL_AMORTIZADO + MULT.TOTAL_AMORTIZADO_IC +
             MULT.TOTAL_AMORTIZADO_IM + MULT.TOTAL_AMORTIZADO_COSTAS),
             MULT.AUDUSUMODIFICACION = PIN_VC_AUDUSUCREACION,
             MULT.AUDFECMODIFICACION = SYSDATE
      
       WHERE MULT.ID_MULTA IN
             (SELECT EXMU.ID_MULTA
                FROM T_SCOB_EXPEDIENTE_MULTA EXMU
               WHERE EXMU.ID_EXPEDIENTE = PIN_NU_ID_EXPEDIENTE
                 AND EXMU.ESTADO = '1'
                 AND EXMU.ID_MULTA =
                     SCOB_PK_EXPEDIENTE.SCOB_FN_MUL_ANTIGUO(EXMU.ID_EXPEDIENTE));
    END IF;
    SCOB_PK_MULTAS.SCOB_SP_U_ACT_IMPORTES_EXPED(0, PIN_NU_ID_EXPEDIENTE);        
     
    

    V_NU_ID_MULTA:= SCOB_PK_EXPEDIENTE.SCOB_FN_MUL_ANTIGUO(PIN_NU_ID_EXPEDIENTE);

    DBMS_OUTPUT.put_line('SCOB_SP_I_T_SCOB_EXPED_COSTA>>V_NU_ID_MULTA>>' || V_NU_ID_MULTA);
    USR_SIA_INTFZ.PKG_INTFZ_REG_MULTA_SICOB_SIA.SP_U_EXPEDIENTE_CERO_A_SIA(PIN_NU_ID_MULTA => V_NU_ID_MULTA,
                                                                      POUT_NU_COD_RESULT => POUT_NU_COD_ERROR,
                                                                      POUT_VC_MSG_RESULT => POUT_VC_MSJ_ERROR);
    DBMS_OUTPUT.put_line('SCOB_SP_I_T_SCOB_EXPED_COSTA>>POUT_NU_COD_ERROR1>>' || POUT_NU_COD_ERROR);
    IF POUT_NU_COD_ERROR < 0 THEN
       ROLLBACK;
       RETURN;
    END IF;
    USR_SICOB.PKG_RECAUDACION_BANCOS.SP_DO_GRABAR_BN_X_EXP(PIN_NU_ID_EXPEDIENTE => PIN_NU_ID_EXPEDIENTE,
                                     POUT_NU_COD_RESULT => POUT_NU_COD_ERROR,
                                     POUT_VC_MSG_RESULT => POUT_VC_MSJ_ERROR);
    DBMS_OUTPUT.put_line('SCOB_SP_I_T_SCOB_EXPED_COSTA>>POUT_NU_COD_ERROR2>>' || POUT_NU_COD_ERROR);
    IF POUT_NU_COD_ERROR < 0 THEN
       ROLLBACK;
       RETURN;
    END IF;
    USR_SICOB.PKG_RECAUDACION_BANCOS.SP_DO_GRABAR_ASBANC_X_EXP(PIN_NU_ID_EXPEDIENTE => PIN_NU_ID_EXPEDIENTE,
                                     POUT_NU_COD_RESULT => POUT_NU_COD_ERROR,
                                     POUT_VC_MSG_RESULT => POUT_VC_MSJ_ERROR);
    DBMS_OUTPUT.put_line('SCOB_SP_I_T_SCOB_EXPED_COSTA>>POUT_NU_COD_ERROR3>>' || POUT_NU_COD_ERROR);
    IF POUT_NU_COD_ERROR < 0 THEN
       ROLLBACK;
       RETURN;
    END IF;    
            
    POUT_NU_COD_ERROR := 0;
    
  EXCEPTION
    WHEN OTHERS THEN
      POUT_NU_COD_ERROR := SQLCODE;
      SELECT CASE
               WHEN POUT_NU_COD_ERROR > 0 THEN
                POUT_NU_COD_ERROR * -1
               ELSE
                POUT_NU_COD_ERROR
             END
        INTO POUT_NU_COD_ERROR
        FROM DUAL;
      POUT_VC_MSJ_ERROR := SUBSTR(SQLERRM, 1, 250);
      ROLLBACK;
  END;
  
END SCOB_PK_EXPEDIENTE;
/
