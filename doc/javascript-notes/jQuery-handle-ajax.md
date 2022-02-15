# jQuery 处理 AJAX 请求

- async：是否异步执行 ajax 请求，默认为 `true` ，建议不要指定为 `false`；
- method：发送的 method，默认为 `GET`，可指定 `POST` 、 `PUT` 等；
- contentType：发送 post 请求的格式，默认值为 `application/x-www-form-urlencoded; charset=UTF-8` 也可以指定为 `text/plain` 或者 `application/json` ；
- data：发送的数据，可以是字符串、数组或object，如果是 post 请求，会根据 contentType 把 data 序列化成合适的格式；
- headers：发送额外的 http 请求头，**必须** 是一个 object；
- dataType：接收的数据格式，可以指定为`html` 、 `xml` 、 `json` 、 `text` 等，缺省情况下根据响应的 `Content-Type` 猜测。

jQuery 的 jqXHR 对象类似于一个 Promise 对象。

```js

$.ajax('/api/demos', {
    dataType: 'json'
}).done(function (data) {
    console.log('成功，收到的数据为：' + JSON.stringify(data) );
}).fail(function (xhr, status) {
    console.log('失败：' + xhr.status + '，原因为： ' + status);
}).always(function () {
    console.log('请求完成：无论成功或失败都会调用！');
});

```

## jQuery 提供了一些辅助方法，比如：get、post、getJSON

```js

// 发送 get 请求
$.get('/path', {
    name: 'alex',
    age: 26
});

// 发送 post 请求，第二个参数默认被序列化为 application/x-www-form-urlencoded
$.post('/path', {
    name: 'alex',
    age: 26
});

// 快速通过 get 请求获取一个 json 对象
$.getJSON('/path', {
    name: 'alex',
    age: 26
}).done(function (data) {
    // data 已经被解析为 json 对象了
});


```
