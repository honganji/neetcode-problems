fun numDistinct(s: String, t: String): Int {
    val n = s.length
    var count = 0
    // Each number from 0 until 2^n is one choice of positions: bit i set means keep s[i].
    for (mask in 0 until (1 shl n)) {
        val picked = StringBuilder()
        for (i in 0 until n) {
            if ((mask and (1 shl i)) != 0) picked.append(s[i])
        }
        if (picked.toString() == t) count++
    }
    return count
}
