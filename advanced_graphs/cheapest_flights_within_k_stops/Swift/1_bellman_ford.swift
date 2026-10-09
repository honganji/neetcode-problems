class Solution {
    func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ k: Int) -> Int {
        let unreachable = Int.max
        var cost = [Int](repeating: unreachable, count: n)
        cost[src] = 0

        // k stops means at most k + 1 flights, so run k + 1 rounds.
        for _ in 0...k {
            // Read from the costs of the previous round so one round adds only one flight.
            let previous = cost
            for flight in flights {
                let from = flight[0], to = flight[1], price = flight[2]
                guard previous[from] != unreachable else { continue }
                cost[to] = min(cost[to], previous[from] + price)
            }
        }

        return cost[dst] == unreachable ? -1 : cost[dst]
    }
}
