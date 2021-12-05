# JavaScript 编程准则

## 区分对象类型

```js

typeof 123;  // "number"
typeof NaN;  // "number"
typeof 'str';  // "string"
typeof true;  // "boolean"
typeof undefined;  // "undefined"
typeof Math.abs;  // "function"
typeof null;  // "object"
typeof [];  // "object"
typeof {};  // "object"

```

## 需要遵守的几条规则

- 一定不要使用 `new Number()` 、 `new Boolean()` 、 `new String()` 创建包装对象；
- 用 `parseInt()` 或 `parseFloat()` 来转换任意类型到 `number`；
- 用 `String()` 来转换任意类型到 `string`，或者直接调用某个对象的 `toString()` 方法，但是需要注意的是 `null` 和 `undefined` 是没有 `toString()` 方法的，如果是 `number` 对象调用 `toString()` 方法的话，必须使用 `123..toString()` 或者 `(123).toString()` 否则会报错；
- 通常不必把任意类型转换为 `boolean` 再判断，因为可以直接写 `if (argVar) {...}` 的方式去判断；
- `typeof` 操作符可以判断出 `number` 、 `boolean` 、 `string` 、 `function` 和 `undefined`；
- 判断 `Array` 要使用 `Array.isArray([])`；
- 判断 `null` 要使用 `myVar === null`；
- 判断某个全局变量是否存在用 `typeof window.myVar === 'undefined'`；
- 函数内部判断某个变量是否存在用 `typeof myVar === 'undefined'`。
