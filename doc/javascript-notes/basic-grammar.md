# JavaScript 基础语法

## 代码书写位置

1. 内嵌到网页中，一般将 JavaScript 代码放到 <head> 中

```js

<head>
  <script>
    alert('Hello, world');
  </script>
</head>

```

2. 单独一个 `.js` 文件，然后在 html 文件中去引入

```js

<script src="./demo.js"></script

```

> JavaScript 并不强制要求在每个语句的结尾加 `;` ，浏览器中负责执行 JavaScript 代码的引擎会自动在每个语句的结尾补上 `;` 。 让 JavaScript 引擎自动加分号在某些情况下会改变程序的语义，导致运行结果与期望不一致。因此，我们不会省略 `;` ，所有语句都会添加 `;` 。

## 比较运算

```js

// 它会自动转换数据类型再比较，很多时候，会得到非常诡异的结果；
false == 0;  // true

// 它不会自动转换数据类型，如果数据类型不一致，返回 false，如果一致，再比较。
false === 0;  // false

```

## strict 模式

在 JavaScript 代码的第一行写上

```js

'use strict';

```

## 循环

- ### for 循环

```js

// for 循环

let x = 0;
let i;
for (i = 1; i <= 100; i++) {
    x = x + i;
}

console.log(x);  // 5050

// 循环遍历数组
let arr = ['A', 'B', 'C'];
let i, x;
for (i = 0; i < arr.length; i++) {
    x = arr[i];
    console.log(x);
}
// 或者这样遍历数组
for (let i in arr) {
    console.log(i);  // "0" "1" "2" 这里取出来的索引是字符串类型
    console.log(arr[i]);
}


// 遍历对象
let obj = {
    name: 'alex',
    age: 26,
    city: 'Chongqing'
};
for (let key in obj) {
    console.log(key);  // "name" ……
    console.log(obj[key]);  // "alex" ……
}


```

- ### while 循环

```js

// while 循环
let x = 0;
let n = 10;
while (n > 0) {
    x += n;
    n -= 2;
}
console.log(x);  // 30

// do ... while
let n = 0;
do {
    n += 1;    
} while (n < 10);
console.log(n);  // 10

```

- ### forEach 循环 （ES5.1 标准引入）

```js

// 循环 set
let s = new Set(['A', 'B', 'C']);
s.forEach(function (element, sameElement, set) {
    console.log(element, sameElement, set);
});

// 循环 map
let m = new Map([[1, 'x'], [2, 'y'], [3, 'z']]);
m.forEach(function (value, key, map) {
    console.log(key, value, map);
});

// 循环数组
let arr = ['A', 'B', 'C'];
arr.forEach(function (item, index, array) {
    console.log(index, item, array);
});

// 不可以使用 forEach 去遍历对象

```
