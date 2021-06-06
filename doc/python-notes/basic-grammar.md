
<extoc></extoc>

# python 基础语法

## python 中只有两种循环方式 for 和 while

> 可以使用 continue 和 break 关键字

```python

# for 循环
for x in list(range(5)):
    if n % 2 == 0: # 只取奇数
        continue
    print(x)


# while 循环
sum = 0
n = 5
while n > 0:
    if n < 3:
        break
    sum = sum + n
    n = n -1
print(sum)

```

## input 交互式输入

```python

# input 返回值为 string
a_input = input('Please give a number:')

if a_input == '1':
    print('This is a good one')
elif a_input == str(2):
    print('See you next time')
else:
    print('Good luck')

```

## 三元表达式

```python

# 条件为真时返回的结果 if 条件判断 else 条件为假时的返回结果

x if x > y else y

```

## 用字典映射代替 switch case 语句

```python

'''
用字典映射代替 switch case 语句
'''

day = 6

def get_sunday():
    return 'sunday'

def get_monday():
    return 'monday'

def get_tuesday():
    return 'tuesday'

def get_default():
    return 'Unkown'    

switcher = {
    0 : get_sunday,
    1 : get_monday,
    2 : get_tuesday
}

# 调用方法时，需要添加最后一个括号 ()
day_name = switcher.get(day, get_default)()
print(day_name)  # Unkown

```
