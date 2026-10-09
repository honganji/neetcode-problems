func minWindow(_ s: String, _ t: String) -> String {
    if t.isEmpty || t.count > s.count { return "" }
    let codes = Array(s.utf8)
    var need = [Int](repeating: 0, count: 128)
    var required = 0
    for code in t.utf8 {
        if need[Int(code)] == 0 { required += 1 }
        need[Int(code)] += 1
    }
    var window = [Int](repeating: 0, count: 128)
    var have = 0
    var bestStart = 0
    var bestLen = codes.count + 1
    var left = 0
    for right in 0..<codes.count {
        let code = Int(codes[right])
        window[code] += 1
        if need[code] > 0 && window[code] == need[code] { have += 1 }
        while have == required {
            if right - left + 1 < bestLen {
                bestStart = left
                bestLen = right - left + 1
            }
            let out = Int(codes[left])
            window[out] -= 1
            if need[out] > 0 && window[out] < need[out] { have -= 1 }
            left += 1
        }
    }
    if bestLen > codes.count { return "" }
    return String(decoding: codes[bestStart..<bestStart + bestLen], as: UTF8.self)
}
