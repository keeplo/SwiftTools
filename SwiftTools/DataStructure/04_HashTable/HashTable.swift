public struct HashTable<Key: Hashable, Value> {
    private typealias Element = (key: Key, value: Value)
    private typealias Bucket = [Element]
    private var buckets: [Bucket]
    
    private(set) public var count = 0
    public var isEmpty: Bool {
        return count == 0
    }
    
    public init(capacity: Int) {
        assert(capacity > 0)
        buckets = Array<Bucket>(repeating: [], count: capacity)
    }
    
    private func index(for key: Key) -> Int {
        return abs(key.hashValue) % buckets.count
    }
    
    // Key 를 받아서 Value 리턴
    public subscript(key: Key) -> Value? {
        get {
            return value(for: key)
        }
        set {
            if let value = newValue {
                update(value: value, for: key)
            } else {
                removeValue(for: key)
            }
        }
    }
    
    // Key를 받아서 해당 key
    public func value(for key: Key) -> Value? {
        let index = self.index(for: key)
        return buckets[index].first { $0.key == key }?.value
    }
    
    public mutating func update(value: Value, for key: Key) -> Value? {
        let index = self.index(for: key)
        
        // Key에 해당 Hash Address의 배열의 값이 있다면 다음 index에 Value 값 넣고 이전 oldValue 리턴
        if let (i, element) = buckets[index].enumerated().first(where: { $0.1.key == key }) {
            let oldValue = element.value
            buckets[index][i].value = value
            return oldValue
        }
        
        // Hash Address의 배열의 값이 없다. 배열에 Key와 Value 넣기
        buckets[index].append((key: key, value: value))
        count += 1
        return nil
    }
    
    public mutating func removeValue(for key: Key) -> Value? {
        let index = self.index(for: key)
        
        // Key에 해당하는 Hash Address의 배열의 값이 있다면 해당 index에 Value 값 제거하고 이전 oldValue 리턴
        if let (i, element) = buckets[index].enumerated().first(where: { $0.1.key == key }) {
            buckets[index].remove(at: i)
            count -= 1
            return element.value
        }
        
        // Hash Address의 배열의 값이 없다. 동작 없음
        return nil
    }
}

// https://www.raywenderlich.com/206-swift-algorithm-club-hash-tables
