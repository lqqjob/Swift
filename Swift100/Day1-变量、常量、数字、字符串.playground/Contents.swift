import UIKit

/// 1、如何创建变量和常量

var greeting = "Hello, playground"
var name = "Red"
print(name)
name = "Rebecca"
print(name)
name = "Keeley"
print(name)
let charactor = "Daphe"
//charactor = "Eloise"

/// 2、如何创建字符串

let actor = "Denzel"
let filName = "paris.jpg"
let result = "⭐️ You win! ⭐️"
let quote = "Then he tapped a sign saying \"Believe\" and walked away."
let movie = """
A day in
the life of an
Apple engineer
""" //多行字符

print(actor.count)
let nameLength = actor.count
print(nameLength)
print(result.uppercased())
print(movie.hasPrefix("A day"))
print(filName.hasPrefix(".jpg"))


/// 3、如何存储整数

let score = 10;
let realBig = 100_000_000//可以使用_分割

let higherScore = score + 10
let lowerScore = score - 10
let doubleScore = score * 2
let squaredScore = score * score
let halvedScore = score / 2

var counter = 10
counter = counter + 5
counter += 5;
print(counter);
counter *= 2
print(counter)
counter -= 10
print(counter)
counter /= 2
print(counter)

let number = 120
print(number.isMultiple(of: 3))//是否是3的倍数
print(120.isMultiple(of: 3))

/// 4、如何存储浮点数

let doubleNumber = 0.2 + 0.1
print(doubleNumber) //0.30000000000000004

let a = 1;
let b = 2.0;
//let c = a+b 无法将Int和Double 类型数据相加
let c = a + Int(b)
let c1 = Double(a)+b

let double1 = 3.1
let double2 = 3131.3131
let double3 = 3.0
let int1 = 3


var otherName = "Nicolas Cage"
otherName = "John Travolta"
//otherName = 57 一旦 Swift 决定了常量或变量保存的数据类型，它必须始终保存相同的数据类型
var rating = 5.0
rating *= 2
print(rating)


/// 5、如何存储Bool

let fileName = "paris.jpg"
print(filName.hasSuffix("jpg"))
let anotherNumber = 120
print(anotherNumber.isMultiple(of: 3))

let goodDogs = true
let gameOver = false

let isMultiple = 120.isMultiple(of: 3)

var isAuthenticated = false
isAuthenticated = !isAuthenticated
print(isAuthenticated)
isAuthenticated = !isAuthenticated
print(isAuthenticated)

var otherGameOver = false
print(otherGameOver)
otherGameOver.toggle()
print(otherGameOver)

/// 6、如何拼接字符串

let firstPart = "Hello, "
let secondPart = "world"
let otherGreeting = firstPart + secondPart
print(greeting)

let luggageCode = "1" + "2" + "3" + "4" + "5" //会产生临时变量

let otherQuote = "Then he tapped a sign saying \"Believe\" and walked away."
let newName = "Taylor"
let age = 26
let message = "Hello,my name is \(name) and I'm \(age) years old."//插入法效率更高
print(message)

//let missionMessage = "Apollo" + number + " landed on the moon." 不允许
let missionMessage = "Apolle" + String(number) + " landed on the moon."
let missionMessage1 = "Apolle \(number) landed on the moon." //更高效、更容易阅读

print("5 x 5 is \(5 * 5)")



