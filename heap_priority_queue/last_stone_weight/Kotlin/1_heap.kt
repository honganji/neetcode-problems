import java.util.PriorityQueue

fun lastStoneWeight(stones: IntArray): Int {
    // PriorityQueue is a min-heap by default; reverseOrder() makes the heaviest come out first
    val heap = PriorityQueue<Int>(stones.size, reverseOrder())
    for (s in stones) heap.add(s)

    while (heap.size > 1) {
        val heaviest = heap.poll()
        val second = heap.poll()
        if (heaviest != second) heap.add(heaviest - second)
    }

    return heap.peek() ?: 0
}
