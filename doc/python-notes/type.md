# python 类型判断

- 判断基本数据类型

```python

t1 = type(123) == type(456)
print(t1)  # True

t2 = type(123) == int
print(t2)  # True

t3 = type('a') == type('1')
print(t3)  # True

t4 = type('a') == str
print(t4)  # True

t5 = type(123) == type('123')
print(t5)  # False

t6 = isinstance('a', str)
print(t6)  # True

t7 = isinstance(123, (list, int, str))
print(t7)  # True

```

- 判断一个对象是否是函数

```python


import types

def fn():
    pass

t1 = type(fn) == types.FunctionType  # types 模块中定义的常量
print(t1)  # True

t2 = type(abs)==types.BuiltinFunctionType
print(t2)  # True

t3 = type(lambda x: x)==types.LambdaType
print(t3)  # True

t4 = type((x for x in range(10)))==types.GeneratorType
print(t4)  # True

```
