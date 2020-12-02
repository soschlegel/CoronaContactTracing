@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data model for testcase'
define root view entity ZCCT_I_TESTCASE
  as select from zcct_testcase as testcase

  /* Association */
  association [0..1] to zcct_testperson  as _testperson  on $projection.personid = _testperson.test_person_id
  association [0..1] to zcct_healthdepem as _healthdepem on $projection.employeeid = _healthdepem.emplyee_id
  association [0..1] to zcct_testtype    as _testtype    on $projection.testtype = _testtype.testtypeid
  association [0..1] to zcct_testresult  as _testresult  on $projection.testresult = _testresult.testresultid

{
  key testid,
      personid,
      employeeid,
      testtype,
      testdate,
      testtime,
      testresult,
      testresultdate,
      testresulttime,

      concat(_testperson.lastname, concat_with_space(',', _testperson.firstname, 1))    as personname,
      concat(_healthdepem.lastname, concat_with_space(', ', _healthdepem.firstname, 1)) as employeename,
      _testtype.testtypename                                                            as testtypename,
      _testresult.testresultname                                                        as testresultname,

      case testresult
        when 'N' then 3
        when 'P' then 1
        else 0
        end                                                                             as testresultcolor,

      /* ADMIN AREA */
      @Semantics.user.createdBy: true
      created_by,
      @Semantics.systemDateTime.createdAt: true
      created_at,
      @Semantics.user.lastChangedBy: true
      last_changed_by,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at,

      /* Public associations */
      _testperson,
      _healthdepem
}
