//MARK: - LinkedList and OOPS Concept


/*
 Programming Paradigm: Style or Standard way of writing a Program
 
 example: mcdonald have a standard way of creating burgers, so all the burgers taster same
 
 
 
 // MARK: - OOPS Concept
 
 
 Most Fundamental thing in OOPS is class and Object
 
 Class: It is a Blueprint, example: lets say you want to construct a Home, So Engineer would give me an Architecture, it is called as a BluePrint(Not Real or a visualization(Skelton))
 -----------
 Object: A Real world representation of the class
 
 Example: Once you have a blueprint, you can construct a Home(Class is not real, But Object is real)
 
    ________________________                        _______________________
    |                       |                       |                     |
    |                       |                       |                     |
    |       Class           |                       |     Object          |
    |                       |                       |                     |
    |                       |                       |                     |
    |_______________________|                       |_____________________|
        This is map of                                  This is the Real
            House(BluePrint)                                House
 
 
 
 
 Array needs contineous block of memory, ,lets say
 
 -------------------------------
 |      | 3 B  |       | 3 B|  |  B => Byte
 -------------------------------
         Memory Block => 3 B
 The 3 B are free in our RAM in 2 places, but we can not make the Array in this Case
 
 so in this case we have to create a LinkedList, as it uses all the available memory
  _____________
 |Value -> Next|
  -------------
 
 LinkedList and array in Linear Data Structure, As it can traverse from left to right
 
 
 
 
 
 */


class Node {
    let value: Int
    var next: Node?
    
    init(value: Int, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

let node1 = Node(value: 1)// Head Node
let node2 = Node(value: 2)
let node3 = Node(value: 3)
node1.next = node2
node2.next = node3
/*
 
 //MARK: - how to access the element at kth Index
 */
var index: Int = 1
var temp = node1
for i in 1...index {
    temp = temp.next!
}
print(temp.value)
/*
 
 🔹 Shallow Copy:
 A shallow copy means only the reference (pointer) to the original object is copied, not the actual object. If the object is mutable, changes made through one reference will affect the other.

 🔹 Deep Copy:
 A deep copy means a new copy of the entire object and its nested objects is created. Changes made to the copied object do not affect the original.
 
 */
class Address {
    var city: String
    init(city: String) {
        self.city = city
    }
}

class Person {
    var name: String
    var address: Address

    init(name: String, address: Address) {
        self.name = name
        self.address = address
    }

    // Shallow Copy
    func shallowCopy() -> Person {
        return Person(name: self.name, address: self.address)
    }

    // Deep Copy
    func deepCopy() -> Person {
        let copiedAddress = Address(city: self.address.city)
        return Person(name: self.name, address: copiedAddress)
    }
}
/*
 Searching in a LinkedList
 */
class ListNode {
    var val: Int
    var next: ListNode?
    
    init(val: Int, next: ListNode? = nil) {
        self.val = val
        self.next = next
    }
}

func searchLinkedList(head: ListNode?) -> Bool {
    var temp = head
    while(temp != nil) {
        if temp?.val == 21 {
            return true
        } else {
            temp = temp?.next
        }
    }
    return false
}
//let newNode1 = ListNode(val: 1)
//let newNode2 = ListNode(val: 2)
//let newNode3 = ListNode(val: 3)
//let newNode4 = ListNode(val: 4)
//newNode1.next = newNode2
//newNode2.next = newNode3
//newNode3.next = newNode4
//
//searchLinkedList(head: newNode1)
// MARK: - Insert in kth Index
// MARK: - Head -> Index 0 Node -> Index 1 Node -> Index 2 Node.....

// There is no concept of indexes inside a LinkedList, We are writing this because of our convienience

func insertNodeAtKthIndex(head: inout ListNode?, valueToInsert: Int, k: Int) -> ListNode? {
    let newNode = ListNode(val: valueToInsert)
    if k == 0 {
        newNode.next = head
        return newNode
    }
    var currentNode = head
    var index: Int = 0
    
    while(currentNode != nil && index < k - 1) {
        currentNode = currentNode?.next
        index += 1
    }
    
    if currentNode == nil {
        return head
    }
    
    newNode.next = currentNode?.next
    currentNode?.next = newNode
    
    
    return head
    
}

var newNode1: ListNode? = ListNode(val: 1)
let newNode2: ListNode? = ListNode(val: 2)
let newNode3: ListNode? = ListNode(val: 3)
let newNode4: ListNode? = ListNode(val: 4)
newNode1?.next = newNode2
newNode2?.next = newNode3
newNode3?.next = newNode4

//insertNodeAtKthIndex(head: &newNode1, valueToInsert: 100, k: 2)

func deletionOfNode(head: inout ListNode?, valueToDelete: Int) -> ListNode? {
    if head?.val == valueToDelete {
        head = head?.next
        return head
    }
    
    var current = head
    while(current?.next != nil) {
        if current?.next?.val == valueToDelete {
            current?.next = current?.next?.next
        } else {
            current = current?.next
        }
    }
    
    return head
}
let node = deletionOfNode(head: &newNode1, valueToDelete: 5)
print(node?.val)
print(node?.next?.val)
print(node?.next?.next?.val)
// Reverse LinkedList
func reverseLnkedList(head: inout ListNode?) -> ListNode? {
    var previous: ListNode? = nil
    var current = head// 1,2,3,4
    
    while(current != nil) {
        let nextNode = current?.next//2,3
        current?.next = previous//nil,1
        previous = current//1,
        print("Previous Node", previous?.val ?? 0)
        print("Previous Next Node", previous?.next?.val ?? 0)
        current = nextNode//2,
    }
    
    return previous
}
reverseLnkedList(head: &newNode1)
//MARK: - Deep copying a LinkedList, We can do it using hashmap or dictionary
func deepCopyOfLinkedList(head: inout ListNode?) -> ListNode? {
    var originalNode: ListNode? = head
    var copyNode: ListNode? = head
    
    while(originalNode != nil) {
        let newNode = ListNode(val: originalNode?.val ?? 0)
        copyNode?.next = newNode
        copyNode = copyNode?.next
        originalNode = originalNode?.next
    }
    
    return copyNode
}
/* Example: let say we have a LinkedList 1 -> 2 -> 3 -> 4 which are stored on random address

and we have to create a linkedlist which is same of the above linkedlist but of different address,
 Answer: We will be using Deep Copy for this, As in Shallow Copy the address of the Nodes of the LinkedList are same but in Deep Copy the Address of the LinkedList are different
 */
func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
    var currentList = head
    
    return nil
}
