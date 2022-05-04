//
//  main.swift
//  Algorithm/Factorial
//
//  Created by Yongwoo Marco on 2022/05/04.
//

import Foundation

// MARK: - raywendelich/swift-algorithm-club/Combinatorics
// https://github.com/raywenderlich/swift-algorithm-club/tree/master/Combinatorics
/*
func factorial(_ n: Int) -> Int {
    var n = n
    var result = 1
    while n > 1 {
        result *= n
        n -= 1
    }
    return result
}
*/

// Marco's Style
func factorial(_ n: Int) -> Int {
    return (1...n).reduce(1) { $0 * $1 }
}

print(factorial(5)) // 120
