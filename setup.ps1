param(
    [Parameter(Mandatory = $true)]
    [string]$TargetProject,

    [switch]$Force
)

$ErrorActionPreference = "Stop"

$sourceFolder = Join-Path $PSScriptRoot ".github"
$targetProject = (Resolve-Path -LiteralPath $TargetProject -ErrorAction Stop).ProviderPath
$targetFolder = Join-Path $targetProject ".github"

if (-not (Test-Path -LiteralPath $sourceFolder -PathType Container)) {
    throw "Could not find the setup folder at '$sourceFolder'."
}

if (-not (Test-Path -LiteralPath $targetFolder -PathType Container)) {
    New-Item -ItemType Directory -Path $targetFolder | Out-Null
}

$files = Get-ChildItem -LiteralPath $sourceFolder -Recurse -File
$copied = 0
$skipped = 0

foreach ($file in $files) {
    $relativePath = $file.FullName.Substring($sourceFolder.Length).TrimStart('\', '/')
    $destination = Join-Path $targetFolder $relativePath
    $destinationDirectory = Split-Path -Parent $destination

    if (-not (Test-Path -LiteralPath $destinationDirectory -PathType Container)) {
        New-Item -ItemType Directory -Path $destinationDirectory | Out-Null
    }

    if ((Test-Path -LiteralPath $destination -PathType Leaf) -and -not $Force) {
        Write-Warning "Skipped existing file: $relativePath"
        $skipped++
        continue
    }

    Copy-Item -LiteralPath $file.FullName -Destination $destination -Force
    Write-Host "Copied: $relativePath"
    $copied++
}

Write-Host ""
Write-Host "Setup complete."
Write-Host "Copied $copied file(s); skipped $skipped existing file(s)."
Write-Host "Open '$targetProject' in VS Code, open Copilot Chat, and run /project-baseline."
