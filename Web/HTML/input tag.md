# input tag

## < input >
내용이 없는 빈 요소이며 type 속성을 통해 여러 종류의 입력양식으로 나타남

### 📌 type="text"
```html
<input type="text" placeholder="000">
```
placeholder: 사용자가 입력하기 전 미리 화면에 노출하는 값으로, 입력 값의 양식 표현

### 📌 type="password"
```html
<input type="password">
```

### 📌 type="radio"
* name 속성은 라디오 버튼과 체크박스를 그룹화 시켜주는 속성
```html
<input type="radio" name="gender" checked>남자
<input type="radio" name="gender">여자
```
라디오 버튼은 중복선택 불가능, checked 속성은 boolean 속성

### 📌 type="checkbox"
```html
<input type="checkbox" name="hobby" checked>등산
<input type="checkbox" name="gender">운동
```
체크박스는 중복 가능

### 📌 type="file"
```html
<input type="file">
```
파일을 서버에 올릴 때 사용

### 📌 type="submit|reset|image|button"
* submit : form의 값을 전송하는 버튼
* reset : form의 값을 초기화하는 버튼
* image : 이미지를 삽입할 수 있는 버튼 (submit과 동작이 동일함 / src, alt 속성 반드시 필요)
* button : 아무 기능이 없는 버튼 <br> (button tag를 사용하여 type="submit|rest|button" 만들 수 있음)
