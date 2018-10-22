//: [Previous](@previous)

import Foundation


/*
 内容:
    * 实例方法
    * 类型方法
 
 tip:结构体和枚举能够定义方法是 Swift 与 C/Objective-C 的主要区别之一
 */

//实例方法
class A {
    func countAdd(count1:Int,count2:Int ) -> Int {
        return count1 + count2
    }
}

let obj1 = A()
print("类:",obj1.countAdd(count1: 1, count2: 2))

//在结构体里定义方法
struct B {
    var value1 = 10
    var value2 = 20
    func countAdd(count1:Int,count2:Int ) -> Int {
        return count1 + count2
    }
}

//
let obj2 = B(value1: 1, value2: 2)
print("结构体:",obj1.countAdd(count1: 1, count2: 2))


//在枚举里定义对象方法
enum C :Int {
    case value1 = 1,value2,value3,value4
    func countAdd(count1:Int,count2:Int ) -> Int {
        
        return count1 + count2
    }
    
}
let obj3 = C(rawValue: 2)!
print("枚举:",obj3.countAdd(count1: 1, count2: 2))

//类型的每一个实例都有一个隐含属性self,等同于实例本身
//在实例方法中修改值类型 (关键字: mutating)

//在结构体中修改
struct D {
    var value1 = 10
    var value2 = 20
   mutating func modifyValue(value1: Int,value2 :Int) -> Void {
        self.value1 = value1
        self.value2 = value2
    }
    
}

var obj4 = D()
obj4.modifyValue(value1: 1, value2: 2)
print("修改结构体值:",obj4.value1,obj4.value2)

//枚举一样


//类型方法
//使用方法: func 关键字之前加上关键字 static，来指定类型方法。类还可以用关键字 class 来允许子类重写父类的方法实现。
//注意:在 Objective-C 中，你只能为 类类型（classes）定义类型方法。在 Swift 中，你可以为所有的类、结构体和枚举定义类型方法。


class class1 {
    
    class func method1() -> Void {
        print("class method1()")

    }
    
    static func method2() -> Void {
        print("class method2()")

    }
}

class class2: class1 {
    
   override class func method1() -> Void {
        
    }
// error bu Static 修饰的类方法不可以继承
//    static func method2() -> Void {
//
//    }
}

class1.method1()
class2.method2()

//结构体类型方法
struct structClass1  {
     static func method1() -> Void {
        print("struct method()")
    }
}
structClass1.method1()

//枚举类型方法
enum enumClass1 {
    case a,b,c,d
    static func method1() -> Void {
        print("enum method()")
    }
}

enumClass1.method1()

//总结:
/*
 * OC 里只有对象(实例)方法,还有类方法 ,Swift里叫实例方法,跟类属性方法 ,枚举 跟结构体内声明的一些方法,可以解决一些有关于结构体的一些 修改,或者是枚举有关的转化等业务,终于有地方可以写了,结构体提供拓展功能也是很方便,总的来说,结构体跟枚举使用场景更多了,以后功能划分的更明确了
 */





