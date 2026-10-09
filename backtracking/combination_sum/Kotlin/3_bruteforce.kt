fun combinationSum(candidates: IntArray, target: Int): List<List<Int>> {
    val n = candidates.size
    // how many copies of each candidate we may try: 0 .. target / candidate
    val limits = IntArray(n) { target / candidates[it] }
    val counts = IntArray(n)
    val result = mutableListOf<List<Int>>()

    while (true) {
        var total = 0
        for (i in 0 until n) {
            total += candidates[i] * counts[i]
        }
        if (total == target) {
            val combo = mutableListOf<Int>()
            for (i in 0 until n) {
                repeat(counts[i]) { combo.add(candidates[i]) }
            }
            result.add(combo)
        }

        // advance the counts like an odometer
        var j = 0
        while (j < n && counts[j] == limits[j]) {
            counts[j] = 0
            j++
        }
        if (j == n) break
        counts[j]++
    }
    return result
}
