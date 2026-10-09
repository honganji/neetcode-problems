func lengthOfLongestSubstring(_ s: String) -> Int {
    let bytes = Array(s.utf8)
    var best = 0
    for start in 0..<bytes.count {
        var seen = Set<UInt8>()
        for end in start..<bytes.count {
            if !seen.insert(bytes[end]).inserted {
                break
            }
        }
        best = max(best, seen.count)
    }
    return best
}
