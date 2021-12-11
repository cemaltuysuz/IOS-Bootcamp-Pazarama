import UIKit

class Car{
    var color:String?
    var speed:Int?
    var isRun:Bool?
    
    init() { // empty constructor
        print("Created New object")
    }
    init(color:String,speed:Int,isRun:Bool) { // constructor
        self.color = color
        self.speed = speed
        self.isRun = isRun
    }
    
    func write(){
        print("Color : \(bmw.color!)")
        print("Speed : \(bmw.speed!)")
        print("Execute Status : \(bmw.isRun!)")
    }
    
    func run(){
        self.isRun = true
    }
    func stop(){
        self.isRun = false
    }
}

var bmw = Car()

// assigment value
bmw.color = "Red"
bmw.speed = 100
bmw.isRun = true

// Read Values
print("Color : \(bmw.color!)")
print("Speed : \(bmw.speed!)")
print("Execute Status : \(bmw.isRun!)")

bmw.write()

class Functions{
    func sayHello(){
        let result = "Hello ahmet !"
        print(result)
    }
    func sayHello1() ->String {
        return "Hello ahmet !"
    }
    func sayHello2(name:String){
        print(name)
    }
    
    func addition (){
        let result = 10 + 5
        print(result)
        }
    
    func addition2 () ->Int{
            let result = 10 + 5
            return result
        }
    
    func addition1 (num1:Int,num2:Int)->Int{
        return num1+num2
    }
}

var f = Functions()

f.sayHello()
print(f.sayHello1())
f.sayHello2(name: "Hello ahmet !")

f.addition()
print(f.addition2())
print(f.addition1(num1: 5, num2: 10))

// Overloading

class Calculator{
    func addition(num1:Int,num2:Int){
        print("Result : \(num1+num2)")
    }
    func addition(num1:Double,num2:Int){
            print("Result : \(num1+Double(num2))")
    }
    func addition(num1:Int,num2:Double){
                print("Result : \(Double(num1)+num2)")
    }
    func addition(num1:Int,num2:Int,message:String){
            print("\(message) : \(num1+num2)")
        }
}

var c = Calculator()
c.addition(num1: 100, num2: 200, message: "Cemal")

// ---- Enum

enum GlassSize{
    case small
    case middle
    case large
}

func calculatePrice(size:GlassSize,num:Int){
    switch size {
    case .small:
        print("Price : \(num*10)")
    case .middle:
        print("Price : \(num*20)")
    case .large:
        print("Price : \(num*30)")
  }
}

calculatePrice(size: .large, num: 20)


