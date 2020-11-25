@EndUserText.label: 'Travel projection view - Processor'
@AccessControl.authorizationCheck: #NOT_REQUIRED

@UI: {
 headerInfo: { typeName: 'Person', typeNamePlural: 'Persons'} }

@Search.searchable: true

define root view entity ZCCT_I_PROJECTION_TEST_PERSON
  as projection on ZCCT_I_TEST_PERSON
{
  key mykey     as MyKey,

      @UI.lineItem: [{ label: 'Vorname' }]
      firstname as Firstname,
      
      @UI.lineItem: [{ label: 'Nachname' }]
      lastname  as Lastname,
      
      @UI.lineItem: [{ label: 'Status' }]
      status    as Status
}
