//Recursively create a balanced binary tree (Not binary search tree) from a sorted array
class TreeNode<T>{
    var value:T
    init(_ value:T){
        self.value = value
    }
    var left:TreeNode?
    var right:TreeNode?
}
//extension TreeNode: CustomStringConvertible{
//    public var description:String{
//        var s = ""
//        if let left = self.left{
//            s += "\(left.description) <- "
//        }
//        s += "\(value)"
//        
//        if let right = self.right{
//            s += " -> \(right.description)"
//        }
//        return s
//    }
//}

func createBalancedTree<T>(_ array:[T]) -> TreeNode<T>?{
    
    let mid = array.count/2

    guard array.count > 0 else {return nil}
    
    let node = TreeNode(array[mid])

    node.left = createBalancedTree(Array(array[0..<mid]))

    node.right = createBalancedTree(Array(array[mid + 1..<array.count]))


    
    return node
    
    
}
