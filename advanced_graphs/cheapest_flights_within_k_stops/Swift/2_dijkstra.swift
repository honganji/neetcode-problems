struct State {
    let cost: Int
    let city: Int
    let used: Int
}

// Minimal binary min-heap ordered by cost.
struct MinHeap {
    private var items: [State] = []

    var isEmpty: Bool { items.isEmpty }

    mutating func push(_ item: State) {
        items.append(item)
        var i = items.count - 1
        while i > 0 {
            let parent = (i - 1) / 2
            if items[parent].cost <= items[i].cost { break }
            items.swapAt(parent, i)
            i = parent
        }
    }

    mutating func pop() -> State? {
        guard !items.isEmpty else { return nil }
        items.swapAt(0, items.count - 1)
        let top = items.removeLast()
        var i = 0
        while true {
            let left = 2 * i + 1, right = left + 1
            var smallest = i
            if left < items.count && items[left].cost < items[smallest].cost {
                smallest = left
            }
            if right < items.count && items[right].cost < items[smallest].cost {
                smallest = right
            }
            if smallest == i { break }
            items.swapAt(i, smallest)
            i = smallest
        }
        return top
    }
}

class Solution {
    func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ k: Int) -> Int {
        let unreachable = Int.max
        var graph = [[(to: Int, price: Int)]](repeating: [], count: n)
        for flight in flights {
            graph[flight[0]].append((to: flight[1], price: flight[2]))
        }

        var heap = MinHeap()
        heap.push(State(cost: 0, city: src, used: 0))

        // Track flights used too, so a cheap route with too many stops
        // does not hide a pricier route that is still allowed.
        // bestCost[city][used] = cheapest known cost to reach city with exactly `used` flights.
        var bestCost = [[Int]](repeating: [Int](repeating: unreachable, count: k + 2), count: n)
        bestCost[src][0] = 0

        while let current = heap.pop() {
            if current.city == dst { return current.cost }
            if current.used == k + 1 { continue }

            for edge in graph[current.city] {
                let newCost = current.cost + edge.price
                if newCost < bestCost[edge.to][current.used + 1] {
                    bestCost[edge.to][current.used + 1] = newCost
                    heap.push(State(cost: newCost, city: edge.to, used: current.used + 1))
                }
            }
        }

        return -1
    }
}
