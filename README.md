
## Create a Virtual Microsoft Teams Room for Lab purposes

Full instructions are on my website: [techblogwiki](https://techblogwiki.azurewebsites.net/index.php/knowledge-base/microsoft-teams-room-creation/)

This describes how to build a MTR for lab purposes. 

Prerequisites:
- Windows VM running winodws 11
- Office 365 tennant with administration rights
- Microsoft teams Pro or Basic licence
- Access to the windows 11 Image with these exact specs
```
  Major release: 22H2 (Win 11)
     Name in VLSC: Windows 11, version 22H2 (updated Sept 2022) x64
     Size (bytes): 5440065536
     SHA256: 768A49D9DDB9997E427094D317329E113E6ABE74DBB5707B4AAEB8270ADC6925
```
To install a virtual MTR do the following


- Install Windows 11
- Download the [CreateSrsMedia.ps1](https://go.microsoft.com/fwlink/?linkid=867842) script.
- Run powershell as Admin
- To allow running scripts, execute command
```
  powershell -executionpolicy unrestricted
```
- Run script
```
  C:\teams> .\CreateSrsMedia.ps1
```
- What type of customer are you, OEM or Enterprise: 
```
  Enterprise
```

- Please indicate what drivers you wish to use with this installation.
```
  [ 0] Logitech SmartDock
  [ 1] Crestron SR
  [ 2] Polycom MSR
  [ 3] Lenovo Hub 500
  [ 4] LRS
  [ 5] HP Slice 2.0
  [ 6] Crestron Flex
  [ 7] HP Presence Mini Conferencing PC
  [ 8] None

  Selection: 8
```

- Please enter the path to the Windows install ISO file: 
```
  "C:\teams\ISO\windows11.iso"
```
The following output shows
```

  Creating UEFI-compatible media.

  Using SRSv2 kit:       C:\teams\SRSDeploymentKit-4.17.51.0.msi
  Using driver packs:
  Using Windows ISO:     C:\teams\ISO\windows11.iso
  ISO mounted at:        G:
  Using language packs:
  Using updates:
  Writing stick:         Lexar USB Flash Drive

  Formatting and partitioning the target drive... done.
  Copying Windows... done.
  Copying the installation image... done.
  Splitting the installation image... done.
  Injecting drivers... done.
  Copying Rigel build... done.
  Configuring unattend files... done.
  Selecting image... done.
  Cleaning up... done.

```
## Build
Once the scripts have run you will have the media required to build the MTR. 

Create a new Virtual machine and boot it from teh USB with the build which was created in the previous steps

## Intune 
Usefull links to deply to Intune

- [Bulk enroll into intune](https://learn.microsoft.com/en-us/mem/intune/enrollment/windows-bulk-enroll)
- [Enrolling Microsoft Teams Rooms on Windows devices with Microsoft Endpoint Manager](https://techcommunity.microsoft.com/t5/intune-customer-success/enrolling-microsoft-teams-rooms-on-windows-devices-with/ba-p/3246986)
- [Guide site](https://blog.mindcore.dk/2022/04/how-to-enroll-microsoft-teams-rooms/)


## Sample Output from Running MTR script to build MTR MEdia 

```
PS C:\teams> .\CreateSrsMedia.ps1
This script is running on OS build 10.0.22621.1848
Script version 1.8.1
Downloading CreateSrsMedia... done
Validating signature for update.ps1... success.


What type of customer are you?
OEM or Enterprise: Enterprise

Please make sure you have all of the following available:

1. A USB drive with sufficient space (16GB+)
2. Windows 10 Enterprise media that matches your SRSv2 deployment kit.
  
   The correct media for this release has the following characteristics:

     Major release: 22H2 (Win 11)
     Name in VLSC: Windows 11, version 22H2 (updated Sept 2022) x64
     Size (bytes): 5440065536
     SHA256: 768A49D9DDB9997E427094D317329E113E6ABE74DBB5707B4AAEB8270ADC6925

   You must supply an ISO that matches the exact characteristics above.
   

Please do not continue until you have all these items in order.

Found deployment kit already downloaded.
Validating signature for SRSDeploymentKit-4.17.51.0.msi... success.
Extracting the deployment kit... done.

Please indicate what drivers you wish to use with this installation.
[ 0] Logitech SmartDock
[ 1] Crestron SR
[ 2] Polycom MSR
[ 3] Lenovo Hub 500
[ 4] LRS
[ 5] HP Slice 2.0
[ 6] Crestron Flex
[ 7] HP Presence Mini Conferencing PC
[ 8] None
Selection: 8
Selected option 8.

WARNING: Generating an image that will not pre-install drivers, by explicit request.
   Enterprise customers can access Windows 10 Enterprise media from the Volume Licensing Service Center:
   http://www.microsoft.com/licensing/servicecenter

   The correct media for this release has the following characteristics:

     Major release: 22H2 (Win 11)
     Name in VLSC: Windows 11, version 22H2 (updated Sept 2022) x64
     Size (bytes): 5440065536
     SHA256: 768A49D9DDB9997E427094D317329E113E6ABE74DBB5707B4AAEB8270ADC6925

   You must supply an ISO that matches the exact characteristics above.

Identifying language packs...
... done identifying language packs.

Reminder: all data on the drive you select will be lost!

[ 0] Lexar JumpDrive)
Please select a target drive: 0
Selected option 0.

Please enter the path to the Windows install ISO file: "C:\teams\ISO\Win11.iso"

```


## Related

Here are some related projects

[Awesome README](https://github.com/matiassingers/awesome-readme)

