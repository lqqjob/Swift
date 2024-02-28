import UIKit

/// 1、如何存储Bool

let fileName = "paris.jpg"
print(fileName.hasSuffix("jpg"))
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

/// 2、如何拼接字符串

let firstPart = "Hello, "
let secondPart = "world"
let otherGreeting = firstPart + secondPart
print(otherGreeting)

let luggageCode = "1" + "2" + "3" + "4" + "5" //会产生临时变量

let otherQuote = "Then he tapped a sign saying \"Believe\" and walked away."
let newName = "Taylor"
let age = 26
let name = "Red"
let message = "Hello,my name is \(name) and I'm \(age) years old."//插入法效率更高
print(message)

let number = 120
//let missionMessage = "Apollo" + number + " landed on the moon." 不允许
let missionMessage = "Apolle" + String(number) + " landed on the moon."
let missionMessage1 = "Apolle \(number) landed on the moon." //更高效、更容易阅读

print("5 x 5 is \(5 * 5)")
