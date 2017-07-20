//One potential implementation. Could also use a hashtable (dictionary) etc
func removeDups(_ value:String) -> String{
    
    var valueAsChars = value.characters.map{String($0)}
    
    var count =  valueAsChars.count
    guard count > 1 else {return value}
    var x = 0
    var y = 1
    while x < count - 1{
        while y < count{
            if valueAsChars[x] == valueAsChars[y]{
                valueAsChars.remove(at:y)
                count -= 1
            }else{
                y += 1
            }
        }
        x += 1
        y = x + 1
    }
    let returnString = toString(valueAsChars)
    
    return returnString
}

func toString(_ chars:[String]) -> String{
    
    var stringValue = ""
    
    for x in chars{
        stringValue += x
    }
    
    return stringValue
}

