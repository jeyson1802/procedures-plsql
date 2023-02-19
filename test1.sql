DECLARE
POV_COD_RESULT_SIA VARCHAR(200);
POV_MSG_RESULT_SIA VARCHAR(200);
begin
  -- Call the procedure
  
  PKG_INTFZ_REG_MULTA_SICOB_SIA.SP_REGISTRO_MULTA_SICOB_A_SIA(PIN_ID_MULTA => 138193,
                                                                  POV_COD_RESULT => POV_COD_RESULT,
                                                                  POV_MSG_RESULT => POV_MSG_RESULT);
                                                                  
  dbms_output.put_line(POV_COD_RESULT);
  dbms_output.put_line(POV_MSG_RESULT);                                                                  
end;
