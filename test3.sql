DECLARE
POV_COD_RESULT VARCHAR(200);
  POV_MSG_RESULT VARCHAR(200);
begin
  -- Call the procedure
  
  PKG_INTFZ_REG_MULTA_SICOB_SIA.SP_REGISTRO_PERSONA_SICOB_A_SIA(PIN_ID_MULTA => 138193,
                                                                PIV_IDENTIFICADOR => '20220000012337',
                                                                  POV_COD_RESULT => POV_COD_RESULT,
                                                                  POV_MSG_RESULT => POV_MSG_RESULT);
                                                                  
  dbms_output.put_line('POV_COD_RESULT ==> ' || POV_COD_RESULT);
  dbms_output.put_line('POV_MSG_RESULT ==> ' || POV_MSG_RESULT);                                                                  
end;

DECLARE
VN_NUM_PERSONA_DENUNCIANTE NUMBER;
begin
  -- Call the procedure
  
  USR_SIA_INTFZ.PKG_INTFZ_MULTAS_SIA.SIA_S_GENERA_PERSONA(PIN_CH_CLIENTENOMBRE    => 'PEREZ CALSIN MARILU',
                                                        PIN_CH_TIPODOCUMENTO    => 'D',
                                                        PIN_CH_CLIENTEDOCUMENTO => '23924401',
                                                        PIN_CH_ULTIMOUSUARIO    => 'INTERFAZ',
                                                        POUT_NU_PERSONA         => VN_NUM_PERSONA_DENUNCIANTE);
                                                                  
  dbms_output.put_line('VN_NUM_PERSONA_DENUNCIANTE ==> ' || VN_NUM_PERSONA_DENUNCIANTE);                                                          
end;

