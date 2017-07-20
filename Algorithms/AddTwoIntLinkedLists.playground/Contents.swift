//Add two 
class Node{
    var value:Int
    init(_ value:Int){
        self.value = value
    }
    var next:Node?
    var prev:Node?
}

func addTwoNumbers(_ h1: inout Node, h2: inout Node) -> Node{
    
    var h1Val = h1.value
    var h2Val = h2.value
    
    var multiplier = 10
    
    while let h1Next = h1.next{
        h1Val = h1Val + (h1Next.value * multiplier)
        h1 = h1Next
        print(h1Val)
        multiplier = multiplier * 10
    }
    
    multiplier = 10
    
    while let h2Next = h2.next{
        h2Val = h2Val + (h2Next.value * multiplier)
        h2 = h2Next
        print(h2Val)
        multiplier = multiplier * 10
    }
    
    var finalValue = h1Val + h2Val
    
    let temp = finalValue % 10
    finalValue = finalValue/10
    
    let returnNode = Node(temp)
    var connector = returnNode
    while finalValue > 0{
        let val = finalValue%10
        finalValue = finalValue/10
        let node = Node(val)
        connector.next = node
        connector = node 
    } 
    
    return returnNode
}

var a = Node(3)
var b = Node(1)
var c = Node(5)
var d = Node(5)
var e = Node(9)
var f = Node(2)

a.next = b
b.next = c
d.next = e
e.next = f

var node = addTwoNumbers(&a, h2: &d)
node.value
node.next?.value
node.next?.next?.value
