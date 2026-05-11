param (
    [Parameter(Mandatory=$true)]
    [Alias("n")]
    [string]$ProjectName
)

# Define the base Projects directory
$ProjectsDir = "$HOME\Projects"

# Ensure the Projects directory exists
if (-not (Test-Path $ProjectsDir)) {
    New-Item -ItemType Directory -Path $ProjectsDir | Out-Null
}

$NewProjectPath = Join-Path $ProjectsDir $ProjectName

# Create the specific project folder
if (Test-Path $NewProjectPath) {
    Write-Host "Error: Project '$ProjectName' already exists!" -ForegroundColor Red
} else {
    New-Item -ItemType Directory -Path $NewProjectPath | Out-Null
    Write-Host "Successfully created project: $ProjectName" -ForegroundColor Green
    Write-Host "Path: $NewProjectPath" -ForegroundColor Gray
}
