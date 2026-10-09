import java.util.PriorityQueue

fun maxSlidingWindow(nums: IntArray, k: Int): IntArray {
    val result = IntArray(nums.size - k + 1)
    // Max-heap of (value, index) pairs, ordered by value.
    val heap = PriorityQueue<IntArray>(compareByDescending<IntArray> { it[0] })
    for (i in nums.indices) {
        heap.add(intArrayOf(nums[i], i))
        if (i >= k - 1) {
            while (heap.peek()[1] <= i - k) {
                heap.poll()
            }
            result[i - k + 1] = heap.peek()[0]
        }
    }
    return result
}
