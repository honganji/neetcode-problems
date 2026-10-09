class Solution {
    fun combinationSum2(candidates: IntArray, target: Int): List<List<Int>> {
        candidates.sort()
        // sums[s] = distinct combinations (sorted) that add up to s
        val sums = Array(target + 1) { mutableListOf<List<Int>>() }
        // seen[s] remembers what is already stored, to drop duplicates
        val seen = Array(target + 1) { mutableSetOf<List<Int>>() }
        sums[0].add(emptyList())
        seen[0].add(emptyList())

        for (x in candidates) {
            // Go downward so each candidate is used at most once
            for (s in target downTo x) {
                for (combo in sums[s - x]) {
                    val next = combo + x
                    if (seen[s].add(next)) sums[s].add(next)
                }
            }
        }
        return sums[target]
    }
}
