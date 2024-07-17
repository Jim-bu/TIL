- [function](#-function)
  - [패킹 & 언패킹](#-패킹-&-언패킹)
  - [실습 문제](#-실습)
  
# function
## 함수 `Functions`
### 개요
- 특정 작업을 수행하기 위한 재사용 가능한 코드 묶음
#### 함수를 사용하는 이유 
- 두 수의 합을 구하는 함수를 정의하고 사용함으로써 코드의 중복을 방지
- <span style='color:red;'>재사용성</span>이 높아지고, 코드의 <span style='color:red;'>가독성과 유지보수성</span> 향상

    ```python
    # 두 수의 합을 구하는 코드
    num1 = 5
    num2 = 3

    sum_result = num1 + num2
    print(sum_result)
    ```
    
    ```python
    # 두 수의 합을 구하는 함수
    def get_sum(num1, num2):
        return num1 + num2

    # 함수 사용하여 결과 출력
    num1 = 5
    num2 = 3
    sum_result = get_sum(num1, num2)
    print(sum_result)
    ```

    ### 함수의 구조
#### 함수 구조 
![image](https://github.com/ragu6963/TIL/assets/32388270/fe4bb4a9-f88d-43f8-9e6e-915e3c790b48)

#### 함수의 정의와 호출 1
- 함수 정의(정의)
    - 함수 정의는 `def` 키워드로 시작
    - def 키워드 이후 함수 이름 작성
    - 괄호안에 매개변수를 정의할 수 있음
    - 매개변수(parameter)는 함수에 전달되는 값을 나타냄

    ```python
    # 함수 정의
    def greet(name):
        """입력된 이름(name) 값에
        인사를 하는 메세지('Hello, ')를 만드는 함수
        """
        message = 'Hello, ' + name
        return message

    # 함수 호출 및 반환 값 할당
    result = greet('Alice')
    print(result)
    ```

    #### 함수의 정의와 호출 2
- 함수 body
    - 콜론(`:`) 다음에 들여쓰기 된 코드 블록
    - 함수가 실행 될 때 수행되는 코드를 정의
    - Docstring은 함수 body 앞에 선택적으로 작성 가능한 함수 설명서
    ![image](https://github.com/ragu6963/TIL/assets/32388270/71898c0f-abee-4946-9b19-9083d0d8c4e7)

    #### 함수의 정의와 호출 3
- 함수 반환 값
    - 함수는 필요한 경우 결과를 반환할 수 있음
    - `return` 키워드 이후에 반환할 값을 명시
    - `return` 문은 함수의 실행을 종료하고, 결과를 호출 부분으로 반환
    ![image](https://github.com/ragu6963/TIL/assets/32388270/9b0cadc1-aeb7-4bf9-a9fe-e8d13f06717f)

- return None 을 통해서 결과값 없이 종료할 수 있음.


#### 함수의 정의와 호출 4
- 함수 호출
    - 함수를 사용하기 위해서는 호출이 필요
    - 함수의 이름과 소괄호를 활용해 호출
    - 필요한 경우 인자(argument)를 전달해야 함
    - 호출 부분에서 전달된 인자는 함수 정의 시 작성한 매개변수에 대입됨
    ![image](https://github.com/ragu6963/TIL/assets/32388270/01253ed5-3ab6-40c5-bfd8-04ca0c2ae01d)

### 함수 호출 (function call)
- 함수를 실행하기 위해 함수의 이름을 사용하여 해당 함수의 코드 블록을 실행하는 것
```python
function_name(arguments)
```

## 매개변수와 인자
### 매개변수와 인자
#### 매개변수 `parameter`
- 함수를 정의할 때, 함수가 받을 값을 나타내는 변수

#### 인자 `argument`
- 함수를 호출할 때, 실제로 전달되는 값

#### 매개변수와 인자 예시
```python
def add_numbers(x, y): # x와 y는 매개변수(parameter)
    result = x + y
    return result


a = 2
b = 3
sum_result = add_numbers(a, b) # a와 b는 인자(argument)
print(sum_result)
```

### 다양한 인자 종류 ## 중요!
1. 위치 인자
2. 기본 인자 값
3. 키워드 인자
4. 임의의 인자 목록
5. 임의의 키워드 인자 목록

#### Positional Arguments (위치인자)
- 함수 호출 시 인자의 위치에 따라 전달되는 인자
- <span style='color:crimson;'>위치인자는 함수 호출 시 반드시 값을 전달해야 함</span>

    ```python
    def greet(name, age):
        print(f'안녕하세요, {name}님! {age}살이시군요.')


    greet('Alice', 25) # 안녕하세요, Alice님! 25살이시군요
    greet('Alice')      # TypeError: greet() missing 1 required positional argument: 'age'
    greet(20, 'Alice')  # 위치인자는 반드시 값을 전달해야 한다.
    ```

    #### Default Argument Values (기본 인자 값)
- 함수 정의에서 매개변수에 기본 값을 할당하는 것
- 함수 호출 시 인자를 전달하지 않으면, 기본값이 매개변수에 할당됨

    ```python
    def greet(name, age=30):
        print(f'안녕하세요, {name}님! {age}살이시군요.')


    greet('Bob') # 안녕하세요, Bob님! 30살이시군요.
    greet('Charlie', 40) # 안녕하세요, Charlie님! 40살이시군요.
    ```

    ####  Keyword Arguments (키워드 인자)
- 함수 호출 시 인자의 이름과 함께 값을 전달하는 인자
- 매개변수와 인자를 일치시키지 않고, 특정 매개변수에 값을 할당할 수 있음
- 인자의 순서는 중요하지 않으며, 인자의 이름을 명시하여 전달
- <span style='color:crimson;'>단, 호출 시 키워드 인자는 위치 인자 뒤에 위치해야 함</span>

    ```python
    def greet(name, age):
        print(f'안녕하세요, {name}님! {age}살이시군요.')


    greet(name='Dave', age=35)  # 안녕하세요, Dave님! 35살이시군요.
    greet(age=35, 'Dave')  #  positional argument follows keyword argument
                           #  위치인자인 'Dave'가 키워드인자인 'age= ' 보다 먼저 나왔어야 함.
    greet(age=35, name='Dave') # 둘 다 키워드 인자일 경우 순서가 달라도 실행 된다.
    ```

    #### Arbitrary Argument Lists (임의의 인자 목록)
- 정해지지 않은 개수의 인자를 처리하는 인자
- 함수 정의 시 매개변수 앞에 <span style='color:red;'>`‘*’`</span>를 붙여 사용하며, 여러 개의 인자를 tuple로 처리

    ```python
    def calculate_sum(*args):
        print(args)
        total = sum(args)
        print(f'합계: {total}')


    """
    (1, 2, 3)
    합계: 6
    """
    calculate_sum(1, 2, 3)
    ```


#### Arbitrary Keyword Argument Lists (임의의 키워드 인자 목록)
- 정해지지 않은 개수의 키워드 인자를 처리하는 인자
- 함수 정의 시 매개변수 앞에 <span style='color:red;'>`‘**’`</span>를 붙여 사용하며, <br>여러 개의 인자를 dictionary로 묶어 처리

    ```python
    def print_info(**kwargs):
        print(kwargs)


    print_info(name='Eve', age=30) # {'name': 'Eve', 'age': 30}
    ```

    #### 함수 인자 권장 작성순서
- 위치 -> 기본 -> 가변 -> 가변 키워드
- 호출 시 인자를 전달하는 과정에서 혼란을 줄일 수 있도록 함
- <span style='color:crimson;'>단, 모든 상황에 적용되는 절대적인 규칙은 아니며, 상황에 따라 유연하게 조정될 수 있음</span>

    ```python
    def func(pos1, pos2, default_arg='default', *args, **kwargs):
        # ...
    ```

##### 인자의 모든 종류를 적용한 예시
```python
def func(pos1, pos2, default_arg='default', *args, **kwargs):
    print('pos1:', pos1)
    print('pos2:', pos2)
    print('default_arg:', default_arg)
    print('args:', args)
    print('kwargs:', kwargs)

func(1, 2, 3, 4, 5, 6, key1='value1', key2='value2')

"""
pos1: 1
pos2: 2
default_arg: 3
args: (4, 5, 6)
kwargs: {'key1': 'value1', 'key2': 'value2'}
"""
```

## 재귀 함수
### 재귀 함수
- 함수 내부에서 자기 자신을 호출하는 함수

#### 재귀 함수 예시 (팩토리얼)
```python
𝑛!
𝑛 ∗ (𝑛−1)!
𝑛 ∗ (𝑛−1) ∗ (𝑛−2)!
…
```
- factorial 함수는 자기 자신을 재귀적으로 호출하여 입력된 숫자 n의 팩토리얼을 계산
- 재귀 호출은 n이 0이 될 때까지 반복되며, 종료 조건을 설정하여 재귀 호출이 멈추도록 함
- 재귀 호출의 결과를 이용하여 문제를 작은 단위의 문제로 분할하고, 분할된 문제들의 결과를 조합하여 최종 결과를 도출
```python
def factorial(n):
    # 종료 조건: n이 0이면 1을 반환
    if n == 0:
        return 1
    else:
        # 재귀 호출: n과 n-1의 팩토리얼을 곱한 결과를 반환
        return n * factorial(n - 1)
# 팩토리얼 계산 예시
print(factorial(5))  # 120
```

----

#### 재귀 함수 특징
- 특정 알고리즘 식을 표현할 때 변수의 사용이 줄어들며, 코드의 가독성이 높아짐
- 1개 이상의 base case(종료되는 상황)가 존재하고, 수렴하도록 작성

#### 재귀 함수를 사용하는 이유
- 문제의 자연스러운 표현
  - 복잡한 문제를 간결하고 직관적으로 표현 가능

- 코드 간결성
  - 상황에 따라 반복문보다 알고리즘 코드가 더 간결하고 명확해질 수 있음

- 수학적 문제 해결
  - 수학적 정의가 재귀적으로 표현되는 경우, 직접적인 구현 가능

#### 재귀 함수 활용 시 기억해야 할 것
1. 종료 조건을 명확히
2. 반복되는 호출이 종료 조건을 향하도록


## 내장 함수 Built-in function
### 내장 함수 <-> 외장함수는 따로 명명 없이 function으로 부름
- 파이썬이 기본적으로 제공하는 함수 (별도의 import 없이 바로 사용 가능)

```python
# 자주 사용되는 내장 함수 예시
numbers = [1, 2, 3, 4, 5]

print(len(numbers))  # 5
print(max(numbers))  # 5
print(min(numbers))  # 1
print(sum(numbers))  # 15
print(sorted(numbers, reverse=True))  # [5, 4, 3, 2, 1]
```

### 유용한 내장 함수 map & zip
#### `map(function, iterable)`
- 순회 가능한 데이터구조(iterable)_반복 가능한 객체(collection)의 모든 요소에 함수를 적용하고, 그 결과를 map object로 반환
```python
numbers = [1, 2, 3]
result = map(str, numbers)

print(result)  # <map object at 0x00000239C915D760>
print(list(result))  # ['1', '2', '3']
```
##### `map()` 활용
- SWEA 문제의 input 처럼 문자열 `'1 2 3'`이 입력 되었을 때 활용 예시

```python
numbers1 = input().split() # input() >> '1,2,3' // split() >> ['1','2','3']
print(numbers1)  # ['1', '2,', '3']

numbers2 = list(map(int, input().split()))
print(numbers2)  # [1, 2, 3]
```
#### `zip(*iterable)`
- 임의의 iterable을 모아 튜플을 원소로 하는 zip object를 반환

    ```python
    girls = ['jane', 'ashley']
    boys = ['peter', 'jay']
    pair = zip(girls, boys)

    print(pair)  # <zip object at 0x000001C76DE58700>
    print(list(pair))  # [('jane', 'peter'), ('ashley', 'jay')]
    ```

##### `zip()` 활용
- 여러 개의 리스트를 동시에 조회할 때

    ```python
    kr_scores = [10, 20, 30, 50]
    math_scores = [20, 40, 50, 70]
    en_scores = [40, 20, 30, 50]

    for student_scores in zip(kr_scores, math_scores, en_scores):
        print(student_scores)

    """
    (10, 20, 40)
    (20, 40, 20)
    (30, 50, 30)
    (50, 70, 50)
    """
    ```
- 2차원 리스트의 같은 컬럼(열) 요소를 동시에 조회할 때

    ```python
    scores = [
        [10, 20, 30],
        [40, 50, 39],
        [20, 40, 50],
    ]

    for score in zip(*scores):
        print(score)

    """
    (10, 40, 20)
    (20, 50, 40)
    (30, 39, 50)
    """
    ```

    ## 함수와 Scope
### Python의 범위(Scope)
- 함수는 코드 내부에 `local scope`를 생성하며, 그 외의 공간인 `global scope`로 구분

### 범위와 변수 관계
- scope
    - global scope : 코드 어디에서든 참조할 수 있는 공간
    - local scope : 함수가 만든 scope (함수 내부에서만 참조 가능)
- variable 
    - global variable : global scope에 정의된 변수
    - local variable : local scope에 정의된 변수
    - 
#### 변수 수명주기(lifecycle)
- 변수의 수명주기는 변수가 선언되는 위치와 스코프에 따라 결정됨
1. built-in scope
    - 파이썬이 실행된 이후부터 영원히 유지
2. global scope
    - 모듈이 호출된 시점 이후 혹은 인터프리터가 끝날 때까지 유지
3. local scope
    - 함수가 호출될 때 생성되고, 함수가 종료될 때까지 유지

#### 이름 검색 규칙(Name Resolution) # 중요
- 파이썬에서 사용되는 이름(식별자)들은 특정한 이름공간(namespace)에 저장되어 있음
- 아래와 같은 순서로 이름을 찾아 나가며, LEGB Rule(각 영역 앞글자를 따서)이라고 부름
    1. Local scope : 지역 범위(현재 작업 중인 범위)
    2. Enclosed scope : 지역 범위 한 단계 위 범위
    3. Global scope : 최상단에 위치한 범위
    4. Built-in scope : 모든 것을 담고 있는 범위(정의하지 않고 사용할 수 있는 모든 것)
- <span style='color:crimson;'>함수 내에서는 바깥 Scope의 변수에 접근 가능하나 수정은 할 수 없음</span>

![image](https://github.com/ragu6963/TIL/assets/32388270/15b4f0c6-7f21-4986-8349-fd8740e49573)

- <span style='color:Blue;'>따라서, 변수명으로 Built-in 함수를 사용하지 않도록 주의한다.</span>


#### `global` 키워드
- 변수의 스코프를 전역 범위로 지정하기 위해 사용
- 일반적으로 함수 내에서 전역 변수를 수정하려는 경우에 사용

    ```python
    num = 0 # 전역 변수


    def increment():
        global num # num를 전역 변수로 선언
        num += 1


    print(num) # 0
    increment()
    print(num) # 1

    # global 키워드 선언 전에 참조 불가

    
    num = 0


    def increment():
        # SyntaxError: name 'num' is used prior to global declaration
        print(num)
        global num
        num += 1
  # 매개변수에는 global 키워드 사용 불가
    num = 0


    def increment(num):
        # "num" is assigned before global declaration
        global num
        num += 1
    ```

    ## 참고
### 람다 표현식 (Lambda expressions)
- 익명 함수를 만드는 데 사용되는 표현식
- 한 줄로 간단한 함수를 정의

#### lambda 함수 구조
```python
lambda 매개변수: 표현식
```
- `lambda` 키워드
    - 람다 함수를 선언하기 위해 사용되는 키워드입니다.
- 매개변수
    - 함수에 전달되는 매개변수들
    - 여러 개의 매개변수가 있을 경우 쉼표로 구분
- 표현식
    - 함수의 실행되는 코드 블록으로, 결과값을 반환하는 표현식으로 작성


#### 람다 표현식 예시
- 간단한 연산이나 함수를 한 줄로 표현할 때 사용
- 함수를 매개변수로 전달하는 경우에도 유용하게 활용

    ```python
    # 람다 함수 미적용 코드
    def addition(x, y):
        return x + y

    result = addition(3, 5)
    print(result) # 8
    ```

    ```python
    # 람다 함수 적용 코드
    addition = lambda x, y: x + y

    result = addition(3, 5)
    print(result) # 8
    ```

    #### 람다 표현식 활용 (with map 함수)
```python
numbers = [1, 2, 3, 4, 5]
def square(x):
    return x**2

# lambda 미사용
squared1 = list(map(square, numbers))
print(squared1)  # [1, 4, 9, 16, 25]

# lambda 사용
squared2 = list(map(lambda x: x**2, numbers))
print(squared2)  # [1, 4, 9, 16, 25]
```

# 패킹 & 언패킹

### Packing `패킹`
- 여러 개의 값을 하나의 변수에 묶어서 담는 것
- 변수에 담긴 값들은 튜플(tuple) 형태로 묶임

    ```python
    packed_values = 1, 2, 3, 4, 5
    print(packed_values)  # (1, 2, 3, 4, 5)
    ```


#### `‘*’`을 활용한 패킹
- `*b`는 남은 요소들을 리스트로 패킹하여 할당

    ```python
    numbers = [1, 2, 3, 4, 5]
    a, *b, c = numbers
    
    print(a) # 1
    print(b) # [2, 3, 4]
    print(c) # 5
    ```
- print 함수에 임의의 가변 인자를 작성할 수 있었던 이유

    ```python
    print('hello') # hello
    print('you', 'need', 'python') # you need python
    ```

    ![image](https://github.com/ragu6963/TIL/assets/32388270/05db04bd-d01c-4f4c-a193-854e59385d67)

### Unpacking `언패킹`
- 패킹된 변수의 값을 개별적인 변수로 분리하여 할당하는 것
- 튜플이나 리스트 등의 객체의 요소들을 개별 변수에 할당
    
    ```python
    packed_values = 1, 2, 3, 4, 5
    a, b, c, d, e = packed_values
    print(a, b, c, d, e)  # 1 2 3 4 5
    ```

#### `‘*’`을 활용한 언패킹
- `*` 는 리스트의 요소를 언패킹하여 인자로 전달

    ```python
    def my_function(x, y, z):
        print(x, y, z)
    
    names = ['alice', 'jane', 'peter']
    my_function(*names) # alice jane peter
    ```
#### `‘**’`을 활용한 언패킹
- `**` 는 딕셔너리의 키-값 쌍을 함수의 키워드 인자로 언패킹
    
    ```python
    def my_function(x, y, z):
        print(x, y, z)


    my_dict = {'x': 1, 'y': 2, 'z': 3}
    my_function(**my_dict)  # 1 2 3
    ```

#### `*`, `**` 패킹 / 언패킹 연산자 정리
- `‘*’`
    - 패킹 연산자로 사용될 때, 여러 개의 인자를 하나의 튜플로 묶음
    - 언패킹 연산자로 사용될 때, 시퀀스나 반복 가능한 객체를 각각의 요소로 언패킹하여 함수의 인자로 전달
    
- `‘**’`
    - 언패킹 연산자로 사용될 때, 딕셔너리의 키-값 쌍을 언패킹하여 함수의 키워드 인자로 전달



# 실습
- 함수의 이름
```bash
- 이 함수가 어떤 일을 하는지 알 수 있도록 지어야 한다.
- 동사
```
- 함수의 역할
```bash
- 함수는 한가지 역할만 할 수 있도록 구성
```

```python
def make_sum(pram1, pram2):
    """이것은 두 수를 받아
    두 수의 합을 반환하는 함수입니다.
    >>> make_sum(1, 2)
    3
    """
    return pram1 + pram2

result = make_sum(100, 30)
return_value = print(result)
print(return_value) # print() 함수는 return이 없다.
                    # return은 반환하는 값을 가지지만, print는 그저 화면에 
                    # 출력하는 내장함수

def my_func():
    print('hello, world')
          

result = my_func() # 함수 출력
print(result) # None : 함수 반환값이 없기 때문에
```

```python
# 1. Positional Arguments
def greet(name, age):
    print(f'안녕하세요, {name}님! {age}살이시군요.')

greet('Alice', 25)
# greet('Alice')      # TypeError: greet() missing 1 required positional argument: 'age'
greet(20, 'Alice')  # 위치인자는 반드시 값을 전달해야 한다.


# 2. Default Argument Values
def greet(name, age=20):
    print(f'안녕하세요, {name}님! {age}살이시군요.')

greet('Bob')
greet('Charlie', 40)

# 3. Keyword Arguments
def greet(name, age):
    print(f'안녕하세요, {name}님! {age}살이시군요.')

greet(name='Dave', age=35)
greet(age=35, name='Dave') # 둘 다 키워드 인자일 경우 순서가 달라도 실행 된다.
```
```python
number_of_people = 0


def increase_user():
    global number_of_people
    number_of_people +=1


# 고객정보를 딕셔너리로 변환하는 함수
def create_user(name, age, address): #함수()안에 값으로
    increase_user()  # create_user 함수를 실행하면 increase_user 함수를 호출 
    print(f'{name}님 환영합니다!')
    user_info = {}
    user_info['name'] = name
    user_info['age'] = age
    user_info['address'] = address  ## 딕셔너리에 키 값에 대해 매개변수를 value로 집어넣기
    return user_info


print(f'현재 가입된 유저 수 : {number_of_people}')
result = create_user('홍길동', 30, '서울') ## 함수 호출, 매개변수에 필요 인자 삽입, 변수에 할당
print(result)
print(f'현재 가입된 유저 수 : {number_of_people}')



#내 답안
def create_user(**kwargs):
    print(f"{kwargs['name']}님 환영합니다!")
    print(kwargs)
    
create_user(name = '홍길동', age=30, address= '서울')


increase_user()
print(f'현재 가입된 유저 수 : {number_of_people}')
```

```python
number_of_book = 100 

def rental_book(name, number):
    decrease_book(number) # 위치 인자는 무조건 다시 받아야하기 때문에 아래 정의한 함수대로 매개변수 삽입
    print(f'{name}님이 {number}권의 책을 대여하였습니다.')

def decrease_book(number_book): # 그러나 ,decrease_함수의 매개변수 number와 rental_함수의 매개변수 number는 다른 애임.
    global number_of_book
    number_of_book -= number_book
    print(f'남은 책의 수 : {number_of_book}')


rental_book('홍길동',3)



    # 내 답안
def decrease_book(number):
        global number_of_book
        number_of_book -= number
        return number_of_book
def rental_book():
    
    br = input('이름, 권 수: ').split()
    name = br[0]
    number = int(br[1])
    decrease_book(number)
    print(f'남은 책의 수 : {number_of_book}')
    print(f'{name}님이 {number}권의 책을 대여하였습니다.')
    return name, number
```

```python
number_of_people = 0

## map 이용해서 반복
def increase_user():
    global number_of_people
    number_of_people +=1



def create_user(name, age, address):  ## dict를 생성하는 함수
    increase_user() 
    print(f'{name}님 환영합니다!')
    user_info = {}
    user_info['name'] = name
    user_info['age'] = age
    user_info['address'] = address 
    return user_info
    
name = ['김시습', '허균', '남영로', '임제', '박지원']
age = [20, 16, 52, 36, 60]
address = ['서울', '강릉', '조선', '나주', '한성부']
# 풀이 1 map
result = list(map(create_user, name, age, address)) # map(*function, *반복가능한객체_여러개 가능)
print(result)

# 풀이 2 반복문
result = []
for name, age, address in zip(name, age, address):
    result.append(create_user(name, age, address))
print(result)

# 내 답안(lambda 사용)
def create_user(**kwargs):
    
    
    name = ['김시습', '허균', '남영로', '임제', '박지원']
    age = [20, 16, 52, 36, 60]
    address = ['서울', '강릉', '조선', '나주', '한성부']
    

    user_info = list(map(lambda n, a, ad: {'name': n,
                                            'age': a, 'address': ad
                                            }, name, age, address))
    
    #     user_list = map(dict, zip(name, age, address))
 
    for user in user_info:
        print(f"{user['name']}님 환영합니다!")


    print(user_info)

create_user()

```

```python
number_of_people = 0

def increase_user():
    global number_of_people
    number_of_people +=1

name = ['김시습', '허균', '남영로', '임제', '박지원']
age = [20, 16, 52, 36, 60]
address = ['서울', '강릉', '조선', '나주', '한성부']

def create_user(name, age, address):
    increase_user() 
    print(f'{name}님 환영합니다!')
    user_info = {}
    user_info['name'] = name
    user_info['age'] = age
    user_info['address'] = address 
    return user_info

many_user =list(map(create_user, name, age, address))

# 기존 회원 정보에서 이름과 몇 권 빌릴 지 계산해서 새로운 회원 정보 딕셔너리를 반환하는 함수
def get_user(user):
    user_dict = {
        'name': user['name'],
        'number_of_rentalbooks': user['age']//10
    }
    return user_dict

lambda user:{'name': user['name'],'number_of_rentalbooks': user['age']//10}


number_of_book = 100 
    
def decrease_book(number_book):
    global number_of_book
    number_of_book -= number_book
    print(f'남은 책의 수 : {number_of_book}')
    
def rental_book(info):
    decrease_book(info['number_of_rentalbooks'])
    print(f'{info["name"]}가 {info["number_of_rentalbooks"]}권의 책을 대여했습니다.')

# 람다 x 버전
print(list(map(get_user, many_user)))
list(map(rental_book, list(map(get_user, many_user))))

# 람다 o 버전
print(list(map(get_user, many_user)))
list(
    map(
        rental_book, list(map(lambda user:{'name': user['name'],'number_of_rentalbooks': user['age']//10}, many_user))
    )
)
```