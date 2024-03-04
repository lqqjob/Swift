import UIKit

/// 1、如何创建类

/*
雷和结构体的相同点：
 1、可以添加属性和方法，包括属性观察器和访问控制
 2、可以自定义初始化方法
 
 雷和结构体的不相同点：
 1、类有继承
 2、类没有默认的初始哈方法
 3、当您复制类的实例时，两个副本共享相同的数据 - 如果您更改一个副本，另一个副本也会更改
 4、当类实例的最终副本被销毁时，Swift 可以选择运行一个称为deinitializer的特殊函数
 5、即使您将类设为常量，只要它们是变量，您仍然可以更改其属性
 */

class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")

        }
    }
}
var newGame = Game()
newGame.score += 10


/// 2、如何让一个类继承另一个类

class Employee {
    let hours: Int
    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummery() {
        print("I work \(hours) hours a day.")
    }
}

class Developer:Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
    
    override func printSummery() {//重写方法
        print("I'm a developer who will sometimes work \(hours) hours a day, but other times spend hours arguing about whether code should be indented using tabs or spaces.")

    }
}

class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
}

let robert = Developer(hours: 9)
let joseph = Manager(hours: 10)
robert.work()
joseph.work()
robert.printSummery()
joseph.printSummery()
/*
 如果您确定您的类不应支持继承，则可以将其标记为final.
 */


/// 3、如何为类添加初始化方法

class Vehicle {
    let isElectric:Bool
    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertible: Bool
//    init(isElectric: Bool) {
//        self.isConvertible = isElectric
//    }
    
     init(isElectric: Bool,isConvertible: Bool) {
         self.isConvertible = isConvertible
         super.init(isElectric: isElectric)
    }
}



/// 4、类的复制

class User {
    var userName = "Anonymous"
    
    func copy() -> User {
        let user = User()
        user.userName = userName
        return user
    }
}

var user = User()
var user1 = user

user1.userName = "Taylor"
print(user.userName)
print(user1.userName)//这将为两者打印“Taylor”——即使我们只更改了其中一个实例，另一个实例也发生了变化

/// 5、析构方法

class User1 {
    let id:Int
    init(id: Int) {
        self.id = id
    }
    deinit {
        print("User \(id): I'm dead!")
    }
}

for i in 1...3 {
    let user = User1(id: i)
}

var users = [User1]()

for i in 4...6 {
    let user = User1(id: i)
    users.append(user)
}
users.removeAll()

/// 6、如何使用类内的变量

class User2 {
    var name = "Paul"
}
let user3 = User2()
user3.name = "Taylor" //类内部的数据已经改变，但是类实例本身没有改变

/*
 常量实例、常量属性——始终指向同一用户的路标，该用户始终具有相同的名称。
 常量实例，可变属性——始终指向同一用户的路标，但他们的名称可以更改。
 变量实例，常量属性——一个可以指向不同用户的路标，但他们的名字永远不会改变。
 变量实例、变量属性——一个可以指向不同用户的路标，这些用户也可以更改他们的名字。
 */

/// 7、类的总结

/*
 类与结构有很多共同点，包括具有属性和方法的能力，但类和结构之间有五个关键区别。
    首先，类可以从其他类继承，这意味着它们可以访问其父类的属性和方法。如果需要，您可以选择覆盖子类中的方法，或者将一个类标记为final阻止其他子类化它。
    其次，Swift 不会为类生成成员初始化程序，因此您需要自己生成。如果子类有自己的初始值设定项，则它必须始终在某个时刻调用父类的初始值设定项。
    第三，如果您创建一个类实例然后获取它的副本，所有这些副本都指向同一个实例。这意味着更改其中一个副本中的某些数据会更改所有数据。
    第四，类可以具有在一个实例的最后一个副本被销毁时运行的反初始化程序。
    最后，无论实例本身是否被创建为变量，类实例内的变量属性都可以更改。
 */

