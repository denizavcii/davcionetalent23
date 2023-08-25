
FORM display_alv .

  CREATE OBJECT go_cont
    EXPORTING
      container_name = 'CC_ALV'.

  CREATE OBJECT go_alv
    EXPORTING
      i_parent = go_cont.

  go_alv->set_table_for_first_display(
    EXPORTING
*      i_buffer_active               =
*      i_bypassing_buffer            =
*      i_consistency_check           =
*      i_structure_name              =
*      is_variant                    =
*      i_save                        =
*      i_default                     = 'X'
      is_layout                     = gs_layout
*      is_print                      =
*      it_special_groups             =
*      it_toolbar_excluding          =
*      it_hyperlink                  =
*      it_alv_graphics               =
*      it_except_qinfo               =
*      ir_salv_adapter               =
    CHANGING
      it_outtab                     = gt_odev2
      it_fieldcatalog               = gt_fcat
*      it_sort                       =
*      it_filter                     =
    EXCEPTIONS
      invalid_parameter_combination = 1
      program_error                 = 2
      too_many_lines                = 3
      others                        = 4
  ).

  CALL METHOD go_alv->register_edit_event
    EXPORTING
      i_event_id = cl_gui_alv_grid=>mc_evt_enter.

  CALL METHOD go_alv->register_edit_event
    EXPORTING
      i_event_id = cl_gui_alv_grid=>mc_evt_modified.

ENDFORM.

*CALL METHOD go_alv->register_edit_event
*  EXPORTING
*    i_event_id = cl_gui_alv_grid=>mc_evt_enter.



FORM get_data .
  SELECT  t1~personel_id ,
          concat_with_space( t1~personel_adi , t1~personel_soyadi, 1 ) AS adı,
*          t1~personel_adi ,
*          t1~personel_soyadi ,
          CASE t1~personel_cinsiyeti WHEN 'E' THEN 'ERKEK'
                                     WHEN 'K' THEN 'KADIN'
     END AS personel_cinsiyeti ,
          t2~personel_tel_no ,
          t2~personel_mail ,
          t2~personel_ev_adres
     FROM zot_12_t_m_pers AS t1
  INNER JOIN zot_12_t_pers AS t2 ON t1~personel_id EQ t2~personel_id
  INTO TABLE @gt_odev2.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form set_fcat
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM set_fcat .



  CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'
   EXPORTING
*     I_BUFFER_ACTIVE              =
     I_STRUCTURE_NAME             = 'ZOT_12_S_PERSONEL_ALV'
*     I_CLIENT_NEVER_DISPLAY       = 'X'
*     I_BYPASSING_BUFFER           =
*     I_INTERNAL_TABNAME           =
    CHANGING
      ct_fieldcat                  = gt_fcat
   EXCEPTIONS
     INCONSISTENT_INTERFACE       = 1
     PROGRAM_ERROR                = 2
     OTHERS                       = 3
            .
    LOOP AT gt_fcat ASSIGNING FIELD-SYMBOL(<fs_fcat>).
       CASE <fs_fcat>-FIELDNAME .
        WHEN 'MAIL'.
           <fs_fcat>-edit = abap_true .
        WHEN 'PERSONEL_ID'.
           <fs_fcat>-key = abap_true .
        WHEN OTHERS.
       ENDCASE.


*        WHEN 'PERSONEL_ID'.
*           <fs_fcat>-col_opt = abap_true .
*        WHEN 'ADI'.
*           <fs_fcat>-ref_field = abap_true .
*        WHEN 'CINSIYETI'.
*           <fs_fcat>-ref_field = abap_true .
*        WHEN 'TELEFON_NO'.
*           <fs_fcat>-ref_field = abap_true .
*        WHEN 'MAIL'.
*           <fs_fcat>-ref_field = abap_true .
*        WHEN 'EV_ADRESI'.
*           <fs_fcat>-ref_field = abap_true .

*      ENDCASE.
    ENDLOOP.

ENDFORM.
*&---------------------------------------------------------------------*
*& Form set_layout
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM set_layout .
  CLEAR: gs_layout.
  gs_layout-cwidth_opt = abap_true.
  gs_layout-zebra = abap_true.

ENDFORM.
*&---------------------------------------------------------------------*
*& Form get_new_mail
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM get_new_mail .
  DATA: lv_ttl_mail TYPE char200,
        lv_ttl_mail_c TYPE char200,
        lv_mess TYPE char200,
        LS_PERSONEL_ALV TYPE ZOT_12_S_PERSONEL_ALV,
        lt_zot12mpers TYPE TABLE OF zot_12_t_m_pers,
        lt_zot12pers TYPE TABLE OF zot_12_t_pers.
*  lt_zot12pers = CORRESPONDING #( gt_odev2 ).

LOOP AT gt_odev2 ASSIGNING FIELD-SYMBOL(<LFS_001>).
    APPEND INITIAL LINE TO lt_zot12pers ASSIGNING FIELD-SYMBOL(<fs_001>).
    <fs_001>-mandt = sy-mandt.
    <fs_001>-personel_id = <LFS_001>-PERSONEL_ID.
    <fs_001>-personel_tel_no = <LFS_001>-TELEFON_NO.
    <fs_001>-personel_mail = <LFS_001>-MAIL.
    <fs_001>-personel_ev_adres = <LFS_001>-EV_ADRESI.
*    <fs_001>-ADI = <LFS_001>-ADI.
  ENDLOOP.

  LOOP AT gt_odev2 ASSIGNING FIELD-SYMBOL(<LFS_002>).
    APPEND INITIAL LINE TO lt_zot12mpers ASSIGNING FIELD-SYMBOL(<fs_002>).
    <fs_002>-mandt = sy-mandt.
    <fs_002>-personel_id = <LFS_002>-PERSONEL_ID.
    <fs_002>-personel_adi = <LFS_002>-ADI.
*    <fs_002>-personel_soyadi = <LFS_002>-soyadi.
    <fs_002>-personel_cinsiyeti = <LFS_002>-CINSIYETI.
  ENDLOOP.


    MODIFY zot_12_t_pers FROM TABLE lt_zot12pers.
  IF sy-subrc = 0.
    COMMIT WORK AND WAIT.
    CONCATENATE ' Mail güncellendi = '
              lv_ttl_mail
              INTO lv_mess.
  MESSAGE lv_mess TYPE 'I'.
  ENDIF.

*  LOOP AT gt_odev2 ASSIGNING FIELD-SYMBOL(<LFS_001>).
*    lv_ttl_mail = lv_ttl_mail + <LFS_001>-personel_id.
*  ENDLOOP.



ENDFORM.
