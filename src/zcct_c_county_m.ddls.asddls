@EndUserText.label: 'Counties'
@AccessControl.authorizationCheck: #NOT_REQUIRED

@UI: {
 headerInfo: {
 imageUrl: 'image_url',
 typeName: 'County',
 typeNamePlural: 'Counties',
 title: { type: #STANDARD, value: 'countyname' },
 description: { label: 'Federalstate', value: 'FederalStateName' }
 }
}

@Search.searchable: true

define root view entity ZCCT_C_COUNTY_M
  as projection on ZCCT_I_COUNTY_M
{

      @UI.facet: [ { id:              'County',
               purpose:         #STANDARD,
               type:            #IDENTIFICATION_REFERENCE,
               label:           'County',
               position:        10 } ]

      @UI.hidden: true
  key countyuuid,

      @UI: {
          lineItem:       [ { position: 10, label:'County ID', importance: #HIGH } ],
          identification: [ { position: 10, label: 'County ID [1,...,99999999]' } ] }
      @Search.defaultSearchElement: true
      county_id,

      @EndUserText.label: 'Federal State'
      @UI: {
      lineItem:       [ { position: 20, label:'Federale State', importance: #HIGH } ],
      identification: [ { position: 20, label: 'Federal State' } ],
      selectionField: [ { position: 20 } ] }
      @Consumption.valueHelpDefinition: [{ entity : {name: 'ZCCT_M_FED_STATE', element: 'id'  } }]
      
      @ObjectModel.text.element: ['FederalStateName']
      @Search.defaultSearchElement: true
      federal_state_id, 
      
       @UI.hidden: true
      _FEDERAL_STATE.name as FederalStateName,

      @EndUserText.label: 'County Name'
      @UI: {
          lineItem:       [ { position: 30,label:'County Name', importance: #HIGH } ],
          identification: [ { position: 30, label: 'County Name' } ],
          selectionField: [ { position: 30 } ] }
      @Search.defaultSearchElement: true
      countyname,
      
      @EndUserText.label: 'Population'
      @UI: {
          lineItem:       [ { position: 40,label:'Population', importance: #HIGH } ],
          identification: [ { position: 40, label: 'Population' } ]
         }
      population,
        
      @UI: {
      identification: [ { position: 40, label: 'County Image Url' } ] }
      @Search.defaultSearchElement: true
      image_url,

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
