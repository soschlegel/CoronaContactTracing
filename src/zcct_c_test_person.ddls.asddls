@EndUserText.label: 'Travel projection view - Processor'
@AccessControl.authorizationCheck: #NOT_REQUIRED

@UI: {
 headerInfo: { typeName: 'Person', typeNamePlural: 'Persons'} }

//@Search.searchable: true

define root view entity ZCCT_C_TEST_PERSON
  as projection on ZCCT_I_TEST_PERSON
{

      @UI.facet: [ {
        id: 'idCollection',
        type: #COLLECTION,
        label: 'Test Person',
        position: 10
      },
      {
        id: 'idIdentification',
        parentId: 'idCollection',
        type: #IDENTIFICATION_REFERENCE,
        label: 'General Information',
        position: 10
      } ]

  key test_person_id   as TestPersonId,

      @UI:{
      lineItem: [{
      position: 10,
      importance: #HIGH,
      type: #STANDARD,
      label: 'Firstname'
      }],
      identification: [{
        position: 10,
        label: 'Firstname'
      }]
      }
      firstname        as Firstname,

      @UI:{
      lineItem: [{
      position: 20,
      importance: #HIGH,
      type: #STANDARD,
      label: 'Lastname'
      }],
      identification: [{
        position: 20,
        label: 'Lastname'
      }]
      }
      lastname         as Lastname,

      @UI:{
      lineItem: [{
      position: 30,
      importance: #HIGH,
      type: #STANDARD,
      label: 'Status'
      }],
      identification: [{
        position: 30,
        label: 'Status'
      }]
      }
      status           as Status,

      @UI:{
      lineItem: [{
      position: 40,
      importance: #HIGH,
      type: #STANDARD,
      label: 'Age'
      }],
      identification: [{
        position: 30,
        label: 'Age'
      }]
      }
      age              as Age,

      @UI:{
      lineItem: [{
      position: 50,
      importance: #HIGH,
      type: #STANDARD,
      label: 'Gender'
      }],
      identification: [{
        position: 30,
        label: 'Gender'
      }]
      }
      gender           as Gender,

      @UI:{
      lineItem: [{
      position: 60,
      importance: #HIGH,
      type: #STANDARD,
      label: 'County'
      }],
      identification: [{
        position: 30,
        label: 'County'
      }]
      }
      @Consumption.valueHelpDefinition: [{ entity : {name: 'zcct_I_county_M', element: 'countyname'  } }]
      county           as County,

      @UI:{
      lineItem: [{
      position: 70,
      importance: #HIGH,
      type: #STANDARD,
      label: 'HealthDepartment'
      }],
      identification: [{
        position: 30,
        label: 'HealthDepartment'
      }]
      }
      //@Consumption.valueHelpDefinition: [{ entity : {name: 'zcct_healthdep', element: 'name'  } }]
      healthdepartment as HealthDepartment,

      @UI.hidden: true
      last_changed_at  as LastChangedAt
}
