@AbapCatalog.viewEnhancementCategory: [#NONE]
@EndUserText.label: 'Projection view for health department'
@AccessControl.authorizationCheck: #NOT_REQUIRED

@UI: {
 headerInfo: {
    typeName: 'Health Department',
    typeNamePlural: 'Health Departments',
    title: { type: #STANDARD, value: 'Name' } ,
    imageUrl: 'ImageUrl' ,
    description: { label : 'Last Changed', value: 'LastChangedAt' }
  }
}

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
        }],
      selectionField: [ { position: 10 } ]
        }
      @Search.defaultSearchElement: true
      Name,

      @UI:{
      lineItem: [{
      position: 20,
      importance: #HIGH,
      type: #STANDARD,
      label: 'County'
      }],
      identification: [{
        position: 30,
        label: 'County'
      }],
      selectionField: [ { position: 20 } ]
      }
      @Consumption.valueHelpDefinition: [{ entity : {name: 'ZCCT_I_COUNTY_M', element: 'countyuuid'  } }]

      @ObjectModel.text.element: ['CountyName']
      @Search.defaultSearchElement: true
      CountyId,
      _County.countyname    as CountyName,

      @UI:{
       lineItem: [{
       position: 30,
       importance: #HIGH,
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
        importance: #MEDIUM,
        type: #STANDARD,
        label: 'LeadingEmployee'
        }],
        identification: [{
          position: 40,
          label: 'LeadingEmployee'
        }],
      selectionField: [ { position: 30 } ]
        }
      @Consumption.valueHelpDefinition: [{ entity : {name: 'ZCCT_I_HEALTHDEPEM', element: 'emplyee_id'  } }]

      @ObjectModel.text.element: ['HealthdepemName']
      @Search.defaultSearchElement: true
      LeadingEmployeeId,
      _Healthdepem.lastname as HealthdepemName,


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

      @UI:{
      lineItem: [{
       position: 60,
       importance: #LOW,
       type: #STANDARD,
       label: 'Image Url'
       }],
       identification: [{
         position: 60,
         label: 'Image Url'
       }]
       }
      ImageUrl,

      @UI.hidden: true
      LastChangedAt,
      @UI.hidden: true
      LocalLastChangedAt
}
