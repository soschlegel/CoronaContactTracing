@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data Model for Healthdepem'
define root view entity ZCCT_I_HealthDepEm
  as select from zcct_healthdepem
//  association [0..1] to zcct_healthdep as _HEALTHDEP on $projection.healthdep_id = _HEALTHDEP.healthdep_id
{
  key emplyee_id,
//  + foreign key healthdep_id,
      firstname,
      lastname,
      created_by,
      created_at,
      last_changed_by,
      last_changed_at
//      public associations
//      _HEALTHDEP

}
