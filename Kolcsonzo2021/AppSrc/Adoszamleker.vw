Use Windows.pkg
Use DFClient.pkg
Use cWScheckVatService.pkg

Deferred_View Activate_oAdoszamleker for ;
Object oAdoszamleker is a dbView

    Set Border_Style to Border_Thick
    Set Size to 200 300
    Set Location to 2 2
    Set Label to "Adoszamleker"

    Object oForm1 is a Form
        Set Size to 12 100
        Set Location to 22 85
        Set Label to "EUs ad¢sz m"
    
        // OnChange is called on every changed character
    //    Procedure OnChange
    //        String sValue
    //    
    //        Get Value to sValue
    //    End_Procedure
    
    End_Object

    Object oButton1 is a Button
        Set Location to 20 221
        Set Label to 'Lek‚r'
    
        // fires when the button is clicked
        Procedure OnClick
            String sVal sCountryCode sName sCim
            Date dDate
            Boolean bValid
            
            Get Value of oForm1 to sVal
            Move (Left(sVal,2)) to sCountryCode
            Move (Remove(sVal,0,2)) to sVal
            
            Get wscheckVat of oWScheckVatService1 (&sCountryCode) (&sVal) (&bValid) (&sName) (&sCim) to dDate
            
            Showln sCountryCode " - " sVal " - " bValid " - " sName " - " sCim " - " dDate
        End_Procedure
    
    End_Object

    Object oWScheckVatService1 is a cWScheckVatService
    
        //
        // Interface:
        //
        // Function wscheckVat String BYREF llcountryCode String BYREF llvatNumber Boolean BYREF llvalid String BYREF llname String BYREF lladdress Returns Date
        // Function wscheckVatApprox String BYREF llcountryCode String BYREF llvatNumber String BYREF lltraderName String BYREF lltraderCompanyType String BYREF lltraderStreet String BYREF lltraderPostcode String BYREF lltraderCity String llrequesterCountryCode String llrequesterVatNumber Boolean BYREF llvalid String BYREF lltraderAddress String BYREF lltraderNameMatch String BYREF lltraderCompanyTypeMatch String BYREF lltraderStreetMatch String BYREF lltraderPostcodeMatch String BYREF lltraderCityMatch String BYREF llrequestIdentifier Returns Date
        //
    
    
        // phoSoapClientHelper
        //     Setting this property will pop up a view that provides information
        //     about the Soap (xml) data transfer. This can be useful in debugging.
        //     If you use this you must make sure you USE the test view at the top
        //     of your program/view by adding:   Use WebClientHelper.vw // oClientWSHelper
        //Set phoSoapClientHelper to oClientWSHelper
    
    End_Object

Cd_End_Object
