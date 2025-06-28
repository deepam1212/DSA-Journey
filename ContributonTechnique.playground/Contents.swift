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
print("Optimized Sum of SubArray is using PrefixSum: \(optimizedUsingPrefixSum())")// T.C. O(N^2), S.C. O(N), as we are creating a P.F. Array

// MARK: - Carry Forward
func optimziedUsingCarryForward() -> Int {
    var arr: [Int] = [1,2,3]
    var totalSum: Int = 0
    
    for (startIndex, startItem) in arr.enumerated() {
        var sum: Int = 0
        for endIndex in startIndex..<arr.count {
            sum += arr[endIndex]
            totalSum += sum
        }
    }
    
    return totalSum
}
print("Optimized using Carry Forward Techinique is: \(optimziedUsingCarryForward())")// T.C. O(N^2), S.C. O(1)
// MARK: - Contribution Technique(Same Question Idea Number 4)
// Add Individual Contribution of array
// Add Occurances of an item & its contribution example [1,2,3] =>
/*
    Element    |   Occurance   |   Contribution
       1       |       3       |        3
       2       |       4       |        8
       3       |       3       |        9
 
 Total Sum: = 3 + 8 + 9 = 20
 
 // MARK: - When we have to Apply sum of all then we have to Apply Contribution Technique
 
 index 0 Element in an array of count 3 => (i+1) * (N-i) => (0+1) * (3-0) => 3
 index 1 Element in an array of count 3 => (i+1) * (N-i) => (1+1) * (3-1) => 4
 index 2 Element in an array of count 3 => (i+1) * (N-i) => (2+1) * (3-2) => 3
 */
func optimizedUsingContributionTechnique() -> Int {
    var arr: [Int] = [1,2,3]
    var totalSum: Int = 0
    
    for (index, item) in arr.enumerated() {
        let occurance: Int = (index + 1) * (arr.count - 1)
        let totalContribution: Int = occurance * item
        totalSum += totalContribution
    }
    
    return totalSum
}
print("Optimized Using Contribution technique: \(optimizedUsingPrefixSum())")// T.C. O(N), S.C. O(1)
// Contribution Technique Explanation Why this formula is created (i+1) * (N-i)
/*
 example: arr = [3  -2  4   -1  2   6]
        index = [0   1  2    3  4   5]
  _                                     _
 | From Which = [✅  ✅ ✅   ❌ ❌  ❌] |It means only index 0,1 & 2 are the indexes with which we start
 | index we                             |that include an item 4
 | start that                           -
 | include
 | an item 4
  -
 
  _
 | Up to which = [❌ ❌ ✅   ✅ ✅  ✅]  -
 | Index we                             | It means from whereever we start we must end up in these index
 | Iterate                              | to include item 4
 | that                                  -
 | include
 | item 4
 -
 
 So the formula become (i+1) * (N-1)
 (i+1) are the starting Points
 (N-1) are the total ending points
 */

// MARK: - Question: Total Number of Sub Array of length K, k = 1
/*
 array = [17,3,4,9,12,6]
 
 Number of Sub Array of length 1 => 6
 Number of Sub Array of length 2 => 5
 Number of Sub Array of length 3 => 4
 Number of Sub Array of length 4 => 3
 Number of Sub Array of length 5 => 2
 Number of Sub Array of length 6 => 1
 
 In General for any length K Formula is N - k + 1 = 6 - 1 + 1 = 6 for k == 1
 N - k + 1 = 6 - 1 + 1 = 6 for k == 1
 N - k + 1 = 6 - 2 + 1 = 5 for k == 2
 N - k + 1 = 6 - 3 + 1 = 4 for k == 3
 N - k + 1 = 6 - 4 + 1 = 3 for k == 4
 N - k + 1 = 6 - 5 + 1 = 2 for k == 5
 N - k + 1 = 6 - 6 + 1 = 1 for k == 6
 
 // MARK: - Formula is N - k + 1 for Total Number of Sub Array of Length k
 
 */
// MARK: - Sliding Window
// MARK: - Question (Given array N print maximum SubArray sum of subarray with length k)
/*
 array = [-3,4,-2,5,3,-2,8,2,-1,4], k = 5
 
 SunArray
 
 Start  |  End   |   Sum
   0    |   4    |    7
   1    |   5    |    8
   2    |   6    |    12
   3    |   7    |    16
   4    |   8    |    10
   5    |   9    |    11
 
 // MARK: - We can only Apply Sliding Window when the K or Target is Given and the result array Must be Contigeous
 */
func findMaximumSubArraySum() -> Int {
    let arr: [Int] = [-3,4,-2,5,3,-2,8,2,-1,4], k: Int = 5
    var startIndex: Int = 0, endIndex: Int = k - 1
    var maximumSum: Int = 0
    while(startIndex <= endIndex) {
        maximumSum += arr[startIndex]
        startIndex += 1
    }
    var currentSum: Int = maximumSum

    for index in k..<arr.count {
        currentSum += arr[index] - arr[index-k]
        maximumSum = max(maximumSum, currentSum)
    }
    
    return maximumSum
}
print("Maximum Sub Array Sum is: \(findMaximumSubArraySum())")// T.C. O(N), S.C. O(1)

