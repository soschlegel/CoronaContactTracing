@EndUserText.label: 'Data model for test person'
define root view entity ZCCT_I_TEST_PERSON
  as select from zcct_testperson

  /* Associations */
  //Change to refs to HealthDepartment and County
  association [0..1] to ZCCT_I_HEALTHDEP as _HealthDepartment on $projection.healthdepartment = _HealthDepartment.Name
  association [0..1] to ZCCT_I_COUNTY_M  as _County           on $projection.county = _County.countyname

{
  key test_person_id,
      firstname,
      lastname,
      age,
      gender,
      county,
      healthdepartment,
      //status,

      /*-- Admin data --*/
      @Semantics.user.createdBy: true
      created_by,
      @Semantics.systemDateTime.createdAt: true
      created_at,
      @Semantics.user.lastChangedBy: true
      last_changed_by,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at,

      /* Public associations */
      _County,
      _HealthDepartment
}
