@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'data model for case file'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZCCT_I_CASEFILE
  as select from zcct_case_file
  /* Association */
  association [0..1] to ZCCT_I_TESTCASE    as _TestCase    on $projection.testcase_id = _TestCase.testid
  association [0..1] to ZCCT_I_HealthDepEm as _HealthDepEm on $projection.healthdepem_id = _HealthDepEm.emplyee_id
{
  key casefile_id,
      testcase_id,
      healthdepem_id,
      treatmentstart,
      treatmentend,
      casestatus,
      
      /* ADMIN AREA */
      @Semantics.user.createdBy: true
      created_by,
      @Semantics.systemDateTime.createdAt: true
      created_at,
      @Semantics.user.lastChangedBy: true
      last_changed_by,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at,
      
      _TestCase,
      _HealthDepEm
}
