
//: [Previous](@previous)

import Foundation

//协议语法:
protocol SomeProtocol {
    // 这里是协议的定义部分
}

//多协议 用,区分

class A {
    
}

//有父类的情况下 父类在协议前面
class B: A,SomeProtocol {
    
}

//- 属性的要求

//协议可以要求提供 特定的 实例属性,或者类属性, 不指定是计算型属性还是存储型属性,协议还指定当前属性是否是可读,可写的

protocol protocol1 {
    var mustBeSettable: Int { get set }
    var doesNotNeedToBeSettable: Int { get }
    static var someProperty: Int { get set }
}

protocol FullNameProtocol {
    
    var fullName: String {get}
    
}

struct Man: FullNameProtocol {
    var fullName: String
}

let john = Man(fullName: "xiaohua")

// 定义方法

protocol SomeProtocol2 {
    static func someTypeMethod()
    func logName() -> Double
    init(someParam: Int) //协议的构造器

}



//有条件的遵循协议

protocol ProtocolA {
      func logPa() -> Void;
}

protocol ProtocolB {

    func logPb() -> Void;
    
}

class C: SomeProtocol2  {
    
    static func someTypeMethod() {
        
    }
    
    func logName() -> Double {
        return 0.0
    }
    
    
    required init(someParam: Int) {
    }
}


extension C: ProtocolA {
    func logPa() {
        print("遵守A协议")
    }
    
}

let cObj = C(someParam: 1)
cObj.logPa()


//声明采纳协议
//如果一个类已经遵循了所有的需求,但是没有声明这个协议,这时候可以通过空的拓展表示已经遵循过了协议
protocol ProtocolC {
    func logPC() -> Void;
}

class D {
    func logPC() {
        print("遵守了ProtocolC协议")
    }
}

extension D: ProtocolC {

}

//类专用的协议
//通过添加 AnyObject 关键字到协议的继承列表，你就可以限制协议只能被类类型采纳（并且不是结构体或者枚举）。
protocol SomeClassOnlyProtocol: AnyObject {

}

//标明参数遵守协议
// protocolA & protocolB
protocol Named {
    var name: String { get }
}
protocol Aged {
    var age: Int { get }
}
struct Person: Named, Aged {
    var name: String
    var age: Int
}

func wishHappyBirthday(to celebrator: Named & Aged ) {
    print("Happy birthday, \(celebrator.name), you're \(celebrator.age)!")
}

//同时限定协议
func wishHappyBirthday2<T: Named & Aged>(to celebrator2:T) {
    print("Happy birthday2, \(celebrator2.name), you're \(celebrator2.age)!")

}

let birthdayPerson = Person(name: "Malcolm", age: 21)

wishHappyBirthday(to: birthdayPerson)
wishHappyBirthday2(to: birthdayPerson)

// 可以使用 is 和as 类检查协议遵循能转换为特定的协议。 转换类型,跟转换协议是一样的
protocol HasMoney {
    var rich: Bool {get}
}

class Man1: HasMoney {
    var rich: Bool = false
    
}

class Man2: HasMoney {
    var rich: Bool = true
}

class Man3 {
    var rich: Bool = true
}

let manList: [AnyObject] = [Man1(),Man2(),Man3()]

for obj in manList {
    if let objecMoney = obj as? HasMoney { //检查是否遵循HasMoney协议
        print("这个人是rich? :\(objecMoney.rich)")
    }else if let manObj = obj as? Man3 { //检查是否是 Man3协议
        print("Man3:\(manObj.rich)")
    }else {
        print("没有遵循协议 - 也不是Man3类型 \(obj)")
    }
}

//可选协议
//optional修饰, 协议和可选要求又必须使用 @objc标志标记 @obj 适用于 OC的类使用


@objc protocol dataSource {
  @objc optional func numOfCount() -> Int;
}




