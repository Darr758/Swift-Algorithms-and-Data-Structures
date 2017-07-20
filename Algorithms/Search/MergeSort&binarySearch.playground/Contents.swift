func mergeSort<T:Comparable>(_ array:[T]) -> [T]{
    guard  array.count > 1 else {return array}
    
    let midPoint = array.count/2
    
    let left = mergeSort(Array(array[0..<midPoint]))
    let right = mergeSort(Array(array[midPoint..<array.count]))
    
    return merge(left,right)
}

func merge<T:Comparable>(_ left:[T],_ right:[T]) -> [T]{
    
    var leftIndex = 0
    var rightIndex = 0
    
    var orderedArray:[T] = []
    
    while leftIndex < left.count && rightIndex < right.count{
        if left[leftIndex] < right[rightIndex]{
            orderedArray.append(left[leftIndex])
            leftIndex += 1
        }else if right[rightIndex] < left[leftIndex]{
            orderedArray.append(right[rightIndex])
            rightIndex += 1
        }else{
            orderedArray.append(left[leftIndex])
            leftIndex += 1
            orderedArray.append(right[rightIndex])
            rightIndex += 1
        }
    }
    
    while leftIndex < left.count{
        orderedArray.append(left[leftIndex])
        leftIndex += 1
    }
    
    while rightIndex < right.count{
        orderedArray.append(right[rightIndex])
        rightIndex += 1
    }
    
    return orderedArray
}

func binarySearch<T:Comparable>(_ array:[T], key:T,range:Range<Int>) -> Int?{
    guard range.upperBound > range.lowerBound else {return nil}
    
    let middle = range.lowerBound + (range.upperBound - range.lowerBound)/2
    
    if array[middle] == key{
        return middle
    }else if array[middle] < key{
        binarySearch(array, key: key, range: middle..<range.upperBound)
    }else{
        binarySearch(array, key: key, range: range.lowerBound..<middle)
    }
    
    return nil
}


