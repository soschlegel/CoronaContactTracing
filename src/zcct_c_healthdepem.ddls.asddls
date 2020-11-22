@EndUserText.label: 'projection view for health dep emplyee'
@AccessControl.authorizationCheck: #NOT_REQUIRED

@UI: {
 headerInfo: { typeName: 'Employee', typeNamePlural: 'Employees', title: { type: #STANDARD, value: 'employee_id' } } }

@Search.searchable: true

define root view entity ZCCT_C_HealthDepEm
  as projection on ZCCT_I_HealthDepEm
{
      @UI.facet: [ { id:              'Employee',
                     purpose:         #STANDARD,
                     type:            #IDENTIFICATION_REFERENCE,
                     label:           'Travel',
                     position:        10 } ]
      @UI.hidden: true
  key emplyee_id      as employee_id,

      @UI: {
          lineItem:       [ { position: 20, importance: #HIGH } ],
          identification: [ { position: 20, label: 'firstname' } ] }
      @Search.defaultSearchElement: true
      firstname       as Firstname,

      @UI: {
          lineItem:       [ { position: 30, importance: #HIGH } ],
          identification: [ { position: 30, label: 'lastname' } ] }
      @Search.defaultSearchElement: true
      lastname        as Lastname,

      @UI: {
          lineItem:       [ { position: 40, importance: #HIGH } ],
          identification: [ { position: 40, label: 'created by' } ] }
      @Search.defaultSearchElement: true
      @UI.hidden: true
      created_by      as Created_by,

      @UI: {
        lineItem:       [ { position: 50, importance: #HIGH } ],
        identification: [ { position: 50, label: 'created at' } ] }
      @Search.defaultSearchElement: true
      @UI.hidden: true
      created_at      as created_at,

      @UI: {
              lineItem:       [ { position: 60, importance: #LOW } ],
              identification: [ { position: 60, label: 'last changed by' } ] }
      @Search.defaultSearchElement: true
      last_changed_by as last_changed_by,

      @UI: {
              lineItem:       [ { position: 70, importance: #LOW } ],
              identification: [ { position: 70, label: 'last changed at' } ] }
      @Search.defaultSearchElement: true
      last_changed_at as last_changed_at


}
