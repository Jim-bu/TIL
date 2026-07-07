# 📈 Planning — 기획 공부 (시야 확장 루틴)

Product Hunt와 GitHub Trending을 매일/매주 스캐닝하며 **시장 수요·기술 트렌드**를 읽고,
기획 감각과 기술 시야를 동시에 넓히기 위한 기록 공간.

- 🔗 [Product Hunt](https://www.producthunt.com/) — 전 세계 신규 서비스 런칭·투표 플랫폼
- 🔗 [GitHub Trending](https://github.com/trending) — 실시간 인기 오픈소스 트렌드

## 📁 구조
```
planning/
├── daily/YYYY/MM/YYYY-MM-DD.md   # 매일 10분 스캐닝
├── weekly/YYYY-Www.md            # 주말 30분 딥다이브
└── templates/                    # 데일리·위클리 템플릿
```

## 🧭 시야를 밝히는 3단계 전략

### [1단계] Tech → Product (기술에서 기획으로)
GitHub Trending에서 갑자기 스타가 폭발한 라이브러리/도구를 먼저 본다.
→ *"이 기술로 일반 사용자용 어떤 서비스를 만들 수 있을까?"* 상상하고,
→ Product Hunt에서 이를 발 빠르게 상용화한 팀이 있는지 찾는다.

### [2단계] Product → Tech (기획에서 기술로)
Product Hunt 1위 서비스를 발견하면
→ *"어떤 기술 스택으로 만들었을까? 서버 비용은 어떻게 아낄까?"* 의문을 갖고,
→ GitHub·구글링으로 기반 오픈소스/아키텍처를 역추적한다.

### [3단계] 데일리/위클리 루틴
| 주기 | 시간 | 할 일 |
|------|------|-------|
| **매일 아침** | 10분 | PH Daily Top 5 + GitHub Trending Today 훑기 → `daily/` 기록 |
| **주말** | 30분 | 주간 Top 제품·프로젝트 딥다이브 → `weekly/` 리포트 |

## ⚡ 빠른 사용법
```powershell
# 오늘자 데일리 파일 생성 + 커밋 + 푸시
./push-til.ps1

# 이번 주 위클리 파일 생성 + 커밋 + 푸시
./push-til.ps1 -Weekly
```
