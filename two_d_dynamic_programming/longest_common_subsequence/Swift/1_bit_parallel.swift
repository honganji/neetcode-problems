func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
    let b = Array(text2)
    let n = b.count
    if n == 0 { return 0 }
    // Bits are packed into 64-bit words, so each word handles 64 positions at once.
    let wordCount = (n + 63) / 64

    // For each letter, a bit mask of the positions where it appears in text2.
    var matchMasks: [Character: [UInt64]] = [:]
    for (j, c) in b.enumerated() {
        if matchMasks[c] == nil {
            matchMasks[c] = [UInt64](repeating: 0, count: wordCount)
        }
        matchMasks[c]![j / 64] |= UInt64(1) << (j % 64)
    }

    // Keep only the n real bits in the last word.
    let lastBits = n % 64
    let lastMask: UInt64 = lastBits == 0 ? ~0 : (UInt64(1) << lastBits) - 1

    // One bit per position in text2, all starting as 1.
    var v = [UInt64](repeating: ~0, count: wordCount)
    v[wordCount - 1] = lastMask

    for c in text1 {
        guard let mask = matchMasks[c] else { continue }
        var carry: UInt64 = 0
        for i in 0..<wordCount {
            let u = v[i] & mask[i]
            // Add u into v, passing the carry from word to word.
            let (sum1, overflow1) = v[i].addingReportingOverflow(u)
            let (sum2, overflow2) = sum1.addingReportingOverflow(carry)
            carry = (overflow1 || overflow2) ? 1 : 0
            v[i] = sum2 | (v[i] ^ u)
        }
        v[wordCount - 1] &= lastMask
    }

    // Each 0 bit left in v counts one character of the LCS.
    let ones = v.reduce(0) { $0 + $1.nonzeroBitCount }
    return n - ones
}
