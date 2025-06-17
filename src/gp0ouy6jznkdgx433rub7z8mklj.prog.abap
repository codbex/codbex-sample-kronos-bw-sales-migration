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
program RSTRAN_MASTER_TMPL.


*---------------------------------------------------------------------*
*       CLASS lcl_transform DEFINITION
*---------------------------------------------------------------------*
*
*---------------------------------------------------------------------*
class lcl_transform definition.

  public  section.

    type-pools: rstr.

    TYPES:
      BEGIN OF _ty_s_SC_1,
*      InfoObject: MD_PROD Product MD.
        /BIC/MD_PROD           TYPE /BIC/OIMD_PROD,
*      InfoObject: MD_RS Reseller MD.
        /BIC/MD_RS           TYPE /BIC/OIMD_RS,
*      InfoObject: MD_EMP Employee.
        /BIC/MD_EMP           TYPE /BIC/OIMD_EMP,
*      InfoObject: MD_PROM Promotion MD.
        /BIC/MD_PROM           TYPE /BIC/OIMD_PROM,
*      InfoObject: MD_S_TY Sales Territory MD.
        /BIC/MD_S_TY           TYPE /BIC/OIMD_S_TY,
*      InfoObject: MD_CPON Customer Purchase Order Number.
        /BIC/MD_CPON           TYPE /BIC/OIMD_CPON,
*      InfoObject: MD_CURR Currency MD.
        /BIC/MD_CURR           TYPE /BIC/OIMD_CURR,
*      InfoObject: MD_SON Sales Order Number.
        /BIC/MD_SON           TYPE /BIC/OIMD_SON,
*      InfoObject: MD_SOLN Sales Order Line Number.
        /BIC/MD_SOLN           TYPE /BIC/OIMD_SOLN,
*      InfoObject: MD_FRG Freight Number.
        /BIC/MD_FRG           TYPE /BIC/OIMD_FRG,
*      InfoObject: MD_REVNUM Revision Number.
        /BIC/MD_REVNUM           TYPE /BIC/OIMD_REVNUM,
*      InfoObject: MD_CTN Carrier Tracking Number.
        /BIC/MD_CTN           TYPE /BIC/OIMD_CTN,
*      InfoObject: MD_ORD Order Date.
        /BIC/MD_ORD           TYPE /BIC/OIMD_ORD,
*      InfoObject: MD_DD Due Date.
        /BIC/MD_DD           TYPE /BIC/OIMD_DD,
*      InfoObject: MD_SHD Ship Date.
        /BIC/MD_SHD           TYPE /BIC/OIMD_SHD,
*      InfoObject: MD_OQ Order Quantity.
        /BIC/MD_OQ           TYPE /BIC/OIMD_OQ,
*      InfoObject: MD_UNPR Unit Price.
        /BIC/MD_UNPR           TYPE /BIC/OIMD_UNPR,
*      InfoObject: MD_CURRN Currency Unit.
        /BIC/MD_CURRN           TYPE /BIC/OIMD_CURRN,
*      InfoObject: MD_EXAM Gross Sales Revenue (GSR).
        /BIC/MD_EXAM           TYPE /BIC/OIMD_EXAM,
*      InfoObject: MD_DISPER Discount Percentage.
        /BIC/MD_DISPER           TYPE /BIC/OIMD_DISPER,
*      InfoObject: MD_DA Discount Amount.
        /BIC/MD_DA           TYPE /BIC/OIMD_DA,
*      InfoObject: MD_PRST Product Standard Cost.
        /BIC/MD_PRST           TYPE /BIC/OIMD_PRST,
*      InfoObject: MD_TPC Cost of Goods Sold (COGS).
        /BIC/MD_TPC           TYPE /BIC/OIMD_TPC,
*      InfoObject: MD_SA Net Sales Revenue (NSR).
        /BIC/MD_SA           TYPE /BIC/OIMD_SA,
*      InfoObject: MD_TA Tax Amount.
        /BIC/MD_TA           TYPE /BIC/OIMD_TA,
*      Field: RECORD Data record number.
        RECORD           TYPE RSARECORD,
      END   OF _ty_s_SC_1.
    TYPES:
      _ty_t_SC_1        TYPE STANDARD TABLE OF _ty_s_SC_1
                        WITH NON-UNIQUE DEFAULT KEY.
    TYPES:
      BEGIN OF _ty_s_TG_1,
*      InfoObject: 0CHNGID Change Run ID.
        CHNGID           TYPE /BI0/OICHNGID,
*      InfoObject: 0RECORDTP Record type.
        RECORDTP           TYPE /BI0/OIRECORDTP,
*      InfoObject: 0REQUID Request ID.
        REQUID           TYPE /BI0/OIREQUID,
*      InfoObject: MD_ORD Order Date.
        /BIC/MD_ORD           TYPE /BIC/OIMD_ORD,
*      InfoObject: MD_DD Due Date.
        /BIC/MD_DD           TYPE /BIC/OIMD_DD,
*      InfoObject: MD_SHD Ship Date.
        /BIC/MD_SHD           TYPE /BIC/OIMD_SHD,
*      InfoObject: MD_OQ Order Quantity.
        /BIC/MD_OQ           TYPE /BIC/OIMD_OQ,
*      InfoObject: MD_UNPR Unit Price.
        /BIC/MD_UNPR           TYPE /BIC/OIMD_UNPR,
*      InfoObject: MD_CURRN Currency Unit.
        /BIC/MD_CURRN           TYPE /BIC/OIMD_CURRN,
*      InfoObject: MD_EXAM Gross Sales Revenue (GSR).
        /BIC/MD_EXAM           TYPE /BIC/OIMD_EXAM,
*      InfoObject: MD_DISPER Discount Percentage.
        /BIC/MD_DISPER           TYPE /BIC/OIMD_DISPER,
*      InfoObject: MD_NPF Net Profit Amount.
        /BIC/MD_NPF           TYPE /BIC/OIMD_NPF,
*      InfoObject: MD_DA Discount Amount.
        /BIC/MD_DA           TYPE /BIC/OIMD_DA,
*      InfoObject: MD_PRST Product Standard Cost.
        /BIC/MD_PRST           TYPE /BIC/OIMD_PRST,
*      InfoObject: MD_TPC Cost of Goods Sold (COGS).
        /BIC/MD_TPC           TYPE /BIC/OIMD_TPC,
*      InfoObject: MD_SA Net Sales Revenue (NSR).
        /BIC/MD_SA           TYPE /BIC/OIMD_SA,
*      InfoObject: MD_TA Tax Amount.
        /BIC/MD_TA           TYPE /BIC/OIMD_TA,
*      InfoObject: MD_S_TY Sales Territory MD.
        /BIC/MD_S_TY           TYPE /BIC/OIMD_S_TY,
*      InfoObject: MD_SON Sales Order Number.
        /BIC/MD_SON           TYPE /BIC/OIMD_SON,
*      InfoObject: MD_SOLN Sales Order Line Number.
        /BIC/MD_SOLN           TYPE /BIC/OIMD_SOLN,
*      InfoObject: MD_PROD Product MD.
        /BIC/MD_PROD           TYPE /BIC/OIMD_PROD,
*      InfoObject: MD_RS Reseller MD.
        /BIC/MD_RS           TYPE /BIC/OIMD_RS,
*      InfoObject: MD_EMP Employee.
        /BIC/MD_EMP           TYPE /BIC/OIMD_EMP,
*      InfoObject: MD_PROM Promotion MD.
        /BIC/MD_PROM           TYPE /BIC/OIMD_PROM,
*      InfoObject: MD_CPON Customer Purchase Order Number.
        /BIC/MD_CPON           TYPE /BIC/OIMD_CPON,
*      InfoObject: MD_CURR Currency MD.
        /BIC/MD_CURR           TYPE /BIC/OIMD_CURR,
*      InfoObject: MD_FRG Freight Number.
        /BIC/MD_FRG           TYPE /BIC/OIMD_FRG,
*      InfoObject: MD_REVNUM Revision Number.
        /BIC/MD_REVNUM           TYPE /BIC/OIMD_REVNUM,
*      InfoObject: MD_CTN Carrier Tracking Number.
        /BIC/MD_CTN           TYPE /BIC/OIMD_CTN,
*      InfoObject: MD_GPF Gross Profit Amount.
        /BIC/MD_GPF           TYPE /BIC/OIMD_GPF,
*      InfoObject: MD_CNT Count.
        /BIC/MD_CNT           TYPE /BIC/OIMD_CNT,
*      Field: RECORD Data record number.
        RECORD           TYPE RSARECORD,
      END   OF _ty_s_TG_1.
    TYPES:
      _ty_th_TG_1        TYPE HASHED TABLE OF _ty_s_TG_1
                        WITH UNIQUE KEY
                          /BIC/MD_ORD
                          /BIC/MD_DD
                          /BIC/MD_SHD
                          /BIC/MD_CURRN
                          /BIC/MD_S_TY
                          /BIC/MD_SON
                          /BIC/MD_SOLN
                          /BIC/MD_PROD
                          /BIC/MD_RS
                          /BIC/MD_EMP
                          /BIC/MD_PROM
                          /BIC/MD_CPON
                          /BIC/MD_CURR
                          /BIC/MD_FRG
                          /BIC/MD_REVNUM
                          /BIC/MD_CTN.
    TYPES:
      _ty_t_TG_1        TYPE STANDARD TABLE OF _ty_s_TG_1
                        WITH NON-UNIQUE DEFAULT KEY.
    types:
    begin of _R_14,
        _1_1           TYPE /BIC/OIMD_SON,

      end of _R_14.
    types:
    begin of _R_20,
        _1_1           TYPE /BIC/OIMD_CPON,

      end of _R_20.
    types:
    begin of _R_22,
        _1_1           TYPE /BIC/OIMD_FRG,

      end of _R_22.
    types:
    begin of _R_24,
        _1_1           TYPE /BIC/OIMD_CTN,

      end of _R_24.
    Data:
      p_check_master_data_exist type RSODSOCHECKONLY read-only,
      p_r_request               type ref to if_rsbk_request_admintab_view read-only.

    methods:
    execute
    importing
      i_master_data_exist type RSODSOCHECKONLY
      i_r_inbound         type ref to cl_rsbk_data
      i_r_log             type ref to cl_rsbm_log_cursor_step
      i_r_request         type ref to if_rsbk_request_admintab_view OPTIONAL
      i_r_trfn_cmd        type ref to CL_RSBK_CMD_T OPTIONAL
    exporting
      e_r_outbound        type ref to cl_rsbk_data
    RAISING
      cx_rs_step_failed.


    METHODS
      FORMULA__7_1

        IMPORTING
          SOURCE_FIELDS              type _ty_s_SC_1
        EXPORTING
          RESULT                   type _ty_s_TG_1-/BIC/MD_DISPER.

    METHODS
      FORMULA__25_1

        IMPORTING
          SOURCE_FIELDS              type _ty_s_SC_1
        EXPORTING
          RESULT                   type _ty_s_TG_1-/BIC/MD_NPF.
... "insert your code here


    METHODS
      compute_26_1
        IMPORTING
          request                  type rsrequest
          datapackid               type rsdatapid
          SOURCE_FIELDS              type _ty_s_SC_1
          segid                    type RSBK_SEGID
        EXPORTING
          RESULT                   type _ty_s_TG_1-/BIC/MD_GPF
          monitor                  type rstr_ty_t_monitor
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

  private section.

    type-pools: rsd, rrsv, rstr.

*   Flag structure for dynamic rule suppression
    types:
  begin of _r_s_supp,
      _1                    type rs_bool,
      _2                    type rs_bool,
      _3                    type rs_bool,
      _4                    type rs_bool,
      _5                    type rs_bool,
      _6                    type rs_bool,
      _7                    type rs_bool,
      _8                    type rs_bool,
      _9                    type rs_bool,
      _10                   type rs_bool,
      _11                   type rs_bool,
      _12                   type rs_bool,
      _13                   type rs_bool,
      _14                   type rs_bool,
      _15                   type rs_bool,
      _16                   type rs_bool,
      _17                   type rs_bool,
      _18                   type rs_bool,
      _19                   type rs_bool,
      _20                   type rs_bool,
      _21                   type rs_bool,
      _22                   type rs_bool,
      _23                   type rs_bool,
      _24                   type rs_bool,
      _25                   type rs_bool,
      _26                   type rs_bool,
      _27                   type rs_bool,
  end   of _r_s_supp.

    methods:
    get_fields_populated0001
      exporting
        e_t_fieldnm type rsar_t_fieldnames.


    TYPES:
      BEGIN OF _ty_G_1,
*      InfoObject: MD_OQ Order Quantity.
        /BIC/MD_OQ           TYPE /BIC/OIMD_OQ,
*      InfoObject: MD_UNPR Unit Price.
        /BIC/MD_UNPR           TYPE /BIC/OIMD_UNPR,
*      InfoObject: MD_CURRN Currency Unit.
        /BIC/MD_CURRN           TYPE /BIC/OIMD_CURRN,
*      InfoObject: MD_EXAM Gross Sales Revenue (GSR).
        /BIC/MD_EXAM           TYPE /BIC/OIMD_EXAM,
*      InfoObject: MD_DISPER Discount Percentage.
        /BIC/MD_DISPER           TYPE /BIC/OIMD_DISPER,
*      InfoObject: MD_DA Discount Amount.
        /BIC/MD_DA           TYPE /BIC/OIMD_DA,
*      InfoObject: MD_PRST Product Standard Cost.
        /BIC/MD_PRST           TYPE /BIC/OIMD_PRST,
*      InfoObject: MD_TPC Cost of Goods Sold (COGS).
        /BIC/MD_TPC           TYPE /BIC/OIMD_TPC,
*      InfoObject: MD_SA Net Sales Revenue (NSR).
        /BIC/MD_SA           TYPE /BIC/OIMD_SA,
*      InfoObject: MD_TA Tax Amount.
        /BIC/MD_TA           TYPE /BIC/OIMD_TA,
*      InfoObject: MD_NPF Net Profit Amount.
        /BIC/MD_NPF           TYPE /BIC/OIMD_NPF,
*      InfoObject: MD_GPF Gross Profit Amount.
        /BIC/MD_GPF           TYPE /BIC/OIMD_GPF,
*      InfoObject: MD_CNT Count.
        /BIC/MD_CNT           TYPE /BIC/OIMD_CNT,
*      InfoObject: MD_ORD Order Date.
        /BIC/MD_ORD           TYPE /BIC/OIMD_ORD,
*      InfoObject: MD_DD Due Date.
        /BIC/MD_DD           TYPE /BIC/OIMD_DD,
*      InfoObject: MD_SHD Ship Date.
        /BIC/MD_SHD           TYPE /BIC/OIMD_SHD,
*      InfoObject: MD_S_TY Sales Territory MD.
        /BIC/MD_S_TY           TYPE /BIC/OIMD_S_TY,
*      InfoObject: MD_SON Sales Order Number.
        /BIC/MD_SON           TYPE /BIC/OIMD_SON,
*      InfoObject: MD_SOLN Sales Order Line Number.
        /BIC/MD_SOLN           TYPE /BIC/OIMD_SOLN,
*      InfoObject: MD_PROD Product MD.
        /BIC/MD_PROD           TYPE /BIC/OIMD_PROD,
*      InfoObject: MD_RS Reseller MD.
        /BIC/MD_RS           TYPE /BIC/OIMD_RS,
*      InfoObject: MD_EMP Employee.
        /BIC/MD_EMP           TYPE /BIC/OIMD_EMP,
*      InfoObject: MD_PROM Promotion MD.
        /BIC/MD_PROM           TYPE /BIC/OIMD_PROM,
*      InfoObject: MD_CPON Customer Purchase Order Number.
        /BIC/MD_CPON           TYPE /BIC/OIMD_CPON,
*      InfoObject: MD_CURR Currency MD.
        /BIC/MD_CURR           TYPE /BIC/OIMD_CURR,
*      InfoObject: MD_FRG Freight Number.
        /BIC/MD_FRG           TYPE /BIC/OIMD_FRG,
*      InfoObject: MD_REVNUM Revision Number.
        /BIC/MD_REVNUM           TYPE /BIC/OIMD_REVNUM,
*      InfoObject: MD_CTN Carrier Tracking Number.
        /BIC/MD_CTN           TYPE /BIC/OIMD_CTN,
      END   OF _ty_G_1.

endclass.                    "endclass
... "insert your code here


*---------------------------------------------------------------------*
*       CLASS lcl_transform IMPLEMENTATION
*---------------------------------------------------------------------*
*---------------------------------------------------------------------*
class lcl_transform implementation.

  method execute.
*=== Segments ===
    field-symbols:
      <_yt_SC_1>            type table,
      <_yt_SC_1_ty>          type _ty_t_SC_1,
      <_ys_SC_1>            type _ty_s_SC_1.
    field-symbols:
      <_yt_TG_1>            type _ty_t_TG_1,
      <_yth_TG_1>           type _ty_th_TG_1,
      <_ys_TG_1>            type _ty_s_TG_1.

    field-symbols: <_ys_rimage> type _ty_s_TG_1.

    data:
       lr_CX_abort               TYPE REF TO CX_rsrout_abort,
       lr_cx_sy_conversion_error type ref to cx_sy_conversion_error,
       lr_cx_sy_arithmetic_error type ref to cx_sy_arithmetic_error,
       lr_cx_root                type ref to cx_root.
    data: lr_cx_rsbk_errorcount type ref to cx_rsbk_errorcount.
    data: l_rx_rsfo_error_in_function type ref to cx_rsfo_error_in_function,
          l_s_balmsg type bal_s_msg.
    data:
       lr_msg_coll               type ref to cl_rso_msg,
       _skip                     TYPE rs_bool,
       _skip_seg_all             TYPE rs_bool,
       _ls_msg                   type rsmonitor,
       _ls_msg_s                 type rstmonitor,
       _ls_msg_rec               type rstr_ty_s_monitor_rec,
       _lt_msg                   type rstr_ty_t_monitor,
       _lt_msg_s                 type rstr_ty_t_monitors,
       _lt_msg_rec               type rstr_ty_t_monitor_rec,
       _curr_rule                type cl_rstran_runtime_exe=>ty_s_rule_context,
       _ls_supp                  type _r_s_supp.
    data:
       l_fieldname               type string.

    field-symbols:
       <l_record_no>             type any,
       <l_record_all>            type any.

    data: l_segid                type rsbk_segid.

    data: l_dummy                type c.

    data:
      _r_SC_1               type ref to cl_rsbk_data_segment,
      _rdt_SC_1             type ref to data.
    data:
      _r_TG_1               type ref to cl_rsbk_data_segment,
      _rds_TG_1             type ref to data,
      _rdt_TG_1             type ref to data,
      _rdt_TG_1_dp          type ref to data.
*=== Step_type specific ===
    data:
     l_recno_SC_1 type sy-tabix.

    data:
     l_recno_TG_1 type sy-tabix.
*=== Group ===
    data:
    _G_1         type _ty_G_1,
    _G_1_subrc   type sysubrc,
    _G_1_tabix   type sytabix,
    _G_1_subrc_2   type sysubrc,
    _G_1_tabix_2   type sytabix,
    _G_1_subrc_3   type sysubrc,
    _G_1_tabix_3   type sytabix.


*=== Step_type specific ===
    data:
* definition for conversion exit
    l_chavl_in_c  type rschavl,                             "#EC *
    l_chavl_out_c type rschavl,                             "#EC *
    ls_cob_pro    type rsd_s_cob_pro,                       "#EC *
    l_subrc_con   type sy-subrc.                            "#EC *
    data:
     l_requid   TYPE cl_rsbk_request=>t_requid,
     l_request  TYPE rsrequest.
    data:
     ls_cross         type RSBM_S_CROSSTAB.




    data:
      _R_14 type _R_14.
    data:
      _R_20 type _R_20.
    data:
      _R_22 type _R_22.
    data:
      _R_24 type _R_24.

* ==== 0. initialization
   CREATE object lr_msg_coll.
* ==== 1. unpack segments
    _r_SC_1              = i_r_inbound->get_segment( 0001 ).
    _rdt_SC_1            = _r_SC_1->get_data( i_with_recno = rs_c_true ).
    assign _rdt_SC_1->*            to <_yt_SC_1>.
    l_fieldname = 'RECORD_ALL'.
    assign (l_fieldname) to <l_record_all>.
    if sy-subrc = 0.
      describe table <_yt_SC_1> lines <l_record_all>.
    endif.


    data: l_t_fieldnm type rsar_t_fieldnames.

    _r_TG_1              = e_r_outbound->get_segment( 0001 ).
    _rdt_TG_1_dp         = _r_TG_1->get_empty_table( ).
    assign _rdt_TG_1_dp->*         to <_yt_TG_1>.

*   get transformation target list and set in segment
    call method get_fields_populated0001
      importing
        e_t_fieldnm = l_t_fieldnm.
    _r_TG_1->set_t_fields_populated( l_t_fieldnm ).

    _rds_TG_1            = _r_TG_1->get_workarea( ).
    assign _rds_TG_1->*            to <_ys_TG_1>.
    create data _rdt_TG_1 type _ty_th_TG_1.
    assign _rdt_TG_1->*            to <_yth_TG_1>.

    _curr_rule-tranid  = '0O3HV2JF3M5P7LJO52ZNFFDYZJS0FJ7N'.
    _curr_rule-progid  = '0OUY6JZNKDGX433RUB7Z8MKLJ'.
    _curr_rule-version = '0'.

    call method cl_rstran_runtime_exe=>get_suppressed_rules
      exporting
        i_tranid             = _curr_rule-tranid
        i_r_data             = e_r_outbound
        i_r_data_in          = i_r_inbound
      importing
        e_s_suppressed_rules = _ls_supp.

*   set attributs
    p_check_master_data_exist = i_master_data_exist.
    p_r_request               = i_r_request.
    l_segid                   = '0001'.

    l_requid = i_r_inbound->n_requid.
    if l_requid is not initial.
      TRY.
          l_request = cl_rsbk_request=>create_from_db(
             i_requid = l_requid )->get_requid30( ).
        CATCH cx_root INTO DATA(l_r_x).
          MESSAGE x299(rsbk).
      ENDTRY.
    endif.


* ==== Debugging ====
* Breakpoint after start routine
  if i_r_trfn_cmd is bound.
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
  endif.



* ==== 2. process data package
    i_r_log->add_substep( 'RULES' ).
    LOOP AT <_yt_SC_1> assigning <_ys_SC_1>.

      CLEAR:
        _G_1,
        _lt_msg_rec,
        _lt_msg.
     _curr_rule-record = l_recno_SC_1 = <_ys_SC_1>-record.
     if not <l_record_no> is assigned.
       if <_ys_SC_1>-record = 1.
         l_fieldname = 'RECORD_NO'.
         assign (l_fieldname) to <l_record_no>.
         if sy-subrc = 0.
           <l_record_no> = <_ys_SC_1>-record.
         endif.
       endif.
     else.
       <l_record_no> = <_ys_SC_1>-record.
     endif.
      TRY.

* ======  RULES
*<<<    Rule ID: '1'.
          IF _ls_supp-_1 EQ rs_c_false.
            _curr_rule-ruleid = '1'.
*       Step ID: '1', Type: 'DIRECT'.
            _curr_rule-stepid = '1'.
    _G_1-/BIC/MD_ORD = <_ys_SC_1>-/BIC/MD_ORD.
          ENDIF.  "suppressed RULE
*>>>
*<<<    Rule ID: '2'.
          IF _ls_supp-_2 EQ rs_c_false.
            _curr_rule-ruleid = '2'.
*       Step ID: '1', Type: 'DIRECT'.
            _curr_rule-stepid = '1'.
    _G_1-/BIC/MD_DD = <_ys_SC_1>-/BIC/MD_DD.
          ENDIF.  "suppressed RULE
*>>>
*<<<    Rule ID: '3'.
          IF _ls_supp-_3 EQ rs_c_false.
            _curr_rule-ruleid = '3'.
*       Step ID: '1', Type: 'DIRECT'.
            _curr_rule-stepid = '1'.
    _G_1-/BIC/MD_SHD = <_ys_SC_1>-/BIC/MD_SHD.
          ENDIF.  "suppressed RULE
*>>>
*<<<    Rule ID: '4'.
          IF _ls_supp-_4 EQ rs_c_false.
            _curr_rule-ruleid = '4'.
*       Step ID: '1', Type: 'DIRECT'.
            _curr_rule-stepid = '1'.
    _G_1-/BIC/MD_OQ = <_ys_SC_1>-/BIC/MD_OQ.
          ENDIF.  "suppressed RULE
*>>>
*<<<    Rule ID: '5'.
          IF _ls_supp-_5 EQ rs_c_false.
            _curr_rule-ruleid = '5'.
*       Step ID: '1', Type: 'DIRECT'.
            _curr_rule-stepid = '1'.
    _G_1-/BIC/MD_UNPR = <_ys_SC_1>-/BIC/MD_UNPR.
*       Step ID: '2', Type: 'DIRECT'.
            _curr_rule-stepid = '2'.
    _G_1-/BIC/MD_CURRN = <_ys_SC_1>-/BIC/MD_CURRN.
          ENDIF.  "suppressed RULE
*>>>
*<<<    Rule ID: '6'.
          IF _ls_supp-_6 EQ rs_c_false.
            _curr_rule-ruleid = '6'.
*       Step ID: '1', Type: 'DIRECT'.
            _curr_rule-stepid = '1'.
    _G_1-/BIC/MD_EXAM = <_ys_SC_1>-/BIC/MD_EXAM.
*       Step ID: '2', Type: 'DIRECT'.
            _curr_rule-stepid = '2'.
    _G_1-/BIC/MD_CURRN = <_ys_SC_1>-/BIC/MD_CURRN.
          ENDIF.  "suppressed RULE
*>>>
*<<<    Rule ID: '7'.
          IF _ls_supp-_7 EQ rs_c_false.
            _curr_rule-ruleid = '7'.
*       Step ID: '1', Type: 'FORMULA'.
            _curr_rule-stepid = '1'.

      CLEAR: sy-msgid, sy-msgty, sy-msgno, sy-msgv1, sy-msgv2, sy-msgv3, sy-msgv4.
      CALL METHOD me->FORMULA__7_1
        EXPORTING
          SOURCE_FIELDS             = <_ys_SC_1>
        IMPORTING
          RESULT                    = _G_1-/BIC/MD_DISPER.
          ENDIF.  "suppressed RULE
*>>>
*<<<    Rule ID: '8'.
          IF _ls_supp-_8 EQ rs_c_false.
            _curr_rule-ruleid = '8'.
*       Step ID: '1', Type: 'DIRECT'.
            _curr_rule-stepid = '1'.
    _G_1-/BIC/MD_DA = <_ys_SC_1>-/BIC/MD_DA.
*       Step ID: '2', Type: 'DIRECT'.
            _curr_rule-stepid = '2'.
    _G_1-/BIC/MD_CURRN = <_ys_SC_1>-/BIC/MD_CURRN.
          ENDIF.  "suppressed RULE
*>>>
*<<<    Rule ID: '9'.
          IF _ls_supp-_9 EQ rs_c_false.
            _curr_rule-ruleid = '9'.
*       Step ID: '1', Type: 'DIRECT'.
            _curr_rule-stepid = '1'.
    _G_1-/BIC/MD_PRST = <_ys_SC_1>-/BIC/MD_PRST.
*       Step ID: '2', Type: 'DIRECT'.
            _curr_rule-stepid = '2'.
    _G_1-/BIC/MD_CURRN = <_ys_SC_1>-/BIC/MD_CURRN.
          ENDIF.  "suppressed RULE
*>>>
*<<<    Rule ID: '10'.
          IF _ls_supp-_10 EQ rs_c_false.
            _curr_rule-ruleid = '10'.
*       Step ID: '1', Type: 'DIRECT'.
            _curr_rule-stepid = '1'.
    _G_1-/BIC/MD_TPC = <_ys_SC_1>-/BIC/MD_TPC.
*       Step ID: '2', Type: 'DIRECT'.
            _curr_rule-stepid = '2'.
    _G_1-/BIC/MD_CURRN = <_ys_SC_1>-/BIC/MD_CURRN.
          ENDIF.  "suppressed RULE
*>>>
*<<<    Rule ID: '11'.
          IF _ls_supp-_11 EQ rs_c_false.
            _curr_rule-ruleid = '11'.
*       Step ID: '1', Type: 'DIRECT'.
            _curr_rule-stepid = '1'.
    _G_1-/BIC/MD_SA = <_ys_SC_1>-/BIC/MD_SA.
*       Step ID: '2', Type: 'DIRECT'.
            _curr_rule-stepid = '2'.
    _G_1-/BIC/MD_CURRN = <_ys_SC_1>-/BIC/MD_CURRN.
          ENDIF.  "suppressed RULE
*>>>
*<<<    Rule ID: '12'.
          IF _ls_supp-_12 EQ rs_c_false.
            _curr_rule-ruleid = '12'.
*       Step ID: '1', Type: 'DIRECT'.
            _curr_rule-stepid = '1'.
    _G_1-/BIC/MD_TA = <_ys_SC_1>-/BIC/MD_TA.
*       Step ID: '2', Type: 'DIRECT'.
            _curr_rule-stepid = '2'.
    _G_1-/BIC/MD_CURRN = <_ys_SC_1>-/BIC/MD_CURRN.
          ENDIF.  "suppressed RULE
*>>>
*<<<    Rule ID: '13'.
          IF _ls_supp-_13 EQ rs_c_false.
            _curr_rule-ruleid = '13'.
*       Step ID: '1', Type: 'DIRECT'.
            _curr_rule-stepid = '1'.
    _G_1-/BIC/MD_S_TY = <_ys_SC_1>-/BIC/MD_S_TY.
          ENDIF.  "suppressed RULE
*>>>
*<<<    Rule ID: '14'.
          IF _ls_supp-_14 EQ rs_c_false.
            _curr_rule-ruleid = '14'.
*       Step ID: '1', Type: 'DIRECT'.
            _curr_rule-stepid = '1'.
    _R_14-_1_1 = <_ys_SC_1>-/BIC/MD_SON.
*       Step ID: '2', Type: 'CONVERT'.
            _curr_rule-stepid = '2'.
    CALL 'CONVERSION_EXIT_ALPHA_INPUT'
          ID 'INPUT'  FIELD _R_14-_1_1
          ID 'OUTPUT' FIELD _G_1-/BIC/MD_SON.

    IF _G_1-/BIC/MD_SON <> _R_14-_1_1.
      CALL METHOD cl_rstran_runtime_exe=>data_error
        EXPORTING
          i_r_log         = i_r_log
          i_rule_context  = _curr_rule
          i_in            = _R_14-_1_1
          i_out           = _G_1-/BIC/MD_SON
        EXCEPTIONS
          too_many_errors = 1.
      .
      IF sy-subrc = 1.
        RAISE EXCEPTION TYPE cx_rsrout_abort.
      ENDIF.

      CLEAR _R_14-_1_1.
    ENDIF.
          ENDIF.  "suppressed RULE
*>>>
*<<<    Rule ID: '15'.
          IF _ls_supp-_15 EQ rs_c_false.
            _curr_rule-ruleid = '15'.
*       Step ID: '1', Type: 'DIRECT'.
            _curr_rule-stepid = '1'.
    _G_1-/BIC/MD_SOLN = <_ys_SC_1>-/BIC/MD_SOLN.
          ENDIF.  "suppressed RULE
*>>>
*<<<    Rule ID: '16'.
          IF _ls_supp-_16 EQ rs_c_false.
            _curr_rule-ruleid = '16'.
*       Step ID: '1', Type: 'DIRECT'.
            _curr_rule-stepid = '1'.
    _G_1-/BIC/MD_PROD = <_ys_SC_1>-/BIC/MD_PROD.
          ENDIF.  "suppressed RULE
*>>>
*<<<    Rule ID: '17'.
          IF _ls_supp-_17 EQ rs_c_false.
            _curr_rule-ruleid = '17'.
*       Step ID: '1', Type: 'DIRECT'.
            _curr_rule-stepid = '1'.
    _G_1-/BIC/MD_RS = <_ys_SC_1>-/BIC/MD_RS.
          ENDIF.  "suppressed RULE
*>>>
*<<<    Rule ID: '18'.
          IF _ls_supp-_18 EQ rs_c_false.
            _curr_rule-ruleid = '18'.
*       Step ID: '1', Type: 'DIRECT'.
            _curr_rule-stepid = '1'.
    _G_1-/BIC/MD_EMP = <_ys_SC_1>-/BIC/MD_EMP.
          ENDIF.  "suppressed RULE
*>>>
*<<<    Rule ID: '19'.
          IF _ls_supp-_19 EQ rs_c_false.
            _curr_rule-ruleid = '19'.
*       Step ID: '1', Type: 'DIRECT'.
            _curr_rule-stepid = '1'.
    _G_1-/BIC/MD_PROM = <_ys_SC_1>-/BIC/MD_PROM.
          ENDIF.  "suppressed RULE
*>>>
*<<<    Rule ID: '20'.
          IF _ls_supp-_20 EQ rs_c_false.
            _curr_rule-ruleid = '20'.
*       Step ID: '1', Type: 'DIRECT'.
            _curr_rule-stepid = '1'.
    _R_20-_1_1 = <_ys_SC_1>-/BIC/MD_CPON.
*       Step ID: '2', Type: 'CONVERT'.
            _curr_rule-stepid = '2'.
    CALL 'CONVERSION_EXIT_ALPHA_INPUT'
          ID 'INPUT'  FIELD _R_20-_1_1
          ID 'OUTPUT' FIELD _G_1-/BIC/MD_CPON.

    IF _G_1-/BIC/MD_CPON <> _R_20-_1_1.
      CALL METHOD cl_rstran_runtime_exe=>data_error
        EXPORTING
          i_r_log         = i_r_log
          i_rule_context  = _curr_rule
          i_in            = _R_20-_1_1
          i_out           = _G_1-/BIC/MD_CPON
        EXCEPTIONS
          too_many_errors = 1.
      .
      IF sy-subrc = 1.
        RAISE EXCEPTION TYPE cx_rsrout_abort.
      ENDIF.

      CLEAR _R_20-_1_1.
    ENDIF.
          ENDIF.  "suppressed RULE
*>>>
*<<<    Rule ID: '21'.
          IF _ls_supp-_21 EQ rs_c_false.
            _curr_rule-ruleid = '21'.
*       Step ID: '1', Type: 'DIRECT'.
            _curr_rule-stepid = '1'.
    _G_1-/BIC/MD_CURR = <_ys_SC_1>-/BIC/MD_CURR.
          ENDIF.  "suppressed RULE
*>>>
*<<<    Rule ID: '22'.
          IF _ls_supp-_22 EQ rs_c_false.
            _curr_rule-ruleid = '22'.
*       Step ID: '1', Type: 'DIRECT'.
            _curr_rule-stepid = '1'.
    _R_22-_1_1 = <_ys_SC_1>-/BIC/MD_FRG.
*       Step ID: '2', Type: 'CONVERT'.
            _curr_rule-stepid = '2'.
    CALL 'CONVERSION_EXIT_ALPHA_INPUT'
          ID 'INPUT'  FIELD _R_22-_1_1
          ID 'OUTPUT' FIELD _G_1-/BIC/MD_FRG.

    IF _G_1-/BIC/MD_FRG <> _R_22-_1_1.
      CALL METHOD cl_rstran_runtime_exe=>data_error
        EXPORTING
          i_r_log         = i_r_log
          i_rule_context  = _curr_rule
          i_in            = _R_22-_1_1
          i_out           = _G_1-/BIC/MD_FRG
        EXCEPTIONS
          too_many_errors = 1.
      .
      IF sy-subrc = 1.
        RAISE EXCEPTION TYPE cx_rsrout_abort.
      ENDIF.

      CLEAR _R_22-_1_1.
    ENDIF.
          ENDIF.  "suppressed RULE
*>>>
*<<<    Rule ID: '23'.
          IF _ls_supp-_23 EQ rs_c_false.
            _curr_rule-ruleid = '23'.
*       Step ID: '1', Type: 'DIRECT'.
            _curr_rule-stepid = '1'.
    _G_1-/BIC/MD_REVNUM = <_ys_SC_1>-/BIC/MD_REVNUM.
          ENDIF.  "suppressed RULE
*>>>
*<<<    Rule ID: '24'.
          IF _ls_supp-_24 EQ rs_c_false.
            _curr_rule-ruleid = '24'.
*       Step ID: '1', Type: 'DIRECT'.
            _curr_rule-stepid = '1'.
    _R_24-_1_1 = <_ys_SC_1>-/BIC/MD_CTN.
*       Step ID: '2', Type: 'CONVERT'.
            _curr_rule-stepid = '2'.
    CALL 'CONVERSION_EXIT_ALPHA_INPUT'
          ID 'INPUT'  FIELD _R_24-_1_1
          ID 'OUTPUT' FIELD _G_1-/BIC/MD_CTN.

    IF _G_1-/BIC/MD_CTN <> _R_24-_1_1.
      CALL METHOD cl_rstran_runtime_exe=>data_error
        EXPORTING
          i_r_log         = i_r_log
          i_rule_context  = _curr_rule
          i_in            = _R_24-_1_1
          i_out           = _G_1-/BIC/MD_CTN
        EXCEPTIONS
          too_many_errors = 1.
      .
      IF sy-subrc = 1.
        RAISE EXCEPTION TYPE cx_rsrout_abort.
      ENDIF.

      CLEAR _R_24-_1_1.
    ENDIF.
          ENDIF.  "suppressed RULE
*>>>
*<<<    Rule ID: '25'.
          IF _ls_supp-_25 EQ rs_c_false.
            _curr_rule-ruleid = '25'.
*       Step ID: '1', Type: 'FORMULA'.
            _curr_rule-stepid = '1'.

      CLEAR: sy-msgid, sy-msgty, sy-msgno, sy-msgv1, sy-msgv2, sy-msgv3, sy-msgv4.
      CALL METHOD me->FORMULA__25_1
        EXPORTING
          SOURCE_FIELDS             = <_ys_SC_1>
        IMPORTING
          RESULT                    = _G_1-/BIC/MD_NPF.
*       Step ID: '2', Type: 'DIRECT'.
            _curr_rule-stepid = '2'.
    _G_1-/BIC/MD_CURRN = <_ys_SC_1>-/BIC/MD_CURRN.
          ENDIF.  "suppressed RULE
*>>>
*<<<    Rule ID: '26'.
          IF _ls_supp-_26 EQ rs_c_false.
            _curr_rule-ruleid = '26'.
*       Step ID: '1', Type: 'ROUTINE'.
            _curr_rule-stepid = '1'.
      CLEAR: _lt_msg,
             _G_1-/BIC/MD_GPF.

      TRY.
        CALL METHOD me->compute_26_1
          EXPORTING
            request                   = l_request
            datapackid                = i_r_inbound->n_datapakid
            SOURCE_FIELDS             = <_ys_SC_1>
            segid                     = l_segid
          IMPORTING
            RESULT                    = _G_1-/BIC/MD_GPF
            monitor                           = _lt_msg.

        IF _lt_msg[] IS NOT INITIAL.
          _ls_msg_rec-ruleid   = _curr_rule-ruleid.
          _ls_msg_rec-stepid   = _curr_rule-stepid.
          _ls_msg_rec-_s-recno = _curr_rule-record.
          LOOP at _lt_msg INTO _ls_msg.
            MOVE-CORRESPONDING _ls_msg to _ls_msg_rec-_s.
            APPEND _ls_msg_rec to _Lt_msg_rec.
          ENDLOOP.
          clear: _lt_msg[].
        ENDIF.
      CATCH cx_rsrout_skip_val.
          CLEAR _G_1-/BIC/MD_GPF.
      ENDTRY.

*       Step ID: '2', Type: 'DIRECT'.
            _curr_rule-stepid = '2'.
    _G_1-/BIC/MD_CURRN = <_ys_SC_1>-/BIC/MD_CURRN.
          ENDIF.  "suppressed RULE
*>>>
*<<<    Rule ID: '27'.
          IF _ls_supp-_27 EQ rs_c_false.
            _curr_rule-ruleid = '27'.
*       Step ID: '1', Type: 'CONSTANT'.
            _curr_rule-stepid = '1'.
    _G_1-/BIC/MD_CNT = '1'.
          ENDIF.  "suppressed RULE
*>>>

        IF _lt_msg_rec is not initial.
          CALL METHOD cl_rstran_runtime_exe=>message_proxy
            EXPORTING
              i_r_log                   = i_r_log
              i_rule_context            = _curr_rule
              I_SEG_ID                  = `1`
              I_S_DATA                  = <_ys_SC_1>
            CHANGING
              c_t_msg                   = _lt_msg_rec.
        ENDIF.

        CATCH cx_rsrout_skip_record INTO lr_cx_root.
          _skip_seg_all = rs_c_true.
          IF _lt_msg[] IS NOT INITIAL.
            _ls_msg_rec-ruleid   = _curr_rule-ruleid.
            _ls_msg_rec-stepid   = _curr_rule-stepid.
            _ls_msg_rec-_s-recno = _curr_rule-record.
            LOOP at _lt_msg INTO _ls_msg.
              MOVE-CORRESPONDING _ls_msg to _ls_msg_rec-_s.
              APPEND _ls_msg_rec to _Lt_msg_rec.
            ENDLOOP.
          ENDIF.
          IF _lt_msg_rec is not initial.
            CALL METHOD cl_rstran_runtime_exe=>message_proxy
              EXPORTING
                i_r_log                   = i_r_log
                i_cx_root                 = lr_cx_root
                i_rule_context            = _curr_rule
                I_SEG_ID                  = `1`
                I_S_DATA                  = <_ys_SC_1>
             CHANGING
                c_t_msg                   = _lt_msg_rec.
          ENDIF.

        CATCH cx_rsfo_skip_record INTO lr_cx_root.
          _skip_seg_all = rs_c_true.

        CATCH cx_rsfo_skip_record_as_error INTO lr_cx_root.
          _skip_seg_all = rs_c_true.
          CALL METHOD cl_rstran_runtime_exe=>message_proxy
            EXPORTING
              i_r_log                   = i_r_log
              i_cx_root                 = lr_cx_root
              i_rule_context            = _curr_rule
              I_SEG_ID                  = `1`
              I_S_DATA                  = <_ys_SC_1>
            CHANGING
              c_t_msg                   = _lt_msg_rec.

        CATCH cx_rsbk_errorcount into lr_cx_rsbk_errorcount.
*         errorcount can't be determined
          _skip_seg_all = rs_c_true.
          CALL FUNCTION 'RS_EXCEPTION_TO_SYMSG'
            EXPORTING
              i_r_exception       = lr_cx_rsbk_errorcount
*             I_DEEPEST           =
                    .
          move-corresponding syst to _ls_msg_rec-_s.
          _ls_msg_rec-_s-skipped = rs_c_true.
          APPEND _ls_msg_rec to _Lt_msg_rec.
          CALL METHOD cl_rstran_runtime_exe=>message_proxy
            EXPORTING
              i_r_log                   = i_r_log
              i_rule_context            = _curr_rule
              I_SEG_ID                  = `1`
              I_S_DATA                  = <_ys_SC_1>
            CHANGING
              c_t_msg                   = _lt_msg_rec.

        CATCH cx_foev_error_in_function INTO lr_cx_root.            "HW 980549
          _skip_seg_all = rs_c_true.
          clear _ls_msg_rec.
          _ls_msg_rec-ruleid   = _curr_rule-ruleid.
          _ls_msg_rec-stepid   = _curr_rule-stepid.
          _ls_msg_rec-_s-recno = _curr_rule-record.

          try.
            l_rx_rsfo_error_in_function ?= lr_cx_root.
            call method l_rx_rsfo_error_in_function->get_message
              importing
                e_s_msg = l_s_balmsg.
            move-corresponding l_s_balmsg to _ls_msg_rec-_s.
            APPEND _ls_msg_rec to _Lt_msg_rec.
           catch  cx_sy_move_cast_error.
          endtry.

          message e535(rsar)
            with _curr_rule-ruleid _curr_rule-record
            into _ls_msg_rec-_s-msgty.
          move-corresponding syst to _ls_msg_rec-_s.
          _ls_msg_rec-_s-skipped = rs_c_true.
          APPEND _ls_msg_rec to _Lt_msg_rec.
          CALL METHOD cl_rstran_runtime_exe=>message_proxy
            EXPORTING
              i_r_log                   = i_r_log
              i_rule_context            = _curr_rule
              I_SEG_ID                  = `1`
              I_S_DATA                  = <_ys_SC_1>
            CHANGING
              c_t_msg                   = _lt_msg_rec.

        CATCH cx_sy_arithmetic_error into lr_cx_sy_arithmetic_error.
           _skip_seg_all = rs_c_true.
          CALL METHOD cl_rstran_runtime_exe=>message_proxy
            EXPORTING
              i_r_log                  = i_r_log
              i_cx_sy_arithmetic_error = lr_cx_sy_arithmetic_error
              i_rule_context           = _curr_rule
              I_SEG_ID                 = `1`
              I_S_DATA                 = <_ys_SC_1>.

        CATCH cx_sy_conversion_error  INTO lr_cx_sy_conversion_error.
          _skip_seg_all = rs_c_true.
          CALL METHOD cl_rstran_runtime_exe=>message_proxy
            EXPORTING
              i_r_log                  = i_r_log
              i_cx_sy_conversion_error = lr_cx_sy_conversion_error
              i_rule_context           = _curr_rule
              I_SEG_ID                 = `1`
              I_S_DATA                 = <_ys_SC_1>.

        CATCH cx_root INTO lr_cx_root.
          _skip_seg_all = rs_c_true.
*--       all other cases handled by message proxy
          IF _lt_msg[] IS NOT INITIAL.
            _ls_msg_rec-ruleid   = _curr_rule-ruleid.
            _ls_msg_rec-stepid   = _curr_rule-stepid.
            _ls_msg_rec-_s-recno = _curr_rule-record.
            LOOP at _lt_msg INTO _ls_msg.
              MOVE-CORRESPONDING _ls_msg to _ls_msg_rec-_s.
              APPEND _ls_msg_rec to _Lt_msg_rec.
            ENDLOOP.
          ENDIF.

          CALL METHOD cl_rstran_runtime_exe=>message_proxy
            EXPORTING
              i_r_log                  = i_r_log
              i_cx_root                = lr_cx_root
              i_rule_context           = _curr_rule
              I_SEG_ID                 = `1`
              I_S_DATA                 = <_ys_SC_1>
            CHANGING
              c_t_msg                   = _lt_msg_rec.

      ENDTRY.       "RECORD

* =====  PUT groups to target
      IF _skip_seg_all IS INITIAL.

    READ TABLE <_yth_TG_1>
      WITH TABLE KEY
       /BIC/MD_CURRN              = _G_1-/BIC/MD_CURRN
       /BIC/MD_ORD              = _G_1-/BIC/MD_ORD
       /BIC/MD_DD              = _G_1-/BIC/MD_DD
       /BIC/MD_SHD              = _G_1-/BIC/MD_SHD
       /BIC/MD_S_TY              = _G_1-/BIC/MD_S_TY
       /BIC/MD_SON              = _G_1-/BIC/MD_SON
       /BIC/MD_SOLN              = _G_1-/BIC/MD_SOLN
       /BIC/MD_PROD              = _G_1-/BIC/MD_PROD
       /BIC/MD_RS              = _G_1-/BIC/MD_RS
       /BIC/MD_EMP              = _G_1-/BIC/MD_EMP
       /BIC/MD_PROM              = _G_1-/BIC/MD_PROM
       /BIC/MD_CPON              = _G_1-/BIC/MD_CPON
       /BIC/MD_CURR              = _G_1-/BIC/MD_CURR
       /BIC/MD_FRG              = _G_1-/BIC/MD_FRG
       /BIC/MD_REVNUM              = _G_1-/BIC/MD_REVNUM
       /BIC/MD_CTN              = _G_1-/BIC/MD_CTN
       ASSIGNING <_ys_TG_1>.
    _G_1_subrc = sy-subrc.
    _G_1_tabix = sy-tabix.

    IF _G_1_subrc = 0.
*   aggregation SUM
      <_ys_TG_1>-/BIC/MD_OQ = <_ys_TG_1>-/BIC/MD_OQ + _G_1-/BIC/MD_OQ.
      <_ys_TG_1>-/BIC/MD_UNPR = <_ys_TG_1>-/BIC/MD_UNPR + _G_1-/BIC/MD_UNPR.
      <_ys_TG_1>-/BIC/MD_EXAM = <_ys_TG_1>-/BIC/MD_EXAM + _G_1-/BIC/MD_EXAM.
      <_ys_TG_1>-/BIC/MD_DISPER = <_ys_TG_1>-/BIC/MD_DISPER + _G_1-/BIC/MD_DISPER.
      <_ys_TG_1>-/BIC/MD_DA = <_ys_TG_1>-/BIC/MD_DA + _G_1-/BIC/MD_DA.
      <_ys_TG_1>-/BIC/MD_PRST = <_ys_TG_1>-/BIC/MD_PRST + _G_1-/BIC/MD_PRST.
      <_ys_TG_1>-/BIC/MD_TPC = <_ys_TG_1>-/BIC/MD_TPC + _G_1-/BIC/MD_TPC.
      <_ys_TG_1>-/BIC/MD_SA = <_ys_TG_1>-/BIC/MD_SA + _G_1-/BIC/MD_SA.
      <_ys_TG_1>-/BIC/MD_TA = <_ys_TG_1>-/BIC/MD_TA + _G_1-/BIC/MD_TA.
      <_ys_TG_1>-/BIC/MD_NPF = <_ys_TG_1>-/BIC/MD_NPF + _G_1-/BIC/MD_NPF.
      <_ys_TG_1>-/BIC/MD_GPF = <_ys_TG_1>-/BIC/MD_GPF + _G_1-/BIC/MD_GPF.
      <_ys_TG_1>-/BIC/MD_CNT = <_ys_TG_1>-/BIC/MD_CNT + _G_1-/BIC/MD_CNT.
      ls_cross-insegid      = 1.
      ls_cross-inrecord     = l_recno_SC_1.
      ls_cross-outsegid     = 1.
      ls_cross-outrecord    = <_ys_TG_1>-record.

      CALL METHOD i_r_log->add_cross_tab
        EXPORTING
          I_S_CROSSTAB = ls_cross.

    ELSE.
      ASSIGN _rds_TG_1->*          to <_ys_TG_1>.
      CLEAR <_ys_TG_1>.
      MOVE-CORRESPONDING _G_1 TO <_ys_TG_1>.
    <_ys_TG_1>-requid    = l_requid.
      l_recno_TG_1          = l_recno_TG_1 + 1.
      ls_cross-insegid      = 1.
      ls_cross-inrecord     = l_recno_SC_1.
      ls_cross-outsegid     = 1.
      ls_cross-outrecord    = l_recno_TG_1.

      CALL METHOD i_r_log->add_cross_tab
        EXPORTING
          I_S_CROSSTAB = ls_cross.

**     Record# in target = sy-tabix - if sorting of table won't be changed
      <_ys_TG_1>-record     = l_recno_TG_1.

      INSERT <_ys_TG_1> INTO TABLE <_yth_TG_1>.
      IF sy-subrc <> 0.
        CALL METHOD cl_rsbm_log_step=>raise_step_failed_callstack.
      ENDIF.

    ENDIF.      "Read table
*
      ENDIF.
      CLEAR _skip_seg_all.
    ENDLOOP.
* -------- insert table into outbound segment ----

    <_yt_TG_1>[] = <_yth_TG_1>[].
    CLEAR _rdt_TG_1.
    FREE  <_yth_TG_1>[].

* ==== Debugging ====
* Breakpoint before end routine
  if i_r_trfn_cmd is bound.
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
  endif.



IF l_requid NE 0.

        DATA: l_r_request_0001       TYPE REF TO cl_rsbk_request,
              l_errorhandling_0001   TYPE rsbkerrorhandling,
              l_skip_0001            TYPE rs_bool.
*-- get the request
        TRY.
            CALL METHOD cl_rsbk_request=>create_from_db
              EXPORTING
                i_requid    = l_requid
              RECEIVING
                r_r_request = l_r_request_0001.
          CATCH cx_rs_not_found .
        ENDTRY.
*-- get the error handling setting from the request
        TRY.
            CALL METHOD l_r_request_0001->get_errorhandling
              RECEIVING
                r_errorhandling = l_errorhandling_0001.
          CATCH cx_rs_access_error .
        ENDTRY.
*-- only in case of error handling on
        IF l_errorhandling_0001 NE rsbc_c_errorhandling-off.
          LOOP AT <_yt_TG_1> ASSIGNING <_ys_TG_1>.
            CALL METHOD i_r_log->verify_record
              EXPORTING
                i_segid         = 0001
                i_record        = <_ys_TG_1>-record
                i_use_crosstab  = rs_c_true               " As it is the Target format
              RECEIVING
                r_skip          = l_skip_0001
              EXCEPTIONS
                too_many_errors = 1
                not_in_crosstab = 2
                others          = 3.
              IF sy-subrc <> 0.
*-- too many errors/ not in crosstab abort
                 CALL FUNCTION 'RS_SYMESSAGE_TO_EXCEPTION'
                    EXPORTING
                      i_exception = 'CX_RS_MSG'
                    IMPORTING
                      e_r_exception = lr_cx_root.
                 CALL METHOD cl_rsbm_log_step=>raise_step_failed_callstack
                  EXPORTING
                      i_previous  =  lr_cx_root.
              ELSEIF not l_skip_0001 is initial.
                  DELETE <_yt_TG_1>.
              ENDIF.
            ENDLOOP.
       ENDIF.
ENDIF.

    _r_TG_1->insert_table( _rdt_TG_1_dp ).
  ENDMETHOD.                 "execute

  METHOD get_fields_populated0001.

    append '/BIC/MD_ORD' to e_t_fieldnm.
    append '/BIC/MD_DD' to e_t_fieldnm.
    append '/BIC/MD_SHD' to e_t_fieldnm.
    append '/BIC/MD_OQ' to e_t_fieldnm.
    append '/BIC/MD_UNPR' to e_t_fieldnm.
    append '/BIC/MD_CURRN' to e_t_fieldnm.
    append '/BIC/MD_EXAM' to e_t_fieldnm.
    append '/BIC/MD_DISPER' to e_t_fieldnm.
    append '/BIC/MD_NPF' to e_t_fieldnm.
    append '/BIC/MD_DA' to e_t_fieldnm.
    append '/BIC/MD_PRST' to e_t_fieldnm.
    append '/BIC/MD_TPC' to e_t_fieldnm.
    append '/BIC/MD_SA' to e_t_fieldnm.
    append '/BIC/MD_TA' to e_t_fieldnm.
    append '/BIC/MD_S_TY' to e_t_fieldnm.
    append '/BIC/MD_SON' to e_t_fieldnm.
    append '/BIC/MD_SOLN' to e_t_fieldnm.
    append '/BIC/MD_PROD' to e_t_fieldnm.
    append '/BIC/MD_RS' to e_t_fieldnm.
    append '/BIC/MD_EMP' to e_t_fieldnm.
    append '/BIC/MD_PROM' to e_t_fieldnm.
    append '/BIC/MD_CPON' to e_t_fieldnm.
    append '/BIC/MD_CURR' to e_t_fieldnm.
    append '/BIC/MD_FRG' to e_t_fieldnm.
    append '/BIC/MD_REVNUM' to e_t_fieldnm.
    append '/BIC/MD_CTN' to e_t_fieldnm.
    append '/BIC/MD_GPF' to e_t_fieldnm.
    append '/BIC/MD_CNT' to e_t_fieldnm.

  ENDMETHOD.


  METHOD FORMULA__7_1.
******************************************************
*This ABAP Code was generated automatically          *
*Formula Calculator                                  *
******************************************************
*Generated :2025:06:06-12:06
*User: DUMMY
******************************************************
*
*Data definition:
DATA: l_Arg1  TYPE F .
*Calculation:
l_Arg1  = SOURCE_FIELDS-/BIC/MD_DISPER * 100.
RESULT = l_Arg1 .
  ENDMETHOD.                    "FORMULA__7_1

  METHOD FORMULA__25_1.
******************************************************
*This ABAP Code was generated automatically          *
*Formula Calculator                                  *
******************************************************
*Generated :2025:06:06-12:06
*User: DUMMY
******************************************************
*
*Data definition:
DATA: l_Arg1  TYPE P LENGTH 16 DECIMALS 2  .
DATA: l_Arg2  TYPE P LENGTH 16 DECIMALS 2  .
*Calculation:
l_Arg1  = SOURCE_FIELDS-/BIC/MD_EXAM - SOURCE_FIELDS-/BIC/MD_TPC.
l_Arg2  = l_Arg1  - SOURCE_FIELDS-/BIC/MD_TA.
RESULT = l_Arg2 .
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
      MONITOR_REC    TYPE rsmonitor.
... "insert your code here
*--  fill table "MONITOR" with values of structure "MONITOR_REC"
*-   to make monitor entries
... "to cancel the update process
*    raise exception type CX_RSROUT_ABORT.
... "to skip a record"
*    raise exception type CX_RSROUT_SKIP_RECORD.
... "to clear target fields
*    raise exception type CX_RSROUT_SKIP_VAL.

     " Calculate the Gross Profit Amount (/BIC/MD_GPF)
"Formula: Gross Sales (/BIC/MD_EXAM) - Cost of Goods Sold (/BIC/MD_TPC)
     RESULT = SOURCE_FIELDS-/BIC/MD_EXAM - SOURCE_FIELDS-/BIC/MD_TPC.


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

*$*$ begin of inverse routine - insert your code only below this line*-*
... "insert your code here
*$*$ end of inverse routine - insert your code only before this line *-*

  ENDMETHOD.                    "invert_26_1


    endclass.                    "lcl_transform IMPLEMENTATION

*&--------------------------------------------------------------------*
*&      Form  get_runtime_ref
*&--------------------------------------------------------------------*
*       text
*---------------------------------------------------------------------*
*      -->C_R_EXE    text
*---------------------------------------------------------------------*
form get_runtime_ref
  changing c_r_exe  type ref to object.

*-- singelton instance
  statics s_r_exe type ref to lcl_transform.

  if s_r_exe is not bound.
    create object s_r_exe.
  endif.
  c_r_exe = s_r_exe.

endform.                    "get_runtime_ref

*.. The following subroutine is for internal (FuGr RSSG) use only! ..*


FORM _RSSG_PROGRAM_LOADCHECK
     CHANGING E_S_PDIR TYPE RSSGTPDIR
              E_FOUND  TYPE FLAG. "#EC CALLED
CONSTANTS:
BEGIN OF _RSSG_C_PCLA,
  PROGCLASS TYPE  RSSGTPCLA-PROGCLASS
    VALUE 'RSTRAN_MASTER_TMPL',
  CLIDEP TYPE  RSSGTPCLA-CLIDEP
    VALUE ' ',
  GENFLAG TYPE  RSSGTPCLA-GENFLAG
    VALUE 'X',
  SUBC TYPE  RSSGTPCLA-SUBC
    VALUE '1',
  TEMPLATE TYPE  RSSGTPCLA-TEMPLATE
    VALUE 'RSTRAN_MASTER_TMPL',
END   OF _RSSG_C_PCLA,

BEGIN OF _RSSG_C_PDIR,
  UNI_IDC25 TYPE  RSSGTPDIR-UNI_IDC25
    VALUE '0OUY6JZNKDGX433RUB7Z8MKLJ',
  CLIENT TYPE  RSSGTPDIR-CLIENT
    VALUE ' ',
  PROGCLASS TYPE  RSSGTPDIR-PROGCLASS
    VALUE 'RSTRAN_MASTER_TMPL',
  PROGNAME TYPE  RSSGTPDIR-PROGNAME
    VALUE 'GP0OUY6JZNKDGX433RUB7Z8MKLJ',
  CREUSER TYPE  RSSGTPDIR-CREUSER
    VALUE 'DUMMY',
  CRETSTMP TYPE  RSSGTPDIR-CRETSTMP
    VALUE 20250530102004,
  GENUSER TYPE  RSSGTPDIR-GENUSER
    VALUE 'DUMMY',
  GENTSTMP TYPE  RSSGTPDIR-GENTSTMP
    VALUE 20250606100640,
  GENRELEASE TYPE  RSSGTPDIR-GENRELEASE
    VALUE '750',
  GENSTATUS TYPE  RSSGTPDIR-GENSTATUS
    VALUE '00',
  TEMPLATE TYPE  RSSGTPDIR-TEMPLATE
    VALUE 'RSTRAN_MASTER_TMPL',
  UPDUSERTPL TYPE  RSSGTPDIR-UPDUSERTPL
    VALUE 'SAP',
  UPDDATETPL TYPE  RSSGTPDIR-UPDDATETPL
    VALUE '20220526',
  UPDTIMETPL TYPE  RSSGTPDIR-UPDTIMETPL
    VALUE '153620',
  SUBC TYPE  RSSGTPDIR-SUBC
    VALUE '1',
  WITH_SUBTEMPL TYPE  RSSGTPDIR-WITH_SUBTEMPL
    VALUE 'X',
END   OF _RSSG_C_PDIR.

  MOVE-CORRESPONDING _RSSG_C_PDIR TO E_S_PDIR.
  E_FOUND = 'X'.
ENDFORM.