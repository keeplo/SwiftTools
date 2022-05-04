//
//  BinaryTreeArray.swift
//  Tree
//
//  Created by Yongwoo Marco on 2021/05/03.
//

struct BinaryTreeArray {
    static var tree = [Int?]()
    
    static func parent(current: Int) -> Int? {
        return current > 0 ? (current - 1) / 2 : nil
    }
    static func first(current: Int) -> Int? {
        return current*2+1 > tree.count ? nil : current*2+1
    }
    static func second(current: Int) -> Int? {
        return (current+1)*2 > tree.count ? nil : (current+1)*2
    }
}
