// MARK: - Maths Combinators
// Question: Given 10 girls and 7 boys, How many different pairs can be formed
/*
 Boys            |              Girls
 B1              |     G1,G2,G3,G4,G5,G6......G10
 
 
 
 
 
 Total pairs = Boys * Girls = 7 * 10 = 70 Pairs
 
 // MARK: - Whenever you see AND -> It means * (Multiplication)
 
 
 // MARK: - Number of ways to reach from Pune to Delhi = 6
           F1             F4
       /--------\     /---------\
      /   F2     \   /    F5     \
 Pune ----------Delhi-----------Agra
      \          /
       \________/
           F3
 
 // MARK: - If the conditions are OR then +(Addition)
 */
// MARK: - Permutation

/* Given 3 character distict character. How many ways can we arrange them.

abc
 
abc
acb

bac
bca
 
cba
cab
 
 Total 6
 
 Question
 
 String = Date
 
 N = 4, Combination to be made of 2 char pairs
 
 d -> a,t,e
 a -> d,t,e
 t -> d,a,e
 e -> d,a,t
 
 4*3 = 12 Pairs
 
 n n-1 n-2 n-3       n-r-1
 
 r is the rth position
 
 n * (n-1) * (n-2) : (n-r-1)
 
 Numnber of ways to arrange objects from N Distinct Objects = n! / (n-r)!
 
 DATE = n = 4, r = 2
 4!/ (4-2)! = 4*3*2*1/ 2*1 = 4*3 = 12 Pairs
 
 // MARK: - In Permutation the order matters, in COmbination the order does not matter
 
 // MARK: - Combination
 Question: Given 4 Players, How many ways to select 3 player
 
 {p1 p2 p3 p4}
 
 p1 p2 p3                   --
 p1 p3p p4                    |_ Total 4 Combination
 p1 p2 p4                     |
 p2 p3p p4                  --
 
 So the number of players to select are = 4! / 3!
 
 Number of ways to select R objects from N Objects = n! / (n-r)! * r! =? 4! / (4-3)! * 3! => 4! / 3! => 4
 
 // MARK: - 0! is 1
 
 # of ways to select 0 items from N Items = 0! = 1
 
 # of ways to select n items from N items = 1
 
 # of ways to select n-r item from n items => n!/ (n-(n-r))!*(n-r)! =>         n!
                                                                     ----------------------
                                                                       (n-(n-r))!*(n-r)!
 
 // MARK: - Special Property (Pascal's Identity formula)
 
 Lets say there are total N Players
 
 and there are total 2 teams, so on which team the nth player will go
 
 n                n-1                       n-1
  C       =         C          +              C
   r                r-1                        r
*/
// MARK: - Count all the divisor for N
/*
 N = 9
 Count of divisors are 3 = 1,3,9
 */
func countDivisor() -> Int {
    let n: Int = 10
    var count: Int = 0
    var index: Int = 1
    while(index * index <= n) {
        if n % index == 0 {
            if index * index == n {
                count += 1
            } else {
                count += 2
            }
        }
        index += 1
    }
    //
    return count
}
countDivisor()
// MARK: - Check Prime
func checkPrime(n : Int) -> Bool {
    if n < 2 {
        return false
    } else {
        if countDivisor() == 2 {
            return true
        }
    }
    return false
}
// MARK: - Print all prime number from 1-N
func isCheckPrime(n: Int) -> Bool {
    if n < 2 {
        return false
    }
    //
    var index: Int = 1
    var count: Int = 0
    //
    while(index * index <= n) {
        if n % index == 0 {
            if index * index == n {
                count += 1
            } else {
                count += 2
            }
        }
        index += 1
    }
    //
    return count == 2
}

func printPrime(n : Int) {
    for item in 2..<n {
        if isCheckPrime(n: item) {
            print(item)
        }
    }
}
printPrime(n: 10) // T.C. O(N*sqrt(N))
// MARK: - We need all the Prime Number from 1 - 50 With Sieve of Eratosthenes Algorithm







