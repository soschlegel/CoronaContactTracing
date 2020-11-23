@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'data model for case file'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZCCT_I_CASEFILE as select from zcct_casefile as testcase
  /* Association */
  association [0..1] to zcct_testcase on $projection.testcase = zcct_testcase.testid
  association [0..1] to zcct_healthdepem on $projection.healthdepem = zcct_healthdepem.emplyee_id
  {
    key sysuuid_x16,
    testcase,
    healthdepem,
    treatmentstart,
    treatmentend,
    casestatus
}
