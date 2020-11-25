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

  /*association [0..1] to ZCCT_FEDERAL_STATES      as _FEDERAL_STATES on $projection.federal_state_id = _FEDERAL_STATES.FEDERAL_STATES_ID*/

{

  key countyuuid,
      county_id,
      federal_state_id,
      countyname,

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
      local_last_changed_at
      
      /* Public associations */
      /*_FEDERAL_STATES*/

}
