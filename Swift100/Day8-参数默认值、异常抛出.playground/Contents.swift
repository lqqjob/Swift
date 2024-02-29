import UIKit

/// 1、如何为参数提供默认值

func printTimesTables(for number:Int,end:Int = 12) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}
printTimesTables(for: 5, end: 20)
printTimesTables(for: 8)

var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)
characters.removeAll(keepingCapacity: true)//内存不变
print(characters.count)
characters.removeAll()//释放内存
print(characters.count)

/// 2、如何处理函数异常

enum PasswordError:Error {
    case short,obvious
}

func checkPassword(_ password:String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }
    if password == "12345" {
        throw PasswordError.obvious
    }
    if password.count < 8 {
        return "Ok"
    }else if password.count < 10 {
        return "Good"
    }else {
        return "Excellent"
    }
}

let string:String = "12345"
do {
    let result = try checkPassword(string) //通过强制我们在每个抛出函数之前使用try，我们明确承认代码的哪些部分可能会导致错误。
    print("Password rating:\(result)")
} catch {
    print("There was an error.")
}

do {
    let result = try checkPassword(string)
    print("Password rating: \(result)")

} catch PasswordError.short {
    print("I have the same combination on my luggage!")

} catch PasswordError.obvious {
    print("There was an error.")
}

/// 3、函数的总结


/*
 我们在前几章中介绍了很多关于函数的信息，所以让我们回顾一下：

 1、函数让我们通过雕刻代码块并给它一个名称来轻松重用代码。
 2、所有函数都以单词func开头，后跟函数的名称。该函数的主体包含在打开和关闭括号内。
 3、我们可以添加参数，使我们的函数更加灵活-用逗号分隔逐一列出：参数的名称，然后是冒号，然后是参数的类型。
 4、您可以使用自定义外部参数名称或使用下划线来禁用该参数的外部名称，从而控制这些参数名称的外部使用方式。
 5、如果您认为某些参数值会重复使用，您可以使它们具有默认值，这样您的函数编写的代码就会减少，并且默认情况下会做聪明的事情。
 6、如果您愿意，函数可以返回一个值，但如果您想从一个函数返回多个数据片段，则应使用元组。这些包含几个命名元素，但在某种程度上，它受到字典所没有的限制——您具体列出了每个元素及其类型。
 7、函数可以抛出错误：您创建一个枚举，定义您想要发生的错误，根据需要在函数中抛出这些错误，然后使用do、try和catch在调用站点处理它们。
 */
