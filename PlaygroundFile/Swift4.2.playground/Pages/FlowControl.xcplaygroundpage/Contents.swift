//: [Previous](@previous)

import Foundation

//访问数组
//你可以使用 for-in 循环来遍历一个集合中的所有元素，例如数组中的元素、范围内的数字或者字符串中的字符。
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello, \(name)!")
}

//访问字典
let keyValueDic :[String:String] = ["key1": "value1","key2": "value2","key3": "value3"]
for (key,value) in keyValueDic {
    print("key:\(key) -> value:\(value)")
}

//for-in 循环还可以使用数字范围 闭区间:包含左右两端的数
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

// ..< 表示包括左边不包括右边
let minutes = 60
for tickMark in 0..<minutes {
    // 每一分钟都渲染一个刻度线（60次）
}

// 还可以是一段一段的,已多少位作为一段使用 stride(from:to:by:)

let minuteInterval = 5
for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
    // 每5分钟渲染一个刻度线（0, 5, 10, 15 ... 45, 50, 55）
}

//可以在闭区间使用 stride(from:through:by:) 起到同样作用：
let hours = 12
let hourInterval = 3
for tickMark in stride(from: 3, through: hours, by: hourInterval) {
    // 每3小时渲染一个刻度线（3, 6, 9, 12）
}


//2种 While 循环

/*
//条件真 退出循环
while condition {  
    statements
}
//至少执行一次
repeat {
    statements
} while condition*/



//If
 //只包含一个条件,只有该条件为 true 时，才执行相关代码：

if 1 < 3 {
    print("true")
} else {
    print("false")
}


//Switch
//把某个值与一个或若干个相同类型的值作比较
//Swift 中 Switch语句不存在隐式贯穿,也就是不用写break,单个条件下必须执行语句,否则会报错


let valueSwitch = 15

switch valueSwitch {
case 1:
    print("不用break")
case 2,3,4,5:
    print("穿透value")
case 6..<12:
    print("匹配区间 6 ..11 不包括12")
    
case 13...15:
    print("包括 13 14 15")
    
default:
    print("当所有条件都不符合的时候.")
}


//使用元组匹配多个值

let somPoint = (5,9)

switch somPoint {
case (0,0):
    print("\(somPoint) is at the origin")
case (_,1):
    print("后面的是1就匹配")
case (1,_):
    print("前面的是1就匹配")
case (5...7,8...9):
    print("匹配一个范围")
case (_, _):
    print("--")
}

//值绑定
let anotherPoint = (0,0)

//switch 语句必须是完备的,至少要匹配上一种情况
switch anotherPoint {
case (let x, 0):
    print("值绑定:",x)
case (0,let y):
    print("值绑定:",y)
default:
    print("default")
}

//Where
//case 分支的模式可以使用 where 语句来判断额外的条件。
let yetAnotherPoint = (2, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}
// 输出 "(1, -1) is on the line x == -y"


//控制转移语句
//continue
//break
//fallthrough
//return
//throw

//continue: 立即停止本次循环,重新开始下次循环
//Break: 立即中断该循环体的执行,可以用来提前结束循环语句
// 循环语句中的 break:
//当在一个循环体中使用 break 时，会立刻中断该循环体的执行，然后跳转到表示循环体结束的大括号（}）后的第一行代码。不会再有本次循环的代码被执行，也不会再有下次的循环产生。

//Switch: 语句中的 break:会立即中断该 switch 代码块的执行,并且跳转到表示 switch 代码块结束的大括号（}）后的第一行代码。
//fallthrough: 让Swift中 case语句能够穿透到下一个 case条件中 ,相当于C语言中 case不写break

//return 表示结束语句执行,return 所在的代码块中,后面的语句将不再执行

//throw 表示抛出异常


//带标签的语句
//你可以使用标签（statement label）来标记一个循环体或者条件语句，对于一个条件语句，你可以使用 break 加标签的方式，来结束这个被标记的语句。
//语法
let a = 3 ,b = 4
myWhile: while a > b {
    break myWhile
}
//continue 也是一样的


//提前退出
//guard 的执行取决一个表达式的布尔值,可以使用 guard 语句来要求条件必须为真时，以执行 guard 语句后的代码。不同于 if 语句，一个 guard 语句总是有一个 else 从句，如果条件不为真则执行 else 从句中的代码。

func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }
    print("Hello \(name)")
    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }
    print("I hope the weather is nice in \(location).")
}

greet(person: ["name":"陆超"])


//检测 API 可用性
//Swift 内置支持检查 API 可用性，这可以确保我们不会在当前部署机器上，不小心地使用了不可用的 API。

if #available(iOS 10, macOS 10.12, *) {
    // 在 iOS 使用 iOS 10 的 API, 在 macOS 使用 macOS 10.12 的 API
} else {
    // 使用先前版本的 iOS 和 macOS 的 API
}

//可用性条件使用了一个平台名字和版本的列表
//平台名字可以是 iOS，macOS，watchOS 和 tvOS.除了指定像 iOS 8 或 macOS 10.10 的大版本号，也可以指定像 iOS 11.2.6 以及 macOS 10.13.3 的小版本号
if #available(iOS 9.0,* ) {
    print("APIs 可用，语句将执行")
} else {
    //APIs 不可用，语句将不执行
}


//: [Next](@next)
