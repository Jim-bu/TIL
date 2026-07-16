# 📡 Tech Radar — 기술 트렌드 스캐닝

4개 소스를 매일/매주 스캐닝하며 **제품 → 기술 → 인프라 → 비즈니스**를 잇는 기술 레이더.
"무엇이 뜨는가"를 넘어 *아키텍처 추정 · 소스코드 패턴 · 기업 간 연결(M&A·채택)* 까지 파고든다.

## 🔗 소스
| 소스 | 보는 것 |
|------|---------|
| [Product Hunt](https://www.producthunt.com/) | 신규 서비스 — 기술스택 역공학 |
| [GitHub Trending](https://github.com/trending) | 인기 오픈소스 — 엔지니어링 딥다이브 |
| [CNCF Blog](https://www.cncf.io/blog/) | 클라우드 네이티브 **인프라** 트렌드 |
| [The New Stack](https://thenewstack.io/) | 플랫폼·엔터프라이즈 **비즈니스** 신호(M&A·거버넌스) |

## 📁 구조
```
tech-radar/
├── daily/YYYY/MM/YYYY-MM-DD.md   # 매일 기술 스캔
├── weekly/YYYY-Www.md            # 주간 딥다이브
└── templates/                    # 데일리·위클리 템플릿
```

## 🧭 분석 3축

### 🔵 Tech → Product (기술에서 서비스로)
GitHub에서 뜬 기술로 만들 서비스를 상상 → Product Hunt에서 상용화 사례를 잇는다.

### 🟢 Product → Tech (서비스에서 기술로)
Product Hunt 상위 제품의 기술 스택/아키텍처를 역추적 → GitHub·인프라 트렌드와 잇는다.

### 🟣 Tech → Business (기술에서 비즈니스로)
CNCF·The New Stack의 인프라·산업 신호로 **기업 채택·제휴·인수(M&A)·거버넌스** 흐름을 읽는다.
"어떤 기술이 어떤 시장 구조·해자로 이어지는가"를 본다.

## 🗓️ 데일리 구조
```
1. 오늘의 아키텍처 패러다임
2. 🚀 Product Hunt — Tech Stack 추정
3. 🔥 GitHub Trending — Engineering Deep Dive
4. 🏗️ Infrastructure & Industry Signals (CNCF · The New Stack)
5. 🔵 Tech → Product
6. 🟢 Product → Tech
7. 🟣 Tech → Business
8. 💡 Deep Dive — 오늘의 인사이트 (개념 / 프로덕트 / 기획력 / 비즈니스)
```
