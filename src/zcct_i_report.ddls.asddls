@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS view for report'
@Analytics.query: true

define view entity ZCCT_I_REPORT
  as select from ZCCT_I_TESTCASE as testcase

  /* Association */
  association [0..1] to ZCCT_I_TESTTYPE    as _testtype    on $projection.testtype = _testtype.testtypeid
  association [0..1] to ZCCT_I_TESTRESULT  as _testresult  on $projection.testresult = _testresult.testresultid
  
{

      key testcase.testid as  id,
//      county.countyname as countyname, 
      testcase.testresult as testresult,  
      testtype as testtype,
      testcase.testdate as testdate,
      testcase.testresultdate as testresultdate,
      _testperson._County._FEDERAL_STATE.countryid as country,
      _testperson._County._FEDERAL_STATE.name as fedState,
      _testperson._County.countyname as county,
      _testperson._County.population as countyPopulation,
      _testresult as result,
       

//      positive_cases_per_100000_res as PositiveCasesPer100000Res,
//      risk_rating                   as RiskRating,

      /* Public associations */
      _testtype

}
