class Solution {
    fun findItinerary(tickets: List<List<String>>): List<String> {
        var best: List<String>? = null
        val used = BooleanArray(tickets.size)
        val order = mutableListOf<Int>()

        // Builds every order of the tickets and checks each one.
        fun tryOrders() {
            if (order.size == tickets.size) {
                val path = mutableListOf("JFK")
                for (i in order) {
                    if (tickets[i][0] != path.last()) return // ticket doesn't continue the trip
                    path.add(tickets[i][1])
                }
                val current = best
                if (current == null || isSmaller(path, current)) best = path
                return
            }
            for (i in tickets.indices) {
                if (used[i]) continue
                used[i] = true
                order.add(i)
                tryOrders()
                order.removeAt(order.size - 1)
                used[i] = false
            }
        }

        tryOrders()
        return best ?: emptyList()
    }

    private fun isSmaller(a: List<String>, b: List<String>): Boolean {
        for (i in a.indices) {
            if (a[i] != b[i]) return a[i] < b[i]
        }
        return false
    }
}
