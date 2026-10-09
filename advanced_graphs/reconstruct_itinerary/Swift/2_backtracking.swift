class Solution {
    func findItinerary(_ tickets: [[String]]) -> [String] {
        var graph: [String: [String]] = [:]
        for ticket in tickets {
            graph[ticket[0], default: []].append(ticket[1])
        }
        graph = graph.mapValues { $0.sorted() } // smallest first

        var route = ["JFK"]
        let total = tickets.count + 1

        func dfs(_ current: String) -> Bool {
            if route.count == total { return true }
            let count = graph[current]?.count ?? 0
            for i in 0..<count {
                let next = graph[current, default: []].remove(at: i) // use this ticket
                route.append(next)
                if dfs(next) { return true }
                route.removeLast() // undo and try the next option
                graph[current, default: []].insert(next, at: i)
            }
            return false
        }

        _ = dfs("JFK")
        return route
    }
}
