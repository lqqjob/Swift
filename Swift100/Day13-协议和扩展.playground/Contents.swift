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

