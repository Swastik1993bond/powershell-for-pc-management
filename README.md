## powershell-for-pc-management

By default, PowerShell restricts running scripts for security reasons. To allow script execution, you need to change the execution policy. Run the following command:
```powershell
// Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
```

This will set the execution policy to allow running local scripts that are signed.

1. FileArrangement.ps1 : Decorate files and arrange based on the extension [.pdf, .xlx, .jpg and many]

How to use: 
when you execute the script using the command powershell -File FileArrangement.ps1  it will prompt you to provide the parent & the destination directory. The script will create the destination folders and move the files to a similar directory structure within the parent directory.
## Promt will look like this:
![image](https://github.com/Swastik1993bond/powershell-for-pc-management/assets/84220333/b443937c-9b0f-4017-9f5f-357e8c47ef0f)
## After run
![image](https://github.com/Swastik1993bond/powershell-for-pc-management/assets/84220333/0ecc7bc9-f03a-4721-86ab-671dc02fa374)


