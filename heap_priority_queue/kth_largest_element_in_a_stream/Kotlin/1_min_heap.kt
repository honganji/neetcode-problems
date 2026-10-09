import java.util.PriorityQueue

class KthLargest(private val k: Int, nums: IntArray) {
    // Min-heap holding only the k largest values seen so far.
    // Its head is the smallest of them, which is the kth largest overall.
    private val heap = PriorityQueue<Int>()

    init {
        for (num in nums) offer(num)
    }

    fun add(value: Int): Int {
        offer(value)
        return heap.peek()
    }

    private fun offer(value: Int) {
        if (heap.size < k) {
            heap.add(value)
        } else if (value > heap.peek()) {
            // Replace the smallest of the top k with the new, larger value.
            heap.poll()
            heap.add(value)
        }
    }
}
