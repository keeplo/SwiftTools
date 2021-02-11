import UIKit

let list = LinkedList()
var head = Node(data: 3)

print("---> 추가하기")

for i in 2...4 {
    list.append(head: head, data: i)
}

print
