//: [Previous](@previous)

import Foundation

/*
 内容:
  * 下标语法
  * 下标用法
  * 下标选项
 */


//下标: 定义在类、结构体和枚举中，是访问集合、列表或序列中元素的快捷方式。

// 自定义一个下标

//subscript(index: Int) -> Int {
//
//    //下标可以设定为读写或只读
//    get {
//        // 返回一个适当的 Int 类型的值
//    }
//    set(newValue) {
//        // 执行适当的赋值操作
//    }
//}

var numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]

var value = numberOfLegs["ant"]
//解读:  字典内部定义了
//subscript(key: [Key : Value].Key) -> [Key : Value].Value?
//通过下标取出的就是value的值

struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    
    //参数可以是任意的
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}

var matrix = Matrix(rows: 2, columns: 2)
//设置矩阵的值
matrix[0, 1] = 1.5
matrix[1, 0] = 3.2


//下标可以重载.通过区分参数类型来识别是哪个参数
/*
 总结:
 
 下标是访问集合的一种便捷方式,可以定义在 类,结构体,跟枚举中.当我们一个类里包含的元素比较多,我们可以考虑用下标的形式,以一定的规律去取出来
 
 class dog {
 主人A
 主人B
 主人C
 
 subscript(名字,名别 ,年龄) -> 主人 {
 //匹配信息
 //返回主人
 
 }
 }
 
 //使用
 主人 = dog["小花","男",16]

 """)
 
 
 */
