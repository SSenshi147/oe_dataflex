﻿Use Windows.pkg
Use DfRptVw.pkg
Use File_Dlg.Pkg
Use DfTabDlg.pkg
Use cDbScrollingContainer.pkg
Use cDRReport.pkg
Use DRLanguage.Inc
Use cDRPreviewCommandBarSystem.pkg
Use cDRMenuItem.pkg
Use cDRZoomMenuItem.pkg
Use cDRCurrentPageMenuItem.pkg
Use cDRExportMenuItem.pkg
Use cDRPrintMenuItem.pkg
Use cDRFirstPageMenuItem.pkg
Use cDRPreviousPageMenuItem.pkg
Use cDRNextPageMenuItem.pkg
Use cDRLastPageMenuItem.pkg
Use cDRRefreshMenuItem.pkg
Use DRExportOptions.dg
Use cDRSearchPreviewMenuItem.pkg
Use cDRSearchPreviewOptionsMenuItem.pkg
Use cSplitterContainer.Pkg
Use cDRGroupTree.pkg

Activate_View Activate_oReportView for oReportView

Object oReportView is a ReportView
    // ToDo: Change the label of this report view, adjust the menu item on the report pull-down
    Set Label to "Replace this label"
    Set Location To 6 6
    Set Size to 317 511
    Set Icon to 'DR.Ico'
    Set Output_Device_Mode to PRINT_TO_WINDOW

    { DesignTime = False }
    { Description = "Will be used to store the object id of the cDRReport object" }
    Property Handle phoReport 0
    
    Object oDRTabDialog is a dbTabDialog
        Set Location to 5 5
        Set Rotate_Mode to RM_Rotate
        Set peAnchors to anAll
        Set Size to 290 500

        Object oSelectionsTabPage is a dbTabPage
            Set Label to "Selections"

            Object oSelectionsScrollingContainer is a cDbScrollingContainer
                Object oSelectionsScrollingClientArea is a cDbScrollingClientArea
                    // ToDo: Create (for example via drag and drop) controls for report selection criteria on this tab-page.
                End_Object
            End_Object
        End_Object

        Object oResultsTabPage is a dbTabPage
            Set Label to "Results"

            Object oCommandBars is a cDRPreviewCommandBarSystem
                Object oDRToolBar is a cCJToolbar
                    Set pbCloseable to False
                    Set pbEnableDocking to False
                    Set pbGripper to False
                    Set peStretched to stStretch
                    Set pbDockNextTo to False
        
                    Object oFirstPage is a cDRFirstPageMenuItem
                    End_Object
        
                    Object oPreviousPage is a cDRPreviousPageMenuItem
                    End_Object
        
                    Object oCurrentPage is a cDRCurrentPageMenuItem
                        Set peControlType to xtpControlEdit
                    End_Object
        
                    Object oNextPage is a cDRNextPageMenuItem
                    End_Object
        
                    Object oLastPage is a cDRLastPageMenuItem
                    End_Object
        
                    Object oRefresh is a cDRRefreshMenuItem
                    End_Object
        
                    Object oPrint is a cDRPrintMenuItem
                    End_Object
        
                    Object oZoom is a cDRZoomMenuItem
                    End_Object
        
                    Object oExport is a cDRExportMenuItem
                        Set phoExportOptionsDialog to (oDRExportOptionsDialog)
                    End_Object

                    Object oSearchInPreview is a cDRSearchPreviewMenuItem
                    End_Object
                    
                    Object oSearchInPreviewOptions is a cDRMenuItem
                        Set peControlType to xtpControlSplitButtonPopup
                        Set psCaption to C_$DRSearchInPreviewOptions
                        Set psTooltip to C_$DRSearchInPreviewOptionsTooltip
                        Set peControlStyle to xtpButtonIconAndCaption       
                        Set psImage to "DRFind.Ico"

                        Object oDownMenuItem is a cDRSearchPreviewOptionsMenuItem
                            Set psCaption to C_$DRSearchInPreviewDown
                            Set phmSearchOptionGet to (RefFunc (pbDown))
                            Set phmSearchOptionSet to (RefProcSet (pbDown))
                            Set phoSearchMenuItem to oSearchInPreview
                        End_Object

                        Object oWholeWordMenuItem is a cDRSearchPreviewOptionsMenuItem
                            Set psCaption to C_$DRSearchInPreviewWholeWord
                            Set phmSearchOptionGet to (RefFunc (pbWholeWord))
                            Set phmSearchOptionSet to (RefProcSet (pbWholeWord))
                            Set phoSearchMenuItem to oSearchInPreview
                        End_Object

                        Object oMatchCaseMenuItem is a cDRSearchPreviewOptionsMenuItem
                            Set psCaption to C_$DRSearchInPreviewMatchCase
                            Set phmSearchOptionGet to (RefFunc (pbMatchCase))
                            Set phmSearchOptionSet to (RefProcSet (pbMatchCase))
                            Set phoSearchMenuItem to oSearchInPreview
                        End_Object
                    End_Object
                End_Object
            End_Object

            { Visibility = Private }
            Procedure OnResizeCommandBars Integer iLeft Integer iTop Integer iRight Integer iBottom
                Integer iSize iPos
        
                Get GuiToDialog (iBottom - iTop) (iRight - iLeft) to iSize
                Get GuiToDialog iTop iLeft to iPos
        
                Set Size of oClientContainer to (Hi (iSize)) (Low (iSize))
                Set Location of oClientContainer to (Hi (iPos)) (Low (iPos))
            End_Procedure

            Object oClientContainer is a Container3d
                Set Size to 253 495
                Set Location to 21 0

                Object oSplitterContainer is a cSplitterContainer
                    Set piSplitterLocation to 103

                    Object oLeftContainer is a cSplitterContainerChild
                        Object oGroupTree is a cDRGroupTree
                            Set Location to 0 0
                            Set Size to 249 101
                            Set peAnchors to anAll
                            
                            Procedure Activating
                                Integer iSize
                                
                                Forward Send Activating
                                
                                Delegate Get GuiSize to iSize
                                Set GuiSize to (Hi (iSize)) (Low (iSize))                                
                            End_Procedure
                        End_Object
                    End_Object

                    Object oRightContainer is a cSplitterContainerChild
                        Procedure Activating
                            Integer iSize
                            
                            Forward Send Activating
                            
                            Get GuiSize to iSize
                            Set GuiSize of oReport to (Hi (iSize)) (Low (iSize))                                
                        End_Procedure
                        
                        Object oReport is a cDRReport
                            Set Location to 0 0
                            Set Size to 249 385
                            Set peAnchors to anAll
                            Set phoReport to Self
                            // ToDo: Assign a report filename.
                            // Set psReportName to 'somename.DR'
                            Set pePreviewStyle to C_DRPREVIEW_EMBEDDED
                    
                            Procedure OnInitializeReport
                                Integer eOutputDeviceMode
                                
                                Forward Send OnInitializeReport
                                
                                Get Output_Device_Mode to eOutputDeviceMode
                                Set peOutputDestination to eOutputDeviceMode
                                
                                Send SetFilters
                                Send SetSortFields
                                Send SetParameters
                            End_Procedure
                            
                            Procedure SetFilters
                                // ToDo: Setup a data filter. For example based on the selection criteria entered by the end-user.
                            End_Procedure
                            
                            Procedure SetParameters
                            End_Procedure
                            
                            Procedure SetSortFields
                            End_Procedure
                            
                            Procedure OnZoomChanged Integer iFactor
                                Set psText of (oZoom (oDRToolBar (oCommandBars))) to (String (iFactor) + "%")
                            End_Procedure
                            
                            Procedure OnPageChanged Integer iPage
                                Set psText of (oCurrentPage (oDRToolBar (oCommandBars))) to (String (iPage))
                            End_Procedure
                        End_Object
                    End_Object
                End_Object
            End_Object
        End_Object
    End_Object

    Object oRunButton is a Button
        Set Label to "&Run Report"
        Set Size to 14 50
        Set Location to 300 405
        Set Status_Help to "Executes the Report"
        Set Default_State To True
        Set peAnchors to anBottomRight
        
        Procedure OnClick
            Handle hoReport
            
            Send Request_Switch_To_Tab of oDRTabDialog 1 3
            Get phoReport to hoReport
            Send RunReport of hoReport
        End_Procedure
    End_Object
    
    Object oCancelButton Is A Button
        Set Label To "&Cancel"
        Set Size To 14 50
        Set Location to 300 455
        Set Status_Help To "Cancel this Panel"
        Set peAnchors to anBottomRight
        
        // This procedure closes the report view.
        Procedure OnClick
            Send Request_Cancel
        End_Procedure
    End_Object
    
    On_Key Key_Alt+Key_C Send KeyAction of oCancelButton
    On_Key Key_Alt+Key_R Send KeyAction of oRunButton    
    On_Key Key_PgDn Send PreviewNextPage of oReport
    On_Key Key_PgUp Send PreviewPreviousPage of oReport
    On_Key Key_Ctrl+Key_Home Send PreviewFirstPage of oReport
    On_Key Key_Ctrl+Key_End Send PreviewLastPage of oReport
End_Object
