
// MARK: --- Tree 기본
class Node<T: Equatable> {
    var value: T
    var children: [Node] = []
    weak var parent: Node?
    
    init(value: T) {
        self.value = value
    }
    
    func add(child: Node) {
        children.append(child)
        child.parent = self
    }
    
    func search(value: T) -> Node? {
        if value == self.value {
            return self
        }
        
        for child in children {
            if let found = child.search(value: value) {
                return found
            }
        }
        
        return nil
    }
    
    func printValue() {
        print(value)
    }
}

// http://minsone.github.io/mac/ios/swift-generics-summary (<T: Equatable>)
