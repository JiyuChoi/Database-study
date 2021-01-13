# 📌 float 속성
* 요소를 보통의 흐름에서 벗어나게 함 (파워포인트의 맨 앞으로 가기 설정과 비슷)
* 붕떠있지만 자신의 영역은 차지하고 있어 주변 텍스트나 인라인 요소가 주위를 감싸고 있음

## 속성 값
* none: float 시키지 않음 (기본값)
* left: 좌측으로 float 시킴
* right: 우측으로 float 시킴
<br>

* <b>대부분 요소의 display 값을 block으로 변경함</b><br>
  span 태그 같은 display: inline 형식을 float:left 선언하면 자동으로 display: black으로 변환 됨 (display 값 변경 예외: inline-table, flex)
<br>

 ❗️ <b>float를 선언하면 의도하지 않게 주변요소에게 영향을 주므로 다음 요소에 바로 clear를 해줘야 함</b>
<br>

# 📌 clear 속성
* 요소를 floating 된 요소의 영향에서 벗어나게 함
* <b>block-level 요소만 적용가능</b>

## 속성 값
* none: 양쪽으로 floating 요소를 허용 (기본값)
* left: 왼쪽으로 floating 요소를 허용하지 않음
* right: 오른쪽으로 floating 요소를 허용하지 않음
* both: 양쪽으로 floating 요소를 허용하지 않음

  <b>display: block; clear: both;가 가장 많이 쓰임</b>
