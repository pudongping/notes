# python 类与对象

## 类与对象

### 定义最简单的类

```python

class Student(object):

    # 类变量
    name = 'init name'
    age = 0

    def __init__(self):
        pass

    def do_homework(self):
        pass

student1 = Student()
student2 = Student()

# 打印出对象实例的内存地址
# print(id(student1))  # 1989045387336
# print(id(student2))  # 1989045405384

# __dict__ 保存着当前对象实例下所有的变量
print(student1.__dict__)  # {}
print(student2.__dict__)  # {}

```

### 类变量和实例变量

> python 会先从对象的实例变量中查找变量，如果找不到，则会从类变量中查找，如果本类中依然找不到类变量，则会从父类中继续去查找
>
> 优先级为：对象的实例变量 > 类变量 > 父类类变量

```python

class Student(object):

    # 类变量只是和类相关联在一起的
    name = 'init name'
    age = 0

    # 这里的形参是实例变量，实例变量只是和对象实例关联在一起的
    def __init__(self, name1, age1):
        # self.name 类似于这样的，就是定义并赋值给实例变量（实例变量初始化）
        self.name = name1
        self.age = age1

    def do_homework(self):
        pass

student1 = Student('alex', 26)
student2 = Student('harry', 25)

print(student1.__dict__)  # {'name': 'alex', 'age': 26}
print(student2.__dict__)  # {'name': 'harry', 'age': 25}
print(Student.__dict__)  # {'__module__': '__main__', 'name': 'init name', 'age': 0, '__init__': <function Student.__init__ at 0x000001B59A382438>, 'do_homework': <function Student.do_homework at 0x000001B59A382708>, '__dict__': <attribute '__dict__' of 'Student' objects>, '__weakref__': <attribute '__weakref__' of 'Student' objects>, '__doc__': None}


# 访问实例变量
print(student1.name)  # alex
print(student2.name)  # harry

# 访问类变量
print(Student.name)  # init name

```

### 实例变量和类变量的区别

```python


class Student(object):
    name = 'alex'  # 类属性

s = Student()  # 创建实例对象 s

# 打印 name 属性，因为实例没有 name 属性，所以会继续查找 class 的 name 属性
print(s.name)  # alex

# 打印 class 的 name 属性
print(Student.name)  # alex

# 给实例对象 s 绑定 name 属性
s.name = 'Harry'
# 由于实例属性优先级比类属性高，因此，会屏蔽掉 class 的 name 属性
print(s.name)  # Harry

# 但是 class 属性并没有消失，类属性还是可以访问
print(Student.name)  # alex

# 删除掉实例对象 s 的属性
del s.name
# 由于实例对象 s 的属性没有找到，因此此时会显示出 class 的 name 属性
print(s.name)  # alex

```

### 使用 __slots__ 限制实例的属性

> `__slots__` 定义的属性仅对当前类实例起作用，对继承的子类是不起作用的，除非在子类中也定义 `__slots__` ，这样，子类实例允许定义的属性就是自身的 `__slots__` 加上父类的 `__slots__`

```python

class Student(object):
    
    __slots__ = ('name', 'age')  # 用 tuple 定义允许绑定的属性名称，不在此 tuple 中的属性将不能通过实例绑定

s = Student()
s.name = 'alex'
s.age = 26

# 当尝试绑定除了 __slots__ 之外的属性时，会报错
s.city = 'Chongqin'  # 会报错

```

### 实例方法

```python

class Student(object):

    # 类变量
    all_students = 0

    # 这里的 self 可以随便命名，比如说 this、aa、bb 都可以，但是建议命名为 self
    # self 代表的是实例对象，而不是类
    # 构造方法可以看成比较特殊的实例方法
    def __init__(self, name1, age1):
        self.name = name1
        self.age = age1

    # 实例方法
    def cal_all_students(self):
        print(self.name)  # 实例方法中访问实例变量

        # 访问类变量
        print(Student.all_students)  # 实例方法中访问类变量
        print(self.__class__.all_students)  # 这种方式也可以访问类变量

student1 = Student('alex', 26)
student2 = Student('harry', 25)

# 访问实例变量
print(student1.name)  # alex
print(student2.name)  # harry

# 访问实例方法
student1.cal_all_students()


```

### 类方法

```python

class Student(object):

    # 类变量
    all_students = 0

    # 构造方法可以看成比较特殊的实例方法
    def __init__(self, name1, age1):
        self.name = name1
        self.age = age1

    # 类方法：用于操作和类相关的变量
    @classmethod
    def cal_all_students(cls):
    
        # 类方法中不可以调用实例变量
        # print(cls.name)  # 会报错，因为此时实例还未创建
    
        cls.all_students += 1
        print('当前所有的学生人数为：%s' % cls.all_students)

student1 = Student('alex', 26)
# 访问类方法
Student.cal_all_students()  # 当前所有的学生人数为：1
# 也可以通过实例对象去访问类方法，但是不建议这么去操作，因为不符合逻辑
# student1.cal_all_students()

student2 = Student('harry', 25)
Student.cal_all_students()  # 当前所有的学生人数为：2


```

> 类方法和实例方法的比较：  
> 实例方法关联实例对象本身，类方法关联类本身。  
> 操作和对象无关的方法还是建议使用类方法（约定俗成）

### 静态方法（不常用，也不是很建议用）

```python

class Student(object):

    # 类变量
    all_students = 0

    def __init__(self, name1, age1):
        self.name = name1
        self.age = age1

    # 静态方法：不经常用，当你自己觉得这个方法与类或者对象没有关联的时候可以使用，但是原则性来说，不要经常用
    @staticmethod
    def add(x, y):
        s = x + y
        # 静态方法中不可以访问实例变量
        # print(self.name)  会报错，因为没有 self
        print('静态方法中访问类变量： all_students 为 => %s' % Student.all_students)
        print('x + y 的结果为： %d' % s)

student1 = Student('alex', 26)

# 调用静态方法
student1.add(1, 2)  # x + y 的结果为： 3
Student.add(3, 4)  # x + y 的结果为： 7


```

## 私有类变量

类的私有变量 `private` 通过给属性的名称前加上两个下划线 `__` 实现。这样的变量外部实例是无法访问的，因为实质性是把改属性的名称改成了 `_类名__属性名`

```python

class Student(object):

    def __init__(self):
        self.__name = 'alex'
        self.age = 26
        
    
    def tt(self):
        pass    

print(Student().__name)  # 会直接报错，没有 __name 属性

print(Student()._Student__name)  # alex

```

## 获取对象的属性或属性方法

```python

print(dir(Student))  # 罗列出一个对象的所有属性和方法

# 判断是否有 age 属性
print(hasattr(Student(), 'age'))  # True
print(hasattr(Student(), '__name'))  # False 这里为 False ，是因为 __name 属性定义为 private 属性，被 python 改名为 _Student__name
print(hasattr(Student(), '_Student__name'))  # True

# 设置属性
obj = Student()
setattr(obj, 'gender', 1)
print(hasattr(obj, 'gender'))  # True

# 获取属性
print(getattr(obj, 'gender'))  # 1
# 属性不存在时，设置一个默认值
print(getattr(obj, 'city', 'Shanghai'))  # Shanghai
print(getattr(obj, 'gender', 100))  # 1

# 判断是否有 tt 属性方法
print(hasattr(obj, 'tt'))  # True
fn = getattr(obj, 'tt')  # 获取类方法 tt，并赋值给变量 fn，调用 fn() 和 tt() 是一样的效果
```

## 子类继承父类

./c2.py

```python

class Human():

    sum = 0
    
    def __init__(self, name, age):
        self.name = name
        self.age = age

    def get_name(self):
        print(self.name)

    def do_homework(self):
        print('This is parent do_homework')      

```

./c1.py

```

from c2 import Human

# 继承了 Human 父类
class Student(Human):

    def __init__(self, school, name, age):
        self.school = school
        # 子类调用父类的构造函数
        super(Student, self).__init__(name, age)

    def do_homework(self):
        # 子类调用父类的同名方法
        super(Student, self).do_homework()
        print('english homework')

student1 = Student('半月小学', '小石头', 18)

# 子类和父类都有同名方法，那么会优先返回子类结果
student1.do_homework()                 


```

## 枚举类

- 简单枚举，使用默认值

```python

from enum import Enum

Month = Enum('Month', ('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'))

# 可以直接使用 Month.Jan 来引用一个常量
print(Month.Jan)  # Month.Jan

# 枚举所有成员
for name, member in Month.__members__.items():
    # the name is =>  [Jan] and the member is => [Month.Jan] and the member default value is => [1]
    # value 属性则是自动赋给成员的 int 常量，默认从 1 开始计数
    print(f'the name is =>  [{name}] and the member is => [{member}] and the member default value is => [{member.value}]')

```

- 自定义修改枚举值

```python

from enum import Enum, IntEnum, unique

# @unique 装饰器可以检查保证没有重复值 
# IntEnum 可以限制枚举值必须为数字类型
@unique
class Weekday(IntEnum):
    Sun = 0
    Mon = 1
    Tue = 2
    Wed = 3
    Thu = 4
    Fri = 5
    Sat = 6

day1 = Weekday.Mon

print(day1)  # Weekday.Mon

print(Weekday.Mon)  # Weekday.Mon

print(Weekday['Mon'])  # Weekday.Mon

print(day1 == Weekday.Mon)  # True

print(day1 == Weekday.Tue)  # False

print(Weekday(1))  # Weekday.Mon

print(day1 == Weekday(1))  # True

# 获取枚举值
print(Weekday.Mon.value)  # 1

# 获取枚举标签的名称
print(Weekday.Mon.name)  # Mon

# 枚举类型转换
# 以枚举值去找枚举类型
print(Weekday(3))  # Weekday.Wed

```
