*&---------------------------------------------------------------------*
*& Report zot_12_dataobjects
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_12_dataobjects.

*Data: gv_text TYPE b.

Data: gv_ogrenci_adi TYPE c LENGTH 10,  "predefined
      gv_ogrenci_soyadi type char12,    "data element
      gv_tarih type sy-datum.

      gv_ogrenci_adi = 'Deniz'.
      gv_ogrenci_soyadi = 'avcı'.
      gv_tarih = sy-datum.

cl_demo_output=>write( gv_ogrenci_adi ).
cl_demo_output=>write(  gv_ogrenci_soyadi ).
cl_demo_output=>write( gv_tarih ).


cl_demo_output=>display(  ).
