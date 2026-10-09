class Solution {
    fun findItinerary(tickets: List<List<String>>): List<String> {
        val graph = HashMap<String, MutableList<String>>()
        for (ticket in tickets) {
            graph.getOrPut(ticket[0]) { mutableListOf() }.add(ticket[1])
        }
        for (destinations in graph.values) {
            destinations.sort() // smallest first
        }

        val route = mutableListOf("JFK")
        val total = tickets.size + 1

        fun dfs(current: String): Boolean {
            if (route.size == total) return true
            val destinations = graph[current] ?: return false
            for (i in destinations.indices) {
                val next = destinations.removeAt(i) // use this ticket
                route.add(next)
                if (dfs(next)) return true
                route.removeAt(route.size - 1) // undo and try the next option
                destinations.add(i, next)
            }
            return false
        }

        dfs("JFK")
        return route
    }
}
