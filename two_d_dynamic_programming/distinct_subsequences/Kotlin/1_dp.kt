fun numDistinct(s: String, t: String): Int {
    val m = t.length
    // ways[j] = number of ways t[0 until j] can be picked out of the part of s read so far.
    val ways = IntArray(m + 1)
    ways[0] = 1 // the empty prefix can always be formed in exactly one way
    for (ch in s) {
        // Go backwards so one character of s is never used twice in the same step.
        for (j in m downTo 1) {
            if (t[j - 1] == ch) {
                ways[j] += ways[j - 1]
            }
        }
    }
    return ways[m]
}
