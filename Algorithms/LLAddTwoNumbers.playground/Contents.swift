//Add two numbers represented by a linked list. 
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
      self.val = val
      self.next = nil
    }
}

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    let primary = ListNode(0)
    var node:ListNode = primary
    
    var leftNode = l1
    var rightNode = l2
    
    var leftVal = 0
    var rightVal = 0
    
    while let val = leftNode?.val {
        leftNode = leftNode?.next
        leftVal += val
        guard leftNode != nil else { continue }
        leftVal = leftVal * 10
    }
    
    while let val = rightNode?.val{
        rightNode = rightNode?.next
        rightVal += val
        guard rightNode != nil else { continue }
        rightVal = rightVal * 10
    }
    
    var finalVal = leftVal + rightVal
    while(finalVal > 0){
        node.next = ListNode(finalVal % 10)
        finalVal = finalVal/10
        node = node.next!
        
    }
    node = ListNode(finalVal)
    
    return primary.next
}


