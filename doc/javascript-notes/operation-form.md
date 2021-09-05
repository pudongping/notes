# JavaScript 操作表单

## html 表单的输入控件

- 文本框，用于输入文本。`<input type="text">`
- 口令框，用于输入口令。`<input type="password">`
- 单选框，用于选择一项。`<input type="radio">`
- 复选框，用于选择多项。`<input type="checkbox">`
- 下拉框，用于多选一。`<select>`
- 隐藏文本，用户不可见，但表单提交时会把隐藏文本发送到服务器。`<input type="hidden">`

## html5 控件

- 日期控件。`<input type="date" value="2021-05-10">`
- 日期时间控件。`<input type="datetime-local" value="2021-05-10T02:03:04">`
- 颜色选择器控件。`<input type="color" value="#ff0000">`

## 获取值

```html

<input type="text" id="email">

```

获取对应用户输入值

```js

let input = document.getElementById('email');
input.value;  // 返回用户输入的值

```

这种方式可以获取 `text` 、 `password` 、`hidden` 和 `select` 类型的表单，但是要是想获取 `radio` 或者 `select` 则需要通过 `checked` 判断

```html

<label><input type="radio" name="weekday" id="monday" value="1"> Monday</label>
<label><input type="radio" name="weekday" id="tuesday" value="2"> Tuesday</label>

```

```js

let mon = document.getElementById('monday');
let tue = document.getElementById('tuesday');
mon.value;  // "1"
tue.value;  // "2"
mon.checked;  // true 或者 false
tue.checked;  // true 或者 false

```

## 设置值

```html

<input type="text" id="email">

```

获取对应用户输入值

```js

let input = document.getElementById('email');
input.value = 'demo@example.com';  // 设置文本框的内容

```

## 提交表单

### submit()

```html

<!-- HTML -->
<form id="test-form">
    <input type="text" name="test">
    <button type="button" onclick="doSubmitForm()">Submit</button>
</form>

<script>
function doSubmitForm() {
    let form = document.getElementById('test-form');

    form.submit();
}
</script>

```

### onsubmit()

```html

<!-- HTML -->
<form id="test-form" onsubmit="return checkForm()">
    <input type="text" name="test">
    <button type="submit">Submit</button>
</form>

<script>
function checkForm() {
    let form = document.getElementById('test-form');

    return true;  // 返回 true 表示提交表单，返回 false 将不会提交表单
}
</script>

```
