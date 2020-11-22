# Corona Contact Tracing

Corona Contact Tracing with SAP RAP on Steampunk

## Story and Use-Case

To be defined

## Relevant Processes

1. Maintenance of federal states **(Group 04)**
   1. Re-Use **I_Country** in the federal state definition
2. Maintenance of counties **(Group 02)**
   1. Assign a county to a federal state
3. Maintenance of public health departments **(Group 03)**
   1. To clarify: Do we have one health department per county?
4. Add an Health Department Employee **(Group 09)**
5. Add a test person **(Group 10)**
   1. Assignment of county and health department
6. Created test result for a test person **(Group 07)**
   1. Test is positive
   2. Created a case file as an action
7. For each positive Test, we have a case file **(Group 08)**
   1. Assign an employee to a case
8. Part of the case file is a contact list **(Group 01)**
   1. Persons can be added
   2. An action can change the status
9. Notify "contact person" **(Group 05)**
    1. Call any external web-API
10. Reporting on country-level **(Group 06)**
11. Reporting on federal state level **(Group 06)**
12. Reporting on county level **(Group 06)**

## Data-Model

- Federal-State
  - Table-Name: ZCCT_FedState
  - CDS_View:
- County
  - Table-Name: ZCCT_County
- Health-Department
  - Table-Name: ZCCT_HealthDep
- Health-Department-Employee
  - Table-Name: ZCCT_HealthDepEm
- Tested-Person
  - Table-Name: ZCCT_TestPerson
- Test-Case
  - Table-Name: ZCCT_TestCase
- Case-File
  - Table-Name: ZCCT_CaseFile
- Contact-List
  - Table-Name: ZCCT_ContactList
  - Fields:
    - Key: GUID
    - Foreign-Key: CaseFileGUID

## Hints

### Links

- [Tutorial by Soeren](https://github.com/soschlegel/abap.livecoding)

### Struct for administrative Data on Table-Level:

```abap
  created_by            : syuname;  
  created_at            : timestampl;
  last_changed_by       : syuname;
  last_changed_at       : timestampl;
  local_last_changed_at : timestampl;
```

## Naming Conventions

- Table: ZCCT_>>DESCR<<
- Classes: ZCL_CCT_>>DESCR<<
- View: ZCCT_I_>>DECSR<<
- Behaviour-Definition: same like View
- Service-Definition: ZSD_CCT_>>DESCR<<
- Service-Binding: ZSB_CCT_>>DESCR<<