## Python 的基本数据类型

### 1. Number：数字（整数、小数）

- 整数：int

```
10_000_000_000 和 10000000000 是完全一样的
```

- 浮点数：float （ python 默认就已经是双精度了）
> Python的浮点数也没有大小限制，但是超出一定范围就直接表示为inf（无限大）
- 布尔类型：bool （ True 和 False ）

```
and => 逻辑与
or => 逻辑或
not => 逻辑非
```

- 复数：complex

> 其他语言对于浮点数会有：单精度（float）、双精度（double）  
其他语言对于整数会有：short、int、long

```

2/2    => 1.0   除法运算会自动转化成浮点数
2//2   => 1     整除（地板除） 1//2 => 0 ， 10 // 3 => 3
10 % 3 => 1     余数运算

```

### 2. str：字符串（序列）

```

# 对字符串不转义
print(r'\\\t\\')  => \\\t\\

# 表示多行内容时
print('''line1
    line2
    line3''')
    
# 只有一个参数时
'Hello, %s' % 'world' => 'hello, world'
# 多个参数时
'Hello, %s: your age is %d' % ('alex', 26) => 'Hello, alex: your age is 26'

f-string 方式格式化字符串
r = 3.5
s = 3.1415926
print(f'The r is {r} and the s is {s:.2f}')  # .2f 表示保留两位小数

The r is 3.5 and the s is 3.14

```

### 3. 组（序列）

- 列表: list （可变化的有序表）

list 是一种有序的集合，可以随时添加和删除其中的元素。

```
# 申明一个空列表
list1 = []
# 或者
list1 = list()

# 嵌套列表
list1 = [1, 2, 3, 'hello', 'world', True, False, [5,6,7]]

list1[0] => 1 # 取出第一个元素
list1[-1] 或者 list1[(len(list1) -1)] => [5,6,7] # 取出最后一个元素

# 追加元素到末尾
list1.append('alex')
# 插入元素到指定位置
list1.insert(3, 'alex')

# 删除末尾的元素
list1.pop()
# 删除指定位置的元素（索引位置）
list1.pop(3)

# 更新指定位置元素
list1[3] = 'alex'

# 从小到大排序
list1.sort()
# 从大到小排序
list1.sort(reverse=True)

```

- 元组: tuple （不可变化的有序表：*指向不变*）

tuple 一旦初始化就不能修改。

```

# 定义一个空 tuple
tuple1 = ()
# 或者
tuple1 = tuple()

# 比较特殊的现象 (1) 为 int 类型，是因为：小括号在 python 中表示数学运算优先级，因此定义一个元素的 tuple 时，必须加一个逗号，来消除歧义，python 在显示一个元素的 tuple 时，也会加一个逗号，以免开发人员误解成数学计算意义上的括号
tuple2 = (1,)

tuple1 = (1, '-1', True, False)
# 也可以这么定义（不加括号）
tuple2 = 1, '-1', True, False

tuple1[0] => 1 # 取出第一个元素

# 理解 *指向不变*
t = ('a', 'b', ['A', 'B'])
t[2][0] = 'X'
t[2][1] = 'Y'
# 以上结果同样成立，因为 t 中的 list 本身是可变的，但是 `t[2][2] = 'Z'` 则会报错，因此，tuple 的每个元素，指向永远不变。 

```


### 4. set：集合 （不会有重复的值）

> set 和 dict 的唯一区别仅在于没有存储对应的 value, set 可以看成数学意义上的无序和无重复元素的集合


```python

# 申明一个空的 set
s = set()
# 提供一个 list 作为输入集合，重复元素会在 set 中自动被过滤掉
s = set([2, 3, 4, 4, 5, 1, 1])

# 放入一个字典作为输入集合
ss = set({1, 2})

s.add(6) # 添加新元素到 set 中
s.add(5) # 重复添加元素到 set 中，可以添加，但是不会有效果

s.remove(4) # 删除元素

s1 = set([1, 2, 3])
s2 = set([2, 3, 4])
# 两个集合的交集
join_s = s1 & s2
# print(join_s) => {2, 3}

# 两个集合的并集
union_s = s1 | s2
# print(union_s) => {1, 2, 3, 4}

# 两个集合的差集
c_s = s1 - s2
# print(c_s) => {1}
c_s1 = s2 -s1
# print(c_s1) => {4}

```

### 5. dict：字典
dict 全 称dictionary，在其他语言中也称为 map，使用键-值（key-value）存储，具有极快的查找速度。

> 1. 不允许有重复的 key
> 2. key 必须为不可变的类型，比如：int、str

特点有：
1. 查找和插入的速度极快，不会随着 key 的增加而变慢；
2. 需要占用大量的内存，内存浪费多。

而 list 相反：

1. 查找和插入的时间随着元素的增加而增加；
2. 占用空间小，浪费内存很少。

所以，dict 是用空间来换取时间的一种方法。

```python

# 申明一个空的字典
dict1 = {}
# 或者
dict1 = dict()

dict1 = {'name': 'harry', 'age': 26}

# 取出字典中的某个值
name = dict1['name']
# 或者
name = dict1.get('name')

# 向字典中增加一个元素
dict1['sex'] = 1

# 修改字典中的某个值
dict1['name'] = 'alex'

# 避免 key 不存在的情况，有两种方法
# 1、判断字典中的 key 是否存在，存在时为 True 不存在时为 False
a = 'name' in dict1
# 2、直接尝试从字典中取 key 所对应的值，如果不存在则返回 None ，或者可以提供 get 的第二个参数，返回自定义的 value
print(dict1.get('name1'))
print(dict1.get('name1', 'jack'))

# 删除一个 key
dict1.pop('name')
print(dict1)

```

### 6. None 空值
