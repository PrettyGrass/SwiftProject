

//
//  DTGatherDemoController.swift
//  SwiftProject
//
//  Created by renxun on 2018/10/17.
//  Copyright © 2018 renxun. All rights reserved.
//

import UIKit

class DTGatherDemoController: DTBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "集合类型的使用"

        configDemoTableView()
    }
    
   override func _demoCode()-> Void {
    //数组类型
  _arrayDemo()
    //集合类型
    _setDemo()
    //字典
    _dicDemo()
    }
    
    //MARK: 数组
    func _arrayDemo() -> Void {
        let section1 = adapter!.addNewSection()!
        AdapterCellUtil.creatCell(section: section1, text: "说明:", needSeparator: false) { (cell,indexPath) in
        }
        AdapterCellUtil.descCell(section: section1, desc: """
        Swift 提供了三种主要的集合类型，所谓的数组、合集还有字典，用来储存值的集合。数组是有序的值的集合。合集是唯一值的无序集合。字典是无序的键值对集合。
        """
        )
        
        AdapterCellUtil.creatCell(section: section1, text: "集合的可变性", needSeparator: false) { (cell,indexPath) in
        }
        AdapterCellUtil.descCell(section: section1, desc: "如果创建一个 Arrays、Sets 或 Dictionaries 并且把它分配成一个变量，这个集合将会是可变的。这意味着你可以在创建之后添加更多或移除已存在的数据项，或者改变集合中的数据项。如果我们把 Arrays、Sets 或 Dictionaries 分配成常量，那么它就是不可变的，它的大小和内容都不能被改变")
        AdapterCellUtil.descCell(section: section1, desc: "\nTip:在我们不需要改变集合的时候创建不可变集合是很好的选择。Swift编译器可以优化我们创建的集合。")
        
        //MARK: 数组
        AdapterCellUtil.creatCell(section: section1, text: "创建一个空数组", needSeparator: true) { (cell,indexPath) in
            var list = [Int]()
            print("list.count\(list.count)")
            list.append(1)
            print("list.count\(list.count)")
        }
        
        AdapterCellUtil.creatCell(section: section1, text: "创建一个带有默认值的数组", needSeparator: false) { (cell,indexPath) in
            let defaultArr = Array(repeating: 0.0, count: 3) // 默认值为0.0会被推断成double类型
            //repeating : 初始值 count: 数量
            // defaultArr 等价于 [0.0,0.0,0.0]
            print(defaultArr)
        }
        AdapterCellUtil.descCell(section: section1, desc: "Array 类型还提供一个可以创建特定大小并且所有数据都被默认的构造方法")
        
        AdapterCellUtil.creatCell(section: section1, text: "数组相加 => 新数组", needSeparator: true) { (cell,indexPath) in
            
            let list1 = Array(repeating: 0.0, count: 3)
            let list2 = Array(repeating: 1.0, count: 2)
            
            let newList = list1 + list2;
            print("新数组:",newList)
        }
        AdapterCellUtil.creatCell(section: section1, text: "使用字面量构造数组", needSeparator: true) { (cell,indexPath) in
            let list :[String] = ["string1","string2","string3"]
            print(list)
        }
        
        AdapterCellUtil.creatCell(section: section1, text: "访问和修改数组", needSeparator: false) { (cell,indexPath) in
            
            var listArr = ["obj1","obj2","obj3"]
            
            //判断是否为空
            if listArr.isEmpty {
                print("listArr it's Empty")
            }
            
            //append(_:)添加新数组
            listArr.append("obj4")
            
            print("append添加: \(listArr)")
            
            // +=
            listArr += ["obj5"]
            print("+=添加: \(listArr)")
            
            //第一项
            print("[0]:第一项",listArr[0])
            print(".first:第一项",listArr.first)
            
            //用下标来改变数组的值
            listArr[0] = "newObj1"
            print("下标修改第一项:新值为\(listArr[0])")
            
            var firstObj = listArr.first
            firstObj?.append("尾部")
            
            //修改一系列 按顺序替换 比如 三个元素 后面只替换了两个元素,则最后一个元素无
            listArr[0...3] = ["修改一系列Obj1","修改一系列Obj2"]
            print(listArr)
            
            //插入
            listArr.insert("插入obj1", at: 0)
            print("insert插入元素[0]:",listArr)
            
            //删除
            listArr.remove(at: 0)
            listArr.removeLast()
            listArr.removeFirst()
            listArr.removeAll(keepingCapacity: true)
            print(listArr)
            
        }
        
        AdapterCellUtil.descCell(section: section1, desc: """
通过数组的方法和属性来访问和修改数组，或者使用下标语法
tip: 使用下面这种方法修改字符串第一项不会改变
var firstObj = listArr.first
firstObj?.append("尾部")

""")
        AdapterCellUtil.creatCell(section: section1, text: "数组优化点:removeAll(keepingCapacity:)", needSeparator: false) { (cell,indexPath) in
            
            var listArr = ["元素1","元素2","元素3"]
            //传递true以请求集合避免释放其存储,如果下次数组还需要加,则推荐传true,是一个优化点. 默认是false
            listArr.removeAll(keepingCapacity: true)
            
        }
        AdapterCellUtil.descCell(section: section1, desc: """
传递true以请求集合避免释放其存储,如果下次数组还需要加,则推荐传true, 默认是false
""")
        
        AdapterCellUtil.creatCell(section: section1, text: "通过下标快速替换已知元素", needSeparator: true) { (cell,indexPath) in
            
            var students = ["Ben", "Ivy", "Jordell"]
            students.append("Maxime")
            print("替换之前:\(students)")
            
            if let i = students.firstIndex(of: "Maxime") {
                students[i] = "Max"
            }
            print("替换之后:\(students)")
        }
        
        AdapterCellUtil.creatCell(section: section1, text: "快速查找数组中元素", needSeparator: true) { (cell,indexPath) in
            class Student {
                var name :String?
            }
            
            let s1 = Student()
            s1.name = "陆超"
            let s2 = Student()
            s2.name = "邓超"
            let s3 = Student()
            s3.name = "高超"
            
            let studentList = [s1,s2,s3]
            
            let obj = studentList.first { (Student) -> Bool in
                Student.name == "陆超"
            }
            print("obj\(obj?.name)")
        }
        
        AdapterCellUtil.creatCell(section: section1, text: "丢弃第一个元素,返回一个新数组", needSeparator: true) { (cell,indexPath) in
            
            let students = ["Ben", "Ivy", "Jordell"]
            let newStudents = students.dropFirst()
            print("新同学:\(newStudents)")
            
        }
        
        AdapterCellUtil.creatCell(section: section1, text: "多个数组间共享数据情况", needSeparator: true) { (cell,indexPath) in
            //修改: 每个数组都有一个独立的值，其中包含所有元素的值。对于整数和其他结构这样的简单类型，这意味着当你更改一个数组中的值时，该元素的值不会在数组的任何副本中更改
            var numbers = [1, 2, 3, 4, 5]
            let numbersCopy = numbers
            
            numbers[0] = 100
            print(numbers)
            // Prints "[100, 2, 3, 4, 5]"
            print(numbersCopy)
            // Prints "[1, 2, 3, 4, 5]"
            
            
            //当两个数组共享一份数据的时候,修改其值 是可以继续共享数据的,当这份值删除或者替换,则另外一份会持有原来的数据不受影响
            class IntegerReference {
                var value = 10
            }
            
            var firstIntegers = [IntegerReference(), IntegerReference()]
            var secondIntegers = firstIntegers
            
            
            secondIntegers.removeFirst()
            
            print(firstIntegers[0].value)
            
            firstIntegers[0].value = 100
            secondIntegers[0].value = 200
            
            print(firstIntegers[0].value)
            print(secondIntegers[0].value)
            
            //当这份值删除或者替换,则另外一份会持有原来的数据不受影响
            firstIntegers[0] = IntegerReference()
            
            print(firstIntegers[0].value)
            // Prints "10"
            print(secondIntegers[0].value)
            // Prints "100"
            
        }
        
        let shareStrings = """
每个数组都有一个独立的值，其中包含所有元素的值。对于整数和其他结构这样的简单类型，这意味着当你更改一个数组中的值时，该元素的值不会在数组的任何副本中更改,
当两个数组共享一份数据的时候,修改其值 是可以继续共享数据的(两个数组的值是同步),当这份值删除或者替换,则另外一份会持有原来的数据不受影响
"""
        AdapterCellUtil.descCell(section: section1, desc: shareStrings)
        
        AdapterCellUtil.creatCell(section: section1, text: "桥接 Array -> NSArray", needSeparator: false) { (cell,indexPath) in
        }
        AdapterCellUtil.descCell(section: section1, desc: """
当你想要访问 NSArray实例中需要用到其Api 时候, 比如 addObj:  可以用类型转换操作符(as)来链接, 桥接成功前提是数组的元素类型必须是类,@objc协议(从Objective-C导入的协议或标记为@objc属性的协议)或者连接到基础类型的类型
"""
        )
        
        AdapterCellUtil.creatCell(section: section1, text: "遍历数组的两种方式", needSeparator: true) { (cell,indexPath) in
            
            let names = ["alice","bob","clic"]
            
            for item in names {
                print(item)
            }
            
            for (index ,item) in names.enumerated() {
                print("index:\(index) value:\(item)")
            }
            
        }
        
    }
    
    //MARK: 集合
    func _setDemo() -> Void {
        
        let section2 = adapter!.addNewSection()!

        AdapterCellUtil.creatCell(section: section2, text: "", needSeparator: false) { (cell,indexPath) in
        }
        
        AdapterCellUtil.creatCell(section: section2, text: "合集:", needSeparator: false) { (cell,indexPath) in
            
        }
        AdapterCellUtil.descCell(section: section2, desc: """
合集将同一类型且不重复的值无序地储存在一个集合当中
tip:Swift 的 Set类型桥接到了基础框架的 NSSet类上。

特点:无须,不重复
需求需要去重,可以考虑使用合集

知识点:
为了能让类型储存在合集当中，它必须是可哈希的——就是说类型必须提供计算它自身哈希值的方法。哈希值是Int值且所有的对比起来相等的对象都相同，比如 a == b，它遵循 a.hashValue == b.hashValue。

所有 Swift 的基础类型（比如 String, Int, Double, 和 Bool）默认都是可哈希的，并且可以用于合集或者字典的键。没有关联值的枚举成员值（如同枚举当中描述的那样）同样默认可哈希。

注意:
你可以使用你自己自定义的类型作为合集的值类型或者字典的键类型，只要让它们遵循 Swift 基础库的 Hashable协议即可。遵循 Hashable协议的类型必须提供可获取的叫做 hashValue的 Int属性。通过 hashValue属性返回的值不需要在同一个程序的不同的执行当中都相同，或者不同程序。

因为 Hashable协议遵循 Equatable，遵循的类型必须同时一个“等于”运算符 ( ==)的实现。 Equatable协议需要任何遵循 ==的实现都具有等价关系。就是说， ==的实现必须满足以下三个条件，其中 a, b, 和 c是任意值：

a == a  (自反性)
a == b 意味着 b == a  (对称性)
a == b && b == c 意味着 a == c  (传递性)

""")
        
        AdapterCellUtil.creatCell(section: section2, text: "创建并初始化一个空合集", needSeparator: true) { (cell,indexPath) in
            
            var _ = Set<String>()
            var _ = Set<Character>()
        }
        
        AdapterCellUtil.creatCell(section: section2, text: "使用数组字面量创建合集", needSeparator: true) { (cell,indexPath) in
            //会自动推断类型
            var _: Set<String> = ["Rock", "Classical", "Hip hop"]
        }
        
        AdapterCellUtil.creatCell(section: section2, text: "访问和修改一个集合", needSeparator: true) { (cell,indexPath) in
            
            var demoSet: Set<String> = ["Rock", "Classical", "Hip hop"]

            //数量:
            print(demoSet.count)
            
            //判断是否为空
            if (demoSet.isEmpty) {
                print("demoSet为空")
            }
            
            //插入
            demoSet.insert("a")
            
            //检查包含
            if demoSet.contains("Rock") {
                print("包含")
            } else {
                print("不包含")
            }
            
            //删除
            demoSet.removeAll()
            
            //快速移除
            if let _ = demoSet.remove("Rock") {
                print("包含了Rock 并且移除")
            } else {
                print("没有包含过Rock")
            }

        }
        
        AdapterCellUtil.creatCell(section: section2, text: "遍历集合", needSeparator: true) { (cell,indexPath) in
            //遍历集合
            
            let demoSet: Set<String> = ["Rock", "Classical", "Hip hop"]
            for item in demoSet {
                print(item)
            }
            
            let favoriteGenres :Set = ["123","avc","sdp"]
            for genre in favoriteGenres.sorted() {
                print("\(genre)")

        }
            AdapterCellUtil.descCell(section: section2, desc: """
Swift 的 Set 类型没有确定的顺序，为了按照特定顺序来遍历一个 Set 中的值可以使用 sorted() 方法，它将返回一个有序数组，这个数组的元素排列顺序由操作符'<'对元素进行比较的结果来确定。

tip: 你可以高效地完成 Set 的一些基本操作，比如把两个集合组合到一起，判断两个集合共有元素，或者判断两个集合是否全包含，部分包含或者不相交。
"""
            )
        }
        
        AdapterCellUtil.creatCell(section: section2, text: "基本集合操作", needSeparator: true) { (cell,indexPath) in

            //使用 intersection(_:) 方法根据两个集合中都包含的值创建的一个新的集合。
            //使用 symmetricDifference(_:) 方法根据在一个集合中但不在两个集合中的值创建一个新的集合。
            //使用 union(_:) 方法根据两个集合的值创建一个新的集合。
            //使用 subtracting(_:) 方法根据不在该集合中的值创建一个新的集合。
        }
        
        AdapterCellUtil.creatCell(section: section2, text: "集合成员关系和相等", needSeparator: true) { (cell,indexPath) in

            //使用“是否相等”运算符（==）来判断两个集合是否包含全部相同的值。
            //使用 isSubset(of:) 方法来判断一个集合中的值是否也被包含在另外一个集合中。
            //使用 isSuperset(of:) 方法来判断一个集合中包含另一个集合中所有的值。
            //使用 isStrictSubset(of:) 或者 isStrictSuperset(of:) 方法来判断一个集合是否是另外一个集合的子集合或者父集合并且两个集合并不相等。
            //使用 isDisjoint(with:) 方法来判断两个集合是否不含有相同的值（是否没有交集）。
            
            let houseAnimals: Set = ["🐶", "🐱"]
            let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
            let cityAnimals: Set = ["🐦", "🐭"]
            
            let _ = houseAnimals.isSubset(of: farmAnimals)
            // true
            let _ = farmAnimals.isSuperset(of: houseAnimals)
            // true
            let _ = farmAnimals.isDisjoint(with: cityAnimals)
            // true
        }
        
    }

    func _dicDemo() -> Void {
        
        let section3 = adapter!.addNewSection()!
        AdapterCellUtil.creatCell(section: section3, text: "", needSeparator: false) { (cell,indexPath) in
        }
        
        AdapterCellUtil.creatCell(section: section3, text: "字典:", needSeparator: false) { (cell,indexPath) in
            
        }
        AdapterCellUtil.descCell(section: section3, desc: """
tip: [Key : Value]  Key 类型必须遵循 Hashable协议,所以Swift中 Key可以是基础数据类型,乃至任意遵循Hashable协议的类
""")
        
        AdapterCellUtil.creatCell(section: section3, text: "创建一个空字典", needSeparator: true) { (cell,indexPath) in
            //创建一个空字典,指明 key: Int 类型  Value: String类型
            var namesOfIntegers = [Int: String]()
            namesOfIntegers[16] = "16"
        }
        
        
        AdapterCellUtil.creatCell(section: section3, text: "使用字面向量创建字典", needSeparator: true) { (cell,indexPath) in
            let _: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
    
        }
        AdapterCellUtil.creatCell(section: section3, text: "访问和修改字典", needSeparator: true) { (cell,indexPath) in
            var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

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

        }
        AdapterCellUtil.creatCell(section: section3, text: "遍历字典 [key values]", needSeparator: false) { (cell,indexPath) in
            let airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

            for (aripointCode,airportName) in airports {
                print("\(aripointCode): \(airportName)")
            }
            
            for airportCode in airports.keys {
                print("Airport code: \(airportCode)")
            }
            
            for airportName in airports.values {
                print("Airport name: \(airportName)")
            }
            
            //
        }
        AdapterCellUtil.descCell(section: section3, desc: """
注意:Swift 的字典类型是无序集合类型。为了以特定的顺序遍历字典的键或值，可以对字典的 keys 或 values 属性使用 sorted() 方法。
""")
        AdapterCellUtil.creatCell(section: section3, text: "键集合或者值集合构造一个新数组", needSeparator: true) { (cell,indexPath) in
            let airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
            let _ = [String](airports.keys) //新数组
            let _ = [String](airports.values)
            
        }
        
    }
 

}
