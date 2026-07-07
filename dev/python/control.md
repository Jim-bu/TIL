- [function](#control-of-flow)
  - [조건문](#조건문-conditional-statement)
  - [반복문](#반복문-loop-statement)
  - [enumerate-&-append](#참고_enumerate--append)
  - [실습](#실습)

# Control of flow

### 제어문 `Control Statement`
- 코드의 실행 흐름(기본은 항상 위에서 아래)을 제어하는 데 사용되는 구문<br>
- <span style='color:red;'>조건</span>에 따라 코드 블록을 실행하거나 <span style='color:red;'>반복</span>적으로 코드를 실행 

### 제어문 종류
- 조건문
    - `if`, `elif`, `else`
- 반복문
    - `for`, `while`
- 반복문 제어
    - `break`, `continue`, `pass`


#### 조건문 `Conditional Statement`
- 주어진 조건식을 평가하여 해당 조건이 참(True)인 경우에만 <br>
코드 블록을 실행하거나 건너뜀

### `‘if’` statement
- if statement의 기본 구조

    ```python
    if 표현식:
        코드 블록
    elif 표현식:
        코드 블록
    else:
        코드 블록
    ```

#### 복수 조건문
- 조건식을 동시에 검사하는 것이 아니라 순차적으로 비교 

    ```python
    dust = 35
    
    if dust > 150:
        print('매우 나쁨')
    elif dust > 80:
        print('나쁨')
    elif dust > 30:
        print('보통')
    else:
        print('좋음')
    ```
#### 중첩 조건문

```python
dust = 480

if dust > 150:
    print('매우 나쁨')
    """
    중첩 조건문
    """
    if dust > 300:
        print('위험해요! 나가지 마세요!')
elif dust > 80:
    print('나쁨')
elif dust > 30:
    print('보통')
else:
    print('좋음')      # 결과 :  매우 나쁨
                       #        위험해요! 나가지 마세요!
```

## 반복문

#### 반복문 `Loop Statement`
- 주어진 코드 블록을 여러 번 반복해서 실행하는 구문
1. 특정 작업을 반복적으로 수행
2. 주어진 조건이 참인 동안 반복해서 실행

### `‘for’` statement
- 임의의 시퀀스의 항목들을 그 시퀀스에 들어있는 순서대로 반복
- for statement의 기본 구조

    ```python
    for 변수 in 반복 가능한 객체:
        코드 블록
    ```

#### 반복 가능한 객체 `iterable`
- 반복문에서 순회할 수 있는 객체<br>
(시퀀스 객체 뿐만 아니라 dict, set 등도 포함)

#### for 문 원리
- 리스트 내 첫 항목이 반복 변수에 할당되고 코드블록이 실행
- 다음으로 반복 변수에 리스트의 2번째 항목이 할당되고 코드블록이 다시 실행
- ... 마지막으로 반복 변수에 리스트의 마지막 요소가 할당되고 코드블록이 실행

    ```python
    items = ['apple', 'banana', 'coconut']
    
    for item in items:
        print(item)
    
    """
    apple
    banana
    coconut
    """
    ``` 

#### 문자열 순회 
```python
country = 'Korea'  # 문자열도 sequence

for char in country:
    print(char)

"""
K
o
r
e
a
"""
```

#### range 순회
```python
for i in range(5):
    print(i)

"""
0
1
2
3
4
"""
```

#### dict 순회
```python
my_dict = {
    'x': 10,
    'y': 20,
    'z': 30,
}

for key in my_dict:
    print(key)   # 딕셔너리를 기본 루프를 돌리면 key가 나옴
    print(my_dict[key])  # value를 뽑아내는 출력문


"""
x
10
y
20
z
30
"""
```

#### 인덱스로 리스트 순회
- 리스트의 요소가 아닌 인덱스로 접근하여 해당 요소들을 변경하기
    
    ```python
    numbers = [4, 6, 10, -8, 5]
    
    for i in range(len(numbers)):
        numbers[i] = numbers[i] * 2
    
    print(numbers) # [8, 12, 20, -16, 10]
    ```

#### 중첩된 반복문(이중 for문)
- 안쪽 반복문은 outers 리스트의 각 항목에 대해 한 번씩 실행됨
- print가 호출되는 횟수 => `len(outers) * len(inners)`
    ```python
    outers = ['A', 'B']
    inners = ['c', 'd']
        
    for outer in outers:
        for inner in inners:
            print(outer, inner)
        
    """
    A c
    A d
    B c
    B d
    """
    ```

    #### 중첩 리스트 순회
- 안쪽 리스트 요소에 접근하려면 바깥 리스트를 순회하면서 중첩 반복을 사용해 각 안쪽 반복을 순회
    ```python
    elements = [['A', 'B'], ['c', 'd']]

    for elem in elements:
        print(elem)

    """
    ['A', 'B']
    ['c', 'd']
    """
    ```
    ```python
    elements = [['A', 'B'], ['c', 'd']]

    for elem in elements:
        for item in elem:
            print(item)

    """
    A
    B
    c
    d
    """
    ```

### ‘while’ statement
- 주어진 조건식이 참(True)인 동안 코드를 반복해서 실행 == 조건식이 거짓(False)가 될 때 까지 반복
- while statement의 기본 구조

    ```python
    while 조건식:
        코드 블록
    ```

#### while 반복문 예시
```python
a = 0

while a < 3:
    print(a)
    a += 1

print('끝')

"""
0
1 
2 
끝
"""
```

#### 사용자 입력에 따른 반복
- while문을 사용한 특정 입력 값에 대한 종료 조건 활용하기
    
    ```python
    number = int(input('양의 정수를 입력해주세요.: '))

    while number <= 0:
        if number < 0:
            print('음수를 입력했습니다.')
        else:
            print('0은 양의 정수가 아닙니다.')

        number = int(input('양의 정수를 입력해주세요.: '))

    print('잘했습니다!')
    """
    양의 정수를 입력해주세요.: 0
    0은 양의 정수가 아닙니다.  
    양의 정수를 입력해주세요.: -1
    음수를 입력했습니다.       
    양의 정수를 입력해주세요.: 1
    잘했습니다!
    """
    ```

    #### 적절한 반복문 활용하기
- `for`
    - 반복 횟수가 명확하게 정해져 있는 경우에 유용
    - 예를 들어 리스트, 튜플, 문자열 등과 같은 시퀀스 형식의 데이터를 처리할 때 

- `while`
    - 반복 횟수가 불명확하거나 조건에 따라 반복을 종료해야 할 때 유용
    - 예를 들어 사용자의 입력을 받아서 특정 조건이 충족될 때까지 반복하는 경우


### 반복 제어
- for문과 while은 매 반복마다 본문 내 모든 코드를 실행하지만<br>
때때로 일부만 실행하는 것이 필요할 때가 있음

#### 반복문 제어 키워드
- `break`
  - 반복을 즉시 중지
- `continue`
  - 다음 반복으로 건너뜀
- `pass`
  - 아무런 동작도 수행하지 않고 넘어감


#### 반복문 제어 예시

```python
# break

for i in range(10):
    if i == 5:
        break
    print(i)  # 0 1 2 3 4
```

```python
# continue

for i in range(10):
    if i % 2 == 0:
        continue
    print(i)  # 1 3 5 7 9
```

```python
# pass

for i in range(10):
    pass  # 아무 작업도 안함
```

#### break 예시
- 리스트에서 첫번째 짝수만 찾은 후 반복 종료하기

    ```python
    numbers = [1, 3, 5, 6, 7, 9, 10, 11]
    found_even = False

    for num in numbers:
        if num % 2 == 0:
            print('첫 번째 짝수를 찾았습니다:', num)
            found_even = True
            break

    if not found_even:
        print('짝수를 찾지 못했습니다')

    """
    첫 번째 짝수를 찾았습니다: 6
    """
    ```

#### pass 예시
1. 코드 작성 중 미완성 부분
    - 구현해야 할 부분이 나중에 추가될 수 있고, 코드를 컴파일하는 동안 오류가 발생하지 않음
      ```python
      def my_function():
          pass  
      ```
2. 조건문에서 아무런 동작을 수행하지 않아야 할 때
    ```python
    if condition:
        pass  # 아무런 동작도 수행하지 않음
    else:
        # 다른 동작 수행
    ```
3. 무한 루프에서 조건이 충족되지 않을 때 pass를 사용하여 루프를 계속 진행하는 방법
    ```python
    while True:
        if condition:
            break
        elif condition:
            pass  # 루프 계속 진행
        else:
            print('..')
    ```


### List Comprehension
- 간결하고 효율적인 리스트 생성 방법
#### List Comprehension 사용 전/후 비교

- 사용 전
    ```python
    numbers = [1, 2, 3, 4, 5]
    squared_numbers = []

    for num in numbers:
        squared_numbers.append(num**2)

    print(squared_numbers)  # [1, 4, 9, 16, 25]
    ```

- 사용 후
    ```python
    numbers = [1, 2, 3, 4, 5]
    squared_numbers = [num**2 for num in numbers]

    print(squared_numbers)  # [1, 4, 9, 16, 25]
    ```

#### List Comprehension 활용 예시
- 2차원 배열 생성 시 (인접행렬 생성 시)

```python
data1 = [[0] * (5) for _ in range(5)]

# 또는
data2 = [[0 for _ in range(5)] for _ in range(5)]

"""
[[0, 0, 0, 0, 0],
 [0, 0, 0, 0, 0],
 [0, 0, 0, 0, 0],
 [0, 0, 0, 0, 0],
 [0, 0, 0, 0, 0]]
"""
```
#### 가독성 비교

- Comprehension 사용
    
    ```python
    result = [i for i in range(10) if i % 2 == 1]
    ```
- Comprehension 미사용
    
    ```python
    result = []
    for i in range(10):
        if i % 2 == 1:
            result.append(i)
    ```

### 참고_enumerate / append
#### `enumerate(iterable, start=0) `
- iterable 객체의 각 요소에 대해 인덱스와 함께 반환하는 내장함수
#### enumerate 예시

```python
fruits = ['apple', 'banana', 'cherry']

for index, fruit in enumerate(fruits):
print(f'인덱스 {index}: {fruit}')

"""
인덱스 0: apple
인덱스 1: banana
인덱스 2: cherry
"""
```

#### 파이썬 append 함수로 리스트 끝에 요소 추가하기
 
```bash
파이썬의 append() 함수는 리스트의 끝에 새로운 요소를 추가하는 함수. 

다양한 상황에서 활용할 수 있으므로, 파이썬을 배우는 과정에서 잘 익혀두는 것이 좋습니다.

 
```
#### append() 함수를 사용하는 몇 가지 상황
```bash
로그 데이터를 기록하는 경우: 로그 데이터를 기록할 때마다 append() 함수를 사용하여 로그 데이터를 리스트에 추가할 수 있다.
장바구니를 구현하는 경우: 장바구니에 상품을 추가할 때마다 append() 함수를 사용하여 상품을 리스트에 추가할 수 있다.
메모를 작성하는 경우: 메모를 추가할 때마다 append() 함수를 사용하여 메모를 리스트에 추가할 수 있다.
```

```python
# E.G.
# 리스트 생성
list = [1, 2, 3]

# 리스트 끝에 요소 추가
list.append(4)

# 리스트 출력
print(list)
```

#### 실습
```python
black_list = [
    'Hoeger LLC',
    'Keebler LLC',
    'Yost and Sons',
    'Johns Group',
    'Romaguera-Crona',
]


import requests
from pprint import pprint

dummy_data = []
for i in range(1,11):
    API_URL = f'https://jsonplaceholder.typicode.com/users/{i}' 
    response = requests.get(API_URL)
    parsed_data = response.json()

    user_info = {}
    user_info['name'] = parsed_data['name']
    user_info['lat'] = parsed_data['address']['geo']['lat']
    user_info['lng'] = parsed_data['address']['geo']['lng']
    user_info['company'] = parsed_data['company']['name']

    if -80 < float(user_info['lat']) < 80:
        if -80 < float(user_info['lng']) < 80:
            dummy_data.append(user_info)


def censorship(k, v):
    if k in black_list:
        print(f'{k} 소속의 {v} 은/는 등록할 수 없습니다.')
        return False
    else:
        print(f'이상 없습니다.')
        return True


def create_user(user_info):
    
    
    censored_user_list = {}
    for i in range(len(user_info)):
        k= user_info[i]['company']
        v= user_info[i]['name']
        if censorship(k, v) == True:
            censored_user_list[k] = [v]
    return censored_user_list


    
  
print(create_user(dummy_data))
```
```python
food_list = [
    {
        '종류': '한식',
        '이름': '잡채'
    },
    {
        '종류': '채소',
        '이름': '토마토'
    },
    {
        '종류': '중식',
        '이름': '자장면'
    },
]

# 아래에 코드를 작성하시오.
for food in food_list:
    if food['이름'] == '토마토':
        food['종류'] = '과일'
    elif food['이름'] == '자장면':
        print('자장면엔 고춧가루지')
    print(f'{food["이름"]} 은/는 {food["종류"]} (이)다.')
print(food_list)

food = 0
while food < len(food_list):
        if food_list[food]['이름'] == '토마토':
            food_list[food]['종류'] = '과일'
        elif food_list[food]['이름'] == '자장면':
            print('자장면엔 고춧가루지')

        print(f'{food_list[food]["이름"]} 은/는 {food_list[food]["종류"]} (이)다.')
        food += 1
print(food_list)

```
```python
matrix = [
        ['0, 1', '0, 2', '0, 3'], 
        ['1, 0', '1, 1', '1, 2', '1, 3'], 
        ['2, 0', '2, 1', '2, 2', '2, 3', '2, 4'], 
        ['3, 0', '3, 1'], 
        ['4, 0', '4, 1', '4, 2'], 
        ['5, 0']
    ]
# 아래애 코드를 작성하시오.

matrix_len = 0
for i in matrix:
    matrix_len += 1
print(matrix_len)    
for number in matrix:
    temporary_len = 0
    for i in range(matrix_len):
        temporary_len += 1
    print(f'{number} 리스트는 {temporary_len}개 만큼 요소를 가지고 있습니다.')




for x in range(len(matrix)):
    for y in range(len(matrix[x])):
        
        print(f'matrix의 {x}, {y} 번째 요소의 값은 {matrix[x][y]}입니다.')

```