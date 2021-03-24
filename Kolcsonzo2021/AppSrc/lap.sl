// lap.sl
// K”lcs”nz‚si lapok kere‚s‚se

Use DFClient.pkg
Use cDbCJGridPromptList.pkg
Use cDbCJGridColumn.pkg
Use Windows.pkg

Use cberloDataDictionary.dd
Use clapDataDictionary.dd

CD_Popup_Object lap_sl is a dbModalPanel
    Set Location to 5 5
    Set Size to 134 445
    Set Label To "K”lcs”nz‚si lapok kere‚s‚se"
    Set Border_Style to Border_Thick
    Set Minimize_Icon to False


    Object oberlo_DD is a cberloDataDictionary
    End_Object 

    Object olap_DD is a clapDataDictionary
        Set DDO_Server To oberlo_DD
    End_Object 

    Set Main_DD To olap_DD
    Set Server  To olap_DD



    Object oSelList is a cDbCJGridPromptList
        Set Size to 105 435
        Set Location to 5 5
        Set peAnchors to anAll
        Set psLayoutSection to "lap_sl_oSelList"
        Set Ordering to 1
        Set pbAutoServer to True

        Object olap_lapid is a cDbCJGridColumn
            Entry_Item lap.lapid
            Set piWidth to 61
            Set psCaption to "lapid"
        End_Object 

        Object oberlo_nev is a cDbCJGridColumn
            Entry_Item berlo.nev
            Set piWidth to 151
            Set psCaption to "nev"
        End_Object 

        Object oberlo_adoszam is a cDbCJGridColumn
            Entry_Item berlo.adoszam
            Set piWidth to 123
            Set psCaption to "adoszam"
        End_Object 

        Object olap_kezdat is a cDbCJGridColumn
            Entry_Item lap.kezdat
            Set piWidth to 91
            Set psCaption to "kezdat"
        End_Object 

        Object olap_vegdat is a cDbCJGridColumn
            Entry_Item lap.vegdat
            Set piWidth to 122
            Set psCaption to "vegdat"
        End_Object 

        Object olap_status is a cDbCJGridColumn
            Entry_Item lap.status
            Set piWidth to 177
            Set psCaption to "status"
            Set pbComboButton to True
        End_Object 


    End_Object 

    Object oOk_bn is a Button
        Set Label to "&Ok"
        Set Location to 115 282
        Set peAnchors to anBottomRight

        Procedure OnClick
            Send OK of oSelList
        End_Procedure

    End_Object 

    Object oCancel_bn is a Button
        Set Label to "&Cancel"
        Set Location to 115 336
        Set peAnchors to anBottomRight

        Procedure OnClick
            Send Cancel of oSelList
        End_Procedure

    End_Object 

    Object oSearch_bn is a Button
        Set Label to "&Search..."
        Set Location to 115 390
        Set peAnchors to anBottomRight

        Procedure OnClick
            Send Search of oSelList
        End_Procedure

    End_Object 

    On_Key Key_Alt+Key_O Send KeyAction of oOk_bn
    On_Key Key_Alt+Key_C Send KeyAction of oCancel_bn
    On_Key Key_Alt+Key_S Send KeyAction of oSearch_bn


CD_End_Object // lap_sl
