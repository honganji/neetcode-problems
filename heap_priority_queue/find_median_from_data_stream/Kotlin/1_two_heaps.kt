import java.util.Collections
import java.util.PriorityQueue

class MedianFinder {
    // max-heap: the smaller half
    private val low = PriorityQueue<Int>(Collections.reverseOrder())
    // min-heap: the larger half
    private val high = PriorityQueue<Int>()

    fun addNum(num: Int) {
        // push into low, then move low's largest into high
        low.add(num)
        high.add(low.poll())
        // keep low the same size as high, or one bigger
        if (high.size > low.size) {
            low.add(high.poll())
        }
    }

    fun findMedian(): Double {
        if (low.size > high.size) return low.peek().toDouble()
        return (low.peek() + high.peek()) / 2.0
    }
}
