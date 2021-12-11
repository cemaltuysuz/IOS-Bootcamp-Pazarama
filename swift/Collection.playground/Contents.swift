import UIKit

// --- Arrays
var numerics = [Int]()
var decimalNumbers = [10.0,20.0,30.0]
var numbers = [Int](repeating: 0, count: 3)

var fruits = [String]()
fruits.append("Apple")
fruits.append("Banana")
fruits.append("Strawberry")
print(fruits)

fruits[0] = "Yellow Apple"
print(fruits)

fruits.insert("Apricot", at: 1)
print(fruits)

print(fruits.isEmpty)
print(fruits.count)
print(fruits.first!)
print(fruits.last!)
print(fruits.contains("Banana"))

fruits.reverse()
print(fruits)

fruits.sort()
print(fruits)

for fruit in fruits {
    print("Result : \(fruit)")
}

for (indeks,fruit) in fruits.enumerated(){
    print("\(indeks) -> \(fruit)")
}

// filter

var numbers2 = [1,2,3,4,5,6,7,8,9]

var result1 = numbers2.filter({$0>7})
print(result1)

var result2 = numbers2.filter({$0>3 && $0<7})
print(result2)

class Student {
    var id:Int?
    var name:String?
    var className:String?
    
    init(id:Int,name:String,className:String) {
        self.id = id
        self.name = name
        self.className = className
    }
}

var st1 = Student(id: 1, name: "Cemal", className: "12A")
var st2 = Student(id: 2, name: "Kadir", className: "12B")
var st3 = Student(id: 3, name: "Murat", className: "12C")

var students = [Student]()
students.append(st1)
students.append(st2)
students.append(st3)
// Fiter with Instance
var s1 = students.filter({$0.id!>2})
for i in s1{
    print(i.name!)
}
// Sort with Instance (by id)
var s2  = students.sorted(by: {$0.id!>$1.id!})
for i in s1{
    print(i.name!)
}
// Sort with Instance (by name)
var s3  = students.sorted(by: {$0.name!>$1.name!})
for i in s1{
    print(i.name!)
}






