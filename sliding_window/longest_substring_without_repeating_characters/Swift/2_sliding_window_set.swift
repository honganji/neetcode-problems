func lengthOfLongestSubstring(_ s: String) -> Int {
    let bytes = Array(s.utf8)
    var window = Set<UInt8>()
    var left = 0
    var best = 0
    for right in 0..<bytes.count {
        while window.contains(bytes[right]) {
            window.remove(bytes[left])
            left += 1
        }
        window.insert(bytes[right])
        best = max(best, right - left + 1)
    }
    return best
}
