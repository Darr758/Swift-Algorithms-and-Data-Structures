func quickSortHoare<T:Comparable>(a: inout[T], low:Int, high:Int){
    
    if low < high{
        let pivot = partitionHoare(a:&a, low:low, high:high)
        quickSortHoare(a: &a, low: low, high: pivot)
        quickSortHoare(a: &a, low: pivot+1, high: high)
    }
}

func partitionHoare<T:Comparable>(a:inout[T], low:Int, high:Int) -> Int{
    
    let pivot = a[low]
    var i = low - 1
    var j = high + 1
    
    while(true){
        repeat { i += 1} while a[i] < pivot
        repeat { j -= 1} while a[j] > pivot
        
        if i < j{
            swap(&a[i], &a[j])
        }else{
            return j
        }
    }

}