class Solution {
    func findItinerary(_ tickets: [[String]]) -> [String] {
        var best: [String]? = nil
        var used = Array(repeating: false, count: tickets.count)
        var order: [Int] = []

        // Builds every order of the tickets and checks each one.
        func tryOrders() {
            if order.count == tickets.count {
                var path = ["JFK"]
                for i in order {
                    if tickets[i][0] != path[path.count - 1] { return } // doesn't continue the trip
                    path.append(tickets[i][1])
                }
                if best == nil || path.lexicographicallyPrecedes(best!) { best = path }
                return
            }
            for i in tickets.indices where !used[i] {
                used[i] = true
                order.append(i)
                tryOrders()
                order.removeLast()
                used[i] = false
            }
        }

        tryOrders()
        return best ?? []
    }
}
