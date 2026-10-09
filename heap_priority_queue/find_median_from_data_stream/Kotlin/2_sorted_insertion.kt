class MedianFinder {
    private val nums = mutableListOf<Int>()  // kept sorted at all times

    fun addNum(num: Int) {
        // binary search for the spot, then insert (later items shift over)
        val found = nums.binarySearch(num)
        val index = if (found >= 0) found else -found - 1
        nums.add(index, num)
    }

    fun findMedian(): Double {
        val n = nums.size
        val mid = n / 2
        if (n % 2 == 1) return nums[mid].toDouble()
        return (nums[mid - 1] + nums[mid]) / 2.0
    }
}
