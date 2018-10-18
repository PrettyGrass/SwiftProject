//: [Previous](@previous)

import Foundation

//字典

//tip: [Key : Value]  Key 类型必须遵循 Hashable协议,所以Swift中 Key可以是基础数据类型,乃至任意遵循Hashable协议的类

//创建一个空字典,指明 key: Int 类型  Value: String类型
var namesOfIntegers = [Int: String]()
namesOfIntegers[16] = "16"

//使用字面向量创建字典
var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]


//访问和修改字典
//数量:airports.count
//使用 isEmpty检查count属性是否为空
//添加
airports["LHR"] = "London"
//修改
airports["LHR"] = "London Heathrow"

//更新旧值
if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}
//检索特定的值
if let airPortName = airports["DUB"] {
    print("The name of the airport is \(airPortName).")
}

//移除
airports["APL"] = "Apple Internation"
airports["APL"] = nil

if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed airport's name is \(removedValue).")
} else {
    print("The airports dictionary does not contain a value for DUB.")
}

//遍历字典 [key values]
for (aripointCode,airportName) in airports {
    print("\(aripointCode): \(airportName)")
}

for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}

for airportName in airports.values {
    print("Airport name: \(airportName)")
}

//使用字典的键集合或者值集合可以构造一个新数组
let newAirPortKeyList = [String](airports.keys)
let newAirPortValueList = [String](airports.values)

//注意:Swift 的字典类型是无序集合类型。为了以特定的顺序遍历字典的键或值，可以对字典的 keys 或 values 属性使用 sorted() 方法。









