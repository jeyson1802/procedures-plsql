PL/SQL Developer Test script 3.0
98
declare
  -- Non-scalar parameters require additional processing 
  V_TAB_MULTA_AFECTADA_RESULT PKG_INTFZ_RECAUDACION.TAB_MUL_AFECTADA;
begin
  -- Call the procedure
  PKG_INTFZ_RECAUDACION.S_GET_DIST_PAGO_MUL_SICOB(PIN_NU_ID_EMPRESA_CAJA => :PIN_NU_ID_EMPRESA_CAJA,
                                                  PIN_CH_ANIO_CAJA => :PIN_CH_ANIO_CAJA,
                                                  PIN_NU_ID_CAJA => :PIN_NU_ID_CAJA,
                                                  PIN_VC_CUM_SICOB => :PIN_VC_CUM_SICOB,
                                                  PIN_NU_IMPORTE => :PIN_NU_IMPORTE,
                                                  PIN_DT_PAGO => :PIN_DT_PAGO,
                                                  PIN_VC_TIPO_MULTA => :PIN_VC_TIPO_MULTA,
                                                  POUT_TAB_MULTA_AFECTADA => V_TAB_MULTA_AFECTADA_RESULT,
                                                  POUT_NU_ERROR => :POUT_NU_ERROR,
                                                  POUT_VC_ERROR => :POUT_VC_ERROR);
                                                  
FOR V_NU_IDX IN V_TAB_MULTA_AFECTADA_RESULT.FIRST .. V_TAB_MULTA_AFECTADA_RESULT.LAST LOOP
        DBMS_OUTPUT.PUT_LINE('NU_ID_EMPRESA >>>>>' ||
                             TO_CHAR(V_TAB_MULTA_AFECTADA_RESULT(V_NU_IDX)
                                     .NU_ID_EMPRESA));
        DBMS_OUTPUT.PUT_LINE('CH_ANIO  >>>>>' ||
                             TO_CHAR(V_TAB_MULTA_AFECTADA_RESULT(V_NU_IDX)
                                     .CH_ANIO));
        DBMS_OUTPUT.PUT_LINE('NU_ID_CAJA  >>>>>' || V_TAB_MULTA_AFECTADA_RESULT(V_NU_IDX)
                             .NU_ID_CAJA);
        DBMS_OUTPUT.PUT_LINE('NU_MTO_CAPITAL  >>>>>' || V_TAB_MULTA_AFECTADA_RESULT(V_NU_IDX)
                             .NU_MTO_CAPITAL);
        DBMS_OUTPUT.PUT_LINE('NU_MTO_IC  >>>>>' || V_TAB_MULTA_AFECTADA_RESULT(V_NU_IDX)
                             .NU_MTO_IC);
        DBMS_OUTPUT.PUT_LINE('NU_MTO_IM  >>>>>' || V_TAB_MULTA_AFECTADA_RESULT(V_NU_IDX)
                             .NU_MTO_IM);
        DBMS_OUTPUT.PUT_LINE('NU_MTO_CG  >>>>>' || V_TAB_MULTA_AFECTADA_RESULT(V_NU_IDX)
                             .NU_MTO_CG);
        DBMS_OUTPUT.PUT_LINE('NU_MTO_EXCESO  >>>>>' || V_TAB_MULTA_AFECTADA_RESULT(V_NU_IDX)
                             .NU_MTO_EXCESO);
        DBMS_OUTPUT.PUT_LINE('NU_CUOTA_INI  >>>>>' || V_TAB_MULTA_AFECTADA_RESULT(V_NU_IDX)
                             .NU_CUOTA_INI);
        DBMS_OUTPUT.PUT_LINE('NU_CUOTA_FIN  >>>>>' || V_TAB_MULTA_AFECTADA_RESULT(V_NU_IDX)
                             .NU_CUOTA_FIN);
        DBMS_OUTPUT.PUT_LINE('NU_ID_TIPO_CONTA  >>>>>' || V_TAB_MULTA_AFECTADA_RESULT(V_NU_IDX)
                             .NU_ID_TIPO_CONTA);
        DBMS_OUTPUT.PUT_LINE('NU_ID_TIPO_SUBCONTA  >>>>>' || V_TAB_MULTA_AFECTADA_RESULT(V_NU_IDX)
                             .NU_ID_TIPO_SUBCONTA);
        DBMS_OUTPUT.PUT_LINE('NU_ID_TIPO_PAGO  >>>>>' || V_TAB_MULTA_AFECTADA_RESULT(V_NU_IDX)
                             .NU_ID_TIPO_PAGO);
        DBMS_OUTPUT.PUT_LINE('VC_TIPO_PAGO  >>>>>' || V_TAB_MULTA_AFECTADA_RESULT(V_NU_IDX)
                             .VC_TIPO_PAGO);
        DBMS_OUTPUT.PUT_LINE('VC_GLOSA  >>>>>' || V_TAB_MULTA_AFECTADA_RESULT(V_NU_IDX)
                             .VC_GLOSA);
        DBMS_OUTPUT.PUT_LINE('NU_ID_CLIENTE  >>>>>' || V_TAB_MULTA_AFECTADA_RESULT(V_NU_IDX)
                             .NU_ID_CLIENTE);
        DBMS_OUTPUT.PUT_LINE('NU_ID_TIPO_DOC  >>>>>' || V_TAB_MULTA_AFECTADA_RESULT(V_NU_IDX)
                             .NU_ID_TIPO_DOC);
        DBMS_OUTPUT.PUT_LINE('VC_NRO_DOC  >>>>>' || V_TAB_MULTA_AFECTADA_RESULT(V_NU_IDX)
                             .VC_NRO_DOC);
        DBMS_OUTPUT.PUT_LINE('VC_ADMINISTRADO  >>>>>' || V_TAB_MULTA_AFECTADA_RESULT(V_NU_IDX)
                             .VC_ADMINISTRADO);
        DBMS_OUTPUT.PUT_LINE('NU_ID_CC_ORIGEN  >>>>>' || V_TAB_MULTA_AFECTADA_RESULT(V_NU_IDX)
                             .NU_ID_CC_ORIGEN);
        DBMS_OUTPUT.PUT_LINE('NU_ID_CC_DESTINO >>>>>' || V_TAB_MULTA_AFECTADA_RESULT(V_NU_IDX)
                             .NU_ID_CC_DESTINO);
        DBMS_OUTPUT.PUT_LINE('VC_EXP_ADM_COMPLETO  >>>>>' || V_TAB_MULTA_AFECTADA_RESULT(V_NU_IDX)
                             .VC_EXP_ADM_COMPLETO);
        DBMS_OUTPUT.PUT_LINE('VC_RES_ADM_COMPLETO  >>>>>' || V_TAB_MULTA_AFECTADA_RESULT(V_NU_IDX)
                             .VC_RES_ADM_COMPLETO);
        DBMS_OUTPUT.PUT_LINE('NU_EXP_COB_ID  >>>>>' || V_TAB_MULTA_AFECTADA_RESULT(V_NU_IDX)
                             .NU_EXP_COB_ID);
        DBMS_OUTPUT.PUT_LINE('VC_EXP_COB_COMPLETO  >>>>>' || V_TAB_MULTA_AFECTADA_RESULT(V_NU_IDX)
                             .VC_EXP_COB_COMPLETO);
        DBMS_OUTPUT.PUT_LINE('VC_EXP_COB_ANIO  >>>>>' || V_TAB_MULTA_AFECTADA_RESULT(V_NU_IDX)
                             .VC_EXP_COB_ANIO);
        DBMS_OUTPUT.PUT_LINE('VC_EXP_COB_NRO  >>>>>' || V_TAB_MULTA_AFECTADA_RESULT(V_NU_IDX)
                             .VC_EXP_COB_NRO);
        DBMS_OUTPUT.PUT_LINE('NU_ID_CUM  >>>>>' || V_TAB_MULTA_AFECTADA_RESULT(V_NU_IDX)
                             .NU_ID_CUM);
        DBMS_OUTPUT.PUT_LINE('VC_CUM_ANIO  >>>>>' || V_TAB_MULTA_AFECTADA_RESULT(V_NU_IDX)
                             .VC_CUM_ANIO);
        DBMS_OUTPUT.PUT_LINE('VC_CUM_NRO  >>>>>' || V_TAB_MULTA_AFECTADA_RESULT(V_NU_IDX)
                             .VC_CUM_NRO);
        DBMS_OUTPUT.PUT_LINE('VC_FILE_ANIO  >>>>>' || V_TAB_MULTA_AFECTADA_RESULT(V_NU_IDX)
                             .VC_FILE_ANIO);
        DBMS_OUTPUT.PUT_LINE('VC_FILE_NRO  >>>>>' || V_TAB_MULTA_AFECTADA_RESULT(V_NU_IDX)
                             .VC_FILE_NRO);
        DBMS_OUTPUT.PUT_LINE('NU_SIM_ID_LUGAR_TRAMITE  >>>>>' || V_TAB_MULTA_AFECTADA_RESULT(V_NU_IDX)
                             .NU_SIM_ID_LUGAR_TRAMITE);
        DBMS_OUTPUT.PUT_LINE('NU_SIM_ID_AREA  >>>>>' || V_TAB_MULTA_AFECTADA_RESULT(V_NU_IDX)
                             .NU_SIM_ID_AREA);
        DBMS_OUTPUT.PUT_LINE('NU_SIM_ANIO  >>>>>' || V_TAB_MULTA_AFECTADA_RESULT(V_NU_IDX)
                             .NU_SIM_ANIO);
        DBMS_OUTPUT.PUT_LINE('NU_SIM_ID_MULTA  >>>>>' || V_TAB_MULTA_AFECTADA_RESULT(V_NU_IDX)
                             .NU_SIM_ID_MULTA);
        DBMS_OUTPUT.PUT_LINE('NU_SIM_ID_DET_FRAC  >>>>>' || V_TAB_MULTA_AFECTADA_RESULT(V_NU_IDX)
                             .NU_SIM_ID_DET_FRAC);
        DBMS_OUTPUT.PUT_LINE('NU_SIM_ID_FRAC  >>>>>' || V_TAB_MULTA_AFECTADA_RESULT(V_NU_IDX)
                             .NU_SIM_ID_FRAC);

      END LOOP;
end;
10
PIN_NU_ID_EMPRESA_CAJA
1
1
4
PIN_CH_ANIO_CAJA
1
2022
5
PIN_NU_ID_CAJA
1
1
4
PIN_VC_CUM_SICOB
1
20210000006587
5
PIN_NU_IMPORTE
1
926.4
4
PIN_DT_PAGO
1
01/12/2022
12
PIN_VC_TIPO_MULTA
1
FR
5
POUT_NU_ERROR
1
0
4
POUT_VC_ERROR
0
5
POUT_TAB_MULTA_AFECTADA
0
0
0
