/*
 // MARK: - Carry Forward Technique in Array
 
 Given a string s of lowercase character, return the count of pairs (i,j) such that i < j and s[i] is 'a' & s[j] is 'g'
 
 str =    a b e g a g
 index =  0 1 2 3 4 5
 Pairs are: 0,3 | 0,5 | 4,5(These are the Indexes)
 
 
 
 Brute Force Technique is
 */
func findAAndGPairs() -> [[Int]] {
    var str: String = "abegag".lowercased()
    var storedIndexes: [[Int]] = []
    
    for (index, item) in str.enumerated() {
        if item == "a" {
            for (jIndex, jItem) in str.enumerated() {
                if jItem == "g" && index < jIndex {
                    var myIndex: [Int] = []
                    myIndex.append(index)
                    myIndex.append(jIndex)
                    storedIndexes.append(myIndex)
                }
            }
        }
    }
    
    return storedIndexes
}
print(findAAndGPairs())
/*
 Now with Carry Forward Technique
 
 var countOfG: Int = 0(cg)
 var countPairs: Int = 0(tp)
 
 s = a  |   d   |   g   |   a   |   g   |   a   |   g   |   f   |   g           |
        |       |       |       |       |       |       |       |  cg = cg + 1  |
 tp = tp + cg
 */
func countPairs() -> Int {
    var str: String = "abegag".lowercased()
    var totalPairs: Int = 0
    var gCount: Int = 0
    for index in stride(from: str.count - 1, to: -1, by: -1) {
        if str[str.index(str.startIndex, offsetBy: index)] == "g" {
            gCount += 1
        } else if str[str.index(str.startIndex, offsetBy: index)] == "a" {
            totalPairs += gCount
        }
    }
    
    return totalPairs
}
print(countPairs())
// MARK: - Introduction to Sub Array
/*
 1. Sinle Element
 2. Only Left to Right
 3. It is always Contineous as example in Array: [1,2,3,4] the sub Array would be [1,2,3,4], [1,2].....
 But it can never be [1,3] as these elements are not Contineous(Strange right (I KNOW 😊 ))
 4. We can get the SubArray if we know Start and End Index or Start and Length or an Array
 
 Total Number of Sub Array
 
 Array: [Int] = [4,2,10,3,12,-2,15], Total Elements are 7
 
 Total Number of Sub Array from Index 0 = n = 7
 Total Number of Sub Array from Index 1 = 6
 Total Number of Sub Array from Index 2 = 5
 Total Number of Sub Array from Index 3 = 4
 Total Number of Sub Array from Index 4 = 3
 Total Number of Sub Array from Index 5 = 2
 Total Number of Sub Array from Index 6 = 1
 
 So Total niumber of Sub Arrays in an Array are n*(n+1) / 2 ~ O(n^2)
 
Question: Given the Start Point & end Point, can you tell how much sub Arrays would be there
array: [Int] = [4,2,10,3,12,-2,15], startIndex = 2, endIndex = 5
 */
func countTotalSubArray() -> Int {
    let arr: [Int] = [4,2,10,3,12,-2,15]
    let startIndex = 2, endIndex = 5
    var totalItem: Int = endIndex - startIndex + 1
    
    var totalSubArrayCount = (totalItem*(totalItem+1))/2
    return totalSubArrayCount
}
print("countTotalSubArray", countTotalSubArray())
//MARK: - Print 1 SubArray, the Time Complexity is O(N), SC: O(1)
// Question: Print all the SubArray of Given Array: [5,7,3,2]
func printAllSubArray() {
    let arr: [Int] = [5,7,3,2]
    var n = arr.count - 1
    for start in 0...n {
        for end in start...n {
            let subArray = Array(arr[start...end])
            print(subArray)
            /*
             This will pass this
             
             for index in start...end {
                 print(arr[index])
             }
             */
        }
    }
}
printAllSubArray()
// MARK: - For printing any SubArray we can not go better than O(N^3) Time Complexity

//MARK: - Best Question (Given an Array N integer, return the length of smallest subarray which contains both maximum and minimum elements of array)
/*
 var array: [Int] = [2,2,6,4,5,1,5,2,6,4,1]
 
 minimum Element is 1 & maximum element is 6
 
 [8,8,8,8,8], minimum & maximum is 8, so minimum length is [8] i.e. 1
 [3,0,1,2,3], minimum = 0, maximum = 3, length = [3,0], i.e. 2
 */
func findMinMaxSubArray() -> [Int] {
    var arr: [Int] = [2,2,6,4,5,1,5,2,6,4,1,1,6]
    var minElement: Int = Int.max
    var maxElement: Int = Int.min
    
    for item in arr {
        if item < minElement {
            minElement = item
        }
        if item > maxElement {
            maxElement = item
        }
    }
    print(minElement, maxElement)
    var minIndex: Int = -1
    var maxIndex: Int = -1
    var resultArray: [Int] = []
    for (index,item) in arr.enumerated() {
        if item == minElement {
            minIndex = index
        }
        if item == maxElement {
            maxIndex = index
        }
        if minIndex != -1 && maxIndex != -1 {
            if (resultArray.isEmpty) || (maxIndex - minIndex + 1 < resultArray.count){
                if minIndex < maxIndex {
                    resultArray = Array(arr[minIndex...maxIndex])
                } else {
                    resultArray = Array(arr[maxIndex...minIndex])
                }
            }
        }
    }
    return resultArray
}

print(findMinMaxSubArray())
