//
//  DTClosures.swift
//  SwiftProject
//
//  Created by renxun on 2018/10/19.
//  Copyright © 2018 renxun. All rights reserved.
//

import UIKit

class DTClosuresController: DTBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        title = "闭包的定义与使用"
        configDemoTableView()
    }
    
    override func _demoCode() {
        
        let section = adapter!.addNewSection()!
    
        AdapterCellUtil.creatCell(section: section, text: "闭包", needSeparator: false) { (cell, index) in
            
        }
        AdapterCellUtil.descCell(section: section, desc: """
闭包是自包含的函数代码块，可以在代码中被传递和使用。
闭包的三种形式:
1.全局的函数,是一个有名字的闭包,但是他不会捕获任何值
2.嵌套函数,是一个有名字并可以捕获内值的闭包
3.闭包表达式 ,是一个利用轻量级语法所写的匿名闭包,他可以捕获上下文中的常量,或者变量
闭包表达式语法:

        { (parameters) -> return type in
            //code..
        }
""")
        AdapterCellUtil.creatCell(section: section, text: "闭包表达式的一些语法优化", needSeparator: false) { (cell, index) in
    
        }
        AdapterCellUtil.descCell(section: section, desc: """
            1.闭包可以根据上下文推断类型
            2.单表达式闭包 隐式返回 ,单行表达式的闭包支持隐式返回,可以省略 return关键字
            3.参数名称缩写 Swift 自动为闭包提供了参数名称缩写功能，你可以直接通过 $0，$1，$2 来顺序调用闭包的参数，以此类推。
            4.尾随闭包语法

            """)
        
        AdapterCellUtil.creatCell(section: section, text: "尾随闭包语法", needSeparator: true) { (cell, index) in
            
            //参数是一个闭包
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
        }
        
        //闭包的特性
        AdapterCellUtil.creatCell(section: section, text: "闭包的特性", needSeparator: false) { (cell, index) in

        }
        AdapterCellUtil.descCell(section: section, desc: """
1.闭包的值捕获
闭包的值捕获
闭包可以在其被定义的上下文中捕获常量或变量。即使定义这些常量和变量的原作用域已经不存在，闭包仍然可以在闭包函数体内引用和修改这些值。
如果一个值不会被闭包改变，或者在闭包创建后不会改变，Swift会改为捕获并保存一份对值的拷贝。Swift 也会负责被捕获变量的所有内存管理工作，包括释放不再需要的变量。
注意: 如果你将闭包赋值给一个类实例的属性，并且该闭包通过访问该实例或其成员而捕获了该实例，你将在闭包和该实例间创建一个循环强引用。Swift 使用捕获列表来打破这种循环强引用。

2.闭包是引用类型,赋值的时候,多个变量将会指向同一个闭包地址

""")
        
        AdapterCellUtil.creatCell(section: section, text: "逃逸闭包", needSeparator: false) { (cell, index) in
            
        }
        AdapterCellUtil.descCell(section: section, desc: """
            当一个闭包作为参数传到一个函数中，但是这个闭包在函数返回之后才被执行，我们称该闭包从函数中逃逸。当你定义接受闭包作为参数的函数时，你可以在参数名之前标注 @escaping，用来指明这个闭包是允许“逃逸”出这个函数的
            将一个闭包标记为 @escaping 意味着你必须在闭包中显式地引用self,非逃逸闭包才可以隐式调用self,因为逃逸闭包执行的上下文不确定,所以需要指定self

            """)
        
        
        
        let EscapingClosureCode = {
            
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
                  //  someFunctionWithEscapingClosure { self.x = 100 } //逃逸闭包需要self
                   // someFunctionWithNonescapingClosure { x = 200 } //非逃逸闭包可以不用
                }
            }
            
            let instance = SomeClass()
            instance.doSomething()
            print(instance.x)
            // 打印出 "200"
            
            handles.first?()
            print(instance.x)
            // 打印出 "100"
        }
        
        AdapterCellUtil.creatCell(section: section, text: "逃逸闭包使用", needSeparator: true) { (cell, index) in
          EscapingClosureCode()
        }
        
        
        AdapterCellUtil.creatCell(section: section, text: "自动闭包", needSeparator: false) { (cell, index) in
            
            
        }
        AdapterCellUtil.descCell(section: section, desc: """
自动闭包是一种自动创建的闭包，用于包装传递给函数作为参数的表达式,这种闭包不接受任何参数，当它被调用的时候，会返回被包装在其中的表达式的值。这种便利语法让你能够省略闭包的花括号，用一个普通的表达式来代替显式的闭包。
自动闭包让你能够延迟求值，因为直到你调用这个闭包，代码段才会被执行。延迟求值对于那些有副作用（Side Effect）和高计算成本的代码来说是很有益处的，因为它使得你能控制代码的执行时机。
如果你想让一个自动闭包可以“逃逸”，则应该同时使用 @autoclosure 和 @escaping 属性。
tip: 过度使用 autoclosures 会让你的代码变得难以理解。上下文和函数名应该能够清晰地表明求值是被延迟执行的。
""")
        AdapterCellUtil.creatCell(section: section, text: "自动闭包的使用", needSeparator: false) { (cell, index) in
            
            var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
            print(customersInLine.count)
            // 打印出 "5"
            //自动闭包
            let customerProvider = { customersInLine.remove(at: 0) }
            print(customersInLine.count)
            // 打印出 "5"
            print("Now serving \(customerProvider())!")
            // Prints "Now serving Chris!"
            print(customersInLine.count)
            // 打印出 "4"

        }
        
        
    }
}
