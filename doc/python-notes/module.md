# python 模块

> [官方第三方模块库](https://pypi.org/)  
[Anaconda 是基于 Python 的数据处理和科学计算平台，它已经内置了许多非常有用的第三方库 ](https://www.anaconda.com/download/)

## 模块 （Module）

> 一个 `.py` 文件就是一个 python 模块（Module）

## 包 （Package）

- 一个目录就是一个包
- 每一个包目录下面都会有一个 `__init__.py` 的文件，这个文件是 **必须存在**的，否则，Python就把这个目录当成普通目录，而不是一个包。 `__init__.py` 可以是空文件，也可以有Python代码，因为__init__.py本身就是一个模块，而它的模块名就是文件夹的名称

```python

demo1
├─ __init__.py
├─ abc.py
└─ xyz.py

abc.py 的模块名就为 demo1.abc 
```

> 自己创建模块时要注意命名，不能和 Python 自带的模块名称冲突。例如，系统自带了 sys 模块，自己的模块就不可命名为 sys.py ，否则将无法导入系统自带的 sys 模块。

模块名不要和系统模块名冲突，最好先查看系统是否已存在该模块，检查方法是在 Python 交互环境执行 `import abc` ，若成功则说明系统存在此模块

## 模块的写法

hello.py

```python

#!/usr/bin/env python3  # 第 1 行：可以让这个 hello.py 文件直接在 Unix/Linux/Mac 上运行
# -*- coding: utf-8 -*-  # 第 2 行：表示 .py 文件本身使用标准 UTF-8 编码

' a test module '  # 第 4 行： 是一个字符串，表示模块的文档注释，任何模块代码的第一个字符串都被视为模块的文档注释；

__author__ = 'Alex Pu'  # 第 6 行： 使用__author__变量把作者写进去

import sys

def test():
    args = sys.argv  # sys模块有一个 argv 变量，用 list 存储了命令行的所有参数。
    if len(args)==1:
        print('Hello, world!')
    elif len(args)==2:
        print('Hello, %s!' % args[1])
    else:
        print('Too many arguments!')

if __name__=='__main__':
    test()

# 执行代码
# python3 hello.py  => Hello, world!
# python3 hello.py alex  => Hello, alex!
```

## 作用域

- 类似 `__xxx__` 这样的变量是特殊变量，可以被直接引用，但是有特殊用途，比如上面的 `__author__`，`__name__` 就是特殊变量，hello 模块定义的文档注释也可以用特殊变量 `__doc__` 访问，我们自己的变量一般不要用这种变量名
- 类似 `_xxx` 和 `__xxx` 这样的函数或变量就是非公开的（private），不应该被直接引用，比如 `_abc`，`__abc` 等；

> 但是 python 并没有一种方法可以完全限制访问 private 函数或变量！


## import 载入模块

```python

# 方法01、直接载入
import time

print(time.localtime())


# 方法02、直接载入并别名
import time as t

print(t.localtime())


# 方法03、只载入 time 模块的部分功能
from time import localtime,time

print(localtime())


# 方法04、载入 time 模块的全部功能
from time import *

print(localtime())

```
