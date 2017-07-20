//check if a string has unique chars - that being no character is repeated (Including space chars)
//func uniqueChars(_ values:String) -> Bool{
//    var dictionary:[String:String] = [:]
//    
//    let valuesAsChar = values.characters.map{String($0)}
//    guard valuesAsChar.count > 1 else {return true}
//    for x in valuesAsChar{
//        if dictionary[x] != nil{
//            return false
//        }else{
//            dictionary[x] = x
//        }
//    }
//    return true
//}

func uniqueChars(_ values:String) -> Bool{
    var valuesAsChar = values.characters.map{String($0)}
    guard valuesAsChar.count > 1 else {return true}
    for x in 0..<valuesAsChar.count - 1{
        for y in x + 1..<valuesAsChar.count{
            if valuesAsChar[x] == valuesAsChar[y]{
                return false
            }
        }
    }
    return true
}

//Two options. 

