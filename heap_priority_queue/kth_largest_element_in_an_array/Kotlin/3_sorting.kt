fun findKthLargest(nums: IntArray, k: Int): Int {
    // Sorted ascending, the kth largest is k positions from the end.
    val sorted = nums.sorted()
    return sorted[nums.size - k]
}
