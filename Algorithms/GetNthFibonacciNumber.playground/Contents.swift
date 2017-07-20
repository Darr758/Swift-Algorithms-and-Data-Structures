//Get the nth fibonacci number in the sequence 
func fibo(_ n:Int) -> Int{
    if n == 0{
        return 0
    }else if n == 1{
        return 1
    }else if n > 1{
        return fibo(n-1) + fibo(n-2)
    }else{
        return -1
    }
}

fibo(6)
