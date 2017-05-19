CLASS cl_test_repo_input_validator DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    CONSTANTS _get_valid_prefixes TYPE seocpdname VALUE 'get_valid_prefixes' ##NO_TEXT.

    METHODS test_valid_aabbbaa FOR TESTING RAISING cx_static_check.
    METHODS test_valid_bblklbb FOR TESTING RAISING cx_static_check.
    METHODS test_valid_xylklyx FOR TESTING RAISING cx_static_check.
    METHODS test_invalid_ccdddcc FOR TESTING RAISING cx_static_check.
    METHODS test_repo_was_called_once FOR TESTING RAISING cx_static_check.
    METHODS setup.

    DATA input_validator TYPE REF TO zif_demo_input_validator.
    DATA prefix_repo_mock TYPE REF TO zif_mocka_mocker.
ENDCLASS.

CLASS cl_test_repo_input_validator IMPLEMENTATION.
  METHOD setup.
    DATA valid_prefixes TYPE stringtab. "This internal table represents a database 
    APPEND 'AA' TO valid_prefixes.
    APPEND 'BB' TO valid_prefixes.
    APPEND 'XY' TO valid_prefixes.

    "Use mockA for mocking the external repository
    DATA prefix_repo TYPE REF TO zif_demo_prefix_repo. "The repo encapsulates the database access
    prefix_repo_mock = zcl_mocka_mocker=>zif_mocka_mocker~mock( 'zif_demo_prefix_repo' ). "Create an instance to control this mock
    prefix_repo_mock->method( _get_valid_prefixes )->returns( valid_prefixes ). "Tell the mocking controler how to handle the method call
    prefix_repo ?= prefix_repo_mock->generate_mockup( ). "Ask the mocking controller to generate the mocking instance (in fact, mockA will generate source code in this step)

    CREATE OBJECT input_validator TYPE zcl_demo_db_input_validator
      EXPORTING prefix_repo = prefix_repo.
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

  "This method is an example how to validate if an external ressource was used in a proper way
  METHOD test_repo_was_called_once.
    input_validator->is_input_valid( 'Hello World' ).

    cl_abap_unit_assert=>assert_equals(
      exp = 1
      act = prefix_repo_mock->method_call_count( _get_valid_prefixes )
    ).
  ENDMETHOD.
ENDCLASS.
