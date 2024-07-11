
- [open AI 활용]()
  
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