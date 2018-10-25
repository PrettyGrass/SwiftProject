//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//可选链式调用

class Person {
    var pet: Dog?
}

class Dog {
    var name: String?
    func logName() {
        print("小狗的名字: \(name)")
    }
}

let person = Person()
let dog = Dog()
dog.name = "小花"

let petName = person.pet?.name
print(petName)

dog.logName()


