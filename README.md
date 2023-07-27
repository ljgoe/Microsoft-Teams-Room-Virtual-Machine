## Use the powershell script to create an MTR mailbox from Powershell

### 1. Copy the powershell script [CreatingTeamsRoomAccount.ps1](https://github.com/ljgoe/MS-Teams-room-creation/blob/main/CreatingTeamsRoomAccount.ps1)

XYZ











## Troubleshooting

Remember to Run this from powershell X64 as administrator 

![powershell_X64](https://github.com/ljgoe/MS-Teams-room-creation/blob/main/Images/Images/Powershell_X64.png)

If you dont you may face an error like this:  
```
import-Module : Could not load file or assembly 'file:///C:\Program Files\WindowsPowerShell\Modules\MSOnline\1.1.183.66\Microsoft.Online.Administration.Automation.PSModule.dll' or one of 
its dependencies. An attempt was made to load a program with an incorrect format.
```
![error](https://github.com/ljgoe/MS-Teams-room-creation/blob/main/Images/Images/Powershell_error.png)

## Create a Virtual Microsoft Teams Room for Lab purposes

Full instructions are on my website: [techblogwiki](https://techblogwiki.azurewebsites.net/index.php/knowledge-base/microsoft-teams-room-creation/)

Prerequisites:
- Windows VM running winodws 11
- Office 365 tennant with administration rights
- Microsoft teams Pro or Basic licence
- Access to the windows 11 Image
