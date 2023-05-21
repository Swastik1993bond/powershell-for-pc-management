## Powershell-for-pc-management : 
 Scripts created for reduce manual effort for your PC/Server operation
 
# Prerequisite:
To run the PowerShell scripts ,you need the following prerequisites:

1. **PowerShell:** Ensure that PowerShell is installed on your system. PowerShell comes pre-installed on most Windows operating systems. You can check the version of PowerShell installed by opening a PowerShell prompt and running the command: $PSVersionTable.PSVersion. It is recommended to have PowerShell version 5.1 or above.
2. By default, PowerShell restricts running scripts for security reasons. To allow script execution, you need to change the execution policy. Run the following command:
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
```
This will set the execution policy to allow running local scripts that are signed.
Note: If you encounter any issues related to the execution policy, you can bypass it temporarily by running the script with the -ExecutionPolicy Bypass parameter:
```powershell
powershell -ExecutionPolicy Bypass -File .\FileArrangement.ps1
```
Make sure to replace FileArrangement.ps1 with the actual name of your script if it differs.
## Scripts:
1. **FileArrangement.ps1 :** Decorate files and arrange based on the extension [.pdf, .xlx, .jpg and many]

How to use: 
when you execute the script using the command powershell -File FileArrangement.ps1  it will prompt you to provide the parent & the destination directory. The script will create the destination folders and move the files to a similar directory structure within the parent directory.
## Promt will look like this:
![image](https://github.com/Swastik1993bond/powershell-for-pc-management/assets/84220333/b443937c-9b0f-4017-9f5f-357e8c47ef0f)
## After run
![image](https://github.com/Swastik1993bond/powershell-for-pc-management/assets/84220333/0ecc7bc9-f03a-4721-86ab-671dc02fa374)


