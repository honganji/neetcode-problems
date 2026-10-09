fun combinationSum(candidates: IntArray, target: Int): List<List<Int>> {
    val sorted = candidates.sorted()
    val result = mutableListOf<List<Int>>()
    val path = mutableListOf<Int>()

    fun backtrack(start: Int, remaining: Int) {
        if (remaining == 0) {
            result.add(path.toList())
            return
        }
        for (i in start until sorted.size) {
            val c = sorted[i]
            if (c > remaining) break  // sorted, so every later candidate is too big too
            path.add(c)
            backtrack(i, remaining - c)  // i (not i + 1) allows reuse
            path.removeAt(path.size - 1)
        }
    }

    backtrack(0, target)
    return result
}
