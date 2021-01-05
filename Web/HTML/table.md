# Table

## 표의 구성요소
```html
  <table>: 표를 나타내는 태그
  <tr>: 행을 나타내는 태그 (<tr>은 <th>,<td>를 자식으로 가짐)
  <th>: 제목 셀을 나타내는 태그
  <td>: 셀을 나타내는 태그
```

## 표의 구조
```html
  <caption>: 표의 제목
  <thead>: 제목 행을 그룹화
  <tbody>: 본문 행을 그룹화
  <tfoot>: 바닥 행을 그룹화
```

## 셀 병합
```html
  # 2개의 행을 병합
    <th rowspan="2"> 
  # 3개의 열을 병합
    <th colspan="3">
```

## 그외의 표 관련 태그
```html
  header 속성: 자신의 상위 header의 id를 명시해서 연결. 종속관계 설정
  <th id="th-data">
  <td headers="th-data">
```
