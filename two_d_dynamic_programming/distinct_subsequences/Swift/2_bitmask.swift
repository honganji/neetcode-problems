func numDistinct(_ s: String, _ t: String) -> Int {
    let sChars = Array(s.utf8)
    let tChars = Array(t.utf8)
    let n = sChars.count
    var count = 0
    // Each number from 0 to 2^n - 1 is one choice of positions: bit i set means keep s[i].
    for mask in 0..<(1 << n) {
        var picked: [UInt8] = []
        for i in 0..<n where mask & (1 << i) != 0 {
            picked.append(sChars[i])
        }
        if picked == tChars {
            count += 1
        }
    }
    return count
}
