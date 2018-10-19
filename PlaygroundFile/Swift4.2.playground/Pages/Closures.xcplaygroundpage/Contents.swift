//: [Previous](@previous)

import Foundation

//函数(全局函数,具有正常的作用域,而不是声明在其他函数体里面的函数)
//问题1: 闭包是函数吗?
//问题2: 函数是闭包吗?
//问题3: 嵌套函数是闭包吗?
//问题4: 请指出如下面三种类型哪种不是闭包类型(如果无则不选)
// a. 尾随闭包 b. 逃逸闭包  c.自动闭包

/*
 1.闭包不一定是函数,闭包是自包含函数的代码块.包含关系,严格意义来说是代码块
 2.函数是闭包,是特殊的闭包,他是有名字且不会捕获任何值的闭包
 3.嵌套函数是闭包,是一个可以捕获内值的闭包
 内值:
 funtion 1 {
 var value = 1 ;
 
 function2 {
    value += 2
 }
 function ()
 }
 
 value 称之为内值
 
 4.选A
 尾随闭包只是是闭包表达式优化的语法,它书写在函数体括号的后面,当他
 逃逸闭包: 当闭包作为函数的参数,并且在函数执行完毕之后执行,称之为逃逸闭包
 自动闭包: 自动闭包是一种自动创建的闭包，用于包装传递给函数作为参数的表达式。
 eg:
 let _ = {(param: Int) -> Int in
 return 1;
 }
 */

/*
 闭包是自包含的函数代码块，可以在代码中被传递和使用。
 闭包的三种形式:
 1.全局的函数,是一个有名字的闭包,但是他不会捕获任何值
 2.嵌套函数,是一个有名字并可以捕获内值的闭包
 3.闭包表达式 ,是一个利用轻量级语法所写的匿名闭包,他可以捕获上下文中的常量,或者变量
 */

//闭包表达式语法

//{ (parameters) -> return type in
//    statements
//}

let _ = {(param: Int) -> Int in
    return 1;
}

//闭包表达式提供了一些语法优化
// 1.闭包可以根据上下文推断类型
// 2.单表达式闭包 隐式返回 ,单行表达式的闭包支持隐式返回,可以省略 return关键字
// 3.参数名称缩写 Swift 自动为闭包提供了参数名称缩写功能，你可以直接通过 $0，$1，$2 来顺序调用闭包的参数，以此类推。
// 4.尾随闭包语法
//
//尾随闭包是一个书写在函数括号之后的闭包表达式，函数支持将其作为最后一个参数调用。在使用尾随闭包时，你不用写出它的参数标签

func someFunctionThatTakesAClosure(closure: () -> Void) {
    // 函数体部分
}

//不用尾随闭包进行函数调用
someFunctionThatTakesAClosure(closure: {
    //闭包
})

//用尾随闭包进行函数调用
someFunctionThatTakesAClosure {
    //闭包
}


//闭包的特性
//1.闭包的值捕获
//闭包的值捕获
//闭包可以在其被定义的上下文中捕获常量或变量。即使定义这些常量和变量的原作用域已经不存在，闭包仍然可以在闭包函数体内引用和修改这些值。
//如果一个值不会被闭包改变，或者在闭包创建后不会改变，Swift会改为捕获并保存一份对值的拷贝。Swift 也会负责被捕获变量的所有内存管理工作，包括释放不再需要的变量。
//注意: 如果你将闭包赋值给一个类实例的属性，并且该闭包通过访问该实例或其成员而捕获了该实例，你将在闭包和该实例间创建一个循环强引用。Swift 使用捕获列表来打破这种循环强引用。

//2.闭包是引用类型


//#逃逸闭包:
//当一个闭包作为参数传到一个函数中，但是这个闭包在函数返回之后才被执行，我们称该闭包从函数中逃逸。当你定义接受闭包作为参数的函数时，你可以在参数名之前标注 @escaping，用来指明这个闭包是允许“逃逸”出这个函数的
//将一个闭包标记为 @escaping 意味着你必须在闭包中显式地引用self,非逃逸闭包才可以隐式调用self,因为逃逸闭包执行的上下文不确定,所以需要指定self

var handles: [() -> Void] = []
func someFunctionWithEscapingClosure(complete: @escaping() -> Void) {
    handles.append(complete)
}

func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}

class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { self.x = 100 } //逃逸闭包需要self
        someFunctionWithNonescapingClosure { x = 200 } //非逃逸闭包可以不用
    }
}

let instance = SomeClass()
instance.doSomething()
print(instance.x)
// 打印出 "200"

handles.first?()
print(instance.x)
// 打印出 "100"


//# 自动闭包
//自动闭包是一种自动创建的闭包，用于包装传递给函数作为参数的表达式,这种闭包不接受任何参数，当它被调用的时候，会返回被包装在其中的表达式的值。这种便利语法让你能够省略闭包的花括号，用一个普通的表达式来代替显式的闭包。
//自动闭包让你能够延迟求值，因为直到你调用这个闭包，代码段才会被执行。延迟求值对于那些有副作用（Side Effect）和高计算成本的代码来说是很有益处的，因为它使得你能控制代码的执行时机。

var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)
// 打印出 "5"

let customerProvider = { customersInLine.remove(at: 0) }
print(customersInLine.count)
// 打印出 "5"
print("Now serving \(customerProvider())!")
// Prints "Now serving Chris!"
print(customersInLine.count)
// 打印出 "4"
