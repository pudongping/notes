# JavaScript 操作文件

上传文件的控件为 `<input type="file">` 当一个表单包含此控件时，表单的 `enctype` 必须指定为 `multipart/form-data` ， `method` 必须指定为 `post` ，浏览器才能发送表单数据，出于安全考虑，浏览器只允许用户点击 `<input type="file">` 来选择本地文件，用 JavaScript 对 `<input type="file">` 的 `value` 赋值是没有任何效果的。

## 案例

读取用户选择的图片文件，并在一个 div 中预览图像

```html

<form method="post" action="http://localhost/test" enctype="multipart/form-data">
    <div id="test-image-preview">
    <input type="file" id="test-image-file" name="test">
    <p id="test-file-info">
</form>

<script>

    let
        fileInput = document.getElementById('test-image-file'),
        info = document.getElementById('test-file-info'),
        preview = document.getElementById('test-image-preview');
        
    // 监听change事件:
    fileInput.addEventListener('change', function () {
        // 清除背景图片:
        preview.style.backgroundImage = '';
        // 检查文件是否选择:
        if (!fileInput.value) {
            info.innerHTML = '没有选择文件';
            return;
        }
        // 获取File引用:
        var file = fileInput.files[0];
        // 获取File信息:
        info.innerHTML = '文件: ' + file.name + '<br>' +
                         '大小: ' + file.size + '<br>' +
                         '修改: ' + file.lastModifiedDate;
        if (file.type !== 'image/jpeg' && file.type !== 'image/png' && file.type !== 'image/gif') {
            alert('不是有效的图片文件!');
            return;
        }
        // 读取文件:
        let reader = new FileReader();
        reader.onload = function(e) {  // 当文件读取完成后，自动调用此函数
            let
                data = e.target.result; // 'data:image/jpeg;base64,/9j/4AAQSk...(base64编码)...'            
            preview.style.backgroundImage = 'url(' + data + ')';
        };
        // 以 DataURL 的形式读取文件:
        reader.readAsDataURL(file);
    });

</script>

```
