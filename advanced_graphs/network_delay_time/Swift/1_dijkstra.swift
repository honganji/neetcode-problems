class Solution {
    func networkDelayTime(_ times: [[Int]], _ n: Int, _ k: Int) -> Int {
        var graph = [[(Int, Int)]](repeating: [], count: n + 1)
        for t in times {
            graph[t[0]].append((t[1], t[2]))  // (to, weight)
        }

        let inf = Int.max / 2
        var dist = [Int](repeating: inf, count: n + 1)
        dist[k] = 0

        // Min-heap of (time, node), smallest time first.
        var heap = MinHeap()
        heap.push((0, k))

        while let top = heap.pop() {
            let (d, u) = top
            if d > dist[u] { continue }  // stale entry

            for (v, w) in graph[u] where d + w < dist[v] {
                dist[v] = d + w
                heap.push((dist[v], v))
            }
        }

        let answer = dist[1...].max()!
        return answer == inf ? -1 : answer
    }
}

struct MinHeap {
    private var items: [(Int, Int)] = []

    mutating func push(_ item: (Int, Int)) {
        items.append(item)
        var i = items.count - 1
        while i > 0 {
            let parent = (i - 1) / 2
            if items[parent].0 <= items[i].0 { break }
            items.swapAt(parent, i)
            i = parent
        }
    }

    mutating func pop() -> (Int, Int)? {
        guard !items.isEmpty else { return nil }
        items.swapAt(0, items.count - 1)
        let top = items.removeLast()
        var i = 0
        while true {
            let left = 2 * i + 1
            let right = left + 1
            var smallest = i
            if left < items.count && items[left].0 < items[smallest].0 { smallest = left }
            if right < items.count && items[right].0 < items[smallest].0 { smallest = right }
            if smallest == i { break }
            items.swapAt(i, smallest)
            i = smallest
        }
        return top
    }
}
