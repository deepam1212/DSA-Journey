// MARK: - Memory Management


/*
 Introduction to Stack
 
 |                |
 |                | => Stack example Idli Stand, I can Insert or delete from the Top
 |                |
 |                |
 |                |
 |                |
 |                |
 |________________|
 
 
 Stack is a Data Structure also, example stack is a container which will store your data, it is part of a memory
 
 
 - Insert & Delete from the Top
 - You only have access to the Top Elements
 - It follows First In Last Out
 - Just a container which will store data
 
 // MARK: - Call Stack
 For your program a particlar memeory is given which is called as a call stack, Every Function have a call stack.
 
 Example:
 
 class Main {
 
 func add(a: Int, b: Int) -> Int {
 a + b
 }
 
 func multiple(a: Int, b: Int) -> Int {
 a * b
 }
 }
 
 First there will be a Call Stack
 
 |                   |
 |                   |
 |                   |
 |                   |
 |                   |
 |                   |
 |                   | First add Function will be added to the Call stack and after the execution
 |                   | it comes to the main memory or call stack then it will be removed from the call
 |___________________| stack
 
 
 // MARK: - What is Call Stack
 
- The call stack is a region of memory that sotred the information about the active functions or methods in your program
- Whenever an acive fucntion is called a new stack memory is pushed in to the stack, holding the local variables and the state needed to return from the function and automatically deallocates whenever it finishes
- When the function finishes its frame is popped off freeing the memory automatically
 
 // MARK: - Memory management with the Call Stack
 
- Automatic: Memory from a local variables is allocated from the stack and deallocates when it finishes
 
- Fast & Simple: Stack allocation is very efficient, You dont need to manually deallocate memory or free up the memory space, unlike the heap memory.
 
 ```swift
 func sum(_ a: Int, _ b: Int) -> Int {
     let result = a + b // 'result' is stored on the call stack
     return result
 }

 func calculate() {
     let x = 5 // 'x' is stored on the call stack (in 'calculate's frame)
     let y = 10 // 'y' is stored on the call stack
     let total = sum(x, y) // new stack frame for 'sum'
     print(total)
 }

 calculate()
 ```
 
 What Happens in Memory
 Each function call (calculate then sum) pushes a new frame with its local variables.

 When sum returns, its frame (with a, b, and result) is popped and memory is freed instantly.

 No manual cleanup required.
 
 // MARK: - Every Execution starts from the Main Function & Call Stack is basiically telling oyu the State of the Code
 
 // First Function to be added in the call stack is the main function
 
 
 |           |
 |           |
 |___________|
 |           |
 |    main   |
 |___________|
 
 // MARK: - Call Stack & the Stack are the Same thing
 // Stack is also called a temporary Memory, because after some time we are not able to access functions & variables
 
 // MARK: - When we run a Swift program and use a struct (a value type), its memory is typically allocated on the stack.
 // MARK: - Each thread maintains its own call stack, which stores function frames including temporary variables, parameters, and local value types like structs.
 // MARK: - This is why structs are fast and thread-safe—they are copied when passed around and stored on the stack unless captured or passed in contexts requiring heap allocation.
 */
//MARK: - What is reference Variable

/*
 Lets say we go to a Library and we ask for a Particular book and for that book someone would give us the Address for that book
 
 // MARK: - Reference variable holds the address where the data is created/ stored
 
 // MARK: - 2 Types of memory - Stack, Heap
 // MARK: - Stack (All the primitive Data Types are created in Stack, Int, Float, Double, Bool)
 
 
 
 */
