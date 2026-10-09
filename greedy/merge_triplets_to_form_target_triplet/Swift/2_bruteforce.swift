func mergeTriplets(_ triplets: [[Int]], _ target: [Int]) -> Bool {
    let n = triplets.count
    // Try every choice of up to three triplets (repeats allowed).
    for i in 0..<n {
        for j in 0..<n {
            for k in 0..<n {
                let a = max(triplets[i][0], triplets[j][0], triplets[k][0])
                let b = max(triplets[i][1], triplets[j][1], triplets[k][1])
                let c = max(triplets[i][2], triplets[j][2], triplets[k][2])
                if a == target[0] && b == target[1] && c == target[2] {
                    return true
                }
            }
        }
    }
    return false
}
