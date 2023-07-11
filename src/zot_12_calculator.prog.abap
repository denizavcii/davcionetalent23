*&---------------------------------------------------------------------*
*& Report zot_12_calculator
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_12_calculator.
DATA: gv_sonuc type i .
SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.

  PARAMETERS: val1 TYPE p DECIMALS 2 OBLIGATORY,

              val2 TYPE p DECIMALS 2 OBLIGATORY.

SELECTION-SCREEN END OF BLOCK b1.

SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE TEXT-002.

  PARAMETERS: topla RADIOBUTTON GROUP grp1,

              cikar RADIOBUTTON GROUP grp1,

              carp  RADIOBUTTON GROUP grp1,

              bol   RADIOBUTTON GROUP grp1.



SELECTION-SCREEN END OF BLOCK b2.

START-OF-SELECTION.
IF topla = 'X'.
    gv_sonuc = val1 + val2.
    cl_demo_output=>write( gv_sonuc ).

 ELSEIF cikar = 'X'.
        gv_sonuc = val1 - val2.
        cl_demo_output=>write( gv_sonuc ).

 ELSEIF carp = 'X'.
        gv_sonuc = val1 * val2.
        cl_demo_output=>write( gv_sonuc ).

 ELSEIF bol = 'X'.
        gv_sonuc = val1 / val2.
        cl_demo_output=>write( gv_sonuc ).

     TRY.
        gv_sonuc = val1 / val2 .
     CATCH cx_sy_zerodivide.
        cl_demo_output=>write( |Sıfıra bölme yapılmaz !| ).
     ENDTRY.
        cl_demo_output=>write( gv_sonuc ).
 ENDIF.
cl_demo_output=>display(  ).
