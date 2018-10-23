//: [Previous](@previous)

import Foundation
import UIKit

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

/*
 为了简化指定构造器和便利构造器之间的调用关系，Swift 采用以下三条规则来限制构造器之间的代理调用：
 规则1:指定构造器必须调用其直接父类的的指定构造器。
 规则2;便利构造器必须调用同类中定义的其它构造器。
 规则3:便利构造器最后必须调用指定构造器。
 
 简单的来说:
 指定构造器必须总是向上代理
 便利构造器必须总是横向代理


 */

class H {
    var name: String
    
    //指定构造器
    init() {
        self.name = "init"
    }
    
    //便利构造器
    convenience init(Name name :String) {
        self.init()
    }
}

let hObj = H(Name: "H")
print(hObj.name)


class HH: H {
    
    var height :Int
    
   override init() {
        self.height = 10 //要先保证所在的类所有属性都初始化完毕(Optional 除外)才可以指向父类的构造器
        super.init() //先指向父类的构造器
        self.name = "_init" //父类要先初始化完毕才可以给父类初始化属性
    
    }
    //便利构造器
    convenience init(Name name :String) {
        self.init()
        self.name = "HH"
    }
}

let hhObj = H(Name: "HH")
print(hhObj.name)


/* 两段式构造过程
Swift中类的构造过程包含两个阶段:
 第一个阶段:每个存储类型属性赋一个初值
 第二个阶段:它给每个类一次机会，在新实例准备使用之前进一步定制它们的存储型属性
 两段式构造过程的使用让构造过程更安全，同时在整个类层级结构中给予了每个类完全的灵活性。两段式构造过程可以防止属性值在初始化之前被访问，也可以防止属性被另外一个构造器意外地赋予不同的值。
 
 Swift 编译器将执行 4 种有效的安全检查，以确保两段式构造过程不出错地完成：

 检查1:
 指定的构造器必须保证它所在的类的所有属性都必须先初始化完成,之后才可以指向父类中的构造器

 检查2:
 指定构造器必须在为继承的属性在设置之前调用父类的构造器.如果没有这么做,赋值的新值将会被父类中的构造器缩覆盖
 
 检查3:
 便利构造器在赋值之前要先调用其他构造器,否则新值可能会被其他构造器覆盖
 
 检查4:
 构造器在第一阶段初始化完成之前,不能调用任何实例方法,不能读取任何实例属性的值.也不能引用self

 直到第一阶段结束,属性才能被读取,方法可以被调用
 

 两段式构造过过程基于安全检查的流程:
 
 阶段1:
 某个指定构造器或者便利构造器被调用
 完成新实例内存的分配,但此时内存还没有被初始化
 指定构造器确保其所在的类引入的所有存储属性都已赋初值,存储属性所属的内存完成初始化
 指定构造器将调用父类的构造器,完成父类属性的初始化
 这个调用父类构造器沿着构造链一直执行,到达最顶部
 当到达了构造器链最顶部,且已确保所有实例包含的存储属性都已经赋值,这个实例的内存被认为已经完成初始化,此时阶段1完成
 
 阶段2:
 从最顶部的构造器链一直往下,每个构造器所在的类都有机会定制实例,此时构造器可以访问self,修改属性,调用方法等等.
 最终 任意构造器中的
 便利构造器可以有机会定制实例和使用self
 
 

 
 //默写
 阶段1: 属性赋初值
 阶段2: 在新实例使用之前有机会定制它们的存储型属性
 
 编译器的检查:
 1.指定构造器确保所引用的属性被赋初始值,然后才能调用父类方法
 2.被继承的属性必须在调用父类构造器之后设置,以免被父类构造器覆盖
 3.便利构造器在设置值之前要先调用其他构造器意面被覆盖值
 4.第一阶段未完成不能使用self,不能使用方法
 
 阶段1拆分:
 1.指定构造器,或者便利构造器被调用
 2.完成新实例的内存分配
 3.类中赋初值,分配内存,完成初始化
 4.指定构造器调用父类构造器,直到父类完成初始化
 5.构造链条往上执行,达到顶部,且确保所有存储属性都已赋值,这个实力的内存被认为已经完成初始化,此时阶段1完成
 
 阶段2:
 构造连顶部往下,没个构造器都有机会定制实例,此时self 可以访问,最终,便利构造器可以使用self,完成自己的定制
 
*/

//构造器的继承和重写

class J {
    var name: String
    
    //指定构造器
    init() {
        print("222222")
        self.name = "init"
    }
    
    //便利构造器
    convenience init(Name name :String) {
        self.init()
    }
}


class JJ: J {
    var jjName: String
    
    //指定构造器
   override init() {
    print("1111111")
        self.jjName = "init"
        super.init()
    }
    
    init(Name1 name :String) {
        self.jjName = "33333"
        super.init()
    }
//
//  convenience override init(Name name :String) {
//        self.init(Name1: "新构造器")
//    }
    
}

let jjObj = JJ(Name1: "_init")
print(jjObj.name)


//可失败构造器

//当初始化时传入无效的形式参数,或者缺少某种外部的资源,可能会初始化失败,为了妥善处理这种可能失败的情况，在类、结构体或枚举中定义一个或多个可失败的构造器。通过在 init 关键字后面添加问号( init? )来写。 也可以 使用init! ,它返回的值将展开可选选项


struct Animal {
    let name: String
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}

let dog = Animal(name: "")
if dog == nil {
    print("dog没有初始化成功")
}

//枚举的可失败构造器
enum Direction {
    case Left, Top, Bottom
    init?(symbol: Int) {
        switch symbol {
        case 1:
            self = .Left
        case 2:
            self = .Top
        case 3:
            self = .Bottom
        default:
            return nil
        }
    }
}

//必要构造器

//在类的构造器之前添加 required 修饰符来标明该类的子类都必须实现该构造器
class SomeClass {
    required init() {
    }
}

class SomeSubclass: SomeClass {
    required init() { //必要构造器不需要加override
    }
}

//通过闭包和函数设置属性的默认值
//() 代表立即执行这个闭包
class K {
    let myLabel: UILabel = {
        return UILabel()
    }()
}


/*
 总结:
 Swift下一个类的初始化与OC大体相似,先分配内存空间给对象赋初始值
 相对来说Swift下构造过程更加明确,编译器也有更完善的检查.

 构造器分指定构造器和便利构造器,要是都没有实现的话,类会有一个隐式构造器
 总的来说,一个类在实例化之前,构造器的任务就是先确定好类型,并给存储属性赋上初值
 
 当参数问题,或者是其他依赖的外部资源导致初始化失败的时候,这时候这个构造器是可失败的,又称可失败构造器 , init? 也可以用 Init!在初始化之后展开可选选项
 
 构造器又还有一钟叫 必要构造器 用关键字 required修饰,表示子类必须重写父类中的必要构造器,且不用加override
 
 构造器的类型:
     指定构造器
     便利构造器
     隐式构造器
     可失败构造器
     必要构造器
 
 构造过程分两个阶段:
 第一个阶段是 赋初值
 第二个阶段是 在新实例使用之前定制存储类型的值(自定义属性)
 
 
 需要掌握Swfit类的继承和构造过程,以及各个构造器之间的定义,了解编译器检查的步骤
 
 */




