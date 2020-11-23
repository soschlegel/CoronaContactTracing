@EndUserText.label: 'Projection View for casefile'
@AccessControl.authorizationCheck: #CHECK
define root view entity ZCCT_C_CASEFILE
  as projection on ZCCT_I_CASEFILE
{
  key  casefile_id    as CaseFileID,
       testcase_id    as TestCaseID,
       healthdepem_id as HealthDepartmentEmployeeID,
       treatmentstart as TreatmentStart,
       treatmentend   as TreatmentEnd,
       casestatus     as CaseStatus
}
