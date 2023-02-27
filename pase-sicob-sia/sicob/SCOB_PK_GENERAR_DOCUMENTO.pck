CREATE OR REPLACE PACKAGE SCOB_PK_GENERAR_DOCUMENTO IS

    -- Author  : ADMIN
    -- Created : 17/03/2011 15:00:13 p.m.
    -- Purpose :

    TYPE CU_REC_SET IS REF CURSOR;
    TYPE REC_ETIQ_DOC IS RECORD(
        ID_EXPEDIENTE_DOCUMENTO     VARCHAR2(4000),
        ID_MULTA                    VARCHAR2(4000),
        NOM_ARCH_PLANTILLA          VARCHAR2(4000),
        NOM_ARCH_A_GENERAR          VARCHAR2(4000),
        COD_SUBTIPO_DOCUMENTO       VARCHAR2(4000),
        FEC_GENERACION_DOC          VARCHAR2(4000),
        FEC_GENERACION_DOC_COMPLETO VARCHAR2(4000), -- NUEVO
        NRO_DOCUMENTO               VARCHAR2(4000),
        NRO_RESOLUCION_DOC          VARCHAR2(4000),
        SIGLA_AEC                   VARCHAR2(4000),
        IMPORTE_UIT                 VARCHAR2(4000),
        -- 1
        NOM_SANCIONADO_TODOS     VARCHAR2(4000),
        DES_TIPO_DOC_SANC_TODOS  VARCHAR2(4000),
        NRO_DOC_SANC_TODOS       VARCHAR2(4000),
        NOM_SANCIONADO           VARCHAR2(4000),
        TIPO_DOC_SANC_PRINCIPAL  VARCHAR2(4000),
        NRO_DOC_SANC_PRINCIPAL   VARCHAR2(4000),
        NOM_CARGO_JEFE_AEC       VARCHAR2(4000),
        NOM_SECRETARIO_TEC       VARCHAR2(4000),
        NOM_CARGO_SECRETARIO_TEC VARCHAR2(4000),
        NOM_OR_MULTA             VARCHAR2(4000),
        -- 2
        NOM_JEFE_AEC              VARCHAR2(4000),
        NRO_FILE                  VARCHAR2(4000),
        SIGLA_NOM_JEFE_AEC        VARCHAR2(4000),
        NRO_CUM                   VARCHAR2(4000),
        NRO_SEC                   VARCHAR2(4000),
        NRO_RESOLUCION_OR         VARCHAR2(4000),
        NRO_EXPED_ADMIN_MULTA     VARCHAR2(4000),
        SIGLA_NOM_USUARIO_GEN_DOC VARCHAR2(4000),
        AEC_ANEXO_TELEFONO        VARCHAR2(4000),
        AEC_NOMBRE                VARCHAR2(4000),
        -- 3
        AEC_TELEFONO            VARCHAR2(4000),
        NRO_EXPED_ANTIGUO_MULTA VARCHAR2(4000),
        VALOR_UIT               VARCHAR2(4000),
        NRO_EXPEDIENTE          VARCHAR2(4000),
        NOM_SANCIONADO_DOC      VARCHAR2(4000),
        NRO_DOC_IDENTIDAD       VARCHAR2(4000),
        TIPO_DOC_IDENTIDAD      VARCHAR2(4000),
        DOMICILIO_SANCIONADO    VARCHAR2(4000),
        DOMICILIO_FISCAL        VARCHAR2(4000),
        DOMICILIO_PROCESAL      VARCHAR2(4000),
        -- 4
        MONTO_CAPITAL       VARCHAR2(4000),
        MONTO_IC            VARCHAR2(4000),
        MONTO_IM            VARCHAR2(4000),
        MONTO_COSTAS        VARCHAR2(4000),
        MONTO_TOTAL         VARCHAR2(4000),
        MONTO_AMORT_CAPITAL VARCHAR2(4000),
        SALDO_CAPITAL       VARCHAR2(4000),
        SALDO_IC            VARCHAR2(4000),
        SALDO_IM            VARCHAR2(4000),
        SALDO_COSTAS        VARCHAR2(4000),
        -- 5
        SALDO_TOTAL             VARCHAR2(4000),
        COSTAS_PROYECTADAS      VARCHAR2(4000),
        NRO_CARTA_FIANZA        VARCHAR2(4000),
        NOM_BANCO               VARCHAR2(4000),
        DIRECCION_BANCO         VARCHAR2(4000),
        MONTO_SOLES_RETENCION   VARCHAR2(4000),
        MONTO_USD_RETENCION     VARCHAR2(4000),
        NOM_BANCO_RETENEDOR     VARCHAR2(4000),
        FEC_RECEPCION_SOLICITUD VARCHAR2(4000),
        TOTAL_REQUERIDO         VARCHAR2(4000),
        -- 6
        NRO_CUOTAS_FRACCIONAR     VARCHAR2(4000),
        MONTO_FRACCIONAR          VARCHAR2(4000),
        TOTAL_EMBARGO             VARCHAR2(4000),
        DIRECCION_BANCO_RETENEDOR VARCHAR2(4000),
        TOTAL_REDUCIR             VARCHAR2(4000),
        NRO_DOC_REC               VARCHAR2(4000),
        FEC_RETENCION_INDECOPI    VARCHAR2(4000),
        MONTO_INFORMADO_SOLES     VARCHAR2(4000),
        MONTO_INFORMADO_DOLARES   VARCHAR2(4000),
        ID_EXPEDIENTE             VARCHAR2(4000),
        -- 7
        NU_NRO_NOTIFICACION          VARCHAR2(4000),
        NRO_OFICIO_SUNAT_CODIGO      VARCHAR2(4000),
        NRO_OFICIO_SUNAT_ANIO        VARCHAR2(4000),
        NRO_OFICIO_SUNAT_PREFIJO     VARCHAR2(4000),
        NRO_OFICIO_SUNAT_CORRELATIVO VARCHAR2(4000),
        NRO_LIQUIDACION_CODIGO       VARCHAR2(4000),
        NRO_LIQUIDACION_ANIO         VARCHAR2(4000),
        NRO_LIQUIDACION_CORRELATIVO  VARCHAR2(4000),
        NRO_DUA_CODIGO               VARCHAR2(4000),
        NRO_DUA_ANIO                 VARCHAR2(4000),
        -- 8
        NRO_DUA_CORRELATIVO VARCHAR2(4000),
        TIPO_CAMBIO         VARCHAR2(4000),
        MONTO_ANTIDUMPING   VARCHAR2(4000),
        DESC_PARTIDA        VARCHAR2(4000),
        DESC_INTENDENCIA    VARCHAR2(4000),
        DESC_SUBMATERIA     VARCHAR2(4000),
        FEC_RESOLUCION      VARCHAR2(4000),
        FEC_NOTIFICACION    VARCHAR2(4000),
        NOM_SEDE            VARCHAR2(4000),
        CUM_DESACUM         VARCHAR2(4000),
        -- 9
        EXP_DESACUM VARCHAR2(4000)
        /*VALOR_UIT         NUMBER,
                    IMPORTE_UIT       NUMBER,
                    SALDO_CAPITAL     NUMBER,
                    SALDO_COSTAS      NUMBER,
                    SALDO_TOTAL_DEUDA NUMBER*/);

    ----
    PROCEDURE SCOB_SP_I_EXPEDIENTE_DOCUMENTO
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 20/04/2011
        -- Proposito    : insertar los documentos plantillas generados por el sistema
                          para los casos de pre-coactivo, coactivo, cancelado.
        -----------------------------------------------------------
        -- Modificacion : 13/05/2011
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_I_COD_TIPO_ASOCIACION IN T_SCOB_EXPED_COACTIVO_DOC.COD_TIPO_ASOCIACION%TYPE,
     /*
                                                       1=Cobranza Precoactiva
                                                       2=Cobranza Coactiva
                                                       3=Concluir Cancelar
                                                       4=Sobreseer
                                                    */
     PI_C_IND_TIPO_GENERACION T_SCOB_EXPED_COACTIVO_DOC.IND_TIPO_GENERACION%TYPE,
     PI_V_ID_EXPEDIENTE       IN VARCHAR2, --CADENA DE EXPEDIENTES
     PI_N_NRO_ITEMS           IN NUMBER,
     --
     PI_N_ID_MOTIVO        IN T_SCOB_EXPEDIENTE_ESTADO.ID_MOTIVO%TYPE,
     PI_V_ID_PLANTILLA     IN VARCHAR2, --CADENA DE PLANTILLAS (EL PRIMERO SIEMPRE DEBE SER LA RESOLUCION, SI ES EL CASO)
     PI_V_MOTIVO_PLANTILLA IN VARCHAR2, --CADENA DE MOTIVOS PLANTILLAS (EL PRIMERO SIEMPRE DEBE SER LA RESOLUCION, SI ES EL CASO)
     PI_N_NRO_ITEMSP       IN NUMBER, --SI SE ENVIAN DOS DOCUMENTO, SIEMPRE DEBE ESTAR LA REC PRIMERO.
     --
     PI_V_ID_COSTAS        IN VARCHAR2,
     PI_V_POR_COSTAS       IN VARCHAR2,
     PI_V_VAL_COSTAS       IN VARCHAR2,
     PI_V_CNT_COSTAS       IN VARCHAR2,
     PI_V_SUB_TOTAL_COSTAS IN VARCHAR2,
     PI_N_TOTAL_COSTAS     IN T_SCOB_EXPEDIENTE_DOCUMENTO.MONTO_COSTA%TYPE,
     PI_N_NRO_ITEMSC       IN INTEGER,
     -------------------------
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
     PO_N_RETORNO            OUT NUMBER,
     PO_N_COD_ERROR          OUT NUMBER,
     PO_V_MSJ_ERROR          OUT VARCHAR2);

    PROCEDURE SCOB_SP_I_GEN_DOCS_BY_SUSPEN
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 14/05/2011
        -- Proposito    : insertar los documentos plantillas generados por el sistema por una solicitud de suspension
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_N_ID_EXPEDIENTE IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
     --
     PI_C_FLG_OFICIO         IN T_SCOB_EXPED_SUSPENDER.FLG_OFICIO%TYPE,
     PI_N_ID_SOLIC_SUSPENDER IN T_SCOB_EXPED_SUSPENDER.ID_EXPED_SUSPENDER%TYPE,
     --  PI_N_ID_GARANTIA                        IN NUMBER, --T_SCOB_GARANTIA.ID_GARANTIA%TYPE,
     PI_N_NU_ID_EMPRESA      IN NUMBER,
     PI_N_VC_ANIO_CARTA      IN NUMBER,
     PI_N_NU_ID_CARTA_FIANZA IN NUMBER,
     
     PI_I_COD_TIPO_ASOCIACION IN T_SCOB_EXPED_SUSPENDER_DOC.COD_TIPO_ASOCIACION%TYPE, --NUEVO
     /*
                                                    1 = SUSPENSION
                                                    2 = LEVANTE
                                                    */
     --
     PI_N_ID_MOTIVO        IN T_SCOB_EXPEDIENTE_ESTADO.ID_MOTIVO%TYPE,
     PI_V_ID_PLANTILLA     IN VARCHAR2, --CADENA DE PLANTILLAS (EL PRIMERO SIEMPRE DEBE SER LA RESOLUCION, SI ES EL CASO)
     PI_V_MOTIVO_PLANTILLA IN VARCHAR2, --CADENA DE MOTIVOS PLANTILLAS (EL PRIMERO SIEMPRE DEBE SER LA RESOLUCION, SI ES EL CASO)
     PI_N_NRO_ITEMSP       IN NUMBER, --SI SE ENVIAN DOS DOCUMENTO, SIEMPRE DEBE ESTAR LA REC PRIMERO.
     --
     PI_V_TIPO_ENTIDAD    IN VARCHAR, --0=NINGUNO;1=PERSONA;2=BANCO;3=DIREC PERSONAS;4=SUNAT;5=PNP;6=SAT;7=CAJA METROPOLITANA
     PI_V_ID_TIPO_ENTIDAD IN VARCHAR, --entidades a quienes va dirigido
     PI_V_NRO_ITEMSTE     IN VARCHAR, --cadena con los numero de entidades a quienes ira dirigido
     --
     PI_I_ESTADO_SOLICITUD  IN T_SCOB_EXPED_SUSPENDER.ESTADO_SOLICITUD%TYPE, --solo enviar si cambia de estado, sino "0"
     PI_I_ESTADO_EXPEDIENTE IN T_SCOB_EXPEDIENTE.ESTADO_EXPEDIENTE%TYPE,
     --
     PI_N_ID_SERVICIO      IN NUMBER,
     PI_V_ID_TIPO_SERVICIO IN VARCHAR2,
     PI_C_FLG_UCI          IN CHAR,
     --
     PI_V_AUDUSUCREACION     IN T_SCOB_EXPEDIENTE_DOCUMENTO.AUDUSUCREACION%TYPE,
     PI_N_ID_USUARIO_INGRESO IN T_SCOB_USUARIO.ID_USUARIO%TYPE,
     PI_V_FEC_GENERACION_DOC IN VARCHAR,
     PO_N_RETORNO            OUT NUMBER,
     PO_N_RETORNO_DET        OUT NUMBER, --nvo ID SOLICITUD
     PO_N_COD_ERROR          OUT NUMBER,
     PO_V_MSJ_ERROR          OUT VARCHAR2);

    PROCEDURE SCOB_SP_I_GEN_DOCS_BY_FRACCION
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 16.05.2011
        -- Proposito    : insertar los documentos plantillas generados por el sistema por una solicitud de fraccionamiento
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   : 2023-02-14
        -- Proposito    : Procesos en linea
        -----------------------------------------------------------
        */
    (PI_N_ID_EXPEDIENTE IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
     --
     PI_N_ID_EXPED_FRACCIONAR IN T_SCOB_EXPED_FRACCIONAR.ID_EXPED_FRACCIONAR%TYPE,
     PI_I_COD_TIPO_ASOCIACION IN T_SCOB_EXPED_FRACCIONAR_DOC.COD_TIPO_ASOCIACION%TYPE,
     /*
                                                    1=Denegar
                                                    2=Generar Suspension
                                                    3=Aprobar Resolucion
                                                    4=Solicitar Garantia
                                                    5=Requerir Pago
                                                    6=A Perdida
                                                    7=Dejar Sin Efecto Fraccionamiento
                                                    8=Cancelar Fraccionamiento
                                                    */
     --  PI_N_ID_GARANTIA                        IN NUMBER, --T_SCOB_GARANTIA.ID_GARANTIA%TYPE,
     PI_N_NU_ID_EMPRESA      IN NUMBER,
     PI_N_VC_ANIO_CARTA      IN NUMBER,
     PI_N_NU_ID_CARTA_FIANZA IN NUMBER,
     
     --
     PI_N_ID_MOTIVO        IN T_SCOB_EXPEDIENTE_ESTADO.ID_MOTIVO%TYPE,
     PI_V_ID_PLANTILLA     IN VARCHAR2, --CADENA DE PLANTILLAS (EL PRIMERO SIEMPRE DEBE SER LA RESOLUCION, SI ES EL CASO)
     PI_V_MOTIVO_PLANTILLA IN VARCHAR2, --CADENA DE MOTIVOS PLANTILLAS (EL PRIMERO SIEMPRE DEBE SER LA RESOLUCION, SI ES EL CASO)
     PI_N_NRO_ITEMSP       IN NUMBER, --SI SE ENVIAN DOS DOCUMENTO, SIEMPRE DEBE ESTAR LA REC PRIMERO.
     --
     PI_V_TIPO_ENTIDAD    IN VARCHAR, --0=NINGUNO;1=PERSONA;2=BANCO;3=DIREC PERSONAS;4=SUNAT;5=PNP;6=SAT;7=CAJA METROPOLITANA
     PI_V_ID_TIPO_ENTIDAD IN VARCHAR, --entidades a quienes va dirigido
     PI_V_NRO_ITEMSTE     IN VARCHAR, --cadena con los numero de entidades a quienes ira dirigido
     --
     PI_I_ESTADO_SOLICITUD  IN T_SCOB_EXPED_FRACCIONAR.ESTADO_SOLICITUD%TYPE, --solo enviar si cambia de estado, sino "0"
     PI_I_ESTADO_EXPEDIENTE IN T_SCOB_EXPEDIENTE.ESTADO_EXPEDIENTE%TYPE,
     --
     PI_N_ID_SERVICIO      IN NUMBER,
     PI_V_ID_TIPO_SERVICIO IN VARCHAR2,
     PI_C_FLG_UCI          IN CHAR,
     --
     PI_V_AUDUSUCREACION     IN T_SCOB_EXPEDIENTE_DOCUMENTO.AUDUSUCREACION%TYPE,
     PI_N_ID_USUARIO_INGRESO IN T_SCOB_USUARIO.ID_USUARIO%TYPE,
     PI_V_FEC_GENERACION_DOC IN VARCHAR,
     PI_C_VALIDA_GARANTIA    IN CHAR,
     PO_N_RETORNO            OUT NUMBER,
     PO_N_COD_ERROR          OUT NUMBER,
     PO_V_MSJ_ERROR          OUT VARCHAR2);

    PROCEDURE SCOB_SP_I_GEN_DOCS_BY_EMBARGO
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 20.05.2011
        -- Proposito    : insertar los documentos plantillas generados por el sistema por un tipo de embargo
        -----------------------------------------------------------
        -- Modificacion : 01.07.2011; 09/04/2012;
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_N_ID_EXPEDIENTE         IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
     PI_N_ID_EXPEDIENTE_EMBARGO IN T_SCOB_EXPED_EMBARGO.ID_EXPEDIENTE_EMBARGO%TYPE,
     --SI EXISTE SE ENVIA, SINO = 0
     PI_I_COD_TIPO_EMBARGO         IN T_SCOB_EXPED_EMBARGO.COD_TIPO_EMBARGO%TYPE,
     PI_N_MONTO_COSTAS_PROYECTADAS IN T_SCOB_EXPED_EMBARGO.MONTO_COSTAS_PROYECTADAS%TYPE,
     PI_N_MONTO_EMBARGO            IN T_SCOB_EXPED_EMBARGO.MONTO_EMBARGO%TYPE,
     PI_I_COD_TIPO_INTERVENCION    IN T_SCOB_EXPED_EMBARGO.COD_TIPO_INTERVENCION%TYPE,
     PI_I_COD_TIPO_EMB_DEPOSITO    IN T_SCOB_EXPED_EMBARGO.COD_TIPO_DEPOSITO%TYPE, --nuevo
     --------------------------------------------------------------------------------------------------
     PI_I_COD_TIPO_ASOCIACION IN T_SCOB_EXPED_EMBARGO_DOC.COD_TIPO_ASOCIACION%TYPE,
     /*
                                                    --------
                                                    1=Resolucion Solicitud de Retencion (Retencion)
                                                    --------
                                                    2=Solicitud Requerir.
                                                    3=Solicitud Proceder.
                                                    4=Solicitud Requerir/Retener (
                                                                se incluye en este caso el tipo:
                                                                9=Solicitud Requerir/Proceder
                                                    )
                                                    --------
                                                    5=Resolucion Tazador (Inscripcion)
                                                    6=Resolucion Inscripcion (Inscripcion)
                                                    7=Resolucion Secuestro
                                                    8=Resolucion Intervencion
                                                    --------
                                                    */
     --------------------------------------------------------------------------------------------------
     --
     PI_V_ID_EMBARGO_INSCRIP_BIEN IN VARCHAR2,
     --
     PI_N_ID_MOTIVO        IN T_SCOB_EXPEDIENTE_ESTADO.ID_MOTIVO%TYPE,
     PI_V_ID_PLANTILLA     IN VARCHAR2, --CADENA DE PLANTILLAS (EL PRIMERO SIEMPRE DEBE SER LA RESOLUCION, SI ES EL CASO)
     PI_V_MOTIVO_PLANTILLA IN VARCHAR2, --CADENA DE MOTIVOS PLANTILLAS (EL PRIMERO SIEMPRE DEBE SER LA RESOLUCION, SI ES EL CASO)
     PI_N_NRO_ITEMSP       IN NUMBER, --SI SE ENVIAN DOS DOCUMENTO, SIEMPRE DEBE ESTAR LA REC PRIMERO.
     --
     PI_V_ID_COSTAS        IN VARCHAR2,
     PI_V_POR_COSTAS       IN VARCHAR2,
     PI_V_VAL_COSTAS       IN VARCHAR2,
     PI_V_CNT_COSTAS       IN VARCHAR2,
     PI_V_SUB_TOTAL_COSTAS IN VARCHAR2,
     PI_N_TOTAL_COSTAS     IN T_SCOB_EXPEDIENTE_DOCUMENTO.MONTO_COSTA%TYPE,
     PI_N_NRO_ITEMSC       IN INTEGER,
     --
     PI_V_TIPO_ENTIDAD           IN VARCHAR2, --0=NINGUNO;1=PERSONA;2=BANCO;3=DIREC PERSONAS;4=SUNAT;5=PNP;6=SAT;7=CAJA METROPOLITANA
     PI_I_NRO_ITEMS_TIPO_ENTIDAD IN INTEGER,
     PI_V_ID_TIPO_ENTIDAD        IN VARCHAR2, --entidades a quienes va dirigido
     PI_V_NRO_ITEMSTE            IN VARCHAR2, --cadena con los numero de entidades a quienes ira dirigido
     --
     PI_I_ESTADO_EXPEDIENTE   IN T_SCOB_EXPEDIENTE.ESTADO_EXPEDIENTE%TYPE,
     PI_N_ID_EXPED_DOC_ORIGEN IN T_SCOB_EXPEDIENTE_DOCUMENTO.ID_EXPEDIENTE_DOCUMENTO_ORIGEN%TYPE,
     --ID DEL DOCUMENTO DE RESOLUCION.
     --CASO GENERA CEDULAS A PARTIR DE UNA RESOLUCION.
     --
     PI_N_ID_SERVICIO      IN NUMBER,
     PI_V_ID_TIPO_SERVICIO IN VARCHAR2,
     PI_C_FLG_UCI          IN CHAR,
     --
     PI_V_AUDUSUCREACION     IN T_SCOB_EXPEDIENTE_DOCUMENTO.AUDUSUCREACION%TYPE,
     PI_N_ID_USUARIO_INGRESO IN T_SCOB_USUARIO.ID_USUARIO%TYPE,
     --
     PI_V_FEC_GENERACION_DOC IN VARCHAR,
     PO_N_RETORNO            OUT NUMBER,
     PO_N_RETORNO_SOL        OUT NUMBER,
     PO_N_COD_ERROR          OUT NUMBER,
     PO_V_MSJ_ERROR          OUT VARCHAR2);

    PROCEDURE SCOB_SP_I_GEN_DOCS_BY_EMB_RETE
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 30.05.2011
        -- Proposito    : insertar los documentos y solicitudes de REQUERIR
        -----------------------------------------------------------
        -- Modificacion : 01.07.2011
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (
     /*01*/PI_N_ID_EXPEDIENTE IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
     /*02*/
     PI_N_ID_EXPEDIENTE_EMBARGO IN T_SCOB_EXPED_EMBARGO.ID_EXPEDIENTE_EMBARGO%TYPE,
     /*03*/
     PI_N_MONTO_EMBARGO IN T_SCOB_EXPED_EMBARGO.MONTO_EMBARGO%TYPE, --monto total soles
     /*04*/
     PI_I_COD_TIPO_ASOCIACION IN T_SCOB_EXPED_EMBARGO_DOC.COD_TIPO_ASOCIACION%TYPE,
     /*
                                                          2=Solicitud Requerir.(actual)
                                                          3=Solicitud Proceder.
                                                          4=Solicitud Requerir/Retener (
                                                                      se incluye en este caso el tipo:
                                                                      9=Solicitud Requerir/Proceder
                                                          )
                                                          */
     /*05*/
     PI_C_FLG_RETENER_LEVANTAR IN CHAR,
     --1=RETENER; 2=LEVANTAR
     --
     /*06*/
     PI_N_ID_MOTIVO IN T_SCOB_EXPEDIENTE_ESTADO.ID_MOTIVO%TYPE,
     /*07*/
     PI_V_ID_PLANTILLA IN VARCHAR2, --CADENA DE PLANTILLAS (EL PRIMERO SIEMPRE DEBE SER LA RESOLUCION, SI ES EL CASO)
     /*08*/
     PI_V_MOTIVO_PLANTILLA IN VARCHAR2, --CADENA DE MOTIVOS PLANTILLAS (EL PRIMERO SIEMPRE DEBE SER LA RESOLUCION, SI ES EL CASO)
     /*09*/
     PI_N_NRO_ITEMSP IN NUMBER, --SI SE ENVIAN DOS DOCUMENTO, SIEMPRE DEBE ESTAR LA REC PRIMERO.
     --
     /*10*/
     PI_V_ID_COSTAS IN VARCHAR2,
     /*11*/
     PI_V_POR_COSTAS IN VARCHAR2,
     /*12*/
     PI_V_VAL_COSTAS IN VARCHAR2,
     /*13*/
     PI_V_CNT_COSTAS IN VARCHAR2,
     /*14*/
     PI_V_SUB_TOTAL_COSTAS IN VARCHAR2,
     /*15*/
     PI_N_TOTAL_COSTAS IN T_SCOB_EXPEDIENTE_DOCUMENTO.MONTO_COSTA%TYPE,
     /*16*/
     PI_N_NRO_ITEMSC IN INTEGER,
     --
     /*17*/
     PI_V_TIPO_ENTIDAD IN VARCHAR, --0=NINGUNO;1=PERSONA;2=BANCO;3=DIREC PERSONAS;4=SUNAT;5=PNP;6=SAT;7=CAJA METROPOLITANA
     /*18*/
     PI_I_NRO_ITEMS_TIPO_ENTIDAD IN INTEGER,
     /*19*/
     PI_V_ID_TIPO_ENTIDAD IN VARCHAR, --entidades a quienes va dirigido
     /*20*/
     PI_V_NRO_ITEMSTE IN VARCHAR, --cadena con los numero de entidades a quienes ira dirigido
     --
     /*21*/
     PI_I_ESTADO_EXPEDIENTE IN T_SCOB_EXPEDIENTE.ESTADO_EXPEDIENTE%TYPE,
     --
     /*2101*/
     PI_V_ID_RETENCIONES IN VARCHAR2, --id's de las entidades retenedoras del caso 1(proceder/requerir)
     /*2102*/
     PI_I_NRO_ID_RETENCIONES IN INTEGER, --nro de id's asociados en el punto 2101.
     
     /*22*/
     PI_V_ID_EMBARGO_RETENER IN VARCHAR2, --ids de las solicitudes de retener seleccionadas
     /*23*/
     PI_V_TIPO_CAMBIO IN VARCHAR2,
     /*24*/
     PI_V_MONTO_APLICAR IN VARCHAR2,
     /*25*/
     PI_V_MONTO_APLICAR_ME IN VARCHAR2,
     /*26*/
     PI_V_ID_TIPO_ENTIDAD_REQUERIR IN VARCHAR, --entidades financieras a quienes va dirigido (PROCEDER, REQUERIR)
     /*27*/
     PI_I_NRO_ITEMS_REQUERIR IN INTEGER, --cantidad de entidades financieras del punto anterior
     --
     /*28*/
     PI_N_ID_SERVICIO IN NUMBER,
     /*29*/
     PI_V_ID_TIPO_SERVICIO IN VARCHAR2,
     /*30*/
     PI_C_FLG_UCI IN CHAR,
     --
     /*31*/
     PI_V_AUDUSUCREACION IN T_SCOB_EXPEDIENTE_DOCUMENTO.AUDUSUCREACION%TYPE,
     /*32*/
     PI_N_ID_USUARIO_INGRESO IN T_SCOB_USUARIO.ID_USUARIO%TYPE,
     --
     /*33*/
     PI_C_VERIFICA_GENERACION_DOC IN CHAR,
     /*34*/
     PI_V_FEC_GENERACION_DOC IN VARCHAR,
     /*35*/
     PI_N_MONTO_APLICAR IN T_SCOB_EXPED_EMBARGO_REQ.MONTO_APLICAR%TYPE, --monto total aplicar en soles
     /*36*/
     PI_N_MONTO_APLICAR_ME IN T_SCOB_EXPED_EMBARGO_REQ.MONTO_APLICAR_ME%TYPE, --monto total aplicar en dolares
     --
     /*37*/
     PO_N_RETORNO OUT NUMBER,
     /*38*/
     PO_N_RETORNO_SOL OUT NUMBER,
     /*39*/
     PO_N_COD_ERROR OUT NUMBER,
     /*40*/
     PO_V_MSJ_ERROR OUT VARCHAR2);

    PROCEDURE SCOB_SP_I_GENERA_DOCUMENTO
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 20/04/2011
        -- Proposito    : insertar los documentos plantillas generados por el sistema
        -----------------------------------------------------------
        -- Modificacion : 13/05/2011
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_V_ID_EXPEDIENTE IN VARCHAR2, --CADENA DE EXPEDIENTES
     PI_N_NRO_ITEMS     IN NUMBER,
     --
     PI_N_ID_MOTIVO        IN T_SCOB_EXPEDIENTE_ESTADO.ID_MOTIVO%TYPE,
     PI_V_ID_PLANTILLA     IN VARCHAR2, --CADENA DE PLANTILLAS (EL PRIMERO SIEMPRE DEBE SER LA RESOLUCION, SI ES EL CASO)
     PI_V_MOTIVO_PLANTILLA IN VARCHAR2, --CADENA DE MOTIVOS PLANTILLAS (EL PRIMERO SIEMPRE DEBE SER LA RESOLUCION, SI ES EL CASO)
     PI_N_NRO_ITEMSP       IN NUMBER, --SI SE ENVIAN DOS DOCUMENTO, SIEMPRE DEBE ESTAR LA REC PRIMERO.
     --
     PI_V_ID_COSTAS        IN VARCHAR2,
     PI_V_POR_COSTAS       IN VARCHAR2,
     PI_V_VAL_COSTAS       IN VARCHAR2,
     PI_V_CNT_COSTAS       IN VARCHAR2,
     PI_V_SUB_TOTAL_COSTAS IN VARCHAR2,
     PI_N_TOTAL_COSTAS     IN T_SCOB_EXPEDIENTE_DOCUMENTO.MONTO_COSTA%TYPE,
     PI_N_NRO_ITEMSC       IN INTEGER,
     -------------------------
     PI_V_ESTADO_EXPEDIENTE IN T_SCOB_EXPEDIENTE_DOCUMENTO.ESTADO_EXPEDIENTE%TYPE,
     PI_N_ID_EXP_DOC_ORIGEN IN T_SCOB_EXPEDIENTE_DOCUMENTO.ID_EXPEDIENTE_DOCUMENTO_ORIGEN%TYPE,
     ---
     PI_V_TIPO_ENTIDAD    IN VARCHAR2, --0=NINGUNO;1=PERSONA;2=BANCO;3=DIREC PERSONAS;4=SUNAT;5=PNP;6=SAT;7=CAJA METROPOLITANA
     PI_V_ID_TIPO_ENTIDAD IN VARCHAR2, --entidades a quienes va dirigido
     PI_V_NRO_ITEMSTE     IN VARCHAR2, --cadena con los numero de entidades a quienes ira dirigido
     --
     PI_N_ID_SERVICIO      IN NUMBER,
     PI_V_ID_TIPO_SERVICIO IN VARCHAR2,
     PI_C_FLG_UCI          IN CHAR,
     ---
     PI_V_AUDUSUCREACION     IN T_SCOB_EXPEDIENTE_DOCUMENTO.AUDUSUCREACION%TYPE,
     PI_N_ID_USUARIO_INGRESO IN T_SCOB_USUARIO.ID_USUARIO%TYPE,
     PI_V_FEC_GENERACION_DOC IN VARCHAR,
     PI_C_IND_GEN_REC        IN CHAR,
     PO_N_RETORNO            OUT NUMBER,
     PO_N_COD_ERROR          OUT NUMBER,
     PO_V_MSJ_ERROR          OUT VARCHAR2);

    PROCEDURE SCOB_SP_I_GENERA_DOCUMENTO_V2
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 10.04.2012
        -- Proposito    : insertar los documentos plantillas generados por el sistema
                          por cada entidad.
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_V_ID_EXPEDIENTE IN VARCHAR2, --CADENA DE EXPEDIENTES
     PI_N_NRO_ITEMS     IN NUMBER,
     --
     PI_N_ID_MOTIVO        IN T_SCOB_EXPEDIENTE_ESTADO.ID_MOTIVO%TYPE,
     PI_V_ID_PLANTILLA     IN VARCHAR2, --CADENA DE PLANTILLAS (EL PRIMERO SIEMPRE DEBE SER LA RESOLUCION, SI ES EL CASO)
     PI_V_MOTIVO_PLANTILLA IN VARCHAR2, --CADENA DE MOTIVOS PLANTILLAS (EL PRIMERO SIEMPRE DEBE SER LA RESOLUCION, SI ES EL CASO)
     PI_N_NRO_ITEMSP       IN NUMBER, --SI SE ENVIAN DOS DOCUMENTO, SIEMPRE DEBE ESTAR LA REC PRIMERO.
     --
     PI_V_ID_COSTAS        IN VARCHAR2,
     PI_V_POR_COSTAS       IN VARCHAR2,
     PI_V_VAL_COSTAS       IN VARCHAR2,
     PI_V_CNT_COSTAS       IN VARCHAR2,
     PI_V_SUB_TOTAL_COSTAS IN VARCHAR2,
     PI_N_TOTAL_COSTAS     IN T_SCOB_EXPEDIENTE_DOCUMENTO.MONTO_COSTA%TYPE,
     PI_N_NRO_ITEMSC       IN INTEGER,
     -------------------------
     PI_V_ESTADO_EXPEDIENTE IN T_SCOB_EXPEDIENTE_DOCUMENTO.ESTADO_EXPEDIENTE%TYPE,
     PI_N_ID_EXP_DOC_ORIGEN IN T_SCOB_EXPEDIENTE_DOCUMENTO.ID_EXPEDIENTE_DOCUMENTO_ORIGEN%TYPE,
     ---
     PI_V_TIPO_ENTIDAD    IN VARCHAR2, --0=NINGUNO;1=PERSONA;2=BANCO;3=DIREC PERSONAS;4=SUNAT;5=PNP;6=SAT;7=CAJA METROPOLITANA
     PI_I_NRO_ITEMSE      IN NUMBER,
     PI_V_ID_TIPO_ENTIDAD IN VARCHAR2, --entidades a quienes va dirigido
     PI_V_NRO_ITEMSTE     IN VARCHAR2, --cadena con los numero de entidades a quienes ira dirigido
     --
     PI_N_ID_SERVICIO      IN NUMBER,
     PI_V_ID_TIPO_SERVICIO IN VARCHAR2,
     PI_C_FLG_UCI          IN CHAR,
     ---
     PI_V_AUDUSUCREACION     IN T_SCOB_EXPEDIENTE_DOCUMENTO.AUDUSUCREACION%TYPE,
     PI_N_ID_USUARIO_INGRESO IN T_SCOB_USUARIO.ID_USUARIO%TYPE,
     PI_V_FEC_GENERACION_DOC IN VARCHAR,
     PI_C_IND_GEN_REC        IN CHAR,
     PO_N_RETORNO            OUT NUMBER,
     PO_N_COD_ERROR          OUT NUMBER,
     PO_V_MSJ_ERROR          OUT VARCHAR2);

    PROCEDURE SCOB_SP_I_DOCUMENTO
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 10.05.2011
        -- Proposito    : inserta documentos segun tipo.
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_N_GENERADOR_DOC     IN T_SCOB_EXPEDIENTE_DOCUMENTO.COD_GENERADOR_DOCUMENTO%TYPE,
     PI_N_ID_EXPEDIENTE     IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
     PI_I_ESTADO_EXPEDIENTE IN T_SCOB_EXPEDIENTE_DOCUMENTO.ESTADO_EXPEDIENTE%TYPE,
     --
     PI_N_ID_PLANTILLA     IN T_SCOB_EXPEDIENTE_DOCUMENTO.ID_PLANTILLA%TYPE,
     PI_N_MOTIVO_PLANTILLA IN T_SCOB_EXPEDIENTE_DOCUMENTO.ID_MOTIVO_PLANTILLA%TYPE,
     PI_V_COD_TIPO_PLAN    IN VARCHAR2,
     PI_V_COD_TIPO_DOC     IN VARCHAR2,
     PI_N_ID_TIPO_DOC      IN T_SCOB_TIPO_DOCUMENTO.ID_TIPO_DOCUMENTO%TYPE,
     PI_I_COD_SUBTIPO_DOC  IN T_SCOB_TIPO_DOCUMENTO.COD_SUBTIPO_DOCUMENTO%TYPE,
     PI_I_NRO_REGLA        IN INTEGER,
     --
     PI_N_ID_EXP_DOC_ORIGEN IN T_SCOB_EXPEDIENTE_DOCUMENTO.ID_EXPEDIENTE_DOCUMENTO_ORIGEN%TYPE,
     --
     PI_V_ID_COSTAS        IN VARCHAR2,
     PI_V_POR_COSTAS       IN VARCHAR2,
     PI_V_VAL_COSTAS       IN VARCHAR2,
     PI_V_CNT_COSTAS       IN VARCHAR2,
     PI_V_SUB_TOTAL_COSTAS IN VARCHAR2,
     PI_N_TOTAL_COSTAS     IN T_SCOB_EXPEDIENTE_DOCUMENTO.MONTO_COSTA%TYPE,
     PI_N_NRO_ITEMSC       IN INTEGER,
     --
     PI_V_COD_AREA_USUARIO    IN VARCHAR2,
     PI_V_SIGLAS_AREA_USUARIO IN VARCHAR2,
     --
     PI_N_ID_SERVICIO      IN NUMBER,
     PI_V_ID_TIPO_SERVICIO IN VARCHAR2,
     PI_C_FLG_UCI          IN CHAR,
     --
     PI_V_AUDUSUCREACION     IN T_SCOB_EXPEDIENTE_DOCUMENTO.AUDUSUCREACION%TYPE,
     PI_N_ID_USUARIO_INGRESO IN T_SCOB_USUARIO.ID_USUARIO%TYPE,
     PI_V_FEC_GENERACION_DOC IN VARCHAR,
     PI_C_IND_GEN_REC        IN CHAR,
     PO_N_RETORNO            OUT NUMBER,
     PO_N_COD_ERROR          OUT NUMBER,
     PO_V_MSJ_ERROR          OUT VARCHAR2);

    PROCEDURE SCOB_SP_S_EXPEDIENTE_DOCUMENTO
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 20.04.2011
        -- Proposito    : consulta los documentos generados por el sistema asociados a un expediente.
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_N_COD_GENERADOR_DOCUMENTO IN T_SCOB_EXPEDIENTE_DOCUMENTO.COD_GENERADOR_DOCUMENTO%TYPE,
     PO_CU_RETORNO                OUT CU_REC_SET);
    --
    PROCEDURE SCOB_SP_S_EXP_DOC
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 20.04.2011
        -- Proposito    : consulta los documentos generados por el sistema asociados a un expediente.
        -----------------------------------------------------------
        */
    (PI_N_ID_EXPEDIENTE IN VARCHAR2,
     PO_CU_RETORNO      OUT CU_REC_SET);
    --
    PROCEDURE SCOB_SP_D_EXPEDIENTE_DOCUMENTO
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 25.04.2011 --FALTA
        -- Proposito    : actualiza al estado eliminado los documentos seleccionados
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

    PROCEDURE SCOB_SP_S_DOCS_POR_SUBTIPO
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 13.05.2011
        -- Proposito    : consulta documentos por subtipo de documento
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_N_ID_EXPEDIENTE         IN T_SCOB_EXPEDIENTE_DOCUMENTO.ID_EXPEDIENTE%TYPE,
     PI_I_COD_SUBTIPO_DOCUMENTO IN T_SCOB_TIPO_DOCUMENTO.COD_SUBTIPO_DOCUMENTO%TYPE,
     PO_CU_RETORNO              OUT CU_REC_SET);

    PROCEDURE SCOB_SP_I_EXPED_DIREC
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 13.05.2011
        -- Proposito    : inserta las direcciones asociadas a los documentos generados
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_N_ID_EXPEDIENTE           IN T_SCOB_EXPED_DOCUMENTO_DIREC.ID_EXPEDIENTE_DOCUMENTO%TYPE,
     PI_I_COD_TIPO_ENTIDAD        IN T_SCOB_EXPED_DOCUMENTO_DIREC.COD_TIPO_ENTIDAD%TYPE,
     PI_N_ID_ENTIDAD              IN T_SCOB_EXPED_DOCUMENTO_DIREC.ID_ENTIDAD%TYPE,
     PI_N_ID_DOMICILIO            IN T_SCOB_EXPED_DOCUMENTO_DIREC.ID_DOMICILIO%TYPE,
     PI_N_ID_EXPEDIENTE_DOCUMENTO IN T_SCOB_EXPED_DOCUMENTO_DIREC.ID_EXPEDIENTE_DOCUMENTO%TYPE,
     PI_V_AUDUSUCREACION          IN T_SCOB_EXPED_DOCUMENTO_DIREC.AUDUSUCREACION%TYPE,
     PO_N_RETORNO                 OUT NUMBER,
     PO_N_COD_ERROR               OUT NUMBER,
     PO_V_MSJ_ERROR               OUT VARCHAR2);

    PROCEDURE SCOB_SP_S_GEN_DOCUMENTO_ETIQ
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 27.05.2011
        -- Proposito    : generar por documentos las etiquetas a reemplazar
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_N_ID_EXPEDIENTE           IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
     PI_N_COD_GENERADOR_DOCUMENTO IN T_SCOB_EXPEDIENTE_DOCUMENTO.COD_GENERADOR_DOCUMENTO%TYPE,
     PI_I_TIPO_EVENTO             IN INTEGER, --1=SUSP.2=FRAC.3=EMB.0=OTROS
     PI_N_ID_TIPO_EVENTO          IN NUMBER, --ID DE LA SOLICITUD SEGUN TIPO EVENTO
     PO_CU_RETORNO                OUT CU_REC_SET,
     PO_CU_RET_SANCIONADO         OUT CU_REC_SET,
     PO_N_COD_ERROR               OUT NUMBER,
     PO_V_MSJ_ERROR               OUT VARCHAR2);

    PROCEDURE SCOB_SP_S_DATOS_DOCUMENTO_GEN
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 30.05.2011
        -- Proposito    : consulta los datos de un documento en particular
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_N_ID_EXPEDIENTE_DOCUMENTO IN T_SCOB_EXPEDIENTE_DOCUMENTO.ID_EXPEDIENTE_DOCUMENTO%TYPE,
     PO_CU_RETORNO                OUT CU_REC_SET);

    PROCEDURE SCOB_SP_I_GENERA_DOC_MULTA
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 31.05.2011
        -- Proposito    : insertar los documentos plantillas generados por el sistema en multa OR
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_N_ID_MULTA               IN T_SCOB_MULTA_DOCUMENTO_GEN.ID_MULTA%TYPE,
     PI_N_ID_MULTA_DETAL         IN T_SCOB_MULTA_DOCUMENTO_GEN.ID_MULTA_DETAL%TYPE,
     PI_N_ID_MULTA_IMPROCEDENCIA IN T_SCOB_MULTA_DOCUMENTO_GEN.ID_MULTA_IMPROCEDENCIA%TYPE,
     --
     PI_V_ID_PLANTILLA     IN VARCHAR2, --CADENA DE PLANTILLAS (EL PRIMERO SIEMPRE DEBE SER LA RESOLUCION, SI ES EL CASO)
     PI_V_MOTIVO_PLANTILLA IN VARCHAR2, --CADENA DE MOTIVOS PLANTILLAS (EL PRIMERO SIEMPRE DEBE SER LA RESOLUCION, SI ES EL CASO)
     PI_N_NRO_ITEMSP       IN NUMBER, --SI SE ENVIAN DOS DOCUMENTO, SIEMPRE DEBE ESTAR LA REC PRIMERO.
     --
     PI_I_ESTADO_MULTA IN T_SCOB_MULTA_DOCUMENTO_GEN.ESTADO_MULTA%TYPE,
     --
     PI_N_ID_TIPO_DOC_ASOC IN INTEGER,
     PI_N_ID_SERVICIO      IN NUMBER, --falta rmca
     PI_V_ID_TIPO_SERVICIO IN VARCHAR2, --falta rmca
     PI_C_FLG_UCI          IN CHAR, --falta rmca
     PI_C_FEC_GENERACION   IN CHAR,
     --
     PI_V_AUDUSUCREACION     IN T_SCOB_EXPEDIENTE_DOCUMENTO.AUDUSUCREACION%TYPE,
     PI_N_ID_USUARIO_INGRESO IN T_SCOB_USUARIO.ID_USUARIO%TYPE,
     PI_C_FLG_COMMIT         IN CHAR,
     --
     PO_N_RETORNO   OUT NUMBER,
     PO_N_COD_ERROR OUT NUMBER,
     PO_V_MSJ_ERROR OUT VARCHAR2);

    PROCEDURE SCOB_SP_I_DOCUMENTO_MULTA
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 31.05.2011
        -- Proposito    : inserta documentos segun tipo para multas
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_N_GENERADOR_DOC          IN T_SCOB_MULTA_DOCUMENTO_GEN.COD_GENERADOR_DOCUMENTO%TYPE,
     PI_N_ID_MULTA               IN T_SCOB_MULTA_DOCUMENTO_GEN.ID_MULTA%TYPE,
     PI_N_ID_MULTA_DETAL         IN T_SCOB_MULTA_DOCUMENTO_GEN.ID_MULTA_DETAL%TYPE,
     PI_N_ID_MULTA_IMPROCEDENCIA IN T_SCOB_MULTA_DOCUMENTO_GEN.ID_MULTA_IMPROCEDENCIA%TYPE,
     PI_I_ESTADO_MULTA           IN T_SCOB_MULTA_DOCUMENTO_GEN.ESTADO_MULTA%TYPE,
     --
     PI_N_ID_PLANTILLA     IN T_SCOB_MULTA_DOCUMENTO_GEN.ID_PLANTILLA%TYPE,
     PI_N_MOTIVO_PLANTILLA IN T_SCOB_MULTA_DOCUMENTO_GEN.ID_MOTIVO_PLANTILLA%TYPE,
     PI_V_COD_TIPO_PLAN    IN VARCHAR2,
     PI_V_COD_TIPO_DOC     IN VARCHAR2,
     PI_N_ID_TIPO_DOC      IN T_SCOB_TIPO_DOCUMENTO.ID_TIPO_DOCUMENTO%TYPE,
     PI_I_COD_SUBTIPO_DOC  IN T_SCOB_TIPO_DOCUMENTO.COD_SUBTIPO_DOCUMENTO%TYPE,
     PI_I_NRO_REGLA        IN INTEGER,
     --
     PI_N_ID_TIPO_DOC_ASOC IN INTEGER,
     PI_N_ID_SERVICIO      IN NUMBER, --falta rmca
     PI_V_ID_TIPO_SERVICIO IN VARCHAR2, --falta rmca
     PI_C_FLG_UCI          IN CHAR, --falta rmca
     PI_C_FEC_GENERACION   IN CHAR,
     --
     PI_V_AUDUSUCREACION     IN T_SCOB_MULTA_DOCUMENTO_GEN.AUDUSUCREACION%TYPE,
     PI_N_ID_USUARIO_INGRESO IN T_SCOB_USUARIO.ID_USUARIO%TYPE,
     --
     PO_N_RETORNO   OUT NUMBER,
     PO_N_COD_ERROR OUT NUMBER,
     PO_V_MSJ_ERROR OUT VARCHAR2);

    PROCEDURE SCOB_SP_S_GEN_DOC_ETIQ_MULTA
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 30.05.2011
        -- Proposito    : generar por documentos las etiquetas a reemplazar para multas
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_N_COD_GENERADOR_DOCUMENTO IN T_SCOB_EXPEDIENTE_DOCUMENTO.COD_GENERADOR_DOCUMENTO%TYPE,
     PO_CU_RETORNO_ETIQUETA       OUT CU_REC_SET,
     PO_CU_RETORNO                OUT CU_REC_SET);

    PROCEDURE SCOB_SP_I_EXPED_DOC_TRAMITE
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 28/10/2011
        -- Proposito    : insertar los documentos plantillas generados por mero tramite.
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_C_IND_TIPO_GENERACION T_SCOB_EXPED_COACTIVO_DOC.IND_TIPO_GENERACION%TYPE,
     /* 2=Con un documento --enviar 2
                                                    */
     PI_V_ID_EXPEDIENTE IN VARCHAR2, --CADENA DE EXPEDIENTES
     PI_N_NRO_ITEMS     IN NUMBER,
     --
     PI_N_ID_MOTIVO        IN T_SCOB_EXPEDIENTE_ESTADO.ID_MOTIVO%TYPE,
     PI_V_ID_PLANTILLA     IN VARCHAR2, --CADENA DE PLANTILLAS (EL PRIMERO SIEMPRE DEBE SER LA RESOLUCION, SI ES EL CASO)
     PI_V_MOTIVO_PLANTILLA IN VARCHAR2, --CADENA DE MOTIVOS PLANTILLAS (EL PRIMERO SIEMPRE DEBE SER LA RESOLUCION, SI ES EL CASO)
     PI_N_NRO_ITEMSP       IN NUMBER, --SI SE ENVIAN DOS DOCUMENTO, SIEMPRE DEBE ESTAR LA REC PRIMERO.
     --
     PI_V_ID_COSTAS        IN VARCHAR2,
     PI_V_POR_COSTAS       IN VARCHAR2,
     PI_V_VAL_COSTAS       IN VARCHAR2,
     PI_V_CNT_COSTAS       IN VARCHAR2,
     PI_V_SUB_TOTAL_COSTAS IN VARCHAR2,
     PI_N_TOTAL_COSTAS     IN T_SCOB_EXPEDIENTE_DOCUMENTO.MONTO_COSTA%TYPE,
     PI_N_NRO_ITEMSC       IN INTEGER,
     -------------------------
     PI_V_ESTADO_EXPEDIENTE IN T_SCOB_EXPEDIENTE_DOCUMENTO.ESTADO_EXPEDIENTE%TYPE,
     PI_N_ID_EXP_DOC_ORIGEN IN T_SCOB_EXPEDIENTE_DOCUMENTO.ID_EXPEDIENTE_DOCUMENTO_ORIGEN%TYPE,
     ---
     PI_V_TIPO_ENTIDAD    IN VARCHAR, --0=NINGUNO;1=PERSONA;2=BANCO;3=DIREC PERSONAS;4=SUNAT;5=PNP;6=SAT;7=CAJA METROPOLITANA
     PI_V_ID_TIPO_ENTIDAD IN VARCHAR, --entidades a quienes va dirigido
     PI_V_NRO_ITEMSTE     IN VARCHAR, --cadena con los numero de entidades a quienes ira dirigido
     --
     PI_N_ID_SERVICIO      IN NUMBER, --falta rmca
     PI_V_ID_TIPO_SERVICIO IN VARCHAR2, --falta rmca
     PI_C_FLG_UCI          IN CHAR, --falta rmca
     --
     PI_V_AUDUSUCREACION     IN T_SCOB_EXPEDIENTE_DOCUMENTO.AUDUSUCREACION%TYPE,
     PI_N_ID_USUARIO_INGRESO IN T_SCOB_USUARIO.ID_USUARIO%TYPE,
     PI_V_FEC_GENERACION_DOC IN VARCHAR,
     --
     PO_N_RETORNO   OUT NUMBER,
     PO_N_COD_ERROR OUT NUMBER,
     PO_V_MSJ_ERROR OUT VARCHAR2);

    PROCEDURE SCOB_SP_S_DOC_TRAMITE
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 28.10.2011
        -- Proposito    : consulta
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_I_COD_FASE                IN INTEGER,
     PI_N_COD_GENERADOR_DOCUMENTO IN NUMBER,
     PO_CU_RETORNO                OUT CU_REC_SET);

    PROCEDURE SCOB_SP_D_DOC_TRAMITE
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 28.10.2011
        -- Proposito    : elimina los documentos generados.
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_I_COD_FASE                IN INTEGER,
     PI_N_ID_MULTA                IN NUMBER,
     PI_N_ID_EXPEDIENTE           IN NUMBER,
     PI_N_COD_GENERADOR_DOCUMENTO IN NUMBER,
     PI_V_AUDUSUMODIFICACION      IN T_SCOB_MULTA.AUDUSUMODIFICACION%TYPE,
     PO_N_RETORNO                 OUT NUMBER,
     PO_N_COD_ERROR               OUT NUMBER,
     PO_V_MSJ_ERROR               OUT VARCHAR2);

    PROCEDURE SCOB_SP_D_DOC_SUSPENSION
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 31.10.2011 --falta cambiar estados de la suspension... y eliminar las tablas correctas.
        -- Proposito    : elimina los documentos generados por suspension
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_N_ID_EXPEDIENTE           IN NUMBER,
     PI_N_ID_EXPED_SUSPENDER      IN T_SCOB_EXPED_SUSPENDER.ID_EXPED_SUSPENDER%TYPE,
     PI_I_COD_TIPO_ASOCIACION     IN INTEGER,
     PI_N_COD_GENERADOR_DOCUMENTO IN NUMBER,
     PI_V_AUDUSUMODIFICACION      IN T_SCOB_MULTA.AUDUSUMODIFICACION%TYPE,
     PO_N_RETORNO                 OUT NUMBER,
     PO_N_COD_ERROR               OUT NUMBER,
     PO_V_MSJ_ERROR               OUT VARCHAR2);

    PROCEDURE SCOB_SP_D_DOC_FRACCIONAMIENTO
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 31.10.2011 --falta cambiar estados del fraccionamiento... y eliminar las tablas correctas.
        -- Proposito    : elimina los documentos generados por fraccionamiento
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_N_ID_EXPEDIENTE           IN NUMBER,
     PI_N_ID_EXPED_FRACCIONAR     IN T_SCOB_EXPED_FRACCIONAR.ID_EXPED_FRACCIONAR%TYPE,
     PI_I_COD_TIPO_ASOCIACION     IN INTEGER,
     PI_N_COD_GENERADOR_DOCUMENTO IN NUMBER,
     PI_V_AUDUSUMODIFICACION      IN T_SCOB_MULTA.AUDUSUMODIFICACION%TYPE,
     PO_N_RETORNO                 OUT NUMBER,
     PO_N_COD_ERROR               OUT NUMBER,
     PO_V_MSJ_ERROR               OUT VARCHAR2);

    PROCEDURE SCOB_SP_U_ACTUALIZAR_ARCHIVO
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 02.11.2011
        -- Proposito    : importar un archivo
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_I_COD_FASE           IN INTEGER,
     PI_N_ID_MULTA           IN NUMBER,
     PI_N_ID_EXPEDIENTE      IN NUMBER,
     PI_N_ID_DOCUMENTO       IN NUMBER,
     PI_I_TIPO_DOC_ASOC      IN INTEGER,
     PI_V_AUDUSUMODIFICACION IN T_SCOB_MULTA.AUDUSUMODIFICACION%TYPE,
     PO_N_RETORNO            OUT NUMBER,
     PO_N_COD_ERROR          OUT NUMBER,
     PO_V_MSJ_ERROR          OUT VARCHAR2);
    --
    PROCEDURE SCOB_SP_I_SOLIC_DESACUM_DOC
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
    (PI_I_COD_TIPO_ASOCIACION IN T_SCOB_EXPED_COACTIVO_DOC.COD_TIPO_ASOCIACION%TYPE,
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
     PO_N_RETORNO            OUT NUMBER,
     PO_N_COD_ERROR          OUT NUMBER,
     PO_V_MSJ_ERROR          OUT VARCHAR2);
    --
    PROCEDURE SCOB_SP_U_GEN_DOC_ETIQ_DESACUM
    /*
        -----------------------------------------------------------
        -- Autor        : @dcelis
        -- Creado       : 08.05.2017
        -- Proposito    : Procedimiento envoltorio para modificación de etiquetas,
        exclusivamente para el caso de acumulación/desacumulación
        -----------------------------------------------------------
        */
    (PI_V_NU_ID_EXP_SOLIC         IN VARCHAR2,
     PI_N_ID_EXPEDIENTE           IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
     PI_N_COD_GENERADOR_DOCUMENTO IN T_SCOB_EXPEDIENTE_DOCUMENTO.COD_GENERADOR_DOCUMENTO%TYPE,
     PI_I_TIPO_EVENTO             IN INTEGER, --1=SUSP.2=FRAC.3=EMB RETENCION; 4=EMB.REQUERIR 5=EMB.OTROS; 0=OTROS
     PI_N_ID_TIPO_EVENTO          IN NUMBER, --ID DE LA SOLICITUD SEGUN TIPO EVENTO
     OUT_REGISTRO                 OUT CU_REC_SET,
     PO_CU_RET_SANCIONADO         OUT CU_REC_SET,
     PO_N_COD_ERROR               OUT NUMBER,
     PO_V_MSJ_ERROR               OUT VARCHAR2);
    --

    FUNCTION SCOB_FN_DIREC_PERSONA_BY_TIPO(PI_N_ID_EXPEDIENTE      IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
                                           PI_N_ID_PERSONA         IN T_SCOB_PERSONA.ID_PERSONA%TYPE,
                                           PI_V_COD_TIPO_DOMICILIO IN T_SCOB_PERSONA_DOMICILIO.TIPO_DOMICILIO%TYPE) RETURN VARCHAR2;

    PROCEDURE SCOB_SP_I_GRABA_LOG_STD
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 27.06.2012
        -- Proposito    : insertar el log's de los documentos no generados en STD
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_N_ID_EXPEDIENTE           IN NUMBER,
     PI_N_COD_GENERADOR_DOCUMENTO IN NUMBER,
     PI_I_TIPO_EVENTO             IN INTEGER,
     PI_N_ID_TIPO_EVENTO          IN NUMBER,
     --
     PO_N_RETORNO   OUT NUMBER,
     PO_N_COD_ERROR OUT NUMBER,
     PO_V_MSJ_ERROR OUT VARCHAR2);
    ----
    FUNCTION SCOB_FN_SUM_DOC_EXP(V_COD_TIPO_PERSONA_SANCIONADO NUMBER,
                                 V_TBL_TIPO_DOC_IDENT          NUMBER,
                                 V_COD_GENERADOR_DOCUMENTO     NUMBER,
                                 V_OP                          VARCHAR2) RETURN VARCHAR2;
    --
    FUNCTION SCOB_FN_ETIQ_DOC_DESACUM(PI_N_ID NUMBER,
                                      V_OP    VARCHAR2) RETURN VARCHAR2;


    --
    

END SCOB_PK_GENERAR_DOCUMENTO;
/
CREATE OR REPLACE PACKAGE BODY SCOB_PK_GENERAR_DOCUMENTO IS
    --@0002:2013.06.12:OBS.NRO.48:Se corrige para mostrar el a?o que retorna la interfaz del STD.
    ----
    PROCEDURE SCOB_SP_I_EXPEDIENTE_DOCUMENTO
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 20/04/2011
        -- Proposito    : insertar los documentos plantillas generados por el sistema
                          de los estados precoactivo, coactivo y concluido.
        -----------------------------------------------------------
        -- Modificaciones:
        --@0001:05.11.2012:Cambio para generar esquelas precoactivas y pasarlo al estado cancelado/concluido.
        -----------------------------------------------------------
        */
    (
     /*01*/PI_I_COD_TIPO_ASOCIACION IN T_SCOB_EXPED_COACTIVO_DOC.COD_TIPO_ASOCIACION%TYPE,
     /*
                                                  1=Cobranza Precoactiva
                                                  2=Cobranza Coactiva
                                                  3=Concluir Cancelar
                                                  4=Sobreseer
                                               */
     /*02*/
     PI_C_IND_TIPO_GENERACION T_SCOB_EXPED_COACTIVO_DOC.IND_TIPO_GENERACION%TYPE,
     /*
                                                  1=Con dos documentos
                                                  2=Con un documento
                                               */
     /*03*/
     PI_V_ID_EXPEDIENTE IN VARCHAR2, --CADENA DE EXPEDIENTES
     /*04*/
     PI_N_NRO_ITEMS IN NUMBER,
     --
     /*05*/
     PI_N_ID_MOTIVO IN T_SCOB_EXPEDIENTE_ESTADO.ID_MOTIVO%TYPE,
     /*06*/
     PI_V_ID_PLANTILLA IN VARCHAR2, --CADENA DE PLANTILLAS (EL PRIMERO SIEMPRE DEBE SER LA RESOLUCION, SI ES EL CASO)
     /*07*/
     PI_V_MOTIVO_PLANTILLA IN VARCHAR2, --CADENA DE MOTIVOS PLANTILLAS (EL PRIMERO SIEMPRE DEBE SER LA RESOLUCION, SI ES EL CASO)
     /*08*/
     PI_N_NRO_ITEMSP IN NUMBER, --SI SE ENVIAN DOS DOCUMENTO, SIEMPRE DEBE ESTAR LA REC PRIMERO.
     --
     /*09*/
     PI_V_ID_COSTAS IN VARCHAR2,
     /*10*/
     PI_V_POR_COSTAS IN VARCHAR2,
     /*11*/
     PI_V_VAL_COSTAS IN VARCHAR2,
     /*12*/
     PI_V_CNT_COSTAS IN VARCHAR2,
     /*13*/
     PI_V_SUB_TOTAL_COSTAS IN VARCHAR2,
     /*14*/
     PI_N_TOTAL_COSTAS IN T_SCOB_EXPEDIENTE_DOCUMENTO.MONTO_COSTA%TYPE,
     /*15*/
     PI_N_NRO_ITEMSC IN INTEGER,
     -------------------------
     /*16*/
     PI_I_ESTADO_EXPEDIENTE IN T_SCOB_EXPEDIENTE_DOCUMENTO.ESTADO_EXPEDIENTE%TYPE,
     /*17*/
     PI_N_ID_EXP_DOC_ORIGEN IN T_SCOB_EXPEDIENTE_DOCUMENTO.ID_EXPEDIENTE_DOCUMENTO_ORIGEN%TYPE,
     ---
     /*18*/
     PI_V_TIPO_ENTIDAD IN VARCHAR, --0=NINGUNO;1=PERSONA;2=BANCO;3=DIREC PERSONAS;4=SUNAT;5=PNP;6=SAT;7=CAJA METROPOLITANA
     /*19*/
     PI_V_ID_TIPO_ENTIDAD IN VARCHAR, --entidades a quienes va dirigido
     /*20*/
     PI_V_NRO_ITEMSTE IN VARCHAR, --cadena con los numero de entidades a quienes ira dirigido
     --
     /*21*/
     PI_N_ID_SERVICIO IN NUMBER,
     /*22*/
     PI_V_ID_TIPO_SERVICIO IN VARCHAR2,
     /*23*/
     PI_C_FLG_UCI IN CHAR,
     --
     /*24*/
     PI_V_AUDUSUCREACION IN T_SCOB_EXPEDIENTE_DOCUMENTO.AUDUSUCREACION%TYPE,
     /*25*/
     PI_N_ID_USUARIO_INGRESO IN T_SCOB_USUARIO.ID_USUARIO%TYPE,
     /*26*/
     PI_V_FEC_GENERACION_DOC IN VARCHAR,
     /*27*/
     PO_N_RETORNO   OUT NUMBER,
     PO_N_COD_ERROR OUT NUMBER,
     PO_V_MSJ_ERROR OUT VARCHAR2) IS
        N_GENERADOR_DOCUMENTO  NUMBER;
        N_ID_MULTA             T_SCOB_MULTA.ID_MULTA%TYPE;
        N_CONT                 INTEGER;
        V_ID_EXPEDIENTE        VARCHAR(10);
        C_FLG_MULTA_RESOLUTIVO T_SCOB_MULTA.FLG_MULTA_RESOLUTIVO%TYPE;
        C_FLG_IND_GEN_REC      CHAR(1);
        C_FEC_GENERACION_DOC   CHAR(10);
        N_ID_MOTIVO            T_SCOB_EXPEDIENTE_ESTADO.ID_MOTIVO%TYPE;
        I_ESTADO_EXPEDIENTE    T_SCOB_EXPEDIENTE_DOCUMENTO.ESTADO_EXPEDIENTE%TYPE;
        --
        V_QUERY CLOB;
        --
    BEGIN
        PO_V_MSJ_ERROR := '';
        PO_N_RETORNO   := 0;
        PO_N_COD_ERROR := -1;
    
        N_ID_MOTIVO         := PI_N_ID_MOTIVO;
        I_ESTADO_EXPEDIENTE := PI_I_ESTADO_EXPEDIENTE;
    
        C_FEC_GENERACION_DOC := PI_V_FEC_GENERACION_DOC;
        --C_FEC_GENERACION_DOC := '14/05/2012'; --cambiar la fecha para forzar ejecucion.
    
        C_FLG_IND_GEN_REC := '0';
        IF PI_I_COD_TIPO_ASOCIACION = SCOB_PK_CONSTANTES.C_TIP_ASOC_COACTIVO THEN
            --INDICADOR DOCUMENTO DEL TIPO REC (PROCESO COACTIVO).
            C_FLG_IND_GEN_REC := '1';
        END IF;
    
        --@0001:INI
        IF PI_I_COD_TIPO_ASOCIACION = SCOB_PK_CONSTANTES.C_TIP_ASOC_PRECOACTIVO THEN
            --VERIFICA SI EL ESTADO DE PAGO DE LA MULTA ES "PAGO TOTAL"
            SELECT COUNT(EXPE.ID_EXPEDIENTE)
              INTO N_CONT
              FROM T_SCOB_EXPEDIENTE EXPE
             INNER JOIN T_SCOB_EXPEDIENTE_MULTA EXMU
                ON EXMU.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
               AND EXMU.ESTADO = '1'
             INNER JOIN T_SCOB_MULTA MULT
                ON MULT.ID_MULTA = EXMU.ID_MULTA
             WHERE INSTR(PI_V_ID_EXPEDIENTE, '|' || TO_CHAR(EXPE.ID_EXPEDIENTE) || '|') > 0
               AND MULT.COD_ESTADO_PAGO = SCOB_PK_CONSTANTES.C_EST_PAGO_TOTAL;
        
            IF PI_N_ID_MOTIVO = '23' THEN
                --motivo: CONCLUIDO/CANCELADO PRE-COACTIVO
                IF N_CONT <> PI_N_NRO_ITEMS THEN
                    PO_N_COD_ERROR := -2;
                    PO_V_MSJ_ERROR := 'No se puede realizar la accion. Todos los expedientes seleccionados deben tener pago total.';
                    ROLLBACK;
                    RETURN;
                END IF;
                --ACTUALIZAR EL ESTADO DEL EXPEDIENTE A "CANCELADO/CONCLUIDO"
                UPDATE T_SCOB_EXPEDIENTE EXPE
                   SET EXPE.ESTADO_EXPEDIENTE     = SCOB_PK_CONSTANTES.C_TBL_EST_EXP_CONCLUIDO,
                       EXPE.ID_MOTIVO             = SCOB_PK_CONSTANTES.C_TBL_MOTIVO_CONCL_CANCELADO,
                       EXPE.FEC_ESTADO_EXPEDIENTE = SYSDATE,
                       EXPE.AUDUSUMODIFICACION    = PI_V_AUDUSUCREACION,
                       EXPE.AUDFECMODIFICACION    = SYSDATE,
                       FLG_CANCELADO              = '1'
                 WHERE INSTR(PI_V_ID_EXPEDIENTE, '|' || TO_CHAR(EXPE.ID_EXPEDIENTE) || '|') > 0;
                --ACTUALIZA EL LOG'S DE ESTADOS DEL EXPEDIENTE
                INSERT INTO T_SCOB_EXPEDIENTE_ESTADO
                    (ID_EXPEDIENTE_ESTADO, ID_EXPEDIENTE, ESTADO_EXPEDIENTE, ESTADO, AUDFECCREACION, AUDUSUCREACION, ID_MOTIVO)
                    SELECT SCOB_SQ_EXPEDIENTE_ESTADO.NEXTVAL,
                           EXPE.ID_EXPEDIENTE,
                           SCOB_PK_CONSTANTES.C_TBL_EST_EXP_CONCLUIDO,
                           SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO,
                           SYSDATE,
                           PI_V_AUDUSUCREACION,
                           SCOB_PK_CONSTANTES.C_TBL_MOTIVO_CONCL_CANCELADO
                      FROM T_SCOB_EXPEDIENTE EXPE
                     WHERE INSTR(PI_V_ID_EXPEDIENTE, '|' || TO_CHAR(EXPE.ID_EXPEDIENTE) || '|') > 0;
            
                N_ID_MOTIVO         := SCOB_PK_CONSTANTES.C_TBL_MOTIVO_CONCL_CANCELADO;
                I_ESTADO_EXPEDIENTE := SCOB_PK_CONSTANTES.C_TBL_EST_EXP_CONCLUIDO;
            
            ELSE
                --SI NO ES CANCELADO/CONCLUIDO PRE-COACTIVO
                --DEBE VERIFICAR QUE LOS EXPEDIENTES NO ESTEN CON PAGO TOTAL.
                IF N_CONT > 0 THEN
                    PO_N_COD_ERROR := -3;
                    PO_V_MSJ_ERROR := 'No se puede realizar la accion. Ningun expediente seleccionado debe tener pago total.';
                    ROLLBACK;
                    RETURN;
                END IF;
            END IF;
        
            N_CONT := 0;
        
        END IF;
        --@0001:FIN
        /*DBMS_OUTPUT.PUT_LINE(
          'PI_V_ID_EXPEDIENTE: '||PI_V_ID_EXPEDIENTE||
          'PI_N_NRO_ITEMS: '||PI_N_NRO_ITEMS||
          'N_ID_MOTIVO: '||N_ID_MOTIVO||
          'PI_V_ID_PLANTILLA: '||PI_V_ID_PLANTILLA||
          'PI_V_MOTIVO_PLANTILLA: '||PI_V_MOTIVO_PLANTILLA||
          'PI_N_NRO_ITEMSP: '||PI_N_NRO_ITEMSP||
          'PI_V_ID_COSTAS: '||PI_V_ID_COSTAS||
          'PI_V_POR_COSTAS: '||PI_V_POR_COSTAS||
          'PI_V_VAL_COSTAS: '||PI_V_VAL_COSTAS||
          'PI_V_CNT_COSTAS: '||PI_V_CNT_COSTAS||
          'PI_V_SUB_TOTAL_COSTAS: '||PI_V_SUB_TOTAL_COSTAS||
          'PI_N_TOTAL_COSTAS: '||PI_N_TOTAL_COSTAS||
          'PI_N_NRO_ITEMSC: '||PI_N_NRO_ITEMSC||
          'I_ESTADO_EXPEDIENTE: '||I_ESTADO_EXPEDIENTE||
          'PI_N_ID_EXP_DOC_ORIGEN: '||PI_N_ID_EXP_DOC_ORIGEN||
          'PI_V_TIPO_ENTIDAD: '||PI_V_TIPO_ENTIDAD||
          'PI_V_ID_TIPO_ENTIDAD: '||PI_V_ID_TIPO_ENTIDAD||
          'PI_V_NRO_ITEMSTE: '||PI_V_NRO_ITEMSTE||
          'PI_N_ID_SERVICIO: '||PI_N_ID_SERVICIO||
          'PI_V_ID_TIPO_SERVICIO: '||PI_V_ID_TIPO_SERVICIO||
          'PI_C_FLG_UCI: '||PI_C_FLG_UCI||
          'PI_V_AUDUSUCREACION: '||PI_V_AUDUSUCREACION||
          'PI_N_ID_USUARIO_INGRESO: '||PI_N_ID_USUARIO_INGRESO||
          'C_FEC_GENERACION_DOC: '||C_FEC_GENERACION_DOC||
          'C_FLG_IND_GEN_REC: '||C_FLG_IND_GEN_REC
        );*/
        SCOB_SP_I_GENERA_DOCUMENTO(PI_V_ID_EXPEDIENTE,
                                   PI_N_NRO_ITEMS,
                                   N_ID_MOTIVO,
                                   PI_V_ID_PLANTILLA,
                                   PI_V_MOTIVO_PLANTILLA,
                                   PI_N_NRO_ITEMSP,
                                   PI_V_ID_COSTAS,
                                   PI_V_POR_COSTAS,
                                   PI_V_VAL_COSTAS,
                                   PI_V_CNT_COSTAS,
                                   PI_V_SUB_TOTAL_COSTAS,
                                   PI_N_TOTAL_COSTAS,
                                   PI_N_NRO_ITEMSC,
                                   I_ESTADO_EXPEDIENTE,
                                   PI_N_ID_EXP_DOC_ORIGEN,
                                   PI_V_TIPO_ENTIDAD,
                                   PI_V_ID_TIPO_ENTIDAD,
                                   PI_V_NRO_ITEMSTE,
                                   PI_N_ID_SERVICIO,
                                   PI_V_ID_TIPO_SERVICIO,
                                   PI_C_FLG_UCI,
                                   PI_V_AUDUSUCREACION,
                                   PI_N_ID_USUARIO_INGRESO,
                                   C_FEC_GENERACION_DOC,
                                   C_FLG_IND_GEN_REC,
                                   N_GENERADOR_DOCUMENTO,
                                   PO_N_COD_ERROR,
                                   PO_V_MSJ_ERROR);
        --insertar los documentos generados
        INSERT INTO T_SCOB_EXPED_COACTIVO_DOC
            (ID_EXPED_COACTIVO_DOC, ID_EXPEDIENTE, ID_EXPEDIENTE_DOCUMENTO, COD_TIPO_ASOCIACION, IND_TIPO_GENERACION, ESTADO, AUDFECCREACION,
             AUDUSUCREACION)
            SELECT SCOB_SQ_EXPED_COACTIVO_DOC.NEXTVAL,
                   EXDO.ID_EXPEDIENTE,
                   EXDO.ID_EXPEDIENTE_DOCUMENTO,
                   PI_I_COD_TIPO_ASOCIACION,
                   PI_C_IND_TIPO_GENERACION,
                   SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO,
                   SYSDATE,
                   PI_V_AUDUSUCREACION
              FROM T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
             WHERE EXDO.COD_GENERADOR_DOCUMENTO = N_GENERADOR_DOCUMENTO;
        --AND EXDO.COD_SUBTIPO_DOCUMENTO <> SCOB_PK_CONST ANTES.C_COD_SUBTIPODOC_RESOLUCION;
        IF PO_N_COD_ERROR < 0 THEN
            ROLLBACK;
            RETURN;
        END IF;
        --01.08.2011 --GENERACION DE LA REC (PROCESO COACTIVO).
        IF PI_I_COD_TIPO_ASOCIACION = SCOB_PK_CONSTANTES.C_TIP_ASOC_COACTIVO THEN
            N_CONT := 1;
            WHILE (N_CONT <= PI_N_NRO_ITEMS)
            LOOP
                SCOB_PK_UTILITARIO.SCOB_SP_S_SPLIT(PI_V_ID_EXPEDIENTE, '|', N_CONT + 1, V_ID_EXPEDIENTE);
            
                IF V_ID_EXPEDIENTE = '#' THEN
                    EXIT;
                END IF;
            
                -- INICIO
                SELECT EXMU.ID_MULTA,
                       MULT.FLG_MULTA_RESOLUTIVO
                  INTO N_ID_MULTA,
                       C_FLG_MULTA_RESOLUTIVO
                  FROM T_SCOB_EXPEDIENTE_MULTA EXMU
                 INNER JOIN T_SCOB_MULTA MULT
                    ON MULT.ID_MULTA = EXMU.ID_MULTA
                   AND MULT.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
                 WHERE EXMU.ID_EXPEDIENTE = TO_NUMBER(V_ID_EXPEDIENTE)
                   AND EXMU.ESTADO = '1'
                      -- @dcelis Req.44
                   AND MULT.ID_MULTA = SCOB_PK_EXPEDIENTE.SCOB_FN_MUL_ANTIGUO(EXMU.ID_EXPEDIENTE);
                -- @dcelis Req.44
            
                -- @dcelis Req.44
                --ACTUALIZAR LA FECHA DE GENERACION DE LA REC
                /*UPDATE T_SCOB_MULTA MULT
                SET
                   FEC_EMISION_REC = TO_DATE(C_FEC_GENERACION_DOC,'DD/MM/YYYY')--,
                   --FEC_NOTIF_REC = TO_DATE(C_FEC_GENERACION_DOC,'DD/MM/YYYY')--FECHA ACTUALIZADA TEMPORALMENTE, DEBE ACTUALIZARSE CON EL STD. FALTA!!.
                WHERE MULT.ID_MULTA = N_ID_MULTA;*/
                UPDATE T_SCOB_MULTA MULT
                   SET FEC_EMISION_REC = TO_DATE(C_FEC_GENERACION_DOC, 'DD/MM/YYYY')
                 WHERE MULT.ID_MULTA IN (SELECT ID_MULTA
                                           FROM T_SCOB_EXPEDIENTE_MULTA
                                          WHERE ID_EXPEDIENTE = V_ID_EXPEDIENTE
                                            AND ESTADO = '1');
                -- @dcelis Req.44
            
                --VERIFICAR SI LA MULTA CORRESPONDE A UNA MULTA ANTIDUMPING
                IF C_FLG_MULTA_RESOLUTIVO = '0' THEN
                    SCOB_SP_ANTIDUMPING_INTERES(N_ID_MULTA, PO_N_COD_ERROR, PO_V_MSJ_ERROR);
                    IF PO_N_COD_ERROR < 0 THEN
                        ROLLBACK;
                        RETURN;
                    END IF;
                END IF;
            
                N_CONT := N_CONT + 1;
                /*-- PROCESO PARA VARIAS MULTAS POR EXPEDIENTE
                FOR A1 IN (SELECT EXMU.ID_MULTA AS ID_MULTA, MULT.FLG_MULTA_RESOLUTIVO AS FLG_MULTA_RESOLUTIVO
                FROM T_SCOB_EXPEDIENTE_MULTA EXMU
                INNER JOIN T_SCOB_MULTA MULT
                      ON MULT.ID_MULTA = EXMU.ID_MULTA
                      AND MULT.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
                WHERE EXMU.ID_EXPEDIENTE = TO_NUMBER(V_ID_EXPEDIENTE)
                AND EXMU.ESTADO = 1) LOOP
                  --
                  --ACTUALIZAR LA FECHA DE GENERACION DE LA REC
                  UPDATE T_SCOB_MULTA MULT
                  SET
                     FEC_EMISION_REC = TO_DATE(C_FEC_GENERACION_DOC,'DD/MM/YYYY')--,
                     --FEC_NOTIF_REC = TO_DATE(C_FEC_GENERACION_DOC,'DD/MM/YYYY')--FECHA ACTUALIZADA TEMPORALMENTE, DEBE ACTUALIZARSE CON EL STD. FALTA!!.
                  WHERE MULT.ID_MULTA = A1.FLG_MULTA_RESOLUTIVO;
                  --VERIFICAR SI LA MULTA CORRESPONDE A UNA MULTA ANTIDUMPING
                  IF A1.FLG_MULTA_RESOLUTIVO = '0' THEN
                    SCOB_SP_ANTIDUMPING_INTERES(A1.ID_MULTA, po_n_cod_error, po_v_msj_error);
                    if po_n_cod_error < 0 then
                      rollback;
                      return;
                    end if;
                  END IF;
                  --
                END LOOP;
                --
                N_CONT := N_CONT + 1;*/
            -- FIN
            END LOOP;
        ELSIF PI_I_COD_TIPO_ASOCIACION = SCOB_PK_CONSTANTES.C_TIP_ASOC_PRECOACTIVO THEN
            UPDATE T_SCOB_MULTA MULT
               SET FEC_ULT_GEN_PRECOACTIVA = TO_DATE(C_FEC_GENERACION_DOC, 'DD/MM/YYYY')
             WHERE MULT.ID_MULTA IN (SELECT EXMU.ID_MULTA
                                       FROM T_SCOB_EXPEDIENTE_MULTA EXMU
                                      WHERE INSTR(PI_V_ID_EXPEDIENTE, '|' || TO_CHAR(EXMU.ID_EXPEDIENTE) || '|') > 0
                                        AND EXMU.ESTADO = '1');
        
        END IF;
        
        --INICIO VICTOR BENDEZU - MIGRACION SICOB A SIA   
        SELECT EXMU.ID_MULTA
          INTO N_ID_MULTA
          FROM T_SCOB_EXPEDIENTE_MULTA EXMU
         WHERE INSTR(PI_V_ID_EXPEDIENTE, '|' || TO_CHAR(EXMU.ID_EXPEDIENTE) || '|') > 0
           AND EXMU.ESTADO = '1'
           AND ROWNUM = 1;
        
        USR_SIA_INTFZ.PKG_INTFZ_REG_MULTA_SICOB_SIA.SP_I_COACTIVO_SICOB_A_SIA(PIN_NU_ID_MULTA => N_ID_MULTA,
                                                                              POUT_NU_COD_RESULT => PO_N_RETORNO,
                                                                              POUT_VC_MSG_RESULT => PO_V_MSJ_ERROR);
        
        IF PO_N_RETORNO < 0 THEN
           ROLLBACK;
           RETURN;
        END IF;
        --FIN VICTOR BENDEZU - MIGRACION SICOB A SIA
        
        PO_N_COD_ERROR := 0;
        PO_N_RETORNO   := N_GENERADOR_DOCUMENTO;
    
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

    PROCEDURE SCOB_SP_I_GEN_DOCS_BY_SUSPEN
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 14/05/2011
        -- Proposito    : insertar los documentos plantillas generados por el sistema por una solicitud de suspension
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (
     /*01*/PI_N_ID_EXPEDIENTE IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
     --
     /*02*/
     PI_C_FLG_OFICIO IN T_SCOB_EXPED_SUSPENDER.FLG_OFICIO%TYPE,
     /*03*/
     PI_N_ID_SOLIC_SUSPENDER IN T_SCOB_EXPED_SUSPENDER.ID_EXPED_SUSPENDER%TYPE,
     /*04*/
     PI_N_NU_ID_EMPRESA IN NUMBER,
     /*05*/
     PI_N_VC_ANIO_CARTA IN NUMBER,
     /*06*/
     PI_N_NU_ID_CARTA_FIANZA IN NUMBER,
     
     /*07*/
     PI_I_COD_TIPO_ASOCIACION IN T_SCOB_EXPED_SUSPENDER_DOC.COD_TIPO_ASOCIACION%TYPE, --NUEVO
     /*
                                               1 = SUSPENSION
                                               2 = LEVANTE
                                               3 = DENEGAR
                                               */
     --
     /*08*/
     PI_N_ID_MOTIVO IN T_SCOB_EXPEDIENTE_ESTADO.ID_MOTIVO%TYPE,
     /*09*/
     PI_V_ID_PLANTILLA IN VARCHAR2, --CADENA DE PLANTILLAS (EL PRIMERO SIEMPRE DEBE SER LA RESOLUCION, SI ES EL CASO)
     /*10*/
     PI_V_MOTIVO_PLANTILLA IN VARCHAR2, --CADENA DE MOTIVOS PLANTILLAS (EL PRIMERO SIEMPRE DEBE SER LA RESOLUCION, SI ES EL CASO)
     /*11*/
     PI_N_NRO_ITEMSP IN NUMBER, --SI SE ENVIAN DOS DOCUMENTO, SIEMPRE DEBE ESTAR LA REC PRIMERO.
     --
     /*12*/
     PI_V_TIPO_ENTIDAD IN VARCHAR, --0=NINGUNO;1=PERSONA;2=BANCO;3=DIREC PERSONAS;4=SUNAT;5=PNP;6=SAT;7=CAJA METROPOLITANA
     /*13*/
     PI_V_ID_TIPO_ENTIDAD IN VARCHAR, --entidades a quienes va dirigido
     /*14*/
     PI_V_NRO_ITEMSTE IN VARCHAR, --cadena con los numero de entidades a quienes ira dirigido
     --
     /*15*/
     PI_I_ESTADO_SOLICITUD IN T_SCOB_EXPED_SUSPENDER.ESTADO_SOLICITUD%TYPE, --solo enviar si cambia de estado, sino "0"
     /*16*/
     PI_I_ESTADO_EXPEDIENTE IN T_SCOB_EXPEDIENTE.ESTADO_EXPEDIENTE%TYPE,
     --
     /*17*/
     PI_N_ID_SERVICIO IN NUMBER,
     /*18*/
     PI_V_ID_TIPO_SERVICIO IN VARCHAR2,
     /*19*/
     PI_C_FLG_UCI IN CHAR,
     --
     /*20*/
     PI_V_AUDUSUCREACION IN T_SCOB_EXPEDIENTE_DOCUMENTO.AUDUSUCREACION%TYPE,
     /*21*/
     PI_N_ID_USUARIO_INGRESO IN T_SCOB_USUARIO.ID_USUARIO%TYPE,
     /*22*/
     PI_V_FEC_GENERACION_DOC IN VARCHAR,
     PO_N_RETORNO            OUT NUMBER,
     PO_N_RETORNO_DET        OUT NUMBER, --nvo ID SOLICITUD
     PO_N_COD_ERROR          OUT NUMBER,
     PO_V_MSJ_ERROR          OUT VARCHAR2) IS
        N_GENERADOR_DOCUMENTO NUMBER;
        N_ID_SOLIC_SUSPENDER  T_SCOB_EXPED_SUSPENDER.ID_EXPED_SUSPENDER%TYPE;
        PI_V_ID_EXPEDIENTE    VARCHAR(20);
        --  I_EXISTE                                INTEGER;
    BEGIN
        PO_V_MSJ_ERROR := '';
        PO_N_RETORNO   := 0;
        PO_N_COD_ERROR := -1;
    
        PI_V_ID_EXPEDIENTE := '|' || TO_CHAR(PI_N_ID_EXPEDIENTE) || '|';
    
        --VALIDA EL CAMBIO DE ESTADO:03.11.2011
        IF PI_I_COD_TIPO_ASOCIACION = SCOB_PK_CONSTANTES.C_TIP_ASOC_SUSPENDER THEN
            SCOB_PK_VALIDA_ESTADO.SCOB_SP_S_VAL_ESTADO_EXPED(PI_N_ID_EXPEDIENTE,
                                                             PI_I_ESTADO_EXPEDIENTE, --NUEVO ESTADO
                                                             PI_N_ID_MOTIVO, --NUEVO MOTIVO
                                                             PO_N_COD_ERROR,
                                                             PO_V_MSJ_ERROR);
            IF PO_N_COD_ERROR < 0 THEN
                PO_N_RETORNO := PO_N_COD_ERROR;
                RETURN;
            END IF;
        END IF;
    
        N_ID_SOLIC_SUSPENDER := PI_N_ID_SOLIC_SUSPENDER;
    
        --si es LEVANTE obtener la solicitud que genero la suspension.
        IF PI_I_COD_TIPO_ASOCIACION = SCOB_PK_CONSTANTES.C_TIP_ASOC_SUSPENDER_LEVANTE THEN
            --LEVANTE
            SELECT ID_EXPED_SUSPENDER
              INTO N_ID_SOLIC_SUSPENDER
              FROM (SELECT EXSU.ID_EXPED_SUSPENDER AS ID_EXPED_SUSPENDER
                      FROM T_SCOB_EXPED_SUSPENDER EXSU
                     WHERE EXSU.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
                       AND EXSU.ESTADO_SOLICITUD = '2' --ESTADO CERRADA
                       AND EXSU.ESTADO = '1'
                       AND NVL(EXSU.FLG_LEVANTE, '0') = '0'
                     ORDER BY EXSU.ID_EXPED_SUSPENDER DESC)
             WHERE ROWNUM = 1;
        
        END IF;
    
        --si es oficio, se crea la solicitud como cerrada.
        IF PI_C_FLG_OFICIO = '1' AND
           N_ID_SOLIC_SUSPENDER = 0 THEN
        
            SELECT SCOB_SQ_EXPED_SUSPENDER.NEXTVAL INTO N_ID_SOLIC_SUSPENDER FROM DUAL;
            INSERT INTO T_SCOB_EXPED_SUSPENDER
                (ID_EXPED_SUSPENDER, ID_EXPEDIENTE, NRO_SOLICITUD, FEC_RECEPCION_TRAMITE, NRO_DOCUMENTO_TRAMITE, FEC_INGRESO_TRAMITE,
                 ID_USUARIO_INGRESO, ESTADO_SOLICITUD, FLG_OFICIO, FEC_CIERRE_TRAMITE, ESTADO, AUDFECCREACION, AUDUSUCREACION, FLG_LEVANTE)
            VALUES
                (N_ID_SOLIC_SUSPENDER, PI_N_ID_EXPEDIENTE, 'SOFI-' || TO_CHAR(N_ID_SOLIC_SUSPENDER), SYSDATE,
                  --FEC_RECEPCION_TRAMITE
                 'SOFI-' || TO_CHAR(N_ID_SOLIC_SUSPENDER),
                  --NRO_DOCUMENTO_TRAMITE
                 SYSDATE,
                  --FEC_INGRESO_TRAMITE
                 PI_N_ID_USUARIO_INGRESO, DECODE(PI_N_NU_ID_EMPRESA, '0', '2', '1'),
                  --ESTADO CERRADA, SINO, PENDIENTE
                 PI_C_FLG_OFICIO, DECODE(PI_N_NU_ID_EMPRESA, 0, SYSDATE, NULL),
                  --FEC_CIERRE_TRAMITE
                 '1',
                  --ESTADO REGISTRO
                 SYSDATE, PI_V_AUDUSUCREACION, '0'
                  --FLG_LEVANTE
                 );
        END IF;
    
        SCOB_SP_I_GENERA_DOCUMENTO(PI_V_ID_EXPEDIENTE,
                                   1, --PI_N_NRO_ITEMS,
                                   PI_N_ID_MOTIVO,
                                   PI_V_ID_PLANTILLA,
                                   PI_V_MOTIVO_PLANTILLA,
                                   PI_N_NRO_ITEMSP,
                                   NULL, --PI_V_ID_COSTAS,
                                   NULL, --PI_V_POR_COSTAS,
                                   NULL, --PI_V_VAL_COSTAS,
                                   NULL, --PI_V_CNT_COSTAS,
                                   NULL, --PI_V_SUB_TOTAL_COSTAS,
                                   0, --PI_N_TOTAL_COSTAS,
                                   NULL, --PI_N_NRO_ITEMSC,
                                   PI_I_ESTADO_EXPEDIENTE,
                                   0, --PI_N_ID_EXP_DOC_ORIGEN,
                                   PI_V_TIPO_ENTIDAD,
                                   PI_V_ID_TIPO_ENTIDAD,
                                   PI_V_NRO_ITEMSTE,
                                   PI_N_ID_SERVICIO,
                                   PI_V_ID_TIPO_SERVICIO,
                                   PI_C_FLG_UCI,
                                   PI_V_AUDUSUCREACION,
                                   PI_N_ID_USUARIO_INGRESO,
                                   PI_V_FEC_GENERACION_DOC,
                                   '0', --FLG_GEN_REC
                                   N_GENERADOR_DOCUMENTO,
                                   PO_N_COD_ERROR,
                                   PO_V_MSJ_ERROR);
    
        IF PO_N_COD_ERROR < 0 THEN
            ROLLBACK;
            RETURN;
        END IF;
    
        --insertar los documentos generados por solicitud de suspension
        INSERT INTO T_SCOB_EXPED_SUSPENDER_DOC
            (ID_EXPED_SUSPENDER_DOC, ID_EXPED_SUSPENDER, ID_EXPEDIENTE_DOCUMENTO, COD_TIPO_ASOCIACION, ESTADO, AUDFECCREACION, AUDUSUCREACION)
            SELECT SCOB_SQ_EXPED_SUSPENDER_DOC.NEXTVAL,
                   N_ID_SOLIC_SUSPENDER,
                   EXDO.ID_EXPEDIENTE_DOCUMENTO,
                   PI_I_COD_TIPO_ASOCIACION,
                   SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO,
                   SYSDATE,
                   PI_V_AUDUSUCREACION
              FROM T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
             WHERE EXDO.COD_GENERADOR_DOCUMENTO = N_GENERADOR_DOCUMENTO;
    
        --actualiza el estado de la solicitud
        CASE
        
            WHEN PI_I_ESTADO_SOLICITUD = '0' AND
                 PI_I_COD_TIPO_ASOCIACION = SCOB_PK_CONSTANTES.C_TIP_ASOC_SUSPENDER_LEVANTE THEN
            
                --actualiza el estado de levante de la solicitud
                UPDATE T_SCOB_EXPED_SUSPENDER EXSU
                   SET FLG_LEVANTE        = '1',
                       FEC_LEVANTE        = SYSDATE,
                       ID_USUARIO_LEVANTE = PI_N_ID_USUARIO_INGRESO,
                       AUDFECMODIFICACION = SYSDATE,
                       AUDUSUMODIFICACION = PI_V_AUDUSUCREACION
                 WHERE EXSU.ID_EXPED_SUSPENDER = N_ID_SOLIC_SUSPENDER;
            
                --actualizar el estado del expediente
                SCOB_PK_EXPEDIENTE.SCOB_SP_I_EXPEDIENTE_ESTADO(PI_N_ID_EXPEDIENTE,
                                                               PI_N_ID_MOTIVO,
                                                               SCOB_PK_CONSTANTES.C_TBL_EST_EXP_EN_GIRO,
                                                               PI_V_AUDUSUCREACION,
                                                               PO_N_COD_ERROR,
                                                               PO_V_MSJ_ERROR);
            
                IF PO_N_COD_ERROR < 0 THEN
                    PO_N_COD_ERROR := -13;
                    PO_V_MSJ_ERROR := 'No se puede realizar la accion. Se presento error al intentar actualizar el estado del expediente.';
                    RETURN;
                END IF;
            
            WHEN PI_I_ESTADO_SOLICITUD = '2' OR --cerrada
                 PI_I_ESTADO_SOLICITUD = '3' THEN
                --no a lugar = denegada
            
                UPDATE T_SCOB_EXPED_SUSPENDER EXSU
                   SET ESTADO_SOLICITUD   = PI_I_ESTADO_SOLICITUD,
                       FEC_CIERRE_TRAMITE = SYSDATE,
                       AUDFECMODIFICACION = SYSDATE,
                       AUDUSUMODIFICACION = PI_V_AUDUSUCREACION
                 WHERE EXSU.ID_EXPED_SUSPENDER = N_ID_SOLIC_SUSPENDER;
            
        END CASE;
    
        IF PI_N_NU_ID_EMPRESA <> 0 THEN
        
            --inserta la relacion garantia asociada a la solicitud de suspension
            SCOB_PK_STD_INTERFAZ.SCOB_SP_I_GARANTIAS(PI_N_ID_EXPEDIENTE,
                                                     SCOB_PK_CONSTANTES.C_TIPO_GARANTIA_SUSPENSION, --PI_I_COD_TIPO_ENTIDAD
                                                     N_ID_SOLIC_SUSPENDER, --PI_N_ID_SOLIC_SUSP_FRACC
                                                     PI_N_ID_USUARIO_INGRESO,
                                                     PI_V_AUDUSUCREACION,
                                                     PI_N_NU_ID_EMPRESA,
                                                     PI_N_VC_ANIO_CARTA,
                                                     PI_N_NU_ID_CARTA_FIANZA,
                                                     PO_N_COD_ERROR,
                                                     PO_V_MSJ_ERROR);
        
            --FALTA ACTUALIZAR LA ASOCION GARANTIA EXPEDIENTE CON LA VISTA.
        END IF;
    
        PO_N_RETORNO     := N_GENERADOR_DOCUMENTO;
        PO_N_COD_ERROR   := N_GENERADOR_DOCUMENTO;
        PO_N_RETORNO_DET := N_ID_SOLIC_SUSPENDER;
    
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

    PROCEDURE SCOB_SP_I_GEN_DOCS_BY_FRACCION
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 16.05.2011
        -- Proposito    : insertar los documentos plantillas generados por el sistema por una solicitud de fraccionamiento
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   : 2023-02-14
        -- Proposito    : Procesos en linea
        -----------------------------------------------------------
        */
    (
     /*01*/PI_N_ID_EXPEDIENTE IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
     --
     /*02*/
     PI_N_ID_EXPED_FRACCIONAR IN T_SCOB_EXPED_FRACCIONAR.ID_EXPED_FRACCIONAR%TYPE,
     /*03*/
     PI_I_COD_TIPO_ASOCIACION IN T_SCOB_EXPED_FRACCIONAR_DOC.COD_TIPO_ASOCIACION%TYPE,
     /*
                                               1=Denegar
                                               2=Generar Suspension --resol-gaf = "fraccionado"
                                               3=Aprobar Resolucion
                                               4=Solicitar Garantia
                                               5=Requerir Pago --est_ant=fraccionado;
                                               6=A Perdida --est_ant=fraccionado; est_act=fraccionado
                                               7=Dejar Sin Efecto Fraccionamiento --est_ant=fraccionado; est_act=en giro
                                               8=Cancelar Fraccionamiento  --est_ant=fraccionado; est_act=en giro
                                               */
     /*04*/
     PI_N_NU_ID_EMPRESA IN NUMBER,
     /*05*/
     PI_N_VC_ANIO_CARTA IN NUMBER,
     /*06*/
     PI_N_NU_ID_CARTA_FIANZA IN NUMBER,
     
     --
     /*07*/
     PI_N_ID_MOTIVO IN T_SCOB_EXPEDIENTE_ESTADO.ID_MOTIVO%TYPE,
     /*08*/
     PI_V_ID_PLANTILLA IN VARCHAR2, --CADENA DE PLANTILLAS (EL PRIMERO SIEMPRE DEBE SER LA RESOLUCION, SI ES EL CASO)
     /*09*/
     PI_V_MOTIVO_PLANTILLA IN VARCHAR2, --CADENA DE MOTIVOS PLANTILLAS (EL PRIMERO SIEMPRE DEBE SER LA RESOLUCION, SI ES EL CASO)
     /*10*/
     PI_N_NRO_ITEMSP IN NUMBER, --SI SE ENVIAN DOS DOCUMENTO, SIEMPRE DEBE ESTAR LA REC PRIMERO.
     --
     /*11*/
     PI_V_TIPO_ENTIDAD IN VARCHAR, --0=NINGUNO;1=PERSONA;2=BANCO;3=DIREC PERSONAS;4=SUNAT;5=PNP;6=SAT;7=CAJA METROPOLITANA
     /*12*/
     PI_V_ID_TIPO_ENTIDAD IN VARCHAR, --entidades a quienes va dirigido
     /*13*/
     PI_V_NRO_ITEMSTE IN VARCHAR, --cadena con los numero de entidades a quienes ira dirigido
     --
     /*14*/
     PI_I_ESTADO_SOLICITUD IN T_SCOB_EXPED_FRACCIONAR.ESTADO_SOLICITUD%TYPE, --solo enviar si cambia de estado, sino "0"
     /*15*/
     PI_I_ESTADO_EXPEDIENTE IN T_SCOB_EXPEDIENTE.ESTADO_EXPEDIENTE%TYPE,
     --
     /*16*/
     PI_N_ID_SERVICIO IN NUMBER,
     /*17*/
     PI_V_ID_TIPO_SERVICIO IN VARCHAR2,
     /*18*/
     PI_C_FLG_UCI IN CHAR,
     --
     /*20*/
     PI_V_AUDUSUCREACION IN T_SCOB_EXPEDIENTE_DOCUMENTO.AUDUSUCREACION%TYPE,
     /*21*/
     PI_N_ID_USUARIO_INGRESO IN T_SCOB_USUARIO.ID_USUARIO%TYPE,
     /*22*/
     PI_V_FEC_GENERACION_DOC IN VARCHAR,
     PI_C_VALIDA_GARANTIA    IN CHAR, --'1=VALIDA;0=NO VALIDA'
     PO_N_RETORNO            OUT NUMBER,
     PO_N_COD_ERROR          OUT NUMBER,
     PO_V_MSJ_ERROR          OUT VARCHAR2) IS
        N_GENERADOR_DOCUMENTO      NUMBER;
        PI_V_ID_EXPEDIENTE         VARCHAR(20);
        I_EXISTE                   INTEGER;
        I_ESTADO_EXPEDIENTE_ACTUAL INTEGER;
    
        N_VALOR_UIT_GARANTIA T_SCOB_MULTA_DETAL.VALOR_UIT%TYPE;
        N_MONTO_UIT          T_SCOB_UIT.MONTO_UIT%TYPE;
        N_SALDO_EXPEDIENTE   T_SCOB_EXPEDIENTE.SALDO%TYPE;
        D_FEC_FRACCIONAR     T_SCOB_EXPED_FRACCIONAR.FEC_INGRESO_TRAMITE%TYPE;
    
        N_NUEVA_DEUDA      T_SCOB_MULTA.MONTO_UIT%TYPE;
        N_VALOR_UIT        T_SCOB_MULTA.MONTO_UIT%TYPE;
        N_TOTAL_AMORTIZADO T_SCOB_MULTA.MONTO_UIT%TYPE;
        N_ID_MULTA         T_SCOB_MULTA.ID_MULTA%TYPE;
    
        N_TOTAL_AMORT_UIT_Y_COSTAS T_SCOB_MULTA.MONTO_UIT%TYPE;
        N_MONTO_CAPITAL            T_SCOB_MULTA.MONTO_UIT%TYPE;
        N_MONTO_CAPITAL_Y_COSTAS   T_SCOB_MULTA.MONTO_UIT%TYPE;
    
        D_FEC_EMISION_REC   T_SCOB_MULTA.FEC_EMISION_REC%TYPE;
        I_ESTADO_EXPEDIENTE T_SCOB_EXPEDIENTE.ESTADO_EXPEDIENTE%TYPE;
    
        /*
        N_POR_MONTO_FRACC_DESP                  T_SCOB_EXPED_FRACCIONAR.MONTO_INTERES_TIEL%TYPE;
        N_NRO_DIAS_FRACC_DESP                   NUMBER;
        N_POR_MONTO_FRACC_ANTES                 T_SCOB_EXPED_FRACCIONAR.MONTO_INTERES_TIEL%TYPE;
        N_NRO_DIAS_FRACC_ANTES                  NUMBER;
        D_FEC_RESOLUCION_GAF                    T_SCOB_EXPED_FRACCIONAR.FEC_RESOLUCION_GAF%TYPE;
        N_FEC_EVALUADA                          T_SCOB_EXPED_FRACCIONAR.FEC_RESOLUCION_GAF%TYPE;
        D_FEC_NOTIF_REC                         T_SCOB_MULTA.FEC_NOTIF_REC%TYPE;
        */
    BEGIN
        PO_V_MSJ_ERROR := '';
        PO_N_RETORNO   := 0;
        PO_N_COD_ERROR := -1;
    
        /*obtener el estado actual del expediente*/
        SELECT EXPE.ESTADO_EXPEDIENTE INTO I_ESTADO_EXPEDIENTE_ACTUAL FROM T_SCOB_EXPEDIENTE EXPE WHERE EXPE.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE;
        DBMS_OUTPUT.put_line('SCOB_SP_I_GEN_DOCS_BY_FRACCION>>PI_N_ID_EXPEDIENTE>>' || PI_N_ID_EXPEDIENTE);
        IF ((PI_I_COD_TIPO_ASOCIACION = SCOB_PK_CONSTANTES.C_TIPO_ASOC_REQUERIR_PAGO OR
           PI_I_COD_TIPO_ASOCIACION = SCOB_PK_CONSTANTES.C_TIPO_ASOC_A_PERDIDA OR
           PI_I_COD_TIPO_ASOCIACION = SCOB_PK_CONSTANTES.C_TIPO_ASOC_DEJAR_SIN_EFCTO OR
           PI_I_COD_TIPO_ASOCIACION = SCOB_PK_CONSTANTES.C_TIPO_ASOC_CANCELA_FRACCIONAR) AND
           (I_ESTADO_EXPEDIENTE_ACTUAL <> SCOB_PK_CONSTANTES.C_TBL_EST_EXP_FRACCIONADO)) THEN
        
            PO_V_MSJ_ERROR := 'No se puede realizar la accion. El estado del expediente debe ser Fraccionado.';
            PO_N_COD_ERROR := -10;
            RETURN;
        
        END IF;
    
        IF PI_I_COD_TIPO_ASOCIACION = SCOB_PK_CONSTANTES.C_TIPO_ASOC_CANCELA_FRACCIONAR THEN
            --CANCELADO
            --VERIFICA SI EL CRONOGRAMA ASOCIADO A LA SOLICITUD SE ENCUENTRA CANCELADO O PAGADO.
            SELECT COUNT(EXCRO.ID_EXPED_CRONOGRAMA_PAGO)
              INTO I_EXISTE
              FROM T_SCOB_EXPED_CRONOGRAMA EXCRO
             WHERE EXCRO.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
               AND EXCRO.COD_TIPO_CRONOGRAMA = SCOB_PK_CONSTANTES.C_COD_TIPO_CRONO_FRACCIONAR --FRACCIONAMIENTO
               AND EXCRO.ID_COD_TIPO_CRONOGRAMA = PI_N_ID_EXPED_FRACCIONAR
               AND EXCRO.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
               AND EXCRO.ESTADO_CRONOGRAMA = SCOB_PK_CONSTANTES.C_COD_EST_CRONO_PAGO_CERRADO; --CRONOGRAMA PAGADO
        
            IF I_EXISTE = 0 THEN
                PO_V_MSJ_ERROR := 'No se puede realizar la accion. Para cancelar el fraccionamiento las cuotas del cronograma deben estar canceladas.';
                PO_N_COD_ERROR := -11;
                RETURN;
            END IF;
        END IF;
    
        /*validar si el tipo de asociacion ya se encuentra generado para la solicitud*/
        SELECT COUNT(EXFR.ID_EXPED_FRACCIONAR_DOC)
          INTO I_EXISTE
          FROM T_SCOB_EXPED_FRACCIONAR_DOC EXFR
         WHERE EXFR.ID_EXPED_FRACCIONAR = PI_N_ID_EXPED_FRACCIONAR
           AND EXFR.COD_TIPO_ASOCIACION = PI_I_COD_TIPO_ASOCIACION
           AND EXFR.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO;
    DBMS_OUTPUT.put_line('SCOB_SP_I_GEN_DOCS_BY_FRACCION>>PI_N_ID_EXPED_FRACCIONAR>>' || PI_N_ID_EXPED_FRACCIONAR);
    DBMS_OUTPUT.put_line('SCOB_SP_I_GEN_DOCS_BY_FRACCION>>I_EXISTE>>' || I_EXISTE);
        IF I_EXISTE > 0 THEN
            PO_V_MSJ_ERROR := 'No se puede realizar la accion. Este tipo de documento antes ha sido generado.';
            PO_N_COD_ERROR := -12;
            RETURN;
        END IF;
    
        --OBTENER LOS DATOS DE LA MULTA ASOCIADO AL EXPEDIENTE
        SELECT EXMU.ID_MULTA,
               MULT.FEC_EMISION_REC
          INTO N_ID_MULTA,
               D_FEC_EMISION_REC
          FROM T_SCOB_EXPEDIENTE_MULTA EXMU
         INNER JOIN T_SCOB_MULTA MULT
            ON MULT.ID_MULTA = EXMU.ID_MULTA
         WHERE EXMU.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
           AND EXMU.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
              -- @dcelis - prueba
           AND ROWNUM = 1;
    
        --obtener los saldos de la multa
        SELECT MULT.TOTAL_AMORTIZADO,
               MDET.VALOR_UIT,
               MULT.TOTAL_AMORTIZADO + MULT.TOTAL_AMORTIZADO_COSTAS, --para validacion parametros fraccionamiento
               MULT.MONTO_UIT,
               MULT.MONTO_UIT + MULT.MONTO_COSTAS, --para validaciones parametros fraccionamiento
               MULT.SALDO
          INTO N_TOTAL_AMORTIZADO,
               N_VALOR_UIT,
               N_TOTAL_AMORT_UIT_Y_COSTAS,
               N_MONTO_CAPITAL,
               N_MONTO_CAPITAL_Y_COSTAS,
               N_SALDO_EXPEDIENTE --SALDO CAPITAL
          FROM T_SCOB_MULTA MULT
         INNER JOIN T_SCOB_MULTA_DETAL MDET
            ON MDET.ID_MULTA = MULT.ID_MULTA
           AND MDET.FLG_ACTUAL = '1'
         WHERE MULT.ID_MULTA = N_ID_MULTA;
    DBMS_OUTPUT.put_line('SCOB_SP_I_GEN_DOCS_BY_FRACCION>>PI_I_COD_TIPO_ASOCIACION>>' || PI_I_COD_TIPO_ASOCIACION);
        IF PI_I_COD_TIPO_ASOCIACION = SCOB_PK_CONSTANTES.C_TIPO_ASOC_SUSPEND_FRACCIONAR THEN
            --VALIDA EL CAMBIO DE ESTADO:03.11.2011
            SCOB_PK_VALIDA_ESTADO.SCOB_SP_S_VAL_ESTADO_EXPED(PI_N_ID_EXPEDIENTE,
                                                             PI_I_ESTADO_EXPEDIENTE, --NUEVO ESTADO
                                                             PI_N_ID_MOTIVO, --NUEVO MOTIVO
                                                             PO_N_COD_ERROR,
                                                             PO_V_MSJ_ERROR);
            IF PO_N_COD_ERROR < 0 THEN
                PO_N_RETORNO := PO_N_COD_ERROR;
                RETURN;
            END IF;
            /*
            --VALIDAR CUMPLIMIENTO DE LOS PARAMETROS DE FRACCIONAMIENTO:27.01.2012
            --1:obtener los valores de los parametros...
            SELECT SCOB_PK_UTILITARIO.SCOB_FN_TEXTO_A_NUMERO(TD.TXT_VALOR1),
                   SCOB_PK_UTILITARIO.SCOB_FN_TEXTO_A_NUMERO(TD.TXT_VALOR2)
            INTO N_POR_MONTO_FRACC_ANTES, N_NRO_DIAS_FRACC_ANTES
            FROM T_SCOB_TABLA_DET TD
            WHERE TD.ID_TABLA = SCOB_PK_CONSTANTES.C_TBL_PARAMETRO_SISTEMA
            AND TO_NUMBER(TD.COD_INTERNO)=(4);
            SELECT SCOB_PK_UTILITARIO.SCOB_FN_TEXTO_A_NUMERO(TD.TXT_VALOR1),
                   SCOB_PK_UTILITARIO.SCOB_FN_TEXTO_A_NUMERO(TD.TXT_VALOR2)
            INTO N_POR_MONTO_FRACC_DESP, N_NRO_DIAS_FRACC_DESP
            FROM T_SCOB_TABLA_DET TD
            WHERE TD.ID_TABLA = SCOB_PK_CONSTANTES.C_TBL_PARAMETRO_SISTEMA
            AND TO_NUMBER(TD.COD_INTERNO)=(5);
            
            --2:obtener la fecha de resolucion gaf
            SELECT EF.FEC_RESOLUCION_GAF
            INTO D_FEC_RESOLUCION_GAF
            FROM T_SCOB_EXPED_FRACCIONAR EF
            WHERE EF.ID_EXPED_FRACCIONAR = PI_N_ID_EXPED_FRACCIONAR;
            --3:obtener la fecha de notificacion de la rec
            SELECT FEC_NOTIF_REC
            INTO D_FEC_NOTIF_REC
            FROM T_SCOB_MULTA MULT
            WHERE MULT.ID_MULTA = N_ID_MULTA;
            
            --VALIDACIONES:si la fecha gaf es menor a X dias y se cancelo Y % del capital
            
            N_FEC_EVALUADA := SCOB_PK_UTILITARIO.SCOB_FN_DIAS_VALIDOS(
                                               D_FEC_NOTIF_REC,
                                               N_NRO_DIAS_FRACC_ANTES,0);
            
             ---
            IF D_FEC_RESOLUCION_GAF <= N_FEC_EVALUADA THEN
                IF N_TOTAL_AMORTIZADO < (N_MONTO_CAPITAL*(N_POR_MONTO_FRACC_ANTES/100)) THEN
                    --VALIDA EL IMPORTE DE PAGO
                    po_v_msj_error :='No se puede realizar la accion. ' ||
                    'Antes, se debe cancelar el ' || TO_CHAR(N_POR_MONTO_FRACC_ANTES) || '%' ||
                    ' de la multa.';
                    po_n_cod_error := -13;
                    return;
                END IF;
            ELSE
                N_FEC_EVALUADA := SCOB_PK_UTILITARIO.SCOB_FN_DIAS_VALIDOS(
                                                                D_FEC_NOTIF_REC,
                                                                N_NRO_DIAS_FRACC_DESP,0);
            
                IF D_FEC_RESOLUCION_GAF >= N_FEC_EVALUADA THEN
                   IF N_TOTAL_AMORT_UIT_Y_COSTAS < (N_MONTO_CAPITAL_Y_COSTAS*(N_POR_MONTO_FRACC_DESP/100)) THEN
                       --VALIDA EL IMPORTE DE PAGO
                       po_v_msj_error :='No se puede realizar la accion. ' ||
                       'Antes, se debe cancelar el ' || TO_CHAR(N_POR_MONTO_FRACC_DESP) || '%' ||
                       ' de la multa.';
                       po_n_cod_error := -14;
                       return;
                   END IF;
                END IF;
            
            END IF;
            ---
            */
        END IF;
    
        IF PI_I_COD_TIPO_ASOCIACION = SCOB_PK_CONSTANTES.C_TIPO_ASOC_SUSPEND_FRACCIONAR OR --aprobar resolucion gaf
           PI_I_COD_TIPO_ASOCIACION = SCOB_PK_CONSTANTES.C_TIPO_ASOC_APROBAR_RESOLUCION --aprobar resolucion
         THEN
        
            --obtener el valor uit para aplicar garantia
            SELECT SCOB_PK_UTILITARIO.SCOB_FN_TEXTO_A_NUMERO(TD.TXT_VALOR1)
              INTO N_VALOR_UIT_GARANTIA
              FROM T_SCOB_TABLA_DET TD
             WHERE TD.ID_TABLA = SCOB_PK_CONSTANTES.C_TBL_PARAMETRO_SISTEMA
               AND TO_NUMBER(TD.COD_INTERNO) = 8
             ORDER BY TO_NUMBER(TD.COD_INTERNO);
        
            --obtener la fecha de recepcion del tramite
            SELECT F.FEC_RECEPCION_TRAMITE
              INTO D_FEC_FRACCIONAR
              FROM T_SCOB_EXPED_FRACCIONAR F
             WHERE F.ID_EXPED_FRACCIONAR = PI_N_ID_EXPED_FRACCIONAR;
            --
            --obtener el monto por uit
            N_MONTO_UIT := NULL;
            SELECT UIT.MONTO_UIT
              INTO N_MONTO_UIT
              FROM T_SCOB_UIT UIT
             WHERE D_FEC_FRACCIONAR BETWEEN UIT.FECHA_INICIO AND UIT.FECHA_FIN
               AND UIT.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO;
        
            --si el saldo CAPITAl del expediente supera X uit
            IF N_SALDO_EXPEDIENTE > (NVL(N_MONTO_UIT, 1) * NVL(N_VALOR_UIT_GARANTIA, 1)) AND
               PI_C_VALIDA_GARANTIA = '1' --VALIDA GARANTIA.
             THEN
            
                IF NVL(PI_N_NU_ID_EMPRESA, 0) = 0 THEN
                
                    --verifica si existe garantias asociadas
                    SELECT COUNT(EXFG.ID_EXPEDIENTE_GARANTIA)
                      INTO I_EXISTE
                      FROM T_SCOB_EXPEDIENTE_GARANTIA EXFG
                     WHERE EXFG.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
                       AND EXFG.COD_TIPO_ENTIDAD = SCOB_PK_CONSTANTES.C_TIPO_GARANTIA_FRACCIONAR --2=FRACCIONAMIENTO
                       AND EXFG.ID_ENTIDAD = PI_N_ID_EXPED_FRACCIONAR
                       AND EXFG.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO;
                
                    IF NVL(I_EXISTE, 0) = 0 THEN
                        /*VALIDACIONES DE APLICACION DEL FRACCIONAMIENTO*/
                        --3.saldo de expediente no puede superar xxx uit, sino solicitar garantia.
                        PO_V_MSJ_ERROR := 'No se puede realizar la accion. El importe CAPITAL del expediente excede los ' ||
                                          TO_CHAR(N_VALOR_UIT_GARANTIA) || ' UIT, debe asociar garantias.';
                        PO_N_COD_ERROR := -13;
                        RETURN;
                    END IF;
                
                END IF;
            
            END IF;
        END IF;
    
        PI_V_ID_EXPEDIENTE := '|' || TO_CHAR(PI_N_ID_EXPEDIENTE) || '|';
    
        --actualizar al estado precoactivo si no existe REC.
        --AGREGADO 11.05.2012
        IF D_FEC_EMISION_REC IS NULL AND
           PI_I_COD_TIPO_ASOCIACION = SCOB_PK_CONSTANTES.C_TIPO_ASOC_DEJAR_SIN_EFCTO THEN
            I_ESTADO_EXPEDIENTE := 1; --ESTADO PRECOACTIVO
        ELSE
            I_ESTADO_EXPEDIENTE := PI_I_ESTADO_EXPEDIENTE;
        END IF;
    
        SCOB_SP_I_GENERA_DOCUMENTO(PI_V_ID_EXPEDIENTE,
                                   1, --PI_N_NRO_ITEMS,
                                   PI_N_ID_MOTIVO,
                                   PI_V_ID_PLANTILLA,
                                   PI_V_MOTIVO_PLANTILLA,
                                   PI_N_NRO_ITEMSP,
                                   NULL, --PI_V_ID_COSTAS,
                                   NULL, --PI_V_POR_COSTAS,
                                   NULL, --PI_V_VAL_COSTAS,
                                   NULL, --PI_V_CNT_COSTAS,
                                   NULL, --PI_V_SUB_TOTAL_COSTAS,
                                   0, --PI_N_TOTAL_COSTAS,
                                   NULL, --PI_N_NRO_ITEMSC,
                                   I_ESTADO_EXPEDIENTE,
                                   0, --PI_N_ID_EXP_DOC_ORIGEN,
                                   PI_V_TIPO_ENTIDAD,
                                   PI_V_ID_TIPO_ENTIDAD,
                                   PI_V_NRO_ITEMSTE,
                                   PI_N_ID_SERVICIO,
                                   PI_V_ID_TIPO_SERVICIO,
                                   PI_C_FLG_UCI,
                                   PI_V_AUDUSUCREACION,
                                   PI_N_ID_USUARIO_INGRESO,
                                   PI_V_FEC_GENERACION_DOC,
                                   '0', --FLG_GEN_REC
                                   N_GENERADOR_DOCUMENTO,
                                   PO_N_COD_ERROR,
                                   PO_V_MSJ_ERROR);
    
     DBMS_OUTPUT.put_line('SCOB_SP_I_GEN_DOCS_BY_FRACCION>>SCOB_SP_I_GENERA_DOCUMENTO>>PO_N_COD_ERROR>>' || PO_N_COD_ERROR);
     DBMS_OUTPUT.put_line('SCOB_SP_I_GEN_DOCS_BY_FRACCION>>SCOB_SP_I_GENERA_DOCUMENTO>>PO_V_MSJ_ERROR>>' || PO_V_MSJ_ERROR);
     
        IF PO_N_COD_ERROR < 0 THEN
            ROLLBACK;
            RETURN;
        END IF;
    
        --insertar los documentos generados por solicitud de fraccionamiento
        INSERT INTO T_SCOB_EXPED_FRACCIONAR_DOC
            (ID_EXPED_FRACCIONAR_DOC, ID_EXPED_FRACCIONAR, ID_EXPEDIENTE_DOCUMENTO, COD_TIPO_ASOCIACION, ESTADO, AUDFECCREACION, AUDUSUCREACION)
            SELECT SCOB_SQ_EXPED_FRACCIONAR_DOC.NEXTVAL,
                   PI_N_ID_EXPED_FRACCIONAR,
                   EXDO.ID_EXPEDIENTE_DOCUMENTO,
                   PI_I_COD_TIPO_ASOCIACION,
                   SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO, --ESTADO REGISTRO
                   SYSDATE,
                   PI_V_AUDUSUCREACION
              FROM T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
             WHERE EXDO.COD_GENERADOR_DOCUMENTO = N_GENERADOR_DOCUMENTO;
    
        --ACTUALIZAR EL ESTADO DE LA SOLICITUD
        UPDATE T_SCOB_EXPED_FRACCIONAR EXFR
           SET ESTADO_SOLICITUD   = PI_I_ESTADO_SOLICITUD,
               FEC_CIERRE_TRAMITE = SYSDATE,
               AUDFECMODIFICACION = SYSDATE,
               AUDUSUMODIFICACION = PI_V_AUDUSUCREACION
         WHERE EXFR.ID_EXPED_FRACCIONAR = PI_N_ID_EXPED_FRACCIONAR;
    
        CASE
            WHEN PI_I_ESTADO_SOLICITUD = SCOB_PK_CONSTANTES.C_TIPO_ASOC_CANCELA_FRACCIONAR THEN
                --actualizar el estado del cronograma
                UPDATE T_SCOB_EXPED_CRONOGRAMA
                   SET ESTADO_CRONOGRAMA  = SCOB_PK_CONSTANTES.C_COD_EST_CRONO_PAGO_CERRADO,
                       AUDFECMODIFICACION = SYSDATE,
                       AUDUSUMODIFICACION = PI_V_AUDUSUCREACION
                 WHERE ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
                   AND FLG_ACTUAL = '1';
            ELSE
                NULL;
        END CASE;
    
        --INSERTA LA GARANTIA DEL FRACCIONAMIENTO
        IF PI_N_NU_ID_EMPRESA <> 0 THEN
            INSERT INTO T_SCOB_EXPEDIENTE_GARANTIA
                (ID_EXPEDIENTE_GARANTIA, ID_EXPEDIENTE, COD_TIPO_ENTIDAD, ID_ENTIDAD, FEC_INGRESO, ID_USUARIO_INGRESO, ESTADO, AUDFECCREACION,
                 AUDUSUCREACION,
                 --
                 NU_ID_EMPRESA, VC_ANIO_CARTA, NU_ID_CARTA_FIANZA)
            VALUES
                (SCOB_SQ_EXPEDIENTE_GARANTIA.NEXTVAL, PI_N_ID_EXPEDIENTE, SCOB_PK_CONSTANTES.C_TIPO_GARANTIA_FRACCIONAR,
                  --COD_TIPO_ENTIDAD:1=SUSPENSION;2=FRACCIONAMIENTO
                 PI_N_ID_EXPED_FRACCIONAR,
                  --ID_ENTIDAD
                 SYSDATE, PI_N_ID_USUARIO_INGRESO, SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO,
                  --ESTADO REGISTRO
                 SYSDATE, PI_V_AUDUSUCREACION,
                 --
                 PI_N_NU_ID_EMPRESA, PI_N_VC_ANIO_CARTA, PI_N_NU_ID_CARTA_FIANZA);
        
        END IF;
    
        --actualizar los datos del expediente segun tipo de asociacion
        CASE PI_I_COD_TIPO_ASOCIACION
            WHEN SCOB_PK_CONSTANTES.C_TIPO_ASOC_SUSPEND_FRACCIONAR THEN
                --APROBADO = FRACCIONADO
                --REGENERA EL CRONOGRAMA CON LOS SALDOS ACTUALIZADOS
                SCOB_PK_EXPE_FRACCIONAR.SCOB_SP_I_RECALCULAR_CRONO(PI_N_ID_EXPEDIENTE,
                                                                   PI_N_ID_EXPED_FRACCIONAR,
                                                                   PI_V_AUDUSUCREACION,
                                                                   PO_N_RETORNO,
                                                                   PO_N_COD_ERROR,
                                                                   PO_V_MSJ_ERROR);
            
                --obtener el total de los intereses generados
                SELECT SUM(ECDE.MONTO_INTERES)
                  INTO N_NUEVA_DEUDA
                  FROM T_SCOB_EXPED_CRONOGRAMA_DET ECDE
                 WHERE ECDE.ID_EXPED_CRONOGRAMA_PAGO IN (SELECT EXCR.ID_EXPED_CRONOGRAMA_PAGO
                                                           FROM T_SCOB_EXPED_CRONOGRAMA EXCR
                                                          WHERE EXCR.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
                                                            AND EXCR.FLG_ACTUAL = '1'
                                                            AND EXCR.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO)
                   AND ECDE.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO;
            
                --actualiza los montos de los interes generados
                UPDATE T_SCOB_MULTA MULT
                   SET --
                            MULT.MONTO_INTERES = N_NUEVA_DEUDA,
                       MULT.MONTO_TOTAL_DEUDA = MULT.MONTO_TOTAL_DEUDA + N_NUEVA_DEUDA,
                       --
                       SALDO_IC               = SALDO_IC + N_NUEVA_DEUDA,
                       MULT.SALDO_TOTAL_DEUDA = MULT.SALDO_TOTAL_DEUDA + N_NUEVA_DEUDA,
                       
                       AUDFECMODIFICACION = SYSDATE,
                       AUDUSUMODIFICACION = PI_V_AUDUSUCREACION
                 WHERE MULT.ID_MULTA = N_ID_MULTA;
            
                --actualiza los saldos del expediente
                SCOB_PK_MULTAS.SCOB_SP_U_ACT_IMPORTES_EXPED(N_ID_MULTA, PI_N_ID_EXPEDIENTE);
            
                --actualizar moras
                SCOB_PK_JOB.SCOB_PK_ACT_MORA_CRONO_AFEC(N_ID_MULTA);
            
            WHEN SCOB_PK_CONSTANTES.C_TIPO_ASOC_A_PERDIDA THEN
                --DECLARADO A PERDIDA
            
                --obtener el monto por uit
                SELECT UIT.MONTO_UIT
                  INTO N_MONTO_UIT
                  FROM T_SCOB_UIT UIT
                 WHERE TO_DATE(TO_CHAR(SYSDATE, 'DD/MM/YYYY'), 'DD/MM/YYYY') BETWEEN UIT.FECHA_INICIO AND UIT.FECHA_FIN
                   AND UIT.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO;
            
                --anular el detalle del cronograma
                UPDATE T_SCOB_EXPED_CRONOGRAMA_DET ECRD
                   SET ESTADO_CUOTA       = SCOB_PK_CONSTANTES.C_EST_PAGO_ANULADO, --ESTADO ANULADO
                       AUDFECMODIFICACION = SYSDATE,
                       AUDUSUMODIFICACION = PI_N_ID_USUARIO_INGRESO
                 WHERE ECRD.ID_EXPED_CRONOGRAMA_PAGO IN (SELECT EXCR.ID_EXPED_CRONOGRAMA_PAGO
                                                           FROM T_SCOB_EXPED_CRONOGRAMA EXCR
                                                          WHERE EXCR.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
                                                            AND EXCR.COD_TIPO_CRONOGRAMA = SCOB_PK_CONSTANTES.C_COD_TIPO_CRONO_FRACCIONAR
                                                            AND EXCR.FLG_ACTUAL = '1'
                                                            AND EXCR.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO);
            
                --anular el cronograma
                UPDATE T_SCOB_EXPED_CRONOGRAMA
                   SET ESTADO_CRONOGRAMA  = SCOB_PK_CONSTANTES.C_COD_EST_CRONO_PAGO_ANULADO, --ESTADO CRONO ANULADO
                       AUDFECMODIFICACION = SYSDATE,
                       AUDUSUMODIFICACION = PI_N_ID_USUARIO_INGRESO
                 WHERE ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
                   AND FLG_ACTUAL = '1'
                   AND COD_TIPO_CRONOGRAMA = SCOB_PK_CONSTANTES.C_COD_TIPO_CRONO_FRACCIONAR; --DE FRACCIONAMIENTO;
            
                --actualiza los datos de la multa.
                N_NUEVA_DEUDA := (N_MONTO_UIT * N_VALOR_UIT); -- - N_TOTAL_AMORTIZADO;
                N_NUEVA_DEUDA := TRUNC(N_NUEVA_DEUDA, SCOB_PK_CONSTANTES.C_NRO_DECIMAL_TRUNC);
            
                UPDATE T_SCOB_MULTA MULT
                   SET --
                       MULT.MONTO_UIT = N_NUEVA_DEUDA,
                       --MULT.MONTO_INTERES = 0.00, --comentado 11/05/2012
                       --MULT.MONTO_INTERES_MORATORIO = 0.00, --comentado 11/05/2012
                       --MULT.MONTO_COSTAS = 0.00, --comentado 11/05/2012
                       
                       MULT.MONTO_INTERES           = MULT.TOTAL_AMORTIZADO_IC,
                       MULT.MONTO_INTERES_MORATORIO = MULT.TOTAL_AMORTIZADO_IM,
                       MULT.MONTO_COSTAS            = MULT.TOTAL_AMORTIZADO_COSTAS,
                       
                       MULT.MONTO_TOTAL_DEUDA = N_NUEVA_DEUDA + MULT.MONTO_INTERES + MULT.MONTO_INTERES_MORATORIO + MULT.MONTO_COSTAS,
                       --
                       --MULT.TOTAL_AMORTIZADO = 0.00,
                       --MULT.TOTAL_AMORTIZADO_IC = 0.00,
                       --MULT.TOTAL_AMORTIZADO_IM = 0.00,
                       --MULT.TOTAL_AMORTIZADO_COSTAS = 0.00,
                       MULT.TOTAL_AMORTIZACION_DEUDA = MULT.TOTAL_AMORTIZADO + MULT.TOTAL_AMORTIZADO_IC + MULT.TOTAL_AMORTIZADO_IM +
                                                       MULT.TOTAL_AMORTIZADO_COSTAS,
                       --
                       MULT.SALDO             = N_NUEVA_DEUDA - MULT.TOTAL_AMORTIZADO,
                       MULT.SALDO_IC          = 0.00,
                       MULT.SALDO_IM          = 0.00,
                       MULT.SALDO_COSTAS      = 0.00,
                       MULT.SALDO_TOTAL_DEUDA = N_NUEVA_DEUDA - MULT.TOTAL_AMORTIZADO
                --+MULT.SALDO_IC+MULT.SALDO_IM+MULT.SALDO_COSTAS
                
                 WHERE MULT.ID_MULTA = N_ID_MULTA;
            
                --actualiza los saldos del expediente
                SCOB_PK_MULTAS.SCOB_SP_U_ACT_IMPORTES_EXPED(N_ID_MULTA, PI_N_ID_EXPEDIENTE);
            
                --actualiza indicador a perdida --26.01.2012:A PERDIDA ES LA SOLICITUD, NO EXPEDIENTE
                --ACTUALIZAR EL ESTADO DE LA SOLICITUD A PERDIDA
                UPDATE T_SCOB_EXPED_FRACCIONAR EF
                   SET EF.ESTADO_SOLICITUD = SCOB_PK_CONSTANTES.C_COD_EST_SOL_FRACC_APERDIDA,
                       EF.FLG_APERDIDA     = '1'
                 WHERE EF.ID_EXPED_FRACCIONAR = PI_N_ID_EXPED_FRACCIONAR;
            
                --ELIMINAR LA RELACION EXPEDIENTE-GARANTIA
                UPDATE T_SCOB_EXPEDIENTE_GARANTIA EG
                   SET EG.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_INACTIVO
                 WHERE EG.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
                   AND EG.COD_TIPO_ENTIDAD = SCOB_PK_CONSTANTES.C_COD_TIPO_CRONO_FRACCIONAR
                   AND EG.ID_ENTIDAD = PI_N_ID_EXPED_FRACCIONAR
                   AND EG.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO;
            
        /* --COMENTADO EL 11/05/2012
                 --ELIMINAR EL DETALLE DE LOS PAGOS ASOCIADOS.
                 --eliminar comprobante detalle
                 UPDATE T_SCOB_COMPROBANTE_INGRESO_DET COMPD
                 SET
                   COMPD.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_INACTIVO
                 WHERE COMPD.ID_COMPROBANTE_INGRESO IN (
                       SELECT CI.ID_COMPROBANTE_INGRESO
                       FROM T_SCOB_COMPROBANTE_INGRESO CI WHERE CI.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
                       AND CI.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
                 );
        
                 --eliminar comprobante cronograma
                 UPDATE T_SCOB_COMPROBANTE_INGRESO_CRO COMPC
                 SET
                   COMPC.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_INACTIVO
                 WHERE COMPC.ID_COMPROBANTE_INGRESO IN (
                       SELECT CI.ID_COMPROBANTE_INGRESO
                       FROM T_SCOB_COMPROBANTE_INGRESO CI WHERE CI.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
                       AND CI.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
                 );
        
                 --eliminar comprobante forma de pago
                 UPDATE T_SCOB_COMPROBANTE_FORMA_PAGO CFPA
                 SET
                   CFPA.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_INACTIVO
                 WHERE CFPA.ID_COMPROBANTE_INGRESO IN (
                       SELECT CI.ID_COMPROBANTE_INGRESO
                       FROM T_SCOB_COMPROBANTE_INGRESO CI WHERE CI.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
                       AND CI.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
                 );
        
                  --eliminar comprobante
                 UPDATE T_SCOB_COMPROBANTE_INGRESO COMP
                 SET
                   COMP.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_INACTIVO,
                   COMP.AUDUSUMODIFICACION = SCOB_PK_CONSTANTES.C_COD_USUARIO_SISTEMA,
                   COMP.AUDFECMODIFICACION = SYSDATE
                 WHERE COMP.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE;
                 */
        
            ELSE
                NULL;
        END CASE;
     DBMS_OUTPUT.put_line('SCOB_SP_I_GEN_DOCS_BY_FRACCION>>SP_DO_GRABAR_BN_X_EXP>>PI_N_ID_EXPEDIENTE>>' || PI_N_ID_EXPEDIENTE);
        --INICIO VICTOR BENDEZU - MIGRACION SICOB A SIA    
        USR_SICOB.PKG_RECAUDACION_BANCOS.SP_DO_GRABAR_BN_X_EXP(PIN_NU_ID_EXPEDIENTE => PI_N_ID_EXPEDIENTE,
                                         POUT_NU_COD_RESULT => PO_N_COD_ERROR,
                                         POUT_VC_MSG_RESULT => PO_V_MSJ_ERROR);
        DBMS_OUTPUT.put_line('SCOB_SP_I_GEN_DOCS_BY_FRACCION>>SP_DO_GRABAR_BN_X_EXP>>PO_N_COD_ERROR>>' || PO_N_COD_ERROR);
        DBMS_OUTPUT.put_line('SCOB_SP_I_GEN_DOCS_BY_FRACCION>>SP_DO_GRABAR_BN_X_EXP>>PO_V_MSJ_ERROR>>' || PO_V_MSJ_ERROR);
        IF PO_N_COD_ERROR < 0 THEN
           ROLLBACK;
           RETURN;
        END IF;
        USR_SICOB.PKG_RECAUDACION_BANCOS.SP_DO_GRABAR_ASBANC_X_EXP(PIN_NU_ID_EXPEDIENTE => PI_N_ID_EXPEDIENTE,
                                         POUT_NU_COD_RESULT => PO_N_COD_ERROR,
                                         POUT_VC_MSG_RESULT => PO_V_MSJ_ERROR);
        DBMS_OUTPUT.put_line('SCOB_SP_I_GEN_DOCS_BY_FRACCION>>SP_DO_GRABAR_ASBANC_X_EXP>>PO_N_COD_ERROR>>' || PO_N_COD_ERROR);
        IF PO_N_COD_ERROR < 0 THEN
           ROLLBACK;
           RETURN;
        END IF;    
        --FIN VICTOR BENDEZU - MIGRACION SICOB A SIA
    
        PO_N_RETORNO   := N_GENERADOR_DOCUMENTO;
        PO_N_COD_ERROR := N_GENERADOR_DOCUMENTO;
    
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

    PROCEDURE SCOB_SP_I_GEN_DOCS_BY_EMBARGO
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 20.05.2011
        -- Proposito    : insertar los documentos plantillas generados por el sistema por un tipo de embargo
        -----------------------------------------------------------
        -- Modificacion : 01.07.2011; 09/04/2012;
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (
     /*01*/PI_N_ID_EXPEDIENTE IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
     /*02*/
     PI_N_ID_EXPEDIENTE_EMBARGO IN T_SCOB_EXPED_EMBARGO.ID_EXPEDIENTE_EMBARGO%TYPE,
     --SI EXISTE SE ENVIA, SINO = 0
     
     /*03*/
     PI_I_COD_TIPO_EMBARGO IN T_SCOB_EXPED_EMBARGO.COD_TIPO_EMBARGO%TYPE,
     /*04*/
     PI_N_MONTO_COSTAS_PROYECTADAS IN T_SCOB_EXPED_EMBARGO.MONTO_COSTAS_PROYECTADAS%TYPE,
     /*05*/
     PI_N_MONTO_EMBARGO IN T_SCOB_EXPED_EMBARGO.MONTO_EMBARGO%TYPE,
     /*06*/
     PI_I_COD_TIPO_INTERVENCION IN T_SCOB_EXPED_EMBARGO.COD_TIPO_INTERVENCION%TYPE,
     /*07*/
     PI_I_COD_TIPO_EMB_DEPOSITO IN T_SCOB_EXPED_EMBARGO.COD_TIPO_DEPOSITO%TYPE, --nuevo
     --------------------------------------------------------------------------------------------------
     /*08*/
     PI_I_COD_TIPO_ASOCIACION IN T_SCOB_EXPED_EMBARGO_DOC.COD_TIPO_ASOCIACION%TYPE,
     /*
                                               --------
                                               1=Resolucion Solicitud de Retencion (Retencion)
                                               5=Resolucion Tazador (Inscripcion)
                                               6=Resolucion Inscripcion (Inscripcion)
                                               7=Resolucion Secuestro
                                               8=Resolucion Intervencion
                                               --------
                                               */
     --------------------------------------------------------------------------------------------------
     --
     /*09*/
     PI_V_ID_EMBARGO_INSCRIP_BIEN IN VARCHAR2,
     --
     /*10*/
     PI_N_ID_MOTIVO IN T_SCOB_EXPEDIENTE_ESTADO.ID_MOTIVO%TYPE,
     /*11*/
     PI_V_ID_PLANTILLA IN VARCHAR2, --CADENA DE PLANTILLAS (EL PRIMERO SIEMPRE DEBE SER LA RESOLUCION, SI ES EL CASO)
     /*12*/
     PI_V_MOTIVO_PLANTILLA IN VARCHAR2, --CADENA DE MOTIVOS PLANTILLAS (EL PRIMERO SIEMPRE DEBE SER LA RESOLUCION, SI ES EL CASO)
     /*13*/
     PI_N_NRO_ITEMSP IN NUMBER, --SI SE ENVIAN DOS DOCUMENTO, SIEMPRE DEBE ESTAR LA REC PRIMERO.
     --
     /*14*/
     PI_V_ID_COSTAS IN VARCHAR2,
     /*15*/
     PI_V_POR_COSTAS IN VARCHAR2,
     /*16*/
     PI_V_VAL_COSTAS IN VARCHAR2,
     /*17*/
     PI_V_CNT_COSTAS IN VARCHAR2,
     /*18*/
     PI_V_SUB_TOTAL_COSTAS IN VARCHAR2,
     /*19*/
     PI_N_TOTAL_COSTAS IN T_SCOB_EXPEDIENTE_DOCUMENTO.MONTO_COSTA%TYPE,
     /*20*/
     PI_N_NRO_ITEMSC IN INTEGER,
     --
     /*21*/
     PI_V_TIPO_ENTIDAD IN VARCHAR2, --0=NINGUNO;1=PERSONA;2=BANCO;3=DIREC PERSONAS;4=SUNAT;5=PNP;6=SAT;7=CAJA METROPOLITANA
     /*22*/
     PI_I_NRO_ITEMS_TIPO_ENTIDAD IN INTEGER,
     /*23*/
     PI_V_ID_TIPO_ENTIDAD IN VARCHAR2, --entidades a quienes va dirigido
     /*24*/
     PI_V_NRO_ITEMSTE IN VARCHAR2, --cadena con los numero de entidades a quienes ira dirigido
     --
     /*25*/
     PI_I_ESTADO_EXPEDIENTE IN T_SCOB_EXPEDIENTE.ESTADO_EXPEDIENTE%TYPE,
     /*26*/
     PI_N_ID_EXPED_DOC_ORIGEN IN T_SCOB_EXPEDIENTE_DOCUMENTO.ID_EXPEDIENTE_DOCUMENTO_ORIGEN%TYPE,
     --ID DEL DOCUMENTO DE RESOLUCION.
     --CASO GENERA CEDULAS A PARTIR DE UNA RESOLUCION.
     --
     /*27*/
     PI_N_ID_SERVICIO IN NUMBER,
     /*28*/
     PI_V_ID_TIPO_SERVICIO IN VARCHAR2,
     /*29*/
     PI_C_FLG_UCI IN CHAR,
     --
     /*30*/
     PI_V_AUDUSUCREACION IN T_SCOB_EXPEDIENTE_DOCUMENTO.AUDUSUCREACION%TYPE,
     /*31*/
     PI_N_ID_USUARIO_INGRESO IN T_SCOB_USUARIO.ID_USUARIO%TYPE,
     --
     /*32*/
     PI_V_FEC_GENERACION_DOC IN VARCHAR,
     /*33*/
     PO_N_RETORNO OUT NUMBER,
     /*34*/
     PO_N_RETORNO_SOL OUT NUMBER,
     /*35*/
     PO_N_COD_ERROR OUT NUMBER,
     /*36*/
     PO_V_MSJ_ERROR OUT VARCHAR2) IS
        N_GENERADOR_DOCUMENTO   NUMBER;
        PI_V_ID_EXPEDIENTE      VARCHAR(20);
        N_ID_EXPEDIENTE_EMBARGO T_SCOB_EXPED_EMBARGO.ID_EXPEDIENTE_EMBARGO%TYPE;
        I_EXISTE                INTEGER;
        N_TOTAL_SALDO_EMBAR_REG T_SCOB_EXPED_EMBARGO.MONTO_EMBARGO%TYPE;
    
    BEGIN
        PO_V_MSJ_ERROR   := '';
        PO_N_RETORNO     := 0;
        PO_N_RETORNO_SOL := 0;
        PO_N_COD_ERROR   := 0;
    
        IF PI_N_MONTO_EMBARGO = 0 AND
           PI_I_COD_TIPO_ASOCIACION NOT IN (SCOB_PK_CONSTANTES.C_EMB_SECUE_SOLIC_RESOLUCION, SCOB_PK_CONSTANTES.C_EMB_INTER_SOLIC_RESOLUCION) THEN
            PO_V_MSJ_ERROR := 'No se puede realizar la accion. El total del embargo es CERO.';
            PO_N_COD_ERROR := -8;
            RETURN;
        END IF;
    
        SELECT NVL(EXPE.SALDO_TOTAL_DEUDA, 0) - NVL(SUM(EXEM.MONTO_EMBARGO), 0)
          INTO N_TOTAL_SALDO_EMBAR_REG
          FROM T_SCOB_EXPEDIENTE EXPE
          LEFT JOIN T_SCOB_EXPED_EMBARGO EXEM
            ON EXEM.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
           AND EXEM.COD_ESTADO_EMBARGO <> SCOB_PK_CONSTANTES.C_EST_SOLIC_EMB_LEVANTADO
           AND EXEM.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
         WHERE EXPE.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
         GROUP BY EXPE.SALDO_TOTAL_DEUDA;
    
        IF N_TOTAL_SALDO_EMBAR_REG <= 0 AND
           PI_I_COD_TIPO_ASOCIACION NOT IN (SCOB_PK_CONSTANTES.C_EMB_SECUE_SOLIC_RESOLUCION, SCOB_PK_CONSTANTES.C_EMB_INTER_SOLIC_RESOLUCION) THEN
            PO_V_MSJ_ERROR := 'No se puede realizar la accion. El saldo del embargo es CERO.';
            PO_N_COD_ERROR := -9;
            RETURN;
        END IF;
    
        /*validar se hayan asociado bienes si el embargo es de INSCRIPCION*/
        --FALTA OBTENER EL IMPORTE DE LOS BIENES REGISTRADOS.
        IF PI_I_COD_TIPO_ASOCIACION = SCOB_PK_CONSTANTES.C_EMB_INSCR_SOLIC_RESOLUCION THEN
            SELECT COUNT(IBIE.ID_EMBARGO_INSCRIPCION_BIEN)
              INTO I_EXISTE
              FROM T_SCOB_EXPED_EMBARGO_INS_BIEN IBIE
             WHERE IBIE.ID_EXPEDIENTE_EMBARGO = PI_N_ID_EXPEDIENTE_EMBARGO
               AND IBIE.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO;
        
            IF I_EXISTE = 0 THEN
                PO_V_MSJ_ERROR := 'No se puede realizar la accion. Antes se deben registrar los bienes del embargo.';
                PO_N_COD_ERROR := -11;
                RETURN;
            END IF;
        END IF;
    
        /*validar al generar cedulas por INTERVENCION si existe respuesta*/
        IF (PI_I_COD_TIPO_EMBARGO = SCOB_PK_CONSTANTES.C_COD_TIPO_EMB_INTERVENCION AND PI_N_ID_EXPED_DOC_ORIGEN <> 0) OR
           (PI_I_COD_TIPO_EMBARGO = SCOB_PK_CONSTANTES.C_COD_TIPO_EMB_SECUESTRO AND PI_N_ID_EXPED_DOC_ORIGEN <> 0)
        
         THEN
        
            SELECT COUNT(EXEM.ID_EXPEDIENTE_EMBARGO)
              INTO I_EXISTE
              FROM T_SCOB_EXPED_EMBARGO EXEM
             WHERE EXEM.ID_EXPEDIENTE_EMBARGO = PI_N_ID_EXPEDIENTE_EMBARGO
               AND NVL(EXEM.COD_RESPUESTA, 0) <> 0;
        
            IF I_EXISTE > 0 THEN
                PO_V_MSJ_ERROR := 'No se puede realizar la accion. El embargo cuenta con respuesta registrada.';
                PO_N_COD_ERROR := -12;
                RETURN;
            END IF;
        END IF;
    
        PI_V_ID_EXPEDIENTE := '|' || TO_CHAR(PI_N_ID_EXPEDIENTE) || '|';
        SCOB_SP_I_GENERA_DOCUMENTO(PI_V_ID_EXPEDIENTE,
                                   1, --PI_N_NRO_ITEMS,
                                   PI_N_ID_MOTIVO,
                                   PI_V_ID_PLANTILLA,
                                   PI_V_MOTIVO_PLANTILLA,
                                   PI_N_NRO_ITEMSP,
                                   PI_V_ID_COSTAS,
                                   PI_V_POR_COSTAS,
                                   PI_V_VAL_COSTAS,
                                   PI_V_CNT_COSTAS,
                                   PI_V_SUB_TOTAL_COSTAS,
                                   PI_N_TOTAL_COSTAS,
                                   PI_N_NRO_ITEMSC,
                                   PI_I_ESTADO_EXPEDIENTE,
                                   PI_N_ID_EXPED_DOC_ORIGEN,
                                   PI_V_TIPO_ENTIDAD,
                                   PI_V_ID_TIPO_ENTIDAD,
                                   PI_V_NRO_ITEMSTE,
                                   PI_N_ID_SERVICIO,
                                   PI_V_ID_TIPO_SERVICIO,
                                   PI_C_FLG_UCI,
                                   PI_V_AUDUSUCREACION,
                                   PI_N_ID_USUARIO_INGRESO,
                                   PI_V_FEC_GENERACION_DOC,
                                   '0', --FLG_GEN_REC
                                   N_GENERADOR_DOCUMENTO,
                                   PO_N_COD_ERROR,
                                   PO_V_MSJ_ERROR);
    
        IF PO_N_COD_ERROR < 0 THEN
            ROLLBACK;
            RETURN;
        END IF;
    
        IF PI_N_ID_EXPEDIENTE_EMBARGO = 0 THEN
            BEGIN
                --inserta el embargo segun tipo
                SCOB_PK_EXPE_EMBARGAR.SCOB_SP_I_EMBARGO(PI_N_ID_EXPEDIENTE,
                                                        PI_I_COD_TIPO_EMBARGO,
                                                        PI_N_MONTO_COSTAS_PROYECTADAS,
                                                        PI_N_TOTAL_COSTAS,
                                                        PI_N_MONTO_EMBARGO,
                                                        PI_N_ID_USUARIO_INGRESO,
                                                        PI_V_AUDUSUCREACION,
                                                        PI_I_COD_TIPO_EMB_DEPOSITO,
                                                        N_ID_EXPEDIENTE_EMBARGO,
                                                        PO_N_COD_ERROR,
                                                        PO_V_MSJ_ERROR);
            
                IF PO_N_COD_ERROR < 0 THEN
                    ROLLBACK;
                    RETURN;
                END IF;
            END;
        ELSE
            BEGIN
                --ACTUALIZA LAS COSTAS DEL EMBARGO
                UPDATE T_SCOB_EXPED_EMBARGO EXEM
                   SET EXEM.MONTO_COSTAS_PROYECTADAS = PI_N_MONTO_COSTAS_PROYECTADAS,
                       EXEM.MONTO_COSTAS             = NVL(EXEM.MONTO_COSTAS, 0) + NVL(PI_N_TOTAL_COSTAS, 0),
                       EXEM.MONTO_EMBARGO            = PI_N_MONTO_EMBARGO --FALTA VERIFICAR SI ES CORRECTA LA ACTUALIZACION
                 WHERE EXEM.ID_EXPEDIENTE_EMBARGO = PI_N_ID_EXPEDIENTE_EMBARGO;
            
                N_ID_EXPEDIENTE_EMBARGO := PI_N_ID_EXPEDIENTE_EMBARGO;
            END;
        END IF;
        PO_N_RETORNO_SOL := N_ID_EXPEDIENTE_EMBARGO;
    
        --insertar los documentos generados por el tipo de embargo
        INSERT INTO T_SCOB_EXPED_EMBARGO_DOC
            (ID_EXPED_EMBARGO_DOC, ID_EXPEDIENTE_EMBARGO, ID_EXPEDIENTE_DOCUMENTO, COD_TIPO_ASOCIACION, COD_GENERADOR_DOCUMENTO, ESTADO,
             AUDFECCREACION, AUDUSUCREACION)
            SELECT SCOB_SQ_EXPED_EMBARGO_DOC.NEXTVAL,
                   N_ID_EXPEDIENTE_EMBARGO,
                   EXDO.ID_EXPEDIENTE_DOCUMENTO,
                   PI_I_COD_TIPO_ASOCIACION,
                   N_GENERADOR_DOCUMENTO,
                   '1', --ESTADO REGISTRO
                   SYSDATE,
                   PI_V_AUDUSUCREACION
              FROM T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
             WHERE EXDO.COD_GENERADOR_DOCUMENTO = N_GENERADOR_DOCUMENTO;
    
        IF PI_I_COD_TIPO_EMBARGO = SCOB_PK_CONSTANTES.C_COD_TIPO_EMB_INTERVENCION THEN
            UPDATE T_SCOB_EXPED_EMBARGO SET COD_TIPO_INTERVENCION = PI_I_COD_TIPO_INTERVENCION WHERE ID_EXPEDIENTE_EMBARGO = N_ID_EXPEDIENTE_EMBARGO;
        END IF;
    
        IF NVL(PI_V_ID_EMBARGO_INSCRIP_BIEN, ' ') <> ' ' THEN
        
            UPDATE T_SCOB_EXPED_EMBARGO_INS_BIEN
               SET ID_EXPEDIENTE_DOCUMENTO =
                   (SELECT EXDO.ID_EXPEDIENTE_DOCUMENTO
                      FROM T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
                     WHERE EXDO.COD_GENERADOR_DOCUMENTO = N_GENERADOR_DOCUMENTO
                       AND EXDO.COD_SUBTIPO_DOCUMENTO = SCOB_PK_CONSTANTES.C_COD_SUBTIPODOC_RESOLUCION
                       AND EXDO.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
                       AND ROWNUM = 1)
             WHERE INSTR(PI_V_ID_EMBARGO_INSCRIP_BIEN, '|' || TO_CHAR(ID_EMBARGO_INSCRIPCION_BIEN) || '|') > 0;
        
        END IF;
    
        PO_N_COD_ERROR := 0;
        PO_N_RETORNO   := N_GENERADOR_DOCUMENTO;
    
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

    PROCEDURE SCOB_SP_I_GEN_DOCS_BY_EMB_RETE
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 30.05.2011
        -- Proposito    : insertar los documentos y solicitudes de REQUERIR
        -----------------------------------------------------------
        -- Modificacion : 01.07.2011
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (
     /*01*/PI_N_ID_EXPEDIENTE IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
     /*02*/
     PI_N_ID_EXPEDIENTE_EMBARGO IN T_SCOB_EXPED_EMBARGO.ID_EXPEDIENTE_EMBARGO%TYPE,
     /*03*/
     PI_N_MONTO_EMBARGO IN T_SCOB_EXPED_EMBARGO.MONTO_EMBARGO%TYPE, --monto total soles
     /*04*/
     PI_I_COD_TIPO_ASOCIACION IN T_SCOB_EXPED_EMBARGO_DOC.COD_TIPO_ASOCIACION%TYPE,
     /*
                                                     2=Solicitud Requerir.(actual)
                                                     3=Solicitud Proceder.
                                                     4=Solicitud Requerir/Retener (
                                                                 se incluye en este caso el tipo:
                                                                 9=Solicitud Requerir/Proceder
                                                     )
                                                     */
     /*05*/
     PI_C_FLG_RETENER_LEVANTAR IN CHAR,
     --1=RETENER; 2=LEVANTAR
     --
     /*06*/
     PI_N_ID_MOTIVO IN T_SCOB_EXPEDIENTE_ESTADO.ID_MOTIVO%TYPE,
     /*07*/
     PI_V_ID_PLANTILLA IN VARCHAR2, --CADENA DE PLANTILLAS (EL PRIMERO SIEMPRE DEBE SER LA RESOLUCION, SI ES EL CASO)
     /*08*/
     PI_V_MOTIVO_PLANTILLA IN VARCHAR2, --CADENA DE MOTIVOS PLANTILLAS (EL PRIMERO SIEMPRE DEBE SER LA RESOLUCION, SI ES EL CASO)
     /*09*/
     PI_N_NRO_ITEMSP IN NUMBER, --SI SE ENVIAN DOS DOCUMENTO, SIEMPRE DEBE ESTAR LA REC PRIMERO.
     --
     /*10*/
     PI_V_ID_COSTAS IN VARCHAR2,
     /*11*/
     PI_V_POR_COSTAS IN VARCHAR2,
     /*12*/
     PI_V_VAL_COSTAS IN VARCHAR2,
     /*13*/
     PI_V_CNT_COSTAS IN VARCHAR2,
     /*14*/
     PI_V_SUB_TOTAL_COSTAS IN VARCHAR2,
     /*15*/
     PI_N_TOTAL_COSTAS IN T_SCOB_EXPEDIENTE_DOCUMENTO.MONTO_COSTA%TYPE,
     /*16*/
     PI_N_NRO_ITEMSC IN INTEGER,
     --
     /*17*/
     PI_V_TIPO_ENTIDAD IN VARCHAR, --0=NINGUNO;1=PERSONA;2=BANCO;3=DIREC PERSONAS;4=SUNAT;5=PNP;6=SAT;7=CAJA METROPOLITANA
     /*18*/
     PI_I_NRO_ITEMS_TIPO_ENTIDAD IN INTEGER,
     /*19*/
     PI_V_ID_TIPO_ENTIDAD IN VARCHAR, --entidades a quienes va dirigido
     /*20*/
     PI_V_NRO_ITEMSTE IN VARCHAR, --cadena con los numero de entidades a quienes ira dirigido
     --
     /*21*/
     PI_I_ESTADO_EXPEDIENTE IN T_SCOB_EXPEDIENTE.ESTADO_EXPEDIENTE%TYPE,
     --
     /*2101*/
     PI_V_ID_RETENCIONES IN VARCHAR2, --id's de las entidades retenedoras del caso 1(proceder/requerir)
     /*2102*/
     PI_I_NRO_ID_RETENCIONES IN INTEGER, --nro de id's asociados en el punto 2101.
     
     /*22*/
     PI_V_ID_EMBARGO_RETENER IN VARCHAR2, --ids de las solicitudes de retener seleccionadas
     /*23*/
     PI_V_TIPO_CAMBIO IN VARCHAR2,
     /*24*/
     PI_V_MONTO_APLICAR IN VARCHAR2,
     /*25*/
     PI_V_MONTO_APLICAR_ME IN VARCHAR2,
     /*26*/
     PI_V_ID_TIPO_ENTIDAD_REQUERIR IN VARCHAR, --entidades financieras a quienes va dirigido (PROCEDER, REQUERIR)
     /*27*/
     PI_I_NRO_ITEMS_REQUERIR IN INTEGER, --cantidad de entidades financieras del punto anterior
     --
     /*28*/
     PI_N_ID_SERVICIO IN NUMBER,
     /*29*/
     PI_V_ID_TIPO_SERVICIO IN VARCHAR2,
     /*30*/
     PI_C_FLG_UCI IN CHAR,
     --
     /*31*/
     PI_V_AUDUSUCREACION IN T_SCOB_EXPEDIENTE_DOCUMENTO.AUDUSUCREACION%TYPE,
     /*32*/
     PI_N_ID_USUARIO_INGRESO IN T_SCOB_USUARIO.ID_USUARIO%TYPE,
     --
     /*33*/
     PI_C_VERIFICA_GENERACION_DOC IN CHAR,
     /*34*/
     PI_V_FEC_GENERACION_DOC IN VARCHAR,
     /*35*/
     PI_N_MONTO_APLICAR IN T_SCOB_EXPED_EMBARGO_REQ.MONTO_APLICAR%TYPE, --monto total aplicar en soles
     /*36*/
     PI_N_MONTO_APLICAR_ME IN T_SCOB_EXPED_EMBARGO_REQ.MONTO_APLICAR_ME%TYPE, --monto total aplicar en dolares
     --
     /*37*/
     PO_N_RETORNO OUT NUMBER,
     /*38*/
     PO_N_RETORNO_SOL OUT NUMBER,
     /*39*/
     PO_N_COD_ERROR OUT NUMBER,
     /*40*/
     PO_V_MSJ_ERROR OUT VARCHAR2) IS
        N_GENERADOR_DOCUMENTO NUMBER;
        N_GENERADOR_REQUERIR  NUMBER;
        PI_V_ID_EXPEDIENTE    VARCHAR(20);
        I_EXISTE              INTEGER;
        I_COD_TIPO_REQUERIR   INTEGER;
        I_COD_TIPO_PROCEDER   INTEGER;
        --  C_FLG_PROCEDER                          CHAR(1);
        N_ID_EMBARGO_REQUERIR NUMBER;
        N_MONTO_APLICAR_TOTAL T_SCOB_EXPED_EMBARGO_REQ.MONTO_APLICAR_TOTAL%TYPE;
        N_MONTO_REDUCIR       T_SCOB_EXPED_EMBARGO_REQ.MONTO_APLICAR_TOTAL%TYPE;
        --
        V_ID_RETENCION VARCHAR2(25);
        V_N_IMPORTE_MN VARCHAR2(25);
        V_N_IMPORTE_ME VARCHAR2(25);
        N_IMPORTE_MN   NUMBER(18, 6);
        N_IMPORTE_ME   NUMBER(18, 6);
        N_CONT         INTEGER;
    BEGIN
        PO_V_MSJ_ERROR   := '';
        PO_N_RETORNO     := 0;
        PO_N_RETORNO_SOL := 0;
        PO_N_COD_ERROR   := -1;
    
        IF PI_C_VERIFICA_GENERACION_DOC = '1' AND
           (PI_I_COD_TIPO_ASOCIACION = 2 OR --REQUERIR
           PI_I_COD_TIPO_ASOCIACION = 3) --PROCEDER
         THEN
        
            /*validar si el tipo de asociacion ya se encuentra generado*/
            SELECT COUNT(EREQ.ID_EMBARGO_REQUERIR)
              INTO I_EXISTE
              FROM T_SCOB_EXPED_EMBARGO EXEM
             INNER JOIN T_SCOB_EXPED_EMBARGO_REQ EREQ
                ON EREQ.ID_EXPEDIENTE_EMBARGO = EXEM.ID_EXPEDIENTE_EMBARGO
               AND EREQ.COD_TIPO_ASOCIACION = PI_I_COD_TIPO_ASOCIACION
               AND EREQ.ESTADO = '1'
             WHERE EXEM.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE;
        
            IF I_EXISTE > 0 THEN
                PO_V_MSJ_ERROR := 'No se puede realizar la accion. Este tipo de documento antes ha sido generado.';
                PO_N_COD_ERROR := -10;
                RETURN;
            END IF;
        END IF;
    
        --INSERTA LOS DOCUMENTOS
        PI_V_ID_EXPEDIENTE := '|' || TO_CHAR(PI_N_ID_EXPEDIENTE) || '|';
    
        SCOB_SP_I_GENERA_DOCUMENTO_V2(PI_V_ID_EXPEDIENTE,
                                      1, --PI_N_NRO_ITEMS,
                                      PI_N_ID_MOTIVO,
                                      PI_V_ID_PLANTILLA,
                                      PI_V_MOTIVO_PLANTILLA,
                                      PI_N_NRO_ITEMSP,
                                      PI_V_ID_COSTAS,
                                      PI_V_POR_COSTAS,
                                      PI_V_VAL_COSTAS,
                                      PI_V_CNT_COSTAS,
                                      PI_V_SUB_TOTAL_COSTAS,
                                      PI_N_TOTAL_COSTAS,
                                      PI_N_NRO_ITEMSC,
                                      PI_I_ESTADO_EXPEDIENTE,
                                      0, --PI_N_ID_EXPED_DOC_ORIGEN,
                                      PI_V_TIPO_ENTIDAD,
                                      PI_I_NRO_ITEMS_TIPO_ENTIDAD,
                                      PI_V_ID_TIPO_ENTIDAD,
                                      PI_V_NRO_ITEMSTE,
                                      PI_N_ID_SERVICIO,
                                      PI_V_ID_TIPO_SERVICIO,
                                      PI_C_FLG_UCI,
                                      PI_V_AUDUSUCREACION,
                                      PI_N_ID_USUARIO_INGRESO,
                                      PI_V_FEC_GENERACION_DOC,
                                      '0', --FLG_GEN_REC
                                      N_GENERADOR_DOCUMENTO,
                                      PO_N_COD_ERROR,
                                      PO_V_MSJ_ERROR);
    
        IF PO_N_COD_ERROR < 0 THEN
            PO_V_MSJ_ERROR := '1-' + PO_V_MSJ_ERROR; --RMCA
            ROLLBACK;
            RETURN;
        END IF;
        ---------------------------------------------------------
    
        --DEFINIR EL TIPO DE REQUERIR.
        SELECT DECODE(PI_C_FLG_RETENER_LEVANTAR, '1', SCOB_PK_CONSTANTES.C_EMB_REQUERIR_RETENER, SCOB_PK_CONSTANTES.C_EMB_REQUERIR_LEVANTAR)
          INTO I_COD_TIPO_REQUERIR
          FROM DUAL;
    
        SELECT DECODE(PI_C_FLG_RETENER_LEVANTAR, '1', SCOB_PK_CONSTANTES.C_EMB_PROCEDER_RETENER, SCOB_PK_CONSTANTES.C_EMB_PROCEDER_LEVANTAR)
          INTO I_COD_TIPO_PROCEDER
          FROM DUAL;
        ---------------------------------------------------------
        --INSERTAR REQUERIR/PROCEDER/REQUERIR-PROCEDER
        SCOB_PK_EXPE_EMBARGAR.SCOB_SP_I_EMBARGO_REQUERIR(PI_N_ID_EXPEDIENTE,
                                                         PI_N_ID_EXPEDIENTE_EMBARGO,
                                                         PI_I_COD_TIPO_ASOCIACION,
                                                         I_COD_TIPO_REQUERIR,
                                                         PI_V_ID_EMBARGO_RETENER,
                                                         PI_V_ID_TIPO_ENTIDAD_REQUERIR, --PI_V_ID_ENTIDAD_FINANCIERA (solo a quienes va dirigido)
                                                         PI_V_TIPO_CAMBIO,
                                                         PI_V_MONTO_APLICAR,
                                                         PI_V_MONTO_APLICAR_ME,
                                                         PI_I_NRO_ITEMS_REQUERIR,
                                                         PI_N_ID_USUARIO_INGRESO,
                                                         PI_V_AUDUSUCREACION,
                                                         PI_N_MONTO_EMBARGO, --MONTO REQUERIR
                                                         PI_N_MONTO_APLICAR, --MONTO REQUERIR SOLES
                                                         PI_N_MONTO_APLICAR_ME, --MONTO REQUERIR DOLARES
                                                         N_GENERADOR_REQUERIR, --retorna el cod_generardor de requerir.
                                                         PO_N_COD_ERROR,
                                                         PO_V_MSJ_ERROR,
                                                         N_MONTO_REDUCIR);
    
        IF PO_N_COD_ERROR < 0 THEN
            PO_V_MSJ_ERROR := '2-' + PO_V_MSJ_ERROR; --RMCA
            ROLLBACK;
            RETURN;
        END IF;
        PO_N_RETORNO_SOL := N_GENERADOR_REQUERIR;
    
        --INSERTAR LOS CHEQUES DE REQUERIR
        ---------------------------------------------------------
        IF (PI_I_COD_TIPO_ASOCIACION = 2 OR PI_I_COD_TIPO_ASOCIACION = 4) THEN
            --INSERTAR CHEQUE.
            INSERT INTO T_SCOB_EXPED_EMB_RET_CHEQUE
                (ID_EMBARGO_RETENCION_CHEQUE, ID_EMBARGO_REQUERIR, COD_TIPO_MONEDA, TIPO_CAMBIO, MONTO, MONTO_TOTAL, ESTADO, AUDFECCREACION,
                 AUDUSUCREACION, FEC_INGRESO, ID_USUARIO_INGRESO)
                SELECT SCOB_SQ_EXPED_EMB_RET_CHEQUE.NEXTVAL,
                       CHEQUE.ID_EMBARGO_REQUERIR,
                       CHEQUE.TIPO_MONEDA,
                       CHEQUE.TIPO_CAMBIO,
                       CHEQUE.MONTO_APLICAR,
                       CHEQUE.MONTO_TOTAL,
                       SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO,
                       SYSDATE,
                       PI_V_AUDUSUCREACION,
                       SYSDATE,
                       PI_N_ID_USUARIO_INGRESO
                  FROM (SELECT EREQ.ID_EMBARGO_REQUERIR                   AS ID_EMBARGO_REQUERIR,
                               SCOB_PK_CONSTANTES.C_COD_TIPO_MONEDA_SOLES AS TIPO_MONEDA,
                               1                                          AS TIPO_CAMBIO,
                               EREQ.MONTO_APLICAR                         AS MONTO_APLICAR,
                               EREQ.MONTO_APLICAR                         AS MONTO_TOTAL
                          FROM T_SCOB_EXPED_EMBARGO_REQ EREQ
                         WHERE EREQ.ID_EXPEDIENTE_EMBARGO = PI_N_ID_EXPEDIENTE_EMBARGO
                           AND EREQ.COD_GENERADOR_REQUERIR = N_GENERADOR_REQUERIR
                           AND EREQ.COD_TIPO_ASOCIACION = PI_I_COD_TIPO_ASOCIACION
                           AND EREQ.MONTO_APLICAR > 0
                        UNION
                        SELECT EREQ.ID_EMBARGO_REQUERIR AS ID_EMBARGO_REQUERIR,
                               SCOB_PK_CONSTANTES.C_COD_TIPO_MONEDA_DORALES AS TIPO_MONEDA,
                               NVL(EREQ.TIPO_CAMBIO, 1) AS TIPO_CAMBIO,
                               EREQ.MONTO_APLICAR_ME AS MONTO_APLICAR,
                               (NVL(EREQ.TIPO_CAMBIO, 1) * NVL(EREQ.MONTO_APLICAR_ME, 0)) AS MONTO_TOTAL
                          FROM T_SCOB_EXPED_EMBARGO_REQ EREQ
                         WHERE EREQ.ID_EXPEDIENTE_EMBARGO = PI_N_ID_EXPEDIENTE_EMBARGO
                           AND EREQ.COD_GENERADOR_REQUERIR = N_GENERADOR_REQUERIR
                           AND EREQ.COD_TIPO_ASOCIACION = PI_I_COD_TIPO_ASOCIACION
                           AND EREQ.MONTO_APLICAR_ME > 0
                         ORDER BY 1,
                                  2) CHEQUE;
        
        END IF;
    
        --INSERTA LA ASOCIACION DE LOS DOCUMENTOS
        -----------------------------------------
        INSERT INTO T_SCOB_EXPED_EMBARGO_DOC
            (ID_EXPED_EMBARGO_DOC, ID_EXPEDIENTE_EMBARGO, ID_EMBARGO_REQUERIR, ID_EXPEDIENTE_DOCUMENTO, COD_TIPO_ASOCIACION, ESTADO, AUDFECCREACION,
             AUDUSUCREACION, COD_GENERADOR_REQUERIR, COD_GENERADOR_DOCUMENTO, MONTO_APLICAR, MONTO_APLICAR_ME, MONTO_REQUERIR, MONTO_RETENER)
            SELECT --CAMBIADO 10.04.2012
             SCOB_SQ_EXPED_EMBARGO_DOC.NEXTVAL,
             EXEM.ID_EXPEDIENTE_EMBARGO,
             EREQ.ID_EMBARGO_REQUERIR,
             EXDO.ID_EXPEDIENTE_DOCUMENTO,
             PI_I_COD_TIPO_ASOCIACION,
             SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO, --ESTADO REGISTRO
             SYSDATE,
             PI_V_AUDUSUCREACION,
             N_GENERADOR_REQUERIR,
             N_GENERADOR_DOCUMENTO,
             PI_N_MONTO_APLICAR, --MONTO REQUERIR SOLES
             PI_N_MONTO_APLICAR_ME, --MONTO REQUERIR DOLARES
             PI_N_MONTO_EMBARGO, --MONTO REQUERIR
             N_MONTO_REDUCIR --MONTO REDUCIR
            --
              FROM T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
             INNER JOIN T_SCOB_EXPED_EMBARGO EXEM
                ON EXEM.ID_EXPEDIENTE = EXDO.ID_EXPEDIENTE
               AND EXEM.ID_EXPEDIENTE_EMBARGO = PI_N_ID_EXPEDIENTE_EMBARGO
              LEFT JOIN T_SCOB_EXPED_DOCUMENTO_DIREC TDDIR
                ON TDDIR.ID_EXPEDIENTE = EXEM.ID_EXPEDIENTE
               AND TDDIR.ID_EXPEDIENTE_DOCUMENTO = EXDO.ID_EXPEDIENTE_DOCUMENTO
               AND TDDIR.ESTADO = '1'
              LEFT JOIN T_SCOB_EXPED_EMBARGO_REQ EREQ
                ON EREQ.ID_ENTIDAD_FINANCIERA = TDDIR.ID_ENTIDAD
               AND EREQ.ID_EXPEDIENTE_EMBARGO = EXEM.ID_EXPEDIENTE_EMBARGO
             WHERE EXDO.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
               AND EXDO.COD_GENERADOR_DOCUMENTO = N_GENERADOR_DOCUMENTO
               AND (PI_I_COD_TIPO_ASOCIACION <> 4 OR (EREQ.COD_TIPO_ASOCIACION = PI_I_COD_TIPO_ASOCIACION AND
                   INSTR(PI_V_ID_TIPO_ENTIDAD_REQUERIR, '|' || TO_CHAR(TDDIR.ID_ENTIDAD) || '|') > 0))
               AND EXDO.ESTADO = '1';
    
        IF (PI_I_COD_TIPO_ASOCIACION = 4) THEN
        
            --INSERTA LA ASOCIACION DE LOS TIPOS REQUERIR/PROCEDER (UN UNICO REGISTRO)
            SELECT SCOB_SQ_EXPED_EMBARGO_REQ.NEXTVAL INTO N_ID_EMBARGO_REQUERIR FROM DUAL;
            INSERT INTO T_SCOB_EXPED_EMBARGO_REQ
                (ID_EMBARGO_REQUERIR, ID_EXPEDIENTE_EMBARGO, COD_TIPO_ASOCIACION, COD_TIPO_REQUERIR, MONTO_APLICAR, MONTO_APLICAR_ME,
                 MONTO_APLICAR_TOTAL, MONTO_REDUCIR, COD_GENERADOR_REQUERIR, FEC_INGRESO, ID_USUARIO_INGRESO, ESTADO, AUDFECCREACION, AUDUSUCREACION)
                SELECT N_ID_EMBARGO_REQUERIR,
                       EREQ.ID_EXPEDIENTE_EMBARGO,
                       9, --TIPO ASOCIACION: REQUERIR/PROCEDER: 09.04.2012
                       I_COD_TIPO_PROCEDER, --13.09.2011
                       SUM(MONTO_APLICAR) AS MONTO_APLICAR,
                       SUM(MONTO_APLICAR_ME) AS MONTO_APLICAR_ME,
                       SUM(MONTO_APLICAR_TOTAL) AS MONTO_APLICAR_TOTAL,
                       MONTO_REDUCIR AS MONTO_REDUCIR,
                       N_GENERADOR_REQUERIR,
                       SYSDATE,
                       PI_N_ID_USUARIO_INGRESO,
                       SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO,
                       SYSDATE,
                       PI_V_AUDUSUCREACION
                  FROM T_SCOB_EXPED_EMBARGO_REQ EREQ
                 WHERE EREQ.ID_EXPEDIENTE_EMBARGO = PI_N_ID_EXPEDIENTE_EMBARGO
                   AND EREQ.COD_GENERADOR_REQUERIR = N_GENERADOR_REQUERIR
                 GROUP BY EREQ.ID_EXPEDIENTE_EMBARGO,
                          MONTO_REDUCIR;
        
            --INSERTA LA ASOCIACION DE LOS DOCUMENTOS
            -----------------------------------------
            INSERT INTO T_SCOB_EXPED_EMBARGO_DOC
                (ID_EXPED_EMBARGO_DOC, ID_EXPEDIENTE_EMBARGO,
                 --ID_EMBARGO_REQUERIR,
                 ID_EXPEDIENTE_DOCUMENTO, COD_TIPO_ASOCIACION, ESTADO, AUDFECCREACION, AUDUSUCREACION, COD_GENERADOR_REQUERIR, COD_GENERADOR_DOCUMENTO,
                 MONTO_APLICAR, MONTO_APLICAR_ME, MONTO_REQUERIR, MONTO_RETENER)
                SELECT SCOB_SQ_EXPED_EMBARGO_DOC.NEXTVAL,
                       EXEM.ID_EXPEDIENTE_EMBARGO,
                       --EREQ.ID_EMBARGO_REQUERIR,
                       EXDO.ID_EXPEDIENTE_DOCUMENTO,
                       9,
                       SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO, --ESTADO REGISTRO
                       SYSDATE,
                       PI_V_AUDUSUCREACION,
                       N_GENERADOR_REQUERIR,
                       N_GENERADOR_DOCUMENTO,
                       PI_N_MONTO_APLICAR, --MONTO REQUERIR SOLES
                       PI_N_MONTO_APLICAR_ME, --MONTO REQUERIR DOLARES
                       PI_N_MONTO_EMBARGO, --MONTO REQUERIR
                       N_MONTO_REDUCIR --MONTO REDUCIR
                  FROM T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
                 INNER JOIN T_SCOB_EXPED_EMBARGO EXEM
                    ON EXEM.ID_EXPEDIENTE = EXDO.ID_EXPEDIENTE
                   AND EXEM.ID_EXPEDIENTE_EMBARGO = PI_N_ID_EXPEDIENTE_EMBARGO
                   AND EXEM.ESTADO = '1'
                  LEFT JOIN T_SCOB_EXPED_DOCUMENTO_DIREC TDDIR
                    ON TDDIR.ID_EXPEDIENTE = EXEM.ID_EXPEDIENTE
                   AND TDDIR.ID_EXPEDIENTE_DOCUMENTO = EXDO.ID_EXPEDIENTE_DOCUMENTO
                   AND TDDIR.ESTADO = '1'
                 WHERE EXDO.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
                   AND EXDO.COD_GENERADOR_DOCUMENTO = N_GENERADOR_DOCUMENTO
                   AND INSTR(PI_V_ID_TIPO_ENTIDAD_REQUERIR, '|' || TO_CHAR(TDDIR.ID_ENTIDAD) || '|') = 0
                   AND EXDO.ESTADO = '1';
        
        END IF;
    
        IF (PI_I_COD_TIPO_ASOCIACION = 2 OR PI_I_COD_TIPO_ASOCIACION = 4) THEN
            --ACTUALIZAR EL MONTO REQUERIDO Y SALDO DEL EMBARGO SEGUN TIPO
            SELECT SUM(EREQ.MONTO_APLICAR_TOTAL)
              INTO N_MONTO_APLICAR_TOTAL
              FROM T_SCOB_EXPED_EMBARGO_REQ EREQ
             WHERE EREQ.ID_EXPEDIENTE_EMBARGO = PI_N_ID_EXPEDIENTE_EMBARGO
               AND EREQ.COD_GENERADOR_REQUERIR = N_GENERADOR_REQUERIR
               AND EREQ.COD_TIPO_ASOCIACION = PI_I_COD_TIPO_ASOCIACION
               AND EREQ.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO;
        
            UPDATE T_SCOB_EXPED_EMBARGO
               SET MONTO_APLICADO     = MONTO_APLICADO + N_MONTO_APLICAR_TOTAL,
                   SALDO_EMBARGO      = SALDO_EMBARGO - N_MONTO_APLICAR_TOTAL,
                   AUDFECMODIFICACION = SYSDATE,
                   AUDUSUMODIFICACION = PI_V_AUDUSUCREACION
             WHERE ID_EXPEDIENTE_EMBARGO = PI_N_ID_EXPEDIENTE_EMBARGO;
        END IF;
    
        --21.06.2012
        IF (PI_I_COD_TIPO_ASOCIACION = 3) THEN
            -- actualizar las retenciones modificada
            N_CONT := 1;
            WHILE (N_CONT <= PI_I_NRO_ID_RETENCIONES)
            LOOP
            
                SCOB_PK_UTILITARIO.SCOB_SP_S_SPLIT(PI_V_ID_RETENCIONES, '|', N_CONT + 1, V_ID_RETENCION);
                SCOB_PK_UTILITARIO.SCOB_SP_S_SPLIT(PI_V_MONTO_APLICAR, '|', N_CONT + 1, V_N_IMPORTE_MN);
                SCOB_PK_UTILITARIO.SCOB_SP_S_SPLIT(PI_V_MONTO_APLICAR_ME, '|', N_CONT + 1, V_N_IMPORTE_ME);
            
                N_IMPORTE_MN := SCOB_PK_UTILITARIO.SCOB_FN_TEXTO_A_NUMERO(V_N_IMPORTE_MN);
                N_IMPORTE_ME := SCOB_PK_UTILITARIO.SCOB_FN_TEXTO_A_NUMERO(V_N_IMPORTE_ME);
            
                UPDATE T_SCOB_EXPED_EMBARGO_RET ERET
                   SET MONTO_APLICADO_SOLES = N_IMPORTE_MN,
                       MONTO_APLICADO_DOLAR = N_IMPORTE_ME
                 WHERE ERET.ID_EXPEDIENTE_EMBARGO = PI_N_ID_EXPEDIENTE_EMBARGO
                   AND ERET.ID_ENTIDAD_FINANCIERA = TO_NUMBER(V_ID_RETENCION)
                   AND ERET.ESTADO = '1';
                N_CONT := N_CONT + 1;
            END LOOP;
        END IF;
    
        PO_N_COD_ERROR := 0;
        PO_N_RETORNO   := N_GENERADOR_DOCUMENTO;
    
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

    PROCEDURE SCOB_SP_I_GENERA_DOCUMENTO
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 20/04/2011
        -- Proposito    : insertar los documentos plantillas generados por el sistema
        -----------------------------------------------------------
        -- Modificacion : 13/05/2011
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_V_ID_EXPEDIENTE IN VARCHAR2, --CADENA DE EXPEDIENTES
     PI_N_NRO_ITEMS     IN NUMBER,
     --
     PI_N_ID_MOTIVO        IN T_SCOB_EXPEDIENTE_ESTADO.ID_MOTIVO%TYPE,
     PI_V_ID_PLANTILLA     IN VARCHAR2, --CADENA DE PLANTILLAS (EL PRIMERO SIEMPRE DEBE SER LA RESOLUCION, SI ES EL CASO)
     PI_V_MOTIVO_PLANTILLA IN VARCHAR2, --CADENA DE MOTIVOS PLANTILLAS (EL PRIMERO SIEMPRE DEBE SER LA RESOLUCION, SI ES EL CASO)
     PI_N_NRO_ITEMSP       IN NUMBER, --SI SE ENVIAN DOS DOCUMENTO, SIEMPRE DEBE ESTAR LA REC PRIMERO.
     --
     PI_V_ID_COSTAS        IN VARCHAR2,
     PI_V_POR_COSTAS       IN VARCHAR2,
     PI_V_VAL_COSTAS       IN VARCHAR2,
     PI_V_CNT_COSTAS       IN VARCHAR2,
     PI_V_SUB_TOTAL_COSTAS IN VARCHAR2,
     PI_N_TOTAL_COSTAS     IN T_SCOB_EXPEDIENTE_DOCUMENTO.MONTO_COSTA%TYPE,
     PI_N_NRO_ITEMSC       IN INTEGER,
     -------------------------
     PI_V_ESTADO_EXPEDIENTE IN T_SCOB_EXPEDIENTE_DOCUMENTO.ESTADO_EXPEDIENTE%TYPE,
     PI_N_ID_EXP_DOC_ORIGEN IN T_SCOB_EXPEDIENTE_DOCUMENTO.ID_EXPEDIENTE_DOCUMENTO_ORIGEN%TYPE,
     ---
     PI_V_TIPO_ENTIDAD    IN VARCHAR2, --0=NINGUNO;1=PERSONA;2=BANCO;3=DIREC PERSONAS;4=SUNAT;5=PNP;6=SAT;7=CAJA METROPOLITANA
     PI_V_ID_TIPO_ENTIDAD IN VARCHAR2, --entidades a quienes va dirigido
     PI_V_NRO_ITEMSTE     IN VARCHAR2, --cadena con los numero de entidades a quienes ira dirigido
     --
     PI_N_ID_SERVICIO      IN NUMBER,
     PI_V_ID_TIPO_SERVICIO IN VARCHAR2,
     PI_C_FLG_UCI          IN CHAR,
     ---
     PI_V_AUDUSUCREACION     IN T_SCOB_EXPEDIENTE_DOCUMENTO.AUDUSUCREACION%TYPE,
     PI_N_ID_USUARIO_INGRESO IN T_SCOB_USUARIO.ID_USUARIO%TYPE,
     PI_V_FEC_GENERACION_DOC IN VARCHAR,
     PI_C_IND_GEN_REC        IN CHAR,
     PO_N_RETORNO            OUT NUMBER,
     PO_N_COD_ERROR          OUT NUMBER,
     PO_V_MSJ_ERROR          OUT VARCHAR2) IS
        N_ID_EXPEDIENTE_DOCUMENTO_ORI T_SCOB_EXPEDIENTE_DOCUMENTO.ID_EXPEDIENTE_DOCUMENTO%TYPE;
        N_ID_EXPEDIENTE_DOCUMENTO_OUT T_SCOB_EXPEDIENTE_DOCUMENTO.ID_EXPEDIENTE_DOCUMENTO%TYPE;
        N_GENERADOR_DOCUMENTO         NUMBER;
        N_CONT                        INTEGER;
        N_CONTP                       INTEGER;
        V_ID_EXPEDIENTE               VARCHAR2(50);
        V_MOTIVO_PLANTILLA            VARCHAR2(50);
        V_PLANTILLA                   VARCHAR2(50);
    
        V_COD_TIPO_PLAN         T_SCOB_PLANTILLA.COD_INTERNO%TYPE;
        V_COD_TIPO_PLAN_INTERNO T_SCOB_PLANTILLA.COD_INTERNO%TYPE;
        V_COD_TIPO_DOC          T_SCOB_PLANTILLA.COD_INTERNO%TYPE;
        I_COD_SUBTIPO_DOC       INTEGER;
        N_ID_TIPO_DOC           T_SCOB_TIPO_DOCUMENTO.ID_TIPO_DOCUMENTO%TYPE;
        N_ID_TIPO_DOC_RES       INTEGER;
        I_NRO_REGLA             INTEGER;
    
        V_COD_TIPO_PLAN_AUX   T_SCOB_PLANTILLA.COD_INTERNO%TYPE;
        V_COD_TIPO_DOC_AUX    T_SCOB_PLANTILLA.COD_INTERNO%TYPE;
        N_ID_TIPO_DOC_AUX     T_SCOB_TIPO_DOCUMENTO.ID_TIPO_DOCUMENTO%TYPE;
        I_COD_SUBTIPO_DOC_AUX INTEGER;
        I_NRO_REGLA_AUX       INTEGER;
        V_PLANTILLA_AUX       T_SCOB_PLANTILLA.COD_INTERNO%TYPE;
    
        V_COD_AREA_USUARIO    VARCHAR(10);
        V_SIGLAS_AREA_USUARIO T_SCOB_AREA_COBRANZA.SIGLAS%TYPE;
        I_FLG_INGRESO         INTEGER;
        I_NRO_DOC             INTEGER;
    
        V_TIPO_ENTIDAD    VARCHAR2(1000);
        V_ID_TIPO_ENTIDAD VARCHAR2(1000);
        V_NRO_ITEMSTE     VARCHAR2(1000);
    
        CUR_PERS               CU_REC_SET;
        N_ID_ENTIDAD           NUMBER;
        N_ID_ENTIDAD_DOMICILIO NUMBER;
        V_ID_ENTIDAD           VARCHAR(5);
        V_ID_ENTIDAD_DOMICILIO VARCHAR(5);
        N_ID_MOTIVO            T_SCOB_EXPEDIENTE.ID_MOTIVO%TYPE;
    BEGIN
        PO_V_MSJ_ERROR := '';
        PO_N_RETORNO   := 0;
        PO_N_COD_ERROR := -1;
    
        SELECT SCOB_SQ_GENERADOR_DOCUMENTO.NEXTVAL INTO N_GENERADOR_DOCUMENTO FROM DUAL;
    
        BEGIN
            --obtener el area de cobranza del usuario
            SELECT UPPER(TRIM(ACOB.SIGLAS)),
                   UPPER(TRIM(ACOB.CODIGO))
              INTO V_SIGLAS_AREA_USUARIO,
                   V_COD_AREA_USUARIO
              FROM T_SCOB_USUARIO USUA
             INNER JOIN T_SCOB_AREA_COBRANZA ACOB
                ON ACOB.ID_AREA_COBRANZA = USUA.ID_AREA_COBRANZA
             WHERE UPPER(TRIM(USUA.USUARIO)) = UPPER(TRIM(PI_V_AUDUSUCREACION));
        
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                PO_N_COD_ERROR := -10;
                PO_V_MSJ_ERROR := 'No se pudo realizar la accion. El usuario no pertenece al Area de Cobranza.';
                PO_N_RETORNO   := PO_N_COD_ERROR;
                RETURN;
        END;
        DBMS_OUTPUT.PUT_LINE('**A-001');
        V_SIGLAS_AREA_USUARIO := '/' || V_SIGLAS_AREA_USUARIO;
    
        N_ID_EXPEDIENTE_DOCUMENTO_ORI := 0;
        IF PI_N_ID_EXP_DOC_ORIGEN <> 0 THEN
            N_ID_EXPEDIENTE_DOCUMENTO_ORI := PI_N_ID_EXP_DOC_ORIGEN;
        END IF;
    
        I_FLG_INGRESO := 0;
        --insertar los documentos por expediente
        N_CONT := 1;
        WHILE (N_CONT <= PI_N_NRO_ITEMS)
        LOOP
            SCOB_PK_UTILITARIO.SCOB_SP_S_SPLIT(PI_V_ID_EXPEDIENTE, '|', N_CONT + 1, V_ID_EXPEDIENTE);
            IF V_ID_EXPEDIENTE = '#' THEN
                EXIT;
            END IF;
            DBMS_OUTPUT.PUT_LINE('**A-002');
            --IF NVL(PI_V_ESTADO_EXPEDIENTE,'0')<>'0' THEN
            --insertar logs de estados del expediente
        
            IF NVL(PI_N_ID_MOTIVO, 0) = 0 THEN
                --OBTENER EL ULTIMO MOTIVO REGISTRADO DEL EXPEDIENTE
            
                BEGIN
                    SELECT EXPE.ID_MOTIVO INTO N_ID_MOTIVO FROM T_SCOB_EXPEDIENTE EXPE WHERE EXPE.ID_EXPEDIENTE = TO_NUMBER(V_ID_EXPEDIENTE);
                EXCEPTION
                    WHEN NO_DATA_FOUND THEN
                        N_ID_MOTIVO := 0;
                END;
            ELSE
                N_ID_MOTIVO := PI_N_ID_MOTIVO;
            END IF;
        
            SCOB_PK_EXPEDIENTE.SCOB_SP_I_EXPEDIENTE_ESTADO(TO_NUMBER(V_ID_EXPEDIENTE),
                                                           N_ID_MOTIVO,
                                                           PI_V_ESTADO_EXPEDIENTE,
                                                           PI_V_AUDUSUCREACION,
                                                           PO_N_COD_ERROR,
                                                           PO_V_MSJ_ERROR);
            IF PO_N_COD_ERROR < 0 THEN
                RETURN;
            END IF;
            --END IF;
        
            --obtener la plantilla
            N_CONTP := 1;
            WHILE (N_CONTP <= PI_N_NRO_ITEMSP)
            LOOP
                I_FLG_INGRESO := 0; --11.07.2011
                SCOB_PK_UTILITARIO.SCOB_SP_S_SPLIT(PI_V_ID_PLANTILLA, '|', N_CONTP + 1, V_PLANTILLA);
                SCOB_PK_UTILITARIO.SCOB_SP_S_SPLIT(PI_V_MOTIVO_PLANTILLA, '|', N_CONTP + 1, V_MOTIVO_PLANTILLA);
            
                SCOB_PK_UTILITARIO.SCOB_SP_S_SPLIT(PI_V_TIPO_ENTIDAD, '|', N_CONTP + 1, V_TIPO_ENTIDAD);
                SCOB_PK_UTILITARIO.SCOB_SP_S_SPLIT(PI_V_ID_TIPO_ENTIDAD, '|', N_CONTP + 1, V_ID_TIPO_ENTIDAD);
                SCOB_PK_UTILITARIO.SCOB_SP_S_SPLIT(PI_V_NRO_ITEMSTE, '|', N_CONTP + 1, V_NRO_ITEMSTE);
                --INSERT INTO T_TEST (OTHER) VALUES('2-V_PLANTILLA: '||PI_V_ID_PLANTILLA);
                --INSERT INTO T_TEST (OTHER) VALUES('2-V_PLANTILLA - 2: '||V_PLANTILLA);
                IF V_MOTIVO_PLANTILLA = '#' THEN
                    EXIT;
                END IF;
                --obtener el tipo de documento de la plantilla, tipo de documento y generador de numeracion
                SELECT TRIM(PLNT.CODIGO) AS COD_TIPO_PLANTILLA,
                       TRIM(PLNT.COD_INTERNO) AS COD_TIPO_PLANTILLA_INTERNO,
                       TRIM(TIP_DOC.COD_TIPO_DOCUMENTO) AS COD_TIPO_DOCUMENTO,
                       TIP_DOC.ID_TIPO_DOCUMENTO AS ID_TIPO_DOC,
                       TIP_DOC.COD_SUBTIPO_DOCUMENTO AS ID_SUBTIPO_DOC,
                       TO_NUMBER(REGL.TXT_VALOR1) AS NRO_REGLA,
                       NVL(PLNT.ID_PLANTILLA_RESOLUCION, 0) AS ID_TIPO_DOCUMENTO_RESOLUCION
                  INTO V_COD_TIPO_PLAN,
                       V_COD_TIPO_PLAN_INTERNO,
                       V_COD_TIPO_DOC,
                       N_ID_TIPO_DOC,
                       I_COD_SUBTIPO_DOC,
                       I_NRO_REGLA,
                       N_ID_TIPO_DOC_RES
                  FROM T_SCOB_PLANTILLA PLNT
                 INNER JOIN T_SCOB_TIPO_DOCUMENTO TIP_DOC
                    ON TIP_DOC.ID_TIPO_DOCUMENTO = PLNT.ID_TIPO_DOCUMENTO
                 INNER JOIN T_SCOB_TABLA_DET REGL
                    ON REGL.ID_TABLA = SCOB_PK_CONSTANTES.C_TBL_SUB_TIPO_DOCUMENTO
                   AND TO_NUMBER(REGL.COD_INTERNO) = TO_NUMBER(TIP_DOC.COD_SUBTIPO_DOCUMENTO)
                 WHERE PLNT.ID_PLANTILLA = TO_NUMBER(V_PLANTILLA);
                /*INSERT INTO T_TEST (OTHER) VALUES('3-V_PLANTILLA: '||TO_NUMBER(V_PLANTILLA));
                INSERT INTO T_TEST (OTHER) VALUES('3-I_COD_SUBTIPO_DOC: '||I_COD_SUBTIPO_DOC);
                INSERT INTO T_TEST (OTHER) VALUES('3-V_TIPO_ENTIDAD: '||V_TIPO_ENTIDAD);*/
                IF (I_COD_SUBTIPO_DOC = SCOB_PK_CONSTANTES.C_COD_SUBTIPODOC_CED_REC) --CED-REC
                   AND
                   (I_FLG_INGRESO = 0) THEN
                    BEGIN
                        I_FLG_INGRESO := '1';
                    
                        V_COD_TIPO_PLAN_AUX   := V_COD_TIPO_PLAN;
                        V_COD_TIPO_DOC_AUX    := V_COD_TIPO_DOC;
                        N_ID_TIPO_DOC_AUX     := N_ID_TIPO_DOC;
                        I_COD_SUBTIPO_DOC_AUX := I_COD_SUBTIPO_DOC;
                        I_NRO_REGLA_AUX       := I_NRO_REGLA;
                        V_PLANTILLA_AUX       := V_PLANTILLA;
                        --obtener la plantilla de resolucion asociada al documento
                        SELECT TRIM(PLNT_RESOL.CODIGO) AS COD_TIPO_PLANTILLA,
                               TRIM(TIP_DOC.COD_TIPO_DOCUMENTO) AS COD_TIPO_DOCUMENTO,
                               TIP_DOC.ID_TIPO_DOCUMENTO AS ID_TIPO_DOC,
                               TIP_DOC.COD_SUBTIPO_DOCUMENTO AS ID_SUBTIPO_DOC,
                               TO_NUMBER(REGL.TXT_VALOR1) AS NRO_REGLA,
                               TO_CHAR(PLNT_RESOL.ID_PLANTILLA) AS ID_PLANTILLA
                          INTO V_COD_TIPO_PLAN,
                               V_COD_TIPO_DOC,
                               N_ID_TIPO_DOC,
                               I_COD_SUBTIPO_DOC,
                               I_NRO_REGLA,
                               V_PLANTILLA
                          FROM T_SCOB_PLANTILLA PLNT_RESOL
                         INNER JOIN T_SCOB_TIPO_DOCUMENTO TIP_DOC
                            ON TIP_DOC.ID_TIPO_DOCUMENTO = PLNT_RESOL.ID_TIPO_DOCUMENTO
                         INNER JOIN T_SCOB_TABLA_DET REGL
                            ON REGL.ID_TABLA = SCOB_PK_CONSTANTES.C_TBL_SUB_TIPO_DOCUMENTO
                           AND TO_NUMBER(REGL.COD_INTERNO) = TO_NUMBER(TIP_DOC.COD_SUBTIPO_DOCUMENTO)
                         WHERE
                        --PLNT_RESOL.ID_PLANTILLA = TO_NUMBER(N_ID_TIPO_DOC_RES);
                         PLNT_RESOL.COD_INTERNO = V_COD_TIPO_PLAN_INTERNO
                         AND NVL(PLNT_RESOL.ID_PLANTILLA_RESOLUCION, 0) = 0;
                        --SE FUERZA A GENERAR ANTES UN DOCUMENTO DEL TIPO RESOLUCION
                        --inserta el documento
                        /*DBMS_OUTPUT.PUT_LINE('DATA 2: '||
                         'N_GENERADOR_DOCUMENTO: '||N_GENERADOR_DOCUMENTO||
                         'V_ID_EXPEDIENTE: '||V_ID_EXPEDIENTE||
                         'PI_V_ESTADO_EXPEDIENTE: '||PI_V_ESTADO_EXPEDIENTE||
                         'V_PLANTILLA: '||V_PLANTILLA||
                         'NULL'||
                         'V_COD_TIPO_PLAN: '||V_COD_TIPO_PLAN||
                         'V_COD_TIPO_DOC: '||V_COD_TIPO_DOC||
                         'N_ID_TIPO_DOC: '||N_ID_TIPO_DOC||
                         'N_ID_TIPO_DOC: '||N_ID_TIPO_DOC||
                         'I_COD_SUBTIPO_DOC: '||I_COD_SUBTIPO_DOC||
                         'I_NRO_REGLA: '||I_NRO_REGLA||
                         'CERO: '||
                         'PI_V_ID_COSTAS: '||PI_V_ID_COSTAS||
                         'PI_V_POR_COSTAS: '||PI_V_POR_COSTAS||
                         'PI_V_VAL_COSTAS: '||PI_V_VAL_COSTAS||
                         'PI_V_CNT_COSTAS: '||PI_V_CNT_COSTAS||
                         'PI_V_SUB_TOTAL_COSTAS: '||PI_V_SUB_TOTAL_COSTAS||
                         'PI_N_TOTAL_COSTAS: '||PI_N_TOTAL_COSTAS||
                         'PI_N_NRO_ITEMSC: '||PI_N_NRO_ITEMSC||
                         'V_COD_AREA_USUARIO: '||V_COD_AREA_USUARIO||
                         'V_SIGLAS_AREA_USUARIO: '||V_SIGLAS_AREA_USUARIO||
                         'PI_N_ID_SERVICIO: '||PI_N_ID_SERVICIO||
                         'PI_V_ID_TIPO_SERVICIO: '||PI_V_ID_TIPO_SERVICIO||
                         'PI_C_FLG_UCI: '||PI_C_FLG_UCI||
                         'PI_V_AUDUSUCREACION: '||PI_V_AUDUSUCREACION||
                         'PI_N_ID_USUARIO_INGRESO: '||PI_N_ID_USUARIO_INGRESO||
                         'PI_V_FEC_GENERACION_DOC: '||PI_V_FEC_GENERACION_DOC||
                         'PI_C_IND_GEN_REC: '||PI_C_IND_GEN_REC||
                         'N_ID_EXPEDIENTE_DOCUMENTO_ORI: '||N_ID_EXPEDIENTE_DOCUMENTO_ORI
                        );*/
                        /*INSERT INTO T_TEST (OTHER) VALUES('4-TIPO_DOC: '||V_COD_TIPO_DOC);
                        INSERT INTO T_TEST (OTHER) VALUES('4-V_PLANTILLA: '||V_PLANTILLA);
                        INSERT INTO T_TEST (OTHER) VALUES('4-I_COD_SUBTIPO_DOC: '||I_COD_SUBTIPO_DOC);*/
                        SCOB_SP_I_DOCUMENTO(N_GENERADOR_DOCUMENTO,
                                            TO_NUMBER(V_ID_EXPEDIENTE),
                                            PI_V_ESTADO_EXPEDIENTE,
                                            TO_NUMBER(V_PLANTILLA),
                                            NULL,
                                            V_COD_TIPO_PLAN,
                                            V_COD_TIPO_DOC,
                                            N_ID_TIPO_DOC,
                                            I_COD_SUBTIPO_DOC,
                                            I_NRO_REGLA,
                                            0,
                                            PI_V_ID_COSTAS,
                                            PI_V_POR_COSTAS,
                                            PI_V_VAL_COSTAS,
                                            PI_V_CNT_COSTAS,
                                            PI_V_SUB_TOTAL_COSTAS,
                                            PI_N_TOTAL_COSTAS,
                                            PI_N_NRO_ITEMSC,
                                            V_COD_AREA_USUARIO,
                                            V_SIGLAS_AREA_USUARIO,
                                            PI_N_ID_SERVICIO,
                                            PI_V_ID_TIPO_SERVICIO,
                                            PI_C_FLG_UCI,
                                            PI_V_AUDUSUCREACION,
                                            PI_N_ID_USUARIO_INGRESO,
                                            PI_V_FEC_GENERACION_DOC,
                                            PI_C_IND_GEN_REC,
                                            N_ID_EXPEDIENTE_DOCUMENTO_ORI,
                                            PO_N_COD_ERROR,
                                            PO_V_MSJ_ERROR);
                    
                        IF PO_N_COD_ERROR < 0 THEN
                            ROLLBACK;
                            RETURN;
                        END IF;
                        /*
                        --insertar la direccion asociada al expediente.
                        SCOB_SP_I_EXPED_DIREC(TO_NUMBER(V_ID_EXPEDIENTE),V_TIPO_ENTIDAD,0,0,N_ID_EXPEDIENTE_DOCUMENTO_ORI,PI_V_AUDUSUCREACION,po_n_retorno,po_n_cod_error, po_v_msj_error);
                        if po_n_cod_error < 0 then
                          rollback;
                          return;
                        end if;
                        */
                        --recuperando las variables de la plantilla seleccionada ced-rec
                        V_COD_TIPO_PLAN   := V_COD_TIPO_PLAN_AUX;
                        V_COD_TIPO_DOC    := V_COD_TIPO_DOC_AUX;
                        N_ID_TIPO_DOC     := N_ID_TIPO_DOC_AUX;
                        I_COD_SUBTIPO_DOC := I_COD_SUBTIPO_DOC_AUX;
                        I_NRO_REGLA       := I_NRO_REGLA_AUX;
                        V_PLANTILLA       := V_PLANTILLA_AUX;
                    END;
                END IF;
            
                --GENERA LOS DOCUMENTOS SEGUN TIPO DE ENTIDAD
                CASE V_TIPO_ENTIDAD
                    WHEN '0' THEN
                        --es una resolucion
                        --inserta el documento
                        --INSERT INTO T_TEST (OTHER) VALUES('5-I_COD_SUBTIPO_DOC: '||I_COD_SUBTIPO_DOC);
                        SCOB_SP_I_DOCUMENTO(N_GENERADOR_DOCUMENTO,
                                            TO_NUMBER(V_ID_EXPEDIENTE),
                                            PI_V_ESTADO_EXPEDIENTE,
                                            TO_NUMBER(V_PLANTILLA),
                                            TO_NUMBER(V_MOTIVO_PLANTILLA),
                                            V_COD_TIPO_PLAN,
                                            V_COD_TIPO_DOC,
                                            N_ID_TIPO_DOC,
                                            I_COD_SUBTIPO_DOC,
                                            I_NRO_REGLA,
                                            0,
                                            PI_V_ID_COSTAS,
                                            PI_V_POR_COSTAS,
                                            PI_V_VAL_COSTAS,
                                            PI_V_CNT_COSTAS,
                                            PI_V_SUB_TOTAL_COSTAS,
                                            PI_N_TOTAL_COSTAS,
                                            PI_N_NRO_ITEMSC,
                                            V_COD_AREA_USUARIO,
                                            V_SIGLAS_AREA_USUARIO,
                                            PI_N_ID_SERVICIO,
                                            PI_V_ID_TIPO_SERVICIO,
                                            PI_C_FLG_UCI,
                                            PI_V_AUDUSUCREACION,
                                            PI_N_ID_USUARIO_INGRESO,
                                            PI_V_FEC_GENERACION_DOC,
                                            PI_C_IND_GEN_REC,
                                            N_ID_EXPEDIENTE_DOCUMENTO_ORI,
                                            PO_N_COD_ERROR,
                                            PO_V_MSJ_ERROR);
                    
                        IF PO_N_COD_ERROR < 0 THEN
                            ROLLBACK;
                            RETURN;
                        END IF;
                        /*
                        --insertar la direccion asociada al expediente.
                        SCOB_SP_I_EXPED_DIREC(TO_NUMBER(V_ID_EXPEDIENTE),V_TIPO_ENTIDAD,0,0,N_ID_EXPEDIENTE_DOCUMENTO_OUT,PI_V_AUDUSUCREACION,po_n_retorno,po_n_cod_error, po_v_msj_error);
                        if po_n_cod_error < 0 then
                          rollback;
                          return;
                        end if;
                        */
                    WHEN SCOB_PK_CONSTANTES.C_COD_ENTIDAD_PERSONA THEN
                        --todas las personas
                        OPEN CUR_PERS FOR
                            SELECT DISTINCT EXPP.ID_PERSONA           AS ID_PERSONA,
                                            EXPP.ID_PERSONA_DOMICILIO AS ID_PERSONA_DOMICILIO
                              FROM T_SCOB_EXPEDIENTE_PERSONA EXPP
                             WHERE EXPP.ID_EXPEDIENTE = TO_NUMBER(V_ID_EXPEDIENTE)
                               AND EXPP.COD_TIPO_ENTIDAD = '1' --PERSONAS
                               AND EXPP.ESTADO = '1'
                             ORDER BY EXPP.ID_PERSONA,
                                      EXPP.ID_PERSONA_DOMICILIO;
                        LOOP
                            FETCH CUR_PERS
                                INTO N_ID_ENTIDAD,
                                     N_ID_ENTIDAD_DOMICILIO;
                            EXIT WHEN CUR_PERS%NOTFOUND;
                        
                            --inserta el documento
                            --INSERT INTO T_TEST (OTHER) VALUES('6-I_COD_SUBTIPO_DOC: '||I_COD_SUBTIPO_DOC);
                            SCOB_SP_I_DOCUMENTO(N_GENERADOR_DOCUMENTO,
                                                TO_NUMBER(V_ID_EXPEDIENTE),
                                                PI_V_ESTADO_EXPEDIENTE,
                                                TO_NUMBER(V_PLANTILLA),
                                                TO_NUMBER(V_MOTIVO_PLANTILLA),
                                                V_COD_TIPO_PLAN,
                                                V_COD_TIPO_DOC,
                                                N_ID_TIPO_DOC,
                                                I_COD_SUBTIPO_DOC,
                                                I_NRO_REGLA,
                                                N_ID_EXPEDIENTE_DOCUMENTO_ORI,
                                                PI_V_ID_COSTAS,
                                                PI_V_POR_COSTAS,
                                                PI_V_VAL_COSTAS,
                                                PI_V_CNT_COSTAS,
                                                PI_V_SUB_TOTAL_COSTAS,
                                                0,
                                                PI_N_NRO_ITEMSC,
                                                V_COD_AREA_USUARIO,
                                                V_SIGLAS_AREA_USUARIO,
                                                PI_N_ID_SERVICIO,
                                                PI_V_ID_TIPO_SERVICIO,
                                                PI_C_FLG_UCI,
                                                PI_V_AUDUSUCREACION,
                                                PI_N_ID_USUARIO_INGRESO,
                                                PI_V_FEC_GENERACION_DOC,
                                                PI_C_IND_GEN_REC,
                                                N_ID_EXPEDIENTE_DOCUMENTO_OUT,
                                                PO_N_COD_ERROR,
                                                PO_V_MSJ_ERROR);
                        
                            IF PO_N_COD_ERROR < 0 THEN
                                ROLLBACK;
                                RETURN;
                            END IF;
                            --insertar la direccion asociada al expediente.
                            SCOB_SP_I_EXPED_DIREC(TO_NUMBER(V_ID_EXPEDIENTE),
                                                  V_TIPO_ENTIDAD,
                                                  N_ID_ENTIDAD,
                                                  N_ID_ENTIDAD_DOMICILIO,
                                                  N_ID_EXPEDIENTE_DOCUMENTO_OUT,
                                                  PI_V_AUDUSUCREACION,
                                                  PO_N_RETORNO,
                                                  PO_N_COD_ERROR,
                                                  PO_V_MSJ_ERROR);
                        END LOOP;
                        CLOSE CUR_PERS;
                    
                    WHEN SCOB_PK_CONSTANTES.C_COD_ENTIDAD_DIREC_PERS THEN
                        --las direcciones de las personas seleccionadas
                        I_NRO_DOC := 1;
                        WHILE (I_NRO_DOC <= TO_NUMBER(V_NRO_ITEMSTE))
                        LOOP
                            SCOB_PK_UTILITARIO.SCOB_SP_S_SPLIT(V_ID_TIPO_ENTIDAD, ',', I_NRO_DOC + 1, V_ID_ENTIDAD_DOMICILIO);
                        
                            IF V_ID_ENTIDAD_DOMICILIO = '#' THEN
                                ROLLBACK;
                                EXIT;
                            END IF;
                            --inserta el documento
                        
                            SCOB_SP_I_DOCUMENTO(N_GENERADOR_DOCUMENTO,
                                                TO_NUMBER(V_ID_EXPEDIENTE),
                                                PI_V_ESTADO_EXPEDIENTE,
                                                TO_NUMBER(V_PLANTILLA),
                                                TO_NUMBER(V_MOTIVO_PLANTILLA),
                                                V_COD_TIPO_PLAN,
                                                V_COD_TIPO_DOC,
                                                N_ID_TIPO_DOC,
                                                I_COD_SUBTIPO_DOC,
                                                I_NRO_REGLA,
                                                N_ID_EXPEDIENTE_DOCUMENTO_ORI,
                                                PI_V_ID_COSTAS,
                                                PI_V_POR_COSTAS,
                                                PI_V_VAL_COSTAS,
                                                PI_V_CNT_COSTAS,
                                                PI_V_SUB_TOTAL_COSTAS,
                                                0,
                                                PI_N_NRO_ITEMSC,
                                                V_COD_AREA_USUARIO,
                                                V_SIGLAS_AREA_USUARIO,
                                                PI_N_ID_SERVICIO,
                                                PI_V_ID_TIPO_SERVICIO,
                                                PI_C_FLG_UCI,
                                                PI_V_AUDUSUCREACION,
                                                PI_N_ID_USUARIO_INGRESO,
                                                PI_V_FEC_GENERACION_DOC,
                                                PI_C_IND_GEN_REC,
                                                N_ID_EXPEDIENTE_DOCUMENTO_OUT,
                                                PO_N_COD_ERROR,
                                                PO_V_MSJ_ERROR);
                        
                            IF PO_N_COD_ERROR < 0 THEN
                                ROLLBACK;
                                RETURN;
                            END IF;
                            N_ID_ENTIDAD_DOMICILIO := TO_NUMBER(V_ID_ENTIDAD_DOMICILIO);
                            --obtener el id de la persona;
                            SELECT PDOM.ID_PERSONA
                              INTO N_ID_ENTIDAD
                              FROM T_SCOB_PERSONA_DOMICILIO PDOM
                             WHERE PDOM.ID_PERSONA_DOMICILIO = N_ID_ENTIDAD_DOMICILIO;
                        
                            --insertar la direccion asociada al expediente.
                        
                            SCOB_SP_I_EXPED_DIREC(TO_NUMBER(V_ID_EXPEDIENTE),
                                                  V_TIPO_ENTIDAD,
                                                  N_ID_ENTIDAD,
                                                  N_ID_ENTIDAD_DOMICILIO,
                                                  N_ID_EXPEDIENTE_DOCUMENTO_OUT,
                                                  PI_V_AUDUSUCREACION,
                                                  PO_N_RETORNO,
                                                  PO_N_COD_ERROR,
                                                  PO_V_MSJ_ERROR);
                        
                            I_NRO_DOC := I_NRO_DOC + 1;
                        END LOOP;
                    
                    WHEN SCOB_PK_CONSTANTES.C_COD_ENTIDAD_TASADOR THEN
                        --las direcciones de las personas tasadoras
                        I_NRO_DOC := 1;
                        WHILE (I_NRO_DOC <= TO_NUMBER(V_NRO_ITEMSTE))
                        LOOP
                            SCOB_PK_UTILITARIO.SCOB_SP_S_SPLIT(V_ID_TIPO_ENTIDAD, ',', I_NRO_DOC + 1, V_ID_ENTIDAD_DOMICILIO);
                        
                            IF V_ID_ENTIDAD_DOMICILIO = '#' THEN
                                ROLLBACK;
                                EXIT;
                            END IF;
                        
                            --inserta el documento
                        
                            SCOB_SP_I_DOCUMENTO(N_GENERADOR_DOCUMENTO,
                                                TO_NUMBER(V_ID_EXPEDIENTE),
                                                PI_V_ESTADO_EXPEDIENTE,
                                                TO_NUMBER(V_PLANTILLA),
                                                TO_NUMBER(V_MOTIVO_PLANTILLA),
                                                V_COD_TIPO_PLAN,
                                                V_COD_TIPO_DOC,
                                                N_ID_TIPO_DOC,
                                                I_COD_SUBTIPO_DOC,
                                                I_NRO_REGLA,
                                                N_ID_EXPEDIENTE_DOCUMENTO_ORI,
                                                PI_V_ID_COSTAS,
                                                PI_V_POR_COSTAS,
                                                PI_V_VAL_COSTAS,
                                                PI_V_CNT_COSTAS,
                                                PI_V_SUB_TOTAL_COSTAS,
                                                0,
                                                PI_N_NRO_ITEMSC,
                                                V_COD_AREA_USUARIO,
                                                V_SIGLAS_AREA_USUARIO,
                                                PI_N_ID_SERVICIO,
                                                PI_V_ID_TIPO_SERVICIO,
                                                PI_C_FLG_UCI,
                                                PI_V_AUDUSUCREACION,
                                                PI_N_ID_USUARIO_INGRESO,
                                                PI_V_FEC_GENERACION_DOC,
                                                PI_C_IND_GEN_REC,
                                                N_ID_EXPEDIENTE_DOCUMENTO_OUT,
                                                PO_N_COD_ERROR,
                                                PO_V_MSJ_ERROR);
                        
                            IF PO_N_COD_ERROR < 0 THEN
                                ROLLBACK;
                                RETURN;
                            END IF;
                            N_ID_ENTIDAD_DOMICILIO := TO_NUMBER(V_ID_ENTIDAD_DOMICILIO);
                        
                            --obtener el id de la persona;
                            SELECT DISTINCT PDOM.ID_PERSONA,
                                            EXPE.COD_TIPO_ENTIDAD
                              INTO N_ID_ENTIDAD,
                                   V_TIPO_ENTIDAD
                              FROM T_SCOB_PERSONA_DOMICILIO PDOM
                             INNER JOIN T_SCOB_EXPEDIENTE_PERSONA EXPE
                                ON EXPE.ID_PERSONA = PDOM.ID_PERSONA
                               AND EXPE.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
                               AND EXPE.ID_EXPEDIENTE = TO_NUMBER(V_ID_EXPEDIENTE)
                             WHERE PDOM.ID_PERSONA_DOMICILIO = N_ID_ENTIDAD_DOMICILIO;
                        
                            --insertar la direccion asociada al expediente.
                        
                            SCOB_SP_I_EXPED_DIREC(TO_NUMBER(V_ID_EXPEDIENTE),
                                                  V_TIPO_ENTIDAD,
                                                  N_ID_ENTIDAD,
                                                  N_ID_ENTIDAD_DOMICILIO,
                                                  N_ID_EXPEDIENTE_DOCUMENTO_OUT,
                                                  PI_V_AUDUSUCREACION,
                                                  PO_N_RETORNO,
                                                  PO_N_COD_ERROR,
                                                  PO_V_MSJ_ERROR);
                        
                            I_NRO_DOC := I_NRO_DOC + 1;
                        END LOOP;
                    
                    ELSE
                        --los bancos, sat, sunat, pnp, etc, seleccionados
                    
                        N_ID_ENTIDAD_DOMICILIO := NULL; --SIN DIRECCIONES, SOLO ENTIDADES.
                        I_NRO_DOC              := 1;
                        WHILE (I_NRO_DOC <= TO_NUMBER(V_NRO_ITEMSTE))
                        LOOP
                            SCOB_PK_UTILITARIO.SCOB_SP_S_SPLIT(V_ID_TIPO_ENTIDAD, ',', I_NRO_DOC + 1, V_ID_ENTIDAD);
                        
                            IF V_ID_ENTIDAD = '#' THEN
                                EXIT;
                            END IF;
                            N_ID_ENTIDAD := TO_NUMBER(V_ID_ENTIDAD);
                            --inserta el documento
                        
                            SCOB_SP_I_DOCUMENTO(N_GENERADOR_DOCUMENTO,
                                                TO_NUMBER(V_ID_EXPEDIENTE),
                                                PI_V_ESTADO_EXPEDIENTE,
                                                TO_NUMBER(V_PLANTILLA),
                                                TO_NUMBER(V_MOTIVO_PLANTILLA),
                                                V_COD_TIPO_PLAN,
                                                V_COD_TIPO_DOC,
                                                N_ID_TIPO_DOC,
                                                I_COD_SUBTIPO_DOC,
                                                I_NRO_REGLA,
                                                N_ID_EXPEDIENTE_DOCUMENTO_ORI,
                                                PI_V_ID_COSTAS,
                                                PI_V_POR_COSTAS,
                                                PI_V_VAL_COSTAS,
                                                PI_V_CNT_COSTAS,
                                                PI_V_SUB_TOTAL_COSTAS,
                                                0,
                                                PI_N_NRO_ITEMSC,
                                                V_COD_AREA_USUARIO,
                                                V_SIGLAS_AREA_USUARIO,
                                                PI_N_ID_SERVICIO,
                                                PI_V_ID_TIPO_SERVICIO,
                                                PI_C_FLG_UCI,
                                                PI_V_AUDUSUCREACION,
                                                PI_N_ID_USUARIO_INGRESO,
                                                PI_V_FEC_GENERACION_DOC,
                                                PI_C_IND_GEN_REC,
                                                N_ID_EXPEDIENTE_DOCUMENTO_OUT,
                                                PO_N_COD_ERROR,
                                                PO_V_MSJ_ERROR);
                        
                            IF PO_N_COD_ERROR < 0 THEN
                                ROLLBACK;
                                RETURN;
                            END IF;
                        
                            --insertar la direccion asociada al expediente.
                        
                            SCOB_SP_I_EXPED_DIREC(TO_NUMBER(V_ID_EXPEDIENTE),
                                                  V_TIPO_ENTIDAD,
                                                  N_ID_ENTIDAD,
                                                  N_ID_ENTIDAD_DOMICILIO,
                                                  N_ID_EXPEDIENTE_DOCUMENTO_OUT,
                                                  PI_V_AUDUSUCREACION,
                                                  PO_N_RETORNO,
                                                  PO_N_COD_ERROR,
                                                  PO_V_MSJ_ERROR);
                        
                            I_NRO_DOC := I_NRO_DOC + 1;
                        END LOOP;
                    
                END CASE;
            
                N_CONTP := N_CONTP + 1;
            END LOOP;
        
            N_CONT := N_CONT + 1;
        END LOOP;
    
        PO_N_COD_ERROR := 0;
        PO_N_RETORNO   := N_GENERADOR_DOCUMENTO;
    
        ----
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('ERROR 1: ');
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

    PROCEDURE SCOB_SP_I_GENERA_DOCUMENTO_V2
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 10.04.2012
        -- Proposito    : insertar los documentos plantillas generados por el sistema
                          por cada entidad.
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_V_ID_EXPEDIENTE IN VARCHAR2, --CADENA DE EXPEDIENTES
     PI_N_NRO_ITEMS     IN NUMBER,
     --
     PI_N_ID_MOTIVO        IN T_SCOB_EXPEDIENTE_ESTADO.ID_MOTIVO%TYPE,
     PI_V_ID_PLANTILLA     IN VARCHAR2, --CADENA DE PLANTILLAS (EL PRIMERO SIEMPRE DEBE SER LA RESOLUCION, SI ES EL CASO)
     PI_V_MOTIVO_PLANTILLA IN VARCHAR2, --CADENA DE MOTIVOS PLANTILLAS (EL PRIMERO SIEMPRE DEBE SER LA RESOLUCION, SI ES EL CASO)
     PI_N_NRO_ITEMSP       IN NUMBER, --SI SE ENVIAN DOS DOCUMENTO, SIEMPRE DEBE ESTAR LA REC PRIMERO.
     --
     PI_V_ID_COSTAS        IN VARCHAR2,
     PI_V_POR_COSTAS       IN VARCHAR2,
     PI_V_VAL_COSTAS       IN VARCHAR2,
     PI_V_CNT_COSTAS       IN VARCHAR2,
     PI_V_SUB_TOTAL_COSTAS IN VARCHAR2,
     PI_N_TOTAL_COSTAS     IN T_SCOB_EXPEDIENTE_DOCUMENTO.MONTO_COSTA%TYPE,
     PI_N_NRO_ITEMSC       IN INTEGER,
     -------------------------
     PI_V_ESTADO_EXPEDIENTE IN T_SCOB_EXPEDIENTE_DOCUMENTO.ESTADO_EXPEDIENTE%TYPE,
     PI_N_ID_EXP_DOC_ORIGEN IN T_SCOB_EXPEDIENTE_DOCUMENTO.ID_EXPEDIENTE_DOCUMENTO_ORIGEN%TYPE,
     ---
     PI_V_TIPO_ENTIDAD    IN VARCHAR2, --0=NINGUNO;1=PERSONA;2=BANCO;3=DIREC PERSONAS;4=SUNAT;5=PNP;6=SAT;7=CAJA METROPOLITANA
     PI_I_NRO_ITEMSE      IN NUMBER,
     PI_V_ID_TIPO_ENTIDAD IN VARCHAR2, --entidades a quienes va dirigido
     PI_V_NRO_ITEMSTE     IN VARCHAR2, --cadena con los numero de entidades a quienes ira dirigido
     --
     PI_N_ID_SERVICIO      IN NUMBER,
     PI_V_ID_TIPO_SERVICIO IN VARCHAR2,
     PI_C_FLG_UCI          IN CHAR,
     ---
     PI_V_AUDUSUCREACION     IN T_SCOB_EXPEDIENTE_DOCUMENTO.AUDUSUCREACION%TYPE,
     PI_N_ID_USUARIO_INGRESO IN T_SCOB_USUARIO.ID_USUARIO%TYPE,
     PI_V_FEC_GENERACION_DOC IN VARCHAR,
     PI_C_IND_GEN_REC        IN CHAR,
     PO_N_RETORNO            OUT NUMBER,
     PO_N_COD_ERROR          OUT NUMBER,
     PO_V_MSJ_ERROR          OUT VARCHAR2) IS
    
        N_ID_EXPEDIENTE_DOCUMENTO_ORI T_SCOB_EXPEDIENTE_DOCUMENTO.ID_EXPEDIENTE_DOCUMENTO%TYPE;
        N_ID_EXPEDIENTE_DOCUMENTO_OUT T_SCOB_EXPEDIENTE_DOCUMENTO.ID_EXPEDIENTE_DOCUMENTO%TYPE;
        N_GENERADOR_DOCUMENTO         NUMBER;
        N_CONT                        INTEGER;
        N_CONTP                       INTEGER;
        N_CONTE                       INTEGER;
        V_ID_EXPEDIENTE               VARCHAR2(50);
        V_MOTIVO_PLANTILLA            VARCHAR2(50);
        V_PLANTILLA                   VARCHAR2(50);
    
        V_COD_TIPO_PLAN         T_SCOB_PLANTILLA.COD_INTERNO%TYPE;
        V_COD_TIPO_PLAN_INTERNO T_SCOB_PLANTILLA.COD_INTERNO%TYPE;
        V_COD_TIPO_DOC          T_SCOB_PLANTILLA.COD_INTERNO%TYPE;
        I_COD_SUBTIPO_DOC       INTEGER;
        N_ID_TIPO_DOC           T_SCOB_TIPO_DOCUMENTO.ID_TIPO_DOCUMENTO%TYPE;
        N_ID_TIPO_DOC_RES       INTEGER;
        I_NRO_REGLA             INTEGER;
    
        V_COD_TIPO_PLAN_AUX   T_SCOB_PLANTILLA.COD_INTERNO%TYPE;
        V_COD_TIPO_DOC_AUX    T_SCOB_PLANTILLA.COD_INTERNO%TYPE;
        N_ID_TIPO_DOC_AUX     T_SCOB_TIPO_DOCUMENTO.ID_TIPO_DOCUMENTO%TYPE;
        I_COD_SUBTIPO_DOC_AUX INTEGER;
        I_NRO_REGLA_AUX       INTEGER;
        V_PLANTILLA_AUX       T_SCOB_PLANTILLA.COD_INTERNO%TYPE;
    
        V_COD_AREA_USUARIO    VARCHAR(10);
        V_SIGLAS_AREA_USUARIO T_SCOB_AREA_COBRANZA.SIGLAS%TYPE;
        I_FLG_INGRESO         INTEGER;
        I_NRO_DOC             INTEGER;
    
        V_TIPO_ENTIDAD    VARCHAR2(1000);
        V_ID_TIPO_ENTIDAD VARCHAR2(1000);
        V_NRO_ITEMSTE     VARCHAR2(1000);
    
        CUR_PERS               CU_REC_SET;
        N_ID_ENTIDAD           NUMBER;
        N_ID_ENTIDAD_DOMICILIO NUMBER;
        V_ID_ENTIDAD           VARCHAR(5);
        V_ID_ENTIDAD_DOMICILIO VARCHAR(5);
        N_ID_MOTIVO            T_SCOB_EXPEDIENTE.ID_MOTIVO%TYPE;
    BEGIN
        PO_V_MSJ_ERROR := '';
        PO_N_RETORNO   := 0;
        PO_N_COD_ERROR := -1;
    
        SELECT SCOB_SQ_GENERADOR_DOCUMENTO.NEXTVAL INTO N_GENERADOR_DOCUMENTO FROM DUAL;
    
        BEGIN
            --obtener el area de cobranza del usuario
            SELECT UPPER(TRIM(ACOB.SIGLAS)),
                   UPPER(TRIM(ACOB.CODIGO))
              INTO V_SIGLAS_AREA_USUARIO,
                   V_COD_AREA_USUARIO
              FROM T_SCOB_USUARIO USUA
             INNER JOIN T_SCOB_AREA_COBRANZA ACOB
                ON ACOB.ID_AREA_COBRANZA = USUA.ID_AREA_COBRANZA
             WHERE UPPER(TRIM(USUA.USUARIO)) = UPPER(TRIM(PI_V_AUDUSUCREACION));
        
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                PO_N_COD_ERROR := -10;
                PO_V_MSJ_ERROR := 'No se pudo realizar la accion. El usuario no pertenece al Area de Cobranza.';
                PO_N_RETORNO   := PO_N_COD_ERROR;
                RETURN;
        END;
    
        V_SIGLAS_AREA_USUARIO := '/' || V_SIGLAS_AREA_USUARIO;
    
        N_ID_EXPEDIENTE_DOCUMENTO_ORI := 0;
        IF PI_N_ID_EXP_DOC_ORIGEN <> 0 THEN
            N_ID_EXPEDIENTE_DOCUMENTO_ORI := PI_N_ID_EXP_DOC_ORIGEN;
        END IF;
    
        I_FLG_INGRESO := 0;
        --insertar los documentos por expediente
        N_CONT := 1;
        WHILE (N_CONT <= PI_N_NRO_ITEMS)
        LOOP
            SCOB_PK_UTILITARIO.SCOB_SP_S_SPLIT(PI_V_ID_EXPEDIENTE, '|', N_CONT + 1, V_ID_EXPEDIENTE);
        
            IF V_ID_EXPEDIENTE = '#' THEN
                EXIT;
            END IF;
        
            IF NVL(PI_N_ID_MOTIVO, 0) = 0 THEN
                --OBTENER EL ULTIMO MOTIVO REGISTRADO DEL EXPEDIENTE
                BEGIN
                    SELECT EXPE.ID_MOTIVO INTO N_ID_MOTIVO FROM T_SCOB_EXPEDIENTE EXPE WHERE EXPE.ID_EXPEDIENTE = TO_NUMBER(V_ID_EXPEDIENTE);
                
                EXCEPTION
                    WHEN NO_DATA_FOUND THEN
                        N_ID_MOTIVO := 0;
                END;
            ELSE
                N_ID_MOTIVO := PI_N_ID_MOTIVO;
            END IF;
        
            SCOB_PK_EXPEDIENTE.SCOB_SP_I_EXPEDIENTE_ESTADO(TO_NUMBER(V_ID_EXPEDIENTE),
                                                           N_ID_MOTIVO,
                                                           PI_V_ESTADO_EXPEDIENTE,
                                                           PI_V_AUDUSUCREACION,
                                                           PO_N_COD_ERROR,
                                                           PO_V_MSJ_ERROR);
            IF PO_N_COD_ERROR < 0 THEN
                RETURN;
            END IF;
        
            --obtener la plantilla
            N_CONTP := 1;
            WHILE (N_CONTP <= PI_N_NRO_ITEMSP)
            LOOP
                I_FLG_INGRESO := 0; --11.07.2011 --COMENTADO 09.04.2012
            
                SCOB_PK_UTILITARIO.SCOB_SP_S_SPLIT(PI_V_ID_PLANTILLA, '|', N_CONTP + 1, V_PLANTILLA);
                SCOB_PK_UTILITARIO.SCOB_SP_S_SPLIT(PI_V_MOTIVO_PLANTILLA, '|', N_CONTP + 1, V_MOTIVO_PLANTILLA);
            
                IF V_PLANTILLA = '#' THEN
                    EXIT;
                END IF;
            
                --obtener el tipo de documento de la plantilla, tipo de documento y generador de numeracion
                SELECT TRIM(PLNT.CODIGO) AS COD_TIPO_PLANTILLA,
                       TRIM(PLNT.COD_INTERNO) AS COD_TIPO_PLANTILLA_INTERNO,
                       TRIM(TIP_DOC.COD_TIPO_DOCUMENTO) AS COD_TIPO_DOCUMENTO,
                       TIP_DOC.ID_TIPO_DOCUMENTO AS ID_TIPO_DOC,
                       TIP_DOC.COD_SUBTIPO_DOCUMENTO AS ID_SUBTIPO_DOC,
                       TO_NUMBER(REGL.TXT_VALOR1) AS NRO_REGLA,
                       NVL(PLNT.ID_PLANTILLA_RESOLUCION, 0) AS ID_TIPO_DOCUMENTO_RESOLUCION
                  INTO V_COD_TIPO_PLAN,
                       V_COD_TIPO_PLAN_INTERNO,
                       V_COD_TIPO_DOC,
                       N_ID_TIPO_DOC,
                       I_COD_SUBTIPO_DOC,
                       I_NRO_REGLA,
                       N_ID_TIPO_DOC_RES
                  FROM T_SCOB_PLANTILLA PLNT
                 INNER JOIN T_SCOB_TIPO_DOCUMENTO TIP_DOC
                    ON TIP_DOC.ID_TIPO_DOCUMENTO = PLNT.ID_TIPO_DOCUMENTO
                 INNER JOIN T_SCOB_TABLA_DET REGL
                    ON REGL.ID_TABLA = SCOB_PK_CONSTANTES.C_TBL_SUB_TIPO_DOCUMENTO
                   AND TO_NUMBER(REGL.COD_INTERNO) = TO_NUMBER(TIP_DOC.COD_SUBTIPO_DOCUMENTO)
                 WHERE PLNT.ID_PLANTILLA = TO_NUMBER(V_PLANTILLA);
            
                IF (I_COD_SUBTIPO_DOC = SCOB_PK_CONSTANTES.C_COD_SUBTIPODOC_CED_REC) --CED-REC
                   AND
                   (I_FLG_INGRESO = 0) THEN
                    BEGIN
                        I_FLG_INGRESO := '1';
                    
                        V_COD_TIPO_PLAN_AUX   := V_COD_TIPO_PLAN;
                        V_COD_TIPO_DOC_AUX    := V_COD_TIPO_DOC;
                        N_ID_TIPO_DOC_AUX     := N_ID_TIPO_DOC;
                        I_COD_SUBTIPO_DOC_AUX := I_COD_SUBTIPO_DOC;
                        I_NRO_REGLA_AUX       := I_NRO_REGLA;
                        V_PLANTILLA_AUX       := V_PLANTILLA;
                    
                        --obtener la plantilla de resolucion asociada al documento
                        SELECT TRIM(PLNT_RESOL.CODIGO) AS COD_TIPO_PLANTILLA,
                               TRIM(TIP_DOC.COD_TIPO_DOCUMENTO) AS COD_TIPO_DOCUMENTO,
                               TIP_DOC.ID_TIPO_DOCUMENTO AS ID_TIPO_DOC,
                               TIP_DOC.COD_SUBTIPO_DOCUMENTO AS ID_SUBTIPO_DOC,
                               TO_NUMBER(REGL.TXT_VALOR1) AS NRO_REGLA,
                               TO_CHAR(PLNT_RESOL.ID_PLANTILLA) AS ID_PLANTILLA
                          INTO V_COD_TIPO_PLAN,
                               V_COD_TIPO_DOC,
                               N_ID_TIPO_DOC,
                               I_COD_SUBTIPO_DOC,
                               I_NRO_REGLA,
                               V_PLANTILLA
                          FROM T_SCOB_PLANTILLA PLNT_RESOL
                         INNER JOIN T_SCOB_TIPO_DOCUMENTO TIP_DOC
                            ON TIP_DOC.ID_TIPO_DOCUMENTO = PLNT_RESOL.ID_TIPO_DOCUMENTO
                         INNER JOIN T_SCOB_TABLA_DET REGL
                            ON REGL.ID_TABLA = SCOB_PK_CONSTANTES.C_TBL_SUB_TIPO_DOCUMENTO
                           AND TO_NUMBER(REGL.COD_INTERNO) = TO_NUMBER(TIP_DOC.COD_SUBTIPO_DOCUMENTO)
                         WHERE PLNT_RESOL.COD_INTERNO = V_COD_TIPO_PLAN_INTERNO
                           AND NVL(PLNT_RESOL.ID_PLANTILLA_RESOLUCION, 0) = 0;
                    
                        --SE FUERZA A GENERAR ANTES UN DOCUMENTO DEL TIPO RESOLUCION
                        --inserta el documento
                        SCOB_SP_I_DOCUMENTO(N_GENERADOR_DOCUMENTO,
                                            TO_NUMBER(V_ID_EXPEDIENTE),
                                            PI_V_ESTADO_EXPEDIENTE,
                                            TO_NUMBER(V_PLANTILLA),
                                            NULL,
                                            V_COD_TIPO_PLAN,
                                            V_COD_TIPO_DOC,
                                            N_ID_TIPO_DOC,
                                            I_COD_SUBTIPO_DOC,
                                            I_NRO_REGLA,
                                            0,
                                            PI_V_ID_COSTAS,
                                            PI_V_POR_COSTAS,
                                            PI_V_VAL_COSTAS,
                                            PI_V_CNT_COSTAS,
                                            PI_V_SUB_TOTAL_COSTAS,
                                            PI_N_TOTAL_COSTAS,
                                            PI_N_NRO_ITEMSC,
                                            V_COD_AREA_USUARIO,
                                            V_SIGLAS_AREA_USUARIO,
                                            PI_N_ID_SERVICIO,
                                            PI_V_ID_TIPO_SERVICIO,
                                            PI_C_FLG_UCI,
                                            PI_V_AUDUSUCREACION,
                                            PI_N_ID_USUARIO_INGRESO,
                                            PI_V_FEC_GENERACION_DOC,
                                            PI_C_IND_GEN_REC,
                                            N_ID_EXPEDIENTE_DOCUMENTO_ORI,
                                            PO_N_COD_ERROR,
                                            PO_V_MSJ_ERROR);
                    
                        IF PO_N_COD_ERROR < 0 THEN
                            ROLLBACK;
                            RETURN;
                        END IF;
                    
                        --recuperando las variables de la plantilla seleccionada ced-rec
                        V_COD_TIPO_PLAN   := V_COD_TIPO_PLAN_AUX;
                        V_COD_TIPO_DOC    := V_COD_TIPO_DOC_AUX;
                        N_ID_TIPO_DOC     := N_ID_TIPO_DOC_AUX;
                        I_COD_SUBTIPO_DOC := I_COD_SUBTIPO_DOC_AUX;
                        I_NRO_REGLA       := I_NRO_REGLA_AUX;
                        V_PLANTILLA       := V_PLANTILLA_AUX;
                    
                    END;
                END IF;
            
                N_CONTE := 1;
                WHILE (N_CONTE <= PI_I_NRO_ITEMSE)
                LOOP
                
                    SCOB_PK_UTILITARIO.SCOB_SP_S_SPLIT(PI_V_TIPO_ENTIDAD, '|', N_CONTE + 1, V_TIPO_ENTIDAD); --tipos de entidad
                    SCOB_PK_UTILITARIO.SCOB_SP_S_SPLIT(PI_V_ID_TIPO_ENTIDAD, '|', N_CONTE + 1, V_ID_TIPO_ENTIDAD); --detalle de entidades
                    SCOB_PK_UTILITARIO.SCOB_SP_S_SPLIT(PI_V_NRO_ITEMSTE, '|', N_CONTE + 1, V_NRO_ITEMSTE);
                
                    IF V_TIPO_ENTIDAD = '#' THEN
                        EXIT;
                    END IF;
                
                    --GENERA LOS DOCUMENTOS SEGUN TIPO DE ENTIDAD
                    CASE V_TIPO_ENTIDAD
                        WHEN '0' THEN
                            --es una resolucion
                            --inserta el documento
                            SCOB_SP_I_DOCUMENTO(N_GENERADOR_DOCUMENTO,
                                                TO_NUMBER(V_ID_EXPEDIENTE),
                                                PI_V_ESTADO_EXPEDIENTE,
                                                TO_NUMBER(V_PLANTILLA),
                                                TO_NUMBER(V_MOTIVO_PLANTILLA),
                                                V_COD_TIPO_PLAN,
                                                V_COD_TIPO_DOC,
                                                N_ID_TIPO_DOC,
                                                I_COD_SUBTIPO_DOC,
                                                I_NRO_REGLA,
                                                0,
                                                PI_V_ID_COSTAS,
                                                PI_V_POR_COSTAS,
                                                PI_V_VAL_COSTAS,
                                                PI_V_CNT_COSTAS,
                                                PI_V_SUB_TOTAL_COSTAS,
                                                PI_N_TOTAL_COSTAS,
                                                PI_N_NRO_ITEMSC,
                                                V_COD_AREA_USUARIO,
                                                V_SIGLAS_AREA_USUARIO,
                                                PI_N_ID_SERVICIO,
                                                PI_V_ID_TIPO_SERVICIO,
                                                PI_C_FLG_UCI,
                                                PI_V_AUDUSUCREACION,
                                                PI_N_ID_USUARIO_INGRESO,
                                                PI_V_FEC_GENERACION_DOC,
                                                PI_C_IND_GEN_REC,
                                                N_ID_EXPEDIENTE_DOCUMENTO_ORI,
                                                PO_N_COD_ERROR,
                                                PO_V_MSJ_ERROR);
                        
                            IF PO_N_COD_ERROR < 0 THEN
                                ROLLBACK;
                                RETURN;
                            END IF;
                        
                        WHEN SCOB_PK_CONSTANTES.C_COD_ENTIDAD_PERSONA THEN
                            --todas las personas
                        
                            OPEN CUR_PERS FOR
                                SELECT DISTINCT EXPP.ID_PERSONA           AS ID_PERSONA,
                                                EXPP.ID_PERSONA_DOMICILIO AS ID_PERSONA_DOMICILIO
                                  FROM T_SCOB_EXPEDIENTE_PERSONA EXPP
                                 WHERE EXPP.ID_EXPEDIENTE = TO_NUMBER(V_ID_EXPEDIENTE)
                                   AND EXPP.COD_TIPO_ENTIDAD = '1' --PERSONAS
                                   AND EXPP.ESTADO = '1'
                                 ORDER BY EXPP.ID_PERSONA,
                                          EXPP.ID_PERSONA_DOMICILIO;
                        
                            LOOP
                                FETCH CUR_PERS
                                    INTO N_ID_ENTIDAD,
                                         N_ID_ENTIDAD_DOMICILIO;
                                EXIT WHEN CUR_PERS%NOTFOUND;
                            
                                --inserta el documento
                                SCOB_SP_I_DOCUMENTO(N_GENERADOR_DOCUMENTO,
                                                    TO_NUMBER(V_ID_EXPEDIENTE),
                                                    PI_V_ESTADO_EXPEDIENTE,
                                                    TO_NUMBER(V_PLANTILLA),
                                                    TO_NUMBER(V_MOTIVO_PLANTILLA),
                                                    V_COD_TIPO_PLAN,
                                                    V_COD_TIPO_DOC,
                                                    N_ID_TIPO_DOC,
                                                    I_COD_SUBTIPO_DOC,
                                                    I_NRO_REGLA,
                                                    N_ID_EXPEDIENTE_DOCUMENTO_ORI,
                                                    PI_V_ID_COSTAS,
                                                    PI_V_POR_COSTAS,
                                                    PI_V_VAL_COSTAS,
                                                    PI_V_CNT_COSTAS,
                                                    PI_V_SUB_TOTAL_COSTAS,
                                                    0,
                                                    PI_N_NRO_ITEMSC,
                                                    V_COD_AREA_USUARIO,
                                                    V_SIGLAS_AREA_USUARIO,
                                                    PI_N_ID_SERVICIO,
                                                    PI_V_ID_TIPO_SERVICIO,
                                                    PI_C_FLG_UCI,
                                                    PI_V_AUDUSUCREACION,
                                                    PI_N_ID_USUARIO_INGRESO,
                                                    PI_V_FEC_GENERACION_DOC,
                                                    PI_C_IND_GEN_REC,
                                                    N_ID_EXPEDIENTE_DOCUMENTO_OUT,
                                                    PO_N_COD_ERROR,
                                                    PO_V_MSJ_ERROR);
                            
                                IF PO_N_COD_ERROR < 0 THEN
                                    ROLLBACK;
                                    RETURN;
                                END IF;
                            
                                --insertar la direccion asociada al expediente.
                                SCOB_SP_I_EXPED_DIREC(TO_NUMBER(V_ID_EXPEDIENTE),
                                                      V_TIPO_ENTIDAD,
                                                      N_ID_ENTIDAD,
                                                      N_ID_ENTIDAD_DOMICILIO,
                                                      N_ID_EXPEDIENTE_DOCUMENTO_OUT,
                                                      PI_V_AUDUSUCREACION,
                                                      PO_N_RETORNO,
                                                      PO_N_COD_ERROR,
                                                      PO_V_MSJ_ERROR);
                            
                            END LOOP;
                            CLOSE CUR_PERS;
                        
                        WHEN SCOB_PK_CONSTANTES.C_COD_ENTIDAD_DIREC_PERS THEN
                            --las direcciones de las personas seleccionadas
                            I_NRO_DOC := 1;
                            WHILE (I_NRO_DOC <= TO_NUMBER(V_NRO_ITEMSTE))
                            LOOP
                            
                                SCOB_PK_UTILITARIO.SCOB_SP_S_SPLIT(V_ID_TIPO_ENTIDAD, ',', I_NRO_DOC + 1, V_ID_ENTIDAD_DOMICILIO);
                            
                                IF V_ID_ENTIDAD_DOMICILIO = '#' THEN
                                    ROLLBACK;
                                    EXIT;
                                END IF;
                            
                                --inserta el documento
                                SCOB_SP_I_DOCUMENTO(N_GENERADOR_DOCUMENTO,
                                                    TO_NUMBER(V_ID_EXPEDIENTE),
                                                    PI_V_ESTADO_EXPEDIENTE,
                                                    TO_NUMBER(V_PLANTILLA),
                                                    TO_NUMBER(V_MOTIVO_PLANTILLA),
                                                    V_COD_TIPO_PLAN,
                                                    V_COD_TIPO_DOC,
                                                    N_ID_TIPO_DOC,
                                                    I_COD_SUBTIPO_DOC,
                                                    I_NRO_REGLA,
                                                    N_ID_EXPEDIENTE_DOCUMENTO_ORI,
                                                    PI_V_ID_COSTAS,
                                                    PI_V_POR_COSTAS,
                                                    PI_V_VAL_COSTAS,
                                                    PI_V_CNT_COSTAS,
                                                    PI_V_SUB_TOTAL_COSTAS,
                                                    0,
                                                    PI_N_NRO_ITEMSC,
                                                    V_COD_AREA_USUARIO,
                                                    V_SIGLAS_AREA_USUARIO,
                                                    PI_N_ID_SERVICIO,
                                                    PI_V_ID_TIPO_SERVICIO,
                                                    PI_C_FLG_UCI,
                                                    PI_V_AUDUSUCREACION,
                                                    PI_N_ID_USUARIO_INGRESO,
                                                    PI_V_FEC_GENERACION_DOC,
                                                    PI_C_IND_GEN_REC,
                                                    N_ID_EXPEDIENTE_DOCUMENTO_OUT,
                                                    PO_N_COD_ERROR,
                                                    PO_V_MSJ_ERROR);
                            
                                IF PO_N_COD_ERROR < 0 THEN
                                    ROLLBACK;
                                    RETURN;
                                END IF;
                                N_ID_ENTIDAD_DOMICILIO := TO_NUMBER(V_ID_ENTIDAD_DOMICILIO);
                                --obtener el id de la persona;
                                SELECT PDOM.ID_PERSONA
                                  INTO N_ID_ENTIDAD
                                  FROM T_SCOB_PERSONA_DOMICILIO PDOM
                                 WHERE PDOM.ID_PERSONA_DOMICILIO = N_ID_ENTIDAD_DOMICILIO;
                            
                                --insertar la direccion asociada al expediente.
                                SCOB_SP_I_EXPED_DIREC(TO_NUMBER(V_ID_EXPEDIENTE),
                                                      V_TIPO_ENTIDAD,
                                                      N_ID_ENTIDAD,
                                                      N_ID_ENTIDAD_DOMICILIO,
                                                      N_ID_EXPEDIENTE_DOCUMENTO_OUT,
                                                      PI_V_AUDUSUCREACION,
                                                      PO_N_RETORNO,
                                                      PO_N_COD_ERROR,
                                                      PO_V_MSJ_ERROR);
                            
                                I_NRO_DOC := I_NRO_DOC + 1;
                            END LOOP;
                        
                        WHEN SCOB_PK_CONSTANTES.C_COD_ENTIDAD_TASADOR THEN
                            --las direcciones de las personas tasadoras
                            I_NRO_DOC := 1;
                            WHILE (I_NRO_DOC <= TO_NUMBER(V_NRO_ITEMSTE))
                            LOOP
                            
                                SCOB_PK_UTILITARIO.SCOB_SP_S_SPLIT(V_ID_TIPO_ENTIDAD, ',', I_NRO_DOC + 1, V_ID_ENTIDAD_DOMICILIO);
                            
                                IF V_ID_ENTIDAD_DOMICILIO = '#' THEN
                                    ROLLBACK;
                                    EXIT;
                                END IF;
                            
                                --inserta el documento
                                SCOB_SP_I_DOCUMENTO(N_GENERADOR_DOCUMENTO,
                                                    TO_NUMBER(V_ID_EXPEDIENTE),
                                                    PI_V_ESTADO_EXPEDIENTE,
                                                    TO_NUMBER(V_PLANTILLA),
                                                    TO_NUMBER(V_MOTIVO_PLANTILLA),
                                                    V_COD_TIPO_PLAN,
                                                    V_COD_TIPO_DOC,
                                                    N_ID_TIPO_DOC,
                                                    I_COD_SUBTIPO_DOC,
                                                    I_NRO_REGLA,
                                                    N_ID_EXPEDIENTE_DOCUMENTO_ORI,
                                                    PI_V_ID_COSTAS,
                                                    PI_V_POR_COSTAS,
                                                    PI_V_VAL_COSTAS,
                                                    PI_V_CNT_COSTAS,
                                                    PI_V_SUB_TOTAL_COSTAS,
                                                    0,
                                                    PI_N_NRO_ITEMSC,
                                                    V_COD_AREA_USUARIO,
                                                    V_SIGLAS_AREA_USUARIO,
                                                    PI_N_ID_SERVICIO,
                                                    PI_V_ID_TIPO_SERVICIO,
                                                    PI_C_FLG_UCI,
                                                    PI_V_AUDUSUCREACION,
                                                    PI_N_ID_USUARIO_INGRESO,
                                                    PI_V_FEC_GENERACION_DOC,
                                                    PI_C_IND_GEN_REC,
                                                    N_ID_EXPEDIENTE_DOCUMENTO_OUT,
                                                    PO_N_COD_ERROR,
                                                    PO_V_MSJ_ERROR);
                            
                                IF PO_N_COD_ERROR < 0 THEN
                                    ROLLBACK;
                                    RETURN;
                                END IF;
                                N_ID_ENTIDAD_DOMICILIO := TO_NUMBER(V_ID_ENTIDAD_DOMICILIO);
                            
                                --obtener el id de la persona;
                                SELECT DISTINCT PDOM.ID_PERSONA,
                                                EXPE.COD_TIPO_ENTIDAD
                                  INTO N_ID_ENTIDAD,
                                       V_TIPO_ENTIDAD
                                  FROM T_SCOB_PERSONA_DOMICILIO PDOM
                                 INNER JOIN T_SCOB_EXPEDIENTE_PERSONA EXPE
                                    ON EXPE.ID_PERSONA = PDOM.ID_PERSONA
                                   AND EXPE.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
                                   AND EXPE.ID_EXPEDIENTE = TO_NUMBER(V_ID_EXPEDIENTE)
                                 WHERE PDOM.ID_PERSONA_DOMICILIO = N_ID_ENTIDAD_DOMICILIO;
                            
                                --insertar la direccion asociada al expediente.
                                SCOB_SP_I_EXPED_DIREC(TO_NUMBER(V_ID_EXPEDIENTE),
                                                      V_TIPO_ENTIDAD,
                                                      N_ID_ENTIDAD,
                                                      N_ID_ENTIDAD_DOMICILIO,
                                                      N_ID_EXPEDIENTE_DOCUMENTO_OUT,
                                                      PI_V_AUDUSUCREACION,
                                                      PO_N_RETORNO,
                                                      PO_N_COD_ERROR,
                                                      PO_V_MSJ_ERROR);
                            
                                I_NRO_DOC := I_NRO_DOC + 1;
                            END LOOP;
                        
                        ELSE
                            --los bancos, sat, sunat, pnp, etc, seleccionados
                        
                            N_ID_ENTIDAD_DOMICILIO := NULL; --SIN DIRECCIONES, SOLO ENTIDADES.
                            I_NRO_DOC              := 1;
                            WHILE (I_NRO_DOC <= TO_NUMBER(V_NRO_ITEMSTE))
                            LOOP
                            
                                SCOB_PK_UTILITARIO.SCOB_SP_S_SPLIT(V_ID_TIPO_ENTIDAD, ',', I_NRO_DOC + 1, V_ID_ENTIDAD);
                            
                                IF V_ID_ENTIDAD = '#' THEN
                                    EXIT;
                                END IF;
                                N_ID_ENTIDAD := TO_NUMBER(V_ID_ENTIDAD);
                                --inserta el documento
                                SCOB_SP_I_DOCUMENTO(N_GENERADOR_DOCUMENTO,
                                                    TO_NUMBER(V_ID_EXPEDIENTE),
                                                    PI_V_ESTADO_EXPEDIENTE,
                                                    TO_NUMBER(V_PLANTILLA),
                                                    TO_NUMBER(V_MOTIVO_PLANTILLA),
                                                    V_COD_TIPO_PLAN,
                                                    V_COD_TIPO_DOC,
                                                    N_ID_TIPO_DOC,
                                                    I_COD_SUBTIPO_DOC,
                                                    I_NRO_REGLA,
                                                    N_ID_EXPEDIENTE_DOCUMENTO_ORI,
                                                    PI_V_ID_COSTAS,
                                                    PI_V_POR_COSTAS,
                                                    PI_V_VAL_COSTAS,
                                                    PI_V_CNT_COSTAS,
                                                    PI_V_SUB_TOTAL_COSTAS,
                                                    0,
                                                    PI_N_NRO_ITEMSC,
                                                    V_COD_AREA_USUARIO,
                                                    V_SIGLAS_AREA_USUARIO,
                                                    PI_N_ID_SERVICIO,
                                                    PI_V_ID_TIPO_SERVICIO,
                                                    PI_C_FLG_UCI,
                                                    PI_V_AUDUSUCREACION,
                                                    PI_N_ID_USUARIO_INGRESO,
                                                    PI_V_FEC_GENERACION_DOC,
                                                    PI_C_IND_GEN_REC,
                                                    N_ID_EXPEDIENTE_DOCUMENTO_OUT,
                                                    PO_N_COD_ERROR,
                                                    PO_V_MSJ_ERROR);
                            
                                IF PO_N_COD_ERROR < 0 THEN
                                    ROLLBACK;
                                    RETURN;
                                END IF;
                            
                                --insertar la direccion asociada al expediente.
                                SCOB_SP_I_EXPED_DIREC(TO_NUMBER(V_ID_EXPEDIENTE),
                                                      V_TIPO_ENTIDAD,
                                                      N_ID_ENTIDAD,
                                                      N_ID_ENTIDAD_DOMICILIO,
                                                      N_ID_EXPEDIENTE_DOCUMENTO_OUT,
                                                      PI_V_AUDUSUCREACION,
                                                      PO_N_RETORNO,
                                                      PO_N_COD_ERROR,
                                                      PO_V_MSJ_ERROR);
                            
                                I_NRO_DOC := I_NRO_DOC + 1;
                            END LOOP;
                    END CASE;
                    N_CONTE := N_CONTE + 1; --contador de entidades a quienes va dirigido
                END LOOP;
            
                N_CONTP := N_CONTP + 1; --contador de plantillas
            END LOOP;
        
            N_CONT := N_CONT + 1; --contador de expediente
        END LOOP;
    
        PO_N_COD_ERROR := 0;
        PO_N_RETORNO   := N_GENERADOR_DOCUMENTO;
    
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

    PROCEDURE SCOB_SP_I_DOCUMENTO
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 10.05.2011
        -- Proposito    : inserta documentos segun tipo.
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_N_GENERADOR_DOC     IN T_SCOB_EXPEDIENTE_DOCUMENTO.COD_GENERADOR_DOCUMENTO%TYPE,
     PI_N_ID_EXPEDIENTE     IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
     PI_I_ESTADO_EXPEDIENTE IN T_SCOB_EXPEDIENTE_DOCUMENTO.ESTADO_EXPEDIENTE%TYPE,
     --
     PI_N_ID_PLANTILLA     IN T_SCOB_EXPEDIENTE_DOCUMENTO.ID_PLANTILLA%TYPE,
     PI_N_MOTIVO_PLANTILLA IN T_SCOB_EXPEDIENTE_DOCUMENTO.ID_MOTIVO_PLANTILLA%TYPE,
     PI_V_COD_TIPO_PLAN    IN VARCHAR2,
     PI_V_COD_TIPO_DOC     IN VARCHAR2,
     PI_N_ID_TIPO_DOC      IN T_SCOB_TIPO_DOCUMENTO.ID_TIPO_DOCUMENTO%TYPE,
     PI_I_COD_SUBTIPO_DOC  IN T_SCOB_TIPO_DOCUMENTO.COD_SUBTIPO_DOCUMENTO%TYPE,
     PI_I_NRO_REGLA        IN INTEGER,
     --
     PI_N_ID_EXP_DOC_ORIGEN IN T_SCOB_EXPEDIENTE_DOCUMENTO.ID_EXPEDIENTE_DOCUMENTO_ORIGEN%TYPE,
     --
     PI_V_ID_COSTAS        IN VARCHAR2,
     PI_V_POR_COSTAS       IN VARCHAR2,
     PI_V_VAL_COSTAS       IN VARCHAR2,
     PI_V_CNT_COSTAS       IN VARCHAR2,
     PI_V_SUB_TOTAL_COSTAS IN VARCHAR2,
     PI_N_TOTAL_COSTAS     IN T_SCOB_EXPEDIENTE_DOCUMENTO.MONTO_COSTA%TYPE,
     PI_N_NRO_ITEMSC       IN INTEGER,
     --
     PI_V_COD_AREA_USUARIO    IN VARCHAR2,
     PI_V_SIGLAS_AREA_USUARIO IN VARCHAR2,
     --
     PI_N_ID_SERVICIO      IN NUMBER,
     PI_V_ID_TIPO_SERVICIO IN VARCHAR2,
     PI_C_FLG_UCI          IN CHAR,
     --
     PI_V_AUDUSUCREACION     IN T_SCOB_EXPEDIENTE_DOCUMENTO.AUDUSUCREACION%TYPE,
     PI_N_ID_USUARIO_INGRESO IN T_SCOB_USUARIO.ID_USUARIO%TYPE,
     PI_V_FEC_GENERACION_DOC IN VARCHAR,
     PI_C_IND_GEN_REC        IN CHAR,
     PO_N_RETORNO            OUT NUMBER,
     PO_N_COD_ERROR          OUT NUMBER,
     PO_V_MSJ_ERROR          OUT VARCHAR2) IS
        N_ID_EXPEDIENTE_DOCUMENTO T_SCOB_EXPEDIENTE_DOCUMENTO.ID_EXPEDIENTE_DOCUMENTO%TYPE;
    
        N_SEC_EXPEDIENTE     NUMBER;
        V_SEC_RESOL_EXPED    VARCHAR(3);
        N_SEC_TIPO_DOC       NUMBER;
        V_SEC_TIPO_DOC       VARCHAR(6);
        N_SEC_RESOL_AEC      NUMBER;
        V_SEC_RESOLUCION_AEC VARCHAR(6);
    
        V_ANIO           CHAR(2);
        V_NRO_DOCUMENTO  T_SCOB_EXPEDIENTE_DOCUMENTO.NRO_DOCUMENTO%TYPE;
        V_NRO_RESOLUCION T_SCOB_EXPEDIENTE_DOCUMENTO.NRO_RESOLUCION%TYPE;
        V_NOMBRE         T_SCOB_EXPEDIENTE_DOCUMENTO.NOMBRE%TYPE;
        N_ID_MOTIVO      T_SCOB_EST_EXP_COB_MOTIVO.ID_MOTIVO%TYPE;
        --
    BEGIN
        PO_V_MSJ_ERROR := '';
        PO_N_RETORNO   := 0;
        PO_N_COD_ERROR := -1;
    
        --obtener ultimos digitos del a?o
        SELECT TO_CHAR(TO_DATE(SYSDATE, 'DD/MM/YYYY'), 'YY') INTO V_ANIO FROM DUAL;
    
        --
        V_SEC_RESOL_EXPED    := NULL;
        V_SEC_RESOLUCION_AEC := NULL;
        V_SEC_TIPO_DOC       := NULL;
        --obtener el secuencial del subtipo de documento
        IF PI_I_COD_SUBTIPO_DOC <> 1 THEN
            --DISTINTO A RESOLUCION
            BEGIN
                CASE TO_NUMBER(PI_I_COD_SUBTIPO_DOC)
                    WHEN 2 THEN
                        --cedula
                        SELECT SCOB_SQ_TIPO_DOC_CED.NEXTVAL INTO N_SEC_TIPO_DOC FROM DUAL;
                    WHEN 3 THEN
                        --esquela
                        SELECT SCOB_SQ_TIPO_DOC_ESQ.NEXTVAL INTO N_SEC_TIPO_DOC FROM DUAL;
                    WHEN 4 THEN
                        --oficio
                        SELECT SCOB_SQ_TIPO_DOC_OFI.NEXTVAL INTO N_SEC_TIPO_DOC FROM DUAL;
                    WHEN 5 THEN
                        --cedula-resolucion (correlativo de cedula)
                        SELECT SCOB_SQ_TIPO_DOC_CED.NEXTVAL INTO N_SEC_TIPO_DOC FROM DUAL;
                    WHEN 6 THEN
                        --resolucion gaf
                        SELECT SCOB_SQ_TIPO_DOC_RES_GAF.NEXTVAL INTO N_SEC_TIPO_DOC FROM DUAL;
                    WHEN 7 THEN
                        --oficio gaf
                        SELECT SCOB_SQ_TIPO_DOC_OFI_GAF.NEXTVAL INTO N_SEC_TIPO_DOC FROM DUAL;
                    WHEN 8 THEN
                        --memo
                        SELECT SCOB_SQ_TIPO_DOC_ESQ.NEXTVAL INTO N_SEC_TIPO_DOC FROM DUAL;
                    
                END CASE;
                V_SEC_TIPO_DOC := LPAD(TO_CHAR(N_SEC_TIPO_DOC), 6, '000000'); --DE 5 DIGITOS A 6: 05.03.2012
            END;
        END IF;
        IF PI_I_COD_SUBTIPO_DOC = 1 THEN
            --GENERAR RESOLUCIONES
            BEGIN
                --obtener el secuencial de resoluciones del expediente
                SELECT NVL(MAX(EXDO.NRO_EXPEDIENTE), 0) + 1
                  INTO N_SEC_EXPEDIENTE
                  FROM T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
                 WHERE EXDO.ID_EXPEDIENTE = TO_NUMBER(PI_N_ID_EXPEDIENTE)
                   AND EXDO.COD_SUBTIPO_DOCUMENTO = '1' --RESOLUCIONES
                   AND EXDO.ESTADO = '1';
                V_SEC_RESOL_EXPED := LPAD(TO_CHAR(N_SEC_EXPEDIENTE), 3, '000');
                --obtener el secuencial de resoluciones en el AEC
                SELECT SCOB_SQ_EXPEDIENTE_RESOLUCION.NEXTVAL INTO N_SEC_RESOL_AEC FROM DUAL;
                V_SEC_RESOLUCION_AEC := LPAD(TO_CHAR(N_SEC_RESOL_AEC), 6, '000000');
            END;
        END IF;
    
        --generar el numero y nombre del archivo del documento
        V_NRO_RESOLUCION := NULL;
        CASE PI_I_NRO_REGLA
            WHEN 1 THEN
                V_NRO_RESOLUCION := V_SEC_RESOL_EXPED || '-' || V_SEC_RESOLUCION_AEC || '-' || V_ANIO || PI_V_SIGLAS_AREA_USUARIO;
                V_NOMBRE         := V_SEC_RESOL_EXPED || V_SEC_RESOLUCION_AEC || V_ANIO || PI_V_COD_AREA_USUARIO || PI_V_COD_TIPO_DOC ||
                                    PI_V_COD_TIPO_PLAN;
                V_NRO_DOCUMENTO  := NULL;
            WHEN 2 THEN
                V_NRO_DOCUMENTO  := V_SEC_TIPO_DOC || '-' || V_ANIO;
                V_NOMBRE         := V_ANIO || V_SEC_TIPO_DOC || PI_V_COD_TIPO_DOC || PI_V_COD_TIPO_PLAN;
                V_NRO_RESOLUCION := NULL;
            WHEN 3 THEN
                V_NRO_DOCUMENTO  := V_SEC_TIPO_DOC || '-' || V_ANIO;
                V_NOMBRE         := V_ANIO || V_SEC_TIPO_DOC || PI_V_COD_TIPO_DOC || PI_V_COD_TIPO_PLAN;
                V_NRO_RESOLUCION := NULL;
                IF PI_I_COD_SUBTIPO_DOC = 6 THEN
                    V_NRO_RESOLUCION := V_NRO_DOCUMENTO;
                    V_NRO_DOCUMENTO  := NULL;
                END IF;
        END CASE;
        --OBTIENE EL NUMERO DE RESOLUCION DEL DOCUMENTO ORIGEN
        IF PI_N_ID_EXP_DOC_ORIGEN <> 0 THEN
            SELECT EXDO.NRO_RESOLUCION
              INTO V_NRO_RESOLUCION
              FROM T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
             WHERE EXDO.ID_EXPEDIENTE_DOCUMENTO = PI_N_ID_EXP_DOC_ORIGEN;
        END IF;
        --obtener el motivo del expediente
        SELECT EXPE.ID_MOTIVO INTO N_ID_MOTIVO FROM T_SCOB_EXPEDIENTE EXPE WHERE EXPE.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE;
        --insertar el documento
        DBMS_OUTPUT.PUT_LINE('**001-001');
        DBMS_OUTPUT.PUT_LINE('**PI_C_FLG_UCI: ' || PI_C_FLG_UCI);
        SELECT SCOB_SQ_EXPEDIENTE_DOCUMENTO.NEXTVAL INTO N_ID_EXPEDIENTE_DOCUMENTO FROM DUAL;
        INSERT INTO T_SCOB_EXPEDIENTE_DOCUMENTO
            (ID_EXPEDIENTE_DOCUMENTO, ID_EXPEDIENTE, ID_PLANTILLA, ID_MOTIVO_PLANTILLA, NRO_RESOLUCION, NRO_DOCUMENTO, NOMBRE, TITULO, NRO_VERSION,
             NRO_EXPEDIENTE, TIPO_DOC_ASOC, ESTADO_EXPEDIENTE, ID_MOTIVO, COD_GENERADOR_DOCUMENTO, ESTADO, AUDFECCREACION, AUDUSUCREACION, MONTO_COSTA,
             ID_TIPO_DOCUMENTO, ID_EXPEDIENTE_DOCUMENTO_ORIGEN, ID_USUARIO_INGRESO, FEC_INGRESO,
             COD_SUBTIPO_DOCUMENTO, ID_SERVICIO, COD_SERVICIO, STATUS_SERVICIO, FLG_DOCUMENTO_REC)
        VALUES
            (N_ID_EXPEDIENTE_DOCUMENTO, PI_N_ID_EXPEDIENTE, PI_N_ID_PLANTILLA, PI_N_MOTIVO_PLANTILLA, V_NRO_RESOLUCION, V_NRO_DOCUMENTO,
             V_NOMBRE || '01',
              --AGREGA LA VERSION 01 POR DEFECTO
             V_NOMBRE,
              --TITULO (SIN VERSION DEL DOCUMENTO)
             '01',
              --NRO_VERSION
             V_SEC_RESOL_EXPED,
              --NRO_EXPEDIENTE
             SCOB_PK_CONSTANTES.C_TIPO_DOC_ASOC_SISTEMA,
              --TIPO_DOC_ASOC
             PI_I_ESTADO_EXPEDIENTE, N_ID_MOTIVO, PI_N_GENERADOR_DOC, SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO, SYSDATE, PI_V_AUDUSUCREACION,
             PI_N_TOTAL_COSTAS, PI_N_ID_TIPO_DOC, PI_N_ID_EXP_DOC_ORIGEN, PI_N_ID_USUARIO_INGRESO, TO_DATE(PI_V_FEC_GENERACION_DOC, 'DD/MM/YYYY'),
             --TO_DATE(PI_V_FEC_GENERACION_DOC, 'DD/MM/YYYY'),--FEC_NOTIFICACION(TEMPORAL DEBE SER POR STD) FALTA!!!.
             PI_I_COD_SUBTIPO_DOC, PI_N_ID_SERVICIO, PI_V_ID_TIPO_SERVICIO, TRIM(PI_C_FLG_UCI), PI_C_IND_GEN_REC);
        DBMS_OUTPUT.PUT_LINE('**001-002');
        --insertar las costas
        IF PI_I_COD_SUBTIPO_DOC = 1 THEN
            BEGIN
                IF NVL(PI_N_NRO_ITEMSC, 0) <> 0 THEN
                    SCOB_PK_EXPEDIENTE.SCOB_SP_I_T_SCOB_EXPED_COSTA(PI_N_ID_EXPEDIENTE,
                                                                    N_ID_EXPEDIENTE_DOCUMENTO,
                                                                    PI_V_ID_COSTAS,
                                                                    PI_V_POR_COSTAS,
                                                                    PI_V_VAL_COSTAS,
                                                                    PI_V_CNT_COSTAS,
                                                                    PI_V_SUB_TOTAL_COSTAS,
                                                                    PI_N_TOTAL_COSTAS,
                                                                    PI_N_NRO_ITEMSC,
                                                                    PI_V_AUDUSUCREACION,
                                                                    '1',
                                                                    PO_N_COD_ERROR,
                                                                    PO_V_MSJ_ERROR);
                
                    IF PO_N_COD_ERROR < 0 THEN
                        ROLLBACK;
                        RETURN;
                    END IF;
                
                END IF;
            END;
        END IF;
        PO_N_COD_ERROR := 0;
        PO_N_RETORNO   := N_ID_EXPEDIENTE_DOCUMENTO;
    
        ----
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('ERROR 2');
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

    PROCEDURE SCOB_SP_S_EXPEDIENTE_DOCUMENTO
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 20.04.2011
        -- Proposito    : consulta los documentos generados por el sistema asociados a un expediente.
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_N_COD_GENERADOR_DOCUMENTO IN T_SCOB_EXPEDIENTE_DOCUMENTO.COD_GENERADOR_DOCUMENTO%TYPE,
     PO_CU_RETORNO                OUT CU_REC_SET) AS
        V_ID_EXPEDIENTE NUMBER;
    BEGIN
        --
        OPEN PO_CU_RETORNO FOR
        
            SELECT DISTINCT EXDO.ID_EXPEDIENTE_DOCUMENTO AS ID_DOCUMENTO,
                            EXDO.ID_EXPEDIENTE           AS ID_EXPEDIENTE,
                            EXPE.NRO_EXPEDIENTE          AS NRO_EXPEDIENTE,
                            EXPE.ANIO                    AS ANIO_EXPEDIENTE,
                            EXDO.NOMBRE                  AS NOM_ARCHIVO,
                            EXDO.NRO_RESOLUCION          AS NRO_RESOLUCION,
                            EXDO.NRO_DOCUMENTO           AS NRO_DOCUMENTO,
                            EXDO.NRO_VERSION             AS NRO_VERSION,
                            EXDO.FEC_INGRESO             AS FEC_GENERADO_POR,
                            EXDO.AUDUSUCREACION          AS USU_GENERADO_POR,
                            EXDO.MONTO_COSTA             AS MONTO_COSTA,
                            EXDO.NRO_RESOLUCION_GAF      AS NRO_RESOLUCION_GAF,
                            EXDO.FEC_RESOLUCION_GAF      AS FEC_RESOLUCION_GAF,
                            EXPE.MONTO_UIT               AS MONTO_UIT,
                            MUAN.MONTO_ANTIDUMPING       AS MONTO_ANTIDUMPING, --CASO ANTIDUMPING
                            MUAN.MONTO_INTERES           AS MONTO_DA_INTERES, ----CASO ANTIDUMPING
                            MUAN.MONTO_INTERES_MORATORIO AS MONTO_DA_INTERES_MORATORIO, --CASO ANTIDUMPING
                            MULT.FLG_MULTA_RESOLUTIVO    AS FLG_MULTA_RESOLUTIVO, --'0'=ANTIDUMPING
                            EXDO.COD_SUBTIPO_DOCUMENTO   AS COD_SUBTIPO_DOCUMENTO
              FROM T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
             INNER JOIN T_SCOB_EXPEDIENTE EXPE
                ON EXPE.ID_EXPEDIENTE = EXDO.ID_EXPEDIENTE
             INNER JOIN T_SCOB_EXPEDIENTE_MULTA EXMU
                ON EXMU.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
             INNER JOIN T_SCOB_MULTA MULT
                ON MULT.ID_MULTA = EXMU.ID_MULTA
              LEFT JOIN T_SCOB_MULTA_ANTIDUMPING MUAN
                ON MUAN.ID_MULTA = MULT.ID_MULTA
            
             WHERE EXDO.COD_GENERADOR_DOCUMENTO = PI_N_COD_GENERADOR_DOCUMENTO
             ORDER BY EXDO.ID_EXPEDIENTE_DOCUMENTO;
        --
        SELECT EXDO.ID_EXPEDIENTE
          INTO V_ID_EXPEDIENTE
          FROM T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
         WHERE EXDO.COD_GENERADOR_DOCUMENTO = PI_N_COD_GENERADOR_DOCUMENTO
           AND ROWNUM = 1;
        --
    END;
    --
    PROCEDURE SCOB_SP_S_EXP_DOC
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 20.04.2011
        -- Proposito    : consulta los documentos generados por el sistema asociados a un expediente.
        -----------------------------------------------------------
        */
    (PI_N_ID_EXPEDIENTE IN VARCHAR2,
     PO_CU_RETORNO      OUT CU_REC_SET) AS
    BEGIN
        --
        OPEN PO_CU_RETORNO FOR
            SELECT DISTINCT EXDO.ID_EXPEDIENTE_DOCUMENTO AS ID_DOCUMENTO,
                            EXDO.ID_EXPEDIENTE           AS ID_EXPEDIENTE,
                            EXPE.NRO_EXPEDIENTE          AS NRO_EXPEDIENTE,
                            EXPE.ANIO                    AS ANIO_EXPEDIENTE,
                            EXDO.NOMBRE                  AS NOM_ARCHIVO,
                            EXDO.NRO_RESOLUCION          AS NRO_RESOLUCION,
                            EXDO.NRO_DOCUMENTO           AS NRO_DOCUMENTO,
                            EXDO.NRO_VERSION             AS NRO_VERSION,
                            EXDO.FEC_INGRESO             AS FEC_GENERADO_POR,
                            EXDO.AUDUSUCREACION          AS USU_GENERADO_POR,
                            EXDO.MONTO_COSTA             AS MONTO_COSTA,
                            EXDO.NRO_RESOLUCION_GAF      AS NRO_RESOLUCION_GAF,
                            EXDO.FEC_RESOLUCION_GAF      AS FEC_RESOLUCION_GAF,
                            EXPE.MONTO_UIT               AS MONTO_UIT,
                            MUAN.MONTO_ANTIDUMPING       AS MONTO_ANTIDUMPING, --CASO ANTIDUMPING
                            MUAN.MONTO_INTERES           AS MONTO_DA_INTERES, ----CASO ANTIDUMPING
                            MUAN.MONTO_INTERES_MORATORIO AS MONTO_DA_INTERES_MORATORIO, --CASO ANTIDUMPING
                            MULT.FLG_MULTA_RESOLUTIVO    AS FLG_MULTA_RESOLUTIVO, --'0'=ANTIDUMPING
                            EXDO.COD_SUBTIPO_DOCUMENTO   AS COD_SUBTIPO_DOCUMENTO
              FROM T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
             INNER JOIN T_SCOB_EXPEDIENTE EXPE
                ON EXPE.ID_EXPEDIENTE = EXDO.ID_EXPEDIENTE
             INNER JOIN T_SCOB_EXPEDIENTE_MULTA EXMU
                ON EXMU.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
             INNER JOIN T_SCOB_MULTA MULT
                ON MULT.ID_MULTA = EXMU.ID_MULTA
              LEFT JOIN T_SCOB_MULTA_ANTIDUMPING MUAN
                ON MUAN.ID_MULTA = MULT.ID_MULTA
             WHERE EXDO.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
               AND EXDO.ESTADO = 1
             ORDER BY EXDO.ID_EXPEDIENTE_DOCUMENTO DESC;
        --
    END;
    --
    PROCEDURE SCOB_SP_D_EXPEDIENTE_DOCUMENTO
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 25.04.2011
        -- Proposito    : actualiza al estado eliminado los documentos seleccionados
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
         WHERE INSTR(PI_V_ID_EXPEDIENTE_DOCUMENTO, '|' || TO_CHAR(ID_EXPEDIENTE_DOCUMENTO) || '|') > 0;
    
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

    PROCEDURE SCOB_SP_S_DOCS_POR_SUBTIPO
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 13.05.2011
        -- Proposito    : consulta documentos por subtipo de documento
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_N_ID_EXPEDIENTE         IN T_SCOB_EXPEDIENTE_DOCUMENTO.ID_EXPEDIENTE%TYPE,
     PI_I_COD_SUBTIPO_DOCUMENTO IN T_SCOB_TIPO_DOCUMENTO.COD_SUBTIPO_DOCUMENTO%TYPE,
     PO_CU_RETORNO              OUT CU_REC_SET) AS
    BEGIN
        OPEN PO_CU_RETORNO FOR
        
            SELECT EXDO.ID_EXPEDIENTE_DOCUMENTO,
                   EXDO.NRO_RESOLUCION
              FROM T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
             INNER JOIN T_SCOB_TIPO_DOCUMENTO TIDO
                ON TIDO.ID_TIPO_DOCUMENTO = EXDO.ID_TIPO_DOCUMENTO
             WHERE EXDO.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
               AND EXDO.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
               AND TIDO.COD_SUBTIPO_DOCUMENTO = PI_I_COD_SUBTIPO_DOCUMENTO
               AND EXDO.TIPO_DOC_ASOC IN (SCOB_PK_CONSTANTES.C_TIPO_DOC_ASOC_SISTEMA, SCOB_PK_CONSTANTES.C_TIPO_DOC_ASOC_SISTEMA_ACT);
    
    END;

    PROCEDURE SCOB_SP_I_EXPED_DIREC
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 13.05.2011
        -- Proposito    : inserta las direcciones asociadas a los documentos generados
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_N_ID_EXPEDIENTE           IN T_SCOB_EXPED_DOCUMENTO_DIREC.ID_EXPEDIENTE_DOCUMENTO%TYPE,
     PI_I_COD_TIPO_ENTIDAD        IN T_SCOB_EXPED_DOCUMENTO_DIREC.COD_TIPO_ENTIDAD%TYPE,
     PI_N_ID_ENTIDAD              IN T_SCOB_EXPED_DOCUMENTO_DIREC.ID_ENTIDAD%TYPE,
     PI_N_ID_DOMICILIO            IN T_SCOB_EXPED_DOCUMENTO_DIREC.ID_DOMICILIO%TYPE,
     PI_N_ID_EXPEDIENTE_DOCUMENTO IN T_SCOB_EXPED_DOCUMENTO_DIREC.ID_EXPEDIENTE_DOCUMENTO%TYPE,
     PI_V_AUDUSUCREACION          IN T_SCOB_EXPED_DOCUMENTO_DIREC.AUDUSUCREACION%TYPE,
     PO_N_RETORNO                 OUT NUMBER,
     PO_N_COD_ERROR               OUT NUMBER,
     PO_V_MSJ_ERROR               OUT VARCHAR2) IS
    BEGIN
        PO_V_MSJ_ERROR := '';
        PO_N_RETORNO   := 0;
        PO_N_COD_ERROR := -1;
    
        INSERT INTO T_SCOB_EXPED_DOCUMENTO_DIREC
            (ID_EXPEDIENTE_DIRECCION, ID_EXPEDIENTE, COD_TIPO_ENTIDAD, ID_ENTIDAD, ID_DOMICILIO, ID_EXPEDIENTE_DOCUMENTO, ESTADO, AUDFECCREACION,
             AUDUSUCREACION)
        VALUES
            (SCOB_SQ_EXPEDIENTE_DIRECCION.NEXTVAL, PI_N_ID_EXPEDIENTE, PI_I_COD_TIPO_ENTIDAD, PI_N_ID_ENTIDAD, PI_N_ID_DOMICILIO,
             PI_N_ID_EXPEDIENTE_DOCUMENTO, '1', SYSDATE, PI_V_AUDUSUCREACION);
    
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
    --
    PROCEDURE SCOB_SP_U_GEN_DOC_ETIQ_DESACUM
    /*
        -----------------------------------------------------------
        -- Autor        : @dcelis
        -- Creado       : 08.05.2017
        -- Proposito    : Procedimiento envoltorio para modificación de etiquetas,
        exclusivamente para el caso de acumulación/desacumulación
        -----------------------------------------------------------
        */
    (PI_V_NU_ID_EXP_SOLIC         IN VARCHAR2,
     PI_N_ID_EXPEDIENTE           IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
     PI_N_COD_GENERADOR_DOCUMENTO IN T_SCOB_EXPEDIENTE_DOCUMENTO.COD_GENERADOR_DOCUMENTO%TYPE,
     PI_I_TIPO_EVENTO             IN INTEGER, --1=SUSP.2=FRAC.3=EMB RETENCION; 4=EMB.REQUERIR 5=EMB.OTROS; 0=OTROS
     PI_N_ID_TIPO_EVENTO          IN NUMBER, --ID DE LA SOLICITUD SEGUN TIPO EVENTO
     OUT_REGISTRO                 OUT CU_REC_SET,
     PO_CU_RET_SANCIONADO         OUT CU_REC_SET,
     PO_N_COD_ERROR               OUT NUMBER,
     PO_V_MSJ_ERROR               OUT VARCHAR2) AS
        -- VARIABLES
        A1     CU_REC_SET;
        V_REC  REC_ETIQ_DOC;
        L_TBL  T_OBJ_ETIQ_DOC := T_OBJ_ETIQ_DOC();
        V_CONT NUMBER := 1;
        --
        --type_info varchar2(400);
        V_S_VALOR_UIT   NUMBER;
        V_IMPORTE_UIT   NUMBER;
        V_SALDO_CAPITAL NUMBER;
        V_SALDO_COSTAS  NUMBER;
        V_SALDO_TOTAL   NUMBER;
        V_NU_TIPO_SOLIC NUMBER;
        --
    BEGIN
        --
        PO_V_MSJ_ERROR := '';
        PO_N_COD_ERROR := -1;
    
        L_TBL.DELETE;
        -- VALORES ENVIADOS POR EL SICOB
        --INSERT INTO T_TEST(OTHER) VALUES('PI_V_NU_ID_EXP_SOLIC: '||PI_V_NU_ID_EXP_SOLIC);
        --INSERT INTO T_TEST(OTHER) VALUES('PI_N_ID_EXPEDIENTE: '||PI_N_ID_EXPEDIENTE);
        --INSERT INTO T_TEST(OTHER) VALUES('PI_N_COD_GENERADOR_DOCUMENTO: '||PI_N_COD_GENERADOR_DOCUMENTO);
        --INSERT INTO T_TEST(OTHER) VALUES('PI_I_TIPO_EVENTO: '||PI_I_TIPO_EVENTO);
        --INSERT INTO T_TEST(OTHER) VALUES('PI_N_ID_TIPO_EVENTO: '||PI_N_ID_TIPO_EVENTO);
        -- SUMAMOS LAS CANTIDADES DE LAS MULTAS QUE SERAN AFECTADAS
    
        -- ini: jcarrion@20180818
        BEGIN
            SELECT SUM(DECODE(DESACUM.NU_TIPO_SOLIC, 1, MDET.VALOR_UIT * -1, MDET.VALOR_UIT)) AS VALOR_UIT,
                   SUM(DECODE(DESACUM.NU_TIPO_SOLIC, 1, MULT.MONTO_UIT * -1, MULT.MONTO_UIT)) AS IMPORTE_UIT,
                   SUM(DECODE(DESACUM.NU_TIPO_SOLIC, 1, MULT.SALDO * -1, MULT.SALDO)) AS SALDO_CAPITAL,
                   SUM(DECODE(DESACUM.NU_TIPO_SOLIC, 1, MULT.SALDO_COSTAS * -1, MULT.SALDO_COSTAS)) AS SALDO_COSTAS,
                   SUM(DECODE(DESACUM.NU_TIPO_SOLIC, 1, MULT.SALDO_TOTAL_DEUDA * -1, MULT.SALDO_TOTAL_DEUDA)) AS V_SALDO_TOTAL_DEUDA
              INTO V_S_VALOR_UIT,
                   V_IMPORTE_UIT,
                   V_SALDO_CAPITAL,
                   V_SALDO_COSTAS,
                   V_SALDO_TOTAL
              FROM T_SCOB_MULTA MULT
             INNER JOIN T_SCOB_MULTA_DETAL MDET
                ON (MDET.ID_MULTA = MULT.ID_MULTA AND MDET.FLG_ACTUAL = '1' AND MDET.ESTADO = '1')
             INNER JOIN T_SCOB_SOLIC_DESACUM DESACUM
                ON (DESACUM.ID_MULTA = MULT.ID_MULTA)
             WHERE DESACUM.NU_ID_EXP_SOLIC = PI_V_NU_ID_EXP_SOLIC
               AND DESACUM.NU_ESTADO = 1
               AND DESACUM.NU_ESTADO_SOLIC = 3
               AND DESACUM.NU_IMPRESO = 0;
        EXCEPTION
            WHEN OTHERS THEN
                V_S_VALOR_UIT   := 0;
                V_IMPORTE_UIT   := 0;
                V_SALDO_CAPITAL := 0;
                V_SALDO_COSTAS  := 0;
                V_SALDO_TOTAL   := 0;
        END;
    
        /*
        
        
        SELECT SUM(MDET.VALOR_UIT) AS VALOR_UIT,
               SUM(MULT.MONTO_UIT) AS IMPORTE_UIT,
               SUM(MULT.SALDO) AS SALDO_CAPITAL,
               SUM(MULT.SALDO_COSTAS) AS SALDO_COSTAS,
               SUM(MULT.SALDO_TOTAL_DEUDA) AS V_SALDO_TOTAL_DEUDA
          INTO V_S_VALOR_UIT,
               V_IMPORTE_UIT,
               V_SALDO_CAPITAL,
               V_SALDO_COSTAS,
               V_SALDO_TOTAL
          FROM T_SCOB_MULTA MULT
         INNER JOIN T_SCOB_MULTA_DETAL MDET
            ON MDET.ID_MULTA = MULT.ID_MULTA
           AND MDET.FLG_ACTUAL = '1'
           AND MDET.ESTADO = '1'
         WHERE MULT.ID_MULTA IN (SELECT ID_MULTA
                                   FROM T_SCOB_SOLIC_DESACUM
                                  WHERE NU_ID_EXP_SOLIC = PI_V_NU_ID_EXP_SOLIC
                                    AND NU_ESTADO = 1
                                    AND NU_ESTADO_SOLIC = 3
                                    AND NU_IMPRESO = 0);
                                    
         */
        -- fin: jcarrion@20180818
        -- OBTENEMOS EL TIPO DE SOLICITUD: 1: CASO1 - DESACUMULACION; 2: CASO2 - ACUMULACION
        /*
        SELECT NU_TIPO_SOLIC
          INTO V_NU_TIPO_SOLIC
          FROM T_SCOB_SOLIC_DESACUM
         WHERE NU_ID_EXP_SOLIC = PI_V_NU_ID_EXP_SOLIC
           AND NU_ESTADO = 1
           AND NU_ESTADO_SOLIC = 3
           AND NU_IMPRESO = 0
         GROUP BY NU_TIPO_SOLIC;
         
         */
        --
        /*DBMS_OUTPUT.PUT_LINE('***SUMAS');
        DBMS_OUTPUT.PUT_LINE('V_S_VALOR_UIT: ' || V_S_VALOR_UIT);
        DBMS_OUTPUT.PUT_LINE('V_IMPORTE_UIT: ' || V_IMPORTE_UIT);
        DBMS_OUTPUT.PUT_LINE('V_SALDO_CAPITAL: ' || V_SALDO_CAPITAL);
        DBMS_OUTPUT.PUT_LINE('V_SALDO_COSTAS: ' || V_SALDO_COSTAS);
        DBMS_OUTPUT.PUT_LINE('V_SALDO_TOTAL: ' || V_SALDO_TOTAL);*/
        -- RECUPERAMOS LA DATA DE PROC. DE GENERACION DE DOCUMENTOS DEL SICOB 
        SCOB_PK_GENERAR_DOCUMENTO.SCOB_SP_S_GEN_DOCUMENTO_ETIQ(PI_N_ID_EXPEDIENTE,
                                                               PI_N_COD_GENERADOR_DOCUMENTO,
                                                               PI_I_TIPO_EVENTO,
                                                               PI_N_ID_TIPO_EVENTO,
                                                               A1,
                                                               PO_CU_RET_SANCIONADO,
                                                               PO_N_COD_ERROR,
                                                               PO_V_MSJ_ERROR);
        LOOP
            FETCH A1
                INTO V_REC;
            EXIT WHEN A1%NOTFOUND;
            L_TBL.EXTEND();
            -- MODIFICAMOS LA DATA CON LOS CUM'S NUEVOS
            /*DBMS_OUTPUT.PUT_LINE('***ANTES');
            DBMS_OUTPUT.PUT_LINE('IMPORTE_UIT: ' || V_REC.IMPORTE_UIT);
            DBMS_OUTPUT.PUT_LINE('VALOR_UIT: ' || V_REC.VALOR_UIT);
            DBMS_OUTPUT.PUT_LINE('VALOR_UIT2: ' || (TO_NUMBER(V_REC.VALOR_UIT)));
            DBMS_OUTPUT.PUT_LINE('SALDO_CAPITAL: ' || V_REC.SALDO_CAPITAL);
            DBMS_OUTPUT.PUT_LINE('SALDO_COSTAS: ' || V_REC.SALDO_COSTAS);
            DBMS_OUTPUT.PUT_LINE('SALDO_TOTAL: ' || V_REC.SALDO_TOTAL);*/
            -- BEGIN
            /*
            SELECT DISTINCT NU_TIPO_SOLIC
              INTO V_NU_TIPO_SOLIC
              FROM T_SCOB_SOLIC_DESACUM T
             WHERE T.NU_ID_EXP_SOLIC = PI_V_NU_ID_EXP_SOLIC
               AND T.ID_MULTA = V_REC.ID_MULTA
               AND T.NU_ESTADO = 1
               AND T.NU_ESTADO_SOLIC = 3
               AND T.NU_IMPRESO = 0;
               
               IF V_NU_TIPO_SOLIC = 1 THEN
                   -- CASO 1: ACUMULACION
                   DBMS_OUTPUT.PUT_LINE('***CASO1***');
                   V_REC.IMPORTE_UIT   := TO_NUMBER(V_REC.IMPORTE_UIT, '99999999.99') - V_IMPORTE_UIT;
                   V_REC.VALOR_UIT     := TO_NUMBER(V_REC.VALOR_UIT) - V_S_VALOR_UIT;
                   V_REC.SALDO_CAPITAL := (TO_NUMBER(V_REC.SALDO_CAPITAL, '99999999.99')) - V_SALDO_CAPITAL;
                   V_REC.SALDO_COSTAS  := (TO_NUMBER(V_REC.SALDO_COSTAS, '99999999.99')) - V_SALDO_COSTAS;
                   V_REC.SALDO_TOTAL   := (TO_NUMBER(V_REC.SALDO_TOTAL, '99999999.99')) - V_SALDO_TOTAL;
               ELSIF V_NU_TIPO_SOLIC = 2 THEN
                   -- CASO 2: DESACUMULACION
                   DBMS_OUTPUT.PUT_LINE('***CASO2***');
                   V_REC.IMPORTE_UIT   := TO_NUMBER(V_REC.IMPORTE_UIT, '99999999.99') + V_IMPORTE_UIT;
                   V_REC.VALOR_UIT     := TO_NUMBER(V_REC.VALOR_UIT) + V_S_VALOR_UIT;
                   V_REC.SALDO_CAPITAL := (TO_NUMBER(V_REC.SALDO_CAPITAL, '99999999.99')) + V_SALDO_CAPITAL;
                   V_REC.SALDO_COSTAS  := (TO_NUMBER(V_REC.SALDO_COSTAS, '99999999.99')) + V_SALDO_COSTAS;
                   V_REC.SALDO_TOTAL   := (TO_NUMBER(V_REC.SALDO_TOTAL, '99999999.99')) + V_SALDO_TOTAL;
               END IF;
               */
            /*ini: jcarrion@20170818*/
            V_REC.IMPORTE_UIT   := TO_NUMBER(V_REC.IMPORTE_UIT, '99999999.99') + V_IMPORTE_UIT;
            V_REC.VALOR_UIT     := TO_NUMBER(V_REC.VALOR_UIT) + V_S_VALOR_UIT;
            V_REC.SALDO_CAPITAL := (TO_NUMBER(V_REC.SALDO_CAPITAL, '99999999.99')) + V_SALDO_CAPITAL;
            V_REC.SALDO_COSTAS  := (TO_NUMBER(V_REC.SALDO_COSTAS, '99999999.99')) + V_SALDO_COSTAS;
            V_REC.SALDO_TOTAL   := (TO_NUMBER(V_REC.SALDO_TOTAL, '99999999.99')) + V_SALDO_TOTAL;
            /*fin: jcarrion@20170818*/
        
            /*
                DBMS_OUTPUT.PUT_LINE('***DESPUES');
                DBMS_OUTPUT.PUT_LINE('IMPORTE_UIT: ' || V_REC.IMPORTE_UIT);
                DBMS_OUTPUT.PUT_LINE('VALOR_UIT: ' || V_REC.VALOR_UIT);
                DBMS_OUTPUT.PUT_LINE('SALDO_CAPITAL: ' || V_REC.SALDO_CAPITAL);
                DBMS_OUTPUT.PUT_LINE('SALDO_COSTAS: ' || V_REC.SALDO_COSTAS);
                DBMS_OUTPUT.PUT_LINE('SALDO_TOTAL: ' || V_REC.SALDO_TOTAL);
            */
            DBMS_OUTPUT.PUT_LINE('***FIN');
            -- AGREGAMOS LOS NUEVOS DATOS A LA TABLA DE OBJETOS
            L_TBL(V_CONT) := OBJ_ETIQ_DOC(V_REC.ID_EXPEDIENTE_DOCUMENTO,
                                          V_REC.ID_MULTA,
                                          V_REC.NOM_ARCH_PLANTILLA,
                                          V_REC.NOM_ARCH_A_GENERAR,
                                          V_REC.COD_SUBTIPO_DOCUMENTO,
                                          V_REC.FEC_GENERACION_DOC,
                                          V_REC.FEC_GENERACION_DOC_COMPLETO,
                                          V_REC.NRO_DOCUMENTO,
                                          V_REC.NRO_RESOLUCION_DOC,
                                          V_REC.SIGLA_AEC,
                                          V_REC.IMPORTE_UIT, --**
                                          --- 1
                                          V_REC.NOM_SANCIONADO_TODOS,
                                          V_REC.DES_TIPO_DOC_SANC_TODOS,
                                          V_REC.NRO_DOC_SANC_TODOS,
                                          V_REC.NOM_SANCIONADO,
                                          V_REC.TIPO_DOC_SANC_PRINCIPAL,
                                          V_REC.NRO_DOC_SANC_PRINCIPAL,
                                          V_REC.NOM_CARGO_JEFE_AEC,
                                          V_REC.NOM_SECRETARIO_TEC,
                                          V_REC.NOM_CARGO_SECRETARIO_TEC,
                                          V_REC.NOM_OR_MULTA,
                                          -- 2
                                          V_REC.NOM_JEFE_AEC,
                                          V_REC.NRO_FILE,
                                          V_REC.SIGLA_NOM_JEFE_AEC,
                                          V_REC.NRO_CUM,
                                          V_REC.NRO_SEC,
                                          V_REC.NRO_RESOLUCION_OR,
                                          V_REC.NRO_EXPED_ADMIN_MULTA,
                                          V_REC.SIGLA_NOM_USUARIO_GEN_DOC,
                                          V_REC.AEC_ANEXO_TELEFONO,
                                          V_REC.AEC_NOMBRE,
                                          -- 3
                                          V_REC.AEC_TELEFONO,
                                          V_REC.NRO_EXPED_ANTIGUO_MULTA,
                                          V_REC.VALOR_UIT, --**
                                          V_REC.NRO_EXPEDIENTE,
                                          V_REC.NOM_SANCIONADO_DOC,
                                          V_REC.NRO_DOC_IDENTIDAD,
                                          V_REC.TIPO_DOC_IDENTIDAD,
                                          V_REC.DOMICILIO_SANCIONADO,
                                          V_REC.DOMICILIO_FISCAL,
                                          V_REC.DOMICILIO_PROCESAL,
                                          -- 4
                                          V_REC.MONTO_CAPITAL,
                                          V_REC.MONTO_IC,
                                          V_REC.MONTO_IM,
                                          V_REC.MONTO_COSTAS,
                                          V_REC.MONTO_TOTAL,
                                          V_REC.MONTO_AMORT_CAPITAL,
                                          V_REC.SALDO_CAPITAL, --**
                                          V_REC.SALDO_IC,
                                          V_REC.SALDO_IM,
                                          V_REC.SALDO_COSTAS, --**
                                          -- 5
                                          V_REC.SALDO_TOTAL, --**
                                          V_REC.COSTAS_PROYECTADAS,
                                          V_REC.NRO_CARTA_FIANZA,
                                          V_REC.NOM_BANCO,
                                          V_REC.DIRECCION_BANCO,
                                          V_REC.MONTO_SOLES_RETENCION,
                                          V_REC.MONTO_USD_RETENCION,
                                          V_REC.NOM_BANCO_RETENEDOR,
                                          V_REC.FEC_RECEPCION_SOLICITUD,
                                          V_REC.TOTAL_REQUERIDO,
                                          -- 6
                                          V_REC.NRO_CUOTAS_FRACCIONAR,
                                          V_REC.MONTO_FRACCIONAR,
                                          V_REC.TOTAL_EMBARGO,
                                          V_REC.DIRECCION_BANCO_RETENEDOR,
                                          V_REC.TOTAL_REDUCIR,
                                          V_REC.NRO_DOC_REC,
                                          V_REC.FEC_RETENCION_INDECOPI,
                                          V_REC.MONTO_INFORMADO_SOLES,
                                          V_REC.MONTO_INFORMADO_DOLARES,
                                          V_REC.ID_EXPEDIENTE,
                                          -- 7
                                          V_REC.NU_NRO_NOTIFICACION,
                                          V_REC.NRO_OFICIO_SUNAT_CODIGO,
                                          V_REC.NRO_OFICIO_SUNAT_ANIO,
                                          V_REC.NRO_OFICIO_SUNAT_PREFIJO,
                                          V_REC.NRO_OFICIO_SUNAT_CORRELATIVO,
                                          V_REC.NRO_LIQUIDACION_CODIGO,
                                          V_REC.NRO_LIQUIDACION_ANIO,
                                          V_REC.NRO_LIQUIDACION_CORRELATIVO,
                                          V_REC.NRO_DUA_CODIGO,
                                          V_REC.NRO_DUA_ANIO,
                                          -- 8
                                          V_REC.NRO_DUA_CORRELATIVO,
                                          V_REC.TIPO_CAMBIO,
                                          V_REC.MONTO_ANTIDUMPING,
                                          V_REC.DESC_PARTIDA,
                                          V_REC.DESC_INTENDENCIA,
                                          V_REC.DESC_SUBMATERIA,
                                          V_REC.FEC_RESOLUCION,
                                          V_REC.FEC_NOTIFICACION,
                                          V_REC.NOM_SEDE,
                                          V_REC.CUM_DESACUM,
                                          -- 9
                                          V_REC.EXP_DESACUM);
            V_CONT := V_CONT + 1;
            /* EXCEPTION 
              WHEN OTHERS THEN
                DBMS_OUTPUT.put_line('AQUI MUERE!!!!!');
            END;*/
        END LOOP;
    
        -- DEVOLVEMOS EL CURSOR CON LA DATA MODIFICADA
        OPEN OUT_REGISTRO FOR
            SELECT * FROM TABLE(L_TBL);
        --
        PO_N_COD_ERROR := 0;
        COMMIT;
        --
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
            --
    END SCOB_SP_U_GEN_DOC_ETIQ_DESACUM;
    --
    PROCEDURE SCOB_SP_S_GEN_DOCUMENTO_ETIQ
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 27.05.2011
        -- Proposito    : reemplazar las etiquetas a reemplazar
                          de los documentos generados
                          por expedientes.
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_N_ID_EXPEDIENTE           IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
     PI_N_COD_GENERADOR_DOCUMENTO IN T_SCOB_EXPEDIENTE_DOCUMENTO.COD_GENERADOR_DOCUMENTO%TYPE,
     PI_I_TIPO_EVENTO             IN INTEGER, --1=SUSP.2=FRAC.3=EMB RETENCION; 4=EMB.REQUERIR 5=EMB.OTROS; 0=OTROS
     PI_N_ID_TIPO_EVENTO          IN NUMBER, --ID DE LA SOLICITUD SEGUN TIPO EVENTO
     PO_CU_RETORNO                OUT CU_REC_SET,
     PO_CU_RET_SANCIONADO         OUT CU_REC_SET,
     PO_N_COD_ERROR               OUT NUMBER,
     PO_V_MSJ_ERROR               OUT VARCHAR2) AS
        PI_N_ERROR            NUMBER;
        PI_V_ERROR            VARCHAR2(150);
        N_ID_AREA_COBRANZA    T_SCOB_EXPEDIENTE.ID_AREA_COBRANZA%TYPE;
        N_ID_MULTA            NUMBER;
        N_ID_EXPEDIENTE       NUMBER;
        N_MONTO_TOTAL_EMBARGO T_SCOB_EXPED_EMBARGO.MONTO_EMBARGO%TYPE;
    
        V_NOMBRES_SANCIONADO  VARCHAR2(4000);
        V_TIPO_DOC_SANCIONADO VARCHAR2(4000);
        V_NRO_DOC_SANCIONADO  VARCHAR2(4000);
    
        V_NOM_SANCIONADO          VARCHAR2(400);
        V_TIPO_DOC_IDENTIDAD      VARCHAR2(50);
        V_NRO_DOC_IDENTIDAD       VARCHAR2(50);
        C_FLG_SANC_PRINCIPAL      CHAR(1);
        V_NOM_SANC_PRINCIPAL      VARCHAR2(400);
        V_TIPO_DOC_SANC_PRINCIPAL VARCHAR2(400);
        V_NRO_DOC_SANC_PRINCIPAL  VARCHAR2(400);
        I_NRO_REG                 INTEGER;
        I_TOTAL_REG               INTEGER;
        I_EXISTE                  INTEGER;
        I_FLG_TRAMITE             INTEGER;
    
        A1 CU_REC_SET;
        
        V_VC_IMPORTE_UIT VARCHAR2(3000);
        V_VC_VALOR_UIT VARCHAR2(3000);
        V_VC_SALDO_CAPITAL VARCHAR2(3000);
        V_VC_SALDO_COSTAS  VARCHAR2(3000);
        V_VC_SALDO_TOTAL   VARCHAR2(3000);
    BEGIN
        --
        I_FLG_TRAMITE := 0;
    
        IF PI_N_ID_EXPEDIENTE <> 0 THEN
            --obtener id_multa e id_expediente del documento generado
            N_ID_EXPEDIENTE := PI_N_ID_EXPEDIENTE;
        
            -- @dcelis Req.44 (No se usa)
            /*SELECT EXMU.ID_MULTA, EXPE.ID_AREA_COBRANZA
            INTO N_ID_MULTA, N_ID_AREA_COBRANZA
            FROM T_SCOB_EXPEDIENTE_MULTA EXMU
            INNER JOIN T_SCOB_EXPEDIENTE EXPE
                  ON EXPE.ID_EXPEDIENTE = EXMU.ID_EXPEDIENTE
            WHERE EXMU.ID_EXPEDIENTE = N_ID_EXPEDIENTE
            AND EXMU.ESTADO = '1';*/
        END IF;
    
        --obtener los sancionados y tipos de documento
        EXECUTE IMMEDIATE 'TRUNCATE TABLE T_SCOB_TMP_MULTA_SANC';
        INSERT INTO T_SCOB_TMP_MULTA_SANC
            (ID_MULTA, CUM, NOM_SANCIONADO, TIPO_DOC_IDENTIDAD, NRO_DOC_IDENTIDAD, FLG_SANC_PRINCIPAL, ID_SECUENCIA)
            SELECT MULT.ID_MULTA,
                   MULT.ANIO || MULT.CUM,
                   DECODE(PERS.TIPO_PERSONA,
                          SCOB_PK_CONSTANTES.C_TIPO_PERS_NATURAL,
                          PERS.APE_PATERNO || ' ' || PERS.APE_MATERNO || ' ' || PERS.PRI_NOMBRE || ' ' || PERS.SEG_NOMBRE,
                          PERS.RAZON_SOCIAL) AS NOM_SANCIONADO,
                   TDID.TXT_DESCRIPCION AS TIPO_DOC_IDENTIDAD,
                   PERS.NRO_DOC AS NRO_DOC_IDENTIDAD,
                   MSAN.FLG_PRINCIPAL AS FLG_SANC_PRINCIPAL,
                   ROWNUM
              FROM T_SCOB_MULTA MULT
             INNER JOIN T_SCOB_MULTA_DETAL MDET
                ON MDET.ID_MULTA = MULT.ID_MULTA
               AND MDET.FLG_ACTUAL = '1'
               AND MDET.ESTADO = '1'
             INNER JOIN T_SCOB_MULTA_SANCIONADO MSAN
                ON MSAN.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL
               AND MSAN.COD_TIPO_PERSONA = SCOB_PK_CONSTANTES.C_COD_TIPO_PERSONA_SANCIONADO
               AND MSAN.ESTADO = '1'
             INNER JOIN T_SCOB_PERSONA PERS
                ON PERS.ID_PERSONA = MSAN.ID_PERSONA
             INNER JOIN T_SCOB_TABLA_DET TDID
                ON TDID.ID_TABLA = SCOB_PK_CONSTANTES.C_TBL_TIPO_DOC_IDENT
               AND TDID.COD_INTERNO = PERS.TIPO_DOC
             WHERE MULT.ID_MULTA IN
                   (SELECT DISTINCT EXMU.ID_MULTA
                      FROM T_SCOB_EXPEDIENTE_MULTA EXMU
                     WHERE EXMU.ID_EXPEDIENTE IN (SELECT DISTINCT EXDO.ID_EXPEDIENTE
                                                    FROM T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
                                                   WHERE EXDO.COD_GENERADOR_DOCUMENTO = PI_N_COD_GENERADOR_DOCUMENTO)
                       AND EXMU.ESTADO = '1'
                    
                    );
        SELECT COUNT(MSAN.ID_SECUENCIA) INTO I_TOTAL_REG FROM T_SCOB_TMP_MULTA_SANC MSAN;
    
        IF PI_I_TIPO_EVENTO = 5 THEN
            --EMBARGO OTROS
            SELECT DISTINCT EXEM.MONTO_EMBARGO
              INTO N_MONTO_TOTAL_EMBARGO
              FROM T_SCOB_EXPED_EMBARGO EXEM
             INNER JOIN T_SCOB_EXPED_EMBARGO_DOC EEDO
                ON EEDO.COD_GENERADOR_DOCUMENTO = PI_N_COD_GENERADOR_DOCUMENTO
             WHERE EEDO.ID_EXPEDIENTE_EMBARGO = EXEM.ID_EXPEDIENTE_EMBARGO;
        END IF;
    
        ---evaluacion de los eventos
        EXECUTE IMMEDIATE 'TRUNCATE TABLE T_SCOB_TMP_ETIQUETA_EXPED';
        CASE
            WHEN PI_I_TIPO_EVENTO = 1 THEN
                --SUSPENSION
                INSERT INTO T_SCOB_TMP_ETIQUETA_EXPED
                    (TIPO_EVENTO, ID_DOCUMENTO, NRO_CARTA_FIANZA, FEC_RECEPCION_SOLICITUD)
                    SELECT PI_I_TIPO_EVENTO,
                           EXDO.ID_EXPEDIENTE_DOCUMENTO,
                           GARA.VC_CARTA_FIANZA,
                           EXSU.FEC_RECEPCION_TRAMITE
                      FROM T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
                     INNER JOIN T_SCOB_EXPED_SUSPENDER EXSU
                        ON EXSU.ID_EXPED_SUSPENDER = PI_N_ID_TIPO_EVENTO
                       AND EXSU.ID_EXPEDIENTE = EXDO.ID_EXPEDIENTE
                     INNER JOIN T_SCOB_EXPED_SUSPENDER_DOC EXSUDOC
                        ON EXSUDOC.ID_EXPED_SUSPENDER = EXSU.ID_EXPED_SUSPENDER
                       AND EXSUDOC.ID_EXPEDIENTE_DOCUMENTO = EXDO.ID_EXPEDIENTE_DOCUMENTO
                       AND EXSUDOC.ESTADO = '1'
                      LEFT JOIN T_SCOB_EXPEDIENTE_GARANTIA EXGA
                        ON EXGA.ID_EXPEDIENTE = EXDO.ID_EXPEDIENTE
                       AND EXGA.COD_TIPO_ENTIDAD = SCOB_PK_CONSTANTES.C_TIPO_GARANTIA_SUSPENSION
                       AND EXGA.ID_ENTIDAD = EXSU.ID_EXPED_SUSPENDER
                       AND EXGA.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
                      LEFT JOIN VW_MULTA_CF_CABECERA GARA
                        ON GARA.NU_ID_EMPRESA = EXGA.NU_ID_EMPRESA
                       AND GARA.VC_ANIO_CARTA = EXGA.VC_ANIO_CARTA
                       AND GARA.NU_ID_CARTA_FIANZA = EXGA.NU_ID_CARTA_FIANZA
                     WHERE EXDO.COD_GENERADOR_DOCUMENTO = PI_N_COD_GENERADOR_DOCUMENTO
                       AND EXDO.ID_EXPEDIENTE = N_ID_EXPEDIENTE;
            
                COMMIT;
            
            WHEN PI_I_TIPO_EVENTO = 2 THEN
                --FRACCIONAMIENTO
            
                INSERT INTO T_SCOB_TMP_ETIQUETA_EXPED
                    (TIPO_EVENTO, ID_DOCUMENTO, NRO_CARTA_FIANZA, FEC_RECEPCION_SOLICITUD, NRO_CUOTAS_FRACCIONAR, MONTO_FRACCIONAR)
                    SELECT PI_I_TIPO_EVENTO,
                           EXDO.ID_EXPEDIENTE_DOCUMENTO,
                           GARA.VC_CARTA_FIANZA,
                           EXFR.FEC_RECEPCION_TRAMITE,
                           EXFR.NRO_CUOTAS,
                           EXFR.MONTO_FRACCIONAR
                      FROM T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
                     INNER JOIN T_SCOB_EXPED_FRACCIONAR EXFR
                        ON EXFR.ID_EXPED_FRACCIONAR = PI_N_ID_TIPO_EVENTO
                     INNER JOIN T_SCOB_EXPED_FRACCIONAR_DOC EXFRDOC
                        ON EXFRDOC.ID_EXPED_FRACCIONAR = EXFRDOC.ID_EXPED_FRACCIONAR
                       AND EXFRDOC.ID_EXPEDIENTE_DOCUMENTO = EXDO.ID_EXPEDIENTE_DOCUMENTO
                       AND EXFRDOC.ESTADO = '1'
                      LEFT JOIN T_SCOB_EXPEDIENTE_GARANTIA EXGA
                        ON EXGA.ID_EXPEDIENTE = EXFR.ID_EXPEDIENTE
                       AND EXGA.COD_TIPO_ENTIDAD = SCOB_PK_CONSTANTES.C_TIPO_GARANTIA_FRACCIONAR
                       AND EXGA.ID_ENTIDAD = EXFR.ID_EXPED_FRACCIONAR
                       AND EXGA.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
                      LEFT JOIN VW_MULTA_CF_CABECERA GARA
                        ON GARA.NU_ID_EMPRESA = EXGA.NU_ID_EMPRESA
                       AND GARA.VC_ANIO_CARTA = EXGA.VC_ANIO_CARTA
                       AND GARA.NU_ID_CARTA_FIANZA = EXGA.NU_ID_CARTA_FIANZA
                     WHERE EXDO.COD_GENERADOR_DOCUMENTO = PI_N_COD_GENERADOR_DOCUMENTO
                       AND EXDO.ID_EXPEDIENTE = N_ID_EXPEDIENTE;
                COMMIT;
            
            WHEN PI_I_TIPO_EVENTO = 3 THEN
                --EMBARGO RETENCION
                INSERT INTO T_SCOB_TMP_ETIQUETA_EXPED
                    (TIPO_EVENTO, ID_DOCUMENTO, NOM_BANCO, DIRECCION_BANCO, TOTAL_EMBARGO, ID_UBIGEO_BANCO,
                      --15.06.2012 - UBIGEO DE BANCOS
                     COD_TIPO_DOC_IDENT_BCO
                      --15.06.2012 - TIPO DOCUMENTO BANCO
                     )
                    SELECT PI_I_TIPO_EVENTO,
                           EXDO.ID_EXPEDIENTE_DOCUMENTO,
                           ENFI.NOMBRE,
                           ENFI.DIRECCION,
                           EXEM.MONTO_EMBARGO,
                           ENFI.ID_UBIGEO, --15.06.2012 - UBIGEO DE BANCOS
                           ENFI.COD_TIPO_DOC_IDENTIDAD --15.06.2012 - TIPO DOCUMENTO BANCO
                      FROM T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
                     INNER JOIN T_SCOB_EXPED_EMBARGO EXEM
                        ON EXEM.ID_EXPEDIENTE = EXDO.ID_EXPEDIENTE
                       AND EXEM.ID_EXPEDIENTE_EMBARGO = PI_N_ID_TIPO_EVENTO
                     INNER JOIN T_SCOB_EXPED_EMBARGO_DOC EXEMDOC
                        ON EXEMDOC.ID_EXPEDIENTE_EMBARGO = EXEM.ID_EXPEDIENTE_EMBARGO
                       AND EXEMDOC.ID_EXPEDIENTE_DOCUMENTO = EXDO.ID_EXPEDIENTE_DOCUMENTO
                       AND EXEMDOC.COD_GENERADOR_DOCUMENTO = EXDO.COD_GENERADOR_DOCUMENTO
                       AND EXEMDOC.ESTADO = '1'
                      LEFT JOIN T_SCOB_EXPED_DOCUMENTO_DIREC EDIR
                        ON EDIR.ID_EXPEDIENTE_DOCUMENTO = EXDO.ID_EXPEDIENTE_DOCUMENTO
                       AND EDIR.ESTADO = '1'
                      LEFT JOIN T_SCOB_ENTIDAD_FINANCIERA ENFI
                        ON ENFI.ID_ENTIDAD_FINANCIERA = EDIR.ID_ENTIDAD
                       AND EDIR.COD_TIPO_ENTIDAD = '2'
                     WHERE EXDO.COD_GENERADOR_DOCUMENTO = PI_N_COD_GENERADOR_DOCUMENTO
                       AND EXDO.ID_EXPEDIENTE = N_ID_EXPEDIENTE;
                COMMIT;
            
            WHEN PI_I_TIPO_EVENTO = 4 THEN
                --EMBARGO RETENER-REQUERIR
                INSERT INTO T_SCOB_TMP_ETIQUETA_EXPED
                    (TIPO_EVENTO, ID_DOCUMENTO, TOTAL_REQUERIDO, MONTO_SOLES_RETENCION, MONTO_USD_RETENCION, NOM_BANCO_RETENEDOR,
                     DIRECCION_BANCO_RETENEDOR,
                      --27.04.2012
                     TOTAL_EMBARGO, TOTAL_REDUCIR,
                      --27.04.2012
                     MONTO_INFORMADO_SOLES, MONTO_INFORMADO_USD, FEC_RETENCION_INDECOPI, ID_UBIGEO_BANCO_RET,
                      --15.06.2012 - UBIGEO DE BANCOS
                     COD_TIPO_DOC_IDENT_BCO_RET
                      --15.06.2012 - TIPO DOCUMENTO BANCO
                     )
                    SELECT PI_I_TIPO_EVENTO,
                           EXDO.ID_EXPEDIENTE_DOCUMENTO,
                           ----------------------------------------------------------------------------
                           (CASE
                               WHEN EREQ.COD_TIPO_ASOCIACION = 2 OR
                                    EREQ.COD_TIPO_ASOCIACION = 4 THEN
                                EREQ.MONTO_APLICAR_TOTAL
                               ELSE
                                EXEMDOC.MONTO_REQUERIR
                           END) AS MONTO_REQUERIR,
                           
                           (CASE
                               WHEN EREQ.COD_TIPO_ASOCIACION = 2 OR
                                    EREQ.COD_TIPO_ASOCIACION = 4 THEN
                                EREQ.MONTO_APLICAR
                               ELSE
                                EXEMDOC.MONTO_APLICAR
                           END) AS MONTO_APLICAR,
                           
                           (CASE
                               WHEN EREQ.COD_TIPO_ASOCIACION = 2 OR
                                    EREQ.COD_TIPO_ASOCIACION = 4 THEN
                                EREQ.MONTO_APLICAR_ME
                               ELSE
                                EXEMDOC.MONTO_APLICAR_ME
                           END) AS MONTO_APLICAR_ME,
                           ----------------------------------------------------------------------------
                           ENFI.NOMBRE,
                           ENFI.DIRECCION,
                           EXEM.MONTO_EMBARGO, --TOTAL EMBARGADO
                           ----------------------------------------------------------------------------
                           (CASE
                               WHEN EREQ.COD_TIPO_ASOCIACION = 2 OR
                                    EREQ.COD_TIPO_ASOCIACION = 4 THEN
                                EREQ.MONTO_REDUCIR
                               ELSE
                                EXEMDOC.MONTO_RETENER
                           END) AS MONTO_REDUCIR,
                           ----------------------------------------------------------------------------
                           ERET.MONTO_SOLES,
                           ERET.MONTO_DOLAR,
                           ERET.FEC_RETENCION_INDECOPI,
                           ENFI.ID_UBIGEO, --15.06.2012 - UBIGEO DE BANCO
                           ENFI.COD_TIPO_DOC_IDENTIDAD --15.06.2012 - TIPO DOCUMENTO BANCO
                      FROM T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
                     INNER JOIN T_SCOB_EXPED_EMBARGO EXEM
                        ON EXEM.ID_EXPEDIENTE = EXDO.ID_EXPEDIENTE
                       AND EXEM.ID_EXPEDIENTE_EMBARGO = PI_N_ID_TIPO_EVENTO
                      LEFT JOIN T_SCOB_EXPED_DOCUMENTO_DIREC EDIR
                        ON EDIR.ID_EXPEDIENTE_DOCUMENTO = EXDO.ID_EXPEDIENTE_DOCUMENTO
                       AND EDIR.ESTADO = '1'
                      LEFT JOIN T_SCOB_EXPED_EMBARGO_DOC EXEMDOC
                        ON EXEMDOC.ID_EXPEDIENTE_EMBARGO = EXEM.ID_EXPEDIENTE_EMBARGO
                       AND EXEMDOC.ID_EXPEDIENTE_DOCUMENTO = EXDO.ID_EXPEDIENTE_DOCUMENTO
                       AND EXEMDOC.ESTADO = '1'
                      LEFT JOIN T_SCOB_EXPED_EMBARGO_REQ EREQ
                        ON EREQ.ID_EMBARGO_REQUERIR = EXEMDOC.ID_EMBARGO_REQUERIR
                       AND EREQ.ESTADO = '1'
                    -----
                      LEFT JOIN (SELECT ERET.ID_EXPEDIENTE_EMBARGO AS ID_EXPEDIENTE_EMBARGO,
                                        ERET.COD_GENERADOR_REQUERIR AS COD_GENERADOR_REQUERIR,
                                        ERET.ID_ENTIDAD_FINANCIERA AS ID_ENTIDAD_FINANCIERA,
                                        ERET.FEC_RETENCION_INDECOPI AS FEC_RETENCION_INDECOPI,
                                        SUM(ERET.MONTO_SOLES) AS MONTO_SOLES,
                                        SUM(ERET.MONTO_DOLAR) AS MONTO_DOLAR
                                   FROM T_SCOB_EXPED_EMBARGO_RET ERET
                                  WHERE ERET.ESTADO = '1'
                                    AND ERET.ID_EXPEDIENTE_EMBARGO = PI_N_ID_TIPO_EVENTO --ID_EMBARGO_RETENCION
                                    AND ERET.COD_GENERADOR_REQUERIR IS NOT NULL
                                  GROUP BY ERET.ID_EXPEDIENTE_EMBARGO,
                                           ERET.COD_GENERADOR_REQUERIR,
                                           ERET.ID_ENTIDAD_FINANCIERA,
                                           ERET.FEC_RETENCION_INDECOPI) ERET
                        ON ERET.ID_EXPEDIENTE_EMBARGO = EXEM.ID_EXPEDIENTE_EMBARGO
                       AND ERET.COD_GENERADOR_REQUERIR = EREQ.COD_GENERADOR_REQUERIR
                       AND ERET.ID_ENTIDAD_FINANCIERA = EREQ.ID_ENTIDAD_FINANCIERA
                    -----
                      LEFT JOIN T_SCOB_ENTIDAD_FINANCIERA ENFI
                        ON ENFI.ID_ENTIDAD_FINANCIERA = EDIR.ID_ENTIDAD
                       AND EDIR.COD_TIPO_ENTIDAD = '2'
                    
                     WHERE EXDO.COD_GENERADOR_DOCUMENTO = PI_N_COD_GENERADOR_DOCUMENTO
                       AND EXDO.ID_EXPEDIENTE = N_ID_EXPEDIENTE;
                COMMIT;
            
            WHEN PI_I_TIPO_EVENTO = 5 THEN
                --EMBARGO INSCRIPCION Y SECUESTRO
                INSERT INTO T_SCOB_TMP_ETIQUETA_EXPED
                    (TIPO_EVENTO, ID_DOCUMENTO, COSTAS_PROYECTADAS, NOM_BANCO, DIRECCION_BANCO, TOTAL_EMBARGO, ID_UBIGEO_BANCO,
                      --15.06.2012 - NO EXISTE UBIGEO DE BANCOS
                     COD_TIPO_DOC_IDENT_BCO
                      --15.06.2012 - NO TIENE TIPO DOCUMENTO
                     )
                    SELECT PI_I_TIPO_EVENTO,
                           EXDO.ID_EXPEDIENTE_DOCUMENTO,
                           EXEM.MONTO_COSTAS_PROYECTADAS,
                           ENES.NOM_ENTIDAD,
                           ENES.NOM_DIRECCION,
                           N_MONTO_TOTAL_EMBARGO,
                           ENES.ID_UBIGEO, --15.06.2012 -- UBIGEO DE BANCO (ENTIDAD ESTATAL)
                           ENES.COD_TIPO_DOC_IDENTIDAD --15.06.2012 - TIPO DOCUMENTO BANCO (ENTIDAD ESTATAL)
                      FROM T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
                     INNER JOIN T_SCOB_EXPED_EMBARGO EXEM
                        ON EXEM.ID_EXPEDIENTE = EXDO.ID_EXPEDIENTE
                       AND EXEM.ID_EXPEDIENTE_EMBARGO = PI_N_ID_TIPO_EVENTO
                     INNER JOIN T_SCOB_EXPED_EMBARGO_DOC EXEMDOC
                        ON EXEMDOC.ID_EXPEDIENTE_EMBARGO = EXEM.ID_EXPEDIENTE_EMBARGO
                       AND EXEMDOC.ID_EXPEDIENTE_DOCUMENTO = EXDO.ID_EXPEDIENTE_DOCUMENTO
                       AND EXEMDOC.COD_GENERADOR_DOCUMENTO = EXDO.COD_GENERADOR_DOCUMENTO
                      LEFT JOIN T_SCOB_EXPED_DOCUMENTO_DIREC EDIR
                        ON EDIR.ID_EXPEDIENTE_DOCUMENTO = EXDO.ID_EXPEDIENTE_DOCUMENTO
                       AND EDIR.COD_TIPO_ENTIDAD IN (SCOB_PK_CONSTANTES.C_COD_ENTIDAD_SUNAT,
                                                     SCOB_PK_CONSTANTES.C_COD_ENTIDAD_SAT,
                                                     SCOB_PK_CONSTANTES.C_COD_ENTIDAD_PNP,
                                                     SCOB_PK_CONSTANTES.C_COD_ENTIDAD_SUNARP)
                      LEFT JOIN T_SCOB_ENTIDAD_ESTATAL ENES
                        ON ENES.ID_ENTIDAD_ESTATAL = EDIR.ID_ENTIDAD
                       AND ENES.COD_TIPO_ENTIDAD = EDIR.COD_TIPO_ENTIDAD
                     WHERE EXDO.COD_GENERADOR_DOCUMENTO = PI_N_COD_GENERADOR_DOCUMENTO
                       AND EXDO.ID_EXPEDIENTE = N_ID_EXPEDIENTE;
                COMMIT;
            
            ELSE
                NULL;
            
        END CASE;
    
        --recorrer los sancionados para consolidarlos en una sola variable: nombres y documentos
        /*I_NRO_REG := 1;
        WHILE I_TOTAL_REG > 0
        LOOP
          SELECT
               MSAN.NOM_SANCIONADO, MSAN.TIPO_DOC_IDENTIDAD, MSAN.NRO_DOC_IDENTIDAD, MSAN.FLG_SANC_PRINCIPAL
          INTO V_NOM_SANCIONADO,V_TIPO_DOC_IDENTIDAD,V_NRO_DOC_IDENTIDAD,C_FLG_SANC_PRINCIPAL
          FROM T_SCOB_TMP_MULTA_SANC MSAN
          WHERE MSAN.ID_SECUENCIA = I_NRO_REG;
        
          V_NOMBRES_SANCIONADO := V_NOMBRES_SANCIONADO || V_NOM_SANCIONADO || ' / ';
          V_TIPO_DOC_SANCIONADO := V_TIPO_DOC_SANCIONADO || V_TIPO_DOC_IDENTIDAD || ' / ';
          V_NRO_DOC_SANCIONADO := V_NRO_DOC_SANCIONADO || V_NRO_DOC_IDENTIDAD || ' / ';
        
          --si el sancionado es el principal captura sus datos : falta
          IF C_FLG_SANC_PRINCIPAL = '1' THEN
             V_NOM_SANC_PRINCIPAL := V_NOM_SANCIONADO;
             V_TIPO_DOC_SANC_PRINCIPAL := V_TIPO_DOC_IDENTIDAD;
             V_NRO_DOC_SANC_PRINCIPAL := V_NRO_DOC_IDENTIDAD;
          END IF;
        
          I_NRO_REG := I_NRO_REG + 1;
          I_TOTAL_REG := I_TOTAL_REG - 1;
        END LOOP;*/
        FOR ITEM IN (SELECT DISTINCT DECODE(PERS.TIPO_PERSONA,
                                            SCOB_PK_CONSTANTES.C_TIPO_PERS_NATURAL,
                                            PERS.APE_PATERNO || ' ' || PERS.APE_MATERNO || ' ' || PERS.PRI_NOMBRE || ' ' || PERS.SEG_NOMBRE,
                                            PERS.RAZON_SOCIAL) AS NOM_SANCIONADO,
                                     TDID.TXT_DESCRIPCION AS TIPO_DOC_IDENTIDAD,
                                     PERS.NRO_DOC AS NRO_DOC_IDENTIDAD,
                                     MSAN.FLG_PRINCIPAL AS FLG_SANC_PRINCIPAL
                       FROM T_SCOB_MULTA MULT
                      INNER JOIN T_SCOB_MULTA_DETAL MDET
                         ON MDET.ID_MULTA = MULT.ID_MULTA
                        AND MDET.FLG_ACTUAL = '1'
                        AND MDET.ESTADO = '1'
                      INNER JOIN T_SCOB_MULTA_SANCIONADO MSAN
                         ON MSAN.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL
                        AND MSAN.COD_TIPO_PERSONA = SCOB_PK_CONSTANTES.C_COD_TIPO_PERSONA_SANCIONADO
                        AND MSAN.ESTADO = '1'
                      INNER JOIN T_SCOB_PERSONA PERS
                         ON PERS.ID_PERSONA = MSAN.ID_PERSONA
                      INNER JOIN T_SCOB_TABLA_DET TDID
                         ON TDID.ID_TABLA = SCOB_PK_CONSTANTES.C_TBL_TIPO_DOC_IDENT
                        AND TDID.COD_INTERNO = PERS.TIPO_DOC
                      WHERE MULT.ID_MULTA IN
                            (SELECT DISTINCT EXMU.ID_MULTA
                               FROM T_SCOB_EXPEDIENTE_MULTA EXMU
                              WHERE EXMU.ID_EXPEDIENTE IN (SELECT DISTINCT EXDO.ID_EXPEDIENTE
                                                             FROM T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
                                                            WHERE EXDO.COD_GENERADOR_DOCUMENTO = PI_N_COD_GENERADOR_DOCUMENTO)
                                AND EXMU.ESTADO = '1'))
        LOOP
            --
            V_NOMBRES_SANCIONADO  := V_NOMBRES_SANCIONADO || ITEM.NOM_SANCIONADO || ' / ';
            V_TIPO_DOC_SANCIONADO := V_TIPO_DOC_SANCIONADO || ITEM.TIPO_DOC_IDENTIDAD || ' / ';
            V_NRO_DOC_SANCIONADO  := V_NRO_DOC_SANCIONADO || ITEM.NRO_DOC_IDENTIDAD || ' / ';
            --si el sancionado es el principal captura sus datos : falta
            IF ITEM.FLG_SANC_PRINCIPAL = '1' THEN
                V_NOM_SANC_PRINCIPAL      := ITEM.NOM_SANCIONADO;
                V_TIPO_DOC_SANC_PRINCIPAL := ITEM.TIPO_DOC_IDENTIDAD;
                V_NRO_DOC_SANC_PRINCIPAL  := ITEM.NRO_DOC_IDENTIDAD;
            END IF;
        END LOOP;
    
        SELECT SUBSTR(V_NOMBRES_SANCIONADO, 1, LENGTH(V_NOMBRES_SANCIONADO) - 3) INTO V_NOMBRES_SANCIONADO FROM DUAL;
        SELECT SUBSTR(V_TIPO_DOC_SANCIONADO, 1, LENGTH(V_TIPO_DOC_SANCIONADO) - 3) INTO V_TIPO_DOC_SANCIONADO FROM DUAL;
        SELECT SUBSTR(V_NRO_DOC_SANCIONADO, 1, LENGTH(V_NRO_DOC_SANCIONADO) - 3) INTO V_NRO_DOC_SANCIONADO FROM DUAL;
    
        --retorna el cursor de los sancionados.
        OPEN PO_CU_RET_SANCIONADO FOR
            SELECT MSAN.ID_MULTA,
                   MSAN.CUM,
                   REPLACE(MSAN.NOM_SANCIONADO, CHR(38), CHR(38) || 'amp;') AS NOM_SANCIONADO,
                   --MSAN.NOM_SANCIONADO,
                   MSAN.TIPO_DOC_IDENTIDAD,
                   MSAN.NRO_DOC_IDENTIDAD
              FROM T_SCOB_TMP_MULTA_SANC MSAN;
    
        --obtener las etiquetas para la generacion del documento
        --open po_cu_retorno for
        
        V_VC_IMPORTE_UIT := TO_CHAR(SCOB_PK_GENERAR_DOCUMENTO.SCOB_FN_SUM_DOC_EXP(SCOB_PK_CONSTANTES.C_COD_TIPO_PERSONA_SANCIONADO,
                                                                                  SCOB_PK_CONSTANTES.C_TBL_TIPO_DOC_IDENT,
                                                                                  PI_N_COD_GENERADOR_DOCUMENTO,
                                                                                  'IMPORTE_UIT'));

        V_VC_VALOR_UIT := TO_CHAR(SCOB_PK_GENERAR_DOCUMENTO.SCOB_FN_SUM_DOC_EXP(SCOB_PK_CONSTANTES.C_COD_TIPO_PERSONA_SANCIONADO,
                                                                                  SCOB_PK_CONSTANTES.C_TBL_TIPO_DOC_IDENT,
                                                                                  PI_N_COD_GENERADOR_DOCUMENTO,
                                                                                  'VALOR_UIT'));
                                                                                  
        V_VC_SALDO_CAPITAL := TO_CHAR(SCOB_PK_GENERAR_DOCUMENTO.SCOB_FN_SUM_DOC_EXP(SCOB_PK_CONSTANTES.C_COD_TIPO_PERSONA_SANCIONADO,
                                                                                  SCOB_PK_CONSTANTES.C_TBL_TIPO_DOC_IDENT,
                                                                                  PI_N_COD_GENERADOR_DOCUMENTO,
                                                                                  'SALDO_CAPITAL'));
                                                                                  
        V_VC_SALDO_COSTAS := TO_CHAR(SCOB_PK_GENERAR_DOCUMENTO.SCOB_FN_SUM_DOC_EXP(SCOB_PK_CONSTANTES.C_COD_TIPO_PERSONA_SANCIONADO,
                                                                                  SCOB_PK_CONSTANTES.C_TBL_TIPO_DOC_IDENT,
                                                                                  PI_N_COD_GENERADOR_DOCUMENTO,
                                                                                  'SALDO_COSTAS'));
                                                                                  
        
        V_VC_SALDO_TOTAL := TO_CHAR(SCOB_PK_GENERAR_DOCUMENTO.SCOB_FN_SUM_DOC_EXP(SCOB_PK_CONSTANTES.C_COD_TIPO_PERSONA_SANCIONADO,
                                                                                  SCOB_PK_CONSTANTES.C_TBL_TIPO_DOC_IDENT,
                                                                                  PI_N_COD_GENERADOR_DOCUMENTO,
                                                                                  'SALDO_TOTAL_DEUDA'));
        
        
         EXECUTE IMMEDIATE 'TRUNCATE TABLE T_SCOB_TMP_GEN_DOC_EXPED';
        INSERT INTO T_SCOB_TMP_GEN_DOC_EXPED
            (ID_EXPEDIENTE_DOCUMENTO, ID_MULTA, NOM_ARCH_PLANTILLA, NOM_ARCH_A_GENERAR, COD_SUBTIPO_DOCUMENTO, FEC_GENERACION_DOC, NRO_DOCUMENTO,
             NRO_RESOLUCION_DOC, SIGLA_AEC, IMPORTE_UIT, NOM_SANCIONADO_TODOS, DES_TIPO_DOC_SANC_TODOS, NRO_DOC_SANC_TODOS, NOM_SANCIONADO,
             TIPO_DOC_SANC_PRINCIPAL, NRO_DOC_SANC_PRINCIPAL, NOM_CARGO_JEFE_AEC, NOM_SECRETARIO_TEC, NOM_CARGO_SECRETARIO_TEC, NOM_OR_MULTA,
             NOM_JEFE_AEC, NRO_FILE, SIGLA_NOM_JEFE_AEC, NRO_CUM, NRO_SEC, NRO_RESOLUCION_OR, NRO_EXPED_ADMIN_MULTA, SIGLA_NOM_USUARIO_GEN_DOC,
             AEC_ANEXO_TELEFONO, AEC_NOMBRE, AEC_TELEFONO, NRO_EXPED_ANTIGUO_MULTA, VALOR_UIT, NRO_EXPEDIENTE, NOM_SANCIONADO_DOC, NRO_DOC_IDENTIDAD,
             TIPO_DOC_IDENTIDAD, DOMICILIO_SANCIONADO, DOMICILIO_FISCAL, DOMICILIO_PROCESAL, MONTO_CAPITAL, MONTO_IC, MONTO_IM, MONTO_COSTAS,
             MONTO_TOTAL, MONTO_AMORT_CAPITAL, SALDO_CAPITAL, SALDO_IC, SALDO_IM, SALDO_COSTAS, SALDO_TOTAL, COSTAS_PROYECTADAS, NRO_CARTA_FIANZA,
             NOM_BANCO, DIRECCION_BANCO, MONTO_SOLES_RETENCION, MONTO_USD_RETENCION, NOM_BANCO_RETENEDOR, FEC_RECEPCION_SOLICITUD, TOTAL_REQUERIDO,
             NRO_CUOTAS_FRACCIONAR, MONTO_FRACCIONAR, TOTAL_EMBARGO, DIRECCION_BANCO_RETENEDOR, TOTAL_REDUCIR, NRO_DOC_REC, FEC_RETENCION_INDECOPI,
             MONTO_INFORMADO_SOLES, MONTO_INFORMADO_DOLARES, ID_EXPEDIENTE,
             ----15.06.2012
             COD_TIPO_DOC_IDENT_SANC, COD_TIPO_DOC_IDENT_BCO, COD_TIPO_DOC_IDENT_BCO_RET, ID_UBIGEO_DIREC_SANC, ID_UBIGEO_BCO, ID_UBIGEO_BCO_RET,
             ANIO_RESOL_OR, FEC_RESOL_OR,
             ----2016-11-09--antidumping
             NRO_OFICIO_SUNAT_CODIGO, NRO_OFICIO_SUNAT_ANIO, NRO_OFICIO_SUNAT_PREFIJO, NRO_OFICIO_SUNAT_CORRELATIVO, NRO_LIQUIDACION_CODIGO,
             NRO_LIQUIDACION_ANIO, NRO_LIQUIDACION_CORRELATIVO, NRO_DUA_CODIGO, NRO_DUA_ANIO, NRO_DUA_CORRELATIVO, TIPO_CAMBIO_ADUMP,
             MONTO_ANTIDUMPING, DESC_PARTIDA, DESC_INTENDENCIA, DESC_SUBMATERIA, FEC_RESOLUCION, FEC_NOTIFICACION, NOM_SEDE)
            SELECT DISTINCT EXDO.ID_EXPEDIENTE_DOCUMENTO AS ID_EXPEDIENTE_DOCUMENTO,
                            MULT.ID_MULTA AS ID_MULTA,
                            PLANT.NOM_ARCHIVO AS NOM_ARCH_PLANTILLA,
                            EXDO.NOMBRE AS NOM_ARCH_A_GENERAR,
                            EXDO.COD_SUBTIPO_DOCUMENTO AS COD_SUBTIPO_DOCUMENTO,
                            TO_CHAR(EXDO.FEC_INGRESO, 'DD/MM/YYYY') AS FEC_GENERACION_DOC,
                            --EXDO.FEC_INGRESO AS FEC_GENERACION_DOC,
                            EXDO.NRO_DOCUMENTO  AS NRO_DOCUMENTO,
                            EXDO.NRO_RESOLUCION AS NRO_RESOLUCION_DOC,
                            ACOB.SIGLAS_AEC     AS SIGLA_AEC,
                            --TO_CHAR(MULT.MONTO_UIT) AS IMPORTE_UIT,
                            /*TO_CHAR(SCOB_PK_GENERAR_DOCUMENTO.SCOB_FN_SUM_DOC_EXP(SCOB_PK_CONSTANTES.C_COD_TIPO_PERSONA_SANCIONADO,
                                                                                  SCOB_PK_CONSTANTES.C_TBL_TIPO_DOC_IDENT,
                                                                                  PI_N_COD_GENERADOR_DOCUMENTO,
                                                                                  'IMPORTE_UIT')) AS IMPORTE_UIT,*/
                            V_VC_IMPORTE_UIT AS IMPORTE_UIT,
                            V_NOMBRES_SANCIONADO AS NOM_SANCIONADO_TODOS,
                            V_TIPO_DOC_SANCIONADO AS DES_TIPO_DOC_SANC_TODOS, --NUEVO:29.03.2012
                            V_NRO_DOC_SANCIONADO AS NRO_DOC_SANC_TODOS, --NUEVO:29.03.2012
                            
                            V_NOM_SANC_PRINCIPAL      AS NOM_SANCIONADO, --NUEVO:29.03.2012, NOM_SANC_PRINCIPAL
                            V_TIPO_DOC_SANC_PRINCIPAL AS TIPO_DOC_SANC_PRINCIPAL, --NUEVO:29.03.2012, TIPO_DOC_SANC_PRINCIPAL
                            V_NRO_DOC_SANC_PRINCIPAL  AS NRO_DOC_SANC_PRINCIPAL, --NUEVO:29.03.2012, NRO_DOC_SANC_PRINCIPAL
                            
                            ACOB.CARGO_JEFE_AEC AS NOM_CARGO_JEFE_AEC,
                            USU_SEC.PRI_NOMBRE || ' ' || USU_SEC.SEG_NOMBRE || ', ' || USU_SEC.APE_PATERNO || ' ' || USU_SEC.APE_MATERNO || ' ' ||
                            USU_SEC.APE_CASADA AS NOM_SECRETARIO_TEC,
                            CARGO_USU_SEC.DESCRIPCION AS NOM_CARGO_SECRETARIO_TEC,
                            ORGR.DESCRIPCION AS NOM_OR_MULTA,
                            ACOB.NOM_JEFE_AEC AS NOM_JEFE_AEC,
                            --MULT.ANIO_FILE_AEC||ACOB.COD_AEC||MULT.NRO_FILE_AEC AS NRO_FILE,
                            SCOB_PK_EXPEDIENTE.SCOB_FN_NRO_FILE_CUM_ALFA(EXPE.ID_EXPEDIENTE, 1) AS NRO_FILE,
                            SIGLAS_JEFE_AEC AS SIGLA_NOM_JEFE_AEC,
                            --MULT.ANIO||MULT.CUM AS NRO_CUM,
                            SCOB_PK_EXPEDIENTE.SCOB_FN_CUMS_EXP(EXPE.ID_EXPEDIENTE) AS NRO_CUM,
                            MULT.ANIO || MULT.CUM || NVL(MULT.NRO_ULT_IMPROCEDENCIA, ' ') AS NRO_SEC,
                            MDET.NRO_RESOLUCION AS NRO_RESOLUCION_OR,
                            MULT.NRO_EXP_ADMINISTRATIVO AS NRO_EXPED_ADMIN_MULTA,
                            TRIM(SUBSTR(USU_DOC.PRI_NOMBRE, 1, 1)) || TRIM(SUBSTR(USU_DOC.APE_PATERNO, 1, 1)) ||
                            TRIM(SUBSTR(USU_DOC.APE_MATERNO, 1, 1)) AS SIGLA_NOM_USUARIO_GEN_DOC,
                            ACOB.ANEXO_AEC AS AEC_ANEXO_TELEFONO,
                            ACOB.NOMBRE_AEC AS AEC_NOMBRE,
                            ACOB.TELEFONO_AEC AS AEC_TELEFONO,
                            MDET.NRO_EXP_NIVEL AS NRO_EXPED_ANTIGUO_MULTA,
                            --TO_CHAR(MDET.VALOR_UIT) AS VALOR_UIT,
                            /*TO_CHAR(SCOB_PK_GENERAR_DOCUMENTO.SCOB_FN_SUM_DOC_EXP(SCOB_PK_CONSTANTES.C_COD_TIPO_PERSONA_SANCIONADO,
                                                                                  SCOB_PK_CONSTANTES.C_TBL_TIPO_DOC_IDENT,
                                                                                  PI_N_COD_GENERADOR_DOCUMENTO,
                                                                                  'VALOR_UIT')) AS VALOR_UIT,*/
                            V_VC_VALOR_UIT AS VALOR_UIT,
                            EXPE.ANIO || EXPE.NRO_EXPEDIENTE AS NRO_EXPEDIENTE,
                            ---
                            
                            (CASE
                                WHEN PI_I_TIPO_EVENTO <> 0 THEN
                                 (CASE
                                     WHEN EDIR.COD_TIPO_ENTIDAD = SCOB_PK_CONSTANTES.C_COD_ENTIDAD_PERSONA OR
                                          EDIR.COD_TIPO_ENTIDAD = SCOB_PK_CONSTANTES.C_COD_ENTIDAD_TASADOR THEN
                                     
                                      DECODE(PERS.TIPO_PERSONA,
                                             SCOB_PK_CONSTANTES.C_TIPO_PERS_NATURAL,
                                             PERS.APE_PATERNO || ' ' || PERS.APE_MATERNO || ' ' || PERS.PRI_NOMBRE || ' ' || PERS.SEG_NOMBRE,
                                             PERS.RAZON_SOCIAL)
                                 END)
                                ELSE
                                 DECODE(PERS.TIPO_PERSONA,
                                        SCOB_PK_CONSTANTES.C_TIPO_PERS_NATURAL,
                                        PERS.APE_PATERNO || ' ' || PERS.APE_MATERNO || ' ' || PERS.PRI_NOMBRE || ' ' || PERS.SEG_NOMBRE,
                                        PERS.RAZON_SOCIAL)
                            END
                            
                            ) AS NOM_SANCIONADO_DOC,
                            
                            (CASE
                                WHEN PI_I_TIPO_EVENTO <> 0 THEN
                                 (CASE
                                     WHEN EDIR.COD_TIPO_ENTIDAD = SCOB_PK_CONSTANTES.C_COD_ENTIDAD_PERSONA OR
                                          EDIR.COD_TIPO_ENTIDAD = SCOB_PK_CONSTANTES.C_COD_ENTIDAD_TASADOR THEN
                                      PERS.NRO_DOC
                                     ELSE
                                      NULL
                                 END)
                                ELSE
                                 PERS.NRO_DOC
                            END) AS NRO_DOC_IDENTIDAD,
                            
                            (CASE
                                WHEN PI_I_TIPO_EVENTO <> 0 THEN
                                 (CASE
                                     WHEN EDIR.COD_TIPO_ENTIDAD = SCOB_PK_CONSTANTES.C_COD_ENTIDAD_PERSONA OR
                                          EDIR.COD_TIPO_ENTIDAD = SCOB_PK_CONSTANTES.C_COD_ENTIDAD_TASADOR THEN
                                     
                                      SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_TIPO_DOC_IDENT, PERS.TIPO_DOC)
                                     ELSE
                                      NULL
                                 END)
                            
                                ELSE
                                 SCOB_PK_UTILITARIO.SCOB_FN_TABLA_DET_DES(SCOB_PK_CONSTANTES.C_TBL_TIPO_DOC_IDENT, PERS.TIPO_DOC)
                            END) AS TIPO_DOC_IDENTIDAD,
                            
                            (CASE
                                WHEN PI_I_TIPO_EVENTO <> 0 THEN
                                 (CASE
                                     WHEN EDIR.COD_TIPO_ENTIDAD = SCOB_PK_CONSTANTES.C_COD_ENTIDAD_PERSONA OR
                                          EDIR.COD_TIPO_ENTIDAD = SCOB_PK_CONSTANTES.C_COD_ENTIDAD_TASADOR THEN
                                     
                                      PDOM.NOM_VIA || ' ' || PDOM.NRO_VIA || ' ' || PDOM.NRO_INTERIOR || ' ' || PDOM.NOM_ZONA || ' ' || UBIG.TXT_DIST || ' ' ||
                                      UBIG.TXT_PROV || ' ' || UBIG.TXT_DPTO
                                     ELSE
                                      NULL
                                 END)
                                ELSE
                                 PDOM.NOM_VIA || ' ' || PDOM.NRO_VIA || ' ' || PDOM.NRO_INTERIOR || ' ' || PDOM.NOM_ZONA || ' ' || UBIG.TXT_DIST || ' ' ||
                                 UBIG.TXT_PROV || ' ' || UBIG.TXT_DPTO
                            END) AS DOMICILIO_SANCIONADO,
                            
                            (CASE
                                WHEN PI_I_TIPO_EVENTO <> 0 THEN
                                 (CASE
                                     WHEN EDIR.COD_TIPO_ENTIDAD = SCOB_PK_CONSTANTES.C_COD_ENTIDAD_PERSONA THEN
                                      SCOB_FN_DIREC_PERSONA_BY_TIPO(EXDO.ID_EXPEDIENTE, PERS.ID_PERSONA, SCOB_PK_CONSTANTES.C_COD_TIPO_DOMICILIO_FISCAL)
                                     ELSE
                                      NULL
                                 END)
                                ELSE
                                 SCOB_FN_DIREC_PERSONA_BY_TIPO(EXDO.ID_EXPEDIENTE, PERS.ID_PERSONA, SCOB_PK_CONSTANTES.C_COD_TIPO_DOMICILIO_FISCAL)
                            END) AS DOMICILIO_FISCAL,
                            
                            (CASE
                                WHEN PI_I_TIPO_EVENTO <> 0 THEN
                                 (CASE
                                     WHEN EDIR.COD_TIPO_ENTIDAD = SCOB_PK_CONSTANTES.C_COD_ENTIDAD_PERSONA THEN
                                      SCOB_FN_DIREC_PERSONA_BY_TIPO(EXDO.ID_EXPEDIENTE, PERS.ID_PERSONA, SCOB_PK_CONSTANTES.C_COD_TIPO_DOMICILIO_PROCESAL)
                                     ELSE
                                      NULL
                                 END)
                                ELSE
                                 SCOB_FN_DIREC_PERSONA_BY_TIPO(EXDO.ID_EXPEDIENTE, PERS.ID_PERSONA, SCOB_PK_CONSTANTES.C_COD_TIPO_DOMICILIO_PROCESAL)
                            END) AS DOMICILIO_PROCESAL,
                            --
                            TO_CHAR(MULT.MONTO_UIT) AS MONTO_CAPITAL,
                            TO_CHAR(MULT.MONTO_INTERES) AS MONTO_IC,
                            TO_CHAR(MULT.MONTO_INTERES_MORATORIO) AS MONTO_IM,
                            TO_CHAR(MULT.MONTO_COSTAS) AS MONTO_COSTAS,
                            TO_CHAR(MULT.MONTO_TOTAL_DEUDA) AS MONTO_TOTAL,
                            TO_CHAR(MULT.TOTAL_AMORTIZADO) AS MONTO_AMORT_CAPITAL,
                            --TO_CHAR(MULT.SALDO) AS SALDO_CAPITAL,
                            /*TO_CHAR(SCOB_PK_GENERAR_DOCUMENTO.SCOB_FN_SUM_DOC_EXP(SCOB_PK_CONSTANTES.C_COD_TIPO_PERSONA_SANCIONADO,
                                                                                  SCOB_PK_CONSTANTES.C_TBL_TIPO_DOC_IDENT,
                                                                                  PI_N_COD_GENERADOR_DOCUMENTO,
                                                                                  'SALDO_CAPITAL')) AS SALDO_CAPITAL,*/
                                                                                  
                            V_VC_SALDO_CAPITAL AS  SALDO_CAPITAL,
                            
                            TO_CHAR(MULT.SALDO_IC) AS SALDO_IC,
                            TO_CHAR(MULT.SALDO_IM) AS SALDO_IM,
                            --TO_CHAR(MULT.SALDO_COSTAS) AS SALDO_COSTAS,
                            /*TO_CHAR(SCOB_PK_GENERAR_DOCUMENTO.SCOB_FN_SUM_DOC_EXP(SCOB_PK_CONSTANTES.C_COD_TIPO_PERSONA_SANCIONADO,
                                                                                  SCOB_PK_CONSTANTES.C_TBL_TIPO_DOC_IDENT,
                                                                                  PI_N_COD_GENERADOR_DOCUMENTO,
                                                                                  'SALDO_COSTAS')) AS SALDO_COSTAS,*/
                                                                                  
                             V_VC_SALDO_COSTAS AS SALDO_COSTAS,
                            --TO_CHAR(MULT.SALDO_TOTAL_DEUDA) AS SALDO_TOTAL,
                            /*TO_CHAR(SCOB_PK_GENERAR_DOCUMENTO.SCOB_FN_SUM_DOC_EXP(SCOB_PK_CONSTANTES.C_COD_TIPO_PERSONA_SANCIONADO,
                                                                                  SCOB_PK_CONSTANTES.C_TBL_TIPO_DOC_IDENT,
                                                                                  PI_N_COD_GENERADOR_DOCUMENTO,
                                                                                  'SALDO_TOTAL_DEUDA')) AS SALDO_TOTAL,*/
                            
                            
                            V_VC_SALDO_TOTAL AS SALDO_TOTAL,
                            
                            
                            TO_CHAR(ADIC.COSTAS_PROYECTADAS) AS COSTAS_PROYECTADAS,
                            ADIC.NRO_CARTA_FIANZA AS NRO_CARTA_FIANZA,
                            ADIC.NOM_BANCO AS NOM_BANCO,
                            ADIC.DIRECCION_BANCO AS DIRECCION_BANCO,
                            TO_CHAR(ADIC.MONTO_SOLES_RETENCION) AS MONTO_SOLES_RETENCION,
                            TO_CHAR(ADIC.MONTO_USD_RETENCION) AS MONTO_USD_RETENCION,
                            TO_CHAR(ADIC.NOM_BANCO_RETENEDOR) AS NOM_BANCO_RETENEDOR,
                            TO_CHAR(ADIC.FEC_RECEPCION_SOLICITUD, 'DD/MM/YYYY') AS FEC_RECEPCION_SOLICITUD,
                            TO_CHAR(ADIC.TOTAL_REQUERIDO) AS TOTAL_REQUERIDO,
                            ADIC.NRO_CUOTAS_FRACCIONAR AS NRO_CUOTAS_FRACCIONAR,
                            TO_CHAR(ADIC.MONTO_FRACCIONAR) AS MONTO_FRACCIONAR,
                            TO_CHAR(ADIC.TOTAL_EMBARGO) AS TOTAL_EMBARGO,
                            TO_CHAR(ADIC.DIRECCION_BANCO_RETENEDOR) AS DIRECCION_BANCO_RETENEDOR,
                            TO_CHAR(ADIC.TOTAL_REDUCIR) AS TOTAL_REDUCIR,
                            REC.NRO_DOC_REC AS NRO_DOC_REC,
                            TO_CHAR(ADIC.FEC_RETENCION_INDECOPI, 'DD/MM/YYYY') AS FEC_RETENCION_INDECOPI,
                            TO_CHAR(ADIC.MONTO_INFORMADO_SOLES) AS MONTO_INFORMADO_SOLES,
                            TO_CHAR(ADIC.MONTO_INFORMADO_USD) AS MONTO_INFORMADO_DOLARES,
                            EXDO.ID_EXPEDIENTE AS ID_EXPEDIENTE,
                            --15/06/2012
                            CASE
                                WHEN EDIR.COD_TIPO_ENTIDAD = SCOB_PK_CONSTANTES.C_COD_ENTIDAD_PERSONA OR
                                     EDIR.COD_TIPO_ENTIDAD = SCOB_PK_CONSTANTES.C_COD_ENTIDAD_TASADOR THEN
                                 PERS.TIPO_DOC
                                ELSE
                                 NULL
                            END AS COD_TIPO_DOC_IDENT_SANC,
                            ADIC.COD_TIPO_DOC_IDENT_BCO AS COD_TIPO_DOC_IDENT_BCO,
                            ADIC.COD_TIPO_DOC_IDENT_BCO_RET AS COD_TIPO_DOC_IDENT_BCO_RET,
                            CASE
                                WHEN EDIR.COD_TIPO_ENTIDAD = SCOB_PK_CONSTANTES.C_COD_ENTIDAD_PERSONA OR
                                     EDIR.COD_TIPO_ENTIDAD = SCOB_PK_CONSTANTES.C_COD_ENTIDAD_TASADOR THEN
                                 UBIG.ID_UBIGEO
                                ELSE
                                 NULL
                            END AS ID_UBIGEO_DIREC_SANC,
                            ADIC.ID_UBIGEO_BANCO AS ID_DIREC_BCO,
                            ADIC.ID_UBIGEO_BANCO_RET AS ID_DIREC_BCO_RET,
                            MDET.ANIO_RESOLUCION AS ANIO_RESOL_OR,
                            TO_CHAR(MDET.FEC_RESOLUCION, 'YYYY-MM-DD') AS FEC_RESOL_OR,
                            ---------------AGREGANDO ETIQUETAS ANTIDUNPING-----------------
                            MANTID.NRO_OFICIO_SUNAT_CODIGO,
                            MANTID.NRO_OFICIO_SUNAT_ANIO,
                            MANTID.NRO_OFICIO_SUNAT_PREFIJO,
                            MANTID.NRO_OFICIO_SUNAT_CORRELATIVO,
                            MANTID.NRO_LIQUIDACION_CODIGO,
                            MANTID.NRO_LIQUIDACION_ANIO,
                            MANTID.NRO_LIQUIDACION_CORRELATIVO,
                            MANTID.NRO_DUA_CODIGO,
                            MANTID.NRO_DUA_ANIO,
                            MANTID.NRO_DUA_CORRELATIVO,
                            MANTID.TIPO_CAMBIO,
                            MANTID.MONTO_ANTIDUMPING,
                            PARTIDA.DESCRIPCION                 AS DESC_PARTIDA,
                            INTENDE.DESCRIPCION                 AS DESC_INTENDENCIA,
                            SUBMAT.DESCRIPCION                  AS DESC_SUBMATERIA,
                            MDET.FEC_RESOLUCION                 AS FEC_RESOLUCION,
                            MDET.FEC_NOTIFICACION_RESOLUCION    AS FEC_NOTIFICACION,
                            SEDE.DESCRIPCION                    AS NOM_SEDE
              FROM T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
            -----
              LEFT JOIN T_SCOB_EXPED_DOCUMENTO_DIREC EDIR
                ON EDIR.ID_EXPEDIENTE_DOCUMENTO = EXDO.ID_EXPEDIENTE_DOCUMENTO
               AND EDIR.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
               AND EDIR.COD_TIPO_ENTIDAD IN
                   (SCOB_PK_CONSTANTES.C_COD_ENTIDAD_PERSONA, SCOB_PK_CONSTANTES.C_COD_ENTIDAD_TASADOR, SCOB_PK_CONSTANTES.C_COD_ENTIDAD_DIREC_PERS)
              LEFT JOIN T_SCOB_PERSONA PERS
                ON PERS.ID_PERSONA = EDIR.ID_ENTIDAD
            
              LEFT JOIN T_SCOB_PERSONA_DOMICILIO PDOM
                ON PDOM.ID_PERSONA = PERS.ID_PERSONA
               AND PDOM.ID_PERSONA_DOMICILIO = EDIR.ID_DOMICILIO
            
              LEFT JOIN T_SCOB_UBIGEO UBIG
                ON UBIG.ID_UBIGEO = PDOM.ID_UBIGEO
            -----
              LEFT JOIN T_SCOB_TMP_ETIQUETA_EXPED ADIC
                ON ADIC.ID_DOCUMENTO = EXDO.ID_EXPEDIENTE_DOCUMENTO
            -----
            
             INNER JOIN T_SCOB_EXPEDIENTE EXPE
                ON EXPE.ID_EXPEDIENTE = EXDO.ID_EXPEDIENTE
            
             INNER JOIN T_SCOB_EXPEDIENTE_MULTA EXMU
                ON EXMU.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
               AND EXMU.ESTADO = '1'
            
             INNER JOIN T_SCOB_MULTA MULT
                ON MULT.ID_MULTA = EXMU.ID_MULTA
            
             INNER JOIN T_SCOB_MULTA_DETAL MDET
                ON MDET.ID_MULTA = MULT.ID_MULTA
               AND MDET.FLG_ACTUAL = '1'
               AND MDET.ESTADO = '1'
            
             INNER JOIN T_SCOB_USUARIO USU_SEC
                ON USU_SEC.ID_USUARIO = MDET.ID_USUARIO_SECRETARIO
            
             INNER JOIN T_SCOB_CARGO CARGO_USU_SEC
                ON CARGO_USU_SEC.ID_CARGO = USU_SEC.CARGO
            
             INNER JOIN T_SCOB_ORGANO_RESOLUTIVO ORGR
                ON ORGR.ID_ORGANO_RESOLUTIVO = MDET.ID_ORGANO_RESOLUTIVO
            
              LEFT JOIN T_SCOB_USUARIO USU_DOC
                ON USU_DOC.ID_USUARIO = EXDO.ID_USUARIO_INGRESO
            
              LEFT JOIN (SELECT AREA_COB.ID_AREA_COBRANZA AS ID_AREA_COBRANZA,
                                AREA_COB.DESCIPCION AS NOMBRE_AEC,
                                AREA_COB.CODIGO AS COD_AEC,
                                AREA_COB.SIGLAS AS SIGLAS_AEC,
                                AREA_COB.TELEFONO AS TELEFONO_AEC,
                                AREA_COB.ANEXO AS ANEXO_AEC,
                                USU_ACOB.APE_PATERNO || ' ' || USU_ACOB.APE_MATERNO || ' ' || USU_ACOB.APE_CASADA || ' ' || USU_ACOB.PRI_NOMBRE || ' ' ||
                                USU_ACOB.SEG_NOMBRE AS NOM_JEFE_AEC,
                                CARGO_ACOB.DESCRIPCION AS CARGO_JEFE_AEC,
                                TRIM(SUBSTR(USU_ACOB.PRI_NOMBRE, 1, 1)) || TRIM(SUBSTR(USU_ACOB.APE_PATERNO, 1, 1)) ||
                                TRIM(SUBSTR(USU_ACOB.APE_MATERNO, 1, 1)) AS SIGLAS_JEFE_AEC
                           FROM T_SCOB_AREA_COBRANZA AREA_COB
                          INNER JOIN T_SCOB_USUARIO USU_ACOB
                             ON USU_ACOB.ESTADO = '1'
                            AND USU_ACOB.ID_AREA_COBRANZA = AREA_COB.ID_AREA_COBRANZA
                          INNER JOIN T_SCOB_CARGO CARGO_ACOB
                             ON CARGO_ACOB.ID_CARGO = USU_ACOB.CARGO
                            AND CARGO_ACOB.CODIGO = SCOB_PK_CONSTANTES.C_COD_CARGO_JEFE_AEC
                          WHERE AREA_COB.ESTADO = '1'
                            AND ROWNUM = 1) ACOB
                ON ACOB.ID_AREA_COBRANZA = MULT.ID_AREA_COBRANZA
            
             INNER JOIN T_SCOB_PLANTILLA PLANT
                ON PLANT.ID_PLANTILLA = EXDO.ID_PLANTILLA
            
              LEFT JOIN (
                         --obtener el numero de la rec de uno o mas expediente, segun generacion de documentos
                         SELECT EXDO.ID_EXPEDIENTE,
                                 EXDO.NRO_RESOLUCION AS NRO_DOC_REC
                           FROM T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
                          WHERE EXDO.ID_EXPEDIENTE_DOCUMENTO IN (SELECT ECDOC.ID_EXPEDIENTE_DOCUMENTO
                                                                   FROM T_SCOB_EXPED_COACTIVO_DOC ECDOC
                                                                  WHERE ECDOC.COD_TIPO_ASOCIACION = 2 --COACTIVO
                                                                    AND ECDOC.ESTADO = '1')
                            AND EXDO.COD_SUBTIPO_DOCUMENTO = 1 --RESOLUCION
                            AND EXDO.ID_TIPO_DOCUMENTO = 1 --Resolucion REC
                            AND EXDO.ESTADO = '1') REC
                ON REC.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
            
            ---------------------2016-11-09------------Etiquetas antidumping---------
              LEFT JOIN T_SCOB_MULTA_ANTIDUMPING MANTID
                ON MANTID.ID_MULTA = MULT.ID_MULTA
               AND MANTID.ESTADO = 1
            
              LEFT JOIN USR_SICOB.T_SCOB_PARTIDA PARTIDA
                ON PARTIDA.ID_PARTIDA = MANTID.ID_PARTIDA
               AND PARTIDA.ESTADO = 1
              LEFT JOIN USR_SICOB.T_SCOB_INTENDENCIA INTENDE
                ON INTENDE.ID_INTENDENCIA = MANTID.ID_INTENDENCIA
               AND INTENDE.ESTADO = 1
              LEFT JOIN USR_SICOB.T_SCOB_SUBMATERIA SUBMAT
                ON SUBMAT.ID_SUBMATERIA = MULT.ID_SUB_MATERIA
               AND SUBMAT.ESTADO = 1
              LEFT JOIN USR_SICOB.T_SCOB_SEDE SEDE
                ON SEDE.ID_SEDE = MULT.ID_SEDE
             WHERE EXDO.COD_GENERADOR_DOCUMENTO = PI_N_COD_GENERADOR_DOCUMENTO
               AND EXDO.ID_EXPEDIENTE IN (SELECT DISTINCT EXDO.ID_EXPEDIENTE
                                            FROM T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
                                           WHERE EXDO.COD_GENERADOR_DOCUMENTO = PI_N_COD_GENERADOR_DOCUMENTO)
            
             ORDER BY EXDO.ID_EXPEDIENTE_DOCUMENTO;
    
        --------------------------------------------------------------------------------------------
        --LLAMAR SP INTERFAZ TRAMITE DOCUMENTARIO
        --------------------------------------------------------------------------------------------
        --VERIFICAR SI DEBE INGRESAR AL SISTEMA DE TRAMITE
        SELECT COUNT(ETIQ.ID_EXPEDIENTE_DOCUMENTO)
          INTO I_EXISTE
          FROM T_SCOB_TMP_GEN_DOC_EXPED ETIQ
         INNER JOIN T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
            ON EXDO.ID_EXPEDIENTE_DOCUMENTO = ETIQ.ID_EXPEDIENTE_DOCUMENTO
           AND EXDO.COD_SUBTIPO_DOCUMENTO IN
               (SCOB_PK_CONSTANTES.C_COD_SUBTIPODOC_CEDULA, SCOB_PK_CONSTANTES.C_COD_SUBTIPODOC_ESQUELA, SCOB_PK_CONSTANTES.C_COD_SUBTIPODOC_CED_REC)
           AND TO_NUMBER(EXDO.STATUS_SERVICIO) = 1;
    
        PI_N_ERROR     := 0;
        PO_N_COD_ERROR := PI_N_ERROR;
    
        IF I_EXISTE > 0 THEN
            --SE DEBE REALIZAR INTEGRACION CON STD
            --DEBE INGRESAR A LA INTERFAZ CON TRAMITE DOCUMENTARIO
            I_FLG_TRAMITE := 1;
            USR_SICOB.SCOB_PK_STD_INTERFAZ.SCOB_SP_S_INTERFAZ_STD_EXPED(PI_N_ERROR, PI_N_ERROR, PI_V_ERROR);
        
            --PI_N_ERROR := -1;
            IF PI_N_ERROR < 0 THEN
                --SE PRODUJO UN ERROR CON LA INTERFAZ DE TRAMITE DOCUMENTARIO
                PO_N_COD_ERROR := PI_N_ERROR;
                PO_V_MSJ_ERROR := 'No se generaron los documentos en el STD. Detalle del Error: ' || PI_V_ERROR;
                I_FLG_TRAMITE  := 0;
            
                --REGISTRA EL LOG DE LOS DOCUMENTOS GENERADOS SIN REPLICARSE EN EL STD.
                SCOB_SP_I_GRABA_LOG_STD(PI_N_ID_EXPEDIENTE,
                                        PI_N_COD_GENERADOR_DOCUMENTO,
                                        PI_I_TIPO_EVENTO,
                                        PI_N_ID_TIPO_EVENTO,
                                        PI_N_ERROR,
                                        PI_N_ERROR,
                                        PI_V_ERROR);
            
            END IF;
        END IF;
    
        --------------------------------------------------------------------------------------------
    
        OPEN PO_CU_RETORNO FOR
            SELECT ETIQ.ID_EXPEDIENTE_DOCUMENTO,
                   ETIQ.ID_MULTA,
                   ETIQ.NOM_ARCH_PLANTILLA,
                   ETIQ.NOM_ARCH_A_GENERAR,
                   ETIQ.COD_SUBTIPO_DOCUMENTO,
                   ETIQ.FEC_GENERACION_DOC,
                   --TO_CHAR(TO_DATE(ETIQ.FEC_GENERACION_DOC),'DD/MM/RR') AS FEC_GENERACION_DOC_COMPLETO,
                   TO_CHAR(TO_DATE(ETIQ.FEC_GENERACION_DOC, 'DD/MM/YYYY'), 'fmday dd "de" month "de" yyyy', 'nls_date_language=spanish') AS FEC_GENERACION_DOC_COMPLETO,
                   --TO_CHAR(SYSDATE,'FMday dd "de" month "de" yyyy','nls_date_language=spanish') AS FEC_GENERACION_DOC_COMPLETO,
                   ETIQ.NRO_DOCUMENTO,
                   ETIQ.NRO_RESOLUCION_DOC,
                   ETIQ.SIGLA_AEC,
                   --ETIQ.IMPORTE_UIT,
                   DECODE(NVL(ETIQ.IMPORTE_UIT, '0'), '0', '0', TRIM(TO_CHAR(NVL(ETIQ.IMPORTE_UIT, '0'), '999999999.99'))) AS IMPORTE_UIT,
                   REPLACE(ETIQ.NOM_SANCIONADO_TODOS, CHR(38), CHR(38) || 'amp;') AS NOM_SANCIONADO_TODOS,
                   ETIQ.DES_TIPO_DOC_SANC_TODOS,
                   ETIQ.NRO_DOC_SANC_TODOS,
                   REPLACE(ETIQ.NOM_SANCIONADO, CHR(38), CHR(38) || 'amp;') AS NOM_SANCIONADO,
                   ETIQ.TIPO_DOC_SANC_PRINCIPAL,
                   ETIQ.NRO_DOC_SANC_PRINCIPAL,
                   ETIQ.NOM_CARGO_JEFE_AEC,
                   REPLACE(ETIQ.NOM_SECRETARIO_TEC, CHR(38), CHR(38) || 'amp;') AS NOM_SECRETARIO_TEC,
                   ETIQ.NOM_CARGO_SECRETARIO_TEC,
                   REPLACE(ETIQ.NOM_OR_MULTA, CHR(38), CHR(38) || 'amp;') AS NOM_OR_MULTA,
                   REPLACE(ETIQ.NOM_JEFE_AEC, CHR(38), CHR(38) || 'amp;') AS NOM_JEFE_AEC,
                   ETIQ.NRO_FILE,
                   ETIQ.SIGLA_NOM_JEFE_AEC,
                   ETIQ.NRO_CUM,
                   ETIQ.NRO_SEC,
                   ETIQ.NRO_RESOLUCION_OR,
                   ETIQ.NRO_EXPED_ADMIN_MULTA,
                   ETIQ.SIGLA_NOM_USUARIO_GEN_DOC,
                   ETIQ.AEC_ANEXO_TELEFONO,
                   ETIQ.AEC_NOMBRE,
                   ETIQ.AEC_TELEFONO,
                   ETIQ.NRO_EXPED_ANTIGUO_MULTA,
                   ETIQ.VALOR_UIT,
                   ETIQ.NRO_EXPEDIENTE,
                   REPLACE(ETIQ.NOM_SANCIONADO_DOC, CHR(38), CHR(38) || 'amp;') AS NOM_SANCIONADO_DOC,
                   ETIQ.NRO_DOC_IDENTIDAD,
                   ETIQ.TIPO_DOC_IDENTIDAD,
                   REPLACE(ETIQ.DOMICILIO_SANCIONADO, CHR(38), CHR(38) || 'amp;') AS DOMICILIO_SANCIONADO,
                   REPLACE(ETIQ.DOMICILIO_FISCAL, CHR(38), CHR(38) || 'amp;') AS DOMICILIO_FISCAL,
                   REPLACE(ETIQ.DOMICILIO_PROCESAL, CHR(38), CHR(38) || 'amp;') AS DOMICILIO_PROCESAL,
                   
                   --TRIM(TO_CHAR(NVL(ETIQ.MONTO_CAPITAL,'0'),'999999999.99')) AS MONTO_CAPITAL,
                   DECODE(NVL(ETIQ.MONTO_CAPITAL, '0'), '0', '0', TRIM(TO_CHAR(NVL(ETIQ.MONTO_CAPITAL, '0'), '999999999.99'))) AS MONTO_CAPITAL,
                   
                   --TRIM(TO_CHAR(NVL(ETIQ.MONTO_IC,'0'),'999999999.99')) AS MONTO_IC,
                   DECODE(NVL(ETIQ.MONTO_IC, '0'), '0', '0', TRIM(TO_CHAR(NVL(ETIQ.MONTO_IC, '0'), '999999999.99'))) AS MONTO_IC,
                   
                   --TRIM(TO_CHAR(NVL(ETIQ.MONTO_IM,'0'),'999999999.99')) AS MONTO_IM,
                   DECODE(NVL(ETIQ.MONTO_IM, '0'), '0', '0', TRIM(TO_CHAR(NVL(ETIQ.MONTO_IM, '0'), '999999999.99'))) AS MONTO_IM,
                   
                   --TRIM(TO_CHAR(NVL(ETIQ.MONTO_COSTAS,'0'),'999999999.99')) AS MONTO_COSTAS,
                   DECODE(NVL(ETIQ.MONTO_COSTAS, '0'), '0', '0', TRIM(TO_CHAR(NVL(ETIQ.MONTO_COSTAS, '0'), '999999999.99'))) AS MONTO_COSTAS,
                   
                   --TRIM(TO_CHAR(NVL(ETIQ.MONTO_TOTAL,'0'),'999999999.99')) AS MONTO_TOTAL,
                   DECODE(NVL(ETIQ.MONTO_TOTAL, '0'), '0', '0', TRIM(TO_CHAR(NVL(ETIQ.MONTO_TOTAL, '0'), '999999999.99'))) AS MONTO_TOTAL,
                   
                   --TRIM(TO_CHAR(NVL(ETIQ.MONTO_AMORT_CAPITAL,'0'),'999999999.99')) AS MONTO_AMORT_CAPITAL,
                   DECODE(NVL(ETIQ.MONTO_AMORT_CAPITAL, '0'),
                          '0',
                          ETIQ.MONTO_AMORT_CAPITAL,
                          TRIM(TO_CHAR(NVL(ETIQ.MONTO_AMORT_CAPITAL, '0'), '999999999.99'))) AS MONTO_AMORT_CAPITAL,
                   
                   --TRIM(TO_CHAR(NVL(ETIQ.SALDO_CAPITAL,'0'),'999999999.99')) AS SALDO_CAPITAL,
                   DECODE(NVL(ETIQ.SALDO_CAPITAL, '0'), '0', '0', TRIM(TO_CHAR(NVL(ETIQ.SALDO_CAPITAL, '0'), '999999999.99'))) AS SALDO_CAPITAL,
                   
                   --TRIM(TO_CHAR(NVL(ETIQ.SALDO_IC,'0'),'999999999.99')) AS SALDO_IC,
                   DECODE(NVL(ETIQ.SALDO_IC, '0'), '0', '0', TRIM(TO_CHAR(NVL(ETIQ.SALDO_IC, '0'), '999999999.99'))) AS SALDO_IC,
                   
                   --TRIM(TO_CHAR(NVL(ETIQ.SALDO_IM,'0'),'999999999.99')) AS SALDO_IM,
                   DECODE(NVL(ETIQ.SALDO_IM, '0'), '0', '0', TRIM(TO_CHAR(NVL(ETIQ.SALDO_IM, '0'), '999999999.99'))) AS SALDO_IM,
                   
                   --TRIM(TO_CHAR(NVL(ETIQ.SALDO_COSTAS,'0'),'999999999.99')) AS SALDO_COSTAS,
                   DECODE(NVL(ETIQ.SALDO_COSTAS, '0'), '0', '0', TRIM(TO_CHAR(NVL(ETIQ.SALDO_COSTAS, '0'), '999999999.99'))) AS SALDO_COSTAS,
                   
                   --TRIM(TO_CHAR(NVL(ETIQ.SALDO_TOTAL,'0'),'999999999.99')) AS SALDO_TOTAL,
                   DECODE(NVL(ETIQ.SALDO_TOTAL, '0'), '0', '0', TRIM(TO_CHAR(NVL(ETIQ.SALDO_TOTAL, '0'), '999999999.99'))) AS SALDO_TOTAL,
                   
                   --TRIM(TO_CHAR(NVL(ETIQ.COSTAS_PROYECTADAS,'0'),'999999999.99')) AS COSTAS_PROYECTADAS,
                   DECODE(NVL(ETIQ.COSTAS_PROYECTADAS, '0'), '0', '0', TRIM(TO_CHAR(NVL(ETIQ.COSTAS_PROYECTADAS, '0'), '999999999.99'))) AS COSTAS_PROYECTADAS,
                   
                   ETIQ.NRO_CARTA_FIANZA,
                   REPLACE(ETIQ.NOM_BANCO, CHR(38), CHR(38) || 'amp;') AS NOM_BANCO,
                   REPLACE(ETIQ.DIRECCION_BANCO, CHR(38), CHR(38) || 'amp;') AS DIRECCION_BANCO,
                   --TRIM(TO_CHAR(NVL(ETIQ.MONTO_SOLES_RETENCION,'0'),'999999999.99')) AS MONTO_SOLES_RETENCION,
                   DECODE(NVL(ETIQ.MONTO_SOLES_RETENCION, '0'), '0', '0', TRIM(TO_CHAR(NVL(ETIQ.MONTO_SOLES_RETENCION, '0'), '999999999.99'))) AS MONTO_SOLES_RETENCION,
                   
                   --TRIM(TO_CHAR(NVL(ETIQ.MONTO_USD_RETENCION,'0'),'999999999.99')) AS MONTO_USD_RETENCION,
                   DECODE(NVL(ETIQ.MONTO_USD_RETENCION, '0'), '0', '0', TRIM(TO_CHAR(NVL(ETIQ.MONTO_USD_RETENCION, '0'), '999999999.99'))) AS MONTO_USD_RETENCION,
                   
                   REPLACE(ETIQ.NOM_BANCO_RETENEDOR, CHR(38), CHR(38) || 'amp;') AS NOM_BANCO_RETENEDOR,
                   ETIQ.FEC_RECEPCION_SOLICITUD,
                   
                   --TRIM(TO_CHAR(NVL(ETIQ.TOTAL_REQUERIDO,'0'),'999999999.99')) AS TOTAL_REQUERIDO,
                   DECODE(NVL(ETIQ.TOTAL_REQUERIDO, '0'), '0', '0', TRIM(TO_CHAR(NVL(ETIQ.TOTAL_REQUERIDO, '0'), '999999999.99'))) AS TOTAL_REQUERIDO,
                   
                   ETIQ.NRO_CUOTAS_FRACCIONAR,
                   --TRIM(TO_CHAR(NVL(ETIQ.MONTO_FRACCIONAR,'0'),'999999999.99')) AS MONTO_FRACCIONAR,
                   DECODE(NVL(ETIQ.MONTO_FRACCIONAR, '0'), '0', '0', TRIM(TO_CHAR(NVL(ETIQ.MONTO_FRACCIONAR, '0'), '999999999.99'))) AS MONTO_FRACCIONAR,
                   
                   --TRIM(TO_CHAR(NVL(ETIQ.TOTAL_EMBARGO,'0'),'999999999.99')) AS TOTAL_EMBARGO,
                   DECODE(NVL(ETIQ.TOTAL_EMBARGO, '0'), '0', '0', TRIM(TO_CHAR(NVL(ETIQ.TOTAL_EMBARGO, '0'), '999999999.99'))) AS TOTAL_EMBARGO,
                   
                   REPLACE(ETIQ.DIRECCION_BANCO_RETENEDOR, CHR(38), CHR(38) || 'amp;') AS DIRECCION_BANCO_RETENEDOR,
                   --TRIM(TO_CHAR(NVL(ETIQ.TOTAL_REDUCIR,'0'),'999999999.99')) AS TOTAL_REDUCIR,
                   DECODE(NVL(ETIQ.TOTAL_REDUCIR, '0'), '0', '0', TRIM(TO_CHAR(NVL(ETIQ.TOTAL_REDUCIR, '0'), '999999999.99'))) AS TOTAL_REDUCIR,
                   
                   ETIQ.NRO_DOC_REC,
                   ETIQ.FEC_RETENCION_INDECOPI,
                   --TRIM(TO_CHAR(NVL(ETIQ.MONTO_INFORMADO_SOLES,'0'),'999999999.99')) AS MONTO_INFORMADO_SOLES,
                   DECODE(NVL(ETIQ.MONTO_INFORMADO_SOLES, '0'), '0', '0', TRIM(TO_CHAR(NVL(ETIQ.MONTO_INFORMADO_SOLES, '0'), '999999999.99'))) AS MONTO_INFORMADO_SOLES,
                   
                   --TRIM(TO_CHAR(NVL(ETIQ.MONTO_INFORMADO_DOLARES,'0'),'999999999.99')) AS MONTO_INFORMADO_DOLARES,
                   DECODE(NVL(ETIQ.MONTO_INFORMADO_DOLARES, '0'), '0', '0', TRIM(TO_CHAR(NVL(ETIQ.MONTO_INFORMADO_DOLARES, '0'), '999999999.99'))) AS MONTO_INFORMADO_DOLARES,
                   
                   ETIQ.ID_EXPEDIENTE,
                   (CASE
                       WHEN I_FLG_TRAMITE = 1 AND
                            ETIQ.COD_SUBTIPO_DOCUMENTO IN (SCOB_PK_CONSTANTES.C_COD_SUBTIPODOC_CEDULA,
                                                           SCOB_PK_CONSTANTES.C_COD_SUBTIPODOC_ESQUELA,
                                                           SCOB_PK_CONSTANTES.C_COD_SUBTIPODOC_CED_REC) THEN
                       --@0002:Ini
                       --SUBSTR(ETIQ.NRO_EXPEDIENTE,1,4)||'-'||
                       -- ini jcarrion@20170831
                       -- '*' || EXDO.VC_ANIO || '-' ||  ETIQ.SIGLA_AEC || '-N' || LPAD(EXDO.NU_NRO_NOTIFICACION, 7, '000000') || '*' --@0002:Fin
                        '*' || EXDO.VC_ANIO || '-' ||  ETIQ.SIGLA_AEC || '-N' || LPAD(EXDO.NU_NRO_NOTIFICACION, 6, '000000') || '*'
                        --fin jcarrion@20170831
                       ELSE
                        NULL
                   END) NU_NRO_NOTIFICACION,
                   --,'2012-'||ETIQ.SIGLA_AEC||'N'||TO_CHAR(ROWNUM) AS NU_NRO_NOTIFICACION
                   
                   ETIQ.NRO_OFICIO_SUNAT_CODIGO,
                   ETIQ.NRO_OFICIO_SUNAT_ANIO,
                   ETIQ.NRO_OFICIO_SUNAT_PREFIJO,
                   ETIQ.NRO_OFICIO_SUNAT_CORRELATIVO,
                   ETIQ.NRO_LIQUIDACION_CODIGO,
                   ETIQ.NRO_LIQUIDACION_ANIO,
                   ETIQ.NRO_LIQUIDACION_CORRELATIVO,
                   ETIQ.NRO_DUA_CODIGO,
                   ETIQ.NRO_DUA_ANIO,
                   ETIQ.NRO_DUA_CORRELATIVO,
                   ETIQ.TIPO_CAMBIO_ADUMP AS TIPO_CAMBIO,
                   ETIQ.MONTO_ANTIDUMPING,
                   ETIQ.DESC_PARTIDA,
                   ETIQ.DESC_INTENDENCIA,
                   ETIQ.DESC_SUBMATERIA,
                   ETIQ.FEC_RESOLUCION,
                   ETIQ.FEC_NOTIFICACION,
                   ETIQ.NOM_SEDE,
                   SCOB_PK_GENERAR_DOCUMENTO.SCOB_FN_ETIQ_DOC_DESACUM(ETIQ.ID_EXPEDIENTE, 'CUM_DESACUM') AS CUM_DESACUM,
                   SCOB_PK_GENERAR_DOCUMENTO.SCOB_FN_ETIQ_DOC_DESACUM(ETIQ.ID_EXPEDIENTE, 'EXP_DESACUM') AS EXP_DESACUM
              FROM T_SCOB_TMP_GEN_DOC_EXPED ETIQ
             INNER JOIN T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
                ON EXDO.ID_EXPEDIENTE_DOCUMENTO = ETIQ.ID_EXPEDIENTE_DOCUMENTO;
        COMMIT;
        --
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
            --
    END;

    PROCEDURE SCOB_SP_S_DATOS_DOCUMENTO_GEN
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 30.05.2011
        -- Proposito    : consulta los datos de un documento en particular
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_N_ID_EXPEDIENTE_DOCUMENTO IN T_SCOB_EXPEDIENTE_DOCUMENTO.ID_EXPEDIENTE_DOCUMENTO%TYPE,
     PO_CU_RETORNO                OUT CU_REC_SET) AS
    BEGIN
        OPEN PO_CU_RETORNO FOR
            SELECT EXDO.ID_EXPEDIENTE_DOCUMENTO AS ID_EXPEDIENTE_DOCUMENTO,
                   EXDO.NRO_RESOLUCION AS NRO_RESOLUCION,
                   EXDO.NRO_DOCUMENTO AS NRO_DOCUMENTO,
                   EXDO.MONTO_COSTA AS MONTO_COSTA_GEN_DOC,
                   EXDO.FEC_NOTIFICACION AS FEC_NOTIFICACION,
                   EXDO.FEC_RESOLUCION_GAF AS FEC_RESOLUCION_GAF,
                   EXDO.NRO_RESOLUCION_GAF AS NRO_RESOLUCION_GAF,
                   NVL(EXDD.COD_TIPO_ENTIDAD, '0') AS COD_TIPO_ENTIDAD,
                   EBDO.COD_TIPO_ASOCIACION AS COD_TIPO_ASOCIACION,
                   TIDO.COD_SUBTIPO_DOCUMENTO AS COD_SUBTIPO_DOCUMENTO,
                   CASE
                       WHEN NVL(EXDD.COD_TIPO_ENTIDAD, 0) = SCOB_PK_CONSTANTES.C_COD_ENTIDAD_PERSONA THEN
                        DECODE(PERS.TIPO_PERSONA,
                               2,
                               PERS.RAZON_SOCIAL,
                               PERS.APE_PATERNO || ' ' || PERS.APE_MATERNO || ' ' || PERS.PRI_NOMBRE || ' ' || PERS.SEG_NOMBRE || ' ' ||
                               PERS.APE_CASADA)
                   
                       WHEN NVL(EXDD.COD_TIPO_ENTIDAD, 0) = SCOB_PK_CONSTANTES.C_COD_ENTIDAD_TASADOR THEN
                        DECODE(PERS.TIPO_PERSONA,
                               2,
                               PERS.RAZON_SOCIAL,
                               PERS.APE_PATERNO || ' ' || PERS.APE_MATERNO || ' ' || PERS.PRI_NOMBRE || ' ' || PERS.SEG_NOMBRE || ' ' ||
                               PERS.APE_CASADA)
                   
                       WHEN NVL(EXDD.COD_TIPO_ENTIDAD, 0) = SCOB_PK_CONSTANTES.C_COD_ENTIDAD_BANCO THEN
                        BANCO.NOMBRE
                   
                       WHEN NVL(EXDD.COD_TIPO_ENTIDAD, 0) = SCOB_PK_CONSTANTES.C_COD_ENTIDAD_SUNAT THEN
                        ENTIDAD.NOM_ENTIDAD
                   
                       WHEN NVL(EXDD.COD_TIPO_ENTIDAD, 0) = SCOB_PK_CONSTANTES.C_COD_ENTIDAD_SAT THEN
                        ENTIDAD.NOM_ENTIDAD
                   
                       WHEN NVL(EXDD.COD_TIPO_ENTIDAD, 0) = SCOB_PK_CONSTANTES.C_COD_ENTIDAD_PNP THEN
                        ENTIDAD.NOM_ENTIDAD
                   
                   --WHEN NVL(EXDD.COD_TIPO_ENTIDAD,0) = SCOB_PK_CONSTANTES.C_COD_ENTIDAD_CAJA_METRO THEN
                   --     ENTIDAD.NOM_ENTIDAD
                       WHEN NVL(EXDD.COD_TIPO_ENTIDAD, 0) = SCOB_PK_CONSTANTES.C_COD_ENTIDAD_SUNARP THEN
                        ENTIDAD.NOM_ENTIDAD
                   
                       ELSE
                        NULL
                   
                   END AS NOM_ENVIADO_A,
                   
                   CASE
                       WHEN NVL(EXDD.COD_TIPO_ENTIDAD, 0) = SCOB_PK_CONSTANTES.C_COD_ENTIDAD_PERSONA THEN
                        PERS.ID_PERSONA
                   
                       WHEN NVL(EXDD.COD_TIPO_ENTIDAD, 0) = SCOB_PK_CONSTANTES.C_COD_ENTIDAD_TASADOR THEN
                        PERS.ID_PERSONA
                   
                       WHEN NVL(EXDD.COD_TIPO_ENTIDAD, 0) = SCOB_PK_CONSTANTES.C_COD_ENTIDAD_BANCO THEN
                        BANCO.ID_ENTIDAD_FINANCIERA
                   
                       WHEN NVL(EXDD.COD_TIPO_ENTIDAD, 0) = SCOB_PK_CONSTANTES.C_COD_ENTIDAD_SUNAT THEN
                        ENTIDAD.ID_ENTIDAD_ESTATAL
                   
                       WHEN NVL(EXDD.COD_TIPO_ENTIDAD, 0) = SCOB_PK_CONSTANTES.C_COD_ENTIDAD_SAT THEN
                        ENTIDAD.ID_ENTIDAD_ESTATAL
                   
                       WHEN NVL(EXDD.COD_TIPO_ENTIDAD, 0) = SCOB_PK_CONSTANTES.C_COD_ENTIDAD_PNP THEN
                        ENTIDAD.ID_ENTIDAD_ESTATAL
                   
                   --WHEN NVL(EXDD.COD_TIPO_ENTIDAD,0) = SCOB_PK_CONSTANTES.C_COD_ENTIDAD_CAJA_METRO THEN
                   --     ENTIDAD.ID_ENTIDAD_ESTATAL
                   
                       WHEN NVL(EXDD.COD_TIPO_ENTIDAD, 0) = SCOB_PK_CONSTANTES.C_COD_ENTIDAD_SUNARP THEN
                        ENTIDAD.ID_ENTIDAD_ESTATAL
                   
                       ELSE
                        NULL
                   
                   END AS ID_ENVIADO_A,
                   
                   CASE
                       WHEN NVL(EXDD.COD_TIPO_ENTIDAD, 0) = SCOB_PK_CONSTANTES.C_COD_ENTIDAD_PERSONA THEN
                        PDOM.ID_PERSONA_DOMICILIO
                   
                       WHEN NVL(EXDD.COD_TIPO_ENTIDAD, 0) = SCOB_PK_CONSTANTES.C_COD_ENTIDAD_TASADOR THEN
                        PDOM.ID_PERSONA_DOMICILIO
                   
                       ELSE
                        NULL
                   
                   END AS ID_DIREC_PERS_ENVIADO_A
            
              FROM T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
            
             INNER JOIN T_SCOB_EXPEDIENTE EXPE
                ON EXPE.ID_EXPEDIENTE = EXDO.ID_EXPEDIENTE
             INNER JOIN T_SCOB_EXPED_EMBARGO_DOC EBDO
                ON EBDO.ID_EXPEDIENTE_DOCUMENTO = EXDO.ID_EXPEDIENTE_DOCUMENTO
              LEFT JOIN T_SCOB_EXPED_DOCUMENTO_DIREC EXDD
                ON EXDD.ID_EXPEDIENTE_DOCUMENTO = EXDO.ID_EXPEDIENTE_DOCUMENTO
              LEFT JOIN T_SCOB_TIPO_DOCUMENTO TIDO
                ON TIDO.ID_TIPO_DOCUMENTO = EXDO.ID_TIPO_DOCUMENTO
            
              LEFT JOIN T_SCOB_PERSONA PERS
                ON PERS.ID_PERSONA = CASE
                       WHEN EXDD.COD_TIPO_ENTIDAD = SCOB_PK_CONSTANTES.C_COD_ENTIDAD_PERSONA THEN
                        EXDD.ID_ENTIDAD
                       WHEN EXDD.COD_TIPO_ENTIDAD = SCOB_PK_CONSTANTES.C_COD_ENTIDAD_TASADOR THEN
                        EXDD.ID_ENTIDAD
                       ELSE
                        0
                   END
              LEFT JOIN T_SCOB_PERSONA_DOMICILIO PDOM
                ON PDOM.ID_PERSONA_DOMICILIO = CASE
                       WHEN EXDD.COD_TIPO_ENTIDAD = SCOB_PK_CONSTANTES.C_COD_ENTIDAD_PERSONA THEN
                        EXDD.ID_DOMICILIO
                       WHEN EXDD.COD_TIPO_ENTIDAD = SCOB_PK_CONSTANTES.C_COD_ENTIDAD_TASADOR THEN
                        EXDD.ID_DOMICILIO
                       ELSE
                        0
                   END
              LEFT JOIN T_SCOB_ENTIDAD_FINANCIERA BANCO
                ON BANCO.ID_ENTIDAD_FINANCIERA = CASE
                       WHEN EXDD.COD_TIPO_ENTIDAD = SCOB_PK_CONSTANTES.C_COD_ENTIDAD_BANCO THEN
                        EXDD.ID_ENTIDAD
                       ELSE
                        0
                   END
              LEFT JOIN T_SCOB_ENTIDAD_ESTATAL ENTIDAD
                ON ENTIDAD.COD_TIPO_ENTIDAD = EXDD.COD_TIPO_ENTIDAD
               AND ENTIDAD.ID_ENTIDAD_ESTATAL = CASE
                       WHEN EXDD.COD_TIPO_ENTIDAD = SCOB_PK_CONSTANTES.C_COD_ENTIDAD_PERSONA THEN
                        NULL
                       WHEN EXDD.COD_TIPO_ENTIDAD = SCOB_PK_CONSTANTES.C_COD_ENTIDAD_BANCO THEN
                        NULL
                       WHEN EXDD.COD_TIPO_ENTIDAD = SCOB_PK_CONSTANTES.C_COD_ENTIDAD_TASADOR THEN
                        NULL
                       ELSE
                        EXDD.ID_ENTIDAD
                   END
            
             WHERE EXDO.ID_EXPEDIENTE_DOCUMENTO = PI_N_ID_EXPEDIENTE_DOCUMENTO;
    
    END;

    PROCEDURE SCOB_SP_I_GENERA_DOC_MULTA
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 31.05.2011
        -- Proposito    : insertar los documentos plantillas generados por el sistema en multa OR
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_N_ID_MULTA               IN T_SCOB_MULTA_DOCUMENTO_GEN.ID_MULTA%TYPE,
     PI_N_ID_MULTA_DETAL         IN T_SCOB_MULTA_DOCUMENTO_GEN.ID_MULTA_DETAL%TYPE,
     PI_N_ID_MULTA_IMPROCEDENCIA IN T_SCOB_MULTA_DOCUMENTO_GEN.ID_MULTA_IMPROCEDENCIA%TYPE,
     --
     PI_V_ID_PLANTILLA     IN VARCHAR2, --CADENA DE PLANTILLAS (EL PRIMERO SIEMPRE DEBE SER LA RESOLUCION, SI ES EL CASO)
     PI_V_MOTIVO_PLANTILLA IN VARCHAR2, --CADENA DE MOTIVOS PLANTILLAS (EL PRIMERO SIEMPRE DEBE SER LA RESOLUCION, SI ES EL CASO)
     PI_N_NRO_ITEMSP       IN NUMBER, --SI SE ENVIAN DOS DOCUMENTO, SIEMPRE DEBE ESTAR LA REC PRIMERO.
     --
     PI_I_ESTADO_MULTA IN T_SCOB_MULTA_DOCUMENTO_GEN.ESTADO_MULTA%TYPE,
     --
     PI_N_ID_TIPO_DOC_ASOC IN INTEGER,
     PI_N_ID_SERVICIO      IN NUMBER,
     PI_V_ID_TIPO_SERVICIO IN VARCHAR2,
     PI_C_FLG_UCI          IN CHAR,
     PI_C_FEC_GENERACION   IN CHAR,
     --
     PI_V_AUDUSUCREACION     IN T_SCOB_EXPEDIENTE_DOCUMENTO.AUDUSUCREACION%TYPE,
     PI_N_ID_USUARIO_INGRESO IN T_SCOB_USUARIO.ID_USUARIO%TYPE,
     PI_C_FLG_COMMIT         IN CHAR,
     --
     PO_N_RETORNO   OUT NUMBER,
     PO_N_COD_ERROR OUT NUMBER,
     PO_V_MSJ_ERROR OUT VARCHAR2) IS
        N_ID_MULTA_DOCUMENTO_OUT T_SCOB_MULTA_DOCUMENTO_GEN.ID_MULTA_DOCUMENTO_GEN%TYPE;
        N_GENERADOR_DOCUMENTO    NUMBER;
    
        N_CONTP INTEGER;
    
        V_MOTIVO_PLANTILLA VARCHAR2(50);
        V_PLANTILLA        VARCHAR2(50);
    
        V_COD_TIPO_PLAN         T_SCOB_PLANTILLA.COD_INTERNO%TYPE;
        V_COD_TIPO_PLAN_INTERNO T_SCOB_PLANTILLA.COD_INTERNO%TYPE;
        V_COD_TIPO_DOC          T_SCOB_PLANTILLA.COD_INTERNO%TYPE;
        I_COD_SUBTIPO_DOC       INTEGER;
        N_ID_TIPO_DOC           T_SCOB_TIPO_DOCUMENTO.ID_TIPO_DOCUMENTO%TYPE;
        N_ID_TIPO_DOC_RES       INTEGER;
        I_NRO_REGLA             INTEGER;
    
    BEGIN
        PO_V_MSJ_ERROR := '';
        PO_N_RETORNO   := 0;
        PO_N_COD_ERROR := -1;
    
        SELECT SCOB_SQ_GENERADOR_DOCUMENTO.NEXTVAL INTO N_GENERADOR_DOCUMENTO FROM DUAL;
    
        --obtener la plantilla
        N_CONTP := 1;
        WHILE (N_CONTP <= PI_N_NRO_ITEMSP)
        LOOP
        
            SCOB_PK_UTILITARIO.SCOB_SP_S_SPLIT(PI_V_ID_PLANTILLA, '|', N_CONTP + 1, V_PLANTILLA);
            SCOB_PK_UTILITARIO.SCOB_SP_S_SPLIT(PI_V_MOTIVO_PLANTILLA, '|', N_CONTP + 1, V_MOTIVO_PLANTILLA);
        
            IF V_MOTIVO_PLANTILLA = '#' THEN
                EXIT;
            END IF;
        
            --obtener el tipo de documento de la plantilla, tipo de documento y generador de numeracion
            SELECT TRIM(PLNT.CODIGO) AS COD_TIPO_PLANTILLA,
                   TRIM(PLNT.COD_INTERNO) AS COD_TIPO_PLANTILLA_INTERNO,
                   TRIM(TIP_DOC.COD_TIPO_DOCUMENTO) AS COD_TIPO_DOCUMENTO,
                   TIP_DOC.ID_TIPO_DOCUMENTO AS ID_TIPO_DOC,
                   TIP_DOC.COD_SUBTIPO_DOCUMENTO AS ID_SUBTIPO_DOC,
                   TO_NUMBER(REGL.TXT_VALOR1) AS NRO_REGLA,
                   NVL(TIP_DOC.ID_TIPO_DOCUMENTO_RESOLUCION, 0) AS ID_TIPO_DOCUMENTO_RESOLUCION
              INTO V_COD_TIPO_PLAN,
                   V_COD_TIPO_PLAN_INTERNO,
                   V_COD_TIPO_DOC,
                   N_ID_TIPO_DOC,
                   I_COD_SUBTIPO_DOC,
                   I_NRO_REGLA,
                   N_ID_TIPO_DOC_RES
              FROM T_SCOB_PLANTILLA PLNT
             INNER JOIN T_SCOB_TIPO_DOCUMENTO TIP_DOC
                ON TIP_DOC.ID_TIPO_DOCUMENTO = PLNT.ID_TIPO_DOCUMENTO
             INNER JOIN T_SCOB_TABLA_DET REGL
                ON REGL.ID_TABLA = SCOB_PK_CONSTANTES.C_TBL_SUB_TIPO_DOCUMENTO
               AND TO_NUMBER(REGL.COD_INTERNO) = TO_NUMBER(TIP_DOC.COD_SUBTIPO_DOCUMENTO)
             WHERE PLNT.ID_PLANTILLA = TO_NUMBER(V_PLANTILLA);
        
            --inserta el documento
            SCOB_SP_I_DOCUMENTO_MULTA(N_GENERADOR_DOCUMENTO,
                                      PI_N_ID_MULTA,
                                      PI_N_ID_MULTA_DETAL,
                                      PI_N_ID_MULTA_IMPROCEDENCIA,
                                      PI_I_ESTADO_MULTA,
                                      TO_NUMBER(V_PLANTILLA),
                                      TO_NUMBER(V_MOTIVO_PLANTILLA),
                                      V_COD_TIPO_PLAN,
                                      V_COD_TIPO_DOC,
                                      N_ID_TIPO_DOC,
                                      I_COD_SUBTIPO_DOC,
                                      I_NRO_REGLA,
                                      PI_N_ID_TIPO_DOC_ASOC,
                                      PI_N_ID_SERVICIO,
                                      PI_V_ID_TIPO_SERVICIO,
                                      PI_C_FLG_UCI,
                                      PI_C_FEC_GENERACION,
                                      PI_V_AUDUSUCREACION,
                                      PI_N_ID_USUARIO_INGRESO,
                                      N_ID_MULTA_DOCUMENTO_OUT,
                                      PO_N_COD_ERROR,
                                      PO_V_MSJ_ERROR);
        
            IF PO_N_COD_ERROR < 0 THEN
                ROLLBACK;
                RETURN;
            END IF;
        
            N_CONTP := N_CONTP + 1;
        END LOOP;
    
        PO_N_COD_ERROR := 0;
        PO_N_RETORNO   := N_GENERADOR_DOCUMENTO;
    
        IF PI_C_FLG_COMMIT = '1' THEN
            COMMIT;
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

    PROCEDURE SCOB_SP_I_DOCUMENTO_MULTA
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 31.05.2011
        -- Proposito    : inserta documentos segun tipo para multas
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_N_GENERADOR_DOC          IN T_SCOB_MULTA_DOCUMENTO_GEN.COD_GENERADOR_DOCUMENTO%TYPE,
     PI_N_ID_MULTA               IN T_SCOB_MULTA_DOCUMENTO_GEN.ID_MULTA%TYPE,
     PI_N_ID_MULTA_DETAL         IN T_SCOB_MULTA_DOCUMENTO_GEN.ID_MULTA_DETAL%TYPE,
     PI_N_ID_MULTA_IMPROCEDENCIA IN T_SCOB_MULTA_DOCUMENTO_GEN.ID_MULTA_IMPROCEDENCIA%TYPE,
     PI_I_ESTADO_MULTA           IN T_SCOB_MULTA_DOCUMENTO_GEN.ESTADO_MULTA%TYPE,
     --
     PI_N_ID_PLANTILLA     IN T_SCOB_MULTA_DOCUMENTO_GEN.ID_PLANTILLA%TYPE,
     PI_N_MOTIVO_PLANTILLA IN T_SCOB_MULTA_DOCUMENTO_GEN.ID_MOTIVO_PLANTILLA%TYPE,
     PI_V_COD_TIPO_PLAN    IN VARCHAR2,
     PI_V_COD_TIPO_DOC     IN VARCHAR2,
     PI_N_ID_TIPO_DOC      IN T_SCOB_TIPO_DOCUMENTO.ID_TIPO_DOCUMENTO%TYPE,
     PI_I_COD_SUBTIPO_DOC  IN T_SCOB_TIPO_DOCUMENTO.COD_SUBTIPO_DOCUMENTO%TYPE,
     PI_I_NRO_REGLA        IN INTEGER,
     --
     PI_N_ID_TIPO_DOC_ASOC IN INTEGER,
     PI_N_ID_SERVICIO      IN NUMBER,
     PI_V_ID_TIPO_SERVICIO IN VARCHAR2,
     PI_C_FLG_UCI          IN CHAR,
     PI_C_FEC_GENERACION   IN CHAR,
     --
     PI_V_AUDUSUCREACION     IN T_SCOB_MULTA_DOCUMENTO_GEN.AUDUSUCREACION%TYPE,
     PI_N_ID_USUARIO_INGRESO IN T_SCOB_USUARIO.ID_USUARIO%TYPE,
     --
     PO_N_RETORNO   OUT NUMBER,
     PO_N_COD_ERROR OUT NUMBER,
     PO_V_MSJ_ERROR OUT VARCHAR2) IS
        N_ID_MULTA_DOCUMENTO_GEN T_SCOB_MULTA_DOCUMENTO_GEN.ID_MULTA_DOCUMENTO_GEN%TYPE;
        N_SEC_TIPO_DOC           NUMBER;
        V_SEC_TIPO_DOC           VARCHAR(5);
        V_ANIO                   CHAR(2);
        V_NRO_DOCUMENTO          T_SCOB_EXPEDIENTE_DOCUMENTO.NRO_DOCUMENTO%TYPE;
        V_NOMBRE                 T_SCOB_EXPEDIENTE_DOCUMENTO.NOMBRE%TYPE;
        --
    
    BEGIN
        PO_V_MSJ_ERROR := '';
        PO_N_RETORNO   := 0;
        PO_N_COD_ERROR := -1;
    
        --obtener ultimos digitos del a?o
        SELECT TO_CHAR(SYSDATE, 'YY') INTO V_ANIO FROM DUAL;
    
        --obtener el secuencial del subtipo de documento
        CASE TO_NUMBER(PI_I_COD_SUBTIPO_DOC)
            WHEN 8 THEN
                --memo
                SELECT SCOB_SQ_TIPO_DOC_MEM.NEXTVAL INTO N_SEC_TIPO_DOC FROM DUAL;
            ELSE
                PO_V_MSJ_ERROR := 'No se puede realizar la accion. Solo se pueden generar documentos del tipo MEMO.';
                PO_N_COD_ERROR := -10;
        END CASE;
    
        V_SEC_TIPO_DOC := LPAD(TO_CHAR(N_SEC_TIPO_DOC), 5, '00000');
        --generar el numero y nombre del archivo del documento
        CASE PI_I_NRO_REGLA
            WHEN 2 THEN
                V_NRO_DOCUMENTO := V_SEC_TIPO_DOC || '-' || V_ANIO;
                V_NOMBRE        := V_ANIO || V_SEC_TIPO_DOC || PI_V_COD_TIPO_DOC || PI_V_COD_TIPO_PLAN;
            ELSE
                PO_V_MSJ_ERROR := 'No se puede realizar la accion. Solo se pueden generar documentos del tipo MEMO.';
                PO_N_COD_ERROR := -11;
        END CASE;
    
        --insertar el documento
        SELECT SCOB_SQ_MULTA_DOCUMENTO_GEN.NEXTVAL INTO N_ID_MULTA_DOCUMENTO_GEN FROM DUAL;
        INSERT INTO T_SCOB_MULTA_DOCUMENTO_GEN
            (ID_MULTA_DOCUMENTO_GEN, ID_MULTA, ID_MULTA_DETAL, ID_MULTA_IMPROCEDENCIA, ID_PLANTILLA, ID_MOTIVO_PLANTILLA, NRO_DOCUMENTO, NOMBRE,
             TITULO, NRO_VERSION, TIPO_DOC_ASOC, ESTADO_MULTA, COD_GENERADOR_DOCUMENTO, ESTADO, AUDFECCREACION, AUDUSUCREACION, ID_TIPO_DOCUMENTO,
             ID_USUARIO_INGRESO, FEC_INGRESO, ID_SERVICIO, COD_SERVICIO, STATUS_SERVICIO)
        VALUES
            (N_ID_MULTA_DOCUMENTO_GEN, PI_N_ID_MULTA, PI_N_ID_MULTA_DETAL, DECODE(PI_N_ID_MULTA_IMPROCEDENCIA, 0, NULL, PI_N_ID_MULTA_IMPROCEDENCIA),
             PI_N_ID_PLANTILLA, PI_N_MOTIVO_PLANTILLA, V_NRO_DOCUMENTO, V_NOMBRE || '01',
              --AGREGA LA VERSION 01 POR DEFECTO
             V_NOMBRE,
              --TITULO (SIN VERSION DEL DOCUMENTO)
             '01',
              --NRO_VERSION
             PI_N_ID_TIPO_DOC_ASOC,
              --TIPO_DOC_ASOCIADO
             PI_I_ESTADO_MULTA, PI_N_GENERADOR_DOC, SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO, SYSDATE, PI_V_AUDUSUCREACION, PI_N_ID_TIPO_DOC,
             PI_N_ID_USUARIO_INGRESO, TO_DATE(PI_C_FEC_GENERACION, 'DD/MM/YYYY'), PI_N_ID_SERVICIO, PI_V_ID_TIPO_SERVICIO, PI_C_FLG_UCI);
    
        PO_N_COD_ERROR := 0;
        PO_N_RETORNO   := N_ID_MULTA_DOCUMENTO_GEN;
    
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

    PROCEDURE SCOB_SP_S_GEN_DOC_ETIQ_MULTA
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 09.12.2011
        -- Proposito    : reemplazar las etiquetas a reemplazar
                          de los documentos generados
                          por multas.
        -----------------------------------------------------------
        -- Modificacion :
        --@0001:2012.12.12:Actualizacion para considerar el caracter "&" al generar documentos en el modulo:Multa Cobranza.
        -----------------------------------------------------------
        */
    (PI_N_COD_GENERADOR_DOCUMENTO IN T_SCOB_EXPEDIENTE_DOCUMENTO.COD_GENERADOR_DOCUMENTO%TYPE,
     PO_CU_RETORNO_ETIQUETA       OUT CU_REC_SET,
     PO_CU_RETORNO                OUT CU_REC_SET) AS
        N_ID_MULTA_DETAL T_SCOB_MULTA_DETAL.ID_MULTA_DETAL%TYPE;
        V_NRO_EXPEDIENTE VARCHAR2(50);
    BEGIN
    
        OPEN PO_CU_RETORNO_ETIQUETA FOR
            SELECT TO_NUMBER(TD.COD_INTERNO) AS NRO_ETIQUETA,
                   TD.TXT_DESCRIPCION AS NOM_ETIQUETA
              FROM T_SCOB_TABLA_DET TD
             WHERE TD.ID_TABLA = SCOB_PK_CONSTANTES.C_TBL_ETIQUETA_PLANTILLA
               AND TO_NUMBER(TD.TXT_VALOR1) = 1
             ORDER BY TO_NUMBER(COD_INTERNO);
    
        --obtener otro expediente indicado como infructuoso
    
        --obtener la multa asociada
        SELECT MDET.ID_MULTA_DETAL
          INTO N_ID_MULTA_DETAL
          FROM T_SCOB_MULTA_DOCUMENTO_GEN MDOC
         INNER JOIN T_SCOB_MULTA_DETAL MDET
            ON MDET.ID_MULTA = MDOC.ID_MULTA
           AND MDET.FLG_ACTUAL = '1'
           AND MDET.ESTADO = '1'
         WHERE MDOC.COD_GENERADOR_DOCUMENTO = PI_N_COD_GENERADOR_DOCUMENTO;
    
        --obtener los expedientes con estado infructuoso de los sancionados asociados al documento generado.
        BEGIN
        
            SELECT TRIM(EXPEDIENTE.NRO_EXPED_INFRUCTUOSO)
              INTO V_NRO_EXPEDIENTE
              FROM (SELECT DISTINCT EXPE.ANIO || EXPE.NRO_EXPEDIENTE AS NRO_EXPED_INFRUCTUOSO
                      FROM T_SCOB_EXPEDIENTE EXPE
                     INNER JOIN T_SCOB_EXPEDIENTE_MULTA EXMU
                        ON EXMU.ID_EXPEDIENTE = EXPE.ID_EXPEDIENTE
                       AND EXMU.ESTADO = '1'
                     INNER JOIN T_SCOB_MULTA_DETAL MDET
                        ON MDET.ID_MULTA = EXMU.ID_MULTA
                       AND MDET.FLG_ACTUAL = '1'
                       AND MDET.ESTADO = '1'
                     INNER JOIN T_SCOB_MULTA_SANCIONADO MSAN
                        ON MSAN.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL
                       AND MSAN.ESTADO = '1'
                       AND MSAN.COD_TIPO_PERSONA = '1'
                       AND MSAN.ID_PERSONA IN (
                                               --obtener los sancionados de la multa
                                               SELECT ID_PERSONA
                                                 FROM T_SCOB_MULTA_SANCIONADO MSAN
                                                WHERE MSAN.ID_MULTA_DETAL = N_ID_MULTA_DETAL
                                                  AND MSAN.COD_TIPO_PERSONA = '1'
                                                  AND MSAN.ESTADO = '1')
                     WHERE EXPE.ESTADO = '1'
                       AND EXPE.ESTADO_EXPEDIENTE IN (SCOB_PK_CONSTANTES.C_TBL_EST_EXP_CONCLUIDO)
                       AND --concluido
                           EXPE.ID_MOTIVO IN (15) --sobreseido infructuoso
                     ORDER BY 1 DESC) EXPEDIENTE
             WHERE ROWNUM = 1;
        
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                V_NRO_EXPEDIENTE := ' ';
        END;
    
        OPEN PO_CU_RETORNO FOR
            SELECT PLANT.NOM_ARCHIVO AS NOM_ARCH_PLANTILLA,
                   MDOC.NOMBRE AS NOM_ARCH_A_GENERAR,
                   TO_CHAR(MDOC.FEC_INGRESO, 'DD/MM/YYYY') AS FEC_GENERACION_DOC,
                   MDOC.NRO_DOCUMENTO AS NRO_DOCUMENTO,
                   ACOB.SIGLAS_AEC AS SIGLA_AEC,
                   TO_CHAR(MULT.MONTO_UIT, '999999999999999.99') AS IMPORTE_UIT,
                   
                   --@0001:Ini
                   --SCOB_PK_EXPEDIENTE.SCOB_FN_SANCIONADOS_MULTA(MULT.ID_MULTA,0) AS NOM_SANCIONADO_TODOS,
                   REPLACE(SCOB_PK_EXPEDIENTE.SCOB_FN_SANCIONADOS_MULTA(MULT.ID_MULTA, 0), CHR(38), CHR(38) || 'amp;') AS NOM_SANCIONADO_TODOS,
                   --@0001:Fin
                   
                   ACOB.CARGO_JEFE_AEC AS NOM_CARGO_JEFE_AEC,
                   
                   --@0001:Ini
                   --USU_SEC.PRI_NOMBRE||' '||USU_SEC.SEG_NOMBRE||', '||USU_SEC.APE_PATERNO||' '||USU_SEC.APE_MATERNO||' '||USU_SEC.APE_CASADA  AS NOM_SECRETARIO_TEC,
                   REPLACE(USU_SEC.PRI_NOMBRE || ' ' || USU_SEC.SEG_NOMBRE || ', ' || USU_SEC.APE_PATERNO || ' ' || USU_SEC.APE_MATERNO || ' ' ||
                           USU_SEC.APE_CASADA,
                           CHR(38),
                           CHR(38) || 'amp;') AS NOM_SECRETARIO_TEC,
                   --@0001:Fin
                   
                   CARGO_USU_SEC.DESCRIPCION AS NOM_CARGO_SECRETARIO_TEC,
                   ORGR.DESCRIPCION          AS NOM_OR_MULTA,
                   
                   --@0001:Ini
                   --ACOB.NOM_JEFE_AEC AS NOM_JEFE_AEC,
                   REPLACE(ACOB.NOM_JEFE_AEC, CHR(38), CHR(38) || 'amp;') AS NOM_JEFE_AEC,
                   --@0001:Fin
                   
                   MULT.ANIO_FILE_AEC || ACOB.COD_AEC || MULT.NRO_FILE_AEC AS NRO_FILE,
                   SIGLAS_JEFE_AEC AS SIGLA_NOM_JEFE_AEC,
                   MULT.ANIO || MULT.CUM AS NRO_CUM,
                   MULT.ANIO || MULT.CUM || NVL(MULT.NRO_ULT_IMPROCEDENCIA, ' ') AS NRO_SEC,
                   MDET.NRO_RESOLUCION AS NRO_RESOLUCION_OR,
                   MDET.NRO_RESOLUCION AS NRO_RESOLUCION,
                   MDET.FEC_RESOLUCION AS FEC_RESOLUCION,
                   SEDE.DESCRIPCION AS NOM_SEDE,
                   MULT.NRO_EXP_ADMINISTRATIVO AS NRO_EXPED_ADMIN_MULTA,
                   TRIM(SUBSTR(USU_DOC.PRI_NOMBRE, 1, 1)) || TRIM(SUBSTR(USU_DOC.APE_PATERNO, 1, 1)) || TRIM(SUBSTR(USU_DOC.APE_MATERNO, 1, 1)) AS SIGLA_NOM_USUARIO_GEN_DOC,
                   ACOB.ANEXO_AEC AS AEC_ANEXO_TELEFONO,
                   ACOB.NOMBRE_AEC AS AEC_NOMBRE,
                   ACOB.TELEFONO_AEC AS AEC_TELEFONO,
                   MDET.NRO_EXP_NIVEL AS NRO_EXPED_ANTIGUO_MULTA,
                   TO_CHAR(MDET.VALOR_UIT, '999999999999999.99') AS VALOR_UIT,
                   V_NRO_EXPEDIENTE AS NRO_EXPED_INFRUCTUOSO,
                   NULL AS NU_NRO_NOTIFICACION,
                   
                   ---------------AGREGANDO ETIQUETAS ANTIDUNPING-----------------
                   MANTID.NRO_OFICIO_SUNAT_CODIGO,
                   MANTID.NRO_OFICIO_SUNAT_ANIO,
                   MANTID.NRO_OFICIO_SUNAT_PREFIJO,
                   MANTID.NRO_OFICIO_SUNAT_CORRELATIVO,
                   MANTID.NRO_LIQUIDACION_CODIGO,
                   MANTID.NRO_LIQUIDACION_ANIO,
                   MANTID.NRO_LIQUIDACION_CORRELATIVO,
                   MANTID.NRO_DUA_CODIGO,
                   MANTID.NRO_DUA_ANIO,
                   MANTID.NRO_DUA_CORRELATIVO,
                   MANTID.TIPO_CAMBIO,
                   MANTID.MONTO_ANTIDUMPING,
                   PARTIDA.DESCRIPCION                 AS DESC_PARTIDA,
                   INTENDE.DESCRIPCION                 AS DESC_INTENDENCIA,
                   SUBMAT.DESCRIPCION                  AS DESC_SUBMATERIA
            
              FROM T_SCOB_MULTA_DOCUMENTO_GEN MDOC
             INNER JOIN T_SCOB_MULTA MULT
                ON MULT.ID_MULTA = MDOC.ID_MULTA
             INNER JOIN T_SCOB_MULTA_DETAL MDET
                ON MDET.ID_MULTA = MULT.ID_MULTA
               AND MDET.FLG_ACTUAL = '1'
               AND MDET.ESTADO = '1'
              LEFT JOIN USR_SICOB.T_SCOB_SEDE SEDE
                ON SEDE.ID_SEDE = MULT.ID_SEDE
             INNER JOIN T_SCOB_USUARIO USU_SEC
                ON USU_SEC.ID_USUARIO = MDET.ID_USUARIO_SECRETARIO
             INNER JOIN T_SCOB_CARGO CARGO_USU_SEC
                ON CARGO_USU_SEC.ID_CARGO = USU_SEC.CARGO
             INNER JOIN T_SCOB_ORGANO_RESOLUTIVO ORGR
                ON ORGR.ID_ORGANO_RESOLUTIVO = MDET.ID_ORGANO_RESOLUTIVO
              LEFT JOIN T_SCOB_USUARIO USU_DOC
                ON USU_DOC.ID_USUARIO = MDOC.ID_USUARIO_INGRESO
              LEFT JOIN (SELECT ACOB.ID_AREA_COBRANZA AS ID_AREA_COBRANZA,
                                ACOB.DESCIPCION       AS NOMBRE_AEC,
                                ACOB.CODIGO           AS COD_AEC,
                                ACOB.SIGLAS           AS SIGLAS_AEC,
                                ACOB.TELEFONO         AS TELEFONO_AEC,
                                ACOB.ANEXO            AS ANEXO_AEC,
                                
                                --@0001:Ini
                                --USU_ACOB.APE_PATERNO||' '||USU_ACOB.APE_MATERNO||' '||USU_ACOB.APE_CASADA||' '||USU_ACOB.PRI_NOMBRE||' '||USU_ACOB.SEG_NOMBRE AS NOM_JEFE_AEC,
                                REPLACE(USU_ACOB.APE_PATERNO || ' ' || USU_ACOB.APE_MATERNO || ' ' || USU_ACOB.APE_CASADA || ' ' ||
                                        USU_ACOB.PRI_NOMBRE || ' ' || USU_ACOB.SEG_NOMBRE,
                                        CHR(38),
                                        CHR(38) || 'amp;') AS NOM_JEFE_AEC,
                                --@0001:Fin
                                
                                CARGO_ACOB.DESCRIPCION AS CARGO_JEFE_AEC,
                                TRIM(SUBSTR(USU_ACOB.PRI_NOMBRE, 1, 1)) || TRIM(SUBSTR(USU_ACOB.APE_PATERNO, 1, 1)) ||
                                TRIM(SUBSTR(USU_ACOB.APE_MATERNO, 1, 1)) AS SIGLAS_JEFE_AEC
                         
                           FROM T_SCOB_AREA_COBRANZA ACOB
                          INNER JOIN T_SCOB_USUARIO USU_ACOB
                             ON USU_ACOB.ESTADO = '1'
                            AND USU_ACOB.ID_AREA_COBRANZA = ACOB.ID_AREA_COBRANZA
                          INNER JOIN T_SCOB_CARGO CARGO_ACOB
                             ON CARGO_ACOB.ID_CARGO = USU_ACOB.CARGO
                            AND CARGO_ACOB.CODIGO = SCOB_PK_CONSTANTES.C_COD_CARGO_JEFE_AEC
                          WHERE ACOB.ESTADO = '1') ACOB
                ON ACOB.ID_AREA_COBRANZA = MULT.ID_AREA_COBRANZA
             INNER JOIN T_SCOB_PLANTILLA PLANT
                ON PLANT.ID_PLANTILLA = MDOC.ID_PLANTILLA
            
            ---------------------2016-11-09------------Etiquetas antidumping---------
              LEFT JOIN T_SCOB_MULTA_ANTIDUMPING MANTID
                ON MANTID.ID_MULTA = MULT.ID_MULTA
               AND MANTID.ESTADO = 1
            
              LEFT JOIN USR_SICOB.T_SCOB_PARTIDA PARTIDA
                ON PARTIDA.ID_PARTIDA = MANTID.ID_PARTIDA
               AND PARTIDA.ESTADO = 1
              LEFT JOIN USR_SICOB.T_SCOB_INTENDENCIA INTENDE
                ON INTENDE.ID_INTENDENCIA = MANTID.ID_INTENDENCIA
               AND INTENDE.ESTADO = 1
              LEFT JOIN USR_SICOB.T_SCOB_SUBMATERIA SUBMAT
                ON SUBMAT.ID_SUBMATERIA = MULT.ID_SUB_MATERIA
               AND SUBMAT.ESTADO = 1
            
             WHERE MDOC.COD_GENERADOR_DOCUMENTO = PI_N_COD_GENERADOR_DOCUMENTO
               AND ROWNUM = 1;
    
    END;

    PROCEDURE SCOB_SP_I_EXPED_DOC_TRAMITE
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 28/10/2011
        -- Proposito    : insertar los documentos plantillas generados por mero tramite.
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (
     /*01*/PI_C_IND_TIPO_GENERACION T_SCOB_EXPED_COACTIVO_DOC.IND_TIPO_GENERACION%TYPE,
     /* 2=Con un documento --enviar 2
                                               */
     /*02*/
     PI_V_ID_EXPEDIENTE IN VARCHAR2, --CADENA DE EXPEDIENTES
     /*03*/
     PI_N_NRO_ITEMS IN NUMBER,
     --
     /*04*/
     PI_N_ID_MOTIVO IN T_SCOB_EXPEDIENTE_ESTADO.ID_MOTIVO%TYPE,
     /*05*/
     PI_V_ID_PLANTILLA IN VARCHAR2, --CADENA DE PLANTILLAS (EL PRIMERO SIEMPRE DEBE SER LA RESOLUCION, SI ES EL CASO)
     /*06*/
     PI_V_MOTIVO_PLANTILLA IN VARCHAR2, --CADENA DE MOTIVOS PLANTILLAS (EL PRIMERO SIEMPRE DEBE SER LA RESOLUCION, SI ES EL CASO)
     /*07*/
     PI_N_NRO_ITEMSP IN NUMBER, --SI SE ENVIAN DOS DOCUMENTO, SIEMPRE DEBE ESTAR LA REC PRIMERO.
     --
     /*08*/
     PI_V_ID_COSTAS IN VARCHAR2,
     /*09*/
     PI_V_POR_COSTAS IN VARCHAR2,
     /*10*/
     PI_V_VAL_COSTAS IN VARCHAR2,
     /*11*/
     PI_V_CNT_COSTAS IN VARCHAR2,
     /*12*/
     PI_V_SUB_TOTAL_COSTAS IN VARCHAR2,
     /*13*/
     PI_N_TOTAL_COSTAS IN T_SCOB_EXPEDIENTE_DOCUMENTO.MONTO_COSTA%TYPE,
     /*14*/
     PI_N_NRO_ITEMSC IN INTEGER,
     -------------------------
     /*15*/
     PI_V_ESTADO_EXPEDIENTE IN T_SCOB_EXPEDIENTE_DOCUMENTO.ESTADO_EXPEDIENTE%TYPE,
     /*16*/
     PI_N_ID_EXP_DOC_ORIGEN IN T_SCOB_EXPEDIENTE_DOCUMENTO.ID_EXPEDIENTE_DOCUMENTO_ORIGEN%TYPE,
     ---
     /*17*/
     PI_V_TIPO_ENTIDAD IN VARCHAR,
     /*18*/
     PI_V_ID_TIPO_ENTIDAD IN VARCHAR, --entidades a quienes va dirigido
     /*19*/
     PI_V_NRO_ITEMSTE IN VARCHAR, --cadena con los numero de entidades a quienes ira dirigido
     --
     /*20*/
     PI_N_ID_SERVICIO IN NUMBER,
     /*21*/
     PI_V_ID_TIPO_SERVICIO IN VARCHAR2,
     /*22*/
     PI_C_FLG_UCI IN CHAR,
     --
     /*23*/
     PI_V_AUDUSUCREACION IN T_SCOB_EXPEDIENTE_DOCUMENTO.AUDUSUCREACION%TYPE,
     /*24*/
     PI_N_ID_USUARIO_INGRESO IN T_SCOB_USUARIO.ID_USUARIO%TYPE,
     /*25*/
     PI_V_FEC_GENERACION_DOC IN VARCHAR,
     --
     PO_N_RETORNO   OUT NUMBER,
     PO_N_COD_ERROR OUT NUMBER,
     PO_V_MSJ_ERROR OUT VARCHAR2) IS
        N_GENERADOR_DOCUMENTO NUMBER;
        --N_ID_MULTA                              T_SCOB_MULTA.ID_MULTA%TYPE;
        --N_CONT                                  INTEGER;
        --V_ID_EXPEDIENTE                         VARCHAR(10);
        --C_FLG_MULTA_RESOLUTIVO                  T_SCOB_MULTA.FLG_MULTA_RESOLUTIVO%TYPE;
    
    BEGIN
        PO_V_MSJ_ERROR := '';
        PO_N_RETORNO   := 0;
        PO_N_COD_ERROR := -1;
    
        SCOB_SP_I_GENERA_DOCUMENTO(PI_V_ID_EXPEDIENTE,
                                   PI_N_NRO_ITEMS,
                                   PI_N_ID_MOTIVO,
                                   PI_V_ID_PLANTILLA,
                                   PI_V_MOTIVO_PLANTILLA,
                                   PI_N_NRO_ITEMSP,
                                   PI_V_ID_COSTAS,
                                   PI_V_POR_COSTAS,
                                   PI_V_VAL_COSTAS,
                                   PI_V_CNT_COSTAS,
                                   PI_V_SUB_TOTAL_COSTAS,
                                   PI_N_TOTAL_COSTAS,
                                   PI_N_NRO_ITEMSC,
                                   PI_V_ESTADO_EXPEDIENTE,
                                   PI_N_ID_EXP_DOC_ORIGEN,
                                   PI_V_TIPO_ENTIDAD,
                                   PI_V_ID_TIPO_ENTIDAD,
                                   PI_V_NRO_ITEMSTE,
                                   PI_N_ID_SERVICIO,
                                   PI_V_ID_TIPO_SERVICIO,
                                   PI_C_FLG_UCI,
                                   PI_V_AUDUSUCREACION,
                                   PI_N_ID_USUARIO_INGRESO,
                                   --TO_DATE(PI_V_FEC_GENERACION_DOC,'DD/MM/YYYY'),
                                   PI_V_FEC_GENERACION_DOC,
                                   '0', --FLG_GEN_REC
                                   N_GENERADOR_DOCUMENTO,
                                   PO_N_COD_ERROR,
                                   PO_V_MSJ_ERROR);
    
        --ACTUALIZAR LOS DOCUMENTOS COMO TIPO GENERADO POR EL USUARIO
        UPDATE T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
           SET EXDO.TIPO_DOC_ASOC = SCOB_PK_CONSTANTES.C_TIPO_DOC_ASOC_USUARIO
         WHERE EXDO.COD_GENERADOR_DOCUMENTO = N_GENERADOR_DOCUMENTO;
    
        IF PO_N_COD_ERROR < 0 THEN
            ROLLBACK;
            RETURN;
        END IF;
    
        PO_N_COD_ERROR := 0;
        PO_N_RETORNO   := N_GENERADOR_DOCUMENTO;
    
        COMMIT;
        --rollback;
    
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

    PROCEDURE SCOB_SP_S_DOC_TRAMITE
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 28.10.2011
        -- Proposito    : consulta
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_I_COD_FASE                IN INTEGER,
     PI_N_COD_GENERADOR_DOCUMENTO IN NUMBER,
     PO_CU_RETORNO                OUT CU_REC_SET) AS
    BEGIN
        OPEN PO_CU_RETORNO FOR
        
            SELECT TO_NUMBER(SUBTIP_DOC.COD_INTERNO) AS COD_TIPO_DOCUMENTO,
                   SUBTIP_DOC.TXT_DESCRIPCION AS NOM_TIPO_DOCUMENTO,
                   ' ' AS NRO_RESOLUCION,
                   MUL_DOC.NRO_DOCUMENTO AS NRO_DOCUMENTO,
                   MUL_DOC.NOMBRE AS NOM_ARCHIVO,
                   MUL_DOC.NRO_VERSION AS NRO_VERSION,
                   MUL_DOC.FEC_INGRESO AS FEC_GENERACION,
                   MUL_DOC.AUDUSUCREACION AS LOG_USUARIO_GENERACION
              FROM T_SCOB_MULTA_DOCUMENTO_GEN MUL_DOC
             INNER JOIN T_SCOB_TIPO_DOCUMENTO TIP_DOC
                ON TIP_DOC.ID_TIPO_DOCUMENTO = MUL_DOC.ID_TIPO_DOCUMENTO
              LEFT JOIN T_SCOB_TABLA_DET SUBTIP_DOC
                ON SUBTIP_DOC.COD_INTERNO = TIP_DOC.COD_SUBTIPO_DOCUMENTO
               AND SUBTIP_DOC.ID_TABLA = 23
             WHERE MUL_DOC.ESTADO = '1'
               AND MUL_DOC.COD_GENERADOR_DOCUMENTO = PI_N_COD_GENERADOR_DOCUMENTO
               AND SCOB_PK_CONSTANTES.C_COD_FASE_MULTA_COB = PI_I_COD_FASE
            
            UNION
            
            SELECT
            
             EXDO.COD_SUBTIPO_DOCUMENTO AS COD_TIPO_DOCUMENTO,
             SUBTIP_DOC.TXT_DESCRIPCION AS NOM_TIPO_DOCUMENTO,
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
             EXDO.AUDUSUCREACION AS LOG_USUARIO_GENERACION
              FROM T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
              LEFT JOIN T_SCOB_TABLA_DET SUBTIP_DOC
                ON SUBTIP_DOC.ID_TABLA = 23
               AND SUBTIP_DOC.COD_INTERNO = EXDO.COD_SUBTIPO_DOCUMENTO
             WHERE EXDO.ESTADO = '1'
               AND EXDO.COD_GENERADOR_DOCUMENTO = PI_N_COD_GENERADOR_DOCUMENTO
               AND SCOB_PK_CONSTANTES.C_COD_FASE_EXPEDIENTE = PI_I_COD_FASE;
    
    END;

    PROCEDURE SCOB_SP_D_DOC_TRAMITE
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 28.10.2011
        -- Proposito    : elimina los documentos generados.
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_I_COD_FASE                IN INTEGER,
     PI_N_ID_MULTA                IN NUMBER,
     PI_N_ID_EXPEDIENTE           IN NUMBER,
     PI_N_COD_GENERADOR_DOCUMENTO IN NUMBER,
     PI_V_AUDUSUMODIFICACION      IN T_SCOB_MULTA.AUDUSUMODIFICACION%TYPE,
     PO_N_RETORNO                 OUT NUMBER,
     PO_N_COD_ERROR               OUT NUMBER,
     PO_V_MSJ_ERROR               OUT VARCHAR2) IS
        N_MAX_COD_GENERADOR T_SCOB_EXPEDIENTE_DOCUMENTO.COD_GENERADOR_DOCUMENTO%TYPE;
    
    BEGIN
        PO_V_MSJ_ERROR := ' ';
        PO_N_RETORNO   := 0;
    
        IF PI_I_COD_FASE = SCOB_PK_CONSTANTES.C_COD_FASE_MULTA_COB THEN
            --obtener el maximo generado de documento registrado
            SELECT MAX(MUDOC.COD_GENERADOR_DOCUMENTO)
              INTO N_MAX_COD_GENERADOR
              FROM T_SCOB_MULTA_DOCUMENTO_GEN MUDOC
             WHERE MUDOC.ID_MULTA = PI_N_ID_MULTA
               AND MUDOC.ESTADO = '1';
        
        ELSIF PI_I_COD_FASE = SCOB_PK_CONSTANTES.C_COD_FASE_EXPEDIENTE THEN
            --obtener el maximo generado de documento registrado
            SELECT MAX(EXDO.COD_GENERADOR_DOCUMENTO)
              INTO N_MAX_COD_GENERADOR
              FROM T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
             WHERE EXDO.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
               AND EXDO.ESTADO = '1';
        
        END IF;
    
        IF N_MAX_COD_GENERADOR <> PI_N_COD_GENERADOR_DOCUMENTO THEN
            PO_V_MSJ_ERROR := 'No se puede realizar la accion. El registro seleccionado no es el ultimo grupo de documentos generados.';
            PO_N_COD_ERROR := -10;
            RETURN;
        END IF;
    
        IF PI_I_COD_FASE = SCOB_PK_CONSTANTES.C_COD_FASE_MULTA_COB THEN
            --elimina los registros en T_SCOB_MULTA_DOCUMENTO_GEN
            UPDATE T_SCOB_MULTA_DOCUMENTO_GEN
               SET ESTADO             = SCOB_PK_CONSTANTES.C_ESTADO_INACTIVO,
                   AUDFECMODIFICACION = SYSDATE,
                   AUDUSUMODIFICACION = PI_V_AUDUSUMODIFICACION
             WHERE COD_GENERADOR_DOCUMENTO = PI_N_COD_GENERADOR_DOCUMENTO;
        END IF;
    
        IF PI_I_COD_FASE = SCOB_PK_CONSTANTES.C_COD_FASE_EXPEDIENTE THEN
            --elimina los registros en T_SCOB_EXPED_DOCUMENTO_DIREC
            UPDATE T_SCOB_EXPED_DOCUMENTO_DIREC
               SET ESTADO             = SCOB_PK_CONSTANTES.C_ESTADO_INACTIVO,
                   AUDFECMODIFICACION = SYSDATE,
                   AUDUSUMODIFICACION = PI_V_AUDUSUMODIFICACION
             WHERE ID_EXPEDIENTE_DOCUMENTO IN (SELECT EXDO.ID_EXPEDIENTE_DOCUMENTO AS ID_EXPEDIENTE_DOCUMENTO
                                                 FROM T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
                                                WHERE EXDO.COD_GENERADOR_DOCUMENTO = PI_N_COD_GENERADOR_DOCUMENTO)
               AND ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO;
        
            --elimina los registros en T_SCOB_EXPEDIENTE_DOCUMENTO
            UPDATE T_SCOB_EXPEDIENTE_DOCUMENTO
               SET ESTADO             = SCOB_PK_CONSTANTES.C_ESTADO_INACTIVO,
                   AUDFECMODIFICACION = SYSDATE,
                   AUDUSUMODIFICACION = PI_V_AUDUSUMODIFICACION
             WHERE COD_GENERADOR_DOCUMENTO = PI_N_COD_GENERADOR_DOCUMENTO;
        END IF;
    
        PO_N_RETORNO := 1;
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

    PROCEDURE SCOB_SP_D_DOC_SUSPENSION
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 31.10.2011 --falta cambiar estados de la suspension... y eliminar las tablas correctas.
        -- Proposito    : elimina los documentos generados por suspension
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_N_ID_EXPEDIENTE           IN NUMBER,
     PI_N_ID_EXPED_SUSPENDER      IN T_SCOB_EXPED_SUSPENDER.ID_EXPED_SUSPENDER%TYPE,
     PI_I_COD_TIPO_ASOCIACION     IN INTEGER,
     PI_N_COD_GENERADOR_DOCUMENTO IN NUMBER,
     PI_V_AUDUSUMODIFICACION      IN T_SCOB_MULTA.AUDUSUMODIFICACION%TYPE,
     PO_N_RETORNO                 OUT NUMBER,
     PO_N_COD_ERROR               OUT NUMBER,
     PO_V_MSJ_ERROR               OUT VARCHAR2) IS
        N_MAX_COD_GENERADOR T_SCOB_EXPEDIENTE_DOCUMENTO.COD_GENERADOR_DOCUMENTO%TYPE;
    
    BEGIN
        PO_V_MSJ_ERROR := ' ';
        PO_N_RETORNO   := 0;
    
        --obtener el maximo documento generado.
        SELECT MAX(EXDO.COD_GENERADOR_DOCUMENTO)
          INTO N_MAX_COD_GENERADOR
          FROM T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
         WHERE EXDO.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
           AND EXDO.ESTADO = '1';
    
        IF N_MAX_COD_GENERADOR <> PI_N_COD_GENERADOR_DOCUMENTO THEN
            PO_V_MSJ_ERROR := 'No se puede realizar la accion. El registro seleccionado no es el ultimo grupo de documentos generados.';
            PO_N_COD_ERROR := -10;
            RETURN;
        END IF;
    
        --elimina los registros en T_SCOB_EXPED_DOCUMENTO_DIREC
        UPDATE T_SCOB_EXPED_DOCUMENTO_DIREC
           SET ESTADO             = SCOB_PK_CONSTANTES.C_ESTADO_INACTIVO,
               AUDFECMODIFICACION = SYSDATE,
               AUDUSUMODIFICACION = PI_V_AUDUSUMODIFICACION
         WHERE ID_EXPEDIENTE_DOCUMENTO IN (SELECT EXDO.ID_EXPEDIENTE_DOCUMENTO AS ID_EXPEDIENTE_DOCUMENTO
                                             FROM T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
                                            WHERE EXDO.COD_GENERADOR_DOCUMENTO = PI_N_COD_GENERADOR_DOCUMENTO)
           AND ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO;
    
        --elimina los registros en T_SCOB_EXPEDIENTE_DOCUMENTO
        UPDATE T_SCOB_EXPEDIENTE_DOCUMENTO
           SET ESTADO             = SCOB_PK_CONSTANTES.C_ESTADO_INACTIVO,
               AUDFECMODIFICACION = SYSDATE,
               AUDUSUMODIFICACION = PI_V_AUDUSUMODIFICACION
         WHERE COD_GENERADOR_DOCUMENTO = PI_N_COD_GENERADOR_DOCUMENTO;
    
        PO_N_RETORNO := 1;
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

    PROCEDURE SCOB_SP_D_DOC_FRACCIONAMIENTO
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 31.10.2011 --falta cambiar estados del fraccionamiento... y eliminar las tablas correctas.
        -- Proposito    : elimina los documentos generados por fraccionamiento
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_N_ID_EXPEDIENTE           IN NUMBER,
     PI_N_ID_EXPED_FRACCIONAR     IN T_SCOB_EXPED_FRACCIONAR.ID_EXPED_FRACCIONAR%TYPE,
     PI_I_COD_TIPO_ASOCIACION     IN INTEGER,
     PI_N_COD_GENERADOR_DOCUMENTO IN NUMBER,
     PI_V_AUDUSUMODIFICACION      IN T_SCOB_MULTA.AUDUSUMODIFICACION%TYPE,
     PO_N_RETORNO                 OUT NUMBER,
     PO_N_COD_ERROR               OUT NUMBER,
     PO_V_MSJ_ERROR               OUT VARCHAR2) IS
        N_MAX_COD_GENERADOR T_SCOB_EXPEDIENTE_DOCUMENTO.COD_GENERADOR_DOCUMENTO%TYPE;
    
    BEGIN
        PO_V_MSJ_ERROR := ' ';
        PO_N_RETORNO   := 0;
    
        --obtener el maximo documento generado.
        SELECT MAX(EXDO.COD_GENERADOR_DOCUMENTO)
          INTO N_MAX_COD_GENERADOR
          FROM T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
         WHERE EXDO.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
           AND EXDO.ESTADO = '1';
    
        IF N_MAX_COD_GENERADOR <> PI_N_COD_GENERADOR_DOCUMENTO THEN
            PO_V_MSJ_ERROR := 'No se puede realizar la accion. El registro seleccionado no es el ultimo grupo de documentos generados.';
            PO_N_COD_ERROR := -10;
            RETURN;
        END IF;
    
        --elimina los registros en T_SCOB_EXPED_DOCUMENTO_DIREC
        UPDATE T_SCOB_EXPED_DOCUMENTO_DIREC
           SET ESTADO             = SCOB_PK_CONSTANTES.C_ESTADO_INACTIVO,
               AUDFECMODIFICACION = SYSDATE,
               AUDUSUMODIFICACION = PI_V_AUDUSUMODIFICACION
         WHERE ID_EXPEDIENTE_DOCUMENTO IN (SELECT EXDO.ID_EXPEDIENTE_DOCUMENTO AS ID_EXPEDIENTE_DOCUMENTO
                                             FROM T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
                                            WHERE EXDO.COD_GENERADOR_DOCUMENTO = PI_N_COD_GENERADOR_DOCUMENTO)
           AND ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO;
    
        --elimina los registros en T_SCOB_EXPEDIENTE_DOCUMENTO
        UPDATE T_SCOB_EXPEDIENTE_DOCUMENTO
           SET ESTADO             = SCOB_PK_CONSTANTES.C_ESTADO_INACTIVO,
               AUDFECMODIFICACION = SYSDATE,
               AUDUSUMODIFICACION = PI_V_AUDUSUMODIFICACION
         WHERE COD_GENERADOR_DOCUMENTO = PI_N_COD_GENERADOR_DOCUMENTO;
    
        PO_N_RETORNO := 1;
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

    PROCEDURE SCOB_SP_U_ACTUALIZAR_ARCHIVO
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 02.11.2011
        -- Proposito    : importar un archivo
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_I_COD_FASE           IN INTEGER,
     PI_N_ID_MULTA           IN NUMBER,
     PI_N_ID_EXPEDIENTE      IN NUMBER,
     PI_N_ID_DOCUMENTO       IN NUMBER,
     PI_I_TIPO_DOC_ASOC      IN INTEGER,
     PI_V_AUDUSUMODIFICACION IN T_SCOB_MULTA.AUDUSUMODIFICACION%TYPE,
     PO_N_RETORNO            OUT NUMBER,
     PO_N_COD_ERROR          OUT NUMBER,
     PO_V_MSJ_ERROR          OUT VARCHAR2) IS
        N_MAX_COD_GENERADOR T_SCOB_EXPEDIENTE_DOCUMENTO.COD_GENERADOR_DOCUMENTO%TYPE;
    
    BEGIN
        PO_V_MSJ_ERROR := ' ';
        PO_N_RETORNO   := 0;
    
        IF PI_I_COD_FASE = SCOB_PK_CONSTANTES.C_COD_FASE_MULTA_COB THEN
            --actualizar el archivo
            UPDATE T_SCOB_MULTA_DOCUMENTO_GEN MUDOC
               SET TIPO_DOC_ASOC      = PI_I_TIPO_DOC_ASOC,
                   AUDFECMODIFICACION = SYSDATE,
                   AUDUSUMODIFICACION = PI_V_AUDUSUMODIFICACION
             WHERE MUDOC.ID_MULTA = PI_N_ID_MULTA
               AND MUDOC.ID_MULTA_DOCUMENTO_GEN = PI_N_ID_DOCUMENTO
               AND MUDOC.ESTADO = '1';
        
        ELSIF PI_I_COD_FASE = SCOB_PK_CONSTANTES.C_COD_FASE_EXPEDIENTE THEN
            --obtener el maximo generado de documento registrado
            SELECT MAX(EXDO.COD_GENERADOR_DOCUMENTO)
              INTO N_MAX_COD_GENERADOR
              FROM T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
             WHERE EXDO.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
               AND EXDO.ESTADO = '1';
        
            --actualizar el archivo
            UPDATE T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
               SET TIPO_DOC_ASOC      = PI_I_TIPO_DOC_ASOC,
                   AUDFECMODIFICACION = SYSDATE,
                   AUDUSUMODIFICACION = PI_V_AUDUSUMODIFICACION
             WHERE EXDO.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
               AND EXDO.ID_EXPEDIENTE_DOCUMENTO = PI_N_ID_DOCUMENTO
               AND EXDO.ESTADO = '1';
        
        END IF;
    
        PO_N_RETORNO := 1;
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
    --
    PROCEDURE SCOB_SP_I_SOLIC_DESACUM_DOC
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
    (PI_I_COD_TIPO_ASOCIACION IN T_SCOB_EXPED_COACTIVO_DOC.COD_TIPO_ASOCIACION%TYPE,
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
     PO_N_RETORNO            OUT NUMBER,
     PO_N_COD_ERROR          OUT NUMBER,
     PO_V_MSJ_ERROR          OUT VARCHAR2) AS
        --
        N_GENERADOR_DOCUMENTO NUMBER;
        --
    BEGIN
        --
        DBMS_OUTPUT.PUT_LINE('***SCOB_SP_I_SOLIC_DESACUM_DOC***');
        --
        SCOB_PK_GENERAR_DOCUMENTO.SCOB_SP_I_GENERA_DOCUMENTO(PI_V_ID_EXPEDIENTE,
                                                             PI_N_NRO_ITEMS,
                                                             PI_N_ID_MOTIVO,
                                                             PI_V_ID_PLANTILLA,
                                                             PI_V_MOTIVO_PLANTILLA,
                                                             PI_N_NRO_ITEMSP,
                                                             NULL, --PI_V_ID_COSTAS,
                                                             NULL, --PI_V_POR_COSTAS,
                                                             NULL, --PI_V_VAL_COSTAS,
                                                             NULL, --PI_V_CNT_COSTAS,
                                                             NULL, --PI_V_SUB_TOTAL_COSTAS,
                                                             0, --PI_N_TOTAL_COSTAS,
                                                             NULL, --PI_N_NRO_ITEMSC,
                                                             PI_I_ESTADO_EXPEDIENTE,
                                                             PI_N_ID_EXP_DOC_ORIGEN,
                                                             PI_V_TIPO_ENTIDAD,
                                                             PI_V_ID_TIPO_ENTIDAD,
                                                             PI_V_NRO_ITEMSTE,
                                                             PI_N_ID_SERVICIO,
                                                             PI_V_ID_TIPO_SERVICIO,
                                                             PI_C_FLG_UCI,
                                                             PI_V_AUDUSUCREACION,
                                                             PI_N_ID_USUARIO_INGRESO,
                                                             PI_V_FEC_GENERACION_DOC,
                                                             '0', --FLG_GEN_REC
                                                             N_GENERADOR_DOCUMENTO,
                                                             PO_N_COD_ERROR,
                                                             PO_V_MSJ_ERROR);
        --
        PO_N_COD_ERROR := 0;
        PO_N_RETORNO   := N_GENERADOR_DOCUMENTO;
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
            --
    END SCOB_SP_I_SOLIC_DESACUM_DOC;
    --
    FUNCTION SCOB_FN_DIREC_PERSONA_BY_TIPO(PI_N_ID_EXPEDIENTE      IN T_SCOB_EXPEDIENTE.ID_EXPEDIENTE%TYPE,
                                           PI_N_ID_PERSONA         IN T_SCOB_PERSONA.ID_PERSONA%TYPE,
                                           PI_V_COD_TIPO_DOMICILIO IN T_SCOB_PERSONA_DOMICILIO.TIPO_DOMICILIO%TYPE) RETURN VARCHAR2 IS
        V_DOMICILIO VARCHAR2(250);
    BEGIN
    
        SELECT DIRECCION
          INTO V_DOMICILIO
          FROM (SELECT PDOM.ID_PERSONA_DOMICILIO AS ID_PERSONA_DOMICILIO,
                       PDOM.NOM_VIA || ' ' || PDOM.NRO_VIA || ' ' || PDOM.NRO_INTERIOR || ' ' || PDOM.NOM_ZONA || ' ' || UBIG.TXT_DIST || ' ' ||
                       UBIG.TXT_PROV || ' ' || UBIG.TXT_DPTO AS DIRECCION
                  FROM T_SCOB_EXPEDIENTE_PERSONA EPER
                 INNER JOIN T_SCOB_PERSONA_DOMICILIO PDOM
                    ON PDOM.ID_PERSONA_DOMICILIO = EPER.ID_PERSONA_DOMICILIO
                 INNER JOIN T_SCOB_TIPO_DOMICILIO TIDO
                    ON TIDO.ID_TIPO_DOMICILIO = PDOM.TIPO_DOMICILIO
                 INNER JOIN T_SCOB_UBIGEO UBIG
                    ON UBIG.ID_UBIGEO = PDOM.ID_UBIGEO
                 WHERE EPER.ID_EXPEDIENTE = PI_N_ID_EXPEDIENTE
                   AND EPER.ID_PERSONA = PI_N_ID_PERSONA
                   AND EPER.COD_TIPO_ENTIDAD = SCOB_PK_CONSTANTES.C_COD_ENTIDAD_PERSONA
                   AND EPER.ESTADO = SCOB_PK_CONSTANTES.C_ESTADO_ACTIVO
                   AND TRIM(TIDO.CODIGO) = TRIM(PI_V_COD_TIPO_DOMICILIO)
                 ORDER BY PDOM.ID_PERSONA_DOMICILIO DESC) DIREC
         WHERE ROWNUM = 1;
        RETURN V_DOMICILIO;
    
    END;

    PROCEDURE SCOB_SP_I_GRABA_LOG_STD
    /*
        -----------------------------------------------------------
        -- Autor        : RMCA
        -- Creado       : 27.06.2012
        -- Proposito    : insertar el log's de los documentos no generados en STD
        -----------------------------------------------------------
        -- Modificacion :
        -- Autor        :
        -- Modificado   :
        -- Proposito    :
        -----------------------------------------------------------
        */
    (PI_N_ID_EXPEDIENTE           IN NUMBER,
     PI_N_COD_GENERADOR_DOCUMENTO IN NUMBER,
     PI_I_TIPO_EVENTO             IN INTEGER,
     PI_N_ID_TIPO_EVENTO          IN NUMBER,
     --
     PO_N_RETORNO   OUT NUMBER,
     PO_N_COD_ERROR OUT NUMBER,
     PO_V_MSJ_ERROR OUT VARCHAR2) IS
        N_PK_LOG_STD NUMBER;
    BEGIN
        PO_V_MSJ_ERROR := '';
    
        SELECT SCOB_SQ_LOG_INTERFAZ_STD.NEXTVAL INTO N_PK_LOG_STD FROM DUAL;
        INSERT INTO USR_SICOB.T_SCOB_LOG_INTERFAZ_STD
            (PK_LOG_STD, ID_EXPEDIENTE, COD_GENERADOR_DOCUMENTO, TIPO_EVENTO, ID_TIPO_EVENTO, FLG_PROCESADO)
        VALUES
            (N_PK_LOG_STD, PI_N_ID_EXPEDIENTE, PI_N_COD_GENERADOR_DOCUMENTO, PI_I_TIPO_EVENTO, PI_N_ID_TIPO_EVENTO, '0');
    
        PO_N_RETORNO   := N_PK_LOG_STD;
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
    ----
    FUNCTION SCOB_FN_SUM_DOC_EXP(V_COD_TIPO_PERSONA_SANCIONADO NUMBER,
                                 V_TBL_TIPO_DOC_IDENT          NUMBER,
                                 V_COD_GENERADOR_DOCUMENTO     NUMBER,
                                 V_OP                          VARCHAR2) RETURN VARCHAR2 IS
        V_RPTA              NUMBER;
        V_VALOR_UIT         NUMBER;
        V_IMPORTE_UIT       NUMBER;
        V_SALDO_CAPITAL     NUMBER;
        V_SALDO_COSTAS      NUMBER;
        V_SALDO_TOTAL_DEUDA NUMBER;
    BEGIN
        --
        SELECT SUM(MDET.VALOR_UIT) AS VALOR_UIT,
               SUM(MULT.MONTO_UIT) AS IMPORTE_UIT,
               SUM(MULT.SALDO) AS SALDO_CAPITAL,
               SUM(MULT.SALDO_COSTAS) AS SALDO_COSTAS,
               SUM(MULT.SALDO_TOTAL_DEUDA) AS V_SALDO_TOTAL_DEUDA
          INTO V_VALOR_UIT,
               V_IMPORTE_UIT,
               V_SALDO_CAPITAL,
               V_SALDO_COSTAS,
               V_SALDO_TOTAL_DEUDA
          FROM T_SCOB_MULTA MULT
         INNER JOIN T_SCOB_MULTA_DETAL MDET
            ON MDET.ID_MULTA = MULT.ID_MULTA
           AND MDET.FLG_ACTUAL = '1'
           AND MDET.ESTADO = '1'
         INNER JOIN T_SCOB_MULTA_SANCIONADO MSAN
            ON MSAN.ID_MULTA_DETAL = MDET.ID_MULTA_DETAL
           AND MSAN.COD_TIPO_PERSONA = V_COD_TIPO_PERSONA_SANCIONADO
           AND MSAN.ESTADO = '1'
         INNER JOIN T_SCOB_PERSONA PERS
            ON PERS.ID_PERSONA = MSAN.ID_PERSONA
         INNER JOIN T_SCOB_TABLA_DET TDID
            ON TDID.ID_TABLA = V_TBL_TIPO_DOC_IDENT
           AND TDID.COD_INTERNO = PERS.TIPO_DOC
         WHERE MULT.ID_MULTA IN (SELECT DISTINCT EXMU.ID_MULTA
                                   FROM T_SCOB_EXPEDIENTE_MULTA EXMU
                                  WHERE EXMU.ID_EXPEDIENTE IN (SELECT DISTINCT EXDO.ID_EXPEDIENTE
                                                                 FROM T_SCOB_EXPEDIENTE_DOCUMENTO EXDO
                                                                WHERE EXDO.COD_GENERADOR_DOCUMENTO = V_COD_GENERADOR_DOCUMENTO)
                                    AND EXMU.ESTADO = '1');
        --
        CASE
            WHEN V_OP = 'VALOR_UIT' THEN
                V_RPTA := V_VALOR_UIT;
            WHEN V_OP = 'IMPORTE_UIT' THEN
                V_RPTA := V_IMPORTE_UIT;
            WHEN V_OP = 'SALDO_CAPITAL' THEN
                V_RPTA := V_SALDO_CAPITAL;
            WHEN V_OP = 'SALDO_COSTAS' THEN
                V_RPTA := V_SALDO_COSTAS;
            WHEN V_OP = 'SALDO_TOTAL_DEUDA' THEN
                V_RPTA := V_SALDO_TOTAL_DEUDA;
        END CASE;
        --
        RETURN TRIM(V_RPTA);
        --
    END SCOB_FN_SUM_DOC_EXP;
    --
    FUNCTION SCOB_FN_ETIQ_DOC_DESACUM(PI_N_ID NUMBER,
                                      V_OP    VARCHAR2) RETURN VARCHAR2 IS
        V_RPTA CLOB;
    
        V_NRO_CUM     CLOB;
        V_EXP_DESTINO CLOB;
        V_CONT        NUMBER;
        V_CONT2       NUMBER;
    
        V_VALOR_UIT         NUMBER;
        V_IMPORTE_UIT       NUMBER;
        V_SALDO_CAPITAL     NUMBER;
        V_SALDO_COSTAS      NUMBER;
        V_SALDO_TOTAL_DEUDA NUMBER;
        --
        V_CANT_C1 NUMBER;
        V_CANT_C2 NUMBER;
        V_QUERY   CLOB;
        A1        CU_REC_SET;
        --
        NRO_CUM        VARCHAR2(100);
        NRO_EXPEDIENTE VARCHAR2(100);
        NU_TIPO_SOLIC  NUMBER;
        V_AUX          VARCHAR2(100);
    BEGIN
        --
        V_CONT  := 0;
        V_CONT2 := 0;
        V_AUX   := '';
        --
        FOR A1 IN (SELECT (B.ANIO || B.CUM) AS NRO_CUM,
                          (C.ANIO || C.NRO_EXPEDIENTE) AS NRO_EXPEDIENTE_DESTINO,
                          (D.ANIO || D.NRO_EXPEDIENTE) AS NRO_EXPEDIENTE_ORIGEN,
                          A.NU_TIPO_SOLIC
                     FROM T_SCOB_SOLIC_DESACUM A
                    INNER JOIN T_SCOB_MULTA B
                       ON A.ID_MULTA = B.ID_MULTA
                    INNER JOIN T_SCOB_EXPEDIENTE C
                       ON A.ID_EXP_DESTINO = C.ID_EXPEDIENTE
                    INNER JOIN T_SCOB_EXPEDIENTE D
                       ON A.ID_EXP_ORIGEN = D.ID_EXPEDIENTE
                    WHERE A.NU_ESTADO_SOLIC = 3
                      AND A.NU_IMPRESO = 0
                      AND A.NU_ID_EXP_SOLIC = PI_N_ID
                    ORDER BY 2 ASC)
        LOOP
            --
            --DBMS_OUTPUT.PUT_LINE('V_CONT: '||V_CONT);
            --
            IF A1.NU_TIPO_SOLIC = 1 THEN
                IF V_CONT > 0 THEN
                    V_NRO_CUM     := V_NRO_CUM || ' / ';
                    V_EXP_DESTINO := V_EXP_DESTINO || ' / ';
                END IF;
                V_NRO_CUM     := V_NRO_CUM || A1.NRO_CUM;
                V_EXP_DESTINO := V_EXP_DESTINO || A1.NRO_EXPEDIENTE_DESTINO;
                V_CONT        := V_CONT + 1;
            ELSIF A1.NU_TIPO_SOLIC = 2 THEN
                IF V_CONT > 0 THEN
                    V_NRO_CUM := V_NRO_CUM || ' / ';
                END IF;
                IF V_AUX = A1.NRO_EXPEDIENTE_ORIGEN THEN
                    NULL;
                ELSE
                    IF V_CONT2 > 0 THEN
                        V_EXP_DESTINO := V_EXP_DESTINO || ' / ';
                    END IF;
                    V_EXP_DESTINO := V_EXP_DESTINO || A1.NRO_EXPEDIENTE_ORIGEN;
                    V_CONT2       := V_CONT2 + 1;
                END IF;
                V_AUX     := A1.NRO_EXPEDIENTE_ORIGEN;
                V_NRO_CUM := V_NRO_CUM || A1.NRO_CUM;
                V_CONT    := V_CONT + 1;
            END IF;
            --
        END LOOP;
        --
        DBMS_OUTPUT.PUT_LINE('DATA 1: ' || V_NRO_CUM);
        DBMS_OUTPUT.PUT_LINE('DATA 2: ' || V_EXP_DESTINO);
        --
        CASE
            WHEN V_OP = 'CUM_DESACUM' THEN
                V_RPTA := V_NRO_CUM;
            WHEN V_OP = 'EXP_DESACUM' THEN
                V_RPTA := V_EXP_DESTINO;
        END CASE;
        --
        RETURN TO_CHAR(V_RPTA);   
        -- return dbms_lob.substr(V_RPTA, 32000, 1 );
        --
    END SCOB_FN_ETIQ_DOC_DESACUM;
    --



END SCOB_PK_GENERAR_DOCUMENTO;
/
