//
//  DTFunctionController.swift
//  SwiftProject
//
//  Created by renxun on 2018/10/18.
//  Copyright © 2018 renxun. All rights reserved.
//

import UIKit

class DTFunctionController: DTBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "函数部分"
        configDemoTableView()
    }
    
    override func _demoCode() {
        
        let section = adapter!.addNewSection()!
        
        AdapterCellUtil.creatCell(section: section, text: "函数的定义", needSeparator: true) { (cell, index) in
            
            func logName(Person:String) -> Void {
                print("hello",Person)
            }
            
            //无参函数
            func logName() -> Void {
                print("logNameFunction")
            }
            
            //无返回值函数 可以省略 -> Void 实际上返回值还是 Void类型,此时这里的函数类型是 ()->Void
            func sayHelloWorld() {
                print("hello, world")
            }
            
        }
        
        AdapterCellUtil.creatCell(section: section, text: "多参函数", needSeparator: true) { (cell, index) in
            
            func greet(person: String, alreadyGreeted: Bool) -> String {
                if alreadyGreeted {
                    return "1"
                } else {
                    return "2"
                }
            }
        }
        
        AdapterCellUtil.creatCell(section: section, text: "多重返回值函数", needSeparator: true) { (cell, index) in
            func minMaxfunc1() -> (min: Int, max: Int) {
                return (6,10)
            }
        }
        AdapterCellUtil.creatCell(section: section, text: "可选元组返回类型", needSeparator: true) { (cell, index) in
            //(Int, Int)?  (Int?, Int?) 是不同的
            func minMaxfunc2() -> (min: Int, max: Int)? {
                return (6,10)
            }
            //用可选绑定检查值
            if let value = minMaxfunc2() {
                print(value)
            }
            
        }
        AdapterCellUtil.creatCell(section: section, text: "函数参数标签", needSeparator: false) { (cell, index) in
            func someFunction(argumentLabel parameterName: Int) {
                // 在函数体内，parameterName 代表参数值
                //argumentLabel: 参数标签
            }
            //调用的时候 参数名为标签
            someFunction(argumentLabel: 8)
            
            //忽略参数标签
            func someFunction1(_ parameterName: Int) {
                
            }
            someFunction1(1)
        }
        AdapterCellUtil.descCell(section: section, desc: "默认情况下函数都用参数名当他们的参数标签,一个唯一的函数标签能够使你的代码更具可读性,参数标签的使用能够让一个函数在调用时更有表达力，更类似自然语言，并且仍保持了函数内部的可读性以及清晰的意图")
        
        AdapterCellUtil.creatCell(section: section, text: "参数带默认值", needSeparator: true) { (cell, index) in
            
            func defaultValueFunction(label param:Int = 10) {
                print("默认值:\(param)")
            }
            
            defaultValueFunction(label: 1) // 值为1
            defaultValueFunction() //带默认值 值为: 10
        }
        
        AdapterCellUtil.creatCell(section: section, text: "函数的参数为可变参数", needSeparator: false) { (cell, index) in
   
            func mutableParamFunction(_ num:Int...) -> Int {
                
                var total: Int = 0
                for number in num {
                    total += number
                }
                return total
            }
            
            print("总数:\(mutableParamFunction(1,2,3,5,6,7))")
        }
        AdapterCellUtil.descCell(section: section, desc: """
通过在变量类型名后面加入（...）的方式来定义可变参数, 可以看做 num: 是多个 int类型的参数数组,参数可以传是 1 个或者多个
注意: 一个函数最多只能有一个可变参数
""")
        
        
        AdapterCellUtil.creatCell(section: section, text: "输入输出参数", needSeparator: false) { (cell, index) in
            
            func inoutFunction(_ a: inout Int ,_ b: inout Int) {
                let temporaryA = a
                a = b
                b = temporaryA
            }
            
            var p1 = 1
            var p2 = 2
            
            print("p1:\(p1) p2:\(p2)")
            inoutFunction(&p1,&p2)
            print("p1:\(p1) p2:\(p2)")

        }
        AdapterCellUtil.descCell(section: section, desc: """
函数参数默认是常量。试图在函数体中更改参数值将会导致编译错误。这意味着你不能错误地更改参数值。如果你想要一个函数可以修改参数的值，并且想要在这些修改在函数调用结束后仍然存在，那么就应该把这个参数定义为输入输出参数.
定义一个输入输出参数时,在参数定义前加 inout 关键字
""")
        
        
        AdapterCellUtil.creatCell(section: section, text: "函数的类型", needSeparator: false) { (cell, index) in
            
            func addTwoInts(param1: Int,param2: Int) -> Int {
                return param1 + param2
            }
            let mathFunction: (Int,Int) -> Int = addTwoInts
            print(mathFunction(1,2))
            
        }
        
        AdapterCellUtil.descCell(section: section, desc: "在Swift中,使用函数类型就像使用其他类型一样,你可以定义一个函数类型的常量,或者变量")
        
        
        AdapterCellUtil.creatCell(section: section, text: "函数类型作为参数 - 作为返回值", needSeparator: true) { (cell, index) in
            
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
           // mathFunction2(mathFunc: mathFunction)
            
        }
        AdapterCellUtil.creatCell(section: section, text: "嵌套函数", needSeparator: true) { (cell, index) in
            
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
            
        }
        
    }

}
