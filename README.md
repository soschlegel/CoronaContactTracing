# Corona Contact Tracing

Corona Contact Tracing with SAP RAP on Steampunk

## Story and Use-Case

To be defined

## Relevant Processes

1. Maintenance of federal states
   1. Re-Use **I_Country** in the federal state definition
2. Maintenance of counties
   1. Assign a county to a federal state
3. Maintenance of public health departments
   1. To clarify: Do we have one health department per county?
4. Add an Health Department Employee
5. Add a test person
   1. Assignment of county and health department
6. Created test result for a test person
   1. Test is positive
   2. Created a case file as an action
7. For each positive Test, we have a case file
   1. Assign an employee to a case 
8. Part of the case file is a contact list
   1. Persons can be added
   2. An action can change the status
9. Notify "contact person"
    1. Call any external web-API
10. Reporting on country-level
11. Reporting on federal state level
12. Reporting on county level

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

Struct for administrative Data on Table-Level:

```abap
  created_by            : syuname;  
  created_at            : timestampl;
  last_changed_by       : syuname;
  last_changed_at       : timestampl;
  local_last_changed_at : timestampl;
```
