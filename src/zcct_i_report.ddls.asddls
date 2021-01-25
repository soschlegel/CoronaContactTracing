@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS view for report'
@Analytics.dataCategory: #DIMENSION
@ObjectModel.representativeKey: 'id'

define view entity ZCCT_I_REPORT 
  as select from ZCCT_I_TESTCASE as testcase

  /* Association */
  //  association [0..1] to ZCCT_I_TESTTYPE    as _testtype    on $projection.testtype = _testtype.testtypeid
  //  association [0..1] to ZCCT_I_TESTRESULT  as _testresult  on $projection.testresult = _testresult.testresultid
  association [0..1] to ZCCT_I_TESTTYPE   as _TestType   on testcase.testtype = _TestType.testtypeid
  association [0..1] to ZCCT_I_TESTRESULT as _TestResult on testcase.testresult = _TestResult.testresultid

{

  key testcase.testid                              as id,
      @ObjectModel.foreignKey.association: '_TestResult'
      testcase.testresult                          as testresult,
      @ObjectModel.foreignKey.association: '_TestType'
      testcase.testtype                            as testtype,
     // testcase.testtypename                        as testtypename,
     concat(concat(testcase.testtypename,' ('), concat(testcase.testtype,')')) as testtypename, 
      testcase.testdate                            as testdate,
      testcase.testresultdate                      as testresultdate,
      _TestResult                                  as result,
      _testperson._County._FEDERAL_STATE.countryid as country,   
      _testperson._County.federal_state_id         as fedstateid,
      _testperson._County._FEDERAL_STATE.name      as fedstate,
      _testperson._County.countyuuid               as countyid,
      _testperson._County.countyname               as county,
      _testperson._County.population               as countyPopulation, 

      //      positive_cases_per_100000_res as PositiveCasesPer100000Res,
      //      risk_rating                   as RiskRating,

     /* Public associations */
      _TestType,
      _TestResult
//      _TestPerson._County as County

}
