# Web
- Web site, Web application 등을 통해 사용자들이 정보를 검색하고 상호 작용하는 기술
#### Web site
- 인터넷에서 여러개의 Web page가 모인 것으로, 사용자들에게 정보나 서비스를 제공하는 공간
#### Web page
- HTML, CSS등의 웹 기술을 이용하여 만들어진, "Web site"를 구성하는 하나의 요소
#### World wide web
- 인터넷으로 연결된 컴퓨터들이 정보를 공유하는 거대한 정보 공간


- web page 구성요소
![alt text](image.png)

# 웹 구조화
## HTML
- HyperText Markup Language
- 웹 페이지의 의미와 구조를 정의하는 언어
#### Hypertext
- 웹 페이지를 다른 페이지로 연결하는 링크
- 참조를 통해 사용자가 한 문서에서 다른 문서로 즉시 접근할 수 있는 텍스트
- 비선형성 / 상호 연결성 / 사용자 주도적 탐색

#### Markup Language
- 태그 등을 이용하여 문서나 데이터의 구조를 명시하는 언어
- Markup Language 예시
![alt text](image-1.png)

```bash
- <!DOCTYPE html>
  - 해당 문서가 html 문서라는 것을 나타냄

- <html></html>
  - 전체 페이지의 콘텐츠를 포함

- <title></title>
  - 브라우저 탭 및 즐겨찾기 시 표시되는 제목으로 사용

- <head></head>
  - HTML 문서에 관련된 설명, 설정 등 컴퓨터가 식별하는 메타데이터를 작성
  - 사용자에게 보이지 않음

- <body></body>
  - HTML 문서의 내용을 나타냄
  - 페이지에 표시되는 모든 콘텐츠를 작성
  - 한 문서에 하나의 body요소만 존재
```
- HTML Element(요소)
  - 하나의 요소를 여는 태그와 닫는 태그 그리고 그 안의 내용으로 구성됨
  - 닫는 태그는 태그 이름 앞에 슬래시가 포함됨 
    - 닫는 태그가 없는 태그도 존재 
![alt text](image-2.png)

- HTML Attributes(속성)
  - 사용자가 원하는 기준에 맞도록 요소를 설정하거나 다양한 방식으로 요소의 동작을 조절하기 위한 값
  - 목적
    - 나타내고 싶지 않지만 추가적인 기능, 내용을 담고 싶을 때 사용
    - CSS에서 스타일 적용을 위해 해당 요소를 선택하기 위한 값으로 활용됨

  - 속성 작성 규칙
  1. 속성은 요소 이름과 속성 사이에 공백이 있어야 함
  2. 하나 이상의 속성들이 있는 경우엔 속성 사이에 공백으로 구분
  3. 속성 값은 열고 닫는 따옴표로 감싸야 함.
![alt text](image-3.png)

- 자주 사용하는 태그
  - "a 태그"
  - "img 태그"

### HTML Text structure
- HTML의 주요 목적 중 하나는 텍스트 구조와 의미를 제공하는 것

- 대표적인 HTML Text structure
```bash
- Heading & Paragraphs
  - h1~6, p

- Lists
  - ol, ul, li

- Emphasis & Importance
  - em, strong
```
- 예시
![alt text](image-4.png)

## HTML 스타일 가이드
![alt text](image-10.png)
```bash
- 대소문자 구분
  - HTML은 대소문자를 구분하지 않지만, 소문자 사용을 강력히 권장
  - 태그명과 속성명 모두 소문자로 작성

- 속성 따옴표
  - 속성 값에는 큰 따옴표(")를 사용하는 것이 일반적

- 공백 처리
  - HTML은 연속된 공백을 하나로 처리
  - Enter키로 줄 바꿈을 해도 브라우저에서 인식하지 않음
    (줄 바꿈 태그를 사용해야 함)

- **에러 출력 없음**
  - HTML은 문법 오류가 있어도 별도의 에러 메시지를 출력하지 않음

- 코드 구조와 포맷팅
  - 일관된 들여쓰기를 사용 (보통 2칸 공백)
  - 각 요소는 한 줄에 하나씩 작성
  - 중첩된 요소는 한 단계 더 들여쓰기
```

## CSS 스타일 가이즈
```bash
- 코드 구조와 포맷팅
  - 일관된 들여쓰기를 사용 (보통 2칸 공백)
  - 선택자와 속성은 각각 새 줄에 작성
  - 중괄호 앞에 공백 넣기
  - 속성 뒤에는 콜론(:)과 공백 넣기
  - 마지막 속성 뒤에는 세미콜론(;) 넣기

- 선택자 사용
  - class 선택자를 우선적으로 사용
  - id, 요소 선택자 등은 가능한 피할 것
    - 여러 선택자들과 함계 사용할 경우 우선순위 규칙에 따라 예기치 못한 스타일 규칙이 적용되어 전반적인 유지보수가 어려워지기 때문

- 속성과 값
  - 속성과 값은 소문자로 작성
  - 0 값에는 단위를 붙이지 않음

- 명명 규칙
  - 클래스 이름은 의미 있고 목적을 나타내는 이름을 사용
  - 케밥 케이스(kebab-case)를 사용
  - 약어보다는 전체 단어를 사용

- CSS 적용 스타일
  - 인라인(inline) 스타일은 되도록 사용하지 말 것
    - CSS와 HTML 구조 정보가 혼합되어 작성되기 때문에 코드를 이해하기 어렵게 만듦
```

# 웹 스타일링
## CSS
- Cascading Style Sheet
- 웹 페이지의 디자인과 레이아웃을 구성하는 언어

- CSS 구문
  - ';'은 선언의 종료
![alt text](image-5.png)

### CSS 적용방법
#### 인라인(Inline) 스타일
- HMTL 요소 안에 style 속성 값으로 작성
![alt text](image-6.png)

#### 내부(Internal) 스타일 시트
- head 태그 안에 style 태그에 작성 ![alt text](image-7.png)

#### 외부(External) 스타일 시트
- 별도 CSS 파일 생성 후 HTML link 태그를 사용해 불러오기
![alt text](image-8.png)

### CSS Selectors 종류
```bash
- 기본 선택자
  - 전체(*) 선택자 : HTML 모든 요소를 선택
  - 요소(tag) 선택자 : 지정한 모든 태그를 선택
  - 클래스(class) 선택자('.' (dot)) : 주어진 속성을 가진 모든 요소를 선택
  - 아이디(id) 선택자('#') : 주어진 아이디 속성을 가진 요소 선택(문서에는 주어진 아이디를 가진 요소가 하나만 있어야 함)
  - 속성(attr) 선택자 등

- 결합자(Combinators)
  - 자손 결합자("" (space)) : 첫 번째 요소의 자손 요소들 선택 
   예) p span은 <p> 안에 있는 모든 <span>를 선택(하위 레벨 상관 없이)
  - 자식 결합자(">") : 첫 번쨰 요소의 직계 자식만 선택
   예) ul > li은 <ul> 안에 있는 모든 <li>를 선택(한 단계 아래 자식들만)
```

#### Specificity_ 명시도
- 결과적으로 요소에 적용할 CSS 선언을 결정하기 위한 알고리즘
- CSS Selector에 가중치를 계산하여 어떤 스타일을 적용할 지 결정
  - 동일한 요소를 가리키는 2개 이상의 CSS 규칙이 있는 경우, 가장 높은 명시도를 가진 Selector가 승리하여 스타일이 적용됨

- Cascade_ 계단식
  - 한 요소에 동일한 가중치를 가진 선택자가 적용될 때, CSS에서 마지막에 나오는 선언이 사용됨
- 명시도가 높은 순
  1. Importance
    - !important
  2. Inline 스타일
  3. 선택자
    - id 선택자 > **class 선택자** > 요소 선택자
  4. 소스 코드 선언 순서

- !impotant
  - 다른 우선순위 규칙보다 우선하여 적용하는 키워드
  - Cascade 구조를 무시하고 강제로 스타일을 적용하는 방식이므로 특수한 경우에만 사용

#### CSS 상속
- CSS는 상속을 통해 부모 요소의 속성을 자식에게 상속해 재사용성을 높임
  - 상속 되는 속성
    - Text 관련 요소(font, color, text-align), opacity, visibility 등
  - 상속 되지 않는 속성
    - Box model 관련 요소(width, height, border, box-sizing ...)
    position 관련 요소(position, top/right/bottom/left, z-index) 등


### CSS Box Model
- 웹 페이지의 모든 HTML 요소를 감싸는 사각형 상자 모델
![alt text](image-9.png)

- Box 구성 요소
![alt text](image-12.png)

- Content box
  - 실제 콘텐츠가 표시되는 영역 크기
  - width 및 height 속성을 사용하여 크기 조정
- Padding box
  -콘텐츠 주위에 있는 공백
  - padding 관련 속성을 사용하여 크기 조정
- Border box
  - 콘텐츠와 패딩을 래핑
  - border 관련 속성을 사용하여 크기 조정
- Margin box
  - 콘텐츠, 패딩 및 테두리를 래핑
  - 박스와 다른 요소 사이의 공백
  - margin 관련 속성을 사용하여 크기 조정

- 테두리를 결정할 때 색, 굵기, 종류를 먼저 결정

#### 박스 타입
1. Block box
2. Inline box

- 박스 타입에 따라 페이지에서의 **배치 흐름** 및 다른 박스와 관련항 박스가 동작하는 방식이 달라짐

#### Normal flow
- 일반적인 흐름 또는 레이아웃을 변경하지 않은 경우 웹 페이지 요소가 배치되는 방식
![alt text](image-11.png)
#### 박스 표시(Display) 타입
```bash
1. Outer display type - 박스가 문서 흐름에서 어떻게 동작할 지를 결정
- 속성
  - block 특징
    - 항상 새로운 행으로 나뉨- 다음 행으로 넘어감
    - width와 height 속성 사용 가능
    - padding, margin, border로 인해 다른 요소를 상자로부터 밀어냄
    - width 속성을 지정하지 않으면 박스는 inline 방향으로 사용가능한 공간을 모두 차지함
      - 상위 컨테이너 너비 100%로 채우는 것
    - 대표적인 block 타입 태그
      - h1~6, p, div
  
  - inline 특징
    - 새로운 행으로 넘어가지 않음
    - width와 height 속성을 사용할 수 없음
    - 수직 방향
      - padding, margin, border가 적용되지만 다른 요소를 밀어낼 수는 없음
    - 수직 방향
      - padding, margins, borders가 적용되어 다른 요소를 밀어낼 수 있음
    - 대표적인 inline 타입 태그
      - a, img, span, strong, em
```

#### shortand 속성
- 'border'
  - border-width, border-style, border-color를 한 번에 설정하기 위한 속성

- 'margin' & 'padding'
  - 4 방향의 속성을 각각 지정하지 않고 한 번에 지정할 수 있는 속성![alt text](image-13.png)

```bash
.box{
  border: 1px dotted black; 
      /* 한 방에 작성 가능 */
  padding: 25px 50px;
  margin: 25px auto;
      /* 상하 사이즈 먼저, 좌우 사이즈 - 좌우를 auto로 주면 균등하게 분배(가운데 정렬) */
}
```

#### box-sizing 속성
- 표준 상자 모델에서 width와 height 속성값을 설정하면 이 값은 content box 크기를 조정하게 됨.
![alt text](image-14.png)

#### 기타 display 속성
- 'inline-block'
  - inline과 block 요소 사이의 중간 지점을 제공하는 display 값
  - width 및 height 속성 사용 가능
  - padding, margin 및 border로 인해 다른 요소가 상자에서 밀려남
  - 새로운 행으로 넘어가지 않음
    - 요소가 줄 바꿈 되는 것을 원하지 않으면서 너비와 높이를 적용하고 싶은 경우에 사용

- 'none'
  - 요소를 화면에 표시하지 않고, 공간조차 부여되지 않음


## CSS Layout
- 각 요소의 위치와 크기를 조정하여 웹 체이지의 디자인을 결정하는 것
  - Display, Position, Flexbox 등

## CSS Position
- 요소를 Normal Flow에서 제거하여 다른 위치로 배치하는 것
  - 다른 요소 위에 올리기, 화면의 특정 위치에 고정시키기 등
- position 이동 방향
![alt text](image-15.png)

#### Position 유형
- static
  - 요소를 Normal Flow에 따라 빼치
  - top, right, bottom, left 속성이 적용되지 않음
  - 기본 값

- relative
  -요소를 Normal Flow에 따라 빼치
  - 자신의 원래 위치(static)을 기준으로 이동
  - top, right, bottom, left 속성으로 위치를 조정
  - 다른 요소의 레이아웃에 영향을 주지 않음(요소가 차지하는 공간은 static일 때와 같음)

- absolute - 절대
  - 요소를 Normal Flow에서 제거
  - 가장 가까운 relative 부모 요소를 기준으로 이동
    - 만족하는 부모 요소가 없다면 body 태그를 기준으로 함
  - top, right, bottom, left 속성으로 위치를 조정
  - 문서에서 요소가 차지하는 공간이 없어짐

- fixed - 웹툰 리모컨
  - 요소를 Normal Flow에서 제거
  - 현재 화면영역(viewport)을 기준으로 이동
  - 스크롤해도 항상 같은 위치에 유지됨
  - top, right, bottom, left 속성으로 위치를 조정
  - 문서에서 요소가 차지하는 공간이 없어짐

- sticky
  - relative와 fixed의 특성을 결합한 속성
  - 스크롤 위치가 임계점에 도달하기 전에는 relative처럼 동작
  - 스크롤이 특정 임계점에 도달하면 fixed처럼 동작하여 화면에 고정됨
  - 만약 다음 sticky 요소가 나오면 다음 sticky 요소가 이전 sticky 요소의 자리를 대체
    - 이전 sticky 요소가 고정되어 있던 위치와 다음 sticky 요소가 고정되어야 할 위치가 겹치게 되기 때문
  
#### z-index
- 요소의 쌓임 순서(stack order)를 정의하는 속성
- 정수 값을 사용해 Z축 순서를 지정
- 값이 클수록 요소가 위에 샇이게 됨
- static이 아닌 요소에만 적용됨

- 기본값은 auto
- 부모 요소의 z-index 값에 영향을 받음
- 같은 부모 내에서만 z-index 값을 비교
- 부모의 z-index가 낮으면 자식의 z-index가 아무리 높아도 부모보다 위로 올라갈 수 없음
- z-index 값이 같으면 HTML 문서 순서대로 쌓임

## CSS Flexbox
- 요소를 행과 열 형태로 배치하는 1차원 레이아웃 방식
  - **공간 배열 & 정렬**
- Inner display type
```bash
Inner display type
- 박스 내부의 요소들이 어떻게 배치될 지를 결정

- 속성
  - flex
```

**Flexbox**
![alt text](image-16.png)
- main axis (주 축)
  - flex item들이 배치되는 기본 축
  - main start에서 시작하여 main end 방향으로 배치 (기본 값)
- cross axis (교차 축)
  - main axis에 수직인 축
  - cross start에서 시작하여 cross end 방향으로 배치 (기본 값)

- Flex Container
  - display: flex; 혹은 displayL inline-flex; 가 설정된 부모 요소
  - 이 컨테이너의 1차 자식 요소들이 Flex item이 됨
  - flexbox 속성 값들을 사용하여 자식 요소 Flex item들을 배치하는 주체
- Flex item
  - flex container 내부에 레이아웃 되는 항목

### Flexbox 속성 목록
- Flex Contatiner 관련 속성
![alt text](image-17.png)

1. Flex Contatiner 지정
- flex item은 기본적으로 행(주 축의 기본값인 가로 방향)으로 나열
- flex item은 주 축의 시작 선에서 시작
- flex item은 교차 축의 크기를 채우기 위해 늘어남

2. flex-direction
- flex item이 나열되는 방향을 지정
- column으로 지정할 경우 주 축이 변경됨
- "-reverse"로 지정하면 flex item 배치의 시작 선과 끝 선이 서로 바뀜

3. flex-wrap
- flex item 목록이 flex container의 한 행에 들어가지 않을 경우 다른 행에 배치할 지 여부 설정

4. justify-content
- 주 축을 따라 flex item과 주위에 공간을 분배

5. align-content
- 교차 축을 따라 flex item과 주위에 공간을 분배
  - flex-wrap이 wrap 또는 wrap-reverse로 설정된 여러 행에만 적용됨
  - 한 줄 짜리 행에는 효과 없음(flex-wrap이 nowrap으로 설정된 경우)

6. align-items
- 교차 축을 따라 flex item 행을 정렬

7. align-self
- 교차 축을 따라 개별 flex item을 정렬

![alt text](image-18.png)

8. flex-grow
- 남는 행 여백을 비율에 따라 각 flex item에 분배
  - 아이템이 컨테이너 내에서 확장하는 비율을 지정
- flex-grow의 반대는 flex-shrink

9. flex-basis
- flex item의 초기 크기 값을 지정
- flex-basis와 width 값을 동시에 적용한 경우 flex-basis가 우선

### 반응형 레이아웃
- 다양한 디바이스와 화면 크기에 자동으로 적응하여 콘텐츠를 최적으로 표시하는 웹 레이아웃 방식


### 마진 상쇄 (Margin collapsing)
- 두 block 타입 요소의 margin top과 bottom이 만나 더 큰 margin으로 결합되는 현상
- 복잡한 레이아웃에서 요소 간 간격을 일관되게 유지하기 위함
- 요소 간의 간격을 더 예측 가능하고 관리하기 쉽게 만듦