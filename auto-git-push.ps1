# 자동 커밋 및 푸시 스크립트 (PowerShell)
git add .
$datetime = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
git commit -m "Auto-commit: $datetime"
git push
