- [관통프로젝트 연습](#관통프로젝트-연습)
  - [실습01](#실습01)
# 관통프로젝트 연습


** 인터넷 날씨 정보를 가져와 정보 출력

서버와 클라이언트
- 서버 : 요청을 받아서 처리해주거나, 원하는 값을 돌려주는 역할
- 클라이언트 : 정보를 요청하는 역할

클라이언트가 서버에 요청하는 두 가지 방법
1. 웹 브라우저(크롬)을 켜서 주소창에 url(주소) 입력
2. 서버에 정보를 요청하는 파이썬 코드 작성


requests : 브라우저처럼 파이썬에서 서버에 요청을 보낼 수 있는 패키지

```python
$ pip install requests
```
존재하지 않는 패키지를 import 하려하면 오류 밑줄이 뜸.



url
- 요청을 보내는 서버의 주소

requests.get(url)
- 해당 서버(url)에 데이터를 달라고 요청을 보내는 함수

.json()
- 내부 데이터를 json(딕셔너리와 비슷) 형태로 변환해주는 함수



*** API
- 클라이언트가 원하는 기능을 수행하기 위해서 서버 측에 만들어 놓은 프로그램
  기능 예시 : 데이터 저장, 조회,  수정, 삭제 등
- 서버 측에 특정 주소로 요청이 오면 정해진 기능을 수행하는 API를 미리 만들어 둡니다.
  클라이언트는 서버가 미리 만들어 놓은 주소로 요청을 보냄


![image](API.PNG)



오픈 API
- 외부에서 사용할 수 있도록 무료로 개방된 API
- 사용법은 공식문서(Docs)에 명시돼 있음.

- 너무 많은 계정에서 동시 요청하면 서버가 견디지 못하기에 
**오픈API는 API KEY를 활용하여 사용자를 확인

- 서버에 요청할 때 마다 해당 API key를 함꼐 보내 정상적인 사용자인 것을 확인 받음.
- 일부 오픈 API는 사용량이 제한돼 있다.
-- 따라서 일일 및 월간 사용량 제한을 확인해야한다. 사용량이 초과될 경우 요금이 청구될 수 있다.




JSON
JavaScript Object Notation의 약자_ 자바스크립트 객체 표기법
- 데이터를 저장하거나 전송할 때 많이 사용되는 경량의 텍스트 기반의 데이터 형식
- 통신 방법이나 프로그래밍 문법이 아니라 단순히 데이터를 표현하는 방법 중 하나

** 특징
  - 데이터는 중괄호{}로 둘러싸인 - 키-값 상의 집합으로 표현
  - 키 = 문자열 / 값 = 다양한 데이터 유형을 가질 수 있다.
  - 값은 쉼표(,)로 구분됨

** 참고
- 파싱(Parksing): 데이터를 의미 있는 구조로 분석하고 해석하는 과정
- json.loads() : JSON 형식의 문자열을 파싱하여 python Dictionary로 변환


## 실습01
날씨 데이터 수집

- OpenWeatherMap API


```python
import requests
from pprint import pprint
city = 'Seoul,KR'
api_key = 'API_KEY' # 본인 API KEY

# 공식문서 API 활용법 url
url = f'https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={api_key}'

response = requests.get(url).json()
pprint(response)
```