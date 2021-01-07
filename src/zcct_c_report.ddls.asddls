@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection view for report'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZCCT_C_REPORT
  as select from ZCCT_I_REPORT
{

  key id,
      //      county.countyname as countyname,

      @UI: {
      lineItem:       [ { position: 10, importance: #HIGH, label: 'Country' } ]}
      country,

      @UI: {
      lineItem:       [ { position: 11, importance: #MEDIUM, label: 'Federal State' } ]}
      fedState,

      @UI: {
      lineItem:       [ { position: 12, importance: #MEDIUM, label: 'County' } ]}
      county,

      @UI: {
      lineItem:       [ { position: 13, importance: #MEDIUM, label: 'County population' } ]}
      countyPopulation,

      @UI: {
      lineItem:       [ { position: 14, importance: #HIGH, label: 'Test result' } ]}
      testresult,

      @UI: {
      lineItem:       [ { position: 15, importance: #MEDIUM, label: 'Test type'  } ]}
      testtype,

      @UI: {
      lineItem:       [ { position: 16, importance: #MEDIUM, label: 'Test date' } ]}
      testdate,

      @UI: {
      lineItem:       [ { position: 17, importance: #MEDIUM, label: 'Test result date' } ]}
      testresultdate,

      @Aggregation.referenceElement: ['id']
      @Aggregation.default: #COUNT_DISTINCT
      @Search.defaultSearchElement: true
      @UI: {
      lineItem:       [ { position: 18, importance: #MEDIUM, label: 'Total' } ]}
      cast( 18 as abap.int4 ) as total

}
