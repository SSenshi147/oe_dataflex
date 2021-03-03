// G:\repos\oe_dataflex\Kolcsonzo2021\AppSrc\Mediarogz.vw
// Mediarogz
//

Use DFClient.pkg
Use DFEntry.pkg
Use cDbCJGrid.pkg
Use cDbCJGridColumn.pkg

Use cemberDataDictionary.dd
Use cmediaDataDictionary.dd

ACTIVATE_VIEW Activate_oMediarogz FOR oMediarogz
Object oMediarogz is a dbView
    Set Location to 5 5
    Set Size to 98 610
    Set Label To "Mediarogz"
    Set Border_Style to Border_Thick


    Object oember_DD is a cemberDataDictionary
        // this lets you save a new parent DD from within child DD
        Set Allow_Foreign_New_Save_State to True
    End_Object 

    Object omedia_DD is a cmediaDataDictionary
        Set DDO_Server To oember_DD
        Set Constrain_File To ember.File_Number
    End_Object 

    Set Main_DD To oember_DD
    Set Server  To oember_DD



    Object oemberID is a dbForm
        Entry_Item ember.ID
        Set Size to 12 42
        Set Location to 5 7
        Set peAnchors to anTopRight
        Set Label to "Azonos°t¢"
        Set Label_Justification_mode to jMode_Left
        Set Label_Col_Offset to 2
        Set Label_row_Offset to 0
    End_Object 

    Object oemberNEV is a dbForm
        Entry_Item ember.NEV
        Set Size to 12 250
        Set Location to 5 69
        Set peAnchors to anTopRight
        Set Label to "NÇv"
        Set Label_Justification_mode to jMode_Left
        Set Label_Col_Offset to 15
        Set Label_row_Offset to 0
    End_Object 

    Object oDetailGrid is a cDbCJGrid
        Set Size to 66 600
        Set Location to 27 5
        Set Server to omedia_DD
        Set Ordering to 5
        Set peAnchors to anAll
        Set psLayoutSection to "oMediarogz_oDetailGrid"
        Set pbAllowInsertRow to False
        Set pbHeaderPrompts to True

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

    //-----------------------------------------------------------------------
    // Create custom confirmation messages for save and delete
    // We must create the new functions and assign verify messages
    // to them.
    //-----------------------------------------------------------------------

    Function ConfirmDeleteHeader Returns Boolean
        Boolean bFail
        Get Confirm "Delete Entire Header and all detail?" to bFail
        Function_Return bFail
    End_Function 

    // Only confirm on the saving of new records
    Function ConfirmSaveHeader Returns Boolean
        Boolean bNoSave bHasRecord
        Handle  hoSrvr
        Get Server to hoSrvr
        Get HasRecord of hoSrvr to bHasRecord
        If not bHasRecord Begin
            Get Confirm "Save this NEW header?" to bNoSave
        End
        Function_Return bNoSave
    End_Function 

    // Define alternate confirmation Messages
    Set Verify_Save_MSG       to (RefFunc(ConfirmSaveHeader))
    Set Verify_Delete_MSG     to (RefFunc(ConfirmDeleteHeader))
    // Saves in header should not clear the view
    Set Auto_Clear_Deo_State to False


End_Object 
