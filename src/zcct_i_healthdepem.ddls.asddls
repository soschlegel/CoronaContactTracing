@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data Model for Healthdepem'
define root view entity ZCCT_I_HealthDepEm
  as select from zcct_healthdepem
//  association [0..1] to zcct_healthdep as _HEALTHDEP on $projection.healthdep_id = _HEALTHDEP.healthdep_id

association [1..1] to ZCCT_I_HEALTHDEP as _HEALTHDEP on $projection.healthdep_id = _HEALTHDEP.HealthdepId
{
  key emplyee_id,
//  + foreign key healthdep_id,
      firstname,
      lastname,
      healthdep_id,
      @Semantics.user.createdBy: true
      created_by,
      @Semantics.systemDateTime.createdAt: true
      created_at,
      @Semantics.user.lastChangedBy: true
      last_changed_by,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at,
//      public associations
      _HEALTHDEP

}
