func quickSortHoare<T:Comparable>(_ array: inout [T], low:Int, high:Int){
    if low < high{
        let p = partitionHoare(&array, low:low, high:high)
        quickSortHoare(&array, low: low, high: p)
        quickSortHoare(&array, low: p + 1, high: high)
    }
}

func partitionHoare<T:Comparable>(_ array: inout [T], low:Int, high:Int) -> Int{
    
    let pivot = array[low]
    
    var h = high + 1
    var l = low - 1
    
    while(true){
        repeat{h -= 1}while array[h] > pivot
        repeat{l += 1}while array[l] < pivot
        
        if l < h{
            swap(&array[l], &array[h])
        }else{
            return h
        }
    }
    
}

func binarySearch<T:Comparable>(_ array:[T], key:T, range:Range<Int>) -> Int?{
    
    guard range.lowerBound < range.upperBound else {return nil}
    
    let mid = range.lowerBound + (range.upperBound - range.lowerBound)/2
    
    if array[mid] == key{
        return mid
    }else if array[mid] < key{
        return binarySearch(array, key: key, range: mid + 1..<range.upperBound)
    }else{
        return binarySearch(array, key: key, range: range.lowerBound..<mid)
    }
    
    return nil
}
