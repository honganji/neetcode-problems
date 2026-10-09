func minWindow(_ s: String, _ t: String) -> String {
    if t.isEmpty || t.count > s.count { return "" }
    let codes = Array(s.utf8)
    var count = [Int](repeating: 0, count: 128)
    for code in t.utf8 {
        count[Int(code)] += 1
    }
    var missing = t.count
    var bestStart = 0
    var bestLen = codes.count + 1
    var left = 0
    for right in 0..<codes.count {
        let code = Int(codes[right])
        if count[code] > 0 { missing -= 1 }
        count[code] -= 1
        while missing == 0 {
            if right - left + 1 < bestLen {
                bestStart = left
                bestLen = right - left + 1
            }
            let out = Int(codes[left])
            count[out] += 1
            if count[out] > 0 { missing += 1 }
            left += 1
        }
    }
    if bestLen > codes.count { return "" }
    return String(decoding: codes[bestStart..<bestStart + bestLen], as: UTF8.self)
}
