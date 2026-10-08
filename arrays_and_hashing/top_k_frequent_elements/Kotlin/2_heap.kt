import java.util.PriorityQueue

fun topKFrequent(nums: IntArray, k: Int): IntArray {
    val counts = HashMap<Int, Int>()
    for (num in nums) {
        counts[num] = (counts[num] ?: 0) + 1
    }

    val heap = PriorityQueue<Int>(compareBy { counts[it]!! })
    for (num in counts.keys) {
        heap.add(num)
        if (heap.size > k) {
            heap.poll()
        }
    }

    return heap.toIntArray()
}
