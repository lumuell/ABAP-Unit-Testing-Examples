CLASS zcl_demo_palindrome_checker DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS is_palindrome
      IMPORTING input TYPE string
      RETURNING VALUE(r_result) TYPE abap_bool.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_demo_palindrome_checker IMPLEMENTATION.
  METHOD is_palindrome.
    DATA first_index TYPE i.
    DATA last_index TYPE i.

    first_index = 0.
    "Bug: 
    "last_index = strlen( input ).
    last_index = strlen( input ) - 1.

    r_result = abap_true.

    DO strlen( input ) / 2 times.
      "Bug: 
      "IF input(first_index) <> input(last_index). 
      IF input+first_index(1) <> input+last_index(1). 
        r_result = abap_false.
        return.
      ENDIF.

      first_index = first_index + 1.
      last_index = last_index - 1.
    ENDDO.
  ENDMETHOD.
ENDCLASS.
