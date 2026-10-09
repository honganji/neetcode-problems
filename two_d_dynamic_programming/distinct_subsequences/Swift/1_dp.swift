func numDistinct(_ s: String, _ t: String) -> Int {
    let sChars = Array(s.utf8)
    let tChars = Array(t.utf8)
    let m = tChars.count
    // ways[j] = number of ways t[0..<j] can be picked out of the part of s read so far.
    var ways = [Int](repeating: 0, count: m + 1)
    ways[0] = 1  // the empty prefix can always be formed in exactly one way
    for ch in sChars {
        // Go backwards so one character of s is never used twice in the same step.
        for j in stride(from: m, through: 1, by: -1) where tChars[j - 1] == ch {
            ways[j] += ways[j - 1]
        }
    }
    return ways[m]
}
