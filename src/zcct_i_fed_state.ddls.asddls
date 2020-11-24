@EndUserText.label: 'Federal state view - Processor'
@AccessControl.authorizationCheck: #NOT_REQUIRED

@UI: {
 headerInfo: { typeName: 'Federal state', imageUrl: 'imageURL', typeNamePlural: 'Federal states', title: { type: #STANDARD, value: 'Name' } } }

@Search.searchable: true

define root view entity ZCCT_I_FED_STATE
  as projection on ZCCT_M_FED_STATE

{

          @UI.facet: [ { id:              'FedState',
                         purpose:         #STANDARD,
                         type:            #IDENTIFICATION_REFERENCE,
                         label:           'FedState',
                         position:        10 } ]


          @UI.hidden: true
  key     id                                                                  as ID,

          @UI: {
          lineItem:       [ { position: 30, importance: #HIGH, label: 'Name' } ],
          identification: [ { position: 30, label: 'Name' } ]
          }
          @Search.defaultSearchElement: true
          name                                                                as Name,

          @UI: {
          lineItem:       [ { position: 40, importance: #HIGH } ],
          identification: [ { position: 40, label: 'Country Key' } ]
          }
          @Search.defaultSearchElement: true
          @Consumption.valueHelpDefinition: [{entity: {name: 'I_Country', element: 'Country' }}]
          countryid                                                           as Country,

          @UI: {
          identification: [ { position: 50, label: 'Picture' } ]
          }
          imageurl                                                            as imageURL,

          @UI: {
          lineItem:       [ { position: 60, importance: #HIGH } ],
          identification: [ { position: 60, label: 'Country Name' } ]
          }
          @Search.defaultSearchElement: true
          _Country._Text[ 1:Language = $session.system_language ].CountryName as CountryName,

          @UI.hidden: true
          last_changed_at                                                     as lastChanged



}
