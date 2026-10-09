class Solution {
    fun combinationSum2(candidates: IntArray, target: Int): List<List<Int>> {
        val n = candidates.size
        val seen = mutableSetOf<List<Int>>()
        val result = mutableListOf<List<Int>>()

        // Each mask is one subset: bit i set means candidates[i] is used
        for (mask in 1 until (1 shl n)) {
            val combo = mutableListOf<Int>()
            var total = 0
            for (i in 0 until n) {
                if (((mask shr i) and 1) == 1) {
                    combo.add(candidates[i])
                    total += candidates[i]
                }
            }
            if (total != target) continue
            val sorted = combo.sorted()
            if (seen.add(sorted)) result.add(sorted)
        }
        return result
    }
}
