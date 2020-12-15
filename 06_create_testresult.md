# AUFGABE 6

## Created test result for test person

In database **zcct_testcase** we created the following parameters:

- key client            : abap.clnt not null; *-> in every database*
- key testid            : sysuuid_x16 not null; *-> our key*
These parameters can be created manuelly when creating a new testcase:
- personid              : sysuuid_x16; *-> from view from database (zcct_i_testperson)*
- employeeid            : sysuuid_x16; *-> from view from database (zcct_i_healthdepem)*
- testtype              : zcct_de_testtype; *-> from view of our data element (zcct_i_testtype)*
- testdate              : abap.dats;
- testtime              : abap.tims;
---
These parameters were filled automatically when pressing the action button (🔴Positiv/🟢Negativ):
- testresult            : zcct_de_testresult; *-> from view of our data element (zcct_i_testresult)*
- testresultdate        : abap.dats;
- testresulttime        : abap.tims;
---
These parameters were filled automatically when creating a new testcase or editing an existing testcase:
- created_by            : syuname;
- created_at            : timestampl;
- last_changed_by       : syuname;
- last_changed_at       : timestampl;
- local_last_changed_at : timestampl;
---

In the Cloud Application you can create new testcases by clicking on the 'create'-button. You have to fill the mandatory fields 'Testperson', 'Mitarbeiter', 'Testart' und 'Testdatum'. 'Testzeit' is an optional field. When all mandatory fields are filled you can pressed 'save' and a new testcase was created in the database. If any mandatory field isn't filled or wrong filled you will get an error message.

If you get the testresult you must select the given testcase and pressed 🔴Positiv/🟢Negativ depending on the result. In both cases the testresult changes to 🔴Positiv/🟢Negativ and the testresultdate and testresulttime are automatically changed to the current date and time. 

If the testresult is 🔴Positiv, a new entry is additionally created into the database zcct_i_casefile. Within this entry a new UUID for the key parameter casefile_id will be created. testcase_id, healthdepem_id, created_by, created_at, last_changed_by and last_changed_at will be filled with our parameters or the current timestamp/user.
