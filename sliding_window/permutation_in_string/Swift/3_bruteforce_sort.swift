func checkInclusion(_ s1: String, _ s2: String) -> Bool {
    if s1.count > s2.count {
        return false
    }
    let target = Array(s1.utf8).sorted()
    let t = Array(s2.utf8)
    for start in 0...(t.count - target.count) {
        if Array(t[start..<(start + target.count)]).sorted() == target {
            return true
        }
    }
    return false
}
