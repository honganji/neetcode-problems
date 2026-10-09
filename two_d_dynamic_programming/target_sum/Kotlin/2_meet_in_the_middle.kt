fun findTargetSumWays(nums: IntArray, target: Int): Int {
    val half = nums.size / 2
    val left = nums.copyOfRange(0, half)
    val right = nums.copyOfRange(half, nums.size)

    fun allSignedSums(values: IntArray): List<Int> {
        var sums = listOf(0)
        for (v in values) {
            // every sum so far can take either +v or -v
            sums = sums.map { it + v } + sums.map { it - v }
        }
        return sums
    }

    // For each right-half sum, the left half must produce target - that sum.
    val leftCounts = allSignedSums(left).groupingBy { it }.eachCount()
    return allSignedSums(right).sumOf { leftCounts[target - it] ?: 0 }
}
