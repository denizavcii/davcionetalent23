*&---------------------------------------------------------------------*
*& Report zot_12_ifmodex
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_12_ifmodex.

*DATA: gv_index TYPE i.
*
*DO 101 TIMES.
*
*    IF gv_index MOD 2 EQ 0.
*       cl_demo_output=>write( 'Çift sayı : ' && gv_index ) .
*    ELSE.
*        cl_demo_output=>write( 'Tek sayı: ' && gv_index ).
*    ENDIF.
*    gv_index = gv_index + 1.
*ENDDO.
*cl_demo_output=>display(  ).

DATA: gv_index TYPE i.

DO 101 TIMES.

    IF gv_index MOD 2 EQ 0.
        cl_demo_output=>write( '2 ye tam bölünebilen sayılar: ' && gv_index ).
    ENDIF.

    IF gv_index MOD 3 EQ 0.
        cl_demo_output=>write( '3 e tam bölünebilen sayılar: ' && gv_index ).
    ENDIF.

    IF gv_index MOD 5 EQ 0.
        cl_demo_output=>write( '5 e tam bölünebilen sayılar: ' && gv_index ).
    ENDIF.
    gv_index = gv_index + 1.

ENDDO.
cl_demo_output=>display(  ).
