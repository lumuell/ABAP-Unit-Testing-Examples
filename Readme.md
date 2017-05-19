# Test examples of ABAP Unit Demo
* For examples of unit testing in general: `palindrome_checker_test.abap`
* For examples of unit testing with mockA: `db_input_validator_test.abap`

## Input validator I
Write a method which 
1. checks if an input is a palindrome. 
If the input is a palindrome, the method returns `abap_true`, otherwise it returns `abap_false`.

Solution: `palindrome_checker.abap`, `palindrome_checker_test.abap`

## Input validator II - with special prefix
Write a method which 
1. checks if an input is a palindrome and if yes
2. checks if this palindrome starts with a special prefix ‘AA’, ‘BB’ or ‘XY’. 
If the input is a palindrome with a valid prefix, the method returns `abap_true`, otherwise it returns `abap_false`.

Solution: `if_input_validator.abap`, `static_input_validator.abap`, `static_input_validator_test.abap`

## Input validator III - with special prefix
Write a method which 
1. checks if an input is a palindrome and if yes
2. checks if this palindrome starts with a special prefix, which is stored in a database.
If the input is a palindrome with a valid prefix, the method returns `abap_true`, otherwise it returns `abap_false`.

Solution: `db_input_validator.abap`, `db_input_validator_test.abap`
