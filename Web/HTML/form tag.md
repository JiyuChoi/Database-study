# Form tag

### 📌 select tag
```html
<select>
  <option selected>서울</option>
  <option>경기</option>
  <option>강원</option>
</select>
```
option 태그의 속성으로 selected가 있음 (기본으로 선택된 항목)

### 📌 textarea tag
```html
<textarea rows="5" cols="30">
</textarea>
```
텍스트 상자의 크기를 조절하는 rows, cols 속성

### 📌 button tag
```html
<button type="submit|reset|button">제출</button>
```
input 타입의 submit, rest, button과 같은 기능을 가짐<br>
하지만 input과 달리 빈태그가 아니며 안에 내용을 직접 넣을 수 있음

### 📌 label tag
* form 요소의 이름과 form 요소를 명시적으로 연결함
```html
<label for="name">이름</label>: <input type="text" id="name">
```
이는 사용성, 접근성적인 측면으로 중요한 역할을 하므로 반드시 써주어야 함

### 📌 form, fieldset, legend tag
```html
<form action="" method=">
  <fieldset>
      <legend>기본 정보</legend>
  </fieldset>
</form>                        
```
* fieldset: 여러 개의 폼 요소를 그룹화하여 구조적으로 만들기 위해 사용
* legend: 폼 요소의 제목으로 <fieldset> 내부에 작성
* form: 데이터를 묶어서 실제 서버로 전송해주는 역할<br>
  두가지 방식 존재 method = "get(비밀성을 유지해야하는 데이터에는 적합하지 않음), post"
