@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data model for testresult'
define root view entity ZCCT_I_TESTRESULT as select from zcct_testresult {
    key testresultid,
    testresultname
}
