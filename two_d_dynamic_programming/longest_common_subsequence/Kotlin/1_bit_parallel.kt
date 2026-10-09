import java.math.BigInteger

fun longestCommonSubsequence(text1: String, text2: String): Int {
    val n = text2.length
    val full = BigInteger.ONE.shiftLeft(n).subtract(BigInteger.ONE)

    // For each letter, a bit mask of the positions where it appears in text2.
    val matchMasks = HashMap<Char, BigInteger>()
    text2.forEachIndexed { j, c ->
        matchMasks[c] = matchMasks.getOrDefault(c, BigInteger.ZERO).setBit(j)
    }

    // One bit per position in text2, all starting as 1.
    var v = full
    for (c in text1) {
        val u = v.and(matchMasks.getOrDefault(c, BigInteger.ZERO))
        v = v.add(u).or(v.xor(u)).and(full)
    }

    // Each 0 bit left in v counts one character of the LCS.
    return n - v.bitCount()
}
