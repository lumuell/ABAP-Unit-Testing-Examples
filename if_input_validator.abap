INTERFACE zif_demo_input_validator
  PUBLIC .
  METHODS is_input_valid
    IMPORTING input TYPE string
    RETURNING value(r_result) TYPE abap_bool.
ENDINTERFACE. 
