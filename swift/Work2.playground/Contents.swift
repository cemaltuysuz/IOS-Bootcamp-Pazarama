import UIKit

/**
 Question 1:
 Write the function that returns the result after converting the degree entered as a parameter to fahrenheit.
 F = C x 1.8 + 32
 */
func calculateTheFahrenheit(celcius:Double) -> Double{
    return (celcius * 1.8)+32
}

/**
 Question 2:
 Write a function that calculates the perimeter of a rectangle whose sides are entered as parameters.
 */
func calculateThePerimeterOfRectangle(uk:Double,kk:Double) {
    var result = 2*(uk+kk)
}

/**
 Question 3:
 Write a function that calculates the factorial value of the number entered as a parameter and returns the result.
 */
func calculateFactorial(num:Int) -> Int{
    var result = 1
    for i in 1...num{
        result = result * i
    }
    return result
}

/**
 Question 4:
 Write a function that calculates the number of times the letter occurs in the word from the entered word and letter parameters.
 */
func calculateTheLetter(char:Character,str:String){
    var result = 0
    for i in str{
        if i == char {
            result += 1
        }
    }
    print(result)
}
/**
 Question 5:
 Write the function that calculates the sum of the interior angles of the shape according to the number of sides entered as a parameter and returns the result.
 - (n-2).180
 */
func calculateInteriorAngle (value:Int) -> Int{
    return (value-2)*180
}

/**
 Question 6:
 Write a function that calculates the salary according to the number of days entered as a parameter and returns the result.
 Rules:
 - (Hourly) Fee: 10 TL
 - (Hourly) Overtime wage
 - Working over 160 hours is considered overtime.
 */
func calculateSalary(numberOfDay:Int) -> Int{
    let total = 8 * numberOfDay // How many hours worked ?
    var result = 0
    if total > 160 {
        let overtimeWage = 20*(total-160) // Calculation of overtime hours.
        result = overtimeWage + (160 * 10)
    }else{
        result = 10*total
    }
    return result
}

/**
 Question 7:
 Write the function that returns the result by calculating the fee according to the quota amount entered as a parameter.
 - 500GB | 100 TL
 - After the quota is exceeded, every 1 GB is 4 TL
 */
func calculateTheInternetPrice(quantity:Int) -> Int{
    if quantity <= 50 {
        return 100
    }
    let extra = (quantity - 50) * 4
    return 100 + extra
}





