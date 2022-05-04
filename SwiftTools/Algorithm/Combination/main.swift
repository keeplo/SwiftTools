//
//  main.swift
//  Algorithm/Combination
//
//  Created by Yongwoo Marco on 2022/05/04.
//

import Foundation

// MARK: - raywendelich/swift-algorithm-club/Combinatorics
// https://github.com/raywenderlich/swift-algorithm-club/tree/master/Combinatorics


// MARK: - Count
/*
func permuteCount(_ n: Int, _ k: Int) -> Int {
    return (0..<k).reduce(1) { $0 * (n - $1) }
}

func factorial(_ n: Int) -> Int {
    return (1...n).reduce(1) { $0 * $1 }
}

func combinateCount(_ n: Int, size k: Int) -> Int {
    return permuteCount(n, k) / factorial(k)
}
*/

func combinateCount(_ n: Int, size k: Int) -> Int {
    return (0..<k).reduce(1) { $0 * (n - $1) / ($1 + 1) }
}

print(combinateCount(28, size: 5))
// 98280

// MARK: - Generating 1 : size 크기의 부분집합
func combinateGenerater<T>(_ arr: ArraySlice<T>, size k: Int) -> [[T]] {
    if k == 0 {
        return [[]]
    }

    guard let first = arr.first else {
        return []
    }

    let head = [first]
    var subSets = combinateGenerater(arr, size: k - 1).map { head + $0 }
    subSets += combinateGenerater(arr.dropFirst(), size: k)

    return subSets
}

func combinateGenerater<T>(_ n: [T], size k: Int) -> [[T]] {
    return combinateGenerater(ArraySlice(n), size: k)
}

let numbers = [1,2,3]
print(combinateGenerater(numbers, size:2))
// [[1, 1], [1, 2], [1, 3], [2, 2], [2, 3], [3, 3]]

// MARK: - Generating 2 : 모든 부분 집합 구하기 except original
func allSubsets<T>(_ arr: [T]) -> [[T]] {
    var subsets: [[T]] = []
    for size in 1..<arr.count {
        subsets.append(contentsOf: combinateGenerater(arr, size: size))
    }
    return subsets
}

print(allSubsets(numbers))
// [[1], [2], [3], [1, 1], [1, 2], [1, 3], [2, 2], [2, 3], [3, 3]]

// MARK: - Generating 3 : 모든 부분 집합 구하기 except overlap
// https://stackoverflow.com/questions/50264717/get-all-possible-combination-of-items-in-array-without-duplicate-groups-in-swift/50265976

extension Array {
    var combinationsWithoutRepetition: [[Element]] {
        guard !isEmpty else { return [[]] }
        return Array(self[1...]).combinationsWithoutRepetition.flatMap { [$0, [self[0]] + $0] }
    }
}
    
print(numbers.combinationsWithoutRepetition)
// [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]
