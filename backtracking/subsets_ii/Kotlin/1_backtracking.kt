fun subsetsWithDup(nums: IntArray): List<List<Int>> {
    val sorted = nums.sorted()
    val result = mutableListOf<List<Int>>()
    val path = mutableListOf<Int>()

    fun backtrack(start: Int) {
        result.add(path.toList())
        for (i in start until sorted.size) {
            // Equal values next to each other: only the first one may start a branch here.
            if (i > start && sorted[i] == sorted[i - 1]) continue
            path.add(sorted[i])
            backtrack(i + 1)
            path.removeAt(path.lastIndex)
        }
    }

    backtrack(0)
    return result
}
