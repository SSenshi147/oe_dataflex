// media.sl
// M†di†k keresÇse

Use DFClient.pkg
Use cDbCJGridPromptList.pkg
Use cDbCJGridColumn.pkg
Use Windows.pkg

Use cemberDataDictionary.dd
Use cmediaDataDictionary.dd

CD_Popup_Object media_sl is a dbModalPanel
    Set Location to 5 5
    Set Size to 134 610
    Set Label To "M†di†k keresÇse"
    Set Border_Style to Border_Thick
    Set Minimize_Icon to False


    Object oember_DD is a cemberDataDictionary
    End_Object 

    Object omedia_DD is a cmediaDataDictionary
        Set DDO_Server To oember_DD
    End_Object 

    Set Main_DD To omedia_DD
    Set Server  To omedia_DD



    Object oSelList is a cDbCJGridPromptList
        Set Size to 105 600
        Set Location to 5 5
        Set peAnchors to anAll
        Set psLayoutSection to "media_sl_oSelList"
        Set Ordering to 1
        Set pbAutoServer to True

        Object omedia_mediaid is a cDbCJGridColumn
            Entry_Item media.mediaid
            Set piWidth to 60
            Set psCaption to "Azon."
        End_Object 

        Object omedia_nev is a cDbCJGridColumn
            Entry_Item media.nev
            Set piWidth to 250
            Set psCaption to "NÇv"
        End_Object 

        Object omedia_szerzo is a cDbCJGridColumn
            Entry_Item media.szerzo
            Set piWidth to 250
            Set psCaption to "Szerzo"
        End_Object 

        Object omedia_tipus is a cDbCJGridColumn
            Entry_Item media.tipus
            Set piWidth to 100
            Set psCaption to "T°pus"
        End_Object 

        Object omedia_datum is a cDbCJGridColumn
            Entry_Item media.datum
            Set piWidth to 100
            Set psCaption to "D†tum"
        End_Object 

        Object omedia_ar is a cDbCJGridColumn
            Entry_Item media.ar
            Set piWidth to 90
            Set psCaption to "Ar"
        End_Object 

        Object omedia_megj is a cDbCJGridColumn
            Entry_Item media.megj
            Set piWidth to 250
            Set psCaption to "Megj."
        End_Object 

        Object oember_ID is a cDbCJGridColumn
            Entry_Item ember.ID
            Set piWidth to 60
            Set psCaption to "emberid"
        End_Object 

        Object omedia_ev is a cDbCJGridColumn
            Entry_Item media.ev
            Set piWidth to 55
            Set psCaption to "êvsz†m"
        End_Object 


    End_Object 

    Object oOk_bn is a Button
        Set Label to "&Ok"
        Set Location to 115 447
        Set peAnchors to anBottomRight

        Procedure OnClick
            Send OK of oSelList
        End_Procedure

    End_Object 

    Object oCancel_bn is a Button
        Set Label to "&Cancel"
        Set Location to 115 501
        Set peAnchors to anBottomRight

        Procedure OnClick
            Send Cancel of oSelList
        End_Procedure

    End_Object 

    Object oSearch_bn is a Button
        Set Label to "&Search..."
        Set Location to 115 555
        Set peAnchors to anBottomRight

        Procedure OnClick
            Send Search of oSelList
        End_Procedure

    End_Object 

    On_Key Key_Alt+Key_O Send KeyAction of oOk_bn
    On_Key Key_Alt+Key_C Send KeyAction of oCancel_bn
    On_Key Key_Alt+Key_S Send KeyAction of oSearch_bn


CD_End_Object // media_sl
