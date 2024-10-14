# 다 대 다
# Many to many relationships
### N:M or M:N
한 테이블의 0개 이상의 레코드가 다른 테이블의 0개 이상의 레코드와 관련된 경우
** 양쪽 모두에서 N:1관계를 가짐


## 중개 모델
Django에서는 'ManyToManyField'로 중개모델을 자동으로 생성

### ManyToManyField()
M:N 관계 설정 모델 필드

- 모델에 ManyToManyField 작성
  - 참조하는 두 모델 중 어느 모델에 작성해도 상관 없으며 참조/역참조 관계만 잘 기억할 것

### 'through' argument
중개 테이블에 '추가 데이터'를 사용해 M:N 관계를 형성하려는 경우 사용

- 예약 생성 방법 중 두 인스턴스 중 하나를 통한 예약 생성 시
  - through_defaults = {'' : ''} 딕셔너리의 형태로 생성

## M:N 관계 주요 사항
- M:N 관계로 맺어진 두 테이블에는 물리적인 변화가 없음
- ManyToManyField는 중개 테이블을 자동으로 생성
- ManyToManyField는 M:N 관계를 맺는 두 모델 어디에 위치해도 상관 없음
  - 대신 필드 작성 위치에 따라 참조와 역참조 방향을 주의
- N:1은 완전한 종속의 관계였지만 M:N은 종속적인 관계가 아니며 '의사에게 진찰받는 환자 & 환자를 진찰하는 의사' 이런 식의 2가지 형태로 모두 대등한 표현 가능

## ManyToManyField(to, **options)
M:N 관계 설정 시 사용하는 모델 필드

- 특징
  - 양방향 관계
    - 어느 모델에서든 관련 객체에 접근할 수 있음
  - 중복 방지
    - 동일한 관계는 한 번만 저장됨

1. 'related_name' arguments
   - 역참조 시 사용하는 manager name을 변경
2. 'symmetrical' arguments
   - 관계 설정 시 대칭 유무 설정
   - ManyToManyField가 동일한 모델을 가리키는 정의에서만 사용
   - 기본값 : True
     - True일 경우
       - source 모델의 인스턴스가 target모델의 인스턴스를 참조하면 자동으로 target 모델 인스턴스도 source 모델 인스턴스를 자동으로 참조하도록 함(대칭)
       - 즉, 내가 당신의 친구라면 자동으로 당신도 내 친구가 됨
     - False일 경우
       - True와 반대(대칭되지 않음)

                                  - source 모델
                                    - 관계를 시작하는 모델
                                  - target 모델
                                    - 관계의 대상이 되는 모델
3. 'through' arguments
   - 사용하고자 하는 중개모델을 지정
   - 일반적으로 '추가 데이터를 M:N 관계와 연결하려는 경우'에 활용

### M:N에서의 대표 조작 methods
- add()
  - 관계 추가
  - "지정된 객체를 관련 객체 집합에 추가"
- remove()
  - 관계 제거
  - "관련 객체 집합에서 지정된 모델 객체를 제거"


# 좋아요
## Many to many relationships
### N:M or M:N
한 테이블의 0개 이상의 레코드가 다른 테이블의 0개 이상의 레코드와 관련된 경우
** 양쪽 모두에서 N:1관계를 가짐

### Article(M) - User(N)
0개 이상의 게시글은 0명 이상의 회원과 관련
- 게시글은 회원으로부터 0개 이상의 좋아요를 받을 수 있고, 회원은 0개 이상의 게시글에 좋아요를 누를 수 있음

### 모델 관계 설정
1. Article 클래스에 ManyToManyField 작성
![alt text](image-75.png)
2. Migration 진행 후 에러 발생
![alt text](image-76.png)
3. related_name 작성 후 Migration 재진행
![alt text](image-77.png)


#### 역참조 매니저 충돌
1.  
- N:1
  - "유저가 작성한 게시글"
  - user.article_set.all()
- M:N
  - "유저가 좋아요 한 게시글"
  - user.article_set.all()

1. 
- like_users 필드 생성 시 자동으로 역참조 매니저 .article_set가 생성됨
- 그러나 이전 N:1(Article-User) 관계에서 이미 같은 이름의 매니저를 사용 중
  - user.article_set.all() -> 해당 유저가 작성한 모든 게시글 조회
- 'user가 작성한 글(user.article_set)'과 'user가 좋아요를 누른 글(user.article_set)'을 구분할 수 없게 됨
- **user와 관계된 ForeignKey 혹은 ManyToManyField 둘 중 하나에 related_name 작성 필요**


### User - Article 간 사용 가능한 전체 related manager
- article.user
  - 게시글을 작성한 유저 - N:1
- user.article_set
  - 유저가 작성한 게시글(역참조) - N:1
- article.like_users
  - 게시글을 좋아요 한 유저 - M:N
- user.like_articles
  - 유저가 좋아요 한 게시글(역참조) - M:N


## 좋아요 기능 구현
1. url 작성
![alt text](image-78.png)

2. view 함수
![alt text](image-79.png)

3. index 템플릿에서 각 게시글에 좋아요 버튼 출력
![alt text](image-80.png)