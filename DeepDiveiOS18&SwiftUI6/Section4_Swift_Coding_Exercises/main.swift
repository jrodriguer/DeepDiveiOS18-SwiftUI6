//
//  DivisibleBy7.swift
//  DeepDiveiOS18&SwiftUI6
//
//  Created by Julio Rodriguez on 3/7/25.
//

import Foundation

/*
 1. Create a function

 func divisibleBy7( number: Int) -> String

 In case the number is divisible by 7, the program should return

 I am <number> and I am divisible by 7
 ---
 Example 1. For divisibleBy7( number: 49) returns the string: "I am 49 and I am divisible by 7."

 Example 2. For divisibleBy7( number: -17)returns the string: "I am -17 and I am not divisible by 7."
 */
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

/*
Create a function
 func divisibleByD( number: Int, divisor: Int) -> String {
     // TODO
 }
 where
 Example 1. For divisibleByD( number: 12, divisor: 4) returns the string:
 "I am 12 and I am divisible by 4."

 Example 2. For divisibleByD( number: 12, divisor: 5) returns the string:
 "I am 12 and I am not divisible by 5."
 */
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

/*
 Create a function
 func rangeDivisibleByD( number: Int, min: Int, max: Int)
 
 Applies divisibleByD for values of divisor from min to max-1 (i.e. do not include max) and prints the string in each iteration. The function rangeDivisibleByD does not return any values
 */

// Create a function
func rangeDivisibleByD(number: Int, min: Int, max: Int) {
    for item in min..<max {
        let result = divisibleByD(number: number, divisor: item)
        print(result)
    }
}
rangeDivisibleByD(number: 8, min: 1, max: 4)
/*
 Example. For rangeDivisibleByD( number: 8, min: 1, max: 4)
 prints
 I am 8 and I am divisible by 1.
 I am 8 and I am divisible by 2.
 I am 8 and I am not divisible by 3.
 
 */

func powerFunc(base: Int, power: Int) -> Int? {
//    guard power > 0 else { return nil }
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
