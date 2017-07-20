//Determi
public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init(_ val: Int) {
      self.val = val
      self.next = nil
  }
}

func isPalindrome(_ head: ListNode?) -> Bool {
    
    guard head != nil else {return true}
    
    var slow = head; var fast = head?.next
    
    while fast != nil && fast?.next?.next != nil{
        fast = fast?.next?.next
        slow = slow?.next
    }
    fast = head
    
    slow = reverseSLL(slow!)

    while slow != nil && fast != nil{
        guard slow?.val == fast?.val else {return false}
        slow = slow?.next
        fast = fast?.next
    }

    return true
}

func reverseSLL(_ head: ListNode) -> ListNode{
    var prev:ListNode?
    var x = head
    while let next = x.next {
        x.next = prev
        prev = x
        x = next
    }
    x.next = prev
    
    return x
}
