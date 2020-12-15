@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'projection view for contactlist'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@UI: {
 headerInfo: { typeName: 'Contactlist', typeNamePlural: 'Contaclists', title: { type: #STANDARD, value: 'CasefileID' } } }
define root view entity ZCCT_C_CONTACTLIST
  as projection on ZCCT_I_CONTACTLIST
{

      @UI.facet: [ { id:              'Contact',
                      purpose:         #STANDARD,
                      type:            #IDENTIFICATION_REFERENCE,
                      label:           'Contact',
                      position:        10 } ]

//      @UI.hidden: true
  key contactlist_id              as ContactlistUUID,

      @UI: {
            lineItem:       [ { position: 10, importance: #HIGH, label: 'Casefile' },
                              { label: 'Notify contact',
                                type: #FOR_ACTION, dataAction: 'notifyContact'  } ],
            identification: [ { position: 10, importance: #HIGH, label: 'CaseFileID' },
                              { label: 'Notify contact', type: #FOR_ACTION, dataAction: 'notifyContact'  } ] }
      @Search.defaultSearchElement: true
      @Consumption.valueHelpDefinition: [{ entity : {name: 'ZCCT_I_CASEFILE', element: 'CasefileID'  } }]
      casefile_id                 as CasefileID,

      @UI: {
          lineItem:       [ { position: 41, importance: #MEDIUM } ],
          identification: [ { position: 41, label: 'City' } ] }
      contact_address_city        as City,
      @UI: {
          lineItem:       [ { position: 42, importance: #MEDIUM } ],
          identification: [ { position: 42, label: 'Country' } ] }
      contact_address_country     as Country,
      @UI: {
          lineItem:       [ { position: 43, importance: #MEDIUM } ],
          identification: [ { position: 43, label: 'Housenumber' } ] }
      contact_address_housenumber as Housenumber,
      @UI: {
          lineItem:       [ { position: 44, importance: #MEDIUM } ],
          identification: [ { position: 44, label: 'PLZ' } ] }
      contact_address_plz         as PLZ,
      @UI: {
          lineItem:       [ { position: 45, importance: #MEDIUM } ],
          identification: [ { position: 45, label: 'Streetname' } ] }
      contact_address_street      as Streetname,
      @UI: {
          lineItem:       [ { position: 46, importance: #MEDIUM } ],
          identification: [ { position: 46, label: 'Firstname' } ] }
      contact_firstname           as Firstname,
      @UI: {
                lineItem:       [ { position: 47, importance: #MEDIUM } ],
                identification: [ { position: 47, label: 'Lastname' } ] }
      contact_lastname            as Lastname,
      @UI: {
          lineItem:       [ { position: 48, importance: #MEDIUM } ],
          identification: [ { position: 48, label: 'EMailAddress' } ] }
      contact_mail_address        as EMailAddress,
      @UI: {
          lineItem:       [ { position: 49, importance: #MEDIUM } ],
          identification: [ { position: 49, label: 'Telephonenumber1' } ] }
      contact_telephone_number_1  as Telephonenumber1,
      @UI: {
          lineItem:       [ { position: 50, importance: #MEDIUM } ],
          identification: [ { position: 50, label: 'Telephonenumber2' } ] }
      contact_telephone_number_2  as Telephonenumber2,
      @UI: {
          lineItem:       [ { position: 51, importance: #MEDIUM } ],
          identification: [ { position: 51, label: 'Telephonenumber3' } ] }
      contact_telephone_number_3  as Telephonenumber3,
      @UI: {
          lineItem:       [ { position: 52, importance: #MEDIUM , label: 'isNotified' } ],
          identification: [ { position: 52, label: 'isNotified' } ] }
      contact_has_been_notified   as isNotified
}
