func countBits(_ n: Int) -> [Int] {
    var ans = [Int](repeating: 0, count: n + 1)
    for i in stride(from: 1, through: n, by: 1) {
        // i & (i - 1) clears the lowest set bit, leaving one fewer 1-bit.
        ans[i] = ans[i & (i - 1)] + 1
    }
    return ans
}
