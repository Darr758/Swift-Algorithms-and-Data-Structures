//Create a queue from two stacks 
class Stack<T>{
    var stack:[T?]
    var top = 0
    var capacity:Int
    init(_ capacity:Int){
        stack = Array(repeatElement(nil, count:capacity))
        self.capacity = capacity
    }
    
    func push(_ value:T?){
        guard top < capacity else {return}
        self.stack[top] = value
        top += 1
    }
    
    func pop() -> T?{
        top -= 1
        if top < 0{
            top = 0
        }
        if let value = self.stack[self.top]{
            self.stack[self.top] = nil
            return value
        }
        return nil
    }
    
    func isEmpty() -> Bool{
        return self.stack[0] == nil
    }
}

class QueueUsingStack<T>{
    var stackOne:Stack<T>
    var stackTwo:Stack<T>
    
    init(_ capacity:Int){
        self.stackOne = Stack(capacity)
        self.stackTwo = Stack(capacity)
    }
    
    func add(_ value:T){
        stackOne.push(value)
    }
    
    func remove() -> T?{
        while !stackOne.isEmpty(){
            self.stackTwo.push(self.stackOne.pop())
        }
        let value = stackTwo.pop()
        while !stackTwo.isEmpty(){
            self.stackOne.push(self.stackTwo.pop())
        }
        return value
    }
    
}


