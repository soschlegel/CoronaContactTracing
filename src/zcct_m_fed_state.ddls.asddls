@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'data model for fed state'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZCCT_M_FED_STATE
  as select from zcct_fedstate as FedState
  
    association [0..1] to I_Country as _Country on $projection.countryid = _Country.Country
{
  key id,
      name,
      countryid,
      imageurl,

      /*-- Admin data --*/
      created_by,
      created_at,
      last_changed_by,
      last_changed_at,
      local_last_changed_at,
      
      
      /* Public associations */
      _Country
}
