import UIKit

func detectPerson(name:String){
    guard name == "Richard" else {
        print("Unknow person.")
        return
    }
    print("Hello Richard !")
}

detectPerson(name: "Richard")
detectPerson(name: "Richardx")

enum Exceptions : Error{
    case MathError
    
}
func divide(num1:Double,num2:Double) throws -> Double{
    if num1 == 0 || num2 == 0 {
        throw Exceptions.MathError
    }
    return num1/num2
}

do{
    let result = try divide(num1: 10, num2: 0)
    print(result)
}catch Exceptions.MathError{
    print("Num can not divide to the zero.")
}
