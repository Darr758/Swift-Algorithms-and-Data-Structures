//Recursive implementations for in-order, post-order and pre-order tree traversal
class TreeNode<T>{
    var value:T
    init(_ value:T){
        self.value = value
    }
    var left:TreeNode?
    var right:TreeNode?
}

func inOrder<T>(_ root:TreeNode<T>?){

    if root == nil{
        return
    }
    inOrder(root?.left)
    guard let value = root?.value else {return}
    print(value)
    inOrder(root?.right)
    
    return
}

func postOrder<T>(_ root:TreeNode<T>?){
    if root == nil{
        return
    }
    postOrder(root?.left)
    postOrder(root?.right)
    guard let value = root?.value else {return}
    print(value)
    
    return
}

func preOrder<T>(_ root:TreeNode<T>?){
    
    if root == nil{
        return
    }
    guard let value = root?.value else {return}
    print(value)
    preOrder(root?.left)
    preOrder(root?.right)
    
    return
}

