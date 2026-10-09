class Solution {
    func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ k: Int) -> Int {
        var graph = [[(to: Int, price: Int)]](repeating: [], count: n)
        for flight in flights {
            graph[flight[0]].append((to: flight[1], price: flight[2]))
        }

        var best = Int.max

        func dfs(_ city: Int, _ cost: Int, _ flightsLeft: Int) {
            if city == dst {
                best = min(best, cost)
                return
            }
            if flightsLeft == 0 { return }

            for edge in graph[city] {
                // Prices are never negative, so a path already too expensive can't get cheaper.
                if cost + edge.price < best {
                    dfs(edge.to, cost + edge.price, flightsLeft - 1)
                }
            }
        }

        dfs(src, 0, k + 1)
        return best == Int.max ? -1 : best
    }
}
