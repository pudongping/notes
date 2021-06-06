# python 高阶函数

## map

> `map()` 函数接收两个参数，一个是函数，一个是 `Iterable`，`map`将传入的函数依次作用到序列的每个元素，并把结果作为新的 `Iterator` 返回。


```python

# 把这个 list 所有数字转为字符串

l = list(map(str, [1, 2, 3, 4]))

print(l)  # ['1', '2', '3', '4']

```

## reduce

> `reduce` 把一个函数作用在一个序列 `[x1, x2, x3, ...]` 上，这个函数必须接收两个参数，`reduce` 把结果继续和序列的下一个元素做累积计算，其效果就是：

```python
reduce(f, [x1, x2, x3, x4]) = f(f(f(x1, x2), x3), x4)
```

自己实现字符串转整型的方法

```python

from functools import reduce

DIGITS = {'0': 0, '1': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6, '7': 7, '8': 8, '9': 9}

def str2int(s):
    def fn(x, y):
        return x * 10 + y
    def char2num(s):
        return DIGITS[s]
    return reduce(fn, map(char2num, s))

print(str2int('139'))  # 139

```

## filter

> `filter` 用于过滤序列，和 `map()` 类似，`filter()` 也接收一个函数和一个序列。和 `map()` 不同的是，`filter()` 把传入的函数依次作用于每个元素，然后根据返回值是 `True` 还是 `False` 决定保留还是丢弃该元素。

过滤序列中的空字符串

```python

def not_empty(s):
    return s and s.strip()

l = list(filter(not_empty, ['A', '', 'B', None, 'C', '  ']))

print(l)  # ['A', 'B', 'C']

```

## sorted

> `sorted` 可以对 list 进行排序，还可以接收一个 `key` 函数来实现自定义的排序。

```python

l = sorted([36, 5, -12, 9, -21])
print(l)  # [-21, -12, 5, 9, 36]

# 根据绝对值做排序
l1 = sorted([36, 5, -12, 9, -21], key=abs)
print(l1)  # [5, 9, -12, -21, 36]

```

## zip

> `zip` 可以将两个 list 中的每一个元素进行合并。

```python

l1 = [1, 2, 3, 88]
l2 = [4, 5, 6]

r1 = list(zip(l1, l2))
print(r1)  # [(1, 4), (2, 5), (3, 6)]

r2 = l1 + l2
print(r2)  # [1, 2, 3, 88, 4, 5, 6]

```

## copy 和 deepcopy
> `copy` 只会复制父对象，子对象是公用的，`deepcopy` 会完全复制父对象和子对象

```python

import copy
a = [1,2,3,[5,6,7]]
b = a

# id为硬盘空间索引
print(id(a) == id(b)) # True

# 浅复制
c = copy.copy(a)

print(id(a) == id(c)) # False,说明 a和c不是同样的东西

d = copy.copy(a)

print(id(a[1]) == id(d[1])) # True,说明子对象是相同的东西

a[1] = 555

print(a,d) # a => [1, 555, 3, [5, 6, 7]], b => [1, 2, 3, [5, 6, 7]]

a[3][1] = 666

print(a,d) # a => [1, 555, 3, [5, 666, 7]], b => [1, 2, 3, [5, 666, 7]]


# 深复制
import copy
a = [1,2,3,[5,6,7]]

b = copy.deepcopy(a)

print(id(a)==id(b)) # False 完全是不一样的东西

```

# 函数作为返回值 （闭包函数）

```python

# 这里就是一个闭包函数
# 不需要立即求和时（懒计算）
def lazy_sum(*args):
    def sum():
        ax = 0
        for n in args:
            ax = ax + n
        return ax
    return sum

# 返回的并不是求和结果，而是求和函数
f = lazy_sum(1, 3, 5, 7)

# 调用函数时才会真正计算求和的结果
print(f())  # 16 

# 当我们调用 lazy_sum() 时，每次调用都会返回一个新的函数，即使传入相同的参数
f1 = lazy_sum(1, 3, 5, 7)
f2 = lazy_sum(1, 3, 5, 7)
print(f1 == f2)  # False
```

## 简单闭包（闭包 = 函数 + 环境变量）

```python

# 闭包 = 函数 + 环境变量
def curve_pre():
    a = 25
    def curve(x):
        return a*x*x
    return curve

a = 10
f = curve_pre()
print(f(2))

```

对闭包理解容易犯错点

```python

# 错误示例
# def f1():
#     a = 10
#     def f2():
#         # a 被 python 认为是一个局部变量
#         c = 20
#     return f2

# f = f1()
# '''
# 此时 f2 并不能是一个闭包
# '''
# print(f)   
# print(f.__closure__)  


def f1():
    a = 10
    def f2():
        # 必须要引用外部的 a 变量，而不是重新给 a 变量赋值
        c = 20 * a
    return f2

f = f1()
'''
此时 f2 就是一个闭包函数
'''
print(f)
print(f.__closure__) 

```

## 让变量可以临时保存

```python

origin = 0

def factory(pos):
    def go(step):
        # 强制标注不是本地的局部变量
        nonlocal pos
        new_pos = pos + step
        pos = new_pos
        return new_pos
    return go

tourist = factory(origin)

# 2
print(tourist(2))
# 5
print(tourist(3))
# 10
print(tourist(5))

```

# 匿名函数 lambda

> 匿名函数有个限制，就是只能有一个表达式，不用写 `return`，返回值就是该表达式的结果

```python

l1 = list(map(lambda x: x * x, [1, 2, 3, 4]))

print(l1)  # [1, 4, 9, 16]

# 匿名函数 lambda x: x * x 实际上就是
def f(x):
    return x * x

# 关键字 lamdba 表示匿名函数，冒号前面的 x 表示函数参数

# 还可以将匿名函数赋值给一个变量，再利用变量来调改函数
f = lambda x: x * x
print(f(5))  #  25 

```

# 装饰器 decorator

> 在代码运行期间动态增加功能的方式，称之为“装饰器”（Decorator）

## 定义装饰器

```python

import time

def decorator(func):
    def wrapper():
        print(time.time())
        func()
    return wrapper

# 定义装饰器 这里的 [decorator] 和 上面的 def decorator 名称必须是一致的
@decorator
def f1():
    print('This is a function')

# 调用方式没有改变
f1()

```

## 当调用装饰器中方法有多个且每个方法参数数量不一致时

```python

import time

def decorator(func):
    def wrapper(*args):
        print(time.time())
        func(*args)
    return wrapper

@decorator
def f1(func_name):
    print('This is a function named ' + func_name)

@decorator
def f2(func_name1, func_name2):
    print('This is a function named ' + func_name1)
    print('This is a function named ' + func_name2)


f1('cc')
f2('cc1', 'cc2')

```

## 当调用装饰器中方法有指定参数时

```python

import time

def decorator(func):
    def wrapper(*args, **kw):
        print(time.time())
        func(*args, **kw)
    return wrapper

@decorator
def f1(func_name):
    print('This is a function named ' + func_name)

@decorator
def f2(func_name1, func_name2):
    print('This is a function named ' + func_name1)
    print('This is a function named ' + func_name2)

@decorator
def f3(func_name1, func_name2, **keyword):
    print('This is a function named ' + func_name1)
    print('This is a function named ' + func_name2)
    print(keyword)

f1('cc')
f2('cc1', 'cc2')
f3('cc1', 'cc2', a=1, b=2, c='1,2,3')

```
