// D:\repos\oe_dataflex\Kolcsonzo2021\AppSrc\Kolcsonzesilap.vw
// K”lcs”nz‚si lap
//

Use DFClient.pkg
Use DFEntry.pkg
Use DfCEntry.pkg
Use DfTabDlg.pkg
Use cDbCJGrid.pkg
Use cDbCJGridColumn.pkg

Use cemberDataDictionary.dd
Use cmediaDataDictionary.dd
Use cberloDataDictionary.dd
Use clapDataDictionary.dd
Use claptetelDataDictionary.dd

Use MonthCalendarPrompt.dg
Use Windows.pkg

ACTIVATE_VIEW Activate_oKolcsonzesilap FOR oKolcsonzesilap
Object oKolcsonzesilap is a dbView
    Set Location to 5 5
    Set Size to 211 398
    Set Label To "K”lcs”nz‚si lap"
    Set Border_Style to Border_Thick


    Object oember_DD is a cemberDataDictionary
    End_Object 

    Object omedia_DD is a cmediaDataDictionary
        Set DDO_Server To oember_DD
    End_Object 

    Object oberlo_DD is a cberloDataDictionary
    End_Object 

    Object olap_DD is a clapDataDictionary
        Set DDO_Server To oberlo_DD
        // this lets you save a new parent DD from within child DD
        Set Allow_Foreign_New_Save_State to True

        Procedure OnPostFind Integer eMessage Boolean bFound
            Forward Send OnPostFind eMessage bFound
            
            Integer iStatus
            
            Get File_Field_Current_Value of olap_DD File_Field lap.status to iStatus
            
            If (iStatus=0) Begin
                Set Enabled_State of oberloid to True
                Set Enabled_State of oberlonev to True
                Set Enabled_State of olapkezdat to True
                Set Enabled_State of olapkiado to True
                Set Enabled_State of olapbevevo to False
                Set Enabled_State of olapvegdat to False
                Set Enabled_State of oDetailGrid to True
            End
            If (iStatus=1) Begin
                Set Enabled_State of oberloid to False
                Set Enabled_State of oberlonev to False
                Set Enabled_State of olapkezdat to False
                Set Enabled_State of olapkiado to False
                Set Enabled_State of olapbevevo to True
                Set Enabled_State of olapvegdat to True
                Set Enabled_State of oDetailGrid to False
            End
            If (iStatus=2) Begin
                Set Enabled_State of oberloid to False
                Set Enabled_State of oberlonev to False
                Set Enabled_State of olapkezdat to False
                Set Enabled_State of olapkiado to False
                Set Enabled_State of olapbevevo to False
                Set Enabled_State of olapvegdat to False
                Set Enabled_State of oDetailGrid to False 
            End
            If (iStatus=9) Begin
                Set Enabled_State of oberloid to False
                Set Enabled_State of oberlonev to False
                Set Enabled_State of olapkezdat to False
                Set Enabled_State of olapkiado to False
                Set Enabled_State of olapbevevo to False
                Set Enabled_State of olapvegdat to False
                Set Enabled_State of oDetailGrid to False
            End
        End_Procedure
        
        
    End_Object 

    Object olaptetel_DD is a claptetelDataDictionary
        Set DDO_Server To olap_DD
        Set DDO_Server To omedia_DD
        Set Constrain_File To lap.File_Number
    End_Object 

    Set Main_DD To olap_DD
    Set Server  To olap_DD



    Object olaplapid is a dbForm
        Entry_Item lap.lapid
        Set Size to 12 42
        Set Location to 5 56
        Set peAnchors to anTopLeftRight
        Set Label to "lapid"
        Set Label_Justification_mode to jMode_Left
        Set Label_Col_Offset to 51
        Set Label_row_Offset to 0
    End_Object 

    Object olapstatus is a dbComboForm
        Entry_Item lap.status
        Set Size to 12 209
        Set Location to 5 124
        Set peAnchors to anTopRight
        Set Label to "status"
        Set Label_Justification_mode to jMode_Left
        Set Label_Col_Offset to 21
        Set Label_row_Offset to 0
        Set Enabled_State to False
    End_Object 

    Object oberloid is a dbForm
        Entry_Item berlo.id
        Set Size to 12 42
        Set Location to 19 56
        Set peAnchors to anTopLeftRight
        Set Label to "B‚rlo azonos¡t¢"
        Set Label_Justification_mode to jMode_Left
        Set Label_Col_Offset to 51
        Set Label_row_Offset to 0
    End_Object 

    Object oberlonev is a dbForm
        Entry_Item berlo.nev
        Set Size to 12 200
        Set Location to 19 134
        Set peAnchors to anTopRight
        Set Label to "B‚rlo n‚v"
        Set Label_Justification_mode to jMode_Left
        Set Label_Col_Offset to 31
        Set Label_row_Offset to 0
    End_Object 

    Object oTabDialog is a dbTabDialog
        Set Size to 89 388
        Set Location to 41 5
        Set peAnchors to anTopLeftRight

        Object oTabPage1 is a dbTabPage
            Set Label to "Altal nos adatok"

            Object olapkezdat is a dbForm
                Entry_Item lap.kezdat
                Set Size to 12 66
                Set Location to 10 51
                Set peAnchors to anTopLeftRight
                Set Label to "B‚rl‚s kezdete"
                Set Label_Justification_mode to jMode_Left
                Set Label_Col_Offset to 46
                Set Label_row_Offset to 0
                Set Prompt_Object to oMonthCalendarPrompt
            End_Object 

            Object olapvegdat is a dbForm
                Entry_Item lap.vegdat
                Set Size to 12 66
                Set Location to 10 159
                Set peAnchors to anTopRight
                Set Label to "B‚rl‚s v‚ge"
                Set Label_Justification_mode to jMode_Left
                Set Label_Col_Offset to 37
                Set Label_row_Offset to 0
                Set Prompt_Object to oMonthCalendarPrompt
            End_Object 

            Object olapkiado is a dbForm
                Entry_Item lap.kiado
                Set Size to 12 126
                Set Location to 24 51
                Set peAnchors to anTopLeftRight
                Set Label to "Ki adta ki?"
                Set Label_Justification_mode to jMode_Left
                Set Label_Col_Offset to 46
                Set Label_row_Offset to 0
            End_Object 

            Object olapbevevo is a dbForm
                Entry_Item lap.bevevo
                Set Size to 12 126
                Set Location to 24 230
                Set peAnchors to anTopRight
                Set Label to "Ki vette vissza?"
                Set Label_Justification_mode to jMode_Left
                Set Label_Col_Offset to 48
                Set Label_row_Offset to 0
            End_Object 

            Object olaposszertek is a dbForm
                Entry_Item lap.osszertek
                Set Size to 12 72
                Set Location to 38 51
                Set peAnchors to anTopLeftRight
                Set Label to "osszertek"
                Set Label_Justification_mode to jMode_Left
                Set Label_Col_Offset to 46
                Set Label_row_Offset to 0
            End_Object 

            Object olaposszmenny is a dbForm
                Entry_Item lap.osszmenny
                Set Size to 12 60
                Set Location to 38 165
                Set peAnchors to anTopRight
                Set Label to "osszmenny"
                Set Label_Justification_mode to jMode_Left
                Set Label_Col_Offset to 37
                Set Label_row_Offset to 0
            End_Object 

        End_Object 

        Object oTabPage2 is a dbTabPage
            Set Label to "M¢dos¡t sok ideje"

            Object olapcrdt is a dbForm
                Entry_Item lap.crdt
                Set Size to 12 66
                Set Location to 10 30
                Set peAnchors to anTopLeftRight
                Set Label to "crdt"
                Set Label_Justification_mode to jMode_Left
                Set Label_Col_Offset to 25
                Set Label_row_Offset to 0
            End_Object 

            Object olapcrtime is a dbForm
                Entry_Item lap.crtime
                Set Size to 12 66
                Set Location to 24 30
                Set peAnchors to anTopLeftRight
                Set Label to "crtime"
                Set Label_Justification_mode to jMode_Left
                Set Label_Col_Offset to 25
                Set Label_row_Offset to 0
            End_Object 

            Object olaplmdt is a dbForm
                Entry_Item lap.lmdt
                Set Size to 12 66
                Set Location to 38 30
                Set peAnchors to anTopLeftRight
                Set Label to "lmdt"
                Set Label_Justification_mode to jMode_Left
                Set Label_Col_Offset to 25
                Set Label_row_Offset to 0
            End_Object 

            Object olaplmtime is a dbForm
                Entry_Item lap.lmtime
                Set Size to 12 66
                Set Location to 52 30
                Set peAnchors to anTopLeftRight
                Set Label to "lmtime"
                Set Label_Justification_mode to jMode_Left
                Set Label_Col_Offset to 25
                Set Label_row_Offset to 0
            End_Object 

        End_Object 

    End_Object 

    Object oDetailGrid is a cDbCJGrid
        Set Size to 66 388
        Set Location to 140 5
        Set Server to olaptetel_DD
        Set Ordering to 1
        Set peAnchors to anAll
        Set psLayoutSection to "oKolcsonzesilap_oDetailGrid"
        Set pbAllowInsertRow to False
        Set pbHeaderPrompts to True

        Object omedia_mediaid is a cDbCJGridColumn
            Entry_Item media.mediaid
            Set piWidth to 60
            Set psCaption to "mediaid"
        End_Object 

        Object olaptetel_menny is a cDbCJGridColumn
            Entry_Item laptetel.menny
            Set piWidth to 60
            Set psCaption to "menny"
        End_Object 

        Object olaptetel_ar is a cDbCJGridColumn
            Entry_Item laptetel.ar
            Set piWidth to 110
            Set psCaption to "ar"
        End_Object 

        Object olaptetel_crdt is a cDbCJGridColumn
            Entry_Item laptetel.crdt
            Set piWidth to 100
            Set psCaption to "crdt"
        End_Object 

        Object olaptetel_crtime is a cDbCJGridColumn
            Entry_Item laptetel.crtime
            Set piWidth to 100
            Set psCaption to "crtime"
        End_Object 

        Object olaptetel_lmdt is a cDbCJGridColumn
            Entry_Item laptetel.lmdt
            Set piWidth to 100
            Set psCaption to "lmdt"
        End_Object 

        Object olaptetel_lmtime is a cDbCJGridColumn
            Entry_Item laptetel.lmtime
            Set piWidth to 100
            Set psCaption to "lmtime"
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

    Object oButton1 is a Button
        Set Location to 12 344
        Set Label to 'Lez r s'
    
        // fires when the button is clicked
        Procedure OnClick
            Integer iStatus
            Boolean bErr
            Get File_Field_Current_Value of olap_DD File_Field lap.status to iStatus
            If (iStatus = 0) Begin
                Set File_Field_Changed_Value of olap_DD File_Field lap.status to 1
            End
            If (iStatus = 1) Begin
                Set File_Field_Changed_Value of olap_DD File_Field lap.status to 2
            End
            Get Request_Validate of olap_DD to bErr
            If (not(bErr)) Begin
                Send Request_Save of olap_DD
            End
            Send SuperFind of olaplapid
        End_Procedure
    
    End_Object


End_Object 
