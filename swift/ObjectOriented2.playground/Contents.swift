import UIKit

class Home{
    var windowCount:Int?
    init(windowCount:Int) {
        self.windowCount = windowCount
    }
}

class Palace : Home{
    var towerCount:Int?
    init(towerCount:Int,windowCount:Int) {
        self.towerCount = towerCount
        super.init(windowCount: windowCount)
    }
}

class Villa : Home{
    var garage:Bool?
    init(garage:Bool,windowCount:Int) {
        self.garage = garage
        super.init(windowCount: windowCount)
    }
}

var topkapiPalace = Palace(towerCount: 30, windowCount: 100)
var villa = Villa(garage: true, windowCount: 30)

print(topkapiPalace.towerCount!)
print(topkapiPalace.windowCount!)

print(villa.garage!)
print(villa.windowCount!)

class Animal{
    func speak(){
        print("I can't..")
    }
}

class Mammal : Animal{
    
}
class Cat :Mammal{
    override func speak() {
        print("Miyavv")
    }
}
class Dog : Mammal{
    override func speak() {
        print("Hav hav")
    }
}

print(" --- Animal Result : ---")
var animal  = Animal()
animal.speak()
print(" --- Mammal Result : ---")
var mammal = Mammal()
mammal.speak()
print(" --- Cat Result : ---")
var cat = Cat()
cat.speak()
print(" --- Dog Result : ---")
var dog = Dog()
dog.speak()

// Is usage
let p1 = Palace(towerCount: 4, windowCount: 40)
if p1 is Palace{
    print("p1 is Palace.")
}

// UpCasting
var home:Home = Palace(towerCount: 3, windowCount: 30) as Home

// downCasting
var v = Home(windowCount: 4) as? Villa

// --- Protocol
protocol Protocol1{
    var variable:Int{get set}
    func function1 ()
    func function2 () -> String
}

class ClassA : Protocol1 {
    var variable: Int = 0
    
    func function1() {
        print("Function 1 is run")
    }
    
    func function2() -> String {
        return "Function 2 is run"
    }
}

var classExm = ClassA()
classExm.function1()
print(classExm.function2())

// --- Extension
extension Int {
    func multiplication(num:Int) -> Int {
        return self * num
    }
}

// --- Closure
let sample = {
    print("this structure like function")
}
sample()





