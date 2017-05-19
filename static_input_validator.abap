CLASS zcl_lmn0344_tdd_validator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES zif_lmn0344_input_validator.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.  

CLASS zcl_lmn0344_tdd_validator IMPLEMENTATION.
  METHOD zif_lmn0344_input_validator~is_input_valid.
    DATA input_to_upper TYPE string.
    DATA palindrome_checker TYPE REF TO zcl_lmn0344_palindrome_checker.
    DATA valid_prefixes TYPE stringtab.
    CREATE OBJECT palindrome_checker.

    APPEND 'AA' TO valid_prefixes.
    APPEND 'BB' TO valid_prefixes.
    APPEND 'XY' TO valid_prefixes.

    input_to_upper = to_upper( input ).
    READ TABLE valid_prefixes WITH KEY table_line = input_to_upper(2) TRANSPORTING NO FIELDS.
    IF sy-subrc = 0.
      r_result = palindrome_checker->is_palindrome( input_to_upper ).
    ENDIF.
  ENDMETHOD.                    
ENDCLASS.  
