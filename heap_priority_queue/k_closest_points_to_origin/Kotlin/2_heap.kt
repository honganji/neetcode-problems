import java.util.PriorityQueue

fun kClosest(points: Array<IntArray>, k: Int): Array<IntArray> {
    fun dist(p: IntArray) = p[0] * p[0] + p[1] * p[1]

    // Max-heap by distance: the farthest point is at the head.
    val heap = PriorityQueue<IntArray>(compareByDescending { dist(it) })
    for (p in points) {
        heap.offer(p)
        // Drop the farthest point once we hold more than k.
        if (heap.size > k) heap.poll()
    }
    return heap.toTypedArray()
}
