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
