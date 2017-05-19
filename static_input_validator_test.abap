CLASS cl_test_input_validator DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS test_valid_aabbbaa FOR TESTING RAISING cx_static_check.
    METHODS test_valid_bblklbb FOR TESTING RAISING cx_static_check.
    METHODS test_valid_xylklyx FOR TESTING RAISING cx_static_check.
    METHODS test_invalid_ccdddcc FOR TESTING RAISING cx_static_check.
    METHODS setup.
    DATA input_validator TYPE REF TO zif_demo_input_validator.
ENDCLASS. 

CLASS cl_test_input_validator IMPLEMENTATION.
  METHOD setup.
    CREATE OBJECT input_validator TYPE zcl_demo_tdd_validator.
  ENDMETHOD.                  

  METHOD test_valid_aabbbaa.
    cl_abap_unit_assert=>assert_true( input_validator->is_input_valid( 'aABbbaA' ) ).
  ENDMETHOD.                

  METHOD test_valid_bblklbb.
    cl_abap_unit_assert=>assert_true( input_validator->is_input_valid( 'bblklbb' ) ).
  ENDMETHOD.                    

  METHOD test_valid_xylklyx.
    cl_abap_unit_assert=>assert_true( input_validator->is_input_valid( 'xylklyx' ) ).
  ENDMETHOD.                   

  METHOD test_invalid_ccdddcc.
    cl_abap_unit_assert=>assert_false( input_validator->is_input_valid( 'cCdDDcc' ) ).
  ENDMETHOD.                    
ENDCLASS.
