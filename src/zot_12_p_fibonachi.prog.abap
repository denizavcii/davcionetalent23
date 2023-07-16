*&---------------------------------------------------------------------*
*& Report zot_12_p_fibonachi
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_12_p_fibonachi.


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

 DATA: num1 TYPE p DECIMALS 2 ,
      num2 TYPE P decımals 2,
      fibonacci TYPE p DECIMALS 2,
      counter TYPE p DECIMALS 2.

 num1 = val1.
 num2 = val2.
 counter = 0.



  DO val1 TIMES.
  fibonacci = num1 + num2.
  num1 = num2.
  num2 = fibonacci.
  counter = counter + 1.

    IF counter >= val2.
        BREAK-POINT.
    cl_demo_output=>write( counter ).

    ENDIF.
   ENDDO.
