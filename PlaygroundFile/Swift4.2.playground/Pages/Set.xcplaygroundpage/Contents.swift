//: [Previous](@previous)

import Foundation


//初始化
var _ = Set<String>()
var _ = Set<Character>()

var _: Set<String> = ["Rock", "Classical", "Hip hop"]

//构造一个空的集合
var letters = Set<Character>()

//使用字面向量创建集合
var demoSet: Set<String> = ["Rock", "Classical", "Hip hop"]

//访问和修改一个集合
demoSet.count

if demoSet.isEmpty {
   print("demoSet为空")
}
//插入
demoSet.insert("a")

//删除
demoSet.removeAll()

//检查包含
if demoSet.contains("Rock") {
    print("包含")
} else {
    print("不包含")
}

//快速移除
if let removedGenre = demoSet.remove("Rock") {
    print("包含了Rock 并且移除")
} else {
    print("没有包含过Rock")
}

//遍历集合
for item in demoSet {
    print(item)
}

//Swift 的 Set 类型没有确定的顺序，为了按照特定顺序来遍历一个 Set 中的值可以使用 sorted() 方法，它将返回一个有序数组，这个数组的元素排列顺序由操作符'<'对元素进行比较的结果来确定。
let favoriteGenres :Set = ["123","avc","sdp"]
for genre in favoriteGenres.sorted() {
    print("\(genre)")
}
// prints "Classical"
// prints "Hip hop"
// prints "Jazz


//你可以高效地完成 Set 的一些基本操作，比如把两个集合组合到一起，判断两个集合共有元素，或者判断两个集合是否全包含，部分包含或者不相交。


//#基本集合操作
//使用 intersection(_:) 方法根据两个集合中都包含的值创建的一个新的集合。
//使用 symmetricDifference(_:) 方法根据在一个集合中但不在两个集合中的值创建一个新的集合。
//使用 union(_:) 方法根据两个集合的值创建一个新的集合。
//使用 subtracting(_:) 方法根据不在该集合中的值创建一个新的集合。


//集合成员关系和相等

//使用“是否相等”运算符（==）来判断两个集合是否包含全部相同的值。
//使用 isSubset(of:) 方法来判断一个集合中的值是否也被包含在另外一个集合中。
//使用 isSuperset(of:) 方法来判断一个集合中包含另一个集合中所有的值。
//使用 isStrictSubset(of:) 或者 isStrictSuperset(of:) 方法来判断一个集合是否是另外一个集合的子集合或者父集合并且两个集合并不相等。
//使用 isDisjoint(with:) 方法来判断两个集合是否不含有相同的值（是否没有交集）。

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubset(of: farmAnimals)
// true
farmAnimals.isSuperset(of: houseAnimals)
// true
farmAnimals.isDisjoint(with: cityAnimals)
// true



