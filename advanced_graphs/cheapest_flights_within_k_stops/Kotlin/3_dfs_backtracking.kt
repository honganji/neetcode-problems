class Solution {
    fun findCheapestPrice(n: Int, flights: Array<IntArray>, src: Int, dst: Int, k: Int): Int {
        val graph = Array(n) { mutableListOf<IntArray>() }
        for ((from, to, price) in flights) {
            graph[from].add(intArrayOf(to, price))
        }

        var best = Int.MAX_VALUE

        fun dfs(city: Int, cost: Int, flightsLeft: Int) {
            if (city == dst) {
                best = minOf(best, cost)
                return
            }
            if (flightsLeft == 0) return

            for ((to, price) in graph[city]) {
                // Prices are never negative, so a path already too expensive can't get cheaper.
                if (cost + price < best) dfs(to, cost + price, flightsLeft - 1)
            }
        }

        dfs(src, 0, k + 1)
        return if (best == Int.MAX_VALUE) -1 else best
    }
}
