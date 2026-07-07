## 비동기 팔로우 구현
### Ajax 적용
- 프로필 페이지에 axios CDN 작성
```HTML
<!-- accounts/profile.html -->

  <script src="http://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
```

- form 요소 선택을 위해 id 속성 지정 및 선택
- action과 method 속성은 삭제
  - 요청은 axios로 대체되기 때문

```JS
// <!-- profile.html -->
<form id ="follow-form">
  ...
</form>

const formTag = document.querySelector('#follow-form')
```

- form 요소에 이벤트 핸들러 할당
- submit 이벤트의 기본 동작 취소하기

```JS
// <!-- profile.html -->

formTag.addEventListener('submit', function (event) {
  event.preventDefault()
})
```

- axios 요청 코드 작성
1. url 작성에 필요한 user pk는 어떻게 작성?
2. csrftoken은 어떻게 보낼까?

```JS
// <!-- profile.html -->

formTag.addEventListener('submit', function (event) {
  event.preventDefault()
  axios({
    method: 'post',
    url: `/accounts/${}/follow/`,
  })
})
```

- url에 작성할 user pk 가져오기 (HTML => JavaScript)

```JS
// <!-- profile.html -->

<form id="follow-form" data-user-id="{{ person.pk }}">
  ...
</form>

formTag.addEventListener('submit', function (event {
  event.preventDefault()

  const userId = event.currentTarget.dataset.userId
  const userId = this.dataset.userId
  const userId = formTag.dataset.userId
  ...
}))
```

### 'data-*' 속성
사용자 지정 데이터 특성을 만들어 임의의 데이터를 HTML과 DOM 사이에서 교환할 수 있는 방법

```HTML
<div data-my-id="my-data"></div>

<script>
  const myId = event.target.dataset.myId
</script>
```


- 요청 url 작성 마무리
- csrf 값을 가진 input 요소를 직접 선택 후 axios에 작성
```JS
// <!-- profile.html -->
const scrftoken = document.querySelector('[name=csrfmiddlewaretoken]').value

formTag.addEventListener('submit', function (event) {
  event.preventDefault()

  const userId = event.currentTarget.dataset.userId

  axios({
    method: 'post',
    url: `/accounts/${userId}/follow/`,
    headers: {'X-CSRFToken': csrftoken,},
  })
})
```

- "팔로잉 수와 팔로워 수 비동기 적용"
- 해당 요소를 선택할 수 있도록 span 태그와 id 속성 작성
```HTML
<!-- profile.html -->

<div>
  팔로잉 : <span id="followings-count">{{ person.followings.all|length }}</span>
  팔로잉 : <span id="followers-count">{{ person.followers.all|length }}</span>
```

### 최종 view와 profile.html

- 팔로우 상태 여부를 JavaScript에게 전달할 데이터 작성
- 응답은 더 이상 HTML 문서가 아닌 JSON 데이터로 응답하도록 변경
- 팔로워, 팔로잉 인원 수 연산을 진행하여 결과를 응답 데이터로 전달
```python
# views.py

from django.http import JsonResponse

@login_required
def follow(request, user_pk):
  User = get_user_model()
  person = User.objects.get(pk=user_pk)
  if person != request.user:
    if person.followers.filter(pk=request.user.pk).exists():
      person.followers.remove(request.user)
      is_followed = False
    else:
      person.followers.add(request.user)
      is_followed = True
    context = {
      'is_followed' : is_followed,
      'followings_count': person.followings.count(),
      'followers_count': person.followers.count(),
    }
    return JsonResponse(context)
  return redirect('accounts:profile', person.username)
```

- 팔로우 요청 후 Django 서버로부터 받은 응답 데이터 확인
- 응답 데이터 is_followed에 따라 팔로우 버튼 조작
- 각 span 태그를 선택하고 응답 데이터를 받아 각 태그의 인원수 값 변경에 활용
```JS
// <!-- profile.html -->
const scrftoken = document.querySelector('[name=csrfmiddlewaretoken]').value

formTag.addEventListener('submit', function (event) {
  event.preventDefault()

  const userId = event.currentTarget.dataset.userId

  axios({
    method: 'post',
    url: `/accounts/${userId}/follow/`,
    headers: {'X-CSRFToken': csrftoken,},
  })
    .then((response) => {
      const isFollowed = response.data.is_followed
      const followBtn = document.querySelector('input[type=submit]')
      const followingCountTag = document.querySelector('#followings-count')
      const followersCountTag = document.querySelector('#followers-count')

      followingsCountTag.textContent = response.data.followings_count
      followersCountTag.textContent =response.data.followers_count

      if (isFollowed === true) {
        followBtn.value = 'Unfollow'
      } else {
        followBtn.value = 'Follow'
      }
    })
})
```

-------------------------------------------------------------------
-------------------------------------------------------------------
## 비동기 좋아요 구현
- 각 버튼의 공통 조상인 div 요소에 이벤트 핸들러 단 하나만 할당하기 위해 버블링이 필요

- 모든 좋아요 form 요소를 포함하는 최상위 요소 작성

```HTML
<article class="article-container">
  {% for article in articles %}
    ...
  {% endfor %}
</article>
```

- 최상위 요소 선택
- 이벤트 핸들러 할당
- 하위 요소들의 submit 이벤트를 감지하고 submit 기본 이벤트를 취소

```JS
// articles/index.html

const articleContainer = document.querySelector('.article-container')

articleContainer.addEventListener('submit', function (event) {
  event.proventDefault()
})
```

- 각 좋아요 form에 article.pk를 부여 후 HTML의 article.pk 값을 JavaScript에서 참조하기

```HTML
<!-- index.html -->

<form data-article-id ="{{ article.pk }}">
  ...
</form>
```
```JS
// <!-- profile.html -->

formTag.addEventListener('submit', function (event) {
  event.preventDefault()

  const articleId = event.???
})
```

### 'currentTarget' & 'target'
- 'currentTarget' 속성
  - 현재 요소
  - 항상 이벤트 핸들러가 연결된 요소만을 참조하는 속성
  - 'this'와 같음
- 'target' 속성
  - 이벤트가 발생한 가장 안쪽의 요소(target)를 참조하는 속성
  - 실제 이벤트가 시작된 요소
  - 버블링이 진행되어도 변하지 않음


- 좋아요 상태 여부를 JavaScript 에게 전달할 데이터 작성 및 JSON 데이터 응답
```py
# views.py

from django.http import JsonResponse

@login_required
def likes(request, user_pk):
  article = Article.objects.get(pk=user_pk)
  if request.user in article.like_users.all():
    article.like_users.remove(request.user)
    is_liked = False
  else:
    article.like_users.add(request.user)
    is_liked = True
  context = {
    'is_liked': is_liked,
  }
  return JsonResponse(context)
```


- url 완성 후 요청 및 응답 확인
- 응답 데이터 is_liked를 받아 isLiked 변수에 할당
- isLiked에 따라 좋아요 버튼 토글하기
  - 어떤 게시글의 좋아요버튼을 선택했는 지 구분 필요
  - 문자와 article의 pk 값을 혼합하여 각 버튼에 id 속성값을 설정
    - id 속성 값은 숫자로 시작할 수 없음

```HTML
<!-- index.html -->
{% if request.user in article.like_users.all %}
  <input type="submit" value="좋아요 취소" id="like-{{ article.pk }}">
{% else %}
  <input type="submit" value="좋아요" id="like-{{ article.pk }}">
{% endif %}
```
```JS
// <!-- index.html -->
const scrftoken = document.querySelector('[name=csrfmiddlewaretoken]').value

formTag.addEventListener('submit', function (event) {
  event.preventDefault()

  const articleId = event.currentTarget.dataset.articleId

  axios({
    method: 'post',
    url: `/aricles/${articleId}/likes/`,
    headers: {'X-CSRFToken': csrftoken,},
  })
    .then((response) => {
      console.log(response)
      const isLiked = response.data.is_liked
      const likeBtn = document.querrySelector(`#like-${articleId}`)
      if (isLiked === true) {
        likeBtn.value = '좋아요 취소'
      } else {
        likeBtn.value = '좋아요'
      }
    })
    .catch((error) => {
      console.log(error)
    })
})
```


### 버블링을 활용하지 않은 경우
1. querySelectorAll()을 사용해 전체 좋아요 버튼을 선택
```html
<!-- index.html -->

{% for article in articles %}
  ...
  <form calss="like-forms" data-article-id="{{ article.pk }}">
    {% csrf_token %}
    {% if request.user in article.like_users.all %}
      <input type="submit" value="좋아요 취소" id="like-{{ article.pk }}">
    {% else %}
      <input type="submit" value="좋아요" id="like-{{ article.pk }}">
    {% endif %}
  </form>
  <hr>
{% endfor %}
```

2. forEach()를 사용해 전체 좋아요 버튼을 순회하면서 진행
```js
const formTags = document.querySelectorAll('.like-forms')
const scrftoken = document.querySelector('[name=csrfmiddlewaretoken]').value

formTags.forEach((formTag) => {
  formTag.addEventListener('submit', function (event) {
    event.preventDefault()

    const articleId = formTag.dataset.articleId

  axios({
    method: 'post',
    url: `/aricles/${articleId}/likes/`,
    headers: {'X-CSRFToken': csrftoken,},
  })
    .then((response) => {
      console.log(response)
      const isLiked = response.data.is_liked
      const likeBtn = document.querrySelector(`#like-${articleId}`)
      if (isLiked === true) {
        likeBtn.value = '좋아요 취소'
      } else {
        likeBtn.value = '좋아요'
      }
    })
    .catch((error) => {
      console.log(error)
    })
  })
})
```