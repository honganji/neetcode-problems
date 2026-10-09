func checkInclusion(_ s1: String, _ s2: String) -> Bool {
    if s1.count > s2.count {
        return false
    }
    let a = Int(UInt8(ascii: "a"))
    let p = Array(s1.utf8)
    let t = Array(s2.utf8)
    var need = [Int](repeating: 0, count: 26)
    var window = [Int](repeating: 0, count: 26)
    for i in 0..<p.count {
        need[Int(p[i]) - a] += 1
        window[Int(t[i]) - a] += 1
    }
    if need == window {
        return true
    }
    for right in p.count..<t.count {
        window[Int(t[right]) - a] += 1
        window[Int(t[right - p.count]) - a] -= 1
        if need == window {
            return true
        }
    }
    return false
}
