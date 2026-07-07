<#
.SYNOPSIS
  TIL 기획 데일리/위클리 md 파일을 자동 생성하는 Windows 작업 스케줄러 작업을 등록한다.
  ※ 한 번만 실행하면 됨. 이후에는 매일/매주 자동 동작.

  실행 방법:
    1) 시작 메뉴 > "PowerShell" 우클릭 > "관리자 권한으로 실행" (또는 일반 실행도 가능)
    2) 아래 명령 붙여넣기:
         cd C:\Users\korea\Desktop\TIL
         powershell -ExecutionPolicy Bypass -File .\register-schedule.ps1

  제거하려면:
    Unregister-ScheduledTask -TaskName "TIL-Daily-Planning","TIL-Weekly-Planning" -Confirm:$false
#>

$ErrorActionPreference = 'Stop'
$script = Join-Path $PSScriptRoot 'push-til.ps1'
if (-not (Test-Path $script)) { throw "push-til.ps1 을 찾을 수 없습니다: $script" }

# 컴퓨터가 꺼져 시간을 놓쳤으면 다음에 켰을 때 실행 (StartWhenAvailable)
$settings  = New-ScheduledTaskSettingsSet -StartWhenAvailable -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries
$principal = New-ScheduledTaskPrincipal -UserId "$env:USERDOMAIN\$env:USERNAME" -LogonType Interactive -RunLevel Limited

# --- 데일리: 매일 오전 10시 ---
$dAction  = New-ScheduledTaskAction -Execute 'powershell.exe' `
    -Argument ('-NoProfile -ExecutionPolicy Bypass -File "{0}" -CreateOnly' -f $script)
$dTrigger = New-ScheduledTaskTrigger -Daily -At 10:00am
Register-ScheduledTask -TaskName 'TIL-Daily-Planning' -Action $dAction -Trigger $dTrigger `
    -Settings $settings -Principal $principal `
    -Description '매일 10시 기획 데일리 스캐닝 md 파일 자동 생성' -Force | Out-Null
Write-Host '[OK] TIL-Daily-Planning 등록 (매일 10:00)' -ForegroundColor Green

# --- 위클리: 매주 금요일 오전 10시 ---
$wAction  = New-ScheduledTaskAction -Execute 'powershell.exe' `
    -Argument ('-NoProfile -ExecutionPolicy Bypass -File "{0}" -Weekly -CreateOnly' -f $script)
$wTrigger = New-ScheduledTaskTrigger -Weekly -DaysOfWeek Friday -At 10:00am
Register-ScheduledTask -TaskName 'TIL-Weekly-Planning' -Action $wAction -Trigger $wTrigger `
    -Settings $settings -Principal $principal `
    -Description '매주 금요일 10시 기획 위클리 딥다이브 md 파일 자동 생성' -Force | Out-Null
Write-Host '[OK] TIL-Weekly-Planning 등록 (매주 금요일 10:00)' -ForegroundColor Green

Write-Host ''
Get-ScheduledTask -TaskName 'TIL-*' | ForEach-Object {
    $i = $_ | Get-ScheduledTaskInfo
    '{0,-22} 상태:{1,-8} 다음 실행:{2}' -f $_.TaskName, $_.State, $i.NextRunTime
}

