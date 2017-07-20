//IM
class HashTable<key:Hashable, value>{
    
    private typealias Element = (key:key, value:value)
    private typealias Bucket = [Element]
    private var buckets:[Bucket]
    
    private(set) public var count = 0
    
    func isEmpty() -> Bool{
        return count == 0
    }
    
    init(_ capacity:Int){
        precondition(capacity > 0, "Capacity must be greater than zero")
        self.buckets = Array(repeatElement([], count: capacity))
    }
    
    public func getIndex(_ key:key) -> Int{
        return abs(key.hashValue)%buckets.count
    }
    
    public subscript(key:key) -> value?{
        get{
            return getValue(key)
        }
        set{
            if let value = newValue{
                updateValue(key:key,value:value)
            }else{
                removeValue(key)
            }
        }
    }
    
    public func getValue(_ key:key) -> value?{
        let index = getIndex(key)
        for element in buckets[index]{
            if element.key == key{
                return element.value
            }
        }
        return nil
    }
    
    public func updateValue(key:key, value:value) -> value?{
        let index = getIndex(key)
        for (i, element) in buckets[index].enumerated(){
            if element.key == key{
                let oldValue = element.value
                self.buckets[index][i].value = value
                return oldValue
            }
        }
        self.buckets[index].append(key:key,value:value)
        return nil 
    }
    
    public func removeValue(_ key:key) -> value?{
        let index = getIndex(key)
        for (i, element) in buckets[index].enumerated(){
            if element.key == key{
                let value = element.value
                buckets[index].remove(at:i)
                count -= 1
                return value
            }
        }
        return nil
    }
}

