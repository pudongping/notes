# JavaScript 解析赋值

## 解析赋值 （从 ES6 开始）

```js

let arr = ['A', 'B', 'C'];

// 如果是 es6 之前
let x = arr[0];
let y = arr[1];

// 从 es6 开始
let [x, y, z] = arr;
// 如果数组本身还有嵌套
let [x, [y, z]] = ['A', ['B', 'C']];
x;  // "A"
z;  // "C"
// 忽略某些元素
let [, , z] = ['alex', 'harry', 'jack'];  // 忽略前两个元素，只对 z 赋值第三个元素
z;  // "jack"

// 对对象使用解析赋值
let person = {
    name: 'alex',
    age: 26,
    address: {
        city: 'Chongqing',
        street: 'No.1 Road'
    }
};
let {name, address: {city, st}} = person;
name;  // "alex"
city;  // "Chongqing"
st;  // undefined  因为属性名是 street 而不是 st
// 注意: address 不是变量，而是为了让 city 和 st 获得嵌套的 address 对象的属性:
address; // Uncaught ReferenceError: address is not defined

// 如果已经提前申明了变量，然后想使用解析赋值时
let x, y;
({x, y} = {name: 'alex', x: 100, y: 200});

// 使用场景介绍
// 快速获取当前页面的域名和路径
let {hostname:domain, pathname:path} = location;
// 其实就是好比 let domain = location.hostname; let path = location.pathname;

```

## ES6 对象字面量的增强写法

将变量批量赋值到变量中

```js

let name = 'alex';
let age = 18;
let height = 1.88;

const obj = {
        name,
        age,
        height,
    }

打印结果为：
console.log(obj) => 
{
    name: 'alex',
    age: 18,
    height: 1.88
}
```
