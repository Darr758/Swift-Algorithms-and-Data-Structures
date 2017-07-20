
func mergeSort< T:Comparable>(array:[T]) -> [T]{
    
    guard array.count > 1 else {return array}
    
    let mid = (array.count)/2
    
    let leftArray = mergeSort(array: Array(array[0..<mid]))
    let rightArray = mergeSort(array: Array(array[mid..<array.count]))
    
    let orderedArray = merge(leftArray: leftArray,rightArray: rightArray)
    
    return orderedArray
}

func merge< T:Comparable>(leftArray:[T], rightArray:[T]) -> [T]{
    
    var leftIndex = 0
    var rightIndex = 0
    
    var orderedArray:[T] = []
    
    while(leftIndex < leftArray.count && rightIndex < rightArray.count){
        let leftElement = leftArray[leftIndex]
        let rightElement = rightArray[rightIndex]
        
        if leftElement < rightElement{
            orderedArray.append(leftElement)
            leftIndex += 1
        }else if rightElement < leftElement{
            orderedArray.append(rightElement)
            rightIndex += 1
        }else{
            orderedArray.append(leftElement)
            leftIndex += 1
            orderedArray.append(rightElement)
            rightIndex += 1
        }
    }
    
    while(leftIndex < leftArray.count){
        orderedArray.append(leftArray[leftIndex])
        leftIndex += 1
    }
    
    while(rightIndex < rightArray.count){
        orderedArray.append(rightArray[rightIndex])
        rightIndex += 1
    }

    return orderedArray
}



