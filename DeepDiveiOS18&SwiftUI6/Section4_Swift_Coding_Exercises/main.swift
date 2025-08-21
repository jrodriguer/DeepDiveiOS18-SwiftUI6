//
//  DivisibleBy7.swift
//  DeepDiveiOS18&SwiftUI6
//
//  Created by Julio Rodriguez on 3/7/25.
//

import Foundation

func divisibleBy7(number: Int) -> String {
    var result = ""
    if number % 7 == 0 {
        result = "I am \(number) and I am divisible by 7."
    } else {
        result = "I am \(number) and I am not divisible by 7."
    }
    return result
}

print(divisibleBy7(number: 49))
print(divisibleBy7(number: -17))
print(divisibleBy7(number: -7))
print(divisibleBy7(number: 0))

func divisibleByD(number: Int, divisor: Int) -> String {
    var result = ""
    if number % divisor == 0 {
        result = "I am \(number) and I am divisible by \(divisor)."
    } else {
        result = "I am \(number) and I am not divisible by \(divisor)."
    }
    return result
}

print(divisibleByD(number: 12, divisor: 4))
print(divisibleByD(number: 12, divisor: 5))

func rangeDivisibleByD(number: Int, min: Int, max: Int) {
    for item in min..<max {
        let result = divisibleByD(number: number, divisor: item)
        print(result)
    }
}
rangeDivisibleByD(number: 8, min: 1, max: 4)

func powerFunc(base: Int, power: Int) -> Int? {
    var result: Int?
    
    if power < 0 {
        result = nil
    } else if base == 0 || base == 1 {
        result = base
    } else {
        var value = 1
        for _ in 0..<power {
            value *= base
        }
        result = value
    }
    return result
}

func displayPowerValue(base: Int, power: Int) {
    if let result = powerFunc(base: base, power: power) {
        print("\(base) raised to the power of \(power) is \(result)")
    } else {
        print("Power cannot be negative")
    }
}

displayPowerValue(base: 5, power: 3)
displayPowerValue(base: 0, power: 7)
displayPowerValue(base: -2, power: 5)
displayPowerValue(base: 1, power: 666)
displayPowerValue(base: 2, power: -5)

func sumOfPower(n: Int, power: Int) -> Int? {
    if n < 0 || power < 0 {
        return nil
    } else {
        var sum = 0
        for j in 1...n {
            if let value = powerFunc(base: j, power: power) {
                sum += value
            } else {
                return nil
            }
        }
        return sum
    }
}

func displaySumOfPower(base: Int, power: Int) {
    if let result = sumOfPower(n: base, power: power) {
        print("Sum of \(base) raised to the power of \(power) from 1 to \(base) is \(result)")
    } else {
        print("Please enter positive values for n and power")
    }
}

displaySumOfPower(base: 5, power: 3)
displayPowerValue(base: 0, power: 7)
displayPowerValue(base: -2, power: 5)
displayPowerValue(base: 2, power: -5)

func countOccurences(list: [Int], countMe: Int) -> (occurences: Int, msg: String) {
    var count = 0
    var message = ""
    for value in list {
        if countMe == value {
            count += 1
        }
    }
    
    if count == 0 {
        message = "\(countMe) is not on the list."
    } else {
        message = "\(countMe) appears \(count) time\(count > 1 ? "s" : "") on the list."
    }
    
    return (count, message)
}

print(countOccurences(list: [1001, 11, 10, -3, 11, -3], countMe: 1000))
print(countOccurences(list: [1001, 11, 10, -3, 11, -3], countMe: 11))
print(countOccurences(list: [1001, 11, 10, -3, 11, -3], countMe: 10))
print(countOccurences(list: [1001, 11, 10, -3, 11, -3], countMe: -3))

func repChar(n: Int, ch: String) -> String {
    var result = ""
    if n < 0 {
        return result
    }
    for _ in 0..<n {
        result += ch
    }
    return result
}

func rectCharStroken(n: Int, ch: String = "*") -> String {
    var result = ""
    if n == 1 {
        return ch
    }
    result += "\n\(repChar(n: n, ch: ch))\n"
    for _ in 0..<n-2 {
        result += "\(ch)\(repChar(n: n-2, ch: " "))\(ch)\n"
    }
    result += "\(repChar(n: n, ch: ch))"
    
    return result
}

print("Repeat char: \(repChar(n: 5, ch: "*"))")
print("Rect char stroken: \(rectCharStroken(n: 5))")
print("Rect char stroken: \(rectCharStroken(n: 1))")

func sumNPower(n: Int, power: Int) -> Double {
    var result = 0.0
    for i in 0...n {
        result += pow(Double(i), Double(power))
    }
    
    return result
}

func triangleNumbersSquared(n: Int) -> Double {
    let triangleNumber = sumNPower(n: n, power: 1)
    return triangleNumber*triangleNumber
}

func sumOfCubes(n: Int) -> Double {
    return sumNPower(n: n, power: 3)
}

for n in 1..<10 {
    // Illustration:
    //
    // (1+2+3+4)ˆ2 = 1ˆ3 + 2ˆ3 + 3ˆ3 + 4ˆ3
    // Conjecture:
    // (1+2+3+4...n)ˆ2 = 1ˆ3 + 2ˆ3 + 3ˆ3 + 4ˆ3 + ... + nˆ3
    
    print(triangleNumbersSquared(n: n))
    print(sumOfCubes(n: n))
    print("")
}

func myCosine(_ x: Double, threshold: Double = pow(10.0, -6.0)) -> Double {
    var result = 0.0
    var term = 1.0
    var n = 0
    
    while abs(term) > threshold {
        result += term
        n += 1
        // next term: (-1)^n * x^(2n) / (2n)!
        term *= -(x * x) / Double((2 * n - 1) * (2 * n))
    }

    return result
}

let m = 18.0
for i in stride(from: 0, to: m, by: 1) {
    let angle: Double = (2 * Double.pi * i) / m
    print("cos(\(angle)) = \(cos(angle))")
    print("myCosine(\(angle)) = \(myCosine(angle))")
    print("")
}

// MARK: Implement the natural logarithm of x using the MacLaurin series of log(1+x).
//
// ln(1 + x) = x - x^2 / 2 + x^3 / 3 - x^4 / 4 + x^5 / 5 ... + (-1)^n+1 * x / n + ...
//
//
// Therefore if we substitute x-1 into this formula we will obtain ln(x).
//
// ln(x) = ln(1 + (x-1)) = (x-1) - (x-1)^2 / 2 + (x-1)^3 / 3 - (x-1)^4 / 4 + (x-1)^5 / 5 ... + (-1)^n+1 * (x-1) / n + ...
//
// For example if we want ln(exp(1.0)) then calculate y=e-1 and then substitute y:
// y - y^2 / 2 + y^3 / 3 - y^4 / 4 + y^5 / 5 ... + (-1)^n+1 * y / n + ...
//
// where y = x - 1.
// Note that if x = 0 then return -inf
// If x < 0 return nan
//
//

print(log(0.0)) // -Double.infinity
print(log(-13.0))   // Double.nan

func myLog( _ x: Double, threshold: Double = pow(10,-6)) -> Double {
    return 0
}

func compareLogarithms(x: Double) {
    print("log(\(x)) = \(log(x))")
    print("myLog(\(x)) = \(myLog(x))")
    print("")
}

// Test values
for x in stride(from: -10.0, to: 0.0, by: 1.0) {
    compareLogarithms(x: exp(x))
}

for x in [0.0001, 0.01, 0.73, 1] {
    compareLogarithms(x: 0.5)
}

/*
 EXPECTED OUTPUT:
 
 log(4.5399929762484854e-05) = -10.0
 myLog(4.5399929762484854e-05) = -9.982919105377894

 log(0.00012340980408667956) = -9.0
 myLog(0.00012340980408667956) = -8.99344002448517

 log(0.00033546262790251185) = -8.0
 myLog(0.00033546262790251185) = -7.997510634031645

 log(0.0009118819655545162) = -7.0
 myLog(0.0009118819655545162) = -6.999062472003188

 log(0.0024787521766663585) = -6.0
 myLog(0.0024787521766663585) = -5.9996499525031615

 log(0.006737946999085467) = -5.0
 myLog(0.006737946999085467) = -4.999869629885133

 log(0.01831563888873418) = -4.0
 myLog(0.01831563888873418) = -3.9999524866873672

 log(0.049787068367863944) = -3.0
 myLog(0.049787068367863944) = -2.9999828108274054

 log(0.1353352832366127) = -2.0
 myLog(0.1353352832366127) = -1.9999949191809372

 log(0.36787944117144233) = -1.0
 myLog(0.36787944117144233) = -0.9999989285523087

 log(0.5) = -0.6931471805599453
 myLog(0.5) = -0.6931463282650033

 log(0.5) = -0.6931471805599453
 myLog(0.5) = -0.6931463282650033

 log(0.5) = -0.6931471805599453
 myLog(0.5) = -0.6931463282650033

 log(0.5) = -0.6931471805599453
 myLog(0.5) = -0.6931463282650033
 
 */

// MARK: Design a Swift function named printSorted0to100() that outputs the names of numbers from 0 to 100 arranged alphabetically.

func numberToName(n: Int) -> String {
    let numbers: [Int: String] = [
        0: "zero",
        1: "one",
        2: "two",
        3: "three",
        4: "four",
        5: "five",
        6: "six",
        7: "seven",
        8: "eight",
        9: "nine",
        10: "ten",
        11: "eleven",
        12: "twelve",
        13: "thirteen",
        14: "fourteen",
        15: "fifteen",
        16: "sixteen",
        17: "seventeen",
        18: "eigtheen",
        19: "nineteen",
        20: "twelve",
        30: "thirty",
        40: "forty",
        50: "fifty",
        60: "sixty",
        70: "seventy",
        80: "eighty",
        90: "ninety",
        100: "one hundred"
    ]
    if n < 20 || n % 10 == 0 {
        return numbers[n] ?? ""
    } else {
        return (numbers[(n/10)*10] ?? "") + "-" + (numbers[n%10] ?? "")
    }
}

func printSorted0to100() {
    var names: [String] = []
    for i in 0...100 {
        names.append(numberToName(n: i))
    }
    for name in names {
        print(name)
    }
}

print("Names of numbers from 0 to 100 arranged alphabetically:")
printSorted0to100()
