//: [Previous](@previous)

import Foundation
import UIKit

//属性

/*
 
 内容:
 
 - 属性的种类:
    * 储存属性
    * 计算属性
    * 类属性
 - 属性的使用
    * 属性观察器
 
 - 全局变量和局部变量

 */

//存储属性
//let ,var 定义常量,与变量属性


let p1 = String()
let p2 = 12

//延迟存储属性

//延迟存储属性是指当第一次被调用的时候才会计算其初始值的属性。在属性声明前使用 lazy 来标示一个延迟存储属性。
//
//如果一个被标记为 lazy 的属性在没有初始化时就同时被多个线程访问，则无法保证该属性只会被初始化一次。

class CustomView  {
    lazy var containView = UIView();
    lazy var subV: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    var desc = "视图描述"
}

let view = CustomView()
view.desc.append("++++")
//这里的 containView还没有被创建

print(view)

//lazy 拓展

let numbers = 1...5

//let doubleNumbers = numbers.map { (i: Int) -> Int in
//    print("numbers\(i)")
//    return i * 2
//}

let doubleNumbers1 = numbers.lazy.map { (i: Int) -> Int in
    print("numbers\(i)")
    return i * 2
}

//这里使用到里面的值才会被打印一次,对于一些不需要完全运行或者提前退出的情况，使用 lazy 进行性能优化更加有效。
for i in doubleNumbers1 {
    print("doubleNumbers\(i)")
}

//计算属性













