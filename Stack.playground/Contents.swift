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
// MARK: - Implement Stack Using LinkedList

/*
 
 To implement a Stack we need to implement methods like push, pop, peek & the Time Complexity must be O(1)
 
         Head        |       Tail
 push    O(1)        |        O(1)
 pop     O(1)        |        O(1)
 peek
 
 */
// MARK: - Given String, Remove all the consecutive element, i.e. a b b c => Output: ac
/* a b b c b b c a c x => Output => cx
 
 We do the Above question using Stack
 
 Stack = a b, then we have b incoming and we see the top of the stack, if both are samer then we remove the top of the stack
*/
func removeConsecutiveElementsinString() -> String {
    var myString: String = "abbacx"
    var stack: [Character] = []
    if myString.isEmpty {
        return ""
    }
    for item in myString {
        if stack.isEmpty {
            stack.append(item)
        } else {
            if stack.last == item {
                stack.popLast()
            } else {
                stack.append(item)
            }
        }
    }
    
    return String(stack)
}

print("removeConsecutiveElementsinString", removeConsecutiveElementsinString())// TC, SC: O(N)
// MARK: - Most Important( Find the largest area of rectengle in the Bar)
/*
 ^
 |
8|--
 |  |
 |  |__
 |  |  |
 |  |  |__
 |8 |6 |2 |
0-------------------------------------->
 
 largeat Area of Rectemgle = 16
 
 We need to find the contineous Height, to find it we need to find the SubArray & in the SubArray we need to find the Minimum height of the entire SubArray
 
 BF Idea:
 Foor Every SubArray Staring from Index L and going forward to Index R, Find minimum Height (l..<h),
 area area = H * (r - l + 1)
 
 Time Complexity for BF is O(n^3) & SC: is O(1)
 // MARK: - Note: BF Means Brute Force
 
 Optimal Approach: Fix the Height of rectangle & find Width
 
 We need to find the Nearest Smaller of Left of Size (N) & Nearest Smallest on Right of Size (N)
 
 
 */
 // MARK: - Google Question (Sum of Subarray Ranges)

func findSubArrayRanges() -> Int {
    var nums: [Int] = [1,2,3]
    var result: Int = 0
    
    for i in 0..<nums.count {
        var minItem = nums[i]
        var maxItem = nums[i]
        for j in i..<nums.count {
            minItem = min(minItem, nums[j])
            maxItem = max(maxItem, nums[j])
            result += maxItem - minItem
        }
    }
    
    return result
}
print(findSubArrayRanges())


func findA() -> [Int] {
    let arr: [Int] = [5,2,8,10,6,1,7,15]// -1,-1, 1, 2, 1, -1, 5, 6
    var stack: [Int] = []
    var outputArr: [Int] = []
    for (index, item) in arr.enumerated() {
        if stack.isEmpty || index == 0 {
            if index == 0 {
                outputArr.append(-1)
            }
            stack.append(item)
        } else {
            while ((stack.last ?? 0) > item) {
                stack.popLast()
            }
            if stack.isEmpty {
                outputArr.append(-1)
            } else {
                outputArr.append(stack.last ?? -1)
            }
            stack.append(item)
        }
    }
    
    return outputArr
}
print("findA", findA())
func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
     //
     if nums.count == k && k == 1 {
         return Double(nums[0])
     }
     //
     var maxAverage: Double = 0.0
     //
     for index in 0..<k {
         maxAverage += Double(nums[index]) / Double(k)
         print("maxAverage", maxAverage)
     }
     //
     var myAverage = maxAverage
     //
     for index in k..<nums.count {
         myAverage -= Double(Double(nums[index - k]) / Double(k))
         myAverage += Double(Double(nums[index]) / Double(k))

         maxAverage = max(maxAverage, myAverage)
     }
     //
     return maxAverage
 }
findMaxAverage([4,0,4,3,3], 5)


    func maxFreeTime(_ eventTime: Int, _ k: Int, _ startTime: [Int], _ endTime: [Int]) -> Int {
        let n = startTime.count
        var intervals = [(Int, Int)]()
        for i in 0..<n {
            intervals.append((startTime[i], endTime[i]))
        }

        intervals.sort { $0.1 < $1.1 }

        func canAttend(_ gap: Int) -> Bool {
            var count = 0
            var lastEnd = -1_000_000_000
            for (s, e) in intervals {
                if s >= lastEnd + gap {
                    count += 1
                    lastEnd = e
                    if count >= k {
                        return true
                    }
                }
            }
            return false
        }

        if k == 1 {
            // If only 1 meeting is selected, return the maximum duration of any meeting
            var maxDuration = 0
            for i in 0..<n {
                maxDuration = max(maxDuration, endTime[i] - startTime[i])
            }
            return maxDuration
        }

        var low = 0, high = eventTime, ans = 0
        while low <= high {
            let mid = (low + high) / 2
            if canAttend(mid) {
                ans = mid
                low = mid + 1
            } else {
                high = mid - 1
            }
        }
        return ans
    }




print(maxFreeTime(5, 1, [1,3], [2,5]))
