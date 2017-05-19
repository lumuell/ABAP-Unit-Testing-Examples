CLASS lcl_test_palindrome_checker DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS. "Every Unit Test should be harmless and short, so in general don't change it.

  PRIVATE SECTION.
    METHODS test_aabb FOR TESTING RAISING cx_static_check. "It's often a good idea to add the RAISING clause by default, so you don't
    METHODS test_abba FOR TESTING RAISING cx_static_check. "have to bother with try-catch clauses
    METHODS setup. "A method called setup has a special purpose: The test suite calls it before every test.
    DATA checker TYPE REF TO zcl_lmn0344_palindrome_checker.
ENDCLASS.                    


CLASS lcl_test_palindrome_checker IMPLEMENTATION.
  METHOD setup.
    CREATE OBJECT checker. "We don't want to repeat ourselves, not even in our tests.
    "For that reason we create the object under test in the setup method.
  ENDMETHOD.                    "setup

  METHOD test_aabb. "to have meaningful names is important. In this simple case it's fine to use the input as name.
    "In more complex cases, call the test like the function you want to test
    cl_abap_unit_assert=>assert_false( checker->is_palindrome( 'AABB') ). "The assert class has different assert methods, it's good practice
    "to use the most special assert method.
  ENDMETHOD.                 

  METHOD test_abba.
    cl_abap_unit_assert=>assert_true( checker->is_palindrome( 'ABBA') ).
  ENDMETHOD.                   
ENDCLASS.
