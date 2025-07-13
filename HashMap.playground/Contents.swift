// MARK: - All Information About HashMap and HashSet
/*
 
 Hashmap is a Data Structure that stores a Key: Value Pair
 
 
 {
 "response": [
    {},
    {}
 ]
 
 }
 
 */

var dictArray: [[String: Any]] = []
var dict: [String: Any] = [:]
dict["diamond_id"] = 1
dict["diamond_name"] = "Rose"
dictArray.append(dict)
dict["diamond_id"] = 2
dict["diamond_name"] = "Purple"
dictArray.append(dict)
debugPrint(dictArray)


var set: Set<Int> = []
var arr: [Int] = []
arr.append(1)
arr.append(1)
set.insert(1)
set.insert(1)
print(arr)
print(set)
// MARK: - in Set we dont have .append(), Set have insert
// MARK: - Dictionary stores the value in Heap memory
var dict1 = ["a": 1, "b": 2]
var dict2 = dict1  // doesn't copy immediately — shares the same heap storage

dict2["a"] = 100   // triggers actual copy (copy-on-write)
print(dict1)
print(dict2)
// MARK: - Dictionary is a value type and still stores memory in heap(and same goes for array)
// Dictionary is a value type (a struct), but it stores its data (keys and values) in the heap.

// MARK: - Anything we do in a dicgionafry like appending, removing, searching it is O(1)
func frequencyCalculator() {
    var arrNew: [Int] = [10,10,20,30,40,50,40,40]
    var query: [Int] = [10,40]
    //
    var seen: [Int: Int] = [:]
    //
    for item in arrNew {
        if var myValue = seen[item] {//[10:2, 20: 1]
            seen[item] = myValue + 1
        } else {
            seen[item] = 1//[10:1]
        }
    }
    //
    for item in seen {
        if item.value == 1 {
            print(item.key)
        }
    }
    //
//    for item in query {
//        if var myValue = seen[item] {
//            print(myValue)
//        }
//    }
}
frequencyCalculator()


var dictName: [String: Int] = ["Agrima": 1, "Deepam": 2]
for i in 0...1 {
    if let myValue = dictName["Agria"] {
        print("MyValue", myValue)
    } else {
        print("No Value with Agria Key")
        dictName["Agria"] = 3
    }
}
var arrDict: [[String: Int]] = [["Agrima": 1, "Deepam": 2], ["Dirhghayu": 3, "Shubham": 4]]
print(arrDict)
struct DiamondModal {
    let diamondId: Int = 0
    let diamondName: String = "Rose"
}

var arrDiamond: [DiamondModal] = []

func checkUnique() {
    let arr: [Int] = [1,1,2,3,4,5]
    var set: Set<Int> = []
    for item in arr {
        set.insert(item)
    }
    print(set)
}

checkUnique()
// MARK: - Set dont maintain the orders
/*
 // MARK: - Length of the Longest Substring with Repeating

 Input: "abcabcbb"
 Output: 3
 
 Input: "AaaA"
 OUtput: 2
 
 Input: "bbbb"
 Output: 1
 
 Input: "pwwkew"
 Output: 3
 */
func lengthOfSubString(str: String) {
    //
    var start = str.startIndex
    var end = start
    var seen: Set<Character> = []
    var maxLength: Int = 0
    //
    while(end < str.endIndex) {
        let char = str[end]
        //
        if !seen.contains(char) {
            seen.insert(char)
            let size = str.distance(from: start, to: end) + 1
            print("size", size)
            maxLength = max(maxLength, size)
            end = str.index(after: end)
        } else {
            seen.remove(str[start])
            start = str.index(after: start)
        }
    }
    //
    print("MaxLength is : \(maxLength)")
}
lengthOfSubString(str: "abcabcbb")
