import UIKit

/// 1、如何使用访问控制来限制对内部数据的访问

struct BankAccount {
   private var funds = 0
    mutating  func deposit(amount:Int) {
        funds += amount
    }
    
    mutating func withdraw(amount:Int) -> Bool{
        if funds >= amount {
            funds -= amount
            return true
        }else {
            return false
        }
    }
}

var account = BankAccount()
account.deposit(amount: 100)
let success = account.withdraw(amount: 200)

if success {
    
}else {
    
}

/*
 用于private“不要让结构体之外的任何东西使用它”。
 用于fileprivate“不要让当前文件之外的任何内容使用它”。
 用于public“让任何人、任何地方都可以使用它”。
 有一个额外的选项有时对学习者很有用，那就是：private(set)。这意味着“让任何人读取这个属性，但只让我的方法写入它
 */


/// 2、静态属性和方法

struct School {
    static var studentCount = 0
    static func add(student:String) { // 不用加 mutating
        print("\(student) joined the school.")
        studentCount += 1
    }
}


/// 3、struct 总结

/*
 1、struct您可以通过编写、为其命名，然后将结构体的代码放在大括号内来创建自己的结构体。
 2、结构可以具有变量和常量（称为属性）和函数（称为方法）
 3、如果方法尝试修改其结构的属性，则必须将其标记为mutating.
 4、您可以将属性存储在内存中，或者创建计算属性，以便在每次访问它们时计算一个值。
 5、我们可以将属性观察器附加didSet到willSet结构体内部的属性，这在我们需要确保属性更改时始终执行某些代码时很有帮助。
 6、初始化器有点像专门的函数，Swift 使用其属性名称为所有结构生成一个初始化器。
 7、如果需要，您可以创建自己的自定义初始值设定项，但必须始终确保结构中的所有属性在初始值设定项完成时以及调用任何其他方法之前都具有值。
 8、我们可以根据需要使用访问权限将任何属性和方法标记为外部可用或不可用。
 9、可以将属性或方法直接附加到结构，因此您可以使用它们而无需创建结构的实例。
 */


