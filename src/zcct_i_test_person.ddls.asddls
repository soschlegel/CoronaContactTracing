@EndUserText.label: 'Data model for test person'
define root view entity ZCCT_I_TEST_PERSON
  as select from zcct_testperson

  /* Associations */
  //Change to refs to HealthDepartment and County
  //association [0..1] to /DMO/I_Agency   as _Agency   on $projection.agency_id = _Agency.AgencyID
  //association [0..1] to /DMO/I_Customer as _Customer on $projection.customer_id = _Customer.CustomerID

{
  key test_person_id,
      firstname,
      lastname,
      age,
      gender,
      county,
      healthdepartment,
      status

      /* Public associations */
      //Add HD and County
}
