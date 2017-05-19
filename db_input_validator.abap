CLASS zcl_demo_db_input_validator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES zif_demo_input_validator.
    METHODS constructor IMPORTING prefix_repo TYPE REF TO zif_demo_prefix_repo. "use constructor injection for dependency on external ressource
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA prefix_repo TYPE REF TO zif_demo_prefix_repo.
ENDCLASS.

CLASS zcl_demo_db_input_validator IMPLEMENTATION.
  METHOD constructor.
    ASSERT prefix_repo IS NOT INITIAL.
    me->prefix_repo = prefix_repo.
  ENDMETHOD.

  METHOD zif_demo_input_validator~is_input_valid.
    DATA input_to_upper TYPE string.
    DATA palindrome_checker TYPE REF TO zcl_demo_palindrome_checker.
    CREATE OBJECT palindrome_checker.

    DATA valid_prefixes TYPE stringtab.
    valid_prefixes = prefix_repo->get_valid_prefixes( ).

    input_to_upper = to_upper( input ).
    READ TABLE valid_prefixes WITH KEY table_line = input_to_upper(2) TRANSPORTING NO FIELDS.
    IF sy-subrc = 0.
      r_result = palindrome_checker->is_palindrome( input_to_upper ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.
