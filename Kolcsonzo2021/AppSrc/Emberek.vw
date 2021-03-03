// G:\repos\oe_dataflex\Kolcsonzo2021\AppSrc\Emberek.vw
// Emberek karbantart sa
//

Use DFClient.pkg
Use DFEntry.pkg
Use cDbTextEdit.pkg
Use dbSuggestionForm.pkg

Use cemberDataDictionary.dd

ACTIVATE_VIEW Activate_oEmberek FOR oEmberek
Object oEmberek is a dbView
    Set Location to 3 8
    Set Size to 160 364
    Set Label To "Emberek karbantart sa"
    Set Border_Style to Border_Thick


    Object oember_DD is a cemberDataDictionary
    End_Object 

    Set Main_DD To oember_DD
    Set Server  To oember_DD



    Object oemberID is a dbForm
        Entry_Item ember.ID
        Set Size to 12 42
        Set Location to 5 47
        Set peAnchors to anTopLeftRight
        Set Label to "Azonos¡t¢"
        Set Label_Justification_mode to jMode_right
        Set Label_Col_Offset to 2
        Set Label_row_Offset to 0
    End_Object 

    Object oemberNEV is a DbSuggestionForm
        Entry_Item ember.NEV
        Set Size to 12 250
        Set Location to 5 109
        Set peAnchors to anTopRight
        Set Label to "N‚v"
        Set Label_Justification_mode to jMode_right
        Set Label_Col_Offset to 2
        Set Label_row_Offset to 0
        Set pbFullText to True
    End_Object 

    Object oemberIRSZAM is a dbForm
        Entry_Item ember.IRSZAM
        Set Size to 12 41
        Set Location to 19 47
        Set peAnchors to anTopLeftRight
        Set Label to "Ir ny¡t¢sz m"
        Set Label_Justification_mode to jMode_right
        Set Label_Col_Offset to 2
        Set Label_row_Offset to 0
    End_Object 

    Object oemberCIM is a dbForm
        Entry_Item ember.CIM
        Set Size to 12 250
        Set Location to 33 47
        Set peAnchors to anTopLeftRight
        Set Label to "C¡m"
        Set Label_Justification_mode to jMode_right
        Set Label_Col_Offset to 2
        Set Label_row_Offset to 0
    End_Object 

    Object oemberTEL is a dbForm
        Entry_Item ember.TEL
        Set Size to 12 66
        Set Location to 47 47
        Set peAnchors to anTopLeftRight
        Set Label to "Telefonsz m"
        Set Label_Justification_mode to jMode_right
        Set Label_Col_Offset to 2
        Set Label_row_Offset to 0
    End_Object 

    Object oemberEMAIL is a dbForm
        Entry_Item ember.EMAIL
        Set Size to 12 250
        Set Location to 61 47
        Set peAnchors to anTopLeftRight
        Set Label to "E-mail"
        Set Label_Justification_mode to jMode_right
        Set Label_Col_Offset to 2
        Set Label_row_Offset to 0
    End_Object 

    Object oemberMEGJ is a cDbTextEdit
        Entry_Item ember.MEGJ
        Set Size to 80 200
        Set Location to 75 47
        Set peAnchors to anTopLeftRight
        Set Label to "Megjegyz‚s"
        Set Label_Justification_mode to jMode_right
        Set Label_Col_Offset to 2
        Set Label_row_Offset to 0
    End_Object 

    Object oember_VAROS is a dbForm
        Entry_Item ember.VAROS
        Set Location to 19 113
        Set Size to 12 240
        Set Label to "V ros"
        Set Label_Col_Offset to 0
        Set Label_Justification_Mode to JMode_Right
    End_Object


End_Object 
