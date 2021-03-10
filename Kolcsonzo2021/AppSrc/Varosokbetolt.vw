Use Windows.pkg
Use DFClient.pkg
Use cvarosokDataDictionary.dd

Deferred_View Activate_oVarosokbetolt for ;
Object oVarosokbetolt is a dbView
    Object ovarosok_DD is a cvarosokDataDictionary
    End_Object

    Set Main_DD to ovarosok_DD
    Set Server to ovarosok_DD

    Set Border_Style to Border_Thick
    Set Size to 200 300
    Set Location to 2 2
    Set Label to "Varosokbetolt"

    Object oForm1 is a Form
        Set Size to 12 100
        Set Location to 45 38
    
        // OnChange is called on every changed character
    //    Procedure OnChange
    //        String sValue
    //    
    //        Get Value to sValue
    //    End_Procedure
    
    End_Object

    Object oButton1 is a Button
        Set Location to 43 143
        Set Label to 'Bet”lt‚s'
    
        // fires when the button is clicked
        Procedure OnClick
            String sFilenev sTartalom sIrszam sVaros sMegye
            Integer iPos iSzamol berr
            
            Get Value of oForm1 to sFilenev
            
            Open varosok
            
            Direct_Input channel 9 sFilenev
            While (not(SeqEof))
                Readln channel 9 sTartalom
                
                Move (ToOEM(sTartalom+";")) to sTartalom
                
                Move 0 to iSzamol
                Move "" to sIrszam
                Move "" to sVaros
                Move "" to sMegye
                Repeat
                    Move (Pos(";",sTartalom)) to iPos
                    If (iPos>0) Begin
                        Increment iSzamol
                        If (iSzamol = 1) Move (Left(sTartalom, (iPos-1))) to sIrszam
                        If (iSzamol = 2) Move (Left(sTartalom, (iPos-1))) to sVaros
                        If (iSzamol = 3) Move (Left(sTartalom, (iPos-1))) to sMegye
                        Move (Remove(sTartalom,0,iPos)) to sTartalom
                    End
                Until (sTartalom eq "")
                
//                Clear varosok
//                Move sIrszam to varosok.irszam
//                Move sVaros to varosok.varosok
//                Find eq varosok by Index.1
//                If (Found) Begin
//                    Reread varosok
//                End
//                Move sMegye to varosok.megye
//                SaveRecord varosok
//                If (Found) Begin
//                    Unlock
//                End

                Send Clear of ovarosok_DD
                Move sIrszam to varosok.irszam
                Move sVaros to varosok.varosok
                Send Find of ovarosok_DD EQ 1
                Set File_Field_Changed_Value of ovarosok_DD File_Field varosok.irszam to sIrszam
                Set File_Field_Changed_Value of ovarosok_DD File_Field varosok.varosok to sVaros
                Set File_Field_Changed_Value of ovarosok_DD File_Field varosok.megye to sMegye
                Get Request_Validate of ovarosok_DD to berr
                If (not(berr)) Begin
                    Send Request_Save of ovarosok_DD
                End
                
            Loop
            Close_Input channel 9
            
            Send Info_Box "k‚sz"
        End_Procedure
    
    End_Object

Cd_End_Object
