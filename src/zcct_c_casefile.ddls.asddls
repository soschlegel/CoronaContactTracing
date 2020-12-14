@EndUserText.label: 'Projection View for casefile'
@AccessControl.authorizationCheck: #NOT_REQUIRED

@UI: {headerInfo: { typeName: 'CaseFile', typeNamePlural: 'CaseFiles' } }

@Search.searchable: true

define root view entity ZCCT_C_CASEFILE
  as projection on ZCCT_I_CASEFILE
{
       @UI.facet: [   {
                      id:               'CaseFileHeader',
                      purpose:          #HEADER,
                      type:             #FIELDGROUP_REFERENCE,
                      targetQualifier: 'header',
                      position:         10},
                      {
                      id:              'CaseFile',
                      purpose:         #STANDARD,
                      type:            #COLLECTION,
                      label:           'CaseFile',
                      position:        10
                      },
                      {
                      id:               'CaseFilePersons',
                      type:             #IDENTIFICATION_REFERENCE,
                      label:            'Information',
                      parentId:         'CaseFile',
                      position:         10
                      },
                      {
                      id:              'CaseDetails',
                      type:            #FIELDGROUP_REFERENCE,
                      label:           'Details',
                      targetQualifier: 'casedetails',
                      parentId:         'CaseFile',
                      position:        20
                      } ]
       @UI.hidden: true
  key  casefile_id              as CaseFileID,

       @UI: {
           lineItem:       [ { position: 20, importance: #HIGH } ],
           identification: [ { position: 20, label: 'TestCase' } ] }
       @Consumption.valueHelpDefinition: [{ entity : {name: 'ZCCT_I_TESTCASE', element: 'testid'  } }]
       @ObjectModel.text.element: ['TestCaseName']
       @Search.defaultSearchElement: true
       testcase_id              as TestCaseID,
       _TestCase.testresultdate as TestCaseName,

       @UI: {
           lineItem:       [ { position: 30, importance: #HIGH } ],
           identification: [ { position: 30, label: 'Employee' } ] }
       @Consumption.valueHelpDefinition: [{ entity : {name: 'ZCCT_I_HealthDepEm', element: 'emplyee_id'  } }]
       @ObjectModel.text.element: ['HealthDepEmName']
       @Search.defaultSearchElement: true
       healthdepem_id           as HealthDepartmentEmployeeID,
       _HealthDepEm.lastname    as HealthDepEmName,

       @UI: {
           lineItem:       [ { position: 40, importance: #HIGH } ] }
       //           identification: [ { position: 40, label: 'Start' } ] }
       @UI.fieldGroup: [{ qualifier: 'casedetails', label: 'Start' }]
       @Search.defaultSearchElement: true
       treatmentstart           as TreatmentStart,

       @UI: {
           lineItem:       [ { position: 50, importance: #HIGH } ] }
       //           identification: [ { position: 50, label: 'End' } ] }
       @UI.fieldGroup: [{ qualifier: 'casedetails', label: 'Ende' }]
       @Search.defaultSearchElement: true
       treatmentend             as TreatmentEnd,

       @UI: {
           selectionField: [{ position: 60 }],
           lineItem:       [ { position: 60, importance: #HIGH },
                             { type: #FOR_ACTION, dataAction: 'resolveCase', label: 'Resolve Case' } ],
           identification: [ { type: #FOR_ACTION, dataAction: 'resolveCase', label: 'Resolve Case' }]}
       @UI.fieldGroup: [{ qualifier: 'casedetails', label: 'Status O(pen)A(ctive)C(ancel)R(esolved)' }]
       @Search.defaultSearchElement: true
       casestatus               as CaseStatus,

       @UI.hidden: true
       created_by,

       @UI.hidden: true
       created_at,

       @UI.hidden: true
       last_changed_by,

       @UI.hidden: true
       last_changed_at
}
