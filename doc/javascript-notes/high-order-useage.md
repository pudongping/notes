# JavaScript 的高阶函数的使用

## filter

从数组中过滤掉值

```js

// filter 中的回调函数有一个要求：必须返回一个 boolean 值
// true： 当返回 true 时，函数内部会自动将这次回调的 n 加入到新的数组中
// false：当返回 false 时，函数内部会过滤掉这次的 n
const nums = [10, 20, 111, 222, 145, 60];
let newNums = nums.filter(function(n) {
	return n < 100;
});
console.log(newNums);

```

## map （映射）

改变每一个元素的值

```js

const nums = [10, 20, 111, 222, 145, 60];
let newNums = nums.map(function(n) {
	return n * 2;
});
console.log(newNums);

```		

## reduce

累加每一个元素的值

```js

// reduce 的第一个参数为一个回调函数，回调函数的第一个参数为执行回调的上一个返回值， n 为遍历元素
// 第二个参数为执行回调的初始值，此时的初始值为 0
const nums = [10, 20, 111, 222, 145, 60];
let total = nums.reduce(function(preValue, n) {
	return preValue + n;
}, 0);
console.log(total);

```


**一行代码汇总以上三个需求**

```js

const nums = [10, 20, 111, 222, 145, 60];
let total = nums.filter(function(n) {
	return n < 100;
}).map(function(n) {
	return n * 2;
}).reduce(function(preValue, n) {
	return preValue + n;
}, 0);

// 或者直接

const nums = [10, 20, 111, 222, 145, 60];
let total = nums.filter(n => n < 100).map(n => n * 2).reduce((preValue, n) => preValue + n);
console.log(total);

```

## every

判断数组的所有元素是否满足测试条件

```js

let arr = ['alex', 'jack', 'harry'];
let res = arr.every(function (item) {
    return item.length > 0;
});
res;  // true 因为每个元素都满足 item.length > 0 的条件

```

## find

查找符合条件的 **第一个元素** ，如果找到了，返回这个元素，否则，返回 `undefined`

```js

let arr = ['Alex', 'jack', 'harry', 'alex'];
let res = arr.find(function (item) {
    return item.toLowerCase() === 'alex';
});
res;  // "Alex"


```

## findIndex

`findIndex()` 和 `find()` 类似，也是查找符合条件的第一个元素，不同之处在于 `findIndex()` 会返回这个元素的索引，如果没有找到，则会返回 `-1`

```js

let arr = ['Alex', 'jack', 'harry', 'alex'];
let res = arr.findIndex(function (item) {
    return item === 'alex';
});
res;  // 3  因为 alex 的索引为 3

```
