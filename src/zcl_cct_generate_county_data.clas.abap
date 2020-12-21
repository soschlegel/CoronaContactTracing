CLASS zcl_cct_generate_county_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_cct_generate_county_data IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.
    DATA itab TYPE TABLE OF zcct_county.

*   fill internal travel table (itab)
    itab = VALUE #(
     ( COUNTYUUID ='02DFE0A3F9381EDB8DAD3DD3EA72F300' FEDERAL_STATE_ID ='02DE1D2CB38E1EEB8C9420F2C5A4D300' COUNTY_ID ='00000001' COUNTYNAME ='Alb-Donau-Kreis' POPULATION ='197076' IMAGE_URL =
'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/Landkreiswappen_des_Landkreises_Alb-Donau-Kreis.svg/1280px-Landkreiswappen_des_Landkreises_Alb-Donau-Kreis.svg.png')
( COUNTYUUID ='02DFE0A3F9381EDB8DAD3DD3EA72F301' FEDERAL_STATE_ID ='02DE1D2CB38E1EEB8C9420F2C5A4D300' COUNTY_ID ='00000002' COUNTYNAME ='Baden-Baden' POPULATION ='55185' IMAGE_URL =
'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2d/Stadtwappen_der_Stadt_Baden-Baden.svg/1024px-Stadtwappen_der_Stadt_Baden-Baden.svg.png')
( COUNTYUUID ='02DFE0A3F9381EDB8DAD3DD3EA72F302' FEDERAL_STATE_ID ='02DE1D2CB38E1EEB8C9420F2C5A4D300' COUNTY_ID ='00000003' COUNTYNAME ='Biberach' POPULATION ='201282' IMAGE_URL =
'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5f/Wappen_Landkreis_Biberach.svg/1024px-Wappen_Landkreis_Biberach.svg.png')
( COUNTYUUID ='02DFE0A3F9381EDB8DAD3DD3EA72F303' FEDERAL_STATE_ID ='02DE1D2CB38E1EEB8C9420F2C5A4D300' COUNTY_ID ='00000004' COUNTYNAME ='Böblingen' POPULATION ='392807' IMAGE_URL =
'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Landkreis_B%C3%B6blingen_Wappen.svg/1024px-Landkreis_B%C3%B6blingen_Wappen.svg.png')
( COUNTYUUID ='02DFE0A3F9381EDB8DAD3DD3EA72F304' FEDERAL_STATE_ID ='02DE1D2CB38E1EEB8C9420F2C5A4D300' COUNTY_ID ='00000005' COUNTYNAME ='Bodenseekreis' POPULATION ='217470' IMAGE_URL =
'https://upload.wikimedia.org/wikipedia/commons/thumb/3/30/Bodenseekreis_Wappen.svg/1024px-Bodenseekreis_Wappen.svg.png')
( COUNTYUUID ='02DFE0A3F9381EDB8DAD3DD3EA72F305' FEDERAL_STATE_ID ='02DE1D2CB38E1EEB8C9420F2C5A4D300' COUNTY_ID ='00000006' COUNTYNAME ='Breisgau-Hochschwarzwald' POPULATION ='263601' IMAGE_URL =
'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c9/DEU_Landkreis_Breisgau-Hochschwarzwald_COA.svg/1024px-DEU_Landkreis_Breisgau-Hochschwarzwald_COA.svg.png')
( COUNTYUUID ='02DFE0A3F9381EDB8DAD3DD3EA72F306' FEDERAL_STATE_ID ='02DE1D2CB38E1EEB8C9420F2C5A4D300' COUNTY_ID ='00000007' COUNTYNAME ='Calw' POPULATION ='159201' IMAGE_URL =
'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4c/Wappen_Landkreis_Calw.svg/1024px-Wappen_Landkreis_Calw.svg.png')
( COUNTYUUID ='02DFE0A3F9381EDB8DAD3DD3EA72F307' FEDERAL_STATE_ID ='02DE1D2CB38E1EEB8C9420F2C5A4D300' COUNTY_ID ='00000008' COUNTYNAME ='Emmendingen' POPULATION ='166408' IMAGE_URL =
'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/Wappen_Landkreis_Emmendingen.svg/1024px-Wappen_Landkreis_Emmendingen.svg.png')
( COUNTYUUID ='02DFE0A3F9381EDB8DAD3DD3EA72F308' FEDERAL_STATE_ID ='02DE1D2CB38E1EEB8C9420F2C5A4D300' COUNTY_ID ='00000009' COUNTYNAME ='Enzkreis' POPULATION ='199556' IMAGE_URL =
'https://upload.wikimedia.org/wikipedia/commons/thumb/7/76/Wappen_Enzkreis.svg/1024px-Wappen_Enzkreis.svg.png')
( COUNTYUUID ='02DFE0A3F9381EDB8DAD3DD3EA72F309' FEDERAL_STATE_ID ='02DE1D2CB38E1EEB8C9420F2C5A4D300' COUNTY_ID ='00000010' COUNTYNAME ='Esslingen' POPULATION ='535024' IMAGE_URL =
'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f1/Wappen_Landkreis_Esslingen.svg/1024px-Wappen_Landkreis_Esslingen.svg.png')

( COUNTYUUID ='02DFE0A3F9381EDB8DAD3DD3EA72F310' FEDERAL_STATE_ID ='02DE1D2CB38E1EEB8C9420F2C5A4D301' COUNTY_ID ='00000011' COUNTYNAME ='Aichach-Friedberg' POPULATION ='134655' IMAGE_URL =
'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c0/Wappen_Landkreis_Aichach-Friedberg.svg/60px-Wappen_Landkreis_Aichach-Friedberg.svg.png')
( COUNTYUUID ='02DFE0A3F9381EDB8DAD3DD3EA72F311' FEDERAL_STATE_ID ='02DE1D2CB38E1EEB8C9420F2C5A4D301' COUNTY_ID ='00000012' COUNTYNAME ='Altötting' POPULATION ='111516' IMAGE_URL =
'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3b/DEU_Landkreis_Altoetting_COA.svg/1024px-DEU_Landkreis_Altoetting_COA.svg.png')

( COUNTYUUID ='02DFE0A3F9381EDB8DAD3DD3EA72F315' FEDERAL_STATE_ID ='02DE1D2CB38E1EEB8C9420F2C5A4D302' COUNTY_ID ='00000016' COUNTYNAME ='Berlin' POPULATION ='3669491' IMAGE_URL =
'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Coat_of_arms_of_Berlin.svg/70px-Coat_of_arms_of_Berlin.svg.png')

( COUNTYUUID ='02DFE0A3F9381EDB8DAD3DD3EA72F312' FEDERAL_STATE_ID ='02DE1D2CB38E1EEB8C9420F2C5A4D303' COUNTY_ID ='00000013' COUNTYNAME ='Barnim' POPULATION ='185244' IMAGE_URL =
'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bf/Wappen_Landkreis_Barnim.svg/60px-Wappen_Landkreis_Barnim.svg.png')
( COUNTYUUID ='02DFE0A3F9381EDB8DAD3DD3EA72F313' FEDERAL_STATE_ID ='02DE1D2CB38E1EEB8C9420F2C5A4D303' COUNTY_ID ='00000014' COUNTYNAME ='Brandenburg an der Havel' POPULATION ='22971' IMAGE_URL =
'https://upload.wikimedia.org/wikipedia/commons/thumb/6/64/Bremen_Wappen%28Mittel%29.svg/1024px-Bremen_Wappen%28Mittel%29.svg.png')

( COUNTYUUID ='02DFE0A3F9381EDB8DAD3DD3EA72F314' FEDERAL_STATE_ID ='02DE1D2CB38E1EEB8C9420F2C5A4D304' COUNTY_ID ='00000015' COUNTYNAME ='Bremen' POPULATION ='567559' IMAGE_URL =
'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Coat_of_arms_of_Berlin.svg/800px-Coat_of_arms_of_Berlin.svg.png')

( COUNTYUUID ='02DFE0A3F9381EDB8DAD3DD3EA72F316' FEDERAL_STATE_ID ='02DE1D2CB38E1EEB8C9420F2C5A4D305' COUNTY_ID ='00000017' COUNTYNAME ='Hamburg' POPULATION ='5380000' IMAGE_URL =
'https://upload.wikimedia.org/wikipedia/commons/thumb/6/63/Wappen_der_Hamburgischen_B%C3%BCrgerschaft.svg/1024px-Wappen_der_Hamburgischen_B%C3%BCrgerschaft.svg.png')

( COUNTYUUID ='02DFE0A3F9381EDB8DAD3DD3EA72F317' FEDERAL_STATE_ID ='02DE1D2CB38E1EEB8C9420F2C5A4D306' COUNTY_ID ='00000018' COUNTYNAME ='Bergstraße' POPULATION ='270340' IMAGE_URL =
'https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/DEU_Kreis_Bergstrasse_COA.svg/1024px-DEU_Kreis_Bergstrasse_COA.svg.png')
( COUNTYUUID ='02DFE0A3F9381EDB8DAD3DD3EA72F318' FEDERAL_STATE_ID ='02DE1D2CB38E1EEB8C9420F2C5A4D306' COUNTY_ID ='00000019' COUNTYNAME ='Darmstadt-Dieburg' POPULATION ='297844' IMAGE_URL =
'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/DEU_Landkreis_Darmstadt-Dieburg_COA.svg/1024px-DEU_Landkreis_Darmstadt-Dieburg_COA.svg.png')

( COUNTYUUID ='02DFE0A3F9381EDB8DAD3DD3EA72F319' FEDERAL_STATE_ID ='02DE1D2CB38E1EEB8C9420F2C5A4D307' COUNTY_ID ='00000020' COUNTYNAME ='Ludwigslust-Parchim' POPULATION ='211779' IMAGE_URL =
'https://upload.wikimedia.org/wikipedia/commons/thumb/4/48/DEU_Landkreis_Ludwigslust-Parchim_COA.svg/1024px-DEU_Landkreis_Ludwigslust-Parchim_COA.svg.png')
( COUNTYUUID ='02DFE0A3F9381EDB8DAD3DD3EA72F320' FEDERAL_STATE_ID ='02DE1D2CB38E1EEB8C9420F2C5A4D307' COUNTY_ID ='00000021' COUNTYNAME ='Mecklenburgische Seenplatte' POPULATION ='258074' IMAGE_URL =
'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Wappen_Mecklenburgische_Seenplatte.svg/1024px-Wappen_Mecklenburgische_Seenplatte.svg.png')

( COUNTYUUID ='02DFE0A3F9381EDB8DAD3DD3EA72F321' FEDERAL_STATE_ID ='02DE1D2CB38E1EEB8C9420F2C5A4D308' COUNTY_ID ='00000022' COUNTYNAME ='Ammerland' POPULATION ='124859' IMAGE_URL =
'https://upload.wikimedia.org/wikipedia/commons/thumb/4/40/Wappen_Landkreis_Ammerland.svg/1024px-Wappen_Landkreis_Ammerland.svg.png')
    ).

*   delete existing entries in the database table
    DELETE FROM zcct_county.

*   insert the new table entries
    INSERT zcct_county FROM TABLE @itab.

*   output the result as a console message
    out->write( |{ sy-dbcnt } county entries inserted successfully!| ).

  ENDMETHOD.
ENDCLASS.
