func insertionSort<T:Comparable>(_ array: inout [T]){
    
    for x in 1..<array.count{
        var y = x
        let temp = array[y]
        while y > 0 && temp < array[y-1]{
            array[y] = array[y - 1]
            y -= 1
        }
        array[y] = temp
    }
    
}



