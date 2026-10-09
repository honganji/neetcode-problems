import java.util.PriorityQueue

fun findKthLargest(nums: IntArray, k: Int): Int {
    // Min-heap that keeps only the k largest values seen so far.
    // Its smallest item (the head) is the kth largest overall.
    val heap = PriorityQueue<Int>()
    for (num in nums) {
        heap.add(num)
        if (heap.size > k) {
            heap.poll() // drop the smallest, it is not in the top k
        }
    }
    return heap.peek()
}
