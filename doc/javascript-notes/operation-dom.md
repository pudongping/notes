# JavaScript 操作 DOM

## 取出 DOM 节点

```js

// 返回 id 为 `test` 的节点
let test = document.getElementById('test');

// 先定位 id 为 `test-table` 的节点，再返回其内部所有 tr 节点
let trs = document.getElementById('test-table').getElementsByTagName('tr');

// 先定位 id 为 `test-div` 的节点，再返回其内部所有 class 包含 red 的节点
let reds = document.getElementById('test-div').getElementsByClassName('red');

// 获取节点 test 下的所有直属子节点
let cs = test.children;

// 获取节点 test 下第一个子节点
let firstCs = test.firstElementChild;

// 获取节点 test 下最后一个子节点
let lastCs = test.lastElementChild;


// 通过 querySelector 获取 id 为 q1 的节点
let q1 = document.querySelector('#q1');
// 通过 querySelectorAll 获取 q1 节点内的符合条件的所有节点
let ps = q1.querySelectorAll('div.highlighted > p');

```

## 更新 DOM

```html

<p id="p-id"></p>

```

```js

let p = document.getElementById('p-id');
// 设置文本为 ABC
p.innerHTML = 'ABC';  // 此时为 <p id="p-id">ABC</p>
// 设置 HTML
p.innerHTML = 'ABC <span style="color:red">RED</span> XYZ';  // 直接将原来的所有子节点给替换掉了

```

## 插入 DOM

### appendChild

appendChild 会把一个子节点添加到父节点的最后一个子节点

**没更改之前的 html 结构**

```html

<p id="js">JavaScript</p>
<div id="list">
    <p id="java">Java</p>
    <p id="python">Python</p>
    <p id="scheme">Scheme</p>
</div>

```


```js

let js = document.getElementById('js'),
    list = document.getElementById('list');
    
list.appendChild(js);    

```

**更改之后的 html 结构**

> 因为我们插入的 js 节点已经存在于当前的文档树，因此这个节点首先会从原先的位置删除，再插入到新的位置。

```html

<div id="list">
    <p id="java">Java</p>
    <p id="python">Python</p>
    <p id="scheme">Scheme</p>
    <p id="js">JavaScript</p>
</div>

```

**从零开始创建一个新的节点，然后插入到指定位置**

```js

let
    list = document.getElementById('list'),
    haskell = document.createElement('p');
haskell.id = 'haskell';
haskell.innerText = 'Haskell';
list.appendChild(haskell);

```

**更改之后的 html 结构**

```html

<div id="list">
    <p id="java">Java</p>
    <p id="python">Python</p>
    <p id="scheme">Scheme</p>
    <p id="haskell">Haskell</p>
</div>

```

动态添加 css 定义

```js

let d = document.createElement('style');
d.setAttribute('type', 'text/css');
d.innerHTML = 'p { color: red }';
document.getElementsByTagName('head')[0].appendChild(d);

```

### insertBefore

insertBefore 可以将子节点插入到指定的位置

**没更改之前的 html 结构**

```html

<div id="list">
    <p id="java">Java</p>
    <p id="python">Python</p>
    <p id="scheme">Scheme</p>
</div>

```

```js

let
    list = document.getElementById('list'),
    ref = document.getElementById('python'),
    haskell = document.createElement('p');
haskell.id = 'haskell';
haskell.innerText = 'Haskell';
list.insertBefore(haskell, ref);

```

**更改之后的 html 结构**

```html

<div id="list">
    <p id="java">Java</p>
    <p id="haskell">Haskell</p>
    <p id="python">Python</p>
    <p id="scheme">Scheme</p>
</div>

```

## 删除 DOM

```js

// 拿到待删除节点
let self = document.getElementById('to-be-removed');
// 拿到父节点
let parent = self.parentElement;
// 删除
let removed = parent.removeChild(self);
removed === self;  // true

```

> 当你遍历一个父节点的子节点并进行删除操作时，要注意，children 属性是一个只读属性，并且它在子节点变化时会实时更新。

```html

<div id="parent">
    <p>First</p>
    <p>Second</p>
</div>

```

循环删除子节点时

```js

let parent = document.getElementById('parent');
parent.removeChild(parent.children[0]);
parent.removeChild(parent.children[1]); // 浏览器此时会报错，因为已经删除过一个子节点了，此时没有索引为 1 的节点了，此时，原来索引为 1 的节点的索引已经变成了 0

```
