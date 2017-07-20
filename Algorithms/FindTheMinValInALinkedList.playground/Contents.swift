public class Stack<T:Comparable>{
    
    var head:Node<T>?
    
    func getMin() -> T?{
        if let head = self.head{
            return head.min
        }else{
            return nil
        }
    }
    
    func isEmpty() -> Bool{
        return self.head == nil
    }
    
    func push(_ value:T){
        if let head = self.head{
            if head.min < value{
                let node = Node(value, head.min)
                node.next = head
                self.head = node
            }else{
                let node = Node(value, value)
                node.next = head
                self.head = node
            }
        }else{
            let node = Node(value, value)
            self.head = node
        }
    }
    
    func pop() -> Node<T>?{
        if let head = self.head{
            if let next = head.next{
                self.head = next
            }else{
                self.head = nil
            }
            return head
        }else{
            return nil
        }
    }
    
    
}

public class Node<T>{
    var value:T
    var min:T
    init(_ value:T, _ min:T){
        self.value = value
        self.min = min
    }
    var next:Node?
}


