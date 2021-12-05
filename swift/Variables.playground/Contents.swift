import UIKit

// --- Variables

var studentName = "Cemal"
var studentAge = 22

var productId:Int = 1542
var productName:String = "Apple"
var productPrice:Double = 112.99

// --- Constants
let x = 50
let y = "Cemal"

// --- Type Convertions

// Numeric to numeric
var i = 42
var d = 12.50

var result1 = Double(i)
var result2 = Int(d)

print(result1)
print(result2)

// Numeric to Text

var str1 = String(i)
var str2 = String(d)
var str3 = "Converto to String \(i)"
print(str1)
print(str2)
print(str3)

// Text to Numeric

var text = "34"
var text2 = "34s"

if let numeric1 = Int(text){
    print("Succes")
}

if var numeric2 = Int(text2){
    print("success")
}

// --- Tuples

var people = ("John","Long")

var name = people.0
var surname = people.1

print("Name : \(name) | surname \(surname)")










