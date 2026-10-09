class Solution {
    fun findItinerary(tickets: List<List<String>>): List<String> {
        // Destinations sorted in reverse, so removeLast() gives the smallest one.
        val graph = HashMap<String, MutableList<String>>()
        for (ticket in tickets) {
            graph.getOrPut(ticket[0]) { mutableListOf() }.add(ticket[1])
        }
        for (destinations in graph.values) {
            destinations.sortDescending()
        }

        val stack = mutableListOf("JFK")
        val route = mutableListOf<String>()
        while (stack.isNotEmpty()) {
            val current = stack.last()
            val destinations = graph[current]
            if (!destinations.isNullOrEmpty()) {
                stack.add(destinations.removeLast()) // take the smallest unused ticket
            } else {
                route.add(stack.removeLast()) // stuck: this airport goes at the end
            }
        }
        return route.reversed()
    }
}
