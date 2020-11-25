@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data model for testtype'
define root view entity ZCCT_I_TESTTYPE as select from zcct_testtype {
    key testtypeid,
    testtypename
}
