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

/*
 结构体可以有两种属性：存储属性是在结构实例内保存一段数据的变量或常量，计算属性在每次访问时动态计算属性的值。这意味着计算属性是存储属性和函数的混合：它们像存储属性一样访问，但像函数一样工作
 */


struct Employee1 {
    let name:String
    var vacationAllocated = 14
    var vacationTaken = 0
    
    var vacationRemaining: Int {
        get {
            vacationAllocated - vacationTaken
        }
        
        set {
            vacationAllocated = vacationTaken + newValue
        }
    }
}

var archer3 = Employee1(name: "",vacationAllocated: 14)
archer3.vacationTaken += 4
print(archer3.vacationRemaining);
archer3.vacationTaken += 4
print(archer3.vacationRemaining)

/// 3、属性更改时如何执行操作

struct Game {
    var score = 0 {
        
        didSet { //属性观察器
            print(print("Score is now \(score)"))
        }
    }
}

var game = Game()
game.score += 10
game.score -= 3


struct App {
    var contacts = [String]() {
        willSet {
           print("Current value is: \(contacts)")
            print("New value will be: \(newValue)")
        }
        didSet {
            print("There are now \(contacts.count) contacts")
            print("Old value was \(oldValue)")
        }
    }
}

var app = App()
app.contacts.append("Adrian E")
app.contacts.append("Allen W")

/// 4、如何创建自定义init方法

struct Player {
    let name:String
    let number:Int
    
    init(name: String, number: Int) {
        self.name = name
        self.number = number
    }
    
    init(name:String) {
        self.name = name
        number = Int.random(in: 1...999) //在初始化程序结束时，所有属性都必须具有值
    }
    
    /*
     虽然您可以在初始化程序中调用结构体的其他方法，但在为所有属性赋值之前不能这样做 - Swift 需要在执行其他操作之前确保一切都是安全的。
     
     如果需要，您可以向结构体添加多个初始值设定项，并利用外部参数名称和默认值等功能。但是，一旦您实现了自己的自定义初始值设定项，您将无法访问 Swift 生成的成员初始值设定项，除非您采取额外的步骤来保留它。这并非偶然：如果您有自定义初始化程序，Swift 会有效地假设这是因为您有某种特殊的方法来初始化属性，这意味着默认的初始化程序不应再可用。
     */
    
}
