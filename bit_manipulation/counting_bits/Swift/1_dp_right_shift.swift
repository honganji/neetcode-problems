func countBits(_ n: Int) -> [Int] {
    var ans = [Int](repeating: 0, count: n + 1)
    for i in stride(from: 1, through: n, by: 1) {
        // i >> 1 drops the last bit; i & 1 is that last bit.
        ans[i] = ans[i >> 1] + (i & 1)
    }
    return ans
}
