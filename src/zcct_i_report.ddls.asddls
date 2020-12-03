@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS view for report'
define root view entity ZCCT_I_REPORT
  as select from zcct_report
{
      key id                        as ReportID,
      federal_state_id              as FederalStateId,
      federal_state_name            as FederalStateName,
      county_id                     as CountyId,
      countyname                    as Countyname,
      country                       as Country,
      test_cases_total              as TestCasesTotal,
      test_cases_positive           as TestCasesPositive,
      test_cases_negative           as TestCasesNegative,
      positive_cases_per_100000_res as PositiveCasesPer100000Res,
      risk_rating                   as RiskRating,
      report_date                   as ReportDate
      //    _association_name // Make association public
}
