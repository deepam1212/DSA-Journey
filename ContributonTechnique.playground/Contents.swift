// MARK: - All About Sliding Window & Contributon Technique


// MARK: - Total Number of subArray in array is  N*(N+1) / 2

// MARK: - Google and Facebook Question (Given an Array of Size N, Find the sum of all the SubArray Sums)

/*
 
 array = [1,2,3]
 [1] -> 1
 [1,2] -> 3
 [1,2,3] -> 6
 [2] -> 2
 [2,3] -> 5
 [3] -> 3
 Total Sum = 20

 // MARK: - Idea: (Create 3 Nested Loops)
 */
func sumOfAllSubArray() -> Int {
    var arr: [Int] = [1,2,3]
    var totalSum: Int = 0
    
    for (startIndex, startItem) in arr.enumerated() {
        for endIndex in startIndex..<arr.count {
            var sum: Int = 0
            for i in startIndex...endIndex {
                sum += arr[i]
            }
            //
            totalSum += sum
        }
    }
    return totalSum
}

print("Total Sum of SubArray is: \(sumOfAllSubArray())")// T.C. O(N^3), S.C. O(1)
// Can we Optimize this(use PreFix Sum)
func optimizedUsingPrefixSum() -> Int {
    var arr: [Int] = [1,2,3]
    
    var prefixSumArr: [Int] = []
    var totalSum: Int = 0
    var pSum: Int = 0// Prefix Sum
    // First We will create our Prefix Sum Array
    for item in arr {
        pSum += item
        prefixSumArr.append(pSum)
    }
    // Then we iterate through the Array to see all the SubArray
    for (startIndex, startItem) in arr.enumerated() {
        for endIndex in startIndex..<arr.count {
            var sum: Int = 0
            if startIndex == 0 {
                sum = prefixSumArr[endIndex]// If startIndex is 0, then Prefix Sum Formula is pf = arr[end]
            } else {
                sum = prefixSumArr[endIndex] - prefixSumArr[startIndex - 1]// else if startIndex is not 0, then Prefix Sum Formula is Pf[endIndex] - pf[startIndex - 1]
            }
            totalSum += sum
        }
    }
    
    return totalSum
}
print("Optimized Sum of SubArray is using PrefixSum: \(optimizedUsingPrefixSum())")
