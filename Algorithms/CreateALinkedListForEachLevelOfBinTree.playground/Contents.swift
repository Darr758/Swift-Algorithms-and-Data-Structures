//Creates a linked list for each level of a binary tree
class Node<T>{
    var value:TreeNode<T>
    init(_ value:TreeNode<T>){
        self.value = value
    }
    var next:Node?
    var prev:Node?
}

class TreeNode<T>{
    var value:T
    init(_ value:T){
        self.value = value
    }
    var left:TreeNode?
    var right:TreeNode?
}

class Queue<T>{
    var head:Node<T>?
    var tail:Node<T>?
    
    func isEmpty() -> Bool{
        return head == nil
    }
    
    func add(_ value:TreeNode<T>){
        let node = Node(value)
        if let tail = self.tail{
            tail.next = node
            node.prev = tail
        }else{
            self.head = node
        }
        self.tail = node
    }
    
    func remove() -> TreeNode<T>?{
        if let returnNode = self.head{
            if let next = head?.next{
                self.head = next
            }else{
                head = nil
                tail = nil
            }
            return returnNode.value
        }else{
            return nil
        }
    }
}

class LinkedList<T>{
    var head:Node<T>?
    var tail:Node<T>?
    
    func isEmpty() -> Bool{
        return self.head == nil
    }
    
    func add(_ value:TreeNode<T>){
        let node = Node(value)
        if let tail = self.tail{
            tail.next = node
            node.prev = tail
        }else{
            self.head = node
        }
        self.tail = node
    }
    
    func remove(_ node:Node<T>) -> TreeNode<T>{
        
        let next = node.next
        let prev = node.prev
        
        if let prev = prev{
            prev.next = next
        }else{
            self.head = next
        }
        next?.prev = prev
        if next == nil{
            tail = prev
        }
        node.next = nil
        node.prev = nil
        return node.value
    }
}

func LLTree<T>(_ head:TreeNode<T>) -> [LinkedList<T>]{
    let queue = Queue<T>()
    
    var arrayOfLL:[LinkedList<T>] = []
    
    queue.add(head)
    var count = 1
    
    while !queue.isEmpty(){
        let listNode = LinkedList<T>()
        var tempCount = count
        count = 0
        while tempCount > 0{
            guard let node = queue.remove() else {break}
            tempCount -= 1
            if let left = node.left{
                queue.add(left)
                count += 1
            }
            if let right = node.right{
                queue.add(right)
                count += 1
            }
            listNode.add(node)
        }
        arrayOfLL.append(listNode)
    }
    return arrayOfLL
}


