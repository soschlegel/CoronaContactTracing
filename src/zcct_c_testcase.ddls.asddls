@EndUserText.label: 'Projection view for testcase'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@UI: {headerInfo: { typeName: 'Testcase', typeNamePlural: 'Testcases' } }
@Search.searchable: true
define root view entity ZCCT_C_TESTCASE
  as projection on ZCCT_I_TESTCASE
{
      @UI.facet: [ { id:              'testcase',
                       purpose:         #STANDARD,
                       type:            #IDENTIFICATION_REFERENCE,
                       label:           'Testcase - Details',
                       position:        10 } ]

      @UI.hidden: true
  key testid,
  

      @UI: {
          lineItem:       [ { position: 10, importance: #HIGH, label: 'Testperson' } ],
          identification: [ { position: 10, label: 'Testperson' } ]}
      @Consumption.valueHelpDefinition: [{ entity : {name: 'ZCCT_I_TEST_PERSON', element: 'test_person_id'  } }]
      @Search.defaultSearchElement: true
      personname,

      @UI: {
          lineItem:       [ { position: 20, importance: #HIGH , label: 'Mitarbeiter'} ],
          identification: [ { position: 20, label: 'Mitarbeiter' } ] }
      @Consumption.valueHelpDefinition: [{ entity : {name: 'ZCCT_I_HealthDepEm', element: 'emplyee_id'  } }]
      @Search.defaultSearchElement: true
      employeename,

      @UI: {
          lineItem:       [ { position: 30, importance: #HIGH, label: 'Testart'} ],
          identification: [ { position: 30, label: 'Testart' } ] }
      @Consumption.valueHelpDefinition: [{ entity : {name: 'ZCCT_I_TESTTYPE', element: 'testtypename'  } }]
      @Search.defaultSearchElement: true
      testtypename,

      @UI: {
          lineItem:       [ { position: 40, importance: #HIGH, label: 'Testdatum'} ],
          identification: [ { position: 40, label: 'Testdatum' } ] }
      @Search.defaultSearchElement: true
      testdate,

      @UI: {
          lineItem:       [ { position: 50, importance: #HIGH, label: 'Testzeit' } ],
          identification: [ { position: 50, label: 'Testzeit' } ] }
      @Search.defaultSearchElement: true
      testtime,

      @UI: {
          lineItem:       [ { position: 100, importance: #HIGH, label: 'Testergebnis', criticality: 'testresultcolor' }, 
                            { label: '🟢 Negativ', type: #FOR_ACTION, dataAction: 'setNegative' }, 
                            { label: '🔴 Positiv', type: #FOR_ACTION, dataAction: 'setPositive' } ],
          identification: [ { position: 35, label: 'Testergebnis', criticality: 'testresultcolor' } ] }
      @Consumption.valueHelpDefinition: [{ entity : {name: 'ZCCT_I_TESTRESULT', element: 'testresultname'  } }]
      @Search.defaultSearchElement: true
      testresultname,
      testresultcolor,

      @UI: {
          lineItem:       [ { position: 70, importance: #HIGH, label: 'Testergebnisdatum' } ],
          identification: [ { position: 70, label: 'Testergebnisdatum' } ] }
      @Search.defaultSearchElement: true
      testresultdate,

      @UI: {
          lineItem:       [ { position: 80, importance: #HIGH, label: 'Testergebniszeit' } ],
          identification: [ { position: 80, label: 'Testergebniszeit' } ] }
      @Search.defaultSearchElement: true
      testresulttime,

      @UI.hidden: true
      created_by,

      @UI.hidden: true
      created_at,

      @UI.hidden: true
      last_changed_by,

      @UI.hidden: true
      last_changed_at,

      @UI.hidden: true
      local_last_changed_at

}
