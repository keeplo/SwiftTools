import Foundation

class LinkedList {
    // 리스트 끝에 데이터 추가
    func append(head: Node?, data: Int) -> Node? {
        if head == nil {
            return Node(data: data)
        }

        head?.next = append(head: head?.next, data: data)

        return head
    }
    
    // 원하는 순서에 데이터 추가
    func insert(head: Node?, index: Int, data: Int) -> Node {
        var current = head
        let newNode = Node(data: data)
        
        if index != 0 {
            for _ in 0..<index {
                current = current?.next
            }
            newNode.next = current?.next
            current = newNode
            return head!
        } else {
            newNode.next = current?.next
            return newNode
        }
    }
    
    // 마지막 데이터 제거
    func removeLast(head: Node?) -> Node! {
        if head?.next == nil {
           return nil
        }
        var current = head
        
        while current?.next?.next != nil {
            current = current!.next
        }
        
        current!.next = nil
        
        return head
    }

    // Linked List 전체 프린트
    func display(head: Node?) {
        if head != nil {
            print(head!.data, terminator: " ")

            display(head: head?.next)
        } else {
            print("/")
        }
    }

    // 중복 제거
    func removeDuplicatesCheck(head: Node?) {
        var current = head
        var datas = [Int]()
        
        while current?.next != nil {
            datas.append(current!.data)
            
            if current?.next?.next != nil, datas.contains((current?.next?.data)!) {
                current?.next = current?.next?.next
            } else {
                current = current!.next
            }
        }
    }
}
