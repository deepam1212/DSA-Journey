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
 
 
 */
