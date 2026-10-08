func isAnagram(_ s: String, _ t: String) -> Bool {
    let a = Array(s.utf8)
    let b = Array(t.utf8)
    if a.count != b.count { return false }
    var counts = [Int](repeating: 0, count: 26)
    let base = Character("a").asciiValue!
    for i in 0..<a.count {
        counts[Int(a[i] - base)] += 1
        counts[Int(b[i] - base)] -= 1
    }
    return counts.allSatisfy { $0 == 0 }
}
