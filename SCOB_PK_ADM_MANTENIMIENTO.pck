CREATE OR REPLACE PACKAGE "SCOB_PK_ADM_MANTENIMIENTO" is

type cu_rec_set is ref cursor;

CONST_TABLA_AREA INTEGER := 1;
CONST_TABLA_CARGO INTEGER := 2;
CONST_TABLA_ESTADO INTEGER := 3;
CONST_TABLA_TIPO_INSTANCIA INTEGER := 4;
--CONST_TABLA_TIPO_DOMICILIO INTEGER := 6;
CONST_TABLA_TIPO_ENT_FINAN INTEGER := 8;
CONST_TABLA_TIPO_DOC_IDENTIDAD INTEGER := 10;
CONST_TABLA_TIPO_PERSONA INTEGER := 11;
CONST_TABLA_TIPO_EMPRESA INTEGER := 12;
CONST_TABLA_CALIFICACION INTEGER := 13;

---

procedure SCOB_SP_S_MATERIA_BY_OR
(
     pi_vc_id  in number, --comodin 0
     po_cu_retorno   out cu_rec_set
);

procedure SCOB_SP_I_MATERIA_BY_OR
(
    pi_v_id_organo_resolutivo in number,
    pi_v_cad_id_materia in varchar2,
    pi_n_cant_items    in number,
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
);

procedure SCOB_SP_D_MATERIA_BY_OR
(
    pi_v_cad_id_org_resol_materia in varchar2,--|1|2|..
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
);

procedure SCOB_SP_S_SEDES_BY_OR
(
     pi_vc_id  in number, --comodin 0
     po_cu_retorno   out cu_rec_set
);

procedure SCOB_SP_D_SEDES_BY_OR
(
    pi_v_cad_id in varchar2,--|1|2|..
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
);

procedure SCOB_SP_I_SEDES_BY_OR
(
    pi_v_id_organo_resolutivo in number,
    pi_v_cad_id_sedes in varchar2,--|1|2|..
    pi_n_cant_items    in number,--NRO DE ITEMS EN LA CADENA
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
);

procedure SCOB_SP_S_SEDES
(
     pi_nu_id_sede  in number, --comodin 0
     pi_vc_codigo  in varchar2, --comodin ''
     pi_vc_descripcion  in varchar2, --comodin ''
     pi_vc_jefe  in varchar2, --comodin ''
     pi_vc_cod_dpto  in varchar2, --comodin ''
     pi_vc_cod_prov  in varchar2, --comodin ''
     pi_vc_cod_dist  in varchar2, --comodin ''
     pi_vc_estado  in varchar2, --comodin ''
     po_cu_retorno   out cu_rec_set
);

procedure SCOB_SP_I_SEDES
(
    pi_v_codigo in varchar2,
    pi_v_descripcion in varchar2,
    pi_v_jefe in varchar2,
    pi_v_cod_dpto in varchar2,
    pi_v_cod_prov in varchar2,
    pi_v_cod_dist in varchar2,
    pi_v_estado in varchar2,
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
);

procedure SCOB_SP_U_SEDES
(
    pi_n_id_sede in number,
    pi_v_codigo in varchar2,
    pi_v_descripcion in varchar2,
    pi_v_jefe in varchar2,
    pi_v_cod_dpto in varchar2,
    pi_v_cod_prov in varchar2,
    pi_v_cod_dist in varchar2,
    pi_v_estado in varchar2,
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
);

procedure SCOB_SP_D_SEDES
(
    pi_v_cad_id in varchar2,--|1|2|..
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
);

procedure SCOB_SP_S_OR
(
     pi_vc_id  in number, --comodin 0
     pi_vc_tip_inst  in number, --comodin 0
     pi_vc_codigo  in varchar2, --comodin ''
     pi_vc_descripcion  in varchar2, --comodin ''
     pi_vc_estado  in char, --comodin ''
     pi_vc_dpto  in varchar2, --comodin ''
     pi_vc_prov  in varchar2, --comodin ''
     pi_vc_dist  in varchar2, --comodin ''
     po_cu_retorno   out cu_rec_set
);

procedure SCOB_SP_I_OR
(
    pi_v_codigo in varchar2,
    pi_v_descripcion in varchar2,
    pi_v_cod_dpto in varchar2,
    pi_v_cod_prov in varchar2,
    pi_v_cod_dist in varchar2,
    pi_v_tipo_instancia in number,
    pi_v_siglas in varchar2,
    pi_v_estado    in char,
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    pi_v_cod_suc_sia   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
);

procedure SCOB_SP_U_OR
(
    pi_n_ide         in number,
    pi_v_codigo      in varchar2,
    pi_v_descripcion in varchar2,
    pi_v_cod_dpto    in varchar2,
    pi_v_cod_prov    in varchar2,
    pi_v_cod_dist    in varchar2,
    pi_v_tipo_instancia in number,
    pi_v_siglas in varchar2,
    pi_v_estado    in char,
    pi_v_audusucrea     in varchar2,
    pi_v_nom_usured     in varchar2,
    pi_v_nom_estred     in varchar2,
    pi_v_aud_ip_lan     in varchar2,
    pi_v_aud_ip_wan     in varchar2,
    pi_v_cod_suc_sia   in varchar2,
    po_n_retorno        out number,
    po_n_cod_error      out number,
    po_v_msj_error      out varchar2
);

procedure SCOB_SP_D_OR
(
    pi_v_cad_id in varchar2,--|1|2|..
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
);



procedure SCOB_SP_S_TIPO_PROCEDIMIENTO
(
     pi_nu_id  in number, --comodin 0
     pi_vc_codigo  in varchar2, --comodin ''
     pi_vc_descripcion  in varchar2, --comodin ''
     pi_vc_estado  in varchar2, --comodin ''
     po_cu_retorno   out cu_rec_set
);

procedure SCOB_SP_I_TIPO_PROCEDIMIENTO
(
    pi_v_codigo in varchar2,
    pi_v_descripcion in varchar2,
    pi_v_cod_dpto in varchar2,
    pi_v_cod_prov in varchar2,
    pi_v_cod_dist in varchar2,
    pi_v_estado in varchar2,
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
);

procedure SCOB_SP_U_TIPO_PROCEDIMIENTO
(
    pi_v_id in number,
    pi_v_codigo in varchar2,
    pi_v_descripcion in varchar2,
    pi_v_cod_dpto in varchar2,
    pi_v_cod_prov in varchar2,
    pi_v_cod_dist in varchar2,
    pi_v_estado in varchar2,
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
);

procedure SCOB_SP_D_TIPO_PROCEDIMIENTO
(
    pi_v_cad_id in varchar2,--|1|2|..
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
);

procedure SCOB_SP_S_MATERIA
(
     pi_nu_id_materia  in number, --comodin 0
     pi_nu_id_tipo_proc  in number, --comodin 0
     pi_vc_codigo  in varchar2, --comodin ''
     pi_vc_descripcion  in varchar2, --comodin ''
     pi_vc_abreviatura  in varchar2, --comodin ''
     pi_vc_estado  in varchar2, --comodin ''
     po_cu_retorno   out cu_rec_set
);

procedure SCOB_SP_I_MATERIA
(
    pi_n_id_tipo_procedimiento in number,
    pi_v_codigo      in varchar2,
    pi_v_descripcion      in varchar2,
    pi_v_abreviatura      in varchar2,
    --pi_n_pla_apelacion      in integer,
    pi_n_pla_revision      in integer,
    pi_v_motivo_web        in varchar2,
    pi_v_estado      in varchar2,
    pi_v_audusucrea      in varchar2,
    --pi_v_nom_usured    in varchar2,
    --pi_v_nom_estred    in varchar2,
    --pi_v_aud_ip_lan   in varchar2,
    --pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
);

procedure SCOB_SP_D_MATERIA
(
    pi_v_cad_id in varchar2,--|1|2|..
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
);

procedure SCOB_SP_U_MATERIA
(
    pi_v_id in number,
    pi_v_id_tipo_procedimiento in number,
    pi_v_codigo      in varchar2,
    pi_v_descripcion      in varchar2,
    pi_v_abreviatura      in varchar2,
    --pi_n_pla_apelacion      in integer,
    pi_n_pla_revision      in integer,
    pi_v_motivo_web        in varchar2,
    pi_v_estado      in varchar2,
    pi_v_audusucrea      in varchar2,
    --pi_v_nom_usured    in varchar2,
    --pi_v_nom_estred    in varchar2,
    --pi_v_aud_ip_lan   in varchar2,
    --pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
);

procedure SCOB_SP_S_DESCUENTO
(
     pi_nu_id_descuento  in number, --comodin 0
     pi_nu_id_materia in number,--comodin 0
     pi_vc_codigo  in varchar2, --comodin ''
     pi_vc_estado  in varchar2, --comodin ''
     po_cu_retorno   out cu_rec_set
);

procedure SCOB_SP_I_DESCUENTO
(
    pi_v_id_materia in number,
    pi_v_codigo      in varchar2,
    pi_d_fec_ini      in varchar2,
    pi_d_fec_fin      in varchar2,
    pi_n_nro_dias      in integer,
    pi_n_por_dscto      in number,
    --pi_v_estado      in varchar2,
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
);

procedure SCOB_SP_U_DESCUENTO
(
    pi_v_id in number,
    pi_v_id_materia in number,
    pi_v_codigo      in varchar2,
    pi_d_fec_ini      in varchar2,
    pi_d_fec_fin      in varchar2,
    pi_n_nro_dias      in integer,
    pi_n_por_dscto      in number,
    --pi_v_estado      in varchar2,
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
);

procedure SCOB_SP_D_DESCUENTO
(
    pi_v_cad_id in varchar2,--|1|2|..
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
);

procedure SCOB_SP_S_AREA_COBRANZA
(
     pi_vc_id  in number, --comodin 0
     pi_vc_codigo  in varchar2, --comodin ''
     pi_vc_descripcion  in varchar2, --comodin ''
     pi_vc_estado  in char, --comodin ''
     pi_vc_dpto  in varchar2, --comodin ''
     pi_vc_prov  in varchar2, --comodin ''
     pi_vc_dist  in varchar2, --comodin ''
     po_cu_retorno   out cu_rec_set
);

procedure SCOB_SP_I_AREA_COBRANZA
(
    pi_v_codigo      in varchar2,
    pi_v_descripcion      in varchar2,
    pi_v_cod_dpto      in varchar2,
    pi_v_cod_prov      in varchar2,
    pi_v_cod_dist      in varchar2,

    pi_v_direccion      in varchar2,
    pi_v_telefono      in varchar2,
    pi_v_anexo      in varchar2,
    pi_v_contacto      in varchar2,

    pi_v_estado      in varchar2,
    pi_v_sigla      in varchar2,
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
);

procedure SCOB_SP_U_AREA_COBRANZA
(
    pi_n_id_area_cobranza      in number,
    pi_v_codigo      in varchar2,
    pi_v_descripcion      in varchar2,
    pi_v_cod_dpto      in varchar2,
    pi_v_cod_prov      in varchar2,
    pi_v_cod_dist      in varchar2,

    pi_v_direccion      in varchar2,
    pi_v_telefono      in varchar2,
    pi_v_anexo      in varchar2,
    pi_v_contacto      in varchar2,

    pi_v_estado      in varchar2,
    pi_v_siglas      in varchar2,
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
);

procedure SCOB_SP_D_AREA_COBRANZA
(
    pi_v_cad_id in varchar2,--|1|2|..
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
);

procedure SCOB_SP_S_OR_BY_AREA_COBRA
(
     pi_vc_id_area_cobra  in number, --comodin 0
     po_cu_retorno   out cu_rec_set
);

procedure SCOB_SP_I_OR_BY_AREA_COBRA
(
    pi_v_id_area_cobra in number,
    pi_v_cad_id_or in varchar2,--|1|2|..
    pi_n_cant_items    in number,--NRO DE ITEMS EN LA CADENA
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
);

procedure SCOB_SP_D_OR_BY_AREA_COBRA
(
    pi_v_cad_id in varchar2,--|1|2|..
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
);

procedure SCOB_SP_S_AREA_ADMINISTRATIVA
(
     pi_vc_id  in number, --comodin 0
     pi_vc_codigo  in varchar2, --comodin ''
     pi_vc_descripcion  in varchar2, --comodin ''
     pi_vc_estado  in char, --comodin ''
     pi_vc_dpto  in varchar2, --comodin ''
     pi_vc_prov  in varchar2, --comodin ''
     pi_vc_dist  in varchar2, --comodin ''
     po_cu_retorno   out cu_rec_set
);

procedure SCOB_SP_I_AREA_ADMINISTRATIVA
(
    pi_v_codigo      in varchar2,
    pi_v_descripcion      in varchar2,
    pi_v_cod_dpto      in varchar2,
    pi_v_cod_prov      in varchar2,
    pi_v_cod_dist      in varchar2,
    pi_v_direccion      in varchar2,
    pi_v_telefono      in varchar2,
    pi_v_anexo      in varchar2,
    pi_v_contacto      in varchar2,
    pi_v_estado      in varchar2,
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
);

procedure SCOB_SP_U_AREA_ADMINISTRATIVA
(
    pi_n_id      in number,
    pi_v_codigo      in varchar2,
    pi_v_descripcion      in varchar2,
    pi_v_cod_dpto      in varchar2,
    pi_v_cod_prov      in varchar2,
    pi_v_cod_dist      in varchar2,
    pi_v_direccion      in varchar2,
    pi_v_telefono      in varchar2,
    pi_v_anexo      in varchar2,
    pi_v_contacto      in varchar2,
    pi_v_estado      in varchar2,
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
);

procedure SCOB_SP_D_AREA_ADMINISTRATIVA
(
    pi_v_cad_id in varchar2,--|1|2|..
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
);

PROCEDURE SCOB_SP_S_CARGO(
   PI_ID_CARGO IN NUMBER,
   PI_COD_INTERNO IN  VARCHAR2,
   PI_DESCRIPCION IN  VARCHAR2,
   /**PI_COD_INTERNO  IN  VARCHAR2,
   PI_DESCRIPCION  IN  VARCHAR2,*/
   PI_COD_AREA IN  VARCHAR2,
   po_cu_retorno  OUT cu_rec_set
);

procedure SCOB_SP_I_CARGO
(
    pi_v_codigo      in varchar2,
    pi_v_descripcion      in varchar2,
    pi_v_area      in varchar2,
    pi_v_audusucrea      in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
);

procedure SCOB_SP_U_CARGO
(
    pi_n_id_cargo in number,
    pi_v_codigo in varchar2,
    pi_v_descripcion in varchar2,
    pi_v_area in varchar2,
    pi_v_audusucrea      in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
);

procedure SCOB_SP_D_CARGO
(
    pi_v_cad_id in varchar2,--|1|2|..
    pi_v_audusucrea      in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
);

PROCEDURE SCOB_SP_S_TIPO_DOMICILIO(
   PI_ID IN NUMBER,
   PI_COD_INTERNO IN  VARCHAR2,
   PI_DESCRIPCION IN  VARCHAR2,
   po_cu_retorno  OUT cu_rec_set
);

procedure SCOB_SP_S_GESTOR_COBRANZA
(
    po_cu_retorno   out cu_rec_set
);

procedure SCOB_SP_I_TIPO_DOMICILIO
(
    pi_v_codigo      in varchar2,
    pi_v_descripcion      in varchar2,
    pi_v_audusucrea      in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
);

procedure SCOB_SP_U_TIPO_DOMICILIO
(
    pi_n_id in number,
    pi_v_codigo in varchar2,
    pi_v_descripcion in varchar2,
    pi_v_audusucrea      in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
);

procedure SCOB_SP_D_TIPO_DOMICILIO
(
    pi_v_cad_id in varchar2,--|1|2|..
    pi_v_audusucrea      in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
);

procedure SCOB_SP_S_UIT
(
     pi_n_id  in number, --comodin 0
     po_cu_retorno   out cu_rec_set
);

procedure SCOB_SP_I_UIT
(
    pi_v_descripcion in varchar2,
    pi_v_nro_norma in varchar2,
    pi_v_fecha_inicio in varchar2,
    pi_v_fecha_fin in varchar2,
    pi_n_monto_uit in number,
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
);

procedure SCOB_SP_U_UIT
(
    pi_n_id in number,
    pi_v_descripcion in varchar2,
    pi_v_nro_norma in varchar2,
    pi_v_fecha_inicio in varchar2,
    pi_v_fecha_fin in varchar2,
    pi_n_monto_uit in number,
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
);

procedure SCOB_SP_D_UIT
(
    pi_v_cad_id in varchar2,--|1|2|..
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
);

procedure SCOB_SP_S_TILE
(
     pi_n_id  in number, --comodin 0
     po_cu_retorno   out cu_rec_set
);

procedure SCOB_SP_I_TILE
(
    pi_v_descripcion in varchar2,
    pi_v_nro_norma in varchar2,
    pi_v_fecha_inicio in varchar2,
    pi_v_fecha_fin in varchar2,
    pi_n_monto in number,
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
);

procedure SCOB_SP_U_TILE
(
    pi_n_id in number,
    pi_v_descripcion in varchar2,
    pi_v_nro_norma in varchar2,
    pi_v_fecha_inicio in varchar2,
    pi_v_fecha_fin in varchar2,
    pi_n_monto in number,
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
);

procedure SCOB_SP_D_TILE
(
    pi_v_cad_id in varchar2,--|1|2|..
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
);

procedure SCOB_SP_S_TIPO_CAMBIO
(
     pi_n_id  in number, --comodin 0
     po_cu_retorno   out cu_rec_set
);

procedure SCOB_SP_I_TIPO_CAMBIO
(
    pi_v_descripcion in varchar2,
    pi_v_fecha_inicio in varchar2,
    pi_v_fecha_fin in varchar2,
    pi_n_monto in number,
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
);

procedure SCOB_SP_U_TIPO_CAMBIO
(
    pi_n_id in number,
    pi_v_descripcion in varchar2,
    pi_v_fecha_inicio in varchar2,
    pi_v_fecha_fin in varchar2,
    pi_n_monto in number,
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
);

procedure SCOB_SP_D_TIPO_CAMBIO
(
    pi_v_cad_id in varchar2,--|1|2|..
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
);

procedure SCOB_SP_S_FACTOR_DIARIO
(
     pi_n_id  in number, --comodin 0
     po_cu_retorno   out cu_rec_set
);

procedure SCOB_SP_I_FACTOR_DIARIO
(
    pi_v_descripcion in varchar2,
    pi_v_fecha_inicio in varchar2,
    pi_v_fecha_fin in varchar2,
    pi_n_monto in number,
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
);

procedure SCOB_SP_U_FACTOR_DIARIO
(
    pi_n_id in number,
    pi_v_descripcion in varchar2,
    pi_v_fecha_inicio in varchar2,
    pi_v_fecha_fin in varchar2,
    pi_n_monto in number,
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
);

procedure SCOB_SP_D_FACTOR_DIARIO
(
    pi_v_cad_id in varchar2,--|1|2|..
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
);

procedure SCOB_SP_S_ENT_FINANCIERA
(
     pi_n_id  in number, --comodin 0
     pi_v_nombre  in varchar2, --comodin ''
     pi_v_tip_ent_financiera  in varchar2, --comodin ''
     pi_v_estado  in varchar2, --comodin ''
     po_cu_retorno   out cu_rec_set
);

procedure SCOB_SP_I_ENT_FINANCIERA
(
    pi_v_nombre in varchar2,
    pi_v_direccion in varchar2,
    pi_v_contacto in varchar2,
    pi_v_tip_ent_financiera in varchar2,
    pi_v_estado in varchar2,
    pi_n_saldo_minimo_envio_bco in number,
    pi_v_audusucrea in varchar2,
    pi_v_nom_usured in varchar2,
    pi_v_nom_estred in varchar2,
    pi_v_aud_ip_lan in varchar2,
    pi_v_aud_ip_wan in varchar2,
    po_n_retorno out number,
    po_n_cod_error out number,
    po_v_msj_error out varchar2
);

procedure SCOB_SP_U_ENT_FINANCIERA
(
    pi_n_id in number,
    pi_v_nombre in varchar2,
    pi_v_direccion in varchar2,
    pi_v_contacto in varchar2,
    pi_v_tip_ent_financiera in varchar2,
    pi_v_estado in varchar2,
    pi_n_saldo_minimo_envio_bco in number,
    pi_v_audusucrea in varchar2,
    pi_v_nom_usured in varchar2,
    pi_v_nom_estred in varchar2,
    pi_v_aud_ip_lan in varchar2,
    pi_v_aud_ip_wan in varchar2,
    po_n_retorno out number,
    po_n_cod_error out number,
    po_v_msj_error out varchar2
);

procedure SCOB_SP_D_ENT_FINANCIERA
(
    pi_v_cad_id in varchar2,--|1|2|..
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
);

procedure SCOB_SP_S_PARTIDA
(
     pi_n_id  in number, --comodin 0
     pi_v_codigo  in varchar2, --comodin ''
     pi_v_descripcion  in varchar2, --comodin ''
     pi_v_estado  in varchar2, --comodin ''
     po_cu_retorno   out cu_rec_set
);

procedure SCOB_SP_I_PARTIDA
(
    pi_v_codigo in varchar2,
    pi_v_descripcion in varchar2,
    pi_v_estado in varchar2,
    pi_v_audusucrea in varchar2,
    pi_v_nom_usured in varchar2,
    pi_v_nom_estred in varchar2,
    pi_v_aud_ip_lan in varchar2,
    pi_v_aud_ip_wan in varchar2,
    po_n_retorno out number,
    po_n_cod_error out number,
    po_v_msj_error out varchar2
);

procedure SCOB_SP_U_PARTIDA
(
    pi_n_id in number,
    pi_v_codigo in varchar2,
    pi_v_descripcion in varchar2,
    pi_v_estado in varchar2,
    pi_v_audusucrea in varchar2,
    pi_v_nom_usured in varchar2,
    pi_v_nom_estred in varchar2,
    pi_v_aud_ip_lan in varchar2,
    pi_v_aud_ip_wan in varchar2,
    po_n_retorno out number,
    po_n_cod_error out number,
    po_v_msj_error out varchar2
);

procedure SCOB_SP_D_PARTIDA
(
    pi_v_cad_id in varchar2,--|1|2|..
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
);

procedure SCOB_SP_S_FERIADO
(
     pi_n_id  in number, --comodin 0
     pi_v_fecferiado  in varchar2, --comodin ''
     pi_v_fecferiado2  in varchar2, --comodin ''
     pi_v_descripcion  in varchar2, --comodin ''
     pi_v_estado  in varchar2, --comodin ''
     pi_v_regional  in varchar2, --comodin ''
     po_cu_retorno   out cu_rec_set
);

procedure SCOB_SP_I_FERIADO
(
    pi_v_fecha in varchar2,
    pi_v_descripcion in varchar2,
    pi_v_estado in varchar2,
    pi_v_regional in varchar2,
    pi_v_audusucrea in varchar2,
    po_n_retorno out number,
    po_n_cod_error out number,
    po_v_msj_error out varchar2
);

procedure SCOB_SP_U_FERIADO
(
    pi_n_id in number,
    pi_v_fecha in varchar2,
    pi_v_descripcion in varchar2,
    pi_v_estado in varchar2,
    pi_v_regional in varchar2,
    pi_v_audusucrea in varchar2,
    po_n_retorno out number,
    po_n_cod_error out number,
    po_v_msj_error out varchar2
);

procedure SCOB_SP_D_FERIADO
(
    pi_v_cad_id in varchar2,--|1|2|..
    pi_v_audusucrea      in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
);

procedure SCOB_SP_S_COSTA
(
     pi_n_id  in number, --comodin 0
     pi_v_codigo  in varchar2, --comodin ''
     pi_v_descripcion  in varchar2, --comodin ''
     pi_v_estado  in varchar2, --comodin ''
     po_cu_retorno   out cu_rec_set
);

procedure SCOB_SP_I_COSTA
(
    pi_v_codigo in varchar2,
    pi_v_descripcion in varchar2,
    pi_n_porcentaje_uit in number,
    pi_n_porcentaje_max in number,
    pi_c_ind_uit_max in char,
    pi_n_valor_soles in number,
    pi_v_estado in varchar2,
    pi_v_audusucrea in varchar2,
    pi_v_nom_usured in varchar2,
    pi_v_nom_estred in varchar2,
    pi_v_aud_ip_lan in varchar2,
    pi_v_aud_ip_wan in varchar2,
    po_n_retorno out number,
    po_n_cod_error out number,
    po_v_msj_error out varchar2
);

procedure SCOB_SP_U_COSTA
(
    pi_n_id in number,
    pi_v_codigo in varchar2,
    pi_v_descripcion in varchar2,
    pi_n_porcentaje_uit in number,
    pi_n_porcentaje_max in number,
    pi_c_ind_uit_max in char,
    pi_n_valor_soles in number,
    pi_v_estado in varchar2,
    pi_v_audusucrea in varchar2,
    pi_v_nom_usured in varchar2,
    pi_v_nom_estred in varchar2,
    pi_v_aud_ip_lan in varchar2,
    pi_v_aud_ip_wan in varchar2,
    po_n_retorno out number,
    po_n_cod_error out number,
    po_v_msj_error out varchar2
);

procedure SCOB_SP_D_COSTA
(
    pi_v_cad_id in varchar2,--|1|2|..
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
);

procedure SCOB_SP_S_EST_EXP_COB
(
     pi_n_id  in number, --comodin 0
     pi_v_codigo  in varchar2, --comodin ''
     pi_v_descripcion  in varchar2, --comodin ''
     pi_v_estado  in varchar2, --comodin ''
     po_cu_retorno   out cu_rec_set
);

procedure SCOB_SP_I_EST_EXP_COB
(
    pi_v_codigo in varchar2,
    pi_v_descripcion in varchar2,
    pi_v_estado in varchar2,
    pi_v_audusucrea in varchar2,
    pi_v_nom_usured in varchar2,
    pi_v_nom_estred in varchar2,
    pi_v_aud_ip_lan in varchar2,
    pi_v_aud_ip_wan in varchar2,
    po_n_retorno out number,
    po_n_cod_error out number,
    po_v_msj_error out varchar2
);

procedure SCOB_SP_U_EST_EXP_COB
(
    pi_n_id in number,
    pi_v_codigo in varchar2,
    pi_v_descripcion in varchar2,
    pi_v_estado in varchar2,
    pi_v_audusucrea in varchar2,
    pi_v_nom_usured in varchar2,
    pi_v_nom_estred in varchar2,
    pi_v_aud_ip_lan in varchar2,
    pi_v_aud_ip_wan in varchar2,
    po_n_retorno out number,
    po_n_cod_error out number,
    po_v_msj_error out varchar2
);

procedure SCOB_SP_D_EST_EXP_COB
(
    pi_v_cad_id in varchar2,--|1|2|..
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
);

procedure SCOB_SP_S_EST_EXP_COB_MOT
(
     pi_n_id  in number, --comodin 0
     pi_n_id_est_exp_cob  in number, --comodin 0
     pi_v_codigo  in varchar2, --comodin ''
     pi_v_descripcion  in varchar2, --comodin ''
     pi_v_estado  in varchar2, --comodin ''
     pi_v_flg_no_editable  in char, --comodin ''
     po_cu_retorno   out cu_rec_set
);

procedure SCOB_SP_I_EST_EXP_COB_MOT
(
    pi_n_id_est_exp_cob in number,
    pi_v_codigo in varchar2,
    pi_v_descripcion in varchar2,
    pi_v_estado in varchar2,
    pi_v_audusucrea in varchar2,
    pi_v_nom_usured in varchar2,
    pi_v_nom_estred in varchar2,
    pi_v_aud_ip_lan in varchar2,
    pi_v_aud_ip_wan in varchar2,
    po_n_retorno out number,
    po_n_cod_error out number,
    po_v_msj_error out varchar2
);

procedure SCOB_SP_U_EST_EXP_COB_MOT
(
    pi_n_id in number,
    pi_n_id_est_exp_cob in number,
    pi_v_codigo in varchar2,
    pi_v_descripcion in varchar2,
    pi_v_estado in varchar2,
    pi_v_audusucrea in varchar2,
    pi_v_nom_usured in varchar2,
    pi_v_nom_estred in varchar2,
    pi_v_aud_ip_lan in varchar2,
    pi_v_aud_ip_wan in varchar2,
    po_n_retorno out number,
    po_n_cod_error out number,
    po_v_msj_error out varchar2
);

procedure SCOB_SP_D_EST_EXP_COB_MOT
(
    pi_v_cad_id in varchar2,--|1|2|..
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
);

procedure SCOB_SP_S_PLANTI_BY_MOTIVO
(
     pi_n_id_motivo_estado     in T_SCOB_EXPEDIENTE.ID_MOTIVO%TYPE,
     pi_n_estado_expediente    in T_SCOB_EXPEDIENTE.ESTADO_EXPEDIENTE%TYPE,
     pi_n_tip_documento        in T_SCOB_TIPO_DOCUMENTO.ID_TIPO_DOCUMENTO%TYPE,
     pi_i_sub_tip_documento    in T_SCOB_TIPO_DOCUMENTO.COD_SUBTIPO_DOCUMENTO%TYPE,
     pi_n_id_plantilla_rec     in T_SCOB_PLANTILLA.ID_PLANTILLA_RESOLUCION%TYPE,
     po_cu_retorno             out cu_rec_set
);

procedure SCOB_SP_S_PLANTI_SIN_MOTIVO
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 04.04.2012
-- Proposito    : LISTA PLANTILLAS NO ASOCIADOS A ESTADOS O MOTIVOS
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
     pi_n_tip_documento        in T_SCOB_TIPO_DOCUMENTO.ID_TIPO_DOCUMENTO%TYPE,
     pi_i_sub_tip_documento    in T_SCOB_TIPO_DOCUMENTO.COD_SUBTIPO_DOCUMENTO%TYPE,
     pi_n_id_plantilla_rec     in T_SCOB_PLANTILLA.ID_PLANTILLA_RESOLUCION%TYPE,
     po_cu_retorno             out cu_rec_set
);


procedure SCOB_SP_I_PLANTI_BY_MOTIVO
(
    pi_n_id_motivo in number,
    pi_v_cad_id_plantilla in varchar2,--|1|2|..
    pi_n_cant_items    in number,--NRO DE ITEMS EN LA CADENA
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
);

procedure SCOB_SP_D_PLANTI_BY_MOTIVO
(
    pi_v_cad_id in varchar2,--|1|2|..
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
);

procedure SCOB_SP_S_PLANTILLA
(
     pi_n_id  in number, --comodin 0
     pi_n_id_tip_doc  in number, -- NUEVO!! comodin 0
     pi_v_codigo  in varchar2, --comodin ''
     pi_v_descripcion  in varchar2, --comodin ''
     pi_v_estado  in varchar2, --comodin ''
     po_cu_retorno   out cu_rec_set
);

/**procedure SCOB_SP_S_EST_MUL_COB
(
     pi_n_id  in number, --comodin 0
     pi_v_codigo  in varchar2, --comodin ''
     pi_v_descripcion  in varchar2, --comodin ''
     pi_v_estado  in varchar2, --comodin ''
     po_cu_retorno   out cu_rec_set
);*/

/**procedure SCOB_SP_I_EST_MUL_COB
(
    pi_v_codigo in varchar2,
    pi_v_descripcion in varchar2,
    pi_v_estado in varchar2,
    pi_v_audusucrea in varchar2,
    pi_v_nom_usured in varchar2,
    pi_v_nom_estred in varchar2,
    pi_v_aud_ip_lan in varchar2,
    pi_v_aud_ip_wan in varchar2,
    po_n_retorno out number,
    po_n_cod_error out number,
    po_v_msj_error out varchar2
);*/

/**procedure SCOB_SP_U_EST_MUL_COB
(
    pi_n_id in number,
    pi_v_codigo in varchar2,
    pi_v_descripcion in varchar2,
    pi_v_estado in varchar2,
    pi_v_audusucrea in varchar2,
    pi_v_nom_usured in varchar2,
    pi_v_nom_estred in varchar2,
    pi_v_aud_ip_lan in varchar2,
    pi_v_aud_ip_wan in varchar2,
    po_n_retorno out number,
    po_n_cod_error out number,
    po_v_msj_error out varchar2
);*/

/**procedure SCOB_SP_D_EST_MUL_COB
(
    pi_v_cad_id in varchar2,--|1|2|..
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
);*/

procedure SCOB_SP_S_EST_MUL_COB_MOT
(
     pi_n_id  in number, --comodin 0
     pi_n_id_est_mul_cob  in number, --comodin 0
     pi_v_codigo  in varchar2, --comodin ''
     pi_v_descripcion  in varchar2, --comodin ''
     pi_v_estado  in varchar2, --comodin ''
     po_cu_retorno   out cu_rec_set
);

procedure SCOB_SP_I_EST_MUL_COB_MOT
(
    pi_n_id_est_mul_cob in number,
    pi_v_codigo in varchar2,
    pi_v_descripcion in varchar2,
    pi_v_estado in varchar2,
    pi_v_audusucrea in varchar2,
    pi_v_nom_usured in varchar2,
    pi_v_nom_estred in varchar2,
    pi_v_aud_ip_lan in varchar2,
    pi_v_aud_ip_wan in varchar2,
    po_n_retorno out number,
    po_n_cod_error out number,
    po_v_msj_error out varchar2
);

procedure SCOB_SP_U_EST_MUL_COB_MOT
(
    pi_n_id in number,
    pi_n_id_est_mul_cob in number,
    pi_v_codigo in varchar2,
    pi_v_descripcion in varchar2,
    pi_v_estado in varchar2,
    pi_v_audusucrea in varchar2,
    pi_v_nom_usured in varchar2,
    pi_v_nom_estred in varchar2,
    pi_v_aud_ip_lan in varchar2,
    pi_v_aud_ip_wan in varchar2,
    po_n_retorno out number,
    po_n_cod_error out number,
    po_v_msj_error out varchar2
);

procedure SCOB_SP_D_EST_MUL_COB_MOT
(
    pi_v_cad_id in varchar2,--|1|2|..
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
);

procedure SCOB_SP_S_MUL_PLANTI_BY_MOTIVO
(
     pi_n_id_motivo  in number, --0
     pi_i_estado     in integer, --0
     po_cu_retorno   out cu_rec_set
);

procedure SCOB_SP_I_MUL_PLANTI_BY_MOTIVO
(
    pi_n_id_motivo in number,
    pi_v_cad_id_plantilla in varchar2,--|1|2|..
    pi_n_cant_items    in number,--NRO DE ITEMS EN LA CADENA
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
);

procedure SCOB_SP_D_MUL_PLANTI_BY_MOTIVO
(
    pi_v_cad_id in varchar2,--|1|2|..
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
);

procedure SCOB_SP_S_ALERTA
(
     pi_n_id  in number, --comodin 0
     pi_v_estado in varchar2,
     po_cu_retorno   out cu_rec_set
);
procedure SCOB_SP_U_ALERTA
(
    pi_n_id in number,
    pi_v_Descripcion in varchar2,
    pi_n_valor in integer,
    pi_n_valor_med in integer,
    pi_n_valor_alt in integer,
    pi_n_unidad in integer,
    pi_v_estado in varchar2,
    pi_v_ind_calculo_calendario in char,
    pi_v_audusucrea in varchar2,
    pi_v_nom_usured in varchar2,
    pi_v_nom_estred in varchar2,
    pi_v_aud_ip_lan in varchar2,
    pi_v_aud_ip_wan in varchar2,
    po_n_retorno out number,
    po_n_cod_error out number,
    po_v_msj_error out varchar2
);

procedure SCOB_SP_S_SECTOR_ECONOMICO
(
     po_cu_retorno   out cu_rec_set
);

procedure SCOB_SP_S_TIPO_DOCUMENTO
(
    pi_n_id in number,
    pi_i_subtipo_documento t_scob_tipo_documento.cod_subtipo_documento%type,
    pi_v_codigo in varchar2,
    pi_v_descripcion in varchar2,
    pi_v_estado in varchar2,
    po_cu_retorno   out cu_rec_set
);

procedure SCOB_SP_S_TIPO_DOCUMENTO_DOC
(
    pi_n_id in number,
    pi_i_subtipo_documento t_scob_tipo_documento.cod_subtipo_documento%type,
    pi_v_codigo in varchar2,
    pi_v_descripcion in varchar2,
    pi_v_estado in varchar2,
    po_cu_retorno   out cu_rec_set
);


procedure SCOB_SP_S_PLANTI_BY_TIP_DOC
(
     pi_v_tip_documento in varchar2,--pi_v_tip_documento in number,
     po_cu_retorno   out cu_rec_set
);

---------------------------------------------
procedure SCOB_SP_S_CONS_PLANTILLA_MULTA
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 26.05.2011
-- Proposito    : consultar las plantillas registradas para una multa
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_I_COD_TIPO_PLANTILLA                  IN T_SCOB_PLANTILLA.COD_TIPO_PLANTILLA%TYPE,
  PI_V_DESCRIPCION                         IN T_SCOB_PLANTILLA.DESCRIPCION%TYPE,
  PI_I_ID_MOTIVO                           IN T_SCOB_EST_MUL_COB_MOTIVO.ID_MOTIVO%TYPE,
  PI_I_COD_ESTADO                          IN INTEGER, --DEL ESTADO DE LA MULTA Y DEL EXPEDIENTE
  po_cu_retorno                            out cu_rec_set
);

procedure SCOB_SP_S_CONS_PLANTILLA_EXPED
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 26.05.2011
-- Proposito    : consultar las plantillas registradas para un expediente
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_I_COD_TIPO_PLANTILLA                  IN T_SCOB_PLANTILLA.COD_TIPO_PLANTILLA%TYPE,
  PI_V_DESCRIPCION                         IN T_SCOB_PLANTILLA.DESCRIPCION%TYPE,
  PI_I_ID_MOTIVO                           IN T_SCOB_EST_MUL_COB_MOTIVO.ID_MOTIVO%TYPE,
  PI_I_COD_ESTADO                          IN INTEGER, --DEL ESTADO DE LA MULTA Y DEL EXPEDIENTE
  PI_I_COD_SUBTIPO_DOCUMENTO               IN T_SCOB_TIPO_DOCUMENTO.COD_SUBTIPO_DOCUMENTO%TYPE,
  PI_V_COD_TIPO_DOCUMENTO                  IN T_SCOB_TIPO_DOCUMENTO.COD_TIPO_DOCUMENTO%TYPE,
  po_cu_retorno                            out cu_rec_set
);

procedure SCOB_SP_S_PLANTILLA_BY_SUBTIPO
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 26.05.2011
-- Proposito    : consultar las plantillas registradas por sub-tipo-de-documento
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_I_COD_SUBTIPO_DOCUMENTO               IN T_SCOB_TIPO_DOCUMENTO.COD_SUBTIPO_DOCUMENTO%TYPE,
  PI_C_TIPO_ENTIDAD                        IN CHAR,
  PI_I_COD_ESTADO                          IN INTEGER,
  PI_N_ID_MOTIVO                           IN NUMBER,
  po_cu_retorno                            out cu_rec_set
);

procedure SCOB_SP_I_PLANTILLA_MULT_EXPED
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 26.05.2011
-- Proposito    : insertar plantillas de multas o expedientes
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_C_TIPO_EVENTO                          IN T_SCOB_PLANTILLA.IND_ASOC_PLANTILLA%TYPE,
                                            --1=MULTA;2=EXPEDIENTE;
  --
  PI_V_CODIGO                               IN T_SCOB_PLANTILLA.CODIGO%TYPE,
  PI_V_DESCRIPCION                          IN T_SCOB_PLANTILLA.DESCRIPCION%TYPE,
  PI_V_NOM_CORTO                            IN T_SCOB_PLANTILLA.NOM_CORTO%TYPE,

  PI_I_COD_TIPO_PLANTILLA                   IN T_SCOB_PLANTILLA.COD_TIPO_PLANTILLA%TYPE,
  PI_I_COD_SUBTIPO_DOCUMENTO                IN T_SCOB_TIPO_DOCUMENTO.COD_SUBTIPO_DOCUMENTO%TYPE,
  PI_N_ID_TIPO_DOCUMENTO                    IN T_SCOB_PLANTILLA.ID_TIPO_DOCUMENTO%TYPE,
  PI_N_ID_MOTIVO                            IN NUMBER,
  PI_I_COD_ESTADO_MUL_EXP                   IN INTEGER,
  PI_V_NOMBRE                               IN T_SCOB_PLANTILLA.NOM_ARCHIVO%TYPE,
  PI_N_ID_PLANTILLA_RESOLUCION              IN T_SCOB_PLANTILLA.ID_PLANTILLA%TYPE,
  --
  PI_V_AUDUSUCREACION                       IN T_SCOB_PLANTILLA.AUDUSUCREACION%TYPE,
  --
  po_n_retorno                              out number,
  po_n_cod_error                            out number,
  po_v_msj_error                            out varchar2
);

procedure SCOB_SP_U_PLANTILLA_MULT_EXPED
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 26.05.2011
-- Proposito    : actualiza plantillas de multas o expedientes
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  --PI_C_TIPO_EVENTO                     IN T_SCOB_PLANTILLA.IND_ASOC_PLANTILLA%TYPE, --NVO
  PI_N_ID_PLANTILLA                    IN T_SCOB_PLANTILLA.ID_PLANTILLA%TYPE,
  PI_V_CODIGO                          IN T_SCOB_PLANTILLA.CODIGO%TYPE,
  PI_V_DESCRIPCION                     IN T_SCOB_PLANTILLA.DESCRIPCION%TYPE,
  PI_V_NOM_CORTO                       IN T_SCOB_PLANTILLA.NOM_CORTO%TYPE,
  PI_V_NOMBRE                          IN T_SCOB_PLANTILLA.NOM_ARCHIVO%TYPE,
  ---
  --PI_N_ID_TIPO_DOCUMENTO               IN T_SCOB_PLANTILLA.ID_TIPO_DOCUMENTO%TYPE,
  --PI_I_COD_TIPO_PLANTILLA              IN T_SCOB_PLANTILLA.COD_TIPO_PLANTILLA%TYPE,
  --PI_N_ID_MOTIVO                       IN NUMBER,
  --PI_I_COD_ESTADO_MUL_EXP              IN INTEGER,
  ----
  PI_V_AUDUSUMODIFICACION              IN T_SCOB_PLANTILLA.AUDUSUMODIFICACION%TYPE,
  po_n_retorno                         out number,
  po_n_cod_error                       out number,
  po_v_msj_error                       out varchar2
);

procedure SCOB_SP_D_PLANTILLA_MULT_EXPED
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 26.05.2011
-- Proposito    : elimina plantillas de multas o expedientes
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_V_ID_PLANTILLA                    IN VARCHAR2,
  PI_I_NRO_ITEMS                       IN INTEGER,
  PI_V_AUDUSUMODIFICACION              IN T_SCOB_PLANTILLA.AUDUSUMODIFICACION%TYPE,
  po_n_retorno                         out number,
  po_n_cod_error                       out number,
  po_v_msj_error                       out varchar2
);

procedure SCOB_SP_S_PLANTILLA_MULT_EXPED
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 26.05.2011
-- Proposito    : edita plantillas de multas o expedientes
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_PLANTILLA                   IN T_SCOB_PLANTILLA.ID_PLANTILLA%TYPE,
  po_cu_retorno                       out cu_rec_set
);

---
PROCEDURE SCOB_SP_S_INTENDENCIA(
   PI_ID IN NUMBER,
   PI_COD_INTERNO IN  VARCHAR2,
   PI_DESCRIPCION IN  VARCHAR2,
   po_cu_retorno  OUT cu_rec_set
);

procedure SCOB_SP_I_INTENDENCIA
(
    pi_v_codigo      in varchar2,
    pi_v_descripcion      in varchar2,
    pi_v_audusucrea      in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
);

procedure SCOB_SP_U_INTENDENCIA
(
    pi_n_id in number,
    pi_v_codigo in varchar2,
    pi_v_descripcion in varchar2,
    pi_v_audusucrea      in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
);

procedure SCOB_SP_D_INTENDENCIA
(
    pi_v_cad_id in varchar2,--|1|2|..
    pi_v_audusucrea      in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
);

PROCEDURE SCOB_SP_S_SUBMATERIA(
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 11.07.2011
-- Proposito    : LISTAR SUBMATERIA POR MATERIA
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
  PI_N_ID_MATERIA      IN T_SCOB_SUBMATERIA.ID_MATERIA%TYPE,
  PI_N_ID_SUBMATERIA   IN T_SCOB_SUBMATERIA.ID_SUBMATERIA%TYPE,
  PI_V_CODIGO          IN T_SCOB_SUBMATERIA.CODIGO%TYPE,
  PI_V_DESCRIPCION     IN T_SCOB_SUBMATERIA.DESCRIPCION%TYPE,
  po_cu_retorno        out cu_rec_set
);

procedure SCOB_SP_I_SUBMATERIA(
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 11.07.2011
-- Proposito    : INSERTAR SUBMATERIA POR MATERIA
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
  PI_N_ID_MATERIA         IN T_SCOB_SUBMATERIA.ID_SUBMATERIA%TYPE,
  PI_V_CODIGO             IN T_SCOB_SUBMATERIA.CODIGO%TYPE,
  PI_V_DESCRIPCION        IN T_SCOB_SUBMATERIA.DESCRIPCION%TYPE,
  PI_V_ABREVIATURA        IN T_SCOB_SUBMATERIA.ABREVIATURA%TYPE,
  PI_V_AUDUSUCREACION     IN T_SCOB_SUBMATERIA.AUDUSUCREACION%TYPE,
  po_n_retorno            out number,
  po_n_cod_error          out number,
  po_v_msj_error          out varchar2
);

procedure SCOB_SP_U_SUBMATERIA(
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 11.07.2011
-- Proposito    : ACTUALIZA SUBMATERIA POR MATERIA
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
  PI_N_ID_SUBMATERIA        IN T_SCOB_SUBMATERIA.ID_SUBMATERIA%TYPE,
  PI_V_CODIGO               IN T_SCOB_SUBMATERIA.CODIGO%TYPE,
  PI_V_DESCRIPCION          IN T_SCOB_SUBMATERIA.DESCRIPCION%TYPE,
  PI_V_ABREVIATURA          IN T_SCOB_SUBMATERIA.ABREVIATURA%TYPE,
  PI_V_AUDUSUMODIFICACION   IN T_SCOB_SUBMATERIA.AUDUSUMODIFICACION%TYPE,
  po_n_retorno              out number,
  po_n_cod_error            out number,
  po_v_msj_error            out varchar2
);

procedure SCOB_SP_D_SUBMATERIA(
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 11.07.2011
-- Proposito    : ELIMINA SUBMATERIA POR MATERIA
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
  PI_V_ID_SUBMATERIA        IN VARCHAR2,
  PI_V_AUDUSUMODIFICACION   IN T_SCOB_SUBMATERIA.AUDUSUMODIFICACION%TYPE,
  po_n_retorno              out number,
  po_n_cod_error            out number,
  po_v_msj_error            out varchar2
);

PROCEDURE SCOB_SP_S_SUBMATERIA_MAS(
  PI_V_ID_MATERIA      IN VARCHAR2,
  po_cu_retorno        out cu_rec_set
);

procedure SCOB_SP_S_EST_MUL_COB_MOT_MAS
(
     pi_v_id_est_mul_cob  in varchar, --comodin '|0|'
     po_cu_retorno   out cu_rec_set
);

procedure SCOB_SP_S_EST_EXP_COB_MOT_MAS
(
     pi_n_id_est_exp_cob  in varchar2, --comodin |0|
     po_cu_retorno   out cu_rec_set
);

PROCEDURE SCOB_SP_S_CLASIF_INDECOPI(
  PI_V_CODIGO                    IN T_SCOB_CLASIFICACION_INDECOPI.CODIGO%TYPE,
  PI_V_DESCRIPCION              IN T_SCOB_CLASIFICACION_INDECOPI.DESCRIPCION%TYPE,
  po_cu_retorno                 OUT cu_rec_set
);

procedure SCOB_SP_S_CONS_PLANTILLA_RANGO
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 26.05.2011
-- Proposito    : consultar las plantillas registradas para un expediente
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_I_COD_TIPO_PLANTILLA                  IN T_SCOB_PLANTILLA.COD_TIPO_PLANTILLA%TYPE,
  PI_V_DESCRIPCION                         IN T_SCOB_PLANTILLA.DESCRIPCION%TYPE,
  PI_I_ID_MOTIVO                           IN T_SCOB_EST_MUL_COB_MOTIVO.ID_MOTIVO%TYPE,
  PI_I_COD_ESTADO                          IN INTEGER, --DEL ESTADO DE LA MULTA Y DEL EXPEDIENTE
  PI_I_COD_SUBTIPO_DOCUMENTO               IN T_SCOB_TIPO_DOCUMENTO.COD_SUBTIPO_DOCUMENTO%TYPE,
  PI_I_COD_TIPO_DOCUMENTO                  IN INTEGER,
  PI_I_COD_TIPO_DOCUMENTO_FIN              IN INTEGER,
  po_cu_retorno                            out cu_rec_set
);

procedure SCOB_SP_S_DATA_INTERFAZ_MAT_OR
(
  PI_N_ID_ORGANO_RESOLUTIVO   IN T_SCOB_ORG_RESOL_MATERIA.ID_ORGANO_RESOLUTIVO%TYPE,
  PI_N_ID_MATERIA             IN T_SCOB_ORG_RESOL_MATERIA.ID_MATERIA%TYPE,
  po_cu_retorno               out cu_rec_set
);

procedure SCOB_SP_U_FLG_EXTRANET
(
  PI_N_ID_MOTIVO                IN t_scob_est_exp_cob_motivo.id_motivo%TYPE,
  PI_C_FLG_EXTRANET             IN t_scob_est_exp_cob_motivo.flg_extranet%TYPE,
  PI_V_AUDUSUMODIFICACION       IN t_scob_est_exp_cob_motivo.audusumodificacion%TYPE,
  PI_C_FLG_EXTRANET_CONSULTA  IN T_SCOB_EST_EXP_COB_MOTIVO.FLG_EXTRANET_CONSULTA%TYPE,
  po_n_retorno                  out number,
  po_n_cod_error                out number,
  po_v_msj_error                out varchar2
);

procedure SCOB_SP_U_FLG_EXT_CONS_MULTCOB
(
  PI_N_ID_MOTIVO                IN t_scob_est_mul_cob_motivo.id_motivo%TYPE,
  PI_C_FLG_EXTRANET_CONSULTA    IN t_scob_est_mul_cob_motivo.FLG_EXTRANET_CONSULTA%TYPE,
  PI_V_AUDUSUMODIFICACION       IN t_scob_est_mul_cob_motivo.audusumodificacion%TYPE,
  po_n_retorno                  out number,
  po_n_cod_error                out number,
  po_v_msj_error                out varchar2
);

PROCEDURE SCOB_SP_S_PARAM_NOTIF_SICOB
( /*2013.04.12:Permite consultar los parametros de las notificaciones del SICOB*/
  po_cu_retorno                 OUT cu_rec_set
);

procedure SCOB_SP_U_PARAM_NOTIF_SICOB
( /*2013.04.12:Permite actualizar los parametros de las notificaciones del SICOB*/
  PI_V_CAD_ID_NOTIFICACION        IN VARCHAR2,
  PI_V_CAD_CAN_DIAS_ENVIO         IN VARCHAR2,
  PI_V_CAD_CAN_DIAS_REENVIO       IN VARCHAR2,
  PI_V_AUDUSUMODIFICACION         IN VARCHAR2,
  PI_V_CAD_ACTIVO                 IN VARCHAR2,
  PI_V_CAD_DIA_HABIL              IN VARCHAR2,
  po_n_retorno                    out number,
  po_n_cod_error                  out number,
  po_v_msj_error                  out varchar2
);

PROCEDURE SCOB_SP_S_CORREO_NOTIF_SICOB
( /*2013.03.19:Permite consultar el contenido del correo de las notificaciones del SICOB*/
  PI_N_ID_NOTIFICACION_CORREO    IN T_SCOB_NOTIFICACION_CORREO.ID_NOTIFICACION_CORREO%TYPE,
  po_cu_retorno                  OUT cu_rec_set
);

procedure SCOB_SP_U_CORREO_NOTIF_SICOB
( /*2013.04.12:Permite actualizar el contenido del correo de las notificaciones del SICOB*/
  PI_N_ID_NOTIFICACION_CORREO     IN T_SCOB_NOTIFICACION_CORREO.ID_NOTIFICACION_CORREO%TYPE,
  PI_V_NOM_ASUNTO                 IN T_SCOB_NOTIFICACION_CORREO.NOM_ASUNTO%TYPE,
  PI_V_DES_CONTENIDO              IN T_SCOB_NOTIFICACION_CORREO.DES_CONTENIDO%TYPE,
  PI_C_IND_CC_JEFE                IN T_SCOB_NOTIFICACION_CORREO.IND_CON_COPIA_JEFE%TYPE,
  PI_V_DES_CORREO_CC              IN T_SCOB_NOTIFICACION_CORREO.DES_CORREO_CC%TYPE,
  PI_V_AUDUSUMODIFICACION         IN T_SCOB_NOTIFICACION_CORREO.AUDUSUMODIFICACION%TYPE,
  po_n_retorno                    out number,
  po_n_cod_error                  out number,
  po_v_msj_error                  out varchar2
);

procedure SCOB_SP_I_LOG_NOTIFICACION
( /*2013.04.12:Permite registrar el log de las notificaciones del SICOB*/
  PI_N_ID_MULTA                  IN T_SCOB_LOG_NOTIFICACION.ID_MULTA%TYPE,
  PI_N_ID_NOTIFICACION           IN T_SCOB_LOG_NOTIFICACION.ID_NOTIFICACION%TYPE,
  PI_C_COD_TIPO_ENVIO            IN T_SCOB_LOG_NOTIFICACION.COD_TIPO_ENVIO%TYPE,
  PI_N_ID_USUARIO                IN T_SCOB_LOG_NOTIFICACION.ID_USUARIO%TYPE,
  PI_N_ID_ORGANO_RESOLUTIVO      IN T_SCOB_LOG_NOTIFICACION.ID_ORGANO_RESOLUTIVO%TYPE,
  PI_N_ID_ORGANO_RESOLUTIVO_SUP  IN T_SCOB_LOG_NOTIFICACION.ID_ORGANO_RESOLUTIVO_SUP%TYPE,
  PI_N_CANT_ENVIOS               IN T_SCOB_LOG_NOTIFICACION.CANT_ENVIOS%TYPE,
  PI_C_IND_PROCESADO             IN T_SCOB_LOG_NOTIFICACION.IND_PROCESADO%TYPE,
  PI_V_AUDUSUCREACION            IN T_SCOB_LOG_NOTIFICACION.AUDUSUCREACION%TYPE,
  po_n_retorno                   out number,
  po_n_cod_error                 out number,
  po_v_msj_error                 out varchar2
);

procedure SCOB_SP_I_LOG_NOTIFICACION_DET
( /*2013.04.12:Permite registrar el log (detallado) de las notificaciones del SICOB*/
  PI_N_ID_LOG_NOTIFICACION       IN T_SCOB_LOG_NOTIFICACION_DET.ID_LOG_NOTIFICACION%TYPE,
  PI_N_ID_USUARIO                IN T_SCOB_LOG_NOTIFICACION_DET.ID_USUARIO%TYPE,
  PI_N_ID_ORGANO_RESOLUTIVO      IN T_SCOB_LOG_NOTIFICACION_DET.ID_ORGANO_RESOLUTIVO%TYPE,
  PI_N_ID_ORGANO_RESOLUTIVO_SUP  IN T_SCOB_LOG_NOTIFICACION_DET.ID_ORGANO_RESOLUTIVO_SUP%TYPE,
  PI_V_CAD_COD_ID_USUARIO_SECTEC IN T_SCOB_LOG_NOTIFICACION_DET.COD_ID_USUARIO_SECTEC%TYPE,
  PI_I_COD_EST_ENVIO_CORREO      IN T_SCOB_LOG_NOTIFICACION_DET.COD_ESTADO_ENVIADO%TYPE,
  PI_V_AUDUSUCREACION            IN T_SCOB_LOG_NOTIFICACION_DET.AUDUSUCREACION%TYPE,
  PI_V_NOM_USUARIO_GEN           IN VARCHAR2,
  PI_V_NRO_RESOL                 IN VARCHAR2,
  PI_V_NRO_EXPED_ANTIGUO         IN VARCHAR2,
  PI_V_NRO_CUM                   IN VARCHAR2,
  PI_V_FEC_GEN_CUM               IN VARCHAR2,
  PI_V_FEC_GEN_INSTANCIA         IN VARCHAR2,
  PI_V_ID_EJECUCION              IN VARCHAR2,
  PI_V_LOGIN_USUARIO             IN VARCHAR2,
  po_n_retorno                   out number,
  po_n_cod_error                 out number,
  po_v_msj_error                 out varchar2
);

FUNCTION SCOB_FN_DIA_CORREO(
   PI_I_NRO_CORREO                IN T_SCOB_NOTIFICACION.NRO_NOTIFICACION%TYPE,
   PI_C_IND_TIPO_ENVIO            IN CHAR
) RETURN  INTEGER;

procedure SCOB_SP_I_EJEC_ENV_NOTIF
( /*2013.04.12:Permite registrar el log de la ejecucion del JOB Notificaciones del SICOB*/
  PI_V_ID_EJECUCION              IN T_SCOB_TMP_EJEC_ENV_NOTIF.ID_EJECUCION%TYPE,
  PI_V_DET_EJECUCION             IN T_SCOB_TMP_EJEC_ENV_NOTIF.DET_EJECUCION%TYPE,
  PI_V_USU_CREACION              IN T_SCOB_TMP_EJEC_ENV_NOTIF.AUDUSUCREACION%TYPE,
  PI_C_TIPO_EJECUCION            IN T_SCOB_TMP_EJEC_ENV_NOTIF.TIPO_EJECUCION%TYPE,
  po_n_retorno                   out number
);
PROCEDURE SCOB_SP_S_TEXTO_NOTIFICACIONES
( /*2013.04.15:Permite consultar el TEXTO del correo de las notificaciones del SICOB*/
  po_cu_retorno                  OUT cu_rec_set
);

FUNCTION SCOB_FN_CORREOS_SEC_TEC(
  PI_N_ID_ORGANO_RESOLUTIVO IN NUMBER
) RETURN  VARCHAR2;
--

/* José Aguilar [05/12/2022]*/
PROCEDURE SCOB_SP_S_LISTA_UIT(POUT_CUR_RETORNO OUT CU_REC_SET);

end SCOB_PK_ADM_MANTENIMIENTO;
/
CREATE OR REPLACE PACKAGE BODY "SCOB_PK_ADM_MANTENIMIENTO" is
---
procedure SCOB_SP_S_MATERIA_BY_OR
(
     pi_vc_id  in number, --comodin 0
     po_cu_retorno   out cu_rec_set
)
as
begin

  open  po_cu_retorno for

select
  mp.id_materia,
  mp.codigo,
  mp.descripcion,
  mp.abreviatura,
  mp.estado,
  mp.pla_revision,
  mp.pla_apelacion,
  orr.id_org_resol_materia,
  orr.nu_id_area as nu_id_area,
  orr.nu_id_lugar as nu_id_lugar
from
    t_scob_materia mp
    inner join t_scob_org_resol_materia orr
          on mp.id_materia = orr.id_materia
where
    mp.estado = '1' and
    orr.estado = '1' and
    orr.id_organo_resolutivo = pi_vc_id
order by mp.descripcion;
end;

procedure SCOB_SP_I_MATERIA_BY_OR
(
    pi_v_id_organo_resolutivo in number,
    pi_v_cad_id_materia in varchar2,--|1|2|..
    pi_n_cant_items    in number,--NRO DE ITEMS EN LA CADENA
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
)
as

--v_cursor  cu_rec_set;
n_Contador number(10,0);
n_Ide number(10,0);
v_Ide_Opcion varchar2(10);
v_existe INTEGER;
begin


  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;


  n_Contador := 1;
  ---
    while (n_Contador <= pi_n_cant_items)
    loop
      --Obtiene Id
      scob_pk_utilitario.SCOB_SP_S_SPLIT(pi_v_cad_id_materia,'|',n_Contador+1,v_Ide_Opcion);
      n_Ide := TO_NUMBER(v_Ide_Opcion);

       ---VALIDACION DE DUPLICADOS--
       -----------------------------
       SELECT COUNT(U.ID_ORG_RESOL_MATERIA)
       INTO   v_existe
       FROM   t_Scob_Org_Resol_Materia u
       WHERE
              u.Id_Materia = n_Ide and
              u.id_organo_resolutivo = pi_v_id_organo_resolutivo and
              u.estado = '1';

       IF v_existe > 0 THEN
              po_n_cod_error := -2;
              po_n_retorno := -2;
              po_v_msj_error := 'Registro duplicado. Verificar la existencia de la materia en el OR.';
              ROLLBACK;
              RETURN;
       END IF;
       -----------

      --insert
      insert into t_scob_org_resol_materia
        (id_org_resol_materia, id_organo_resolutivo, id_materia,
        estado, audfeccreacion, audusucreacion, audfecmodificacion,
        audusumodificacion,
       NU_ID_AREA,NU_ID_LUGAR
        )
      values
        (SCOB_SQ_ORG_RESOL_MATERIA.Nextval, pi_v_id_organo_resolutivo, n_Ide,
         '1', sysdate, pi_v_audusucrea, null,
          null,
        0,0  --CAMPOS --NU_ID_AREA,NU_ID_LUGAR
             --SE DEBERA ELIMINAR --FALTA

          )
          RETURNING id_org_resol_materia INTO po_n_retorno;

      --fin insert
      n_Contador := n_Contador + 1;

    end loop;

    --po_n_retorno := n_Contador;
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

procedure SCOB_SP_D_MATERIA_BY_OR
(
    pi_v_cad_id_org_resol_materia in varchar2,--|1|2|..
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
)
as

--v_cursor  cu_rec_set;
n_Contador number(10,0);
n_Ide number(10,0);
--v_Ide_Opcion varchar2(10);

begin


  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  update t_scob_org_resol_materia
  set estado = '0'
  where instr(pi_v_cad_id_org_resol_materia,'|' || to_char(id_org_resol_materia) || '|' )>0
  and estado = '1';

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


procedure SCOB_SP_S_SEDES_BY_OR
(
     pi_vc_id  in number, --comodin 0
     po_cu_retorno   out cu_rec_set
)
as
begin

  open  po_cu_retorno for

select
  sd.id_sede,
  os.id_org_resol_sede,
  sd.codigo,
  sd.descripcion,
  sd.jefe,
  sd.cod_dpto,
  sd.cod_prov,
  sd.cod_dist,
  sd.estado
from
    t_scob_sede sd inner join
    t_scob_org_resol_sede os on
    sd.id_sede = os.id_sede
where
    sd.estado = '1' and
    os.estado = '1' and
    os.id_organo_resolutivo = pi_vc_id;

end;

procedure SCOB_SP_I_SEDES_BY_OR
(
    pi_v_id_organo_resolutivo in number,
    pi_v_cad_id_sedes in varchar2,--|1|2|..
    pi_n_cant_items    in number,--NRO DE ITEMS EN LA CADENA
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
)
as

--v_cursor  cu_rec_set;
n_Contador number(10,0);
n_Ide number(10,0);
v_Ide_Opcion varchar2(10);
v_existe integer;
begin


  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  n_Contador := 1;
  ---
    while (n_Contador <= pi_n_cant_items)
    loop
      --Obtiene Id
      scob_pk_utilitario.SCOB_SP_S_SPLIT(pi_v_cad_id_sedes,'|',n_Contador+1,v_Ide_Opcion);
      n_Ide := TO_NUMBER(v_Ide_Opcion);

       ---VALIDACION DE DUPLICADOS--
       -----------------------------
       SELECT COUNT(u.id_org_resol_sede)
       INTO   v_existe
       FROM   t_scob_org_resol_sede u
       WHERE
              u.id_sede = n_Ide and
              u.id_organo_resolutivo = pi_v_id_organo_resolutivo and
              u.estado = '1';

       IF v_existe > 0 THEN
              po_n_cod_error := -2;
              po_n_retorno := -2;
              po_v_msj_error := 'Registro duplicado. Verificar la existencia del OR en la sede.';
              ROLLBACK;
              RETURN;
       END IF;
       -----------
      --
      --insert
      insert into t_scob_org_resol_sede
        (id_org_resol_sede, id_sede, id_organo_resolutivo, estado,
        audfeccreacion, audusucreacion, audfecmodificacion, audusumodificacion)
      values
        (SCOB_SQ_ORG_RESOL_SEDE.Nextval, n_Ide, pi_v_id_organo_resolutivo, '1',
         sysdate, pi_v_audusucrea,null,null)
         RETURNING id_org_resol_sede INTO po_n_retorno;
      --fin insert
      n_Contador := n_Contador + 1;

    end loop;

    --po_n_retorno := n_Contador;

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

procedure SCOB_SP_D_SEDES_BY_OR
(
    pi_v_cad_id in varchar2,--|1|2|..
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
)
as

--v_cursor  cu_rec_set;
--n_Contador number(10,0);
--n_Ide number(10,0);
--v_Ide_Opcion varchar2(10);

begin


  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  update t_scob_org_resol_sede
  set estado = '0'
  where instr(pi_v_cad_id,'|' || to_char(id_org_resol_sede) || '|' )>0
  and estado = '1';

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

procedure SCOB_SP_S_SEDES
(
     pi_nu_id_sede  in number, --comodin 0
     pi_vc_codigo  in varchar2, --comodin ''
     pi_vc_descripcion  in varchar2, --comodin ''
     pi_vc_jefe  in varchar2, --comodin ''
     pi_vc_cod_dpto  in varchar2, --comodin ''
     pi_vc_cod_prov  in varchar2, --comodin ''
     pi_vc_cod_dist  in varchar2, --comodin ''
     pi_vc_estado  in varchar2, --comodin ''
     po_cu_retorno   out cu_rec_set
)
as
begin

  open  po_cu_retorno for

select
  sd.id_sede,
  sd.codigo,
  sd.descripcion,
  sd.jefe,
  sd.cod_dpto,
  SCOB_PK_UTILITARIO.SCOB_FN_DEPARTAMENTO(sd.cod_dpto) as des_dpto,
  sd.cod_prov,
  SCOB_PK_UTILITARIO.SCOB_FN_PROVINCIA(sd.cod_prov) as des_prov,
  sd.cod_dist,
  SCOB_PK_UTILITARIO.SCOB_FN_DISTRITO(sd.cod_dist) as des_dist,
  sd.estado,
  SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(CONST_TABLA_ESTADO,estado)  as des_estado
from
    t_scob_sede sd
where
    (pi_nu_id_sede = 0 or sd.id_sede = pi_nu_id_sede) and
    (pi_vc_codigo is null or sd.codigo = pi_vc_codigo) and
    (pi_vc_descripcion is null or fun_scob_nosensite(sd.descripcion) like '%'||fun_scob_nosensite(pi_vc_descripcion)||'%' ) and
    (pi_vc_jefe is null or fun_scob_nosensite(sd.jefe) like '%'||fun_scob_nosensite(pi_vc_jefe)||'%' ) and
    (pi_vc_cod_dpto is null or sd.cod_dpto = pi_vc_cod_dpto) and
    (pi_vc_cod_prov is null or sd.cod_prov = pi_vc_cod_prov) and
    (pi_vc_cod_dist is null or sd.cod_dist = pi_vc_cod_dist) and
    (pi_vc_estado is null or sd.estado = pi_vc_estado) ;


end;

procedure SCOB_SP_I_SEDES
(
    pi_v_codigo in varchar2,
    pi_v_descripcion in varchar2,
    pi_v_jefe in varchar2,
    pi_v_cod_dpto in varchar2,
    pi_v_cod_prov in varchar2,
    pi_v_cod_dist in varchar2,
    pi_v_estado in varchar2,
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
)
as
v_cursor  cu_rec_set;
v_existe int;
begin

  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  ----------------
   SELECT COUNT(t.id_sede)
   INTO   v_existe
   FROM   t_scob_sede t
   WHERE  (upper(t.codigo) = upper(pi_v_codigo) or
          upper(t.descripcion) = upper(pi_v_descripcion))
          and t.estado = '1';

   IF v_existe > 0 THEN
          po_n_cod_error := -2;
          po_n_retorno := -2;
          po_v_msj_error := 'Registro duplicado. Verificar la existencia del codigo y/o descripcion.';
          ROLLBACK;
          RETURN;
   END IF;
   -----------

  insert into t_scob_sede
    (id_sede, codigo, descripcion, jefe, cod_dpto,
    cod_prov, cod_dist, estado, audfeccreacion, audusucreacion,
    audfecmodificacion, audusumodificacion)
  values
    (SCOB_SQ_SEDE.NEXTVAL, pi_v_codigo, pi_v_descripcion, pi_v_jefe, pi_v_cod_dpto,
    pi_v_cod_prov, pi_v_cod_dist, pi_v_estado, sysdate, pi_v_audusucrea,
   null,null)
   RETURNING id_sede INTO po_n_retorno;

   commit;

   po_n_cod_error := 0;

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

procedure SCOB_SP_U_SEDES
(
    pi_n_id_sede in number,
    pi_v_codigo in varchar2,
    pi_v_descripcion in varchar2,
    pi_v_jefe in varchar2,
    pi_v_cod_dpto in varchar2,
    pi_v_cod_prov in varchar2,
    pi_v_cod_dist in varchar2,
    pi_v_estado in varchar2,
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
)
as
v_cursor  cu_rec_set;
v_existe int;
begin

  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;


   ----------------
   SELECT COUNT(u.id_sede)
   INTO   v_existe
   FROM   t_scob_sede u
   WHERE  (upper(u.codigo) = upper(pi_v_codigo) or
          upper(u.descripcion) = upper(pi_v_descripcion)) and
          u.id_sede <> pi_n_id_sede and
          u.estado = '1';

   IF v_existe > 0 THEN
          po_n_cod_error := -2;
          po_n_retorno := -2;
          po_v_msj_error := 'Registro duplicado. Verificar la existencia del codigo y/o descripcion.';
          ROLLBACK;
          RETURN;
   END IF;
   -----------

  update t_scob_sede set
    codigo = pi_v_codigo,
    descripcion = pi_v_descripcion,
    jefe = pi_v_jefe,
    cod_dpto = pi_v_cod_dpto,
    cod_prov = pi_v_cod_prov,
    cod_dist = pi_v_cod_dist,
    estado = pi_v_estado,
    audfecmodificacion = sysdate,
    audusumodificacion = pi_v_audusucrea
  where
    id_sede = pi_n_id_sede;

   commit;

   po_n_retorno := pi_n_id_sede;
   po_n_cod_error := 0;

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

procedure SCOB_SP_D_SEDES
(
    pi_v_cad_id in varchar2,--|1|2|..
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
)
as

v_cursor  cu_rec_set;
n_Contador number(10,0);
n_Ide number(10,0);
v_Ide_Opcion varchar2(10);

begin

  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  update t_scob_sede
  set estado = '0'
  where instr(pi_v_cad_id,'|' || to_char(id_sede) || '|' )>0
  and estado = '1';

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

procedure SCOB_SP_S_OR
(
     pi_vc_id  in number, --comodin 0
     pi_vc_tip_inst  in number, --comodin 0
     pi_vc_codigo  in varchar2, --comodin ''
     pi_vc_descripcion  in varchar2, --comodin ''
     pi_vc_estado  in char, --comodin ''
     pi_vc_dpto  in varchar2, --comodin ''
     pi_vc_prov  in varchar2, --comodin ''
     pi_vc_dist  in varchar2, --comodin ''
     po_cu_retorno   out cu_rec_set
)
as
begin

  open  po_cu_retorno for

select
    a.id_organo_resolutivo,
    a.id_area_cobranza,
    a.codigo,
    a.descripcion,
    a.cod_dpto,
    '' as des_dpto,
    a.cod_prov,
    '' as des_prov,
    a.cod_dist,
    '' as des_dist,
    a.tipo_instancia,
    --'' as des_tipo_instancia,
    SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(CONST_TABLA_TIPO_INSTANCIA,a.tipo_instancia) as des_tipo_instancia,
    a.estado,
    --'' as des_estado
    SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(CONST_TABLA_ESTADO,a.estado)  as des_estado,
    a.siglas as siglas,
    a.COD_SUCURSAL_SIA,
    (a.COD_SUCURSAL_SIA||'-'||b.DESCRIPCIONLOCAL) AS DESC_SUCURSAL_SIA
from
    t_scob_organo_resolutivo a
    left join SGCORESYS.AC_SUCURSAL b on a.COD_SUCURSAL_SIA=b.sucursal
where
    (pi_vc_id = 0 or a.id_organo_resolutivo = pi_vc_id) and
    (pi_vc_tip_inst = 0 or a.tipo_instancia = pi_vc_tip_inst) and
    (pi_vc_codigo is null or  a.codigo = pi_vc_codigo)  and
    (nvl(pi_vc_descripcion,' ')=' ' or upper(a.descripcion) like '%' || upper(pi_vc_descripcion)|| '%' ) and
    (pi_vc_estado is null or a.estado = pi_vc_estado) and
    (pi_vc_dpto  is null or a.cod_dpto = pi_vc_dpto) and
    (pi_vc_prov is null or a.cod_prov = pi_vc_prov) and
    (pi_vc_dist  is null or a.cod_dist = pi_vc_dist);


end;

procedure SCOB_SP_I_OR
(
    pi_v_codigo in varchar2,
    pi_v_descripcion in varchar2,
    pi_v_cod_dpto in varchar2,
    pi_v_cod_prov in varchar2,
    pi_v_cod_dist in varchar2,
    pi_v_tipo_instancia in number,
    pi_v_siglas in varchar2,
    pi_v_estado    in char,
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    pi_v_cod_suc_sia   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
)
as
v_cursor  cu_rec_set;
v_existe int;
begin


  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  ----------------
   SELECT COUNT(t.id_organo_resolutivo)
   INTO   v_existe
   FROM   t_scob_organo_resolutivo t
   WHERE  upper(t.codigo) = upper(pi_v_codigo) or
          upper(t.descripcion) = upper(pi_v_descripcion)
          and t.estado = '1';

   IF v_existe > 0 THEN
          po_n_cod_error := -2;
          po_n_retorno := -2;
          po_v_msj_error := 'Registro duplicado. Verificar la existencia del codigo y/o descripcion.';
          ROLLBACK;
          RETURN;
   END IF;
   -----------

  insert into t_scob_organo_resolutivo
    (id_organo_resolutivo, codigo, descripcion, cod_dpto, cod_prov,
    cod_dist, tipo_instancia, estado, audfeccreacion, audusucreacion,
    audfecmodificacion, audusumodificacion,siglas,COD_SUCURSAL_SIA)
  values
    (SCOB_SQ_ORGANO_RESOLUTIVO.NEXTVAL, pi_v_codigo, pi_v_descripcion, pi_v_cod_dpto, pi_v_cod_prov,
    pi_v_cod_dist, pi_v_tipo_instancia, pi_v_estado, sysdate, pi_v_audusucrea,
    null, null,pi_v_siglas,pi_v_cod_suc_sia)
    RETURNING id_organo_resolutivo INTO po_n_retorno;

    commit;

    po_n_cod_error := 0;


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

procedure SCOB_SP_U_OR
(
    pi_n_ide         in number,
    pi_v_codigo      in varchar2,
    pi_v_descripcion in varchar2,
    pi_v_cod_dpto    in varchar2,
    pi_v_cod_prov    in varchar2,
    pi_v_cod_dist    in varchar2,
    pi_v_tipo_instancia in number,
    pi_v_siglas in varchar2,
    pi_v_estado    in char,
    pi_v_audusucrea     in varchar2,
    pi_v_nom_usured     in varchar2,
    pi_v_nom_estred     in varchar2,
    pi_v_aud_ip_lan     in varchar2,
    pi_v_aud_ip_wan     in varchar2,
    pi_v_cod_suc_sia   in varchar2,
    po_n_retorno        out number,
    po_n_cod_error      out number,
    po_v_msj_error      out varchar2
)
as
v_cursor  cu_rec_set;
v_existe int;
begin

  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

   ----------------
   SELECT COUNT(u.id_organo_resolutivo)
   INTO   v_existe
   FROM   t_scob_organo_resolutivo u
   WHERE  (upper(u.codigo) = upper(pi_v_codigo) or
          upper(u.descripcion) = upper(pi_v_descripcion)) and
          u.id_organo_resolutivo <> pi_n_ide and
          u.estado = '1';

   IF v_existe > 0 THEN
          po_n_cod_error := -2;
          po_n_retorno := -2;
          po_v_msj_error := 'Registro duplicado. Verificar la existencia del codigo y/o descripcion.';
          ROLLBACK;
          RETURN;
   END IF;
   -----------

  update t_scob_organo_resolutivo
    set
    codigo  = pi_v_codigo,
    descripcion = pi_v_descripcion,
    cod_dpto = pi_v_cod_dpto,
    cod_prov = pi_v_cod_prov,
    cod_dist = pi_v_cod_dist,
    tipo_instancia = pi_v_tipo_instancia,
    estado = pi_v_estado,
    siglas = pi_v_siglas,
    COD_SUCURSAL_SIA = pi_v_cod_suc_sia,
    --audfeccreacion,
    --audusucreacion,
    audfecmodificacion = sysdate,
    audusumodificacion = pi_v_audusucrea
    where
    id_organo_resolutivo = pi_n_ide;

       po_n_retorno := pi_n_ide;
       po_n_cod_error :=0;
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

procedure SCOB_SP_D_OR
(
    pi_v_cad_id in varchar2,--|1|2|..
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
)
as

v_cursor  cu_rec_set;
n_Contador number(10,0);
n_Ide number(10,0);
v_Ide_Opcion varchar2(10);

begin


  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  update t_scob_organo_resolutivo
  set estado = '0'
  where instr(pi_v_cad_id,'|' || to_char(id_organo_resolutivo) || '|' )>0
  and estado = '1';

  po_n_cod_error := 0;
  po_n_retorno := '1';

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



procedure SCOB_SP_S_TIPO_PROCEDIMIENTO
(
     pi_nu_id  in number, --comodin 0
     pi_vc_codigo  in varchar2, --comodin ''
     pi_vc_descripcion  in varchar2, --comodin ''
     pi_vc_estado  in varchar2, --comodin ''
     po_cu_retorno   out cu_rec_set
)
as
begin

  open  po_cu_retorno for

  select
    id_tipo_procedimiento,
    codigo,
    descripcion,
    --cod_dpto,
    --cod_prov,
    --cod_dist,
    estado,
    SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(CONST_TABLA_ESTADO,estado)  as des_estado

  from
    t_scob_tipo_procedimiento
  where
    (pi_nu_id = 0 or id_tipo_procedimiento = pi_nu_id)  and
    (pi_vc_codigo is null or codigo = pi_vc_codigo) and
    (pi_vc_descripcion is null or fun_scob_nosensite(descripcion) like  '%'|| fun_scob_nosensite(pi_vc_descripcion)||'%' ) and
    (pi_vc_estado is null or estado = pi_vc_estado);

end;

procedure SCOB_SP_I_TIPO_PROCEDIMIENTO
(
    pi_v_codigo in varchar2,
    pi_v_descripcion in varchar2,
    pi_v_cod_dpto in varchar2,
    pi_v_cod_prov in varchar2,
    pi_v_cod_dist in varchar2,
    pi_v_estado in varchar2,
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
)
as
v_cursor  cu_rec_set;
v_existe int;
begin

  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  ----------------
   SELECT COUNT(t.id_tipo_procedimiento)
   INTO   v_existe
   FROM   t_scob_tipo_procedimiento t
   WHERE  (upper(t.codigo) = upper(pi_v_codigo) or
          upper(t.descripcion) = upper(pi_v_descripcion))
          and t.estado='1';

   IF v_existe > 0 THEN
          po_n_cod_error := -2;
          po_n_retorno := -2;
          po_v_msj_error := 'Registro duplicado. Verificar la existencia del codigo y/o descripcion.';
          ROLLBACK;
          RETURN;
   END IF;
   -----------


insert into t_scob_tipo_procedimiento
  (id_tipo_procedimiento, codigo, descripcion,
  --cod_dpto,cod_prov,cod_dist,
  estado, audfeccreacion,
  audusucreacion, audfecmodificacion, audusumodificacion)
values
  (SCOB_SQ_TIPO_PROCEDIMIENTO.NEXTVAL, pi_v_codigo, pi_v_descripcion,
  --pi_v_cod_dpto,pi_v_cod_prov,pi_v_cod_dist,
  pi_v_estado, sysdate,
  pi_v_audusucrea, null, null)
  RETURNING id_tipo_procedimiento INTO po_n_retorno;

   commit;

   po_n_cod_error := 0;

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

procedure SCOB_SP_U_TIPO_PROCEDIMIENTO
(
    pi_v_id in number,
    pi_v_codigo in varchar2,
    pi_v_descripcion in varchar2,
    pi_v_cod_dpto in varchar2,
    pi_v_cod_prov in varchar2,
    pi_v_cod_dist in varchar2,
    pi_v_estado in varchar2,
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
)
as
v_cursor  cu_rec_set;
v_existe int;
begin

  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

   ----------------
   SELECT COUNT(u.id_tipo_procedimiento)
   INTO   v_existe
   FROM   t_scob_tipo_procedimiento u
   WHERE  (upper(u.codigo) = upper(pi_v_codigo) or
          upper(u.descripcion) = upper(pi_v_descripcion)) and
          u.id_tipo_procedimiento <> pi_v_id and
          u.estado = '1';

   IF v_existe > 0 THEN
          po_n_cod_error := -2;
          po_n_retorno := -2;
          po_v_msj_error := 'Registro duplicado. Verificar la existencia del codigo y/o descripcion.';
          ROLLBACK;
          RETURN;
   END IF;
   -----------

update t_scob_tipo_procedimiento
set
  codigo = pi_v_codigo,
  descripcion = pi_v_descripcion,
 -- cod_dpto = pi_v_cod_dpto,
 -- cod_prov = pi_v_cod_prov,
 -- cod_dist = pi_v_cod_dist,
  estado = pi_v_estado,
  audfecmodificacion = sysdate,
  audusumodificacion = pi_v_audusucrea
where
  id_tipo_procedimiento = pi_v_id;

   commit;

   po_n_cod_error := 0;
   po_n_retorno := pi_v_id;
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

procedure SCOB_SP_D_TIPO_PROCEDIMIENTO
(
    pi_v_cad_id in varchar2,--|1|2|..
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
)
as
begin

  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  update t_scob_tipo_procedimiento
  set estado = '0'
  where instr(pi_v_cad_id,'|' || to_char(id_tipo_procedimiento) || '|' )>0
  and estado = '1';

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

procedure SCOB_SP_S_MATERIA
(
     pi_nu_id_materia  in number, --comodin 0
     pi_nu_id_tipo_proc in number,--comodin 0
     pi_vc_codigo  in varchar2, --comodin ''
     pi_vc_descripcion  in varchar2, --comodin ''
     pi_vc_abreviatura  in varchar2, --comodin ''
     pi_vc_estado  in varchar2, --comodin ''
     po_cu_retorno   out cu_rec_set
)
as
begin

  open  po_cu_retorno for

select
  mp.id_materia,
  mp.id_tipo_procedimiento,
  mp.codigo,
  mp.descripcion,
  mp.abreviatura,
  mp.pla_revision,
  mp.pla_apelacion,
  mp.estado,
  mp.nom_motivo_web
from
    t_scob_materia mp
where
    (pi_nu_id_materia = 0 or mp.id_materia = pi_nu_id_materia ) and
    (pi_nu_id_tipo_proc = 0 or mp.id_tipo_procedimiento = pi_nu_id_tipo_proc) and
    (pi_vc_codigo is null or mp.codigo = pi_vc_codigo) and
    (pi_vc_descripcion is null or fun_scob_nosensite(mp.descripcion) like '%'||fun_scob_nosensite(pi_vc_descripcion)||'%') and
    (pi_vc_abreviatura is null or fun_scob_nosensite(mp.abreviatura) like '%'||fun_scob_nosensite(pi_vc_abreviatura)||'%') and
    (pi_vc_estado is null or mp.estado = pi_vc_estado);


end;

procedure SCOB_SP_I_MATERIA
(
    pi_n_id_tipo_procedimiento in number,
    pi_v_codigo      in varchar2,
    pi_v_descripcion      in varchar2,
    pi_v_abreviatura      in varchar2,
    --pi_n_pla_apelacion      in integer,
    pi_n_pla_revision      in integer,
    pi_v_motivo_web        in varchar2,
    pi_v_estado      in varchar2,
    pi_v_audusucrea      in varchar2,
    --pi_v_nom_usured    in varchar2,
    --pi_v_nom_estred    in varchar2,
    --pi_v_aud_ip_lan   in varchar2,
    --pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
)
as
v_cursor  cu_rec_set;
v_existe int;
begin

  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  ----------------
   SELECT COUNT(t.id_materia)
   INTO   v_existe
   FROM   t_scob_materia t
   WHERE  (upper(t.codigo) = upper(pi_v_codigo) or
          upper(t.descripcion) = upper(pi_v_descripcion)) and
          --t.id_tipo_procedimiento = pi_n_id_tipo_procedimiento and
          estado = '1';

   IF v_existe > 0 THEN
          po_n_cod_error := -2;
          po_n_retorno := -2;
          po_v_msj_error := 'Registro duplicado. Verificar la existencia del codigo y/o descripcion dentro del area macro actual u otra area macro.';
          ROLLBACK;
          RETURN;
   END IF;
   -----------



insert into t_scob_materia
  (id_materia, id_tipo_procedimiento,codigo, descripcion, abreviatura,
   --pla_apelacion,
   pla_revision, estado, audfeccreacion,
   audusucreacion, audfecmodificacion, audusumodificacion, nom_motivo_web)
values
  (SCOB_SQ_MATERIA.NEXTVAL, pi_n_id_tipo_procedimiento,pi_v_codigo, pi_v_descripcion, pi_v_abreviatura,
  --pi_n_pla_apelacion,
  pi_n_pla_revision, pi_v_estado, sysdate,
  pi_v_audusucrea, null, null, pi_v_motivo_web)
  RETURNING id_materia INTO po_n_retorno;

   commit;

   po_n_cod_error := 0;

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
procedure SCOB_SP_D_MATERIA
(
    pi_v_cad_id in varchar2,--|1|2|..
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
)
as

v_cursor  cu_rec_set;
n_Contador number(10,0);
n_Ide number(10,0);
v_Ide_Opcion varchar2(10);
I_EXISTE     integer;
begin


  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  --verificar si se encuentra dentro de los registro a eliminar el antidumping
  SELECT COUNT(MATE.ID_MATERIA)
  INTO I_EXISTE
  FROM T_SCOB_MATERIA MATE
  where instr(pi_v_cad_id,'|' || to_char(MATE.id_materia) || '|' )>0
  AND NVL(FLG_NO_EDITABLE,'0')='1';

  update t_scob_materia
  set estado = '0'
  where instr(pi_v_cad_id,'|' || to_char(id_materia) || '|' )>0
  AND NVL(FLG_NO_EDITABLE,'0')='0'
  and estado = '1';


  IF I_EXISTE > 0 THEN
     po_n_retorno := -1;
     po_n_cod_error := po_n_retorno;
     po_v_msj_error := 'No se puede eliminar el registro asociado a Antidumping.';
  ELSE
     po_n_retorno := 1;
  END IF;

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

procedure SCOB_SP_U_MATERIA
(
    pi_v_id in number,
    pi_v_id_tipo_procedimiento in number,
    pi_v_codigo      in varchar2,
    pi_v_descripcion      in varchar2,
    pi_v_abreviatura      in varchar2,
    --pi_n_pla_apelacion      in integer,
    pi_n_pla_revision      in integer,
    pi_v_motivo_web        in varchar2,
    pi_v_estado      in varchar2,
    pi_v_audusucrea      in varchar2,
    --pi_v_nom_usured    in varchar2,
    --pi_v_nom_estred    in varchar2,
    --pi_v_aud_ip_lan   in varchar2,
    --pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
)
as
v_cursor  cu_rec_set;
v_existe int;
begin

  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

   ----------------
   SELECT COUNT(u.id_materia)
   INTO   v_existe
   FROM   t_scob_materia u
   WHERE  (upper(u.codigo) = upper(pi_v_codigo) or
          upper(u.descripcion) = upper(pi_v_descripcion))
          --and u.id_tipo_procedimiento = pi_v_id_tipo_procedimiento
          and u.id_materia <> pi_v_id
          and u.estado = '1';

   IF v_existe > 0 THEN
          po_n_cod_error := -2;
          po_n_retorno := -2;
          po_v_msj_error := 'Registro duplicado. Verificar la existencia del codigo y/o descripcion dentro del area macro actual u otra area macro.';
          ROLLBACK;
          RETURN;
   END IF;
   -----------

update t_scob_materia set
   --id_tipo_procedimiento = pi_v_id_tipo_procedimiento,
   codigo = pi_v_codigo,
   descripcion = pi_v_descripcion,
   abreviatura = pi_v_abreviatura,
   --pla_apelacion = pi_n_pla_apelacion,
   pla_revision = pi_n_pla_revision,
   estado = pi_v_estado,
   audfecmodificacion = sysdate,
   audusumodificacion = pi_v_audusucrea,
   nom_motivo_web = pi_v_motivo_web
where
   id_materia = pi_v_id;

   commit;

   po_n_retorno := pi_v_id;
   po_n_cod_error := 0;

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

procedure SCOB_SP_S_DESCUENTO
(
     pi_nu_id_descuento  in number, --comodin 0
     pi_nu_id_materia in number,--comodin 0
     pi_vc_codigo  in varchar2, --comodin ''
     pi_vc_estado  in varchar2, --comodin ''
     po_cu_retorno   out cu_rec_set
)
as
begin

  open  po_cu_retorno for

select
  td.id_descuento,
  td.id_materia,
  td.codigo,
  td.fec_inicial,
  td.fec_final,
  td.nro_dias,
  td.por_dscto,
  td.estado,
  SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(CONST_TABLA_ESTADO,td.estado)  as des_estado
from
    t_scob_descuento td
where
    (pi_nu_id_descuento = 0 or td.id_descuento = pi_nu_id_descuento ) and
    (pi_nu_id_materia = 0 or td.id_materia = pi_nu_id_materia) and
    (pi_vc_codigo is null or td.codigo = pi_vc_codigo) and
    (pi_vc_estado is null or  td.estado = pi_vc_estado)
    order by estado desc;

end;

procedure SCOB_SP_I_DESCUENTO
(
    pi_v_id_materia in number,
    pi_v_codigo      in varchar2,
    pi_d_fec_ini      in varchar2,
    pi_d_fec_fin      in varchar2,
    pi_n_nro_dias      in integer,
    pi_n_por_dscto      in number,
    --pi_v_estado      in varchar2,
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
)
as
v_cursor  cu_rec_set;
v_existe int;
v_ID_GEN NUMBER;
begin

  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  ----------------
  /* SELECT COUNT(*)
   INTO   v_existe
   FROM   t_scob_descuento t
   WHERE  upper(t.codigo) = upper(pi_v_codigo) and
          t.id_materia = pi_v_id_materia and
          estado = '1';

   IF v_existe > 0 THEN
          po_n_cod_error := -2;
          po_n_retorno := -2;
          po_v_msj_error := 'REGISTRO DUPLICADO';
          ROLLBACK;
          RETURN;
   END IF;*/
   -----------

UPDATE
   T_SCOB_DESCUENTO
SET
   ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_INACTIVO
WHERE
   ID_MATERIA = pi_v_id_materia;

SELECT SCOB_SQ_DESCUENTO.NEXTVAL INTO v_ID_GEN FROM dual;


insert into t_scob_descuento
  (id_descuento, id_materia, codigo, fec_inicial, fec_final,
  nro_dias, por_dscto, estado, audfeccreacion, audusucreacion,
  audfecmodificacion, audusumodificacion)
values
  (--SCOB_SQ_DESCUENTO.NEXTVAL,
  v_ID_GEN,
  pi_v_id_materia,
  --pi_v_codigo,
  to_char(v_ID_GEN),
  to_date(pi_d_fec_ini,'dd/mm/yyyy'),
  to_date(pi_d_fec_fin,'dd/mm/yyyy'),
  pi_n_nro_dias,
  pi_n_por_dscto,
  SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO,
  sysdate,
  pi_v_audusucrea,
  null,
  null)
  RETURNING id_descuento INTO po_n_retorno;

   commit;

   po_n_cod_error := 0;

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

procedure SCOB_SP_U_DESCUENTO
(
    pi_v_id in number,
    pi_v_id_materia in number,
    pi_v_codigo      in varchar2,
    pi_d_fec_ini      in varchar2,
    pi_d_fec_fin      in varchar2,
    pi_n_nro_dias      in integer,
    pi_n_por_dscto      in number,
    --pi_v_estado      in varchar2,
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
)
as
v_cursor  cu_rec_set;

begin

  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;


update t_scob_descuento set
  --codigo = pi_v_codigo,
  fec_inicial = to_date(pi_d_fec_ini,'dd/mm/yyyy'),
  fec_final = to_date(pi_d_fec_fin,'dd/mm/yyyy'),
  nro_dias = pi_n_nro_dias,
  por_dscto = pi_n_por_dscto,
  --estado = pi_v_estado,
  audfecmodificacion = sysdate,
  audusumodificacion = pi_v_audusucrea
  where
    id_descuento = pi_v_id;


   commit;

   po_n_retorno := pi_v_id;
   po_n_cod_error := 0;


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

procedure SCOB_SP_D_DESCUENTO
(
    pi_v_cad_id in varchar2,--|1|2|..
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
)
as

v_cursor  cu_rec_set;
n_Contador number(10,0);
n_Ide number(10,0);
v_Ide_Opcion varchar2(10);

begin


  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  update t_scob_descuento
  set estado = '0'
  where instr(pi_v_cad_id,'|' || to_char(id_descuento) || '|' )>0
  and estado = '1';

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

procedure SCOB_SP_S_AREA_COBRANZA
(
     pi_vc_id  in number, --comodin 0
     pi_vc_codigo  in varchar2, --comodin ''
     pi_vc_descripcion  in varchar2, --comodin ''
     pi_vc_estado  in char, --comodin ''
     pi_vc_dpto  in varchar2, --comodin ''
     pi_vc_prov  in varchar2, --comodin ''
     pi_vc_dist  in varchar2, --comodin ''
     po_cu_retorno   out cu_rec_set
)
as
begin

  open  po_cu_retorno for

    select
            id_area_cobranza as id_area_cobranza,
            codigo as codigo,
            descipcion as descripcion,
            cod_dpto as cod_dpto,
            SCOB_PK_UTILITARIO.SCOB_FN_DEPARTAMENTO(cod_dpto) as des_dpto,
            cod_prov as cod_prov,
            SCOB_PK_UTILITARIO.SCOB_FN_PROVINCIA(cod_prov) as des_prov,
            cod_dist as cod_dist,
            SCOB_PK_UTILITARIO.SCOB_FN_DISTRITO(cod_dist) as des_dist,
            estado as estado,
            direccion,
            telefono,
            anexo,
            contacto,
            siglas
    from
            t_scob_area_cobranza
    where
            (pi_vc_id = 0 or id_area_cobranza = pi_vc_id) and
            (pi_vc_codigo is null or  codigo = pi_vc_codigo)  and
            --(pi_vc_descripcion is null or descipcion = pi_vc_descripcion) and
            (pi_vc_descripcion is null or fun_scob_nosensite(descipcion) like '%' || fun_scob_nosensite(pi_vc_descripcion)|| '%' ) and
            (pi_vc_estado is null or estado = pi_vc_estado) and
            (pi_vc_dpto  is null or cod_dpto = pi_vc_dpto) and
            (pi_vc_prov is null or cod_prov = pi_vc_prov) and
            (pi_vc_dist  is null or cod_dist = pi_vc_dist);


end;

procedure SCOB_SP_I_AREA_COBRANZA
(
    pi_v_codigo      in varchar2,
    pi_v_descripcion      in varchar2,
    pi_v_cod_dpto      in varchar2,
    pi_v_cod_prov      in varchar2,
    pi_v_cod_dist      in varchar2,

    pi_v_direccion      in varchar2,
    pi_v_telefono      in varchar2,
    pi_v_anexo      in varchar2,
    pi_v_contacto      in varchar2,

    pi_v_estado      in varchar2,
    pi_v_sigla      in varchar2,
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
)
as
v_cursor  cu_rec_set;
v_existe integer;
begin

  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  ----------------
   SELECT COUNT(t.id_area_cobranza)
   INTO   v_existe
   FROM   t_scob_area_cobranza t
   WHERE  (upper(t.codigo) = upper(pi_v_codigo) or
          upper(t.descipcion) = upper(pi_v_descripcion))
          and t.estado = '1';

   IF v_existe > 0 THEN
          po_n_cod_error := -2;
          po_n_retorno := -2;
          po_v_msj_error := 'Registro duplicado. Verificar la existencia del codigo y/o descripcion.';
          ROLLBACK;
          RETURN;
   END IF;
   -----------

insert into t_scob_area_cobranza
  (id_area_cobranza, codigo, descipcion, cod_dpto, cod_prov,
  cod_dist,
  direccion,telefono,anexo,contacto,siglas,
  estado, audfeccreacion, audusucreacion, audfecmodificacion,
  audusumodificacion)
values
  (SCOB_SQ_AREA_COBRANZA.NEXTVAL, pi_v_codigo, pi_v_descripcion, pi_v_cod_dpto, pi_v_cod_prov,
  pi_v_cod_dist,
    pi_v_direccion,pi_v_telefono,pi_v_anexo,pi_v_contacto,pi_v_sigla ,
  pi_v_estado, sysdate, pi_v_audusucrea, null,
  null)
  RETURNING id_area_cobranza INTO po_n_retorno;

   commit;

   po_n_cod_error := 0;

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

procedure SCOB_SP_U_AREA_COBRANZA
(
    pi_n_id_area_cobranza      in number,
    pi_v_codigo      in varchar2,
    pi_v_descripcion      in varchar2,
    pi_v_cod_dpto      in varchar2,
    pi_v_cod_prov      in varchar2,
    pi_v_cod_dist      in varchar2,

    pi_v_direccion      in varchar2,
    pi_v_telefono      in varchar2,
    pi_v_anexo      in varchar2,
    pi_v_contacto      in varchar2,

    pi_v_estado      in varchar2,
    pi_v_siglas      in varchar2,
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
)
as
v_cursor  cu_rec_set;
v_existe integer;
begin

  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

   ----------------
   SELECT COUNT(u.id_area_cobranza)
   INTO   v_existe
   FROM   t_scob_area_cobranza u
   WHERE  (upper(u.codigo) = upper(pi_v_codigo) or
          upper(u.descipcion) = upper(pi_v_descripcion)) and
          u.id_area_cobranza <> pi_n_id_area_cobranza and
          u.estado = '1';

   IF v_existe > 0 THEN
          po_n_cod_error := -2;
          po_n_retorno := -2;
          po_v_msj_error := 'Registro duplicado. Verificar la existencia del codigo y/o descripcion.';
          ROLLBACK;
          RETURN;
   END IF;
   -----------

update t_scob_area_cobranza set
  codigo = pi_v_codigo,
  descipcion = pi_v_descripcion,
  cod_dpto = pi_v_cod_dpto,
  cod_prov = pi_v_cod_prov,
  cod_dist = pi_v_cod_dist,
  direccion = pi_v_direccion,
  telefono = pi_v_telefono,
  anexo = pi_v_anexo,
  contacto = pi_v_contacto,
  siglas = pi_v_siglas,
  estado = pi_v_estado,
  audfecmodificacion = sysdate,
  audusumodificacion = pi_v_audusucrea
  where
  id_area_cobranza =  pi_n_id_area_cobranza;

   commit;

   po_n_cod_error := 0;
   po_n_retorno :=pi_n_id_area_cobranza;

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


procedure SCOB_SP_D_AREA_COBRANZA
(
    pi_v_cad_id in varchar2,--|1|2|..
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
)
as

v_cursor  cu_rec_set;
n_Contador number(10,0);
n_Ide number(10,0);
v_Ide_Opcion varchar2(10);

begin


  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  update t_scob_area_cobranza
  set estado = '0'
  where instr(pi_v_cad_id,'|' || to_char(id_area_cobranza) || '|' )>0
  and estado = '1';

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

procedure SCOB_SP_S_OR_BY_AREA_COBRA
(
     pi_vc_id_area_cobra  in number, --comodin 0
     po_cu_retorno   out cu_rec_set
)
as
begin

  open  po_cu_retorno for

select
    ac.id_organo_resolutivo,
    ac.id_are_org_res,
    ac.id_area_cobranza,
    ore.codigo,
    ore.descripcion,
    ac.estado
from
     t_scob_are_cob_org_resol ac inner join
     t_scob_organo_resolutivo ore on
     ac.id_organo_resolutivo = ore.id_organo_resolutivo
where
   ac.estado = '1'  and
   ore.estado = '1' and
   ac.id_area_cobranza = pi_vc_id_area_cobra;

end;

procedure SCOB_SP_I_OR_BY_AREA_COBRA
(
    pi_v_id_area_cobra in number,
    pi_v_cad_id_or in varchar2,--|1|2|..
    pi_n_cant_items    in number,--NRO DE ITEMS EN LA CADENA
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
)
as

v_cursor  cu_rec_set;
n_Contador number(10,0);
n_Ide number(10,0);
v_Ide_Opcion varchar2(10);
v_existe integer;
begin
  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  n_Contador := 1;
  ---
    while (n_Contador <= pi_n_cant_items)
    loop
      --Obtiene Id
      scob_pk_utilitario.SCOB_SP_S_SPLIT(pi_v_cad_id_or,'|',n_Contador+1,v_Ide_Opcion);
      n_Ide := TO_NUMBER(v_Ide_Opcion);


       ---VALIDACION DE DUPLICADOS--
       -----------------------------
       SELECT COUNT(u.id_are_org_res)
       INTO   v_existe
       FROM   t_Scob_Are_Cob_Org_Resol u
       WHERE
              u.id_area_cobranza = pi_v_id_area_cobra and
              u.id_organo_resolutivo = n_Ide and
              u.estado = '1';

       IF v_existe > 0 THEN
              po_n_cod_error := -2;
              po_n_retorno := -2;
              po_v_msj_error := 'Registro duplicado. Verificar la existencia del OR en el area.';
              ROLLBACK;
              RETURN;
       END IF;
       -----------

      --insert

      insert into t_scob_are_cob_org_resol
        (id_are_org_res, id_area_cobranza, id_organo_resolutivo,
        estado, audfeccreacion, audusucreacion,
        audfecmodificacion, audusumodificacion)
      values
        (SCOB_SQ_ARE_COB_ORG_RESOL.NEXTVAL, pi_v_id_area_cobra, n_Ide,
        '1',sysdate,pi_v_audusucrea,
        null, null)
          RETURNING id_are_org_res INTO po_n_retorno;

      --fin insert
      n_Contador := n_Contador + 1;

    end loop;

    --po_n_retorno := n_Contador;
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

procedure SCOB_SP_D_OR_BY_AREA_COBRA
(
    pi_v_cad_id in varchar2,--|1|2|..
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
)
as

v_cursor  cu_rec_set;
n_Contador number(10,0);
n_Ide number(10,0);
v_Ide_Opcion varchar2(10);

begin


  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  update t_scob_are_cob_org_resol
  set estado = '0'
  where instr(pi_v_cad_id,'|' || to_char(id_are_org_res) || '|' )>0
  and estado = '1';

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

procedure SCOB_SP_S_AREA_ADMINISTRATIVA
(
     pi_vc_id  in number, --comodin 0
     pi_vc_codigo  in varchar2, --comodin ''
     pi_vc_descripcion  in varchar2, --comodin ''
     pi_vc_estado  in char, --comodin ''
     pi_vc_dpto  in varchar2, --comodin ''
     pi_vc_prov  in varchar2, --comodin ''
     pi_vc_dist  in varchar2, --comodin ''
     po_cu_retorno   out cu_rec_set
)
as
begin

  open  po_cu_retorno for

    select
        id_area_adm,
        codigo,
        descipcion as descripcion,
        cod_dpto,
        SCOB_PK_UTILITARIO.SCOB_FN_DEPARTAMENTO(cod_dpto) as des_dpto,
        cod_prov,
        SCOB_PK_UTILITARIO.SCOB_FN_PROVINCIA(cod_prov) as des_prov,
        cod_dist,
        SCOB_PK_UTILITARIO.SCOB_FN_DISTRITO(cod_dist) as des_dist,
        direccion,
        telefono,
        anexo,
        persona_contacto,
        estado
    from
        t_scob_area_administrativa

    where
        (pi_vc_id = 0 or id_area_adm = pi_vc_id) and
        (pi_vc_codigo is null or  codigo = pi_vc_codigo)  and
        --(pi_vc_descripcion is null or descipcion = pi_vc_descripcion) and
        (pi_vc_descripcion is null or fun_scob_nosensite(descipcion) like '%' || fun_scob_nosensite(pi_vc_descripcion)|| '%' ) and
        (pi_vc_estado is null or estado = pi_vc_estado) and
        (pi_vc_dpto  is null or cod_dpto = pi_vc_dpto) and
        (pi_vc_prov is null or cod_prov = pi_vc_prov) and
        (pi_vc_dist  is null or cod_dist = pi_vc_dist);


end;

procedure SCOB_SP_I_AREA_ADMINISTRATIVA
(
    pi_v_codigo      in varchar2,
    pi_v_descripcion      in varchar2,
    pi_v_cod_dpto      in varchar2,
    pi_v_cod_prov      in varchar2,
    pi_v_cod_dist      in varchar2,
    pi_v_direccion      in varchar2,
    pi_v_telefono      in varchar2,
    pi_v_anexo      in varchar2,
    pi_v_contacto      in varchar2,
    pi_v_estado      in varchar2,
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
)
as
v_cursor  cu_rec_set;
v_existe integer;
begin

  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

    ----------------
   SELECT COUNT(t.id_area_adm)
   INTO   v_existe
   FROM   t_scob_area_administrativa t
   WHERE  (upper(t.codigo) = upper(pi_v_codigo) or
          upper(t.descipcion) = upper(pi_v_descripcion))
          and t.estado = '1';

   IF v_existe > 0 THEN
          po_n_cod_error := -2;
          po_n_retorno := -2;
          po_v_msj_error := 'Registro duplicado. Verificar la existencia del codigo y/o descripcion.';
          ROLLBACK;
          RETURN;
   END IF;
   -----------

insert into t_scob_area_administrativa
  (id_area_adm, codigo, descipcion, cod_dpto, cod_prov,
  cod_dist, direccion, telefono, anexo, persona_contacto,
  estado, audfeccreacion, audusucreacion, audfecmodificacion, audusumodificacion)
values
  (SCOB_SQ_AREA_ADMINISTRATIVA.NEXTVAL, pi_v_codigo, pi_v_descripcion, pi_v_cod_dpto, pi_v_cod_prov,
  pi_v_cod_dist, pi_v_direccion, pi_v_telefono, pi_v_anexo, pi_v_contacto,
  pi_v_estado, sysdate, pi_v_audusucrea, null, null)
  RETURNING id_area_adm INTO po_n_retorno;

   commit;

   po_n_cod_error := 0;

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

procedure SCOB_SP_U_AREA_ADMINISTRATIVA
(
    pi_n_id      in number,
    pi_v_codigo      in varchar2,
    pi_v_descripcion      in varchar2,
    pi_v_cod_dpto      in varchar2,
    pi_v_cod_prov      in varchar2,
    pi_v_cod_dist      in varchar2,
    pi_v_direccion      in varchar2,
    pi_v_telefono      in varchar2,
    pi_v_anexo      in varchar2,
    pi_v_contacto      in varchar2,
    pi_v_estado      in varchar2,
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
)
as
v_cursor  cu_rec_set;
v_existe integer;
begin

  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

   ----------------
   SELECT COUNT(u.id_area_adm)
   INTO   v_existe
   FROM   t_scob_area_administrativa u
   WHERE  (upper(u.codigo) = upper(pi_v_codigo) or
          upper(u.descipcion) = upper(pi_v_descripcion)) and
          u.id_area_adm <> pi_n_id and
          u.estado = '1';

   IF v_existe > 0 THEN
          po_n_cod_error := -2;
          po_n_retorno := -2;
          po_v_msj_error := 'Registro duplicado. Verificar la existencia del codigo y/o descripcion.';
          ROLLBACK;
          RETURN;
   END IF;
   -----------

update t_scob_area_administrativa  set
  codigo = pi_v_codigo,
  descipcion = pi_v_descripcion,
  cod_dpto = pi_v_cod_dpto,
  cod_prov = pi_v_cod_prov,
  cod_dist = pi_v_cod_dist,
  direccion = pi_v_direccion,
  telefono = pi_v_telefono,
  anexo = pi_v_anexo,
  persona_contacto = pi_v_contacto,
  estado = pi_v_estado,
  audfecmodificacion = sysdate,
  audusumodificacion = pi_v_audusucrea
  where
     id_area_adm = pi_n_id;

   commit;

   po_n_cod_error := 0;
   po_n_retorno :=pi_n_id;

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

procedure SCOB_SP_D_AREA_ADMINISTRATIVA
(
    pi_v_cad_id in varchar2,--|1|2|..
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
)
as

v_cursor  cu_rec_set;
n_Contador number(10,0);
n_Ide number(10,0);
v_Ide_Opcion varchar2(10);

begin


  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  update t_scob_area_administrativa
  set estado = '0'
  where instr(pi_v_cad_id,'|' || to_char(id_area_adm) || '|' )>0
  and estado = '1';

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

PROCEDURE SCOB_SP_S_CARGO(
   PI_ID_CARGO IN NUMBER,
   PI_COD_INTERNO IN  VARCHAR2,
   PI_DESCRIPCION IN  VARCHAR2,
   /**PI_COD_INTERNO  IN  VARCHAR2,
   PI_DESCRIPCION  IN  VARCHAR2,*/
   PI_COD_AREA IN  VARCHAR2,
   po_cu_retorno  OUT cu_rec_set
)
IS
BEGIN

   OPEN po_cu_retorno FOR

   SELECT
        CA.ID_CARGO AS ID_CARGO,
        CA.CODIGO AS CODIGO,
        CA.DESCRIPCION AS DESCRIPCION,
        CA.AREA AS AREA,
        SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(CONST_TABLA_AREA,CA.AREA) AS DES_TIPO_AREA
   FROM T_SCOB_CARGO CA
   WHERE
       (PI_ID_CARGO = 0 OR  CA.ID_CARGO = PI_ID_CARGO)
       AND (PI_COD_INTERNO IS NULL OR CA.CODIGO = PI_COD_INTERNO)
       AND (PI_DESCRIPCION is null or fun_scob_nosensite(CA.DESCRIPCION) like '%' || fun_scob_nosensite(PI_DESCRIPCION)|| '%' )
       AND (PI_COD_AREA IS NULL OR CA.AREA = PI_COD_AREA)
       AND CA.ESTADO = '1';

        /**SELECT
                TR.ID_TABLA_DET,
                TR.ID_TABLA,
                TR.COD_INTERNO,
                TR.TXT_DESCRIPCION,
                TR.TXT_VALOR1,
                TR.TXT_VALOR2,
                T.FLG_EDITABLE,
                SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(CONST_TABLA_AREA,TR.TXT_VALOR1) AS DES_TIPO_AREA
        FROM    T_SCOB_TABLA_DET TR
                INNER JOIN T_SCOB_TABLA T
        ON  TR.ID_TABLA = T.ID_TABLA
        WHERE   TR.ID_TABLA = CONST_TABLA_CARGO AND
                (PI_COD_INTERNO is null OR TR.COD_INTERNO = PI_COD_INTERNO) AND
                --(PI_DESCRIPCION is null OR PI_DESCRIPCION LIKE '%'||UPPER(TR.TXT_DESCRIPCION)||'%') and
                (PI_DESCRIPCION is null or UPPER(TR.TXT_DESCRIPCION) like '%' || UPPER(PI_DESCRIPCION)|| '%' ) and
                TR.ESTADO = '1';*/


END;

procedure SCOB_SP_I_CARGO
(
    pi_v_codigo      in varchar2,
    pi_v_descripcion      in varchar2,
    pi_v_area      in varchar2,
    pi_v_audusucrea      in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
)
as
v_cursor  cu_rec_set;
v_existe integer;
begin

  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  ----------------
   SELECT COUNT(t.id_cargo)
   INTO   v_existe
   FROM   t_scob_cargo t
   WHERE  (upper(t.codigo) = upper(pi_v_codigo) or
          upper(t.descripcion) = upper(pi_v_descripcion))
          and t.estado = '1'
          AND T.AREA = pi_v_area;

   IF v_existe > 0 THEN
          po_n_cod_error := -2;
          po_n_retorno := -2;
          po_v_msj_error := 'Registro duplicado. Verificar la existencia del codigo y/o descripcion.';
          ROLLBACK;
          RETURN;
   END IF;
   -----------

   insert into t_scob_cargo
     (id_cargo, codigo, descripcion, area, estado,
      audfeccreacion, audusucreacion, audfecmodificacion, audusumodificacion)
    values
     (SCOB_SQ_CARGO.NEXTVAL, pi_v_codigo, pi_v_descripcion, pi_v_area,'1',
     SYSDATE, pi_v_audusucrea,null, null)
     RETURNING id_cargo INTO po_n_retorno;

   commit;
   --ROLLBACK;

   po_n_cod_error := 0;

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

procedure SCOB_SP_U_CARGO
(
    pi_n_id_cargo in number,
    pi_v_codigo in varchar2,
    pi_v_descripcion in varchar2,
    pi_v_area in varchar2,
    pi_v_audusucrea      in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
)
as
v_cursor  cu_rec_set;
v_existe integer;
begin

  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

   ----------------
   SELECT COUNT(u.id_cargo)
   INTO   v_existe
   FROM   t_scob_cargo u
   WHERE  (upper(u.codigo) = upper(pi_v_codigo) or
          upper(u.descripcion) = upper(pi_v_descripcion)) and
          u.id_cargo <> pi_n_id_cargo and
          u.area = pi_v_area
          and u.estado = '1';

   IF v_existe > 0 THEN
          po_n_cod_error := -2;
          po_n_retorno := -2;
          po_v_msj_error := 'Registro duplicado. Verificar la existencia del codigo y/o descripcion.';
          ROLLBACK;
          RETURN;
   END IF;
   -----------

   update t_scob_cargo
      set
          codigo = pi_v_codigo,
          descripcion = pi_v_descripcion,
          area = pi_v_area,
          audfecmodificacion = sysdate,
          audusumodificacion = pi_v_audusucrea
    where id_cargo = pi_n_id_cargo;

   commit;
   --ROLLBACK;

   po_n_cod_error := 0;
   po_n_retorno :=pi_n_id_cargo;

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

procedure SCOB_SP_D_CARGO
(
    pi_v_cad_id in varchar2,--|1|2|..
    pi_v_audusucrea      in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
)
as

v_cursor  cu_rec_set;
n_Contador number(10,0);
n_Ide number(10,0);
v_Ide_Opcion varchar2(10);
I_EXISTE     INTEGER;
begin


  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  --verifica que no se eliminen los registros NO EDITABLES
  SELECT COUNT(CARGO.ID_CARGO)
  INTO I_EXISTE
  FROM T_SCOB_CARGO CARGO
  where instr(pi_v_cad_id,'|' || to_char(CARGO.ID_CARGO) || '|' )>0
  AND CARGO.ESTADO = '1'
  AND CARGO.FLG_NO_EDITABLE = '1';

  IF I_EXISTE > 0 THEN
    po_n_retorno := -10;
    po_n_cod_error := po_n_retorno;
    po_v_msj_error := 'No se puede realizar la accion. No se puede eliminar registros como SECRETARIO TECNICO y/o JEFE AEC.';
    RETURN;
  END IF;

  update t_scob_cargo
  set estado = '0'
  where instr(pi_v_cad_id,'|' || to_char(id_cargo) || '|' )>0
  and estado = '1';

  po_n_cod_error := 0;
  po_n_retorno := '1';

  commit;
  --ROLLBACK;
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

PROCEDURE SCOB_SP_S_TIPO_DOMICILIO(
   PI_ID IN NUMBER,
   PI_COD_INTERNO IN  VARCHAR2,
   PI_DESCRIPCION IN  VARCHAR2,
   po_cu_retorno  OUT cu_rec_set
)
IS
BEGIN

   OPEN po_cu_retorno FOR

   SELECT
        CA.ID_TIPO_DOMICILIO AS ID,
        CA.CODIGO AS CODIGO,
        CA.DESCRIPCION AS DESCRIPCION,
        NVL(CA.FLG_NO_EDITABLE,'0') AS FLG_NO_EDITABLE
   FROM T_SCOB_TIPO_DOMICILIO CA
   WHERE
       (PI_ID = 0 OR  CA.ID_TIPO_DOMICILIO = PI_ID)
       AND (PI_COD_INTERNO IS NULL OR CA.CODIGO = PI_COD_INTERNO)
       AND (PI_DESCRIPCION is null or fun_scob_nosensite(CA.DESCRIPCION) like '%' || fun_scob_nosensite(PI_DESCRIPCION)|| '%' )
       AND CA.ESTADO = '1';
END;

procedure SCOB_SP_I_TIPO_DOMICILIO
(
    pi_v_codigo      in varchar2,
    pi_v_descripcion      in varchar2,
    pi_v_audusucrea      in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
)
as
v_cursor  cu_rec_set;
v_existe integer;
begin

  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  ----------------
   SELECT COUNT(t.id_tipo_domicilio)
   INTO   v_existe
   FROM   t_scob_tipo_domicilio t
   WHERE  (upper(t.codigo) = upper(pi_v_codigo) or
          upper(t.descripcion) = upper(pi_v_descripcion))
          and t.estado = '1';

   IF v_existe > 0 THEN
          po_n_cod_error := -2;
          po_n_retorno := -2;
          po_v_msj_error := 'Registro duplicado. Verificar la existencia del codigo y/o descripcion.';
          ROLLBACK;
          RETURN;
   END IF;
   -----------

   insert into t_scob_tipo_domicilio
     (id_tipo_domicilio, codigo, descripcion, estado,
     audfeccreacion, audusucreacion, audfecmodificacion, audusumodificacion)
   values
     (SCOB_SQ_TIPO_DOMICILIO.NEXTVAL, pi_v_codigo, pi_v_descripcion, '1',
     sysdate, pi_v_audusucrea, null, null)
   RETURNING id_tipo_domicilio INTO po_n_retorno;

   commit;

   po_n_cod_error := 0;

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

procedure SCOB_SP_U_TIPO_DOMICILIO
(
    pi_n_id in number,
    pi_v_codigo in varchar2,
    pi_v_descripcion in varchar2,
    pi_v_audusucrea      in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
)
as
v_cursor  cu_rec_set;
v_existe integer;
begin

  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

   ----------------
   SELECT COUNT(u.id_tipo_domicilio)
   INTO   v_existe
   FROM   t_scob_tipo_domicilio u
   WHERE  (upper(u.codigo) = upper(pi_v_codigo) or
          upper(u.descripcion) = upper(pi_v_descripcion)) and
          u.id_tipo_domicilio <> pi_n_id and
          u.estado = '1';

   IF v_existe > 0 THEN
          po_n_cod_error := -2;
          po_n_retorno := -2;
          po_v_msj_error := 'Registro duplicado. Verificar la existencia del codigo y/o descripcion.';
          ROLLBACK;
          RETURN;
   END IF;
   -----------

   update t_scob_tipo_domicilio
      set
          codigo = pi_v_codigo,
          descripcion = pi_v_descripcion,
          audfecmodificacion = sysdate,
          audusumodificacion = pi_v_audusucrea
    where id_tipo_domicilio = pi_n_id;

   commit;

   po_n_cod_error := 0;
   po_n_retorno :=pi_n_id;

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

procedure SCOB_SP_D_TIPO_DOMICILIO
(
    pi_v_cad_id in varchar2,--|1|2|..
    pi_v_audusucrea      in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
)
as

v_cursor  cu_rec_set;
n_Contador number(10,0);
n_Ide number(10,0);
v_Ide_Opcion varchar2(10);

begin


  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  update t_scob_tipo_domicilio
  set estado = '0'
  where instr(pi_v_cad_id,'|' || to_char(id_tipo_domicilio) || '|' )>0
  and estado = '1';

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

procedure SCOB_SP_S_UIT
(
     pi_n_id  in number, --comodin 0
     po_cu_retorno   out cu_rec_set
)
as
begin

  open  po_cu_retorno for

select
  id_uit,
  descripcion,
  nro_norma,
  fecha_inicio,
  fecha_fin,
  monto_uit,
  estado,
  audfeccreacion,
  audusucreacion,
  audfecmodificacion,
  audusumodificacion
from
  t_scob_uit
where
  (pi_n_id = 0 or id_uit = pi_n_id) and
  estado = '1';

end;

procedure SCOB_SP_I_UIT
(
    pi_v_descripcion in varchar2,
    pi_v_nro_norma in varchar2,
    pi_v_fecha_inicio in varchar2,
    pi_v_fecha_fin in varchar2,
    pi_n_monto_uit in number,
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
)
as
v_cursor  cu_rec_set;
v_existe integer;
begin

  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  ----------------
   SELECT COUNT(t.id_uit)
   INTO   v_existe
   FROM   t_scob_uit t
   WHERE  --upper(t.codigo) = upper(pi_v_codigo) or
          upper(t.descripcion) = upper(pi_v_descripcion) and
          estado = '1';

   IF v_existe > 0 THEN
          po_n_cod_error := -2;
          po_n_retorno := -2;
          po_v_msj_error := 'Registro duplicado. Verificar la existencia de la descripcion.';
          ROLLBACK;
          RETURN;
   END IF;
   -----------
   --DELETE FROM T_SCOB_TMP_FACTOR_DIARIO;
   EXECUTE IMMEDIATE 'TRUNCATE TABLE T_SCOB_TMP_FACTOR_DIARIO';
   -- INSERTANDO LOS FD ACTIVOS
   INSERT INTO T_SCOB_TMP_FACTOR_DIARIO(ID_FACTOR_DIARIO,FEC_INI,FEC_FIN)
   SELECT UIT.ID_UIT,UIT.FECHA_INICIO, UIT.FECHA_FIN
   FROM T_SCOB_UIT UIT
   WHERE UIT.ESTADO = '1';

   -- ACTUALIZANDO EL TMP SI CUMPLE
   UPDATE T_SCOB_TMP_FACTOR_DIARIO
   SET FLG_CRUZA = '1'
   WHERE TO_DATE(PI_V_FECHA_INICIO,'DD/MM/YYYY')
         BETWEEN TO_DATE(TO_CHAR(FEC_INI,'DD/MM/YYYY'),'DD/MM/YYYY')
                 AND TO_DATE(TO_CHAR(FEC_FIN,'DD/MM/YYYY'),'DD/MM/YYYY');

   --- RECORRIENDO TMP SI ALGUN CRUZE
   FOR REC IN (
                 select count(*)CONTADOR
                 from T_SCOB_TMP_FACTOR_DIARIO
                 where flg_cruza = '1'
              )
   LOOP
       V_EXISTE := REC.CONTADOR;
   END LOOP;

   IF v_existe > 0 THEN
          po_n_cod_error := -3;
          po_n_retorno := -3;
          po_v_msj_error := 'REGISTRO DUPLICADO POR CRUCE DE FECHAS.';
          ROLLBACK;
          RETURN;
   END IF;
   -----
   FOR REC IN ( SELECT COUNT(*) CONTADOR
                FROM T_SCOB_TMP_FACTOR_DIARIO
                WHERE
                    TO_DATE(TO_CHAR(FEC_INI,'DD/MM/YYYY'),'DD/MM/YYYY')
                    BETWEEN TO_DATE(pi_v_fecha_inicio,'DD/MM/YYYY')
                            AND TO_DATE(pi_v_fecha_fin,'DD/MM/YYYY')
              )
   LOOP
     V_EXISTE := REC.CONTADOR;
   END LOOP;

   IF v_existe > 0 THEN
          po_n_cod_error := -3;
          po_n_retorno := -3;
          po_v_msj_error := 'REGISTRO DUPLICADO POR CRUCE DE FECHAS.';
          ROLLBACK;
          RETURN;
   END IF;
   ------------

insert into t_scob_uit
  (id_uit, descripcion, nro_norma, fecha_inicio, fecha_fin,
  monto_uit, estado, audfeccreacion, audusucreacion, audfecmodificacion,
  audusumodificacion)
values
  (SCOB_SQ_UIT.NEXTVAL, pi_v_descripcion, pi_v_nro_norma, to_date(pi_v_fecha_inicio,'dd/mm/yyyy'), to_date(pi_v_fecha_fin,'dd/mm/yyyy'),
  pi_n_monto_uit,'1',sysdate, pi_v_audusucrea, null,
  null)
RETURNING id_uit INTO po_n_retorno;

   commit;

   po_n_cod_error := 0;

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

procedure SCOB_SP_U_UIT
(
    pi_n_id in number,
    pi_v_descripcion in varchar2,
    pi_v_nro_norma in varchar2,
    pi_v_fecha_inicio in varchar2,
    pi_v_fecha_fin in varchar2,
    pi_n_monto_uit in number,
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
)
as
v_cursor  cu_rec_set;
v_existe integer;
V_FEC_INI VARCHAR2(10);
begin

  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

   ----------------
   SELECT COUNT(u.id_uit)
   INTO   v_existe
   FROM   t_scob_uit u
   WHERE
          upper(u.descripcion) = upper(pi_v_descripcion)
          and u.id_uit <> pi_n_id
          and u.estado = '1';

   IF v_existe > 0 THEN
          po_n_cod_error := -2;
          po_n_retorno := -2;
          po_v_msj_error := 'Registro duplicado. Verificar la existencia de la descripcion.';
          ROLLBACK;
          RETURN;
   END IF;
   -----------
-----------
   --DELETE FROM T_SCOB_TMP_FACTOR_DIARIO;
   EXECUTE IMMEDIATE 'TRUNCATE TABLE T_SCOB_TMP_FACTOR_DIARIO';
   -- INSERTANDO LAS UIT ACTIVAS
   INSERT INTO T_SCOB_TMP_FACTOR_DIARIO(ID_FACTOR_DIARIO,FEC_INI,FEC_FIN)
   SELECT UIT.ID_UIT,UIT.FECHA_INICIO, UIT.FECHA_FIN
   FROM T_SCOB_UIT UIT
   WHERE UIT.ESTADO = '1';

   -- ACTUALIZANDO EL TMP SI CUMPLE
   UPDATE T_SCOB_TMP_FACTOR_DIARIO
   SET FLG_CRUZA = '1'
   WHERE ID_FACTOR_DIARIO <> pi_n_id
       AND TO_DATE(PI_V_FECHA_INICIO,'DD/MM/YYYY')
         BETWEEN TO_DATE(TO_CHAR(FEC_INI,'DD/MM/YYYY'),'DD/MM/YYYY')
                 AND TO_DATE(TO_CHAR(FEC_FIN,'DD/MM/YYYY'),'DD/MM/YYYY');

   --- RECORRIENDO TMP SI ALGUN CRUZE
   FOR REC IN (
                 select count(*)CONTADOR
                 from T_SCOB_TMP_FACTOR_DIARIO
                 where flg_cruza = '1'
              )
   LOOP
       V_EXISTE := REC.CONTADOR;
   END LOOP;

   IF v_existe > 0 THEN
          po_n_cod_error := -3;
          po_n_retorno := -3;
          po_v_msj_error := 'REGISTRO DUPLICADO POR CRUCE DE FECHAS.';
          ROLLBACK;
          RETURN;
   END IF;
   -----

   FOR REC IN ( SELECT COUNT(*) CONTADOR
                FROM T_SCOB_TMP_FACTOR_DIARIO
                WHERE ID_FACTOR_DIARIO <> pi_n_id
                    AND TO_DATE(TO_CHAR(FEC_INI,'DD/MM/YYYY'),'DD/MM/YYYY')
                    BETWEEN TO_DATE(pi_v_fecha_inicio,'DD/MM/YYYY')
                            AND TO_DATE(pi_v_fecha_fin,'DD/MM/YYYY')
              )
   LOOP
     V_EXISTE := REC.CONTADOR;
   END LOOP;

   IF v_existe > 0 THEN
          po_n_cod_error := -3;
          po_n_retorno := -3;
          po_v_msj_error := 'REGISTRO DUPLICADO POR CRUCE DE FECHAS.';
          ROLLBACK;
          RETURN;
   END IF;
   ------------
update t_scob_uit set
  descripcion = pi_v_descripcion,
  nro_norma = pi_v_nro_norma,
  fecha_inicio = TO_DATE(pi_v_fecha_inicio,'DD/MM/YYYY'),
  fecha_fin = TO_DATE(pi_v_fecha_fin,'DD/MM/YYYY'),
  monto_uit = pi_n_monto_uit,
  audfecmodificacion = sysdate,
  audusumodificacion = pi_v_audusucrea
where
  id_uit = pi_n_id;

   commit;

   po_n_retorno :=pi_n_id;
   po_n_cod_error := 0;

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

procedure SCOB_SP_D_UIT
(
    pi_v_cad_id in varchar2,--|1|2|..
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
)
as

v_cursor  cu_rec_set;
n_Contador number(10,0);
n_Ide number(10,0);
v_Ide_Opcion varchar2(10);

begin


  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  update t_scob_uit
  set estado = '0'
  where instr(pi_v_cad_id,'|' || to_char(id_uit) || '|' )>0
  and estado = '1';

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

procedure SCOB_SP_S_TILE
(
     pi_n_id  in number, --comodin 0
     po_cu_retorno   out cu_rec_set
)
as
begin

  open  po_cu_retorno for

select
  id_tile,
  descripcion,
  nro_norma,
  fecha_inicio,
  fecha_fin,
  monto,
  estado,
  audfeccreacion,
  audusucreacion,
  audfecmodificacion,
  audusumodificacion
from
  t_scob_tile
where
  (pi_n_id = 0 or id_tile = pi_n_id) and
  estado = '1';

end;

procedure SCOB_SP_I_TILE
(
    pi_v_descripcion in varchar2,
    pi_v_nro_norma in varchar2,
    pi_v_fecha_inicio in varchar2,
    pi_v_fecha_fin in varchar2,
    pi_n_monto in number,
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
)
as
v_cursor  cu_rec_set;

begin

  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;


insert into t_scob_tile
  (id_tile, descripcion, nro_norma, fecha_inicio, fecha_fin,
  monto, estado, audfeccreacion, audusucreacion, audfecmodificacion,
  audusumodificacion)
values
  (SCOB_SQ_TILE.NEXTVAL, pi_v_descripcion, pi_v_nro_norma, to_date(pi_v_fecha_inicio,'dd/mm/yyyy'), to_date(pi_v_fecha_fin,'dd/mm/yyyy'),
  pi_n_monto,'1',sysdate, pi_v_audusucrea, null,
  null)
RETURNING id_tile INTO po_n_retorno;

   commit;

   po_n_cod_error := 0;

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

procedure SCOB_SP_U_TILE
(
    pi_n_id in number,
    pi_v_descripcion in varchar2,
    pi_v_nro_norma in varchar2,
    pi_v_fecha_inicio in varchar2,
    pi_v_fecha_fin in varchar2,
    pi_n_monto in number,
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
)
as
v_cursor  cu_rec_set;

begin

  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;


update t_scob_tile set
  descripcion = pi_v_descripcion,
  nro_norma = pi_v_nro_norma,
  fecha_inicio = to_date(pi_v_fecha_inicio,'dd/mm/yyyy'),
  fecha_fin = to_date(pi_v_fecha_fin,'dd/mm/yyyy'),
  monto = pi_n_monto,
  audfecmodificacion = sysdate,
  audusumodificacion = pi_v_audusucrea
where
  id_tile = pi_n_id;

   commit;

   po_n_retorno :=pi_n_id;
   po_n_cod_error := 0;

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

procedure SCOB_SP_D_TILE
(
    pi_v_cad_id in varchar2,--|1|2|..
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
)
as

v_cursor  cu_rec_set;
n_Contador number(10,0);
n_Ide number(10,0);
v_Ide_Opcion varchar2(10);

begin


  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  update t_scob_tile
  set estado = '0'
  where instr(pi_v_cad_id,'|' || to_char(id_tile) || '|' )>0
  and estado = '1';

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

procedure SCOB_SP_S_TIPO_CAMBIO
(
     pi_n_id  in number, --comodin 0
     po_cu_retorno   out cu_rec_set
)
as
begin

  open  po_cu_retorno for

select
  id_tipo_cambio,
  descripcion,
  fecha_inicio,
  fecha_fin,
  monto,
  estado,
  audfeccreacion,
  audusucreacion,
  audfecmodificacion,
  audusumodificacion
from
  t_scob_tipo_cambio
where
  (pi_n_id = 0 or id_tipo_cambio = pi_n_id) and
  estado = '1';

end;

procedure SCOB_SP_I_TIPO_CAMBIO
(
    pi_v_descripcion in varchar2,
    pi_v_fecha_inicio in varchar2,
    pi_v_fecha_fin in varchar2,
    pi_n_monto in number,
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
)
as
v_cursor  cu_rec_set;
v_existe integer;

V_FEC_INI DATE;
V_FEC_FIN DATE;

begin

  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  ----------------
   SELECT COUNT(t.id_tipo_cambio)
   INTO   v_existe
   FROM   t_scob_tipo_cambio t
   WHERE
          upper(t.descripcion) = upper(pi_v_descripcion)
          and estado = '1';

   IF v_existe > 0 THEN
          po_n_cod_error := -2;
          po_n_retorno := -2;
          po_v_msj_error := 'Registro duplicado. Verificar la existencia de la descripcion.';
          ROLLBACK;
          RETURN;
   END IF;
   -----------
   --DELETE FROM T_SCOB_TMP_TIPO_CAMBIO;
   EXECUTE IMMEDIATE 'TRUNCATE TABLE T_SCOB_TMP_TIPO_CAMBIO';
   -- INSERTANDO LOS TC ACTIVOS
   INSERT INTO T_SCOB_TMP_TIPO_CAMBIO(ID_TIPO_CAMBIO,FEC_INI,FEC_FIN)
   SELECT TC.ID_TIPO_CAMBIO,TC.FECHA_INICIO, TC.FECHA_FIN
   FROM T_SCOB_TIPO_CAMBIO TC
   WHERE TC.ESTADO = '1';
   -- ACTUALIZANDO EL TMP SI CUMPLE
   UPDATE T_SCOB_TMP_TIPO_CAMBIO
   SET FLG_CRUZA = '1'
   WHERE TO_DATE(PI_V_FECHA_INICIO,'DD/MM/YYYY')
         BETWEEN TO_DATE(TO_CHAR(FEC_INI,'DD/MM/YYYY'),'DD/MM/YYYY')
                 AND TO_DATE(TO_CHAR(FEC_FIN,'DD/MM/YYYY'),'DD/MM/YYYY');

   --- RECORRIENDO TMP SI ALGUN CRUZE
   FOR REC IN (
                 select count(*)CONTADOR from T_SCOB_TMP_TIPO_CAMBIO where flg_cruza = '1'
              )
   LOOP
       V_EXISTE := REC.CONTADOR;
   END LOOP;

   IF v_existe > 0 THEN
          po_n_cod_error := -3;
          po_n_retorno := -3;
          po_v_msj_error := 'REGISTRO DUPLICADO POR CRUCE DE FECHAS.';
          ROLLBACK;
          RETURN;
   END IF;
   -----
   FOR REC IN ( SELECT COUNT(*) CONTADOR
                FROM T_SCOB_TMP_TIPO_CAMBIO
                WHERE
                    TO_DATE(TO_CHAR(FEC_INI,'DD/MM/YYYY'),'DD/MM/YYYY')
                    BETWEEN TO_DATE(pi_v_fecha_inicio,'DD/MM/YYYY')
                            AND TO_DATE(pi_v_fecha_fin,'DD/MM/YYYY')
              )
   LOOP
     V_EXISTE := REC.CONTADOR;
   END LOOP;

   IF v_existe > 0 THEN
          po_n_cod_error := -3;
          po_n_retorno := -3;
          po_v_msj_error := 'REGISTRO DUPLICADO POR CRUCE DE FECHAS.';
          ROLLBACK;
          RETURN;
   END IF;
   ------------

insert into t_scob_tipo_cambio
  (id_tipo_cambio, descripcion, fecha_inicio, fecha_fin,
  monto, estado, audfeccreacion, audusucreacion, audfecmodificacion,
  audusumodificacion)
values
  (SCOB_SQ_TIPO_CAMBIO.NEXTVAL, pi_v_descripcion, to_date(pi_v_fecha_inicio,'dd/mm/yyyy'), to_date(pi_v_fecha_fin,'dd/mm/yyyy'),
  pi_n_monto,'1',sysdate, pi_v_audusucrea, null,
  null)
RETURNING id_tipo_cambio INTO po_n_retorno;

   commit;

   po_n_cod_error := 0;

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

procedure SCOB_SP_U_TIPO_CAMBIO
(
    pi_n_id in number,
    pi_v_descripcion in varchar2,
    pi_v_fecha_inicio in varchar2,
    pi_v_fecha_fin in varchar2,
    pi_n_monto in number,
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
)
as
v_cursor  cu_rec_set;
v_existe integer;
begin

  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

   ----------------
   SELECT COUNT(u.id_tipo_cambio)
   INTO   v_existe
   FROM   t_scob_tipo_cambio u
   WHERE
          upper(u.descripcion) = upper(pi_v_descripcion)
          and u.id_tipo_cambio <> pi_n_id
          and u.estado = '1';

   IF v_existe > 0 THEN
          po_n_cod_error := -2;
          po_n_retorno := -2;
          po_v_msj_error := 'Registro duplicado. Verificar la existencia de la descripcion.';
          ROLLBACK;
          RETURN;
   END IF;
   -----------
   --DELETE FROM T_SCOB_TMP_TIPO_CAMBIO;
   EXECUTE IMMEDIATE 'TRUNCATE TABLE T_SCOB_TMP_TIPO_CAMBIO';
   -- INSERTANDO LOS TC ACTIVOS
   INSERT INTO T_SCOB_TMP_TIPO_CAMBIO(ID_TIPO_CAMBIO,FEC_INI,FEC_FIN)
   SELECT TC.ID_TIPO_CAMBIO,TC.FECHA_INICIO, TC.FECHA_FIN
   FROM T_SCOB_TIPO_CAMBIO TC
   WHERE TC.ESTADO = '1';

   -- ACTUALIZANDO EL TMP SI CUMPLE
   UPDATE T_SCOB_TMP_TIPO_CAMBIO
   SET FLG_CRUZA = '1'
   WHERE ID_TIPO_CAMBIO <> pi_n_id
       AND TO_DATE(PI_V_FECHA_INICIO,'DD/MM/YYYY')
         BETWEEN TO_DATE(TO_CHAR(FEC_INI,'DD/MM/YYYY'),'DD/MM/YYYY')
                 AND TO_DATE(TO_CHAR(FEC_FIN,'DD/MM/YYYY'),'DD/MM/YYYY');

   --- RECORRIENDO TMP SI ALGUN CRUZE
   FOR REC IN (
                 select count(*)CONTADOR from T_SCOB_TMP_TIPO_CAMBIO where flg_cruza = '1'
              )
   LOOP
       V_EXISTE := REC.CONTADOR;
   END LOOP;

   IF v_existe > 0 THEN
          po_n_cod_error := -3;
          po_n_retorno := -3;
          po_v_msj_error := 'REGISTRO DUPLICADO POR CRUCE DE FECHAS.';
          ROLLBACK;
          RETURN;
   END IF;

   -----
   FOR REC IN ( SELECT COUNT(*) CONTADOR
                FROM T_SCOB_TMP_TIPO_CAMBIO
                WHERE ID_TIPO_CAMBIO <> pi_n_id
                    AND TO_DATE(TO_CHAR(FEC_INI,'DD/MM/YYYY'),'DD/MM/YYYY')
                    BETWEEN TO_DATE(pi_v_fecha_inicio,'DD/MM/YYYY')
                            AND TO_DATE(pi_v_fecha_fin,'DD/MM/YYYY')
              )
   LOOP
     V_EXISTE := REC.CONTADOR;
   END LOOP;

   IF v_existe > 0 THEN
          po_n_cod_error := -3;
          po_n_retorno := -3;
          po_v_msj_error := 'REGISTRO DUPLICADO POR CRUCE DE FECHAS.';
          ROLLBACK;
          RETURN;
   END IF;

   ------------

update t_scob_tipo_cambio set
  descripcion = pi_v_descripcion,
  fecha_inicio = to_date(pi_v_fecha_inicio,'dd/mm/yyyy'),
  fecha_fin = to_date(pi_v_fecha_fin,'dd/mm/yyyy'),
  monto = pi_n_monto,
  audfecmodificacion = sysdate,
  audusumodificacion = pi_v_audusucrea
where
  id_tipo_cambio = pi_n_id;

   commit;

   po_n_retorno :=pi_n_id;
   po_n_cod_error := 0;

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

procedure SCOB_SP_D_TIPO_CAMBIO
(
    pi_v_cad_id in varchar2,--|1|2|..
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
)
as

v_cursor  cu_rec_set;
n_Contador number(10,0);
n_Ide number(10,0);
v_Ide_Opcion varchar2(10);

begin


  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  update t_scob_tipo_cambio
  set estado = '0'
  where instr(pi_v_cad_id,'|' || to_char(id_tipo_cambio) || '|' )>0
  and estado = '1';

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

procedure SCOB_SP_S_FACTOR_DIARIO
(
     pi_n_id  in number, --comodin 0
     po_cu_retorno   out cu_rec_set
)
as
begin

  open  po_cu_retorno for

select
  id_factor_diario,
  descripcion,
  fecha_inicio,
  fecha_fin,
  monto,
  estado,
  audfeccreacion,
  audusucreacion,
  audfecmodificacion,
  audusumodificacion
from
  t_scob_factor_diario
where
  (pi_n_id = 0 or id_factor_diario = pi_n_id) and
  estado = '1';

end;

procedure SCOB_SP_I_FACTOR_DIARIO
(
    pi_v_descripcion in varchar2,
    pi_v_fecha_inicio in varchar2,
    pi_v_fecha_fin in varchar2,
    pi_n_monto in number,
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
)
as
v_cursor  cu_rec_set;
v_existe integer;
begin

  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  ----------------
   SELECT COUNT(t.id_factor_diario)
   INTO   v_existe
   FROM   t_scob_factor_diario t
   WHERE
          upper(t.descripcion) = upper(pi_v_descripcion)
          and estado = '1';

   IF v_existe > 0 THEN
          po_n_cod_error := -2;
          po_n_retorno := -2;
          po_v_msj_error := 'Registro duplicado. Verificar la existencia de la descripcion.';
          ROLLBACK;
          RETURN;
   END IF;
   -----------
   --DELETE FROM T_SCOB_TMP_FACTOR_DIARIO;
   EXECUTE IMMEDIATE 'TRUNCATE TABLE T_SCOB_TMP_FACTOR_DIARIO';
   -- INSERTANDO LOS FD ACTIVOS
   INSERT INTO T_SCOB_TMP_FACTOR_DIARIO(ID_FACTOR_DIARIO,FEC_INI,FEC_FIN)
   SELECT FD.ID_FACTOR_DIARIO,FD.FECHA_INICIO, FD.FECHA_FIN
   FROM T_SCOB_FACTOR_DIARIO FD
   WHERE FD.ESTADO = '1';

   -- ACTUALIZANDO EL TMP SI CUMPLE
   UPDATE T_SCOB_TMP_FACTOR_DIARIO
   SET FLG_CRUZA = '1'
   WHERE TO_DATE(PI_V_FECHA_INICIO,'DD/MM/YYYY')
         BETWEEN TO_DATE(TO_CHAR(FEC_INI,'DD/MM/YYYY'),'DD/MM/YYYY')
                 AND TO_DATE(TO_CHAR(FEC_FIN,'DD/MM/YYYY'),'DD/MM/YYYY');

   --- RECORRIENDO TMP SI ALGUN CRUZE
   FOR REC IN (
                 select count(*)CONTADOR
                 from T_SCOB_TMP_FACTOR_DIARIO
                 where flg_cruza = '1'
              )
   LOOP
       V_EXISTE := REC.CONTADOR;
   END LOOP;

   IF v_existe > 0 THEN
          po_n_cod_error := -3;
          po_n_retorno := -3;
          po_v_msj_error := 'REGISTRO DUPLICADO POR CRUCE DE FECHAS.';
          ROLLBACK;
          RETURN;
   END IF;

   -----
   FOR REC IN ( SELECT COUNT(*) CONTADOR
                FROM T_SCOB_TMP_FACTOR_DIARIO
                WHERE
                    TO_DATE(TO_CHAR(FEC_INI,'DD/MM/YYYY'),'DD/MM/YYYY')
                    BETWEEN TO_DATE(pi_v_fecha_inicio,'DD/MM/YYYY')
                            AND TO_DATE(pi_v_fecha_fin,'DD/MM/YYYY')
              )
   LOOP
     V_EXISTE := REC.CONTADOR;
   END LOOP;

   IF v_existe > 0 THEN
          po_n_cod_error := -3;
          po_n_retorno := -3;
          po_v_msj_error := 'REGISTRO DUPLICADO POR CRUCE DE FECHAS.';
          ROLLBACK;
          RETURN;
   END IF;
   ------------

insert into t_scob_factor_diario
  (id_factor_diario, descripcion, fecha_inicio, fecha_fin,
  monto, estado, audfeccreacion, audusucreacion, audfecmodificacion,
  audusumodificacion)
values
  (SCOB_SQ_FACTOR_DIARIO.NEXTVAL, pi_v_descripcion, to_date(pi_v_fecha_inicio,'dd/mm/yyyy'), to_date(pi_v_fecha_fin,'dd/mm/yyyy'),
  pi_n_monto,'1',sysdate, pi_v_audusucrea, null,
  null)
RETURNING id_factor_diario INTO po_n_retorno;

   commit;

   po_n_cod_error := 0;

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

procedure SCOB_SP_U_FACTOR_DIARIO
(
    pi_n_id in number,
    pi_v_descripcion in varchar2,
    pi_v_fecha_inicio in varchar2,
    pi_v_fecha_fin in varchar2,
    pi_n_monto in number,
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
)
as
v_cursor  cu_rec_set;
v_existe integer;
begin

  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;


   ----------------
   SELECT COUNT(u.id_factor_diario)
   INTO   v_existe
   FROM   t_scob_factor_diario u
   WHERE
          upper(u.descripcion) = upper(pi_v_descripcion) and
          u.id_factor_diario <> pi_n_id and
          u.estado = '1';

   IF v_existe > 0 THEN
          po_n_cod_error := -2;
          po_n_retorno := -2;
          po_v_msj_error := 'Registro duplicado. Verificar la existencia de la descripcion.';
          ROLLBACK;
          RETURN;
   END IF;
   -----------
-----------
   --DELETE FROM T_SCOB_TMP_FACTOR_DIARIO;
   EXECUTE IMMEDIATE 'TRUNCATE TABLE T_SCOB_TMP_FACTOR_DIARIO';
   -- INSERTANDO LOS FD ACTIVOS
   INSERT INTO T_SCOB_TMP_FACTOR_DIARIO(ID_FACTOR_DIARIO,FEC_INI,FEC_FIN)
   SELECT FD.ID_FACTOR_DIARIO,FD.FECHA_INICIO, FD.FECHA_FIN
   FROM T_SCOB_FACTOR_DIARIO FD
   WHERE FD.ESTADO = '1';

   -- ACTUALIZANDO EL TMP SI CUMPLE
   UPDATE T_SCOB_TMP_FACTOR_DIARIO
   SET FLG_CRUZA = '1'
   WHERE ID_FACTOR_DIARIO <> pi_n_id
       AND TO_DATE(PI_V_FECHA_INICIO,'DD/MM/YYYY')
         BETWEEN TO_DATE(TO_CHAR(FEC_INI,'DD/MM/YYYY'),'DD/MM/YYYY')
                 AND TO_DATE(TO_CHAR(FEC_FIN,'DD/MM/YYYY'),'DD/MM/YYYY');

   --- RECORRIENDO TMP SI ALGUN CRUZE
   FOR REC IN (
                 select count(*)CONTADOR
                 from T_SCOB_TMP_FACTOR_DIARIO
                 where flg_cruza = '1'
              )
   LOOP
       V_EXISTE := REC.CONTADOR;
   END LOOP;

   IF v_existe > 0 THEN
          po_n_cod_error := -3;
          po_n_retorno := -3;
          po_v_msj_error := 'REGISTRO DUPLICADO POR CRUCE DE FECHAS.';
          ROLLBACK;
          RETURN;
   END IF;

   -----
   FOR REC IN ( SELECT COUNT(*) CONTADOR
                FROM T_SCOB_TMP_FACTOR_DIARIO
                WHERE ID_FACTOR_DIARIO <> pi_n_id
                    and TO_DATE(TO_CHAR(FEC_INI,'DD/MM/YYYY'),'DD/MM/YYYY')
                    BETWEEN TO_DATE(pi_v_fecha_inicio,'DD/MM/YYYY')
                            AND TO_DATE(pi_v_fecha_fin,'DD/MM/YYYY')
              )
   LOOP
     V_EXISTE := REC.CONTADOR;
   END LOOP;

   IF v_existe > 0 THEN
          po_n_cod_error := -3;
          po_n_retorno := -3;
          po_v_msj_error := 'REGISTRO DUPLICADO POR CRUCE DE FECHAS.';
          ROLLBACK;
          RETURN;
   END IF;
   ------------

update t_scob_factor_diario set
  descripcion = pi_v_descripcion,
  fecha_inicio = TO_DATE(pi_v_fecha_inicio,'DD/MM/YYYY'),
  fecha_fin = TO_DATE(pi_v_fecha_fin,'DD/MM/YYYY'),
  monto = pi_n_monto,
  audfecmodificacion = sysdate,
  audusumodificacion = pi_v_audusucrea
where
  id_factor_diario = pi_n_id;

   commit;

   po_n_retorno :=pi_n_id;
   po_n_cod_error := 0;

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

procedure SCOB_SP_D_FACTOR_DIARIO
(
    pi_v_cad_id in varchar2,--|1|2|..
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
)
as

v_cursor  cu_rec_set;
n_Contador number(10,0);
n_Ide number(10,0);
v_Ide_Opcion varchar2(10);

begin


  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  update t_scob_factor_diario
  set estado = '0'
  where instr(pi_v_cad_id,'|' || to_char(id_factor_diario) || '|' )>0
  and estado = '1';

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

procedure SCOB_SP_S_ENT_FINANCIERA
(
     pi_n_id  in number, --comodin 0
     pi_v_nombre  in varchar2, --comodin ''
     pi_v_tip_ent_financiera  in varchar2, --comodin ''
     pi_v_estado  in varchar2, --comodin ''
     po_cu_retorno   out cu_rec_set
)
as
begin

  open  po_cu_retorno for

select
  id_entidad_financiera,
  nombre,
  direccion,
  contacto,
  tip_ent_financiera,
  scob_pk_utilitario.SCOB_FN_TABLA_DET_DES(CONST_TABLA_TIPO_ENT_FINAN,tip_ent_financiera) as des_tip_ent_financiera,
  estado,
  scob_pk_utilitario.SCOB_FN_TABLA_DET_DES(CONST_TABLA_ESTADO,estado) as des_estado,
  saldo_minimo_envio_bco as saldo_minimo_envio_bco,
  audfeccreacion,
  audusucreacion,
  audfecmodificacion,
  audusumodificacion
from
  t_scob_entidad_financiera
where
  (pi_n_id = 0 or id_entidad_financiera = pi_n_id) and
  (pi_v_nombre is null or fun_scob_nosensite(nombre) like '%'||fun_scob_nosensite(pi_v_nombre)||'%') and
  (pi_v_tip_ent_financiera is null or tip_ent_financiera = pi_v_tip_ent_financiera) and
  (pi_v_estado is null or estado = pi_v_estado);


end;

procedure SCOB_SP_I_ENT_FINANCIERA
(
    pi_v_nombre in varchar2,
    pi_v_direccion in varchar2,
    pi_v_contacto in varchar2,
    pi_v_tip_ent_financiera in varchar2,
    pi_v_estado in varchar2,
    pi_n_saldo_minimo_envio_bco in number,
    pi_v_audusucrea in varchar2,
    pi_v_nom_usured in varchar2,
    pi_v_nom_estred in varchar2,
    pi_v_aud_ip_lan in varchar2,
    pi_v_aud_ip_wan in varchar2,
    po_n_retorno out number,
    po_n_cod_error out number,
    po_v_msj_error out varchar2
)
as
v_cursor  cu_rec_set;

begin

  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

insert into t_scob_entidad_financiera
  (id_entidad_financiera, nombre, direccion, contacto, tip_ent_financiera,
  estado,saldo_minimo_envio_bco, audfeccreacion, audusucreacion, audfecmodificacion, audusumodificacion)
values
  (SCOB_SQ_ENTIDAD_FINANCIERA.nextval, pi_v_nombre, pi_v_direccion, pi_v_contacto, pi_v_tip_ent_financiera,
  pi_v_estado,pi_n_saldo_minimo_envio_bco, sysdate, pi_v_audusucrea, null, null)
  RETURNING id_entidad_financiera INTO po_n_retorno;

  commit;

  po_n_cod_error := 0;

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

procedure SCOB_SP_U_ENT_FINANCIERA
(
    pi_n_id in number,
    pi_v_nombre in varchar2,
    pi_v_direccion in varchar2,
    pi_v_contacto in varchar2,
    pi_v_tip_ent_financiera in varchar2,
    pi_v_estado in varchar2,
    pi_n_saldo_minimo_envio_bco in number,
    pi_v_audusucrea in varchar2,
    pi_v_nom_usured in varchar2,
    pi_v_nom_estred in varchar2,
    pi_v_aud_ip_lan in varchar2,
    pi_v_aud_ip_wan in varchar2,
    po_n_retorno out number,
    po_n_cod_error out number,
    po_v_msj_error out varchar2
)
as
v_cursor  cu_rec_set;

begin

  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

update t_scob_entidad_financiera set
  nombre = pi_v_nombre,
  direccion = pi_v_direccion,
  contacto = pi_v_contacto,
  tip_ent_financiera = pi_v_tip_ent_financiera,
  estado = pi_v_estado,
  saldo_minimo_envio_bco = pi_n_saldo_minimo_envio_bco,
  audfecmodificacion = sysdate,
  audusumodificacion = pi_v_audusucrea
 where
      id_entidad_financiera = pi_n_id;

  commit;
  po_n_retorno := pi_n_id;
  po_n_cod_error := 0;

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

procedure SCOB_SP_D_ENT_FINANCIERA
(
    pi_v_cad_id in varchar2,--|1|2|..
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
)
as

v_cursor  cu_rec_set;
n_Contador number(10,0);
n_Ide number(10,0);
v_Ide_Opcion varchar2(10);

begin


  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  update t_scob_entidad_financiera
  set estado = '0'
  where instr(pi_v_cad_id,'|' || to_char(id_entidad_financiera) || '|' )>0
  and estado = '1';

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

procedure SCOB_SP_S_PARTIDA
(
     pi_n_id  in number, --comodin 0
     pi_v_codigo  in varchar2, --comodin ''
     pi_v_descripcion  in varchar2, --comodin ''
     pi_v_estado  in varchar2, --comodin ''
     po_cu_retorno   out cu_rec_set
)
as
begin

  open  po_cu_retorno for

select
       id_partida,
       codigo,
       descripcion,
       estado,
       scob_pk_utilitario.SCOB_FN_TABLA_DET_DES(CONST_TABLA_ESTADO,estado) as des_estado
from
       t_scob_partida
where
  (pi_n_id = 0 or id_partida = pi_n_id) and
  (pi_v_codigo is null or fun_scob_nosensite(codigo) like '%'||fun_scob_nosensite(pi_v_codigo)||'%') and
  (pi_v_descripcion is null or fun_scob_nosensite(descripcion) like '%'||fun_scob_nosensite(pi_v_descripcion)||'%') and
  (pi_v_estado is null or estado = pi_v_estado)
  order by codigo;

end;

procedure SCOB_SP_I_PARTIDA
(
    pi_v_codigo in varchar2,
    pi_v_descripcion in varchar2,
    pi_v_estado in varchar2,
    pi_v_audusucrea in varchar2,
    pi_v_nom_usured in varchar2,
    pi_v_nom_estred in varchar2,
    pi_v_aud_ip_lan in varchar2,
    pi_v_aud_ip_wan in varchar2,
    po_n_retorno out number,
    po_n_cod_error out number,
    po_v_msj_error out varchar2
)
as
v_cursor  cu_rec_set;

begin

  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

insert into t_scob_partida
  (id_partida, codigo, descripcion, estado, audfeccreacion,
  audusucreacion, audfecmodificacion, audusumodificacion)
values
  (SCOB_SQ_PARTIDA.NEXTVAL, pi_v_codigo, pi_v_descripcion, pi_v_estado, sysdate,
  pi_v_audusucrea, null, null)
  RETURNING id_partida INTO po_n_retorno;

  commit;

  po_n_cod_error := 0;

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

procedure SCOB_SP_U_PARTIDA
(
    pi_n_id in number,
    pi_v_codigo in varchar2,
    pi_v_descripcion in varchar2,
    pi_v_estado in varchar2,
    pi_v_audusucrea in varchar2,
    pi_v_nom_usured in varchar2,
    pi_v_nom_estred in varchar2,
    pi_v_aud_ip_lan in varchar2,
    pi_v_aud_ip_wan in varchar2,
    po_n_retorno out number,
    po_n_cod_error out number,
    po_v_msj_error out varchar2
)
as
v_cursor  cu_rec_set;

begin

  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

update t_scob_partida set
  codigo = pi_v_codigo,
  descripcion = pi_v_descripcion,
  estado = pi_v_estado,
  audfecmodificacion = sysdate,
  audusumodificacion = pi_v_audusucrea
where
id_partida = pi_n_id;

  commit;

  po_n_retorno := pi_n_id;
  po_n_cod_error := 0;

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

procedure SCOB_SP_D_PARTIDA
(
    pi_v_cad_id in varchar2,--|1|2|..
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
)
as

v_cursor  cu_rec_set;
n_Contador number(10,0);
n_Ide number(10,0);
v_Ide_Opcion varchar2(10);

begin


  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  update t_scob_partida
  set estado = '0'
  where instr(pi_v_cad_id,'|' || to_char(id_partida) || '|' )>0
  and estado = '1';

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

procedure SCOB_SP_S_FERIADO
(
     pi_n_id  in number, --comodin 0
     pi_v_fecferiado  in varchar2, --comodin ''
     pi_v_fecferiado2  in varchar2, --comodin ''
     pi_v_descripcion  in varchar2, --comodin ''
     pi_v_estado  in varchar2, --comodin ''
     pi_v_regional  in varchar2, --comodin ''
     po_cu_retorno   out cu_rec_set
)
as
v_regional char(1);
begin

   SELECT
           DECODE(pi_v_regional, '', '*', pi_v_regional)
     INTO
           v_regional
     FROM
           DUAL;

  open  po_cu_retorno for

select
  f.id_feriado as id_feriado,
  f.fecha as fecha,
  f.descripcion as descripcion,
  f.estado as estado,
  scob_pk_utilitario.SCOB_FN_TABLA_DET_DES(CONST_TABLA_ESTADO,estado) as des_estado,
  f.regional as regional
from
  t_scob_feriado f
where
  (pi_n_id = 0 or id_feriado = pi_n_id) and
 -- ((pi_v_fecferiadoini is null and pi_v_fecferiadofin is null) or fecha = to_date(pi_v_fecferiado,'dd/mm/yyyy')) and
   --feriado
  (
  pi_v_fecferiado IS NULL AND pi_v_fecferiado2 IS NULL
  or
  TO_DATE(TO_CHAR(f.fecha ,'DD/MM/YYYY'),'DD/MM/YYYY')
  BETWEEN TO_DATE(pi_v_fecferiado,'DD/MM/YYYY') AND TO_DATE(pi_v_fecferiado2,'DD/MM/YYYY')
  )and

  (pi_v_descripcion is null or fun_scob_nosensite(descripcion) like '%'||fun_scob_nosensite(pi_v_descripcion)||'%') and
  (v_regional = '*' or regional = v_regional) and
  (pi_v_estado is null or estado = pi_v_estado);



end;

procedure SCOB_SP_I_FERIADO
(
    pi_v_fecha in varchar2,
    pi_v_descripcion in varchar2,
    pi_v_estado in varchar2,
    pi_v_regional in varchar2,
    pi_v_audusucrea in varchar2,
    po_n_retorno out number,
    po_n_cod_error out number,
    po_v_msj_error out varchar2
)
as
v_cursor  cu_rec_set;
v_existe int;
begin

  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  ----------------
   SELECT COUNT(id_feriado)
   INTO   v_existe
   FROM   t_scob_feriado t
   WHERE  fecha = to_date(pi_v_fecha,'dd/mm/yyyy')
          and estado = '1';

   IF v_existe > 0 THEN
          po_n_cod_error := -2;
          po_n_retorno := -2;
          po_v_msj_error := 'Registro duplicado. Verificar la existencia de la fecha.';
          ROLLBACK;
          RETURN;
   END IF;
   -----------

  insert into t_scob_feriado
    (id_feriado, fecha, descripcion, estado,regional, audfeccreacion,
    audusucreacion, audfecmodificacion, audusumodificacion)
  values
    (SCOB_SQ_FERIADO.NEXTVAL, to_date(pi_v_fecha,'dd/mm/yyyy'), pi_v_descripcion, pi_v_estado,pi_v_regional, sysdate,
    pi_v_audusucrea, null, null)
    RETURNING id_feriado INTO po_n_retorno;

  commit;

  po_n_cod_error := 0;

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

procedure SCOB_SP_U_FERIADO
(
    pi_n_id in number,
    pi_v_fecha in varchar2,
    pi_v_descripcion in varchar2,
    pi_v_estado in varchar2,
    pi_v_regional in varchar2,
    pi_v_audusucrea in varchar2,
    po_n_retorno out number,
    po_n_cod_error out number,
    po_v_msj_error out varchar2
)
as
v_cursor  cu_rec_set;
v_existe int;
begin

  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  ----------------
   SELECT COUNT(id_feriado)
   INTO   v_existe
   FROM   t_scob_feriado t
   WHERE  fecha = to_date(pi_v_fecha,'dd/mm/yyyy')
          --and regional = pi_v_regional and
          and estado = '1' and
          id_feriado <> pi_n_id ;

   IF v_existe > 0 THEN
          po_n_cod_error := -2;
          po_n_retorno := -2;
          po_v_msj_error := 'Registro duplicado. Verificar la existencia de la fecha.';
          ROLLBACK;
          RETURN;
   END IF;
   -----------

update t_scob_feriado set
  fecha = TO_DATE(pi_v_fecha,'DD/MM/YYYY'),
  descripcion = pi_v_descripcion,
  estado = pi_v_estado,
  regional = pi_v_regional,
  audfeccreacion = sysdate,
  audusucreacion = pi_v_audusucrea
where
 id_feriado = pi_n_id;

  commit;

  po_n_cod_error := 0;
  po_n_retorno := pi_n_id;

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

procedure SCOB_SP_D_FERIADO
(
    pi_v_cad_id in varchar2,--|1|2|..
    pi_v_audusucrea      in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
)
as

v_cursor  cu_rec_set;
n_Contador number(10,0);
n_Ide number(10,0);
v_Ide_Opcion varchar2(10);

begin


  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  update t_scob_feriado
  set estado = '0'
  where instr(pi_v_cad_id,'|' || to_char(id_feriado) || '|' )>0
  and estado = '1';

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

procedure SCOB_SP_S_COSTA
(
     pi_n_id  in number, --comodin 0
     pi_v_codigo  in varchar2, --comodin ''
     pi_v_descripcion  in varchar2, --comodin ''
     pi_v_estado  in varchar2, --comodin ''
     po_cu_retorno   out cu_rec_set
)
as
begin

  open  po_cu_retorno for

select
  c.id_costa,
  c.codigo,
  c.descripcion,
  c.porcentaje_uit,
  c.porcentaje_uit_max,
  c.valor_soles,
  c.estado as estado,
  td.txt_descripcion as nom_estado,
  c.flg_uit_max,
  nvl(c.flg_gasto,'0') as flg_gasto
from
  t_scob_costa c
left join t_scob_tabla_det td
     on td.id_tabla = scob_pk_constantes.C_TBL_ESTADO_REGISTRO
     and td.cod_interno = c.estado
where
  (pi_n_id = 0 or pi_n_id = id_costa) and
  (pi_v_codigo is null or pi_v_codigo = codigo) and
  (pi_v_descripcion is null or fun_scob_nosensite(descripcion) like '%'||fun_scob_nosensite(pi_v_descripcion)||'%' ) and
  (pi_v_estado is null or pi_v_estado = c.estado);


end;

procedure SCOB_SP_I_COSTA
(
    pi_v_codigo in varchar2,
    pi_v_descripcion in varchar2,
    pi_n_porcentaje_uit in number,
    pi_n_porcentaje_max in number,
    pi_c_ind_uit_max in char,
    pi_n_valor_soles in number,
    pi_v_estado in varchar2,
    pi_v_audusucrea in varchar2,
    pi_v_nom_usured in varchar2,
    pi_v_nom_estred in varchar2,
    pi_v_aud_ip_lan in varchar2,
    pi_v_aud_ip_wan in varchar2,
    po_n_retorno out number,
    po_n_cod_error out number,
    po_v_msj_error out varchar2
)
as
v_cursor  cu_rec_set;
v_existe integer;
begin

  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  ----------------
   SELECT COUNT(t.id_costa)
   INTO   v_existe
   FROM   t_scob_costa t
   WHERE  (upper(t.codigo) = upper(pi_v_codigo) or
          upper(t.descripcion) = upper(pi_v_descripcion))
          and t.estado = '1';

   IF v_existe > 0 THEN
          po_n_cod_error := -2;
          po_n_retorno := -2;
          po_v_msj_error := 'Registro duplicado. Verificar la existencia del codigo y/o descripcion.';
          ROLLBACK;
          RETURN;
   END IF;
   -----------

insert into t_scob_costa
  (id_costa, codigo, descripcion, porcentaje_uit, valor_soles,
  estado, audfeccreacion, audusucreacion, audfecmodificacion, audusumodificacion,
  PORCENTAJE_UIT_MAX, FLG_UIT_MAX
  )
values
  (SCOB_SQ_COSTA.NEXTVAL,   pi_v_codigo,   pi_v_descripcion,   pi_n_porcentaje_uit,   pi_n_valor_soles,
   pi_v_estado, sysdate, pi_v_audusucrea, null, null,
   DECODE(NVL(pi_n_porcentaje_max,'0'),'0',NULL,pi_n_porcentaje_max), NVL(pi_c_ind_uit_max,'0')
   )
  RETURNING id_costa INTO po_n_retorno;

  commit;

  po_n_cod_error := 0;

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

procedure SCOB_SP_U_COSTA
(
    pi_n_id in number,
    pi_v_codigo in varchar2,
    pi_v_descripcion in varchar2,
    pi_n_porcentaje_uit in number,
    pi_n_porcentaje_max in number,
    pi_c_ind_uit_max in char,
    pi_n_valor_soles in number,
    pi_v_estado in varchar2,
    pi_v_audusucrea in varchar2,
    pi_v_nom_usured in varchar2,
    pi_v_nom_estred in varchar2,
    pi_v_aud_ip_lan in varchar2,
    pi_v_aud_ip_wan in varchar2,
    po_n_retorno out number,
    po_n_cod_error out number,
    po_v_msj_error out varchar2
)
as
v_cursor  cu_rec_set;
v_existe integer;
begin

  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

   ----------------
   SELECT COUNT(u.id_costa)
   INTO   v_existe
   FROM   t_scob_costa u
   WHERE  (upper(u.codigo) = upper(pi_v_codigo) or
          upper(u.descripcion) = upper(pi_v_descripcion))
          and u.id_costa <> pi_n_id
          and u.estado = '1';

   IF v_existe > 0 THEN
          po_n_cod_error := -2;
          po_n_retorno := -2;
          po_v_msj_error := 'Registro duplicado. Verificar la existencia del codigo y/o descripcion.';
          ROLLBACK;
          RETURN;
   END IF;
   -----------


update t_scob_costa set

  codigo = pi_v_codigo,
  descripcion = pi_v_descripcion,
  porcentaje_uit = pi_n_porcentaje_uit,
  PORCENTAJE_UIT_MAX = DECODE(NVL(pi_c_ind_uit_max,'0'),'0',NULL,pi_n_porcentaje_max),
  FLG_UIT_MAX = NVL(pi_c_ind_uit_max,'0'),
  valor_soles = pi_n_valor_soles,
  estado = pi_v_estado,
  audfecmodificacion = sysdate,
  audusumodificacion = pi_v_audusucrea
where
  id_costa = pi_n_id;

 po_n_retorno:=pi_n_id;

  commit;

  po_n_cod_error := 0;

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

procedure SCOB_SP_D_COSTA
(
    pi_v_cad_id in varchar2,--|1|2|..
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
)
as

v_cursor  cu_rec_set;
n_Contador number(10,0);
n_Ide number(10,0);
v_Ide_Opcion varchar2(10);
i_existe integer;

begin

  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  --verificar si se intenta eliminar el registro "gastos"
  select count(ID_COSTA)
  into i_existe
  from t_scob_costa
  where instr(pi_v_cad_id,'|' || to_char(id_costa) || '|' )>0
  and nvl(flg_gasto,'0') = '1';

  if i_existe > 0 then
     po_v_msj_error := 'No se puede realizar la accion. El sistema no permite eliminar el registro GASTOS.';
     po_n_retorno := -11;
     po_n_cod_error := po_n_retorno;
     return;
  end if;

  update t_scob_costa
  set estado = '0'
  where instr(pi_v_cad_id,'|' || to_char(id_costa) || '|' )>0
  and estado = '1';

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

procedure SCOB_SP_S_EST_EXP_COB
(
     pi_n_id  in number, --comodin 0
     pi_v_codigo  in varchar2, --comodin ''
     pi_v_descripcion  in varchar2, --comodin ''
     pi_v_estado  in varchar2, --comodin ''
     po_cu_retorno   out cu_rec_set
)
as
begin

  open  po_cu_retorno for

--  SELECT *FROM DUAL;
/** FALTA*/

select
  id_est_exp_cob,
  codigo,
  descripcion,
  estado,
  SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(CONST_TABLA_ESTADO,estado)  as des_estado
from
  t_scob_est_exp_cob
where
  (pi_n_id = 0 or pi_n_id = id_est_exp_cob) and
  (pi_v_codigo is null or pi_v_codigo = codigo) and
  (pi_v_descripcion is null or fun_scob_nosensite(descripcion) like '%'||fun_scob_nosensite(pi_v_descripcion)||'%' ) and
  (pi_v_estado is null or pi_v_estado = estado);

end;

procedure SCOB_SP_I_EST_EXP_COB
(
    pi_v_codigo in varchar2,
    pi_v_descripcion in varchar2,
    pi_v_estado in varchar2,
    pi_v_audusucrea in varchar2,
    pi_v_nom_usured in varchar2,
    pi_v_nom_estred in varchar2,
    pi_v_aud_ip_lan in varchar2,
    pi_v_aud_ip_wan in varchar2,
    po_n_retorno out number,
    po_n_cod_error out number,
    po_v_msj_error out varchar2
)
as
v_cursor  cu_rec_set;

begin

  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

/** FALTA

insert into t_scob_est_exp_cob
  (id_est_exp_cob, codigo, descripcion, estado, audfeccreacion,
  audusucreacion, audfecmodificacion, audusumodificacion)
values
  (SCOB_SQ_EST_EXP_COB.NEXTVAL, pi_v_codigo, pi_v_descripcion, pi_v_estado, sysdate,
  pi_v_audusucrea, null, null)
  RETURNING id_est_exp_cob INTO po_n_retorno;*/

  commit;

  po_n_cod_error := 0;

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

procedure SCOB_SP_U_EST_EXP_COB
(
    pi_n_id in number,
    pi_v_codigo in varchar2,
    pi_v_descripcion in varchar2,
    pi_v_estado in varchar2,
    pi_v_audusucrea in varchar2,
    pi_v_nom_usured in varchar2,
    pi_v_nom_estred in varchar2,
    pi_v_aud_ip_lan in varchar2,
    pi_v_aud_ip_wan in varchar2,
    po_n_retorno out number,
    po_n_cod_error out number,
    po_v_msj_error out varchar2
)
as
v_cursor  cu_rec_set;

begin

  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

/** FALTA

update t_scob_est_exp_cob set

  codigo = pi_v_codigo,
  descripcion = pi_v_descripcion,
  estado = pi_v_estado,
  audfecmodificacion = sysdate,
  audusumodificacion = pi_v_audusucrea
where
  id_est_exp_cob = pi_n_id; */

 po_n_retorno:=pi_n_id;

  commit;

  po_n_cod_error := 0;

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

procedure SCOB_SP_D_EST_EXP_COB
(
    pi_v_cad_id in varchar2,--|1|2|..
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
)
as

v_cursor  cu_rec_set;
n_Contador number(10,0);
n_Ide number(10,0);
v_Ide_Opcion varchar2(10);

begin

  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

/** FALTA

update t_scob_est_exp_cob
  set estado = '0'
  where instr(pi_v_cad_id,'|' || to_char(id_est_exp_cob) || '|' )>0
  and estado = '1';*/

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

procedure SCOB_SP_S_EST_EXP_COB_MOT
(
     pi_n_id  in number, --comodin 0
     pi_n_id_est_exp_cob  in number, --comodin 0
     pi_v_codigo  in varchar2, --comodin ''
     pi_v_descripcion  in varchar2, --comodin ''
     pi_v_estado  in varchar2, --comodin ''
     pi_v_flg_no_editable  in char, --comodin ''
     po_cu_retorno   out cu_rec_set
)
as
begin

  open  po_cu_retorno for

select
  id_motivo,
  id_est_exp_cob,
  codigo,
  descripcion,
  estado,
  SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(CONST_TABLA_ESTADO,estado)  as des_estado,
  FLG_NO_EDITABLE as flg_no_editable,
  FLG_REQ_GARANTIA as flg_req_garantia,
  nvl(FLG_EXTRANET,'0') as FLG_EXTRANET
  ,NVL(FLG_EXTRANET_CONSULTA,'0') AS FLG_EXTRANET_CONSULTA
from
  t_scob_est_exp_cob_motivo
where
  (pi_n_id = 0 or pi_n_id = id_motivo) and
  (pi_n_id_est_exp_cob = 0 or pi_n_id_est_exp_cob = id_est_exp_cob) and
  (pi_v_codigo is null or pi_v_codigo = codigo) and
  (pi_v_descripcion is null or fun_scob_nosensite(descripcion) like '%'||fun_scob_nosensite(pi_v_descripcion)||'%' ) and
  (pi_v_estado is null or pi_v_estado = estado) and
  (pi_v_flg_no_editable is null or pi_v_flg_no_editable = flg_no_editable);

end;

procedure SCOB_SP_I_EST_EXP_COB_MOT
(
    pi_n_id_est_exp_cob in number,
    pi_v_codigo in varchar2,
    pi_v_descripcion in varchar2,
    pi_v_estado in varchar2,
    pi_v_audusucrea in varchar2,
    pi_v_nom_usured in varchar2,
    pi_v_nom_estred in varchar2,
    pi_v_aud_ip_lan in varchar2,
    pi_v_aud_ip_wan in varchar2,
    po_n_retorno out number,
    po_n_cod_error out number,
    po_v_msj_error out varchar2
)
as
v_cursor  cu_rec_set;
v_existe integer;
begin

  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

    ----------------
   SELECT COUNT(T.ID_MOTIVO)
   INTO   v_existe
   FROM   t_scob_est_exp_cob_motivo t
   WHERE  (upper(t.codigo) = upper(pi_v_codigo) or
          upper(t.descripcion) = upper(pi_v_descripcion)) and
          t.id_est_exp_cob = pi_n_id_est_exp_cob and
          t.estado = '1';

   IF v_existe > 0 THEN
          po_n_cod_error := -2;
          po_n_retorno := -2;
          po_v_msj_error := 'Registro duplicado. Verificar la existencia del codigo y/o descripcion.';
          ROLLBACK;
          RETURN;
   END IF;
   -----------


insert into t_scob_est_exp_cob_motivo
  (id_motivo, id_est_exp_cob, codigo, descripcion, estado,
  audfeccreacion, audusucreacion, audfecmodificacion, audusumodificacion,FLG_NO_EDITABLE)
values
  (SCOB_SQ_EST_EXP_COB_MOTIVO.NEXTVAL, pi_n_id_est_exp_cob, pi_v_codigo, pi_v_descripcion, pi_v_estado,
  sysdate, pi_v_audusucrea, null, null,'0')
  RETURNING id_motivo INTO po_n_retorno;

  commit;

  po_n_cod_error := 0;

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

procedure SCOB_SP_U_EST_EXP_COB_MOT
(
    pi_n_id in number,
    pi_n_id_est_exp_cob in number,
    pi_v_codigo in varchar2,
    pi_v_descripcion in varchar2,
    pi_v_estado in varchar2,
    pi_v_audusucrea in varchar2,
    pi_v_nom_usured in varchar2,
    pi_v_nom_estred in varchar2,
    pi_v_aud_ip_lan in varchar2,
    pi_v_aud_ip_wan in varchar2,
    po_n_retorno out number,
    po_n_cod_error out number,
    po_v_msj_error out varchar2
)
as
v_cursor  cu_rec_set;
v_existe integer;
begin

  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;


   ----------------
   SELECT COUNT(u.id_motivo)
   INTO   v_existe
   FROM   t_scob_est_exp_cob_motivo u
   WHERE  (upper(u.codigo) = upper(pi_v_codigo) or
          upper(u.descripcion) = upper(pi_v_descripcion)) and
          u.id_est_exp_cob = pi_n_id_est_exp_cob and
          u.id_motivo <> pi_n_id and
          u.estado = '1';

   IF v_existe > 0 THEN
          po_n_cod_error := -2;
          po_n_retorno := -2;
          po_v_msj_error := 'Registro duplicado. Verificar la existencia del codigo y/o descripcion.';
          ROLLBACK;
          RETURN;
   END IF;
   -----------

update t_scob_est_exp_cob_motivo set
  --id_est_exp_cob = pi_n_id_est_exp_cob,
  codigo = pi_v_codigo,
  descripcion = pi_v_descripcion,
  estado = pi_v_estado,
  audfecmodificacion = sysdate,
  audusumodificacion = pi_v_audusucrea
 where
  id_motivo = pi_n_id;

  commit;

  po_n_retorno := pi_n_id;
  po_n_cod_error := 0;

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

procedure SCOB_SP_D_EST_EXP_COB_MOT
(
    pi_v_cad_id in varchar2,--|1|2|..
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
)
as

v_cursor  cu_rec_set;
n_Contador number(10,0);
n_Ide number(10,0);
v_Ide_Opcion varchar2(10);

begin

  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  update t_scob_est_exp_cob_motivo
  set estado = '0'
  where instr(pi_v_cad_id,'|' || to_char(id_motivo) || '|' )>0
  and estado = '1';

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

procedure SCOB_SP_S_PLANTI_BY_MOTIVO
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 13.12.2011
-- Proposito    : LISTA PLANTILLAS POR ESTADO Y MOTIVO (NO INCLUYE DEL TIPO TRAMITE)
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
     pi_n_id_motivo_estado     in T_SCOB_EXPEDIENTE.ID_MOTIVO%TYPE,
     pi_n_estado_expediente    in T_SCOB_EXPEDIENTE.ESTADO_EXPEDIENTE%TYPE,
     pi_n_tip_documento        in T_SCOB_TIPO_DOCUMENTO.ID_TIPO_DOCUMENTO%TYPE,
     pi_i_sub_tip_documento    in T_SCOB_TIPO_DOCUMENTO.COD_SUBTIPO_DOCUMENTO%TYPE,
     pi_n_id_plantilla_rec     in T_SCOB_PLANTILLA.ID_PLANTILLA_RESOLUCION%TYPE,
     po_cu_retorno             out cu_rec_set
)
as
begin

    open  po_cu_retorno for
    SELECT
      PLANTILLA.codigo,
      PLANTILLA.descripcion,
      MOTIVO_PLANTILLA.id_motivo_plantilla,
      MOTIVO_PLANTILLA.id_motivo,
      MOTIVO_PLANTILLA.id_plantilla as id_plantilla,
      PLANTILLA.estado,
      SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(CONST_TABLA_ESTADO,PLANTILLA.estado)  as des_estado,
      TIP_DOC.nom_tipo_documento as des_tip_documento,
      TIP_DOC.Cod_Subtipo_Documento as Cod_Subtipo_Documento
    FROM T_SCOB_PLANTILLA PLANTILLA
    INNER JOIN T_SCOB_MOTIVO_PLANTILLA MOTIVO_PLANTILLA
          ON MOTIVO_PLANTILLA.ID_PLANTILLA = PLANTILLA.ID_PLANTILLA
          AND MOTIVO_PLANTILLA.ESTADO = '1'
    INNER JOIN T_SCOB_TIPO_DOCUMENTO TIP_DOC
          ON TIP_DOC.ID_TIPO_DOCUMENTO = PLANTILLA.ID_TIPO_DOCUMENTO
          AND TIP_DOC.ESTADO = '1'
    WHERE
    PLANTILLA.ESTADO = '1'
    AND PLANTILLA.COD_TIPO_PLANTILLA = 1 --ASOCIADO A ESTADO/MOTIVO
    AND (NVL(pi_n_estado_expediente,0)=0 OR (NVL(pi_n_estado_expediente,0)<>0 AND MOTIVO_PLANTILLA.ID_EST_EXP_COB = pi_n_estado_expediente))
    AND (NVL(pi_n_id_motivo_estado,0)=0 OR (NVL(pi_n_id_motivo_estado,0)<>0 AND MOTIVO_PLANTILLA.ID_MOTIVO = pi_n_id_motivo_estado))
    AND (NVL(pi_n_tip_documento,0)=0 OR (NVL(pi_n_tip_documento,0)<>0 AND PLANTILLA.ID_TIPO_DOCUMENTO = pi_n_tip_documento))
    AND (NVL(pi_i_sub_tip_documento,0)=0 OR (NVL(pi_i_sub_tip_documento,0)<>0 AND TIP_DOC.COD_SUBTIPO_DOCUMENTO = pi_i_sub_tip_documento))
    AND (NVL(pi_n_id_plantilla_rec,0)=0 OR (NVL(pi_n_id_plantilla_rec,0)<>0 AND PLANTILLA.ID_PLANTILLA_RESOLUCION = pi_n_id_plantilla_rec))
    ;
end;

procedure SCOB_SP_S_PLANTI_SIN_MOTIVO
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 04.04.2012
-- Proposito    : LISTA PLANTILLAS NO ASOCIADOS A ESTADOS O MOTIVOS
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
     pi_n_tip_documento        in T_SCOB_TIPO_DOCUMENTO.ID_TIPO_DOCUMENTO%TYPE,
     pi_i_sub_tip_documento    in T_SCOB_TIPO_DOCUMENTO.COD_SUBTIPO_DOCUMENTO%TYPE,
     pi_n_id_plantilla_rec     in T_SCOB_PLANTILLA.ID_PLANTILLA_RESOLUCION%TYPE,
     po_cu_retorno             out cu_rec_set
)
as
begin

    open  po_cu_retorno for
    SELECT
      PLANTILLA.codigo,
      PLANTILLA.descripcion,
      MOTIVO_PLANTILLA.id_motivo_plantilla,
      MOTIVO_PLANTILLA.id_motivo,
      MOTIVO_PLANTILLA.id_plantilla as id_plantilla,
      PLANTILLA.estado,
      SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(CONST_TABLA_ESTADO,PLANTILLA.estado)  as des_estado,
      TIP_DOC.nom_tipo_documento as des_tip_documento,
      TIP_DOC.Cod_Subtipo_Documento as Cod_Subtipo_Documento,
      PLANTILLA.ID_TIPO_DOCUMENTO AS ID_TIPO_DOCUMENTO
    FROM T_SCOB_PLANTILLA PLANTILLA
    INNER JOIN T_SCOB_MOTIVO_PLANTILLA MOTIVO_PLANTILLA
          ON MOTIVO_PLANTILLA.ID_PLANTILLA = PLANTILLA.ID_PLANTILLA
          AND MOTIVO_PLANTILLA.ESTADO = '1'
    INNER JOIN T_SCOB_TIPO_DOCUMENTO TIP_DOC
          ON TIP_DOC.ID_TIPO_DOCUMENTO = PLANTILLA.ID_TIPO_DOCUMENTO
          AND TIP_DOC.ESTADO = '1'
    WHERE
    PLANTILLA.ESTADO = '1'
    AND PLANTILLA.COD_TIPO_PLANTILLA = 3 --NO ASOCIADO A ESTADO/MOTIVO
    AND (NVL(pi_n_tip_documento,0)=0 OR (NVL(pi_n_tip_documento,0)<>0 AND PLANTILLA.ID_TIPO_DOCUMENTO = pi_n_tip_documento))
    AND (NVL(pi_i_sub_tip_documento,0)=0 OR (NVL(pi_i_sub_tip_documento,0)<>0 AND TIP_DOC.COD_SUBTIPO_DOCUMENTO = pi_i_sub_tip_documento))
    AND (NVL(pi_n_id_plantilla_rec,0)=0 OR (NVL(pi_n_id_plantilla_rec,0)<>0 AND PLANTILLA.ID_PLANTILLA_RESOLUCION = pi_n_id_plantilla_rec))
    ;
end;

procedure SCOB_SP_I_PLANTI_BY_MOTIVO
(
    pi_n_id_motivo in number,
    pi_v_cad_id_plantilla in varchar2,--|1|2|..
    pi_n_cant_items    in number,--NRO DE ITEMS EN LA CADENA
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
)
as

v_cursor  cu_rec_set;
n_Contador number(10,0);
n_Ide number(10,0);
v_Ide_Opcion varchar2(10);
v_existe integer;
begin


  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  n_Contador := 1;
  ---
    while (n_Contador <= pi_n_cant_items)
    loop
      --Obtiene Id
      scob_pk_utilitario.SCOB_SP_S_SPLIT(pi_v_cad_id_plantilla,'|',n_Contador+1,v_Ide_Opcion);
      n_Ide := TO_NUMBER(v_Ide_Opcion);

      --insert

       ---VALIDACION DE DUPLICADOS--
       -----------------------------
       SELECT COUNT(*)
       INTO   v_existe
       FROM   t_scob_motivo_plantilla u
       WHERE
              u.id_plantilla = n_Ide and
              u.id_motivo = pi_n_id_motivo and
              u.estado = '1';

       IF v_existe > 0 THEN
              po_n_cod_error := -2;
              po_n_retorno := -2;
              po_v_msj_error := 'REGISTRO DUPLICADO';
              ROLLBACK;
              RETURN;
       END IF;
       -----------

    insert into t_scob_motivo_plantilla
      (id_motivo_plantilla, id_motivo, id_plantilla, estado,
      audfeccreacion,  audusucreacion, audfecmodificacion, audusumodificacion)
    values
      (SCOB_SQ_MOTIVO_PLANTILLA.Nextval, pi_n_id_motivo, n_Ide, '1',
      sysdate,  pi_v_audusucrea, null,null)
    RETURNING id_motivo_plantilla INTO po_n_retorno;

      --fin insert
      n_Contador := n_Contador + 1;

    end loop;

    --po_n_retorno := n_Contador;

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

procedure SCOB_SP_D_PLANTI_BY_MOTIVO
(
    pi_v_cad_id in varchar2,--|1|2|..
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
)
as

v_cursor  cu_rec_set;
n_Contador number(10,0);
n_Ide number(10,0);
v_Ide_Opcion varchar2(10);

begin

  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  update t_scob_motivo_plantilla
  set estado = '0'
  where instr(pi_v_cad_id,'|' || to_char(id_motivo_plantilla) || '|' )>0
  and estado = '1';

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

procedure SCOB_SP_S_PLANTILLA
(
     pi_n_id  in number, --comodin 0
     pi_n_id_tip_doc  in number, -- NUEVO!! comodin 0
     pi_v_codigo  in varchar2, --comodin ''
     pi_v_descripcion  in varchar2, --comodin ''
     pi_v_estado  in varchar2, --comodin ''
     po_cu_retorno   out cu_rec_set
)
as
begin

  open  po_cu_retorno for

select
  pl.id_plantilla,
  pl.codigo,
  pl.descripcion,
  pl.estado,
  SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(CONST_TABLA_ESTADO,pl.estado)  as des_estado,
  td.nom_tipo_documento as txt_descripcion
from
  t_scob_plantilla pl inner join
  t_scob_tipo_documento td on
  td.id_tipo_documento = pl.id_tipo_documento
  /*t_scob_tabla_det td on
  pl.tip_documento = td.cod_interno and
  id_tabla = 7  */
where
  (pi_n_id = 0 or pi_n_id = pl.id_plantilla) and
  (pi_n_id_tip_doc = 0 or pi_n_id_tip_doc = td.id_tipo_documento) and
  (pi_v_codigo is null or pi_v_codigo = pl.codigo) and
  (pi_v_descripcion is null or fun_scob_nosensite(pl.descripcion) like '%'||fun_scob_nosensite(pi_v_descripcion)||'%' ) and
  (pi_v_estado is null or pi_v_estado = pl.estado);

end;

/*procedure SCOB_SP_S_EST_MUL_COB
(
     pi_n_id  in number, --comodin 0
     pi_v_codigo  in varchar2, --comodin ''
     pi_v_descripcion  in varchar2, --comodin ''
     pi_v_estado  in varchar2, --comodin ''
     po_cu_retorno   out cu_rec_set
)
as
begin

  open  po_cu_retorno for

select
  id_est_mul_cob,
  codigo,
  descripcion,
  estado,
  SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(CONST_TABLA_ESTADO,estado)  as des_estado
from
  t_scob_est_mul_cob
where
  (pi_n_id = 0 or pi_n_id = id_est_mul_cob) and
  (pi_v_codigo is null or pi_v_codigo = codigo) and
  (pi_v_descripcion is null or UPPER(descripcion) like '%'||UPPER(pi_v_descripcion)||'%' ) and
  (pi_v_estado is null or pi_v_estado = estado);

end;*/

/*procedure SCOB_SP_I_EST_MUL_COB
(
    pi_v_codigo in varchar2,
    pi_v_descripcion in varchar2,
    pi_v_estado in varchar2,
    pi_v_audusucrea in varchar2,
    pi_v_nom_usured in varchar2,
    pi_v_nom_estred in varchar2,
    pi_v_aud_ip_lan in varchar2,
    pi_v_aud_ip_wan in varchar2,
    po_n_retorno out number,
    po_n_cod_error out number,
    po_v_msj_error out varchar2
)
as
v_cursor  cu_rec_set;

begin

  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

insert into t_scob_est_mul_cob
  (id_est_mul_cob, codigo, descripcion, estado, audfeccreacion,
  audusucreacion, audfecmodificacion, audusumodificacion)
values
  (SCOB_SQ_EST_MUL_COB.NEXTVAL, pi_v_codigo, pi_v_descripcion, pi_v_estado, sysdate,
  pi_v_audusucrea, null, null)
  RETURNING id_est_mul_cob INTO po_n_retorno;

  commit;

  po_n_cod_error := 0;

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

/*procedure SCOB_SP_U_EST_MUL_COB
(
    pi_n_id in number,
    pi_v_codigo in varchar2,
    pi_v_descripcion in varchar2,
    pi_v_estado in varchar2,
    pi_v_audusucrea in varchar2,
    pi_v_nom_usured in varchar2,
    pi_v_nom_estred in varchar2,
    pi_v_aud_ip_lan in varchar2,
    pi_v_aud_ip_wan in varchar2,
    po_n_retorno out number,
    po_n_cod_error out number,
    po_v_msj_error out varchar2
)
as
v_cursor  cu_rec_set;

begin

  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

update t_scob_est_mul_cob set

  codigo = pi_v_codigo,
  descripcion = pi_v_descripcion,
  estado = pi_v_estado,
  audfecmodificacion = sysdate,
  audusumodificacion = pi_v_audusucrea
where
  id_est_mul_cob = pi_n_id;

 po_n_retorno:=pi_n_id;

  commit;

  po_n_cod_error := 0;

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

/**procedure SCOB_SP_D_EST_MUL_COB
(
    pi_v_cad_id in varchar2,--|1|2|..
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
)
as

v_cursor  cu_rec_set;
n_Contador number(10,0);
n_Ide number(10,0);
v_Ide_Opcion varchar2(10);

begin

  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  update t_scob_est_mul_cob
  set estado = '0'
  where instr(pi_v_cad_id,'|' || to_char(id_est_mul_cob) || '|' )>0
  and estado = '1';

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

end;*/

procedure SCOB_SP_S_EST_MUL_COB_MOT
(
     pi_n_id  in number, --comodin 0
     pi_n_id_est_mul_cob  in number, --comodin 0
     pi_v_codigo  in varchar2, --comodin ''
     pi_v_descripcion  in varchar2, --comodin ''
     pi_v_estado  in varchar2, --comodin ''
     po_cu_retorno   out cu_rec_set
)
as
begin

  open  po_cu_retorno for

select
  id_motivo,
  id_est_mul_cob,
  codigo,
  descripcion,
  estado,
  SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(CONST_TABLA_ESTADO,estado)  as des_estado
  ,NVL(FLG_EXTRANET_CONSULTA,'0') AS FLG_EXTRANET_CONSULTA
from
  t_scob_est_mul_cob_motivo
where
  (pi_n_id = 0 or pi_n_id = id_motivo) and
  (pi_n_id_est_mul_cob = 0 or pi_n_id_est_mul_cob = id_est_mul_cob) and
  (pi_v_codigo is null or pi_v_codigo = codigo) and
  (pi_v_descripcion is null or fun_scob_nosensite(descripcion) like '%'||fun_scob_nosensite(pi_v_descripcion)||'%' ) and
  (pi_v_estado is null or pi_v_estado = estado);

end;

procedure SCOB_SP_I_EST_MUL_COB_MOT
(
    pi_n_id_est_mul_cob in number,
    pi_v_codigo in varchar2,
    pi_v_descripcion in varchar2,
    pi_v_estado in varchar2,
    pi_v_audusucrea in varchar2,
    pi_v_nom_usured in varchar2,
    pi_v_nom_estred in varchar2,
    pi_v_aud_ip_lan in varchar2,
    pi_v_aud_ip_wan in varchar2,
    po_n_retorno out number,
    po_n_cod_error out number,
    po_v_msj_error out varchar2
)
as
v_cursor  cu_rec_set;

begin

  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

insert into t_scob_est_mul_cob_motivo
  (id_motivo, id_est_mul_cob, codigo, descripcion, estado,
  audfeccreacion, audusucreacion, audfecmodificacion, audusumodificacion)
values
  (SCOB_SQ_EST_MUL_COB_MOTIVO.NEXTVAL, pi_n_id_est_mul_cob, pi_v_codigo, pi_v_descripcion, pi_v_estado,
  sysdate, pi_v_audusucrea, null, null)
  RETURNING id_motivo INTO po_n_retorno;

  commit;

  po_n_cod_error := 0;

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

procedure SCOB_SP_U_EST_MUL_COB_MOT
(
    pi_n_id in number,
    pi_n_id_est_mul_cob in number,
    pi_v_codigo in varchar2,
    pi_v_descripcion in varchar2,
    pi_v_estado in varchar2,
    pi_v_audusucrea in varchar2,
    pi_v_nom_usured in varchar2,
    pi_v_nom_estred in varchar2,
    pi_v_aud_ip_lan in varchar2,
    pi_v_aud_ip_wan in varchar2,
    po_n_retorno out number,
    po_n_cod_error out number,
    po_v_msj_error out varchar2
)
as
v_cursor  cu_rec_set;

begin

  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

update t_scob_est_mul_cob_motivo set
  --id_est_exp_cob = pi_n_id_est_exp_cob,
  codigo = pi_v_codigo,
  descripcion = pi_v_descripcion,
  estado = pi_v_estado,
  audfecmodificacion = sysdate,
  audusumodificacion = pi_v_audusucrea
 where
  id_motivo = pi_n_id;

  commit;

  po_n_retorno := pi_n_id;
  po_n_cod_error := 0;

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

procedure SCOB_SP_D_EST_MUL_COB_MOT
(
    pi_v_cad_id in varchar2,--|1|2|..
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
)
as

v_cursor  cu_rec_set;
n_Contador number(10,0);
n_Ide number(10,0);
v_Ide_Opcion varchar2(10);

begin

  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  update t_scob_est_mul_cob_motivo
  set estado = '0'
  where instr(pi_v_cad_id,'|' || to_char(id_motivo) || '|' )>0
  and estado = '1';

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

procedure SCOB_SP_S_MUL_PLANTI_BY_MOTIVO
(
     pi_n_id_motivo  in number, --0
     pi_i_estado     in integer, --0
     po_cu_retorno   out cu_rec_set
)
as
begin

  open  po_cu_retorno for
  SELECT
    PLANTILLA.CODIGO AS CODIGO,
    PLANTILLA.DESCRIPCION AS DESCRIPCION,
    MOTIVO_PLANTILLA.ID_EST_MUL_COB,
    MOTIVO_PLANTILLA.id_motivo AS id_motivo,
    MOTIVO_PLANTILLA.id_plantilla AS id_plantilla,
    MOTIVO_PLANTILLA.id_motivo_mul_plantilla AS id_motivo_mul_plantilla,
    MOTIVO_PLANTILLA.estado,
    SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(CONST_TABLA_ESTADO,MOTIVO_PLANTILLA.estado)  as des_estado
  FROM T_SCOB_MOTIVO_MUL_PLANTILLA MOTIVO_PLANTILLA
  INNER JOIN T_SCOB_PLANTILLA PLANTILLA
        ON PLANTILLA.ID_PLANTILLA = MOTIVO_PLANTILLA.ID_PLANTILLA
        AND PLANTILLA.ESTADO = '1'
  WHERE MOTIVO_PLANTILLA.ESTADO = '1'
  AND (NVL(pi_i_estado,0)=0 OR (NVL(pi_i_estado,0)<>0 AND MOTIVO_PLANTILLA.ID_EST_MUL_COB = pi_i_estado))
  AND (NVL(pi_n_id_motivo,0)=0 OR (NVL(pi_n_id_motivo,0)<>0 AND MOTIVO_PLANTILLA.ID_MOTIVO = pi_n_id_motivo))
  ORDER BY PLANTILLA.DESCRIPCION
  ;

/*
select
  pl.codigo,
  pl.descripcion,
  pm.id_motivo_mul_plantilla,
  pm.id_motivo,
  pm.id_plantilla,
  pm.estado,
  SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(CONST_TABLA_ESTADO,pm.estado)  as des_estado
from
  t_scob_motivo_mul_plantilla pm inner join
  t_scob_plantilla pl on
  pm.id_plantilla = pl.id_plantilla
where
  pm.estado = '1' and
  pl.estado = '1' and
  pm.id_motivo = pi_n_id_motivo;
*/

end;

procedure SCOB_SP_I_MUL_PLANTI_BY_MOTIVO
(
    pi_n_id_motivo in number,
    pi_v_cad_id_plantilla in varchar2,--|1|2|..
    pi_n_cant_items    in number,--NRO DE ITEMS EN LA CADENA
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
)
as

v_cursor  cu_rec_set;
n_Contador number(10,0);
n_Ide number(10,0);
v_Ide_Opcion varchar2(10);

begin


  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  n_Contador := 1;
  ---
    while (n_Contador <= pi_n_cant_items)
    loop
      --Obtiene Id
      scob_pk_utilitario.SCOB_SP_S_SPLIT(pi_v_cad_id_plantilla,'|',n_Contador+1,v_Ide_Opcion);
      n_Ide := TO_NUMBER(v_Ide_Opcion);

      --insert

    insert into t_scob_motivo_mul_plantilla
      (id_motivo_mul_plantilla, id_motivo, id_plantilla, estado,
      audfeccreacion,  audusucreacion, audfecmodificacion, audusumodificacion)
    values
      (SCOB_SQ_MOTIVO_MUL_PLANTILLA.Nextval, pi_n_id_motivo, n_Ide, '1',
      sysdate,  pi_v_audusucrea, null,null)
    RETURNING id_motivo_mul_plantilla INTO po_n_retorno;

      --fin insert
      n_Contador := n_Contador + 1;

    end loop;

    --po_n_retorno := n_Contador;

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

procedure SCOB_SP_D_MUL_PLANTI_BY_MOTIVO
(
    pi_v_cad_id in varchar2,--|1|2|..
    pi_v_audusucrea      in varchar2,
    pi_v_nom_usured    in varchar2,
    pi_v_nom_estred    in varchar2,
    pi_v_aud_ip_lan   in varchar2,
    pi_v_aud_ip_wan   in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
)
as

v_cursor  cu_rec_set;
n_Contador number(10,0);
n_Ide number(10,0);
v_Ide_Opcion varchar2(10);

begin

  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  update t_scob_motivo_mul_plantilla
  set estado = '0'
  where instr(pi_v_cad_id,'|' || to_char(id_motivo_mul_plantilla) || '|' )>0
  and estado = '1';

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

procedure SCOB_SP_S_ALERTA
(
     pi_n_id  in number, --comodin 0
     pi_v_estado in varchar2,
     po_cu_retorno   out cu_rec_set
)
as
begin

  open  po_cu_retorno for

  select
    id_alerta,
    descripcion,
    valor,
    unidad_tiempo,
    orden,
    estado,
    descripcion2,
    medio,
    alto,
    ind_calculo_calendario
  from
    t_scob_alerta
  where
    (pi_n_id = 0 or id_alerta = pi_n_id)
    and (pi_v_estado is null or estado = pi_v_estado)
  ORDER BY DESCRIPCION;

end;


procedure SCOB_SP_U_ALERTA
(
    pi_n_id in number,
    pi_v_Descripcion in varchar2,
    pi_n_valor in integer,
    pi_n_valor_med in integer,
    pi_n_valor_alt in integer,
    pi_n_unidad in integer,
    pi_v_estado in varchar2,
    pi_v_ind_calculo_calendario in char,
    pi_v_audusucrea in varchar2,
    pi_v_nom_usured in varchar2,
    pi_v_nom_estred in varchar2,
    pi_v_aud_ip_lan in varchar2,
    pi_v_aud_ip_wan in varchar2,
    po_n_retorno out number,
    po_n_cod_error out number,
    po_v_msj_error out varchar2
)
as
v_cursor  cu_rec_set;

begin

  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

update t_scob_alerta set
  descripcion = pi_v_descripcion,
  valor = DECODE(pi_n_valor,-1,null,pi_n_valor),
  medio = DECODE(pi_n_valor_med,-1,null,pi_n_valor_med),
  alto = DECODE(pi_n_valor_alt,-1,null,pi_n_valor_alt),
  unidad_tiempo = pi_n_unidad,
  ind_calculo_calendario = pi_v_ind_calculo_calendario,
  estado = pi_v_estado,
  audfecmodificacion = sysdate,
  audusumodificacion = pi_v_audusucrea
where
 id_alerta = pi_n_id;

  commit;

  po_n_cod_error := 0;
  po_n_retorno := pi_n_id;

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

procedure SCOB_SP_S_SECTOR_ECONOMICO
(
     po_cu_retorno   out cu_rec_set
)
as
begin

  open  po_cu_retorno for

 select
   id_sector_economico,
   codigo,
   descripcion,
   estado,
   audfeccreacion,
   audusucreacion,
   audfecmodificacion,
   audusumodificacion
 from
   t_scob_sector_economico
 where
   estado = '1';

end;

procedure SCOB_SP_S_TIPO_DOCUMENTO
(
    pi_n_id in number,
    pi_i_subtipo_documento t_scob_tipo_documento.cod_subtipo_documento%type,
    pi_v_codigo in varchar2,
    pi_v_descripcion in varchar2,
    pi_v_estado in varchar2,
    po_cu_retorno   out cu_rec_set
)
as
begin

  open  po_cu_retorno for

select
  ID_TIPO_DOCUMENTO AS ID_TIPO_DOCUMENTO,
  LPAD(COD_TIPO_DOCUMENTO,3,'000') AS COD_TIPO_DOCUMENTO,
  NOM_TIPO_DOCUMENTO AS NOM_TIPO_DOCUMENTO,
  COD_SUBTIPO_DOCUMENTO AS COD_SUBTIPO_DOCUMENTO,
  ESTADO AS ESTADO
from
  T_SCOB_TIPO_DOCUMENTO
where
  (pi_n_id = 0 or pi_n_id = ID_TIPO_DOCUMENTO) and
  (pi_i_subtipo_documento = 0 or COD_SUBTIPO_DOCUMENTO = pi_i_subtipo_documento) and
  (pi_v_codigo is null or pi_v_codigo = COD_TIPO_DOCUMENTO) and
  (pi_v_descripcion is null or fun_scob_nosensite(NOM_TIPO_DOCUMENTO) like '%'||fun_scob_nosensite(pi_v_descripcion)||'%' ) and
  (pi_v_estado is null or pi_v_estado = ESTADO)
ORDER BY TO_NUMBER(COD_TIPO_DOCUMENTO)
;
end;

procedure SCOB_SP_S_GESTOR_COBRANZA
(
    po_cu_retorno   out cu_rec_set
)
  as
  begin
    open  po_cu_retorno for
  select
  usu.id_usuario ID,
  usu.usuario DESCRIPCION
  from T_SCOB_USUARIO usu
  inner join t_scob_perfil_usuario uspe on usu.id_usuario = uspe.id_usuario
  inner join t_scob_perfil perf on uspe.id_perfil = perf.id_perfil
  where perf.id_perfil in (4,538);
end;

procedure SCOB_SP_S_TIPO_DOCUMENTO_DOC
(
    pi_n_id in number,
    pi_i_subtipo_documento t_scob_tipo_documento.cod_subtipo_documento%type,
    pi_v_codigo in varchar2,
    pi_v_descripcion in varchar2,
    pi_v_estado in varchar2,
    po_cu_retorno   out cu_rec_set
)
as
begin

  open  po_cu_retorno for

select
  t.id_tabla_det AS ID_TIPO_DOCUMENTO,
  t.cod_interno AS COD_TIPO_DOCUMENTO,
  t.txt_descripcion AS NOM_TIPO_DOCUMENTO,
  t.id_tabla AS COD_SUBTIPO_DOCUMENTO,
  t.estado AS ESTADO
from
  T_SCOB_TABLA_DET t
where
  id_tabla = 23;
  /*
  and
  (pi_n_id = 0 or pi_n_id = t.id_tabla_det) and
  (pi_i_subtipo_documento = 0 or t.id_tabla = pi_i_subtipo_documento) and
  (pi_v_codigo is null or pi_v_codigo = t.cod_interno) and
  (pi_v_descripcion is null or fun_scob_nosensite(t.txt_descripcion) like '%'||fun_scob_nosensite(pi_v_descripcion)||'%' ) and
  (pi_v_estado is null or pi_v_estado = ESTADO);
*/
end;


procedure SCOB_SP_S_PLANTI_BY_TIP_DOC
(
     pi_v_tip_documento in varchar2,--pi_v_tip_documento in number,
     po_cu_retorno   out cu_rec_set
)
as
begin

  open  po_cu_retorno for

select
  pl.id_plantilla as id_plantilla,
  pl.codigo as codigo,
  pl.descripcion as descripcion,
  td.nom_tipo_documento as des_tip_documento,
  td.cod_tipo_documento as cod_tipo_documento
from
  t_scob_plantilla pl inner join
  t_scob_tipo_documento  td on
  pl.id_tipo_documento = td.id_tipo_documento
where
  (pi_v_tip_documento is null or td.cod_tipo_documento = pi_v_tip_documento )
  and pl.estado = '1'
  and td.estado = '1';

end;

----------------------------------------
procedure SCOB_SP_S_CONS_PLANTILLA_MULTA
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 26.05.2011
-- Proposito    : consultar las plantillas registradas para una multa
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_I_COD_TIPO_PLANTILLA                  IN T_SCOB_PLANTILLA.COD_TIPO_PLANTILLA%TYPE,
  PI_V_DESCRIPCION                         IN T_SCOB_PLANTILLA.DESCRIPCION%TYPE,
  PI_I_ID_MOTIVO                           IN T_SCOB_EST_MUL_COB_MOTIVO.ID_MOTIVO%TYPE,
  PI_I_COD_ESTADO                          IN INTEGER, --DEL ESTADO DE LA MULTA Y DEL EXPEDIENTE
  po_cu_retorno                            out cu_rec_set
)
as
begin

  open  po_cu_retorno for
  --caso multas : plantillas asociadas a motivos y estados
  SELECT
    '1',
    PLANT.ID_PLANTILLA AS ID_PLANTILLA,
    PLANT.CODIGO AS COD_PLANTILLA,
    PLANT.DESCRIPCION AS DESCRIPCION,
    PLANT.NOM_CORTO AS NOM_CORTO,
    PLANT.COD_TIPO_PLANTILLA AS COD_TIPO_PLANTILLA,
    TIPP.TXT_DESCRIPCION AS NOM_TIPO_PLANTILLA,
    PLANT.ID_TIPO_DOCUMENTO,
    0 AS COD_SUBTIPO_DOCUMENTO, --SOLO TIENE VALOR CUANDO ES EXPEDIENTE
    ' ' AS NOM_SUBTIPO_DOCUMENTO, --SOLO TIENE VALOR CUANDO ES EXPEDIENTE
    MOTI.ID_MOTIVO AS ID_MOTIVO,
    MOTI.DESCRIPCION AS NOM_MOTIVO,
    MOTI.ID_EST_MUL_COB AS ID_ESTADO,
    SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_ESTADO_MULTA,MOTI.ID_EST_MUL_COB) AS NOM_ESTADO,
    PLANT.COD_TIPO_PLANTILLA  AS COD_TIPO_PLANTILLA,
    TIPP.TXT_VALOR1 AS NOM_CORTO_TIPO_PLANTILLA,
    PLANT.NOM_ARCHIVO AS NOM_ARCHIVO,
    NULL AS COD_INTERNO
  FROM T_SCOB_PLANTILLA PLANT
  INNER JOIN T_SCOB_MOTIVO_MUL_PLANTILLA MOPL
       ON MOPL.ID_PLANTILLA = PLANT.ID_PLANTILLA
  INNER JOIN T_SCOB_EST_MUL_COB_MOTIVO MOTI
       ON MOTI.ID_MOTIVO = MOPL.ID_MOTIVO
  LEFT JOIN T_SCOB_TABLA_DET TIPP
        ON TIPP.ID_TABLA = SCOB_PK_CONSTANTES.C_TBL_TIPO_PLANTILLA
        AND TIPP.COD_INTERNO = PLANT.COD_TIPO_PLANTILLA
  WHERE
  PLANT.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
  AND (PI_I_COD_TIPO_PLANTILLA = 0 OR (PI_I_COD_TIPO_PLANTILLA <> 0 AND COD_TIPO_PLANTILLA = PI_I_COD_TIPO_PLANTILLA))
  AND (PI_I_ID_MOTIVO = 0 OR (PI_I_ID_MOTIVO<>0 AND MOPL.ID_MOTIVO = PI_I_ID_MOTIVO))
  AND (PI_I_COD_ESTADO = 0 OR (PI_I_COD_ESTADO<>0 AND MOPL.Id_Est_Mul_Cob = PI_I_COD_ESTADO))
  AND fun_scob_nosensite(TRIM(PLANT.DESCRIPCION)) LIKE '%' || fun_scob_nosensite(TRIM(PI_V_DESCRIPCION))  || '%'
  ;
end;

procedure SCOB_SP_S_CONS_PLANTILLA_EXPED
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 26.05.2011
-- Proposito    : consultar las plantillas registradas para un expediente
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_I_COD_TIPO_PLANTILLA                  IN T_SCOB_PLANTILLA.COD_TIPO_PLANTILLA%TYPE,
  PI_V_DESCRIPCION                         IN T_SCOB_PLANTILLA.DESCRIPCION%TYPE,
  PI_I_ID_MOTIVO                           IN T_SCOB_EST_MUL_COB_MOTIVO.ID_MOTIVO%TYPE,
  PI_I_COD_ESTADO                          IN INTEGER, --DEL ESTADO DE LA MULTA Y DEL EXPEDIENTE
  PI_I_COD_SUBTIPO_DOCUMENTO               IN T_SCOB_TIPO_DOCUMENTO.COD_SUBTIPO_DOCUMENTO%TYPE,
  PI_V_COD_TIPO_DOCUMENTO                  IN T_SCOB_TIPO_DOCUMENTO.COD_TIPO_DOCUMENTO%TYPE,
  po_cu_retorno                            out cu_rec_set
)
as
begin

  open  po_cu_retorno for
  --caso EXPEDIENTE : plantillas asociadas a motivos y estados
  SELECT
    '1',
    PLANT.ID_PLANTILLA AS ID_PLANTILLA,
    PLANT.CODIGO AS COD_PLANTILLA,
    PLANT.DESCRIPCION AS DESCRIPCION,
    PLANT.NOM_CORTO AS NOM_CORTO,
    PLANT.COD_TIPO_PLANTILLA AS COD_TIPO_PLANTILLA,
    TIPP.TXT_DESCRIPCION AS NOM_TIPO_PLANTILLA,
    PLANT.ID_TIPO_DOCUMENTO,
    TIDO.COD_SUBTIPO_DOCUMENTO AS COD_SUBTIPO_DOCUMENTO,
    SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_SUB_TIPO_DOCUMENTO,TIDO.COD_SUBTIPO_DOCUMENTO) AS NOM_SUBTIPO_DOCUMENTO,
    MOTI.ID_MOTIVO AS ID_MOTIVO,
    MOTI.DESCRIPCION AS NOM_MOTIVO,
    ESTA.ID_EST_EXP_COB AS ID_ESTADO,
    ESTA.DESCRIPCION AS NOM_ESTADO,
    PLANT.COD_TIPO_PLANTILLA  AS COD_TIPO_PLANTILLA,
    TIPP.TXT_VALOR1 AS NOM_CORTO_TIPO_PLANTILLA,
    PLANT.NOM_ARCHIVO AS NOM_ARCHIVO,
    PLANT.COD_INTERNO AS COD_INTERNO,
    TIDO.COD_TIPO_DOCUMENTO AS COD_TIPO_DOCUMENTO,
    MOPL.ID_MOTIVO_PLANTILLA AS ID_MOTIVO_PLANTILLA

  FROM T_SCOB_PLANTILLA PLANT
  LEFT JOIN T_SCOB_TIPO_DOCUMENTO TIDO
        ON TIDO.ID_TIPO_DOCUMENTO = PLANT.ID_TIPO_DOCUMENTO
  INNER JOIN T_SCOB_MOTIVO_PLANTILLA MOPL
       ON MOPL.ID_PLANTILLA = PLANT.ID_PLANTILLA
  INNER JOIN T_SCOB_EST_EXP_COB_MOTIVO MOTI
        ON MOTI.ID_MOTIVO = MOPL.ID_MOTIVO
  INNER JOIN T_SCOB_EST_EXP_COB ESTA
        ON ESTA.ID_EST_EXP_COB = MOTI.ID_EST_EXP_COB
  LEFT JOIN T_SCOB_TABLA_DET TIPP
        ON TIPP.ID_TABLA = SCOB_PK_CONSTANTES.C_TBL_TIPO_PLANTILLA
        AND TIPP.COD_INTERNO = PLANT.COD_TIPO_PLANTILLA
  WHERE
  PLANT.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
  AND (PI_I_COD_TIPO_PLANTILLA = 0 OR (PI_I_COD_TIPO_PLANTILLA <> 0 AND COD_TIPO_PLANTILLA = PI_I_COD_TIPO_PLANTILLA))
  AND ((PI_I_ID_MOTIVO = 0) OR (PI_I_ID_MOTIVO<>0 AND MOPL.ID_MOTIVO = PI_I_ID_MOTIVO))
  AND ((PI_I_COD_ESTADO = 0) OR (PI_I_COD_ESTADO<>0 AND MOPL.ID_EST_EXP_COB = PI_I_COD_ESTADO))
  AND (PI_I_COD_SUBTIPO_DOCUMENTO = 0 OR (PI_I_COD_SUBTIPO_DOCUMENTO<>0 AND TIDO.COD_SUBTIPO_DOCUMENTO = PI_I_COD_SUBTIPO_DOCUMENTO))
  AND (NVL(PI_V_COD_TIPO_DOCUMENTO,' ')=' ' OR (NVL(PI_V_COD_TIPO_DOCUMENTO,' ')<>' ' AND UPPER(TIDO.COD_TIPO_DOCUMENTO)=UPPER(PI_V_COD_TIPO_DOCUMENTO)))
  AND (MOPL.ID_EST_EXP_COB <> 0 AND MOPL.ID_MOTIVO <> 0)
  AND fun_scob_nosensite(TRIM(PLANT.DESCRIPCION)) LIKE '%' || fun_scob_nosensite(TRIM(PI_V_DESCRIPCION))  || '%'

  /*
  UNION
  --caso EXPEDIENTES : plantillas asociadas a estados
  SELECT
    '2',
    PLANT.ID_PLANTILLA AS ID_PLANTILLA,
    PLANT.CODIGO AS COD_PLANTILLA,
    PLANT.DESCRIPCION AS DESCRIPCION,
    PLANT.NOM_CORTO AS NOM_CORTO,
    PLANT.COD_TIPO_PLANTILLA AS COD_TIPO_PLANTILLA,
    TIPP.TXT_DESCRIPCION AS NOM_TIPO_PLANTILLA,
    PLANT.ID_TIPO_DOCUMENTO,
    TIDO.COD_SUBTIPO_DOCUMENTO AS COD_SUBTIPO_DOCUMENTO,
    SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_SUB_TIPO_DOCUMENTO,TIDO.COD_SUBTIPO_DOCUMENTO) AS NOM_SUBTIPO_DOCUMENTO,
    MOPL.ID_MOTIVO AS ID_MOTIVO,
    ' ' AS NOM_MOTIVO,
    ESTA.ID_EST_EXP_COB AS ID_ESTADO,
    ESTA.DESCRIPCION AS NOM_ESTADO,
    PLANT.COD_TIPO_PLANTILLA  AS COD_TIPO_PLANTILLA,
    TIPP.TXT_VALOR1 AS NOM_CORTO_TIPO_PLANTILLA,
    PLANT.NOM_ARCHIVO AS NOM_ARCHIVO,
    PLANT.COD_INTERNO AS COD_INTERNO,
    TIDO.COD_TIPO_DOCUMENTO AS COD_TIPO_DOCUMENTO  ,
    MOPL.ID_MOTIVO_PLANTILLA AS ID_MOTIVO_PLANTILLA
  FROM T_SCOB_PLANTILLA PLANT
  INNER JOIN T_SCOB_TIPO_DOCUMENTO TIDO
        ON TIDO.ID_TIPO_DOCUMENTO = PLANT.ID_TIPO_DOCUMENTO
  INNER JOIN T_SCOB_MOTIVO_PLANTILLA MOPL
       ON MOPL.ID_PLANTILLA = PLANT.ID_PLANTILLA
       AND MOPL.ID_MOTIVO = 0 --SIN MOTIVO ASIGNADO
  INNER JOIN T_SCOB_EST_EXP_COB ESTA
        ON ESTA.ID_EST_EXP_COB = MOPL.ID_EST_EXP_COB
  LEFT JOIN T_SCOB_TABLA_DET TIPP
        ON TIPP.ID_TABLA = SCOB_PK_CONSTANTES.C_TBL_TIPO_PLANTILLA
        AND TIPP.COD_INTERNO = PLANT.COD_TIPO_PLANTILLA
  WHERE
  (PI_I_COD_TIPO_PLANTILLA = 0 OR (PI_I_COD_TIPO_PLANTILLA <> 0 AND COD_TIPO_PLANTILLA = PI_I_COD_TIPO_PLANTILLA))
  AND PLANT.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
  AND ((PI_I_COD_ESTADO=0 AND MOPL.ID_EST_EXP_COB<>0) OR
       (PI_I_COD_ESTADO<>0 AND MOPL.ID_EST_EXP_COB = PI_I_COD_ESTADO))
  AND (PI_I_COD_SUBTIPO_DOCUMENTO = 0 OR (PI_I_COD_SUBTIPO_DOCUMENTO<>0 AND TIDO.COD_SUBTIPO_DOCUMENTO = PI_I_COD_SUBTIPO_DOCUMENTO))
  AND (NVL(PI_V_COD_TIPO_DOCUMENTO,' ')=' ' OR (NVL(PI_V_COD_TIPO_DOCUMENTO,' ')<>' ' AND UPPER(TIDO.COD_TIPO_DOCUMENTO)=UPPER(PI_V_COD_TIPO_DOCUMENTO)))
  AND fun_scob_nosensite(TRIM(PLANT.DESCRIPCION)) LIKE '%' || fun_scob_nosensite(TRIM(PI_V_DESCRIPCION))  || '%'
  */

  UNION
  --caso EXPEDIENTE : plantillas genericas
  SELECT
    '3',
    PLANT.ID_PLANTILLA AS ID_PLANTILLA,
    PLANT.CODIGO AS COD_PLANTILLA,
    PLANT.DESCRIPCION AS DESCRIPCION,
    PLANT.NOM_CORTO AS NOM_CORTO,
    PLANT.COD_TIPO_PLANTILLA AS COD_TIPO_PLANTILLA,
    TIPP.TXT_DESCRIPCION AS NOM_TIPO_PLANTILLA,
    PLANT.ID_TIPO_DOCUMENTO,
    TIDO.COD_SUBTIPO_DOCUMENTO AS COD_SUBTIPO_DOCUMENTO,
    SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_SUB_TIPO_DOCUMENTO,TIDO.COD_SUBTIPO_DOCUMENTO) AS NOM_SUBTIPO_DOCUMENTO,
    0 AS ID_MOTIVO,
    ' ' AS NOM_MOTIVO,
    0 AS ID_ESTADO,
    ' ' AS NOM_ESTADO,
    PLANT.COD_TIPO_PLANTILLA  AS COD_TIPO_PLANTILLA,
    TIPP.TXT_VALOR1 AS NOM_CORTO_TIPO_PLANTILLA,
    PLANT.NOM_ARCHIVO AS NOM_ARCHIVO,
    PLANT.COD_INTERNO AS COD_INTERNO,
    TIDO.COD_TIPO_DOCUMENTO AS COD_TIPO_DOCUMENTO    ,
    MOPL.ID_MOTIVO_PLANTILLA AS ID_MOTIVO_PLANTILLA
  FROM T_SCOB_PLANTILLA PLANT
  INNER JOIN T_SCOB_TIPO_DOCUMENTO TIDO
        ON TIDO.ID_TIPO_DOCUMENTO = PLANT.ID_TIPO_DOCUMENTO
  INNER JOIN T_SCOB_MOTIVO_PLANTILLA MOPL
       ON MOPL.ID_PLANTILLA = PLANT.ID_PLANTILLA
       AND MOPL.ID_MOTIVO = 0 --SIN MOTIVO ASIGNADO
       AND MOPL.ID_EST_EXP_COB = 0 --SIN ESTADO ASIGNADO
  LEFT JOIN T_SCOB_TABLA_DET TIPP
        ON TIPP.ID_TABLA = SCOB_PK_CONSTANTES.C_TBL_TIPO_PLANTILLA
        AND TIPP.COD_INTERNO = PLANT.COD_TIPO_PLANTILLA
  WHERE
  PLANT.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
  AND (PI_I_COD_TIPO_PLANTILLA = 0 OR (PI_I_COD_TIPO_PLANTILLA <> 0 AND COD_TIPO_PLANTILLA = PI_I_COD_TIPO_PLANTILLA))
  AND (PI_I_COD_SUBTIPO_DOCUMENTO = 0 OR (PI_I_COD_SUBTIPO_DOCUMENTO<>0 AND TIDO.COD_SUBTIPO_DOCUMENTO = PI_I_COD_SUBTIPO_DOCUMENTO))
  AND (NVL(PI_V_COD_TIPO_DOCUMENTO,' ')=' ' OR (NVL(PI_V_COD_TIPO_DOCUMENTO,' ')<>' ' AND UPPER(TIDO.COD_TIPO_DOCUMENTO)=UPPER(PI_V_COD_TIPO_DOCUMENTO)))
  AND (MOPL.ID_EST_EXP_COB = 0 AND MOPL.ID_MOTIVO = 0)
  AND fun_scob_nosensite(TRIM(PLANT.DESCRIPCION)) LIKE '%' || fun_scob_nosensite(TRIM(PI_V_DESCRIPCION))  || '%'
  ORDER BY ID_PLANTILLA
  ;

end;

procedure SCOB_SP_S_PLANTILLA_BY_SUBTIPO
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 26.05.2011
-- Proposito    : consultar las plantillas registradas por su tipo de documento
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_I_COD_SUBTIPO_DOCUMENTO               IN T_SCOB_TIPO_DOCUMENTO.COD_SUBTIPO_DOCUMENTO%TYPE,
  PI_C_TIPO_ENTIDAD                        IN CHAR,
                                           /*1=MULTA;2=EXPEDIENTE*/
  PI_I_COD_ESTADO                          IN INTEGER,
  PI_N_ID_MOTIVO                           IN NUMBER,
  po_cu_retorno                            out cu_rec_set
)
as
begin

  IF PI_C_TIPO_ENTIDAD = '1' THEN

      open  po_cu_retorno for
      SELECT
        PLANT.ID_PLANTILLA AS ID_PLANTILLA,
        PLANT.CODIGO AS COD_PLANTILLA,
        PLANT.DESCRIPCION AS DESCRIPCION,
        PLANT.NOM_CORTO AS NOM_CORTO,
        PLANT.COD_TIPO_PLANTILLA AS COD_TIPO_PLANTILLA,
        TIPP.TXT_DESCRIPCION AS NOM_TIPO_PLANTILLA,
        MPLA.ID_MOTIVO_MUL_PLANTILLA AS ID_MOTIVO_PLANTILLA,
        MPLA.ID_MOTIVO AS ID_MOTIVO
      FROM T_SCOB_PLANTILLA PLANT
      INNER JOIN T_SCOB_MOTIVO_MUL_PLANTILLA MPLA
            ON MPLA.ID_PLANTILLA = PLANT.ID_PLANTILLA
            AND MPLA.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
      INNER JOIN T_SCOB_TIPO_DOCUMENTO TIDO
            ON TIDO.ID_TIPO_DOCUMENTO = PLANT.ID_TIPO_DOCUMENTO
      LEFT JOIN T_SCOB_TABLA_DET TIPP
            ON TIPP.ID_TABLA = SCOB_PK_CONSTANTES.C_TBL_TIPO_PLANTILLA
            AND TIPP.COD_INTERNO = PLANT.COD_TIPO_PLANTILLA
      WHERE TIDO.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
      AND (PI_I_COD_SUBTIPO_DOCUMENTO=0 OR (PI_I_COD_SUBTIPO_DOCUMENTO<>0 AND TIDO.COD_SUBTIPO_DOCUMENTO=PI_I_COD_SUBTIPO_DOCUMENTO))
      AND (PI_I_COD_ESTADO=0 OR (PI_I_COD_ESTADO<>0 AND MPLA.ID_EST_MUL_COB=PI_I_COD_ESTADO))
      AND (PI_N_ID_MOTIVO=0 OR (PI_N_ID_MOTIVO<>0 AND MPLA.ID_MOTIVO=PI_N_ID_MOTIVO))
      ;
  ELSE

      open  po_cu_retorno for
      SELECT
        PLANT.ID_PLANTILLA AS ID_PLANTILLA,
        PLANT.CODIGO AS COD_PLANTILLA,
        PLANT.DESCRIPCION AS DESCRIPCION,
        PLANT.NOM_CORTO AS NOM_CORTO,
        PLANT.COD_TIPO_PLANTILLA AS COD_TIPO_PLANTILLA,
        TIPP.TXT_DESCRIPCION AS NOM_TIPO_PLANTILLA,
        MPLA.ID_MOTIVO_PLANTILLA AS ID_MOTIVO_PLANTILLA,
        MPLA.ID_MOTIVO AS ID_MOTIVO
      FROM T_SCOB_PLANTILLA PLANT
      INNER JOIN T_SCOB_MOTIVO_PLANTILLA MPLA
            ON MPLA.ID_PLANTILLA = PLANT.ID_PLANTILLA
            AND MPLA.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
      INNER JOIN T_SCOB_TIPO_DOCUMENTO TIDO
            ON TIDO.ID_TIPO_DOCUMENTO = PLANT.ID_TIPO_DOCUMENTO
      LEFT JOIN T_SCOB_TABLA_DET TIPP
            ON TIPP.ID_TABLA = SCOB_PK_CONSTANTES.C_TBL_TIPO_PLANTILLA
            AND TIPP.COD_INTERNO = PLANT.COD_TIPO_PLANTILLA
      WHERE TIDO.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
      AND (PI_I_COD_SUBTIPO_DOCUMENTO=0 OR (PI_I_COD_SUBTIPO_DOCUMENTO<>0 AND TIDO.COD_SUBTIPO_DOCUMENTO=PI_I_COD_SUBTIPO_DOCUMENTO))
      AND (PI_I_COD_ESTADO=0 OR (PI_I_COD_ESTADO<>0 AND MPLA.ID_EST_EXP_COB=PI_I_COD_ESTADO))
      AND (PI_N_ID_MOTIVO=0 OR (PI_N_ID_MOTIVO<>0 AND MPLA.ID_MOTIVO=PI_N_ID_MOTIVO))
      ;
  END IF;
end;

procedure SCOB_SP_I_PLANTILLA_MULT_EXPED
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 26.05.2011
-- Proposito    : insertar plantillas de multas o expedientes
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_C_TIPO_EVENTO                          IN T_SCOB_PLANTILLA.IND_ASOC_PLANTILLA%TYPE,
                                            --1=MULTA;2=EXPEDIENTE;
  --
  PI_V_CODIGO                               IN T_SCOB_PLANTILLA.CODIGO%TYPE,
  PI_V_DESCRIPCION                          IN T_SCOB_PLANTILLA.DESCRIPCION%TYPE,
  PI_V_NOM_CORTO                            IN T_SCOB_PLANTILLA.NOM_CORTO%TYPE,
  PI_I_COD_TIPO_PLANTILLA                   IN T_SCOB_PLANTILLA.COD_TIPO_PLANTILLA%TYPE,
  PI_I_COD_SUBTIPO_DOCUMENTO                IN T_SCOB_TIPO_DOCUMENTO.COD_SUBTIPO_DOCUMENTO%TYPE,
  PI_N_ID_TIPO_DOCUMENTO                    IN T_SCOB_PLANTILLA.ID_TIPO_DOCUMENTO%TYPE,
  PI_N_ID_MOTIVO                            IN NUMBER,
  PI_I_COD_ESTADO_MUL_EXP                   IN INTEGER,
  PI_V_NOMBRE                               IN T_SCOB_PLANTILLA.NOM_ARCHIVO%TYPE,
  PI_N_ID_PLANTILLA_RESOLUCION              IN T_SCOB_PLANTILLA.ID_PLANTILLA%TYPE,
  --
  PI_V_AUDUSUCREACION                       IN T_SCOB_PLANTILLA.AUDUSUCREACION%TYPE,
  --
  po_n_retorno                              out number,
  po_n_cod_error                            out number,
  po_v_msj_error                            out varchar2
)
is
  N_ID_PLANTILLA                            T_SCOB_PLANTILLA.ID_PLANTILLA%TYPE;
  V_COD_INTERNO                             T_SCOB_PLANTILLA.COD_INTERNO%TYPE;
  N_ID_MOTIVO_PLANTILLA                     NUMBER;
  N_COD_GEN_PLAN_RESOL                      NUMBER;
begin
  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  IF PI_C_TIPO_EVENTO = '2' THEN --EXPEDIENTE
  BEGIN
       CASE
         WHEN PI_I_COD_SUBTIPO_DOCUMENTO=SCOB_PK_CONSTANTES.C_COD_SUBTIPODOC_RESOLUCION THEN
            --generar el secuencial
            SELECT SCOB_SQ_COD_GEN_PLAN_RESOL.NEXTVAL INTO N_COD_GEN_PLAN_RESOL FROM DUAL;
            V_COD_INTERNO := LPAD(TO_CHAR(N_COD_GEN_PLAN_RESOL),10,'0000000000');

         WHEN PI_I_COD_SUBTIPO_DOCUMENTO=SCOB_PK_CONSTANTES.C_COD_SUBTIPODOC_CED_REC --OR
              --PI_I_COD_SUBTIPO_DOCUMENTO=SCOB_PK_CONSTANTES.C_COD_SUBTIPODOC_OFICIO OR
              --PI_I_COD_SUBTIPO_DOCUMENTO=SCOB_PK_CONSTANTES.C_COD_SUBTIPODOC_CEDULA
              THEN

            SELECT PLANT.COD_INTERNO
            INTO V_COD_INTERNO
            FROM T_SCOB_PLANTILLA PLANT
            WHERE PLANT.ID_PLANTILLA = PI_N_ID_PLANTILLA_RESOLUCION;
         ELSE
            V_COD_INTERNO := NULL;
       END CASE;
  END;
  END IF;

  SELECT SCOB_SQ_PLANTILLA.NEXTVAL INTO N_ID_PLANTILLA FROM DUAL;
  INSERT INTO T_SCOB_PLANTILLA(
    ID_PLANTILLA,
    CODIGO,
    DESCRIPCION,
    NOM_CORTO,
    ESTADO,
    AUDFECCREACION,
    AUDUSUCREACION,
    COD_TIPO_PLANTILLA,
    ID_TIPO_DOCUMENTO,
    COD_INTERNO,
    NOM_ARCHIVO,
    IND_ASOC_PLANTILLA,
    ID_PLANTILLA_RESOLUCION
  )
  VALUES(
    N_ID_PLANTILLA,
    PI_V_CODIGO,
    PI_V_DESCRIPCION,
    PI_V_NOM_CORTO,
    SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO,
    SYSDATE,
    PI_V_AUDUSUCREACION,
    PI_I_COD_TIPO_PLANTILLA,
    DECODE(PI_N_ID_TIPO_DOCUMENTO,0, NULL, PI_N_ID_TIPO_DOCUMENTO),
    V_COD_INTERNO,
    PI_V_NOMBRE,
    PI_C_TIPO_EVENTO,
    PI_N_ID_PLANTILLA_RESOLUCION
  );

  IF PI_C_TIPO_EVENTO = '1' THEN --MULTA
  BEGIN
      --inserta T_SCOB_MOTIVO_MUL_PLANTILLA
      SELECT SCOB_SQ_MOTIVO_MUL_PLANTILLA.NEXTVAL INTO N_ID_MOTIVO_PLANTILLA FROM DUAL;
      INSERT INTO T_SCOB_MOTIVO_MUL_PLANTILLA(
        ID_MOTIVO_MUL_PLANTILLA,
        ID_MOTIVO,
        ID_PLANTILLA,
        ID_EST_MUL_COB,
        ESTADO,
        AUDFECCREACION,
        AUDUSUCREACION)
      VALUES(
        N_ID_MOTIVO_PLANTILLA,
        PI_N_ID_MOTIVO,
        N_ID_PLANTILLA,
        PI_I_COD_ESTADO_MUL_EXP,
        SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO,
        SYSDATE,
        PI_V_AUDUSUCREACION
      );
   END;
   ELSE --EXPEDIENTE
     BEGIN
        --inserta T_SCOB_MOTIVO_PLANTILLA
        SELECT SCOB_SQ_MOTIVO_PLANTILLA.NEXTVAL INTO N_ID_MOTIVO_PLANTILLA FROM DUAL;
        INSERT INTO T_SCOB_MOTIVO_PLANTILLA(
          ID_MOTIVO_PLANTILLA,
          ID_MOTIVO,
          ID_PLANTILLA,
          ID_EST_EXP_COB,
          ESTADO,
          AUDFECCREACION,
          AUDUSUCREACION)
        VALUES(
          N_ID_MOTIVO_PLANTILLA,
          PI_N_ID_MOTIVO,
          N_ID_PLANTILLA,
          PI_I_COD_ESTADO_MUL_EXP,
          SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO,
          SYSDATE,
          PI_V_AUDUSUCREACION
        );
     END;
   END IF;

  po_n_cod_error := 0;
  po_n_retorno := N_ID_PLANTILLA;
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

procedure SCOB_SP_U_PLANTILLA_MULT_EXPED
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 26.05.2011
-- Proposito    : actualiza plantillas de multas o expedientes
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_PLANTILLA                    IN T_SCOB_PLANTILLA.ID_PLANTILLA%TYPE,
  PI_V_CODIGO                          IN T_SCOB_PLANTILLA.CODIGO%TYPE,
  PI_V_DESCRIPCION                     IN T_SCOB_PLANTILLA.DESCRIPCION%TYPE,
  PI_V_NOM_CORTO                       IN T_SCOB_PLANTILLA.NOM_CORTO%TYPE,
  PI_V_NOMBRE                          IN T_SCOB_PLANTILLA.NOM_ARCHIVO%TYPE,
  PI_V_AUDUSUMODIFICACION              IN T_SCOB_PLANTILLA.AUDUSUMODIFICACION%TYPE,
  po_n_retorno                         out number,
  po_n_cod_error                       out number,
  po_v_msj_error                       out varchar2
)
is
begin
  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  UPDATE T_SCOB_PLANTILLA PLANT
  SET
    CODIGO = PI_V_CODIGO,
    DESCRIPCION = PI_V_DESCRIPCION,
    NOM_CORTO = PI_V_NOM_CORTO,
    NOM_ARCHIVO = PI_V_NOMBRE,
    AUDFECMODIFICACION = SYSDATE,
    AUDUSUMODIFICACION = PI_V_AUDUSUMODIFICACION
    ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --ID_TIPO_DOCUMENTO = DECODE(PI_N_ID_TIPO_DOCUMENTO,0, NULL, PI_N_ID_TIPO_DOCUMENTO),
    --COD_TIPO_PLANTILLA = PI_I_COD_TIPO_PLANTILLA
    ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  WHERE ID_PLANTILLA = PI_N_ID_PLANTILLA;

  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 /* IF PI_C_TIPO_EVENTO = '1' THEN --MULTA
    BEGIN
    UPDATE T_SCOB_MOTIVO_MUL_PLANTILLA SET
          ID_EST_MUL_COB = PI_I_COD_ESTADO_MUL_EXP,
      ID_MOTIVO = PI_N_ID_MOTIVO
    WHERE
      ID_MOTIVO_MUL_PLANTILLA = PI_N_ID_MOTIVO;--NUEVO

    END;
  ELSE --EXPEDIENTE
     BEGIN
    UPDATE T_SCOB_MOTIVO_PLANTILLA SET
          ID_EST_EXP_COB = PI_I_COD_ESTADO_MUL_EXP,
      ID_MOTIVO = PI_N_ID_MOTIVO
        WHERE
          ID_MOTIVO_PLANTILLA = PI_N_ID_MOTIVO;
  END;
  END IF; */
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  po_n_cod_error := 0;
  po_n_retorno := PI_N_ID_PLANTILLA;
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

procedure SCOB_SP_D_PLANTILLA_MULT_EXPED
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 26.05.2011
-- Proposito    : elimina plantillas de multas o expedientes
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_V_ID_PLANTILLA                    IN VARCHAR2,
  PI_I_NRO_ITEMS                       IN INTEGER,
  PI_V_AUDUSUMODIFICACION              IN T_SCOB_PLANTILLA.AUDUSUMODIFICACION%TYPE,
  po_n_retorno                         out number,
  po_n_cod_error                       out number,
  po_v_msj_error                       out varchar2
)
is
  C_IND_ASOC_PLANTILLA                 T_SCOB_PLANTILLA.IND_ASOC_PLANTILLA%TYPE;
  N_ID_PLANTILLA                       T_SCOB_PLANTILLA.ID_PLANTILLA%TYPE;
  V_ID_PLANTILLA                       VARCHAR2(20);
  I_NRO_REG                            INTEGER;
begin
  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  I_NRO_REG := 1;
  WHILE (I_NRO_REG <= PI_I_NRO_ITEMS)
  LOOP

    SCOB_PK_UTILITARIO.SCOB_SP_S_SPLIT(PI_V_ID_PLANTILLA,'|', I_NRO_REG+1, V_ID_PLANTILLA);
    IF V_ID_PLANTILLA='#' THEN
     rollback;
     EXIT;
    END IF;
    N_ID_PLANTILLA := TO_NUMBER(V_ID_PLANTILLA);

    /*obtener el ind_asoc_plantilla :si es multa o expediente*/
    SELECT
      PLANT.IND_ASOC_PLANTILLA INTO C_IND_ASOC_PLANTILLA
    FROM T_SCOB_PLANTILLA PLANT
    WHERE PLANT.ID_PLANTILLA = N_ID_PLANTILLA;

    UPDATE T_SCOB_PLANTILLA PLANT
    SET
      ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_INACTIVO,
      AUDFECMODIFICACION = SYSDATE,
      AUDUSUMODIFICACION = PI_V_AUDUSUMODIFICACION
    WHERE ID_PLANTILLA = N_ID_PLANTILLA;

    IF C_IND_ASOC_PLANTILLA = '1' THEN
      UPDATE T_SCOB_MOTIVO_MUL_PLANTILLA
      SET
        ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_INACTIVO,
        AUDFECMODIFICACION = SYSDATE,
        AUDUSUMODIFICACION = PI_V_AUDUSUMODIFICACION
      WHERE ID_PLANTILLA = N_ID_PLANTILLA;

    ELSE
      UPDATE T_SCOB_MOTIVO_PLANTILLA
      SET
        ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_INACTIVO,
        AUDFECMODIFICACION = SYSDATE,
        AUDUSUMODIFICACION = PI_V_AUDUSUMODIFICACION
      WHERE ID_PLANTILLA = N_ID_PLANTILLA;
    END IF;

    I_NRO_REG := I_NRO_REG + 1;
  END LOOP;

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

procedure SCOB_SP_S_PLANTILLA_MULT_EXPED
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 26.05.2011
-- Proposito    : edita plantillas de multas o expedientes
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_N_ID_PLANTILLA                   IN T_SCOB_PLANTILLA.ID_PLANTILLA%TYPE,
  po_cu_retorno                       out cu_rec_set
)
as
begin

  open  po_cu_retorno for
  SELECT
    PLANT.ID_PLANTILLA,
    PLANT.COD_TIPO_PLANTILLA,
    PLANT.CODIGO,
    PLANT.DESCRIPCION,
    PLANT.NOM_CORTO,
    PLANT.NOM_ARCHIVO,
    PLANT.ID_TIPO_DOCUMENTO,
    DECODE(PLANT.IND_ASOC_PLANTILLA,'1',MOTI_MULTA.ID_MOTIVO,MOTI_PLAN.ID_MOTIVO) AS ID_MOTIVO,
    DECODE(PLANT.IND_ASOC_PLANTILLA,'1',MOTI_MULTA.ID_EST_MUL_COB,MOTI_PLAN.ID_EST_EXP_COB) AS ID_ESTADO_MOTIVO,
    PLANT.COD_INTERNO AS COD_INTERNO,
    TIDO.COD_SUBTIPO_DOCUMENTO AS COD_SUBTIPO_DOCUMENTO,
    PLANT.IND_ASOC_PLANTILLA AS IND_ASOC_PLANTILLA,
    PLANT.ID_PLANTILLA_RESOLUCION AS ID_PLANTILLA_RESOLUCION
  FROM T_SCOB_PLANTILLA PLANT
  LEFT JOIN T_SCOB_MOTIVO_MUL_PLANTILLA MOTI_MULTA
        ON MOTI_MULTA.ID_PLANTILLA = PLANT.ID_PLANTILLA
  LEFT JOIN T_SCOB_MOTIVO_PLANTILLA MOTI_PLAN
        ON MOTI_PLAN.ID_PLANTILLA = PLANT.ID_PLANTILLA
  LEFT JOIN T_SCOB_TIPO_DOCUMENTO TIDO
       ON TIDO.ID_TIPO_DOCUMENTO = PLANT.ID_TIPO_DOCUMENTO
  WHERE PLANT.ID_PLANTILLA = PI_N_ID_PLANTILLA;

end;
---

PROCEDURE SCOB_SP_S_INTENDENCIA(
   PI_ID IN NUMBER,
   PI_COD_INTERNO IN  VARCHAR2,
   PI_DESCRIPCION IN  VARCHAR2,
   po_cu_retorno  OUT cu_rec_set
)
IS
BEGIN

   OPEN po_cu_retorno FOR

SELECT
        CA.ID_INTENDENCIA AS ID,
        CA.CODIGO AS CODIGO,
        CA.DESCRIPCION AS DESCRIPCION
   FROM T_SCOB_INTENDENCIA CA
   WHERE
       (PI_ID = 0 OR  CA.ID_INTENDENCIA = PI_ID)
       AND (PI_COD_INTERNO IS NULL OR CA.CODIGO = PI_COD_INTERNO)
       AND (PI_DESCRIPCION is null or fun_scob_nosensite(CA.DESCRIPCION) like '%' || fun_scob_nosensite(PI_DESCRIPCION)|| '%' )
       AND CA.ESTADO = '1';
END;

procedure SCOB_SP_I_INTENDENCIA
(
    pi_v_codigo      in varchar2,
    pi_v_descripcion      in varchar2,
    pi_v_audusucrea      in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
)
as
v_cursor  cu_rec_set;
v_existe integer;
begin

  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  ----------------
   SELECT COUNT(t.id_intendencia)
   INTO   v_existe
   FROM   T_SCOB_INTENDENCIA t
   WHERE  (upper(t.codigo) = upper(pi_v_codigo) or
          upper(t.descripcion) = upper(pi_v_descripcion))
          and t.estado = '1';

   IF v_existe > 0 THEN
          po_n_cod_error := -2;
          po_n_retorno := -2;
          po_v_msj_error := 'Registro duplicado. Verificar la existencia del codigo y/o descripcion.';
          ROLLBACK;
          RETURN;
   END IF;
   -----------

   insert into T_SCOB_INTENDENCIA
     (id_intendencia, codigo, descripcion, estado,
      audfeccreacion, audusucreacion, audfecmodificacion, audusumodificacion)
    values
     (SCOB_SQ_INTENDENCIA.NEXTVAL, pi_v_codigo, pi_v_descripcion,'1',
     SYSDATE, pi_v_audusucrea,null, null)
     RETURNING id_intendencia INTO po_n_retorno;

   commit;

   po_n_cod_error := 0;

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

procedure SCOB_SP_U_INTENDENCIA
(
    pi_n_id in number,
    pi_v_codigo in varchar2,
    pi_v_descripcion in varchar2,
    pi_v_audusucrea      in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
)
as
v_cursor  cu_rec_set;
v_existe integer;
begin

  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

   ----------------
   SELECT COUNT(u.id_intendencia)
   INTO   v_existe
   FROM   t_scob_intendencia u
   WHERE  (upper(u.codigo) = upper(pi_v_codigo) or
          upper(u.descripcion) = upper(pi_v_descripcion)) and
          u.id_intendencia <> pi_n_id and
          u.estado = '1';

   IF v_existe > 0 THEN
          po_n_cod_error := -2;
          po_n_retorno := -2;
          po_v_msj_error := 'Registro duplicado. Verificar la existencia del codigo y/o descripcion.';
          ROLLBACK;
          RETURN;
   END IF;
   -----------

   update t_scob_intendencia
      set
          codigo = pi_v_codigo,
          descripcion = pi_v_descripcion,
          audfecmodificacion = sysdate,
          audusumodificacion = pi_v_audusucrea
    where id_intendencia = pi_n_id;

   commit;

   po_n_cod_error := 0;
   po_n_retorno :=pi_n_id;

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

procedure SCOB_SP_D_INTENDENCIA
(
    pi_v_cad_id in varchar2,--|1|2|..
    pi_v_audusucrea      in varchar2,
    po_n_retorno      out number,
    po_n_cod_error    out number,
    po_v_msj_error    out varchar2
)
as

v_cursor  cu_rec_set;
n_Contador number(10,0);
n_Ide number(10,0);
v_Ide_Opcion varchar2(10);

begin


  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := -1;

  update t_scob_intendencia
  set estado = '0'
  where instr(pi_v_cad_id,'|' || to_char(id_intendencia) || '|' )>0
  and estado = '1';

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

PROCEDURE SCOB_SP_S_SUBMATERIA(
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 11.07.2011
-- Proposito    : LISTAR SUBMATERIA POR MATERIA
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
  PI_N_ID_MATERIA      IN T_SCOB_SUBMATERIA.ID_MATERIA%TYPE,
  PI_N_ID_SUBMATERIA   IN T_SCOB_SUBMATERIA.ID_SUBMATERIA%TYPE,
  PI_V_CODIGO          IN T_SCOB_SUBMATERIA.CODIGO%TYPE,
  PI_V_DESCRIPCION     IN T_SCOB_SUBMATERIA.DESCRIPCION%TYPE,
  po_cu_retorno        out cu_rec_set
)
IS
BEGIN

  OPEN po_cu_retorno FOR
  SELECT
       SUBM.ID_SUBMATERIA AS ID_SUBMATERIA,
       SUBM.CODIGO AS CODIGO,
       SUBM.DESCRIPCION AS DESCRIPCION,
       SUBM.ABREVIATURA AS ABREVIATURA,
       NVL(SUBM.FLG_NO_EDITABLE,'0') AS FLG_NO_EDITABLE
  FROM T_SCOB_SUBMATERIA SUBM
  WHERE
    SUBM.ID_MATERIA = PI_N_ID_MATERIA
    AND (PI_N_ID_SUBMATERIA = 0 OR (PI_N_ID_SUBMATERIA <> 0 AND SUBM.ID_SUBMATERIA = PI_N_ID_SUBMATERIA))
    AND (NVL(PI_V_CODIGO,' ')=' ' OR (NVL(PI_V_CODIGO,' ')<>' ' AND SUBM.CODIGO = PI_V_CODIGO))
    AND (NVL(PI_V_DESCRIPCION,' ')=' ' OR (NVL(PI_V_DESCRIPCION,' ')<>' ' AND SUBM.DESCRIPCION LIKE '%'|| PI_V_DESCRIPCION  ||'%'))
    AND SUBM.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO;

END;

procedure SCOB_SP_I_SUBMATERIA(
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 11.07.2011
-- Proposito    : INSERTAR SUBMATERIA POR MATERIA
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
  PI_N_ID_MATERIA         IN T_SCOB_SUBMATERIA.ID_SUBMATERIA%TYPE,
  PI_V_CODIGO             IN T_SCOB_SUBMATERIA.CODIGO%TYPE,
  PI_V_DESCRIPCION        IN T_SCOB_SUBMATERIA.DESCRIPCION%TYPE,
  PI_V_ABREVIATURA        IN T_SCOB_SUBMATERIA.ABREVIATURA%TYPE,
  PI_V_AUDUSUCREACION     IN T_SCOB_SUBMATERIA.AUDUSUCREACION%TYPE,
  po_n_retorno            out number,
  po_n_cod_error          out number,
  po_v_msj_error          out varchar2
)
as
v_existe int;
begin
  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := 0;

    ----------------
   SELECT COUNT(t.id_submateria)
   INTO   v_existe
   FROM   T_SCOB_SUBMATERIA t
   WHERE  (upper(t.codigo) = upper(PI_V_CODIGO) or
          upper(t.descripcion) = upper(PI_V_DESCRIPCION))
          and t.id_materia = PI_N_ID_MATERIA
          and t.estado = '1';

   IF v_existe > 0 THEN
          po_n_cod_error := -2;
          po_n_retorno := -2;
          po_v_msj_error := 'Registro duplicado. Verificar la existencia del codigo y/o descripcion por materia.';
          ROLLBACK;
          RETURN;
   END IF;
   -----------

  INSERT INTO T_SCOB_SUBMATERIA(
    ID_SUBMATERIA,
    ID_MATERIA,
    CODIGO,
    DESCRIPCION,
    ABREVIATURA,
    ESTADO,
    AUDFECCREACION,
    AUDUSUCREACION
  )
  VALUES(
    SCOB_SQ_SUBMATERIA.NEXTVAL,
    PI_N_ID_MATERIA,
    PI_V_CODIGO,
    PI_V_DESCRIPCION,
    PI_V_ABREVIATURA,
    SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO,
    SYSDATE,
    PI_V_AUDUSUCREACION
  )
  RETURNING ID_SUBMATERIA INTO po_n_retorno;
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

procedure SCOB_SP_U_SUBMATERIA(
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 11.07.2011
-- Proposito    : ACTUALIZA SUBMATERIA POR MATERIA
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
  PI_N_ID_SUBMATERIA        IN T_SCOB_SUBMATERIA.ID_SUBMATERIA%TYPE,
  PI_V_CODIGO               IN T_SCOB_SUBMATERIA.CODIGO%TYPE,
  PI_V_DESCRIPCION          IN T_SCOB_SUBMATERIA.DESCRIPCION%TYPE,
  PI_V_ABREVIATURA          IN T_SCOB_SUBMATERIA.ABREVIATURA%TYPE,
  PI_V_AUDUSUMODIFICACION   IN T_SCOB_SUBMATERIA.AUDUSUMODIFICACION%TYPE,
  po_n_retorno              out number,
  po_n_cod_error            out number,
  po_v_msj_error            out varchar2
)
as
  v_existe                    INT;
  N_ID_MATERIA                NUMBER;

begin
  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := 0;

   ----------------
   --obtener la materia de la submateri
   SELECT SM.ID_MATERIA
   INTO N_ID_MATERIA
   FROM T_SCOB_SUBMATERIA SM
   WHERE SM.ID_SUBMATERIA = PI_N_ID_SUBMATERIA;

   SELECT COUNT(u.id_submateria)
   INTO   v_existe
   FROM   T_SCOB_SUBMATERIA u
   WHERE  (upper(u.codigo) = upper(PI_V_CODIGO) or
          upper(u.descripcion) = upper(PI_V_DESCRIPCION))
          and u.id_submateria <> PI_N_ID_SUBMATERIA
          and u.id_materia = N_ID_MATERIA
          and u.estado = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO;

   IF v_existe > 0 THEN
          po_n_cod_error := -2;
          po_n_retorno := -2;
          po_v_msj_error := 'Registro duplicado. Verificar la existencia del codigo y/o descripcion por materia.';
          ROLLBACK;
          RETURN;
   END IF;
   -----------

  UPDATE T_SCOB_SUBMATERIA
  SET
    CODIGO = PI_V_CODIGO,
    DESCRIPCION = PI_V_DESCRIPCION,
    ABREVIATURA = PI_V_ABREVIATURA,
    AUDFECMODIFICACION = SYSDATE,
    AUDUSUMODIFICACION = PI_V_AUDUSUMODIFICACION
  WHERE ID_SUBMATERIA = PI_N_ID_SUBMATERIA;
  --WHERE PI_N_ID_SUBMATERIA = PI_N_ID_SUBMATERIA;

  po_n_retorno := PI_N_ID_SUBMATERIA;
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


procedure SCOB_SP_D_SUBMATERIA(
/*
-----------------------------------------------------------
-- Autor        : RMCA
-- Creado       : 11.07.2011
-- Proposito    : ELIMINA SUBMATERIA POR MATERIA
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
  PI_V_ID_SUBMATERIA        IN VARCHAR2,
  PI_V_AUDUSUMODIFICACION   IN T_SCOB_SUBMATERIA.AUDUSUMODIFICACION%TYPE,
  po_n_retorno              out number,
  po_n_cod_error            out number,
  po_v_msj_error            out varchar2
)
as
  I_EXISTE                  INTEGER;
begin
  po_v_msj_error :='';
  po_n_retorno := 0;
  po_n_cod_error := 0;

  --verificar si se encuentra dentro de los registro a eliminar el antidumping
  SELECT COUNT(SUMA.ID_SUBMATERIA)
  INTO I_EXISTE
  FROM T_SCOB_SUBMATERIA SUMA
  WHERE INSTR(PI_V_ID_SUBMATERIA,'|' || TO_CHAR(SUMA.ID_SUBMATERIA) || '|' )>0
  AND NVL(FLG_NO_EDITABLE,'0')='1';

  UPDATE T_SCOB_SUBMATERIA
  SET
    ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_INACTIVO,
    AUDFECMODIFICACION = SYSDATE,
    AUDUSUMODIFICACION = PI_V_AUDUSUMODIFICACION
  WHERE INSTR(PI_V_ID_SUBMATERIA,'|' || TO_CHAR(ID_SUBMATERIA) || '|' )>0
  AND NVL(FLG_NO_EDITABLE,'0')='0';


  IF I_EXISTE > 0 THEN
     po_n_retorno := -1;
     po_n_cod_error := po_n_retorno;
     po_v_msj_error := 'No se puede eliminar el registro asociado a Antidumping.';
  ELSE
     po_n_retorno := 1;
  END IF;

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

PROCEDURE SCOB_SP_S_SUBMATERIA_MAS(
  PI_V_ID_MATERIA      IN VARCHAR2,
  po_cu_retorno        out cu_rec_set
)
IS
BEGIN

  OPEN po_cu_retorno FOR
  SELECT
       SUBM.ID_SUBMATERIA AS ID_SUBMATERIA,
       SUBM.CODIGO AS CODIGO,
       SUBM.DESCRIPCION AS DESCRIPCION,
       SUBM.ABREVIATURA AS ABREVIATURA,
       NVL(SUBM.FLG_NO_EDITABLE,'0') AS FLG_NO_EDITABLE
  FROM T_SCOB_SUBMATERIA SUBM
  WHERE
    ( '|0|' = PI_V_ID_MATERIA or instr(PI_V_ID_MATERIA,'|' || to_char(SUBM.ID_MATERIA) || '|' )>0 )
    AND SUBM.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO;

END;

procedure SCOB_SP_S_EST_MUL_COB_MOT_MAS
(
     pi_v_id_est_mul_cob  in varchar, --comodin '|0|'
     po_cu_retorno   out cu_rec_set
)
as
begin

  open  po_cu_retorno for

select
  id_motivo,
  id_est_mul_cob,
  codigo,
  descripcion,
  estado,
  '' as des_estado
from
  t_scob_est_mul_cob_motivo
where
  ( '|0|' = pi_v_id_est_mul_cob or instr(pi_v_id_est_mul_cob,'|' || to_char(id_est_mul_cob) || '|' )>0 )
  and estado = '1';

end;

procedure SCOB_SP_S_EST_EXP_COB_MOT_MAS
(
     pi_n_id_est_exp_cob  in varchar2, --comodin |0|
     po_cu_retorno   out cu_rec_set
)
as
begin

  open  po_cu_retorno for

select
  id_motivo as id_motivo,
  id_est_exp_cob as id_est_exp_cob,
  codigo as codigo,
  descripcion as descripcion,
  estado as estado
from
  t_scob_est_exp_cob_motivo
where
  ( '|0|' = pi_n_id_est_exp_cob or instr(pi_n_id_est_exp_cob,'|' || to_char(id_est_exp_cob) || '|' )>0 )
  and estado = '1';

end;

PROCEDURE SCOB_SP_S_CLASIF_INDECOPI(
  PI_V_CODIGO                    IN T_SCOB_CLASIFICACION_INDECOPI.CODIGO%TYPE,
  PI_V_DESCRIPCION              IN T_SCOB_CLASIFICACION_INDECOPI.DESCRIPCION%TYPE,
  po_cu_retorno                 OUT cu_rec_set
)
IS
BEGIN

   OPEN po_cu_retorno FOR
   SELECT
          CLIN.ID_CLASIFICACION AS ID_CLASIFICACION,
          CLIN.CODIGO AS CODIGO,
          CLIN.DESCRIPCION AS DESCRIPCION
   FROM T_SCOB_CLASIFICACION_INDECOPI CLIN
   WHERE CLIN.ESTADO = '1'
   AND (NVL(PI_V_CODIGO,' ')= ' ' OR (NVL(PI_V_CODIGO,' ')<> ' ' AND UPPER(CLIN.CODIGO) LIKE '%' || UPPER(PI_V_CODIGO) || '%'))
   AND (NVL(PI_V_DESCRIPCION,' ')= ' ' OR (NVL(PI_V_DESCRIPCION,' ')<> ' ' AND UPPER(CLIN.DESCRIPCION) LIKE '%' || UPPER(PI_V_DESCRIPCION) || '%'))
   ;


END;
--

procedure SCOB_SP_S_CONS_PLANTILLA_RANGO
/*
-----------------------------------------------------------
-- Autor        : ROCHOA
-- Creado       : 26.05.2011
-- Proposito    : consultar las plantillas registradas para un expediente
-----------------------------------------------------------
-- Modificacion :
-- Autor        :
-- Modificado   :
-- Proposito    :
-----------------------------------------------------------
*/
(
  PI_I_COD_TIPO_PLANTILLA                  IN T_SCOB_PLANTILLA.COD_TIPO_PLANTILLA%TYPE,
  PI_V_DESCRIPCION                         IN T_SCOB_PLANTILLA.DESCRIPCION%TYPE,
  PI_I_ID_MOTIVO                           IN T_SCOB_EST_MUL_COB_MOTIVO.ID_MOTIVO%TYPE,
  PI_I_COD_ESTADO                          IN INTEGER, --DEL ESTADO DE LA MULTA Y DEL EXPEDIENTE
  PI_I_COD_SUBTIPO_DOCUMENTO               IN T_SCOB_TIPO_DOCUMENTO.COD_SUBTIPO_DOCUMENTO%TYPE,
  PI_I_COD_TIPO_DOCUMENTO                  IN INTEGER,
  PI_I_COD_TIPO_DOCUMENTO_FIN              IN INTEGER,
  po_cu_retorno                            out cu_rec_set
)
as
begin

  open  po_cu_retorno for
  --caso multas : plantillas asociadas a motivos y estados
  SELECT
    '1',
    PLANT.ID_PLANTILLA AS ID_PLANTILLA,
    PLANT.CODIGO AS COD_PLANTILLA,
    PLANT.DESCRIPCION AS DESCRIPCION,
    PLANT.NOM_CORTO AS NOM_CORTO,
    PLANT.COD_TIPO_PLANTILLA AS COD_TIPO_PLANTILLA,
    TIPP.TXT_DESCRIPCION AS NOM_TIPO_PLANTILLA,
    PLANT.ID_TIPO_DOCUMENTO,
    TIDO.COD_SUBTIPO_DOCUMENTO AS COD_SUBTIPO_DOCUMENTO,
    SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_SUB_TIPO_DOCUMENTO,TIDO.COD_SUBTIPO_DOCUMENTO) AS NOM_SUBTIPO_DOCUMENTO,
    MOTI.ID_MOTIVO AS ID_MOTIVO,
    MOTI.DESCRIPCION AS NOM_MOTIVO,
    ESTA.ID_EST_EXP_COB AS ID_ESTADO,
    ESTA.DESCRIPCION AS NOM_ESTADO,
    PLANT.COD_TIPO_PLANTILLA  AS COD_TIPO_PLANTILLA,
    TIPP.TXT_VALOR1 AS NOM_CORTO_TIPO_PLANTILLA,
    PLANT.NOM_ARCHIVO AS NOM_ARCHIVO,
    PLANT.COD_INTERNO AS COD_INTERNO,
    TIDO.COD_TIPO_DOCUMENTO AS COD_TIPO_DOCUMENTO,
    MOPL.ID_MOTIVO_PLANTILLA AS ID_MOTIVO_PLANTILLA

  FROM T_SCOB_PLANTILLA PLANT
  INNER JOIN T_SCOB_TIPO_DOCUMENTO TIDO
        ON TIDO.ID_TIPO_DOCUMENTO = PLANT.ID_TIPO_DOCUMENTO
  INNER JOIN T_SCOB_MOTIVO_PLANTILLA MOPL
       ON MOPL.ID_PLANTILLA = PLANT.ID_PLANTILLA
  INNER JOIN T_SCOB_EST_EXP_COB_MOTIVO MOTI
        ON MOTI.ID_MOTIVO = MOPL.ID_MOTIVO
  INNER JOIN T_SCOB_EST_EXP_COB ESTA
        ON ESTA.ID_EST_EXP_COB = MOTI.ID_EST_EXP_COB
  LEFT JOIN T_SCOB_TABLA_DET TIPP
        ON TIPP.ID_TABLA = SCOB_PK_CONSTANTES.C_TBL_TIPO_PLANTILLA
        AND TIPP.COD_INTERNO = PLANT.COD_TIPO_PLANTILLA
  WHERE
  (PI_I_COD_TIPO_PLANTILLA = 0 OR (PI_I_COD_TIPO_PLANTILLA <> 0 AND COD_TIPO_PLANTILLA = PI_I_COD_TIPO_PLANTILLA))
  AND PLANT.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
  AND ((PI_I_ID_MOTIVO = 0 AND MOPL.ID_MOTIVO<>0) OR
       (PI_I_ID_MOTIVO<>0 AND MOPL.ID_MOTIVO = PI_I_ID_MOTIVO))
  AND (PI_I_COD_SUBTIPO_DOCUMENTO = 0 OR (PI_I_COD_SUBTIPO_DOCUMENTO<>0 AND TIDO.COD_SUBTIPO_DOCUMENTO = PI_I_COD_SUBTIPO_DOCUMENTO))
  AND ( (PI_I_COD_TIPO_DOCUMENTO=0) OR
    (PI_I_COD_TIPO_DOCUMENTO <= CAST(TIDO.COD_TIPO_DOCUMENTO AS INTEGER)
    AND CAST(TIDO.COD_TIPO_DOCUMENTO AS INTEGER) <= PI_I_COD_TIPO_DOCUMENTO_FIN)
    )
  --AND (NVL(PI_V_COD_TIPO_DOCUMENTO,' ')=' ' OR (NVL(PI_V_COD_TIPO_DOCUMENTO,' ')<>' ' AND UPPER(TIDO.COD_TIPO_DOCUMENTO)=UPPER(PI_V_COD_TIPO_DOCUMENTO)))
  AND fun_scob_nosensite(TRIM(PLANT.DESCRIPCION)) LIKE '%' || fun_scob_nosensite(TRIM(PI_V_DESCRIPCION))  || '%'

  UNION
  --caso multas : plantillas asociadas a estados
  SELECT
    '2',
    PLANT.ID_PLANTILLA AS ID_PLANTILLA,
    PLANT.CODIGO AS COD_PLANTILLA,
    PLANT.DESCRIPCION AS DESCRIPCION,
    PLANT.NOM_CORTO AS NOM_CORTO,
    PLANT.COD_TIPO_PLANTILLA AS COD_TIPO_PLANTILLA,
    TIPP.TXT_DESCRIPCION AS NOM_TIPO_PLANTILLA,
    PLANT.ID_TIPO_DOCUMENTO,
    TIDO.COD_SUBTIPO_DOCUMENTO AS COD_SUBTIPO_DOCUMENTO,
    SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_SUB_TIPO_DOCUMENTO,TIDO.COD_SUBTIPO_DOCUMENTO) AS NOM_SUBTIPO_DOCUMENTO,
    MOPL.ID_MOTIVO AS ID_MOTIVO,
    ' ' AS NOM_MOTIVO,
    ESTA.ID_EST_EXP_COB AS ID_ESTADO,
    ESTA.DESCRIPCION AS NOM_ESTADO,
    PLANT.COD_TIPO_PLANTILLA  AS COD_TIPO_PLANTILLA,
    TIPP.TXT_VALOR1 AS NOM_CORTO_TIPO_PLANTILLA,
    PLANT.NOM_ARCHIVO AS NOM_ARCHIVO,
    PLANT.COD_INTERNO AS COD_INTERNO,
    TIDO.COD_TIPO_DOCUMENTO AS COD_TIPO_DOCUMENTO  ,
    MOPL.ID_MOTIVO_PLANTILLA AS ID_MOTIVO_PLANTILLA
  FROM T_SCOB_PLANTILLA PLANT
  INNER JOIN T_SCOB_TIPO_DOCUMENTO TIDO
        ON TIDO.ID_TIPO_DOCUMENTO = PLANT.ID_TIPO_DOCUMENTO
  INNER JOIN T_SCOB_MOTIVO_PLANTILLA MOPL
       ON MOPL.ID_PLANTILLA = PLANT.ID_PLANTILLA
       AND MOPL.ID_MOTIVO = 0 --SIN MOTIVO ASIGNADO
  INNER JOIN T_SCOB_EST_EXP_COB ESTA
        ON ESTA.ID_EST_EXP_COB = MOPL.ID_EST_EXP_COB
  LEFT JOIN T_SCOB_TABLA_DET TIPP
        ON TIPP.ID_TABLA = SCOB_PK_CONSTANTES.C_TBL_TIPO_PLANTILLA
        AND TIPP.COD_INTERNO = PLANT.COD_TIPO_PLANTILLA
  WHERE
  (PI_I_COD_TIPO_PLANTILLA = 0 OR (PI_I_COD_TIPO_PLANTILLA <> 0 AND COD_TIPO_PLANTILLA = PI_I_COD_TIPO_PLANTILLA))
  AND PLANT.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
  AND ((PI_I_COD_ESTADO=0 AND MOPL.ID_EST_EXP_COB<>0) OR
       (PI_I_COD_ESTADO<>0 AND MOPL.ID_EST_EXP_COB = PI_I_COD_ESTADO))
  AND (PI_I_COD_SUBTIPO_DOCUMENTO = 0 OR (PI_I_COD_SUBTIPO_DOCUMENTO<>0 AND TIDO.COD_SUBTIPO_DOCUMENTO = PI_I_COD_SUBTIPO_DOCUMENTO))
  AND ( (PI_I_COD_TIPO_DOCUMENTO=0) OR
    (PI_I_COD_TIPO_DOCUMENTO <= CAST(TIDO.COD_TIPO_DOCUMENTO AS INTEGER)
    AND CAST(TIDO.COD_TIPO_DOCUMENTO AS INTEGER) <= PI_I_COD_TIPO_DOCUMENTO_FIN)
    )
---(NVL(PI_V_COD_TIPO_DOCUMENTO,' ')<>' ' AND UPPER(TIDO.COD_TIPO_DOCUMENTO)=UPPER(PI_V_COD_TIPO_DOCUMENTO)))

  AND fun_scob_nosensite(TRIM(PLANT.DESCRIPCION)) LIKE '%' || fun_scob_nosensite(TRIM(PI_V_DESCRIPCION))  || '%'


  UNION
  --caso multas : plantillas genericas
  SELECT
    '3',
    PLANT.ID_PLANTILLA AS ID_PLANTILLA,
    PLANT.CODIGO AS COD_PLANTILLA,
    PLANT.DESCRIPCION AS DESCRIPCION,
    PLANT.NOM_CORTO AS NOM_CORTO,
    PLANT.COD_TIPO_PLANTILLA AS COD_TIPO_PLANTILLA,
    TIPP.TXT_DESCRIPCION AS NOM_TIPO_PLANTILLA,
    PLANT.ID_TIPO_DOCUMENTO,
    TIDO.COD_SUBTIPO_DOCUMENTO AS COD_SUBTIPO_DOCUMENTO,
    SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_SUB_TIPO_DOCUMENTO,TIDO.COD_SUBTIPO_DOCUMENTO) AS NOM_SUBTIPO_DOCUMENTO,
    0 AS ID_MOTIVO,
    ' ' AS NOM_MOTIVO,
    0 AS ID_ESTADO,
    ' ' AS NOM_ESTADO,
    PLANT.COD_TIPO_PLANTILLA  AS COD_TIPO_PLANTILLA,
    TIPP.TXT_VALOR1 AS NOM_CORTO_TIPO_PLANTILLA,
    PLANT.NOM_ARCHIVO AS NOM_ARCHIVO,
    PLANT.COD_INTERNO AS COD_INTERNO,
    TIDO.COD_TIPO_DOCUMENTO AS COD_TIPO_DOCUMENTO    ,
    MOPL.ID_MOTIVO_PLANTILLA AS ID_MOTIVO_PLANTILLA
  FROM T_SCOB_PLANTILLA PLANT
  INNER JOIN T_SCOB_TIPO_DOCUMENTO TIDO
        ON TIDO.ID_TIPO_DOCUMENTO = PLANT.ID_TIPO_DOCUMENTO
  INNER JOIN T_SCOB_MOTIVO_PLANTILLA MOPL
       ON MOPL.ID_PLANTILLA = PLANT.ID_PLANTILLA
       AND MOPL.ID_MOTIVO = 0 --SIN MOTIVO ASIGNADO
       AND MOPL.ID_EST_EXP_COB = 0 --SIN ESTADO ASIGNADO
  LEFT JOIN T_SCOB_TABLA_DET TIPP
        ON TIPP.ID_TABLA = SCOB_PK_CONSTANTES.C_TBL_TIPO_PLANTILLA
        AND TIPP.COD_INTERNO = PLANT.COD_TIPO_PLANTILLA
  WHERE
  (PI_I_COD_TIPO_PLANTILLA = 0 OR (PI_I_COD_TIPO_PLANTILLA <> 0 AND COD_TIPO_PLANTILLA = PI_I_COD_TIPO_PLANTILLA))
  AND PLANT.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
  AND (PI_I_COD_SUBTIPO_DOCUMENTO = 0 OR (PI_I_COD_SUBTIPO_DOCUMENTO<>0 AND TIDO.COD_SUBTIPO_DOCUMENTO = PI_I_COD_SUBTIPO_DOCUMENTO))
  AND ( (PI_I_COD_TIPO_DOCUMENTO=0) OR
    (PI_I_COD_TIPO_DOCUMENTO <= CAST(TIDO.COD_TIPO_DOCUMENTO AS INTEGER)
    AND CAST(TIDO.COD_TIPO_DOCUMENTO AS INTEGER) <= PI_I_COD_TIPO_DOCUMENTO_FIN)
    )
  --AND (NVL(PI_I_COD_TIPO_DOCUMENTO,' ')=' ' OR (NVL(PI_I_COD_TIPO_DOCUMENTO,' ')<>' ' AND UPPER(TIDO.COD_TIPO_DOCUMENTO)=UPPER(PI_V_COD_TIPO_DOCUMENTO)))
  AND fun_scob_nosensite(TRIM(PLANT.DESCRIPCION)) LIKE '%' || fun_scob_nosensite(TRIM(PI_V_DESCRIPCION))  || '%'
  ORDER BY ID_PLANTILLA
  ;

end;

procedure SCOB_SP_S_DATA_INTERFAZ_MAT_OR
(
  PI_N_ID_ORGANO_RESOLUTIVO   IN T_SCOB_ORG_RESOL_MATERIA.ID_ORGANO_RESOLUTIVO%TYPE,
  PI_N_ID_MATERIA             IN T_SCOB_ORG_RESOL_MATERIA.ID_MATERIA%TYPE,
  po_cu_retorno               out cu_rec_set
)
as
begin

  open  po_cu_retorno for
  SELECT
    NVL(ORMA.NU_ID_AREA,0) AS ID_AREA,
    NVL(ORMA.NU_ID_LUGAR,0) AS ID_LUGAR
  FROM T_SCOB_ORG_RESOL_MATERIA ORMA
  WHERE ORMA.ID_ORGANO_RESOLUTIVO = PI_N_ID_ORGANO_RESOLUTIVO
  AND ORMA.ID_MATERIA = PI_N_ID_MATERIA
  AND ORMA.ESTADO = '1';

end;

procedure SCOB_SP_U_FLG_EXTRANET
(
  PI_N_ID_MOTIVO                IN t_scob_est_exp_cob_motivo.id_motivo%TYPE,
  PI_C_FLG_EXTRANET             IN t_scob_est_exp_cob_motivo.flg_extranet%TYPE,
  PI_V_AUDUSUMODIFICACION       IN t_scob_est_exp_cob_motivo.audusumodificacion%TYPE,
  PI_C_FLG_EXTRANET_CONSULTA  IN T_SCOB_EST_EXP_COB_MOTIVO.FLG_EXTRANET_CONSULTA%TYPE,
  po_n_retorno                  out number,
  po_n_cod_error                out number,
  po_v_msj_error                out varchar2
)
as

begin
  po_v_msj_error :='';
  po_n_retorno := 0;

  UPDATE t_scob_est_exp_cob_motivo
  SET
      FLG_EXTRANET = PI_C_FLG_EXTRANET,
      FLG_EXTRANET_CONSULTA = NVL(PI_C_FLG_EXTRANET_CONSULTA,'0'),
      AUDFECMODIFICACION = SYSDATE,
      AUDUSUMODIFICACION = PI_V_AUDUSUMODIFICACION
  WHERE ID_MOTIVO = PI_N_ID_MOTIVO;

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


procedure SCOB_SP_U_FLG_EXT_CONS_MULTCOB
(
  PI_N_ID_MOTIVO                IN t_scob_est_mul_cob_motivo.id_motivo%TYPE,
  PI_C_FLG_EXTRANET_CONSULTA    IN t_scob_est_mul_cob_motivo.FLG_EXTRANET_CONSULTA%TYPE,
  PI_V_AUDUSUMODIFICACION       IN t_scob_est_mul_cob_motivo.audusumodificacion%TYPE,
  po_n_retorno                  out number,
  po_n_cod_error                out number,
  po_v_msj_error                out varchar2
)
as

begin
  po_v_msj_error :='';
  po_n_retorno := 0;

  UPDATE t_scob_est_mul_cob_motivo
  SET
      FLG_EXTRANET_CONSULTA = NVL(PI_C_FLG_EXTRANET_CONSULTA,'0')
      ,AUDFECMODIFICACION = SYSDATE
      ,AUDUSUMODIFICACION = PI_V_AUDUSUMODIFICACION
  WHERE ID_MOTIVO = PI_N_ID_MOTIVO;

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

PROCEDURE SCOB_SP_S_PARAM_NOTIF_SICOB
( /*2013.04.12:Permite consultar los parametros de las notificaciones del SICOB*/
  po_cu_retorno                 OUT cu_rec_set
)
IS
BEGIN

  OPEN po_cu_retorno FOR
  SELECT
      NOTI.ID_NOTIFICACION AS ID_NOTIFICACION,
      NOTI.COD_FASE AS COD_FASE,
      NOTI.COD_PROCESO AS COD_PROCESO,
      NOTI.DES_ESCENARIO AS DES_ESCENARIO,
      NOTI.DES_INSTANCIA AS DES_INSTANCIA,
      NOTI.NRO_NOTIFICACION AS NRO_NOTIFICACION,
      NOTI.DES_NOTIFICACION AS DES_NOTIFICACION,
      NOTI.CAN_DIAS_ENVIO AS CAN_DIAS_ENVIO,
      REPLACE(NOTI.DES_NOTIFICACION_DET,'[IND_DIA]',DECODE(NOTI.IND_DIAS_HABILES_ENVIO,'1','HABIL','CALENDARIO')) as DES_NOTIFICACION_DET,
      NOTI.CAN_DIAS_REENVIO AS CAN_DIAS_REENVIO,
      NOTIC.IND_CON_COPIA_JEFE AS IND_CON_COPIA_JEFE,
      NOTIC.ID_NOTIFICACION_CORREO AS ID_NOTIFICACION_CORREO,
      NOTI.IND_ACTIVO AS IND_ACTIVO,
      NOTI.IND_DIAS_HABILES_ENVIO AS IND_DIA_HABIL
  FROM T_SCOB_NOTIFICACION NOTI
  INNER JOIN T_SCOB_NOTIFICACION_CORREO NOTIC
        ON NOTIC.ID_NOTIFICACION = NOTI.ID_NOTIFICACION
        AND NOTIC.ESTADO = '1'
  WHERE NOTI.ESTADO = '1'
  ORDER BY NOTI.NRO_NOTIFICACION
  ;

END;

procedure SCOB_SP_U_PARAM_NOTIF_SICOB
( /*2013.04.12:Permite actualizar los parametros de las notificaciones del SICOB*/
  PI_V_CAD_ID_NOTIFICACION        IN VARCHAR2,
  PI_V_CAD_CAN_DIAS_ENVIO         IN VARCHAR2,
  PI_V_CAD_CAN_DIAS_REENVIO       IN VARCHAR2,
  PI_V_AUDUSUMODIFICACION         IN VARCHAR2,
  PI_V_CAD_ACTIVO                 IN VARCHAR2,
  PI_V_CAD_DIA_HABIL              IN VARCHAR2,
  po_n_retorno                    out number,
  po_n_cod_error                  out number,
  po_v_msj_error                  out varchar2
)
as
  N_CONT                          INTEGER;
  V_ID_NOTIFICACION               VARCHAR2(10);
  V_CAN_DIAS_ENVIO                VARCHAR2(4);
  V_CAN_DIAS_REENVIO              VARCHAR2(4);
  V_IND_CON_COPIA_JEFE            VARCHAR2(4);
  V_IND_ACTIVO                    VARCHAR2(1);
  V_IND_DIA_HABIL                 VARCHAR2(1);
  N_NRO_ITEMS                     INTEGER;

begin
  po_v_msj_error :='';
  po_n_retorno := 0;
  N_NRO_ITEMS := 19; --19 notificaciones consideradas.

  --recorrer las cadenas
  N_CONT := 1;
  WHILE (N_CONT <= N_NRO_ITEMS)
  LOOP
    SCOB_PK_UTILITARIO.SCOB_SP_S_SPLIT(PI_V_CAD_ID_NOTIFICACION,'|', N_CONT+1, V_ID_NOTIFICACION);
    SCOB_PK_UTILITARIO.SCOB_SP_S_SPLIT(PI_V_CAD_CAN_DIAS_ENVIO,'|', N_CONT+1, V_CAN_DIAS_ENVIO);
    SCOB_PK_UTILITARIO.SCOB_SP_S_SPLIT(PI_V_CAD_CAN_DIAS_REENVIO,'|', N_CONT+1, V_CAN_DIAS_REENVIO);
    SCOB_PK_UTILITARIO.SCOB_SP_S_SPLIT(PI_V_CAD_ACTIVO,'|', N_CONT+1, V_IND_ACTIVO);
    SCOB_PK_UTILITARIO.SCOB_SP_S_SPLIT(PI_V_CAD_DIA_HABIL,'|', N_CONT+1, V_IND_DIA_HABIL);

    IF V_ID_NOTIFICACION='#' THEN
      EXIT;
    END IF;

    --actualizar el registro
    UPDATE T_SCOB_NOTIFICACION
    SET
      CAN_DIAS_ENVIO = TO_NUMBER(V_CAN_DIAS_ENVIO),
      CAN_DIAS_REENVIO = TO_NUMBER(V_CAN_DIAS_REENVIO),
      IND_ACTIVO = V_IND_ACTIVO,
      IND_DIAS_HABILES_ENVIO = V_IND_DIA_HABIL,
      AUDFECMODIFICACION = SYSDATE,
      AUDUSUMODIFICACION = PI_V_AUDUSUMODIFICACION
    WHERE ID_NOTIFICACION = TO_NUMBER(V_ID_NOTIFICACION);

   N_CONT := N_CONT + 1;
  END LOOP;

  COMMIT;
  po_n_cod_error := 0;
  po_n_retorno := 1;

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

PROCEDURE SCOB_SP_S_CORREO_NOTIF_SICOB
( /*2013.04.12:Permite consultar el contenido del correo de las notificaciones del SICOB*/
  PI_N_ID_NOTIFICACION_CORREO    IN T_SCOB_NOTIFICACION_CORREO.ID_NOTIFICACION_CORREO%TYPE,
  po_cu_retorno                  OUT cu_rec_set
)
IS
BEGIN

  OPEN po_cu_retorno FOR
  SELECT
    NOTIC.NOM_ASUNTO AS NOM_ASUNTO,
    NOTIC.DES_CONTENIDO AS DES_CONTENIDO,
    NOTIC.IND_CON_COPIA_JEFE AS IND_CC_JEFE,
    NOTIC.DES_CORREO_CC AS DES_CORREO_CC
  FROM T_SCOB_NOTIFICACION_CORREO NOTIC
  WHERE NOTIC.ID_NOTIFICACION_CORREO = PI_N_ID_NOTIFICACION_CORREO;

END;

procedure SCOB_SP_U_CORREO_NOTIF_SICOB
( /*2013.04.12:Permite actualizar el contenido del correo de las notificaciones del SICOB*/
  PI_N_ID_NOTIFICACION_CORREO     IN T_SCOB_NOTIFICACION_CORREO.ID_NOTIFICACION_CORREO%TYPE,
  PI_V_NOM_ASUNTO                 IN T_SCOB_NOTIFICACION_CORREO.NOM_ASUNTO%TYPE,
  PI_V_DES_CONTENIDO              IN T_SCOB_NOTIFICACION_CORREO.DES_CONTENIDO%TYPE,
  PI_C_IND_CC_JEFE                IN T_SCOB_NOTIFICACION_CORREO.IND_CON_COPIA_JEFE%TYPE,
  PI_V_DES_CORREO_CC              IN T_SCOB_NOTIFICACION_CORREO.DES_CORREO_CC%TYPE,
  PI_V_AUDUSUMODIFICACION         IN T_SCOB_NOTIFICACION_CORREO.AUDUSUMODIFICACION%TYPE,
  po_n_retorno                    out number,
  po_n_cod_error                  out number,
  po_v_msj_error                  out varchar2
)
as
begin
  po_v_msj_error :='';
  po_n_retorno := 0;

  UPDATE T_SCOB_NOTIFICACION_CORREO
  SET
    NOM_ASUNTO = PI_V_NOM_ASUNTO,
    DES_CONTENIDO = PI_V_DES_CONTENIDO,
    IND_CON_COPIA_JEFE = PI_C_IND_CC_JEFE,
    DES_CORREO_CC = PI_V_DES_CORREO_CC,
    AUDFECMODIFICACION = SYSDATE,
    AUDUSUMODIFICACION = PI_V_AUDUSUMODIFICACION
  WHERE ID_NOTIFICACION_CORREO = PI_N_ID_NOTIFICACION_CORREO;

  COMMIT;
  po_n_cod_error := 0;
  po_n_retorno := PI_N_ID_NOTIFICACION_CORREO;

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

procedure SCOB_SP_I_LOG_NOTIFICACION
( /*2013.04.12:Permite registrar el log de las notificaciones del SICOB*/
  PI_N_ID_MULTA                  IN T_SCOB_LOG_NOTIFICACION.ID_MULTA%TYPE,
  PI_N_ID_NOTIFICACION           IN T_SCOB_LOG_NOTIFICACION.ID_NOTIFICACION%TYPE,
  PI_C_COD_TIPO_ENVIO            IN T_SCOB_LOG_NOTIFICACION.COD_TIPO_ENVIO%TYPE,
  PI_N_ID_USUARIO                IN T_SCOB_LOG_NOTIFICACION.ID_USUARIO%TYPE,
  PI_N_ID_ORGANO_RESOLUTIVO      IN T_SCOB_LOG_NOTIFICACION.ID_ORGANO_RESOLUTIVO%TYPE,
  PI_N_ID_ORGANO_RESOLUTIVO_SUP  IN T_SCOB_LOG_NOTIFICACION.ID_ORGANO_RESOLUTIVO_SUP%TYPE,
  PI_N_CANT_ENVIOS               IN T_SCOB_LOG_NOTIFICACION.CANT_ENVIOS%TYPE,
  PI_C_IND_PROCESADO             IN T_SCOB_LOG_NOTIFICACION.IND_PROCESADO%TYPE,
  PI_V_AUDUSUCREACION            IN T_SCOB_LOG_NOTIFICACION.AUDUSUCREACION%TYPE,
  po_n_retorno                   out number,
  po_n_cod_error                 out number,
  po_v_msj_error                 out varchar2
)
as
  N_ID_LOG_NOTIFICACION          T_SCOB_LOG_NOTIFICACION.ID_LOG_NOTIFICACION%TYPE;

begin
  po_v_msj_error :='';
  po_n_retorno := 0;

  SELECT SCOB_SQ_LOG_NOTIFICACION.NEXTVAL INTO N_ID_LOG_NOTIFICACION FROM DUAL;

  INSERT INTO T_SCOB_LOG_NOTIFICACION(
      ID_LOG_NOTIFICACION,
      ID_MULTA,
      ID_NOTIFICACION,
      COD_TIPO_ENVIO,

      ID_USUARIO,
      ID_ORGANO_RESOLUTIVO,
      ID_ORGANO_RESOLUTIVO_SUP,

      FEC_ENVIO,
      CANT_ENVIOS,
      IND_PROCESADO,

      ESTADO,
      AUDFECCREACION,
      AUDUSUCREACION )
  VALUES(
      N_ID_LOG_NOTIFICACION,
      PI_N_ID_MULTA,
      PI_N_ID_NOTIFICACION,
      PI_C_COD_TIPO_ENVIO,

      PI_N_ID_USUARIO,
      PI_N_ID_ORGANO_RESOLUTIVO,
      PI_N_ID_ORGANO_RESOLUTIVO_SUP,

      SYSDATE,
      PI_N_CANT_ENVIOS,
      PI_C_IND_PROCESADO,

      '1',
      SYSDATE,
      PI_V_AUDUSUCREACION );

  po_n_cod_error := 0;
  po_n_retorno := N_ID_LOG_NOTIFICACION;

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

procedure SCOB_SP_I_LOG_NOTIFICACION_DET
( /*2013.04.12:Permite registrar el log (detallado) de las notificaciones del SICOB*/
  PI_N_ID_LOG_NOTIFICACION       IN T_SCOB_LOG_NOTIFICACION_DET.ID_LOG_NOTIFICACION%TYPE,
  PI_N_ID_USUARIO                IN T_SCOB_LOG_NOTIFICACION_DET.ID_USUARIO%TYPE,
  PI_N_ID_ORGANO_RESOLUTIVO      IN T_SCOB_LOG_NOTIFICACION_DET.ID_ORGANO_RESOLUTIVO%TYPE,
  PI_N_ID_ORGANO_RESOLUTIVO_SUP  IN T_SCOB_LOG_NOTIFICACION_DET.ID_ORGANO_RESOLUTIVO_SUP%TYPE,
  PI_V_CAD_COD_ID_USUARIO_SECTEC IN T_SCOB_LOG_NOTIFICACION_DET.COD_ID_USUARIO_SECTEC%TYPE,
  PI_I_COD_EST_ENVIO_CORREO      IN T_SCOB_LOG_NOTIFICACION_DET.COD_ESTADO_ENVIADO%TYPE,
  PI_V_AUDUSUCREACION            IN T_SCOB_LOG_NOTIFICACION_DET.AUDUSUCREACION%TYPE,
  PI_V_NOM_USUARIO_GEN           IN VARCHAR2,
  PI_V_NRO_RESOL                 IN VARCHAR2,
  PI_V_NRO_EXPED_ANTIGUO         IN VARCHAR2,
  PI_V_NRO_CUM                   IN VARCHAR2,
  PI_V_FEC_GEN_CUM               IN VARCHAR2,
  PI_V_FEC_GEN_INSTANCIA         IN VARCHAR2,
  PI_V_ID_EJECUCION              IN VARCHAR2,
  PI_V_LOGIN_USUARIO             IN VARCHAR2,
  po_n_retorno                   out number,
  po_n_cod_error                 out number,
  po_v_msj_error                 out varchar2
)
as
  N_ID_LOG_NOTIFICACION_DET          T_SCOB_LOG_NOTIFICACION_DET.ID_LOG_NOTIFICACION_DET%TYPE;

begin
  po_v_msj_error :='';
  po_n_retorno := 0;

  SELECT SCOB_SQ_LOG_NOTIFICACION_DET.NEXTVAL INTO N_ID_LOG_NOTIFICACION_DET FROM DUAL;

  INSERT INTO T_SCOB_LOG_NOTIFICACION_DET(
      ID_LOG_NOTIFICACION_DET,
      ID_LOG_NOTIFICACION,
      ID_USUARIO,
      ID_ORGANO_RESOLUTIVO,
      ID_ORGANO_RESOLUTIVO_SUP,
      FEC_ENVIO,
      COD_ID_USUARIO_SECTEC,
      COD_ESTADO_ENVIADO,
      ESTADO,
      AUDFECCREACION,
      AUDUSUCREACION,
      --
      NOM_USU_GEN,
      NRO_RESOL,
      NRO_EXPED_ANTIGUO,
      NRO_CUM,
      FEC_GENERACION_CUM,
      FEC_GENERACION_INSTANCIA,
      LOGIN_USUARIO,
      ID_EJECUCION
      )
  VALUES(
      N_ID_LOG_NOTIFICACION_DET,
      PI_N_ID_LOG_NOTIFICACION,
      PI_N_ID_USUARIO,
      PI_N_ID_ORGANO_RESOLUTIVO,
      PI_N_ID_ORGANO_RESOLUTIVO_SUP,
      SYSDATE,
      PI_V_CAD_COD_ID_USUARIO_SECTEC,
      PI_I_COD_EST_ENVIO_CORREO,
      '1',
      SYSDATE,
      PI_V_AUDUSUCREACION,
      ---
      PI_V_NOM_USUARIO_GEN,
      PI_V_NRO_RESOL,
      PI_V_NRO_EXPED_ANTIGUO,
      PI_V_NRO_CUM,
      PI_V_FEC_GEN_CUM,
      PI_V_FEC_GEN_INSTANCIA,
      PI_V_LOGIN_USUARIO,
      PI_V_ID_EJECUCION
      );

  po_n_cod_error := 0;
  po_n_retorno := N_ID_LOG_NOTIFICACION_DET;

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

FUNCTION SCOB_FN_DIA_CORREO(
   PI_I_NRO_CORREO                IN T_SCOB_NOTIFICACION.NRO_NOTIFICACION%TYPE,
   PI_C_IND_TIPO_ENVIO            IN CHAR
) RETURN  INTEGER
IS
  I_NRO_DIAS                      INTEGER;

BEGIN
  SELECT
  CASE PI_C_IND_TIPO_ENVIO
       WHEN '1' THEN NOTIFC.CAN_DIAS_ENVIO --RETORNA EL ENVIO INICIAL
       WHEN '2' THEN NOTIFC.CAN_DIAS_REENVIO --RETORNA EL REENVIO
       ELSE -1
  END AS I_NRO_DIAS
  INTO I_NRO_DIAS
  FROM T_SCOB_NOTIFICACION NOTIFC
  WHERE NOTIFC.NRO_NOTIFICACION = PI_I_NRO_CORREO
  ;
  RETURN I_NRO_DIAS;
END;

procedure SCOB_SP_I_EJEC_ENV_NOTIF
( /*2013.04.12:Permite registrar el log de la ejecucion del JOB Notificaciones del SICOB*/
  PI_V_ID_EJECUCION              IN T_SCOB_TMP_EJEC_ENV_NOTIF.ID_EJECUCION%TYPE,
  PI_V_DET_EJECUCION             IN T_SCOB_TMP_EJEC_ENV_NOTIF.DET_EJECUCION%TYPE,
  PI_V_USU_CREACION              IN T_SCOB_TMP_EJEC_ENV_NOTIF.AUDUSUCREACION%TYPE,
  PI_C_TIPO_EJECUCION            IN T_SCOB_TMP_EJEC_ENV_NOTIF.TIPO_EJECUCION%TYPE,
  po_n_retorno                   out number
)
as
  N_ID_TABLA                     T_SCOB_TMP_EJEC_ENV_NOTIF.ID_TABLA%TYPE;
  n_cod_error                    NUMBER;
begin
  po_n_retorno := 0;

  SELECT SCOB_SQ_TMP_EJEC_ENV_NOTIF.NEXTVAL INTO N_ID_TABLA FROM DUAL;

  INSERT INTO T_SCOB_TMP_EJEC_ENV_NOTIF(
    ID_TABLA,
    ID_EJECUCION,
    DET_EJECUCION,
    AUDFECCREACION,
    AUDUSUCREACION,
    TIPO_EJECUCION)
  VALUES(
    N_ID_TABLA,
    PI_V_ID_EJECUCION,
    PI_V_DET_EJECUCION,
    SYSDATE,
    PI_V_USU_CREACION,
    PI_C_TIPO_EJECUCION);

  po_n_retorno := N_ID_TABLA;

exception
  when others then
  po_n_retorno := -1;
  n_cod_error := sqlcode;
  select case when n_cod_error > 0 then n_cod_error * -1 else n_cod_error end
  into n_cod_error
  from dual;
  --po_v_msj_error := substr(sqlerrm,1,250);
  rollback;
end;

PROCEDURE SCOB_SP_S_TEXTO_NOTIFICACIONES
( /*2013.04.15:Permite consultar el TEXTO del correo de las notificaciones del SICOB*/
  po_cu_retorno                  OUT cu_rec_set
)
IS
BEGIN

  OPEN po_cu_retorno FOR
  SELECT
  NOTI.ID_NOTIFICACION AS ID_NOTIFICACION,
  NOTI.NRO_NOTIFICACION AS NRO_NOTIFICACION,
  LPAD(TO_CHAR(NOTI.NRO_NOTIFICACION),2,'00') || ' - ' ||
  NOTI.DES_NOTIFICACION || ' ' || TO_CHAR(NOTI.CAN_DIAS_ENVIO) || ' ' ||
  REPLACE(REPLACE(NOTI.DES_NOTIFICACION_DET,'[IND_DIA]',DECODE(NOTI.IND_DIAS_HABILES_ENVIO,'1','HABIL','CALENDARIO')),'<br>',' ')
  AS TEXTO_CORREO
  FROM T_SCOB_NOTIFICACION NOTI
  WHERE NOTI.ESTADO = '1'
  ORDER BY NOTI.NRO_NOTIFICACION;

END;


FUNCTION SCOB_FN_CORREOS_SEC_TEC(
  PI_N_ID_ORGANO_RESOLUTIVO IN NUMBER
) RETURN  VARCHAR2
IS
  I_NRO_DIAS                      INTEGER;
  V_USUARIO                       VARCHAR2(200);
  V_CAD_USUARIO                   VARCHAR2(4000);
  CUR_USUARIO                     cu_rec_set;
BEGIN
    V_CAD_USUARIO := NULL;

    OPEN CUR_USUARIO FOR
    select u.usuario
    from t_scob_usuario_or uor
    inner join t_scob_perfil_usuario pu
          on pu.id_usuario = uor.id_usuario
          and pu.estado = '1'
          and pu.id_perfil = SCOB_PK_CONSTANTES.C_COD_PERFIL_SEC_TECNICO
    inner join t_scob_usuario u
          on u.id_usuario = uor.id_usuario
    where uor.estado = '1'
    and uor.id_organo_resolutivo = PI_N_ID_ORGANO_RESOLUTIVO
    ORDER BY u.usuario;

    LOOP
    FETCH CUR_USUARIO INTO V_USUARIO;
    EXIT WHEN CUR_USUARIO%NOTFOUND;

         IF V_CAD_USUARIO IS NULL THEN
            V_CAD_USUARIO := V_USUARIO || SCOB_PK_CONSTANTES.C_DOMINIO_CORREO;
         ELSE
            V_CAD_USUARIO := V_CAD_USUARIO || ', ' || V_USUARIO || SCOB_PK_CONSTANTES.C_DOMINIO_CORREO;
         END IF;
    END LOOP;
    CLOSE CUR_USUARIO;

    RETURN V_CAD_USUARIO;
END;

/* José Aguilar [05/12/2022]*/
PROCEDURE SCOB_SP_S_LISTA_UIT(POUT_CUR_RETORNO OUT CU_REC_SET) AS
BEGIN

  OPEN POUT_CUR_RETORNO FOR
    SELECT T.ID_UIT, T.DESCRIPCION, T.MONTO_UIT
      FROM USR_SICOB.T_SCOB_UIT T
     WHERE T.ESTADO = '1'
     ORDER BY T.ID_UIT DESC;

END;
--
end SCOB_PK_ADM_MANTENIMIENTO;
/
