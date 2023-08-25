*&---------------------------------------------------------------------*
*& Report zot_12_p_karsilastirma
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_12_p_karsilastirma.

DATA: lv_param1 TYPE char6,
      lv_param2 TYPE char6,
      lv_param3 TYPE char6,
      lv_param4 TYPE char6,
      lv_param5 TYPE char6,
      lt_common_chars TYPE TABLE OF char10,
      lv_common_chars TYPE char10.


PARAMETERS: p_param1 TYPE char6,
            p_param2 TYPE char6,
            p_param3 TYPE char6,
            p_param4 TYPE char6,
            p_param5 TYPE char6.

START-OF-SELECTION.

  lv_param1 = p_param1.
  lv_param2 = p_param2.
  lv_param3 = p_param3.
  lv_param4 = p_param4.
  lv_param5 = p_param5.
  CLEAR lt_common_chars.

  CONCATENATE 'Parametre 1: ' lv_param1
              'Parametre 2: ' lv_param2
              'Parametre 3: ' lv_param3
              'Parametre 4: ' lv_param4
              'Parametre 5: ' lv_param5
              INTO lv_param1 SEPARATED BY space.



  WRITE: / lv_param1.
