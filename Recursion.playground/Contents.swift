// MARK: - All About Recursion in DSA


/*
 A function that calls itself is known as a recursive function. And, this technique is known as recursion.

 A physical world example would be to place two parallel mirrors facing each other. Any object in between them would be reflected recursively.
 */

func recursive(n: Int) -> Int {
    var output = n + 1
    if output < 5 {
        return recursive(n: output)
    } else {
        return output
    }
}
recursive(n: 1)
