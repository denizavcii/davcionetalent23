*&---------------------------------------------------------------------*
*& Report zot_12_t_zmn
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_12_t_zmn.


DATA   lt_zaman TYPE TABLE OF zot_12_t_zmn.
DATA        ls_zaman TYPE zot_12_t_zmn.

SELECT-OPTIONS : s_index FOR ls_zaman-index_no .

START-OF-SELECTION.

  SELECT *
  FROM zot_12_t_zmn
  INTO TABLE lt_zaman
  WHERE index_no IN s_index.


  APPEND VALUE #( index_no        = 1
              baslangict = '20230201'
              baslangic_s    = '090000'
              bitist   = '20230401'
              bitis_s     =  '080000' ) TO lt_zaman.

  APPEND VALUE #( index_no        = 2
                  baslangict = '20230201'
                  baslangic_s    = '101010'
                  bitist   = '20250405'
                  bitis_s     =  '111111' ) TO lt_zaman.
  APPEND VALUE #( index_no        = 3
                  baslangict = '20230201'
                  baslangic_s    = '121212'
                  bitist   = '20240101'
                  bitis_s     =  '181210' ) TO lt_zaman.
  APPEND VALUE #( index_no        = 4
                  baslangict = '20230201'
                  baslangic_s    = '151315'
                  bitist   = '20230228'
                  bitis_s     =  '151015' ) TO lt_zaman.


  LOOP AT lt_zaman INTO ls_zaman .
    DATA : lv_tarih1    TYPE dats,
           lv_tarih2    TYPE dats,
           lv_zmn1      TYPE tims,
           lv_zmn2      TYPE tims,
           lv_s_yil     TYPE i,
           lv_s_ay      TYPE i,
           lv_s_gun     TYPE i,
           lv_s_saat    TYPE i,
           lv_s_dk      TYPE i,
           lv_s_saniye  TYPE i,
           lv_fark1     TYPE i,
           lv_fark2     TYPE i,
           lv_saat_fark TYPE i.

    lv_tarih1 = ls_zaman-baslangict.
    lv_tarih2 = ls_zaman-bitist.
    lv_zmn1 = ls_zaman-baslangic_s.
    lv_zmn2 = ls_zaman-bitis_s.
    lv_fark1 = lv_tarih2 - lv_tarih1.
    lv_s_yil = lv_fark1 DIV 365.


    lv_fark2 = lv_fark1 MOD 365.
    lv_s_ay = lv_fark2 DIV 30 .
    lv_s_gun = lv_fark2 MOD 30.
    IF lv_zmn2 > lv_zmn1.

      lv_saat_fark = lv_zmn2 - lv_zmn1 .
    ELSE.
      lv_saat_fark = 86400 + lv_zmn2 - lv_zmn1 .
      lv_s_gun -= 1.
    ENDIF.

    lv_s_saat = lv_saat_fark DIV 3600.
    lv_saat_fark = lv_saat_fark MOD 3600.
    lv_s_dk = lv_saat_fark DIV 60 .
    lv_s_saniye = lv_saat_fark MOD 60 .

WRITE: | { ls_zaman-index_no }. INDEX'E AIT KAYIT; |.
    IF lv_s_yil NE 0.
      WRITE : | { lv_s_yil } YIL| .
    ENDIF.
    IF lv_s_ay NE 0.
      WRITE : | { lv_s_ay } AY| .
    ENDIF.
    IF lv_s_gun NE 0 .
      WRITE : | { lv_s_gun } GÜN| .
    ENDIF.
    IF lv_s_saat NE 0.
      WRITE : | { lv_s_saat } SAAT| .
    ENDIF.
    IF lv_s_dk NE 0 .
      WRITE : | { lv_s_dk } DAKİKA| .
    ENDIF.
    IF lv_s_saniye NE 0 .
      WRITE : | { lv_s_saniye } SANİYE| .
    ENDIF.
    WRITE: /.

  ENDLOOP.

END-OF-SELECTION.
