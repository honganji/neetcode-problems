class Solution {
    fun solveNQueens(n: Int): List<List<String>> {
        val res = mutableListOf<List<String>>()
        val perm = IntArray(n) { it } // perm[row] = column

        fun swap(i: Int, j: Int) {
            val t = perm[i]
            perm[i] = perm[j]
            perm[j] = t
        }

        fun permute(k: Int) {
            if (k == n) {
                if (isValid(perm)) {
                    res.add(perm.map { c -> rowString(c, n) })
                }
                return
            }
            for (i in k until n) {
                swap(k, i)
                permute(k + 1)
                swap(k, i)
            }
        }

        permute(0)
        return res
    }

    // Rows and columns are unique by construction, so only diagonals need checking
    private fun isValid(perm: IntArray): Boolean {
        val sums = perm.indices.map { r -> r + perm[r] }.toSet()
        val diffs = perm.indices.map { r -> r - perm[r] }.toSet()
        return sums.size == perm.size && diffs.size == perm.size
    }

    private fun rowString(col: Int, n: Int) = ".".repeat(col) + "Q" + ".".repeat(n - col - 1)
}
