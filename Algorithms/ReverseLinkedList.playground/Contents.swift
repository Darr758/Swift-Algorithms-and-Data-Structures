
 public class ListNode {
     public var val: Int
     public var next: ListNode?
     public init(_ val: Int) {
             self.val = val
                 self.next = nil
         }
}

func reverseList(_ head: ListNode) -> ListNode {
    var prev:ListNode?
    var x = head
    while let next = x.next{
        x.next = prev
        prev = x
        x = next
    }
    x.next = prev
    return x
}

