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


