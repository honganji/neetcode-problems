fun countBits(n: Int): IntArray {
    val ans = IntArray(n + 1)
    for (i in 0..n) {
        var x = i
        while (x != 0) {
            x = x and (x - 1) // clear the lowest set bit
            ans[i]++
        }
    }
    return ans
}
