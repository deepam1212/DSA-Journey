// MARK: - Stack
// MARK: - First In Last Out

/*
 
 Operation in Stack Data Structure
 
 1. Push// Pushing an element in Stack
 2. peek// Returning the Top element of Stack
 3. pop// poping any element in Stack
 4. isEmpty()
 
 MARK: - Note: All the sbove have O(1) Time Complexity
 
|          |
|          |
|          | Then peeking 1 from Stack
|          | Pushing 1 in Stack
|          | Pusing 5 in Stack
|__________|
 
 
 Implementing Stack in Array
 
// MARK: -  We use index = -1 to represent an empty stack clearly and safely before any push operation.
Index: -1 will show that the stack is empty
 
 ______________________________
 |
 |3 5
 ------------------------------
 0  1   2   3   4   5   6
 
 
 In Stack we dont actually remove element we just change the Element
 // MARK: - There ia condition underflow, when you are to take something more than you have, lets say we want to get elemenrt from an empty array then the condition of underflow will occur
 
 if index > arr.count // Overflow condition
 
 */
// MARK: - Given the paranthesis is valid or not []{}()


func checkIsValidParanthsis() -> Bool {
    let str: String = "({[]})"
    var stack: [Character] = []
    var map: [Character: Character] = [")": "(", "]": "[", "}": "{"]
    
    for item in str {
        if map.values.contains(item) {
            stack.append(item)
        } else if let value = map[item], value == stack.last {
            stack.popLast()
        } else {
            return false
        }
    }
    
    return stack.isEmpty
}
print(checkIsValidParanthsis())
/*
 
 Infix                              Postfix
 2+3                                    23+
 2+(5*3)                                253*+
 
 arr[] = "3", "5", "+", "2", "-", "2", "5", "*", "-"
 
 Value                      Stack
 3                           [3]
 5                          [3,5]
 +                           [8]
 2                          [8,2]
 -                           [6]
 2                          [6,2]
 5                         [6,2,5]
 *                         [6, 10]
 -                          [-4]
 
 
 */

//MARK: - Amazon Question Nearest Smallest Element
// Question: Given an array of size N for every index i fidn the nearest element which is smaller than the ith element on left side

/*
 Example 1: arr: [4,5,2,10,3,2]
 */
func nearestSmallerElements(_ nums: [Int]) -> [Int] {
    var stack: [Int] = []
    var result: [Int] = []
    
    for item in nums {
        while let last = stack.last, last > item {
            stack.popLast()
        }
        result.append(stack.last ?? -1)
        stack.append(item)
    }
    
    return result
}

print(nearestSmallerElements([4, 5, 2, 10, 8]))
