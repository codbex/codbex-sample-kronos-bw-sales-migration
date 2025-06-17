***********************************************************************
*      Master Template Transformation
***********************************************************************
*      This is a generated program. Do not change it manually!
***********************************************************************
* Program class      RSTRAN_MASTER_TMPL
* Object reference   0OUY6JZNKDGX433RUB7Z8MKLJ
***********************************************************************
* Template           RSTRAN_MASTER_TMPL
*  - last changed by SAP
*  - last changed at 26.05.2022 15:36:20
* Generation
*  - User name       DUMMY
*  - Time stamp      06.06.2025 10:06:40 UTC (06.06.2025 12:06:40 CET)
*  - Release         750
***********************************************************************
*&---------------------------------------------------------------------*
*&  Include           RSTRAN_MASTER_TMPL
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&  Template  RSTRAN_MASTER_TMPL  for transformation runtime           *
*&---------------------------------------------------------------------*



************************************************************************
*
*   Generated Runtime for Transformations
*
*   Template......: RSTRAN_MASTER_TMPL
*   TranID........: 0O3HV2JF3M5P7LJO52ZNFFDYZJS0FJ7N   Version: 0
*   Source........: ODSO TD_RS
*   Target........: CUBE TD_RS_C
*
*   Author........: DUMMY
*   Date..........: 06.06.2025 12:06:39
*
*   Do not change this source !
*
************************************************************************
PROGRAM rstran_master_tmpl.


*---------------------------------------------------------------------*
*       CLASS lcl_transform DEFINITION
*---------------------------------------------------------------------*
*
*---------------------------------------------------------------------*
CLASS lcl_transform DEFINITION.

  PUBLIC SECTION.



    TYPES:
      BEGIN OF _ty_s_sc_1,
*      InfoObject: MD_PROD Product MD.
        /bic/md_prod           TYPE /bic/oimd_prod,
*      InfoObject: MD_RS Reseller MD.
        /bic/md_rs           TYPE /bic/oimd_rs,
*      InfoObject: MD_EMP Employee.
        /bic/md_emp           TYPE /bic/oimd_emp,
*      InfoObject: MD_PROM Promotion MD.
        /bic/md_prom           TYPE /bic/oimd_prom,
*      InfoObject: MD_S_TY Sales Territory MD.
        /bic/md_s_ty           TYPE /bic/oimd_s_ty,
*      InfoObject: MD_CPON Customer Purchase Order Number.
        /bic/md_cpon           TYPE /bic/oimd_cpon,
*      InfoObject: MD_CURR Currency MD.
        /bic/md_curr           TYPE /bic/oimd_curr,
*      InfoObject: MD_SON Sales Order Number.
        /bic/md_son           TYPE /bic/oimd_son,
*      InfoObject: MD_SOLN Sales Order Line Number.
        /bic/md_soln           TYPE /bic/oimd_soln,
*      InfoObject: MD_FRG Freight Number.
        /bic/md_frg           TYPE /bic/oimd_frg,
*      InfoObject: MD_REVNUM Revision Number.
        /bic/md_revnum           TYPE /bic/oimd_revnum,
*      InfoObject: MD_CTN Carrier Tracking Number.
        /bic/md_ctn           TYPE /bic/oimd_ctn,
*      InfoObject: MD_ORD Order Date.
        /bic/md_ord           TYPE /bic/oimd_ord,
*      InfoObject: MD_DD Due Date.
        /bic/md_dd           TYPE /bic/oimd_dd,
*      InfoObject: MD_SHD Ship Date.
        /bic/md_shd           TYPE /bic/oimd_shd,
*      InfoObject: MD_OQ Order Quantity.
        /bic/md_oq           TYPE /bic/oimd_oq,
*      InfoObject: MD_UNPR Unit Price.
        /bic/md_unpr           TYPE /bic/oimd_unpr,
*      InfoObject: MD_CURRN Currency Unit.
        /bic/md_currn           TYPE /bic/oimd_currn,
*      InfoObject: MD_EXAM Gross Sales Revenue (GSR).
        /bic/md_exam           TYPE /bic/oimd_exam,
*      InfoObject: MD_DISPER Discount Percentage.
        /bic/md_disper           TYPE /bic/oimd_disper,
*      InfoObject: MD_DA Discount Amount.
        /bic/md_da           TYPE /bic/oimd_da,
*      InfoObject: MD_PRST Product Standard Cost.
        /bic/md_prst           TYPE /bic/oimd_prst,
*      InfoObject: MD_TPC Cost of Goods Sold (COGS).
        /bic/md_tpc           TYPE /bic/oimd_tpc,
*      InfoObject: MD_SA Net Sales Revenue (NSR).
        /bic/md_sa           TYPE /bic/oimd_sa,
*      InfoObject: MD_TA Tax Amount.
        /bic/md_ta           TYPE /bic/oimd_ta,
*      Field: RECORD Data record number.
        record           TYPE rsarecord,
      END   OF _ty_s_sc_1.
    TYPES:
      _ty_t_sc_1        TYPE STANDARD TABLE OF _ty_s_sc_1
                        WITH NON-UNIQUE DEFAULT KEY.
    TYPES:
      BEGIN OF _ty_s_tg_1,
*      InfoObject: 0CHNGID Change Run ID.
        chngid           TYPE /bi0/oichngid,
*      InfoObject: 0RECORDTP Record type.
        recordtp           TYPE /bi0/oirecordtp,
*      InfoObject: 0REQUID Request ID.
        requid           TYPE /bi0/oirequid,
*      InfoObject: MD_ORD Order Date.
        /bic/md_ord           TYPE /bic/oimd_ord,
*      InfoObject: MD_DD Due Date.
        /bic/md_dd           TYPE /bic/oimd_dd,
*      InfoObject: MD_SHD Ship Date.
        /bic/md_shd           TYPE /bic/oimd_shd,
*      InfoObject: MD_OQ Order Quantity.
        /bic/md_oq           TYPE /bic/oimd_oq,
*      InfoObject: MD_UNPR Unit Price.
        /bic/md_unpr           TYPE /bic/oimd_unpr,
*      InfoObject: MD_CURRN Currency Unit.
        /bic/md_currn           TYPE /bic/oimd_currn,
*      InfoObject: MD_EXAM Gross Sales Revenue (GSR).
        /bic/md_exam           TYPE /bic/oimd_exam,
*      InfoObject: MD_DISPER Discount Percentage.
        /bic/md_disper           TYPE /bic/oimd_disper,
*      InfoObject: MD_NPF Net Profit Amount.
        /bic/md_npf           TYPE /bic/oimd_npf,
*      InfoObject: MD_DA Discount Amount.
        /bic/md_da           TYPE /bic/oimd_da,
*      InfoObject: MD_PRST Product Standard Cost.
        /bic/md_prst           TYPE /bic/oimd_prst,
*      InfoObject: MD_TPC Cost of Goods Sold (COGS).
        /bic/md_tpc           TYPE /bic/oimd_tpc,
*      InfoObject: MD_SA Net Sales Revenue (NSR).
        /bic/md_sa           TYPE /bic/oimd_sa,
*      InfoObject: MD_TA Tax Amount.
        /bic/md_ta           TYPE /bic/oimd_ta,
*      InfoObject: MD_S_TY Sales Territory MD.
        /bic/md_s_ty           TYPE /bic/oimd_s_ty,
*      InfoObject: MD_SON Sales Order Number.
        /bic/md_son           TYPE /bic/oimd_son,
*      InfoObject: MD_SOLN Sales Order Line Number.
        /bic/md_soln           TYPE /bic/oimd_soln,
*      InfoObject: MD_PROD Product MD.
        /bic/md_prod           TYPE /bic/oimd_prod,
*      InfoObject: MD_RS Reseller MD.
        /bic/md_rs           TYPE /bic/oimd_rs,
*      InfoObject: MD_EMP Employee.
        /bic/md_emp           TYPE /bic/oimd_emp,
*      InfoObject: MD_PROM Promotion MD.
        /bic/md_prom           TYPE /bic/oimd_prom,
*      InfoObject: MD_CPON Customer Purchase Order Number.
        /bic/md_cpon           TYPE /bic/oimd_cpon,
*      InfoObject: MD_CURR Currency MD.
        /bic/md_curr           TYPE /bic/oimd_curr,
*      InfoObject: MD_FRG Freight Number.
        /bic/md_frg           TYPE /bic/oimd_frg,
*      InfoObject: MD_REVNUM Revision Number.
        /bic/md_revnum           TYPE /bic/oimd_revnum,
*      InfoObject: MD_CTN Carrier Tracking Number.
        /bic/md_ctn           TYPE /bic/oimd_ctn,
*      InfoObject: MD_GPF Gross Profit Amount.
        /bic/md_gpf           TYPE /bic/oimd_gpf,
*      InfoObject: MD_CNT Count.
        /bic/md_cnt           TYPE /bic/oimd_cnt,
*      Field: RECORD Data record number.
        record           TYPE rsarecord,
      END   OF _ty_s_tg_1.
    TYPES:
      _ty_th_tg_1        TYPE HASHED TABLE OF _ty_s_tg_1
                        WITH UNIQUE KEY
                          /bic/md_ord
                          /bic/md_dd
                          /bic/md_shd
                          /bic/md_currn
                          /bic/md_s_ty
                          /bic/md_son
                          /bic/md_soln
                          /bic/md_prod
                          /bic/md_rs
                          /bic/md_emp
                          /bic/md_prom
                          /bic/md_cpon
                          /bic/md_curr
                          /bic/md_frg
                          /bic/md_revnum
                          /bic/md_ctn.
    TYPES:
      _ty_t_tg_1        TYPE STANDARD TABLE OF _ty_s_tg_1
                        WITH NON-UNIQUE DEFAULT KEY.
    TYPES:
    BEGIN OF _r_14,
        _1_1           TYPE /bic/oimd_son,

      END OF _r_14.
    TYPES:
    BEGIN OF _r_20,
        _1_1           TYPE /bic/oimd_cpon,

      END OF _r_20.
    TYPES:
    BEGIN OF _r_22,
        _1_1           TYPE /bic/oimd_frg,

      END OF _r_22.
    TYPES:
    BEGIN OF _r_24,
        _1_1           TYPE /bic/oimd_ctn,

      END OF _r_24.
    DATA:
      p_check_master_data_exist TYPE rsodsocheckonly READ-ONLY,
      p_r_request               TYPE REF TO if_rsbk_request_admintab_view READ-ONLY.

    METHODS:
    execute
    IMPORTING
      i_master_data_exist TYPE rsodsocheckonly
      i_r_inbound         TYPE REF TO cl_rsbk_data
      i_r_log             TYPE REF TO cl_rsbm_log_cursor_step
      i_r_request         TYPE REF TO if_rsbk_request_admintab_view OPTIONAL
      i_r_trfn_cmd        TYPE REF TO cl_rsbk_cmd_t OPTIONAL
    EXPORTING
      e_r_outbound        TYPE REF TO cl_rsbk_data
    RAISING
      cx_rs_step_failed.


    METHODS
      formula__7_1
IMPORTING
          source_fields              TYPE _ty_s_sc_1
        EXPORTING
          result                   TYPE _ty_s_tg_1-/bic/md_disper.

    METHODS
      formula__25_1
IMPORTING
          source_fields              TYPE _ty_s_sc_1
        EXPORTING
          result                   TYPE _ty_s_tg_1-/bic/md_npf. "insert your code here


    METHODS
      compute_26_1
        IMPORTING
          request                  TYPE rsrequest
          datapackid               TYPE rsdatapid
          source_fields              TYPE _ty_s_sc_1
          segid                    TYPE rsbk_segid
        EXPORTING
          result                   TYPE _ty_s_tg_1-/bic/md_gpf
          monitor                  TYPE rstr_ty_t_monitor
        RAISING
          cx_sy_conversion_error
          cx_sy_arithmetic_error
          cx_rsrout_abort
          cx_rsrout_skip_record
          cx_rsrout_skip_val
          cx_rsbk_errorcount.
    METHODS
      invert_26_1
        IMPORTING
          i_th_fields_outbound         TYPE rstran_t_field_inv
          i_r_selset_outbound          TYPE REF TO cl_rsmds_set
          i_is_main_selection          TYPE rs_bool
          i_r_selset_outbound_complete TYPE REF TO cl_rsmds_set
          i_r_universe_inbound         TYPE REF TO cl_rsmds_universe
        CHANGING
          c_th_fields_inbound          TYPE rstran_t_field_inv
          c_r_selset_inbound           TYPE REF TO cl_rsmds_set
          c_exact                      TYPE rs_bool.

  PRIVATE SECTION.



*   Flag structure for dynamic rule suppression
    TYPES:
  BEGIN OF _r_s_supp,
      _1                    TYPE rs_bool,
      _2                    TYPE rs_bool,
      _3                    TYPE rs_bool,
      _4                    TYPE rs_bool,
      _5                    TYPE rs_bool,
      _6                    TYPE rs_bool,
      _7                    TYPE rs_bool,
      _8                    TYPE rs_bool,
      _9                    TYPE rs_bool,
      _10                   TYPE rs_bool,
      _11                   TYPE rs_bool,
      _12                   TYPE rs_bool,
      _13                   TYPE rs_bool,
      _14                   TYPE rs_bool,
      _15                   TYPE rs_bool,
      _16                   TYPE rs_bool,
      _17                   TYPE rs_bool,
      _18                   TYPE rs_bool,
      _19                   TYPE rs_bool,
      _20                   TYPE rs_bool,
      _21                   TYPE rs_bool,
      _22                   TYPE rs_bool,
      _23                   TYPE rs_bool,
      _24                   TYPE rs_bool,
      _25                   TYPE rs_bool,
      _26                   TYPE rs_bool,
      _27                   TYPE rs_bool,
  END   OF _r_s_supp.

    METHODS:
    get_fields_populated0001
      EXPORTING
        e_t_fieldnm TYPE rsar_t_fieldnames.


    TYPES:
      BEGIN OF _ty_g_1,
*      InfoObject: MD_OQ Order Quantity.
        /bic/md_oq           TYPE /bic/oimd_oq,
*      InfoObject: MD_UNPR Unit Price.
        /bic/md_unpr           TYPE /bic/oimd_unpr,
*      InfoObject: MD_CURRN Currency Unit.
        /bic/md_currn           TYPE /bic/oimd_currn,
*      InfoObject: MD_EXAM Gross Sales Revenue (GSR).
        /bic/md_exam           TYPE /bic/oimd_exam,
*      InfoObject: MD_DISPER Discount Percentage.
        /bic/md_disper           TYPE /bic/oimd_disper,
*      InfoObject: MD_DA Discount Amount.
        /bic/md_da           TYPE /bic/oimd_da,
*      InfoObject: MD_PRST Product Standard Cost.
        /bic/md_prst           TYPE /bic/oimd_prst,
*      InfoObject: MD_TPC Cost of Goods Sold (COGS).
        /bic/md_tpc           TYPE /bic/oimd_tpc,
*      InfoObject: MD_SA Net Sales Revenue (NSR).
        /bic/md_sa           TYPE /bic/oimd_sa,
*      InfoObject: MD_TA Tax Amount.
        /bic/md_ta           TYPE /bic/oimd_ta,
*      InfoObject: MD_NPF Net Profit Amount.
        /bic/md_npf           TYPE /bic/oimd_npf,
*      InfoObject: MD_GPF Gross Profit Amount.
        /bic/md_gpf           TYPE /bic/oimd_gpf,
*      InfoObject: MD_CNT Count.
        /bic/md_cnt           TYPE /bic/oimd_cnt,
*      InfoObject: MD_ORD Order Date.
        /bic/md_ord           TYPE /bic/oimd_ord,
*      InfoObject: MD_DD Due Date.
        /bic/md_dd           TYPE /bic/oimd_dd,
*      InfoObject: MD_SHD Ship Date.
        /bic/md_shd           TYPE /bic/oimd_shd,
*      InfoObject: MD_S_TY Sales Territory MD.
        /bic/md_s_ty           TYPE /bic/oimd_s_ty,
*      InfoObject: MD_SON Sales Order Number.
        /bic/md_son           TYPE /bic/oimd_son,
*      InfoObject: MD_SOLN Sales Order Line Number.
        /bic/md_soln           TYPE /bic/oimd_soln,
*      InfoObject: MD_PROD Product MD.
        /bic/md_prod           TYPE /bic/oimd_prod,
*      InfoObject: MD_RS Reseller MD.
        /bic/md_rs           TYPE /bic/oimd_rs,
*      InfoObject: MD_EMP Employee.
        /bic/md_emp           TYPE /bic/oimd_emp,
*      InfoObject: MD_PROM Promotion MD.
        /bic/md_prom           TYPE /bic/oimd_prom,
*      InfoObject: MD_CPON Customer Purchase Order Number.
        /bic/md_cpon           TYPE /bic/oimd_cpon,
*      InfoObject: MD_CURR Currency MD.
        /bic/md_curr           TYPE /bic/oimd_curr,
*      InfoObject: MD_FRG Freight Number.
        /bic/md_frg           TYPE /bic/oimd_frg,
*      InfoObject: MD_REVNUM Revision Number.
        /bic/md_revnum           TYPE /bic/oimd_revnum,
*      InfoObject: MD_CTN Carrier Tracking Number.
        /bic/md_ctn           TYPE /bic/oimd_ctn,
      END   OF _ty_g_1.

ENDCLASS.                    "endclass.. "insert your code here


*---------------------------------------------------------------------*
*       CLASS lcl_transform IMPLEMENTATION
*---------------------------------------------------------------------*
*---------------------------------------------------------------------*
CLASS lcl_transform IMPLEMENTATION.

  METHOD execute.
*=== Segments ===
    FIELD-SYMBOLS:
      <_yt_sc_1>            TYPE table,
      <_yt_sc_1_ty>          TYPE _ty_t_sc_1,
      <_ys_sc_1>            TYPE _ty_s_sc_1.
    FIELD-SYMBOLS:
      <_yt_tg_1>            TYPE _ty_t_tg_1,
      <_yth_tg_1>           TYPE _ty_th_tg_1,
      <_ys_tg_1>            TYPE _ty_s_tg_1.

    FIELD-SYMBOLS: <_ys_rimage> TYPE _ty_s_tg_1.

    DATA:
       lr_cx_abort               TYPE REF TO cx_rsrout_abort,
       lr_cx_sy_conversion_error TYPE REF TO cx_sy_conversion_error,
       lr_cx_sy_arithmetic_error TYPE REF TO cx_sy_arithmetic_error,
       lr_cx_root                TYPE REF TO cx_root.
    DATA: lr_cx_rsbk_errorcount TYPE REF TO cx_rsbk_errorcount.
    DATA: l_rx_rsfo_error_in_function TYPE REF TO cx_rsfo_error_in_function,
          l_s_balmsg TYPE bal_s_msg.
    DATA:
       lr_msg_coll               TYPE REF TO cl_rso_msg,
       _skip                     TYPE rs_bool,
       _skip_seg_all             TYPE rs_bool,
       _ls_msg                   TYPE rsmonitor,
       _ls_msg_s                 TYPE rstmonitor,
       _ls_msg_rec               TYPE rstr_ty_s_monitor_rec,
       _lt_msg                   TYPE rstr_ty_t_monitor,
       _lt_msg_s                 TYPE rstr_ty_t_monitors,
       _lt_msg_rec               TYPE rstr_ty_t_monitor_rec,
       _curr_rule                TYPE cl_rstran_runtime_exe=>ty_s_rule_context,
       _ls_supp                  TYPE _r_s_supp.
    DATA:
       l_fieldname               TYPE string.

    FIELD-SYMBOLS:
       <l_record_no>             TYPE any,
       <l_record_all>            TYPE any.

    DATA: l_segid                TYPE rsbk_segid.

    DATA: l_dummy                TYPE c.

    DATA:
      _r_sc_1               TYPE REF TO cl_rsbk_data_segment,
      _rdt_sc_1             TYPE REF TO data.
    DATA:
      _r_tg_1               TYPE REF TO cl_rsbk_data_segment,
      _rds_tg_1             TYPE REF TO data,
      _rdt_tg_1             TYPE REF TO data,
      _rdt_tg_1_dp          TYPE REF TO data.
*=== Step_type specific ===
    DATA:
     l_recno_sc_1 TYPE sy-tabix.

    DATA:
     l_recno_tg_1 TYPE sy-tabix.
*=== Group ===
    DATA:
    _g_1         TYPE _ty_g_1,
    _g_1_subrc   TYPE sysubrc,
    _g_1_tabix   TYPE sytabix,
    _g_1_subrc_2   TYPE sysubrc,
    _g_1_tabix_2   TYPE sytabix,
    _g_1_subrc_3   TYPE sysubrc,
    _g_1_tabix_3   TYPE sytabix.


*=== Step_type specific ===
    DATA:
* definition for conversion exit
    l_chavl_in_c  TYPE rschavl,                             "#EC *
    l_chavl_out_c TYPE rschavl,                             "#EC *
    l_subrc_con   TYPE sy-subrc.                            "#EC *
    DATA:
     l_requid   TYPE cl_rsbk_request=>t_requid,
     l_request  TYPE rsrequest.
    DATA:
     ls_cross         TYPE rsbm_s_crosstab.



    DATA:
      _r_14 TYPE _r_14.
    DATA:
      _r_20 TYPE _r_20.
    DATA:
      _r_22 TYPE _r_22.
    DATA:
      _r_24 TYPE _r_24.
    DATA l_t_fieldnm TYPE rsar_t_fieldnames.
    DATA l_r_request_0001 TYPE REF TO cl_rsbk_request.
    DATA l_errorhandling_0001 TYPE rsbkerrorhandling.
    DATA l_skip_0001 TYPE rs_bool.
    DATA l_r_x TYPE REF TO cx_root.

* ==== 0. initialization
    CREATE OBJECT lr_msg_coll.
* ==== 1. unpack segments
    _r_sc_1              = i_r_inbound->get_segment( 1 ).
    _rdt_sc_1            = _r_sc_1->get_data( i_with_recno = rs_c_true ).
    ASSIGN _rdt_sc_1->* TO <_yt_sc_1>.
    l_fieldname = 'RECORD_ALL'.
    ASSIGN (l_fieldname) TO <l_record_all>.
    IF sy-subrc = 0.
      DESCRIBE TABLE <_yt_sc_1> LINES <l_record_all>.
    ENDIF.



    _r_tg_1              = e_r_outbound->get_segment( 1 ).
    _rdt_tg_1_dp         = _r_tg_1->get_empty_table( ).
    ASSIGN _rdt_tg_1_dp->* TO <_yt_tg_1>.

*   get transformation target list and set in segment
    get_fields_populated0001( IMPORTING e_t_fieldnm = l_t_fieldnm ).
    _r_tg_1->set_t_fields_populated( l_t_fieldnm ).

    _rds_tg_1            = _r_tg_1->get_workarea( ).
    ASSIGN _rds_tg_1->* TO <_ys_tg_1>.
    CREATE DATA _rdt_tg_1 TYPE _ty_th_tg_1.
    ASSIGN _rdt_tg_1->* TO <_yth_tg_1>.

    _curr_rule-tranid  = '0O3HV2JF3M5P7LJO52ZNFFDYZJS0FJ7N'.
    _curr_rule-progid  = '0OUY6JZNKDGX433RUB7Z8MKLJ'.
    _curr_rule-version = '0'.

    cl_rstran_runtime_exe=>get_suppressed_rules( EXPORTING i_tranid = _curr_rule-tranid i_r_data = e_r_outbound i_r_data_in = i_r_inbound IMPORTING e_s_suppressed_rules = _ls_supp ).

*   set attributs
    p_check_master_data_exist = i_master_data_exist.
    p_r_request               = i_r_request.
    l_segid                   = '0001'.

    l_requid = i_r_inbound->n_requid.
    IF l_requid IS NOT INITIAL.
      TRY.
          l_request = cl_rsbk_request=>create_from_db(
             i_requid = l_requid )->get_requid30( ).

        CATCH cx_root INTO l_r_x.
          MESSAGE x299(rsbk).
      ENDTRY.
    ENDIF.


* ==== Debugging ====
* Breakpoint after start routine
    IF i_r_trfn_cmd IS BOUND.
      READ TABLE i_r_trfn_cmd->n_th_bp
         TRANSPORTING NO FIELDS
         WITH TABLE KEY bpid    = 3
                        datapid = i_r_inbound->n_datapakid.
      IF sy-subrc = 0.

* --- Data ---
*     See datapackage below

* --- Debugging ---
        BREAK-POINT.                                           "#EC NOBREAK

      ENDIF.
    ENDIF.



* ==== 2. process data package
    i_r_log->add_substep( 'RULES' ).
    LOOP AT <_yt_sc_1> ASSIGNING <_ys_sc_1>.

      CLEAR:
        _g_1,
        _lt_msg_rec,
        _lt_msg.
      l_recno_sc_1 = <_ys_sc_1>-record.
      _curr_rule-record = l_recno_sc_1.
      IF NOT <l_record_no> IS ASSIGNED.
        IF <_ys_sc_1>-record = 1.
          l_fieldname = 'RECORD_NO'.
          ASSIGN (l_fieldname) TO <l_record_no>.
          IF sy-subrc = 0.
            <l_record_no> = <_ys_sc_1>-record.
          ENDIF.
        ENDIF.
      ELSE.
        <l_record_no> = <_ys_sc_1>-record.
      ENDIF.
      TRY.

* ======  RULES
*<<<    Rule ID: '1'.
          IF _ls_supp-_1 EQ rs_c_false.
            _curr_rule-ruleid = '1'.
*       Step ID: '1', Type: 'DIRECT'.
            _curr_rule-stepid = '1'.
            _g_1-/bic/md_ord = <_ys_sc_1>-/bic/md_ord.
          ENDIF.  "suppressed RULE
*>>>
*<<<    Rule ID: '2'.
          IF _ls_supp-_2 EQ rs_c_false.
            _curr_rule-ruleid = '2'.
*       Step ID: '1', Type: 'DIRECT'.
            _curr_rule-stepid = '1'.
            _g_1-/bic/md_dd = <_ys_sc_1>-/bic/md_dd.
          ENDIF.  "suppressed RULE
*>>>
*<<<    Rule ID: '3'.
          IF _ls_supp-_3 EQ rs_c_false.
            _curr_rule-ruleid = '3'.
*       Step ID: '1', Type: 'DIRECT'.
            _curr_rule-stepid = '1'.
            _g_1-/bic/md_shd = <_ys_sc_1>-/bic/md_shd.
          ENDIF.  "suppressed RULE
*>>>
*<<<    Rule ID: '4'.
          IF _ls_supp-_4 EQ rs_c_false.
            _curr_rule-ruleid = '4'.
*       Step ID: '1', Type: 'DIRECT'.
            _curr_rule-stepid = '1'.
            _g_1-/bic/md_oq = <_ys_sc_1>-/bic/md_oq.
          ENDIF.  "suppressed RULE
*>>>
*<<<    Rule ID: '5'.
          IF _ls_supp-_5 EQ rs_c_false.
            _curr_rule-ruleid = '5'.
*       Step ID: '1', Type: 'DIRECT'.
            _curr_rule-stepid = '1'.
            _g_1-/bic/md_unpr = <_ys_sc_1>-/bic/md_unpr.
*       Step ID: '2', Type: 'DIRECT'.
            _curr_rule-stepid = '2'.
            _g_1-/bic/md_currn = <_ys_sc_1>-/bic/md_currn.
          ENDIF.  "suppressed RULE
*>>>
*<<<    Rule ID: '6'.
          IF _ls_supp-_6 EQ rs_c_false.
            _curr_rule-ruleid = '6'.
*       Step ID: '1', Type: 'DIRECT'.
            _curr_rule-stepid = '1'.
            _g_1-/bic/md_exam = <_ys_sc_1>-/bic/md_exam.
*       Step ID: '2', Type: 'DIRECT'.
            _curr_rule-stepid = '2'.
            _g_1-/bic/md_currn = <_ys_sc_1>-/bic/md_currn.
          ENDIF.  "suppressed RULE
*>>>
*<<<    Rule ID: '7'.
          IF _ls_supp-_7 EQ rs_c_false.
            _curr_rule-ruleid = '7'.
*       Step ID: '1', Type: 'FORMULA'.
            _curr_rule-stepid = '1'.

            CLEAR: sy-msgid, sy-msgty, sy-msgno, sy-msgv1, sy-msgv2, sy-msgv3, sy-msgv4.
            formula__7_1( EXPORTING source_fields = <_ys_sc_1> IMPORTING result = _g_1-/bic/md_disper ).
          ENDIF.  "suppressed RULE
*>>>
*<<<    Rule ID: '8'.
          IF _ls_supp-_8 EQ rs_c_false.
            _curr_rule-ruleid = '8'.
*       Step ID: '1', Type: 'DIRECT'.
            _curr_rule-stepid = '1'.
            _g_1-/bic/md_da = <_ys_sc_1>-/bic/md_da.
*       Step ID: '2', Type: 'DIRECT'.
            _curr_rule-stepid = '2'.
            _g_1-/bic/md_currn = <_ys_sc_1>-/bic/md_currn.
          ENDIF.  "suppressed RULE
*>>>
*<<<    Rule ID: '9'.
          IF _ls_supp-_9 EQ rs_c_false.
            _curr_rule-ruleid = '9'.
*       Step ID: '1', Type: 'DIRECT'.
            _curr_rule-stepid = '1'.
            _g_1-/bic/md_prst = <_ys_sc_1>-/bic/md_prst.
*       Step ID: '2', Type: 'DIRECT'.
            _curr_rule-stepid = '2'.
            _g_1-/bic/md_currn = <_ys_sc_1>-/bic/md_currn.
          ENDIF.  "suppressed RULE
*>>>
*<<<    Rule ID: '10'.
          IF _ls_supp-_10 EQ rs_c_false.
            _curr_rule-ruleid = '10'.
*       Step ID: '1', Type: 'DIRECT'.
            _curr_rule-stepid = '1'.
            _g_1-/bic/md_tpc = <_ys_sc_1>-/bic/md_tpc.
*       Step ID: '2', Type: 'DIRECT'.
            _curr_rule-stepid = '2'.
            _g_1-/bic/md_currn = <_ys_sc_1>-/bic/md_currn.
          ENDIF.  "suppressed RULE
*>>>
*<<<    Rule ID: '11'.
          IF _ls_supp-_11 EQ rs_c_false.
            _curr_rule-ruleid = '11'.
*       Step ID: '1', Type: 'DIRECT'.
            _curr_rule-stepid = '1'.
            _g_1-/bic/md_sa = <_ys_sc_1>-/bic/md_sa.
*       Step ID: '2', Type: 'DIRECT'.
            _curr_rule-stepid = '2'.
            _g_1-/bic/md_currn = <_ys_sc_1>-/bic/md_currn.
          ENDIF.  "suppressed RULE
*>>>
*<<<    Rule ID: '12'.
          IF _ls_supp-_12 EQ rs_c_false.
            _curr_rule-ruleid = '12'.
*       Step ID: '1', Type: 'DIRECT'.
            _curr_rule-stepid = '1'.
            _g_1-/bic/md_ta = <_ys_sc_1>-/bic/md_ta.
*       Step ID: '2', Type: 'DIRECT'.
            _curr_rule-stepid = '2'.
            _g_1-/bic/md_currn = <_ys_sc_1>-/bic/md_currn.
          ENDIF.  "suppressed RULE
*>>>
*<<<    Rule ID: '13'.
          IF _ls_supp-_13 EQ rs_c_false.
            _curr_rule-ruleid = '13'.
*       Step ID: '1', Type: 'DIRECT'.
            _curr_rule-stepid = '1'.
            _g_1-/bic/md_s_ty = <_ys_sc_1>-/bic/md_s_ty.
          ENDIF.  "suppressed RULE
*>>>
*<<<    Rule ID: '14'.
          IF _ls_supp-_14 EQ rs_c_false.
            _curr_rule-ruleid = '14'.
*       Step ID: '1', Type: 'DIRECT'.
            _curr_rule-stepid = '1'.
            _r_14-_1_1 = <_ys_sc_1>-/bic/md_son.
*       Step ID: '2', Type: 'CONVERT'.
            _curr_rule-stepid = '2'.
            CALL 'CONVERSION_EXIT_ALPHA_INPUT'
          ID 'INPUT'  FIELD _r_14-_1_1
          ID 'OUTPUT' FIELD _g_1-/bic/md_son.

            IF _g_1-/bic/md_son <> _r_14-_1_1.
              cl_rstran_runtime_exe=>data_error( EXPORTING i_r_log = i_r_log i_rule_context = _curr_rule i_in = _r_14-_1_1 i_out = _g_1-/bic/md_son EXCEPTIONS too_many_errors = 1 ).
              IF sy-subrc = 1.
                RAISE EXCEPTION TYPE cx_rsrout_abort.
              ENDIF.

              CLEAR _r_14-_1_1.
            ENDIF.
          ENDIF.  "suppressed RULE
*>>>
*<<<    Rule ID: '15'.
          IF _ls_supp-_15 EQ rs_c_false.
            _curr_rule-ruleid = '15'.
*       Step ID: '1', Type: 'DIRECT'.
            _curr_rule-stepid = '1'.
            _g_1-/bic/md_soln = <_ys_sc_1>-/bic/md_soln.
          ENDIF.  "suppressed RULE
*>>>
*<<<    Rule ID: '16'.
          IF _ls_supp-_16 EQ rs_c_false.
            _curr_rule-ruleid = '16'.
*       Step ID: '1', Type: 'DIRECT'.
            _curr_rule-stepid = '1'.
            _g_1-/bic/md_prod = <_ys_sc_1>-/bic/md_prod.
          ENDIF.  "suppressed RULE
*>>>
*<<<    Rule ID: '17'.
          IF _ls_supp-_17 EQ rs_c_false.
            _curr_rule-ruleid = '17'.
*       Step ID: '1', Type: 'DIRECT'.
            _curr_rule-stepid = '1'.
            _g_1-/bic/md_rs = <_ys_sc_1>-/bic/md_rs.
          ENDIF.  "suppressed RULE
*>>>
*<<<    Rule ID: '18'.
          IF _ls_supp-_18 EQ rs_c_false.
            _curr_rule-ruleid = '18'.
*       Step ID: '1', Type: 'DIRECT'.
            _curr_rule-stepid = '1'.
            _g_1-/bic/md_emp = <_ys_sc_1>-/bic/md_emp.
          ENDIF.  "suppressed RULE
*>>>
*<<<    Rule ID: '19'.
          IF _ls_supp-_19 EQ rs_c_false.
            _curr_rule-ruleid = '19'.
*       Step ID: '1', Type: 'DIRECT'.
            _curr_rule-stepid = '1'.
            _g_1-/bic/md_prom = <_ys_sc_1>-/bic/md_prom.
          ENDIF.  "suppressed RULE
*>>>
*<<<    Rule ID: '20'.
          IF _ls_supp-_20 EQ rs_c_false.
            _curr_rule-ruleid = '20'.
*       Step ID: '1', Type: 'DIRECT'.
            _curr_rule-stepid = '1'.
            _r_20-_1_1 = <_ys_sc_1>-/bic/md_cpon.
*       Step ID: '2', Type: 'CONVERT'.
            _curr_rule-stepid = '2'.
            CALL 'CONVERSION_EXIT_ALPHA_INPUT'
          ID 'INPUT'  FIELD _r_20-_1_1
          ID 'OUTPUT' FIELD _g_1-/bic/md_cpon.

            IF _g_1-/bic/md_cpon <> _r_20-_1_1.
              cl_rstran_runtime_exe=>data_error( EXPORTING i_r_log = i_r_log i_rule_context = _curr_rule i_in = _r_20-_1_1 i_out = _g_1-/bic/md_cpon EXCEPTIONS too_many_errors = 1 ).
              IF sy-subrc = 1.
                RAISE EXCEPTION TYPE cx_rsrout_abort.
              ENDIF.

              CLEAR _r_20-_1_1.
            ENDIF.
          ENDIF.  "suppressed RULE
*>>>
*<<<    Rule ID: '21'.
          IF _ls_supp-_21 EQ rs_c_false.
            _curr_rule-ruleid = '21'.
*       Step ID: '1', Type: 'DIRECT'.
            _curr_rule-stepid = '1'.
            _g_1-/bic/md_curr = <_ys_sc_1>-/bic/md_curr.
          ENDIF.  "suppressed RULE
*>>>
*<<<    Rule ID: '22'.
          IF _ls_supp-_22 EQ rs_c_false.
            _curr_rule-ruleid = '22'.
*       Step ID: '1', Type: 'DIRECT'.
            _curr_rule-stepid = '1'.
            _r_22-_1_1 = <_ys_sc_1>-/bic/md_frg.
*       Step ID: '2', Type: 'CONVERT'.
            _curr_rule-stepid = '2'.
            CALL 'CONVERSION_EXIT_ALPHA_INPUT'
          ID 'INPUT'  FIELD _r_22-_1_1
          ID 'OUTPUT' FIELD _g_1-/bic/md_frg.

            IF _g_1-/bic/md_frg <> _r_22-_1_1.
              cl_rstran_runtime_exe=>data_error( EXPORTING i_r_log = i_r_log i_rule_context = _curr_rule i_in = _r_22-_1_1 i_out = _g_1-/bic/md_frg EXCEPTIONS too_many_errors = 1 ).
              IF sy-subrc = 1.
                RAISE EXCEPTION TYPE cx_rsrout_abort.
              ENDIF.

              CLEAR _r_22-_1_1.
            ENDIF.
          ENDIF.  "suppressed RULE
*>>>
*<<<    Rule ID: '23'.
          IF _ls_supp-_23 EQ rs_c_false.
            _curr_rule-ruleid = '23'.
*       Step ID: '1', Type: 'DIRECT'.
            _curr_rule-stepid = '1'.
            _g_1-/bic/md_revnum = <_ys_sc_1>-/bic/md_revnum.
          ENDIF.  "suppressed RULE
*>>>
*<<<    Rule ID: '24'.
          IF _ls_supp-_24 EQ rs_c_false.
            _curr_rule-ruleid = '24'.
*       Step ID: '1', Type: 'DIRECT'.
            _curr_rule-stepid = '1'.
            _r_24-_1_1 = <_ys_sc_1>-/bic/md_ctn.
*       Step ID: '2', Type: 'CONVERT'.
            _curr_rule-stepid = '2'.
            CALL 'CONVERSION_EXIT_ALPHA_INPUT'
          ID 'INPUT'  FIELD _r_24-_1_1
          ID 'OUTPUT' FIELD _g_1-/bic/md_ctn.

            IF _g_1-/bic/md_ctn <> _r_24-_1_1.
              cl_rstran_runtime_exe=>data_error( EXPORTING i_r_log = i_r_log i_rule_context = _curr_rule i_in = _r_24-_1_1 i_out = _g_1-/bic/md_ctn EXCEPTIONS too_many_errors = 1 ).
              IF sy-subrc = 1.
                RAISE EXCEPTION TYPE cx_rsrout_abort.
              ENDIF.

              CLEAR _r_24-_1_1.
            ENDIF.
          ENDIF.  "suppressed RULE
*>>>
*<<<    Rule ID: '25'.
          IF _ls_supp-_25 EQ rs_c_false.
            _curr_rule-ruleid = '25'.
*       Step ID: '1', Type: 'FORMULA'.
            _curr_rule-stepid = '1'.

            CLEAR: sy-msgid, sy-msgty, sy-msgno, sy-msgv1, sy-msgv2, sy-msgv3, sy-msgv4.
            formula__25_1( EXPORTING source_fields = <_ys_sc_1> IMPORTING result = _g_1-/bic/md_npf ).
*       Step ID: '2', Type: 'DIRECT'.
            _curr_rule-stepid = '2'.
            _g_1-/bic/md_currn = <_ys_sc_1>-/bic/md_currn.
          ENDIF.  "suppressed RULE
*>>>
*<<<    Rule ID: '26'.
          IF _ls_supp-_26 EQ rs_c_false.
            _curr_rule-ruleid = '26'.
*       Step ID: '1', Type: 'ROUTINE'.
            _curr_rule-stepid = '1'.
            CLEAR: _lt_msg,
             _g_1-/bic/md_gpf.

            TRY.
                compute_26_1( EXPORTING request = l_request datapackid = i_r_inbound->n_datapakid source_fields = <_ys_sc_1> segid = l_segid IMPORTING result = _g_1-/bic/md_gpf monitor = _lt_msg ).

                IF _lt_msg[] IS NOT INITIAL.
                  _ls_msg_rec-ruleid   = _curr_rule-ruleid.
                  _ls_msg_rec-stepid   = _curr_rule-stepid.
                  _ls_msg_rec-_s-recno = _curr_rule-record.
                  LOOP AT _lt_msg INTO _ls_msg.
                    MOVE-CORRESPONDING _ls_msg TO _ls_msg_rec-_s.
                    APPEND _ls_msg_rec TO _lt_msg_rec.
                  ENDLOOP.
                  CLEAR: _lt_msg[].
                ENDIF.
              CATCH cx_rsrout_skip_val.
                CLEAR _g_1-/bic/md_gpf.
            ENDTRY.

*       Step ID: '2', Type: 'DIRECT'.
            _curr_rule-stepid = '2'.
            _g_1-/bic/md_currn = <_ys_sc_1>-/bic/md_currn.
          ENDIF.  "suppressed RULE
*>>>
*<<<    Rule ID: '27'.
          IF _ls_supp-_27 EQ rs_c_false.
            _curr_rule-ruleid = '27'.
*       Step ID: '1', Type: 'CONSTANT'.
            _curr_rule-stepid = '1'.
            _g_1-/bic/md_cnt = '1'.
          ENDIF.  "suppressed RULE
*>>>

          IF _lt_msg_rec IS NOT INITIAL.
            cl_rstran_runtime_exe=>message_proxy( EXPORTING i_r_log = i_r_log i_rule_context = _curr_rule i_seg_id = `1` i_s_data = <_ys_sc_1> CHANGING c_t_msg = _lt_msg_rec ).
          ENDIF.

        CATCH cx_rsrout_skip_record INTO lr_cx_root.
          _skip_seg_all = rs_c_true.
          IF _lt_msg[] IS NOT INITIAL.
            _ls_msg_rec-ruleid   = _curr_rule-ruleid.
            _ls_msg_rec-stepid   = _curr_rule-stepid.
            _ls_msg_rec-_s-recno = _curr_rule-record.
            LOOP AT _lt_msg INTO _ls_msg.
              MOVE-CORRESPONDING _ls_msg TO _ls_msg_rec-_s.
              APPEND _ls_msg_rec TO _lt_msg_rec.
            ENDLOOP.
          ENDIF.
          IF _lt_msg_rec IS NOT INITIAL.
            cl_rstran_runtime_exe=>message_proxy( EXPORTING i_r_log = i_r_log i_cx_root = lr_cx_root i_rule_context = _curr_rule i_seg_id = `1` i_s_data = <_ys_sc_1> CHANGING c_t_msg = _lt_msg_rec ).
          ENDIF.

        CATCH cx_rsfo_skip_record INTO lr_cx_root.
          _skip_seg_all = rs_c_true.

        CATCH cx_rsfo_skip_record_as_error INTO lr_cx_root.
          _skip_seg_all = rs_c_true.
          cl_rstran_runtime_exe=>message_proxy( EXPORTING i_r_log = i_r_log i_cx_root = lr_cx_root i_rule_context = _curr_rule i_seg_id = `1` i_s_data = <_ys_sc_1> CHANGING c_t_msg = _lt_msg_rec ).

        CATCH cx_rsbk_errorcount INTO lr_cx_rsbk_errorcount.
*         errorcount can't be determined
          _skip_seg_all = rs_c_true.
          CALL FUNCTION 'RS_EXCEPTION_TO_SYMSG'
            EXPORTING
              i_r_exception = lr_cx_rsbk_errorcount
*             I_DEEPEST           =
                    .
          MOVE-CORRESPONDING syst TO _ls_msg_rec-_s.
          _ls_msg_rec-_s-skipped = rs_c_true.
          APPEND _ls_msg_rec TO _lt_msg_rec.
          cl_rstran_runtime_exe=>message_proxy( EXPORTING i_r_log = i_r_log i_rule_context = _curr_rule i_seg_id = `1` i_s_data = <_ys_sc_1> CHANGING c_t_msg = _lt_msg_rec ).

        CATCH cx_foev_error_in_function INTO lr_cx_root.            "HW 980549
          _skip_seg_all = rs_c_true.
          CLEAR _ls_msg_rec.
          _ls_msg_rec-ruleid   = _curr_rule-ruleid.
          _ls_msg_rec-stepid   = _curr_rule-stepid.
          _ls_msg_rec-_s-recno = _curr_rule-record.

          TRY.
              l_rx_rsfo_error_in_function ?= lr_cx_root.
              l_rx_rsfo_error_in_function->get_message( IMPORTING e_s_msg = l_s_balmsg ).
              MOVE-CORRESPONDING l_s_balmsg TO _ls_msg_rec-_s.
              APPEND _ls_msg_rec TO _lt_msg_rec.
            CATCH cx_sy_move_cast_error.
          ENDTRY.

          MESSAGE e535(rsar)
            WITH _curr_rule-ruleid _curr_rule-record
            INTO _ls_msg_rec-_s-msgty.
          MOVE-CORRESPONDING syst TO _ls_msg_rec-_s.
          _ls_msg_rec-_s-skipped = rs_c_true.
          APPEND _ls_msg_rec TO _lt_msg_rec.
          cl_rstran_runtime_exe=>message_proxy( EXPORTING i_r_log = i_r_log i_rule_context = _curr_rule i_seg_id = `1` i_s_data = <_ys_sc_1> CHANGING c_t_msg = _lt_msg_rec ).

        CATCH cx_sy_arithmetic_error INTO lr_cx_sy_arithmetic_error.
          _skip_seg_all = rs_c_true.
          cl_rstran_runtime_exe=>message_proxy( EXPORTING i_r_log = i_r_log i_cx_sy_arithmetic_error = lr_cx_sy_arithmetic_error i_rule_context = _curr_rule i_seg_id = `1` i_s_data = <_ys_sc_1> ).

        CATCH cx_sy_conversion_error  INTO lr_cx_sy_conversion_error.
          _skip_seg_all = rs_c_true.
          cl_rstran_runtime_exe=>message_proxy( EXPORTING i_r_log = i_r_log i_cx_sy_conversion_error = lr_cx_sy_conversion_error i_rule_context = _curr_rule i_seg_id = `1` i_s_data = <_ys_sc_1> ).

        CATCH cx_root INTO lr_cx_root.
          _skip_seg_all = rs_c_true.
*--       all other cases handled by message proxy
          IF _lt_msg[] IS NOT INITIAL.
            _ls_msg_rec-ruleid   = _curr_rule-ruleid.
            _ls_msg_rec-stepid   = _curr_rule-stepid.
            _ls_msg_rec-_s-recno = _curr_rule-record.
            LOOP AT _lt_msg INTO _ls_msg.
              MOVE-CORRESPONDING _ls_msg TO _ls_msg_rec-_s.
              APPEND _ls_msg_rec TO _lt_msg_rec.
            ENDLOOP.
          ENDIF.

          cl_rstran_runtime_exe=>message_proxy( EXPORTING i_r_log = i_r_log i_cx_root = lr_cx_root i_rule_context = _curr_rule i_seg_id = `1` i_s_data = <_ys_sc_1> CHANGING c_t_msg = _lt_msg_rec ).

      ENDTRY.       "RECORD

* =====  PUT groups to target
      IF _skip_seg_all IS INITIAL.

        READ TABLE <_yth_tg_1>
      WITH TABLE KEY
       /bic/md_currn              = _g_1-/bic/md_currn
       /bic/md_ord              = _g_1-/bic/md_ord
       /bic/md_dd              = _g_1-/bic/md_dd
       /bic/md_shd              = _g_1-/bic/md_shd
       /bic/md_s_ty              = _g_1-/bic/md_s_ty
       /bic/md_son              = _g_1-/bic/md_son
       /bic/md_soln              = _g_1-/bic/md_soln
       /bic/md_prod              = _g_1-/bic/md_prod
       /bic/md_rs              = _g_1-/bic/md_rs
       /bic/md_emp              = _g_1-/bic/md_emp
       /bic/md_prom              = _g_1-/bic/md_prom
       /bic/md_cpon              = _g_1-/bic/md_cpon
       /bic/md_curr              = _g_1-/bic/md_curr
       /bic/md_frg              = _g_1-/bic/md_frg
       /bic/md_revnum              = _g_1-/bic/md_revnum
       /bic/md_ctn              = _g_1-/bic/md_ctn
       ASSIGNING <_ys_tg_1>.
        _g_1_subrc = sy-subrc.
        _g_1_tabix = sy-tabix.

        IF _g_1_subrc = 0.
*   aggregation SUM
          <_ys_tg_1>-/bic/md_oq = <_ys_tg_1>-/bic/md_oq + _g_1-/bic/md_oq.
          <_ys_tg_1>-/bic/md_unpr = <_ys_tg_1>-/bic/md_unpr + _g_1-/bic/md_unpr.
          <_ys_tg_1>-/bic/md_exam = <_ys_tg_1>-/bic/md_exam + _g_1-/bic/md_exam.
          <_ys_tg_1>-/bic/md_disper = <_ys_tg_1>-/bic/md_disper + _g_1-/bic/md_disper.
          <_ys_tg_1>-/bic/md_da = <_ys_tg_1>-/bic/md_da + _g_1-/bic/md_da.
          <_ys_tg_1>-/bic/md_prst = <_ys_tg_1>-/bic/md_prst + _g_1-/bic/md_prst.
          <_ys_tg_1>-/bic/md_tpc = <_ys_tg_1>-/bic/md_tpc + _g_1-/bic/md_tpc.
          <_ys_tg_1>-/bic/md_sa = <_ys_tg_1>-/bic/md_sa + _g_1-/bic/md_sa.
          <_ys_tg_1>-/bic/md_ta = <_ys_tg_1>-/bic/md_ta + _g_1-/bic/md_ta.
          <_ys_tg_1>-/bic/md_npf = <_ys_tg_1>-/bic/md_npf + _g_1-/bic/md_npf.
          <_ys_tg_1>-/bic/md_gpf = <_ys_tg_1>-/bic/md_gpf + _g_1-/bic/md_gpf.
          <_ys_tg_1>-/bic/md_cnt = <_ys_tg_1>-/bic/md_cnt + _g_1-/bic/md_cnt.
          ls_cross-insegid      = 1.
          ls_cross-inrecord     = l_recno_sc_1.
          ls_cross-outsegid     = 1.
          ls_cross-outrecord    = <_ys_tg_1>-record.

          i_r_log->add_cross_tab( EXPORTING i_s_crosstab = ls_cross ).

        ELSE.
          ASSIGN _rds_tg_1->* TO <_ys_tg_1>.
          CLEAR <_ys_tg_1>.
          MOVE-CORRESPONDING _g_1 TO <_ys_tg_1>.
          <_ys_tg_1>-requid    = l_requid.
          l_recno_tg_1          = l_recno_tg_1 + 1.
          ls_cross-insegid      = 1.
          ls_cross-inrecord     = l_recno_sc_1.
          ls_cross-outsegid     = 1.
          ls_cross-outrecord    = l_recno_tg_1.

          i_r_log->add_cross_tab( EXPORTING i_s_crosstab = ls_cross ).

**     Record# in target = sy-tabix - if sorting of table won't be changed
          <_ys_tg_1>-record     = l_recno_tg_1.

          INSERT <_ys_tg_1> INTO TABLE <_yth_tg_1>.
          IF sy-subrc <> 0.
            cl_rsbm_log_step=>raise_step_failed_callstack( ).
          ENDIF.

        ENDIF.      "Read table
*
      ENDIF.
      CLEAR _skip_seg_all.
    ENDLOOP.
* -------- insert table into outbound segment ----

    <_yt_tg_1>[] = <_yth_tg_1>[].
    CLEAR _rdt_tg_1.
    FREE <_yth_tg_1>[].

* ==== Debugging ====
* Breakpoint before end routine
    IF i_r_trfn_cmd IS BOUND.
      READ TABLE i_r_trfn_cmd->n_th_bp
         TRANSPORTING NO FIELDS
         WITH TABLE KEY bpid    = 4
                        datapid = i_r_inbound->n_datapakid.
      IF sy-subrc = 0.

* --- Data ---
*     See datapackage above..

* --- Debugging ---
        BREAK-POINT.                                           "#EC NOBREAK

      ENDIF.
    ENDIF.



    IF l_requid NE 0.


*-- get the request
      TRY.
          cl_rsbk_request=>create_from_db( EXPORTING i_requid = l_requid RECEIVING r_r_request = l_r_request_0001 ).
        CATCH cx_rs_not_found.
      ENDTRY.
*-- get the error handling setting from the request
      TRY.
          l_r_request_0001->get_errorhandling( RECEIVING r_errorhandling = l_errorhandling_0001 ).
        CATCH cx_rs_access_error.
      ENDTRY.
*-- only in case of error handling on
      IF l_errorhandling_0001 NE rsbc_c_errorhandling-off.
        LOOP AT <_yt_tg_1> ASSIGNING <_ys_tg_1>.
          i_r_log->verify_record( EXPORTING i_segid = 1 i_record = <_ys_tg_1>-record i_use_crosstab = rs_c_true RECEIVING r_skip = l_skip_0001 EXCEPTIONS too_many_errors = 1 not_in_crosstab = 2 OTHERS = 3 ).
          IF sy-subrc <> 0.
*-- too many errors/ not in crosstab abort
            CALL FUNCTION 'RS_SYMESSAGE_TO_EXCEPTION'
                    EXPORTING
                      i_exception   = 'CX_RS_MSG'
                    IMPORTING
                      e_r_exception = lr_cx_root.
            cl_rsbm_log_step=>raise_step_failed_callstack( EXPORTING i_previous = lr_cx_root ).
          ELSEIF NOT l_skip_0001 IS INITIAL.
            DELETE <_yt_tg_1>.
          ENDIF.
        ENDLOOP.
      ENDIF.
    ENDIF.

    _r_tg_1->insert_table( _rdt_tg_1_dp ).
  ENDMETHOD.                 "execute

  METHOD get_fields_populated0001.

    APPEND '/BIC/MD_ORD' TO e_t_fieldnm.
    APPEND '/BIC/MD_DD' TO e_t_fieldnm.
    APPEND '/BIC/MD_SHD' TO e_t_fieldnm.
    APPEND '/BIC/MD_OQ' TO e_t_fieldnm.
    APPEND '/BIC/MD_UNPR' TO e_t_fieldnm.
    APPEND '/BIC/MD_CURRN' TO e_t_fieldnm.
    APPEND '/BIC/MD_EXAM' TO e_t_fieldnm.
    APPEND '/BIC/MD_DISPER' TO e_t_fieldnm.
    APPEND '/BIC/MD_NPF' TO e_t_fieldnm.
    APPEND '/BIC/MD_DA' TO e_t_fieldnm.
    APPEND '/BIC/MD_PRST' TO e_t_fieldnm.
    APPEND '/BIC/MD_TPC' TO e_t_fieldnm.
    APPEND '/BIC/MD_SA' TO e_t_fieldnm.
    APPEND '/BIC/MD_TA' TO e_t_fieldnm.
    APPEND '/BIC/MD_S_TY' TO e_t_fieldnm.
    APPEND '/BIC/MD_SON' TO e_t_fieldnm.
    APPEND '/BIC/MD_SOLN' TO e_t_fieldnm.
    APPEND '/BIC/MD_PROD' TO e_t_fieldnm.
    APPEND '/BIC/MD_RS' TO e_t_fieldnm.
    APPEND '/BIC/MD_EMP' TO e_t_fieldnm.
    APPEND '/BIC/MD_PROM' TO e_t_fieldnm.
    APPEND '/BIC/MD_CPON' TO e_t_fieldnm.
    APPEND '/BIC/MD_CURR' TO e_t_fieldnm.
    APPEND '/BIC/MD_FRG' TO e_t_fieldnm.
    APPEND '/BIC/MD_REVNUM' TO e_t_fieldnm.
    APPEND '/BIC/MD_CTN' TO e_t_fieldnm.
    APPEND '/BIC/MD_GPF' TO e_t_fieldnm.
    APPEND '/BIC/MD_CNT' TO e_t_fieldnm.

  ENDMETHOD.


  METHOD formula__7_1.
******************************************************
*This ABAP Code was generated automatically          *
*Formula Calculator                                  *
******************************************************
*Generated :2025:06:06-12:06
*User: DUMMY
******************************************************
*
*Data definition:
    DATA: l_arg1  TYPE f.
*Calculation:
    l_arg1  = source_fields-/bic/md_disper * 100.
    result = l_arg1.
  ENDMETHOD.                    "FORMULA__7_1

  METHOD formula__25_1.
******************************************************
*This ABAP Code was generated automatically          *
*Formula Calculator                                  *
******************************************************
*Generated :2025:06:06-12:06
*User: DUMMY
******************************************************
*
*Data definition:
    DATA: l_arg1  TYPE p LENGTH 16 DECIMALS 2.
    DATA: l_arg2  TYPE p LENGTH 16 DECIMALS 2.
*Calculation:
    l_arg1  = source_fields-/bic/md_exam - source_fields-/bic/md_tpc.
    l_arg2  = l_arg1  - source_fields-/bic/md_ta.
    result = l_arg2.
  ENDMETHOD.                    "FORMULA__25_1

*----------------------------------------------------------------------*
*       Method compute_26_1
*----------------------------------------------------------------------*
*       This subroutine allows the mapping from source to target fields
*       of a transformation rule using ABAP for application specific
*       coding.
*----------------------------------------------------------------------*
*       Customer comment:
*----------------------------------------------------------------------*
  METHOD compute_26_1.

*   IMPORTING
*     request     type rsrequest
*     datapackid  type rsdatapid
*     SOURCE_FIELDS-/BIC/MD_CURRN TYPE /BIC/OIMD_CURRN
*     SOURCE_FIELDS-/BIC/MD_EXAM TYPE /BIC/OIMD_EXAM
*     SOURCE_FIELDS-/BIC/MD_TPC TYPE /BIC/OIMD_TPC
*    EXPORTING
*      RESULT type _ty_s_TG_1-/BIC/MD_GPF

    DATA:
      monitor_rec    TYPE rsmonitor. "insert your code here
*--  fill table "MONITOR" with values of structure "MONITOR_REC"
*-   to make monitor entries.. "to cancel the update process
*    raise exception type CX_RSROUT_ABORT... "to skip a record"
*    raise exception type CX_RSROUT_SKIP_RECORD... "to clear target fields
*    raise exception type CX_RSROUT_SKIP_VAL.

     " Calculate the Gross Profit Amount (/BIC/MD_GPF)
"Formula: Gross Sales (/BIC/MD_EXAM) - Cost of Goods Sold (/BIC/MD_TPC)
    result = source_fields-/bic/md_exam - source_fields-/bic/md_tpc.


  ENDMETHOD.                    "compute_26_1
  METHOD invert_26_1.

*   IMPORTING
*     i_r_selset_outbound          TYPE REF TO cl_rsmds_set
*     i_th_fields_outbound         TYPE HASHED TABLE
*     i_r_selset_outbound_complete TYPE REF TO cl_rsmds_set
*     i_r_universe_inbound         TYPE REF TO cl_rsmds_universe
*   CHANGING
*     c_r_selset_inbound           TYPE REF TO cl_rsmds_set
*     c_th_fields_inbound          TYPE HASHED TABLE
*     c_exact                      TYPE rs_bool

*$*$ begin of inverse routine - insert your code only below this line*-*.. "insert your code here
*$*$ end of inverse routine - insert your code only before this line *-*

  ENDMETHOD.                    "invert_26_1


ENDCLASS.                    "lcl_transform IMPLEMENTATION

*&--------------------------------------------------------------------*
*&      Form  get_runtime_ref
*&--------------------------------------------------------------------*
*       text
*---------------------------------------------------------------------*
*      -->C_R_EXE    text
*---------------------------------------------------------------------*
FORM get_runtime_ref
  CHANGING c_r_exe  TYPE REF TO object.

*-- singelton instance
  STATICS s_r_exe TYPE REF TO lcl_transform.

  IF s_r_exe IS NOT BOUND.
    CREATE OBJECT s_r_exe.
  ENDIF.
  c_r_exe = s_r_exe.

ENDFORM.                    "get_runtime_ref
