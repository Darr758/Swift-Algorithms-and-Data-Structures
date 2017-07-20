//Find the looping node in a corrupted Linked List eg a - > b - > c -> d - > e - > c <== C is the looping node 

class Node{
    var value:String
    init(_ value:String){
        self.value = value
    }
    var next:Node?
    var prev:Node?
}
func findCorruption(_ head:Node) -> Node?{
    var node = head
    var dictionary:[String:Node] = [:]
    dictionary[node.value] = node
    while let next = node.next{
        if dictionary[next.value] != nil{
            return next
        }else{
            dictionary[next.value] = next
        }
        node = next
    }
    
    return nil 
}

