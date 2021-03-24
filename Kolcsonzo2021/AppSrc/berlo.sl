// berlo.sl
// B�rlok keres�se

Use DFClient.pkg
Use cDbCJGridPromptList.pkg
Use cDbCJGridColumn.pkg
Use Windows.pkg

Use cberloDataDictionary.dd

CD_Popup_Object berlo_sl is a dbModalPanel
    Set Location to 5 5
    Set Size to 134 446
    Set Label To "B�rlok keres�se"
    Set Border_Style to Border_Thick
    Set Minimize_Icon to False


    Object oberlo_DD is a cberloDataDictionary
    End_Object 

    Set Main_DD To oberlo_DD
    Set Server  To oberlo_DD



    Object oSelList is a cDbCJGridPromptList
        Set Size to 105 436
        Set Location to 5 5
        Set peAnchors to anAll
        Set psLayoutSection to "berlo_sl_oSelList"
        Set Ordering to 1
        Set pbAutoServer to True

        Object oberlo_id is a cDbCJGridColumn
            Entry_Item berlo.id
            Set piWidth to 60
            Set psCaption to "id"
        End_Object 

        Object oberlo_nev is a cDbCJGridColumn
            Entry_Item berlo.nev
            Set piWidth to 250
            Set psCaption to "nev"
        End_Object 

        Object oberlo_varos is a cDbCJGridColumn
            Entry_Item berlo.varos
            Set piWidth to 250
            Set psCaption to "varos"
        End_Object 

        Object oberlo_adoszam is a cDbCJGridColumn
            Entry_Item berlo.adoszam
            Set piWidth to 150
            Set psCaption to "adoszam"
        End_Object 


    End_Object 

    Object oOk_bn is a Button
        Set Label to "&Ok"
        Set Location to 115 283
        Set peAnchors to anBottomRight

        Procedure OnClick
            Send OK of oSelList
        End_Procedure

    End_Object 

    Object oCancel_bn is a Button
        Set Label to "&Cancel"
        Set Location to 115 337
        Set peAnchors to anBottomRight

        Procedure OnClick
            Send Cancel of oSelList
        End_Procedure

    End_Object 

    Object oSearch_bn is a Button
        Set Label to "&Search..."
        Set Location to 115 391
        Set peAnchors to anBottomRight

        Procedure OnClick
            Send Search of oSelList
        End_Procedure

    End_Object 

    On_Key Key_Alt+Key_O Send KeyAction of oOk_bn
    On_Key Key_Alt+Key_C Send KeyAction of oCancel_bn
    On_Key Key_Alt+Key_S Send KeyAction of oSearch_bn


CD_End_Object // berlo_sl
