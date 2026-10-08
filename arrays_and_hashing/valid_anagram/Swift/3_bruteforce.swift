func isAnagram(_ s: String, _ t: String) -> Bool {
    if s.count != t.count { return false }
    var remaining = Array(t)
    for ch in s {
        guard let index = remaining.firstIndex(of: ch) else { return false }
        remaining.remove(at: index)
    }
    return true
}
