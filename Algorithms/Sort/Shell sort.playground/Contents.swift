import Foundation

public func shellSort<T:Comparable>(_ list : inout [T],_ isOrderedBefore:(T,T) -> Bool) {
    var sublistCount = list.count / 2
    
    while sublistCount > 0 {
        for var index in 0..<list.count {
            
            guard index + sublistCount < list.count else { break }
            
            if isOrderedBefore(list[index],list[index + sublistCount]) {
                swap(&list[index], &list[index + sublistCount])
            }
            
            guard sublistCount == 1 && index > 0 else { continue }
            
            while index > 0 && isOrderedBefore(list[index - 1],list[index]) {
                swap(&list[index - 1], &list[index])
                index -= 1
            }
        }
        sublistCount = sublistCount / 2
    }
}
