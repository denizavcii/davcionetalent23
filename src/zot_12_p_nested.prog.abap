*&---------------------------------------------------------------------*
*& Report zot_12_p_nested
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_12_p_nested.

DATA(st_table) = VALUE ZOT_12_TT_OGR_NOT( ( student_id       = '1'
                                            student_name       = 'Deniz Avcı'
                                            student_bdate       = '13.05.1999'
                                            student_department       = 'Computer Enginnering'

                                            student_gradevalue       = VALUE ZOT_12_S_SINIF(

                                            student_1st            = VALUE ZOT_12_S_DERS(
                                            student_lesson1            = VALUE ZOT_12_S_NOT(
                                            student_midterm1            = '45'
                                            student_midterm2            = '63'
                                            student_final            = '43'
                                            student_makeupexam          = '87' ) )



                                            student_2nd          = VALUE ZOT_12_S_DERS(
                                            student_lesson2            = VALUE ZOT_12_S_NOT(
                                            student_midterm1            = '33'
                                            student_midterm2            = '69'
                                            student_final            = '53'
                                            student_makeupexam          = '71' ) )

                                                                                            ) ) ).
cl_demo_output=>display( st_table ).




.
