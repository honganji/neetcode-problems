class Solution {
    fun singleNumber(nums: IntArray): Int {
        val sorted = nums.sortedArray() // sorted copy, equal numbers become neighbors
        var i = 0
        while (i < sorted.size - 1) {
            if (sorted[i] != sorted[i + 1]) return sorted[i]
            i += 2 // skip the matching pair
        }
        return sorted[sorted.size - 1] // the single number is at the end
    }
}
