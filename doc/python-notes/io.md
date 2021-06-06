# python IO 编程

## 文件 IO

> [官方文档 open 函数](https://docs.python.org/3/library/functions.html#open)

### 读文件

```python

# 方式1:

try:
    f = open('./runtime.log', 'r')  # 文件不存在时，会抛出 IOError 错误
    print(f.read())  # 读取文件的全部内容
finally:
    if f:
        f.close()  # 文件使用完毕后必须关闭，因为文件对象会占用操作系统的资源，并且操作系统同一时间能打开的文件数量也是有限的
        
        
# 方式2:        

# 使用 with 语句来自动调用 close() 方法，使得代码更加简洁，二者其实质性是一样的
with open('./runtime.log', 'r') as f:
    print(f.read())  # 一次性读取文件的全部内容
    print(f.read(10))  # 每次最多读取 10 个字节的内容
    print(f.readline())  # 每次读取一行内容

    for line in f.readlines():  # 一次性读取所有内容并按行返回一个 list
        print(line.strip())  # 把末尾的 '\n' 删掉        

```

### 读二进制文件

```python

# 读取二进制文件，比如图片、视频等，需要 `rb` 模式打开文件即可

f = open('./aa.jpg', 'rb')
print(f.read())  # 返回十六进制表示的字节

```

### 字符编码

```python

# 要读取非 utf-8 的文本文件时
f = open('./gbk.txt', 'r', encoding='gbk')
print(f.read())

# 如果遇到编码不规范的文件时
f = open('./gbk.txt', 'r', encoding='gbk', errors='ignore')
print(f.read())

```

### 写文件

```python

# 方式1:

f = open('./runtime.log', 'a')  # `w` 覆盖写入、`a` 追加写入、`wb` 写二进制文件
f = open('./runtime.log', 'a', encoding='gbk')  # 如果需要写入非 utf-8 编码时
f.write('Hello Alex')
f.close()  # 必须要关闭文件，只有调用了 close() 方法时，操作系统才保证把没有写入的数据全部写入磁盘


# 方式2:

# 不用自己调用 close() 方法关闭文件
with open('./runtime.log', 'w') as f:
    f.write('Hello Alex')

```

## 操作文件和目录

```python

# 查看当前目录的绝对路径
abs_path = os.path.abspath('.')
print(abs_path)  # /Users/pudongping/glory/codes/python/document-converter

# 在某个目录下创建一个新目录，首先把新目录的完整路径表示出来
 # 路径拼接时，需要通过 os.path.join() 函数来操作，避免不同操作系统的路径分隔符不一致导致出错
new_path = os.path.join(abs_path, 'demodir/abc/cc')
print(new_path)  # /Users/pudongping/glory/codes/python/document-converter/demodir/abc/cc


# 如果只需要创建一个目录时
os.mkdir(new_path)
# 创建多层级的目录时
os.makedirs(new_path)

# 删除一个目录
os.rmdir(new_path)


# 拆分路径
path_split = os.path.split(new_path)
# 后一部分总是最后级别的目录或文件名
print(path_split)  # ('/Users/pudongping/glory/codes/python/document-converter/demodir/abc', 'cc')
runtime_path = os.path.join(abs_path, 'runtime.log')
print(runtime_path)  # /Users/pudongping/glory/codes/python/document-converter/runtime.log
runtime_split = os.path.split(runtime_path)
print(runtime_split)  # ('/Users/pudongping/glory/codes/python/document-converter', 'runtime.log')

# 可以直接得到文件扩展名
runtime_split_text = os.path.splitext(runtime_path)
print(runtime_split_text)  # ('/Users/pudongping/glory/codes/python/document-converter/runtime', '.log')



# 对文件重命名
os.rename(runtime_path, 'runtime1.log')

# 复制文件
# 复制文件的函数在 os 模块中不存在
import shutil
shutil.copyfile('./runtime1.log', 'runtime.log')

# 删除文件
os.remove('./runtime1.log')

```

## json 转换

> 如果需要对类转 json 时，可以参考 [json 进阶](https://www.liaoxuefeng.com/wiki/1016959663602400/1017624706151424)

```python

import json

d = dict(name='alex', age=26, city='Chongqin')

# 转换为 json 字符串
json_encode = json.dumps(d)
print(json_encode)  # {"name": "alex", "age": 26, "city": "Chongqin"}
print(type(json_encode))  # <class 'str'>

# 对中文序列化时
d = dict(name='张三', age=26, city='Chongqin')

json_encode = json.dumps(d, ensure_ascii=False)
print(json_encode)  # {"name": "张三", "age": 26, "city": "Chongqin"}

# 把 json 反序列化为 python 对象
json_decode = json.loads(json_encode)
print(json_decode)  # {'name': 'alex', 'age': 26, 'city': 'Chongqin'}
print(type(json_decode))  # <class 'dict'>

```
