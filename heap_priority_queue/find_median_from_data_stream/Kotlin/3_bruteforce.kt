class MedianFinder {
    private val nums = mutableListOf<Int>()

    fun addNum(num: Int) {
        nums.add(num)
    }

    fun findMedian(): Double {
        val sorted = nums.sorted()
        val n = sorted.size
        val mid = n / 2
        if (n % 2 == 1) return sorted[mid].toDouble()
        return (sorted[mid - 1] + sorted[mid]) / 2.0
    }
}
