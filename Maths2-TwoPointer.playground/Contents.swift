// MARK: - Math 2 & Two Pointer


// MARK: - Question (Excel-style column naming)
/*
 Concept:
 Think of it as a base-26 numeral system, where:

 A = 0

 B = 1

 ...

 Z = 25

 Then:

 AA = 26

 AB = 27

 ...

 AZ = 51

 BA = 52

 ...

 ZZ = 701

 AAA = 702

 AAB = 703

 ...
 
 
 
 
 
 */
// MARK: - Question (Sorted Permutation Rank)
/*
 Given a String A. Find the Rank of the String amongst its permutations sorted lexicographically. Assuem no char are repeated.
 
 Rank of "ACB"
 
 */
// MARK: - Question, SubArray with Sum == k
/*
 
 A = [1,3,15,10,20,3,23], k = 33
 B.F. = Find all sub Array and match it with k if found return true
 
        1  3   15  10  20  3   23
 l
 r

        0   1   2   3   4   5   6       k = 33
        1   3   15  10  20  3   23
        l = 0th index
        r = 0th index
 
        0   1   2   3   4   5   6       k = 33
        1   3   15  10  20  3   23
        
 
 l      r       sum
 0      0        1      r++
 0      1        4      r++
 0      2       19      r++
 0      3       29      r++
 0      4       49      l++
 1      4       48      l++
 2      4       45      l++
 3      4       30      r++
 3      5       33      Found
 
 */
// MARK: - Container with Most Water

/*
 A = 4  2   10  6   8   2   6   2
 
 
    B.F.
 
 l = 0...n
 r = i + 1...n
 
 min(A[i], A[j]) * r - l
 
 T.C. = O(N^2)
 
 // MARK: - Optimized Approach
 
        100    1      100     2      3       5
 index   0     1       2      3      4       5
Pointer  l                                   r
 
 
 l      r       min Al, Ar      Width       area
 100    5           5             5          25// Now decrement r because we have larger height in l
 100    4           3             4          12// r -= 1
 100    3           2             3          6// r -= 1
 100    2           100           2          200// Now do anything r -= 1 || l += 1
 1      100         1             1          100
 
 
 
 
 
 */

