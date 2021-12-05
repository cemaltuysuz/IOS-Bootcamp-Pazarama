import UIKit

// --- comparison operators

var s1 = 60
var s2 = 50

var y1 = 70
var y2 = 80

print(s1 == s1) // false
print(s1 != s2) // true
print(s1 > s2) // true
print(s1 >= s2) // true
print(s1 < s2) // false
print(s1 <= s2) // false

// If Usage

var num1 = 20
var num2 = 10

if num1 > num2 {
    print("Num 1 > num 2")
}else{
    print("Num2 > Num1")
}

if num1 > num2 || num1 < num2 {
    print("success")
}

num1 == num2 ? print("Num 1 == num 2") : print("num1 != num2")

// Switch Usage

var num3 = 20

switch num3 {
case 20:
    print("Num3 = 20")
    break
case 10:
    print("Num3 = 10")
    break
default:
    print("Def value")
}





