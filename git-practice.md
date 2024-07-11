# 목차
- [목차](#목차)
- [git 활용](#git-활용)

# git 활용

1. git 활성화
   ```bash
   git init
   ```
2. git 연결 repository
   ```bash
   git init remote -v  # 현재 repo 연결 상태
   git remote add origin remote_url
    # origin <- 지정별칭, 아무거나 초기 지정 후 사용
    # remote_url <- github 저장할 repo url
   ```
3. git 활용 현 상태 파악
   ```bash
   git status # 변동 사항 파악
   git log --oneline # git commit 상태 파악
   ```

4. git version
   ```bash
   git add . # 현 상황 전체 변동사항 추가
   git commit -m 파일 이름
   ```

