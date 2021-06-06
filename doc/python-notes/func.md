# python 函数以及传参

## 参数组合时，必须按照： 必选参数、默认参数、可变参数、命名关键字参数、关键字参数的顺序使用

## 技巧
对于任意函数，都可以使用 `func(*args, **kw)` 的形式调用

> `*args` 是可变参数，args 接收的是一个 tuple  
`**kw` 是关键字参数，kw 接收的是一个 dict

```python

def tt(name, age, *, city='Shanghai', job):
    print('name: ', name, 'age: ', age, 'city: ', city, 'job: ', job)

args = ('alex', 26)
kw = {'city': 'Chongqin', 'job': 'Coder'}
tt(*args, **kw)

```

### 默认参数

```python

def tt(name, age=18):
    print(f'the name is {name}')
    print(f'the age is {age}')

tt('alex', 26)

# output
# the name is alex
# the age is 26

```

### 多个默认参数时

```python


def tt(name, age=18, gender=1, city='Shanghai'):
    print(f'the name is {name}')
    print(f'the age is {age}')
    print(f'the gender is {gender}')
    print(f'the city is {city}')

tt('alex')
tt('alex', 26, 0, 'Hubei')
tt('alex', 26, 12, city='Chongqing')
tt(city='Hubei', gender=0, name='zhangsan')

```

### 可变参数 *（参数的个数不确定）

```python

def cacl(numbers):
    sum = 0
    for n in numbers:
        sum = sum + n
    return sum

# 调用的时候需要先组装成一个 list 或者一个 tuple
res = cacl([1, 2, 3])
res = cacl((1, 2, 3))
print(res)



# 将参数更改为可变参数
def cacl(*numbers):
    print(type(numbers)) # 为一个元组 tuple
    sum = 0
    for n in numbers:
        sum = sum + n
    return sum

# 调用的时候则可以直接传参，不再需要转换成 list 或者 tuple
res = cacl(1, 2, 3)
print(res)

# 如果已经存在了一个 list 或者一个 tuple 时，则只需要将 list 或者 tuple 的元素转变成可变参数传进去即可

numbers = [1, 2, 3]
# 或者 numbers = (1, 2, 3)
res = cacl(*numbers)
print(res)
```

### 关键字参数 **

```python


def tt(name, age, **kwargs):
    print('name: ', name, 'age: ', age, 'keywords: ', kwargs)

tt('alex', 26)  # name:  alex age:  26 keywords:  {}
tt('alex', 26, city='Shanghai', job='Coder')  # name:  alex age:  26 keywords:  {'city': 'Shanghai', 'job': 'Coder'}

extra = {'city': 'Shanghai', 'job': 'Coder'}
tt('alex', 26, **extra)  # name:  alex age:  26 keywords:  {'city': 'Shanghai', 'job': 'Coder'}

```

### 命名关键字参数

```python

# 只接收 city 和 job 作为关键字参数
def tt(name, age, *, city, job):
    print('name: ', name, 'age: ', age, 'city: ', city, 'job: ', job)

tt('alex', 26, job='Coder', city='Shanghai')

# 或者设置默认值
def tt(name, age, *, city='Shanghai', job):
    print('name: ', name, 'age: ', age, 'city: ', city, 'job: ', job)

tt('alex', 26, job='Coder')

```

### 函数多个返回结果

```python

def demage(skill1, skill2):
    damage1 = skill1 * 3
    damage2 = skill2 * 2 + 10
    return damage1,damage2


# 返回结果类型为tuple
print(type(demage(1, 2)))   

# 序列解包的方式接受返回值
skill1_demage, skill2_demage = demage(1, 2) 
print(skill1_demage, skill2_demage)  

```
