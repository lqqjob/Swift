 import UIKit

/// 1、如何检查条件是真还是假

let score:Int = 85
if score > 80 {
    print("Great job")
}

let speed:Int = 88
let percentage:Int = 85
let age:Int = 18
if speed >= 88 {
    print("Where we're going we don't need roads.")
}
if percentage < 85 {
    print("Sorry, you failed the test.")
}
if age > 18 {
    print("You're eligible to vote")
}


let ourName = "Dave"
let friendName = "Arnold"
if ourName < friendName {
    print("It's \(ourName) vs\(friendName)")
}
if ourName > friendName {
    print("It's \(friendName) vs \(ourName)")
}

var numbers:[Int] = [1,2,3]
numbers.append(4)
if numbers.count > 3 {
    numbers.remove(at: 0)
}
print(numbers)

let country = "Canada"
if country == "Australia" {
    print("G'day!")
}

let name = "Tay Swift"
if name != "Anonymout" {
    print("Welcome,\(name)")
}


var userName = "taylorswift13"
if userName == "" {
    userName = "Anonymous"
}
print("Welcome,\(userName)")
if userName.count == 0 {// count 计算了字符串的每一个字符，速度并不是最快的
    userName = "Anonymous"
}
if userName.isEmpty == true {
    userName = "Anonymous"
}
if userName.isEmpty {
    userName = "Anonymous"
}

/// 2、如何检查多个条件

let a = false
let b = true
if a {
    print("Code to run if a is true")
}else if b {
    print("Code to run if a is false but b is true")
}else {
    print("Code to run if both a and b are false")
}

let temp = 25
if temp > 20 && temp < 30 {
    print("It's a nice day")
}

let userAge = 14
let hasParentalConsent = true
if userAge >= 18 || hasParentalConsent {
    print("You can buy the game")
}

enum TransportOption {
    case airplane, helicopter, bicycle, car, scooter
}
let transport = TransportOption.airplane
if transport == .airplane || transport == .helicopter {
    print(" ")
}else if transport == .bicycle {
    
}else if transport == .car {
    
}else {
    
}

/// 3、如何使用switch语句来检查多个条件

enum Weather {
    case sun,rain,wind,snow,unkown
}

let forecast = Weather.unkown
switch forecast {
case .sun:
    print("sun")
case .rain:
    print("rain")
case .wind:
    print("wind")
case .snow:
    print("snow")
case .unkown:
    print("unkown")
}//所有switch语句必须详尽无遗，这意味着所有可能的值都必须在那里处理，这样您就不会意外漏掉一个。

let place = "Gotham"
switch place {
case "Gotham":
    print("You're Batman!")
case "Mega-City One":
    print("You're Judge Dredd!")
default:
    print("Who are you");

}

//该default:最后是默认情况，如果所有情况都无法匹配，则将运行该情况。
//请记住：Swift按顺序检查其案例，并运行第一个匹配的案例。如果您将default置于任何其他情况之前，该情况是无用的，因为它永远不会匹配，并且Swift将拒绝构建您的代码。
//其次，如果您明确希望Swift继续执行后续案例，请使用fallthrough。这不是常用的，但有时——只是有时——它可以帮助你避免重复工作。

let day = 3
switch day {
case 5:
    print("5 golden rings")
    fallthrough
case 4:
    print("4 calling birds")
    fallthrough
case 3:
    print("3 French hens")
    fallthrough
case 2:
    print("2 turtle doves")
    fallthrough
default:
    print("A partridge in a pear tree")
}

/// 4、如何使用三元条件运算符进行快速测试

let canVote = age >= 18 ? "Yes":"No"

let hour = 23
print(hour < 12 ? "It's before noon" : "It's after noon") //有些情况必须使用三元运算符
