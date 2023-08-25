*&---------------------------------------------------------------------*
*& Report ZOT_12_P_ODEV2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZOT_12_P_ODEV2.

INCLUDE zot_12_top.
INCLUDE zot_12_pbo.
INCLUDE zot_12_pai.
INCLUDE zot_12_frm.

START-OF-SELECTION.

  PERFORM get_data.
  PERFORM set_fcat.
  PERFORM set_layout.



  CALL SCREEN 0100.
