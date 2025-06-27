// MARK: - Trees


// Binary Tree - Every Node has atmax 2 Children (0,1,2)

// MARK: - Height in a Binary Tree
/*
 🌳 Height in Trees (Simple Explanation)

 
 The height of a node in a tree is the number of edges on the longest path from that node down to a leaf.


    A         <-- Height 2
   / \
  B   C       <-- Height 1
 / \   \
D   E   F     <-- Height 0
 
 Node D, E, F → height = 0 (they're leaf nodes)

 Node B, C → height = 1 (they each have 1 level of children)

 Node A → height = 2 (the longest path to a leaf is 2 edges)
 
 */
// MARK: - Depth in Binary Tree
/*
 The depth of a node in a tree is the number of edges from the root to that node.

 🔑 Key Points:
 The root node has depth 0.

 Each level down from the root increases the depth by 1.

 Depth helps in understanding how far a node is from the top of the tree.
 
    A         <-- Depth 0
   / \
  B   C       <-- Depth 1
 / \   \
D   E   F     <-- Depth 2

 
 Node A → depth = 0

 Node B, C → depth = 1

 Node D, E, F → depth = 2
 */
// MARK: - Leaft Node
/*
 A leaf node in a tree is a node that does not have any children.

 Key Points:
 It's the end point of a path in the tree.

 It has no left or right child (in a binary tree).

 In general trees (non-binary), it has no children at all.
 
        5
       / \
      3   8
     / \
    1   4

 Here:

 Leaf nodes are: 1, 4, and 8 (because they don't have children).

 Nodes 5 and 3 are not leaf nodes because they have at least one child.

 */

// MARK: - Types of the Binary Tree

/*
 1. Proper Binary Tree (Strict Binary Tree)
 
 Every Node has either 0 or 2 Nodes
 
 
        1
       / \
      2   3
     / \ / \
    4   5 6  7

2. Complete Binary Tree (All levels are filled except possibly the Last Level which is filled left to right)
 
        1               Level 1
       / \
      2   3             Level 2
     / \  /
    4  5 6              Level 3(Left to right means nfirst the left part must filll then the right part then it will be a complete binary tree)
 
 if it is like this

      1               Level 1
     / \
    2   3             Level 2
        /
       6              Level 3

 This is not a complete binary tree as the right part is filled first
 
 */

