*&---------------------------------------------------------------------*
*& Include          ZOT_12_TOP
*&---------------------------------------------------------------------*

DATA: go_alv TYPE REF TO cl_gui_alv_grid,
      go_cont type ref to cl_gui_custom_container.

DATA: gt_odev2 TYPE TABLE OF ZOT_12_S_PERSONEL_ALV,
      gt_fcat TYPE lvc_t_fcat,
      gs_fcat TYPE lvc_s_fcat,
      gs_layout TYPE lvc_s_layo.

TABLES: zot_12_t_pers, zot_12_t_m_pers.
