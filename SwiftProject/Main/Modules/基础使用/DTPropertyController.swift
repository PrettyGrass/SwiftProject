//
//  PropertyController.swift
//  SwiftProject
//
//  Created by renxun on 2018/10/19.
//  Copyright © 2018 renxun. All rights reserved.
//

import UIKit

class DTPropertyController: DTBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "属性"
        configDemoTableView()
    }
    
    override func _demoCode() {
        /*
         
         内容:
         
         - 属性的种类:
         * 储存属性
         * 计算属性
         * 类属性
         - 属性的使用
         * 属性观察器
         
         - 全局变量和局部变量
         
         */
        let section = adapter!.addNewSection()!
        
        AdapterCellUtil.creatCell(section: section, text: "属性的种类", needSeparator: false) { (cell, index) in
            
        }
        AdapterCellUtil.descCell(section: section, desc: """
 内容:
 
 - 属性的种类:
    * 储存属性:
        - 存储在 一个类,或者结构体实例中的常量或者变量
    * 计算属性
        - 提供 getter 和一个 可选 setter 来间接获取或设置其他属性或者变量的值
    * 类属性
        - 类本身定义的属性,数据共享,无法被覆盖,子类也同样一份

 - 属性的使用
    * 属性观察器
        - 属性观察器监控和响应属性值的变化(除了延迟属性 lazy)
""")
        
        AdapterCellUtil.creatCell(section: section, text: "延迟存储属性", needSeparator: false) { (cell, index) in
            
            
            class CustomView  {
                lazy var containView = UIView();
                lazy var subV: UILabel = {
                    let label = UILabel()
                    label.font = UIFont.systemFont(ofSize: 13)
                    return label
                }()
                var desc = "视图描述"
            }
            
            let view = CustomView()
            view.desc.append("++++")
            //这里的 containView还没有被创建

        }
    
        AdapterCellUtil.descCell(section: section, desc: """
        延迟存储属性是指当第一次被调用的时候才会计算其初始值的属性。在属性声明前使用 lazy 来标示一个延迟存储属性
        如果一个被标记为 lazy 的属性在没有初始化时就同时被多个线程访问，则无法保证该属性只会被初始化一次。
""")
        AdapterCellUtil.creatCell(section: section, text: "计算属性的使用", needSeparator: true) { (cell, index) in

            struct animal {
                var name: String;
                var sex: Int;
            }
            
            struct PropertyInfo{
                var height: Int;
                var weight: Int;
            }
            
            struct Pet {
                
                var basicInfo = animal(name: "小黄", sex: 1)
                var externInfo = PropertyInfo(height: 100, weight: 100)
                var jumpHeight :Int {
                    get {
                        let height = externInfo.height - externInfo.weight + 50;
                        return height
                    }
                    set(newHeight) { //set可选 可以间接设置其他属性或变量的值,
                        //do..
                        //jumpHeight = newHeight  如果在这里 set自己 会循环
                    }
                }
            }
            
            //简化Setter的声明
            
            struct Pet1 {
                
                var basicInfo = animal(name: "小黄", sex: 1)
                var externInfo = PropertyInfo(height: 100, weight: 100)
                var jumpHeight :Int {
                    get {
                        let height = externInfo.height - externInfo.weight + 50;
                        return height
                    }
                    set { // set默认一个名称 newValue
                        print(newValue)
                    }
                }
            }
            
            
            //只读计算属性
            //只有 getter 没有 setter 的计算属性就是只读计算属性。只读计算属性总是返回一个值，可以通过点运算符访问，但不能设置新的值。
            //注意: 必须使用 var 关键字定义计算属性,包括只读计算属性，因为它们的值不是固定的。let 关键字只用来声明常量属性，表示初始化后再也无法修改的值。
            
            struct Pet2 {
                
                var externInfo = PropertyInfo(height: 100, weight: 100)
                var jumpHeight :Int {
                    get {
                        let height = externInfo.height - externInfo.weight + 50;
                        return height
                    }
                }
            }
            
            let dog = Pet2()
            //dog.jumpHeight = 10 //error  cannot assign to property: 'jumpHeight' is a get-only property
            print(dog.jumpHeight)

        }
        
        
        
        AdapterCellUtil.creatCell(section: section, text: "属性观察器的使用", needSeparator: false) { (cell, index) in

        
            class Human {
                var name: String?
                var age: Int? {
                    willSet(xxNewAge) {
                        print("newAge:\(xxNewAge)")
                    }
                    didSet {
                        print("oldAge:\(oldValue)")
                    }
                }
            }
            
            let xiaoHua1 = Human()
            //xiaoHua1.name = "小花"
            xiaoHua1.age = 17
            xiaoHua1.age = 18
            print("name:\(xiaoHua1.name ?? "小青") age:\(xiaoHua1.age ?? 10)")
            
        }
        
        AdapterCellUtil.descCell(section: section, desc: """
        每次属性被设置值的时候都会调用属性观察器，即使新值和当前值相同的时候也不例外,可以继承,重写属性,增加属性观察器
        对比Objective-C显得尤其方便
        willSet: 在新的值被设置之前调用 默认参数:newValue
        didSet: 在新的值被设置之后立即调用  默认参数:oldValue
""")
        
        
        AdapterCellUtil.creatCell(section: section, text: "属性观察器的使用", needSeparator: false) { (cell, index) in

            class Iphone3GS {
                static var isIphone = true
                static var price = 2500
                
                static var isExpensive :Bool {
                    get {
                        return price > 5000
                    }
                }
            }
            
            
            //无法覆盖属性
            class IphoneX: Iphone3GS {
                //override static var price = 7566 error: 无法覆盖存储属性
                //
                //    override static var isExpensive :Bool {
                //        get {
                //            return price > 5000
                //        }
                //    }
            }
            
            IphoneX.price = 7500
            
            
            //共享值
            print("Iphone3GS price:\(Iphone3GS.price)  IphoneX price:\(IphoneX.price)" )
            //Iphone3GS price:7500  IphoneX price:7500
            
        }
        
        AdapterCellUtil.descCell(section: section, desc: """

存储型类型属性可以是变量或常量，计算型类型属性跟实例的计算型属性一样只能定义成变量属性。
注意: 类型本身因为没有构造器,无法在初始化的时候分配属性,须给存储型类型属性指定默认值,继承无法覆盖类属性,而且子类改变属性的值会影响到父类的属性,他们共享一个属性
存储型类型属性是延迟初始化的，它们只有在第一次被访问的时候才会被初始化。即使它们被多个线程同时访问，系统也保证只会对其进行一次初始化，并且不需要对其使用 lazy 修饰符。

""")
        
        AdapterCellUtil.creatCell(section: section, text: "个人总结:", needSeparator: false) { (cell, index) in
            
        }
        
        AdapterCellUtil.descCell(section: section, desc: """
Swift 从OC 中的类,结构体属性分离出来了计算属性,延迟属性 提供了更为便捷的属性观察器,延迟属性跟类属性相似,都是使用的时候才会有值,区别是类属性需要默认值,因为没有构造器,雷属性不用 lazy关键字修饰,类属性共享一份值,包括在子类
""")
        
        
    }

}
