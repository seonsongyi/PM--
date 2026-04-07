# 파일 변경 감지 후 자동 커밋/푸시 PowerShell 스크립트
# 실행: powershell -ExecutionPolicy Bypass -File ./auto-git-push-watch.ps1

$folder = Split-Path -Parent $MyInvocation.MyCommand.Definition
Write-Host "감시 시작: $folder"

while ($true) {
    $before = Get-ChildItem -Recurse -File $folder | Get-FileHash
    Start-Sleep -Seconds 2
    $after = Get-ChildItem -Recurse -File $folder | Get-FileHash
    if (-not (Compare-Object $before $after)) {
        continue
    }
    Write-Host "변경 감지! 자동 커밋/푸시 실행..."
    git add .
    $datetime = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    git commit -m "Auto-commit: $datetime"
    git push
    Write-Host "커밋/푸시 완료. 계속 감시 중..."
    Start-Sleep -Seconds 2
}