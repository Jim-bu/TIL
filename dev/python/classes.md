[인스턴스 메서드](#인스턴스-메서드)
[클래스 메서드](#클래스-메서드)
[스태틱 메서드](#스태틱-메서드)
[상속](#상속)

## 메서드
### 개요
#### 메서드 종류
- 인스턴스 메서드
- 클래스 메서드
- 정적 메서드

    ![image](https://github.com/ragu6963/TIL/assets/32388270/c1c62879-9386-4b84-a4ab-d6d41aa56ad8)

### 인스턴스 메서드
#### 인스턴스 메서드 `instance method`
- 클래스로부터 생성된 각 인스턴스에서 호출할 수 있는 메서드
- 인스턴스의 상태를 조작하거나 동작을 수행

#### 인스턴스 메서드 구조
- 클래스 내부에 정의되는 메서드의 기본
- 반드시 첫 번째 매개변수로 <span style='color:red;'>인스턴스 자신(`self`)</span>을 전달받음
- self는 매개변수 이름일 뿐이며 다른 이름으로 설정 가능 하지만 다른 이름을 사용하지 않을 것을 강력히 권장


    ```py
    class MyClass:

        def instance_method(self, arg1, ...):
            pass
    ```
#### self 동작 원리
- upper 메서드를 사용해 문자열 ‘hello’를 대문자로 변경하기
    ```py
    'hello'.upper()
    ```

- 하지만 실제 파이썬 내부 동작은 다음과 같이 진행됨
    ```py
    str.upper('hello')
    ```

- str 클래스가 upper 메서드를 호출했고, 그 첫번째 인자로 문자열 인스턴스가 들어간 것

- <span style='color:red;'>인스턴스 메서드의 첫번째 매개변수가 반드시 인스턴스 자기 자신인 이유</span>

- `'hello'.upper()` 은 `str.upper('hello')`를 객체 지향 방식의 메서드로 호출하는 표현 (`단축형 호출`)

- ‘hello’라는 문자열 객체가 단순히 어딘가의 함수로 들어가는 인자가 아닌 객체 스스로 메서드를 호출하여 코드를 동작하는 객체 지향적 표현


#### 생성자 메서드 `constructor method`
- 인스턴스 객체가 생성될 때 자동으로 호출되는 메서드
- 인스턴스 변수들의 초기값을 설정

#### 생성자 메서드 구조
```py
class Person:
    def __init__(self, name):
        self.name = name
        print('인스턴스가 생성되었습니다.')

    def greeting(self):
        print(f'안녕하세요. {self.name}입니다.')

person1 = Person('지민')  # 인스턴스가 생성되었습니다.
person1.greeting()  # 안녕하세요. 지민입니다.
```

### 클래스 메서드
#### 클래스 메서드 `class method`
- 클래스가 호출하는 메서드
- 클래스 변수를 조작하거나 클래스 레벨의 동작을 수행

#### 클래스 메서드 구조
- `@classmethod` 데코레이터를 사용하여 정의
- 호출 시, 첫번째 인자로 호출하는 클래스(`cls`)가 전달됨
- cls는 매개변수 이름일 뿐이며 다른 이름으로 설정 가능 하지만 다른 이름을 사용하지 않을 것을 강력히 권장

    ```py
    class MyClass:
        
        @classmethod
        def class_method(cls, arg1, ...):
            pass

    ```

#### 클래스 메서드 예시
```py
class Person:
    count = 0

    def __init__(self, name):
        self.name = name
        Person.count += 1

    @classmethod
    def number_of_population(cls):
        print(f'인구수는 {cls.count}입니다.')


person1 = Person('iu')
person2 = Person('BTS')

Person.number_of_population() # 인구수는 2입니다.
```

### 스태틱 메서드
#### 스태틱(정적) 메서드 `static method`
- 클래스와 인스턴스와 상관없이 독립적으로 동작하는 메서드
- 주로 클래스와 관련이 있지만 인스턴스와 상호작용이 필요하지 않은 경우에 사용

#### 스태틱 메서드 구조
- `@staticmethod` 데코레이터를 사용하여 정의
- 호출 시 필수적으로 작성해야 할 매개변수가 없음
- 즉, 객체 상태나 클래스 상태를 수정할 수 없으며 단지 기능(행동)만을 위한 메서드로 사용

    ```py
    class MyClass:
        
        @staticmethod
        def static_method(arg1, ...):
            pass
    ```

#### 스태틱 메서드 예시

- 단순히 문자열을 조작하는 기능을 제공하는 메서드 예시


    ```py
    class StringUtils:
        @staticmethod
        def reverse_string(string):
            return string[::-1]

        @staticmethod
        def capitalize_string(string):
            return string.capitalize()


    text = 'hello, world'

    reversed_text = StringUtils.reverse_string(text)
    print(reversed_text) # dlrow ,olleh

    capitalized_text = StringUtils.capitalize_string(text)
    print(capitalized_text) # Hello, world

    ```


### 메서드 요약
#### 메서드 요약
- 인스턴스 메서드
    - 인스턴스의 상태를 변경하거나, 해당 인스턴스의 특정 동작을 수행

- 클래스 메서드 @classmethod
    - 인스턴스의 상태에 의존하지 않는 기능을 정의
    - 클래스 변수를 조작하거나 클래스 레벨의 동작을 수행

- 스태틱 메서드 @staticmethod
    - 클래스 및 인스턴스와 관련이 없는 일반적인 기능을 수행

#### 누가 어떤 메서드를 사용해야 할까 
- 클래스가 사용해야 할 것
    - 클래스 메서드
    - 스태틱 메서드

- 인스턴스가 사용해야 할 것
    - 인스턴스 메서드


- 예시 클래스로 클래스와 인스턴스가 각각 모든 메서드를 호출해보기

    ```py
    class MyClass:

        def instance_method(self):
            return 'instance method', self
            
        @classmethod
        def class_method(cls):
            return 'class method', cls

        @staticmethod
        def static_method():
            return 'static method'
    ```

#### 클래스가 할 수 있는 것
- 클래스는 모든 메서드를 호출 할 수 있음
- <span style='color:red;'>하지만 클래스는 클래스 메서드와 스태틱 메서드만 사용하도록 한다</span>

    ```py
    instance = MyClass()

    print(MyClass.instance_method(instance))  # ('instance method', <__main__.MyClass object at0x…028F10>)
    print(MyClass.class_method())  # ('class method', <class '__main__.MyClass'>)
    print(MyClass.static_method())  # static method
    ```


#### 인스턴스가 할 수 있는 것
- 인스턴스는 모든 메서드를 호출 할 수 있음
- <span style='color:red;'>하지만 인스턴스는 인스턴스 메서드만 사용하도록 한다</span>

    ```py
    instance = MyClass()

    print(instance.instance_method())  # ('instance method', <__main__.MyClass object at 0x0000…84EAF10>)
    print(instance.class_method())  # ('class method', <class '__main__.MyClass'>)
    print(instance.static_method())  # static method
    ```

#### `할 수 있다 != 써도 된다`
- 각자의 메서드는 OOP 패러다임에 따라 명확한 목적에 맞게 설계된 것이기 때문에 클래스와 인스턴스 각각 올바른 메서드만 사용한다.

### 매직 메서드
- 특별한 인스턴스 메서드
- 특정 상황에 자동으로 호출되는 메서드
- Double underscore(`__`)가 있는 메서드는 특수한 동작을 위해 만들어진 메서드
    - 스페셜 메서드 혹은 매직 메서드라고 불림
- 예시
    ```python
    __str__(self)
    __len__(self)__
    __lt__(self, other)
    __le__(self, other)
    __eq__(self, other)
    __gt__(self, other)
    __ge__(self, other)
    __ne__(self, other)
    ```

  #### 매직 메서드 예시
- `__str__(self)`
  - 내장함수 print에 의해 호출되어 객체 출력을 문자열 표현으로 변경

```python
class Circle:
    def __init__(self, r):
        self.r = r

    def __str__(self):
        return f'원의 반지름: {self.r}'
    
c1 = Circle(10)
c2 = Circle(1)

print(c1) # 원의 반지름: 10
print(c2) # 원의 반지름: 1
```

### 데코레이터 (Decorator)
- 다른 함수의 코드를 유지한 채로 수정하거나 확장하기 위해 사용되는 함수
#### 데코레이터 정의
```python
def my_decorator(func):
    def wrapper():
        # 함수 실행 전에 수행할 작업
        print('함수 실행 전')
        # 원본 함수 호출
        result = func()
        # 함수 실행 후에 수행할 작업
        print('함수 실행 후')
        return result
    return wrapper
```

#### 데코레이터 사용

```python
@my_decorator
def my_function():
    print('원본 함수 실행')
my_function()

"""
함수 실행 전
원본 함수 실행
함수 실행 후
"""
```

#### 절차 지향과 객체 지향은 대조되는 개념이 아니다
- 객체 지향은 기존 절차 지향을 기반으로 두고 보완하기 위해<br>
객체라는 개념을 도입해 상속, 코드 재사용성, 유지보수성 등의 이점을 가지는 패러다임 


## 상속
### 개요
#### 상속 `Inheritance`
- 기존 클래스의 속성과 메서드를 물려받아 새로운 하위 클래스를 생성하는 것

#### 상속이 필요한 이유
1. 코드 재사용
    - 상속을 통해 기존 클래스의 속성과 메서드를 재사용할 수 있음
    - 새로운 클래스를 작성할 때 기존 클래스의 기능을 그대로 활용할 수 있으며, 중복된 코드를 줄일 수 있음
2. 계층 구조
    - 상속을 통해 클래스들 간의 계층 구조를 형성할 수 있음
    - 부모 클래스와 자식 클래스 간의 관계를 표현하고, 더 구체적인 클래스를 만들 수 있음
3. 유지 보수의 용이성
    - 상속을 통해 기존 클래스의 수정이 필요한 경우, 해당 클래스만 수정하면 되므로 유지 보수가 용이해짐 
    - 코드의 일관성을 유지하고, 수정이 필요한 범위를 최소화할 수 있음

    ![image](https://github.com/ragu6963/TIL/assets/32388270/f259eed5-c629-4a42-b0cc-4896162169c8)

### 다중 상속
#### 다중 상속 정의
- 둘 이상의 상위 클래스로부터 여러 행동이나 특징을 상속받을 수 있는 것
- 상속받은 모든 클래스의 요소를 활용 가능함
- 중복된 속성이나 메서드가 있는 경우 <span style='color:crimson;'>상속 순서에 의해 결정</span>됨

#### 다이아몬드 문제
![Diamond](https://i.ibb.co/b23YqZT/440px-Diamond-inheritanc.png)

- 두 클래스 B와 C가 A에서 상속되고 클래스 D가 B와 C 모두에서 상속될 때 발생하는 모호함
- B와 C가 재정의한 메서드가 A에 있고 D가 이를 재정의하지 않은 경우라면
- D는 B의 메서드 중 어떤 버전을 상속하는가? 아니면 C의 메서드 버전을 상속하는가?

#### 파이썬에서의 해결책

- MRO(Method Resolution Order) 알고리즘을 사용하여 클래스 목록을 생성
- 부모 클래스로부터 상속된 속성들의 검색을 깊이 우선으로, 왼쪽에서 오른쪽으로, 계층 구조에서 겹치는 같은 클래스를 두 번 검색하지 않음
- 그래서, 속성이 D 에서 발견되지 않으면, B 에서 찾고, 거기에서도 발견되지 않으면, C 에서 찾고, 이런 식으로 진행됨
- **상위 클래스에 정의된 함수로 이동할 때는 인자에 먼저 적힌 순서로 이동
- 또한 먼저의 인자에서 init을 찾게 되면 뒤쪽 인자는 무시(출력이나 반환 x)

    ```python
    class D(B, C):
        pass
    ```

#### MRO (Method Resolution Order)
- 메서드 결정 순서
#### `super()`
- 부모 클래스 객체를 반환하는 내장 함수
- 다중 상속 시 MRO를 기반으로 현재 클래스가 상속하는 모든 부모 클래스 중 다음에 호출될 메서드를 결정하여 자동으로 호출


#### super() 사용 예시 (단일 상속)

- 사용 전

    ```py
    class Person:
        def __init__(self, name, age, number, email):
            self.name = name
            self.age = age
            self.number = number
            self.email = email


    class Student(Person):
        def __init__(self, name, age, number, email, student_id):
            self.name = name
            self.age = age
            self.number = number
            self.email = email
            self.student_id = student_id
    ```

- 사용 후

    ```py
    class Person:
        def __init__(self, name, age, number, email):
            self.name = name
            self.age = age
            self.number = number
            self.email = email


    class Student(Person):
        def __init__(self, name, age, number, email, student_id):
            # Person의 init 메서드 호출
            super().__init__(name, age, number, email)
            self.student_id = student_id

    ```

#### super() 사용 예시 (단일 상속)

```python
class ParentA:
    def __init__(self):
        self.value_a = 'ParentA'

    def show_value(self):
        print(f'Value from ParentA: {self.value_a}')


class ParentB:
    def __init__(self):
        self.value_b = 'ParentB'

    def show_value(self):
        print(f'Value from ParentB: {self.value_b}’)


class Child(ParentA, ParentB):
    def __init__(self):
        super().__init__() # ParentA 클래스의 __init__ 메서드 호출
        self.value_c = 'Child’
        # A 클래스의 __init__ 메서드를 호출한 이상 B의 메서드를 호출하지 않는다.
        # 또한 이미 self를 인자로 받고 있기 때문에 self 안넣음

    def show_value(self):
        super().show_value() # ParentA 클래스의 show_value 메서드 호출
        print(f'Value from Child: {self.value_c}')

child = Child()
child.show_value()
```

##### MRO가 필요한 이유

- 부모 클래스들이 여러 번 액세스 되지 않도록, <br>각 클래스에서 지정된 왼쪽에서 오른쪽으로 가는 순서를 보존하고, <br>각 부모를 오직 한 번만 호출하고, <br>부모들의 우선순위에 영향을 주지 않으면서 서브 클래스를 만드는 단조적인 구조 형성

- 프로그래밍 언어의 신뢰성 있고 확장성 있는 클래스를 설계할 수 있도록 도움
- 클래스 간의 메서드 호출 순서가 예측 가능하게 유지되며, 코드의 재사용성과 유지보수성이 향상


##### super의 2 가지 사용 사례
1. 단일 상속 구조
    - 명시적으로 이름을 지정하지 않고 부모 클래스를 참조할 수 있으므로, 코드를 더 유지 관리하기 쉽게 만들 수 있음
    - 클래스 이름이 변경되거나 부모 클래스가 교체되어도 super()를 사용하면 코드 수정이 더 적게 필요
2. 다중 상속 구조
    - MRO를 따른 메서드 호출
    - 복잡한 다중 상속 구조에서 발생할 수 있는 문제를 방지