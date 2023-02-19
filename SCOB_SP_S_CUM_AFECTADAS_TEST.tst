PL/SQL Developer Test script 3.0
9
begin
  -- Call the procedure
  SCOB_PK_CAJA.SCOB_SP_S_CUM_AFECTADAS(PI_ID_MULTA => :PI_ID_MULTA,
                                       PI_V_TIPO_PAGO => :PI_V_TIPO_PAGO,
                                       PI_N_MONTO => :PI_N_MONTO,
                                       PI_D_FEC_PAGO => :PI_D_FEC_PAGO,
                                       PO_I_COD_ESTADO_PAGO => :PO_I_COD_ESTADO_PAGO,
                                       PO_CU_RETORNO => :PO_CU_RETORNO);
end;
6
PI_ID_MULTA
1
122946
4
PI_V_TIPO_PAGO
1
FR
5
PI_N_MONTO
1
926.4
4
PI_D_FEC_PAGO
1
01/12/2022
12
PO_I_COD_ESTADO_PAGO
1
3
4
PO_CU_RETORNO
1
<Cursor>
116
8
N_TOTAL_PAGO_MULTA
I_APLICA_DSCTO
N_MONTO
N_MONTO_IC
N_MONTO_IM
N_MONTO_CG
N_MONTO_TOTAL_DEUDA
D_FEC_VCTO
