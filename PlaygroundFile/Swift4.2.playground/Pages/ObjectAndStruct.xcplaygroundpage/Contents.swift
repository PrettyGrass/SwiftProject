//: [Previous](@previous)

import Foundation

//类和结构体

//类跟结构体对比

//定义属性用来存储值；
//定义方法用于提供功能；
//定义下标操作通过下标语法访问值；
//定义构造器用于生成初始化值
//可以拓展功能
//遵循协议->可以对特定类型提供标准功能。

//类个的额外功能

//1.类可以继承
//2.可以在运行时检查和解释一个实例的类型
//3. 类实例释放时候可以释放其所分配的资源
//4.引用计数允许对一个类的多次引用

//tip: 结构体总是通过被复制的方式在代码中传递，不使用引用计数。

//定义语法
class SomeClass {
    
}

struct SomeStructure {
    //在这里定义结构体
}

//实例
struct PGSise {
    var width = 0 //默认会被推断是 Int类型
    var height = 0
}

class ThemeModel {
    var themeSize = PGSise()
    var name: String?
    var brief: String?
}

var mySize = PGSise()
//结构体的成员逐一构造器
let _ = PGSise(width: 10, height: 0)

let themeModel = ThemeModel()

mySize.width = 90
mySize.height = 10

themeModel.themeSize = mySize
themeModel.name = "最大的广告牌"

//结构体

//结构体和枚举是值类型,值类型被赋予给一个变量、常量或者被传递给一个函数的时候，其值会被拷贝。
//在 Swift 中，所有的基本类型：整数（Integers）、浮点数（floating-point numbers）、布尔值（Booleans）、字符串（strings)、数组（arrays）和字典（dictionaries），都是值类型，并且在底层都是以结构体的形式所实现。

var copySize = mySize
copySize.width = 11
copySize.height = 11
print("copySize:\(copySize)")
print("mySize:\(mySize)")


//类是引用类型 类是引用类型
let themeModel2 = themeModel
themeModel2.name = "最小的广告牌"
print("themeModel:\(themeModel.name)")
print("themeModel2:\(themeModel2.name)")
//已修改


//判断两个类是否相等
// Swift内置的两个运算符 ===  !==
// === :等价于 表示两个类类型引用同一个实例
// == :表示两个实例的值是否相等,或者相同

let model1 = ThemeModel()

let model2 = model1
let model3 = ThemeModel()


if model1 === model2 {
    print("model1 等价于 model2")
}


//if model1 == model2 {
//    print("model1 等于 model2")
//}

if model2 !== model3  {
    print("model2 不等价于 model3")

}

//如何在类与结构体选择
//结构体在传递时值传递,不需要继承,一般用于少量简单的数据值可以选择结构体

//tip:
//Swift 中，许多基本类型，诸如 String，Array 和 Dictionary,Set 类型均以结构体的形式实现。这意味着被赋值给新的常量或变量，或者被传入函数或方法中时，它们的值会被拷贝。

//Objective-C 中 NSString，NSArray 和 NSDictionary 类型均以类的形式实现，而并非结构体。它们在被赋值或者被传入函数或方法时，不会发生值拷贝，而是传递现有实例的引用。







