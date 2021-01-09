//@AbapCatalog.viewEnhancementCategory: [#]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Query view for report'
//@Analytics.query: true
//@Metadata.ignorePropagatedAnnotations: true
//@ObjectModel.usageType:{
//    serviceQuality: #X,
//    sizeCategory: #S,
//    dataClass: #MIXED
//}
@UI: {
 headerInfo: {
 typeName: 'Report',
 typeNamePlural: 'Reports',
 title: { type: #STANDARD, value: 'country' },
 description: { label: 'Federalstate', value: 'fedState' }
 }
}

@Search.searchable: true

//@UI.selectionPresentationVariant: [{qualifier: 'testresult', presentationVariantQualifier: 'testresult', selectionVariantQualifier: 'testresult'}]
//@UI.presentationVariant: [{qualifier: 'testresult', text: 'Testresults', visualizations: [{type: #AS_CHART, qualifier: 'ChartTestResults' }] }]
//@UI.selectionVariant: [{qualifier: 'testresult', text: 'testresults by country' }]
//@UI.chart: [{
//    title: 'Test results by country',
//    description: 'Shows the test results sorted by countries.' ,
//    chartType: #COLUMN,
//    measures: ['testresult'],
//    measureAttributes: [{ measure: 'testresult', role: #AXIS_1 }],
//    dimensions: ['country'],
//    dimensionAttributes: [{ dimension: 'country', role: #CATEGORY }]
//}]


define view entity ZCCT_C_REPORT
  as select from ZCCT_I_REPORT
{
      @UI.facet: [ { id:              'Report',
                     purpose:         #STANDARD,
                     type:            #IDENTIFICATION_REFERENCE,
                     label:           'Report',
                     position:        5 } ]

      @UI.hidden: true
  key id,

      @UI: {
      lineItem:       [ { position: 10, importance: #HIGH, label: 'Country'} ]
      }
      @UI.hidden: false
      @Search.defaultSearchElement: true
      @EndUserText.label: 'Country'
//      @AnalyticsDetails.query.display: #KEY_TEXT
//      @AnalyticsDetails.query.axis: #FREE
      country,

      @UI: {
      lineItem:       [ { position: 11, importance: #MEDIUM, label: 'Federal State' } ]}
      @UI.hidden: false
      @Search.defaultSearchElement: true
      @EndUserText.label: 'Federal State'
      //      @AnalyticsDetails.query.display: #KEY_TEXT
      //      @AnalyticsDetails.query.axis: #FREE
      fedState,

      @UI: {
      lineItem:       [ { position: 12, importance: #MEDIUM, label: 'County' } ],
      identification: [ { position: 10, label: 'County ID [1,...,99999999]' } ]}
      @UI.hidden: false
      @Search.defaultSearchElement: true
      @EndUserText.label: 'County'
      //      @AnalyticsDetails.query.display: #KEY_TEXT
      //      @AnalyticsDetails.query.axis: #FREE
      county,

      @UI: {
      lineItem:       [ { position: 13, importance: #MEDIUM, label: 'County population' } ]}
      @EndUserText.label: 'Population of county'
      //      @AnalyticsDetails.query.display: #KEY_TEXT
      //      @AnalyticsDetails.query.axis: #FREE
      countyPopulation,

      @UI: {
      lineItem:       [ { position: 14, importance: #HIGH, label: 'Test result' } ]}
      @Search.defaultSearchElement: true
      @EndUserText.label: 'Test result'
      //      @AnalyticsDetails.query.display: #KEY_TEXT
      @UI.dataPoint.title: 'TestResult'
      //      @AnalyticsDetails.query.axis: #FREE
      testresult,

      @UI: {
      lineItem:       [ { position: 15, importance: #MEDIUM, label: 'Test type'  } ]}
      @Search.defaultSearchElement: true
      @EndUserText.label: 'Test type'
      //      @AnalyticsDetails.query.display: #KEY_TEXT
      @UI.dataPoint.title: 'TestType'
      //      @AnalyticsDetails.query.axis: #FREE

      testtype,

      @UI: {
      lineItem:       [ { position: 16, importance: #MEDIUM, label: 'Test date' } ]}
      @EndUserText.label: 'Test date'
      //      @AnalyticsDetails.query.display: #KEY_TEXT
      //      @AnalyticsDetails.query.axis: #FREE
      testdate,

      @UI: {
      lineItem:       [ { position: 17, importance: #MEDIUM, label: 'Test result date' } ]}
      @EndUserText.label: 'Test result date'
      //      @AnalyticsDetails.query.display: #KEY_TEXT
      //      @AnalyticsDetails.query.axis: #FREE
      testresultdate,

      @Aggregation.referenceElement: ['id']
      @Aggregation.default: #COUNT_DISTINCT
      @UI: {
      lineItem:       [ { position: 18, importance: #MEDIUM, label: 'Total' } ]}
      //      @AnalyticsDetails.query.display: #KEY_TEXT
      //      @AnalyticsDetails.query.axis: #FREE
      cast( 18 as abap.int4 ) as total

}
