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

// MARK: - Most Difficult (Deletion in a BST)
 // MARK: - Construct a BST from Sorted Array
/*
 var : [Int] = [-1, 3, 4, 6, 7, 8, 10, 13, 14]
 */
class TreeNode {
    var val: Int?
    var leftNode: TreeNode?
    var rightNode: TreeNode?
    
    init(val: Int? = nil, leftNode: TreeNode? = nil, rightNode: TreeNode? = nil) {
        self.val = val
        self.leftNode = leftNode
        self.rightNode = rightNode
    }
}
/*
 
 
 */

func constructBstFromSortedArr(nums: [Int]) -> TreeNode? {
    func buildTree(start: Int, end: Int) -> TreeNode? {
        if start > end {
            return nil// Edge Case
        }
        //
        let mid = (start + end) / 2
        var rootNode: TreeNode = TreeNode(val: nums[mid])
        rootNode.leftNode = buildTree(start: 0, end: mid - 1)
        rootNode.rightNode = buildTree(start: mid + 1, end: end)
        return rootNode
    }
    return buildTree(start: 0, end: nums.count - 1)
}
print("constructBstFromSortedArr", constructBstFromSortedArr(nums: [-1, 3, 4, 6, 7, 8, 10, 13, 14])?.val)
// MARK: - Microsoft Question (Given Binary Tree is a BST or Not)

// MARK: - Inorder Traversal of BST is always Sorted (Inorder LNR)
/*
 aaabbb
 aaabb
 aaabb
 aaabb
 aabbb
 aabbb
 aabbb
 ab
 */
