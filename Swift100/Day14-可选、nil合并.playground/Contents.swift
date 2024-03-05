import UIKit

/// 1、如何使用optionals处理缺失数据

/*
 Swift 喜欢我们的代码是可预测的，这意味着它不会让我们使用可能不存在的数据。对于可选值，这意味着我们需要打开可选值才能使用它 - 我们需要查看盒子内部是否有值，如果有，则将其取出并使用它。

 */


let opposites = [
    "Mario": "Wario",
    "Luigi": "Waluigi"
]

//Swift 为我们提供了两种展开选项的主要方法，但您最常看到的方法如下所示：
if let peachOpposite = opposites["Peach"] {
    print("Mario's opposite is \(peachOpposite)")
}

var userName: String? = nil

if let unwrappedName = userName {
    print("We got a user: \(unwrappedName)")

}else {
    print("The optional was empty.")

}

func square(number: Int) -> Int {
    number * number
}
var number: Int? = nil

//square(number: number) Swift 将拒绝构建该代码，因为可选整数需要展开——我们不能在需要非可选值的地方使用可选值，因为如果里面没有值，我们就会遇到问题

if let unwrappedNumber = number {
    print(square(number: unwrappedNumber))
}
if let number = number { // 当展开可选值时，将它们展开为同名常量是很常见的
    
}


/// 2、怎么使用guard打开可选类型

func printSquare(of number:Int?) {
    guard let number = number else { // 就像 一样if let，guard let检查可选值中是否有值，如果有，它将检索该值并将其放入我们选择的常量中
        print("Missing input")
        return
    }
    print("\(number) x \(number) is \(number * number)")

}

var myVar: Int? = 3

if let unwrapped = myVar { //if let如果可选值有值，则在大括号内运行代码；如果可选值没有值
    print("Run if myVar has a value inside")
}

func gardTest() {
    guard let unwrapped = myVar else { //guard提供的是检查我们的程序状态是否是我们所期望的的能力，如果不是，就退出——例如，退出当前函数
        print("Run if myVar doesn't have a value inside")
        return
    }
}

/*
 因此：用于if let解包选项，以便您可以以某种方式处理它们，并用于guard let确保选项内部有某些内容，否则退出。
 */


/// 3、如何使用 nil 合并来打开选项

let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]
let new = captains["Serenity"] ?? "N/A"

let tvShows = ["Archer", "Babylon 5", "Ted Lasso"]
let favorite = tvShows.randomElement() ?? "None"

struct Book {
    let title: String
    let author: String?
}

let book = Book(title: "Beowulf", author: nil)
let author = book.author ?? "Anonymous"


/// 3、如何使用可选链处理多个可选值

let names = ["Arya", "Bran", "Robb", "Sansa"]
let chosen = names.randomElement()?.uppercased() ?? "No one" //可选链接的神奇之处在于，如果可选值为空，它会默默地不执行任何操作 - 它只会发回与之前相同的可选值，但仍然为空。这意味着可选链的返回值始终是可选的，这就是为什么我们仍然需要 nil 合并来提供默认值。

var otherBook:Book? = nil
let otherAuthor = otherBook?.author?.first?.uppercased() ?? "A"


/// 4、如何使用选项处理功能失败

enum UserError:Error {
    case badID,networkFailed
}

func getUser(id:Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 23) {
    print("User: \(user)")
}

let user = (try? getUser(id: 23)) ?? "Anonymous"


/// 4、可选总结

/*
 1、可选值让我们表示没有数据，这意味着我们可以说“这个整数没有值”——这与 0 这样的固定数字不同。
 2、因此，所有不可选的内容都肯定有一个值，即使那只是一个空字符串。
 3、展开可选值是查看盒子内部以查看其包含内容的过程：如果内部有值，则将其发送回以供使用，否则内部也会有nil。
 4、if let如果可选值有值，我们可以运行一些代码，或者如果可选值没有值，我们guard let可以运行一些代码- 但之后我们必须始终退出该函数。guard
 5、nil 合并运算符??展开并返回可选值，或使用默认值。
 6、可选链接让我们可以使用方便的语法在另一个可选值中读取一个可选值。
 7、如果一个函数可能会抛出错误，您可以将其转换为可选的 using try?- 您将返回该函数的返回值，或者nil如果抛出错误。
 
 */
