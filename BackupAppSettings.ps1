param(
    [string]$sourceDirectory = "C:\Dev",
    [string]$targetDirectory = ".\Backups"
)

# Validate and prompt for sourceDirectory if it's not provided
if ([string]::IsNullOrWhiteSpace($sourceDirectory)) {
    $sourceDirectory = Read-Host -Prompt "Please enter the source directory"
}

# Validate and prompt for targetDirectory if it's not provided
if ([string]::IsNullOrWhiteSpace($targetDirectory)) {
    $targetDirectory = Read-Host -Prompt "Please enter the target directory"
}

# Create the target directory if it doesn't exist
if (-not (Test-Path -Path $targetDirectory)) {
    New-Item -ItemType Directory -Path $targetDirectory
}

# Find and copy the files, excluding 'bin' and 'obj' directories
Get-ChildItem -Path $sourceDirectory -Filter "appsettings.*.json" -Recurse -Exclude 'bin', 'obj' | ForEach-Object {
    $sourceFile = $_
    if ($sourceFile.DirectoryName -notmatch '\\bin\\' -and $sourceFile.DirectoryName -notmatch '\\obj\\') {
        $subPath = $sourceFile.DirectoryName.Replace($sourceDirectory, '').TrimStart('\')
        $prefix = if ($subPath -ne '') { $subPath.Replace('\', '_') + '_' } else { '' }
        $targetFile = Join-Path $targetDirectory ($prefix + $sourceFile.Name)

        Copy-Item -Path $sourceFile.FullName -Destination $targetFile

        # Log the file copy action
        Write-Host "`'$($sourceFile.Name)`' in `'$($sourceFile.DirectoryName)`' --> `'$targetDirectory`'"
    }
}

Write-Host "Files copied successfully to $targetDirectory"

Start-Process $targetDirectory
