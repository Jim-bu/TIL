# while문의 종료조건은 해석하기론 '~일 때 while문을 지속한다'로 생각한다.

## 구간합_슬라이싱
```python
## 구간합 사용
T = int(input())
for tc in range(1, T+1):
    s = str(input())
    a = str(input())
    len_s = len(s)
    len_a = len(a)
    for i in range(len_a - len_s + 1):
        if a[i:i+len_s] == s:
            ans = 1
            break # 일치하는 문자열 찾으면 for문 종료
        else:
            ans = 0
    print(f'#{tc} {ans}')


```

## 약수 구하기
```python
n = int(input())

divisors = []
for i in range(1, n + 1):
    if n % i == 0:
        divisors.append(i)
print(*divisors)

# for 문을 이용해 범위를 약수가 될 수 있는 최솟값인 1부터 최댓값인 자기 자신까지 돌려준다.
# 만약, 나머지가 0이라면 약수라는 뜻이므로 배열에 저장해준다.
# 이 방법을 사용할 경우 작은 수부터 i가 들어가므로 자동으로 오름차순 정렬이 된다.
# 시간 복잡도 : O(N)
```
```python
# 문자열을 숫자로 바꾸기 _ ascii 코드 사용
s = input()
for i in s:
    print(ord(i)-64, end = ' ')
```


## 풍선팡 _swea 풍선팡 123 전부 풀고 마무리
```python
T = int(input())
for tc in range(1, T + 1):
    N, M = map(int, input().split())
    arr = [list(map(int, input().split())) for _ in range(N)]

    di = [0, 1, 0, -1]
    dj = [1, 0, -1, 0]  # 4방위로 돌면서 추가되는 인덱스값에 대한 배열
    max_v = 0
    for i in range(N):
        for j in range(M):  # N*N 배열의 모든 원소에 대해
            s = arr[i][j]   # 자기자신을 가지고 시작(중복 방지)
                            # i, j 원소의 4방향 원소에 대해
            for k in range(4):
                ni = i + di[k]
                nj = j + dj[k]
                if 0 <= ni < N and 0 <= nj < M:
                    s += arr[ni][nj]  # 실존하는 인접 원소 ni, nj
            if max_v < s:
                max_v = s
    print(f'#{tc} {max_v}')

```
## 달팽이
```python
T = int(input())
# 방향 벡터를 정의 우 하 좌 상
dr = [0, 1, 0, -1]
dc = [1, 0, -1, 0]

for tc in range(1, T + 1):
    n = int(input())
    snail = [[0] * n for _ in range(n)]  # n x n 크기의 행렬을 0으로 초기화합니다.
    r = c = 0  # 시작 위치 (0, 0)
    d = 0  # 시작 방향을 오른쪽(0)

    # 1부터 n*n까지.
    for i in range(1, n * n + 1):
        snail[r][c] = i
        nr, nc = r + dr[d], c + dc[d]  # 다음 위치를 계산.

        # 다음 위치가 범위를 벗어나거나 이미 값이 채워져 있는 경우
        if nr < 0 or nr >= n or nc < 0 or nc >= n or snail[nr][nc] != 0:
            d = (d + 1) % 4  # 방향을 전환합니다.
            nr, nc = r + dr[d], c + dc[d]  # 전환된 방향으로 다음 위치를 다시 계산

        r, c = nr, nc  # 다음 위치로 이동

    print(f"#{tc}")
    for row in snail:
        print(*row)
```
## 사다리게임
```python
T = 10
for test_case in range(1, T + 1):
    N = int(input())
    arr = [list(map(int, input().split()))for _ in range(100)]

    # 숫자 2에서 시작해서
    # 위로 올라가기 때문에 i에 따라 -1씩 움직이는 과정
    # while, i ==0 : 종료지점은 첫 줄에 도착했을 경우

    # 만약 이동 중 자리 j-1이나 j+1에 1이 있다면, 그 곳으로 간다.
    # 또한, 지나간 자리를 0으로 바꾸며 올라간다.
    # 최종적으로 추출할 것은 i==0일때의, j 값.
    result = 0
    for j in range(100):
        i = 99
        if arr[99][j] == 2:
            while i >= 0:
                if i == 0:
                    result = j
                    i -= 1
                elif j-1 >= 0 and arr[i][j-1] == 1:
                    arr[i][j] = 0
                    j -= 1
                elif j+1 < 100 and arr[i][j + 1] == 1:
                    arr[i][j] = 0
                    j += 1
                elif arr[i-1][j] == 1:
                    arr[i][j] = 0
                    i -= 1

    print(f'#{test_case} {result}')
    # 간다 : 인덱스의 변화를 준다
    # 간 자리를 0으로 바꾸거나 값을 없앤다
    # if j+1
# T = 10
# for test_case in range(1, T + 1):
#     N = int(input())
#     arr = [list(map(int, input().split())) for _ in range(100)]
#
#     # 숫자 2의 위치 찾기
#     for j in range(100):
#         if arr[99][j] == 2:
#             i = 99
#             while i > 0:
#                 if j > 0 and arr[i][j - 1] == 1:  # 왼쪽으로 이동
#                     while j > 0 and arr[i][j - 1] == 1:
#                         j -= 1
#                 elif j < 99 and arr[i][j + 1] == 1:  # 오른쪽으로 이동
#                     while j < 99 and arr[i][j + 1] == 1:
#                         j += 1
#                 i -= 1  # 위로 이동
#             print(f'#{test_case} {j}')

```
## 값 교체하기(인덱스)
```python
# 인덱싱으로 값 교체하기
a = list(input())
arr_a = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'

# 인덱스 값을 추출해서
# 그 인덱스를 출력한다.
arr = [0]*26
for i in range(len(a)):
    for j in range(len(arr)):
        if a[i] == arr_a[j]:
            arr[i] = j +1
print(*arr)

```
## 선택정렬
```python
# 선택정렬
T = int(input())
for tc in range(1, T+1):
    arr = list(map(int, input().split()))
    # 선택정렬 후 인덱스 0번 출력
    for i in range(9): # 마지막 인덱스 제외
        max_idx = i
        for j in range(i+1, 10):
            if arr[max_idx] < arr[j]:
                max_idx = j
        arr[i], arr[max_idx] = arr[max_idx], arr[i]

    print(f'#{tc} {arr[0]}')

# 선택 정렬은 처음 마지막 인덱스를 제외하고 전체 arr를 순회한다. 마지막 인덱스를 제외하는 이유는 
# 다음 for문을 통해 인덱스의 시작 위치를 하나씩 증가시킬 때 범위에 대한 오류가 나지 않게 하기 위함
# max나 min 값을 i로 지정
# for i+1,n 하나 오른쪽으로 움직인 지점에서 끝까지 최대 인덱스값을 추출 후
# 자리 변환
```
## 버블정렬
```python
# 버블 정렬
for i in range(N-1, 0, -1):# 각 구간의 끝 인덱스 i
    for j in range(0, i): # 각 구간에서 두 개씩 비교할 때 왼쪽 원소의 인덱스 j
        if arr[j] > arr[j + 1]:
            arr[j], arr[j + 1] = arr[j + 1], arr[j]  # 왼쪽 원소가 더 크면 교환
print(*arr)
```
## 대각선의 합
```python

    # 대각선의 합 중 최댓값
    sum_o = 0
    sum_s = 0
    for i in range(n):
        sum_o += arr[i][i]  # 주대각선 합 i==j
        sum_s += arr[i][n - 1 - i]  # 부대각선 합 j == n-1-i
```

## 색칠하기
```python
T = int(input())
for tc in range(1, T + 1):
    N = int(input())
    arr = [[0]*10 for _ in range(10)]



    for item in range(N):
        r1, r2, b1, b2, color = map(int, input().split())

        for i in range(r1, b1 +1):
            for j in range(r2, b2+1):
                arr[i][j] += color

    count = 0
    for i in range(len(arr)):
        for j in range(len(arr)):
            if arr[i][j] == 3:
                count += 1

            # 색칠하기 - input을 for 문 안에서 받아서 arr[i][j]에 += color
            # arr[i][j]가 3이면 count += 1
    print(f'#{tc} {count}')
```

## 파리 퇴치
```python
# MxM이 가장 큰 값을 추출하여 그 값들의 합을 구함
# 부분집합 전체 NxN의 행렬에서 모든 MxM의 합들을 비교해서 가장 큰 값 추출
## NxN의 모든 부분집합 중에서 값이 MxM이면, 반환

# 0,0 3,3 합 - 1열과 1행 0,0을 더해준다.
# 2,2~ 3,3의 합

# [0, 1, 1, 0]
# [ ]
# sum_a = 0
# i,j
# arr[ni] = list(map)
T = int(input())

for tc in range(1, T + 1):
    N, M = map(int, input().split())
    arr = [list(map(int, input().split())) for _ in range(N)]

    max_s = 0
    for i in range(N-M + 1):
        for j in range(N-M +1):
            s = 0
            for k in range(M):
                for l in range(M):
                    s += arr[i + k][j + l]
            if max_s < s:
                max_s = s

    print(f'#{tc} {max_s}')
```

## 이진탐색 _ 전제 조건 :정렬
```python
T = int(input())
for tc in range(1, T+1):
    p, pa, pb = map(int, input().split())

    # 각각 A와 B에 대해 한 번씩 이진 탐색의 경우를 사용
    # A에 대한 경우
    start_a = 1
    end_a = p
    count_a = 0
    while start_a <= end_a:
        c = int((start_a + end_a) / 2)
        if pa == c:
            break
        elif c > pa:
            end_a = c
        else:
            start_a = c
        count_a += 1
    # B에 대한 경우
    start_b = 1
    end_b = p
    count_b = 0
    while start_b <= end_b:
        c = int((start_b + end_b) / 2)
        if pb == c:
            break
        elif c > pb:
            end_b = c
        else:
            start_b = c
        count_b += 1

    if count_a > count_b:
        result = 'B'
    elif count_a < count_b:
        result = 'A'
    else:
        result = '0'

    print(f'#{tc} {result}')
```
## 전기버스
```python
T = int(input())

for test_case in range(1, T + 1):
    K, N, M = map(int, input().split())
    charging_arr = list(map(int, input().split()))

    # while문을 돌릴 상수 생성 loc = 0
    # while문 루프 loc < N-K:
    # for range(K, 0, -1)
    # if 충전소가 있어:
    # count += 1
    # break
    # for문 밖에서 if arr[i] - arr[i-1] > K:
    # count =0
    #    break
    stop = [0]*(N)
    for x in charging_arr:
        stop[x] += 1
        # 출발 위치 초기화
        loc = 0
        result = 0
        while loc < N-K:
            # 충전소를 찾기 위해 역순으로 탐색
            # 충전소 간 거리가 K보다 큰 경우 탐색을 중지하고 count를 0으로 설정
            count = 0
            for i in range(K, 0, -1):
                if stop[loc + i] >= 1:
                    count += 1
                    loc += i
                    result += 1
                    break
            if count == 0:
                result = 0
                break


    print(f'#{test_case} {result}')
```