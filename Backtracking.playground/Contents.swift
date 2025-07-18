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



