class KthLargest(private val k: Int, nums: IntArray) {
    private val all: MutableList<Int> = nums.toMutableList()

    fun add(value: Int): Int {
        all.add(value)
        // Re-sort everything on every query and read off the kth largest.
        return all.sortedDescending()[k - 1]
    }
}
