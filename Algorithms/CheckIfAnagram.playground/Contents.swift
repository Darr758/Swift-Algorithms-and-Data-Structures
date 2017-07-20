func isAnagram(_ x:String, _ y:String) -> Bool{
    
    let xChars = x.lowercased().characters.map{String($0)}
    
    let yChars = y.lowercased().characters.map{String($0)}
    
    var storage:[String:Int] = [:]
    
    var xCount = 0
    
    for char in xChars{
        let val = storage[char]
        if char == " " {continue}
        if var val = val{
            val += 1
            storage[char] = val
        }else{
            storage[char] = 1
        }
        xCount += 1
        
    }
    
    var yCount  = 0
    
    for char in yChars{
    
        let val = storage[char]
        if char == " " {continue}
        if var val = val{
            val -= 1
            if val == 0{
                storage[char] = nil
            }else{
                storage[char] = val
            }
            yCount += 1
        }else{
            return false
        }
        
    }
    
    if xCount != yCount{
        return false
    }

    
    return true
}


