# 📚 TIL (Today I Learned)

개발 공부와 기획 공부를 하루 단위로 기록하는 저장소.

## 🗂️ 구조
```
TIL/
├── dev/         # 개발 공부 (주제별 정리)
└── planning/    # 기획 공부 (매일/매주 트렌드 스캐닝)
```

## 💻 [dev/](./dev) — 개발 공부
| 주제 | 폴더 |
|------|------|
| 알고리즘 / 자료구조 | [Algorithm](./dev/Algorithm), [APS](./dev/APS), [Graph](./dev/Graph), [Tree](./dev/Tree) |
| Python | [python](./dev/python) |
| Django / DRF | [Django](./dev/Django), [DRF](./dev/DRF) |
| 프론트엔드 | [HTML](./dev/HTML), [Javascript](./dev/Javascript), [Vue](./dev/Vue) |
| DB / Git | [DB](./dev/DB), [GIT](./dev/GIT) |
| 기타 | [Practice](./dev/Practice), [start](./dev/start), [PJT 연습](./dev/PJTpractice.md) |

## 📈 [planning/](./planning) — 기획 공부
Product Hunt · GitHub Trending을 매일/매주 스캐닝하며 시장·기술 트렌드를 읽는 루틴.
자세한 방법은 [planning/README.md](./planning/README.md) 참고.

- 📅 [daily/](./planning/daily) — 매일 10분 스캐닝
- 🗓️ [weekly/](./planning/weekly) — 주말 30분 딥다이브

## ⚡ 오늘 기록하기
```powershell
./push-til.ps1            # 오늘자 데일리 파일 생성 + 커밋 + 푸시
./push-til.ps1 -Weekly    # 이번 주 위클리 파일 생성 + 커밋 + 푸시
```
