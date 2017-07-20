//Fnd the first common ancestor of two nodes in a binary tree
class TreeNode<T>{
    var value:T
    init(_ value:T){
        self.value = value
    }
    var left:TreeNode?
    var right:TreeNode?
}


func findAncestor<T>(root:TreeNode<T>, nodeOne:TreeNode<T>, nodeTwo:TreeNode<T>) -> TreeNode<T>{
    if let left = root.left{
        if belowNode(root:left, node:nodeOne) && belowNode(root:left, node:nodeTwo){
            return findAncestor(root:left, nodeOne:nodeOne, nodeTwo:nodeTwo)
        }
    }
    if let right = root.right{
        if belowNode(root:right, node:nodeOne) && belowNode(root:right, node:nodeTwo){
            return findAncestor(root:right, nodeOne:nodeOne, nodeTwo:nodeTwo)
        }
    }
    return root
}

func belowNode<T>(root:TreeNode<T>?, node:TreeNode<T>) -> Bool{
    guard let root = root else {return false}
    
    if root === node{
        return true
    }
    
    return belowNode(root:root.left, node:node) || belowNode(root:root.right, node:node)
    
}
