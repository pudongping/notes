# underscore 使用

- [underscore.js 中文网](https://underscorejs.net/)
- [underscore.js 英文官网](http://underscorejs.org/)
- [underscore.js GitHub 地址](https://github.com/jashkenas/underscore)

underscore 是一套完善的函数式编程接口，underscore 会把自身绑定到唯一的全局变量 `_` 上。underscore 为集合类对象提供了一致的接口。集合类是指 Array 和 Object，暂不支持 Map 和 Set。

## 以下函数针对 Collections （Array 和 Object）

### map / filter

和 `Array` 的 `map()` 与 `filter()` 类似，但是 `underscore` 的 `map()` 和 `filter()` 可以作用于 `Object` 。当作用于 `Object` 时，传入的函数为 `function (value, key)` ，第一个参数接收 `value` ，第二个参数接收 `key`

```js

// 使用 underscore 操作数组
_.map([1, 2, 3], (x) => x * x);  // [1, 4, 9]


// 使用 underscore 操作对象
let obj = {
    name: 'alex',
    age: 26,
    city: 'Chongqing'
};

let res = _.map(obj, function (value, key) {
    return 'the value is ===> ' + value + ' and the key is ===> ' + key;
});
// 返回数组
res;  // ["the value is ===> alex and the key is ===> name", "the value is ===> 26 and the key is ===> age", "the value is ===> Chongqing and the key is ===> city"]

let res1 = _.mapObject(obj, function (value, key) {
    return 'the value is ===> ' + value + ' and the key is ===> ' + key;
});
// 返回对象
res1;  // {name: "the value is ===> alex and the key is ===> name", age: "the value is ===> 26 and the key is ===> age", city: "the value is ===> Chongqing and the key is ===> city"}

```

### every / some

当集合的所有元素都满足条件时，`_.every()` 函数返回 `true` ，当集合的至少一个元素满足条件时，`_.some()` 函数返回 `true`

```js

let obj = {
    name: 'alex',
    City: 'Chongqing',
    street: 'banyue'
};

let res = _.every(obj, function (value, key) {
    return value.length > 0;
});
res;  // true

let res1 = _.some(obj, function (value, key) {
    return value === value.toLowerCase() && key === key.toLowerCase();
});
res1;  // true

```

### max / min

返回集合中最大和最小的数。如果集合是 object，这两个函数只作用于 value，忽略掉 key。

```js

let arr = [1, 3, 5, 7, 9];
_.max(arr);  // 9
_.min(arr);  // 3

// 空集合会返回 -Infinity 和 Infinity，所以要先判断集合不为空
_.max([]);  // -Infinity
_.min([]);  // Infinity

let obj = {a:1, b:2, c:3};
_.max(obj);  // 3
_.min(obj);  // 1

```

### groupBy

groupBy() 把集合的元素按照 key 归类

```js

let scores = [20, 81, 75, 40, 91, 59, 77, 66, 72, 88, 99];
let groups = _.groupBy(scores, function (x) {
    if (x < 60) {
        return 'C';
    } else if (x < 80) {
        return 'B';
    } else {
        return 'A';
    }
});

console.log(JSON.stringify(groups));  // {"C":[20,40,59],"A":[81,91,88,99],"B":[75,77,66,72]}

console.log(JSON.stringify(groups, null, ' '));

```

### shuffle

shuffle 用洗牌算法随机打乱一个集合

```js

// 每次调用一次结果都会不一样
_.shuffle([1, 2, 3, 4, 5, 6]);  // [4, 2, 6, 5, 1, 3]

let obj = {
    name: 'alex',
    age: 26,
    city: 'Chongqing'
};
// 每次调用一次结果都会不一样
_.shuffle(obj);  // ["alex", "Chongqing", 26]

```

### sample

随机选择一个或者多个元素

```js

let arr = [1, 2, 3, 4, 5, 6];
// 随机选 1 个
_.sample(arr);  // 4
_.sample(arr, 3);  // [4, 6, 1]


let obj = {
    name: 'alex',
    age: 26,
    city: 'Chongqing'
};
_.sample(obj, 3);  // [26, "Chongqing", "alex"]

```

## 以下函数针对 Array

### first

取出数组中的第一个元素

```js

let arr = [1, 3, 5, 7];
_.first(arr);  // 1

```

### last

取出数组中最后一个元素

```js

let arr = [1, 3, 5, 7];
_.last(arr);  // 7

```

### flatten

将多维数组转化为一维数组

```js

let arr = [1, [2], [3, [[4], [5]]]];
_.flatten(arr); // [1, 2, 3, 4, 5]

```

### zip

zip 把两个或多个数组的所有元素按索引对齐，然后按索引合并成新数组

```js

let names = ['alex', 'jack', 'hary'];
let ages = [26, 18, 20];
let citys = ['Chongqing', 'Hubei', 'Shanghai'];
_.zip(names, ages, citys);
// [["alex", 26, "Chongqing"], ["jack", 18, "Hubei"], ["hary", 20, "Shanghai"]]

```

### unzip

```js

let arr = [["alex", 26, "Chongqing"], ["jack", 18, "Hubei"], ["hary", 20, "Shanghai"]];
_.unzip(arr);
// [["alex", "jack", "hary"], [26, 18, 20], ["Chongqing", "Hubei", "Shanghai"]]

```

### object

```js

let names = ['alex', 'jack', 'hary'];
let ages = [26, 18, 20];
_.object(names, ages);  // {alex: 26, jack: 18, hary: 20}

_.object(ages, names);  // {18: "jack", 20: "hary", 26: "alex"}
```

### range

快速生成一个序列

```js

// 从 0 开始小于 10
_.range(10);  // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

// 从 5 开始小于 13
_.range(5, 13);  // [5, 6, 7, 8, 9, 10, 11, 12]

// 从 5 开始小于 30，步长为 5
_.range(5, 30, 5);  // [5, 10, 15, 20, 25]

// 从 0 开始大于 -10，步长为 -1
_.range(0, -10, -1); // [0, -1, -2, -3, -4, -5, -6, -7, -8, -9]

```

## 以下函数针对 object

### keys

返回一个 object 自身所有的 key，但不包含从原型链继承下来的

```js

function Student(name, age) {
    this.name = name;
    this.age = age;
}

let alex = new Student('alex', 26);
_.keys(alex);  // ["name", "age"]

let obj = {
  one: 1,
  two: 2,
  three: 3
};
_.keys(obj);  // ["one", "two", "three"]

```

### allKeys()

返回一个 object 自身所有的 key，还包含从原型链继承下来的

```js

function Student(name, age) {
    this.name = name;
    this.age = age;
}

Student.prototype.school = 'No.1 Middle School';

let alex = new Student('alex', 26);
_.allKeys(alex);  // ["name", "age", "school"]

```

### values

返回 object 自身但不包含原型链继承的所有值

```js

let obj = {
    name: 'alex',
    age: 26,
    city: 'Chongqing'
};
_.values(obj);  // ["alex", 26, "Chongqing"]

```

### mapObject

```js

let obj = {
    a: 1,
    b: 2,
    c: 3
};
_.mapObject(obj, (value, key) => 100 + value);  // {a: 101, b: 102, c: 103}

```

### invert

将 object 的 key 和 value 做交换

```js

let obj = {
    a: 1,
    b: 2,
    c: 3
};
_.invert(obj);  // {1: "a", 2: "b", 3: "c"}

```

### extend / extendOwn

extend 把多个 object 的 key-value 合并到第一个 object 并返回，extendOwn 和 extend 类似，但获取属性时忽略从原型链继承下来的属性。

```js

let obj = {
    name: 'alex',
    age: 26
};

_.extend(obj, {age: 18}, {age: 20, city: 'Hubei'});  // {name: "alex", age: 20, city: "Hubei"}

// 变量 obj  的内容也改变了
obj;  // {name: "alex", age: 20, city: "Hubei"}

```
