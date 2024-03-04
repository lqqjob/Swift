import UIKit

/// 1、如何创建自己的结构体

struct Album {
    let title: String
    let artist: String
    let year: Int
    func printSummary() {
        print("\(title) (\(year)) by \(artist)")
    }
}

let red:Album = Album(title: "Red", artist: "Taylor Swift", year: 2012)
let wings:Album = Album(title: "Wings", artist: "BTS", year: 2016)
print(red.title)
print(wings.artist)
red.printSummary()
wings.printSummary()


struct Employee {
    let name: String
    var vacationRemaining:Int
    var vacationRemainingDefault = 14
    
    mutating func takeVacation(days:Int) { //❤️ 任何只读取数据的函数都可以，但是任何更改属于结构体的数据的函数都必须用特殊的mutating关键字标记
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        }else {
            print("Oops! There aren't enough days remaining.")

        }
    }
}

var archer = Employee(name: "LQQ", vacationRemaining: 14)//❤️如果你更改var archer为，let archer你会发现 Swift 拒绝再次构建你的代码 - 我们试图在常量结构上调用变异函数，这是不允许的。
archer.takeVacation(days: 5)
print(archer.vacationRemaining)

var archer1 = Employee.init(name: "Sterling Archer", vacationRemaining: 14) //Swift 在名为 的结构体中默默地创建一个特殊函数init()

var archer2 = Employee(name: "Sterling Archer", vacationRemaining: 14, vacationRemainingDefault: 20) //如果将默认值分配给常量属性，则该默认值将从初始值设定项中完全删除。要分配默认值但保留在需要时覆盖它的可能性，请使用变量属性。

/// 2、如何动态计算属性值



/// 3、财产发生变化时如何采取行动



/// 4、如何创建自定义初始值设定项
