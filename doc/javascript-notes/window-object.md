# 浏览器对象

## window

window 对象不但充当全局作用域，而且表示浏览器窗口

```js

// 内部宽高是指除去菜单栏、工具栏、边框等占位元素后，用于显示网页的净宽高。
window.innerWidth;  // 获取浏览器窗口的内部宽度
window.innerHeight;  // 获取浏览器窗口的内部高度
window.outerWidth;  // 获取浏览器窗口的整个宽度
window.outerHeight;  // 获取浏览器窗口的整个高度

```

## navigator

navigator 对象表示获取浏览器信息

```js

navigator.appName;  // 浏览器名称
navigator.appVersion;  // 浏览器版本
navigator.language;  // 浏览器设置的语言
navigator.platform;  // 操作系统类型
navigator.userAgent;  // 浏览器设定的 User-Agent 字符串

```

## screen

screen 对象表示屏幕的信息

```js

screen.width;  // 屏幕宽度，以像素为单位
screen.height;  // 屏幕高度，以像素为单位
screen.colorDepth;  // 返回颜色位数，如8、16、24

```

## location

location 对象表示当前页面的 url 信息，比如一个完整的 url 为：`http://www.example.com:8080/path/index.html?a=1&b=2#TOP`

```js

// 获取完整的 url
location.href;  // "http://www.example.com:8080/path/index.html?a=1&b=2#TOP"

// 获取协议
location.protocol;  // "http"

// 获取主机域名
location.host;  // "www.example.com"

// 获取端口
location.port;  // "8080"

// 获取路径名
location.pathname;  // "/path/index.html"

// 获取 get 参数
location.search;  // "?a=1&b=2"

// 获取 hash 参数
location.hash;  // "TOP"

// 加载一个新页面
location.assign("http://www.baidu.com?a=1&b=2");  // 会跳转到 `http://www.baidu.com?a=1&b=2` 页面中去

// 重新加载当前页面
location.reload();

```

## document

document 对象就是整个 DOM 树的根节点

> 服务器端在设置 Cookie 时，应该始终坚持使用 `httpOnly` ，从而不让 JavaScript 读取 cookie

```js

document.cookie;  // 获取当前页面的 Cookie

```
