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




