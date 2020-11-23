@EndUserText.label: 'Projection View for casefile'
@AccessControl.authorizationCheck: #CHECK
define root view entity ZCCT_C_CASEFILE
as projection on ZCCT_I_CASEFILE {
    key sysuuid_x16 as CaseFileID,
    testcase as TestCaseID,
    healthdepem as HealthDepartmentEmployeeID,
    treatmentstart as TreatmentStart,
    treatmentend as TreatmentEnd,
    casestatus as CaseStatus
}
