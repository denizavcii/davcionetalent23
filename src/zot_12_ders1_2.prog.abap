*&---------------------------------------------------------------------*
*& Report zot_12_ders1_2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_12_ders1_2.

DATA: gv_degs1 TYPE i.
*      gv_degs2 TYPE n LENGTH 10,
*      gv_sonuct TYPE i,
*      gv_sonucc TYPE i,
*      gv_sonucca TYPE  i ,
*      gv_sonucb TYPE i.

gv_degs1 = 5.
*gv_degs2 = 13.

*cl_demo_output=>write( gv_degs1 ).
*cl_demo_output=>write( gv_degs2 ).

*IF gv_degs1 > gv_degs2.
*    cl_demo_output=>write( '1.sayı büyük.' ).
*ELSEIF gv_degs1 < gv_degs2.
*    cl_demo_output=>write( '2.sayı büyük.' ).
*ELSE.
*    cl_demo_output=>write( '2 sayı eşit.' ).
*ENDIF.

*CASE gv_degs1.
*    WHEN 1.
*    cl_demo_output=>write( gv_degs1 ).
*    WHEN 2.
*    cl_demo_output=>write( gv_degs2 ).
*ENDCASE.

*DO 10 TIMES.
*    gv_degs1 = gv_degs1 + 1.
*    cl_demo_output=>write( gv_degs1 &&  'DO döngüsü öğreniyoruz' ).
*ENDDO.

WHILE gv_degs1 < 10.
    gv_degs1 = gv_degs1 + 1.
    cl_demo_output=>write( gv_degs1 && 'While döngüsü öğreniyorum.').
ENDWHILE.

" < LT
" > GT
" <= LE
" >= GE
" = EQ
cl_demo_output=>display(  ).
