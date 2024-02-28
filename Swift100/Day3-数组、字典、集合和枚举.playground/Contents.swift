import UIKit
/*
 ssh-keygen -R github.com
 */

/// 1、如何在数组中存储有序数据

var beatles = ["John","Paul","Georhe","Ringo"]
let numbers = [1,2,3]
var temperatures = [25.3,28.2,26.4]
print(beatles[0])
print(numbers[1])
print(temperatures[2])

beatles.append("Ardian")//可变数组可以修改
beatles.append("Allen")
beatles.append("Adrian")
beatles.append("Novall")
beatles.append("Vivian")
//temperatures.append("Chris") 类型不匹配 不允许

let firstBeatles = beatles[0]
let firstNumber = numbers[0]
//let notAllowed = firstNumber + firstBeatles 类型不同

var scores = Array<Int>()
scores.append(100)
scores.append(80)
scores.append(85)
print(scores[1])

var albums = Array<String>()
albums.append("Folklore")
albums.append("Fearless")
albums.append("Red")

var otherAlbums = [String]()
otherAlbums.append("Folklore")
otherAlbums.append("Fearless")
otherAlbums.append("Red")

var albums1 = ["Folklore"]
albums1.append("Fearless")
albums1.append("Res")

print(albums.count)

var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)
characters.remove(at: 2)
print(characters.count)
characters.removeAll()
print(characters)

let bondMovies = ["Casino Royale", "Spectre", "No Time To Die"]
print(bondMovies.contains("Frozen"))

let cities = ["London", "Tokyo", "Rome", "Budapest"]
print(cities.sorted())//排序，原数组不变

let presidents = ["Bush", "Obama", "Trump", "Biden"]
let reversedPresidents = presidents.reversed() //这里不是简单的数组
print(reversedPresidents)

/// 2、如何在字典中存储和查找数据

let employee = [
    "name":"Taylor",
    "job":"Singer",
    "location":"Nash"
]
print(employee["name"])
print(employee["job",default: ""])
print(employee["location",default: ""])

let hasGraduated = [
    "Eric": false,
    "Maeve": true,
    "Otis": false,
]

let olympics = [
    2012: "London",
    2016: "Rio de Janeiro",
    2021: "Tokyo"
]
print(olympics[2012,default: "Unknown"])


var heights = [String:Int]() //显示创建一个字典
heights["Yao Ming"] = 229
heights["Shaquille O'Neal"] = 216
heights["LeBron James"] = 206

var archEnemies = [String: String]()
archEnemies["Batman"] = "The Joker"
archEnemies["Superman"] = "Lex Luthor"
archEnemies["Batman"] = "Penguin"

print(archEnemies.count)
print(archEnemies.removeAll())

/// 3、如何使用集合进行快速数据查找

let people = Set(["Denzel Washington", "Tom Cruise", "Nicolas Cage", "Samuel L Jackson"])//自动删除任何重复的值
print(people)//顺序可能跟原始的一致，可能不一致

var mutablePeople = Set<String>()
mutablePeople.insert("Denzel Washington")
mutablePeople.insert("Tom Cruise")
mutablePeople.insert("Nicolas Cage")
mutablePeople.insert("Samuel L Jackson")

print(mutablePeople.contains("Samuel L Jackson"))

/*
 集合与数组的区别：
 
 首先，不存储重复项有时正是您想要的。
 其次，集合不是按照您指定的确切顺序存储项目，而是按照高度优化的顺序存储项目，这样可以非常快速地定位项目。
 
 相比之下，调用contains()一组运行速度如此之快，以至于您很难对其进行有意义的测量。哎呀，即使集合中有 100 万个项目，甚至 1000 万个项目，它仍然会立即运行，而数组可能需要几分钟或更长时间才能完成相同的工作。

 大多数时候，您会发现自己使用数组而不是集合，但有时（只是有时），您会发现集合正是解决特定问题的正确选择，并且它将使原本缓慢的代码立即运行根本不。
 */

/// 3、如何创建和使用枚举

enum WeekDay {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
}

enum WeekDay1 {
    case monday,tuesday,wednesday,thurthday,friday
}

var day = WeekDay.monday
day = WeekDay.tuesday;
day = WeekDay.friday

var day1 = WeekDay1.monday //必须始终是某种Weekday.
day1 = .tuesday
day1 = .friday






