//
//  DTEnumerations.swift
//  SwiftProject
//
//  Created by renxun on 2018/10/19.
//  Copyright © 2018 renxun. All rights reserved.
//

import UIKit

class DTEnumerations: DTBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "枚举的使用"
        configDemoTableView()
        
    }
    
    override func _demoCode() {
        
        let section = adapter!.addNewSection()!
        AdapterCellUtil.creatCell(section: section, text: "基础的枚举的定义与使用", needSeparator: true) { (cell, index) in
            
            //类型最好是大写开头,枚举值为小写开头,比较符合自然语言
            enum Direction {
                case top
                case bottom
                case left
                case right
            }
        
            
            //使用
            let _ = Direction.top
            
            //定义方式2
            enum Direction1 {
                case top,bottom,topLeft,bottomRight
            }
            var value2 = Direction1.topLeft
            ////当类型被腿断出来了之后 可以省略类型
            value2 = .bottomRight
            print(value2)
        }
        
        AdapterCellUtil.creatCell(section: section, text: "使用Switch 语句匹配枚举", needSeparator: true) { (cell, index) in

            enum Direction1 {
                case top,bottom,topLeft,bottomRight
            }
            var value2 = Direction1.topLeft

            switch value2 {
            case .topLeft:
                print("topLeft")
            case  .top:
                print("top")
            case .bottom:
                print("bottom")
            default:
                print("other")
            }
            
        }
        
        AdapterCellUtil.creatCell(section: section, text: "枚举的关联值", needSeparator: true) { (cell, index) in

            enum Foods {
                case name(String)
                case price(Int)
                case from(String ,String)
            }
            let blana = Foods.name("香蕉")
            let blanaFrom = Foods.from("江西","广东")
            print(blana,blanaFrom)
            
            //switch 关联值
            switch blanaFrom{
            case .from (let address1, let address2):
                print("address1:",address1,address2)
            default:
                print("other")
            }
            
        }
        
        AdapterCellUtil.creatCell(section: section, text: "枚举的原始值", needSeparator: true) { (cell, index) in

            //统一类型才会有原始值
            enum foodName :String {
                case blana = "香蕉"
                case apple = "苹果"
            }

            //原始值的隐式赋值
            //在使用原始值为整数或者字符串类型的枚举时，不需要显式地为每一个枚举成员设置原始值，Swift 将会自动为你赋值。
            enum Planet: Int {
                case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
            }
            
            enum CompassPoint: String {
                case north, south, east, west
            }
            
            let earthsOrder = Planet.earth.rawValue
            // earthsOrder 值为 3
            
            let sunsetDirection = CompassPoint.west.rawValue
            // sunsetDirection 值为 "west"
            
            //使用原始值赋初始值
            //如果在定义枚举类型的时候使用了原始值，那么将会自动获得一个初始化方法，这个方法接收一个叫做 rawValue 的参数，参数类型即为原始值类型，返回值则是枚举成员或 nil。
            let plane = Planet(rawValue: 2)

        }
        
        AdapterCellUtil.creatCell(section: section, text: "递归枚举", needSeparator: false) { (cell, index) in
            
            enum EnumExpression {
                case num(Int)
                indirect case addNum(EnumExpression,EnumExpression) //代表此属性可递归
            }
            
            //代表EnumExpression1的属性都可以递归
            indirect enum EnumExpression1 {
                case num(Int)
                case addNum(EnumExpression,EnumExpression) //代表此属性可递归
            }
            
            
            let numValue1 = EnumExpression.num(3)
            let numValue2 = EnumExpression.num(23)
            let mathValue = EnumExpression.addNum(numValue1, numValue2)
            
            func math(enumValue: EnumExpression ) -> Int{
                switch enumValue {
                case let .num( x):
                    return x
                case let .addNum(intValValue1, intValValue2):
                    return math(enumValue:intValValue1) + math(enumValue: intValValue2)
                default:
                    break
                }
            }
            
            print("递归枚举:",math(enumValue: mathValue))

        }
        AdapterCellUtil.descCell(section: section, desc: """
递归枚举是一种枚举类型，它有一个或多个枚举成员使用该枚举类型的实例作为关联值。
indirect表示该成员可递归,如果放在 enum前面 表示整个枚举类型都可以递归

""")
        
        
    }
    

}
