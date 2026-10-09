import java.util.PriorityQueue

fun minMeetingRooms(intervals: Array<IntArray>): Int {
    // Min-heap of end times for the rooms in use; the earliest end is always on top.
    val ends = PriorityQueue<Int>()
    for (meeting in intervals.sortedBy { it[0] }) {
        val start = meeting[0]
        val end = meeting[1]
        if (ends.isNotEmpty() && ends.peek() <= start) {
            // The room that frees up first is free now, so reuse it.
            ends.poll()
        }
        ends.add(end)
    }
    return ends.size
}
