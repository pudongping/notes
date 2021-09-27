# Promise 的使用

Promise 是`异步编程`的一种解决方案。

## promise 的简单使用

```js

<script>

 new Promise((resolve, reject) => {

   setTimeout(() => {
     // 成功时调用
     // resolve('Hello World')

     // 失败时调用
     reject('error message')
   }, 1000)

 }).then(data => {
   console.log(data);
   console.log(data);
   console.log(data);
 }).catch(err => {
   console.log(err);
 })

</script>

```

## promise 多层网络请求调用 （避免出现 ajax 的`回调地狱`）

```js

<script>

    new Promise((resolve, reject) => {
        setTimeout(() => {
            resolve('aaa')
        }, 1000)
    }).then(res => {
        // 自己处理 10 行代码
        console.log(res, '第一层的 10 行代码处理');

        // 对结果进行第一次处理
        return new Promise((resolve) => {
            resolve(res + 1111)
        })

    }).then(res => {
        console.log(res, '第二层的 10 行处理代码');

        return new Promise(resolve => {
            resolve(res + 22222)
        })

    }).then(res => {
        console.log(res, '第三层的 10 行处理代码');
    })
    

</script>

```

以上代码，也可以通过下面的方式简写

```js

<script>

    new Promise((resolve, reject) => {
        setTimeout(() => {
            resolve('aaa')
        }, 1000)
    }).then(res => {
        // 自己处理 10 行代码
        console.log(res, '第一层的 10 行代码处理');

        // 对结果进行第一次处理
        return Promise.resolve(res + 1111)

    }).then(res => {
        console.log(res, '第二层的 10 行处理代码');

        return Promise.resolve(res + 222)

    }).then(res => {
        console.log(res, '第三层的 10 行处理代码');
    })


</script>

```

以上代码还可以通过下面的代码达到最佳简写方式

```js

<script>

    new Promise((resolve, reject) => {
        setTimeout(() => {
            resolve('aaa')
        }, 1000)
    }).then(res => {
        // 自己处理 10 行代码
        console.log(res, '第一层的 10 行代码处理');

        // 对结果进行第一次处理
        return res + 1111

    }).then(res => {
        console.log(res, '第二层的 10 行处理代码');

        return res + 222

    }).then(res => {
        console.log(res, '第三层的 10 行处理代码');
    })


</script>

```


## 网络请求时，如果有网络请求失败时候的处理

> 在任何一步网络请求中，如果有失败， catch 方法都可以完美获取到错误

```js

<script>

    new Promise((resolve, reject) => {
        setTimeout(() => {
            resolve('aaa')
        }, 1000)
    }).then(res => {
        // 自己处理 10 行代码
        console.log(res, '第一层的 10 行代码处理');

        // 对结果进行第一次处理
        // return Promise.reject('第一次请求失败')
        return res + 111

    }).then(res => {
        console.log(res, '第二层的 10 行处理代码');

        // return res + 222
        throw '第二次请求失败'

    }).then(res => {
        console.log(res, '第三层的 10 行处理代码');
    }).catch(err => {
        console.log('异常错误：', err);
    })


</script>

```

## 当需要同时执行两个异步请求的时候 （很早之前的方案）

```js

<script>

    let isResult1 = false
    let isResult2 = false

    $.ajax({
        url: '',
        success: function () {
            console.log('结果1');
            isResult1 = true;
            handleResult()
        }
    })

    $.ajax({
        url: '',
        success: function () {
            console.log('结果2');
            isResult2 = true;
            handleResult()
        }
    })

    function handleResult () {
        if  (isResult1 && isResult2) {
            console.log('当网络请求 1 和网络请求 2 都处理完毕之后执行');
        }
    } 
    
</script>    
    
```

## 当同时执行两个异步请求的时候，采用 Promise 的 all 方法

```js

<script>

    Promise.all([

        new Promise((resolve,reject) => {
            $.ajax({
                url: 'url1',
                success: function (data) {
                    resolve(data)
                }
            })
        }),
        new Promise((resolve,reject) => {
            $.ajax({
                url: 'url2',
                success: function (data) {
                    resolve(data)
                }
            })
        })

    ]).then(results => {
        results[0];  // 第一个网络请求的结果  
        results[1];  // 第二个网络请求的结果
    })


</script>

```

## 当同时执行两个异步请求的时候，只需要获得先返回的结果即可时，可以用 Promise 的 race 方法

```js

let p1 = new Promise(function (resolve, reject) {
    setTimeout(resolve, 500, 'P1');
});
let p2 = new Promise(function (resolve, reject) {
    setTimeout(resolve, 600, 'P2');
});

Promise.race([p1, p2]).then(function (result) {
    console.log(result); // 这里有可能会返回 p1 的处理结果，也有可能会出现 p2 的处理结果，具体的要看谁处理的快，就返回谁的处理结果
});


```
