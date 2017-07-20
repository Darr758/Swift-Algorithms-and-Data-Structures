//Using only stack operations and comparisons sort a stack from lowest to highest 
class Stack<T:Comparable>{
    
    var stack:[T?]
    var capacity:Int
    var stackPointer = 0
    init(_ stackCapacity:Int){
        self.capacity = stackCapacity
        stack = Array(repeatElement(nil, count:stackCapacity))
    }
    
    func push(_ value:T?){
        guard stackPointer < capacity else {return}
        stack[stackPointer] = value
        stackPointer += 1
    }
    
    func pop() -> T?{
        stackPointer -= 1
        guard stackPointer >= 0 else {stackPointer = 0; return nil}
        guard let value = stack[stackPointer] else {return nil}
        stack[stackPointer] = nil
        return value
    }
    
    func peek() -> T?{
        return stack[stackPointer - 1]
    }
    
    func isEmpty() -> Bool{
        return stack[0] == nil
    }
    
}

func sortStack<T>(_ stack:Stack<T>) -> Stack<T>{
    let sortedStack = Stack<T>(stack.capacity)
    
    while !stack.isEmpty(){
        let value = stack.pop()
        while !sortedStack.isEmpty() && sortedStack.peek()! > value!{
            stack.push(sortedStack.pop())
        }
        sortedStack.push(value)
    }
    
    return sortedStack
}


