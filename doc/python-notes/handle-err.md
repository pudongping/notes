# python 错误、异常处理、记录日志

## 异常

```python

import logging

try:
    print('try...')
    r = 10 / 0
    print('result:', r)
except ValueError as e:  # 所有的错误实例都是从 BaseException 类派生的
    print('ValueError:', e)
except ZeroDivisionError as e:
    # print('except:', e)
    logging.exception(e)  # 记录错误信息
    # raise =>  raise 语句如果不带参数，就会把当前错误原样抛出
    # raise ValueError('input error!')  => 还可以把一种类型的错误转化为另一种类型
else:  # 如果没有错误发生时，会自动执行 else 语句。也可以不需要 else 语句
    print('no error!')
finally:  # 不管是否异常，都会执行 finally 模块的代码。可以没有 finally 语句
    print('finally...')
print('END')


# 常用的异常处理如下写法足矣
try:
    return self[key]
except KeyError:
    raise AttributeError(r"'Dict' object has no attribute '%s'" % key)

```

## 断言 assert

```python

def foo(s):
    n = int(s)
    assert n != 0, 'n is zero!'  # 断言 n != 0 应该是 True 否则后面的代码肯定会出错，且此时 assert 会抛出 AssertionError 异常
    return 10 / n

foo('0')

```

## 记录日志 logging

> 日志级别优先级 debug < info < warning < error < critical 当日志级别为 warning 时，warning、error、critical 这三个级别才会触发

```python

import logging
logging.basicConfig(
    level=logging.INFO,
    filename='runtime.log',
    datefmt='%Y-%m-%d %H:%M:%S',
    format="【%(asctime)s %(levelname)s】 %(lineno)d: %(message)s"
)

def foo(s):
    n = int(s)
    logging.debug('出错啦！')
    return 10 / n

foo('0')

```
