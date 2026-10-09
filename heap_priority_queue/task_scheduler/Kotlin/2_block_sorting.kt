class Solution {
    fun leastInterval(tasks: CharArray, n: Int): Int {
        val counts = IntArray(26)
        for (task in tasks) counts[task - 'A']++

        var time = 0
        var left = tasks.size
        while (left > 0) {
            // Most frequent letters first, so each block takes the busiest tasks
            counts.sortDescending()
            var slots = n + 1 // one block = n + 1 slots
            for (i in 0 until 26) {
                if (slots == 0 || counts[i] == 0) break
                counts[i]--
                slots--
                left--
                time++
            }
            if (left > 0) time += slots // idle for the rest of the block
        }
        return time
    }
}
