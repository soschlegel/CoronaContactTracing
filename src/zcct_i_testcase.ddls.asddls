@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data model for testcase'
define root view entity ZCCT_I_TESTCASE
  as select from zcct_testcase as testcase
  /* Association */
  association [0..1] to zcct_test_person on $projection.personid = zcct_test_person.mykey
  association [0..1] to zcct_healthdepem on $projection.employeeid = zcct_healthdepem.emplyee_id

{
  key testid,
      personid,
      employeeid,
      testtype,
      testdate,
      testtime,
      testresult,
      testresultdate,
      testresulttime
}
