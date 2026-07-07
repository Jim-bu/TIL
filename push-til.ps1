<#
.SYNOPSIS
  오늘자 데일리(또는 이번 주 위클리) 기획 파일을 템플릿에서 생성하고 커밋·푸시한다.
.EXAMPLE
  ./push-til.ps1            # 오늘자 daily 파일 생성 + 커밋 + 푸시
  ./push-til.ps1 -Weekly    # 이번 주 weekly 파일 생성 + 커밋 + 푸시
  ./push-til.ps1 -NoPush    # 커밋만 하고 푸시는 생략
#>
param(
    [switch]$Weekly,
    [switch]$NoPush,
    [switch]$CreateOnly   # 파일만 생성하고 git(커밋/푸시)은 건너뜀 — 자동 스케줄러용
)

$ErrorActionPreference = 'Stop'
$root = $PSScriptRoot
Set-Location $root

$now = Get-Date

function New-FromTemplate($templatePath, $targetPath, $replacements) {
    if (Test-Path $targetPath) {
        Write-Host "이미 존재함: $targetPath" -ForegroundColor Yellow
        return $false
    }
    New-Item -ItemType Directory -Force -Path (Split-Path $targetPath) | Out-Null
    $content = Get-Content $templatePath -Raw -Encoding UTF8
    foreach ($k in $replacements.Keys) {
        $content = $content.Replace($k, $replacements[$k])
    }
    Set-Content -Path $targetPath -Value $content -Encoding UTF8 -NoNewline
    Write-Host "생성됨: $targetPath" -ForegroundColor Green
    return $true
}

if ($Weekly) {
    # ISO 8601 주차 계산
    $cal = [System.Globalization.CultureInfo]::InvariantCulture.Calendar
    $day = $cal.GetDayOfWeek($now)
    $target = $now
    if ($day -ne [System.DayOfWeek]::Monday) {
        $target = $now.AddDays(3 - [int](($day + 6) % 7))  # 목요일 기준(ISO)
    }
    $week = $cal.GetWeekOfYear($target, [System.Globalization.CalendarWeekRule]::FirstFourDayWeek, [System.DayOfWeek]::Monday)
    $isoYear = $target.Year
    $weekStr = "{0:D2}" -f $week
    # 주의 월~일 범위
    $offset = [int](($day + 6) % 7)
    $monday = $now.AddDays(-$offset)
    $sunday = $monday.AddDays(6)
    $range = "{0:yyyy-MM-dd} ~ {1:yyyy-MM-dd}" -f $monday, $sunday

    $targetPath = Join-Path $root "planning/weekly/$isoYear-W$weekStr.md"
    $repl = @{ '{{YEAR}}' = "$isoYear"; '{{WEEK}}' = $weekStr; '{{RANGE}}' = $range }
    New-FromTemplate (Join-Path $root 'planning/templates/weekly-template.md') $targetPath $repl | Out-Null
    $commitMsg = "planning(weekly): $isoYear-W$weekStr 딥다이브"
}
else {
    $dateStr = $now.ToString('yyyy-MM-dd')
    $dayStr  = $now.ToString('ddd', [System.Globalization.CultureInfo]::InvariantCulture)
    $targetPath = Join-Path $root ("planning/daily/{0}/{1}/{2}.md" -f $now.ToString('yyyy'), $now.ToString('MM'), $dateStr)
    $repl = @{ '{{DATE}}' = $dateStr; '{{DAY}}' = $dayStr }
    New-FromTemplate (Join-Path $root 'planning/templates/daily-template.md') $targetPath $repl | Out-Null
    $commitMsg = "planning(daily): $dateStr 스캐닝"
}

if ($CreateOnly) {
    Write-Host "CreateOnly 모드: 파일만 생성하고 종료합니다." -ForegroundColor Cyan
    exit 0
}

git add -A
$staged = git diff --cached --name-only
if (-not $staged) {
    Write-Host "커밋할 변경사항이 없습니다." -ForegroundColor Yellow
    exit 0
}
git commit -m $commitMsg
Write-Host "커밋 완료: $commitMsg" -ForegroundColor Green

if (-not $NoPush) {
    git push
    Write-Host "푸시 완료." -ForegroundColor Green
}

