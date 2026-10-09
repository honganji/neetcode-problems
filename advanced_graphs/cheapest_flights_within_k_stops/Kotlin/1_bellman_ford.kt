class Solution {
    fun findCheapestPrice(n: Int, flights: Array<IntArray>, src: Int, dst: Int, k: Int): Int {
        val unreachable = Int.MAX_VALUE
        val cost = IntArray(n) { unreachable }
        cost[src] = 0

        // k stops means at most k + 1 flights, so run k + 1 rounds.
        repeat(k + 1) {
            // Read from the costs of the previous round so one round adds only one flight.
            val previous = cost.copyOf()
            for ((from, to, price) in flights) {
                if (previous[from] == unreachable) continue
                cost[to] = minOf(cost[to], previous[from] + price)
            }
        }

        return if (cost[dst] == unreachable) -1 else cost[dst]
    }
}
