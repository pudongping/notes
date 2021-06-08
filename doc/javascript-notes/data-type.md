# JavaScript 的基本数据类型

## 1. Number：数字

> JavaScript 不区分整数和浮点数，统一用 Number 表示。

```js

// NaN 表示 Not a Number，当无法计算结果时用 NaN 表示
NaN;
// NaN 无法做比较，只能使用 isNaN() 函数判断
NaN === NaN;  // false
isNaN(NaN);  // true

// Infinity 表示无限大，当数值超过了 JavaScript 的 Number 所能表示的最大值时，就表示为 Infinity
Infinity;

```

## 2. string：字符串

```js

// 由于多行字符串用 \n 写起来比较费事，所以最新的 ES6 标准新增了一种多行字符串的表示方法，用反引号 `……` 表示
let str = `this is 
multi lines 
string
`;
// 等同于如下代码
let str1 = 'this is\n multi lines\n string';


// 模板字符串
let name = 'alex';
let age = 26;
let message = `hello, ${name}, are you ${age} years old ?`;
console.log(message);  // hello, alex, are you 26 years old ?

// 操作字符串
name[3];  // "x"

// 字符串全部转大写
let name1 = name.toUpperCase();  // "ALEX"

// 字符串全部转小写
name1.toLowerCase();  // "alex"

// 搜索指定字符串出现的位置
name.indexOf('l');  // 1
name.indexOf('jack');  // -1 没有找到指定的子串

// 截取字符串
name.substring(1, 3);  // "le" 从索引 1 开始到 3 （不包括 3）
name.substring(1);  // "lex"  从索引 1 开始到结束

```

## 3. boolean： 布尔值

## 4. null： （空值） 和 undefined：（未定义）

> 大多数情况下，我们都应该用 null 。 undefined 仅仅在判断函数参数是否传递的情况下有用。

## 5. array：数组

```js

// 声明新数组（建议直接使用这种方式声明）
let new_arr = [1, 'Hello', null, true];
// 或者
let new_arr1 = new Array(1, 'Hello', null, true);

// 获取元素
new_arr[1];  // 'Hello'
// 修改元素
new_arr[1] = 'World';
new_arr;  // [1, 'World', null, true]

// 搜索指定元素的索引位置
new_arr.indexOf(null);  // 2

// 截取数组
new_arr.slice(0, 3);  // [1, "Hello", null]  从索引 0 开始，到索引 3 结束，但不包含索引 3
new_arr.slice(2);  // [null, true]  从索引 2 开始到结束
new_arr.slice();  // [1, 'Hello', null, true]  从头到尾截取所有元素

// 往数组的末尾添加若干元素
new_arr.push('Jack', 'Alice');  // 6 返回 array 的新长度

// 删除最后一个元素
new_arr.pop();  // 'Alice'

// 往数组的头部添加若干元素
new_arr.unshift('Jack', 'Alice');  // 6 返回 array 的新长度

// 删除第一个元素
new_arr.shift();  // 'Jack'

// 对数组进行排序
let arr = ['B', 'C', 'A'];
arr.sort();
arr;  // ["A", "B", "C"]

// 反转数组
let arr = ['Alice', 'Alex', 'Jack'];
arr.reverse();
arr;  // ["Jack", "Alex", "Alice"]

// 从指定的索引开始删除若干元素，然后再从该位置添加若干元素
let arr = ['A', 'B', 'C', 'D', 'E', 'F'];
// 从索引 2 开始删除 3 个元素，然后再添加 2 个元素
arr.splice(2, 3, 'C1', 'D1');  // ["C", "D", "E"]  返回删除的元素
arr;  // ["A", "B", "C1", "D1", "F"]
// 只删除，不添加
arr.splice(2, 2);  // ["C1", "D1"]  返回删除的元素
arr; // ["A", "B", "F"]
// 只添加，不删除
arr.splice(2, 0, 'X1', 'Y1');  // []  因为没有删除任何元素，因此会返回空数组
arr;  // ["A", "B", "X1", "Y1", "F"]

// 将两个数组拼接起来
let arr = ['A', 'B', 'C'];
let arr1 = arr.concat([1, 2, 3]);
arr1;  // ["A", "B", "C", 1, 2, 3]
arr;  // ["A", "B", "C"]
// 会自动把数组拆开
let arr2 = arr.concat(1, 2, [3, 4]);
arr2;  // ["A", "B", "C", 1, 2, 3, 4]

// 使用特定的字符串拼接每一个元素
let arr = ['A', 'B', 'C'];
arr.join('-');  // "A-B-C"

```

## 6. object：对象

```js

// 声明新对象（最后一个键值对不需要在末尾加逗号，有些低版本的浏览器会报错）
let new_obj = {}
let new_obj1 = {
    name: 'alex',
    age: 26,
    city: 'Chongqing',
    'middle-school': 'No.1 Middle School'  // 如果属性名包含特殊字符，就必须用单引号括起来
}

// 获取元素
new_obj1.name;  // "alex"
new_obj1['name'];  // "alex"
new_obj1['middle-school'];  // "No.1 Middle School"

// 新增一个 tt 属性
new_obj1.tt = 'demo';  // "demo"
// 修改属性
new_obj1.tt = 'demo1';  // "demo1"
// 删除一个属性
delete new_obj1.age;  // true
new_obj1;  // {name: "alex", city: "Chongqing", middle-school: "No.1 Middle School"}

// 判断一个属性是当前对象独有的
new_obj1.hasOwnProperty('name');  // true
new_obj1.hasOwnProperty('name1');  // false

```

## 7. Map（ES6 规范定义的新的数据类型）

> Map 是一组键值对的结构，具有极快的查找速度

```js

// 声明一个空 map
let m = new Map();
let m1 = new Map([['alex', 26], ['alice', 18], ['jack', 20]]);

// 取值
m1.get('alex');  // 26
// 添加新的 key-value
m1.set('angle', 24);
// 修改指定 key 的 value
m1.set('alex', 88);  // {"alex" => 88, "alice" => 18, "jack" => 20, "angle" => 24}
// 是否存在 key 为 alex 的元素
m1.has('alex');  // true
// 删除 key 为 alex 的元素
m1.delete('alex');  // true

```

## 8. Set（ES6 规范定义的新的数据类型）

> Set 和 Map 类似，也是一组 key 的集合，但不存储 value 。由于 key 不能重复，所以，在 Set 中，没有重复的 key。

```js

// 声明一个空 Set
let s = new Set();
let s1 = new Set([1, 2, 3, 3, '3', '3', '4']);
s1;  // Set(5) {1, 2, 3, "3", "4"}  重复元素会自动被过滤

// 添加元素
s1.add(1);  // Set(5) {1, 2, 3, "3", "4"} 添加重复元素，不会有任何效果

// 删除元素
s1.delete(1);  // true
s1;  // Set(4) {2, 3, "3", "4"}

```
