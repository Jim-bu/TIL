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

