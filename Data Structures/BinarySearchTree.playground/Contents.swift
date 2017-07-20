//Binary search tree with some search capabilities 
public class BinarySearchTree<T:Comparable>{
    private(set) public var value:T
    private(set) public var parent:BinarySearchTree?
    private(set) public var left:BinarySearchTree?
    private(set) public var right:BinarySearchTree?
    
    init(value:T){
        self.value = value
    }
    
    func isRoot() -> Bool{
        return self.parent == nil
    }
    
    func isLeaf() -> Bool{
        return self.right == nil && self.left == nil
    }
    
    func hasLeftChild() -> Bool{
        return self.left != nil
    }
    
    func hasRightChild() -> Bool{
        return self.right != nil
    }
    
    func hasBothChildren()-> Bool{
        return self.hasLeftChild() && self.hasRightChild()
    }
    
    func isLeftChild() -> Bool{
        return self.parent?.left === self
    }
    
    func isRightChild() -> Bool{
        return self.parent?.right === self
    }
    
    func count() -> Int{
        return (self.left?.count() ?? 0) + 1 + (self.right?.count() ?? 0)
    }
    
    convenience init(array:[T]){
        precondition(array.count > 0)
        self.init(value:array[0])
        for a in array.dropFirst(){
            insert(a)
        }
        
    }
    
    func insert(_ newValue:T){
        if newValue < self.value{
            if let left = self.left{
                left.insert(newValue)
            }else{
                left = BinarySearchTree(value:newValue)
                left?.parent = self
            }
        }else{
            if let right = self.right{
                right.insert(newValue)
            }else{
                right = BinarySearchTree(value:newValue)
                right?.parent = self
            }
        }
    }
    
    func search(searchValue:T) -> BinarySearchTree?{
        if searchValue < self.value{
            return left?.search(searchValue:searchValue)
        }else if searchValue > self.value{
            return right?.search(searchValue:searchValue)
        }else{
            return self
        }
    }
    
    func reconnectWithParent(node:BinarySearchTree?){
        if let parent = self.parent{
            if isLeftChild(){
                parent.left = node
            }else{
                parent.right = node
            }
            node?.parent = parent
        }
    }
    
    func minimum() -> BinarySearchTree{
        var node = self
        while let next = node.left{
            node = next
        }
        return node
    }
    
    func maximum() -> BinarySearchTree{
        var node = self
        while let next = node.right{
            node = next
        }
        return node
    }
    
    func deleteNode() -> BinarySearchTree?{
        
        let replacement:BinarySearchTree?
        
        if let right = self.right{
            replacement = right.minimum()
        }else if let left = self.left{
            replacement = left.maximum()
        }else{
            replacement = nil
        }
        
        replacement?.deleteNode()
        
        replacement?.left = left
        replacement?.right = right
        left?.parent = replacement
        right?.parent = replacement
        self.reconnectWithParent(node:replacement)
        
        parent = nil
        left = nil
        right = nil
        
        return replacement
        
    }
    
    func getHeight() -> Int{
        
        if isLeaf(){
            return 0
        }else{
            return 1 + max(left?.getHeight() ?? 0, right?.getHeight() ?? 0)
        }
        
    }
    
    func getDepth() -> Int{
        if isRoot(){
            return 0
        }else{
            var edges = 0
            var node = self
            while let parent = node.parent{
                node = parent
                edges += 1
            }
            return edges
        }
    }
    
    func predecessor() -> BinarySearchTree<T>?{
        if let left = self.left{
            return left.maximum()
        }else{
            let originalValue = self.value
            var node = self
            while let parent = node.parent{
                if parent.value < originalValue {return parent}
                node = parent
            }
            return nil
        }
    }
    
    func successor() -> BinarySearchTree<T>?{
        if let right = self.right{
            return right.minimum()
        }else{
            let originalValue = self.value
            var node = self
            while let parent = node.parent{
                if parent.value > originalValue {return parent}
                node = parent
            }
            return nil
        }
    }
    
}
extension BinarySearchTree: CustomStringConvertible{
    public var description:String{
        var s = ""
        if let left = self.left{
            s += "\(left.description) <- "
        }
        s += "\(value)"
        
        if let right = self.right{
            s += " -> \(right.description)"
        }
        return s
    }
}

public class Stack{
    
    var top:Node?
    
    init(_ top:BinarySearchTree<Int>){
        let newNode = Node(top)
        self.top = newNode
    }
    
    func push(_ node:BinarySearchTree<Int>){
        let newNode = Node(node)
        if top != nil{
            newNode.setNext(top!)
            top = newNode
        }else{
            top = newNode
        }
    }
    
    func pop() -> BinarySearchTree<Int>?{
        
        guard let node = top else { return nil }
        
        top = node.next
        
        return node.value
        
    }
    
}

public class FIFOQueue{
    
    var front:Node?
    var end:Node?
    
    init(_ node:BinarySearchTree<Int>){
        let newNode = Node(node)
        self.front = newNode
        self.end = newNode
    }
    
    func enqueue(_ node:BinarySearchTree<Int>){
        let newNode = Node(node)
        if let end = self.end{
            end.setNext(newNode)
            self.end = newNode
        }else{
            front = newNode
            end = newNode
        }
    }
    
    func dequeue() -> BinarySearchTree<Int>?{
        if let front = self.front{
            let returnVal = front.value
            self.front = front.next
            if self.front == nil {
                self.end = nil
            }
            return returnVal
        }else{
            return nil
        }
    }
    
}

public class Node{
    private(set) public var value:BinarySearchTree<Int>?
    private(set) public var next:Node?
    
    init(_ value:BinarySearchTree<Int>) {
        self.value = value
    }
    
    func setNext(_ node:Node){
        self.next = node
    }
    
}

func depthFirstSearch(_ value:Int, firstNode:BinarySearchTree<Int>){
    
    let stack = Stack(firstNode)
    
    while let current = stack.pop() {
        
        let currentVal = current.value
        if value == currentVal{
            break
        }else{
            
            if let right = current.right{
                stack.push(right)
            }
            if let left = current.left{
                stack.push(left)
            }
            
            print(currentVal)
        }
    }
    
}

func breathFirstSearch(_ value:Int, firstNode:BinarySearchTree<Int>){
    let queue = FIFOQueue(firstNode)
    
    while let current = queue.dequeue() {
        
        print(current.value)
        if current.value == value{
            print("found value")
            break
        }
        
        if let left = current.left{
        
            queue.enqueue(left)
            
        }
        if let right = current.right{
        
            queue.enqueue(right)
            
        }
        
    }
}










