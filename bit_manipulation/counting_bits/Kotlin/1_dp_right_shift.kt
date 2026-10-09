fun countBits(n: Int): IntArray {
    val ans = IntArray(n + 1)
    for (i in 1..n) {
        // i shr 1 drops the last bit; i and 1 is that last bit.
        ans[i] = ans[i shr 1] + (i and 1)
    }
    return ans
}
