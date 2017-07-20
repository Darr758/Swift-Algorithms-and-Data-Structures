//Find the largest value per row of a tree
class TreeNode {
  public var val: Int
  public var left: TreeNode?
  public var right: TreeNode?
  public init(_ val: Int) {
      self.val = val
      self.left = nil
      self.right = nil
  }
}

func largestValues(_ root: TreeNode?) -> [Int] {
    
    var answer:[Int] = []
    
    let queue = BFSQueue()
    
    guard let root = root else {return answer}
    
    queue.enqueue(root)
    
    var searchVal = 1
    var addedNodes = searchVal
    
    while !queue.isEmpty(){
        
        var currentMax:Int?
        
        searchVal = addedNodes
        addedNodes = 0
        
        for _ in 0..<searchVal{
            
            let node = queue.dequeue()
            
            if let left = node?.treeNode.left{
                queue.enqueue(left)
                addedNodes += 1
            }
            
            if let right = node?.treeNode.right{
                queue.enqueue(right)
                addedNodes += 1
            }
            
            
            guard let value = node?.treeNode.val else {continue}
            
            if currentMax == nil || value > currentMax!{
                currentMax = value
            }
            
        }
        
        guard let max = currentMax else {continue}
        
        answer.append(max)

    }
    
    return answer
    
}

class BFSQueue{
    var head:Node?
    var tail:Node?
    
    func enqueue(_ value:TreeNode){
        
        let newNode = Node(value)
        
        if let tail = self.tail{
            tail.next = newNode
            newNode.prev = tail
        }else{
            self.head = newNode
        }
        self.tail = newNode
    }
    
    func dequeue() -> Node?{
        
        if let head = self.head{
            
            if let next = head.next{
                self.head = next
            }else{
                self.head = nil
                self.tail = nil
            }
            
            return head
            
        }else{
            return nil
        }
        
    }
    
    func isEmpty() -> Bool{
        return head == nil
    }
}

class Node{
    
    var treeNode:TreeNode
    init(_ treeNode:TreeNode){
        self.treeNode = treeNode
    }
    var next:Node?
    var prev:Node?
    
}

var a = TreeNode(3)
var b = TreeNode(30)
var c = TreeNode(10)
var d = TreeNode(15)
var e = TreeNode(45)
var f = TreeNode(699)


a.left = nil
a.right = b
b.left = c
b.right = nil
d.right = e
d.left = f
c.right = d

largestValues(a)

