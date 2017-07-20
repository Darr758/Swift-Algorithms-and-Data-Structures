//Determine if a number is a palindrome
func isPalindrome(_ num:Int) -> Bool{
    
    let tempNum = abs(num)
    
    var numInString = String(tempNum)
    var numInChars = numInString.characters.map{String($0)}
    
    var high = numInChars.count - 1;
    var low = 0;
    
    while high > low{
        if(numInChars[low] != numInChars[high]){
            return false
        }
        high -= 1
        low += 1
    }

    
    return true
}


