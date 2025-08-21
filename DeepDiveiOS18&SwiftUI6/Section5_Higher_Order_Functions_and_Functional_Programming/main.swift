//
//  main.swift
//  DeepDiveiOS18&SwiftUI6
//
//  Created by Julio Rodriguez on 21/8/25.
//

import Foundation

func filterExample() {
    let numbers: [Int] = [1, 2, 3, 4, 5]
    let evenNumbers = numbers.filter { $0.isMultiple(of: 2) }
    print(evenNumbers)
}

func mapExample() {
    let numbers: [Int] = [1, 2, 3, 4, 5]
    let doubledNumbers = numbers.map { $0 * 2 }
    print(doubledNumbers)
    
    var doubleNumbers2: [Int] = []
    for number in numbers {
        doubleNumbers2.append(number*number)
    }
    print(doubleNumbers2)
}

func sortedExample() {
    let animals: [String] = ["zebra", "elephant", "giraffe", "lion", "tiger"]
    let sortedNames = animals
        .map { $0.count > 10 ? String($0.reversed()) : $0 }
        .sorted(by: >)
        .map { $0.uppercased().replacingOccurrences(of: "a", with: "@") }
        
    print(sortedNames)
}

sortedExample( )
