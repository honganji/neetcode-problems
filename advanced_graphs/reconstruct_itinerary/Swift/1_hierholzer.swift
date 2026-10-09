class Solution {
    func findItinerary(_ tickets: [[String]]) -> [String] {
        // Destinations sorted in reverse, so popLast() gives the smallest one.
        var graph: [String: [String]] = [:]
        for ticket in tickets {
            graph[ticket[0], default: []].append(ticket[1])
        }
        graph = graph.mapValues { $0.sorted(by: >) }

        var stack = ["JFK"]
        var route: [String] = []
        while let current = stack.last {
            if let next = graph[current]?.popLast() {
                stack.append(next) // take the smallest unused ticket
            } else {
                route.append(stack.removeLast()) // stuck: this airport goes at the end
            }
        }
        return Array(route.reversed())
    }
}
