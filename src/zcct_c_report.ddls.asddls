@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Query view for report'
//@Analytics.query: true
//@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@UI: {
 headerInfo: {
 typeName: 'Report',
 typeNamePlural: 'Reports',
 title: { type: #STANDARD, value: 'country' },
 description: { label: 'Federalstate', value: 'fedState' }
 }
}

@Search.searchable: true
@ObjectModel.representativeKey: 'id'
@Analytics.hidden: false

@UI.presentationVariant: [{qualifier: 'filter1', sortOrder: [{by: 'total', direction: #DESC }], 
                            visualizations: [{type: #AS_CHART, qualifier: 'filter1Chart' }] }]
//
//@UI.selectionPresentationVariant: [{qualifier: 'testresult', presentationVariantQualifier: 'testresult', selectionVariantQualifier: 'testresult'}]
//@UI.presentationVariant: [{qualifier: 'testresult', text: 'Testresults', visualizations: [{type: #AS_CHART, qualifier: 'ChartTestResults' }] }]
//@UI.selectionVariant: [{qualifier: 'testresult', text: 'testresults by country' }]
@UI.chart: [{
    title: 'Test results by country',
    description: 'Shows the test results sorted by countries.' ,
    chartType: #COLUMN,
    measures: ['total'],
    measureAttributes: [{ measure: 'total', role: #AXIS_1}],
    dimensions: ['county'],
    dimensionAttributes: [{ dimension: 'county', role: #CATEGORY }]
}, 
{
qualifier: 'filter1Chart',
chartType: #COLUMN,
dimensions:  [ 'county' ], 
measures:  [ 'total' ],
dimensionAttributes: [{dimension: 'county', role: #CATEGORY}],
measureAttributes: [{measure: 'total', role: #AXIS_1, asDataPoint: true }]
}]



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
//      @AnalyticsDetails.query.
//      @AnalyticsDetails.query.axis: #ROWS
      country,

      @UI: {
      lineItem:       [ { position: 20, importance: #HIGH, label: 'Federal State' } ]}
      @UI.hidden: false
      @Search.defaultSearchElement: true
      @EndUserText.label: 'Federal State'
//      @AnalyticsDetails.query.display: #KEY_TEXT
//      @AnalyticsDetails.query.axis: #ROWS
      fedState,

      @UI: {
      lineItem:       [ { position: 30, importance: #HIGH, label: 'County' } ],
      identification: [ { position: 30, label: 'County ID [1,...,99999999]' } ],
      selectionField: [{position: 10 }]}
      @UI.hidden: false
      @Search.defaultSearchElement: true
      @EndUserText.label: 'County'
      @Consumption.valueHelpDefinition: [{ 
        entity.name: 'ZCCT_I_COUNTY_M',
        entity.element: 'countyname'
      }
      ,
      {
      qualifier: 'visualFilter1',
      entity.name: 'ZCCT_C_REPORT',
      entity.element: 'county',
      presentationVariantQualifier: 'filter1'
      } ]
//      @AnalyticsDetails.query.display: #KEY_TEXT
//      @AnalyticsDetails.query.axis: #ROWS
      county,

      @UI: {
      lineItem:       [ { position: 40, importance: #HIGH, label: 'County population' } ]}
      @UI.hidden: false
      @EndUserText.label: 'Population of county'
//      @AnalyticsDetails.query.display: #KEY_TEXT
//      @AnalyticsDetails.query.axis: #ROWS
      countyPopulation,

      @UI: {
      lineItem:       [ { position: 50, importance: #HIGH, label: 'Test result' } ]}
      @UI.hidden: false
      @Search.defaultSearchElement: true
      @EndUserText.label: 'Test result'
//      @AnalyticsDetails.query.display: #KEY_TEXT
      @UI.dataPoint.title: 'TestResult'
//      @AnalyticsDetails.query.axis: #ROWS
      testresult,

      @UI: {
      lineItem:       [ { position: 60, importance: #HIGH, label: 'Test type'  } ]}
      @UI.hidden: false
      @Search.defaultSearchElement: true
      @EndUserText.label: 'Test type'
//      @AnalyticsDetails.query.display: #KEY_TEXT
      @UI.dataPoint.title: 'TestType'
//      @AnalyticsDetails.query.axis: #ROWS

      testtype,

      @UI: {
      lineItem:       [ { position: 70, importance: #HIGH, label: 'Test date' } ]}
      @UI.hidden: false
      @EndUserText.label: 'Test date'
//      @AnalyticsDetails.query.display: #KEY_TEXT
//      @AnalyticsDetails.query.axis: #ROWS
      testdate,

      @UI: {
      lineItem:       [ { position: 80, importance: #HIGH, label: 'Test result date' } ]}
      @UI.hidden: false
      @EndUserText.label: 'Test result date'
//      @AnalyticsDetails.query.display: #KEY_TEXT
//      @AnalyticsDetails.query.axis: #ROWS
      testresultdate,

      @Aggregation.referenceElement: ['testtype']
      @Aggregation.default: #COUNT_DISTINCT
      @UI: {
      lineItem:       [ { position: 90, importance: #HIGH, label: 'Total' } ]}
      @UI.hidden: false
      
//      @AnalyticsDetails.query.display: #KEY_TEXT
//      @AnalyticsDetails.query.axis: #ROWS
      cast( 18 as abap.int4 ) as total

}
