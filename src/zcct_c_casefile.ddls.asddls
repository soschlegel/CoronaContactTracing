@EndUserText.label: 'Projection View for casefile'
@AccessControl.authorizationCheck: #NOT_REQUIRED

@UI: {headerInfo: { typeName: 'CaseFile', typeNamePlural: 'CaseFiles' } }

@Search.searchable: true

define root view entity ZCCT_C_CASEFILE
  as projection on ZCCT_I_CASEFILE
{
       @UI.facet: [ { id:              'CaseFile',
                      purpose:         #STANDARD,
                      type:            #IDENTIFICATION_REFERENCE,
                      label:           'CaseFile',
                      position:        10 } ]
       @UI.hidden: true
  key  casefile_id    as CaseFileID,

       @UI: {
           lineItem:       [ { position: 20, importance: #HIGH } ],
           identification: [ { position: 20, label: 'TestCase' } ] }
       @Consumption.valueHelpDefinition: [{ entity : {name: 'ZCCT_I_TESTCASE', element: 'testid'  } }]
       @Search.defaultSearchElement: true
       testcase_id    as TestCaseID,

       @UI: {
           lineItem:       [ { position: 30, importance: #HIGH } ],
           identification: [ { position: 30, label: 'Employee' } ] }
       @Consumption.valueHelpDefinition: [{ entity : {name: 'ZCCT_I_HealthDepEm', element: 'emplyee_id'  } }]
       @Search.defaultSearchElement: true
       healthdepem_id as HealthDepartmentEmployeeID,

       @UI: {
           lineItem:       [ { position: 40, importance: #HIGH } ],
           identification: [ { position: 40, label: 'Start' } ] }
       @Search.defaultSearchElement: true
       treatmentstart as TreatmentStart,

       @UI: {
           lineItem:       [ { position: 50, importance: #HIGH } ],
           identification: [ { position: 50, label: 'End' } ] }
       @Search.defaultSearchElement: true
       treatmentend   as TreatmentEnd,

       @UI: {
           lineItem:       [ { position: 60, importance: #HIGH } ],
           identification: [ { position: 60, label: 'Status O(pen)A(ctive)C(ancel)R(esolved)' } ] }
       @Search.defaultSearchElement: true
       casestatus     as CaseStatus,

      @UI.hidden: true
      created_by,

      @UI.hidden: true
      created_at,

      @UI.hidden: true
      last_changed_by,

      @UI.hidden: true
      last_changed_at
}
