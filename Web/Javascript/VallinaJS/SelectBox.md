# Select Box
```html
<select>
  <option value = "1" selected>하나</option>
  <option value = "2">둘</option>
  <option value = "3">셋</option>
</select>
```
## SelectBox에서 선택한 값의 text, value 가져오기
```js
const select = document.querySelector("select")
    
// text 가져오기
const currentText = select.options[select.selectedIndex].text;
    
// option value 가져오기
const value = select.options[select.selectedIndex].value;
```
