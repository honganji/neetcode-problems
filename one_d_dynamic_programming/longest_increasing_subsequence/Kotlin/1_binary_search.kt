class Solution {
    fun lengthOfLIS(nums: IntArray): Int {
        // tails[k] = smallest value that can end an increasing subsequence of length k + 1.
        // Only the first `size` entries are in use; they stay sorted, so we can binary search.
        val tails = IntArray(nums.size)
        var size = 0
        for (x in nums) {
            // Find the first index in [0, size) where tails[i] >= x.
            var lo = 0
            var hi = size
            while (lo < hi) {
                val mid = (lo + hi) ushr 1
                if (tails[mid] < x) lo = mid + 1 else hi = mid
            }
            tails[lo] = x  // either extends the list (lo == size) or lowers a tail
            if (lo == size) size++
        }
        return size
    }
}
