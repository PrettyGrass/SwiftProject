//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

//基类: 不继承于其它类的类，称之为基类。
//被继承的类叫父类(超类),可以通过关键字 super 访问
//
class animal {
    
    var height :Int?
    var weight :Int?
    var name = "animal"
    
    static var isHungry = false
    
    func hello() {
        print("hello")
    }
}

let obj1 = animal()
obj1.hello()


//定义子类

class Dog: animal {
    
    //重写属性
    override var name: String {
        get {
            return super.name
        }
        set {
            super.name += "dog"
        }
    }
    
    override var height: Int? {
        get {
            return 20
        }
        set {
            print("------")
        }
    }
    func run() {
        print("run")
    }
    
    //重写方法
    override func hello() {
        print("hello - i'm a dog ")
    }
}

//父类的属性
let dog1 = Dog()
dog1.weight = 10
dog1.name = "🐶"

print("dog's Height:\(dog1.height!) dog's weight:\(dog1.weight!)")
print("dog's name:\(dog1.name)")
print(Dog.isHungry)


//防止重写:final关键字
//如果final声明在 属性,方法,或者下标前面,证明此属性或者方法不支持重写,如果标记在 class前面,代表整个类都不支持重写

final class A {
    
}

//class B: A { //error:  from a final class 'A'
//
//}


// 总结:
// 在Swift 中 可以使用关键字 final 来标明不能被继承, 大体与OC一致,有需要的话可以重写父类属性的属性观察器,当重写父类的一个只读属性时,可以把他重写成 可读写属性,但是反过来可不行,需要都提供 setter getter 方法


