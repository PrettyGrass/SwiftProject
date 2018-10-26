//: [Previous](@previous)

import Foundation

//扩展就是为一个已有的类,结构体,枚举类型或者协议类型添加新功能.扩展和 Objective-C 中的分类类似

//在Swfit中,你可以对协议进行拓展,.提供协议要求的实现,或者添加额外的功能,从而让协议也拥有这些功能

/*
 Swift中的拓展可以
 * 添加计算型属性和计算类型属性
 * 定义对象方法,类方法
 * 定义下标
 * 定义和使用新内嵌类型
 * 使现有的类型遵循某协议
 
 */

protocol Protocol1 {
    
}

protocol Protocol2 {
    
}

//拓展的语法

class A {
    
}

extension A {
    
}

//遵循多个协议
extension A: Protocol1,Protocol2 {
    
    
}

//计算属性
extension Int {
    var myDouble:Double {return Double(self)}
}

10.myDouble

//拓展构造器
struct Size {
    var width = 0.0,height = 0.0
}

extension Size {
    init(MyWidth:Double,MyHeight:Double) {
    }
    
    //异变实例方法 (结构体还有枚举)
    mutating func modifyValue(newWidth:Double) -> Void {
        width = newWidth
    }
}





