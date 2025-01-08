import UIKit

/// 1、如何创建和使用协议

protocol Vehicle{
    func estmateTime(for distance: Int) -> Int
    func travel(distance:Int)
}

struct Car:Vehicle {//Vehicle中列出的所有方法都必须完全存在于Car中
    func estmateTime(for distance: Int) -> Int {
        distance / 50
    }
    func travel(distance: Int) {
        print("I'm driving \(distance)km.")
    }
    
    func openSunroof() {
        print("It's a nice day")
    }
}


func commute(distance:Int,using vehicle:Car) {
    if vehicle.estmateTime(for: distance) > 100 {
        print("That's too slow! I'll try a different vehicle.")
    }else {
        vehicle.travel(distance: distance)
    }
}

let car = Car()
commute(distance: 100, using: car)

func commute(distance: Int,using vehicle:Vehicle) {//面向协议
    if vehicle.estmateTime(for: distance) > 100 {
        print("That's too slow! I'll try a different vehicle.")
    }else {
        vehicle.travel(distance: distance)
    }
}
commute(distance: 100, using: car)

struct Bicycle:Vehicle {
    func estmateTime(for distance: Int) -> Int {
        distance / 50
    }
    
    func travel(distance: Int) {
        print("I'm cycling \(distance)km.")

    }
}
let bike = Bicycle()
commute(distance: 50, using: bike)

//除了方法外，您还可以编写协议来描述在符合类型上必须存在的属性。为此，请写入var，然后写一个属性名称，然后列出它是否应可读和/或可写。

protocol Vehicle1 {
    var name:String {get}
    var currentPassengers: Int {get set}
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

struct Car1: Vehicle1 {
    
    let name: String = "Car1" //一个名为name的字符串，必须是可读的。这可能意味着它是一个常量，但它也可能是一个带有getter的计算属性。
    var currentPassengers: Int = 1 //一个名为currentPassengers的整数，必须是读写。这可能意味着它是一个变量，但它也可能是一个带有getter和setter的计算属性。
    
    
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }
    func travel(distance: Int) {
        print("I'm driving \(distance)km.")
    }
    
    func openSunroof() {
        print("It's a nice day")
    }
}

struct Bicycle1: Vehicle1 {
    let name: String = "Bicycle1"
    var currentPassengers: Int = 1
    
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }
    func travel(distance: Int) {
        print("I'm driving \(distance)km.")
    }
}

func getTravelEstimates(using vehicles:[Vehicle1],distance:Int) {
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance)km")
    }
}

let car1 = Car1()
let bike1 = Bicycle1()
getTravelEstimates(using: [car1,bike1], distance: 150)

/*
 ※ 您可以遵守尽可能多的协议，只需将它们逐个列出，用逗号分隔即可。如果您需要对某些东西进行子分类并符合协议，您应该先将父类名称放在首位，然后再编写协议。
 */


/// 2、如何使用不透明的返回类型

func getRandomNumber() -> Int {
    Int.random(in: 1...6)
}

func getRandomBool() -> Bool {
    Bool.random()
}

print(getRandomNumber() == getRandomNumber()) //Int和Bool都符合名为Equatable的通用Swift协议，这意味着“可以比较为平等”。Equatable协议允许我们使用==

func getRandomNumber() -> some Equatable {
    Int.random(in: 1...7)
}

func getRandomBool() -> some Equatable {
    Bool.random()
}

/// 3、如何创建使用扩展

/*
 扩展让我们可以向任何类型添加功能，无论是我们创建的还是其他人创建的，甚至是 Apple 自己的类型之一
 */

extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    mutating func trim() {//上面是返回一个字符串，这个是直接修改字符串本身
        self = self.trimmed()
    }
    
    var lines:[String] {
        self.components(separatedBy: .newlines)
    }
}

var quote = "   The truth is rarely pure and never simple   "

let trimed = quote.trimmed()

print(quote.trim())

/*
 ※ 您还可以使用扩展向类型添加属性，但有一个规则：它们只能是计算属性，而不是存储属性。原因是添加新的存储属性会影响数据类型的实际大小 - 如果我们向一个整数添加一堆存储属性，那么每个整数都需要占用更多的内存空间，这会导致各种排序的问题。
 */

let lyrics = """
But I keep cruising
Can't stop, won't stop moving
It's like I got this music in my mind
Saying it's gonna be alright
"""
print(lyrics.lines.count)

struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int
    
//    init(title: String, pageCount: Int) { 如果自定义了init 方法，系统就不会提供默认的初始化方法
//        self.title = title
//        self.pageCount = pageCount
//        self.readingHours = pageCount / 50
//    }
}

extension Book {// ※ 即又自定义的初始化方法，又保留了系统提供的初始化方法   如果您考虑一下，这是有道理的：如果在扩展中添加新的初始化程序也禁用了默认初始化程序，那么我们的一个小更改可能会破坏各种其他 Swift 代码。
    init(title:String,pageCount: Int) {
        self.title = title
        self.pageCount = pageCount;
        self.readingHours = pageCount / 50
    }
}


/// 4、如何创建和使用协议扩展

let guests = ["Mario", "Luigi", "Peach"]

if guests.isEmpty == false {
    print("Guest count: \(guests.count)")
}

extension Array { //只能用于Array
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

if guests.isNotEmpty {
    print("Guest count: \(guests.count)")
}

extension Collection {//可以用于Array、Set和Dictionary
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

protocol Person {
    var name:String {get}
    func sayHello()
}

extension Person { // 符合类型可以不提供extension提供的方法
    func sayHello() {
        print("Hi, I'm \(name)")
    }

}

struct Student: Person {
    var name: String = "hello"
    func sayHello() { // 如果自己提供了方法，调自己的，如果自己没有提供就调 extension 提供的
        print("Hi, I'm student")

    }
}

let student = Student();
student.sayHello()


/// 5、如何充分利用协议扩展

//extension Int {
//    func squared() -> Int {
//        self * self
//    }
//}

extension Numeric {
    func squared() -> Self {
        self * self
    }
}

let wholeNumber = 5
print(wholeNumber.squared())

struct User: Equatable,Comparable {
    let name: String
 
}
func <(lhs:User,rhs:User) -> Bool {
    lhs.name < rhs.name
}

let user1 = User(name: "Link")
let user2 = User(name: "Zelda")

print(user1 == user2)
print(user1 != user2)
print(user1 < user2)
print(user1 <= user2)
print(user2 > user1)

/// 6、协议和扩展总结

/*
 1、协议就像代码契约：我们指定所需的函数和方法，并且一致的类型必须实现它们。
 2、不透明的返回类型让我们可以在代码中隐藏一些信息。这可能意味着我们希望保留未来更改的灵活性，但也意味着我们不需要编写巨大的返回类型。
 3、扩展让我们可以向自己的自定义类型或 Swift 的内置类型添加功能。这可能意味着添加一个方法，但我们也可以添加计算属性。
 4、协议扩展让我们可以一次性向多种类型添加功能——我们可以向协议添加属性和方法，并且所有符合要求的类型都可以访问它们。
 */
