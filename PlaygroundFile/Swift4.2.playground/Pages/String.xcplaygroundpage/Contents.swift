//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func viewDidLoad() {
        stringFun()
    }
    
    func stringFun() -> Void {
        // 循环来遍历字符串 ,获取字符串中每一个字符的值：
        for character in "Dog!🐶¥" {
            print(character)
        }
        
        //Character : a可以建立一个独立字符常量,或变量
        let _: Character = "!"
        
        //字符串可以通过传递一个值类型为 Character 的数组作为自变量来初始化：
        let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
        let catString = String(catCharacters)
        print(catString)
        
        //拼接字符串和字符
        let string1 = "hello"
        let string2 = " there"
        var welcome = string1 + string2
        
        // +=
        var instruction = "look over"
        instruction += string2
        
        // append 将一个字符加到一个字符串变量的尾部
        let exclamationMark2: Character = "!"
        welcome.append(exclamationMark2)
        print(welcome)
    
        
        //注意:你不能把 String或者 Character追加到已经存在的 Character变量当中，因为 Character值能且只能包含一个字符。
        
        //字符串插值
        //字符串插值是一种构建新字符串的方式，可以在其中包含常量、变量、字面量和表达式
        let multiplier = 3
        let message = "1 + 2 = \(multiplier)"
        print(message)
        
        //表达式
        let multiplier1 = 3.0;
        let message1 = "1 + 2 = \(Int(multiplier))"
        print(message)
        
        //Unicode
        //Unicode是一个国际标准，用于文本的编码和表示。它可以用标准格式标识来自任意语言几乎所有的字符,并能够对文本文件或网页这样的外部资源中的字符进行读写操作。 Swift 的 String 和 Character 类型是完全兼容 Unicode 标准的。
        
        //Unicode 标量
        /* Swift 的 String 类型是基于 Unicode 标量 建立的。 Unicode 标量是对应字符或者修饰符的唯一的21位数字
         例如 U+0061 表示小写的拉丁字母（LATIN SMALL LETTER A）（"a"），U+1F425 表示小鸡表情（FRONT-FACING BABY CHICK）（"🐥"）。
         注意不是所有的21位 Unicode 标量都代表一个字符，因为有一些标量是留作未来分配的。已经代表一个典型字符的标量都有自己的名字，例如上面例子中的 LATIN SMALL LETTER A 和 FRONT-FACING BABY CHICK。
         */
        //注意:注意
        
       // Unicode 码位（code poing） 的范围是 U+0000 到 U+D7FF 或者 U+E000 到 U+10FFFF。Unicode 标量不包括 Unicode 代理项（surrogate pair） 码位，其码位范围是 U+D800 到 U+DFFF。
        
        //特殊字符
            //字符串字面量中的特殊字符
    //        转义特殊字符 \0 (空字符)， \\ (反斜杠)， \t (水平制表符)， \n (换行符)， \r(回车符)， \" (双引号) 以及 \' (单引号)；
    //        任意的 Unicode 标量，写作 \u{n}，里边的 n是一个 1-8 个与合法 Unicode 码位相等的16进制数字。

        //计算字符数量
        //如果想要获得一个字符串中 Character 值的数量，可以使用 count 属性：
//        扩展字形集群能够组合一个或者多个 Unicode 标量。这意味着不同的字符——以及相同字符的不同表示——能够获得不同大小的内存来储存。因此，Swift 中的字符并不会在字符串中获得相同的内存空间。所以说，字符串中字符的数量如果不遍历它的扩展字形集群边界的话，是不能被计算出来的。如果你在操作特殊的长字符串值，要注意 count属性为了确定字符串中的字符要遍历整个字符串的 Unicode 标量。
//
//        通过 count属性返回的字符统计并不会总是与包含相同字符的 NSString中 length属性相同。 NSString中的长度是基于在字符串的 UTF-16 表示中16位码元的数量来表示的，而不是字符串中 Unicode 扩展字形集群的数量。
        
        let moreString = "What's your name?"
        print("字符长度:\(moreString.count)")

        let ChineseCode = "锄禾日当午?"
        print("中文长度:\(ChineseCode.count)")
        
        //访问和修改字符串
        var _ = "大家好,我是陆超,我就一个人,真好！"
        //修改
        //append lowercased:转换小写 uppercased:大写 分割,通过下标等修改
        //你可以通过下标脚本语法或者它自身的属性和方法来访问和修改字符串。
        
        
        //字符串索引
        //每一个 String值都有相关的索引类型， String.Index，它相当于每个 Character在字符串中的位置。
        //，不同的字符会获得不同的内存空间来储存，所以为了明确哪个 Character 在哪个特定的位置，你必须从 String的开头或结尾遍历每一个 Unicode 标量。因此，Swift 的字符串不能通过整数值索引。
        
        let greeting = "Guten Tag!"
        greeting[greeting.startIndex]
        // G
        greeting[greeting.index(before: greeting.endIndex)]
        // !
        greeting[greeting.index(after: greeting.startIndex)]
        // u
        let index = greeting.index(greeting.startIndex, offsetBy: 7)
        greeting[index]
        
        
        //使用 indices属性来访问字符串中每个字符的索引。
        //terminator: 指定""结尾,否则会出现换行的情况
        for index in greeting.indices {
            print("\(greeting[index]) ", terminator: "")
        }
        
        //注意:你可以在任何遵循了 Indexable 协议的类型中使用 startIndex 和 endIndex 属性以及 index(before:) ， index(after:) 和 index(_:offsetBy:) 方法。这包括这里使用的 String ，还有集合类型比如 Array ， Dictionary 和 Set 。
        
        //插入单个字符
        var inserString = "inser targetStr"
        inserString.insert("!", at: inserString.endIndex)
        print(inserString)

        //插入一段字符
         var inserString1 = "my name is "
        inserString1.insert(contentsOf: "uncle", at: inserString1.endIndex)
        print(inserString1)
        
        //删除最后一个字符
        var welcome1 = "hello"
        print(welcome1.remove(at: welcome1.index(before: welcome1.endIndex)))
        print("移除后:",welcome1)
        
        //删除一个范围的字符
        var welcome2 = "hello"
        let range = welcome2.startIndex ..< welcome2.endIndex
        welcome2.removeSubrange(range)
        
        // tip:
//       // 你可以在任何遵循了 RangeReplaceableIndexable 协议的类型中使用 insert(_:at:) ， insert(contentsOf:at:) ， remove(at:) 方法。这包括了这里使用的 String ，同样还有集合类型比如 Array ， Dictionary 和 Set 。
        

        //# 子字符串
        let childString = "hello,world"
        //4.2 Swift才有的
        let childIndex = childString.lastIndex(of: ",") ?? greeting.endIndex
        //0 到, 之间范围的字符 [character]
        let beginning = childString[..<childIndex]
        let newString = String(beginning)
        print(newString)
        
        //字符串比较
        //Swift 提供了三种方法来比较文本值：字符串和字符相等性，前缀相等性以及后缀相等性。

        let stringEqual1 = "dog"
        let stringEqual2 = "dog"
        if stringEqual1 == stringEqual2 {
            print("相等")
        }
        
        //比较前缀 ,后缀
        let romeoAndJuliet = [
            "Act 1 Scene 1: Verona, A public place",
            "Act 1 Scene 2: Capulet's mansion",
            "Act 1 Scene 3: A room in Capulet's mansion",
            "Act 1 Scene 4: A street outside Capulet's mansion",
            "Act 1 Scene 5: The Great Hall in Capulet's mansion",
            "Act 2 Scene 1: Outside Capulet's mansion",
            "Act 2 Scene 2: Capulet's orchard",
            "Act 2 Scene 3: Outside Friar Lawrence's cell",
            "Act 2 Scene 4: A street in Verona",
            "Act 2 Scene 5: Capulet's mansion",
            "Act 2 Scene 6: Friar Lawrence's cell"
        ]
        
        var act1SceneCount = 0
        for scene in romeoAndJuliet {
            if scene.hasPrefix("Act 1 ") {
                act1SceneCount += 1
            }
        }
        print("有 \(act1SceneCount) 个 Act 1开头的字符")
        
    }
    
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
