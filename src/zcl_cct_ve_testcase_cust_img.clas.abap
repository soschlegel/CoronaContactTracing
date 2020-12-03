CLASS zcl_cct_ve_testcase_cust_img DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_sadl_exit_calc_element_read.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_cct_ve_testcase_cust_img IMPLEMENTATION.
  METHOD if_sadl_exit_calc_element_read~calculate.
*    DATA testcases TYPE STANDARD TABLE OF zcct_c_testcase WITH DEFAULT KEY.
*    testcases = CORRESPONDING #( it_original_data  ).
*
*    LOOP AT testcases ASSIGNING FIELD-SYMBOL(<testcase>).
*        <testcase>-CustInital =  |{ <testcase>-personname }|.
**      <testcase>-CustImageURL = 'https://github.githubassets.com/images/modules/open_graph/github-octocat.png'.
*    ENDLOOP.
*
*    ct_calculated_data = CORRESPONDING #( testcases ).
  ENDMETHOD.

  METHOD if_sadl_exit_calc_element_read~get_calculation_info.
*    LOOP AT it_requested_calc_elements ASSIGNING FIELD-SYMBOL(<fs_calc_element>).
*      CASE <fs_calc_element>.
*        WHEN 'CUSTINITAL'.
*          APPEND 'PERSONNAME' TO et_requested_orig_elements.
*      ENDCASE.
*    ENDLOOP.
  ENDMETHOD.
ENDCLASS.

