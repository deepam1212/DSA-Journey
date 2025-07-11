// MARK: - Maths Combinators
// Question: Given 10 girls and 7 boys, How many different pairs can be formed
/*
 Boys            |              Girls
 B1              |                G1,G2,G3,G4,G5,G6......G10
 
 
 
 
 
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
 
 
*/
