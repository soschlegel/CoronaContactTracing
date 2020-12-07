@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS view for report'
define view entity ZCCT_I_REPORT
  as select from ZCCT_I_TESTCASE

{
      key ZCCT_I_TESTCASE.testid,
          ZCCT_I_TESTCASE.personid,
          ZCCT_I_TESTCASE.employeeid,
          ZCCT_I_TESTCASE.testtype,
          ZCCT_I_TESTCASE.testdate,
          ZCCT_I_TESTCASE.testtime,
          ZCCT_I_TESTCASE.testresult,
          ZCCT_I_TESTCASE.testresultdate,
          ZCCT_I_TESTCASE.testresulttime,
          ZCCT_I_TESTCASE.personname,
          ZCCT_I_TESTCASE.employeename,
          ZCCT_I_TESTCASE.testtypename,
          ZCCT_I_TESTCASE.testresultname,
          ZCCT_I_TESTCASE.testresultcolor,
          ZCCT_I_TESTCASE.created_by,
          ZCCT_I_TESTCASE.created_at,
          ZCCT_I_TESTCASE.last_changed_by,
          ZCCT_I_TESTCASE.last_changed_at,
          ZCCT_I_TESTCASE.local_last_changed_at,
          /* Associations */
          zcct_i_testcase._healthdepem,
          zcct_i_testcase._testperson
//          _healthdepem.
          

//      positive_cases_per_100000_res as PositiveCasesPer100000Res,
//      risk_rating                   as RiskRating,
      //    _association_name // Make association public
}
