func stringPermutations(_ stringVal:String) -> [String]{
    
    var returnArray:[String] = []
    
    returnArray.append(stringVal)
    
    var characterArray = stringVal.characters.map{String($0)}
    
    while true{
        for x in 0..<characterArray.count - 1{
            swap(&characterArray[x], &characterArray[x + 1])
            let permutation = toString(characterArray)
            if permutation != stringVal{
                returnArray.append(permutation)
            }else{
                return returnArray
            }
        }
    }
}

func toString(_ characterArray:[String]) -> String{
    var returnString = ""
    for x in 0..<characterArray.count{
        returnString += String(characterArray[x])
    }
    return returnString
}

