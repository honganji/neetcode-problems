func characterReplacement(_ s: String, _ k: Int) -> Int {
    let chars = Array(s.utf8)
    let base = Int(UInt8(ascii: "A"))
    var counts = [Int](repeating: 0, count: 26)
    var left = 0
    var best = 0
    for right in 0..<chars.count {
        counts[Int(chars[right]) - base] += 1
        while right - left + 1 - counts.max()! > k {
            counts[Int(chars[left]) - base] -= 1
            left += 1
        }
        best = max(best, right - left + 1)
    }
    return best
}
