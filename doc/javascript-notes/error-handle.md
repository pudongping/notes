# JavaScript 错误处理

## 捕获错误的三种形式

```js

// 完整的写法
try {
    
} catch (e) {
    console.log('出错了：', e);
    
    if (e instanceof TypeError) {
        console.log('类型错误！');
    } else if (e instanceof Error) {
        console.log(e.message);
    } else {
        console.log('Error：' + e);
    }
    
} finally {
    
}

// 只有 try ... catch 没有 finally
try {
    
} catch (e) {
    
}

// 只有 try ... finally 没有 catch
try {
    
} finally {
    
}

```

## 抛出错误

程序也可以主动抛出一个错误，让执行流程直接跳转到 catch 块。抛出错误使用 throw 语句。

```js

try {
    throw new Error('随便报错');
} catch (e) {
    console.log('出错了：' + e);  // 出错了：Error: 随便报错
}

```

## 异步错误处理

涉及到异步代码，无法在调用时捕获，原因就是在捕获的当时，回调函数并未执行，因此我们需要在回调函数中捕获异常。

## 自定义异常类

```js

module.exports =  class ApiError extends Error {

    constructor(code, message) {
        super();
        // 未定义错误信息，就默认 500 服务器内部错误
        this.code = code || 500
        this.message = message || '未定义错误提示信息';
    }

}

```
