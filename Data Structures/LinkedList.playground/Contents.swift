public class Node<T>{
    var value:T
    init(value:T){
        self.value = value
    }
    var next:Node?
    weak var prev:Node?
}

public class LinkedList<T>{
    private var head:Node<T>?
    private var tail:Node<T>?
    
    func isEmpty() -> Bool{
        return self.head == nil
    }
    
    func getHead() -> Node<T>?{
        return self.head
    }
    
    func getTail() -> Node<T>?{
        return self.tail
    }
    
    func append(value:T) -> T{
        let newNode = Node(value:value)
        if let tail = self.tail{
            tail.next = newNode
            newNode.prev = tail
        }else{
            head = newNode
        }
        self.tail = newNode
        
        return value
    }
    
    func removeAll(){
        self.head = nil
        self.tail = nil
    }
    
    func delete(node:Node<T>) -> T{
        let next = node.next
        let prev = node.prev
        if let prev = prev{
            prev.next = next
        }else{
            head = next
        }
        
        next?.prev = prev
        if next == nil{
            tail = prev
        }
        
        node.prev = nil
        node.next = nil
        
        return node.value
    }
    
    func nodeAt(index:Int) -> Node<T>? {
        if index >= 0{
            var node = head
            var i = index
            while node != nil{
                if i == 0{ return node}
                node = node?.next
                i -= 1
            }
        }
        return nil
    }
}

extension LinkedList:CustomStringConvertible{
    public var description: String{
        var text = "("
        var node = self.getHead()
        while node != nil{
            text += node?.value as! String
            node = node?.next
            if node != nil{
                text += ", "
            }
        }
        text += ")"
        return text
    }
    
}
