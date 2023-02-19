CREATE OR REPLACE PACKAGE "SCOB_PK_ADMINISTRADO" is

type cu_rec_set is ref cursor;
--
procedure SCOB_SP_I_T_SCOB_PERSONA
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 17.02.2011
-- Proposito    : Registra una persona
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_I_TIPO_PERSONA           IN T_SCOB_PERSONA.TIPO_PERSONA%TYPE, --(NATURAL/JURIDICA)
  PI_I_TIPO_DOC               IN T_SCOB_PERSONA.TIPO_DOC%TYPE,
  PI_V_NRO_DOC                IN T_SCOB_PERSONA.NRO_DOC%TYPE,
  PI_V_NRO_RUC                IN T_SCOB_PERSONA.NRO_RUC%TYPE,
  PI_V_NOMBRE_COMERCIAL       IN T_SCOB_PERSONA.NOMBRE_COMERCIAL%TYPE,
  PI_V_SIGLAS                 IN T_SCOB_PERSONA.SIGLAS%TYPE,
  PI_N_ID_SECTOR_ECONOMICO    IN T_SCOB_PERSONA.ID_SECTOR_ECONOMICO%TYPE,
  PI_V_APE_PATERNO            IN T_SCOB_PERSONA.APE_PATERNO%TYPE,
  PI_V_APE_MATERNO            IN T_SCOB_PERSONA.APE_MATERNO%TYPE,
  PI_V_APE_CASADA             IN T_SCOB_PERSONA.APE_CASADA%TYPE,
  PI_V_PRI_NOMBRE             IN T_SCOB_PERSONA.PRI_NOMBRE%TYPE,
  PI_V_SEG_NOMBRE             IN T_SCOB_PERSONA.SEG_NOMBRE%TYPE,
  PI_V_CIUDAD_TELEFONO       IN T_SCOB_PERSONA.CIUDAD_TELEFONO%TYPE,
  PI_V_TELEFONO               IN T_SCOB_PERSONA.TELEFONO%TYPE,
  PI_V_CIUDAD_CELULAR       IN T_SCOB_PERSONA.CIUDAD_CELULAR%TYPE,
  PI_V_CELULAR                IN T_SCOB_PERSONA.CELULAR%TYPE,
  PI_V_EMAIL                  IN T_SCOB_PERSONA.EMAIL%TYPE,
  PI_V_RAZON_SOCIAL           IN T_SCOB_PERSONA.RAZON_SOCIAL%TYPE,
  PI_V_TIP_EMPRESA            IN T_SCOB_PERSONA.TIP_EMPRESA%TYPE,
  PI_V_FAX                    IN T_SCOB_PERSONA.FAX%TYPE,
  PI_C_FLG_OFICIO             IN T_SCOB_PERSONA.FLG_OFICIO%TYPE,
  PI_C_FLG_ASOCU            IN T_SCOB_PERSONA.FLG_ASOCU%TYPE,
  PI_V_AUDUSUCREACION         IN T_SCOB_PERSONA.AUDUSUCREACION%TYPE,

  po_n_retorno               out number,
  po_n_cod_error             out number,
  po_v_msj_error             out varchar2
);

procedure SCOB_SP_U_T_SCOB_PERSONA
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 17.02.2011
-- Proposito    : Actualiza una persona
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_PERSONA            IN T_SCOB_PERSONA.ID_PERSONA%TYPE,
  PI_I_TIPO_DOC              IN T_SCOB_PERSONA.TIPO_DOC%TYPE,
  PI_V_NRO_DOC               IN T_SCOB_PERSONA.NRO_DOC%TYPE,
  PI_V_NRO_RUC               IN T_SCOB_PERSONA.NRO_RUC%TYPE,
  PI_V_NOMBRE_COMERCIAL       IN T_SCOB_PERSONA.NOMBRE_COMERCIAL%TYPE,
  PI_V_SIGLAS                 IN T_SCOB_PERSONA.SIGLAS%TYPE,
  PI_N_ID_SECTOR_ECONOMICO   IN T_SCOB_PERSONA.ID_SECTOR_ECONOMICO%TYPE,
  PI_V_APE_PATERNO           IN T_SCOB_PERSONA.APE_PATERNO%TYPE,
  PI_V_APE_MATERNO           IN T_SCOB_PERSONA.APE_MATERNO%TYPE,
  PI_V_APE_CASADA            IN T_SCOB_PERSONA.APE_CASADA%TYPE,
  PI_V_PRI_NOMBRE            IN T_SCOB_PERSONA.PRI_NOMBRE%TYPE,
  PI_V_SEG_NOMBRE            IN T_SCOB_PERSONA.SEG_NOMBRE%TYPE,
  PI_V_CIUDAD_TELEFONO       IN T_SCOB_PERSONA.CIUDAD_TELEFONO%TYPE,
  PI_V_TELEFONO              IN T_SCOB_PERSONA.TELEFONO%TYPE,
  PI_V_CIUDAD_CELULAR       IN T_SCOB_PERSONA.CIUDAD_CELULAR%TYPE,
  PI_V_CELULAR               IN T_SCOB_PERSONA.CELULAR%TYPE,
  PI_V_EMAIL                 IN T_SCOB_PERSONA.EMAIL%TYPE,
  PI_V_RAZON_SOCIAL          IN T_SCOB_PERSONA.RAZON_SOCIAL%TYPE,
  PI_V_TIP_EMPRESA           iN T_SCOB_PERSONA.TIP_EMPRESA%TYPE,
  PI_V_FAX                   IN T_SCOB_PERSONA.FAX%TYPE,
  PI_C_FLG_OFICIO            IN T_SCOB_PERSONA.FLG_OFICIO%TYPE,
  PI_C_FLG_ASOCU            IN T_SCOB_PERSONA.FLG_ASOCU%TYPE,
  PI_V_AUDUSUMODIFICACION    IN T_SCOB_PERSONA.AUDUSUMODIFICACION%TYPE,
  po_n_retorno               out number,
  po_n_cod_error             out number,
  po_v_msj_error             out varchar2
);

procedure SCOB_SP_S_T_SCOB_PERSONA
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 03.03.2011
-- Proposito    : Consulta las personas
-----------------------------------------------------------
*/
(
--  PI_I_TIPO_ADMINISTRADO   IN INTEGER, --(1=SANCIONADO/2=DENUNCIANTE/0=TODOS)
  PI_V_COD_SANCIONADO      IN T_SCOB_PERSONA.COD_SANCIONADO%TYPE,
  PI_I_TIPO_PERSONA        IN T_SCOB_PERSONA.TIPO_PERSONA%TYPE,
  PI_I_TIPO_DOC            IN T_SCOB_PERSONA.TIPO_DOC%TYPE,
  PI_V_NRO_DOC             IN T_SCOB_PERSONA.NRO_DOC%TYPE,
  PI_V_APE_PATERNO         IN T_SCOB_PERSONA.APE_PATERNO%TYPE,
  PI_V_APE_MATERNO         IN T_SCOB_PERSONA.APE_MATERNO%TYPE,
  PI_V_APE_CASADA          IN T_SCOB_PERSONA.APE_CASADA%TYPE,
  PI_V_PRI_NOMBRE          IN T_SCOB_PERSONA.PRI_NOMBRE%TYPE,
  PI_V_SEG_NOMBRE          IN T_SCOB_PERSONA.SEG_NOMBRE%TYPE,
  PI_V_TELEFONO            IN T_SCOB_PERSONA.TELEFONO%TYPE,
  PI_V_CELULAR             IN T_SCOB_PERSONA.CELULAR%TYPE,
  PI_V_EMAIL               IN T_SCOB_PERSONA.EMAIL%TYPE,
  PI_V_RAZON_SOCIAL        IN T_SCOB_PERSONA.RAZON_SOCIAL%TYPE,
  PI_C_ESTADO              IN T_SCOB_PERSONA.ESTADO%TYPE,
  PI_I_CALIFICACION        IN T_SCOB_PERSONA.CALIFICACION%TYPE,
  PI_C_FLG_OFICIO          IN T_SCOB_PERSONA.FLG_OFICIO%TYPE,
  PI_C_FEC_INI             IN CHAR,
  PI_C_FEC_FIN             IN CHAR,
  PI_V_TIP_EMPRESA         IN T_SCOB_PERSONA.TIP_EMPRESA%TYPE,
  PI_N_ID_SECTOR_ECONOMICO IN T_SCOB_PERSONA.ID_SECTOR_ECONOMICO%TYPE,
  pi_c_s_flg_buscar_by_contenido in char, --0=NO; 1=SI.
  po_cu_retorno            out cu_rec_set
);

procedure SCOB_SP_I_T_SCOB_PERSONA_DOMIC
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 01.03.2011
-- Proposito    : registra los domicilios de una persona
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_PERSONA              IN T_SCOB_PERSONA_DOMICILIO.ID_PERSONA%TYPE,
  PI_I_TIPO_DOMICILIO          IN T_SCOB_PERSONA_DOMICILIO.TIPO_DOMICILIO%TYPE,
  PI_V_ID_UBIGEO               IN T_SCOB_PERSONA_DOMICILIO.ID_UBIGEO%TYPE,

  PI_I_TIPO_VIA                IN T_SCOB_PERSONA_DOMICILIO.TIPO_VIA%TYPE,
  PI_V_NOM_VIA                 IN T_SCOB_PERSONA_DOMICILIO.NOM_VIA%TYPE,
  PI_V_NRO_VIA                 IN T_SCOB_PERSONA_DOMICILIO.NRO_VIA%TYPE,
  PI_V_NRO_INTERIOR            IN T_SCOB_PERSONA_DOMICILIO.NRO_INTERIOR%TYPE,
  PI_I_TIPO_ZONA               IN T_SCOB_PERSONA_DOMICILIO.TIPO_ZONA%TYPE,
  PI_V_NOM_ZONA                IN T_SCOB_PERSONA_DOMICILIO.NOM_ZONA%TYPE,

  PI_V_AUDUSUCREACION          IN T_SCOB_PERSONA_DOMICILIO.AUDUSUCREACION%TYPE,

  po_n_retorno                 out number,
  po_n_cod_error               out number,
  po_v_msj_error               out varchar2
);

procedure SCOB_SP_U_T_SCOB_PERSONA_DOMIC
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 01.03.2011
-- Proposito    : actualiza los domicilios de una persona
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_PERSONA_DOMICILIO    IN T_SCOB_PERSONA_DOMICILIO.ID_PERSONA_DOMICILIO%TYPE,
  PI_N_ID_PERSONA              IN T_SCOB_PERSONA.ID_PERSONA%TYPE,
  PI_I_TIPO_DOMICILIO          IN T_SCOB_PERSONA_DOMICILIO.TIPO_DOMICILIO%TYPE,

  PI_I_TIPO_VIA                IN T_SCOB_PERSONA_DOMICILIO.TIPO_VIA%TYPE,
  PI_V_NOM_VIA                 IN T_SCOB_PERSONA_DOMICILIO.NOM_VIA%TYPE,
  PI_V_NRO_VIA                 IN T_SCOB_PERSONA_DOMICILIO.NRO_VIA%TYPE,
  PI_V_NRO_INTERIOR            IN T_SCOB_PERSONA_DOMICILIO.NRO_INTERIOR%TYPE,
  PI_I_TIPO_ZONA               IN T_SCOB_PERSONA_DOMICILIO.TIPO_ZONA%TYPE,
  PI_V_NOM_ZONA                IN T_SCOB_PERSONA_DOMICILIO.NOM_ZONA%TYPE,

  PI_V_ID_UBIGEO               IN T_SCOB_PERSONA_DOMICILIO.ID_UBIGEO%TYPE,
  PI_V_AUDUSUMODIFICACION      IN T_SCOB_PERSONA_DOMICILIO.AUDUSUMODIFICACION%TYPE,

  po_n_retorno                 out number,
  po_n_cod_error               out number,
  po_v_msj_error               out varchar2
);

procedure SCOB_SP_D_T_SCOB_PERSONA_DOMIC(
    PI_V_ID_PERSONA_DOMICILIO  IN VARCHAR2,
    PI_V_AUDUSUCREACION        IN T_SCOB_PERSONA_DOMICILIO.AUDUSUCREACION%TYPE,
    po_n_retorno               out number,
    po_n_cod_error             out number,
    po_v_msj_error             out varchar2
);

procedure SCOB_SP_S_T_SCOB_PERSONA_DOMIC
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 01.03.2011
-- Proposito    : consulta las direcciones de una persona
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_PERSONA                   IN T_SCOB_PERSONA_DOMICILIO.ID_PERSONA%TYPE,
  po_cu_retorno                     out cu_rec_set
);

procedure SCOB_SP_U_T_PERSONA_CALIFICA
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 29.03.2011
-- Proposito    : Actualiza la calificacion del sancionado.
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_V_ID_PERSONA            IN VARCHAR2,
  PI_I_CALIFICACION          IN T_SCOB_PERSONA.CALIFICACION%TYPE,
  PI_V_AUDUSUMODIFICACION    IN T_SCOB_PERSONA.AUDUSUMODIFICACION%TYPE,

  po_n_retorno               out number,
  po_n_cod_error             out number,
  po_v_msj_error             out varchar2
);

procedure SCOB_SP_S_EDITA_T_SCOB_PERSONA
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 29.03.2011
-- Proposito    : Editar persona
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_PERSONA        IN T_SCOB_PERSONA.ID_PERSONA%TYPE,
  po_cu_retorno          out cu_rec_set
);

---
procedure SCOB_SP_D_T_SCOB_PERSONA(
    PI_V_ID_PERSONA      IN VARCHAR2,
    PI_V_AUDUSUCREACION  IN T_SCOB_PERSONA.AUDUSUMODIFICACION%TYPE,
    po_n_retorno         out number,
    po_n_cod_error       out number,
    po_v_msj_error       out varchar2
);

procedure SCOB_SP_I_T_SCOB_BIEN
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 25.05.2011
-- Proposito    : Registrar bienes
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_V_NRO_PARTIDA_REGISTRAL          IN T_SCOB_BIEN.NRO_PARTIDA_REGISTRAL%TYPE,
  PI_N_ID_ENTIDAD_ESTATAL             IN T_SCOB_BIEN.ID_ENTIDAD_ESTATAL%TYPE,
  PI_N_ID_MODELO                      IN T_SCOB_BIEN.ID_MODELO%TYPE,
  PI_C_FEC_INSCRIPCION                IN VARCHAR2,
  PI_V_NRO_PLACA                      IN T_SCOB_BIEN.NRO_PLACA%TYPE,
  PI_V_DIRECCION                      IN T_SCOB_BIEN.DIRECCION%TYPE,
  PI_V_DESCRIPCION                    IN T_SCOB_BIEN.DESCRIPCION%TYPE,
  PI_N_ID_USUARIO_INGRESO             IN T_SCOB_BIEN.ID_USUARIO_INGRESO%TYPE,
  PI_V_AUDUSUCREACION                 IN T_SCOB_BIEN.AUDUSUCREACION%TYPE,
  po_n_retorno                        out number,
  po_n_cod_error                      out number,
  po_v_msj_error                      out varchar2
);

procedure SCOB_SP_U_T_SCOB_BIEN
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 25.05.2011
-- Proposito    : Actualizar bienes
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_BIEN                        IN T_SCOB_BIEN.ID_BIEN%TYPE,
  PI_V_NRO_PARTIDA_REGISTRAL          IN T_SCOB_BIEN.NRO_PARTIDA_REGISTRAL%TYPE,
  PI_N_ID_ENTIDAD_ESTATAL             IN T_SCOB_BIEN.ID_ENTIDAD_ESTATAL%TYPE,
  PI_N_ID_MODELO                      IN T_SCOB_BIEN.ID_MODELO%TYPE,
  PI_V_FEC_INSCRIPCION                IN VARCHAR,
  PI_V_NRO_PLACA                      IN T_SCOB_BIEN.NRO_PLACA%TYPE,
  PI_V_DIRECCION                      IN T_SCOB_BIEN.DIRECCION%TYPE,
  PI_V_DESCRIPCION                    IN T_SCOB_BIEN.DESCRIPCION%TYPE,
  PI_V_AUDUSUMODIFICACION             IN T_SCOB_BIEN.AUDUSUMODIFICACION%TYPE,
  po_n_retorno                        out number,
  po_n_cod_error                      out number,
  po_v_msj_error                      out varchar2
);

procedure SCOB_SP_D_T_SCOB_BIEN
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 25.05.2011
-- Proposito    : Eliminar bienes
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_BIEN                        IN VARCHAR2,--T_SCOB_BIEN.ID_BIEN%TYPE,
  PI_V_AUDUSUMODIFICACION             IN T_SCOB_BIEN.AUDUSUMODIFICACION%TYPE,
  po_n_retorno                        out number,
  po_n_cod_error                      out number,
  po_v_msj_error                      out varchar2
);

procedure SCOB_SP_S_T_SCOB_BIEN
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 25.05.2011
-- Proposito    : Consulta los bienes registrados
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_BIEN                 IN T_SCOB_BIEN.ID_BIEN%TYPE,
  PI_N_ID_ENTIDAD_ESTATAL      IN T_SCOB_BIEN.ID_ENTIDAD_ESTATAL%TYPE,
  PI_V_NRO_PARTIDA_REGISTRAL   IN T_SCOB_BIEN.NRO_PARTIDA_REGISTRAL%TYPE,
  PI_V_NRO_PLACA               IN T_SCOB_BIEN.NRO_PLACA%TYPE,
  PI_N_ID_MODELO               IN T_SCOB_BIEN.ID_MODELO%TYPE,
  po_cu_retorno                out cu_rec_set
);

procedure SCOB_SP_I_ASOC_PERSONA_BIEN(
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 25.05.2011
-- Proposito    : inserta la asociacion bien persona
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
  PI_N_ID_BIEN               IN T_SCOB_BIEN.ID_BIEN%TYPE,
  PI_N_ID_SOLICITUD_TERCERIA IN T_SCOB_PERSONA_BIEN.ID_SOLICITUD_TERCERIA%TYPE,
  PI_V_ID_PERSONA            IN VARCHAR2,
  PI_N_ID_USUARIO_INGRESO    IN T_SCOB_BIEN.ID_USUARIO_INGRESO%TYPE,
  PI_V_AUDUSUCREACION        IN T_SCOB_BIEN.AUDUSUCREACION%TYPE,
  po_n_retorno               out number,
  po_n_cod_error             out number,
  po_v_msj_error             out varchar2
);

procedure SCOB_SP_D_ASOC_PERSONA_BIEN(
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 25.05.2011
-- Proposito    : eliminar la asociacion bien persona
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
  PI_N_ID_BIEN                       IN T_SCOB_BIEN.ID_BIEN%TYPE,
  PI_V_ID_PERSONA_BIEN               IN VARCHAR2,
  PI_V_AUDUSUMODIFICACION            IN T_SCOB_BIEN.AUDUSUMODIFICACION%TYPE,
  po_n_retorno                       out number,
  po_n_cod_error                     out number,
  po_v_msj_error                     out varchar2
);

procedure SCOB_SP_S_PERSONA_BY_BIEN
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 25.05.2011
-- Proposito    : Consulta las personas asociadas a un bien.
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_BIEN                 IN T_SCOB_BIEN.ID_BIEN%TYPE,
  PI_N_ID_SOLICITUD_TERCERIA   IN T_SCOB_PERSONA_BIEN.ID_SOLICITUD_TERCERIA%TYPE,
  po_cu_retorno                out cu_rec_set
);

procedure SCOB_SP_S_BIEN_BY_PERSONA
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 09.06.2011
-- Proposito    : Consulta los bienes de una persona
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_PERSONA              IN T_SCOB_PERSONA.ID_PERSONA%TYPE,
  PI_N_ID_EXPEDIENTE_EMBARGO   IN T_SCOB_EXPED_EMBARGO_INS_BIEN.ID_EXPEDIENTE_EMBARGO%TYPE,
  po_cu_retorno                out cu_rec_set
);

FUNCTION SCOB_FN_PERSONAS_BIEN(
  PI_N_ID_BIEN              IN T_SCOB_BIEN.ID_BIEN%TYPE
) RETURN  VARCHAR2;

/*
procedure SCOB_SP_I_REPRESENTANTE
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 31.05.2011
-- Proposito    : Registra a un representante
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
/*
(
  PI_I_TIPO_PERSONA          IN T_SCOB_REPRESENTANTE.TIPO_PERSONA%TYPE, --(NATURAL/JURIDICA)
  PI_I_TIPO_DOC              IN T_SCOB_REPRESENTANTE.TIPO_DOC%TYPE,
  PI_V_NRO_DOC               IN T_SCOB_REPRESENTANTE.NRO_DOC%TYPE,
  PI_V_NRO_RUC               IN T_SCOB_REPRESENTANTE.NRO_RUC%TYPE,
  PI_V_APE_PATERNO           IN T_SCOB_REPRESENTANTE.APE_PATERNO%TYPE,
  PI_V_APE_MATERNO           IN T_SCOB_REPRESENTANTE.APE_MATERNO%TYPE,
  PI_V_APE_CASADA            IN T_SCOB_REPRESENTANTE.APE_CASADA%TYPE,
  PI_V_PRI_NOMBRE            IN T_SCOB_REPRESENTANTE.PRI_NOMBRE%TYPE,
  PI_V_SEG_NOMBRE            IN T_SCOB_REPRESENTANTE.SEG_NOMBRE%TYPE,
  PI_V_TELEFONO              IN T_SCOB_REPRESENTANTE.TELEFONO%TYPE,
  PI_V_CELULAR               IN T_SCOB_REPRESENTANTE.CELULAR%TYPE,
  PI_V_EMAIL                 IN T_SCOB_REPRESENTANTE.EMAIL%TYPE,
  PI_V_AUDUSUCREACION        IN T_SCOB_REPRESENTANTE.AUDUSUCREACION%TYPE,

  po_n_retorno               out number,
  po_n_cod_error             out number,
  po_v_msj_error             out varchar2
);
*/
procedure SCOB_SP_U_MARCA_PUBLICADO(
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 20.06.2011
-- Proposito    : Permite marcar como publicado a los administrados
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
    PI_V_ID_PERSONA        IN VARCHAR2,
    PI_V_AUDUSUCREACION    IN T_SCOB_PERSONA.AUDUSUMODIFICACION%TYPE,
    po_n_retorno           out number,
    po_n_cod_error         out number,
    po_v_msj_error         out varchar2
);

procedure SCOB_SP_U_DESMARCA_PUBLICADO(
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 20.06.2011
-- Proposito    : Permite des-marcar como publicado a los administrados
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
    PI_V_ID_PERSONA       IN VARCHAR2,
    PI_V_AUDUSUCREACION   IN T_SCOB_PERSONA.AUDUSUMODIFICACION%TYPE,
    po_n_retorno          out number,
    po_n_cod_error        out number,
    po_v_msj_error        out varchar2
);

procedure SCOB_SP_I_SOLICITUD_TERCERIA
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 12.09.2011
-- Proposito    : Registrar solicitudes de terceria
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_BIEN                          IN T_SCOB_BIEN_SOLICITUD_TERCERIA.ID_BIEN%TYPE,
  PI_V_FEC_SOLICITUD                    IN VARCHAR2,
  PI_N_ID_USUARIO_INGRESO               IN T_SCOB_BIEN.ID_USUARIO_INGRESO%TYPE,
  PI_V_AUDUSUCREACION                   IN T_SCOB_BIEN.AUDUSUCREACION%TYPE,
  po_n_retorno                          out number,
  po_n_cod_error                        out number,
  po_v_msj_error                        out varchar2
);

procedure SCOB_SP_U_SOLICITUD_TERCERIA
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 12.09.2011
-- Proposito    : Actualizar solicitudes de terceria
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_SOLICITUD_TERCERIA                  IN T_SCOB_BIEN_SOLICITUD_TERCERIA.ID_SOLICITUD_TERCERIA%TYPE,
  PI_V_FEC_SOLICITUD                          IN VARCHAR2,
  PI_I_COD_ESTADO_SOLICITUD                   IN T_SCOB_BIEN_SOLICITUD_TERCERIA.COD_ESTADO_SOLICITUD%TYPE,
  PI_V_AUDUSUMODIFICACION                     IN T_SCOB_BIEN_SOLICITUD_TERCERIA.AUDUSUMODIFICACION%TYPE,

  po_n_retorno                                out number,
  po_n_cod_error                              out number,
  po_v_msj_error                              out varchar2
);

procedure SCOB_SP_D_SOLICITUD_TERCERIA
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 12.09.2011
-- Proposito    : Eliminar solicitudes de terceria
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_BIEN                                IN T_SCOB_BIEN_SOLICITUD_TERCERIA.ID_BIEN%TYPE,
  PI_V_ID_SOLICITUD_TERCERIA                  IN VARCHAR2,
  PI_V_AUDUSUMODIFICACION                     IN T_SCOB_BIEN_SOLICITUD_TERCERIA.AUDUSUMODIFICACION%TYPE,
  po_n_retorno                                out number,
  po_n_cod_error                              out number,
  po_v_msj_error                              out varchar2
);

procedure SCOB_SP_S_SOLICITUD_TERCERIA
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 12.09.2011
-- Proposito    : Consulta de solicitudes
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_BIEN                         IN T_SCOB_BIEN_SOLICITUD_TERCERIA.ID_BIEN%TYPE,
  PI_N_ID_SOLICITUD_TERCERIA           IN T_SCOB_BIEN_SOLICITUD_TERCERIA.ID_SOLICITUD_TERCERIA%TYPE,
  PI_V_SOLICITUD_FEC_INI               IN VARCHAR2,
  PI_V_SOLICITUD_FEC_FIN               IN VARCHAR2,
  po_cu_retorno                        out cu_rec_set
);

FUNCTION SCOB_FN_PERSONAS_SOLICITUD(
  PI_N_ID_SOLICITUD_TERCERIA        IN T_SCOB_PERSONA_BIEN.ID_SOLICITUD_TERCERIA%TYPE
) RETURN  VARCHAR2;

procedure SCOB_SP_S_PERS_BY_ASIG_BIEN
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 12.09.2011
-- Proposito    : Consulta las personas que seran asignadas a un bien
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_V_COD_SANCIONADO         IN T_SCOB_PERSONA.COD_SANCIONADO%TYPE,
  PI_I_TIPO_PERSONA           IN T_SCOB_PERSONA.TIPO_PERSONA%TYPE,
  PI_I_TIPO_DOC               IN T_SCOB_PERSONA.TIPO_DOC%TYPE,
  PI_V_NRO_DOC                IN T_SCOB_PERSONA.NRO_DOC%TYPE,
  PI_V_APE_PATERNO            IN T_SCOB_PERSONA.APE_PATERNO%TYPE,
  PI_V_APE_MATERNO            IN T_SCOB_PERSONA.APE_MATERNO%TYPE,
  PI_V_APE_CASADA             IN T_SCOB_PERSONA.APE_CASADA%TYPE,
  PI_V_PRI_NOMBRE             IN T_SCOB_PERSONA.PRI_NOMBRE%TYPE,
  PI_V_SEG_NOMBRE             IN T_SCOB_PERSONA.SEG_NOMBRE%TYPE,
  PI_V_TELEFONO               IN T_SCOB_PERSONA.TELEFONO%TYPE,
  PI_V_CELULAR                IN T_SCOB_PERSONA.CELULAR%TYPE,
  PI_V_EMAIL                  IN T_SCOB_PERSONA.EMAIL%TYPE,
  PI_V_RAZON_SOCIAL           IN T_SCOB_PERSONA.RAZON_SOCIAL%TYPE,
  PI_N_BIEN                   IN T_SCOB_BIEN.ID_BIEN%TYPE,
  PI_N_ID_SOLICITUD_TERCERIA  IN T_SCOB_PERSONA_BIEN.ID_SOLICITUD_TERCERIA%TYPE,
  po_cu_retorno               out cu_rec_set
);
--
procedure SCOB_SP_S_CONTACTO
/*
-----------------------------------------------------------
-- Autor        : @dcelis
-- Creado       : 15.06.2017
-- Proposito    : Consulta contacto por personas
-----------------------------------------------------------
*/
(
--  PI_I_TIPO_ADMINISTRADO   IN INTEGER, --(1=SANCIONADO/2=DENUNCIANTE/0=TODOS)
  PI_ID_PERSONA       IN T_SCOB_PERSONA.ID_PERSONA%TYPE,
  po_cu_retorno       out cu_rec_set
);
--
procedure SCOB_SP_S_BUSCAR_T_PERSONA
/*
-----------------------------------------------------------
-- Autor        : @dcelis
-- Creado       : 15.06.2017
-- Proposito    : Consulta Persona si Existe
-----------------------------------------------------------
*/
(
  PI_ID_TIPO_PERSONA    IN T_SCOB_PERSONA.TIPO_PERSONA%TYPE,
  PI_ID_TIPO_DOC        IN T_SCOB_PERSONA.TIPO_DOC%TYPE,
  PI_NRO_DOC            IN T_SCOB_PERSONA.NRO_DOC%TYPE,
  po_cu_retorno         out cu_rec_set
);
--
procedure SCOB_SP_I_CONTACTO
/*
-----------------------------------------------------------
-- Autor        : @dcelis
-- Creado       : 16.06.2017
-- Proposito    : Insertar contacto - Si existe los actualiza, sino, los crea.
-----------------------------------------------------------
*/
(
  PI_V_ID_CONTACTO    IN T_SCOB_PERSONA_CONTACTO.NU_ID_CONTACTO%TYPE,
  PI_V_ID_PERSONA     IN T_SCOB_PERSONA_CONTACTO.ID_PERSONA%TYPE,
  PI_V_NOMBRE         IN T_SCOB_PERSONA_CONTACTO.VC_NOMBRE%TYPE,
  PI_VC_TELEFONO      IN T_SCOB_PERSONA_CONTACTO.VC_TELEFONO%TYPE,
  PI_VC_EMAIL         IN T_SCOB_PERSONA_CONTACTO.VC_EMAIL%TYPE,
  PI_V_ANOTACIONES    IN T_SCOB_PERSONA_CONTACTO.VC_ANOTACIONES%TYPE,
  PI_V_ID_USUARIO     IN T_SCOB_PERSONA_CONTACTO.NU_ID_USUARIO%TYPE,
  PI_V_NU_ESTADO     IN T_SCOB_PERSONA_CONTACTO.NU_ESTADO%TYPE,
  po_n_retorno        out number,
  po_n_cod_error      out number,
  po_v_msj_error      out varchar2
);
--

  -- ******************************************************************************
  -- Descripción: Procedure que retorna la lista de sancionados actuales
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
  PROCEDURE SCOB_SP_S_SANCIONADO_ACTUAL(PI_V_COD_INDECOPI   IN T_SCOB_PERSONA.COD_SANCIONADO%TYPE,
                                        PI_I_TIPO_PERSONA   IN T_SCOB_PERSONA.TIPO_PERSONA%TYPE,
                                        PI_I_TIPO_DOC       IN T_SCOB_PERSONA.TIPO_DOC%TYPE,
                                        PI_V_NRO_DOC        IN T_SCOB_PERSONA.NRO_DOC%TYPE,
                                        PI_V_APE_PATERNO    IN T_SCOB_PERSONA.APE_PATERNO%TYPE,
                                        PI_V_APE_MATERNO    IN T_SCOB_PERSONA.APE_MATERNO%TYPE,
                                        PI_V_APE_CASADA     IN T_SCOB_PERSONA.APE_CASADA%TYPE,
                                        PI_V_PRI_NOMBRE     IN T_SCOB_PERSONA.PRI_NOMBRE%TYPE,
                                        PI_V_SEG_NOMBRE     IN T_SCOB_PERSONA.SEG_NOMBRE%TYPE,
                                        PI_V_RAZON_SOCIAL   IN T_SCOB_PERSONA.RAZON_SOCIAL%TYPE,
                                        PO_CU_RETORNO       OUT CU_REC_SET,
                                        PO_N_COD_ERROR      OUT NUMBER,
                                        PO_V_MSJ_ERROR      OUT VARCHAR2);
                                        
  -- ******************************************************************************
  -- Descripción: Procedure que retorna la lista de cums de una persona
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
  PROCEDURE SCOB_SP_S_CUMS_PERSONA(PI_I_ID_PERSONA IN T_SCOB_PERSONA.ID_PERSONA%TYPE,
                                   PO_CU_RETORNO   OUT CU_REC_SET,
                                   PO_N_COD_ERROR  OUT NUMBER,
                                   PO_V_MSJ_ERROR  OUT VARCHAR2);
                                   
  -- ******************************************************************************
  -- Descripción: Procedure que retorna la lista de administrados para el reemplazo
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
  PROCEDURE SCOB_SP_S_ADMIN_REEMPLAZO(PI_V_COD_INDECOPI   IN T_SCOB_PERSONA.COD_SANCIONADO%TYPE,                                       
                                             PI_V_RAZON_SOCIAL   IN T_SCOB_PERSONA.RAZON_SOCIAL%TYPE,
                                             PO_CU_RETORNO       OUT CU_REC_SET,
                                             PO_N_COD_ERROR      OUT NUMBER,
                                             PO_V_MSJ_ERROR      OUT VARCHAR2);

  -- ******************************************************************************
  -- Descripción: Procedure que transfiere los cums al nuevo administrado
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
  PROCEDURE SCOB_SP_U_ADMINISTRADO_CUMS(PI_N_ID_SANCIONADO_ANTIGUO IN T_SCOB_PERSONA.ID_PERSONA%TYPE,
                                        PI_N_ID_ADMINISTRADO_NUEVO IN T_SCOB_PERSONA.ID_PERSONA%TYPE,
                                        PI_V_COD_USUARIO           IN T_SCOB_PERSONA.AUDUSUMODIFICACION%TYPE,
                                        PI_V_IDS_MULTA             IN VARCHAR2,
                                        PI_V_IND_INACTIVAR         IN VARCHAR2,
                                        PO_N_COD_ERROR             OUT NUMBER,
                                        PO_V_MSJ_ERROR             OUT VARCHAR2);
                                             
end SCOB_PK_ADMINISTRADO;
/
CREATE OR REPLACE PACKAGE BODY "SCOB_PK_ADMINISTRADO" is
---

  -- Author:      Victor Bendezú
  -- Proyecto:    Incidencias SICOB
  EX_CONTROLADO EXCEPTION;
  
procedure SCOB_SP_I_T_SCOB_PERSONA
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 17.02.2011
-- Proposito    : Registra una persona
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_I_TIPO_PERSONA          IN T_SCOB_PERSONA.TIPO_PERSONA%TYPE, --(NATURAL/JURIDICA)
  PI_I_TIPO_DOC              IN T_SCOB_PERSONA.TIPO_DOC%TYPE,
  PI_V_NRO_DOC               IN T_SCOB_PERSONA.NRO_DOC%TYPE,
  PI_V_NRO_RUC               IN T_SCOB_PERSONA.NRO_RUC%TYPE,
  PI_V_NOMBRE_COMERCIAL      IN T_SCOB_PERSONA.NOMBRE_COMERCIAL%TYPE,
  PI_V_SIGLAS                IN T_SCOB_PERSONA.SIGLAS%TYPE,
  PI_N_ID_SECTOR_ECONOMICO   IN T_SCOB_PERSONA.ID_SECTOR_ECONOMICO%TYPE,
  PI_V_APE_PATERNO           IN T_SCOB_PERSONA.APE_PATERNO%TYPE,
  PI_V_APE_MATERNO           IN T_SCOB_PERSONA.APE_MATERNO%TYPE,
  PI_V_APE_CASADA            IN T_SCOB_PERSONA.APE_CASADA%TYPE,
  PI_V_PRI_NOMBRE            IN T_SCOB_PERSONA.PRI_NOMBRE%TYPE,
  PI_V_SEG_NOMBRE            IN T_SCOB_PERSONA.SEG_NOMBRE%TYPE,
  PI_V_CIUDAD_TELEFONO       IN T_SCOB_PERSONA.CIUDAD_TELEFONO%TYPE,
  PI_V_TELEFONO              IN T_SCOB_PERSONA.TELEFONO%TYPE,
  PI_V_CIUDAD_CELULAR        IN T_SCOB_PERSONA.CIUDAD_CELULAR%TYPE,
  PI_V_CELULAR               IN T_SCOB_PERSONA.CELULAR%TYPE,
  PI_V_EMAIL                 IN T_SCOB_PERSONA.EMAIL%TYPE,
  PI_V_RAZON_SOCIAL          IN T_SCOB_PERSONA.RAZON_SOCIAL%TYPE,
  PI_V_TIP_EMPRESA           IN T_SCOB_PERSONA.TIP_EMPRESA%TYPE,
  PI_V_FAX                   IN T_SCOB_PERSONA.FAX%TYPE,
  PI_C_FLG_OFICIO            IN T_SCOB_PERSONA.FLG_OFICIO%TYPE,
  PI_C_FLG_ASOCU             IN T_SCOB_PERSONA.FLG_ASOCU%TYPE,
  PI_V_AUDUSUCREACION        IN T_SCOB_PERSONA.AUDUSUCREACION%TYPE,

  po_n_retorno               out number,
  po_n_cod_error             out number,
  po_v_msj_error             out varchar2
)
is
  N_ID_PERSONA        T_SCOB_PERSONA.ID_PERSONA%TYPE;
  N_COD_SANCIONADO    T_SCOB_PERSONA.ID_PERSONA%TYPE;
  V_COD_SANCIONADO    T_SCOB_PERSONA.COD_SANCIONADO%TYPE;

  I_EXISTE                   INTEGER;

begin
  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  --PI_I_TIPO_DOC=4 >> PN sin DNI/CE/PSPTE
  --PI_I_TIPO_DOC=6 >> EXTRANJERO SIN RUC
  IF PI_I_TIPO_DOC <> SCOB_PK_CONSTANTES.C_COD_TIPO_PERS_NAT_SIN_DOC OR
     PI_I_TIPO_DOC <> SCOB_PK_CONSTANTES.C_COD_TIPO_PERS_EXT_SIN_RUC THEN

    SELECT COUNT(PERS.ID_PERSONA) INTO I_EXISTE
    FROM T_SCOB_PERSONA PERS
    WHERE PERS.TIPO_DOC = PI_I_TIPO_DOC
    AND TRIM(PERS.NRO_DOC) = TRIM(PI_V_NRO_DOC)
    AND PERS.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO;

    IF I_EXISTE > 0 THEN
      po_n_retorno   := -10;
      po_n_cod_error := po_n_retorno;
      po_v_msj_error := 'No se puede realizar la accion. La persona antes ha sido registrada con el mismo tipo y numero de documento.';
      RETURN;
    END IF;

  ELSE
    NULL;
  END IF;

  --insertar el registro
  SELECT SCOB_SQ_PERSONA.NEXTVAL INTO N_ID_PERSONA FROM dual;

  --genera el codigo secuencial del sancionado.
  SELECT SCOB_SQ_SANCIONADO.NEXTVAL INTO N_COD_SANCIONADO FROM dual;
  V_COD_SANCIONADO := LPAD(TO_CHAR(N_COD_SANCIONADO),10,'0000000000');

  INSERT INTO USR_SICOB.T_SCOB_PERSONA(
    ID_PERSONA,
    TIPO_PERSONA,
    TIPO_DOC,
    NRO_DOC,
    NRO_RUC,
    --ID_SECTOR_ECONOMICO,
    APE_PATERNO,
    APE_MATERNO,
    APE_CASADA,
    PRI_NOMBRE,
    SEG_NOMBRE,
    TELEFONO,
    CELULAR,
    EMAIL,
    RAZON_SOCIAL,
    TIP_EMPRESA,
    FAX,
    FLG_OFICIO,
    ESTADO,
    AUDFECCREACION,
    AUDUSUCREACION,
    COD_SANCIONADO,
    NOMBRE_COMERCIAL,
    SIGLAS,
    FLG_ASOCU,
    CIUDAD_TELEFONO,
    CIUDAD_CELULAR,
    ID_SECTOR_ECONOMICO
    )
  VALUES(
    N_ID_PERSONA,
    PI_I_TIPO_PERSONA,
    PI_I_TIPO_DOC,
    DECODE(PI_I_TIPO_DOC,SCOB_PK_CONSTANTES.C_COD_TIPO_PERS_NAT_SIN_DOC,V_COD_SANCIONADO,
           DECODE(PI_I_TIPO_DOC,SCOB_PK_CONSTANTES.C_COD_TIPO_PERS_EXT_SIN_RUC,V_COD_SANCIONADO,PI_V_NRO_DOC)),
    PI_V_NRO_RUC,
    --DECODE(NVL(PI_N_ID_SECTOR_ECONOMICO,0),0,NULL,PI_N_ID_SECTOR_ECONOMICO),
    UPPER(TRIM(PI_V_APE_PATERNO)),
    UPPER(TRIM(PI_V_APE_MATERNO)),
    UPPER(TRIM(PI_V_APE_CASADA)),
    UPPER(TRIM(PI_V_PRI_NOMBRE)),
    UPPER(TRIM(PI_V_SEG_NOMBRE)),
    TRIM(PI_V_TELEFONO),
    TRIM(PI_V_CELULAR),
    TRIM(PI_V_EMAIL),
    UPPER(TRIM(PI_V_RAZON_SOCIAL)),
    TRIM(PI_V_TIP_EMPRESA),
    TRIM(PI_V_FAX),
    PI_C_FLG_OFICIO,
    SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO,
    SYSDATE,
    PI_V_AUDUSUCREACION,
    V_COD_SANCIONADO,
    UPPER(TRIM(PI_V_NOMBRE_COMERCIAL)),
    UPPER(PI_V_SIGLAS),
    NVL(PI_C_FLG_ASOCU,'0'),
    PI_V_CIUDAD_TELEFONO,
    PI_V_CIUDAD_CELULAR,
    DECODE(NVL(PI_N_ID_SECTOR_ECONOMICO,0),0,NULL,PI_N_ID_SECTOR_ECONOMICO)
  );

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

procedure SCOB_SP_U_T_SCOB_PERSONA
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 17.02.2011
-- Proposito    : Actualiza una persona
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_PERSONA            IN T_SCOB_PERSONA.ID_PERSONA%TYPE,
  PI_I_TIPO_DOC              IN T_SCOB_PERSONA.TIPO_DOC%TYPE,
  PI_V_NRO_DOC               IN T_SCOB_PERSONA.NRO_DOC%TYPE,
  PI_V_NRO_RUC               IN T_SCOB_PERSONA.NRO_RUC%TYPE,
  PI_V_NOMBRE_COMERCIAL       IN T_SCOB_PERSONA.NOMBRE_COMERCIAL%TYPE,
  PI_V_SIGLAS                 IN T_SCOB_PERSONA.SIGLAS%TYPE,
  PI_N_ID_SECTOR_ECONOMICO   IN T_SCOB_PERSONA.ID_SECTOR_ECONOMICO%TYPE,
  PI_V_APE_PATERNO           IN T_SCOB_PERSONA.APE_PATERNO%TYPE,
  PI_V_APE_MATERNO           IN T_SCOB_PERSONA.APE_MATERNO%TYPE,
  PI_V_APE_CASADA            IN T_SCOB_PERSONA.APE_CASADA%TYPE,
  PI_V_PRI_NOMBRE            IN T_SCOB_PERSONA.PRI_NOMBRE%TYPE,
  PI_V_SEG_NOMBRE            IN T_SCOB_PERSONA.SEG_NOMBRE%TYPE,
  PI_V_CIUDAD_TELEFONO       IN T_SCOB_PERSONA.CIUDAD_TELEFONO%TYPE,
  PI_V_TELEFONO              IN T_SCOB_PERSONA.TELEFONO%TYPE,
  PI_V_CIUDAD_CELULAR       IN T_SCOB_PERSONA.CIUDAD_CELULAR%TYPE,
  PI_V_CELULAR               IN T_SCOB_PERSONA.CELULAR%TYPE,
  PI_V_EMAIL                 IN T_SCOB_PERSONA.EMAIL%TYPE,
  PI_V_RAZON_SOCIAL          IN T_SCOB_PERSONA.RAZON_SOCIAL%TYPE,
  PI_V_TIP_EMPRESA           IN T_SCOB_PERSONA.TIP_EMPRESA%TYPE,
  PI_V_FAX                   IN T_SCOB_PERSONA.FAX%TYPE,
  PI_C_FLG_OFICIO            IN T_SCOB_PERSONA.FLG_OFICIO%TYPE,
  PI_C_FLG_ASOCU            IN T_SCOB_PERSONA.FLG_ASOCU%TYPE,
  PI_V_AUDUSUMODIFICACION    IN T_SCOB_PERSONA.AUDUSUMODIFICACION%TYPE,

  po_n_retorno               out number,
  po_n_cod_error             out number,
  po_v_msj_error             out varchar2
)
is
  I_EXISTE                   INTEGER;
begin
  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  SELECT COUNT(PERS.ID_PERSONA) INTO I_EXISTE
  FROM T_SCOB_PERSONA PERS
  WHERE PERS.TIPO_DOC = PI_I_TIPO_DOC
  AND TRIM(PERS.NRO_DOC) = TRIM(PI_V_NRO_DOC)
  AND PERS.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
  AND PERS.ID_PERSONA <> PI_N_ID_PERSONA;

  IF I_EXISTE > 0 THEN
    po_n_retorno   := -10;
    po_n_cod_error := po_n_retorno;
    po_v_msj_error := 'No se puede realizar la accion. La persona antes ha sido registrada con el mismo tipo y numero de documento.';
    RETURN;
  END IF;

  --actualiza el registro
  UPDATE T_SCOB_PERSONA
  SET
    NRO_DOC = PI_V_NRO_DOC,
    NRO_RUC = PI_V_NRO_RUC,
    ID_SECTOR_ECONOMICO = DECODE(NVL(PI_N_ID_SECTOR_ECONOMICO,0),0,NULL,PI_N_ID_SECTOR_ECONOMICO),
    APE_PATERNO = UPPER(TRIM(PI_V_APE_PATERNO)),
    APE_MATERNO = UPPER(TRIM(PI_V_APE_MATERNO)),
    APE_CASADA = UPPER(TRIM(PI_V_APE_CASADA)),
    PRI_NOMBRE = UPPER(TRIM(PI_V_PRI_NOMBRE)),
    SEG_NOMBRE = UPPER(TRIM(PI_V_SEG_NOMBRE)),
    TELEFONO = TRIM(PI_V_TELEFONO),
    CELULAR = TRIM(PI_V_CELULAR),
    EMAIL = TRIM(PI_V_EMAIL),
    RAZON_SOCIAL = UPPER(TRIM(PI_V_RAZON_SOCIAL)),
    TIP_EMPRESA = TRIM(PI_V_TIP_EMPRESA),
    FAX = PI_V_FAX,
    FLG_OFICIO = PI_C_FLG_OFICIO,
    CIUDAD_TELEFONO = PI_V_CIUDAD_TELEFONO,
    CIUDAD_CELULAR = PI_V_CIUDAD_CELULAR,
    AUDFECMODIFICACION = SYSDATE,
    AUDUSUMODIFICACION = PI_V_AUDUSUMODIFICACION,
    NOMBRE_COMERCIAL = UPPER(TRIM(PI_V_NOMBRE_COMERCIAL)),
    SIGLAS = UPPER(PI_V_SIGLAS),
    FLG_ASOCU= PI_C_FLG_ASOCU
  WHERE ID_PERSONA = PI_N_ID_PERSONA;

  po_n_cod_error := 0;
  po_n_retorno := PI_N_ID_PERSONA;
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
--
procedure SCOB_SP_S_T_SCOB_PERSONA
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 03.03.2011
-- Proposito    : Consulta las personas
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
--  PI_I_TIPO_ADMINISTRADO   IN INTEGER, --(1=SANCIONADO/2=DENUNCIANTE/0=TODOS)
  PI_V_COD_SANCIONADO      IN T_SCOB_PERSONA.COD_SANCIONADO%TYPE,
  PI_I_TIPO_PERSONA        IN T_SCOB_PERSONA.TIPO_PERSONA%TYPE,
  PI_I_TIPO_DOC            IN T_SCOB_PERSONA.TIPO_DOC%TYPE,
  PI_V_NRO_DOC             IN T_SCOB_PERSONA.NRO_DOC%TYPE,
  PI_V_APE_PATERNO         IN T_SCOB_PERSONA.APE_PATERNO%TYPE,
  PI_V_APE_MATERNO         IN T_SCOB_PERSONA.APE_MATERNO%TYPE,
  PI_V_APE_CASADA          IN T_SCOB_PERSONA.APE_CASADA%TYPE,
  PI_V_PRI_NOMBRE          IN T_SCOB_PERSONA.PRI_NOMBRE%TYPE,
  PI_V_SEG_NOMBRE          IN T_SCOB_PERSONA.SEG_NOMBRE%TYPE,
  PI_V_TELEFONO            IN T_SCOB_PERSONA.TELEFONO%TYPE,
  PI_V_CELULAR             IN T_SCOB_PERSONA.CELULAR%TYPE,
  PI_V_EMAIL               IN T_SCOB_PERSONA.EMAIL%TYPE,
  PI_V_RAZON_SOCIAL        IN T_SCOB_PERSONA.RAZON_SOCIAL%TYPE,
  PI_C_ESTADO              IN T_SCOB_PERSONA.ESTADO%TYPE,
  PI_I_CALIFICACION        IN T_SCOB_PERSONA.CALIFICACION%TYPE,
  PI_C_FLG_OFICIO          IN T_SCOB_PERSONA.FLG_OFICIO%TYPE,
  PI_C_FEC_INI             IN CHAR,
  PI_C_FEC_FIN             IN CHAR,
  PI_V_TIP_EMPRESA         IN T_SCOB_PERSONA.TIP_EMPRESA%TYPE,
  PI_N_ID_SECTOR_ECONOMICO IN T_SCOB_PERSONA.ID_SECTOR_ECONOMICO%TYPE,
  pi_c_s_flg_buscar_by_contenido in char, --0=NO; 1=SI.
  po_cu_retorno            out cu_rec_set
)
as
  V_COD_SANCIONADO         T_SCOB_PERSONA.COD_SANCIONADO%TYPE;
  V_NRO_DOC                T_SCOB_PERSONA.NRO_DOC%TYPE;
  V_APE_PATERNO            T_SCOB_PERSONA.APE_PATERNO%TYPE;
  V_APE_MATERNO            T_SCOB_PERSONA.APE_MATERNO%TYPE;
  V_APE_CASADA             T_SCOB_PERSONA.APE_CASADA%TYPE;
  V_PRI_NOMBRE             T_SCOB_PERSONA.PRI_NOMBRE%TYPE;
  V_SEG_NOMBRE             T_SCOB_PERSONA.SEG_NOMBRE%TYPE;
  V_RAZON_SOCIAL           T_SCOB_PERSONA.RAZON_SOCIAL%TYPE;
  V_TIP_EMPRESA            T_SCOB_PERSONA.TIP_EMPRESA%TYPE;
  V_EMAIL                  T_SCOB_PERSONA.EMAIL%TYPE;
  V_CELULAR                T_SCOB_PERSONA.CELULAR%TYPE;
  V_TELEFONO               T_SCOB_PERSONA.TELEFONO%TYPE;
  C_FLG_OFICIO             T_SCOB_PERSONA.FLG_OFICIO%TYPE;
  C_FEC_INI                VARCHAR(10);
  C_ESTADO                 T_SCOB_PERSONA.ESTADO%TYPE;
  c_car_porcentaje                             varchar(1);
begin
  --
  c_car_porcentaje := '';
  if pi_c_s_flg_buscar_by_contenido = '1' then c_car_porcentaje := '%'; end if;
  --
  V_COD_SANCIONADO := NVL(PI_V_COD_SANCIONADO,' ');
  V_NRO_DOC := NVL(PI_V_NRO_DOC,' ' );
  V_APE_PATERNO := NVL(PI_V_APE_PATERNO,' ');
  V_APE_MATERNO := NVL(PI_V_APE_MATERNO,' ');
  V_APE_CASADA := NVL(PI_V_APE_CASADA,' ');
  V_PRI_NOMBRE := NVL(PI_V_PRI_NOMBRE,' ');
  V_SEG_NOMBRE := NVL(PI_V_SEG_NOMBRE,' ');
  V_RAZON_SOCIAL := NVL(PI_V_RAZON_SOCIAL,' ');
  V_TIP_EMPRESA := NVL(PI_V_TIP_EMPRESA,' ');
  V_EMAIL := NVL(PI_V_EMAIL,' ');
  V_CELULAR := NVL(PI_V_CELULAR,' ');
  V_TELEFONO := NVL(PI_V_TELEFONO,' ');
  C_FLG_OFICIO := NVL(PI_C_FLG_OFICIO,' ');
  C_FEC_INI := NVL(PI_C_FEC_INI,' ');
  C_ESTADO := NVL(PI_C_ESTADO,' ');

  --execute immediate 'ALTER SESSION SET NLS_COMP=ANSI ';
  --execute immediate 'ALTER SESSION SET NLS_SORT=GENERIC_BASELETTER';

  open  po_cu_retorno for

  SELECT
    PERS.ID_PERSONA AS ID_PERSONA,
    PERS.COD_SANCIONADO AS COD_SANCIONADO,
    PERS.TIPO_PERSONA AS COD_TIPO_PERSONA,
    SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_TIPO_PERSONA,PERS.TIPO_PERSONA) AS NOM_TIPO_PERSONA,
    PERS.TIPO_DOC AS COD_TIPO_DOCUMENTO,
    SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_TIPO_DOC_IDENT,PERS.TIPO_DOC) AS NOM_TIPO_DOCUMENTO,
    PERS.NRO_DOC AS NRO_DOCUMENTO,
    DECODE(PERS.TIPO_PERSONA,SCOB_PK_CONSTANTES.C_TIPO_PERS_JURIDICA,  PERS.RAZON_SOCIAL, PERS.APE_PATERNO  || ' ' || PERS.APE_MATERNO  || ' ' || PERS.PRI_NOMBRE || ' ' || PERS.SEG_NOMBRE || ' ' || PERS.APE_CASADA) AS NOM_PERSONA,
    PERS.EMAIL AS CORREO,
    PERS.AUDFECCREACION AS FEC_CREACION,
    PERS.ESTADO AS COD_ESTADO,
    SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_ESTADO_REGISTRO,PERS.ESTADO) AS NOM_ESTADO,
    PERS.CALIFICACION AS COD_CALIFICACION,
    SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_TIPO_CALIFICACION,PERS.CALIFICACION) AS NOM_CALIFICACION,
    FLG_ASOCU AS FLG_ASOCU,
    CIUDAD_TELEFONO as COD_CIUDAD_TELEFONO,
    CIUDAD_CELULAR AS COD_CIUDAD_CELULAR,
    TELEFONO AS TELEFONO,
    CELULAR AS CELULAR,
    DECODE(NVL(ASOC_MULTA.NRO_MULTAS,0),0,'0', '1') AS ASOC_A_MULTA --(SI/NO)
  FROM T_SCOB_PERSONA PERS
  LEFT JOIN (
      --para obtener el nro de multas al que esta asociada la persona (como sancionado, denunciado o denunciante)
      SELECT ID_PERSONA AS ID_PERSONA,
             COUNT(NRO_MULTA) AS NRO_MULTAS
      FROM (
        SELECT MDEN.ID_PERSONA AS ID_PERSONA,
               MDEN.ID_MULTA_DETAL AS NRO_MULTA
        FROM T_SCOB_MULTA_DENUNCIANTE MDEN
        WHERE
        MDEN.ESTADO = '1'
        UNION
        SELECT MSAN.ID_PERSONA AS ID_PERSONA,
               MSAN.ID_MULTA_DETAL AS NRO_MULTA
        FROM T_SCOB_MULTA_SANCIONADO MSAN
        WHERE
        MSAN.ESTADO = '1'
      )
      GROUP BY ID_PERSONA
  )ASOC_MULTA ON ASOC_MULTA.ID_PERSONA = PERS.ID_PERSONA
  WHERE
  (PI_I_TIPO_PERSONA=0 OR PI_I_TIPO_PERSONA<>0 AND PERS.TIPO_PERSONA=PI_I_TIPO_PERSONA)
  AND (V_COD_SANCIONADO=' ' OR (V_COD_SANCIONADO<>' ' AND PERS.COD_SANCIONADO = LPAD(PI_V_COD_SANCIONADO,10,'0000000000')))
  AND (PI_I_TIPO_DOC=0 OR (PI_I_TIPO_DOC<>0 AND PERS.TIPO_DOC = PI_I_TIPO_DOC))
  AND (V_NRO_DOC=' ' OR
      (V_NRO_DOC<>' ' AND
      (PERS.NRO_DOC = PI_V_NRO_DOC OR PERS.NRO_RUC = TRIM(PI_V_NRO_DOC)))
      )

  AND (V_APE_PATERNO=' ' OR (V_APE_PATERNO<>' ' AND PERS.APE_PATERNO like c_car_porcentaje||PI_V_APE_PATERNO || '%'))
  AND (V_APE_MATERNO=' ' OR (V_APE_MATERNO<>' ' AND PERS.APE_MATERNO like c_car_porcentaje||PI_V_APE_MATERNO || '%'))
  AND (V_APE_CASADA=' ' OR (V_APE_CASADA<>' ' AND PERS.APE_CASADA like c_car_porcentaje||PI_V_APE_CASADA || '%'))
  AND (V_PRI_NOMBRE=' ' OR (V_PRI_NOMBRE<>' ' AND PERS.PRI_NOMBRE like c_car_porcentaje||PI_V_PRI_NOMBRE || '%'))
  AND (V_SEG_NOMBRE=' ' OR (V_SEG_NOMBRE<>' ' AND PERS.SEG_NOMBRE like c_car_porcentaje||PI_V_SEG_NOMBRE || '%'))
  AND (V_RAZON_SOCIAL=' ' OR (V_RAZON_SOCIAL<>' ' AND PERS.RAZON_SOCIAL like c_car_porcentaje||PI_V_RAZON_SOCIAL || '%'))

  AND (V_TIP_EMPRESA=' ' OR (V_TIP_EMPRESA<>' ' AND PERS.TIP_EMPRESA = PI_V_TIP_EMPRESA))
  AND (PI_N_ID_SECTOR_ECONOMICO=0 OR (PI_N_ID_SECTOR_ECONOMICO<>0 AND PERS.ID_SECTOR_ECONOMICO = PI_N_ID_SECTOR_ECONOMICO))
  AND (PI_I_CALIFICACION=0 OR (PI_I_CALIFICACION<>0 AND PERS.CALIFICACION = PI_I_CALIFICACION))

  AND (V_EMAIL=' ' OR (V_EMAIL<>' ' AND PERS.EMAIL = PI_V_EMAIL))
  AND (V_CELULAR=' ' OR (V_CELULAR<>' ' AND PERS.CELULAR = PI_V_CELULAR))
  AND (V_TELEFONO=' ' OR (V_TELEFONO<>' ' AND PERS.TELEFONO = PI_V_TELEFONO))
  AND (C_FLG_OFICIO=' ' OR (C_FLG_OFICIO<>' ' AND PERS.FLG_OFICIO = PI_C_FLG_OFICIO))
  AND (C_FEC_INI=' ' OR (C_FEC_INI<>' ') AND TO_DATE(TO_CHAR(PERS.AUDFECCREACION,'DD/MM/YYYY'),'DD/MM/YYYY') BETWEEN TO_DATE(PI_C_FEC_INI,'DD/MM/YYYY') AND TO_DATE(PI_C_FEC_FIN,'DD/MM/YYYY'))
  AND (C_ESTADO=' ' OR (C_ESTADO<>' ' AND PERS.ESTADO = PI_C_ESTADO));
end SCOB_SP_S_T_SCOB_PERSONA;
--
procedure SCOB_SP_S_CONTACTO
/*
-----------------------------------------------------------
-- Autor        : @dcelis
-- Creado       : 15.06.2017
-- Proposito    : Consulta contacto por personas
-----------------------------------------------------------
*/
(
--  PI_I_TIPO_ADMINISTRADO   IN INTEGER, --(1=SANCIONADO/2=DENUNCIANTE/0=TODOS)
  PI_ID_PERSONA       IN T_SCOB_PERSONA.ID_PERSONA%TYPE,
  po_cu_retorno       out cu_rec_set
) AS
BEGIN
  --
  OPEN po_cu_retorno FOR
  SELECT
  A.NU_ID_CONTACTO,
  A.VC_NOMBRE,
  A.VC_TELEFONO,
  A.VC_EMAIL,
  A.VC_ANOTACIONES,
  TO_CHAR(A.DT_FCREACION,'DD/MM/YYYY - hh12:mi:ss AM') AS VC_FCREACION,
  B.USUARIO AS VC_USUARIO,
  A.NU_ESTADO
  FROM T_SCOB_PERSONA_CONTACTO A
  INNER JOIN T_SCOB_USUARIO B ON A.NU_ID_USUARIO=B.ID_USUARIO
  WHERE A.ID_PERSONA=PI_ID_PERSONA
  AND A.NU_ESTADO=1;
  --
END SCOB_SP_S_CONTACTO;
--
procedure SCOB_SP_I_T_SCOB_PERSONA_DOMIC
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 01.03.2011
-- Proposito    : registra los domicilios de una persona
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_PERSONA              IN T_SCOB_PERSONA_DOMICILIO.ID_PERSONA%TYPE,
  PI_I_TIPO_DOMICILIO          IN T_SCOB_PERSONA_DOMICILIO.TIPO_DOMICILIO%TYPE,
  PI_V_ID_UBIGEO               IN T_SCOB_PERSONA_DOMICILIO.ID_UBIGEO%TYPE,

  PI_I_TIPO_VIA                IN T_SCOB_PERSONA_DOMICILIO.TIPO_VIA%TYPE,
  PI_V_NOM_VIA                 IN T_SCOB_PERSONA_DOMICILIO.NOM_VIA%TYPE,
  PI_V_NRO_VIA                 IN T_SCOB_PERSONA_DOMICILIO.NRO_VIA%TYPE,
  PI_V_NRO_INTERIOR            IN T_SCOB_PERSONA_DOMICILIO.NRO_INTERIOR%TYPE,
  PI_I_TIPO_ZONA               IN T_SCOB_PERSONA_DOMICILIO.TIPO_ZONA%TYPE,
  PI_V_NOM_ZONA                IN T_SCOB_PERSONA_DOMICILIO.NOM_ZONA%TYPE,
  PI_V_AUDUSUCREACION          IN T_SCOB_PERSONA_DOMICILIO.AUDUSUCREACION%TYPE,

  po_n_retorno                 out number,
  po_n_cod_error               out number,
  po_v_msj_error               out varchar2
)
is
  N_ID_PERSONA_DOMICILIO       T_SCOB_PERSONA_DOMICILIO.ID_PERSONA_DOMICILIO%TYPE;
begin
  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  --insertar el registro
  SELECT SCOB_SQ_PERSONA_DOMICILIO.NEXTVAL INTO N_ID_PERSONA_DOMICILIO FROM dual;

  INSERT INTO T_SCOB_PERSONA_DOMICILIO(
    ID_PERSONA_DOMICILIO,
    ID_PERSONA,
    TIPO_DOMICILIO,

    TIPO_VIA,
    NOM_VIA,
    NRO_VIA,
    NRO_INTERIOR,
    TIPO_ZONA,
    NOM_ZONA,

    ID_UBIGEO,
    ESTADO,
    AUDFECCREACION,
    AUDUSUCREACION
  )
  VALUES(
    N_ID_PERSONA_DOMICILIO,
    PI_N_ID_PERSONA,
    PI_I_TIPO_DOMICILIO,

    PI_I_TIPO_VIA,
    PI_V_NOM_VIA,
    PI_V_NRO_VIA,
    PI_V_NRO_INTERIOR,
    PI_I_TIPO_ZONA,
    PI_V_NOM_ZONA,

    TRIM(PI_V_ID_UBIGEO),
    SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO,
    SYSDATE,
    PI_V_AUDUSUCREACION
  );

  po_n_cod_error := 0;
  po_n_retorno := N_ID_PERSONA_DOMICILIO;
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

procedure SCOB_SP_U_T_SCOB_PERSONA_DOMIC
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 01.03.2011
-- Proposito    : actualiza los domicilios de una persona
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_PERSONA_DOMICILIO    IN T_SCOB_PERSONA_DOMICILIO.ID_PERSONA_DOMICILIO%TYPE,
  PI_N_ID_PERSONA              IN T_SCOB_PERSONA.ID_PERSONA%TYPE,
  PI_I_TIPO_DOMICILIO          IN T_SCOB_PERSONA_DOMICILIO.TIPO_DOMICILIO%TYPE,
  PI_I_TIPO_VIA                IN T_SCOB_PERSONA_DOMICILIO.TIPO_VIA%TYPE,
  PI_V_NOM_VIA                 IN T_SCOB_PERSONA_DOMICILIO.NOM_VIA%TYPE,
  PI_V_NRO_VIA                 IN T_SCOB_PERSONA_DOMICILIO.NRO_VIA%TYPE,
  PI_V_NRO_INTERIOR            IN T_SCOB_PERSONA_DOMICILIO.NRO_INTERIOR%TYPE,
  PI_I_TIPO_ZONA               IN T_SCOB_PERSONA_DOMICILIO.TIPO_ZONA%TYPE,
  PI_V_NOM_ZONA                IN T_SCOB_PERSONA_DOMICILIO.NOM_ZONA%TYPE,
  PI_V_ID_UBIGEO               IN T_SCOB_PERSONA_DOMICILIO.ID_UBIGEO%TYPE,
  PI_V_AUDUSUMODIFICACION      IN T_SCOB_PERSONA_DOMICILIO.AUDUSUMODIFICACION%TYPE,

  po_n_retorno                 out number,
  po_n_cod_error               out number,
  po_v_msj_error               out varchar2
)
is
begin
  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  --actualiza el registro
  UPDATE T_SCOB_PERSONA_DOMICILIO
  SET
    TIPO_DOMICILIO = PI_I_TIPO_DOMICILIO,
    TIPO_VIA = PI_I_TIPO_VIA,
    NOM_VIA = PI_V_NOM_VIA,
    NRO_VIA = PI_V_NRO_VIA,
    NRO_INTERIOR = PI_V_NRO_INTERIOR,
    TIPO_ZONA = PI_I_TIPO_ZONA,
    NOM_ZONA = PI_V_NOM_ZONA,
    ID_UBIGEO = TRIM(PI_V_ID_UBIGEO),
    AUDFECMODIFICACION = SYSDATE,
    AUDUSUMODIFICACION = PI_V_AUDUSUMODIFICACION
  WHERE
    ID_PERSONA_DOMICILIO = PI_N_ID_PERSONA_DOMICILIO;

  po_n_cod_error := 0;
  po_n_retorno := PI_N_ID_PERSONA_DOMICILIO;
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

procedure SCOB_SP_D_T_SCOB_PERSONA_DOMIC(
    PI_V_ID_PERSONA_DOMICILIO  IN VARCHAR2,
    PI_V_AUDUSUCREACION        IN T_SCOB_PERSONA_DOMICILIO.AUDUSUCREACION%TYPE,
    po_n_retorno               out number,
    po_n_cod_error             out number,
    po_v_msj_error             out varchar2
)
as
begin

  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  UPDATE T_SCOB_PERSONA_DOMICILIO PDOM
  SET
    AUDUSUMODIFICACION = PI_V_AUDUSUCREACION,
    AUDFECMODIFICACION = SYSDATE,
    ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_INACTIVO
  WHERE INSTR(PI_V_ID_PERSONA_DOMICILIO,'|' || TO_CHAR(PDOM.ID_PERSONA_DOMICILIO) || '|' )>0;

  po_n_cod_error := 0;
  po_n_retorno := '1';
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

procedure SCOB_SP_S_T_SCOB_PERSONA_DOMIC
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 01.03.2011
-- Proposito    : consulta las direcciones de una persona
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_PERSONA                   IN T_SCOB_PERSONA_DOMICILIO.ID_PERSONA%TYPE,
  po_cu_retorno                     out cu_rec_set
)
as
begin

  open  po_cu_retorno for
  SELECT
    PDOM.ID_PERSONA_DOMICILIO AS ID_PERSONA_DOMICILIO,
    PDOM.ID_PERSONA AS ID_PERSONA,
    PDOM.TIPO_DOMICILIO AS COD_TIPO_DOMICILIO,
    TTDOM.DESCRIPCION AS NOM_TIPO_DOMICILIO,
    PDOM.TIPO_VIA AS ID_TIPO_VIA,
    TVIA.TXT_DESCRIPCION AS DES_TIPO_VIA,
    PDOM.NOM_VIA AS NOM_VIA,
    PDOM.NRO_VIA AS NRO_VIA,
    PDOM.NRO_INTERIOR AS NRO_INTERIOR,
    PDOM.TIPO_ZONA AS ID_TIPO_ZONA,
    TZONA.TXT_DESCRIPCION AS DES_TIPO_ZONA,
    PDOM.NOM_ZONA AS NOM_ZONA,
    PDOM.ID_UBIGEO AS COD_UBIGEO,
    UBIG.COD_DPTO AS COD_DPTO,
    UBIG.TXT_DPTO AS NOM_DPTO,
    UBIG.COD_PROV AS COD_PROV,
    UBIG.TXT_PROV AS NOM_PROV,
    UBIG.COD_DIST AS COD_DIST,
    UBIG.TXT_DIST AS NOM_DSTO,
    TTDOM.CODIGO AS CODIGO,
    PDOM.Audfeccreacion AS FECHA_REGISTRO
  FROM T_SCOB_PERSONA_DOMICILIO PDOM

  LEFT JOIN T_SCOB_UBIGEO UBIG
        ON UBIG.ID_UBIGEO = PDOM.ID_UBIGEO

  LEFT JOIN T_SCOB_TIPO_DOMICILIO TTDOM
       ON TTDOM.ID_TIPO_DOMICILIO = PDOM.TIPO_DOMICILIO

  LEFT JOIN T_SCOB_TABLA_DET TVIA
        ON TVIA.ID_TABLA = SCOB_PK_CONSTANTES.C_TBL_DIRECCION_TIPO_VIA
        AND TVIA.COD_INTERNO = PDOM.TIPO_VIA

  LEFT JOIN T_SCOB_TABLA_DET TZONA
        ON TZONA.ID_TABLA = SCOB_PK_CONSTANTES.C_TBL_DIRECCION_TIPO_ZONA
        AND TZONA.COD_INTERNO = PDOM.TIPO_ZONA

  WHERE
    PDOM.ID_PERSONA = PI_N_ID_PERSONA
    AND PDOM.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO;

end;

procedure SCOB_SP_U_T_PERSONA_CALIFICA
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 29.03.2011
-- Proposito    : Actualiza la calificacion del sancionado.
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_V_ID_PERSONA            IN VARCHAR2,
  PI_I_CALIFICACION          IN T_SCOB_PERSONA.CALIFICACION%TYPE,
  PI_V_AUDUSUMODIFICACION    IN T_SCOB_PERSONA.AUDUSUMODIFICACION%TYPE,

  po_n_retorno               out number,
  po_n_cod_error             out number,
  po_v_msj_error             out varchar2
)
is
begin
  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  --actualiza el registro
  UPDATE T_SCOB_PERSONA PERS
  SET
    PERS.CALIFICACION = PI_I_CALIFICACION,
    AUDFECMODIFICACION = SYSDATE,
    AUDUSUMODIFICACION = PI_V_AUDUSUMODIFICACION
  WHERE INSTR(PI_V_ID_PERSONA,'|' || TO_CHAR(ID_PERSONA) || '|' )>0;

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

procedure SCOB_SP_S_EDITA_T_SCOB_PERSONA
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 29.03.2011
-- Proposito    : Editar persona
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_PERSONA        IN T_SCOB_PERSONA.ID_PERSONA%TYPE,
  po_cu_retorno          out cu_rec_set
)
as
begin

  open  po_cu_retorno for

  SELECT
    PERS.TIPO_PERSONA AS COD_TIPO_PERSONA,
    PERS.TIPO_DOC AS COD_TIPO_DOCUMENTO,
    PERS.NRO_DOC AS NRO_TIPO_DOCUMENTO,
    PERS.ID_SECTOR_ECONOMICO AS COD_SECTOR_ECONOMICO,
    PERS.APE_PATERNO AS APE_PATERNO,
    PERS.APE_MATERNO AS APE_MATERNO,
    PERS.APE_CASADA AS APE_CASADA,
    PERS.PRI_NOMBRE AS PRI_NOMBRE,
    PERS.SEG_NOMBRE AS SEG_NOMBRE,
    PERS.TELEFONO AS TELEFONO,
    PERS.CELULAR AS CELULAR,
    PERS.EMAIL AS EMAIL,
    PERS.RAZON_SOCIAL AS RAZON_SOCIAL,
    PERS.TIP_EMPRESA AS TIP_EMPRESA,
    PERS.FAX AS FAX,
    PERS.COD_SANCIONADO AS COD_SANCIONADO,
    PERS.CALIFICACION AS CALIFICACION,
    PERS.ID_PERSONA AS ID_PERSONA,
    PERS.TIPO_PERSONA AS TIPO_PERSONA,
    PERS.NRO_RUC AS NRO_RUC,
    PERS.NOMBRE_COMERCIAL AS NOMBRE_COMERCIAL,
    PERS.SIGLAS AS SIGLAS,
    PERS.FLG_ASOCU AS FLG_ASOCU,
    PERS.CIUDAD_TELEFONO AS CIUDAD_TELEFONO,
    PERS.CIUDAD_CELULAR AS CIUDAD_CELULAR
  FROM T_SCOB_PERSONA PERS
  WHERE PERS.ID_PERSONA = PI_N_ID_PERSONA;

end;

--------------------------------------------------------------------
procedure SCOB_SP_D_T_SCOB_PERSONA(
    PI_V_ID_PERSONA         IN VARCHAR2,
    PI_V_AUDUSUCREACION   IN T_SCOB_PERSONA.AUDUSUMODIFICACION%TYPE,
    po_n_retorno         out number,
    po_n_cod_error       out number,
    po_v_msj_error       out varchar2
)
as
begin

  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  UPDATE T_SCOB_PERSONA PERS
  SET
    AUDUSUMODIFICACION = PI_V_AUDUSUCREACION,
    AUDFECMODIFICACION = SYSDATE,
    ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_INACTIVO
  WHERE INSTR(PI_V_ID_PERSONA,'|' || TO_CHAR(ID_PERSONA) || '|' )>0;

  po_n_cod_error := 0;
  po_n_retorno := '1';
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

procedure SCOB_SP_I_T_SCOB_BIEN
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 25.05.2011
-- Proposito    : Registrar bienes
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_V_NRO_PARTIDA_REGISTRAL          IN T_SCOB_BIEN.NRO_PARTIDA_REGISTRAL%TYPE,
  PI_N_ID_ENTIDAD_ESTATAL             IN T_SCOB_BIEN.ID_ENTIDAD_ESTATAL%TYPE,
  PI_N_ID_MODELO                      IN T_SCOB_BIEN.ID_MODELO%TYPE,
  PI_C_FEC_INSCRIPCION                IN VARCHAR2,
  PI_V_NRO_PLACA                      IN T_SCOB_BIEN.NRO_PLACA%TYPE,
  PI_V_DIRECCION                      IN T_SCOB_BIEN.DIRECCION%TYPE,
  PI_V_DESCRIPCION                    IN T_SCOB_BIEN.DESCRIPCION%TYPE,
  PI_N_ID_USUARIO_INGRESO             IN T_SCOB_BIEN.ID_USUARIO_INGRESO%TYPE,
  PI_V_AUDUSUCREACION                 IN T_SCOB_BIEN.AUDUSUCREACION%TYPE,
  po_n_retorno                        out number,
  po_n_cod_error                      out number,
  po_v_msj_error                      out varchar2
)
is
  N_ID_BIEN                           T_SCOB_BIEN.ID_BIEN%TYPE;
begin
  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  SELECT SCOB_SQ_BIEN.NEXTVAL INTO N_ID_BIEN FROM DUAL;
  INSERT INTO T_SCOB_BIEN(
    ID_BIEN,
    NRO_PARTIDA_REGISTRAL,
    ID_ENTIDAD_ESTATAL,
    ID_MODELO,
    FEC_INSCRIPCION,
    NRO_PLACA,
    DIRECCION,
    DESCRIPCION,
    FEC_INGRESO,
    ID_USUARIO_INGRESO,
    ESTADO_BIEN,
    ESTADO,
    AUDFECCREACION,
    AUDUSUCREACION,
    FLG_COMUNITARIO
  )
  VALUES(
    N_ID_BIEN,
    DECODE(NVL(PI_V_NRO_PARTIDA_REGISTRAL,' '),' ',NULL,PI_V_NRO_PARTIDA_REGISTRAL),
    DECODE(PI_N_ID_ENTIDAD_ESTATAL,0,NULL,PI_N_ID_ENTIDAD_ESTATAL),
    PI_N_ID_MODELO,
    DECODE(NVL(PI_C_FEC_INSCRIPCION,' '),' ',NULL,TO_DATE(PI_C_FEC_INSCRIPCION,'DD/MM/YYYY')),
    DECODE(NVL(PI_V_NRO_PLACA,' '),' ',NULL,PI_V_NRO_PLACA),
    DECODE(NVL(PI_V_DIRECCION,' '),' ',NULL,PI_V_DIRECCION),
    DECODE(NVL(PI_V_DESCRIPCION,' '),' ',NULL,PI_V_DESCRIPCION),
    SYSDATE,
    PI_N_ID_USUARIO_INGRESO,
    1, --REGISTRADO
    SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO,
    SYSDATE,
    PI_V_AUDUSUCREACION,
    '0' --FLG_COMUNITARIO
  );

  po_n_cod_error := 0;
  po_n_retorno := N_ID_BIEN;
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

procedure SCOB_SP_U_T_SCOB_BIEN
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 25.05.2011
-- Proposito    : Actualizar bienes
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_BIEN                        IN T_SCOB_BIEN.ID_BIEN%TYPE,
  PI_V_NRO_PARTIDA_REGISTRAL          IN T_SCOB_BIEN.NRO_PARTIDA_REGISTRAL%TYPE,
  PI_N_ID_ENTIDAD_ESTATAL             IN T_SCOB_BIEN.ID_ENTIDAD_ESTATAL%TYPE,
  PI_N_ID_MODELO                      IN T_SCOB_BIEN.ID_MODELO%TYPE,
  PI_V_FEC_INSCRIPCION                IN VARCHAR,
  PI_V_NRO_PLACA                      IN T_SCOB_BIEN.NRO_PLACA%TYPE,
  PI_V_DIRECCION                      IN T_SCOB_BIEN.DIRECCION%TYPE,
  PI_V_DESCRIPCION                    IN T_SCOB_BIEN.DESCRIPCION%TYPE,
  PI_V_AUDUSUMODIFICACION             IN T_SCOB_BIEN.AUDUSUMODIFICACION%TYPE,
  po_n_retorno                        out number,
  po_n_cod_error                      out number,
  po_v_msj_error                      out varchar2
)
is
begin
  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  UPDATE T_SCOB_BIEN
  SET
    NRO_PARTIDA_REGISTRAL = DECODE(NVL(PI_V_NRO_PARTIDA_REGISTRAL,' '),' ',NULL,PI_V_NRO_PARTIDA_REGISTRAL),
    ID_ENTIDAD_ESTATAL = DECODE(PI_N_ID_ENTIDAD_ESTATAL,0,NULL,PI_N_ID_ENTIDAD_ESTATAL),
    ID_MODELO = PI_N_ID_MODELO,
    FEC_INSCRIPCION = DECODE(NVL(PI_V_FEC_INSCRIPCION,' '),' ',NULL,TO_DATE(PI_V_FEC_INSCRIPCION,'DD/MM/YYYY')),
    NRO_PLACA = DECODE(NVL(PI_V_NRO_PLACA,' '),' ',NULL,PI_V_NRO_PLACA),
    DIRECCION = DECODE(NVL(PI_V_DIRECCION,' '),' ',NULL,PI_V_DIRECCION),
    DESCRIPCION = DECODE(NVL(PI_V_DESCRIPCION,' '),' ',NULL,PI_V_DESCRIPCION),
    AUDFECMODIFICACION = SYSDATE,
    AUDUSUMODIFICACION = PI_V_AUDUSUMODIFICACION
  WHERE ID_BIEN = PI_N_ID_BIEN;

  po_n_cod_error := 0;
  po_n_retorno := PI_N_ID_BIEN;
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

procedure SCOB_SP_D_T_SCOB_BIEN
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 25.05.2011
-- Proposito    : Eliminar bienes
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_BIEN                        IN VARCHAR2,--T_SCOB_BIEN.ID_BIEN%TYPE,
  PI_V_AUDUSUMODIFICACION             IN T_SCOB_BIEN.AUDUSUMODIFICACION%TYPE,
  po_n_retorno                        out number,
  po_n_cod_error                      out number,
  po_v_msj_error                      out varchar2
)
is
begin
  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  UPDATE T_SCOB_BIEN
  SET
    ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_INACTIVO,
    AUDFECMODIFICACION = SYSDATE,
    AUDUSUMODIFICACION = PI_V_AUDUSUMODIFICACION
  WHERE INSTR(PI_N_ID_BIEN,'|' || TO_CHAR(ID_BIEN) || '|' )>0;

  po_n_cod_error := 0;
  po_n_retorno := 1;--PI_N_ID_BIEN;
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

procedure SCOB_SP_S_T_SCOB_BIEN
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 25.05.2011
-- Proposito    : Consulta los bienes registrados
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_BIEN                 IN T_SCOB_BIEN.ID_BIEN%TYPE,
  PI_N_ID_ENTIDAD_ESTATAL      IN T_SCOB_BIEN.ID_ENTIDAD_ESTATAL%TYPE,
  PI_V_NRO_PARTIDA_REGISTRAL   IN T_SCOB_BIEN.NRO_PARTIDA_REGISTRAL%TYPE,
  PI_V_NRO_PLACA               IN T_SCOB_BIEN.NRO_PLACA%TYPE,
  PI_N_ID_MODELO               IN T_SCOB_BIEN.ID_MODELO%TYPE,
  po_cu_retorno                out cu_rec_set
)
as
begin

  open  po_cu_retorno for

  SELECT
    BIEN.ID_BIEN AS ID_BIEN,
    BIEN.NRO_PARTIDA_REGISTRAL AS NRO_PARTIDA_REGISTRAL,
    BIEN.ID_ENTIDAD_ESTATAL AS COD_SUNARP,
    ENTIDAD.NOM_ENTIDAD AS NOM_SUNARP,
    ENTIDAD.ID_UBIGEO AS COD_UBIGEO_SUNARP,
    UBIGEO.TXT_DPTO || ' / ' || UBIGEO.TXT_PROV || ' / ' || UBIGEO.TXT_DIST AS NOM_UBIGEO_SUNARP,
    TIPR.ID_TIPO_PRODUCTO AS ID_TIPO_PRODUCTO,
    TIPR.NOMBRE AS TIPO_PRODUCTO,
    MARCA.ID_MARCA AS ID_MARCA,
    DECODE(MARCA.ID_MARCA,0,NULL,MARCA.NOMBRE) AS MARCA,
    MODELO.ID_MODELO AS ID_MODELO,
    DECODE(MODELO.ID_MODELO,0,NULL,MODELO.NOMBRE) AS MODELO,
    BIEN.FEC_INSCRIPCION AS FEC_INSCRIPCION,
    BIEN.NRO_PLACA AS NRO_PLACA,
    BIEN.DIRECCION AS DIRECCION,
    BIEN.DESCRIPCION AS DESCRIPCION,
    BIEN.ESTADO_BIEN AS COD_ESTADO_BIEN,
    SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_EST_BIEN_PERSONA,BIEN.ESTADO_BIEN) AS NOM_ESTADO_BIEN,
    NVL(EMBARGO.NRO_EMBARGOS,0) AS NRO_EMBARGOS,
    NVL(PERSONAS.NRO_PERSONAS,0) AS NRO_PERSONAS,
    SCOB_FN_PERSONAS_BIEN(BIEN.ID_BIEN) AS NOM_PERSONAS

  FROM T_SCOB_BIEN BIEN

  LEFT JOIN T_SCOB_ENTIDAD_ESTATAL ENTIDAD
        ON ENTIDAD.ID_ENTIDAD_ESTATAL = BIEN.ID_ENTIDAD_ESTATAL

  LEFT JOIN T_SCOB_UBIGEO UBIGEO
        ON UBIGEO.ID_UBIGEO = ENTIDAD.ID_UBIGEO

  LEFT JOIN T_SCOB_MODELO MODELO
        ON MODELO.ID_MODELO = BIEN.ID_MODELO

  LEFT JOIN T_SCOB_MARCA MARCA
        ON MARCA.ID_MARCA = MODELO.ID_MARCA

  INNER JOIN T_SCOB_TIPO_PRODUCTO TIPR
        ON TIPR.ID_TIPO_PRODUCTO = MARCA.ID_TIPO_PRODUCTO

  LEFT JOIN (
       SELECT EMB_BIEN.ID_BIEN AS ID_BIEN,
              COUNT(EMB.ID_EXPEDIENTE_EMBARGO) AS NRO_EMBARGOS
       FROM T_SCOB_EXPED_EMBARGO_INS_BIEN EMB_BIEN
       INNER JOIN T_SCOB_EXPED_EMBARGO EMB
             ON EMB.ID_EXPEDIENTE_EMBARGO = EMB_BIEN.ID_EXPEDIENTE_EMBARGO
             AND EMB.COD_ESTADO_EMBARGO <> SCOB_PK_CONSTANTES.C_EST_SOLIC_EMB_LEVANTADO
             AND EMB.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
       WHERE EMB_BIEN.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
       GROUP BY EMB_BIEN.ID_BIEN
  ) EMBARGO ON EMBARGO.ID_BIEN = BIEN.ID_BIEN

  LEFT JOIN (
       SELECT PEBI.ID_BIEN AS ID_BIEN,
              COUNT(PEBI.ID_PERSONA_BIEN) AS NRO_PERSONAS
       FROM T_SCOB_PERSONA_BIEN PEBI
       WHERE PEBI.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
       GROUP BY PEBI.ID_BIEN

  ) PERSONAS ON PERSONAS.ID_BIEN = BIEN.ID_BIEN

  WHERE
      BIEN.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
      AND (PI_N_ID_BIEN=0 OR (PI_N_ID_BIEN<>0 AND BIEN.ID_BIEN = PI_N_ID_BIEN))
      AND (PI_N_ID_ENTIDAD_ESTATAL=0 OR (PI_N_ID_ENTIDAD_ESTATAL<>0 AND BIEN.ID_ENTIDAD_ESTATAL = PI_N_ID_ENTIDAD_ESTATAL))
      AND (NVL(PI_V_NRO_PARTIDA_REGISTRAL,' ')=' ' OR (
          NVL(PI_V_NRO_PARTIDA_REGISTRAL,' ')<>' ' AND
          UPPER(TRIM(BIEN.NRO_PARTIDA_REGISTRAL)) LIKE '%' || UPPER(TRIM(PI_V_NRO_PARTIDA_REGISTRAL)) || '%')) --@I001 25.11.2011
      AND (NVL(PI_V_NRO_PLACA,' ')=' ' OR (
          NVL(PI_V_NRO_PLACA,' ')<>' ' AND
          UPPER(TRIM(BIEN.NRO_PLACA)) LIKE '%' || UPPER(TRIM(PI_V_NRO_PLACA)) || '%')) --@I001 25.11.2011
      AND (PI_N_ID_MODELO=0 OR (PI_N_ID_MODELO<>0 AND MODELO.ID_MODELO = PI_N_ID_MODELO))
  ;

end;


procedure SCOB_SP_I_ASOC_PERSONA_BIEN(
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 25.05.2011
-- Proposito    : inserta la asociacion bien persona
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
  PI_N_ID_BIEN               IN T_SCOB_BIEN.ID_BIEN%TYPE,
  PI_N_ID_SOLICITUD_TERCERIA IN T_SCOB_PERSONA_BIEN.ID_SOLICITUD_TERCERIA%TYPE,
  PI_V_ID_PERSONA            IN VARCHAR2,
  PI_N_ID_USUARIO_INGRESO    IN T_SCOB_BIEN.ID_USUARIO_INGRESO%TYPE,
  PI_V_AUDUSUCREACION        IN T_SCOB_BIEN.AUDUSUCREACION%TYPE,
  po_n_retorno               out number,
  po_n_cod_error             out number,
  po_v_msj_error             out varchar2
)
as
  I_EXISTE                   INTEGER;

begin
  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  INSERT INTO T_SCOB_PERSONA_BIEN(
    ID_PERSONA_BIEN,
    ID_BIEN,
    ID_PERSONA,
    FEC_INGRESO,
    ID_USUARIO_INGRESO,
    ESTADO,
    AUDFECCREACION,
    AUDUSUCREACION,
    ID_SOLICITUD_TERCERIA
  )
  SELECT
    SCOB_SQ_PERSONA_BIEN.NEXTVAL,
    PI_N_ID_BIEN,
    PERS.ID_PERSONA,
    SYSDATE,
    PI_N_ID_USUARIO_INGRESO,
    SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO,
    SYSDATE,
    PI_V_AUDUSUCREACION,
    DECODE(NVL(PI_N_ID_SOLICITUD_TERCERIA,0),0,NULL,PI_N_ID_SOLICITUD_TERCERIA)
  FROM T_SCOB_PERSONA PERS
  WHERE
       INSTR(PI_V_ID_PERSONA,'|' || TO_CHAR(PERS.ID_PERSONA) || '|' )>0;

  /*obtener el numero de personas asociadas al bien*/
  SELECT COUNT(PEBI.ID_PERSONA_BIEN)
  INTO I_EXISTE
  FROM T_SCOB_PERSONA_BIEN PEBI
  WHERE PEBI.ID_BIEN = PI_N_ID_BIEN
  AND PEBI.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO;

  IF I_EXISTE > 0 THEN I_EXISTE := 1; ELSE I_EXISTE := 0; END IF;

  UPDATE T_SCOB_BIEN BIEN
  SET
    BIEN.FLG_COMUNITARIO = TO_CHAR(I_EXISTE),
    BIEN.AUDUSUMODIFICACION = PI_V_AUDUSUCREACION,
    BIEN.AUDFECMODIFICACION = SYSDATE
  WHERE BIEN.ID_BIEN = PI_N_ID_BIEN;

  po_n_cod_error := 0;
  po_n_retorno := '1';
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

procedure SCOB_SP_D_ASOC_PERSONA_BIEN(
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 25.05.2011
-- Proposito    : eliminar la asociacion bien persona
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
  PI_N_ID_BIEN                       IN T_SCOB_BIEN.ID_BIEN%TYPE,
  PI_V_ID_PERSONA_BIEN               IN VARCHAR2,
  PI_V_AUDUSUMODIFICACION            IN T_SCOB_BIEN.AUDUSUMODIFICACION%TYPE,
  po_n_retorno                       out number,
  po_n_cod_error                     out number,
  po_v_msj_error                     out varchar2
)
as
  I_EXISTE                           INTEGER;
begin
  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  UPDATE T_SCOB_PERSONA_BIEN
  SET
    ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_INACTIVO,
    AUDFECMODIFICACION = SYSDATE,
    AUDUSUMODIFICACION = PI_V_AUDUSUMODIFICACION
  WHERE
       INSTR(PI_V_ID_PERSONA_BIEN,'|' || TO_CHAR(ID_PERSONA_BIEN) || '|' )>0;

  /*obtener el numero de personas asociadas al bien*/
  SELECT COUNT(PEBI.ID_PERSONA_BIEN)
  INTO I_EXISTE
  FROM T_SCOB_PERSONA_BIEN PEBI
  WHERE PEBI.ID_BIEN = PI_N_ID_BIEN
  AND PEBI.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO;

  IF I_EXISTE > 0 THEN I_EXISTE := 1; ELSE I_EXISTE := 0; END IF;

  UPDATE T_SCOB_BIEN BIEN
  SET
    BIEN.FLG_COMUNITARIO = TO_CHAR(I_EXISTE),
    BIEN.AUDUSUMODIFICACION = PI_V_AUDUSUMODIFICACION,
    BIEN.AUDFECMODIFICACION = SYSDATE
  WHERE BIEN.ID_BIEN = PI_N_ID_BIEN;

  po_n_cod_error := 0;
  po_n_retorno := '1';
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

procedure SCOB_SP_S_PERSONA_BY_BIEN
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 25.05.2011
-- Proposito    : Consulta las personas asociadas a un bien.
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_BIEN                 IN T_SCOB_BIEN.ID_BIEN%TYPE,
  PI_N_ID_SOLICITUD_TERCERIA   IN T_SCOB_PERSONA_BIEN.ID_SOLICITUD_TERCERIA%TYPE,
  po_cu_retorno                out cu_rec_set
)
as
begin

  open  po_cu_retorno for
  SELECT
    PEBI.ID_PERSONA_BIEN AS ID_PERSONA_BIEN,
    PERS.ID_PERSONA AS ID_PERSONA,
    PERS.TIPO_PERSONA AS COD_TIPO_PERSONA,
    SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_TIPO_PERSONA,PERS.TIPO_PERSONA) AS NOM_TIPO_PERSONA,
    DECODE(PERS.TIPO_PERSONA,SCOB_PK_CONSTANTES.C_TIPO_PERS_JURIDICA,  PERS.RAZON_SOCIAL,  PERS.APE_PATERNO  || ' ' || PERS.APE_MATERNO  || ' ' || PERS.PRI_NOMBRE || ' ' || PERS.SEG_NOMBRE || ' ' || PERS.APE_CASADA) AS NOM_PERSONA,
    PERS.TIPO_DOC AS COD_TIPO_DOCUMENTO,
    SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_TIPO_DOC_IDENT,PERS.TIPO_DOC) AS NOM_TIPO_DOCUMENTO,
    PERS.NRO_DOC AS NRO_DOCUMENTO,
    NVL(PERSONAS.NRO_SOLICITUDES,0) AS NRO_SOLICITUDES,
    PERS.COD_SANCIONADO AS COD_INDECOPI
  FROM T_SCOB_PERSONA_BIEN PEBI
  INNER JOIN T_SCOB_PERSONA PERS
        ON PERS.ID_PERSONA = PEBI.ID_PERSONA
  LEFT JOIN (
       SELECT
            PEBI.ID_PERSONA AS ID_PERSONA,
            COUNT(PEBI.ID_SOLICITUD_TERCERIA) AS NRO_SOLICITUDES
       FROM T_SCOB_PERSONA_BIEN PEBI
       WHERE
         PEBI.ID_BIEN = PI_N_ID_BIEN
         AND PEBI.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
         AND (NVL(PI_N_ID_SOLICITUD_TERCERIA,0)=0 OR (NVL(PI_N_ID_SOLICITUD_TERCERIA,0)<>0
                                                    AND PEBI.ID_SOLICITUD_TERCERIA = PI_N_ID_SOLICITUD_TERCERIA
             ))
       GROUP BY PEBI.ID_PERSONA
  ) PERSONAS  ON PERSONAS.ID_PERSONA = PERS.ID_PERSONA

  WHERE PEBI.ID_BIEN = PI_N_ID_BIEN
  AND (NVL(PI_N_ID_SOLICITUD_TERCERIA,0)=0 OR (NVL(PI_N_ID_SOLICITUD_TERCERIA,0)<>0
                                            AND PEBI.ID_SOLICITUD_TERCERIA = PI_N_ID_SOLICITUD_TERCERIA
      ))
  AND PEBI.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
  ;

end;

procedure SCOB_SP_S_BIEN_BY_PERSONA
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 09.06.2011
-- Proposito    : Consulta los bienes de una persona
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_PERSONA              IN T_SCOB_PERSONA.ID_PERSONA%TYPE,
  PI_N_ID_EXPEDIENTE_EMBARGO   IN T_SCOB_EXPED_EMBARGO_INS_BIEN.ID_EXPEDIENTE_EMBARGO%TYPE,
  po_cu_retorno                out cu_rec_set
)
as
begin

  open  po_cu_retorno for
  SELECT
    PEBI.ID_PERSONA_BIEN AS ID_PERSONA_BIEN,
    PEBI.ID_BIEN AS ID_BIEN,
    PEBI.ID_PERSONA AS ID_PERSONA,
    BIEN.NRO_PARTIDA_REGISTRAL AS NRO_PARTIDA_REGISTRAL,
    BIEN.ID_MODELO AS ID_MODELO,
    MODELO.NOMBRE AS NOM_MODELO,
    MARCA.NOMBRE AS NOM_MARCA,
    PRODUCTO.NOMBRE AS TIPO_BIEN,
    BIEN.FEC_INSCRIPCION AS FEC_INSCRIPCION,
    BIEN.NRO_PLACA AS NRO_PLACA,
    BIEN.NRO_SERIE AS NRO_SERIE,
    BIEN.DIRECCION AS DIRECCION_BIEN,
    BIEN.DESCRIPCION AS DES_BIEN,
    BIEN.ID_ENTIDAD_ESTATAL AS ID_SUNARP,
    SUNARP.NOM_ENTIDAD AS NOM_SUNARP
  FROM T_SCOB_PERSONA_BIEN PEBI
  INNER JOIN T_SCOB_BIEN BIEN
        ON BIEN.ID_BIEN = PEBI.ID_BIEN
        AND BIEN.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
  LEFT JOIN T_SCOB_MODELO MODELO
        ON MODELO.ID_MODELO = BIEN.ID_MODELO
  LEFT JOIN T_SCOB_MARCA MARCA
       ON MARCA.ID_MARCA = MODELO.ID_MARCA
  LEFT JOIN T_SCOB_TIPO_PRODUCTO PRODUCTO
       ON PRODUCTO.ID_TIPO_PRODUCTO = MARCA.ID_TIPO_PRODUCTO
  LEFT JOIN T_SCOB_ENTIDAD_ESTATAL SUNARP
       ON SUNARP.COD_TIPO_ENTIDAD = SCOB_PK_CONSTANTES.C_COD_ENTIDAD_SUNARP
       AND SUNARP.ID_ENTIDAD_ESTATAL = BIEN.ID_ENTIDAD_ESTATAL
  WHERE PEBI.ID_PERSONA = PI_N_ID_PERSONA
  AND PEBI.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
  AND (
         PI_N_ID_EXPEDIENTE_EMBARGO=0 OR (
         PEBI.ID_BIEN<>0 AND PEBI.ID_BIEN NOT IN (
              SELECT EMB_BIEN.ID_BIEN
              FROM T_SCOB_EXPED_EMBARGO_INS_BIEN EMB_BIEN
              WHERE EMB_BIEN.ID_EXPEDIENTE_EMBARGO = PI_N_ID_EXPEDIENTE_EMBARGO
              AND EMB_BIEN.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO)
         ))
  ;

end;


FUNCTION SCOB_FN_PERSONAS_BIEN(
  PI_N_ID_BIEN              IN T_SCOB_BIEN.ID_BIEN%TYPE
) RETURN  VARCHAR2
IS
  V_RESPUESTA   VARCHAR2 (4000);
  V_NOM_PER     VARCHAR2 (200);
  CUR_PERS      cu_rec_set;
BEGIN

  OPEN CUR_PERS FOR
  SELECT DISTINCT
    DECODE(PERS.TIPO_PERSONA,SCOB_PK_CONSTANTES.C_TIPO_PERS_JURIDICA, PERS.RAZON_SOCIAL,  PERS.APE_PATERNO  || ' ' || PERS.APE_MATERNO  || ' ' || PERS.PRI_NOMBRE || ' ' || PERS.SEG_NOMBRE || ' ' || PERS.APE_CASADA) AS NOMBRES
  FROM T_SCOB_PERSONA_BIEN PEBI
  INNER JOIN T_SCOB_PERSONA PERS
        ON PERS.ID_PERSONA = PEBI.ID_PERSONA
  WHERE
  PEBI.ID_BIEN = PI_N_ID_BIEN
  AND PEBI.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO;

  LOOP
  FETCH CUR_PERS INTO V_NOM_PER;
  EXIT WHEN CUR_PERS%NOTFOUND;
    V_RESPUESTA := V_RESPUESTA || '/ '  || V_NOM_PER;
  END LOOP;
  CLOSE CUR_PERS;
  V_RESPUESTA := SUBSTR(V_RESPUESTA,2,LENGTH(V_RESPUESTA));
  RETURN NVL(TRIM(V_RESPUESTA), ' ');

END;

/*
procedure SCOB_SP_I_REPRESENTANTE
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 31.05.2011
-- Proposito    : Registra a un representante
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
/*
(
  PI_I_TIPO_PERSONA          IN T_SCOB_REPRESENTANTE.TIPO_PERSONA%TYPE, --(NATURAL/JURIDICA)
  PI_I_TIPO_DOC              IN T_SCOB_REPRESENTANTE.TIPO_DOC%TYPE,
  PI_V_NRO_DOC               IN T_SCOB_REPRESENTANTE.NRO_DOC%TYPE,
  PI_V_NRO_RUC               IN T_SCOB_REPRESENTANTE.NRO_RUC%TYPE,
  PI_V_APE_PATERNO           IN T_SCOB_REPRESENTANTE.APE_PATERNO%TYPE,
  PI_V_APE_MATERNO           IN T_SCOB_REPRESENTANTE.APE_MATERNO%TYPE,
  PI_V_APE_CASADA            IN T_SCOB_REPRESENTANTE.APE_CASADA%TYPE,
  PI_V_PRI_NOMBRE            IN T_SCOB_REPRESENTANTE.PRI_NOMBRE%TYPE,
  PI_V_SEG_NOMBRE            IN T_SCOB_REPRESENTANTE.SEG_NOMBRE%TYPE,
  PI_V_TELEFONO              IN T_SCOB_REPRESENTANTE.TELEFONO%TYPE,
  PI_V_CELULAR               IN T_SCOB_REPRESENTANTE.CELULAR%TYPE,
  PI_V_EMAIL                 IN T_SCOB_REPRESENTANTE.EMAIL%TYPE,
  PI_V_AUDUSUCREACION        IN T_SCOB_REPRESENTANTE.AUDUSUCREACION%TYPE,

  po_n_retorno               out number,
  po_n_cod_error             out number,
  po_v_msj_error             out varchar2
)
is
  N_ID_REPRESENTANTE         T_SCOB_REPRESENTANTE.ID_REPRESENTANTE%TYPE;
  I_EXISTE                   INTEGER;

begin
  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  SELECT COUNT(REPRE.ID_REPRESENTANTE) INTO I_EXISTE
  FROM T_SCOB_REPRESENTANTE REPRE
  WHERE REPRE.TIPO_DOC = PI_I_TIPO_DOC
  AND TRIM(REPRE.NRO_DOC) = TRIM(PI_V_NRO_DOC)
  AND REPRE.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO;

  IF I_EXISTE > 0 THEN
    po_n_retorno   := -10;
    po_n_cod_error := po_n_retorno;
    po_v_msj_error := 'No se puede realizar la accion. La persona antes ha sido registrada con el mismo tipo y numero de documento.';
    RETURN;
  END IF;

  --insertar el registro
  SELECT SCOB_SQ_REPRESENTANTE.NEXTVAL INTO N_ID_REPRESENTANTE FROM dual;
  INSERT INTO T_SCOB_REPRESENTANTE(
    ID_REPRESENTANTE,
    TIPO_PERSONA,
    TIPO_DOC,
    NRO_DOC,
    NRO_RUC,
    APE_PATERNO,
    APE_MATERNO,
    APE_CASADA,
    PRI_NOMBRE,
    SEG_NOMBRE,
    TELEFONO,
    CELULAR,
    EMAIL,
    ESTADO,
    AUDFECCREACION,
    AUDUSUCREACION
    )
  VALUES(
    N_ID_REPRESENTANTE,
    PI_I_TIPO_PERSONA,
    PI_I_TIPO_DOC,
    PI_V_NRO_DOC,
    PI_V_NRO_RUC,
    PI_V_APE_PATERNO,
    PI_V_APE_MATERNO,
    PI_V_APE_CASADA,
    PI_V_PRI_NOMBRE,
    PI_V_SEG_NOMBRE,
    PI_V_TELEFONO,
    PI_V_CELULAR,
    PI_V_EMAIL,
    SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO,
    SYSDATE,
    PI_V_AUDUSUCREACION
  );

  po_n_cod_error := 0;
  po_n_retorno := N_ID_REPRESENTANTE;
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

procedure SCOB_SP_U_MARCA_PUBLICADO(
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 20.06.2011
-- Proposito    : Permite marcar como publicado a los administrados
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
    PI_V_ID_PERSONA        IN VARCHAR2,
    PI_V_AUDUSUCREACION    IN T_SCOB_PERSONA.AUDUSUMODIFICACION%TYPE,
    po_n_retorno           out number,
    po_n_cod_error         out number,
    po_v_msj_error         out varchar2
)
as
begin

  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  UPDATE T_SCOB_PERSONA PERS
  SET
    FLG_MARCA_PUBLICADO = '1',
    AUDUSUMODIFICACION = PI_V_AUDUSUCREACION,
    AUDFECMODIFICACION = SYSDATE,
    ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_INACTIVO
  WHERE INSTR(PI_V_ID_PERSONA,'|' || TO_CHAR(ID_PERSONA) || '|' )>0;

  po_n_cod_error := 0;
  po_n_retorno := '1';
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

procedure SCOB_SP_U_DESMARCA_PUBLICADO(
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 20.06.2011
-- Proposito    : Permite des-marcar como publicado a los administrados
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
    PI_V_ID_PERSONA       IN VARCHAR2,
    PI_V_AUDUSUCREACION   IN T_SCOB_PERSONA.AUDUSUMODIFICACION%TYPE,
    po_n_retorno          out number,
    po_n_cod_error        out number,
    po_v_msj_error        out varchar2
)
as
begin

  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  UPDATE T_SCOB_PERSONA PERS
  SET
    FLG_MARCA_PUBLICADO = '0',
    AUDUSUMODIFICACION = PI_V_AUDUSUCREACION,
    AUDFECMODIFICACION = SYSDATE,
    ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_INACTIVO
  WHERE INSTR(PI_V_ID_PERSONA,'|' || TO_CHAR(ID_PERSONA) || '|' )>0;

  po_n_cod_error := 0;
  po_n_retorno := '1';
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


procedure SCOB_SP_I_SOLICITUD_TERCERIA
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 12.09.2011
-- Proposito    : Registrar solicitudes de terceria
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_BIEN                          IN T_SCOB_BIEN_SOLICITUD_TERCERIA.ID_BIEN%TYPE,
  PI_V_FEC_SOLICITUD                    IN VARCHAR2,
  PI_N_ID_USUARIO_INGRESO               IN T_SCOB_BIEN.ID_USUARIO_INGRESO%TYPE,
  PI_V_AUDUSUCREACION                   IN T_SCOB_BIEN.AUDUSUCREACION%TYPE,
  po_n_retorno                          out number,
  po_n_cod_error                        out number,
  po_v_msj_error                        out varchar2
)
is
begin
  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  INSERT INTO T_SCOB_BIEN_SOLICITUD_TERCERIA(
    ID_SOLICITUD_TERCERIA,
    ID_BIEN,
    FEC_SOLICITUD,
    COD_ESTADO_SOLICITUD,
    ID_USUARIO_INGRESO,
    FEC_INGRESO,
    ESTADO,
    AUDFECCREACION,
    AUDUSUCREACION
  )
  VALUES(
    SCOB_SQ_BIEN_SOLIC_TERCERIA.NEXTVAL,
    PI_N_ID_BIEN,
    TO_DATE(PI_V_FEC_SOLICITUD,'DD/MM/YYYY'),
    SCOB_PK_CONSTANTES.C_EST_SOLIC_TERCERIA_PENDIENTE, --COD_ESTADO_SOLICITUD
    PI_N_ID_USUARIO_INGRESO,
    SYSDATE, --FEC_INGRESO
    SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO, --ESTADO
    SYSDATE, --AUDFECCREACION
    PI_V_AUDUSUCREACION --AUDUSUCREACION
  ) RETURNING ID_SOLICITUD_TERCERIA INTO po_n_retorno;

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

procedure SCOB_SP_U_SOLICITUD_TERCERIA
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 12.09.2011
-- Proposito    : Actualizar solicitudes de terceria
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_SOLICITUD_TERCERIA                  IN T_SCOB_BIEN_SOLICITUD_TERCERIA.ID_SOLICITUD_TERCERIA%TYPE,
  PI_V_FEC_SOLICITUD                          IN VARCHAR2,
  PI_I_COD_ESTADO_SOLICITUD                   IN T_SCOB_BIEN_SOLICITUD_TERCERIA.COD_ESTADO_SOLICITUD%TYPE,
  PI_V_AUDUSUMODIFICACION                     IN T_SCOB_BIEN_SOLICITUD_TERCERIA.AUDUSUMODIFICACION%TYPE,

  po_n_retorno                                out number,
  po_n_cod_error                              out number,
  po_v_msj_error                              out varchar2
)
is
  I_EXISTE                                    INTEGER;
begin
  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  --si estado = atendida:
  --valida que existan personas asociadas
  IF PI_I_COD_ESTADO_SOLICITUD = SCOB_PK_CONSTANTES.C_EST_SOLIC_TERCERIA_ATENDIDA THEN

      SELECT COUNT(PEBI.ID_PERSONA_BIEN)
      INTO I_EXISTE
      FROM T_SCOB_PERSONA_BIEN PEBI
      WHERE PEBI.ID_SOLICITUD_TERCERIA = PI_N_ID_SOLICITUD_TERCERIA
      AND PEBI.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
      ;

      IF I_EXISTE = 0 THEN
        po_v_msj_error :='No se puede realizar la accion. Se deber registrar personas para cambiar el estado de la solicitud.';
        po_n_cod_error := -10;
        RETURN;
      END IF;

  END IF;

  --actualiza la solicitud
  UPDATE T_SCOB_BIEN_SOLICITUD_TERCERIA
  SET
    FEC_SOLICITUD = TO_DATE(PI_V_FEC_SOLICITUD,'DD/MM/YYYY'),
    COD_ESTADO_SOLICITUD = PI_I_COD_ESTADO_SOLICITUD,
    FEC_ATENCION = DECODE (PI_I_COD_ESTADO_SOLICITUD,
                           SCOB_PK_CONSTANTES.C_EST_SOLIC_TERCERIA_PENDIENTE,
                           NULL,
                           SYSDATE),
    AUDFECMODIFICACION = SYSDATE,
    AUDUSUMODIFICACION = PI_V_AUDUSUMODIFICACION
  WHERE
    ID_SOLICITUD_TERCERIA = PI_N_ID_SOLICITUD_TERCERIA
  ;

  po_n_cod_error := 0;
  po_n_retorno := PI_N_ID_SOLICITUD_TERCERIA;
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

procedure SCOB_SP_D_SOLICITUD_TERCERIA
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 12.09.2011
-- Proposito    : Eliminar solicitudes de terceria
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_BIEN                                IN T_SCOB_BIEN_SOLICITUD_TERCERIA.ID_BIEN%TYPE,
  PI_V_ID_SOLICITUD_TERCERIA                  IN VARCHAR2,
  PI_V_AUDUSUMODIFICACION                     IN T_SCOB_BIEN_SOLICITUD_TERCERIA.AUDUSUMODIFICACION%TYPE,
  po_n_retorno                                out number,
  po_n_cod_error                              out number,
  po_v_msj_error                              out varchar2
)
is
  I_EXISTE                                    INTEGER;
begin
  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;


  --validar que todas tengan el estado pendiente
  SELECT COUNT(SOTE.ID_SOLICITUD_TERCERIA)
  INTO I_EXISTE
  FROM T_SCOB_BIEN_SOLICITUD_TERCERIA SOTE
  WHERE
    SOTE.ID_BIEN = PI_N_ID_BIEN
    AND INSTR(PI_V_ID_SOLICITUD_TERCERIA,'|' || TO_CHAR(ID_SOLICITUD_TERCERIA) || '|' )>0
    AND SOTE.COD_ESTADO_SOLICITUD = SCOB_PK_CONSTANTES.C_EST_SOLIC_TERCERIA_ATENDIDA
    AND SOTE.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
  ;

  IF I_EXISTE > 0 THEN
    po_v_msj_error :='No se puede realizar la accion. Solo se pueden eliminar solicitudes con estado "Pendiente".';
    po_n_cod_error := -10;
    RETURN;
  END IF;

  --eliminar a las personas asociadas
  UPDATE T_SCOB_PERSONA_BIEN PEBI
  SET
    ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_INACTIVO,
    AUDFECMODIFICACION = SYSDATE,
    AUDUSUMODIFICACION = PI_V_AUDUSUMODIFICACION
  WHERE INSTR(PI_V_ID_SOLICITUD_TERCERIA,'|' || TO_CHAR(ID_SOLICITUD_TERCERIA) || '|' )>0
  ;

  --eliminar las solicitudes
  UPDATE T_SCOB_BIEN_SOLICITUD_TERCERIA
  SET
    ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_INACTIVO,
    AUDFECMODIFICACION = SYSDATE,
    AUDUSUMODIFICACION = PI_V_AUDUSUMODIFICACION
  WHERE INSTR(PI_V_ID_SOLICITUD_TERCERIA,'|' || TO_CHAR(ID_SOLICITUD_TERCERIA) || '|' )>0;

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


procedure SCOB_SP_S_SOLICITUD_TERCERIA
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 12.09.2011
-- Proposito    : Consulta de solicitudes
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_BIEN                         IN T_SCOB_BIEN_SOLICITUD_TERCERIA.ID_BIEN%TYPE,
  PI_N_ID_SOLICITUD_TERCERIA           IN T_SCOB_BIEN_SOLICITUD_TERCERIA.ID_SOLICITUD_TERCERIA%TYPE,
  PI_V_SOLICITUD_FEC_INI               IN VARCHAR2,
  PI_V_SOLICITUD_FEC_FIN               IN VARCHAR2,
  po_cu_retorno                        out cu_rec_set
)
as
begin

  open  po_cu_retorno for

  SELECT
    SOTE.ID_SOLICITUD_TERCERIA AS ID_SOLICITUD_TERCERIA,
    SOTE.ID_BIEN AS ID_BIEN,
    SOTE.FEC_SOLICITUD AS FEC_SOLICITUD,
    SOTE.COD_ESTADO_SOLICITUD AS COD_ESTADO_SOLICITUD,
    SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_ESTADO_SOLIC_TERCERIA,
                                             SOTE.COD_ESTADO_SOLICITUD) AS NOM_ESTADO_SOLICITUD,
    SOTE.FEC_ATENCION AS FEC_ATENCION,
    SCOB_FN_PERSONAS_SOLICITUD(SOTE.ID_SOLICITUD_TERCERIA) AS NOM_PERSONAS
  FROM T_SCOB_BIEN_SOLICITUD_TERCERIA SOTE
  WHERE SOTE.ID_BIEN = PI_N_ID_BIEN
  AND SOTE.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
  AND (NVL(PI_N_ID_SOLICITUD_TERCERIA,0)=0 OR (NVL(PI_N_ID_SOLICITUD_TERCERIA,0)<>0 AND SOTE.ID_SOLICITUD_TERCERIA = PI_N_ID_SOLICITUD_TERCERIA))
  AND (NVL(PI_V_SOLICITUD_FEC_INI,' ')=' ' OR (
                                    NVL(PI_V_SOLICITUD_FEC_INI,' ')<>' ' AND
                                    SOTE.FEC_SOLICITUD BETWEEN TO_DATE(PI_V_SOLICITUD_FEC_INI,'DD/MM/YYYY') AND TO_DATE(PI_V_SOLICITUD_FEC_FIN,'DD/MM/YYYY')
                                    ))
  ;
END;

FUNCTION SCOB_FN_PERSONAS_SOLICITUD(
  PI_N_ID_SOLICITUD_TERCERIA        IN T_SCOB_PERSONA_BIEN.ID_SOLICITUD_TERCERIA%TYPE
) RETURN  VARCHAR2
IS
  V_RESPUESTA   VARCHAR2 (4000);
  V_NOM_PER     VARCHAR2 (200);
  CUR_PERS      cu_rec_set;
BEGIN

  OPEN CUR_PERS FOR
  SELECT DISTINCT
    DECODE(PERS.TIPO_PERSONA,SCOB_PK_CONSTANTES.C_TIPO_PERS_JURIDICA, PERS.RAZON_SOCIAL,  PERS.APE_PATERNO  || ' ' || PERS.APE_MATERNO  || ' ' || PERS.PRI_NOMBRE || ' ' || PERS.SEG_NOMBRE || ' ' || PERS.APE_CASADA) AS NOMBRES
  FROM T_SCOB_PERSONA_BIEN PEBI
  INNER JOIN T_SCOB_PERSONA PERS
        ON PERS.ID_PERSONA = PEBI.ID_PERSONA
  WHERE
  PEBI.ID_SOLICITUD_TERCERIA = PI_N_ID_SOLICITUD_TERCERIA
  AND PEBI.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO;

  LOOP
  FETCH CUR_PERS INTO V_NOM_PER;
  EXIT WHEN CUR_PERS%NOTFOUND;
    V_RESPUESTA := V_RESPUESTA || '/ '  || V_NOM_PER;
  END LOOP;
  CLOSE CUR_PERS;
  V_RESPUESTA := SUBSTR(V_RESPUESTA,2,LENGTH(V_RESPUESTA));
  RETURN NVL(TRIM(V_RESPUESTA), ' ');

END;

procedure SCOB_SP_S_PERS_BY_ASIG_BIEN
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 12.09.2011
-- Proposito    : Consulta las personas que seran asignadas a un bien
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_V_COD_SANCIONADO         IN T_SCOB_PERSONA.COD_SANCIONADO%TYPE,
  PI_I_TIPO_PERSONA           IN T_SCOB_PERSONA.TIPO_PERSONA%TYPE,
  PI_I_TIPO_DOC               IN T_SCOB_PERSONA.TIPO_DOC%TYPE,
  PI_V_NRO_DOC                IN T_SCOB_PERSONA.NRO_DOC%TYPE,
  PI_V_APE_PATERNO            IN T_SCOB_PERSONA.APE_PATERNO%TYPE,
  PI_V_APE_MATERNO            IN T_SCOB_PERSONA.APE_MATERNO%TYPE,
  PI_V_APE_CASADA             IN T_SCOB_PERSONA.APE_CASADA%TYPE,
  PI_V_PRI_NOMBRE             IN T_SCOB_PERSONA.PRI_NOMBRE%TYPE,
  PI_V_SEG_NOMBRE             IN T_SCOB_PERSONA.SEG_NOMBRE%TYPE,
  PI_V_TELEFONO               IN T_SCOB_PERSONA.TELEFONO%TYPE,
  PI_V_CELULAR                IN T_SCOB_PERSONA.CELULAR%TYPE,
  PI_V_EMAIL                  IN T_SCOB_PERSONA.EMAIL%TYPE,
  PI_V_RAZON_SOCIAL           IN T_SCOB_PERSONA.RAZON_SOCIAL%TYPE,
  PI_N_BIEN                   IN T_SCOB_BIEN.ID_BIEN%TYPE,
  PI_N_ID_SOLICITUD_TERCERIA  IN T_SCOB_PERSONA_BIEN.ID_SOLICITUD_TERCERIA%TYPE,
  po_cu_retorno               out cu_rec_set
)
as
begin

  open  po_cu_retorno for

  SELECT
    PERS.ID_PERSONA AS ID_PERSONA,
    PERS.COD_SANCIONADO AS COD_SANCIONADO,
    PERS.TIPO_PERSONA AS COD_TIPO_PERSONA,
    SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_TIPO_PERSONA,PERS.TIPO_PERSONA) AS NOM_TIPO_PERSONA,
    PERS.TIPO_DOC AS COD_TIPO_DOCUMENTO,
    SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_TIPO_DOC_IDENT,PERS.TIPO_DOC) AS NOM_TIPO_DOCUMENTO,
    PERS.NRO_DOC AS NRO_DOCUMENTO,
    DECODE(PERS.TIPO_PERSONA,SCOB_PK_CONSTANTES.C_TIPO_PERS_JURIDICA,  PERS.RAZON_SOCIAL, PERS.APE_PATERNO  || ' ' || PERS.APE_MATERNO  || ' ' || PERS.PRI_NOMBRE || ' ' || PERS.SEG_NOMBRE || ' ' || PERS.APE_CASADA) AS NOM_PERSONA,
    PERS.EMAIL AS CORREO,
    PERS.AUDFECCREACION AS FEC_CREACION,
    PERS.ESTADO AS COD_ESTADO,
    SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_ESTADO_REGISTRO,PERS.ESTADO) AS NOM_ESTADO,
    CIUDAD_TELEFONO as COD_CIUDAD_TELEFONO,
    CIUDAD_CELULAR AS COD_CIUDAD_CELULAR,
    TELEFONO AS TELEFONO,
    CELULAR AS CELULAR,
    DECODE(NVL(ASOC_MULTA.ID_PERSONA,0),0,'0', '1') AS ASOC_A_MULTA --(SI/NO)
  FROM T_SCOB_PERSONA PERS
  LEFT JOIN (
    SELECT MDEN.ID_PERSONA AS ID_PERSONA
    FROM T_SCOB_MULTA_DENUNCIANTE MDEN
    WHERE MDEN.ID_PERSONA = 1
    AND MDEN.ESTADO = '1'
    UNION
    SELECT MSAN.ID_PERSONA AS ID_PERSONA
    FROM T_SCOB_MULTA_SANCIONADO MSAN
    WHERE MSAN.ID_PERSONA = 1
    AND MSAN.ESTADO = '1'
  )ASOC_MULTA ON ASOC_MULTA.ID_PERSONA = PERS.ID_PERSONA
  WHERE PERS.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
  AND (NVL(TRIM(PI_V_COD_SANCIONADO),' ')=' ' OR (NVL(TRIM(PI_V_COD_SANCIONADO),' ')<>' ' AND TRIM(PERS.COD_SANCIONADO) = TRIM(PI_V_COD_SANCIONADO)))
  AND (NVL(PI_I_TIPO_PERSONA,0)=0 OR (NVL(PI_I_TIPO_PERSONA,0)<>0 AND PERS.TIPO_PERSONA = PI_I_TIPO_PERSONA))
  AND (NVL(PI_I_TIPO_DOC,0)=0 OR (NVL(PI_I_TIPO_DOC,0)<>0 AND PERS.TIPO_DOC = PI_I_TIPO_DOC))
  AND (NVL(TRIM(PI_V_NRO_DOC),' ')=' ' OR (NVL(TRIM(PI_V_NRO_DOC),' ')<>' ' AND TRIM(PERS.NRO_DOC) = TRIM(PI_V_NRO_DOC)))
  AND (NVL(TRIM(PI_V_APE_PATERNO),' ')=' ' OR (NVL(TRIM(PI_V_APE_PATERNO),' ')<>' ' AND fun_scob_nosensite(TRIM(PERS.APE_PATERNO)) LIKE '%' || fun_scob_nosensite(TRIM(PI_V_APE_PATERNO))|| '%' ))
  AND (NVL(TRIM(PI_V_APE_MATERNO),' ')=' ' OR (NVL(TRIM(PI_V_APE_MATERNO),' ')<>' ' AND fun_scob_nosensite(TRIM(PERS.APE_MATERNO)) LIKE  '%' || fun_scob_nosensite(TRIM(PI_V_APE_MATERNO))|| '%' ))
  AND (NVL(TRIM(PI_V_APE_CASADA),' ')=' ' OR (NVL(TRIM(PI_V_APE_CASADA),' ')<>' ' AND fun_scob_nosensite(TRIM(PERS.APE_CASADA)) LIKE  '%' || fun_scob_nosensite(TRIM(PI_V_APE_CASADA))|| '%' ))
  AND (NVL(TRIM(PI_V_PRI_NOMBRE),' ')=' ' OR (NVL(TRIM(PI_V_PRI_NOMBRE),' ')<>' ' AND fun_scob_nosensite(TRIM(PERS.PRI_NOMBRE)) LIKE  '%' || fun_scob_nosensite(TRIM(PI_V_PRI_NOMBRE))|| '%' ))
  AND (NVL(TRIM(PI_V_SEG_NOMBRE),' ')=' ' OR (NVL(TRIM(PI_V_SEG_NOMBRE),' ')<>' ' AND fun_scob_nosensite(TRIM(PERS.SEG_NOMBRE)) LIKE  '%' || fun_scob_nosensite(TRIM(PI_V_SEG_NOMBRE))|| '%' ))
  AND (NVL(TRIM(PI_V_TELEFONO),' ')=' ' OR (NVL(TRIM(PI_V_TELEFONO),' ')<>' ' AND TRIM(PERS.TELEFONO) = TRIM(PI_V_TELEFONO)))
  AND (NVL(TRIM(PI_V_CELULAR),' ')=' ' OR (NVL(TRIM(PI_V_CELULAR),' ')<>' ' AND TRIM(PERS.CELULAR) = TRIM(PI_V_CELULAR)))
  AND (NVL(TRIM(PI_V_EMAIL),' ')=' ' OR (NVL(TRIM(PI_V_EMAIL),' ')<>' ' AND UPPER(TRIM(PERS.EMAIL)) = UPPER(TRIM(PI_V_EMAIL))))
  AND (NVL(TRIM(PI_V_RAZON_SOCIAL),' ')=' ' OR (NVL(TRIM(PI_V_RAZON_SOCIAL),' ')<>' ' AND fun_scob_nosensite(TRIM(PERS.RAZON_SOCIAL)) LIKE  '%' || fun_scob_nosensite(TRIM(PI_V_RAZON_SOCIAL))|| '%' ))
  AND (NVL(PI_N_BIEN,0)=0 OR (NVL(PI_N_BIEN,0)<>0
                              AND PERS.ID_PERSONA NOT IN (

                                    SELECT PEBI.ID_PERSONA
                                    FROM T_SCOB_PERSONA_BIEN PEBI
                                    WHERE (NVL(PI_N_BIEN,0)=0 OR (NVL(PI_N_BIEN,0)<>0 AND PEBI.ID_BIEN = PI_N_BIEN))
                                    AND (NVL(PI_N_ID_SOLICITUD_TERCERIA,0)=0 OR (NVL(PI_N_ID_SOLICITUD_TERCERIA,0)<>0 AND PEBI.ID_SOLICITUD_TERCERIA = PI_N_ID_SOLICITUD_TERCERIA))
                                    AND PEBI.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
                              )
      ))
  ;
end;
--
procedure SCOB_SP_S_BUSCAR_T_PERSONA
/*
-----------------------------------------------------------
-- Autor        : @dcelis
-- Creado       : 15.06.2017
-- Proposito    : Consulta Persona si Existe
-----------------------------------------------------------
*/
(
  PI_ID_TIPO_PERSONA    IN T_SCOB_PERSONA.TIPO_PERSONA%TYPE,
  PI_ID_TIPO_DOC        IN T_SCOB_PERSONA.TIPO_DOC%TYPE,
  PI_NRO_DOC            IN T_SCOB_PERSONA.NRO_DOC%TYPE,
  po_cu_retorno         out cu_rec_set
) AS
  --
  V_QUERY CLOB;
  --
BEGIN
  --
  V_QUERY:='SELECT
  PERS.ID_PERSONA AS ID_PERSONA,
  PERS.COD_SANCIONADO AS COD_SANCIONADO,
  PERS.TIPO_PERSONA AS COD_TIPO_PERSONA,
  SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES('||SCOB_PK_CONSTANTES.C_TBL_TIPO_PERSONA||',PERS.TIPO_PERSONA) AS NOM_TIPO_PERSONA,
  PERS.TIPO_DOC AS COD_TIPO_DOCUMENTO,
  SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES('||SCOB_PK_CONSTANTES.C_TBL_TIPO_DOC_IDENT||',PERS.TIPO_DOC) AS NOM_TIPO_DOCUMENTO,

  PERS.NRO_DOC AS NRO_DOCUMENTO,
  PERS.EMAIL AS CORREO,
  PERS.TELEFONO AS TELEFONO,
  PERS.CELULAR AS CELULAR,

  PERS.APE_PATERNO,
  PERS.APE_MATERNO,
  PERS.APE_CASADA,
  PERS.PRI_NOMBRE,
  PERS.SEG_NOMBRE,
  PERS.RAZON_SOCIAL,
  PERS.NOMBRE_COMERCIAL,
  PERS.NRO_RUC,
  PERS.FAX
  FROM T_SCOB_PERSONA PERS
  WHERE PERS.TIPO_DOC = '||PI_ID_TIPO_DOC||'
  AND PERS.TIPO_PERSONA = '||PI_ID_TIPO_PERSONA||'';

  IF PI_ID_TIPO_DOC=1 THEN
    V_QUERY:=V_QUERY||' AND PERS.NRO_DOC LIKE '||'''%'||PI_NRO_DOC||'%''';
  ELSIF PI_ID_TIPO_DOC=5 THEN
    V_QUERY:=V_QUERY||' AND PERS.NRO_RUC LIKE '||'''%'||PI_NRO_DOC||'%''';
  END IF;
  --
  DBMS_OUTPUT.PUT_LINE('V_QUERY: '||V_QUERY);
  OPEN po_cu_retorno FOR V_QUERY;
  --
END SCOB_SP_S_BUSCAR_T_PERSONA;
--
procedure SCOB_SP_I_CONTACTO
/*
-----------------------------------------------------------
-- Autor        : @dcelis
-- Creado       : 16.06.2017
-- Proposito    : Insertar contacto - Si existe los actualiza, sino, los crea.
-----------------------------------------------------------
*/
(
  PI_V_ID_CONTACTO    IN T_SCOB_PERSONA_CONTACTO.NU_ID_CONTACTO%TYPE,
  PI_V_ID_PERSONA     IN T_SCOB_PERSONA_CONTACTO.ID_PERSONA%TYPE,
  PI_V_NOMBRE         IN T_SCOB_PERSONA_CONTACTO.VC_NOMBRE%TYPE,
  PI_VC_TELEFONO      IN T_SCOB_PERSONA_CONTACTO.VC_TELEFONO%TYPE,
  PI_VC_EMAIL         IN T_SCOB_PERSONA_CONTACTO.VC_EMAIL%TYPE,
  PI_V_ANOTACIONES    IN T_SCOB_PERSONA_CONTACTO.VC_ANOTACIONES%TYPE,
  PI_V_ID_USUARIO     IN T_SCOB_PERSONA_CONTACTO.NU_ID_USUARIO%TYPE,
  PI_V_NU_ESTADO     IN T_SCOB_PERSONA_CONTACTO.NU_ESTADO%TYPE,
  po_n_retorno        out number,
  po_n_cod_error      out number,
  po_v_msj_error      out varchar2
) AS
BEGIN
  --
  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;
  --
  IF PI_V_ID_CONTACTO IS NOT NULL THEN
    -- ACTUALIZAR PERSONA / AGREGAR CONTACTO
    DBMS_OUTPUT.PUT_LINE('ACTUALIZAR PERSONA / AGREGAR CONTACTO');
    --
    UPDATE T_SCOB_PERSONA_CONTACTO
    SET
    VC_NOMBRE=PI_V_NOMBRE,
    VC_TELEFONO=PI_VC_TELEFONO,
    VC_EMAIL=PI_VC_EMAIL,
    VC_ANOTACIONES=PI_V_ANOTACIONES,
    NU_ESTADO=PI_V_NU_ESTADO
    WHERE NU_ID_CONTACTO=PI_V_ID_CONTACTO;
    --
  ELSE
    -- INSERTAR PERSONA / AGREGAR CONTACTO
    DBMS_OUTPUT.PUT_LINE('INSERTAR PERSONA / AGREGAR CONTACTO');
    --
    INSERT
    INTO T_SCOB_PERSONA_CONTACTO
      (
        NU_ID_CONTACTO,
        ID_PERSONA,
        VC_NOMBRE,
        VC_TELEFONO,
        VC_EMAIL,
        VC_ANOTACIONES,
        NU_ID_USUARIO
      )
      VALUES
      (
        --(SELECT NVL(MAX(NU_ID_CONTACTO),0)+1 FROM T_SCOB_PERSONA_CONTACTO),
        SCOB_SQ_PERSONA_CONTACTO.NEXTVAL,
        PI_V_ID_PERSONA,
        PI_V_NOMBRE,
        PI_VC_TELEFONO,
        PI_VC_EMAIL,
        PI_V_ANOTACIONES,
        PI_V_ID_USUARIO
      );
    --
  END IF;
  --
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
  --
END SCOB_SP_I_CONTACTO;
--------------------------------------------------------------------

  -- ******************************************************************************
  -- Descripción: Procedure que retorna la lista de sancionados actuales
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
  PROCEDURE SCOB_SP_S_SANCIONADO_ACTUAL(PI_V_COD_INDECOPI   IN T_SCOB_PERSONA.COD_SANCIONADO%TYPE,
                                        PI_I_TIPO_PERSONA   IN T_SCOB_PERSONA.TIPO_PERSONA%TYPE,
                                        PI_I_TIPO_DOC       IN T_SCOB_PERSONA.TIPO_DOC%TYPE,
                                        PI_V_NRO_DOC        IN T_SCOB_PERSONA.NRO_DOC%TYPE,
                                        PI_V_APE_PATERNO    IN T_SCOB_PERSONA.APE_PATERNO%TYPE,
                                        PI_V_APE_MATERNO    IN T_SCOB_PERSONA.APE_MATERNO%TYPE,
                                        PI_V_APE_CASADA     IN T_SCOB_PERSONA.APE_CASADA%TYPE,
                                        PI_V_PRI_NOMBRE     IN T_SCOB_PERSONA.PRI_NOMBRE%TYPE,
                                        PI_V_SEG_NOMBRE     IN T_SCOB_PERSONA.SEG_NOMBRE%TYPE,
                                        PI_V_RAZON_SOCIAL   IN T_SCOB_PERSONA.RAZON_SOCIAL%TYPE,
                                        PO_CU_RETORNO       OUT CU_REC_SET,
                                        PO_N_COD_ERROR      OUT NUMBER,
                                        PO_V_MSJ_ERROR      OUT VARCHAR2) AS
                                        
   V_COD_INDECOPI   T_SCOB_PERSONA.COD_SANCIONADO%TYPE;
   V_NRO_DOC        T_SCOB_PERSONA.NRO_DOC%TYPE;
   V_APE_PATERNO    T_SCOB_PERSONA.APE_PATERNO%TYPE;
   V_APE_MATERNO    T_SCOB_PERSONA.APE_MATERNO%TYPE;
   V_APE_CASADA     T_SCOB_PERSONA.APE_CASADA%TYPE;
   V_PRI_NOMBRE     T_SCOB_PERSONA.PRI_NOMBRE%TYPE;
   V_SEG_NOMBRE     T_SCOB_PERSONA.SEG_NOMBRE%TYPE;
   V_RAZON_SOCIAL   T_SCOB_PERSONA.RAZON_SOCIAL%TYPE;      
                                        
   BEGIN
        
    PO_N_COD_ERROR := -1;
    PO_V_MSJ_ERROR := '';
    
    V_COD_INDECOPI   := NVL(PI_V_COD_INDECOPI, ' ');     
    V_NRO_DOC        := NVL(PI_V_NRO_DOC, ' ');        
    V_APE_PATERNO    := NVL(PI_V_APE_PATERNO, ' ');    
    V_APE_MATERNO    := NVL(PI_V_APE_MATERNO, ' ');    
    V_APE_CASADA     := NVL(PI_V_APE_CASADA, ' ');     
    V_PRI_NOMBRE     := NVL(PI_V_PRI_NOMBRE, ' ');     
    V_SEG_NOMBRE     := NVL(PI_V_SEG_NOMBRE, ' ');     
    V_RAZON_SOCIAL   := NVL(PI_V_RAZON_SOCIAL, ' ');   
    
    OPEN PO_CU_RETORNO FOR 
    
      SELECT PE.COD_SANCIONADO AS CODIGO_INDECOPI,
           TP.TXT_DESCRIPCION AS TIPO_PERSONERIA,
           TD.TXT_DESCRIPCION AS TIPO_DOC,
           DECODE(PE.NRO_RUC, NULL, PE.NRO_DOC, PE.NRO_RUC) AS NRO_DOC,
           DECODE(PE.TIPO_PERSONA,
                  2,
                  PE.RAZON_SOCIAL,
                  PE.APE_PATERNO || ' ' || PE.APE_MATERNO || ' ' ||
                  PE.PRI_NOMBRE ||
                  DECODE(PE.SEG_NOMBRE, NULL, '', ' ' || PE.SEG_NOMBRE)) AS SANCIONADO,
           COUNT(PE.COD_SANCIONADO) AS TOTAL_CUMS,
           PE.ID_PERSONA AS ID_PERSONA
      FROM USR_SICOB.T_SCOB_MULTA MU
     INNER JOIN USR_SICOB.T_SCOB_MULTA_DETAL MD
        ON (MU.ID_MULTA = MD.ID_MULTA AND MD.ESTADO = '1' AND
           MD.FLG_ACTUAL = '1')
     INNER JOIN USR_SICOB.T_SCOB_MULTA_SANCIONADO MS
        ON (MD.ID_MULTA_DETAL = MS.ID_MULTA_DETAL AND MS.ESTADO = '1' AND
           MS.COD_TIPO_PERSONA = '1')
     INNER JOIN USR_SICOB.T_SCOB_PERSONA PE
        ON (MS.ID_PERSONA = PE.ID_PERSONA)
      LEFT JOIN USR_SICOB.T_SCOB_TABLA_DET TP
        ON (PE.TIPO_PERSONA = TP.COD_INTERNO AND TP.ID_TABLA = 11)
      LEFT JOIN USR_SICOB.T_SCOB_TABLA_DET TD
        ON (PE.TIPO_DOC = TD.COD_INTERNO AND TD.ID_TABLA = 10)
     WHERE
      (PI_I_TIPO_PERSONA = 0 OR (PI_I_TIPO_PERSONA<>0 AND PE.TIPO_PERSONA=PI_I_TIPO_PERSONA))
      AND (V_COD_INDECOPI=' ' OR (V_COD_INDECOPI<>' ' AND PE.COD_SANCIONADO = LPAD(PI_V_COD_INDECOPI,10,'0000000000')))
      AND (PI_I_TIPO_DOC=0 OR (PI_I_TIPO_DOC<>0 AND PE.TIPO_DOC = PI_I_TIPO_DOC))
      AND (V_NRO_DOC=' ' OR
          (V_NRO_DOC<>' ' AND
          (PE.NRO_DOC = PI_V_NRO_DOC OR PE.NRO_RUC = TRIM(PI_V_NRO_DOC)))
          )
      AND (V_APE_PATERNO=' ' OR (V_APE_PATERNO<>' ' AND PE.APE_PATERNO LIKE UPPER(PI_V_APE_PATERNO) || '%'))
      AND (V_APE_MATERNO=' ' OR (V_APE_MATERNO<>' ' AND PE.APE_MATERNO LIKE UPPER(PI_V_APE_MATERNO) || '%'))
      AND (V_APE_CASADA=' ' OR (V_APE_CASADA<>' ' AND PE.APE_CASADA LIKE UPPER(PI_V_APE_CASADA) || '%'))
      AND (V_PRI_NOMBRE=' ' OR (V_PRI_NOMBRE<>' ' AND PE.PRI_NOMBRE LIKE UPPER(PI_V_PRI_NOMBRE) || '%'))
      AND (V_SEG_NOMBRE=' ' OR (V_SEG_NOMBRE<>' ' AND PE.SEG_NOMBRE LIKE UPPER(PI_V_SEG_NOMBRE) || '%'))
      AND (V_RAZON_SOCIAL=' ' OR PI_I_TIPO_PERSONA<>2 OR(V_RAZON_SOCIAL<>' ' AND PI_I_TIPO_PERSONA=2 AND PE.RAZON_SOCIAL LIKE UPPER(PI_V_RAZON_SOCIAL) || '%'))
      AND (V_RAZON_SOCIAL=' ' OR PI_I_TIPO_PERSONA<>0 
        OR (V_RAZON_SOCIAL<>' ' AND PI_I_TIPO_PERSONA=0 AND (
        PE.APE_PATERNO || ' ' || 
        PE.APE_MATERNO || ' ' ||
        PE.PRI_NOMBRE || 
        DECODE(PE.SEG_NOMBRE,NULL,'',' ' || PE.SEG_NOMBRE) ) LIKE UPPER(PI_V_RAZON_SOCIAL) || '%')
        OR (V_RAZON_SOCIAL<>' ' AND PI_I_TIPO_PERSONA=0 AND PE.RAZON_SOCIAL LIKE UPPER(PI_V_RAZON_SOCIAL) || '%')
            )
      
     GROUP BY PE.COD_SANCIONADO,
              PE.ID_PERSONA,
              PE.TIPO_PERSONA,
              PE.RAZON_SOCIAL,
              PE.APE_PATERNO,
              PE.APE_MATERNO,
              PE.PRI_NOMBRE,
              PE.SEG_NOMBRE,
              TP.TXT_DESCRIPCION,
              TD.TXT_DESCRIPCION,
              PE.NRO_RUC,
              PE.NRO_DOC;
    
    
  EXCEPTION
    
    WHEN OTHERS THEN
      
      PO_N_COD_ERROR := SQLCODE;
      SELECT CASE WHEN PO_N_COD_ERROR > 0 THEN PO_N_COD_ERROR * -1 ELSE PO_N_COD_ERROR END
        INTO PO_N_COD_ERROR
        FROM DUAL;
      PO_V_MSJ_ERROR := SUBSTR(SQLERRM, 1, 250);
  
  END;            
  
    -- ******************************************************************************
  -- Descripción: Procedure que retorna la lista de cums de una persona
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
  PROCEDURE SCOB_SP_S_CUMS_PERSONA(PI_I_ID_PERSONA IN T_SCOB_PERSONA.ID_PERSONA%TYPE,
                                   PO_CU_RETORNO   OUT CU_REC_SET,
                                   PO_N_COD_ERROR  OUT NUMBER,
                                   PO_V_MSJ_ERROR  OUT VARCHAR2) AS
  BEGIN

    PO_N_COD_ERROR := -1;
    PO_V_MSJ_ERROR := '';

    OPEN PO_CU_RETORNO FOR 
         
      SELECT MU.ANIO || MU.CUM AS NRO_CUM,
             DECODE(PE.TIPO_PERSONA,
                    2,
                    PE.RAZON_SOCIAL,
                    1,
                    PE.APE_PATERNO || ' ' || PE.APE_MATERNO || ' ' ||
                    PE.APE_CASADA || ' ' || PE.PRI_NOMBRE ||
                    DECODE(PE.SEG_NOMBRE, NULL, '', ' ' || PE.SEG_NOMBRE)) AS SANCIONADO,
             MU.ANIO_FILE_AEC || MU.NRO_FILE_AEC AS NRO_FILE,
             TO_CHAR(MU.FEC_INGRESO_AEC, 'YYYY-MM-DD') AS FEC_INGRESO,
             ESM.TXT_DESCRIPCION AS ESTADO_MULTA,
             EE.DESCRIPCION AS ESTADO_EXP,
             MD.VALOR_UIT AS UIT,
             MU.SALDO_TOTAL_DEUDA AS SALDO,
             MU.ID_MULTA,
             MS.ID_MULTA_SANCIONADO
        FROM USR_SICOB.T_SCOB_MULTA MU
       INNER JOIN USR_SICOB.T_SCOB_MULTA_DETAL MD
          ON (MU.ID_MULTA = MD.ID_MULTA AND MD.FLG_ACTUAL = '1')
       INNER JOIN USR_SICOB.T_SCOB_TABLA_DET ESM
          ON (MU.ESTADO_MULTA = ESM.COD_INTERNO AND ESM.ID_TABLA = 5)
       INNER JOIN USR_SICOB.T_SCOB_MULTA_SANCIONADO MS
          ON (MD.ID_MULTA_DETAL = MS.ID_MULTA_DETAL)
       INNER JOIN USR_SICOB.T_SCOB_PERSONA PE
          ON (MS.ID_PERSONA = PE.ID_PERSONA)
        LEFT OUTER JOIN USR_SICOB.T_SCOB_EXPEDIENTE_MULTA EM
          ON (MU.ID_MULTA = EM.ID_MULTA AND
             (EM.ESTADO = '1' OR EM.ESTADO IS NULL))
        LEFT OUTER JOIN USR_SICOB.T_SCOB_EXPEDIENTE EX
          ON (EM.ID_EXPEDIENTE = EX.ID_EXPEDIENTE AND
             (EX.ESTADO = '1' OR EX.ESTADO IS NULL))
        LEFT OUTER JOIN USR_SICOB.T_SCOB_EST_EXP_COB EE
          ON (EX.ESTADO_EXPEDIENTE = EE.CODIGO)
       WHERE MU.ESTADO = '1'
         AND MD.ESTADO = '1'
         AND MS.COD_TIPO_PERSONA = '1'
         AND MS.FLG_PRINCIPAL = '1'
         AND MS.ESTADO = '1'
         AND PE.ID_PERSONA = PI_I_ID_PERSONA;

    
  EXCEPTION
    WHEN OTHERS THEN
      
      PO_N_COD_ERROR := SQLCODE;
      SELECT CASE WHEN PO_N_COD_ERROR > 0 THEN PO_N_COD_ERROR * -1 ELSE PO_N_COD_ERROR END
        INTO PO_N_COD_ERROR
        FROM DUAL;
      PO_V_MSJ_ERROR := SUBSTR(SQLERRM, 1, 250);
    
  END;  
  
  -- ******************************************************************************
  -- Descripción: Procedure que retorna la lista de administrados para el reemplazo
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
  PROCEDURE SCOB_SP_S_ADMIN_REEMPLAZO(PI_V_COD_INDECOPI   IN T_SCOB_PERSONA.COD_SANCIONADO%TYPE,                                       
                                             PI_V_RAZON_SOCIAL   IN T_SCOB_PERSONA.RAZON_SOCIAL%TYPE,
                                             PO_CU_RETORNO       OUT CU_REC_SET,
                                             PO_N_COD_ERROR      OUT NUMBER,
                                             PO_V_MSJ_ERROR      OUT VARCHAR2) AS
                                             
  V_COD_INDECOPI   T_SCOB_PERSONA.COD_SANCIONADO%TYPE;                                      
  V_RAZON_SOCIAL   T_SCOB_PERSONA.RAZON_SOCIAL%TYPE;                                          
  
  BEGIN

    PO_N_COD_ERROR := -1;
    PO_V_MSJ_ERROR := '';
    
    V_COD_INDECOPI   := NVL(PI_V_COD_INDECOPI, ' ');         
    V_RAZON_SOCIAL   := NVL(PI_V_RAZON_SOCIAL, ' ');   

    OPEN PO_CU_RETORNO FOR 
         
      SELECT PE.COD_SANCIONADO AS CODIGO_INDECOPI,
             TP.TXT_DESCRIPCION AS TIPO_PERSONERIA,
             TD.TXT_DESCRIPCION AS TIPO_DOC,
             DECODE(PE.NRO_RUC, NULL, PE.NRO_DOC, PE.NRO_RUC) AS NRO_DOC,
             DECODE(PE.TIPO_PERSONA,
                    2,
                    PE.RAZON_SOCIAL,
                    1,
                    PE.APE_PATERNO || ' ' || PE.APE_MATERNO || ' ' ||
                    PE.APE_CASADA || ' ' || PE.PRI_NOMBRE ||
                    DECODE(PE.SEG_NOMBRE, NULL, '', ' ' || PE.SEG_NOMBRE)) AS ADMINISTRADO,
            PE.ID_PERSONA AS ID_PERSONA
        FROM USR_SICOB.T_SCOB_PERSONA PE
        LEFT JOIN USR_SICOB.T_SCOB_TABLA_DET TP
          ON (PE.TIPO_PERSONA = TP.COD_INTERNO AND TP.ID_TABLA = 11)
        LEFT JOIN USR_SICOB.T_SCOB_TABLA_DET TD
          ON (PE.TIPO_DOC = TD.COD_INTERNO AND TD.ID_TABLA = 10)
       WHERE PE.ESTADO = '1'
         AND (V_COD_INDECOPI = ' ' OR
             (V_COD_INDECOPI <> ' ' AND
             PE.COD_SANCIONADO = LPAD(PI_V_COD_INDECOPI, 10, '0000000000')))
         AND (V_RAZON_SOCIAL = ' ' OR
             (V_RAZON_SOCIAL <> ' ' AND
             (UPPER(PE.RAZON_SOCIAL) LIKE
             UPPER('%' || PI_V_RAZON_SOCIAL || '%') OR
             UPPER(PE.APE_PATERNO) LIKE UPPER('%' || PI_V_RAZON_SOCIAL || '%') OR
             UPPER(PE.APE_MATERNO) LIKE UPPER('%' || PI_V_RAZON_SOCIAL || '%') OR
             UPPER(PE.APE_CASADA) LIKE UPPER('%' || PI_V_RAZON_SOCIAL || '%') OR
             UPPER(PE.PRI_NOMBRE) LIKE UPPER('%' || PI_V_RAZON_SOCIAL || '%') OR
             UPPER(PE.SEG_NOMBRE) LIKE UPPER('%' || PI_V_RAZON_SOCIAL || '%'))));

  EXCEPTION
    WHEN OTHERS THEN
      
      PO_N_COD_ERROR := SQLCODE;
      SELECT CASE WHEN PO_N_COD_ERROR > 0 THEN PO_N_COD_ERROR * -1 ELSE PO_N_COD_ERROR END
        INTO PO_N_COD_ERROR
        FROM DUAL;
      PO_V_MSJ_ERROR := SUBSTR(SQLERRM, 1, 250);
      
 END;
                    
   -- ******************************************************************************
  -- Descripción: Procedure que transfiere los cums al nuevo administrado
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
  PROCEDURE SCOB_SP_U_ADMINISTRADO_CUMS(PI_N_ID_SANCIONADO_ANTIGUO IN T_SCOB_PERSONA.ID_PERSONA%TYPE,
                                        PI_N_ID_ADMINISTRADO_NUEVO IN T_SCOB_PERSONA.ID_PERSONA%TYPE,
                                        PI_V_COD_USUARIO           IN T_SCOB_PERSONA.AUDUSUMODIFICACION%TYPE,
                                        PI_V_IDS_MULTA             IN VARCHAR2,
                                        PI_V_IND_INACTIVAR         IN VARCHAR2,
                                        PO_N_COD_ERROR             OUT NUMBER,
                                        PO_V_MSJ_ERROR             OUT VARCHAR2) AS
                                        

  REG_T_SCOB_MULTA_SANCIONADO T_SCOB_MULTA_SANCIONADO%ROWTYPE;                                      
  REG_T_SCOB_MULTA            T_SCOB_MULTA%ROWTYPE;                                           
  
  CURSOR CURSOR_MULTA_SANCIONADO(P_ID_MULTA NUMBER, P_ID_SANCIONADO_ANTIGUO NUMBER) IS
   SELECT MS.*
     FROM USR_SICOB.T_SCOB_MULTA_SANCIONADO MS
    WHERE MS.ID_MULTA_DETAL IN
          (SELECT EM.ID_MULTA_DETAL
             FROM USR_SICOB.T_SCOB_MULTA_DETAL EM
            WHERE EM.ID_MULTA = P_ID_MULTA)
      AND MS.ID_PERSONA = P_ID_SANCIONADO_ANTIGUO;
         
  BEGIN
                                                                               
    FOR PI_V_ID_MULTA IN (SELECT REGEXP_SUBSTR(PI_V_IDS_MULTA, '[^|]+', 1, LEVEL) VALOR
                FROM DUAL
              CONNECT BY REGEXP_SUBSTR(PI_V_IDS_MULTA, '[^|]+', 1, LEVEL) IS NOT NULL) LOOP
      
      
      OPEN CURSOR_MULTA_SANCIONADO(TO_NUMBER(PI_V_ID_MULTA.VALOR), PI_N_ID_SANCIONADO_ANTIGUO);
      
        LOOP 
            
          FETCH CURSOR_MULTA_SANCIONADO INTO REG_T_SCOB_MULTA_SANCIONADO;
             
          EXIT WHEN CURSOR_MULTA_SANCIONADO%NOTFOUND;    
          
          UPDATE USR_SICOB.T_SCOB_MULTA_SANCIONADO MS 
            SET MS.ID_PERSONA = PI_N_ID_ADMINISTRADO_NUEVO,
            MS.AUDUSUMODIFICACION = PI_V_COD_USUARIO,
            MS. AUDFECMODIFICACION = SYSDATE
            WHERE MS.ID_MULTA_SANCIONADO = REG_T_SCOB_MULTA_SANCIONADO.ID_MULTA_SANCIONADO;
            
          SELECT MULTA.*
             INTO REG_T_SCOB_MULTA
             FROM USR_SICOB.T_SCOB_MULTA MULTA
            WHERE MULTA.ID_MULTA = TO_NUMBER(PI_V_ID_MULTA.VALOR);
          
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
             3,
             TO_NUMBER(PI_V_ID_MULTA.VALOR),
             NULL,
             'T_SCOB_MULTA_SANCIONADO',
             'ID_MULTA_SANCIONADO',
             NULL,
             REG_T_SCOB_MULTA_SANCIONADO.ID_MULTA_SANCIONADO,
             NULL,
             'U',
             'MODIFICACION DEL CUM = ' || REG_T_SCOB_MULTA.CUM 
                    || ' EN SANCIONADO INICIAL ID_PERSONA=' 
                    || PI_N_ID_SANCIONADO_ANTIGUO 
                    || ' REEMPLADO POR ID_PERSONA = ' 
                    || PI_N_ID_ADMINISTRADO_NUEVO,
             PI_V_COD_USUARIO,
             SYSDATE,
             '1');
                 
        END LOOP;
          
      CLOSE CURSOR_MULTA_SANCIONADO;    
      
    END LOOP;

    
    IF PI_V_IND_INACTIVAR = 'S' THEN 
      
      UPDATE USR_SICOB.T_SCOB_PERSONA T
         SET T.ESTADO             = '0',
             T.AUDUSUMODIFICACION = PI_V_COD_USUARIO,
             T.AUDFECMODIFICACION = SYSDATE
       WHERE T.ID_PERSONA = PI_N_ID_SANCIONADO_ANTIGUO;

    END IF;
    
    COMMIT;
    
    PO_N_COD_ERROR := 0;
    PO_V_MSJ_ERROR := 'CONFORME';
                     
  EXCEPTION
    
    WHEN EX_CONTROLADO THEN
      PO_N_COD_ERROR := -1;
      
    WHEN OTHERS THEN
      
      PO_N_COD_ERROR := SQLCODE;
      SELECT CASE WHEN PO_N_COD_ERROR > 0 THEN PO_N_COD_ERROR * -1 ELSE PO_N_COD_ERROR END
        INTO PO_N_COD_ERROR
        FROM DUAL;
      PO_V_MSJ_ERROR := SUBSTR(SQLERRM, 1, 250);
      ROLLBACK;
      
 END;
                      
end SCOB_PK_ADMINISTRADO;
/
