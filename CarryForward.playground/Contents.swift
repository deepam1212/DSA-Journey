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
