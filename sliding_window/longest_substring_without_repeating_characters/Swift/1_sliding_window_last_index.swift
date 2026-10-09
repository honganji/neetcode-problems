func lengthOfLongestSubstring(_ s: String) -> Int {
    let bytes = Array(s.utf8)
    var lastIndex = [UInt8: Int]()
    var left = 0
    var best = 0
    for right in 0..<bytes.count {
        if let prev = lastIndex[bytes[right]], prev >= left {
            left = prev + 1
        }
        lastIndex[bytes[right]] = right
        best = max(best, right - left + 1)
    }
    return best
}
