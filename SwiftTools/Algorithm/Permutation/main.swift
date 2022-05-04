//
//  main.swift
//  Algorithm/Permutation
//
//  Created by Yongwoo Marco on 2022/05/04.
//

import Foundation

// MARK: - raywendelich/swift-algorithm-club/Combinatorics
// https://github.com/raywenderlich/swift-algorithm-club/tree/master/Combinatorics

// MARK: - Count
/*
func permutations(_ n: Int, _ k: Int) -> Int {
    var n = n
    var answer = n
    for _ in 1..<k {
        n -= 1
        answer *= n
    }
    return answer
}
*/

func permuteCount(_ n: Int, _ k: Int) -> Int {
    return (0..<k).reduce(1) { $0 * (n - $1) }
}

print(permuteCount(5, 3))  // returns 60
print(permuteCount(50, 6))  // returns 11441304000
print(permuteCount(9, 4))   // returns 3024


// MARK: - Generating
/*
func permuteWirth<T>(_ a: [T], _ n: Int) {
    if n == 0 {
        print(a)   // display the current permutation
    } else {
        var a = a
        permuteWirth(a, n - 1)
        for i in 0..<n {
            a.swapAt(i, n)
            permuteWirth(a, n - 1)
            a.swapAt(i, n)
        }
    }
}
*/

let letters = ["a", "b", "c"]
//permuteWirth(letters, letters.count - 1)

// Marco's Style
var result = [[String]]()

func permuteGenerater<T>(_ a: [T], _ n: Int) {
    if n == 0 {
        result.append(a as? [String] ?? [])
    } else {
        var a = a
        permuteGenerater(a, n - 1)
        for i in 0..<n {
            a.swapAt(i, n)
            permuteGenerater(a, n - 1)
            a.swapAt(i, n)
        }
    }
}

permuteGenerater(letters, letters.count - 1)
print(result)

// [["a", "b", "c"],
//  ["b", "a", "c"],
//  ["c", "b", "a"],
//  ["b", "c", "a"],
//  ["a", "c", "b"],
//  ["c", "a", "b"]]
