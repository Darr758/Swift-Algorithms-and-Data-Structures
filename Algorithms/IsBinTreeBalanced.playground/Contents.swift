//Determine if a binary tree is balanced
class TreeNode<T>{
    var value:T
    init(_ value:T){
        self.value = value
    }
    var parent:TreeNode?
    var right:TreeNode?
    var left:TreeNode?
    
    func isLeaf() -> Bool{
        return right == nil && left == nil
    }
}

class Node<T>{
    var value:TreeNode<T>
    init(_ value:TreeNode<T>){
        self.value = value
    }
    var next:Node?
    var prev:Node?
}

class Stack<T>{
    var head:Node<T>?
    
    func push(_ node:Node<T>){

        if let head = head{
            node.next = head
            head.prev = node
        }
        self.head = node
    }
    
    func pop() -> Node<T>?{
        if let head = head{
            let node = head
            if let next = node.next{
                head.next = nil
                next.prev = nil
                self.head = next
            }else{
                self.head = nil
            }
            return node
        }
        return nil
    }
    
    func isEmpty() -> Bool{
        return self.head == nil
    }
}

func checkIfBalanced<T>(_ head:TreeNode<T>) -> Bool{
    var depth = 0
    var node = head
    while let left = node.left{
        depth += 1
        node = left
    }
    
    let stack = Stack<T>()
    stack.push(Node(head))
    
    while !stack.isEmpty(){
        let value = stack.pop()!.value
        if value.isLeaf(){
            let distance = distanceToRoot(value)
            if abs(depth - distance) > 1{
                return false
            }else{
                continue
            }
        }
        if let right = value.right{
            stack.push(Node(right))
        }
        if let left = value.left{
            stack.push(Node(left))
        }	
    }
    return true
}

func distanceToRoot<T>(_ leaf:TreeNode<T>) -> Int{
    var node = leaf
    var distance = 0
    while let parent = node.parent{
        node = parent 
        distance += 1
    }
    return distance
}


