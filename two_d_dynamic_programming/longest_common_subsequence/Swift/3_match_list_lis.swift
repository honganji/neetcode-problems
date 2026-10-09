func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
    // For each letter, the positions where it appears in text2, in order.
    var positions: [Character: [Int]] = [:]
    for (j, c) in text2.enumerated() {
        positions[c, default: []].append(j)
    }

    // tails[k] = smallest end position in text2 of a common chain of length k + 1.
    var tails: [Int] = []
    for c in text1 {
        guard let matches = positions[c] else { continue }
        // Right to left, so one letter of text1 can't be used twice in one chain.
        for j in matches.reversed() {
            // Binary search for the first tail that is >= j.
            var lo = 0
            var hi = tails.count
            while lo < hi {
                let mid = (lo + hi) / 2
                if tails[mid] < j {
                    lo = mid + 1
                } else {
                    hi = mid
                }
            }
            if lo == tails.count {
                tails.append(j)
            } else {
                tails[lo] = j
            }
        }
    }
    return tails.count
}
