// MARK: - Binary Search Tree Explanation


// MARK: - For Binary Tree to be a Binary Search Tree, all the values in the left must be less than or equal to be x and all the values in the right must be strictly greater than x (x is the  root Node)
/*
 
        10
        /\
       /  \
      5   13
     / \
    7  11
 
 This is not BST as all the values of X must be less or equal to x, as 11 is greater than 10
 
            10
           /
          8
         /
        7
       /
      6
     /
    5
 
 Yes this is a BST, as BST is does not needs to be Balanced
 
 // MARK: - Search in a BST, k = 9
 
 
                5           Height = 0
              /   \
             3     8        Height = 1
            / \   / \
           1   2 7   9      Height = 2
 
 T.C. of Searching in BST is O(Height)
 */

func findElementInBST() {
    
}

// MARK: - Insertion in BST


