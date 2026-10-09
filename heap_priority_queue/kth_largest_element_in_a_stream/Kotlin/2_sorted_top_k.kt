class KthLargest(private val k: Int, nums: IntArray) {
    // Sorted ascending, holding only the k largest values seen so far.
    private val top: MutableList<Int> = nums.sorted().takeLast(k).toMutableList()

    fun add(value: Int): Int {
        if (top.size < k) {
            insertSorted(value)
        } else if (value > top[0]) {
            // Drop the smallest of the top k, then slot the new value in order.
            top.removeAt(0)
            insertSorted(value)
        }
        return top[0]
    }

    // Binary search for the first position holding a value >= value, then insert there.
    private fun insertSorted(value: Int) {
        var low = 0
        var high = top.size
        while (low < high) {
            val mid = (low + high) / 2
            if (top[mid] < value) low = mid + 1 else high = mid
        }
        top.add(low, value)
    }
}
