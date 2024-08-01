
- [open AI 활용](https://github.com/Jim-bu/TIL/blob/master/openAI.md)
  
# open AI 활용

```python
# 필요 라이브러리 설치
!pip install openai

#API-KEY 설정
OPENAI_API_KEY = " "
```

```python
# API role 지정
from openai import OpenAI
client = OpenAI(api_key=OPENAI_API_KEY)

# 페르소나 지정 및 기존 대화 내용 저장
conversation_history = [
    {"role": "system", "content": " "},
    {"role": "system", "content": " "},
]
# 질문
conversation_history.append(
    {
        "role": "user",
        "content": " ",
    }
)

# API 호출
response = client.chat.completions.create(
    model="gpt-3.5-turbo",  # 사용하려는 모델 (필수 지정)
    messages=conversation_history,  # 대화 메시지 목록 (필수 지정)
    max_tokens=500,  # 생성될 응답의 최대 토큰 수 (값의 범위: 1~모델 마다 최대값 ex> gpt-3.5-turbo: 16,385 tokens)
    temperature=1.0,  # 확률 분포 조정을 통한 응답의 다양성 제어 (값의 범위: 0~2)
    top_p=1.0,  # 누적 확률 값을 통한 응답의 다양성 제어 (값의 범위: 0~1)
    n=2,  # 생성할 응답 수 (1이상의 값)
    seed=1000 # 랜덤 씨드 값
)
# 응답 출력
for response in response.choices :
  print(f"Assistant: {response.message.content}")
```

```python
# multi-turn 대화_ 이어서 대화하기(이전 대화를 기억)
from openai import OpenAI
client = OpenAI(api_key=OPENAI_API_KEY)

conversation_history = [
{"role": "system",
"content":
'''
<페르소나>
# 역할


# 성격


# 말투

</페르소나>

<GPT 지침>
-
 <GPT 지침/>
 '''
}]

# '종료' 입력 전까지 대화
user_input = ''
while True:
    user_input = input("You: ")
    if "종료" in user_input : break
    conversation_history.append({"role": "user", "content": user_input})

    response = client.chat.completions.create(
        model="gpt-3.5-turbo",
        messages=conversation_history,
        temperature=1.2,  # 확률 분포 조정을 통한 응답의 다양성 제어 (값의 범위: 0~2)
        top_p=0.6,  # 누적 확률 값을 통한 응답의 다양성 제어 (값의 범위: 0~1)
        max_tokens=500,# 생성될 응답의 최대 토큰 수,
    )

    assistant_reply = response.choices[0].message.content
    conversation_history.append({"role": "assistant", "content": assistant_reply})

    print(f"Assistant: {assistant_reply}")
```

```python
#생각의 사슬 [틀린 답을 내놓으 수도 있음]
#올바른 문제 해결 절차를 예시로 제공함으로써 GPT는 해당 절차대로 풀이하게 되어 바른 답변 도출할 확률이 커짐
from openai import OpenAI
client = OpenAI(api_key=OPENAI_API_KEY)

# 페르소나 지정 및 맥락 정보 제공
conversation_history = [
    {"role": "system",
     "content":
'''
당신은 질문에 대해 논리적으로 정답을 도출해야 합니다.
아래와 같은 예시를 통해 질문에 대한 정답을 도출하세요.

**질문:**
농부 존은 여러 종류의 과일을 재배하고 있습니다.
그는 사과와 오렌지를 각각 일정 수확량으로 재배하고 있으며, 두 과일의 총 수확량이 5kg입니다.
사과 한 개의 무게는 200g이고, 오렌지 한 개의 무게는 150g입니다.
두 과일 개수의 총합은 30개입니다.
사과와 오렌지의 개수를 구하시오.

**해결 과정:**

1. **문제를 이해하고 변수 설정:**
   - 사과의 개수를 \( x \)라고 하고, 오렌지의 개수를 \( y \)라고 하겠습니다.

2. **식 세우기:**
   - 사과와 오렌지의 총 수확량이 5kg이므로, 이를 g로 변환하여 5000g으로 나타낼 수 있습니다.
   - 사과 한 개의 무게는 200g, 오렌지 한 개의 무게는 150g입니다.
   - 두 과일 개수의 총합은 30개입니다.
   - 이를 통해 두 개의 방정식을 세울 수 있습니다:
     1. \( 200x + 150y = 5000 \)
     2. \( x + y = 30 \)

3. **문제 해결:**
   - 첫 번째 방정식을 간단히 하겠습니다:
     \[ 200x + 150y = 5000 \]
     \[ 4x + 3y = 100 \]  (양변을 50으로 나누어 간단히 합니다)
   - 두 번째 방정식에서 \( y \)를 구하여 첫 번째 방정식에 대입합니다:
     \[ x + y = 30 \]
     \[ y = 30 - x \]
   - 이를 첫 번째 방정식에 대입합니다:
     \[ 4x + 3(30 - x) = 100 \]
     \[ 4x + 90 - 3x = 100 \]
     \[ x + 90 = 100 \]
     \[ x = 10 \]
   - \( y \)를 구합니다:
     \[ y = 30 - x \]
     \[ y = 30 - 10 \]
     \[ y = 20 \]

4. **최종 답:**
   - 사과의 개수는 10개이고, 오렌지의 개수는 20개입니다.
'''}]
# 나는 열살이고 내 동생은 5년이 지나면 내 나이의 4/5가 될 거야. 내 동생의 현재 나이는 얼마지?
# 명령문
conversation_history.append({
"role": "user",
"content": '''
나는 현재 10살이고 내 동생은 5년이 지나면 내 나이의 4/5가 됩니다. 내 동생의 현재 나이는 얼마인가요?
''',
})

# API 호출
response = client.chat.completions.create(
    model="gpt-3.5-turbo",  # 사용하려는 모델 (필수 지정)
    messages=conversation_history,  # 대화 메시지 목록 (필수 지정)
    temperature=1.0,  # 확률 분포 조정을 통한 응답의 다양성 제어 (값의 범위: 0~2)
    top_p=0.5,  # 누적 확률 값을 통한 응답의 다양성 제어 (값의 범위: 0~1)
)
# 응답 출력
for response in response.choices :
  print(f"Assistant:\n{response.message.content}")
```

```python
# 인터넷 검색 기반 응답

#위키피디아 라이브러리 설치
!pip install wikipedia-api

import wikipediaapi

# 위키피디아 API 클라이언트 생성
wiki_wiki = wikipediaapi.Wikipedia(language='ko',
                                   user_agent='Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36')

def get_wikipedia_content(page_title):
    page = wiki_wiki.page(page_title)

    if not page.exists():
        return f"Page '{page_title}' does not exist."

    return {
        "url": page.fullurl,
        "title": page.title,
        "summary": page.summary,
        # "content": page.text
    }

# 예제 페이지 가져오기
page_title = ""
content = get_wikipedia_content(page_title)

# 결과 출력
print("Url: ", content["url"])
print("Title: ", content["title"])
print("Summary: ", content["summary"])
# print("Content: ", content["content"])
```