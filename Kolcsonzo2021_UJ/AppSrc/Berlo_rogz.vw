// D:\repos\oe_dataflex\Kolcsonzo2021\AppSrc\Berlo_rogz.vw
// B‚rlo karbantart sa
//

Use DFClient.pkg
Use DFEntry.pkg

Use cberloDataDictionary.dd

ACTIVATE_VIEW Activate_oBerlo_rogz FOR oBerlo_rogz
Object oBerlo_rogz is a dbView
    Set Location to 5 5
    Set Size to 78 380
    Set Label To "B‚rlo karbantart sa"
    Set Border_Style to Border_Thick


    Object oberlo_DD is a cberloDataDictionary
    End_Object 

    Set Main_DD To oberlo_DD
    Set Server  To oberlo_DD



    Object oberloid is a dbForm
        Entry_Item berlo.id
        Set Size to 12 42
        Set Location to 5 35
        Set peAnchors to anTopLeftRight
        Set Label to "id"
        Set Label_Justification_mode to jMode_Left
        Set Label_Col_Offset to 30
        Set Label_row_Offset to 0
    End_Object 

    Object oberlonev is a dbForm
        Entry_Item berlo.nev
        Set Size to 12 250
        Set Location to 5 95
        Set peAnchors to anTopRight
        Set Label to "nev"
        Set Label_Justification_mode to jMode_Left
        Set Label_Col_Offset to 13
        Set Label_row_Offset to 0
    End_Object 

    Object oberloirszam is a dbForm
        Entry_Item berlo.irszam
        Set Size to 12 66
        Set Location to 19 35
        Set peAnchors to anTopLeftRight
        Set Label to "irszam"
        Set Label_Justification_mode to jMode_Left
        Set Label_Col_Offset to 30
        Set Label_row_Offset to 0
    End_Object 

    Object oberlovaros is a dbForm
        Entry_Item berlo.varos
        Set Size to 12 250
        Set Location to 19 125
        Set peAnchors to anTopRight
        Set Label to "varos"
        Set Label_Justification_mode to jMode_Left
        Set Label_Col_Offset to 19
        Set Label_row_Offset to 0
    End_Object 

    Object oberlocim is a dbForm
        Entry_Item berlo.cim
        Set Size to 12 250
        Set Location to 33 35
        Set peAnchors to anTopLeftRight
        Set Label to "cim"
        Set Label_Justification_mode to jMode_Left
        Set Label_Col_Offset to 30
        Set Label_row_Offset to 0
    End_Object 

    Object oberlotel is a dbForm
        Entry_Item berlo.tel
        Set Size to 12 126
        Set Location to 47 35
        Set peAnchors to anTopLeftRight
        Set Label to "tel"
        Set Label_Justification_mode to jMode_Left
        Set Label_Col_Offset to 30
        Set Label_row_Offset to 0
    End_Object 

    Object oberloadoszam is a dbForm
        Entry_Item berlo.adoszam
        Set Size to 12 96
        Set Location to 61 35
        Set peAnchors to anTopLeftRight
        Set Label to "adoszam"
        Set Label_Justification_mode to jMode_Left
        Set Label_Col_Offset to 30
        Set Label_row_Offset to 0
    End_Object 


End_Object 
