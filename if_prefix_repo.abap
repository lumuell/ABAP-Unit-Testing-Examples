INTERFACE zif_demo_prefix_repo
  PUBLIC .
  METHODS get_valid_prefixes RETURNING value(r_result) TYPE stringtab.
ENDINTERFACE.
