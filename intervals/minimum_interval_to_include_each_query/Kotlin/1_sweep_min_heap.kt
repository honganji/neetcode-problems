import java.util.PriorityQueue

fun minInterval(intervals: Array<IntArray>, queries: IntArray): IntArray {
    // Sweep the queries from smallest to largest. Intervals join a heap once their
    // left end is reached; the heap is ordered by size.
    val byLeft = intervals.sortedBy { it[0] }
    val order = queries.indices.sortedBy { queries[it] }
    val answer = IntArray(queries.size) { -1 }
    val heap = PriorityQueue<IntArray>(compareBy<IntArray> { it[0] }) // [size, right]
    var next = 0

    for (qi in order) {
        val q = queries[qi]
        while (next < byLeft.size && byLeft[next][0] <= q) {
            val (left, right) = byLeft[next]
            heap.add(intArrayOf(right - left + 1, right))
            next++
        }
        // Queries only grow, so intervals that ended before q can never help again.
        while (heap.isNotEmpty() && heap.peek()[1] < q) heap.poll()
        if (heap.isNotEmpty()) answer[qi] = heap.peek()[0]
    }
    return answer
}
