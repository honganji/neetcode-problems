fun countBits(n: Int): IntArray {
    val ans = IntArray(n + 1)
    for (i in 1..n) {
        // i and (i - 1) clears the lowest set bit, leaving one fewer 1-bit.
        ans[i] = ans[i and (i - 1)] + 1
    }
    return ans
}
