import UIKit

/// 1、如何通过函数重用代码

func showWelcome() {//() 可以理解为函数调用点
    print("Welcome to my app")
}

func printTimesTables(number:Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}
printTimesTables(number: 5)

func printTimesTables(number:Int,end:Int) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(number: 5, end: 20) //提示：当函数完成时，您在函数内创建的任何数据都会自动销毁。


/// 2、如何从函数返回值

func rollDice() -> Int {
    return Int.random(in: 1...6)
}
let result = rollDice()
print(result)

func areLettersIdentical(string1:String,string2:String) -> Bool {
    let first = string1.sorted()
    let second = string2.sorted()
    
    return first == second
}

func areLettersIdentical1(string1:String,string2:String) -> Bool {
    return string1.sorted() == string1.sorted()
}

func areLettersIdentical2(string1:String,string2:String) -> Bool { // 当一个函数只有一行代码时，我们可以return完全删除该关键字
     string1.sorted() == string1.sorted()
}

func rollDice1() -> Int {
    Int.random(in: 1...8)
}

func pythagoras(a:Double,b:Double) -> Double {
    sqrt(a * a + b * b);
}


/// 2、如何从函数返回多个值

func getUserArray() -> [String] {//返回数组
    ["Taylor","Swift"]
}

let user = getUserArray();
print("Name:\(user[0]) \(user[1])")//缺点：0、1根本分不清是是什么


func getUserDiction() -> [String : String] {//返回字典
    [
        "firstName":"Taylor",
        "lastName":"Swift"
    ]
}
let dicUser = getUserDiction()
print("Name:\(dicUser["firstName",default: ""]) \(dicUser["lastName",default: ""])")//缺点：还要写默认值


func getUserTuple() -> (firstName:String,lastName:String){//返回元祖
    (firstName:"Taylor",lastName:"Swift")
}

let userTuple = getUserTuple()
print("Name:\(userTuple.firstName) \(userTuple.lastName)")

/*
 我知道元组看起来与字典非常相似，但它们是不同的：

 当您访问字典中的值时，Swift 无法提前知道它们是否存在。是的，我们知道它user["firstName"]会在那里，但 Swift 不能确定，所以我们需要提供一个默认值。
 当您访问元组中的值时，Swift确实会提前知道它可用，因为元组表示它将可用。
 我们使用user.firstName: 它不是字符串来访问值，因此也不可能出现拼写错误。
 我们的字典可能包含数百个其他值"firstName"，但我们的元组不能 - 我们必须列出它将包含的所有值，因此它保证包含所有这些值，而不包含其他值。
 因此，元组比字典具有一个关键优势：我们准确指定将存在哪些值以及它们具有什么类型，而字典可能包含也可能不包含我们要求的值。
 */



func getUserTuple1() -> (firstName:String,lastName:String) {
    ("Taylor","Swift")//可以不用写名称
}

let user1 = getUserTuple1()
print("Name:\(user1.firstName) \(user1.lastName)")


func getUserTuple2() -> (String,String) {
    ("Taylor","Swift")
}
let user2 = getUserTuple2()
print("Name:\(user2.0) \(user2.1)")

let (firstName,lastName) = getUserTuple();
print("Name:\(firstName) \(lastName)")

let (fistName,_) = getUserTuple(); // 可以忽略元祖一部分
print("Name:\(firstName)")


/// 3、如何自定义参数标签

func rollDice(sides:Int,count:Int) -> [Int] {
    var rolls : [Int] = Array<Int>()
    
    for _ in 1...count {
        let roll = Int.random(in: 1...sides)
        rolls.append(roll)
    }
    
    
    return rolls;
}

let rolls = rollDice(sides: 6, count: 4)


func hireEmployee(name:String) {
    
}
func hireEmployee(title:String) {
    
}
func hireEmployee(location:String) {
    
}
//这些都是名为hireEmployee()的函数，但是当你调用它们时，Swift 会根据你提供的参数名称知道你指的是哪一个。


func isUppercase(_ string:String) -> Bool {//_ 删除外部参数标签
    string == string.uppercased()
}
let result1 = isUppercase("HELLO")

func printTimesTables(for number:Int) {//外部名称是for，内部名称是number，类型是Int。
    for i in 1...12 {
        print("\(i) x \(number) is \(i*number)")
    }
}

/*
 因此，Swift为我们提供了两种控制参数名称的重要方法：我们可以使用_隐藏外部参数名称，这样它就不会被使用，或者在那里添加for第二个名称，以便我们同时拥有外部和内部参数名称。
 */

