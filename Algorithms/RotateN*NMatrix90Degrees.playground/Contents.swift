//Flip an n*n matric 90% left
func rotateMatrix(_ matrix: inout [[Int]]){
    
    let count = matrix[0].count
    
    for x in 0..<count{
        for y in x..<count{
            if x == y {continue}
            swap(&matrix[x][y],&matrix[y][x])
        }
    }
    
    var opposite = count - 1
    
    for x in 0..<count{
        for y in 0..<count{
            if x == opposite {break}
            swap(&matrix[x][y],&matrix[opposite][y])
        }
        opposite -= 1	
    }
}
