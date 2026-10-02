<#
.SYNOPSIS
    Installs the DevTeam skill into the platform's global skills directory.

.DESCRIPTION
    Copies (or links) `.agents/skills/dev-team` from this repository into
    `~/.agents/skills/dev-team` so the `dev-team` skill is discoverable in any workspace.

    Also copies the project rules file `.agents/rules.md` to `~/.agents/devteam-rules.md`
    as a reference the skill points at.

.PARAMETER Mode
    copy  (default) - copy the files. Simple, always works, independent of the repo.
    link            - create a directory junction/symlink so edits in the repo are live.
                      Requires Administrator or Developer Mode on Windows.

.PARAMETER Force
    Overwrite an existing installation without prompting.

.EXAMPLE
    powershell -ExecutionPolicy Bypass -File .\scripts\install.ps1
.EXAMPLE
    powershell -ExecutionPolicy Bypass -File .\scripts\install.ps1 -Mode link -Force
#>
[CmdletBinding()]
param(
    [ValidateSet('copy', 'link')]
    [string]$Mode = 'copy',

    [switch]$Force
)

$ErrorActionPreference = 'Stop'

# --- Resolve paths -----------------------------------------------------------
$repoRoot    = Split-Path -Parent $PSScriptRoot
$sourceSkill = Join-Path $repoRoot '.agents\skills\dev-team'
$sourceRules = Join-Path $repoRoot '.agents\rules.md'

$skillsHome  = Join-Path $env:USERPROFILE '.agents\skills'
$targetSkill = Join-Path $skillsHome 'dev-team'
$targetRules = Join-Path $env:USERPROFILE '.agents\devteam-rules.md'
$logPath     = Join-Path $PSScriptRoot '.install-log.txt'

function Write-Log {
    param([string]$Message)
    $line = "{0}  {1}" -f (Get-Date -Format 'yyyy-MM-dd HH:mm:ss'), $Message
    Write-Host $line
    Add-Content -Path $logPath -Value $line -Encoding UTF8
}

Write-Log "DevTeam installer starting (mode=$Mode)"

# --- Validate source ---------------------------------------------------------
if (-not (Test-Path -LiteralPath $sourceSkill)) {
    throw "Source skill not found: $sourceSkill. Run this script from the DevTeam repository."
}
if (-not (Test-Path -LiteralPath (Join-Path $sourceSkill 'SKILL.md'))) {
    throw "SKILL.md missing in $sourceSkill - the skill is incomplete."
}

# --- Ensure target home exists ----------------------------------------------
if (-not (Test-Path -LiteralPath $skillsHome)) {
    New-Item -ItemType Directory -Path $skillsHome -Force | Out-Null
    Write-Log "Created skills home: $skillsHome"
}

# --- Handle existing installation -------------------------------------------
if (Test-Path -LiteralPath $targetSkill) {
    if (-not $Force) {
        $answer = Read-Host "dev-team is already installed at $targetSkill. Overwrite? (y/N)"
        if ($answer -notmatch '^(y|yes)$') {
            Write-Log "Installation cancelled by user."
            return
        }
    }
    # Remove existing (handle junctions/links safely)
    $item = Get-Item -LiteralPath $targetSkill -Force
    if ($item.Attributes -band [IO.FileAttributes]::ReparsePoint) {
        # Remove the link itself, never recurse into it
        [System.IO.Directory]::Delete($targetSkill, $false)
    } else {
        Remove-Item -LiteralPath $targetSkill -Recurse -Force
    }
    Write-Log "Removed existing installation at $targetSkill"
}

# --- Install -----------------------------------------------------------------
if ($Mode -eq 'link') {
    try {
        New-Item -ItemType Junction -Path $targetSkill -Target $sourceSkill | Out-Null
        Write-Log "Linked (junction): $targetSkill -> $sourceSkill"
    } catch {
        Write-Log "Junction failed ($($_.Exception.Message)); falling back to symlink."
        try {
            New-Item -ItemType SymbolicLink -Path $targetSkill -Target $sourceSkill | Out-Null
            Write-Log "Linked (symlink): $targetSkill -> $sourceSkill"
        } catch {
            Write-Log "Link unavailable ($($_.Exception.Message)); falling back to copy."
            Copy-Item -LiteralPath $sourceSkill -Destination $targetSkill -Recurse -Force
            Write-Log "Copied skill to: $targetSkill"
        }
    }
} else {
    Copy-Item -LiteralPath $sourceSkill -Destination $targetSkill -Recurse -Force
    Write-Log "Copied skill to: $targetSkill"
}

# --- Reference rules file ----------------------------------------------------
if (Test-Path -LiteralPath $sourceRules) {
    Copy-Item -LiteralPath $sourceRules -Destination $targetRules -Force
    Write-Log "Copied rules to: $targetRules"
}

# --- Verify ------------------------------------------------------------------
$checkFiles = @(
    'SKILL.md',
    'agents\team-leader.md',
    'agents\planner-researcher.md',
    'agents\frontend-developer.md',
    'agents\backend-developer.md',
    'agents\qa-tester.md',
    'agents\penetration-tester.md',
    'agents\legal-agent.md',
    'agents\multimedia-agent.md',
    'reference\workflow.md',
    'reference\standards.md',
    'reference\skill-evolution.md',
    'reference\orchestration-tools.md',
    'reference\handoff-protocol.md',
    'reference\documentation-contract.md',
    'reference\industry-baselines.md'
)

$missing = @()
foreach ($rel in $checkFiles) {
    $p = Join-Path $targetSkill $rel
    if (-not (Test-Path -LiteralPath $p)) { $missing += $rel }
}

if ($missing.Count -gt 0) {
    Write-Log "WARNING: installation incomplete. Missing: $($missing -join ', ')"
    exit 1
}

Write-Log "Verified $($checkFiles.Count) core files present."
Write-Log "Installation complete."
Write-Host ""
Write-Host "DevTeam installed. Invoke with:" -ForegroundColor Green
Write-Host "    /dev-team <your request>" -ForegroundColor Cyan
Write-Host "  or just describe the system you want built." -ForegroundColor Green
