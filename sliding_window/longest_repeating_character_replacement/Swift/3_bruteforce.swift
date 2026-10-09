func characterReplacement(_ s: String, _ k: Int) -> Int {
    let chars = Array(s.utf8)
    let base = Int(UInt8(ascii: "A"))
    var best = 0
    for start in 0..<chars.count {
        var counts = [Int](repeating: 0, count: 26)
        var maxCount = 0
        for end in start..<chars.count {
            let idx = Int(chars[end]) - base
            counts[idx] += 1
            maxCount = max(maxCount, counts[idx])
            if end - start + 1 - maxCount > k {
                break
            }
            best = max(best, end - start + 1)
        }
    }
    return best
}
