//
//  BinarySearchTree.swift
//  Tree
//
//  Created by Yongwoo Marco on 2021/05/05.
//

// leftChild < root < rightChild
class BinarySearchTree<T: Comparable > {
    var value: T
    var parent: BinarySearchTree?
    var leftChild: BinarySearchTree?
    var rightChild: BinarySearchTree?
    
    init(value: T) {
        self.value = value
    }
    
    var isRoot: Bool {
        return parent == nil
    }
    
    var isLeaf: Bool {
        return leftChild == nil && rightChild == nil
    }
    
    var isLeftChild: Bool {
        return parent?.leftChild === self
    }
    
    var hasBothChildren: Bool {
        return leftChild != nil && rightChild != nil
    }
    
    var count: Int {
        return (leftChild?.count ?? 0) + 1 + (rightChild?.count ?? 0)
    }
}

extension BinarySearchTree {
    func insert(value: T) {
        if value < self.value {
            if let left = leftChild {
                left.insert(value: value)
            } else {
                leftChild = BinarySearchTree(value: value)
                leftChild?.parent = self
            }
        } else {
            if let right = rightChild {
                right.insert(value: value)
            } else {
                rightChild = BinarySearchTree(value: value)
                rightChild?.parent = self
            }
        }
    }
}

extension BinarySearchTree {
    func search(value: T) -> BinarySearchTree? {
        if value < self.value {
            return leftChild?.search(value: value)
        } else if value > self.value {
            return rightChild?.search(value: value)
        } else {
            return self  // found it!
        }
    }
}

extension BinarySearchTree {
    func inOrder(process: (T) -> Void) {
       leftChild?.inOrder(process: process)
       process(value)
       rightChild?.inOrder(process: process)
     }

    func preOrder(process: (T) -> Void) {
       process(value)
        leftChild?.preOrder(process: process)
        rightChild?.preOrder(process: process)
     }

    func postOrder(process: (T) -> Void) {
        leftChild?.postOrder(process: process)
        rightChild?.postOrder(process: process)
       process(value)
     }
}

extension BinarySearchTree {
    func minimum() -> BinarySearchTree {
        var node = self
        while let next = node.leftChild {
            node = next
        }
        return node
    }
    
    func maximum() -> BinarySearchTree {
        var node = self
        while let next = node.rightChild {
            node = next
        }
        return node
    }
    
    func removeNode(value: T) {
        if let toRemoveNode = self.search(value: value) {
            removeNode(node: toRemoveNode)
        } else {
            print("There isn't value \(value) Node")
        }
    }
    
    func removeNode(node: BinarySearchTree) {
        if node.isLeaf { // node는 leaf node
            removeLeaf(node: node)
        } else {
            var toReplaceNode: BinarySearchTree? = nil
            
            if node.leftChild!.isLeaf { // 삭제할 노드의 leftChild로 대체될 경우
                toReplaceNode = node.leftChild
            } else {    // 삭제할 노드의 leftChild의 Maximum으로 대체. 될 경우
                toReplaceNode = node.leftChild?.maximum()
                
                if toReplaceNode!.isLeaf {
                    toReplaceNode!.parent?.rightChild = nil // 대체할 노드의 부모 노드에서 제거
                } else {    // 대체할 노드의 왼쪽 자식노드 존재
                    toReplaceNode?.parent?.rightChild = toReplaceNode?.leftChild
                    toReplaceNode?.leftChild?.parent = toReplaceNode?.parent
                }
            }
            
            // 삭제된 노드 자리로 대체
            if let parent = node.parent {
                toReplaceNode?.parent = parent
                if node.isLeftChild {
                    parent.leftChild = toReplaceNode
                } else {
                    parent.rightChild = toReplaceNode
                }
            } else {
                node.value = toReplaceNode!.value
            }
            
            if let right = node.rightChild {
                toReplaceNode?.rightChild = right
                right.parent = toReplaceNode
            }
        }
    }
    
    func removeLeaf(node: BinarySearchTree) {
        let parent = node.parent
        
        if parent?.rightChild?.value == node.value {
            parent?.rightChild = nil
        } else if parent?.leftChild?.value == node.value {
            parent?.leftChild = nil
        }
        
        node.parent = nil
    }
}

extension BinarySearchTree: CustomStringConvertible {
    var description: String {
        var s = ""
        if let left = leftChild {
            s += "(\(left.description)) <- "
        }
        s += "\(value)"
        if let right = rightChild {
            s += " -> (\(right.description))"
        }
        return s
    }
}

extension BinarySearchTree {
    func height() -> Int {
        if isLeaf {
            return 0
        } else {
            return 1 + max(leftChild?.height() ?? 0, rightChild?.height() ?? 0)
        }
    }
    
    func isBST(minValue: T, maxValue: T) -> Bool {
        if value < minValue || value > maxValue {
            return false
        }
        let leftBST = leftChild?.isBST(minValue: minValue, maxValue: value) ?? true
        let rightBST = rightChild?.isBST(minValue: value, maxValue: maxValue) ?? true
        
        return leftBST && rightBST
    }
}
