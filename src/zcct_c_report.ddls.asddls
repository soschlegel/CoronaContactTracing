@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ALP for report'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}

@ObjectModel.resultSet.sizeCategory: #XS
@Metadata.allowExtensions: true


//@Search.searchable: true
@ObjectModel.representativeKey: 'id'


define view entity ZCCT_C_REPORT
  as select from ZCCT_I_REPORT
{

  key id,


      @Search.defaultSearchElement: true
      @EndUserText.label: 'Country'
      country,

      fedstateid,

      @Search.defaultSearchElement: true
      @EndUserText.label: 'Federal State'
      fedstate,

      countyid,
        
      @Search.defaultSearchElement: true
      @EndUserText.label: 'County'
      county,

      @EndUserText.label: 'Population of county'
      countyPopulation,

      @Search.defaultSearchElement: true
      @EndUserText.label: 'Test result'
      testresult,

      @Search.defaultSearchElement: true
      @EndUserText.label: 'Test type'
      testtype,

      @EndUserText.label: 'Test date'
      testdate,

      @EndUserText.label: 'Test result date'
      testresultdate,

      @Aggregation.referenceElement: ['id']
      @Aggregation.default: #COUNT_DISTINCT
      @EndUserText.label: 'Total amount of test cases'
      cast( 18 as abap.int4 ) as total

}
