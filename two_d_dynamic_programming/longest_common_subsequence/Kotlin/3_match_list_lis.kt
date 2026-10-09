fun longestCommonSubsequence(text1: String, text2: String): Int {
    // For each letter, the positions where it appears in text2, in order.
    val positions = HashMap<Char, MutableList<Int>>()
    text2.forEachIndexed { j, c ->
        positions.getOrPut(c) { mutableListOf() }.add(j)
    }

    // tails[k] = smallest end position in text2 of a common chain of length k + 1.
    val tails = ArrayList<Int>()
    for (c in text1) {
        val matches = positions[c] ?: continue
        // Right to left, so one letter of text1 can't be used twice in one chain.
        for (j in matches.asReversed()) {
            // Binary search for the first tail that is >= j.
            var lo = 0
            var hi = tails.size
            while (lo < hi) {
                val mid = (lo + hi) / 2
                if (tails[mid] < j) lo = mid + 1 else hi = mid
            }
            if (lo == tails.size) tails.add(j) else tails[lo] = j
        }
    }
    return tails.size
}
