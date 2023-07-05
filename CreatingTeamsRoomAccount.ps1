# You can Skip any modules you already have installed, 
# I have found that on some new build PC's i have needed to run the extra comands

#### OPTIONAL #####
# Skip publicsher check 
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12 
Install-Module PowerShellGet -RequiredVersion 2.2.4 -SkipPublisherCheck

#### OPTIONAL #####
# Install Nuget
Install-PackageProvider -Name nuget -MinimumVersion 2.8.5.201 -force

#### OPTIONAL #####
# Install PnP.PowerShell with version 1.12.0 
Install-Module -Name "PnP.PowerShell" -RequiredVersion 1.12.0 -Force -AllowClobber

#If you are connecting to Azure AD / Azure Resource Manager from your Windows PC for the first time, you must first run the following PowerShell commands (as Administrator):
Install-Module -Name AzureAD
Install-Module -Name Az -MinimumVersion 3.0.0 -AllowClobber -Scope AllUsers

# Install Modules requried 
Set-ExecutionPolicy RemoteSigned
Install-Module PowershellGet -Force
Update-Module PowershellGet
Install-Module -Name MSOnline –Force
import-Module MSOnline
Install-Module -Name ExchangeOnlineManagement
Import-Module ExchangeOnlineManagement
install-module AzureADPreview

# Connect to M365 and Exchange Online with your Tenant Admin Account
$UserCredential = Get-Credential
Connect-MsolService -Credential $UserCredential
Connect-ExchangeOnline -Credential $UserCredential -ShowProgress $true


#Get the Meeting Room License SKU and nake sure to set it in the variables in the next step $license="xyz"
Get-MsolAccountSku

#Set the variables for Meeting Room account
$newRoom="MTR-Demo@testit.vc"
$name="MTR-Demo"
$pwd="yourpassword"
$license="testitvideo:MTR_PREM"
$location="AU"

# Create a mailbbox resource

New-Mailbox -MicrosoftOnlineServicesID $newRoom -Name $name -Room -RoomMailboxPassword (ConvertTo-SecureString -String $pwd -AsPlainText -Force) -EnableRoomMailboxAccount $true
Start-Sleep -Seconds 31
Set-MsolUser -UserPrincipalName $newRoom -PasswordNeverExpires $true -UsageLocation $location
Set-MsolUserLicense -UserPrincipalName $newRoom -AddLicenses $license
Set-Mailbox -Identity $newRoom -MailTip “This room is equipped to support MS Teams Meetings”
Set-CalendarProcessing -Identity $newRoom -AutomateProcessing AutoAccept -AddOrganizerToSubject $false -ProcessExternalMeetingMessages $True -RemovePrivateProperty $false -DeleteComments $false -DeleteSubject $false -AddAdditionalResponse $true -AdditionalResponse “Your meeting is now scheduled and if it was enabled as a Teams Meeting will provide a seamless click-to-join experience from the conference room.”


#Connect to MS Online to set password to never expires

Connect-MsolService -Credential $UserCredential
Set-MsolUser -UserPrincipalName $newRoom -PasswordNeverExpires $true
Get-MsolUser -UserPrincipalName $newRoom | Select PasswordNeverExpires
