/*
 // MARK: - Queue (FIFO) (First In First Out)
 
 example: Ticket Counter, Powerpoint Slides
 
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

