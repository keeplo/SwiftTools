//
//  File.swift
//  Tree
//
//  Created by Yongwoo Marco on 2021/04/30.
//

import Foundation

class BinaryTreeNode<T: Equatable>: Node<T> {
    var leftChild: Node<T>?
    var rightChild: Node<T>?
    
    override init(value: T) {
        super.init(value: value)
    }
    
    override func add(child: Node<T>) {
        if leftChild == nil {
            leftChild = child
            child.parent = self
        } else if rightChild == nil {
            rightChild = child
            child.parent = self
        } else {
            print("This Node has Children")
        }
    }
    
    override func search(value: T) -> BinaryTreeNode<T>? {
        if value == self.value {
            return self
        }
        
        if let found = leftChild?.search(value: value) as? BinaryTreeNode<T> {
            return found
        } else if let found = rightChild?.search(value: value)  as? BinaryTreeNode<T> {
            return found
        }
        
        return nil
    }
}

