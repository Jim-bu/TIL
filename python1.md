- [python numeric \& Text sequence](#python-numeric--text-sequence)
      - [산술 연산자](#산술-연산자)

# python numeric & Text sequence
```bash
데이터 타입
- Numeric Types
    - int (정수), float (실수), complex (복소수)
- Sequence Types
    - list, tuple, range
- Text Sequence Type
    - str (문자열)
- Non-sequence Types
    - set, dict
- 기타
    - None, Boolean, Functions

데이터 타입의 중요성
- 데이터 타입에 맞는 연산을 수행할 수 있기 때문
```

#### 진수 표현
```bash
- 2진수(binary) : `0b`
- 8진수(octal) : `0o`
- 16진수(hexadecimal) : `0x`
```
#### 실수 연산 시 주의사항
- 컴퓨터는 2진수를 사용, 사람은 10진법을 사용
- 이때 10진수 0.1은 2진수로 표현하면 0.0001100110011001100110... - 같이 무한대로 반복
- 무한대 숫자를 그대로 저장할 수 없어서 사람이 사용하는 10진법의 근사값만 표시
- 0.1의 경우 3602879701896397 / 2 ** 55 이며 0.1에 가깝지만 정확히 동일하지는 않음
- 이런 과정에서 예상치 못한 결과가 나타남
- 이런 증상을 <span style='color:crimson;'>Floating point rounding error 부동소수점 에러</span>라고 함

##### 부동소수점 에러
- 컴퓨터가 실수를 표현하는 방식으로 인해 발생하는 작은 오차
- 원인
  - 실수를 2진수로 변환하는 과정에서 발생하는 근사치 표현
  ##### 부동소수점 에러 해결책
- 대표적으로 `decimal` 모듈을 사용해 부동소수점 연산의 정확성을 보장하는 방법
- 이외에도 다양한 해결 방법이 존재


```python
# 해결 전
a = 3.2 - 3.1
b = 1.2 - 1.1
print(a)  # 0.10000000000000009
print(b)  # 0.09999999999999987
print(a == b)  # False

# 해결 후
from decimal import Decimal

a = Decimal('3.2') - Decimal('3.1')
b = Decimal('1.2') - Decimal('1.1')

print(a)  # 0.1
print(b)  # 0.1
print(a == b)  # True
```

#### 지수 표현 방식
- `e` 또는 `E`를 사용한 지수 표현

```python 
# 314 ∗ 0.01
number = 314e-2

# 3.14
print(number)
```


#### 산술 연산자
| 기호 | 연산자        |
|:---:|:----------:|
| -  | 음수 부호      |
| +  | 덧셈         |
| -  | 뺄셈         |
| *  | 곱셈         |
| /  | 나눗셈        |
| // | 정수 나눗셈 (몫) |
| %  | 나머지        |
| ** | 지수 (거듭제곱)  |

#### *중요 연산자 우선순위
| 우선순위 | 연산자         | 연산                   |
|:----:|:-----------:|:--------------------:|
| 높음   | **          | 지수                   |
|      | -           | 음수 부호                |
|      | *, /, //, % | 곱셈, 나눗셈, 정수 나눗셈, 나머지 |
| 낮음   | +, -        | 덧셈, 뺄셈               |

#### 할당문
![image](https://github.com/ragu6963/TIL/assets/32388270/21737370-e926-4b74-9055-436ed9e26270)
1. 할당 연산자(=) 오른쪽에 있는 표현식을 평가해서 값(메모리 주소)을 생성
2. 값의 메모리 주소를 ‘=‘ 왼쪽에 있는 변수에 저장
- 존재하지 않는 변수라면
    - 새 변수를 생성
- 기존에 존재했던 변수라면
    - 기존 변수를 재사용해서 변수에 들어 있는 메모리 주소를 변경


#### Escape sequence
- 역슬래시(backslash, `\`)뒤에 특정 문자가 와서 특수한 기능을 하는 문자 조합
- 파이썬의 일반적인 문법 규칙을 잠시 탈출한다는 의미

|     예약   문자    	|      내용(의미)    	|
|:------------------:	|:------------------:	|
|          `\n`        	|      줄   바꿈     	|
|          `\t`        	|          탭        	|
|          `\\`        	|       백슬래시     	|
|          `\’`        	|     작은 따옴표    	|
|          `\"`        	|     큰   따옴표    	|

#### String Interpolation
- 문자열 내에 변수나 표현식을 삽입하는 방법

##### *중요 f-string
- 문자열에 `f` 또는 `F` 접두어를 붙이고 표현식을 `{expression}`로 작성하는 문법
- 문자열에 파이썬 표현식의 값을 삽입할 수 있음

```python 
bugs = 'roaches'
counts = 13
area = 'living room'

# Debugging roaches 13 living room
print(f'Debugging {bugs} {counts} {area}')
```

##### 인덱스 `index`
- 시퀀스 내의 값들에 대한 고유한 번호로, 각 값의 위치를 식별하는 데 사용되는 숫자

##### index 예시
|         "    	|      h    	|      e    	|      l    	|      l    	|      o    	|     "    	|
|-------------:	|:---------:	|:---------:	|:---------:	|:---------:	|:---------:	|----------	|
|     index    	|      0    	|      1    	|      2    	|      3    	|      4    	|          	|
|     index    	|     -5    	|     -4    	|     -3    	|     -2    	|     -1    	|          	|



##### 슬라이싱 `slicing`
시퀀스의 일부분을 선택하여 추출하는 작업

-> 시작 인덱스와 끝 인덱스를 지정하여 해당 범위의 값을 포함하는 새로운 시퀀스를 생성

##### slicing 예시
```python
my_str = 'hello'
my_str[2:4]
```
|         "    	|      h    	|      e    	|      <span style='color:red;'>l</span>    	|      <span style='color:red;'>l</span>    	|      o    	|     "    	|
|-------------:	|:---------:	|:---------:	|:---------:	|:---------:	|:---------:	|----------	|
|     index    	|      0    	|      1    	|      <span style='color:yellow;'>2</span>    	|      <span style='color:yellow;'>3</span>    	|      4    	|          	|
|     index    	|     -5    	|     -4    	|     -3    	|     -2    	|     -1    	|          	|


```python
my_str = 'hello'
my_str[:3]
```
|         "    	|      <span style='color:red;'>h</span>    	|      <span style='color:red;'>e</span>    	|      <span style='color:red;'>l</span>    	|      l    	|      o    	|     "    	|
|-------------:	|:---------:	|:---------:	|:---------:	|:---------:	|:---------:	|----------	|
|     index    	|      <span style='color:yellow;'>0</span>    	|      <span style='color:yellow;'>1</span>    	|      <span style='color:yellow;'>2</span>    	|      3    	|      4    	|          	|
|     index    	|     -5    	|     -4    	|     -3    	|     -2    	|     -1    	|          	|

```python
my_str = 'hello'
my_str[3:]
```
|         "    	|      h    	|      e    	|      l    	|      <span style='color:red;'>l</span>    	|      <span style='color:red;'>o</span>    	|     "    	|
|-------------:	|:---------:	|:---------:	|:---------:	|:---------:	|:---------:	|----------	|
|     index    	|      0    	|      1    	|      2    	|      <span style='color:yellow;'>3</span>    	|      <span style='color:yellow;'>4</span>    	|          	|
|     index    	|     -5    	|     -4    	|     -3    	|     -2    	|     -1    	|          	|

- step을 지정하여 추출
```python
my_str = 'hello'
my_str[0:5:2]
```
|         "    	|      <span style='color:red;'>h</span>    	|      e    	|      <span style='color:red;'>l</span>    	|      l    	|      <span style='color:red;'>o</span>    	|     "    	|
|-------------:	|:---------:	|:---------:	|:---------:	|:---------:	|:---------:	|----------	|
|     index    	|      <span style='color:yellow;'>0</span>    	|      1    	|      <span style='color:yellow;'>2</span>    	|      3    	|      <span style='color:yellow;'>4</span>    	|          	|
|     index    	|     -5    	|     -4    	|     -3    	|     -2    	|     -1    	|          	|

- step이 음수일 경우
```python
my_str = 'hello'
my_str[::-1]
```

|         "    	|      <span style='color:red;'>h</span>    	|      <span style='color:red;'>e</span>    	|      <span style='color:red;'>l</span>    	|      <span style='color:red;'>l</span>    	|      <span style='color:red;'>o</span>    	|     "    	|
|-------------:	|:---------:	|:---------:	|:---------:	|:---------:	|:---------:	|----------	|
|     index    	|      0    	|      1    	|      2    	|      3    	|      4    	|          	|
|     index    	|     <span style='color:yellow;'>-5</span>    	|     <span style='color:yellow;'>-4</span>    	|     <span style='color:yellow;'>-3</span>    	|     <span style='color:yellow;'>-2</span>    	|     <span style='color:yellow;'>-1</span>    	|          	|

### list `리스트`
- 여러 개의 값을 순서대로 저장하는 변경 가능한 시퀀스 자료형

#### 리스트 표현
- 0개 이상의 객체를 포함하며 데이터 목록을 저장
- 대괄호(`[]`)로 표기
- 데이터는 어떤 자료형도 저장할 수 있음
```python
my_list_1 = []

my_list_2 = [1, 'a', 3, 'b', 5]

my_list_3 = [1, 2, 3, 'Python', ['hello', 'world', '!!!']]
```

#### 리스트의 시퀀스 특징
```python
my_list = [1, 'a', 3, 'b', 5]

# 인덱싱
print(my_list[1])  # a

# 슬라이싱
print(my_list[2:4])  # [3, 'b']
print(my_list[:3])  # [1, 'a', 3]
print(my_list[3:])  # ['b', 5]
print(my_list[0:5:2])  # [1, 3, 5]
print(my_list[::-1])  # [5, 'b', 3, 'a', 1]

# 길이
print(len(my_list))  # 5
```

### tuple `튜플`
- 여러 개의 값을 순서대로 저장하는 변경 불가능한 시퀀스 자료형
#### 튜플 표현
- 0개 이상의 객체를 포함하며 데이터 목록을 저장
- 소괄호(`()`)로 표기
- 데이터는 어떤 자료형도 저장할 수 있음

    ```python
    my_tuple_1 = ()

    my_tuple_2 = (1,) # (1)은 정수 하나인 1이 되기 때문에 하나의 값을 저장할 때는 (1,)로 표현

    my_tuple_3 = (1, 'a', 3, 'b', 5)
    ```

#### 튜플은 불변(변경 불가)
```python
my_tuple = (1, 'a', 3, 'b', 5)

# TypeError: 'tuple' object does not support item assignment
my_tuple[1] = 'z'
```
#### 튜플은 어디에 쓰일까?
- 튜플의 불변 특성을 사용한 안전하게 여러 개의 값을 전달, 그룹화, 다중 할당 등
- 개발자가 직접 사용하기 보다 ‘파이썬 내부 동작’에서 주로 사용됨

    ```python
    x, y = (10, 20)

    print(x)  # 10
    print(y)  # 20

    # 파이썬은 쉼표를 튜플 생성자로 사용하니 괄호는 생략 가능
    x, y = 10, 20
    ```

### range
- 연속된 정수 시퀀스를 생성하는 변경 불가능한 자료형
- 증가 값이 없으면 1씩 증가
- 증가 값이 음수이면 감소 / 증가 값이 양수이면 증가
- 증가 값이 0이면 에러
- 증가 값이 음수이면 시작 값이 끝 값보다 커야 함
- 증가 값이 양수이면 시작 값이 끝 값보다 작아야 함
- 
#### range 표현 1
- `range(시작 값, 끝 값, 증가 값)`
- `range(n)`
    - 0부터 n-1까지의 숫자의 시퀀스
- `range(n, m) `
    - n부터 m-1까지의 숫자 시퀀스

    ```python
    my_range_1 = range(5)
    my_range_2 = range(1, 10)

    print(my_range_1)  # range(0, 5)
    print(my_range_2)  # range(1, 10)
    ```
#### ragne 표현 2
- 주료 반복문과 함께 사용 예정

```python
# 리스트로 형 변환 시 데이터 확인 가능
print(list(range(5)))   # [0, 1, 2, 3, 4]
print(list(range(1, 10)))  # [1, 2, 3, 4, 5, 6, 7, 8, 9]

# 반복문과 함께 활용
for i in range(1, 10):
    print(i)  # 1 2 3 4 5 6 7 8 9
for i in range(1, 10, 2):
    print(i)  # 1 3 5 7 9
```

## Non-sequence Types

### dict `딕셔너리`
- key - value 쌍으로 이루어진 순서와 중복이 없는 변경 가능한 자료형
- key는 변경 불가능한 자료형만 사용 가능 (str, int, float, tuple, range …)
- value는 모든 자료형 사용 가능
- 중괄호(`{}`)로 표기

    ```python
    my_dict_1 = {}
    my_dict_2 = {'key': 'value'}
    my_dict_3 = {'apple': 12, 'list': [1, 2, 3]}

    print(my_dict_1)  # {}
    print(my_dict_2)  # {'key': 'value'}
    print(my_dict_3)  # {'apple': 12, 'list': [1, 2, 3]}
    ```
#### 딕셔너리 사용
- key를 통해 value에 접근

    ```python
    my_dict = {'apple': 12, 'list': [1, 2, 3]}
    print(my_dict['apple'])  # 12
    print(my_dict['list'])  # [1, 2, 3]

    # 추가
    my_dict['banana'] = 50
    print(my_dict) # {'apple': 12, 'list': [1, 2, 3], 'banana': 50}

    # 변경
    my_dict['apple'] = 100
    print(my_dict) # {'apple': 100, 'list': [1, 2, 3], 'banana': 50}
    ```
### set `세트`
- 순서와 중복이 없는 변경 가능한 자료형
- 수학에서의 집합과 동일한 연산 처리 가능
- 중괄호(`{}`)로 표기

    ```python
    my_set_1 = set() # 빈세트 표현 : set() | {} 빈 중괄호는 딕셔너리
    my_set_2 = {1, 2, 3}
    my_set_3 = {1, 1, 1}

    print(my_set_1)  # set()
    print(my_set_2)  # {1, 2, 3}
    print(my_set_3)  # {1}
    ```
#### 세트의 집합 연산
```python
my_set_1 = {1, 2, 3}
my_set_2 = {3, 6, 9}

# 합집합
print(my_set_1 | my_set_2)  # {1, 2, 3, 6, 9}

# 차집합
print(my_set_1 - my_set_2)  # {1, 2}

# 교집합
print(my_set_1 & my_set_2)  # {3}
```

## Other Types
### None
- 파이썬에서 ‘값이 없음’을 표현하는 자료형

#### None 표현
```python
variable = None

print(variable)  # None
```
### Boolean
- 참(True)과 거짓(False)을 표현하는 자료형

#### 불리언 표현
- 비교 / 논리 연산의 평가 결과로 사용됨
- 주로 조건 / 반복문과 함께 사용

    ```python
    bool_1 = True
    bool_2 = False

    print(bool_1)  # True
    print(bool_2)  # False
    print(3 > 1)  # True
    print('3' != 3)  # True
    ```

### Collection
- 여러 개의 항목 또는 요소를 담는 자료 구조
- str, list, tuple, set, dict

|     컬렉션    	|     변경 가능 여부    	|     순서 여부    	|          	|
|:-------------:	|:---------------------:	|:----------------:	|:--------:	|
|       str     	|            X          	|         O        	|  시퀀스  	|
|      list     	|            O          	|         O        	|  시퀀스  	|
|      tuple    	|            X          	|         O        	|  시퀀스  	|
|       dict     	|            O          	|         X        	| 비시퀀스 	|
|      set     	|            O          	|         X        	| 비시퀀스 	|

## Type Conversion

### 형변환
- 한 데이터 타입을 다른 데이터 타입으로 변환하는 과정
- 암시적 형변환 / 명시적 형변환으로 나뉨

### 암시적 형변환 `Implicit Type conversion`
- 파이썬이 자동으로 수행하는 형변환

- 정수와 실수의 연산에서 정수가 실수로 변환됨
- Boolean과 Numeric Type에서만 가능

```python
print(3 + 5.0)  # 8.0

# True = 1 , False = 0
print(True + 3)  # 4

print(True + False)  # 1
```

### 명시적 형변환 `Explicit Type conversion`
- 프로그래머가 직접 지정하는 형변환
- 암시적 형변환이 아닌 경우를 모두 포함

#### 명시적 형변환 예시
- str -> integer : 형식에 맞는 숫자만 가능
```python
print(int('1'))  # 1

# ValueError: invalid literal for int() with base 10: '3.5'
print(int('3.5'))

print(int(3.5))  # 3
print(float('3.5'))  # 3.5
```

- integer -> str : 모두 가능
 
```python
print(str(1) + '등')  # 1등
```

## Operator 연산자

### 산술 연산자
|     기호    	|           연산자          	|
|:-----------:	|:-------------------------:	|
|       -     	|         음수   부호       	|
|       +     	|            덧셈           	|
|       -     	|            뺄셈           	|
|       *     	|            곱셈           	|
|       /     	|           나눗셈          	|
|      //     	|     정수   나눗셈 (몫)    	|
|       %     	|           나머지          	|
|      **     	|      지수   (거듭제곱)    	|

### 복합 연산자
- 연산과 할당이 함께 이뤄짐

|     기호    	|         예시         	|          의미           	|
|:-----------:	|:----------------:	|:-------------------:	|
|      +=     	|      a   += b    	|      a   = a + b    	|
|      -=     	|      a   -= b    	|      a   = a - b    	|
|      *=     	|      a   *= b    	|      a   = a * b    	|
|      /=     	|      a   /= b    	|      a   = a / b    	|
|      //=    	|     a   //= b    	|     a   = a // b    	|
|      %=     	|      a   %= b    	|      a   = a % b    	|
|      **=    	|     a   **= b    	|     a   = a ** b    	|

### 비교 연산자

|       기호      	|         내용       	|
|:---------------:	|:------------------:	|
|         <       	|         미만       	|
|        <=       	|         이하       	|
|         >       	|         초과       	|
|        >=       	|         이상       	|
|        ==       	|         같음       	|
|        !=       	|     같지   않음    	|
|        is       	|         같음       	|
|     is   not    	|     같지   않음    	|

#### is 비교 연산자
- 매모리 내에서 같은 객체를 참조하는지 확인
- 같은 주소인지까지 비교하는 연산자
- `==` 는 동등성(equality), `is` 는 식별성(identity)
- 값을 비교하는 `==` 와 다름

|       기호      	|         내용       	|
|:---------------:	|:------------------:	|
|         is      	|         같음       	|
|        is not      |         같지 않음      | 


### 논리 연산자

|     기호    	|      연산자     	|                                        내용                                       	|
|:-----------:	|:---------------:	|:---------------------------------------------------------------------------------:	|
|      and    	|      논리곱     	|       두   피연산자 모두 True인   경우에만      전체   표현식을 True로   평가     	|
|      or     	|      논리합     	|     두   피연산자 중 하나라도 True인   경우      전체   표현식을 True로   평가    	|
|      not    	|     논리부정    	|                               단일   피연산자를 부정                              	|

#### 단축평가

```python
vowels = 'aeiou'

print(('a' and 'b') in vowels)  # False
                                # 문자열의 값이 존재하면 True를 주기 때문에 ()의 값은 'b'
print(('b' and 'a') in vowels)  # True
                                # 문자열의 값이 존재하면 True를 주기 때문에 ()의 값은 'a' 

# 0은 False
print(3 and 5)  # 5
print(3 and 0)  # 0
print(0 and 3)  # 0
print(0 and 0)  # 0 

print(5 or 3)  # 5
print(3 or 0)  # 3
print(0 or 3)  # 3
print(0 or 0)  # 0
```

```bash
- and
    - 첫 번째 피연산자가 False인 경우, 전체 표현식은 False로 결정. <br>두 번째 피연산자는 평가되지 않고 그 값이 무시
    - 첫 번째 피연산자가 True인 경우, 전체 표현식의 결과는 두 번째 피연산자에 의해 결정. <br>두 번째 피연산자가 평가되고 그 결과가 전체 표현식의 결과로 반환
- or
    - 첫 번째 피연산자가 True인 경우, 전체 표현식은 True로 결정. <br>두 번째 피연산자는 평가되지 않고 그 값이 무시
    - 첫 번째 피연산자가 False인 경우, 전체 표현식의 결과는 두 번째 피연산자에 의해 결정. <br>두 번째 피연산자가 평가되고 그 결과가 전체 표현식의 결과로 반환
```

### 멤버십 연산자
- 특정 값이 시퀀스나 다른 컬렉션에 속하는지 여부를 확인

|       기호      	|                                    내용                                  	|
|:---------------:	|:------------------------------------------------------------------------:	|
|        in       	|        왼쪽   피연산자가 오른쪽 피연산자의 시퀀스에 속하는지를 확인      	|
|     not   in    	|     왼쪽   피연산자가 오른쪽 피연산자의 시퀀스에 속하지 않는지를 확인    	|

### 시퀀스형 연산자
- `+` 와 `*` 는 시퀀스 간 연산에서 산술 연산자일때와 다른 역할을 가짐

|     연산자    	|          내용        	|
|:-------------:	|:--------------------:	|
|        +      	|     결합   연산자    	|
|        *      	|     반복   연산자    	|


### 연산자 우선순위

|     우선순위    	|             연산자            	|               내용             	|
|:---------------:	|:-----------------------------:	|:------------------------------:	|
|       높음      	|               ()              	|        소괄호   grouping       	|
|                 	|               []              	|        인덱싱,   슬라이싱      	|
|                 	|               **              	|             거듭제곱           	|
|                 	|             +,   -            	|     단항   연산자 양수/음수    	|
|                 	|          *,   /, //, %        	|          산술   연산자         	|
|                 	|             +,   -            	|          산술   연산자         	|
|                 	|     <,   <=, >, >=, ==, !=    	|          비교   연산자         	|
|                 	|          is,   is not         	|           객체   비교          	|
|                 	|          in,   not in         	|         멤버십   연산자        	|
|                 	|               not             	|           논리   부정          	|
|                 	|               and             	|            논리   AND          	|
|       낮음      	|               or              	|            논리   OR           	|


#### 과제 수행
```python
a ='반짝 반짝'
b = '에서도'
c = '작은 별'
d = '아름답게 비치네'
e = '동쪽 하늘'
f = '서쪽 하늘'


print(a+' '+c+' '+d)
print(e+b+' '+f+b)
print(a+' '+c+' '+d)
```

```python
# 원주율
p = 3.1415926535897932384626433832795028841971693993751058209749445923078164062862089986280348253421170679
# 반지름
r = 15

print(f'원주율 :{p}')
print(f'반지름 :{r}')
print(f'원의 둘레 :{2*p*r}')
print(f'원의 넓이 :{p*r**2}')
```
```python
print(f'3의 2배 : {3*2}')
print(f'3의 제곱 : {3**2}')
print(f'3의 제곱 값을 3의 2개의 값으로 나눈 몫 : {(3**2)//(3*2)}')
print(f'3의 제곱 값을 3의 2개의 값으로 나눈 나머지 : {(3**2)%(3*2)}')
print(f'3의 제곱 값에 -3의 제곱값의 합 : {(3**2) + ((-3)**2)}')
```

```python
# 아래에 코드를 작성하시오.
korean = '한글'
english = 'english'
number = 3

print(f'{korean}과 {english}\n{number*korean}')
```



```python
password = "In the bustling city, where life is a constant race against time, uoy often find yourself wondering if there's a shortcut to success. The vibrant lights of the cityscape illuminate the night, casting shadows on the short-lived dreams of those who seek fortune. As you navigate through the crowded streets, you realize the deen for guidance, like a compass pointing python. You need direction in this chaotic journey called life."
# 아래에 코드를 작성하시오.
print(len(password))

first_char = password[28:36]
second_word = password[113:118]
third_word = password[68:65:-1]  # [::-1] 을 통해 문자열의 순서를 거꾸로 할 수 있다.
fourth_word = password[322:326:-1]
fifth_word = password[365:372]

print(f'{first_char} {second_word} {third_word} {fourth_word} need "{fifth_word}"')
```

```python
# 정수형 변환
book = int('1')
total = 10
guide = '현재 보유 중인 총 책의 수는 다음과 같습니다.'
print(guide)
print(book * total)
 
changes = '그 중, 대여중인 책을 제외한 책의 수는 다음과 같습니다.'
rental = int(3.0)
print(changes)
print(total - rental)
```

```python
authors = [
    '작자 미상',
    '이항복',
    '임제',
    '임제',
    '조성기',
    '조성기',
    '조성기',
    '임제',
    '허균',
    '허균',
    '허균',
    '임제',
    '임제',
    '임제',
    '임제',
    '임제',
    '임제',
    '임제',
    '임제',
    '임제',
    '임제',
    '박지원',
    '이항복',
    '남영로',
    '남영로',
    '남영로',
    '이항복',
    '임제',
    '임제',
]
 # 리스트의 중복을 제거하기 위해서 set로 변환한 후 다시 list 형변환을 수행
d_author = set(authors)
print(list(d_author))
```

```python
# 리스트 자료를 dict로 추출해서 나열할 때 이쁘게 프린트 하기 pprint() 모듈 사용
import pprint
information = dict()
authors = ['김시습', '허균', '남영로', '작자 미상', '임제', '박지원']
books = [
    ['장화홍련전', '가락국 신화', '온달 설화'],
    ['금오신화', '이생규장전', '만복자서포기'],
    ['수성지', '백호집', '원생몽유록'],
    ['홍길동전', '장생전', '도문대작'],
    ['옥루몽', '옥련몽'],
]
 
information[authors[0]] = books[1]
information[authors[1]] = books[3]
information[authors[2]] = books[-1]
information[authors[3]] = books[0]
information[authors[4]] = books[2]

pprint.pprint(information)
```

```python
# 할당하는 = 연산자가 아닌 다른 주소로 상태를 복사하는 경우 copy 모듈의 deepcopy() 깊은 복사를 사용한다.
import copy
catalog = [
    ['시간의 틈', '반짝임의 어둠', '망각의 경계'],
    ['연기의 수수께끼', '장면의 고백', '드라마의 그림자'],
    ['황금의 칼날', '비열한 간신', '무명의 영웅'],
    ['성공의 열쇠', '내면의 변화', '목표의 달성'],
]
 
backup_catalog = copy.deepcopy(catalog)

''' 
도서 제목 '성공의 열쇠', '내면의 변화', '목표의 달성' 을 각각
'성공을 향한 한 걸음', '내 삶의 변화', '목표 달성의 비밀' 가 되도록 변경하시오.
'''
catalog[-1] = ['성공을 향한 한 걸음', '내 삶의 변화', '목표 달성의 비밀']


print('catalog와 backup_catalog를 비교한 결과')
# 식별 연산자로 catalog와 backup_catalog를 비교한 결과를 출력하시오.
print(backup_catalog is catalog)

print('backup_catalog : ')
print(backup_catalog)

print('catalog : ')
print(catalog)
```
