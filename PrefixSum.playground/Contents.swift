/*
 WHENEVER THERE IS SINGLE ARRAY, THE SPACE COMPLEXITY IF O(N)
 */
func rotateArray(arr: inout [Int], st: Int, en: Int) -> [Int] {
    var start: Int = st
    var end: Int = en
    
    while(start < end) {
        let temp = arr[start]
        arr[start] = arr[end]
        arr[end] = temp
        start += 1
        end -= 1
    }
    
    return arr
}

func rotateKTimes(kTimes: inout Int) {
    var arr: [Int] = [1,2,3,4,5]
    if kTimes >= arr.count {
        kTimes = kTimes % arr.count
    }
    arr = rotateArray(arr: &arr, st: 0, en: arr.count - 1)
    arr = rotateArray(arr: &arr, st: 0, en: kTimes - 1)
    arr = rotateArray(arr: &arr, st: kTimes, en: arr.count - 1)
    print("Rotated Array: \(arr)")
}
var k: Int = 1
rotateKTimes(kTimes: &k)
/*
 [1,2,3,4]
 
 Rotate 1: [4,1,2,3]
 Rotate 2: [3,4,1,2]
 Rotate 3: [2,3,4,1]
 Rotate 4: [1,2,3,4]
 
 
 */
// MARK: - Prefix Sum


/*
 to understand the Prefix Sum, Lets take the Cricket Match Example
 
 Overs = 1  2   3   4   5   6   7   8   9   10
 Runs =  2  8   14  29  31  49  65  79  88  97
 
 
 Total Runs from 6 to 10 overs:
 
 Score till 5th over: 31, & after this the 6th over start so to calculate the score from the 6 to 10 over: 97 - 31 = 66
 
 Total Score in the 10 over: Score after 10th over - score after 9th over
 97 - 88 = 9
 
 Total Score from 3 and 6 over both included = Total Score adter 2 over and total score after 6 over
 49 - 8 = 41
 
 // MARK: - Prefix Sum of i means sum of all the elements from 0  to i'th element
 
 arr: [Int] = [2,5,-1,7,1]
 Prefix Sum: [Int] = [2,7,6,13,14]
 
 arr = [10,32,6,12,20,1]
 pf = [10,42,48,60,80,81]
 //MARK: - Note: - pf = prefix sum
 if we have to find the prefix sum from 5 from 4 then we have to write : pf[5] - pf[3] = 81-60
 
 if start > 0 {
    formula = pf[end] - pf[start - 1]
 } else {
    formula = pf[e]// as if there is only one item in the array then the prefix sum is only the item same
 }
 
 start 4, end = 8
 prefix[8] - prefix[4-1]
 
 
 
 We do the Prefix Sum because the Time Complexity is Reduces from brute force as the Time Complexity is O(N^N), with prefix Sum the time complexity is O(N)
 */

// MARK: - Whenever the range is given we have to apply prefix sum in 90% of time
func sumOfEvenIndexedElement(query: [[Int]]) {
    let arr: [Int] = [2,3,1,6,4,5]
    var prefixArray: [Int] = []
    var prefixSum: Int = 0
    for (index, item) in arr.enumerated() {
        if index % 2 == 0 {
            prefixSum += item
        }
        prefixArray.append(prefixSum)
    }
    print(prefixArray)
    for item in query {
        let start: Int = item[0]
        let end: Int = item[1]
        
        if start > 0 {
            print(prefixArray[end] - prefixArray[start - 1])
        } else {
            print(prefixArray[end])
        }
    }
}
// Answer: [1, 5, 7, 0, 5, 4]
//sumOfEvenIndexedElement(query: [[1,3], [2,5], [0,4], [3,3], [1,5], [4,4]])
// Odd index
func findSumOfOddIndex(query: [[Int]]) {
    let arr: [Int] = [2,3,1,6,4,5]
    var prefixArray: [Int] = []
    var prefixSum: Int = 0
    for (index, item) in arr.enumerated() {
        if index % 2 != 0 {
            prefixSum += item
        }
        prefixArray.append(prefixSum)
    }
    //
    for item in query {
        let start: Int = item[0]
        let end: Int = item [1]
        
        if start > 0 {
            print(prefixArray[end] - prefixArray[start - 1])
        } else {
            print(prefixArray[end])
        }
    }
}
findSumOfOddIndex(query: [[1,3], [2,5], [0,4], [3,3], [1,5], [4,4]])

// MARK: - Google Question(Hard)
// Find the count of Special Index in an array
// Special Index is after removing the element from the index, so sum of elements of even index must be equal to sum of element of odd index
// example: [1,1,9,1,1]
// index:    0 1 2 3 4
// Answer should be 1, as there are total 1 index, which can be removed after that sum of odd and even index elements are same
// example: A[] = [4,3,2,7,6,-2]
func countOfSpecialIndex(arr: inout [Int]) -> Int {
    var prefixEvenElementsArray: [Int] = []
    var prefixOddElementsArray: [Int] = []
    var prefixSumEven: Int = 0
    var prefixSumOdd: Int = 0
    for (index, item) in arr.enumerated() {
        if index % 2 == 0 {
            prefixSumEven += item
        } else {
            prefixSumOdd += item
        }
        prefixEvenElementsArray.append(prefixSumEven)
        prefixOddElementsArray.append(prefixSumOdd)
    }
    print("prefixEvenElementsArray", prefixEvenElementsArray)
    print("prefixOddElementsArray", prefixOddElementsArray)
    var count: Int = 0
    // If the Pivot Element is Even then we have to find the Sum of Odd Index after the Pivot + sum of Even Index before the Pivot Element
    // Lets say that the Pivot Index is 0, then we have to find the sum of odd index from 1 to n - 1
    // S(Even) = PFO(n-1) - pfo(0)
    for (index, item) in arr.enumerated() {
        if index == 0 {
            let sumEven = prefixEvenElementsArray[prefixEvenElementsArray.count - 1] - prefixEvenElementsArray[0]
            let sumOdd = prefixOddElementsArray[prefixOddElementsArray.count - 1] - prefixOddElementsArray[0]
            if sumEven == sumOdd {
                count += 1
            }
        } else {
            let sumEven = prefixEvenElementsArray[index - 1] + prefixOddElementsArray[prefixOddElementsArray.count - 1] - prefixOddElementsArray[index]
            let sumOdd = prefixOddElementsArray[index - 1] + prefixEvenElementsArray[prefixEvenElementsArray.count - 1] - prefixEvenElementsArray[index]
            if sumEven == sumOdd {
                count += 1
            }
        }
    }
    return count
}
var arr: [Int] = [4,3,2,7,6,-2]//[2,3,1,4,0,-1,2,-2,10,8]
let myCount = countOfSpecialIndex(arr: &arr)
print("Count is: \(myCount)")




