param (
    [Parameter(Mandatory = $true)]
    [string]$ParentDirectory,

    [Parameter(Mandatory = $true)]
    [string]$DestinationDirectory
)

$extensions = @(".jpeg", ".jpg", ".doc", ".docx", ".pdf", ".ppt", ".xlsx", ".png", ".exe", ".txt", ".epub", ".gif", ".csv", ".mp4", ".rtf", ".pem", ".rar", ".xml", ".xls", ".cbr", ".ps1", ".mkv", ".svg", ".rdp", ".torrent")


$destinationFolderMapping = @{
    ".jpeg" = "Images\JPEG"
    ".jpg" = "Images\JPG"
    ".doc" = "Personal-Documents\DOC"
    ".docx" = "Personal-Documents\DOCX"
    ".pdf" = "Personal-Documents\PDF"
    ".ppt" = "Personal-Documents\PPT"
    ".xlsx" = "Spreadsheets\XLSX"
    ".png" = "Images\PNG"
    ".exe" = "Software-Executables"
    ".txt" = "Personal-Documents\Text-Files"
    ".epub" = "Book-EPUB-Files"
    ".gif" = "Images\GIF"
    ".csv" = "Spreadsheets\CSV"
    ".mp4" = "Video-Files\MP4"
    ".rtf" = "Personal-Documents\Text-Files"
    ".pem" = "Software-Executables-Files"
    ".rar" = "ZIP-FILES\RAR"
    ".xml" = "Software-Executables-Files"
    ".xls" = "Spreadsheets\XLS"
    ".cbr" = "CBR"
    ".ps1" = "PowerShell-Scripts"
    ".mkv" = "Video-Files\MKV"
    ".svg" = "Images\SVG"
    ".rdp" = "RDP"
    ".torrent" = "Torrent-Files"
}

# Create the destination folders if they don't exist
$destinationFolderMapping.Values | ForEach-Object {
    $destination = Join-Path -Path $ParentDirectory -ChildPath $_
    if (-not (Test-Path $destination)) {
        New-Item -ItemType Directory -Path $destination | Out-Null
    }
}

# Get all files with the specified extensions in the parent directory
$files = Get-ChildItem -Path $ParentDirectory -File | Where-Object { $extensions -contains $_.Extension.ToLower() }

# Output the list of files and their corresponding destination folders
$files | ForEach-Object {
    $extension = $_.Extension.ToLower()
    $destinationSubFolder = $destinationFolderMapping[$extension]
    $destination = Join-Path -Path $ParentDirectory -ChildPath $destinationSubFolder
    $destinationSimilar = Join-Path -Path $DestinationDirectory -ChildPath $destinationSubFolder
    "Moving file: $($_.Name) to $destinationSimilar"
}

# Uncomment the lines below to actually move the files
 $files | ForEach-Object {
     $extension = $_.Extension.ToLower()
     $destinationSubFolder = $destinationFolderMapping[$extension]
    $destination = Join-Path -Path $ParentDirectory -ChildPath $destinationSubFolder
     $destinationSimilar = Join-Path -Path $DestinationDirectory -ChildPath $destinationSubFolder
   Move-Item -Path $_.FullName -Destination $destinationSimilar
     Write-Host "Moved file: $($_.Name) to $destinationSimilar"
 }
