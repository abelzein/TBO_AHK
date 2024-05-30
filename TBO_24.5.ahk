#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance force	
#NoTrayIcon	
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Hotstring C R

; REMOVE WHITESPACE IN CLIPBOARD

F2::
Clipboard := StrReplace(Clipboard, A_Space, "")
Clipboard := StrReplace(Clipboard, A_Tab, "")
return


; START GUI

::+tbo::
Originticket()
return


; STOP GUI

Close()
{
Gui, Destroy
Return
}


; OUTLOOK SCRIPTS

; START OUTLOOK

CheckOutlook()
{
Process, Exist, Outlook.exe
If Not ErrorLevel
{
	Run, Outlook.exe	; You may need to specify the full path here.
	WinWaitActive, ahk_exe Outlook.exe
	sleep 2000
	Msgbox, Wait for Outlook
}
}

Clear()
{
global
GuiControl, ,Tissue
GuiControl, ,Staken
GuiControl, ,Contact
GuiControl, ,Klantennummer
GuiControl, ,Probleem
GuiControl, ,Uitgevacties
GuiControl, ,MSISDN
GuiControl, ,Problemshort
GuiControl, ,Scid
GuiControl, ,Error
GuiControl, ,Extdescr
GuiControl, ,Timer
GuiControl, ,Ncstatus
GuiControl, ,Crdcstatus
GuiControl, ,Mnpstatus
GuiControl, ,Taskerror
GuiControl, ,Type
GuiControl, ,Status
GuiControl, ,Phoneinfo
GuiControl, ,Watchinfo
GuiControl, ,Iccid
GuiControl, ,Imsi
GuiControl, ,Watcheid
GuiControl, ,Watchiccid
GuiControl, ,SIMOLO
GuiControl, ,CMRNROLO
GuiControl, ,Password
GuiControl, ,Date
GuiControl, ,EMAIL
GuiControl, ,Reason
GuiControl, ,Flow
GuiControl, ,Step
GuiControl, ,Timestamp
GuiControl, ,Softwareinfo
GuiControl, ,RFTicket
GuiControl, ,Date
GuiControl, ,Ordernr
GuiControl, ,PEGAStatus
GuiControl, ,LinkBSS
GuiControl, ,NCStatus
GuiControl, ,FusionStatus
GuiControl, ,Tasklink
GuiControl, ,Scid2
GuiControl, ,SEVER
GuiControl, ,Timestamp
GuiControl, ,Domeinmail
GuiControl, ,Mailsender
GuiControl, ,Mailrec
GuiControl, ,Dateandtime
GuiControl, ,Spamcause
GuiControl, ,Vadenaam
GuiControl, ,Id
GuiControl, ,Olopxtelefoonnummer
GuiControl, ,Oloscid
GuiControl, ,Olonaam  
GuiControl, ,Modemmac
GuiControl, ,Pakket
GuiControl, ,Repdienst
GuiControl, ,Service
GuiControl, ,Zenderpakket
GuiControl, ,Serienr
GuiControl, ,Telefoonnummer
Return
}

; MAIN MENU

OriginTicket()
{
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TBO TEMPLATES (v24.5)
Gui, Add, Text,, 
Gui, Add, Button, gSCTemplateJust, SERVICE CASE LOG
Gui, Add, Button, gSms, SMS
Gui, Add, Button, gMailCMR, MAIL
Gui, Add, Button, gTestCalls, TESTCALL
Gui, Add, Text,, 
Gui, Add, Button, gTBOAccess, ACCESS
Gui, Add, Button, gTBOServices, SERVICES
Gui, Add, Text,, 
Gui, Add, Button, gHotkeyInfo, Info AutoHotKey
Gui, Show
}

; TBO ACCESS

TBOAccess()
{
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, ACCESS TEMPLATES
Gui, Add, Text,, 
Gui, Add, Button, gMailPlanningAccess, PLANNING ACCESS
Gui, add, Text,, 
Gui, Add, Button, gOriginTicket, BACK
Gui, Show
}

MailPlanningAccess()
{
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, PLANNING ACCESS
Gui, Add, Text,, 
Gui, Add, Button, gMailPlanningAccess1, ACCESS 1
Gui, Add, Button, gMailPlanningAccess2, ACCESS 2
Gui, Add, Button, gMailPlanningAccess3, ACCESS 3
Gui, Add, Text,, 
Gui, Add, Button, gTBOAccess, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

; TBO SERVICES

TBOServices()
{
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, SERVICES TEMPLATES
Gui, Add, Text,, 
Gui, Add, Button, gIOBChat, IOB CHAT
Gui, Add, Button, gTicketMenu, IT TICKET
Gui, Add, Button, gVadeSpam, SPAMCAUSE PUTTY
Gui, Add, Button, gMailServ, MAIL OLO
Gui, Add, Button, gInfoOLO, INFO OLO
Gui, Add, Text,, 
Gui, Add, Button, gMailPlanningBB, PLANNING BROADBAND
Gui, Add, Button, gMailPlanningMob, PLANNING MOBILE
Gui, Add, Text,, 
Gui, Add, Button, gOriginTicket, BACK
Gui, Show
}

MailPlanningBB()
{
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, PLANNING BROADBAND
Gui, Add, Text,, 
Gui, Add, Button, gMailPlanningBB1, BROADBAND 1
Gui, Add, Button, gMailPlanningBB2, BROADBAND 2
Gui, Add, Text,, 
Gui, Add, Button, gTBOServices, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

; PUTTY SCRIPT

VadeSpam()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, SEARCH PUTTY
Gui, Add, Text,, 
Gui, add, Text,, ID
Gui, add, Edit,vId,
Gui, add, Text,, DATE (YYYMMDD)
Gui, add, Edit,vDate,
Gui, add, Text,, TIMESTAMP (UU)
Gui, add, Edit,vTimestamp,
Gui, Add, Button, gClear, CLEAR
Gui, add, Text,,
Gui, Add, Button, gCopyspam, COPY
Gui, Add, Button, gCopyspam2, COPY FOR MULTI-RECIPIENT
Gui, Add, Button, gMailVade, START SCRIPT VOOR VADE E-MAIL
Gui, add, Text,,
Gui, Add, Button, gTBOServices, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

Copyspam()
{
global
Gui, Submit, NoHide ;betere manier dan control get
Stringspam =
(
zgrep id=%Id% */applications-%Datum%%Tijd%00*
)
clipboard = %Stringspam%
return
}

Copyspam2()
{
global
Gui, Submit, NoHide ;betere manier dan control get
Stringspam2 =
(
zgrep id=%Id% */messages-%Datum%%Tijd%00*
)
clipboard = %Stringspam2%
return
}

; Mail vade

MailVade()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, MAIL VADESECURE
Gui, Add, Text,, 
Gui, Add, Text,, MAIL ADDRESS OR DOMAIN
Gui, Add, Edit, vDomeinmail
Gui, Add, Text,, MAIL SENDER
Gui, Add, Edit, vMailsender
Gui, Add, Text,, MAIL RECIPIENT
Gui, Add, Edit, vMailrec
Gui, Add, Text,, DATE AND TIME
Gui, Add, Edit, vDateandtime
Gui, Add, Text,, SPAMCAUSE OF EXAMPLE
Gui, Add, Edit, vSpamcause
Gui, Add, Text,, YOUR NAME
Gui, Add, Edit, vVadenaam
Gui, Add, Text,, 
Gui, Add, Button, gCopyVadeMail, CREATE
Gui, Add, Button, gClear, CLEAR
Gui, Add, Text,, 
Gui, Add, Button, gVadeSpam, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyVadeMail()
{
global
Gui, Submit, Nohide
CheckOutlook()

Subvade = Mails sent from %Domeinmail% are incorrectly marked as spam
Stringvade =
(
<p>Hi</p>

<p>Mails sent from the domain/e-mail %Domeinmail% are incorrectly marked as spam. Can you please check and correct this</p>

<p>Example:</p>

<p>Sender: %Mailsender%<br>
Recipient: %Mailrec%<br>
Date: %Dateandtime%<br>
Spam cause: %Spamcause%</p>

<p>Decrypted:<br>
!!!Plak hier de decrypted spamcause!!!</p>

<p>Kind regards<br>
%Vadenaam%</p>
)
MailFromTest(Subvade, Stringvade, "", "support@vadesecure.com", "")
return
}

MailServ()
{
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, SERVICES MAIL TEMPLATES
Gui, Add, Text,, 
Gui, Add, Button, gBroadbandServMail, BROADBAND
Gui, Add, Button, gMobileServMail, MOBILE
Gui, Add, Text,, 
Gui, Add, Button, gTBOServices, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

BroadbandServMail()
{
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BROADBAND SERVICES MAIL TEMPLATES
Gui, Add, Text,, 
Gui, Add, Button, gOloPx, MAIL PROXIMUS
Gui, Add, Text,, 
Gui, Add, Button, gMailServ, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

MobileServMail()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, MAIL OLO MOBILE
Gui, add, Text,, 
Gui, Add, Button, gRejectMailOLO, REJECT
Gui, Add, Button, gTViolationMail, T-VIOLATION
Gui, Add, Button, gExecRejectMail, EXEC REJECT
Gui, Add, Button, gPortbackMail, PORTBACK
Gui, Add, Button, gRoutingMail, ROUTING
Gui, Add, Button, gDuplicateMail, MNP DUPLICATE FOUND
Gui, add, Text,, 
Gui, Add, Button, gMailServ, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

; SERVICE CASE

SCTemplateJust()
{
global
Gui, Destroy
Gui, Font, s10
Gui, Add, Text,, SERVICE CASE LOG - JUST
Gui, Add, Text,, 
Gui, Add, Button, gSCTemplateUnjust, UNJUSTIFIED? CLICK HERE
Gui, Add, Text,, 
Gui, Add, Checkbox, vForceCompleteAflog, FORCE COMPLETED FUSION TASKS?
Gui, Add, Button, gClickHere, CLICK HERE AFTER CHECKING THE BOX ABOVE
Gui, Add, Text,,
Gui, add, Text,, TECHNICAL ISSUE
Gui, Add, Edit, r5 w380 vTissue, 
Gui, add, Text,, ACTION(S) TAKEN
Gui, Add, Edit, r5 w380 vStaken 
Gui, add, Text,, MOTIVATE FORCE COMPLETING THE FUSION TASKS:
Gui, Add, Edit, r5 w180 vFCname Disabled
Gui, add, Text,, CONTACT DETAILS
Gui, Add, Edit, r5 w380 vContact,
Gui, Add, Button, gCopyCaseTemplateJust, COPY
Gui, Add, Button, gClear, CLEAR
Gui, Add, Text,,
Gui, Add, Button, gOriginTicket, BACK
Gui, Show
}   

CopyCaseTemplateJust()
{
global
Gui, Submit, NoHide

if (ForceCompleteAflog = 1)
{
	stringCaseTemplate = 
	(
Technical issue:
%Tissue%

Action(s) taken by TBO:  
%Staken% ,Fusion tasks have been manually handled in NC. %FCname%

Contact details: 
%Contact%
)
}

else
{
stringCaseTemplate = 
(
Technical issue:
%Tissue%

Action(s) taken by TBO:  
%Staken%

Contact details:
%Contact%
)
}
Clipboard := stringCaseTemplate
return
}

ClickHere()
{
global
Gui, Submit, Nohide

if (ForceCompleteAflog = 1)
{
GuiControl, Enable, FCname
}
else 
{
GuiControl, Disable, FCname
}
}


SCTemplateUnjust()
{
global
Gui, Destroy
Gui, Font, s10
Gui, Add, Text,, SERVICE CASE LOG - UNJUST
Gui, Add, Text,, 
Gui, Add, Button, gSCTemplateJust, JUSTIFIED? CLICK HERE
Gui, Add, Text,, 
Gui, add, Text,, TECHNICAL ISSUE
Gui, Add, Edit, r5 w380 vTissue, 
Gui, add, Text,, ACTION(S) TAKEN
Gui, Add, Edit, r5 w380 vStaken,
Gui, add, Text,, CONTACT DETAILS
Gui, Add, Edit, r5 w380 vContact,
Gui, Add, Text,, 
Gui, Add, Text,, UNJUSTIFIED REASON?
Gui, Add, Edit, r5 w380 vReason,
Gui, Add, Text,, CORRECT ACTION/FLOW?
Gui, Add, Edit, r5 w380 vActionFlow,
Gui, Add, Button, gCopyCaseTemplateUnjust, COPY
Gui, Add, Button, gClear, CLEAR
Gui, Add, Text,,
Gui, Add, Button, gOriginTicket, BACK
Gui, Show
}

CopyCaseTemplateUnjust()
{
global
Gui, Submit, NoHide

stringCaseTemplate = 
(
Technical issue:
%Tissue%

Action(s) taken by TBO:  
%Staken%

Contact details:
%Contact%

--

Reason Why Unjustified:
%Reason%

What should be the right flow/action:
%ActionFlow%
)
clipboard := stringCaseTemplate
return
}

; IOB CHAT

IOBChat()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, IOB CHAT
Gui, Add, Text,, 
Gui, Add, Text,, CUSTOMER NR
Gui, Add, Edit, vKlantennummer
Gui, Add, Text,, PEGA SC-ID
Gui, Add, Edit, vScid
Gui, Add, Text,, ISSUE
Gui, Add, Edit, r5 w380 vProbleem
Gui, Add, Text,, ACTIONS PERFORMED
Gui, Add, Edit, r5 w380 vUitgevacties,  
Gui, Add, Button, gCopyIOB, COPY
Gui, Add, Button, gClear, CLEAR
Gui, Add, Text,, 
Gui, Add, Button, gTBOServices, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyIOB()
{
global
Gui, Submit, Nohide

Stringfw =
(
Hi Billing,

CN: %Klantennummer%
PEGA-SC: %Scid%
MSISDN: %MSISDN%

ISSUE:
%Probleem%

ACTION(S) PERFORMED:
%Uitgevacties%
)
clipboard := Stringfw
return
}

; IT TICKET MENU

TicketMenu()
{
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, IT TICKET TEMPLATES
Gui, Add, Text,, 
Gui, Add, Button, gTicketTemplateBB, BROADBAND
Gui, Add, Button, gTicketTemplateMob, MOBILE
Gui, add, Text,, 
Gui, Add, Button, gTBOServices, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

TicketTemplateMob()
{
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, MOBILE IT TICKET TEMPLATES
Gui, Add, Text,, 
Gui, Add, Button, gItTicket, GENERAL TICKET
Gui, Add, Button, gMNPTicket, MNP TIMER TICKET
Gui, Add, Button, gPIDTicket, BASE PID TICKET
Gui, Add, Button, gEsimMenu, ESIM TICKET
Gui, add, Text,, 
Gui, Add, Button, gTicketMenu, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

; IT TICKET BB

TicketTemplateBB()
{
global
Gui, Destroy
Gui, Add, Checkbox, vCoos, COOS?
Gui, Add, Checkbox, vSheet, SHEET?
Gui, Add, Checkbox, vForceComplete, USED FORCE COMPLETE?
Gui, Add, Button, gCheck, CLICK THIS AFTER FORCE COMPLETE CHECKBOX
Gui, Add, Text,, SERVICE
Gui, Add, DropDownList, vServiceBB, ALL||INTERNET|FIXED LINE|DTV
Gui, Add, Text,, CATEGORY
Gui, Add, DropDownList, vCatServicesBB, PID||Webmail|Order Entery|Inflight Order|Change Ownership|Move|Activation|Fixed IP|Modem Swap|STB Swap|Fixed Tel|PEGA Unable To Close SC
Gui, Add, Text,, ISSUE (Short))
Gui, Add, Edit, vProblemshort
Gui, Add, Text,, CUSTOMERNR
Gui, Add, Edit, vKlantennummer
Gui, Add, Text,, BSS LINK CMR
Gui, Add, Edit, vLinkBSS
Gui, Add, Text,, PEGA SC-ID WITH ERROR (FC Ticket)
Gui, Add, Edit, vScid Disabled
Gui, Add, Text,, PEGA SC STATUS (FC Ticket)
Gui, Add, Edit, vPEGAStatus Disabled
Gui, Add, Text,, ERROR XXDO_SEVERETECHPROBLEM (FC Ticket)
Gui, Add, Edit, vSEVER Disabled
Gui, Add, Text,, NC STATUS BEFORE WA (FC Ticket)
Gui, Add, Edit, vNCStatus Disabled
Gui, Add, Text,, FUSION DELIVERY STATUS (FC Ticket)
Gui, Add, Edit, vFusionStatus Disabled
Gui, Add, Text,, LINK TASK
Gui, Add, Edit, vTasklink
Gui, Add, Text,, PEGA SC-ID
Gui, Add, Edit, vScid2
Gui, Add, Text,, ERROR
Gui, Add, Edit, vError
Gui, Add, Text,, DESCRIPTION & ACTIONS PERFORMED
Gui, Add, Edit, r5 w380 vExtdescr,
Gui, Add, Button, gCopyTicketBB, COPY
Gui, Add, Button, gClear, CLEAR
Gui, Add, Text,, 
Gui, Add, Button, gTicketMenu, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyTicketBB()
{
global
Gui, Submit, Nohide

if (Coos = 1)
{ 
Coos := " / COOS"
}
else
{
Coos := ""
}

if (Sheet = 1)
{
	if (Coos = " / COOS"){
	Sheet := " / Sheet"
	}
	else{
	Sheet := " / Sheet"
	}
}
else
{
Sheet:= ""
}

if (ForceComplete = 1)
{
    Stringmob = 
    (
        Origin / %ServiceBB% / %Klantennummer% / %Scid% / Force Complete

        - Regarding customer: %Klantennummer%

        - PEGA Service Case in error: %Scid%

		- Error: %SEVER%

        - PEGA Servicecase status: %PEGAStatus%

        - NC status (before WA): %NCStatus%

        - Fusion Delivery Status: %FusionStatus%

        - WA applied: 
	To get customer in service we've manually handled the NC order.
	Fusion Delivery Order and PEGA HW delivery service case are not handled.


	- Description of the problem: 
	When trying to handle the HW delivery in Pega, error %SEVER% has been received.
	When checking the EAN and Serial should be correct, hence error seems to be incorrect.
	Kindly investigate RC of this error and provide solution as this error.
	
	Thank you!

    )

    ForceComplete := "/ FC"
}
else
{
    Stringmob = 
    (
        Origin%Coos% %Sheet% / %ServiceBB% / Non-Billing / %Klantennummer% / %Scid2% / %CatServicesBB% / %Problemshort%

        - Regarding customer: %Klantennummer%
        - Customer BSS Link: %LinkBss%
        - Problem: %Problemshort%
        - Link of the task: %Tasklink%
        - Error: %Error%
        - Description or Steps:
        %Extdescr%
        
        Can You solve this please?
        If TBO could have done this please provide us with the steps.
        Thank you!
    )
    ForceComplete := ""
}

clipboard := Stringmob
return
}

Check()

{
global
Gui, Submit, Nohide

if (ForceComplete = 1)
{
GuiControl, Disable, Scid
    GuiControl, Disable, Error
	GuiControl, Disable, LinkBSS
	GuiControl, Disable, Tasklink
	GuiControl, Disable, Problemshort
	GuiControl, Disable, Extdescr

	GuiControl, Enable, Scid
    GuiControl, Enable, SEVER
	GuiControl, Enable, PEGAStatus
	GuiControl, Enable, NCStatus
	GuiControl, Enable, FusionStatus
}

else
{
	GuiControl, Disable, Scid
    GuiControl, Disable, SEVER
	GuiControl, Disable, PEGAStatus
	GuiControl, Disable, NCStatus
	GuiControl, Disable, FusionStatus

	GuiControl, Enable, Scid2
    GuiControl, Enable, Error
	GuiControl, Enable, LinkBSS
	GuiControl, Enable, Tasklink
	GuiControl, Enable, Problemshort
	GuiControl, Enable, Extdescr
}
}

; IT TICKET MOB

ItTicket()
{
global
Gui, Destroy
Gui, Font, s10
Gui, Add, Text,, GENERAL IT TICKET
Gui, Add, Text,, 
Gui, Add, Checkbox, vForceComplete, FORCE COMPLETE
Gui, Add, Checkbox, vCoos, COOS
Gui, Add, Checkbox, vSoho, SOHO COOS
Gui, Add, Text,, BRAND
Gui, Add, DropDownList, vTelbase, TELENET||BASE
Gui, Add, Text,, ISSUE (Short)
Gui, Add, Edit, vProblemshort
Gui, Add, Text,, CUSTOMER NUMBER
Gui, Add, Edit, vKlantennummer
Gui, Add, Text,,MSISDN
Gui, Add, Edit, vMSISDN
Gui, Add, Text,,ICCID
Gui, Add, Edit, vIccid
Gui, Add, Text,, PEGA SC-ID
Gui, Add, Edit, vScid
Gui, Add, Text,, ERROR
Gui, Add, Edit, vError
Gui, Add, Text,, DESCRIPTION
Gui, Add, Edit, r5 w380 vExtdescr, 
Gui, Add, Text,, ACTIONS PERFORMED
Gui, Add, Edit, r5 w380 vUitgevacties,
Gui, Add, Text,,
Gui, Add, Button, gCopyTicket, COPY
Gui, Add, Button, gClear, CLEAR
Gui, Add, Text,,
Gui, Add, Button, gTicketTemplateMob, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyTicket()
{
global

Gui, Submit, Nohide

if (Soho =1)
{
Soho := "/ SOHO COOS"
Coos := ""
}
else
{
	Soho := ""
	if (Coos = 1)
	{
	Coos := "/ COOS"
	}
	else
	{
	Coos := ""
	}
}

if (ForceComplete = 1)
{
ForceComplete := "/ Force Complete"
}
else
{
	ForceComplete := ""
}
	

Stringmob =
(
OriginMOB %Soho%%Coos% / %Telbase% / Non-Billing / %Klantennummer% / %Scid% / %Problemshort% %ForceComplete%

- Error:
%Error%

- Description:
%Extdescr%

- Action(s) Performed:
%Uitgevacties%

- Customer number: %Klantennummer%
- MSISDN: %MSISDN%
- ICCID: %Iccid%
- PEGA SC: %Scid%
- Problem: %Problemshort%

- Required solution: Kindly investigate, make sure the issue is solved and identify the Root Cause. Also create a KBA if possible.
)
clipboard := Stringmob
return
}

; MNP TICKET

MNPTicket()
{
global
Gui, Destroy
Gui, Font, s10
Gui, Add, Text,, MNP IT TICKET
Gui, Add, Text,, 
Gui, Add, Checkbox, vForceComplete, FORCE COMPLETE
Gui, Add, Checkbox, vCoos, COOS
Gui, Add, Checkbox, vSoho, SOHO COOS
Gui, Add, Text,, BRAND
Gui, Add, DropDownList, vTelbase, TELENET||BASE
Gui, Add, Text,, CUSTOMER NUMBER
Gui, Add, Edit, vKlantennummer
Gui, Add, Text,,MSISDN
Gui, Add, Edit, vMSISDN
Gui, Add, Text,,ICCID
Gui, Add, Edit, vIccid
Gui, Add, Text,, MNPMAN TIMER
Gui, Add, Edit, vTimer
Gui, Add, Text,, STATUS NC
Gui, Add, Edit, vNcstatus
Gui, Add, Text,, STATUS CRDC
Gui, Add, Edit, vCrdcstatus
Gui, Add, Text,, STATUS MNPMAN
Gui, Add, Edit, vMnpstatus
Gui, Add, Text,, DESCRIPTION
Gui, Add, Edit, r5 w380 vExtdescr, 
Gui, Add, Text,, ACTIONS PERFORMED
Gui, Add, Edit, r5 w380 vUitgevacties,
Gui, Add, Button, gCopyMNPTicket, COPY
Gui, Add, Button, gClear, CLEAR
Gui, Add, Text,, 
Gui, Add, Button, gTicketTemplateMob, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyMNPTicket()
{
global

Gui, Submit, Nohide

if (Soho =1)
{
Soho := "/ SOHO COOS"
Coos := ""
}
else
{
	Soho := ""
	if (Coos = 1)
	{
	Coos := "/ COOS"
	}
	else
	{
	Coos := ""
	}
}

if (ForceComplete = 1)
{
ForceComplete := "/ Force Complete"
}
else
{
	ForceComplete := ""
}

Stringmob =
(
OriginMNP %Soho%%Coos% / %Telbase% / Non-Billing / %Klantennummer% / %Timer% %ForceComplete%

- MNPMan Timer:
%Timer%

- Description:
%Extdescr%

- Action(s) Performed:
%Uitgevacties%

- Customer number: %Klantennummer%
- MSISDN: %MSISDN%
- ICCID: %Iccid%
- Status NetCracker: %Ncstatus%
- Status CRDC: %Crdcstatus%
- Status MNPMan: %Mnpstatus%

- Required solution: We have legal terms towards other providers. Kindly investigate, make sure the issue is solved and identify the Root Cause. Also create a KBA if possible.
)
clipboard := Stringmob
return
}

; PID TICKET

PIDTicket()
{
global
Gui, Destroy
Gui, Font, s10
Gui, Add, Text,, BASE PID TICKET
Gui, Add, Text,, 
Gui, Add, Text,, ISSUE (Short)
Gui, Add, Edit, vProblemshort
Gui, Add, Text,, CUSTOMER NUMBER
Gui, Add, Edit, vKlantennummer
Gui, Add, Text,,EMAIL
Gui, Add, Edit, vEMAIL
Gui, Add, Text,,MSISDN
Gui, Add, Edit, vMSISDN
Gui, Add, Text,, PEGA SC-ID
Gui, Add, Edit, vScid
Gui, Add, Text,, ERROR
Gui, Add, Edit, vError
Gui, Add, Text,, DESCRIPTION
Gui, Add, Edit, r5 w380 vExtdescr, 
Gui, Add, Text,, ACTIONS PERFORMED
Gui, Add, Edit, r5 w380 vUitgevacties,
Gui, Add, Text,,
Gui, Add, Button, gCopyPIDTicket, COPY
Gui, Add, Button, gClear, CLEAR
Gui, Add, Text,,
Gui, Add, Button, gTicketTemplateMob, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyPIDTicket()
{
global

Gui, Submit, Nohide

Stringmob =
(
OriginMOB / BASE PID / Non-Billing / %Klantennummer% / %Scid% / %Problemshort%

- Error:
%Error%

- Description:
%Extdescr%

- Action(s) Performed:
%Uitgevacties%

- Customer number: %Klantennummer%
- Email: %EMAIL%
- MSISDN: %MSISDN%
- Problem: %Problemshort%
- PEGA SC: %Scid%

- Required solution: Kindly investigate, make sure the issue is solved and identify the Root Cause. Also create a KBA if possible.
)
clipboard := Stringmob
return
}

; ESIM MENU

EsimMenu()
{
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, ESIM TICKET TEMPLATES
Gui, Add, Text,, 
Gui, Add, Button, gEsimPhoneMenu, ESIM SMARTPHONE
Gui, Add, Button, gEsimWatchMenu, ESIM SMARTWATCH
Gui, add, Text,, 
Gui, Add, Button, gTicketTemplateMob, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

EsimPhoneMenu()
{
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, ESIM SMARTPHONE TICKET TEMPLATES
Gui, Add, Text,, 
Gui, Add, Button, gESIMPhoneRFTicket, RF Ticket ESIM SMARTPHONE
Gui, Add, Button, gESIMPhoneOneTTicket, ONE-T TICKET ESIM SMARTPHONE
Gui, add, Text,, 
Gui, Add, Button, gEsimMenu, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

; ESIM SMARTPHONE TICKET

ESIMPhoneRFTicket()
{
global
Gui, Destroy
Gui, Font, s10
Gui, Add, Text,, ESIM SMARTPHONE IT TICKET
Gui, Add, Text,, 
Gui, Add, Checkbox, vForceComplete, FORCE COMPLETE
Gui, Add, Checkbox, vCoos, COOS
Gui, Add, Checkbox, vSoho, SOHO COOS
Gui, Add, Text,, BRAND
Gui, Add, DropDownList, vTelbase, TELENET||BASE
Gui, Add, Text,, ISSUE (Short)
Gui, Add, Edit, vProblemshort
Gui, Add, Text,, CUSTOMER NUMBER
Gui, Add, Edit, vKlantennummer
Gui, Add, Text,,MSISDN
Gui, Add, Edit, vMSISDN
Gui, Add, Text,,ICCID
Gui, Add, Edit, vIccid
Gui, Add, Text,, PEGA SC-ID
Gui, Add, Edit, vScid
Gui, Add, Text,, ERROR
Gui, Add, Edit, vError
Gui, Add, Text,, DESCRIPTION
Gui, Add, Edit, r5 w380 vExtdescr, 
Gui, Add, Text,, ACTIONS PERFORMED
Gui, Add, Edit, r5 w380 vUitgevacties,
Gui, Add, Text,,
Gui, Add, Button, gCopyESIMPhoneRFTicket, COPY
Gui, Add, Button, gClear, CLEAR
Gui, Add, Text,,
Gui, Add, Button, gEsimPhoneMenu, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyESIMPhoneRFTicket()
{
global

Gui, Submit, Nohide

if (Soho =1)
{
Soho := "/ SOHO COOS"
Coos := ""
}
else
{
	Soho := ""
	if (Coos = 1)
	{
	Coos := "/ COOS"
	}
	else
	{
	Coos := ""
	}
}

if (ForceComplete = 1)
{
ForceComplete := "/ Force Complete"
}
else
{
	ForceComplete := ""
}
	

Stringmob =
(
OriginMOB %Soho%%Coos% / ESIM SMARTPHONE / %Telbase% / Non-Billing / %Klantennummer% / %Scid% / %Problemshort% %ForceComplete%

- Error:
%Error%

- Description:
%Extdescr%

- Action(s) Performed:
%Uitgevacties%

- Customer number: %Klantennummer%
- MSISDN: %MSISDN%
- ICCID: %Iccid%
- Problem: %Problemshort%
- PEGA SC: %Scid%

- Required solution: Kindly investigate, make sure the issue is solved and identify the Root Cause. Also create a KBA if possible.
)
clipboard := Stringmob
return
}

ESIMPhoneOneTTicket()
{
global
Gui, Destroy
Gui, Font, s7
Gui, Add, Text,, ESIM SMARTPHONE ONE-T TICKET
Gui, Add, Text,, 
Gui, Add, Text,, BRAND
Gui, Add, DropDownList, vTelbase, TELENET||BASE
Gui, Add, Text,, ISSUE (Short)
Gui, Add, Edit, vProblemshort
Gui, Add, Text,, CUSTOMER NUMBER
Gui, Add, Edit, vKlantennummer
Gui, Add, Text,, PEGA SC-ID
Gui, Add, Edit, vScid
Gui, Add, Text,,MSISDN
Gui, Add, Edit, vMSISDN
Gui, Add, Text,,ICCID
Gui, Add, Edit, vIccid
Gui, Add, Text,,IMSI
Gui, Add, Edit, vImsi
Gui, Add, Text,,DEVICE BRAND
Gui, Add, Edit, vPhoneinfo
Gui, Add, Text,,SOFTWARE INSTALLED
Gui, Add, Edit, vSoftwareinfo
Gui, Add, Text,, ERROR
Gui, Add, Edit, vError
Gui, Add, Text,, EXACT STEP CUSTOMER RECEIVED THE ERROR
Gui, Add, Edit, vStep
Gui, Add, Text,, TIMESTAMP LATEST ATTEMPT
Gui, Add, Edit, vTimestamp
Gui, Add, Text,, HAS CUSTOMER BEEN ABLE TO ACTIVATE
Gui, Add, DropDownList, vActivateBefore, YES||NO
Gui, Add, Text,, CAN THE ISSUE BE REPRODUCED
Gui, Add, DropDownList, vReproduced, YES||NO
Gui, Add, Text,, STATUS NETCRACKER
Gui, Add, Edit, vNcstatus, 
Gui, Add, Text,, OBSERVED BEHAVIOUR
Gui, Add, Edit, r5 w380 vExtdescr, 
Gui, Add, Text,, INVESTIGATION DONE BY FO / TBO
Gui, Add, Edit, r5 w380 vUitgevacties,
Gui, Add, Text,,
Gui, Add, Button, gCopyESIMPhoneOneTTicket, COPY
Gui, Add, Button, gClear, CLEAR
Gui, Add, Text,,
Gui, Add, Button, gEsimPhoneMenu, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyESIMPhoneOneTTicket()
{
global

Gui, Submit, Nohide

if (Soho =1)
{
Soho := "/ SOHO COOS"
Coos := ""
}
else
{
	Soho := ""
	if (Coos = 1)
	{
	Coos := "/ COOS"
	}
	else
	{
	Coos := ""
	}
}	

Stringmob =
(
SY eSIM Handset / %Telbase% / %MSISDN% / %Problemshort% / %Scid%

Explanation of the issue:

MRI
o eSIM type: Handset
o Timestamp of latest attempt: %Timestamp%
o Has customer been able to activate before: %ActivateBefore%
o Can the issue / error be reproduced: %Reproduced%
o Exact error message customer received: %Error%
o Exact step customer received the error: %Step%
° NC Order status: %Ncstatus%
o Investigation done by FO / TBO: %Uitgevacties%
o Device information (Handset Brand - Type - software version): %Phoneinfo% - %Softwareinfo%
o MSISDN trying to activate: %MSISDN%
o Simcardnumber (ICCID) + IMSI of MSISDN: %Iccid% - %Imsi%
o Observed behaviour: %Extdescr%
o Any supporting documentation( such as screen shots, error logs, recordings) to be added:
Single customer complaints related to activation/provisioning need to be investigated 1st by IT BSS team.
Please share their full analysis and Remedy Force ticket reference number:
o ProfileType:
)
clipboard := Stringmob
return
}

; ESIM WATCH

EsimWatchMenu()
{
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, ESIM SMARTWATCH TICKET TEMPLATES
Gui, Add, Text,, 
Gui, Add, Button, gESIMWatchRFTicket, RF Ticket ESIM SMARTWATCH
Gui, Add, Button, gESIMWatchOneTTicket, ONE-T TICKET ESIM SMARTWATCH
Gui, add, Text,, 
Gui, Add, Button, gEsimMenu, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

; ESIM SMARTWATCH TICKET

ESIMWatchRFTicket()
{
global
Gui, Destroy
Gui, Font, s8
Gui, Add, Text,, ESIM SMARTWATCH IT TICKET
Gui, Add, Text,, 
Gui, Add, Checkbox, vForceComplete, FORCE COMPLETE
Gui, Add, Text,, ISSUE (Short)
Gui, Add, Edit, vProblemshort
Gui, Add, Text,, CUSTOMER NUMBER
Gui, Add, Edit, vKlantennummer
Gui, Add, Text,,MSISDN
Gui, Add, Edit, vMSISDN
Gui, Add, Text,, PEGA SC-ID
Gui, Add, Edit, vScid
Gui, Add, Text,, TASK IN ERROR
Gui, Add, Edit, vTaskerror
Gui, Add, Text,, TYPE
Gui, Add, Edit, vType
Gui, Add, Text,, STATUS
Gui, Add, Edit, vStatus
Gui, Add, Text,, ERROR
Gui, Add, Edit, vError
Gui, Add, Text,, PHONE INFO (Phone Brand - Type - software version)
Gui, Add, Edit, vPhoneinfo
Gui, Add, Text,, WATCH INFO (Watch Brand - Type - software version)
Gui, Add, Edit, vWatchinfo
Gui, Add, Text,, SIM ICCID
Gui, Add, Edit, vIccid
Gui, Add, Text,, SIM IMSI
Gui, Add, Edit, vImsi
Gui, Add, Text,, WATCH EID
Gui, Add, Edit, vWatcheid
Gui, Add, Text,, WATCH ICCID
Gui, Add, Edit, vWatchiccid
Gui, Add, Text,, DESCRIPTION
Gui, Add, Edit, r5 w380 vExtdescr, 
Gui, Add, Text,, ACTIONS PERFORMED
Gui, Add, Edit, r5 w380 vUitgevacties,
Gui, Add, Button, gCopyOneNumberTicket, COPY
Gui, Add, Button, gClear, CLEAR
Gui, Add, Text,,
Gui, Add, Button, gEsimWatchMenu, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyOneNumberTicket()
{
global

Gui, Submit, Nohide

if (ForceComplete = 1)
{
ForceComplete := "/ Force Complete"
}
else
{
	ForceComplete := ""
}

Stringmob =
(
OriginMOB / ESIM SMARTWATCH / Telenet / Non-Billing / %MSISDN% / %Scid% / %Problemshort% %ForceComplete%

- Problem:
%Problemshort%

- Description:
%Extdescr%

- Action(s) Performed:
%Uitgevacties%

- Customer number: %Klantennummer%
- MSISDN: %MSISDN%
- PEGA SC: %Scid%
- Task in Error: %Taskerror%
- Type: %Type%
- Status: %Status%
- Error: %Error%

- PHONE Device information (Watch and GSM Brand - Type - software version): %Phoneinfo%
- WATCH Device information (Watch and GSM Brand - Type - software version): %Watchinfo%
- Simcardnumber ICCID: %Iccid%
- Simcardnumber IMSI: %Imsi%
- Watch EID: %Watcheid%
- Watch ICCID: %Watchiccid%

- Required solution: Kindly investigate, make sure the issue is solved and identify the Root Cause. Also create a KBA if possible.
)
clipboard := Stringmob
return
}

ESIMWatchOneTTicket()
{
global
Gui, Destroy
Gui, Font, s7
Gui, Add, Text,, ESIM SMARTWATCH ONE-T TICKET
Gui, Add, Text,, 
Gui, Add, Text,, BRAND
Gui, Add, DropDownList, vTelbase, TELENET||BASE
Gui, Add, Text,, ISSUE (Short)
Gui, Add, Edit, vProblemshort
Gui, Add, Text,, CUSTOMER NUMBER
Gui, Add, Edit, vKlantennummer
Gui, Add, Text,, PEGA SC-ID
Gui, Add, Edit, vScid
Gui, Add, Text,,MSISDN
Gui, Add, Edit, vMSISDN
Gui, Add, Text,,PHONE BRAND
Gui, Add, Edit, vPhoneinfo
Gui, Add, Text,,SOFTWARE INSTALLED
Gui, Add, Edit, vSoftwareinfo
Gui, Add, Text,,ICCID PHONE
Gui, Add, Edit, vIccid
Gui, Add, Text,,IMSI PHONE
Gui, Add, Edit, vImsi
Gui, Add, Text,,WATCH BRAND
Gui, Add, Edit, vWatchinfo
Gui, Add, Text,,ICCID WATCH
Gui, Add, Edit, vWatchiccid
Gui, Add, Text,,EID WATCH
Gui, Add, Edit, vWatcheid
Gui, Add, Text,, ERROR
Gui, Add, Edit, vError
Gui, Add, Text,, EXACT STEP CUSTOMER RECEIVED THE ERROR
Gui, Add, Edit, vStep
Gui, Add, Text,, TIMESTAMP LATEST ATTEMPT (NOT AMDOCS)
Gui, Add, Edit, vTimestamp
Gui, Add, Text,, HAS CUSTOMER BEEN ABLE TO ACTIVATE
Gui, Add, DropDownList, vActivateBefore, YES||NO
Gui, Add, Text,, CAN THE ISSUE BE REPRODUCED
Gui, Add, DropDownList, vReproduced, YES||NO
Gui, Add, Text,, OBSERVED BEHAVIOUR
Gui, Add, Text,, TBO to provide following info from the Amdocs portal (transaction page) at time of the issue. 
Gui, Add, Text,, “submit order” details and/or “eligibility check” details
Gui, Add, Text,, if nothing would be available/visible then indicate this explicitly
Gui, Add, Edit, r5 w380 vExtdescr, 
Gui, Add, Text,, RF TICKET NR
Gui, Add, Edit, vRFTicket,
Gui, Add, Text,,
Gui, Add, Button, gCopyESIMWatchOneTTicket, COPY
Gui, Add, Button, gClear, CLEAR
Gui, Add, Text,,
Gui, Add, Button, gEsimWatchMenu, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyESIMWatchOneTTicket()
{
global

Gui, Submit, Nohide

if (Soho =1)
{
Soho := "/ SOHO COOS"
Coos := ""
}
else
{
	Soho := ""
	if (Coos = 1)
	{
	Coos := "/ COOS"
	}
	else
	{
	Coos := ""
	}
}	

Stringmob =
(
SY eSIM sign up / %Telbase% / %MSISDN% / %Problemshort% / %Scid%

Explanation of the issue:

MRI
o eSIM type: Watch
o Timestamp of latest attempt (Not AMDOCS tool timestamp): %Timestamp%
o Has customer been able to activate before: %ActivateBefore%
o Can the issue / error be reproduced: %Reproduced%
o Exact error message customer received: %Error%
o Exact step customer received the error: %Step%
o Investigation done by FO / TBO: %Uitgevacties%
o Device information (Watch and GSM Brand - Type - software version): %Phoneinfo% - %Softwareinfo%
o MSISDN trying to activate (Primary): %MSISDN%
o Simcardnumber (ICCID) + IMSI of MSISDN: %Iccid% - %Imsi%
o EID / ICCID from Watch: %Watcheid% - %Watchiccid%
o Observed behaviour: %Extdescr%
o Any supporting documentation( such as screen shots, error logs, recordings) to be added:
o Single customer complaints related to activation/provisioning need to be investigated 1st by IT BSS team. 
Please share their full analysis and Remedy Force ticket reference number: %RFTicket%
)
clipboard := Stringmob
return
}

; SMS MENU

Sms()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, SMS TEMPLATES
Gui, Add, Text,, 
Gui, Add, Button, gSmsTelenet, TELENET
Gui, Add, Button, gSmsBASE, BASE
Gui, add, Text,, 
Gui, Add, Button, gOriginTicket, BACK
Gui, Show
}

; SMS TELENET

SmsTelenet()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, TELENET SMS TEMPLATES
Gui, Add, Text,, 
Gui, Add, Button, gSmsTelenetRes, RESIDENTIAL
Gui, Add, Button, gSmsTelenetBus, BUSINESS
Gui, add, Text,, 
Gui, Add, Button, gSMS, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

SmsTelenetRes()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, TELENET SMS TEMPLATES
Gui, Add, Text,, 
Gui, Add, Button, gSmsTelenetResBB, BROADBAND
Gui, Add, Button, gSmsTelenetResMob, MOBILE
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenet, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

SmsTelenetResBB()
{
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET RESIDENTIAL SMS BROADBAND
Gui, Add, Text,, 
Gui, Add, Button, gSmsTelenetResGEN, GENERAL
Gui, Add, Button, gSmsTelenetResREQ, REQUEST INFO
Gui, Add, Button, gSmsTelenetResInt, INTERNET
Gui, Add, Button, gSmsTelenetResDTV, DTV
Gui, Add, Button, gSmsTelenetResFixed, FIXED LINE
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetRes, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

; SMS TELENET RESIDENTIAL GENERAL

SmsTelenetResGEN()
{
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET RESIDENTIAL SMS GENERAL
Gui, Add, Text,, 
Gui, Add, Button, gSmsTelenetResGENcb, CALLBACK
Gui, Add, Button, gModemActivate, MODEM ACTIVE
Gui, Add, Button, gPakketAanpassing, CHANGE BUNDLE
Gui, Add, Button, gItTicketSmsBB, IT TICKET
Gui, Add, Button, gItTicketSmsUpdateBB, UPDATE IT TICKET
Gui, Add, Button, gRepairCallback, REPAIR CALLBACK
Gui, Add, Button, gLoginOk, LOGIN OK
Gui, Add, Button, gLastReminder, LAST REMINDER
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetResBB, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

ItTicketSmsUpdateBB()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, UPDATE IT TICKET SMS
Gui, Add, Button, gCopyItUPBB, UPDATE IT Ticket NL
Gui, Add, Button, gCopyItUPBBFR, UPDATE IT Ticket FR
Gui, Add, Button, gCopyItUPBBEN, UPDATE IT Ticket EN
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetResGEN, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyItUPBB()
{
StringitupdateBB =
(
Telenet-info: Momenteel hebben we nog geen oplossing voor uw dossier. Onze IT-dienst werkt eraan. Bedankt voor uw geduld.
)
clipboard := StringitupdateBB
return
}

CopyItUPBBFR()
{
StringitupdateBB =
(
Telenet-info: Actuellement, nous n'avons pas encore de solution pour votre dossier. Notre département IT y travaille. Nous vous remercions de votre patience.
)
clipboard := StringitupdateBB
return
}

CopyItUPBBEN()
{
StringitupdateBB =
(
Telenet-info: Currently, we do not yet have a solution for your case. Our IT department is working on it. Thank you for your patience.
)
clipboard := StringitupdateBB
return
}


LastReminder()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET SMS LAST REMINDER
Gui, Add, Text,, 
Gui, add, Text,, PEGA SC-ID
Gui, Add, Edit, vScid, 
Gui, Add, Button, gCopyLastReminder, COPY NL
Gui, Add, Button, gCopyLastReminderFR, COPY FR
Gui, Add, Button, gCopyLastReminderEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetResGEN, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyLastReminder()
{
global
Gui, Submit, NoHide
StringLR = 
(
Telenet-info: We probeerden u al enkele malen te contacteren om uw technisch probleem te verhelpen. Hiervoor hebben we informatie van u nodig. Het dossier in kwestie is %Scid%. Dit nummer kan u ook best doorgeven wanneer u met ons contact opneemt.Gelieve ons te contacteren via de klantendienst op het nummer 015 66 66 66 of via WhatsApp op +32 468 00 10 98. We zijn er voor u op weekdagen van 8 tot 20 uur en in het weekend van 9 tot 20 uur.Let op: U heeft nog 1 week om deze informatie door te geven.Wanneer we geen informatie ontvangen, dan sluiten we het dossier.
)
clipboard := StringLR
return
}

CopyLastReminderFR()
{
global
Gui, Submit, NoHide
StringLR = 
(
Telenet-info: Nous avons déjà essayé de vous contacter à plusieurs reprises pour résoudre votre problème technique. Nous avons besoin de vos informations pour cela. Le dossier en question est le %Scid%. Il est également préférable de fournir ce numéro lorsque vous nous contactez. Veuillez nous contacter via le service client au 015 66 66 66 ou via WhatsApp au +32 468 00 10 98. Nous sommes à votre disposition en semaine de 8h à 20h. le week-end de 9h à 20h Attention : Vous avez encore 1 semaine pour fournir ces informations. Si nous ne recevons aucune information, nous fermerons le dossier.
)
clipboard := StringLR
return
}

CopyLastReminderEN()
{
global
Gui, Submit, NoHide
StringLR = 
(
Telenet-info: We have tried to contact you several times to resolve your technical problem. We need information from you for this. The file in question is %Scid%. It is advised to provide this number when you contact us. Please contact us via customer service on 015 66 66 66 or via WhatsApp on +32 468 00 10 98. We are there for you on weekdays from 8 a.m. to 8 p.m. hours and on weekends from 9 a.m. to 8 p.m. Please note: You still have 1 week to provide this information. If we do not receive any information, we will close the file.
)
clipboard := StringLR
return
}

SmsTelenetResGENcb()
{
global
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, PEGA SC-ID
Gui, Add, Edit, vScid,
Gui, Add, Button, gCopySmsTelenetResGENcb, COPY NL
Gui, Add, Button, gCopySmsTelenetResGENcbFR, COPY FR
Gui, Add, Button, gCopySmsTelenetResGENcbEN, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetResGEN, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopySmsTelenetResGENcb()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Kan u ons contacteren op 015666666 in verband met uw openstaand dossier %Scid%.
)
clipboard := Stringmob
return
}

CopySmsTelenetResGENcbFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info : Vous pouvez nous contacter au 015666666 concernant votre dossier ouvert %Scid%.
)
clipboard := Stringmob
return
}

CopySmsTelenetResGENcbEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Could you contact us on 015666666 regarding your file %Scid%.
)
clipboard := Stringmob
return
}

ModemActivate()
{
global
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, MODEM ACTIVE
Gui, add, Text,, 
Gui, add, Text,, MAC-ADDRESS MODEM
Gui, Add, Edit, vModemmac, 
Gui, Add, Button, gCopymodemActivate, COPY NL
Gui, Add, Button, gCopymodemActivateFR, COPY FR
Gui, Add, Button, gCopymodemActivateEN, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetResGEN, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopymodemActivate()
{
global
Gui, Submit, NoHide ;betere manier dan control get
Stringmodem = 
(
Telenet-info: Uw nieuwe modem %Modemmac% werd geactiveerd. Binnen 30 minuten kan u gebruik maken van uw diensten.
)
clipboard := Stringmodem
return
}

CopymodemActivateFR()
{
global
Gui, Submit, NoHide ;betere manier dan control get
Stringmodem = 
(
Telenet-info: Votre nouveau modem %Modemmac% a ete active. Vous pouvez utiliser vos services dans les 30 minutes.
)
clipboard := Stringmodem
return
}

CopymodemActivateEN()
{
global
Gui, Submit, NoHide ;betere manier dan control get
Stringmodem = 
(
Telenet-info: Your new modem %Modemmac% has been activated. You can use your services within 30 minutes.
)
clipboard := Stringmodem
return
}

PakketAanpassing()
{
global
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, WHICH BUNDLE
Gui, Add, Edit, vPakket, 
Gui, Add, Button, gCopyPakketaanpassing, COPY NL
Gui, Add, Button, gCopyPakketaanpassingFR, COPY FR
Gui, Add, Button, gCopyPakketaanpassingEN, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetResGEN, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyPakketaanpassing()
{
global
Gui, Submit, NoHide
stringpkkt = 
(
Telenet-info: Uw pakket is succesvol aangepast naar %Pakket%.
)
clipboard = %stringpkkt%
return
}

CopyPakketaanpassingFR()
{
global
Gui, Submit, NoHide
stringpkkt = 
(
Telenet-info: Votre abonnement a ete modifie avec succes en %Package%.
)
clipboard = %stringpkkt%
return
}

CopyPakketaanpassingEN()
{
global
Gui, Submit, NoHide
stringpkkt = 
(
Telenet-info: Your subscription has been successfully changed to %Package%.
)
clipboard = %stringpkkt%
return
}

ItTicketSmsBB(){
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, IT TICKET SMS
Gui, Add, Button, gCopyItBB, IT Ticket NL
Gui, Add, Button, gCopyItBBFR, IT Ticket FR
Gui, Add, Button, gCopyItBBEN, IT Ticket EN
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetResGEN, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyItBB()
{
Stringit =
(
Telenet-info: We hebben je dossier doorgestuurd naar onze IT-dienst. We houden je op de hoogte. Bedankt voor uw geduld.
)
clipboard := Stringit
return
}

CopyItBBFR()
{
Stringit =
(
Telenet-info: Nous avons transmis votre dossier a notre service informatique. Nous vous tiendrons informe. Merci pour votre patience.
)
clipboard := Stringit
return
}

CopyItBBEN()
{
Stringit =
(
Telenet-info: We have forwarded your file to our IT department. We will keep you informed. Thank you for your patience.
)
clipboard := Stringit
return
}

RepairCallback()
{
global
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, SERVICE (INT/DTV/FIXED)
Gui, add, Text,, May be left empty
Gui, Add, Edit, vRepdienst, 
Gui, Add, Button, gRepCopyCallback, COPY NL
Gui, Add, Button, gRepCopyCallbackFR, COPY FR
Gui, Add, Button, gRepCopyCallbackEN, COPY EN
Gui, add, Text,,
Gui, Add, Button, gClear, CLEAR
Gui, add, Text,,
Gui, Add, Button, gSmsTelenetResGEN, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

RepCopyCallback()
{
global
Gui, Submit, NoHide
Stringrepcall = 
(
Telenet-info: Gelieve ons te contacteren op het nr 015666666 voor een repair afspraak ivm uw %Repdienst% diensten.
)
clipboard := Stringrepcall
return
}


RepCopyCallbackFR()
{
global
Gui, Submit, NoHide
Stringrepcall = 
(
Telenet-info: Veuillez nous contacter au 015666666 pour un rendez-vous de réparation concernant vos services %Repdienst%.
)
clipboard := Stringrepcall
return
}


RepCopyCallbackEN()
{
global
Gui, Submit, NoHide
Stringrepcall = 
(
Telenet-info: Please contact us on 015666666 for a repair appointment regarding your %Repdienst% services.
)
clipboard := Stringrepcall
return
}

LoginOk()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, WHICH PLATFORM
Gui, Add, Text,, (MyTelenet, Telenet TV, webmail, ...)
Gui, Add, Edit, vService,
Gui, Add, Button, gCopyLoginOk, Copy NL
Gui, Add, Button, gCopyLoginOkFR, Copy FR
Gui, Add, Button, gCopyLoginOkEN, Copy EN
Gui, add, Text,,
Gui, Add, Button, gClear, CLEAR
Gui, add, Text,,
Gui, Add, Button, gSmsTelenetResGEN, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyLoginOk()
{
global
Gui, Submit, NoHide
Stringlog =
(
Telenet-info: U kan vanaf nu weer aanmelden op %Service%.
)
clipboard := Stringlog
return
}

CopyLoginOkFR()
{
global
Gui, Submit, NoHide
Stringlog =
(
Telenet-info: À partir de maintenant, vous pouvez vous reconnecter a %Service%.
)
clipboard := Stringlog
return
}

CopyLoginOkEN()
{
global
Gui, Submit, NoHide
Stringlog =
(
Telenet-info: You can now login to the following service %Service%.
)
clipboard := Stringlog
return
}

; SMS TELENET RESIDENTIAL REQUEST INFO

SmsTelenetResREQ()
{
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET RESIDENTIAL SMS REQUEST INFO
Gui, Add, Text,, 
Gui, Add, Button, gSmsModemInfo, MODEM INFO
Gui, Add, Button, gSmsDtvInfo, STB/SPDN INFO
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetResBB, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

SmsModemInfo()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET RESIDENTIAL SMS REQUEST MODEM
Gui, Add, Text,, 
Gui, Add, Button, gCopySmsModemInfo, COPY NL
Gui, Add, Button, gCopySmsModemInfoFR, COPY FR
Gui, Add, Button, gCopySmsModemInfoEN, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetResREQ, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopySmsModemInfo()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Kan u ons contacteren op 015666666 met het HFC MAC van uw nieuwe modem.
)
clipboard := Stringmob
return
}

CopySmsModemInfoFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Pouvez-vous nous contacter sur 015666666 avec l'adresse MAC de votre nouveau modem afin de compléter l'activation sur votre nouveau modem.
)
clipboard := Stringmob
return
}

CopySmsModemInfoEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Can you contact us on 015666666 with the MAC address of your new modem in order to complete the activation on your new modem.
)
clipboard := Stringmob
return
}

SmsDtvInfo()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET RESIDENTIAL SMS REQUEST DTV
Gui, Add, Text,, 
Gui, Add, Button, gCopySmsDtvInfo, COPY NL
Gui, Add, Button, gCopySmsDtvInfoFR, COPY FR
Gui, Add, Button, gCopySmsDtvInfoEN, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetResREQ, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}


CopySmsDtvInfo()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Kan u ons contacteren op 015666666 met het serienummer CA ID van uw nieuwe TV-Box/Digicorder.
)
clipboard := Stringmob
return
}

CopySmsDtvInfoFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Pouvez-vous nous contacter sur 015666666 avec le numéro de série de votre nouvelle TV-Box/Digicorder afin de compléter l'activation sur votre nouvel appareil.
)
clipboard := Stringmob
return
}

CopySmsDtvInfoEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Can you contact us on 015666666 with the Serial number of your new TV-Box/Digicorder in order to complete the activation on your new device.
)
clipboard := Stringmob
return
}

; SMS TELENET RESIDENTIAL INTERNET

SmsTelenetResInt()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, TELENET RESIDENTIAL SMS INTERNET
Gui, add, Text,, 
Gui, Add, Button, gResetInt, PASSWORD RESET
Gui, Add, Button, gEmailProgramma, DISAPPEARED MAILS DUE MAIL PROGRAM
Gui, Add, Button, gPIDTransfer, PID TRANSFER
Gui, Add, Button, gPIDinvite, PID INVITE
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetResBB, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

PIdTransfer(){
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, PID transfer
Gui, add, Text,, 
Gui, add, Text,, E-MAIL
Gui, Add, Edit, vEMAILT,
Gui, Add, Button, gCopyTransfer, COPY NL
Gui, Add, Button, gCopyTransferFR, COPY FR
Gui, Add, Button, gCopyTransferEN, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetResInt, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyTransfer()
{
global
Gui, Submit, NoHide
StringPIDTransfer = 
(
Telenet-info: Uw login %EMAILT% is beschikbaar. Gelieve opnieuw in te loggen.
)
clipboard := StringPIDTransfer
return
}

CopyTransferFR()
{
global
Gui, Submit, NoHide
StringPIDTransfer = 
(
Telenet-info: Votre login %EMAILT% est disponible. Veuillez vous connecter à nouveau.
)
clipboard := StringPIDTransfer
return
}

CopyTransferEN()
{
global
Gui, Submit, NoHide
StringPIDTransfer = 
(
Telenet-info: Your login %EMAILT% is available. Please login again.
)
clipboard := StringPIDTransfer
return
}

PIDinvite()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, PID INVITE
Gui, add, Text,, 
Gui, add, Text,, E-MAIL
Gui, Add, Edit, vEMAILINV,
Gui, Add, Button, gCopyInvite, COPY NL
Gui, Add, Button, gCopyInviteFR, COPY FR
Gui, Add, Button, gCopyInviteEN, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetResInt, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyInvite()
{
global
Gui, Submit, NoHide
StringPIDInvite = 
(
Telenet-info: We hebben naar je e-mailadres %EMAILINV% een nieuwe uitnodiging verstuurd voor het voltooien van je login. Werkt het nog niet? Laat via de klantendienst op 015666666 weten in welke stap, de foutmelding en eventueel andere relevante informatie.
)
clipboard := StringPIDInvite
return
}

CopyInviteFR()
{
global
Gui, Submit, NoHide
StringPIDInvite = 
(
Telenet-info: Nous avons envoyé à votre adresse e-mail %EMAILINV% une nouvelle invitation à compléter votre login. Cela ne fonctionne toujours pas? Veuillez nous informer via le service clientèle à l'adresse 0486191999 de l'étape, du message d'erreur et de toute autre information pertinente.
)
clipboard := StringPIDInvite
return
}

CopyInviteEN()
{
global
Gui, Submit, NoHide
StringPIDInvite = 
(
Telenet-info: We have sent to your e-mail address %EMAILINV% a new invitation to complete your login. Still not working? Please let us know via customer service at 0486191999 in which step, the error message and any other relevant information.
)
clipboard := StringPIDInvite
return
}

ResetInt()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, PASSWORD RESET
Gui, add, Text,, 
Gui, add, Text,, NEW PASSWORD
Gui, Add, Edit, vPassword,
Gui, Add, Button, gCopyReset, COPY NL
Gui, Add, Button, gCopyResetFR, COPY FR
Gui, Add, Button, gCopyResetEN, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetResInt, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyReset()
{
global
Gui, Submit, NoHide
Stringresetwachtwoord = 
(
Telenet-info: Uw nieuw wachtwoord is: %Wachtwoord%
)
clipboard := Stringresetwachtwoord
return
}

CopyResetFR()
{
global
Gui, Submit, NoHide
Stringresetwachtwoord = 
(
Telenet-info: Votre nouveau mot de passe est : %Wachtwoord%
)
clipboard := Stringresetwachtwoord
return
}

CopyResetEN()
{
global
Gui, Submit, NoHide
Stringresetwachtwoord = 
(
Telenet-info: Your new password is: %Wachtwoord%
)
clipboard := Stringresetwachtwoord
return
}

EmailProgramma(){
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, DISAPPEARED MAILS DUE MAIL PROGRAM
Gui, add, Text,, 
Gui, Add, Button, gCopyEmailProgramma, COPY NL
Gui, Add, Button, gCopyEmailProgrammaFR, COPY FR
Gui, Add, Button, gCopyEmailProgrammaEN, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetResInt, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyEmailProgramma()
{
Gui, Submit, NoHide
Stringemailprogrammas = 
(
Telenet-info: We kunnen geen fout vaststellen op Webmail. Gelieve de instellingen van uw mailclient te controleren. meer info: https://tinyurl.com/y239bd2s
)

clipboard := Stringemailprogrammas
return
}

CopyEmailProgrammaFR()
{
Gui, Submit, NoHide
Stringemailprogrammas = 
(
Telenet-info: Nous ne pouvons pas detecter d'erreur sur le Webmail. Veuillez verifier les parametres de votre client de messagerie. Plus d'infos: https://tinyurl.com/y239bd2s
)

clipboard := Stringemailprogrammas
return
}

CopyEmailProgrammaEN()
{
Gui, Submit, NoHide
Stringemailprogrammas = 
(
Telenet-info: We cannot detect any issues for Webmail on our end. Please check the settings of your mail client. For more info: https://tinyurl.com/y239bd2s
)

clipboard := Stringemailprogrammas
return
}

; SMS TELENET RESIDENTIAL DTV

SmsTelenetResDTV()
{
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET RESIDENTIAL SMS DTV
Gui, Add, Text,, 
Gui, Add, Button, gZenderPakketActivatie, ENTERTAINMENT PACK ACTIVE
Gui, Add, Button, gTvBoxActivate, EOS ACTIVE
Gui, Add, Button, gDigicorder, SIPADAN ACTIVE
Gui, Add, Button, gCIKaart, CI+ ACTIVE
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetResBB, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

ZenderPakketActivatie()
{
global
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, ENTERTAINMENT PACK
Gui, Add, Edit, vZenderpakket, 
Gui, Add, Button, gCopyZenderPakketActivatie, COPY NL
Gui, Add, Button, gCopyZenderPakketActivatieFR, COPY FR
Gui, Add, Button, gCopyZenderPakketActivatieEN, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetResDTV, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyZenderPakketActivatie()
{
global
Gui, Submit, NoHide
Stringzndrpakket = 
(
Telenet-info: Uw zenderpakket %Zenderpakket% is succesvol geactiveerd. Dit is gebruiksklaar binnen 60 minuten.
)
clipboard := Stringzndrpakket
return
}

CopyZenderPakketActivatieFR()
{
global
Gui, Submit, NoHide
Stringzndrpakket = 
(
Telenet-info: Votre bouquet de chaînes %Zenderpakket% a ete active avec succes. Ceci est pret à l’emploi dans les 60 minutes.
)
clipboard := Stringzndrpakket
return
}

CopyZenderPakketActivatieEN()
{
global
Gui, Submit, NoHide
Stringzndrpakket = 
(
Telenet-info: Your channel package %Zenderpakket% has been successfully activated and is ready to use within 60 minutes.
)
clipboard := Stringzndrpakket
return
}

TvBoxActivate()
{
global
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, SERIAL NUMBER EOS
Gui, Add, Edit, vSerienr, 
Gui, Add, Button, gCopyTvBoxActivate, COPY NL
Gui, Add, Button, gCopyTvBoxActivateFR, COPY FR
Gui, Add, Button, gCopyTvBoxActivateEN, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetResDTV, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyTvBoxActivate()
{
global
Gui, Submit, NoHide
Stringtvbox = 
(
Telenet-info: Uw nieuwe TV-Box %Serienr% werd geactiveerd. Binnen 30 minuten kan u gebruik maken van uw diensten.
)
clipboard := Stringtvbox
return
}

CopyTvBoxActivateFR()
{
global
Gui, Submit, NoHide
Stringtvbox = 
(
Telenet-info: Votre nouvelle TV-Box %Serienr% a ete activee. Vous pouvez utiliser vos services dans les 30 minutes.
)
clipboard := Stringtvbox
return
}

CopyTvBoxActivateEN()
{
global
Gui, Submit, NoHide
Stringtvbox = 
(
Telenet-info: Your new TV-Box %Serienr% has been activated. You can use your services within 30 minutes.
)
clipboard := Stringtvbox
return
}

Digicorder(){
global
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, SERIAL NUMBER SPDN
Gui, Add, Edit, vSerienr, 
Gui, Add, Button, gCopygDigicorder, COPY NL
Gui, Add, Button, gCopygDigicorderFR, COPY FR
Gui, Add, Button, gCopygDigicorderEN, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetResDTV, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopygDigicorder()
{
global
Gui, Submit, NoHide
Stringtvbox = 
(
Telenet-info: Uw nieuwe Digicorder/Digibox %Serienr% werd geactiveerd. Binnen 30 minuten kan u gebruik maken van uw diensten.
)
clipboard := Stringtvbox
return
}

CopygDigicorderFR()
{
global
Gui, Submit, NoHide
Stringtvbox = 
(
Telenet-info: Votre nouveau Digicorder/Digibox %Serienr% a ete active. Vous pouvez utiliser vos services dans les 30 minutes.
)
clipboard := Stringtvbox
return
}

CopygDigicorderEN()
{
global
Gui, Submit, NoHide
Stringtvbox = 
(
Telenet-info: Your new Digicorder/Digibox %Serienr% has been activated. You can use your services within 30 minutes.
)
clipboard := Stringtvbox
return
}

CIKaart()
{
global
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, SERIAL NUMBER CI+
Gui, Add, Edit, vSerienr, 
Gui, Add, Button, gCopyCIKaart, COPY NL
Gui, Add, Button, gCopyCIKaartFR, COPY FR
Gui, Add, Button, gCopyCIKaartEN, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetResDTV, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyCIKaart()
{
global
Gui, Submit, NoHide
Stringtvbox = 
(
Telenet-info: Uw nieuwe CI+ kaart %Serienr% werd geactiveerd. Binnen 30 minuten kan u gebruik maken van uw diensten.
)
clipboard := Stringtvbox
return
}

CopyCIKaartFR()
{
global
Gui, Submit, NoHide
Stringtvbox = 
(
Telenet-info: Votre nouveau CI+ %Serienr% a ete active. Vous pouvez utiliser vos services dans les 30 minutes.
)
clipboard := Stringtvbox
return
}

CopyCIKaartEN()
{
global
Gui, Submit, NoHide
Stringtvbox = 
(
Telenet-info: Your new CI+ card %Serienr% has been activated. You can use your services within 30 minutes.
)
clipboard := Stringtvbox
return
}

; SMS TELENET RESIDENTIAL FIXED

SmsTelenetResFixed()
{
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET RESIDENTIAL SMS FIXED LINE
Gui, Add, Text,, 
Gui, Add, Button, gTelefoonActief, FIXED LINE ACTIVE
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetResBB, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

TelefoonActief()
{
global
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, PHONE NUMBER
Gui, Add, Edit, vTelefoonnummer, 
Gui, Add, Button, gCopyTelefoonActief, COPY NL
Gui, Add, Button, gCopyTelefoonActiefFR, COPY FR
Gui, Add, Button, gCopyTelefoonActiefEN, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetResFixed, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyTelefoonActief()
{
global
Gui, Submit, NoHide
Stringtelefoonnr = 
(
Telenet-info: Uw vaste lijn %Telefoonnummer% is succesvol geactiveerd. U kan deze gebruiken binnen de 30 minuten.
)
clipboard := Stringtelefoonnr
return
}

CopyTelefoonActiefFR()
{
global
Gui, Submit, NoHide
Stringtelefoonnr = 
(
Telenet-info: Votre %Telefoonnummer% fixe a ete active avec succes. Vous pouvez l'utiliser dans les 30 minutes.
)
clipboard := Stringtelefoonnr
return
}

CopyTelefoonActiefEN()
{
global
Gui, Submit, NoHide
Stringtelefoonnr = 
(
Telenet-info: Your landline %Telefoonnummer% has been successfully activated. You can use it within 30 minutes.
)
clipboard := Stringtelefoonnr
return
}

; SMS TELENET RESIDENTIAL MOBILE

SmsTelenetResMob()
{
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET RESIDENTIAL SMS MOBILE
Gui, Add, Text,, 
Gui, Add, Button, gIssueFixedTLN, ISSUE FIXED
Gui, Add, Button, gSystemOKTLN, SYSTEM OK, CHECK DEVICE
Gui, Add, Button, gSimTLNRes, SIM ACTIVATION
Gui, Add, Button, gCallBackMenuTLN, CALLBACK
Gui, Add, Button, gSMSMnpRejectTLN, MNP
Gui, Add, Button, gItTicketSmsTLN, IT TICKET
Gui, Add, Button, gCrosstestMenuSmsTLN, CROSSTEST
Gui, Add, Button, gVowifiMenuTLN, VOICE2.0
Gui, Add, Button, gCoverageTLN, COVERAGE
Gui, Add, Button, gEsimTLN, ESIM / ONE NUMBER
Gui, Add, Button, gRoutingOLOTLN, ROUTING OLO OK
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetRes, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

; ISSUE FIXED

IssueFixedTLN()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET SMS ISSUE FIXED
Gui, Add, Text,, 
Gui, add, Text,, PEGA SC-ID
Gui, Add, Edit, vScid, 
Gui, Add, Text,, ISSUE (Short)
Gui, Add, Edit, vProblemshort
Gui, Add, Text,, 
Gui, Add, Button, gCopyIssueFixedTLNNL, COPY NL
Gui, Add, Button, gCopyIssueFixedTLNFR, COPY FR
Gui, Add, Button, gCopyIssueFixedTLNEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetResMob, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyIssueFixedTLNNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Uw dossier (%Scid%) over %Problemshort% werd opgevolgd. Gelieve uw toestel te herstarten.
)
clipboard := Stringmob
return
}

CopyIssueFixedTLNFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Votre dossier (%Scid%) concernant %Problemshort% a été suivi. Veuillez redémarrer votre appareil.
)
clipboard := Stringmob
return
}

CopyIssueFixedTLNEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Your case (%Scid%) related to %Problemshort% was followed up. Please restart your device.
)
clipboard := Stringmob
return
}

; SYSTEM OK CHECK DEVICE

SystemOKTLN()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET SMS SYSTEM OK
Gui, Add, Text,, 
Gui, add, Text,, PEGA SC-ID
Gui, Add, Edit, vScid, 
Gui, Add, Text,, ISSUE (Short)
Gui, Add, Edit, vProblemshort
Gui, Add, Text,, 
Gui, Add, Button, gCopySystemOKTLNNL, COPY NL
Gui, Add, Button, gCopySystemOKTLNFR, COPY FR
Gui, Add, Button, gCopySystemOKTLNEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetResMob, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopySystemOKTLNNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: In verband met uw dossier (%Scid%) over %Problemshort%. Bij nazicht in onze systemen staat alles juist. Gelieve uw instellingen na te kijken en uw toestel te herstarten.
)
clipboard := Stringmob
return
}

CopySystemOKTLNFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Concernant votre dossier (%Scid%) sur %Problemshort%. Après examen dans nos systèmes, tout est correct. Veuillez vérifier vos paramètres et redémarrer votre appareil.
)
clipboard := Stringmob
return
}

CopySystemOKTLNEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Regarding your case (%Scid%) on %Problemshort%. When checking in our systems, everything is correct. Please check your settings and reboot your device.
)
clipboard := Stringmob
return
}

; SIM ACTIVATION

SimTLNRes()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET SMS SIM ACTIVE
Gui, Add, Text,, 
Gui, Add, Button, gMobSimTLNRes, MOBILE SIM
Gui, Add, Button, gDataSimTLNRes, DATA SIM
Gui, Add, Button, gInfoSimTLNRes, INFO SIMCARD NUMBER
Gui, Add, Button, gDocumentTLNRes, NO DOCUMENT
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetResMob, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

DocumentTLNRes()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET SMS NO DOCUMENT
Gui, Add, Text,, 
Gui, Add, Button, gCopyDocumentTLNResNL, COPY NL
Gui, Add, Button, gCopyDocumentTLNResFR, COPY FR
Gui, Add, Button, gCopyDocumentTLNResEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gSimTLNRes, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyDocumentTLNResNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Om de activatie van uw mobiel nummer op te starten, ontbreken de nodige documenten. Mogen wij u vragen hiervoor langs te gaan in uw dichtstbijzijnde Telenet-winkelpunt. Alvast bedankt.
)
clipboard := Stringmob
return
}

CopyDocumentTLNResFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Pour commencer l'activation de votre numéro de GSM, il manque les documents nécessaires. Nous vous prions de vous rendre dans le magasin Telenet le plus proche. Merci.
)
clipboard := Stringmob
return
}

CopyDocumentTLNResEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: To start the activation of your mobile number, the necessary documents are missing. May we ask you to go to your nearest Telenet shop for this. Thanks.
)
clipboard := Stringmob
return
}

InfoSimTLNRes()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET SMS INFO SIMCARD NUMBER
Gui, Add, Text,, 
Gui, Add, Button, gCopyInfoSimActTLNResNL, COPY NL
Gui, Add, Button, gCopyInfoSimActTLNResFR, COPY FR
Gui, Add, Button, gCopyInfoSimActTLNResEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gSimTLNRes, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyInfoSimActTLNResNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Gelieve ons het SIM-kaartnummer van Telenet te bezorgen via 015666666 zodat wij uw mobiel nummer kunnen activeren.
)
clipboard := Stringmob
return
}

CopyInfoSimActTLNResFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Veuillez nous communiquer le numéro de la carte SIM de Telenet à l'adresse 015666666 afin que nous puissions activer votre numéro de téléphone mobile.
)
clipboard := Stringmob
return
}

CopyInfoSimActTLNResEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Please provide us with Telenet's SIM card number at 015666666 so that we can activate your mobile number.
)
clipboard := Stringmob
return
}

MobSimTLNRes()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET SMS MOBILE SIM
Gui, Add, Text,, 
Gui, Add, Button, gMobSimActTLNRes, MOB SIM ACTIVATED
Gui, Add, Button, gMobSimLinkTLNRes, MOB SIM ACTIVATE LINK
Gui, add, Text,, 
Gui, Add, Button, gSimTLNRes, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

MobSimActTLNRes()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET SMS MOB SIM ACTIVE
Gui, Add, Text,, 
Gui, add, Text,, MSISDN
Gui, Add, Edit, vMSISDN,
Gui, Add, Button, gCopyMobSimActTLNResNL, COPY NL
Gui, Add, Button, gCopyMobSimActTLNResFR, COPY FR
Gui, Add, Button, gCopyMobSimActTLNResEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gMobSimTLNRes, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyMobSimActTLNResNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: De activering van uw mobiel %MSISDN% is succesvol afgerond.
)
clipboard := Stringmob
return
}

CopyMobSimActTLNResFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: l'Activation de votre téléphone mobile %MSISDN% a été effectuée avec succès.
)
clipboard := Stringmob
return
}

CopyMobSimActTLNResEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: The activation of your mobile phone %MSISDN% has been completed successfully.
)
clipboard := Stringmob
return
}

MobSimLinkTLNRes()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET SMS MOB SIM ACTIVATE LINK
Gui, Add, Text,, 
Gui, add, Text,, MSISDN
Gui, Add, Edit, vMSISDN,
Gui, add, Text,, ORDER NUMBER
Gui, Add, Edit, vOrdernr,
Gui, Add, Button, gCopyMobSimLinkTLNResNL, COPY NL
Gui, Add, Button, gCopyMobSimLinkTLNResFR, COPY FR
Gui, Add, Button, gCopyMobSimLinkTLNResEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gMobSimTLNRes, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyMobSimLinkTLNResNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: De activering van %MSISDN% met bestelnummer %Ordernr% werd nog niet opgestart. Je kan deze activatie zelf starten via de activatielink: https://www2.telenet.be/activeermobiel of download, vul in en stuur onze het contract terug dat u kan terugvinden op 
)
clipboard := Stringmob
return
}

CopyMobSimLinkTLNResFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: L'activation de %MSISDN% avec numéro de commande %Ordernr% n'a pas encore été lancée. Vous pouvez démarrer cette activation vous-même via le lien d'activation: https://www2.telenet.be/activermobile
)
clipboard := Stringmob
return
}

CopyMobSimLinkTLNResEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: The activation of %MSISDN% with ordernumber %Ordernr% has not been started yet. You can start this activation yourself via the activation link: https://www2.telenet.be/activeermobiel
)
clipboard := Stringmob
return
}

DataSimTLNRes()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET SMS DATA SIM
Gui, Add, Text,, 
Gui, Add, Button, gDataSimActTLNRes, DATA SIM ACTIVATED
Gui, Add, Button, gDataSimLinkTLNRes, DATA SIM ACTIVATE LINK
Gui, add, Text,, 
Gui, Add, Button, gSimTLNRes, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

DataSimActTLNRes()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET SMS DATA SIM ACTIVE
Gui, Add, Text,, 
Gui, add, Text,, MSISDN
Gui, Add, Edit, vMSISDN,
Gui, Add, Button, gCopyDataSimActTLNResNL, COPY NL
Gui, Add, Button, gCopyDataSimActTLNResFR, COPY FR
Gui, Add, Button, gCopyDataSimActTLNResEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gDataSimTLNRes, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyDataSimActTLNResNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: De activering van uw DATA SIM %MSISDN% is succesvol afgerond.
)
clipboard := Stringmob
return
}

CopyDataSimActTLNResFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: l'Activation de votre SIM DATA %MSISDN% a été effectuée avec succès.
)
clipboard := Stringmob
return
}

CopyDataSimActTLNResEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: The activation of your DATA SIM %MSISDN% has been completed successfully.
)
clipboard := Stringmob
return
}

DataSimLinkTLNRes()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET SMS DATA SIM ACTIVATE LINK
Gui, Add, Text,, 
Gui, add, Text,, MSISDN
Gui, Add, Edit, vMSISDN,
Gui, add, Text,, ORDER NUMBER
Gui, Add, Edit, vOrdernr
Gui, Add, Button, gCopyDataSimLinkTLNResNL, COPY NL
Gui, Add, Button, gCopyDataSimLinkTLNResFR, COPY FR
Gui, Add, Button, gCopyDataSimLinkTLNResEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gDataSimTLNRes, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyDataSimLinkTLNResNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: De activering van %MSISDN% met bestelnummer %Ordernr% werd nog niet opgestart. Je kan deze activatie zelf starten via de activatielink: https://www2.telenet.be/activeermobiel
)
clipboard := Stringmob
return
}

CopyDataSimLinkTLNResFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: L'activation de %MSISDN% avec numéro de commande %Ordernr% n'a pas encore été lancée. Vous pouvez démarrer cette activation vous-même via le lien d'activation: https://www2.telenet.be/activermobile
)
clipboard := Stringmob
return
}

CopyDataSimLinkTLNResEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: The activation of %MSISDN% with ordernumber %Ordernr% has not been started yet. You can start this activation yourself via the activation link: https://www2.telenet.be/activeermobiel
)
clipboard := Stringmob
return
}

; CALLBACK MENU

CallbackMenuTLN()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET SMS CALLBACK
Gui, Add, Text,, 
Gui, Add, Button, gCallbackTLN, CALLBACK
Gui, Add, Button, gExamplesTLN, CALLBACK EXAMPLES CALLS
Gui, Add, Button, gExamplesSpeedTLN, CALLBACK EXAMPLES SPEEDTESTS
Gui, Add, Button, gCallbackReminderTLN, CALLBACK REMINDER
Gui, Add, Button, gCaseClosedTLN, CASE CLOSED
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetResMob, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

; CASE CLOSED

CaseClosedTLN()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET SMS CASE CLOSED
Gui, Add, Text,, 
Gui, add, Text,, PEGA SC-ID
Gui, Add, Edit, vScid, 
Gui, Add, Text,, ISSUE (Short)
Gui, Add, Edit, vProblemshort
Gui, Add, Button, gCopyCaseClosedTLNNL, COPY NL
Gui, Add, Button, gCopyCaseClosedTLNFR, COPY FR
Gui, Add, Button, gCopyCaseClosedTLNEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gCallbackMenuTLN, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyCaseClosedTLNNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Helaas ontvingen we geen feedback na meerdere contactpogingen en wordt hierbij het dossier (%Scid%) over %Problemshort% gesloten. Indien je toch nog hinder ondervindt, gelieve dit dan te laten weten aan de klantendienst met alle eerder gevraagde informatie.
)
clipboard := Stringmob
return
}

CopyCaseClosedTLNFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Malheureusement, nous n'avons reçu aucune réponse après plusieurs tentatives de contact et le dossier (%Scid%) concernant %Problemshort% est donc clôturé. Si vous continuez à subir des désagréments, veuillez en informer le service clientèle en lui communiquant toutes les informations demandées précédemment.
)
clipboard := Stringmob
return
}

CopyCaseClosedTLNEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Unfortunately, we did not receive any feedback after multiple contact attempts and the case (%Scid%) related to %Problemshort% is hereby closed. If you still experience inconvenience, please let customer service know with all previously requested information.
)
clipboard := Stringmob
return
}

; CALLBACK

CallbackTLN()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET SMS CALLBACK
Gui, Add, Text,, 
Gui, add, Text,, PEGA SC-ID
Gui, Add, Edit, vScid, 
Gui, Add, Text,, ISSUE (Short)
Gui, Add, Edit, vProblemshort
Gui, Add, Button, gCopyCallbackTLNNL, COPY NL
Gui, Add, Button, gCopyCallbackTLNFR, COPY FR
Gui, Add, Button, gCopyCallbackTLNEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gCallbackMenuTLN, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyCallbackTLNNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Gelieve ons te contacteren op het nummer 015666666 in verband met uw dossier (%Scid%) over %Problemshort%. Met vriendelijke groeten.
)
clipboard := Stringmob
return
}

CopyCallbackTLNFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Veuillez nous contacter au 015666666 sur le dossier (%Scid%) concernant %Problemshort%. Cordialement.
)
clipboard := Stringmob
return
}

CopyCallbackTLNEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Please contact us on 015666666 regarding case (%Scid%) related to %Problemshort%. Kind regards.
)
clipboard := Stringmob
return
}

; CALLBACK EXAMPLES

ExamplesTLN()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET SMS EXAMPLES CALLS
Gui, Add, Text,, 
Gui, add, Text,, PEGA SC-ID
Gui, Add, Edit, vScid, 
Gui, Add, Text,, ISSUE (Short)
Gui, Add, Edit, vProblemshort
Gui, Add, Button, gCopyExamplesTLNNL, COPY NL
Gui, Add, Button, gCopyExamplesTLNFR, COPY FR
Gui, Add, Button, gCopyExamplesTLNEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gCallbackMenuTLN, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyExamplesTLNNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Gelieve ons te contacteren op het nummer 015666666 in verband met uw dossier (%Scid%) over %Problemshort%. Indien je nog hinder ondervindt, gelieve dan recente voorbeelden te voorzien van de laatste drie dagen voor uw contact + startdatum van het probleem. Elk voorbeeld moet bevatten: locatie (volledig adres), datum, tijdstip, contactnr, probleemomschrijving per voorbeeld.
)
clipboard := Stringmob
return
}

CopyExamplesTLNFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Veuillez nous contacter au 015666666 sur le dossier (%Scid%) concernant %Problemshort%. Si vous rencontrez toujours des problèmes, veuillez fournir des exemples récents des trois derniers jours avant votre contact + la date de début du problème. Chaque exemples doit comprendre : le lieu (adresse complète), la date, l'heure, le numéro de contact, la description du problème par exemple.
)
clipboard := Stringmob
return
}

CopyExamplesTLNEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Please contact us on 015666666 regarding case (%Scid%) related to %Problemshort%. If you are still experiencing trouble, please provide recent examples from the last three days before your contact + start date of the problem. Each example should include: location (full address), date, time, contact no, problem description per example.
)
clipboard := Stringmob
return
}

; CALLBACK EXAMPLES SPEEDTESTS

ExamplesSpeedTLN()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET SMS EXAMPLES SPEEDTESTS
Gui, Add, Text,, 
Gui, add, Text,, PEGA SC-ID
Gui, Add, Edit, vScid, 
Gui, Add, Text,, ISSUE (Short)
Gui, Add, Edit, vProblemshort
Gui, Add, Button, gCopyExamplesSpeedTLNNL, COPY NL
Gui, Add, Button, gCopyExamplesSpeedTLNFR, COPY FR
Gui, Add, Button, gCopyExamplesSpeedTLNEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gCallbackMenuTLN, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyExamplesSpeedTLNNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Gelieve ons te contacteren op het nummer 015666666 in verband met uw dossier (%Scid%) over %Problemshort%. Indien je nog hinder ondervindt, gelieve dan recente voorbeelden te voorzien van de laatste drie dagen voor uw contact + startdatum van het probleem. Elk voorbeeld moet bevatten: locatie (volledig adres), datum, tijdstip, speedtest (speedtest.telenet.be), probleemomschrijving per voorbeeld.
)
clipboard := Stringmob
return
}

CopyExamplesSpeedTLNFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Veuillez nous contacter au 015666666 sur le dossier (%Scid%) concernant %Problemshort%. Si vous rencontrez toujours des problèmes, veuillez fournir des exemples récents des trois derniers jours avant votre contact + la date de début du problème. Chaque exemples doit comprendre : le lieu (adresse complète), la date, l'heure, speedtest (speedtest.telenet.be), la description du problème par exemple.
)
clipboard := Stringmob
return
}

CopyExamplesSpeedTLNEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Please contact us on 015666666 regarding case (%Scid%) related to %Problemshort%. If you are still experiencing trouble, please provide recent examples from the last three days before your contact + start date of the problem. Each example should include: location (full address), date, time, speedtest (speedtest.telenet.be), problem description per example.
)
clipboard := Stringmob
return
}

; CALLBACK EXAMPLES REMINDER

CallbackReminderTLN()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET SMS REMINDER
Gui, Add, Text,, 
Gui, add, Text,, PEGA SC-ID
Gui, Add, Edit, vScid, 
Gui, Add, Text,, ISSUE (Short)
Gui, Add, Edit, vProblemshort
Gui, Add, Button, gCopyCallbackReminderTLNNL, COPY NL
Gui, Add, Button, gCopyCallbackReminderTLNFR, COPY FR
Gui, Add, Button, gCopyCallbackReminderTLNEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gCallbackMenuTLN, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyCallbackReminderTLNNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Helaas ontvingen we nog geen feedback in verband met uw dossier (%Scid%) over %Problemshort%. Gelieve via 015666666 door te geven of u nog een probleem ervaart. Indien ja, gelieve dan alle eerder gevraagde informatie te voorzien. Opgelet: zonder feedback zal het dossier afgesloten worden.
)
clipboard := Stringmob
return
}

CopyCallbackReminderTLNFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Malheureusement, nous n'avons pas encore reçu de retour d'information sur votre dossier (%Scid%) concernant %Problemshort%. Veuillez nous informer par l'intermédiaire de 015666666 si le problème persiste. Si c'est le cas, veuillez fournir toutes les informations demandées précédemment. Attention: sans retour d'information, le dossier sera clôturé.
)
clipboard := Stringmob
return
}

CopyCallbackReminderTLNEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Unfortunately, we did not yet receive any feedback regarding your case (%Scid%) related to %Problemshort%. Please let us know via 015666666 if you are still experiencing a problem. If so, please provide all previously requested information. Please note: without feedback, the file will be closed.
)
clipboard := Stringmob
return
}

; MNP REJECT MENU

SMSMnpRejectTLN()
{
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET SMS MNP
Gui, Add, Text,, 
Gui, Add, Button, gNoInfoMNPTLNRes, NO REQUEST - NO INFO
Gui, Add, Button, gReject100MenuTLNRes, REJECTCODE 100 (Not Active)
Gui, Add, Button, gReject115TLNRes, REJECTCODE 115 (Mismatch Simcardnr OLO)
Gui, Add, Button, gReject120TLNRes, REJECTCODE 120 (Mismatch Customernr OLO)
Gui, Add, Button, gMNPCancelTLNRes, MNP CANCEL
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetResMob, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

; NO INFO MNP

NoInfoMNPTLNRes()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET NO REQUEST - NO INFO
Gui, Add, Text,, 
Gui, add, Text,, MSISDN
Gui, Add, Edit, vMSISDN,
Gui, Add, Button, gCopyNoInfoMNPTLNResNL, COPY NL
Gui, Add, Button, gCopyNoInfoMNPTLNResFR, COPY FR
Gui, Add, Button, gCopyNoInfoMNPTLNResEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gSMSMnpRejectTLN, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyNoInfoMNPTLNResNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: We hebben de overname van uw GSM %MSISDN% nog niet kunnen opstarten omdat er een aantal gegevens ontbreken. Gelieve ons het klant- en simkaartnummer van uw huidige provider te bezorgen via 015666666 of https://www.telenet.be/nummeroverdracht.
)
clipboard := Stringmob
return
}

CopyNoInfoMNPTLNResFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Nous n'avons pas encore pu lancer la reprise de votre GSM %MSISDN% car certaines informations sont manquantes. Veuillez nous communiquer le numéro de client et de carte SIM de votre fournisseur actuel via 015666666 ou https://www.telenet.be/nummeroverdracht.
)
clipboard := Stringmob
return
}

CopyNoInfoMNPTLNResEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: We have not yet been able to initiate the transfer of your GSM %MSISDN% due to missing information. Please send us the customer number and SIM card number of your current operator via 015666666 or https://www.telenet.be/nummeroverdracht.
)
clipboard := Stringmob
return
}

; MNP 100 MENU

Reject100MenuTLNRes()
{
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET SMS MNP REJECT
Gui, Add, Text,, 
Gui, Add, Button, gReject100ProxTLNRes, NOT ACTIVE - PROXIMUS
Gui, Add, Button, gReject100OtherTLNRes, NOT ACTIVE - OTHER OLO
Gui, add, Text,, 
Gui, Add, Button, gSMSMnpRejectTLN, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

; MNP 100 PROX

Reject100ProxTLNRes()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET REJECTCODE 100 - PROXIMUS
Gui, Add, Text,, 
Gui, add, Text,, MSISDN
Gui, Add, Edit, vMSISDN,
Gui, Add, Button, gCopyReject100ProxTLNResNL, COPY NL
Gui, Add, Button, gCopyReject100ProxTLNResFR, COPY FR
Gui, Add, Button, gCopyReject100ProxTLNResEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gReject100MenuTLNRes, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyReject100ProxTLNResNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Gelieve met GSM %MSISDN% naar het gratis nummer 080066778 te bellen om deze op uw netwerk te heractiveren. Zo kunnen wij deze overdragen naar Telenet.
)
clipboard := Stringmob
return
}

CopyReject100ProxTLNResFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Veuillez appeler le numéro gratuit 080066778 avec numéro %MSISDN% pour le réactiver sur votre réseau. Ainsi, nous pouvons le transférer à Telenet.
)
clipboard := Stringmob
return
}

CopyReject100ProxTLNResEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Please call freephone 080066778 with mobile phone %MSISDN% to reactivate it on your network. This will allow us to transfer it to Telenet.
)
clipboard := Stringmob
return
}

; MNP 100 OTHER

Reject100OtherTLNRes()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET REJECTCODE 100 - OTHER OLO
Gui, Add, Text,, 
Gui, add, Text,, MSISDN
Gui, Add, Edit, vMSISDN,
Gui, Add, Button, gCopyReject100OtherTLNResNL, COPY NL
Gui, Add, Button, gCopyReject100OtherTLNResFR, COPY FR
Gui, Add, Button, gCopyReject100OtherTLNResEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gReject100MenuTLNRes, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyReject100OtherTLNResNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Gelieve contact op te nemen met uw huidige operator om uw nummer %MSISDN% te heractiveren. Op die manier kunnen wij uw portering naar Telenet voltooien.
)
clipboard := Stringmob
return
}

CopyReject100OtherTLNResFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Veuillez contacter votre opérateur actuel pour réactiver votre numéro %MSISDN%. Cela nous permettra de finaliser votre portage vers Telenet.
)
clipboard := Stringmob
return
}

CopyReject100OtherTLNResEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Please contact your current operator to reactivate your number %MSISDN%. This will allow us to complete your porting to Telenet.
)
clipboard := Stringmob
return
}

; MNP 115

Reject115TLNRes()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET REJECTCODE 115
Gui, Add, Text,, 
Gui, Add, Text,, OLO SIM CARDNUMBER
Gui, Add, Edit, vSIMOLO,
Gui, Add, Button, gCopyReject115TLNResNL, COPY NL
Gui, Add, Button, gCopyReject115TLNResFR, COPY FR
Gui, Add, Button, gCopyReject115TLNResEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gSMSMnpRejectTLN, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyReject115TLNResNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: We hebben een aanvraag gestart met SIM-kaartnummer %SIMOLO% van uw huidige provider. Deze is helaas geweigerd. Gelieve ons het correcte SIM-kaartnummer van uw huidige operator te bezorgen via https://www.telenet.be/nummeroverdracht of telefonisch op 015666666.
)
clipboard := Stringmob
return
}

CopyReject115TLNResFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Nous avons lancé une demande avec le numéro de carte SIM %SIMOLO% de votre fournisseur actuel. Elle a malheureusement été refusée. Veuillez nous communiquer le numéro de carte SIM correct de votre opérateur actuel à l'adresse https://www.telenet.be/nummeroverdracht ou par téléphone à l'adresse 015666666.
)
clipboard := Stringmob
return
}

CopyReject115TLNResEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: We have started a request with SIM card number %SIMOLO% from your current provider. This has unfortunately been refused. Please provide us with the correct SIM card number of your current operator at https://www.telenet.be/nummeroverdracht or by phone at 015666666.
)
clipboard := Stringmob
return
}

; MNP 120

Reject120TLNRes()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET REJECTCODE 120
Gui, Add, Text,, 
Gui, Add, Text,, OLO CUSTOMER NUMBER
Gui, Add, Edit, vCMRNROLO,
Gui, Add, Button, gCopyReject120TLNResNL, COPY NL
Gui, Add, Button, gCopyReject120TLNResFR, COPY FR
Gui, Add, Button, gCopyReject120TLNResEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gSMSMnpRejectTLN, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyReject120TLNResNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: We hebben een aanvraag gestart met klantnummer %CMRNROLO% van uw huidige provider. Deze is helaas geweigerd. Gelieve ons het correcte klantnummer van uw huidige operator te bezorgen via https://www.telenet.be/nummeroverdracht of telefonisch op 015666666.
)
clipboard := Stringmob
return
}

CopyReject120TLNResFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Nous avons lancé une demande avec le numéro de client %CMRNROLO% de votre fournisseur actuel. Elle a malheureusement été refusée. Veuillez nous communiquer le numéro de client correct de votre opérateur actuel à l'adresse https://www.telenet.be/nummeroverdracht ou par téléphone à l'adresse 015666666.
)
clipboard := Stringmob
return
}

CopyReject120TLNResEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: We have started a request with customer number %CMRNROLO% from your current provider. This has unfortunately been refused. Please provide us with the correct customer number of your current operator at https://www.telenet.be/nummeroverdracht or by phone at 015666666.
)
clipboard := Stringmob
return
}


; MNP CANCEL

MNPCancelTLNRes()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET MNP CANCEL
Gui, Add, Text,, 
Gui, Add, Text,, MSISDN
Gui, Add, Edit, vMSISDN,
Gui, Add, Button, gCopyMNPCancelTLNResNL, COPY NL
Gui, Add, Button, gCopyMNPCancelTLNResFR, COPY FR
Gui, Add, Button, gCopyMNPCancelTLNResEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gSMSMnpRejectTLN, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyMNPCancelTLNResNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Helaas kregen we niet voldoende informatie om je nummeroverdracht voor het nummer %MSISDN% af te ronden. Deze werd daarom geannuleerd. Een nieuwe registratie is mogelijk via onze website, een winkelpunt of onze klantendienst.
)
clipboard := Stringmob
return
}

CopyMNPCancelTLNResFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Malheureusement, nous n'avons pas reçu suffisamment d'informations pour effectuer votre transfert de numéro pour le numéro %MSISDN%. Celui-ci a donc été annulé. Un nouvel enregistrement est possible via notre site web, un point de vente ou notre service clientèle.
)
clipboard := Stringmob
return
}

CopyMNPCancelTLNResEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Unfortunately, we did not receive sufficient information to complete your number transfer for the number %MSISDN%. This was therefore cancelled. A new registration is possible via our website, a retail outlet or our customer service.
)
clipboard := Stringmob
return
}

; IT TICKET MENU

ItTicketSmsTLN()
{
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET SMS IT TICKET
Gui, Add, Text,, 
Gui, Add, Button, gItNewResNL, NEW TICKET
Gui, Add, Button, gItUpdateResNL, UPDATE TICKET
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetResMob, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

; IT TICKET NEW

ItNewResNL()
{
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET SMS NEW TICKET
Gui, Add, Text,, 
Gui, Add, Button, gCopyItResNL, COPY NL
Gui, Add, Button, gCopyItResFR, COPY FR
Gui, Add, Button, gCopyItResEN, COPY EN
Gui, add, Text,,
Gui, add, Button, gItUpdateResNL, UPDATE IT
Gui, add, Text,, 
Gui, Add, Button, gItTicketSmsTLN, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyItResNL()
{
Stringit =
(
Telenet-info: We hebben je dossier doorgestuurd naar onze IT-dienst en houden je op de hoogte. Bedankt voor uw geduld.
)
clipboard := Stringit
return
}

CopyItResFR()
{
Stringit =
(
Telenet-info: Nous avons transmis votre dossier à notre département IT et vous tiendrons au courant. Nous vous remercions de votre patience.
)
clipboard := Stringit
return
}

CopyItResEN()
{
Stringit =
(
Telenet-info: We have forwarded your case to our IT department and will keep you updated. Thank you for your patience.
)
clipboard := Stringit
return
}

; IT TICKET UPDATE

ItUpdateResNL()
{
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET SMS UPDATE TICKET
Gui, Add, Text,, 
Gui, Add, Button, gCopyItUpdateResNL, COPY NL
Gui, Add, Button, gCopyItUpdateResFR, COPY FR
Gui, Add, Button, gCopyItUpdateResEN, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gItTicketSmsTLN, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyItUpdateResNL()
{
Stringitupdate =
(
Telenet-info: Momenteel hebben we nog geen oplossing voor uw dossier. Onze IT-dienst werkt eraan. Bedankt voor uw geduld.
)
clipboard := Stringitupdate
return
}

CopyItUpdateResFR()
{
Stringitupdate =
(
Telenet-info: Actuellement, nous n'avons pas encore de solution pour votre dossier. Notre département IT y travaille. Nous vous remercions de votre patience.
)
clipboard := Stringitupdate
return
}

CopyItUpdateResEN()
{
Stringitupdate =
(
Telenet-info: Currently, we do not yet have a solution for your case. Our IT department is working on it. Thank you for your patience.
)
clipboard := Stringitupdate
return
}

; CROSSTEST MENU

CrosstestMenuSmsTLN()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET SMS CROSSTTEST
Gui, Add, Text,, 
Gui, Add, Button, gCrosstestTLN, CROSSTEST
Gui, Add, Button, gCrossReminderTLN, REMINDER CROSSTEST
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetResMob, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

; CROSSTEST NEW

CrosstestTLN()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET SMS CROSSTEST
Gui, Add, Text,, 
Gui, add, Text,, PEGA SC-ID
Gui, Add, Edit, vScid, 
Gui, Add, Text,, ISSUE (Short)
Gui, Add, Edit, vProblemshort
Gui, Add, Button, gCopyCrosstestTLNNL, COPY NL
Gui, Add, Button, gCopyCrosstestTLNFR, COPY FR
Gui, Add, Button, gCopyCrosstestTLNEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gCrosstestMenuSmsTLN, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyCrosstestTLNNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: In verband met uw dossier (%Scid%) over %Problemshort%. Gelieve opnieuw te testen met uw SIM in een ander toestel en via de klantendienst (015666666) door te geven of u nog een probleem ervaart. Indien ja, gelieve dan recente voorbeelden te voorzien. Elk voorbeeld moet bevatten: datum, tijdstip, contactnr, locatie (volledig adres) en probleemomschrijving per voorbeeld.
)
clipboard := Stringmob
return
}

CopyCrosstestTLNFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Sur votre dossier (%Scid%) concernant %Problemshort%. Veuillez refaire un test avec votre carte SIM dans un autre appareil et faites-nous savoir par l'intermédiaire du service clientèle (015666666) si le problème persiste. Si oui, veuillez fournir des exemples récents. Chaque exemple doit inclure: la date, l'heure, le numéro de contact, le lieu (adresse complète) et la description du problème par exemple.
)
clipboard := Stringmob
return
}

CopyCrosstestTLNEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Regarding your case (%Scid%) related to %Problemshort%. Please retest with your SIM in another device and let us know via customer service (015666666) if you are still experiencing a problem. If yes, please provide recent examples. Each example should include: date, time, contact no, location (full address) and problem description per example.
)
clipboard := Stringmob
return
}

; CROSSTEST REMINDER

CrossReminderTLN()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET SMS CROSSTEST REMINDER
Gui, Add, Text,, 
Gui, Add, Button, gCopyCrossReminderTLNNL, COPY NL
Gui, Add, Button, gCopyCrossReminderTLNFR, COPY FR
Gui, Add, Button, gCopyCrossReminderTLNEN, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gCrosstestMenuSmsTLN, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyCrossReminderTLNNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Gelieve via de klantendienst (015666666) door te geven of u nog een probleem heeft ervaren toen u uw simkaart testte in een ander toestel. Indien ja, gelieve dan recente voorbeelden te voorzien. Elk voorbeeld moet bevatten: datum, tijdstip, contactnr, locatie (volledig adres) en probleemomschrijving per voorbeeld.
)
clipboard := Stringmob
return
}

CopyCrossReminderTLNFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Veuillez nous faire savoir par l'intermédiaire du service clientèle (015666666) si vous avez rencontré un autre problème lorsque vous avez testé votre carte SIM dans un autre appareil. Dans l'affirmative, veuillez fournir des exemples récents. Chaque exemple doit comprendre: la date, l'heure, le numéro de contact, le lieu (adresse complète) et la description du problème par exemple.
)
clipboard := Stringmob
return
}

CopyCrossReminderTLNEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Please let us know via customer service (015666666) if you have experienced another problem when you tested your SIM card in another device. If yes, please provide recent examples. Each example should include: date, time, contact no, location (full address) and problem description per example.
)
clipboard := Stringmob
return
}

; VOICE2.0 MENU

VowifiMenuTLN()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET SMS VOICE2.0
Gui, Add, Text,, 
Gui, Add, Button, gVowifiActiveTLN, ACTIVE / CERTIFIED
Gui, Add, Button, gVowifiDeviceTLN, DEVICE NOK
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetResMob, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

; VOICE2.0 ACTIVE

VowifiActiveTLN()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET SMS VOICE2.0
Gui, Add, Text,, 
Gui, Add, Button, gCopyVowifiTLNResNL, COPY NL
Gui, Add, Button, gCopyVowifiTLNResFR, COPY FR
Gui, Add, Button, gCopyVowifiTLNResEN, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetRes, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyVowifiTLNResNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Bellen over 4G (VoLTE) en bellen over WiFi (VoWiFi) werd voor u geactiveerd op het netwerk. Gelieve na te kijken dat op uw toestel de laatste updates van de fabrikant geinstalleerd zijn. Activeer Voice over WiFi via de instellingen en herstart hierna uw toestel. Meer info: https://www2.telenet.be/business/nl/klantenservice/mobiele-telefonie/mobiel-instellen-en-gebruiken/mobiel-bellen-en-surfen-via-4g
)
clipboard := Stringmob
return
}

CopyVowifiTLNResFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: les appels sur la 4G (VoLTE) et les appels sur le WiFi (VoWiFi) ont été activés pour vous sur le réseau. Veuillez vérifier que les dernières mises à jour du fabricant sont installées sur votre appareil. Activez Voice over WiFi via les paramètres et redémarrez ensuite votre appareil. https://www2.telenet.be/business/fr/serviceclient/telephonie-mobile/configurer-et-utiliser-le-mobile/appels-et-navigation-mobiles-via-la-4G/
)
clipboard := Stringmob
return
}

CopyVowifiTLNResEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Calling over 4G (VoLTE) and calling over WiFi (VoWiFi) has been activated for you on the network. Please check that the latest manufacturer updates are installed on your device. Activate Voice over WiFi via the settings and then reboot your device. Info: https://www2.telenet.be/business/nl/klantenservice/mobiele-telefonie/mobiel-instellen-en-gebruiken/mobiel-bellen-en-surfen-via-4g
)
clipboard := Stringmob
return
}

; VOICE2.0 DEVICE NOK

VowifiDeviceTLN()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET SMS VOICE2.0
Gui, Add, Text,, 
Gui, Add, Button, gCopyVowifiDeviceTLNResNL, COPY NL
Gui, Add, Button, gCopyVowifiDeviceTLNResFR, COPY FR
Gui, Add, Button, gCopyVowifiDeviceTLNResEN, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gVowifiMenuTLN, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyVowifiDeviceTLNResNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Helaas is uw huidige toestel (nog) niet compatibel met VoLTE (voice over LTE) en VoWiFi (voice over WiFi). Meer info op: https://www2.telenet.be/nl/business/klantenservice/hoe-mobiel-bellen-via-4g-en-wifi1/
)
clipboard := Stringmob
return
}

CopyVowifiDeviceTLNResFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Malheureusement, votre appareil actuel n'est pas (encore) compatible avec VoLTE (voice over LTE) et VoWiFi (voice over WiFi). Plus d'informations : https://www2.telenet.be/fr/business/serviceclient/hoe-mobiel-bellen-via-4g-en-wifi/
)
clipboard := Stringmob
return
}

CopyVowifiDeviceTLNResEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Unfortunately, your current device is not (yet) compatible with VoLTE (voice over LTE) and VoWiFi (voice over WiFi). More info at: https://www2.telenet.be/nl/business/klantenservice/hoe-mobiel-bellen-via-4g-en-wifi/
)
clipboard := Stringmob
return
}

; COVERAGE MENU

CoverageTLN()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET SMS COVERAGE
Gui, Add, Text,, 
Gui, Add, Button, gIncidentTLN, ONGOING INCIDENT (GIS)
Gui, Add, Button, gOneTTLN, ONE-T CHANGE
Gui, Add, Button, gOneTReminderTLN, REMINDER ONE-T CHANGE
Gui, Add, Button, gNoCoverageTLN, NO COVERAGE
Gui, Add, Button, gDegradationTLN, DEGRADATION
Gui, Add, Button, gRoamingTLN, ROAMING
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetResMob, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

; ONGOING INCIDENT

IncidentTLN()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET SMS ONGOING INCIDENT
Gui, Add, Text,, 
Gui, Add, Button, gCopyIncidentTLNNL, COPY NL
Gui, Add, Button, gCopyIncidentTLNFR, COPY FR
Gui, Add, Button, gCopyIncidentTLNEN, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gCoverageTLN, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyIncidentTLNNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Er is momenteel een probleem vastgesteld op de zendmast in uw regio. We doen er alles aan om dit probleem zo snel mogelijk op te lossen. Onze exuses voor het ongemak.
)
clipboard := Stringmob
return
}

CopyIncidentTLNFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Un problème a été identifié sur le mât de transmission dans votre région. Nous mettons tout en œuvre pour résoudre ce problème dans les plus brefs délais. Nous vous prions de nous excuser pour la gêne occasionnée.
)
clipboard := Stringmob
return
}

CopyIncidentTLNEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: A problem has currently been identified on the transmission mast in your area. We are making every effort to solve this problem as soon as possible. Our apologies for the inconvenience.
)
clipboard := Stringmob
return
}

; ONE T CHANGE

OneTTLN()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET SMS ONE-T CHANGE
Gui, Add, Text,, 
Gui, Add, Button, gCopyOneTTLNNL, COPY NL
Gui, Add, Button, gCopyOneTTLNFR, COPY FR
Gui, Add, Button, gCopyOneTTLNEN, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gCoverageTLN, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyOneTTLNNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: I.v.m. uw dossier werd een aanpassing uitgevoerd op het netwerk. Gelieve enkele dagen te testen en via de klantendienst (015666666) door te geven of u nog een probleem ervaart. Indien ja, gelieve dan recente voorbeelden te voorzien vanaf de dag van deze SMS. Elk voorbeeld moet bevatten: datum, tijdstip, contactnr, volledig adres, probleemomschrijving per voorbeeld.
)
clipboard := Stringmob
return
}

CopyOneTTLNFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Une adaptation du réseau a été effectuée en rapport avec votre dossier. Veuillez tester pendant quelques jours et nous faire savoir par l'intermédiaire du service clientèle (015666666) si vous rencontrez toujours un problème. Dans l'affirmative, veuillez fournir des exemples récents à partir du jour de ce SMS. Chaque exemple doit comprendre: la date, l'heure, le numéro de contact, adresse, la description du problème par exemple.
)
clipboard := Stringmob
return
}

CopyOneTTLNEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: An adjustment was made to the network in connection with your case. Please test for a few days and let us know via customer service (015666666) if you are still experiencing a problem. If yes, please provide recent examples from the day of this SMS. Each example should include: date, time, contact nr, full address, problem description per example.
)
clipboard := Stringmob
return
}

; ONE T REMINDER

OneTReminderTLN()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET SMS ONE-T REMINDER
Gui, Add, Text,, 
Gui, Add, Button, gCopyOneTReminderTLNNL, COPY NL
Gui, Add, Button, gCopyOneTReminderTLNFR, COPY FR
Gui, Add, Button, gCopyOneTReminderTLNEN, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gCoverageTLN, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyOneTReminderTLNNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: We hebben helaas nog geen feedback ontvangen. Gelieve via de klantendienst (015666666) door te geven of u nog een probleem ervaart. Indien ja, gelieve dan recente voorbeelden te voorzien van de laatste drie dagen. Elk voorbeeld moet bevatten: datum, tijdstip, contactnr, probleemomschrijving per voorbeeld.
)
clipboard := Stringmob
return
}

CopyOneTReminderTLNFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Malheureusement, nous n'avons pas encore reçu de commentaires. Veuillez contacter le service clientèle (015666666) si vous rencontrez toujours un problème. Dans l'affirmative, veuillez fournir des exemples récents des trois derniers jours. Chaque exemple doit comprendre: la date, l'heure, le numéro de contact, la description du problème par exemple.
)
clipboard := Stringmob
return
}

CopyOneTReminderTLNEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Unfortunately, we have not yet received any feedback. Please pass on via customer service (015666666) if you are still experiencing a problem. If yes, please provide recent examples from the last three days. Each example should include: date, time, contact no, problem description per example.
)
clipboard := Stringmob
return
}

; NO COVERAGE

NoCoverageTLN()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET SMS NO COVERAGE
Gui, Add, Text,, 
Gui, Add, Button, gCopyNoCoverageTLNNL, COPY NL
Gui, Add, Button, gCopyNoCoverageTLNFR, COPY FR
Gui, Add, Button, gCopyNoCoverageTLNEN, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gCoverageTLN, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyNoCoverageTLNNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Helaas is het bereik op het opgegeven adres niet ideaal. We hopen hier in de toekomst verbetering in te brengen. In de tussentijd raden we aan om voor uw gesprekken via Voice over WiFi altijd dicht in de buurt van uw WiFi zendstation te blijven.
)
clipboard := Stringmob
return
}

CopyNoCoverageTLNFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Malheureusement, la couverture à l'adresse indiquée n'est pas idéale. Nous espérons pouvoir l'améliorer à l'avenir. En attendant, nous vous recommandons de toujours rester à proximité de votre station d'émission WiFi pour vos appels Voice over WiFi.
)
clipboard := Stringmob
return
}

CopyNoCoverageTLNEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Unfortunately, the coverage at the given address is not ideal. We hope to improve this in the future. In the meantime, we recommend always staying close to your WiFi transmitting station for your Voice over WiFi calls.
)
clipboard := Stringmob
return
}

; DEGRADATION

DegradationTLN()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET SMS DEGRADATION
Gui, Add, Text,, 
Gui, add, Text,, MSISDN
Gui, Add, Edit, vMSISDN, 
Gui, Add, Button, gCopyDegradationTLNNL, COPY NL
Gui, Add, Button, gCopyDegradationTLNFR, COPY FR
Gui, Add, Button, gCopyDegradationTLNEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gCoverageTLN, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyDegradationTLNNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Uw nummer %MSISDN% veroorzaakt momenteel storing op het Telenet radionetwerk. Gelieve deze stappen te volgen om ons te helpen het probleem op te lossen. Controleer of u de laatste updates van je fabrikant hebt. Herstart uw toestel.
)
clipboard := Stringmob
return
}

CopyDegradationTLNFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Votre numéro %MSISDN% provoque actuellement des interférences sur le réseau radio de Telenet. Veuillez suivre les étapes suivantes pour nous aider à résoudre le problème. Assurez-vous que vous disposez des dernières mises à jour de votre fabricant. Redémarrez votre appareil.
)
clipboard := Stringmob
return
}

CopyDegradationTLNEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Your number %MSISDN% is currently causing interference on the Telenet radio network. Please follow these steps to help us solve the problem. Make sure you have the latest updates from your manufacturer. Reboot your device.
)
clipboard := Stringmob
return
}

; ROAMING

RoamingTLN()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET SMS ROAMING
Gui, Add, Text,, 
Gui, Add, Button, gCopyRoamingTLNNL, COPY NL
Gui, Add, Button, gCopyRoamingTLNFR, COPY FR
Gui, Add, Button, gCopyRoamingTLNEN, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gCoverageTLN, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyRoamingTLNNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Indien u in de toekomst een probleem ervaart met het verbinden met een roaming netwerk, gelieve dan manueel naar netwerken te zoeken, met elke zichtbare operator 5 verbindingspogingen op te zetten en indien problemen de volgende informatie door te geven per poging: datum, tijdstip, naam netwerk, eventuele foutmelding.
)
clipboard := Stringmob
return
}

CopyRoamingTLNFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Si vous rencontrez un problème de connexion à un réseau d'itinérance à l'avenir, veuillez rechercher les réseaux manuellement, effectuer cinq tentatives de connexion avec chaque opérateur visible et, en cas de problème, fournir les informations suivantes pour chaque tentative: date, heure, nom du réseau, message d'erreur éventuel.
)
clipboard := Stringmob
return
}

CopyRoamingTLNEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: If you experience a problem connecting to a roaming network in the future, please search for networks manually, set up 5 connection attempts with each visible operator and if problems, provide the following information for each attempt: date, time, network name, any error message.
)
clipboard := Stringmob
return
}

; ESIM MENU

EsimTLN()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET SMS ESIM / ONE NUMBER
Gui, Add, Text,, 
Gui, Add, Button, gEsimActiveTLN, ESIM ACTIVATION
Gui, Add, Button, gEsimDeActiveTLN, ESIM DEACTIVATION & ACTIVATION
Gui, Add, Button, gEsimDeviceTLN, DEVICE NOK
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetResMob, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

; ESIM ACTIVE

EsimActiveTLN()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET SMS ESIM ACTIVATION
Gui, Add, Text,, 
Gui, Add, Button, gCopyEsimActiveTLNNL, COPY NL
Gui, Add, Button, gCopyEsimActiveTLNFR, COPY FR
Gui, Add, Button, gCopyEsimActiveTLNEN, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gEsimTLN, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyEsimActiveTLNNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Gelieve uw gsm en smartwatch te herstarten, opnieuw te proberen om uw smartwatch te koppelen, en de klantendienst (015666666) te informeren of u nog een probleem ervaart. Indien ja, gelieve door te geven in welke stap dit faalt en welke informatie op dat moment ingegeven wordt + datum & tijdstip + foutmelding + type watch + EID van de watch.
)
clipboard := Stringmob
return
}

CopyEsimActiveTLNFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Veuillez redémarrer votre téléphone portable et votre smartwatch, essayez à nouveau de coupler votre smartwatch et informez le service clientèle (015666666) si le problème persiste. Dans l'affirmative, veuillez indiquer à quelle étape l'opération a échoué et quelles informations sont actuellement saisies: date et heure, message d'erreur, type de montre et numéro d'identification de la montre.
)
clipboard := Stringmob
return
}

CopyEsimActiveTLNEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Please reboot your mobile phone and smartwatch, try again to pair your smartwatch, and inform customer service (015666666) if you are still experiencing a problem. If yes, please pass on in which step this fails and what information is currently entered + date & time + error message + watch type + watch EID.
)
clipboard := Stringmob
return
}

; ESIM DEACTIVATE ACTIVE

EsimDeActiveTLN()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET SMS ESIM DEACTIVATION & ACTIVATION
Gui, Add, Text,, 
Gui, Add, Button, gCopyEsimDeActiveTLNNL, COPY NL
Gui, Add, Button, gCopyEsimDeActiveTLNFR, COPY FR
Gui, Add, Button, gCopyEsimDeActiveTLNEN, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gEsimTLN, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyEsimDeActiveTLNNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Gelieve uw smartwatch te ontkoppelen via Mijn Telenet en dan uw gsm en smartwatch te herstarten. Gelieve daarna opnieuw te proberen om uw smartwatch te koppelen en de klantendienst (015666666) te informeren of u nog een probleem ervaart. Indien ja, gelieve door te geven in welke stap dit faalt en welke informatie op dat moment ingegeven wordt + datum & tijdstip + foutmelding + type watch + EID van de watch.
)
clipboard := Stringmob
return
}

CopyEsimDeActiveTLNFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Veuillez déconnecter votre smartwatch via My Telenet et redémarrer votre téléphone mobile et votre smartwatch. Ensuite, essayez à nouveau de coupler votre smartwatch et informez le service clientèle (015666666) si le problème persiste. Dans l'affirmative, veuillez indiquer à quelle étape l'opération a échoué et quelles informations sont actuellement saisies + date et heure + message d'erreur + type de montre + EID de la montre.
)
clipboard := Stringmob
return
}

CopyEsimDeActiveTLNEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Please disconnect your smartwatch via My Telenet and then reboot your cell phone and smartwatch. After that, please try to pair your smartwatch again and inform customer service (015666666) if you are still experiencing a problem. If yes, please indicate in which step this fails and what information is entered at that time + date & time + error message + type of watch + EID of the watch.
)
clipboard := Stringmob
return
}

; ESIM DEVICE NOK

EsimDeviceTLN()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET SMS ESIM DEVICE NOK
Gui, Add, Text,, 
Gui, Add, Button, gCopyEsimDeviceTLNNL, COPY NL
Gui, Add, Button, gCopyEsimDeviceTLNFR, COPY FR
Gui, Add, Button, gCopyEsimDeviceTLNEN, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gEsimTLN, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyEsimDeviceTLNNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Helaas worden voor Smartwatches van Samsung enkel koppelingen ondersteund met de Samsung smartphones. Meer info op: https://www2.telenet.be/nl/klantenservice/alles-over-telenet-one-number/
)
clipboard := Stringmob
return
}

CopyEsimDeviceTLNFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Malheureusement, pour les Smartwatches Samsung, seuls les couplages avec les smartphones Samsung sont pris en charge. Plus d'informations : https://www2.telenet.be/fr/klantenservice/alles-over-telenet-one-number/
)
clipboard := Stringmob
return
}

CopyEsimDeviceTLNEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Unfortunately, for Samsung Smartwatches, only pairings are supported with Samsung smartphones. More info at: https://www2.telenet.be/nl/klantenservice/alles-over-telenet-one-number/
)
clipboard := Stringmob
return
}

; ROUTING OLO OK

RoutingOLOTLN()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET SMS ROUTING OLO OK
Gui, Add, Text,, 
Gui, Add, Button, gCopyRoutingOLOTLNNL, COPY NL
Gui, Add, Button, gCopyRoutingOLOTLNFR, COPY FR
Gui, Add, Button, gCopyRoutingOLOTLNEN, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetResMob, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyRoutingOLOTLNNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: We hebben contact gehad met de operator van de nummer(s) die u niet kunnen bereiken en krijgen de bevestiging dat het in orde moet zijn. Indien er alsnog een probleem is moet de beller contact opnemen met de eigen operator.
)
clipboard := Stringmob
return
}

CopyRoutingOLOTLNFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Nous avons contacté l'opérateur du (des) numéro(s) qui ne peut pas vous joindre et nous avons reçu la confirmation que cela devrait aller. Si le problème persiste, l'appelant doit contacter son propre opérateur.
)
clipboard := Stringmob
return
}

CopyRoutingOLOTLNEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: We have contacted the operator of the number(s) that cannot reach you and receive confirmation that it should be OK. If there is still a problem, the caller should contact their own operator.
)
clipboard := Stringmob
return
}

; SMS TELENET BUSINESS

SmsTelenetBus()
{
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET BUSINESS SMS
Gui, Add, Text,, 
Gui, Add, Button, gSmsTelenetBusBB, BROADBAND
Gui, Add, Button, gSmsTelenetBusMob, MOBILE
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenet, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

; SMS TELENET BUSINESS BROADBAND

SmsTelenetBusBB()
{
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET BUSINESS SMS BROADBAND
Gui, Add, Text,, 
Gui, Add, Button, gSmsTelenetBusGEN, GENERAL
Gui, Add, Button, gSmsTelenetBusREQ, REQUEST INFO
Gui, Add, Button, gSmsTelenetBusInt, INTERNET
Gui, Add, Button, gSmsTelenetBusDTV, DTV
Gui, Add, Button, gSmsTelenetBusFixed, FIXED LINE
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

; SMS TELENET BUSINESS GENERAL

SmsTelenetBusGEN()
{
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET BUSINESS SMS GENERAL
Gui, Add, Text,, 
Gui, Add, Button, gSmsTelenetBusGENcb, CALLBACK
Gui, Add, Button, gModemActivateBus, MODEM ACTIVE
Gui, Add, Button, gPakketAanpassingBus, CHANGE BUNDLE
Gui, Add, Button, gItTicketSmsBBBus, IT TICKET
Gui, Add, Button, gItTicketUPSmsBBBus, UPDATE IT TICKET
Gui, Add, Button, gRepairCallbackBus, REPAIR CALLBACK
Gui, Add, Button, gLoginOkBus, LOGIN OK
Gui, Add, Button, gLastReminderBus, LAST REMINDER
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetBusBB, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

ItTicketUPSmsBBBus()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, UPDATE IT TICKET SMS
Gui, Add, Button, gCopyItUPBUSBB, UPDATE IT Ticket NL
Gui, Add, Button, gCopyItUPBUSBBFR, UPDATE IT Ticket FR
Gui, Add, Button, gCopyItUPdateBuSBBEN, UPDATE IT Ticket EN
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetBusGEN, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyItUPBUSBB()
{
StringitupdateBBBus =
(
Telenet-Business: Momenteel hebben we nog geen oplossing voor uw dossier. Onze IT-dienst werkt eraan. Bedankt voor uw geduld.
)
clipboard := StringitupdateBBBus
return
}

CopyItUPBUSBBFR()
{
StringitupdateBBBus =
(
Telenet-Business: Actuellement, nous n'avons pas encore de solution pour votre dossier. Notre département IT y travaille. Nous vous remercions de votre patience.
)
clipboard := StringitupdateBBBus
return
}

CopyItUPdateBuSBBEN()
{
StringitupdateBBBus =
(
Telenet-Business: Currently, we do not yet have a solution for your case. Our IT department is working on it. Thank you for your patience.
)
clipboard := StringitupdateBBBus
return
}

LastReminderBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET SMS LAST REMINDER
Gui, Add, Text,, 
Gui, add, Text,, PEGA SC-ID
Gui, Add, Edit, vScid, 
Gui, Add, Button, gCopyLastReminderBus, COPY NL
Gui, Add, Button, gCopyLastReminderBusFR, COPY FR
Gui, Add, Button, gCopyLastReminderBusEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetBusGEN, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyLastReminderBus()
{
global
Gui, Submit, NoHide
StringLRBus = 
(
Telenet-Business: We probeerden u al enkele malen te contacteren om uw technisch probleem te verhelpen. Hiervoor hebben we informatie van u nodig. Het dossier in kwestie is %Scid%. Dit nummer kan u ook best doorgeven wanneer u met ons contact opneemt.Gelieve ons te contacteren via de klantendienst op het nummer 080 06 60 66 of via WhatsApp op +32 468 00 10 98. We zijn er voor u op weekdagen van 8 tot 20 uur en in het weekend van 9 tot 20 uur.Let op: U heeft nog 1 week om deze informatie door te geven.Wanneer we geen informatie ontvangen, dan sluiten we het dossier.
)
clipboard := StringLRBus
return
}

CopyLastReminderBusFR()
{
global
Gui, Submit, NoHide
StringLRBus = 
(
Telenet-Business: Nous avons déjà essayé de vous contacter à plusieurs reprises pour résoudre votre problème technique. Nous avons besoin de vos informations pour cela. Le dossier en question est le %Scid%. Il est également préférable de fournir ce numéro lorsque vous nous contactez. Veuillez nous contacter via le service client au 080 06 60 66 ou via WhatsApp au +32 468 00 10 98. Nous sommes à votre disposition en semaine de 8h à 20h. le week-end de 9h à 20h Attention : Vous avez encore 1 semaine pour fournir ces informations. Si nous ne recevons aucune information, nous fermerons le dossier.
)
clipboard := StringLRBus
return
}

CopyLastReminderBusEN()
{
global
Gui, Submit, NoHide
StringLRBus = 
(
Telenet-Business: We have tried to contact you several times to resolve your technical problem. We need information from you for this. The file in question is %Scid%. It is advised to provide this number when you contact us. Please contact us via customer service on 080 06 60 66 or via WhatsApp on +32 468 00 10 98. We are there for you on weekdays from 8 a.m. to 8 p.m. hours and on weekends from 9 a.m. to 8 p.m. Please note: You still have 1 week to provide this information. If we do not receive any information, we will close the file.
)
clipboard := StringLRBus
return
}

SmsTelenetBusGENcb()
{
global
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, PEGA SC-ID
Gui, Add, Edit, vScid,
Gui, Add, Button, gCopySmsTelenetBusGENcb, COPY NL
Gui, Add, Button, gCopySmsTelenetBusGENcbFR, COPY FR
Gui, Add, Button, gCopySmsTelenetBusGENcbEN, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetBusGEN, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopySmsTelenetBusGENcb()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Kan u ons contacteren op 080066066 in verband met uw openstaand dossier %Scid%.
)
clipboard := Stringmob
return
}

CopySmsTelenetBusGENcbFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business : Vous pouvez nous contacter au 080066066 concernant votre dossier ouvert %Scid%.
)
clipboard := Stringmob
return
}

CopySmsTelenetBusGENcbEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Could you contact us on 080066066 regarding your file %Scid%.
)
clipboard := Stringmob
return
}

ModemActivateBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, MODEM ACTIVE
Gui, add, Text,, 
Gui, add, Text,, MAC-ADDRESS MODEM
Gui, Add, Edit, vModemmac, 
Gui, Add, Button, gCopymodemActivateBus, COPY NL
Gui, Add, Button, gCopymodemActivateFRBus, COPY FR
Gui, Add, Button, gCopymodemActivateENBus, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetBusGEN, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopymodemActivateBus()
{
global
Gui, Submit, NoHide ;betere manier dan control get
Stringmodem = 
(
Telenet-Business: Uw nieuwe modem %Modemmac% werd geactiveerd. Binnen 30 minuten kan u gebruik maken van uw diensten.
)
clipboard := Stringmodem
return
}

CopymodemActivateFRBus()
{
global
Gui, Submit, NoHide ;betere manier dan control get
Stringmodem = 
(
Telenet-Business: Votre nouveau modem %Modemmac% a ete active. Vous pouvez utiliser vos services dans les 30 minutes.
)
clipboard := Stringmodem
return
}

CopymodemActivateENBus()
{
global
Gui, Submit, NoHide ;betere manier dan control get
Stringmodem = 
(
Telenet-Business: Your new modem %Modemmac% has been activated. You can use your services within 30 minutes.
)
clipboard := Stringmodem
return
}

PakketAanpassingBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, WHICH BUNDLE
Gui, Add, Edit, vPakket, 
Gui, Add, Button, gCopyPakketaanpassingBus, COPY NL
Gui, Add, Button, gCopyPakketaanpassingFRBus, COPY FR
Gui, Add, Button, gCopyPakketaanpassingENBus, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetBusGEN, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyPakketaanpassingBus()
{
global
Gui, Submit, NoHide
stringpkkt = 
(
Telenet-Business: Uw pakket is succesvol aangepast naar %Pakket%.
)
clipboard = %stringpkkt%
return
}

CopyPakketaanpassingFRBus()
{
global
Gui, Submit, NoHide
stringpkkt = 
(
Telenet-Business: Votre abonnement a ete modifie avec succes en %Package%.
)
clipboard = %stringpkkt%
return
}

CopyPakketaanpassingENBus()
{
global
Gui, Submit, NoHide
stringpkkt = 
(
Telenet-Business: Your subscription has been successfully changed to %Package%.
)
clipboard = %stringpkkt%
return
}

ItTicketSmsBBBus(){
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, IT TICKET SMS
Gui, Add, Button, gCopyItBBBus, IT Ticket NL
Gui, Add, Button, gCopyItBBFRBus, IT Ticket FR
Gui, Add, Button, gCopyItBBENBus, IT Ticket EN
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetBusGEN, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyItBBBus()
{
Stringit =
(
Telenet-Business: We hebben je dossier doorgestuurd naar onze IT-dienst. We houden je op de hoogte. Bedankt voor uw geduld.
)
clipboard := Stringit
return
}

CopyItBBFRBus()
{
Stringit =
(
Telenet-Business: Nous avons transmis votre dossier a notre service informatique. Nous vous tiendrons informe. Merci pour votre patience.
)
clipboard := Stringit
return
}

CopyItBBENBus()
{
Stringit =
(
Telenet-Business: We have forwarded your file to our IT department. We will keep you informed. Thank you for your patience.
)
clipboard := Stringit
return
}

RepairCallbackBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, SERVICE (INT/DTV/FIXED)
Gui, add, Text,, May be left empty
Gui, Add, Edit, vRepdienst, 
Gui, Add, Button, gRepCopyCallbackBus, COPY NL
Gui, Add, Button, gRepCopyCallbackFRBus, COPY FR
Gui, Add, Button, gRepCopyCallbackENBus, COPY EN
Gui, add, Text,,
Gui, Add, Button, gClear, CLEAR
Gui, add, Text,,
Gui, Add, Button, gSmsTelenetBusGEN, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

RepCopyCallbackBus()
{
global
Gui, Submit, NoHide
Stringrepcall = 
(
Telenet-Business: Gelieve ons te contacteren op het nr 080066066 voor een repair afspraak ivm uw %Repdienst% diensten.
)
clipboard := Stringrepcall
return
}


RepCopyCallbackFRBus()
{
global
Gui, Submit, NoHide
Stringrepcall = 
(
Telenet-Business: Veuillez nous contacter au 080066066 pour un rendez-vous de réparation concernant vos services %Repdienst%.
)
clipboard := Stringrepcall
return
}


RepCopyCallbackENBus()
{
global
Gui, Submit, NoHide
Stringrepcall = 
(
Telenet-Business: Please contact us on 080066066 for a repair appointment regarding your %Repdienst% services.
)
clipboard := Stringrepcall
return
}

LoginOkBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, WHICH PLATFORM
Gui, Add, Text,, (MyTelenet, Telenet TV, webmail, ...)
Gui, Add, Edit, vService,
Gui, Add, Button, gCopyLoginOkBus, Copy NL
Gui, Add, Button, gCopyLoginOkFRBus, Copy FR
Gui, Add, Button, gCopyLoginOkENBus, Copy EN
Gui, add, Text,,
Gui, Add, Button, gClear, CLEAR
Gui, add, Text,,
Gui, Add, Button, gSmsTelenetBusGEN, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyLoginOkBus()
{
global
Gui, Submit, NoHide
Stringlog =
(
Telenet-Business: U kan vanaf nu weer aanmelden op %Service%.
)
clipboard := Stringlog
return
}

CopyLoginOkFRBus()
{
global
Gui, Submit, NoHide
Stringlog =
(
Telenet-Business: À partir de maintenant, vous pouvez vous reconnecter a %Service%.
)
clipboard := Stringlog
return
}

CopyLoginOkENBus()
{
global
Gui, Submit, NoHide
Stringlog =
(
Telenet-Business: You can now login to the following service %Service%.
)
clipboard := Stringlog
return
}

; SMS TELENET BUSINESS REQUEST INFO

SmsTelenetBusREQ()
{
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET BUSINESS SMS REQUEST INFO
Gui, Add, Text,, 
Gui, Add, Button, gSmsModemInfoBus, MODEM INFO
Gui, Add, Button, gSmsDtvInfoBus, STB/SPDN INFO
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetBusBB, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

SmsModemInfoBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET BUSINESS SMS REQUEST MODEM
Gui, Add, Text,, 
Gui, Add, Button, gCopySmsModemInfoBus, COPY NL
Gui, Add, Button, gCopySmsModemInfoFRBus, COPY FR
Gui, Add, Button, gCopySmsModemInfoENBus, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetBusREQ, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopySmsModemInfoBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Kan u ons contacteren op 080066066 met het HFC MAC van uw nieuwe modem.
)
clipboard := Stringmob
return
}

CopySmsModemInfoFRBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Pouvez-vous nous contacter sur 080066066 avec l'adresse MAC de votre nouveau modem afin de compléter l'activation sur votre nouveau modem.
)
clipboard := Stringmob
return
}

CopySmsModemInfoENBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Can you contact us on 080066066 with the MAC address of your new modem in order to complete the activation on your new modem.
)
clipboard := Stringmob
return
}

SmsDtvInfoBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET BUSINESS SMS REQUEST DTV
Gui, Add, Text,, 
Gui, Add, Button, gCopySmsDtvInfoBus, COPY NL
Gui, Add, Button, gCopySmsDtvInfoFRBus, COPY FR
Gui, Add, Button, gCopySmsDtvInfoENBus, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetBusREQ, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopySmsDtvInfoBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Kan u ons contacteren op 080066066 met het serienummer CA ID van uw nieuwe TV-Box/Digicorder.
)
clipboard := Stringmob
return
}

CopySmsDtvInfoFRBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Pouvez-vous nous contacter sur 080066066 avec le numéro de série de votre nouvelle TV-Box/Digicorder afin de compléter l'activation sur votre nouvel appareil.
)
clipboard := Stringmob
return
}

CopySmsDtvInfoENBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Can you contact us on 080066066 with the Serial number of your new TV-Box/Digicorder in order to complete the activation on your new device.
)
clipboard := Stringmob
return
}

; SMS TELENET BUSINESS INTERNET

SmsTelenetBusInt()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, TELENET BUSINESS SMS INTERNET
Gui, add, Text,, 
Gui, Add, Button, gResetIntBus, PASSWORD RESET
Gui, Add, Button, gEmailProgrammaBus, DISAPPEARED MAILS DUE MAIL PROGRAM
Gui, Add, Button, gPIdTransferBus, PID TRANSFER
Gui, Add, Button, gPIDinviteBus, PID INVITE
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetBusBB, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

PIdTransferBus(){
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, PID transfer
Gui, add, Text,, 
Gui, add, Text,, E-MAIL
Gui, Add, Edit, vEMAILT,
Gui, Add, Button, gCopyTransferBus, COPY NL
Gui, Add, Button, gCopyTransferBusFR, COPY FR
Gui, Add, Button, gCopyTransferBusEN, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetBusInt, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyTransferBus()
{
global
Gui, Submit, NoHide
StringPIDTransferBus = 
(
Telenet-info: Uw login %EMAILT% is beschikbaar. Gelieve opnieuw in te loggen.
)
clipboard := StringPIDTransferBus
return
}

CopyTransferBusFR()
{
global
Gui, Submit, NoHide
StringPIDTransferBus = 
(
Telenet-info: Votre login %EMAILT% est disponible. Veuillez vous connecter à nouveau.
)
clipboard := StringPIDTransferBus
return
}

CopyTransferBusEN()
{
global
Gui, Submit, NoHide
StringPIDTransferBus = 
(
Telenet-info: Your login %EMAILT% is available. Please login again.
)
clipboard := StringPIDTransferBus
return
}

PIDinviteBus()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, PID INVITE
Gui, add, Text,, 
Gui, add, Text,, E-MAIL
Gui, Add, Edit, vEMAILINV,
Gui, Add, Button, gCopyInviteBus, COPY NL
Gui, Add, Button, gCopyInviteBusFR, COPY FR
Gui, Add, Button, gCopyInviteBusEN, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetBusInt, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyInviteBus()
{
global
Gui, Submit, NoHide
StringPIDInviteBus = 
(
Telenet-Business: We hebben naar je e-mailadres %EMAILINV% een nieuwe uitnodiging verstuurd voor het voltooien van je login. Werkt het nog niet? Laat via de klantendienst op 015666666 weten in welke stap, de foutmelding en eventueel andere relevante informatie.
)
clipboard := StringPIDInviteBus
return
}

CopyInviteBusFR()
{
global
Gui, Submit, NoHide
StringPIDInviteBus = 
(
Telenet-Business: Nous avons envoyé à votre adresse e-mail %EMAILINV% une nouvelle invitation à compléter votre login. Cela ne fonctionne toujours pas? Veuillez nous informer via le service clientèle à l'adresse 0486191999 de l'étape, du message d'erreur et de toute autre information pertinente.
)
clipboard := StringPIDInviteBus
return
}

CopyInviteBusEN()
{
global
Gui, Submit, NoHide
StringPIDInviteBus = 
(
Telenet-Business: We have sent to your e-mail address %EMAILINV% a new invitation to complete your login. Still not working? Please let us know via customer service at 0486191999 in which step, the error message and any other relevant information.
)
clipboard := StringPIDInviteBus
return
}

ResetIntBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, PASSWORD RESET
Gui, add, Text,, 
Gui, add, Text,, NEW PASSWORD
Gui, Add, Edit, vPassword,
Gui, Add, Button, gCopyResetBus, COPY NL
Gui, Add, Button, gCopyResetFRBus, COPY FR
Gui, Add, Button, gCopyResetENBus, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetBusInt, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyResetBus()
{
global
Gui, Submit, NoHide
Stringresetwachtwoord = 
(
Telenet-Business: Uw nieuw wachtwoord is: %Wachtwoord%
)
clipboard := Stringresetwachtwoord
return
}

CopyResetFRBus()
{
global
Gui, Submit, NoHide
Stringresetwachtwoord = 
(
Telenet-Business: Votre nouveau mot de passe est : %Wachtwoord%
)
clipboard := Stringresetwachtwoord
return
}

CopyResetENBus()
{
global
Gui, Submit, NoHide
Stringresetwachtwoord = 
(
Telenet-Business: Your new password is: %Wachtwoord%
)
clipboard := Stringresetwachtwoord
return
}

EmailProgrammaBus(){
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, DISAPPEARED MAILS DUE MAIL PROGRAM
Gui, add, Text,, 
Gui, Add, Button, gCopyEmailProgrammaBus, COPY NL
Gui, Add, Button, gCopyEmailProgrammaFRBus, COPY FR
Gui, Add, Button, gCopyEmailProgrammaENBus, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetBusInt, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyEmailProgrammaBus()
{
Gui, Submit, NoHide
Stringemailprogrammas = 
(
Telenet-Business: We kunnen geen fout vaststellen op Webmail. Gelieve de instellingen van uw mailclient te controleren. meer info: https://tinyurl.com/y239bd2s
)

clipboard := Stringemailprogrammas
return
}

CopyEmailProgrammaFRBus()
{
Gui, Submit, NoHide
Stringemailprogrammas = 
(
Telenet-Business: Nous ne pouvons pas detecter d'erreur sur le Webmail. Veuillez verifier les parametres de votre client de messagerie. Plus d'infos: https://tinyurl.com/y239bd2s
)

clipboard := Stringemailprogrammas
return
}

CopyEmailProgrammaENBus()
{
Gui, Submit, NoHide
Stringemailprogrammas = 
(
Telenet-Business: We cannot detect any issues for Webmail on our end. Please check the settings of your mail client. For more info: https://tinyurl.com/y239bd2s
)

clipboard := Stringemailprogrammas
return
}

; SMS TELENET BUSINESS DTV

SmsTelenetBusDTV()
{
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET BUSINESS SMS DTV
Gui, Add, Text,, 
Gui, Add, Button, gZenderPakketActivatieBus, ENTERTAINMENT PACK ACTIVE
Gui, Add, Button, gTvBoxActivateBus, EOS ACTIVE
Gui, Add, Button, gDigicorderBus, SIPADAN ACTIVE
Gui, Add, Button, gCIKaartBus, CI+ ACTIVE
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetBusBB, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

ZenderPakketActivatieBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, ENTERTAINMENT PACK
Gui, Add, Edit, vZenderpakket, 
Gui, Add, Button, gCopyZenderPakketActivatieBus, COPY NL
Gui, Add, Button, gCopyZenderPakketActivatieFRBus, COPY FR
Gui, Add, Button, gCopyZenderPakketActivatieENBus, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetBusDTV, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyZenderPakketActivatieBus()
{
global
Gui, Submit, NoHide
Stringzndrpakket = 
(
Telenet-Business: Uw zenderpakket %Zenderpakket% is succesvol geactiveerd. Dit is gebruiksklaar binnen 60 minuten.
)
clipboard := Stringzndrpakket
return
}

CopyZenderPakketActivatieFRBus()
{
global
Gui, Submit, NoHide
Stringzndrpakket = 
(
Telenet-Business: Votre bouquet de chaînes %Zenderpakket% a ete active avec succes. Ceci est pret à l’emploi dans les 60 minutes.
)
clipboard := Stringzndrpakket
return
}

CopyZenderPakketActivatieENBus()
{
global
Gui, Submit, NoHide
Stringzndrpakket = 
(
Telenet-Business: Your channel package %Zenderpakket% has been successfully activated and is ready to use within 60 minutes.
)
clipboard := Stringzndrpakket
return
}

TvBoxActivateBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, SERIAL NUMBER EOS
Gui, Add, Edit, vSerienr, 
Gui, Add, Button, gCopyTvBoxActivateBus, COPY NL
Gui, Add, Button, gCopyTvBoxActivateFRBus, COPY FR
Gui, Add, Button, gCopyTvBoxActivateENBus, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetBusDTV, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyTvBoxActivateBus()
{
global
Gui, Submit, NoHide
Stringtvbox = 
(
Telenet-Business: Uw nieuwe TV-Box %Serienr% werd geactiveerd. Binnen 30 minuten kan u gebruik maken van uw diensten.
)
clipboard := Stringtvbox
return
}

CopyTvBoxActivateFRBus()
{
global
Gui, Submit, NoHide
Stringtvbox = 
(
Telenet-Business: Votre nouvelle TV-Box %Serienr% a ete activee. Vous pouvez utiliser vos services dans les 30 minutes.
)
clipboard := Stringtvbox
return
}

CopyTvBoxActivateENBus()
{
global
Gui, Submit, NoHide
Stringtvbox = 
(
Telenet-Business: Your new TV-Box %Serienr% has been activated. You can use your services within 30 minutes.
)
clipboard := Stringtvbox
return
}

DigicorderBus(){
global
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, SERIAL NUMBER SPDN
Gui, Add, Edit, vSerienr, 
Gui, Add, Button, gCopygDigicorderBus, COPY NL
Gui, Add, Button, gCopygDigicorderFRBus, COPY FR
Gui, Add, Button, gCopygDigicorderENBus, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetBusDTV, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopygDigicorderBus()
{
global
Gui, Submit, NoHide
Stringtvbox = 
(
Telenet-Business: Uw nieuwe Digicorder/Digibox %Serienr% werd geactiveerd. Binnen 30 minuten kan u gebruik maken van uw diensten.
)
clipboard := Stringtvbox
return
}

CopygDigicorderFRBus()
{
global
Gui, Submit, NoHide
Stringtvbox = 
(
Telenet-Business: Votre nouveau Digicorder/Digibox %Serienr% a ete active. Vous pouvez utiliser vos services dans les 30 minutes.
)
clipboard := Stringtvbox
return
}

CopygDigicorderENBus()
{
global
Gui, Submit, NoHide
Stringtvbox = 
(
Telenet-Business: Your new Digicorder/Digibox %Serienr% has been activated. You can use your services within 30 minutes.
)
clipboard := Stringtvbox
return
}

CIKaartBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, SERIAL NUMBER CI+
Gui, Add, Edit, vSerienr, 
Gui, Add, Button, gCopyCIKaartBus, COPY NL
Gui, Add, Button, gCopyCIKaartFRBus, COPY FR
Gui, Add, Button, gCopyCIKaartENBus, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetBusDTV, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyCIKaartBus()
{
global
Gui, Submit, NoHide
Stringtvbox = 
(
Telenet-Business: Uw nieuwe CI+ kaart %Serienr% werd geactiveerd. Binnen 30 minuten kan u gebruik maken van uw diensten.
)
clipboard := Stringtvbox
return
}

CopyCIKaartFRBus()
{
global
Gui, Submit, NoHide
Stringtvbox = 
(
Telenet-Business: Votre nouveau CI+ %Serienr% a ete active. Vous pouvez utiliser vos services dans les 30 minutes.
)
clipboard := Stringtvbox
return
}

CopyCIKaartENBus()
{
global
Gui, Submit, NoHide
Stringtvbox = 
(
Telenet-Business: Your new CI+ card %Serienr% has been activated. You can use your services within 30 minutes.
)
clipboard := Stringtvbox
return
}

; SMS TELENET BUSINESS FIXED

SmsTelenetBusFixed()
{
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET BUSINESS SMS FIXED LINE
Gui, Add, Text,, 
Gui, Add, Button, gTelefoonActiefBus, FIXED LINE ACTIVE
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetBusBB, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

TelefoonActiefBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, PHONE NUMBER
Gui, Add, Edit, vTelefoonnummer, 
Gui, Add, Button, gCopyTelefoonActiefBus, COPY NL
Gui, Add, Button, gCopyTelefoonActiefFRBus, COPY FR
Gui, Add, Button, gCopyTelefoonActiefENBus, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetBusFixed, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyTelefoonActiefBus()
{
global
Gui, Submit, NoHide
Stringtelefoonnr = 
(
Telenet-Business: Uw vaste lijn %Telefoonnummer% is succesvol geactiveerd. U kan deze gebruiken binnen de 30 minuten.
)
clipboard := Stringtelefoonnr
return
}

CopyTelefoonActiefFRBus()
{
global
Gui, Submit, NoHide
Stringtelefoonnr = 
(
Telenet-Business: Votre %Telefoonnummer% fixe a ete active avec succes. Vous pouvez l'utiliser dans les 30 minutes.
)
clipboard := Stringtelefoonnr
return
}

CopyTelefoonActiefENBus()
{
global
Gui, Submit, NoHide
Stringtelefoonnr = 
(
Telenet-Business: Your landline %Telefoonnummer% has been successfully activated. You can use it within 30 minutes.
)
clipboard := Stringtelefoonnr
return
}

; SMS TELENET BUSINESS MOBILE

SmsTelenetBusMob()
{
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET BUSINESS SMS MOBILE
Gui, Add, Text,, 
Gui, Add, Button, gIssueFixedTLNBus, ISSUE FIXED
Gui, Add, Button, gSystemOKTLNBus, SYSTEM OK, CHECK DEVICE
Gui, Add, Button, gSimTLNBus, SIM ACTIVATION
Gui, Add, Button, gCallBackMenuTLNBus, CALLBACK
Gui, Add, Button, gSMSMnpRejectTLNBus, MNP
Gui, Add, Button, gItTicketSmsTLNBus, IT TICKET
Gui, Add, Button, gCrosstestMenuSmsTLNBus, CROSSTEST
Gui, Add, Button, gVowifiMenuTLNBus, VOICE2.0
Gui, Add, Button, gCoverageTLNBus, COVERAGE
Gui, Add, Button, gEsimTLNBus, ESIM / ONE NUMBER
Gui, Add, Button, gRoutingOLOTLNBus, ROUTING OLO OK
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenet, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

; ISSUE FIXED

IssueFixedTLNBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET BUSINESS SMS ISSUE FIXED
Gui, Add, Text,, 
Gui, add, Text,, PEGA SC-ID
Gui, Add, Edit, vScid, 
Gui, Add, Text,, ISSUE (Short)
Gui, Add, Edit, vProblemshort
Gui, Add, Button, gCopyIssueFixedTLNNLBus, COPY NL
Gui, Add, Button, gCopyIssueFixedTLNFRBus, COPY FR
Gui, Add, Button, gCopyIssueFixedTLNENBus, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetBusMob, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyIssueFixedTLNNLBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Uw dossier (%Scid%) over %Problemshort% werd opgevolgd. Gelieve uw toestel te herstarten.
)
clipboard := Stringmob
return
}

CopyIssueFixedTLNFRBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Votre dossier (%Scid%) concernant %Problemshort% a été suivi. Veuillez redémarrer votre appareil.
)
clipboard := Stringmob
return
}

CopyIssueFixedTLNENBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Your case (%Scid%) related to %Problemshort% was followed up. Please restart your device.
)
clipboard := Stringmob
return
}

; SYSTEM OK CHECK DEVICE

SystemOKTLNBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET BUSINESS SMS SYSTEM OK
Gui, Add, Text,, 
Gui, add, Text,, PEGA SC-ID
Gui, Add, Edit, vScid, 
Gui, Add, Text,, ISSUE (Short)
Gui, Add, Edit, vProblemshort
Gui, Add, Button, gCopySystemOKTLNNLBus, COPY NL
Gui, Add, Button, gCopySystemOKTLNFRBus, COPY FR
Gui, Add, Button, gCopySystemOKTLNENBus, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetBusMob, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopySystemOKTLNNLBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: In verband met uw dossier (%Scid%) over %Problemshort%. Bij nazicht in onze systemen staat alles juist. Gelieve uw instellingen na te kijken en uw toestel te herstarten.
)
clipboard := Stringmob
return
}

CopySystemOKTLNFRBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Concernant votre dossier (%Scid%) sur %Problemshort%. Après examen dans nos systèmes, tout est correct. Veuillez vérifier vos paramètres et redémarrer votre appareil.
)
clipboard := Stringmob
return
}

CopySystemOKTLNENBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Regarding your case (%Scid%) on %Problemshort%. When checking in our systems, everything is correct. Please check your settings and reboot your device.
)
clipboard := Stringmob
return
}

; SIM ACTIVATION

SimTLNBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET BUSINESS SMS SIM ACTIVE
Gui, Add, Text,, 
Gui, Add, Button, gMobSimTLNBus, MOBILE SIM
Gui, Add, Button, gDataSimTLNBus, DATA SIM
Gui, Add, Button, gInfoSimActTLNBus, INFO SIMCARD NUMBER
Gui, Add, Button, gDocumentTLNBus, NO DOCUMENT
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetBusMob, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

DocumentTLNBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET BUSINESS SMS NO DOCUMENT
Gui, Add, Text,, 
Gui, Add, Button, gCopyDocumentTLNBusNL, COPY NL
Gui, Add, Button, gCopyDocumentTLNBusFR, COPY FR
Gui, Add, Button, gCopyDocumentTLNBusEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gSimTLNBus BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyDocumentTLNBusNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Om de activatie van uw mobiel nummer op te starten, ontbreken de nodige documenten. Mogen wij u vragen hiervoor langs te gaan in uw dichtstbijzijnde Telenet-winkelpunt. Alvast bedankt.
)
clipboard := Stringmob
return
}

CopyDocumentTLNBusFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Pour commencer l'activation de votre numéro de GSM, il manque les documents nécessaires. Nous vous prions de vous rendre dans le magasin Telenet le plus proche. Merci.
)
clipboard := Stringmob
return
}

CopyDocumentTLNBusEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: To start the activation of your mobile number, the necessary documents are missing. May we ask you to go to your nearest Telenet shop for this. Thanks.
)
clipboard := Stringmob
return
}

InfoSimActTLNBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET SMS INFO SIMCARD NUMBER
Gui, Add, Text,, 
Gui, Add, Button, gCopyInfoSimActTLNResNLBus, COPY NL
Gui, Add, Button, gCopyInfoSimActTLNResFRBus, COPY FR
Gui, Add, Button, gCopyInfoSimActTLNResENBus, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gSimTLNBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyInfoSimActTLNResNLBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Gelieve ons het SIM-kaartnummer van Telenet te bezorgen via 080066066 zodat wij uw mobiel nummer kunnen activeren.
)
clipboard := Stringmob
return
}

CopyInfoSimActTLNResFRBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Veuillez nous communiquer le numéro de la carte SIM de Telenet à l'adresse 080066066 afin que nous puissions activer votre numéro de téléphone mobile.
)
clipboard := Stringmob
return
}

CopyInfoSimActTLNResENBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Please provide us with Telenet's SIM card number at 080066066 so that we can activate your mobile number.
)
clipboard := Stringmob
return
}

MobSimTLNBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET BUSINESS SMS MOBILE SIM
Gui, Add, Text,, 
Gui, Add, Button, gMobSimActTLNBus, MOB SIM ACTIVATED
Gui, Add, Button, gMobSimLinkTLNBus, MOB SIM ACTIVATE LINK
Gui, add, Text,, 
Gui, Add, Button, gSimTLNBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

MobSimActTLNBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET BUSINESS SMS MOB SIM ACTIVE
Gui, Add, Text,, 
Gui, add, Text,, MSISDN
Gui, Add, Edit, vMSISDN,
Gui, Add, Button, gCopyMobSimActTLNBusNL, COPY NL
Gui, Add, Button, gCopyMobSimActTLNBusFR, COPY FR
Gui, Add, Button, gCopyMobSimActTLNBusEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gMobSimTLNBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyMobSimActTLNBusNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: De activering van uw mobiel %MSISDN% is succesvol afgerond.
)
clipboard := Stringmob
return
}

CopyMobSimActTLNBusFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: l'Activation de votre téléphone mobile %MSISDN% a été effectuée avec succès.
)
clipboard := Stringmob
return
}

CopyMobSimActTLNBusEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: The activation of your mobile phone %MSISDN% has been completed successfully.
)
clipboard := Stringmob
return
}

MobSimLinkTLNBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET BUSINESS SMS MOB SIM ACTIVATE LINK
Gui, Add, Text,, 
Gui, add, Text,, MSISDN
Gui, Add, Edit, vMSISDN,
Gui, add, text,, ORDER NUMBER
Gui, add, Edit, vOrdernr
Gui, Add, Button, gCopyMobSimLinkTLNBusNL, COPY NL
Gui, Add, Button, gCopyMobSimLinkTLNBusFR, COPY FR
Gui, Add, Button, gCopyMobSimLinkTLNBusEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gMobSimTLNBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyMobSimLinkTLNBusNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: De activering van %MSISDN% met bestelnummer %Ordernr% werd nog niet opgestart. Je kan deze activatie zelf starten via de activatielink: https://www2.telenet.be/activeermobiel
)
clipboard := Stringmob
return
}

CopyMobSimLinkTLNBusFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: L'activation de %MSISDN% avec numéro de commande %Ordernr% n'a pas encore été lancée. Vous pouvez démarrer cette activation vous-même via le lien d'activation: https://www2.telenet.be/activermobile
)
clipboard := Stringmob
return
}

CopyMobSimLinkTLNBusEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: The activation of %MSISDN% with ordernumber %Ordernr% has not been started yet. You can start this activation yourself via the activation link: https://www2.telenet.be/activeermobiel
)
clipboard := Stringmob
return
}

DataSimTLNBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET BUSINESS SMS DATA SIM
Gui, Add, Text,, 
Gui, Add, Button, gDataSimActTLNBus, DATA SIM ACTIVATED
Gui, Add, Button, gDataSimLinkTLNBus, DATA SIM ACTIVATE LINK
Gui, add, Text,, 
Gui, Add, Button, gSimTLNBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

DataSimActTLNBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET BUSINESS SMS DATA SIM ACTIVE
Gui, Add, Text,, 
Gui, add, Text,, MSISDN
Gui, Add, Edit, vMSISDN,
Gui, Add, Button, gCopyDataSimActTLNBusNL, COPY NL
Gui, Add, Button, gCopyDataSimActTLNBusFR, COPY FR
Gui, Add, Button, gCopyDataSimActTLNBusEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gDataSimTLNBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyDataSimActTLNBusNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: De activering van uw DATA SIM %MSISDN% is succesvol afgerond.
)
clipboard := Stringmob
return
}

CopyDataSimActTLNBusFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: l'Activation de votre SIM DATA %MSISDN% a été effectuée avec succès.
)
clipboard := Stringmob
return
}

CopyDataSimActTLNBusEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: The activation of your DATA SIM %MSISDN% has been completed successfully.
)
clipboard := Stringmob
return
}

DataSimLinkTLNBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET BUSINESS SMS DATA SIM ACTIVATE LINK
Gui, Add, Text,, 
Gui, add, Text,, MSISDN
Gui, Add, Edit, vMSISDN,
Gui, add, Text,, ORDER NUMBER
Gui, Add, Edit, vOrdernr
Gui, Add, Button, gCopyDataSimLinkTLNBusNL, COPY NL
Gui, Add, Button, gCopyDataSimLinkTLNBusFR, COPY FR
Gui, Add, Button, gCopyDataSimLinkTLNBusEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gDataSimTLNBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyDataSimLinkTLNBusNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: De activering van %MSISDN% met bestelnummer %Ordernr% werd nog niet opgestart. Je kan deze activatie zelf starten via de activatielink: https://www2.telenet.be/activeermobiel
)
clipboard := Stringmob
return
}

CopyDataSimLinkTLNBusFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: L'activation de %MSISDN% avec numéro de commande %Ordernr% n'a pas encore été lancée. Vous pouvez démarrer cette activation vous-même via le lien d'activation: https://www2.telenet.be/activermobile
)
clipboard := Stringmob
return
}

CopyDataSimLinkTLNBusEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: The activation of %MSISDN% with ordernumber %Ordernr% has not been started yet. You can start this activation yourself via the activation link: https://www2.telenet.be/activeermobiel
)
clipboard := Stringmob
return
}

; CALLBACK MENU

CallbackMenuTLNBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET BUSINESS SMS CALLBACK
Gui, Add, Text,, 
Gui, Add, Button, gCallbackTLNBus, CALLBACK
Gui, Add, Button, gExamplesTLNBus, CALLBACK EXAMPLES CALLS
Gui, Add, Button, gExamplesSpeedTLNBus, CALLBACK EXAMPLES SPEEDTESTS
Gui, Add, Button, gCallbackReminderTLNBus, CALLBACK REMINDER
Gui, Add, Button, gCaseClosedTLNBus, CASE CLOSED
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetBusMob, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

; CASE CLOSED

CaseClosedTLNBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET SMS CASE CLOSED
Gui, Add, Text,, 
Gui, add, Text,, PEGA SC-ID
Gui, Add, Edit, vScid, 
Gui, Add, Button, gCopyCaseClosedTLNNLBus, COPY NL
Gui, Add, Button, gCopyCaseClosedTLNFRBus, COPY FR
Gui, Add, Button, gCopyCaseClosedTLNENBus, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gCallbackMenuTLNBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyCaseClosedTLNNLBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Helaas ontvingen we geen feedback na meerdere contactpogingen en wordt hierbij het dossier %Scid% gesloten. Indien je toch nog hinder ondervindt, gelieve dit dan te laten weten aan de klantendienst met alle eerder gevraagde informatie.
)
clipboard := Stringmob
return
}

CopyCaseClosedTLNFRBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Malheureusement, nous n'avons reçu aucune réponse après plusieurs tentatives de contact et le dossier %Scid% est donc clôturé. Si vous continuez à subir des désagréments, veuillez en informer le service clientèle en lui communiquant toutes les informations demandées précédemment.
)
clipboard := Stringmob
return
}

CopyCaseClosedTLNENBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Unfortunately, we did not receive any feedback after multiple contact attempts and the case %Scid% is hereby closed. If you still experience inconvenience, please let customer service know with all previously requested information.
)
clipboard := Stringmob
return
}

; CALLBACK

CallbackTLNBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET BUSINESS SMS CALLBACK
Gui, Add, Text,, 
Gui, add, Text,, PEGA SC-ID
Gui, Add, Edit, vScid, 
Gui, Add, Text,, ISSUE (Short)
Gui, Add, Edit, vProblemshort
Gui, Add, Button, gCopyCallbackTLNNLBus, COPY NL
Gui, Add, Button, gCopyCallbackTLNFRBus, COPY FR
Gui, Add, Button, gCopyCallbackTLNENBus, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gCallbackMenuTLNBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyCallbackTLNNLBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Gelieve ons te contacteren op het nummer 080066066 in verband met uw dossier (%Scid%) over %Problemshort%. Met vriendelijke groeten.
)
clipboard := Stringmob
return
}

CopyCallbackTLNFRBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Veuillez nous contacter au 080066066 sur le dossier (%Scid%) concernant %Problemshort%. Cordialement.
)
clipboard := Stringmob
return
}

CopyCallbackTLNENBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Please contact us on 080066066 regarding case (%Scid%) concernant %Problemshort%. Kind regards.
)
clipboard := Stringmob
return
}

; CALLBACK EXAMPLES

ExamplesTLNBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET BUSINESS SMS EXAMPLES CALLS
Gui, Add, Text,, 
Gui, add, Text,, PEGA SC-ID
Gui, Add, Edit, vScid, 
Gui, Add, Text,, ISSUE (Short)
Gui, Add, Edit, vProblemshort
Gui, Add, Button, gCopyExamplesTLNNLBus, COPY NL
Gui, Add, Button, gCopyExamplesTLNFRBus, COPY FR
Gui, Add, Button, gCopyExamplesTLNENBus, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gCallbackMenuTLNBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyExamplesTLNNLBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Gelieve ons te contacteren op het nummer 080066066 in verband met uw dossier (%Scid%) over %Problemshort%. Indien je nog hinder ondervindt, gelieve dan recente voorbeelden te voorzien van de laatste drie dagen voor uw contact + startdatum van het probleem. Elk voorbeeld moet bevatten: locatie (volledig adres), datum, tijdstip, contactnr, probleemomschrijving per voorbeeld.
)
clipboard := Stringmob
return
}

CopyExamplesTLNFRbus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Veuillez nous contacter au 080066066 sur le dossier (%Scid%) concernant %Problemshort%. Si vous rencontrez toujours des problèmes, veuillez fournir des exemples récents des trois derniers jours avant votre contact + la date de début du problème. Chaque exemples doit comprendre : le lieu (adresse complète), la date, l'heure, le numéro de contact, la description du problème par exemple.
)
clipboard := Stringmob
return
}

CopyExamplesTLNENBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-info: Please contact us on 080066066 regarding case (%Scid%) related to %Problemshort%. If you are still experiencing trouble, please provide recent examples from the last three days before your contact + start date of the problem. Each example should include: location (full address), date, time, contact no, problem description per example.
)
clipboard := Stringmob
return
}
; CALLBACK EXAMPLES SPEEDTESTS

ExamplesSpeedTLNBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET BUSINESS SMS EXAMPLES SPEEDTESTS
Gui, Add, Text,, 
Gui, add, Text,, PEGA SC-ID
Gui, Add, Edit, vScid, 
Gui, Add, Text,, ISSUE (Short)
Gui, Add, Edit, vProblemshort
Gui, Add, Button, gCopyExamplesSpeedTLNNLBus, COPY NL
Gui, Add, Button, gCopyExamplesSpeedTLNFRBus, COPY FR
Gui, Add, Button, gCopyExamplesSpeedTLNENBus, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gCallbackMenuTLNBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyExamplesSpeedTLNNLBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Gelieve ons te contacteren op het nummer 080066066 in verband met uw dossier (%Scid%) over %Problemshort%. Indien je nog hinder ondervindt, gelieve dan recente voorbeelden te voorzien van de laatste drie dagen voor uw contact + startdatum van het probleem. Elk voorbeeld moet bevatten: locatie (volledig adres), datum, tijdstip, speedtest (speedtest.telenet.be), probleemomschrijving per voorbeeld.
)
clipboard := Stringmob
return
}

CopyExamplesSpeedTLNFRBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Veuillez nous contacter au 080066066 sur le dossier (%Scid%) concernant %Problemshort%. Si vous rencontrez toujours des problèmes, veuillez fournir des exemples récents des trois derniers jours avant votre contact + la date de début du problème. Chaque exemples doit comprendre : le lieu (adresse complète), la date, l'heure, speedtest (speedtest.telenet.be), la description du problème par exemple.
)
clipboard := Stringmob
return
}

CopyExamplesSpeedTLNENBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Please contact us on 080066066 regarding case (%Scid%) related to %Problemshort%. If you are still experiencing trouble, please provide recent examples from the last three days before your contact + start date of the problem. Each example should include: location (full address), date, time, speedtest (speedtest.telenet.be), problem description per example.
)
clipboard := Stringmob
return
}

; CALLBACK EXAMPLES REMINDER

CallbackReminderTLNBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET BUSINESS SMS REMINDER
Gui, Add, Text,, 
Gui, add, Text,, PEGA SC-ID
Gui, Add, Edit, vScid, 
Gui, Add, Text,, ISSUE (Short)
Gui, Add, Edit, vProblemshort
Gui, Add, Button, gCopyCallbackReminderTLNNLBus, COPY NL
Gui, Add, Button, gCopyCallbackReminderTLNFRBus, COPY FR
Gui, Add, Button, gCopyCallbackReminderTLNENBus, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gCallbackMenuTLNBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyCallbackReminderTLNNLBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Helaas ontvingen we nog geen feedback in verband met uw dossier (%Scid%) over %Problemshort%. Gelieve via 080066066 door te geven of u nog een probleem ervaart. Indien ja, gelieve dan alle eerder gevraagde informatie te voorzien. Opgelet: zonder feedback zal het dossier afgesloten worden.
)
clipboard := Stringmob
return
}

CopyCallbackReminderTLNFRBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Malheureusement, nous n'avons pas encore reçu de retour d'information concernant votre dossier (%Scid%) concernant %Problemshort%. Veuillez nous informer par l'intermédiaire de 080066066 si le problème persiste. Si c'est le cas, veuillez fournir toutes les informations demandées précédemment. Attention: sans retour d'information, le dossier sera clôturé.
)
clipboard := Stringmob
return
}

CopyCallbackReminderTLNENBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Unfortunately, we did not yet receive any feedback regarding your case (%Scid%) related to %Problemshort%. Please let us know via 080066066 if you are still experiencing a problem. If so, please provide all previously requested information. Please note: without feedback, the file will be closed.
)
clipboard := Stringmob
return
}

; MNP REJECT MENU

SMSMnpRejectTLNBus()
{
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET BUSINESS SMS MNP
Gui, Add, Text,, 
Gui, Add, Button, gNoInfoMNPTLNBus, NO REQUEST - NO INFO
Gui, Add, Button, gReject100MenuTLNBus, REJECTCODE 100 (Not Active)
Gui, Add, Button, gReject115TLNBus, REJECTCODE 115 (Mismatch Simcardnr OLO)
Gui, Add, Button, gReject120TLNBus, REJECTCODE 120 (Mismatch Customernr OLO)
Gui, Add, Button, gMNPCancelTLNBus, MNP CANCEL
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetBusMob, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

; NO INFO MNP

NoInfoMNPTLNBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET BUSINESS NO REQUEST - NO INFO
Gui, Add, Text,, 
Gui, add, Text,, MSISDN
Gui, Add, Edit, vMSISDN,
Gui, Add, Button, gCopyNoInfoMNPTLNBusNL, COPY NL
Gui, Add, Button, gCopyNoInfoMNPTLNBusFR, COPY FR
Gui, Add, Button, gCopyNoInfoMNPTLNBusEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gSMSMnpRejectTLNBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyNoInfoMNPTLNBusNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: We hebben de overname van uw GSM %MSISDN% nog niet kunnen opstarten omdat er een aantal gegevens ontbreken. Gelieve ons het klant- en simkaartnummer van uw huidige provider te bezorgen via 080066778 of https://www.telenet.be/nummeroverdracht.
)
clipboard := Stringmob
return
}

CopyNoInfoMNPTLNBusFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Nous n'avons pas encore pu lancer la reprise de votre GSM %MSISDN% car certaines informations sont manquantes. Veuillez nous communiquer le numéro de client et de carte SIM de votre fournisseur actuel via 080066778 ou https://www.telenet.be/nummeroverdracht.
)
clipboard := Stringmob
return
}

CopyNoInfoMNPTLNBusEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: We have not yet been able to initiate the transfer of your GSM %MSISDN% due to missing information. Please send us the customer number and SIM card number of your current operator via 080066778 or https://www.telenet.be/nummeroverdracht.
)
clipboard := Stringmob
return
}

; MNP 100 MENU

Reject100MenuTLNBus()
{
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET BUSINESS SMS MNP REJECT
Gui, Add, Text,, 
Gui, Add, Button, gReject100ProxTLNBus, NOT ACTIVE - PROXIMUS
Gui, Add, Button, gReject100OtherTLNBus, NOT ACTIVE - OTHER OLO
Gui, add, Text,, 
Gui, Add, Button, gSMSMnpRejectTLNBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

; MNP 100 PROX

Reject100ProxTLNBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET REJECTCODE 100 - PROXIMUS
Gui, Add, Text,, 
Gui, add, Text,, MSISDN
Gui, Add, Edit, vMSISDN,
Gui, Add, Button, gCopyReject100ProxTLNBusNL, COPY NL
Gui, Add, Button, gCopyReject100ProxTLNBusFR, COPY FR
Gui, Add, Button, gCopyReject100ProxTLNBusEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gReject100MenuTLNBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyReject100ProxTLNBusNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Gelieve met GSM %MSISDN% naar het gratis nummer 080066778 te bellen om deze op uw netwerk te heractiveren. Zo kunnen wij deze overdragen naar Telenet.
)
clipboard := Stringmob
return
}

CopyReject100ProxTLNBusFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Veuillez appeler le numéro gratuit 080066778 avec numéro %MSISDN% pour le réactiver sur votre réseau. Ainsi, nous pouvons le transférer à Telenet.
)
clipboard := Stringmob
return
}

CopyReject100ProxTLNBusEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Please call freephone 080066778 with mobile phone %MSISDN% to reactivate it on your network. This will allow us to transfer it to Telenet.
)
clipboard := Stringmob
return
}

; MNP 100 OTHER

Reject100OtherTLNBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET REJECTCODE 100 - OTHER OLO
Gui, Add, Text,, 
Gui, add, Text,, MSISDN
Gui, Add, Edit, vMSISDN,
Gui, Add, Button, gCopyReject100OtherTLNBusNL, COPY NL
Gui, Add, Button, gCopyReject100OtherTLNBusFR, COPY FR
Gui, Add, Button, gCopyReject100OtherTLNBusEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gReject100MenuTLNBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyReject100OtherTLNBusNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Gelieve contact op te nemen met uw huidige operator om uw nummer %MSISDN% te heractiveren. Op die manier kunnen wij uw portering naar Telenet voltooien.
)
clipboard := Stringmob
return
}

CopyReject100OtherTLNBusFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Veuillez contacter votre opérateur actuel pour réactiver votre numéro %MSISDN%. Cela nous permettra de finaliser votre portage vers Telenet.
)
clipboard := Stringmob
return
}

CopyReject100OtherTLNBusEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Please contact your current operator to reactivate your number %MSISDN%. This will allow us to complete your porting to Telenet.
)
clipboard := Stringmob
return
}

; MNP 115

Reject115TLNBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET BUSINESS REJECTCODE 115
Gui, Add, Text,, 
Gui, Add, Text,, OLO SIM CARDNUMBER
Gui, Add, Edit, vSIMOLO,
Gui, Add, Button, gCopyReject115TLNBusNL, COPY NL
Gui, Add, Button, gCopyReject115TLNBusFR, COPY FR
Gui, Add, Button, gCopyReject115TLNBusEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gSMSMnpRejectTLNBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyReject115TLNBusNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: We hebben een aanvraag gestart met SIM-kaartnummer %SIMOLO% van uw huidige provider. Deze is helaas geweigerd. Gelieve ons het correcte SIM-kaartnummer van uw huidige operator te bezorgen via https://www.telenet.be/nummeroverdracht of telefonisch op 080066066.
)
clipboard := Stringmob
return
}

CopyReject115TLNBusFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Nous avons lancé une demande avec le numéro de carte SIM %SIMOLO% de votre fournisseur actuel. Elle a malheureusement été refusée. Veuillez nous communiquer le numéro de carte SIM correct de votre opérateur actuel à l'adresse https://www.telenet.be/nummeroverdracht ou par téléphone à l'adresse 080066066.
)
clipboard := Stringmob
return
}

CopyReject115TLNBusEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: We have started a request with SIM card number %SIMOLO% from your current provider. This has unfortunately been refused. Please provide us with the correct SIM card number of your current operator at https://www.telenet.be/nummeroverdracht or by phone at 080066066.
)
clipboard := Stringmob
return
}

; MNP 120

Reject120TLNBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET BUSINESS REJECTCODE 120
Gui, Add, Text,, 
Gui, Add, Text,, OLO CUSTOMER NUMBER
Gui, Add, Edit, vCMRNROLO,
Gui, Add, Button, gCopyReject120TLNBusNL, COPY NL
Gui, Add, Button, gCopyReject120TLNBusFR, COPY FR
Gui, Add, Button, gCopyReject120TLNBusEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gSMSMnpRejectTLNBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyReject120TLNBusNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: We hebben een aanvraag gestart met klantnummer %CMRNROLO% van uw huidige provider. Deze is helaas geweigerd. Gelieve ons het correcte klantnummer van uw huidige operator te bezorgen via https://www.telenet.be/nummeroverdracht of telefonisch op 080066066.
)
clipboard := Stringmob
return
}

CopyReject120TLNBusFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Nous avons lancé une demande avec le numéro de client %CMRNROLO% de votre fournisseur actuel. Elle a malheureusement été refusée. Veuillez nous communiquer le numéro de client correct de votre opérateur actuel à l'adresse https://www.telenet.be/nummeroverdracht ou par téléphone à l'adresse 080066066.
)
clipboard := Stringmob
return
}

CopyReject120TLNBusEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: We have started a request with customer number %CMRNROLO% from your current provider. This has unfortunately been refused. Please provide us with the correct customer number of your current operator at https://www.telenet.be/nummeroverdracht or by phone at 080066066.
)
clipboard := Stringmob
return
}

; MNP CANCEL

MNPCancelTLNBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET BUSINESS MNP CANCEL
Gui, Add, Text,, 
Gui, Add, Text,, MSISDN
Gui, Add, Edit, vMSISDN,
Gui, Add, Button, gCopyMNPCancelTLNBusNL, COPY NL
Gui, Add, Button, gCopyMNPCancelTLNBusFR, COPY FR
Gui, Add, Button, gCopyMNPCancelTLNBusEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gSMSMnpRejectTLNBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyMNPCancelTLNBusNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Helaas kregen we niet voldoende informatie om je nummeroverdracht voor het nummer %MSISDN% af te ronden. Deze werd daarom geannuleerd. Een nieuwe registratie is mogelijk via onze website, een winkelpunt of onze klantendienst.
)
clipboard := Stringmob
return
}

CopyMNPCancelTLNBusFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Malheureusement, nous n'avons pas reçu suffisamment d'informations pour effectuer votre transfert de numéro pour le numéro %MSISDN%. Celui-ci a donc été annulé. Un nouvel enregistrement est possible via notre site web, un point de vente ou notre service clientèle.
)
clipboard := Stringmob
return
}

CopyMNPCancelTLNBusEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Unfortunately, we did not receive sufficient information to complete your number transfer for the number %MSISDN%. This was therefore cancelled. A new registration is possible via our website, a retail outlet or our customer service.
)
clipboard := Stringmob
return
}

; IT TICKET MENU

ItTicketSmsTLNBus()
{
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET BUSINESS SMS IT TICKET
Gui, Add, Text,, 
Gui, Add, Button, gItNewBusNL, NEW TICKET
Gui, Add, Button, gItUpdateBusNL, UPDATE TICKET
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetBusMob, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

; IT TICKET NEW

ItNewBusNL()
{
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET BUSINESS SMS NEW TICKET
Gui, Add, Text,, 
Gui, Add, Button, gCopyItBusNL, COPY NL
Gui, Add, Button, gCopyItBusFR, COPY FR
Gui, Add, Button, gCopyItBusEN, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gItTicketSmsTLNBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyItBusNL()
{
Stringit =
(
Telenet-Business: We hebben je dossier doorgestuurd naar onze IT-dienst en houden je op de hoogte. Bedankt voor uw geduld.
)
clipboard := Stringit
return
}

CopyItBusFR()
{
Stringit =
(
Telenet-Business: Nous avons transmis votre dossier à notre département IT et vous tiendrons au courant. Nous vous remercions de votre patience.
)
clipboard := Stringit
return
}

CopyItBusEN()
{
Stringit =
(
Telenet-Business: We have forwarded your case to our IT department and will keep you updated. Thank you for your patience.
)
clipboard := Stringit
return
}

; IT TICKET UPDATE

ItUpdateBusNL()
{
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET BUSINESS SMS UPDATE TICKET
Gui, Add, Text,, 
Gui, Add, Button, gCopyItUpdateBusNL, COPY NL
Gui, Add, Button, gCopyItUpdateBusFR, COPY FR
Gui, Add, Button, gCopyItUpdateBusEN, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gItTicketSmsTLNBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyItUpdateBusNL()
{
Stringitupdate =
(
Telenet-Business: Momenteel hebben we nog geen oplossing voor uw dossier. Onze IT-dienst werkt eraan. Bedankt voor uw geduld.
)
clipboard := Stringitupdate
return
}

CopyItUpdateBusFR()
{
Stringitupdate =
(
Telenet-Business: Actuellement, nous n'avons pas encore de solution pour votre dossier. Notre département IT y travaille. Nous vous remercions de votre patience.
)
clipboard := Stringitupdate
return
}

CopyItUpdateBusEN()
{
Stringitupdate =
(
Telenet-Business: Currently, we do not yet have a solution for your case. Our IT department is working on it. Thank you for your patience.
)
clipboard := Stringitupdate
return
}

; CROSSTEST MENU

CrosstestMenuSmsTLNBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET BUSINESS SMS CROSSTTEST
Gui, Add, Text,, 
Gui, Add, Button, gCrosstestTLNBus, CROSSTEST
Gui, Add, Button, gCrossReminderTLNBus, REMINDER CROSSTEST
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetBusMob, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

; CROSSTEST NEW

CrosstestTLNBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET BUSINESS SMS CROSSTEST
Gui, Add, Text,, 
Gui, add, Text,, PEGA SC-ID
Gui, Add, Edit, vScid, 
Gui, Add, Text,, ISSUE (Short)
Gui, Add, Edit, vProblemshort
Gui, Add, Button, gCopyCrosstestTLNNLBus, COPY NL
Gui, Add, Button, gCopyCrosstestTLNFRBus, COPY FR
Gui, Add, Button, gCopyCrosstestTLNENBus, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gCrosstestMenuSmsTLNBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyCrosstestTLNNLBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: In verband met uw dossier (%Scid%) over %Problemshort%. Gelieve opnieuw te testen met uw SIM in een ander toestel en via de klantendienst (080066066) door te geven of u nog een probleem ervaart. Indien ja, gelieve dan recente voorbeelden te voorzien. Elk voorbeeld moet bevatten: datum, tijdstip, contactnr, locatie (volledig adres) en probleemomschrijving per voorbeeld.
)
clipboard := Stringmob
return
}

CopyCrosstestTLNFRBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Concernant votre dossier (%Scid%) concernant %Problemshort%. Veuillez refaire un test avec votre carte SIM dans un autre appareil et faites-nous savoir par l'intermédiaire du service clientèle (080066066) si le problème persiste. Si oui, veuillez fournir des exemples récents. Chaque exemple doit inclure: la date, l'heure, le numéro de contact, le lieu (adresse complète) et la description du problème par exemple.
)
clipboard := Stringmob
return
}

CopyCrosstestTLNENbus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Regarding your case (%Scid%) related to %Problemshort%. Please retest with your SIM in another device and let us know via customer service (080066066) if you are still experiencing a problem. If yes, please provide recent examples. Each example should include: date, time, contact no, location (full address) and problem description per example.
)
clipboard := Stringmob
return
}

; CROSSTEST REMINDER

CrossReminderTLNBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET BUSINESS SMS CROSSTEST REMINDER
Gui, Add, Text,, 
Gui, Add, Button, gCopyCrossReminderTLNNLBus, COPY NL
Gui, Add, Button, gCopyCrossReminderTLNFRBus, COPY FR
Gui, Add, Button, gCopyCrossReminderTLNENBus, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gCrosstestMenuSmsTLNBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyCrossReminderTLNNLBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Gelieve via de klantendienst (080066066) door te geven of u nog een probleem heeft ervaren toen u uw simkaart testte in een ander toestel. Indien ja, gelieve dan recente voorbeelden te voorzien. Elk voorbeeld moet bevatten: datum, tijdstip, contactnr, locatie (volledig adres) en probleemomschrijving per voorbeeld.
)
clipboard := Stringmob
return
}

CopyCrossReminderTLNFRBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Veuillez nous faire savoir par l'intermédiaire du service clientèle (080066066) si vous avez rencontré un autre problème lorsque vous avez testé votre carte SIM dans un autre appareil. Dans l'affirmative, veuillez fournir des exemples récents. Chaque exemple doit comprendre: la date, l'heure, le numéro de contact, le lieu (adresse complète) et la description du problème par exemple.
)
clipboard := Stringmob
return
}

CopyCrossReminderTLNENBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Please let us know via customer service (080066066) if you have experienced another problem when you tested your SIM card in another device. If yes, please provide recent examples. Each example should include: date, time, contact no, location (full address) and problem description per example.
)
clipboard := Stringmob
return
}

; VOICE2.0 MENU

VowifiMenuTLNBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET BUSINESS SMS VOICE2.0
Gui, Add, Text,, 
Gui, Add, Button, gVowifiActiveTLNBus, ACTIVE / CERTIFIED
Gui, Add, Button, gVowifiDeviceTLNBus, DEVICE NOK
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetBusMob, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

; VOICE2.0 ACTIVE

VowifiActiveTLNBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET BUSINESS SMS VOICE2.0
Gui, Add, Text,, 
Gui, Add, Button, gCopyVowifiTLNBusNL, COPY NL
Gui, Add, Button, gCopyVowifiTLNBusFR, COPY FR
Gui, Add, Button, gCopyVowifiTLNBusEN, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gVowifiMenuTLNBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyVowifiTLNBusNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Bellen over 4G (VoLTE) en bellen over WiFi (VoWiFi) werd voor u geactiveerd op het netwerk. Gelieve na te kijken dat op uw toestel de laatste updates van de fabrikant geinstalleerd zijn. Activeer Voice over WiFi via de instellingen en herstart hierna uw toestel. Meer info: https://www2.telenet.be/business/nl/klantenservice/mobiele-telefonie/mobiel-instellen-en-gebruiken/mobiel-bellen-en-surfen-via-4g
)
clipboard := Stringmob
return
}

CopyVowifiTLNBusFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: les appels sur la 4G (VoLTE) et les appels sur le WiFi (VoWiFi) ont été activés pour vous sur le réseau. Veuillez vérifier que les dernières mises à jour du fabricant sont installées sur votre appareil. Activez Voice over WiFi via les paramètres et redémarrez ensuite votre appareil. Info: https://www2.telenet.be/business/fr/serviceclient/telephonie-mobile/configurer-et-utiliser-le-mobile/appels-et-navigation-mobiles-via-la-4G/
)
clipboard := Stringmob
return
}

CopyVowifiTLNBusEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Calling over 4G (VoLTE) and calling over WiFi (VoWiFi) has been activated for you on the network. Please check that the latest manufacturer updates are installed on your device. Activate Voice over WiFi via the settings and then reboot your device. More info: https://www2.telenet.be/business/nl/klantenservice/mobiele-telefonie/mobiel-instellen-en-gebruiken/mobiel-bellen-en-surfen-via-4g
)
clipboard := Stringmob
return
}

; VOICE2.0 DEVICE NOK

VowifiDeviceTLNBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET BUSINESS SMS VOICE2.0
Gui, Add, Text,, 
Gui, Add, Button, gCopyVowifiDeviceTLNBusNL, COPY NL
Gui, Add, Button, gCopyVowifiDeviceTLNBusFR, COPY FR
Gui, Add, Button, gCopyVowifiDeviceTLNBusEN, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gVowifiMenuTLNBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyVowifiDeviceTLNBusNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Helaas is uw huidige toestel (nog) niet compatibel met VoLTE (voice over LTE) en VoWiFi (voice over WiFi). Meer info op: https://www2.telenet.be/nl/business/klantenservice/hoe-mobiel-bellen-via-4g-en-wifi1/
)
clipboard := Stringmob
return
}

CopyVowifiDeviceTLNBusFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Malheureusement, votre appareil actuel n'est pas (encore) compatible avec VoLTE (voice over LTE) et VoWiFi (voice over WiFi). Plus d'informations : https://www2.telenet.be/fr/business/serviceclient/hoe-mobiel-bellen-via-4g-en-wifi/
)
clipboard := Stringmob
return
}

CopyVowifiDeviceTLNBusEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Unfortunately, your current device is not (yet) compatible with VoLTE (voice over LTE) and VoWiFi (voice over WiFi). More info at: https://www2.telenet.be/nl/business/klantenservice/hoe-mobiel-bellen-via-4g-en-wifi/
)
clipboard := Stringmob
return
}

; COVERAGE MENU

CoverageTLNBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET BUSINESS SMS COVERAGE
Gui, Add, Text,, 
Gui, Add, Button, gIncidentTLNBus, ONGOING INCIDENT (GIS)
Gui, Add, Button, gOneTTLNBus, ONE-T CHANGE
Gui, Add, Button, gOneTReminderTLNBus, REMINDER ONE-T CHANGE
Gui, Add, Button, gNoCoverageTLNBus, NO COVERAGE
Gui, Add, Button, gDegradationTLNBus, DEGRADATION
Gui, Add, Button, gRoamingTLNBus, ROAMING
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetBusMob, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

; ONGOING INCIDENT

IncidentTLNBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET SMS ONGOING INCIDENT
Gui, Add, Text,, 
Gui, Add, Button, gCopyIncidentTLNNLBus, COPY NL
Gui, Add, Button, gCopyIncidentTLNFRBus, COPY FR
Gui, Add, Button, gCopyIncidentTLNENBus, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gCoverageTLNBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyIncidentTLNNLBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Er is momenteel een probleem vastgesteld op de zendmast in uw regio. We doen er alles aan om dit probleem zo snel mogelijk op te lossen. Onze exuses voor het ongemak.
)
clipboard := Stringmob
return
}

CopyIncidentTLNFRBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Un problème a été identifié sur le mât de transmission dans votre région. Nous mettons tout en œuvre pour résoudre ce problème dans les plus brefs délais. Nous vous prions de nous excuser pour la gêne occasionnée.
)
clipboard := Stringmob
return
}

CopyIncidentTLNENBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: A problem has currently been identified on the transmission mast in your area. We are making every effort to solve this problem as soon as possible. Our apologies for the inconvenience.
)
clipboard := Stringmob
return
}

; ONE T CHANGE

OneTTLNBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET BUSINESS SMS ONE-T CHANGE
Gui, Add, Text,, 
Gui, Add, Button, gCopyOneTTLNNLBus, COPY NL
Gui, Add, Button, gCopyOneTTLNFRBus, COPY FR
Gui, Add, Button, gCopyOneTTLNENBus, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gCoverageTLNBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyOneTTLNNLBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: I.v.m. uw dossier werd een aanpassing uitgevoerd op het netwerk. Gelieve enkele dagen te testen en via de klantendienst (080066066) door te geven of u nog een probleem ervaart. Indien ja, gelieve dan recente voorbeelden te voorzien vanaf de dag van deze SMS. Elk voorbeeld moet bevatten: datum, tijdstip, contactnr, volledig adres, probleemomschrijving per voorbeeld.
)
clipboard := Stringmob
return
}

CopyOneTTLNFRBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Une adaptation du réseau a été effectuée en rapport avec votre dossier. Veuillez tester pendant quelques jours et nous faire savoir par l'intermédiaire du service clientèle (080066066) si vous rencontrez toujours un problème. Dans l'affirmative, veuillez fournir des exemples récents à partir du jour de ce SMS. Chaque exemple doit comprendre: la date, l'heure, le numéro de contact, adresse, la description du problème par exemple.
)
clipboard := Stringmob
return
}

CopyOneTTLNENBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: An adjustment was made to the network in connection with your case. Please test for a few days and let us know via customer service (080066066) if you are still experiencing a problem. If yes, please provide recent examples from the day of this SMS. Each example should include: date, time, contact nr, full address, problem description per example.
)
clipboard := Stringmob
return
}

; ONE T REMINDER

OneTReminderTLNBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET BUSINESS SMS ONE-T REMINDER
Gui, Add, Text,, 
Gui, Add, Button, gCopyOneTReminderTLNNLBus, COPY NL
Gui, Add, Button, gCopyOneTReminderTLNFRBus, COPY FR
Gui, Add, Button, gCopyOneTReminderTLNENBus, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gCoverageTLNBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyOneTReminderTLNNLBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: We hebben helaas nog geen feedback ontvangen. Gelieve via de klantendienst (080066066) door te geven of u nog een probleem ervaart. Indien ja, gelieve dan recente voorbeelden te voorzien van de laatste drie dagen. Elk voorbeeld moet bevatten: datum, tijdstip, contactnr, probleemomschrijving per voorbeeld.
)
clipboard := Stringmob
return
}

CopyOneTReminderTLNFRBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Malheureusement, nous n'avons pas encore reçu de commentaires. Veuillez contacter le service clientèle (080066066) si vous rencontrez toujours un problème. Dans l'affirmative, veuillez fournir des exemples récents des trois derniers jours. Chaque exemple doit comprendre: la date, l'heure, le numéro de contact, la description du problème par exemple.
)
clipboard := Stringmob
return
}

CopyOneTReminderTLNENBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Unfortunately, we have not yet received any feedback. Please pass on via customer service (080066066) if you are still experiencing a problem. If yes, please provide recent examples from the last three days. Each example should include: date, time, contact no, problem description per example.
)
clipboard := Stringmob
return
}

; NO COVERAGE

NoCoverageTLNBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET BUSINESS SMS NO COVERAGE
Gui, Add, Text,, 
Gui, Add, Button, gCopyNoCoverageTLNNLBus, COPY NL
Gui, Add, Button, gCopyNoCoverageTLNFRBus, COPY FR
Gui, Add, Button, gCopyNoCoverageTLNENBus, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gCoverageTLNBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyNoCoverageTLNNLBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Helaas is het bereik op het opgegeven adres niet ideaal. We hopen hier in de toekomst verbetering in te brengen. In de tussentijd raden we aan om voor uw gesprekken via Voice over WiFi altijd dicht in de buurt van uw WiFi zendstation te blijven.
)
clipboard := Stringmob
return
}

CopyNoCoverageTLNFRBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Malheureusement, la couverture à l'adresse indiquée n'est pas idéale. Nous espérons pouvoir l'améliorer à l'avenir. En attendant, nous vous recommandons de toujours rester à proximité de votre station d'émission WiFi pour vos appels Voice over WiFi.
)
clipboard := Stringmob
return
}

CopyNoCoverageTLNENBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Unfortunately, the coverage at the given address is not ideal. We hope to improve this in the future. In the meantime, we recommend always staying close to your WiFi transmitting station for your Voice over WiFi calls.
)
clipboard := Stringmob
return
}

; DEGRADATION

DegradationTLNBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET BUSINESS SMS DEGRADATION
Gui, Add, Text,, 
Gui, add, Text,, MSISDN
Gui, Add, Edit, vMSISDN, 
Gui, Add, Button, gCopyDegradationTLNNLBus, COPY NL
Gui, Add, Button, gCopyDegradationTLNFRBus, COPY FR
Gui, Add, Button, gCopyDegradationTLNENBus, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gCoverageTLNBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyDegradationTLNNLBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Uw nummer %MSISDN% veroorzaakt momenteel storing op het Telenet radionetwerk. Gelieve deze stappen te volgen om ons te helpen het probleem op te lossen. Controleer of u de laatste updates van je fabrikant hebt. Herstart uw toestel.
)
clipboard := Stringmob
return
}

CopyDegradationTLNFRBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Votre numéro %MSISDN% provoque actuellement des interférences sur le réseau radio de Telenet. Veuillez suivre les étapes suivantes pour nous aider à résoudre le problème. Assurez-vous que vous disposez des dernières mises à jour de votre fabricant. Redémarrez votre appareil.
)
clipboard := Stringmob
return
}

CopyDegradationTLNENBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Your number %MSISDN% is currently causing interference on the Telenet radio network. Please follow these steps to help us solve the problem. Make sure you have the latest updates from your manufacturer. Reboot your device.
)
clipboard := Stringmob
return
}

; ROAMING

RoamingTLNBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET BUSINESS SMS ROAMING
Gui, Add, Text,, 
Gui, Add, Button, gCopyRoamingTLNNLBus, COPY NL
Gui, Add, Button, gCopyRoamingTLNFRBus, COPY FR
Gui, Add, Button, gCopyRoamingTLNENBus, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gCoverageTLNBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyRoamingTLNNLBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Indien u in de toekomst een probleem ervaart met het verbinden met een roaming netwerk, gelieve dan manueel naar netwerken te zoeken, met elke zichtbare operator 5 verbindingspogingen op te zetten en indien problemen de volgende informatie door te geven per poging: datum, tijdstip, naam netwerk, eventuele foutmelding.
)
clipboard := Stringmob
return
}

CopyRoamingTLNFRBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Si vous rencontrez un problème de connexion à un réseau d'itinérance à l'avenir, veuillez rechercher les réseaux manuellement, effectuer cinq tentatives de connexion avec chaque opérateur visible et, en cas de problème, fournir les informations suivantes pour chaque tentative: date, heure, nom du réseau, message d'erreur éventuel.
)
clipboard := Stringmob
return
}

CopyRoamingTLNENBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: If you experience a problem connecting to a roaming network in the future, please search for networks manually, set up 5 connection attempts with each visible operator and if problems, provide the following information for each attempt: date, time, network name, any error message.
)
clipboard := Stringmob
return
}

; ESIM MENU

EsimTLNBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET BUSINESS SMS ESIM / ONE NUMBER
Gui, Add, Text,, 
Gui, Add, Button, gEsimActiveTLNBus, ESIM ACTIVATION
Gui, Add, Button, gEsimDeActiveTLNBus, ESIM DEACTIVATION & ACTIVATION
Gui, Add, Button, gEsimDeviceTLNBus, DEVICE NOK
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetBusMob, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

; ESIM ACTIVE

EsimActiveTLNBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET BUSINESS SMS ESIM ACTIVATION
Gui, Add, Text,, 
Gui, Add, Button, gCopyEsimActiveTLNNLBus, COPY NL
Gui, Add, Button, gCopyEsimActiveTLNFRBus, COPY FR
Gui, Add, Button, gCopyEsimActiveTLNENBus, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gEsimTLNBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyEsimActiveTLNNLBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Gelieve uw gsm en smartwatch te herstarten, opnieuw te proberen om uw smartwatch te koppelen, en de klantendienst (080066066) te informeren of u nog een probleem ervaart. Indien ja, gelieve door te geven in welke stap dit faalt en welke informatie op dat moment ingegeven wordt + datum & tijdstip + foutmelding + type watch + EID van de watch.
)
clipboard := Stringmob
return
}

CopyEsimActiveTLNFRBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Veuillez redémarrer votre téléphone portable et votre smartwatch, essayez à nouveau de coupler votre smartwatch et informez le service clientèle (080066066) si le problème persiste. Dans l'affirmative, veuillez indiquer à quelle étape l'opération a échoué et quelles informations sont actuellement saisies: date et heure, message d'erreur, type de montre et numéro d'identification de la montre.
)
clipboard := Stringmob
return
}

CopyEsimActiveTLNENBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Please reboot your mobile phone and smartwatch, try again to pair your smartwatch, and inform customer service (080066066) if you are still experiencing a problem. If yes, please pass on in which step this fails and what information is currently entered + date & time + error message + watch type + watch EID.
)
clipboard := Stringmob
return
}

; ESIM DEACTIVATE ACTIVE

EsimDeActiveTLNBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE SMS ESIM DEACTIVATION & ACTIVATION
Gui, Add, Text,, 
Gui, Add, Button, gCopyEsimDeActiveTLNNLBus, COPY NL
Gui, Add, Button, gCopyEsimDeActiveTLNFRBus, COPY FR
Gui, Add, Button, gCopyEsimDeActiveTLNENBus, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gEsimTLNBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyEsimDeActiveTLNNLBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Gelieve uw smartwatch te ontkoppelen via Mijn Telenet en dan uw gsm en smartwatch te herstarten. Gelieve daarna opnieuw te proberen om uw smartwatch te koppelen en de klantendienst (080066066) te informeren of u nog een probleem ervaart. Indien ja, gelieve door te geven in welke stap dit faalt en welke informatie op dat moment ingegeven wordt + datum & tijdstip + foutmelding + type watch + EID van de watch.
)
clipboard := Stringmob
return
}

CopyEsimDeActiveTLNFRBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Veuillez déconnecter votre smartwatch via My Telenet et redémarrer votre téléphone mobile et votre smartwatch. Ensuite, essayez à nouveau de coupler votre smartwatch et informez le service clientèle (080066066) si le problème persiste. Dans l'affirmative, veuillez indiquer à quelle étape l'opération a échoué et quelles informations sont actuellement saisies + date et heure + message d'erreur + type de montre + EID de la montre.
)
clipboard := Stringmob
return
}

CopyEsimDeActiveTLNENBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Please disconnect your smartwatch via My Telenet and then reboot your cell phone and smartwatch. After that, please try to pair your smartwatch again and inform customer service (080066066) if you are still experiencing a problem. If yes, please indicate in which step this fails and what information is entered at that time + date & time + error message + type of watch + EID of the watch.
)
clipboard := Stringmob
return
}

; ESIM DEVICE NOK

EsimDeviceTLNBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET BUSINESS SMS ESIM DEVICE NOK
Gui, Add, Text,, 
Gui, Add, Button, gCopyEsimDeviceTLNNLBus, COPY NL
Gui, Add, Button, gCopyEsimDeviceTLNFRBus, COPY FR
Gui, Add, Button, gCopyEsimDeviceTLNENBus, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gEsimTLNBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyEsimDeviceTLNNLBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Helaas worden voor Smartwatches van Samsung enkel koppelingen ondersteund met de Samsung smartphones. Meer info op: https://www2.telenet.be/nl/klantenservice/alles-over-telenet-one-number/
)
clipboard := Stringmob
return
}

CopyEsimDeviceTLNFRBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Malheureusement, pour les Smartwatches Samsung, seuls les couplages avec les smartphones Samsung sont pris en charge. Plus d'informations : https://www2.telenet.be/fr/klantenservice/alles-over-telenet-one-number/
)
clipboard := Stringmob
return
}

CopyEsimDeviceTLNENBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Unfortunately, for Samsung Smartwatches, only pairings are supported with Samsung smartphones. More info at: https://www2.telenet.be/nl/klantenservice/alles-over-telenet-one-number/
)
clipboard := Stringmob
return
}

; ROUTING OLO OK

RoutingOLOTLNBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET BUSINESS SMS ROUTING OLO OK
Gui, Add, Text,, 
Gui, Add, Button, gCopyRoutingOLOTLNNLBus, COPY NL
Gui, Add, Button, gCopyRoutingOLOTLNFRBus, COPY FR
Gui, Add, Button, gCopyRoutingOLOTLNENBus, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetBusMob, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyRoutingOLOTLNNLBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: We hebben contact gehad met de operator van de nummer(s) die u niet kunnen bereiken en krijgen de bevestiging dat het in orde moet zijn. Indien er alsnog een probleem is moet de beller contact opnemen met de eigen operator.
)
clipboard := Stringmob
return
}

CopyRoutingOLOTLNFRBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: Nous avons contacté l'opérateur du (des) numéro(s) qui ne peut pas vous joindre et nous avons reçu la confirmation que cela devrait aller. Si le problème persiste, l'appelant doit contacter son propre opérateur.
)
clipboard := Stringmob
return
}

CopyRoutingOLOTLNENBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
Telenet-Business: We have contacted the operator of the number(s) that cannot reach you and receive confirmation that it should be OK. If there is still a problem, the caller should contact their own operator.
)
clipboard := Stringmob
return
}

; SMS BASE

SmsBASE()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, BASE SMS TEMPLATES
Gui, Add, Text,, 
Gui, Add, Button, gSmsBASERes, RESIDENTIAL
Gui, Add, Button, gSmsBASEBus, BUSINESS
Gui, add, Text,, 
Gui, Add, Button, gSMS, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

; SMS BASE RESIDENTIAL

SmsBASERes()
{
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE RESIDENTIAL SMS
Gui, Add, Text,, 
Gui, Add, Button, gIssueFixedBASE, ISSUE FIXED
Gui, Add, Button, gSystemOKBASE, SYSTEM OK, CHECK DEVICE
Gui, Add, Button, gSimBASERes, SIM ACTIVATION
Gui, Add, Button, gCallBackMenuBASE, CALLBACK
Gui, Add, Button, gSMSMnpRejectBASE, MNP
Gui, Add, Button, gItTicketSmsBASE, IT TICKET
Gui, Add, Button, gCrosstestMenuSmsBASE, CROSSTEST
Gui, Add, Button, gVowifiMenuBASE, VOICE2.0
Gui, Add, Button, gCoverageBASE, COVERAGE
Gui, Add, Button, gPIDBASE, PID
Gui, Add, Button, gEsimBASE, ESIM / ONE NUMBER
Gui, Add, Button, gRoutingOLOBASE, ROUTING OLO OK
Gui, add, Text,, 
Gui, Add, Button, gSmsBASE, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

; ISSUE FIXED

IssueFixedBASE()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE SMS ISSUE FIXED
Gui, Add, Text,, 
Gui, add, Text,, PEGA SC-ID
Gui, Add, Edit, vScid, 
Gui, Add, Text,, ISSUE (Short)
Gui, Add, Edit, vProblemshort
Gui, Add, Button, gCopyIssueFixedBASENL, COPY NL
Gui, Add, Button, gCopyIssueFixedBASEFR, COPY FR
Gui, Add, Button, gCopyIssueFixedBASEEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gSmsBASERes, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyIssueFixedBASENL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Uw dossier (%Scid%) over %Problemshort% werd opgevolgd. Gelieve uw toestel te herstarten.
)
clipboard := Stringmob
return
}

CopyIssueFixedBASEFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Votre dossier (%Scid%) concernant %Problemshort% a été suivi. Veuillez redémarrer votre appareil.
)
clipboard := Stringmob
return
}

CopyIssueFixedBASEEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Your case (%Scid%) related to %Problemshort% was followed up. Please restart your device.
)
clipboard := Stringmob
return
}

; SYSTEM OK

SystemOKBASE()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE SMS SYSTEM OK
Gui, Add, Text,, 
Gui, add, Text,, PEGA SC-ID
Gui, Add, Edit, vScid, 
Gui, Add, Text,, ISSUE (Short)
Gui, Add, Edit, vProblemshort
Gui, Add, Button, gCopySystemOKBASENL, COPY NL
Gui, Add, Button, gCopySystemOKBASEFR, COPY FR
Gui, Add, Button, gCopySystemOKBASEEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gSmsBASERes, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopySystemOKBASENL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: In verband met uw dossier (%Scid%) over %Problemshort%. Bij nazicht in onze systemen staat alles juist. Gelieve uw instellingen na te kijken en uw toestel te herstarten.
)
clipboard := Stringmob
return
}

CopySystemOKBASEFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Concernant votre dossier (%Scid%) sur %Problemshort%. Après examen dans nos systèmes, tout est correct. Veuillez vérifier vos paramètres et redémarrer votre appareil.
)
clipboard := Stringmob
return
}

CopySystemOKBASEEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Regarding your case (%Scid%) on %Problemshort%. When checking in our systems, everything is correct. Please check your settings and reboot your device.
)
clipboard := Stringmob
return
}

; SIM ACTIVATION

SimBASERes()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE SMS SIM ACTIVE
Gui, Add, Text,, 
Gui, Add, Button, gMobSimBASERes, MOBILE SIM
Gui, Add, Button, gDataSimBASERes, DATA SIM
Gui, Add, Button, gInfoSimActBASERes, INFO SIMCARD NUMBER
Gui, Add, Button, gDocumentBASERes, NO DOCUMENT
Gui, add, Text,, 
Gui, Add, Button, gSmsBASERes, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

DocumentBASERes()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE SMS NO DOCUMENT
Gui, Add, Text,, 
Gui, Add, Button, gCopyDocumentTLNResNL, COPY NL
Gui, Add, Button, gCopyDocumentTLNResFR, COPY FR
Gui, Add, Button, gCopyDocumentTLNResEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gSimBASERes, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyDocumentBASEResNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Om de activatie van uw mobiel nummer op te starten, ontbreken de nodige documenten. Mogen wij u vragen hiervoor langs te gaan in uw dichtstbijzijnde BASE-winkelpunt. Alvast bedankt.
)
clipboard := Stringmob
return
}

CopyDocumentBASEResFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Pour commencer l'activation de votre numéro de GSM, il manque les documents nécessaires. Nous vous prions de vous rendre dans le magasin BASE le plus proche. Merci.
)
clipboard := Stringmob
return
}

CopyDocumentBASEResEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: To start the activation of your mobile number, the necessary documents are missing. May we ask you to go to your nearest BASE shop for this. Thanks.
)
clipboard := Stringmob
return
}

InfoSimActBASERes()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE SMS INFO SIMCARD NUMBER
Gui, Add, Text,, 
Gui, Add, Button, gCopyInfoSimActBASEResNL, COPY NL
Gui, Add, Button, gCopyInfoSimActBASEResFR, COPY FR
Gui, Add, Button, gCopyInfoSimActBASEResEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gSimBASERes, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyInfoSimActBASEResNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Gelieve ons het SIM-kaartnummer van BASE te bezorgen via 0486191999 zodat wij uw mobiel nummer kunnen activeren.
)
clipboard := Stringmob
return
}

CopyInfoSimActBASEResFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Veuillez nous communiquer le numéro de la carte SIM de BASE à l'adresse 0486191999 afin que nous puissions activer votre numéro de téléphone mobile.
)
clipboard := Stringmob
return
}

CopyInfoSimActBASEResEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Please provide us with BASE's SIM card number at 0486191999 so that we can activate your mobile number.
)
clipboard := Stringmob
return
}

MobSimBASERes()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE SMS MOBILE SIM
Gui, Add, Text,, 
Gui, Add, Button, gMobSimActBASERes, MOB SIM ACTIVATED
Gui, Add, Button, gMobSimLinkBASERes, MOB SIM ACTIVATE LINK
Gui, add, Text,, 
Gui, Add, Button, gSimBASERes, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

MobSimActBASERes()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE SMS MOB SIM ACTIVE
Gui, Add, Text,, 
Gui, add, Text,, MSISDN
Gui, Add, Edit, vMSISDN,
Gui, Add, Button, gCopyMobSimActBASEResNL, COPY NL
Gui, Add, Button, gCopyMobSimActBASEResFR, COPY FR
Gui, Add, Button, gCopyMobSimActBASEResEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gMobSimBASERes, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyMobSimActBASEResNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: De activering van uw mobiel %MSISDN% is succesvol afgerond.
)
clipboard := Stringmob
return
}

CopyMobSimActBASEResFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: l'Activation de votre téléphone mobile %MSISDN% a été effectuée avec succès.
)
clipboard := Stringmob
return
}

CopyMobSimActBASEResEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: The activation of your mobile phone %MSISDN% has been completed successfully.
)
clipboard := Stringmob
return
}

MobSimLinkBASERes()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE SMS MOB SIM ACTIVATE LINK
Gui, Add, Text,, 
Gui, add, Text,, MSISDN
Gui, Add, Edit, vMSISDN,
Gui, add, Text,, ORDER NUMBER
Gui, Add, Edit, vOrdernr
Gui, Add, Button, gCopyMobSimLinkBASEResNL, COPY NL
Gui, Add, Button, gCopyMobSimLinkBASEResFR, COPY FR
Gui, Add, Button, gCopyMobSimLinkBASEResEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gMobSimBASERes, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyMobSimLinkBASEResNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: De activering van %MSISDN% met bestelnummer %Ordernr% werd nog niet opgestart. Je kan deze activatie zelf starten via de activatielink: https://www.base.be/nl/particulieren/support/activeer-je-simkaart.html
)
clipboard := Stringmob
return
}

CopyMobSimLinkBASEResFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: L'activation de %MSISDN% avec numéro de commande %Ordernr% n'a pas encore été lancée. Vous pouvez démarrer cette activation vous-même via le lien d'activation: https://www.base.be/fr/particuliers/support/activez-votre-carte-sim.html
)
clipboard := Stringmob
return
}

CopyMobSimLinkBASEResEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: The activation of %MSISDN% with ordernumber %Ordernr% has not been started yet. You can start this activation yourself via the activation link: https://www.base.be/en/private/support/activate-your-sim-card.html
)
clipboard := Stringmob
return
}

DataSimBASERes()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE SMS DATA SIM
Gui, Add, Text,, 
Gui, Add, Button, gDataSimActBASERes, DATA SIM ACTIVATED
Gui, Add, Button, gDataSimLinkBASERes, DATA SIM ACTIVATE LINK
Gui, add, Text,, 
Gui, Add, Button, gSimBASERes, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

DataSimActBASERes()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE SMS DATA SIM ACTIVE
Gui, Add, Text,, 
Gui, add, Text,, MSISDN
Gui, Add, Edit, vMSISDN,
Gui, Add, Button, gCopyDataSimActBASEResNL, COPY NL
Gui, Add, Button, gCopyDataSimActBASEResFR, COPY FR
Gui, Add, Button, gCopyDataSimActBASEResEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gDataSimBASERes, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyDataSimActBASEResNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: De activering van uw DATA SIM %MSISDN% is succesvol afgerond.
)
clipboard := Stringmob
return
}

CopyDataSimActBASEResFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: l'Activation de votre SIM DATA %MSISDN% a été effectuée avec succès.
)
clipboard := Stringmob
return
}

CopyDataSimActBASEResEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: The activation of your DATA SIM %MSISDN% has been completed successfully.
)
clipboard := Stringmob
return
}

DataSimLinkBASERes()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE SMS DATA SIM ACTIVATE LINK
Gui, Add, Text,, 
Gui, add, Text,, MSISDN
Gui, Add, Edit, vMSISDN,
Gui, add, Text,, ORDER NUMBER
Gui, add, Edit, vOrdernr
Gui, Add, Button, gCopyDataSimLinkBASEResNL, COPY NL
Gui, Add, Button, gCopyDataSimLinkBASEResFR, COPY FR
Gui, Add, Button, gCopyDataSimLinkBASEResEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gDataSimBASERes, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyDataSimLinkBASEResNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: De activering van %MSISDN% met bestelnummer %Ordernr% werd nog niet opgestart. Je kan deze activatie zelf starten via de activatielink: https://www.base.be/nl/particulieren/support/activeer-je-simkaart.html
)
clipboard := Stringmob
return
}

CopyDataSimLinkBASEResFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: L'activation de %MSISDN% avec numéro de commande %Ordernr% n'a pas encore été lancée. Vous pouvez démarrer cette activation vous-même via le lien d'activation: https://www.base.be/fr/particuliers/support/activez-votre-carte-sim.html
)
clipboard := Stringmob
return
}

CopyDataSimLinkBASEResEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: The activation of %MSISDN% with ordernumber %Ordernr% has not been started yet. You can start this activation yourself via the activation link: https://www.base.be/en/private/support/activate-your-sim-card.html
)
clipboard := Stringmob
return
}

; CALLBACK MENU

CallbackMenuBASE()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE SMS CALLBACK
Gui, Add, Text,, 
Gui, Add, Button, gCallbackBASE, CALLBACK
Gui, Add, Button, gExamplesBASE, CALLBACK EXAMPLES CALLS
Gui, Add, Button, gExamplesSpeedBASE, CALLBACK EXAMPLES SPEEDTESTS
Gui, Add, Button, gCallbackReminderBASE, CALLBACK REMINDER
Gui, Add, Button, gCaseClosedBASE, CASE CLOSED
Gui, add, Text,, 
Gui, Add, Button, gSmsBASERes, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

; CASE CLOSED

CaseClosedBASE()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE SMS CASE CLOSED
Gui, Add, Text,, 
Gui, add, Text,, PEGA SC-ID
Gui, Add, Edit, vScid, 
Gui, Add, Button, gCopyCaseClosedBASENL, COPY NL
Gui, Add, Button, gCopyCaseClosedBASEFR, COPY FR
Gui, Add, Button, gCopyCaseClosedBASEEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gCallbackMenuBASE, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyCaseClosedBASENL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Helaas ontvingen we geen feedback na meerdere contactpogingen en wordt hierbij het dossier %Scid% gesloten. Indien je toch nog hinder ondervindt, gelieve dit dan te laten weten aan de klantendienst met alle eerder gevraagde informatie.
)
clipboard := Stringmob
return
}

CopyCaseClosedBASEFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Malheureusement, nous n'avons reçu aucune réponse après plusieurs tentatives de contact et le dossier %Scid% est donc clôturé. Si vous continuez à subir des désagréments, veuillez en informer le service clientèle en lui communiquant toutes les informations demandées précédemment.
)
clipboard := Stringmob
return
}

CopyCaseClosedBASEEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Unfortunately, we did not receive any feedback after multiple contact attempts and the case %Scid% is hereby closed. If you still experience inconvenience, please let customer service know with all previously requested information.
)
clipboard := Stringmob
return
}

; CALLBACK

CallbackBASE()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE SMS CALLBACK
Gui, Add, Text,, 
Gui, add, Text,, PEGA SC-ID
Gui, Add, Edit, vScid, 
Gui, Add, Text,, ISSUE (Short)
Gui, Add, Edit, vProblemshort
Gui, Add, Button, gCopyCallbackBASENL, COPY NL
Gui, Add, Button, gCopyCallbackBASEFR, COPY FR
Gui, Add, Button, gCopyCallbackBASEEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gCallbackMenuBASE, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyCallbackBASENL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Gelieve ons te contacteren op het nummer 0486191999 in verband met uw dossier (%Scid%) over %Problemshort%. Met vriendelijke groeten.
)
clipboard := Stringmob
return
}

CopyCallbackBASEFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Veuillez nous contacter au 0486191999 sur le dossier (%Scid%) concernant %Problemshort%. Cordialement.
)
clipboard := Stringmob
return
}

CopyCallbackBASEEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Please contact us on 0486191999 regarding case (%Scid%) related to %Problemshort%. Kind regards.
)
clipboard := Stringmob
return
}

; CALLBACK EXAMPLES

ExamplesBASE()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE SMS EXAMPLES CALLS
Gui, Add, Text,, 
Gui, add, Text,, PEGA SC-ID
Gui, Add, Edit, vScid, 
Gui, Add, Text,, ISSUE (Short)
Gui, Add, Edit, vProblemshort
Gui, Add, Button, gCopyExamplesBASENL, COPY NL
Gui, Add, Button, gCopyExamplesBASEFR, COPY FR
Gui, Add, Button, gCopyExamplesBASEEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gCallbackMenuBASE, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyExamplesBASENL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Gelieve ons te contacteren op het nummer 0486191999 in verband met uw dossier (%Scid%) over %Problemshort%. Indien je nog hinder ondervindt, gelieve dan recente voorbeelden te voorzien van de laatste drie dagen voor uw contact + startdatum van het probleem. Elk voorbeeld moet bevatten: locatie (volledig adres), datum, tijdstip, contactnr, probleemomschrijving per voorbeeld.
)
clipboard := Stringmob
return
}

CopyExamplesBASEFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Veuillez nous contacter au 0486191999 sur le dossier (%Scid%) concernant %Problemshort%. Si vous rencontrez toujours des problèmes, veuillez fournir des exemples récents des trois derniers jours avant votre contact + la date de début du problème. Chaque exemples doit comprendre : le lieu (adresse complète), la date, l'heure, le numéro de contact, la description du problème par exemple.
)
clipboard := Stringmob
return
}

CopyExamplesBASEEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Please contact us on 0486191999 regarding case (%Scid%) related to %Problemshort%. If you are still experiencing trouble, please provide recent examples from the last three days before your contact + start date of the problem. Each example should include: location (full address), date, time, contact no, problem description per example.
)
clipboard := Stringmob
return
}

; CALLBACK EXAMPLES SPEEDTESTS

ExamplesSpeedBASE()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE SMS EXAMPLES SPEEDTESTS
Gui, Add, Text,, 
Gui, add, Text,, PEGA SC-ID
Gui, Add, Edit, vScid, 
Gui, Add, Text,, ISSUE (Short)
Gui, Add, Edit, vProblemshort
Gui, Add, Button, gCopyExamplesSpeedBASENL, COPY NL
Gui, Add, Button, gCopyExamplesSpeedBASEFR, COPY FR
Gui, Add, Button, gCopyExamplesSpeedBASEEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gCallbackMenuBASE, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyExamplesSpeedBASENL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Gelieve ons te contacteren op het nummer 0486191999 in verband met uw dossier (%Scid%) over %Problemshort%. Indien je nog hinder ondervindt, gelieve dan recente voorbeelden te voorzien van de laatste drie dagen voor uw contact + startdatum van het probleem. Elk voorbeeld moet bevatten: locatie (volledig adres), datum, tijdstip, speedtest (speedtest.telenet.be), probleemomschrijving per voorbeeld.
)
clipboard := Stringmob
return
}

CopyExamplesSpeedBASEFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Veuillez nous contacter au 0486191999 sur le dossier (%Scid%) concernant %Problemshort%. Si vous rencontrez toujours des problèmes, veuillez fournir des exemples récents des trois derniers jours avant votre contact + la date de début du problème. Chaque exemples doit comprendre : le lieu (adresse complète), la date, l'heure, speedtest (speedtest.telenet.be), la description du problème par exemple.
)
clipboard := Stringmob
return
}

CopyExamplesSpeedBASEEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Please contact us on 0486191999 regarding case (%Scid%) related to %Problemshort%. If you are still experiencing trouble, please provide recent examples from the last three days before your contact + start date of the problem. Each example should include: location (full address), date, time, speedtest (speedtest.telenet.be), problem description per example.
)
clipboard := Stringmob
return
}

; CALLBACK EXAMPLES REMINDER

CallbackReminderBASE()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE SMS REMINDER
Gui, Add, Text,, 
Gui, add, Text,, PEGA SC-ID
Gui, Add, Edit, vScid, 
Gui, Add, Text,, ISSUE (Short)
Gui, Add, Edit, vProblemshort
Gui, Add, Button, gCopyCallbackReminderBASENL, COPY NL
Gui, Add, Button, gCopyCallbackReminderBASEFR, COPY FR
Gui, Add, Button, gCopyCallbackReminderBASEEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gCallbackMenuBASE, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyCallbackReminderBASENL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Helaas ontvingen we nog geen feedback in verband met uw dossier (%Scid%) over %Problemshort%. Gelieve via 0486191999 door te geven of u nog een probleem ervaart. Indien ja, gelieve dan alle eerder gevraagde informatie te voorzien. Opgelet: zonder feedback zal het dossier afgesloten worden.
)
clipboard := Stringmob
return
}

CopyCallbackReminderBASEFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Malheureusement, nous n'avons pas encore reçu de retour d'information concernant votre dossier (%Scid%) concernant %Problemshort%. Veuillez nous informer par l'intermédiaire de 0486191999 si le problème persiste. Si c'est le cas, veuillez fournir toutes les informations demandées précédemment. Attention: sans retour d'information, le dossier sera clôturé.
)
clipboard := Stringmob
return
}

CopyCallbackReminderBASEEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Unfortunately, we did not yet receive any feedback regarding your case (%Scid%) related to %Problemshort%. Please let us know via 0486191999 if you are still experiencing a problem. If so, please provide all previously requested information. Please note: without feedback, the file will be closed.
)
clipboard := Stringmob
return
}

; MNP REJECT MENU

SMSMnpRejectBASE()
{
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE SMS MNP
Gui, Add, Text,, 
Gui, Add, Button, gNoInfoMNPBASERes, NO REQUEST - NO INFO
Gui, Add, Button, gReject100MenuBASERes, REJECTCODE 100 (Not Active)
Gui, Add, Button, gReject115BASERes, REJECTCODE 115 (Mismatch Simcardnr OLO)
Gui, Add, Button, gReject120BASERes, REJECTCODE 120 (Mismatch Customernr OLO)
Gui, Add, Button, gMNPCancelBASERes, MNP CANCEL
Gui, add, Text,, 
Gui, Add, Button, gSmsBASERes, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

; NO INFO MNP

NoInfoMNPBASERes()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE NO REQUEST - NO INFO
Gui, Add, Text,, 
Gui, add, Text,, MSISDN
Gui, Add, Edit, vMSISDN,
Gui, Add, Button, gCopyNoInfoMNPBASEResNL, COPY NL
Gui, Add, Button, gCopyNoInfoMNPBASEResFR, COPY FR
Gui, Add, Button, gCopyNoInfoMNPBASEResEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gSMSMnpRejectBASE, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyNoInfoMNPBASEResNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: We hebben de overname van uw GSM %MSISDN% nog niet kunnen opstarten omdat er een aantal gegevens ontbreken. Gelieve ons het klant- en simkaartnummer van uw huidige provider te bezorgen via 0486191999.
)
clipboard := Stringmob
return
}

CopyNoInfoMNPBASEResFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Nous n'avons pas encore pu lancer la reprise de votre GSM %MSISDN% car certaines informations sont manquantes. Veuillez nous communiquer le numéro de client et de carte SIM de votre fournisseur actuel via 0486191999.
)
clipboard := Stringmob
return
}

CopyNoInfoMNPBASEResEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: We have not yet been able to initiate the transfer of your GSM %MSISDN% due to missing information. Please send us the customer number and SIM card number of your current operator via 0486191999.
)
clipboard := Stringmob
return
}

; MNP 100 MENU

Reject100MenuBASERes()
{
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE SMS MNP REJECT
Gui, Add, Text,, 
Gui, Add, Button, gReject100ProxBASERes, NOT ACTIVE - PROXIMUS
Gui, Add, Button, gReject100OtherBASERes, NOT ACTIVE - OTHER OLO
Gui, add, Text,, 
Gui, Add, Button, gSMSMnpRejectBASE, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

; MNP 100 PROX

Reject100ProxBASERes()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE REJECTCODE 100 - PROXIMUS
Gui, Add, Text,, 
Gui, add, Text,, MSISDN
Gui, Add, Edit, vMSISDN,
Gui, Add, Button, gCopyReject100ProxBASEResNL, COPY NL
Gui, Add, Button, gCopyReject100ProxBASEResFR, COPY FR
Gui, Add, Button, gCopyReject100ProxBASEResEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gReject100MenuBASERes, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyReject100ProxBASEResNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Gelieve met GSM %MSISDN% naar het gratis nummer 080066778 te bellen om deze op uw netwerk te heractiveren. Zo kunnen wij deze overdragen naar BASE.
)
clipboard := Stringmob
return
}

CopyReject100ProxBASEResFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Veuillez appeler le numéro gratuit 080066778 avec numéro %MSISDN% pour le réactiver sur votre réseau. Ainsi, nous pouvons le transférer à BASE.
)
clipboard := Stringmob
return
}

CopyReject100ProxBASEResEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Please call freephone 080066778 with mobile phone %MSISDN% to reactivate it on your network. This will allow us to transfer it to BASE.
)
clipboard := Stringmob
return
}

; MNP 100 OTHER

Reject100OtherBASERes()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE REJECTCODE 100 - OTHER OLO
Gui, Add, Text,, 
Gui, add, Text,, MSISDN
Gui, Add, Edit, vMSISDN,
Gui, Add, Button, gCopyReject100OtherBASEResNL, COPY NL
Gui, Add, Button, gCopyReject100OtherBASEResFR, COPY FR
Gui, Add, Button, gCopyReject100OtherBASEResEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gReject100MenuBASERes, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyReject100OtherBASEResNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Gelieve contact op te nemen met uw huidige operator om uw nummer %MSISDN% te heractiveren. Op die manier kunnen wij uw portering naar BASE voltooien.
)
clipboard := Stringmob
return
}

CopyReject100OtherBASEResFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Veuillez contacter votre opérateur actuel pour réactiver votre numéro %MSISDN%. Cela nous permettra de finaliser votre portage vers BASE.
)
clipboard := Stringmob
return
}

CopyReject100OtherBASEResEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Please contact your current operator to reactivate your number %MSISDN%. This will allow us to complete your porting to BASE.
)
clipboard := Stringmob
return
}

; MNP 115

Reject115BASERes()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE REJECTCODE 115
Gui, Add, Text,, 
Gui, Add, Text,, OLO SIM CARDNUMBER
Gui, Add, Edit, vSIMOLO,
Gui, Add, Button, gCopyReject115BASEResNL, COPY NL
Gui, Add, Button, gCopyReject115BASEResFR, COPY FR
Gui, Add, Button, gCopyReject115BASEResEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gSMSMnpRejectBASE, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyReject115BASEResNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: We hebben een aanvraag gestart met SIM-kaartnummer %SIMOLO% van uw huidige provider. Deze is helaas geweigerd. Gelieve ons het correcte SIM-kaartnummer van uw huidige operator te bezorgen via 0486191999.
)
clipboard := Stringmob
return
}

CopyReject115BASEResFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Nous avons lancé une demande avec le numéro de carte SIM %SIMOLO% de votre fournisseur actuel. Elle a malheureusement été refusée. Veuillez nous communiquer le numéro de carte SIM correct de votre opérateur actuel par téléphone à l'adresse 0486191999.
)
clipboard := Stringmob
return
}

CopyReject115BASEResEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: We have started a request with SIM card number %SIMOLO% from your current provider. This has unfortunately been refused. Please provide us with the correct SIM card number of your current operator by phone 0486191999.
)
clipboard := Stringmob
return
}

; MNP 120

Reject120BASERes()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE REJECTCODE 120
Gui, Add, Text,, 
Gui, Add, Text,, OLO CUSTOMER NUMBER
Gui, Add, Edit, vCMRNROLO,
Gui, Add, Button, gCopyReject120BASEResNL, COPY NL
Gui, Add, Button, gCopyReject120BASEResFR, COPY FR
Gui, Add, Button, gCopyReject120BASEResEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gSMSMnpRejectBASE, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyReject120BASEResNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: We hebben een aanvraag gestart met klantnummer %CMRNROLO% van uw huidige provider. Deze is helaas geweigerd. Gelieve ons het correcte klantnummer van uw huidige operator te bezorgen via 0486191999.
)
clipboard := Stringmob
return
}

CopyReject120BASEResFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Nous avons lancé une demande avec le numéro de client %CMRNROLO% de votre fournisseur actuel. Elle a malheureusement été refusée. Veuillez nous communiquer le numéro de client correct de votre opérateur actuel par téléphone à l'adresse 0486191999.
)
clipboard := Stringmob
return
}

CopyReject120BASEResEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: We have started a request with customer number %CMRNROLO% from your current provider. This has unfortunately been refused. Please provide us with the correct customer number of your current operator by phone at 0486191999.
)
clipboard := Stringmob
return
}

; MNP CANCEL

MNPCancelBASERes()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE MNP CANCEL
Gui, Add, Text,, 
Gui, Add, Text,, MSISDN
Gui, Add, Edit, vMSISDN,
Gui, Add, Button, gCopyMNPCancelBASEResNL, COPY NL
Gui, Add, Button, gCopyMNPCancelBASEResFR, COPY FR
Gui, Add, Button, gCopyMNPCancelBASEResEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gSMSMnpRejectBASE, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyMNPCancelBASEResNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Helaas kregen we niet voldoende informatie om je nummeroverdracht voor het nummer %MSISDN% af te ronden. Deze werd daarom geannuleerd. Een nieuwe registratie is mogelijk via onze website, een winkelpunt of onze klantendienst.
)
clipboard := Stringmob
return
}

CopyMNPCancelBASEResFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Malheureusement, nous n'avons pas reçu suffisamment d'informations pour effectuer votre transfert de numéro pour le numéro %MSISDN%. Celui-ci a donc été annulé. Un nouvel enregistrement est possible via notre site web, un point de vente ou notre service clientèle.
)
clipboard := Stringmob
return
}

CopyMNPCancelBASEResEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Unfortunately, we did not receive sufficient information to complete your number transfer for the number %MSISDN%. This was therefore cancelled. A new registration is possible via our website, a retail outlet or our customer service.
)
clipboard := Stringmob
return
}

; IT TICKET MENU

ItTicketSmsBASE()
{
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE SMS IT TICKET
Gui, Add, Text,, 
Gui, Add, Button, gItNewBaseResNL, NEW TICKET
Gui, Add, Button, gItUpdateBaseResNL, UPDATE TICKET
Gui, add, Text,, 
Gui, Add, Button, gSmsBASERes, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

; IT TICKET NEW

ItNewBASEResNL()
{
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE SMS NEW TICKET
Gui, Add, Text,, 
Gui, Add, Button, gCopyItBASEResNL, COPY NL
Gui, Add, Button, gCopyItBASEResFR, COPY FR
Gui, Add, Button, gCopyItBASEResEN, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gItTicketSmsBASE, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyItBASEResNL()
{
Stringit =
(
BASE-info: We hebben je dossier doorgestuurd naar onze IT-dienst en houden je op de hoogte. Bedankt voor uw geduld.
)
clipboard := Stringit
return
}

CopyItBASEResFR()
{
Stringit =
(
BASE-info: Nous avons transmis votre dossier à notre département IT et vous tiendrons au courant. Nous vous remercions de votre patience.
)
clipboard := Stringit
return
}

CopyItBASEResEN()
{
Stringit =
(
BASE-info: We have forwarded your case to our IT department and will keep you updated. Thank you for your patience.
)
clipboard := Stringit
return
}

; IT TICKET UPDATE

ItUpdateBASEResNL()
{
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE SMS UPDATE TICKET
Gui, Add, Text,, 
Gui, Add, Button, gCopyItUpdateBASEResNL, COPY NL
Gui, Add, Button, gCopyItUpdateBASEResFR, COPY FR
Gui, Add, Button, gCopyItUpdateBASEResEN, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gItTicketSmsBASE, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyItUpdateBASEResNL()
{
Stringitupdate =
(
BASE-info: Momenteel hebben we nog geen oplossing voor uw dossier. Onze IT-dienst werkt eraan. Bedankt voor uw geduld.
)
clipboard := Stringitupdate
return
}

CopyItUpdateBASEResFR()
{
Stringitupdate =
(
BASE-info: Actuellement, nous n'avons pas encore de solution pour votre dossier. Notre département IT y travaille. Nous vous remercions de votre patience.
)
clipboard := Stringitupdate
return
}

CopyItUpdateBASEResEN()
{
Stringitupdate =
(
BASE-info: Currently, we do not yet have a solution for your case. Our IT department is working on it. Thank you for your patience.
)
clipboard := Stringitupdate
return
}

; CROSSTEST MENU

CrosstestMenuSmsBASE()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE SMS CROSSTTEST
Gui, Add, Text,, 
Gui, Add, Button, gCrosstestBASE, CROSSTEST
Gui, Add, Button, gCrossReminderBASE, REMINDER CROSSTEST
Gui, add, Text,, 
Gui, Add, Button, gSmsBASERes, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

; CROSSTEST NEW

CrosstestBASE()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE SMS CROSSTEST
Gui, Add, Text,, 
Gui, add, Text,, PEGA SC-ID
Gui, Add, Edit, vScid, 
Gui, Add, Text,, ISSUE (Short)
Gui, Add, Edit, vProblemshort
Gui, Add, Button, gCopyCrosstestBASENL, COPY NL
Gui, Add, Button, gCopyCrosstestBASEFR, COPY FR
Gui, Add, Button, gCopyCrosstestBASEEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gCrosstestMenuSmsBASE, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyCrosstestBASENL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: In verband met uw dossier (%Scid%) over %Problemshort%. Gelieve opnieuw te testen met uw SIM in een ander toestel en via de klantendienst (0486191999) door te geven of u nog een probleem ervaart. Indien ja, gelieve dan recente voorbeelden te voorzien. Elk voorbeeld moet bevatten: datum, tijdstip, contactnr, locatie (volledig adres) en probleemomschrijving per voorbeeld.
)
clipboard := Stringmob
return
}

CopyCrosstestBASEFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Concernant votre dossier (%Scid%) concernant %Problemshort%. Veuillez refaire un test avec votre carte SIM dans un autre appareil et faites-nous savoir par l'intermédiaire du service clientèle (0486191999) si le problème persiste. Si oui, veuillez fournir des exemples récents. Chaque exemple doit inclure: la date, l'heure, le numéro de contact, le lieu (adresse complète) et la description du problème par exemple.
)
clipboard := Stringmob
return
}

CopyCrosstestBASEEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Regarding your case (%Scid%) related to %Problemshort%. Please retest with your SIM in another device and let us know via customer service (0486191999) if you are still experiencing a problem. If yes, please provide recent examples. Each example should include: date, time, contact no, location (full address) and problem description per example.
)
clipboard := Stringmob
return
}

; CROSSTEST REMINDER

CrossReminderBASE()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE SMS CROSSTEST REMINDER
Gui, Add, Text,, 
Gui, Add, Button, gCopyCrossReminderBASENL, COPY NL
Gui, Add, Button, gCopyCrossReminderBASEFR, COPY FR
Gui, Add, Button, gCopyCrossReminderBASEEN, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gCrosstestMenuSmsBASE, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyCrossReminderBASENL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Gelieve via de klantendienst (0486191999) door te geven of u nog een probleem heeft ervaren toen u uw simkaart testte in een ander toestel. Indien ja, gelieve dan recente voorbeelden te voorzien. Elk voorbeeld moet bevatten: datum, tijdstip, contactnr, locatie (volledig adres) en probleemomschrijving per voorbeeld.
)
clipboard := Stringmob
return
}

CopyCrossReminderBASEFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Veuillez nous faire savoir par l'intermédiaire du service clientèle (0486191999) si vous avez rencontré un autre problème lorsque vous avez testé votre carte SIM dans un autre appareil. Dans l'affirmative, veuillez fournir des exemples récents. Chaque exemple doit comprendre: la date, l'heure, le numéro de contact, le lieu (adresse complète) et la description du problème par exemple.
)
clipboard := Stringmob
return
}

CopyCrossReminderBASEEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Please let us know via customer service (0486191999) if you have experienced another problem when you tested your SIM card in another device. If yes, please provide recent examples. Each example should include: date, time, contact no, location (full address) and problem description per example.
)
clipboard := Stringmob
return
}

; VOICE2.0 MENU

VowifiMenuBASE()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE SMS VOICE2.0
Gui, Add, Text,, 
Gui, Add, Button, gVowifiActiveBASE, ACTIVE / CERTIFIED
Gui, Add, Button, gVowifiDeviceBASE, DEVICE NOK
Gui, add, Text,, 
Gui, Add, Button, gSmsBASERes, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

; VOICE2.0 ACTIVE

VowifiActiveBASE()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE SMS VOICE2.0
Gui, Add, Text,, 
Gui, Add, Button, gCopyVowifiBASEResNL, COPY NL
Gui, Add, Button, gCopyVowifiBASEResFR, COPY FR
Gui, Add, Button, gCopyVowifiBASEResEN, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gSmsBASERes, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyVowifiBASEResNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Bellen over 4G (VoLTE) en bellen over WiFi (VoWiFi) werd voor u geactiveerd op het netwerk. Gelieve na te kijken dat op uw toestel de laatste updates van de fabrikant geinstalleerd zijn. Activeer Voice over WiFi via de instellingen en herstart hierna uw toestel. Meer info: https://www.prd.base.be/nl/support/wifi-4g-5g/hoe-mobiel-bellen-via-4G-en-wifi/
)
clipboard := Stringmob
return
}

CopyVowifiBASEResFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: les appels sur la 4G (VoLTE) et les appels sur le WiFi (VoWiFi) ont été activés pour vous sur le réseau. Veuillez vérifier que les dernières mises à jour du fabricant sont installées sur votre appareil. Activez Voice over WiFi via les paramètres et redémarrez ensuite votre appareil et. Info: https://www.prd.base.be/fr/support/wifi-4g-5g/comment-passer-des-appels-mobiles-via-4G-et-wifi/
)
clipboard := Stringmob
return
}

CopyVowifiBASEResEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Calling over 4G (VoLTE) and calling over WiFi (VoWiFi) has been activated for you on the network. Please check that the latest manufacturer updates are installed on your device. Activate Voice over WiFi via the settings and then reboot your device. More info: https://www.prd.base.be/en/support/wi-fi-4g-5g/mobile-calls-via-4g-and-wi-fi/
)
clipboard := Stringmob
return
}

; VOICE2.0 DEVICE NOK

VowifiDeviceBASE()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE SMS VOICE2.0
Gui, Add, Text,, 
Gui, Add, Button, gCopyVowifiDeviceBASEResNL, COPY NL
Gui, Add, Button, gCopyVowifiDeviceBASEResFR, COPY FR
Gui, Add, Button, gCopyVowifiDeviceBASEResEN, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gSmsBASERes, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyVowifiDeviceBASEResNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Helaas is uw huidige toestel (nog) niet compatibel met VoLTE (voice over LTE) en VoWiFi (voice over WiFi). Meer info op: https://www.base.be/nl/veelgestelde-vragen/netwerk-toestellen/hoe-mobiel-bellen-via-4G-en-wifi.html
)
clipboard := Stringmob
return
}

CopyVowifiDeviceBASEResFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Malheureusement, votre appareil actuel n'est pas (encore) compatible avec VoLTE (voice over LTE) et VoWiFi (voice over WiFi). Plus d'informations : https://www.base.be/fr/questions-frequentes/reseau-appareils/Comment-passer-des-appels-mobiles-via-4G-et-wifi.html
)
clipboard := Stringmob
return
}

CopyVowifiDeviceBASEResEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Unfortunately, your current device is not (yet) compatible with VoLTE (voice over LTE) and VoWiFi (voice over WiFi). More info at: https://www.base.be/en/frequently-asked-questions/network-devices/how-to-make-mobile-calls-via-4G-and-Wi-Fi.html
)
clipboard := Stringmob
return
}

; COVERAGE MENU

CoverageBASE()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE SMS COVERAGE
Gui, Add, Text,, 
Gui, Add, Button, gIncidentBASE, ONGOING INCIDENT (GIS)
Gui, Add, Button, gOneTBASE, ONE-T CHANGE
Gui, Add, Button, gOneTReminderBASE, REMINDER ONE-T CHANGE
Gui, Add, Button, gNoCoverageBASE, NO COVERAGE
Gui, Add, Button, gDegradationBASE, DEGRADATION
Gui, Add, Button, gRoamingBASE, ROAMING
Gui, add, Text,, 
Gui, Add, Button, gSmsBASERes, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

; ONGOING INCIDENT

IncidentBASE()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE SMS ONGOING INCIDENT
Gui, Add, Text,, 
Gui, Add, Button, gCopyIncidentBASENL, COPY NL
Gui, Add, Button, gCopyIncidentBASEFR, COPY FR
Gui, Add, Button, gCopyIncidentBASEEN, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gCoverageBASE, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyIncidentBASENL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Er is momenteel een probleem vastgesteld op de zendmast in uw regio. We doen er alles aan om dit probleem zo snel mogelijk op te lossen. Onze exuses voor het ongemak.
)
clipboard := Stringmob
return
}

CopyIncidentBASEFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Un problème a été identifié sur le mât de transmission dans votre région. Nous mettons tout en œuvre pour résoudre ce problème dans les plus brefs délais. Nous vous prions de nous excuser pour la gêne occasionnée.
)
clipboard := Stringmob
return
}

CopyIncidentBASEEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: A problem has currently been identified on the transmission mast in your area. We are making every effort to solve this problem as soon as possible. Our apologies for the inconvenience.
)
clipboard := Stringmob
return
}

; ONE T CHANGE

OneTBASE()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE SMS ONE-T CHANGE
Gui, Add, Text,, 
Gui, Add, Button, gCopyOneTBASENL, COPY NL
Gui, Add, Button, gCopyOneTBASEFR, COPY FR
Gui, Add, Button, gCopyOneTBASEEN, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gCoverageBASE, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyOneTBASENL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: I.v.m. uw dossier werd een aanpassing uitgevoerd op het netwerk. Gelieve enkele dagen te testen en via de klantendienst (0486191999) door te geven of u nog een probleem ervaart. Indien ja, gelieve dan recente voorbeelden te voorzien vanaf de dag van deze SMS. Elk voorbeeld moet bevatten: datum, tijdstip, contactnr, volledig adres, probleemomschrijving per voorbeeld.
)
clipboard := Stringmob
return
}

CopyOneTBASEFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Une adaptation du réseau a été effectuée en rapport avec votre dossier. Veuillez tester pendant quelques jours et nous faire savoir par l'intermédiaire du service clientèle (0486191999) si vous rencontrez toujours un problème. Dans l'affirmative, veuillez fournir des exemples récents à partir du jour de ce SMS. Chaque exemple doit comprendre: la date, l'heure, le numéro de contact, adresse, la description du problème par exemple.
)
clipboard := Stringmob
return
}

CopyOneTBASEEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: An adjustment was made to the network in connection with your case. Please test for a few days and let us know via customer service (0486191999) if you are still experiencing a problem. If yes, please provide recent examples from the day of this SMS. Each example should include: date, time, contact nr, full address, problem description per example.
)
clipboard := Stringmob
return
}

; ONE T REMINDER

OneTReminderBASE()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE SMS ONE-T REMINDER
Gui, Add, Text,, 
Gui, Add, Button, gCopyOneTReminderBASENL, COPY NL
Gui, Add, Button, gCopyOneTReminderBASEFR, COPY FR
Gui, Add, Button, gCopyOneTReminderBASEEN, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gCoverageBASE, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyOneTReminderBASENL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: We hebben helaas nog geen feedback ontvangen. Gelieve via de klantendienst (0486191999) door te geven of u nog een probleem ervaart. Indien ja, gelieve dan recente voorbeelden te voorzien van de laatste drie dagen. Elk voorbeeld moet bevatten: datum, tijdstip, contactnr, probleemomschrijving per voorbeeld.
)
clipboard := Stringmob
return
}

CopyOneTReminderBASEFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Malheureusement, nous n'avons pas encore reçu de commentaires. Veuillez contacter le service clientèle (0486191999) si vous rencontrez toujours un problème. Dans l'affirmative, veuillez fournir des exemples récents des trois derniers jours. Chaque exemple doit comprendre: la date, l'heure, le numéro de contact, la description du problème par exemple.
)
clipboard := Stringmob
return
}

CopyOneTReminderBASEEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Unfortunately, we have not yet received any feedback. Please pass on via customer service (0486191999) if you are still experiencing a problem. If yes, please provide recent examples from the last three days. Each example should include: date, time, contact no, problem description per example.
)
clipboard := Stringmob
return
}

; NO COVERAGE

NoCoverageBASE()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE SMS NO COVERAGE
Gui, Add, Text,, 
Gui, Add, Button, gCopyNoCoverageBASENL, COPY NL
Gui, Add, Button, gCopyNoCoverageBASEFR, COPY FR
Gui, Add, Button, gCopyNoCoverageBASEEN, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gCoverageBASE, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyNoCoverageBASENL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Helaas is het bereik op het opgegeven adres niet ideaal. We hopen hier in de toekomst verbetering in te brengen. In de tussentijd raden we aan om voor uw gesprekken via Voice over WiFi altijd dicht in de buurt van uw WiFi zendstation te blijven.
)
clipboard := Stringmob
return
}

CopyNoCoverageBASEFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Malheureusement, la couverture à l'adresse indiquée n'est pas idéale. Nous espérons pouvoir l'améliorer à l'avenir. En attendant, nous vous recommandons de toujours rester à proximité de votre station d'émission WiFi pour vos appels Voice over WiFi.
)
clipboard := Stringmob
return
}

CopyNoCoverageBASEEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Unfortunately, the coverage at the given address is not ideal. We hope to improve this in the future. In the meantime, we recommend always staying close to your WiFi transmitting station for your Voice over WiFi calls.
)
clipboard := Stringmob
return
}

; DEGRADATION

DegradationBASE()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE SMS DEGRADATION
Gui, Add, Text,, 
Gui, add, Text,, MSISDN
Gui, Add, Edit, vMSISDN, 
Gui, Add, Button, gCopyDegradationBASENL, COPY NL
Gui, Add, Button, gCopyDegradationBASEFR, COPY FR
Gui, Add, Button, gCopyDegradationBASEEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gCoverageBASE, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyDegradationBASENL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Uw nummer %MSISDN% veroorzaakt momenteel storing op het Telenet radionetwerk. Gelieve deze stappen te volgen om ons te helpen het probleem op te lossen. Controleer of u de laatste updates van je fabrikant hebt. Herstart uw toestel.
)
clipboard := Stringmob
return
}

CopyDegradationBASEFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Votre numéro %MSISDN% provoque actuellement des interférences sur le réseau radio de Telenet. Veuillez suivre les étapes suivantes pour nous aider à résoudre le problème. Assurez-vous que vous disposez des dernières mises à jour de votre fabricant. Redémarrez votre appareil.
)
clipboard := Stringmob
return
}

CopyDegradationBASEEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Your number %MSISDN% is currently causing interference on the Telenet radio network. Please follow these steps to help us solve the problem. Make sure you have the latest updates from your manufacturer. Reboot your device.
)
clipboard := Stringmob
return
}

; ROAMING

RoamingBASE()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE SMS ROAMING
Gui, Add, Text,, 
Gui, Add, Button, gCopyRoamingBASENL, COPY NL
Gui, Add, Button, gCopyRoamingBASEFR, COPY FR
Gui, Add, Button, gCopyRoamingBASESEN, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gCoverageBASE, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyRoamingBASENL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Indien u in de toekomst een probleem ervaart met het verbinden met een roaming netwerk, gelieve dan manueel naar netwerken te zoeken, met elke zichtbare operator 5 verbindingspogingen op te zetten en indien problemen de volgende informatie door te geven per poging: datum, tijdstip, naam netwerk, eventuele foutmelding.
)
clipboard := Stringmob
return
}

CopyRoamingBASEFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Si vous rencontrez un problème de connexion à un réseau d'itinérance à l'avenir, veuillez rechercher les réseaux manuellement, effectuer cinq tentatives de connexion avec chaque opérateur visible et, en cas de problème, fournir les informations suivantes pour chaque tentative: date, heure, nom du réseau, message d'erreur éventuel.
)
clipboard := Stringmob
return
}

CopyRoamingBASESEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: If you experience a problem connecting to a roaming network in the future, please search for networks manually, set up 5 connection attempts with each visible operator and if problems, provide the following information for each attempt: date, time, network name, any error message.
)
clipboard := Stringmob
return
}

; PID BASE MENU

PIDBASE()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE PID
Gui, Add, Text,, 
Gui, Add, Button, gPIDLoginBASE, PID LOGIN
Gui, Add, Button, gPIDMailBASE, MAIL LINKED
Gui, Add, Button, gPIDInviteBASE, PID INVITE SENT
Gui, Add, Button, gPIDPasswordResetBASE, PASSWORD RESET
Gui, add, Text,, 
Gui, Add, Button, gSmsBASERes, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

PIDLoginBASE()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE PID LOGIN
Gui, Add, Text,, 
Gui, add, Text,, E-MAIL
Gui, Add, Edit, vEMAIL, 
Gui, Add, Button, gCopyPIDLoginBASENL, COPY NL
Gui, Add, Button, gCopyPIDLoginBASEFR, COPY FR
Gui, Add, Button, gCopyPIDLoginBASEEN, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gPIDBASE, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyPIDLoginBASENL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Uw login %EMAIL% is beschikbaar. Gelieve opnieuw in te loggen.
)
clipboard := Stringmob
return
}

CopyPIDLoginBASEFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Votre login %EMAIL% est disponible. Veuillez vous connecter à nouveau.
)
clipboard := Stringmob
return
}

CopyPIDLoginBASEEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Your login %EMAIL% is available. Please login again.
)
clipboard := Stringmob
return
}

PIDMailBASE()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE MAIL LINKED
Gui, Add, Text,, 
Gui, add, Text,, E-MAIL
Gui, Add, Edit, vEMAIL, 
Gui, Add, Button, gCopyPIDMailBASENL, COPY NL
Gui, Add, Button, gCopyPIDMailBASEFR, COPY FR
Gui, Add, Button, gCopyPIDMailBASEEN, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gPIDBASE, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyPIDMailBASENL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Uw login is vanaf nu gekoppeld met e-mailadres: %EMAIL%
)
clipboard := Stringmob
return
}

CopyPIDMailBASEFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Votre login est maintenant lié à votre adresse e-mail: %EMAIL%
)
clipboard := Stringmob
return
}

CopyPIDMailBASEEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Your login is now linked with e-mail address: %EMAIL%
)
clipboard := Stringmob
return
}

PIDInviteBASE()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE PID INVITE SENT
Gui, Add, Text,, 
Gui, add, Text,, E-MAIL
Gui, Add, Edit, vEMAIL, 
Gui, Add, Button, gCopyPIDInviteBASENL, COPY NL
Gui, Add, Button, gCopyPIDInviteBASEFR, COPY FR
Gui, Add, Button, gCopyPIDInviteBASEEN, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gPIDBASE, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyPIDInviteBASENL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: We hebben naar je e-mailadres %EMAIL% een nieuwe uitnodiging verstuurd voor het voltooien van je login. Werkt het nog niet? Laat via de klantendienst op 0486191999 weten in welke stap, de foutmelding en eventueel andere relevante informatie.
)
clipboard := Stringmob
return
}

CopyPIDInviteBASEFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Nous avons envoyé à votre adresse e-mail %EMAIL% une nouvelle invitation à compléter votre login. Cela ne fonctionne toujours pas? Veuillez nous informer via le service clientèle à l'adresse 0486191999 de l'étape, du message d'erreur et de toute autre information pertinente.
)
clipboard := Stringmob
return
}

CopyPIDInviteBASEEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: We have sent to your e-mail address %EMAIL% a new invitation to complete your login. Still not working? Please let us know via customer service at 0486191999 in which step, the error message and any other relevant information.
)
clipboard := Stringmob
return
}

PIDPasswordResetBASE()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE PID PASSWORD RESET
Gui, Add, Text,, 
Gui, add, Text,, E-MAIL
Gui, Add, Edit, vEMAIL, 
Gui, add, Text,, NEW PASSWORD
Gui, Add, Edit, vPassword, 
Gui, Add, Button, gCopyPIDPasswordResetBASENL, COPY NL
Gui, Add, Button, gCopyPIDPasswordResetBASEFR, COPY FR
Gui, Add, Button, gCopyPIDPasswordResetBASEEN, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gPIDBASE, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyPIDPasswordResetBASENL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Het wachtwoord van uw e-mailadres %EMAIL% is succesvol veranderd naar: %Password%
)
clipboard := Stringmob
return
}

CopyPIDPasswordResetBASEFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Le mot de passe de votre adresse e-mail %EMAIL% a été modifié avec succès en: %Password%
)
clipboard := Stringmob
return
}

CopyPIDPasswordResetBASEEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Your email address %EMAIL% password has been successfully changed to: %Password%
)
clipboard := Stringmob
return
}

; ESIM MENU

EsimBASE()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE SMS ESIM / ONE NUMBER
Gui, Add, Text,, 
Gui, Add, Button, gEsimActiveBASE, ESIM ACTIVATION
Gui, Add, Button, gEsimDeActiveBASE, ESIM DEACTIVATION & ACTIVATION
Gui, Add, Button, gEsimDeviceBASE, DEVICE NOK
Gui, add, Text,, 
Gui, Add, Button, gSmsBASERes, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

; ESIM ACTIVE

EsimActiveBASE()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE SMS ESIM ACTIVATION
Gui, Add, Text,, 
Gui, Add, Button, gCopyEsimActiveBASENL, COPY NL
Gui, Add, Button, gCopyEsimActiveBASEFR, COPY FR
Gui, Add, Button, gCopyEsimActiveBASEEN, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gEsimBASE, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyEsimActiveBASENL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Gelieve uw gsm en smartwatch te herstarten, opnieuw te proberen om uw smartwatch te koppelen, en de klantendienst (0486191999) te informeren of u nog een probleem ervaart. Indien ja, gelieve door te geven in welke stap dit faalt en welke informatie op dat moment ingegeven wordt + datum & tijdstip + foutmelding + type watch + EID van de watch.
)
clipboard := Stringmob
return
}

CopyEsimActiveBASEFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Veuillez redémarrer votre téléphone portable et votre smartwatch, essayez à nouveau de coupler votre smartwatch et informez le service clientèle (0486191999) si le problème persiste. Dans l'affirmative, veuillez indiquer à quelle étape l'opération a échoué et quelles informations sont actuellement saisies: date et heure, message d'erreur, type de montre et numéro d'identification de la montre.
)
clipboard := Stringmob
return
}

CopyEsimActiveBASEEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Please reboot your mobile phone and smartwatch, try again to pair your smartwatch, and inform customer service (0486191999) if you are still experiencing a problem. If yes, please pass on in which step this fails and what information is currently entered + date & time + error message + watch type + watch EID.
)
clipboard := Stringmob
return
}

; ESIM DEACTIVATE ACTIVE

EsimDeActiveBASE()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET SMS ESIM DEACTIVATION & ACTIVATION
Gui, Add, Text,, 
Gui, Add, Button, gCopyEsimDeActiveBASENL, COPY NL
Gui, Add, Button, gCopyEsimDeActiveBASEFR, COPY FR
Gui, Add, Button, gCopyEsimDeActiveBASEEN, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gEsimBASE, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyEsimDeActiveBASENL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Gelieve uw smartwatch te ontkoppelen via MyBASE-app en dan uw gsm en smartwatch te herstarten. Gelieve daarna opnieuw te proberen om uw smartwatch te koppelen en de klantendienst (0486191999) te informeren of u nog een probleem ervaart. Indien ja, gelieve door te geven in welke stap dit faalt en welke informatie op dat moment ingegeven wordt + datum & tijdstip + foutmelding + type watch + EID van de watch.
)
clipboard := Stringmob
return
}

CopyEsimDeActiveBASEFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Veuillez déconnecter votre smartwatch via MyBASE-app et redémarrer votre téléphone mobile et votre smartwatch. Ensuite, essayez à nouveau de coupler votre smartwatch et informez le service clientèle (0486191999) si le problème persiste. Dans l'affirmative, veuillez indiquer à quelle étape l'opération a échoué et quelles informations sont actuellement saisies + date et heure + message d'erreur + type de montre + EID de la montre.
)
clipboard := Stringmob
return
}

CopyEsimDeActiveBASEEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Please disconnect your smartwatch via MyBASE-app and then reboot your cell phone and smartwatch. After that, please try to pair your smartwatch again and inform customer service (0486191999) if you are still experiencing a problem. If yes, please indicate in which step this fails and what information is entered at that time + date & time + error message + type of watch + EID of the watch.
)
clipboard := Stringmob
return
}

; ESIM DEVICE NOK

EsimDeviceBASE()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE SMS ESIM DEVICE NOK
Gui, Add, Text,, 
Gui, Add, Button, gCopyEsimDeviceBASENL, COPY NL
Gui, Add, Button, gCopyEsimDeviceBASEFR, COPY FR
Gui, Add, Button, gCopyEsimDeviceBASEEN, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gEsimBASE, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyEsimDeviceBASENL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Helaas worden voor Smartwatches van Samsung enkel koppelingen ondersteund met de Samsung smartphones.
)
clipboard := Stringmob
return
}

CopyEsimDeviceBASEFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Malheureusement, pour les Smartwatches Samsung, seuls les couplages avec les smartphones Samsung sont pris en charge.
)
clipboard := Stringmob
return
}

CopyEsimDeviceBASEEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Unfortunately, for Samsung Smartwatches, only pairings are supported with Samsung smartphones.
)
clipboard := Stringmob
return
}

; ROUTING OLO OK

RoutingOLOBASE()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE SMS ROUTING OLO OK
Gui, Add, Text,, 
Gui, Add, Button, gCopyRoutingOLOBASENL, COPY NL
Gui, Add, Button, gCopyRoutingOLOBASEFR, COPY FR
Gui, Add, Button, gCopyRoutingOLOBASEEN, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gSmsTelenetRes, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyRoutingOLOBASENL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: We hebben contact gehad met de operator van de nummer(s) die u niet kunnen bereiken en krijgen de bevestiging dat het in orde moet zijn. Indien er alsnog een probleem is moet de beller contact opnemen met de eigen operator.
)
clipboard := Stringmob
return
}

CopyRoutingOLOBASEFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: Nous avons contacté l'opérateur du (des) numéro(s) qui ne peut pas vous joindre et nous avons reçu la confirmation que cela devrait aller. Si le problème persiste, l'appelant doit contacter son propre opérateur.
)
clipboard := Stringmob
return
}

CopyRoutingOLOBASEEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-info: We have contacted the operator of the number(s) that cannot reach you and receive confirmation that it should be OK. If there is still a problem, the caller should contact their own operator.
)
clipboard := Stringmob
return
}

; SMS BASE BUSINESS

SmsBASEBus()
{
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE BUSINESS SMS
Gui, Add, Text,, 
Gui, Add, Button, gIssueFixedBASEBus, ISSUE FIXED
Gui, Add, Button, gSystemOKBASEBus, SYSTEM OK, CHECK DEVICE
Gui, Add, Button, gSimBASEBus, SIM ACTIVATION
Gui, Add, Button, gCallBackMenuBASEBus, CALLBACK
Gui, Add, Button, gSMSMnpRejectBASEBus, MNP
Gui, Add, Button, gItTicketSmsBASEBus, IT TICKET
Gui, Add, Button, gCrosstestMenuSmsBASEBus, CROSSTEST
Gui, Add, Button, gVowifiMenuBASEBus, VOICE2.0
Gui, Add, Button, gCoverageBASEBus, COVERAGE
Gui, Add, Button, gPIDBASEBus, PID
Gui, Add, Button, gEsimBASEBus, ESIM / ONE NUMBER
Gui, Add, Button, gRoutingOLOBASEBus, ROUTING OLO OK
Gui, add, Text,, 
Gui, Add, Button, gSmsBASE, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

; ISSUE FIXED

IssueFixedBASEBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE BUSINESS SMS ISSUE FIXED
Gui, Add, Text,, 
Gui, add, Text,, PEGA SC-ID
Gui, Add, Edit, vScid, 
Gui, Add, Text,, ISSUE (Short)
Gui, Add, Edit, vProblemshort
Gui, Add, Button, gCopyIssueFixedBASENLBus, COPY NL
Gui, Add, Button, gCopyIssueFixedBASEFRBus, COPY FR
Gui, Add, Button, gCopyIssueFixedBASEENBus, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gSmsBASEBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyIssueFixedBASENLBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Uw dossier (%Scid%) over %Problemshort% werd opgevolgd. Gelieve uw toestel te herstarten.
)
clipboard := Stringmob
return
}

CopyIssueFixedBASEFRBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Votre dossier (%Scid%) concernant %Problemshort% a été suivi. Veuillez redémarrer votre appareil.
)
clipboard := Stringmob
return
}

CopyIssueFixedBASEENBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Your case (%Scid%) related to %Problemshort% was followed up. Please restart your device.
)
clipboard := Stringmob
return
}

; SYSTEM OK CHECK DEVICE

SystemOKBASEBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE BUSINESS SMS SYSTEM OK
Gui, Add, Text,, 
Gui, add, Text,, PEGA SC-ID
Gui, Add, Edit, vScid, 
Gui, Add, Text,, ISSUE (Short)
Gui, Add, Edit, vProblemshort
Gui, Add, Button, gCopySystemOKBASENLBus, COPY NL
Gui, Add, Button, gCopySystemOKBASEFRBus, COPY FR
Gui, Add, Button, gCopySystemOKBASEENBus, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gSmsBASEBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopySystemOKBASENLBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: In verband met uw dossier (%Scid%) over %Problemshort%. Bij nazicht in onze systemen staat alles juist. Gelieve uw instellingen na te kijken en uw toestel te herstarten.
)
clipboard := Stringmob
return
}

CopySystemOKBASEFRBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Concernant votre dossier (%Scid%) sur %Problemshort%. Après examen dans nos systèmes, tout est correct. Veuillez vérifier vos paramètres et redémarrer votre appareil.
)
clipboard := Stringmob
return
}

CopySystemOKBASEENBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Regarding your case (%Scid%) on %Problemshort%. When checking in our systems, everything is correct. Please check your settings and reboot your device.
)
clipboard := Stringmob
return
}

; SIM ACTIVATION

SimBASEBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE BUSINESS SMS SIM ACTIVE
Gui, Add, Text,, 
Gui, Add, Button, gMobSimBASEBus, MOBILE SIM
Gui, Add, Button, gDataSimBASEBus, DATA SIM
Gui, Add, Button, gInfoSimActBASEBus, INFO SIMCARD NUMBER
Gui, Add, Button, gDocumentBASEBus, NO DOCUMENT
Gui, add, Text,, 
Gui, Add, Button, gSmsBASEBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

DocumentBASEBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE BUSINESS SMS NO DOCUMENT
Gui, Add, Text,, 
Gui, Add, Button, gCopyDocumentTLNBusNL, COPY NL
Gui, Add, Button, gCopyDocumentTLNBusFR, COPY FR
Gui, Add, Button, gCopyDocumentTLNBusEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gSimBASEBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyDocumentBASEBusNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Om de activatie van uw mobiel nummer op te starten, ontbreken de nodige documenten. Mogen wij u vragen hiervoor langs te gaan in uw dichtstbijzijnde BASE-winkelpunt. Alvast bedankt.
)
clipboard := Stringmob
return
}

CopyDocumentBASEBusFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Pour commencer l'activation de votre numéro de GSM, il manque les documents nécessaires. Nous vous prions de vous rendre dans le magasin BASE le plus proche. Merci.
)
clipboard := Stringmob
return
}

CopyDocumentBASEBusEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: To start the activation of your mobile number, the necessary documents are missing. May we ask you to go to your nearest BASE shop for this. Thanks.
)
clipboard := Stringmob
return
}

InfoSimActBASEBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE SMS INFO SIMCARD NUMBER
Gui, Add, Text,, 
Gui, Add, Button, gCopyInfoSimActBASEBusNL, COPY NL
Gui, Add, Button, gCopyInfoSimActBASEBusFR, COPY FR
Gui, Add, Button, gCopyInfoSimActBASEBusEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gSimBASEBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyInfoSimActBASEBusNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Gelieve ons het SIM-kaartnummer van BASE te bezorgen via 0486191940 zodat wij uw mobiel nummer kunnen activeren.
)
clipboard := Stringmob
return
}

CopyInfoSimActBASEBusFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Veuillez nous communiquer le numéro de la carte SIM de BASE à l'adresse 0486191940 afin que nous puissions activer votre numéro de téléphone mobile.
)
clipboard := Stringmob
return
}

CopyInfoSimActBASEBusEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Please provide us with BASE's SIM card number at 0486191940 so that we can activate your mobile number.
)
clipboard := Stringmob
return
}

MobSimBASEBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE BUSINESS SMS MOBILE SIM
Gui, Add, Text,, 
Gui, Add, Button, gMobSimActBASEBus, MOB SIM ACTIVATED
Gui, Add, Button, gMobSimLinkBASEBus, MOB SIM ACTIVATE LINK
Gui, add, Text,, 
Gui, Add, Button, gSimBASEBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

MobSimActBASEBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE BUSINESS SMS MOB SIM ACTIVE
Gui, Add, Text,, 
Gui, add, Text,, MSISDN
Gui, Add, Edit, vMSISDN,
Gui, Add, Button, gCopyMobSimActBASEBusNL, COPY NL
Gui, Add, Button, gCopyMobSimActBASEBusFR, COPY FR
Gui, Add, Button, gCopyMobSimActBASEBusEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gMobSimBASEBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyMobSimActBASEBusNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: De activering van uw mobiel %MSISDN% is succesvol afgerond.
)
clipboard := Stringmob
return
}

CopyMobSimActBASEBusFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: l'Activation de votre téléphone mobile %MSISDN% a été effectuée avec succès.
)
clipboard := Stringmob
return
}

CopyMobSimActBASEBusEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: The activation of your mobile phone %MSISDN% has been completed successfully.
)
clipboard := Stringmob
return
}

MobSimLinkBASEBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE BUSINESS SMS MOB SIM ACTIVATE LINK
Gui, Add, Text,, 
Gui, add, Text,, MSISDN
Gui, Add, Edit, vMSISDN,
Gui, add, Text,, ORDER NUMBER
Gui, Add, Edit, vOrdernr
Gui, Add, Button, gCopyMobSimLinkBASEBusNL, COPY NL
Gui, Add, Button, gCopyMobSimLinkBASEBusFR, COPY FR
Gui, Add, Button, gCopyMobSimLinkBASEBusEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gMobSimBASEBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyMobSimLinkBASEBusNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: De activering van %MSISDN% met bestelnummer %Ordernr% werd nog niet opgestart. Je kan deze activatie zelf starten via de activatielink: https://www.base.be/nl/particulieren/support/activeer-je-simkaart.html
)
clipboard := Stringmob
return
}

CopyMobSimLinkBASEBusFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: L'activation de %MSISDN% avec numéro de commande %Ordernr% n'a pas encore été lancée. Vous pouvez démarrer cette activation vous-même via le lien d'activation: https://www.base.be/fr/particuliers/support/activez-votre-carte-sim.html
)
clipboard := Stringmob
return
}

CopyMobSimLinkBASEBusEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: The activation of %MSISDN% with ordernumber %Ordernr% has not been started yet. You can start this activation yourself via the activation link: https://www.base.be/en/private/support/activate-your-sim-card.html
)
clipboard := Stringmob
return
}

DataSimBASEBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE BUSINESS SMS DATA SIM
Gui, Add, Text,, 
Gui, Add, Button, gDataSimActBASEBus, DATA SIM ACTIVATED
Gui, Add, Button, gDataSimLinkBASEBus, DATA SIM ACTIVATE LINK
Gui, add, Text,, 
Gui, Add, Button, gSimBASEBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

DataSimActBASEBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE BUSINESS SMS DATA SIM ACTIVE
Gui, Add, Text,, 
Gui, add, Text,, MSISDN
Gui, Add, Edit, vMSISDN,
Gui, Add, Button, gCopyDataSimActBASEBusNL, COPY NL
Gui, Add, Button, gCopyDataSimActBASEBusFR, COPY FR
Gui, Add, Button, gCopyDataSimActBASEBusEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gDataSimBASEBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyDataSimActBASEBusNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: De activering van uw DATA SIM %MSISDN% is succesvol afgerond.
)
clipboard := Stringmob
return
}

CopyDataSimActBASEBusFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: l'Activation de votre SIM DATA %MSISDN% a été effectuée avec succès.
)
clipboard := Stringmob
return
}

CopyDataSimActBASEBusEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: The activation of your DATA SIM %MSISDN% has been completed successfully.
)
clipboard := Stringmob
return
}

DataSimLinkBASEBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE BUSINESS SMS DATA SIM ACTIVATE LINK
Gui, Add, Text,, 
Gui, add, Text,, MSISDN
Gui, Add, Edit, vMSISDN,
Gui, add, Text,, ORDER NUMBER
Gui, Add, Edit, vOrdernr
Gui, Add, Button, gCopyDataSimLinkBASEBusNL, COPY NL
Gui, Add, Button, gCopyDataSimLinkBASEBusFR, COPY FR
Gui, Add, Button, gCopyDataSimLinkBASEBusEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gDataSimBASEBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyDataSimLinkBASEBusNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: De activering van %MSISDN% met bestelnummer %Ordernr% werd nog niet opgestart. Je kan deze activatie zelf starten via de activatielink: https://www.base.be/nl/particulieren/support/activeer-je-simkaart.html
)
clipboard := Stringmob
return
}

CopyDataSimLinkBASEBusFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: L'activation de %MSISDN% avec numéro de commande %Ordernr% n'a pas encore été lancée. Vous pouvez démarrer cette activation vous-même via le lien d'activation: https://www.base.be/fr/particuliers/support/activez-votre-carte-sim.html
)
clipboard := Stringmob
return
}

CopyDataSimLinkBASEBusEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: The activation of %MSISDN% with ordernumber %Ordernr% has not been started yet. You can start this activation yourself via the activation link: https://www.base.be/en/private/support/activate-your-sim-card.html
)
clipboard := Stringmob
return
}

; CALLBACK MENU

CallbackMenuBASEBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE BUSINESS SMS CALLBACK
Gui, Add, Text,, 
Gui, Add, Button, gCallbackBASEBus, CALLBACK
Gui, Add, Button, gExamplesBASEBus, CALLBACK EXAMPLES CALLS
Gui, Add, Button, gExamplesSpeedBASEBus, CALLBACK EXAMPLES SPEEDTESTS
Gui, Add, Button, gCallbackReminderBASEBus, CALLBACK REMINDER
Gui, Add, Button, gCaseClosedBASEBus, CASE CLOSED
Gui, add, Text,, 
Gui, Add, Button, gSmsBASEBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

; CASE CLOSED

CaseClosedBASEBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE BUSINESS SMS CASE CLOSED
Gui, Add, Text,, 
Gui, add, Text,, PEGA SC-ID
Gui, Add, Edit, vScid, 
Gui, Add, Button, gCopyCaseClosedBASENLBus, COPY NL
Gui, Add, Button, gCopyCaseClosedBASEFRBus, COPY FR
Gui, Add, Button, gCopyCaseClosedBASEENBus, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gCallbackMenuBASEBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyCaseClosedBASENLBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Helaas ontvingen we geen feedback na meerdere contactpogingen en wordt hierbij het dossier %Scid% gesloten. Indien je toch nog hinder ondervindt, gelieve dit dan te laten weten aan de klantendienst met alle eerder gevraagde informatie.
)
clipboard := Stringmob
return
}

CopyCaseClosedBASEFRBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Malheureusement, nous n'avons reçu aucune réponse après plusieurs tentatives de contact et le dossier %Scid% est donc clôturé. Si vous continuez à subir des désagréments, veuillez en informer le service clientèle en lui communiquant toutes les informations demandées précédemment.
)
clipboard := Stringmob
return
}

CopyCaseClosedBASEENBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Unfortunately, we did not receive any feedback after multiple contact attempts and the case %Scid% is hereby closed. If you still experience inconvenience, please let customer service know with all previously requested information.
)
clipboard := Stringmob
return
}

; CALLBACK

CallbackBASEBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE BUSINESS SMS CALLBACK
Gui, Add, Text,, 
Gui, add, Text,, PEGA SC-ID
Gui, Add, Edit, vScid, 
Gui, Add, Text,, ISSUE (Short)
Gui, Add, Edit, vProblemshort
Gui, Add, Button, gCopyCallbackBASENLBus, COPY NL
Gui, Add, Button, gCopyCallbackBASEFRBus, COPY FR
Gui, Add, Button, gCopyCallbackBASEENBus, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gCallbackMenuBASEBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyCallbackBASENLBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Gelieve ons te contacteren op het nummer 0486191940 in verband met uw dossier (%Scid%) over %Problemshort%. Met vriendelijke groeten.
)
clipboard := Stringmob
return
}

CopyCallbackBASEFRBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Veuillez nous contacter au 0486191940 sur le dossier (%Scid%) concernant %Problemshort%. Cordialement.
)
clipboard := Stringmob
return
}

CopyCallbackBASEENBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Please contact us on 0486191940 regarding case (%Scid%) related to %Problemshort%. Kind regards.
)
clipboard := Stringmob
return
}

; CALLBACK EXAMPLES

ExamplesBASEBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE BUSINESS SMS EXAMPLES CALLS
Gui, Add, Text,, 
Gui, add, Text,, PEGA SC-ID
Gui, Add, Edit, vScid, 
Gui, Add, Text,, ISSUE (Short)
Gui, Add, Edit, vProblemshort
Gui, Add, Button, gCopyExamplesBASENLBus, COPY NL
Gui, Add, Button, gCopyExamplesBASEFRBus, COPY FR
Gui, Add, Button, gCopyExamplesBASEENBus, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gCallbackMenuBASEBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyExamplesBASENLBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Gelieve ons te contacteren op het nummer 0486191940 in verband met uw dossier (%Scid%) over %Problemshort%. Indien je nog hinder ondervindt, gelieve dan recente voorbeelden te voorzien van de laatste drie dagen voor uw contact + startdatum van het probleem. Elk voorbeeld moet bevatten: locatie (volledig adres), datum, tijdstip, contactnr, probleemomschrijving per voorbeeld.
)
clipboard := Stringmob
return
}

CopyExamplesBASEFRBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Veuillez nous contacter au 0486191940 sur le dossier (%Scid%) concernant %Problemshort%. Si vous rencontrez toujours des problèmes, veuillez fournir des exemples récents des trois derniers jours avant votre contact + la date de début du problème. Chaque exemples doit comprendre : le lieu (adresse complète), la date, l'heure, le numéro de contact, la description du problème par exemple.
)
clipboard := Stringmob
return
}

CopyExamplesBASEENBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Please contact us on 0486191940 on case (%Scid%) related to %Problemshort%. If you are still experiencing trouble, please provide recent examples from the last three days before your contact + start date of the problem. Each example should include: location (full address), date, time, contact no, problem description per example.
)
clipboard := Stringmob
return
}

; CALLBACK EXAMPLES SPEEDTESTS

ExamplesSpeedBASEBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE BUSINESS SMS EXAMPLES SPEEDTESTS
Gui, Add, Text,, 
Gui, add, Text,, PEGA SC-ID
Gui, Add, Edit, vScid, 
Gui, Add, Text,, ISSUE (Short)
Gui, Add, Edit, vProblemshort
Gui, Add, Button, gCopyExamplesSpeedBASENLBus, COPY NL
Gui, Add, Button, gCopyExamplesSpeedBASEFRBus, COPY FR
Gui, Add, Button, gCopyExamplesSpeedBASEENBus, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gCallbackMenuBASEBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyExamplesSpeedBASENLBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Gelieve ons te contacteren op het nummer 0486191940 in verband met uw dossier (%Scid%) over %Problemshort%. Indien je nog hinder ondervindt, gelieve dan recente voorbeelden te voorzien van de laatste drie dagen voor uw contact + startdatum van het probleem. Elk voorbeeld moet bevatten: locatie (volledig adres), datum, tijdstip, speedtest (speedtest.telenet.be), probleemomschrijving per voorbeeld.
)
clipboard := Stringmob
return
}

CopyExamplesSpeedBASEFRBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Veuillez nous contacter au 0486191940 sur le dossier (%Scid%) concernant %Problemshort%. Si vous rencontrez toujours des problèmes, veuillez fournir des exemples récents des trois derniers jours avant votre contact + la date de début du problème. Chaque exemples doit comprendre : le lieu (adresse complète), la date, l'heure, speedtest (speedtest.telenet.be), la description du problème par exemple.
)
clipboard := Stringmob
return
}

CopyExamplesSpeedBASEENBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Please contact us on 0486191940 regarding case (%Scid%) related to %Problemshort%. If you are still experiencing trouble, please provide recent examples from the last three days before your contact + start date of the problem. Each example should include: location (full address), date, time, speedtest (speedtest.telenet.be), problem description per example.
)
clipboard := Stringmob
return
}

; CALLBACK EXAMPLES REMINDER

CallbackReminderBASEBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE BUSINESS SMS REMINDER
Gui, Add, Text,, 
Gui, add, Text,, PEGA SC-ID
Gui, Add, Edit, vScid, 
Gui, Add, Text,, ISSUE (Short)
Gui, Add, Edit, vProblemshort
Gui, Add, Button, gCopyCallbackReminderBASENLBus, COPY NL
Gui, Add, Button, gCopyCallbackReminderBASEFRBus, COPY FR
Gui, Add, Button, gCopyCallbackReminderBASEENBus, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gCallbackMenuBASEBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyCallbackReminderBASENLBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Helaas ontvingen we nog geen feedback in verband met uw dossier (%Scid%) over %Problemshort%. Gelieve via 0486191940 door te geven of u nog een probleem ervaart. Indien ja, gelieve dan alle eerder gevraagde informatie te voorzien. Opgelet: zonder feedback zal het dossier afgesloten worden.
)
clipboard := Stringmob
return
}

CopyCallbackReminderBASEFRBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Malheureusement, nous n'avons pas encore reçu de retour d'information concernant votre dossier (%Scid%) concernant %Problemshort%. Veuillez nous informer par l'intermédiaire de 0486191940 si le problème persiste. Si c'est le cas, veuillez fournir toutes les informations demandées précédemment. Attention: sans retour d'information, le dossier sera clôturé.
)
clipboard := Stringmob
return
}

CopyCallbackReminderBASEENBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Unfortunately, we did not yet receive any feedback regarding your case (%Scid%) related to %Problemshort%. Please let us know via 0486191940 if you are still experiencing a problem. If so, please provide all previously requested information. Please note: without feedback, the file will be closed.
)
clipboard := Stringmob
return
}

; MNP REJECT MENU

SMSMnpRejectBASEBus()
{
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE BUSINESS SMS MNP
Gui, Add, Text,, 
Gui, Add, Button, gNoInfoMNPBASEBus, NO REQUEST - NO INFO
Gui, Add, Button, gReject100MenuBASEBus, REJECTCODE 100 (Not Active)
Gui, Add, Button, gReject115BASEBus, REJECTCODE 115 (Mismatch Simcardnr OLO)
Gui, Add, Button, gReject120BASEBus, REJECTCODE 120 (Mismatch Customernr OLO)
Gui, Add, Button, gMNPCancelBASEBus, MNP CANCEL
Gui, add, Text,, 
Gui, Add, Button, gSmsBASEBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

; NO INFO MNP

NoInfoMNPBASEBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE BUSINESS NO REQUEST - NO INFO
Gui, Add, Text,, 
Gui, add, Text,, MSISDN
Gui, Add, Edit, vMSISDN,
Gui, Add, Button, gCopyNoInfoMNPBASEBusNL, COPY NL
Gui, Add, Button, gCopyNoInfoMNPBASEBusFR, COPY FR
Gui, Add, Button, gCopyNoInfoMNPBASEBusEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gSMSMnpRejectBASEBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyNoInfoMNPBASEBusNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: We hebben de overname van uw GSM %MSISDN% nog niet kunnen opstarten omdat er een aantal gegevens ontbreken. Gelieve ons het klant- en simkaartnummer van uw huidige provider te bezorgen via 0486191940.
)
clipboard := Stringmob
return
}

CopyNoInfoMNPBASEBusFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Nous n'avons pas encore pu lancer la reprise de votre GSM %MSISDN% car certaines informations sont manquantes. Veuillez nous communiquer le numéro de client et de carte SIM de votre fournisseur actuel via 0486191940.
)
clipboard := Stringmob
return
}

CopyNoInfoMNPBASEBusEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: We have not yet been able to initiate the transfer of your GSM %MSISDN% due to missing information. Please send us the customer number and SIM card number of your current operator via 0486191940.
)
clipboard := Stringmob
return
}

; MNP 100 MENU

Reject100MenuBASEBus()
{
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE BUSINESS SMS MNP REJECT
Gui, Add, Text,, 
Gui, Add, Button, gReject100ProxBASEBus, NOT ACTIVE - PROXIMUS
Gui, Add, Button, gReject100OtherBASEBus, NOT ACTIVE - OTHER OLO
Gui, add, Text,, 
Gui, Add, Button, gSMSMnpRejectBASE, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

; MNP 100 PROX

Reject100ProxBASEBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE REJECTCODE 100 - PROXIMUS
Gui, Add, Text,, 
Gui, add, Text,, MSISDN
Gui, Add, Edit, vMSISDN,
Gui, Add, Button, gCopyReject100ProxBASEBusNL, COPY NL
Gui, Add, Button, gCopyReject100ProxBASEBusFR, COPY FR
Gui, Add, Button, gCopyReject100ProxBASEBusEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gReject100MenuBASEBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyReject100ProxBASEBusNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Gelieve met GSM %MSISDN% naar het gratis nummer 080066778 te bellen om deze op uw netwerk te heractiveren. Zo kunnen wij deze overdragen naar BASE.
)
clipboard := Stringmob
return
}

CopyReject100ProxBASEBusFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Veuillez appeler le numéro gratuit 080066778 avec numéro %MSISDN% pour le réactiver sur votre réseau. Ainsi, nous pouvons le transférer à BASE.
)
clipboard := Stringmob
return
}

CopyReject100ProxBASEBusEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Please call freephone 080066778 with mobile phone %MSISDN% to reactivate it on your network. This will allow us to transfer it to BASE.
)
clipboard := Stringmob
return
}

; MNP 100 OTHER

Reject100OtherBASEBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE REJECTCODE 100 - OTHER OLO
Gui, Add, Text,, 
Gui, add, Text,, MSISDN
Gui, Add, Edit, vMSISDN,
Gui, Add, Button, gCopyReject100OtherBASEBusNL, COPY NL
Gui, Add, Button, gCopyReject100OtherBASEBusFR, COPY FR
Gui, Add, Button, gCopyReject100OtherBASEBusEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gReject100MenuBASEBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyReject100OtherBASEBusNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Gelieve contact op te nemen met uw huidige operator om uw nummer %MSISDN% te heractiveren. Op die manier kunnen wij uw portering naar BASE voltooien.
)
clipboard := Stringmob
return
}

CopyReject100OtherBASEBusFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Veuillez contacter votre opérateur actuel pour réactiver votre numéro %MSISDN%. Cela nous permettra de finaliser votre portage vers BASE.
)
clipboard := Stringmob
return
}

CopyReject100OtherBASEBusEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Please contact your current operator to reactivate your number %MSISDN%. This will allow us to complete your porting to BASE.
)
clipboard := Stringmob
return
}

; MNP 115

Reject115BASEBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE BUSINESS REJECTCODE 115
Gui, Add, Text,, 
Gui, Add, Text,, OLO SIM CARDNUMBER
Gui, Add, Edit, vSIMOLO,
Gui, Add, Button, gCopyReject115BASEBusNL, COPY NL
Gui, Add, Button, gCopyReject115BASEBusFR, COPY FR
Gui, Add, Button, gCopyReject115BASEBusEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gSMSMnpRejectBASEBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyReject115BASEBusNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: We hebben een aanvraag gestart met SIM-kaartnummer %SIMOLO% van uw huidige provider. Deze is helaas geweigerd. Gelieve ons het correcte SIM-kaartnummer van uw huidige operator te bezorgen via 0486191940.
)
clipboard := Stringmob
return
}

CopyReject115BASEBusFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Nous avons lancé une demande avec le numéro de carte SIM %SIMOLO% de votre fournisseur actuel. Elle a malheureusement été refusée. Veuillez nous communiquer le numéro de carte SIM correct de votre opérateur actuel par téléphone à l'adresse 0486191940.
)
clipboard := Stringmob
return
}

CopyReject115BASEBusEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: We have started a request with SIM card number %SIMOLO% from your current provider. This has unfortunately been refused. Please provide us with the correct SIM card number of your current operator by phone 0486191940.
)
clipboard := Stringmob
return
}

; MNP 120

Reject120BASEBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE BUSINESS REJECTCODE 120
Gui, Add, Text,, 
Gui, Add, Text,, OLO CUSTOMER NUMBER
Gui, Add, Edit, vCMRNROLO,
Gui, Add, Button, gCopyReject120BASEBusNL, COPY NL
Gui, Add, Button, gCopyReject120BASEBusFR, COPY FR
Gui, Add, Button, gCopyReject120BASEBusEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gSMSMnpRejectBASEBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyReject120BASEBusNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: We hebben een aanvraag gestart met klantnummer %CMRNROLO% van uw huidige provider. Deze is helaas geweigerd. Gelieve ons het correcte klantnummer van uw huidige operator te bezorgen via 0486191940.
)
clipboard := Stringmob
return
}

CopyReject120BASEBusFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Nous avons lancé une demande avec le numéro de client %CMRNROLO% de votre fournisseur actuel. Elle a malheureusement été refusée. Veuillez nous communiquer le numéro de client correct de votre opérateur actuel par téléphone à l'adresse 0486191940.
)
clipboard := Stringmob
return
}

CopyReject120BASEBusEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: We have started a request with customer number %CMRNROLO% from your current provider. This has unfortunately been refused. Please provide us with the correct customer number of your current operator by phone at 0486191940.
)
clipboard := Stringmob
return
}

; MNP CANCEL

MNPCancelBASEBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE BUSINESS MNP CANCEL
Gui, Add, Text,, 
Gui, Add, Text,, MSISDN
Gui, Add, Edit, vMSISDN,
Gui, Add, Button, gCopyMNPCancelBASEBusNL, COPY NL
Gui, Add, Button, gCopyMNPCancelBASEBusFR, COPY FR
Gui, Add, Button, gCopyMNPCancelBASEBusEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gSMSMnpRejectBASEBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyMNPCancelBASEBusNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Helaas kregen we niet voldoende informatie om je nummeroverdracht voor het nummer %MSISDN% af te ronden. Deze werd daarom geannuleerd. Een nieuwe registratie is mogelijk via onze website, een winkelpunt of onze klantendienst.
)
clipboard := Stringmob
return
}

CopyMNPCancelBASEBusFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Malheureusement, nous n'avons pas reçu suffisamment d'informations pour effectuer votre transfert de numéro pour le numéro %MSISDN%. Celui-ci a donc été annulé. Un nouvel enregistrement est possible via notre site web, un point de vente ou notre service clientèle.
)
clipboard := Stringmob
return
}

CopyMNPCancelBASEBusEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Unfortunately, we did not receive sufficient information to complete your number transfer for the number %MSISDN%. This was therefore cancelled. A new registration is possible via our website, a retail outlet or our customer service.
)
clipboard := Stringmob
return
}

; IT TICKET MENU

ItTicketSmsBASEBus()
{
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE BUSINESS SMS IT TICKET
Gui, Add, Text,, 
Gui, Add, Button, gItNewBASEBusNL, NEW TICKET
Gui, Add, Button, gItUpdateBASEBusNL, UPDATE TICKET
Gui, add, Text,, 
Gui, Add, Button, gSmsBASEBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

; IT TICKET NEW

ItNewBASEBusNL()
{
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE BUSINESS SMS NEW TICKET
Gui, Add, Text,, 
Gui, Add, Button, gCopyItBASEBusNL, COPY NL
Gui, Add, Button, gCopyItBASEBusFR, COPY FR
Gui, Add, Button, gCopyItBASEBusEN, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gItTicketSmsBASEBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyItBASEBusNL()
{
Stringit =
(
BASE-Business: We hebben je dossier doorgestuurd naar onze IT-dienst en houden je op de hoogte. Bedankt voor uw geduld.
)
clipboard := Stringit
return
}

CopyItBASEBusFR()
{
Stringit =
(
BASE-Business: Nous avons transmis votre dossier à notre département IT et vous tiendrons au courant. Nous vous remercions de votre patience.
)
clipboard := Stringit
return
}

CopyItBASEBusEN()
{
Stringit =
(
BASE-Business: We have forwarded your case to our IT department and will keep you updated. Thank you for your patience.
)
clipboard := Stringit
return
}

; IT TICKET UPDATE

ItUpdateBASEBusNL()
{
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE BUSINESS SMS UPDATE TICKET
Gui, Add, Text,, 
Gui, Add, Button, gCopyItUpdateBASEBusNL, COPY NL
Gui, Add, Button, gCopyItUpdateBASEBusFR, COPY FR
Gui, Add, Button, gCopyItUpdateBASEBusEN, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gItTicketSmsBASEBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyItUpdateBASEBusNL()
{
Stringitupdate =
(
BASE-Business: Momenteel hebben we nog geen oplossing voor uw dossier. Onze IT-dienst werkt eraan. Bedankt voor uw geduld.
)
clipboard := Stringitupdate
return
}

CopyItUpdateBASEBusFR()
{
Stringitupdate =
(
BASE-Business: Actuellement, nous n'avons pas encore de solution pour votre dossier. Notre département IT y travaille. Nous vous remercions de votre patience.
)
clipboard := Stringitupdate
return
}

CopyItUpdateBASEBusEN()
{
Stringitupdate =
(
BASE-Business: Currently, we do not yet have a solution for your case. Our IT department is working on it. Thank you for your patience.
)
clipboard := Stringitupdate
return
}

; CROSSTEST MENU

CrosstestMenuSmsBASEBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE BUSINESS SMS CROSSTTEST
Gui, Add, Text,, 
Gui, Add, Button, gCrosstestBASEBus, CROSSTEST
Gui, Add, Button, gCrossReminderBASEBus, REMINDER CROSSTEST
Gui, add, Text,, 
Gui, Add, Button, gSmsBASEBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

; CROSSTEST NEW

CrosstestBASEBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE BUSINESS SMS CROSSTEST
Gui, Add, Text,, 
Gui, add, Text,, PEGA SC-ID
Gui, Add, Edit, vScid, 
Gui, Add, Text,, ISSUE (Short)
Gui, Add, Edit, vProblemshort
Gui, Add, Button, gCopyCrosstestBASENLBus, COPY NL
Gui, Add, Button, gCopyCrosstestBASEFRBus, COPY FR
Gui, Add, Button, gCopyCrosstestBASEENBus, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gCrosstestMenuSmsBASEBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyCrosstestBASENLBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: In verband met uw dossier (%Scid%) over %Problemshort%. Gelieve opnieuw te testen met uw SIM in een ander toestel en via de klantendienst (0486191940) door te geven of u nog een probleem ervaart. Indien ja, gelieve dan recente voorbeelden te voorzien. Elk voorbeeld moet bevatten: datum, tijdstip, contactnr, locatie (volledig adres) en probleemomschrijving per voorbeeld.
)
clipboard := Stringmob
return
}

CopyCrosstestBASEFRBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Concernant votre dossier (%Scid%) concernant %Problemshort%. Veuillez refaire un test avec votre carte SIM dans un autre appareil et faites-nous savoir par l'intermédiaire du service clientèle (0486191940) si le problème persiste. Si oui, veuillez fournir des exemples récents. Chaque exemple doit inclure: la date, l'heure, le numéro de contact, le lieu (adresse complète) et la description du problème par exemple.
)
clipboard := Stringmob
return
}

CopyCrosstestBASEENbus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Regarding your case (%Scid%) related to %Problemshort%. Please retest with your SIM in another device and let us know via customer service (0486191940) if you are still experiencing a problem. If yes, please provide recent examples. Each example should include: date, time, contact no, location (full address) and problem description per example.
)
clipboard := Stringmob
return
}

; CROSSTEST REMINDER

CrossReminderBASEBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE BUSINESS SMS CROSSTEST REMINDER
Gui, Add, Text,, 
Gui, Add, Button, gCopyCrossReminderBASENLBus, COPY NL
Gui, Add, Button, gCopyCrossReminderBASEFRBus, COPY FR
Gui, Add, Button, gCopyCrossReminderBASEENBus, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gCrosstestMenuSmsBASEBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyCrossReminderBASENLBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Gelieve via de klantendienst (0486191940) door te geven of u nog een probleem heeft ervaren toen u uw simkaart testte in een ander toestel. Indien ja, gelieve dan recente voorbeelden te voorzien. Elk voorbeeld moet bevatten: datum, tijdstip, contactnr, locatie (volledig adres) en probleemomschrijving per voorbeeld.
)
clipboard := Stringmob
return
}

CopyCrossReminderBASEFRBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Veuillez nous faire savoir par l'intermédiaire du service clientèle (0486191940) si vous avez rencontré un autre problème lorsque vous avez testé votre carte SIM dans un autre appareil. Dans l'affirmative, veuillez fournir des exemples récents. Chaque exemple doit comprendre: la date, l'heure, le numéro de contact, le lieu (adresse complète) et la description du problème par exemple.
)
clipboard := Stringmob
return
}

CopyCrossReminderBASEENBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Please let us know via customer service (0486191940) if you have experienced another problem when you tested your SIM card in another device. If yes, please provide recent examples. Each example should include: date, time, contact no, location (full address) and problem description per example.
)
clipboard := Stringmob
return
}

; VOICE2.0 MENU

VowifiMenuBASEBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE BUSINESS SMS VOICE2.0
Gui, Add, Text,, 
Gui, Add, Button, gVowifiActiveBASEBus, ACTIVE / CERTIFIED
Gui, Add, Button, gVowifiDeviceBASEBus, DEVICE NOK
Gui, add, Text,, 
Gui, Add, Button, gSmsBASEBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

; VOICE2.0 ACTIVE

VowifiActiveBASEBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE BUSINESS SMS VOICE2.0
Gui, Add, Text,, 
Gui, Add, Button, gCopyVowifiBASEBusNL, COPY NL
Gui, Add, Button, gCopyVowifiBASEBusFR, COPY FR
Gui, Add, Button, gCopyVowifiBASEBusEN, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gSmsBASEBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyVowifiBASEBusNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Bellen over 4G (VoLTE) en bellen over WiFi (VoWiFi) werd voor u geactiveerd op het netwerk. Gelieve na te kijken dat op uw toestel de laatste updates van de fabrikant geinstalleerd zijn. Activeer Voice over WiFi via de instellingen en herstart hierna uw toestel. Meer info: https://www.prd.base.be/nl/support/wifi-4g-5g/hoe-mobiel-bellen-via-4G-en-wifi/
)
clipboard := Stringmob
return
}

CopyVowifiBASEBusFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: les appels sur la 4G (VoLTE) et les appels sur le WiFi (VoWiFi) ont été activés pour vous sur le réseau. Veuillez vérifier que les dernières mises à jour du fabricant sont installées sur votre appareil. Activez Voice over WiFi via les paramètres et redémarrez ensuite votre appareil et. Info: https://www.prd.base.be/fr/support/wifi-4g-5g/comment-passer-des-appels-mobiles-via-4G-et-wifi/
)
clipboard := Stringmob
return
}

CopyVowifiBASEBusEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Calling over 4G (VoLTE) and calling over WiFi (VoWiFi) has been activated for you on the network. Please check that the latest manufacturer updates are installed on your device. Activate Voice over WiFi via the settings and then reboot your device. More info: https://www.prd.base.be/en/support/wi-fi-4g-5g/mobile-calls-via-4g-and-wi-fi/
)
clipboard := Stringmob
return
}

; VOICE2.0 DEVICE NOK

VowifiDeviceBASEBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE BUSINESS SMS VOICE2.0
Gui, Add, Text,, 
Gui, Add, Button, gCopyVowifiDeviceBASEBusNL, COPY NL
Gui, Add, Button, gCopyVowifiDeviceBASEBusFR, COPY FR
Gui, Add, Button, gCopyVowifiDeviceBASEBusEN, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gSmsBASEBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyVowifiDeviceBASEBusNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Helaas is uw huidige toestel (nog) niet compatibel met VoLTE (voice over LTE) en VoWiFi (voice over WiFi). Meer info op: https://www.base.be/nl/veelgestelde-vragen/netwerk-toestellen/hoe-mobiel-bellen-via-4G-en-wifi.html
)
clipboard := Stringmob
return
}

CopyVowifiDeviceBASEBusFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Malheureusement, votre appareil actuel n'est pas (encore) compatible avec VoLTE (voice over LTE) et VoWiFi (voice over WiFi). Plus d'informations: https://www.base.be/fr/questions-frequentes/reseau-appareils/Comment-passer-des-appels-mobiles-via-4G-et-wifi.html
)
clipboard := Stringmob
return
}

CopyVowifiDeviceBASEBusEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Unfortunately, your current device is not (yet) compatible with VoLTE (voice over LTE) and VoWiFi (voice over WiFi). More info at: https://www.base.be/en/frequently-asked-questions/network-devices/how-to-make-mobile-calls-via-4G-and-Wi-Fi.html
)
clipboard := Stringmob
return
}

; COVERAGE MENU

CoverageBASEBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE BUSINESS SMS COVERAGE
Gui, Add, Text,, 
Gui, Add, Button, gIncidentBASEBus, ONGOING INCIDENT (GIS)
Gui, Add, Button, gOneTBASEBus, ONE-T CHANGE
Gui, Add, Button, gOneTReminderBASEBus, REMINDER ONE-T CHANGE
Gui, Add, Button, gNoCoverageBASEBus, NO COVERAGE
Gui, Add, Button, gDegradationBASEBus, DEGRADATION
Gui, Add, Button, gRoamingBASEBus, ROAMING
Gui, add, Text,, 
Gui, Add, Button, gSmsBASEBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

; ONGOING INCIDENT

IncidentBASEBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE SMS ONGOING INCIDENT
Gui, Add, Text,, 
Gui, Add, Button, gCopyIncidentBASEBusNL, COPY NL
Gui, Add, Button, gCopyIncidentBASEBusFR, COPY FR
Gui, Add, Button, gCopyIncidentBASEBusEN, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gCoverageBASEBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyIncidentBASEBusNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Er is momenteel een probleem vastgesteld op de zendmast in uw regio. We doen er alles aan om dit probleem zo snel mogelijk op te lossen. Onze exuses voor het ongemak.
)
clipboard := Stringmob
return
}

CopyIncidentBASEBusFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Un problème a été identifié sur le mât de transmission dans votre région. Nous mettons tout en œuvre pour résoudre ce problème dans les plus brefs délais. Nous vous prions de nous excuser pour la gêne occasionnée.
)
clipboard := Stringmob
return
}

CopyIncidentBASEBusEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: A problem has currently been identified on the transmission mast in your area. We are making every effort to solve this problem as soon as possible. Our apologies for the inconvenience.
)
clipboard := Stringmob
return
}

; ONE T CHANGE

OneTBASEBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE BUSINESS SMS ONE-T CHANGE
Gui, Add, Text,, 
Gui, Add, Button, gCopyOneTBASENLBus, COPY NL
Gui, Add, Button, gCopyOneTBASEFRBus, COPY FR
Gui, Add, Button, gCopyOneTBASEENBus, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gCoverageBASEBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyOneTBASENLBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: I.v.m. uw dossier werd een aanpassing uitgevoerd op het netwerk. Gelieve enkele dagen te testen en via de klantendienst (0486191940) door te geven of u nog een probleem ervaart. Indien ja, gelieve dan recente voorbeelden te voorzien vanaf de dag van deze SMS. Elk voorbeeld moet bevatten: datum, tijdstip, contactnr, volledig adres, probleemomschrijving per voorbeeld.
)
clipboard := Stringmob
return
}

CopyOneTBASEFRBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Une adaptation du réseau a été effectuée en rapport avec votre dossier. Veuillez tester pendant quelques jours et nous faire savoir par l'intermédiaire du service clientèle (0486191940) si vous rencontrez toujours un problème. Dans l'affirmative, veuillez fournir des exemples récents à partir du jour de ce SMS. Chaque exemple doit comprendre: la date, l'heure, le numéro de contact, adresse, la description du problème par exemple.
)
clipboard := Stringmob
return
}

CopyOneTBASEENBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: An adjustment was made to the network in connection with your case. Please test for a few days and let us know via customer service (0486191940) if you are still experiencing a problem. If yes, please provide recent examples from the day of this SMS. Each example should include: date, time, contact nr, full address, problem description per example.
)
clipboard := Stringmob
return
}

; ONE T REMINDER

OneTReminderBASEBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE BUSINESS SMS ONE-T REMINDER
Gui, Add, Text,, 
Gui, Add, Button, gCopyOneTReminderBASENLBus, COPY NL
Gui, Add, Button, gCopyOneTReminderBASEFRBus, COPY FR
Gui, Add, Button, gCopyOneTReminderBASEENBus, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gCoverageBASEBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyOneTReminderBASENLBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: We hebben helaas nog geen feedback ontvangen. Gelieve via de klantendienst (0486191940) door te geven of u nog een probleem ervaart. Indien ja, gelieve dan recente voorbeelden te voorzien van de laatste drie dagen. Elk voorbeeld moet bevatten: datum, tijdstip, contactnr, probleemomschrijving per voorbeeld.
)
clipboard := Stringmob
return
}

CopyOneTReminderBASEFRBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Malheureusement, nous n'avons pas encore reçu de commentaires. Veuillez contacter le service clientèle (0486191940) si vous rencontrez toujours un problème. Dans l'affirmative, veuillez fournir des exemples récents des trois derniers jours. Chaque exemple doit comprendre: la date, l'heure, le numéro de contact, la description du problème par exemple.
)
clipboard := Stringmob
return
}

CopyOneTReminderBASEENBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Unfortunately, we have not yet received any feedback. Please pass on via customer service (0486191940) if you are still experiencing a problem. If yes, please provide recent examples from the last three days. Each example should include: date, time, contact no, problem description per example.
)
clipboard := Stringmob
return
}

; NO COVERAGE

NoCoverageBASEBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE BUSINESS SMS NO COVERAGE
Gui, Add, Text,, 
Gui, Add, Button, gCopyNoCoverageBASENLBus, COPY NL
Gui, Add, Button, gCopyNoCoverageBASEFRBus, COPY FR
Gui, Add, Button, gCopyNoCoverageBASEENBus, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gCoverageBASEBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyNoCoverageBASENLBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Helaas is het bereik op het opgegeven adres niet ideaal. We hopen hier in de toekomst verbetering in te brengen. In de tussentijd raden we aan om voor uw gesprekken via Voice over WiFi altijd dicht in de buurt van uw WiFi zendstation te blijven.
)
clipboard := Stringmob
return
}

CopyNoCoverageBASEFRBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Malheureusement, la couverture à l'adresse indiquée n'est pas idéale. Nous espérons pouvoir l'améliorer à l'avenir. En attendant, nous vous recommandons de toujours rester à proximité de votre station d'émission WiFi pour vos appels Voice over WiFi.
)
clipboard := Stringmob
return
}

CopyNoCoverageBASEENBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Unfortunately, the coverage at the given address is not ideal. We hope to improve this in the future. In the meantime, we recommend always staying close to your WiFi transmitting station for your Voice over WiFi calls.
)
clipboard := Stringmob
return
}

; DEGRADATION

DegradationBASEBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE BUSINESS SMS DEGRADATION
Gui, Add, Text,, 
Gui, add, Text,, MSISDN
Gui, Add, Edit, vMSISDN, 
Gui, Add, Button, gCopyDegradationBASENLBus, COPY NL
Gui, Add, Button, gCopyDegradationBASEFRBus, COPY FR
Gui, Add, Button, gCopyDegradationBASEENBus, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gCoverageBASEBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyDegradationBASENLBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Uw nummer %MSISDN% veroorzaakt momenteel storing op het Telenet radionetwerk. Gelieve deze stappen te volgen om ons te helpen het probleem op te lossen. Controleer of u de laatste updates van je fabrikant hebt. Herstart uw toestel.
)
clipboard := Stringmob
return
}

CopyDegradationBASEFRBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Votre numéro %MSISDN% provoque actuellement des interférences sur le réseau radio de Telenet. Veuillez suivre les étapes suivantes pour nous aider à résoudre le problème. Assurez-vous que vous disposez des dernières mises à jour de votre fabricant. Redémarrez votre appareil.
)
clipboard := Stringmob
return
}

CopyDegradationBASEENBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Your number %MSISDN% is currently causing interference on the Telenet radio network. Please follow these steps to help us solve the problem. Make sure you have the latest updates from your manufacturer. Reboot your device.
)
clipboard := Stringmob
return
}

; ROAMING

RoamingBASEBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE BUSINESS SMS ROAMING
Gui, Add, Text,, 
Gui, Add, Button, gCopyRoamingBASENLBus, COPY NL
Gui, Add, Button, gCopyRoamingBASEFRBus, COPY FR
Gui, Add, Button, gCopyRoamingBASEENBus, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gCoverageBASEBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyRoamingBASENLBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Indien u in de toekomst een probleem ervaart met het verbinden met een roaming netwerk, gelieve dan manueel naar netwerken te zoeken, met elke zichtbare operator 5 verbindingspogingen op te zetten en indien problemen de volgende informatie door te geven per poging: datum, tijdstip, naam netwerk, eventuele foutmelding.
)
clipboard := Stringmob
return
}

CopyRoamingBASEFRBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Si vous rencontrez un problème de connexion à un réseau d'itinérance à l'avenir, veuillez rechercher les réseaux manuellement, effectuer cinq tentatives de connexion avec chaque opérateur visible et, en cas de problème, fournir les informations suivantes pour chaque tentative: date, heure, nom du réseau, message d'erreur éventuel.
)
clipboard := Stringmob
return
}

CopyRoamingBASEENBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: If you experience a problem connecting to a roaming network in the future, please search for networks manually, set up 5 connection attempts with each visible operator and if problems, provide the following information for each attempt: date, time, network name, any error message.
)
clipboard := Stringmob
return
}

; PID BASE BUSINESS MENU

PIDBASEBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE BUSINESS PID
Gui, Add, Text,, 
Gui, Add, Button, gPIDLoginBASEBus, PID LOGIN
Gui, Add, Button, gPIDMailBASEBus, MAIL LINKED
Gui, Add, Button, gPIDInviteBASEBus, PID INVITE SENT
Gui, Add, Button, gPIDPasswordResetBASEBus, PASSWORD RESET
Gui, add, Text,, 
Gui, Add, Button, gSmsBASEBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

PIDLoginBASEBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE BUSINESS PID LOGIN
Gui, Add, Text,, 
Gui, add, Text,, E-MAIL
Gui, Add, Edit, vEMAIL, 
Gui, Add, Button, gCopyPIDLoginBASEBusNL, COPY NL
Gui, Add, Button, gCopyPIDLoginBASEBusFR, COPY FR
Gui, Add, Button, gCopyPIDLoginBASEBusEN, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gPIDBASEBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyPIDLoginBASEBusNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Uw login %EMAIL% is beschikbaar. Gelieve opnieuw in te loggen.
)
clipboard := Stringmob
return
}

CopyPIDLoginBASEBusFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Votre login %EMAIL% est disponible. Veuillez vous connecter à nouveau.
)
clipboard := Stringmob
return
}

CopyPIDLoginBASEBusEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Your login %EMAIL% is available. Please login again.
)
clipboard := Stringmob
return
}

PIDMailBASEBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE BUSINESS MAIL LINKED
Gui, Add, Text,, 
Gui, add, Text,, E-MAIL
Gui, Add, Edit, vEMAIL, 
Gui, Add, Button, gCopyPIDMailBASEBusNL, COPY NL
Gui, Add, Button, gCopyPIDMailBASEBusFR, COPY FR
Gui, Add, Button, gCopyPIDMailBASEBusEN, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gPIDBASEBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyPIDMailBASEBusNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Uw login is vanaf nu gekoppeld met e-mailadres: %EMAIL%
)
clipboard := Stringmob
return
}

CopyPIDMailBASEBusFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Votre login est maintenant lié à votre adresse e-mail: %EMAIL%
)
clipboard := Stringmob
return
}

CopyPIDMailBASEBusEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Your login is now linked with e-mail address: %EMAIL%
)
clipboard := Stringmob
return
}

PIDInviteBASEBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE BUSINESS PID INVITE SENT
Gui, Add, Text,, 
Gui, add, Text,, E-MAIL
Gui, Add, Edit, vEMAIL, 
Gui, Add, Button, gCopyPIDInviteBASEBusNL, COPY NL
Gui, Add, Button, gCopyPIDInviteBASEBusFR, COPY FR
Gui, Add, Button, gCopyPIDInviteBASEBusEN, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gPIDBASEBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyPIDInviteBASEBusNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: We hebben naar je e-mailadres %EMAIL% een nieuwe uitnodiging verstuurd voor het voltooien van je login. Werkt het nog niet? Laat via de klantendienst op 0486191940 weten in welke stap, de foutmelding en eventueel andere relevante informatie.
)
clipboard := Stringmob
return
}

CopyPIDInviteBASEBusFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Nous avons envoyé à votre adresse e-mail %EMAIL% une nouvelle invitation à compléter votre login. Cela ne fonctionne toujours pas? Veuillez nous informer via le service clientèle à l'adresse 0486191940 de l'étape, du message d'erreur et de toute autre information pertinente.
)
clipboard := Stringmob
return
}

CopyPIDInviteBASEBusEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: We have sent to your e-mail address %EMAIL% a new invitation to complete your login. Still not working? Please let us know via customer service at 0486191940 in which step, the error message and any other relevant information.
)
clipboard := Stringmob
return
}

PIDPasswordResetBASEBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE BUSINESS PID PASSWORD RESET
Gui, Add, Text,, 
Gui, add, Text,, E-MAIL
Gui, Add, Edit, vEMAIL, 
Gui, add, Text,, NEW PASSWORD
Gui, Add, Edit, vPassword, 
Gui, Add, Button, gCopyPIDPasswordResetBASEBusNL, COPY NL
Gui, Add, Button, gCopyPIDPasswordResetBASEBusFR, COPY FR
Gui, Add, Button, gCopyPIDPasswordResetBASEBusEN, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gPIDBASEBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyPIDPasswordResetBASEBusNL()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Het wachtwoord van uw e-mailadres %EMAIL% is succesvol veranderd naar: %Password%
)
clipboard := Stringmob
return
}

CopyPIDPasswordResetBASEBusFR()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Le mot de passe de votre adresse e-mail %EMAIL% a été modifié avec succès en: %Password%
)
clipboard := Stringmob
return
}

CopyPIDPasswordResetBASEBusEN()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Your email address %EMAIL% password has been successfully changed to: %Password%
)
clipboard := Stringmob
return
}

; ESIM MENU

EsimBASEBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE BUSINESS SMS ESIM / ONE NUMBER
Gui, Add, Text,, 
Gui, Add, Button, gEsimActiveBASEBus, ESIM ACTIVATION
Gui, Add, Button, gEsimDeActiveBASEBus, ESIM DEACTIVATION & ACTIVATION
Gui, Add, Button, gEsimDeviceBASEBus, DEVICE NOK
Gui, add, Text,, 
Gui, Add, Button, gSmsBASEBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

; ESIM ACTIVE

EsimActiveBASEBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE BUSINESS SMS ESIM ACTIVATION
Gui, Add, Text,, 
Gui, Add, Button, gCopyEsimActiveBASENLBus, COPY NL
Gui, Add, Button, gCopyEsimActiveBASEFRBus, COPY FR
Gui, Add, Button, gCopyEsimActiveBASEENBus, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gEsimBASEBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyEsimActiveBASENLBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Gelieve uw gsm en smartwatch te herstarten, opnieuw te proberen om uw smartwatch te koppelen, en de klantendienst (0486191940) te informeren of u nog een probleem ervaart. Indien ja, gelieve door te geven in welke stap dit faalt en welke informatie op dat moment ingegeven wordt + datum & tijdstip + foutmelding + type watch + EID van de watch.
)
clipboard := Stringmob
return
}

CopyEsimActiveBASEFRBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Veuillez redémarrer votre téléphone portable et votre smartwatch, essayez à nouveau de coupler votre smartwatch et informez le service clientèle (0486191940) si le problème persiste. Dans l'affirmative, veuillez indiquer à quelle étape l'opération a échoué et quelles informations sont actuellement saisies: date et heure, message d'erreur, type de montre et numéro d'identification de la montre.
)
clipboard := Stringmob
return
}

CopyEsimActiveBASEENBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Please reboot your mobile phone and smartwatch, try again to pair your smartwatch, and inform customer service (0486191940) if you are still experiencing a problem. If yes, please pass on in which step this fails and what information is currently entered + date & time + error message + watch type + watch EID.
)
clipboard := Stringmob
return
}

; ESIM DEACTIVATE ACTIVE

EsimDeActiveBASEBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TELENET SMS ESIM DEACTIVATION & ACTIVATION
Gui, Add, Text,, 
Gui, Add, Button, gCopyEsimDeActiveBASENLBus, COPY NL
Gui, Add, Button, gCopyEsimDeActiveBASEFRBus, COPY FR
Gui, Add, Button, gCopyEsimDeActiveBASEENBus, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gEsimBASEBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyEsimDeActiveBASENLBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Gelieve uw smartwatch te ontkoppelen via MyBASE-app en dan uw gsm en smartwatch te herstarten. Gelieve daarna opnieuw te proberen om uw smartwatch te koppelen en de klantendienst (0486191940) te informeren of u nog een probleem ervaart. Indien ja, gelieve door te geven in welke stap dit faalt en welke informatie op dat moment ingegeven wordt + datum & tijdstip + foutmelding + type watch + EID van de watch.
)
clipboard := Stringmob
return
}

CopyEsimDeActiveBASEFRBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Veuillez déconnecter votre smartwatch via MyBASE-app et redémarrer votre téléphone mobile et votre smartwatch. Ensuite, essayez à nouveau de coupler votre smartwatch et informez le service clientèle (0486191940) si le problème persiste. Dans l'affirmative, veuillez indiquer à quelle étape l'opération a échoué et quelles informations sont actuellement saisies + date et heure + message d'erreur + type de montre + EID de la montre.
)
clipboard := Stringmob
return
}

CopyEsimDeActiveBASEENBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Please disconnect your smartwatch via MyBASE-app and then reboot your cell phone and smartwatch. After that, please try to pair your smartwatch again and inform customer service (0486191940) if you are still experiencing a problem. If yes, please indicate in which step this fails and what information is entered at that time + date & time + error message + type of watch + EID of the watch.
)
clipboard := Stringmob
return
}

; ESIM DEVICE NOK

EsimDeviceBASEBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE BUSINESS SMS ESIM DEVICE NOK
Gui, Add, Text,, 
Gui, Add, Button, gCopyEsimDeviceBASENLBus, COPY NL
Gui, Add, Button, gCopyEsimDeviceBASEFRBus, COPY FR
Gui, Add, Button, gCopyEsimDeviceBASEENBus, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gEsimBASEBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyEsimDeviceBASENLBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Helaas worden voor Smartwatches van Samsung enkel koppelingen ondersteund met de Samsung smartphones.
)
clipboard := Stringmob
return
}

CopyEsimDeviceBASEFRBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Malheureusement, pour les Smartwatches Samsung, seuls les couplages avec les smartphones Samsung sont pris en charge.
)
clipboard := Stringmob
return
}

CopyEsimDeviceBASEENBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Unfortunately, for Samsung Smartwatches, only pairings are supported with Samsung smartphones.
)
clipboard := Stringmob
return
}

; ROUTING OLO OK

RoutingOLOBASEBus()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, BASE BUSINESS SMS ROUTING OLO OK
Gui, Add, Text,, 
Gui, Add, Button, gCopyRoutingOLOBASENLBus, COPY NL
Gui, Add, Button, gCopyRoutingOLOBASEFRBus, COPY FR
Gui, Add, Button, gCopyRoutingOLOBASEENBus, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gSmsBASEBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyRoutingOLOBASENLBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: We hebben contact gehad met de operator van de nummer(s) die u niet kunnen bereiken en krijgen de bevestiging dat het in orde moet zijn. Indien er alsnog een probleem is moet de beller contact opnemen met de eigen operator.
)
clipboard := Stringmob
return
}

CopyRoutingOLOBASEFRBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: Nous avons contacté l'opérateur du (des) numéro(s) qui ne peut pas vous joindre et nous avons reçu la confirmation que cela devrait aller. Si le problème persiste, l'appelant doit contacter son propre opérateur.
)
clipboard := Stringmob
return
}

CopyRoutingOLOBASEENBus()
{
global
Gui, Submit, NoHide
Stringmob = 
(
BASE-Business: We have contacted the operator of the number(s) that cannot reach you and receive confirmation that it should be OK. If there is still a problem, the caller should contact their own operator.
)
clipboard := Stringmob
return
}

; DATE 2 DAYS FURTHER

DateFurther()
{
TodayName=%A_DDDD%

IfEqual,TodayName,donderdag
{
         AddMe=4
}
Else IfEqual,TodayName,Thursday
{
         AddMe=4
}
Else IfEqual,TodayName,vrijdag
{
         AddMe=4
}
Else IfEqual,TodayName,Friday
{
         AddMe=4
}
Else IfEqual,TodayName,zaterdag
{
         AddMe=4
}
Else IfEqual,TodayName,Saturday
{
         AddMe=3
}
Else
{
         AddMe=2
}

Date := A_Now 
Date += %AddMe%, Days
FormatTime, nDate, %Date%, yyMMdd
return %nDate%
}

; MAIL MENU

; MAIL PLANNING

MailPlanningMob(){
global
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, MAIL PLANNING
Gui, add, Text,, 
Gui, Add, DropDownList, vPlanningList, AANPASSING TV||SHIFTWISSEL|VERLOF|TAAK|MEETING
Gui, add, Text,,
Gui, Add, Text,, DATE OF IMPACTED DAY (YYMMDD)
Gui, Add, Edit, vDate
Gui, add, Text,,
Gui, Add, Button, gCopyMailPlanning, CREATE MAIL
Gui, add, Text,, 
Gui, Add, Button, gTBOServices, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyMailPlanning()
{
global
Gui, Submit, Nohide
CheckOutlook()

subjr = %Date%___PLANNING___%PlanningList%

rejbod = 
(
Hallo,<br><br>
"Enter your question."<br><br>
"Signature"
)
MailFromTest(subjr, rejbod, "sofie.verschueren@telenetgroup.be", "nena.xantippe@telenetgroup.be;evi.uytterschaut@telenetgroup.be", "")
return
}

MailPlanningBB1(){
global
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, MAIL PLANNING - BROADBAND 1
Gui, add, Text,, 
Gui, Add, DropDownList, vPlanningList, AANPASSING TV||SHIFTWISSEL|VERLOF|TAAK|MEETING
Gui, add, Text,,
Gui, Add, Text,, DATE OF IMPACTED DAY (YYMMDD)
Gui, Add, Edit, vDate
Gui, add, Text,,
Gui, Add, Button, gCopyMailPlanningBB1, CREATE MAIL
Gui, add, Text,, 
Gui, Add, Button, gMailPlanningBB, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyMailPlanningBB1()
{
global
Gui, Submit, Nohide
CheckOutlook()

subjr = %Date%___PLANNING___%PlanningList%

rejbod = 
(
Hallo,<br><br>
"Enter your question."<br><br>
"Signature"
)
MailFromTest(subjr, rejbod, "", "frederik.bruninx@telenetgroup.be", "")
return
}

MailPlanningBB2(){
global
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, MAIL PLANNING - BROADBAND 2
Gui, add, Text,, 
Gui, Add, DropDownList, vPlanningList, AANPASSING TV||SHIFTWISSEL|VERLOF|TAAK|MEETING
Gui, add, Text,,
Gui, Add, Text,, DATE OF IMPACTED DAY (YYMMDD)
Gui, Add, Edit, vDate
Gui, add, Text,,
Gui, Add, Button, gCopyMailPlanningBB2, CREATE MAIL
Gui, add, Text,, 
Gui, Add, Button, gMailPlanningBB, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyMailPlanningBB2()
{
global
Gui, Submit, Nohide
CheckOutlook()

subjr = %Date%___PLANNING___%PlanningList%

rejbod = 
(
Hallo,<br><br>
"Enter your question."<br><br>
"Signature"
)
MailFromTest(subjr, rejbod, "", "pieter.kempen@telenetgroup.be", "")
return
}

MailPlanningAccess1(){
global
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, MAIL PLANNING - ACCESS 1
Gui, add, Text,, 
Gui, Add, DropDownList, vPlanningList, AANPASSING TV||SHIFTWISSEL|VERLOF|TAAK|MEETING
Gui, add, Text,,
Gui, Add, Text,, DATE OF IMPACTED DAY (YYMMDD)
Gui, Add, Edit, vDate
Gui, add, Text,,
Gui, Add, Button, gCopyMailPlanningAccess1, CREATE MAIL
Gui, add, Text,, 
Gui, Add, Button, gMailPlanningAccess, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyMailPlanningAccess1()
{
global
Gui, Submit, Nohide
CheckOutlook()

subjr = %Date%___PLANNING___%PlanningList%

rejbod = 
(
Hallo,<br><br>
"Enter your question."<br><br>
"Signature"
)
MailFromTest(subjr, rejbod, "", "kris.houben@telenetgroup.be", "")
return
}

MailPlanningAccess2(){
global
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, MAIL PLANNING - ACCESS 2
Gui, add, Text,, 
Gui, Add, DropDownList, vPlanningList, AANPASSING TV||SHIFTWISSEL|VERLOF|TAAK|MEETING
Gui, add, Text,,
Gui, Add, Text,, DATE OF IMPACTED DAY (YYMMDD)
Gui, Add, Edit, vDate
Gui, add, Text,,
Gui, Add, Button, gCopyMailPlanningAccess2, CREATE MAIL
Gui, add, Text,, 
Gui, Add, Button, gMailPlanningAccess, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyMailPlanningAccess2()
{
global
Gui, Submit, Nohide
CheckOutlook()

subjr = %Date%___PLANNING___%PlanningList%

rejbod = 
(
Hallo,<br><br>
"Enter your question."<br><br>
"Signature"
)
MailFromTest(subjr, rejbod, "", "jellis.leemans@telenetgroup.be", "")
return
}

MailPlanningAccess3(){
global
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, MAIL PLANNING - ACCESS 3
Gui, add, Text,, 
Gui, Add, DropDownList, vPlanningList, AANPASSING TV||SHIFTWISSEL|VERLOF|TAAK|MEETING
Gui, add, Text,,
Gui, Add, Text,, DATE OF IMPACTED DAY (YYMMDD)
Gui, Add, Edit, vDate
Gui, add, Text,,
Gui, Add, Button, gCopyMailPlanningAccess3, CREATE MAIL
Gui, add, Text,, 
Gui, Add, Button, gMailPlanningAccess, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyMailPlanningAccess3()
{
global
Gui, Submit, Nohide
CheckOutlook()

subjr = %Date%___PLANNING___%PlanningList%

rejbod = 
(
Hallo,<br><br>
"Enter your question."<br><br>
"Signature"
)
MailFromTest(subjr, rejbod, "", "jan.cilissen@telenetgroup.be", "")
return
}

; REJECT MAIL MENU

RejectMailOLO()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, REJECT MAIL OLO
Gui, add, Text,, 
Gui, add, Text,, BRAND
Gui, Add, DropDownList, vTelbase, TELENET||BASE
Gui, add, Text,, REJECT REASON
Gui, Add, DropDownList, vRejectReason, 100 - NOT ACTIVE||105 - BIPT EXCEPTION|115 - SIM CARDNR MISMATCH|120 - CUSTOMERNR MISMATCH|155 - NATURAL PERSON|190 - OTHER
Gui, add, Text,, TYPE
Gui, Add, DropDownList, vMNPType, PREPAID||POSTPAID-SIMPLE|POSTPAID-COMPLEX
Gui, add, Text,, MSISDN
Gui, Add, Edit, vMSISDN
Gui, add, Text,, SIM CARDNR OLO
Gui, Add, Edit, vSIMOLO
Gui, add, Text,, CUSTOMERNR OLO
Gui, Add, Edit, vCMRNROLO
Gui, add, Text,, SERVICE CASE ID
Gui, Add, Edit, vScid
Gui, add, Text,, 
Gui, Add, Button, gCopyRejectMailOLO, CREATE MAIL
Gui, add, Text,, 
Gui, Add, Button, gMobileServMail, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

; REJECT MAIL

CopyRejectMailOLO(){
global
Gui, Submit, Nohide
CheckOutlook()
dater := DateFurther()

subjr = %dater% / %Telbase% / Reject %RejectReason% / %MSISDN% / %Scid%

rejbod = 
(
<H2></H2>
<HTML>
<textarea>
Hi,<br><br>
Kindly check the following MNP request.<br><br>
Type: %MNPType%<br>
MSISDN: %MSISDN%<br>
Simcard number: %SIMOLO%<br>
Customer Number: %CMRNROLO%<br>
We received a reject on: <b>%RejectReason%</b><br><br>
Kindly check at your side and give us a detailed description of the problem?<br><br>
Thanks in advance.<br><br></textarea>
</HTML>
)

MailFromTest(subjr, rejbod, "mnp@telenetgroup.be", "", "mnp@telenetgroup.be")
}

; T-VIOLATION MAIL MENU

TViolationMail()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, T-VIOLATION MAIL OLO
Gui, add, Text,, 
Gui, Add, Button, gT1violation, T1-VIOLATION
Gui, Add, Button, gT3violation, T3-VIOLATION
Gui, Add, Button, gT4violation, T4-VIOLATION
Gui, add, Text,, 
Gui, Add, Button, gMobileServMail, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}
	
; T1 VIOLATION

T1violation()
{
CheckOutlook()
Inputbox,MSISDN,MSISDN,MSISDN
Inputbox,Telbase,TELENET / BASE,TELENET / BASE
datet1 := DateFurther()
subt1 = %datet1% / %Telbase% / Pending Validation(s) / T1 Violation(s)

t1viol = 
(
<H2></H2>
<HTML> 
<textarea>
Hi,<br><br>
Kindly send the Accept or Reject for MSISDN('s) below:<br>
<b>%MSISDN%</b><br><br>
Thanks in advance.<b><br></textarea>
</HTML>
)
MailFromTest(subt1, t1viol, "mnp@telenetgroup.be", "", "mnp@telenetgroup.be")
}

; T3 VIOLATION

T3violation(){
CheckOutlook()
Inputbox,MSISDN,MSISDN,MSISDN
Inputbox,Telbase,TELENET / BASE,TELENET / BASE
datet3 := DateFurther()
subt3 = %datet3% / %Telbase% / Pending Execution(s) / T3 Violation(s)

t3viol = 
(
<H2></H2>
<HTML> 
<textarea>Hi,<br><br>
Kindly send the Ready for MSISDN(’s) below:<br>
<b>%MSISDN%</b><br><br>
Thanks in advance.<br><br></textarea>
</HTML>
)

MailFromTest(subt3, t3viol, "mnp@telenetgroup.be", "", "mnp@telenetgroup.be")
}

; T4 VIOLATION

T4violation()
{
CheckOutlook()
Inputbox,MSISDN,MSISDN,MSISDN
Inputbox,Telbase,TELENET / BASE,TELENET / BASE
datet4 := DateFurther()
subt4 = %datet4% / %Telbase% / Pending Execution(s) / T4 Violation(s)

t4viol = 
(
<H2></H2>
<HTML> 
<textarea>
Hi,<br><br>
Kindly send the RFS for MSISDN(’s) below:<br>
<b>%MSISDN%</b><br><br>
Thanks in advance.<br><br></textarea>
</HTML>
)
MailFromTest(subt4, t4viol, "mnp@telenetgroup.be", "", "mnp@telenetgroup.be")
}

; PORTBACK

PortBackMail()
{
CheckOutlook()
Inputbox,Scid,PEGA SC-ID,PEGA SC-ID
Inputbox,MSISDN,MSISDN,MSISDN
Inputbox,Telbase,TELENET / BASE,TELENET / BASE
datep := DateFurther()
subp = %datep% / %Telbase% / Portback %MSISDN% / %Scid%
pbod = 
(
<H2></H2>
<HTML> <br>
<textarea>
Hi,<br><br>
Do you have a signed contract for %MSISDN%<br>
If not, kindly provide port back info.<br><br>
Thanks in advance.<br></textarea>
</HTML>
)

MailFromTest(subp, pbod, "mnp@telenetgroup.be", "", "mnp@telenetgroup.be")
}

; ROUTING

RoutingMail()
{
CheckOutlook()
Inputbox,Scid,PEGA SC-ID,PEGA SC-ID
Inputbox,MSISDN,MSISDN,MSISDN
Inputbox,Telbase,TELENET / BASE,TELENET / BASE
dater := DateFurther()
subr = %dater% / %Telbase% / Routing %MSISDN% / %Scid%
rbod = 
(
<H2></H2>
<HTML>
<textarea>
Hi,<br><br>
Kindly check the routing for <b>%MSISDN%</b><br>
Our customer cannot receive calls and SMS from your side.<br><br>
Thanks in advance.<br><br></textarea>
</HTML>
)
MailFromTest(subr, rbod, "mnp@telenetgroup.be", "", "mnp@telenetgroup.be")
}

; OLO PROX BB

OloPx(){
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, MAIL PROXIMUS
Gui, Add, Text,, 
Gui, Add, Text,, PHONE NUMBER
Gui, Add, Edit, vOlopxtelefoonnummer
Gui, Add, Text,, SC-ID
Gui, Add, Edit, vOloscid
Gui, Add, Text,, YOUR NAME
Gui, Add, Edit, vOlonaam  
Gui, add, Button, gClear, CLEAR
Gui, Add, Button, gCopyOloPx, CREATE
Gui, Add, Text,, 
Gui, Add, Button, gBroadbandServMail, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

CopyOloPx()
{
global
Gui, Submit, Nohide
CheckOutlook()

Subolopx = %Olopxtelefoonnummer%___Niet bereikbaar voor Proximus___%Oloscid%
Stringolopx =
(
<p>Beste,</p>
<p>Het nummer %Olopxtelefoonnummer% is niet bereikbaar voor Proximus abonnees.<br>
Kunnen jullie de routering nakijken?</p>
<p>Met vriendelijke groeten,</p>
<p>%Olonaam%</p>
)
MailFromTest(Subolopx, Stringolopx, "Telenet_NP@telenetgroup.be", "car_np@proximus.com", "Telenet_NP@telenetgroup.be")
return
}

; MNP DUPLICATE FOUND

DuplicateMail()
{
CheckOutlook()
Inputbox,Scid,PEGA SC-ID,PEGA SC-ID
Inputbox,MSISDN,MSISDN,MSISDN
Inputbox,Telbase,Telenet or BASE, Telenet or BASE
dater := DateFurther()
subr = %dater% / %Telbase% / Duplicate Item %MSISDN% / %Scid%
rbod = 
(
<H2></H2>
<HTML>
<textarea>
Hi,<br><br>
The customer has requested to port <b>%MSISDN%</b> to %Telbase%.<br><br>
At the moment we’re receiving a ‘Duplicate MNP Item Found’ error.<br>
Can you please inform us which operator has requested this number at your side, so we can contact them?<br><br>
Thanks in advance.<br><br></textarea>
</HTML>
)
MailFromTest(subr, rbod, "mnp@telenetgroup.be", "", "mnp@telenetgroup.be")
}

; EXEC REJECT

ExecRejectMail()
{
CheckOutlook()
Inputbox,MSISDN,MSISDN,MSISDN
Inputbox,Scid,PEGA SC-ID,PEGA SC-ID
Inputbox,Telbase,TELENET / BASE,TELENET / BASE
dater := DateFurther()
subr = %dater% / %Telbase% / Exec Reject %MSISDN% / %Scid%
rbod = 
(
<H2></H2>
<HTML>
<textarea> 
Hi,<br><br>
We received a NP EXEC REJECT because MSISDN <b>%MSISDN%</b> went Not Active during the EXEC.<br><br>
Kindly check if it is possible to activate it again so the porting process can be continued?<br><br>
Thanks in advance.<br><br>
</textarea>
</HTML>
)
MailFromTest(subr, rbod, "mnp@telenetgroup.be", "", "mnp@telenetgroup.be")
}

MailFromTest(mailsubject, mailbody, ccmail, tomail, frommail){
olMailItem := 0
MailItem := ComObjActive("Outlook.Application").CreateItem(olMailItem)
MailItem.BodyFormat := 2 ; olFormatHTML
MailItem.SentOnBehalfOfName := frommail
MailItem.TO := tomail
MailItem.CC := ccmail
MailItem.Subject := mailsubject
MailItem.HTMLBody := mailbody
MailItem.Display
}

MailFromTestNoRun(mailsubject, mailbody, ccmail, tomail, frommail){

sender := "Telenetmobile@telenetgroup.be"
olMailItem := 0
MailItem := ComObjActive("Outlook.Application").CreateItem(olMailItem)
MailItem.BodyFormat := 2 ; olFormatHTML
MailItem.SentOnBehalfOfName := frommail
MailItem.TO := tomail
MailItem.CC := ccmail
MailItem.Subject := mailsubject
MailItem.HTMLBody := mailbody
MailItem.Display
}

MailToTest(mailsubject, mailbody, ccmail, tomail) {

sender := "Telenetmobile@telenetgroup.be"
olMailItem := 0
o:= ComObjActive("Outlook.Application").Session()
MailItem := ComObjActive("Outlook.Application").CreateItem(olMailItem)
MailItem.BodyFormat := 2 ; olFormatHTML
MailItem.TO := tomail
MailItem.CC := ccmail
;~ MailItem.Replyto :=""

MailItem.Subject := mailsubject
 
;***********html body of Outlook email******************* 
MailItem.HTMLBody := mailbody

;****************************** 
;~ MailItem.Attachments.Add(NewFile)
MailItem.Display ;Make email visible
run, %A_ScriptFullPath%
;~ mailItem.Close(0) ;Creates draft version in default folder
; MailItem.Send() ;Sends the email
}

::;testmail:: ;hotkey for running below
return

; MAIL CUSTOMER

MailCMR()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, MAIL CUSTOMER
Gui, add, Text,, 
Gui, Add, Button, gMailTelenet, TELENET
Gui, Add, Button, gMailBASE, BASE
Gui, add, Text,, 
Gui, Add, Button, gOriginTicket, BACK
Gui, Show
}

; MAIL TELENET

MailTelenet()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, TELENET RESIDENTIAL MAIL TEMPLATES
Gui, Add, Text,, 
Gui, Add, Button, gMailTLNBB, BROADBAND
Gui, Add, Button, gMailTLNMob, MOBILE
Gui, add, Text,, 
Gui, Add, Button, gMailCMR, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

MailTLNBB()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, TELENET RESIDENTIAL MAIL TEMPLATES BROADBAND
Gui, add, Text,, 
Gui, Add, Button, gMailinfoBB, MISSING INFO
Gui, add, Text,, 
Gui, Add, Button, gMailTelenet, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

; MAIL CMR INFO BB

MailinfoBB()
{
global
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, 
Gui, Add, Text,, NEEDED INFO
Gui, Add, DropDownList ,vInfoBB, MAC-ADDRESS MODEM||SERIAL NUMBER EOS|SERIAL NUMBER SIPADAN|LOGIN
Gui, Add, Text,,
Gui, Add, Button, gCopyInfoKlantMail, COPY NL
Gui, Add, Button, gCopyInfoKlantMailFR, COPY FR
Gui, Add, Button, gCopyInfoKlantMailEN, COPY EN
Gui, Add, Text,, 
Gui, Add, Button, gMailTLNBB, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
return
}

CopyInfoKlantMail()
{
global
Gui, Submit, Nohide

switch InfoBB
{
case "MAC-ADDRESS MODEM":
	Info := "de MAC-adressen van uw Telenet modem nodig."
	Location := "Deze kan u vinden op de sticker onderaan, de HFC MAC."
	Requestedaction := "Als u een foto neemt en deze toevoegt als bijlage bij het antwoord op deze mail kunnen we uw Telenet diensten activeren."
case "SERIAL NUMBER EOS":
	Info := "het serienummer van uw TV-Box nodig."
	Location := "Deze kan u vinden op de witte sticker onderaan, de CA ID."
	Requestedaction := "Als u een foto neemt en deze toevoegt als bijlage bij het antwoord op deze mail kunnen we uw Telenet diensten activeren."
case "SERIAL NUMBER SIPADAN":
	Info := "het serienummer van uw decoder nodig."
	Location := "Deze kan u vinden op de witte sticker, achter STB CA serial number."
	Requestedaction := "Als u een foto neemt en deze toevoegt als bijlage bij het antwoord op deze mail kunnen we uw Telenet diensten activeren."
case "LOGIN":
	Info := "Uw Telenet login nodig."
	Location :=""
	Requestedaction := "Als u ons deze bezorgt met het anwoord op de mail kunne we uw Telenet dienst activeren."
}

Stringinfokl =
(
Hallo,

Om je zo goed mogelijk verder te helpen, hebben we nog wat bijkomende informatie nodig. Bezorg het ons zo snel mogelijk.

Om uw diensten te activeren hebben we %Info%
%Location%

%Requestedaction%

Geef ons de gevraagde informatie:
- Als antwoord op deze e-mail.

Vriendelijke groeten,
Telenet-klantendienst
)
clipboard := Stringinfokl
return
}

CopyInfoKlantMailFR()
{
global
Gui, Submit, Nohide

switch InfoBB
{
case "MAC-ADDRESS MODEM":
	Info := "les adresses MAC de votre modem Telenet sont requises."
	Location := "Vous pouvez le trouver sur l'autocollant en bas, le HFC MAC."
	Requestedaction := "Si vous prenez une photo et l'ajoutez en piece jointe a la reponse a cet e-mail, nous pouvons activer vos services Telenet."
case "SERIAL NUMBER EOS":
	Info := "le numero de serie de votre TV-Box."
	Location := "Vous pouvez le trouver sur l'autocollant blanc en bas, l'identifiant CAID."
	Requestedaction := "Si vous prenez une photo et l'ajoutez en piece jointe a la reponse a cet e-mail, nous pouvons activer vos services Telenet."
case "SERIAL NUMBER SIPADAN":
	Info := "le numero de serie de votre decodeur."
	Location := "Vous pouvez le trouver sur l'autocollant blanc, derrière le numero de serie STB CA."
	Requestedaction := "Si vous prenez une photo et l'ajoutez en piece jointe a la reponse à cet e-mail, nous pouvons activer vos services Telenet."
case "LOGIN":
	Info := "Votre identifiant Telenet requis."
	Location :=""
	Requestedaction := "Si vous nous envoyez ceci avec la reponse a l'e-mail, nous pouvons activer votre service Telenet."
}

Stringinfokl =
(
Bonjour,

Afin de vous aider au mieux, nous avons besoin de quelques informations complementaires. Envoyez-le nous dans les plus brefs delais.

Pour activer vos services, nous avons besoin de %Info%
%Location%

%Requestedaction%

Merci de nous fournir les informations demandees :
- En reponse a cet email.

Cordialement,
Service client Telenet
)
clipboard := Stringinfokl
return
}

CopyInfoKlantMailEN()
{
global
Gui, Submit, Nohide

switch InfoBB
{
case "MAC-ADDRESS MODEM":
	Info := "the MAC addresses of your Telenet modem is required."
	Location := "You can find it on the sticker at the bottom, the HFC MAC."
	Requestedaction := "If you take a photo and add it as an attachment to the reply to this email, we can activate your Telenet services."
case "SERIAL NUMBER EOS":
	Info := "need the serial number of your TV-Box."
	Location := "You can find this on the white sticker at the bottom, the CA ID."
	Requestedaction := "If you take a photo and add it as an attachment to the reply to this email, we can activate your Telenet services."
case "SERIAL NUMBER SIPADAN":
	Info := "need the serial number of your decorder."
	Location := "You can find this on the white sticker, behind STB CA serial number."
	Requestedaction := "If you take a photo and add it as an attachment to the reply to this email, we can activate your Telenet services."
case "LOGIN":
	Info := "Your Telenet login."
	Location :=""
	Requestedaction := "If you send us this info via a reply to this email, we can activate your Telenet service."
}

Stringinfokl =
(
Hello,

To help you as best as possible, we need some additional information. Send it to us as soon as possible.

To activate your services we need %Info%
%Location%

%Requestedaction%

Please provide us with the requested information:
- In response to this email.

Regards,
Telenet customer service
)
clipboard := Stringinfokl
return
}

MailTLNMob()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, TELENET MAIL TEMPLATES MOBILE
Gui, Add, Text,, 
Gui, Add, Button, gMailTLNResMob, RESIDENTIAL
Gui, Add, Button, gMailTLNBusMob, BUSINESS
Gui, add, Text,, 
Gui, Add, Button, gMailTelenet, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

MailTLNResMob()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, TELENET RESIDENTIAL MAIL TEMPLATES MOBILE
Gui, Add, Text,, 
Gui, Add, Button, gMailRejectTLNRes, MNP REJECT
Gui, Add, Button, gMailCancelTLNRes, MNP CANCEL
Gui, add, Text,, 
Gui, Add, Button, gMailTLNMob, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

MailCancelTLNRes()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, TELENET RESIDENTIAL MNP CANCEL MAIL
Gui, Add, Text,, 
Gui, Add, Text,, MSISDN
Gui, Add, Edit, vMSISDN
Gui, Add, Text,, 
Gui, Add, Button, gMailCancelTLNResNL, COPY NL
Gui, Add, Button, gMailCancelTLNResFR, COPY FR
Gui, Add, Button, gMailCancelTLNResEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gMailTLNResMob, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

MailCancelTLNResNL()
{
global
Gui, Submit, Nohide
Stringfw =
(
Informatie over uw overstap naar Telenet

Hallo,

We hebben je onlangs een aantal keren proberen contacteren omdat we gegevens nodig hebben om je nummerovername van %MSISDN% te kunnen voltooien naar Telenet.
 
Helaas hebben we hier nog geen reactie op gekregen en zal de aanvraag geannuleerd worden.
 
Indien je nog wenst om je nummer over te dragen naar Telenet, kan je ons telefonisch contacteren via 015666666 of langsgaan bij het dichtsbijzijnde winkelpunt.

Met vriendelijke groeten,

Telenet
)
clipboard := Stringfw
return
}

MailCancelTLNResFR()
{
global
Gui, Submit, Nohide
Stringfw =
(
Informations sur votre transfert vers Telenet

Bonjour,

Nous avons essayé de vous contacter à plusieurs reprises récemment car nous avons besoin de détails pour compléter le portage de votre numéro de %MSISDN% à Telenet.
 
Malheureusement, nous n'avons pas encore reçu de réponse et la demande est donc annulée.
 
Si vous souhaitez toujours transférer votre numéro vers Telenet, veuillez nous contacter par téléphone à l'adresse 015666666 ou vous rendre au point de vente le plus proche.

Cordialement,

Telenet
)
clipboard := Stringfw
return
}

MailCancelTLNResEN()
{
global
Gui, Submit, Nohide
Stringfw =
(
Information about your switch to Telenet

Hello,

We tried to contact you several times recently as we need details to complete your number porting from %MSISDN% to Telenet.
 
Unfortunately, we have not yet received a response to this and the request will be cancelled.
 
If you still wish to transfer your number to Telenet, please contact us by phone at 015666666 or drop by your nearest retail outlet.

Kind regards,

Telenet
)
clipboard := Stringfw
return
}

MailRejectTLNRes()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, TELENET RESIDENTIAL REJECT MAIL
Gui, Add, Text,, 
Gui, Add, Button, gMailReject100TLNRes, REJECTCODE 100 (Not Active)
Gui, Add, Button, gMailReject115TLNRes, REJECTCODE 115 (Mismatch Simcardnr OLO)
Gui, Add, Button, gMailReject120TLNRes, REJECTCODE 120 (Mismatch Customernr OLO)
Gui, add, Text,, 
Gui, Add, Button, gMailTLNResMob, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

MailReject100TLNRes()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, TELENET RESIDENTIAL REJECT 100 MAIL
Gui, Add, Text,, 
Gui, Add, Button, gMailReject100TLNResNew, REJECTCODE 100 (Not Active)
Gui, Add, Button, gMailReject100TLNResRem, REMINDER REJECTCODE 100 (Not Active)
Gui, add, Text,, 
Gui, Add, Button, gMailRejectTLNRes, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

MailReject100TLNResNew()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, TELENET RESIDENTIAL REJECT 100 MAIL
Gui, Add, Text,, 
Gui, Add, Text,, MSISDN
Gui, Add, Edit, vMSISDN
Gui, Add, Text,, 
Gui, Add, Button, gMailReject100TLNResNewNL, COPY NL
Gui, Add, Button, gMailReject100TLNResNewFR, COPY FR
Gui, Add, Button, gMailReject100TLNResNewEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gMailReject100TLNRes, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

MailReject100TLNResNewNL()
{
global
Gui, Submit, Nohide
Stringfw =
(
Informatie over uw overstap naar Telenet

Hallo,

U koos ervoor de overstap te maken naar Telenet voor uw mobiel nummer %MSISDN%.

We konden uw abonnement helaas nog niet activeren, omdat we van uw vorige operator de melding kregen dat het nummer niet meer actief staat.

Er zijn 3 mogelijkheden:

- Het gsm-nummer hierboven vermeld is niet correct.

- Indien dit gsm-nummer correct is en u dit nummer wenst te behouden, dient u eerst uw huidige operator te vragen om het nummer opnieuw te activeren. Na de nieuwe activering, belt u 1x met je huidige simkaart naar het gratis nummer 080066778, om uw nummer opnieuw te activeren op het netwerk. Na het uitvoeren van deze acties, kan u contact met ons opnemen.

- Indien een reactivering bij uw huidige operator niet gaat, of dit is niet nodig voor u, kunt u ook een nieuw Telenet-nummer nemen.

Gelieve ons daarna te contacteren met de nodige informatie over je nummeroverdracht via de klantendienst op het nummer 015666666.

Met vriendelijke groeten,

Telenet
)
clipboard := Stringfw
return
}

MailReject100TLNResNewFR()
{
global
Gui, Submit, Nohide
Stringfw =
(
Informations sur votre transfert vers Telenet

Bonjour,

Vous avez choisi de transférer à Telenet pour votre numéro de GSM %MSISDN%.

Malheureusement, nous n'avons pas encore pu activer votre abonnement car nous avons reçu une notification de votre ancien opérateur indiquant que le numéro n'est plus actif.

Il y a trois possibilités :

- Le numéro de GSM mentionné ci-dessus n'est pas correct.

- Si ce numéro est correct et que vous souhaitez le conserver, vous devez d'abord demander à votre opérateur actuel de réactiver le numéro. Après la nouvelle activation, appelez une fois avec votre carte SIM actuelle le numéro gratuit 080066778, pour réactiver votre numéro sur le réseau. Après avoir effectué ces actions, vous pouvez nous contacter.

- Si la réactivation auprès de votre opérateur actuel ne fonctionne pas, ou si cela n'est pas nécessaire pour vous, vous pouvez également prendre un nouveau numéro Telenet.

Dans ce cas, veuillez nous contacter avec les informations nécessaires concernant le transfert de votre numéro via le service clientèle au 015666666.

Cordialement,

Telenet
)
clipboard := Stringfw
return
}

MailReject100TLNResNewEN()
{
global
Gui, Submit, Nohide
Stringfw =
(
Information about your switch to Telenet

Hello,

You chose to make the switch to Telenet for your mobile number %MSISDN%.

Unfortunately, we could not yet activate your subscription because we received a notification from your previous operator that the number is no longer active.

There are 3 possibilities:

- The mobile phone number listed above is not correct.

- If this mobile number is correct and you wish to keep this number, you should first ask your current operator to reactivate the number. After the new activation, call once with your current SIM card to the toll-free number 080066778, to reactivate your number on the network. After performing these actions, you can contact us.

- If reactivation with your current operator does not go, or this is not necessary for you, you can also take a new Telenet number.

After that, please contact us with the necessary information about your number transfer via customer service on 015666666.

Kind regards,

Telenet
)
clipboard := Stringfw
return
}

MailReject100TLNResRem()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, TELENET RESIDENTIAL REJECT 100 MAIL
Gui, Add, Text,, 
Gui, Add, Text,, MSISDN
Gui, Add, Edit, vMSISDN
Gui, Add, Text,, 
Gui, Add, Button, gMailReject100TLNResRemNL, COPY NL
Gui, Add, Button, gMailReject100TLNResRemFR, COPY FR
Gui, Add, Button, gMailReject100TLNResRemEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gMailReject100TLNRes, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

MailReject100TLNResRemNL()
{
global
Gui, Submit, Nohide
Stringfw =
(
Herinnering: Informatie over uw overstap naar Telenet

Hallo,

U koos ervoor de overstap te maken naar Telenet voor uw mobiel nummer %MSISDN%.

We konden uw abonnement helaas nog niet activeren, omdat we van uw vorige operator de melding kregen dat het nummer niet meer actief staat.

Er zijn 3 mogelijkheden:

- Het gsm-nummer hierboven vermeld is niet correct.

- Indien dit gsm-nummer correct is en u dit nummer wenst te behouden, dient u eerst uw huidige operator te vragen om het nummer opnieuw te activeren. Na de nieuwe activering, belt u 1x met je huidige simkaart naar het gratis nummer 080066778, om uw nummer opnieuw te activeren op het netwerk. Na het uitvoeren van deze acties, kan u contact met ons opnemen.

- Indien een reactivering bij uw huidige operator niet gaat, of dit is niet nodig voor u, kunt u ook een nieuw Telenet-nummer nemen.

Gelieve ons daarna te contacteren met de nodige informatie over je nummeroverdracht via de klantendienst op het nummer 015666666.

Let op: U heeft nog 1 week om deze informatie door te geven.
Wanneer we geen informatie ontvangen, dan wordt uw bestelling automatisch geannuleerd.

Met vriendelijke groeten,

Telenet
)
clipboard := Stringfw
return
}

MailReject100TLNResRemFR()
{
global
Gui, Submit, Nohide
Stringfw =
(
Rappel: Informations sur votre transfert vers Telenet

Bonjour,

Vous avez choisi de transférer à Telenet pour votre numéro de GSM %MSISDN%.

Malheureusement, nous n'avons pas encore pu activer votre abonnement car nous avons reçu une notification de votre ancien opérateur indiquant que le numéro n'est plus actif.

Il y a trois possibilités :

- Le numéro de GSM mentionné ci-dessus n'est pas correct.

- Si ce numéro est correct et que vous souhaitez le conserver, vous devez d'abord demander à votre opérateur actuel de réactiver le numéro. Après la nouvelle activation, appelez une fois avec votre carte SIM actuelle le numéro gratuit 080066778, pour réactiver votre numéro sur le réseau. Après avoir effectué ces actions, vous pouvez nous contacter.

- Si la réactivation auprès de votre opérateur actuel ne fonctionne pas, ou si cela n'est pas nécessaire pour vous, vous pouvez également prendre un nouveau numéro Telenet.

Dans ce cas, veuillez nous contacter avec les informations nécessaires concernant le transfert de votre numéro via le service clientèle au 015666666.

Attention : vous avez encore 1 semaine pour fournir ces informations.
Si nous ne recevons aucune information, votre commande sera automatiquement annulée.

Cordialement,

Telenet
)
clipboard := Stringfw
return
}

MailReject100TLNResRemEN()
{
global
Gui, Submit, Nohide
Stringfw =
(
Reminder: Information about your switch to Telenet

Hello,

You chose to make the switch to Telenet for your mobile number %MSISDN%.

Unfortunately, we could not yet activate your subscription because we received a notification from your previous operator that the number is no longer active.

There are 3 possibilities:

- The mobile phone number listed above is not correct.

- If this mobile number is correct and you wish to keep this number, you should first ask your current operator to reactivate the number. After the new activation, call once with your current SIM card to the toll-free number 080066778, to reactivate your number on the network. After performing these actions, you can contact us.

- If reactivation with your current operator does not go, or this is not necessary for you, you can also take a new Telenet number.

After that, please contact us with the necessary information about your number transfer via customer service on 015666666.

Note: You still have 1 week to provide this information.
If we do not receive any information, your order will automatically be cancelled.

Kind regards,

Telenet
)
clipboard := Stringfw
return
}

MailReject115TLNRes()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, TELENET RESIDENTIAL REJECT 115 MAIL
Gui, Add, Text,, 
Gui, Add, Button, gMailReject115TLNResNew, REJECTCODE 115 (Mismatch Simcardnr OLO)
Gui, Add, Button, gMailReject115TLNResRem, REMINDER REJECTCODE 115 (Mismatch Simcardnr OLO)
Gui, add, Text,, 
Gui, Add, Button, gMailRejectTLNRes, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

MailReject115TLNResNew()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, TELENET RESIDENTIAL REJECT 115 MAIL
Gui, Add, Text,, 
Gui, Add, Text,, MSISDN
Gui, Add, Edit, vMSISDN
Gui, Add, Text,, 
Gui, Add, Button, gMailReject115TLNResNewNL, COPY NL
Gui, Add, Button, gMailReject115TLNResNewFR, COPY FR
Gui, Add, Button, gMailReject115TLNResNewEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gMailReject115TLNRes, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

MailReject115TLNResNewNL()
{
global
Gui, Submit, Nohide
Stringfw =
(
Informatie over uw overstap naar Telenet

Hallo,

U koos ervoor de overstap te maken naar Telenet voor uw mobiel nummer %MSISDN%.

We konden uw abonnement helaas nog niet activeren, omdat we van uw vorige operator de melding kregen dat de doorgestuurde gegevens niet overeenkomen met de gegevens in hun systeem.

Om een nieuwe aanvraag te starten, hebben we het correcte simkaartnummer nodig van uw huidige operator. Dit kan u vinden op de simkaart zelf of door contact op te nemen met uw operator.

U kan daarna de correcte gegevens doorgeven via https://www.telenet.be/nummeroverdracht of telefonisch 015666666.

Met vriendelijke groeten,

Telenet
)
clipboard := Stringfw
return
}

MailReject115TLNResNewFR()
{
global
Gui, Submit, Nohide
Stringfw =
(
Informations sur votre transfert vers Telenet

Bonjour,

Vous avez choisi de transférer à Telenet pour votre numéro de GSM %MSISDN%.

Malheureusement, nous n'avons pas encore pu activer votre abonnement car nous avons reçu un message de votre ancien opérateur indiquant que les données envoyées ne correspondent pas aux données de son système.

Pour démarrer une nouvelle application, nous avons besoin du numéro de carte SIM correct de votre opérateur actuel. Celui-ci peut être trouvé sur la carte SIM elle-même ou en contactant votre opérateur.

Vous pouvez ensuite fournir les informations correctes via https://www.telenet.be/nummeroverdracht ou par téléphone au 015666666.

Cordialement,

Telenet
)
clipboard := Stringfw
return
}

MailReject115TLNResNewEN()
{
global
Gui, Submit, Nohide
Stringfw =
(
Information about your switch to Telenet

Hello,

You chose to make the switch to Telenet for your mobile number %MSISDN%.

Unfortunately, we were unable to activate your subscription yet because we received a message from your previous operator that the data sent does not match the data in their system.

To start a new application, we need the correct SIM card number from your current operator. This can be found on the SIM card itself or by contacting your operator.

You can then provide the correct details via https://www.telenet.be/nummeroverdracht or by telephone on 015666666.

Kind regards,

Telenet
)
clipboard := Stringfw
return
}

MailReject115TLNResRem()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, TELENET RESIDENTIAL REJECT 115 MAIL
Gui, Add, Text,, 
Gui, Add, Text,, MSISDN
Gui, Add, Edit, vMSISDN
Gui, Add, Text,, 
Gui, Add, Button, gMailReject115TLNResRemNL, COPY NL
Gui, Add, Button, gMailReject115TLNResRemFR, COPY FR
Gui, Add, Button, gMailReject115TLNResRemEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gMailReject115TLNRes, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

MailReject115TLNResRemNL()
{
global
Gui, Submit, Nohide
Stringfw =
(
Herinnering: Informatie over uw overstap naar Telenet

Hallo,

U koos ervoor de overstap te maken naar Telenet voor uw mobiel nummer %MSISDN%.

We konden uw abonnement helaas nog niet activeren, omdat we van uw vorige operator de melding kregen dat de doorgestuurde gegevens niet overeenkomen met de gegevens in hun systeem.

Om een nieuwe aanvraag te starten, hebben we het correcte simkaartnummer nodig van uw huidige operator. Dit kan u vinden op de simkaart zelf of door contact op te nemen met uw operator.

U kan daarna de correcte gegevens doorgeven via https://www.telenet.be/nummeroverdracht of telefonisch 015666666.

Let op: U heeft nog 1 week om deze informatie door te geven.
Wanneer we geen informatie ontvangen, dan wordt uw bestelling automatisch geannuleerd.

Met vriendelijke groeten,

Telenet
)
clipboard := Stringfw
return
}

MailReject115TLNResRemFR()
{
global
Gui, Submit, Nohide
Stringfw =
(
Rappel: Informations sur votre transfert vers Telenet

Bonjour,

Vous avez choisi de transférer à Telenet pour votre numéro de GSM %MSISDN%.

Malheureusement, nous n'avons pas encore pu activer votre abonnement car nous avons reçu un message de votre ancien opérateur indiquant que les données envoyées ne correspondent pas aux données de son système.

Pour démarrer une nouvelle application, nous avons besoin du numéro de carte SIM correct de votre opérateur actuel. Celui-ci peut être trouvé sur la carte SIM elle-même ou en contactant votre opérateur.

Vous pouvez ensuite fournir les informations correctes via https://www.telenet.be/nummeroverdracht ou par téléphone au 015666666.

Attention : vous avez encore 1 semaine pour fournir ces informations.
Si nous ne recevons aucune information, votre commande sera automatiquement annulée.

Cordialement,

Telenet
)
clipboard := Stringfw
return
}

MailReject115TLNResRemEN()
{
global
Gui, Submit, Nohide
Stringfw =
(
Reminder: Information about your switch to Telenet

Hello,

You chose to make the switch to Telenet for your mobile number %MSISDN%.

Unfortunately, we were unable to activate your subscription yet because we received a message from your previous operator that the data sent does not match the data in their system.

To start a new application, we need the correct SIM card number from your current operator. This can be found on the SIM card itself or by contacting your operator.

You can then provide the correct details via https://www.telenet.be/nummeroverdracht or by telephone on 015666666.

Note: You still have 1 week to provide this information.
If we do not receive any information, your order will automatically be cancelled.

Kind regards,

Telenet
)
clipboard := Stringfw
return
}

MailReject120TLNRes()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, TELENET RESIDENTIAL REJECT 120 MAIL
Gui, Add, Text,, 
Gui, Add, Button, gMailReject120TLNResNew, REJECTCODE 120 (Mismatch Customernr OLO)
Gui, Add, Button, gMailReject120TLNResRem, REMINDER REJECTCODE 120 (Mismatch Customernr OLO)
Gui, add, Text,, 
Gui, Add, Button, gMailRejectTLNRes, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

MailReject120TLNResNew()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, TELENET RESIDENTIAL REJECT 120 MAIL
Gui, Add, Text,, 
Gui, Add, Text,, MSISDN
Gui, Add, Edit, vMSISDN
Gui, Add, Text,, 
Gui, Add, Button, gMailReject120TLNResNewNL, COPY NL
Gui, Add, Button, gMailReject120TLNResNewFR, COPY FR
Gui, Add, Button, gMailReject120TLNResNewEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gMailReject120TLNRes, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

MailReject120TLNResNewNL()
{
global
Gui, Submit, Nohide
Stringfw =
(
Informatie over uw overstap naar Telenet

Hallo,

U koos ervoor de overstap te maken naar Telenet voor uw mobiel nummer %MSISDN%.

We konden uw abonnement helaas nog niet activeren, omdat we van uw vorige operator de melding kregen dat de doorgestuurde gegevens niet overeenkomen met de gegevens in hun systeem.

Om een nieuwe aanvraag te starten, hebben we het correcte klantnummer nodig van uw huidige operator. Dit kan u vinden op de recentste aanrekening of door contact op te nemen met uw operator.

U kan daarna de correcte gegevens doorgeven via https://www.telenet.be/nummeroverdracht of telefonisch 015666666.

Met vriendelijke groeten,

Telenet
)
clipboard := Stringfw
return
}

MailReject120TLNResNewFR()
{
global
Gui, Submit, Nohide
Stringfw =
(
Informations sur votre transfert vers Telenet

Bonjour,

Vous avez choisi de transférer à Telenet pour votre numéro de GSM %MSISDN%.

Malheureusement, nous n'avons pas encore pu activer votre abonnement car nous avons reçu un message de votre ancien opérateur indiquant que les données envoyées ne correspondent pas aux données de son système.

Pour démarrer une nouvelle application, nous avons besoin du numéro client correct de votre opérateur actuel. Celui-ci se trouve sur la facture la plus récente ou en contactant votre opérateur.

Vous pouvez ensuite fournir les informations correctes via https://www.telenet.be/nummeroverdracht ou par téléphone au 015666666.

Cordialement,

Telenet
)
clipboard := Stringfw
return
}

MailReject120TLNResNewEN()
{
global
Gui, Submit, Nohide
Stringfw =
(
Information about your switch to Telenet

Hello,

You chose to make the switch to Telenet for your mobile number %MSISDN%.

Unfortunately, we were unable to activate your subscription yet because we received a message from your previous operator that the data sent does not match the data in their system.

To start a new application, we need the correct customer number from your current operator. This can be found on the most recent invoice or by contacting your operator.

You can then provide the correct details via https://www.telenet.be/nummeroverdracht or by telephone on 015666666.

Kind regards,

Telenet
)
clipboard := Stringfw
return
}

MailReject120TLNResRem()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, TELENET RESIDENTIAL REJECT 120 MAIL
Gui, Add, Text,, 
Gui, Add, Text,, MSISDN
Gui, Add, Edit, vMSISDN
Gui, Add, Text,, 
Gui, Add, Button, gMailReject120TLNResRemNL, COPY NL
Gui, Add, Button, gMailReject120TLNResRemFR, COPY FR
Gui, Add, Button, gMailReject120TLNResRemEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gMailReject115TLNRes, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

MailReject120TLNResRemNL()
{
global
Gui, Submit, Nohide
Stringfw =
(
Herinnering: Informatie over uw overstap naar Telenet

Hallo,

U koos ervoor de overstap te maken naar Telenet voor uw mobiel nummer %MSISDN%.

We konden uw abonnement helaas nog niet activeren, omdat we van uw vorige operator de melding kregen dat de doorgestuurde gegevens niet overeenkomen met de gegevens in hun systeem.

Om een nieuwe aanvraag te starten, hebben we het correcte klantnummer nodig van uw huidige operator. Dit kan u vinden op de recentste aanrekening of door contact op te nemen met uw operator.

U kan daarna de correcte gegevens doorgeven via https://www.telenet.be/nummeroverdracht of telefonisch 015666666.

Let op: U heeft nog 1 week om deze informatie door te geven.
Wanneer we geen informatie ontvangen, dan wordt uw bestelling automatisch geannuleerd.

Met vriendelijke groeten,

Telenet
)
clipboard := Stringfw
return
}

MailReject120TLNResRemFR()
{
global
Gui, Submit, Nohide
Stringfw =
(
Rappel: Informations sur votre transfert vers Telenet

Bonjour,

Vous avez choisi de transférer à Telenet pour votre numéro de GSM %MSISDN%.

Malheureusement, nous n'avons pas encore pu activer votre abonnement car nous avons reçu un message de votre ancien opérateur indiquant que les données envoyées ne correspondent pas aux données de son système.

Pour démarrer une nouvelle application, nous avons besoin du numéro client correct de votre opérateur actuel. Celui-ci se trouve sur la facture la plus récente ou en contactant votre opérateur.

Vous pouvez ensuite fournir les informations correctes via https://www.telenet.be/nummeroverdracht ou par téléphone au 015666666.

Attention : vous avez encore 1 semaine pour fournir ces informations.
Si nous ne recevons aucune information, votre commande sera automatiquement annulée.

Cordialement,

Telenet
)
clipboard := Stringfw
return
}

MailReject120TLNResRemEN()
{
global
Gui, Submit, Nohide
Stringfw =
(
Reminder: Information about your switch to Telenet

Hello,

You chose to make the switch to Telenet for your mobile number %MSISDN%.

Unfortunately, we were unable to activate your subscription yet because we received a message from your previous operator that the data sent does not match the data in their system.

To start a new application, we need the correct customer number from your current operator. This can be found on the most recent invoice or by contacting your operator.

You can then provide the correct details via https://www.telenet.be/nummeroverdracht or by telephone on 015666666.

Note: You still have 1 week to provide this information.
If we do not receive any information, your order will automatically be cancelled.

Kind regards,

Telenet
)
clipboard := Stringfw
return
}

; MAIL TELENET BUSINESS

MailTLNBusMob()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, TELENET BUSINESS MAIL TEMPLATES
Gui, Add, Text,, 
Gui, Add, Button, gMailRejectTLNBus, MNP REJECT
Gui, Add, Button, gMailCancelTLNBus, MNP CANCEL
Gui, add, Text,, 
Gui, Add, Button, gMailTelenet, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

MailRejectTLNBus()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, TELENET BUSINESS REJECT MAIL
Gui, Add, Text,, 
Gui, Add, Button, gMailReject100TLNBus, REJECTCODE 100 (Not Active)
Gui, Add, Button, gMailReject115TLNBus, REJECTCODE 115 (Mismatch Simcardnr OLO)
Gui, Add, Button, gMailReject120TLNBus, REJECTCODE 120 (Mismatch Customernr OLO)
Gui, add, Text,, 
Gui, Add, Button, gMailTLNBusMob, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

MailReject100TLNBus()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, TELENET BUSINESS REJECT 100 MAIL
Gui, Add, Text,, 
Gui, Add, Button, gMailReject100TLNBusNew, REJECTCODE 100 (Not Active)
Gui, Add, Button, gMailReject100TLNBusRem, REMINDER REJECTCODE 100 (Not Active)
Gui, add, Text,, 
Gui, Add, Button, gMailTLNBusMob, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

MailReject100TLNBusNew()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, TELENET BUSINESS REJECT 100 MAIL
Gui, Add, Text,, 
Gui, Add, Text,, MSISDN
Gui, Add, Edit, vMSISDN
Gui, Add, Text,, 
Gui, Add, Button, gMailReject100TLNBusNewNL, COPY NL
Gui, Add, Button, gMailReject100TLNBusNewFR, COPY FR
Gui, Add, Button, gMailReject100TLNBusNewEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gMailReject100TLNBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

MailReject100TLNBusNewNL()
{
global
Gui, Submit, Nohide
Stringfw =
(
Informatie over uw overstap naar Telenet-Business

Hallo,

U koos ervoor de overstap te maken naar Telenet voor uw mobiel nummer %MSISDN%.

We konden uw abonnement helaas nog niet activeren, omdat we van uw vorige operator de melding kregen dat het nummer niet meer actief staat.

Er zijn 3 mogelijkheden:

- Het gsm-nummer hierboven vermeld is niet correct.

- Indien dit gsm-nummer correct is en u dit nummer wenst te behouden, dient u eerst uw huidige operator te vragen om het nummer opnieuw te activeren. Na de nieuwe activering, belt u 1x met je huidige simkaart naar het gratis nummer 080066778, om uw nummer opnieuw te activeren op het netwerk. Na het uitvoeren van deze acties, kan u contact met ons opnemen.

- Indien een reactivering bij uw huidige operator niet gaat, of dit is niet nodig voor u, kunt u ook een nieuw Telenet-nummer nemen.

Gelieve ons daarna te contacteren met de nodige informatie over je nummeroverdracht via de klantendienst op het nummer 080066066.

Met vriendelijke groeten,

Telenet
)
clipboard := Stringfw
return
}

MailReject100TLNBusNewFR()
{
global
Gui, Submit, Nohide
Stringfw =
(
Informations sur votre transfert vers Telenet-Business

Bonjour,

Vous avez choisi de transférer à Telenet pour votre numéro de GSM %MSISDN%.

Malheureusement, nous n'avons pas encore pu activer votre abonnement car nous avons reçu une notification de votre ancien opérateur indiquant que le numéro n'est plus actif.

Il y a trois possibilités :

- Le numéro de GSM mentionné ci-dessus n'est pas correct.

- Si ce numéro est correct et que vous souhaitez le conserver, vous devez d'abord demander à votre opérateur actuel de réactiver le numéro. Après la nouvelle activation, appelez une fois avec votre carte SIM actuelle le numéro gratuit 080066778, pour réactiver votre numéro sur le réseau. Après avoir effectué ces actions, vous pouvez nous contacter.

- Si la réactivation auprès de votre opérateur actuel ne fonctionne pas, ou si cela n'est pas nécessaire pour vous, vous pouvez également prendre un nouveau numéro Telenet.

Dans ce cas, veuillez nous contacter avec les informations nécessaires concernant le transfert de votre numéro via le service clientèle au 080066066.

Cordialement,

Telenet
)
clipboard := Stringfw
return
}

MailReject100TLNBusNewEN()
{
global
Gui, Submit, Nohide
Stringfw =
(
Information about your switch to Telenet-Business

Hello,

You chose to make the switch to Telenet for your mobile number %MSISDN%.

Unfortunately, we could not yet activate your subscription because we received a notification from your previous operator that the number is no longer active.

There are 3 possibilities:

- The mobile phone number listed above is not correct.

- If this mobile number is correct and you wish to keep this number, you should first ask your current operator to reactivate the number. After the new activation, call once with your current SIM card to the toll-free number 080066778, to reactivate your number on the network. After performing these actions, you can contact us.

- If reactivation with your current operator does not go, or this is not necessary for you, you can also take a new Telenet number.

After that, please contact us with the necessary information about your number transfer via customer service on 080066066.

Kind regards,

Telenet
)
clipboard := Stringfw
return
}

MailReject100TLNBusRem()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, TELENET BUSINESS REJECT 100 MAIL
Gui, Add, Text,, 
Gui, Add, Text,, MSISDN
Gui, Add, Edit, vMSISDN
Gui, Add, Text,, 
Gui, Add, Button, gMailReject100TLNBusRemNL, COPY NL
Gui, Add, Button, gMailReject100TLNBusRemFR, COPY FR
Gui, Add, Button, gMailReject100TLNBusRemEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gMailReject100TLNBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

MailReject100TLNBusRemNL()
{
global
Gui, Submit, Nohide
Stringfw =
(
Herinnering: Informatie over uw overstap naar Telenet-Business

Hallo,

U koos ervoor de overstap te maken naar Telenet voor uw mobiel nummer %MSISDN%.

We konden uw abonnement helaas nog niet activeren, omdat we van uw vorige operator de melding kregen dat het nummer niet meer actief staat.

Er zijn 3 mogelijkheden:

- Het gsm-nummer hierboven vermeld is niet correct.

- Indien dit gsm-nummer correct is en u dit nummer wenst te behouden, dient u eerst uw huidige operator te vragen om het nummer opnieuw te activeren. Na de nieuwe activering, belt u 1x met je huidige simkaart naar het gratis nummer 080066778, om uw nummer opnieuw te activeren op het netwerk. Na het uitvoeren van deze acties, kan u contact met ons opnemen.

- Indien een reactivering bij uw huidige operator niet gaat, of dit is niet nodig voor u, kunt u ook een nieuw Telenet-nummer nemen.

Gelieve ons daarna te contacteren met de nodige informatie over je nummeroverdracht via de klantendienst op het nummer 080066066.

Let op: U heeft nog 1 week om deze informatie door te geven.
Wanneer we geen informatie ontvangen, dan wordt uw bestelling automatisch geannuleerd.

Met vriendelijke groeten,

Telenet
)
clipboard := Stringfw
return
}

MailReject100TLNBusRemFR()
{
global
Gui, Submit, Nohide
Stringfw =
(
Rappel: Informations sur votre transfert vers Telenet-Business

Bonjour,

Vous avez choisi de transférer à Telenet pour votre numéro de GSM %MSISDN%.

Malheureusement, nous n'avons pas encore pu activer votre abonnement car nous avons reçu une notification de votre ancien opérateur indiquant que le numéro n'est plus actif.

Il y a trois possibilités :

- Le numéro de GSM mentionné ci-dessus n'est pas correct.

- Si ce numéro est correct et que vous souhaitez le conserver, vous devez d'abord demander à votre opérateur actuel de réactiver le numéro. Après la nouvelle activation, appelez une fois avec votre carte SIM actuelle le numéro gratuit 080066778, pour réactiver votre numéro sur le réseau. Après avoir effectué ces actions, vous pouvez nous contacter.

- Si la réactivation auprès de votre opérateur actuel ne fonctionne pas, ou si cela n'est pas nécessaire pour vous, vous pouvez également prendre un nouveau numéro Telenet.

Dans ce cas, veuillez nous contacter avec les informations nécessaires concernant le transfert de votre numéro via le service clientèle au 080066066.

Attention : vous avez encore 1 semaine pour fournir ces informations.
Si nous ne recevons aucune information, votre commande sera automatiquement annulée.

Cordialement,

Telenet
)
clipboard := Stringfw
return
}

MailReject100TLNBusRemEN()
{
global
Gui, Submit, Nohide
Stringfw =
(
Reminder: Information about your switch to Telenet-Business

Hello,

You chose to make the switch to Telenet for your mobile number %MSISDN%.

Unfortunately, we could not yet activate your subscription because we received a notification from your previous operator that the number is no longer active.

There are 3 possibilities:

- The mobile phone number listed above is not correct.

- If this mobile number is correct and you wish to keep this number, you should first ask your current operator to reactivate the number. After the new activation, call once with your current SIM card to the toll-free number 080066778, to reactivate your number on the network. After performing these actions, you can contact us.

- If reactivation with your current operator does not go, or this is not necessary for you, you can also take a new Telenet number.

After that, please contact us with the necessary information about your number transfer via customer service on 080066066.

Note: You still have 1 week to provide this information.
If we do not receive any information, your order will automatically be cancelled.

Kind regards,

Telenet
)
clipboard := Stringfw
return
}

MailReject115TLNBus()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, TELENET BUSINESS REJECT 115 MAIL
Gui, Add, Text,, 
Gui, Add, Button, gMailReject115TLNBusNew, REJECTCODE 115 (Mismatch Simcardnr OLO)
Gui, Add, Button, gMailReject115TLNBusRem, REMINDER REJECTCODE 115 (Mismatch Simcardnr OLO)
Gui, add, Text,, 
Gui, Add, Button, gMailRejectTLNBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

MailReject115TLNBusNew()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, TELENET BUSINESS REJECT 115 MAIL
Gui, Add, Text,, 
Gui, Add, Text,, MSISDN
Gui, Add, Edit, vMSISDN
Gui, Add, Text,, 
Gui, Add, Button, gMailReject115TLNBusNewNL, COPY NL
Gui, Add, Button, gMailReject115TLNBusNewFR, COPY FR
Gui, Add, Button, gMailReject115TLNBusNewEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gMailReject115TLNBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

MailReject115TLNBusNewNL()
{
global
Gui, Submit, Nohide
Stringfw =
(
Informatie over uw overstap naar Telenet-Business

Hallo,

U koos ervoor de overstap te maken naar Telenet voor uw mobiel nummer %MSISDN%.

We konden uw abonnement helaas nog niet activeren, omdat we van uw vorige operator de melding kregen dat de doorgestuurde gegevens niet overeenkomen met de gegevens in hun systeem.

Om een nieuwe aanvraag te starten, hebben we het correcte simkaartnummer nodig van uw huidige operator. Dit kan u vinden op de simkaart zelf of door contact op te nemen met uw operator.

U kan daarna de correcte gegevens doorgeven via https://www.telenet.be/nummeroverdracht of telefonisch 080066066.

Met vriendelijke groeten,

Telenet
)
clipboard := Stringfw
return
}

MailReject115TLNBusNewFR()
{
global
Gui, Submit, Nohide
Stringfw =
(
Informations sur votre transfert vers Telenet-Business

Bonjour,

Vous avez choisi de transférer à Telenet pour votre numéro de GSM %MSISDN%.

Malheureusement, nous n'avons pas encore pu activer votre abonnement car nous avons reçu un message de votre ancien opérateur indiquant que les données envoyées ne correspondent pas aux données de son système.

Pour démarrer une nouvelle application, nous avons besoin du numéro de carte SIM correct de votre opérateur actuel. Celui-ci peut être trouvé sur la carte SIM elle-même ou en contactant votre opérateur.

Vous pouvez ensuite fournir les informations correctes via https://www.telenet.be/nummeroverdracht ou par téléphone au 080066066.

Cordialement,

Telenet
)
clipboard := Stringfw
return
}

MailReject115TLNBusNewEN()
{
global
Gui, Submit, Nohide
Stringfw =
(
Information about your switch to Telenet-Business

Hello,

You chose to make the switch to Telenet for your mobile number %MSISDN%.

Unfortunately, we were unable to activate your subscription yet because we received a message from your previous operator that the data sent does not match the data in their system.

To start a new application, we need the correct SIM card number from your current operator. This can be found on the SIM card itself or by contacting your operator.

You can then provide the correct details via https://www.telenet.be/nummeroverdracht or by telephone on 080066066.

Kind regards,

Telenet
)
clipboard := Stringfw
return
}

MailReject115TLNBusRem()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, TELENET BUSINESS REJECT 115 MAIL
Gui, Add, Text,, 
Gui, Add, Text,, MSISDN
Gui, Add, Edit, vMSISDN
Gui, Add, Text,, 
Gui, Add, Button, gMailReject115TLNBusRemNL, COPY NL
Gui, Add, Button, gMailReject115TLNBusRemFR, COPY FR
Gui, Add, Button, gMailReject115TLNBusRemEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gMailReject115TLNBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

MailReject115TLNBusRemNL()
{
global
Gui, Submit, Nohide
Stringfw =
(
Herinnering: Informatie over uw overstap naar Telenet-Business

Hallo,

U koos ervoor de overstap te maken naar Telenet voor uw mobiel nummer %MSISDN%.

We konden uw abonnement helaas nog niet activeren, omdat we van uw vorige operator de melding kregen dat de doorgestuurde gegevens niet overeenkomen met de gegevens in hun systeem.

Om een nieuwe aanvraag te starten, hebben we het correcte simkaartnummer nodig van uw huidige operator. Dit kan u vinden op de simkaart zelf of door contact op te nemen met uw operator.

U kan daarna de correcte gegevens doorgeven via https://www.telenet.be/nummeroverdracht of telefonisch 080066066.

Let op: U heeft nog 1 week om deze informatie door te geven.
Wanneer we geen informatie ontvangen, dan wordt uw bestelling automatisch geannuleerd.

Met vriendelijke groeten,

Telenet
)
clipboard := Stringfw
return
}

MailReject115TLNBusRemFR()
{
global
Gui, Submit, Nohide
Stringfw =
(
Rappel: Informations sur votre transfert vers Telenet-Business

Bonjour,

Vous avez choisi de transférer à Telenet pour votre numéro de GSM %MSISDN%.

Malheureusement, nous n'avons pas encore pu activer votre abonnement car nous avons reçu un message de votre ancien opérateur indiquant que les données envoyées ne correspondent pas aux données de son système.

Pour démarrer une nouvelle application, nous avons besoin du numéro de carte SIM correct de votre opérateur actuel. Celui-ci peut être trouvé sur la carte SIM elle-même ou en contactant votre opérateur.

Vous pouvez ensuite fournir les informations correctes via https://www.telenet.be/nummeroverdracht ou par téléphone au 080066066.

Attention : vous avez encore 1 semaine pour fournir ces informations.
Si nous ne recevons aucune information, votre commande sera automatiquement annulée.

Cordialement,

Telenet
)
clipboard := Stringfw
return
}

MailReject115TLNBusRemEN()
{
global
Gui, Submit, Nohide
Stringfw =
(
Reminder: Information about your switch to Telenet-Business

Hello,

You chose to make the switch to Telenet for your mobile number %MSISDN%.

Unfortunately, we were unable to activate your subscription yet because we received a message from your previous operator that the data sent does not match the data in their system.

To start a new application, we need the correct SIM card number from your current operator. This can be found on the SIM card itself or by contacting your operator.

You can then provide the correct details via https://www.telenet.be/nummeroverdracht or by telephone on 080066066.

Note: You still have 1 week to provide this information.
If we do not receive any information, your order will automatically be cancelled.

Kind regards,

Telenet
)
clipboard := Stringfw
return
}

MailReject120TLNBus()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, TELENET BUSINESS REJECT 120 MAIL
Gui, Add, Text,, 
Gui, Add, Button, gMailReject120TLNBusNew, REJECTCODE 120 (Mismatch Customernr OLO)
Gui, Add, Button, gMailReject120TLNBusRem, REMINDER REJECTCODE 120 (Mismatch Customernr OLO)
Gui, add, Text,, 
Gui, Add, Button, gMailRejectTLNBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

MailReject120TLNBusNew()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, TELENET BUSINESS REJECT 120 MAIL
Gui, Add, Text,, 
Gui, Add, Text,, MSISDN
Gui, Add, Edit, vMSISDN
Gui, Add, Text,, 
Gui, Add, Button, gMailReject120TLNBusNewNL, COPY NL
Gui, Add, Button, gMailReject120TLNBusNewFR, COPY FR
Gui, Add, Button, gMailReject120TLNBusNewEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gMailReject120TLNBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

MailReject120TLNBusNewNL()
{
global
Gui, Submit, Nohide
Stringfw =
(
Informatie over uw overstap naar Telenet-Business

Hallo,

U koos ervoor de overstap te maken naar Telenet voor uw mobiel nummer %MSISDN%.

We konden uw abonnement helaas nog niet activeren, omdat we van uw vorige operator de melding kregen dat de doorgestuurde gegevens niet overeenkomen met de gegevens in hun systeem.

Om een nieuwe aanvraag te starten, hebben we het correcte klantnummer nodig van uw huidige operator. Dit kan u vinden op de recentste aanrekening of door contact op te nemen met uw operator.

U kan daarna de correcte gegevens doorgeven via https://www.telenet.be/nummeroverdracht of telefonisch 080066066.

Met vriendelijke groeten,

Telenet
)
clipboard := Stringfw
return
}

MailReject120TLNBusNewFR()
{
global
Gui, Submit, Nohide
Stringfw =
(
Informations sur votre transfert vers Telenet-Business

Bonjour,

Vous avez choisi de transférer à Telenet pour votre numéro de GSM %MSISDN%.

Malheureusement, nous n'avons pas encore pu activer votre abonnement car nous avons reçu un message de votre ancien opérateur indiquant que les données envoyées ne correspondent pas aux données de son système.

Pour démarrer une nouvelle application, nous avons besoin du numéro client correct de votre opérateur actuel. Celui-ci se trouve sur la facture la plus récente ou en contactant votre opérateur.

Vous pouvez ensuite fournir les informations correctes via https://www.telenet.be/nummeroverdracht ou par téléphone au 080066066.

Cordialement,

Telenet
)
clipboard := Stringfw
return
}

MailReject120TLNBusNewEN()
{
global
Gui, Submit, Nohide
Stringfw =
(
Information about your switch to Telenet-Business

Hello,

You chose to make the switch to Telenet for your mobile number %MSISDN%.

Unfortunately, we were unable to activate your subscription yet because we received a message from your previous operator that the data sent does not match the data in their system.

To start a new application, we need the correct customer number from your current operator. This can be found on the most recent invoice or by contacting your operator.

You can then provide the correct details via https://www.telenet.be/nummeroverdracht or by telephone on 080066066.

Kind regards,

Telenet
)
clipboard := Stringfw
return
}

MailReject120TLNBusRem()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, TELENET BUSINESS REJECT 120 MAIL
Gui, Add, Text,, 
Gui, Add, Text,, MSISDN
Gui, Add, Edit, vMSISDN
Gui, Add, Text,, 
Gui, Add, Button, gMailReject120TLNBusRemNL, COPY NL
Gui, Add, Button, gMailReject120TLNBusRemFR, COPY FR
Gui, Add, Button, gMailReject120TLNBusRemEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gMailReject115TLNBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

MailReject120TLNBusRemNL()
{
global
Gui, Submit, Nohide
Stringfw =
(
Herinnering: Informatie over uw overstap naar Telenet-Business

Hallo,

U koos ervoor de overstap te maken naar Telenet voor uw mobiel nummer %MSISDN%.

We konden uw abonnement helaas nog niet activeren, omdat we van uw vorige operator de melding kregen dat de doorgestuurde gegevens niet overeenkomen met de gegevens in hun systeem.

Om een nieuwe aanvraag te starten, hebben we het correcte klantnummer nodig van uw huidige operator. Dit kan u vinden op de recentste aanrekening of door contact op te nemen met uw operator.

U kan daarna de correcte gegevens doorgeven via https://www.telenet.be/nummeroverdracht of telefonisch 080066066.

Let op: U heeft nog 1 week om deze informatie door te geven.
Wanneer we geen informatie ontvangen, dan wordt uw bestelling automatisch geannuleerd.

Met vriendelijke groeten,

Telenet
)
clipboard := Stringfw
return
}

MailReject120TLNBusRemFR()
{
global
Gui, Submit, Nohide
Stringfw =
(
Rappel: Informations sur votre transfert vers Telenet-Business

Bonjour,

Vous avez choisi de transférer à Telenet pour votre numéro de GSM %MSISDN%.

Malheureusement, nous n'avons pas encore pu activer votre abonnement car nous avons reçu un message de votre ancien opérateur indiquant que les données envoyées ne correspondent pas aux données de son système.

Pour démarrer une nouvelle application, nous avons besoin du numéro client correct de votre opérateur actuel. Celui-ci se trouve sur la facture la plus récente ou en contactant votre opérateur.

Vous pouvez ensuite fournir les informations correctes via https://www.telenet.be/nummeroverdracht ou par téléphone au 080066066.

Attention : vous avez encore 1 semaine pour fournir ces informations.
Si nous ne recevons aucune information, votre commande sera automatiquement annulée.

Cordialement,

Telenet
)
clipboard := Stringfw
return
}

MailReject120TLNBusRemEN()
{
global
Gui, Submit, Nohide
Stringfw =
(
Reminder: Information about your switch to Telenet-Business

Hello,

You chose to make the switch to Telenet for your mobile number %MSISDN%.

Unfortunately, we were unable to activate your subscription yet because we received a message from your previous operator that the data sent does not match the data in their system.

To start a new application, we need the correct customer number from your current operator. This can be found on the most recent invoice or by contacting your operator.

You can then provide the correct details via https://www.telenet.be/nummeroverdracht or by telephone on 080066066.

Note: You still have 1 week to provide this information.
If we do not receive any information, your order will automatically be cancelled.

Kind regards,

Telenet
)
clipboard := Stringfw
return
}

MailCancelTLNBus()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, TELENET BUSINESS MNP CANCEL MAIL
Gui, Add, Text,, 
Gui, Add, Text,, MSISDN
Gui, Add, Edit, vMSISDN
Gui, Add, Text,, 
Gui, Add, Button, gMailCancelTLNBusNL, COPY NL
Gui, Add, Button, gMailCancelTLNBusFR, COPY FR
Gui, Add, Button, gMailCancelTLNBusEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gMailTLNBusMob, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

MailCancelTLNBusNL()
{
global
Gui, Submit, Nohide
Stringfw =
(
Informatie over uw overstap naar Telenet

Hallo,

We hebben je onlangs een aantal keren proberen contacteren omdat we gegevens nodig hebben om je nummerovername van %MSISDN% te kunnen voltooien naar Telenet.
 
Helaas hebben we hier nog geen reactie op gekregen en zal de aanvraag geannuleerd worden.
 
Indien je nog wenst om je nummer over te dragen naar Telenet, kan je ons telefonisch contacteren via 080066066 of langsgaan bij het dichtsbijzijnde winkelpunt.

Met vriendelijke groeten,

Telenet
)
clipboard := Stringfw
return
}

MailCancelTLNBusFR()
{
global
Gui, Submit, Nohide
Stringfw =
(
Informations sur votre transfert vers Telenet

Bonjour,

Nous avons essayé de vous contacter à plusieurs reprises récemment car nous avons besoin de détails pour compléter le portage de votre numéro de %MSISDN% à Telenet.
 
Malheureusement, nous n'avons pas encore reçu de réponse et la demande est donc annulée.
 
Si vous souhaitez toujours transférer votre numéro vers Telenet, veuillez nous contacter par téléphone à l'adresse 080066066 ou vous rendre au point de vente le plus proche.

Cordialement,

Telenet
)
clipboard := Stringfw
return
}

MailCancelTLNBusEN()
{
global
Gui, Submit, Nohide
Stringfw =
(
Information about your switch to Telenet

Hello,

We tried to contact you several times recently as we need details to complete your number porting from %MSISDN% to Telenet.
 
Unfortunately, we have not yet received a response to this and the request will be cancelled.
 
If you still wish to transfer your number to Telenet, please contact us by phone at 080066066 or drop by your nearest retail outlet.

Kind regards,

Telenet
)
clipboard := Stringfw
return
}

; MAIL BASE

MailBASE()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, BASE MAIL TEMPLATES
Gui, Add, Text,, 
Gui, Add, Button, gMailBASERes, RESIDENTIAL
Gui, Add, Button, gMailBASEBus, BUSINESS
Gui, add, Text,, 
Gui, Add, Button, gMailCMR, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

; MAIL BASE RESIDENTIAL

MailBASERes()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, BASE RESIDENTIAL MAIL TEMPLATES
Gui, Add, Text,, 
Gui, Add, Button, gMailRejectBASERes, MNP REJECT
Gui, Add, Button, gMailCancelBASERes, MNP CANCEL
Gui, add, Text,, 
Gui, Add, Button, gMailBASE, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

MailRejectBASERes()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, BASE RESIDENTIAL REJECT MAIL
Gui, Add, Text,, 
Gui, Add, Button, gMailReject100BASERes, REJECTCODE 100 (Not Active)
Gui, Add, Button, gMailReject115BASERes, REJECTCODE 115 (Mismatch Simcardnr OLO)
Gui, Add, Button, gMailReject120BASERes, REJECTCODE 120 (Mismatch Customernr OLO)
Gui, add, Text,, 
Gui, Add, Button, gMailBASERes, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

MailReject100BASERes()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, BASE RESIDENTIAL REJECT 100 MAIL
Gui, Add, Text,, 
Gui, Add, Button, gMailReject100BASEResNew, REJECTCODE 100 (Not Active)
Gui, Add, Button, gMailReject100BASEResRem, REMINDER REJECTCODE 100 (Not Active)
Gui, add, Text,, 
Gui, Add, Button, gMailRejectBASERes, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

MailReject100BASEResNew()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, BASE RESIDENTIAL REJECT 100 MAIL
Gui, Add, Text,, 
Gui, Add, Text,, MSISDN
Gui, Add, Edit, vMSISDN
Gui, Add, Text,, 
Gui, Add, Button, gMailReject100BASEResNewNL, COPY NL
Gui, Add, Button, gMailReject100BASEResNewFR, COPY FR
Gui, Add, Button, gMailReject100BASEResNewEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gMailReject100BASERes, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

MailReject100BASEResNewNL()
{
global
Gui, Submit, Nohide
Stringfw =
(
Informatie over uw overstap naar BASE

Hallo,

U koos ervoor de overstap te maken naar BASE voor uw mobiel nummer %MSISDN%.

We konden uw abonnement helaas nog niet activeren, omdat we van uw vorige operator de melding kregen dat het nummer niet meer actief staat.

Er zijn 3 mogelijkheden:

- Het gsm-nummer hierboven vermeld is niet correct.

- Indien dit gsm-nummer correct is en u dit nummer wenst te behouden, dient u eerst uw huidige operator te vragen om het nummer opnieuw te activeren. Na de nieuwe activering, belt u 1x met je huidige simkaart naar het gratis nummer 080066778, om uw nummer opnieuw te activeren op het netwerk. Na het uitvoeren van deze acties, kan u contact met ons opnemen.

- Indien een reactivering bij uw huidige operator niet gaat, of dit is niet nodig voor u, kunt u ook een nieuw BASE-nummer nemen.

Gelieve ons daarna te contacteren met de nodige informatie over je nummeroverdracht via de klantendienst op het nummer 048619199.

Met vriendelijke groeten,

BASE
)
clipboard := Stringfw
return
}

MailReject100BASEResNewFR()
{
global
Gui, Submit, Nohide
Stringfw =
(
Informations sur votre transfert vers BASE

Bonjour,

Vous avez choisi de transférer à BASE pour votre numéro de GSM %MSISDN%.

Malheureusement, nous n'avons pas encore pu activer votre abonnement car nous avons reçu une notification de votre ancien opérateur indiquant que le numéro n'est plus actif.

Il y a trois possibilités :

- Le numéro de GSM mentionné ci-dessus n'est pas correct.

- Si ce numéro est correct et que vous souhaitez le conserver, vous devez d'abord demander à votre opérateur actuel de réactiver le numéro. Après la nouvelle activation, appelez une fois avec votre carte SIM actuelle le numéro gratuit 080066778, pour réactiver votre numéro sur le réseau. Après avoir effectué ces actions, vous pouvez nous contacter.

- Si la réactivation auprès de votre opérateur actuel ne fonctionne pas, ou si cela n'est pas nécessaire pour vous, vous pouvez également prendre un nouveau numéro BASE.

Dans ce cas, veuillez nous contacter avec les informations nécessaires concernant le transfert de votre numéro via le service clientèle au 048619199.

Cordialement,

BASE
)
clipboard := Stringfw
return
}

MailReject100BASEResNewEN()
{
global
Gui, Submit, Nohide
Stringfw =
(
Information about your switch to BASE

Hello,

You chose to make the switch to BASE for your mobile number %MSISDN%.

Unfortunately, we could not yet activate your subscription because we received a notification from your previous operator that the number is no longer active.

There are 3 possibilities:

- The mobile phone number listed above is not correct.

- If this mobile number is correct and you wish to keep this number, you should first ask your current operator to reactivate the number. After the new activation, call once with your current SIM card to the toll-free number 080066778, to reactivate your number on the network. After performing these actions, you can contact us.

- If reactivation with your current operator does not go, or this is not necessary for you, you can also take a new BASE number.

After that, please contact us with the necessary information about your number transfer via customer service on 048619199.

Kind regards,

BASE
)
clipboard := Stringfw
return
}

MailReject100BASEResRem()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, BASE RESIDENTIAL REJECT 100 MAIL
Gui, Add, Text,, 
Gui, Add, Text,, MSISDN
Gui, Add, Edit, vMSISDN
Gui, Add, Text,, 
Gui, Add, Button, gMailReject100BASEResRemNL, COPY NL
Gui, Add, Button, gMailReject100BASEResRemFR, COPY FR
Gui, Add, Button, gMailReject100BASEResRemEN, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gMailReject100BASERes, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

MailReject100BASEResRemNL()
{
global
Gui, Submit, Nohide
Stringfw =
(
Herinnering: Informatie over uw overstap naar BASE

Hallo,

U koos ervoor de overstap te maken naar BASE voor uw mobiel nummer %MSISDN%.

We konden uw abonnement helaas nog niet activeren, omdat we van uw vorige operator de melding kregen dat het nummer niet meer actief staat.

Er zijn 3 mogelijkheden:

- Het gsm-nummer hierboven vermeld is niet correct.

- Indien dit gsm-nummer correct is en u dit nummer wenst te behouden, dient u eerst uw huidige operator te vragen om het nummer opnieuw te activeren. Na de nieuwe activering, belt u 1x met je huidige simkaart naar het gratis nummer 080066778, om uw nummer opnieuw te activeren op het netwerk. Na het uitvoeren van deze acties, kan u contact met ons opnemen.

- Indien een reactivering bij uw huidige operator niet gaat, of dit is niet nodig voor u, kunt u ook een nieuw BASE-nummer nemen.

Gelieve ons daarna te contacteren met de nodige informatie over je nummeroverdracht via de klantendienst op het nummer 048619199.

Let op: U heeft nog 1 week om deze informatie door te geven.
Wanneer we geen informatie ontvangen, dan wordt uw bestelling automatisch geannuleerd.

Met vriendelijke groeten,

BASE
)
clipboard := Stringfw
return
}

MailReject100BASEResRemFR()
{
global
Gui, Submit, Nohide
Stringfw =
(
Rappel: Informations sur votre transfert vers BASE

Bonjour,

Vous avez choisi de transférer à BASE pour votre numéro de GSM %MSISDN%.

Malheureusement, nous n'avons pas encore pu activer votre abonnement car nous avons reçu une notification de votre ancien opérateur indiquant que le numéro n'est plus actif.

Il y a trois possibilités :

- Le numéro de GSM mentionné ci-dessus n'est pas correct.

- Si ce numéro est correct et que vous souhaitez le conserver, vous devez d'abord demander à votre opérateur actuel de réactiver le numéro. Après la nouvelle activation, appelez une fois avec votre carte SIM actuelle le numéro gratuit 080066778, pour réactiver votre numéro sur le réseau. Après avoir effectué ces actions, vous pouvez nous contacter.

- Si la réactivation auprès de votre opérateur actuel ne fonctionne pas, ou si cela n'est pas nécessaire pour vous, vous pouvez également prendre un nouveau numéro BASE.

Dans ce cas, veuillez nous contacter avec les informations nécessaires concernant le transfert de votre numéro via le service clientèle au 048619199.

Attention : vous avez encore 1 semaine pour fournir ces informations.
Si nous ne recevons aucune information, votre commande sera automatiquement annulée.

Cordialement,

BASE
)
clipboard := Stringfw
return
}

MailReject100BASEResRemEN()
{
global
Gui, Submit, Nohide
Stringfw =
(
Reminder: Information about your switch to BASE

Hello,

You chose to make the switch to BASE for your mobile number %MSISDN%.

Unfortunately, we could not yet activate your subscription because we received a notification from your previous operator that the number is no longer active.

There are 3 possibilities:

- The mobile phone number listed above is not correct.

- If this mobile number is correct and you wish to keep this number, you should first ask your current operator to reactivate the number. After the new activation, call once with your current SIM card to the toll-free number 080066778, to reactivate your number on the network. After performing these actions, you can contact us.

- If reactivation with your current operator does not go, or this is not necessary for you, you can also take a new BASE number.

After that, please contact us with the necessary information about your number transfer via customer service on 048619199.

Note: You still have 1 week to provide this information.
If we do not receive any information, your order will automatically be cancelled.

Kind regards,

BASE
)
clipboard := Stringfw
return
}

MailReject115BASERes()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, BASE RESIDENTIAL REJECT 115 MAIL
Gui, Add, Text,, 
Gui, Add, Button, gMailReject115BASEResNew, REJECTCODE 115 (Mismatch Simcardnr OLO)
Gui, Add, Button, gMailReject115BASEResRem, REMINDER REJECTCODE 115 (Mismatch Simcardnr OLO)
Gui, add, Text,, 
Gui, Add, Button, gMailRejectBASERes, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

MailReject115BASEResNew()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, BASE RESIDENTIAL REJECT 115 MAIL
Gui, Add, Text,, 
Gui, Add, Text,, MSISDN
Gui, Add, Edit, vMSISDN
Gui, Add, Text,, 
Gui, Add, Button, gMailReject115BASEResNewNL, COPY NL
Gui, Add, Button, gMailReject115BASEResNewFR, COPY FR
Gui, Add, Button, gMailReject115BASEResNewEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gMailReject115BASERes, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

MailReject115BASEResNewNL()
{
global
Gui, Submit, Nohide
Stringfw =
(
Informatie over uw overstap naar BASE

Hallo,

U koos ervoor de overstap te maken naar BASE voor uw mobiel nummer %MSISDN%.

We konden uw abonnement helaas nog niet activeren, omdat we van uw vorige operator de melding kregen dat de doorgestuurde gegevens niet overeenkomen met de gegevens in hun systeem.

Om een nieuwe aanvraag te starten, hebben we het correcte simkaartnummer nodig van uw huidige operator. Dit kan u vinden op de simkaart zelf of door contact op te nemen met uw operator.

U kan daarna de correcte gegevens doorgeven via 048619199.

Met vriendelijke groeten,

BASE
)
clipboard := Stringfw
return
}

MailReject115BASEResNewFR()
{
global
Gui, Submit, Nohide
Stringfw =
(
Informations sur votre transfert vers BASE

Bonjour,

Vous avez choisi de transférer à BASE pour votre numéro de GSM %MSISDN%.

Malheureusement, nous n'avons pas encore pu activer votre abonnement car nous avons reçu un message de votre ancien opérateur indiquant que les données envoyées ne correspondent pas aux données de son système.

Pour démarrer une nouvelle application, nous avons besoin du numéro de carte SIM correct de votre opérateur actuel. Celui-ci peut être trouvé sur la carte SIM elle-même ou en contactant votre opérateur.

Vous pouvez ensuite fournir les informations correctes via téléphone au 048619199.

Cordialement,

BASE
)
clipboard := Stringfw
return
}

MailReject115BASEResNewEN()
{
global
Gui, Submit, Nohide
Stringfw =
(
Information about your switch to BASE

Hello,

You chose to make the switch to BASE for your mobile number %MSISDN%.

Unfortunately, we were unable to activate your subscription yet because we received a message from your previous operator that the data sent does not match the data in their system.

To start a new application, we need the correct SIM card number from your current operator. This can be found on the SIM card itself or by contacting your operator.

You can then provide the correct details by telephone on 015666666.

Kind regards,

BASE
)
clipboard := Stringfw
return
}

MailReject115BASEResRem()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, BASE RESIDENTIAL REJECT 115 MAIL
Gui, Add, Text,, 
Gui, Add, Text,, MSISDN
Gui, Add, Edit, vMSISDN
Gui, Add, Text,, 
Gui, Add, Button, gMailReject115BASEResRemNL, COPY NL
Gui, Add, Button, gMailReject115BASEResRemFR, COPY FR
Gui, Add, Button, gMailReject115BASEResRemEN, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gMailReject115BASERes, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

MailReject115BASEResRemNL()
{
global
Gui, Submit, Nohide
Stringfw =
(
Herinnering: Informatie over uw overstap naar BASE

Hallo,

U koos ervoor de overstap te maken naar BASE voor uw mobiel nummer %MSISDN%.

We konden uw abonnement helaas nog niet activeren, omdat we van uw vorige operator de melding kregen dat de doorgestuurde gegevens niet overeenkomen met de gegevens in hun systeem.

Om een nieuwe aanvraag te starten, hebben we het correcte simkaartnummer nodig van uw huidige operator. Dit kan u vinden op de simkaart zelf of door contact op te nemen met uw operator.

U kan daarna de correcte gegevens doorgeven via 048619199.

Let op: U heeft nog 1 week om deze informatie door te geven.
Wanneer we geen informatie ontvangen, dan wordt uw bestelling automatisch geannuleerd.

Met vriendelijke groeten,

BASE
)
clipboard := Stringfw
return
}

MailReject115BASEResRemFR()
{
global
Gui, Submit, Nohide
Stringfw =
(
Rappel: Informations sur votre transfert vers BASE

Bonjour,

Vous avez choisi de transférer à BASE pour votre numéro de GSM %MSISDN%.

Malheureusement, nous n'avons pas encore pu activer votre abonnement car nous avons reçu un message de votre ancien opérateur indiquant que les données envoyées ne correspondent pas aux données de son système.

Pour démarrer une nouvelle application, nous avons besoin du numéro de carte SIM correct de votre opérateur actuel. Celui-ci peut être trouvé sur la carte SIM elle-même ou en contactant votre opérateur.

Vous pouvez ensuite fournir les informations correctes par téléphone au 048619199.

Attention : vous avez encore 1 semaine pour fournir ces informations.
Si nous ne recevons aucune information, votre commande sera automatiquement annulée.

Cordialement,

BASE
)
clipboard := Stringfw
return
}

MailReject115BASEResRemEN()
{
global
Gui, Submit, Nohide
Stringfw =
(
Reminder: Information about your switch to BASE

Hello,

You chose to make the switch to BASE for your mobile number %MSISDN%.

Unfortunately, we were unable to activate your subscription yet because we received a message from your previous operator that the data sent does not match the data in their system.

To start a new application, we need the correct SIM card number from your current operator. This can be found on the SIM card itself or by contacting your operator.

You can then provide the correct details by telephone on 048619199.

Note: You still have 1 week to provide this information.
If we do not receive any information, your order will automatically be cancelled.

Kind regards,

BASE
)
clipboard := Stringfw
return
}

MailReject120BASERes()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, BASE RESIDENTIAL REJECT 120 MAIL
Gui, Add, Text,, 
Gui, Add, Button, gMailReject120BASEResNew, REJECTCODE 120 (Mismatch Customernr OLO)
Gui, Add, Button, gMailReject120BASEResRem, REMINDER REJECTCODE 120 (Mismatch Customernr OLO)
Gui, add, Text,, 
Gui, Add, Button, gMailRejectBASERes, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

MailReject120BASEResNew()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, BASE RESIDENTIAL REJECT 120 MAIL
Gui, Add, Text,, 
Gui, Add, Text,, MSISDN
Gui, Add, Edit, vMSISDN
Gui, Add, Text,, 
Gui, Add, Button, gMailReject120BASEResNewNL, COPY NL
Gui, Add, Button, gMailReject120BASEResNewFR, COPY FR
Gui, Add, Button, gMailReject120BASEResNewEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gMailReject120BASERes, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

MailReject120BASEResNewNL()
{
global
Gui, Submit, Nohide
Stringfw =
(
Informatie over uw overstap naar BASE

Hallo,

U koos ervoor de overstap te maken naar BASE voor uw mobiel nummer %MSISDN%.

We konden uw abonnement helaas nog niet activeren, omdat we van uw vorige operator de melding kregen dat de doorgestuurde gegevens niet overeenkomen met de gegevens in hun systeem.

Om een nieuwe aanvraag te starten, hebben we het correcte klantnummer nodig van uw huidige operator. Dit kan u vinden op de recentste aanrekening of door contact op te nemen met uw operator.

U kan daarna de correcte gegevens doorgeven via 048619199.

Met vriendelijke groeten,

Telenet
)
clipboard := Stringfw
return
}

MailReject120BASEResNewFR()
{
global
Gui, Submit, Nohide
Stringfw =
(
Informations sur votre transfert vers BASE

Bonjour,

Vous avez choisi de transférer à BASE pour votre numéro de GSM %MSISDN%.

Malheureusement, nous n'avons pas encore pu activer votre abonnement car nous avons reçu un message de votre ancien opérateur indiquant que les données envoyées ne correspondent pas aux données de son système.

Pour démarrer une nouvelle application, nous avons besoin du numéro client correct de votre opérateur actuel. Celui-ci se trouve sur la facture la plus récente ou en contactant votre opérateur.

Vous pouvez ensuite fournir les informations correctes par téléphone au 048619199.

Cordialement,

BASE
)
clipboard := Stringfw
return
}

MailReject120BASEResNewEN()
{
global
Gui, Submit, Nohide
Stringfw =
(
Information about your switch to BASE

Hello,

You chose to make the switch to BASE for your mobile number %MSISDN%.

Unfortunately, we were unable to activate your subscription yet because we received a message from your previous operator that the data sent does not match the data in their system.

To start a new application, we need the correct customer number from your current operator. This can be found on the most recent invoice or by contacting your operator.

You can then provide the correct details by telephone on 048619199.

Kind regards,

BASE
)
clipboard := Stringfw
return
}

MailReject120BASEResRem()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, BASE RESIDENTIAL REJECT 120 MAIL
Gui, Add, Text,, 
Gui, Add, Text,, MSISDN
Gui, Add, Edit, vMSISDN
Gui, Add, Text,, 
Gui, Add, Button, gMailReject120BASEResRemNL, COPY NL
Gui, Add, Button, gMailReject120BASEResRemFR, COPY FR
Gui, Add, Button, gMailReject120BASEResRemEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gMailReject115BASERes, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

MailReject120BASEResRemNL()
{
global
Gui, Submit, Nohide
Stringfw =
(
Herinnering: Informatie over uw overstap naar BASE

Hallo,

U koos ervoor de overstap te maken naar BASE voor uw mobiel nummer %MSISDN%.

We konden uw abonnement helaas nog niet activeren, omdat we van uw vorige operator de melding kregen dat de doorgestuurde gegevens niet overeenkomen met de gegevens in hun systeem.

Om een nieuwe aanvraag te starten, hebben we het correcte klantnummer nodig van uw huidige operator. Dit kan u vinden op de recentste aanrekening of door contact op te nemen met uw operator.

U kan daarna de correcte gegevens doorgeven via 048619199.

Let op: U heeft nog 1 week om deze informatie door te geven.
Wanneer we geen informatie ontvangen, dan wordt uw bestelling automatisch geannuleerd.

Met vriendelijke groeten,

BASE
)
clipboard := Stringfw
return
}

MailReject120BASEResRemFR()
{
global
Gui, Submit, Nohide
Stringfw =
(
Rappel: Informations sur votre transfert vers BASE

Bonjour,

Vous avez choisi de transférer à BASE pour votre numéro de GSM %MSISDN%.

Malheureusement, nous n'avons pas encore pu activer votre abonnement car nous avons reçu un message de votre ancien opérateur indiquant que les données envoyées ne correspondent pas aux données de son système.

Pour démarrer une nouvelle application, nous avons besoin du numéro client correct de votre opérateur actuel. Celui-ci se trouve sur la facture la plus récente ou en contactant votre opérateur.

Vous pouvez ensuite fournir les informations correctes par téléphone au 048619199.

Attention : vous avez encore 1 semaine pour fournir ces informations.
Si nous ne recevons aucune information, votre commande sera automatiquement annulée.

Cordialement,

BASE
)
clipboard := Stringfw
return
}

MailReject120BASEResRemEN()
{
global
Gui, Submit, Nohide
Stringfw =
(
Reminder: Information about your switch to BASE

Hello,

You chose to make the switch to BASE for your mobile number %MSISDN%.

Unfortunately, we were unable to activate your subscription yet because we received a message from your previous operator that the data sent does not match the data in their system.

To start a new application, we need the correct customer number from your current operator. This can be found on the most recent invoice or by contacting your operator.

You can then provide the correct details by telephone on 048619199.

Note: You still have 1 week to provide this information.
If we do not receive any information, your order will automatically be cancelled.

Kind regards,

BASE
)
clipboard := Stringfw
return
}

MailCancelBASERes()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, BASE RESIDENTIAL MNP CANCEL MAIL
Gui, Add, Text,, 
Gui, Add, Text,, MSISDN
Gui, Add, Edit, vMSISDN
Gui, Add, Text,, 
Gui, Add, Button, gMailCancelBASEResNL, COPY NL
Gui, Add, Button, gMailCancelBASEResFR, COPY FR
Gui, Add, Button, gMailCancelBASEResEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gMailBASERes, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

MailCancelBASEResNL()
{
global
Gui, Submit, Nohide
Stringfw =
(
Informatie over uw overstap naar BASE

Hallo,

We hebben je onlangs een aantal keren proberen contacteren omdat we gegevens nodig hebben om je nummerovername van %MSISDN% te kunnen voltooien naar BASE.
 
Helaas hebben we hier nog geen reactie op gekregen en zal de aanvraag geannuleerd worden.
 
Indien je nog wenst om je nummer over te dragen naar BASE, kan je ons telefonisch contacteren via 048619199 of langsgaan bij het dichtsbijzijnde winkelpunt.

Met vriendelijke groeten,

BASE
)
clipboard := Stringfw
return
}

MailCancelBASEResFR()
{
global
Gui, Submit, Nohide
Stringfw =
(
Informations sur votre transfert vers BASE

Bonjour,

Nous avons essayé de vous contacter à plusieurs reprises récemment car nous avons besoin de détails pour compléter le portage de votre numéro de %MSISDN% à BASE.
 
Malheureusement, nous n'avons pas encore reçu de réponse et la demande est donc annulée.
 
Si vous souhaitez toujours transférer votre numéro vers BASE, veuillez nous contacter par téléphone à l'adresse 048619199 ou vous rendre au point de vente le plus proche.

Cordialement,

BASE
)
clipboard := Stringfw
return
}

MailCancelBASEResEN()
{
global
Gui, Submit, Nohide
Stringfw =
(
Information about your switch to BASE

Hello,

We tried to contact you several times recently as we need details to complete your number porting from %MSISDN% to BASE.
 
Unfortunately, we have not yet received a response to this and the request will be cancelled.
 
If you still wish to transfer your number to BASE, please contact us by phone at 048619199 or drop by your nearest retail outlet.

Kind regards,

BASE
)
clipboard := Stringfw
return
}

; MAIL BASE BUSINESS

MailBASEBus()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, BASE BUSINESS MAIL TEMPLATES
Gui, Add, Text,, 
Gui, Add, Button, gMailRejectBASEBus, MNP REJECT
Gui, Add, Button, gMailCancelBASEBus, MNP CANCEL
Gui, add, Text,, 
Gui, Add, Button, gMailBASE, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

MailRejectBASEBus()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, BASE BUSINESS REJECT MAIL
Gui, Add, Text,, 
Gui, Add, Button, gMailReject100BASEBus, REJECTCODE 100 (Not Active)
Gui, Add, Button, gMailReject115BASEBus, REJECTCODE 115 (Mismatch Simcardnr OLO)
Gui, Add, Button, gMailReject120BASEBus, REJECTCODE 120 (Mismatch Customernr OLO)
Gui, add, Text,, 
Gui, Add, Button, gMailBASEBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

MailReject100BASEBus()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, BASE BUSINESS REJECT 100 MAIL
Gui, Add, Text,, 
Gui, Add, Button, gMailReject100BASEBusNew, REJECTCODE 100 (Not Active)
Gui, Add, Button, gMailReject100BASEBusRem, REMINDER REJECTCODE 100 (Not Active)
Gui, add, Text,, 
Gui, Add, Button, gMailRejectBASEBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

MailReject100BASEBusNew()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, BASE BUSINESS REJECT 100 MAIL
Gui, Add, Text,, 
Gui, Add, Text,, MSISDN
Gui, Add, Edit, vMSISDN
Gui, Add, Text,, 
Gui, Add, Button, gMailReject100BASEBusNewNL, COPY NL
Gui, Add, Button, gMailReject100BASEBusNewFR, COPY FR
Gui, Add, Button, gMailReject100BASEBusNewEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gMailReject100BASEBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

MailReject100BASEBusNewNL()
{
global
Gui, Submit, Nohide
Stringfw =
(
Informatie over uw overstap naar BASE-Business

Hallo,

U koos ervoor de overstap te maken naar BASE voor uw mobiel nummer %MSISDN%.

We konden uw abonnement helaas nog niet activeren, omdat we van uw vorige operator de melding kregen dat het nummer niet meer actief staat.

Er zijn 3 mogelijkheden:

- Het gsm-nummer hierboven vermeld is niet correct.

- Indien dit gsm-nummer correct is en u dit nummer wenst te behouden, dient u eerst uw huidige operator te vragen om het nummer opnieuw te activeren. Na de nieuwe activering, belt u 1x met je huidige simkaart naar het gratis nummer 080066778, om uw nummer opnieuw te activeren op het netwerk. Na het uitvoeren van deze acties, kan u contact met ons opnemen.

- Indien een reactivering bij uw huidige operator niet gaat, of dit is niet nodig voor u, kunt u ook een nieuw BASE-nummer nemen.

Gelieve ons daarna te contacteren met de nodige informatie over je nummeroverdracht via de klantendienst op het nummer 0486191940.

Met vriendelijke groeten,

BASE
)
clipboard := Stringfw
return
}

MailReject100BASEBusNewFR()
{
global
Gui, Submit, Nohide
Stringfw =
(
Informations sur votre transfert vers BASE-Business

Bonjour,

Vous avez choisi de transférer à BASE pour votre numéro de GSM %MSISDN%.

Malheureusement, nous n'avons pas encore pu activer votre abonnement car nous avons reçu une notification de votre ancien opérateur indiquant que le numéro n'est plus actif.

Il y a trois possibilités :

- Le numéro de GSM mentionné ci-dessus n'est pas correct.

- Si ce numéro est correct et que vous souhaitez le conserver, vous devez d'abord demander à votre opérateur actuel de réactiver le numéro. Après la nouvelle activation, appelez une fois avec votre carte SIM actuelle le numéro gratuit 080066778, pour réactiver votre numéro sur le réseau. Après avoir effectué ces actions, vous pouvez nous contacter.

- Si la réactivation auprès de votre opérateur actuel ne fonctionne pas, ou si cela n'est pas nécessaire pour vous, vous pouvez également prendre un nouveau numéro BASE.

Dans ce cas, veuillez nous contacter avec les informations nécessaires concernant le transfert de votre numéro via le service clientèle au 0486191940.

Cordialement,

BASE
)
clipboard := Stringfw
return
}

MailReject100BASEBusNewEN()
{
global
Gui, Submit, Nohide
Stringfw =
(
Information about your switch to BASE-Business

Hello,

You chose to make the switch to BASE for your mobile number %MSISDN%.

Unfortunately, we could not yet activate your subscription because we received a notification from your previous operator that the number is no longer active.

There are 3 possibilities:

- The mobile phone number listed above is not correct.

- If this mobile number is correct and you wish to keep this number, you should first ask your current operator to reactivate the number. After the new activation, call once with your current SIM card to the toll-free number 080066778, to reactivate your number on the network. After performing these actions, you can contact us.

- If reactivation with your current operator does not go, or this is not necessary for you, you can also take a new BASE number.

After that, please contact us with the necessary information about your number transfer via customer service on 0486191940.

Kind regards,

BASE
)
clipboard := Stringfw
return
}

MailReject100BASEBusRem()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, BASE BUSINESS REJECT 100 MAIL
Gui, Add, Text,, 
Gui, Add, Text,, MSISDN
Gui, Add, Edit, vMSISDN
Gui, Add, Text,, 
Gui, Add, Button, gMailReject100BASEBusRemNL, COPY NL
Gui, Add, Button, gMailReject100BASEBusRemFR, COPY FR
Gui, Add, Button, gMailReject100BASEBusRemEN, COPY EN
Gui, add, Text,, 
Gui, Add, Button, gMailReject100TLNBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

MailReject100BASEBusRemNL()
{
global
Gui, Submit, Nohide
Stringfw =
(
Herinnering: Informatie over uw overstap naar BASE-Business

Hallo,

U koos ervoor de overstap te maken naar BASE voor uw mobiel nummer %MSISDN%.

We konden uw abonnement helaas nog niet activeren, omdat we van uw vorige operator de melding kregen dat het nummer niet meer actief staat.

Er zijn 3 mogelijkheden:

- Het gsm-nummer hierboven vermeld is niet correct.

- Indien dit gsm-nummer correct is en u dit nummer wenst te behouden, dient u eerst uw huidige operator te vragen om het nummer opnieuw te activeren. Na de nieuwe activering, belt u 1x met je huidige simkaart naar het gratis nummer 080066778, om uw nummer opnieuw te activeren op het netwerk. Na het uitvoeren van deze acties, kan u contact met ons opnemen.

- Indien een reactivering bij uw huidige operator niet gaat, of dit is niet nodig voor u, kunt u ook een nieuw BASE-nummer nemen.

Gelieve ons daarna te contacteren met de nodige informatie over je nummeroverdracht via de klantendienst op het nummer 0486191940.

Let op: U heeft nog 1 week om deze informatie door te geven.
Wanneer we geen informatie ontvangen, dan wordt uw bestelling automatisch geannuleerd.

Met vriendelijke groeten,

BASE
)
clipboard := Stringfw
return
}

MailReject100BASEBusRemFR()
{
global
Gui, Submit, Nohide
Stringfw =
(
Rappel: Informations sur votre transfert vers BASE-Business

Bonjour,

Vous avez choisi de transférer à BASE pour votre numéro de GSM %MSISDN%.

Malheureusement, nous n'avons pas encore pu activer votre abonnement car nous avons reçu une notification de votre ancien opérateur indiquant que le numéro n'est plus actif.

Il y a trois possibilités :

- Le numéro de GSM mentionné ci-dessus n'est pas correct.

- Si ce numéro est correct et que vous souhaitez le conserver, vous devez d'abord demander à votre opérateur actuel de réactiver le numéro. Après la nouvelle activation, appelez une fois avec votre carte SIM actuelle le numéro gratuit 080066778, pour réactiver votre numéro sur le réseau. Après avoir effectué ces actions, vous pouvez nous contacter.

- Si la réactivation auprès de votre opérateur actuel ne fonctionne pas, ou si cela n'est pas nécessaire pour vous, vous pouvez également prendre un nouveau numéro BASE.

Dans ce cas, veuillez nous contacter avec les informations nécessaires concernant le transfert de votre numéro via le service clientèle au 0486191940.

Attention : vous avez encore 1 semaine pour fournir ces informations.
Si nous ne recevons aucune information, votre commande sera automatiquement annulée.

Cordialement,

BASE
)
clipboard := Stringfw
return
}

MailReject100BASEBusRemEN()
{
global
Gui, Submit, Nohide
Stringfw =
(
Reminder: Information about your switch to BASE-Business

Hello,

You chose to make the switch to BASE for your mobile number %MSISDN%.

Unfortunately, we could not yet activate your subscription because we received a notification from your previous operator that the number is no longer active.

There are 3 possibilities:

- The mobile phone number listed above is not correct.

- If this mobile number is correct and you wish to keep this number, you should first ask your current operator to reactivate the number. After the new activation, call once with your current SIM card to the toll-free number 080066778, to reactivate your number on the network. After performing these actions, you can contact us.

- If reactivation with your current operator does not go, or this is not necessary for you, you can also take a new BASE number.

After that, please contact us with the necessary information about your number transfer via customer service on 0486191940.

Note: You still have 1 week to provide this information.
If we do not receive any information, your order will automatically be cancelled.

Kind regards,

BASE
)
clipboard := Stringfw
return
}

MailReject115BASEBus()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, BASE BUSINESS REJECT 115 MAIL
Gui, Add, Text,, 
Gui, Add, Button, gMailReject115BASEBusNew, REJECTCODE 115 (Mismatch Simcardnr OLO)
Gui, Add, Button, gMailReject115BASEBusRem, REMINDER REJECTCODE 115 (Mismatch Simcardnr OLO)
Gui, add, Text,, 
Gui, Add, Button, gMailRejectBASEBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

MailReject115BASEBusNew()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, BASE BUSINESS REJECT 115 MAIL
Gui, Add, Text,, 
Gui, Add, Text,, MSISDN
Gui, Add, Edit, vMSISDN
Gui, Add, Text,, 
Gui, Add, Button, gMailReject115BASEBusNewNL, COPY NL
Gui, Add, Button, gMailReject115BASEBusNewFR, COPY FR
Gui, Add, Button, gMailReject115BASEBusNewEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gMailReject115BASEBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

MailReject115BASEBusNewNL()
{
global
Gui, Submit, Nohide
Stringfw =
(
Informatie over uw overstap naar BASE-Business

Hallo,

U koos ervoor de overstap te maken naar BASE voor uw mobiel nummer %MSISDN%.

We konden uw abonnement helaas nog niet activeren, omdat we van uw vorige operator de melding kregen dat de doorgestuurde gegevens niet overeenkomen met de gegevens in hun systeem.

Om een nieuwe aanvraag te starten, hebben we het correcte simkaartnummer nodig van uw huidige operator. Dit kan u vinden op de simkaart zelf of door contact op te nemen met uw operator.

U kan daarna de correcte gegevens doorgeven via 0486191940.

Met vriendelijke groeten,

BASE
)
clipboard := Stringfw
return
}

MailReject115BASEBusNewFR()
{
global
Gui, Submit, Nohide
Stringfw =
(
Informations sur votre transfert vers BASE-Business

Bonjour,

Vous avez choisi de transférer à BASE pour votre numéro de GSM %MSISDN%.

Malheureusement, nous n'avons pas encore pu activer votre abonnement car nous avons reçu un message de votre ancien opérateur indiquant que les données envoyées ne correspondent pas aux données de son système.

Pour démarrer une nouvelle application, nous avons besoin du numéro de carte SIM correct de votre opérateur actuel. Celui-ci peut être trouvé sur la carte SIM elle-même ou en contactant votre opérateur.

Vous pouvez ensuite fournir les informations correctes par téléphone au 0486191940.

Cordialement,

BASE
)
clipboard := Stringfw
return
}

MailReject115BASEBusNewEN()
{
global
Gui, Submit, Nohide
Stringfw =
(
Information about your switch to BASE-Business

Hello,

You chose to make the switch to BASE for your mobile number %MSISDN%.

Unfortunately, we were unable to activate your subscription yet because we received a message from your previous operator that the data sent does not match the data in their system.

To start a new application, we need the correct SIM card number from your current operator. This can be found on the SIM card itself or by contacting your operator.

You can then provide the correct details by telephone on 0486191940.

Kind regards,

BASE
)
clipboard := Stringfw
return
}

MailReject115BASEBusRem()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, BASE BUSINESS REJECT 115 MAIL
Gui, Add, Text,, 
Gui, Add, Text,, MSISDN
Gui, Add, Edit, vMSISDN
Gui, Add, Text,, 
Gui, Add, Button, gMailReject115BASEBusRemNL, COPY NL
Gui, Add, Button, gMailReject115BASEBusRemFR, COPY FR
Gui, Add, Button, gMailReject115BASEBusRemEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gMailReject115BASEBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

MailReject115BASEBusRemNL()
{
global
Gui, Submit, Nohide
Stringfw =
(
Herinnering: Informatie over uw overstap naar BASE-Business

Hallo,

U koos ervoor de overstap te maken naar BASE voor uw mobiel nummer %MSISDN%.

We konden uw abonnement helaas nog niet activeren, omdat we van uw vorige operator de melding kregen dat de doorgestuurde gegevens niet overeenkomen met de gegevens in hun systeem.

Om een nieuwe aanvraag te starten, hebben we het correcte simkaartnummer nodig van uw huidige operator. Dit kan u vinden op de simkaart zelf of door contact op te nemen met uw operator.

U kan daarna de correcte gegevens doorgeven via 0486191940.

Let op: U heeft nog 1 week om deze informatie door te geven.
Wanneer we geen informatie ontvangen, dan wordt uw bestelling automatisch geannuleerd.

Met vriendelijke groeten,

BASE
)
clipboard := Stringfw
return
}

MailReject115BASEBusRemFR()
{
global
Gui, Submit, Nohide
Stringfw =
(
Rappel: Informations sur votre transfert vers BASE-Business

Bonjour,

Vous avez choisi de transférer à BASE pour votre numéro de GSM %MSISDN%.

Malheureusement, nous n'avons pas encore pu activer votre abonnement car nous avons reçu un message de votre ancien opérateur indiquant que les données envoyées ne correspondent pas aux données de son système.

Pour démarrer une nouvelle application, nous avons besoin du numéro de carte SIM correct de votre opérateur actuel. Celui-ci peut être trouvé sur la carte SIM elle-même ou en contactant votre opérateur.

Vous pouvez ensuite fournir les informations correctes par téléphone au 0486191940.

Attention : vous avez encore 1 semaine pour fournir ces informations.
Si nous ne recevons aucune information, votre commande sera automatiquement annulée.

Cordialement,

BASE
)
clipboard := Stringfw
return
}

MailReject115BASEBusRemEN()
{
global
Gui, Submit, Nohide
Stringfw =
(
Reminder: Information about your switch to BASE-Business

Hello,

You chose to make the switch to BASE for your mobile number %MSISDN%.

Unfortunately, we were unable to activate your subscription yet because we received a message from your previous operator that the data sent does not match the data in their system.

To start a new application, we need the correct SIM card number from your current operator. This can be found on the SIM card itself or by contacting your operator.

You can then provide the correct details by telephone on 0486191940.

Note: You still have 1 week to provide this information.
If we do not receive any information, your order will automatically be cancelled.

Kind regards,

BASE
)
clipboard := Stringfw
return
}

MailReject120BASEBus()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, BASE BUSINESS REJECT 120 MAIL
Gui, Add, Text,, 
Gui, Add, Button, gMailReject120BASEBusNew, REJECTCODE 120 (Mismatch Customernr OLO)
Gui, Add, Button, gMailReject120BASEBusRem, REMINDER REJECTCODE 120 (Mismatch Customernr OLO)
Gui, add, Text,, 
Gui, Add, Button, gMailRejectBASEBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

MailReject120BASEBusNew()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, BASE BUSINESS REJECT 120 MAIL
Gui, Add, Text,, 
Gui, Add, Text,, MSISDN
Gui, Add, Edit, vMSISDN
Gui, Add, Text,, 
Gui, Add, Button, gMailReject120BASEBusNewNL, COPY NL
Gui, Add, Button, gMailReject120BASEBusNewFR, COPY FR
Gui, Add, Button, gMailReject120BASEBusNewEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gMailReject120BASEBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

MailReject120BASEBusNewNL()
{
global
Gui, Submit, Nohide
Stringfw =
(
Informatie over uw overstap naar BASE-Business

Hallo,

U koos ervoor de overstap te maken naar BASE voor uw mobiel nummer %MSISDN%.

We konden uw abonnement helaas nog niet activeren, omdat we van uw vorige operator de melding kregen dat de doorgestuurde gegevens niet overeenkomen met de gegevens in hun systeem.

Om een nieuwe aanvraag te starten, hebben we het correcte klantnummer nodig van uw huidige operator. Dit kan u vinden op de recentste aanrekening of door contact op te nemen met uw operator.

U kan daarna de correcte gegevens doorgeven via 0486191940.

Met vriendelijke groeten,

BASE
)
clipboard := Stringfw
return
}

MailReject120BASEBusNewFR()
{
global
Gui, Submit, Nohide
Stringfw =
(
Informations sur votre transfert vers BASE-Business

Bonjour,

Vous avez choisi de transférer à BASE pour votre numéro de GSM %MSISDN%.

Malheureusement, nous n'avons pas encore pu activer votre abonnement car nous avons reçu un message de votre ancien opérateur indiquant que les données envoyées ne correspondent pas aux données de son système.

Pour démarrer une nouvelle application, nous avons besoin du numéro client correct de votre opérateur actuel. Celui-ci se trouve sur la facture la plus récente ou en contactant votre opérateur.

Vous pouvez ensuite fournir les informations correctes par téléphone au 0486191940.

Cordialement,

BASE
)
clipboard := Stringfw
return
}

MailReject120BASEBusNewEN()
{
global
Gui, Submit, Nohide
Stringfw =
(
Information about your switch to BASE-Business

Hello,

You chose to make the switch to BASE for your mobile number %MSISDN%.

Unfortunately, we were unable to activate your subscription yet because we received a message from your previous operator that the data sent does not match the data in their system.

To start a new application, we need the correct customer number from your current operator. This can be found on the most recent invoice or by contacting your operator.

You can then provide the correct details by telephone on 0486191940.

Kind regards,

BASE
)
clipboard := Stringfw
return
}

MailReject120BASEBusRem()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, BASE BUSINESS REJECT 120 MAIL
Gui, Add, Text,, 
Gui, Add, Text,, MSISDN
Gui, Add, Edit, vMSISDN
Gui, Add, Text,, 
Gui, Add, Button, gMailReject120BASEBusRemNL, COPY NL
Gui, Add, Button, gMailReject120BASEBusRemFR, COPY FR
Gui, Add, Button, gMailReject120BASEBusRemEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gMailReject115BASEBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

MailReject120BASEBusRemNL()
{
global
Gui, Submit, Nohide
Stringfw =
(
Herinnering: Informatie over uw overstap naar BASE-Business

Hallo,

U koos ervoor de overstap te maken naar BASE voor uw mobiel nummer %MSISDN%.

We konden uw abonnement helaas nog niet activeren, omdat we van uw vorige operator de melding kregen dat de doorgestuurde gegevens niet overeenkomen met de gegevens in hun systeem.

Om een nieuwe aanvraag te starten, hebben we het correcte klantnummer nodig van uw huidige operator. Dit kan u vinden op de recentste aanrekening of door contact op te nemen met uw operator.

U kan daarna de correcte gegevens doorgeven via 0486191940.

Let op: U heeft nog 1 week om deze informatie door te geven.
Wanneer we geen informatie ontvangen, dan wordt uw bestelling automatisch geannuleerd.

Met vriendelijke groeten,

BASE
)
clipboard := Stringfw
return
}

MailReject120BASEBusRemFR()
{
global
Gui, Submit, Nohide
Stringfw =
(
Rappel: Informations sur votre transfert vers BASE-Business

Bonjour,

Vous avez choisi de transférer à BASE pour votre numéro de GSM %MSISDN%.

Malheureusement, nous n'avons pas encore pu activer votre abonnement car nous avons reçu un message de votre ancien opérateur indiquant que les données envoyées ne correspondent pas aux données de son système.

Pour démarrer une nouvelle application, nous avons besoin du numéro client correct de votre opérateur actuel. Celui-ci se trouve sur la facture la plus récente ou en contactant votre opérateur.

Vous pouvez ensuite fournir les informations correctes par téléphone au 0486191940.

Attention : vous avez encore 1 semaine pour fournir ces informations.
Si nous ne recevons aucune information, votre commande sera automatiquement annulée.

Cordialement,

BASE
)
clipboard := Stringfw
return
}

MailReject120BASEBusRemEN()
{
global
Gui, Submit, Nohide
Stringfw =
(
Reminder: Information about your switch to BASE-Business

Hello,

You chose to make the switch to BASE for your mobile number %MSISDN%.

Unfortunately, we were unable to activate your subscription yet because we received a message from your previous operator that the data sent does not match the data in their system.

To start a new application, we need the correct customer number from your current operator. This can be found on the most recent invoice or by contacting your operator.

You can then provide the correct details by telephone on 0486191940.

Note: You still have 1 week to provide this information.
If we do not receive any information, your order will automatically be cancelled.

Kind regards,

BASE
)
clipboard := Stringfw
return
}

MailCancelBASEBus()
{
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, BASE BUSINESS MNP CANCEL MAIL
Gui, Add, Text,, 
Gui, Add, Text,, MSISDN
Gui, Add, Edit, vMSISDN
Gui, Add, Text,, 
Gui, Add, Button, gMailCancelBASEBusNL, COPY NL
Gui, Add, Button, gMailCancelBASEBusFR, COPY FR
Gui, Add, Button, gMailCancelBASEBusEN, COPY EN
Gui, add, Text,, 
Gui, add, Button, gClear, CLEAR
Gui, add, Text,, 
Gui, Add, Button, gMailBASEBus, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

MailCancelBASEBusNL()
{
global
Gui, Submit, Nohide
Stringfw =
(
Informatie over uw overstap naar BASE

Hallo,

We hebben je onlangs een aantal keren proberen contacteren omdat we gegevens nodig hebben om je nummerovername van %MSISDN% te kunnen voltooien naar BASE.
 
Helaas hebben we hier nog geen reactie op gekregen en zal de aanvraag geannuleerd worden.
 
Indien je nog wenst om je nummer over te dragen naar BASE, kan je ons telefonisch contacteren via 0486191940 of langsgaan bij het dichtsbijzijnde winkelpunt.

Met vriendelijke groeten,

BASE
)
clipboard := Stringfw
return
}

MailCancelBASEBusFR()
{
global
Gui, Submit, Nohide
Stringfw =
(
Informations sur votre transfert vers BASE

Bonjour,

Nous avons essayé de vous contacter à plusieurs reprises récemment car nous avons besoin de détails pour compléter le portage de votre numéro de %MSISDN% à BASE.
 
Malheureusement, nous n'avons pas encore reçu de réponse et la demande est donc annulée.
 
Si vous souhaitez toujours transférer votre numéro vers BASE, veuillez nous contacter par téléphone à l'adresse 0486191940 ou vous rendre au point de vente le plus proche.

Cordialement,

BASE
)
clipboard := Stringfw
return
}

MailCancelBASEBusEN()
{
global
Gui, Submit, Nohide
Stringfw =
(
Information about your switch to BASE

Hello,

We tried to contact you several times recently as we need details to complete your number porting from %MSISDN% to BASE.
 
Unfortunately, we have not yet received a response to this and the request will be cancelled.
 
If you still wish to transfer your number to BASE, please contact us by phone at 0486191940 or drop by your nearest retail outlet.

Kind regards,

BASE
)
clipboard := Stringfw
return
}

; TESTCALL PREFIX

TestCalls(){
Gui, Destroy
Gui, Font, s12
Gui, Add, Text,, TESTCALL
Gui, Add, Text,, 
Gui, Add, Text,, OPERATOR
Gui, Add, DropDownList,vOperator,PROXIMUS FIX||PROXIMUS MOB|ORANGE MOB|BASE MOB|TELENET MOB
Gui, Add, Text,, MSISDN
Gui, Add, Edit, vMSISDN
Gui, Add, Button, gCopytestcall, COPY
Gui, Add, Button, gClear, CLEAR
Gui, Add, Text,,
Gui, Add, Button, gOriginTicket, BACK
Gui, Show
}

CopyTestcall()
{
global
Gui, Submit, Nohide
if (Operator = "PROXIMUS FIX")
{
prefix = 99120
}
else if (Operator = "PROXIMUS MOB")
{
prefix = 99123
}
else if (Operator = "ORANGE MOB")
{
prefix = 99122
}
else if (Operator = "BASE MOB")
{
prefix = 99121
}
else if (Operator = "TELENET MOB")
{
prefix = 99124
}

stringtestcall =
(
%prefix%%MSISDN%
)
clipboard = %stringtestcall%
return
}

; ROUTING CODES OLO

InfoOLO()
{
Gui, Destroy
Gui, Font, s10
Gui, Add, Text,, ROUTING CODES
Gui, Add, Text,, 
Gui, Add, Button, gRoutingCodeTLN, COPY TELENET: C4600
Gui, Add, Button, gRoutingCodeBASE, COPY BASE: C4800 (Voiceweb: C4899)
Gui, Add, Button, gRoutingCodeMDLN, COPY MOBILE VIKINGS: C4560
Gui, Add, Button, gRoutingCodeMOBIM, COPY ORANGE: C4900
Gui, Add, Button, gRoutingCodeBEMO, COPY PROXIMUS: C4700
Gui, Add, Button, gRoutingCodeLYCA, COPY LYCA MOBILE: C4660
Gui, Add, Button, gRoutingCodeVOO, COPY VOO: C4550
Gui, Add, Text,,
Gui, Add, Text,,-----------------
Gui, Add, Text,,
Gui, Add, Text,, CONTACT
Gui, Add, Text,, 
Gui, Add, Button, gCopyInfoTLNBASE, COPY TELENET/BASE: mnp@telenetgroup.be
Gui, Add, Button, gCopyInfoFLEET, COPY BASE FLEET: 2ndline_supporttech@telenetgroup.be
Gui, Add, Button, gCopyInfoWHOLESALE, COPY BASE WHOLESALE: wholesale.operations@telenetgroup.be
Gui, Add, Button, gCopyInfoNEXTEL, COPY BASE NEXTEL: support@telenetgroup.be
Gui, Add, Button, gCopyInfoLYCA, COPY LYCA MOBILE: mnp_desk@lycamobile.com
Gui, Add, Button, gCopyInfoMDLN, COPY MOBILE VIKINGS: number.porting@mobilevikings.be
Gui, Add, Button, gCopyInfoMOBIM, COPY ORANGE: mnpsupport@orange.be
Gui, Add, Button, gCopyInfoBEMOROUTING, COPY PROXIMUS ROUTING: BMBSMBINTEROPERATOR@proximus.net
Gui, Add, Button, gCopyInfoBEMOPORT, COPY PROXIMUS PORTING: BMBSMBMNPCUSTOMEROPERATION@proximus.net
Gui, Add, Button, gCopyInfoVOO, COPY VOO: VOO_MNP_CUCA@staff.voo.be
Gui, Add, Text,,
Gui, Add, Button, gTBOServices, BACK
Gui, Add, Button, gOriginTicket, HOME
Gui, Show
}

RoutingCodeTLN()
{
global
Gui, Submit, Nohide
Stringfw =
(
C4600
)
clipboard := Stringfw
return
}

RoutingCodeBASE()
{
global
Gui, Submit, Nohide
Stringfw =
(
C4800
)
clipboard := Stringfw
return
}

RoutingCodeMDLN()
{
global
Gui, Submit, Nohide
Stringfw =
(
C4560
)
clipboard := Stringfw
return
}

RoutingCodeMOBIM()
{
global
Gui, Submit, Nohide
Stringfw =
(
C4900
)
clipboard := Stringfw
return
}

RoutingCodeBEMO()
{
global
Gui, Submit, Nohide
Stringfw =
(
C4700
)
clipboard := Stringfw
return
}

RoutingCodeLYCA()
{
global
Gui, Submit, Nohide
Stringfw =
(
C4660
)
clipboard := Stringfw
return
}

RoutingCodeVOO()
{
global
Gui, Submit, Nohide
Stringfw =
(
C4550
)
clipboard := Stringfw
return
}

CopyInfoTLNBASE()
{
global
Gui, Submit, Nohide
Stringfw =
(
mnp@telenetgroup.be
)
clipboard := Stringfw
return
}

CopyInfoFLEET()
{
global
Gui, Submit, Nohide
Stringfw =
(
2ndline_supporttech@telenetgroup.be
)
clipboard := Stringfw
return
}

CopyInfoWHOLESALE()
{
global
Gui, Submit, Nohide
Stringfw =
(
wholesale.operations@telenetgroup.be
)
clipboard := Stringfw
return
}

CopyInfoNEXTEL()
{
global
Gui, Submit, Nohide
Stringfw =
(
support@telenetgroup.be
)
clipboard := Stringfw
return
}

CopyInfoLYCA()
{
global
Gui, Submit, Nohide
Stringfw =
(
mnp_desk@lycamobile.com
)
clipboard := Stringfw
return
}

CopyInfoMDLN()
{
global
Gui, Submit, Nohide
Stringfw =
(
number.porting@mobilevikings.be
)
clipboard := Stringfw
return
}

CopyInfoMOBIM()
{
global
Gui, Submit, Nohide
Stringfw =
(
mnpsupport@orange.be
)
clipboard := Stringfw
return
}

CopyInfoBEMOROUTING()
{
global
Gui, Submit, Nohide
Stringfw =
(
BMBSMBINTEROPERATOR@proximus.net
)
clipboard := Stringfw
return
}

CopyInfoBEMOPORT()
{
global
Gui, Submit, Nohide
Stringfw =
(
BMBSMBMNPCUSTOMEROPERATION@proximus.net
)
clipboard := Stringfw
return
}

CopyInfoVOO()
{
global
Gui, Submit, Nohide
Stringfw =
(
VOO_MNP_CUCA@staff.voo.be
)
clipboard := Stringfw
return
}

; HOTKEY INFO

HotkeyInfo()
{
Gui, Destroy
Gui, Font, s10
Gui, add, Text,, HOTKEY INFO
Gui, add, Text,, -------------------
Gui, add, Text,, 
Gui, add, Text,, Any issue's, questions or feedback related to this hotkey?
Gui, add, Text,, Contact TBO Mob: nick.debeck@telenetgroup.be
Gui, add, Text,, Contact TBO Broadband: abdul.zein.eddin@telenetgroup.be
Gui, add, Text,, 
Gui, add, Text,, -------------------
Gui, add, Text,, Mobile templates: Nick Debeck
Gui, add, Text,, Broadband templates: Abdul Zein Eddin
Gui, add, Text,, 
Gui, Add, Button, gOriginTicket, BACK
Gui, Show
}