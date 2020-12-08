@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'data model for contactlist'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZCCT_I_CONTACTLIST
  as select from zcct_contactlist as ContactlistTable
  association [0..1] to ZCCT_I_CASEFILE as _Casefile on $projection.contactlist_id = _Casefile.casefile_id
{
  key contactlist_id,
      casefile_id,
      contact_address_city,
      contact_address_country,
      contact_address_housenumber,
      contact_address_plz,
      contact_address_street,
      contact_firstname,
      contact_has_been_notified,
      contact_lastname,
      contact_mail_address,
      contact_telephone_number_1,
      contact_telephone_number_2,
      contact_telephone_number_3,

      _Casefile

}
