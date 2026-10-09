class Solution {
    fun lengthOfLIS(nums: IntArray): Int {
        // Compress values to ranks 1..m so they can index the Fenwick tree.
        val sortedUnique = nums.distinct().sorted()
        val rank = HashMap<Int, Int>()
        sortedUnique.forEachIndexed { i, v -> rank[v] = i + 1 }
        val m = sortedUnique.size
        // tree[i] holds the best subsequence length over a range of ranks.
        val tree = IntArray(m + 1)

        var best = 0
        for (x in nums) {
            val r = rank.getValue(x)

            // Best length among smaller values (ranks 1..r-1).
            var cur = 0
            var i = r - 1
            while (i > 0) {
                cur = maxOf(cur, tree[i])
                i -= i and -i
            }

            val length = cur + 1

            // Record this length at rank r.
            i = r
            while (i <= m) {
                tree[i] = maxOf(tree[i], length)
                i += i and -i
            }

            best = maxOf(best, length)
        }
        return best
    }
}
