# < a >: anchor tag

## < a >
```html
<a href="http://www.naver.com/" target =_blakn">네이버</a>
```

## href 속성
<p>링크를 만들기 위해 <a>는 반드시 href(hypertext reference) 속성을 가지고 있어야 함<br>
href 속성의 값은 링크의 목적지가 되는 URL</p>


## target 속성
<p>target 속성은 링크된 리소스를 어디에 표시할지를 나타내는 속성<br>
속성값으로는 _self, _blank, _parent, _top<br>
_self는 현재 화면에 표시한다는 의미로, target 속성이 선언되지 않으면 기본적으로 self로 동작함<br>
_blank는 새로운 창에 표시한다는 의미로 외부 페이지가 나타나게끔 하는 속성</p>


## 내부링크
<p>< a >를 통해 페이지 내부의 특정 요소로 초점을 이동할 수도 있는데, 이를 내부 링크라 함<br>
내부 링크를 사용할 때는 href 속성값에 #을 쓰고 그 뒤에 페이지 내에서 이동하고자하는 요소의 id 속성값을 적음</p>

```html
<a href="#some-element-id">회사 소개로 이동하기</a>
... 중략
<h1 id="some-element-id">회사 소개</h1>
```

<p>보통 페이지에 내용이 많아 스크롤이 길어질 경우, 빠르게 화면 최상단으로 이동하고자 할 때 사용<br>
예) 웹페이지에서 화면 하단에 있는 'top' 또는 '맨 위로 이동하기' 버튼</p>
