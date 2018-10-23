//: [Previous](@previous)

import Foundation

//析构过程
//Swift 会自动释放不再需要的实例以释放资源,也是通过 自动引用计数(ARC)处理实例的内存管理
//每个类当中只能有一个反初始化器。反初始化器不接收任何形式参数，并且不需要写圆括号：
class A {
        //父类的反初始化器总会被调用,就算子类没有实现
    deinit {
        print ("deinit")
    }
}


