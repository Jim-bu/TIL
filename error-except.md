- [에러](#에러)
- [예외처리](#예외-처리)
- [EAFP&LBYL](#eafp--lbyl)

## 에러
### 에러 `Error`
- 프로그램 실행 중에 발생하는 예외 상황

#### 파이썬의 에러 유형
- 문법 에러 `Syntax Error`
    - 프로그램의 구문이 올바르지 않은 경우 발생 <br>(오타, 괄호 및 콜론 누락 등의 문법적 오류)
- 예외 `Exception`
    - 프로그램 실행 중에 감지되는 에러

### Debugging
- 소프트웨어에서 발생하는 버그를 찾아내고 수정하는 과정
- 프로그램의 오작동 원인을 식별하여 수정하는 작업
디버깅 방법
1. print 함수 활용
    - 특정 함수 결과, 반복/조건 결과 등 나눠서 생각, 코드를 bisection으로 나눠서 생각
2. 개발 환경(text editor, IDE) 등에서 제공하는 기능 활용
    - breakpoint, 변수 조회 등
3. [Python tutor](https://pythontutor.com/) 활용 (단순 파이썬 코드인 경우) 
4. 뇌 컴파일, 눈 디버깅 등

## 예외
### 예외 `Exception`
- 프로그램 실행 중에 감지되는 에러

#### 내장 예외 `Built-in Exceptions`
- 예외 상황을 나타내는 예외 클래스들
- 파이썬에서 이미 정의되어 있으며, 특정 예외 상황에 대한 처리를 위해 사용
> 참고 문서 : https://docs.python.org/ko/3/library/exceptions.html#ValueError

## 예외 처리
- 예외가 발생했을 때 프로그램이 비정상적으로 종료되지 않고, 적절하게 처리할 수 있도록 하는 방법

### 예외 처리 사용 구문
- `try`
  - 예외가 발생할 수 있는 코드 작성
- `except`
  - 예외가 발생했을 때 실행할 코드 작성
- `else`
  - 예외가 발생하지 않았을 때 실행할 코드 작성
- `finally`
  - 예외 발생 여부와 상관없이 항상 실행할 코드 작성

  ```python
  try:
      x = int(input('숫자를 입력하세요: '))
      y = 10 / x
  except ZeroDivisionError:
      print('0으로 나눌 수 없습니다.')
  except ValueError:
      print('유효한 숫자가 아닙니다.')
  else:
      print(f'결과: {y}')
  finally:
      print('프로그램이 종료되었습니다.')
  ```

### try & except
- try 블록 안에는 예외가 발생할 수 있는 코드를 작성
- except 블록 안에는 예외가 발생했을 때 처리할 코드를 작성
- 예외가 발생하면 프로그램 흐름은 try 블록을 빠져나와 해당 예외에 대응하는 except 블록으로 이동

    ```py
    try:
        # 예외가 발생할 수 있는 코드

    except 예외:
        # 예외 처리 코드
    ```
### 복수 예외처리 예시
        
    ```py
    try:
        num = int(input('100으로 나눌 값을 입력하시오 : '))
        print(100 / num)
    except (ValueError, ZeroDivisionError):
        print('제대로 입력해주세요.')
    ```

- 별도 작성
    
    ```py
    try:
        num = int(input('100으로 나눌 값을 입력하시오 : '))
        print(100 / num)
    except ValueError:
        print('숫자를 넣어주세요.')
    except ZeroDivisionError:
        print('0으로 나눌 수 없습니다.')
    except:
        print('에러가 발생하였습니다.')
    ```
### else & finally
- `else`
  - 예외가 발생하지 않았을 때 추가 작업을 진행
- `finally`
  - 예외 발생 여부와 상관없이 항상 실행할 코드를 작성

  ```python
  try:
      x = int(input('숫자를 입력하세요: '))
      y = 10 / x
  except ZeroDivisionError:
      print('0으로 나눌 수 없습니다.')
  except ValueError:
      print('유효한 숫자가 아닙니다.')
  else:
      print(f'결과: {y}')
  finally:
      print('프로그램이 종료되었습니다.')
  ```

##### 내장 예외의 상속 계층구조 주의
- 내장 예외 클래스는 상속 계층구조를 가지기 때문에 <br>except 절로 분기 시 반드시 하위 클래스를 먼저 확인 할 수 있도록 작성해야 함

    ```py
    try:
        num = int(input('100으로 나눌 값을 입력하시오 : '))
        print(100 / num)
    except BaseException: # 하위 예외 클래스 확인 필요
        print('숫자를 넣어주세요.')
    except ZeroDivisionError: # 하위 예외 클래스 확인 필요
        print('0으로 나눌 수 없습니다.')
    except:
        print('에러가 발생하였습니다.')
    ```
    
    ![image](https://github.com/ragu6963/TIL/assets/32388270/6ce033c9-6715-473f-a6c2-9e2288361a1a)

> 참고 문서 : https://docs.python.org/ko/3/library/exceptions.html#exception-hierarchy


#### 예외 객체 다루기
##### `as` 키워드
- 예외객체
    - 예외가 발생했을 때 예외에 대한 정보를 담고 있는 객체
- `except` 블록에서 예외 객체를 받아 상세한 예외 정보를 활용 가능

    ```py
    my_list = []

    try:
        number = my_list[1]
    except IndexError as error:
        print(f'{error}가 발생했습니다.')

    # list index out of range가 발생했습니다.
    ```
##### try-except와 if-else
- `try-except`와 `if-else`를 함께 사용할 수 있음
  ```python
  try:
      x = int(input('숫자를 입력하세요: '))
      if x < 0:
          print('음수는 허용되지 않습니다.')
      else:
          print('입력한 숫자:', x)
  except ValueError:
      print('오류 발생')
  ```

## EAFP & LBYL
### EAFP 
- `“Easier to Ask for Forgiveness than Permission”`
- 예외처리를 중심으로 코드를 작성하는 접근 방식
- `try-except`
### LBYL 
- `“Look Before You Leap”`
- 값 검사를 중심으로 코드를 작성하는 접근 방식
- `if-else`

### 접근 방식 비교
- EAFP

    ```py
    try:
        result = my_dict['key']
        print(result)
    except KeyError:
        print('Key가 존재하지 않습니다.')
    ```

- LBYL

    ```py
    if 'key' in my_dict:
        result = my_dict['key']
        print(result)
    else:
        print('Key가 존재하지 않습니다.')

    ```

|                                                           EAFP                                                         	|                                               LBYL                                              	|
|:----------------------------------------------------------------------------------------------------------------------:	|:-----------------------------------------------------------------------------------------------:	|
|                                               "일단   실행하고 예외를 처리"                                            	|                                   "실행하기   전에 조건을 검사"                                 	|
|                                   코드를 실행하고 예외가 발생하면      예외처리를 수행                                 	|     코드 실행 전에 조건문 등을 사용하여 예외 상황을 미리   검사하고, 예외 상황을 피하는 방식    	|
|     코드에서 예외가 발생할 수 있는 부분을 미리 예측하여   대비하는 것이 아니라,      예외가 발생한 후에 예외를 처리    	|           코드가 좀 더 예측 가능한 동작을 하지만,      코드가 더 길고 복잡해질 수 있음          	|
|                                         예외 상황을 예측하기 어려운 경우에 유용                                        	|                              예외 상황을 미리 방지하고 싶을 때 유용                             	|