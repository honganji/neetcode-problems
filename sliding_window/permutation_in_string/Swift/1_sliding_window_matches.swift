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
    var matches = 0
    for i in 0..<26 where need[i] == window[i] {
        matches += 1
    }
    for right in p.count..<t.count {
        if matches == 26 {
            return true
        }
        let enter = Int(t[right]) - a
        window[enter] += 1
        if window[enter] == need[enter] {
            matches += 1
        } else if window[enter] == need[enter] + 1 {
            matches -= 1
        }
        let leave = Int(t[right - p.count]) - a
        window[leave] -= 1
        if window[leave] == need[leave] {
            matches += 1
        } else if window[leave] == need[leave] - 1 {
            matches -= 1
        }
    }
    return matches == 26
}
