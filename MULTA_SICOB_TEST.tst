PL/SQL Developer Test script 3.0
17
declare
  -- Call the procedure
  V_VC_CUM      VARCHAR2(50);
  V_VC_CUM_ANIO VARCHAR2(4);
  V_VC_CUM_NRO  VARCHAR2(20);

begin

  
  V_VC_CUM      := :PI_VC_CUM;
  V_VC_CUM_ANIO := SUBSTR(V_VC_CUM, 1, 4);
  V_VC_CUM_NRO  := LPAD(SUBSTR(V_VC_CUM, 5, 10), 10, '0');
    
  PKG_INTFZ_RECAUDACION.S_GET_MULTA_SICOB(PIN_VC_CUM_ANIO => V_VC_CUM_ANIO,
                                          PIN_VC_CUM_NRO => V_VC_CUM_NRO,
                                          POUT_CUR_RETORNO => :POUT_CUR_RETORNO);
end;
4
PI_VC_CUM
1
20220000003842
5
POUT_CUR_RETORNO
1
<Cursor>
116
V_VC_CUM
0
-5
V_VC_CUM_ANIO
0
-5
0
