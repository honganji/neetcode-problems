func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
    let n = candidates.count
    // how many copies of each candidate we may try: 0 ... target / candidate
    let limits = candidates.map { target / $0 }
    var counts = Array(repeating: 0, count: n)
    var result: [[Int]] = []

    while true {
        var total = 0
        for i in 0..<n {
            total += candidates[i] * counts[i]
        }
        if total == target {
            var combo: [Int] = []
            for i in 0..<n {
                combo += Array(repeating: candidates[i], count: counts[i])
            }
            result.append(combo)
        }

        // advance the counts like an odometer
        var j = 0
        while j < n && counts[j] == limits[j] {
            counts[j] = 0
            j += 1
        }
        if j == n { break }
        counts[j] += 1
    }
    return result
}
