# ORM
### Object-Relational-Mapping
- 객체 지향 프로그래밍 언어를 사용하여 호환되지 않는 유형의 시스템 간에 데이터를 변환하는 기술
- Django에 내장된 ORM이 django와 db간 언어의 차이를 해석

## QuerySet API _ 중요!
- Python의 모델 클래스와 인스턴스를 활용해 DB에 데이터를 저장(C), 조회(R), 수정(U), 삭제(D)하는 것
- ORM에서 데이터를 검색, 필터링, 정렬 및 그룹화 하는데 사용하는 도구
  - API를 사용하여 SQL이 아닌 Python 코드로 데이터를 처리

- 구문

![alt text](image-14.png)


## Query
- 데이터베이스에 특정한 데이터를 보여달라는 요청
- 쿼리문 작성
  - 원하는 데이터를 얻기 위해 데이터베이스에 요청을 보낼 코드 작성
- 파이썬으로 작성한 코드가 ORM에 의해 SQL로 변환되어 데이터베이스에 전달
- 데이터베이스의 응답 데이터를 ORM이 QuerySet 자료 형태로 변환하여 우리에게 전달

## QuerySet
- 데이터베이스에게서 전달 받은 객체 목록(데이터 모음)
  - 순회가 가능한 데이터로써 1개 이상의 데이터를 불러와 사용할 수 있음
- Django ORM을 통해 만들어짐
- 단, 데이터베이스가 단일한 객체를 반환할 때는 QuerySet이 아닌 모델(Class)의 인스턴스로 반환

### CRUD
소프트웨어가 가지는 기본적인 데이터 처리 기능
- Create (저장)
- Read (조회)
- Update (갱신)
- Delete (삭제)

## * QuerySet API를 위한 라이브러리 설치 및 설정
```py
$ pip install ipython
$ pip install django-extensions
# settings.py - APPS에 추가

$ pip freeze > requirements.txt

$ python manage.py migrate # db
$ python manage.py shell_plus # 장고 쉘 실행
```

## Django Shell
- Django 환경 안에서 실행되는 python shell
- 입력하는 QuerySet API 구문이 Django 프로젝트에 영향을 미침


# 전체 게시글 조회

# Create
## 데이터 객체를 만드는 3가지 방법
### 첫 번째
```py
# 특정 테이블에 새로운 행을 추가하여 데이터 추가

>>> article = Article() # Article(class)로부터 article(instance) 생성
>>> article

>>> article.title = 'first' # 인스턴스 변수(title)에 값 할당
>>> article.content = 'django!' # 인스턴스 변수(content)에 값 할당

# save를 하지 않으면 아직 DB에 값이 저장되지 않음
>>> article

>>>Article.object.all()

# save를 호출하고 확인하면 저장된 것을 확인
>>> article.save()
>>> article

>>> article.id

>>> article.pk
>>>Article.objects.all()

# 인스턴스 article을 활용하여 인스턴스 변수 활용하기
>>> article.title
>>> article.content

>>> article.created_at
```

### 두 번쨰
```py
>>> article = Article(title='second', content ='django!')

>>> article

# save를 호출해야 저장됨
>>> article.save()
>>> article

>>> Article.object.all()

# 값 확인
>>> article.pk
>>> article.title
>>> article.content
```

### 세번째
```py
# 위 2가지 방법과 달리 바로 저장 이후 바로 생성된 데이터가 반환
>>> Article.objects.create(title='third', content='django!')
```

- save() : 객체를 데이터베이스에 저장하는 인스턴스 메서드

# Read
- 대표적인 조회 메서드
  - Return new QuertSets
    - all() : 전체 데이터 조회
    - filter() : 주어진 매개변수와 일치하는 객체를 포함하는 QuerySet 반환
  - Do not return QuertSets
    - get() : 주어진 매개변수와 일치하는 객체를 반환
      - get() 특징
        - 객체를 찾을 수 없으면 DoesNotExist 예외를 발생시키고,
        - 둘 이상의 객체를 찾으면 MultipleObjectsReturned 예외를 발생시킴
        - *중요! 위와 같은 특징을 가지고 있기 때문에 primary key와 같이 고유성(uniqueness)을 보장하는 조회에서 사용해야 함

# Uqdate
## 데이터 수정
```py
# 인스턴스 변수를 변경 후 save 메서드 호출
>>> article = Article.objects.get(pk=1) # 조회
>>> article.title = 'byebye'  # 변경

>>> article.save()  # 저장
>>> article.title # 확인
```

# Delete
## 데이터 삭제
```py
# 삭제하려는 데이터 조회 후 delete 메서드 호출
>>> article = Article.objects.get(pk=1) # 조회

>>> article.delete()  # 삭제 - 삭제된 객체가 반환

>>> Article.objects.get(pk=1) # 조회 불가
DoesNotExist
```


# 단일 게시글 조회

# Read
```py
# urls.py
urlpatterns = [
  ...
  path('<int:pk>/', views.detail, name='detail'),
]


# view.py
def detail(request, pk):
  article = Article.objects.get(pk=pk)
  context = {
    'article' : article,
  }
  return render(request, 'articles/detail.html', context)
```

- *Create 로직을 구현하기 위해 필요한 view 함수의 개수는 2개다.
1. 사용자 입력 데이터를 받을 페이지 렌더링 함수 - new
2. 사용자가 입력한 요청 데이터를 받아 DB에 저장하는 함수 - create

### new 기능 구현
```py
# urls.py
urlpatterns = [
  ...
  path('new/', views.new, name='new'),
]


# view.py
def new(request):
  return render(request, 'articles/detnewail.html')
```

### create 기능 구현
```py
# urls.py
urlpatterns = [
  ...
  path('create/', views.create, name='create'),
]

# view.py
def create(request):
  # 1. 사용자 요청으로부터 입력 데이터를 추출
  title = request.GET.get('title')
  content = request.GET.get('content')

  # 저장 1
  # article = Article()
  # article.title = title
  # article.content = content
  # article.save()

  # 저장 2
  article = Article(title=title, content=content)
  article.save()

  # 저장 3
  # Article.objects.create(title=title, content=content)

  return render(request, 'articles/create.html')
```

# HTTP request methods
## HTTP
- 네트워크 상에서 데이터(리소스)를 주고 받기 위한 약속

## HTTP request methods
- 데이터에 대해 수행을 원하는 작업을 나타내는 것
  - 서버에게 원하는 작업의 종류를 알려주는 역할
- 클라이언트가 웹 서버에 특정 동작을 요청하기 위해 사용하는 표준 명령어
- 대표 메서트
  - GET, POST

### 'GET' Method
- 서버로부터 데이터를 요청하고 받아오는 데 사용 : 조회
1. 데이터 전송
   - URL의 쿼리 문자열(Query String)을 통해 데이터를 전속
2. 데이터 제한
   - URL 길이에 제한이 있어 대량의 데이터 전송에는 적합하지 않음
3. 브라우저 히스토리
   - 요청 URL이 브라우저 히스토리에 남음
4. 캐싱
   - 브라우저는 GET 요청의 응답을 로컬에 저장할 수 있음
   - 동일한 URL로 다시 요청할 때, 서버에 접속하지 않고 저장된 결과를 사용
   - 페이지 로딩 시간을 크게 단축

- 사용 예시
  - 검색 쿼리 전송
  - 웹 페이지 요청
  - API에서 데이터 조회 등에 사용

### 'POST' Method
- 서버에 데이터를 제출하여 리소스를 변경 하는데 사용 : 생성, 수정, 삭제
1. 데이터 전송
   - HTTP Body를 통해 데이터를 전송
2. 데이터 제한
   - GET에 비해 더 많은 양의 데이터를 전송할 수 있음
3. 브라우저 히스토리
   - POST 요청은 브라우저 히스토리에 남지 않음
4. 캐싱
   - POST 요청은 기본적으로 캐시할 수 없음
   - POST 요청이 일반적으로 서버의 상태를 변경하는 작업을 수행하기 때문

- 사용 예시
  - 로그인 정보 제출
  - 파일 업로드
  - 새 데이터 생성
  - API에서 데이터 변경 요청

- GET : 데이터 조회
- POST : 데이터 생성이나 수정

# HTTP response status code
- 서버가 클라이언트의 요청에 대한 처리 결과를 나타내는 3자리 숫자
  - 클라이언트에게 요청 처리 결과를 명확히 전달
  - 문제 발생 시 디버깅에 도움
  - 웹 애플리케이션의 동작을 제어하는 데 사용


## 예시
- 403 Forbidden
  - 서버에 요청이 전달되었지만, 권한 때문에 거절 됨
  - 'CSRF token이 누락됨'

## CSRF _ Cross-Site-Request-Forgery
- 사이트 간 요청 위조
  - 사용자가 자신의 의지와 무관하게 공격자가 의도한 행동을 하여 특정 웹 페이지를 보안에 취약하게 하거나 수정, 삭제 등의 작업을 하게 만드는 공격 방법

### CSRF Token 적용
- DTL의 csrf_token 태그를 사용해 손쉽게 사용자에게 토큰 값을 부여
- 요청 시 토큰 값도 함께 서버로 전송될 수 있도록 하는 것

```py
# templates/articles/new.html
{% csrf_token %}
```
### 요청 시 CSRF Token을 함께 보내야 하는 이유
- Django 서버는 해당 요청이 DB에 데이터를 하나 생성하는(DB에 영향을 주는)요청에 대해 "Django가 직접 제공한 페이지에서 데이터를 작성하고 있는 것인지"에 대한 확인 수단이 필요
- 겉모습이 똑같은 위조 사이트나 정상적이지 않은 요청에 대한 방어 수단
- 기존
  - 요청 데이터 -> 게시글 작성
- 변경
  - 요청 데이터 + 인증 토큰 -> 게시글 작성

### POST일 때만 Token을 확인하는 이유
- POST는 단순 조회를 위한 GET과 달리 특정 리소스에 변경(생성, 수정, 삭제)을 요구하는 의미와 기술적인 부분을 가지고 있기 때문
- DB에 조작을 가하는 요청은 반드시 인증 수단이 필요
- 데이터베이스에 대한 변경사항을 만드는 요청이기 때문에 토큰을 사용해 최소한의 신원확인을 하는 것


# Redirect
## 서버는 데이터 저장 후 페이지를 응답하는 것이 아닌 사용자를 적절한 기존 페이지로 보내야 한다.
- "사용자를 보낸다." -> "사용자가 GET 요청을 한 번 더 보내도록 해야 한다.
- **실제로 서버가 클라이언트를 직접 다른 페이지로 보내는 것이 아닌 클라이언트가 GET 요청을 한 번 더 보내도록 응답하는 것

- redirect()
  - 클라이언트가 인자에 작성된 주소로 다시 요청을 보내도록 하는 함수

```py
# view.py
from django.shortcuts import render, redirect

def create(request):
  title = request.POST.get('title')
  content = request.POST.get('content')
  article = Article(title=title, content=content)
  article.save()

  return redirect('articles:detail', article.pk)
```


# Delete
## 기능 구현
```py
# urls.py
urlpatterns = [
  ...
  path('<int:pk>/delete/', views.delete, name='delete'),
]

# view.py
def delete(request, pk):
  article = Article.objects.get(pk=pk)
  article.delete()
  return redirect('articles:index')
```

# Update
## Update 로직을 구현하기 위해 필요한 view 함수
1. 사용자 입력 데이터를 받을 페이지를 렌더링 - edit
2. 사용자가 입력한 데이터를 받아 DB에 저장 - update

## edit 기능 구현
```py
urlpatterns = [
  ...
  path('<int:pk>/edit/', views.edit, name='edit'),
]

# view.py
def edit(request, pk):
  article = Article.objects.get(pk=pk)
  conext = {
    'article' : article,
  }
  return render(request, 'articles/edit.html', context)
```

## update 기능 구현
```py
urlpatterns = [
  ...
  path('<int:pk>/update/', views.update, name='update'),
]

# views.py
def update(request, pk):
  # 1. 어떤 게시글 수정할 지 조회
  article = Article.objects.get(pk=pk)
  # 2. 사용자로부터 받은 새로운 입력 데이터 추출
  title = request.POST.get('title')
  content = request.POST.get('content')

  # 3. 기존 게시글의 데이터를 사용자로 받은 데이터로 새로 할당
  article.title = title
  article.content = content
  # 4. 저장

  return redirect('articles:detail', article.pk)
```