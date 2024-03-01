import UIKit

/// 1、如何创建和使用闭包

func greetUser() {
    print("Hello")
}
greetUser()
var greeyCopy = greetUser //函数复制
greeyCopy() // 函数复制

//如果您想跳过创建单独的函数，而只是将该功能直接分配给常量或变量，该怎么办？
let sayHello = { //这是一个不带参数和返回值的无名函数
    print("Hi there!")
}

sayHello();

let sayHello1 = {(name:String) -> String in // in用于标记参数和返回类型的结束,其之后的所有内容都是闭包本身的主体。
        "Hi \(name)!"
}

/*
 空括号标记一个不带参数的函数。
 箭头的含义正是创建函数时的含义：我们将声明函数的返回类型。
 Void意思是“什么也没有”——这个函数什么也不返回。有时您可能会看到它写为()，但我们通常会避免这样做，因为它可能与空参数列表混淆。
 */
var greetCopy1:()-> Void = greetUser;

// ❤️ 每个函数的类型取决于它接收和发回的数据。这听起来可能很简单，但它隐藏了一个重要的问题：它接收到的数据的名称不是函数类型的一部分。
func getUserData(for id:Int) -> String{
    id == 1989 ? "Taylor Swift":"Anonymous"
}
//❤️这很容易开始：它是一个接受整数并返回字符串的函数。但是，当我们获取函数的副本时，函数的类型不包括for外部参数名称，因此当调用副本时，我们使用data(1989)而不是data(for: 1989).
let data:(Int)->String = getUserData;
let user = data(1989)

sayHello1("Taylor")//闭包不使用参数名称，就像我们复制函数一样。所以，再说一遍：外部参数名称仅在我们直接调用函数时才重要，而在我们创建闭包或首先获取函数副本时则无关紧要。





let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
let sortedTeam = team.sorted()
print(team)


func captainFirstSorted(name1:String,name2:String) -> Bool {
    if name1 == "Suzanne" {
        return true;
    }else if name2 == "Suzanne" {
        return false
    }
    
    return name1 < name2
}

let captainFistTeam = team.sorted(by: captainFirstSorted)//传递一个函数
print(captainFistTeam)

let captainFirstTeamClosure = team.sorted(by: {(name1:String,name2:String) -> Bool in
    if name1 == "Suzanne" {
        return true;
    }else if name2 == "Suzanne" {
        return false
    }
    
    return name1 < name2
})//传递一个闭包


/// 2、如何使用尾随闭包和速记语法

//想一想：在captainFirstTeamClosure中，我们提供的函数sorted()必须提供两个字符串并返回一个布尔值，那么为什么我们需要在闭包中重复自己呢？答案是不需要这样做

let captainFirstTeamClosure1 = team.sorted(by: {name1,name2 in
    if name1 == "Suzanne" {
        return true;
    }else if name2 == "Suzanne" {
        return false
    }
    
    return name1 < name2
})

let captainFirstTeamClosure2 = team.sorted { name1,name2 in
    if name1 == "Suzanne" {
        return true;
    }else if name2 == "Suzanne" {
        return false
    }
    
    return name1 < name2
}//尾随闭包语法的特殊语法

let captainFirstTeamClosure3 = team.sorted {
    if $0 == "Suzanne" {
        return true;
    }else if $1 == "Suzanne" {
        return false
    }
    return $0 < $1
}//Swift 为我们提供的专门命名的值：$0和$1，分别用于第一个和第二个字符串。

let reverseTeam = team.sorted {
    $0>$1
}

let tOnly = team.filter {
    $0.hasPrefix("T")
}
let uppercaseTeam = team.map {
    $0.uppercased()
}


/// 3、如何接受函数作为参数


func makeArray(size:Int,using generator:() -> Int) -> [Int] {
    var numbers = [Int]()
    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }
    
    return numbers
}

let rolls = makeArray(size: 50) {
    Int.random(in: 1...100)
}
print(rolls)

func generateNumber() -> Int {
    Int.random(in: 1...20)
}

let newRolls = makeArray(size: 50, using: generateNumber)//也同样适合传递函数
print(newRolls)

func doImportantWork(first:()->Void,second:()->Void,third:()->Void) {
    first()
    second()
    third()
}

doImportantWork {
    
} second: {
    
} third: {
    
}//传递多个参数


/// 3、闭包总结

/*
 我们在前面的章节中讨论了很多关于闭包的内容，所以让我们回顾一下：
    1、您可以在 Swift 中复制函数，它们的工作方式与原始函数相同，只是它们会丢失外部参数名称。
    2、所有函数都有类型，就像其他数据类型一样。这包括它们接收的参数及其返回类型，这可能Void也称为“无”。
    3、您可以通过分配给常量或变量来直接创建闭包。
    4、接受参数或返回值的闭包必须在大括号内声明，后跟关键字in。
    5、函数能够接受其他函数作为参数。他们必须预先声明这些函数必须使用哪些数据，Swift 将确保遵循规则。
    6、在这种情况下，您也可以传递一个闭包，而不是传递一个专用函数——您可以直接创建一个闭包。Swift 允许这两种方法都起作用。
    7、当将闭包作为函数参数传递时，如果 Swift 可以自动计算出闭包内的类型，则无需显式写出该类型。返回值也是如此——如果 Swift 可以计算出它，则不需要指定它。
    8、如果函数的一个或多个最终参数是函数，则可以使用尾随闭包语法。
    9、您还可以使用简写参数名称，例如$0和$1，但我建议仅在某些情况下才这样做。
    10、您可以创建自己的函数来接受函数作为参数，尽管在实践中了解如何使用它们比如何创建它们更重要。
 在 Swift 语言的各个部分中，我认为闭包是最难学的。不仅语法一开始有点难看，而且将函数传递给函数的概念本身也需要一些时间才能理解。
 */
