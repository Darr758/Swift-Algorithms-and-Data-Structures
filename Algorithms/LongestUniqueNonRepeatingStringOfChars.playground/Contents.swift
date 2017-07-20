//Find the longest non repeating sequence of letters in a string eg abcc == abc.
func lengthOfLongestSubstring(_ s: String) -> String {
    var max = 1
    var currentMax = 1
    var startIndexOfMaxString = 0
    
    var characterArray = s.characters.map{String($0)}

    for x in 0..<characterArray.count - 1{
        
        if characterArray[x] != characterArray[x + 1]{
            currentMax += 1
        }else{
            if currentMax > max{
                max = currentMax
                startIndexOfMaxString = x - (currentMax - 1)
            }
            currentMax = 1
        }
    }
    
    if currentMax > max{
        max = currentMax
        startIndexOfMaxString = characterArray.count - max
    }
    
    let newArray = Array(characterArray[startIndexOfMaxString..<startIndexOfMaxString + max])
    
    return String(describing: newArray)
    
}
