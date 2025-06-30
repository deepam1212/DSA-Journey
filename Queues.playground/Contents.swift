/*
 // MARK: - Queue (FIFO) (First In First Out)
 
 example: Ticket Counter, Powerpoint Slides, Calling to a Call Center, Cold play concert in BookMyShow
 
 ____________________________________
 |
 |
 ------------------------------------
 Read End                       Front End
 of Queue                       of Queue
 (Entry)                         (Exit)
 
 Operation:
 1. Enqueue = Adding X in to the Queue
 2. Dequeue = Removing Front Element from Queue
 3. front()/ peek() = return Front Element from Queue but do not remove it
 */
// MARK: - Code Example
// Queue Implementation in Swift (We can also use classes as well)
struct Queue<T> {
    private var elements: [T] = []

    // Check if the queue is empty
    var isEmpty: Bool {
        return elements.isEmpty
    }

    // Return the number of elements
    var count: Int {
        return elements.count
    }

    // Add an element to the end of the queue
    mutating func enqueue(_ value: T) {
        elements.append(value)
    }

    // Remove and return the element at the front of the queue
    mutating func dequeue() -> T? {
        return isEmpty ? nil : elements.removeFirst()
    }

    // Peek at the front element without removing it
    func front() -> T? {
        return elements.first
    }
}
// MARK: - For implementing a Queue we need to implement `enqueue` & `dequeue` methods

// MARK: - Implementation of Queue using LinkedList
/*
 
 Always remove the Head and add from tail
 
 
 eq 3, eq 7, eq 12, eq 8, dq, dq, eq41
 
 12, 8, 41
 
 
 */

// MARK: - How to implement Queue using Stack
// Queue has 2 end & Stack has only one end, so we need 2 stack to implement a Queue
/*
 📦 Stack (LIFO – Last In, First Out)
 🔹 Behavior:
 You insert and remove items from one end only – called the top.

 Like a stack of plates: you can only take the top plate.
 
 🚪 Queue (FIFO – First In, First Out)
 🔹 Behavior:
 You insert at one end (rear) and remove from the other (front).

 Like a line of people at a ticket counter.
 */
struct QueueUsingStacks<T> {
    private var inStack: [T] = []
    private var outStack: [T] = []

    mutating func enqueue(_ value: T) {
        inStack.append(value)
    }

    mutating func dequeue() -> T? {
        if outStack.isEmpty {
            while let element = inStack.popLast() {
                outStack.append(element)
            }
        }
        return outStack.popLast()
    }

    var front: T? {
        if outStack.isEmpty {
            return inStack.first
        }
        return outStack.last
    }

    var isEmpty: Bool {
        return inStack.isEmpty && outStack.isEmpty
    }
}
// New Data Structure Deque (Stack + Queue), T.C. O(1)
// Remove from front/ back
// Insertion from front/ back
// Access from front/ back

// MARK: - Most Important (All FAANG) Sliding Window Maximum
// Find maximum of every SUbArray k size K
// [3,2,3,4,5,5,4,5,6], k = 4
// [0-3] index, answer = 4
// [1-4], answer = 5 ...




let dict: [Int: [Int]] = [:]
for item in dict {
    let value = (item.value.last ?? 0) - (item.value.first ?? 0)
}

func findShortestSubArray(_ nums: [Int]) -> Int {
    var frequencyDict: [Int: [Int]] = [:]
    for (index, item) in nums.enumerated() {
        if var myValue = frequencyDict[item], !myValue.isEmpty {
            myValue.append(index)
            frequencyDict[item] = myValue
        } else {
            frequencyDict[item] = [index]
        }
    }
    //
    var minimumSize: Int = Int.max
    var maximumValue: Int = 1
    //
    for item in frequencyDict {
        if item.value.count == 1 {
            continue
        }
        print("item.value", item.value)
        print("maximumValue", maximumValue)
        //
        if item.value.count > maximumValue {
            maximumValue = item.value.count
            minimumSize = min(minimumSize, (item.value.last ?? 0) - (item.value.first ?? 0) + 1)
        }
    }
    return minimumSize
}
print(findShortestSubArray([1,2,2,3,1,4,2]))
