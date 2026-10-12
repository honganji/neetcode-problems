class Solution {
    fun rotate(matrix: Array<IntArray>) {
        val n = matrix.size
        // Work from the outside ring inward.
        for (first in 0 until n / 2) {
            val last = n - 1 - first
            // Each step moves 4 cells in one cycle: top -> right -> bottom -> left -> top.
            for (i in first until last) {
                val offset = i - first
                val top = matrix[first][i]
                matrix[first][i] = matrix[last - offset][first]              // left -> top
                matrix[last - offset][first] = matrix[last][last - offset]   // bottom -> left
                matrix[last][last - offset] = matrix[i][last]                // right -> bottom
                matrix[i][last] = top                                        // top -> right
            }
        }
    }
}
