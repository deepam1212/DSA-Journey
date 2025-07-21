// MARK: - Backtracking


// Backtracking: - Trying out all the possibilities using recursion
/*
 If possible, visualize the recursion tree paths.

 
 // MARK: - In Recursion i can not go back, but in backtracking i can go back
 
 // MARK: - Question Givena n Int A writr a function to generate all combinations of well formed paranthesis of length 2A
 
 Note: only () brackets are allowed
        Input       |       Output
        A = 1       |         ()
        A = 2       |       ()() or (())
        A = 3       |       (()()) || ((())) || ()()()() || ()(()) || (())()
 */
func generateParenthesis(_ A: Int) -> [String] {
    var result = [String]()

    func backtrack(_ current: String, _ open: Int, _ close: Int) {
        if current.count == 2 * A {
            result.append(current)
            return
        }
        if open < A {
            backtrack(current + "(", open + 1, close)
        }
        if close < open {
            backtrack(current + ")", open, close + 1)
        }
    }

    backtrack("", 0, 0)
    return result
}
print(generateParenthesis(2))
// MARK: - A SubSequence has exact same order which an array has
/*
 arr = [1,2,3,4,5]
SubSequence can be this [1,2,4] but can not be [2,3,1] because 1 is coming earlier in main array and it is not maintaining order
 
 | Aspect         | Subset                  | Subsequence              |
 | -------------- | ----------------------- | ------------------------ |
 | Order matters? | ❌ No                   | ✅ Yes                   |
 | Rearrangement  | Allowed                 | Not allowed              |
 | Derived from   | Any combination         | Original order only      |
 | Example valid  | \[3, 1] from \[1, 2, 3] | ❌ Not valid subsequence |
 
 // MARK: - Question Generate all SubSets of the given arr[]
                                Output
 A[] = [5   8]         |        [] [5] [8] [5,8]/ [8,5]
 
 
 Q: print all sub set for [7,9,4]
 
// MARK: - Solution
 */
func subsets(_ nums: [Int]) -> [[Int]] {
    var result = [[Int]]()
    var current = [Int]()

    func backtrack(_ start: Int) {
        print("Adding subset:", current)
        result.append(current)

        for i in start..<nums.count {
            print("Choose", nums[i])
            current.append(nums[i])       // Choose
            backtrack(i + 1)              // Explore
            print("Backtrack, remove", current.last!)
            current.removeLast()          // Un-choose (Backtrack)
        }
    }

    backtrack(0)
    return result
}

let subsetsResult = subsets([1, 2])
print("\nAll subsets:", subsetsResult)



// MARK: - Question (Print Path in a Stair Case)
/*
 A = 2
          ____
          |
     _____|
     |
 ____|
 
    [
        [1,1]
        ,
        [2]
    ]// Either we can take 1-1 steps or 2 steps at the same time
 
 For A = 3
    [
        [1,1,1],
        [1,2],
        [2,1]
    ]
 */
func printPaths(_ n: Int) -> [[Int]] {
    var result = [[Int]]()
    
    func backtrack(_ path: [Int], _ remaining: Int) {
        if remaining == 0 {
            result.append(path)
            return
        }
        if remaining >= 1 {
            backtrack(path + [1], remaining - 1)
        }
        if remaining >= 2 {
            backtrack(path + [2], remaining - 2)
        }
    }
    
    backtrack([], n)
    return result
}
// MARK: - A Single Function call is making 2 function calls for me

// MARK: - Question Print all paths from Source to Destination
/*
 S
 ____________
 |    |     |
 |    |     |
 |----|-----|
 |    |     |
 |____|_____|
    ----One more block here        D
 
 Paths are [[Down, Down, Right], [Right, Down, Down], [Down, Right, Down]]
 */
func printAllPaths() {
    var result: [[String]] = []
    //
    func travel(row: Int, col: Int, path: [String]) {
        if row == 2 && col == 1 {
            result.append(path)
            return
        }
        
        if row + 1 <= 2 {
            travel(row: row + 1, col: col, path: path + ["Down"])
        }
        if col + 1 <= 1 {
            travel(row: row, col: col + 1, path: path + ["Right"])
        }
    }
    //
    travel(row: 0, col: 0, path: [])
    //
    print(result)
}

printAllPaths()

