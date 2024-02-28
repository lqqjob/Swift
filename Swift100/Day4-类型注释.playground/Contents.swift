import UIKit

let surname:String = "Lasso"
var score: Int = 0
var scoreDouble:Double = 0

let playerName:String = "Roy" //String 持有文本
var luckyNumber:Int = 13 //Int 持有整型
var pi:Double = 3.141 //Double 持有浮点数
var isAuthenticated:Bool = true // Bool


var albums:[String] = ["Red","Fearless"] //数组
var user:[String:String] = ["id":"@twostraws"] //字典
var books:Set<String> = Set(["The Bluest Eye", "Foundation", "Girl, Woman, Other"])//集合
//空数组
var teams:[String] = [String]()
var cities:[String] = []
var clues = [String]()

//空字典
var user1:[String:String] = [String:String]()
var user2:[String:String] = [:]
var user3 = [String:String]()

enum UIStyle {
    case light,dark,system
}
var style = UIStyle.dark

let userName:String
//print(userName) 必须在使用之前赋值
userName = "@twoStraws"
//userName = "j" 只允许赋值一次
print(userName)

//let score:Int = "Zero" 非法的

