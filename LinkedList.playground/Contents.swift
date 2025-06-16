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
