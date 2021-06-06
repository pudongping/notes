# python 高级特性

## 切片

```python

l = list(range(100))

l1 = l[0:3]  # 取前三个数
# print(l1)  # [0, 1, 2]

l2 = l[:3]  # 如果第一个索引是 0 ，还可以这么取前三个数
# print(l2)  # [0, 1, 2]

l3 = l[2:5]  # 从索引 2 开始取值取 (5-2=3) 个元素出来
# print(l3)  # [2, 3, 4]

l4 = l[-10:]  # 取后十个数
# print(l4)  # [90, 91, 92, 93, 94, 95, 96, 97, 98, 99]

l5 = l[:10:2]  # 取前 10 个数，每隔 2 个取一个数
# print(l5)  # [0, 2, 4, 6, 8]

l6 = l[::10]  # 所有的数，每隔 10 个取一个数
# print(l6)  # [0, 10, 20, 30, 40, 50, 60, 70, 80, 90]

l7 = l[:]  # 什么都不写，则原样复制一个 list
# print(l7)  # [0, 1, 2, 3, ……, 97, 98, 99]

```

## 迭代

> 如果给定一个 list 或 tuple，我们可以通过 for 循环来遍历这个 list  或 tuple ，这种遍历我们称为迭代（Iteration）。只要作用于一个可迭代对象，for 循环就可以正常运行。

```python

d = {'a': 1, 'b': 2, 'c': 3, 'd': 4, 'e': 5}

# 只迭代 key 时
for key in d:
    print(key)  # a b c d e 
    

# 只迭代 value 时
for value in d.values():
    print(value)  # 1 2 3 4 5

# 同时迭代 key 和 value 时
for k,v in d.items():
    print(f'the key is {k} and the value is {v}')

# output    
# the key is a and the value is 1
# the key is b and the value is 2
# the key is c and the value is 3
# the key is d and the value is 4
# the key is e and the value is 5


# 如果是 list 的话，需要同时迭代索引和元素本身时

l = ['a', 'b', 'c', 'd']

for i, value in enumerate(l):
    print(i, value)

# output
# 0 a
# 1 b
# 2 c
# 3 d

```

如何判断一个对象是否为可迭代的对象？

```python

from collections.abc import Iterable

a = isinstance([], Iterable)  # True
b = isinstance({}, Iterable)  # True
c = isinstance('abc', Iterable)  # True
d = isinstance((x for x in range(10)), Iterable)  # True
e = isinstance(50, Iterable)  # False

```

## [列表生成式](https://www.liaoxuefeng.com/wiki/1016959663602400/1017317609699776) （支持：列表、元组、集合、字典）

> 是 Python 内置的非常简单却强大的可以用来创建 list 的生成式

```python

l = [x * x for x in range(1, 11)]
print(l)  # [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]

# 生成全排列
l1 = [m + n for m in 'ABC' for n in 'XYZ']
print(l1)  # ['AX', 'AY', 'AZ', 'BX', 'BY', 'BZ', 'CX', 'CY', 'CZ']

# for 后面的 if 是过滤条件，不能加 else
l = [x for x in range(1, 11) if x % 2 == 0]
print(l)  # [2, 4, 6, 8, 10]

# for 前面的 if else 是表达式，必须要加 else
l1 = [x if x % 2 == 0 else -x for x in range(1, 11)]
print(l1)  # [-1, 2, -3, 4, -5, 6, -7, 8, -9, 10]

```
