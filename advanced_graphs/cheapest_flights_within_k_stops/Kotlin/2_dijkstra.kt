import java.util.PriorityQueue

class Solution {
    private data class State(val cost: Int, val city: Int, val used: Int)

    fun findCheapestPrice(n: Int, flights: Array<IntArray>, src: Int, dst: Int, k: Int): Int {
        val graph = Array(n) { mutableListOf<IntArray>() }
        for ((from, to, price) in flights) {
            graph[from].add(intArrayOf(to, price))
        }

        // Min-heap ordered by cost, cheapest first.
        val heap = PriorityQueue(compareBy<State> { it.cost })
        heap.add(State(0, src, 0))

        // Track flights used too, so a cheap route with too many stops
        // does not hide a pricier route that is still allowed.
        // bestCost[city][used] = cheapest known cost to reach city with exactly `used` flights.
        val bestCost = Array(n) { IntArray(k + 2) { Int.MAX_VALUE } }
        bestCost[src][0] = 0

        while (heap.isNotEmpty()) {
            val (cost, city, used) = heap.poll()
            if (city == dst) return cost
            if (used == k + 1) continue

            for ((to, price) in graph[city]) {
                val newCost = cost + price
                if (newCost < bestCost[to][used + 1]) {
                    bestCost[to][used + 1] = newCost
                    heap.add(State(newCost, to, used + 1))
                }
            }
        }

        return -1
    }
}
