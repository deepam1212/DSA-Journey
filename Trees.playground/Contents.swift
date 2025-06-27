// MARK: - Trees


// Binary Tree - Every Node has atmax 2 Children (0,1,2)
// MARK: - Real World Programming Scenarios like (Folder Structure)

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
     / \
    4   5

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
 
 3. Perfect Binary Tree: All Nodes have 2 children except leaf nodes and all the leaf nodes must be at the same level
        1
       / \
      2   3
     / \   \
    4   5 6  7

 
 // MARK: - A Perfect Binary Tree is a complete and Proper Binary Tree
 
 
 // MARK: - Binary Tree Traversal
 
 1. Pre Order Traversal
 2. In order Traversal
 3. Post Order Traversal
 
 
 // MARK: - 1. Pre Order Traversal (Node  -> Left -> Right)
 
 
    1               Level 1
   / \
  2   3             Level 2
     /
    6               Level 3

 Node -> Left -> Right
 
 1 -> 2 -> 3 -> 6

 
 
 
 example of Pre order traversal is of reorder(rootNode: Tree?) function, as we are using recursing, whenever the root node is nil, we will be returning from the function, and for all the Left & the right Node we will use recursion
 */

class Tree {
    var value: Int?
    var leftNode: Tree?
    var rightNode: Tree?
    
    init(value: Int? = nil, leftNode: Tree? = nil, rightNode: Tree? = nil) {
        self.value = value
        self.leftNode = leftNode
        self.rightNode = rightNode
    }
    
    func reorder(rootNode: Tree?) {
        if rootNode == nil {
            return
        }
        print(rootNode?.value ?? 0)// Node
        reorder(rootNode: rootNode?.leftNode)// Left
        reorder(rootNode: rootNode?.rightNode) // Right
    }
}

let rootNode: Tree = Tree(value: 0)
rootNode.leftNode = Tree(value: 1)
rootNode.leftNode?.leftNode = Tree(value: 11)
rootNode.leftNode?.rightNode = Tree(value: 12)
rootNode.rightNode = Tree(value: 2)
rootNode.reorder(rootNode: rootNode)
// MARK: - T.C. of this Traversal is O(N), as there are N Nodes in this Traversal

/*
// MARK: - 2. In-Order Traversal (L N R)
 

 
        1               Level 1
       / \
      2   3             Level 2
     / \   \
    4   5   6           Level 3
       /   / \
      7   8   9         Level 4
 
 Left -> Node -> Right
 
 4 -> 2 -> 7 -> 5 -> 1 -> 3 -> 8 -> 6 -> 9
 */

// MARK: - 3. Post Order Traversal (Left -> Right -> Node)
/*
        1               Level 1
       / \
      2   3             Level 2
     / \   \
    4   5   6           Level 3
       /   / \
      7   8   9         Level 4

 4 -> 7 -> 5 -> 2 -> 8 -> 9 -> 6 -> 3 -> 1
 
 
 */

// MARK: - Iterative InOrder
// Normally we use recursion, but iterative means using a stack instead of function calls.


// MARK: - Level Order Traversal
/*
 Print all the Nodes in all the Levels
 
        1               Level 1
       / \
      2   3             Level 2
     / \   \
    4   5   6           Level 3
       /   / \
      7   8   9         Level 4

 1 -> 2 -> 3 -> 4 -> 5 -> 6 -> 7 -> 8 -> 9
 
 
 Print all the Nodes in Level 0
 Print all the Nodes in Level 1
 Print all the Nodes in Level 2 and so and so
 
 
 
 */
