# Claude Code 전역 설정 복원 (Windows / PowerShell)
# 사용법: 새 PC에서 이 저장소를 clone 한 뒤 폴더 안에서 실행
#   git clone <repo-url> claude-dotfiles
#   cd claude-dotfiles
#   ./restore.ps1

$ErrorActionPreference = "Stop"
$claudeDir = Join-Path $env:USERPROFILE ".claude"
$src = Join-Path $PSScriptRoot "settings.json"
$dst = Join-Path $claudeDir "settings.json"

if (-not (Test-Path $claudeDir)) { New-Item -ItemType Directory -Path $claudeDir | Out-Null }

# 기존 설정 백업
if (Test-Path $dst) {
    $backup = "$dst.bak"
    Copy-Item $dst $backup -Force
    Write-Host "기존 settings.json 백업: $backup"
}

Copy-Item $src $dst -Force
Write-Host "settings.json 복원 완료 -> $dst"
Write-Host ""
Write-Host "이제 claude 를 실행하면 settings.json의 enabledPlugins/extraKnownMarketplaces 기준으로"
Write-Host "플러그인(bkit, bkit-starter, context7, karpathy-skills)이 자동 설치됩니다."
Write-Host "자동 설치가 안 되면 claude 안에서 아래를 수동 실행하세요:"
Write-Host "  /plugin marketplace add popup-studio-ai/bkit-claude-code"
Write-Host "  /plugin marketplace add forrestchang/andrej-karpathy-skills"
Write-Host "  /plugin install bkit@bkit-marketplace"
Write-Host "  /plugin install bkit-starter@bkit-marketplace"
Write-Host "  /plugin install andrej-karpathy-skills@karpathy-skills"
