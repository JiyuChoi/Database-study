# ::before ::after
* 내용의 앞과 뒤에 콘텐츠 추가
* 특정 요소의 앞(::before)이나 뒤(::after)에 지정한 내용(텍스트, 이미지)을 추가할 수 있음

## 콘텐츠 추가 (content="")
* ::before와 ::after와 함께 쓰이는 content는 html 문서에 포함되는 않은 요소를 css에서 생성해주기 때문에 가짜 속성

```html
<ul>
  <li>로그인</li>
  <li>회원가입</li>
  <li>마이페이지</li>
</ul>

.li::before {content:"|"; color:#111}
.li:last-child::after {content:""}

/* 로그인 | 회원가입 | 마이페이지 */
```
