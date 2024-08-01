- [Copy](#copy)


# Copy
## 복사
### 개요
- 파이썬에서는 데이터에 분류에 따라 복사가 달라짐
- “변경 가능한 데이터 타입”과 “변경 불가능한 데이터 타입”을 다르게 다룸


#### 변경 가능한 데이터 타입의 복사
```py
a = [1, 2, 3, 4]
b = a
b[0] = 100

print(a)  # [100, 2, 3, 4]
print(b)  # [100, 2, 3, 4]
```

![image](https://github.com/ragu6963/TIL/assets/32388270/d77141fc-77d0-46ac-a087-111d372713a0)
#### 변경 불가능한 데이터 타입의 복사
```py
a = 20
b = a
b = 10

print(a)  # 20
print(b)  # 10
```

![image](https://github.com/ragu6963/TIL/assets/32388270/6b9cfc06-ab31-4b9e-a000-e0cf66c4623d)

### 복사 유형
#### 복사 유형
1. 할당 (Assignment)
2. 얕은 복사 (Shallow copy)
3. 깊은 복사 (Deep copy)
#### 1. 할당
- 리스트 복사 예시
    - 할당 연산자(=)를 통한 복사는 해당 객체에 대한 객체 참조를 복사

        ```py
        original_list = [1, 2, 3]
        copy_list = original_list
        print(original_list, copy_list)  # [1, 2, 3] [1, 2, 3]

        copy_list[0] = 'hi'
        print(original_list, copy_list)  # ['hi', 2, 3] ['hi', 2, 3]
        ```

        ![image](https://github.com/ragu6963/TIL/assets/32388270/f5ded019-54d8-40f4-b259-10140e6ff57f)

#### 2. 얕은 복사
- 리스트 얕은 복사 예시
    - 슬라이싱을 통해 생성된 객체는 원본 객체와 독립적으로 존재
        
        ```py
        a = [1, 2, 3]
        b = a[:]
        print(a, b)  # [1, 2, 3] [1, 2, 3]

        b[0] = 100
        print(a, b)  # [1, 2, 3] [100, 2, 3]
        ```

        ![image](https://github.com/ragu6963/TIL/assets/32388270/e6ca0423-4824-4822-bc3f-53d61ed551bd)

- 2차원 리스트와 같이 변경가능한 객체 안에 변경 가능한 객체가 있는 경우
    - a와 b의 주소는 다르지만 내부 객체의 주소는 같기 때문에 함께 변경됨

        ```py
        a = [1, 2, [1, 2]]
        b = a[:]
        print(a, b)  # [1, 2, [1, 2]] [1, 2, [1, 2]]

        b[2][0] = 100
        print(a, b)  # [1, 2, [100, 2]] [1, 2, [100, 2]]
        ```
        
        ![image](https://github.com/ragu6963/TIL/assets/32388270/3ec9f431-47c8-4332-98b8-45ff86550bb0)

    - 얕은 복사의 한계
        ```py
        a = [1, 2, [3, 4, 5]]
        b = a[:]

        b[0] = 999
        b[2][1] = 100

        print(a) # [1, 2, [3, 100, 5]]
        print(b) # [999, 2, [3, 100, 5]]
        ```

#### 3. 깊은 복사
- 리스트 깊은 복사 예시
    - 내부에 중첩된 모든 객체까지 새로운 객체 주소를 참조하도록 함

        ```py
        import copy


        original_list = [1, 2, [1, 2]]
        deep_copied_list = copy.deepcopy(original_list)

        deep_copied_list[2][0] = 100

        print(original_list)  # [1, 2, [1, 2]]
        print(deep_copied_list)  # [1, 2, [100, 2]]
        ```
        
        ![image](https://github.com/ragu6963/TIL/assets/32388270/b352a3ea-6264-46fc-9f84-f5e915b523d0)

