
define root view entity ZCCT_C_COUNTY_M as projection on ZCCT_I_COUNTY_M {
    
    @UI.hidden: true
    key countyuuid,
    @ObjectModel.text.element: ['CountyName']
    county_id,
    federal_state_id,
    countyname,
    created_by,
    created_at,
    last_changed_by,
    last_changed_at,
    local_last_changed_at
    
}
