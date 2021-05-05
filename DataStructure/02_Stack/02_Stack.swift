
struct Stack<T> {
    var stack = [T]()
    
    var isEmpty: Bool {
        return stack.isEmpty
    }
    
    var count: Int {
        return stack.count
    }
    
    // Stack 내부의 값이 없는 경우대비 옵셔널 처리
    var top: T? {
        return stack.last
    }
    
    // 원소가 맨 앞에 생성되면 index이동으로 O(n)의 시간복잡도 비용발생
    mutating func push(_ element: T) {
        stack.append(element)
    }
    
    mutating func pop() -> T? {
        return stack.popLast()
    }
}
