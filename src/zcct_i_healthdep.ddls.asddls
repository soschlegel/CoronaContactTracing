@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Data model for health department'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZCCT_I_HEALTHDEP
  as select from zcct_healthdep as Healthdep

  /* Associations */

  
    association [0..1] to ZCCT_I_COUNTY_M as _County on $projection.CountyId = _County.countyuuid
    association [0..1] to ZCCT_I_HealthDepEm as _Healthdepem on $projection.LeadingEmployeeId = _Healthdepem.emplyee_id
  

{
  key healthdep_id           as HealthdepId,
      name                   as Name,
      county_id              as CountyId,
      address                as Address,
      leading_employee_id    as LeadingEmployeeId,
      additional_description as AdditionalDescription,
      @Semantics.user.createdBy: true
      created_by             as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at             as CreatedAt,
      @Semantics.user.lastChangedBy: true
      last_changed_by        as LastChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at        as LastChangedAt,
      
      
      _County,
      _Healthdepem
      
}
