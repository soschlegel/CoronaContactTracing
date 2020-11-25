@AbapCatalog.viewEnhancementCategory: [#NONE]
@EndUserText.label: 'Projection view for health department'
@AccessControl.authorizationCheck: #NOT_REQUIRED

@UI: {
 headerInfo: { typeName: 'Healthdep', typeNamePlural: 'Healthdeps', title: { type: #STANDARD, value: 'HealthdepId' } } }

@Search.searchable: true
define root view entity ZCCT_C_HEALTHDEP
  as projection on ZCCT_I_HEALTHDEP
{
      @UI.facet: [ { id:              'Healthdep',
                       purpose:         #STANDARD,
                       type:            #IDENTIFICATION_REFERENCE,
                       label:           'Healthdep',
                       position:        10 } ]

      @UI.hidden: true
  key HealthdepId,

      @UI:{
        lineItem: [{
        position: 10,
        importance: #HIGH,
        type: #STANDARD,
        label: 'Name'
        }],
        identification: [{
          position: 10,
          label: 'Name'
        }]
        }
      Name,

      @UI:{
      lineItem: [{
      position: 20,
      importance: #HIGH,
      type: #STANDARD,
      label: 'CountyId'
      }],
      identification: [{
        position: 30,
        label: 'CountyId'
      }]
      }
      @Consumption.valueHelpDefinition: [{ entity : {name: 'ZCCT_I_COUNTY_M', element: 'COUNTYUUID'  } }]

      @ObjectModel.text.element: ['CountyId']
      @Search.defaultSearchElement: true
      CountyId,

      @UI:{
       lineItem: [{
       position: 30,
       importance: #MEDIUM,
       type: #STANDARD,
       label: 'Address'
       }],
       identification: [{
         position: 30,
         label: 'Address'
       }]
       }
      Address,

      @UI:{
        lineItem: [{
        position: 40,
        importance: #HIGH,
        type: #STANDARD,
        label: 'LeadingEmployeeId'
        }],
        identification: [{
          position: 30,
          label: 'LeadingEmployeeId'
        }]
        }
      @Consumption.valueHelpDefinition: [{ entity : {name: 'ZCCT_I_HEALTHDEPEM', element: 'emplyee_id'  } }]

      @ObjectModel.text.element: ['LeadingEmployeeId']
      @Search.defaultSearchElement: true
      LeadingEmployeeId,

      
      @UI:{
       lineItem: [{
       position: 50,
       importance: #MEDIUM,
       type: #STANDARD,
       label: 'Additional Information'
       }],
       identification: [{
         position: 50,
         label: 'Additional Information'
       }]
       }
      AdditionalDescription,

      @UI.hidden: true
      LastChangedAt
}
