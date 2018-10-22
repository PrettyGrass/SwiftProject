//
//  DTExtendsController.swift
//  SwiftProject
//
//  Created by renxun on 2018/10/22.
//  Copyright © 2018 renxun. All rights reserved.
//

import UIKit

class DTExtendsController: DTBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "继承"
        configDemoTableView()
    }
    
    override func _demoCode() {
        
        let section = adapter!.addNewSection()!
        
        AdapterCellUtil.creatCell(section: section, text: "基本知识:", needSeparator: false) { (cell, index) in
            
        }
        AdapterCellUtil.descCell(section: section, desc: """
基类: 不继承于其它类的类，称之为基类。
被继承的类叫父类(超类),可以通过关键字 super 访问
重写需要声明: override ,Swift编译器会自动去父类检查此重写属性或者方法
关键字final声明 该属性,方法,下标,不支持重写

""")

        AdapterCellUtil.creatCell(section: section, text: "基类的声明", needSeparator: true) { (cell, index) in
            
            class animal {
                
                var height :Int?
                var weight :Int?
                var name = "animal"
                
                static var isHungry = false
                
                func hello() {
                    print("hello")
                }
            }
            
            let obj1 = animal()
            obj1.hello()

        }
        
        
        AdapterCellUtil.creatCell(section: section, text: "定一个一个子类", needSeparator: true) { (cell, index) in

            class A {
                
            }
            //子类B
            class B: A {
                
            }
        }
        
        AdapterCellUtil.creatCell(section: section, text: "重写父类方法", needSeparator: false) { (cell, index) in
            
            class animal {
                
                var height :Int?
                var weight :Int?
                var name = "animal"
                func hello() {
                    print("hello")
                }
            
            }
            
            class Dog: animal {
                
                //重写属性
                override var name: String {
                    get {
                        return super.name
                    }
                    set {
                        super.name += "dog"
                    }
                }
                
                override var height: Int? {
                    get {
                        return 20
                    }
                    set {
                        print("------")
                    }
                }
                func run() {
                    print("run")
                }
                
                //重写方法
                override func hello() {
                    print("hello - i'm a dog ")
                }
                
            }
            //父类的属性
            let dog1 = Dog()
            dog1.weight = 10
            dog1.name = "🐶"
            
            print("dog's Height:\(dog1.height!) dog's weight:\(dog1.weight!)")
            print("dog's name:\(dog1.name)")

        }
        
        AdapterCellUtil.creatCell(section: section, text: "防止重写:final关键字", needSeparator: false) { (cell, index) in

            final class A {
                
            }
            
            //class B: A { //error:  from a final class 'A'
            //
            //}
        }
        AdapterCellUtil.descCell(section: section, desc: """
如果final声明在 属性,方法,或者下标前面,证明此属性或者方法不支持重写,如果标记在 class前面,代表整个类都不支持重写
""")
        
        AdapterCellUtil.creatCell(section: section, text: "总结", needSeparator: false) { (cell, index) in
        }
        
        AdapterCellUtil.descCell(section: section, desc: """
在Swift 中 可以使用关键字 final 来标明不能被继承, 大体与OC一致,有需要的话可以重写父类属性的属性观察器,当重写父类的一个只读属性时,可以把他重写成 可读写属性,但是反过来可不行,需要都提供 setter getter 方法
""")
    
}

}
