//: [Previous](@previous)

import Foundation

var str = "泛型"

protocol WorkProtocol {
   associatedtype ReceiveType
    func startWork(WithType: ReceiveType) -> Void
}

class Money {
    func logMoney() {
        print("工作: -> 得💰")
    }
}

class Carrot {
    func logCarrot() {
        print("工作: -> 得🥕")
    }
}

class People: WorkProtocol {
    
    typealias ReceiveType = Money
    func startWork(WithType: Money) {
        WithType.logMoney()
    }
}

class Rabbit: WorkProtocol {
    
    typealias ReceiveType = Carrot
    func startWork(WithType: Carrot) {
        WithType.logCarrot()
    }
}

People().startWork(WithType: Money())
Rabbit().startWork(WithType: Carrot())
