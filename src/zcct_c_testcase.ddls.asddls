@EndUserText.label: 'Projection view for testcase'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@UI: {headerInfo: { typeName: 'Testcase', typeNamePlural: 'Testcases' } }
@Metadata.allowExtensions: true
define root view entity ZCCT_C_TESTCASE
  as projection on ZCCT_I_TESTCASE
{
      
  key testid,

      @ObjectModel.text.control: #NONE
      @ObjectModel.text.element: ['personname']
      personid,
      personname,
      employeeid,
//      employeename,
      testtype,
//      testtypename,
      testdate,
      testtime,
      testresult,
//      testresultname,
      testresultcolor,
      testresultdate,
      testresulttime,

      created_by,
      created_at,
      last_changed_by,
      last_changed_at,
      local_last_changed_at
}
