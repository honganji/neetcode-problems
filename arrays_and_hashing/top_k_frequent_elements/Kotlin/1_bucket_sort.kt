fun topKFrequent(nums: IntArray, k: Int): IntArray {
    val counts = HashMap<Int, Int>()
    for (num in nums) {
        counts[num] = (counts[num] ?: 0) + 1
    }

    val buckets = Array(nums.size + 1) { mutableListOf<Int>() }
    for ((num, freq) in counts) {
        buckets[freq].add(num)
    }

    val result = IntArray(k)
    var filled = 0
    for (freq in buckets.size - 1 downTo 1) {
        for (num in buckets[freq]) {
            result[filled++] = num
            if (filled == k) {
                return result
            }
        }
    }
    return result
}
