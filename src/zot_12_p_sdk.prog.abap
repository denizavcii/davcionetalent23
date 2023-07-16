*&---------------------------------------------------------------------*
*& Report zot_12_p_sdk
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_12_p_sdk.


SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.

  PARAMETERS: val1 TYPE p DECIMALS 2 OBLIGATORY DEFAULT '1',

              val2 TYPE p DECIMALS 2 OBLIGATORY DEFAULT '1'.

SELECTION-SCREEN END OF BLOCK b1.

AT SELECTION-SCREEN ON val1.

  IF val1 < 1 OR val1 > 10000.
    MESSAGE 'Hatalı değer! val1 1 ile 10000 arasında olmalıdır.' TYPE 'E'.
  ENDIF.

AT SELECTION-SCREEN ON val2.

  IF val2 < 1 OR val2 > 9.
    MESSAGE 'Hatalı değer! val2 1 ile 9 arasında olmalıdır.' TYPE 'E'.
  ENDIF.
