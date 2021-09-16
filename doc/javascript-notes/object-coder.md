# ES6 面向对象编程

> 使用 es6 中新的关键字 class 定义类，就再也不需要基于原型去定义类了。

## 定义类

```js

class Student {
    
    constructor(name) {
        this.name = name;
    }
    
    hello() {
        console.log('Hello, ' + this.name + '!');
    }
    
}

```

## 继承类父类

```js

class PrimaryStudent extends Student {
    
    constructor(name, grade) {
        super(name);  // 使用 super 调用父类的构造方法
        
        this.grade = grade;
    }
    
    myGrade() {
        console.log('my grade is ' + this.grade);
    }
    
}

```
