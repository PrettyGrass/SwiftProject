//: [Previous](@previous)

import Foundation

//函数的定义与调用
func logName(Person:String) -> Void {
    print("hello",Person)
}

//无参函数
func logName() -> Void {
    
}
//无返回值函数 可以省略 -> Void 实际上返回值还是 Void类型,此时这里的函数类型是 ()->Void

func sayHelloWorld() {
    print("hello, world")
}
print(sayHelloWorld())

//多参函数
func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return "1"
    } else {
        return "2"
    }
}

//多重返回值函数
//可以使用元组作为返回值
func minMaxfunc1() -> (min: Int, max: Int) {
    return (6,10)
}

//可选元组返回类型
//(Int, Int)?  (Int?, Int?) 是不同的

func minMaxfunc2() -> (min: Int, max: Int)? {
    return (6,10)
}

//用可选绑定检查值
if let value = minMaxfunc2() {
    print(value)
}


//# 函数参数标签和参数名称
//默认情况下函数都用参数名当他们的参数标签,一个唯一的函数标签能够使你的代码更具可读性,参数标签的使用能够让一个函数在调用时更有表达力，更类似自然语言，并且仍保持了函数内部的可读性以及清晰的意图。

//指定参数标签
func someFunction(argumentLabel parameterName: Int) {
    // 在函数体内，parameterName 代表参数值
    //argumentLabel: 参数标签
}

//忽略参数标签
//tip: 如果一个参数有一个标签，那么在调用的时候必须使用标签来标记这个参数。
func someFunction(_ firstParameterName: Int, _ secondParameterName: Int) {
    
}

//参数带默认值
func defaultValueFunction(label param:Int = 10) {
    print("默认值:\(param)")
}

defaultValueFunction(label: 1)
defaultValueFunction() //带默认值

//可变参数
//通过在变量类型名后面加入（...）的方式来定义可变参数, 可以看做 num: 是多个 int类型的参数数组
//注意: 一个函数最多只能有一个可变参数
func mutableParamFunction(_ num:Int...) -> Int {
    
    var total: Int = 0
    for number in num {
        total += number
    }
    return total
}

print("总数:\(mutableParamFunction(1,2,3,5,6,7))")

//输入输出参数
//函数参数默认是常量。试图在函数体中更改参数值将会导致编译错误。这意味着你不能错误地更改参数值。如果你想要一个函数可以修改参数的值，并且想要在这些修改在函数调用结束后仍然存在，那么就应该把这个参数定义为输入输出参数.
//定义一个输入输出参数时,在参数定义前加 inout 关键字

func inoutFunction(_ a: inout Int ,_ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}


//var p1 = 1
//var p2 = 2
//inoutFunction(p1,p2)  error

var p1 = 1
var p2 = 2

print("p1:\(p1) p2:\(p2)")
inoutFunction(&p1,&p2)
print("p1:\(p1) p2:\(p2)")

// 使用函数类型
// 在Swift中,使用函数类型就像使用其他类型一样,你可以定义一个函数类型的常量,或者变量

func addTwoInts(param1: Int,param2: Int) -> Int {
    return param1 + param2
}
var mathFunction: (Int,Int) -> Int = addTwoInts
print(mathFunction(1,2))

//函数类型作为参数类型
func mathFunction1(param1: Int,_ mathFunc : (Int,Int) -> Int ) -> Void {
    print("param1:\(param1)","mathFunc:\(mathFunc)")
}
mathFunction1(param1: 10, mathFunction)

//函数类型作为返回值
func mathFunction2(mathFunc: @escaping(Int,Int) -> Int) -> (Int,Int) -> Int {
    return mathFunc
}

//返回类型是 (Int) -> Int 类型的函数
mathFunction2(mathFunc: mathFunction)


// #嵌套函数
//概念: 把函数定义在别的函数体中，称作 嵌套函数

func functionA() {
    func functionB(){
        print("functionB 调用")
    }
    func functionC(){
        print("functionC 调用")
    }
    functionB()
    functionC()
}

functionA()














