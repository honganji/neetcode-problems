func minWindow(_ s: String, _ t: String) -> String {
    if t.isEmpty || t.count > s.count { return "" }
    let codes = Array(s.utf8)
    let tLen = t.count
    var need = [Int](repeating: 0, count: 128)
    for code in t.utf8 {
        need[Int(code)] += 1
    }
    var bestStart = 0
    var bestLen = codes.count + 1
    for start in 0..<codes.count {
        if codes.count - start < tLen { break }
        var count = need
        var missing = tLen
        for end in start..<codes.count {
            if end - start + 1 >= bestLen { break }
            let code = Int(codes[end])
            if count[code] > 0 { missing -= 1 }
            count[code] -= 1
            if missing == 0 {
                bestStart = start
                bestLen = end - start + 1
                break
            }
        }
    }
    if bestLen > codes.count { return "" }
    return String(decoding: codes[bestStart..<bestStart + bestLen], as: UTF8.self)
}
