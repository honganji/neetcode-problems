fun checkValidString(s: String): Boolean {
    // lo and hi are the fewest and most '(' that could still be open so far.
    var lo = 0
    var hi = 0
    for (c in s) {
        when (c) {
            '(' -> {
                lo++
                hi++
            }
            ')' -> {
                lo--
                hi--
            }
            else -> {
                // '*' can close one '(' (lo - 1), open one (hi + 1), or be empty.
                lo--
                hi++
            }
        }
        // Even treating every '*' as '(' there is no '(' left for a ')'.
        if (hi < 0) return false
        lo = maxOf(lo, 0) // a '*' can always be empty, so lo never goes below 0
    }
    return lo == 0
}
