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




