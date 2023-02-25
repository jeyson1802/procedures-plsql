CREATE OR REPLACE PACKAGE SCOB_PK_MULTAS is
   /*****************************************************************
  * Nombre            :  USR_SICOB.SCOB_PK_MULTAS
  * Propósito         :  Funcionalidad para crecaion de multas en el SICOB
  * Creado por        :  ADMIN
  * Fec Creación      :  08-02-2011 ADMIN
  * Fec Actualización :  15-07-2019 @jalegria
  '****************************************************************/

  type cu_rec_set is ref cursor;

---
procedure SCOB_SP_I_MULTA_ESTADO
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 24.02.2011
-- Proposito    : inserta el log de estados de las multas por or
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA                      IN T_SCOB_MULTA_DETAL.ID_MULTA%TYPE,
  PI_N_ID_MULTA_DETAL                IN T_SCOB_MULTA_DETAL.ID_MULTA_DETAL%TYPE,
  PI_I_ESTADO_MULTA                  IN T_SCOB_MULTA_DETAL.ESTADO_MULTA%TYPE,
  PI_I_COD_MOTIVO                    IN T_SCOB_MULTA.COD_MOTIVO%TYPE,
  PI_C_FEC_ESTADO_MULTA              IN CHAR,
  PI_V_AUDUSUCREACION                IN T_SCOB_MULTA_DETAL.AUDUSUCREACION%TYPE,
  PI_N_USU_ULT_ESTADO                IN T_SCOB_MULTA_DETAL.ID_USUARIO_ULT_ESTADO%TYPE,
  PI_N_ID_MULTA_COBRANZA             IN T_SCOB_MULTA_COBRANZA.ID_MULTA_COBRANZA%TYPE,
  po_n_retorno                       out number,
  po_n_cod_error                     out number,
  po_v_msj_error                     out varchar2
);

procedure SCOB_SP_I_MULTA_NIVEL_BY_OR
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 15.02.2011
-- Proposito    : inserta el primer nivel de registro de una multa.
                  no realiza commit, debe llamarse desde otro sp.
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA                      IN T_SCOB_MULTA_DETAL.ID_MULTA%TYPE,
  PI_N_ID_ORGANO_RESOLUTIVO          IN T_SCOB_MULTA_DETAL.ID_ORGANO_RESOLUTIVO%TYPE,
  PI_N_ID_USUARIO_SECRETARIO         IN T_SCOB_MULTA_DETAL.ID_USUARIO_SECRETARIO%TYPE,
  ---------------------------------------------------------------------------------
  --nuevos
  PI_N_ID_SIGLA                      IN NUMBER,
  PI_V_COD_SIGLA                     IN VARCHAR2,
  PI_V_DES_SIGLA                     IN VARCHAR2,
  --
  PI_V_EXP_ANTIG_NRO                 IN VARCHAR2,
  PI_C_EXP_ANTIG_ANIO                IN CHAR,
  PI_N_EXP_ANTIG_ID_TIPO_EXPED       IN NUMBER,
  PI_V_EXP_ANTIG_COD_TIPO_EXPED      IN VARCHAR2,
  PI_V_EXP_ANTIG_DES_TIPO_EXPED      IN VARCHAR2,
  PI_V_NRO_EXPED_ANTIGUO_ID           IN VARCHAR2,
  --
  PI_V_RESOL_NRO                     IN VARCHAR2,
  PI_C_RESOL_ANIO                    IN CHAR,
  PI_N_RESOL_ID_SIGLA                IN NUMBER,
  PI_V_RESOL_COD_SIGLA               IN VARCHAR2,
  PI_V_RESOL_DES_SIGLA               IN VARCHAR2,
  NRO_RESOLUCION_ID                  IN VARCHAR2,
  --
  PI_V_NRO_RESOL                     IN T_SCOB_MULTA_DETAL.NRO_RESOLUCION%TYPE,
  PI_C_FECHA_RESOL                   IN CHAR,
  PI_V_NRO_EXP_NIVEL                 IN T_SCOB_MULTA_DETAL.NRO_EXP_NIVEL%TYPE,
  ---------------------------------------------------------------------------------
  PI_V_AUDUSUCREACION                IN T_SCOB_MULTA_DETAL.AUDUSUCREACION%TYPE,
  PI_N_ID_USUARIO_INGRESO            IN T_SCOB_MULTA_DETAL.ID_USUARIO_INGRESO%TYPE,
  po_n_retorno                       out number,
  po_n_cod_error                     out number,
  po_v_msj_error                     out varchar2
);

procedure SCOB_SP_U_MULTA_NIVEL_BY_OR
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 17.02.2011
-- Proposito    : Actualiza cualquier nivel de una multa
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA                       IN T_SCOB_MULTA.ID_MULTA%TYPE,
  PI_N_ID_MULTA_DETAL                 IN T_SCOB_MULTA_DETAL.ID_MULTA_DETAL%TYPE,
  PI_N_ID_CLASIFICACION               IN T_SCOB_MULTA.ID_CLASIFICACION%TYPE,
  PI_N_ID_USUARIO_SECRETARIO          IN T_SCOB_MULTA_DETAL.ID_USUARIO_SECRETARIO%TYPE,
  PI_I_ESTADO_MULTA                   IN T_SCOB_MULTA_DETAL.ESTADO_MULTA%TYPE,
  -----------------------------
  PI_C_FECHA_RESOL                    IN CHAR,
  PI_C_FECHA_NOTIF                    IN CHAR,
  -----------------------------
  PI_V_NRO_RESOL_DECLARACION          IN T_SCOB_MULTA_DETAL.NRO_RESOLUCION_DECLARACION%TYPE,
                                         --NRO RESOLUCION (CONSENTIMIENTO O FIRMEZA)
  PI_C_FECHA_DECLA                    IN CHAR, --FEC_DECLARACION (CONSENTIMIENTO O FIRMEZA)
  PI_C_FEC_NOTIF_DECLARACION          IN CHAR, --FEC NOTIFICACION DECLARACION (CONSENTIMIENTO O FIRMEZA)
  -----------------------------
  PI_C_FEC_ESTADO_SGTE_INSTANCIA      IN CHAR, --FEC APELACION O REVISION
  -----------------------------
  PI_V_RESOL_NRO                      IN VARCHAR2,
  PI_C_RESOL_ANIO                     IN CHAR,
  PI_N_RESOL_ID_SIGLA                 IN NUMBER,
  PI_V_RESOL_COD_SIGLA                IN VARCHAR2,
  PI_V_RESOL_DES_SIGLA                IN VARCHAR2,
  --------------------------------
  PI_V_AUDUSUMODIFICACION             IN T_SCOB_MULTA_DETAL.AUDUSUMODIFICACION%TYPE,
  po_n_retorno                        out number,
  po_n_cod_error                      out number,
  po_v_msj_error                      out varchar2
);


procedure SCOB_SP_I_MULTA_BY_OR
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 15.02.2011
-- Proposito    :
1. Registrar la multa por organo resolutivo.
2. Registrar el siguiente nivel de una multa.
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA                  IN T_SCOB_MULTA.ID_MULTA%TYPE,
  PI_N_ID_MULTA_DETAL_ACTUAL     IN T_SCOB_MULTA_DETAL.ID_MULTA_DETAL%TYPE,
  --
  PI_N_ID_CLASIFICACION          IN T_SCOB_MULTA.ID_CLASIFICACION%TYPE,
  PI_N_ID_MATERIA                IN T_SCOB_MULTA.ID_MATERIA%TYPE,
  PI_N_ID_SUBMATERIA             IN T_SCOB_MULTA.ID_SUB_MATERIA%TYPE,
  PI_C_FLG_MULTA_RESOLUTIVO      IN T_SCOB_MULTA.FLG_MULTA_RESOLUTIVO%TYPE,
  PI_N_TIPO_INSTANCIA_INICIA     IN T_SCOB_ORGANO_RESOLUTIVO.TIPO_INSTANCIA%TYPE,
  PI_N_TIPO_INSTANCIA_ACTUAL     IN T_SCOB_ORGANO_RESOLUTIVO.TIPO_INSTANCIA%TYPE,
  PI_N_ID_ORGANO_RESOLUTIVO      IN T_SCOB_MULTA_DETAL.ID_ORGANO_RESOLUTIVO%TYPE,
  PI_N_ID_USUARIO_SECRETARIO     IN T_SCOB_MULTA_DETAL.ID_USUARIO_SECRETARIO%TYPE,
  PI_C_FECHA_RESOL               IN CHAR,
  PI_I_ESTADO_MULTA              IN T_SCOB_MULTA.ESTADO_MULTA%TYPE,
  PI_C_FLG_TIPO_MULTA            IN T_SCOB_MULTA.FLG_TIPO_MULTA%TYPE,
  PI_N_SEDE                      IN T_SCOB_SEDE.ID_SEDE%TYPE,
  PI_V_AUDUSUCREACION            IN T_SCOB_MULTA.AUDUSUCREACION%TYPE,
  PI_N_ID_USUARIO_INGRESO        IN T_SCOB_MULTA.ID_USUARIO_INGRESO%TYPE,

  PI_V_EXP_ANTIG_NRO             IN VARCHAR2,
  PI_C_EXP_ANTIG_ANIO            IN CHAR,
  PI_N_EXP_ANTIG_ID_SIGLA        IN NUMBER,
  PI_N_EXP_ANTIG_ID_TIPO_EXPED   IN NUMBER,
  PI_V_EXP_ANTIG_COD_SIGLA       IN VARCHAR2,
  PI_V_EXP_ANTIG_COD_TIPO_EXPED  IN VARCHAR2,
  PI_V_EXP_ANTIG_DES_SIGLA       IN VARCHAR2,
  PI_V_EXP_ANTIG_DES_TIPO_EXPED  IN VARCHAR2,

  PI_V_EXP_NUEVO_NRO             IN VARCHAR2,
  PI_C_EXP_NUEVO_ANIO            IN CHAR,
  PI_V_EXP_NUEVO_COD_ORG_RESOL   IN VARCHAR,
  PI_V_EXP_NUEVO_COD_MATERIA     IN VARCHAR,

  PI_V_RESOL_NRO                 IN VARCHAR2,
  PI_C_RESOL_ANIO                IN CHAR,
  PI_N_RESOL_ID_SIGLA            IN NUMBER,
  PI_V_RESOL_COD_SIGLA           IN VARCHAR2,
  PI_V_RESOL_DES_SIGLA           IN VARCHAR2,
  --
  po_n_retorno                   out number,
  po_n_retorno_det               out number,
  po_n_cod_error                 out number,
  po_v_msj_error                 out varchar2
);

procedure SCOB_SP_D_MULTA_BY_OR
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 17.02.2011
-- Proposito    : Elimina una multa de organo resolutivo y todos su registros dependientes.
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_V_ID_MULTA               IN VARCHAR2,
  PI_V_AUDUSUCREACION         IN T_SCOB_MULTA.AUDUSUMODIFICACION%TYPE,
  po_n_retorno      out number,
  po_n_cod_error    out number,
  po_v_msj_error    out varchar2
);

procedure SCOB_SP_S_MULTA_BY_OR
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 16.02.2011
-- Proposito    : Consulta las multas por organismo resolutivo
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_V_CUM                     IN T_SCOB_MULTA.CUM%TYPE,
  PI_I_TIPO_PERSONA            IN T_SCOB_PERSONA.TIPO_PERSONA%TYPE,
  PI_I_TIPO_DOC                IN T_SCOB_PERSONA.TIPO_DOC%TYPE,
  PI_V_NRO_DOC                 IN T_SCOB_PERSONA.NRO_DOC%TYPE,
  PI_V_APE_PATERNO             IN T_SCOB_PERSONA.APE_PATERNO%TYPE,
  PI_V_APE_MATERNO             IN T_SCOB_PERSONA.APE_MATERNO%TYPE,
  PI_V_PRI_NOMBRE              IN T_SCOB_PERSONA.PRI_NOMBRE%TYPE,
  PI_V_SEG_NOMBRE              IN T_SCOB_PERSONA.SEG_NOMBRE%TYPE,
  PI_V_RAZON_SOCIAL            IN T_SCOB_PERSONA.RAZON_SOCIAL%TYPE,
  PI_N_ID_USUARIO              IN T_SCOB_USUARIO.ID_USUARIO%TYPE,
  PI_I_ID_ESTADO               IN T_SCOB_MULTA.ESTADO_MULTA%TYPE,
  PI_N_COD_SANCIONADO          IN T_SCOB_PERSONA.COD_SANCIONADO%TYPE,
  po_cu_retorno   out cu_rec_set
);

procedure SCOB_SP_S_MULTA_NIVEL_BY_OR
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 16.02.2011
-- Proposito    : Consulta las multas por organismo resolutivo por nivel
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA            IN T_SCOB_MULTA.ID_MULTA%TYPE,
  PI_N_TIPO_INSTANCIA      IN T_SCOB_ORGANO_RESOLUTIVO.TIPO_INSTANCIA%TYPE,
  PI_N_ID_USUARIO          IN T_SCOB_USUARIO.ID_USUARIO%TYPE,
  po_cu_retorno   out cu_rec_set
);

procedure SCOB_SP_S_BUS_PERSONA_BY_ASIG
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 18.02.2011
-- Proposito    : Consulta personas para asignar a la multa segun tipo
                  administrado (sancionado / denunciante)
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA                     IN T_SCOB_MULTA.ID_MULTA%TYPE,
  PI_V_COD_SANCIONADO               IN T_SCOB_PERSONA.COD_SANCIONADO%TYPE,
  PI_I_TIPO_PERSONA                 IN T_SCOB_PERSONA.TIPO_PERSONA%TYPE,
  PI_I_TIPO_DOC                     IN T_SCOB_PERSONA.TIPO_DOC%TYPE,
  PI_V_NRO_DOC                      IN T_SCOB_PERSONA.NRO_DOC%TYPE,
  PI_V_RAZON_SOCIAL                 IN T_SCOB_PERSONA.RAZON_SOCIAL%TYPE,
  PI_V_PRI_NOMBRE                   IN T_SCOB_PERSONA.PRI_NOMBRE%TYPE,
  PI_V_SEG_NOMBRE                   IN T_SCOB_PERSONA.SEG_NOMBRE%TYPE,
  PI_V_APE_PATERNO                  IN T_SCOB_PERSONA.APE_PATERNO%TYPE,
  PI_V_APE_MATERNO                  IN T_SCOB_PERSONA.APE_MATERNO%TYPE,
  PI_C_FLG_OFICIO                   IN T_SCOB_PERSONA.FLG_OFICIO%TYPE,
  po_cu_retorno   out cu_rec_set
);

procedure SCOB_SP_I_T_SCOB_PERSONA_MULTA
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 18.02.2011
-- Proposito    : Inserta las personas asignadas a la multa por tipo administrado.
                  26.08.2011 cambio sancionados/denunciados
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA               IN T_SCOB_MULTA.ID_MULTA%TYPE,
  PI_N_ID_MULTA_DETAL         IN T_SCOB_MULTA_DETAL.ID_MULTA_DETAL%TYPE,
  PI_I_TIPO_ADMINISTRADO      IN INTEGER, --1=SANCIONADO;2=DENUNCIANTE;3=DENUNCIADO

  PI_N_TIPO_DOCUMENTO         IN T_SCOB_PERSONA.TIPO_DOC%TYPE,
  PI_V_NRO_DOCUMENTO          IN T_SCOB_PERSONA.NRO_DOC%TYPE,

  PI_V_AUDUSUCREACION         IN T_SCOB_PERSONA.AUDUSUCREACION%TYPE,
  PI_N_ID_MULTA_COBRANZA      IN T_SCOB_MULTA_COBRANZA.ID_MULTA_COBRANZA%TYPE,
  po_n_retorno                out number,
  po_n_cod_error              out number,
  po_v_msj_error              out varchar2
);

procedure SCOB_SP_U_T_SCOB_PERSONA_MULTA
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 18.02.2011
-- Proposito    : actualiza los datos relacionados de multa a personas (sancionados o denunciados).
                  26.08.2011
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA               IN T_SCOB_MULTA.ID_MULTA%TYPE,
  PI_N_ID_MULTA_DETAL         IN T_SCOB_MULTA_DETAL.ID_MULTA_DETAL%TYPE,
  PI_V_VALOR_UIT              IN VARCHAR2,
  PI_V_MONTO_UIT              IN VARCHAR2,
  PI_V_POR_ASOCU              IN VARCHAR2,
  PI_V_MONTO_ASOCU            IN VARCHAR2,
  PI_V_AUDUSUMODIFICACION     IN T_SCOB_PERSONA.AUDUSUMODIFICACION%TYPE,
  po_n_retorno                out number,
  po_n_cod_error              out number,
  po_v_msj_error              out varchar2
);

procedure SCOB_SP_I_SANCIONADO_MULTA
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 29.08.2011 cambio sancionados/denunciados
-- Proposito    : Inserta a los sancionados en base a los denunciados o denunciantes
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA               IN T_SCOB_MULTA.ID_MULTA%TYPE,
  PI_N_ID_MULTA_DETAL         IN T_SCOB_MULTA_DETAL.ID_MULTA_DETAL%TYPE,
  PI_V_ID_DENUNCIADO          IN VARCHAR2,
  PI_N_ITEMS_DENUNCIADO       IN INTEGER,
  --
  PI_V_ID_DENUNCIANTE         IN VARCHAR2,
  PI_N_ITEMS_DENUNCIANTE      IN INTEGER,
  --
  PI_V_AUDUSUCREACION         IN T_SCOB_PERSONA.AUDUSUCREACION%TYPE,
  PI_N_ID_MULTA_COBRANZA      IN T_SCOB_MULTA_COBRANZA.ID_MULTA_COBRANZA%TYPE,
  --
  po_n_retorno                out number,
  po_n_cod_error              out number,
  po_v_msj_error              out varchar2
);

procedure SCOB_SP_D_T_SCOB_PERSONA_MULTA
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 18.02.2011
-- Proposito    : elimina las personas relacionadas a una multa
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA               IN T_SCOB_MULTA.ID_MULTA%TYPE,
  PI_N_ID_MULTA_DETAL         IN T_SCOB_MULTA_DETAL.ID_MULTA_DETAL%TYPE,
  PI_I_TIPO_ADMINISTRADO      IN INTEGER,
  PI_V_ID_MULTA_PERSONA       IN VARCHAR2,
  PI_V_AUDUSUMODIFICACION     IN T_SCOB_PERSONA.AUDUSUMODIFICACION%TYPE,

  po_n_retorno      out number,
  po_n_cod_error    out number,
  po_v_msj_error    out varchar2
);

procedure SCOB_SP_S_BUS_SANC_BY_MULTA
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 18.02.2011
-- Proposito    : Consulta SANCIONADOS por multa
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA                     IN T_SCOB_MULTA.ID_MULTA%TYPE,
  PI_I_NIVEL                        IN INTEGER,
  PI_C_COD_TIPO_PERSONA             IN T_SCOB_MULTA_SANCIONADO.COD_TIPO_PERSONA%TYPE,
                                    --1=SANCIONADO; 2=DENUNCIADO.
  po_cu_retorno   out cu_rec_set
);


procedure SCOB_SP_S_BUS_DENU_BY_MULTA
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 18.02.2011
-- Proposito    : Consulta DENUNCIANTES por multa
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA                     IN T_SCOB_MULTA.ID_MULTA%TYPE,
  PI_I_NIVEL                        IN INTEGER,
  po_cu_retorno   out cu_rec_set
);

procedure SCOB_SP_S_MULTA_BY_OR_RESUMEN
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 24.02.2011
-- Proposito    : consultar el resumen de la multa or
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA            IN T_SCOB_MULTA.ID_MULTA%TYPE,
  po_cu_retorno            out cu_rec_set
);

procedure SCOB_SP_I_MULTA_CHECK
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 24.02.2011
-- Proposito    : insertar los documentos checklist de la multa by instancia
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA            IN T_SCOB_MULTA.ID_MULTA%TYPE,
  PI_N_ID_MULTA_DETAL      IN T_SCOB_MULTA_CHECK.ID_MULTA_DETAL%TYPE,
  PI_V_COD_TIPO_DOC        IN VARCHAR2,
  PI_V_MARCA_TIPO_DOC      IN VARCHAR2,
  PI_N_NRO_ITEMS           IN NUMBER,
  PI_V_DES_OTRO            IN T_SCOB_MULTA_CHECK.DES_OTRO%TYPE,
  PI_V_AUDUSUCREACION      IN T_SCOB_MULTA_CHECK.AUDUSUCREACION%TYPE,
  PI_N_ID_MULTA_COBRANZA   IN T_SCOB_MULTA_COBRANZA.ID_MULTA_COBRANZA%TYPE,
  PI_N_NRO_FOLIO           IN T_SCOB_MULTA.NRO_FOLIO%TYPE,
  po_n_retorno             out number,
  po_n_cod_error           out number,
  po_v_msj_error           out varchar2
);

procedure SCOB_SP_S_MULTA_CHECK
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 25.02.2011
-- Proposito    : consulta los documentos checklist seleccionados de la multa por nivel.
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_MULTA               IN T_SCOB_MULTA.ID_MULTA%TYPE,
  PI_N_ID_MULTA_DETAL      IN T_SCOB_MULTA_CHECK.ID_MULTA_DETAL%TYPE,
  po_cu_retorno            out cu_rec_set
);

procedure SCOB_SP_S_MULTA_SANC_DIREC
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
(
  PI_N_ID_MULTA_DETAL      IN T_SCOB_MULTA_SANCIONADO.ID_MULTA_DETAL%TYPE,
  PI_N_ID_MULTA_SANCIONADO IN T_SCOB_MULTA_SANCIONADO.ID_MULTA_SANCIONADO%TYPE,
  po_cu_retorno            out cu_rec_set
);

procedure SCOB_SP_I_MULTA_SANC_DIREC
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 01.03.2011
-- Proposito    : insertar las direcciones de los sancionados por multa
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA_SANCIONADO           IN T_SCOB_MULTA_SANCIONADO_DIREC.ID_MULTA_SANCIONADO%TYPE,
  PI_V_ID_PERSONA_DOMICILIO          IN VARCHAR2,
  PI_N_NRO_ITEMS                     IN NUMBER,
  PI_V_AUDUSUCREACION                IN T_SCOB_MULTA_SANCIONADO_DIREC.AUDUSUCREACION%TYPE,

  po_n_retorno                       out number,
  po_n_cod_error                     out number,
  po_v_msj_error                     out varchar2
);

procedure SCOB_SP_I_MULTA_DOCUMENTO
/*
--*****************************************************************  
‘* Nombre             : SCOB_SP_I_MULTA_DOCUMENTO
'* Parámetros         : PI_N_ID_MULTA            : id de la multa
                        PI_N_ID_MULTA_DETAL      : id detalle de la multa
                        PI_V_TITULO              : Titulo del documento
                        PI_V_NOMBRE              : Nombre del documento
                        PI_N_TAMANIO             : Tamaño del archivo
                        PI_I_TIPO_DOC_ASOC       : Tipo de Documento (1=Adjuntos;2=Generado por el sistema)
                        PI_V_AUDUSUCREACION      : Usuario que creo el registro
                        PI_N_ID_MULTA_COBRANZA   : Id de la cobranza coactiva
                        po_n_retorno             : Codigo de Error del procedimiento (0=Exito, -1=Error)
                        po_n_cod_error           : Código de Error de la base de datos
                        po_v_msj_error           : Descripción del mensaje de Error de la base de datos
'* Propósito          : Insertar los documentos adjuntos a una multa
'* Output             : Documento adjunto registrado. 
'* Creado por         : RMCA - COSAPI
'* Fec Creación       : 25.02.2011
----------------------------------------------------------------
'* Modificado por     : JCARRION
'* Fec Actualización  : 03.07.2020
‘* Observación        : TK157893 - Se comenta la regla de validación que impide que se adjunten documentos en los siguientes estados de la multa:
                        SCOB_PK_CONSTANTES.C_EST_MULT_CONSENTIDA,
                        SCOB_PK_CONSTANTES.C_EST_MULT_FIRME,
                        SCOB_PK_CONSTANTES.C_EST_MULT_REVISADA
'****************************************************************/ 
(
  PI_N_ID_MULTA                           IN T_SCOB_MULTA.ID_MULTA%TYPE,
  PI_N_ID_MULTA_DETAL                     IN T_SCOB_MULTA_DETAL.ID_MULTA_DETAL%TYPE,
  PI_V_TITULO                             IN T_SCOB_MULTA_DOCUMENTO.TITULO%TYPE,
  PI_V_NOMBRE                             IN T_SCOB_MULTA_DOCUMENTO.NOMBRE%TYPE,
  PI_N_TAMANIO                            IN T_SCOB_MULTA_DOCUMENTO.TAMANIO%TYPE,
  PI_I_TIPO_DOC_ASOC                      IN T_SCOB_MULTA_DOCUMENTO.TIPO_DOC_ASOC%TYPE,
  PI_V_AUDUSUCREACION                     IN T_SCOB_MULTA_DOCUMENTO.AUDUSUCREACION%TYPE,
  PI_N_ID_MULTA_COBRANZA                  IN T_SCOB_MULTA_COBRANZA.ID_MULTA_COBRANZA%TYPE,
  po_n_retorno                            out number,
  po_n_cod_error                          out number,
  po_v_msj_error                          out varchar2
);

procedure SCOB_SP_D_MULTA_DOCUMENTO
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 25.02.2011
-- Proposito    : actualiza al estado eliminado los documentos seleccionados
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_V_ID_MULTA_DOCUMENTO     IN VARCHAR2,
  PI_V_AUDUSUCREACION         IN T_SCOB_MULTA_DOCUMENTO.AUDUSUCREACION%TYPE,

  po_n_retorno                out number,
  po_n_cod_error              out number,
  po_v_msj_error              out varchar2
);

procedure SCOB_SP_S_MULTA_DOCUMENTO
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 25.02.2011
-- Proposito    : consulta los documentos asociados a una multa or
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA            IN T_SCOB_MULTA.ID_MULTA%TYPE,
  PI_N_ID_MULTA_DETAL      IN T_SCOB_MULTA_DETAL.ID_MULTA_DETAL%TYPE,
  PI_I_TIPO_DOC_ASOC       IN T_SCOB_MULTA_DOCUMENTO.TIPO_DOC_ASOC%TYPE,
  po_cu_retorno            out cu_rec_set
);

procedure SCOB_SP_S_INI_DAT_MULTA_BY_USU
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 18.02.2011
-- Proposito    :
1. Inicializa los datos base para registrar una multa de acuerdo al usuario que ingresa al sistema.
2. El usuario debe ser del area: resolutivo
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_USUARIO                           IN T_SCOB_USUARIO.ID_USUARIO%TYPE,
  PI_N_ID_MULTA                             IN T_SCOB_MULTA.ID_MULTA%TYPE,
                                            --SI ENVIA ID_MULTA, PASA AL SIGUIENTE NIVEL
                                            --SI NO SE ENVIA, ESTARIA CREANDO UNA NUEVA MULTA
  po_cu_retorno                             out cu_rec_set,
  po_n_retorno                              out number,
  po_n_cod_error                            out number,
  po_v_msj_error                            out varchar2
);

procedure SCOB_SP_U_MULTA_DUPLICA_DATA
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 02.03.2011
-- Proposito    :

1. REALIZA EL SALTO DE INSTANCIA DE LA MULTA
2. SE ASUME QUE SE HA CAMBIADO EL ESTADO ACTUAL DE LA MULTA,
   Y LA EVALUACION DEL SALTO DE INSTANCIA SE REALIZARA A
   PARTIR DE ESTE NUEVO ESTADO.
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA                           IN T_SCOB_MULTA.ID_MULTA%TYPE,
  PI_N_ID_MULTA_DETAL_ANT                 IN T_SCOB_MULTA_DETAL.ID_MULTA_DETAL%TYPE,
  PI_N_ID_MULTA_DETAL_ACT                 IN T_SCOB_MULTA_DETAL.ID_MULTA_DETAL%TYPE,
--  PI_N_TIPO_INSTANCIA_INICIA              IN T_SCOB_ORGANO_RESOLUTIVO.TIPO_INSTANCIA%TYPE,
--  PI_N_TIPO_INSTANCIA_ACTUAL              IN T_SCOB_ORGANO_RESOLUTIVO.TIPO_INSTANCIA%TYPE,
  PI_I_ESTADO_MULTA                       IN T_SCOB_MULTA.ESTADO_MULTA%TYPE,
  PI_V_AUDUSUMODIFICACION                 IN T_SCOB_MULTA.AUDUSUMODIFICACION%TYPE,

  po_n_retorno                            out number,
  po_n_cod_error                          out number,
  po_v_msj_error                          out varchar2
);

procedure SCOB_SP_S_LISTA_ESTADOS_MULTA
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 02.03.2011
-- Proposito    :

1. MUESTRA LA LISTA DE ESTADO POSIBLES DE UNA MULTA DE ACUERDO A LA INSTANCIA DONDE SE INICIA EL PROCESO
   Y DE ACUERDO A LA ACTUAL INSTANCIA DONDE SE ENCUENTRA.
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA                           IN T_SCOB_MULTA.ID_MULTA%TYPE,
  po_cu_retorno                           out cu_rec_set
);

procedure SCOB_SP_S_SANC_DIREC_MULTA
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 04.03.2011
-- Proposito    : consulta los domicilios del sancionado en una multa
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA_DETAL      IN T_SCOB_MULTA_SANCIONADO.ID_MULTA_DETAL%TYPE,
  PI_C_FLG_PRINCIPAL       IN T_SCOB_MULTA_SANCIONADO.FLG_PRINCIPAL%TYPE,
  po_cu_retorno            out cu_rec_set
);

procedure SCOB_SP_U_GENERACION_SEC
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 11.07.2011
-- Proposito    : actualiza la solicitud de generacion de la SEC
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA            IN T_SCOB_MULTA.ID_MULTA%TYPE,
  PI_V_AUDUSUMODIFICACION  IN T_SCOB_MULTA.AUDUSUMODIFICACION%TYPE,
  po_n_retorno             out number,
  po_n_cod_error           out number,
  po_v_msj_error           out varchar2
);

procedure SCOB_SP_I_MULTA_BY_ANTIDUMPING
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 18.07.2011
-- Proposito    : registrar las multas por materia antidumping
                  solo si submateria es: derecho antidumping.
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MATERIA                   IN T_SCOB_MULTA.ID_MATERIA%TYPE,
  PI_N_ID_SUBMATERIA                IN T_SCOB_MULTA.ID_SUB_MATERIA%TYPE,
  PI_C_FLG_MULTA_RESOLUTIVO         IN T_SCOB_MULTA.FLG_MULTA_RESOLUTIVO%TYPE,
                                    --enviar 0=antidumping
  PI_N_TIPO_INSTANCIA_INICIA        IN T_SCOB_ORGANO_RESOLUTIVO.TIPO_INSTANCIA%TYPE,
  PI_N_ID_ORGANO_RESOLUTIVO         IN T_SCOB_MULTA_DETAL.ID_ORGANO_RESOLUTIVO%TYPE,
  PI_N_ID_USUARIO_SECRETARIO        IN T_SCOB_MULTA_DETAL.ID_USUARIO_SECRETARIO%TYPE,

  PI_V_NRO_OFICIO_SUNAT_CODIGO      IN T_SCOB_MULTA_ANTIDUMPING.NRO_OFICIO_SUNAT_CODIGO%TYPE,
  PI_V_NRO_OFICIO_SUNAT_ANIO        IN T_SCOB_MULTA_ANTIDUMPING.NRO_OFICIO_SUNAT_ANIO%TYPE,
  PI_V_NRO_OFICIO_SUNAT_PREFIJO     IN T_SCOB_MULTA_ANTIDUMPING.NRO_OFICIO_SUNAT_PREFIJO%TYPE,
  PI_V_NRO_OFICIO_SUNAT_SEC         IN T_SCOB_MULTA_ANTIDUMPING.NRO_OFICIO_SUNAT_CORRELATIVO%TYPE,
  PI_V_NRO_LIQUIDACION_CODIGO       IN T_SCOB_MULTA_ANTIDUMPING.NRO_LIQUIDACION_CODIGO%TYPE,
  PI_V_NRO_LIQUIDACION_ANIO         IN T_SCOB_MULTA_ANTIDUMPING.NRO_LIQUIDACION_ANIO%TYPE,
  PI_V_NRO_LIQUIDACION_SEC          IN T_SCOB_MULTA_ANTIDUMPING.NRO_LIQUIDACION_CORRELATIVO%TYPE,
  PI_V_NRO_DUA_CODIGO               IN T_SCOB_MULTA_ANTIDUMPING.NRO_DUA_CODIGO%TYPE,
  PI_V_NRO_DUA_ANIO                 IN T_SCOB_MULTA_ANTIDUMPING.NRO_DUA_ANIO%TYPE,
  PI_V_NRO_DUA_SEC                  IN T_SCOB_MULTA_ANTIDUMPING.NRO_DUA_CORRELATIVO%TYPE,
  PI_N_TIPO_CAMBIO                  IN T_SCOB_MULTA_ANTIDUMPING.TIPO_CAMBIO%TYPE,
  PI_N_MONTO_ANTIDUMPING            IN T_SCOB_MULTA_ANTIDUMPING.MONTO_ANTIDUMPING%TYPE,
  PI_N_ID_INTENDENCIA               IN T_SCOB_MULTA_ANTIDUMPING.ID_INTENDENCIA%TYPE,
  PI_N_ID_PARTIDA                   IN T_SCOB_MULTA_ANTIDUMPING.ID_PARTIDA%TYPE,
  PI_V_FEC_NOTIF                    IN VARCHAR2,
  PI_I_ESTADO_MULTA                 IN T_SCOB_MULTA.ESTADO_MULTA%TYPE,
  PI_C_FLG_TIPO_MULTA               IN T_SCOB_MULTA.FLG_TIPO_MULTA%TYPE,
  PI_N_ID_SEDE                      IN T_SCOB_SEDE.ID_SEDE%TYPE,
  --PI_V_NRO_RESOL                    IN T_SCOB_MULTA_DETAL.NRO_RESOLUCION%TYPE,
  --PI_V_NRO_EXP_ADMINISTRATIVO       IN T_SCOB_MULTA.NRO_EXP_ADMINISTRATIVO%TYPE,
  --PI_V_NRO_EXP_NIVEL                N T_SCOB_MULTA_DETAL.NRO_EXP_NIVEL%TYPE,
  --nuevos
  PI_V_EXP_ANTIG_NRO                IN VARCHAR2,
  PI_C_EXP_ANTIG_ANIO               IN CHAR,
  PI_N_EXP_ANTIG_ID_SIGLA           IN NUMBER,
  PI_N_EXP_ANTIG_ID_TIPO_EXPED      IN NUMBER,
  PI_V_EXP_ANTIG_COD_SIGLA          IN VARCHAR2,
  PI_V_EXP_ANTIG_COD_TIPO_EXPED     IN VARCHAR2,
  PI_V_EXP_ANTIG_DES_SIGLA          IN VARCHAR2,
  PI_V_EXP_ANTIG_DES_TIPO_EXPED     IN VARCHAR2,

  PI_V_EXP_NUEVO_NRO                IN VARCHAR2,
  PI_C_EXP_NUEVO_ANIO               IN CHAR,
  PI_V_EXP_NUEVO_COD_ORG_RESOL      IN VARCHAR,
  PI_V_EXP_NUEVO_COD_MATERIA        IN VARCHAR,

  PI_V_RESOL_NRO                    IN VARCHAR2,
  PI_C_RESOL_ANIO                   IN CHAR,
  PI_N_RESOL_ID_SIGLA               IN NUMBER,
  PI_V_RESOL_COD_SIGLA              IN VARCHAR2,
  PI_V_RESOL_DES_SIGLA              IN VARCHAR2,
  --
  PI_V_AUDUSUCREACION               IN T_SCOB_MULTA.AUDUSUCREACION%TYPE,
  PI_N_ID_USUARIO_INGRESO           IN T_SCOB_MULTA.ID_USUARIO_INGRESO%TYPE,
  po_n_retorno                      out number,
  po_n_retorno_det                  out number,
  po_n_retorno_antidumping          out number,
  po_n_cod_error                    out number,
  po_v_msj_error                    out varchar2
);

procedure SCOB_SP_U_MULTA_BY_ANTIDUMPING
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 19.07.2011
-- Proposito    : actualizar las multas por materia antidumping
                  solo si submateria es: derecho antidumping.
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA_ANTIDUMPING         IN T_SCOB_MULTA_ANTIDUMPING.ID_MULTA_ANTIDUMPING%TYPE,
  PI_N_ID_MULTA                     IN T_SCOB_MULTA.ID_MULTA%TYPE,
  PI_N_ID_MULTA_DETAL               IN T_SCOB_MULTA_DETAL.ID_MULTA_DETAL%TYPE,
  PI_N_ID_USUARIO_SECRETARIO        IN T_SCOB_MULTA_DETAL.ID_USUARIO_SECRETARIO%TYPE,
  --
  PI_V_NRO_OFICIO_SUNAT_CODIGO      IN T_SCOB_MULTA_ANTIDUMPING.NRO_OFICIO_SUNAT_CODIGO%TYPE,
  PI_V_NRO_OFICIO_SUNAT_ANIO        IN T_SCOB_MULTA_ANTIDUMPING.NRO_OFICIO_SUNAT_ANIO%TYPE,
  PI_V_NRO_OFICIO_SUNAT_PREFIJO     IN T_SCOB_MULTA_ANTIDUMPING.NRO_OFICIO_SUNAT_PREFIJO%TYPE,
  PI_V_NRO_OFICIO_SUNAT_SEC         IN T_SCOB_MULTA_ANTIDUMPING.NRO_OFICIO_SUNAT_CORRELATIVO%TYPE,
  PI_V_NRO_LIQUIDACION_CODIGO       IN T_SCOB_MULTA_ANTIDUMPING.NRO_LIQUIDACION_CODIGO%TYPE,
  PI_V_NRO_LIQUIDACION_ANIO         IN T_SCOB_MULTA_ANTIDUMPING.NRO_LIQUIDACION_ANIO%TYPE,
  PI_V_NRO_LIQUIDACION_SEC          IN T_SCOB_MULTA_ANTIDUMPING.NRO_LIQUIDACION_CORRELATIVO%TYPE,
  PI_V_NRO_DUA_CODIGO               IN T_SCOB_MULTA_ANTIDUMPING.NRO_DUA_CODIGO%TYPE,
  PI_V_NRO_DUA_ANIO                 IN T_SCOB_MULTA_ANTIDUMPING.NRO_DUA_ANIO%TYPE,
  PI_V_NRO_DUA_SEC                  IN T_SCOB_MULTA_ANTIDUMPING.NRO_DUA_CORRELATIVO%TYPE,
  PI_N_TIPO_CAMBIO                  IN T_SCOB_MULTA_ANTIDUMPING.TIPO_CAMBIO%TYPE,
  PI_N_MONTO_ANTIDUMPING            IN T_SCOB_MULTA_ANTIDUMPING.MONTO_ANTIDUMPING%TYPE,
  PI_N_ID_INTENDENCIA               IN T_SCOB_MULTA_ANTIDUMPING.ID_INTENDENCIA%TYPE,
  PI_N_ID_PARTIDA                   IN T_SCOB_MULTA_ANTIDUMPING.ID_PARTIDA%TYPE,
  PI_V_FECHA_NOTIF                  IN VARCHAR2,
  PI_I_ESTADO_MULTA                 IN T_SCOB_MULTA.ESTADO_MULTA%TYPE,
  PI_N_ID_SEDE                      IN T_SCOB_SEDE.ID_SEDE%TYPE,

  PI_V_EXP_ANTIG_NRO                IN VARCHAR2,
  PI_C_EXP_ANTIG_ANIO               IN CHAR,
  PI_N_EXP_ANTIG_ID_SIGLA           IN NUMBER,
  PI_N_EXP_ANTIG_ID_TIPO_EXPED      IN NUMBER,
  PI_V_EXP_ANTIG_COD_SIGLA          IN VARCHAR2,
  PI_V_EXP_ANTIG_COD_TIPO_EXPED     IN VARCHAR2,
  PI_V_EXP_ANTIG_DES_SIGLA          IN VARCHAR2,
  PI_V_EXP_ANTIG_DES_TIPO_EXPED     IN VARCHAR2,

  PI_V_RESOL_NRO                    IN VARCHAR2,
  PI_C_RESOL_ANIO                   IN CHAR,
  PI_N_RESOL_ID_SIGLA               IN NUMBER,
  PI_V_RESOL_COD_SIGLA              IN VARCHAR2,
  PI_V_RESOL_DES_SIGLA              IN VARCHAR2,
  --
  PI_V_AUDUSUMODIFICACION           IN T_SCOB_MULTA.AUDUSUCREACION%TYPE,
  PI_N_ID_USUARIO_INGRESO           IN T_SCOB_MULTA.ID_USUARIO_INGRESO%TYPE,
  --
  po_n_retorno                      out number,
  po_n_retorno_det                  out number,
  po_n_cod_error                    out number,
  po_v_msj_error                    out varchar2
);

procedure SCOB_SP_S_MULTA_BY_ANTIDUMPING
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
(
  PI_N_ID_MULTA            IN T_SCOB_MULTA_ANTIDUMPING.ID_MULTA%TYPE,
  po_cu_retorno            out cu_rec_set
);

procedure SCOB_SP_S_MULTA_ANOTACION
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 05.09.2011
-- Proposito    : CONSULTA ANOTACIONES DE LAS MULTAS
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA            IN T_SCOB_MULTA.ID_MULTA%TYPE,
  PI_N_ID_MULTA_ANOTACION  IN T_SCOB_MULTA_ANOTACION.ID_MULTA_ANOTACION%TYPE,
  po_cu_retorno            out cu_rec_set
);

procedure SCOB_SP_I_MULTA_ANOTACION
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 05.09.2011
-- Proposito    : inserta las anotaciones de una multa
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA               IN T_SCOB_MULTA.ID_MULTA%TYPE,
  PI_V_DES_ANOTACION          IN T_SCOB_MULTA_ANOTACION.DES_ANOTACION%TYPE,
  PI_N_ID_USUARIO_REGISTRO    IN T_SCOB_MULTA_ANOTACION.ID_USUARIO_REGISTRO%TYPE,
  PI_V_AUDUSUCREACION         IN T_SCOB_MULTA_ANOTACION.AUDUSUCREACION%TYPE,
  po_n_retorno                out number,
  po_n_cod_error              out number,
  po_v_msj_error              out varchar2
);

procedure SCOB_SP_U_MULTA_ANOTACION
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 05.09.2011
-- Proposito    : actualiza las anotaciones de una multa
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA_ANOTACION     IN T_SCOB_MULTA_ANOTACION.ID_MULTA_ANOTACION%TYPE,
  PI_V_DES_ANOTACION          IN T_SCOB_MULTA_ANOTACION.DES_ANOTACION%TYPE,
  PI_V_AUDUSUMODIFICACION     IN T_SCOB_MULTA_ANOTACION.AUDUSUMODIFICACION%TYPE,
  po_n_retorno                out number,
  po_n_cod_error              out number,
  po_v_msj_error              out varchar2
);

procedure SCOB_SP_D_MULTA_ANOTACION
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 05.09.2011
-- Proposito    : actualiza al estado eliminado las anotaciones de las multas
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_V_ID_MULTA_ANOTACION     IN VARCHAR2,
  PI_V_AUDUSUMODIFICACION     IN T_SCOB_MULTA_ANOTACION.AUDUSUMODIFICACION%TYPE,
  po_n_retorno                out number,
  po_n_cod_error              out number,
  po_v_msj_error              out varchar2
);


procedure SCOB_SP_S_VISTA_MULTA
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 21.10.2011
-- Proposito    : Consulta de multas
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA                IN T_SCOB_MULTA.ID_MULTA%TYPE,
  PI_V_CUM                     IN T_SCOB_MULTA.CUM%TYPE,
  PI_V_NRO_FILE_AEC            IN T_SCOB_MULTA.NRO_FILE_AEC%TYPE,
  PI_N_ID_AREA_COBRANZA        IN T_SCOB_MULTA.ID_AREA_COBRANZA%TYPE,
  PI_V_ANIO_FILE_AEC           IN T_SCOB_MULTA.ANIO_FILE_AEC%TYPE,
  po_cu_retorno                out cu_rec_set
);

procedure SCOB_SP_S_VISTA_MULTA_ACUM
/*
-----------------------------------------------------------
-- Autor        : JPHR
-- Creado       : 18.01.2017
-- Proposito    : Consulta de multas con o sin acumular
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA                IN T_SCOB_MULTA.ID_MULTA%TYPE,
  PI_V_CUM                     IN T_SCOB_MULTA.CUM%TYPE,
  PI_V_NRO_FILE_AEC            IN T_SCOB_MULTA.NRO_FILE_AEC%TYPE,
  PI_N_ID_AREA_COBRANZA        IN T_SCOB_MULTA.ID_AREA_COBRANZA%TYPE,
  PI_V_ANIO_FILE_AEC           IN T_SCOB_MULTA.ANIO_FILE_AEC%TYPE,
  po_cu_retorno                out cu_rec_set
);

procedure SCOB_SP_S_VISTA_ESTADO_MULTA
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 24.10.2011
-- Proposito    : Consulta de estados vista multas
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA                IN T_SCOB_MULTA.ID_MULTA%TYPE,
  PI_ID_FASE                   IN INTEGER,
  PI_ID_ESTADO                 IN INTEGER,
  PI_ID_MOTIVO                 IN NUMBER,
  po_cu_retorno                out cu_rec_set
);

procedure SCOB_SP_S_VISTA_INGRESOS_MULTA
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 24.10.2011
-- Proposito    : Consulta de ingresos vista multas
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA                IN T_SCOB_MULTA.ID_MULTA%TYPE,
  po_cu_retorno                out cu_rec_set
);


procedure SCOB_SP_S_VISTA_DOCUMENTOS(PIN_NU_ID_MULTA              IN NUMBER,
                                     PIN_NU_ID_TIPO_DOCUMENTO     IN T_SCOB_TIPO_DOCUMENTO.ID_TIPO_DOCUMENTO%TYPE,
                                     PIN_NU_ID_SUBTIPO_DOC        IN INTEGER,
                                     PIN_VC_NRO_DOCUMENTO         IN VARCHAR2,
                                     PIN_NU_COD_FASE              IN INTEGER,
                                     PIN_NU_COD_ESTADO            IN INTEGER,
                                     PIN_NU_ID_MOTIVO             IN NUMBER,
                                     PIN_NU_COD_TIPO_GEN          IN INTEGER,
                                     POUT_CUR_RETORNO             OUT cu_rec_set);


procedure SCOB_SP_S_DATOS_MULTA
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 28.10.2011
-- Proposito    : Consulta los datos de la cabecera de una multa
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA          IN T_SCOB_MULTA.ID_MULTA%TYPE,
  po_cu_retorno          out cu_rec_set
);

procedure SCOB_SP_U_ACT_IMPORTES_EXPED
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 21.12.2011
-- Proposito    : actualiza los datos de importe del expediente en base a lo actualizado en la multa.
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA               IN T_SCOB_MULTA.ID_MULTA%TYPE,
  PI_N_ID_EXPEDIENTE          IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE

);

procedure SCOB_SP_U_DATOS_DECLARAC_MULTA
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 30.12.2011
-- Proposito    : actualiza los datos:
                  La fecha de Notificacion de Declaracion de Consentimiento y
                  La Fecha de Notificacion de Declaracion de Firmeza
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA            IN T_SCOB_MULTA.ID_MULTA%TYPE,
  PI_N_ID_MULTA_DETAL      IN T_SCOB_MULTA_DETAL.ID_MULTA_DETAL%TYPE,
  PI_C_FEC_NOTIF_DECL      IN CHAR,
  PI_V_AUDUSUMODIFICACION  IN T_SCOB_MULTA.AUDUSUMODIFICACION%TYPE,
  po_n_retorno             out number,
  po_n_cod_error           out number,
  po_v_msj_error           out varchar2
);

procedure SCOB_SP_S_CATALOGO_PERSONA
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 02.04.2012
-- Proposito    : Consulta personas del catalogo para asignar a la multa como:
                  administrado: denunciante, denunciado y/o sancionado.
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_V_COD_INDECOPI                 IN T_SCOB_PERSONA.COD_SANCIONADO%TYPE,
  PI_I_TIPO_PERSONA                 IN T_SCOB_PERSONA.TIPO_PERSONA%TYPE,
  PI_I_TIPO_DOC                     IN T_SCOB_PERSONA.TIPO_DOC%TYPE,
  PI_V_NRO_DOC                      IN T_SCOB_PERSONA.NRO_DOC%TYPE,
  PI_V_RAZON_SOCIAL                 IN T_SCOB_PERSONA.RAZON_SOCIAL%TYPE,
  PI_V_PRI_NOMBRE                   IN T_SCOB_PERSONA.PRI_NOMBRE%TYPE,
  PI_V_SEG_NOMBRE                   IN T_SCOB_PERSONA.SEG_NOMBRE%TYPE,
  PI_V_APE_PATERNO                  IN T_SCOB_PERSONA.APE_PATERNO%TYPE,
  PI_V_APE_MATERNO                  IN T_SCOB_PERSONA.APE_MATERNO%TYPE,
  po_cu_retorno                     out cu_rec_set
);

procedure SCOB_SP_I_GRABA_ADMINISTRADO
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 03.04.2012
-- Proposito    : Inserta a las personas del catalogo como administrado
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_TIPO_DOCUMENTO         IN T_SCOB_PERSONA.TIPO_DOC%TYPE,
  PI_V_NRO_DOCUMENTO          IN T_SCOB_PERSONA.NRO_DOC%TYPE,
  PI_V_AUDUSUCREACION         IN T_SCOB_PERSONA.AUDUSUCREACION%TYPE,
  po_n_retorno                out number,
  po_n_cod_error              out number,
  po_v_msj_error              out varchar2
);

procedure SCOB_SP_S_VERIF_ADMIN_BY_MULTA
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 03.04.2012
-- Proposito    : Verifica si la persona, antes, ha sido grabada como denunciante, denunciado, sancionado.
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA_DETAL       IN T_SCOB_MULTA_DETAL.ID_MULTA_DETAL%TYPE,
  PI_I_TIPO_ADMINISTRADO    IN INTEGER, --1=SANCIONADO;2=DENUNCIANTE;3=DENUNCIADO
  PI_N_TIPO_DOC             IN T_SCOB_PERSONA.TIPO_DOC%TYPE,
  PI_V_NRO_DOC              IN T_SCOB_PERSONA.NRO_DOC%TYPE,
  pi_retorno                out integer
);

procedure SCOB_SP_U_EDITA_MULTA_BY_OR
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 29.05.2012
-- Proposito    :
1. ACTUALIZAR la multa por organo resolutivo.
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA                  IN T_SCOB_MULTA.ID_MULTA%TYPE,
  PI_N_ID_MULTA_DETAL_ACTUAL     IN T_SCOB_MULTA_DETAL.ID_MULTA_DETAL%TYPE,
  PI_C_ORIGEN_EDICION            IN CHAR, --1=OR; 2=AEC.
  --
  PI_I_ESTADO_MULTA              IN T_SCOB_MULTA.ESTADO_MULTA%TYPE,
  --NRO EXPEDIENTE ADMINISTRATIVO
  PI_V_EXP_NUEVO_NRO             IN VARCHAR2,
  PI_C_EXP_NUEVO_ANIO            IN CHAR,
  PI_V_EXP_NUEVO_COD_ORG_RESOL   IN VARCHAR,
  PI_V_EXP_NUEVO_COD_MATERIA     IN VARCHAR,
  --NRO EXPEDIENTE ANTIGUO
  PI_V_EXP_ANTIG_NRO             IN VARCHAR2,
  PI_C_EXP_ANTIG_ANIO            IN CHAR,
  PI_N_EXP_ANTIG_ID_SIGLA        IN NUMBER,
  PI_N_EXP_ANTIG_ID_TIPO_EXPED   IN NUMBER,
  PI_V_EXP_ANTIG_COD_SIGLA       IN VARCHAR2,
  PI_V_EXP_ANTIG_COD_TIPO_EXPED  IN VARCHAR2,
  PI_V_EXP_ANTIG_DES_SIGLA       IN VARCHAR2,
  PI_V_EXP_ANTIG_DES_TIPO_EXPED  IN VARCHAR2,
  --NRO RESOLUCION
  PI_V_RESOL_NRO                 IN VARCHAR2,
  PI_C_RESOL_ANIO                IN CHAR,
  PI_N_RESOL_ID_SIGLA            IN NUMBER,
  PI_V_RESOL_COD_SIGLA           IN VARCHAR2,
  PI_V_RESOL_DES_SIGLA           IN VARCHAR2,
  --
  PI_C_FECHA_RESOL               IN CHAR,
  PI_C_FECHA_NOTIF               IN CHAR,
  PI_V_NRO_RESOL_DECLARACION     IN T_SCOB_MULTA_DETAL.NRO_RESOLUCION_DECLARACION%TYPE,
  PI_C_FECHA_DECLA               IN CHAR, --FEC_DECLARACION (CONSENTIMIENTO O FIRMEZA)
  PI_C_FEC_NOTIF_DECLARACION     IN CHAR, --FEC NOTIFICACION DECLARACION (CONSENTIMIENTO O FIRMEZA)
  -----------------------------
  PI_C_FEC_ESTADO_SGTE_INSTANCIA IN CHAR, --FEC APELACION O REVISION
  -----------------------------
  PI_C_FLG_TIPO_MULTA            IN T_SCOB_MULTA.FLG_TIPO_MULTA%TYPE,
  PI_N_SEDE                      IN T_SCOB_SEDE.ID_SEDE%TYPE,
  PI_V_AUDUSUMODIFICACION        IN T_SCOB_MULTA.AUDUSUMODIFICACION%TYPE,
  PI_N_ID_USUARIO_MODIFICACION   IN NUMBER,
  --
  po_n_retorno                   out number,
  po_n_retorno_det               out number,
  po_n_cod_error                 out number,
  po_v_msj_error                 out varchar2
);

procedure SCOB_SP_U_FEC_NOTIFICACION
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 31.05.2012
-- Proposito    : actualiza la fecha de notificacion de los documentos cedula y cedula rec
                  y la fecha de las resoluciones asociadas.
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA              IN T_SCOB_MULTA.ID_MULTA%TYPE,
  PI_N_ID_EXPED_DOCUMENTO    IN T_SCOB_EXPEDIENTE_DOCUMENTO.ID_EXPEDIENTE_DOCUMENTO%TYPE,
  PI_C_FEC_NOTIFICACION      IN CHAR,
  PI_N_ID_USU_MODIFICACION   IN NUMBER,
  PI_V_AUDUSUMODIFICACION    IN T_SCOB_EXPEDIENTE_DOCUMENTO.AUDUSUMODIFICACION%TYPE,
  po_n_retorno               out number,
  po_n_cod_error             out number,
  po_v_msj_error             out varchar2
);

procedure SCOB_SP_U_EDITA_MULTA_ANTDMPNG
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 07/06/2012
-- Proposito    : actualizar las multas por materia antidumping
                  solo si submateria es: derecho antidumping.
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA_ANTIDUMPING         IN T_SCOB_MULTA_ANTIDUMPING.ID_MULTA_ANTIDUMPING%TYPE,
  PI_N_ID_MULTA                     IN T_SCOB_MULTA.ID_MULTA%TYPE,
  PI_N_ID_MULTA_DETAL               IN T_SCOB_MULTA_DETAL.ID_MULTA_DETAL%TYPE,
  PI_N_ID_USUARIO_SECRETARIO        IN T_SCOB_MULTA_DETAL.ID_USUARIO_SECRETARIO%TYPE,
  --
  PI_V_NRO_OFICIO_SUNAT_CODIGO      IN T_SCOB_MULTA_ANTIDUMPING.NRO_OFICIO_SUNAT_CODIGO%TYPE,
  PI_V_NRO_OFICIO_SUNAT_ANIO        IN T_SCOB_MULTA_ANTIDUMPING.NRO_OFICIO_SUNAT_ANIO%TYPE,
  PI_V_NRO_OFICIO_SUNAT_PREFIJO     IN T_SCOB_MULTA_ANTIDUMPING.NRO_OFICIO_SUNAT_PREFIJO%TYPE,
  PI_V_NRO_OFICIO_SUNAT_SEC         IN T_SCOB_MULTA_ANTIDUMPING.NRO_OFICIO_SUNAT_CORRELATIVO%TYPE,
  PI_V_NRO_LIQUIDACION_CODIGO       IN T_SCOB_MULTA_ANTIDUMPING.NRO_LIQUIDACION_CODIGO%TYPE,
  PI_V_NRO_LIQUIDACION_ANIO         IN T_SCOB_MULTA_ANTIDUMPING.NRO_LIQUIDACION_ANIO%TYPE,
  PI_V_NRO_LIQUIDACION_SEC          IN T_SCOB_MULTA_ANTIDUMPING.NRO_LIQUIDACION_CORRELATIVO%TYPE,
  PI_V_NRO_DUA_CODIGO               IN T_SCOB_MULTA_ANTIDUMPING.NRO_DUA_CODIGO%TYPE,
  PI_V_NRO_DUA_ANIO                 IN T_SCOB_MULTA_ANTIDUMPING.NRO_DUA_ANIO%TYPE,
  PI_V_NRO_DUA_SEC                  IN T_SCOB_MULTA_ANTIDUMPING.NRO_DUA_CORRELATIVO%TYPE,
  PI_N_TIPO_CAMBIO                  IN T_SCOB_MULTA_ANTIDUMPING.TIPO_CAMBIO%TYPE,
  PI_N_MONTO_ANTIDUMPING            IN T_SCOB_MULTA_ANTIDUMPING.MONTO_ANTIDUMPING%TYPE,
  PI_N_ID_INTENDENCIA               IN T_SCOB_MULTA_ANTIDUMPING.ID_INTENDENCIA%TYPE,
  PI_N_ID_PARTIDA                   IN T_SCOB_MULTA_ANTIDUMPING.ID_PARTIDA%TYPE,
  PI_V_FECHA_NOTIF                  IN VARCHAR2,
  PI_I_ESTADO_MULTA                 IN T_SCOB_MULTA.ESTADO_MULTA%TYPE,
  PI_N_ID_SEDE                      IN T_SCOB_SEDE.ID_SEDE%TYPE,
 --nuevos
  PI_V_EXP_ANTIG_NRO                IN VARCHAR2,
  PI_C_EXP_ANTIG_ANIO               IN CHAR,
  PI_N_EXP_ANTIG_ID_SIGLA           IN NUMBER,
  PI_N_EXP_ANTIG_ID_TIPO_EXPED      IN NUMBER,
  PI_V_EXP_ANTIG_COD_SIGLA          IN VARCHAR2,
  PI_V_EXP_ANTIG_COD_TIPO_EXPED     IN VARCHAR2,
  PI_V_EXP_ANTIG_DES_SIGLA          IN VARCHAR2,
  PI_V_EXP_ANTIG_DES_TIPO_EXPED     IN VARCHAR2,

  PI_V_RESOL_NRO                    IN VARCHAR2,
  PI_C_RESOL_ANIO                   IN CHAR,
  PI_N_RESOL_ID_SIGLA               IN NUMBER,
  PI_V_RESOL_COD_SIGLA              IN VARCHAR2,
  PI_V_RESOL_DES_SIGLA              IN VARCHAR2,
  --
  PI_V_AUDUSUMODIFICACION           IN T_SCOB_MULTA.AUDUSUCREACION%TYPE,
  PI_N_ID_USUARIO_INGRESO           IN T_SCOB_MULTA.ID_USUARIO_INGRESO%TYPE,
  --
  po_n_retorno                      out number,
  po_n_retorno_det                  out number,
  po_n_cod_error                    out number,
  po_v_msj_error                    out varchar2
);
---

procedure SCOB_SP_U_DOCS_UCI_AEC

  /*
    -----------------------------------------------------------
    -- Autor        : JPHR
    -- Creado       : 17.02.2017
    -- Proposito    : Agrega las fechas que llegan Documentos UCI a AEC.
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
(
  PI_V_NRO_DOCS_UCI        IN VARCHAR2,
  PI_V_ANIO                IN VARCHAR2,
  po_n_retorno             out number,
  po_n_cod_error           out number,
  po_v_msj_error           out varchar2
);
---
procedure SCOB_SP_ELIMINAR_CUM

  /*
    -----------------------------------------------------------
    -- Autor        : @dcelis
    -- Creado       : 27.04.2017
    -- Proposito    : Req. :Eliminación lógica de las multas.
    -----------------------------------------------------------
    */
(
  PI_V_ID_MULTA         IN VARCHAR2,
  PI_V_AUDUSUCREACION   IN VARCHAR2,
  po_n_retorno             out number,
  po_n_cod_error           out number,
  po_v_msj_error           out varchar2
);
--
procedure SCOB_SP_REVERSION_CUM

  /*
    -----------------------------------------------------------
    -- Autor        : @dcelis
    -- Creado       : 27.04.2017
    -- Proposito    : Req. :Eliminación lógica de las multas.
    -----------------------------------------------------------
    */
(
  PI_N_ID_SOLIC_ELIM    IN NUMBER,
  V_NU_ID_MULTA         IN NUMBER,
  PI_V_AUDUSUCREACION   IN VARCHAR2,
  po_n_retorno             out number,
  po_n_cod_error           out number,
  po_v_msj_error           out varchar2
);
--
PROCEDURE SCOB_S_SOLIC_ELIM_REVER_MULTA
  /*
    -----------------------------------------------------------
    -- Autor        : @dcelis
    -- Creado       : 30.05.2017
    -- Proposito    : Listar solicitudes enviadas por usuario y OR
    -----------------------------------------------------------
  */
(
  PI_OP IN VARCHAR2,
  PI_CUM IN VARCHAR2,
  PI_NU_ESTADO_SOLIC IN VARCHAR2,
  PI_NU_TIPO_SOLIC IN VARCHAR2,
  PI_NU_FINICIO IN VARCHAR2,
  PI_NU_FFIN IN VARCHAR2,
  PI_ID_USUARIO IN VARCHAR2,
  PO_N_RETORNO OUT NUMBER,
  PO_N_COD_ERROR OUT NUMBER,
  PO_V_MSJ_ERROR OUT VARCHAR2,
  PO_CU_RETORNO OUT CU_REC_SET
);
--
PROCEDURE SCOB_I_SOLIC_ELIM_REVER_MULTA
  /*
    -----------------------------------------------------------
    -- Autor        : @dcelis
    -- Creado       : 30.05.2017
    -- Proposito    : Listar solicitudes enviadas por usuario y OR
    -----------------------------------------------------------
  */
(
  PI_V_CUM IN VARCHAR2,
  PI_V_TIPO_SOLIC IN VARCHAR2,
  PI_ID_USUARIO IN VARCHAR2,
  PO_N_RETORNO OUT NUMBER,
  PO_N_COD_ERROR OUT NUMBER,
  PO_V_MSJ_ERROR OUT VARCHAR2
);
--
PROCEDURE SCOB_U_SOLIC_ELIM_REVER_MULTA
  /*
    -----------------------------------------------------------
    -- Autor        : @dcelis
    -- Creado       : 30.05.2017
    -- Proposito    : Listar solicitudes enviadas por usuario y OR
    -----------------------------------------------------------
  */
(
  PI_V_ID_SOLIC IN VARCHAR2,
  PI_NU_ESTADO_SOLIC IN VARCHAR2,
  PI_VC_COMENTARIO IN VARCHAR2,
  PI_ID_USUARIO IN VARCHAR2,
  PO_N_RETORNO OUT NUMBER,
  PO_N_COD_ERROR OUT NUMBER,
  PO_V_MSJ_ERROR OUT VARCHAR2
);
--
PROCEDURE SCOB_S_VALID_MULTA
  /*
    -----------------------------------------------------------
    -- Autor        : @dcelis
    -- Creado       : 30.05.2017
    -- Proposito    : Validación de eliminación o Reversión de la multa
    -----------------------------------------------------------
  */
(
  PI_OP IN NUMBER, -- TIPO DE VALIDACION: 1-SOLICITUD / 2-PROCESAR
  PI_CUM IN VARCHAR2,
  PI_ID_TIPO_SOLIC IN VARCHAR2,
  PI_ID_USUARIO IN VARCHAR2,
  PO_N_RETORNO OUT NUMBER,
  PO_N_COD_ERROR OUT NUMBER,
  PO_V_MSJ_ERROR OUT VARCHAR2,
  PO_V_ID_MULTA OUT VARCHAR2
);
--
FUNCTION SCOB_FN_HAS_ADJ_ANOT(
  PI_N_ID_EXPEDIENTE IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
  OP IN NUMBER
)
RETURN VARCHAR2;
---
procedure SCOB_SP_S_MULTA_BY_CUM
/*
-----------------------------------------------------------
-- Autor        : HCHALCO
-- Creado       : 26.06.2021
-- Proposito    : Consulta las multas por CUM
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  po_cu_retorno            out cu_rec_set,
  PI_VC_CUM                 IN T_SCOB_MULTA.CUM%TYPE
);
---
/*
-----------------------------------------------------------
-- Autor        : HCHALCO
-- Creado       : 26.06.2021
-- Proposito    : Consulta las multas por CUM
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
PROCEDURE SCOB_SP_U_RESOLVER_PROB_FECH(PI_D_FEC_RESOLUCION       IN VARCHAR2,
                                       PI_D_FEC_NOTIFI_RESOLUCION    IN VARCHAR2,
                                       PI_D_FEC_INICIO_RANGO    IN VARCHAR2,
                                       PI_D_FEC_FIN_RANGO    IN VARCHAR2,
                                       PI_D_FEC_INI_CONCEN    IN VARCHAR2,
                                       PI_V_ID_DETA_MULTA       IN VARCHAR2,
                                       PI_V_ID_MULTA       IN VARCHAR2,
                                       PI_V_ID_ESTADO_MULTA       IN VARCHAR2,
                                       PI_V_CUM       IN VARCHAR2,
                                       PO_V_RETORNO  OUT VARCHAR2
                                           );
---
/*
-----------------------------------------------------------
-- Autor        : JAGUILAR
-- Creado       : 05.12.2022
-- Proposito    : Consulta los montos de multa por CUM
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
PROCEDURE SCOB_SP_S_MONTO_MULTA_BY_CUM(PIN_VC_CUM       IN T_SCOB_MULTA.CUM%TYPE,
                                       POUT_CUR_RETORNO OUT CU_REC_SET);
---

/*
-----------------------------------------------------------
-- Autor        : JAGUILAR
-- Creado       : 05.12.2022
-- Proposito    : Actualizar montos de multa por ID_MULTA
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
PROCEDURE SCOB_SP_U_MULTA_BY_MONTO(PIN_VC_ID_MULTA              IN VARCHAR2,
                                   PIN_NU_MI_CAPITAL            IN NUMBER,
                                   PIN_NU_MI_INTERES_COMP       IN NUMBER,
                                   PIN_NU_MI_INTERES_MORA       IN NUMBER,
                                   PIN_NU_MI_COSTAS             IN NUMBER,
                                   PIN_NU_TA_CAPITAL            IN NUMBER,
                                   PIN_NU_TA_INTERES_COMP       IN NUMBER,
                                   PIN_NU_TA_INTERES_MORA       IN NUMBER,
                                   PIN_NU_TA_COSTAS             IN NUMBER,
                                   PIN_NU_S_CAPITAL             IN NUMBER,
                                   PIN_NU_S_INTERES_COMP        IN NUMBER,
                                   PIN_NU_S_INTERES_MORA        IN NUMBER,
                                   PIN_NU_S_COSTAS              IN NUMBER,
                                   PIN_NU_VAL_UIT               IN NUMBER,
                                   PIN_VC_NRO_FILE_AEC          IN VARCHAR2,
                                   PIN_VC_USUARIO_MOD           IN VARCHAR,
                                   POUT_NU_RETORNO              OUT NUMBER,
                                   POUT_NU_COD_ERROR            OUT NUMBER,
                                   POUT_VC_MSJ_ERROR            OUT VARCHAR2);

                                   
  -- ******************************************************************************
  -- Descripción: Procedure que actualiza el estado de pago de una multa por el ID
  --
  -- Input Parameters: PIN_ID_MULTA, PI_N_COD_ESTADO_PAGO, PI_V_USUARIO_MOD
  --
  -- Output Parameters: PO_N_RETORNO, PO_N_COD_ERROR , PO_V_MSJ_ERROR
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
  PROCEDURE SCOB_SP_U_MULTA_BY_ESTADO(PIN_NU_ID_MULTA         IN NUMBER,
                                      PIN_NU_COD_ESTADO_PAGO IN NUMBER,
                                      PIN_VC_USUARIO_MOD     IN VARCHAR,
                                      POUT_NU_RETORNO         OUT NUMBER,
                                      POUT_NU_COD_ERROR       OUT NUMBER,
                                      POUT_VC_MSJ_ERROR       OUT VARCHAR2);


end SCOB_PK_MULTAS;
/
CREATE OR REPLACE PACKAGE BODY SCOB_PK_MULTAS is

----
procedure SCOB_SP_I_MULTA_ESTADO
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 24.02.2011
-- Proposito    : inserta el log de estados de las multas por or
-----------------------------------------------------------
-- Modificaciones:
--@0001:28.12.2012:Cambio para identificar el valor NULL en el campo ESTADO_MULTA
--SELECT TO_NUMBER(COD_INTERNO) FROM T_SCOB_TABLA_DET TD WHERE TD.ID_TABLA = 5 AND TD.ESTADO = '1' ORDER BY 1
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA                      IN T_SCOB_MULTA_DETAL.ID_MULTA%TYPE,
  PI_N_ID_MULTA_DETAL                IN T_SCOB_MULTA_DETAL.ID_MULTA_DETAL%TYPE,
  PI_I_ESTADO_MULTA                  IN T_SCOB_MULTA_DETAL.ESTADO_MULTA%TYPE,
  PI_I_COD_MOTIVO                    IN T_SCOB_MULTA.COD_MOTIVO%TYPE,
  PI_C_FEC_ESTADO_MULTA              IN CHAR,
  PI_V_AUDUSUCREACION                IN T_SCOB_MULTA_DETAL.AUDUSUCREACION%TYPE,
  PI_N_USU_ULT_ESTADO                IN T_SCOB_MULTA_DETAL.ID_USUARIO_ULT_ESTADO%TYPE,
  PI_N_ID_MULTA_COBRANZA             IN T_SCOB_MULTA_COBRANZA.ID_MULTA_COBRANZA%TYPE,
  po_n_retorno                       out number,
  po_n_cod_error                     out number,
  po_v_msj_error                     out varchar2
)
is
  N_ID_MULTA_ESTADO                  T_SCOB_MULTA_ESTADO.ID_MULTA_ESTADO%TYPE;
  N_ID_MULTA_DETAL                   T_SCOB_MULTA_DETAL.ID_MULTA_DETAL%TYPE;
  C_FEC_APELACION                    CHAR(10);
  C_FEC_EN_REVISION                  CHAR(10);
  C_FLG_ACTUALIZA                    CHAR(1);

  I_ESTADO_MULTA_ACTUAL              T_SCOB_MULTA.ESTADO_MULTA%TYPE;
  I_COD_MOTIVO_ACTUAL                INTEGER;
  I_COD_MOTIVO_NUEVO                 INTEGER;
  I_ESTADO_PAGO                      INTEGER;
begin
  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  --obtener el estado y motivo actual
  SELECT
    MDET.ID_MULTA_DETAL, NVL(MULT.ESTADO_MULTA,0), NVL(MULT.COD_MOTIVO,0), MULT.COD_ESTADO_PAGO
  INTO
    N_ID_MULTA_DETAL, I_ESTADO_MULTA_ACTUAL, I_COD_MOTIVO_ACTUAL, I_ESTADO_PAGO
  FROM T_SCOB_MULTA_DETAL MDET
  INNER JOIN T_SCOB_MULTA MULT
        ON MULT.ID_MULTA = MDET.ID_MULTA
  WHERE MDET.ID_MULTA = PI_N_ID_MULTA
  AND MDET.FLG_ACTUAL = '1';

  --setear los motivos unicos por estado (NUEVOS)
  IF PI_I_ESTADO_MULTA NOT IN (10,11,12) THEN
     CASE PI_I_ESTADO_MULTA
          WHEN 9 THEN I_COD_MOTIVO_NUEVO := 1;
          WHEN 13 THEN I_COD_MOTIVO_NUEVO := 15;
          ELSE I_COD_MOTIVO_NUEVO := 0;
     END CASE;
  ELSE
     I_COD_MOTIVO_NUEVO := PI_I_COD_MOTIVO;
  END IF;

  IF (
       (PI_N_ID_MULTA_DETAL <> N_ID_MULTA_DETAL) OR
       (PI_I_ESTADO_MULTA <> I_ESTADO_MULTA_ACTUAL) OR
       (I_COD_MOTIVO_NUEVO <> I_COD_MOTIVO_ACTUAL)
     ) THEN
      BEGIN
          SELECT SCOB_SQ_MULTA_ESTADO.NEXTVAL INTO N_ID_MULTA_ESTADO FROM DUAL;

          --@0001:INI
          IF PI_I_ESTADO_MULTA NOT IN (-9,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,17) THEN
             po_v_msj_error :='El valor que se intenta grabar como estado de la multa no esta permitido.';
             po_n_cod_error := -20;
             po_n_retorno := po_n_cod_error;
             return;
          END IF;
          --@0001:FIN

          INSERT INTO T_SCOB_MULTA_ESTADO(
            ID_MULTA_ESTADO,
            ID_MULTA,
            ID_MULTA_DETAL,
            ESTADO_MULTA,
            COD_MOTIVO,
            FEC_ESTADO_MULTA,
            ESTADO,
            AUDFECCREACION,
            AUDUSUCREACION
          )
          VALUES(
            N_ID_MULTA_ESTADO,
            PI_N_ID_MULTA,
            PI_N_ID_MULTA_DETAL,
            PI_I_ESTADO_MULTA,
            I_COD_MOTIVO_NUEVO,
            TO_DATE(PI_C_FEC_ESTADO_MULTA,'DD/MM/YYYY'),
            SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO,
            SYSDATE,
            PI_V_AUDUSUCREACION
          );

          C_FLG_ACTUALIZA := '1';
      END;

  ELSE --actualiza
      --obtener el maximo registro de la tabla
      SELECT MAX(MUES.ID_MULTA_ESTADO)
      INTO N_ID_MULTA_ESTADO
      FROM (
      SELECT MUES.ID_MULTA_ESTADO AS ID_MULTA_ESTADO
      FROM T_SCOB_MULTA_ESTADO MUES
      WHERE MUES.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
      AND MUES.ID_MULTA = PI_N_ID_MULTA
      ) MUES
      ;

      --@0001:INI
      IF PI_I_ESTADO_MULTA NOT IN (-9,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,17) THEN
         po_v_msj_error :='El valor que se intenta grabar como estado de la multa no esta permitido.';
         po_n_cod_error := -20;
         po_n_retorno := po_n_cod_error;
         return;
      END IF;
      --@0001:FIN

      --actualizar el registro
      UPDATE T_SCOB_MULTA_ESTADO
      SET
          ID_MULTA = PI_N_ID_MULTA,
          ID_MULTA_DETAL = PI_N_ID_MULTA_DETAL,
          ESTADO_MULTA = PI_I_ESTADO_MULTA,
          COD_MOTIVO = I_COD_MOTIVO_NUEVO,
          FEC_ESTADO_MULTA = TO_DATE(PI_C_FEC_ESTADO_MULTA,'DD/MM/YYYY'),
          AUDFECMODIFICACION = SYSDATE,
          AUDUSUMODIFICACION = PI_V_AUDUSUCREACION
      WHERE ID_MULTA_ESTADO = N_ID_MULTA_ESTADO;

      C_FLG_ACTUALIZA := '1';

  END IF;

  IF C_FLG_ACTUALIZA = '1' THEN

      --actualizar el estado de la multa
      --ACTUALIZAR LAS FECHAS DEL PASO DE NIVEL--
      C_FEC_APELACION := NULL;
      C_FEC_EN_REVISION := NULL;
      IF PI_I_ESTADO_MULTA = SCOB_PK_CONSTANTES.C_EST_MULT_APELADA THEN
            C_FEC_APELACION := PI_C_FEC_ESTADO_MULTA;--TO_DATE(PI_C_FEC_ESTADO_MULTA,'DD/MM/YYYY');
      ELSIF PI_I_ESTADO_MULTA = SCOB_PK_CONSTANTES.C_EST_MULT_EN_REVISION THEN
            C_FEC_EN_REVISION := PI_C_FEC_ESTADO_MULTA;--TO_DATE(PI_C_FEC_ESTADO_MULTA,'DD/MM/YYYY');
      END IF;

      UPDATE T_SCOB_MULTA MULT
      SET
        ESTADO_MULTA = PI_I_ESTADO_MULTA,
        COD_MOTIVO = I_COD_MOTIVO_NUEVO,
        FEC_ESTADO_MULTA = TO_DATE(PI_C_FEC_ESTADO_MULTA,'DD/MM/YYYY'),
        FEC_EN_REVISION = DECODE(C_FEC_EN_REVISION,NULL,FEC_EN_REVISION,TO_DATE(C_FEC_EN_REVISION,'DD/MM/YYYY')),
        FEC_APELACION = DECODE(C_FEC_APELACION,NULL,FEC_APELACION,TO_DATE(C_FEC_APELACION,'DD/MM/YYYY')),
        AUDUSUMODIFICACION = PI_V_AUDUSUCREACION,
        AUDFECMODIFICACION = SYSDATE
        --IND_DESCUENTO = DECODE(I_ESTADO_MULTA_ACTUAL,2,(DECODE(I_ESTADO_PAGO,1,IND_DESCUENTO,'0')),IND_DESCUENTO)
      WHERE ID_MULTA = PI_N_ID_MULTA;


      IF PI_N_ID_MULTA_COBRANZA = 0 THEN
          /*actualizar el estado del nivel de la multa*/
          UPDATE T_SCOB_MULTA_DETAL
          SET
            ESTADO_MULTA = PI_I_ESTADO_MULTA,
            FEC_ESTADO_MULTA = TO_DATE(PI_C_FEC_ESTADO_MULTA,'DD/MM/YYYY'),
            AUDUSUMODIFICACION = PI_V_AUDUSUCREACION,
            AUDFECMODIFICACION = SYSDATE,
            ID_USUARIO_ULT_ESTADO = PI_N_USU_ULT_ESTADO
          WHERE ID_MULTA = PI_N_ID_MULTA
          AND ID_MULTA_DETAL = PI_N_ID_MULTA_DETAL;
      END IF;


  END IF;

  po_n_cod_error := 0;
  po_n_retorno := PI_N_ID_MULTA_DETAL;

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

procedure SCOB_SP_I_MULTA_NIVEL_BY_OR
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 15.02.2011
-- Proposito    : inserta el primer nivel de registro de una multa.
                  no realiza commit, debe llamarse desde otro sp.
-----------------------------------------------------------
-- Modificaciones:
--@0001:12.12.2012:Cambio para identificar el valor NULL en el campo ESTADO_MULTA
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA                      IN T_SCOB_MULTA_DETAL.ID_MULTA%TYPE,
  PI_N_ID_ORGANO_RESOLUTIVO          IN T_SCOB_MULTA_DETAL.ID_ORGANO_RESOLUTIVO%TYPE,
  PI_N_ID_USUARIO_SECRETARIO         IN T_SCOB_MULTA_DETAL.ID_USUARIO_SECRETARIO%TYPE,
  ---------------------------------------------------------------------------------
  --nuevos
  PI_N_ID_SIGLA                      IN NUMBER,
  PI_V_COD_SIGLA                     IN VARCHAR2,
  PI_V_DES_SIGLA                     IN VARCHAR2,
  --
  PI_V_EXP_ANTIG_NRO                 IN VARCHAR2,
  PI_C_EXP_ANTIG_ANIO                IN CHAR,
  PI_N_EXP_ANTIG_ID_TIPO_EXPED       IN NUMBER,
  PI_V_EXP_ANTIG_COD_TIPO_EXPED      IN VARCHAR2,
  PI_V_EXP_ANTIG_DES_TIPO_EXPED      IN VARCHAR2,
  PI_V_NRO_EXPED_ANTIGUO_ID           IN VARCHAR2,
  --
  PI_V_RESOL_NRO                     IN VARCHAR2,
  PI_C_RESOL_ANIO                    IN CHAR,
  PI_N_RESOL_ID_SIGLA                IN NUMBER,
  PI_V_RESOL_COD_SIGLA               IN VARCHAR2,
  PI_V_RESOL_DES_SIGLA               IN VARCHAR2,
  NRO_RESOLUCION_ID                  IN VARCHAR2,
  --
  PI_V_NRO_RESOL                     IN T_SCOB_MULTA_DETAL.NRO_RESOLUCION%TYPE,
  PI_C_FECHA_RESOL                   IN CHAR,
  PI_V_NRO_EXP_NIVEL                 IN T_SCOB_MULTA_DETAL.NRO_EXP_NIVEL%TYPE,
  ---------------------------------------------------------------------------------
  PI_V_AUDUSUCREACION                IN T_SCOB_MULTA_DETAL.AUDUSUCREACION%TYPE,
  PI_N_ID_USUARIO_INGRESO            IN T_SCOB_MULTA_DETAL.ID_USUARIO_INGRESO%TYPE,
  po_n_retorno                       out number,
  po_n_cod_error                     out number,
  po_v_msj_error                     out varchar2
)
is
  n_id_multa_nivel    T_SCOB_MULTA_DETAL.ID_MULTA_DETAL%TYPE;
begin
  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  SELECT SCOB_SQ_MULTA_DETAL.NEXTVAL INTO n_id_multa_nivel FROM dual;

  --actualiza los niveles anteriores de la multa.
  UPDATE T_SCOB_MULTA_DETAL
  SET
    FLG_ACTUAL = '0',
    AUDUSUMODIFICACION = PI_V_AUDUSUCREACION,
    AUDFECMODIFICACION = SYSDATE
  WHERE ID_MULTA = PI_N_ID_MULTA
  AND FLG_ACTUAL = '1';

  --inserta el registro de nivel de multa
  INSERT INTO T_SCOB_MULTA_DETAL(
      ID_MULTA_DETAL,
      ID_MULTA,
      ID_ORGANO_RESOLUTIVO,
      ID_USUARIO_SECRETARIO,
      NRO_RESOLUCION,
      FEC_RESOLUCION,
      -----------------------------------------------------------------
      ID_SIGLA,
      COD_SIGLA,
      DES_SIGLA,
      --
      NRO_EXPED_ANTIGUO,
      ANIO_EXPED_ANTIGUO,
      ID_TIPO_EXPED_ANTIGUO,
      COD_TIPO_EXPED_ANTIGUO,
      DES_TIPO_EXPED_ANTIGUO,
      NRO_EXPED_ANTIGUO_ID,
      --
      NRO_RESOLUCION_SEC,
      ANIO_RESOLUCION,
      ID_SIGLA_RESOLUCION,
      COD_SIGLA_RESOLUCION,
      DES_SIGLA_RESOLUCION,
      NRO_RESOLUCION_ID,
      -----------------------------------------------------------------
      FLG_ACTUAL,
      ESTADO,
      AUDFECCREACION,
      AUDUSUCREACION,
      NRO_EXP_NIVEL,
      ID_USUARIO_INGRESO,
      VALOR_UIT,
      --@0001:INI
      ESTADO_MULTA
      --@0001:FIN
      )
  VALUES(
      n_id_multa_nivel,
      PI_N_ID_MULTA,
      PI_N_ID_ORGANO_RESOLUTIVO,
      PI_N_ID_USUARIO_SECRETARIO,
      PI_V_NRO_RESOL,
      TO_DATE(PI_C_FECHA_RESOL,'DD/MM/YYYY'),
      -----------------------------------------------------------------
      PI_N_ID_SIGLA,
      PI_V_COD_SIGLA,
      PI_V_DES_SIGLA,
      --
      PI_V_EXP_ANTIG_NRO,
      PI_C_EXP_ANTIG_ANIO,
      PI_N_EXP_ANTIG_ID_TIPO_EXPED,
      PI_V_EXP_ANTIG_COD_TIPO_EXPED,
      PI_V_EXP_ANTIG_DES_TIPO_EXPED,
      PI_V_NRO_EXPED_ANTIGUO_ID,
      --
      PI_V_RESOL_NRO,
      PI_C_RESOL_ANIO,
      PI_N_RESOL_ID_SIGLA,
      PI_V_RESOL_COD_SIGLA,
      PI_V_RESOL_DES_SIGLA,
      NRO_RESOLUCION_ID,
      -----------------------------------------------------------------
      '1', -- flag que indica el nivel actual de la multa (1, 2 o 3).
      SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO,
      SYSDATE,
      PI_V_AUDUSUCREACION,
      PI_V_NRO_EXP_NIVEL,
      PI_N_ID_USUARIO_INGRESO,
      0,
      --@0001:INI
      -9
      --@0002:FIN
  );

  po_n_cod_error := 0;
  po_n_retorno := n_id_multa_nivel;
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

procedure SCOB_SP_U_MULTA_NIVEL_BY_OR
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 17.02.2011
-- Proposito    : Actualiza cualquier nivel de una multa
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   : 2023-02-12
-- Proposito    : Procesos en linea
-----------------------------------------------------------
--@0002:RMCA:06.02.2013:que ingrese siempre como dentro del plazo (pruebas de caja: si la fecha plazo es mayor a la fecha actual, no cambiaba el estado en plazo)
*/
(
  PI_N_ID_MULTA                       IN T_SCOB_MULTA.ID_MULTA%TYPE,
  PI_N_ID_MULTA_DETAL                 IN T_SCOB_MULTA_DETAL.ID_MULTA_DETAL%TYPE,
  PI_N_ID_CLASIFICACION               IN T_SCOB_MULTA.ID_CLASIFICACION%TYPE,
  PI_N_ID_USUARIO_SECRETARIO          IN T_SCOB_MULTA_DETAL.ID_USUARIO_SECRETARIO%TYPE,
  PI_I_ESTADO_MULTA                   IN T_SCOB_MULTA_DETAL.ESTADO_MULTA%TYPE,
  -----------------------------
  PI_C_FECHA_RESOL                    IN CHAR,
  PI_C_FECHA_NOTIF                    IN CHAR,
  -----------------------------
  PI_V_NRO_RESOL_DECLARACION          IN T_SCOB_MULTA_DETAL.NRO_RESOLUCION_DECLARACION%TYPE,
                                         --NRO RESOLUCION (CONSENTIMIENTO O FIRMEZA)
  PI_C_FECHA_DECLA                    IN CHAR, --FEC_DECLARACION (CONSENTIMIENTO O FIRMEZA)
  PI_C_FEC_NOTIF_DECLARACION          IN CHAR, --FEC NOTIFICACION DECLARACION (CONSENTIMIENTO O FIRMEZA)
  -----------------------------
  PI_C_FEC_ESTADO_SGTE_INSTANCIA      IN CHAR, --FEC APELACION O REVISION
  -----------------------------
  PI_V_RESOL_NRO                      IN VARCHAR2,
  PI_C_RESOL_ANIO                     IN CHAR,
  PI_N_RESOL_ID_SIGLA                 IN NUMBER,
  PI_V_RESOL_COD_SIGLA                IN VARCHAR2,
  PI_V_RESOL_DES_SIGLA                IN VARCHAR2,
  -----------------------------
  PI_V_AUDUSUMODIFICACION             IN T_SCOB_MULTA_DETAL.AUDUSUMODIFICACION%TYPE,
  po_n_retorno                        out number,
  po_n_cod_error                      out number,
  po_v_msj_error                      out varchar2
)
is

  I_EXISTE                        INTEGER;
  N_ID_USUARIO_INGRESO            T_SCOB_MULTA_DETAL.ID_USUARIO_INGRESO%TYPE;
  I_ESTADO_MULTA_ACTUAL           T_SCOB_MULTA.ESTADO_MULTA%TYPE;
  C_FEC_ESTADO                    CHAR(10);
  N_NRO_INSTANCIA_MULTA           INTEGER;
  N_NRO_INSTANCIA_INICIA          INTEGER;
  N_NRO_DIAS_PLAZO                INTEGER;
  I_FLG_GRABA_PLAZO               INTEGER;
  C_FEC_INICIO_PLAZO              CHAR(10);
  C_FEC_FIN_PLAZO                 CHAR(10);
  C_FEC_ESTADO_INSTANCIA          CHAR(10);
  --
  V_ID_NRO_RESOLUCION_ID          T_SCOB_MULTA_DETAL.NRO_RESOLUCION_ID%TYPE;
  --
  V_NRO_RESOL                     T_SCOB_MULTA_DETAL.NRO_RESOLUCION%TYPE;
  --
  V_COD_ORGANO_RESOLUTIVO         T_SCOB_ORGANO_RESOLUTIVO.CODIGO%TYPE;
  I_NRO_PLAZO_REVISION            INTEGER;
  I_NRO_PLAZO_APELACION           INTEGER;
  N_POR_DSCTO_APELACION           T_SCOB_DESCUENTO.POR_DSCTO%TYPE;

begin
  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  --VALIDACIONES DE FECHAS
  I_EXISTE:=0;
  --verifica la fecha notificacion
  IF NVL(PI_C_FECHA_NOTIF,' ' ) <> ' ' THEN
      --scob_pk_utilitario.scob_sp_s_valida_fecha(PI_C_FECHA_NOTIF,'U',I_EXISTE);
      scob_pk_utilitario.scob_sp_s_valida_fecha_by_or(PI_C_FECHA_NOTIF,'U',PI_N_ID_MULTA_DETAL,SCOB_PK_CONSTANTES.C_NU_X_ID_MULTA_DETAL,I_EXISTE);
      IF I_EXISTE=0 THEN
        po_n_retorno := -9;
        po_n_cod_error := po_n_retorno;
        po_v_msj_error := 'La fecha de notificacion no es valida, debe seleccionar una fecha habil.';
        return;
      END IF;
      I_EXISTE := 0;
  END IF;

  --verifica la fecha de declaracion
  I_EXISTE:=0;
  IF NVL(PI_C_FECHA_DECLA,' ' ) <> ' ' THEN
      --scob_pk_utilitario.scob_sp_s_valida_fecha(PI_C_FECHA_DECLA,'U',I_EXISTE);
      scob_pk_utilitario.scob_sp_s_valida_fecha_by_or(PI_C_FECHA_DECLA,'U',PI_N_ID_MULTA_DETAL,SCOB_PK_CONSTANTES.C_NU_X_ID_MULTA_DETAL,I_EXISTE);
      IF I_EXISTE=0 THEN
        po_n_retorno := -9;
        po_n_cod_error := po_n_retorno;
        po_v_msj_error := 'La fecha de declaracion no es valida, debe seleccionar una fecha habil.';
        return;
      END IF;
      I_EXISTE := 0;
  END IF;

  --verifica la fecha de notificacion de declaracion
  I_EXISTE:=0;
  IF NVL(PI_C_FEC_NOTIF_DECLARACION,' ' ) <> ' ' THEN
      --scob_pk_utilitario.scob_sp_s_valida_fecha(PI_C_FEC_NOTIF_DECLARACION,'U',I_EXISTE);
      scob_pk_utilitario.scob_sp_s_valida_fecha_by_or(PI_C_FEC_NOTIF_DECLARACION,'U',PI_N_ID_MULTA_DETAL,SCOB_PK_CONSTANTES.C_NU_X_ID_MULTA_DETAL,I_EXISTE);
      IF I_EXISTE=0 THEN
        po_n_retorno := -9;
        po_n_cod_error := po_n_retorno;
        po_v_msj_error := 'La fecha de notificacion de declaracion no es valida, debe seleccionar una fecha habil.';
        return;
      END IF;
      I_EXISTE := 0;
  END IF;
  --verifica la fecha siguiente instancia (apelacion o revision)
  I_EXISTE:=0;
  IF NVL(PI_C_FEC_ESTADO_SGTE_INSTANCIA,' ' ) <> ' ' THEN
      --scob_pk_utilitario.scob_sp_s_valida_fecha(PI_C_FEC_ESTADO_SGTE_INSTANCIA,'U',I_EXISTE);
      scob_pk_utilitario.scob_sp_s_valida_fecha_by_or(PI_C_FEC_ESTADO_SGTE_INSTANCIA,'U',PI_N_ID_MULTA_DETAL,SCOB_PK_CONSTANTES.C_NU_X_ID_MULTA_DETAL,I_EXISTE);
      IF I_EXISTE=0 THEN
        po_n_retorno := -9;
        po_n_cod_error := po_n_retorno;
        po_v_msj_error := 'La fecha de apelacion o revision no es valida, debe seleccionar una fecha habil.';
        return;
      END IF;
      I_EXISTE := 0;
  END IF;

  -------------------------------------------------------------29.05.2012
  --obtener los dias de plazo de apelacion
  I_EXISTE := 0;
  BEGIN
      SELECT NVL(DSCTO.NRO_DIAS,0),NVL(POR_DSCTO,0)
      INTO I_NRO_PLAZO_APELACION, N_POR_DSCTO_APELACION
      FROM T_SCOB_MULTA MULT
      INNER JOIN T_SCOB_DESCUENTO DSCTO
            ON DSCTO.ID_MATERIA = MULT.ID_MATERIA
            AND DSCTO.ESTADO = '1'
      WHERE MULT.ID_MULTA = PI_N_ID_MULTA;

  EXCEPTION WHEN NO_DATA_FOUND THEN
      I_EXISTE := -10;
  END;
  IF I_EXISTE < 0 THEN
      po_v_msj_error :='No se puede realizar la accion. No se tiene configurado el plazo de apelacion. Revisar mantenimiento de materias (descuento).';
      po_n_cod_error := -10;
      po_n_retorno := po_n_cod_error;
      return;
  END IF;

  --obtener los dias de plazo de revision
  I_EXISTE := 0;
  BEGIN
      SELECT NVL(MATE.PLA_REVISION,0)
      INTO I_NRO_PLAZO_REVISION
      FROM T_SCOB_MULTA MULT
      INNER JOIN T_SCOB_MATERIA MATE
            ON MATE.ID_MATERIA = MULT.ID_MATERIA
      WHERE MULT.ID_MULTA = PI_N_ID_MULTA;
  EXCEPTION WHEN NO_DATA_FOUND THEN
    I_EXISTE := -11;
  END;
  IF I_EXISTE < 0 THEN
      po_v_msj_error :='No se puede realizar la accion. No se tiene configurado el plazo de revision. Revisar mantenimiento de materias.';
      po_n_cod_error := -11;
      po_n_retorno := po_n_cod_error;
      return;
  END IF;

  I_EXISTE := 0;
  --OBTENER EL COD_RESOLUCION
  SELECT ORGR.CODIGO
  INTO V_COD_ORGANO_RESOLUTIVO
  FROM T_SCOB_ORGANO_RESOLUTIVO ORGR
  INNER JOIN T_SCOB_MULTA_DETAL MDET
        ON MDET.ID_MULTA_DETAL = PI_N_ID_MULTA_DETAL
        AND MDET.ID_ORGANO_RESOLUTIVO = ORGR.ID_ORGANO_RESOLUTIVO;

  --COMPOSICION DEL NRO_EXPEDIENTE_ADMINISTRATIVO, NRO_EXPEDIENTE_UNICO, NRO_RESOLUTIVO.
  V_ID_NRO_RESOLUCION_ID := PI_V_RESOL_NRO ||''|| PI_C_RESOL_ANIO ||''|| V_COD_ORGANO_RESOLUTIVO;
  V_NRO_RESOL := PI_V_RESOL_NRO ||'-'|| PI_C_RESOL_ANIO ||'/'|| PI_V_RESOL_DES_SIGLA;

  --verifica el sancionado segun estado de la multa
  IF  (PI_I_ESTADO_MULTA = SCOB_PK_CONSTANTES.C_EST_MULT_CONSENTIDA) OR
      (PI_I_ESTADO_MULTA = SCOB_PK_CONSTANTES.C_EST_MULT_FIRME)      OR
      (PI_I_ESTADO_MULTA = SCOB_PK_CONSTANTES.C_EST_MULT_REVISADA)   OR
      (PI_I_ESTADO_MULTA = SCOB_PK_CONSTANTES.C_EST_MULT_APELADA)    OR
      (PI_I_ESTADO_MULTA = SCOB_PK_CONSTANTES.C_EST_MULT_EN_REVISION)
      THEN

      --verificar que se tenga un sancionado.
      SELECT COUNT(MSAN.ID_MULTA_SANCIONADO)
      INTO I_EXISTE
      FROM T_SCOB_MULTA_DETAL MDET
      INNER JOIN T_SCOB_MULTA_SANCIONADO MSAN
            ON MSAN.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL
            AND MSAN.ESTADO = '1'
            AND MSAN.COD_TIPO_PERSONA = SCOB_PK_CONSTANTES.C_COD_TIPO_PERSONA_SANCIONADO --SANCIONADO
      WHERE MDET.ID_MULTA = PI_N_ID_MULTA
      AND MDET.FLG_ACTUAL = '1'
      AND MDET.ESTADO = '1';

      IF I_EXISTE < 1 THEN
          po_n_cod_error := -12;
          po_v_msj_error := 'No se puede realizar la accion. Debe registrar al sancionado.';
          return;
      END IF;
  END IF;

  I_ESTADO_MULTA_ACTUAL := PI_I_ESTADO_MULTA;

  --actualizar la multa segun nivel.
  UPDATE T_SCOB_MULTA_DETAL
  SET
    ID_USUARIO_SECRETARIO = PI_N_ID_USUARIO_SECRETARIO,
    NRO_RESOLUCION = V_NRO_RESOL,
    NRO_RESOLUCION_SEC = PI_V_RESOL_NRO,
    ANIO_RESOLUCION = PI_C_RESOL_ANIO,
    ID_SIGLA_RESOLUCION = PI_N_RESOL_ID_SIGLA,
    COD_SIGLA_RESOLUCION = PI_V_RESOL_COD_SIGLA,
    DES_SIGLA_RESOLUCION = PI_V_RESOL_DES_SIGLA,
    NRO_RESOLUCION_ID = V_ID_NRO_RESOLUCION_ID,
    -----
    FEC_RESOLUCION = TO_DATE(PI_C_FECHA_RESOL,'DD/MM/YYYY'),
    FEC_NOTIFICACION_RESOLUCION = DECODE(NVL(PI_C_FECHA_NOTIF,' '), ' ', NULL, TO_DATE(PI_C_FECHA_NOTIF,'DD/MM/YYYY')),
    --
    NRO_RESOLUCION_DECLARACION = DECODE(NVL(PI_V_NRO_RESOL_DECLARACION,' '),' ',NULL,PI_V_NRO_RESOL_DECLARACION),
    FEC_DECLARACION = DECODE(NVL(PI_C_FECHA_DECLA,' '),' ',NULL,TO_DATE(PI_C_FECHA_DECLA,'DD/MM/YYYY')),
    FEC_NOTIFICACION_DECLARACION = DECODE(NVL(PI_C_FEC_NOTIF_DECLARACION,' '),' ',NULL,TO_DATE(PI_C_FEC_NOTIF_DECLARACION,'DD/MM/YYYY')),
    --
    FEC_ESTADO_SGTE_INSTANCIA = DECODE(NVL(PI_C_FEC_ESTADO_SGTE_INSTANCIA,' '),' ',NULL,TO_DATE(PI_C_FEC_ESTADO_SGTE_INSTANCIA,'DD/MM/YYYY')),
    --
    AUDUSUMODIFICACION = PI_V_AUDUSUMODIFICACION,
    AUDFECMODIFICACION = SYSDATE
  WHERE ID_MULTA_DETAL = PI_N_ID_MULTA_DETAL;

  /********************************************************************************/
  --insertar logs de estados.
  /********************************************************************************/
  --OBTENER EL ID DEL USUARIO QUE INGRESA LA INFORMACION
  SELECT USUARIO.ID_USUARIO
  INTO N_ID_USUARIO_INGRESO
  FROM T_SCOB_USUARIO USUARIO
  WHERE UPPER(TRIM(USUARIO.USUARIO)) = UPPER(TRIM(PI_V_AUDUSUMODIFICACION))
  AND USUARIO.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO;
  --OBTENER LA INSTANCIA DE LA MULTA
  SELECT ORGR.TIPO_INSTANCIA, MULT.TIPO_INSTANCIA_INICIA
  INTO N_NRO_INSTANCIA_MULTA, N_NRO_INSTANCIA_INICIA
  FROM T_SCOB_MULTA_DETAL MDET
  INNER JOIN T_SCOB_MULTA MULT
        ON MULT.ID_MULTA = MDET.ID_MULTA
  INNER JOIN T_SCOB_ORGANO_RESOLUTIVO ORGR
        ON ORGR.ID_ORGANO_RESOLUTIVO = MDET.ID_ORGANO_RESOLUTIVO
  WHERE MDET.ID_MULTA_DETAL = PI_N_ID_MULTA_DETAL;

  --ACTUALIZACION DEL ESTADO Y FECHA DE ESTADO --27.09.2011B
  --obtener la fecha del cambio de estado
  C_FEC_ESTADO := TO_CHAR(SYSDATE,'DD/MM/YYYY');

  I_FLG_GRABA_PLAZO := 0;

  --verifica los estados por instacia que inicia la multa
  IF N_NRO_INSTANCIA_INICIA = SCOB_PK_CONSTANTES.C_TBL_TIPO_INSTANCIA_AUTO THEN --(TRES INSTANCIAS)

     CASE N_NRO_INSTANCIA_MULTA
         WHEN SCOB_PK_CONSTANTES.C_TBL_TIPO_INSTANCIA_AUTO THEN
              CASE I_ESTADO_MULTA_ACTUAL
                   WHEN SCOB_PK_CONSTANTES.C_EST_MULT_IMPUESTA THEN --IMPUESTA
                        C_FEC_ESTADO := PI_C_FECHA_RESOL;

                        --CALCULA EL PERIODO DE PLAZO
                        IF NVL(PI_C_FECHA_NOTIF,' ')<>' 'THEN
                              I_FLG_GRABA_PLAZO := 11;
                        END IF;

                   WHEN SCOB_PK_CONSTANTES.C_EST_MULT_CONSENTIDA THEN --CONSENTIDA
                        C_FEC_ESTADO := PI_C_FECHA_DECLA;
                   WHEN SCOB_PK_CONSTANTES.C_EST_MULT_APELADA THEN --APELADA
                        C_FEC_ESTADO := PI_C_FEC_ESTADO_SGTE_INSTANCIA;
                   ELSE NULL;
              END CASE;
         WHEN SCOB_PK_CONSTANTES.C_TBL_TIPO_INSTANCIA_COMI THEN
              CASE I_ESTADO_MULTA_ACTUAL
                 WHEN SCOB_PK_CONSTANTES.C_EST_MULT_PENDIENTE_RESOLVER THEN --IMPUESTA
                      C_FEC_ESTADO := PI_C_FECHA_RESOL;

                      --CALCULA EL PERIODO DE PLAZO
                      IF NVL(PI_C_FECHA_NOTIF,' ')<>' 'THEN
                            I_FLG_GRABA_PLAZO := 12;
                      END IF;
                 WHEN SCOB_PK_CONSTANTES.C_EST_MULT_FIRME THEN --FIRME
                      C_FEC_ESTADO := PI_C_FECHA_DECLA;
                 WHEN SCOB_PK_CONSTANTES.C_EST_MULT_EN_REVISION THEN --EN REVISION
                      C_FEC_ESTADO := PI_C_FEC_ESTADO_SGTE_INSTANCIA;
                 ELSE NULL;
            END CASE;
         WHEN SCOB_PK_CONSTANTES.C_TBL_TIPO_INSTANCIA_SALA THEN
            CASE I_ESTADO_MULTA_ACTUAL
                 WHEN SCOB_PK_CONSTANTES.C_EST_MULT_PENDIENTE_RESOLVER THEN --IMPUESTA
                      C_FEC_ESTADO := PI_C_FECHA_RESOL;
                 WHEN SCOB_PK_CONSTANTES.C_EST_MULT_REVISADA THEN --REVISADA
                      C_FEC_ESTADO := PI_C_FECHA_NOTIF;
                 ELSE NULL;
            END CASE;
         ELSE NULL;
     END CASE;

  ELSIF N_NRO_INSTANCIA_INICIA = SCOB_PK_CONSTANTES.C_TBL_TIPO_INSTANCIA_COMI THEN --(DOS INSTANCIAS)

     CASE N_NRO_INSTANCIA_MULTA
         WHEN SCOB_PK_CONSTANTES.C_TBL_TIPO_INSTANCIA_COMI THEN
              CASE I_ESTADO_MULTA_ACTUAL
                   WHEN SCOB_PK_CONSTANTES.C_EST_MULT_IMPUESTA THEN --IMPUESTA
                        C_FEC_ESTADO := PI_C_FECHA_RESOL;

                        --CALCULA EL PERIODO DE PLAZO
                        IF NVL(PI_C_FECHA_NOTIF,' ')<>' 'THEN
                           I_FLG_GRABA_PLAZO := 21;
                        END IF;
                   WHEN SCOB_PK_CONSTANTES.C_EST_MULT_CONSENTIDA THEN --CONSENTIDA
                        C_FEC_ESTADO := PI_C_FECHA_DECLA;
                   WHEN SCOB_PK_CONSTANTES.C_EST_MULT_APELADA THEN --APELADA
                        C_FEC_ESTADO := PI_C_FEC_ESTADO_SGTE_INSTANCIA;
                   ELSE NULL;
              END CASE;
         WHEN SCOB_PK_CONSTANTES.C_TBL_TIPO_INSTANCIA_SALA THEN
            CASE I_ESTADO_MULTA_ACTUAL
                 WHEN SCOB_PK_CONSTANTES.C_EST_MULT_PENDIENTE_RESOLVER THEN --IMPUESTA
                      C_FEC_ESTADO := PI_C_FECHA_RESOL;
                 WHEN SCOB_PK_CONSTANTES.C_EST_MULT_FIRME THEN --FIRME
                      C_FEC_ESTADO := PI_C_FECHA_NOTIF;
                 ELSE NULL;
            END CASE;
         ELSE NULL;
     END CASE;

  END IF;

  SCOB_SP_I_MULTA_ESTADO(PI_N_ID_MULTA, PI_N_ID_MULTA_DETAL, I_ESTADO_MULTA_ACTUAL, 0, C_FEC_ESTADO, PI_V_AUDUSUMODIFICACION, N_ID_USUARIO_INGRESO, 0, po_n_retorno,  PO_N_COD_ERROR,  PO_V_MSJ_ERROR);
  --@0001:INI
  if po_n_retorno < 0 then
     rollback;
     return;
  end if;
  --@0001:FIN

  /*************************************************************************/
  --GENERA LOS OTROS ESTADOS DE LA MULTA --27.09.2011
  /*************************************************************************/
  --ACTUALIZA LAS FECHAS DE PLAZO
  IF I_FLG_GRABA_PLAZO <> 0 THEN
    --C_FEC_INICIO_PLAZO := TO_CHAR(TO_DATE(PI_C_FECHA_NOTIF,'DD/MM/YYYY') + 1,'DD/MM/YYYY');
    /*C_FEC_INICIO_PLAZO := TO_CHAR(SCOB_PK_UTILITARIO.SCOB_FN_DIAS_VALIDOS(
                              TO_DATE(PI_C_FECHA_NOTIF,'DD/MM/YYYY'),
                              2, '0'),'DD/MM/YYYY'
                             );*/ --mas un dia.
    C_FEC_INICIO_PLAZO := TO_CHAR(SCOB_PK_UTILITARIO.SCOB_FN_DIAS_VALIDOS_BY_OR(
                              TO_DATE(PI_C_FECHA_NOTIF,'DD/MM/YYYY'),
                              2, '0',PI_N_ID_MULTA_DETAL,
                              SCOB_PK_CONSTANTES.C_NU_X_ID_MULTA_DETAL)
                              ,'DD/MM/YYYY'
                             ); --mas un dia.

    --
    C_FEC_ESTADO := TO_CHAR(SYSDATE,'DD/MM/YYYY');
    /*----------------------------------------------------------------------------------*/
    --CAMBIA AL ESTADO EN PLAZO
    /*----------------------------------------------------------------------------------*/
    CASE I_FLG_GRABA_PLAZO
         WHEN 11 THEN
             I_ESTADO_MULTA_ACTUAL := SCOB_PK_CONSTANTES.C_EST_MULT_EN_PLAZO_APELACION;
             C_FEC_ESTADO := C_FEC_INICIO_PLAZO;
             N_NRO_DIAS_PLAZO := I_NRO_PLAZO_APELACION;
         WHEN 12 THEN
             I_ESTADO_MULTA_ACTUAL := SCOB_PK_CONSTANTES.C_EST_MULT_EN_PLAZO_REVISION;
             C_FEC_ESTADO := C_FEC_INICIO_PLAZO;
             N_NRO_DIAS_PLAZO := I_NRO_PLAZO_REVISION;
         WHEN 21 THEN
             I_ESTADO_MULTA_ACTUAL := SCOB_PK_CONSTANTES.C_EST_MULT_EN_PLAZO_APELACION;
             C_FEC_ESTADO := C_FEC_INICIO_PLAZO;
             N_NRO_DIAS_PLAZO := I_NRO_PLAZO_APELACION;
    END CASE;

    /*C_FEC_FIN_PLAZO := TO_CHAR(SCOB_PK_UTILITARIO.SCOB_FN_DIAS_VALIDOS(
      TO_DATE(C_FEC_INICIO_PLAZO,'DD/MM/YYYY'),
      N_NRO_DIAS_PLAZO, '0'),'DD/MM/YYYY'
    );*/

    C_FEC_FIN_PLAZO := TO_CHAR(SCOB_PK_UTILITARIO.SCOB_FN_DIAS_VALIDOS_BY_OR(
      TO_DATE(C_FEC_INICIO_PLAZO,'DD/MM/YYYY'),
      N_NRO_DIAS_PLAZO, '0',
      PI_N_ID_MULTA_DETAL,
      SCOB_PK_CONSTANTES.C_NU_X_ID_MULTA_DETAL),'DD/MM/YYYY'
    );

    /*C_FEC_ESTADO_INSTANCIA := TO_CHAR(SCOB_PK_UTILITARIO.SCOB_FN_DIAS_VALIDOS(TO_DATE(C_FEC_FIN_PLAZO,'DD/MM/YYYY'),
                                                               2, '0'),'DD/MM/YYYY');*/

    C_FEC_ESTADO_INSTANCIA := TO_CHAR(SCOB_PK_UTILITARIO.SCOB_FN_DIAS_VALIDOS_BY_OR(
      TO_DATE(C_FEC_FIN_PLAZO,'DD/MM/YYYY'),
      2, '0',
      PI_N_ID_MULTA_DETAL,
      SCOB_PK_CONSTANTES.C_NU_X_ID_MULTA_DETAL),'DD/MM/YYYY'
    );

    --ACTUALIZA LAS FECHAS DEL PLAZO
    UPDATE T_SCOB_MULTA_DETAL MDET
    SET
      MDET.NRO_PLAZO = N_NRO_DIAS_PLAZO,
      MDET.FEC_INI_PLAZO = TO_DATE(C_FEC_INICIO_PLAZO,'DD/MM/YYYY'),
      MDET.FEC_FIN_PLAZO = TO_DATE(C_FEC_FIN_PLAZO,'DD/MM/YYYY'),
      MDET.FEC_ESTADO_INSTANCIA = TO_DATE(C_FEC_ESTADO_INSTANCIA,'DD/MM/YYYY')
    WHERE ID_MULTA_DETAL = PI_N_ID_MULTA_DETAL;

    UPDATE T_SCOB_MULTA MULT
    SET MULT.PORCENTAJE_DESCUENTO = N_POR_DSCTO_APELACION
    WHERE MULT.ID_MULTA = PI_N_ID_MULTA;

    --@0002--IF TO_DATE(C_FEC_INICIO_PLAZO,'DD/MM/YYYY') <= TO_DATE(TO_CHAR(SYSDATE,'DD/MM/YYYY'),'DD/MM/YYYY') THEN
       --CAMBIA AL ESTADO EN PLAZO.
       SCOB_SP_I_MULTA_ESTADO(PI_N_ID_MULTA, PI_N_ID_MULTA_DETAL, I_ESTADO_MULTA_ACTUAL, 0, C_FEC_ESTADO, PI_V_AUDUSUMODIFICACION, N_ID_USUARIO_INGRESO, 0, po_n_retorno,  PO_N_COD_ERROR,  PO_V_MSJ_ERROR);
       --@0001:INI
        if po_n_retorno < 0 then
           rollback;
           return;
        end if;
        --@0001:FIN
    --END IF;
    /*----------------------------------------------------------------------------------*/
    --CAMBIA AL ESTADO FUERA DE PLAZO
    /*----------------------------------------------------------------------------------*/
    C_FEC_ESTADO := TO_CHAR(SYSDATE,'DD/MM/YYYY');
    IF TO_DATE(C_FEC_ESTADO_INSTANCIA,'DD/MM/YYYY') <=
       TO_DATE(TO_CHAR(SYSDATE,'DD/MM/YYYY'),'DD/MM/YYYY') THEN
      CASE I_FLG_GRABA_PLAZO
           WHEN 11 THEN
               I_ESTADO_MULTA_ACTUAL := SCOB_PK_CONSTANTES.C_EST_MULT_FUERA_PLAZO_APE;
               C_FEC_ESTADO := C_FEC_ESTADO_INSTANCIA;
           WHEN 12 THEN
               I_ESTADO_MULTA_ACTUAL := SCOB_PK_CONSTANTES.C_EST_MULT_FUERA_PLAZO_REV;
               C_FEC_ESTADO := C_FEC_ESTADO_INSTANCIA;
           WHEN 21 THEN
               I_ESTADO_MULTA_ACTUAL := SCOB_PK_CONSTANTES.C_EST_MULT_FUERA_PLAZO_APE;
               C_FEC_ESTADO := C_FEC_ESTADO_INSTANCIA;
      END CASE;

      SCOB_SP_I_MULTA_ESTADO(PI_N_ID_MULTA, PI_N_ID_MULTA_DETAL, I_ESTADO_MULTA_ACTUAL, 0, C_FEC_ESTADO, PI_V_AUDUSUMODIFICACION, N_ID_USUARIO_INGRESO, 0, po_n_retorno,  PO_N_COD_ERROR,  PO_V_MSJ_ERROR);
      --@0001:INI
      if po_n_retorno < 0 then
         rollback;
         return;
      end if;
      --@0001:FIN
    END IF;

  END IF;
  --LLAMADA AL SP CALCULAR DESCUENTO.
  SCOB_PK_JOB.SCOB_PK_ACT_DSCT_MULTA_AFEC(PI_N_ID_MULTA);
  
    --INICIO VICTOR BENDEZU - MIGRACION SICOB A SIA
    USR_SIA_INTFZ.PKG_INTFZ_REG_MULTA_SICOB_SIA.SP_U_MULTA_SICOB_A_SIA(PIN_NU_ID_MULTA => PI_N_ID_MULTA,
                                                                   POUT_NU_COD_RESULT => PO_N_RETORNO,
                                                                   POUT_VC_MSG_RESULT => PO_V_MSJ_ERROR);
    IF PO_N_RETORNO < 0 THEN
       ROLLBACK;
       RETURN;
    END IF;
    USR_SICOB.PKG_RECAUDACION_BANCOS.SP_DO_GRABAR_BN(PIN_NU_ID_MULTA => PI_N_ID_MULTA,
                                     POUT_NU_COD_RESULT => PO_N_RETORNO,
                                     POUT_VC_MSG_RESULT => PO_V_MSJ_ERROR);
    IF PO_N_RETORNO < 0 THEN
       ROLLBACK;
       RETURN;
    END IF;
    USR_SICOB.PKG_RECAUDACION_BANCOS.SP_DO_GRABAR_ASBANC(PIN_NU_ID_MULTA => PI_N_ID_MULTA,
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
  --rollback;
  ----
  exception
  when others then
      po_n_cod_error := sqlcode;
      select case when po_n_cod_error > 0 then po_n_cod_error * -1 else po_n_cod_error end
      into po_n_cod_error
      from dual;
      po_v_msj_error := substr(sqlerrm,1,250) || ' - ' || to_char(po_n_retorno);
      rollback;
end;

/*****************************************************************
* Nombre            :  USR_SICOB.SCOB_SP_I_MULTA_BY_OR
* Propósito         :  Registrar la multa por organo resolutivo, Registrar el siguiente nivel de una multa
* Creado por        :  RMCA
* Fec Creación      :  15-02-2011 RMCA Cambio para identificar el valor NULL en el campo ESTADO_MULTA
* Fec Actualización :  12-07-2019 @jalegria Bloquear el registro de multa a usuarios de Protección al consumidor
*                      2023-02-12 Procesos en linea
'****************************************************************/
procedure SCOB_SP_I_MULTA_BY_OR
(
  PI_N_ID_MULTA                  IN T_SCOB_MULTA.ID_MULTA%TYPE,
  PI_N_ID_MULTA_DETAL_ACTUAL     IN T_SCOB_MULTA_DETAL.ID_MULTA_DETAL%TYPE,
  --
  PI_N_ID_CLASIFICACION          IN T_SCOB_MULTA.ID_CLASIFICACION%TYPE,
  --
  PI_N_ID_MATERIA                IN T_SCOB_MULTA.ID_MATERIA%TYPE,
  PI_N_ID_SUBMATERIA             IN T_SCOB_MULTA.ID_SUB_MATERIA%TYPE,
  PI_C_FLG_MULTA_RESOLUTIVO      IN T_SCOB_MULTA.FLG_MULTA_RESOLUTIVO%TYPE,
  PI_N_TIPO_INSTANCIA_INICIA     IN T_SCOB_ORGANO_RESOLUTIVO.TIPO_INSTANCIA%TYPE,
  PI_N_TIPO_INSTANCIA_ACTUAL     IN T_SCOB_ORGANO_RESOLUTIVO.TIPO_INSTANCIA%TYPE,
  --
  PI_N_ID_ORGANO_RESOLUTIVO      IN T_SCOB_MULTA_DETAL.ID_ORGANO_RESOLUTIVO%TYPE,
  PI_N_ID_USUARIO_SECRETARIO     IN T_SCOB_MULTA_DETAL.ID_USUARIO_SECRETARIO%TYPE,
  --
  PI_C_FECHA_RESOL               IN CHAR,
  PI_I_ESTADO_MULTA              IN T_SCOB_MULTA.ESTADO_MULTA%TYPE,
  PI_C_FLG_TIPO_MULTA            IN T_SCOB_MULTA.FLG_TIPO_MULTA%TYPE,
  PI_N_SEDE                      IN T_SCOB_SEDE.ID_SEDE%TYPE,
  PI_V_AUDUSUCREACION            IN T_SCOB_MULTA.AUDUSUCREACION%TYPE,
  PI_N_ID_USUARIO_INGRESO        IN T_SCOB_MULTA.ID_USUARIO_INGRESO%TYPE,
  --nuevos
  PI_V_EXP_ANTIG_NRO             IN VARCHAR2,
  PI_C_EXP_ANTIG_ANIO            IN CHAR,
  PI_N_EXP_ANTIG_ID_SIGLA        IN NUMBER,
  PI_N_EXP_ANTIG_ID_TIPO_EXPED   IN NUMBER,
  PI_V_EXP_ANTIG_COD_SIGLA       IN VARCHAR2,
  PI_V_EXP_ANTIG_COD_TIPO_EXPED  IN VARCHAR2,
  PI_V_EXP_ANTIG_DES_SIGLA       IN VARCHAR2,
  PI_V_EXP_ANTIG_DES_TIPO_EXPED  IN VARCHAR2,

  PI_V_EXP_NUEVO_NRO             IN VARCHAR2,
  PI_C_EXP_NUEVO_ANIO            IN CHAR,
  PI_V_EXP_NUEVO_COD_ORG_RESOL   IN VARCHAR,
  PI_V_EXP_NUEVO_COD_MATERIA     IN VARCHAR,

  PI_V_RESOL_NRO                 IN VARCHAR2,
  PI_C_RESOL_ANIO                IN CHAR,
  PI_N_RESOL_ID_SIGLA            IN NUMBER,
  PI_V_RESOL_COD_SIGLA           IN VARCHAR2,
  PI_V_RESOL_DES_SIGLA           IN VARCHAR2,
  --
  po_n_retorno                   out number,
  po_n_retorno_det               out number,
  po_n_cod_error                 out number,
  po_v_msj_error                 out varchar2
)
is
  N_CUM                          NUMBER;
  N_ID_MULTA                     T_SCOB_MULTA.ID_MULTA%TYPE;
  N_ID_MULTA_NIVEL               T_SCOB_MULTA_DETAL.ID_MULTA_DETAL%TYPE;
  N_ID_MULTA_ESTADO              T_SCOB_MULTA_ESTADO.ID_MULTA_ESTADO%TYPE;
  I_EXISTE                       INTEGER;

  V_ID_NRO_EXPED_ADMIN_ID        T_SCOB_MULTA.NRO_EXPED_UNICO_ID%TYPE;
  V_ID_NRO_EXPED_NIVEL_ID        T_SCOB_MULTA_DETAL.NRO_EXPED_ANTIGUO_ID%TYPE;
  V_ID_NRO_RESOLUCION_ID         T_SCOB_MULTA_DETAL.NRO_RESOLUCION_ID%TYPE;
  --
  V_NRO_RESOL                    T_SCOB_MULTA_DETAL.NRO_RESOLUCION%TYPE;
  V_NRO_EXP_NIVEL                T_SCOB_MULTA_DETAL.NRO_EXP_NIVEL%TYPE;
  V_NRO_EXP_ADMIN                T_SCOB_MULTA.NRO_EXP_ADMINISTRATIVO%TYPE;


begin
  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_retorno_det := 0;
  po_n_cod_error := -1;
  
  
--INICIO 12/07/2017 verifica si es un organo resolutivo de protección al consumidor el que intenta registrar una nueva multa, esto lo debe hacer en el SIRPC
  SELECT COUNT(DISTINCT OR_EX.NU_ID_OR_EXCEPCION) INTO I_EXISTE
  FROM T_SCOB_OR_EXCEPCION OR_EX
  WHERE OR_EX.NU_ID_ORGANO_RESOLUTIVO = PI_N_ID_ORGANO_RESOLUTIVO
  AND OR_EX.NU_ID_MATERIA = PI_N_ID_MATERIA
  AND OR_EX.NU_STATUS = 1;
  
        IF (NVL(PI_N_ID_MULTA,0)=0 AND PI_N_ID_MATERIA=479) OR (NVL(PI_N_ID_MULTA,0)=0 and (I_EXISTE > 0)) THEN
            po_n_retorno := -9;
            po_n_cod_error := po_n_retorno;
            po_v_msj_error := 'Para ingresar multas debe hacerlo por el SIRPC';
            return;
        END IF;
   I_EXISTE := 0;
   --FIN 12/07/2017

  --verifica la fecha resolucion
  --scob_pk_utilitario.scob_sp_s_valida_fecha(PI_C_FECHA_RESOL,'U',I_EXISTE);
  scob_pk_utilitario.scob_sp_s_valida_fecha_by_or(PI_C_FECHA_RESOL,'U',PI_N_ID_ORGANO_RESOLUTIVO,SCOB_PK_CONSTANTES.C_NU_X_OR,I_EXISTE);
  IF I_EXISTE=0 THEN
    po_n_retorno := -9;
    po_n_cod_error := po_n_retorno;
    po_v_msj_error := 'La fecha de resolucion no es valida, debe seleccionar una fecha habil.';
    return;
  END IF;
  I_EXISTE := 0;

  --verifica la instancia que inicia el registro de la multa
  SELECT COUNT(DISTINCT EINS.TIPO_INSTANCIA_INICIA) INTO I_EXISTE
  FROM T_SCOB_ESTADO_INSTANCIA EINS
  WHERE EINS.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
  AND EINS.TIPO_INSTANCIA_INICIA = PI_N_TIPO_INSTANCIA_INICIA;
  IF I_EXISTE = 0 THEN --no existen estados registrado para esta instancia
  BEGIN
    po_n_retorno := -10;
    po_n_cod_error := po_n_retorno;
    po_v_msj_error := 'No se puede realizar la accion. La multa no puede ser registrada en esta instancia.';
    return;
  END;
  END IF;

  --COMPOSICION DEL NRO_EXPEDIENTE_ADMINISTRATIVO, NRO_EXPEDIENTE_UNICO, NRO_RESOLUTIVO.
  V_ID_NRO_EXPED_NIVEL_ID := PI_V_EXP_ANTIG_NRO ||''|| PI_C_EXP_ANTIG_ANIO ||''|| TO_CHAR(PI_N_EXP_ANTIG_ID_SIGLA) ||''|| TO_CHAR(PI_N_EXP_ANTIG_ID_TIPO_EXPED);
  V_ID_NRO_EXPED_ADMIN_ID := PI_V_EXP_NUEVO_NRO ||''|| PI_C_EXP_NUEVO_ANIO ||''||  PI_V_EXP_NUEVO_COD_ORG_RESOL ||''|| PI_V_EXP_NUEVO_COD_MATERIA;
  V_ID_NRO_RESOLUCION_ID := PI_V_RESOL_NRO ||''|| PI_C_RESOL_ANIO ||''|| PI_V_EXP_NUEVO_COD_ORG_RESOL;

  V_NRO_RESOL := PI_V_RESOL_NRO ||'-'|| PI_C_RESOL_ANIO ||'/'|| PI_V_RESOL_DES_SIGLA;
  V_NRO_EXP_NIVEL := PI_V_EXP_ANTIG_NRO ||'-'|| PI_C_EXP_ANTIG_ANIO ||'/'|| PI_V_EXP_ANTIG_DES_SIGLA ||'-'|| PI_V_EXP_ANTIG_DES_TIPO_EXPED;
  V_NRO_EXP_ADMIN := PI_V_EXP_NUEVO_NRO || PI_C_EXP_NUEVO_ANIO || PI_V_EXP_NUEVO_COD_ORG_RESOL || PI_V_EXP_NUEVO_COD_MATERIA;

  IF NVL(PI_N_ID_MULTA,0)=0 THEN --ES UN NUEVO REGISTRO
  BEGIN
      --genera el codigo secuencial de la multa
      SELECT SCOB_SQ_MULTA.NEXTVAL INTO N_ID_MULTA FROM dual;

      SELECT SCOB_SQ_CUM.NEXTVAL INTO N_CUM FROM dual;

      --insertar multa
      INSERT INTO T_SCOB_MULTA(
        ID_MULTA,
        CUM,
        ANIO,
        ID_MATERIA,
        ID_SUB_MATERIA,
        FLG_MULTA_RESOLUTIVO,
        FLG_MULTA_COBRANZA,
        TIPO_INSTANCIA_INICIA,
        ESTADO,
        AUDFECCREACION,
        AUDUSUCREACION,
        --
        NRO_EXP_ADMINISTRATIVO,
        NRO_EXPED_UNICO,
        ANIO_EXPED_UNICO,
        NRO_EXPED_UNICO_ID,
        --
        FLG_TIPO_MULTA,
        ID_SEDE,
        FEC_INGRESO,
        ID_USUARIO_INGRESO,
        --IND_TIPO_PAGO,
        COD_ESTADO_PAGO,
        COD_TIPO_MONEDA,
        IND_DESCUENTO,
        --
        MONTO_UIT,
        MONTO_INTERES,
        MONTO_INTERES_MORATORIO,
        MONTO_COSTAS,
        MONTO_TOTAL_DEUDA,

        TOTAL_AMORTIZADO,
        TOTAL_AMORTIZADO_IC,
        TOTAL_AMORTIZADO_IM,
        TOTAL_AMORTIZADO_COSTAS,
        TOTAL_AMORTIZACION_DEUDA,

        SALDO,
        SALDO_COSTAS,
        SALDO_IC,
        SALDO_IM,
        SALDO_TOTAL_DEUDA,
        MONTO_PORCENTAJE_DSCTO,
        --
        ID_CLASIFICACION,
        ESTADO_ENVIO_ARCHIVO,
        FEC_APELACION,
        FEC_EN_REVISION,
        --@0001:INI
        ESTADO_MULTA
        --@0001:FIN
        )
      VALUES(
        N_ID_MULTA,
        LPAD(TO_CHAR(N_CUM),10,'0000000000'),
        TO_CHAR(SYSDATE,'YYYY'),
        PI_N_ID_MATERIA,
        PI_N_ID_SUBMATERIA,
        PI_C_FLG_MULTA_RESOLUTIVO,
        '0', --FLG_MULTA_COBRANZA,
        PI_N_TIPO_INSTANCIA_INICIA,
        SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO,
        SYSDATE,
        PI_V_AUDUSUCREACION,
        --
        V_NRO_EXP_ADMIN,
        PI_V_EXP_NUEVO_NRO,
        PI_C_EXP_NUEVO_ANIO,
        V_ID_NRO_EXPED_ADMIN_ID,
        --
        PI_C_FLG_TIPO_MULTA,
        PI_N_SEDE,
        SYSDATE,
        PI_N_ID_USUARIO_INGRESO,
        SCOB_PK_CONSTANTES.C_EST_PAGO_PENDIENTE,
        SCOB_PK_CONSTANTES.C_COD_TIPO_MONEDA_SOLES,
        '0', --IND_DESCUENTO,
        --
        0.00, --MONTO_UIT,
        0.00, --MONTO_INTERES,
        0.00, --MONTO_INTERES_MORATORIO,
        0.00, --MONTO_COSTAS,
        0.00, --MONTO_TOTAL_DEUDA,

        0.00, --TOTAL_AMORTI ZADO,
        0.00, --TOTAL_AMORTIZADO_IC,
        0.00, --TOTAL_AMORTIZADO_IM,
        0.00, --TOTAL_AMORTIZADO_COSTAS,
        0.00, --TOTAL_AMORTIZACION_DEUDA,

        0.00, --SALDO,
        0.00, --SALDO_COSTAS,
        0.00, --SALDO_IC,
        0.00, --SALDO_IM,
        0.00, --SALDO_TOTAL_DEUDA,
        0.00, --MONTO_PORCENTAJE_DSCTO,
        DECODE(PI_N_ID_CLASIFICACION,0,NULL,PI_N_ID_CLASIFICACION),
        SCOB_PK_CONSTANTES.C_EST_ARCH_CENTRAL_NO_ENVIADO, --ESTADO_ENVIO_ARCHIVO
        NULL,
        NULL,
        --@0001:INI
        -9
        --@0001:FIN
      );
  END;
  ELSE
  BEGIN
      N_ID_MULTA := PI_N_ID_MULTA;

      --verifica si ya existe un nivel registrado para la actual instancia.
      SELECT COUNT(MULT.ID_MULTA) INTO I_EXISTE
      FROM T_SCOB_MULTA MULT
      INNER JOIN T_SCOB_MULTA_DETAL MDET
            ON MDET.ID_MULTA_DETAL = PI_N_ID_MULTA_DETAL_ACTUAL
            AND MDET.ID_MULTA = MULT.ID_MULTA
      INNER JOIN T_SCOB_ORGANO_RESOLUTIVO ORGR
            ON ORGR.ID_ORGANO_RESOLUTIVO = MDET.ID_ORGANO_RESOLUTIVO
      WHERE MULT.ID_MULTA = N_ID_MULTA
      AND ORGR.TIPO_INSTANCIA = PI_N_TIPO_INSTANCIA_ACTUAL;
      IF I_EXISTE > 0 THEN
        po_n_cod_error := -13;
        po_v_msj_error := 'No se puede realizar la accion. La multa antes ha sido registrada en esta instancia.';
        return;
      END IF;

  END;
  END IF;

  --insertar el nivel de la multa
  SCOB_SP_I_MULTA_NIVEL_BY_OR(
      N_ID_MULTA,
      PI_N_ID_ORGANO_RESOLUTIVO,
      PI_N_ID_USUARIO_SECRETARIO,
      --
      PI_N_EXP_ANTIG_ID_SIGLA,
      PI_V_EXP_ANTIG_COD_SIGLA,
      PI_V_EXP_ANTIG_DES_SIGLA,
      PI_V_EXP_ANTIG_NRO,
      PI_C_EXP_ANTIG_ANIO,
      PI_N_EXP_ANTIG_ID_TIPO_EXPED,
      PI_V_EXP_ANTIG_COD_TIPO_EXPED,
      PI_V_EXP_ANTIG_DES_TIPO_EXPED,
      V_ID_NRO_EXPED_NIVEL_ID,
      PI_V_RESOL_NRO,
      PI_C_RESOL_ANIO,
      PI_N_RESOL_ID_SIGLA,
      PI_V_RESOL_COD_SIGLA,
      PI_V_RESOL_DES_SIGLA,
      V_ID_NRO_RESOLUCION_ID,
      V_NRO_RESOL,
      PI_C_FECHA_RESOL,
      V_NRO_EXP_NIVEL,
      --
      PI_V_AUDUSUCREACION,
      PI_N_ID_USUARIO_INGRESO,

      N_ID_MULTA_NIVEL,
      PO_N_COD_ERROR,
      PO_V_MSJ_ERROR
  );

  IF po_n_cod_error < 0 THEN
    ROLLBACK;
    RETURN;
  END IF;

  --insertar logs de estados
  --se toma como fecha del estado la fecha de resolucion 27.09.2011
  SCOB_SP_I_MULTA_ESTADO(N_ID_MULTA, N_ID_MULTA_NIVEL, PI_I_ESTADO_MULTA, 0, PI_C_FECHA_RESOL,PI_V_AUDUSUCREACION, PI_N_ID_USUARIO_INGRESO, 0, N_ID_MULTA_ESTADO, PO_N_COD_ERROR,  PO_V_MSJ_ERROR);
  --@0001:INI
  if PO_N_COD_ERROR < 0 then
     rollback;
     return;
  end if;
  --@0001:FIN

  IF po_n_cod_error < 0 THEN
    ROLLBACK;
    RETURN;
  END IF;

  IF NVL(PI_N_ID_MULTA_DETAL_ACTUAL,0)<>0 THEN --ES UN SALTO DE INSTANCIA DE LA MULTA
  BEGIN
    --realiza el salto de nivel.
    SCOB_SP_U_MULTA_DUPLICA_DATA(PI_N_ID_MULTA, PI_N_ID_MULTA_DETAL_ACTUAL, N_ID_MULTA_NIVEL, PI_I_ESTADO_MULTA, PI_V_AUDUSUCREACION, po_n_retorno,  PO_N_COD_ERROR,  PO_V_MSJ_ERROR);

    IF po_n_retorno = -10 THEN
    BEGIN
        ROLLBACK;
        RETURN;
    END;
    END IF;
  END;
  END IF;
  
    --INICIO VICTOR BENDEZU - MIGRACION SICOB A SIA - RECAUDACION EN LINEA
    IF NVL(PI_N_ID_MULTA,0) <> 0 THEN
       USR_SIA_INTFZ.PKG_INTFZ_REG_MULTA_SICOB_SIA.SP_U_MULTA_SICOB_A_SIA(PIN_NU_ID_MULTA => N_ID_MULTA,
                                                                         POUT_NU_COD_RESULT => PO_N_RETORNO,
                                                                         POUT_VC_MSG_RESULT => PO_V_MSJ_ERROR);
    ELSE 
       USR_SIA_INTFZ.PKG_INTFZ_REG_MULTA_SICOB_SIA.SP_I_MULTA_SICOB_A_SIA(PIN_NU_ID_MULTA => N_ID_MULTA,
                                                                         POUT_NU_COD_RESULT => PO_N_RETORNO,
                                                                         POUT_VC_MSG_RESULT => PO_V_MSJ_ERROR);
    END IF;
    IF PO_N_RETORNO < 0 THEN
         ROLLBACK;
         RETURN;
    END IF;
    
    PKG_RECAUDACION_BANCOS.SP_DO_GRABAR_BN(PIN_NU_ID_MULTA => N_ID_MULTA,
                                                     POUT_NU_COD_RESULT => PO_N_RETORNO,
                                                     POUT_VC_MSG_RESULT => PO_V_MSJ_ERROR);
    IF PO_N_RETORNO < 0 THEN
         ROLLBACK;
         RETURN;
    END IF;
                                                                         
    PKG_RECAUDACION_BANCOS.SP_DO_GRABAR_ASBANC(PIN_NU_ID_MULTA => N_ID_MULTA,
                                                         POUT_NU_COD_RESULT => PO_N_RETORNO,
                                                         POUT_VC_MSG_RESULT => PO_V_MSJ_ERROR);                                                                     
        
    IF PO_N_RETORNO < 0 THEN
         ROLLBACK;
         RETURN;
    END IF;
    --FIN VICTOR BENDEZU - MIGRACION SICOB A SIA - RECAUDACION EN LINEA

  po_n_cod_error := 0;
  po_n_retorno := n_id_multa;
  po_n_retorno_det := N_ID_MULTA_NIVEL;
  commit;
  ----
  /************************** llamamos al neuvo sp del sia S_REGISTRAR_MULTA_SIA ***************/
  
  
  
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

procedure SCOB_SP_D_MULTA_BY_OR
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 17.02.2011
-- Proposito    : Elimina una multa de organo resolutivo y todos su registros dependientes.
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_V_ID_MULTA               IN VARCHAR2,
  PI_V_AUDUSUCREACION         IN T_SCOB_MULTA.AUDUSUMODIFICACION%TYPE,

  po_n_retorno                out number,
  po_n_cod_error              out number,
  po_v_msj_error              out varchar2
)
is
  I_EXISTE_VALIDOS            INTEGER;
  I_EXISTE_NO_VALIDOS         INTEGER;

begin
  po_n_retorno := 0;

  --verifica si todos los registros cumplen con lo solicitado.
  --solo se puede eliminar si el estado es IMPUESTA.
  SELECT SUM(VALIDA_MULTA.EST_IMPUESTA), SUM(VALIDA_MULTA.EST_DISTINTO)
  INTO I_EXISTE_VALIDOS, I_EXISTE_NO_VALIDOS
  FROM (
      SELECT
          CASE
            WHEN ESTADO_MULTA.ID_ESTADO_MULTA = SCOB_PK_CONSTANTES.C_EST_MULT_IMPUESTA THEN 1
            ELSE 0
          END AS EST_IMPUESTA,
          CASE
            WHEN ESTADO_MULTA.ID_ESTADO_MULTA <> SCOB_PK_CONSTANTES.C_EST_MULT_IMPUESTA THEN 1
            ELSE 0
          END AS EST_DISTINTO
      FROM (
        SELECT MULT.ESTADO_MULTA AS ID_ESTADO_MULTA
        FROM T_SCOB_MULTA MULT
        WHERE INSTR(PI_V_ID_MULTA,'|' || TO_CHAR(ID_MULTA) || '|' )>0
      ) ESTADO_MULTA
  ) VALIDA_MULTA;


  CASE
       WHEN I_EXISTE_VALIDOS = 0 THEN
             po_n_cod_error := -10;
             po_v_msj_error :='No se puede realizar la accion. Las multas deben tener el estado IMPUESTA.';
             return;
       WHEN I_EXISTE_VALIDOS > 0 AND I_EXISTE_NO_VALIDOS > 0 THEN
             po_n_cod_error := -11;
             po_v_msj_error :='Algunas multas no han sido eliminadas. Solo se puede eliminar las multas con estado IMPUESTA.';
       ELSE
             NULL;
  END CASE;

  --ELIMINACION DE MULTAS
  --actualiza a eliminado el registro de la multa
  UPDATE T_SCOB_MULTA
  SET
    AUDUSUMODIFICACION = PI_V_AUDUSUCREACION,
    AUDFECMODIFICACION = SYSDATE,
    ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_INACTIVO
  WHERE INSTR(PI_V_ID_MULTA,'|' || TO_CHAR(ID_MULTA) || '|' )>0;

  --elimina sus registros relacionados.
  --elimina t_scob_sancionado_direc
  UPDATE T_SCOB_MULTA_SANCIONADO_DIREC
  SET
    AUDUSUMODIFICACION = PI_V_AUDUSUCREACION,
    AUDFECMODIFICACION = SYSDATE,
    ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_INACTIVO
  WHERE ID_MULTA_SANCIONADO IN (
      SELECT ID_MULTA_SANCIONADO
      FROM T_SCOB_MULTA_SANCIONADO
      WHERE ID_MULTA_DETAL IN (
          SELECT ID_MULTA_DETAL
          FROM T_SCOB_MULTA_DETAL
          WHERE INSTR(PI_V_ID_MULTA,'|' || TO_CHAR(ID_MULTA) || '|' )>0
      )
      AND ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
  AND ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO);

  --elimina t_scob_sancionado
  UPDATE T_SCOB_MULTA_SANCIONADO
  SET
    AUDUSUMODIFICACION = PI_V_AUDUSUCREACION,
    AUDFECMODIFICACION = SYSDATE,
    ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_INACTIVO,
    FLG_PRINCIPAL = '0'
  WHERE ID_MULTA_DETAL IN (
      SELECT ID_MULTA_DETAL
      FROM T_SCOB_MULTA_DETAL
      WHERE INSTR(PI_V_ID_MULTA,'|' || TO_CHAR(ID_MULTA) || '|' )>0
  )
  AND ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO;

  --elimina t_scob_denunciante
  UPDATE T_SCOB_MULTA_DENUNCIANTE
  SET
    AUDUSUMODIFICACION = PI_V_AUDUSUCREACION,
    AUDFECMODIFICACION = SYSDATE,
    ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_INACTIVO
  WHERE ID_MULTA_DETAL IN (
      SELECT ID_MULTA_DETAL
      FROM T_SCOB_MULTA_DETAL
      WHERE INSTR(PI_V_ID_MULTA,'|' || TO_CHAR(ID_MULTA) || '|' )>0
  )
  AND ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO;

  --elimina t_scob_multa_check
  UPDATE T_SCOB_MULTA_CHECK
  SET
    AUDUSUMODIFICACION = PI_V_AUDUSUCREACION,
    AUDFECMODIFICACION = SYSDATE,
    ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_INACTIVO
  WHERE ID_MULTA_DETAL IN (
      SELECT ID_MULTA_DETAL
      FROM T_SCOB_MULTA_DETAL
      WHERE INSTR(PI_V_ID_MULTA,'|' || TO_CHAR(ID_MULTA) || '|' )>0
  )
  AND ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO;

  --elimina t_scob_multa_documento
  UPDATE T_SCOB_MULTA_DOCUMENTO
  SET
    AUDUSUMODIFICACION = PI_V_AUDUSUCREACION,
    AUDFECMODIFICACION = SYSDATE,
    ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_INACTIVO
  WHERE INSTR(PI_V_ID_MULTA,'|' || TO_CHAR(ID_MULTA) || '|' )>0
  AND ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO;

  --elimina t_scob_multa_anotacion
  UPDATE t_scob_multa_anotacion
  SET
    AUDUSUMODIFICACION = PI_V_AUDUSUCREACION,
    AUDFECMODIFICACION = SYSDATE,
    ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_INACTIVO
  WHERE INSTR(PI_V_ID_MULTA,'|' || TO_CHAR(ID_MULTA) || '|' )>0
  AND ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO;

  --elimina t_scob_multa_estado
  UPDATE T_SCOB_MULTA_ESTADO
  SET
    AUDUSUMODIFICACION = PI_V_AUDUSUCREACION,
    AUDFECMODIFICACION = SYSDATE,
    ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_INACTIVO
  WHERE INSTR(PI_V_ID_MULTA,'|' || TO_CHAR(ID_MULTA) || '|' )>0
  AND ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO;

  --elimina t_scob_multa_detal
  UPDATE T_SCOB_MULTA_DETAL
  SET
    AUDUSUMODIFICACION = PI_V_AUDUSUCREACION,
    AUDFECMODIFICACION = SYSDATE,
    ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_INACTIVO
  WHERE INSTR(PI_V_ID_MULTA,'|' || TO_CHAR(ID_MULTA) || '|' )>0;

  po_n_retorno := 0;
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

procedure SCOB_SP_S_MULTA_BY_OR
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 16.02.2011
-- Proposito    : Consulta las multas por organismo resolutivo
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_V_CUM                 IN T_SCOB_MULTA.CUM%TYPE,
  PI_I_TIPO_PERSONA        IN T_SCOB_PERSONA.TIPO_PERSONA%TYPE,
  PI_I_TIPO_DOC            IN T_SCOB_PERSONA.TIPO_DOC%TYPE,
  PI_V_NRO_DOC             IN T_SCOB_PERSONA.NRO_DOC%TYPE,
  PI_V_APE_PATERNO         IN T_SCOB_PERSONA.APE_PATERNO%TYPE,
  PI_V_APE_MATERNO         IN T_SCOB_PERSONA.APE_MATERNO%TYPE,
  PI_V_PRI_NOMBRE          IN T_SCOB_PERSONA.PRI_NOMBRE%TYPE,
  PI_V_SEG_NOMBRE          IN T_SCOB_PERSONA.SEG_NOMBRE%TYPE,
  PI_V_RAZON_SOCIAL        IN T_SCOB_PERSONA.RAZON_SOCIAL%TYPE,
  PI_N_ID_USUARIO          IN T_SCOB_USUARIO.ID_USUARIO%TYPE,
  PI_I_ID_ESTADO           IN T_SCOB_MULTA.ESTADO_MULTA%TYPE,
  PI_N_COD_SANCIONADO      IN T_SCOB_PERSONA.COD_SANCIONADO%TYPE,
  po_cu_retorno            out cu_rec_set
)
as
begin

  open  po_cu_retorno for

  SELECT
    MULT.ID_MULTA AS ID_MULTA,
    MDET.ID_MULTA_DETAL AS ID_MULTA_DETAL, --ID_DETALLE_MULTA_ACTUAL
    ORGR.TIPO_INSTANCIA AS TIPO_INSTANCIA_ACTUAL, --NRO_TIPO_INSTANCIA_ACTUAL
    NVL(MULT.FLG_MULTA_IMPROCEDENCIA,0) AS IND_IMPROCEDENCIA, --0=NO TIENE;1=TIENE
    MULT.ANIO || MULT.CUM AS COD_MULTA,
    MDET.ID_ORGANO_RESOLUTIVO AS COD_ORG_RESOLUTIVO,
    ORGR.DESCRIPCION AS NOM_ORG_RESOLUTIVO,
    MDET.ID_USUARIO_SECRETARIO AS ID_USUARIO_SECRETARIO,
    USEC.USUARIO AS LOGIN_SECRETARIO,
    MULT.ID_MATERIA AS COD_MATERIA,
    MATE.DESCRIPCION AS NOM_MATERIA,
    MULT.ID_SUB_MATERIA AS ID_SUB_MATERIA,
    SUMA.DESCRIPCION AS NOM_SUB_MATERIA,
    MDET.NRO_RESOLUCION AS NRO_RESOLUCION,
    MDET.FEC_RESOLUCION AS FEC_RESOLUCION,
    DECODE(
       MULT.FLG_TIPO_MULTA,
       SCOB_PK_CONSTANTES.C_FLG_TIPO_MULTA_SOLID,
       ' ',
       PERS.COD_SANCIONADO
    ) AS COD_SANCIONADO,
    DECODE(
       MULT.FLG_TIPO_MULTA,
       SCOB_PK_CONSTANTES.C_FLG_TIPO_MULTA_SOLID,
       SCOB_PK_EXPEDIENTE.SCOB_FN_SANCIONADOS_MULTA(MULT.ID_MULTA,2),
       DECODE(PERS.TIPO_PERSONA,SCOB_PK_CONSTANTES.C_TIPO_PERS_JURIDICA,  PERS.RAZON_SOCIAL,  PERS.APE_PATERNO  || ' ' || PERS.APE_MATERNO  || ' ' || PERS.PRI_NOMBRE || ' ' || PERS.SEG_NOMBRE || ' ' || PERS.APE_CASADA)
    ) AS DES_SANCIONADO,

    --DATOS ANTIDUMPING
    DECODE(NVL(MUAN.NRO_LIQUIDACION_CODIGO,' '),' ', NULL,
            MUAN.NRO_LIQUIDACION_CODIGO ||'-'|| MUAN.NRO_LIQUIDACION_ANIO ||'/'|| MUAN.NRO_LIQUIDACION_CORRELATIVO) AS NRO_LIQUIDACION,

    -------------------------------------------------------------------------------
    --montos deuda antidumping
    MUAN.TIPO_CAMBIO AS TIPO_CAMBIO,
    MUAN.MONTO_ANTIDUMPING AS MONTO_ANTIDUMPING,
    MUAN.MONTO_INTERES AS MONTO_DA_INTERES_COMPENSATORIO,
    MUAN.MONTO_INTERES_MORATORIO AS MONTO_DA_INTERES_MORATORIO,
    MUAN.MONTO_TOTAL AS MONTO_TOTAL_DEUDA_DA,
    --montos deuda uit
    MDET.VALOR_UIT AS UIT,
    MULT.MONTO_UIT AS MONTO_UIT,
    --montos amortizado
    CASE
       WHEN MULT.COD_ESTADO_PAGO = SCOB_PK_CONSTANTES.C_EST_PAGO_DSCTO THEN
           0.00
       ELSE MULT.TOTAL_AMORTIZADO
       END
    AS AMORTIZADO_UIT,
    CASE
       WHEN MULT.COD_ESTADO_PAGO = SCOB_PK_CONSTANTES.C_EST_PAGO_DSCTO THEN
           DECODE(MULT.IND_DESCUENTO, '1', MULT.MONTO_PORCENTAJE_DSCTO, 0.00)
       ELSE 0.00
       END
    AS MONTO_AMORTIZADO_DSCTO,
    --montos saldo
    MULT.SALDO AS SALDO_UIT,
    -------------------------------------------------------------------------------

    MULT.ESTADO_MULTA AS COD_ESTADO,
    SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_ESTADO_MULTA, MULT.ESTADO_MULTA) AS DES_ESTADO,

    LTRIM(RTRIM(MULT.FLG_TIPO_MULTA)) AS IND_RESPONSABILIDAD,
    MRES.TXT_DESCRIPCION AS DES_RESPONSABILIDAD,
    MDET.FEC_NOTIFICACION_RESOLUCION AS FEC_NOTIF,
    NVL(MULT.FLG_TIPO_MULTA,'0') AS FLG_TIPO_MULTA,
    --DECODE(NVL(DIREC.FLG_DIR,0),0,'0','1') AS FLG_DOMICILIO,
    MULT.FLG_MULTA_RESOLUTIVO AS IND_TIPO_MULTA, --1=MULTA OR;0=ANTIDUMPING
    MULT.NRO_EXP_ADMINISTRATIVO AS NRO_EXP_ADMINISTRATIVO,
    MDET.NRO_EXP_NIVEL AS NRO_EXP_NIVEL,
    MULT.TIPO_INSTANCIA_INICIA AS TIPO_INSTANCIA_INICIA,
    MULT.ID_CLASIFICACION AS ID_CLASIFICACION,
    CLIN.DESCRIPCION AS NOM_CLASIFICACION,
    MDET.FEC_ESTADO_SGTE_INSTANCIA FEC_INSTANCIA_ACTUAL,
    MULTA_SANC.NRO_SANCIONADOS AS NRO_SANCIONADOS
  FROM T_SCOB_MULTA MULT

  --SANCIONADO
  LEFT JOIN (
    SELECT MDET.ID_MULTA AS ID_MULTA, COUNT(SANC.ID_MULTA_SANCIONADO) AS NRO_SANCIONADOS
    FROM T_SCOB_MULTA_DETAL MDET
    LEFT JOIN T_SCOB_MULTA_SANCIONADO SANC
         ON SANC.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL
         AND SANC.ESTADO = '1'
         AND NVL(SANC.COD_TIPO_PERSONA,'1')='1'
    LEFT JOIN T_SCOB_PERSONA PERS
         ON PERS.ID_PERSONA = SANC.ID_PERSONA
    WHERE MDET.FLG_ACTUAL = '1'
    AND MDET.ESTADO = '1'
    AND (NVL(PI_I_TIPO_PERSONA,0)=0 OR (PI_I_TIPO_PERSONA<>0  AND PERS.TIPO_PERSONA = PI_I_TIPO_PERSONA))
    AND (NVL(PI_I_TIPO_DOC,0)=0 OR (PI_I_TIPO_DOC<>0 AND PERS.TIPO_DOC = PI_I_TIPO_DOC))
    AND (NVL(PI_V_NRO_DOC,' ')=' ' OR (PI_V_NRO_DOC <> ' ' AND PERS.NRO_DOC = PI_V_NRO_DOC))
    AND (NVL(PI_V_APE_PATERNO,' ')=' ' OR (fun_scob_nosensite(TRIM(PI_V_APE_PATERNO))<>' ' AND fun_scob_nosensite(TRIM(PERS.APE_PATERNO)) LIKE '%' || fun_scob_nosensite(TRIM(PI_V_APE_PATERNO)) || '%' ))
    AND (NVL(PI_V_APE_MATERNO,' ')=' ' OR (fun_scob_nosensite(TRIM(PI_V_APE_MATERNO))<>' ' AND fun_scob_nosensite(TRIM(PERS.APE_MATERNO)) LIKE '%' || fun_scob_nosensite(TRIM(PI_V_APE_MATERNO)) || '%' ))
    AND (NVL(PI_V_PRI_NOMBRE,' ')=' ' OR (fun_scob_nosensite(TRIM(PI_V_PRI_NOMBRE))<>' ' AND fun_scob_nosensite(TRIM(PERS.PRI_NOMBRE)) LIKE '%' || fun_scob_nosensite(TRIM(PI_V_PRI_NOMBRE)) || '%' ))
    AND (NVL(PI_V_SEG_NOMBRE,' ')=' ' OR (fun_scob_nosensite(TRIM(PI_V_SEG_NOMBRE))<>' ' AND fun_scob_nosensite(TRIM(PERS.SEG_NOMBRE)) LIKE '%' || fun_scob_nosensite(TRIM(PI_V_SEG_NOMBRE)) || '%' ))
    AND (NVL(PI_V_RAZON_SOCIAL,' ')=' ' OR (fun_scob_nosensite(TRIM(PI_V_RAZON_SOCIAL))<>' ' AND fun_scob_nosensite(TRIM(PERS.RAZON_SOCIAL)) LIKE '%' || fun_scob_nosensite(TRIM(PI_V_RAZON_SOCIAL)) || '%' ))
    AND (NVL(PI_N_COD_SANCIONADO,' ')=' ' OR (PI_N_COD_SANCIONADO<>' ' AND PERS.COD_SANCIONADO = PI_N_COD_SANCIONADO))
    GROUP BY MDET.ID_MULTA
  )
  MULTA_SANC ON MULTA_SANC.ID_MULTA = MULT.ID_MULTA

  INNER JOIN T_SCOB_MULTA_DETAL MDET
        ON MDET.ID_MULTA = MULTA_SANC.ID_MULTA
        AND MDET.FLG_ACTUAL = '1'
        AND MDET.ESTADO = '1'

  LEFT JOIN T_SCOB_MULTA_SANCIONADO SANC
        ON SANC.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL
        AND NVL(SANC.COD_TIPO_PERSONA,'1')='1'
        AND SANC.FLG_PRINCIPAL = '1'
        AND SANC.ESTADO = '1'

  LEFT JOIN T_SCOB_PERSONA PERS
        ON PERS.ID_PERSONA = SANC.ID_PERSONA

  LEFT JOIN T_SCOB_MULTA_ANTIDUMPING MUAN
       ON MUAN.ID_MULTA = MULT.ID_MULTA
       AND MUAN.ESTADO = '1'

  INNER JOIN T_SCOB_ORGANO_RESOLUTIVO ORGR
        ON ORGR.ID_ORGANO_RESOLUTIVO = MDET.ID_ORGANO_RESOLUTIVO

  INNER JOIN T_SCOB_MATERIA MATE ON MATE.ID_MATERIA = MULT.ID_MATERIA
  INNER JOIN T_SCOB_SUBMATERIA SUMA ON SUMA.ID_SUBMATERIA = MULT.ID_SUB_MATERIA
  INNER JOIN T_SCOB_USUARIO USEC
        ON USEC.ID_USUARIO = MDET.ID_USUARIO_SECRETARIO

  LEFT JOIN T_SCOB_CLASIFICACION_INDECOPI CLIN
       ON CLIN.ID_CLASIFICACION = MULT.ID_CLASIFICACION

  INNER JOIN T_SCOB_TABLA_DET MRES
       ON MRES.ID_TABLA = SCOB_PK_CONSTANTES.C_TBL_TIPO_RESP_MULTA_OR
       AND LTRIM(RTRIM(MRES.COD_INTERNO)) = LTRIM(RTRIM(MULT.FLG_TIPO_MULTA))
  WHERE
    MULT.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
    AND (NVL(PI_I_ID_ESTADO,0)=0 OR (PI_I_ID_ESTADO<>0 AND MULT.ESTADO_MULTA = PI_I_ID_ESTADO))
    AND (NVL(PI_V_CUM,' ')=' ' OR (NVL(PI_V_CUM,' ')<>' ' AND MULT.ANIO || TRIM(MULT.CUM) LIKE '%' || TRIM(PI_V_CUM) || '%'))
    ;
end;

procedure SCOB_SP_S_MULTA_NIVEL_BY_OR
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 16.02.2011
-- Proposito    : Consulta las multas por organismo resolutivo por nivel
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA            IN T_SCOB_MULTA.ID_MULTA%TYPE,
  PI_N_TIPO_INSTANCIA      IN T_SCOB_ORGANO_RESOLUTIVO.TIPO_INSTANCIA%TYPE,
  PI_N_ID_USUARIO          IN T_SCOB_USUARIO.ID_USUARIO%TYPE,

  po_cu_retorno            out cu_rec_set
)
as
  N_ID_ORGANO_RESOLUTIVO   T_SCOB_ORGANO_RESOLUTIVO.ID_ORGANO_RESOLUTIVO%TYPE;
  N_OR_MULTA               T_SCOB_ORGANO_RESOLUTIVO.ID_ORGANO_RESOLUTIVO%TYPE;
  C_FLG_MODIFICA_MULTA     CHAR(1);
  I_EXISTE                 INTEGER;
begin
  C_FLG_MODIFICA_MULTA := '0';

  BEGIN
      --obtener el OR de la instancia actual
      SELECT MDET.ID_ORGANO_RESOLUTIVO
      INTO N_OR_MULTA
      FROM T_SCOB_MULTA MULT
      INNER JOIN T_SCOB_MULTA_DETAL MDET
            ON MDET.ID_MULTA = MULT.ID_MULTA
            AND MDET.ESTADO = '1'
            AND MDET.FLG_ACTUAL = '1'
      WHERE MULT.ID_MULTA = PI_N_ID_MULTA;

      --verificar si el usuario tiene asignado el OR
      SELECT COUNT(USOR.ID_USUARIO)
      INTO I_EXISTE
      FROM T_SCOB_USUARIO_OR USOR
      WHERE USOR.ID_USUARIO = PI_N_ID_USUARIO
      AND USOR.ID_ORGANO_RESOLUTIVO = N_OR_MULTA
      AND USOR.ESTADO = '1';

      IF I_EXISTE > 0 THEN C_FLG_MODIFICA_MULTA := '1'; END IF;

  EXCEPTION WHEN NO_DATA_FOUND THEN
      C_FLG_MODIFICA_MULTA := '0';
  END;

  --obtener el OR que inicia la multa
  BEGIN
      SELECT ORGR.CODIGO
      INTO N_ID_ORGANO_RESOLUTIVO
      FROM T_SCOB_MULTA MULT
      INNER JOIN T_SCOB_MULTA_DETAL MDET
            ON MDET.ID_MULTA = MULT.ID_MULTA
            AND MDET.ESTADO = '1'
      INNER JOIN T_SCOB_ORGANO_RESOLUTIVO ORGR
            ON ORGR.ID_ORGANO_RESOLUTIVO = MDET.ID_ORGANO_RESOLUTIVO
            AND ORGR.TIPO_INSTANCIA = MULT.TIPO_INSTANCIA_INICIA
      WHERE MULT.ID_MULTA = PI_N_ID_MULTA
      AND MULT.ESTADO = '1'
      -- Req.28 - @dcelis/begin
      AND ROWNUM=1
      ORDER BY ORGR.CODIGO ASC;
      -- Req.28 - @dcelis/end
  EXCEPTION WHEN NO_DATA_FOUND THEN
      N_ID_ORGANO_RESOLUTIVO := 0;
  END;

  open  po_cu_retorno for
  SELECT
    MDET.ID_MULTA_DETAL AS ID_MULTA_DET,
    ---
    MULT.CUM AS COD_MULTA,
    MULT.ANIO AS ANIO_MULTA,
    MDET.ID_ORGANO_RESOLUTIVO AS COD_ORG_RESOLUTIVO,
    ORGR.DESCRIPCION AS NOM_ORG_RESOLUTIVO,
    MDET.ID_USUARIO_SECRETARIO AS ID_USUARIO_SECRETARIO,
    ORGR.TIPO_INSTANCIA AS COD_TIPO_INSTANCIA,
    TINS.TXT_DESCRIPCION AS NOM_TIPO_INSTANCIA,
    MDET.ESTADO_MULTA AS COD_ESTADO_INSTANCIA,
    SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_ESTADO_MULTA, MDET.ESTADO_MULTA) AS NOM_ESTADO_INSTANCIA,
    MULT.ID_MATERIA AS COD_MATERIA,
    MATE.DESCRIPCION AS NOM_MATERIA,
    MATE.CODIGO AS CODIGO_MATERIA,
    ----FILA 1
    MDET.NRO_RESOLUCION AS NRO_RESOLUCION,
    MDET.FEC_RESOLUCION AS FEC_RESOLUCION,
    MDET.FEC_NOTIFICACION_RESOLUCION AS FEC_NOTIFICACION,
    ----FILA 2
    MDET.NRO_PLAZO AS NRO_PLAZO,
    MDET.FEC_INI_PLAZO AS FEC_INI_PLAZO,
    MDET.FEC_FIN_PLAZO AS FEC_FIN_PLAZO,
    ----FILA 3
    MDET.FEC_ESTADO_INSTANCIA AS FEC_ESTADO_INSTANCIA,
    ----FILA 4
    MDET.NRO_RESOLUCION_DECLARACION AS NRO_RESOLUCION_DECLARACION,
    MDET.FEC_DECLARACION AS FEC_DECLARACION,
    MDET.FEC_NOTIFICACION_DECLARACION AS FEC_NOTIFICACION_DECLARACION,
    ----FILA 5
    MDET.FEC_ESTADO_SGTE_INSTANCIA AS FEC_ESTADO_SGTE_INSTANCIA,
    ----
    MULT.ID_SEDE AS COD_SEDE,
    SEDE.DESCRIPCION AS NOM_SEDE,
    MDET.NRO_EXP_NIVEL AS NRO_EXPE_ANTIGUO,
    MULT.NRO_EXP_ADMINISTRATIVO AS NRO_EXP_ADMIN,
    MULT.FLG_TIPO_MULTA AS FLG_TIPO_MULTA,
    MDET.VALOR_UIT AS UIT_VALOR,
    MDET.MONTO_UIT AS UIT_MONTO,
    MDET.POR_ASOCU AS ASOCU_POR,
    MDET.MONTO_ASOCU AS ASOCU_MONTO,
    MULT.ID_SUB_MATERIA AS ID_SUB_MATERIA,
    SUMA.DESCRIPCION AS NOM_SUBMATERIA,

    MULT.FEC_GENERACION_SEC AS  FEC_GENERACION_SEC,
    MULT.ID_CLASIFICACION AS ID_CLASIFICACION,
    --
    ORGR.CODIGO AS COD_ORGANO_RESOLUTIVO,
    USUA.PRI_NOMBRE  || ' ' || USUA.SEG_NOMBRE  || ' ' ||
    USUA.APE_PATERNO  || ' ' || USUA.APE_MATERNO  || ' ' || USUA.APE_CASADA
                      AS NOM_SECRETARIO,
    SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(
                      SCOB_PK_CONSTANTES.C_TBL_ESTADO_MULTA,
                      MDET.ESTADO_MULTA
                      ) AS NOM_ESTADO_MULTA_OR,

    SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(
                      SCOB_PK_CONSTANTES.C_TBL_TIPO_MULTA,
                      MULT.FLG_TIPO_MULTA
                      ) AS NOM_TIPO_MULTA,

    DECODE(NVL(MULT.NRO_FILE_AEC,' '),' ',' ',MULT.ANIO_FILE_AEC||AREA_COB.CODIGO||MULT.NRO_FILE_AEC)  AS NRO_FILE_AEC,

    (
    SELECT COUNT(MIMP.ID_MULTA_IMPROCEDENCIA)
    FROM T_SCOB_MULTA_IMPROCEDENCIA MIMP
    INNER JOIN T_SCOB_MULTA_COBRANZA MCOB
    ON MCOB.ID_MULTA_COBRANZA = MIMP.ID_MULTA_COBRANZA
    WHERE MIMP.ESTADO = '1' AND MCOB.ID_MULTA = MULT.ID_MULTA
    ) NRO_OBSERVACIONES,
    MDET.NRO_EXPED_ANTIGUO AS EXP_ANTIG_NRO,
    MDET.ANIO_EXPED_ANTIGUO AS EXP_ANTIG_ANIO,
    MDET.ID_SIGLA  AS EXP_ANTIG_ID_SIGLA,
    MDET.ID_TIPO_EXPED_ANTIGUO AS EXP_ANTIG_ID_TIPO_EXPED,

    MULT.NRO_EXPED_UNICO AS EXP_NUEVO_NRO,
    MULT.ANIO_EXPED_UNICO AS EXP_NUEVO_ANIO,

    MDET.NRO_RESOLUCION_SEC AS RESOL_NRO,
    MDET.ANIO_RESOLUCION AS RESOL_ANIO,
    MDET.ID_SIGLA_RESOLUCION  AS RESOL_ID_SIGLA,
    MDET.NRO_RESOLUCION_ID AS NRO_RESOLUCION_NUMERICO,
    ' ' AS FEC_INSTANCIA_ANTERIOR,
    MDET.DES_SIGLA_RESOLUCION AS DES_SIGLA_RESOLUCION,
    MDET.DES_SIGLA AS DES_SIGLA,
    MDET.DES_TIPO_EXPED_ANTIGUO AS DES_TIPO_EXPED_ANTIGUO,
    N_ID_ORGANO_RESOLUTIVO AS COD_ORGANO_RESOL_INICIA,
    C_FLG_MODIFICA_MULTA AS FLG_MODIFICA_MULTA,
    MULT.TIPO_INSTANCIA_INICIA as TIPO_INSTANCIA_INICIA,
    AREA_COB.DIRECCION AS DIREC_AREA_COB,
    AREA_COB.DESCIPCION AS NOM_AREA_COB,
    SCOB_PK_EXPEDIENTE.SCOB_FN_SANCIONADOS_MULTA(MULT.ID_MULTA,0)AS NOM_SANCIONADOS
  FROM T_SCOB_MULTA MULT

  INNER JOIN T_SCOB_MULTA_DETAL MDET
        ON MDET.ID_MULTA = MULT.ID_MULTA

  INNER JOIN T_SCOB_ORGANO_RESOLUTIVO ORGR
        ON ORGR.ID_ORGANO_RESOLUTIVO = MDET.ID_ORGANO_RESOLUTIVO

  INNER JOIN T_SCOB_TABLA_DET TINS
        ON TINS.ID_TABLA = SCOB_PK_CONSTANTES.C_TBL_TIPO_INSTANCIA
        AND TO_NUMBER(TINS.COD_INTERNO) = ORGR.TIPO_INSTANCIA

  INNER JOIN T_SCOB_MATERIA MATE
        ON MATE.ID_MATERIA = MULT.ID_MATERIA

  INNER JOIN T_SCOB_SUBMATERIA SUMA
        ON SUMA.ID_MATERIA = MATE.ID_MATERIA
        AND SUMA.ID_SUBMATERIA = MULT.ID_SUB_MATERIA

  LEFT JOIN T_SCOB_SEDE SEDE
        ON SEDE.ID_SEDE = MULT.ID_SEDE

  INNER JOIN T_SCOB_USUARIO USUA
        ON USUA.ID_USUARIO = MDET.ID_USUARIO_SECRETARIO

  LEFT JOIN T_SCOB_AREA_COBRANZA AREA_COB
       ON AREA_COB.ID_AREA_COBRANZA = MULT.ID_AREA_COBRANZA

  WHERE
    MULT.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
    AND MDET.ID_MULTA = PI_N_ID_MULTA
    AND ORGR.TIPO_INSTANCIA = PI_N_TIPO_INSTANCIA
    AND ROWNUM = 1;
end;

procedure SCOB_SP_S_BUS_PERSONA_BY_ASIG
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 18.02.2011
-- Proposito    : Consulta personas para asignar a la multa segun tipo
                  administrado (sancionado / denunciante)
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA                     IN T_SCOB_MULTA.ID_MULTA%TYPE,
  PI_V_COD_SANCIONADO               IN T_SCOB_PERSONA.COD_SANCIONADO%TYPE,
  PI_I_TIPO_PERSONA                 IN T_SCOB_PERSONA.TIPO_PERSONA%TYPE,
  PI_I_TIPO_DOC                     IN T_SCOB_PERSONA.TIPO_DOC%TYPE,
  PI_V_NRO_DOC                      IN T_SCOB_PERSONA.NRO_DOC%TYPE,
  PI_V_RAZON_SOCIAL                 IN T_SCOB_PERSONA.RAZON_SOCIAL%TYPE,
  PI_V_PRI_NOMBRE                   IN T_SCOB_PERSONA.PRI_NOMBRE%TYPE,
  PI_V_SEG_NOMBRE                   IN T_SCOB_PERSONA.SEG_NOMBRE%TYPE,
  PI_V_APE_PATERNO                  IN T_SCOB_PERSONA.APE_PATERNO%TYPE,
  PI_V_APE_MATERNO                  IN T_SCOB_PERSONA.APE_MATERNO%TYPE,
  PI_C_FLG_OFICIO                   IN T_SCOB_PERSONA.FLG_OFICIO%TYPE,

  po_cu_retorno                     out cu_rec_set
)
as
begin

  open  po_cu_retorno for

  SELECT DISTINCT
    PERS.ID_PERSONA AS ID_PERSONA,
    PERS.COD_SANCIONADO AS COD_SANCIONADO,
    PERS.TIPO_PERSONA AS COD_TIPO_PERSONA,
    PERS.TIPO_DOC AS COD_TIPO_DOC,
    PERS.NRO_DOC,
    PERS.TIP_EMPRESA AS COD_TIPO_EMPRESA,
    DECODE(PERS.TIPO_PERSONA,SCOB_PK_CONSTANTES.C_TIPO_PERS_JURIDICA,  PERS.RAZON_SOCIAL, PERS.APE_PATERNO  || ' ' || PERS.APE_MATERNO  || ' ' || PERS.PRI_NOMBRE || ' ' || PERS.SEG_NOMBRE || ' ' ||  PERS.APE_CASADA) AS NOM_PERSONA,
    SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_TIPO_PERSONA, PERS.TIPO_PERSONA) AS NOM_TIPO_PERSONA,
    SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_TIPO_DOC_IDENT, PERS.TIPO_DOC) AS NOM_TIPO_DOC,
    SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_TIPO_EMPRESA, PERS.TIP_EMPRESA) AS NOM_TIPO_EMPRESA,
    PERS.FLG_ASOCU AS FLG_ASOCU

  FROM T_SCOB_PERSONA PERS

  INNER JOIN T_SCOB_PERSONA_DOMICILIO PDOM --obliga a que todos las personas tengan una direccion registrada.
        ON PDOM.ID_PERSONA = PERS.ID_PERSONA
        AND PDOM.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO

  WHERE
  (NVL(PI_V_COD_SANCIONADO,' ')=' ' OR (NVL(PI_V_COD_SANCIONADO,' ')<>' ' AND fun_scob_nosensite(LTRIM(RTRIM(PERS.COD_SANCIONADO))) LIKE '%' || fun_scob_nosensite(TRIM(PI_V_COD_SANCIONADO)) || '%'))
  AND (NVL(PI_I_TIPO_PERSONA,0)=0 OR (NVL(PI_I_TIPO_PERSONA,0)<>0 AND PERS.TIPO_PERSONA=PI_I_TIPO_PERSONA))
  AND (NVL(PI_I_TIPO_DOC,0)=0 OR  (NVL(PI_I_TIPO_DOC,0)<>0 AND PERS.TIPO_DOC=PI_I_TIPO_DOC))
  AND (NVL(PI_V_NRO_DOC,' ')=' ' OR (NVL(PI_V_NRO_DOC,' ')<>' ' AND fun_scob_nosensite(TRIM(PERS.NRO_DOC))=fun_scob_nosensite(TRIM(PI_V_NRO_DOC))))
  AND (NVL(PI_V_PRI_NOMBRE,' ')=' ' OR (NVL(PI_V_PRI_NOMBRE,' ')<>' ' AND fun_scob_nosensite(LTRIM(RTRIM(PERS.PRI_NOMBRE))) LIKE '%' || fun_scob_nosensite(TRIM(PI_V_PRI_NOMBRE)) || '%'))
  AND (NVL(PI_V_SEG_NOMBRE,' ')=' ' OR (NVL(PI_V_SEG_NOMBRE,' ')<>' ' AND fun_scob_nosensite(LTRIM(RTRIM(PERS.SEG_NOMBRE))) LIKE '%' || fun_scob_nosensite(TRIM(PI_V_SEG_NOMBRE)) || '%'))
  AND (NVL(PI_V_APE_PATERNO,' ')=' ' OR (NVL(PI_V_APE_PATERNO,' ')<>' ' AND fun_scob_nosensite(LTRIM(RTRIM(PERS.APE_PATERNO))) LIKE '%' || fun_scob_nosensite(TRIM(PI_V_APE_PATERNO)) || '%'))
  AND (NVL(PI_V_APE_MATERNO,' ')=' ' OR (NVL(PI_V_APE_MATERNO,' ')<>' ' AND fun_scob_nosensite(LTRIM(RTRIM(PERS.APE_MATERNO))) LIKE '%' || fun_scob_nosensite(TRIM(PI_V_APE_MATERNO)) || '%'))
  AND (NVL(PI_V_RAZON_SOCIAL,' ')=' ' OR (NVL(PI_V_RAZON_SOCIAL,' ')<>' ' AND fun_scob_nosensite(LTRIM(RTRIM(PERS.RAZON_SOCIAL))) LIKE '%' || fun_scob_nosensite(TRIM(PI_V_RAZON_SOCIAL)) || '%'))
  AND (NVL(PI_C_FLG_OFICIO,' ')=' ' OR (NVL(PI_C_FLG_OFICIO,' ')<>' ' AND NVL(PERS.FLG_OFICIO,'0') = PI_C_FLG_OFICIO))
  AND PERS.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
  AND  NOT EXISTS(

      SELECT SANC.ID_PERSONA
      FROM T_SCOB_MULTA MULT
      INNER JOIN T_SCOB_MULTA_DETAL MDET
            ON MDET.ID_MULTA = MULT.ID_MULTA
            AND MDET.FLG_ACTUAL = '1'
            AND MDET.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
      INNER JOIN T_SCOB_MULTA_SANCIONADO SANC
            ON SANC.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL
            AND SANC.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
      WHERE MDET.ID_MULTA = PI_N_ID_MULTA
      AND SANC.ID_PERSONA = PERS.ID_PERSONA
      UNION
      SELECT DENU.ID_PERSONA
      FROM T_SCOB_MULTA MULT
      INNER JOIN T_SCOB_MULTA_DETAL MDET
            ON MDET.ID_MULTA = MULT.ID_MULTA
            AND MDET.FLG_ACTUAL = '1'
            AND MDET.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
      INNER JOIN T_SCOB_MULTA_DENUNCIANTE DENU
            ON DENU.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL
            AND DENU.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
      WHERE MDET.ID_MULTA = PI_N_ID_MULTA
      AND DENU.ID_PERSONA = PERS.ID_PERSONA
    )
    ;

end;

procedure SCOB_SP_I_T_SCOB_PERSONA_MULTA
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 18.02.2011
-- Proposito    : Inserta las personas asignadas a la multa por tipo administrado.
                  26.08.2011 cambio sancionados/denunciados
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA               IN T_SCOB_MULTA.ID_MULTA%TYPE,
  PI_N_ID_MULTA_DETAL         IN T_SCOB_MULTA_DETAL.ID_MULTA_DETAL%TYPE,
  PI_I_TIPO_ADMINISTRADO      IN INTEGER, --1=SANCIONADO;2=DENUNCIANTE;3=DENUNCIADO

  PI_N_TIPO_DOCUMENTO         IN T_SCOB_PERSONA.TIPO_DOC%TYPE,
  PI_V_NRO_DOCUMENTO          IN T_SCOB_PERSONA.NRO_DOC%TYPE,

  PI_V_AUDUSUCREACION         IN T_SCOB_PERSONA.AUDUSUCREACION%TYPE,
  PI_N_ID_MULTA_COBRANZA      IN T_SCOB_MULTA_COBRANZA.ID_MULTA_COBRANZA%TYPE,
  po_n_retorno                out number,
  po_n_cod_error              out number,
  po_v_msj_error              out varchar2
)
is
  N_ID_MULTA_PERSONA          T_SCOB_PERSONA.ID_PERSONA%TYPE;
  N_ID_PERSONA                VARCHAR2(50);

  C_FLG_PRINCIPAL             CHAR(1);
  I_EXISTE                    INTEGER;
begin

  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  SELECT COUNT(MULT.ID_MULTA)
  INTO I_EXISTE
  FROM T_SCOB_MULTA MULT
  WHERE MULT.ID_MULTA = PI_N_ID_MULTA
  AND MULT.ESTADO_MULTA IN (
      SCOB_PK_CONSTANTES.C_EST_MULT_CONSENTIDA,
      SCOB_PK_CONSTANTES.C_EST_MULT_FIRME,
      SCOB_PK_CONSTANTES.C_EST_MULT_REVISADA
  )
  AND MULT.FLG_MULTA_RESOLUTIVO <> '0';

  IF I_EXISTE > 0 THEN
      po_v_msj_error :='No se puede realizar la accion. El estado actual de la multa no permite realizar modificaciones.';
      po_n_cod_error := -10;
      po_n_retorno := po_n_cod_error;
      return;
  END IF;

  --BUSCA SI LA PERSONA EXISTE COMO DENUNCIANTE, DENUNCIADO O SANCIONADO.
  SCOB_SP_S_VERIF_ADMIN_BY_MULTA(
    PI_N_ID_MULTA_DETAL,
    PI_I_TIPO_ADMINISTRADO,
    PI_N_TIPO_DOCUMENTO,
    PI_V_NRO_DOCUMENTO,
    I_EXISTE
  );
  IF I_EXISTE = 1 THEN
      po_v_msj_error :='No se puede realizar la accion. La persona selecciona ya se encuentra registrada.';
      po_n_cod_error := -11;
      po_n_retorno := po_n_cod_error;
      return;
  END IF;

  --VERIFICA SI LA PERSONA EXISTE COMO ADMINISTRADO, SINO LO GRABA
  SCOB_SP_I_GRABA_ADMINISTRADO(
      PI_N_TIPO_DOCUMENTO,
      PI_V_NRO_DOCUMENTO,
      PI_V_AUDUSUCREACION,
      N_ID_PERSONA,
      PO_N_COD_ERROR,
      PO_V_MSJ_ERROR
  );
  IF N_ID_PERSONA < 0 THEN
      po_v_msj_error :='No se puede realizar la accion. Se produjo un error al grabar la persona como administrado.';
      po_n_cod_error := -12;
      po_n_retorno := po_n_cod_error;
      return;
  END IF;

  C_FLG_PRINCIPAL:='0';
  IF PI_I_TIPO_ADMINISTRADO = 1 THEN --ES SANCIONADO
      --verificar el flag principal
      SELECT COUNT(MSAN.ID_MULTA_SANCIONADO)
      INTO I_EXISTE
      FROM T_SCOB_MULTA_SANCIONADO MSAN
      WHERE MSAN.ID_MULTA_DETAL = PI_N_ID_MULTA_DETAL
      AND MSAN.FLG_PRINCIPAL = '1'
      AND MSAN.COD_TIPO_PERSONA = '1' --SANCIONADO
      AND MSAN.ESTADO = '1';
      IF I_EXISTE = 0 THEN C_FLG_PRINCIPAL:='1'; END IF;
  END IF;

  IF PI_I_TIPO_ADMINISTRADO <> SCOB_PK_CONSTANTES.C_TIPO_ADMIN_DENUNCIANTE THEN
  BEGIN --sancionado o denunciado
        --obtener el secuencial
        SELECT SCOB_SQ_MULTA_SANCIONADO.NEXTVAL INTO N_ID_MULTA_PERSONA FROM dual;

        --insertar registro
        INSERT INTO T_SCOB_MULTA_SANCIONADO(
          ID_MULTA_SANCIONADO,
          ID_MULTA_DETAL,
          ID_PERSONA,
          ESTADO,
          AUDFECCREACION,
          AUDUSUCREACION,
          ID_MULTA_COBRANZA,
          COD_TIPO_PERSONA,
          FLG_PRINCIPAL
          )
        VALUES(
          N_ID_MULTA_PERSONA,
          PI_N_ID_MULTA_DETAL,
          N_ID_PERSONA,
          SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO,
          SYSDATE,
          PI_V_AUDUSUCREACION,
          DECODE(PI_N_ID_MULTA_COBRANZA,0,NULL,PI_N_ID_MULTA_COBRANZA),
          DECODE(PI_I_TIPO_ADMINISTRADO, '3',--SI ES DENUNCIADO
                                         '2', --DENUNCIADO
                                         SCOB_PK_CONSTANTES.C_TIPO_ADMIN_SANCIONADO),
          C_FLG_PRINCIPAL
        );
    END;

  ELSE --denunciante
    BEGIN
        --obtener el secuencial
        SELECT SCOB_SQ_MULTA_DENUNCIANTE.NEXTVAL INTO N_ID_MULTA_PERSONA FROM dual;

        --insertar registro
        INSERT INTO T_SCOB_MULTA_DENUNCIANTE(
          ID_MULTA_DENUNCIANTE,
          ID_MULTA_DETAL,
          ID_PERSONA,
          ESTADO,
          AUDFECCREACION,
          AUDUSUCREACION,
          ID_MULTA_COBRANZA)
        VALUES(
          N_ID_MULTA_PERSONA,
          PI_N_ID_MULTA_DETAL,
          N_ID_PERSONA,
          SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO,
          SYSDATE,
          PI_V_AUDUSUCREACION,
          DECODE(PI_N_ID_MULTA_COBRANZA,0,NULL,PI_N_ID_MULTA_COBRANZA)
        );
    END;
  END IF;

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

procedure SCOB_SP_U_T_SCOB_PERSONA_MULTA
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 18.02.2011
-- Proposito    : actualiza los datos relacionados de multa a personas (sancionados o denunciados).
                  26.08.2011
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA               IN T_SCOB_MULTA.ID_MULTA%TYPE,
  PI_N_ID_MULTA_DETAL         IN T_SCOB_MULTA_DETAL.ID_MULTA_DETAL%TYPE,
  PI_V_VALOR_UIT              IN VARCHAR2,
  PI_V_MONTO_UIT              IN VARCHAR2,
  PI_V_POR_ASOCU              IN VARCHAR2,
  PI_V_MONTO_ASOCU            IN VARCHAR2,
  PI_V_AUDUSUMODIFICACION     IN T_SCOB_PERSONA.AUDUSUMODIFICACION%TYPE,
  po_n_retorno                out number,
  po_n_cod_error              out number,
  po_v_msj_error              out varchar2
)
is

  V_VALOR_UIT           VARCHAR2(50);
  V_MONTO_UIT           VARCHAR2(50);
  V_POR_ASOCU           VARCHAR2(50);
  V_MONTO_ASOCU         VARCHAR2(50);

  N_VALOR_UIT           T_SCOB_MULTA_DETAL.VALOR_UIT%TYPE;
  N_MONTO_UIT           T_SCOB_MULTA_DETAL.MONTO_UIT%TYPE;
  N_POR_ASOCU           T_SCOB_MULTA_DETAL.POR_ASOCU%TYPE;
  N_MONTO_ASOCU         T_SCOB_MULTA_DETAL.MONTO_ASOCU%TYPE;

begin
  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  SCOB_PK_UTILITARIO.SCOB_SP_S_SPLIT(PI_V_VALOR_UIT,'|', 2, V_VALOR_UIT);
  SCOB_PK_UTILITARIO.SCOB_SP_S_SPLIT(PI_V_MONTO_UIT,'|', 2, V_MONTO_UIT);
  SCOB_PK_UTILITARIO.SCOB_SP_S_SPLIT(PI_V_POR_ASOCU,'|', 2, V_POR_ASOCU);
  SCOB_PK_UTILITARIO.SCOB_SP_S_SPLIT(PI_V_MONTO_ASOCU,'|', 2, V_MONTO_ASOCU);

  N_VALOR_UIT := SCOB_PK_UTILITARIO.SCOB_FN_TEXTO_A_NUMERO(V_VALOR_UIT);
  N_MONTO_UIT := SCOB_PK_UTILITARIO.SCOB_FN_TEXTO_A_NUMERO(V_MONTO_UIT);
  N_POR_ASOCU := SCOB_PK_UTILITARIO.SCOB_FN_TEXTO_A_NUMERO(V_POR_ASOCU);
  N_MONTO_ASOCU := SCOB_PK_UTILITARIO.SCOB_FN_TEXTO_A_NUMERO(V_MONTO_ASOCU);

  N_MONTO_UIT := TRUNC(N_MONTO_UIT,SCOB_PK_CONSTANTES.C_NRO_DECIMAL_TRUNC);
  --actualizacion de montos
  UPDATE T_SCOB_MULTA_DETAL
  SET
      VALOR_UIT = N_VALOR_UIT,
      MONTO_UIT = N_MONTO_UIT,
      POR_ASOCU = N_POR_ASOCU,
      MONTO_ASOCU = N_MONTO_ASOCU,
      AUDUSUMODIFICACION = PI_V_AUDUSUMODIFICACION,
      AUDFECMODIFICACION = SYSDATE
  WHERE ID_MULTA_DETAL = PI_N_ID_MULTA_DETAL;

  UPDATE T_SCOB_MULTA MULT
  SET
      MONTO_UIT = N_MONTO_UIT,
      SALDO = N_MONTO_UIT,
      MONTO_TOTAL_DEUDA = N_MONTO_UIT,
      SALDO_TOTAL_DEUDA = N_MONTO_UIT,
      COD_ESTADO_PAGO =
         CASE
            WHEN N_MONTO_UIT = 0 THEN
                 SCOB_PK_CONSTANTES.C_EST_PAGO_TOTAL
            ELSE SCOB_PK_CONSTANTES.C_EST_PAGO_PENDIENTE
         END
  WHERE MULT.ID_MULTA = PI_N_ID_MULTA
  AND MULT.FLG_MULTA_RESOLUTIVO = '1'; --NO ACTUALIZA A LAS MULTAS ANTIDUMPING.

  --LLAMADA AL SP CALCULAR DESCUENTO.
  SCOB_PK_JOB.SCOB_PK_ACT_DSCT_MULTA_AFEC(PI_N_ID_MULTA);

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

procedure SCOB_SP_I_SANCIONADO_MULTA
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 29.08.2011 cambio sancionados/denunciados.
-- Proposito    : Inserta al sancionado en base a los denunciados o denunciantes.
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA               IN T_SCOB_MULTA.ID_MULTA%TYPE,
  PI_N_ID_MULTA_DETAL         IN T_SCOB_MULTA_DETAL.ID_MULTA_DETAL%TYPE,
  PI_V_ID_DENUNCIADO          IN VARCHAR2,
  PI_N_ITEMS_DENUNCIADO       IN INTEGER,
  --
  PI_V_ID_DENUNCIANTE         IN VARCHAR2,
  PI_N_ITEMS_DENUNCIANTE      IN INTEGER,
  --
  PI_V_AUDUSUCREACION         IN T_SCOB_PERSONA.AUDUSUCREACION%TYPE,
  PI_N_ID_MULTA_COBRANZA      IN T_SCOB_MULTA_COBRANZA.ID_MULTA_COBRANZA%TYPE,
  --
  po_n_retorno                out number,
  po_n_cod_error              out number,
  po_v_msj_error              out varchar2
)
is
  N_CONT                      NUMBER;
  V_ID_PERSONA                VARCHAR2(50);
  N_ID_MULTA_PERSONA          T_SCOB_MULTA_SANCIONADO.ID_MULTA_SANCIONADO%TYPE;
  C_FLG_PRINCIPAL             CHAR(1);
  I_EXISTE                    INTEGER;

begin
  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  --verificar el estado de la multa
  SELECT COUNT(MULT.ID_MULTA)
  INTO I_EXISTE
  FROM T_SCOB_MULTA MULT
  WHERE MULT.ID_MULTA = PI_N_ID_MULTA
  AND MULT.ESTADO_MULTA IN (
      SCOB_PK_CONSTANTES.C_EST_MULT_CONSENTIDA,
      SCOB_PK_CONSTANTES.C_EST_MULT_FIRME,
      SCOB_PK_CONSTANTES.C_EST_MULT_REVISADA
  )
  AND MULT.FLG_MULTA_RESOLUTIVO = '1';

  IF I_EXISTE > 0 THEN
      po_v_msj_error :='No se puede realizar la accion. El estado actual de la multa no permite realizar modificaciones.';
      po_n_cod_error := -10;
      po_n_retorno := po_n_cod_error;
      return;
  END IF;

  I_EXISTE:=0;
  C_FLG_PRINCIPAL:='0';
  --verificar el flag principal
  SELECT COUNT(MSAN.ID_MULTA_SANCIONADO)
  INTO I_EXISTE
  FROM T_SCOB_MULTA_SANCIONADO MSAN
  WHERE MSAN.ID_MULTA_DETAL = PI_N_ID_MULTA_DETAL
  AND MSAN.FLG_PRINCIPAL = '1'
  AND MSAN.COD_TIPO_PERSONA = '1' --SANCIONADO
  AND MSAN.ESTADO = '1';

  IF I_EXISTE = 0 THEN C_FLG_PRINCIPAL:='1'; END IF;

  --INSERTAR PERSONAS DESDE DENUNCIADOS
  N_CONT := 1;
  WHILE (N_CONT <= PI_N_ITEMS_DENUNCIADO)
  LOOP

    SCOB_PK_UTILITARIO.SCOB_SP_S_SPLIT(PI_V_ID_DENUNCIADO,'|', N_CONT+1, V_ID_PERSONA);

    IF V_ID_PERSONA='#' THEN
       EXIT;
    END IF;
    --------------------------------------------------------------------
    --VERIFICA SI EXISTE REGISTRADO COMO SANCIONADO : 18.04.2012
    SELECT COUNT(MSAN.ID_MULTA_SANCIONADO)
    INTO I_EXISTE
    FROM T_SCOB_MULTA_SANCIONADO MSAN
    WHERE MSAN.ID_MULTA_DETAL = PI_N_ID_MULTA_DETAL
    AND MSAN.ID_PERSONA = TO_NUMBER(V_ID_PERSONA)
    AND MSAN.COD_TIPO_PERSONA = 1
    AND MSAN.ESTADO = '1';

    IF I_EXISTE > 0 THEN
      po_v_msj_error :='No se puede realizar la accion. La persona seleccionada ya existe como sancionado.';
      po_n_cod_error := -11;
      po_n_retorno := po_n_cod_error;
      return;
    END IF;
    --------------------------------------------------------------------


    --obtener el secuencial
    SELECT SCOB_SQ_MULTA_SANCIONADO.NEXTVAL INTO N_ID_MULTA_PERSONA FROM dual;

    --insertar registro
    INSERT INTO T_SCOB_MULTA_SANCIONADO(
      ID_MULTA_SANCIONADO,
      ID_MULTA_DETAL,
      ID_PERSONA,
      ESTADO,
      AUDFECCREACION,
      AUDUSUCREACION,
      ID_MULTA_COBRANZA,
      COD_TIPO_PERSONA,
      FLG_PRINCIPAL
      )
    VALUES(
      N_ID_MULTA_PERSONA,
      PI_N_ID_MULTA_DETAL,
      TO_NUMBER(V_ID_PERSONA),
      SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO,
      SYSDATE,
      PI_V_AUDUSUCREACION,
      DECODE(PI_N_ID_MULTA_COBRANZA,0,NULL,PI_N_ID_MULTA_COBRANZA),
      '1', --sancionado
      C_FLG_PRINCIPAL
    );
    C_FLG_PRINCIPAL := '0';
    N_CONT := N_CONT + 1;
  END LOOP;


  --INSERTAR PERSONAS DESDE DENUNCIANTES
  N_CONT := 1;
  WHILE (N_CONT <= PI_N_ITEMS_DENUNCIANTE)
  LOOP

    SCOB_PK_UTILITARIO.SCOB_SP_S_SPLIT(PI_V_ID_DENUNCIANTE,'|', N_CONT+1, V_ID_PERSONA);

    IF V_ID_PERSONA='#' THEN
       EXIT;
    END IF;
    --------------------------------------------------------------------
    --VERIFICA SI EXISTE REGISTRADO COMO SANCIONADO : 18.04.2012
    SELECT COUNT(MSAN.ID_MULTA_SANCIONADO)
    INTO I_EXISTE
    FROM T_SCOB_MULTA_SANCIONADO MSAN
    WHERE MSAN.ID_MULTA_DETAL = PI_N_ID_MULTA_DETAL
    AND MSAN.ID_PERSONA = TO_NUMBER(V_ID_PERSONA)
    AND MSAN.COD_TIPO_PERSONA = 1
    AND MSAN.ESTADO = '1';

    IF I_EXISTE > 0 THEN
      po_v_msj_error :='No se puede realizar la accion. La persona seleccionada ya existe como sancionado.';
      po_n_cod_error := -12;
      po_n_retorno := po_n_cod_error;
      return;
    END IF;
    --------------------------------------------------------------------
    --obtener el secuencial
    SELECT SCOB_SQ_MULTA_SANCIONADO.NEXTVAL INTO N_ID_MULTA_PERSONA FROM dual;

    --insertar registro
    INSERT INTO T_SCOB_MULTA_SANCIONADO(
      ID_MULTA_SANCIONADO,
      ID_MULTA_DETAL,
      ID_PERSONA,
      ESTADO,
      AUDFECCREACION,
      AUDUSUCREACION,
      ID_MULTA_COBRANZA,
      COD_TIPO_PERSONA,
      FLG_PRINCIPAL
      )
    VALUES(
      N_ID_MULTA_PERSONA,
      PI_N_ID_MULTA_DETAL,
      TO_NUMBER(V_ID_PERSONA),
      SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO,
      SYSDATE,
      PI_V_AUDUSUCREACION,
      DECODE(PI_N_ID_MULTA_COBRANZA,0,NULL,PI_N_ID_MULTA_COBRANZA),
      '1', --sancionado
      C_FLG_PRINCIPAL
    );
    C_FLG_PRINCIPAL := '0';
    N_CONT := N_CONT + 1;
  END LOOP;

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

procedure SCOB_SP_D_T_SCOB_PERSONA_MULTA
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 18.02.2011
-- Proposito    : elimina las personas relacionadas a una multa
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA               IN T_SCOB_MULTA.ID_MULTA%TYPE,
  PI_N_ID_MULTA_DETAL         IN T_SCOB_MULTA_DETAL.ID_MULTA_DETAL%TYPE,
  PI_I_TIPO_ADMINISTRADO      IN INTEGER,  --1=SANCIONADO O DENUNCIADO; 2=DENUNCIANTE
  PI_V_ID_MULTA_PERSONA       IN VARCHAR2, --ID_MULTA_SANCIONADO o ID_MULTA_DENUNCIANTE, segun tipo administrado
  PI_V_AUDUSUMODIFICACION     IN T_SCOB_PERSONA.AUDUSUMODIFICACION%TYPE,

  po_n_retorno                out number,
  po_n_cod_error              out number,
  po_v_msj_error              out varchar2
)
is

  N_EXISTE_REG        INTEGER;
  I_EXISTE            INTEGER;

begin
  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  SELECT COUNT(MULT.ID_MULTA)
  INTO I_EXISTE
  FROM T_SCOB_MULTA MULT
  WHERE MULT.ID_MULTA = PI_N_ID_MULTA
  AND MULT.ESTADO_MULTA IN (
      SCOB_PK_CONSTANTES.C_EST_MULT_CONSENTIDA,
      SCOB_PK_CONSTANTES.C_EST_MULT_FIRME,
      SCOB_PK_CONSTANTES.C_EST_MULT_REVISADA
  )
  AND MULT.FLG_MULTA_RESOLUTIVO <> '0';

  IF I_EXISTE > 0 THEN
      po_v_msj_error :='No se puede realizar la accion. El estado actual de la multa no permite realizar modificaciones.';
      po_n_cod_error := -10;
      po_n_retorno := po_n_cod_error;
      return;
  END IF;


  --IF PI_I_TIPO_ADMINISTRADO = SCOB_PK_CONSTANTES.C_TIPO_ADMIN_SANCIONADO THEN
  IF PI_I_TIPO_ADMINISTRADO <> SCOB_PK_CONSTANTES.C_TIPO_ADMIN_DENUNCIANTE THEN


      --verifica si dentro de los registros a eliminar esta seteado el registro principal
      SELECT COUNT(ID_MULTA_SANCIONADO) INTO N_EXISTE_REG
      FROM T_SCOB_MULTA_SANCIONADO SANC
      WHERE INSTR(PI_V_ID_MULTA_PERSONA,'|' || TO_CHAR(ID_MULTA_SANCIONADO) || '|' )>0
      AND SANC.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
      AND SANC.COD_TIPO_PERSONA = '1' --SANCIONADO
      AND SANC.FLG_PRINCIPAL = '1';

      IF N_EXISTE_REG = 1 THEN
        --si existe el registro actualiza al primer registro diferente a los eliminados como principal
        UPDATE T_SCOB_MULTA_SANCIONADO SANC
        SET SANC.FLG_PRINCIPAL = '1'
        WHERE SANC.ID_MULTA_SANCIONADO = (

              SELECT ID_MULTA_SANCIONADO
              FROM T_SCOB_MULTA_SANCIONADO SANC
              INNER JOIN T_SCOB_MULTA_DETAL MDET ON MDET.ID_MULTA_DETAL = SANC.ID_MULTA_DETAL
                                                  AND MDET.ID_MULTA = PI_N_ID_MULTA
              WHERE INSTR(PI_V_ID_MULTA_PERSONA,'|' || TO_CHAR(ID_MULTA_SANCIONADO) || '|' )=0
              AND SANC.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
              AND SANC.COD_TIPO_PERSONA = '1' --SANCIONADO
              AND ROWNUM = 1
        );
      END IF;

      --actualiza el registro a eliminado
      UPDATE T_SCOB_MULTA_SANCIONADO
      SET
        AUDUSUMODIFICACION = PI_V_AUDUSUMODIFICACION,
        AUDFECMODIFICACION = SYSDATE,
        ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_INACTIVO
      WHERE INSTR(PI_V_ID_MULTA_PERSONA,'|' || TO_CHAR(ID_MULTA_SANCIONADO) || '|' )>0;

  ELSE
      UPDATE T_SCOB_MULTA_DENUNCIANTE
      SET
        AUDUSUMODIFICACION = PI_V_AUDUSUMODIFICACION,
        AUDFECMODIFICACION = SYSDATE,
        ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_INACTIVO
      WHERE INSTR(PI_V_ID_MULTA_PERSONA,'|' || TO_CHAR(ID_MULTA_DENUNCIANTE) || '|' )>0;

  END IF;


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

procedure SCOB_SP_S_BUS_SANC_BY_MULTA
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 18.02.2011
-- Proposito    : Consulta SANCIONADOS por multa
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA                     IN T_SCOB_MULTA.ID_MULTA%TYPE,
  PI_I_NIVEL                        IN INTEGER,
  PI_C_COD_TIPO_PERSONA             IN T_SCOB_MULTA_SANCIONADO.COD_TIPO_PERSONA%TYPE,
                                    --1=SANCIONADO; 2=DENUNCIADO.
  po_cu_retorno                     out cu_rec_set
)
as
begin

  open  po_cu_retorno for

  SELECT
    SANC.ID_MULTA_SANCIONADO AS ID_MULTA_SANCIONADO,
    SANC.ID_PERSONA AS ID_PERSONA, --NUEVO
    PERS.COD_SANCIONADO AS COD_SANCIONADO,
    PERS.TIPO_PERSONA AS COD_TIPO_PERSONA,
    SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_TIPO_PERSONA, PERS.TIPO_PERSONA) AS NOM_TIPO_PERSONA,
    DECODE(PERS.TIPO_PERSONA,SCOB_PK_CONSTANTES.C_TIPO_PERS_JURIDICA,  PERS.RAZON_SOCIAL, PERS.APE_PATERNO  || ' ' || PERS.APE_MATERNO  || ' ' || PERS.PRI_NOMBRE || ' ' || PERS.SEG_NOMBRE || ' ' ||  PERS.APE_CASADA) AS NOM_PERSONA,
    PERS.TIPO_DOC AS COD_TIPO_DOC,
    SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_TIPO_DOC_IDENT, PERS.TIPO_DOC) AS NOM_TIPO_DOC,
    PERS.NRO_DOC,
    PERS.TIP_EMPRESA AS COD_TIPO_EMPRESA,
    SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_TIPO_EMPRESA, PERS.TIP_EMPRESA) AS NOM_TIPO_EMPRESA,
    PERS.ID_SECTOR_ECONOMICO AS COD_SECTOR_ECONOMICO,
    SECO.DESCRIPCION AS NOM_SECTOR_ECONOMICO,
    MDET.VALOR_UIT AS VALOR_UIT,
    MDET.MONTO_UIT AS MONTO_UIT,
    MDET.POR_ASOCU AS POR_ASOCU,
    MDET.MONTO_ASOCU AS MONTO_ASOCU,
    SANC.ID_PERSONA AS ID_PERSONA,
    NVL(MULT.FLG_TIPO_MULTA,'0') AS FLG_TIPO_MULTA,
    SANC.COD_TIPO_PERSONA AS TIPO_SANCIONADO,--NUEVO 1=SANCIONADO;2=DENUNCIADO
    MUAN.MONTO_ANTIDUMPING AS MONTO_ANTIDUMPING
  FROM T_SCOB_MULTA_SANCIONADO SANC

  INNER JOIN T_SCOB_MULTA_DETAL MDET
        ON MDET.ID_MULTA = PI_N_ID_MULTA
        AND MDET.ID_MULTA_DETAL = SANC.ID_MULTA_DETAL

  INNER JOIN T_SCOB_MULTA MULT
        ON MULT.ID_MULTA = MDET.ID_MULTA

  INNER JOIN T_SCOB_ORGANO_RESOLUTIVO ORGR
        ON ORGR.ID_ORGANO_RESOLUTIVO = MDET.ID_ORGANO_RESOLUTIVO
        AND ORGR.TIPO_INSTANCIA = PI_I_NIVEL

  INNER JOIN T_SCOB_PERSONA PERS
        ON PERS.ID_PERSONA = SANC.ID_PERSONA

  LEFT JOIN T_SCOB_SECTOR_ECONOMICO SECO
        ON SECO.ID_SECTOR_ECONOMICO = PERS.ID_SECTOR_ECONOMICO

  LEFT JOIN T_SCOB_MULTA_ANTIDUMPING MUAN
       ON MUAN.ID_MULTA = MULT.ID_MULTA

  WHERE
        SANC.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
        AND SANC.COD_TIPO_PERSONA = PI_C_COD_TIPO_PERSONA
        AND SANC.ESTADO = '1'
  ORDER BY SANC.COD_TIPO_PERSONA, NOM_PERSONA;

end;

procedure SCOB_SP_S_BUS_DENU_BY_MULTA
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 18.02.2011
-- Proposito    : Consulta DENUNCIANTES por multa
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA                     IN T_SCOB_MULTA.ID_MULTA%TYPE,
  PI_I_NIVEL                        IN INTEGER,
  po_cu_retorno                     out cu_rec_set
)
as
begin

  open  po_cu_retorno for

  SELECT
    DENU.ID_MULTA_DENUNCIANTE AS ID_MULTA_DENUNCIANTE,
    DENU.ID_PERSONA AS ID_PERSONA,
    PERS.COD_SANCIONADO AS COD_SANCIONADO,
    PERS.TIPO_PERSONA AS COD_TIPO_PERSONA,
    SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_TIPO_PERSONA, PERS.TIPO_PERSONA) AS NOM_TIPO_PERSONA,
    DECODE(PERS.TIPO_PERSONA,SCOB_PK_CONSTANTES.C_TIPO_PERS_JURIDICA,  PERS.RAZON_SOCIAL, PERS.APE_PATERNO  || ' ' || PERS.APE_MATERNO  || ' ' ||  PERS.PRI_NOMBRE || ' ' || PERS.SEG_NOMBRE || ' ' || PERS.APE_CASADA) AS NOM_PERSONA,
    PERS.TIPO_DOC AS COD_TIPO_DOC,
    SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_TIPO_DOC_IDENT, PERS.TIPO_DOC) AS NOM_TIPO_DOC,
    PERS.NRO_DOC,
    PERS.TIP_EMPRESA AS COD_TIPO_EMPRESA,
    SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_TIPO_EMPRESA, PERS.TIP_EMPRESA) AS NOM_TIPO_EMPRESA,
    PERS.ID_SECTOR_ECONOMICO AS COD_SECTOR_ECONOMICO,
    SECO.DESCRIPCION AS NOM_SECTOR_ECONOMICO,
    PERS.FLG_ASOCU as FLG_ASOCU,
    PERS.ID_PERSONA AS ID_PERSONA

  FROM T_SCOB_MULTA_DENUNCIANTE DENU

  INNER JOIN T_SCOB_MULTA_DETAL MDET
        ON MDET.ID_MULTA = PI_N_ID_MULTA
        AND MDET.ID_MULTA_DETAL = DENU.ID_MULTA_DETAL

  INNER JOIN T_SCOB_ORGANO_RESOLUTIVO ORGR
        ON ORGR.ID_ORGANO_RESOLUTIVO = MDET.ID_ORGANO_RESOLUTIVO
        AND ORGR.TIPO_INSTANCIA = PI_I_NIVEL

  INNER JOIN T_SCOB_PERSONA PERS
        ON PERS.ID_PERSONA = DENU.ID_PERSONA

  LEFT JOIN T_SCOB_SECTOR_ECONOMICO SECO
        ON SECO.ID_SECTOR_ECONOMICO = PERS.ID_SECTOR_ECONOMICO

  WHERE
  DENU.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO;

end;

procedure SCOB_SP_S_MULTA_BY_OR_RESUMEN
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 24.02.2011
-- Proposito    : consultar el resumen de la multa or
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA            IN T_SCOB_MULTA.ID_MULTA%TYPE,
  po_cu_retorno            out cu_rec_set
)
as
begin

  open  po_cu_retorno for

  SELECT
    MULT.ID_MULTA AS ID_MULTA,
    MDET.ID_MULTA_DETAL AS ID_MULTA_DETAL, --ID_DETALLE_MULTA_ACTUAL

    ORGR.TIPO_INSTANCIA AS NRO_TIPO_INSTANCIA, --NRO_TIPO_INSTANCIA_ACTUAL

    DECODE(TO_NUMBER(EST_MUL.TXT_VALOR1),2,'AEC',
        SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_TIPO_INSTANCIA,ORGR.TIPO_INSTANCIA)
    ) AS NOM_TIPO_INSTANCIA,

    MDET.ID_ORGANO_RESOLUTIVO AS COD_ORG_RESOLUTIVO,
    ORGR.DESCRIPCION AS NOM_ORG_RESOLUTIVO,
    MDET.NRO_RESOLUCION AS NRO_RESOLUCION,
    MDET.FEC_RESOLUCION AS FEC_RESOLUCION,
    MDET.VALOR_UIT AS VALOR_UIT,
    MDET.MONTO_UIT AS MONTO_UIT,
    MDET.POR_ASOCU AS POR_ASOCU,
    MDET.MONTO_ASOCU AS MONTO_ASOCU,
    PERS.COD_SANCIONADO AS COD_SANCIONADO,
    DECODE(PERS.TIPO_PERSONA,SCOB_PK_CONSTANTES.C_TIPO_PERS_JURIDICA,  PERS.RAZON_SOCIAL, PERS.APE_PATERNO  || ' ' || PERS.APE_MATERNO  || ' ' ||  PERS.PRI_NOMBRE || ' ' || PERS.SEG_NOMBRE || ' ' || PERS.APE_CASADA) AS DES_SANCIONADO,
    MEST.ESTADO_MULTA AS COD_ESTADO_INSTANCIA,
    SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_ESTADO_MULTA,MEST.ESTADO_MULTA) AS NOM_ESTADO_INSTANCIA,
    MDET.FEC_NOTIFICACION_RESOLUCION AS FEC_NOTIFICACION,
    MEST.AUDUSUCREACION AS AUDUSUMODIFICACION,
    USU.APE_PATERNO||' '||USU.APE_MATERNO||' '||USU.PRI_NOMBRE||' '||USU.SEG_NOMBRE AS NOMBRES,
    MEST.AUDFECCREACION AS AUDFECCREACION,
    MULT.NRO_EXP_ADMINISTRATIVO AS NRO_EXP_ADMINISTRATIVO,
    MDET.NRO_EXP_NIVEL AS NRO_EXP_NIVEL

  FROM T_SCOB_MULTA MULT

  INNER JOIN T_SCOB_MULTA_DETAL MDET
        ON MDET.ID_MULTA = MULT.ID_MULTA
        AND MDET.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO

  INNER JOIN T_SCOB_MULTA_ESTADO MEST
        ON MEST.ID_MULTA = MDET.ID_MULTA
        AND MEST.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL
        AND MEST.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO

  INNER JOIN T_SCOB_TABLA_DET EST_MUL
        ON EST_MUL.ID_TABLA = SCOB_PK_CONSTANTES.C_TBL_ESTADO_MULTA
        AND TO_NUMBER(EST_MUL.COD_INTERNO) = MEST.ESTADO_MULTA

  INNER JOIN T_SCOB_ORGANO_RESOLUTIVO ORGR
        ON ORGR.ID_ORGANO_RESOLUTIVO = MDET.ID_ORGANO_RESOLUTIVO

  LEFT JOIN T_SCOB_MULTA_SANCIONADO SANC
        ON SANC.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL
        AND SANC.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
        AND SANC.COD_TIPO_PERSONA = '1'
        AND SANC.FLG_PRINCIPAL = '1'

  LEFT JOIN T_SCOB_PERSONA PERS
        ON PERS.ID_PERSONA = SANC.ID_PERSONA
        AND PERS.COD_SANCIONADO IS NOT NULL

  LEFT JOIN T_SCOB_USUARIO USU
       ON UPPER(TRIM(MEST.AUDUSUCREACION)) = UPPER(TRIM(USU.USUARIO))

  WHERE
    MULT.ID_MULTA = PI_N_ID_MULTA
    AND MULT.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
    AND MEST.ESTADO_MULTA NOT IN (9,10,11,12,13)
  ORDER BY MDET.ID_MULTA_DETAL DESC, MEST.ID_MULTA_ESTADO DESC;

end;

procedure SCOB_SP_I_MULTA_CHECK
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 24.02.2011
-- Proposito    : insertar los documentos checklist de la multa by instancia
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA            IN T_SCOB_MULTA.ID_MULTA%TYPE,
  PI_N_ID_MULTA_DETAL      IN T_SCOB_MULTA_CHECK.ID_MULTA_DETAL%TYPE,
  PI_V_COD_TIPO_DOC        IN VARCHAR2,
  PI_V_MARCA_TIPO_DOC      IN VARCHAR2,
  PI_N_NRO_ITEMS           IN NUMBER,
  PI_V_DES_OTRO            IN T_SCOB_MULTA_CHECK.DES_OTRO%TYPE,
  PI_V_AUDUSUCREACION      IN T_SCOB_MULTA_CHECK.AUDUSUCREACION%TYPE,
  PI_N_ID_MULTA_COBRANZA   IN T_SCOB_MULTA_COBRANZA.ID_MULTA_COBRANZA%TYPE,
  PI_N_NRO_FOLIO           IN T_SCOB_MULTA.NRO_FOLIO%TYPE,
  po_n_retorno             out number,
  po_n_cod_error           out number,
  po_v_msj_error           out varchar2
)
is
  N_ID_MULTA_CHECKLIST     T_SCOB_MULTA_CHECK.ID_MULTA_CHECK%TYPE;
  N_CONT                   NUMBER;
  V_COD_TIPO_DOCUMENTO     VARCHAR(50);
  I_EXISTE                 INTEGER;
  C_IND_MARCA              CHAR(1);
begin
  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  --insertar los documentos seleccionados
  N_CONT := 1;
  WHILE (N_CONT <= PI_N_NRO_ITEMS)
  LOOP

    SCOB_PK_UTILITARIO.SCOB_SP_S_SPLIT(PI_V_COD_TIPO_DOC,'|', N_CONT+1, V_COD_TIPO_DOCUMENTO);
    SCOB_PK_UTILITARIO.SCOB_SP_S_SPLIT(PI_V_MARCA_TIPO_DOC,'|', N_CONT+1, C_IND_MARCA);

    IF V_COD_TIPO_DOCUMENTO='#' THEN
       EXIT;
    END IF;

    --verifica si existe el registro
    SELECT COUNT(MCHE.ID_MULTA_CHECK) INTO I_EXISTE
    FROM T_SCOB_MULTA_CHECK MCHE
    WHERE MCHE.ID_MULTA_DETAL = PI_N_ID_MULTA_DETAL
    AND MCHE.COD_TIPO_DOCUMENTO = TO_NUMBER(V_COD_TIPO_DOCUMENTO)
    AND MCHE.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO;

    IF I_EXISTE = 0 THEN --no existe el registro: inserta
    BEGIN
       SELECT SCOB_SQ_MULTA_CHECK.NEXTVAL INTO N_ID_MULTA_CHECKLIST FROM dual;
       INSERT INTO T_SCOB_MULTA_CHECK(
          ID_MULTA_CHECK,
          ID_MULTA_DETAL,
          COD_TIPO_DOCUMENTO,
          IND_MARCADO,
          DES_OTRO,
          ESTADO,
          AUDFECCREACION,
          AUDUSUCREACION,
          ID_MULTA_COBRANZA
       )
       VALUES(
          N_ID_MULTA_CHECKLIST,
          PI_N_ID_MULTA_DETAL,
          V_COD_TIPO_DOCUMENTO,
          C_IND_MARCA,
          DECODE(TO_NUMBER(V_COD_TIPO_DOCUMENTO), SCOB_PK_CONSTANTES.C_TBL_TIPO_DOCUMENTO_OTRO, PI_V_DES_OTRO, NULL),
          SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO,
          SYSDATE,
          PI_V_AUDUSUCREACION,
          DECODE(PI_N_ID_MULTA_COBRANZA,0,NULL,PI_N_ID_MULTA_COBRANZA)
       );
    END;
    ELSE

       --actualiza la descripcion del tipo documento: otro
       UPDATE T_SCOB_MULTA_CHECK
       SET
         IND_MARCADO = C_IND_MARCA,
         DES_OTRO = DECODE(SCOB_PK_CONSTANTES.C_TBL_TIPO_DOCUMENTO_OTRO,TO_NUMBER(V_COD_TIPO_DOCUMENTO),PI_V_DES_OTRO,NULL),
         AUDFECMODIFICACION = SYSDATE,
         AUDUSUMODIFICACION = PI_V_AUDUSUCREACION
       WHERE T_SCOB_MULTA_CHECK.ID_MULTA_DETAL = PI_N_ID_MULTA_DETAL
       AND T_SCOB_MULTA_CHECK.COD_TIPO_DOCUMENTO = TO_NUMBER(V_COD_TIPO_DOCUMENTO)
       AND T_SCOB_MULTA_CHECK.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO;
    END IF;

    --ACTUALIZA EL NRO DE FOLIO
    UPDATE T_SCOB_MULTA MULT
    SET
      MULT.NRO_FOLIO = PI_N_NRO_FOLIO,
      AUDFECMODIFICACION = SYSDATE,
      AUDUSUMODIFICACION = PI_V_AUDUSUCREACION
    WHERE MULT.ID_MULTA = PI_N_ID_MULTA;

    N_CONT := N_CONT + 1;
  END LOOP;

  po_n_cod_error := 0;
  po_n_retorno := PI_N_ID_MULTA_DETAL;
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

procedure SCOB_SP_S_MULTA_CHECK
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 25.02.2011
-- Proposito    : consulta los documentos checklist seleccionados de la multa por nivel.
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_MULTA               IN T_SCOB_MULTA.ID_MULTA%TYPE,
  PI_N_ID_MULTA_DETAL      IN T_SCOB_MULTA_CHECK.ID_MULTA_DETAL%TYPE,
  po_cu_retorno            out cu_rec_set
)
as
begin
  open  po_cu_retorno for

  SELECT
    TTDD.COD_INTERNO AS COD_TIPO_DOCUMENTO,
    TTDD.TXT_DESCRIPCION AS NOM_TIPO_DOCUMENTO,
    DECODE(MCHE.COD_TIPO_DOCUMENTO,NULL,'0','1') AS IND_TIPO_DOCUMENTO,
    MCHE.IND_MARCADO AS IND_MARCADO,
    MCHE.DES_OTRO AS DES_OTRO_TIPO_DOCUMENTO,
    MULT.NRO_FOLIO AS NRO_FOLIO,
    MCHE.AUDUSUCREACION AS AUDUSUCREACION,
    TTDD.TXT_VALOR1 AS FLG_OBLIGATORIO,
    MCHE.AUDUSUMODIFICACION AS AUDUSUMODIFICACION
  FROM T_SCOB_TABLA_DET TTDD
  LEFT JOIN T_SCOB_MULTA_DETAL MDET
       ON MDET.ID_MULTA = PI_N_MULTA
  LEFT JOIN T_SCOB_MULTA_CHECK MCHE
       ON MCHE.COD_TIPO_DOCUMENTO = TO_NUMBER(TTDD.COD_INTERNO)
       AND MCHE.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL
       AND MCHE.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
  LEFT JOIN T_SCOB_MULTA MULT
       ON MULT.ID_MULTA = MDET.ID_MULTA
  WHERE TTDD.ID_TABLA = SCOB_PK_CONSTANTES.C_TBL_DOCUMENTO_CHECKLIST
  AND (NVL(PI_N_ID_MULTA_DETAL,0)=0 OR (NVL(PI_N_ID_MULTA_DETAL,0)<>0 AND MDET.ID_MULTA_DETAL = PI_N_ID_MULTA_DETAL))
  AND TTDD.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
  ORDER BY TTDD.COD_INTERNO;

end;

procedure SCOB_SP_S_MULTA_SANC_DIREC
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
(
  PI_N_ID_MULTA_DETAL      IN T_SCOB_MULTA_SANCIONADO.ID_MULTA_DETAL%TYPE,
  PI_N_ID_MULTA_SANCIONADO IN T_SCOB_MULTA_SANCIONADO.ID_MULTA_SANCIONADO%TYPE,
  po_cu_retorno            out cu_rec_set
)
as
begin
  open  po_cu_retorno for

  SELECT
      MSAN.ID_MULTA_SANCIONADO AS COD_SANCIONADO,
      DECODE(PERS.TIPO_PERSONA,SCOB_PK_CONSTANTES.C_TIPO_PERS_JURIDICA,  PERS.RAZON_SOCIAL, PERS.APE_PATERNO  || ' ' || PERS.APE_MATERNO  || ' ' ||  PERS.PRI_NOMBRE || ' ' || PERS.SEG_NOMBRE || ' ' || PERS.APE_CASADA) AS NOM_SANCIONADO,
      PDOM.ID_PERSONA_DOMICILIO AS COD_DIRECCION_SANCIONADO,
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
      DECODE(MDIR.ID_MULTA_SANCIONADO_DIREC, NULL, '0', '1') AS IND_DIRECCION,
      PDOM.TIPO_DOMICILIO AS TIPO_DOMICILIO,
      TTDOM.DESCRIPCION AS NOM_TIPO_DOMICILIO

  FROM T_SCOB_MULTA_SANCIONADO MSAN

  INNER JOIN T_SCOB_PERSONA PERS
       ON PERS.ID_PERSONA = MSAN.ID_PERSONA

  LEFT JOIN T_SCOB_PERSONA_DOMICILIO PDOM
       ON PDOM.ID_PERSONA = MSAN.ID_PERSONA
       AND PDOM.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO

  LEFT JOIN T_SCOB_TIPO_DOMICILIO TTDOM
       ON TTDOM.ID_TIPO_DOMICILIO = PDOM.TIPO_DOMICILIO

  LEFT JOIN T_SCOB_UBIGEO UBIG
       ON UBIG.ID_UBIGEO = PDOM.ID_UBIGEO

  LEFT JOIN T_SCOB_MULTA_SANCIONADO_DIREC MDIR
       ON MDIR.ID_MULTA_SANCIONADO = MSAN.ID_MULTA_SANCIONADO
       AND MDIR.ID_PERSONA_DOMICILIO = PDOM.ID_PERSONA_DOMICILIO
       AND MDIR.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO

  LEFT JOIN T_SCOB_TABLA_DET TVIA
        ON TVIA.ID_TABLA = SCOB_PK_CONSTANTES.C_TBL_DIRECCION_TIPO_VIA
        AND TVIA.COD_INTERNO = PDOM.TIPO_VIA

  LEFT JOIN T_SCOB_TABLA_DET TZONA
        ON TZONA.ID_TABLA = SCOB_PK_CONSTANTES.C_TBL_DIRECCION_TIPO_ZONA
        AND TZONA.COD_INTERNO = PDOM.TIPO_ZONA

  WHERE MSAN.ID_MULTA_DETAL =PI_N_ID_MULTA_DETAL
  AND NVL(MSAN.COD_TIPO_PERSONA,'1')=1 --SANCIONADO
  AND (NVL(PI_N_ID_MULTA_SANCIONADO,0)=0 OR (NVL(PI_N_ID_MULTA_SANCIONADO,0)<>0 AND MSAN.ID_MULTA_SANCIONADO = PI_N_ID_MULTA_SANCIONADO))
  AND MSAN.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
  ;

end;

procedure SCOB_SP_I_MULTA_SANC_DIREC
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 01.03.2011
-- Proposito    : insertar las direcciones de los sancionados por multa
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA_SANCIONADO           IN T_SCOB_MULTA_SANCIONADO_DIREC.ID_MULTA_SANCIONADO%TYPE,
  PI_V_ID_PERSONA_DOMICILIO          IN VARCHAR2,
  PI_N_NRO_ITEMS                     IN NUMBER,
  PI_V_AUDUSUCREACION                IN T_SCOB_MULTA_SANCIONADO_DIREC.AUDUSUCREACION%TYPE,

  po_n_retorno                       out number,
  po_n_cod_error                     out number,
  po_v_msj_error                     out varchar2
)
is
  N_ID_MULTA_SANCIONADO_DIREC        T_SCOB_MULTA_SANCIONADO_DIREC.ID_MULTA_SANCIONADO_DIREC%TYPE;
  N_CONT                             NUMBER;
  V_ID_PERSONA_DOMICILIO             VARCHAR(50);
  I_EXISTE                           INTEGER;

begin
  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  --actualiza a eliminado las direcciones no seleccionadas de la multa
  UPDATE T_SCOB_MULTA_SANCIONADO_DIREC
  SET
    AUDUSUMODIFICACION = PI_V_AUDUSUCREACION,
    AUDFECMODIFICACION = SYSDATE,
    ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_INACTIVO
  WHERE
    ID_MULTA_SANCIONADO = PI_N_ID_MULTA_SANCIONADO
    AND INSTR(PI_V_ID_PERSONA_DOMICILIO,'|' || TO_CHAR(ID_PERSONA_DOMICILIO) || '|' )=0
    AND ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO;

  --insertar los direcciones seleccionados
  N_CONT := 1;
  WHILE (N_CONT <= PI_N_NRO_ITEMS)
  LOOP

     SCOB_PK_UTILITARIO.SCOB_SP_S_SPLIT(PI_V_ID_PERSONA_DOMICILIO,'|', N_CONT+1, V_ID_PERSONA_DOMICILIO);

     IF V_ID_PERSONA_DOMICILIO='#' THEN
        EXIT;
     END IF;

     IF V_ID_PERSONA_DOMICILIO = 0 THEN
        po_v_msj_error :='No se puede realizar la accion. Debe verificar si existen direcciones del sancionado.';
        po_n_retorno := -10;
        po_n_cod_error := po_n_retorno;
        return;
     END IF;

     --VERIFICAR SI LA DIRECCION EXISTE
     I_EXISTE := 0;
     SELECT COUNT(MSDIR.ID_MULTA_SANCIONADO_DIREC)
     INTO I_EXISTE
     FROM T_SCOB_MULTA_SANCIONADO_DIREC MSDIR
     WHERE MSDIR.ID_MULTA_SANCIONADO = PI_N_ID_MULTA_SANCIONADO
     AND MSDIR.ID_PERSONA_DOMICILIO = TO_NUMBER(V_ID_PERSONA_DOMICILIO);

     IF I_EXISTE > 0 THEN --SI EXISTE ACTUALIZA
        UPDATE T_SCOB_MULTA_SANCIONADO_DIREC
        SET
          AUDUSUMODIFICACION = PI_V_AUDUSUCREACION,
          AUDFECMODIFICACION = SYSDATE,
          ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
       WHERE ID_MULTA_SANCIONADO = PI_N_ID_MULTA_SANCIONADO
       AND ID_PERSONA_DOMICILIO = TO_NUMBER(V_ID_PERSONA_DOMICILIO);

     ELSE --SINO, INSERTA
         SELECT SCOB_SQ_MULTA_SANCIONADO_DIREC.NEXTVAL INTO N_ID_MULTA_SANCIONADO_DIREC FROM dual;
         INSERT INTO T_SCOB_MULTA_SANCIONADO_DIREC(
            ID_MULTA_SANCIONADO_DIREC,
            ID_MULTA_SANCIONADO,
            ID_PERSONA_DOMICILIO,
            ESTADO,
            AUDFECCREACION,
            AUDUSUCREACION
         )
         VALUES(
            N_ID_MULTA_SANCIONADO_DIREC,
            PI_N_ID_MULTA_SANCIONADO,
            TO_NUMBER(V_ID_PERSONA_DOMICILIO),
            SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO,
            SYSDATE,
            PI_V_AUDUSUCREACION
         );
     END IF;
     N_CONT := N_CONT + 1;
  END LOOP;

  po_n_cod_error := 0;
  po_n_retorno := PI_N_ID_MULTA_SANCIONADO;
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

procedure SCOB_SP_I_MULTA_DOCUMENTO
/******************************************************************  
‘* Nombre             : SCOB_SP_I_MULTA_DOCUMENTO
'* Parámetros         : PI_N_ID_MULTA            : id de la multa
                        PI_N_ID_MULTA_DETAL      : id detalle de la multa
                        PI_V_TITULO              : Titulo del documento
                        PI_V_NOMBRE              : Nombre del documento
                        PI_N_TAMANIO             : Tamaño del archivo
                        PI_I_TIPO_DOC_ASOC       : Tipo de Documento (1=Adjuntos;2=Generado por el sistema)
                        PI_V_AUDUSUCREACION      : Usuario que creo el registro
                        PI_N_ID_MULTA_COBRANZA   : Id de la cobranza coactiva
                        po_n_retorno             : Codigo de Error del procedimiento (0=Exito, -1=Error)
                        po_n_cod_error           : Código de Error de la base de datos
                        po_v_msj_error           : Descripción del mensaje de Error de la base de datos
'* Propósito          : Insertar los documentos adjuntos a una multa
'* Output             : Documento adjunto registrado. 
'* Creado por         : RMCA - COSAPI
'* Fec Creación       : 25.02.2011
----------------------------------------------------------------
'* Modificado por     : JCARRION
'* Fec Actualización  : 03.07.2020
‘* Observación        : TK157893 - Se comenta la regla de validación que impide que se adjunten documentos en los siguientes estados de la multa:
                        SCOB_PK_CONSTANTES.C_EST_MULT_CONSENTIDA,
                        SCOB_PK_CONSTANTES.C_EST_MULT_FIRME,
                        SCOB_PK_CONSTANTES.C_EST_MULT_REVISADA
'****************************************************************/ 

(
  PI_N_ID_MULTA                           IN T_SCOB_MULTA.ID_MULTA%TYPE,
  PI_N_ID_MULTA_DETAL                     IN T_SCOB_MULTA_DETAL.ID_MULTA_DETAL%TYPE,
  PI_V_TITULO                             IN T_SCOB_MULTA_DOCUMENTO.TITULO%TYPE,
  PI_V_NOMBRE                             IN T_SCOB_MULTA_DOCUMENTO.NOMBRE%TYPE,
  PI_N_TAMANIO                            IN T_SCOB_MULTA_DOCUMENTO.TAMANIO%TYPE,
  PI_I_TIPO_DOC_ASOC                      IN T_SCOB_MULTA_DOCUMENTO.TIPO_DOC_ASOC%TYPE,
  PI_V_AUDUSUCREACION                     IN T_SCOB_MULTA_DOCUMENTO.AUDUSUCREACION%TYPE,
  PI_N_ID_MULTA_COBRANZA                  IN T_SCOB_MULTA_COBRANZA.ID_MULTA_COBRANZA%TYPE,
  po_n_retorno                            out number,
  po_n_cod_error                          out number,
  po_v_msj_error                          out varchar2
)
is
  N_ID_MULTA_DOCUMENTO                    T_SCOB_MULTA_DOCUMENTO.ID_MULTA_DOCUMENTO%TYPE;
  I_ESTADO_MULTA                          T_SCOB_MULTA.ESTADO_MULTA%TYPE;
  C_FLG_MULTA_RESOLUTIVO                  T_SCOB_MULTA.FLG_MULTA_RESOLUTIVO%TYPE;

begin
  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  SELECT MULT.ESTADO_MULTA, MULT.FLG_MULTA_RESOLUTIVO
  INTO I_ESTADO_MULTA, C_FLG_MULTA_RESOLUTIVO
  FROM T_SCOB_MULTA MULT
  WHERE MULT.ID_MULTA = PI_N_ID_MULTA;  

  SELECT SCOB_SQ_MULTA_DOCUMENTO.NEXTVAL INTO N_ID_MULTA_DOCUMENTO FROM dual;
  INSERT INTO T_SCOB_MULTA_DOCUMENTO(
    ID_MULTA_DOCUMENTO,
    TITULO,
    NOMBRE,
    TAMANIO,
    TIPO_DOC_ASOC,
    ID_MULTA,
    ID_MULTA_DETAL,
    ESTADO_MULTA,
    ESTADO,
    AUDFECCREACION,
    AUDUSUCREACION,
    ID_MULTA_COBRANZA
  )
  VALUES(
    N_ID_MULTA_DOCUMENTO,
    PI_V_TITULO,
    PI_V_NOMBRE,
    PI_N_TAMANIO,
    PI_I_TIPO_DOC_ASOC,
    PI_N_ID_MULTA,
    PI_N_ID_MULTA_DETAL,
    I_ESTADO_MULTA,
    SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO,
    SYSDATE,
    PI_V_AUDUSUCREACION,
    DECODE(PI_N_ID_MULTA_COBRANZA,0,NULL,PI_N_ID_MULTA_COBRANZA)
  );

  po_n_cod_error := 0;
  po_n_retorno := PI_N_ID_MULTA;
  commit;

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

procedure SCOB_SP_D_MULTA_DOCUMENTO
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 25.02.2011
-- Proposito    : actualiza al estado eliminado los documentos seleccionados
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_V_ID_MULTA_DOCUMENTO     IN VARCHAR2,
  PI_V_AUDUSUCREACION         IN T_SCOB_MULTA_DOCUMENTO.AUDUSUCREACION%TYPE,

  po_n_retorno                out number,
  po_n_cod_error              out number,
  po_v_msj_error              out varchar2
)
is
  N_ID_MULTA_DETAL_ACTUAL     T_SCOB_MULTA_DETAL.ID_MULTA_DETAL%TYPE;
  N_ID_MULTA                  T_SCOB_MULTA.ID_MULTA%TYPE;
  I_EXISTE                    INTEGER;
begin
  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  --obtener los datos de la multa
  SELECT DISTINCT MDOC.ID_MULTA
  INTO N_ID_MULTA
  FROM T_SCOB_MULTA_DOCUMENTO MDOC
  WHERE INSTR(PI_V_ID_MULTA_DOCUMENTO,'|' || TO_CHAR(MDOC.ID_MULTA_DOCUMENTO) || '|' )>0;

  --obtener la ultima instancia de la multa
  SELECT MDET.ID_MULTA_DETAL
  INTO N_ID_MULTA_DETAL_ACTUAL
  FROM T_SCOB_MULTA_DETAL MDET
  WHERE MDET.ID_MULTA = N_ID_MULTA
  AND MDET.FLG_ACTUAL = '1'
  AND MDET.ESTADO = '1';

  --obtener si algun documento seleccionado corresponde a otra instancia de la multa
  SELECT COUNT(MDOC.ID_MULTA_DOCUMENTO)
  INTO I_EXISTE
  FROM T_SCOB_MULTA_DOCUMENTO MDOC
  WHERE INSTR(PI_V_ID_MULTA_DOCUMENTO,'|' || TO_CHAR(MDOC.ID_MULTA_DOCUMENTO) || '|' )>0
  AND MDOC.ID_MULTA_DETAL <> N_ID_MULTA_DETAL_ACTUAL;

  IF I_EXISTE > 0 THEN
    po_v_msj_error :='No se puede realizar la accion. Solo se pueden eliminar documentos de la instancia actual de la multa.';
    po_n_retorno := -10;
    po_n_cod_error := po_n_retorno;
    return;
  END IF;

  UPDATE T_SCOB_MULTA_DOCUMENTO
  SET
    AUDUSUMODIFICACION = PI_V_AUDUSUCREACION,
    AUDFECMODIFICACION = SYSDATE,
    ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_INACTIVO
  WHERE INSTR(PI_V_ID_MULTA_DOCUMENTO,'|' || TO_CHAR(ID_MULTA_DOCUMENTO) || '|' )>0;

  po_n_cod_error := 0;
  po_n_retorno := 0;
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

procedure SCOB_SP_S_MULTA_DOCUMENTO
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 25.02.2011
-- Proposito    : consulta los documentos asociados a una multa or
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA            IN T_SCOB_MULTA.ID_MULTA%TYPE,
  PI_N_ID_MULTA_DETAL      IN T_SCOB_MULTA_DETAL.ID_MULTA_DETAL%TYPE, --opcional si se desea ver todos.
  PI_I_TIPO_DOC_ASOC       IN T_SCOB_MULTA_DOCUMENTO.TIPO_DOC_ASOC%TYPE,
  po_cu_retorno            out cu_rec_set
)
as
begin
  open  po_cu_retorno for

  SELECT
        SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_TIPO_INSTANCIA,ORGR.TIPO_INSTANCIA) AS NOM_INSTANCIA,
        MDOC.ID_MULTA_DOCUMENTO AS ID_DOCUMENTO,
        MDOC.TITULO AS TIT_DOCUMENTO,
        MDOC.NOMBRE AS NOM_DOCUMENTO,
        MDOC.TAMANIO AS TMN_DOCUMENTO
  FROM T_SCOB_MULTA_DOCUMENTO MDOC
  INNER JOIN T_SCOB_MULTA_DETAL MDET
        ON MDET.ID_MULTA_DETAL = MDOC.ID_MULTA_DETAL
        AND MDET.ID_MULTA = PI_N_ID_MULTA
  INNER JOIN T_SCOB_ORGANO_RESOLUTIVO ORGR
        ON ORGR.ID_ORGANO_RESOLUTIVO = MDET.ID_ORGANO_RESOLUTIVO
  WHERE
  (NVL(PI_N_ID_MULTA_DETAL,0)=0 OR (NVL(PI_N_ID_MULTA_DETAL,0)<>0 AND MDOC.ID_MULTA_DETAL = PI_N_ID_MULTA_DETAL))
  AND (NVL(PI_I_TIPO_DOC_ASOC,0)=0 OR (NVL(PI_I_TIPO_DOC_ASOC,0)<>0 AND MDOC.TIPO_DOC_ASOC = PI_I_TIPO_DOC_ASOC))
  AND MDOC.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
  ORDER BY MDOC.TITULO;

end;

procedure SCOB_SP_S_INI_DAT_MULTA_BY_USU
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 18.02.2011
-- Proposito    :
1. Inicializa los datos base para registrar una multa de acuerdo al usuario que ingresa al sistema.
2. El usuario debe ser del area: resolutivo
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_USUARIO                           IN T_SCOB_USUARIO.ID_USUARIO%TYPE,
  PI_N_ID_MULTA                             IN T_SCOB_MULTA.ID_MULTA%TYPE,
                                            --SI ENVIA ID_MULTA, PASA AL SIGUIENTE NIVEL
                                            --SI NO SE ENVIA, ESTARIA CREANDO UNA NUEVA MULTA
  po_cu_retorno                             out cu_rec_set,
  po_n_retorno                              out number,
  po_n_cod_error                            out number,
  po_v_msj_error                            out varchar2
)
as
  N_TIPO_INSTANCIA_INICIA                   T_SCOB_ORGANO_RESOLUTIVO.TIPO_INSTANCIA%TYPE;
  N_TIPO_INSTANCIA_ACTUAL                   T_SCOB_ORGANO_RESOLUTIVO.TIPO_INSTANCIA%TYPE;
  V_NOM_TIPO_INSTANCIA_ACTUAL               VARCHAR2(250);
  N_ID_ORGANO_RESOLUTIVO_USUARIO            T_SCOB_ORGANO_RESOLUTIVO.ID_ORGANO_RESOLUTIVO%TYPE;
  V_NO_ORGANO_RESOLUTIVO_USUARIO            T_SCOB_ORGANO_RESOLUTIVO.DESCRIPCION%TYPE;
  I_EXISTE                                  INTEGER;
  C_FLG_TIPO_MULTA                          T_SCOB_MULTA.FLG_TIPO_MULTA%TYPE;
  N_ID_MATERIA                              T_SCOB_MULTA.ID_MATERIA%TYPE;
begin

  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := 0;
  C_FLG_TIPO_MULTA := '0';
  N_ID_MATERIA := 0;
  I_EXISTE := 0;

  --obtener la instancia del usuario
  BEGIN

    SELECT
      TIPO_INSTANCIA,
      SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_TIPO_INSTANCIA,COD_ORGANO_RESOLUTIVO),
      COD_ORGANO_RESOLUTIVO ,
      NOM_ORGANO_RESOLUTIVO
    INTO
       N_TIPO_INSTANCIA_ACTUAL,
       V_NOM_TIPO_INSTANCIA_ACTUAL,
       N_ID_ORGANO_RESOLUTIVO_USUARIO,
       V_NO_ORGANO_RESOLUTIVO_USUARIO
    FROM (
      SELECT
        USOR.ID_ORGANO_RESOLUTIVO AS COD_ORGANO_RESOLUTIVO,
        ORGR.DESCRIPCION AS NOM_ORGANO_RESOLUTIVO,
        ORGR.TIPO_INSTANCIA AS TIPO_INSTANCIA
      FROM T_SCOB_USUARIO_OR USOR
      INNER JOIN T_SCOB_ORGANO_RESOLUTIVO ORGR
            ON ORGR.ID_ORGANO_RESOLUTIVO = USOR.ID_ORGANO_RESOLUTIVO
      WHERE USOR.ID_USUARIO = PI_N_ID_USUARIO
      AND USOR.ESTADO = '1'
      AND ORGR.TIPO_INSTANCIA IN (1,2) --NIVEL 1 Y 2.
      ORDER BY ORGR.DESCRIPCION
    ) ORG_RESOL
    WHERE ROWNUM = 1;

  EXCEPTION WHEN NO_DATA_FOUND THEN
    I_EXISTE := -1;
  END;

  IF I_EXISTE < 0 THEN
    raise_application_error (-20002,'El usuario no corresponde al area de organismo resolutivo.');
  END IF;

  IF N_TIPO_INSTANCIA_ACTUAL = SCOB_PK_CONSTANTES.C_TBL_TIPO_INSTANCIA_SALA AND
     NVL(PI_N_ID_MULTA,0)=0
  THEN
     raise_application_error (-20002,'El usuario de SALA no puede registrar una multa.');
  END IF;

  IF NVL(PI_N_ID_MULTA,0)=0 THEN
     --setea como instancia inicial la instancia asignada al usuario
     N_TIPO_INSTANCIA_INICIA := N_TIPO_INSTANCIA_ACTUAL;
  ELSE
     --obtiene el estado inicial de la multa
     SELECT MULT.TIPO_INSTANCIA_INICIA, MULT.FLG_TIPO_MULTA, MULT.ID_MATERIA
     INTO N_TIPO_INSTANCIA_INICIA, C_FLG_TIPO_MULTA, N_ID_MATERIA
     FROM T_SCOB_MULTA MULT
     WHERE MULT.ID_MULTA = PI_N_ID_MULTA;
  END IF;

  open  po_cu_retorno for
  SELECT
    N_ID_ORGANO_RESOLUTIVO_USUARIO AS COD_ORGANO_RESOLUTIVO,
    V_NO_ORGANO_RESOLUTIVO_USUARIO AS NOM_ORRGANO_RESOLUTIVO,
    N_TIPO_INSTANCIA_INICIA AS COD_INSTANCIA_INICIAL,
    N_TIPO_INSTANCIA_ACTUAL AS COD_INSTANCIA, --es la instancia con la que se inicia el registro de la multa.
    V_NOM_TIPO_INSTANCIA_ACTUAL AS NOM_INSTANCIA,
    EINS.COD_ESTADO AS COD_ESTADO_INSTANCIA,
    SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_ESTADO_MULTA,EINS.COD_ESTADO) AS NOM_ESTADO_INSTANCIA,
    C_FLG_TIPO_MULTA AS FLG_TIPO_MULTA,
    N_ID_MATERIA AS COD_MATERIA
  FROM T_SCOB_ESTADO_INSTANCIA EINS
  WHERE
       EINS.TIPO_INSTANCIA_INICIA = N_TIPO_INSTANCIA_INICIA
       AND EINS.TIPO_INSTANCIA = N_TIPO_INSTANCIA_ACTUAL
       AND EINS.NRO_SECUENCIA = 1
       AND EINS.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO;

exception
  when others then
    IF sqlcode = -20002 THEN
      po_n_cod_error := -10;
      po_v_msj_error := substr(sqlerrm,1,250);
      open  po_cu_retorno for
      SELECT
        NULL AS COD_ORGANO_RESOLUTIVO,
        NULL AS NOM_ORRGANO_RESOLUTIVO,
        NULL AS COD_INSTANCIA_INICIAL,
        NULL AS COD_INSTANCIA,
        NULL AS NOM_INSTANCIA,
        NULL AS COD_ESTADO_INSTANCIA,
        NULL AS NOM_ESTADO_INSTANCIA,
        NULL AS FLG_TIPO_MULTA,
        NULL AS COD_MATERIA
      FROM DUAL;
    END IF;
end;

procedure SCOB_SP_U_MULTA_DUPLICA_DATA
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 02.03.2011
-- Proposito    :

1. REALIZA EL SALTO DE INSTANCIA O ESTADO AUTOMATICO
2. SE ASUME QUE SE HA CAMBIADO EL ESTADO ACTUAL DE LA MULTA,
   Y LA EVALUACION DEL SALTO DE INSTANCIA SE REALIZARA A
   PARTIR DE ESTE NUEVO ESTADO.
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA                           IN T_SCOB_MULTA.ID_MULTA%TYPE,
  PI_N_ID_MULTA_DETAL_ANT                 IN T_SCOB_MULTA_DETAL.ID_MULTA_DETAL%TYPE,
  PI_N_ID_MULTA_DETAL_ACT                 IN T_SCOB_MULTA_DETAL.ID_MULTA_DETAL%TYPE,
  PI_I_ESTADO_MULTA                       IN T_SCOB_MULTA.ESTADO_MULTA%TYPE,
  PI_V_AUDUSUMODIFICACION                 IN T_SCOB_MULTA.AUDUSUMODIFICACION%TYPE,
  po_n_retorno                            out number,
  po_n_cod_error                          out number,
  po_v_msj_error                          out varchar2
)
is
begin
  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  --DUPLICA LOS REGISTROS PARA PASAR AL SIGUIENTE NIVEL.
  --1. ACTUALIZA EL ESTADO DE LA MULTA DEL NIVEL ANTERIOR
  --   ACTUALIZAR LAS SUMATORIAS DE LA MULTA DEL NIVEL ANTERIOR.
  UPDATE T_SCOB_MULTA_DETAL MNUE
  SET (
      MNUE.VALOR_UIT, MNUE.MONTO_UIT, MNUE.POR_ASOCU, MNUE.MONTO_ASOCU,
      MNUE.NRO_EXPED_ANTIGUO,
      MNUE.ANIO_EXPED_ANTIGUO,
      MNUE.ID_SIGLA,
      MNUE.COD_SIGLA,
      MNUE.DES_SIGLA,
      MNUE.ID_TIPO_EXPED_ANTIGUO,
      MNUE.COD_TIPO_EXPED_ANTIGUO,
      MNUE.DES_TIPO_EXPED_ANTIGUO,
      MNUE.NRO_EXPED_ANTIGUO_ID,
      MNUE.NRO_EXP_NIVEL
    ) =
    (SELECT
      MANT.VALOR_UIT, MANT.MONTO_UIT, MANT.POR_ASOCU, MANT.MONTO_ASOCU,
      MANT.NRO_EXPED_ANTIGUO,
      MANT.ANIO_EXPED_ANTIGUO,
      MANT.ID_SIGLA,
      MANT.COD_SIGLA,
      MANT.DES_SIGLA,
      MANT.ID_TIPO_EXPED_ANTIGUO,
      MANT.COD_TIPO_EXPED_ANTIGUO,
      MANT.DES_TIPO_EXPED_ANTIGUO,
      MANT.NRO_EXPED_ANTIGUO_ID,
      MANT.NRO_EXP_NIVEL
     FROM T_SCOB_MULTA_DETAL MANT
     WHERE MANT.ID_MULTA_DETAL = PI_N_ID_MULTA_DETAL_ANT)
  WHERE MNUE.ID_MULTA_DETAL = PI_N_ID_MULTA_DETAL_ACT;

  --2.REGISTROS DE T_SCOB_MULTA_DENUNCIANTE
  INSERT INTO T_SCOB_MULTA_DENUNCIANTE(
    ID_MULTA_DENUNCIANTE,
    ID_MULTA_DETAL,
    ID_PERSONA,
    ESTADO,
    AUDFECCREACION,
    AUDUSUCREACION
  )
  SELECT
    SCOB_SQ_MULTA_DENUNCIANTE.NEXTVAL,
    PI_N_ID_MULTA_DETAL_ACT,
    MDEN.ID_PERSONA,
    MDEN.ESTADO,
    SYSDATE,
    PI_V_AUDUSUMODIFICACION
  FROM T_SCOB_MULTA_DETAL MDET
  INNER JOIN T_SCOB_MULTA_DENUNCIANTE MDEN
        ON MDEN.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL
        AND MDEN.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
  WHERE
  MDET.ID_MULTA = PI_N_ID_MULTA
  AND MDET.ID_MULTA_DETAL = PI_N_ID_MULTA_DETAL_ANT;

  --3.REGISTROS DE T_SCOB_MULTA_SANCIONADO
  INSERT INTO T_SCOB_MULTA_SANCIONADO(
    ID_MULTA_SANCIONADO,
    ID_MULTA_DETAL,
    ID_PERSONA,
    ESTADO,
    AUDFECCREACION,
    AUDUSUCREACION,
    COD_TIPO_PERSONA,
    FLG_PRINCIPAL
  )
  SELECT
    SCOB_SQ_MULTA_SANCIONADO.NEXTVAL,
    PI_N_ID_MULTA_DETAL_ACT,
    MSAN.ID_PERSONA,
    MSAN.ESTADO,
    SYSDATE,
    PI_V_AUDUSUMODIFICACION,
    COD_TIPO_PERSONA,
    FLG_PRINCIPAL
  FROM T_SCOB_MULTA_DETAL MDET
  INNER JOIN T_SCOB_MULTA_SANCIONADO MSAN
        ON MSAN.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL
        AND MSAN.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
  WHERE
  MDET.ID_MULTA = PI_N_ID_MULTA
  AND MDET.ID_MULTA_DETAL = PI_N_ID_MULTA_DETAL_ANT;

  --4.REGISTROS DE T_SCOB_MULTA_SANCIONADO_DIREC
  INSERT INTO T_SCOB_MULTA_SANCIONADO_DIREC(
    ID_MULTA_SANCIONADO_DIREC,
    ID_MULTA_SANCIONADO,
    ID_PERSONA_DOMICILIO,
    ESTADO,
    AUDFECCREACION,
    AUDUSUCREACION
  )
  SELECT
    SCOB_SQ_MULTA_SANCIONADO_DIREC.NEXTVAL,
    MSAN.ID_MULTA_SANCIONADO,
    SDIR.ID_PERSONA_DOMICILIO,
    SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO,
    SYSDATE,
    PI_V_AUDUSUMODIFICACION
  FROM T_SCOB_MULTA_SANCIONADO MSAN
  INNER JOIN (
      SELECT
        MSDI.ID_PERSONA_DOMICILIO,
        MSAN.ID_PERSONA
      FROM T_SCOB_MULTA_SANCIONADO MSAN
      INNER JOIN T_SCOB_MULTA_SANCIONADO_DIREC MSDI
        ON MSDI.ID_MULTA_SANCIONADO = MSAN.ID_MULTA_SANCIONADO
        AND MSDI.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
      WHERE
        MSAN.ID_MULTA_DETAL = PI_N_ID_MULTA_DETAL_ANT
        AND MSAN.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
  ) SDIR
    ON SDIR.ID_PERSONA = MSAN.ID_PERSONA
  WHERE
  MSAN.ID_MULTA_DETAL = PI_N_ID_MULTA_DETAL_ACT
  AND MSAN.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO;

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

procedure SCOB_SP_S_LISTA_ESTADOS_MULTA
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 02.03.2011
-- Proposito    :

1. MUESTRA LA LISTA DE ESTADO POSIBLES DE UNA MULTA DE ACUERDO A LA INSTANCIA DONDE SE INICIA EL PROCESO
   Y DE ACUERDO A LA ACTUAL INSTANCIA DONDE SE ENCUENTRA.
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA                           IN T_SCOB_MULTA.ID_MULTA%TYPE,
  po_cu_retorno                           out cu_rec_set
)
is
  N_TIPO_INSTANCIA_INICIA                 T_SCOB_ORGANO_RESOLUTIVO.TIPO_INSTANCIA%TYPE;
  N_TIPO_INSTANCIA_ACTUAL                 T_SCOB_ORGANO_RESOLUTIVO.TIPO_INSTANCIA%TYPE;
  I_ESTADO_MULTA_ACTUAL                   T_SCOB_MULTA.ESTADO_MULTA%TYPE;

  I_NRO_SECUENCIA                         T_SCOB_ESTADO_INSTANCIA.NRO_SECUENCIA%TYPE;

begin

  --obtener los datos base de la multa
  SELECT
    MULT.TIPO_INSTANCIA_INICIA,
    ORGR.TIPO_INSTANCIA,
    MULT.ESTADO_MULTA
  INTO
    N_TIPO_INSTANCIA_INICIA,
    N_TIPO_INSTANCIA_ACTUAL,
    I_ESTADO_MULTA_ACTUAL
  FROM T_SCOB_MULTA MULT
  INNER JOIN T_SCOB_MULTA_DETAL MDET
        ON MDET.ID_MULTA = MULT.ID_MULTA
        AND MDET.FLG_ACTUAL = '1'
  INNER JOIN T_SCOB_ORGANO_RESOLUTIVO ORGR
        ON ORGR.ID_ORGANO_RESOLUTIVO = MDET.ID_ORGANO_RESOLUTIVO
  WHERE MULT.ID_MULTA = PI_N_ID_MULTA;

  --obtener los datos de secuencia del estado actual
  SELECT
    EINS.NRO_SECUENCIA
  INTO
    I_NRO_SECUENCIA
  FROM T_SCOB_ESTADO_INSTANCIA EINS
  WHERE EINS.TIPO_INSTANCIA_INICIA = N_TIPO_INSTANCIA_INICIA
  AND EINS.TIPO_INSTANCIA = N_TIPO_INSTANCIA_ACTUAL
  AND EINS.COD_ESTADO = I_ESTADO_MULTA_ACTUAL
  AND EINS.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO;

  open po_cu_retorno for

  SELECT
    I_ESTADO_MULTA_ACTUAL AS COD_ESTADO,
    SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_ESTADO_MULTA, I_ESTADO_MULTA_ACTUAL) AS NOM_ESTADO
  FROM DUAL
  UNION
  SELECT
    EINS.COD_ESTADO AS COD_ESTADO,
    SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_ESTADO_MULTA, EINS.COD_ESTADO) AS NOM_ESTADO
  FROM T_SCOB_ESTADO_INSTANCIA EINS
  WHERE
    EINS.TIPO_INSTANCIA_INICIA = N_TIPO_INSTANCIA_INICIA
    AND EINS.TIPO_INSTANCIA = N_TIPO_INSTANCIA_ACTUAL
    AND EINS.NRO_SECUENCIA > I_NRO_SECUENCIA
    AND EINS.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
    AND EINS.FLG_VISIBLE = '1';

end;

procedure SCOB_SP_S_SANC_DIREC_MULTA
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 04.03.2011
-- Proposito    : consulta los domicilios del sancionado en una multa
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA_DETAL      IN T_SCOB_MULTA_SANCIONADO.ID_MULTA_DETAL%TYPE,
  PI_C_FLG_PRINCIPAL       IN T_SCOB_MULTA_SANCIONADO.FLG_PRINCIPAL%TYPE, --opcional(1=solo el sancionado principal, '' o CERO, todos)
  po_cu_retorno            out cu_rec_set
)
as
begin
  open  po_cu_retorno for
  SELECT DISTINCT
      SANC.ID_MULTA_SANCIONADO AS ID_MULTA_SANCIONADO
      ,PDOM.ID_PERSONA_DOMICILIO AS COD_DIRECCION_SANCIONADO
      ,PDOM.TIPO_DOMICILIO AS COD_TIPO_DOMICILIO
      ,TTDOM.DESCRIPCION AS NOM_TIPO_DOMICILIO
      ,PDOM.TIPO_VIA AS ID_TIPO_VIA,
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
      PDOM.ID_PERSONA AS ID_PERSONA,
      SANC.FLG_PRINCIPAL as FLG_PRINCIPAL
  FROM T_SCOB_MULTA_SANCIONADO SANC
  INNER JOIN T_SCOB_MULTA_DETAL MDET
        ON SANC.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL
        AND MDET.ESTADO = '1'
        AND MDET.FLG_ACTUAL = '1'
  INNER JOIN T_SCOB_MULTA_SANCIONADO_DIREC MSDI
        ON MSDI.ID_MULTA_SANCIONADO = SANC.ID_MULTA_SANCIONADO
        AND MSDI.ESTADO = '1'
  INNER JOIN T_SCOB_PERSONA PERS
        ON PERS.ID_PERSONA = SANC.ID_PERSONA
        AND PERS.ESTADO = '1'
  INNER JOIN T_SCOB_PERSONA_DOMICILIO PDOM
        ON PDOM.ID_PERSONA_DOMICILIO = MSDI.ID_PERSONA_DOMICILIO
        AND PDOM.ID_PERSONA = PERS.ID_PERSONA
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
  WHERE SANC.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
  AND SANC.ID_MULTA_DETAL = PI_N_ID_MULTA_DETAL
  AND (PI_C_FLG_PRINCIPAL='0' OR (PI_C_FLG_PRINCIPAL<>'0' AND SANC.FLG_PRINCIPAL=PI_C_FLG_PRINCIPAL))
  ORDER BY  SANC.ID_MULTA_SANCIONADO, SANC.FLG_PRINCIPAL;
end;


procedure SCOB_SP_U_GENERACION_SEC
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 11.07.2011
-- Proposito    : actualiza la solicitud de generacion de la SEC
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA            IN T_SCOB_MULTA.ID_MULTA%TYPE,
  PI_V_AUDUSUMODIFICACION  IN T_SCOB_MULTA.AUDUSUMODIFICACION%TYPE,
  po_n_retorno             out number,
  po_n_cod_error           out number,
  po_v_msj_error           out varchar2
)
is
  I_EXISTE                 INTEGER;
  N_REG_OBLIGATORIOS       INTEGER;
  N_REG_MARCADOS           INTEGER;
  N_ID_MULTA_DETAL         INTEGER;
  I_ESTADO_MULTA           INTEGER;

begin
  po_v_msj_error :=' ';
  po_n_retorno := 0;
  po_n_cod_error := 0;

  --obtener la ultima instancia de la multa
  SELECT MDET.ID_MULTA_DETAL, MDET.ESTADO_MULTA
  INTO   N_ID_MULTA_DETAL, I_ESTADO_MULTA
  FROM T_SCOB_MULTA MULT
  INNER JOIN T_SCOB_MULTA_DETAL MDET
        ON MDET.ID_MULTA = MULT.ID_MULTA
        AND MDET.FLG_ACTUAL = '1'
        AND MDET.ESTADO = '1'
  WHERE MULT.ID_MULTA = PI_N_ID_MULTA;

  I_EXISTE := 0;
  CASE I_ESTADO_MULTA
       WHEN SCOB_PK_CONSTANTES.C_EST_MULT_CONSENTIDA THEN I_EXISTE := 1;
       WHEN SCOB_PK_CONSTANTES.C_EST_MULT_FIRME THEN I_EXISTE := 1;
       WHEN SCOB_PK_CONSTANTES.C_EST_MULT_REVISADA THEN I_EXISTE := 1;
       ELSE NULL;
  END CASE;

  IF I_EXISTE = 0 THEN
    po_n_retorno := -10;
    po_n_cod_error := po_n_retorno;
    po_v_msj_error := 'No se puede realizar la accion. Verifique el estado actual de la multa.';
    return;
  END IF;


  --verifica si tiene sancionado registrado
  SELECT COUNT(MSAN.ID_MULTA_SANCIONADO)
  INTO I_EXISTE
  FROM T_SCOB_MULTA MULT
  INNER JOIN T_SCOB_MULTA_DETAL MDET
    ON MDET.ID_MULTA = MULT.ID_MULTA
  INNER JOIN T_SCOB_MULTA_SANCIONADO MSAN
    ON MSAN.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL
  WHERE MULT.ID_MULTA = PI_N_ID_MULTA
  AND MDET.FLG_ACTUAL = '1'
  AND MSAN.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
  AND NVL(MSAN.COD_TIPO_PERSONA,'1') = '1'
  ;

  IF I_EXISTE = 0 THEN
    po_n_retorno := -11;
    po_n_cod_error := po_n_retorno;
    po_v_msj_error := 'No se puede realizar la accion. Debe asociar sancionado(s).';
    return;
  END IF;

  --verifica se haya registrado los checklist obligatorios.
  SELECT SUM(FLG_OBLIGATORIO) AS NRO_OBLIGATORIOS, SUM(IND_MARCADO) AS NRO_MARCADOS
  INTO   N_REG_OBLIGATORIOS, N_REG_MARCADOS
  FROM (
  SELECT
    TTDD.COD_INTERNO AS COD_TIPO_DOCUMENTO,
    DECODE(MCHE.COD_TIPO_DOCUMENTO,NULL,'0','1') AS IND_TIPO_DOCUMENTO,
    DECODE(MCHE.IND_MARCADO,NULL,'0','1') AS IND_MARCADO,
    TTDD.TXT_VALOR1 AS FLG_OBLIGATORIO
  FROM T_SCOB_TABLA_DET TTDD
  LEFT JOIN T_SCOB_MULTA_DETAL MDET
       ON MDET.ID_MULTA = PI_N_ID_MULTA
  LEFT JOIN T_SCOB_MULTA_CHECK MCHE
       ON MCHE.COD_TIPO_DOCUMENTO = TO_NUMBER(TTDD.COD_INTERNO)
       AND MCHE.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL
       AND MCHE.ESTADO = '1'
  LEFT JOIN T_SCOB_MULTA MULT
       ON MULT.ID_MULTA = MDET.ID_MULTA
  WHERE TTDD.ID_TABLA = 17
  AND MDET.ID_MULTA_DETAL = N_ID_MULTA_DETAL
  AND TTDD.ESTADO = '1' AND TTDD.TXT_VALOR1 = '1'
  AND MULT.FLG_MULTA_RESOLUTIVO <> '0'
  );

  IF N_REG_OBLIGATORIOS <> N_REG_MARCADOS THEN
    po_n_retorno := -12;
    po_n_cod_error := po_n_retorno;
    po_v_msj_error := 'No se puede realizar la accion. Debe ingresar a la opcion Checklist De Documentos y completar los datos obligatorios.';
    return;
  END IF;

  UPDATE T_SCOB_MULTA
  SET
    FEC_GENERACION_SEC = SYSDATE,
    AUDUSUMODIFICACION = PI_V_AUDUSUMODIFICACION,
    AUDFECMODIFICACION = SYSDATE
  WHERE
    ID_MULTA = PI_N_ID_MULTA;

  po_n_retorno :=   PI_N_ID_MULTA;
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

procedure SCOB_SP_I_MULTA_BY_ANTIDUMPING
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 18.07.2011
-- Proposito    : registrar las multas por materia antidumping
                  solo si submateria es: derecho antidumping.
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   : 2023-02-14
-- Proposito    : Procesos en linea
-----------------------------------------------------------
*/
(
  PI_N_ID_MATERIA                   IN T_SCOB_MULTA.ID_MATERIA%TYPE,
  PI_N_ID_SUBMATERIA                IN T_SCOB_MULTA.ID_SUB_MATERIA%TYPE,
  PI_C_FLG_MULTA_RESOLUTIVO         IN T_SCOB_MULTA.FLG_MULTA_RESOLUTIVO%TYPE,
                                    --enviar 0=antidumping
  PI_N_TIPO_INSTANCIA_INICIA        IN T_SCOB_ORGANO_RESOLUTIVO.TIPO_INSTANCIA%TYPE,
  PI_N_ID_ORGANO_RESOLUTIVO         IN T_SCOB_MULTA_DETAL.ID_ORGANO_RESOLUTIVO%TYPE,
  PI_N_ID_USUARIO_SECRETARIO        IN T_SCOB_MULTA_DETAL.ID_USUARIO_SECRETARIO%TYPE,

  PI_V_NRO_OFICIO_SUNAT_CODIGO      IN T_SCOB_MULTA_ANTIDUMPING.NRO_OFICIO_SUNAT_CODIGO%TYPE,
  PI_V_NRO_OFICIO_SUNAT_ANIO        IN T_SCOB_MULTA_ANTIDUMPING.NRO_OFICIO_SUNAT_ANIO%TYPE,
  PI_V_NRO_OFICIO_SUNAT_PREFIJO     IN T_SCOB_MULTA_ANTIDUMPING.NRO_OFICIO_SUNAT_PREFIJO%TYPE,
  PI_V_NRO_OFICIO_SUNAT_SEC         IN T_SCOB_MULTA_ANTIDUMPING.NRO_OFICIO_SUNAT_CORRELATIVO%TYPE,
  PI_V_NRO_LIQUIDACION_CODIGO       IN T_SCOB_MULTA_ANTIDUMPING.NRO_LIQUIDACION_CODIGO%TYPE,
  PI_V_NRO_LIQUIDACION_ANIO         IN T_SCOB_MULTA_ANTIDUMPING.NRO_LIQUIDACION_ANIO%TYPE,
  PI_V_NRO_LIQUIDACION_SEC          IN T_SCOB_MULTA_ANTIDUMPING.NRO_LIQUIDACION_CORRELATIVO%TYPE,
  PI_V_NRO_DUA_CODIGO               IN T_SCOB_MULTA_ANTIDUMPING.NRO_DUA_CODIGO%TYPE,
  PI_V_NRO_DUA_ANIO                 IN T_SCOB_MULTA_ANTIDUMPING.NRO_DUA_ANIO%TYPE,
  PI_V_NRO_DUA_SEC                  IN T_SCOB_MULTA_ANTIDUMPING.NRO_DUA_CORRELATIVO%TYPE,
  PI_N_TIPO_CAMBIO                  IN T_SCOB_MULTA_ANTIDUMPING.TIPO_CAMBIO%TYPE,
  PI_N_MONTO_ANTIDUMPING            IN T_SCOB_MULTA_ANTIDUMPING.MONTO_ANTIDUMPING%TYPE,
  PI_N_ID_INTENDENCIA               IN T_SCOB_MULTA_ANTIDUMPING.ID_INTENDENCIA%TYPE,
  PI_N_ID_PARTIDA                   IN T_SCOB_MULTA_ANTIDUMPING.ID_PARTIDA%TYPE,
  PI_V_FEC_NOTIF                    IN VARCHAR2,
  PI_I_ESTADO_MULTA                 IN T_SCOB_MULTA.ESTADO_MULTA%TYPE,
  PI_C_FLG_TIPO_MULTA               IN T_SCOB_MULTA.FLG_TIPO_MULTA%TYPE,
  PI_N_ID_SEDE                      IN T_SCOB_SEDE.ID_SEDE%TYPE,
  --nuevos
  PI_V_EXP_ANTIG_NRO                IN VARCHAR2,
  PI_C_EXP_ANTIG_ANIO               IN CHAR,
  PI_N_EXP_ANTIG_ID_SIGLA           IN NUMBER,
  PI_N_EXP_ANTIG_ID_TIPO_EXPED      IN NUMBER,
  PI_V_EXP_ANTIG_COD_SIGLA          IN VARCHAR2,
  PI_V_EXP_ANTIG_COD_TIPO_EXPED     IN VARCHAR2,
  PI_V_EXP_ANTIG_DES_SIGLA          IN VARCHAR2,
  PI_V_EXP_ANTIG_DES_TIPO_EXPED     IN VARCHAR2,

  PI_V_EXP_NUEVO_NRO                IN VARCHAR2,
  PI_C_EXP_NUEVO_ANIO               IN CHAR,
  PI_V_EXP_NUEVO_COD_ORG_RESOL      IN VARCHAR,
  PI_V_EXP_NUEVO_COD_MATERIA        IN VARCHAR,

  PI_V_RESOL_NRO                    IN VARCHAR2,
  PI_C_RESOL_ANIO                   IN CHAR,
  PI_N_RESOL_ID_SIGLA               IN NUMBER,
  PI_V_RESOL_COD_SIGLA              IN VARCHAR2,
  PI_V_RESOL_DES_SIGLA              IN VARCHAR2,

  --
  PI_V_AUDUSUCREACION               IN T_SCOB_MULTA.AUDUSUCREACION%TYPE,
  PI_N_ID_USUARIO_INGRESO           IN T_SCOB_MULTA.ID_USUARIO_INGRESO%TYPE,
  po_n_retorno                      out number,
  po_n_retorno_det                  out number,
  po_n_retorno_antidumping          out number,
  po_n_cod_error                    out number,
  po_v_msj_error                    out varchar2
)
is
  N_CUM                             NUMBER;
  N_ID_MULTA                        T_SCOB_MULTA.ID_MULTA%TYPE;
  N_ID_MULTA_NIVEL                  T_SCOB_MULTA_DETAL.ID_MULTA_DETAL%TYPE;
  N_ID_MULTA_ESTADO                 T_SCOB_MULTA_ESTADO.ID_MULTA_ESTADO%TYPE;
  I_EXISTE                          INTEGER;
  N_ID_MULTA_ANTIDUMPING            T_SCOB_MULTA_ANTIDUMPING.ID_MULTA_ANTIDUMPING%TYPE;
  --
  V_ID_NRO_EXPED_ADMIN_ID           T_SCOB_MULTA.NRO_EXPED_UNICO_ID%TYPE;
  V_ID_NRO_RESOLUCION_ID            T_SCOB_MULTA_DETAL.NRO_RESOLUCION_ID%TYPE;
  --
  V_NRO_RESOL                       T_SCOB_MULTA_DETAL.NRO_RESOLUCION%TYPE;
  V_NRO_EXP_NIVEL                   T_SCOB_MULTA_DETAL.NRO_EXP_NIVEL%TYPE;
  V_NRO_EXP_ADMIN                   T_SCOB_MULTA.NRO_EXP_ADMINISTRATIVO%TYPE;
  N_MONTO                           T_SCOB_MULTA.MONTO_UIT%TYPE;
begin

  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_retorno_det := 0;
  po_n_cod_error := 0;

  --verifica la fecha siguiente instancia (apelacion o revision)
  IF NVL(PI_V_FEC_NOTIF,' ' ) <> ' ' THEN
      -- scob_pk_utilitario.scob_sp_s_valida_fecha(PI_V_FEC_NOTIF,'U',I_EXISTE);
      scob_pk_utilitario.scob_sp_s_valida_fecha_by_or(PI_V_FEC_NOTIF,'U',PI_N_ID_ORGANO_RESOLUTIVO,SCOB_PK_CONSTANTES.C_NU_X_OR,I_EXISTE);
      IF I_EXISTE=0 THEN
        po_n_retorno := -9;
        po_n_cod_error := po_n_retorno;
        po_v_msj_error := 'La fecha de notificacion no es valida, debe seleccionar una fecha habil.';
        return;
      END IF;
      I_EXISTE := 0;
  END IF;

  --COMPOSICION DEL NRO_EXPEDIENTE_ADMINISTRATIVO, NRO_EXPEDIENTE_UNICO, NRO_RESOLUTIVO.
  --V_ID_NRO_EXPED_NIVEL_ID := PI_V_EXP_ANTIG_NRO ||''|| PI_C_EXP_ANTIG_ANIO ||''|| TO_CHAR(PI_N_EXP_ANTIG_ID_SIGLA) ||''|| TO_CHAR(PI_N_EXP_ANTIG_ID_TIPO_EXPED);
  V_ID_NRO_EXPED_ADMIN_ID := PI_V_EXP_NUEVO_NRO ||''|| PI_C_EXP_NUEVO_ANIO ||''||  PI_V_EXP_NUEVO_COD_ORG_RESOL ||''|| PI_V_EXP_NUEVO_COD_MATERIA;
  V_ID_NRO_RESOLUCION_ID := PI_V_RESOL_NRO ||''|| PI_C_RESOL_ANIO ||''|| PI_V_EXP_NUEVO_COD_ORG_RESOL;
  --
  V_NRO_RESOL := PI_V_RESOL_NRO ||'-'|| PI_C_RESOL_ANIO ||'/'|| PI_V_RESOL_DES_SIGLA;
  V_NRO_EXP_NIVEL := PI_V_EXP_ANTIG_NRO ||'-'|| PI_C_EXP_ANTIG_ANIO ||'/'|| PI_V_EXP_ANTIG_DES_SIGLA ||'-'|| PI_V_EXP_ANTIG_DES_TIPO_EXPED;
  V_NRO_EXP_ADMIN := PI_V_EXP_NUEVO_NRO || PI_C_EXP_NUEVO_ANIO || PI_V_EXP_NUEVO_COD_ORG_RESOL || PI_V_EXP_NUEVO_COD_MATERIA;

  --verifica la instancia que inicia el registro de la multa.
  SELECT COUNT(DISTINCT EINS.TIPO_INSTANCIA_INICIA) INTO I_EXISTE
  FROM T_SCOB_ESTADO_INSTANCIA EINS
  WHERE EINS.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
  AND EINS.TIPO_INSTANCIA_INICIA = PI_N_TIPO_INSTANCIA_INICIA;

 IF I_EXISTE = 0 THEN --no existen estados registrado para esta instancia
    po_n_retorno := -10;
    po_n_cod_error := po_n_retorno;
    po_v_msj_error := 'No se puede realizar la accion. La multa no puede ser registrada en esta instancia.';
    return;
  END IF;

  --verificar que el numero de liquidacion no exista.
  SELECT COUNT(MUAN.ID_MULTA_ANTIDUMPING)
  INTO I_EXISTE
  FROM T_SCOB_MULTA_ANTIDUMPING MUAN
  WHERE
    NRO_LIQUIDACION_CODIGO = PI_V_NRO_LIQUIDACION_CODIGO
    AND NRO_LIQUIDACION_ANIO = PI_V_NRO_LIQUIDACION_ANIO
    AND NRO_LIQUIDACION_CORRELATIVO = PI_V_NRO_LIQUIDACION_SEC
    AND MUAN.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO;
  IF I_EXISTE > 0 THEN
      po_n_retorno := -11;
      po_n_cod_error := po_n_retorno;
      po_v_msj_error := 'No se puede realizar la accion. El numero de liquidacion ingresado se encuentra registrado.';
      return;
  END IF;

  --genera el codigo secuencial de la multa
  SELECT SCOB_SQ_MULTA.NEXTVAL INTO N_ID_MULTA FROM dual;

  SELECT SCOB_SQ_CUM.NEXTVAL INTO N_CUM FROM dual;

  --actualizacion de montos
  N_MONTO := TRUNC(NVL(PI_N_TIPO_CAMBIO,1) * PI_N_MONTO_ANTIDUMPING,SCOB_PK_CONSTANTES.C_NRO_DECIMAL_TRUNC);

  --insertar multa
  INSERT INTO T_SCOB_MULTA(
      ID_MULTA,
      CUM,
      ANIO,
      ID_MATERIA,
      ID_SUB_MATERIA,
      FLG_TIPO_MULTA,
      TIPO_INSTANCIA_INICIA,
      FEC_INGRESO,
      ID_USUARIO_INGRESO,
      FLG_MULTA_COBRANZA,
      FLG_MULTA_IMPROCEDENCIA,
      ID_SEDE,
      COD_TIPO_MONEDA,

      MONTO_UIT,
      MONTO_INTERES,
      MONTO_INTERES_MORATORIO,
      MONTO_COSTAS,
      MONTO_TOTAL_DEUDA,

      TOTAL_AMORTIZADO,
      TOTAL_AMORTIZADO_IC,
      TOTAL_AMORTIZADO_IM,
      TOTAL_AMORTIZADO_COSTAS,
      TOTAL_AMORTIZACION_DEUDA,

      SALDO,
      SALDO_COSTAS,
      SALDO_IC,
      SALDO_IM,
      SALDO_TOTAL_DEUDA,
      MONTO_PORCENTAJE_DSCTO,

      COD_ESTADO_PAGO,
      --IND_TIPO_PAGO,
      FLG_MULTA_RESOLUTIVO, --0=multa antidumping
      NRO_EXP_ADMINISTRATIVO,
      ESTADO,
      AUDFECCREACION,
      AUDUSUCREACION,
      --
      NRO_EXPED_UNICO,
      ANIO_EXPED_UNICO,
      NRO_EXPED_UNICO_ID
      --
  )
  VALUES(
      N_ID_MULTA,
      LPAD(TO_CHAR(N_CUM),10,'0000000000'),
      TO_CHAR(SYSDATE,'YYYY'),
      PI_N_ID_MATERIA,
      PI_N_ID_SUBMATERIA,
      PI_C_FLG_TIPO_MULTA,
      PI_N_TIPO_INSTANCIA_INICIA,
      SYSDATE,
      PI_N_ID_USUARIO_INGRESO,
      '0', --FLG_MULTA_COBRANZA
      '0', --FLG_MULTA_IMPROCEDENCIA
      PI_N_ID_SEDE,
      SCOB_PK_CONSTANTES.C_COD_TIPO_MONEDA_SOLES,
      --
      N_MONTO,--MONTO_UIT,
      0.00, --MONTO_INTERES,
      0.00, --MONTO_INTERES_MORATORIO,
      0.00, --MONTO_COSTAS,
      N_MONTO, --MONTO_TOTAL_DEUDA

      0.00, --TOTAL_AMORTIZADO,
      0.00, --TOTAL_AMORTIZADO_IC,
      0.00, --TOTAL_AMORTIZADO_IM,
      0.00, --TOTAL_AMORTIZADO_COSTAS,
      0.00, --TOTAL_AMORTIZACION_DEUDA,

      N_MONTO, --SALDO
      0.00, --SALDO_COSTAS,
      0.00, --SALDO_IC,
      0.00, --SALDO_IM,
      N_MONTO, --SALDO_TOTAL_DEUDA

      0.00, --MONTO_PORCENTAJE_DSCTO

      SCOB_PK_CONSTANTES.C_EST_PAGO_PENDIENTE,
      --SCOB_PK_CONSTANTES.C_FLG_PAGO_VOLUNTARIO, --IND_TIPO_PAGO
      PI_C_FLG_MULTA_RESOLUTIVO, --0=multa antidumping
      V_NRO_EXP_ADMIN,
      SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO,
      SYSDATE,
      PI_V_AUDUSUCREACION,
      --
      PI_V_EXP_NUEVO_NRO,
      PI_C_EXP_NUEVO_ANIO,
      V_ID_NRO_EXPED_ADMIN_ID
      --
  );

  --inserta los datos de antidumping
  INSERT INTO T_SCOB_MULTA_ANTIDUMPING(
    ID_MULTA_ANTIDUMPING,
    ID_MULTA,
    NRO_OFICIO_SUNAT_CODIGO,
    NRO_OFICIO_SUNAT_ANIO,
    NRO_OFICIO_SUNAT_PREFIJO,
    NRO_OFICIO_SUNAT_CORRELATIVO,
    NRO_LIQUIDACION_CODIGO,
    NRO_LIQUIDACION_ANIO,
    NRO_LIQUIDACION_CORRELATIVO,
    NRO_DUA_CODIGO,
    NRO_DUA_ANIO,
    NRO_DUA_CORRELATIVO,
    TIPO_CAMBIO,
    MONTO_ANTIDUMPING,
    NRO_DIAS_INTERES,
    MONTO_INTERES,
    NRO_DIAS_INTERES_MORATORIO,
    MONTO_INTERES_MORATORIO,
    MONTO_TOTAL,
    ID_INTENDENCIA,
    ID_PARTIDA,
    ESTADO,
    AUDFECCREACION,
    AUDUSUCREACION
  )
  VALUES(
    SCOB_SQ_MULTA_ANTIDUMPING.NEXTVAL,
    N_ID_MULTA,
    UPPER(PI_V_NRO_OFICIO_SUNAT_CODIGO),
    PI_V_NRO_OFICIO_SUNAT_ANIO,
    UPPER(PI_V_NRO_OFICIO_SUNAT_PREFIJO),
    PI_V_NRO_OFICIO_SUNAT_SEC,
    UPPER(PI_V_NRO_LIQUIDACION_CODIGO),
    PI_V_NRO_LIQUIDACION_ANIO,
    PI_V_NRO_LIQUIDACION_SEC,
    UPPER(PI_V_NRO_DUA_CODIGO),
    PI_V_NRO_DUA_ANIO,
    PI_V_NRO_DUA_SEC,
    PI_N_TIPO_CAMBIO,
    PI_N_MONTO_ANTIDUMPING,
    0, --NRO_DIAS_INTERES,
    0.00, --MONTO_INTERES,
    0, --NRO_DIAS_INTERES_MORATORIO,
    0.00, --MONTO_INTERES_MORATORIO,
    PI_N_MONTO_ANTIDUMPING, --MONTO_TOTAL,
    PI_N_ID_INTENDENCIA,
    PI_N_ID_PARTIDA,
    SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO,
    SYSDATE,
    PI_V_AUDUSUCREACION
  ) RETURNING ID_MULTA_ANTIDUMPING INTO N_ID_MULTA_ANTIDUMPING;

  --actualizacion de montos
  N_MONTO := TRUNC(NVL(PI_N_TIPO_CAMBIO,1) * PI_N_MONTO_ANTIDUMPING,SCOB_PK_CONSTANTES.C_NRO_DECIMAL_TRUNC);

  --insertar el nivel de la multa
  INSERT INTO T_SCOB_MULTA_DETAL(
    ID_MULTA_DETAL,
    ID_MULTA,
    ID_ORGANO_RESOLUTIVO,
    ID_USUARIO_SECRETARIO,
    NRO_RESOLUCION,
    NRO_EXP_NIVEL,
    ID_USUARIO_INGRESO,
    FEC_NOTIFICACION_RESOLUCION,
    FLG_ACTUAL,
    VALOR_UIT,
    MONTO_UIT,
    POR_ASOCU,
    MONTO_ASOCU,
    ESTADO,
    AUDFECCREACION,
    AUDUSUCREACION,
    --
    NRO_EXPED_ANTIGUO,
    ANIO_EXPED_ANTIGUO,
    ID_TIPO_EXPED_ANTIGUO,
    COD_TIPO_EXPED_ANTIGUO,
    DES_TIPO_EXPED_ANTIGUO,
    ID_SIGLA,
    COD_SIGLA,
    DES_SIGLA,
    NRO_RESOLUCION_SEC,
    ANIO_RESOLUCION,
    ID_SIGLA_RESOLUCION,
    COD_SIGLA_RESOLUCION,
    DES_SIGLA_RESOLUCION,
    NRO_EXPED_ANTIGUO_ID,
    NRO_RESOLUCION_ID
  )
  VALUES(
    SCOB_SQ_MULTA_DETAL.NEXTVAL,
    N_ID_MULTA,
    PI_N_ID_ORGANO_RESOLUTIVO,
    PI_N_ID_USUARIO_SECRETARIO,
    V_NRO_RESOL,
    V_NRO_EXP_NIVEL,
    PI_N_ID_USUARIO_INGRESO,
    TO_DATE(PI_V_FEC_NOTIF,'DD/MM/YYYY'),
    '1', --FLG_ACTUAL
    0.00, --VALOR_UIT
    N_MONTO, --MONTO_UIT
    0.00, --POR_ASOCU
    0.00, --MONTO_ASOCU
    SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO,
    SYSDATE,
    PI_V_AUDUSUCREACION,
    --
    PI_V_EXP_ANTIG_NRO,
    PI_C_EXP_ANTIG_ANIO,
    PI_N_EXP_ANTIG_ID_TIPO_EXPED,
    PI_V_EXP_ANTIG_COD_TIPO_EXPED,
    PI_V_EXP_ANTIG_DES_TIPO_EXPED,
    PI_N_EXP_ANTIG_ID_SIGLA,
    PI_V_EXP_ANTIG_COD_SIGLA,
    PI_V_EXP_ANTIG_DES_SIGLA,

    PI_V_RESOL_NRO,
    PI_C_RESOL_ANIO,
    PI_N_RESOL_ID_SIGLA,
    PI_V_RESOL_COD_SIGLA,
    PI_V_RESOL_DES_SIGLA,
    V_ID_NRO_EXPED_ADMIN_ID,
    V_ID_NRO_RESOLUCION_ID

  )RETURNING ID_MULTA_DETAL INTO N_ID_MULTA_NIVEL;

  --insertar al denunciante
  INSERT INTO T_SCOB_MULTA_DENUNCIANTE(
    ID_MULTA_DENUNCIANTE,
    ID_MULTA_DETAL,
    ID_PERSONA,
    ESTADO,
    AUDFECCREACION,
    AUDUSUCREACION
  )
  VALUES(
    SCOB_SQ_MULTA_DENUNCIANTE.NEXTVAL,
    N_ID_MULTA_NIVEL,
    SCOB_PK_CONSTANTES.C_COD_ADMINISTRADO_SUNAT,
    SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO,
    SYSDATE,
    PI_V_AUDUSUCREACION
  );

  --insertar logs de estados
  --SE ACTUALIZA EL ESTADO DE LA MULTA ANTIDUMPING A FIRME CON FECHA DE NOTIFICACION DE LA RESOLUCION 27.09.2011
  SCOB_SP_I_MULTA_ESTADO(N_ID_MULTA, N_ID_MULTA_NIVEL, PI_I_ESTADO_MULTA, 0, PI_V_FEC_NOTIF, PI_V_AUDUSUCREACION, PI_N_ID_USUARIO_INGRESO, 0, N_ID_MULTA_ESTADO, PO_N_COD_ERROR,  PO_V_MSJ_ERROR);
  --@0001:INI
  if PO_N_COD_ERROR < 0 then
     rollback;
     return;
  end if;
  --@0001:FIN

  po_n_cod_error := 0;
  po_n_retorno := n_id_multa;
  po_n_retorno_det := N_ID_MULTA_NIVEL;
  po_n_retorno_antidumping := N_ID_MULTA_ANTIDUMPING;

    --INICIO VICTOR BENDEZU - MIGRACION SICOB A SIA - RECAUDACION EN LINEA
    IF NVL(n_id_multa,0) <> 0 THEN
       USR_SIA_INTFZ.PKG_INTFZ_REG_MULTA_SICOB_SIA.SP_U_MULTA_SICOB_A_SIA(PIN_NU_ID_MULTA => N_ID_MULTA,
                                                                         POUT_NU_COD_RESULT => PO_N_RETORNO,
                                                                         POUT_VC_MSG_RESULT => PO_V_MSJ_ERROR);
    ELSE 
       USR_SIA_INTFZ.PKG_INTFZ_REG_MULTA_SICOB_SIA.SP_I_MULTA_SICOB_A_SIA(PIN_NU_ID_MULTA => N_ID_MULTA,
                                                                         POUT_NU_COD_RESULT => PO_N_RETORNO,
                                                                         POUT_VC_MSG_RESULT => PO_V_MSJ_ERROR);
    END IF;
    IF PO_N_RETORNO < 0 THEN
         ROLLBACK;
         RETURN;
    END IF;
        
    PKG_RECAUDACION_BANCOS.SP_DO_GRABAR_BN(PIN_NU_ID_MULTA => N_ID_MULTA,
                                                     POUT_NU_COD_RESULT => PO_N_RETORNO,
                                                     POUT_VC_MSG_RESULT => PO_V_MSJ_ERROR);
    IF PO_N_RETORNO < 0 THEN
         ROLLBACK;
         RETURN;
    END IF;
                                                                             
    PKG_RECAUDACION_BANCOS.SP_DO_GRABAR_ASBANC(PIN_NU_ID_MULTA => N_ID_MULTA,
                                                         POUT_NU_COD_RESULT => PO_N_RETORNO,
                                                         POUT_VC_MSG_RESULT => PO_V_MSJ_ERROR);                                                                     
            
    IF PO_N_RETORNO < 0 THEN
         ROLLBACK;
         RETURN;
    END IF;
    --FIN VICTOR BENDEZU - MIGRACION SICOB A SIA - RECAUDACION EN LINEA

  
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

procedure SCOB_SP_U_MULTA_BY_ANTIDUMPING
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 19.07.2011
-- Proposito    : actualizar las multas por materia antidumping
                  solo si submateria es: derecho antidumping.
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   : 2023-02-14
-- Proposito    : Procesos en linea 
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA_ANTIDUMPING         IN T_SCOB_MULTA_ANTIDUMPING.ID_MULTA_ANTIDUMPING%TYPE,
  PI_N_ID_MULTA                     IN T_SCOB_MULTA.ID_MULTA%TYPE,
  PI_N_ID_MULTA_DETAL               IN T_SCOB_MULTA_DETAL.ID_MULTA_DETAL%TYPE,
  PI_N_ID_USUARIO_SECRETARIO        IN T_SCOB_MULTA_DETAL.ID_USUARIO_SECRETARIO%TYPE,
  --
  PI_V_NRO_OFICIO_SUNAT_CODIGO      IN T_SCOB_MULTA_ANTIDUMPING.NRO_OFICIO_SUNAT_CODIGO%TYPE,
  PI_V_NRO_OFICIO_SUNAT_ANIO        IN T_SCOB_MULTA_ANTIDUMPING.NRO_OFICIO_SUNAT_ANIO%TYPE,
  PI_V_NRO_OFICIO_SUNAT_PREFIJO     IN T_SCOB_MULTA_ANTIDUMPING.NRO_OFICIO_SUNAT_PREFIJO%TYPE,
  PI_V_NRO_OFICIO_SUNAT_SEC         IN T_SCOB_MULTA_ANTIDUMPING.NRO_OFICIO_SUNAT_CORRELATIVO%TYPE,
  PI_V_NRO_LIQUIDACION_CODIGO       IN T_SCOB_MULTA_ANTIDUMPING.NRO_LIQUIDACION_CODIGO%TYPE,
  PI_V_NRO_LIQUIDACION_ANIO         IN T_SCOB_MULTA_ANTIDUMPING.NRO_LIQUIDACION_ANIO%TYPE,
  PI_V_NRO_LIQUIDACION_SEC          IN T_SCOB_MULTA_ANTIDUMPING.NRO_LIQUIDACION_CORRELATIVO%TYPE,
  PI_V_NRO_DUA_CODIGO               IN T_SCOB_MULTA_ANTIDUMPING.NRO_DUA_CODIGO%TYPE,
  PI_V_NRO_DUA_ANIO                 IN T_SCOB_MULTA_ANTIDUMPING.NRO_DUA_ANIO%TYPE,
  PI_V_NRO_DUA_SEC                  IN T_SCOB_MULTA_ANTIDUMPING.NRO_DUA_CORRELATIVO%TYPE,
  PI_N_TIPO_CAMBIO                  IN T_SCOB_MULTA_ANTIDUMPING.TIPO_CAMBIO%TYPE,
  PI_N_MONTO_ANTIDUMPING            IN T_SCOB_MULTA_ANTIDUMPING.MONTO_ANTIDUMPING%TYPE,
  PI_N_ID_INTENDENCIA               IN T_SCOB_MULTA_ANTIDUMPING.ID_INTENDENCIA%TYPE,
  PI_N_ID_PARTIDA                   IN T_SCOB_MULTA_ANTIDUMPING.ID_PARTIDA%TYPE,
  PI_V_FECHA_NOTIF                  IN VARCHAR2,
  PI_I_ESTADO_MULTA                 IN T_SCOB_MULTA.ESTADO_MULTA%TYPE,
  PI_N_ID_SEDE                      IN T_SCOB_SEDE.ID_SEDE%TYPE,
 --nuevos
  PI_V_EXP_ANTIG_NRO                IN VARCHAR2,
  PI_C_EXP_ANTIG_ANIO               IN CHAR,
  PI_N_EXP_ANTIG_ID_SIGLA           IN NUMBER,
  PI_N_EXP_ANTIG_ID_TIPO_EXPED      IN NUMBER,
  PI_V_EXP_ANTIG_COD_SIGLA          IN VARCHAR2,
  PI_V_EXP_ANTIG_COD_TIPO_EXPED     IN VARCHAR2,
  PI_V_EXP_ANTIG_DES_SIGLA          IN VARCHAR2,
  PI_V_EXP_ANTIG_DES_TIPO_EXPED     IN VARCHAR2,

  PI_V_RESOL_NRO                    IN VARCHAR2,
  PI_C_RESOL_ANIO                   IN CHAR,
  PI_N_RESOL_ID_SIGLA               IN NUMBER,
  PI_V_RESOL_COD_SIGLA              IN VARCHAR2,
  PI_V_RESOL_DES_SIGLA              IN VARCHAR2,
  --
  PI_V_AUDUSUMODIFICACION           IN T_SCOB_MULTA.AUDUSUCREACION%TYPE,
  PI_N_ID_USUARIO_INGRESO           IN T_SCOB_MULTA.ID_USUARIO_INGRESO%TYPE,
  --
  po_n_retorno                      out number,
  po_n_retorno_det                  out number,
  po_n_cod_error                    out number,
  po_v_msj_error                    out varchar2
)
is
  N_ID_MULTA_ESTADO                 T_SCOB_MULTA_ESTADO.ID_MULTA_ESTADO%TYPE;
  I_EXISTE                          INTEGER;
  --
  V_ID_NRO_EXPED_NIVEL_ID           T_SCOB_MULTA_DETAL.NRO_EXPED_ANTIGUO_ID%TYPE;
  V_ID_NRO_RESOLUCION_ID            T_SCOB_MULTA_DETAL.NRO_RESOLUCION_ID%TYPE;
  --
  V_NRO_RESOL                       T_SCOB_MULTA_DETAL.NRO_RESOLUCION%TYPE;
  V_NRO_EXP_NIVEL                   T_SCOB_MULTA_DETAL.NRO_EXP_NIVEL%TYPE;
  V_COD_ORGANO_RESOLUTIVO           T_SCOB_ORGANO_RESOLUTIVO.CODIGO%TYPE;
  N_MONTO                           T_SCOB_MULTA.MONTO_UIT%TYPE;
begin

  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_retorno_det := 0;
  po_n_cod_error := 0;

  --OBTENER EL COD_OR DE LA MULTA
  SELECT ORGR.CODIGO
  INTO V_COD_ORGANO_RESOLUTIVO
  FROM T_SCOB_MULTA_DETAL MDET
  INNER JOIN T_SCOB_ORGANO_RESOLUTIVO ORGR ON ORGR.ID_ORGANO_RESOLUTIVO = MDET.ID_ORGANO_RESOLUTIVO
  WHERE MDET.ID_MULTA_DETAL = PI_N_ID_MULTA_DETAL;

  --COMPOSICION DEL NRO_EXPEDIENTE_ADMINISTRATIVO, NRO_EXPEDIENTE_UNICO, NRO_RESOLUTIVO.
  V_ID_NRO_EXPED_NIVEL_ID := PI_V_EXP_ANTIG_NRO ||''|| PI_C_EXP_ANTIG_ANIO ||''|| TO_CHAR(PI_N_EXP_ANTIG_ID_SIGLA) ||''|| TO_CHAR(PI_N_EXP_ANTIG_ID_TIPO_EXPED);
  V_ID_NRO_RESOLUCION_ID := PI_V_RESOL_NRO ||''|| PI_C_RESOL_ANIO ||''|| V_COD_ORGANO_RESOLUTIVO;
  --
  V_NRO_RESOL := PI_V_RESOL_NRO ||'-'|| PI_C_RESOL_ANIO ||'/'|| PI_V_RESOL_DES_SIGLA;
  V_NRO_EXP_NIVEL := PI_V_EXP_ANTIG_NRO ||'-'|| PI_C_EXP_ANTIG_ANIO ||'/'|| PI_V_EXP_ANTIG_DES_SIGLA ||'-'|| PI_V_EXP_ANTIG_DES_TIPO_EXPED;

  --verificar que el numero de liquidacion no exista.
  SELECT COUNT(MUAN.ID_MULTA_ANTIDUMPING)
  INTO I_EXISTE
  FROM T_SCOB_MULTA_ANTIDUMPING MUAN
  WHERE
    NRO_LIQUIDACION_CODIGO = PI_V_NRO_LIQUIDACION_CODIGO
    AND NRO_LIQUIDACION_ANIO = PI_V_NRO_LIQUIDACION_ANIO
    AND NRO_LIQUIDACION_CORRELATIVO = PI_V_NRO_LIQUIDACION_SEC
    AND MUAN.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
    AND MUAN.ID_MULTA_ANTIDUMPING <> PI_N_ID_MULTA_ANTIDUMPING;
  IF I_EXISTE > 0 THEN --no existen estados registrado para esta instancia
      po_n_retorno := -10;
      po_n_cod_error := po_n_retorno;
      po_v_msj_error := 'No se puede realizar la accion. El numero de liquidacion ingresado se encuentra registrado.';
      return;
  END IF;

  --verificar que el numero de expediente administrativo (antiguo) no exista.
  SELECT COUNT(MDET.ID_MULTA_DETAL)
  INTO I_EXISTE
  FROM T_SCOB_MULTA_DETAL MDET
  WHERE MDET.ID_MULTA_DETAL <> PI_N_ID_MULTA_DETAL
  AND MDET.NRO_EXPED_ANTIGUO_ID = V_ID_NRO_EXPED_NIVEL_ID;
  IF I_EXISTE > 0 THEN
      po_n_retorno := -11;
      po_n_cod_error := po_n_retorno;
      po_v_msj_error := 'No se puede realizar la accion. El numero de expediente administrativo se encuentra registrado.';
      return;
  END IF;

  --inserta los datos de antidumping
  UPDATE T_SCOB_MULTA_ANTIDUMPING
  SET
    NRO_OFICIO_SUNAT_CODIGO = PI_V_NRO_OFICIO_SUNAT_CODIGO,
    NRO_OFICIO_SUNAT_ANIO = PI_V_NRO_OFICIO_SUNAT_ANIO,
    NRO_OFICIO_SUNAT_PREFIJO = PI_V_NRO_OFICIO_SUNAT_PREFIJO,
    NRO_OFICIO_SUNAT_CORRELATIVO = PI_V_NRO_OFICIO_SUNAT_SEC,
    NRO_LIQUIDACION_CODIGO = PI_V_NRO_LIQUIDACION_CODIGO,
    NRO_LIQUIDACION_ANIO = PI_V_NRO_LIQUIDACION_ANIO,
    NRO_LIQUIDACION_CORRELATIVO = PI_V_NRO_LIQUIDACION_SEC,
    NRO_DUA_CODIGO = PI_V_NRO_DUA_CODIGO,
    NRO_DUA_ANIO = PI_V_NRO_DUA_ANIO,
    NRO_DUA_CORRELATIVO = PI_V_NRO_DUA_SEC,
    TIPO_CAMBIO = PI_N_TIPO_CAMBIO,
    MONTO_ANTIDUMPING = PI_N_MONTO_ANTIDUMPING,
    MONTO_TOTAL = PI_N_MONTO_ANTIDUMPING,
    ID_INTENDENCIA = PI_N_ID_INTENDENCIA,
    ID_PARTIDA = PI_N_ID_PARTIDA,
    AUDFECMODIFICACION = SYSDATE,
    AUDUSUMODIFICACION = PI_V_AUDUSUMODIFICACION
  WHERE
    ID_MULTA_ANTIDUMPING = PI_N_ID_MULTA_ANTIDUMPING;

  --actualizar el nivel de la multa
  UPDATE T_SCOB_MULTA_DETAL
  SET
    FEC_NOTIFICACION_RESOLUCION = TO_DATE(PI_V_FECHA_NOTIF,'DD/MM/YYYY'),
    MONTO_UIT = NVL(PI_N_TIPO_CAMBIO,1) * PI_N_MONTO_ANTIDUMPING,

    NRO_RESOLUCION = V_NRO_RESOL,
    NRO_EXP_NIVEL = V_NRO_EXP_NIVEL,

    NRO_EXPED_ANTIGUO = PI_V_EXP_ANTIG_NRO,
    ANIO_EXPED_ANTIGUO = PI_C_EXP_ANTIG_ANIO,
    ID_TIPO_EXPED_ANTIGUO = PI_N_EXP_ANTIG_ID_TIPO_EXPED,
    COD_TIPO_EXPED_ANTIGUO = PI_V_EXP_ANTIG_COD_TIPO_EXPED,
    DES_TIPO_EXPED_ANTIGUO = PI_V_EXP_ANTIG_DES_TIPO_EXPED,

    ID_SIGLA = PI_N_EXP_ANTIG_ID_SIGLA,
    COD_SIGLA = PI_V_EXP_ANTIG_COD_SIGLA,
    DES_SIGLA = PI_V_EXP_ANTIG_DES_SIGLA,

    NRO_RESOLUCION_SEC = PI_V_RESOL_NRO,
    ANIO_RESOLUCION = PI_C_RESOL_ANIO,
    ID_SIGLA_RESOLUCION = PI_N_RESOL_ID_SIGLA,
    COD_SIGLA_RESOLUCION = PI_V_RESOL_COD_SIGLA,
    DES_SIGLA_RESOLUCION = PI_V_RESOL_DES_SIGLA,
    NRO_EXPED_ANTIGUO_ID = V_ID_NRO_EXPED_NIVEL_ID,
    NRO_RESOLUCION_ID = V_ID_NRO_RESOLUCION_ID,

    ID_USUARIO_SECRETARIO = PI_N_ID_USUARIO_SECRETARIO,
    AUDFECMODIFICACION = SYSDATE,
    AUDUSUMODIFICACION = PI_V_AUDUSUMODIFICACION
  WHERE
    ID_MULTA_DETAL = PI_N_ID_MULTA_DETAL;

  --actualizacion de montos
  N_MONTO :=  TRUNC(NVL(PI_N_TIPO_CAMBIO,1) * PI_N_MONTO_ANTIDUMPING,SCOB_PK_CONSTANTES.C_NRO_DECIMAL_TRUNC);
  UPDATE T_SCOB_MULTA MULT
  SET
    ID_SEDE = PI_N_ID_SEDE,

    MONTO_UIT = N_MONTO,
    MONTO_TOTAL_DEUDA = N_MONTO,
    SALDO = N_MONTO,
    SALDO_TOTAL_DEUDA = N_MONTO,

    AUDFECMODIFICACION = SYSDATE,
    AUDUSUMODIFICACION = PI_V_AUDUSUMODIFICACION
  WHERE MULT.ID_MULTA = PI_N_ID_MULTA;

  --insertar logs de estados
  --SE ACTUALIZA LA FECHA DEL ESTADO MULTA ANTIDUMPING CON LA FECHA DE NOTIFICACION DE RESOLUCION 27.09.2011
  SCOB_SP_I_MULTA_ESTADO(PI_N_ID_MULTA, PI_N_ID_MULTA_DETAL, PI_I_ESTADO_MULTA, 0, PI_V_FECHA_NOTIF ,PI_V_AUDUSUMODIFICACION, PI_N_ID_USUARIO_INGRESO, 0, N_ID_MULTA_ESTADO, PO_N_COD_ERROR,  PO_V_MSJ_ERROR);
  --@0001:INI
  if PO_N_COD_ERROR < 0 then
     rollback;
     return;
  end if;
  --@0001:FIN

    --INICIO VICTOR BENDEZU - MIGRACION SICOB A SIA - RECAUDACION EN LINEA
    IF NVL(PI_N_ID_MULTA,0) <> 0 THEN
       USR_SIA_INTFZ.PKG_INTFZ_REG_MULTA_SICOB_SIA.SP_U_MULTA_SICOB_A_SIA(PIN_NU_ID_MULTA => PI_N_ID_MULTA,
                                                                         POUT_NU_COD_RESULT => PO_N_RETORNO,
                                                                         POUT_VC_MSG_RESULT => PO_V_MSJ_ERROR);
    ELSE 
       USR_SIA_INTFZ.PKG_INTFZ_REG_MULTA_SICOB_SIA.SP_I_MULTA_SICOB_A_SIA(PIN_NU_ID_MULTA => PI_N_ID_MULTA,
                                                                         POUT_NU_COD_RESULT => PO_N_RETORNO,
                                                                         POUT_VC_MSG_RESULT => PO_V_MSJ_ERROR);
    END IF;
    IF PO_N_RETORNO < 0 THEN
         ROLLBACK;
         RETURN;
    END IF;
        
    PKG_RECAUDACION_BANCOS.SP_DO_GRABAR_BN(PIN_NU_ID_MULTA => PI_N_ID_MULTA,
                                                     POUT_NU_COD_RESULT => PO_N_RETORNO,
                                                     POUT_VC_MSG_RESULT => PO_V_MSJ_ERROR);
    IF PO_N_RETORNO < 0 THEN
         ROLLBACK;
         RETURN;
    END IF;
                                                                             
    PKG_RECAUDACION_BANCOS.SP_DO_GRABAR_ASBANC(PIN_NU_ID_MULTA => PI_N_ID_MULTA,
                                                         POUT_NU_COD_RESULT => PO_N_RETORNO,
                                                         POUT_VC_MSG_RESULT => PO_V_MSJ_ERROR);                                                                     
            
    IF PO_N_RETORNO < 0 THEN
         ROLLBACK;
         RETURN;
    END IF;
    --FIN VICTOR BENDEZU - MIGRACION SICOB A SIA - RECAUDACION EN LINEA
    
    
  po_n_cod_error := 0;
  po_n_retorno := PI_N_ID_MULTA;
  po_n_retorno_det := PI_N_ID_MULTA_DETAL;
  
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

procedure SCOB_SP_S_MULTA_BY_ANTIDUMPING
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 22.07.2011
-- Proposito    : consulta los los datos de la multa por antidumping.
-----------------------------------------------------------
-- Modificacion : Se agregó el parámetro: po_cu_texto_ticket y se llamó al SP: SCOB_SP_U_TICKET_MULTA_AEC para devolver el dato
-- Autor        : DCELIS
-- Modificado   : 21.03.2017
-- Proposito    : Cubrir Req.55: Interpretar texto con etiquetas para tickets de multas AEC
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA            IN T_SCOB_MULTA_ANTIDUMPING.ID_MULTA%TYPE,
  po_cu_retorno            out cu_rec_set
)
as
begin
  open  po_cu_retorno for

  SELECT
    ID_MULTA_ANTIDUMPING AS ID_MULTA_ANTIDUMPING,
    NRO_OFICIO_SUNAT_CODIGO AS NRO_OFICIO_SUNAT_CODIGO,
    NRO_OFICIO_SUNAT_ANIO AS NRO_OFICIO_SUNAT_ANIO,
    NRO_OFICIO_SUNAT_PREFIJO AS NRO_OFICIO_SUNAT_PREFIJO,
    NRO_OFICIO_SUNAT_CORRELATIVO AS NRO_OFICIO_SUNAT_CORRELATIVO,
    NRO_LIQUIDACION_CODIGO AS NRO_LIQUIDACION_CODIGO,
    NRO_LIQUIDACION_ANIO AS NRO_LIQUIDACION_ANIO,
    NRO_LIQUIDACION_CORRELATIVO AS NRO_LIQUIDACION_CORRELATIVO,
    NRO_DUA_CODIGO AS NRO_DUA_CODIGO,
    NRO_DUA_ANIO AS NRO_DUA_ANIO,
    NRO_DUA_CORRELATIVO AS NRO_DUA_CORRELATIVO,
    MUAN.TIPO_CAMBIO AS TIPO_CAMBIO,
    MUAN.MONTO_ANTIDUMPING AS MONTO_ANTIDUMPING,
    MUAN.ID_INTENDENCIA AS ID_INTENDENCIA,
    MUAN.ID_PARTIDA AS ID_PARTIDA,
    DECODE(NVL(MUAN.NRO_LIQUIDACION_CODIGO,' '),' ',NULL,
    NRO_LIQUIDACION_CODIGO ||'-'|| NRO_LIQUIDACION_ANIO ||'/'|| NRO_LIQUIDACION_CORRELATIVO) AS NRO_LIQUIDACION,
    NRO_OFICIO_SUNAT_ANIO ||'-'|| NRO_OFICIO_SUNAT_PREFIJO ||'/'|| NRO_OFICIO_SUNAT_CORRELATIVO AS NRO_OFICIO,
    NRO_DUA_CODIGO ||'-'|| NRO_DUA_ANIO ||'-'|| NRO_DUA_CORRELATIVO AS NRO_DUA,
    --I@001 01.12.2011
    PART.DESCRIPCION AS DESC_PARTIDA,
    INTE.DESCRIPCION AS DESC_INTENDENCIA,
    SUBM.DESCRIPCION AS DESC_SUBMATERIA
    --F@001 01.12.2011
  FROM T_SCOB_MULTA_ANTIDUMPING MUAN
 --I@001 01.12.2011
  INNER JOIN T_SCOB_MULTA MULT
        ON MUAN.ID_MULTA = MULT.ID_MULTA
        AND MULT.ESTADO = '1'
  LEFT JOIN T_SCOB_PARTIDA PART
       ON MUAN.ID_PARTIDA = PART.ID_PARTIDA
  LEFT JOIN T_SCOB_INTENDENCIA INTE
       ON MUAN.ID_INTENDENCIA = INTE.ID_INTENDENCIA
  LEFT JOIN T_SCOB_SUBMATERIA SUBM
       ON MULT.ID_SUB_MATERIA = SUBM.ID_SUBMATERIA
       AND MULT.ID_MATERIA = SUBM.ID_MATERIA
  --F@001 01.12.2011
  WHERE
    MUAN.ID_MULTA = PI_N_ID_MULTA
    AND MUAN.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO;

end;

procedure SCOB_SP_S_MULTA_ANOTACION
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 05.09.2011
-- Proposito    : CONSULTA ANOTACIONES DE LAS MULTAS
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA            IN T_SCOB_MULTA.ID_MULTA%TYPE,
  PI_N_ID_MULTA_ANOTACION  IN T_SCOB_MULTA_ANOTACION.ID_MULTA_ANOTACION%TYPE,
  po_cu_retorno            out cu_rec_set
)
as
begin
  open  po_cu_retorno for
  SELECT
    NOTA.ID_MULTA_ANOTACION AS ID_MULTA_ANOTACION,
    NOTA.DES_ANOTACION AS DES_ANOTACION,
    NOTA.FEC_REGISTRO AS FEC_REGISTRO,
    NOTA.ID_USUARIO_REGISTRO AS ID_USUARIO_REGISTRO,
    USUA.USUARIO AS USUARIO,
    USUA.PRI_NOMBRE || ' ' || USUA.SEG_NOMBRE || ' ' || USUA.APE_PATERNO || ' ' || USUA.APE_MATERNO AS NOM_USUARIO

  FROM T_SCOB_MULTA_ANOTACION NOTA
  INNER JOIN T_SCOB_USUARIO USUA
        ON USUA.ID_USUARIO = NOTA.ID_USUARIO_REGISTRO
  WHERE NOTA.ESTADO = '1'
  AND NOTA.ID_MULTA = PI_N_ID_MULTA
  AND (NVL(PI_N_ID_MULTA_ANOTACION,0)=0 OR (NVL(PI_N_ID_MULTA_ANOTACION,0)<>0 AND NOTA.ID_MULTA_ANOTACION=PI_N_ID_MULTA_ANOTACION));

end;

procedure SCOB_SP_I_MULTA_ANOTACION
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 05.09.2011
-- Proposito    : inserta las anotaciones de una multa
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA               IN T_SCOB_MULTA.ID_MULTA%TYPE,
  PI_V_DES_ANOTACION          IN T_SCOB_MULTA_ANOTACION.DES_ANOTACION%TYPE,
  PI_N_ID_USUARIO_REGISTRO    IN T_SCOB_MULTA_ANOTACION.ID_USUARIO_REGISTRO%TYPE,
  PI_V_AUDUSUCREACION         IN T_SCOB_MULTA_ANOTACION.AUDUSUCREACION%TYPE,
  po_n_retorno                out number,
  po_n_cod_error              out number,
  po_v_msj_error              out varchar2
)
is
begin
  po_v_msj_error :='';
  po_n_cod_error := -1;

  INSERT INTO T_SCOB_MULTA_ANOTACION(
    ID_MULTA_ANOTACION,
    ID_MULTA,
    FEC_REGISTRO,
    ID_USUARIO_REGISTRO,
    DES_ANOTACION,
    ESTADO,
    AUDFECCREACION,
    AUDUSUCREACION
  )
  VALUES(
    SCOB_SQ_MULTA_ANOTACION.NEXTVAL,
    PI_N_ID_MULTA,
    SYSDATE,
    PI_N_ID_USUARIO_REGISTRO,
    PI_V_DES_ANOTACION,
    '1',
    SYSDATE,
    PI_V_AUDUSUCREACION
  ) RETURNING ID_MULTA_ANOTACION INTO po_n_retorno;

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

procedure SCOB_SP_U_MULTA_ANOTACION
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 05.09.2011
-- Proposito    : actualiza las anotaciones de una multa
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA_ANOTACION     IN T_SCOB_MULTA_ANOTACION.ID_MULTA_ANOTACION%TYPE,
  PI_V_DES_ANOTACION          IN T_SCOB_MULTA_ANOTACION.DES_ANOTACION%TYPE,
  PI_V_AUDUSUMODIFICACION     IN T_SCOB_MULTA_ANOTACION.AUDUSUMODIFICACION%TYPE,
  po_n_retorno                out number,
  po_n_cod_error              out number,
  po_v_msj_error              out varchar2
)
is
begin
  po_v_msj_error :='';
  po_n_cod_error := -1;

  UPDATE T_SCOB_MULTA_ANOTACION
  SET
    DES_ANOTACION = PI_V_DES_ANOTACION,
    AUDFECMODIFICACION = SYSDATE,
    AUDUSUMODIFICACION = PI_V_AUDUSUMODIFICACION
  WHERE ID_MULTA_ANOTACION = PI_N_ID_MULTA_ANOTACION;

  po_n_cod_error := 0;
  po_n_retorno := PI_N_ID_MULTA_ANOTACION;
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

procedure SCOB_SP_D_MULTA_ANOTACION
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 05.09.2011
-- Proposito    : actualiza al estado eliminado las anotaciones de las multas
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_V_ID_MULTA_ANOTACION     IN VARCHAR2,
  PI_V_AUDUSUMODIFICACION     IN T_SCOB_MULTA_ANOTACION.AUDUSUMODIFICACION%TYPE,
  po_n_retorno                out number,
  po_n_cod_error              out number,
  po_v_msj_error              out varchar2
)
is
begin
  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  UPDATE T_SCOB_MULTA_ANOTACION
  SET
    AUDUSUMODIFICACION = PI_V_AUDUSUMODIFICACION,
    AUDFECMODIFICACION = SYSDATE,
    ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_INACTIVO
  WHERE INSTR(PI_V_ID_MULTA_ANOTACION,'|' || TO_CHAR(ID_MULTA_ANOTACION) || '|' )>0;

  po_n_cod_error := 0;
  po_n_retorno := 0;
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


procedure SCOB_SP_S_VISTA_MULTA
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 21.10.2011
-- Proposito    : Consulta de multas
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA                IN T_SCOB_MULTA.ID_MULTA%TYPE,
  PI_V_CUM                     IN T_SCOB_MULTA.CUM%TYPE,
  PI_V_NRO_FILE_AEC            IN T_SCOB_MULTA.NRO_FILE_AEC%TYPE,
  PI_N_ID_AREA_COBRANZA        IN T_SCOB_MULTA.ID_AREA_COBRANZA%TYPE,
  PI_V_ANIO_FILE_AEC           IN T_SCOB_MULTA.ANIO_FILE_AEC%TYPE,
  po_cu_retorno                out cu_rec_set
)
as
begin

  open  po_cu_retorno for
    SELECT A.ID_MULTA,
    A.ID_MULTA_DETAL,
    A.TIPO_INSTANCIA_ACTUAL,
    A.IND_IMPROCEDENCIA,
    A.TIPO_INSTANCIA_INICIA,
    A.FLG_TIPO_MULTA,
    A.IND_RESPONSABILIDAD,
    A.IND_TIPO_MULTA,
    A.COD_MULTA,
    A.NRO_EXPED_UNICO,
    A.FEC_INGRESO_FILE,
    A.COD_MATERIA,
    A.NOM_MATERIA,
    A.ID_SUB_MATERIA,
    A.NOM_SUB_MATERIA,
    A.COD_ESTADO,
    A.DES_ESTADO,
    A.COD_ESTADO_EXPED,
    A.NOM_ESTADO_EXPED,
    A.DES_SANCIONADO,
    A.NRO_LIQUIDACION,
    A.NRO_EXPED_UNICO,
    A.NRO_EXPED_ANTIGUO,
    A.UBICACION_FILE,
    A.NRO_EXPEDIENTE,
    A.FEC_GENERACION_EXPED,
    A.COD_SEDE,
    A.NOM_SEDE,
    A.NRO_FILE,
    A.FLG_MULTA_RESOLUTIVO,
    A.DIREC_AREA_COB,
    A.NOM_AREA_COB,
    A.ID_EXPEDIENTE,
    A.FLG_CANCELADO,
    A.COD_ESTADO_REG_EXPED,
    A.ES_ACUM,
    A.TIPO_CAMBIO,
    A.NRO_FILE_CUM_ALFA,
    A.ID_EXPEDIENTE_MULTA,
    A.HAS_ADJ_ANOT,
    B.MONTO_ANTIDUMPING,
    B.MONTO_DA_INTERES_COMPENSATORIO,
    B.MONTO_DA_INTERES_MORATORIO,
    B.MONTO_TOTAL_DEUDA_DA,
    --montos deuda uit
    B.UIT,
    B.MONTO_UIT,
    --montos amortizado
    B.AMORTIZADO_UIT,
    B.MONTO_AMORTIZADO_DSCTO,
    --montos saldo
    B.SALDO_UIT
  FROM
    (SELECT DISTINCT MULT.ID_MULTA        AS ID_MULTA,
      MDET.ID_MULTA_DETAL                 AS ID_MULTA_DETAL,
      ORGR.TIPO_INSTANCIA                 AS TIPO_INSTANCIA_ACTUAL, --NRO_TIPO_INSTANCIA_ACTUAL
      NVL(MULT.FLG_MULTA_IMPROCEDENCIA,0) AS IND_IMPROCEDENCIA,     --0=NO TIENE;1=TIENE
      MULT.TIPO_INSTANCIA_INICIA          AS TIPO_INSTANCIA_INICIA,
      NVL(MULT.FLG_TIPO_MULTA,'0')        AS FLG_TIPO_MULTA,
      LTRIM(RTRIM(MULT.FLG_TIPO_MULTA))   AS IND_RESPONSABILIDAD,
      MULT.FLG_MULTA_RESOLUTIVO           AS IND_TIPO_MULTA, --1=MULTA OR;0=ANTIDUMPING
      --
      MULT.ANIO
      || MULT.CUM                                                                                        AS COD_MULTA,
      MULT.NRO_EXP_ADMINISTRATIVO                                                                        AS NRO_EXPED_UNICO,
      MULT.FEC_INGRESO_FILE                                                                              AS FEC_INGRESO_FILE,
      MULT.ID_MATERIA                                                                                    AS COD_MATERIA,
      MATE.DESCRIPCION                                                                                   AS NOM_MATERIA,
      MULT.ID_SUB_MATERIA                                                                                AS ID_SUB_MATERIA,
      SUMA.DESCRIPCION                                                                                   AS NOM_SUB_MATERIA,
      MDET.ESTADO_MULTA                                                                                  AS COD_ESTADO,
      SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_ESTADO_MULTA, MDET.ESTADO_MULTA) AS DES_ESTADO,
      EXPE.ESTADO_EXPEDIENTE                                                                             AS COD_ESTADO_EXPED,
      EST_EXPE.DESCRIPCION                                                                               AS NOM_ESTADO_EXPED,
      DECODE( MULT.FLG_TIPO_MULTA, SCOB_PK_CONSTANTES.C_FLG_TIPO_MULTA_SOLID, SCOB_PK_EXPEDIENTE.SCOB_FN_SANCIONADOS_MULTA(MULT.ID_MULTA,2), DECODE(PERS.TIPO_PERSONA,SCOB_PK_CONSTANTES.C_TIPO_PERS_JURIDICA, PERS.RAZON_SOCIAL, PERS.APE_PATERNO
      || ' '
      || PERS.APE_MATERNO
      || ' '
      || PERS.PRI_NOMBRE
      || ' '
      || PERS.SEG_NOMBRE
      || ' '
      || PERS.APE_CASADA) ) AS DES_SANCIONADO,
      --DATOS ANTIDUMPING
      DECODE(NVL(MUAN.NRO_LIQUIDACION_CODIGO,' '),NULL, MUAN.NRO_LIQUIDACION_CODIGO
      ||'-'
      || MUAN.NRO_LIQUIDACION_ANIO
      ||'/'
      || MUAN.NRO_LIQUIDACION_CORRELATIVO) AS NRO_LIQUIDACION,
      -------------------------------------------------------------------------------
      --MULT.NRO_EXP_ADMINISTRATIVO AS NRO_EXPED_UNICO,
      MDET.NRO_EXP_NIVEL AS NRO_EXPED_ANTIGUO,
      CASE
        WHEN EST_ENV_ARCHIVO_CENTRAL.COD_INTERNO = 2
        THEN EST_ENV_ARCHIVO_CENTRAL.TXT_DESCRIPCION
        WHEN MULT.NRO_FILE_AEC IS NULL
        THEN ' '
        ELSE 'En AEC'
      END AS UBICACION_FILE,
      EXPE.ANIO
      ||EXPE.NRO_EXPEDIENTE AS NRO_EXPEDIENTE,
      EXPE.FEC_INGRESO      AS FEC_GENERACION_EXPED,
      SEDE.ID_SEDE          AS COD_SEDE,
      SEDE.DESCRIPCION      AS NOM_SEDE,
      MULT.ANIO_FILE_AEC
      || ACOB.CODIGO
      || MULT.NRO_FILE_AEC                                          AS NRO_FILE,
      MULT.FLG_MULTA_RESOLUTIVO                                     AS FLG_MULTA_RESOLUTIVO,
      ACOB.DIRECCION                                                AS DIREC_AREA_COB,
      ACOB.DESCIPCION                                               AS NOM_AREA_COB,
      EXPE.ID_EXPEDIENTE                                            AS ID_EXPEDIENTE,
      EXPE.FLG_CANCELADO                                            AS FLG_CANCELADO,
      EXPE.Estado                                                   AS COD_ESTADO_REG_EXPED,
      SCOB_PK_EXPEDIENTE.SCOB_FN_ES_ACUM(NVL(EXPE.ID_EXPEDIENTE,0)) AS ES_ACUM,
      MUAN.TIPO_CAMBIO AS TIPO_CAMBIO,
      CASE
        WHEN EXPE.ID_EXPEDIENTE IS NOT NULL
        THEN SCOB_PK_EXPEDIENTE.SCOB_FN_NRO_FILE_CUM_ALFA(EXPE.ID_EXPEDIENTE,1)
        ELSE SCOB_PK_EXPEDIENTE.SCOB_FN_NRO_FILE_CUM_ALFA(MULT.ID_MULTA,2)
      END AS NRO_FILE_CUM_ALFA,
      EXMU.ID_EXPEDIENTE_MULTA AS ID_EXPEDIENTE_MULTA,
      SCOB_PK_MULTAS.SCOB_FN_HAS_ADJ_ANOT(MULT.ID_MULTA,2) AS HAS_ADJ_ANOT
    FROM T_SCOB_MULTA MULT
    INNER JOIN T_SCOB_MULTA_DETAL MDET
    ON MDET.ID_MULTA    = MULT.ID_MULTA
    AND MDET.FLG_ACTUAL = '1'
    AND MDET.ESTADO     = '1'
    LEFT JOIN T_SCOB_EXPEDIENTE_MULTA EXMU
    ON EXMU.ID_MULTA = MULT.ID_MULTA
    AND EXMU.ESTADO  = '1'
    LEFT JOIN T_SCOB_EXPEDIENTE EXPE
    ON EXPE.ID_EXPEDIENTE = EXMU.ID_EXPEDIENTE
    AND EXPE.ESTADO       = '1'
    INNER JOIN T_SCOB_SEDE SEDE
    ON SEDE.ID_SEDE = MULT.ID_SEDE
    LEFT JOIN T_SCOB_MULTA_ANTIDUMPING MUAN
    ON MUAN.ID_MULTA = MULT.ID_MULTA
    AND MUAN.ESTADO  = '1'
    INNER JOIN T_SCOB_ORGANO_RESOLUTIVO ORGR
    ON ORGR.ID_ORGANO_RESOLUTIVO = MDET.ID_ORGANO_RESOLUTIVO
    INNER JOIN T_SCOB_MATERIA MATE
    ON MATE.ID_MATERIA = MULT.ID_MATERIA
    INNER JOIN T_SCOB_SUBMATERIA SUMA
    ON SUMA.ID_SUBMATERIA = MULT.ID_SUB_MATERIA
    LEFT JOIN T_SCOB_USUARIO USEC
    ON USEC.ID_USUARIO = MDET.ID_USUARIO_SECRETARIO
    LEFT JOIN T_SCOB_MULTA_SANCIONADO SANC
    ON SANC.ID_MULTA_DETAL            = MDET.ID_MULTA_DETAL
    AND NVL(SANC.COD_TIPO_PERSONA,'1')='1'
    AND SANC.FLG_PRINCIPAL            = '1'
    AND SANC.ESTADO                   = '1'
    LEFT JOIN T_SCOB_PERSONA PERS
    ON PERS.ID_PERSONA       = SANC.ID_PERSONA
    AND PERS.COD_SANCIONADO IS NOT NULL
    LEFT JOIN T_SCOB_CLASIFICACION_INDECOPI CLIN
    ON CLIN.ID_CLASIFICACION = MULT.ID_CLASIFICACION
    LEFT JOIN T_SCOB_TABLA_DET MRES
    ON MRES.ID_TABLA                   = SCOB_PK_CONSTANTES.C_TBL_TIPO_RESP_MULTA_OR
    AND LTRIM(RTRIM(MRES.COD_INTERNO)) = LTRIM(RTRIM(MULT.FLG_TIPO_MULTA))
    LEFT JOIN T_SCOB_TABLA_DET EST_ENV_ARCHIVO_CENTRAL
    ON EST_ENV_ARCHIVO_CENTRAL.ID_TABLA                = 55
    AND TO_NUMBER(EST_ENV_ARCHIVO_CENTRAL.COD_INTERNO) = MULT.ESTADO_ENVIO_ARCHIVO
    LEFT JOIN T_SCOB_EST_EXP_COB EST_EXPE
    ON EST_EXPE.ID_EST_EXP_COB = EXPE.ESTADO_EXPEDIENTE
    LEFT JOIN T_SCOB_AREA_COBRANZA ACOB
    ON ACOB.ID_AREA_COBRANZA = MULT.ID_AREA_COBRANZA
    WHERE MULT.ESTADO        = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
    AND (NVL(PI_V_CUM,' ')   =' '
    OR ( NVL(PI_V_CUM,' ')  <>' '
    AND MULT.ANIO
      || TRIM(MULT.CUM) LIKE '%'
      || TRIM(PI_V_CUM)
      || '%') )
    AND (NVL(PI_N_ID_MULTA,0)          =0
    OR (NVL(PI_N_ID_MULTA,0)          <>0
    AND MULT.ID_MULTA                  = PI_N_ID_MULTA ))
    AND (NVL(PI_V_NRO_FILE_AEC,' ')    =' '
    OR ( NVL(PI_V_NRO_FILE_AEC,' ')   <>' '
    AND MULT.NRO_FILE_AEC              = LPAD(PI_V_NRO_FILE_AEC,10,'0000000000')))
    AND (NVL(PI_N_ID_AREA_COBRANZA,0)  =0
    OR ( NVL(PI_N_ID_AREA_COBRANZA,0) <>0
    AND MULT.ID_AREA_COBRANZA          = PI_N_ID_AREA_COBRANZA))
    AND (NVL(PI_V_ANIO_FILE_AEC,' ')   =' '
    OR ( NVL(PI_V_ANIO_FILE_AEC,' ')  <>' '
    AND MULT.ANIO_FILE_AEC             = PI_V_ANIO_FILE_AEC))
    ) A
  LEFT JOIN
    (SELECT DISTINCT
      --montos deuda antidumping
      -- MUAN.TIPO_CAMBIO             AS TIPO_CAMBIO,
      SUM(MUAN.MONTO_ANTIDUMPING)       AS MONTO_ANTIDUMPING,
      SUM(MUAN.MONTO_INTERES)           AS MONTO_DA_INTERES_COMPENSATORIO,
      SUM(MUAN.MONTO_INTERES_MORATORIO) AS MONTO_DA_INTERES_MORATORIO,
      SUM(MUAN.MONTO_TOTAL)             AS MONTO_TOTAL_DEUDA_DA,
      --montos deuda uit
      SUM(MDET.VALOR_UIT) AS UIT,
      SUM(MULT.MONTO_UIT) AS MONTO_UIT,
      --montos amortizado
      CASE
        WHEN MULT.COD_ESTADO_PAGO = SCOB_PK_CONSTANTES.C_EST_PAGO_DSCTO
        THEN 0.00
        ELSE SUM(MULT.TOTAL_AMORTIZADO)
      END AS AMORTIZADO_UIT,
      CASE
        WHEN MULT.COD_ESTADO_PAGO = SCOB_PK_CONSTANTES.C_EST_PAGO_DSCTO
        THEN SUM(DECODE(MULT.IND_DESCUENTO, '1', MULT.MONTO_PORCENTAJE_DSCTO, 0.00))
        ELSE 0.00
      END AS MONTO_AMORTIZADO_DSCTO,
      --montos saldo
      SUM(MULT.SALDO) AS SALDO_UIT,
      EXPE.ID_EXPEDIENTE, MULT.ID_MULTA
    FROM T_SCOB_MULTA MULT
    INNER JOIN T_SCOB_MULTA_DETAL MDET ON MDET.ID_MULTA = MULT.ID_MULTA AND MDET.FLG_ACTUAL = '1' AND MDET.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
    LEFT JOIN T_SCOB_EXPEDIENTE_MULTA EXMU ON EXMU.ID_MULTA = MULT.ID_MULTA AND EXMU.ESTADO  = '1'
    LEFT JOIN T_SCOB_EXPEDIENTE EXPE ON EXPE.ID_EXPEDIENTE = EXMU.ID_EXPEDIENTE AND EXPE.ESTADO = '1'
    INNER JOIN T_SCOB_SEDE SEDE ON SEDE.ID_SEDE = MULT.ID_SEDE
    LEFT JOIN T_SCOB_MULTA_ANTIDUMPING MUAN ON MUAN.ID_MULTA = MULT.ID_MULTA AND MUAN.ESTADO  = '1'
    INNER JOIN T_SCOB_ORGANO_RESOLUTIVO ORGR ON ORGR.ID_ORGANO_RESOLUTIVO = MDET.ID_ORGANO_RESOLUTIVO
    INNER JOIN T_SCOB_MATERIA MATE ON MATE.ID_MATERIA = MULT.ID_MATERIA
    INNER JOIN T_SCOB_SUBMATERIA SUMA ON SUMA.ID_SUBMATERIA = MULT.ID_SUB_MATERIA
    LEFT JOIN T_SCOB_USUARIO USEC ON USEC.ID_USUARIO = MDET.ID_USUARIO_SECRETARIO
    LEFT JOIN T_SCOB_MULTA_SANCIONADO SANC ON SANC.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL AND NVL(SANC.COD_TIPO_PERSONA,'1')='1' AND SANC.FLG_PRINCIPAL = '1' AND SANC.ESTADO = '1'
    LEFT JOIN T_SCOB_PERSONA PERS ON PERS.ID_PERSONA = SANC.ID_PERSONA AND PERS.COD_SANCIONADO IS NOT NULL
    LEFT JOIN T_SCOB_CLASIFICACION_INDECOPI CLIN ON CLIN.ID_CLASIFICACION = MULT.ID_CLASIFICACION
    LEFT JOIN T_SCOB_TABLA_DET MRES ON MRES.ID_TABLA = SCOB_PK_CONSTANTES.C_TBL_TIPO_RESP_MULTA_OR AND LTRIM(RTRIM(MRES.COD_INTERNO)) = LTRIM(RTRIM(MULT.FLG_TIPO_MULTA))
    LEFT JOIN T_SCOB_TABLA_DET EST_ENV_ARCHIVO_CENTRAL ON EST_ENV_ARCHIVO_CENTRAL.ID_TABLA = 55 AND TO_NUMBER(EST_ENV_ARCHIVO_CENTRAL.COD_INTERNO) = MULT.ESTADO_ENVIO_ARCHIVO
    LEFT JOIN T_SCOB_EST_EXP_COB EST_EXPE ON EST_EXPE.ID_EST_EXP_COB = EXPE.ESTADO_EXPEDIENTE
    LEFT JOIN T_SCOB_AREA_COBRANZA ACOB ON ACOB.ID_AREA_COBRANZA = MULT.ID_AREA_COBRANZA
    WHERE MULT.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
    AND (NVL(PI_V_CUM,' ')   =' ' OR ( NVL(PI_V_CUM,' ')  <>' ' AND MULT.ANIO || TRIM(MULT.CUM) LIKE '%' || TRIM(PI_V_CUM) || '%') )
    AND (NVL(PI_N_ID_MULTA,0) =0 OR (NVL(PI_N_ID_MULTA,0) <>0 AND MULT.ID_MULTA = PI_N_ID_MULTA ))
    AND (NVL(PI_V_NRO_FILE_AEC,' ') =' ' OR ( NVL(PI_V_NRO_FILE_AEC,' ') <>' ' AND MULT.NRO_FILE_AEC = LPAD(PI_V_NRO_FILE_AEC,10,'0000000000')))
    AND (NVL(PI_N_ID_AREA_COBRANZA,0)  =0 OR ( NVL(PI_N_ID_AREA_COBRANZA,0) <>0 AND MULT.ID_AREA_COBRANZA = PI_N_ID_AREA_COBRANZA))
    AND (NVL(PI_V_ANIO_FILE_AEC,' ')   =' ' OR ( NVL(PI_V_ANIO_FILE_AEC,' ')  <>' ' AND MULT.ANIO_FILE_AEC = PI_V_ANIO_FILE_AEC))
    GROUP BY EXPE.ID_EXPEDIENTE, MULT.COD_ESTADO_PAGO, MULT.ID_MULTA
    ) B ON A.ID_MULTA=B.ID_MULTA;
    -- A.ID_EXPEDIENTE=B.ID_EXPEDIENTE;
  --
  /*SELECT DISTINCT

    MULT.ID_MULTA AS ID_MULTA,
    MDET.ID_MULTA_DETAL AS ID_MULTA_DETAL,
    ORGR.TIPO_INSTANCIA AS TIPO_INSTANCIA_ACTUAL, --NRO_TIPO_INSTANCIA_ACTUAL
    NVL(MULT.FLG_MULTA_IMPROCEDENCIA,0) AS IND_IMPROCEDENCIA, --0=NO TIENE;1=TIENE
    MULT.TIPO_INSTANCIA_INICIA AS TIPO_INSTANCIA_INICIA,
    NVL(MULT.FLG_TIPO_MULTA,'0') AS FLG_TIPO_MULTA,
    LTRIM(RTRIM(MULT.FLG_TIPO_MULTA)) AS IND_RESPONSABILIDAD,
    MULT.FLG_MULTA_RESOLUTIVO AS IND_TIPO_MULTA, --1=MULTA OR;0=ANTIDUMPING
    --
    MULT.ANIO || MULT.CUM AS COD_MULTA,
    MULT.NRO_EXP_ADMINISTRATIVO AS NRO_EXPED_UNICO,
    MULT.FEC_INGRESO_FILE AS FEC_INGRESO_FILE,

    MULT.ID_MATERIA AS COD_MATERIA,
    MATE.DESCRIPCION AS NOM_MATERIA,
    MULT.ID_SUB_MATERIA AS ID_SUB_MATERIA,
    SUMA.DESCRIPCION AS NOM_SUB_MATERIA,
    MDET.ESTADO_MULTA AS COD_ESTADO,
    SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_ESTADO_MULTA, MDET.ESTADO_MULTA) AS DES_ESTADO,
    EXPE.ESTADO_EXPEDIENTE AS COD_ESTADO_EXPED,
    EST_EXPE.DESCRIPCION  AS NOM_ESTADO_EXPED,
    DECODE(
       MULT.FLG_TIPO_MULTA,
       SCOB_PK_CONSTANTES.C_FLG_TIPO_MULTA_SOLID,
       SCOB_PK_EXPEDIENTE.SCOB_FN_SANCIONADOS_MULTA(MULT.ID_MULTA,2),
       DECODE(PERS.TIPO_PERSONA,SCOB_PK_CONSTANTES.C_TIPO_PERS_JURIDICA,  PERS.RAZON_SOCIAL,  PERS.APE_PATERNO  || ' ' || PERS.APE_MATERNO  || ' ' || PERS.PRI_NOMBRE || ' ' || PERS.SEG_NOMBRE || ' ' || PERS.APE_CASADA)
    ) AS DES_SANCIONADO,

    --DATOS ANTIDUMPING
    DECODE(NVL(MUAN.NRO_LIQUIDACION_CODIGO,' '),NULL,
    MUAN.NRO_LIQUIDACION_CODIGO ||'-'|| MUAN.NRO_LIQUIDACION_ANIO ||'/'|| MUAN.NRO_LIQUIDACION_CORRELATIVO) AS NRO_LIQUIDACION,

    -------------------------------------------------------------------------------
    --montos deuda antidumping
    MUAN.TIPO_CAMBIO AS TIPO_CAMBIO,
    MUAN.MONTO_ANTIDUMPING AS MONTO_ANTIDUMPING,
    MUAN.MONTO_INTERES AS MONTO_DA_INTERES_COMPENSATORIO,
    MUAN.MONTO_INTERES_MORATORIO AS MONTO_DA_INTERES_MORATORIO,
    MUAN.MONTO_TOTAL AS MONTO_TOTAL_DEUDA_DA,
    --montos deuda uit
    MDET.VALOR_UIT AS UIT,
    MULT.MONTO_UIT AS MONTO_UIT,
    --montos amortizado
    CASE
       WHEN MULT.COD_ESTADO_PAGO = SCOB_PK_CONSTANTES.C_EST_PAGO_DSCTO THEN
           0.00
       ELSE MULT.TOTAL_AMORTIZADO
       END
    AS AMORTIZADO_UIT,
    CASE
       WHEN MULT.COD_ESTADO_PAGO = SCOB_PK_CONSTANTES.C_EST_PAGO_DSCTO THEN
           DECODE(MULT.IND_DESCUENTO, '1', MULT.MONTO_PORCENTAJE_DSCTO, 0.00)
       ELSE 0.00
       END
    AS MONTO_AMORTIZADO_DSCTO,
    --montos saldo
    MULT.SALDO AS SALDO_UIT,
    -------------------------------------------------------------------------------
    MULT.NRO_EXP_ADMINISTRATIVO AS NRO_EXPED_UNICO,
    MDET.NRO_EXP_NIVEL AS NRO_EXPED_ANTIGUO,

    CASE
         WHEN EST_ENV_ARCHIVO_CENTRAL.COD_INTERNO = 2 THEN
              EST_ENV_ARCHIVO_CENTRAL.TXT_DESCRIPCION
         WHEN MULT.NRO_FILE_AEC IS NULL THEN ' '
         ELSE 'En AEC'
    END AS UBICACION_FILE,

    EXPE.ANIO||EXPE.NRO_EXPEDIENTE AS NRO_EXPEDIENTE,
    EXPE.FEC_INGRESO AS FEC_GENERACION_EXPED,
    SEDE.ID_SEDE AS COD_SEDE,
    SEDE.DESCRIPCION AS NOM_SEDE,
    MULT.ANIO_FILE_AEC || ACOB.CODIGO || MULT.NRO_FILE_AEC AS NRO_FILE,
    MULT.FLG_MULTA_RESOLUTIVO AS FLG_MULTA_RESOLUTIVO,
    ACOB.DIRECCION AS DIREC_AREA_COB,
    ACOB.DESCIPCION AS NOM_AREA_COB,
    EXPE.ID_EXPEDIENTE AS ID_EXPEDIENTE,
    EXPE.FLG_CANCELADO AS FLG_CANCELADO,
    EXPE.Estado AS COD_ESTADO_REG_EXPED,
    SCOB_PK_EXPEDIENTE.SCOB_FN_ES_ACUM(NVL(EXPE.ID_EXPEDIENTE,0)) AS ES_ACUM
  FROM T_SCOB_MULTA MULT

  INNER JOIN T_SCOB_MULTA_DETAL MDET
        ON MDET.ID_MULTA = MULT.ID_MULTA
        AND MDET.FLG_ACTUAL = '1'
        AND MDET.ESTADO = '1'

  LEFT JOIN T_SCOB_EXPEDIENTE_MULTA EXMU
       ON EXMU.ID_MULTA = MULT.ID_MULTA
       AND EXMU.ESTADO = '1'

  LEFT JOIN T_SCOB_EXPEDIENTE EXPE
       ON EXPE.ID_EXPEDIENTE = EXMU.ID_EXPEDIENTE
       AND EXPE.ESTADO = '1'

  INNER JOIN T_SCOB_SEDE SEDE
        ON SEDE.ID_SEDE = MULT.ID_SEDE

  LEFT JOIN T_SCOB_MULTA_ANTIDUMPING MUAN
       ON MUAN.ID_MULTA = MULT.ID_MULTA
       AND MUAN.ESTADO = '1'

  INNER JOIN T_SCOB_ORGANO_RESOLUTIVO ORGR
        ON ORGR.ID_ORGANO_RESOLUTIVO = MDET.ID_ORGANO_RESOLUTIVO

  INNER JOIN T_SCOB_MATERIA MATE
        ON MATE.ID_MATERIA = MULT.ID_MATERIA

  INNER JOIN T_SCOB_SUBMATERIA SUMA
        ON SUMA.ID_SUBMATERIA = MULT.ID_SUB_MATERIA

  LEFT JOIN T_SCOB_USUARIO USEC
        ON USEC.ID_USUARIO = MDET.ID_USUARIO_SECRETARIO

  LEFT JOIN T_SCOB_MULTA_SANCIONADO SANC
        ON SANC.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL
        AND NVL(SANC.COD_TIPO_PERSONA,'1')='1'
        AND SANC.FLG_PRINCIPAL = '1'
        AND SANC.ESTADO = '1'

  LEFT JOIN T_SCOB_PERSONA PERS
        ON PERS.ID_PERSONA = SANC.ID_PERSONA
        AND PERS.COD_SANCIONADO IS NOT NULL

  LEFT JOIN T_SCOB_CLASIFICACION_INDECOPI CLIN
       ON CLIN.ID_CLASIFICACION = MULT.ID_CLASIFICACION

  LEFT JOIN T_SCOB_TABLA_DET MRES
       ON MRES.ID_TABLA = SCOB_PK_CONSTANTES.C_TBL_TIPO_RESP_MULTA_OR
       AND LTRIM(RTRIM(MRES.COD_INTERNO)) = LTRIM(RTRIM(MULT.FLG_TIPO_MULTA))

  LEFT JOIN T_SCOB_TABLA_DET EST_ENV_ARCHIVO_CENTRAL
       ON EST_ENV_ARCHIVO_CENTRAL.ID_TABLA = 55
       AND TO_NUMBER(EST_ENV_ARCHIVO_CENTRAL.COD_INTERNO) = MULT.ESTADO_ENVIO_ARCHIVO

  LEFT JOIN T_SCOB_EST_EXP_COB EST_EXPE
       ON EST_EXPE.ID_EST_EXP_COB = EXPE.ESTADO_EXPEDIENTE

  LEFT JOIN T_SCOB_AREA_COBRANZA ACOB
       ON ACOB.ID_AREA_COBRANZA = MULT.ID_AREA_COBRANZA

  WHERE
    MULT.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO

    AND (NVL(PI_V_CUM,' ')=' ' OR (
                        NVL(PI_V_CUM,' ')<>' '
                        AND MULT.ANIO || TRIM(MULT.CUM) LIKE '%' || TRIM(PI_V_CUM) || '%')
        )

    AND (NVL(PI_N_ID_MULTA,0)=0 OR (NVL(PI_N_ID_MULTA,0)<>0 AND MULT.ID_MULTA = PI_N_ID_MULTA ))

    AND (NVL(PI_V_NRO_FILE_AEC,' ')=' ' OR (
           NVL(PI_V_NRO_FILE_AEC,' ')<>' ' AND
           MULT.NRO_FILE_AEC = LPAD(PI_V_NRO_FILE_AEC,10,'0000000000')))

    AND (NVL(PI_N_ID_AREA_COBRANZA,0)=0 OR (
           NVL(PI_N_ID_AREA_COBRANZA,0)<>0 AND MULT.ID_AREA_COBRANZA = PI_N_ID_AREA_COBRANZA))

    AND (NVL(PI_V_ANIO_FILE_AEC,' ')=' ' OR (
           NVL(PI_V_ANIO_FILE_AEC,' ')<>' ' AND MULT.ANIO_FILE_AEC = PI_V_ANIO_FILE_AEC))
    ;*/
end;

procedure SCOB_SP_S_VISTA_MULTA_ACUM
/*
-----------------------------------------------------------
-- Autor        : JPHR
-- Creado       : 18.01.2017
-- Proposito    : Consulta de multas con o sin acumular
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA                IN T_SCOB_MULTA.ID_MULTA%TYPE,
  PI_V_CUM                     IN T_SCOB_MULTA.CUM%TYPE,
  PI_V_NRO_FILE_AEC            IN T_SCOB_MULTA.NRO_FILE_AEC%TYPE,
  PI_N_ID_AREA_COBRANZA        IN T_SCOB_MULTA.ID_AREA_COBRANZA%TYPE,
  PI_V_ANIO_FILE_AEC           IN T_SCOB_MULTA.ANIO_FILE_AEC%TYPE,
  po_cu_retorno                out cu_rec_set
)
as
begin

  open  po_cu_retorno for

 SELECT A.*,B.NRO_CUMS FROM(
 SELECT DISTINCT

    MULT.ID_MULTA AS ID_MULTA,
    MDET.ID_MULTA_DETAL AS ID_MULTA_DETAL,
    ORGR.TIPO_INSTANCIA AS TIPO_INSTANCIA_ACTUAL, --NRO_TIPO_INSTANCIA_ACTUAL
    NVL(MULT.FLG_MULTA_IMPROCEDENCIA,0) AS IND_IMPROCEDENCIA, --0=NO TIENE;1=TIENE
    MULT.TIPO_INSTANCIA_INICIA AS TIPO_INSTANCIA_INICIA,
    NVL(MULT.FLG_TIPO_MULTA,'0') AS FLG_TIPO_MULTA,
    LTRIM(RTRIM(MULT.FLG_TIPO_MULTA)) AS IND_RESPONSABILIDAD,
    MULT.FLG_MULTA_RESOLUTIVO AS IND_TIPO_MULTA, --1=MULTA OR;0=ANTIDUMPING
    --
    MULT.ANIO || MULT.CUM AS COD_MULTA,
    MULT.NRO_EXP_ADMINISTRATIVO AS NRO_EXPED_UNICO,
    MULT.FEC_INGRESO_FILE AS FEC_INGRESO_FILE,

    MULT.ID_MATERIA AS COD_MATERIA,
    MATE.DESCRIPCION AS NOM_MATERIA,
    MULT.ID_SUB_MATERIA AS ID_SUB_MATERIA,
    SUMA.DESCRIPCION AS NOM_SUB_MATERIA,
    MDET.ESTADO_MULTA AS COD_ESTADO,
    SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_ESTADO_MULTA, MDET.ESTADO_MULTA) AS DES_ESTADO,
    EXPE.ESTADO_EXPEDIENTE AS COD_ESTADO_EXPED,
    EST_EXPE.DESCRIPCION  AS NOM_ESTADO_EXPED,
    DECODE(
       MULT.FLG_TIPO_MULTA,
       SCOB_PK_CONSTANTES.C_FLG_TIPO_MULTA_SOLID,
       SCOB_PK_EXPEDIENTE.SCOB_FN_SANCIONADOS_MULTA(MULT.ID_MULTA,2),
       DECODE(PERS.TIPO_PERSONA,SCOB_PK_CONSTANTES.C_TIPO_PERS_JURIDICA,  PERS.RAZON_SOCIAL,  PERS.APE_PATERNO  || ' ' || PERS.APE_MATERNO  || ' ' || PERS.PRI_NOMBRE || ' ' || PERS.SEG_NOMBRE || ' ' || PERS.APE_CASADA)
    ) AS DES_SANCIONADO,

    --DATOS ANTIDUMPING
    DECODE(NVL(MUAN.NRO_LIQUIDACION_CODIGO,' '),NULL,
    MUAN.NRO_LIQUIDACION_CODIGO ||'-'|| MUAN.NRO_LIQUIDACION_ANIO ||'/'|| MUAN.NRO_LIQUIDACION_CORRELATIVO) AS NRO_LIQUIDACION,

    -------------------------------------------------------------------------------
    --montos deuda antidumping
    MUAN.TIPO_CAMBIO AS TIPO_CAMBIO,
    MUAN.MONTO_ANTIDUMPING AS MONTO_ANTIDUMPING,
    MUAN.MONTO_INTERES AS MONTO_DA_INTERES_COMPENSATORIO,
    MUAN.MONTO_INTERES_MORATORIO AS MONTO_DA_INTERES_MORATORIO,
    MUAN.MONTO_TOTAL AS MONTO_TOTAL_DEUDA_DA,
    --montos deuda uit
    MDET.VALOR_UIT AS UIT,
    MULT.MONTO_UIT AS MONTO_UIT,
    --montos amortizado
    CASE
       WHEN MULT.COD_ESTADO_PAGO = SCOB_PK_CONSTANTES.C_EST_PAGO_DSCTO THEN
           0.00
       ELSE MULT.TOTAL_AMORTIZADO
       END
    AS AMORTIZADO_UIT,
    CASE
       WHEN MULT.COD_ESTADO_PAGO = SCOB_PK_CONSTANTES.C_EST_PAGO_DSCTO THEN
           DECODE(MULT.IND_DESCUENTO, '1', MULT.MONTO_PORCENTAJE_DSCTO, 0.00)
       ELSE 0.00
       END
    AS MONTO_AMORTIZADO_DSCTO,
    --montos saldo
    MULT.SALDO AS SALDO_UIT,
    -------------------------------------------------------------------------------
    MDET.NRO_EXP_NIVEL AS NRO_EXPED_ANTIGUO,

    CASE
         WHEN EST_ENV_ARCHIVO_CENTRAL.COD_INTERNO = 2 THEN
              EST_ENV_ARCHIVO_CENTRAL.TXT_DESCRIPCION
         WHEN MULT.NRO_FILE_AEC IS NULL THEN ' '
         ELSE 'En AEC'
    END AS UBICACION_FILE,

    EXPE.ANIO||EXPE.NRO_EXPEDIENTE AS NRO_EXPEDIENTE,
    EXPE.FEC_INGRESO AS FEC_GENERACION_EXPED,
    SEDE.ID_SEDE AS COD_SEDE,
    SEDE.DESCRIPCION AS NOM_SEDE,
    MULT.ANIO_FILE_AEC || ACOB.CODIGO || MULT.NRO_FILE_AEC AS NRO_FILE,
    MULT.FLG_MULTA_RESOLUTIVO AS FLG_MULTA_RESOLUTIVO,
    ACOB.DIRECCION AS DIREC_AREA_COB,
    ACOB.DESCIPCION AS NOM_AREA_COB,
    EXPE.ID_EXPEDIENTE AS ID_EXPEDIENTE,
    EXPE.FLG_CANCELADO AS FLG_CANCELADO,
    EXPE.Estado AS COD_ESTADO_REG_EXPED,
    EXPE.NRO_CUMS AS NRO_CUMS
  FROM T_SCOB_MULTA MULT

  INNER JOIN T_SCOB_MULTA_DETAL MDET
        ON MDET.ID_MULTA = MULT.ID_MULTA
        AND MDET.FLG_ACTUAL = '1'
        AND MDET.ESTADO = '1'

  LEFT JOIN T_SCOB_EXPEDIENTE_MULTA EXMU
   ON EXMU.ID_MULTA = MULT.ID_MULTA
       AND EXMU.ESTADO = '1'

  LEFT JOIN T_SCOB_EXPEDIENTE EXPE
       ON EXPE.ID_EXPEDIENTE = EXMU.ID_EXPEDIENTE
       AND EXPE.ESTADO = '1'

  INNER JOIN T_SCOB_SEDE SEDE
        ON SEDE.ID_SEDE = MULT.ID_SEDE

  LEFT JOIN T_SCOB_MULTA_ANTIDUMPING MUAN
       ON MUAN.ID_MULTA = MULT.ID_MULTA
       AND MUAN.ESTADO = '1'

  INNER JOIN T_SCOB_ORGANO_RESOLUTIVO ORGR
        ON ORGR.ID_ORGANO_RESOLUTIVO = MDET.ID_ORGANO_RESOLUTIVO

  INNER JOIN T_SCOB_MATERIA MATE
        ON MATE.ID_MATERIA = MULT.ID_MATERIA

  INNER JOIN T_SCOB_SUBMATERIA SUMA
        ON SUMA.ID_SUBMATERIA = MULT.ID_SUB_MATERIA

  LEFT JOIN T_SCOB_USUARIO USEC
        ON USEC.ID_USUARIO = MDET.ID_USUARIO_SECRETARIO

  LEFT JOIN T_SCOB_MULTA_SANCIONADO SANC
        ON SANC.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL
        AND NVL(SANC.COD_TIPO_PERSONA,'1')='1'
        AND SANC.FLG_PRINCIPAL = '1'
        AND SANC.ESTADO = '1'

  LEFT JOIN T_SCOB_PERSONA PERS
        ON PERS.ID_PERSONA = SANC.ID_PERSONA
        AND PERS.COD_SANCIONADO IS NOT NULL

  LEFT JOIN T_SCOB_CLASIFICACION_INDECOPI CLIN
       ON CLIN.ID_CLASIFICACION = MULT.ID_CLASIFICACION

  LEFT JOIN T_SCOB_TABLA_DET MRES
       ON MRES.ID_TABLA = SCOB_PK_CONSTANTES.C_TBL_TIPO_RESP_MULTA_OR
       AND LTRIM(RTRIM(MRES.COD_INTERNO)) = LTRIM(RTRIM(MULT.FLG_TIPO_MULTA))

  LEFT JOIN T_SCOB_TABLA_DET EST_ENV_ARCHIVO_CENTRAL
       ON EST_ENV_ARCHIVO_CENTRAL.ID_TABLA = 55
       AND TO_NUMBER(EST_ENV_ARCHIVO_CENTRAL.COD_INTERNO) = MULT.ESTADO_ENVIO_ARCHIVO

  LEFT JOIN T_SCOB_EST_EXP_COB EST_EXPE
       ON EST_EXPE.ID_EST_EXP_COB = EXPE.ESTADO_EXPEDIENTE

  LEFT JOIN T_SCOB_AREA_COBRANZA ACOB
       ON ACOB.ID_AREA_COBRANZA = MULT.ID_AREA_COBRANZA

  WHERE
    MULT.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO

    AND (NVL(PI_V_CUM,' ')=' ' OR (
                        NVL(PI_V_CUM,' ')<>' '
                        AND MULT.ANIO || TRIM(MULT.CUM) LIKE '%' || TRIM(PI_V_CUM) || '%')
        )

    AND (NVL(PI_N_ID_MULTA,0)=0 OR (NVL(PI_N_ID_MULTA,0)<>0 AND MULT.ID_MULTA = PI_N_ID_MULTA ))

    AND (NVL(PI_V_NRO_FILE_AEC,' ')=' ' OR (
           NVL(PI_V_NRO_FILE_AEC,' ')<>' ' AND
           MULT.NRO_FILE_AEC = LPAD(PI_V_NRO_FILE_AEC,10,'0000000000')))

    AND (NVL(PI_N_ID_AREA_COBRANZA,0)=0 OR (
           NVL(PI_N_ID_AREA_COBRANZA,0)<>0 AND MULT.ID_AREA_COBRANZA = PI_N_ID_AREA_COBRANZA))

    AND (NVL(PI_V_ANIO_FILE_AEC,' ')=' ' OR (
           NVL(PI_V_ANIO_FILE_AEC,' ')<>' ' AND MULT.ANIO_FILE_AEC = PI_V_ANIO_FILE_AEC))

    --AND EXMU.FLG_INACTIVO IS NULL
 )A
INNER JOIN (
    SELECT MUL.ID_MULTA,EX.NRO_CUMS FROM T_SCOB_EXPEDIENTE EX
    INNER JOIN T_SCOB_EXPEDIENTE_MULTA EM
    ON EX.ID_EXPEDIENTE = EM.ID_EXPEDIENTE
    INNER JOIN T_SCOB_MULTA MUL
    ON MUL.ID_MULTA = EM.ID_MULTA
    /*WHERE
    EM.FLG_INACTIVO IS NULL*/
    )B
  ON A.ID_MULTA = B.ID_MULTA
  ;
end;


procedure SCOB_SP_S_VISTA_ESTADO_MULTA
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 24.10.2011
-- Proposito    : Consulta de estados vista multas
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA                IN T_SCOB_MULTA.ID_MULTA%TYPE,
  PI_ID_FASE                   IN INTEGER,
  PI_ID_ESTADO                 IN INTEGER,
  PI_ID_MOTIVO                 IN NUMBER,
  po_cu_retorno                out cu_rec_set
)
as
begin
  --PI_V_ID_TIPO_SERVICIO RMCA
  open  po_cu_retorno for
  SELECT
    MULTA.ID_MULTA,
    MULTA.ID_FASE,
    MULTA.NOM_FASE,
    MULTA.COD_ESTADO,
    MULTA.NOM_ESTADO,
    MULTA.COD_MOTIVO,
    MULTA.NOM_MOTIVO,
    MULTA.FEC_ESTADO,
    MULTA.USU_ESTADO
  FROM
  (SELECT
        MEST.ID_MULTA_ESTADO AS ID_ESTADO,
        MULT.ID_MULTA AS ID_MULTA,
        TO_NUMBER(NVL(EST_MULTA_OR.TXT_VALOR1,'0')) AS ID_FASE,
        FASE.TXT_DESCRIPCION AS NOM_FASE,
        MEST.ESTADO_MULTA AS COD_ESTADO,
        EST_MULTA_OR.TXT_DESCRIPCION AS NOM_ESTADO,
        MOT_MUL.ID_MOTIVO AS COD_MOTIVO,
        -- Req. 2 - @dcelis/Inicio
        --DECODE(TO_NUMBER(FASE.COD_INTERNO),SCOB_PK_CONSTANTES.C_COD_FASE_MULTA_OR,' ', MOT_MUL.DESCRIPCION) AS NOM_MOTIVO,
        NVL(DECODE(TO_NUMBER(FASE.COD_INTERNO),SCOB_PK_CONSTANTES.C_COD_FASE_MULTA_OR,NULL, MOT_MUL.DESCRIPCION),MEST.VC_DESCRIPCION) AS NOM_MOTIVO,
        -- Req. 2 - @dcelis/Fin
        MEST.FEC_ESTADO_MULTA AS FEC_ESTADO,
        MEST.AUDUSUCREACION AS USU_ESTADO
  FROM T_SCOB_MULTA_ESTADO MEST
  INNER JOIN T_SCOB_MULTA MULT
        ON MULT.ID_MULTA = MEST.ID_MULTA
        AND MULT.ESTADO = '1'
  INNER JOIN T_SCOB_TABLA_DET EST_MULTA_OR
      ON EST_MULTA_OR.ID_TABLA = 5
      AND EST_MULTA_OR.COD_INTERNO = MEST.ESTADO_MULTA
  INNER JOIN T_SCOB_TABLA_DET FASE
        ON FASE.COD_INTERNO =  EST_MULTA_OR.TXT_VALOR1
        AND FASE.ID_TABLA = 59
  LEFT JOIN T_SCOB_EST_MUL_COB_MOTIVO MOT_MUL
       ON MOT_MUL.ID_MOTIVO = MEST.COD_MOTIVO
  WHERE MEST.ESTADO = '1'
  UNION
  SELECT
        EEST.ID_EXPEDIENTE_ESTADO AS ID_ESTADO,
        EXPE_MULT.ID_MULTA AS ID_MULTA,
        3 AS ID_FASE,
        FASE.TXT_DESCRIPCION AS NOM_FASE,
        EEST.ESTADO_EXPEDIENTE AS COD_ESTADO,
        EST_EXPE.DESCRIPCION AS NOM_ESTADO,
        EEST.ID_MOTIVO AS COD_MOTIVO,
        MOTI_EXPE.DESCRIPCION AS NOM_MOTIVO,
        EEST.AUDFECCREACION AS FEC_ESTADO,
        EEST.AUDUSUCREACION AS USU_ESTADO
  FROM T_SCOB_EXPEDIENTE_ESTADO EEST

  INNER JOIN T_SCOB_EXPEDIENTE EXPE
        ON EXPE.ID_EXPEDIENTE = EEST.ID_EXPEDIENTE
        AND EXPE.ESTADO = '1'

  INNER JOIN T_SCOB_EXPEDIENTE_MULTA EXPE_MULT
        ON EXPE_MULT.ID_EXPEDIENTE = EEST.ID_EXPEDIENTE
        AND EXPE_MULT.ESTADO = '1'

  LEFT JOIN T_SCOB_EST_EXP_COB EST_EXPE
        ON EST_EXPE.ID_EST_EXP_COB = EEST.ESTADO_EXPEDIENTE

  LEFT JOIN T_SCOB_EST_EXP_COB_MOTIVO MOTI_EXPE
       ON MOTI_EXPE.ID_EST_EXP_COB = EST_EXPE.ID_EST_EXP_COB
       AND MOTI_EXPE.ID_MOTIVO = EEST.ID_MOTIVO
       AND MOTI_EXPE.ESTADO = '1'

  INNER JOIN T_SCOB_TABLA_DET FASE
        ON FASE.COD_INTERNO =  3
        AND FASE.ID_TABLA = 59

  WHERE EEST.ESTADO = '1'
  ) MULTA
  WHERE
      (PI_N_ID_MULTA=0 OR (PI_N_ID_MULTA<>0 AND MULTA.ID_MULTA = PI_N_ID_MULTA))
      AND (PI_ID_FASE=0 OR (PI_ID_FASE<>0 AND MULTA.ID_FASE = PI_ID_FASE))
      AND (PI_ID_ESTADO=0 OR (PI_ID_ESTADO<>0 AND MULTA.COD_ESTADO = PI_ID_ESTADO))
      AND (PI_ID_MOTIVO=0 OR (PI_ID_MOTIVO<>0 AND MULTA.COD_MOTIVO = PI_ID_MOTIVO))
  ORDER BY ID_FASE DESC, ID_ESTADO DESC;
end;

procedure SCOB_SP_S_VISTA_INGRESOS_MULTA
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 24.10.2011
-- Proposito    : Consulta de ingresos vista multas
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA                IN T_SCOB_MULTA.ID_MULTA%TYPE,
  po_cu_retorno                out cu_rec_set
)
as
begin
  open  po_cu_retorno for
  SELECT
    MULT.ID_MULTA AS ID_MULTA,
    MULT.ID_AREA_COBRANZA AS ID_AREA_COBRANZA,
    ACOB.DESCIPCION AS NOM_AREA_COBRANZA,
    MCOB.NRO_INGRESO AS NRO_INGRESO,
    MCOB.FECHA_INGRESO AS FEC_INGRESO,
    MCOB.AUDUSUCREACION AS USU_INGRESO,
    MCOB.FECHA_VALIDACION AS FEC_VALIDACION,
    MCOB.AUDUSUMODIFICACION AS USU_VALIDACION,
    MULT.FECHA_ASIG_COBRANZA AS FEC_ASIGNACION,
    UASIG.USUARIO AS USU_ASIGNACION,
    --
    MIMP.NRO_IMPROCEDENCIA AS NRO_IMPROCEDENCIA,
    EST_MUL.TXT_DESCRIPCION AS NOM_ESTADO,
    MOT_MULT.DESCRIPCION AS NOM_MOTIVO,
    MIMP.AUDUSUCREACION AS USU_IMPROCEDENCIA,
    MIMP.AUDFECCREACION AS FEC_IMPROCEDENCIA
  FROM T_SCOB_MULTA_COBRANZA MCOB
  INNER JOIN T_SCOB_MULTA MULT
        ON MULT.ID_MULTA = MCOB.ID_MULTA
  INNER JOIN T_SCOB_AREA_COBRANZA ACOB
        ON ACOB.ID_AREA_COBRANZA = MULT.ID_AREA_COBRANZA
  LEFT JOIN T_SCOB_USUARIO UASIG
        ON UASIG.ID_USUARIO = MULT.ID_USUARIO_ASIG_COBRANZA
  LEFT JOIN T_SCOB_MULTA_IMPROCEDENCIA MIMP
        ON MIMP.ID_MULTA_COBRANZA = MCOB.ID_MULTA_COBRANZA
        AND MIMP.ESTADO = '1'
  LEFT JOIN T_SCOB_EST_MUL_COB_MOTIVO MOT_MULT
       ON MOT_MULT.ID_MOTIVO = MIMP.COD_MOTIVO
  LEFT JOIN T_SCOB_TABLA_DET EST_MUL
       ON EST_MUL.ID_TABLA = 5
       AND TO_NUMBER(EST_MUL.COD_INTERNO) = MIMP.ESTADO_MULTA

  WHERE MCOB.ESTADO = '1'
  AND MCOB.ID_MULTA = PI_N_ID_MULTA
  ORDER BY MCOB.ID_MULTA_COBRANZA DESC
  ;
END;



/*****************************************************************
'* Nombre           :  SCOB_SP_S_VISTA_DOCUMENTOS
'* Parámetros       :  PIN_NU_ID_MULTA: Id de la multa.
'*                     PIN_NU_ID_TIPO_DOCUMENTO: Id del tipo de documento
'*                     PIN_NU_ID_SUBTIPO_DOC: Id del subtipo del documento                       
'*                     PIN_VC_NRO_DOCUMENTO: Numero del documento
'*                     PIN_NU_COD_FASE: Codigo de la fase.
'*                     PIN_NU_COD_ESTADO: Codigo dle estado.
'*                     PIN_NU_ID_MOTIVO: Id del motivo del estado.
'*                     PIN_NU_COD_TIPO_GEN: Codigo del tipo de degeneracion
'* Propósito        :  Consulta los documentos de la multa.
'* Output           :  POUT_CUR_RETORNO : Resultados
'* Creado por       :  RMCA
'* Fec Creación     :  2011-10-28 17:06:00
'* Fec Actualización:  2016-09-12 JPHR  Añade 3 campos nuevos: estado, fecha y
                       hora de tramite.
'*                     2017-02-17 JPHR   Añade campo de Fecha de Recepcion de
                        documentos UCI en AEC ya sea en
                        Multa-Documento-Gen o en Expediente-Documento
'*                      2022-09-28 jjimenez Se reestructura la forma de la consulta 
                        para optimizar tiempo de ejecucion.                                            
'****************************************************************/
procedure SCOB_SP_S_VISTA_DOCUMENTOS(PIN_NU_ID_MULTA              IN NUMBER,
                                     PIN_NU_ID_TIPO_DOCUMENTO     IN T_SCOB_TIPO_DOCUMENTO.ID_TIPO_DOCUMENTO%TYPE,
                                     PIN_NU_ID_SUBTIPO_DOC        IN INTEGER,
                                     PIN_VC_NRO_DOCUMENTO         IN VARCHAR2,
                                     PIN_NU_COD_FASE              IN INTEGER,
                                     PIN_NU_COD_ESTADO            IN INTEGER,
                                     PIN_NU_ID_MOTIVO             IN NUMBER,
                                     PIN_NU_COD_TIPO_GEN          IN INTEGER,
                                     POUT_CUR_RETORNO             OUT cu_rec_set)
as
--  N_ID_MULTA                   NUMBER;
begin

  open  POUT_CUR_RETORNO for
  SELECT
    SCOB_PK_CONSTANTES.C_COD_FASE_MULTA_COB AS COD_FASE,
    FASE.TXT_DESCRIPCION AS NOM_FASE,
    MUL_DOC.ID_MULTA AS ID_MULTA,
    0 AS ID_EXPEDIENTE,
    TO_NUMBER(MUL_DOC.ESTADO_MULTA) AS COD_ESTADO,
    EST_MUL.TXT_DESCRIPCION AS NOM_ESTADO,
    MUL_DOC.ID_MOTIVO_PLANTILLA AS ID_MOTIVO_PLANTILLA,
    MOT_MUL.ID_MOTIVO AS COD_MOTIVO, --PI_V_ID_TIPO_SERVICIO RMCA
    MOT_MUL.DESCRIPCION AS NOM_MOTIVO, --PI_V_ID_TIPO_SERVICIO RMCA
    TO_NUMBER(SUBTIP_DOC.COD_INTERNO) AS COD_TIPO_DOCUMENTO,
    SUBTIP_DOC.TXT_DESCRIPCION AS NOM_SUB_TIPO_DOCUMENTO,
    ' ' AS NRO_RESOLUCION,
    MUL_DOC.NRO_DOCUMENTO AS NRO_DOCUMENTO,
    MUL_DOC.NOMBRE AS NOM_ARCHIVO,
    MUL_DOC.NRO_VERSION AS NRO_VERSION,
    MUL_DOC.FEC_INGRESO AS FEC_GENERACION,
    MUL_DOC.AUDUSUCREACION AS LOG_USUARIO_GENERACION,
    MUL_DOC.TIPO_DOC_ASOC AS COD_TIPO_GENERACION_DOC,
    TIPO_GEN_DOC.TXT_DESCRIPCION AS NOM_TIPO_GENERACION_DOC,
    MUL_DOC.COD_GENERADOR_DOCUMENTO AS COD_GENERADOR_DOCUMENTO,
    MUL_DOC.ID_MULTA_DOCUMENTO_GEN AS ID_DOCUMENTO,
    TIP_DOC.NOM_TIPO_DOCUMENTO AS NOM_TIPO_DOCUMENTO,
    MUL_DOC.FEC_NOTIFICACION AS FEC_NOTIFICACION,
    --@0001:INI
    CAST(NULL AS VARCHAR2(20)) AS ESTADO_DOC_UCI,
    CAST(NULL AS VARCHAR2(10)) AS FEC_NOTF_UCI,
    CAST(NULL AS VARCHAR2(10)) AS HORA_NOTF_UCI--,
    --@0001:FIN
    --MUL_DOC.FEC_NOTI_UCI_AEC AS FEC_NOTI_UCI_AEC --@0002
  FROM T_SCOB_MULTA_DOCUMENTO_GEN MUL_DOC

  INNER JOIN T_SCOB_MULTA MULT
        ON MULT.ID_MULTA = MUL_DOC.ID_MULTA

  INNER JOIN T_SCOB_TABLA_DET EST_MUL
        ON EST_MUL.ID_TABLA = 5
        AND EST_MUL.COD_INTERNO = MUL_DOC.ESTADO_MULTA

  LEFT JOIN T_SCOB_EST_MUL_COB_MOTIVO MOT_MUL
       ON MOT_MUL.ID_MOTIVO = MULT.COD_MOTIVO

  INNER JOIN T_SCOB_TIPO_DOCUMENTO TIP_DOC
        ON TIP_DOC.ID_TIPO_DOCUMENTO = MUL_DOC.ID_TIPO_DOCUMENTO

  INNER JOIN T_SCOB_TABLA_DET SUBTIP_DOC
        ON SUBTIP_DOC.ID_TABLA = 23
        AND SUBTIP_DOC.COD_INTERNO = TIP_DOC.COD_SUBTIPO_DOCUMENTO

  INNER JOIN T_SCOB_TABLA_DET TIPO_GEN_DOC
        ON TIPO_GEN_DOC.ID_TABLA = 60
        AND TIPO_GEN_DOC.COD_INTERNO = MUL_DOC.TIPO_DOC_ASOC

  INNER JOIN T_SCOB_TABLA_DET FASE
        ON FASE.ID_TABLA = 59
        AND TO_NUMBER(FASE.COD_INTERNO) =  SCOB_PK_CONSTANTES.C_COD_FASE_MULTA_COB --MULTA COBRANZA

  WHERE MUL_DOC.ESTADO = '1'
  AND (PIN_NU_ID_MULTA= 0 OR (PIN_NU_ID_MULTA <> 0 AND MUL_DOC.ID_MULTA = PIN_NU_ID_MULTA))
  AND (PIN_NU_ID_SUBTIPO_DOC=0 OR (PIN_NU_ID_SUBTIPO_DOC <> 0 AND TO_NUMBER(SUBTIP_DOC.COD_INTERNO)=PIN_NU_ID_SUBTIPO_DOC))
  AND (NVL(PIN_VC_NRO_DOCUMENTO,' ')=' ' OR (NVL(PIN_VC_NRO_DOCUMENTO,' ')<>' ' AND MUL_DOC.NRO_DOCUMENTO=PIN_VC_NRO_DOCUMENTO))
  AND (PIN_NU_COD_FASE=0 OR (PIN_NU_COD_FASE<>0 AND TO_NUMBER(FASE.COD_INTERNO)=PIN_NU_COD_FASE))
  AND (PIN_NU_COD_ESTADO=0 OR (PIN_NU_COD_ESTADO<>0 AND TO_NUMBER(MUL_DOC.ESTADO_MULTA)=PIN_NU_COD_ESTADO))
  AND (PIN_NU_ID_MOTIVO=0 OR (PIN_NU_ID_MOTIVO<>0 AND MOT_MUL.ID_MOTIVO=PIN_NU_ID_MOTIVO))
  AND (PIN_NU_COD_TIPO_GEN=0 OR (PIN_NU_COD_TIPO_GEN<>0 AND TO_NUMBER(FASE.COD_INTERNO)=PIN_NU_COD_TIPO_GEN))
  AND (PIN_NU_ID_TIPO_DOCUMENTO=0 OR (PIN_NU_ID_TIPO_DOCUMENTO <> 0 AND MUL_DOC.ID_TIPO_DOCUMENTO=PIN_NU_ID_TIPO_DOCUMENTO))

  UNION

  SELECT
    SCOB_PK_CONSTANTES.C_COD_FASE_EXPEDIENTE AS COD_FASE,
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
    DECODE(EXDO.COD_SUBTIPO_DOCUMENTO,1,EXDO.NRO_RESOLUCION,EXDO.NRO_DOCUMENTO) AS NRO_DOCUMENTO,
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
    DECODE(EXDO.VC_ESTADO_DOC_UCI,'T','En Transito','E','Entregado','D','Devuelto','N','Notificado','Area','En UCI',NULL) AS ESTADO_DOC_UCI,
    EXDO.VC_FEC_NOTF_UCI AS FEC_NOTF_UCI,
    EXDO.VC_HORA_NOTF_UCI AS HORA_NOTF_UCI--,
    --@0001:FIN

    --EXDO.FEC_NOTI_UCI_AEC AS FEC_NOTI_UCI_AEC --@0002

  FROM USR_SICOB.T_SCOB_EXPEDIENTE_MULTA EXMU INNER JOIN USR_SICOB.T_SCOB_EXPEDIENTE_DOCUMENTO EXDO ON (EXMU.ID_EXPEDIENTE = EXDO.ID_EXPEDIENTE AND EXMU.ESTADO='1')
     INNER JOIN USR_SICOB.T_SCOB_EST_EXP_COB EST_EXP ON (EXDO.ESTADO_EXPEDIENTE = EST_EXP.ID_EST_EXP_COB)
     INNER JOIN USR_SICOB.T_SCOB_TIPO_DOCUMENTO TIP_DOC ON (EXDO.ID_TIPO_DOCUMENTO=TIP_DOC.ID_TIPO_DOCUMENTO)
     INNER JOIN USR_SICOB.T_SCOB_TABLA_DET SUBTIP_DOC ON (EXDO.COD_SUBTIPO_DOCUMENTO=SUBTIP_DOC.COD_INTERNO AND SUBTIP_DOC.ID_TABLA = 23)
     INNER JOIN USR_SICOB.T_SCOB_TABLA_DET TIPO_GEN_DOC ON (EXDO.TIPO_DOC_ASOC=TIPO_GEN_DOC.COD_INTERNO AND TIPO_GEN_DOC.ID_TABLA = 60)
     INNER JOIN USR_SICOB.T_SCOB_TABLA_DET FASE ON (FASE.ID_TABLA = 59 AND FASE.COD_INTERNO = SCOB_PK_CONSTANTES.C_COD_FASE_EXPEDIENTE) --EXPEDIENTE
     LEFT JOIN USR_SICOB.T_SCOB_EST_EXP_COB_MOTIVO MOT_EXP ON (EST_EXP.ID_EST_EXP_COB = MOT_EXP.ID_EST_EXP_COB AND EXDO.ID_MOTIVO = MOT_EXP.ID_MOTIVO)

  WHERE EXDO.ESTADO = '1'
  AND (PIN_NU_ID_MULTA= 0 OR (PIN_NU_ID_MULTA <> 0 AND EXMU.ID_MULTA = PIN_NU_ID_MULTA))
  AND (PIN_NU_ID_SUBTIPO_DOC=0 OR (PIN_NU_ID_SUBTIPO_DOC <> 0 AND TO_NUMBER(SUBTIP_DOC.COD_INTERNO)=PIN_NU_ID_SUBTIPO_DOC))
  AND (NVL(PIN_VC_NRO_DOCUMENTO,' ')=' ' OR (NVL(PIN_VC_NRO_DOCUMENTO,' ')<>' ' AND EXDO.NRO_DOCUMENTO=PIN_VC_NRO_DOCUMENTO))
  AND (PIN_NU_COD_FASE=0 OR (PIN_NU_COD_FASE<>0 AND TO_NUMBER(FASE.COD_INTERNO)=PIN_NU_COD_FASE))
  AND (PIN_NU_COD_ESTADO=0 OR (PIN_NU_COD_ESTADO<>0 AND TO_NUMBER(EXDO.ESTADO_EXPEDIENTE)=PIN_NU_COD_ESTADO))
  AND (PIN_NU_ID_MOTIVO=0 OR (PIN_NU_ID_MOTIVO<>0 AND MOT_EXP.ID_MOTIVO=PIN_NU_ID_MOTIVO))
  AND (PIN_NU_COD_TIPO_GEN=0 OR (PIN_NU_COD_TIPO_GEN<>0 AND TO_NUMBER(FASE.COD_INTERNO)=PIN_NU_COD_TIPO_GEN))
  AND EXDO.TIPO_DOC_ASOC <> SCOB_PK_CONSTANTES.C_TIPO_DOC_ASOC_ADJUNTO
  AND (PIN_NU_ID_TIPO_DOCUMENTO=0 OR (PIN_NU_ID_TIPO_DOCUMENTO <> 0 AND EXDO.ID_TIPO_DOCUMENTO=PIN_NU_ID_TIPO_DOCUMENTO))

  ORDER BY COD_FASE DESC, ID_DOCUMENTO DESC;

end;







procedure SCOB_SP_S_DATOS_MULTA
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 28.10.2011
-- Proposito    : Consulta los datos de la cabecera de una multa
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA          IN T_SCOB_MULTA.ID_MULTA%TYPE,
  po_cu_retorno          out cu_rec_set
)
as
begin

  open  po_cu_retorno for

  SELECT
    MULT.ID_MULTA AS ID_MULTA,
    MDET.ID_MULTA_DETAL AS ID_MULTA_DETAL,
    MCOB.ID_MULTA_COBRANZA AS ID_MULTA_COBRANZA,
    NVL(MIMP.ID_MULTA_IMPROCEDENCIA,0) AS ID_MULTA_IMPROCEDENCIA,

    MULT.ANIO || MULT.CUM AS CUM,
    MULT.ESTADO_MULTA AS COD_ESTADO_MULTA,
    EST_MUL.TXT_DESCRIPCION AS NOM_ESTADO_MULTA,
    ----
    EXPE.ID_EXPEDIENTE AS ID_EXPEDIENTE,
    EXPE.NRO_EXPEDIENTE AS NRO_EXPEDIENTE,
    EXPE.ESTADO_EXPEDIENTE AS COD_ESTADO_EXPEDIENTE,
    EST_EXP.DESCRIPCION AS NOM_ESTADO_EXPEDIENTE,
    CASE
       WHEN EXPE.ID_EXPEDIENTE IS NOT NULL THEN SCOB_PK_CONSTANTES.C_COD_FASE_EXPEDIENTE
       WHEN MCOB.ID_MULTA_COBRANZA IS NOT NULL THEN SCOB_PK_CONSTANTES.C_COD_FASE_MULTA_COB
       ELSE SCOB_PK_CONSTANTES.C_COD_FASE_MULTA_OR
    END AS COD_FASE,
    FASE.TXT_DESCRIPCION AS NOM_FASE

  FROM T_SCOB_MULTA MULT
  INNER JOIN T_SCOB_MULTA_DETAL MDET
        ON MDET.ID_MULTA = MULT.ID_MULTA
        AND MDET.FLG_ACTUAL = '1'
        AND MDET.ESTADO = '1'

  LEFT JOIN T_SCOB_MULTA_COBRANZA MCOB
        ON MCOB.ID_MULTA = MULT.ID_MULTA
        AND MCOB.FLG_ACTUAL = '1'
        AND MCOB.ESTADO = '1'

  LEFT JOIN T_SCOB_MULTA_IMPROCEDENCIA MIMP
       ON MIMP.NRO_IMPROCEDENCIA = MULT.NRO_ULT_IMPROCEDENCIA
       AND MIMP.ID_MULTA_COBRANZA = MCOB.ID_MULTA_COBRANZA
       AND MIMP.ESTADO = '1'

  LEFT JOIN T_SCOB_EXPEDIENTE_MULTA EXMU
       ON EXMU.ID_MULTA = MULT.ID_MULTA
       AND EXMU.ESTADO = '1'
  LEFT JOIN T_SCOB_EXPEDIENTE EXPE
       ON EXPE.ID_EXPEDIENTE = EXMU.ID_EXPEDIENTE
  LEFT JOIN T_SCOB_TABLA_DET EST_MUL
       ON EST_MUL.ID_TABLA = 5
       AND TO_NUMBER(EST_MUL.COD_INTERNO) = MULT.ESTADO_MULTA
  LEFT JOIN T_SCOB_EST_EXP_COB EST_EXP
       ON EST_EXP.ID_EST_EXP_COB = EXPE.ESTADO_EXPEDIENTE
  LEFT JOIN T_SCOB_TABLA_DET FASE
       ON FASE.ID_TABLA = 59
       AND TO_NUMBER(FASE.COD_INTERNO) = (
            CASE
              WHEN EXPE.ID_EXPEDIENTE IS NOT NULL THEN SCOB_PK_CONSTANTES.C_COD_FASE_EXPEDIENTE
              WHEN MCOB.ID_MULTA_COBRANZA IS NOT NULL THEN SCOB_PK_CONSTANTES.C_COD_FASE_MULTA_COB
              ELSE SCOB_PK_CONSTANTES.C_COD_FASE_MULTA_OR
            END
       )
  WHERE MULT.ID_MULTA = PI_N_ID_MULTA
  ;

end;


PROCEDURE SCOB_SP_U_ACT_IMPORTES_EXPED
/*
    -----------------------------------------------------------
    -- Autor        : RMCA
    -- Creado       : 21.12.2011
    -- Proposito    : actualiza los datos de importe del expediente en base a lo actualizado en la multa.
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
(PI_N_ID_MULTA      IN T_SCOB_MULTA.ID_MULTA%TYPE,
 PI_N_ID_EXPEDIENTE IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE

 ) IS
    N_ID_MULTA      T_SCOB_MULTA.ID_MULTA%TYPE;
    N_ID_EXPEDIENTE T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE;
BEGIN
    DBMS_OUTPUT.put_line('SCOB_SP_U_ACT_IMPORTES_EXPED>>PI_N_ID_MULTA>>' || PI_N_ID_MULTA);
    DBMS_OUTPUT.put_line('SCOB_SP_U_ACT_IMPORTES_EXPED>>PI_N_ID_EXPEDIENTE>>' || PI_N_ID_EXPEDIENTE);
    --OBTENER LA MULTA ALFA DEL EXPEDIENTE
    IF PI_N_ID_MULTA = 0 THEN
        SELECT EXMU.ID_MULTA
          INTO N_ID_MULTA
          FROM T_SCOB_EXPEDIENTE_MULTA EXMU
         WHERE EXMU.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
           AND EXMU.ESTADO = '1'
           AND EXMU.ID_MULTA = SCOB_PK_EXPEDIENTE.SCOB_FN_MUL_ANTIGUO(EXMU.ID_EXPEDIENTE);
    ELSE
        N_ID_MULTA := PI_N_ID_MULTA;
    END IF;

    --OBTENER EL EXPEDIENTE DE LA MULTA
    IF PI_N_ID_EXPEDIENTE = 0 THEN
        BEGIN
            SELECT DISTINCT EXMU.ID_EXPEDIENTE
              INTO N_ID_EXPEDIENTE
              FROM T_SCOB_EXPEDIENTE_MULTA EXMU
             WHERE EXMU.ID_MULTA = N_ID_MULTA
               AND EXMU.ESTADO = '1';
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                RETURN; --NO ACTUALIZA LOS IMPORTES PORQUE NO EXISTE EXPEDIENTE.
        END;
    ELSE
        N_ID_EXPEDIENTE := PI_N_ID_EXPEDIENTE;
    END IF;
    DBMS_OUTPUT.put_line('SCOB_SP_U_ACT_IMPORTES_EXPED>>N_ID_MULTA>>' || N_ID_MULTA);
    DBMS_OUTPUT.put_line('SCOB_SP_U_ACT_IMPORTES_EXPED>>N_ID_EXPEDIENTE>>' || N_ID_EXPEDIENTE);
    --
    /*FOR A1 IN (SELECT EXMU.ID_MULTA
       FROM T_SCOB_EXPEDIENTE_MULTA EXMU
       WHERE EXMU.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
       AND EXMU.ESTADO = '1') LOOP
      --ACTUALIZA LOS IMPORTES EN BASE A LO ACTUALIZADO EN LAS MULTAS
      UPDATE T_SCOB_EXPEDIENTE EXPE
      SET (
            MONTO_UIT,
            MONTO_INTERES,
            MONTO_INTERES_MORATORIO,
            MONTO_COSTAS,
            MONTO_TOTAL_DEUDA,
            ---
            TOTAL_AMORTIZADO,
            TOTAL_AMORTIZADO_IC,
            TOTAL_AMORTIZADO_IM,
            TOTAL_AMORTIZADO_COSTAS,
            TOTAL_AMORTIZADO_DEUDA,
            ---
            SALDO,
            SALDO_IC,
            SALDO_IM,
            SALDO_COSTAS,
            SALDO_TOTAL_DEUDA,
            ---
            COD_ESTADO_PAGO
          ) = (
          SELECT
            MONTO_UIT,
            MONTO_INTERES,
            MONTO_INTERES_MORATORIO,
            MONTO_COSTAS,
            MONTO_TOTAL_DEUDA,
            --
            TOTAL_AMORTIZADO,
            TOTAL_AMORTIZADO_IC,
            TOTAL_AMORTIZADO_IM,
            TOTAL_AMORTIZADO_COSTAS,
            TOTAL_AMORTIZACION_DEUDA,
            --
            SALDO,
            SALDO_IC,
            SALDO_IM,
            SALDO_COSTAS,
            SALDO_TOTAL_DEUDA,
            ---
            MULT.COD_ESTADO_PAGO
          FROM T_SCOB_MULTA MULT
          WHERE MULT.ID_MULTA = A1.ID_MULTA
          )
      WHERE EXPE.ID_EXPEDIENTE = N_ID_EXPEDIENTE;
    END LOOP;*/
    --
    --ACTUALIZA LOS IMPORTES EN BASE A LO ACTUALIZADO EN LAS MULTAS
    -- @dcelis Req.44
    UPDATE T_SCOB_EXPEDIENTE EXPE
       SET (MONTO_UIT,
            MONTO_INTERES,
            MONTO_INTERES_MORATORIO,
            MONTO_COSTAS,
            MONTO_TOTAL_DEUDA,
            ---
            TOTAL_AMORTIZADO,
            TOTAL_AMORTIZADO_IC,
            TOTAL_AMORTIZADO_IM,
            TOTAL_AMORTIZADO_COSTAS,
            TOTAL_AMORTIZADO_DEUDA,
            ---
            SALDO,
            SALDO_IC,
            SALDO_IM,
            SALDO_COSTAS,
            SALDO_TOTAL_DEUDA,
            ---
            COD_ESTADO_PAGO) =
           (SELECT SUM(MONTO_UIT) AS MONTO_UIT,
                   SUM(MONTO_INTERES) AS MONTO_INTERES,
                   SUM(MONTO_INTERES_MORATORIO) AS MONTO_INTERES_MORATORIO,
                   SUM(MONTO_COSTAS) AS MONTO_COSTAS,
                   SUM(MONTO_TOTAL_DEUDA) AS MONTO_TOTAL_DEUDA,
                   --
                   SUM(TOTAL_AMORTIZADO) AS TOTAL_AMORTIZADO,
                   SUM(TOTAL_AMORTIZADO_IC) AS TOTAL_AMORTIZADO_IC,
                   SUM(TOTAL_AMORTIZADO_IM) AS TOTAL_AMORTIZADO_IM,
                   SUM(TOTAL_AMORTIZADO_COSTAS) AS TOTAL_AMORTIZADO_COSTAS,
                   SUM(TOTAL_AMORTIZACION_DEUDA) AS TOTAL_AMORTIZACION_DEUDA,
                   --
                   SUM(SALDO) AS SALDO,
                   SUM(SALDO_IC) AS SALDO_IC,
                   SUM(SALDO_IM) AS SALDO_IM,
                   SUM(SALDO_COSTAS) AS SALDO_COSTAS,
                   SUM(SALDO_TOTAL_DEUDA) AS SALDO_TOTAL_DEUDA,
                   ---
                   -- INI: JCARRION@TK2017-68014
                   --B.COD_ESTADO_PAGO
                   (CASE
                         WHEN SUM(SALDO_TOTAL_DEUDA) = 0 THEN
                          1
                         WHEN SUM(SALDO_TOTAL_DEUDA) > 0 AND
                              SUM(SALDO_TOTAL_DEUDA) < SUM(MONTO_TOTAL_DEUDA) THEN
                          2
                         ELSE
                          3
                     END) AS COD_ESTADO_PAGO
                   -- FIN: JCARRION@TK2017-68014
              FROM T_SCOB_EXPEDIENTE_MULTA A
             INNER JOIN T_SCOB_MULTA B
                ON A.ID_MULTA = B.ID_MULTA
             WHERE A.ID_EXPEDIENTE = N_ID_EXPEDIENTE
               AND A.ESTADO = '1' -- INI: JCARRION@TK2017-68014
               AND B.ESTADO = '1' -- INI: JCARRION@TK2017-68014
               )
     WHERE EXPE.ID_EXPEDIENTE = N_ID_EXPEDIENTE;
    --
    /*
    UPDATE T_SCOB_EXPEDIENTE EXPE
    SET (
          MONTO_UIT,
          MONTO_INTERES,
          MONTO_INTERES_MORATORIO,
          MONTO_COSTAS,
          MONTO_TOTAL_DEUDA,
          ---
          TOTAL_AMORTIZADO,
          TOTAL_AMORTIZADO_IC,
          TOTAL_AMORTIZADO_IM,
          TOTAL_AMORTIZADO_COSTAS,
          TOTAL_AMORTIZADO_DEUDA,
          ---
          SALDO,
          SALDO_IC,
          SALDO_IM,
          SALDO_COSTAS,
          SALDO_TOTAL_DEUDA,
          ---
          COD_ESTADO_PAGO
        ) = (
        SELECT
          MONTO_UIT,
          MONTO_INTERES,
          MONTO_INTERES_MORATORIO,
          MONTO_COSTAS,
          MONTO_TOTAL_DEUDA,
          --
          TOTAL_AMORTIZADO,
          TOTAL_AMORTIZADO_IC,
          TOTAL_AMORTIZADO_IM,
          TOTAL_AMORTIZADO_COSTAS,
          TOTAL_AMORTIZACION_DEUDA,
          --
          SALDO,
          SALDO_IC,
          SALDO_IM,
          SALDO_COSTAS,
          SALDO_TOTAL_DEUDA,
          ---
          MULT.COD_ESTADO_PAGO
        FROM T_SCOB_MULTA MULT
        WHERE MULT.ID_MULTA = N_ID_MULTA
        )
    WHERE EXPE.ID_EXPEDIENTE = N_ID_EXPEDIENTE;
    */
    --
END;

procedure SCOB_SP_U_DATOS_DECLARAC_MULTA
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 30.12.2011
-- Proposito    : actualiza los datos:
                  La fecha de Notificacion de Declaracion de Consentimiento y
                  La Fecha de Notificacion de Declaracion de Firmeza
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA            IN T_SCOB_MULTA.ID_MULTA%TYPE,
  PI_N_ID_MULTA_DETAL      IN T_SCOB_MULTA_DETAL.ID_MULTA_DETAL%TYPE,
  PI_C_FEC_NOTIF_DECL      IN CHAR,
  PI_V_AUDUSUMODIFICACION  IN T_SCOB_MULTA.AUDUSUMODIFICACION%TYPE,
  po_n_retorno             out number,
  po_n_cod_error           out number,
  po_v_msj_error           out varchar2
)
is
begin
  po_v_msj_error :=' ';
  po_n_retorno := 0;
  po_n_cod_error := 0;

  UPDATE T_SCOB_MULTA_DETAL MDET
  SET
     MDET.FEC_NOTIFICACION_DECLARACION = TO_DATE(PI_C_FEC_NOTIF_DECL,'DD/MM/YYYY'),
     MDET.AUDFECMODIFICACION = SYSDATE,
     MDET.AUDUSUMODIFICACION = PI_V_AUDUSUMODIFICACION
  WHERE MDET.ID_MULTA = PI_N_ID_MULTA
  AND MDET.ID_MULTA_DETAL = PI_N_ID_MULTA_DETAL;

  po_n_retorno :=   PI_N_ID_MULTA;
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

procedure SCOB_SP_S_CATALOGO_PERSONA
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 02.04.2012
-- Proposito    : Consulta personas del catalogo para asignar a la multa como:
                  administrado: denunciante, denunciado y/o sancionado.
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_V_COD_INDECOPI                 IN T_SCOB_PERSONA.COD_SANCIONADO%TYPE,
  PI_I_TIPO_PERSONA                 IN T_SCOB_PERSONA.TIPO_PERSONA%TYPE,
  PI_I_TIPO_DOC                     IN T_SCOB_PERSONA.TIPO_DOC%TYPE,
  PI_V_NRO_DOC                      IN T_SCOB_PERSONA.NRO_DOC%TYPE,
  PI_V_RAZON_SOCIAL                 IN T_SCOB_PERSONA.RAZON_SOCIAL%TYPE,
  PI_V_PRI_NOMBRE                   IN T_SCOB_PERSONA.PRI_NOMBRE%TYPE,
  PI_V_SEG_NOMBRE                   IN T_SCOB_PERSONA.SEG_NOMBRE%TYPE,
  PI_V_APE_PATERNO                  IN T_SCOB_PERSONA.APE_PATERNO%TYPE,
  PI_V_APE_MATERNO                  IN T_SCOB_PERSONA.APE_MATERNO%TYPE,
  po_cu_retorno                     out cu_rec_set
)
as
  V_COD_INDECOPI                    T_SCOB_PERSONA.COD_SANCIONADO%TYPE;
  V_PRI_NOMBRE                      T_SCOB_PERSONA.PRI_NOMBRE%TYPE;
  V_SEG_NOMBRE                      T_SCOB_PERSONA.SEG_NOMBRE%TYPE;
  V_APE_PATERNO                     T_SCOB_PERSONA.APE_PATERNO%TYPE;
  V_APE_MATERNO                     T_SCOB_PERSONA.APE_MATERNO%TYPE;
  V_RAZON_SOCIAL                    T_SCOB_PERSONA.RAZON_SOCIAL%TYPE;

  V_SELECT                          VARCHAR2(8000);
  V_WHERE                           VARCHAR2(8000);
  V_INSERT                          VARCHAR2(8000);
  V_NRO_REG                         VARCHAR2(4);
begin
  V_NRO_REG := 100; --NRO. DE REGS, A MOSTRAR COMO RESULTADO DE LA CONSULTA (SON 2 CONSULTAS)
  V_COD_INDECOPI := NVL(PI_V_COD_INDECOPI,' ');
  V_PRI_NOMBRE := NVL(PI_V_PRI_NOMBRE,' ');
  V_SEG_NOMBRE := NVL(PI_V_SEG_NOMBRE,' ');
  V_APE_PATERNO := NVL(PI_V_APE_PATERNO,' ');
  V_APE_MATERNO := NVL(PI_V_APE_MATERNO,' ');
  V_RAZON_SOCIAL := NVL(PI_V_RAZON_SOCIAL,' ');

  ---------------------------------------------------------------
  EXECUTE IMMEDIATE 'TRUNCATE TABLE T_SCOB_TMP_CATALOGO_PERSONA';
  EXECUTE IMMEDIATE 'TRUNCATE TABLE T_SCOB_TMP_CATALOGO_PERSONA2'; --DATA PARA CONSULTA

  V_INSERT := 'INSERT INTO T_SCOB_TMP_CATALOGO_PERSONA2(';
  V_INSERT := V_INSERT || ' TIPO_PERSONA,';
  V_INSERT := V_INSERT || ' TIPO_DOC,';
  V_INSERT := V_INSERT || ' NRO_DOC,';
  V_INSERT := V_INSERT || ' NOM_PERSONA,';
  V_INSERT := V_INSERT || ' NOM_TIPO_PERSONA,';
  V_INSERT := V_INSERT || ' NOM_TIPO_DOC,';
  V_INSERT := V_INSERT || ' FLG_ASOCU,';
  V_INSERT := V_INSERT || ' FLG_ORIGEN) ';
  ---------------------------------------------------------------

  --CREA LA CONSULTA DE ADMINISTRADOS (T_SCOB_PERSONA)
      V_SELECT := '
      SELECT
        PERS.TIPO_PERSONA AS COD_TIPO_PERSONA,
        PERS.TIPO_DOC AS COD_TIPO_DOC,
        PERS.NRO_DOC AS NRO_DOC,
        -----------------
        DECODE(PERS.TIPO_PERSONA,2,
               PERS.RAZON_SOCIAL,
               PERS.APE_PATERNO || '' '' || PERS.APE_MATERNO || '' '' || PERS.PRI_NOMBRE || '' '' ||
               PERS.SEG_NOMBRE) AS NOM_PERSONA,
        -----------------
        SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(11, PERS.TIPO_PERSONA) AS NOM_TIPO_PERSONA,
        SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(10, PERS.TIPO_DOC) AS NOM_TIPO_DOC,
        PERS.FLG_ASOCU AS FLG_ASOCU,
        ''1'' AS FLG_ORIGEN
      FROM T_SCOB_PERSONA PERS ';

      V_WHERE := '
      WHERE PERS.TIPO_PERSONA='||PI_I_TIPO_PERSONA||' ';

      IF V_COD_INDECOPI<>' ' THEN
      V_WHERE := V_WHERE || '
      AND PERS.COD_SANCIONADO=LPAD('''||PI_V_COD_INDECOPI||''',10,''0000000000'')';
      END IF;

      IF PI_I_TIPO_DOC <> 0 THEN
      V_WHERE := V_WHERE || '
      AND PERS.TIPO_DOC='||PI_I_TIPO_DOC||'
      AND PERS.NRO_DOC='''||PI_V_NRO_DOC||''' ';
      END IF;

      IF V_PRI_NOMBRE <> ' ' THEN
      V_WHERE := V_WHERE || '
      AND PERS.PRI_NOMBRE like ''' || PI_V_PRI_NOMBRE || '%''';
      END IF;

      IF V_SEG_NOMBRE <> ' ' THEN
      V_WHERE := V_WHERE || '
      AND PERS.SEG_NOMBRE like '''||PI_V_SEG_NOMBRE|| '%''';
      END IF;

      IF V_APE_PATERNO<>' ' THEN
      V_WHERE := V_WHERE || '
      AND PERS.APE_PATERNO like '''||PI_V_APE_PATERNO || '%''';
      END IF;

      IF V_APE_MATERNO<>' ' THEN
      V_WHERE := V_WHERE || '
      AND PERS.APE_MATERNO like '''||PI_V_APE_MATERNO|| '%''';
      END IF;

      IF V_RAZON_SOCIAL<>' ' THEN
      V_WHERE := V_WHERE || '
      AND PERS.RAZON_SOCIAL like '''||PI_V_RAZON_SOCIAL||'%''';
      END IF;

      V_WHERE := V_WHERE || '
      AND PERS.ESTADO = ''1''';

      V_WHERE := V_WHERE || '
      AND ROWNUM<=' || V_NRO_REG;

      execute immediate V_INSERT || V_SELECT || V_WHERE;
      --DBMS_OUTPUT.put_line('--ADMINISTRADOS');
      --DBMS_OUTPUT.put_line(V_INSERT || V_SELECT || V_WHERE);

  --CREA LA CONSULTA DE PERSONAS (T_SCOB_CATALOGO_PERSONA)
  IF V_COD_INDECOPI=' ' THEN  --SI NO EXISTE FILTRO "COD_SANCIONADO" CONSULTA, ADEMAS, CATALOGO
      V_SELECT := '
      SELECT
        CATA.TIPO_PERSONA AS COD_TIPO_PERSONA,
        CATA.TIPO_DOC AS COD_TIPO_DOC,
        CATA.NRO_DOC AS NRO_DOC,
        -----------------
        DECODE(CATA.TIPO_PERSONA,2,
               CATA.RAZON_SOCIAL,
               CATA.APE_PATERNO || '' '' || CATA.APE_MATERNO || '' '' || CATA.PRI_NOMBRE || '' '' ||
               CATA.SEG_NOMBRE) AS NOM_PERSONA,
        -----------------
        SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(11, CATA.TIPO_PERSONA) AS NOM_TIPO_PERSONA,
        SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(10, CATA.TIPO_DOC) AS NOM_TIPO_DOC,
        ''0'' AS FLG_ASOCU,
        ''0'' AS FLG_ORIGEN
      FROM T_SCOB_CATALOGO_PERSONA CATA ';

      V_WHERE := '
      WHERE CATA.TIPO_PERSONA='||PI_I_TIPO_PERSONA||' ';

      IF PI_I_TIPO_DOC <> 0 THEN
      V_WHERE := V_WHERE || '
      AND CATA.TIPO_DOC='||PI_I_TIPO_DOC||'
      AND CATA.NRO_DOC='''||PI_V_NRO_DOC||''' ';
      END IF;

      IF V_PRI_NOMBRE <> ' ' THEN
      V_WHERE := V_WHERE || '
      AND CATA.PRI_NOMBRE like ''' || PI_V_PRI_NOMBRE || '%''';
      END IF;

      IF V_SEG_NOMBRE <> ' ' THEN
      V_WHERE := V_WHERE || '
      AND CATA.SEG_NOMBRE like '''||PI_V_SEG_NOMBRE|| '%''';
      END IF;

      IF V_APE_PATERNO<>' ' THEN
      V_WHERE := V_WHERE || '
      AND CATA.APE_PATERNO like '''||PI_V_APE_PATERNO || '%''';
      END IF;

      IF V_APE_MATERNO<>' ' THEN
      V_WHERE := V_WHERE || '
      AND CATA.APE_MATERNO like '''||PI_V_APE_MATERNO|| '%''';
      END IF;

      IF V_RAZON_SOCIAL<>' ' THEN
      V_WHERE := V_WHERE || '
      AND CATA.RAZON_SOCIAL like '''||PI_V_RAZON_SOCIAL||'%''';
      END IF;

      V_WHERE := V_WHERE || '
      AND CATA.ESTADO = ''1''';

      V_WHERE := V_WHERE || '
      AND ROWNUM<=' || V_NRO_REG;

      execute immediate V_INSERT || V_SELECT || V_WHERE;
      --DBMS_OUTPUT.put_line('--CATALOGO PERSONAS');
      --DBMS_OUTPUT.put_line(V_INSERT || V_SELECT || V_WHERE);

  END IF;

  --INSERTAR EN LA TABLA TEMPORAL
  INSERT INTO T_SCOB_TMP_CATALOGO_PERSONA(
         TIPO_PERSONA, TIPO_DOC, NRO_DOC, NOM_TIPO_PERSONA, NOM_TIPO_DOC)
  SELECT DISTINCT
         TIPO_PERSONA, TIPO_DOC, NRO_DOC, NOM_TIPO_PERSONA, NOM_TIPO_DOC
  FROM T_SCOB_TMP_CATALOGO_PERSONA2;

  --MOSTRAR EL RESULTADO DE LA CONSULTA
  OPEN po_cu_retorno FOR
  SELECT
    PERS.TIPO_PERSONA AS COD_TIPO_PERSONA,
    PERS.TIPO_DOC AS COD_TIPO_DOC,
    PERS.NRO_DOC AS NRO_DOC,
    DECODE(ADMINISTRADO.TIPO_DOC,NULL,CATA.NOM_PERSONA,ADMINISTRADO.NOM_PERSONA) AS NOM_PERSONA,
    PERS.NOM_TIPO_PERSONA AS NOM_TIPO_PERSONA,
    PERS.NOM_TIPO_DOC AS NOM_TIPO_DOC
  FROM T_SCOB_TMP_CATALOGO_PERSONA PERS
  LEFT JOIN T_SCOB_TMP_CATALOGO_PERSONA2 ADMINISTRADO
       ON ADMINISTRADO.TIPO_DOC = PERS.TIPO_DOC
       AND ADMINISTRADO.NRO_DOC = PERS.NRO_DOC
       AND ADMINISTRADO.FLG_ORIGEN = '1' --ADMINISTRADOS
  LEFT JOIN T_SCOB_TMP_CATALOGO_PERSONA2 CATA
       ON CATA.TIPO_DOC = PERS.TIPO_DOC
       AND CATA.NRO_DOC = PERS.NRO_DOC
       AND CATA.FLG_ORIGEN = '0' --DEL CATALOGO
  ;
  COMMIT;
end;

procedure SCOB_SP_I_GRABA_ADMINISTRADO
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 03.04.2012
-- Proposito    : Inserta a las personas del catalogo como administrado
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_TIPO_DOCUMENTO         IN T_SCOB_PERSONA.TIPO_DOC%TYPE,
  PI_V_NRO_DOCUMENTO          IN T_SCOB_PERSONA.NRO_DOC%TYPE,
  PI_V_AUDUSUCREACION         IN T_SCOB_PERSONA.AUDUSUCREACION%TYPE,
  po_n_retorno                out number,
  po_n_cod_error              out number,
  po_v_msj_error              out varchar2
)
is
  N_ID_PERSONA                T_SCOB_PERSONA.ID_PERSONA%TYPE;
  N_ID_PERSONA_CATALOGO       T_SCOB_PERSONA.ID_PERSONA%TYPE;

begin
  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  --VERIFICA SI EXISTE LA PERSONA COMO ADMINISTRADO
  BEGIN
      SELECT PERS.ID_PERSONA
      INTO N_ID_PERSONA
      FROM T_SCOB_PERSONA PERS
      WHERE PERS.TIPO_DOC = PI_N_TIPO_DOCUMENTO
      AND PERS.NRO_DOC = PI_V_NRO_DOCUMENTO
      AND PERS.ESTADO = '1';
  EXCEPTION WHEN NO_DATA_FOUND THEN
      N_ID_PERSONA := 0;
      --BUSCAR EL ID DE LA PERSONA EN EL CATALOGO
      SELECT CATA.ID_PERSONA
      INTO N_ID_PERSONA_CATALOGO
      FROM T_SCOB_CATALOGO_PERSONA CATA
      WHERE CATA.TIPO_DOC = PI_N_TIPO_DOCUMENTO
      AND CATA.NRO_DOC = PI_V_NRO_DOCUMENTO
      AND CATA.ESTADO = '1';
  END;

  IF N_ID_PERSONA = 0 THEN --INSERTA A LA PERSONA COMO ADMINISTRADO
      SELECT SCOB_SQ_PERSONA.NEXTVAL INTO N_ID_PERSONA FROM DUAL;

      INSERT INTO T_SCOB_PERSONA(
          ID_PERSONA,
          TIPO_PERSONA,
          TIPO_DOC,
          NRO_DOC,
          NRO_RUC,
          ID_SECTOR_ECONOMICO,
          APE_PATERNO,
          APE_MATERNO,
          APE_CASADA,
          PRI_NOMBRE,
          SEG_NOMBRE,
          EMAIL,
          RAZON_SOCIAL,
          NOMBRE_COMERCIAL,
          SIGLAS,
          ESTADO,
          AUDFECCREACION,
          AUDUSUCREACION,
          COD_SANCIONADO
      )
      SELECT
          N_ID_PERSONA,
          TIPO_PERSONA,
          TIPO_DOC,
          NRO_DOC,
          NRO_RUC,
          ID_SECTOR_ECONOMICO,
          APE_PATERNO,
          APE_MATERNO,
          APE_CASADA,
          PRI_NOMBRE,
          SEG_NOMBRE,
          EMAIL,
          RAZON_SOCIAL,
          NOMBRE_COMERCIAL,
          SIGLAS,
          '1',
          SYSDATE,
          PI_V_AUDUSUCREACION,
          LPAD(TO_CHAR(SCOB_SQ_SANCIONADO.NEXTVAL),10,'0000000000')
      FROM T_SCOB_CATALOGO_PERSONA CATA
      WHERE CATA.ID_PERSONA = N_ID_PERSONA_CATALOGO;

      --INSERTA LAS DIRECCIONES EXISTENTES
      INSERT INTO T_SCOB_PERSONA_DOMICILIO(
          ID_PERSONA_DOMICILIO,
          ID_PERSONA,
          TIPO_DOMICILIO,
          ID_UBIGEO,
          TIPO_VIA,
          NOM_VIA,
          NRO_VIA,
          NRO_INTERIOR,
          TIPO_ZONA,
          NOM_ZONA,
          ESTADO,
          AUDFECCREACION,
          AUDUSUCREACION
      )
      SELECT
          SCOB_SQ_PERSONA_DOMICILIO.NEXTVAL,
          N_ID_PERSONA,
          TIPO_DOMICILIO,
          ID_UBIGEO,
          TIPO_VIA,
          NOM_VIA,
          NRO_VIA,
          NRO_INTERIOR,
          TIPO_ZONA,
          NOM_ZONA,
          '1',
          SYSDATE,
          PI_V_AUDUSUCREACION
       FROM T_SCOB_CATALOGO_PERSONA_DOM PDOM
       WHERE PDOM.ID_PERSONA = N_ID_PERSONA_CATALOGO
       AND PDOM.ESTADO = '1';

  END IF;

  po_n_cod_error := 0;
  po_n_retorno := N_ID_PERSONA;
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

procedure SCOB_SP_S_VERIF_ADMIN_BY_MULTA
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 03.04.2012
-- Proposito    : Verifica si la persona, antes, ha sido grabada como denunciante, denunciado, sancionado.
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA_DETAL       IN T_SCOB_MULTA_DETAL.ID_MULTA_DETAL%TYPE,
  PI_I_TIPO_ADMINISTRADO    IN INTEGER, --1=SANCIONADO;2=DENUNCIANTE;3=DENUNCIADO
  PI_N_TIPO_DOC             IN T_SCOB_PERSONA.TIPO_DOC%TYPE,
  PI_V_NRO_DOC              IN T_SCOB_PERSONA.NRO_DOC%TYPE,
  pi_retorno                out integer
)
as
  I_EXISTE                  INTEGER;

begin
  pi_retorno := 0; --NO EXISTE

  CASE PI_I_TIPO_ADMINISTRADO
  WHEN 1 THEN

  SELECT COUNT(ADMIN.ID_PERSONA)
  INTO I_EXISTE
  FROM (
    SELECT MSAN.ID_PERSONA AS ID_PERSONA
    FROM T_SCOB_MULTA_SANCIONADO MSAN
    WHERE MSAN.ID_MULTA_DETAL = PI_N_ID_MULTA_DETAL
    AND MSAN.COD_TIPO_PERSONA = 1 --SANCIONADO
    AND MSAN.ESTADO = '1'
  )ADMIN
  WHERE ADMIN.ID_PERSONA IN (
      SELECT PERS.ID_PERSONA
      FROM T_SCOB_PERSONA PERS
      WHERE PERS.TIPO_DOC = PI_N_TIPO_DOC
      AND PERS.NRO_DOC = PI_V_NRO_DOC
      AND PERS.ESTADO = '1'
  );

  WHEN 3 THEN

  SELECT COUNT(ADMIN.ID_PERSONA)
  INTO I_EXISTE
  FROM (
    SELECT MSAN.ID_PERSONA AS ID_PERSONA
    FROM T_SCOB_MULTA_SANCIONADO MSAN
    WHERE MSAN.ID_MULTA_DETAL = PI_N_ID_MULTA_DETAL
    AND MSAN.COD_TIPO_PERSONA = 2 --DENUNCIADO
    AND MSAN.ESTADO = '1'
  )ADMIN
  WHERE ADMIN.ID_PERSONA IN (
      SELECT PERS.ID_PERSONA
      FROM T_SCOB_PERSONA PERS
      WHERE PERS.TIPO_DOC = PI_N_TIPO_DOC
      AND PERS.NRO_DOC = PI_V_NRO_DOC
      AND PERS.ESTADO = '1'
  );

  WHEN 2 THEN

  SELECT COUNT(ADMIN.ID_PERSONA)
  INTO I_EXISTE
  FROM (
    SELECT MDEN.ID_PERSONA AS ID_PERSONA
    FROM T_SCOB_MULTA_DENUNCIANTE MDEN
    WHERE MDEN.ID_MULTA_DETAL = PI_N_ID_MULTA_DETAL
    AND MDEN.ESTADO = '1'
  )ADMIN
  WHERE ADMIN.ID_PERSONA IN (
      SELECT PERS.ID_PERSONA
      FROM T_SCOB_PERSONA PERS
      WHERE PERS.TIPO_DOC = PI_N_TIPO_DOC
      AND PERS.NRO_DOC = PI_V_NRO_DOC
      AND PERS.ESTADO = '1'
  );

  ELSE
       I_EXISTE := 1; --EXISTE;
  END CASE;

  IF I_EXISTE > 0 THEN pi_retorno := 1; END IF;
end;

procedure SCOB_SP_U_EDITA_MULTA_BY_OR
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 29.05.2012
-- Proposito    : Actualizar la multa por organo resolutivo.
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
--@0002:RMCA:06.02.2013:que ingrese siempre como dentro del plazo (pruebas de caja: si la fecha plazo es mayor a la fecha actual, no cambiaba el estado en plazo)
*/
(
/*01*/  PI_N_ID_MULTA                  IN T_SCOB_MULTA.ID_MULTA%TYPE,
/*02*/  PI_N_ID_MULTA_DETAL_ACTUAL     IN T_SCOB_MULTA_DETAL.ID_MULTA_DETAL%TYPE,
/*03*/  PI_C_ORIGEN_EDICION            IN CHAR, --1=OR; 2=AEC.
  --
/*04*/  PI_I_ESTADO_MULTA              IN T_SCOB_MULTA.ESTADO_MULTA%TYPE,
  --NRO EXPEDIENTE ADMINISTRATIVO
/*05*/  PI_V_EXP_NUEVO_NRO             IN VARCHAR2,
/*06*/  PI_C_EXP_NUEVO_ANIO            IN CHAR,
/*07*/  PI_V_EXP_NUEVO_COD_ORG_RESOL   IN VARCHAR,
/*08*/  PI_V_EXP_NUEVO_COD_MATERIA     IN VARCHAR,
  --NRO EXPEDIENTE ANTIGUO
/*09*/  PI_V_EXP_ANTIG_NRO             IN VARCHAR2,
/*10*/  PI_C_EXP_ANTIG_ANIO            IN CHAR,
/*11*/  PI_N_EXP_ANTIG_ID_SIGLA        IN NUMBER,
/*12*/  PI_N_EXP_ANTIG_ID_TIPO_EXPED   IN NUMBER,
/*13*/  PI_V_EXP_ANTIG_COD_SIGLA       IN VARCHAR2,
/*14*/  PI_V_EXP_ANTIG_COD_TIPO_EXPED  IN VARCHAR2,
/*15*/  PI_V_EXP_ANTIG_DES_SIGLA       IN VARCHAR2,
/*16*/  PI_V_EXP_ANTIG_DES_TIPO_EXPED  IN VARCHAR2,
  --NRO RESOLUCION
/*17*/  PI_V_RESOL_NRO                 IN VARCHAR2,
/*18*/  PI_C_RESOL_ANIO                IN CHAR,
/*19*/  PI_N_RESOL_ID_SIGLA            IN NUMBER,
/*20*/  PI_V_RESOL_COD_SIGLA           IN VARCHAR2,
/*21*/  PI_V_RESOL_DES_SIGLA           IN VARCHAR2,
  --
/*22*/  PI_C_FECHA_RESOL               IN CHAR,
/*23*/  PI_C_FECHA_NOTIF               IN CHAR,
/*24*/  PI_V_NRO_RESOL_DECLARACION     IN T_SCOB_MULTA_DETAL.NRO_RESOLUCION_DECLARACION%TYPE,
/*25*/  PI_C_FECHA_DECLA               IN CHAR, --FEC_DECLARACION (CONSENTIMIENTO O FIRMEZA)
/*26*/  PI_C_FEC_NOTIF_DECLARACION     IN CHAR, --FEC NOTIFICACION DECLARACION (CONSENTIMIENTO O FIRMEZA)
  -----------------------------
/*27*/  PI_C_FEC_ESTADO_SGTE_INSTANCIA IN CHAR, --FEC APELACION O REVISION
  -----------------------------
/*28*/  PI_C_FLG_TIPO_MULTA            IN T_SCOB_MULTA.FLG_TIPO_MULTA%TYPE,
/*29*/  PI_N_SEDE                      IN T_SCOB_SEDE.ID_SEDE%TYPE,
/*30*/  PI_V_AUDUSUMODIFICACION        IN T_SCOB_MULTA.AUDUSUMODIFICACION%TYPE,
/*31*/  PI_N_ID_USUARIO_MODIFICACION   IN NUMBER,
  --
  po_n_retorno                   out number,
  po_n_retorno_det               out number,
  po_n_cod_error                 out number,
  po_v_msj_error                 out varchar2
)
is
--  N_ID_MULTA_NIVEL               T_SCOB_MULTA_DETAL.ID_MULTA_DETAL%TYPE;
--  N_ID_MULTA_ESTADO              T_SCOB_MULTA_ESTADO.ID_MULTA_ESTADO%TYPE;

  V_ID_NRO_EXPED_ADMIN_ID        T_SCOB_MULTA.NRO_EXPED_UNICO_ID%TYPE;
  V_ID_NRO_EXPED_NIVEL_ID        T_SCOB_MULTA_DETAL.NRO_EXPED_ANTIGUO_ID%TYPE;
  V_ID_NRO_RESOLUCION_ID         T_SCOB_MULTA_DETAL.NRO_RESOLUCION_ID%TYPE;

  V_NRO_RESOL                    T_SCOB_MULTA_DETAL.NRO_RESOLUCION%TYPE;
  V_NRO_EXP_NIVEL                T_SCOB_MULTA_DETAL.NRO_EXP_NIVEL%TYPE;
  V_NRO_EXP_ADMIN                T_SCOB_MULTA.NRO_EXP_ADMINISTRATIVO%TYPE;
  ------------------------------------------------------------------------------------
  I_EXISTE                        INTEGER;
  N_ID_USUARIO_INGRESO            T_SCOB_MULTA_DETAL.ID_USUARIO_INGRESO%TYPE;
  I_ESTADO_MULTA_ACTUAL           T_SCOB_MULTA.ESTADO_MULTA%TYPE;
  C_FEC_ESTADO                    CHAR(10);
  N_NRO_INSTANCIA_MULTA           INTEGER;
  N_NRO_INSTANCIA_INICIA          INTEGER;
  N_NRO_DIAS_PLAZO                INTEGER;
  I_FLG_GRABA_PLAZO               INTEGER;
  C_FEC_INICIO_PLAZO              CHAR(10);
  C_FEC_FIN_PLAZO                 CHAR(10);
  C_FEC_ESTADO_INSTANCIA          CHAR(10);
  --
--  V_COD_ORGANO_RESOLUTIVO         T_SCOB_ORGANO_RESOLUTIVO.CODIGO%TYPE;
  I_NRO_PLAZO_REVISION            INTEGER;
  I_NRO_PLAZO_APELACION           INTEGER;
  N_POR_DSCTO_APELACION           T_SCOB_DESCUENTO.POR_DSCTO%TYPE;
  I_EST_MULTA_DETAL_ACTUAL        T_SCOB_MULTA_DETAL.ESTADO_MULTA%TYPE;

  C_FEC_APELACION                 CHAR(10);
  C_FEC_EN_REVISION               CHAR(10);
  I_FLG_EDITA_NRO_EXP_ANTIG       INTEGER;
begin
  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_retorno_det := 0;
  po_n_cod_error := -1;
  I_FLG_EDITA_NRO_EXP_ANTIG := 0;

  I_ESTADO_MULTA_ACTUAL := PI_I_ESTADO_MULTA;
  I_EXISTE := 0;

  --verifica si tiene amortizacion
  SELECT COUNT(MULT.ID_MULTA)
  INTO I_EXISTE
  FROM T_SCOB_MULTA MULT
  WHERE MULT.ID_MULTA = PI_N_ID_MULTA
  AND MULT.TOTAL_AMORTIZACION_DEUDA > 0;

  IF I_EXISTE > 0 THEN
    po_n_retorno := -7;
    po_n_cod_error := po_n_retorno;
    po_v_msj_error := 'No se puede realizar la accion. La multa presenta pagos realizados.';
    return;
  END IF;


  IF PI_C_ORIGEN_EDICION = 1 THEN

     --OBTENER LA INSTANCIA DE LA MULTA --08/06/2012
     SELECT ORGR.TIPO_INSTANCIA, MULT.TIPO_INSTANCIA_INICIA, MDET.ESTADO_MULTA
     INTO N_NRO_INSTANCIA_MULTA, N_NRO_INSTANCIA_INICIA, I_EST_MULTA_DETAL_ACTUAL
     FROM T_SCOB_MULTA_DETAL MDET
     INNER JOIN T_SCOB_MULTA MULT
           ON MULT.ID_MULTA = MDET.ID_MULTA
     INNER JOIN T_SCOB_ORGANO_RESOLUTIVO ORGR
           ON ORGR.ID_ORGANO_RESOLUTIVO = MDET.ID_ORGANO_RESOLUTIVO
     WHERE MDET.ID_MULTA_DETAL = PI_N_ID_MULTA_DETAL_ACTUAL;

     IF N_NRO_INSTANCIA_MULTA = N_NRO_INSTANCIA_INICIA THEN
        I_FLG_EDITA_NRO_EXP_ANTIG := 1;
     END IF;

     /*--08/06/2012
     --modificacion por OR
     SELECT MDET.ESTADO_MULTA
     INTO I_EST_MULTA_DETAL_ACTUAL
     FROM T_SCOB_MULTA_DETAL MDET
     WHERE MDET.ID_MULTA_DETAL = PI_N_ID_MULTA_DETAL_ACTUAL;
     */

     --verifica el estado final de multa OR.

     IF  (I_ESTADO_MULTA_ACTUAL = SCOB_PK_CONSTANTES.C_EST_MULT_CONSENTIDA) OR
         (I_ESTADO_MULTA_ACTUAL = SCOB_PK_CONSTANTES.C_EST_MULT_FIRME)      OR
         (I_ESTADO_MULTA_ACTUAL = SCOB_PK_CONSTANTES.C_EST_MULT_REVISADA)   OR
         (I_ESTADO_MULTA_ACTUAL = SCOB_PK_CONSTANTES.C_EST_MULT_APELADA)    OR
         (I_ESTADO_MULTA_ACTUAL = SCOB_PK_CONSTANTES.C_EST_MULT_EN_REVISION)
         THEN
         po_v_msj_error := 'La multa no puede cambiar a un estado definitivo desde esta opcion (corregir datos).';

         IF  (I_EST_MULTA_DETAL_ACTUAL = SCOB_PK_CONSTANTES.C_EST_MULT_CONSENTIDA) OR
             (I_EST_MULTA_DETAL_ACTUAL = SCOB_PK_CONSTANTES.C_EST_MULT_FIRME)      OR
             (I_EST_MULTA_DETAL_ACTUAL = SCOB_PK_CONSTANTES.C_EST_MULT_REVISADA)   OR
             (I_EST_MULTA_DETAL_ACTUAL = SCOB_PK_CONSTANTES.C_EST_MULT_APELADA)    OR
             (I_EST_MULTA_DETAL_ACTUAL = SCOB_PK_CONSTANTES.C_EST_MULT_EN_REVISION)
             THEN
             po_v_msj_error := 'No es posible corregir los datos de la multa si se encuentra en un estado definitivo para la instancia.';

         END IF;

         po_n_retorno := -8;
         po_n_cod_error := po_n_retorno;
         return;
         null;
     END IF;

  ELSIF PI_C_ORIGEN_EDICION = 2 THEN
     --modificacion AEC
     --obtiene el nro de dias de plazo configurado para la ultima instancia
     SELECT NVL(MDET.NRO_PLAZO,0), TO_CHAR(MULT.FEC_APELACION,'DD/MM/YYYY'), TO_CHAR(MULT.FEC_EN_REVISION,'DD/MM/YYYY')
     INTO N_NRO_DIAS_PLAZO, C_FEC_APELACION, C_FEC_EN_REVISION
     FROM T_SCOB_MULTA_DETAL MDET
     INNER JOIN T_SCOB_MULTA MULT
           ON MULT.ID_MULTA = MDET.ID_MULTA
     WHERE MDET.ID_MULTA_DETAL = PI_N_ID_MULTA_DETAL_ACTUAL;

     --verifica si tiene expediente cobranza generado.
     SELECT COUNT(EXMU.ID_EXPEDIENTE_MULTA)
     INTO I_EXISTE
     FROM T_SCOB_EXPEDIENTE_MULTA EXMU
     WHERE EXMU.ID_MULTA = PI_N_ID_MULTA
     AND EXMU.ESTADO = '1';

     IF I_EXISTE > 0 THEN
         po_n_retorno := -9;
         po_n_cod_error := po_n_retorno;
         po_v_msj_error := 'No se puede realizar la ccion. La multa tiene un expediente de cobranza generado.';
         return;
     END IF;
     --
  END IF;
  I_EXISTE := 0;

  --verifica la fecha resolucion
  -- scob_pk_utilitario.scob_sp_s_valida_fecha(PI_C_FECHA_RESOL,'U',I_EXISTE);
  scob_pk_utilitario.scob_sp_s_valida_fecha_by_or(PI_C_FECHA_RESOL,'U',PI_N_ID_MULTA_DETAL_ACTUAL,SCOB_PK_CONSTANTES.C_NU_X_ID_MULTA_DETAL,I_EXISTE);
  IF I_EXISTE=0 THEN
    po_n_retorno := -10;
    po_n_cod_error := po_n_retorno;
    po_v_msj_error := 'La fecha de resolucion no es valida, debe seleccionar una fecha habil.';
    return;
  END IF;
  I_EXISTE := 0;

  --verifica la fecha notificacion
  if PI_C_FECHA_NOTIF is not null then
      --scob_pk_utilitario.scob_sp_s_valida_fecha(PI_C_FECHA_NOTIF,'U',I_EXISTE);
      scob_pk_utilitario.scob_sp_s_valida_fecha_by_or(PI_C_FECHA_RESOL,'U',PI_N_ID_MULTA_DETAL_ACTUAL,SCOB_PK_CONSTANTES.C_NU_X_ID_MULTA_DETAL,I_EXISTE);
      IF I_EXISTE=0 THEN
        po_n_retorno := -11;
        po_n_cod_error := po_n_retorno;
        po_v_msj_error := 'La fecha de notificacion no es valida, debe seleccionar una fecha habil.';
        return;
      END IF;
      I_EXISTE := 0;
  end if;

  --verifica la fecha declaracion
  if PI_C_FECHA_DECLA is not null then
      --scob_pk_utilitario.scob_sp_s_valida_fecha(PI_C_FECHA_DECLA,'U',I_EXISTE);
      scob_pk_utilitario.scob_sp_s_valida_fecha_by_or(PI_C_FECHA_RESOL,'U',PI_N_ID_MULTA_DETAL_ACTUAL,SCOB_PK_CONSTANTES.C_NU_X_ID_MULTA_DETAL,I_EXISTE);
      IF I_EXISTE=0 THEN
        po_n_retorno := -12;
        po_n_cod_error := po_n_retorno;
        po_v_msj_error := 'La fecha de declaracion no es valida, debe seleccionar una fecha habil.';
        return;
      END IF;
      I_EXISTE := 0;
  end if;

  --verifica la fecha notificacion declaracion
  if PI_C_FEC_NOTIF_DECLARACION is not null then
      --scob_pk_utilitario.scob_sp_s_valida_fecha(PI_C_FEC_NOTIF_DECLARACION,'U',I_EXISTE);
      scob_pk_utilitario.scob_sp_s_valida_fecha_by_or(PI_C_FECHA_RESOL,'U',PI_N_ID_MULTA_DETAL_ACTUAL,SCOB_PK_CONSTANTES.C_NU_X_ID_MULTA_DETAL,I_EXISTE);
      IF I_EXISTE=0 THEN
        po_n_retorno := -13;
        po_n_cod_error := po_n_retorno;
        po_v_msj_error := 'La fecha de notificacion de declaracion no es valida, debe seleccionar una fecha habil.';
        return;
      END IF;
      I_EXISTE := 0;
  end if;

  --verifica la fecha apelacion/revision
  if PI_C_FEC_ESTADO_SGTE_INSTANCIA is not null then
      --scob_pk_utilitario.scob_sp_s_valida_fecha(PI_C_FEC_ESTADO_SGTE_INSTANCIA,'U',I_EXISTE);
      scob_pk_utilitario.scob_sp_s_valida_fecha_by_or(PI_C_FECHA_RESOL,'U',PI_N_ID_MULTA_DETAL_ACTUAL,SCOB_PK_CONSTANTES.C_NU_X_ID_MULTA_DETAL,I_EXISTE);
      IF I_EXISTE=0 THEN
        po_n_retorno := -14;
        po_n_cod_error := po_n_retorno;
        po_v_msj_error := 'La fecha de apelacion/revision no es valida, debe seleccionar una fecha habil.';
        return;
      END IF;
      I_EXISTE := 0;
  end if;

  --COMPOSICION DEL NRO_EXPEDIENTE_ADMINISTRATIVO, NRO_EXPEDIENTE_UNICO, NRO_RESOLUTIVO.
  V_ID_NRO_EXPED_NIVEL_ID := PI_V_EXP_ANTIG_NRO ||''|| PI_C_EXP_ANTIG_ANIO ||''|| TO_CHAR(PI_N_EXP_ANTIG_ID_SIGLA) ||''|| TO_CHAR(PI_N_EXP_ANTIG_ID_TIPO_EXPED);
  V_ID_NRO_EXPED_ADMIN_ID := PI_V_EXP_NUEVO_NRO ||''|| PI_C_EXP_NUEVO_ANIO ||''||  PI_V_EXP_NUEVO_COD_ORG_RESOL ||''|| PI_V_EXP_NUEVO_COD_MATERIA;
  V_ID_NRO_RESOLUCION_ID := PI_V_RESOL_NRO ||''|| PI_C_RESOL_ANIO ||''|| PI_V_EXP_NUEVO_COD_ORG_RESOL;

  V_NRO_RESOL := PI_V_RESOL_NRO ||'-'|| PI_C_RESOL_ANIO ||'/'|| PI_V_RESOL_DES_SIGLA;
  V_NRO_EXP_NIVEL := PI_V_EXP_ANTIG_NRO ||'-'|| PI_C_EXP_ANTIG_ANIO ||'/'|| PI_V_EXP_ANTIG_DES_SIGLA ||'-'|| PI_V_EXP_ANTIG_DES_TIPO_EXPED;
  V_NRO_EXP_ADMIN := PI_V_EXP_NUEVO_NRO || PI_C_EXP_NUEVO_ANIO || PI_V_EXP_NUEVO_COD_ORG_RESOL || PI_V_EXP_NUEVO_COD_MATERIA;


  --actualizar el nivel de la multa
  UPDATE T_SCOB_MULTA_DETAL MDET
  SET
      --
      ID_SIGLA = decode(I_FLG_EDITA_NRO_EXP_ANTIG,1,PI_N_EXP_ANTIG_ID_SIGLA,ID_SIGLA),
      COD_SIGLA = decode(I_FLG_EDITA_NRO_EXP_ANTIG,1,PI_V_EXP_ANTIG_COD_SIGLA,COD_SIGLA),
      DES_SIGLA = decode(I_FLG_EDITA_NRO_EXP_ANTIG,1,PI_V_EXP_ANTIG_DES_SIGLA,DES_SIGLA),
      NRO_EXPED_ANTIGUO = decode(I_FLG_EDITA_NRO_EXP_ANTIG,1,PI_V_EXP_ANTIG_NRO,NRO_EXPED_ANTIGUO),
      ANIO_EXPED_ANTIGUO = decode(I_FLG_EDITA_NRO_EXP_ANTIG,1,PI_C_EXP_ANTIG_ANIO,ANIO_EXPED_ANTIGUO),
      ID_TIPO_EXPED_ANTIGUO = decode(I_FLG_EDITA_NRO_EXP_ANTIG,1,PI_N_EXP_ANTIG_ID_TIPO_EXPED,ID_TIPO_EXPED_ANTIGUO),
      COD_TIPO_EXPED_ANTIGUO = decode(I_FLG_EDITA_NRO_EXP_ANTIG,1,PI_V_EXP_ANTIG_COD_TIPO_EXPED,COD_TIPO_EXPED_ANTIGUO),
      DES_TIPO_EXPED_ANTIGUO = decode(I_FLG_EDITA_NRO_EXP_ANTIG,1,PI_V_EXP_ANTIG_DES_TIPO_EXPED,DES_TIPO_EXPED_ANTIGUO),
      NRO_EXPED_ANTIGUO_ID = decode(I_FLG_EDITA_NRO_EXP_ANTIG,1,V_ID_NRO_EXPED_NIVEL_ID,NRO_EXPED_ANTIGUO_ID),
      NRO_EXP_NIVEL = decode(I_FLG_EDITA_NRO_EXP_ANTIG,1,V_NRO_EXP_NIVEL,NRO_EXP_NIVEL),
      --
      NRO_RESOLUCION_SEC = PI_V_RESOL_NRO,
      ANIO_RESOLUCION = PI_C_RESOL_ANIO,
      ID_SIGLA_RESOLUCION = PI_N_RESOL_ID_SIGLA,
      COD_SIGLA_RESOLUCION = PI_V_RESOL_COD_SIGLA,
      DES_SIGLA_RESOLUCION = PI_V_RESOL_DES_SIGLA,
      NRO_RESOLUCION_ID = V_ID_NRO_RESOLUCION_ID,
      --
      NRO_RESOLUCION = V_NRO_RESOL,
      FEC_RESOLUCION = TO_DATE(PI_C_FECHA_RESOL,'DD/MM/YYYY'),
      FEC_NOTIFICACION_RESOLUCION = DECODE(NVL(PI_C_FECHA_NOTIF,' '), ' ', NULL, TO_DATE(PI_C_FECHA_NOTIF,'DD/MM/YYYY')),
      NRO_RESOLUCION_DECLARACION = DECODE(NVL(PI_V_NRO_RESOL_DECLARACION,' '),' ',NULL,PI_V_NRO_RESOL_DECLARACION),
      FEC_DECLARACION = DECODE(NVL(PI_C_FECHA_DECLA,' '),' ',NULL,TO_DATE(PI_C_FECHA_DECLA,'DD/MM/YYYY')),
      FEC_NOTIFICACION_DECLARACION = DECODE(NVL(PI_C_FEC_NOTIF_DECLARACION,' '),' ',NULL,TO_DATE(PI_C_FEC_NOTIF_DECLARACION,'DD/MM/YYYY')),
      FEC_ESTADO_SGTE_INSTANCIA = DECODE(NVL(PI_C_FEC_ESTADO_SGTE_INSTANCIA,' '),' ',NULL,TO_DATE(PI_C_FEC_ESTADO_SGTE_INSTANCIA,'DD/MM/YYYY')),
      --
      AUDFECMODIFICACION = SYSDATE,
      AUDUSUMODIFICACION = PI_V_AUDUSUMODIFICACION
  WHERE
      ID_MULTA_DETAL = PI_N_ID_MULTA_DETAL_ACTUAL;

  --actualiza la multa
  UPDATE T_SCOB_MULTA
  SET
    NRO_EXP_ADMINISTRATIVO = decode(I_FLG_EDITA_NRO_EXP_ANTIG,1,V_NRO_EXP_ADMIN,NRO_EXP_ADMINISTRATIVO),
    NRO_EXPED_UNICO = decode(I_FLG_EDITA_NRO_EXP_ANTIG,1,PI_V_EXP_NUEVO_NRO,NRO_EXPED_UNICO),
    ANIO_EXPED_UNICO = decode(I_FLG_EDITA_NRO_EXP_ANTIG,1,PI_C_EXP_NUEVO_ANIO,ANIO_EXPED_UNICO),
    NRO_EXPED_UNICO_ID = decode(I_FLG_EDITA_NRO_EXP_ANTIG,1,V_ID_NRO_EXPED_ADMIN_ID,NRO_EXPED_UNICO_ID),
    --
    FLG_TIPO_MULTA = PI_C_FLG_TIPO_MULTA,
    ID_SEDE = PI_N_SEDE,
    --
    AUDFECMODIFICACION = SYSDATE,
    AUDUSUMODIFICACION = PI_V_AUDUSUMODIFICACION
  WHERE ID_MULTA = PI_N_ID_MULTA;


  IF PI_C_ORIGEN_EDICION = 2 THEN --AEC

      /*C_FEC_INICIO_PLAZO := TO_CHAR(SCOB_PK_UTILITARIO.SCOB_FN_DIAS_VALIDOS(
                                    TO_DATE(PI_C_FECHA_NOTIF,'DD/MM/YYYY'),
                                    2, '0'),'DD/MM/YYYY');*/ --mas un dia.
      C_FEC_INICIO_PLAZO := TO_CHAR(SCOB_PK_UTILITARIO.SCOB_FN_DIAS_VALIDOS_BY_OR(
                                    TO_DATE(PI_C_FECHA_NOTIF,'DD/MM/YYYY'),
                                    2, '0',
                                    PI_N_ID_MULTA_DETAL_ACTUAL,
                                    SCOB_PK_CONSTANTES.C_NU_X_ID_MULTA_DETAL),'DD/MM/YYYY'
                                    ); --mas un dia.

      /*C_FEC_FIN_PLAZO := TO_CHAR(SCOB_PK_UTILITARIO.SCOB_FN_DIAS_VALIDOS(TO_DATE(C_FEC_INICIO_PLAZO,'DD/MM/YYYY'),
                                 N_NRO_DIAS_PLAZO, '0'),'DD/MM/YYYY');*/
      C_FEC_FIN_PLAZO := TO_CHAR(SCOB_PK_UTILITARIO.SCOB_FN_DIAS_VALIDOS_BY_OR(TO_DATE(C_FEC_INICIO_PLAZO,'DD/MM/YYYY'),
                                 N_NRO_DIAS_PLAZO, '0',
                                 PI_N_ID_MULTA_DETAL_ACTUAL,
                                 SCOB_PK_CONSTANTES.C_NU_X_ID_MULTA_DETAL),'DD/MM/YYYY'
                                );

      /*C_FEC_ESTADO_INSTANCIA := TO_CHAR(SCOB_PK_UTILITARIO.SCOB_FN_DIAS_VALIDOS(TO_DATE(C_FEC_FIN_PLAZO,'DD/MM/YYYY'),
                                 2, '0'),'DD/MM/YYYY');*/
      C_FEC_ESTADO_INSTANCIA := TO_CHAR(SCOB_PK_UTILITARIO.SCOB_FN_DIAS_VALIDOS_BY_OR(TO_DATE(C_FEC_FIN_PLAZO,'DD/MM/YYYY'),
                                 2, '0',PI_N_ID_MULTA_DETAL_ACTUAL,
                                 SCOB_PK_CONSTANTES.C_NU_X_ID_MULTA_DETAL),'DD/MM/YYYY');

      --ACTUALIZA LAS FECHAS DEL PLAZO
      UPDATE T_SCOB_MULTA_DETAL MDET
      SET
          MDET.FEC_INI_PLAZO = DECODE(MDET.FEC_INI_PLAZO,NULL,NULL,TO_DATE(C_FEC_INICIO_PLAZO,'DD/MM/YYYY')),
          MDET.FEC_FIN_PLAZO = DECODE(MDET.FEC_FIN_PLAZO,NULL,NULL,TO_DATE(C_FEC_FIN_PLAZO,'DD/MM/YYYY')),
          MDET.FEC_ESTADO_INSTANCIA = DECODE(MDET.FEC_ESTADO_INSTANCIA,NULL,NULL,TO_DATE(C_FEC_ESTADO_INSTANCIA,'DD/MM/YYYY'))
      WHERE ID_MULTA_DETAL = PI_N_ID_MULTA_DETAL_ACTUAL;

      -----
      CASE
          WHEN C_FEC_EN_REVISION IS NOT NULL THEN
              UPDATE T_SCOB_MULTA MULT SET
                 FEC_EN_REVISION = DECODE(PI_C_FEC_ESTADO_SGTE_INSTANCIA,NULL,FEC_EN_REVISION,TO_DATE(PI_C_FEC_ESTADO_SGTE_INSTANCIA,'DD/MM/YYYY'))
              WHERE ID_MULTA = PI_N_ID_MULTA;
          WHEN C_FEC_APELACION IS NOT NULL THEN
              UPDATE T_SCOB_MULTA MULT SET
                 FEC_APELACION = DECODE(PI_C_FEC_ESTADO_SGTE_INSTANCIA,NULL,FEC_APELACION,TO_DATE(PI_C_FEC_ESTADO_SGTE_INSTANCIA,'DD/MM/YYYY'))
              WHERE ID_MULTA = PI_N_ID_MULTA;
          ELSE NULL;
      END CASE;
      -----

  ELSIF PI_C_ORIGEN_EDICION = 1 THEN --OR

      ----------------------------------------------------------------
      --logica calculo de fechas plazo y cambio de estado (29.05.2012)
      ----------------------------------------------------------------
      --obtener los dias de plazo de apelacion
      I_EXISTE := 0;
      BEGIN
          SELECT NVL(DSCTO.NRO_DIAS,0),NVL(POR_DSCTO,0)
          INTO I_NRO_PLAZO_APELACION, N_POR_DSCTO_APELACION
          FROM T_SCOB_MULTA MULT
          INNER JOIN T_SCOB_DESCUENTO DSCTO
                ON DSCTO.ID_MATERIA = MULT.ID_MATERIA
                AND DSCTO.ESTADO = '1'
          WHERE MULT.ID_MULTA = PI_N_ID_MULTA;

      EXCEPTION WHEN NO_DATA_FOUND THEN
          I_EXISTE := -10;
      END;
      IF I_EXISTE < 0 THEN
          po_v_msj_error :='No se puede realizar la accion. No se tiene configurado el plazo de apelacion. Revisar mantenimiento de materias (descuento).';
          po_n_cod_error := -15;
          po_n_retorno := po_n_cod_error;
          return;
      END IF;

      --obtener los dias de plazo de revision
      I_EXISTE := 0;
      BEGIN
          SELECT NVL(MATE.PLA_REVISION,0)
          INTO I_NRO_PLAZO_REVISION
          FROM T_SCOB_MULTA MULT
          INNER JOIN T_SCOB_MATERIA MATE
                ON MATE.ID_MATERIA = MULT.ID_MATERIA
          WHERE MULT.ID_MULTA = PI_N_ID_MULTA;
      EXCEPTION WHEN NO_DATA_FOUND THEN
        I_EXISTE := -11;
      END;
      IF I_EXISTE < 0 THEN
          po_v_msj_error :='No se puede realizar la accion. No se tiene configurado el plazo de revision. Revisar mantenimiento de materias.';
          po_n_cod_error := -16;
          po_n_retorno := po_n_cod_error;
          return;
      END IF;
      I_EXISTE := 0;

      --verifica el sancionado segun estado de la multa
      IF  (PI_I_ESTADO_MULTA = SCOB_PK_CONSTANTES.C_EST_MULT_CONSENTIDA) OR
          (PI_I_ESTADO_MULTA = SCOB_PK_CONSTANTES.C_EST_MULT_FIRME)      OR
          (PI_I_ESTADO_MULTA = SCOB_PK_CONSTANTES.C_EST_MULT_REVISADA)   OR
          (PI_I_ESTADO_MULTA = SCOB_PK_CONSTANTES.C_EST_MULT_APELADA)    OR
          (PI_I_ESTADO_MULTA = SCOB_PK_CONSTANTES.C_EST_MULT_EN_REVISION)
          THEN

          --verificar que se tenga un sancionado.
          SELECT COUNT(MSAN.ID_MULTA_SANCIONADO)
          INTO I_EXISTE
          FROM T_SCOB_MULTA_DETAL MDET
          INNER JOIN T_SCOB_MULTA_SANCIONADO MSAN
                ON MSAN.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL
                AND MSAN.ESTADO = '1'
                AND MSAN.COD_TIPO_PERSONA = SCOB_PK_CONSTANTES.C_COD_TIPO_PERSONA_SANCIONADO --SANCIONADO
          WHERE MDET.ID_MULTA = PI_N_ID_MULTA
          AND MDET.FLG_ACTUAL = '1'
          AND MDET.ESTADO = '1';

          IF I_EXISTE < 1 THEN
              po_n_cod_error := -17;
              po_v_msj_error := 'No se puede realizar la accion. Debe registrar al sancionado.';
              return;
          END IF;
      END IF;

      /********************************************************************************/
      --insertar logs de estados.
      /********************************************************************************/
      /* --08/06/2012
      --OBTENER LA INSTANCIA DE LA MULTA
      SELECT ORGR.TIPO_INSTANCIA, MULT.TIPO_INSTANCIA_INICIA
      INTO N_NRO_INSTANCIA_MULTA, N_NRO_INSTANCIA_INICIA
      FROM T_SCOB_MULTA_DETAL MDET
      INNER JOIN T_SCOB_MULTA MULT
            ON MULT.ID_MULTA = MDET.ID_MULTA
      INNER JOIN T_SCOB_ORGANO_RESOLUTIVO ORGR
            ON ORGR.ID_ORGANO_RESOLUTIVO = MDET.ID_ORGANO_RESOLUTIVO
      WHERE MDET.ID_MULTA_DETAL = PI_N_ID_MULTA_DETAL_ACTUAL;
      */

      --ACTUALIZACION DEL ESTADO Y FECHA DE ESTADO --27.09.2011B
      --obtener la fecha del cambio de estado
      C_FEC_ESTADO := TO_CHAR(SYSDATE,'DD/MM/YYYY');

      I_FLG_GRABA_PLAZO := 0;

      --verifica los estados por instacia que inicia la multa
      IF N_NRO_INSTANCIA_INICIA = SCOB_PK_CONSTANTES.C_TBL_TIPO_INSTANCIA_AUTO THEN --(TRES INSTANCIAS)

         CASE N_NRO_INSTANCIA_MULTA
             WHEN SCOB_PK_CONSTANTES.C_TBL_TIPO_INSTANCIA_AUTO THEN
                  CASE
                       WHEN I_ESTADO_MULTA_ACTUAL = SCOB_PK_CONSTANTES.C_EST_MULT_IMPUESTA OR --IMPUESTA
                            I_ESTADO_MULTA_ACTUAL = SCOB_PK_CONSTANTES.C_EST_MULT_EN_PLAZO_APELACION OR --30.05.2012
                            I_ESTADO_MULTA_ACTUAL = SCOB_PK_CONSTANTES.C_EST_MULT_EN_PLAZO_REVISION OR
                            I_ESTADO_MULTA_ACTUAL = SCOB_PK_CONSTANTES.C_EST_MULT_FUERA_PLAZO_APE OR --30.05.2012
                            I_ESTADO_MULTA_ACTUAL = SCOB_PK_CONSTANTES.C_EST_MULT_FUERA_PLAZO_REV    --30.05.2012
                            --I_ESTADO_MULTA_ACTUAL = SCOB_PK_CONSTANTES.C_EST_MULT_CONSENTIDA OR    --30.05.2012
                            --I_ESTADO_MULTA_ACTUAL = SCOB_PK_CONSTANTES.C_EST_MULT_APELADA          --30.05.2012
                            THEN
                            C_FEC_ESTADO := PI_C_FECHA_RESOL;

                            --CALCULA EL PERIODO DE PLAZO
                            IF NVL(PI_C_FECHA_NOTIF,' ')<>' 'THEN
                                  I_FLG_GRABA_PLAZO := 11;
                            END IF;

                       WHEN I_ESTADO_MULTA_ACTUAL = SCOB_PK_CONSTANTES.C_EST_MULT_CONSENTIDA THEN --CONSENTIDA
                            C_FEC_ESTADO := PI_C_FECHA_DECLA;
                       WHEN I_ESTADO_MULTA_ACTUAL = SCOB_PK_CONSTANTES.C_EST_MULT_APELADA THEN --APELADA
                            C_FEC_ESTADO := PI_C_FEC_ESTADO_SGTE_INSTANCIA;
                       ELSE NULL;
                  END CASE;
             WHEN SCOB_PK_CONSTANTES.C_TBL_TIPO_INSTANCIA_COMI THEN
                  CASE
                     WHEN I_ESTADO_MULTA_ACTUAL = SCOB_PK_CONSTANTES.C_EST_MULT_PENDIENTE_RESOLVER OR --IMPUESTA
                          I_ESTADO_MULTA_ACTUAL = SCOB_PK_CONSTANTES.C_EST_MULT_EN_PLAZO_APELACION OR --30.05.2012
                          I_ESTADO_MULTA_ACTUAL = SCOB_PK_CONSTANTES.C_EST_MULT_EN_PLAZO_REVISION OR
                          I_ESTADO_MULTA_ACTUAL = SCOB_PK_CONSTANTES.C_EST_MULT_FUERA_PLAZO_APE OR --30.05.2012
                          I_ESTADO_MULTA_ACTUAL = SCOB_PK_CONSTANTES.C_EST_MULT_FUERA_PLAZO_REV    --30.05.2012
                              --30.05.2012
                          --I_ESTADO_MULTA_ACTUAL = SCOB_PK_CONSTANTES.C_EST_MULT_FIRME OR            --30.05.2012
                          --I_ESTADO_MULTA_ACTUAL = SCOB_PK_CONSTANTES.C_EST_MULT_EN_REVISION         --30.05.2012
                          THEN --IMPUESTA
                          C_FEC_ESTADO := PI_C_FECHA_RESOL;

                          --CALCULA EL PERIODO DE PLAZO
                          IF NVL(PI_C_FECHA_NOTIF,' ')<>' 'THEN
                                I_FLG_GRABA_PLAZO := 12;
                          END IF;
                     WHEN I_ESTADO_MULTA_ACTUAL = SCOB_PK_CONSTANTES.C_EST_MULT_FIRME THEN --FIRME
                          C_FEC_ESTADO := PI_C_FECHA_DECLA;
                     WHEN I_ESTADO_MULTA_ACTUAL = SCOB_PK_CONSTANTES.C_EST_MULT_EN_REVISION THEN --EN REVISION
                          C_FEC_ESTADO := PI_C_FEC_ESTADO_SGTE_INSTANCIA;
                     ELSE NULL;
                END CASE;
             WHEN SCOB_PK_CONSTANTES.C_TBL_TIPO_INSTANCIA_SALA THEN
                CASE I_ESTADO_MULTA_ACTUAL
                     WHEN SCOB_PK_CONSTANTES.C_EST_MULT_PENDIENTE_RESOLVER THEN --IMPUESTA
                          C_FEC_ESTADO := PI_C_FECHA_RESOL;
                     WHEN SCOB_PK_CONSTANTES.C_EST_MULT_REVISADA THEN --REVISADA
                          C_FEC_ESTADO := PI_C_FECHA_NOTIF;
                     ELSE NULL;
                END CASE;
             ELSE NULL;
         END CASE;

      ELSIF N_NRO_INSTANCIA_INICIA = SCOB_PK_CONSTANTES.C_TBL_TIPO_INSTANCIA_COMI THEN --(DOS INSTANCIAS)

         CASE N_NRO_INSTANCIA_MULTA
             WHEN SCOB_PK_CONSTANTES.C_TBL_TIPO_INSTANCIA_COMI THEN
                  CASE
                       WHEN I_ESTADO_MULTA_ACTUAL = SCOB_PK_CONSTANTES.C_EST_MULT_IMPUESTA OR             --IMPUESTA
                            I_ESTADO_MULTA_ACTUAL = SCOB_PK_CONSTANTES.C_EST_MULT_FUERA_PLAZO_APE OR      --30.05.2012
                            I_ESTADO_MULTA_ACTUAL = SCOB_PK_CONSTANTES.C_EST_MULT_EN_PLAZO_APELACION OR      --30.05.2012
                            I_ESTADO_MULTA_ACTUAL = SCOB_PK_CONSTANTES.C_EST_MULT_FUERA_PLAZO_REV OR --30.05.2012
                            I_ESTADO_MULTA_ACTUAL = SCOB_PK_CONSTANTES.C_EST_MULT_EN_PLAZO_REVISION
                            --I_ESTADO_MULTA_ACTUAL = SCOB_PK_CONSTANTES.C_EST_MULT_CONSENTIDA OR         --30.05.2012
                            --I_ESTADO_MULTA_ACTUAL = SCOB_PK_CONSTANTES.C_EST_MULT_APELADA               --30.05.2012
                            THEN --IMPUESTA

                            C_FEC_ESTADO := PI_C_FECHA_RESOL;

                            --CALCULA EL PERIODO DE PLAZO
                            IF NVL(PI_C_FECHA_NOTIF,' ')<>' 'THEN
                               I_FLG_GRABA_PLAZO := 21;
                            END IF;
                       WHEN I_ESTADO_MULTA_ACTUAL = SCOB_PK_CONSTANTES.C_EST_MULT_CONSENTIDA THEN --CONSENTIDA
                            C_FEC_ESTADO := PI_C_FECHA_DECLA;
                       WHEN I_ESTADO_MULTA_ACTUAL = SCOB_PK_CONSTANTES.C_EST_MULT_APELADA THEN --APELADA
                            C_FEC_ESTADO := PI_C_FEC_ESTADO_SGTE_INSTANCIA;
                       ELSE NULL;
                  END CASE;
             WHEN SCOB_PK_CONSTANTES.C_TBL_TIPO_INSTANCIA_SALA THEN
                CASE I_ESTADO_MULTA_ACTUAL
                     WHEN SCOB_PK_CONSTANTES.C_EST_MULT_PENDIENTE_RESOLVER THEN --IMPUESTA
                          C_FEC_ESTADO := PI_C_FECHA_RESOL;
                     WHEN SCOB_PK_CONSTANTES.C_EST_MULT_FIRME THEN --FIRME
                          C_FEC_ESTADO := PI_C_FECHA_NOTIF;
                     ELSE NULL;
                END CASE;
             ELSE NULL;
         END CASE;

      END IF;

      SCOB_SP_I_MULTA_ESTADO(PI_N_ID_MULTA, PI_N_ID_MULTA_DETAL_ACTUAL, I_ESTADO_MULTA_ACTUAL, 0, C_FEC_ESTADO, PI_V_AUDUSUMODIFICACION, N_ID_USUARIO_INGRESO, 0, po_n_retorno,  PO_N_COD_ERROR,  PO_V_MSJ_ERROR);
      --@0001:INI
      if po_n_retorno < 0 then
         rollback;
         return;
      end if;
      --@0001:FIN

      /*************************************************************************/
      --GENERA LOS OTROS ESTADOS DE LA MULTA --27.09.2011
      /*************************************************************************/
      --ACTUALIZA LAS FECHAS DE PLAZO
      IF I_FLG_GRABA_PLAZO <> 0 THEN
        --C_FEC_INICIO_PLAZO := TO_CHAR(TO_DATE(PI_C_FECHA_NOTIF,'DD/MM/YYYY') + 1,'DD/MM/YYYY');
        /*C_FEC_INICIO_PLAZO := TO_CHAR(SCOB_PK_UTILITARIO.SCOB_FN_DIAS_VALIDOS(
                                 TO_DATE(PI_C_FECHA_NOTIF,'DD/MM/YYYY'),
                                 2, '0'),'DD/MM/YYYY');*/ --mas un dia.
        C_FEC_INICIO_PLAZO := TO_CHAR(SCOB_PK_UTILITARIO.SCOB_FN_DIAS_VALIDOS_BY_OR(
                                 TO_DATE(PI_C_FECHA_NOTIF,'DD/MM/YYYY'),
                                 2, '0',PI_N_ID_MULTA_DETAL_ACTUAL,
                                 SCOB_PK_CONSTANTES.C_NU_X_ID_MULTA_DETAL),'DD/MM/YYYY'); --mas un dia.

        --
        C_FEC_ESTADO := TO_CHAR(SYSDATE,'DD/MM/YYYY');
        /*----------------------------------------------------------------------------------*/
        --CAMBIA AL ESTADO EN PLAZO
        /*----------------------------------------------------------------------------------*/
        CASE I_FLG_GRABA_PLAZO
             WHEN 11 THEN
                 I_ESTADO_MULTA_ACTUAL := SCOB_PK_CONSTANTES.C_EST_MULT_EN_PLAZO_APELACION;
                 C_FEC_ESTADO := C_FEC_INICIO_PLAZO;
                 N_NRO_DIAS_PLAZO := I_NRO_PLAZO_APELACION;
             WHEN 12 THEN
                 I_ESTADO_MULTA_ACTUAL := SCOB_PK_CONSTANTES.C_EST_MULT_EN_PLAZO_REVISION;
                 C_FEC_ESTADO := C_FEC_INICIO_PLAZO;
                 N_NRO_DIAS_PLAZO := I_NRO_PLAZO_REVISION;
             WHEN 21 THEN
                 I_ESTADO_MULTA_ACTUAL := SCOB_PK_CONSTANTES.C_EST_MULT_EN_PLAZO_APELACION;
                 C_FEC_ESTADO := C_FEC_INICIO_PLAZO;
                 N_NRO_DIAS_PLAZO := I_NRO_PLAZO_APELACION;
        END CASE;

        /*C_FEC_FIN_PLAZO := TO_CHAR(SCOB_PK_UTILITARIO.SCOB_FN_DIAS_VALIDOS(TO_DATE(C_FEC_INICIO_PLAZO,'DD/MM/YYYY'),
                                                                   N_NRO_DIAS_PLAZO, '0'),'DD/MM/YYYY');*/
        C_FEC_FIN_PLAZO := TO_CHAR(SCOB_PK_UTILITARIO.SCOB_FN_DIAS_VALIDOS_BY_OR(TO_DATE(C_FEC_INICIO_PLAZO,'DD/MM/YYYY'),
                                                                   N_NRO_DIAS_PLAZO, '0',PI_N_ID_MULTA_DETAL_ACTUAL,
                                 SCOB_PK_CONSTANTES.C_NU_X_ID_MULTA_DETAL),'DD/MM/YYYY');

        /*C_FEC_ESTADO_INSTANCIA := TO_CHAR(SCOB_PK_UTILITARIO.SCOB_FN_DIAS_VALIDOS(TO_DATE(C_FEC_FIN_PLAZO,'DD/MM/YYYY'),
                                                                   2, '0'),'DD/MM/YYYY');*/
        C_FEC_ESTADO_INSTANCIA := TO_CHAR(SCOB_PK_UTILITARIO.SCOB_FN_DIAS_VALIDOS_BY_OR(TO_DATE(C_FEC_FIN_PLAZO,'DD/MM/YYYY'),
                                                                   2, '0',PI_N_ID_MULTA_DETAL_ACTUAL,
                                 SCOB_PK_CONSTANTES.C_NU_X_ID_MULTA_DETAL),'DD/MM/YYYY');

        --ACTUALIZA LAS FECHAS DEL PLAZO
        UPDATE T_SCOB_MULTA_DETAL MDET
        SET
          MDET.NRO_PLAZO = N_NRO_DIAS_PLAZO,
          MDET.FEC_INI_PLAZO = TO_DATE(C_FEC_INICIO_PLAZO,'DD/MM/YYYY'),
          MDET.FEC_FIN_PLAZO = TO_DATE(C_FEC_FIN_PLAZO,'DD/MM/YYYY'),
          MDET.FEC_ESTADO_INSTANCIA = TO_DATE(C_FEC_ESTADO_INSTANCIA,'DD/MM/YYYY')
        WHERE ID_MULTA_DETAL = PI_N_ID_MULTA_DETAL_ACTUAL;

        UPDATE T_SCOB_MULTA MULT
        SET MULT.PORCENTAJE_DESCUENTO = N_POR_DSCTO_APELACION
        WHERE MULT.ID_MULTA = PI_N_ID_MULTA;


        --@0002--IF TO_DATE(C_FEC_INICIO_PLAZO,'DD/MM/YYYY') <= TO_DATE(TO_CHAR(SYSDATE,'DD/MM/YYYY'),'DD/MM/YYYY') THEN
           --CAMBIA AL ESTADO EN PLAZO.
           SCOB_SP_I_MULTA_ESTADO(PI_N_ID_MULTA, PI_N_ID_MULTA_DETAL_ACTUAL, I_ESTADO_MULTA_ACTUAL, 0, C_FEC_ESTADO, PI_V_AUDUSUMODIFICACION, PI_N_ID_USUARIO_MODIFICACION, 0, po_n_retorno,  PO_N_COD_ERROR,  PO_V_MSJ_ERROR);
           --@0001:INI
            if po_n_retorno < 0 then
               rollback;
               return;
            end if;
            --@0001:FIN
        --END IF;
        /*----------------------------------------------------------------------------------*/
        --CAMBIA AL ESTADO FUERA DE PLAZO
        /*----------------------------------------------------------------------------------*/
        C_FEC_ESTADO := TO_CHAR(SYSDATE,'DD/MM/YYYY');
        IF TO_DATE(C_FEC_ESTADO_INSTANCIA,'DD/MM/YYYY') <=
           TO_DATE(TO_CHAR(SYSDATE,'DD/MM/YYYY'),'DD/MM/YYYY') THEN
          CASE I_FLG_GRABA_PLAZO
               WHEN 11 THEN
                   I_ESTADO_MULTA_ACTUAL := SCOB_PK_CONSTANTES.C_EST_MULT_FUERA_PLAZO_APE;
                   C_FEC_ESTADO := C_FEC_ESTADO_INSTANCIA;
               WHEN 12 THEN
                   I_ESTADO_MULTA_ACTUAL := SCOB_PK_CONSTANTES.C_EST_MULT_FUERA_PLAZO_REV;
                   C_FEC_ESTADO := C_FEC_ESTADO_INSTANCIA;
               WHEN 21 THEN
                   I_ESTADO_MULTA_ACTUAL := SCOB_PK_CONSTANTES.C_EST_MULT_FUERA_PLAZO_APE;
                   C_FEC_ESTADO := C_FEC_ESTADO_INSTANCIA;
          END CASE;

          SCOB_SP_I_MULTA_ESTADO(PI_N_ID_MULTA, PI_N_ID_MULTA_DETAL_ACTUAL, I_ESTADO_MULTA_ACTUAL, 0, C_FEC_ESTADO, PI_V_AUDUSUMODIFICACION, N_ID_USUARIO_INGRESO, 0, po_n_retorno,  PO_N_COD_ERROR,  PO_V_MSJ_ERROR);
          --@0001:INI
          if po_n_retorno < 0 then
             rollback;
             return;
          end if;
          --@0001:FIN
        END IF;
      END IF;

    IF PI_C_ORIGEN_EDICION = 1 THEN
       --LLAMADA AL SP CALCULAR DESCUENTO.
       SCOB_PK_JOB.SCOB_PK_ACT_DSCT_MULTA_AFEC(PI_N_ID_MULTA);
    END IF;
  END IF;
  
  --INICIO VICTOR BENDEZU - MIGRACION SICOB A SIA
  USR_SIA_INTFZ.PKG_INTFZ_REG_MULTA_SICOB_SIA.SP_U_MULTA_SICOB_A_SIA(PIN_NU_ID_MULTA => PI_N_ID_MULTA,
                                                                     POUT_NU_COD_RESULT => PO_N_RETORNO,
                                                                     POUT_VC_MSG_RESULT => PO_V_MSJ_ERROR);
  
  IF PO_N_RETORNO < 0 THEN
     ROLLBACK;
     RETURN;
  END IF;
  --FIN VICTOR BENDEZU - MIGRACION SICOB A SIA
  
  ----------------------------------------------------------------
  po_n_cod_error := PI_N_ID_MULTA;
  po_n_retorno := PI_N_ID_MULTA;
  po_n_retorno_det := PI_N_ID_MULTA_DETAL_ACTUAL;
  commit;
  --rollback;
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

procedure SCOB_SP_U_FEC_NOTIFICACION
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 31.05.2012
-- Proposito    : actualiza la fecha de notificacion de los documentos cedula y cedula rec
                  y la fecha de las resoluciones asociadas.
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA              IN T_SCOB_MULTA.ID_MULTA%TYPE,
  PI_N_ID_EXPED_DOCUMENTO    IN T_SCOB_EXPEDIENTE_DOCUMENTO.ID_EXPEDIENTE_DOCUMENTO%TYPE,
  PI_C_FEC_NOTIFICACION      IN CHAR,
  PI_N_ID_USU_MODIFICACION   IN NUMBER,
  PI_V_AUDUSUMODIFICACION    IN T_SCOB_EXPEDIENTE_DOCUMENTO.AUDUSUMODIFICACION%TYPE,
  po_n_retorno               out number,
  po_n_cod_error             out number,
  po_v_msj_error             out varchar2
)
is
  N_ID_EXPED_DOC_ORIGEN      NUMBER;
--  C_FEC_NOTIF_REC            CHAR(10);
  C_FEC_NOTIF_REC_ACTUAL     CHAR(10);
  C_FLG_DOC_REC              CHAR(1);
begin
  po_v_msj_error :=' ';
  po_n_retorno := 0;
  po_n_cod_error := 0;
  C_FLG_DOC_REC := '0';

  UPDATE T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
  SET
     EXDO.FEC_NOTIFICACION = TO_DATE(PI_C_FEC_NOTIFICACION,'DD/MM/YYYY'),
     EXDO.AUDUSUMODIFICACION = PI_V_AUDUSUMODIFICACION,
     EXDO.AUDFECMODIFICACION = SYSDATE,
     EXDO.ID_USU_FEC_NOTIF = PI_N_ID_USU_MODIFICACION
  WHERE EXDO.ID_EXPEDIENTE_DOCUMENTO = PI_N_ID_EXPED_DOCUMENTO;

  BEGIN
     --obtener el DOC ORIGEN de los documentos asociados
     --obtener si es una REC
     SELECT DISTINCT EXDO.ID_EXPEDIENTE_DOCUMENTO_ORIGEN, NVL(EXDO.FLG_DOCUMENTO_REC,'0')
     INTO N_ID_EXPED_DOC_ORIGEN, C_FLG_DOC_REC
     FROM T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
     WHERE
     EXDO.ID_EXPEDIENTE_DOCUMENTO = PI_N_ID_EXPED_DOCUMENTO;

  EXCEPTION WHEN NO_DATA_FOUND THEN
     NULL;
  END;

  IF N_ID_EXPED_DOC_ORIGEN IS NOT NULL THEN

     IF C_FLG_DOC_REC = '1' THEN
        BEGIN
            --obtener la fecha de notificacion actualizada a la multa
            SELECT TO_CHAR(
                   DECODE(MULT.FEC_NOTIF_REC,NULL,TO_DATE('01/01/1900','DD/MM/YYYY'),MULT.FEC_NOTIF_REC)
                   ,'DD/MM/YYYY')
            INTO C_FEC_NOTIF_REC_ACTUAL
            FROM T_SCOB_MULTA MULT
            WHERE MULT.ID_MULTA = PI_N_ID_MULTA;
        EXCEPTION WHEN NO_DATA_FOUND THEN
           NULL;
        END;

       IF C_FEC_NOTIF_REC_ACTUAL < PI_C_FEC_NOTIFICACION THEN
            ---actualiza la fecha de notificacion en T_SCOB_MULTA
           UPDATE T_SCOB_MULTA MULT
           SET MULT.FEC_NOTIF_REC = TO_DATE(PI_C_FEC_NOTIFICACION,'DD/MM/YYYY')
           WHERE MULT.ID_MULTA = PI_N_ID_MULTA;
       END IF;
     END IF;

     --actualiza la fecha de notificacion en el documento origen
     UPDATE T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
     SET
        EXDO.FEC_NOTIFICACION = TO_DATE(PI_C_FEC_NOTIFICACION,'DD/MM/YYYY'),
        EXDO.AUDUSUMODIFICACION = PI_V_AUDUSUMODIFICACION,
        EXDO.AUDFECMODIFICACION = SYSDATE,
        EXDO.ID_USU_FEC_NOTIF = PI_N_ID_USU_MODIFICACION
      WHERE EXDO.ID_EXPEDIENTE_DOCUMENTO = N_ID_EXPED_DOC_ORIGEN
      AND TO_DATE(NVL(TO_CHAR(EXDO.FEC_NOTIFICACION,'DD/MM/YYYY'),'01/01/1900'),'DD/MM/YYYY') <
          TO_DATE(PI_C_FEC_NOTIFICACION,'DD/MM/YYYY');
  END IF;

  po_n_retorno :=   PI_N_ID_MULTA;
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

procedure SCOB_SP_U_EDITA_MULTA_ANTDMPNG
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 07/06/2012
-- Proposito    : actualizar las multas por materia antidumping
                  solo si submateria es: derecho antidumping.
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    : 
-----------------------------------------------------------
*/
(
  PI_N_ID_MULTA_ANTIDUMPING         IN T_SCOB_MULTA_ANTIDUMPING.ID_MULTA_ANTIDUMPING%TYPE,
  PI_N_ID_MULTA                     IN T_SCOB_MULTA.ID_MULTA%TYPE,
  PI_N_ID_MULTA_DETAL               IN T_SCOB_MULTA_DETAL.ID_MULTA_DETAL%TYPE,
  PI_N_ID_USUARIO_SECRETARIO        IN T_SCOB_MULTA_DETAL.ID_USUARIO_SECRETARIO%TYPE,
  --
  PI_V_NRO_OFICIO_SUNAT_CODIGO      IN T_SCOB_MULTA_ANTIDUMPING.NRO_OFICIO_SUNAT_CODIGO%TYPE,
  PI_V_NRO_OFICIO_SUNAT_ANIO        IN T_SCOB_MULTA_ANTIDUMPING.NRO_OFICIO_SUNAT_ANIO%TYPE,
  PI_V_NRO_OFICIO_SUNAT_PREFIJO     IN T_SCOB_MULTA_ANTIDUMPING.NRO_OFICIO_SUNAT_PREFIJO%TYPE,
  PI_V_NRO_OFICIO_SUNAT_SEC         IN T_SCOB_MULTA_ANTIDUMPING.NRO_OFICIO_SUNAT_CORRELATIVO%TYPE,
  PI_V_NRO_LIQUIDACION_CODIGO       IN T_SCOB_MULTA_ANTIDUMPING.NRO_LIQUIDACION_CODIGO%TYPE,
  PI_V_NRO_LIQUIDACION_ANIO         IN T_SCOB_MULTA_ANTIDUMPING.NRO_LIQUIDACION_ANIO%TYPE,
  PI_V_NRO_LIQUIDACION_SEC          IN T_SCOB_MULTA_ANTIDUMPING.NRO_LIQUIDACION_CORRELATIVO%TYPE,
  PI_V_NRO_DUA_CODIGO               IN T_SCOB_MULTA_ANTIDUMPING.NRO_DUA_CODIGO%TYPE,
  PI_V_NRO_DUA_ANIO                 IN T_SCOB_MULTA_ANTIDUMPING.NRO_DUA_ANIO%TYPE,
  PI_V_NRO_DUA_SEC                  IN T_SCOB_MULTA_ANTIDUMPING.NRO_DUA_CORRELATIVO%TYPE,
  PI_N_TIPO_CAMBIO                  IN T_SCOB_MULTA_ANTIDUMPING.TIPO_CAMBIO%TYPE,
  PI_N_MONTO_ANTIDUMPING            IN T_SCOB_MULTA_ANTIDUMPING.MONTO_ANTIDUMPING%TYPE,
  PI_N_ID_INTENDENCIA               IN T_SCOB_MULTA_ANTIDUMPING.ID_INTENDENCIA%TYPE,
  PI_N_ID_PARTIDA                   IN T_SCOB_MULTA_ANTIDUMPING.ID_PARTIDA%TYPE,
  PI_V_FECHA_NOTIF                  IN VARCHAR2,
  PI_I_ESTADO_MULTA                 IN T_SCOB_MULTA.ESTADO_MULTA%TYPE,
  PI_N_ID_SEDE                      IN T_SCOB_SEDE.ID_SEDE%TYPE,
 --nuevos
  PI_V_EXP_ANTIG_NRO                IN VARCHAR2,
  PI_C_EXP_ANTIG_ANIO               IN CHAR,
  PI_N_EXP_ANTIG_ID_SIGLA           IN NUMBER,
  PI_N_EXP_ANTIG_ID_TIPO_EXPED      IN NUMBER,
  PI_V_EXP_ANTIG_COD_SIGLA          IN VARCHAR2,
  PI_V_EXP_ANTIG_COD_TIPO_EXPED     IN VARCHAR2,
  PI_V_EXP_ANTIG_DES_SIGLA          IN VARCHAR2,
  PI_V_EXP_ANTIG_DES_TIPO_EXPED     IN VARCHAR2,

  PI_V_RESOL_NRO                    IN VARCHAR2,
  PI_C_RESOL_ANIO                   IN CHAR,
  PI_N_RESOL_ID_SIGLA               IN NUMBER,
  PI_V_RESOL_COD_SIGLA              IN VARCHAR2,
  PI_V_RESOL_DES_SIGLA              IN VARCHAR2,
  --
  PI_V_AUDUSUMODIFICACION           IN T_SCOB_MULTA.AUDUSUCREACION%TYPE,
  PI_N_ID_USUARIO_INGRESO           IN T_SCOB_MULTA.ID_USUARIO_INGRESO%TYPE,
  --
  po_n_retorno                      out number,
  po_n_retorno_det                  out number,
  po_n_cod_error                    out number,
  po_v_msj_error                    out varchar2
)
is
  N_ID_MULTA_ESTADO                 T_SCOB_MULTA_ESTADO.ID_MULTA_ESTADO%TYPE;
  I_EXISTE                          INTEGER;
  --
  V_ID_NRO_EXPED_NIVEL_ID           T_SCOB_MULTA_DETAL.NRO_EXPED_ANTIGUO_ID%TYPE;
  V_ID_NRO_RESOLUCION_ID            T_SCOB_MULTA_DETAL.NRO_RESOLUCION_ID%TYPE;
  --
  V_NRO_RESOL                       T_SCOB_MULTA_DETAL.NRO_RESOLUCION%TYPE;
  V_NRO_EXP_NIVEL                   T_SCOB_MULTA_DETAL.NRO_EXP_NIVEL%TYPE;
  V_COD_ORGANO_RESOLUTIVO           T_SCOB_ORGANO_RESOLUTIVO.CODIGO%TYPE;
  N_MONTO                           T_SCOB_MULTA.MONTO_UIT%TYPE;
begin

  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_retorno_det := 0;
  po_n_cod_error := 0;

  --OBTENER EL COD_OR DE LA MULTA
  SELECT ORGR.CODIGO
  INTO V_COD_ORGANO_RESOLUTIVO
  FROM T_SCOB_MULTA_DETAL MDET
  INNER JOIN T_SCOB_ORGANO_RESOLUTIVO ORGR ON ORGR.ID_ORGANO_RESOLUTIVO = MDET.ID_ORGANO_RESOLUTIVO
  WHERE MDET.ID_MULTA_DETAL = PI_N_ID_MULTA_DETAL;

  --COMPOSICION DEL NRO_EXPEDIENTE_ADMINISTRATIVO, NRO_EXPEDIENTE_UNICO, NRO_RESOLUTIVO.
  V_ID_NRO_EXPED_NIVEL_ID := PI_V_EXP_ANTIG_NRO ||''|| PI_C_EXP_ANTIG_ANIO ||''|| TO_CHAR(PI_N_EXP_ANTIG_ID_SIGLA) ||''|| TO_CHAR(PI_N_EXP_ANTIG_ID_TIPO_EXPED);
  V_ID_NRO_RESOLUCION_ID := PI_V_RESOL_NRO ||''|| PI_C_RESOL_ANIO ||''|| V_COD_ORGANO_RESOLUTIVO;
  --
  V_NRO_RESOL := PI_V_RESOL_NRO ||'-'|| PI_C_RESOL_ANIO ||'/'|| PI_V_RESOL_DES_SIGLA;
  V_NRO_EXP_NIVEL := PI_V_EXP_ANTIG_NRO ||'-'|| PI_C_EXP_ANTIG_ANIO ||'/'|| PI_V_EXP_ANTIG_DES_SIGLA ||'-'|| PI_V_EXP_ANTIG_DES_TIPO_EXPED;

  --verificar que el numero de liquidacion no exista.
  SELECT COUNT(MUAN.ID_MULTA_ANTIDUMPING)
  INTO I_EXISTE
  FROM T_SCOB_MULTA_ANTIDUMPING MUAN
  WHERE
    NRO_LIQUIDACION_CODIGO = PI_V_NRO_LIQUIDACION_CODIGO
    AND NRO_LIQUIDACION_ANIO = PI_V_NRO_LIQUIDACION_ANIO
    AND NRO_LIQUIDACION_CORRELATIVO = PI_V_NRO_LIQUIDACION_SEC
    AND MUAN.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
    AND MUAN.ID_MULTA_ANTIDUMPING <> PI_N_ID_MULTA_ANTIDUMPING;
  IF I_EXISTE > 0 THEN --no existen estados registrado para esta instancia
      po_n_retorno := -10;
      po_n_cod_error := po_n_retorno;
      po_v_msj_error := 'No se puede realizar la accion. El numero de liquidacion ingresado se encuentra registrado.';
      return;
  END IF;

  --verificar que el numero de expediente administrativo (antiguo) no exista.
  SELECT COUNT(MDET.ID_MULTA_DETAL)
  INTO I_EXISTE
  FROM T_SCOB_MULTA_DETAL MDET
  WHERE MDET.ID_MULTA_DETAL <> PI_N_ID_MULTA_DETAL
  AND MDET.NRO_EXPED_ANTIGUO_ID = V_ID_NRO_EXPED_NIVEL_ID;
  IF I_EXISTE > 0 THEN
      po_n_retorno := -11;
      po_n_cod_error := po_n_retorno;
      po_v_msj_error := 'No se puede realizar la accion. El numero de expediente administrativo se encuentra registrado.';
      return;
  END IF;

  --inserta los datos de antidumping
  UPDATE T_SCOB_MULTA_ANTIDUMPING
  SET
    NRO_OFICIO_SUNAT_CODIGO = PI_V_NRO_OFICIO_SUNAT_CODIGO,
    NRO_OFICIO_SUNAT_ANIO = PI_V_NRO_OFICIO_SUNAT_ANIO,
    NRO_OFICIO_SUNAT_PREFIJO = PI_V_NRO_OFICIO_SUNAT_PREFIJO,
    NRO_OFICIO_SUNAT_CORRELATIVO = PI_V_NRO_OFICIO_SUNAT_SEC,
    NRO_LIQUIDACION_CODIGO = PI_V_NRO_LIQUIDACION_CODIGO,
    NRO_LIQUIDACION_ANIO = PI_V_NRO_LIQUIDACION_ANIO,
    NRO_LIQUIDACION_CORRELATIVO = PI_V_NRO_LIQUIDACION_SEC,
    NRO_DUA_CODIGO = PI_V_NRO_DUA_CODIGO,
    NRO_DUA_ANIO = PI_V_NRO_DUA_ANIO,
    NRO_DUA_CORRELATIVO = PI_V_NRO_DUA_SEC,
    TIPO_CAMBIO = PI_N_TIPO_CAMBIO,
    MONTO_ANTIDUMPING = PI_N_MONTO_ANTIDUMPING,
    MONTO_TOTAL = PI_N_MONTO_ANTIDUMPING,
    ID_INTENDENCIA = PI_N_ID_INTENDENCIA,
    ID_PARTIDA = PI_N_ID_PARTIDA,
    AUDFECMODIFICACION = SYSDATE,
    AUDUSUMODIFICACION = PI_V_AUDUSUMODIFICACION
  WHERE
    ID_MULTA_ANTIDUMPING = PI_N_ID_MULTA_ANTIDUMPING;

  --actualizar el nivel de la multa
  UPDATE T_SCOB_MULTA_DETAL
  SET
    FEC_NOTIFICACION_RESOLUCION = TO_DATE(PI_V_FECHA_NOTIF,'DD/MM/YYYY'),
    MONTO_UIT = NVL(PI_N_TIPO_CAMBIO,1) * PI_N_MONTO_ANTIDUMPING,

    /*
    NRO_EXP_NIVEL = V_NRO_EXP_NIVEL,
    NRO_EXPED_ANTIGUO = PI_V_EXP_ANTIG_NRO,
    ANIO_EXPED_ANTIGUO = PI_C_EXP_ANTIG_ANIO,
    ID_TIPO_EXPED_ANTIGUO = PI_N_EXP_ANTIG_ID_TIPO_EXPED,
    COD_TIPO_EXPED_ANTIGUO = PI_V_EXP_ANTIG_COD_TIPO_EXPED,
    DES_TIPO_EXPED_ANTIGUO = PI_V_EXP_ANTIG_DES_TIPO_EXPED,
    ID_SIGLA = PI_N_EXP_ANTIG_ID_SIGLA,
    COD_SIGLA = PI_V_EXP_ANTIG_COD_SIGLA,
    DES_SIGLA = PI_V_EXP_ANTIG_DES_SIGLA,
    */

    NRO_RESOLUCION = V_NRO_RESOL,
    NRO_RESOLUCION_SEC = PI_V_RESOL_NRO,
    ANIO_RESOLUCION = PI_C_RESOL_ANIO,
    ID_SIGLA_RESOLUCION = PI_N_RESOL_ID_SIGLA,
    COD_SIGLA_RESOLUCION = PI_V_RESOL_COD_SIGLA,
    DES_SIGLA_RESOLUCION = PI_V_RESOL_DES_SIGLA,
    NRO_EXPED_ANTIGUO_ID = V_ID_NRO_EXPED_NIVEL_ID,
    NRO_RESOLUCION_ID = V_ID_NRO_RESOLUCION_ID,

    ID_USUARIO_SECRETARIO = PI_N_ID_USUARIO_SECRETARIO,
    AUDFECMODIFICACION = SYSDATE,
    AUDUSUMODIFICACION = PI_V_AUDUSUMODIFICACION
  WHERE
    ID_MULTA_DETAL = PI_N_ID_MULTA_DETAL;

  --actualizacion de montos
  N_MONTO :=  TRUNC(NVL(PI_N_TIPO_CAMBIO,1) * PI_N_MONTO_ANTIDUMPING,SCOB_PK_CONSTANTES.C_NRO_DECIMAL_TRUNC);
  UPDATE T_SCOB_MULTA MULT
  SET
    ID_SEDE = PI_N_ID_SEDE,
    MONTO_UIT = N_MONTO,
    MONTO_TOTAL_DEUDA = N_MONTO,
    SALDO = N_MONTO,
    SALDO_TOTAL_DEUDA = N_MONTO,
    AUDFECMODIFICACION = SYSDATE,
    AUDUSUMODIFICACION = PI_V_AUDUSUMODIFICACION
  WHERE MULT.ID_MULTA = PI_N_ID_MULTA;

  --insertar logs de estados
  --SE ACTUALIZA LA FECHA DEL ESTADO MULTA ANTIDUMPING CON LA FECHA DE NOTIFICACION DE RESOLUCION 27.09.2011
  SCOB_SP_I_MULTA_ESTADO(PI_N_ID_MULTA, PI_N_ID_MULTA_DETAL, PI_I_ESTADO_MULTA, 0, PI_V_FECHA_NOTIF ,PI_V_AUDUSUMODIFICACION, PI_N_ID_USUARIO_INGRESO, 0, N_ID_MULTA_ESTADO, PO_N_COD_ERROR,  PO_V_MSJ_ERROR);
  --@0001:INI
  if PO_N_COD_ERROR < 0 then
     rollback;
     return;
  end if;
  --@0001:FIN


  po_n_cod_error := 0;
  po_n_retorno := PI_N_ID_MULTA;
  po_n_retorno_det := PI_N_ID_MULTA_DETAL;
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
---

procedure SCOB_SP_U_DOCS_UCI_AEC
  /*
    -----------------------------------------------------------
    -- Autor        : JPHR
    -- Creado       : 17.02.2017
    -- Proposito    : Agrega las fechas que llegan Documentos UCI a AEC.
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   :
    -- Proposito    :
    -----------------------------------------------------------
    */
(
  PI_V_NRO_DOCS_UCI        IN VARCHAR2,
  PI_V_ANIO                IN VARCHAR2,
  po_n_retorno             out number,
  po_n_cod_error           out number,
  po_v_msj_error           out varchar2
)
is
begin
  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

    /*UPDATE T_SCOB_MULTA_DOCUMENTO_GEN
    SET
           FEC_NOTI_UCI_AEC = TO_CHAR(SYSDATE,'DD/MM/YYYY')
    WHERE INSTR(PI_V_NRO_DOCS_UCI, '|' || TO_CHAR(COD_GENERADOR_DOCUMENTO) || '|') > 0 AND SUBSTR(NRO_DOCUMENTO,8,2) = PI_V_ANIO;

    UPDATE T_SCOB_EXPEDIENTE_DOCUMENTO
    SET
           FEC_NOTI_UCI_AEC = TO_CHAR(SYSDATE,'DD/MM/YYYY')
    WHERE INSTR(PI_V_NRO_DOCS_UCI, '|' || TO_CHAR(NU_NRO_NOTIFICACION) || '|') > 0 AND SUBSTR(NRO_DOCUMENTO,8,2) = PI_V_ANIO;*/

    po_n_cod_error := 0;
    po_n_retorno := 0;
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
---
procedure SCOB_SP_ELIMINAR_CUM
  /*
    -----------------------------------------------------------
    -- Autor        : JPHR
    -- Creado       : 17.02.2017
    -- Proposito    : Agrega las fechas que llegan Documentos UCI a AEC.
    -----------------------------------------------------------
    -- Modificacion :
    -- Autor        :
    -- Modificado   : 
    -- Proposito    : 
    -----------------------------------------------------------
    */
(
  PI_V_ID_MULTA         IN VARCHAR2,
  PI_V_AUDUSUCREACION   IN VARCHAR2,
  po_n_retorno          out number,
  po_n_cod_error        out number,
  po_v_msj_error        out varchar2
)
is

begin
  po_v_msj_error :='';
  po_n_retorno := 1;
  po_n_cod_error := -1;
  ---
  --- 01. Anula el registro de la multa
  UPDATE USR_SICOB.T_SCOB_MULTA
     SET AUDUSUMODIFICACION = PI_V_AUDUSUCREACION,
         AUDFECMODIFICACION = SYSDATE,
         ESTADO = '0'
   WHERE INSTR(PI_V_ID_MULTA, '|' || TO_CHAR(ID_MULTA) || '|') > 0;
  --- 02. Anula el registro de la multa
  --- elimina t_scob_sancionado_direc
  UPDATE USR_SICOB.T_SCOB_MULTA_SANCIONADO_DIREC
     SET AUDUSUMODIFICACION = PI_V_AUDUSUCREACION,
         AUDFECMODIFICACION = SYSDATE,
         ESTADO = '0'
   WHERE ID_MULTA_SANCIONADO IN
         (SELECT ID_MULTA_SANCIONADO
            FROM USR_SICOB.T_SCOB_MULTA_SANCIONADO
           WHERE ID_MULTA_DETAL IN
                 (SELECT ID_MULTA_DETAL
                    FROM USR_SICOB.T_SCOB_MULTA_DETAL
                   WHERE INSTR(PI_V_ID_MULTA, '|' || TO_CHAR(ID_MULTA) || '|') > 0)
             AND ESTADO = '1'
             AND ESTADO = '1');
  --- 03. Anula en t_scob_sancionado_direc
  --- elimina t_scob_sancionado
  UPDATE USR_SICOB.T_SCOB_MULTA_SANCIONADO
     SET AUDUSUMODIFICACION = PI_V_AUDUSUCREACION,
         AUDFECMODIFICACION = SYSDATE,
         ESTADO = '0',
         FLG_PRINCIPAL = '0'
   WHERE ID_MULTA_DETAL IN
         (SELECT ID_MULTA_DETAL
            FROM USR_SICOB.T_SCOB_MULTA_DETAL
           WHERE INSTR(PI_V_ID_MULTA, '|' || TO_CHAR(ID_MULTA) || '|') > 0)
     AND ESTADO = '1';
  --- 04. Anula t_scob_sancionado
  -- elimina t_scob_denunciante
  UPDATE USR_SICOB.T_SCOB_MULTA_DENUNCIANTE
     SET AUDUSUMODIFICACION = PI_V_AUDUSUCREACION,
         AUDFECMODIFICACION = SYSDATE,
         ESTADO = '0'
   WHERE ID_MULTA_DETAL IN
         (SELECT ID_MULTA_DETAL
            FROM USR_SICOB.T_SCOB_MULTA_DETAL
           WHERE INSTR(PI_V_ID_MULTA, '|' || TO_CHAR(ID_MULTA) || '|') > 0)
     AND ESTADO = '1';
  --- 04. Anula t_scob_denunciante
  --- elimina t_scob_multa_check
  UPDATE USR_SICOB.T_SCOB_MULTA_CHECK
     SET AUDUSUMODIFICACION = PI_V_AUDUSUCREACION,
         AUDFECMODIFICACION = SYSDATE,
         ESTADO = '0'
   WHERE ID_MULTA_DETAL IN
         (SELECT ID_MULTA_DETAL
            FROM USR_SICOB.T_SCOB_MULTA_DETAL
           WHERE INSTR(PI_V_ID_MULTA, '|' || TO_CHAR(ID_MULTA) || '|') > 0)
     AND ESTADO = '1';
  --- 05. Anula t_scob_multa_check
  --- elimina t_scob_multa_documento
  UPDATE USR_SICOB.T_SCOB_MULTA_DOCUMENTO
     SET AUDUSUMODIFICACION = PI_V_AUDUSUCREACION,
         AUDFECMODIFICACION = SYSDATE,
         ESTADO = '0'
   WHERE INSTR(PI_V_ID_MULTA, '|' || TO_CHAR(ID_MULTA) || '|') > 0
     AND ESTADO = '1';
  --- 06. Anula t_scob_multa_documento
  --- elimina t_scob_multa_estado
  UPDATE USR_SICOB.T_SCOB_MULTA_ESTADO
     SET AUDUSUMODIFICACION = PI_V_AUDUSUCREACION,
         AUDFECMODIFICACION = SYSDATE,
         ESTADO = '0'
   WHERE INSTR(PI_V_ID_MULTA, '|' || TO_CHAR(ID_MULTA) || '|') > 0
     AND ESTADO = '1';
  --- 07. Anula t_scob_multa_estado
  --- elimina t_scob_multa_detal
  UPDATE USR_SICOB.T_SCOB_MULTA_DETAL
     SET AUDUSUMODIFICACION = PI_V_AUDUSUCREACION,
         AUDFECMODIFICACION = SYSDATE,
         ESTADO = '0'
   WHERE INSTR(PI_V_ID_MULTA, '|' || TO_CHAR(ID_MULTA) || '|') > 0;
  ---
  DBMS_OUTPUT.put_line('SCOB_SP_ELIMINAR_CUM>>PI_V_ID_MULTA>>' || PI_V_ID_MULTA);
         
  
  po_n_cod_error := 0;
  --po_n_retorno := 0;
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

end SCOB_SP_ELIMINAR_CUM;
--
procedure SCOB_SP_REVERSION_CUM
  /*
    -----------------------------------------------------------
    -- Autor        : dcelis
    -- Creado       : 17.02.2017
    -- Proposito    : Revierte al anterior estado de la multa
    -----------------------------------------------------------
    */
(
  PI_N_ID_SOLIC_ELIM    IN NUMBER,
  V_NU_ID_MULTA         IN NUMBER,
  PI_V_AUDUSUCREACION   IN VARCHAR2,
  po_n_retorno          out number,
  po_n_cod_error        out number,
  po_v_msj_error        out varchar2
) is
  -- VARIABLES
  V_NU_COD_ESTADO_ULTIMO    NUMBER;
  V_NU_ID_ESTADO_ULTIMO     NUMBER;
  V_NU_COD_ESTADO_PENULTIMO NUMBER;
  V_NU_ID_ESTADO_PENULTIMO  NUMBER;

  V_DT_FEC_CREACION     DATE;
  V_NU_ID_MULTA_DETAL   NUMBER := -1;
  V_NU_ROW_AFECTADAS    NUMBER := 0;
  --
  V_ESTADO_INICIO VARCHAR2(150);
  V_ESTADO_FIN VARCHAR2(150);
  --
begin
  po_v_msj_error :='';
  po_n_retorno := 1;
  po_n_cod_error := -1;
  -- OBTENEMOS EL ID DEL DETALLE DE LA MULTA
  SELECT T.ID_MULTA_DETAL
  INTO V_NU_ID_MULTA_DETAL
  FROM USR_SICOB.T_SCOB_MULTA_DETAL T
  WHERE T.ESTADO = '1'
  AND T.FLG_ACTUAL='1'
  AND T.ID_MULTA = V_NU_ID_MULTA;
  --
  IF V_NU_ID_MULTA_DETAL > -1 THEN
    -- OBTENEMOS EL ULTIMO ESTADO DE LA MULTA
    SELECT MAX(T.ID_MULTA_ESTADO) AS ID_MULTA_ESTADO_ULTIMO
    INTO V_NU_ID_ESTADO_ULTIMO
    FROM USR_SICOB.T_SCOB_MULTA_ESTADO T
    WHERE T.ID_MULTA = V_NU_ID_MULTA
    AND T.ESTADO = '1' AND T.ESTADO_MULTA<>0;
    -- OBTENEMOS EL CODIGO DEL ULTIMO ESTADO DE LA MULTA
    SELECT X.ESTADO_MULTA AS ESTADO_ULTIMO
    INTO V_NU_COD_ESTADO_ULTIMO
    FROM USR_SICOB.T_SCOB_MULTA_ESTADO X
    WHERE X.ID_MULTA = V_NU_ID_MULTA
    AND X.ESTADO = '1'
    AND X.ID_MULTA_ESTADO = V_NU_ID_ESTADO_ULTIMO;
    -- OBTENEMOS EL ID DEL PENULTIMO ESTADO DE LA MULTA
    SELECT MAX(T.ID_MULTA_ESTADO) AS ID_MULTA_ESTADO_PENULTIMO
    INTO V_NU_ID_ESTADO_PENULTIMO
    FROM USR_SICOB.T_SCOB_MULTA_ESTADO T
    WHERE T.ID_MULTA = V_NU_ID_MULTA
    AND T.ESTADO = '1'
    AND T.ID_MULTA_ESTADO <> V_NU_ID_ESTADO_ULTIMO
    AND T.ESTADO_MULTA<>0;
    -- OBTENEMOS EL PENULTIMO ESTADO Y LA FECHA DE CREACION
    SELECT X.ESTADO_MULTA AS ESTADO_PENULTIMO, X.AUDFECCREACION
    INTO V_NU_COD_ESTADO_PENULTIMO, V_DT_FEC_CREACION
    FROM USR_SICOB.T_SCOB_MULTA_ESTADO X
    WHERE X.ID_MULTA = V_NU_ID_MULTA
    AND X.ESTADO = '1'
    AND X.ID_MULTA_ESTADO = V_NU_ID_ESTADO_PENULTIMO;
    --
    -- 1: INACTIVA EL ULTIMO ESTADO REGISTRADO
    UPDATE USR_SICOB.T_SCOB_MULTA_ESTADO MEST
    SET MEST.ESTADO = '0'
    WHERE MEST.ID_MULTA = V_NU_ID_MULTA
    AND MEST.ID_MULTA_ESTADO = V_NU_ID_ESTADO_ULTIMO;
    --2: ACTUALIZA AL ESTADO ANTERIOR DE LA INSTANCIA.
    UPDATE USR_SICOB.T_SCOB_MULTA_DETAL MDET
       SET MDET.ESTADO_MULTA                 = V_NU_COD_ESTADO_PENULTIMO,
           MDET.FEC_ESTADO_MULTA             = TRUNC(V_DT_FEC_CREACION),
           MDET.FEC_DECLARACION              = NULL,
           MDET.FEC_NOTIFICACION_DECLARACION = NULL,
           MDET.NRO_RESOLUCION_DECLARACION   = NULL,
           MDET.FEC_ESTADO_SGTE_INSTANCIA    = NULL
     WHERE MDET.ID_MULTA_DETAL = V_NU_ID_MULTA_DETAL;
    --3: ACTUALIZA AL ESTADO ANTERIOR DE LA INSTANCIA EN LOS DATOS DE LA MULTA
    UPDATE USR_SICOB.T_SCOB_MULTA MULT
       SET MULT.ESTADO_MULTA     = V_NU_COD_ESTADO_PENULTIMO,
           MULT.FEC_ESTADO_MULTA = TRUNC(V_DT_FEC_CREACION),
           MULT.FEC_APELACION    = NULL
     WHERE MULT.ID_MULTA = V_NU_ID_MULTA;
    -- OBTENEMOS LA DESCRIPCION DEL ULTIMO ESTADO DELA MULTA
    SELECT TXT_DESCRIPCION INTO V_ESTADO_INICIO FROM T_SCOB_TABLA_DET WHERE ID_TABLA=5 AND COD_INTERNO=V_NU_COD_ESTADO_ULTIMO;
    -- OBTENEMOS LA DESCRIPCION DEL NUEVO ESTADO DELA MULTA
    SELECT TXT_DESCRIPCION INTO V_ESTADO_FIN FROM T_SCOB_TABLA_DET WHERE ID_TABLA=5 AND COD_INTERNO=V_NU_COD_ESTADO_PENULTIMO;
    --4: INSERTAR REGISTRO DE REVERSION DE ESTADO
    INSERT INTO
    T_SCOB_MULTA_ESTADO(
      ID_MULTA_ESTADO,
      ID_MULTA,
      ID_MULTA_DETAL,
      ESTADO_MULTA,
      ESTADO,
      AUDFECCREACION,
      AUDUSUCREACION,
      FEC_ESTADO_MULTA,
      VC_DESCRIPCION
    ) VALUES(
      SCOB_SQ_MULTA_ESTADO.NEXTVAL,
      V_NU_ID_MULTA,
      (SELECT ID_MULTA_DETAL FROM T_SCOB_MULTA_DETAL WHERE ID_MULTA=V_NU_ID_MULTA AND FLG_ACTUAL='1'),
      0,
      '1',
      SYSDATE,
      PI_V_AUDUSUCREACION,
      SYSDATE,
      'REVERSION DE LA MULTA DE ['||V_ESTADO_INICIO||'] A ['||V_ESTADO_FIN||']'
    );
    --
    UPDATE T_SCOB_SOLIC_ELIM
    SET
      ID_ESTADO_INICIO=V_NU_COD_ESTADO_ULTIMO,
      ID_ESTADO_FIN=V_NU_COD_ESTADO_PENULTIMO
    WHERE ID_SOLIC_ELIM=PI_N_ID_SOLIC_ELIM;
    --
  END IF;
  --
  po_n_cod_error := 0;
  --po_n_retorno := 0;
  commit;
  --
  exception
  when others then
      po_n_retorno := -1;
      po_n_cod_error := sqlcode;
      select case when po_n_cod_error > 0 then po_n_cod_error * -1 else po_n_cod_error end
      into po_n_cod_error
      from dual;
      po_v_msj_error := substr(sqlerrm,1,250);
      rollback;

end SCOB_SP_REVERSION_CUM;
--
PROCEDURE SCOB_S_SOLIC_ELIM_REVER_MULTA
  /*
    -----------------------------------------------------------
    -- Autor        : @dcelis
    -- Creado       : 30.05.2017
    -- Proposito    : Listar solicitudes enviadas por usuario y OR
    -----------------------------------------------------------
  */
(
  PI_OP IN VARCHAR2,
  PI_CUM IN VARCHAR2,
  PI_NU_ESTADO_SOLIC IN VARCHAR2,
  PI_NU_TIPO_SOLIC IN VARCHAR2,
  PI_NU_FINICIO IN VARCHAR2,
  PI_NU_FFIN IN VARCHAR2,
  PI_ID_USUARIO IN VARCHAR2,
  PO_N_RETORNO OUT NUMBER,
  PO_N_COD_ERROR OUT NUMBER,
  PO_V_MSJ_ERROR OUT VARCHAR2,
  PO_CU_RETORNO OUT CU_REC_SET
) AS
  -- VARIABLES
  V_QUERY CLOB;
  --
BEGIN
  --
  PO_V_MSJ_ERROR := '';
  PO_N_RETORNO   := 0;
  PO_N_COD_ERROR := -1;
  --
  V_QUERY:='SELECT
    A.ID_SOLIC_ELIM,
    SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES('||SCOB_PK_CONSTANTES.C_TBL_TIPO_SOLIC_ELIM_REV||',A.NU_TIPO_SOLIC) AS V_TIPO_SOLIC,
    (B.ANIO||B.CUM) AS V_CUM,
    TO_CHAR(A.DT_FSOLICITUD,''DD/MM/YYYY - hh12:mi:ss AM'') AS V_FSOLICITUD,
    UPPER(C.USUARIO) AS V_USUARIO_SOLIC,
    DECODE(A.NU_ESTADO_SOLIC, 0, ''RECHAZADO'', 1, ''SOLICITADO'', 2, ''APROBADO'') AS V_ESTADO_SOLIC,
    A.NU_ESTADO_SOLIC,
    TO_CHAR(A.DT_FRESPUESTA,''DD/MM/YYYY - hh12:mi:ss AM'') AS V_FRESPUESTA,
    UPPER(E.USUARIO) AS V_USUARIO_RPTA
  FROM T_SCOB_SOLIC_ELIM A
  INNER JOIN T_SCOB_MULTA B ON A.ID_MULTA = B.ID_MULTA
  INNER JOIN T_SCOB_USUARIO C ON A.ID_USUARIO_SOLIC = C.ID_USUARIO
  INNER JOIN T_SCOB_MULTA_DETAL D ON B.ID_MULTA=D.ID_MULTA AND D.FLG_ACTUAL=''1''
  LEFT JOIN T_SCOB_USUARIO E ON A.ID_USUARIO_RPTA = E.ID_USUARIO
  WHERE NU_ESTADO=1';
  -- AND A.ID_USUARIO_SOLIC = '||PI_ID_USUARIO;
  IF PI_OP='1' THEN
    V_QUERY:=V_QUERY||' AND A.ID_USUARIO_SOLIC = '||PI_ID_USUARIO;
  ELSIF PI_OP='2' THEN
    V_QUERY:=V_QUERY||' AND D.ID_ORGANO_RESOLUTIVO IN (SELECT ID_ORGANO_RESOLUTIVO FROM T_SCOB_USUARIO_OR WHERE ID_USUARIO='||PI_ID_USUARIO||' AND ESTADO=1)';
  END IF;
  -- NRO. CUM
  IF PI_CUM IS NOT NULL THEN
    V_QUERY:=V_QUERY||' AND (B.ANIO||B.CUM)='''||PI_CUM||'''';
  END IF;
  -- ESTADO DE SOLICITUD
  IF PI_NU_ESTADO_SOLIC <> '-1' THEN
    V_QUERY:=V_QUERY||' AND A.NU_ESTADO_SOLIC='||PI_NU_ESTADO_SOLIC;
  END IF;
  -- TIPO DE SOLICITUD
  IF PI_NU_TIPO_SOLIC <> '-1' THEN
    V_QUERY:=V_QUERY||' AND A.NU_TIPO_SOLIC='||PI_NU_TIPO_SOLIC;
  END IF;
  -- FECHA DE INICIO Y FIN
  IF PI_NU_FINICIO IS NOT NULL AND PI_NU_FFIN IS NOT NULL THEN
    V_QUERY:=V_QUERY||' AND TO_DATE(TO_CHAR(TRUNC(A.DT_FSOLICITUD),''DD/MM/YYYY''),''DD/MM/YYYY'') BETWEEN TO_DATE('''||PI_NU_FINICIO||''',''DD/MM/YYYY'') AND TO_DATE('''||PI_NU_FFIN||''',''DD/MM/YYYY'')';
  END IF;
  --
  V_QUERY:=V_QUERY||' ORDER BY A.ID_SOLIC_ELIM ASC';
  --INSERT INTO T_TEST(OTHER) VALUES(V_QUERY);
  DBMS_OUTPUT.PUT_LINE('V_QUERY: '||V_QUERY);
  OPEN PO_CU_RETORNO FOR V_QUERY;
  --
  PO_N_COD_ERROR := 0;
  PO_N_RETORNO   := 1;
  --
  EXCEPTION
  WHEN OTHERS THEN
    PO_N_RETORNO   := -1;
    PO_N_COD_ERROR := sqlcode;
    SELECT CASE
             WHEN PO_N_COD_ERROR > 0 THEN
              PO_N_COD_ERROR * -1
             ELSE
              PO_N_COD_ERROR
           END
      INTO PO_N_COD_ERROR
      FROM dual;
    PO_V_MSJ_ERROR := SUBSTR(SQLERRM, 1, 250);
    ROLLBACK;
  --
END SCOB_S_SOLIC_ELIM_REVER_MULTA;
--
PROCEDURE SCOB_I_SOLIC_ELIM_REVER_MULTA
  /*
    -----------------------------------------------------------
    -- Autor        : @dcelis
    -- Creado       : 30.05.2017
    -- Proposito    : Listar solicitudes enviadas por usuario y OR
    -----------------------------------------------------------
  */
(
  PI_V_CUM IN VARCHAR2,
  PI_V_TIPO_SOLIC IN VARCHAR2,
  PI_ID_USUARIO IN VARCHAR2,
  PO_N_RETORNO OUT NUMBER,
  PO_N_COD_ERROR OUT NUMBER,
  PO_V_MSJ_ERROR OUT VARCHAR2
) AS
  --
  TYPE tb1 IS TABLE OF INTEGER INDEX BY VARCHAR2(50);
  V1 tb1;
  V2 tb1;
  V_CONT NUMBER;
  --
BEGIN
  --
  PO_V_MSJ_ERROR := '';
  PO_N_RETORNO   := 0;
  PO_N_COD_ERROR := -1;
  -- ARRAY: PI_V_CUM
  V_CONT:=1;
  FOR item in (
    SELECT * FROM TABLE(SCOB_PK_ACUMULACION.SCOB_FN_SPLIT(REPLACE(SUBSTR(PI_V_CUM,2,LENGTH(PI_V_CUM)-2),'|',','),','))
  )
  LOOP
    V1(V_CONT) := item.COLUMN_VALUE;
    V_CONT:=V_CONT+1;
  END LOOP;
  -- ARRAY: PI_V_TIPO_SOLIC
  V_CONT:=1;
  FOR item in (
    SELECT * FROM TABLE(SCOB_PK_ACUMULACION.SCOB_FN_SPLIT(REPLACE(SUBSTR(PI_V_TIPO_SOLIC,2,LENGTH(PI_V_TIPO_SOLIC)-2),'|',','),','))
  )
  LOOP
    V2(V_CONT) := item.COLUMN_VALUE;
    V_CONT:=V_CONT+1;
  END LOOP;
  -- RECORRIENDO LOS ARRAY PARA INSERTAR
  FOR i IN V1.FIRST..V1.LAST
  LOOP
    DBMS_OUTPUT.PUT_LINE('PI_V_CUM: '||V1(i));
    DBMS_OUTPUT.PUT_LINE('PI_V_TIPO_SOLIC: '||V2(i));
    INSERT
    INTO T_SCOB_SOLIC_ELIM
      (
        ID_SOLIC_ELIM,
        ID_MULTA,
        ID_USUARIO_SOLIC,
        NU_TIPO_SOLIC
      )
      VALUES
      (
        SCOB_SQ_SOLIC_ELIM.NEXTVAL,
        V1(i),
        PI_ID_USUARIO,
        V2(i)
      );
  END LOOP;
  --
  PO_N_COD_ERROR := 0;
  PO_N_RETORNO   := 1;
  COMMIT;
  --
  EXCEPTION
  WHEN OTHERS THEN
    PO_N_RETORNO   := -1;
    PO_N_COD_ERROR := sqlcode;
    SELECT CASE
             WHEN PO_N_COD_ERROR > 0 THEN
              PO_N_COD_ERROR * -1
             ELSE
              PO_N_COD_ERROR
           END
      INTO PO_N_COD_ERROR
      FROM dual;
    PO_V_MSJ_ERROR := SUBSTR(SQLERRM, 1, 250);
    ROLLBACK;
    --
END SCOB_I_SOLIC_ELIM_REVER_MULTA;
--
PROCEDURE SCOB_U_SOLIC_ELIM_REVER_MULTA
  /*
    -----------------------------------------------------------
    -- Autor        : @dcelis
    -- Creado       : 30.05.2017
    -- Proposito    : Procesar las solicitudes de Eliminación/Reversión
    -- MODIFICADO   : 2023-02-19
    -- MOTIVO       : Procesos en linea
    -----------------------------------------------------------
  */
(
  PI_V_ID_SOLIC IN VARCHAR2,
  PI_NU_ESTADO_SOLIC IN VARCHAR2,
  PI_VC_COMENTARIO IN VARCHAR2,
  PI_ID_USUARIO IN VARCHAR2,
  PO_N_RETORNO OUT NUMBER,
  PO_N_COD_ERROR OUT NUMBER,
  PO_V_MSJ_ERROR OUT VARCHAR2
) AS
  --
  TYPE tb1 IS TABLE OF INTEGER INDEX BY VARCHAR2(50);
  V1 tb1;
  V_CONT NUMBER;
  V_NU_TIPO_SOLIC NUMBER;
  V_ID_MULTA VARCHAR2(20);
  V_USUARIO T_SCOB_USUARIO.USUARIO%TYPE;
  PO_V_ID_MULTA VARCHAR2(150);
  V_CUM VARCHAR2(150);
  --
BEGIN
  --
  PO_V_MSJ_ERROR := '';
  PO_N_RETORNO   := 1;
  PO_N_COD_ERROR := -1;
  -- ARRAY: PI_V_ID_SOLIC
  V_CONT:=1;
  FOR item in (
    SELECT * FROM TABLE(SCOB_PK_ACUMULACION.SCOB_FN_SPLIT(REPLACE(SUBSTR(PI_V_ID_SOLIC,2,LENGTH(PI_V_ID_SOLIC)-2),'|',','),','))
  )
  LOOP
    V1(V_CONT) := item.COLUMN_VALUE;
    V_CONT:=V_CONT+1;
  END LOOP;
  -- OBTENEMOS EL ALIAS DEL USUARIO
  SELECT USUARIO INTO V_USUARIO FROM T_SCOB_USUARIO WHERE ID_USUARIO=PI_ID_USUARIO;

  IF PI_NU_ESTADO_SOLIC=2 THEN
    -- VALIDAMOS LOS CUMS A PROCESAR
    FOR i IN V1.FIRST..V1.LAST
    LOOP
      -- OBTENEMOS EL TIPO DE SOLICITUD Y EL ID DE LA MULTA
      SELECT NU_TIPO_SOLIC, ID_MULTA INTO V_NU_TIPO_SOLIC,V_ID_MULTA FROM T_SCOB_SOLIC_ELIM WHERE ID_SOLIC_ELIM=V1(i);
      --
      SELECT ANIO||CUM INTO V_CUM FROM T_SCOB_MULTA WHERE ID_MULTA=V_ID_MULTA;
      --
      DBMS_OUTPUT.PUT_LINE('***1***');
      SCOB_PK_MULTAS.SCOB_S_VALID_MULTA(
        2, -- PROCESAR
        V_CUM,
        V_NU_TIPO_SOLIC,
        PI_ID_USUARIO,
        PO_N_RETORNO,
        PO_N_COD_ERROR,
        PO_V_MSJ_ERROR,
        PO_V_ID_MULTA
      );
      DBMS_OUTPUT.PUT_LINE('***2***');
      --
    END LOOP;
    --
    IF PO_N_RETORNO=1 THEN
      -- RECORRIENDO LOS ARRAY PARA INSERTAR
      FOR i IN V1.FIRST..V1.LAST
      LOOP
        DBMS_OUTPUT.PUT_LINE('PI_V_ID_SOLIC: '||V1(i));
        -- OBTENEMOS EL TIPO DE SOLICITUD Y EL ID DE LA MULTA
        SELECT NU_TIPO_SOLIC, ID_MULTA INTO V_NU_TIPO_SOLIC,V_ID_MULTA FROM T_SCOB_SOLIC_ELIM WHERE ID_SOLIC_ELIM=V1(i);
        DBMS_OUTPUT.PUT_LINE('SCOB_U_SOLIC_ELIM_REVER_MULTA>>V_ID_MULTA>>' || V_ID_MULTA);
        -- PROCESAMOS DE ACUERDO AL TIPO DE SOLICITUD
        IF V_NU_TIPO_SOLIC='1' THEN -- ELIMINAR
          DBMS_OUTPUT.PUT_LINE('***ELIMINAR***');
          DBMS_OUTPUT.put_line('ANTES PO_N_RETORNO>>' || PO_N_RETORNO);
          IF PO_N_RETORNO=1 THEN
            SCOB_PK_MULTAS.SCOB_SP_ELIMINAR_CUM('|'||V_ID_MULTA||'|',V_USUARIO,PO_N_RETORNO,PO_N_COD_ERROR,PO_V_MSJ_ERROR);
          END IF;
        ELSIF V_NU_TIPO_SOLIC='2' THEN -- REVERTIR
          DBMS_OUTPUT.PUT_LINE('***REVERTIR***');
          IF PO_N_RETORNO=1 THEN
            SCOB_PK_MULTAS.SCOB_SP_REVERSION_CUM(V1(i),V_ID_MULTA,V_USUARIO,PO_N_RETORNO,PO_N_COD_ERROR,PO_V_MSJ_ERROR);
          END IF;
        END IF;
        
         --INICIO VICTOR BENDEZU - MIGRACION SICOB A SIA
          USR_SIA_INTFZ.PKG_INTFZ_REG_MULTA_SICOB_SIA.SP_D_MULTA_SICOB_A_SIA(PIN_NU_ID_MULTA => V_ID_MULTA,
                                                                             POUT_NU_COD_RESULT => po_n_cod_error,
                                                                             POUT_VC_MSG_RESULT => po_v_msj_error);
          DBMS_OUTPUT.put_line('SCOB_U_SOLIC_ELIM_REVER_MULTA1>>po_n_cod_error>>' || po_n_cod_error);
          IF po_n_cod_error < 0 THEN
             ROLLBACK;
             RETURN;
          END IF;
          USR_SICOB.PKG_RECAUDACION_BANCOS.SP_DO_GRABAR_BN(PIN_NU_ID_MULTA => V_ID_MULTA,
                                     POUT_NU_COD_RESULT => po_n_cod_error,
                                     POUT_VC_MSG_RESULT => po_v_msj_error);
          DBMS_OUTPUT.put_line('SCOB_U_SOLIC_ELIM_REVER_MULTA2>>po_n_retorno>>' || po_n_cod_error);
          IF po_n_cod_error < 0 THEN
             ROLLBACK;
             RETURN;
          END IF;
          USR_SICOB.PKG_RECAUDACION_BANCOS.SP_DO_GRABAR_ASBANC(PIN_NU_ID_MULTA => V_ID_MULTA,
                                           POUT_NU_COD_RESULT => po_n_cod_error,
                                           POUT_VC_MSG_RESULT => po_v_msj_error);
          DBMS_OUTPUT.put_line('SCOB_U_SOLIC_ELIM_REVER_MULTA3>>po_n_retorno3>>' || po_n_cod_error);
          IF po_n_cod_error < 0 THEN
             ROLLBACK;
             RETURN;
          END IF;    
          --FIN VICTOR BENDEZU - MIGRACION SICOB A SIA
          
        --
        DBMS_OUTPUT.PUT_LINE('PO_N_RETORNO: '||PO_N_RETORNO);
        DBMS_OUTPUT.PUT_LINE('PO_N_COD_ERROR: '||PO_N_COD_ERROR);
        DBMS_OUTPUT.PUT_LINE('PO_V_MSJ_ERROR: '||PO_V_MSJ_ERROR);
        -- ACTUALIZAMOS LOS DATOS DE LA SOLICITUD
        IF PO_N_RETORNO=1 THEN
          UPDATE T_SCOB_SOLIC_ELIM
          SET
            NU_ESTADO_SOLIC=PI_NU_ESTADO_SOLIC,
            DT_FRESPUESTA=SYSDATE,
            ID_USUARIO_RPTA=PI_ID_USUARIO,
            VC_COMENTARIO=PI_VC_COMENTARIO
          WHERE ID_SOLIC_ELIM=V1(i);
        END IF;
      --
      END LOOP;
    END IF;
    --
  ELSIF PI_NU_ESTADO_SOLIC=0 THEN
    FOR i IN V1.FIRST..V1.LAST
    LOOP
      DBMS_OUTPUT.PUT_LINE('PI_V_ID_SOLIC: '||V1(i));
      -- OBTENEMOS EL TIPO DE SOLICITUD Y EL ID DE LA MULTA
      SELECT NU_TIPO_SOLIC, ID_MULTA INTO V_NU_TIPO_SOLIC,V_ID_MULTA FROM T_SCOB_SOLIC_ELIM WHERE ID_SOLIC_ELIM=V1(i);
      --
      UPDATE T_SCOB_SOLIC_ELIM
      SET
        NU_ESTADO_SOLIC=PI_NU_ESTADO_SOLIC,
        DT_FRESPUESTA=SYSDATE,
        ID_USUARIO_RPTA=PI_ID_USUARIO,
        VC_COMENTARIO=PI_VC_COMENTARIO
      WHERE ID_SOLIC_ELIM=V1(i);
      --
    END LOOP;

  END IF;
  --


  --
  PO_N_COD_ERROR := 0;
  --PO_N_RETORNO   := 1;
  --COMMIT;
  --
  EXCEPTION
  WHEN OTHERS THEN
    PO_N_RETORNO   := -1;
    PO_N_COD_ERROR := sqlcode;
    SELECT CASE
             WHEN PO_N_COD_ERROR > 0 THEN
              PO_N_COD_ERROR * -1
             ELSE
              PO_N_COD_ERROR
           END
      INTO PO_N_COD_ERROR
      FROM dual;
    PO_V_MSJ_ERROR := SUBSTR(SQLERRM, 1, 250);
    ROLLBACK;
    --
END SCOB_U_SOLIC_ELIM_REVER_MULTA;
--
PROCEDURE SCOB_S_VALID_MULTA
  /*
    -----------------------------------------------------------
    -- Autor        : @dcelis
    -- Creado       : 30.05.2017
    -- Proposito    : Validación de eliminación o Reversión de la multa
    -----------------------------------------------------------
  */
(
  PI_OP IN NUMBER, -- TIPO DE VALIDACION: 1-SOLICITUD / 2-PROCESAR
  PI_CUM IN VARCHAR2,
  PI_ID_TIPO_SOLIC IN VARCHAR2,
  PI_ID_USUARIO IN VARCHAR2,
  PO_N_RETORNO OUT NUMBER,
  PO_N_COD_ERROR OUT NUMBER,
  PO_V_MSJ_ERROR OUT VARCHAR2,
  PO_V_ID_MULTA OUT VARCHAR2
) AS
  V_RPTA CLOB;
  V_ID_MULTA NUMBER;
  V_NRO_FILE CLOB;
  V_CANT NUMBER;

  V_TIPO_INSTANCIA NUMBER;
  V_TIPO_INSTANCIA_ACTUAL NUMBER;
  V_ID_MULTA_DETAL NUMBER;
  V_CANT_ELIM NUMBER;
  V_CANT_REVE NUMBER;
  V_DESC_ESTADO VARCHAR2(150);
  V_CANT_USR_OR NUMBER;
  V_CANT_EST_PAGO NUMBER;
  V_CANT_INST NUMBER;
  V_CANT_ESTADO NUMBER;
  V_CANT_SOLIC_PEND NUMBER;
  V_TIPO_SOLIC VARCHAR2(150);
BEGIN
  --
  V_RPTA:='';
  PO_N_RETORNO:=1;
  -- OBTENEMOS LA CANTIDAD DE MULTAS CON ESTADO ACTIVO EXISTEN
  SELECT COUNT(1) INTO V_CANT FROM T_SCOB_MULTA WHERE (ANIO||CUM)=PI_CUM AND ESTADO=SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO;
  DBMS_OUTPUT.PUT_LINE('***1***');
  -- COMPROBAMOS SI LA MULTA EXISTE Y ESTE ACTIVA
  IF V_CANT > 0 THEN
    -- OBTENEMOS EL ID DE LA MULTA
    SELECT ID_MULTA INTO V_ID_MULTA FROM T_SCOB_MULTA WHERE (ANIO||CUM)=PI_CUM;
    DBMS_OUTPUT.PUT_LINE('***2***');
    -- OBTENEMOS EL LA INTANCIA EN LA QUE SE CREÓ LA MULTA
    SELECT A.ID_MULTA_DETAL,B.TIPO_INSTANCIA INTO V_ID_MULTA_DETAL, V_TIPO_INSTANCIA
    FROM T_SCOB_MULTA_DETAL A
    INNER JOIN T_SCOB_ORGANO_RESOLUTIVO B ON A.ID_ORGANO_RESOLUTIVO=B.ID_ORGANO_RESOLUTIVO
    WHERE A.ID_MULTA=V_ID_MULTA
    AND ROWNUM=1
    ORDER BY 1 ASC;
    DBMS_OUTPUT.PUT_LINE('***3***');
    -- OBTENEMOS LA INSTANCIA ACTUAL DE LA MULTA
    SELECT COUNT(1) INTO V_CANT_INST
    FROM T_SCOB_MULTA_DETAL A
    INNER JOIN T_SCOB_ORGANO_RESOLUTIVO B
    ON A.ID_ORGANO_RESOLUTIVO=B.ID_ORGANO_RESOLUTIVO
    WHERE A.ID_MULTA = V_ID_MULTA
    AND A.ESTADO=1;
    DBMS_OUTPUT.PUT_LINE('***4***');
    /*SELECT B.TIPO_INSTANCIA INTO V_TIPO_INSTANCIA_ACTUAL
    FROM T_SCOB_MULTA_DETAL A
    INNER JOIN T_SCOB_ORGANO_RESOLUTIVO B ON A.ID_ORGANO_RESOLUTIVO=B.ID_ORGANO_RESOLUTIVO
    WHERE A.ID_MULTA=V_ID_MULTA
    AND A.FLG_ACTUAL='1';*/
    -- OBTENEMOS LA DESCRIPCION DEL ESTADO ACTUAL DE LA MULTA
    SELECT B.TXT_DESCRIPCION INTO V_DESC_ESTADO
    FROM T_SCOB_MULTA A
    INNER JOIN T_SCOB_TABLA_DET B ON A.ESTADO_MULTA=B.COD_INTERNO AND B.ID_TABLA=SCOB_PK_CONSTANTES.C_TBL_ESTADO_MULTA AND B.ESTADO=1
    WHERE A.ID_MULTA=V_ID_MULTA;
    DBMS_OUTPUT.PUT_LINE('***5***');
    -- ********************************************************************************
    IF PI_OP=1 THEN
      -- **VALIDACION 000: YA EXISTE UNA SOLICITUD PENDIENTE
      SELECT COUNT(1) INTO V_CANT_SOLIC_PEND FROM T_SCOB_SOLIC_ELIM WHERE ID_MULTA=V_ID_MULTA AND NU_ESTADO=1 AND NU_ESTADO_SOLIC=1;
      DBMS_OUTPUT.PUT_LINE('***6***');
      IF V_CANT_SOLIC_PEND > 0 THEN
        SELECT
        SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_TIPO_SOLIC_ELIM_REV,NU_TIPO_SOLIC)
        INTO V_TIPO_SOLIC
        FROM T_SCOB_SOLIC_ELIM
        WHERE ID_MULTA=V_ID_MULTA AND NU_ESTADO=1 AND NU_ESTADO_SOLIC=1;
        PO_N_RETORNO:=0;
        V_RPTA:=V_RPTA||'>>YA EXISTE UNA SOLICITUD DE ['||V_TIPO_SOLIC||'] PENDIENTE PARA ESTE CUM ';
      END IF;
    END IF;
    -- **VALIDACION 001: VERIFICAR QUE LA MULTA NOT TENGA FILE
    SELECT NRO_FILE_AEC INTO V_NRO_FILE FROM T_SCOB_MULTA WHERE ID_MULTA=V_ID_MULTA;
    IF V_NRO_FILE IS NOT NULL THEN
      PO_N_RETORNO:=0;
      V_RPTA:=V_RPTA||'>>NO SE PUEDE ELIMINAR/REVERTIR UN CUM QUE TENGA NRO. DE FILE ';
    END IF;

    IF PO_N_RETORNO=1 THEN
      -- **VALIDACION 002: VERIFICAR QUE EL CUM NO TENGA PAGO(TOTAL O PARCIAL)
      SELECT COUNT(1) INTO V_CANT_EST_PAGO FROM T_SCOB_MULTA WHERE ID_MULTA=V_ID_MULTA AND COD_ESTADO_PAGO IN (SCOB_PK_CONSTANTES.C_EST_PAGO_PARCIAL,SCOB_PK_CONSTANTES.C_EST_PAGO_TOTAL);
      IF V_CANT_EST_PAGO > 0 THEN
        PO_N_RETORNO:=0;
        V_RPTA:=V_RPTA||'>>NO SE PUEDE ELIMINAR/REVERTIR UN CUM QUE TENGA PAGO TOTAL O PARCIAL ';
      END IF;
      -- **VALIDACION 003: VERIFICAR QUE EL CUM PERTENEZCA A LA OR DEL USUARIO QUE SOLICITA
      SELECT COUNT(1) INTO V_CANT_USR_OR
      FROM T_SCOB_MULTA_DETAL WHERE ID_MULTA=V_ID_MULTA AND FLG_ACTUAL ='1'
      AND ID_ORGANO_RESOLUTIVO IN (
        SELECT ID_ORGANO_RESOLUTIVO
        FROM T_SCOB_USUARIO_OR
        WHERE ID_USUARIO=PI_ID_USUARIO
        AND ESTADO = 1
      );
      IF V_CANT_USR_OR = 0 THEN
        PO_N_RETORNO:=0;
        V_RPTA:=V_RPTA||'>>EL OR AL QUE PERTENECE EL USUARIO SOLICITANTE NO PUEDE SOLICITAR LA ELIMINACIÓN/REVERSIÓN DE LA MULTA ';
      END IF;

      -- ********************************************************************************

      IF PI_ID_TIPO_SOLIC=1 THEN -- SOLIC. ELIMINACION
        -- **VALIDACION 004: VERIFICAR QUE EL CUM ESTÉ EN PRIMERA INSTANCIA (SUMARISIMO, ORDINARIO)
        IF V_CANT_INST > 1 THEN -- QUE NO SEA PRIMERA INSTANCIA
          PO_N_RETORNO:=0;
          V_RPTA:=V_RPTA||'>>NO SE PUEDE ELIMINAR/REVERTIR UN CUM QUE NO ESTÉ EN PRIMERA INSTANCIA ';
        END IF;
        --
        IF V_CANT_INST = 1 THEN -- SOLO PRIMERA INSTANCIA
          -- **VALIDACION 005: VERIFICAR QUE EL ESTADO ACTUAL DEL CUM ESTÉ PERMITIDOS PARA ELIMINAR
          SELECT COUNT(1) INTO V_CANT_ELIM
          FROM T_SCOB_MULTA A
          INNER JOIN T_SCOB_TABLA_DET B ON A.ESTADO_MULTA=B.COD_INTERNO AND B.ID_TABLA=SCOB_PK_CONSTANTES.C_TBL_ESTADO_MULTA AND B.ESTADO=1
          WHERE
          A.ID_MULTA=V_ID_MULTA
          AND A.ESTADO_MULTA IN (SCOB_PK_CONSTANTES.C_EST_MULT_IMPUESTA,SCOB_PK_CONSTANTES.C_EST_MULT_EN_PLAZO_APELACION,SCOB_PK_CONSTANTES.C_EST_MULT_FUERA_PLAZO_APE);
          IF V_CANT_ELIM = 0 THEN
            PO_N_RETORNO:=0;
            V_RPTA:=V_RPTA||'>>NO SE PUEDE ELIMINAR UN CUM QUE ESTÉ EN ESTADO ['||V_DESC_ESTADO||'] ';
          END IF;
        END IF;
      ELSIF PI_ID_TIPO_SOLIC=2 THEN -- SOLIC. REVERSION
        -- **VALIDACION 006: VERIFICAR QUE EL CUM TENGA MÁS DE UN ESTADO
        SELECT COUNT(1) INTO V_CANT_ESTADO FROM T_SCOB_MULTA_ESTADO WHERE ID_MULTA=V_ID_MULTA AND ESTADO=1 AND ESTADO_MULTA<>0;
        IF V_CANT_ESTADO = 1 THEN
          PO_N_RETORNO:=0;
          V_RPTA:=V_RPTA||'>>LA MULTA YA SE ENCUENTRA EN EL ÚLTIMO ESTADO ';
        END IF;
        IF V_CANT_ESTADO = 0 THEN
          PO_N_RETORNO:=0;
          V_RPTA:=V_RPTA||'>>LA MULTA NO TIENE NINGÚN ESTADO PARA REVERTIR ';
        END IF;
      END IF;
    END IF;
  ELSE
    PO_N_RETORNO:=0;
    V_RPTA:=V_RPTA||'>>EL CUM INGRESADO NO EXISTE';
  END IF;
  PO_V_MSJ_ERROR:=V_RPTA;
  PO_V_ID_MULTA:=V_ID_MULTA;
  --
  EXCEPTION
  WHEN OTHERS THEN
    PO_N_RETORNO   := -1;
    PO_N_COD_ERROR := sqlcode;
    SELECT CASE
             WHEN PO_N_COD_ERROR > 0 THEN
              PO_N_COD_ERROR * -1
             ELSE
              PO_N_COD_ERROR
           END
      INTO PO_N_COD_ERROR
      FROM dual;
    PO_V_MSJ_ERROR := SUBSTR(SQLERRM, 1, 250);
    ROLLBACK;
    --
END SCOB_S_VALID_MULTA;
--
FUNCTION SCOB_FN_HAS_ADJ_ANOT(
  PI_N_ID_EXPEDIENTE IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
  OP IN NUMBER
) RETURN VARCHAR2 IS
  --
  V_RPTA VARCHAR2(1);
  V_CANT NUMBER;
  --
BEGIN
  --
  V_RPTA:='0';

  IF OP=1 THEN -- OPCION DE BUSQUEDA POR EXPEDIENTE
    -- TIENE DOCUMENTOS ADJUNTOS
    SELECT COUNT(1) INTO V_CANT
    FROM T_SCOB_MULTA_DOCUMENTO A
    INNER JOIN T_SCOB_EXPEDIENTE_MULTA B ON A.ID_MULTA=B.ID_MULTA
    WHERE B.ID_EXPEDIENTE=PI_N_ID_EXPEDIENTE AND A.ESTADO=1;
    IF V_CANT>0 THEN
      V_RPTA:='1';
    END IF;
    -- TIENE ANOTACIONES
    SELECT COUNT(1) INTO V_CANT
    FROM T_SCOB_MULTA_ANOTACION A
    INNER JOIN T_SCOB_EXPEDIENTE_MULTA B ON A.ID_MULTA=B.ID_MULTA
    WHERE B.ID_EXPEDIENTE=PI_N_ID_EXPEDIENTE AND A.ESTADO=1;
    IF V_CANT>0 THEN
      V_RPTA:='1';
    END IF;
  ELSIF OP=2 THEN -- OPCION DE BUSQUEDA POR MULTA
    -- TIENE DOCUMENTOS ADJUNTOS
    SELECT COUNT(1) INTO V_CANT
    FROM T_SCOB_MULTA_DOCUMENTO A
    WHERE A.ID_MULTA=PI_N_ID_EXPEDIENTE AND A.ESTADO=1;
    IF V_CANT>0 THEN
      V_RPTA:='1';
    END IF;
    -- TIENE ANOTACIONES
    SELECT COUNT(1) INTO V_CANT
    FROM T_SCOB_MULTA_ANOTACION A
    WHERE A.ID_MULTA=PI_N_ID_EXPEDIENTE AND A.ESTADO=1;
    IF V_CANT>0 THEN
      V_RPTA:='1';
    END IF;
  END IF;
  --
  RETURN TRIM(V_RPTA);
  --
END SCOB_FN_HAS_ADJ_ANOT;
--
procedure SCOB_SP_S_MULTA_BY_CUM
/*
-----------------------------------------------------------
-- Autor        : HCHALCO
-- Creado       : 26.06.2021
-- Proposito    : Consulta las multas por CUM
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  po_cu_retorno            out cu_rec_set,
  PI_VC_CUM                 IN T_SCOB_MULTA.CUM%TYPE
)
AS
V_NU_ID_MULTA NUMBER;
V_VC_CUM VARCHAR2(20);
begin
  
  open  po_cu_retorno for
  SELECT SM.anio||SM.cum AS CUM, SM.ID_MULTA INTO V_VC_CUM, V_NU_ID_MULTA
  FROM USR_SICOB.T_SCOB_MULTA_DETAL T 
  INNER JOIN USR_SICOB.T_SCOB_MULTA SM
  ON SM.ID_MULTA = T.ID_MULTA AND SM.ESTADO = 1
  WHERE T.FEC_NOTIFICACION_RESOLUCION IS NULL
   AND T.ESTADO_MULTA NOT IN (1,17,5,6,15)
   AND T.ESTADO =  1
   AND SM.anio||SM.cum = PI_VC_CUM
   AND 1=(SELECT COUNT(T.ID_MULTA_DETAL)
   FROM USR_SICOB.T_SCOB_MULTA_DETAL T
  WHERE ESTADO = 1
    AND ID_MULTA = SM.ID_MULTA)
  ORDER BY T.ESTADO_MULTA DESC;
end;
--
/*
-----------------------------------------------------------
-- Autor        : HCHALCO
-- Creado       : 26.06.2021
-- Proposito    : Consulta las multas por CUM
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
PROCEDURE SCOB_SP_U_RESOLVER_PROB_FECH(PI_D_FEC_RESOLUCION       IN VARCHAR2,
                                       PI_D_FEC_NOTIFI_RESOLUCION    IN VARCHAR2,
                                       PI_D_FEC_INICIO_RANGO    IN VARCHAR2,
                                       PI_D_FEC_FIN_RANGO    IN VARCHAR2,
                                       PI_D_FEC_INI_CONCEN    IN VARCHAR2,
                                       PI_V_ID_DETA_MULTA       IN VARCHAR2,
                                       PI_V_ID_MULTA       IN VARCHAR2,
                                       PI_V_ID_ESTADO_MULTA       IN VARCHAR2,
                                       PI_V_CUM       IN VARCHAR2,
                                       PO_V_RETORNO  OUT VARCHAR2
                                           ) IS
        V_NU_EXISTE_CI INT;
        V_NU_MONTO_PAGAR NUMBER(18,6);
        V_NU_ID_COMPROBANTE_INGRESO NUMBER;
        
        V_NU_CI_MONTO NUMBER(18,6);
        V_NU_CI_MONTO_CG NUMBER(18,6);
        V_NU_SALDO_TOTAL NUMBER(18,6);
        V_NU_ID_EXPEDIENTE NUMBER;
    BEGIN
        --Actualizar la tabla multa detalle
        UPDATE USR_SICOB.T_SCOB_MULTA_DETAL T
        SET FEC_NOTIFICACION_RESOLUCION = TO_DATE(PI_D_FEC_NOTIFI_RESOLUCION, 'DD/MM/YYYY'),
            FEC_INI_PLAZO = TO_DATE(PI_D_FEC_INICIO_RANGO, 'DD/MM/YYYY'),
            FEC_FIN_PLAZO = TO_DATE(PI_D_FEC_FIN_RANGO, 'DD/MM/YYYY'),
            FEC_ESTADO_INSTANCIA = TO_DATE(PI_D_FEC_INI_CONCEN, 'DD/MM/YYYY'),
            FEC_RESOLUCION = TO_DATE(PI_D_FEC_RESOLUCION, 'DD/MM/YYYY')
        WHERE T.ID_MULTA_DETAL = PI_V_ID_DETA_MULTA AND T.ID_MULTA = PI_V_ID_MULTA AND T.Estado = 1;
        
        --Actualizar la tabla estado fechas multa
        IF PI_V_ID_ESTADO_MULTA = '2' THEN
          BEGIN
            UPDATE USR_SICOB.T_SCOB_MULTA_ESTADO ME
            SET ME.FEC_ESTADO_MULTA = TO_DATE(PI_D_FEC_INICIO_RANGO, 'DD/MM/YYYY')
            WHERE ME.ESTADO = 1 AND ME.ID_MULTA_ESTADO=2 
            AND ME.ID_MULTA_DETAL = PI_V_ID_DETA_MULTA
            AND ME.ID_MULTA = PI_V_ID_MULTA;
            
            IF PI_V_ID_ESTADO_MULTA = '2' THEN
                UPDATE USR_SICOB.T_SCOB_MULTA MU
                SET MU.FEC_ESTADO_MULTA = TO_DATE(PI_D_FEC_INICIO_RANGO, 'DD/MM/YYYY')
                WHERE MU.estado=1 AND MU.ID_MULTA = PI_V_ID_MULTA;
            END IF;
          END;
        ELSIF PI_V_ID_ESTADO_MULTA = '14' OR PI_V_ID_ESTADO_MULTA = '3' OR PI_V_ID_ESTADO_MULTA = '4' THEN
          BEGIN
            UPDATE USR_SICOB.T_SCOB_MULTA_ESTADO ME
            SET ME.FEC_ESTADO_MULTA = TO_DATE(PI_D_FEC_INICIO_RANGO, 'DD/MM/YYYY')
            WHERE ME.ESTADO = 1 AND ME.ESTADO_MULTA = 2
            AND ME.ID_MULTA_DETAL = PI_V_ID_DETA_MULTA
            AND ME.ID_MULTA = PI_V_ID_MULTA;
            
            UPDATE USR_SICOB.T_SCOB_MULTA_ESTADO ME
            SET ME.FEC_ESTADO_MULTA = TO_DATE(PI_D_FEC_INI_CONCEN, 'DD/MM/YYYY')
            WHERE ME.ESTADO = 1 AND ME.ESTADO_MULTA = 14
            AND ME.ID_MULTA_DETAL = PI_V_ID_DETA_MULTA
            AND ME.ID_MULTA = PI_V_ID_MULTA;
            
            IF PI_V_ID_ESTADO_MULTA = '14' THEN
              UPDATE USR_SICOB.T_SCOB_MULTA MU
              SET MU.FEC_ESTADO_MULTA = TO_DATE(PI_D_FEC_FIN_RANGO, 'DD/MM/YYYY')
              WHERE MU.estado=1 AND MU.ID_MULTA = PI_V_ID_MULTA;
            END IF;
          END;
        END IF;
        
        --====ACTUALIZACION DE MONTOS========
        SELECT COUNT(CI.ID_MULTA) INTO V_NU_EXISTE_CI
          FROM USR_SICOB.T_SCOB_COMPROBANTE_INGRESO CI 
          WHERE CI.Id_Multa=PI_V_ID_MULTA AND estado=1;
          
        IF V_NU_EXISTE_CI >0 THEN
          BEGIN
              -- Obteniendo el comprobante de ingreso entre las fechas de rango de plazo
              -- Para poder actualizar más abajo
              BEGIN      
                SELECT MAX(CI.ID_COMPROBANTE_INGRESO) INTO V_NU_ID_COMPROBANTE_INGRESO
                FROM USR_SICOB.T_SCOB_COMPROBANTE_INGRESO CI
                WHERE CI.Id_Multa=PI_V_ID_MULTA
                AND estado=1
                AND CI.FEC_GENERACION_CI>= TO_DATE(PI_D_FEC_INICIO_RANGO, 'DD/MM/YYYY')
                AND CI.FEC_GENERACION_CI<=TO_DATE(PI_D_FEC_FIN_RANGO,'DD/MM/YYYY');
              EXCEPTION
                WHEN NO_DATA_FOUND THEN
                     V_NU_ID_COMPROBANTE_INGRESO:=0;
              END;
              
              IF V_NU_ID_COMPROBANTE_INGRESO>0 THEN
                BEGIN
                    --Sumamos los montos para luego actualizar
                    SELECT SUM(CI.MONTO) INTO V_NU_CI_MONTO 
                    FROM USR_SICOB.T_SCOB_COMPROBANTE_INGRESO CI 
                    WHERE CI.Id_Multa = PI_V_ID_MULTA AND estado = 1;
                    
                    SELECT SUM(CI.MONTO_CG) INTO V_NU_CI_MONTO_CG 
                    FROM USR_SICOB.T_SCOB_COMPROBANTE_INGRESO CI 
                    WHERE CI.Id_Multa = PI_V_ID_MULTA AND estado = 1;
                    
                    --Actualizamos los montos haciendo operaciones correspondientes
                    UPDATE USR_SICOB.T_SCOB_MULTA MU
                    SET TOTAL_AMORTIZADO = V_NU_CI_MONTO,
                    TOTAL_AMORTIZADO_COSTAS = V_NU_CI_MONTO_CG,
                    TOTAL_AMORTIZACION_DEUDA = (V_NU_CI_MONTO+V_NU_CI_MONTO_CG),
                    SALDO = MU.MONTO_UIT*(0.75)-V_NU_CI_MONTO,
                    SALDO_COSTAS = (MU.MONTO_COSTAS-V_NU_CI_MONTO_CG),
                    SALDO_TOTAL_DEUDA =(MU.MONTO_TOTAL_DEUDA - (V_NU_CI_MONTO+V_NU_CI_MONTO_CG))
                    WHERE MU.Id_Multa = PI_V_ID_MULTA AND ESTADO = 1;
                    

                    --Verificamos si el saldo fue pagado totalmente
                    SELECT MU.SALDO_TOTAL_DEUDA INTO  V_NU_SALDO_TOTAL
                    FROM USR_SICOB.T_SCOB_MULTA MU
                    WHERE MU.ID_MULTA = PI_V_ID_MULTA AND ESTADO = 1;
                                        
                    IF V_NU_SALDO_TOTAL = 0 THEN
                      BEGIN
                        --Si ya fue pagado, actualizamos tablas correspondientes
                         UPDATE USR_SICOB.T_SCOB_MULTA 
                         SET COD_ESTADO_PAGO = 4, 
                         IND_DESCUENTO=1, 
                         MONTO_PORCENTAJE_DSCTO= (monto_uit*0.25)
                         WHERE ID_MULTA = PI_V_ID_MULTA AND estado = 1;

                         UPDATE USR_SICOB.T_SCOB_COMPROBANTE_INGRESO 
                         SET COD_ESTADO_PAGO=4, DESC_TIPO_PAGO='DESCUENTO' 
                         WHERE ID_COMPROBANTE_INGRESO = V_NU_ID_COMPROBANTE_INGRESO
                         AND ESTADO=1;
                         
                         --Actualizamos el expediente amarrado a la multa
                         V_NU_EXISTE_CI:=0;
                         --Validamos que sólo exista un registro de expediente para una multa
                         SELECT COUNT(EXMU.ID_EXPEDIENTE) INTO V_NU_EXISTE_CI
                         FROM USR_SICOB.T_SCOB_EXPEDIENTE_MULTA  EXMU
                         WHERE EXMU.ID_MULTA = PI_V_ID_MULTA AND EXMU.ESTADO = 1;
                         
                         IF V_NU_EXISTE_CI=1 THEN
                             BEGIN
                                SELECT EXMU.ID_EXPEDIENTE INTO V_NU_ID_EXPEDIENTE
                                FROM USR_SICOB.T_SCOB_EXPEDIENTE_MULTA  EXMU
                                WHERE EXMU.ID_MULTA = PI_V_ID_MULTA AND EXMU.ESTADO = 1;
                             EXCEPTION
                                WHEN NO_DATA_FOUND THEN
                                  V_NU_ID_EXPEDIENTE:=0;
                             END;
                             IF V_NU_ID_EXPEDIENTE >0 THEN
                               UPDATE USR_SICOB.T_SCOB_EXPEDIENTE 
                               SET SALDO=0 , SALDO_IC=0, SALDO_IM=0, SALDO_COSTAS= 0, SALDO_TOTAL_DEUDA=0, COD_ESTADO_PAGO=4 
                               WHERE ID_EXPEDIENTE = V_NU_ID_EXPEDIENTE AND ESTADO=1;
                             END IF;
                         END IF;
                      END;
                    END IF;
                END;
              END IF;
              PO_V_RETORNO := 'OPERACION EXITOSA';
          END;
        ELSE
          PO_V_RETORNO := 'OPERACION EXITOSA';
        END IF;
        
        IF PO_V_RETORNO <> 'OPERACION EXITOSA' THEN
          ROLLBACK;
        END IF;
        
    EXCEPTION
      WHEN OTHERS THEN
          ROLLBACK;
          RAISE;
    END;
--
/*
-----------------------------------------------------------
-- Autor        : JAGUILAR
-- Creado       : 05.12.2022
-- Proposito    : Consulta los montos de multa por CUM
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
PROCEDURE SCOB_SP_S_MONTO_MULTA_BY_CUM(PIN_VC_CUM       IN T_SCOB_MULTA.CUM%TYPE,
                                       POUT_CUR_RETORNO OUT CU_REC_SET) AS
BEGIN

  OPEN POUT_CUR_RETORNO FOR
  
    SELECT MU.ANIO || MU.CUM AS CUM,
           DECODE(PE.RAZON_SOCIAL,
                  NULL,
                  PE.APE_PATERNO || ' ' ||
                  DECODE(PE.APE_MATERNO, NULL, PE.APE_CASADA, PE.APE_MATERNO) || ' ' ||
                  PE.PRI_NOMBRE || ' ' || PE.SEG_NOMBRE,
                  PE.RAZON_SOCIAL) AS NOMBRE,
           DECODE(PE2.RAZON_SOCIAL,
                  NULL,
                  PE2.APE_PATERNO || ' ' ||
                  DECODE(PE2.APE_MATERNO,
                         NULL,
                         PE2.APE_CASADA,
                         PE2.APE_MATERNO) || ' ' || PE2.PRI_NOMBRE || ' ' ||
                  PE2.SEG_NOMBRE,
                  PE2.RAZON_SOCIAL) AS NOMBRE2,
           MD.VALOR_UIT,
           MD.MONTO_UIT,
           T.COD_INTERNO,
           T.TXT_DESCRIPCION,
           MU.MONTO_UIT AS MI_CAPITAL,
           MU.MONTO_INTERES AS MI_INTERES_COMP,
           MU.MONTO_INTERES_MORATORIO AS MI_INTERES_MORA,
           MU.MONTO_COSTAS AS MI_COSTAS,
           MU.MONTO_TOTAL_DEUDA AS MI_DEUDA_TOTAL,
           MU.TOTAL_AMORTIZADO AS TA_CAPITAL,
           MU.TOTAL_AMORTIZADO_IC AS TA_INTERES_COMP,
           MU.TOTAL_AMORTIZADO_IM AS TA_INTERES_MORA,
           MU.TOTAL_AMORTIZADO_COSTAS AS TA_COSTAS,
           MU.TOTAL_AMORTIZACION_DEUDA AS TA_DEUDA_TOTAL,
           MU.SALDO AS S_CAPITAL,
           MU.SALDO_IC AS S_INTERES_COMP,
           MU.SALDO_IM AS S_INTERES_MORA,
           MU.SALDO_COSTAS AS S_COSTAS,
           MU.SALDO_TOTAL_DEUDA AS S_DEUDA_TOTAL,
           EX.ANIO || EX.NRO_EXPEDIENTE AS EXPEDIENTE_COACTIVO,
           MU.ID_MULTA,
           MU.NRO_FILE_AEC,
           (SELECT SUM(CI.MONTO_EXCESO)
              FROM USR_SICOB.T_SCOB_COMPROBANTE_INGRESO CI
             WHERE CI.ID_MULTA = MU.ID_MULTA
               AND CI.ESTADO = '1'
             GROUP BY CI.ID_MULTA) AS EXCESOS,
           (MU.MONTO_UIT + MU.MONTO_INTERES + MU.MONTO_INTERES_MORATORIO +
           MU.MONTO_COSTAS) AS MI_SUBTOTAL,
           (MU.TOTAL_AMORTIZADO + MU.TOTAL_AMORTIZADO_IC +
           MU.TOTAL_AMORTIZADO_IM + MU.TOTAL_AMORTIZADO_COSTAS) AS TA_SUBTOTAL,
           (MU.SALDO + MU.SALDO_IC + MU.SALDO_IM + MU.SALDO_COSTAS) AS S_SUBTOTAL,
           TO_CHAR(MU.AUDFECMODIFICACION, 'DD/MM/YYYY HH24:MM:SS') AS FEC_MODIFICA,
           MU.AUDUSUMODIFICACION AS USU_MODIFICA
      FROM USR_SICOB.T_SCOB_MULTA MU
     INNER JOIN USR_SICOB.T_SCOB_MULTA_DETAL MD
        ON (MU.ID_MULTA = MD.ID_MULTA AND MD.FLG_ACTUAL = '1' AND
           MD.ESTADO = '1')
     INNER JOIN USR_SICOB.T_SCOB_MULTA_SANCIONADO MS
        ON (MD.ID_MULTA_DETAL = MS.ID_MULTA_DETAL AND
           MS.COD_TIPO_PERSONA = '1' AND MS.FLG_PRINCIPAL = '1' AND
           MS.ESTADO = '1')
      LEFT JOIN USR_SICOB.T_SCOB_MULTA_SANCIONADO MS2
        ON (MD.ID_MULTA_DETAL = MS2.ID_MULTA_DETAL AND
           MS2.COD_TIPO_PERSONA = '1' AND MS2.FLG_PRINCIPAL = '0' AND
           MS2.ESTADO = '1' AND FLG_TIPO_MULTA = '2' AND ROWNUM = 1)
      LEFT JOIN USR_SICOB.T_SCOB_PERSONA PE2
        ON (MS2.ID_PERSONA = PE2.ID_PERSONA)
     INNER JOIN USR_SICOB.T_SCOB_PERSONA PE
        ON (MS.ID_PERSONA = PE.ID_PERSONA)
      LEFT JOIN USR_SICOB.T_SCOB_TABLA_DET T
        ON (MU.COD_ESTADO_PAGO = T.COD_INTERNO AND T.ID_TABLA = 34)
      LEFT OUTER JOIN USR_SICOB.T_SCOB_EXPEDIENTE_MULTA EM
        ON (MU.ID_MULTA = EM.ID_MULTA)
      LEFT OUTER JOIN USR_SICOB.T_SCOB_EXPEDIENTE EX
        ON (EM.ID_EXPEDIENTE = EX.ID_EXPEDIENTE)
     WHERE MU.ANIO || MU.CUM = PIN_VC_CUM;
END;
--

/*
-----------------------------------------------------------
-- Autor        : JAGUILAR
-- Creado       : 05.12.2022
-- Proposito    : Actualizar montos de multa por ID_MULTA
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   : 2023-02-14
-- Proposito    : Procesos en linea
-----------------------------------------------------------
*/
PROCEDURE SCOB_SP_U_MULTA_BY_MONTO(PIN_VC_ID_MULTA              IN VARCHAR2,
                                   PIN_NU_MI_CAPITAL            IN NUMBER,
                                   PIN_NU_MI_INTERES_COMP       IN NUMBER,
                                   PIN_NU_MI_INTERES_MORA       IN NUMBER,
                                   PIN_NU_MI_COSTAS             IN NUMBER,
                                   PIN_NU_TA_CAPITAL            IN NUMBER,
                                   PIN_NU_TA_INTERES_COMP       IN NUMBER,
                                   PIN_NU_TA_INTERES_MORA       IN NUMBER,
                                   PIN_NU_TA_COSTAS             IN NUMBER,
                                   PIN_NU_S_CAPITAL             IN NUMBER,
                                   PIN_NU_S_INTERES_COMP        IN NUMBER,
                                   PIN_NU_S_INTERES_MORA        IN NUMBER,
                                   PIN_NU_S_COSTAS              IN NUMBER,
                                   PIN_NU_VAL_UIT               IN NUMBER,
                                   PIN_VC_NRO_FILE_AEC          IN VARCHAR2,
                                   PIN_VC_USUARIO_MOD           IN VARCHAR,
                                   POUT_NU_RETORNO               OUT NUMBER,
                                   POUT_NU_COD_ERROR             OUT NUMBER,
                                   POUT_VC_MSJ_ERROR             OUT VARCHAR2) AS
BEGIN
  
      POUT_NU_RETORNO := 0;
      POUT_NU_COD_ERROR := -1;
      POUT_VC_MSJ_ERROR :='';
      
      IF NVL(PIN_VC_NRO_FILE_AEC,' ') <> ' ' THEN
          POUT_NU_RETORNO := -1;
          POUT_NU_COD_ERROR := POUT_NU_RETORNO;
          POUT_VC_MSJ_ERROR := 'Ya se ha realizado el proceso de cobranza coactiva. No se puede modificar el registro.';
          RETURN;
      END IF;
  
      
      UPDATE USR_SICOB.T_SCOB_MULTA MU 
      SET MU.MONTO_UIT = PIN_NU_MI_CAPITAL,
          MU.MONTO_INTERES = PIN_NU_MI_INTERES_COMP,
          MU.MONTO_INTERES_MORATORIO = PIN_NU_MI_INTERES_MORA,
          MU.MONTO_COSTAS = PIN_NU_MI_COSTAS,
          MU.PORCENTAJE_DESCUENTO = PIN_NU_MI_CAPITAL * 0.75,
          MU.MONTO_TOTAL_DEUDA = PIN_NU_MI_CAPITAL + PIN_NU_MI_INTERES_COMP + PIN_NU_MI_INTERES_MORA + PIN_NU_MI_COSTAS,
          MU.TOTAL_AMORTIZADO = PIN_NU_TA_CAPITAL,
          MU.TOTAL_AMORTIZADO_IC = PIN_NU_TA_INTERES_COMP,
          MU.TOTAL_AMORTIZADO_IM = PIN_NU_TA_INTERES_MORA,
          MU.TOTAL_AMORTIZADO_COSTAS = PIN_NU_TA_COSTAS,
          MU.SALDO = PIN_NU_S_CAPITAL,
          MU.SALDO_IC = PIN_NU_S_INTERES_COMP,
          MU.SALDO_IM = PIN_NU_S_INTERES_MORA,
          MU.SALDO_COSTAS = PIN_NU_S_COSTAS,
          MU.SALDO_TOTAL_DEUDA = PIN_NU_S_CAPITAL + PIN_NU_S_INTERES_COMP + PIN_NU_S_INTERES_MORA + PIN_NU_S_COSTAS,
          MU.AUDFECMODIFICACION = SYSDATE,
          MU.AUDUSUMODIFICACION = PIN_VC_USUARIO_MOD
      WHERE MU.ID_MULTA = PIN_VC_ID_MULTA;    
            
      IF PIN_NU_VAL_UIT > 0 THEN
         
          UPDATE USR_SICOB.T_SCOB_MULTA_DETAL MD
          SET MD.MONTO_UIT = PIN_NU_MI_CAPITAL,
              MD.VALOR_UIT = PIN_NU_VAL_UIT
          WHERE MD.ID_MULTA = PIN_VC_ID_MULTA
                AND MD.FLG_ACTUAL = '1'
                AND MD.ESTADO = '1';
        ELSE 
          
          UPDATE USR_SICOB.T_SCOB_MULTA_DETAL MD
          SET MD.MONTO_UIT = PIN_NU_MI_CAPITAL
          WHERE MD.ID_MULTA = PIN_VC_ID_MULTA
                AND MD.FLG_ACTUAL = '1'
                AND MD.ESTADO = '1';
      END IF;
      
      POUT_NU_COD_ERROR := 0;
      POUT_NU_RETORNO := PIN_VC_ID_MULTA;
  
    --INICIO VICTOR BENDEZU - MIGRACION SICOB A SIA - RECAUDACION EN LINEA
    USR_SIA_INTFZ.PKG_INTFZ_REG_MULTA_SICOB_SIA.SP_U_MULTA_SICOB_A_SIA(PIN_NU_ID_MULTA => PIN_VC_ID_MULTA,
                                                                         POUT_NU_COD_RESULT => POUT_NU_RETORNO,
                                                                         POUT_VC_MSG_RESULT => POUT_VC_MSJ_ERROR);
    IF POUT_NU_RETORNO < 0 THEN
         ROLLBACK;
         RETURN;
    END IF;
        
    PKG_RECAUDACION_BANCOS.SP_DO_GRABAR_BN(PIN_NU_ID_MULTA => PIN_VC_ID_MULTA,
                                                     POUT_NU_COD_RESULT => POUT_NU_RETORNO,
                                                     POUT_VC_MSG_RESULT => POUT_VC_MSJ_ERROR);
    IF POUT_NU_RETORNO < 0 THEN
         ROLLBACK;
         RETURN;
    END IF;
                                                                             
    PKG_RECAUDACION_BANCOS.SP_DO_GRABAR_ASBANC(PIN_NU_ID_MULTA => PIN_VC_ID_MULTA,
                                                         POUT_NU_COD_RESULT => POUT_NU_RETORNO,
                                                         POUT_VC_MSG_RESULT => POUT_VC_MSJ_ERROR);                                                                     
            
    IF POUT_NU_RETORNO < 0 THEN
         ROLLBACK;
         RETURN;
    END IF;
    --FIN VICTOR BENDEZU - MIGRACION SICOB A SIA - RECAUDACION EN LINEA





      COMMIT;
      
      ----
      EXCEPTION
      WHEN OTHERS THEN
          POUT_NU_COD_ERROR := SQLCODE;
          SELECT CASE WHEN POUT_NU_COD_ERROR > 0 THEN POUT_NU_COD_ERROR * -1 ELSE POUT_NU_COD_ERROR END
          INTO POUT_NU_COD_ERROR
          FROM DUAL;
          POUT_VC_MSJ_ERROR := SUBSTR(SQLERRM,1,250) || ' - ' || TO_CHAR(POUT_NU_RETORNO);
          ROLLBACK;

END;                             
--

  -- ******************************************************************************
  -- Descripción: Procedure que actualiza el estado de pago de una multa por el ID
  --
  -- Input Parameters: PIN_ID_MULTA, PI_N_COD_ESTADO_PAGO
  --
  -- Output Parameters: PO_N_RETORNO, PO_N_COD_ERROR , PO_V_MSJ_ERROR
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
  
  PROCEDURE SCOB_SP_U_MULTA_BY_ESTADO(PIN_NU_ID_MULTA         IN NUMBER,
                                      PIN_NU_COD_ESTADO_PAGO IN NUMBER,
                                      PIN_VC_USUARIO_MOD     IN VARCHAR,
                                      POUT_NU_RETORNO         OUT NUMBER,
                                      POUT_NU_COD_ERROR       OUT NUMBER,
                                      POUT_VC_MSJ_ERROR       OUT VARCHAR2) AS
  BEGIN

    POUT_NU_RETORNO   := 0;
    POUT_NU_COD_ERROR := -1;
    POUT_VC_MSJ_ERROR := '';

    UPDATE USR_SICOB.T_SCOB_MULTA MU
       SET MU.COD_ESTADO_PAGO = PIN_NU_COD_ESTADO_PAGO,
           MU.AUDFECMODIFICACION = SYSDATE,
           MU.AUDUSUMODIFICACION = PIN_VC_USUARIO_MOD
     WHERE MU.ID_MULTA = PIN_NU_ID_MULTA;

    UPDATE USR_SICOB.T_SCOB_EXPEDIENTE EX
       SET EX.COD_ESTADO_PAGO = PIN_NU_COD_ESTADO_PAGO,
           EX.AUDFECMODIFICACION = SYSDATE,
           EX.AUDUSUMODIFICACION = PIN_VC_USUARIO_MOD
     WHERE EX.ID_EXPEDIENTE IN (SELECT ID_EXPEDIENTE
                          FROM USR_SICOB.T_SCOB_EXPEDIENTE_MULTA
                         WHERE ID_MULTA = PIN_NU_ID_MULTA
                         AND ESTADO = '1')
        AND EX.ESTADO = '1';
        
    POUT_NU_COD_ERROR := 0;
    POUT_NU_RETORNO   := PIN_NU_ID_MULTA;

    COMMIT;
    
  EXCEPTION
    WHEN OTHERS THEN
      
      POUT_NU_COD_ERROR := SQLCODE;
      SELECT CASE WHEN POUT_NU_COD_ERROR > 0 THEN POUT_NU_COD_ERROR * -1 ELSE POUT_NU_COD_ERROR END
        INTO POUT_NU_COD_ERROR
        FROM DUAL;
      POUT_VC_MSJ_ERROR := SUBSTR(SQLERRM, 1, 250) || ' - ' || TO_CHAR(POUT_NU_RETORNO);
      ROLLBACK;
    
  END;

end SCOB_PK_MULTAS;
/
