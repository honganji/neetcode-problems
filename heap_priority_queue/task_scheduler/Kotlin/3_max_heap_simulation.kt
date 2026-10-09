import java.util.Collections
import java.util.PriorityQueue

class Solution {
    fun leastInterval(tasks: CharArray, n: Int): Int {
        val counts = tasks.toList().groupingBy { it }.eachCount()

        // Max-heap of remaining counts
        val heap = PriorityQueue<Int>(Collections.reverseOrder())
        heap.addAll(counts.values)

        // (remaining count, time it becomes ready again)
        val cooldown = ArrayDeque<Pair<Int, Int>>()

        var time = 0
        while (heap.isNotEmpty() || cooldown.isNotEmpty()) {
            time++
            // A task that finished its cooldown goes back into the heap
            if (cooldown.isNotEmpty() && cooldown.first().second == time) {
                heap.add(cooldown.removeFirst().first)
            }
            if (heap.isNotEmpty()) {
                val remaining = heap.poll() - 1 // run one copy
                if (remaining > 0) cooldown.addLast(Pair(remaining, time + n + 1))
            }
            // If the heap is empty, this slot is idle
        }
        return time
    }
}
