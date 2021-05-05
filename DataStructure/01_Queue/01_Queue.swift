
struct Queue<T> {
    var queue = [T]()
    
    var isEmpty: Bool {
        return queue.isEmpty
    }
    
    var front: T? {
        return queue.first
    }
    
    var count: Int {
        return queue.count
    }
    
    mutating func enqueue(_ element: T) {
        queue.append(element)
    }
    
    mutating func dequeue() -> T? {
        if isEmpty {
            return nil
        } else {
            return queue.removeFirst()
        }
    }
}
