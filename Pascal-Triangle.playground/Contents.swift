// MARK: - Pascal Triangle
/*
 A[i][j] = i
            C
             j
 
     0    1    2   3
 0  00
 
 1  10   11
 
 2  20   21   22
 
 3  30   31   32  33
 
                                    N
 Given N = 3, R = 2, Calculate     C
                                  R
 
         N!                  3!
 ------------------- = --------------- = 3
     (N-R)! R!             1! * 2!
 
 T.C. = O(N)
 S.C. = O(1)
 
 // MARK: - R can not be greater than N
 
 1
 1  1
 1  2  1 => 1 + 1 = 2
 1  3  3  1 => 1 + 2 = 3, 2 + 1 = 3
 1  4  6  4  1 => 1 + 3 = 4, 3 + 3 = 6, 3 + 1 = 4
 
 It comes with the addition of this, like we get the element using this: A[i][j] = A[i-1][j-1] + A[i-1][j]
 */

func generateArr(n: Int) -> [[Int]] {
    var arr: [[Int]] = []

    for i in 0...n {
        arr.append(Array(repeating: 0, count: i + 1))

        arr[i][0] = 1                   // First column
        arr[i][i] = 1                   // Diagonal

        if i > 1 {
            for j in 1..<i {
                arr[i][j] = arr[i-1][j-1] + arr[i-1][j]
            }
        }
    }

    return arr
}
print(generateArr(n: 5))
// MARK: - We do not consider output space for S.C. Calculation so S.C. is O(1) & T.C. O(n)

// MARK: - Question Count the Factors for 1 to N
/*
 N = 10
 
 For optimized Approach Need to Study `Sieve of Eratosthenes Algorithm`
 */
func countFactorsUpToN(_ N: Int) -> [Int] {
    // Initialize an array of size N+1 with all zeroes
    var factors = [Int](repeating: 0, count: N + 1)

    // For each number i from 1 to N
    for i in 1...N {
        // Add i as a factor to all its multiples
        var j = i
        while j <= N {
            factors[j] += 1
            j += i
        }
    }

    return factors
}
// MARK: - Question Givena Sorted Array A and an Int K, Find pair (i, j) such that Ai + Aj == k ** i != j






