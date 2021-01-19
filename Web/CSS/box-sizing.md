# box-sizing

## 📌 content-box
원래 width는 content 영역에만 적용됨 (padding, border는 포함하지 않음)
```html
box-sizing: content-box;
width: 50px;
border: solid #5B6DCD 10px;
padding: 5px;
<!--content 영역의 너비는 50px-->
```


## 📌 border-box
padding과 border까지 합한 너비를 width로 함 (width = content + padding + border)
```html
box-sizing: border-box;
width: 50px;
border: solid #5B6DCD 10px;
padding: 5px;
<!--content 영역의 너비는 35px-->
```
