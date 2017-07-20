func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    
    var leftIndex = 0
    var rightIndex = 0
    
    var orderedArray:[Int] = []
    
    while leftIndex < nums1.count && rightIndex < nums2.count{
        if nums1[leftIndex] < nums2[rightIndex]{
            orderedArray.append(nums1[leftIndex])
            leftIndex += 1
        }else if nums2[rightIndex] < nums1[leftIndex]{
            orderedArray.append(nums2[rightIndex])
            rightIndex += 1
        }else{
            orderedArray.append(nums1[leftIndex])
            leftIndex += 1
            orderedArray.append(nums2[rightIndex])
            rightIndex += 1
        }
    }
    
    while leftIndex < nums1.count{
        orderedArray.append(nums1[leftIndex])
        leftIndex += 1
    }
    
    while rightIndex < nums2.count{
        orderedArray.append(nums2[rightIndex])
        rightIndex += 1
    }
    
    guard orderedArray.count > 1 else {return Double(orderedArray[0])}
    
    let count = orderedArray.count - 1
    
    if orderedArray.count % 2 == 0{
        let val1 = Double(orderedArray[count/2])
        let val2 = Double(orderedArray[count/2 + 1])
        return (val1 + val2)/2
    }else{
        return Double(orderedArray[count/2])
    }
    
}


