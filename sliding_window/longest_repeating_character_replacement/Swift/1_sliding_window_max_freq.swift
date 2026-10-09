func characterReplacement(_ s: String, _ k: Int) -> Int {
    let chars = Array(s.utf8)
    let base = Int(UInt8(ascii: "A"))
    var counts = [Int](repeating: 0, count: 26)
    var maxFreq = 0
    var left = 0
    var best = 0
    for right in 0..<chars.count {
        let idx = Int(chars[right]) - base
        counts[idx] += 1
        maxFreq = max(maxFreq, counts[idx])
        if right - left + 1 - maxFreq > k {
            counts[Int(chars[left]) - base] -= 1
            left += 1
        }
        best = max(best, right - left + 1)
    }
    return best
}
