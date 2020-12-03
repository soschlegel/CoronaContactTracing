@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'data model for county'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZCCT_I_COUNTY_M
  as select from zcct_county

  association [0..1] to ZCCT_M_FED_STATE      as _FEDERAL_STATE on $projection.federal_state_id = _FEDERAL_STATE.id

{

  key countyuuid,
      county_id,
      federal_state_id,
      countyname,
      population,
      image_url,

      /* ADMIN AREA */
      @Semantics.user.createdBy: true
      created_by,
      @Semantics.systemDateTime.createdAt: true
      created_at,
      @Semantics.user.lastChangedBy: true
      last_changed_by,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at,
      
       /* Public associations */
      _FEDERAL_STATE

}
