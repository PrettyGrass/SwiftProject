//: [Previous](@previous)

import Foundation

/*

 内容:
 
 * Swift下初始化过程
 * 自定义初始化
 * 默认构造器
 * 类的继承和构造过程
 * 可失败构造器
 * 必要构造器
 * 通过闭包或函数设置属性的默认值
 
 
 必备知识:
 构造过程是实例化之前的准备过程,在Swift下构造器无需返回值,它主要的任务就是保证实例在第一次使用前完成前正确的初始化
 
 构造器:  以关键字 init命名的方法
 析构器: 实例在释放的时候执行的方法 以关键字 deInit命名的方法
 
 注意: 当你为存储型属性设置默认值或者在构造器中为其赋值时，它们的值是被直接设置的，不会触发任何属性观察者。子类重写init时,赋值父类属性是会触发的.
 
*/

class A {
    var name: String = "类型A" {
        willSet {
            print ("willSet:\(newValue)") //子类被实例化,赋值 name会触发
        }
    }
}

class B: A {
    
    var height :Int {
        willSet {
            print ("height willSet:\(newValue)") //不触发
        }
    }
    
    override init() {
        self.height = 12
        super.init()

    }
}

let obj1 = B()
print(obj1)

class C {
    
    var page = 0
    var name: String?
    var dataArr: [String]


    init(){
       // self.name = "初始化名字"
        self.dataArr = ["第一行数据"]
        print("22222")
    }
    
    init(nameStr: String,data:[String]) {
        print("1111")

        self.name = nameStr
        self.dataArr = data
    }
    
}

let obj2 = C(nameStr: "初始化名字", data: ["第一行数据"])
print("多参构造器:",obj2.name!,obj2.dataArr)


let obj3 = C()
print("默认构造器:",obj3.name,obj3.dataArr)


//构造过程中常量属性的赋值
//注意:对于类的实例来说，它的常量属性只能在定义它的类的构造过程中修改；不能在子类中修改。
class D {

    let name: String?
    init() {
        name = "D"
    }
    
}

class E :D {
    override init() {
       // self.name = "E" 在子类中也不能被修改
    }
}

let dObj = D()
print("dObj.name = ",dObj.name)

let eObj = E()
//eObj.name = "E" //error cannot assign to property: 'name' is a 'let' constant
//eObj.name = "E"

print("eObj.name = ",eObj.name)

//默认构造器
//如果结构体或类的所有属性都有默认值，同时没有自定义的构造器，那么 Swift 会给这些结构体或类提供一个默认构造器

class F {
    var name :String?
    var value = 7
   // var value2 :String // error: class 'F' has no initializers

}

let fObj = F()
print("默认构造器 -> value:\(fObj.value)")


//结构体的逐一成员构造器
//如果结构体没有提供自定义的构造器，它们将自动获得一个逐一成员构造器，即使结构体的存储型属性没有默认值。

struct Size {
    var width = 0.0, height = 0.0
}

let sizeObj = Size(width: 1.0, height: 1.0)

print("结构体的默认构造器 ->width:\(sizeObj.width) height:\(sizeObj.height)")

//值类型的构造器代理
//构造器可以通过调用其它构造器来完成实例的部分构造过程。这一过程称为构造器代理，它能避免多个构造器间的代码重复。

struct Gif {
    var name: String
    var count: Int
    
    var brief: String?
    
    //构造器1
    init() {
        print("默认构造器->构造器1")
        self.name = "初始化"
        self.count = 0
    }
    
    //构造器2
    init(ObjectName name:String ,Count count:Int) {
        self.name = name
        self.count = count
    }
    
    //指定构造器
    init(ObjectName name:String ,Count count:Int , Brief brief:String) {
        self.init(ObjectName: name, Count: count)
        self.brief = brief
    }
    
}

let gif1 = Gif()
let gif2 = Gif(ObjectName: "gif2", Count: 1)
let gif3 = Gif(ObjectName: "gif3", Count: 2, Brief: "可选描述")

// 类的继承和构造过程
//类里面的所有存储型属性——包括所有继承自父类的属性——都必须在构造过程中设置初始值。 Swift 为类类型提供了两种构造器来确保实例中所有存储型属性都能获得初始值，它们分别是指定构造器和便利构造器。


//指定构造器和便利构造器
//每一个类都必须至少拥有一个指定构造器

class H {
    var name: String
    
    //指定构造器
    init() {
        self.name = "init"
    }

}




