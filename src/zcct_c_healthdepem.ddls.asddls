@EndUserText.label: 'projection view for health dep emplyee'
@AccessControl.authorizationCheck: #NOT_REQUIRED

@UI: {
 headerInfo: { typeName: 'Travel', typeNamePlural: 'Travels', title: { type: #STANDARD, value: 'employee_id' } } }

@Search.searchable: true

define root view entity ZCCT_C_HealthDepEm
  as projection on ZCCT_I_HealthDepEm
{
      @UI.facet: [ { id:              'Travel',
                     purpose:         #STANDARD,
                     type:            #IDENTIFICATION_REFERENCE,
                     label:           'Travel',
                     position:        10 } ]

      @UI.hidden: true
  key emplyee_id              as employee_id,

      @UI: {
          lineItem:       [ { position: 10, importance: #HIGH } ],
          identification: [ { position: 10, label: 'Travel ID [1,...,99999999]' } ] }
      @Search.defaultSearchElement: true
      firstname          as Firstname,
      
      @UI: {
          lineItem:       [ { position: 10, importance: #HIGH } ],
          identification: [ { position: 10, label: 'lastname' } ] }
      @Search.defaultSearchElement: true
      lastname          as Lastname


}
