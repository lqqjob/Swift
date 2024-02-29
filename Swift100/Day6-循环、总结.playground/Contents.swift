import UIKit

/// 1、如何使用for循环重复工作

let platforms:[String] = ["iOS","macOS","tvOS","watchOS"]
for os in platforms {
    print("Swift works great on\(os)")
}

for i in 1...12 {//该1...12部分是range，表示“1 到 12 之间的所有整数，以及 1 和 12 本身”。
    print("5 x \(i) is \(5 * i)")
}

for i in 1 ..< 5 {//它计数到但不包括最终数字：..<，..<对于处理数组确实很有帮助，我们从 0 开始计数，并且经常想要计数到但不包括数组中的项目数。
    print("Counting 1 up to 5:\(i)")
}

print(platforms[0]);
print(platforms[1...3])
print(platforms[1...])
//如果您想继续了解有关 Swift 范围的更多信息，您应该查看 Antoine van der Lee 关于该主题的文章：https ://www.avanderlee.com/swift/ranges-explained/

var lyric = "Haters gonna"
for _ in 1...5 { //不需要变量时，您可以用下划线替换循环变量，不会创建临时变量
    lyric += " hate"
}

/// 2、如何使用 while 循环重复工作

var countDown = 10
while countDown > 0 {
    print("\(countDown)...")
    countDown -= 1
}

var roll = 0
while roll != 20 {//当不知道循环次数的时候，while比较有用
    roll = Int.random(in: 1...20)
    print("I rolled a \(roll)")
}

/// 3、如何使用break 和 continue 跳过循环项

let filenames = ["me.jpg", "work.txt", "sophie.jpg", "logo.psd"]
for filename in filenames {
    if filename.hasSuffix(".jpg") == false {
        continue
    }
    print("Found picture:\(filename)")
}

let number1 = 4
let number2 = 14
var mutiples = [Int]()

for i in 1...100_000 {
    if i.isMultiple(of: number1) && i.isMultiple(of: number2) {
        mutiples.append(i)
        if mutiples.count == 10 {
            break
        }
    }
}

//因此，continue当您想要跳过当前循环迭代的其余部分时使用，break当您想要跳过所有剩余的循环迭代时使用。


let options:[String] = ["up", "down", "left", "right"]
let secretCombination = ["up", "up", "right"]
outerLoop:for option1 in options {//标签语句 
    for option2 in options {
        for option3 in options {
            print("In loop")
            let attempt = [option1,option2,option3]
            if attempt == secretCombination {
                print("The combination is \(attempt)!")
                break outerLoop
            }
        }
    }
}

/// 3、摘要：条件和循环

/*
 1、我们使用if语句来检查条件是否为真。您可以传递任何您想要的条件，但最终它必须归结为布尔值。
 2、如果需要，您可以添加一个else块和/或多个else if块来检查其他条件。Swift 按顺序执行这些。
 3、您可以使用 来组合条件||，这意味着如果任一子条件为真，则整个&&条件为真；或者 ，这意味着如果两个子条件都为真，则整个条件为真。
 4、如果您多次重复相同类型的检查，则可以使用switch语句代替。这些必须始终是详尽的，这可能意味着添加默认情况。
 5、如果您的案例之一switch使用fallthrough，则意味着 Swift 将随后执行以下案例。这并不常用。
 6、三元条件运算符让我们检查 WTF：What、True、False。虽然一开始读起来有点困难，但你会发现它在 SwiftUI 中被大量使用。
 7、for循环让我们可以循环数组、集合、字典和范围。您可以将项目分配给循环变量并在循环内使用它，也可以使用下划线 ,_来忽略循环变量。
 8、while循环让我们可以制作自定义循环，这些循环将继续运行，直到条件变为 false。
 9、我们可以分别使用continue或break跳过部分或全部循环项。
 */
