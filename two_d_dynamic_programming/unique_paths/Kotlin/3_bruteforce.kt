class Solution {
    fun uniquePaths(m: Int, n: Int): Int {
        fun count(r: Int, c: Int): Int {
            // Stepped off the grid: not a valid path.
            if (r == m || c == n) return 0
            // Reached the bottom-right corner: exactly one path ends here.
            if (r == m - 1 && c == n - 1) return 1
            // Otherwise try both moves and add up the paths.
            return count(r + 1, c) + count(r, c + 1)
        }

        return count(0, 0)
    }
}
