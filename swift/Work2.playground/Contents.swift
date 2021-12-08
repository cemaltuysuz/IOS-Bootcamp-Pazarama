import UIKit

/**
 Question 1:
 Write the function that returns the result after converting the degree entered as a parameter to fahrenheit.
 F = C x 1.8 + 32
 */
func fahrenheit(celcius:Double) -> Double{
    return (celcius * 1.8)+32
}

/**
 Question 2:
 Write a function that calculates the perimeter of a rectangle whose sides are entered as parameters.
 */
func rectangle(uk:Double,kk:Double) {
    var result = 2*(uk+kk)
}

/**
 Question 3:
 Write a function that calculates the factorial value of the number entered as a parameter and returns the result.
 */
func factorial(num:Int) -> Int{
    var result = 1
    for i in 1...num{
        result = result * i
    }
    return result
}

print(factorial(num: 4))

/**
 Question 4:
 Write a function that calculates the number of times the letter occurs in the word from the entered word and letter parameters.
 */
func letter(char:Character,str:String){
    var result = 0
    for i in str{
        if i == char {
            result += 1
        }
    }
    print(result)
}




